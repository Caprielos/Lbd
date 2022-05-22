DROP DATABASE IF EXISTS `guida_tv`;
CREATE DATABASE IF NOT EXISTS `guida_tv`;
USE `guida_tv`;

DROP TABLE IF EXISTS `utente`;
DROP TABLE IF EXISTS `canale`;
DROP TABLE IF EXISTS `palinsesto`;
DROP TABLE IF EXISTS `programma`;
DROP TABLE IF EXISTS `genere`;
DROP TABLE IF EXISTS `persone`;
DROP TABLE IF EXISTS `composto`;
DROP TABLE IF EXISTS `comprende`;
DROP TABLE IF EXISTS `ha`;

-- INIZIO CREAZIONE TABELLE

CREATE TABLE `utente` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(64) NOT NULL UNIQUE,
    `pwd` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`,`email`)
);

CREATE TABLE `canale` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(64) NOT NULL UNIQUE,
    `numero` INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY(`id`,`nome`)
);

CREATE TABLE `palinsesto` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`giorno` DATE NOT NULL,
	`ora_inizio` TIME NOT NULL,
	`ora_fine` TIME NOT NULL,
	PRIMARY KEY(`id`, `giorno`)
);

CREATE TABLE `programma` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`titolo` VARCHAR(64) NOT NULL,
	`durata` TIME NOT NULL,
	`descizione` VARCHAR(128) NOT NULL,
	`anno_uscita` DATE NOT NULL,
	`stagione` TINYINT NOT NULL,
	`episodio` TINYINT NOT NULL,
	`path` VARCHAR(255),
	`immagine` LONGBLOB,
	PRIMARY KEY(`id`, `titolo`, `anno_uscita`, `stagione`, `episodio`)
);

CREATE TABLE `genere` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(64) NOT NULL,
	PRIMARY KEY(`id`, `nome`)
);

CREATE TABLE `persone` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(64) NOT NULL,
    `cognome` VARCHAR(64) NOT NULL,
    `ruolo` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `composto` (
	`id_canale` INTEGER UNSIGNED,
    `id_palinsesto` INTEGER UNSIGNED,
    PRIMARY KEY(`id_canale`, `id_palinsesto`)
    -- FOREIGN KEY
);

CREATE TABLE `comprende` (
	`id_palinsesto` INTEGER UNSIGNED,
	`id_programma` INTEGER UNSIGNED,
    
      -- FOREIGN KEY
    PRIMARY KEY( `id_palinsesto`, `id_programma`)
);

CREATE TABLE `ha` (
	`id_programma` INTEGER UNSIGNED,
	`id_genere` INTEGER UNSIGNED,
    PRIMARY KEY(`id_programma`, `id_genere`)
);

INSERT INTO `genere` (`nome`) VALUES ("Azione"),("Avventura"),("Fantascienza"),("Romantico"),("Sangue");
