DROP PROCEDURE IF EXISTS `guida_tv`.`signUp`;

DELIMITER $

-- 1 > [Registrazione (inserimento dei dati del profilo) di un utente.] < --
CREATE PROCEDURE `signUp`(IN email_param VARCHAR(64), IN pwd_param VARCHAR(32))
BEGIN
		INSERT INTO `guida_tv`.utente(`email`, `pwd`) VALUES (email_param, pwd_param);
END $




DELIMITER $

