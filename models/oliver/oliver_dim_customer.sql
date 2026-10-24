{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
ROW_NUMBER() OVER (ORDER BY customer_id) as cust_key,
customer_id,
first_name,
last_name,
email,
phone_number,
state
FROM {{ source('oliver', 'customer') }}