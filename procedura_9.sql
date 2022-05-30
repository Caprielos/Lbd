DROP PROCEDURE IF EXISTS `query_9`;

DELIMITER $

CREATE PROCEDURE `query_9` ( IN giorno_param DATE )

BEGIN
	
	SELECT DISTINCT pal.ora_inizio,
					prog.id,
					prog.titolo, 
                    pal.ora_fine,
                    pal.giorno,
                    can.nome,
                    gen.nome 
	FROM `guida_tv`.palinsesto pal 
    
		JOIN `guida_tv`.canale can ON pal.id_canale = can.id
		JOIN `guida_tv`.possiede pos ON pos.id_programma = pal.id_programma 
		JOIN `guida_tv`.genere gen ON pos.id_genere = gen.id
        JOIN `guida_tv`.programma prog ON prog.id = pal.id_programma
			
    WHERE pal.giorno = (giorno_param);
    
    
END $

DELIMITER $

CALL `query_9` ('2022-05-30');
CALL `query_9` ('2022-05-30');
CALL `query_9` ('2022-05-30');
CALL `query_9` ('2022-05-30');

