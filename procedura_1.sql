DROP PROCEDURE IF EXISTS `guida_tv`.`signUp`;
DROP PROCEDURE IF EXISTS `guida_tv`.`validate_email`;
DROP TRIGGER IF EXISTS `guida_tv`.`trigger_email`;

DELIMITER $

-- 1 > [Registrazione (inserimento dei dati del profilo) di un utente.] < --
CREATE PROCEDURE `signUp`(IN email_param VARCHAR(64), IN pwd_param VARCHAR(32))
BEGIN
		INSERT INTO `guida_tv`.utente(`email`, `pwd`) VALUES (email_param, pwd_param);
END $


-- > [Procedura per validare l'email.] < --
CREATE PROCEDURE `validate_email`(
	IN email_param VARCHAR(64),
    IN pwd_param VARCHAR(32)
)

DETERMINISTIC
NO SQL
BEGIN
	IF (SELECT email_param NOT REGEXP '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,63}$')
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'email inserita non corretta';
	END IF;
    
END$


-- > [Trigger per validare l'email.] < --
CREATE TRIGGER `trigger_email` BEFORE INSERT ON utente FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_email`(NEW.email, NEW.pwd);
END$

DELIMITER $

