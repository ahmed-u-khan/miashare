with

parent as ( 
    select 
        distinct
        pid
        , product_type_id
        , name
        , origin
        , thickness
        , material
        , weave
        , weave_feature
        , color
        , brand
        , image_name
        , image_type
        , internal_name
        , category
        , min_price
        , max_price
        , availability
        , aggregate
        , clearance
        , long_description
        , shopbyroom
        , dw_insert_timestamp
    from `first-project-262802`.`ruggable`.`stg_parent` 
)

-- , pads as ( select * from `first-project-262802`.`ruggable`.`stg_pads_upsell` )

-- , variant as ( select * from `first-project-262802`.`ruggable`.`stg_variant` )

select
    distinct
    parent.*
    -- , 
from parent
-- left join pads using (pid)
-- left join variant using (pid)