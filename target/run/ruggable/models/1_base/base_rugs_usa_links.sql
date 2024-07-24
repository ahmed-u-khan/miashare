
  
    

    create or replace table `first-project-262802`.`ruggable`.`base_rugs_usa_links`
      
    
    

    OPTIONS()
    as (
      select 
    base_url
    , page_links
    , card_links
    , request_time_stamp
    , dw_insert_timestamp
from `first-project-262802`.`ruggable`.`raw_rugs_usa_links`
    );
  