DROP PROCEDURE IF EXISTS `query_4`;

DELIMITER $

CREATE PROCEDURE `query_4` ( IN nome_serie_param VARCHAR(64), OUT result BOOLEAN)

BEGIN
	
    
     SELECT * FROM canale can JOIN palinsesto pal ON pal.id_canale = can.id JOIN programma prog ON prog.titolo = nome_serie_param;
    
	SET result = true;
    
END $

DELIMITER $


CALL `query_4` ("Serie 1", @res);
SELECT @res