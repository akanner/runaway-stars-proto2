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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_parameter`
--

LOCK TABLES `app_parameter` WRITE;
/*!40000 ALTER TABLE `app_parameter` DISABLE KEYS */;
INSERT INTO `app_parameter` VALUES (1,'MAX_QUESTIONS','10');
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
INSERT INTO `fos_user` VALUES (1,'admin','$2y$13$j9xuyx2bhcg8s00o4s488u5ZtLCrGvrI7Jc2KCxth2iWcqzVow3yC','admin','admin@admin','admin@admin',1,'j9xuyx2bhcg8s00o4s4880wcw000o40','2016-08-02 23:39:07',0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (6,'HIP2036.jpg',1),(7,'HIP22783.jpg',1),(8,'HIP32067.jpg',1),(9,'HIP34536.jpg',1),(10,'HIP82171.jpg',1),(11,'HIP398.jpg',0),(12,'HIP505.jpg',0),(13,'HIP14969.jpg',0),(14,'HIP14969.png',0),(15,'HIP29201.jpg',0),(16,'HIP48730.jpg',0),(17,'HIP61958.jpg',0),(18,'HIP92133.jpg',0),(19,'HIP99303.jpg',0),(20,'HIP110386.jpg',0),(21,'HIP114482.jpg',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
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
  CONSTRAINT `fk_participant_response_session` FOREIGN KEY (`session_id`) REFERENCES `participant_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image1` FOREIGN KEY (`first_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image2` FOREIGN KEY (`second_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image3` FOREIGN KEY (`third_image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image4` FOREIGN KEY (`correct_image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_image5` FOREIGN KEY (`selected_image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_response`
--

LOCK TABLES `participant_response` WRITE;
/*!40000 ALTER TABLE `participant_response` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_session`
--

LOCK TABLES `participant_session` WRITE;
/*!40000 ALTER TABLE `participant_session` DISABLE KEYS */;
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

-- Dump completed on 2016-08-02 23:48:05
