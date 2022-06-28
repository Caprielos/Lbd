DROP PROCEDURE IF EXISTS `inserisci_attore`;

DELIMITER $

-- > [Procedura per inserire un attore.] < --
CREATE PROCEDURE `inserisci_attore`(IN nome_param VARCHAR(64), IN cognome_param VARCHAR(32), IN data_di_nascita_param DATE)
BEGIN
		IF (data_di_nascita_param > curdate()) 
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Forse hai sbagliato la data di nascita';
		END IF;
        
		IF EXISTS (SELECT * FROM `guida_tv`.persona p WHERE p.nome = nome_param AND p.cognome = cognome_param AND p.data_di_nascita = data_di_nascita_param)
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Attore già esistente';
		END IF;

		INSERT INTO `guida_tv`.persona(`nome`, `cognome`, `data_di_nascita`) VALUES (nome_param, cognome_param, data_di_nascita_param);
END $

DELIMITER $