
  
    

    create or replace table `first-project-262802`.`ruggable`.`base_rugs_usa_color_map`
      
    
    

    OPTIONS()
    as (
      select 
    pid
    , color_id
    , color_value
    , dw_insert_timestamp
from `first-project-262802`.`ruggable`.`raw_rugs_usa_color_map`
    );
  