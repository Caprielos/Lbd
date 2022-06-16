DROP PROCEDURE IF EXISTS `guida_tv`.`canali_preferiti`;
DROP PROCEDURE IF EXISTS `guida_tv`.`programmi_preferiti`;

DELIMITER $

-- 5A > [Lista dei canali maggiormente “preferiti” dagli utenti.] < --
CREATE PROCEDURE `guida_tv`.`canali_preferiti` ()

BEGIN
	
    SELECT * FROM  `guida_tv`.canale_preferito JOIN utente u ON u.id = canale_preferito.id_utente;  
    
END $

-- 5B > [Lista dei programmi maggiormente “preferiti” dagli utenti.] < --
CREATE PROCEDURE `guida_tv`.`programmi_preferiti` ()

BEGIN
	
    SELECT * FROM  `guida_tv`.programma_preferito JOIN utente u ON u.id = programma_preferito.id_utente;
    
END $


DELIMITER $
CALL programmi_preferiti


