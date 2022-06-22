DROP PROCEDURE IF EXISTS `guida_tv`.`inserisci_canale`;
DROP PROCEDURE IF EXISTS `inserisci_attore`;
DROP PROCEDURE IF EXISTS `guida_tv`.`genera_palinsesto`;

DELIMITER $

-- > [Inserimento canale.] < -- 
CREATE PROCEDURE `inserisci_canale`(IN nome_param VARCHAR(64), IN numero_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.canale(`nome`, `numero`) VALUES (nome_param, numero_param);
END $

-- > [Procedura per inserire un attore.] < --
CREATE PROCEDURE `inserisci_attore`(IN nome_param VARCHAR(64), IN cognome_param VARCHAR(32), IN data_di_nascita_param DATE)
BEGIN
		IF (data_di_nascita_param > curdate() ) 
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Forse hai sbagliato la data di nascita';
		END IF;
        
		IF EXISTS (SELECT * FROM `guida_tv`.persona p WHERE p.nome = nome_param AND p.cognome = cognome_param AND p.data_di_nascita = data_di_nascita_param)
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Attore già esistente';
		END IF;

		INSERT INTO `guida_tv`.persona(`nome`, `cognome`, `data_di_nascita`) VALUES (nome_param, cognome_param, data_di_nascita_param);
END $

-- > [Generazione del palinsesto.] < -- 
CREATE PROCEDURE `genera_palinsesto`(IN giorno_param DATE, IN ora_inizio_param TIME,  IN ora_fine_param TIME, IN id_canale_param INTEGER, IN id_programma_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`)
        VALUES (giorno_param, ora_inizio_param, ora_fine_param , id_canale_param, id_programma_param);
END $

DELIMITER $