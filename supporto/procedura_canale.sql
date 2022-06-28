DROP PROCEDURE IF EXISTS `guida_tv`.`inserisci_canale`;

DELIMITER $

-- > [Inserimento canale.] < -- 
CREATE PROCEDURE `inserisci_canale`(IN nome_param VARCHAR(64), IN numero_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.canale(`nome`, `numero`) VALUES (nome_param, numero_param);
END $



call guida_tv.inserisci_canale('Rai 1', 1);
call guida_tv.inserisci_canale('Rai 2', 2);
call guida_tv.inserisci_canale('Rai 3', 3);
call guida_tv.inserisci_canale('Canale 4', 4);
call guida_tv.inserisci_canale('Canale 5', 5);
call guida_tv.inserisci_canale('Italia 1', 6);

