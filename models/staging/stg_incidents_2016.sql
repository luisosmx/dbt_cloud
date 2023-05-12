{{ config(materialized='table') }}

with table_stg as (

    select * from {{ ref('base_incidents_2016') }}

)

select * from table_stg