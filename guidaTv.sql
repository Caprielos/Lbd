DROP DATABASE IF EXISTS `guida_tv`;
CREATE DATABASE IF NOT EXISTS `guida_tv`;
USE `guida_tv`;

DROP TABLE IF EXISTS `utente`;
DROP TABLE IF EXISTS `canale`;
DROP TABLE IF EXISTS `palinsesto`;
DROP TABLE IF EXISTS `programma`;
DROP TABLE IF EXISTS `genere`;
DROP TABLE IF EXISTS `persona`;
DROP TABLE IF EXISTS `possiede`;
DROP TABLE IF EXISTS `partecipa`;

CREATE TABLE `utente` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(64) NOT NULL UNIQUE,
    `pwd` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `canale` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(64) NOT NULL UNIQUE,
    `numero` INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY(`id`)
    
);

CREATE TABLE `programma` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`titolo` VARCHAR(64) NOT NULL,
	`durata` TIME NOT NULL,
	`descizione` VARCHAR(128) NOT NULL,
	`anno_uscita` DATE NOT NULL,
	`stagione` TINYINT,
	`episodio` MEDIUMINT,
    `produttore` VARCHAR(50) NOT NULL,
    `descrizione_episodio` VARCHAR(128),
	`path` VARCHAR(255),
	`immagine` LONGBLOB,
	PRIMARY KEY(`id`)
);

CREATE TABLE `genere` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(64) NOT NULL UNIQUE,
	PRIMARY KEY(`id`)
);

CREATE TABLE `persona` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(64) NOT NULL,
    `cognome` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `possiede` (
	`id_programma` INTEGER UNSIGNED NOT NULL,
	`id_genere` INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY(`id_programma`, `id_genere`)
);

CREATE TABLE `partecipa` (
	`id_programma` INTEGER UNSIGNED NOT NULL,
	`id_persona` INTEGER UNSIGNED NOT NULL,
    `ruolo` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id_programma`, `id_persona`)
);

CREATE TABLE `palinsesto` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`giorno` DATE NOT NULL,
	`ora_inizio` TIME NOT NULL,
	`ora_fine` TIME NOT NULL,
    `id_canale` INTEGER UNSIGNED NOT NULL,
    `id_programma` INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `canale_preferito` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`fascia_oraria` ENUM ('Mattina', 'Pomeriggio', 'Sera', 'Notte') NOT NULL,
    `id_utente` INTEGER UNSIGNED NOT NULL,
    `id_canale` INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `programma_preferito` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`fascia_oraria` ENUM ('Mattina', 'Pomeriggio', 'Sera', 'Notte') NOT NULL,
    `id_utente` INTEGER UNSIGNED NOT NULL,
    `id_programma` INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY(`id`)
);

-- > INIZIO FOREIGN KEY
-- DA VEDERE GLI UPDATE E LE DELETE DI "PALINSESTO" ENTRAMBE LE FOREIGN
-- IL TOOL DICEVA DI METTERE GLI INDEX
ALTER TABLE `guida_tv`.`palinsesto` 
ADD CONSTRAINT `id_canale_programma`
FOREIGN KEY (`id_canale`)
REFERENCES `guida_tv`.`canale` (`id`)
ON DELETE NO ACTION 	--
ON UPDATE NO ACTION; 	--

ALTER TABLE `guida_tv`.`palinsesto` 
ADD CONSTRAINT `id_programma_canale`
FOREIGN KEY (`id_programma`)
REFERENCES `guida_tv`.`programma` (`id`)
ON DELETE CASCADE		--
ON UPDATE NO ACTION;	--

ALTER TABLE `guida_tv`.`partecipa` 
ADD CONSTRAINT `id_programma_persona`
FOREIGN KEY (`id_programma`)
REFERENCES `guida_tv`.`programma` (`id`)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE `guida_tv`.`partecipa` 
ADD CONSTRAINT `id_persona_programma`
FOREIGN KEY (`id_persona`)
REFERENCES `guida_tv`.`persona` (`id`)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE `guida_tv`.`possiede` 
ADD CONSTRAINT `id_programma_genere`
FOREIGN KEY (`id_programma`)
REFERENCES `guida_tv`.`programma` (`id`)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE `guida_tv`.`possiede` 
ADD CONSTRAINT `id_genere_programma`
FOREIGN KEY (`id_genere`)
REFERENCES `guida_tv`.`genere` (`id`)
ON DELETE NO ACTION
ON UPDATE CASCADE;

ALTER TABLE `guida_tv`.`canale_preferito` 
ADD CONSTRAINT `id_utente_canale`
FOREIGN KEY (`id_utente`)
REFERENCES `guida_tv`.`utente` (`id`)
ON DELETE NO ACTION		--
ON UPDATE NO ACTION;	--

ALTER TABLE `guida_tv`.`canale_preferito` 
ADD CONSTRAINT `id_canale_utente`
FOREIGN KEY (`id_canale`)
REFERENCES `guida_tv`.`canale` (`id`)
ON DELETE NO ACTION		--
ON UPDATE NO ACTION;	--

ALTER TABLE `guida_tv`.`programma_preferito` 
ADD CONSTRAINT `id_utente_programma`
FOREIGN KEY (`id_utente`)
REFERENCES `guida_tv`.`utente` (`id`)
ON DELETE NO ACTION		--
ON UPDATE NO ACTION;	--

ALTER TABLE `guida_tv`.`programma_preferito` 
ADD CONSTRAINT `id_programma_utente`
FOREIGN KEY (`id_programma`)
REFERENCES `guida_tv`.`programma` (`id`)
ON DELETE CASCADE		--
ON UPDATE NO ACTION;	--


-- > FINEFOREIGN KEY

-- > INSERT
INSERT INTO `guida_tv`.`utente` (`email`, `pwd`) VALUES ('g', 'g');
INSERT INTO `guida_tv`.`utente` (`email`, `pwd`) VALUES ('a', 'a');

INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Rai 1', '1');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Rai 2', '2');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Rai 3', '3');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Canale 4', '4');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Canale 5', '5');
INSERT INTO `guida_tv`.`canale` (`nome`, `numero`) VALUES ('Italia 1', '6');

INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Giallo');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Horror');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Pirati');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Montagna');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Collina');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Guerra');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Anime');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Fantascienza');

INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Robert', 'De Niro');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Stefano', 'Fattore');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Tommaso', 'De Luca');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Marco', 'Terracina');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Marco', 'Main');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Giuseppe', 'Della Penna');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Amleto', 'Di Salle');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Massimo', 'Tivoli');
INSERT INTO `guida_tv`.`persona` (`nome`, `cognome`) VALUES ('Pierluigi', 'Zobel');

INSERT INTO `guida_tv`.`programma` (`titolo`, `durata`, `descizione`, `anno_uscita`, `produttore`) VALUES ('Film 1', '01:00:00', 'Descrizione 1', '1950-05-26', 'Io');
INSERT INTO `guida_tv`.`programma` (`titolo`, `durata`, `descizione`, `anno_uscita`, `produttore`) VALUES ('Film 2', '01:00:15', 'Descrizione 2', '1951-05-26', 'Gatto');
INSERT INTO `guida_tv`.`programma` (`titolo`, `durata`, `descizione`, `anno_uscita`, `produttore`) VALUES ('Film 3', '01:00:30', 'Descrizione 3', '1952-05-26', 'Io');
INSERT INTO `guida_tv`.`programma` (`titolo`, `durata`, `descizione`, `anno_uscita`, `stagione`, `episodio`, `produttore`, `descrizione_episodio`) VALUES ('Serie 1', '01:15:00', 'Descrizione 4', '1953-05-26', '1', '6', 'Gatto', 'Descrizione Episodio');
INSERT INTO `guida_tv`.`programma` (`titolo`, `durata`, `descizione`, `anno_uscita`, `stagione`, `episodio`, `produttore`, `descrizione_episodio`) VALUES ('Serie 2', '01:30:00', 'Descrizione 5', '1954-05-26', '5', '8', 'Io', 'Descrizione Episodio');

INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-26', '00:00:00', '00:00:00', '1', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-27', '00:00:00', '00:00:00', '1', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-28', '00:00:00', '00:00:00', '2', '2');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-26', '00:00:00', '00:00:00', '3', '3');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-27', '00:00:00', '00:00:00', '4', '4');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-28', '00:00:00', '00:00:00', '5', '1');
INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-05-28', '00:00:00', '00:00:00', '1', '2');

INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('1', '1');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('2', '1');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('3', '2');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('3', '3');
INSERT INTO `guida_tv`.`possiede` (`id_programma`, `id_genere`) VALUES ('4', '1');

INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('1', '1', 'aa');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('2', '1', 'bb');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('3', '1', 'cc');
INSERT INTO `guida_tv`.`partecipa` (`id_programma`, `id_persona`, `ruolo`) VALUES ('4', '2', 'dd');

INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('Mattino', 1, 1);
INSERT INTO `guida_tv`.`canale_preferito` (`fascia_oraria`, `id_utente`, `id_canale`) VALUES ('Mattino', 1, 2);


-- E LA 6
-- DELETE FROM `guida_tv`.`programma` WHERE (`id` = '1');

