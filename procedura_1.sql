DROP PROCEDURE IF EXISTS `signUp`;

DELIMITER $

-- 1 > [Registrazione (inserimento dei dati del profilo) di un utente.] < --
CREATE PROCEDURE `signUp`(IN email_param VARCHAR(64), IN pwd_param VARCHAR(32), OUT result BOOLEAN)
BEGIN
		IF EXISTS (SELECT u.email FROM `guida_tv`.utente u WHERE u.email = email_param) 
    THEN
		SET result = false;
    ELSE
		INSERT INTO utente(`email`, `pwd`) VALUES (email_param, pwd_param);
        SET result = true;
	END IF;
END $

DELIMITER $

