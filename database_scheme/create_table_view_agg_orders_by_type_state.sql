CREATE OR REPLACE TABLE `torqata-yuan-pizza-delivery.pizza_delivery.agg_orders_by_type_state`
AS
SELECT state, type
     , total_number_of_pizzas_sold
     , gross_sales_USD
     , (gross_sales_USD / population) AS gross_sales_USD_per_capita
     , number_of_unique_customers
FROM (
    SELECT state, type, population
         , sum(qty) AS total_number_of_pizzas_sold
         , sum(retail_price_USD) AS gross_sales_USD
         , count(DISTINCT customer_id) AS number_of_unique_customers
    FROM `torqata-yuan-pizza-delivery.pizza_delivery.state_orders`
    WHERE order_date > CURRENT_DATETIME() - INTERVAL 12 month
    GROUP BY state, type, population
) t1;