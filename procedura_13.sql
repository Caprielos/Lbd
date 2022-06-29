DROP PROCEDURE IF EXISTS `guida_tv`.`query_13`;

DELIMITER $

-- > [Inserimento canale.] < -- 
CREATE PROCEDURE `query_13`(IN nome_param VARCHAR(64), IN numero_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.canale(`nome`, `numero`) VALUES (nome_param, numero_param);
END $





