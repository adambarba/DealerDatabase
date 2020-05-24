-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `Brand_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Brand_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES ('Acura'),('Bmw'),('Chevrolet'),('Ford'),('Honda'),('Mercedes'),('Nissan'),('Subaru'),('Toyota'),('Volkswagen');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` int NOT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Kristina','Weaver','Kris123@gmail.com','123 Imaginary way'),(2,'Jill','Vasquez','Vas254@gmail.com','3289 Redondo blvd'),(3,'Kien','Monaghan','Mona256@yahoo.com',''),(4,'Dion','Ashton','Ashbringer@aol.com','2345 enramada ave'),(5,'Santiago','Moyer','Sandy65@gmail.com','329 Imperial Hwy'),(6,'Marlene','Felix','Mfelix56@gmail.com','325 Carson Street'),(7,'Shamas','Hoffman','Hoffman35@gmail.com','637 Santa Monica Blvd'),(8,'Maddison','Olsen','Twins4us@aol.com','235 Beach Blvd'),(9,'Joyce','Webb','SpiderWebber34@yahoo.com','1593 Palos Verdes Blvd'),(10,'Aurora','Star','Stars245@ymail.com','');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealership`
--

DROP TABLE IF EXISTS `dealership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealership` (
  `Dealer_ID` int NOT NULL,
  `Dealer_Name` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Brand_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Dealer_ID`,`Brand_Name`),
  KEY `fk_DEALERSHIP_BRAND_idx` (`Brand_Name`),
  CONSTRAINT `fk_DEALERSHIP_BRAND` FOREIGN KEY (`Brand_Name`) REFERENCES `brand` (`Brand_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealership`
--

LOCK TABLES `dealership` WRITE;
/*!40000 ALTER TABLE `dealership` DISABLE KEYS */;
INSERT INTO `dealership` VALUES (101,'BMW of Buena Park','6750 Auto Center Dr','Bmw'),(102,'McKenna BMW','10900 Firestone Blvd','Bmw'),(103,'Long Beach BMW','1660 E Spring St','Bmw'),(201,'Buena Park Honda','6411 Beach Blvd','Honda'),(202,'Scott Robinson Honda','20340 Hawthorne Blvd','Honda'),(203,'Diamond Honda','17525 Gale Ave','Honda'),(301,'Cerritos Acura','18827 StudeBaker Rd','Acura'),(302,'Thoma Acura','580 S Citrus Ave','Acura'),(303,'Weir Canyon Acura','8375 E La Palma','Acura'),(401,'Ocean Subaru of Fullerton','1100 S Euclid St','Subaru'),(402,'Timmons Subaru','3950 Cherry Ave','Subaru'),(403,'Subaru Orange Coast','135 Auto Mall Dr','Subaru'),(501,'Toyota of Whittier','14577 E Whittier Blvd','Toyota'),(502,'AutoNation Toyota Buena Park','6400 Beach Blvd','Toyota'),(503,'Miller Toyota of Anaheim','1331 N Euclid St','Toyota'),(601,'Buena Park Nissan','6501 Auto Center Dr','Nissan'),(602,'Puente Hills Nissan Los Angeles','17320 Gale Ave','Nissan'),(603,'Cerritos Nissan','18707 E Studebaker Rd','Nissan'),(701,'Mercedes-Benz of Anaheim','5395 E La Palma Ave','Mercedes'),(702,'Mercedes-Benz of West Covina','2010 E Garver Ave','Mercedes'),(703,'Mercedes-Benz of Long Beach','2300 E Spring St','Mercedes'),(801,'McCoy Mills Ford','700 W Commonwealth Ave','Ford'),(802,'Puente Hills Ford','17340 Gale Ave','Ford'),(803,'Ed Butts Ford','1515 N Hacienda Blvd','Ford'),(901,'Premier Chevrolet of Buena Park','6195 Auto Center Dr','Chevrolet'),(1001,'Puente Hills Volkswagen','17110 Gale Ave','Volkswagen');
/*!40000 ALTER TABLE `dealership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `Sale_ID` int NOT NULL AUTO_INCREMENT,
  `Sale_Date` datetime DEFAULT NULL,
  `Customer_ID` int NOT NULL,
  `Model_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`Sale_ID`,`Customer_ID`,`Model_ID`),
  KEY `fk_Sale_CUSTOMER1_idx` (`Customer_ID`),
  KEY `fk_Sale_VEHICLE1_idx` (`Model_ID`),
  CONSTRAINT `fk_Sale_CUSTOMER1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `fk_Sale_VEHICLE1` FOREIGN KEY (`Model_ID`) REFERENCES `vehicle` (`Model_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'2015-02-10 00:14:49',1,'1XPWDBTX48D766660'),(2,'2019-04-09 12:04:32',1,'1G3NL12E9YC404176'),(3,'2011-04-04 02:36:14',2,'1FVACWCSX4HM74500'),(4,'2010-11-30 21:13:08',2,'1HGCT2B88DA000025'),(5,'2012-03-01 14:36:26',2,'3D4GG47B09T581222'),(6,'2012-02-08 05:51:02',3,'4DRBWAFN06A207518'),(7,'2010-03-14 19:38:15',4,'JH4DA3340GS007428'),(8,'2011-09-09 11:23:37',5,'3VWPG71K97M122542'),(9,'2010-05-02 23:36:09',5,'JH4DA3450KS009535'),(10,'2014-09-30 01:27:34',5,'JH4DC4350SS000058'),(11,'2017-06-12 03:51:32',6,'5XYKUDA21DG367493'),(12,'2011-03-20 09:54:07',7,'JH4KA2640HC004148'),(13,'2016-12-13 23:42:23',8,'JH4DA9470MS008988'),(14,'2015-08-21 07:35:35',9,'JH4KA8260PC000495'),(15,'2013-07-06 23:22:31',9,'JTLKE50E191068256'),(16,'2011-04-22 02:47:22',10,'WBADE6322VBW51982'),(17,'2017-08-20 09:33:10',10,'JM1FE17N340134462'),(18,'2019-09-15 02:59:34',10,'JH4KA7530MC011312'),(19,'2016-05-18 11:24:29',4,'JTHFN48Y020002281'),(20,'2011-02-08 20:04:14',3,'WBA3A5C57CF256651'),(21,'2019-05-25 09:13:42',8,'JH4KA7530MC011312'),(22,'2018-04-27 22:32:23',3,'WP0AA2A79BL017244'),(23,'2016-09-04 23:10:23',6,'JH4DA1850GS002669'),(24,'2014-07-04 16:01:45',7,'3VWSD29M11M069435'),(25,'2011-11-19 10:33:55',7,'5FNRL38209B014050'),(26,'2016-01-17 15:22:58',6,'JH4DA9450PS000246'),(27,'2018-07-16 05:02:36',1,'JM1BG2241R0797923'),(28,'2015-06-19 12:43:41',3,'3D7UT2CL0BG625027'),(29,'2011-08-25 19:47:16',10,'1GNFK16Z86J156085');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `Model_ID` varchar(45) NOT NULL,
  `Vehicle_Color` varchar(45) DEFAULT NULL,
  `Vehicle_Year` int DEFAULT NULL,
  `MSRP` int DEFAULT NULL,
  `Model_Name` varchar(45) NOT NULL,
  `Model_Trim` varchar(45) NOT NULL,
  `Dealer_ID` int NOT NULL,
  `Brand_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Model_ID`,`Dealer_ID`,`Brand_Name`),
  KEY `fk_VEHICLE_DEALERSHIP1_idx` (`Dealer_ID`,`Brand_Name`),
  CONSTRAINT `fk_VEHICLE_DEALERSHIP1` FOREIGN KEY (`Dealer_ID`, `Brand_Name`) REFERENCES `dealership` (`Dealer_ID`, `Brand_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('1D7HA18N38J191236','silver',2018,28999,'Mustang','Sport',801,'Ford'),('1FMCU14T6JU400773','red',2016,19999,'Yaris','Sport',501,'Toyota'),('1FMCU24X4NUD21099','green',2016,19999,'Camry','Sport',502,'Toyota'),('1FTZX1722XKA76091','red',2020,49999,'M3','Premium',101,'Bmw'),('1FUPBSYB2RL542053','white',2016,19999,'Yaris','Premium',503,'Toyota'),('1FVACWCSX4HM74500','white',2019,30999,'370Z','Limited',601,'Nissan'),('1FVAF3CV84DM31815','black',2017,23999,'Civic','Standard',201,'Honda'),('1G3NL12E9YC404176','black',2017,23999,'Civic SI','Limited',202,'Honda'),('1G8ZH1270SZ355887','white',2015,18999,'Yaris','Standard',502,'Toyota'),('1GCCT14R0H2164173','green',2016,20999,'Prius','Limited',501,'Toyota'),('1GNDV23L26D236839','silver',2019,32199,'Forester','Standard',401,'Subaru'),('1GNFK16Z86J156085','black',2018,29999,'TLX','Sport',301,'Acura'),('1HD1BX510BB027648','black',2017,23999,'Accord','Sport',203,'Honda'),('1HGCT2B88DA000025','silver',2019,30999,'370Z','Sport',602,'Nissan'),('1J4GZ58S9VC710649','red',2016,19999,'Corolla','Standard',503,'Toyota'),('1XPWDBTX48D766660','silver',2017,23999,'Accord','Limited',202,'Honda'),('2GCHG31K6J4141689','white',2018,28999,'ILX','Premium',303,'Acura'),('2P4GH2535SR296546','silver',2018,28999,'ILX','Standard',302,'Acura'),('2T1AE97A4MC092797','white',2018,26999,'Ranger','Standard',801,'Ford'),('2T1KR32EX3C158977','red',2019,29999,'Leaf','Limited',602,'Nissan'),('3B7KF23Z42M211215','black',2016,19999,'Corolla','Premium',502,'Toyota'),('3D4GG47B09T581222','gray',2020,59999,'Corvette','Premium',901,'Chevrolet'),('3D7UT2CL0BG625027','black',2016,19999,'Yaris','Limited',501,'Toyota'),('3VWPG71K97M122542','black',2020,49999,'AMG-GT','Limited',703,'Mercedes'),('3VWSD29M11M069435','green',2020,49999,'AMG-GT','Sport',702,'Mercedes'),('4DRBWAFN06A207518','white',2020,52999,'Atlas','Limited',1001,'Volkswagen'),('4T1BF1FK4CU609641','white',2020,34999,'WRX','Sport',402,'Subaru'),('5FNRL38209B014050','white',2016,21499,'Civic SI','Standard',201,'Honda'),('5XYKUDA21DG367493','blue',2019,49999,'Tiguan','Standard',1001,'Volkswagen'),('JF2SH63619H797346','black',2017,23999,'Accord','Premium',203,'Honda'),('JH4DA1850GS002669','red',2016,20999,'Camry','Premium',501,'Toyota'),('JH4DA3340GS007428','green',2017,23999,'Civic SI','Premium',202,'Honda'),('JH4DA3350JS000592','silver',2017,23999,'Accord','Premium',203,'Honda'),('JH4DA3450KS009535','white',2020,34999,'WRX-STI','Premium',402,'Subaru'),('JH4DA9450PS000246','white',2018,29999,'TLX','Limited',301,'Acura'),('JH4DA9470MS008988','red',2019,32199,'Forester','Premium',401,'Subaru'),('JH4DC4350SS000058','black',2018,28999,'Mustang','Limited',803,'Ford'),('JH4KA2640HC004148','black',2018,28999,'Ranger','Premium',802,'Ford'),('JH4KA3250JC001616','white',2020,34999,'WRX-STI','Standard',403,'Subaru'),('JH4KA7530MC011312','black',2020,49999,'M3','Limited',103,'Bmw'),('JH4KA8160PC000949','silver',2017,26999,'Fusion','Limited',802,'Ford'),('JH4KA8260PC000495','black',2016,20999,'Camry','Standard',502,'Toyota'),('JH4KA8270PC001686','black',2017,23999,'Accord','Standard',202,'Honda'),('JM1BG2241R0797923','white',2018,29999,'RLX','Standard',302,'Acura'),('JM1FE17N340134462','white',2019,30999,'Leaf','Sport',603,'Nissan'),('JNKCV64E78M131002','black',2018,29999,'RLX','Premium',301,'Acura'),('JTHFN48Y020002281','black',2019,30999,'Maxima','Standard',601,'Nissan'),('JTLKE50E191068256','green',2020,32199,'WRX','Limited',402,'Subaru'),('KNDJE723297570351','red',2017,23999,'Civic','Sport',203,'Honda'),('WBA3A5C57CF256651','silver',2016,19999,'Corolla','Limited',503,'Toyota'),('WBADE6322VBW51982','black',2017,26999,'Fusion','Sport',802,'Ford'),('WP0AA2993XS621083','black',2019,30999,'Maxima','Premium',603,'Nissan'),('WP0AA2A79BL017244','black',2016,20999,'Prius','Sport',501,'Toyota');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-05  1:58:18
