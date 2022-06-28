DROP PROCEDURE IF EXISTS `guida_tv`.`query_6`;

DELIMITER $

-- 6 > [Eliminazione di un programma televisivo dal database.] < --
CREATE PROCEDURE `guida_tv`.`query_6` ( IN titolo_param VARCHAR(64), IN anno_uscita_param DATE, IN produttore_param VARCHAR(50),
										IN stagione_param TINYINT, IN episodio_param MEDIUMINT)


BEGIN
	DECLARE id_param INTEGER UNSIGNED;

	IF (stagione_param != NULL AND episodio_param != NULL)
		THEN
			-- E UN FILM
			SET id_param = (SELECT prog.id FROM `guida_tv`.`programma` prog WHERE prog.titolo = titolo_param AND prog.anno_uscita = anno_uscita_param 
																									 AND prog.produttore = produttore_param);
                                                                                                     
			IF NOT EXISTS (SELECT p.id FROM `guida_tv`.`programma` p WHERE id_param = 
														(SELECT pal.id_programma FROM `guida_tv`.`palinsesto` pal WHERE p.id = pal.id_programma LIMIT 1))
				THEN
					DELETE FROM `guida_tv`.`programma` prog WHERE (prog.`id` = id_param);
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Programma eliminato con successo';
				ELSE
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi cancellare una film che e inserita in un palinsesto';
			END IF;
	ELSE
			-- E UNA SERIE TV
            SET id_param = (SELECT prog.id FROM `guida_tv`.`programma` prog WHERE prog.titolo = titolo_param AND prog.anno_uscita = anno_uscita_param 
									AND prog.produttore = produttore_param AND prog.stagione = stagione_param AND prog.episodio = episodio_param);
                                    
			IF NOT EXISTS (SELECT p.id FROM `guida_tv`.`programma` p WHERE id_param = 
																(SELECT pal.id_programma FROM `guida_tv`.`palinsesto` pal WHERE p.id = pal.id_programma LIMIT 1))
				THEN
					DELETE FROM `guida_tv`.`programma`prog WHERE (prog.`id` = id_param);
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Serie tv eliminata con successo';
				ELSE
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi cancellare una serie tv che e inserita in un palinsesto';
			END IF;
				
	END IF;
END $


DELIMITER $
