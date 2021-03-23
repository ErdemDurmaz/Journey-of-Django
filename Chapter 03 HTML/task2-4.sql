
##########Will be edited further#########


2(a):Are there different types of products – how are they organised?
    Table names clearly identify the objects  that it contains,
according to this information: different products organizsed by
their name , number color, safety stock level, List price, size,
size unit. Weight class. it is possible to fetch information accordingly.

2(b):Where is the current price and cost of the product? Are there historical values available?:
    Current price is in column Standart Cost. Yes historical values are also available in coloumn Sales order.

2(c):. Connect to required tables and create
i. a pivot table that displays the number of products per subcategory only for
subcategories that contain word “Bike” in their name?
Template
SELECT
  rc.product_id,
  rc.product_name,
  rc.order_outcome_id,
  rc.outcome_text,
  rd.order_duration
FROM
(
  SELECT 
    c.id AS product_id,
    c.product_name,
    co.id AS order_outcome_id,
    co.outcome_text
  FROM order_outcome co
  CROSS JOIN product c
) rc
 
LEFT JOIN
 
(
  SELECT 
    ci.id AS product_id,
    co.id AS order_outcome_id,
    DATEDIFF(SECOND, c.start_time, c.end_time) AS order_duration
  FROM order c
  INNER JOIN order_outcome co ON c.order_outcome_id = co.id
  INNER JOIN customer cu ON c.customer_id = cu.id
  INNER JOIN product ci ON cu.product_id = ci.id
) rd ON rc.product_id = rd.product_id AND rc.order_outcome_id = rd.order_outcome_id
 
ORDER BY
  rc.poduct_id,
  rc.order_outcome_id;