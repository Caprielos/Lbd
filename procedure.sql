DROP PROCEDURE IF EXISTS `signUp`;
DROP PROCEDURE IF EXISTS `inserisci_film`;

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
								  IN stagione_param TINYINT,
                                  IN episodio_param TINYINT,
								  IN path_param VARCHAR(255),
								  IN immagine_param LONGBLOB,
								  OUT result BOOLEAN)

BEGIN
	
END $


-- 2B > [Inserimento di un episodio di una serie.] < --
CREATE PROCEDURE `inserisci_episodio` (IN titolo_paramm VARCHAR(64),
								  IN durata_param TIME,
                                  IN descrizione_param VARCHAR(128),
								  IN anno_uscita_param DATE,
								  IN stagione_param TINYINT,
                                  IN episodio_param TINYINT,
								  IN path_param VARCHAR(255),
								  IN immagine_param LONGBLOB,
								  OUT result BOOLEAN)

BEGIN
	
END $


DELIMITER $