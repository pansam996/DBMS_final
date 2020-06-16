-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: mb_hair
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `phone` varchar(10) NOT NULL,
  `name` text,
  `birthday` text,
  PRIMARY KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('0901000000','Jay Chou','85/1/10'),('0910000000','user1','85/1/1'),('0911287361','Jack','85/9/1'),('0920000000','user2','85/1/2'),('0928436966','Peter Pan','85/12/17'),('0930000000','user3','85/1/3'),('0940000000','user4','85/1/4'),('0950000000','user5','85/1/5'),('0960000000','user6','85/1/6'),('0970000000','user7','85/1/7'),('0980000000','user8','85/1/8'),('0990000000','user9','85/1/9');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designer`
--

DROP TABLE IF EXISTS `designer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designer` (
  `designer_no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `office_addr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`designer_no`),
  KEY `office_addr_idx` (`office_addr`),
  CONSTRAINT `office_address` FOREIGN KEY (`office_addr`) REFERENCES `office` (`office_address`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designer`
--

LOCK TABLES `designer` WRITE;
/*!40000 ALTER TABLE `designer` DISABLE KEYS */;
INSERT INTO `designer` VALUES (2,'Abby','0912121212','Happy Street No.1'),(3,'Baby','0934343434','Happy Street No.1'),(4,'Candy','0945454545','Happy Street No.2'),(5,'Dabby','0955555555','Happy Street No.2'),(6,'Ella','0965656565','Happy Street No.2'),(7,'Fatty','0956565656','Happy Street No.2'),(8,'Ggc','0972727272','Happy Street No.3'),(14,'Gofad','0972727212','Happy Street No.4'),(15,'Hasll','0972727212','Happy Street No.5'),(16,'Juddy','0972727212','Happy Street No.6'),(17,'Kaccy','0972727212','Happy Street No.7'),(18,'Lion','0972737212','Happy Street No.8'),(19,'Lion2','0972737292','Happy Street No.8'),(20,'Momm','0972737282','Happy Street No.9'),(21,'Mo2m','0973737282','Happy Street No.9'),(22,'Nood','0973736282','Happy Street No.10'),(23,'Nood2','0933736282','Happy Street No.10');
/*!40000 ALTER TABLE `designer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_no` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) DEFAULT NULL,
  `item_num` int DEFAULT NULL,
  `manager_no` int DEFAULT NULL,
  PRIMARY KEY (`item_no`),
  KEY `designer_no_idx` (`manager_no`),
  KEY `designer_no_idx2` (`manager_no`),
  CONSTRAINT `designer_no2` FOREIGN KEY (`manager_no`) REFERENCES `designer` (`designer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (23,'comb',7,3),(24,'scissors',5,8),(25,'hair dry',15,3),(26,'shampoo',10,6),(27,'dye',8,6),(28,'chair',17,8),(31,'mirror',2,15),(32,'razor',2,15),(33,'round brush',17,15),(34,'gel',4,3);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `office_address` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `manager_no` int DEFAULT NULL,
  PRIMARY KEY (`office_address`),
  KEY `designer_no_idx` (`manager_no`),
  CONSTRAINT `designer_no` FOREIGN KEY (`manager_no`) REFERENCES `designer` (`designer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES ('Happy Street No.1','0977777777','100',3),('Happy Street No.10','0910101010','119',22),('Happy Street No.2','0966666666','112',6),('Happy Street No.3','0933333333','110',8),('Happy Street No.4','0944444444','117',14),('Happy Street No.5','0955555555','119',15),('Happy Street No.6','0966666666','119',16),('Happy Street No.7','0977777777','119',17),('Happy Street No.8','0988888888','119',19),('Happy Street No.9','0999999999','119',21);
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_salon`
--

DROP TABLE IF EXISTS `order_salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_salon` (
  `salon_no` int NOT NULL AUTO_INCREMENT,
  `salon_content` varchar(45) DEFAULT NULL,
  `salon_price` int DEFAULT NULL,
  `customer_phone` varchar(45) DEFAULT NULL,
  `designer_no` int DEFAULT NULL,
  PRIMARY KEY (`salon_no`),
  KEY `phone_idx` (`customer_phone`),
  KEY `designer_no_idx` (`designer_no`),
  CONSTRAINT `designer_no1` FOREIGN KEY (`designer_no`) REFERENCES `designer` (`designer_no`),
  CONSTRAINT `phone1` FOREIGN KEY (`customer_phone`) REFERENCES `customer` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_salon`
--

LOCK TABLES `order_salon` WRITE;
/*!40000 ALTER TABLE `order_salon` DISABLE KEYS */;
INSERT INTO `order_salon` VALUES (5,'染髮',1200,'0940000000',2),(6,'洗髮',400,'0928436966',3),(7,'洗髮+剪髮',800,'0911287361',7),(9,'燙髮',1600,'0990000000',7),(10,'剪髮',400,'0910000000',5),(11,'洗髮+剪髮',800,'0911287361',5),(12,'燙髮',1600,'0930000000',5),(13,'染髮',1200,'0960000000',5),(14,'洗髮+剪髮',800,'0980000000',6),(15,'剪髮',400,'0950000000',7),(16,'洗髮+剪髮',800,'0920000000',8),(17,'染髮',1200,'0950000000',8),(18,'燙髮',1600,'0950000000',15),(19,'燙髮',1600,'0930000000',14),(20,'燙髮',1600,'0930000000',2),(21,'燙髮',1600,'0960000000',2),(22,'燙髮',1600,'0970000000',2),(23,'燙髮',1600,'0990000000',3),(24,'剪髮',400,'0970000000',3),(25,'洗髮+剪髮',800,'0970000000',4);
/*!40000 ALTER TABLE `order_salon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-16 14:58:36
