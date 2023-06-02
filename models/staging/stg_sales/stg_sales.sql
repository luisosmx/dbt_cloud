
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
    from {{ ref('base_sales') }}
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------


filter_data as ( 
    select 
        CAST(order_id AS INTEGER) AS order_id
        ,CAST(product_id AS INTEGER) AS product_id
        ,CAST(seller_id AS INTEGER) AS seller_id
        ,CAST(date AS DATE) AS date_sales
        ,CAST(num_pieces_sold AS INTEGER) AS num_pieces_sold
    from raw
)

----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from filter_data

