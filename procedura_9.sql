DROP PROCEDURE IF EXISTS `guida_tv`.`query_9`;

DELIMITER $

-- 9 > [Numero programmi distinti trasmessi da ciascuna emittente in un determinato giorno.] < --
CREATE PROCEDURE `guida_tv`.`query_9` ( IN giorno_param DATE )

BEGIN
	
	SELECT DISTINCT can.nome, COUNT(*)
	FROM `guida_tv`.palinsesto pal 
	JOIN `guida_tv`.canale can ON pal.id_canale = can.id
	JOIN `guida_tv`.possiede pos ON pos.id_programma = pal.id_programma 
	JOIN `guida_tv`.genere gen ON pos.id_genere = gen.id
    JOIN `guida_tv`.programma prog ON prog.id = pal.id_programma
    WHERE pal.giorno = (giorno_param)
    GROUP BY can.nome;
    
END $

DELIMITER $

CALL `query_9` ('2022-06-16');

