DROP PROCEDURE IF EXISTS `inserisci_persona`;
DROP PROCEDURE IF EXISTS `guida_tv`.`validate_actor`;
DROP TRIGGER IF EXISTS `guida_tv`.`trigger_actor`;

DROP PROCEDURE IF EXISTS `guida_tv`.`inserisci_canale`;

DROP PROCEDURE IF EXISTS `guida_tv`.`genera_palinsesto`;
DROP PROCEDURE IF EXISTS `guida_tv`.`validate_duplicato_palinsesto`;
DROP TRIGGER IF EXISTS `guida_tv`.`trigger_palinsesto`;

DROP PROCEDURE IF EXISTS `guida_tv`.`validate_oraio_palinsesto`;
DROP TRIGGER IF EXISTS `guida_tv`.`trigger_orario_palinsesto`;


DELIMITER $

CREATE PROCEDURE `inserisci_persona`(IN nome_param VARCHAR(64), IN cognome_param VARCHAR(32), IN data_di_nascita_param DATE)
BEGIN
		INSERT INTO `guida_tv`.persona(`nome`, `cognome`, `data_di_nascita`) VALUES (nome_param, cognome_param, data_di_nascita_param);
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
	IF EXISTS (SELECT * FROM `guida_tv`.persona p WHERE p.nome = nome_param AND p.cognome = cognome_param AND p.data_di_nascita = data_di_nascita_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'attore gia esistente';
	END IF;
    
END$

-- > [Trigger per validare l'attore.] < --
CREATE TRIGGER `trigger_actor` BEFORE INSERT ON persona FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_actor`(NEW.nome, NEW.cognome, NEW.data_di_nascita);
END$

-- > [Inserimento canale.] < -- 
CREATE PROCEDURE `inserisci_canale`(IN nome_param VARCHAR(64), IN numero_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.canale(`nome`, `numero`) VALUES (nome_param, numero_param);
END $

-- > [Generazione del palinsesto.] < -- 
CREATE PROCEDURE `genera_palinsesto`(IN giorno_param DATE, IN ora_inizio_param TIME,  IN ora_fine_param TIME, IN id_canale_param INTEGER, IN id_programma_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`)
        VALUES (giorno_param, ora_inizio_param, ora_fine_param , id_canale_param, id_programma_param);
END $

-- > [Procedura per controllare se ci sono 2 palinsesti nello stesso momento nello stesso canale.] < --
CREATE PROCEDURE `validate_duplicato_palinsesto`(
	IN giorno_param DATE,
    IN ora_inizio_param TIME,
    IN ora_fine_param TIME,
    IN id_canale_param INTEGER,
    IN id_programma_param INTEGER
)

DETERMINISTIC
NO SQL
BEGIN
	IF EXISTS (SELECT * FROM `guida_tv`.palinsesto p WHERE p.giorno = giorno_param AND p.ora_inizio = ora_inizio_param 
			   AND p.ora_fine = ora_fine_param AND p.id_canale = id_canale_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'non puoi inserire un programma nello stesso orario di un altro nello stesso giorno';
	END IF;
    
END$

-- > [Trigger per controllare duplicato del palinsesto.] < --
CREATE TRIGGER `trigger_palinsesto` BEFORE INSERT ON palinsesto FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_duplicato_palinsesto`(NEW.giorno, NEW.ora_inizio, NEW.ora_fine, NEW.id_programma, NEW.id_canale);
END$


CREATE PROCEDURE `validate_oraio_palinsesto`(
	IN giorno_param DATE,
    IN ora_inizio_param TIME,
    IN ora_fine_param TIME,
    IN id_canale_param INTEGER,
    IN id_programma_param INTEGER
)

DETERMINISTIC
NO SQL
BEGIN

    IF (ora_inizio_param + (SELECT prog.durata FROM `guida_tv`.`programma` prog WHERE prog.id = id_canale_param) > ora_fine_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'errore, data inizio + durata e maggiore della data di fine';
	END IF;
    
END$

-- > [Trigger per controllare l'orario del palinsesto.] < --
CREATE TRIGGER `trigger_orario_palinsesto` BEFORE INSERT ON palinsesto FOR EACH ROW
	BEGIN
		CALL `guida_tv`.`validate_oraio_palinsesto`(NEW.giorno, NEW.ora_inizio, NEW.ora_fine, NEW.id_programma, NEW.id_canale);
END$



DELIMITER $


