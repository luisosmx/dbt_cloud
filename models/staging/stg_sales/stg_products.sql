
----------------------------------
--------CONFIGURATION-------------
----------------------------------

{{ config(materialized='table') }}

----------------------------------
----------------------------------

----------------------------------
-------------RAW DATA-------------
----------------------------------

with raw as (
    select 
        *
    from {{ ref('base_products') }}
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------


filter_data as ( 
    select 
        CAST(product_id AS INTEGER) AS product_id
        ,CAST(product_name AS STRING) AS product_name
        ,CAST(price AS INTEGER) AS price
    from raw
)

----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from filter_data

