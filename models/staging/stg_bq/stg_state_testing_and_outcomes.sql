
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
      ,IFNULL(hospitalized, 0) AS hospitalized
      ,IFNULL(negative, 0) AS negative
      ,IFNULL(positive, 0) AS positive
      ,IFNULL(death_confirmed, 0) AS death_confirmed
    from raw
)

----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from filter_data

