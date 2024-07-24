
  
    

    create or replace table `first-project-262802`.`ruggable`.`base_rugs_usa_category_map`
      
    
    

    OPTIONS()
    as (
      select 
    pid
    , category_id
    , category_value
    , dw_insert_timestamp
from `first-project-262802`.`ruggable`.`raw_rugs_usa_category_map`
    );
  