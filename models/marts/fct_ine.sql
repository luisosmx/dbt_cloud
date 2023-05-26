----------------------------------
--------CONFIGURATION-------------
----------------------------------

{{ config(materialized='table') }}

----------------------------------
----------------------------------

----------------------------------
-------------RAW DATA-------------
----------------------------------
with fac_table as (
    select
   dimension_ine.NOM_ENT_ as name_ent
   ,dimension_ine.INDIGENA as type_etnia
   ,stg_metric_ine.POBTOT as pob_total
   ,stg_metric_ine.POBFEM as pob_fem
   ,stg_metric_ine.POBMAS as pob_mas
from {{ ref('dimension_ine') }} as dimension_ine
inner join {{ ref('stg_metric_ine') }} as stg_metric_ine
on dimension_ine.NOM_ENT_ = stg_metric_ine. 
),

----------------------------------
---------TRANSFORMATION-----------
----------------------------------

data_table as (
    select
    count(*)
    from fac_table
)

----------------------------------
----------------------------------

----------------------------------
-----------FINAL OUTPUT-----------
----------------------------------

select * from data_table
