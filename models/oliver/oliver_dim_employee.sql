{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
ROW_NUMBER() OVER (ORDER BY employee_id) as employee_key,
employee_id,
first_name,
last_name,
email,
phone_number,
hire_date,
position
FROM {{ source('oliver', 'employee') }}