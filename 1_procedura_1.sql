DROP PROCEDURE IF EXISTS `guida_tv`.`signUp`;

DELIMITER $

-- 1 > [Registrazione (inserimento dei dati del profilo) di un utente.] < --
CREATE PROCEDURE `signUp`(IN email_param VARCHAR(64), IN pwd_param VARCHAR(32))
BEGIN
		IF NOT EXISTS (SELECT u.email FROM `guida_tv`.utente u WHERE u.email = email_param)
    THEN
		INSERT INTO utente(`email`, `pwd`) VALUES (email_param, pwd_param);
	END IF;
END $

DELIMITER $

