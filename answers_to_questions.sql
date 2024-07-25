-- answer 2A

-- select
-- 	count(distinct(institution_id))
-- from forge.payments
-- where subtotal > 0
-- and paid_at BETWEEN CURDATE() - INTERVAL 180 DAY AND CURDATE()


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- answer 2B I

-- select 
-- 	institution_id
--     , count(distinct(name)) as number_of_programs
-- from forge.programs
-- group by 1
-- -- order by 1
-- -- order by 2 desc

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- answer 2B II

-- select 
-- 	program_id
--     , count(distinct(applicant_id))
-- from forge.applications
-- where is_approved = 1
-- group by 1
-- -- order by 1
-- -- order by 2 desc

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- answer 2D

-- with 

-- approved_students as (
-- 	select 
-- 		 applicant_id
--          , program_id
--     from forge.applications 
--     where is_approved = 1 
-- ),

-- program_and_repayment_amount as (
-- 	select
-- 		id as program_id,
--         installment_amount as amount_to_repay
-- 	from forge.programs
-- ),

-- students_repayment_amount_per_program as (
-- 	select
-- 		approved_students.applicant_id
--         , approved_students.program_id
--         , program_and_repayment_amount.amount_to_repay
--     from approved_students
--     left join program_and_repayment_amount using (program_id)
-- ),

-- students_repayment_amount as (
-- 	select
-- 		applicant_id
--         ,sum(amount_to_repay) as total_amount_to_repay
--     from students_repayment_amount_per_program
--     group by 1
-- ),

-- applicant_payment_info as (
-- 	select
-- 		payment_from_applicant_id as applicant_id
-- 		, count(*)
-- 		, sum(amount) as amount_repaid
-- 	from forge.transactions
-- 	where contract_type = 'payment plan'
-- 	and payment_from_applicant_id is not null
-- 	group by 1
-- 	order by 2 desc
-- ),

-- skeleton as (
-- 	select
-- 		applicant_payment_info.applicant_id
-- 		, applicant_payment_info.amount_repaid
-- 		, students_repayment_amount.total_amount_to_repay
-- 	from applicant_payment_info
-- 	left join students_repayment_amount using (applicant_id)
-- ),

-- final as (
-- 	select 
-- 		*
-- 		, total_amount_to_repay - amount_repaid as amount_left_to_repay
-- 		, case 
-- 			when total_amount_to_repay - amount_repaid <= 0 then 'fully paid'
-- 			when total_amount_to_repay - amount_repaid > 0 then 'actively paying'
-- 			else 'sent to collections'
-- 		  end as repayment_status
-- 	from skeleton
-- )

-- select
-- 	round ( ( sum(case when repayment_status = 'fully paid' then 1 else 0 end) / count(distinct(applicant_id)) )* 100.0 ) as full_paid_pct_rouned_to_whole_num
--     , round ( ( sum(case when repayment_status = 'actively paying' then 1 else 0 end) / count(distinct(applicant_id)) )* 100.0 ) as actively_paying_pct_rouned_to_whole_num
--     , round ( ( sum(case when repayment_status = 'sent to collections' then 1 else 0 end) / count(distinct(applicant_id)) )* 100.0 ) as sent_to_collections_pct_rouned_to_whole_num
-- from final



-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- answer 2E

-- select 
-- 	institution_id
--     , sum(amount) as total_revenue
--     , sum(servicing_fee)  as total_servicing_fee
--     , round( ( sum(servicing_fee)/sum(nullif(amount,0)) ) * 100.0 ,2) as miashare_rev_share_pct
-- from forge.payments
-- where status = 'completed'
-- group by 1