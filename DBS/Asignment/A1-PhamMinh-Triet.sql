-- ***********************
-- Student Name: PHAM MINH TRIET
-- Student1 ID: 157930199
-- Date: The date of assignment completion
-- Purpose: Assignment 1 - DBS311
-- ***********************
-- Question 1 –- Display the employee number, full employee name, job title, and hire date of all 
--employees hired in September with the most recently hired employees displayed 
--first
-- Q1 SOLUTION --

SELECT
   employee_id AS "Employee Number",
   first_name || ', ' || last_name AS "Fullname",
   job_title AS "Job Title",
   to_char(hire_date, '[' || 'month' || ' ' || 'dd') || 'th of ' || to_char(hire_date, 'yyyy' || ']') AS "Start Date" 
FROM
   employees 
WHERE
   to_char(hire_date, 'MON') = 'SEP' 
ORDER BY
   hire_date DESC;
-- Question 2 –-The company wants to see the total sale amount per sales person (salesman) for all 
--orders. Assume that online orders do not have any sales representative. For online 
--orders (orders with no salesman ID), consider the salesman ID as 0. Display the 
--salesman ID and the total sale amount for each employee. 
--Sort the result according to employee number
-- Q2 SOLUTION --
SELECT
   NVL(orders.salesman_id, 0) AS "Employees Number",
   to_char((SUM(order_items.unit_price*order_items.quantity)), '$999,999,999.99') AS "Total Sale" 
FROM
   order_items 
   LEFT JOIN
      orders 
      ON orders.order_id = order_items.order_id 
GROUP BY
   orders.salesman_id 
ORDER BY
   "Employees Number" ;
-- Question 3 –-Display customer Id, customer name and total number of orders for customers that 
--the value of their customer ID is in values from 35 to 45. Include the customers with 
--no orders in your report if their customer ID falls in the range 35 and 45. 
--Sort the result by the value of total orders.
-- Q3 SOLUTION --
SELECT
   customers.customer_id AS "Customer Id",
   customers.name AS "Name",
   COUNT(orders.customer_id) AS "Total Orders" 
FROM
   customers 
   LEFT JOIN
      orders 
      ON customers.customer_id = orders.customer_id 
WHERE
   customers.customer_id BETWEEN 35 AND 45 
GROUP BY
   customers.customer_id,
   customers.name 
ORDER BY
   "Total Orders" ;
   
-- Question 4 –-Display customer ID, customer name, and the order ID and the order date of all 
--orders for customer whose ID is 44.
--a. Show also the total quantity and the total amount of each customer’s order.
--b. Sort the result from the highest to lowest total order amount 
-- Q4 SOLUTION --
SELECT
   customers.customer_id AS "Customer Id",
   customers.name AS "Name",
   orders.order_id AS "ORDER Id",
   orders.order_date AS "ORDER DATE",
   SUM(order_items.quantity) AS "Total Items",
   to_char((SUM(order_items.unit_price*order_items.quantity)), '$999,999,999.99') AS "Total Amount" 
FROM
   (
( orders 
      INNER JOIN
         customers 
         ON customers.customer_id = orders.customer_id) 
      INNER JOIN
         order_items 
         ON order_items.order_id = orders.order_id 
   )
WHERE
   customers.customer_id = '44' 
GROUP BY
   customers.customer_id,
   customers.name,
   orders.order_id,
   orders.order_date 
ORDER BY
   "Total Amount" DESC;
-- Question 5 –-Display customer Id, name, total number of orders, the total number of items 
--ordered, and the total order amount for customers who have more than 30 orders. 
--Sort the result based on the total number of orders.

-- Q5 SOLUTION --

SELECT
   customers.customer_id AS "Customer Id",
   customers.name AS "Name",
   COUNT( orders.order_id) AS "Total Number OF Orders",
   SUM(order_items.quantity) AS "Total Items",
   to_char((SUM(order_items.unit_price*order_items.quantity)), '$999,999,999.99') AS "Total Amount" 
FROM
   customers 
   JOIN
      orders 
      ON customers.customer_id = orders.customer_id 
   JOIN
      order_items 
      ON order_items.order_id = orders.order_id 
GROUP BY
   customers.customer_id,
   customers.name 
HAVING
   COUNT( orders.order_id) > 30
ORDER BY 
    COUNT( orders.order_id);
   
   -- Question 6 –-Display Warehouse Id, warehouse name, product category Id, product category 
--name, and the lowest product standard cost for this combination.
--• In your result, include the rows that the lowest standard cost is less then $200.
--• Also, include the rows that the lowest cost is more than $500.
--• Sort the output according to Warehouse Id, warehouse name and then product 
--category Id, and product category name.
-- Q6 SOLUTION --
SELECT
   warehouses.warehouse_id as "Warehouse ID",
   warehouses.warehouse_name as "Warehouse Name",
   products.category_id as "Category ID",
   product_categories.category_name as "Category Name",
   to_char(MIN(products.standard_cost),'$999,999,999.99') as "Lowest Cost"  
FROM
   products 
   JOIN
      inventories 
      ON inventories.product_id = products.product_id 
   JOIN
      product_categories 
      ON product_categories.category_id = products.category_id 
   LEFT JOIN
      warehouses 
      ON inventories.warehouse_id = warehouses.warehouse_id 
GROUP BY
   warehouses.warehouse_id,
   warehouses.warehouse_name,
   products.category_id,
   product_categories.category_name 
HAVING
   MIN(products.standard_cost) NOT BETWEEN 200 AND 500 
ORDER BY
   warehouses.warehouse_id,
   warehouses.warehouse_name,
   products.category_id,
   product_categories.category_name;
   
 -- Question 7 –-Display the total number of orders per month. Sort the result from January to December
-- Q7 SOLUTION --
SELECT
   to_char(to_date(the_month, 'MM'), 'Month') AS "MONTH",
   counts AS "number OF orders" 
FROM
   (
SELECT
EXTRACT(MONTH 
FROM
 order_date) AS the_month,
 COUNT(*) AS counts 
 FROM
 orders 
GROUP BY
  EXTRACT(MONTH 
FROM
order_date) 
   )
   sales 
ORDER BY
   the_month;
 -- Question 8 –-
 --Display product Id, product name for products that their list price is more than any 
--highest product standard cost per warehouse outside Americas regions.
--(You need to find the highest standard cost for each warehouse that is located 
--outside the Americas regions. Then you need to return all products that their list 
--price is higher than any highest standard cost of those warehouses.)
--Sort the result according to list price from highest value to the lowest.
-- Q8 SOLUTION --
SELECT
   product_id AS "Product ID ",
   product_name AS "Product Name",
   to_char(list_price, '$999,999,999.99') AS "Price" 
FROM
   products 
WHERE
   list_price > ANY ( 
   SELECT
      MAX(products.standard_cost) 
   FROM
      products 
      JOIN
         inventories 
         ON inventories.product_id = products.product_id 
      JOIN
         warehouses 
         ON inventories.warehouse_id = warehouses.warehouse_id 
      JOIN
         locations 
         ON warehouses.location_id = locations.location_id 
      JOIN
         countries 
         ON countries.country_id = locations.country_id 
   WHERE
      country_name != 'America' 
   GROUP BY
      warehouses.warehouse_id ) 
   ORDER BY
      "Price" DESC 	;
       -- Question 9 –-Write a SQL statement to display the most expensive and the cheapest product (list 
--      price). Display product ID, product name, and the list price.

      -- Q9 SOLUTION --
      SELECT
         product_id AS "Product ID",
         product_name AS "Product Name",
         to_char(list_price, '$999,999,999.99') AS "Price" 
      FROM
         products 
      WHERE
         list_price = 
         (
            SELECT
               MAX(list_price) 
            FROM
               products
         )
      UNION
      SELECT
         product_id AS "Product ID",
         product_name AS "Product Name",
         to_char(list_price, '$999,999,999.99') AS "Price" 
      FROM
         products 
      WHERE
         list_price = 
         (
            SELECT
               MIN(list_price) 
            FROM
               products
         )
;
 -- Question 10 –-Write a SQL query to display the number of customers with total order amount over 
--the average amount of all orders, the number of customers with total order amount 
--under the average amount of all orders, number of customers with no orders, and 
--the total number of customers.
--See the format of the following result.
-- Q10 SOLUTION --
(
SELECT
   'Number of customers with total purchase amount over average: ' || COUNT(*) AS "Customer report" 
FROM
   (
      SELECT
         customers.customer_id,
         SUM(order_items.quantity * order_items.unit_price) AS "total" 
      FROM
         order_items 
         LEFT JOIN
            orders 
            ON orders.order_id = order_items.order_id 
         LEFT JOIN
            customers 
            ON orders.customer_id = customers.customer_id 
      GROUP BY
         customers.customer_id 
   )
WHERE
   "total" > (
   SELECT
      AVG(quantity * unit_price) 
   FROM
      order_items) ) 
   UNION ALL
(
   SELECT
      'Number of customers with total purchase amount below average: ' || COUNT(*) 
   FROM
      (
         SELECT
            customers.customer_id,
            SUM(order_items.quantity * order_items.unit_price) AS "total" 
         FROM
            order_items 
            LEFT JOIN
               orders 
               ON orders.order_id = order_items.order_id 
            LEFT JOIN
               customers 
               ON orders.customer_id = customers.customer_id 
         GROUP BY
            customers.customer_id 
      )
   WHERE
      "total" < (
      SELECT
         AVG(quantity * unit_price) 
      FROM
         order_items) ) 
      UNION ALL
( 
      SELECT
         'Number of customers with no orders: ' || COUNT(*) 
      FROM
         (
            SELECT
               customer_id 
            FROM
               customers minus 
               SELECT
                  customer_id 
               FROM
                  orders
         )
) 
      UNION ALL
      SELECT
         'Total number of customers: ' || COUNT(*) 
      FROM
         (
            SELECT
               customer_id 
            FROM
               customers
         )