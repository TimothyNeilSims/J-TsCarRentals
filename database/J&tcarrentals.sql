-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: j&tcarrentals
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `nameOnCard` varchar(255) NOT NULL,
  `cardNumber` varchar(255) NOT NULL,
  `expDate` date NOT NULL,
  `securityCode` varchar(255) NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `userID` (`userID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'Jeffrey Ballard','213187377422124','2025-06-01','319'),(2,2,'Michael Martin','676391664262','2025-02-01','578'),(3,3,'Casey Hall','180038496436553','2028-05-01','651'),(4,4,'Roger Lyons','4986792567587870','2031-01-01','268'),(5,5,'Jennifer Wallace','6555712314734084','2034-04-01','058'),(6,6,'Cassandra Ramirez','5466348605332526','2029-05-01','7309'),(7,7,'Danielle Wallace','6011623322964167','2028-04-01','884'),(8,8,'Alexander Spencer','30474039061875','2030-04-01','7153'),(9,9,'James Hall','4283755446664931292','2030-05-01','5468'),(10,10,'Anna Henry','6559994133205225','2029-10-01','083'),(11,11,'Michelle Jackson','3561936003554110','2028-04-01','661'),(12,12,'Barbara Myers','30026801105551','2030-05-01','128'),(13,13,'Devin Sellers','343649345085492','2032-05-01','424'),(14,14,'Thomas Jones','4665330904463','2025-05-01','962'),(15,15,'Elizabeth Jones','180084043500285','2027-03-01','601'),(16,16,'Tony Lambert','2720659658444730','2030-11-01','1857'),(17,17,'Jasmine Blackwell','503825016309','2029-01-01','713'),(18,18,'Dawn Scott','2719553360024364','2028-02-01','928'),(19,19,'Sean Rose','4497144074800960','2030-01-01','150'),(20,20,'Billy Curry','4038710460450820','2028-02-01','716'),(21,21,'Natalie Smith','341652214241776','2030-05-01','043'),(22,22,'Alexis Thompson','213189595537923','2026-05-01','282'),(23,23,'Bailey Boyer','4936491969154796943','2029-03-01','529'),(24,24,'Ashley Vega','213154072279746','2033-01-01','247'),(25,25,'Wendy Austin','3577518995376546','2029-12-01','175'),(26,26,'Jordan Jackson','3572722225772434','2032-03-01','157'),(27,27,'Kristin Terrell','375811330696466','2031-12-01','670'),(28,28,'Gary Turner','3503687168645711','2025-08-01','451'),(29,29,'Brooke Neal','4173178475064100390','2030-04-01','909'),(30,30,'Timothy Mccoy','4901229658377','2028-04-01','364');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `rentalID` int NOT NULL AUTO_INCREMENT,
  `vehicleID` int NOT NULL,
  `initialCondition` varchar(255) NOT NULL,
  `initialDate` datetime NOT NULL,
  `finalDate` datetime DEFAULT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `isReturned` tinyint(1) NOT NULL,
  `finalCondition` varchar(255) DEFAULT NULL,
  `userID` int NOT NULL,
  `paymentID` int NOT NULL,
  `isApproved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`rentalID`),
  KEY `vehicleID` (`vehicleID`),
  KEY `userID` (`userID`),
  KEY `paymentID` (`paymentID`),
  CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`vehicleID`) REFERENCES `vehicles` (`vehicleID`),
  CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,28,'Good','2023-01-27 00:00:00','2023-08-26 00:00:00',498.83,0,'Good',23,1,1),(2,25,'Good','2023-07-12 00:00:00','2023-10-30 00:00:00',838.84,1,'Good',14,1,1),(3,12,'Good','2022-05-20 00:00:00','2022-11-07 00:00:00',542.10,1,'Good',27,1,1),(4,1,'Good','2022-04-22 00:00:00','2022-05-03 00:00:00',183.39,1,'Good',28,1,1),(5,17,'Good','2023-03-24 00:00:00','2023-04-12 00:00:00',650.69,1,'Good',16,1,1),(6,15,'Good','2023-04-26 00:00:00','2023-09-20 00:00:00',925.67,0,'Good',15,1,1),(7,10,'Good','2022-10-29 00:00:00','2022-12-18 00:00:00',964.91,1,'Good',9,1,1),(8,4,'Good','2024-01-24 00:00:00','2024-03-09 00:00:00',867.65,0,'Good',14,1,1),(9,23,'Good','2023-12-02 00:00:00','2024-04-05 00:00:00',108.49,0,'Good',17,1,1),(10,22,'Good','2023-03-06 00:00:00','2023-05-24 00:00:00',847.22,1,'Good',24,1,1),(11,22,'Good','2022-04-25 00:00:00','2024-02-10 00:00:00',822.46,0,'Good',6,1,1),(12,27,'Good','2023-09-15 00:00:00','2024-03-14 00:00:00',711.42,0,'Good',5,1,1),(13,30,'Good','2022-09-09 00:00:00','2024-01-06 00:00:00',973.48,1,'Good',23,1,1),(14,20,'Good','2024-03-29 00:00:00','2024-04-03 00:00:00',326.45,1,'Good',24,1,1),(15,25,'Good','2023-05-17 00:00:00','2023-12-23 00:00:00',550.40,0,'Good',3,1,1),(16,5,'Good','2022-07-10 00:00:00','2022-10-25 00:00:00',511.71,0,'Good',16,1,1),(17,1,'Good','2022-07-06 00:00:00','2022-12-05 00:00:00',779.84,1,'Good',4,1,1),(18,16,'Good','2023-03-29 00:00:00','2023-04-11 00:00:00',659.33,0,'Good',23,1,1),(19,23,'Good','2022-11-13 00:00:00','2023-01-03 00:00:00',514.33,0,'Good',23,1,1),(20,28,'Good','2023-06-09 00:00:00','2023-08-30 00:00:00',788.39,0,'Good',10,1,1),(21,3,'Good','2023-07-15 00:00:00','2023-12-04 00:00:00',317.83,1,'Good',19,1,1),(22,17,'Good','2023-04-11 00:00:00','2023-05-03 00:00:00',626.31,1,'Good',4,1,1),(23,14,'Good','2024-03-12 00:00:00','2024-03-12 00:00:00',124.75,0,'Good',8,1,1),(24,16,'Good','2023-03-29 00:00:00','2023-08-02 00:00:00',300.36,0,'Good',16,1,1),(25,17,'Good','2023-09-06 00:00:00','2023-11-29 00:00:00',264.70,0,'Good',14,1,1),(26,13,'Good','2022-12-08 00:00:00','2023-09-17 00:00:00',195.02,0,'Good',14,1,1),(27,10,'Good','2023-08-06 00:00:00','2023-10-21 00:00:00',812.87,1,'Good',16,1,1),(28,12,'Good','2023-06-23 00:00:00','2023-11-12 00:00:00',180.08,0,'Good',20,1,1),(29,18,'Good','2022-06-02 00:00:00','2023-12-27 00:00:00',500.93,0,'Good',30,1,1),(30,13,'Good','2023-02-03 00:00:00','2024-01-21 00:00:00',683.34,1,'Good',17,1,1);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `rentalID` int NOT NULL,
  `vehicleID` int NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `feedback` text,
  PRIMARY KEY (`rentalID`,`vehicleID`),
  KEY `vehicleID` (`vehicleID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`rentalID`) REFERENCES `rental` (`rentalID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`vehicleID`) REFERENCES `vehicles` (`vehicleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,28,1.1,'State apply draw. Course second scene hospital nature establish reality.\nOut wind kid law or such. Movement heart time five.\nSpeak account today speak. Face sometimes yourself garden main role term.'),(2,25,4.9,'Who together grow. What various particular industry like interesting between.\nLive government away. Important well necessary what forget technology.'),(3,12,3.4,'Open make table everything above movie.\nKey success attention. Go book series them Republican. Student that from voice which well travel.'),(4,1,1.7,'Every second teach rest today. Region group seem as rock. Later bank really discuss need.\nDoctor second offer type entire finish become society.'),(5,17,2.5,'Region contain with truth front single. Continue six citizen chair opportunity. Certainly activity detail summer happen think.'),(6,15,1.2,'Win impact manage ever station hard to. Five TV quickly still institution civil. Apply national spring candidate lot million race.'),(7,10,1.8,'School left art. Recognize everything each case southern form service hold. Miss head than not surface allow bring seat.'),(8,4,2.4,'Organization order point want manage just. Pattern data oil firm. Move gun break less eye. See who compare owner owner.'),(9,23,4.6,'Wrong material major. Drive yes peace building administration. Actually spend determine whole soon drug baby.\nTend positive happy. Know wear fire compare majority worker.'),(10,22,2.5,'Get stage practice challenge begin size easy ground. Quality minute sometimes. Hair loss throw direction could.\nRed head bring seat. Company hard each born be.'),(11,22,4.7,'Push lawyer keep them. Fall before difficult eye theory someone.\nHair behind west. History rise yourself section. Again state central parent station establish southern.'),(12,27,2.3,'In audience camera stop main experience. Fund produce wear call because itself today apply. Across civil less notice.'),(13,30,2.7,'Mrs minute evening. Pay find federal set. Firm positive water generation big interesting.\nMeet share huge hit go. Agree key so since rather deep return.'),(14,20,4.9,'Loss bad could relationship Mr bring walk. Mrs information reality art ball theory.\nAlone accept whose light administration list scene newspaper. Meeting meet public wife form civil.'),(15,25,3.6,'Live raise medical room letter world. Religious control along product.\nData official response.\nFriend order authority radio. Day present wind.\nAdmit explain clear public. No her these fly.'),(16,5,1.9,'Style in top young. Difference day fire listen plant.\nEat among choice push in.\nToday operation face must computer. Stand reach thought control pass provide cause.'),(17,1,4.7,'Hour set agreement out realize. Million station mission do. Training history me space building piece. Support prove age throw Congress Mrs as.'),(18,16,1.7,'Example show receive at Republican. Star might like talk easy keep newspaper. Stop also seem better.'),(19,23,1.4,'Cause whole than poor role center evening agent. Store amount author. Start these provide people according.\nDream actually official vote themselves on himself ok. Later Mrs time little long increase.'),(20,28,2.4,'Common recognize clear eat interesting. Away enjoy thank moment organization wonder. Method loss him project such end compare.'),(21,3,1.9,'Administration us responsibility guy art. Hour against section remain article.\nFrom company employee. Less explain top happen nor.'),(22,17,2.9,'Could win guy anyone. Offer interest quickly between next. Wind road management away certainly trial rise.'),(23,14,1.1,'Very least space drop. Significant employee manage interview field total.'),(24,16,4.0,'People miss service decade type remain trip. Kid build wait simple.\nLevel listen gas. Yeah its short sure though doctor director less.'),(25,17,4.4,'Stay always measure nation stay have. Major security none word specific wall available. Key president free then society benefit.'),(26,13,2.5,'Value star even partner. Media indicate such allow minute. Site cut management lead.'),(27,10,3.9,'Someone which top. Support hear million.\nBeautiful size unit join at lot morning. Teacher find affect nature note quality style rock. Mr analysis south guy.'),(28,12,4.7,'Guess wish strong about. Church front open seek get someone spring. All think add world.\nThose gun sound case. Room idea develop into. Expect collection production.'),(29,18,1.5,'Shoulder threat ability experience. Paper argue concern decision rule. Lead right room particularly have environment. Need message court sense.'),(30,13,3.5,'Catch claim rate me. Four capital skill kind but prevent city.\nElse partner draw newspaper despite standard. Whom live hit while soldier time.');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticketID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `issue` text NOT NULL,
  `rentalID` int DEFAULT NULL,
  `paymentID` int DEFAULT NULL,
  PRIMARY KEY (`ticketID`),
  KEY `userID` (`userID`),
  KEY `rentalID` (`rentalID`),
  KEY `paymentID` (`paymentID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`rentalID`) REFERENCES `rental` (`rentalID`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,15,'Story determine position hear skin.\nBecome data anything wonder tree rule. Per tend pressure fund pattern sign perform. Friend agreement represent prepare attack evening simply.',6,NULL),(2,9,'Choose protect rest turn. Want way nor occur almost. Defense campaign country series plan hand hot.\nQuickly back letter. Former tend least dinner prove.',7,NULL),(3,23,'Now should police for beat though. Face just TV interesting last mention. Care building nothing result case.',18,NULL),(4,14,'Democratic put so news onto. Investment money party nothing never case. Structure sea ground subject yeah.',8,NULL),(5,23,'Adult throw image name mention day it.\nResource focus certain require fact describe. Involve bill executive thousand per kitchen.',13,NULL),(6,15,'Economic everybody coach right those lawyer first. Foot country control professional consider similar.\nLaugh visit measure form throughout three. Think art court day behavior. Bad loss unit.',6,NULL),(7,19,'Far land short over. North score benefit year animal oil network.',21,NULL),(8,16,'Third cup beat financial laugh guess deep. Interview near interest total that tough.\nSince bar always space table modern. Organization raise country unit. Her role hand word represent how.',16,NULL),(9,14,'Each budget pull product that. Concern husband produce. Character here product court.\nDemocratic religious listen method. Season believe occur environment usually full meeting.',2,NULL),(10,6,'Southern term war dog picture heavy capital. Off population participant song news yeah charge.\nAgo collection edge page sport good month.\nChallenge kitchen summer his.',11,NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `accountType` varchar(255) NOT NULL,
  `favorites` int DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`),
  KEY `fk_favorites` (`favorites`),
  CONSTRAINT `fk_favorites` FOREIGN KEY (`favorites`) REFERENCES `vehicles` (`vehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'andrewcarlson','$Yg4bXb&ln*(','Jeffrey Ballard','chavezjoshua@example.org','63962 Daniels Stream, Torresmouth, TX 60160','+1-418-202-8719x652',58,'regular',NULL,'2021-02-21 00:00:00'),(2,'howelldawn','SY2%9)tY02#N','Michael Martin','kgarcia@example.org','197 Gregory Path Suite 150, Davidtown, MT 74077','+1-890-902-3539x62367',50,'premium',NULL,'2022-01-06 00:00:00'),(3,'tayloramber','Q(%)8TdSkI+2','Casey Hall','kennethhardy@example.com','47205 Lee Route, Sandraport, NY 55518','001-973-366-6380x2007',27,'premium',NULL,'2022-05-27 00:00:00'),(4,'marieestes','rf3I&YbZx@cy','Roger Lyons','alexandra33@example.net','968 Mendez Trail, Jennifermouth, MA 80418','(055)727-7921',68,'premium',NULL,'2023-05-19 00:00:00'),(5,'jerrygallagher','xf9LM+CN6&pA','Jennifer Wallace','chadsantana@example.net','125 Wendy Fords, East David, NH 71827','001-789-665-9318x74747',50,'premium',NULL,'2022-06-07 00:00:00'),(6,'waltonemily','9#!USCpfEz4k','Cassandra Ramirez','brewerthomas@example.net','3508 Jacqueline Viaduct Apt. 447, Averyland, DE 52903','6944466544',63,'regular',NULL,'2023-04-05 00:00:00'),(7,'jason45','@qhfVSKmz7wI','Danielle Wallace','christopherwells@example.org','791 Williams Mountains Suite 112, Garymouth, MD 83857','001-141-911-6784',36,'regular',NULL,'2020-01-06 00:00:00'),(8,'buckleyteresa','U4X)DohK&9Wu','Alexander Spencer','griffithsteven@example.net','35503 Watson Plaza, New Markbury, CA 57893','(181)404-7805',43,'regular',NULL,'2022-03-15 00:00:00'),(9,'michaelmiller','X%)K3(Targr@','James Hall','clarkjill@example.net','257 Jennifer Point Apt. 615, West Paulfort, MH 14596','001-885-923-0225x2720',53,'premium',NULL,'2019-05-07 00:00:00'),(10,'jmack','4I43DBle@pS8','Anna Henry','manuelharrell@example.org','6627 Jose Loop Apt. 712, West Teresatown, FL 59110','873.367.1741',29,'premium',NULL,'2019-10-21 00:00:00'),(11,'jesus53','7+nl4!AH$eA!','Michelle Jackson','jacob41@example.com','84298 Roberts Run, Port Tracy, AR 41594','(571)596-0381x670',48,'premium',NULL,'2024-01-26 00:00:00'),(12,'watsonvalerie','*(G9R7@hVOR1','Barbara Myers','hernandezmark@example.net','44712 Melissa Drive Apt. 645, Joyshire, WY 62233','1157531977',57,'premium',NULL,'2023-03-20 00:00:00'),(13,'shermanjennifer','+#dy#uOaL9WJ','Devin Sellers','aharrell@example.com','487 Kimberly River Apt. 259, Port Rebeccaland, NC 10256','(498)358-1543',52,'regular',NULL,'2021-03-30 00:00:00'),(14,'lindsay97','j4CQNquh@4J5','Thomas Jones','perezkevin@example.com','16679 Laura Mountains Suite 263, West Tom, AL 20058','760-545-1296x47266',65,'regular',NULL,'2019-10-27 00:00:00'),(15,'garciakelly','^_!lRYKbgt50','Elizabeth Jones','kevin48@example.com','7162 Valerie Shoals Apt. 470, West Melissa, AZ 06395','556.236.3466',24,'premium',NULL,'2022-05-21 00:00:00'),(16,'michelle05','FWLN9HUe(vBf','Tony Lambert','phyllishernandez@example.org','263 Lara Harbors, Torresland, FL 19415','(891)656-6423',49,'premium',NULL,'2019-05-02 00:00:00'),(17,'shelley26','Yd2FvAut!R*u','Jasmine Blackwell','emmareynolds@example.com','PSC 9117, Box 9694, APO AP 40659','(071)627-7245x687',26,'regular',NULL,'2022-08-20 00:00:00'),(18,'james95','+(7Z3DKnVPCM','Dawn Scott','watsonsarah@example.org','3348 Jackson Key Apt. 316, Lake Jessicahaven, DE 87424','001-826-492-9029x16296',37,'regular',NULL,'2022-04-10 00:00:00'),(19,'andrewward','b2sZHJfI&7JO','Sean Rose','katherine37@example.net','9610 Michael Locks Apt. 888, New Katiechester, DE 42723','001-094-270-7547x51765',24,'premium',NULL,'2021-05-29 00:00:00'),(20,'mross','@$Bavg#Q+3P*','Billy Curry','jesse08@example.net','173 Meyer Trail, Brittanyside, KY 70038','001-084-004-2412x4896',50,'regular',NULL,'2023-01-26 00:00:00'),(21,'jennifermcgrath','FLqKs9Rf%gnm','Natalie Smith','dianawright@example.net','167 Leah Vista, North Colleenmouth, OH 72829','001-945-214-5660x68495',38,'regular',NULL,'2020-07-16 00:00:00'),(22,'johnsonhenry','#tqJFMm1vI8!','Alexis Thompson','donna15@example.com','9443 Amanda Inlet, West Donaldtown, CT 87510','001-698-312-9920x9421',63,'regular',NULL,'2023-04-09 00:00:00'),(23,'kennethhampton','Hiz#A7Yz&FK6','Bailey Boyer','kennethmontoya@example.org','994 Cuevas Loop, Port Wendybury, SD 13605','001-508-211-2206x891',54,'regular',NULL,'2021-10-26 00:00:00'),(24,'gpadilla','U0n^rRIPDlMZ','Ashley Vega','tgeorge@example.org','6456 Hurst Shores Apt. 925, Carolynbury, AS 56748','+1-144-454-2393x916',38,'premium',NULL,'2020-12-28 00:00:00'),(25,'franciscowood','C#20ChdPc_!l','Wendy Austin','mirandaallen@example.com','850 Malone Overpass, Rileyport, FL 80147','(839)289-8833x1829',43,'regular',NULL,'2022-05-17 00:00:00'),(26,'makaylahowell','%263JxAj^z)(','Jordan Jackson','salazarjeffrey@example.com','10848 Eric Pine, South Brendaland, MN 35651','001-638-786-4929x386',43,'premium',NULL,'2020-12-19 00:00:00'),(27,'ellen65','#88gq$WmoIgn','Kristin Terrell','griffithheather@example.net','4809 Steele Mountain, West Tyler, NH 97218','212-025-6667x84378',49,'premium',NULL,'2022-07-03 00:00:00'),(28,'christianatkins','Q*8XxKgw^gtF','Gary Turner','russellglenda@example.org','5642 James Valley Apt. 365, Anthonyview, WA 70657','(591)436-4074x34547',49,'regular',NULL,'2023-01-27 00:00:00'),(29,'stephaniecarey','Jqx+8(Jje8_q','Brooke Neal','lisadavies@example.com','866 Anne Orchard Apt. 707, Davidhaven, NJ 43063','+1-350-017-2199x39520',66,'premium',NULL,'2022-10-04 00:00:00'),(30,'morrowchristopher','e1_Td*cD!RYs','Timothy Mccoy','smithrichard@example.org','694 Charles Mission Suite 608, Aprilchester, ND 96154','001-927-134-8837x5802',44,'premium',NULL,'2022-02-23 00:00:00'),(32,'testUsername','testPassword','Test Name','test@example.com','123 Test Lane','555-1234',25,'regular',NULL,'2024-04-08 21:48:59'),(35,'testtest','test','test','test@email.com','123 Place Rd','321-543-6453',32,'regular',NULL,'2024-04-08 21:54:10'),(36,'admin','admin','admin','admin@example.com','123 Admin Lane','123-123-1234',25,'admin',NULL,'2024-04-08 22:30:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `vehicleID` int NOT NULL AUTO_INCREMENT,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` year NOT NULL,
  `color` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `reviewAverage` decimal(3,2) DEFAULT NULL,
  `isAvailable` tinyint(1) NOT NULL,
  PRIMARY KEY (`vehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'Audi','A4',2002,'Red','damaged','Face society center before responsibility tonight address. Task amount store at.\nParticularly control behind only. Nation may continue fly result keep it nice. Peace read send watch.',12.65,1.51,0),(2,'Audi','A4',2009,'Red','perfect','Development sometimes campaign laugh amount century. Son mission cover dream sport. At radio which may most perform thank. Begin early goal.',40.63,1.05,0),(3,'Ford','F-150',2008,'Silver','fair','Land tough arm because light main actually. Physical fall cover certainly. Speech card billion. Answer PM prevent design.',21.93,3.60,0),(4,'Ford','F-150',2013,'Blue','damaged','Service name eat yard risk. White story not.\nScientist friend region break whom chance. Oil collection service but exactly ahead.',46.90,4.75,0),(5,'Nissan','Altima',2022,'Black','damaged','Population present school fine reality man. No seek claim would. Edge think people hand prevent husband face. Ok where professor her.',34.88,3.57,1),(6,'Chevrolet','Silverado',2018,'Black','fair','Turn stand population read interesting condition know. Record bed arm catch.\nCentury break movement debate either pattern either. Fall community price be might. Down factor stand decide wish.',10.59,3.81,0),(7,'Toyota','Camry',2014,'Gray','perfect','As employee pretty doctor fish suffer spring detail. Pressure clearly very health shake.',49.13,2.78,1),(8,'Audi','A4',2002,'Blue','good','Hope growth similar half city. South step start expect yeah.\nSupport during trip between defense first happy. Next bag call yes husband any.',13.72,1.04,1),(9,'Audi','A4',2004,'Green','perfect','Say last soon picture them find fill. High sign when little spend offer huge. Expect hair civil late establish.',40.48,2.93,1),(10,'Toyota','Camry',2013,'Gray','damaged','Mind approach home stand environment leg exist. Indicate election station sit age with significant.\nNor beat resource specific collection maintain. Form baby space by.',32.53,3.43,1),(11,'Audi','A4',2009,'Gray','fair','Bill adult game attorney mouth wait. Professional stop clearly west candidate special bring.\nMeasure short themselves notice sign probably. Wait act meet down never you civil.\nGreen break my its.',19.92,3.27,1),(12,'Nissan','Altima',2009,'Gray','fair','Put political see majority pick. Interview foreign his cost successful. West industry among worker learn give.\nLater staff politics seem focus computer either. Buy discuss design seat player.',45.35,4.73,1),(13,'Chevrolet','Silverado',2020,'Red','damaged','Far government care mind leg six leader. Care factor left agent series player different race.\nSimilar with fact. Not color finish modern.',37.38,2.40,1),(14,'Nissan','Altima',2011,'Gray','good','Exactly sell car. Behind play foreign picture view affect.\nDown back small.',20.35,2.81,1),(15,'Audi','A4',2000,'Red','perfect','Article general key federal. Stay such here three ahead two why call. Movement standard would least chance.\nHow skill left modern around. Mr say start may itself.',10.96,4.70,0),(16,'Audi','A4',2004,'Red','perfect','Prevent industry must knowledge product. Fact baby service person. Especially bar couple way information career.',48.03,1.18,1),(17,'Chevrolet','Silverado',2004,'Gray','perfect','Dark measure information prevent fall matter worry. Entire each social analysis. House value decision resource position reduce.',15.61,3.82,1),(18,'Tesla','Model S',2008,'Green','damaged','Lose and though technology. Physical election think artist way front significant. Believe hand energy involve tend century its.',41.74,1.94,1),(19,'Chevrolet','Silverado',2019,'Red','good','When will sure different. History nice over focus serve could fly. Family those could natural during government particular.',38.32,2.34,0),(20,'Toyota','Camry',2019,'Black','damaged','Try choice line type as structure finish. Almost Republican late thus simple. I across sort commercial.',16.91,2.21,1),(21,'Ford','F-150',2008,'White','damaged','Read anything boy least popular west. Agent give more country garden. Open high close peace. I easy shoulder lot computer.',26.26,3.69,1),(22,'Tesla','Model S',2009,'White','damaged','Measure again teacher field. Now party score early accept question. Reduce organization herself identify travel.',24.08,4.43,0),(23,'Chevrolet','Silverado',2017,'White','damaged','Audience season other town door successful. Serve front affect take. Project toward particularly.\nThere technology least sign. Local perhaps type process second. Determine story for issue really.',11.27,1.54,1),(24,'Ford','F-150',2012,'White','damaged','Month name material quite little now. Experience difference morning age senior. Key laugh idea score.',44.49,2.09,0),(25,'Toyota','Camry',2016,'Green','perfect','Whether however see interesting again great. College police together rule difference sit.',28.28,4.70,0),(26,'Tesla','Model S',2023,'Green','perfect','Ready threat person business. Loss development theory true actually conference past risk.\nAlone rather have law.',34.00,2.69,0),(27,'Ford','F-150',2014,'Black','damaged','Onto mind agent deep none theory speech. Daughter interesting popular animal.\nStop Republican strategy worker player.\nSoldier central police direction kid newspaper.',19.05,3.39,0),(28,'Audi','A4',2000,'Gray','good','Song raise wait. Ability production song film reveal get believe open.\nBall cup though popular step. High support floor find. Over bed beat speak.',32.24,2.05,1),(29,'Tesla','Model S',2014,'Red','damaged','Agreement door sign kid budget season. Officer environmental question those visit right truth. Thank staff end the statement song with.',25.63,1.74,0),(30,'Honda','Civic',2010,'Green','good','Short give serious since style. Marriage who everything TV. Feeling produce whether message care run quite.',26.87,4.50,1);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-08 23:01:58
