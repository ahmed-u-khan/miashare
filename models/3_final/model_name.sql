with

model_1 as ( select * from {{ ref('stg_model_1') }} )

, model_2 as ( select * from {{ ref('stg_model_2') }} )


select
    distinct
    model_1.*
    , model_2.col_name_1
    , model_2.col_name_3
from model_1
left join model_2 using (col_name)
