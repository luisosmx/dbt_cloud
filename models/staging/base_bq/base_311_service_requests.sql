----------------------------------
--------CONFIGURATION-------------
----------------------------------
{{ config(materialized='table') }}

----------------------------------
----------------------------------

----------------------------------
-------------RAW DATA-------------
----------------------------------


with table_raw as (

    select * from bigquery-public-data.austin_311.311_service_requests

)

----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------

select * from table_raw
