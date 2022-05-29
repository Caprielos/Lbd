DROP PROCEDURE IF EXISTS `query_11`;

DELIMITER $

CREATE PROCEDURE `query_11` (IN email_param VARCHAR(64))

BEGIN
	
	SELECT u.email, canale_preferito.id_canale, canale_preferito.fascia_oraria
    FROM canale_preferito JOIN utente u ON u.id = canale_preferito.id_utente
    WHERE u.id = (SELECT u.id FROM utente u WHERE u.email = email_param);
    
	SELECT u.email, programma_preferito.id_programma, programma_preferito.fascia_oraria
    FROM programma_preferito JOIN utente u ON u.id = programma_preferito.id_utente
    WHERE u.id = (SELECT u.id FROM utente u WHERE u.email = email_param);
    
       
END $

DELIMITER $

CALL `query_11` ("g");