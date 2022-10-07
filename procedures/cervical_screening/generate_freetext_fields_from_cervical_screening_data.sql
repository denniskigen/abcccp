CREATE PROCEDURE `generate_flat_cervical_cancer_screening_freetexts`(IN query_type VARCHAR(50), IN queue_number INT, IN queue_size INT, IN cycle_size INT)
BEGIN
    -- Replace all occurrences of cervical_cancer_screening_freetexts with the name of your flat table. A simple find and replace should work fine.
    SET @primary_table := "flat_cervical_cancer_screening_freetexts";
    SET @query_type := query_type;
                     
    SET @total_rows_written := 0;
                    
    SET @encounter_types := "(69, 70, 149)";
    
    SET @start := NOW();
    SET @table_version := "flat_cervical_cancer_screening_freetexts_v1.0";

    SET session sort_buffer_size := 512000000;

    SET @sep := " ## ";
    SET @boundary := "!!";
    SET @last_date_created := (SELECT MAX(max_date_created) FROM etl.flat_obs);

    CREATE TABLE IF NOT EXISTS flat_cervical_cancer_screening_freetexts (
        date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        -- IMPORTANT - Remember that the order of these columns matters greatly. It has to match exactly with the columns main temporary table you create 
        -- as well as what will be replaced into the write table at the end.

        -- Lines 24 to 28 are some of the more common columns required for our flat tables; feel free to add/remove as you see fit
        person_id INT,
        encounter_id INT,
        encounter_type INT,
        location_id INT,
        location_name VARCHAR(100),
	    	encounter_datetime DATETIME,
        -- Lines 31 to 42 are derived columns; these are usually derived from obs or joins to existing tables; feel free to add/remove as you see fit
        via_management_plan_freetext VARCHAR(1000),
        other_via_procedure_done VARCHAR(1000),
        other_biopsy_result_freetext VARCHAR(1000),
        past_treatment_of_dysplasia_freetext VARCHAR(500),
        dysplasia_procedure_done_freetext VARCHAR(500),
        dysplasia_management_plan_freetext VARCHAR(1000),
        lab_test_freetext VARCHAR(500),
        -- Specifying primary key and indices
        PRIMARY KEY encounter_id (encounter_id),
        INDEX date_created (date_created)
    );

    -- Build step
    IF (@query_type = "build") THEN
        SELECT 'BUILDING..........................................';
							
        SET @write_table := CONCAT('flat_cervical_cancer_screening_freetexts_temp_', queue_number);
        SET @queue_table := CONCAT('flat_cervical_cancer_screening_freetexts_build_queue_', queue_number);

        SET @dyn_sql := CONCAT('CREATE TABLE IF NOT EXISTS ', @write_table, ' LIKE ', @primary_table);
        PREPARE s1 FROM @dyn_sql; 
        EXECUTE s1; 
        DEALLOCATE PREPARE s1;  

        SET @dyn_sql := CONCAT('CREATE TABLE IF NOT EXISTS ', @queue_table, ' (SELECT * FROM flat_cervical_cancer_screening_freetexts_build_queue LIMIT ', queue_size, ');'); 
        PREPARE s1 FROM @dyn_sql; 
        EXECUTE s1; 
        DEALLOCATE PREPARE s1;

	SET @dyn_sql=CONCAT('DELETE t1 from flat_cervical_cancer_screening_freetexts_build_queue t1 join ', @queue_table, ' t2 using (person_id);'); 
        PREPARE s1 from @dyn_sql; 
        EXECUTE s1; 
        DEALLOCATE PREPARE s1; 
    END IF;

    -- Sync step
    IF (@query_type = 'sync') THEN
        SELECT 'SYNCING.....................................';
        
        SET @write_table := 'flat_cervical_cancer_screening_freetexts';
        SET @queue_table := 'flat_cervical_cancer_screening_freetexts_sync_queue';

        CREATE TABLE IF NOT EXISTS flat_cervical_cancer_screening_freetexts_sync_queue (person_id INT PRIMARY KEY);
        
        SET @last_update := null;

        SELECT MAX(date_updated) INTO @last_update FROM etl.flat_log WHERE table_name = @table_version;

        SELECT 'Finding patients in amrs.encounters...';
            REPLACE INTO flat_cervical_cancer_screening_freetexts_sync_queue
            (SELECT DISTINCT
                patient_id
              FROM
                amrs.encounter
              WHERE 
                date_changed > @last_update
            );

        SELECT 'Finding patients in flat_obs...';
            REPLACE INTO flat_cervical_cancer_screening_freetexts_sync_queue
            (SELECT DISTINCT
                person_id
              FROM
                etl.flat_obs
              WHERE
                max_date_created > @last_update
            );

        SELECT 'Finding patients in flat_lab_obs...';
            REPLACE INTO flat_cervical_cancer_screening_freetexts_sync_queue
            (SELECT DISTINCT
                person_id
              FROM
                etl.flat_lab_obs
              WHERE
                max_date_created > @last_update
            );

        SELECT 'Finding patients in flat_orders...';
            REPLACE INTO flat_cervical_cancer_screening_freetexts_sync_queue
            (SELECT DISTINCT
                person_id
              FROM
                etl.flat_orders
              WHERE
                max_date_created > @last_update
            );

            REPLACE INTO flat_cervical_cancer_screening_freetexts_sync_queue
            (SELECT 
                person_id
              FROM 
		            amrs.person 
	            WHERE 
                date_voided > @last_update
            );

            REPLACE INTO flat_cervical_cancer_screening_freetexts_sync_queue
            (SELECT 
                person_id
              FROM 
		            amrs.person 
	            WHERE 
                date_changed > @last_update
            );
    END IF;

    -- Remove test patients
    SET @dyn_sql := CONCAT('DELETE t1 FROM ', @queue_table, ' t1
        JOIN amrs.person_attribute t2 USING (person_id)
        WHERE t2.person_attribute_type_id = 28 AND value = "true" AND voided = 0');
    PREPARE s1 FROM @dyn_sql; 
    EXECUTE s1; 
    DEALLOCATE PREPARE s1;
                    
    SET @person_ids_count = 0;
    SET @dyn_sql=CONCAT('SELECT COUNT(*) INTO @person_ids_count FROM ', @queue_table); 
    PREPARE s1 from @dyn_sql; 
    EXECUTE s1; 
    DEALLOCATE PREPARE s1;

    SELECT @person_ids_count AS 'num of patients to update';

    SET @dyn_sql := CONCAT('DELETE t1 FROM ',@primary_table, ' t1 JOIN ', @queue_table,' t2 USING (person_id);'); 
    PREPARE s1 FROM @dyn_sql; 
    EXECUTE s1; 
    DEALLOCATE PREPARE s1;  
 
    SET @person_ids_count = 0;
    SET @dyn_sql := CONCAT('SELECT COUNT(*) INTO @person_ids_count FROM ', @queue_table); 
    PREPARE s1 FROM @dyn_sql; 
    EXECUTE s1; 
    DEALLOCATE PREPARE s1;

    SELECT @person_ids_count AS 'num patients to update';

    SET @dyn_sql := CONCAT('DELETE t1 FROM ', @primary_table, ' t1 join ', @queue_table,' t2 USING (person_id);'); 
    PREPARE s1 FROM @dyn_sql; 
    EXECUTE s1; 
    DEALLOCATE PREPARE s1;

    DROP TEMPORARY TABLE IF EXISTS cervical_cancer_freetext_obs;
    SET @dyn_sql := CONCAT(
      "CREATE TEMPORARY TABLE IF NOT EXISTS cervical_cancer_freetext_obs (SELECT e.patient_id,
        CONCAT('## !!', g.concept_id, '=', o.value_text, '!!') AS obs_string FROM amrs.encounter `e`
        LEFT JOIN
          amrs.obs `o` ON (o.encounter_id = e.encounter_id AND (o.concept_id = 1915))
        LEFT JOIN
          amrs.obs `g` ON (g.obs_id = o.obs_group_id)
        WHERE
          e.encounter_type IN (69, 70, 147)
        GROUP BY e.encounter_id);"
    );

    PREPARE s1
    FROM @dyn_sql;
    EXECUTE s1;
    DEALLOCATE PREPARE s1;
                    
    SET @total_time = 0;
    SET @cycle_number = 0;
    
    WHILE @person_ids_count > 0 DO
        SET @loop_start_time := NOW();

        -- Create temporary table with a set of person ids             
        DROP TEMPORARY TABLE IF EXISTS flat_cervical_cancer_screening_freetexts_build_queue__0;

        SET @dyn_sql := CONCAT('CREATE TEMPORARY TABLE flat_cervical_cancer_screening_freetexts_build_queue__0 (person_id INT PRIMARY KEY) (SELECT * FROM ', @queue_table, ' LIMIT ', cycle_size, ');');
        PREPARE s1 FROM @dyn_sql; 
        EXECUTE s1; 
        DEALLOCATE PREPARE s1;  
                    
        DROP TEMPORARY TABLE IF EXISTS flat_cervical_cancer_screening_freetexts_0a;
        SET @dyn_sql := CONCAT(
            'CREATE TEMPORARY TABLE flat_cervical_cancer_screening_freetexts_0a
            (SELECT 
                t1.person_id,
                t1.encounter_id,
                t1.encounter_datetime,
				        t1.encounter_type,
                t1.location_id,
                t1.obs,
                t1.obs_datetimes,
                t2.orders
            FROM
                etl.flat_obs t1
                    JOIN
                flat_cervical_cancer_screening_freetexts_build_queue__0 t0 USING (person_id)
                    LEFT JOIN
                etl.flat_orders t2 USING (encounter_id)
            WHERE
                t1.encounter_type IN ', @encounter_types, ');');
                            
        PREPARE s1 from @dyn_sql; 
        EXECUTE s1; 
        DEALLOCATE PREPARE s1;  

        INSERT INTO flat_cervical_cancer_screening_freetexts_0a
        (SELECT
            t1.person_id,
            t1.encounter_id,
            t1.test_datetime,
            t1.encounter_type,
	          null,
            t1.obs,
            null,
            null
        FROM 
          etl.flat_lab_obs t1
              JOIN
          flat_cervical_cancer_screening_freetexts_build_queue__0 t0 USING (person_id)
        );

        DROP TEMPORARY TABLE IF EXISTS flat_cervical_cancer_screening_freetexts_0;
        CREATE TEMPORARY TABLE flat_cervical_cancer_screening_freetexts_0 (INDEX encounter_id (encounter_id), INDEX person_enc (person_id, encounter_datetime))
        (SELECT 
            * 
        FROM
          flat_cervical_cancer_screening_freetexts_0a
        ORDER BY
          person_id, DATE(encounter_datetime)
        );
                        
        SET @via_management_plan_freetext := null;
        SET @other_via_procedure_done := null;
        SET @other_biopsy_result_freetext := null;
        SET @past_treatment_of_dysplasia_freetext := null;
        SET @dysplasia_procedure_done_freetext := null;
        SET @dysplasia_management_plan_freetext := null;
        SET @lab_test_freetext := null;

        DROP TEMPORARY TABLE IF EXISTS flat_cervical_cancer_screening_freetexts_1;

        CREATE TEMPORARY TABLE flat_cervical_cancer_screening_freetexts_1
        (SELECT 
              obs,
              @prev_id := @cur_id as prev_id,
              @cur_id := t1.person_id as cur_id,
              t1.person_id,
              t1.encounter_id,
              t1.encounter_type,
              t1.location_id,
              l.name AS location_name,
              t1.encounter_datetime,
              case
                when t1.encounter_type = 69 and obs regexp "!!1915=" then @via_management_plan_freetext := GetValues(ccfo.obs_string, 7367)
                else @via_management_plan_freetext := null
              end as via_management_plan_freetext,
                            case
                when t1.encounter_type = 69 and obs regexp "!!1915=" then @other_via_procedure_done := GetValues(ccfo.obs_string, 7480)
                else @other_via_procedure_done := null
              end as other_via_procedure_done,
                           case
                when t1.encounter_type = 70 and obs regexp "!!7400=" then @other_biopsy_result_freetext := GetValues(obs, 7400)
                else @other_biopsy_result_freetext := null
              end as other_biopsy_result_freetext,
                            case
                when t1.encounter_type = 70 and obs regexp "!!1915=" then @past_treatment_of_dysplasia_freetext := GetValues(ccfo.obs_string, 7580)
                else @past_treatment_of_dysplasia_freetext := null
              end as past_treatment_of_dysplasia_freetext,
                            case
                when t1.encounter_type = 70 and obs regexp "!!1915=" then @dysplasia_procedure_done_freetext := GetValues(ccfo.obs_string, 7480)
                else @dysplasia_procedure_done_freetext := null
              end as dysplasia_procedure_done_freetext,
                            case
                when t1.encounter_type = 70 and obs regexp "!!1915=" then @dysplasia_management_plan_freetext := GetValues(ccfo.obs_string, 7367)
                else @dysplasia_management_plan_freetext := null
              end as dysplasia_management_plan_freetext,
                            case
                when t1.encounter_type = 147 and obs regexp "!!9538=" then @lab_test_freetext := GetValues(obs, 9538)
                else @lab_test_freetext := null
              end as lab_test_freetext

          FROM 
              flat_cervical_cancer_screening_freetexts_0 t1
			    JOIN amrs.person p using (person_id)
		      LEFT JOIN
		          amrs.location `l` ON l.location_id = t1.location_id
          LEFT JOIN 
              cervical_cancer_freetext_obs `ccfo` ON t1.person_id = ccfo.patient_id
   	      ORDER BY person_id, date(encounter_datetime) DESC
  	    );

          SET @prev_id = null;
          SET @cur_id = null;
						
          ALTER TABLE flat_cervical_cancer_screening_freetexts_1 DROP prev_id, DROP cur_id;

	        SELECT 
              COUNT(*)
          INTO 
              @new_encounter_rows
          FROM
              flat_cervical_cancer_screening_freetexts_1;
                              
          SELECT @new_encounter_rows;
          SET @total_rows_written := @total_rows_written + @new_encounter_rows;
          SELECT @total_rows_written;

          -- IMPORTANT: Column order matters. Must match what has been set in lines 22 - 50.
          -- date_created column represented by null - will be given appropriate value later
          SET @dyn_sql := CONCAT('REPLACE INTO ', @write_table, 										  
              '(SELECT
                    null,
                    person_id,
                    encounter_id,
                    encounter_type,
                    location_id,
					          location_name,
                    encounter_datetime,
                  via_management_plan_freetext,
                  other_via_procedure_done,
                  other_biopsy_result_freetext,
                  past_treatment_of_dysplasia_freetext,
                  dysplasia_procedure_done_freetext,
                  dysplasia_management_plan_freetext,
                  lab_test_freetext
                FROM 
                    flat_cervical_cancer_screening_freetexts_1 t1
                        JOIN 
                    amrs.location t2 USING (location_id))'
          );

          PREPARE s1 from @dyn_sql; 
          EXECUTE s1; 
          DEALLOCATE PREPARE s1;


          SET @dyn_sql=CONCAT('DELETE t1 from ',@queue_table,' t1 JOIN flat_cervical_cancer_screening_freetexts_build_queue__0 t2 USING (person_id);'); 
          PREPARE s1 from @dyn_sql; 
          EXECUTE s1; 
          DEALLOCATE PREPARE s1;  
                                
          SET @dyn_sql=CONCAT('SELECT COUNT(*) INTO @person_ids_count FROM ',@queue_table,';'); 
          PREPARE s1 from @dyn_sql; 
          EXECUTE s1; 
          DEALLOCATE PREPARE s1;  
                    
          SET @cycle_length = TIMESTAMPDIFF(second,@loop_start_time,NOW());
          SET @total_time = @total_time + @cycle_length;
          SET @cycle_number = @cycle_number + 1;
          
          SET @remaining_time = ceil((@total_time / @cycle_number) * ceil(@person_ids_count / cycle_size) / 60);

          SELECT 
            @person_ids_count AS 'persons remaining',
            @cycle_length AS 'Cycle time (s)',
            CEIL(@person_ids_count / cycle_size) AS remaining_cycles,
            @remaining_time AS 'Est time remaining (min)';
    END WHILE;

    IF (@query_type = 'build') THEN
        SET @dyn_sql := CONCAT('drop table ', @queue_table, ';'); 
        PREPARE s1 FROM @dyn_sql; 
        EXECUTE s1; 
        DEALLOCATE PREPARE s1;  
                        
        SET @total_rows_to_write := 0;
        SET @dyn_sql := CONCAT('SELECT COUNT(*) INTO @total_rows_to_write FROM ', @write_table);
        PREPARE s1 FROM @dyn_sql; 
        EXECUTE s1; 
        DEALLOCATE PREPARE s1;
                                                
        SET @start_write := NOW();
        SELECT CONCAT(@start_write, ' : Writing ', @total_rows_to_write, ' to ', @primary_table);

        SET @dyn_sql := CONCAT('REPLACE INTO ', @primary_table, '(SELECT * FROM ', @write_table, ');');
        PREPARE s1 FROM @dyn_sql; 
        EXECUTE s1; 
        DEALLOCATE PREPARE s1;
						
        SET @finish_write := NOW();
        SET @time_to_write := TIMESTAMPDIFF(SECOND, @start_write, @finish_write);
        SELECT CONCAT(@finish_write, ' : Completed writing rows. Time to write to primary table: ', @time_to_write, ' seconds ');                        
        
        SET @dyn_sql := CONCAT('DROP TABLE ', @write_table, ';'); 
        PREPARE s1 FROM @dyn_sql;
        EXECUTE s1; 
        DEALLOCATE PREPARE s1;      
    END IF;
						
    SET @ave_cycle_length := CEIL(@total_time / @cycle_number);
    SELECT CONCAT('Average Cycle Length: ', @ave_cycle_length, ' second(s)');
            
    SET @end := NOW();
    INSERT INTO etl.flat_log VALUES (@start, @last_date_created, @table_version, TIMESTAMPDIFF(SECOND, @start, @end));
    SELECT CONCAT(@table_version, ': Time to complete: ', TIMESTAMPDIFF(MINUTE, @start, @end), ' minutes');
END