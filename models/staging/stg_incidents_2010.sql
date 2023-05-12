{{ config(materialized='table') }}

with table_stg as (

    select * from {{ ref('base_incidents_2010') }}

)

select * from table_stg