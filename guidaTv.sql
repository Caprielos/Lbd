DROP DATABASE IF EXISTS `guida_tv`;
CREATE DATABASE IF NOT EXISTS `guida_tv`;
USE `guida_tv`;

-- INIZIO CREAZIONE TABELLE

DROP TABLE IF EXISTS `utente`;
CREATE TABLE `utente` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(64) NOT NULL UNIQUE,
    `pwd` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`,`email`)
);

DROP TABLE IF EXISTS `canale`;
CREATE TABLE `canale` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(64) NOT NULL UNIQUE,
    `numero` INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY(`id`,`nome`)
);

DROP TABLE IF EXISTS  `palinsesto`;
CREATE TABLE `palinsesto` (
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`giorno` DATE,
ora_inizio TIME,
ora_fine TIME,
PRIMARY KEY(id,giorno)
);

DROP TABLE IF EXISTS  `programma`;
CREATE TABLE `programma` (
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
titolo VARCHAR(64),
durata TIME,
descizione VARCHAR(128),
anno_uscita DATE,
stagione TINYINT,
episodio TINYINT,
`path` VARCHAR(255),
imagine LONGBLOB,
PRIMARY KEY(id,titolo,anno_uscita,stagione,episodi)
);

DROP TABLE IF EXISTS  `programma`;
CREATE TABLE `programma` (
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
nome ENUM("animazione","avventura","azione"),
PRIMARY KEY(id,nome)
);

