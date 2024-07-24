
  
    

    create or replace table `first-project-262802`.`ruggable`.`base_rugs_usa_pads_upsell`
      
    
    

    OPTIONS()
    as (
      select 
    size
    , shape
    , price
    , width
    , sqft
    , type
    , stock
    , height
    , variant
    , p_id
    , pad_id
    , dw_insert_timestamp
from `first-project-262802`.`ruggable`.`raw_rugs_usa_pads_upsell`
    );
  