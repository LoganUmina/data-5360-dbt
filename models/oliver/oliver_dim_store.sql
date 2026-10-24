{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
ROW_NUMBER() OVER (ORDER BY store_id) as store_key,
store_id,
store_name,
street,
city,
state
FROM {{ source('oliver', 'store') }}