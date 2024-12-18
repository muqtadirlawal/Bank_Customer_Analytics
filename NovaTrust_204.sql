-- CREATE STORED PROCEDURES

CREATE PROCEDURE GetCustomerSegment_2
	@EmploymentStatus NVARCHAR(50),
	@DateCriteria DATE,
	@TransDescription NVARCHAR(50)
AS

WITH Salaries AS (
    -- Filter salary-related transactions for student customers
    SELECT
        c.Account_Number,              
        t.TransactionID,              
        t.TransactionDate,            
        t.Transaction_Amount,  
        t.TransactionType,             
        t.TransDescription             
    FROM 
        [dbo].[Customers] AS c 
    INNER JOIN 
        [dbo].[transaction] AS t      
    ON
        c.Account_Number = t.AccountNumber 
    WHERE 
        c.Employment_Status = 'student'   -- Include only students
        AND LOWER(t.TransDescription) LIKE '%salary%' -- Filter for salary-related transactions
        AND t.TransactionDate >= DATEADD(MONTH, -12, '2023-08-31') -- Only transactions in the last 12 months
        AND t.TransactionType = 'Credit'  -- Include only credit inflows
),

RFM AS (
    -- Calculate Recency, Frequency, and Monetary Value for each account
    SELECT
        Account_Number,                  
        MAX(TransactionDate) AS LastTransactionDate, -- Most recent salary transaction date
        DATEDIFF(MONTH, MAX(TransactionDate), '2023-08-31') AS Recency, -- Months since the last transaction
        COUNT(TransactionID) AS Frequency, -- Total number of salary transactions in the period
        AVG(Transaction_Amount) AS MonetaryValue -- Average salary transaction amount
    FROM 
        Salaries
    GROUP BY
        Account_Number -- Group by account to calculate metrics per customer
    HAVING 
        AVG(Transaction_Amount) >= 200000 -- Only include accounts with average salary >= 200,000
        AND COUNT(TransactionID) >= 10    -- Include only accounts with at least 10 salary transactions
),

RFM_Scores AS (
    -- Assign scores based on Recency, Frequency, and Monetary Value thresholds
    SELECT
        Account_Number,           
        LastTransactionDate,             
        Recency,                       
        Frequency,                       
        MonetaryValue,                
        
        -- Assign Recency score
        CASE
            WHEN Recency = 0 THEN 10     -- received salary the current month
            WHEN Recency < 3 THEN 7      -- received salary 1 or 2 months ago
            WHEN Recency < 5 THEN 4      -- received salary 3 or 4 months ago
            ELSE 1                       -- received salary over 4 months ago
        END AS R_Score,
        
        -- Assign Frequency score
        CASE
            WHEN Frequency = 12 THEN 10 -- received salary every month in the last 1 yr i.e 12 months
			WHEN Frequency >= 9 THEN 7  -- recieved salary at least 9 out of 12 months (9,10,11)
			WHEN Frequency >= 6 THEN 4  -- received salary at least 6 out of 12 months (6,7,8)
			ELSE 1                      -- received less than 6 salary payments
        END AS F_Score,
        
        -- Assign Monetary Value score
        CASE
            WHEN MonetaryValue > 600000 THEN 10 -- High average salary > 600,000
            WHEN MonetaryValue > 400000 THEN 7  -- Medium high average salary (400,001 to 600,000)
            WHEN MonetaryValue BETWEEN 300000 AND 400000 THEN 4 -- Medium low salary ( 300,000 to 400,000)
            ELSE 1                       -- Low average salary (<= 300,000 but not less tham 200,000)
        END AS M_Score
    FROM
        RFM
),

Segment AS (
    -- Categorize customers into segments based on RFM scores
    SELECT
        Account_Number,           
        LastTransactionDate,            
        Recency,                        
        Frequency,                      
        MonetaryValue,                  
        
        -- Calculate normalized RFM segment score (0-1 scale)
        CAST((R_Score + F_Score + M_Score) AS FLOAT)/30 AS RFM_Segment,
        
        -- Define salary range based on Monetary Value
        CASE
            WHEN MonetaryValue > 600000 THEN 'Above 600k'  -- Very high salary range
            WHEN MonetaryValue > 400000 AND MonetaryValue <= 600000 THEN '400-600k' -- Medium high range
            WHEN MonetaryValue > 300000 AND MonetaryValue <= 400000 THEN '300-400k' -- Medium low range
            ELSE '200-300k'                 -- Low range
        END AS SalaryRange,

        -- Segment customers into tiers based on RFM segment score
        CASE
            WHEN CAST((R_Score + F_Score + M_Score) AS FLOAT)/30 >= 0.8 THEN 'Tier 1 Customer' -- Top-tier customers
            WHEN CAST((R_Score + F_Score + M_Score) AS FLOAT)/30 >= 0.6 THEN 'Tier 2 Customer' -- Second tier
            WHEN CAST((R_Score + F_Score + M_Score) AS FLOAT)/30 >= 0.5 THEN 'Tier 3 Customer' -- Third tier
            ELSE 'Tier 4 Customer'          -- Lowest tier
        END AS Customer_Segment
    FROM
        RFM_Scores
)

-- Final query to retrieve segmented customer data
SELECT
    S.Account_Number,          
    C.Contact_Email,                    
    LastTransactionDate,                 
    Recency AS MonthSinceLastSalary,     -- Months since the last salary transaction
    Frequency AS NumberSalariesReceived, -- Total number of salary transactions
    MonetaryValue AS AvgSalary,          
    SalaryRange,                         
    Customer_Segment                     -- Customer tier based on RFM score
FROM
    Segment AS S
LEFT JOIN [dbo].[Customers] AS C
ON S.Account_Number = C.Account_Number

GO

-- Call/Execute the stored procedure

EXEC GetCustomerSegment_2
	@EmploymentStatus = 'student',
	@DateCriteria = '2023-08-31',
	@TransDescription = 'salary'