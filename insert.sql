DROP PROCEDURE IF EXISTS `guida_tv`.`validate_email`;

DELIMITER $

-- > [Procedura per validare l'email.] < --
CREATE PROCEDURE `validate_email`(
	IN email_param VARCHAR(64),
    IN pwd_param VARCHAR(32)
)

BEGIN

	IF (SELECT email_param NOT REGEXP '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,63}$')
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'email inserita non corretta';
	END IF;
    
END$

DELIMITER $


DROP PROCEDURE IF EXISTS `inserisci_attore`;
DROP PROCEDURE IF EXISTS `guida_tv`.`validate_actor`;

DELIMITER $

-- > [Procedura per inserire un attore.] < --
CREATE PROCEDURE `inserisci_attore`(IN nome_param VARCHAR(64), IN cognome_param VARCHAR(32), IN data_di_nascita_param DATE)
BEGIN
		INSERT INTO `guida_tv`.persona(`nome`, `cognome`, `data_di_nascita`) VALUES (nome_param, cognome_param, data_di_nascita_param);
END $

-- > [Procedura per controllare l'inserimento di un duplicato di un attore o uno che ha una data sbagliata.] < --
CREATE PROCEDURE `validate_actor`(
	IN nome_param VARCHAR(64),
    IN cognome_param VARCHAR(32),
    IN data_di_nascita_param DATE
)

BEGIN

	IF (data_di_nascita_param > curdate() ) 
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Forse hai sbagliato la data di nascita';
	END IF;
    
	IF EXISTS (SELECT * FROM `guida_tv`.persona p WHERE p.nome = nome_param AND p.cognome = cognome_param AND p.data_di_nascita = data_di_nascita_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Attore già esistente';
	END IF;
    
END$


DELIMITER $


DROP PROCEDURE IF EXISTS `guida_tv`.`genera_palinsesto`;
DROP PROCEDURE IF EXISTS `guida_tv`.`validate_palinsesto`;

DELIMITER $

-- > [Generazione del palinsesto.] < -- 
CREATE PROCEDURE `genera_palinsesto`(IN giorno_param DATE, IN ora_inizio_param TIME,  IN ora_fine_param TIME, IN id_canale_param INTEGER, IN id_programma_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`)
        VALUES (giorno_param, ora_inizio_param, ora_fine_param , id_canale_param, id_programma_param);
END $


-- > [Procedura per controllare se ci sono 2 palinsesti nello stesso momento nello stesso canale.] < --
-- > [Procedura per controllare se l'orario di fine è valido.] < --
-- > [Procedura per controllare se creo un palinsesto che ha data maggiore di oggi + 7.] < --
-- > [Procedura per controllare se creo un palinsesto che ha data minore di oggi.] < --
CREATE PROCEDURE `validate_palinsesto`(
	IN giorno_param DATE,
    IN ora_inizio_param TIME,
    IN ora_fine_param TIME,
    IN id_canale_param INTEGER,
    IN id_programma_param INTEGER
)

BEGIN

	IF EXISTS (SELECT * FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.ora_inizio = ora_inizio_param 
																				   AND p.ora_fine = ora_fine_param AND p.id_canale = id_canale_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Questo orario è già occupato da un altro programma';
	END IF;
	
    IF (ora_inizio_param + (SELECT prog.durata FROM `guida_tv`.`programma` prog WHERE prog.id = id_canale_param) > ora_fine_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hai sbagliato a inserire l\'orario di fine';
	END IF;
    
        IF ( (SELECT p.ora_fine FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.id_canale = id_canale_param) > ora_inizio_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi inserire questo programma nell\' nello spazio di un altro';
	END IF;
    
	IF (giorno_param > (curdate() + 7) )
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi programmare un palinsesto così in avanti';
	END IF;
    
	IF (giorno_param < curdate() )
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi programmare un palinsesto per giorni precedenti a oggi';
	END IF;
    
    
END$



DELIMITER $


DROP PROCEDURE IF EXISTS `guida_tv`.`inserisci_canale`;

DELIMITER $

-- > [Inserimento canale.] < -- 
CREATE PROCEDURE `inserisci_canale`(IN nome_param VARCHAR(64), IN numero_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.canale(`nome`, `numero`) VALUES (nome_param, numero_param);
END $

DELIMITER $


call guida_tv.signUp('diegidiogabriele@gmail.com', '1234');
call guida_tv.signUp('andreasegnalini@gmail.com', '1234');

call guida_tv.inserisci_canale('Rai 1', 1);
call guida_tv.inserisci_canale('Rai 2', 2);
call guida_tv.inserisci_canale('Rai 3', 3);
call guida_tv.inserisci_canale('Canale 4', 4);
call guida_tv.inserisci_canale('Canale 5', 5);
call guida_tv.inserisci_canale('Italia 1', 6);

call guida_tv.inserisci_film('Rambo 1', '01:15:00', 'classico film di guerra', '2000-08-17', '', 'Produttore 1', '');
call guida_tv.inserisci_film('Rocky', '01:45:00', 'box', '2000-09-17', '', 'Produttore 2', '');
call guida_tv.inserisci_film('Aladino', '02:00:00', 'siamo nella sabbia', '2003-08-18', '', 'Produttore 3', '');
call guida_tv.inserisci_film('Io sono leggenda', '03:15:00', 'uno contro tutti', '2010-04-27', '', 'Produttore 4', '');

call guida_tv.inserisci_episodio('Games of trones : - primo episodio', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 1, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones : - secondo episodio', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 2, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones : - terzo episodio', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 3, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones : - quarto episodio', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 4, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones : - quinto episodio', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 5, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones : - sesto episodio', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 6, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones : - settimo episodio', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 7, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones : - ottavo episodio', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 8, 'Produttore 5', 'Muore molta gente', '', '');

CALL `guida_tv`.inserisci_film("Rambo 1", '01:15:00', "Rambo contro tutti", '2000-07-17', "Path esterno", "Produttore 1", NULL);
CALL `guida_tv`.inserisci_film("Rocky", '01:41:00', "Pugilato", '2000-08-17', "Path esterno", "Produttore 1", NULL);
CALL `guida_tv`.inserisci_film("Aladino", '02:00:00', "Deserto", '2000-09-17', "Path esterno", "Produttore 2", NULL);
CALL `guida_tv`.inserisci_film("Io sono leggenda", '02:50:00', "Uno contro zombie", '2000-010-17', "Path esterno", "Produttore 3", NULL);   
CALL `guida_tv`.inserisci_film("Film 1", '01:00:00', "Descrizione 1", '2000-10-17', "Path esterno", "Produttore 4", NULL);

CALL `guida_tv`.inserisci_episodio("Games of trones", '00:45:00', "Serie sui ghiacci", '2017-02-01', 1, 1, "Produttore 5", "Muore tanta gente", "Link esterno", NULL);
CALL `guida_tv`.inserisci_episodio("Games of trones", '00:45:00', "Serie sui ghiacci", '2017-02-01', 1, 2, "Produttore 5", "Muore tanta gente", "Link esterno", NULL);
CALL `guida_tv`.inserisci_episodio("Games of trones", '00:45:00', "Serie sui ghiacci", '2017-02-01', 1, 3, "Produttore 5", "Muore tanta gente", "Link esterno", NULL);
CALL `guida_tv`.inserisci_episodio("Games of trones", '00:45:00', "Serie sui ghiacci", '2017-02-01', 1, 4, "Produttore 5", "Muore tanta gente", "Link esterno", NULL);
CALL `guida_tv`.inserisci_episodio("Games of trones", '00:45:00', "Serie sui ghiacci", '2017-02-01', 1, 5, "Produttore 5", "Muore tanta gente", "Link esterno", NULL);

INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Animazione');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Avventura');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Biografico');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Comico');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Commedia');

INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Drammatico');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Fantascienza');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Fantasy');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Giallo');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Guerra');

INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Horror');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Spionaggio');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Storico');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Western');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Erotico');

INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`, `data_di_nascita`) VALUES ('Giuseppe', 'Della Penna', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Stefano', 'Fattore', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Tommaso', 'De Luca', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Marco', 'Terracina', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Marco', 'Main', '2022-06-01');

INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Massimo', 'Tivoli', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Pierluigi', 'Zobel', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Federica', 'Cucchiella', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Paolo', 'De Fabritiis', '2022-06-01');

INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Mauro', 'Zannetti', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Poalo', 'Di Stefano', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Roberto', 'Carapellucci', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Mario', 'Pelino', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Amleto', 'Di Salle', '2022-06-01');

INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Elisabetta', 'Santi', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Antonio', 'Ometto', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Gabriele', 'Curci', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Elia', 'Palange', '2022-06-01');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`,  `data_di_nascita`) VALUES ('Fulvio', 'Zuanni', '2022-06-01');

INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('1', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('2', '9');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('3', '6');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('3', '9');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('4', '6');

INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('1', '10', 'aa');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('2', '9', 'bb');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('3', '8', 'cc');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('4', '7', 'dd');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('5', '6', 'dd');

INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('1', 1, 1);
INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('2', 2, 2);

INSERT INTO `guida_tv`.`programma_preferito` (`fascia_oraria`, `id_utente`, `id_programma`) VALUES ('3', '1', '2');
INSERT INTO `guida_tv`.`programma_preferito` (`fascia_oraria`, `id_utente`, `id_programma`) VALUES ('4', '2', '4');



