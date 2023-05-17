
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
    from {{ ref('base_incidents_2008') }}
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------


filter_data as ( 
    select 
        descript
        ,address
        ,timestamp
    from bigquery-public-data.austin_incidents.incidents_2008
)

----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from filter_data

