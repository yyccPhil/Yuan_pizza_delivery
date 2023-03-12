CREATE OR REPLACE TABLE `pizza_delivery.state_orders`
AS
SELECT *
FROM `pizza_delivery.orders` o
LEFT JOIN (
  SELECT customer_id, c.name, address, city, state, zip_code, population
  FROM EXTERNAL_QUERY("torqata-yuan-pizza-delivery.us.mysql-torqata-pizza-delivery", "SELECT * FROM customers;") c
  LEFT JOIN `pizza_delivery.state_population` sp ON (c.state = sp.name)
) csp USING (customer_id);