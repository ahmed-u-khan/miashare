
  
    

    create or replace table `first-project-262802`.`ruggable`.`stg_links`
      
    
    

    OPTIONS()
    as (
      select
    base_url
    , page_links
    , card_links
    , rtrim(ARRAY_REVERSE(SPLIT(card_links,'/'))[SAFE_OFFSET(0)],'-P.html') as pid
    , request_time_stamp
    , dw_insert_timestamp
from `first-project-262802`.`ruggable`.`base_rugs_usa_links`
    );
  