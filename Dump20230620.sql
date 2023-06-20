CREATE DATABASE  IF NOT EXISTS `db_absensi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_absensi`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: db_absensi
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `employee_attendance_photos`
--

DROP TABLE IF EXISTS `employee_attendance_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_attendance_photos` (
  `photoId` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `file_name1` varchar(100) DEFAULT NULL,
  `file_name2` varchar(100) DEFAULT NULL,
  `file_name3` varchar(100) DEFAULT NULL,
  `file_name4` varchar(100) DEFAULT NULL,
  `file_name5` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`photoId`),
  KEY `fk_attandance_photo_employees` (`employeeId`),
  CONSTRAINT `fk_attandance_photo_employees` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendance_photos`
--

LOCK TABLES `employee_attendance_photos` WRITE;
/*!40000 ALTER TABLE `employee_attendance_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_attendance_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_attendances`
--

DROP TABLE IF EXISTS `employee_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_attendances` (
  `attendanceId` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `day` varchar(9) NOT NULL,
  `time_arrives` varchar(8) DEFAULT NULL,
  `time_departure` varchar(8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `upload_filename_arrives` varchar(145) DEFAULT NULL,
  `upload_filepath_arrives` varchar(145) DEFAULT NULL,
  `upload_filename_departure` varchar(145) DEFAULT NULL,
  `upload_filepath_departure` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`attendanceId`),
  KEY `fk_attandance_employees` (`employeeId`),
  CONSTRAINT `fk_attandance_employees` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
INSERT INTO `employee_attendances` VALUES (1,1,'thursday','21:10:21','21:10:31','2023-06-08 14:10:21','2023-06-08 14:10:21',NULL,NULL,NULL,NULL),(2,1,'monday','09:29:06','09:42:08','2023-06-12 02:29:06','2023-06-12 02:29:06',NULL,NULL,NULL,NULL),(11,1,'sunday','19:54:48','19:55:11','2023-06-18 12:54:48','2023-06-18 12:54:48','1_arrives_20230618.png','assets/img/attendance_photo/1/1_arrives_20230618.png','1_departure_20230618.png','assets/img/attendance_photo/1/1_departure_20230618.png');
/*!40000 ALTER TABLE `employee_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_task_documents`
--

DROP TABLE IF EXISTS `employee_task_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_task_documents` (
  `docId` int NOT NULL AUTO_INCREMENT,
  `taskId` int NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`docId`),
  KEY `fk_document_task` (`taskId`),
  CONSTRAINT `fk_document_task` FOREIGN KEY (`taskId`) REFERENCES `employee_tasks` (`taskId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_task_documents`
--

LOCK TABLES `employee_task_documents` WRITE;
/*!40000 ALTER TABLE `employee_task_documents` DISABLE KEYS */;
INSERT INTO `employee_task_documents` VALUES (1,1,'6481f7e78d326.jpg','2023-06-08 15:46:47','2023-06-08 15:46:47'),(5,6,'6481fb21afb2a.docx','2023-06-08 16:00:33','2023-06-08 16:00:33'),(6,9,'648ed63d6e125.jpg','2023-06-18 10:02:37','2023-06-18 10:02:37'),(7,10,'648ed641cb5bf.jpg','2023-06-18 10:02:41','2023-06-18 10:02:41'),(8,11,'648eff1a07732.jpg','2023-06-18 12:56:58','2023-06-18 12:56:58');
/*!40000 ALTER TABLE `employee_task_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_tasks`
--

DROP TABLE IF EXISTS `employee_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_tasks` (
  `taskId` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `managerId` int DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `instruction` text,
  `status` enum('onprogres','checking','accepted','revision') DEFAULT 'onprogres',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`taskId`),
  KEY `fk_task_employees` (`employeeId`),
  KEY `fk_task_managers` (`managerId`),
  CONSTRAINT `fk_task_employees` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_task_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`managerId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tasks`
--

LOCK TABLES `employee_tasks` WRITE;
/*!40000 ALTER TABLE `employee_tasks` DISABLE KEYS */;
INSERT INTO `employee_tasks` VALUES (1,1,NULL,'Rapat terpadu Lt.5','infolahtah',NULL,'onprogres','2023-06-08 15:46:47','2023-06-08 15:46:47'),(4,1,NULL,'Rapat terpadu Lt.5','dwadwa',NULL,'onprogres','2023-06-08 15:49:03','2023-06-08 15:49:03'),(5,1,NULL,'Rapat terpadu Lt.5','dwadaw',NULL,'onprogres','2023-06-08 15:49:21','2023-06-08 15:49:21'),(6,1,NULL,'rapat terpadu lt.4 penyakit dalam','bersama pak maraden',NULL,'onprogres','2023-06-08 16:00:33','2023-06-08 16:00:33'),(7,1,NULL,'Rapat terpadu Lt.5','rapat dilantai 5 bersama kainfolahta dan team dipimpin oleh diryankes<br>ke lab mengurus bridging winacom','lupakan bridging winacom, pergi bersama ai di cikini makan mie ayam ditunggu','accepted','2023-06-12 02:31:00','2023-06-12 02:31:00'),(8,1,1,'RAPAT TERPADU BERSAMA DI PUSKODAL','siap bu laksanakan','lakukan segera','revision','2023-06-13 06:31:43','2023-06-13 06:31:43'),(9,1,NULL,'testing file','file foto',NULL,'onprogres','2023-06-18 10:02:37','2023-06-18 10:02:37'),(10,1,NULL,'testing file','file foto',NULL,'onprogres','2023-06-18 10:02:41','2023-06-18 10:02:41'),(11,1,NULL,'testing','',NULL,'onprogres','2023-06-18 12:56:58','2023-06-18 12:56:58');
/*!40000 ALTER TABLE `employee_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employeeId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `managerId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `img_profile` varchar(100) DEFAULT NULL,
  `NA` varchar(1) DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employeeId`),
  KEY `fk_employees_users` (`userId`),
  KEY `fk_employees_managers` (`managerId`),
  CONSTRAINT `fk_employees_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`managerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_employees_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,3,1,'mustofa daniel',NULL,NULL,'N','2023-06-08 14:06:47','2023-06-08 14:06:47'),(2,4,2,'rilo anggoro',NULL,NULL,'N','2023-06-08 14:06:47','2023-06-08 14:06:47'),(3,5,1,'aini','089878666566',NULL,'N','2023-06-12 02:48:00','2023-06-12 02:48:00');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_configs`
--

DROP TABLE IF EXISTS `manager_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_configs` (
  `configId` int NOT NULL AUTO_INCREMENT,
  `managerId` int NOT NULL,
  `meet_link` varchar(250) DEFAULT NULL,
  `meet_time_show` varchar(8) DEFAULT NULL,
  `meet_time_hide` varchar(8) DEFAULT NULL,
  `meet_days_show` varchar(60) DEFAULT NULL,
  `latitude_attendance` varchar(11) DEFAULT NULL,
  `longitude_attendance` varchar(11) DEFAULT NULL,
  `max_distance_attendance` int DEFAULT NULL,
  `days_attendance` varchar(60) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`configId`),
  KEY `fk_manager_config_managers` (`managerId`),
  CONSTRAINT `fk_manager_config_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`managerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_configs`
--

LOCK TABLES `manager_configs` WRITE;
/*!40000 ALTER TABLE `manager_configs` DISABLE KEYS */;
INSERT INTO `manager_configs` VALUES (1,1,'www.meet.google.com/qwe-ewcs-chx','09:28','09:29','monday','-6.17721423','106.8355810',100,'sunday','2023-06-08 14:07:43','2023-06-08 14:07:43');
/*!40000 ALTER TABLE `manager_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `managerId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `img_profile` varchar(100) DEFAULT NULL,
  `NA` varchar(1) DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`managerId`),
  KEY `fk_managers_users` (`userId`),
  CONSTRAINT `fk_managers_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,1,'herlina',NULL,NULL,'N','2023-06-08 14:06:47','2023-06-08 14:06:47'),(2,2,'heri',NULL,NULL,'N','2023-06-08 14:06:47','2023-06-08 14:06:47');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_levels`
--

DROP TABLE IF EXISTS `user_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_levels` (
  `userLevelId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`userLevelId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_levels`
--

LOCK TABLES `user_levels` WRITE;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
INSERT INTO `user_levels` VALUES (1,'manager'),(2,'employee');
/*!40000 ALTER TABLE `user_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userLevelId` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`),
  KEY `fk_users_user_levels` (`userLevelId`),
  CONSTRAINT `fk_users_user_levels` FOREIGN KEY (`userLevelId`) REFERENCES `user_levels` (`userLevelId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'herlina123','1bf2b78e9b2aa083bf42e1aa9a2b0404614ada2603628a317a741775d9e704b8f0728cee1a2538434539dc8b990e37f6db6517e6fa87ac59d7d2cd459f5f38693Vg+UjLRU3cfjNUgiquCva1Ql3cFsVX68EiXW+isPlw=',1,'2023-06-08 14:06:47','2023-06-08 14:06:47'),(2,1,'heri123','983f149377fa3bbdc0eb932526a534f8e2eaccb3b510545afdca3c1c6b67bd2e7a84ad626b807b862729053227f5bcfdf640ff5bcfa94fd8ea985b90b295cdcfSftfFYbX2lxPb9+kT3dPFSCnACCPdHrragMcK13y1J4=',1,'2023-06-08 14:06:47','2023-06-08 14:06:47'),(3,2,'daniel123','cc8f795593b5d9474fad67ad85e908396d0955b45abef691c3c2eec85a1ec98518baa9befc4f546043cdf53876567dbea1b5c1db97ab836b9e8259bb5919fd51mgLPtytanT2QSdEsgkWhneZTQmTggKsq5+PnztZLrh4=',1,'2023-06-08 14:06:47','2023-06-08 14:06:47'),(4,2,'rilo123','0bda6e6c54182f57379d448a5acbb77dc3fbedf57f80fc8fca84c5efa92fba36d245dc46d8c3fbabc233669951e8656f21a00231c394168925114d1cd4821e1fa1BV5OJ8ge7zZN8mpRnPoFKpj03N22q11OZ/IIaIn/k=',1,'2023-06-08 14:06:47','2023-06-08 14:06:47'),(5,2,'ainicahyo','6485c5f47b1d817e75b2f8a069f534dc849c684bed3512b25ebb44af2f1c5703efa515313545ab927dbe685506df7027f0b6dac0c50d4c6cc9d8f3d3180abadfNKeJsNGyR6JpVd76zXLecYqP3tBgMmHVDqt9MCV253Q=',1,'2023-06-12 02:48:00','2023-06-12 02:48:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-20 19:03:44
