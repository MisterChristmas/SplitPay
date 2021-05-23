CREATE DATABASE  IF NOT EXISTS `webservice` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webservice`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: webservice
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'Activite','Separation des factures de sortie entre Philippe, Jacob et Dylan','2021-05-01 00:00:00'),(2,'Logement','Collocation entre Pascal, Antoine et Nicolas','2021-05-01 00:00:00');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenthistory`
--

DROP TABLE IF EXISTS `paymenthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymenthistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paymentTime` datetime DEFAULT NULL,
  `ammountPaid` double DEFAULT NULL,
  `ReceiptId` int NOT NULL,
  `UserId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PaymentHistory_Receipt1_idx` (`ReceiptId`),
  KEY `fk_PaymentHistory_User1_idx` (`UserId`),
  CONSTRAINT `fk_PaymentHistory_Receipt1` FOREIGN KEY (`ReceiptId`) REFERENCES `receipt` (`id`),
  CONSTRAINT `fk_PaymentHistory_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenthistory`
--

LOCK TABLES `paymenthistory` WRITE;
/*!40000 ALTER TABLE `paymenthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymenthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `cardNumber` varchar(45) DEFAULT NULL,
  `csn` varchar(45) DEFAULT NULL,
  `expired` int DEFAULT NULL,
  `User_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PaymentMethod_User1_idx` (`User_id`),
  CONSTRAINT `fk_PaymentMethod_User1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `dueTime` datetime DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `total` decimal(6,2) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `PassWord` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'Pascal','Noel','pascalnoel4862@gmail.com','(514) 712-9329','2021-05-01 00:00:00','qwerty123'),(1,'Philippe','Blaney',NULL,'(514) 928-8150','2021-05-01 00:00:00','qwerty123'),(2,'Antoine','Ridard','antoine.ridard@hotmail.com','(438) 490-4311','2021-05-01 00:00:00','qwerty123'),(3,'Nicolas','Blanchette','nicolasblanchette22@gmail.com','(514) 972-5155','2021-05-01 00:00:00','qwerty123'),(4,'Jacob','Masse',NULL,NULL,'2021-05-01 00:00:00','qwerty123'),(5,'Dylan','Roy',NULL,'(514) 771-4809','2021-05-01 00:00:00','qwerty123'),(6,'Lucky','Shleep','yannick.lagarde@videotron.ca','(438) 526-1463','0001-01-01 00:00:00','qwerty123'),(8,'JS','Renault','js@gmail.com','(438) 526-1463','0001-01-01 00:00:00','qwerty123'),(9,'Oli','Champagne','boubou@gmail.com','(438) 526-1463','0001-01-01 00:00:00','qwerty123'),(10,'Test','Test','test@gmail.com','(438) 526-1463','0001-01-01 00:00:00','qwerty123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroup` (
  `UserId` int NOT NULL,
  `GroupId` int NOT NULL,
  `CreateTime` datetime NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_UserGroup_User1_idx` (`UserId`),
  KEY `fk_UserGroup_Group1_idx` (`GroupId`),
  CONSTRAINT `fk_UserGroup_Group1` FOREIGN KEY (`GroupId`) REFERENCES `group` (`id`),
  CONSTRAINT `fk_UserGroup_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,2,'2021-05-01 00:00:00',1),(2,1,'2021-05-01 00:00:00',2),(3,1,'2021-05-01 00:00:00',3),(4,2,'2021-05-01 00:00:00',4),(5,2,'2021-05-01 00:00:00',5),(0,1,'2021-05-01 00:00:00',7);
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroupreceipt`
--

DROP TABLE IF EXISTS `usergroupreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroupreceipt` (
  `ReceiptId` int NOT NULL,
  `UserGroupId` int NOT NULL,
  `totalDue` decimal(5,2) NOT NULL,
  `total` decimal(5,2) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_UserGroupReceipt_Receipt1_idx` (`ReceiptId`),
  KEY `fk_UserGroupReceipt_UserGroup1_idx` (`UserGroupId`),
  CONSTRAINT `fk_UserGroupReceipt_Receipt1` FOREIGN KEY (`ReceiptId`) REFERENCES `receipt` (`id`),
  CONSTRAINT `fk_UserGroupReceipt_UserGroup1` FOREIGN KEY (`UserGroupId`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroupreceipt`
--

LOCK TABLES `usergroupreceipt` WRITE;
/*!40000 ALTER TABLE `usergroupreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroupreceipt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 13:49:09
