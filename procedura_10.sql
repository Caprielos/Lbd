DROP PROCEDURE IF EXISTS `guida_tv`.`query_10`;

DELIMITER $

-- 10 > [Minuti totali di programmazione per un certo canale in un certo giorno.] < --
CREATE PROCEDURE `guida_tv`.`query_10` ( IN nome_canale_param VARCHAR(64), IN giorno_param DATE, OUT res TIME )

BEGIN
	   
	SELECT  SEC_TO_TIME( SUM( TIME_TO_SEC( `durata` ) ) ) 
    FROM `guida_tv`.palinsesto pal 
	JOIN `guida_tv`.canale can ON pal.id_canale = ( SELECT c.id FROM canale c WHERE c.nome = nome_canale_param )
	JOIN `guida_tv`.programma prog ON prog.id = pal.id_programma
    WHERE pal.giorno = giorno_param AND can.nome = nome_canale_param;
		
END $

DELIMITER $
