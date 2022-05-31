DROP PROCEDURE IF EXISTS `guida_tv`.`query_3`;

DELIMITER $

CREATE PROCEDURE `guida_tv`.`query_3` (IN nome_canale_param VARCHAR(64))

BEGIN
    
	SELECT DISTINCT pal.ora_inizio,
					prog.titolo, 
                    pal.ora_fine, 
                    gen.nome 
	FROM `guida_tv`.palinsesto pal 
    
		JOIN `guida_tv`.canale can ON pal.id_canale = ( SELECT c.id FROM canale c WHERE c.nome = nome_canale_param )
		JOIN `guida_tv`.possiede pos ON pos.id_programma = pal.id_programma 
		JOIN `guida_tv`.genere gen ON pos.id_genere = gen.id
        JOIN `guida_tv`.programma prog ON prog.id = pal.id_programma
			
    WHERE pal.giorno = curdate() AND can.nome = nome_canale_param
    ORDER BY pal.ora_inizio ASC;
    
    
    
    -- SELECT * FROM `guida_tv`.programma prog 
		-- JOIN `guida_tv`.palinsesto pal ON prog.id = pal.id_programma 
		 -- JOIN `guida_tv`.canale can ON can.nome = nome_canale_param
		 -- JOIN `guida_tv`.possiede aa ON aa.id_programma = pal.id_programma 
		 -- JOIN `guida_tv`.genere gen ON gen.id = aa.id_programma 
     -- WHERE pal.giorno = curdate() ;
    
END $

DELIMITER $

CALL `query_3` ("Canale 4");
