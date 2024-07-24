
  
    

    create or replace table `first-project-262802`.`ruggable`.`stg_category_map`
      
    
    

    OPTIONS()
    as (
      select
    distinct 
    pid
    , category_id
    , category_value
    , dw_insert_timestamp
from `first-project-262802`.`ruggable`.`base_rugs_usa_category_map`
    );
  