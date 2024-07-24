with

variant as ( select * from `first-project-262802`.`ruggable`.`stg_variant` )

-- , parent as ( select * from `first-project-262802`.`ruggable`.`stg_parent` )

-- , pads as ( select * from `first-project-262802`.`ruggable`.`stg_pads_upsell` )

select
    distinct
    variant.*
    -- , parent.*
from variant
-- left join parent using (pid)
-- left join variant using (pid)