CREATE DATABASE  IF NOT EXISTS `pdv` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pdv`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pdv
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `CODCLI` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(35) DEFAULT NULL,
  `BONUS` int(11) DEFAULT NULL,
  `PERFIL` varchar(1) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CODCLI`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Empresa A',200,'P','A'),(2,'Empresa B',500,'M','A'),(3,'Empresa C',1000,'G','A'),(4,'Empresa D',200,'P','I'),(5,'Empresa E',0,'P','A'),(6,'Empresa F',300,'G','I'),(7,'Empresa G',200,'P','A'),(8,'Empresa H',900,'G','A'),(9,'Empresa I',0,'P','A'),(10,'Empresa J',200,'M','A'),(11,'Empresa K',200,'G','A'),(12,'Empresa L',0,'P','A'),(13,'Empresa M',200,'M','I'),(14,'Empresa N',700,'G','A'),(15,'Empresa O',500,'M','A'),(16,'Empresa P',200,'P','I'),(17,'Empresa Q',200,'G','A'),(18,'Empresa R',800,'P','I'),(19,'Empresa S',200,'G','I'),(20,'Empresa T',600,'P','A');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desconto`
--

DROP TABLE IF EXISTS `desconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desconto` (
  `ID_DESCONTO` int(11) NOT NULL AUTO_INCREMENT,
  `CODPROD` int(11) DEFAULT NULL,
  `PERCENTUAL` int(11) DEFAULT NULL,
  `QTD_MIN` int(11) DEFAULT NULL,
  `QTD_MAX` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DESCONTO`),
  KEY `Codigo do produto_idx` (`CODPROD`),
  CONSTRAINT `Codigo do produto` FOREIGN KEY (`CODPROD`) REFERENCES `produto` (`CODPROD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desconto`
--

LOCK TABLES `desconto` WRITE;
/*!40000 ALTER TABLE `desconto` DISABLE KEYS */;
/*!40000 ALTER TABLE `desconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidade`
--

DROP TABLE IF EXISTS `localidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidade` (
  `CODLOCAL` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(35) NOT NULL,
  `ENDERECO` varchar(80) DEFAULT NULL,
  `TELEFONE` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`CODLOCAL`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidade`
--

LOCK TABLES `localidade` WRITE;
/*!40000 ALTER TABLE `localidade` DISABLE KEYS */;
INSERT INTO `localidade` VALUES (1,'Rio de Janeiro',NULL,NULL),(2,'São Paulo',NULL,NULL),(3,'Distrito Federal',NULL,NULL),(4,'Amazonas',NULL,NULL),(5,'Minas Gerais',NULL,NULL),(6,'Bahia',NULL,NULL),(7,'Rio Grande do Sul',NULL,NULL),(8,'Paraná',NULL,NULL);
/*!40000 ALTER TABLE `localidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `CODPROD` int(11) NOT NULL AUTO_INCREMENT,
  `CODLOCAL` int(11) DEFAULT NULL,
  `DESCRICAO` varchar(35) DEFAULT NULL,
  `QTD_ESTOQUE` int(11) DEFAULT NULL,
  `PRECO_UNITARIO` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CODPROD`),
  KEY `codlocal_idx` (`CODLOCAL`),
  CONSTRAINT `codigo do local` FOREIGN KEY (`CODLOCAL`) REFERENCES `localidade` (`CODLOCAL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,'Arroz',1000,4.45),(2,4,'Feijão',1000,4.91),(3,1,'Farinha',400,4.99),(4,5,'Óleo',500,3.39),(5,1,'Açúcar',600,2.49),(6,6,'Café',500,3.85),(7,1,'Leite',800,2.75),(8,7,'Suco',300,8.29),(9,5,'Achocolatado',200,6.49),(10,2,'Refrigerante',500,4.29),(11,8,'Milho',200,3.59),(12,3,'Água',800,5.69);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `COD_VENDA` int(11) NOT NULL AUTO_INCREMENT,
  `CODCLI` int(11) NOT NULL,
  `CODPROD` int(11) NOT NULL,
  `CODLOCAL` int(11) NOT NULL,
  `QTD_VENDA` int(11) DEFAULT NULL,
  `VALOR_TOTAL` decimal(10,2) DEFAULT NULL,
  `DATA_VENDA` date DEFAULT NULL,
  PRIMARY KEY (`COD_VENDA`,`CODCLI`,`CODPROD`,`CODLOCAL`),
  UNIQUE KEY `vendacol_UNIQUE` (`COD_VENDA`),
  KEY `codigo produto_idx` (`CODPROD`),
  KEY `codigo local_idx` (`CODLOCAL`),
  KEY `codigo cliente` (`CODCLI`),
  CONSTRAINT `codigo cliente` FOREIGN KEY (`CODCLI`) REFERENCES `cliente` (`CODCLI`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codigo local` FOREIGN KEY (`CODLOCAL`) REFERENCES `localidade` (`CODLOCAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codigo produto` FOREIGN KEY (`CODPROD`) REFERENCES `produto` (`CODPROD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pdv'
--

--
-- Dumping routines for database 'pdv'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-08 12:10:28
