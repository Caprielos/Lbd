DROP PROCEDURE IF EXISTS `guida_tv`.`canali_preferiti`;
DROP PROCEDURE IF EXISTS `guida_tv`.`programmi_preferiti`;

DELIMITER $

-- 5A > [Lista dei canali maggiormente “preferiti” dagli utenti.] < --
CREATE PROCEDURE `guida_tv`.`canali_preferiti` ()

BEGIN
 
	SELECT id_canale, COUNT(id_canale) FROM `guida_tv`.`canale_preferito`
	GROUP BY id_canale
	HAVING COUNT(id_canale) > 1;
    
END $

-- 5B > [Lista dei programmi maggiormente “preferiti” dagli utenti.] < --
CREATE PROCEDURE `guida_tv`.`programmi_preferiti` ()

BEGIN
	
    SELECT id_programma, COUNT(id_programma) FROM `guida_tv`.`programma_preferito` 
	GROUP BY id_programma
	HAVING COUNT(id_programma) > 1;
    
END $


DELIMITER $
CALL programmi_preferiti;



