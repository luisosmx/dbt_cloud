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
    from {{ ref('stg_state_testing_and_outcomes') }}  
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------
number_hospitalized as (
    select
    date
    ,state
    ,sum(hospitalized) as hospitalized
    ,sum(positive) as positive
    ,sum(negative) as negative
    ,sum(death_confirmed) as confirmed_death
    from raw
    group by 1, 2
    order by sum(death_confirmed) desc 
)
----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from number_hospitalized