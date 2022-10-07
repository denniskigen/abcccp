SELECT
	CONCAT(COALESCE(pn.given_name, ''), ' ', COALESCE(pn.middle_name, ''), ' ', COALESCE(pn.family_name, '')) AS `person_name`,
	enc.encounter_id,
	CASE WHEN enc.encounter_type = 145 THEN
		'Breast Investigations Findings'
	WHEN enc.encounter_type = 147 THEN
		'GynPathology Results'
	END AS `encounter_type`,
	enc.patient_id,
	enc.encounter_datetime,
	enc.creator,
	CASE WHEN fccs.gynp_procedure_done = 1 THEN
		'Punch biopsy'
	WHEN fccs.gynp_procedure_done = 2 THEN
		'LEEP'
	END AS `gyn_procedure_done`,
	CASE WHEN fccs.gynp_biopsy_cervix_result = 1 THEN
		'Normal'
	WHEN fccs.gynp_biopsy_cervix_result = 2 THEN
		'CIN 1'
	WHEN fccs.gynp_biopsy_cervix_result = 3 THEN
		'CIN 2'
	WHEN fccs.gynp_biopsy_cervix_result = 4 THEN
		'CIN 3'
	WHEN fccs.gynp_biopsy_cervix_result = 5 THEN
		'Genital warts'
	WHEN fccs.gynp_biopsy_cervix_result = 6 THEN
		'Cervicitis'
	WHEN fccs.gynp_biopsy_cervix_result = 7 THEN
		'Cervical squamous metaplasia'
	WHEN fccs.gynp_biopsy_cervix_result = 8 THEN
		'Condylomata'
	WHEN fccs.gynp_biopsy_cervix_result = 9 THEN
		'Cervical squamous cell carcinoma'
	WHEN fccs.gynp_biopsy_cervix_result = 10 THEN
		'Microinvasive carcinoma'
	WHEN fccs.gynp_biopsy_cervix_result = 11 THEN
		'Adenocarcinoma in situ'
	WHEN fccs.gynp_biopsy_cervix_result = 12 THEN
		'Squamous cell carcinoma'
	WHEN fccs.gynp_biopsy_cervix_result = 13 THEN
		'Adenocarcinoma'
	WHEN fccs.gynp_biopsy_cervix_result = 14 THEN
		'Invasive Adenocarcinoma'
	END AS `cervix_biopsy_result`,
	CASE WHEN fccs.gynp_pap_smear_results = 1 THEN
		'Normal'
	WHEN fccs.gynp_pap_smear_results = 2 THEN
		'ASCUS'
	WHEN fccs.gynp_pap_smear_results = 3 THEN
		'AGUS'
	WHEN fccs.gynp_pap_smear_results = 4 THEN
		'LSIL'
	WHEN fccs.gynp_pap_smear_results = 5 THEN
		'HSIL'
	WHEN fccs.gynp_pap_smear_results = 6 THEN
		'Carcinoma'
	END AS `gynp_pap_smear_results`,
	CASE WHEN fccs.gynp_endometrium_result = 1 THEN
		'Normal'
	WHEN fccs.gynp_endometrium_result = 2 THEN
		'Condylomata'
	WHEN fccs.gynp_endometrium_result = 3 THEN
		'Cervical squamous metaplasia'
	WHEN fccs.gynp_endometrium_result = 4 THEN
		'Invasive squamous cell carcinoma'
	WHEN fccs.gynp_endometrium_result = 5 THEN
		'Microinvasive carcinoma'
	WHEN fccs.gynp_endometrium_result = 6 THEN
		'Adenocarcinoma in situ'
	WHEN fccs.gynp_endometrium_result = 7 THEN
		'Squamous cell carcinoma'
	WHEN fccs.gynp_endometrium_result = 8 THEN
		'Adenocarcinoma'
	WHEN fccs.gynp_endometrium_result = 9 THEN
		'Invasive adenocarcinoma'
	WHEN fccs.gynp_endometrium_result = 10 THEN
		'Other (non-coded)'
	END AS `gynp_endometrium_biopsy_result`,
	CASE WHEN fccs.gynp_vagina_result = 1 THEN
		'Normal'
	WHEN fccs.gynp_vagina_result = 2 THEN
		'VAIN 1'
	WHEN fccs.gynp_vagina_result = 3 THEN
		'VAIN 2'
	WHEN fccs.gynp_vagina_result = 4 THEN
		'VAIN 3'
	WHEN fccs.gynp_vagina_result = 5 THEN
		'Cervical cancer'
	WHEN fccs.gynp_vagina_result = 6 THEN
		'Genital warts'
	WHEN fccs.gynp_vagina_result = 7 THEN
		'Cervical squamous metaplasia'
	WHEN fccs.gynp_vagina_result = 8 THEN
		'Condylomata'
	WHEN fccs.gynp_vagina_result = 9 THEN
		'Cervical squamous cell carcinoma'
	WHEN fccs.gynp_vagina_result = 10 THEN
		'Microinvasive carcinoma'
	WHEN fccs.gynp_vagina_result = 11 THEN
		'Adenocarcinoma in situ'
	WHEN fccs.gynp_vagina_result = 12 THEN
		'Squamous cell carcinoma, NOS'
	WHEN fccs.gynp_vagina_result = 13 THEN
		'Adenocarcinoma'
	WHEN fccs.gynp_vagina_result = 14 THEN
		'Invasive adenocarcinoma'
	END AS `gynp_vaginal_biopsy_result`,
	CASE WHEN fccs.gynp_vulva_result = 1 THEN
		'Normal'
	WHEN fccs.gynp_vulva_result = 2 THEN
		'Condyloma or vulvar intraepithelial neoplasia grade 1'
	WHEN fccs.gynp_vulva_result = 3 THEN
		'Vulvar intraepithelial neoplasia grade 2'
	WHEN fccs.gynp_vulva_result = 4 THEN
		'Vulvar intraepithelial neoplasia grade 3'
	WHEN fccs.gynp_vulva_result = 5 THEN
		'Invasive adenocarcinoma'
	WHEN fccs.gynp_vulva_result = 6 THEN
		'Genital warts'
	WHEN fccs.gynp_vulva_result = 7 THEN
		'Cervical squamous metaplasia'
	WHEN fccs.gynp_vulva_result = 8 THEN
		'Condylomata'
	WHEN fccs.gynp_vulva_result = 9 THEN
		'Cervical squamous cell carcinoma'
	WHEN fccs.gynp_vulva_result = 10 THEN
		'Microinvasive carcinoma'
	WHEN fccs.gynp_vulva_result = 11 THEN
		'Adenocarcinoma in situ'
	WHEN fccs.gynp_vulva_result = 12 THEN
		'Squamous cell carcinoma, otherwise not specified'
	WHEN fccs.gynp_vulva_result = 13 THEN
		'Adenocarcinoma'
	END AS `gynp_vulval_result`,
	CASE WHEN fccs.gynp_ecc_result = 1 THEN
		'Normal'
	WHEN fccs.gynp_ecc_result = 2 THEN
		'CIN 1'
	WHEN fccs.gynp_ecc_result = 3 THEN
		'CIN 2'
	WHEN fccs.gynp_ecc_result = 4 THEN
		'CIN 3'
	WHEN fccs.gynp_ecc_result = 5 THEN
		'Cervicitis'
	WHEN fccs.gynp_ecc_result = 6 THEN
		'Cervical squamous metaplasia'
	WHEN fccs.gynp_ecc_result = 7 THEN
		'Condylomata'
	WHEN fccs.gynp_ecc_result = 8 THEN
		'Cervical squamous cell carcinoma'
	WHEN fccs.gynp_ecc_result = 9 THEN
		'Microinvasive carcinoma'
	WHEN fccs.gynp_ecc_result = 10 THEN
		'Adenocarcinoma in situ'
	WHEN fccs.gynp_ecc_result = 11 THEN
		'Squamous cell carcinoma, otherwise not specified'
	WHEN fccs.gynp_ecc_result = 12 THEN
		'Adenocarcinoma'
	WHEN fccs.gynp_ecc_result = 13 THEN
		'Invasive adenocarcinoma'
	END AS `gynp_endocervical_curretage_result`,
	fccs.gynp_biopsy_sample_collection_date,
	fccs.gynp_diagnosis_date,
	fccs.gynp_date_patient_notified_of_results,
	fccs.gynp_assessment_notes,
	CASE WHEN fccs.gynp_pathology_management_plan = 1 THEN
		'Return for result'
	WHEN fccs.gynp_pathology_management_plan = 2 THEN
		'VIA follow-up in three months'
	WHEN fccs.gynp_pathology_management_plan = 3 THEN
		'Complete VIA or Pap smear in six months'
	WHEN fccs.gynp_pathology_management_plan = 4 THEN
		'Complete VIA in one year'
	WHEN fccs.gynp_pathology_management_plan = 5 THEN
		'Complete VIA in three years'
	WHEN fccs.gynp_pathology_management_plan = 6 THEN
		'Gynecologic oncology services'
	WHEN fccs.gynp_pathology_management_plan = 7 THEN
		'Referred to clinician today'
	WHEN fccs.gynp_pathology_management_plan = 8 THEN
		'LEEP'
	WHEN fccs.gynp_pathology_management_plan = 9 THEN
		'Cryotherapy'
	WHEN fccs.gynp_pathology_management_plan = 10 THEN
		'Repeat procedure'
	END AS `gynp_pathology_management_plan`,
	CASE WHEN fbcs.bif_mammogram_results = 1 THEN
		'Not done'
	WHEN fbcs.bif_mammogram_results = 2 THEN
		'Normal'
	WHEN fbcs.bif_mammogram_results = 3 THEN
		'Abnormal'
	END AS `bif_mammogram_results`,
	bif_mammogram_results_description,
	bif_mammogram_workup_date,
	CASE WHEN fbcs.bif_breast_ultrasound_results = 1 THEN
		'Not done'
	WHEN fbcs.bif_breast_ultrasound_results = 2 THEN
		'Normal'
	WHEN fbcs.bif_breast_ultrasound_results = 3 THEN
		'Abnormal'
	END AS `bif_breast_ultrasound_results`,
	fbcs.bif_ultrasound_results_description,
	fbcs.bif_ultrasound_workup_date,
	CASE WHEN fbcs.bif_fna_breast_results = 1 THEN
		'Not done'
	WHEN fbcs.bif_fna_breast_results = 2 THEN
		'Benign'
	WHEN fbcs.bif_fna_breast_results = 3 THEN
		'Malignant'
	END AS `bif_fna_breast_results`,
	CASE WHEN fbcs.bif_breast_biopsy_results = 1 THEN
		'Not done'
	WHEN fbcs.bif_breast_biopsy_results = 2 THEN
		'Benign'
	WHEN fbcs.bif_breast_biopsy_results = 3 THEN
		'Malignant'
	END AS `bif_breast_biopsy_results`,
	CASE WHEN fbcs.bif_breast_biopsy_malignancy_type = 1 THEN
		'Ductal Carcinoma In Situ'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 2 THEN
		'Inflammatory Breast Cancer'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 3 THEN
		'Invasive Ductal Carcinoma (Ductal Breast Cancer)'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 4 THEN
		'Lobular Carcinoma In Situ'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 5 THEN
		'Mammary Paget Disease'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 6 THEN
		'Medullary Carcinoma'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 7 THEN
		'Metaplastic Carcinoma'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 8 THEN
		'Mucinous (Colloid) Carcinoma'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 9 THEN
		'Papillary Carcinoma'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 10 THEN
		'Phyllodes Tumour'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 11 THEN
		'Tubular Carcinoma'
	END AS `breast_biopsy_malignancy_type`,
	fbcs.bif_breast_biopsy_sample_collection_date,
	fbcs.bif_breast_biopsy_results_description AS `breast_biopsy_results_description`,
	CASE WHEN fbcs.bif_mode_of_breast_screening = 1 THEN
		'Detected by CBE'
	WHEN fbcs.bif_mode_of_breast_screening = 2 THEN
		'Detected by mammography'
	WHEN fbcs.bif_mode_of_breast_screening = 3 THEN
		'Detected by ultrasound'
	END AS `bif_mode_of_breast_screening`,
	fbcs.bif_date_patient_informed_and_referred_for_treatment,
	fbcs.bif_assessment_notes
FROM
	amrs.encounter `enc`
	LEFT JOIN amrs.person_name `pn` ON (pn.person_id = enc.patient_id)
		AND(pn.voided IS NULL || pn.voided = 0)
	LEFT JOIN etl.flat_cervical_cancer_screening `fccs` ON fccs.encounter_id = enc.encounter_id
	LEFT JOIN etl.flat_breast_cancer_screening `fbcs` ON fbcs.encounter_id = enc.encounter_id
WHERE
	-- encounter_type IN (145, 147, 130)
	-- 655 CBE case management, 789 hematoncology triage, 986 gynpathology results, 1342 breast investigations findings
	enc.form_id IN (655, 986, 1342)
	AND enc.voided = 0
	AND enc.void_reason IS NULL
	AND enc.creator = 
  -- creator_id
	AND DATE(enc.date_created) BETWEEN 
  -- start date
	AND 
  -- end date
  ;