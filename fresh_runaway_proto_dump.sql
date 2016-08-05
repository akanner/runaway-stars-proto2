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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_parameter`
--

LOCK TABLES `app_parameter` WRITE;
/*!40000 ALTER TABLE `app_parameter` DISABLE KEYS */;
INSERT INTO `app_parameter` VALUES (1,'MAX_QUESTIONS','5'),(2,'CORRECT_ANSWER_TEXT','Felicitaciones! tu respuesta es correcta.'),(3,'INCORRECT_ANSWER_TEXT','Respuesta Incorrecta!'),(4,'LEVELS_BEGINNER_TEXT','Principiante'),(5,'LEVELS_BEGINNER_LEGEND','Ten&eacute;s que seguir practicando!'),(6,'LEVELS_INTERMEDIATE_TEXT','Intermedio'),(7,'LEVELS_INTERMEDIATE_LEGEND','Buen Trabajo...pero pod&eacute;s mejorar!'),(8,'LEVELS_EXPERT_TEXT','Experto'),(9,'LEVELS_EXPERT_LEGEND','Seguro qu&eacute; no sos un astr&oacute;nomo?'),(10,'BADGES_BEGINNER_LEGEND','Ganaste la insignia de principiante, &iquest;te anim&aacute;s a ganar la siguiente?'),(11,'BADGES_INTERMEDIATE_LEGEND','&iexcl;Buen Trabajo, ganaste la insignia intermedia! demostraste que ya pod&eacute;s identificar algunas runaway stars...pero todavia pod&eacute;s mejorar!'),(12,'BADGES_EXPERT_LEGEND','Ganaste la insignia de experto! &iquest;Seguro qu&eacute; no sos un astr&oacute;nomo?'),(13,'BADGES_BEGINNER_BADGE','gb1.jpg'),(14,'BADGES_INTERMEDIATE_BADGE','gb2.jpg'),(15,'BADGES_EXPERT_BADGE','gb3.jpg');
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
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(255) NOT NULL,
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
INSERT INTO `fos_user` VALUES (1,'admin','$2y$13$j9xuyx2bhcg8s00o4s488u5ZtLCrGvrI7Jc2KCxth2iWcqzVow3yC','admin','admin@admin','admin@admin',1,'j9xuyx2bhcg8s00o4s4880wcw000o40','2016-08-04 22:49:22',0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (47,'agustin',23,'aa'),(48,'agustin',23,'aaa'),(49,'agustin',25,'aa'),(50,'agustin',24,'aa');
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
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_response`
--

LOCK TABLES `participant_response` WRITE;
/*!40000 ALTER TABLE `participant_response` DISABLE KEYS */;
INSERT INTO `participant_response` VALUES (190,47,17,22,13,22,22,5),(191,47,8,13,16,8,8,5),(192,47,11,6,20,6,6,5),(193,47,13,10,14,10,10,5),(194,47,8,12,17,8,8,5),(195,48,17,16,26,26,26,5),(196,48,16,26,15,26,26,5),(197,48,11,25,20,25,25,5),(198,48,20,21,24,24,24,5),(199,48,11,10,19,10,10,5),(200,49,21,12,10,10,10,5),(201,49,12,11,6,6,6,5),(202,49,9,11,18,9,9,5),(203,49,15,21,25,25,25,5),(204,49,16,25,15,25,25,5),(205,50,13,14,24,24,24,5),(206,50,17,26,18,26,26,5),(207,50,17,25,21,25,25,5),(208,50,18,16,6,6,18,5),(209,50,17,22,19,22,17,5);
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
  PRIMARY KEY (`id`),
  KEY `fk_session_participant_participant_idx` (`participant_id`),
  CONSTRAINT `fk_participant_session_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_session`
--

LOCK TABLES `participant_session` WRITE;
/*!40000 ALTER TABLE `participant_session` DISABLE KEYS */;
INSERT INTO `participant_session` VALUES (47,47,'k1iof46ulj8av4lvu0f4snq005','2016-08-04 23:03:25','2016-08-04 23:03:52',25),(48,48,'k1iof46ulj8av4lvu0f4snq005','2016-08-04 23:05:20','2016-08-04 23:05:40',25),(49,49,'k1iof46ulj8av4lvu0f4snq005','2016-08-04 23:06:29','2016-08-04 23:08:06',25),(50,50,'k1iof46ulj8av4lvu0f4snq005','2016-08-04 23:09:07','2016-08-04 23:09:25',25);
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

-- Dump completed on 2016-08-04 23:11:41
