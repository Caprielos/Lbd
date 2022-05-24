CREATE DATABASE  IF NOT EXISTS `guida_tv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `guida_tv`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: guida_tv
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
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canale`
--

LOCK TABLES `canale` WRITE;
/*!40000 ALTER TABLE `canale` DISABLE KEYS */;
/*!40000 ALTER TABLE `canale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprende`
--

DROP TABLE IF EXISTS `comprende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprende` (
  `id_palinsesto` int unsigned NOT NULL,
  `id_programma` int unsigned NOT NULL,
  PRIMARY KEY (`id_palinsesto`,`id_programma`),
  KEY `id_programma_palinsesto` (`id_programma`),
  CONSTRAINT `id_palinsesto_programma` FOREIGN KEY (`id_palinsesto`) REFERENCES `palinsesto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_programma_palinsesto` FOREIGN KEY (`id_programma`) REFERENCES `programma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprende`
--

LOCK TABLES `comprende` WRITE;
/*!40000 ALTER TABLE `comprende` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprende` ENABLE KEYS */;
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
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genere`
--

LOCK TABLES `genere` WRITE;
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` VALUES (2,'Avventura'),(1,'Azione'),(3,'Fantascienza'),(4,'Romantico'),(5,'Sangue');
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
  PRIMARY KEY (`id`)
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
  `ruolo` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
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
  CONSTRAINT `id_genere_programma` FOREIGN KEY (`id_genere`) REFERENCES `genere` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `id_programma_genere` FOREIGN KEY (`id_programma`) REFERENCES `programma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possiede`
--

LOCK TABLES `possiede` WRITE;
/*!40000 ALTER TABLE `possiede` DISABLE KEYS */;
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
  `path` varchar(255) DEFAULT NULL,
  `immagine` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programma`
--

LOCK TABLES `programma` WRITE;
/*!40000 ALTER TABLE `programma` DISABLE KEYS */;
/*!40000 ALTER TABLE `programma` ENABLE KEYS */;
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
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'diegidiogabriele@gmail.com','825f9cd5f0390bc77c1fed3c94885c87');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'guida_tv'
--

--
-- Dumping routines for database 'guida_tv'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 12:42:21
