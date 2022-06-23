DROP PROCEDURE IF EXISTS `guida_tv`.`query_6`;

DELIMITER $

-- 6 > [Eliminazione di un programma televisivo dal database.] < --
CREATE PROCEDURE `guida_tv`.`query_6` ( IN titolo_param VARCHAR(64), IN anno_uscita_param DATE, IN produttore_param VARCHAR(50),
										IN stagione_param TINYINT, IN episodio_param MEDIUMINT)

BEGIN



	IF (stagione_param != NULL AND episodio_param != NULL)
		THEN
			-- E UN FILM
		
	SET id_delete =	(SELECT p.id FROM programma p WHERE p.id = 8 AND p.id = 
								(SELECT pal.id_programma FROM palinsesto pal WHERE p.id = pal.id_programma LIMIT 1));
          
	
     
    
	DELETE FROM `guida_tv`.programma WHERE programma.titolo = titolo_param AND programma.anno_uscita = anno_uscita_param 
								 AND programma.produttore = produttore_param;
		
                    
	IF()
            
            
            DELETE FROM `guida_tv`.programma WHERE programma.titolo = titolo_param AND programma.anno_uscita = anno_uscita_param 
											 AND programma.produttore = produttore_param;
									
END $

	DECLARE id_delete INTEGER UNSIGNED;
    DECLARE id_parametro INTEGER UNSIGNED;
		
	SET id_delete =	(SELECT p.id FROM programma p WHERE p.id = 8 AND p.id = 
							(SELECT pal.id_programma FROM palinsesto pal WHERE p.id = pal.id_programma LIMIT 1));
                    
             

DELIMITER $

CALL `query_6` ("Film 1", '1950-05-26' , "Io", NULL, NULL);
SELECT @result;

