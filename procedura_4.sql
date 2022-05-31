DROP PROCEDURE IF EXISTS `query_4`;

DELIMITER $

CREATE PROCEDURE `query_4` ( IN nome_serie_param VARCHAR(64))

BEGIN
	
 
    SELECT  can.nome, pal.giorno, pal.ora_inizio, pal.ora_fine, prog.id
    FROM `guida_tv`.palinsesto pal
	JOIN `guida_tv`.programma prog ON pal.id_programma = prog.id
	JOIN `guida_tv`.canale can ON pal.id_canale = can.id
    WHERE prog.stagione != 0 AND prog.titolo = nome_serie_param ORDER BY pal.giorno ASC;
	-- WHERE prog.id = (SELECT p.id FROM `guida_tv`.programma p WHERE p.titolo = nome_serie_param);
END $

DELIMITER $

CALL `query_4` ("Games of trones");