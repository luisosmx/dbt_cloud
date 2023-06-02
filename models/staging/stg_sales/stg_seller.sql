
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
    from {{ ref('base_seller') }}
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------


filter_data as ( 
    select 
        CAST(seller_id AS INTEGER) AS seller_id
        ,CAST(seller_name AS STRING) AS seller_name
        ,CAST(daily_target AS INTEGER) AS daily_target
    from raw
)

----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from filter_data

