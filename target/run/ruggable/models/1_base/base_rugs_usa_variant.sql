
  
    

    create or replace table `first-project-262802`.`ruggable`.`base_rugs_usa_variant`
      
    
    

    OPTIONS()
    as (
      select 
    pid
    , variant
    , actual_size
    , weave_feature
    , weave_cat
    , size_grp
    , shipping_size
    , shape
    , weight
    , price
    , msrp
    , stock_level
    , depletion_level
    , low_stock
    , estimated_delivery_date
    , this_isd_range
    , status
    , origin
    , new_arrival
    , stockMsg
    , stockEddMsg
    , other_stock_core
    , other_stock_compass
    , dw_insert_timestamp
from `first-project-262802`.`ruggable`.`raw_rugs_usa_variant`
    );
  