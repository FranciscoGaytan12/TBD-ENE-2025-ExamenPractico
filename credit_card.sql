-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: tarjetas
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bancosemisores`
--

DROP TABLE IF EXISTS `bancosemisores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bancosemisores` (
  `BancoID` int NOT NULL AUTO_INCREMENT,
  `NombreBanco` varchar(100) NOT NULL,
  PRIMARY KEY (`BancoID`),
  UNIQUE KEY `NombreBanco` (`NombreBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancosemisores`
--

LOCK TABLES `bancosemisores` WRITE;
/*!40000 ALTER TABLE `bancosemisores` DISABLE KEYS */;
INSERT INTO `bancosemisores` VALUES (1,'American Express'),(5,'Bank of America'),(6,'Chase'),(2,'Citibank'),(3,'Diners Club'),(7,'Discover'),(4,'JCB'),(8,'PNC');
/*!40000 ALTER TABLE `bancosemisores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetas` (
  `TarjetaID` int NOT NULL AUTO_INCREMENT,
  `TipoTarjetaID` int NOT NULL,
  `BancoID` int NOT NULL,
  `NumeroTarjeta` varchar(20) NOT NULL,
  `TitularID` int NOT NULL,
  `CVV` varchar(10) NOT NULL,
  `FechaEmision` int NOT NULL,
  `FechaExpiracion` int NOT NULL,
  `FechaFacturacion` int NOT NULL,
  `PIN` varchar(10) NOT NULL,
  `LimiteCredito` decimal(12,2) NOT NULL,
  PRIMARY KEY (`TarjetaID`),
  UNIQUE KEY `NumeroTarjeta` (`NumeroTarjeta`),
  KEY `TipoTarjetaID` (`TipoTarjetaID`),
  KEY `BancoID` (`BancoID`),
  KEY `TitularID` (`TitularID`),
  CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`TipoTarjetaID`) REFERENCES `tipostarjeta` (`TipoTarjetaID`),
  CONSTRAINT `tarjetas_ibfk_2` FOREIGN KEY (`BancoID`) REFERENCES `bancosemisores` (`BancoID`),
  CONSTRAINT `tarjetas_ibfk_3` FOREIGN KEY (`TitularID`) REFERENCES `titulares` (`TitularID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetas`
--

LOCK TABLES `tarjetas` WRITE;
/*!40000 ALTER TABLE `tarjetas` DISABLE KEYS */;
INSERT INTO `tarjetas` VALUES (7,1,1,'340383198517962',1,'7758',42583,46600,23,'6065',27700.00),(8,2,2,'5306997581217780',2,'84',39356,41548,4,'9037',116400.00),(9,3,3,'30945949913123',3,'568',39203,41760,12,'4358',67400.00);
/*!40000 ALTER TABLE `tarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipostarjeta`
--

DROP TABLE IF EXISTS `tipostarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipostarjeta` (
  `TipoTarjetaID` int NOT NULL AUTO_INCREMENT,
  `NombreTipoTarjeta` varchar(50) NOT NULL,
  PRIMARY KEY (`TipoTarjetaID`),
  UNIQUE KEY `NombreTipoTarjeta` (`NombreTipoTarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipostarjeta`
--

LOCK TABLES `tipostarjeta` WRITE;
/*!40000 ALTER TABLE `tipostarjeta` DISABLE KEYS */;
INSERT INTO `tipostarjeta` VALUES (1,'American Express'),(3,'Diners Club International'),(6,'Discover'),(5,'Japan Credit Bureau'),(2,'Master Card'),(4,'Visa');
/*!40000 ALTER TABLE `tipostarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulares`
--

DROP TABLE IF EXISTS `titulares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulares` (
  `TitularID` int NOT NULL AUTO_INCREMENT,
  `NombreCompleto` varchar(100) NOT NULL,
  PRIMARY KEY (`TitularID`),
  UNIQUE KEY `NombreCompleto` (`NombreCompleto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulares`
--

LOCK TABLES `titulares` WRITE;
/*!40000 ALTER TABLE `titulares` DISABLE KEYS */;
INSERT INTO `titulares` VALUES (7,'Colin L Halcomb'),(10,'Craig U Parsons'),(8,'Elsie A Harding'),(9,'Hal Dietz'),(4,'Joe Tanner'),(1,'Karly M Soria'),(3,'Omar W Hutto'),(2,'Ruby Holder'),(6,'Tyler F Burnett'),(5,'Vern F Weathers');
/*!40000 ALTER TABLE `titulares` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-02 21:02:46
