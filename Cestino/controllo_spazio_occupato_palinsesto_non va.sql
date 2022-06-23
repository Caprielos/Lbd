	IF EXISTS (SELECT p.id FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.id_canale = id_canale_param AND p.ora_inizio = ora_inizio_param AND
															p.ora_fine = ora_fine_param
    
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
    
    
    
	IF ( (SELECT p.ora_fine FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.id_canale = id_canale_param) > ora_inizio_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi inserire questo programma nell\' nello spazio di un altro';
	END IF;
    
    
    DELIMITER $

-- > [Trigger per validare l'inserimento di un palinsesto.] < --
CREATE TRIGGER `trigger_palinsesto` BEFORE INSERT ON `guida_tv`.`palinsesto` FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_palinsesto`(NEW.giorno, NEW.ora_inizio, NEW.ora_fine, NEW.id_programma, NEW.id_canale);
END$

DELIMITER $;
	