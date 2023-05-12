{{ config(materialized='table') }}

with raw as (
    select descript, address, timestamp, from bigquery-public-data.austin_incidents.incidents_2011
)
select * from raw