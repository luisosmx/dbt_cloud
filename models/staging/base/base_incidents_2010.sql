{{ config(materialized='table') }}

with raw as (
    select descript, address, timestamp, from bigquery-public-data.austin_incidents.incidents_2010
)
select * from raw