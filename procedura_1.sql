DROP PROCEDURE IF EXISTS `guida_tv`.`query_1`;

DELIMITER $

-- 1 > [Registrazione (inserimento dei dati del profilo) di un utente.] < --
CREATE PROCEDURE `query_1`(IN email_param VARCHAR(64), IN pwd_param VARCHAR(32))
BEGIN
		IF (SELECT email_param NOT REGEXP '[a-zA-Z0-9._-].*@[a-zA-Z0-9._-].*\\.[a-zA-Z0-9].')
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'email inserita non corretta';
			ELSE
				INSERT INTO `guida_tv`.utente(`email`, `pwd`) VALUES (email_param, pwd_param);
		END IF;
END $

DELIMITER $

