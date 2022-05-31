DROP PROCEDURE IF EXISTS `inserisci_persona`;

DELIMITER $


CREATE PROCEDURE `inserisci_persona`(IN nome_param VARCHAR(64), IN cognome_param VARCHAR(32), OUT result BOOLEAN)
BEGIN
		IF EXISTS (SELECT * FROM `guida_tv`.persona u WHERE u.nome = nome_param AND u.cognome = cognome_param) 
    THEN
		SET result = false;
    ELSE
		INSERT INTO persona(`nome`, `cognome`) VALUES (nome_param, cognome_param);
        SET result = true;
	END IF;
END $

DELIMITER $

CALL `inserisci_persona`("Beatrice", "Tomassinger", @result);
SELECT @result;

