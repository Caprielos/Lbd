DROP PROCEDURE IF EXISTS `query_6`;

DELIMITER $

CREATE PROCEDURE `query_6` ( IN titolo_param VARCHAR(64), IN anno_uscita_param DATE, IN produttore_param VARCHAR(50),
							 IN stagione_param TINYINT, IN episodio_param MEDIUMINT, OUT result BOOLEAN )


BEGIN
	IF (stagione_param != NULL AND episodio_param != NULL)
		THEN
			-- E UN FILM
            DELETE FROM programma WHERE programma.titolo = titolo_param AND programma.anno_uscita = anno_uscita_param 
										AND programma.produttore = produttore_param;
            
            SET result = true;
		ELSE
			-- E UNA SERIE TV
			DELETE FROM programma WHERE programma.titolo = titolo_param AND programma.anno_uscita = anno_uscita_param 
										AND programma.produttore = produttore_param AND programma.stagione = stagione_param
                                        AND programma.episodio = episodio_param;
            
            SET result = false;
            
		END IF;
END $


DELIMITER $

CALL `query_6` ("Film 1", '1950-05-26' , "Io", NULL, NULL , @result);
SELECT @result;

