
-- EXPLORATORY DATA ANALYSIS

-- Explore the Customers Table
SELECT COUNT(Account_Number) AS Count
FROM [dbo].[Customers];

-- Check for NULL Values - No missing values in the data
SELECT *
FROM 
	[dbo].[Customers] c
WHERE
	c.Account_Number IS NULL
	OR c.Account_Open_Date IS NULL
	OR c.Account_Type IS NULL
	OR c.Contact_Email IS NULL
	OR c.Contact_Phone IS NULL
	OR c.CustomerID IS NULL
	OR c.DateOfBirth IS NULL
	OR c.Employment_Status IS NULL
	OR c.FirstName IS NULL
	OR c.LastName IS NULL;

-- Check for Duplicate values - No duplicates in the data
SELECT
	Account_Number, CustomerID, Contact_Email, COUNT(*) AS Counts
FROM 
	[dbo].[Customers]
GROUP BY
	Account_Number, CustomerID, Contact_Email
HAVING
	COUNT(*) > 1;

-- Check for Duplicate Account Numbers - No Duplicate Account Numbers
SELECT
	Account_Number, COUNT(*) AS Counts
FROM 
	[dbo].[Customers]
GROUP BY
	Account_Number
HAVING
	COUNT(*) > 1;

-- Check Employment Status - Customers are either 'employed' or 'student'
SELECT
	DISTINCT Employment_Status
FROM 
	[dbo].[Customers];

-- Check the Number of Employed & Student Customers - 2,987 are employed while 7,013 are students as at the time of opening their account
SELECT
	Employment_Status, COUNT(*)
FROM 
	[dbo].[Customers]
GROUP BY
	Employment_Status;

-- Explore Transaction Table
SELECT
	TOP (10) *
FROM [dbo].[transaction];

-- Most recent transaction date in our data - 2023-09-29 i.e September 29, 2023.
SELECT
	MAX(TransactionDate) AS MostRecentDate
FROM
	[dbo].[transaction];

-- Oldest transaction date in the data - 2021-01-23 i.e January 23, 2021.
SELECT
	MIN(TransactionDate) AS OldestDate
FROM
	[dbo].[transaction];

-- Most Recent & Oldest in one query - Transactions are between Jan 23, 2021 & Sep 29, 2023.
SELECT
	MIN(TransactionDate) AS OldestDate,
	MAX(TransactionDate) AS MostRecentDate
FROM
	[dbo].[transaction];

-- Minumum and Maximum transaction amount in the data - Ranges between 50 & 699,885
SELECT
	MIN(Transaction_Amount) AS MinTransaction,
	MAX(Transaction_Amount) AS MaxTransaction
FROM
	[dbo].[transaction];

-- Distribution Transaction types - More Credt transactions (157,667) than Debits (125,374)
SELECT
	TransactionType, COUNT(*)
FROM
	[dbo].[transaction]
GROUP BY
	TransactionType;

