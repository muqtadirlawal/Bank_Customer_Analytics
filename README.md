# Customer Analytics: Leveraging SQL and Power BI to Identify Former Student Customers for Targeted Service Offerings and Upselling Opportunities

## Table of Contents

- [Business Introduction](#business-introduction)
- [Business Problem](#business-problem)
- [Rationale for the Project](#rationale-for-the-project)
- [Aim of the Project](#aim-of-the-project)
- [Data Description](#data-description)
- [Tech Stack](#tech-stack)
- [Project Scope](#project-scope)
- [Insights and Recommendations](#insights-and-recommendations)

## Business Introduction
NovaTrust Bank is a full-service financial institution offering banking solutions to individuals and businesses. The bank provides core products like checking and savings accounts, loans, credit and debit cards, and investment services, with a strong focus on digital banking through advanced online and mobile platforms.

Committed to customer satisfaction, NovaTrust offers 24/7 support while leveraging digital solutions to enhance user experience and streamline operations. 

## Business Problem
NovaTrust Bank aims to address a critical opportunity within its student customer segment as follows:
- Target Segment: Many customers who opened student accounts during college continue to use these accounts post-graduation, even after joining the workforce.
- Missed Opportunities: These customers often remain unaware of NovaTrust’s specialized products and services tailored for working professionals.
- Strategic Goal: The bank seeks to identify former student account holders who:
  - are now employed and receiving regular salary deposits.
  - have seen at least 10 salary deposits in the past year.
  - earn average monthly salaries exceeding 200,000 naira.

By focusing on this segment, NovaTrust aims to offer curated service offerings such as tailored loan opportunities and account upgrades, ensuring these customers receive solutions aligned with their evolving financial needs.

## Rationale for the Project
Recognizing the lifetime value of its customers, NovaTrust Bank understands that upselling and cross-selling to existing customers is significantly more cost-effective than acquiring new ones. With an established trust and banking history, these relationships provide a strong foundation for enhancing financial experiences.

By identifying former student account holders who have transitioned into the workforce, the bank can leverage data to craft targeted campaigns. These efforts will introduce customers to services that match their current financial needs, such as home loans, tailored investment advisories, and other advanced financial solutions. This approach not only strengthens customer loyalty but also maximizes the value derived from long-term relationships.

## Aim of the Project
The primary goal of this project is to identify and segment NovaTrust Bank's former student customers who are transitioning into the workforce and are likely to benefit from the bank’s tailored products and services for working professionals. This will enable the creation of targeted marketing campaigns to introduce these customers to offerings such as credit cards, personal loans, and investment accounts.

Tasks for the Analyst
- Identify all accounts opened as student accounts with consistent salary inflows over the past year.
- Segment these customers into categories based on salary amount and frequency of salary deposits within the last year.
- Provide actionable insights to NovaTrust Bank’s marketing team to design targeted campaigns for engaging these customer segments effectively.

## Data Description
The data for this project comprises of 2  tables;

- Customer Table

  - CustomerID: Unique identifier for each customer.
  - FirstName: First name of the customer.
  - LastName: Last name of the customer.
  - DateOfBirth: Date of birth of the customer.
  - Contact_Email: Email address.
  - Phone: Phone number.
  - Account_Type: Type of account (e.g, savings, current).
  - Account_Open_Date: Date when the account was opened.
  - Account Number (PK): Unique customer account number.
  - Employment Status: Employment status as at when account was opened.

- Transactions Table

  - TransactionID (PK): Unique identifier for each transaction.
  - Account Number(FK): Refers to the account number in the Customers table.
  - Transaction_Date: Date of the transaction.
  - Transaction_Type: Type of transaction (credit or debit).
  - Transaction_Amount: Amount involved in the transaction.
  - TransDescription: Description or label of the transaction.

## Tech Stack
Tool – Microsoft Excel
- Utilized for creating the interactive dashboard, data visualization, and automated ad-hoc report generation using office scripts.
- Data Processing Tools: Leveraging Excel's data manipulation and analysis functions.
- Visualization Tools: Employing Excel's charts, graphs, and pivot tables for order and delivery data visualization.

## Project Scope
1. Data Preprocessing and Exploratory Analysis
   - Rigorous data formatting and preparation
   - Identify patterns, correlations, and potential data anomalies
   - Address any data quality issues

2. Data Augmentation
   - Enrich the original dataset with additional relevant information
   - Prepare data to comprehensively answer business questions

3. Data Visualization and Dashboard Design
   - Create visual representations of key insights
   - Develop an interactive Excel dashboard with intuitive data visualization components
   - Effectively communicate findings through clear and compelling visuals

4. Automated Reporting
   - Create Office Scripts to automate ad-hoc report generation
   - Develop scripts to calculate and track important business metrics
   - Ensure consistent and efficient metric tracking

5. Interpretation and Recommendations
   - Extract meaningful insights from the analyzed data
   - Develop comprehensive documentation
   - Provide actionable recommendations based on the analysis

## Insights and Recommendations
![](Overview.png)


You can view and interact with the dashboard [here](https://hullacuk-my.sharepoint.com/personal/m_o_lawal-2021_hull_ac_uk/_layouts/15/Doc.aspx?sourcedoc={300767bd-d123-4785-a64f-f61272b175a4}&action=embedview&AllowTyping=True&ActiveCell='Dashboard'!A1&wdHideGridlines=True&wdHideHeaders=True&wdInConfigurator=True&wdInConfigurator=True)

## Delivery Performance Analysis: Key Insights and Strategic Recommendations
Our comprehensive analysis of delivery operations reveals critical opportunities for operational enhancement and customer experience improvement.

## Key Insights

1. Order Backlog Management: We identified a substantial operational challenge: 51% of orders (767 out of 1,500) remain unprocessed. This significant backlog poses immediate risks to customer satisfaction and operational efficiency.

2. Performance Metrics

   - Average Delivery Delay: 15.51 minutes
   - Drivers with Highest Delay Variance: D86, D44, and D29
   - Most Challenging Routes: Route 3, Route 1, and Route 2

3. Nuanced Performance Observations: Interestingly, the data reveals counterintuitive patterns:

   - Positive feedback orders show slightly higher delay times
   - Bike C consistently experiences marginally longer delivery times compared to Van A
   - Expedited allocation rules unexpectedly demonstrate less efficiency than standard methods

## Strategic Recommendations
1. Operational Optimization

   - Implement immediate resource reallocation to address existing order backlog
   - Conduct targeted driver performance training
   - Develop route optimization strategies focusing on high-delay routes

2. Allocation and Resource Strategy

   - Critically review current allocation rules, particularly Expedited Rules
   - Reassess vehicle allocation, potentially reducing Bike C deployments
   - Develop a more dynamic resource deployment model

3. Customer Experience Enhancement

   - Establish proactive communication protocols for managing customer expectations
   - Create transparent tracking mechanisms for orders with potential delays
   - Develop personalized communication strategies based on order type and customer segment

## Next Steps
Our recommendation is to initiate a phased implementation approach:
- Immediate (0-30 days): Backlog reduction and communication improvements
- Short-term (30-90 days): Driver training and route optimization
- Medium-term (90-180 days): Comprehensive allocation rule and vehicle fleet review

By systematically addressing these insights, we anticipate significant improvements in operational efficiency, customer satisfaction, and overall delivery performance.
