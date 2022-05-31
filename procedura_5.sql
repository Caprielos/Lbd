DROP PROCEDURE IF EXISTS `query_5`;

DELIMITER $

CREATE PROCEDURE `query_5` ()

BEGIN
	
    SELECT * FROM  `guida_tv`.canale_preferito JOIN utente u ON u.id = canale_preferito.id_utente;
    
    SELECT * FROM  `guida_tv`.programma_preferito JOIN utente u ON u.id = programma_preferito.id_utente;
    
    
END $

DELIMITER $

CALL `query_5` ();