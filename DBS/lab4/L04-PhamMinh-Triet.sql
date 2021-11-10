-- ***********************
-- Name: PHAM MINH TRIET
-- ID: 157930199
-- Date: 11/10
-- Purpose: Lab 4 DBS311
-- ***********************
-- Question 1 – Display cities that no warehouse is located in them. (use set operators to answer this question

-- Q1 Solution –

SELECT city
FROM locations
WHERE location_id in
    (SELECT location_id
     FROM locations 
     MINUS 
     SELECT location_id
     FROM warehouses)
ORDER BY city;
-- Question 2 –Display the category ID, category name, and the number of products in category 1, 2, and 5. In your result, display first the number of products in category 5, then category 1 and then 2.
-- Q2 Solution –

SELECT product_categories.category_id,
       product_categories.category_name,
       COUNT(*)
FROM product_categories
LEFT JOIN products ON product_categories.category_id = products .category_id
WHERE products.category_id = 5
GROUP BY product_categories.category_id,
         product_categories.category_name
UNION ALL
SELECT product_categories.category_id,
       product_categories.category_name,
       COUNT(product_id)
FROM product_categories
LEFT JOIN products ON product_categories.category_id = products.category_id
WHERE products.category_id = 1
GROUP BY product_categories.category_id,
         product_categories.category_name
UNION ALL
SELECT product_categories.category_id,
       product_categories.category_name,
       COUNT(product_id)
FROM product_categories
LEFT JOIN products ON product_categories.category_id = products.category_id
WHERE products.category_id = 2
GROUP BY product_categories.category_id,
         product_categories.category_name;
-- Question 3 –--Display product ID for products whose quantity in the inventory is less than to 5. (You 
--are not allowed to use JOIN for this question
-- Q3 Solution –

SELECT product_id
FROM order_items
WHERE quantity < 5
UNION
SELECT product_id
FROM inventories
WHERE quantity < 5;

-- Question 4 –We need a single report to display all warehouses and the state that they are located in 
--and all states regardless of whether they have warehouses in them or not. (Use set 
--operators in you answer
-- Q4 Solution –

  SELECT warehouses.warehouse_name,
         locations.state
  FROM warehouses
  LEFT JOIN locations ON warehouses.location_id = locations.location_id
UNION
SELECT warehouses.warehouse_name,
       locations.state
FROM warehouses
RIGHT OUTER JOIN locations ON locations.location_id = warehouses.location_id