----------------- Review the table----------------------------------------------------

SELECT* 
FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3` LIMIT 1000

----Question 1:(WHERE CLAUSE) Filter all transactions that occurred in the year 2023 (WHERE CLAUSE) Filter all transactions that occurred in the year 2023

SELECT*
FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`
WHERE Date BETWEEN '2023-01-01' AND '2023-12-31';

---- Question 2:Filtering + Conditions
---Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.

 SELECT AVG (`Total Amount`) AS TotalAmount,
       `Total Amount`
FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`
GROUP BY `Total Amount`;

----Question 3:Calculate the total revenue (sum of Total Amount)

SELECT
  SUM(`Total Amount`) AS total_revenue
  FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`

----Question 4:Display all distinct Product Categories in the dataset. 

  SELECT 
  DISTINCT(`Product Category`)
  FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`

  ----Question 5:For each Product Category, calculate the total quantity sold.

 SELECT `Product Category`,
  SUM(Quantity) AS `total_quantity_sold`
FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`
GROUP BY `Product Category`
ORDER BY `total_quantity_sold` DESC;

----Question 6: Create a column called Age_Group that classifies customers as: –  'Youth'(<30) 

SELECT `Customer ID`, Age,
CASE 
WHEN Age <30 THEN 'Youth'
WHEN Age BETWEEN 30 and 59 THEN 'Adult'
WHEN Age>= 60 THEN'Senior'
END AS `Age Group`
FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`

SELECT 'Customer ID', Age,
CASE 
  WHEN Age <30 THEN 'Youth'
  WHEN Age BETWEEN 30 AND 59 THEN 'Adult' 
  ELSE 'Senior'
  END AS Age_Group
FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`


----Question:7 For each Gender, count how many high-value transactions occurred (where Total Amount > 500).

SELECT Gender,COUNT('Transaction ID') AS High_Value_Transactions
FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`
WHERE `Total Amount` >500
GROUP BY Gender;

----Question 8: For each Product Category, show only those categories where the total revenue exceeds 5,000.

SELECT Product Category, 
SUM (Total Amount) AS Total_Revenue 
FROM retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3
GROUP BY Product Category 
HAVING SUM(Total Amount)> 5000;


-----Question 9:Display a new column called Unit_Cost_Category that labels a transaction as:

SELECT `Transaction ID`, `Price per unit`,
CASE
  WHEN `Price per Unit`< 50 THEN 'Cheap'
   WHEN `Price per Unit`BETWEEN 50 AND 200 THEN 'Moderate'
   WHEN `Price per Unit`> 200 THEN 'Cheap' 
   END AS `Cost Category`
   FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`


   ----Question 10: Display all transactions from customers aged 40 or older and add a column Spending_Level showing: 

   SELECT `Customer ID`, Age, `Total Amount`,
CASE
  WHEN `Total Amount` >1000 THEN 'High'
  ELSE 'Low'
  END AS Spending_Level
  FROM `retail-sales-practical-3.Retail_Sales_3.Retail dataset_Practical 3`
  WHERE Age >=40;
