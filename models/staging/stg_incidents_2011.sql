{{ config(materialized='table') }}

with table_stg as (

    select * from {{ ref('base_incidents_2011') }}

)

select * from table_stg