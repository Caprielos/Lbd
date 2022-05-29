DROP PROCEDURE IF EXISTS `query_5`;

DELIMITER $

CREATE PROCEDURE `query_5` ()

BEGIN
	
    SELECT * FROM canale_preferito JOIN utente u ON u.id = canale_preferito.id_utente;
    
    SELECT * FROM programma_preferito JOIN utente u ON u.id = programma_preferito.id_utente;
    
    
END $

DELIMITER $

CALL `query_5` ();