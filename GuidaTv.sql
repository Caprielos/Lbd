DROP DATABASE IF EXISTS `GuidaTv`;
CREATE DATABASE IF NOT EXISTS `GuidaTv`;
USE `GuidaTv`;

-- INIZIO CREAZIONE TABELLE (semplici)

-- OK
DROP TABLE IF EXISTS `utente`;
CREATE TABLE `utente` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(64) NOT NULL UNIQUE,
    `pwd` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`,`email`)
);

-- OK
DROP TABLE IF EXISTS `canale`;
CREATE TABLE `canale` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `numero` INTEGER UNSIGNED NOT NULL UNIQUE,
    `nome` VARCHAR(60) NOT NULL,
     PRIMARY KEY(`id`,`numero`)
);
INSERT INTO `canale` (`numero`,`nome`) VALUES (1,"Rai 1"),(2,"Rai 2"),(3,"Rai 3"),(4,"Rete 4");

-- OK
DROP TABLE IF EXISTS `palinsesto`;
CREATE TABLE `palinsesto` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `giorno` DATE,
     PRIMARY KEY(`id`,`giorno`)
);

-- Entità debole -- DA VEDERE LA SCELTA DELLE CHIAVI
-- visto che la relazione è 1,1 metto gli attributi di link dentro il programma
-- Quindi è ancora entità debole? Chiedere a Stefano
DROP TABLE IF EXISTS `programma`;
CREATE TABLE `programma`(
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `titolo` VARCHAR(64) NOT NULL,
    `durata` TIME,
    `data_pubbl` DATE NOT NULL,
    `descrizione` VARCHAR(128) NOT NULL,
    `ora_inizio` TIME,
    `ora_fine` TIME,
	`path` VARCHAR(255),
    `immagine` LONGBLOB,
    `id_padre` INTEGER UNSIGNED,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`id_padre`) REFERENCES `programma`(`id`) ON DELETE CASCADE
);

-- OK
DROP TABLE IF EXISTS `genere`;
CREATE TABLE `genere` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` ENUM('Animazione','Avventura','Azione','Biografico','Commedia','Documentario','Fantascienza'),
     PRIMARY KEY(`id`)
);

-- Entità debole -- DA VEDERE LA SCELTA DELLE CHIAVI
DROP TABLE IF EXISTS `persone`;
CREATE TABLE `persone` (
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(32) NOT NULL,
    `cognome` VARCHAR(32) NOT NULL,
    `ruolo` VARCHAR(32) NOT NULL,
    `titolo` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

-- DA VEDERE LA SCELTA DELLE CHIAVI
DROP TABLE IF EXISTS `storico`;
CREATE TABLE `storico`(
	`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `titolo` VARCHAR(64) NOT NULL,
    `durata` TEXT NOT NULL,
    `descrizione` VARCHAR(128) NOT NULL,
    `ora_inizio` TIME NOT NULL,
    `ora_fine` TIME NOT NULL,
    PRIMARY KEY(`id`)
);

-- FINE CREAZIONE TABELLE (semplici)

-- MODIFICARE LE TABELLE




