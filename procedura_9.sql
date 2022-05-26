DROP PROCEDURE IF EXISTS `query_9`;

DELIMITER $

CREATE PROCEDURE `query_9` ( IN nome_canale_param VARCHAR(64), OUT result BOOLEAN)

BEGIN
	
	SET result = true;
    
END $

DELIMITER $

CALL `query_9` ("Rai 1", @res);
SELECT @res
