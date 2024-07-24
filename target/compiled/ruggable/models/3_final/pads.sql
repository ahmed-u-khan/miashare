with

pads as ( select * from `first-project-262802`.`ruggable`.`stg_pads_upsell` )

-- , parent as ( select * from `first-project-262802`.`ruggable`.`stg_parent` )

-- , variant as ( select * from `first-project-262802`.`ruggable`.`stg_variant` )

select
    distinct
    pads.*
    -- , 
from pads
-- left join parent using (pid)
-- left join variant using (pid)