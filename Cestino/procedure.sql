
DROP PROCEDURE IF EXISTS `inserisci_canale`;
DROP PROCEDURE IF EXISTS `crea_palinsesto()`;


DELIMITER $

--  > [Crea canale.] < --
CREATE PROCEDURE `crea_canale`(IN nome_param VARCHAR(64), in numero_param INT, OUT result BOOLEAN)
BEGIN
	INSERT INTO `canale` (`nome`, `numero`) VALUES (nome_param, numero_param);
    SET result = true;
END $


--  > [Crea palinsesto.] < --
CREATE PROCEDURE `crea_palinsesto` (IN giorno_palinsesto_param DATE,
									IN ora_inizio_palinsesto_param TIME,
                                    IN ora_fine_palinsesto_param TIME,
                                    OUT result BOOLEAN
                                    )
BEGIN
	INSERT INTO `palinsesto` (`giorno`, `ora_inizio`, `ora_fine`) VALUES (giorno_palinsesto_param, ora_inizio_palinsesto_param, ora_fine_palinsesto_param);
END $





DELIMITER $