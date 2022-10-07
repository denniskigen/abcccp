SELECT
	*
FROM
	amrs.patient_program
WHERE
	program_id = 40
	AND DATE(date_created) BETWEEN ('2022-09-01') AND ('2022-09-31')
	AND creator IN (
   -- creator id
  )
	AND voided = 0;

-- CREATORS
-- J 168573
-- M 168100
-- V 168574
