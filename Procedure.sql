DROP PROCEDURE IF EXISTS `signUp`;
DROP PROCEDURE IF EXISTS `inserisciSerie`;
DROP PROCEDURE IF EXISTS `inserisciStagione`;
DROP PROCEDURE IF EXISTS `inserisciFilm`;
DROP PROCEDURE IF EXISTS `inserisciEpisodio`;

-- 1 -> [Registrazione (inserimento dei dati del profilo) di un utente.]
DELIMITER $

CREATE PROCEDURE `signUp`(IN emailParam VARCHAR(64), IN pwdParam VARCHAR(32), OUT result BOOLEAN)
BEGIN
		IF EXISTS (SELECT u.email FROM utente u WHERE u.email = emailParam) 
    THEN
		SET result = false;
    ELSE
		INSERT INTO utente(`email`, `pwd`) VALUES (emailParam, pwdParam);
        SET result = true;
	END IF;
END $

-- 2A -> [Inserimento serie.]
CREATE PROCEDURE `inserisciSerie` (IN titoloParam VARCHAR(64),
								   IN dataParam DATE,
								   IN descrizioneParam VARCHAR(128),
								   IN pathParam VARCHAR(255),
								   IN immagineParam LONGBLOB,
                                   OUT result BOOLEAN)
BEGIN
	IF EXISTS (SELECT * FROM `programma` p WHERE p.titolo = titoloParam AND p.data_pubbl = dataParam)
    THEN
		SET result = false;
    ELSE
		INSERT INTO programma(`titolo`, `durata`, `data_pubbl`, `descrizione`, `ora_inizio`, `ora_fine`, `path`, `immagine`, `id_padre`) 
        VALUES(titoloParam, NULL, dataParam, descrizioneParam, NULL, NULL, pathParam, immagineParam, NULL);
        SET result = true;
    END IF;
END $

-- 2B -> [Inserimento stagione.]
CREATE PROCEDURE `inserisciStagione`(IN titoloParam VARCHAR(64),
								     IN dataParam DATE,
								     IN descrizioneParam VARCHAR(128),
								     IN pathParam VARCHAR(255),
								     IN immagineParam LONGBLOB,
                                     IN parentNome VARCHAR(64),
                                     IN parentData DATE,
                                     OUT result BOOLEAN)
BEGIN
	DECLARE id_padre_serie INTEGER UNSIGNED;
    
    SET id_padre_serie = (SELECT p.id FROM `programma` p WHERE p.titolo = parentNome AND p.data_pubbl = parentData);
    
	IF id_padre_serie IS NOT NULL
    THEN
		INSERT INTO programma(`titolo`, `durata`, `data_pubbl`, `descrizione`, `ora_inizio`, `ora_fine`, `path`, `immagine`, `id_padre`) 
        VALUES(titoloParam, NULL, dataParam, descrizioneParam, NULL, NULL, pathParam, immagineParam, id_padre_serie);
        SET result = true;
	ELSE
		SET result = false;
    END IF;
END$

-- DA LAVORARE QUI, HO FATTO SOLO I PARAMETRI DEL METODO
-- https://www.youtube.com/watch?v=NmFnqEvJ_Tc&ab_channel=TheCodeCity
-- 2C -> [Inserimento episodio.]
CREATE PROCEDURE `inserisciEpisodio`(IN titoloParam VARCHAR(64),
								     IN durataParam TIME,
								     IN dataParam DATE,
								     IN descrizioneParam VARCHAR(128),
								     IN ora_inizioParam TIME,
									 IN ora_fineParam TIME,
								     IN pathParam VARCHAR(255),
								     IN immagineParam LONGBLOB,
                                     -- Mi servono per trovare la stagione in cui ficcare l'episodio
                                     -- Leggere il notepad++
                                     IN nomeSerieParam VARCHAR(64),
                                     IN dataPubblicazioneSerieParam DATE,
                                     IN numeroStagionerParam INTEGER,
                                     OUT result BOOLEAN)
BEGIN
	DECLARE id_padre_serie INTEGER UNSIGNED;
    
    SET id_padre_serie = (SELECT p.id FROM `programma` p WHERE p.titolo = parentNome AND p.data_pubbl = parentData);
    
	IF id_padre_serie IS NOT NULL
    THEN
		INSERT INTO programma(`titolo`, `durata`, `data_pubbl`, `descrizione`, `ora_inizio`, `ora_fine`, `path`, `immagine`, `id_padre`) 
        VALUES(titoloParam, NULL, dataParam, descrizioneParam, NULL, NULL, pathParam, immagineParam, id_padre_serie);
        SET result = true;
	ELSE
		SET result = false;
    END IF;
END$

-- 2D -> [Inserimento film.]
CREATE PROCEDURE `inserisciFilm` (IN titoloParam VARCHAR(64),
								  IN durataParam TIME,
								  IN dataParam DATE,
								  IN descrizioneParam VARCHAR(128),
								  IN ora_inizioParam TIME,
                                  IN ora_fineParam TIME,
								  IN pathParam VARCHAR(255),
								  IN immagineParam LONGBLOB,
								  OUT result BOOLEAN)
BEGIN
	IF EXISTS (SELECT * FROM `programma` p WHERE p.titolo = titoloParam AND p.data_pubbl = dataParam)
    THEN
		SET result = false;
    ELSE
		INSERT INTO programma(`titolo`, `durata`, `data_pubbl`, `descrizione`, `ora_inizio`, `ora_fine`, `path`, `immagine`, `id_padre`) 
        VALUES(titoloParam, durataParam, dataParam, descrizioneParam, ora_inizioParam, ora_fineParam, pathParam, immagineParam, NULL);
        SET result = true;
    END IF;
END $



DELIMITER $
