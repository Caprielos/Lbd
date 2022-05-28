DROP PROCEDURE IF EXISTS `query_4`;

DELIMITER $

CREATE PROCEDURE `query_5` ()

BEGIN
	
    SELECT * FROM canale_preferito;
    
    
END $

DELIMITER $

CALL `query_5` ();