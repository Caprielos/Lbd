DROP PROCEDURE IF EXISTS `guida_tv`.`validate_email`;
DROP TRIGGER IF EXISTS `guida_tv`.`validate_signUp`;

DELIMITER $

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
    
    IF EXISTS (SELECT u.email FROM `guida_tv`.utente u WHERE u.email = email_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'email inserita già esistente';
	END IF;
    
END$

CREATE TRIGGER `validate_signUp` BEFORE INSERT ON utente FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_email`(NEW.email, NEW.pwd);
	END$

DELIMITER $;