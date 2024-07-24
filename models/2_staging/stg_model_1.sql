select
    distinct 
    col_name
    , col_name_1
    , col_name_2
    , col_name_3
from {{ ref('base_model_1') }}