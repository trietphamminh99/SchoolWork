-- ***********************
-- Name: Pham Minh Triet
-- ID:157930199
-- Date: 24/9
-- Purpose: Lab 2 DBS311
-- ***********************
-- Question 1 –  For each job title display the number of employees. Sort the result according to the number of employees.

/*-- Q1 SOLUTION --*/
SELECT
  job_title,
  COUNT(*) AS "EMPLOYEES" 
FROM
  employees 
GROUP BY
  job_title 
ORDER BY
  COUNT(*);
  
  
  -- Question 2 – Display the highest, lowest, and average customer credit limits. Name these results high, 
low, and average. Add a column that shows the difference between the highest and the
lowest credit limits named “High and Low Difference”. Round the average to 2 decimal 
places.

/*-- Q2 SOLUTION --*/
SELECT
  MAX(credit_limit) AS "HIGH",
  MIN(credit_limit) AS "LOW",
  round(AVG(credit_limit) , 2) AS "AVERAGE",
  MAX(credit_limit) - MIN(credit_limit) AS "High Low Difference" 
FROM
  customers;
   -- Question 3 –
/*Display the order id, the total number of products, and the total order amount for orders 
with the total amount over $1,000,000. Sort the result based on total amount from the high 
to low values.*/

/*-- Q3 SOLUTION --*/
SELECT
  order_id,
  SUM(quantity) AS "TOTAL_ITEMS",
  SUM(unit_price*quantity) AS "TOTAL_AMOUNT" 
FROM
  order_items 
GROUP BY
  order_id 
ORDER BY
  SUM(unit_price*quantity) DESC;
  
   -- Question 4 –
   /*Display the warehouse id, warehouse name, and the total number of products for each 
warehouse. Sort the result according to the warehouse ID.*/
/*-- Q4 SOLUTION --*/
SELECT
  warehouses.warehouse_id,
  warehouses.warehouse_name,
  SUM(inventories.quantity) 
FROM
  warehouses 
  LEFT JOIN
    inventories 
    ON inventories.warehouse_id = warehouses.warehouse_id 
GROUP BY
  warehouses.warehouse_id,
  warehouses.warehouse_name 
ORDER BY
  warehouses.warehouse_ID;
   -- Question 5 –
  /* For each customer display customer number, customer full name, and the total number of 
orders issued by the customer.
? If the customer does not have any orders, the result shows 0.
? Display only customers whose customer name starts with ‘O’ and contains ‘e’.
? Include also customers whose customer name ends with ‘t’.
? Show the customers with highest number of orders first.*/

/*-- Q5 SOLUTION --*/
SELECT
  customers.customer_id,
  customers.name,
  COUNT(orders.customer_id) AS "total number OF orders" 
FROM
  customers 
  LEFT JOIN
    orders 
    ON customers.customer_id = orders.customer_id 
WHERE
  customers.name LIKE '%t' 
  OR 
  (
    customers.name LIKE 'O%' 
    AND customers.name LIKE '%e%'
  )
GROUP BY
  customers.customer_id,
  customers.name 
ORDER BY
  "total number OF orders" DESC
   -- Question 6 –
   /*Write a SQL query to show the total and the average sale amount for each category. Round
the average to 2 decimal places.*/
  /*-- Q6 SOLUTION --*/
  SELECT
    products.category_id,
    SUM(ORDER_ITEMS.unit_price*ORDER_ITEMS.quantity) AS "TOTAL_AMOUNT",
    round(AVG( ORDER_ITEMS.unit_price*ORDER_ITEMS.quantity) , 2) AS "AVERRAGE_AMOUNT" 
  FROM
    products 
    LEFT JOIN
      ORDER_ITEMS 
      ON ORDER_ITEMS.product_id = products.product_id 
  GROUP BY
    products.category_id 		
    