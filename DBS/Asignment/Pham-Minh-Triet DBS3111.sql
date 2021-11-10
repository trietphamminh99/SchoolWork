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
select employee_id as "Employee Number",
first_name||', '|| last_name as "Fullname", 
job_title as "Job Title",
to_char(hire_date,'['||'month'||' '||'dd')||'th of '||to_char(hire_date,'yyyy'||']') as "Start Date"
from employees 
where to_char(hire_date,'MON') = 'SEP' 
order by hire_date desc;


-- Question 2 –-The company wants to see the total sale amount per sales person (salesman) for all 
--orders. Assume that online orders do not have any sales representative. For online 
--orders (orders with no salesman ID), consider the salesman ID as 0. Display the 
--salesman ID and the total sale amount for each employee. 
--Sort the result according to employee number
-- Q2 SOLUTION --
select NVL(orders.salesman_id,0) as "Employees Number",to_char((sum(order_items.unit_price*order_items.quantity)),'$999,999,999.99') as "Total sale" from order_items left join orders on orders.order_id = order_items.order_id
group by orders.salesman_id
order by  "Employees Number";


-- Question 3 –-Display customer Id, customer name and total number of orders for customers that 
--the value of their customer ID is in values from 35 to 45. Include the customers with 
--no orders in your report if their customer ID falls in the range 35 and 45. 
--Sort the result by the value of total orders.
-- Q3 SOLUTION --
select customers.customer_id as "Customer Id", customers.name as "Name", count(orders.customer_id) as "Total Orders" 
from customers 
left join orders on customers.customer_id = orders.customer_id
where customers.customer_id BETWEEN 35 and 45
group by customers.customer_id, customers.name
order by "Total Orders" ;
-- Q4 SOLUTION --
select customers.customer_id as "Customer Id", customers.name as "Name", orders.order_id as "Order Id",orders.order_date as "Order date" , sum(order_items.quantity) as "Total Items",to_char((sum(order_items.unit_price*order_items.quantity)),'$999,999,999.99') as "Total Amount"
from(( orders
INNER join customers on customers.customer_id = orders.customer_id)
INNER join order_items on order_items.order_id  = orders.order_id )
where customers.customer_id = '44'
group by  customers.customer_id,customers.name,orders.order_id,orders.order_date
order by "Total Amount" desc;
-- Q5 SOLUTION --
--select * from orders
select customers.customer_id as "Customer Id", customers.name as "Name", count( orders.order_id) as "Total Number of Orders", sum(order_items.quantity) as "Total Items",to_char((sum(order_items.unit_price*order_items.quantity)),'$999,999,999.99') as "Total Amount"
from customers
 join orders on customers.customer_id = orders.customer_id
 join order_items on order_items.order_id  = orders.order_id 
group by  customers.customer_id,customers.name
having count( orders.order_id) > 30;


-- Q6 SOLUTION --
select warehouses.warehouse_id,warehouses.warehouse_name,products.category_id, product_categories.category_name,min(products.standard_cost)
from products 
join inventories on inventories.product_id = products.product_id
join product_categories on product_categories.category_id = products.category_id
left join warehouses on inventories.warehouse_id =  warehouses.warehouse_id
group by warehouses.warehouse_id,warehouses.warehouse_name,products.category_id,product_categories.category_name
having min(products.standard_cost) not between 200 and 500
order by warehouses.warehouse_id,warehouses.warehouse_name,products.category_id,product_categories.category_name;
-- Q7 SOLUTION --
SELECT TO_CHAR(order_date, 'Month') AS "Month", COUNT(order_id) AS "Number of Orders"
FROM orders
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY  TO_date(order_date, 'Month');
-- Q8 SOLUTION --
select product_id as "Product ID ",product_name as "Product Name",to_char(list_price,'$999,999,999.99') as "Price"  from products where list_price > any (
select max(products.standard_cost) from products 
join inventories on inventories.product_id = products.product_id
join warehouses on inventories.warehouse_id =  warehouses.warehouse_id
join locations on warehouses.location_id = locations.location_id 
join countries on countries.country_id = locations.country_id
where country_name != 'America'
group by warehouses.warehouse_id 
)
order by "Price" desc



-- Q9 SOLUTION --
SELECT product_id AS "Product ID", product_name AS "Product Name", to_char(list_price,'$999,999,999.99') as "Price" 
FROM products
WHERE list_price=(SELECT MAX(list_price) FROM products)
UNION
SELECT product_id AS "Product ID", product_name AS "Product Name", to_char(list_price,'$999,999,999.99') as "Price"
FROM products
WHERE list_price=(SELECT MIN(list_price) FROM products);


-- Q10 SOLUTION --
(select 'Number of customers with total purchase amount over average: ' || count(*) as "Customer report" from (
select customers.customer_id,sum(order_items.quantity * order_items.unit_price) as "total" from order_items
left join  orders on orders.order_id = order_items.order_id  
left join customers on orders.customer_id = customers.customer_id 
group by customers.customer_id
)
where  "total" > (select avg(quantity * unit_price) from order_items) )
union all
(select 'Number of customers with total purchase amount below average: ' || count(*) from (
select customers.customer_id,sum(order_items.quantity * order_items.unit_price) as "total" from order_items
left join  orders on orders.order_id = order_items.order_id  
left join customers on orders.customer_id = customers.customer_id 
group by customers.customer_id
)
where  "total" < (select avg(quantity * unit_price) from order_items) )
union all
(
select 'Number of customers with no orders: '  || count(*) from
(select customer_id from customers 
minus 
select customer_id from orders))
union all
select 'Total number of customers: ' || count(*) from (select customer_id from customers)

