/* -- Question 1-- */
select to_char(sysdate+1, 'month' ||' '|| 'ddth' ) ||' of year ' || to_char(sysdate ,'yyyy')
FROM dual;
/* -- Question 2-- */
define tomorrow = to_char(sysdate +1, 'ddth');
select 'value of tomorrow’s date equal '||to_char(sysdate +1, 'ddth') as tomorrow
from dual
where to_char(sysdate +1, 'ddth') = &tomorrow;

/* -- Question 3-- */
select 
product_id as "PRODUCT ID",
product_name as "PRODUCT NAME",
TRUNC(list_price,2),
round(list_price + (list_price *2)/100) as "New Price",
TRUNC(round(list_price + (list_price *2)/100) - list_price,2) as "Price Difference"

from products 
where category_id = 2 or category_id = 3 or category_id = 5
order by category_id,product_id;

/* -- Question 4-- */
select last_name || ', '|| first_name || ' is ' || job_title as "Employee Info"
from employees
where manager_id = 2 
order by employee_id;

/* -- Question 5-- */
select last_name as "Last Name",
hire_date as "Hire Date",
round((sysdate - hire_date)/360) as "Years Worked"

from employees
where to_char(hire_date,'mm') < '10' and to_char(hire_date,'yyyy') <= 2016

order by "Hire Date";

/* -- Question 6-- */
select last_name as "Last Name", 
hire_date,
to_char (next_day(hire_date +366 , 'tuesday'), 'DAY' ) || ', '|| to_char ( hire_date + 380 ,'month')|| 'the ' || to_char (next_day(hire_date +366 , 'tuesday'), 'ddspth' ) || ' of year ' || to_char ( hire_date + 366 ,'yyyy') as "Review Date"
from employees
order by  hire_date;



/* -- Question 7-- */
select warehouses.warehouse_id as "Warehouse ID",
warehouses.warehouse_name as "Warehouse Name",
locations.city as "City",
NVL(locations.state,'Unknown')as "State"
from warehouses
left join locations on  locations.location_id = warehouses.location_id ;