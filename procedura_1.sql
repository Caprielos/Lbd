DROP PROCEDURE IF EXISTS `guida_tv`.`signUp`;

DELIMITER $

-- 1 > [Registrazione (inserimento dei dati del profilo) di un utente.] < --
CREATE PROCEDURE `signUp`(IN email_param VARCHAR(64), IN pwd_param VARCHAR(32), IN fascia_email_param ENUM ('Mattina', 'Pomeriggio', 'Sera') )
BEGIN

		IF (SELECT email_param NOT REGEXP '[a-zA-Z0-9._-].*@[a-zA-Z0-9._-].*\\.[a-zA-Z0-9].')
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'email inserita non corretta';
			ELSE
				INSERT INTO `guida_tv`.utente(`email`, `pwd`, `orario_email`) VALUES (email_param, pwd_param, fascia_email_param);
	END IF;
        
END $

DELIMITER $

