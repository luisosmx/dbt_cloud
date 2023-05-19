----------------------------------
--------CONFIGURATION-------------
----------------------------------

{{ config(materialized='table') }}

----------------------------------
----------------------------------

----------------------------------
-------------RAW DATA-------------
----------------------------------

with union_data as (
    select
        *
    from {{ ref('stg_incidents_2008') }}
    union all
    select
        *
    from {{ ref('stg_incidents_2009') }}
    union all
    select
        *
    from {{ ref('stg_incidents_2010') }}
    union all
    select
        *
    from {{ ref('stg_incidents_2011') }}
    union all
    select
        *
    from {{ ref('stg_incidents_2016') }}
)

----------------------------------
---------TRANSFORMATION-----------
----------------------------------



----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------


select * from union_data