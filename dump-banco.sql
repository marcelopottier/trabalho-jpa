CREATE DATABASE  IF NOT EXISTS `new_schema` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `new_schema`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: new_schema
-- ------------------------------------------------------
-- Server version	5.5.5-10.10.2-MariaDB

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
-- Table structure for table `feedatividades`
--

DROP TABLE IF EXISTS `feedatividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedatividades` (
  `feedId` bigint(20) NOT NULL,
  `usuarioId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`feedId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `feedatividades_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedatividades`
--

LOCK TABLES `feedatividades` WRITE;
/*!40000 ALTER TABLE `feedatividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedatividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedatividades_musica`
--

DROP TABLE IF EXISTS `feedatividades_musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedatividades_musica` (
  `feedId` bigint(20) NOT NULL,
  `musicaId` bigint(20) NOT NULL,
  PRIMARY KEY (`feedId`,`musicaId`),
  KEY `musicaId` (`musicaId`),
  CONSTRAINT `feedatividades_musica_ibfk_1` FOREIGN KEY (`feedId`) REFERENCES `feedatividades` (`feedId`),
  CONSTRAINT `feedatividades_musica_ibfk_2` FOREIGN KEY (`musicaId`) REFERENCES `musica` (`musicaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedatividades_musica`
--

LOCK TABLES `feedatividades_musica` WRITE;
/*!40000 ALTER TABLE `feedatividades_musica` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedatividades_musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letra`
--

DROP TABLE IF EXISTS `letra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `letra` (
  `letraId` bigint(20) NOT NULL,
  `conteudo` text NOT NULL,
  `musicaId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`letraId`),
  KEY `musicaId` (`musicaId`),
  CONSTRAINT `letra_ibfk_1` FOREIGN KEY (`musicaId`) REFERENCES `musica` (`musicaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letra`
--

LOCK TABLES `letra` WRITE;
/*!40000 ALTER TABLE `letra` DISABLE KEYS */;
/*!40000 ALTER TABLE `letra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `musicaId` bigint(20) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `artista` varchar(255) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`musicaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `playlistId` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `publica` tinyint(1) DEFAULT 0,
  `usuarioId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`playlistId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_musica`
--

DROP TABLE IF EXISTS `playlist_musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_musica` (
  `playlistId` bigint(20) NOT NULL,
  `musicaId` bigint(20) NOT NULL,
  PRIMARY KEY (`playlistId`,`musicaId`),
  KEY `musicaId` (`musicaId`),
  CONSTRAINT `playlist_musica_ibfk_1` FOREIGN KEY (`playlistId`) REFERENCES `playlist` (`playlistId`),
  CONSTRAINT `playlist_musica_ibfk_2` FOREIGN KEY (`musicaId`) REFERENCES `musica` (`musicaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_musica`
--

LOCK TABLES `playlist_musica` WRITE;
/*!40000 ALTER TABLE `playlist_musica` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendacao`
--

DROP TABLE IF EXISTS `recomendacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendacao` (
  `recomendacaoId` bigint(20) NOT NULL,
  `dataGeracao` date NOT NULL,
  `usuarioId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`recomendacaoId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `recomendacao_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendacao`
--

LOCK TABLES `recomendacao` WRITE;
/*!40000 ALTER TABLE `recomendacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `recomendacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendacao_musica`
--

DROP TABLE IF EXISTS `recomendacao_musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendacao_musica` (
  `recomendacaoId` bigint(20) NOT NULL,
  `musicaId` bigint(20) NOT NULL,
  PRIMARY KEY (`recomendacaoId`,`musicaId`),
  KEY `musicaId` (`musicaId`),
  CONSTRAINT `recomendacao_musica_ibfk_1` FOREIGN KEY (`recomendacaoId`) REFERENCES `recomendacao` (`recomendacaoId`),
  CONSTRAINT `recomendacao_musica_ibfk_2` FOREIGN KEY (`musicaId`) REFERENCES `musica` (`musicaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendacao_musica`
--

LOCK TABLES `recomendacao_musica` WRITE;
/*!40000 ALTER TABLE `recomendacao_musica` DISABLE KEYS */;
/*!40000 ALTER TABLE `recomendacao_musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuarioId` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`usuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_musica_baixada`
--

DROP TABLE IF EXISTS `usuario_musica_baixada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_musica_baixada` (
  `usuarioId` bigint(20) NOT NULL,
  `musicaId` bigint(20) NOT NULL,
  PRIMARY KEY (`usuarioId`,`musicaId`),
  KEY `musicaId` (`musicaId`),
  CONSTRAINT `usuario_musica_baixada_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`),
  CONSTRAINT `usuario_musica_baixada_ibfk_2` FOREIGN KEY (`musicaId`) REFERENCES `musica` (`musicaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_musica_baixada`
--

LOCK TABLES `usuario_musica_baixada` WRITE;
/*!40000 ALTER TABLE `usuario_musica_baixada` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_musica_baixada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_playlist_baixada`
--

DROP TABLE IF EXISTS `usuario_playlist_baixada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_playlist_baixada` (
  `usuarioId` bigint(20) NOT NULL,
  `playlistId` bigint(20) NOT NULL,
  PRIMARY KEY (`usuarioId`,`playlistId`),
  KEY `playlistId` (`playlistId`),
  CONSTRAINT `usuario_playlist_baixada_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`),
  CONSTRAINT `usuario_playlist_baixada_ibfk_2` FOREIGN KEY (`playlistId`) REFERENCES `playlist` (`playlistId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_playlist_baixada`
--

LOCK TABLES `usuario_playlist_baixada` WRITE;
/*!40000 ALTER TABLE `usuario_playlist_baixada` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_playlist_baixada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_seguindo`
--

DROP TABLE IF EXISTS `usuario_seguindo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_seguindo` (
  `usuarioId` bigint(20) NOT NULL,
  `amigoId` bigint(20) NOT NULL,
  PRIMARY KEY (`usuarioId`,`amigoId`),
  KEY `amigoId` (`amigoId`),
  CONSTRAINT `usuario_seguindo_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`),
  CONSTRAINT `usuario_seguindo_ibfk_2` FOREIGN KEY (`amigoId`) REFERENCES `usuario` (`usuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_seguindo`
--

LOCK TABLES `usuario_seguindo` WRITE;
/*!40000 ALTER TABLE `usuario_seguindo` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_seguindo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 20:32:55
