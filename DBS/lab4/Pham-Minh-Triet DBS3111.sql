


SELECT w.warehouse_name, l.state 
FROM warehouses w JOIN locations l 
ON l.location_id = w.location_id
UNION
SELECT w.warehouse_name, l.state 
FROM warehouses w RIGHT OUTER JOIN locations l 
ON l.location_id = w.location_id