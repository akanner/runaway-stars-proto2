-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: raway_db
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `answer_points`
--

DROP TABLE IF EXISTS `answer_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_points`
--

LOCK TABLES `answer_points` WRITE;
/*!40000 ALTER TABLE `answer_points` DISABLE KEYS */;
INSERT INTO `answer_points` VALUES (1,10,'correct'),(2,0,'incorrect');
/*!40000 ALTER TABLE `answer_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_parameter`
--

DROP TABLE IF EXISTS `app_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_parameter`
--

LOCK TABLES `app_parameter` WRITE;
/*!40000 ALTER TABLE `app_parameter` DISABLE KEYS */;
INSERT INTO `app_parameter` VALUES (1,'MAX_QUESTIONS','7'),(2,'CORRECT_ANSWER_TEXT','Respuesta correcta!'),(3,'INCORRECT_ANSWER_TEXT','Respuesta Incorrecta!'),(4,'LEVELS_BEGINNER_TEXT','Principiante'),(5,'LEVELS_BEGINNER_LEGEND','Ten&eacute;s que seguir practicando!'),(6,'LEVELS_INTERMEDIATE_TEXT','Intermedio'),(7,'LEVELS_INTERMEDIATE_LEGEND','Buen Trabajo...pero pod&eacute;s mejorar!'),(8,'LEVELS_EXPERT_TEXT','Experto'),(9,'LEVELS_EXPERT_LEGEND','Seguro qu&eacute; no sos un astr&oacute;nomo?'),(10,'BADGES_BEGINNER_LEGEND','Ganaste la insignia de principiante, &iquest;te anim&aacute;s a ganar la siguiente?'),(11,'BADGES_INTERMEDIATE_LEGEND','&iexcl;Buen Trabajo, ganaste la insignia intermedia! demostraste que ya pod&eacute;s identificar algunas runaway stars...pero todavia pod&eacute;s mejorar!'),(12,'BADGES_EXPERT_LEGEND','Ganaste la insignia de experto! &iquest;Seguro qu&eacute; no sos un astr&oacute;nomo?'),(13,'BADGES_BEGINNER_BADGE','beginner_badge.png'),(14,'BADGES_INTERMEDIATE_BADGE','intermediate_badge.png'),(15,'BADGES_EXPERT_BADGE','expert_badge.png'),(16,'MINIMUM_PERCENTAGE_INTERMEDIATE_LEVEL','50'),(17,'MINIMUM_PERCENTAGE_EXPERT_LEVEL','80');
/*!40000 ALTER TABLE `app_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username_canonical` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'admin','$2y$13$j9xuyx2bhcg8s00o4s488u3IuJGlr5987r3snZk1NIUB1CtCBA9Xy','admin','admin@admin','admin@admin',1,'j9xuyx2bhcg8s00o4s4880wcw000o40','2017-02-25 15:42:13',0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamification_type`
--

DROP TABLE IF EXISTS `gamification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamification_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gamification_type_balance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamification_type`
--

LOCK TABLES `gamification_type` WRITE;
/*!40000 ALTER TABLE `gamification_type` DISABLE KEYS */;
INSERT INTO `gamification_type` VALUES (1,'badges',NULL,50),(2,'levels',NULL,0),(3,'none',NULL,0),(4,'points',NULL,50);
/*!40000 ALTER TABLE `gamification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) NOT NULL,
  `is_correct` tinyint(4) NOT NULL,
  `marked_bowshock_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (6,'HIP2036.jpg',1,'marked/HIP2036_m.jpg'),(7,'HIP22783.jpg',1,'marked/HIP22783_m.jpg'),(8,'HIP32067.jpg',1,'marked/HIP32067_m.jpg'),(9,'HIP34536.jpg',1,'marked/HIP34536_m.jpg'),(10,'HIP82171.jpg',1,'marked/HIP82171_m.jpg'),(11,'HIP398.jpg',0,NULL),(12,'HIP505.jpg',0,NULL),(13,'HIP14969.jpg',0,NULL),(14,'HIP14969.png',0,NULL),(15,'HIP29201.jpg',0,NULL),(16,'HIP48730.jpg',0,NULL),(17,'HIP61958.jpg',0,NULL),(18,'HIP92133.jpg',0,NULL),(19,'HIP99303.jpg',0,NULL),(20,'HIP110386.jpg',0,NULL),(21,'HIP114482.jpg',0,NULL),(22,'11891.jpg',1,'marked/11891_m.jpg'),(23,'28881.jpg',1,'marked/28881_m.jpg'),(24,'29276.jpg',1,'marked/29276_m.jpg'),(25,'31766.jpg',1,'marked/31766_m.jpg'),(26,'88652.jpg',1,'marked/88652_m.jpg'),(27,'HIP16518.png',1,'marked/HIP16518_m.png'),(28,'HIP24575.png',1,'marked/HIP24575_m.jpg'),(29,'HIP25923.png',1,'marked/HIP25923_m.jpg'),(30,'HIP72510.jpg',1,'marked/HIP72510_m.jpg'),(31,'HIP77391.jpg',1,'marked/HIP77391_m.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `ocupation` varchar(45) DEFAULT NULL,
  `zooniverse_username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (1,'usuario1',22,'estudiante',NULL),(2,'usuario2',27,'Estudiante',NULL),(3,'usuario3',32,'museologa',NULL),(4,'usuario4',52,'astronomo',NULL),(5,'usuario5',28,'cpa',NULL),(6,'usuario6',19,'estudiante',NULL),(7,'usuario7',13,'estudiante',NULL),(8,'usuario8',18,'estudiante',NULL),(9,'usuario9',29,'Estudiante',NULL),(10,'usuario10',19,'Estudiante',NULL),(11,'usuario11',30,'docente y becaria',NULL),(12,'usuario12',32,'antropologa',NULL),(13,'usuario13',43,'fisico',NULL),(14,'usuario14',26,'docente',NULL),(15,'usuario15',12,'estudiante',NULL),(16,'usuario16',12,'estudiante',NULL),(17,'usuario17',45,'Docence',NULL),(18,'usuario18',36,'Informatico',NULL),(19,'usuario19',32,'docente investigador',NULL),(20,'usuario20',44,'investigadora',NULL),(21,'usuario21',40,'Informatico',NULL),(22,'usuario22',25,'Estudiante',NULL),(23,'usuario23',40,'Desarrollador de software',NULL),(24,'usuario24',29,'Estudiante',NULL),(25,'usuario25',40,'Informatico',NULL);
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_response`
--

DROP TABLE IF EXISTS `participant_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `first_image_served_id` int(11) DEFAULT NULL,
  `second_image_served_id` int(11) DEFAULT NULL,
  `third_image_served_id` int(11) DEFAULT NULL,
  `correct_image_id` int(11) DEFAULT NULL,
  `selected_image_id` int(11) DEFAULT NULL,
  `pointsEarned` int(11) DEFAULT NULL,
  `answered_at` datetime DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `training_task_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participant_response_image1_idx` (`first_image_served_id`),
  KEY `fk_participant_response_image2_idx` (`second_image_served_id`),
  KEY `fk_participant_response_image3_idx` (`third_image_served_id`),
  KEY `fk_participant_response_image4_idx` (`correct_image_id`),
  KEY `fk_participant_response_image5_idx` (`selected_image_id`),
  KEY `fk_participant_response_session_participant_idx` (`session_id`),
  KEY `fk_participant_response_training_task_idx` (`training_task_id`),
  CONSTRAINT `fk_participant_response_image1` FOREIGN KEY (`first_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image2` FOREIGN KEY (`second_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image3` FOREIGN KEY (`third_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image4` FOREIGN KEY (`correct_image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image5` FOREIGN KEY (`selected_image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_session` FOREIGN KEY (`session_id`) REFERENCES `participant_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_training_task` FOREIGN KEY (`training_task_id`) REFERENCES `training_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_response`
--

LOCK TABLES `participant_response` WRITE;
/*!40000 ALTER TABLE `participant_response` DISABLE KEYS */;
INSERT INTO `participant_response` VALUES (1,1,6,11,12,6,6,10,'2017-03-01 10:57:29','training',1),(2,1,18,7,20,7,7,10,'2017-03-01 10:57:45','training',2),(3,1,21,24,19,24,24,10,'2017-03-01 10:58:00','training',3),(4,1,15,8,14,8,8,NULL,'2017-03-01 10:58:36','real',NULL),(5,1,15,20,27,27,27,NULL,'2017-03-01 10:58:47','real',NULL),(6,1,19,13,27,27,27,NULL,'2017-03-01 10:58:53','real',NULL),(7,1,17,31,16,31,31,NULL,'2017-03-01 10:59:01','real',NULL),(8,1,28,13,11,28,28,NULL,'2017-03-01 10:59:10','real',NULL),(9,1,13,31,14,31,31,NULL,'2017-03-01 10:59:17','real',NULL),(10,1,15,30,16,30,30,NULL,'2017-03-01 10:59:22','real',NULL),(11,2,6,11,12,6,6,10,'2017-03-01 11:01:42','training',1),(12,2,18,7,20,7,7,10,'2017-03-01 11:01:52','training',2),(13,2,21,24,19,24,24,10,'2017-03-01 11:01:59','training',3),(14,2,13,31,15,31,31,NULL,'2017-03-01 11:02:29','real',NULL),(15,2,11,21,8,8,8,NULL,'2017-03-01 11:02:36','real',NULL),(16,2,11,9,15,9,9,NULL,'2017-03-01 11:02:41','real',NULL),(17,2,7,11,12,7,7,NULL,'2017-03-01 11:02:47','real',NULL),(18,2,24,16,20,24,24,NULL,'2017-03-01 11:02:53','real',NULL),(19,2,7,11,19,7,7,NULL,'2017-03-01 11:02:58','real',NULL),(20,2,9,21,15,9,9,NULL,'2017-03-01 11:03:04','real',NULL),(21,3,6,11,12,6,11,0,'2017-03-01 11:12:01','training',1),(22,3,18,7,20,7,20,0,'2017-03-01 11:12:23','training',2),(23,3,21,24,19,24,19,0,'2017-03-01 11:13:00','training',3),(24,3,14,21,10,10,21,NULL,'2017-03-01 11:14:39','real',NULL),(25,3,9,12,11,9,9,NULL,'2017-03-01 11:14:52','real',NULL),(26,3,19,13,25,25,25,NULL,'2017-03-01 11:14:58','real',NULL),(27,3,12,26,18,26,26,NULL,'2017-03-01 11:15:07','real',NULL),(28,3,21,13,6,6,6,NULL,'2017-03-01 11:15:32','real',NULL),(29,3,31,20,15,31,31,NULL,'2017-03-01 11:15:48','real',NULL),(30,3,9,20,21,9,9,NULL,'2017-03-01 11:17:41','real',NULL),(31,4,6,11,12,6,6,10,'2017-03-01 11:27:46','training',1),(32,4,18,7,20,7,7,10,'2017-03-01 11:27:59','training',2),(33,4,21,24,19,24,24,10,'2017-03-01 11:28:10','training',3),(34,4,23,11,18,23,23,NULL,'2017-03-01 11:29:00','real',NULL),(35,4,19,13,22,22,22,NULL,'2017-03-01 11:29:07','real',NULL),(36,4,14,24,17,24,24,NULL,'2017-03-01 11:29:13','real',NULL),(37,4,12,17,31,31,31,NULL,'2017-03-01 11:29:20','real',NULL),(38,4,21,13,28,28,28,NULL,'2017-03-01 11:29:40','real',NULL),(39,4,25,11,17,25,25,NULL,'2017-03-01 11:29:48','real',NULL),(40,4,14,11,29,29,29,NULL,'2017-03-01 11:30:01','real',NULL),(41,5,6,11,12,6,6,10,'2017-03-01 11:38:43','training',1),(42,5,18,7,20,7,7,10,'2017-03-01 11:38:55','training',2),(43,5,21,24,19,24,24,10,'2017-03-01 11:39:06','training',3),(44,5,18,11,31,31,31,NULL,'2017-03-01 11:39:54','real',NULL),(45,5,25,18,17,25,25,NULL,'2017-03-01 11:40:01','real',NULL),(46,5,26,14,17,26,26,NULL,'2017-03-01 11:40:08','real',NULL),(47,5,22,21,16,22,22,NULL,'2017-03-01 11:40:18','real',NULL),(48,5,7,14,18,7,7,NULL,'2017-03-01 11:40:27','real',NULL),(49,5,31,12,11,31,31,NULL,'2017-03-01 11:40:42','real',NULL),(50,5,13,25,19,25,25,NULL,'2017-03-01 11:40:48','real',NULL),(51,6,6,11,12,6,6,10,'2017-03-01 11:46:45','training',1),(52,6,18,7,20,7,7,10,'2017-03-01 11:46:57','training',2),(53,6,21,24,19,24,24,10,'2017-03-01 11:47:06','training',3),(54,6,26,17,13,26,26,NULL,'2017-03-01 11:47:32','real',NULL),(55,6,18,7,14,7,7,NULL,'2017-03-01 11:47:38','real',NULL),(56,6,14,12,31,31,31,NULL,'2017-03-01 11:47:43','real',NULL),(57,6,31,11,19,31,31,NULL,'2017-03-01 11:47:48','real',NULL),(58,6,9,17,14,9,9,NULL,'2017-03-01 11:47:54','real',NULL),(59,6,17,7,12,7,7,NULL,'2017-03-01 11:47:59','real',NULL),(60,6,25,15,17,25,25,NULL,'2017-03-01 11:48:04','real',NULL),(61,7,6,11,12,6,6,10,'2017-03-01 11:52:04','training',1),(62,7,18,7,20,7,7,10,'2017-03-01 11:52:13','training',2),(63,7,21,24,19,24,24,10,'2017-03-01 11:52:23','training',3),(64,7,14,13,28,28,28,NULL,'2017-03-01 11:53:18','real',NULL),(65,7,21,14,9,9,9,NULL,'2017-03-01 11:53:23','real',NULL),(66,7,8,18,19,8,8,NULL,'2017-03-01 11:53:30','real',NULL),(67,7,15,25,13,25,25,NULL,'2017-03-01 11:53:35','real',NULL),(68,7,17,15,24,24,24,NULL,'2017-03-01 11:53:40','real',NULL),(69,7,20,26,21,26,26,NULL,'2017-03-01 11:53:45','real',NULL),(70,7,21,25,13,25,25,NULL,'2017-03-01 11:53:50','real',NULL),(71,8,6,11,12,6,6,10,'2017-03-01 12:00:25','training',1),(72,8,18,7,20,7,7,10,'2017-03-01 12:00:33','training',2),(73,8,21,24,19,24,24,10,'2017-03-01 12:00:42','training',3),(74,8,18,16,9,9,9,NULL,'2017-03-01 12:01:05','real',NULL),(75,8,23,21,15,23,23,NULL,'2017-03-01 12:01:13','real',NULL),(76,8,17,15,31,31,31,NULL,'2017-03-01 12:01:18','real',NULL),(77,8,11,13,7,7,7,NULL,'2017-03-01 12:01:23','real',NULL),(78,8,8,18,12,8,8,NULL,'2017-03-01 12:01:28','real',NULL),(79,8,22,14,19,22,14,NULL,'2017-03-01 12:01:44','real',NULL),(80,8,20,29,13,29,29,NULL,'2017-03-01 12:01:49','real',NULL),(81,9,6,11,12,6,6,10,'2017-03-01 12:05:23','training',1),(82,9,18,7,20,7,7,10,'2017-03-01 12:05:32','training',2),(83,9,21,24,19,24,24,10,'2017-03-01 12:05:39','training',3),(84,9,28,18,15,28,28,NULL,'2017-03-01 12:05:56','real',NULL),(85,9,21,16,24,24,24,NULL,'2017-03-01 12:06:02','real',NULL),(86,9,12,6,13,6,6,NULL,'2017-03-01 12:06:08','real',NULL),(87,9,14,10,21,10,10,NULL,'2017-03-01 12:06:14','real',NULL),(88,9,20,25,14,25,25,NULL,'2017-03-01 12:06:19','real',NULL),(89,9,6,15,11,6,6,NULL,'2017-03-01 12:06:25','real',NULL),(90,9,22,12,15,22,22,NULL,'2017-03-01 12:06:33','real',NULL),(91,10,6,11,12,6,6,10,'2017-03-01 12:23:08','training',1),(92,10,18,7,20,7,7,10,'2017-03-01 12:23:21','training',2),(93,10,21,24,19,24,24,10,'2017-03-01 12:23:29','training',3),(94,10,20,16,23,23,23,NULL,'2017-03-01 12:24:28','real',NULL),(95,10,7,18,15,7,7,NULL,'2017-03-01 12:24:35','real',NULL),(96,10,11,19,28,28,11,NULL,'2017-03-01 12:24:44','real',NULL),(97,10,19,17,23,23,23,NULL,'2017-03-01 12:24:49','real',NULL),(98,10,14,22,12,22,22,NULL,'2017-03-01 12:24:57','real',NULL),(99,10,24,13,17,24,24,NULL,'2017-03-01 12:25:04','real',NULL),(100,10,20,30,11,30,30,NULL,'2017-03-01 12:25:11','real',NULL),(101,11,6,11,12,6,6,10,'2017-03-01 12:32:04','training',1),(102,11,18,7,20,7,7,10,'2017-03-01 12:32:25','training',2),(103,11,21,24,19,24,24,10,'2017-03-01 12:32:34','training',3),(104,11,21,19,6,6,6,NULL,'2017-03-01 12:33:21','real',NULL),(105,11,25,18,16,25,25,NULL,'2017-03-01 12:33:32','real',NULL),(106,11,11,14,31,31,31,NULL,'2017-03-01 12:33:40','real',NULL),(107,11,29,14,19,29,29,NULL,'2017-03-01 12:33:47','real',NULL),(108,11,19,9,20,9,9,NULL,'2017-03-01 12:33:54','real',NULL),(109,11,11,13,24,24,24,NULL,'2017-03-01 12:34:00','real',NULL),(110,11,21,7,19,7,7,NULL,'2017-03-01 12:34:04','real',NULL),(111,12,6,11,12,6,6,10,'2017-03-01 12:43:27','training',1),(112,12,18,7,20,7,7,10,'2017-03-01 12:43:38','training',2),(113,12,21,24,19,24,24,10,'2017-03-01 12:43:50','training',3),(114,12,23,15,20,23,23,NULL,'2017-03-01 12:44:32','real',NULL),(115,12,24,16,14,24,24,NULL,'2017-03-01 12:44:47','real',NULL),(116,12,19,9,18,9,9,NULL,'2017-03-01 12:44:56','real',NULL),(117,12,17,20,29,29,29,NULL,'2017-03-01 12:45:07','real',NULL),(118,12,28,15,20,28,28,NULL,'2017-03-01 12:45:21','real',NULL),(119,12,25,16,14,25,25,NULL,'2017-03-01 12:45:29','real',NULL),(120,12,13,12,29,29,29,NULL,'2017-03-01 12:45:36','real',NULL),(121,13,6,11,12,6,6,10,'2017-03-01 12:54:23','training',1),(122,13,18,7,20,7,7,10,'2017-03-01 12:54:41','training',2),(123,13,21,24,19,24,24,10,'2017-03-01 12:55:05','training',3),(124,13,18,24,19,24,24,NULL,'2017-03-01 12:55:37','real',NULL),(125,13,19,20,28,28,28,NULL,'2017-03-01 12:55:48','real',NULL),(126,13,21,29,13,29,29,NULL,'2017-03-01 12:56:07','real',NULL),(127,13,10,19,12,10,10,NULL,'2017-03-01 12:56:17','real',NULL),(128,13,10,18,14,10,10,NULL,'2017-03-01 12:56:43','real',NULL),(129,13,21,12,6,6,6,NULL,'2017-03-01 12:56:52','real',NULL),(130,13,28,14,19,28,28,NULL,'2017-03-01 12:57:03','real',NULL),(131,14,6,11,12,6,6,10,'2017-03-01 13:04:13','training',1),(132,14,18,7,20,7,7,10,'2017-03-01 13:04:23','training',2),(133,14,21,24,19,24,24,10,'2017-03-01 13:04:36','training',3),(134,14,21,27,20,27,27,NULL,'2017-03-01 13:05:08','real',NULL),(135,14,21,15,10,10,10,NULL,'2017-03-01 13:05:15','real',NULL),(136,14,13,28,17,28,28,NULL,'2017-03-01 13:05:23','real',NULL),(137,14,12,25,21,25,25,NULL,'2017-03-01 13:05:28','real',NULL),(138,14,17,27,21,27,27,NULL,'2017-03-01 13:05:34','real',NULL),(139,14,20,18,24,24,24,NULL,'2017-03-01 13:05:40','real',NULL),(140,14,15,13,29,29,29,NULL,'2017-03-01 13:05:50','real',NULL),(141,15,6,11,12,6,6,10,'2017-03-01 13:12:25','training',1),(142,15,18,7,20,7,7,10,'2017-03-01 13:12:53','training',2),(143,15,21,24,19,24,24,10,'2017-03-01 13:13:40','training',3),(144,16,6,11,12,6,6,10,'2017-03-01 13:16:56','training',1),(145,16,18,7,20,7,7,10,'2017-03-01 13:17:06','training',2),(146,16,21,24,19,24,24,10,'2017-03-01 13:17:14','training',3),(147,16,21,31,17,31,31,NULL,'2017-03-01 13:17:49','real',NULL),(148,16,12,24,15,24,24,NULL,'2017-03-01 13:17:55','real',NULL),(149,16,22,18,11,22,22,NULL,'2017-03-01 13:18:05','real',NULL),(150,16,8,19,15,8,8,NULL,'2017-03-01 13:18:12','real',NULL),(151,16,14,8,20,8,8,NULL,'2017-03-01 13:18:16','real',NULL),(152,16,21,13,8,8,8,NULL,'2017-03-01 13:18:19','real',NULL),(153,16,18,6,12,6,6,NULL,'2017-03-01 13:18:28','real',NULL),(154,17,6,11,12,6,6,10,'2017-03-02 09:16:41','training',1),(155,17,18,7,20,7,7,10,'2017-03-02 09:16:49','training',2),(156,17,21,24,19,24,24,10,'2017-03-02 09:16:56','training',3),(157,17,12,31,15,31,31,NULL,'2017-03-02 09:17:40','real',NULL),(158,17,17,9,19,9,9,NULL,'2017-03-02 09:18:18','real',NULL),(159,17,19,18,29,29,29,NULL,'2017-03-02 09:18:23','real',NULL),(160,17,14,18,29,29,29,NULL,'2017-03-02 09:18:49','real',NULL),(161,17,23,20,11,23,23,NULL,'2017-03-02 09:19:00','real',NULL),(162,17,16,23,19,23,19,NULL,'2017-03-02 09:19:07','real',NULL),(163,17,15,12,7,7,7,NULL,'2017-03-02 09:19:13','real',NULL),(164,18,6,11,12,6,6,10,'2017-03-02 09:52:12','training',1),(165,18,18,7,20,7,7,10,'2017-03-02 09:52:21','training',2),(166,18,21,24,19,24,24,10,'2017-03-02 09:52:29','training',3),(167,18,18,9,14,9,9,NULL,'2017-03-02 09:53:00','real',NULL),(168,18,8,11,18,8,8,NULL,'2017-03-02 09:53:15','real',NULL),(169,18,28,16,15,28,28,NULL,'2017-03-02 09:56:42','real',NULL),(170,18,24,14,17,24,24,NULL,'2017-03-02 09:56:52','real',NULL),(171,18,14,15,7,7,7,NULL,'2017-03-02 09:57:01','real',NULL),(172,18,27,12,15,27,27,NULL,'2017-03-02 09:57:37','real',NULL),(173,18,13,10,16,10,10,NULL,'2017-03-02 09:57:42','real',NULL),(174,19,6,11,12,6,6,10,'2017-03-02 10:08:10','training',1),(175,19,18,7,20,7,7,10,'2017-03-02 10:08:21','training',2),(176,19,21,24,19,24,24,10,'2017-03-02 10:08:31','training',3),(177,19,20,29,11,29,29,NULL,'2017-03-02 10:09:10','real',NULL),(178,19,14,6,12,6,6,NULL,'2017-03-02 10:09:15','real',NULL),(179,19,12,15,27,27,27,NULL,'2017-03-02 10:09:21','real',NULL),(180,19,8,12,21,8,8,NULL,'2017-03-02 10:09:27','real',NULL),(181,19,10,15,20,10,10,NULL,'2017-03-02 10:09:33','real',NULL),(182,19,13,24,18,24,24,NULL,'2017-03-02 10:09:38','real',NULL),(183,19,16,17,25,25,25,NULL,'2017-03-02 10:09:42','real',NULL),(184,20,6,11,12,6,6,10,'2017-03-02 10:22:00','training',1),(185,20,18,7,20,7,7,10,'2017-03-02 10:22:11','training',2),(186,20,21,24,19,24,24,10,'2017-03-02 10:22:26','training',3),(187,20,15,18,7,7,7,NULL,'2017-03-02 10:23:23','real',NULL),(188,20,24,20,16,24,24,NULL,'2017-03-02 10:23:33','real',NULL),(189,20,17,9,19,9,9,NULL,'2017-03-02 10:23:46','real',NULL),(190,20,16,26,20,26,26,NULL,'2017-03-02 10:23:53','real',NULL),(191,20,23,16,14,23,23,NULL,'2017-03-02 10:24:01','real',NULL),(192,20,12,28,18,28,28,NULL,'2017-03-02 10:24:19','real',NULL),(193,20,16,26,14,26,26,NULL,'2017-03-02 10:24:26','real',NULL),(194,21,6,11,12,6,6,10,'2017-03-02 10:38:38','training',1),(195,21,18,7,20,7,7,10,'2017-03-02 10:38:57','training',2),(196,21,21,24,19,24,24,10,'2017-03-02 10:39:10','training',3),(197,21,20,14,6,6,6,NULL,'2017-03-02 10:39:51','real',NULL),(198,21,19,8,20,8,8,NULL,'2017-03-02 10:40:01','real',NULL),(199,21,11,20,28,28,28,NULL,'2017-03-02 10:40:20','real',NULL),(200,21,14,21,23,23,23,NULL,'2017-03-02 10:40:29','real',NULL),(201,21,14,6,18,6,6,NULL,'2017-03-02 10:40:38','real',NULL),(202,21,12,15,23,23,23,NULL,'2017-03-02 10:40:51','real',NULL),(203,21,18,23,14,23,23,NULL,'2017-03-02 10:41:07','real',NULL),(204,22,6,11,12,6,6,10,'2017-03-02 10:45:21','training',1),(205,22,18,7,20,7,7,10,'2017-03-02 10:45:41','training',2),(206,22,21,24,19,24,24,10,'2017-03-02 10:45:50','training',3),(207,22,18,10,15,10,10,NULL,'2017-03-02 10:46:32','real',NULL),(208,22,25,19,14,25,25,NULL,'2017-03-02 10:46:44','real',NULL),(209,22,28,21,12,28,12,NULL,'2017-03-02 10:47:17','real',NULL),(210,22,24,19,11,24,24,NULL,'2017-03-02 10:47:25','real',NULL),(211,22,24,17,20,24,24,NULL,'2017-03-02 10:47:39','real',NULL),(212,22,30,19,20,30,30,NULL,'2017-03-02 10:47:46','real',NULL),(213,22,13,30,20,30,30,NULL,'2017-03-02 10:47:52','real',NULL),(214,23,6,11,12,6,6,10,'2017-03-02 10:54:35','training',1),(215,23,18,7,20,7,7,10,'2017-03-02 10:54:59','training',2),(216,23,21,24,19,24,24,10,'2017-03-02 10:55:13','training',3),(217,23,14,26,21,26,26,NULL,'2017-03-02 10:55:50','real',NULL),(218,23,28,17,15,28,15,NULL,'2017-03-02 10:56:17','real',NULL),(219,23,30,14,12,30,30,NULL,'2017-03-02 10:56:29','real',NULL),(220,23,18,21,23,23,23,NULL,'2017-03-02 10:56:39','real',NULL),(221,23,13,7,11,7,7,NULL,'2017-03-02 10:56:52','real',NULL),(222,23,7,16,17,7,7,NULL,'2017-03-02 10:57:03','real',NULL),(223,23,18,27,12,27,27,NULL,'2017-03-02 10:57:19','real',NULL),(224,24,6,11,12,6,6,10,'2017-03-02 11:13:03','training',1),(225,24,18,7,20,7,7,10,'2017-03-02 11:13:11','training',2),(226,24,21,24,19,24,24,10,'2017-03-02 11:13:18','training',3),(227,24,6,17,13,6,6,NULL,'2017-03-02 11:13:42','real',NULL),(228,24,15,31,13,31,31,NULL,'2017-03-02 11:13:58','real',NULL),(229,24,7,19,21,7,7,NULL,'2017-03-02 11:14:03','real',NULL),(230,24,13,17,10,10,10,NULL,'2017-03-02 11:14:08','real',NULL),(231,24,6,15,12,6,6,NULL,'2017-03-02 11:14:13','real',NULL),(232,24,7,12,13,7,7,NULL,'2017-03-02 11:14:18','real',NULL),(233,24,14,8,16,8,8,NULL,'2017-03-02 11:14:23','real',NULL),(234,25,6,11,12,6,6,10,'2017-03-02 11:18:55','training',1),(235,25,18,7,20,7,7,10,'2017-03-02 11:19:04','training',2),(236,25,21,24,19,24,24,10,'2017-03-02 11:19:14','training',3),(237,25,16,14,24,24,24,NULL,'2017-03-02 11:19:42','real',NULL),(238,25,20,25,19,25,25,NULL,'2017-03-02 11:19:48','real',NULL),(239,25,16,18,6,6,6,NULL,'2017-03-02 11:19:57','real',NULL),(240,25,20,29,19,29,29,NULL,'2017-03-02 11:20:04','real',NULL),(241,25,11,13,6,6,6,NULL,'2017-03-02 11:20:09','real',NULL),(242,25,13,23,14,23,23,NULL,'2017-03-02 11:20:14','real',NULL),(243,25,13,12,22,22,22,NULL,'2017-03-02 11:20:19','real',NULL);
/*!40000 ALTER TABLE `participant_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_session`
--

DROP TABLE IF EXISTS `participant_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) NOT NULL,
  `http_session` varchar(1024) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime DEFAULT NULL,
  `total_points` int(11) DEFAULT NULL,
  `gamification_type_id` int(11) NOT NULL,
  `percentile` float DEFAULT NULL,
  `participant_confidence` int(11) DEFAULT NULL,
  `next_session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_session_participant_participant_idx` (`participant_id`),
  KEY `IDX_4A491ADC6A33B9B3` (`gamification_type_id`),
  KEY `fk_participant_session_participant_session_idx` (`next_session_id`),
  CONSTRAINT `FK_4A491ADC6A33B9B3` FOREIGN KEY (`gamification_type_id`) REFERENCES `gamification_type` (`id`),
  CONSTRAINT `fk_participant_session_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_session_participant_session` FOREIGN KEY (`next_session_id`) REFERENCES `participant_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_session`
--

LOCK TABLES `participant_session` WRITE;
/*!40000 ALTER TABLE `participant_session` DISABLE KEYS */;
INSERT INTO `participant_session` VALUES (1,1,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 10:57:06',NULL,30,4,100,8,NULL),(2,2,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 11:01:30',NULL,30,1,100,10,NULL),(3,3,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 11:11:31',NULL,0,4,33.3333,7,NULL),(4,4,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 11:26:42',NULL,30,1,100,7,NULL),(5,5,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 11:38:16',NULL,30,4,100,8,NULL),(6,6,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 11:46:16',NULL,30,1,100,7,NULL),(7,7,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 11:51:42',NULL,30,4,100,8,NULL),(8,8,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 12:00:08',NULL,30,1,100,8,NULL),(9,9,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 12:05:08',NULL,30,4,100,8,NULL),(10,10,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 12:22:46',NULL,30,1,100,7,NULL),(11,11,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 12:31:38',NULL,30,1,100,8,NULL),(12,12,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 12:43:04',NULL,30,4,100,7,NULL),(13,13,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 12:53:44',NULL,30,4,100,5,NULL),(14,14,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 13:03:48',NULL,30,1,100,5,NULL),(15,15,'odi82j3j6sv5qk1bobvq5nu554','2017-03-01 13:10:57',NULL,30,4,100,NULL,NULL),(16,16,'n0f72qsuieill9ujfcvrt19nl0','2017-03-01 13:16:43',NULL,30,1,100,7,NULL),(17,17,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 09:16:07',NULL,30,4,100,10,NULL),(18,18,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 09:51:42',NULL,30,1,100,7,NULL),(19,19,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 10:07:47',NULL,30,1,100,10,NULL),(20,20,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 10:21:19',NULL,30,4,100,9,NULL),(21,21,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 10:38:05',NULL,30,1,100,5,NULL),(22,22,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 10:44:36',NULL,30,4,100,9,NULL),(23,23,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 10:54:03',NULL,30,1,100,4,NULL),(24,24,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 11:12:42',NULL,30,4,100,9,NULL),(25,25,'cufji4q8b5qfhj12rolbp66ac1','2017-03-02 11:18:35',NULL,30,1,100,7,NULL);
/*!40000 ALTER TABLE `participant_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_task`
--

DROP TABLE IF EXISTS `training_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_step` int(11) NOT NULL,
  `help_text` text,
  `first_image` int(11) DEFAULT NULL,
  `second_image` int(11) DEFAULT NULL,
  `third_image` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_training_task_image1_idx` (`first_image`),
  KEY `fk_training_task_image2_idx` (`second_image`),
  KEY `fk_training_task_image3_idx` (`third_image`),
  CONSTRAINT `fk_training_task_image1` FOREIGN KEY (`first_image`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_training_task_image2` FOREIGN KEY (`second_image`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_training_task_image3` FOREIGN KEY (`third_image`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_task`
--

LOCK TABLES `training_task` WRITE;
/*!40000 ALTER TABLE `training_task` DISABLE KEYS */;
INSERT INTO `training_task` VALUES (1,1,'aaaaaa',6,11,12),(2,2,NULL,18,7,20),(3,3,NULL,21,24,19);
/*!40000 ALTER TABLE `training_task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-05 14:03:07
