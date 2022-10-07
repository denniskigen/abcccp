SELECT
	fccs.person_id,
	CONCAT(COALESCE(pn.given_name, ''), ' ', COALESCE(pn.middle_name, ''), ' ', COALESCE(pn.family_name, '')) AS `person_name`,
	pi.identifier `amrs_identifier`,
	age,
	CASE WHEN fccs.location_id = 1 THEN
		'MTRH Module 1'
	WHEN fccs.location_id = 2 THEN
		'Mosoriot'
	WHEN fccs.location_id = 3 THEN
		'Turbo'
	WHEN fccs.location_id = 4 THEN
		'Burnt Forest'
	WHEN fccs.location_id = 5 THEN
		'Amukura'
	WHEN fccs.location_id = 6 THEN
		'Naitiri'
	WHEN fccs.location_id = 7 THEN
		'Chulaimbo'
	WHEN fccs.location_id = 8 THEN
		'Webuye'
	WHEN fccs.location_id = 9 THEN
		'Mt. Elgon'
	WHEN fccs.location_id = 11 THEN
		'Kitale'
	WHEN fccs.location_id = 12 THEN
		'Teso'
	WHEN fccs.location_id = 13 THEN
		'MTRH Module 2'
	WHEN fccs.location_id = 14 THEN
		'MTRH Module 3'
	WHEN fccs.location_id = 17 THEN
		'Iten'
	WHEN fccs.location_id = 19 THEN
		'Busia'
	WHEN fccs.location_id = 20 THEN
		'Port Victoria'
	WHEN fccs.location_id = 23 THEN
		'Khunyangu'
	WHEN fccs.location_id = 31 THEN
		'Uasin Gishu District Hospital'
	WHEN fccs.location_id = 55 THEN
		'Bumala A'
	WHEN fccs.location_id = 56 THEN
		'Eldoret Prison'
	WHEN fccs.location_id = 57 THEN
		'Kitale Prison'
	WHEN fccs.location_id = 58 THEN
		'Ngeria Prison'
	WHEN fccs.location_id = 61 THEN
		'Kaptagat'
	WHEN fccs.location_id = 62 THEN
		'Kesses'
	WHEN fccs.location_id = 63 THEN
		'Lukolis'
	WHEN fccs.location_id = 64 THEN
		'Bokoli'
	WHEN fccs.location_id = 65 THEN
		'Angurai'
	WHEN fccs.location_id = 66 THEN
		'Cheptais'
	WHEN fccs.location_id = 69 THEN
		'Huruma SDH'
	WHEN fccs.location_id = 70 THEN
		'Pioneer Sub-District Hospital'
	WHEN fccs.location_id = 75 THEN
		'Sinoko'
	WHEN fccs.location_id = 76 THEN
		'Milo'
	WHEN fccs.location_id = 78 THEN
		'Mukhobola'
	WHEN fccs.location_id = 79 THEN
		'Nambale'
	WHEN fccs.location_id = 82 THEN
		'Saboti'
	WHEN fccs.location_id = 83 THEN
		'Bumala B'
	WHEN fccs.location_id = 85 THEN
		'Makutano'
	WHEN fccs.location_id = 87 THEN
		'Sio Port'
	WHEN fccs.location_id = 88 THEN
		'Tulwet'
	WHEN fccs.location_id = 89 THEN
		'Kopsiro'
	WHEN fccs.location_id = 90 THEN
		'Changara'
	WHEN fccs.location_id = 91 THEN
		'Malaba'
	WHEN fccs.location_id = 92 THEN
		'Amase'
	WHEN fccs.location_id = 100 THEN
		'Osieko'
	WHEN fccs.location_id = 106 THEN
		'Kamolo'
	WHEN fccs.location_id = 108 THEN
		'Madende Health Center'
	WHEN fccs.location_id = 116 THEN
		'Cheramei Health Centre'
	WHEN fccs.location_id = 120 THEN
		'Sugoi A'
	WHEN fccs.location_id = 121 THEN
		'Sugoi B'
	WHEN fccs.location_id = 124 THEN
		'Akichelesit'
	WHEN fccs.location_id = 125 THEN
		'Aboloi'
	WHEN fccs.location_id = 126 THEN
		'Moding'
	WHEN fccs.location_id = 127 THEN
		'Sambut'
	WHEN fccs.location_id = 129 THEN
		'Sosiani'
	WHEN fccs.location_id = 130 THEN
		'Matayos Health Centre'
	WHEN fccs.location_id = 132 THEN
		'Kapsara Sub-District Hospital'
	WHEN fccs.location_id = 150 THEN
		'Sisenye Dispensary'
	WHEN fccs.location_id = 151 THEN
		'Rukala Dispensary'
	WHEN fccs.location_id = 152 THEN
		'Budalangi Dispensary'
	WHEN fccs.location_id = 155 THEN
		'Kaptebee/Turbo'
	WHEN fccs.location_id = 161 THEN
		'Laikipia'
	WHEN fccs.location_id = 162 THEN
		'Sirimba Mission Hospital'
	WHEN fccs.location_id = 163 THEN
		'Nasewa Health Centre'
	WHEN fccs.location_id = 168 THEN
		'Sikarira Dispensary'
	WHEN fccs.location_id = 169 THEN
		'Bulwani'
	WHEN fccs.location_id = 183 THEN
		'Ikonzo Dispensary'
	WHEN fccs.location_id = 188 THEN
		'Matunda Health Centre'
	WHEN fccs.location_id = 189 THEN
		'Endebes Health Centre'
	WHEN fccs.location_id = 190 THEN
		'Kwanza Health Centre'
	WHEN fccs.location_id = 191 THEN
		'Anderson'
	WHEN fccs.location_id = 193 THEN
		'Sister Freda Medical Centre'
	WHEN fccs.location_id = 195 THEN
		'Location Test'
	WHEN fccs.location_id = 197 THEN
		'MTRH MCH'
	WHEN fccs.location_id = 203 THEN
		'Langas'
	WHEN fccs.location_id = 204 THEN
		'MTRH Oncology'
	WHEN fccs.location_id = 205 THEN
		'Busagwa Dispensary'
	WHEN fccs.location_id = 207 THEN
		'MTRH-Oncology'
	WHEN fccs.location_id = 209 THEN
		'Kakamega'
	WHEN fccs.location_id = 210 THEN
		'Homabay'
	WHEN fccs.location_id = 212 THEN
		'Jaramogi Oginga Odinga TRH'
	WHEN fccs.location_id = 213 THEN
		'Bomet'
	WHEN fccs.location_id = 214 THEN
		'Kapenguria County Referral Hospital'
	WHEN fccs.location_id = 215 THEN
		'Hamisi Sub County Hospital'
	WHEN fccs.location_id = 216 THEN
		'Butere'
	WHEN fccs.location_id = 219 THEN
		'St. Elizabeth Lwak Mission Health center'
	WHEN fccs.location_id = 220 THEN
		'Madiany sub county hospital'
	WHEN fccs.location_id = 221 THEN
		'Bungoma County Referral Hospital'
	WHEN fccs.location_id = 224 THEN
		'Chemundu Dispensary'
	WHEN fccs.location_id = 225 THEN
		'AIC Kapsowar Mission Hospital'
	WHEN fccs.location_id = 226 THEN
		'Vihiga County Referral Hospital.'
	WHEN fccs.location_id = 227 THEN
		'Iten MCH'
	WHEN fccs.location_id = 230 THEN
		'Busia MCH'
	WHEN fccs.location_id = 231 THEN
		'Chulaimbo MCH'
	WHEN fccs.location_id = 232 THEN
		'Meru County Referral Hospital'
	WHEN fccs.location_id = 233 THEN
		'Sori Lake side Hospital'
	WHEN fccs.location_id = 234 THEN
		'Nyamira County Referral Hospital'
	WHEN fccs.location_id = 245 THEN
		'Chemalal Dispensary'
	WHEN fccs.location_id = 248 THEN
		'Garissa County Referral Hospital'
	WHEN fccs.location_id = 250 THEN
		'Makueni County Hospital'
	WHEN fccs.location_id = 252 THEN
		'Alupe Sub-county Hospital'
	WHEN fccs.location_id = 253 THEN
		'Bukalama dispensary'
	WHEN fccs.location_id = 254 THEN
		'Nambuku health centre'
	WHEN fccs.location_id = 255 THEN
		'Busibwabo Dispensary'
	WHEN fccs.location_id = 256 THEN
		'Musokoto Dispensary'
	WHEN fccs.location_id = 257 THEN
		'Nangina Dispensary'
	WHEN fccs.location_id = 258 THEN
		'Kamuriai dispensary'
	WHEN fccs.location_id = 259 THEN
		'Lwanyange dispensary'
	WHEN fccs.location_id = 262 THEN
		'Sitikho Health Centre'
	WHEN fccs.location_id = 269 THEN
		'Bikeke Health Centre'
	WHEN fccs.location_id = 270 THEN
		'Bondeni  Health Centre'
	WHEN fccs.location_id = 271 THEN
		'Chepchoina Dispensary'
	WHEN fccs.location_id = 272 THEN
		'Cherangany Health Centre'
	WHEN fccs.location_id = 273 THEN
		'Munongo'
	WHEN fccs.location_id = 276 THEN
		'Gitwamba Health Centre'
	WHEN fccs.location_id = 277 THEN
		'Kaisagat Health Centre'
	WHEN fccs.location_id = 278 THEN
		'Kapkoi Health Centre (Kwanza)'
	WHEN fccs.location_id = 279 THEN
		'Kaplamai Health Centre'
	WHEN fccs.location_id = 280 THEN
		'Kiminini Health Centre'
	WHEN fccs.location_id = 281 THEN
		'Kimuri Dispensary'
	WHEN fccs.location_id = 282 THEN
		'Kipsoen Dispensary'
	WHEN fccs.location_id = 283 THEN
		'Kitalale Dispensary'
	WHEN fccs.location_id = 284 THEN
		'Lukhome Dispensary'
	WHEN fccs.location_id = 285 THEN
		'Mailisaba Dispensary'
	WHEN fccs.location_id = 286 THEN
		'Mitume Dispensary'
	WHEN fccs.location_id = 287 THEN
		'Mt. Elgon National Park Dispensary'
	WHEN fccs.location_id = 288 THEN
		'Namanjalala Dispensary'
	WHEN fccs.location_id = 289 THEN
		'Nzoia Dispensary'
	WHEN fccs.location_id = 290 THEN
		'Sitatunga Dispensary'
	WHEN fccs.location_id = 291 THEN
		'Suwerwa Health Centre'
	WHEN fccs.location_id = 292 THEN
		'Tom Mboya Dispensary'
	WHEN fccs.location_id = 293 THEN
		'Weonia Health Centre'
	WHEN fccs.location_id = 294 THEN
		'Wiyeta Dispensary'
	WHEN fccs.location_id = 311 THEN
		'Osieko MCH'
	WHEN fccs.location_id = 312 THEN
		'Port Victoria MCH'
	WHEN fccs.location_id = 313 THEN
		'Matayos MCH'
	WHEN fccs.location_id = 314 THEN
		'Angurai MCH'
	WHEN fccs.location_id = 320 THEN
		'Malaba MCH'
	WHEN fccs.location_id = 321 THEN
		'Teso MCH'
	WHEN fccs.location_id = 325 THEN
		"Moi's Bridge MCH"
	WHEN fccs.location_id = 329 THEN
		'Turbo MCH'
	WHEN fccs.location_id = 341 THEN
		'Webuye MCH'
	WHEN fccs.location_id = 355 THEN
		'Angurai Health Centre'
	END AS facility,
	fccs.date_created,
	fccs.encounter_datetime,
	CASE WHEN fccs.reasons_for_current_visit = 1 THEN
		'Initial screening'
	WHEN fccs.reasons_for_current_visit = 2 THEN
		'Routine screening'
	WHEN fccs.reasons_for_current_visit = 3 THEN
		'Post-Treatment screening'
	WHEN fccs.reasons_for_current_visit = 4 THEN
		'Treatment visit'
	WHEN fccs.reasons_for_current_visit = 5 THEN
		'Complications'
	WHEN fccs.reasons_for_current_visit = 6 THEN
		'Annual screening'
	WHEN fccs.reasons_for_current_visit = 7 THEN
		'New complaints'
	WHEN fccs.reasons_for_current_visit = 8 THEN
		'Scheduled visit'
	WHEN fccs.reasons_for_current_visit = 9 THEN
		'Other'
	END AS reasons_for_current_visit,
	CASE WHEN fccs.prior_via_done = 1 THEN
		'Yes'
	WHEN fccs.prior_via_done = 0 THEN
		'No'
	END AS prior_via_done,
	CASE WHEN fccs.prior_via_result = 1 THEN
		'Positive'
	WHEN fccs.prior_via_result = 2 THEN
		'Negative'
	END AS prior_via_result,
	fccs.screening_method,
	CASE WHEN fccs.via_or_via_vili_test_result = 1 THEN
		'Negative'
	WHEN fccs.via_or_via_vili_test_result = 2 THEN
		'Positive'
	WHEN fccs.via_or_via_vili_test_result = 3 THEN
		'Suspicious of cancer'
	END AS via_or_via_vili_test_result,
	observations_from_positive_via_or_via_vili_test,
	CASE WHEN fccs.visual_impression_cervix = 1 THEN
		'Normal'
	WHEN fccs.visual_impression_cervix = 2 THEN
		'Positive VIA with Aceto white area'
	WHEN fccs.visual_impression_cervix = 3 THEN
		'Positive VIA with suspicious lesion'
	WHEN fccs.visual_impression_cervix = 4 THEN
		'CIN grade 1'
	WHEN fccs.visual_impression_cervix = 5 THEN
		'CIN grade 2'
	WHEN fccs.visual_impression_cervix = 6 THEN
		'CIN grade 3'
	WHEN fccs.visual_impression_cervix = 7 THEN
		'Cervical cancer'
	WHEN fccs.visual_impression_cervix = 8 THEN
		'Squamous cell carcinoma, NOS'
	WHEN fccs.visual_impression_cervix = 9 THEN
		'Other'
	END AS visual_impression_cervix,
	CASE WHEN fccs.procedures_done_this_visit = 1 THEN
		'None'
	WHEN fccs.procedures_done_this_visit = 2 THEN
		'Excisional/surgical biopsy'
	WHEN fccs.procedures_done_this_visit = 3 THEN
		'Cryotherapy'
	WHEN fccs.procedures_done_this_visit = 4 THEN
		'LEEP'
	WHEN fccs.procedures_done_this_visit = 5 THEN
		'Pap smear'
	WHEN fccs.procedures_done_this_visit = 6 THEN
		'Cervical polypectomy'
	WHEN fccs.procedures_done_this_visit = 7 THEN
		'Core needle biopsy'
	WHEN fccs.procedures_done_this_visit = 8 THEN
		'Endocervical curettage'
	WHEN fccs.procedures_done_this_visit = 9 THEN
		'Cervical biopsy'
	WHEN fccs.procedures_done_this_visit = 10 THEN
		'Endometrial biopsy'
	WHEN fccs.procedures_done_this_visit = 11 THEN
		'Punch biopsy'
	WHEN fccs.procedures_done_this_visit = 12 THEN
		'Vaginal biopsy'
	WHEN fccs.procedures_done_this_visit = 13 THEN
		'Vault biopsy'
	WHEN fccs.procedures_done_this_visit = 14 THEN
		'Vulval biopsy'
	WHEN fccs.procedures_done_this_visit = 15 THEN
		'Other'
	END AS procedures_done_this_visit,
	CASE WHEN fccs.treatment_method = 1 THEN
		'None  '
	WHEN fccs.treatment_method = 2 THEN
		'Cryotherapy'
	WHEN fccs.treatment_method = 3 THEN
		'LEEP '
	WHEN fccs.treatment_method = 4 THEN
		'Thermocoagulation'
	WHEN fccs.treatment_method = 5 THEN
		'Other treatment methods'
	END AS treatment_method,
	fccs.screening_assessment_notes,
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
	END AS gynp_pap_smear_results,
	CASE WHEN fccs.gynp_procedure_done = 1 THEN
		'Punch biopsy'
	WHEN fccs.gynp_procedure_done = 2 THEN
		'LEEP'
	END AS gynp_procedure_done,
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
		'Squamous cell carcinoma, NOS'
	WHEN fccs.gynp_biopsy_cervix_result = 13 THEN
		'Adenocarcinoma'
	WHEN fccs.gynp_biopsy_cervix_result = 14 THEN
		'Invasive Adenocarcinoma'
	END AS gynp_biopsy_cervix_result,
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
	END AS gynp_pathology_management_plan,
	gynp_assessment_notes
FROM
	etl.flat_cervical_cancer_screening `fccs`
	LEFT JOIN amrs.patient_identifier `pi` ON (fccs.person_id = pi.patient_id)
		AND(pi.voided IS NULL || pi.voided = 0)
		AND pi.identifier_type IN(3, 8)
	LEFT JOIN amrs.person_name `pn` ON (fccs.person_id = pn.person_id)
		AND(pn.voided IS NULL || pn.voided = 0)
WHERE
	fccs.date_created BETWEEN DATE('2017-10-01')
	AND DATE('2022-09-01')
ORDER BY
	fccs.date_created DESC;