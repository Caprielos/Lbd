call guida_tv.signUp('diegidiogabriele@gmail.com', '1234');
call guida_tv.signUp('andreasegnalini@gmail.com', '1234');
call guida_tv.signUp('prova1@gmail.com', '1234');
call guida_tv.signUp('prova2@gmail.com', '1234');

call guida_tv.inserisci_film('Rambo 1', '01:15:00', 'classico film di guerra', '2000-08-17', '', 'Produttore 1', '');
call guida_tv.inserisci_film('Rocky', '01:45:00', 'box', '2000-09-17', '', 'Produttore 2', '');
call guida_tv.inserisci_film('Aladino', '02:00:00', 'siamo nella sabbia', '2003-08-18', '', 'Produttore 3', '');
call guida_tv.inserisci_film('Io sono leggenda', '03:15:00', 'uno contro tutti', '2010-04-27', '', 'Produttore 4', '');
call guida_tv.inserisci_film('Pirati dei caraibi: La maledizione della prima luna ', '02:00:00', 'pirati contro tutti', '2000-03-21', '', 'Produttore 5', '');
call guida_tv.inserisci_film('Pirati dei caraibi: La maledizione del forziere', '02:15:00', 'pirati uno contro tutti', '2005-01-02', '', 'Produttore 5', '');
call guida_tv.inserisci_film('Pirati dei caraibi: Ai confini del mondo', '02:45:00', 'pirati uno contro tutti', '2008-06-15', '', 'Produttore 5', '');

call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 1, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 2, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 3, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 4, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 5, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 6, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 7, 'Produttore 5', 'Muore molta gente', '', '');
call guida_tv.inserisci_episodio('Games of trones', '00:45:00', 'serie sui ghiacci', '2017-02-01', 1, 8, 'Produttore 5', 'Muore molta gente', '', '');

call guida_tv.inserisci_canale('Rai 1', 1);
call guida_tv.inserisci_canale('Rai 2', 2);
call guida_tv.inserisci_canale('Rai 3', 3);
call guida_tv.inserisci_canale('Canale 4', 4);
call guida_tv.inserisci_canale('Canale 5', 5);
call guida_tv.inserisci_canale('Italia 1', 6);

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
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('2', '1');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('3', '1');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('3', '2');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('4', '2');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('5', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('6', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('7', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('8', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('9', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('10', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('11', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('12', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('13', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('14', '10');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('15', '10');

INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('1', '10', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('2', '9', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('3', '8', 'regista');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('4', '7', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('5', '6', 'regista');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('6', '10', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('7', '9', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('8', '8', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('9', '7', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('10', '6', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('11', '1', 'regista');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('12', '2', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('13', '3', 'regista');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('14', '4', 'attore');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('15', '5', 'regista');

INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('Mattina', 1, 1);
INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('Pomeriggio', 2, 2);
INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('Sera', 3, 3);
INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('Pomeriggio', 4, 2);

INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('1', '2');
INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('2', '4');
INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('3', '5');
INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('4', '6');
INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('1', '1');
INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('2', '7');
INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('3', '8');
INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('4', '1');


