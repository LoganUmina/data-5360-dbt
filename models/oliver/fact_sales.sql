{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
customer.cust_key,
date.date_key,
store.store_key,
product.product_key,
employee.employee_key,
orderline.quantity,
orderline.quantity * orderline.unit_price as dollars_sold,
orderline.unit_price
FROM {{ source('oliver', 'orderline') }} as orderline
INNER JOIN {{ source('oliver', 'orders') }} as orders
    ON orderline.order_id = orders.order_id
LEFT JOIN {{ ref('oliver_dim_customer') }} as customer
    ON orders.customer_id = customer.customer_id
LEFT JOIN {{ ref('oliver_dim_date') }} as date
    ON orders.order_date = date.date_id
LEFT JOIN {{ ref('oliver_dim_store') }} as store
    ON orders.store_id = store.store_id
LEFT JOIN {{ ref('oliver_dim_product') }} as product
    ON orderline.product_id = product.product_id
LEFT JOIN {{ ref('oliver_dim_employee') }} as employee
    ON orders.employee_id = employee.employee_id