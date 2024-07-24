select 
    col_name
    , col_name_1
    , col_name_2
    , col_name_3
from {{ source('miashare', 'raw_table_name_2') }}