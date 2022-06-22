


	IF EXISTS (SELECT * FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.ora_inizio = ora_inizio_param 
																				   AND p.ora_fine = ora_fine_param AND p.id_canale = id_canale_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Questo orario è già occupato da un altro programma';
	END IF;
    
    
    	IF (SELECT * FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param)
		THEN
			IF (SELECT * FROM `guida_tv`.`palinsesto` p WHERE p.id_canale = id_canale_param)
				THEN
					IF (SELECT * FROM `guida_tv`.`palinsesto` p WHERE p.ora_inizio = ora_inizio_param)
						THEN
							IF (SELECT * FROM `guida_tv`.`palinsesto` p WHERE p.ora_fine = ora_fine_param)
								THEN
									SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Questo orario è già occupato da un altro programma';
                            END IF;
                    END IF;
            END IF;
	END IF;
	