DROP TRIGGER IF EXISTS `guida_tv`.`trigger_email`;
DROP TRIGGER IF EXISTS `guida_tv`.`trigger_actor`;
DROP TRIGGER IF EXISTS `guida_tv`.`trigger_palinsesto`;

DELIMITER $

-- > [Trigger per validare l'email.] < --
CREATE TRIGGER `trigger_email` BEFORE INSERT ON `guida_tv`.`utente` FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_email`(NEW.email, NEW.pwd);
END$

CREATE TRIGGER `trigger_actor` BEFORE INSERT ON `guida_tv`.`persona` FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_actor`(NEW.nome, NEW.cognome, NEW.data_di_nascita);
END$


CREATE TRIGGER `trigger_palinsesto` BEFORE INSERT ON `guida_tv`.`palinsesto` FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_palinsesto`(NEW.giorno, NEW.ora_inizio, NEW.ora_fine, NEW.id_programma, NEW.id_canale);
END$

CREATE TRIGGER `trigger_canale_preferito` BEFORE INSERT ON `guida_tv`.`canale_preferito` FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_canale_preferito`(NEW.id_programma, NEW.id_canale);
END$




DELIMITER $