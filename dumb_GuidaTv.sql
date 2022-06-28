CREATE DATABASE  IF NOT EXISTS `guida_tv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `guida_tv`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: guida_tv
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `canale`
--

DROP TABLE IF EXISTS `canale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `numero` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `nome_canale_unique` (`nome`),
  UNIQUE KEY `numero_canale_unique` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canale`
--

LOCK TABLES `canale` WRITE;
/*!40000 ALTER TABLE `canale` DISABLE KEYS */;
INSERT INTO `canale` VALUES (1,'Rai 1',1),(2,'Rai 2',2),(3,'Rai 3',3),(4,'Canale 4',4),(5,'Canale 5',5),(6,'Italia 1',6);
/*!40000 ALTER TABLE `canale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canale_preferito`
--

DROP TABLE IF EXISTS `canale_preferito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canale_preferito` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fascia_oraria` enum('Mattina','Pomeriggio','Sera','Notte') DEFAULT NULL,
  `id_utente` int unsigned NOT NULL,
  `id_canale` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utente_canale` (`id_utente`),
  KEY `id_canale_utente` (`id_canale`),
  CONSTRAINT `id_canale_utente` FOREIGN KEY (`id_canale`) REFERENCES `canale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_utente_canale` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canale_preferito`
--

LOCK TABLES `canale_preferito` WRITE;
/*!40000 ALTER TABLE `canale_preferito` DISABLE KEYS */;
INSERT INTO `canale_preferito` VALUES (1,'Mattina',1,1),(2,'Pomeriggio',2,2),(3,'Sera',3,3),(4,'Pomeriggio',4,2);
/*!40000 ALTER TABLE `canale_preferito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genere`
--

DROP TABLE IF EXISTS `genere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genere` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_genere_unique` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genere`
--

LOCK TABLES `genere` WRITE;
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` VALUES (1,'Animazione'),(2,'Avventura'),(3,'Biografico'),(4,'Comico'),(5,'Commedia'),(6,'Drammatico'),(15,'Erotico'),(7,'Fantascienza'),(8,'Fantasy'),(9,'Giallo'),(10,'Guerra'),(11,'Horror'),(12,'Spionaggio'),(13,'Storico'),(14,'Western');
/*!40000 ALTER TABLE `genere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palinsesto`
--

DROP TABLE IF EXISTS `palinsesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palinsesto` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `giorno` date NOT NULL,
  `ora_inizio` time NOT NULL,
  `ora_fine` time NOT NULL,
  `id_canale` int unsigned NOT NULL,
  `id_programma` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_canale_programma` (`id_canale`),
  KEY `id_programma_canale` (`id_programma`),
  CONSTRAINT `id_canale_programma` FOREIGN KEY (`id_canale`) REFERENCES `canale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_programma_canale` FOREIGN KEY (`id_programma`) REFERENCES `programma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palinsesto`
--

LOCK TABLES `palinsesto` WRITE;
/*!40000 ALTER TABLE `palinsesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `palinsesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partecipa`
--

DROP TABLE IF EXISTS `partecipa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partecipa` (
  `id_programma` int unsigned NOT NULL,
  `id_persona` int unsigned NOT NULL,
  `ruolo` varchar(32) NOT NULL,
  PRIMARY KEY (`id_programma`,`id_persona`),
  KEY `id_persona_programma` (`id_persona`),
  CONSTRAINT `id_persona_programma` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_programma_persona` FOREIGN KEY (`id_programma`) REFERENCES `programma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partecipa`
--

LOCK TABLES `partecipa` WRITE;
/*!40000 ALTER TABLE `partecipa` DISABLE KEYS */;
INSERT INTO `partecipa` VALUES (1,10,'attore'),(2,9,'attore'),(3,8,'regista'),(4,7,'attore'),(5,6,'regista'),(6,10,'attore'),(7,9,'attore'),(8,8,'attore'),(9,7,'attore'),(10,6,'attore'),(11,1,'regista'),(12,2,'attore'),(13,3,'regista'),(14,4,'attore'),(15,5,'regista');
/*!40000 ALTER TABLE `partecipa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `cognome` varchar(64) NOT NULL,
  `data_di_nascita` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Giuseppe','Della Penna','2022-06-01'),(2,'Stefano','Fattore','2022-06-01'),(3,'Tommaso','De Luca','2022-06-01'),(4,'Marco','Terracina','2022-06-01'),(5,'Marco','Main','2022-06-01'),(6,'Massimo','Tivoli','2022-06-01'),(7,'Pierluigi','Zobel','2022-06-01'),(8,'Federica','Cucchiella','2022-06-01'),(9,'Paolo','De Fabritiis','2022-06-01'),(10,'Mauro','Zannetti','2022-06-01'),(11,'Poalo','Di Stefano','2022-06-01'),(12,'Roberto','Carapellucci','2022-06-01'),(13,'Mario','Pelino','2022-06-01'),(14,'Amleto','Di Salle','2022-06-01'),(15,'Elisabetta','Santi','2022-06-01'),(16,'Antonio','Ometto','2022-06-01'),(17,'Gabriele','Curci','2022-06-01'),(18,'Elia','Palange','2022-06-01'),(19,'Fulvio','Zuanni','2022-06-01');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possiede`
--

DROP TABLE IF EXISTS `possiede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possiede` (
  `id_programma` int unsigned NOT NULL,
  `id_genere` int unsigned NOT NULL,
  PRIMARY KEY (`id_programma`,`id_genere`),
  KEY `id_genere_programma` (`id_genere`),
  CONSTRAINT `id_genere_programma` FOREIGN KEY (`id_genere`) REFERENCES `genere` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_programma_genere` FOREIGN KEY (`id_programma`) REFERENCES `programma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possiede`
--

LOCK TABLES `possiede` WRITE;
/*!40000 ALTER TABLE `possiede` DISABLE KEYS */;
INSERT INTO `possiede` VALUES (2,1),(3,1),(3,2),(4,2),(1,10),(5,10),(6,10),(7,10),(8,10),(9,10),(10,10),(11,10),(12,10),(13,10),(14,10),(15,10);
/*!40000 ALTER TABLE `possiede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programma`
--

DROP TABLE IF EXISTS `programma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programma` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titolo` varchar(64) NOT NULL,
  `durata` time NOT NULL,
  `descizione` varchar(128) NOT NULL,
  `anno_uscita` date NOT NULL,
  `stagione` tinyint DEFAULT NULL,
  `episodio` mediumint DEFAULT NULL,
  `produttore` varchar(50) NOT NULL,
  `descrizione_episodio` varchar(128) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `immagine` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programma`
--

LOCK TABLES `programma` WRITE;
/*!40000 ALTER TABLE `programma` DISABLE KEYS */;
INSERT INTO `programma` VALUES (1,'Rambo 1','01:15:00','classico film di guerra','2000-08-17',NULL,NULL,'Produttore 1',NULL,'',''),(2,'Rocky','01:45:00','box','2000-09-17',NULL,NULL,'Produttore 2',NULL,'',''),(3,'Aladino','02:00:00','siamo nella sabbia','2003-08-18',NULL,NULL,'Produttore 3',NULL,'',''),(4,'Io sono leggenda','03:15:00','uno contro tutti','2010-04-27',NULL,NULL,'Produttore 4',NULL,'',''),(5,'Pirati dei caraibi: La maledizione della prima luna ','02:00:00','pirati contro tutti','2000-03-21',NULL,NULL,'Produttore 5',NULL,'',''),(6,'Pirati dei caraibi: La maledizione del forziere','02:15:00','pirati uno contro tutti','2005-01-02',NULL,NULL,'Produttore 5',NULL,'',''),(7,'Pirati dei caraibi: Ai confini del mondo','02:45:00','pirati uno contro tutti','2008-06-15',NULL,NULL,'Produttore 5',NULL,'',''),(8,'Games of trones','00:45:00','serie sui ghiacci','2017-02-01',1,1,'Produttore 5',NULL,'',''),(9,'Games of trones','00:45:00','serie sui ghiacci','2017-02-01',1,2,'Produttore 5',NULL,'',''),(10,'Games of trones','00:45:00','serie sui ghiacci','2017-02-01',1,3,'Produttore 5',NULL,'',''),(11,'Games of trones','00:45:00','serie sui ghiacci','2017-02-01',1,4,'Produttore 5',NULL,'',''),(12,'Games of trones','00:45:00','serie sui ghiacci','2017-02-01',1,5,'Produttore 5',NULL,'',''),(13,'Games of trones','00:45:00','serie sui ghiacci','2017-02-01',1,6,'Produttore 5',NULL,'',''),(14,'Games of trones','00:45:00','serie sui ghiacci','2017-02-01',1,7,'Produttore 5',NULL,'',''),(15,'Games of trones','00:45:00','serie sui ghiacci','2017-02-01',1,8,'Produttore 5',NULL,'','');
/*!40000 ALTER TABLE `programma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programma_preferito`
--

DROP TABLE IF EXISTS `programma_preferito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programma_preferito` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_utente` int unsigned NOT NULL,
  `id_programma` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utente_programma` (`id_utente`),
  KEY `id_programma_utente` (`id_programma`),
  CONSTRAINT `id_programma_utente` FOREIGN KEY (`id_programma`) REFERENCES `programma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_utente_programma` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programma_preferito`
--

LOCK TABLES `programma_preferito` WRITE;
/*!40000 ALTER TABLE `programma_preferito` DISABLE KEYS */;
INSERT INTO `programma_preferito` VALUES (1,1,2),(2,2,4),(3,3,5),(4,4,6),(5,1,1),(6,2,7),(7,3,8),(8,4,1);
/*!40000 ALTER TABLE `programma_preferito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_utente_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'diegidiogabriele@gmail.com','1234'),(2,'andreasegnalini@gmail.com','1234'),(3,'prova1@gmail.com','1234'),(4,'prova2@gmail.com','1234');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'guida_tv'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `auto_delete_programs` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `auto_delete_programs` ON SCHEDULE EVERY 1 WEEK STARTS '2022-06-29 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN    
		
		DECLARE pid INTEGER UNSIGNED;
		DECLARE curs CURSOR FOR SELECT * FROM new_tbl;       
        
		CREATE TEMPORARY TABLE new_tbl SELECT prog.id
			FROM `guida_tv`.`programma` prog
			JOIN `guida_tv`.`palinsesto` pal ON pal.id_programma = prog.id
			WHERE pal.giorno < DATE_SUB(curdate(), INTERVAL 1 WEEK);

		OPEN curs;
		LOOP
			FETCH curs INTO pid;
			DELETE FROM `guida_tv`.`programma` WHERE (`id` = pid);
		END LOOP; 
        CLOSE curs;
		DROP TABLE IF EXISTS new_tbl;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'guida_tv'
--
/*!50003 DROP PROCEDURE IF EXISTS `genera_palinsesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `genera_palinsesto`(IN giorno_param DATE, IN ora_inizio_param TIME,  IN ora_fine_param TIME, IN id_canale_param INTEGER, IN id_programma_param INTEGER)
BEGIN

	DECLARE durata_programma TIME;
	DECLARE ultimate_ora_fine TIME;
    SET durata_programma = (SELECT prog.durata FROM `guida_tv`.`programma` prog WHERE prog.id = id_programma_param);
	SET ultimate_ora_fine = (SELECT p.ora_fine FROM `guida_tv`.`palinsesto` p WHERE p.id_canale = id_canale_param AND p.giorno = giorno_param ORDER BY p.ora_fine DESC LIMIT 1);
       
	IF (giorno_param > (curdate() + 7))
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi programmare un palinsesto così in avanti';    
	ELSEIF (giorno_param < curdate() )
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi programmare un palinsesto per giorni precedenti a oggi';
	ELSEIF (ora_inizio_param + durata_programma > ora_fine_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hai sbagliato l\'orario di fine';
	ELSEIF (ultimate_ora_fine IS NOT NULL AND ultimate_ora_fine > ora_inizio_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi inserire un programma nello spazio di un altro';
	ELSEIF EXISTS 
		(SELECT DISTINCT p.id FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.id_canale = id_canale_param 
														AND p.ora_inizio = ora_inizio_param AND p.ora_fine = ora_fine_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi inserire un duplicato';
	END IF;
    
	INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`)
							VALUES (giorno_param, ora_inizio_param, ora_fine_param , id_canale_param, id_programma_param);
                            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_attore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_attore`(IN nome_param VARCHAR(64), IN cognome_param VARCHAR(32), IN data_di_nascita_param DATE)
BEGIN
		IF (data_di_nascita_param > curdate()) 
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Forse hai sbagliato la data di nascita';
		END IF;
        
		IF EXISTS (SELECT * FROM `guida_tv`.persona p WHERE p.nome = nome_param AND p.cognome = cognome_param AND p.data_di_nascita = data_di_nascita_param)
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Attore già esistente';
		END IF;

		INSERT INTO `guida_tv`.persona(`nome`, `cognome`, `data_di_nascita`) VALUES (nome_param, cognome_param, data_di_nascita_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_canale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_canale`(IN nome_param VARCHAR(64), IN numero_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.canale(`nome`, `numero`) VALUES (nome_param, numero_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_episodio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_episodio`(IN titolo_param VARCHAR(64),
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_film` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_film`(IN titolo_param VARCHAR(64),
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signUp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signUp`(IN email_param VARCHAR(64), IN pwd_param VARCHAR(32))
BEGIN
		IF (SELECT email_param NOT REGEXP '[a-zA-Z0-9._-].*@[a-zA-Z0-9._-].*\\.[a-zA-Z0-9].')
			THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'email inserita non corretta';
			ELSE
				INSERT INTO `guida_tv`.utente(`email`, `pwd`) VALUES (email_param, pwd_param);
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-29  1:20:12
