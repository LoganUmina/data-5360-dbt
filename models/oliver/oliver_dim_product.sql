{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
ROW_NUMBER() OVER (ORDER BY product_id) as product_key,
product_id,
product_name,
description
FROM {{ source('oliver', 'product') }}