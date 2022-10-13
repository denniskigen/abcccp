-- Gets important indicators and metadata drawn from breast screening encounters over a certain period of time.

SELECT
	fbcs.person_id,
	CONCAT(COALESCE(pn.given_name, ''), ' ', COALESCE(pn.middle_name, ''), ' ', COALESCE(pn.family_name, '')) AS `person_name`,
	pi.identifier `amrs_identifier`,
	age,
	gender,
	CASE WHEN fbcs.location_id = 1 THEN
		'MTRH Module 1'
	WHEN fbcs.location_id = 2 THEN
		'Mosoriot'
	WHEN fbcs.location_id = 3 THEN
		'Turbo'
	WHEN fbcs.location_id = 4 THEN
		'Burnt Forest'
	WHEN fbcs.location_id = 5 THEN
		'Amukura'
	WHEN fbcs.location_id = 6 THEN
		'Naitiri'
	WHEN fbcs.location_id = 7 THEN
		'Chulaimbo'
	WHEN fbcs.location_id = 8 THEN
		'Webuye'
	WHEN fbcs.location_id = 9 THEN
		'Mt. Elgon'
	WHEN fbcs.location_id = 11 THEN
		'Kitale'
	WHEN fbcs.location_id = 12 THEN
		'Teso'
	WHEN fbcs.location_id = 13 THEN
		'MTRH Module 2'
	WHEN fbcs.location_id = 14 THEN
		'MTRH Module 3'
	WHEN fbcs.location_id = 17 THEN
		'Iten'
	WHEN fbcs.location_id = 19 THEN
		'Busia'
	WHEN fbcs.location_id = 20 THEN
		'Port Victoria'
	WHEN fbcs.location_id = 23 THEN
		'Khunyangu'
	WHEN fbcs.location_id = 31 THEN
		'Uasin Gishu District Hospital'
	WHEN fbcs.location_id = 55 THEN
		'Bumala A'
	WHEN fbcs.location_id = 56 THEN
		'Eldoret Prison'
	WHEN fbcs.location_id = 57 THEN
		'Kitale Prison'
	WHEN fbcs.location_id = 58 THEN
		'Ngeria Prison'
	WHEN fbcs.location_id = 61 THEN
		'Kaptagat'
	WHEN fbcs.location_id = 62 THEN
		'Kesses'
	WHEN fbcs.location_id = 63 THEN
		'Lukolis'
	WHEN fbcs.location_id = 64 THEN
		'Bokoli'
	WHEN fbcs.location_id = 65 THEN
		'Angurai'
	WHEN fbcs.location_id = 66 THEN
		'Cheptais'
	WHEN fbcs.location_id = 69 THEN
		'Huruma SDH'
	WHEN fbcs.location_id = 70 THEN
		'Pioneer Sub-District Hospital'
	WHEN fbcs.location_id = 75 THEN
		'Sinoko'
	WHEN fbcs.location_id = 76 THEN
		'Milo'
	WHEN fbcs.location_id = 78 THEN
		'Mukhobola'
	WHEN fbcs.location_id = 79 THEN
		'Nambale'
	WHEN fbcs.location_id = 82 THEN
		'Saboti'
	WHEN fbcs.location_id = 83 THEN
		'Bumala B'
	WHEN fbcs.location_id = 85 THEN
		'Makutano'
	WHEN fbcs.location_id = 87 THEN
		'Sio Port'
	WHEN fbcs.location_id = 88 THEN
		'Tulwet'
	WHEN fbcs.location_id = 89 THEN
		'Kopsiro'
	WHEN fbcs.location_id = 90 THEN
		'Changara'
	WHEN fbcs.location_id = 91 THEN
		'Malaba'
	WHEN fbcs.location_id = 92 THEN
		'Amase'
	WHEN fbcs.location_id = 100 THEN
		'Osieko'
	WHEN fbcs.location_id = 106 THEN
		'Kamolo'
	WHEN fbcs.location_id = 108 THEN
		'Madende Health Center'
	WHEN fbcs.location_id = 116 THEN
		'Cheramei Health Centre'
	WHEN fbcs.location_id = 120 THEN
		'Sugoi A'
	WHEN fbcs.location_id = 121 THEN
		'Sugoi B'
	WHEN fbcs.location_id = 124 THEN
		'Akichelesit'
	WHEN fbcs.location_id = 125 THEN
		'Aboloi'
	WHEN fbcs.location_id = 126 THEN
		'Moding'
	WHEN fbcs.location_id = 127 THEN
		'Sambut'
	WHEN fbcs.location_id = 129 THEN
		'Sosiani'
	WHEN fbcs.location_id = 130 THEN
		'Matayos Health Centre'
	WHEN fbcs.location_id = 132 THEN
		'Kapsara Sub-District Hospital'
	WHEN fbcs.location_id = 150 THEN
		'Sisenye Dispensary'
	WHEN fbcs.location_id = 151 THEN
		'Rukala Dispensary'
	WHEN fbcs.location_id = 152 THEN
		'Budalangi Dispensary'
	WHEN fbcs.location_id = 155 THEN
		'Kaptebee/Turbo'
	WHEN fbcs.location_id = 161 THEN
		'Laikipia'
	WHEN fbcs.location_id = 162 THEN
		'Sirimba Mission Hospital'
	WHEN fbcs.location_id = 163 THEN
		'Nasewa Health Centre'
	WHEN fbcs.location_id = 168 THEN
		'Sikarira Dispensary'
	WHEN fbcs.location_id = 169 THEN
		'Bulwani'
	WHEN fbcs.location_id = 183 THEN
		'Ikonzo Dispensary'
	WHEN fbcs.location_id = 188 THEN
		'Matunda Health Centre'
	WHEN fbcs.location_id = 189 THEN
		'Endebes Health Centre'
	WHEN fbcs.location_id = 190 THEN
		'Kwanza Health Centre'
	WHEN fbcs.location_id = 191 THEN
		'Anderson'
	WHEN fbcs.location_id = 193 THEN
		'Sister Freda Medical Centre'
	WHEN fbcs.location_id = 195 THEN
		'Location Test'
	WHEN fbcs.location_id = 197 THEN
		'MTRH MCH'
	WHEN fbcs.location_id = 203 THEN
		'Langas'
	WHEN fbcs.location_id = 204 THEN
		'MTRH Oncology'
	WHEN fbcs.location_id = 205 THEN
		'Busagwa Dispensary'
	WHEN fbcs.location_id = 207 THEN
		'MTRH-Oncology'
	WHEN fbcs.location_id = 209 THEN
		'Kakamega'
	WHEN fbcs.location_id = 210 THEN
		'Homabay'
	WHEN fbcs.location_id = 212 THEN
		'Jaramogi Oginga Odinga TRH'
	WHEN fbcs.location_id = 213 THEN
		'Bomet'
	WHEN fbcs.location_id = 214 THEN
		'Kapenguria County Referral Hospital'
	WHEN fbcs.location_id = 215 THEN
		'Hamisi Sub County Hospital'
	WHEN fbcs.location_id = 216 THEN
		'Butere'
	WHEN fbcs.location_id = 219 THEN
		'St. Elizabeth Lwak Mission Health center'
	WHEN fbcs.location_id = 220 THEN
		'Madiany sub county hospital'
	WHEN fbcs.location_id = 221 THEN
		'Bungoma County Referral Hospital'
	WHEN fbcs.location_id = 224 THEN
		'Chemundu Dispensary'
	WHEN fbcs.location_id = 225 THEN
		'AIC Kapsowar Mission Hospital'
	WHEN fbcs.location_id = 226 THEN
		'Vihiga County Referral Hospital.'
	WHEN fbcs.location_id = 227 THEN
		'Iten MCH'
	WHEN fbcs.location_id = 230 THEN
		'Busia MCH'
	WHEN fbcs.location_id = 231 THEN
		'Chulaimbo MCH'
	WHEN fbcs.location_id = 232 THEN
		'Meru County Referral Hospital'
	WHEN fbcs.location_id = 233 THEN
		'Sori Lake side Hospital'
	WHEN fbcs.location_id = 234 THEN
		'Nyamira County Referral Hospital'
	WHEN fbcs.location_id = 245 THEN
		'Chemalal Dispensary'
	WHEN fbcs.location_id = 248 THEN
		'Garissa County Referral Hospital'
	WHEN fbcs.location_id = 250 THEN
		'Makueni County Hospital'
	WHEN fbcs.location_id = 252 THEN
		'Alupe Sub-county Hospital'
	WHEN fbcs.location_id = 253 THEN
		'Bukalama dispensary'
	WHEN fbcs.location_id = 254 THEN
		'Nambuku health centre'
	WHEN fbcs.location_id = 255 THEN
		'Busibwabo Dispensary'
	WHEN fbcs.location_id = 256 THEN
		'Musokoto Dispensary'
	WHEN fbcs.location_id = 257 THEN
		'Nangina Dispensary'
	WHEN fbcs.location_id = 258 THEN
		'Kamuriai dispensary'
	WHEN fbcs.location_id = 259 THEN
		'Lwanyange dispensary'
	WHEN fbcs.location_id = 262 THEN
		'Sitikho Health Centre'
	WHEN fbcs.location_id = 269 THEN
		'Bikeke Health Centre'
	WHEN fbcs.location_id = 270 THEN
		'Bondeni  Health Centre'
	WHEN fbcs.location_id = 271 THEN
		'Chepchoina Dispensary'
	WHEN fbcs.location_id = 272 THEN
		'Cherangany Health Centre'
	WHEN fbcs.location_id = 273 THEN
		'Munongo'
	WHEN fbcs.location_id = 276 THEN
		'Gitwamba Health Centre'
	WHEN fbcs.location_id = 277 THEN
		'Kaisagat Health Centre'
	WHEN fbcs.location_id = 278 THEN
		'Kapkoi Health Centre (Kwanza)'
	WHEN fbcs.location_id = 279 THEN
		'Kaplamai Health Centre'
	WHEN fbcs.location_id = 280 THEN
		'Kiminini Health Centre'
	WHEN fbcs.location_id = 281 THEN
		'Kimuri Dispensary'
	WHEN fbcs.location_id = 282 THEN
		'Kipsoen Dispensary'
	WHEN fbcs.location_id = 283 THEN
		'Kitalale Dispensary'
	WHEN fbcs.location_id = 284 THEN
		'Lukhome Dispensary'
	WHEN fbcs.location_id = 285 THEN
		'Mailisaba Dispensary'
	WHEN fbcs.location_id = 286 THEN
		'Mitume Dispensary'
	WHEN fbcs.location_id = 287 THEN
		'Mt. Elgon National Park Dispensary'
	WHEN fbcs.location_id = 288 THEN
		'Namanjalala Dispensary'
	WHEN fbcs.location_id = 289 THEN
		'Nzoia Dispensary'
	WHEN fbcs.location_id = 290 THEN
		'Sitatunga Dispensary'
	WHEN fbcs.location_id = 291 THEN
		'Suwerwa Health Centre'
	WHEN fbcs.location_id = 292 THEN
		'Tom Mboya Dispensary'
	WHEN fbcs.location_id = 293 THEN
		'Weonia Health Centre'
	WHEN fbcs.location_id = 294 THEN
		'Wiyeta Dispensary'
	WHEN fbcs.location_id = 311 THEN
		'Osieko MCH'
	WHEN fbcs.location_id = 312 THEN
		'Port Victoria MCH'
	WHEN fbcs.location_id = 313 THEN
		'Matayos MCH'
	WHEN fbcs.location_id = 314 THEN
		'Angurai MCH'
	WHEN fbcs.location_id = 320 THEN
		'Malaba MCH'
	WHEN fbcs.location_id = 321 THEN
		'Teso MCH'
	WHEN fbcs.location_id = 325 THEN
		"Moi's Bridge MCH"
	WHEN fbcs.location_id = 329 THEN
		'Turbo MCH'
	WHEN fbcs.location_id = 341 THEN
		'Webuye MCH'
	WHEN fbcs.location_id = 355 THEN
		'Angurai Health Centre'
	END AS facility,
	fbcs.date_created,
	fbcs.encounter_datetime,
	CASE WHEN fbcs.current_visit_type = 1 THEN
		'Annual screening'
	WHEN fbcs.current_visit_type = 2 THEN
		'New complaints'
	WHEN fbcs.current_visit_type = 3 THEN
		'Recall/scheduled visit'
	WHEN fbcs.current_visit_type = 4 THEN
		'Follow-up'
	WHEN fbcs.current_visit_type = 5 THEN
		'Other (non-coded)'
	END AS current_visit_type,
	complaints_presenting_with,
	CASE WHEN fbcs.hiv_status = 1 THEN
		'Negative'
	WHEN fbcs.hiv_status = 2 THEN
		'Positive'
	WHEN fbcs.hiv_status = 3 THEN
		'Unknown'
	END AS hiv_status,
	CASE WHEN fbcs.has_ever_done_a_clinical_breast_exam = 1 THEN
		'Yes'
	WHEN fbcs.has_ever_done_a_clinical_breast_exam = 2 THEN
		'No'
	WHEN fbcs.has_ever_done_a_clinical_breast_exam = 3 THEN
		'Not sure'
	END AS has_ever_done_a_clinical_breast_exam,
	CASE WHEN fbcs.past_clinical_breast_exam_results = '1115' THEN
		'Normal'
	WHEN fbcs.past_clinical_breast_exam_results = '1116' THEN
		'Abnormal'
	WHEN fbcs.past_clinical_breast_exam_results = '6250' THEN
		'Breast lumps'
	WHEN fbcs.past_clinical_breast_exam_results = '1067' THEN
		'Unknown'
	WHEN fbcs.past_clinical_breast_exam_results = '6493' THEN
		'Nipple discharge'
	WHEN fbcs.past_clinical_breast_exam_results = '9689' THEN
		'Fine nodularity'
	WHEN fbcs.past_clinical_breast_exam_results = '9690' THEN
		'Dense nodularity'
	WHEN fbcs.past_clinical_breast_exam_results = '1481' THEN
		'Breast abscess'
	WHEN fbcs.past_clinical_breast_exam_results = '9688' THEN
		'Nipple areolar change'
	WHEN fbcs.past_clinical_breast_exam_results = '9687' THEN
		'Skin edema'
	WHEN fbcs.past_clinical_breast_exam_results = '5622' THEN
		'Other'
	END AS past_clinical_breast_exam_results,
	CASE WHEN fbcs.breast_exam_findings_this_visit = '1115' THEN
		'Normal'
	WHEN fbcs.breast_exam_findings_this_visit = '1116' THEN
		'Abnormal'
	WHEN fbcs.breast_exam_findings_this_visit = '1481' THEN
		'Breast abscess'
	WHEN fbcs.breast_exam_findings_this_visit = '5313' THEN
		'Muscle tenderness'
	WHEN fbcs.breast_exam_findings_this_visit = '6250' THEN
		'Breast lumps'
	WHEN fbcs.breast_exam_findings_this_visit = '6493' THEN
		'Nipple discharge'
	WHEN fbcs.breast_exam_findings_this_visit = '9689' THEN
		'Fine nodularity'
	WHEN fbcs.breast_exam_findings_this_visit = '9690' THEN
		'Dense nodularity'
	WHEN fbcs.breast_exam_findings_this_visit = '1481' THEN
		'Breast abscess'
	WHEN fbcs.breast_exam_findings_this_visit = '9688' THEN
		'Nipple areolar change'
	WHEN fbcs.breast_exam_findings_this_visit = '9687' THEN
		'Skin edema'
	WHEN fbcs.breast_exam_findings_this_visit = '5622' THEN
		'Other'
	WHEN fbcs.breast_exam_findings_this_visit = '6499' THEN
		'Breast skin changes'
	WHEN fbcs.breast_exam_findings_this_visit = '6729' THEN
		'Breast engorgement'
	WHEN fbcs.breast_exam_findings_this_visit = '8188' THEN
		'Calor'
	WHEN fbcs.breast_exam_findings_this_visit = '8189' THEN
		"Peau d'Orange"
	WHEN fbcs.breast_exam_findings_this_visit = '6429' THEN
		'Cracked nipple'
	WHEN fbcs.breast_exam_findings_this_visit = '115' THEN
		'Mastitis'
	WHEN fbcs.breast_exam_findings_this_visit = '10945' THEN
		'Retracted nipple associated with childbirth'
	WHEN fbcs.breast_exam_findings_this_visit = '10946' THEN
		'Mastitis associated with childbirth'
	END AS breast_exam_findings_this_visit,
	CASE WHEN fbcs.lymph_node_exam_findings = 1 THEN
		'Normal'
	WHEN fbcs.lymph_node_exam_findings = 2 THEN
		'Lymphadenopathy'
	WHEN fbcs.lymph_node_exam_findings = 3 THEN
		'Fixed'
	WHEN fbcs.lymph_node_exam_findings = 4 THEN
		'Mobile'
	END AS lymph_node_exam_findings,
	CASE WHEN fbcs.screening_patient_education = 1 THEN
		'Importance of annual screening'
	WHEN fbcs.screening_patient_education = 2 THEN
		'Referral follow-up'
	WHEN fbcs.screening_patient_education = 3 THEN
		'Breast self-exam'
	WHEN fbcs.screening_patient_education = 4 THEN
		'Other (non-coded))'
	END AS screening_patient_education,
	CASE WHEN fbcs.histological_investigations_done = 1 THEN
		'Core needle biopsy'
	WHEN fbcs.histological_investigations_done = 2 THEN
		'Excisional biopsy'
	WHEN fbcs.histological_investigations_done = 3 THEN
		'Incisional biopsy'
	WHEN fbcs.histological_investigations_done = 4 THEN
		'Cytology'
	WHEN fbcs.histological_investigations_done = 5 THEN
		'None'
	END AS histological_investigations_done,
	CASE WHEN fbcs.radiological_investigations_done = 1 THEN
		'Mammogram'
	WHEN fbcs.radiological_investigations_done = 2 THEN
		'Breast ultrasound'
	WHEN fbcs.radiological_investigations_done = 3 THEN
		'None'
	END AS radiological_investigations_done,
	CASE WHEN fbcs.cbe_purpose_of_visit = 1 THEN
		'Annual screening'
	WHEN fbcs.cbe_purpose_of_visit = 2 THEN
		'New problem'
	WHEN fbcs.cbe_purpose_of_visit = 3 THEN
		'Recall/scheduled visit'
	WHEN fbcs.cbe_purpose_of_visit = 4 THEN
		'Follow up'
	WHEN fbcs.cbe_purpose_of_visit = 5 THEN
		'Other'
	END AS cbe_purpose_of_visit,
	fbcs.cbe_breast_exam_findings,
	CASE WHEN cbe_lymph_nodes_findings = 1 THEN
		'Within normal limit'
	WHEN cbe_lymph_nodes_findings = 2 THEN
		'Enlarged'
	WHEN cbe_lymph_nodes_findings = 3 THEN
		'Fixed'
	WHEN cbe_lymph_nodes_findings = 4 THEN
		'Mobile'
	END AS cbe_lymph_nodes_findings,
	CASE WHEN fbcs.bif_mammogram_results = 1 THEN
		'Not done'
	WHEN fbcs.bif_mammogram_results = 2 THEN
		'Normal'
	WHEN fbcs.bif_mammogram_results = 3 THEN
		'Abnormal'
	END AS bif_mammogram_results,
	CASE WHEN fbcs.bif_fna_breast_results = 1 THEN
		'Not done'
	WHEN fbcs.bif_fna_breast_results = 2 THEN
		'Benign'
	WHEN fbcs.bif_fna_breast_results = 3 THEN
		'Malignant'
	END AS bif_fna_breast_results,
	CASE WHEN fbcs.bif_breast_biopsy_results = 1 THEN
		'Not done'
	WHEN fbcs.bif_breast_biopsy_results = 2 THEN
		'Benign'
	WHEN fbcs.bif_breast_biopsy_results = 3 THEN
		'Malignant'
	END AS bif_breast_biopsy_results,
	CASE WHEN fbcs.bif_breast_biopsy_malignancy_type = 1 THEN
		'Ductal carcinoma in situ'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 2 THEN
		'Inflammatory breast cancer'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 3 THEN
		'Invasive ductal carcinoma (Ductal breast cancer)'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 4 THEN
		'Lobular carcinoma in situ'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 5 THEN
		'Mammary paget disease'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 6 THEN
		'Medullary carcinoma'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 7 THEN
		'Metaplastic carcinoma'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 8 THEN
		'Mucinous (Colloid) carcinoma'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 9 THEN
		'Papillary carcinoma'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 10 THEN
		'Phyllodes tumour'
	WHEN fbcs.bif_breast_biopsy_malignancy_type = 11 THEN
		'Tubular carcinoma'
	END AS bif_breast_biopsy_malignancy_type,
	CASE WHEN fbcs.bif_ihc_er = 1 THEN
		'Positive'
	WHEN fbcs.bif_ihc_er = 2 THEN
		'Negative'
	END AS bif_ihc_er,
	CASE WHEN fbcs.bif_ihc_pr = 1 THEN
		'Positive'
	WHEN fbcs.bif_ihc_pr = 2 THEN
		'Negative'
	END AS bif_ihc_pr,
	CASE WHEN fbcs.bif_ihc_her2 = 1 THEN
		'Positive'
	WHEN fbcs.bif_ihc_her2 = 2 THEN
		'Negative'
	END AS bif_ihc_her2,
	bif_ihc_ki67,
	fbcs.bif_assessment_notes
FROM
	etl.flat_breast_cancer_screening `fbcs`
	LEFT JOIN amrs.patient_identifier `pi` ON (fbcs.person_id = pi.patient_id)
		AND(pi.voided IS NULL || pi.voided = 0)
		AND pi.identifier_type IN(3, 8)
	LEFT JOIN amrs.person_name `pn` ON (fbcs.person_id = pn.person_id)
		AND(pn.voided IS NULL || pn.voided = 0)
WHERE
	fbcs.date_created BETWEEN 
  -- start date
	AND 
  -- end date
ORDER BY
	fbcs.date_created DESC;
	