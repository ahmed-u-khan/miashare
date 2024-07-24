
  
    

    create or replace table `first-project-262802`.`ruggable`.`stg_parent`
      
    
    

    OPTIONS()
    as (
      select 
    pid
    , product_type_id
    , name
    , url
    , origin
    , thickness
    , material
    , weave
    , weave_feature
    , color
    , brand
    , imageName as image_name
    , imageType as image_type
    , internalName as internal_name
    , category
    , min_price
    , max_price
    , availability
    , aggregate
    , clearance
    , long_description
    , shopbyroom
    , dw_insert_timestamp
    , regexp_replace(lower(ARRAY_REVERSE(SPLIT(url,'/'))[SAFE_OFFSET(1)]),'-','_') as inferred_colour_from_url
from `first-project-262802`.`ruggable`.`base_rugs_usa_parent`
    );
  