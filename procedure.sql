DROP PROCEDURE IF EXISTS `signUp`;
DROP PROCEDURE IF EXISTS `inserisci_film`;
DROP PROCEDURE IF EXISTS `inserisci_episodio`;
DROP PROCEDURE IF EXISTS `inserisci_canale`;
DROP PROCEDURE IF EXISTS `crea_palinsesto()`;

DELIMITER $

-- 1 > [Registrazione (inserimento dei dati del profilo) di un utente.] < --
CREATE PROCEDURE `signUp`(IN email_param VARCHAR(64), IN pwd_param VARCHAR(32), OUT result BOOLEAN)
BEGIN
		IF EXISTS (SELECT u.email FROM utente u WHERE u.email = email_param) 
    THEN
		SET result = false;
    ELSE
		INSERT INTO utente(`email`, `pwd`) VALUES (email_param, pwd_param);
        SET result = true;
	END IF;
END $

-- 2A > [Inserimento di un film.] < --
CREATE PROCEDURE `inserisci_film` (IN titolo_param VARCHAR(64),
								   IN durata_param TIME,
                                   IN descrizione_param VARCHAR(128),
								   IN anno_uscita_param DATE,
								   IN path_param VARCHAR(255),
								   IN immagine_param LONGBLOB,
								   OUT result BOOLEAN)
BEGIN
	IF EXISTS (SELECT u.titolo FROM programma u WHERE u.titolo = titolo_param AND u.anno_uscita = anno_uscita_param)
		THEN
			SET result = false;
		ELSE
			INSERT INTO `programma` (`titolo`, `durata`, `descizione`, `anno_uscita`,`stagione`, `episodio`, `path`, `immagine`) 
			VALUES (titolo_param, durata_param, descrizione_param, anno_uscita_param, 0, 0, path_param, immagine_param);
            SET result = true;
		END IF;
END $


-- 2B > [Inserimento di un episodio di una serie.] < --
CREATE PROCEDURE `inserisci_episodio` (IN titolo_param VARCHAR(64),
									   IN durata_param TIME,
									   IN descrizione_param VARCHAR(128),
									   IN anno_uscita_param DATE,
								       IN stagione_param TINYINT,
                                       IN episodio_param TINYINT,
								       IN path_param VARCHAR(255),
								       IN immagine_param LONGBLOB,
								       OUT result BOOLEAN)
BEGIN
	IF EXISTS (SELECT u.titolo FROM programma u WHERE u.titolo = titolo_param AND u.anno_uscita = anno_uscita_param
			   AND u.stagione = stagione_param AND u.episodio = episodio_param)
		THEN
			SET result = false;
		ELSE
			INSERT INTO `programma` (`titolo`, `durata`, `descizione`, `anno_uscita`, `stagione`, `episodio`, `path`, `immagine`) 
			VALUES (titolo_param, durata_param, descrizione_param, anno_uscita_param, stagione_param, episodio_param, path_param, immagine_param);
            SET result = true;
		END IF;
END $


--  > [Crea canale.] < --
CREATE PROCEDURE `crea_canale`(IN nome_param VARCHAR(64), in numero_param INT, OUT result BOOLEAN)
BEGIN
	INSERT INTO `canale` (`nome`, `numero`) VALUES (nome_param, numero_param);
    SET result = true;
END $


--  > [Crea palinsesto.] < --
CREATE PROCEDURE `crea_palinsesto` (IN giorno_palinsesto_param DATE,
									IN ora_inizio_palinsesto_param TIME,
                                    IN ora_fine_palinsesto_param TIME,
                                    OUT result BOOLEAN
                                    )
BEGIN
	INSERT INTO `palinsesto` (`giorno`, `ora_inizio`, `ora_fine`) VALUES (giorno_palinsesto_param, ora_inizio_palinsesto_param, ora_fine_palinsesto_param);
END $





DELIMITER $