DROP PROCEDURE IF EXISTS `guida_tv`.`inserisci_film`;
DROP PROCEDURE IF EXISTS `guida_tv`.`inserisci_episodio`;

DELIMITER $

-- 2A > [Inserimento di un film.] < --
CREATE PROCEDURE `guida_tv`.`inserisci_film` (IN titolo_param VARCHAR(64),
											  IN durata_param TIME,
											  IN descrizione_param VARCHAR(128),
											  IN anno_uscita_param DATE,
											  IN path_param VARCHAR(255),
											  IN produttore_param VARCHAR(50),
											  IN immagine_param LONGBLOB)
BEGIN
	IF EXISTS (SELECT u.titolo FROM programma u WHERE u.titolo = titolo_param AND u.anno_uscita = anno_uscita_param AND u.produttore = produttore_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Questo film è già stato inserito';
		ELSE
			INSERT INTO `guida_tv`.`programma` (`titolo`, `durata`, `descizione`, `anno_uscita`,`stagione`, `episodio`, `produttore`, `descrizione_episodio`,
											    `path`, `immagine`) 
			VALUES (titolo_param, durata_param, descrizione_param, anno_uscita_param, NULL, NULL, produttore_param, NULL, path_param, immagine_param);
		END IF;
END $


-- 2B > [Inserimento di un episodio di una serie.] < --
CREATE PROCEDURE `inserisci_episodio` (IN titolo_param VARCHAR(64),
									   IN durata_param TIME,
									   IN descrizione_param VARCHAR(128),
									   IN anno_uscita_param DATE,
								       IN stagione_param TINYINT,
                                       IN episodio_param MEDIUMINT,
									   IN produttore_param VARCHAR(50),
									   IN descrizione_episodio_param VARCHAR(128),
								       IN path_param VARCHAR(255),
								       IN immagine_param LONGBLOB)
BEGIN
	IF EXISTS (SELECT u.titolo FROM programma u WHERE u.titolo = titolo_param AND u.anno_uscita = anno_uscita_param AND u.produttore = produttore_param
			   AND u.stagione = stagione_param AND u.episodio = episodio_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Questo episodio è già stato inserito';
		ELSE
			INSERT INTO `guida_tv`.`programma` (`titolo`, `durata`, `descizione`, `anno_uscita`,`stagione`, `episodio`, `produttore`, `descrizione_episodio`,
											    `path`, `immagine`) 
			VALUES (titolo_param, durata_param, descrizione_param, anno_uscita_param, stagione_param, episodio_param, produttore_param, descrizione_episodio,
				    path_param, immagine_param);
		END IF;
END $

DELIMITER $