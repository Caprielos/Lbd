DROP PROCEDURE IF EXISTS `query_10`;

DELIMITER $

CREATE PROCEDURE `query_10` ( IN nome_canale_param VARCHAR(64), IN giorno_param DATE, OUT res INTEGER(50) )

BEGIN
	   
	SELECT DISTINCT SUM(durata)
    -- SELECT SEC_TO_TIME(durata / 100)
	FROM `guida_tv`.palinsesto pal 
	JOIN `guida_tv`.canale can ON pal.id_canale = ( SELECT c.id FROM canale c WHERE c.nome = nome_canale_param )
	JOIN `guida_tv`.programma prog ON prog.id = pal.id_programma
    WHERE pal.giorno = giorno_param AND can.nome = nome_canale_param;
		
END $

DELIMITER $

CALL `query_10` ("Rai 1", '2022-05-30', @res);