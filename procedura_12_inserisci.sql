DROP PROCEDURE IF EXISTS `inserisci_persona`;
DROP PROCEDURE IF EXISTS `guida_tv`.`validate_actor`;
DROP TRIGGER IF EXISTS `guida_tv`.`trigger_actor`;

DELIMITER $


CREATE PROCEDURE `inserisci_persona`(IN nome_param VARCHAR(64), IN cognome_param VARCHAR(32), IN data_di_nascita_param DATE)
BEGIN
		INSERT INTO persona(`nome`, `cognome`, `data_di_nascita`) VALUES (nome_param, cognome_param, data_di_nascita_param);
END $


-- > [Procedura per controllare l'inserimento di un duplicato di un attore.] < --
CREATE PROCEDURE `validate_actor`(
	IN nome_param VARCHAR(64),
    IN cognome_param VARCHAR(32),
    IN data_di_nascita_param DATE
)

DETERMINISTIC
NO SQL
BEGIN
	IF EXISTS (SELECT * FROM `guida_tv`.persona u WHERE u.nome = nome_param AND u.cognome = cognome_param AND u.data_di_nascita = data_di_nascita_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'persona gia esistente';
	END IF;
    
END$

-- > [Trigger per validare l'attore.] < --
CREATE TRIGGER `trigger_actor` BEFORE INSERT ON persona FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_actor`(NEW.nome, NEW.cognome, NEW.data_di_nascita);
END$


DELIMITER $


