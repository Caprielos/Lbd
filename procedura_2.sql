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

call guida_tv.inserisci_film('Rambo 1', '01:15:00', 'classico film di guerra', '2000-08-17', '', 'Produttore 1', '');
call guida_tv.inserisci_film('Rocky', '01:45:00', 'box', '2000-09-17', '', 'Produttore 2', '');
call guida_tv.inserisci_film('Aladino', '02:00:00', 'siamo nella sabbia', '2003-08-18', '', 'Produttore 3', '');
call guida_tv.inserisci_film('Io sono leggenda', '03:15:00', 'uno contro tutti', '2010-04-27', '', 'Produttore 4', '');

call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 1, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 2, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 3, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 4, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 5, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 6, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 7, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 8, 'Produttore 5', 'Muore molta gente', '', '');