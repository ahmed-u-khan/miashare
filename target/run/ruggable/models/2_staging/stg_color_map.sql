
  
    

    create or replace table `first-project-262802`.`ruggable`.`stg_color_map`
      
    
    

    OPTIONS()
    as (
      select
    distinct 
    pid
    , color_id
    , color_value
    , dw_insert_timestamp
from `first-project-262802`.`ruggable`.`base_rugs_usa_color_map`
    );
  