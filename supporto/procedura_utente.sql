DROP PROCEDURE IF EXISTS `guida_tv`.`validate_email`;

DELIMITER $

-- > [Procedura per validare l'email.] < --
CREATE PROCEDURE `validate_email`(
	IN email_param VARCHAR(64),
    IN pwd_param VARCHAR(32)
)

BEGIN

	IF (SELECT email_param NOT REGEXP '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,63}$')
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'email inserita non corretta';
	END IF;
    
END$

DELIMITER $