INSERT INTO `guida_tv`.`utente` (`email`, `pwd`) VALUES ('diegidiogabriele@gmail.com', '1234');
INSERT INTO `guida_tv`.`utente` (`email`, `pwd`) VALUES ('andreasegnalini@gmail.com', '1234');

INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Rai 1', '1');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Rai 2', '2');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Rai 3', '3');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Rai 4', '4');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Canale 5', '5');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Italia 1', '6');

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

CALL `guida_tv`.inserisci_episodio("Signore Degli Anelli", '03:45:00', "Serie su un anello", '1990-01-01', 1, 1, "Produttore 6", "La compagnia dell'anello", "Link esterno", NULL);
CALL `guida_tv`.inserisci_episodio("Signore Degli Anelli", '03:45:00', "Serie su un anello", '2000-02-02', 1, 2, "Produttore 6", "Le due torri", "Link esterno", NULL);
CALL `guida_tv`.inserisci_episodio("Signore Degli Anelli", '03:45:00', "Serie su un anello", '2002-03-03', 1, 3, "Produttore 6", "Il ritorno del re", "Link esterno", NULL);

CALL `guida_tv`.inserisci_episodio("Lo hobbit", '02:45:00', "Serie prima del signore degli anelli", '2018-08-01', 1, 1, "Produttore 7", "Un viaggio inaspettato", "Link esterno", NULL);
CALL `guida_tv`.inserisci_episodio("Lo hobbit", '03:45:00', "Serie prima del signore degli anelli", '2019-09-02', 1, 2, "Produttore 7", "La desolazione di smaug", "Link esterno", NULL);
CALL `guida_tv`.inserisci_episodio("Lo hobbit", '01:45:00', "Serie prima del signore degli anelli", '2020-10-03', 1, 3, "Produttore 7", "La battaglia delle 5 armate", "Link esterno", NULL);

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '1', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '1', '2');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '1', '3');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '1', '4');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '1', '5');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '1', '6');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '1', '7');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-13', '00:00:00', '00:00:00', '2', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-13', '00:00:00', '00:00:00', '2', '7');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '2', '15');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '2', '10');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '2', '12');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '2', '2');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '2', '5');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-13', '00:00:00', '00:00:00', '3', '16');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '3', '15');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '3', '14');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '3', '10');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '3', '13');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '3', '12');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-30', '00:00:00', '00:00:00', '3', '11');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-31', '00:00:00', '00:00:00', '4', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-31', '00:00:00', '00:00:00', '4', '2');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-31', '00:00:00', '00:00:00', '4', '3');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-31', '00:00:00', '00:00:00', '4', '4');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-31', '00:00:00', '00:00:00', '4', '5');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-31', '00:00:00', '00:00:00', '4', '6');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-31', '00:00:00', '00:00:00', '4', '7');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '4', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '4', '2');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '4', '3');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '4', '4');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '4', '5');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '4', '6');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '4', '7');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '2', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '2', '7');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '2', '15');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '2', '10');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '2', '12');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '2', '2');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '2', '5');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '5', '16');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '5', '15');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '5', '14');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '5', '10');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '5', '13');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '5', '12');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-01', '00:00:00', '00:00:00', '5', '11');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '6', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '6', '2');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '6', '3');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '6', '4');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '6', '5');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '6', '6');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '6', '7');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-08', '00:00:00', '00:00:00', '2', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-08', '00:00:00', '00:00:00', '2', '7');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-08', '00:00:00', '00:00:00', '2', '15');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-08', '00:00:00', '00:00:00', '2', '10');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-08', '00:00:00', '00:00:00', '2', '12');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-08', '00:00:00', '00:00:00', '2', '2');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-08', '00:00:00', '00:00:00', '2', '5');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '3', '16');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '3', '15');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '3', '14');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '3', '10');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '3', '13');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '3', '12');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-02', '00:00:00', '00:00:00', '3', '11');

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

INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('5', '5');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('6', '4');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('7', '3');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('8', '2');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('9', '1');

INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('10', '11');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('11', '12');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('12', '13');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('13', '14');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('13', '15');

INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('1', '10', 'aa');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('2', '9', 'bb');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('3', '8', 'cc');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('4', '7', 'dd');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('5', '6', 'dd');

INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('6', '5', 'aa');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('7', '4', 'bb');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('8', '3', 'cc');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('9', '2', 'dd');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('10', '11', 'dd');

INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('11', '12', 'aa');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('12', '13', 'bb');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('13', '14', 'cc');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('14', '15', 'dd');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('15', '16', 'dd');

INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('1', '17', 'aa');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('2', '18', 'bb');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('3', '19', 'cc');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('4', '1', 'dd');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('4', '2', 'dd');

INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('1', 1, 1);
INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('2', 2, 2);

INSERT INTO `guida_tv`.`programma_preferito` (`fascia_oraria`, `id_utente`, `id_programma`) VALUES ('3', '1', '2');
INSERT INTO `guida_tv`.`programma_preferito` (`fascia_oraria`, `id_utente`, `id_programma`) VALUES ('4', '2', '4');

