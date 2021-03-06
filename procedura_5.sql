DROP PROCEDURE IF EXISTS `guida_tv`.`query_5A`;
DROP PROCEDURE IF EXISTS `guida_tv`.`query_5B`;

DELIMITER $

-- 5A > [Lista dei canali maggiormente “preferiti” dagli utenti.] < --
CREATE PROCEDURE `guida_tv`.`query_5A` ()

BEGIN
 
	SELECT id_canale, COUNT(id_canale) FROM `guida_tv`.`canale_preferito`
	GROUP BY id_canale
	HAVING COUNT(id_canale) > 1;
    
END $

-- 5B > [Lista dei programmi maggiormente “preferiti” dagli utenti.] < --
CREATE PROCEDURE `guida_tv`.`query_5B` ()

BEGIN
	
    SELECT id_programma, COUNT(id_programma) FROM `guida_tv`.`programma_preferito` 
	GROUP BY id_programma
	HAVING COUNT(id_programma) > 1;
    
END $


DELIMITER $



