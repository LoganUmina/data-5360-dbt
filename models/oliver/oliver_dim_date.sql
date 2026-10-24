{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT DISTINCT
TO_NUMBER(TO_CHAR(order_date, 'YYYYMMDD')) as date_key,
order_date as date_id,
DAYNAME(order_date) as dayofweek,
MONTH(order_date) as month,
QUARTER(order_date) as quarter,
YEAR(order_date) as year
FROM {{ source('oliver', 'orders') }}