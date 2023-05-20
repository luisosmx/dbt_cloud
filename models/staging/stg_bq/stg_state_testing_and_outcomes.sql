
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
    from {{ ref('base_state_testing_and_outcomes') }}
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------
filter_data as ( 
    select
       date
      ,state
      ,IFNULL(death, 0) AS death
      ,IFNULL(death_confirmed, 0) AS death_confirmed
      ,IFNULL(death_probable, 0) AS death_probable
      ,IFNULL(hospitalized, 0) AS hospitalized
    from raw
)

----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from filter_data

