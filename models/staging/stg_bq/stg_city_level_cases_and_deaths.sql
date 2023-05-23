
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
    from {{ ref('base_city_level_cases_and_deaths') }}
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------

filter_data as ( 
    select
       date AS date_cases
      ,state
      ,location
      ,city_or_county
      ,IFNULL(cases_white, 0) AS white_cases
      ,IFNULL(cases_black, 0) AS black_cases
      ,IFNULL(cases_latinx, 0) AS latin_cases
      ,IFNULL(cases_asian, 0) AS asian_cases
      ,IFNULL(cases_total, 0) AS total_cases
    from raw
)
----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from filter_data




