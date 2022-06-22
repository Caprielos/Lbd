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
DROP TABLE IF EXISTS `canale_preferito`;
DROP TABLE IF EXISTS `programma_preferito`;

CREATE TABLE `utente` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(64) NOT NULL,
    `pwd` VARCHAR(32) NOT NULL,
    `orario_email` ENUM ('Mattina', 'Pomeriggio', 'Sera'),
    PRIMARY KEY(`id`)
);

CREATE TABLE `canale` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(64) NOT NULL UNIQUE,
    `numero` INTEGER UNSIGNED NOT NULL UNIQUE,
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
	`nome` VARCHAR(64) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `persona` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(64) NOT NULL,
    `cognome` VARCHAR(64) NOT NULL,
    `data_di_nascita` DATE NOT NULL,
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
	`fascia_oraria` ENUM ('Mattina', 'Pomeriggio', 'Sera', 'Notte'),
    `id_utente` INTEGER UNSIGNED NOT NULL,
    `id_canale` INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `programma_preferito` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_utente` INTEGER UNSIGNED NOT NULL,
    `id_programma` INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY(`id`)
);

-- > INIZIO FOREIGN KEY
-- DA VEDERE GLI UPDATE E LE DELETE DI "PALINSESTO" ENTRAMBE LE FOREIGN
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
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE `guida_tv`.`canale_preferito` 
ADD CONSTRAINT `id_utente_canale`
FOREIGN KEY (`id_utente`)
REFERENCES `guida_tv`.`utente` (`id`)
ON DELETE CASCADE	--
ON UPDATE CASCADE;	--

ALTER TABLE `guida_tv`.`canale_preferito` 
ADD CONSTRAINT `id_canale_utente`
FOREIGN KEY (`id_canale`)
REFERENCES `guida_tv`.`canale` (`id`)
ON DELETE CASCADE		--
ON UPDATE CASCADE;		--

ALTER TABLE `guida_tv`.`programma_preferito` 
ADD CONSTRAINT `id_utente_programma`
FOREIGN KEY (`id_utente`)
REFERENCES `guida_tv`.`utente` (`id`)
ON DELETE CASCADE		--
ON UPDATE CASCADE;	    --

ALTER TABLE `guida_tv`.`programma_preferito` 
ADD CONSTRAINT `id_programma_utente`
FOREIGN KEY (`id_programma`)
REFERENCES `guida_tv`.`programma` (`id`)
ON DELETE CASCADE		--
ON UPDATE CASCADE;	    --

-- Vincoli

ALTER TABLE `guida_tv`.`utente` 
ADD CONSTRAINT email_utente_unique UNIQUE (`email`);

ALTER TABLE `guida_tv`.`canale` 
ADD CONSTRAINT nome_canale_unique UNIQUE (`nome`);

ALTER TABLE `guida_tv`.`canale` 
ADD CONSTRAINT numero_canale_unique UNIQUE (`numero`);

ALTER TABLE `guida_tv`.`genere` 
ADD CONSTRAINT nome_genere_unique UNIQUE (`nome`);


