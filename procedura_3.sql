DROP PROCEDURE IF EXISTS `guida_tv`.`query_3`;

DELIMITER $

-- 3 > [Generazione del palinsesto odierno di un canale.] < --
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
			
END $

DELIMITER $
