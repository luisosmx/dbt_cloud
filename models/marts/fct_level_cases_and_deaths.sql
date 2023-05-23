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
counth_month as (
    select
        extract(month from date_cases) as month_cases
        ,SUM(white_cases) as white_cases
        ,SUM(black_cases) as black_cases
        ,SUM(latin_cases) as latin_cases
        ,SUM(asian_cases) as asian_cases
    from raw
    group by extract(month from date_cases)
    ),

counth_day as (
    select
        extract(day from date_cases) as day_cases
        ,SUM(white_cases) as white_cases
        ,SUM(black_cases) as black_cases
        ,SUM(latin_cases) as latin_cases
        ,SUM(asian_cases) as asian_cases
    from raw
    group by extract(day from date_cases)
),

counth_year as (
    select
    extract(year from date_cases) as year_cases
    ,SUM(white_cases) as white_cases
    ,SUM(black_cases) as black_cases
    ,SUM(latin_cases) as latin_cases
    ,SUM(asian_cases) as asian_cases
    from raw
    group by extract(year from date_cases) 
)


----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from counth_day

