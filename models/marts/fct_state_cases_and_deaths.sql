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
    from {{ ref('stg_city_level_cases_and_deaths') }}  
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------
state_cases as (
    select
    state
    ,SUM(white_cases) as white_cases
    ,SUM(black_cases) as black_cases
    ,SUM(latin_cases) as latin_cases
    ,SUM(asian_cases) as asian_cases
    ,MIN(white_cases) as min_cases_white
    ,MAX(asian_cases) as max_cases_asian
    ,AVG(black_cases) as avg_cases_black
    from raw
    where state like '%O%' AND EXTRACT(MONTH FROM date_cases) BETWEEN 04 AND 11
    group by 1
)
----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from state_cases