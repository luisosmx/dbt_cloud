{{ config(materialized='table') }}

with table_stg as (

    select * from {{ ref('base_incidents_2009') }}

)

select * from table_stg