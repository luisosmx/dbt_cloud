{{ config(materialized='table') }}

with table_stg as (

    select * from {{ ref('base_incidents_2008') }}

)

select * from table_stg