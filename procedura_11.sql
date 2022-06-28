DROP TABLE IF EXISTS new_tbl;
DROP PROCEDURE IF EXISTS `guida_tv`.`query_111`;

DELIMITER $

-- 11 > [Generazione della email giornaliera per un utente in base alle sue preferenze] < --
CREATE PROCEDURE `guida_tv`.`query_111` (IN id_param INTEGER UNSIGNED, IN email_param VARCHAR(64), OUT email_result TEXT)

BEGIN

	DECLARE ora_inizio TIME;
	DECLARE ora_fine TIME;
	DECLARE canale_nome VARCHAR(64);
	DECLARE programma_titolo VARCHAR(64);
    DECLARE count INTEGER UNSIGNED;
    
	DECLARE exit_loop BOOLEAN DEFAULT FALSE ;
    DECLARE curs CURSOR FOR SELECT * FROM new_tbl;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
    
	IF (SELECT c_p.fascia_oraria FROM canale_preferito c_p WHERE c_p.id_utente = id_param) = "Mattina"
		THEN
			SET ora_inizio  = '06:00:00';
			SET ora_fine    = '12:00:00';
    ELSEIF (SELECT c_p.fascia_oraria FROM canale_preferito c_p WHERE c_p.id_utente = id_param) = "Pomeriggio"
		THEN
			SET ora_inizio  = '12:00:00';
			SET ora_fine    = '18:00:00';
	ELSEIF (SELECT c_p.fascia_oraria FROM canale_preferito c_p WHERE c_p.id_utente = id_param) = "Sera"
		THEN
			SET ora_inizio  = '18:00:00';
			SET ora_fine    = '00:00:00';
    ELSEIF (SELECT c_p.fascia_oraria FROM canale_preferito c_p WHERE c_p.id_utente = id_param) = "Notte"
		THEN
			SET ora_inizio  = '00:00:00';
			SET ora_fine    = '06:00:00';
    END IF;
    
	CREATE TEMPORARY TABLE new_tbl
		SELECT can.nome, prog.titolo, pal.ora_inizio, pal.ora_fine FROM programma prog 
		JOIN programma_preferito prog_pref ON prog.id =  prog_pref.id_programma
		JOIN palinsesto pal ON prog.id = pal.id_programma
		JOIN canale_preferito can_pref ON pal.id_canale = can_pref.id_canale
		LEFT JOIN canale can ON pal.id_canale = can.id
		WHERE pal.ora_inizio >= ora_inizio AND pal.ora_fine <= ora_fine AND can_pref.id_utente = id_param AND prog_pref.id_utente = id_param 
        -- AND pal.giorno = curdate()
        ORDER BY pal.ora_inizio ASC;
        
		SET email_result = "Le ricordiamo che oggi al canale: ";
        SET count = 0;
        OPEN curs;
		iterator: LOOP            
			FETCH curs INTO canale_nome, programma_titolo, ora_inizio, ora_fine;
            SET count = count + 1;
			IF exit_loop  
				THEN
					CLOSE curs;
                    SET exit_loop = FALSE;
					LEAVE iterator;
            END IF;
            
			IF(count > 1)
				THEN
					SET email_result = CONCAT(email_result, " invece, ");
			END IF;
			SET email_result = CONCAT(email_result, canale_nome);
			SET email_result = CONCAT(email_result, " ci sarà in onda il programma ");
			SET email_result = CONCAT(email_result, programma_titolo);
			SET email_result = CONCAT(email_result, " a partire dalle ore ");
			SET email_result = CONCAT(email_result, ora_inizio);
			SET email_result = CONCAT(email_result, " fino alle ore ");
			SET email_result = CONCAT(email_result, ora_fine);

		END LOOP iterator; 
		DROP TABLE IF EXISTS new_tbl;

END $

DELIMITER $

CALL `query_111` (1 ,"diegidiogabriele@gmail.com", @email_result);
SELECT @email_result;