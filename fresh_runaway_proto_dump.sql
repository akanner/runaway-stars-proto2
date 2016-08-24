-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_runaway_proto
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
INSERT INTO `answer_points` VALUES (1,5,'correct'),(2,5,'incorrect');
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
INSERT INTO `app_parameter` VALUES (1,'MAX_QUESTIONS','5'),(2,'CORRECT_ANSWER_TEXT','Felicitaciones! tu respuesta es correcta.'),(3,'INCORRECT_ANSWER_TEXT','Respuesta Incorrecta!'),(4,'LEVELS_BEGINNER_TEXT','Principiante'),(5,'LEVELS_BEGINNER_LEGEND','Ten&eacute;s que seguir practicando!'),(6,'LEVELS_INTERMEDIATE_TEXT','Intermedio'),(7,'LEVELS_INTERMEDIATE_LEGEND','Buen Trabajo...pero pod&eacute;s mejorar!'),(8,'LEVELS_EXPERT_TEXT','Experto'),(9,'LEVELS_EXPERT_LEGEND','Seguro qu&eacute; no sos un astr&oacute;nomo?'),(10,'BADGES_BEGINNER_LEGEND','Ganaste la insignia de principiante, &iquest;te anim&aacute;s a ganar la siguiente?'),(11,'BADGES_INTERMEDIATE_LEGEND','&iexcl;Buen Trabajo, ganaste la insignia intermedia! demostraste que ya pod&eacute;s identificar algunas runaway stars...pero todavia pod&eacute;s mejorar!'),(12,'BADGES_EXPERT_LEGEND','Ganaste la insignia de experto! &iquest;Seguro qu&eacute; no sos un astr&oacute;nomo?'),(13,'BADGES_BEGINNER_BADGE','beginner_badge.png'),(14,'BADGES_INTERMEDIATE_BADGE','intermediate_badge.png'),(15,'BADGES_EXPERT_BADGE','expert_badge.png'),(16,'MINIMUM_PERCENTAGE_INTERMEDIATE_LEVEL','50'),(17,'MINIMUM_PERCENTAGE_EXPERT_LEVEL','80');
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
INSERT INTO `fos_user` VALUES (1,'admin','$2y$13$j9xuyx2bhcg8s00o4s488u5ZtLCrGvrI7Jc2KCxth2iWcqzVow3yC','admin','admin@admin','admin@admin',1,'j9xuyx2bhcg8s00o4s4880wcw000o40','2016-08-07 00:54:17',0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamification_type`
--

LOCK TABLES `gamification_type` WRITE;
/*!40000 ALTER TABLE `gamification_type` DISABLE KEYS */;
INSERT INTO `gamification_type` VALUES (1,'badges',NULL,50),(2,'levels',NULL,25),(3,'none',NULL,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (6,'HIP2036.jpg',1,'marked/HIP2036_m.jpg'),(7,'HIP22783.jpg',1,'marked/HIP22783_m.jpg'),(8,'HIP32067.jpg',1,'marked/HIP32067_m.jpg'),(9,'HIP34536.jpg',1,'marked/HIP34536_m.jpg'),(10,'HIP82171.jpg',1,'marked/HIP82171_m.jpg'),(11,'HIP398.jpg',0,NULL),(12,'HIP505.jpg',0,NULL),(13,'HIP14969.jpg',0,NULL),(14,'HIP14969.png',0,NULL),(15,'HIP29201.jpg',0,NULL),(16,'HIP48730.jpg',0,NULL),(17,'HIP61958.jpg',0,NULL),(18,'HIP92133.jpg',0,NULL),(19,'HIP99303.jpg',0,NULL),(20,'HIP110386.jpg',0,NULL),(21,'HIP114482.jpg',0,NULL),(22,'11891.jpg',1,'marked/11891_m.jpg'),(23,'28881.jpg',1,'marked/28881_m.jpg'),(24,'29276.jpg',1,'marked/29276_m.jpg'),(25,'31766.jpg',1,'marked/31766_m.jpg'),(26,'88652.jpg',1,'marked/88652_m.jpg');
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
  `gender` varchar(45) DEFAULT NULL,
  `zooniverse_username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (16,'aaa',25,'aa',NULL),(17,'aa',25,'aa',NULL),(18,'aaa',25,'aa',NULL),(19,'aaa',25,'aa',NULL),(20,'aaa',26,'aa',NULL),(21,'aaa',25,'aa',NULL),(22,'25',23,'aa',NULL),(23,'aa',25,'aa',NULL),(24,'aaa',2,'23','23'),(25,'aaa',23,'aa','23');
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
  PRIMARY KEY (`id`),
  KEY `fk_participant_response_image1_idx` (`first_image_served_id`),
  KEY `fk_participant_response_image2_idx` (`second_image_served_id`),
  KEY `fk_participant_response_image3_idx` (`third_image_served_id`),
  KEY `fk_participant_response_image4_idx` (`correct_image_id`),
  KEY `fk_participant_response_image5_idx` (`selected_image_id`),
  KEY `fk_participant_response_session_participant_idx` (`session_id`),
  CONSTRAINT `fk_participant_response_image1` FOREIGN KEY (`first_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image2` FOREIGN KEY (`second_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image3` FOREIGN KEY (`third_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image4` FOREIGN KEY (`correct_image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image5` FOREIGN KEY (`selected_image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_session` FOREIGN KEY (`session_id`) REFERENCES `participant_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_response`
--

LOCK TABLES `participant_response` WRITE;
/*!40000 ALTER TABLE `participant_response` DISABLE KEYS */;
INSERT INTO `participant_response` VALUES (71,16,9,21,18,9,9,5,'2016-08-09 19:43:22'),(72,16,11,20,22,22,22,5,'2016-08-09 19:45:00'),(73,16,17,8,11,8,8,5,'2016-08-09 19:45:03'),(74,16,19,23,14,23,23,5,'2016-08-09 19:45:06'),(75,16,10,18,12,10,10,5,'2016-08-09 19:45:10'),(76,17,26,12,13,26,26,5,'2016-08-09 20:06:38'),(77,17,15,14,9,9,9,5,'2016-08-09 20:06:41'),(78,17,11,26,19,26,26,5,'2016-08-09 20:06:44'),(79,17,12,11,8,8,11,5,'2016-08-09 20:06:47'),(80,17,11,15,10,10,11,5,'2016-08-09 20:06:51'),(81,18,7,20,18,7,7,5,'2016-08-09 20:07:16'),(82,18,21,26,16,26,16,5,'2016-08-09 20:07:19'),(83,18,13,14,9,9,14,5,'2016-08-09 20:07:22'),(84,18,15,19,7,7,19,5,'2016-08-09 20:07:29'),(85,18,19,18,23,23,23,5,'2016-08-09 20:07:32'),(86,19,14,7,13,7,7,5,'2016-08-09 20:07:51'),(87,19,18,6,21,6,6,5,'2016-08-09 20:07:54'),(88,19,12,10,21,10,10,5,'2016-08-09 20:07:57'),(89,19,13,10,19,10,10,5,'2016-08-09 20:08:04'),(90,19,15,6,19,6,19,5,'2016-08-09 20:08:07'),(91,20,16,15,6,6,6,5,'2016-08-09 20:08:20'),(92,20,20,22,21,22,22,5,'2016-08-09 20:08:24'),(93,20,15,14,8,8,8,5,'2016-08-09 20:08:29'),(94,20,8,14,12,8,14,5,'2016-08-09 20:08:32'),(95,20,21,25,15,25,15,5,'2016-08-09 20:08:35'),(96,21,19,22,17,22,17,5,'2016-08-09 20:08:57'),(97,21,21,11,25,25,11,5,'2016-08-09 20:09:00'),(98,21,7,11,17,7,11,5,'2016-08-09 20:09:03'),(99,21,20,11,24,24,11,5,'2016-08-09 20:09:05'),(100,21,20,14,8,8,14,5,'2016-08-09 20:09:08'),(101,22,14,19,10,10,10,5,'2016-08-09 20:09:20'),(102,22,24,13,15,24,13,5,'2016-08-09 20:09:23'),(103,22,6,17,11,6,6,5,'2016-08-09 20:09:26'),(104,22,13,22,20,22,20,5,'2016-08-09 20:09:29'),(105,22,16,23,21,23,23,5,'2016-08-09 20:09:33'),(106,23,12,13,7,7,7,5,'2016-08-09 20:09:44'),(107,23,9,21,19,9,9,5,'2016-08-09 20:09:47'),(108,23,17,25,15,25,25,5,'2016-08-09 20:09:51'),(109,23,13,12,7,7,7,5,'2016-08-09 20:09:54'),(110,23,20,6,18,6,6,5,'2016-08-09 20:09:57'),(111,24,15,11,6,6,6,5,'2016-08-16 23:52:46'),(112,24,19,21,25,25,25,5,'2016-08-16 23:52:49'),(113,24,26,21,13,26,26,5,'2016-08-16 23:52:53'),(114,24,7,14,11,7,7,5,'2016-08-16 23:52:56'),(115,24,26,12,17,26,26,5,'2016-08-16 23:53:00'),(116,25,24,16,21,24,24,5,'2016-08-23 17:04:31'),(117,25,18,10,19,10,10,5,'2016-08-23 17:04:34'),(118,25,8,19,21,8,8,5,'2016-08-23 17:04:40');
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
  `participant_id` int(11) DEFAULT NULL,
  `http_session` varchar(1024) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime DEFAULT NULL,
  `total_points` int(11) NOT NULL,
  `gamification_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_session_participant_participant_idx` (`participant_id`),
  KEY `IDX_4A491ADC6A33B9B3` (`gamification_type_id`),
  CONSTRAINT `FK_4A491ADC6A33B9B3` FOREIGN KEY (`gamification_type_id`) REFERENCES `gamification_type` (`id`),
  CONSTRAINT `fk_participant_session_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_session`
--

LOCK TABLES `participant_session` WRITE;
/*!40000 ALTER TABLE `participant_session` DISABLE KEYS */;
INSERT INTO `participant_session` VALUES (16,16,'4d0qn8ucnms9an6ssu6huukri2','2016-08-09 19:43:18','2016-08-09 19:45:10',25,1),(17,17,'4d0qn8ucnms9an6ssu6huukri2','2016-08-09 20:06:33','2016-08-09 20:06:51',25,2),(18,18,'4d0qn8ucnms9an6ssu6huukri2','2016-08-09 20:07:11','2016-08-09 20:07:32',25,1),(19,19,'4d0qn8ucnms9an6ssu6huukri2','2016-08-09 20:07:45','2016-08-09 20:08:07',25,1),(20,20,'4d0qn8ucnms9an6ssu6huukri2','2016-08-09 20:08:15','2016-08-09 20:08:35',25,1),(21,21,'4d0qn8ucnms9an6ssu6huukri2','2016-08-09 20:08:52','2016-08-09 20:09:09',25,2),(22,22,'4d0qn8ucnms9an6ssu6huukri2','2016-08-09 20:09:16','2016-08-09 20:09:33',25,2),(23,23,'4d0qn8ucnms9an6ssu6huukri2','2016-08-09 20:09:40','2016-08-09 20:09:57',25,2),(24,24,'4d0qn8ucnms9an6ssu6huukri2','2016-08-16 23:52:42','2016-08-16 23:53:00',25,1),(25,25,'4d0qn8ucnms9an6ssu6huukri2','2016-08-23 17:04:27',NULL,15,3);
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
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_task`
--

LOCK TABLES `training_task` WRITE;
/*!40000 ALTER TABLE `training_task` DISABLE KEYS */;
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

-- Dump completed on 2016-08-24  9:17:12
