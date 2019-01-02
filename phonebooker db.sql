CREATE DATABASE  IF NOT EXISTS `loginphonebook` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `loginphonebook`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: loginphonebook
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `contact` (
  `contactID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `contactName` varchar(40) NOT NULL,
  `contactSurname` varchar(40) NOT NULL,
  `contactPhone` varchar(20) NOT NULL,
  PRIMARY KEY (`contactID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'nikola97','Marko','Markovic','066231778'),(3,'nikola97','Stevan','Stevanovic','066888999'),(5,'marko123','Vaso','Vasic','342532452'),(6,'nikola97','Vaso','Vasic','043223421'),(7,'nikola97','Dimitrije','Dimitrijevic','065232421'),(8,'nikola97','Miljan','Miljanovic','065999222'),(9,'nikola97','Veso','Vesic','06593982'),(10,'nikola97','Aleksa','Aleksic','065839213'),(11,'nikola97','Marko','Filipovic','06534432235'),(12,'nikola97','Filip','Filipovic','065883245'),(13,'nikola97','Zdravko','Zdravkovic','053342214'),(14,'nikola97','Slobodan','Slobic','065834932'),(15,'nikola97','Marko','Mihajlovic','06593489234'),(16,'nikola97','Filip','Tasovac','065999444'),(17,'nikola97','Marko','Vasic','065090334'),(18,'nikola97','Mile','Milanovic','065324231'),(19,'nikola97','Marko','Miljanovic','065993002'),(20,'nikola97','Vinko','Vinkovic','065992443'),(21,'nikola97','Stefan','Markovic','065888333'),(22,'nikola97','Ilija','Grahovac','065333222'),(23,'nikola97','Stevan','Mokranjac','065992113'),(24,'nikola97','Pero','Peric','0669392145'),(25,'nikola97','Petar','Petrovic','065777888'),(26,'nikola97','Nemanja','Petrovic','065888555'),(27,'nikola97','Stefan','Grahovac','066893922'),(28,'nikola97','Nemanja','Nemanjic','066899300'),(29,'nikola97','Meho','Mehic','065999121');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `surname` varchar(40) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('asdasdasda','aaaaaaaa',NULL,NULL,NULL,NULL,NULL),('asddsa','123456',NULL,NULL,NULL,NULL,NULL),('Degenerik','letmein','','',NULL,'',''),('marko123','111111',NULL,NULL,NULL,NULL,NULL),('Marko21','markooo','Marko','Markovic','2018-11-22','',''),('nikola1997','pasword','nikola','nikolic','2014-04-04','nikoao@gmail.com','06683721'),('nikola97','nikola123','Nikola','Malinovic','1997-04-04',NULL,NULL),('nikola997','111111',NULL,NULL,'2014-04-30',NULL,NULL),('proba123','sifra123','','',NULL,'','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-23 15:23:56
