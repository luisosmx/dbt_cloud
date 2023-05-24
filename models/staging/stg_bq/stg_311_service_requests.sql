
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
    from {{ ref('base_311_service_requests') }}
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------

filter_data as ( 
    select
    IFNULL(city, 'NONE') AS city
    ,source
    ,complaint_description
    ,DATE(created_date) AS date_create
    ,DATE(close_date) AS data_close
    from raw
    
)
----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from filter_data




