DROP PROCEDURE IF EXISTS `guida_tv`.`query_6`;

DELIMITER $

-- 6 > [Eliminazione di un programma televisivo dal database.] < --
CREATE PROCEDURE `guida_tv`.`query_6` ( IN titolo_param VARCHAR(64), IN anno_uscita_param DATE, IN produttore_param VARCHAR(50),
										IN stagione_param TINYINT, IN episodio_param MEDIUMINT, OUT result BOOLEAN )


BEGIN
	IF (stagione_param != NULL AND episodio_param != NULL)
		THEN
			-- E UN FILM
            DELETE FROM `guida_tv`.programma WHERE programma.titolo = titolo_param AND programma.anno_uscita = anno_uscita_param 
											 AND programma.produttore = produttore_param;
            
            SET result = true;
		ELSE
			-- E UNA SERIE TV
			DELETE FROM `guida_tv`.programma WHERE programma.titolo = titolo_param AND programma.anno_uscita = anno_uscita_param 
											 AND programma.produttore = produttore_param AND programma.stagione = stagione_param
											 AND programma.episodio = episodio_param;
            
            SET result = true;
            
		END IF;
END $


DELIMITER $

CALL `query_6` ("Film 1", '1950-05-26' , "Io", NULL, NULL , @result);
SELECT @result;

