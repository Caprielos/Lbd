
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

INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('Mattina', 1, 1);
INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('Pomeriggio', 2, 2);

INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('1', '2');
INSERT INTO `guida_tv`.`programma_preferito` (`id_utente`, `id_programma`) VALUES ('2', '4');



