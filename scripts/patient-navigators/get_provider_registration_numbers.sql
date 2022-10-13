-- Gets the number of clients registered to the Oncology Screening and Diagnosis program per provider over a certain period of time

SELECT
	*
FROM
	amrs.patient_program
WHERE
	program_id = 40
	AND DATE(date_created) BETWEEN (
		-- start_date
	) AND (
		-- end date
	)
	AND creator IN (
   -- creator id
  )
	AND voided = 0;

-- CREATORS
-- J 168573
-- M 168100
-- V 168574
