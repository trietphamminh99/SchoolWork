-- Q1 SOLUTION --
select employee_id as "Employee Number",
first_name||', '|| last_name as "Fullname", 
job_title as "Job Title",
to_char(hire_date,'['||'month'||' '||'dd')||'th of '||to_char(hire_date,'yyyy'||']') as "Start Date"
from employees 
where to_char(hire_date,'MON') = 'SEP' 
order by hire_date desc;
-- Q2 SOLUTION --
select NVL(orders.salesman_id,0) as "Employees Number",to_char((sum(order_items.unit_price*order_items.quantity)),'$999,999,999.99') as "Total sale" from order_items left join orders on orders.order_id = order_items.order_id
group by orders.salesman_id
order by  "Employees Number" ;
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
select * from products
select max(products.standard_cost) from products 
join inventories on inventories.product_id = products.product_id
left join warehouses on inventories.warehouse_id =  warehouses.warehouse_id
group by warehouses.warehouse_id 
order by max(products.standard_cost) desc
FETCH FIRST 1 ROWS ONLY;
