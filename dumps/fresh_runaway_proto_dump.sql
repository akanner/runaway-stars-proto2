-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: raway_db_dev
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
INSERT INTO `app_parameter` VALUES (1,'MAX_QUESTIONS','7'),(2,'CORRECT_ANSWER_TEXT','Respuesta correcta!'),(3,'INCORRECT_ANSWER_TEXT','Respuesta Incorrecta!'),(4,'LEVELS_BEGINNER_TEXT','Principiante'),(5,'LEVELS_BEGINNER_LEGEND','Ten&eacute;s que seguir practicando!'),(6,'LEVELS_INTERMEDIATE_TEXT','Intermedio'),(7,'LEVELS_INTERMEDIATE_LEGEND','Buen Trabajo...pero pod&eacute;s mejorar!'),(8,'LEVELS_EXPERT_TEXT','Experto'),(9,'LEVELS_EXPERT_LEGEND','Seguro qu&eacute; no sos un astr&oacute;nomo?'),(10,'BADGES_BEGINNER_LEGEND','Ganaste la insignia de principiante </br> &iquest;te anim&aacute;s a ganar la siguiente?'),(11,'BADGES_INTERMEDIATE_LEGEND','&iexcl;Buen Trabajo, ganaste la insignia intermedia! </br> Demostraste que ya pod&eacute;s identificar algunas runaway stars </br> ...pero todavia pod&eacute;s mejorar!'),(12,'BADGES_EXPERT_LEGEND','Ganaste la insignia de experto! </br> &iquest;Seguro qu&eacute; no sos un astr&oacute;nomo?'),(13,'BADGES_BEGINNER_BADGE','beginner_badge.png'),(14,'BADGES_INTERMEDIATE_BADGE','intermediate_badge.png'),(15,'BADGES_EXPERT_BADGE','expert_badge.png'),(16,'MINIMUM_PERCENTAGE_INTERMEDIATE_LEVEL','50'),(17,'MINIMUM_PERCENTAGE_EXPERT_LEVEL','80');
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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'bd433654-rgb.jpg',1,'marked/bd433654-rgb_m.jpg'),(2,'bd433654-w4-Cool-pow-99.5.jpg',1,NULL),(3,'bd433654-w4-Heat-pow-99.5.jpg',1,NULL),(4,'bd433654-w4-Hsv-pow-99.5.jpg',1,NULL),(5,'HIP101186-rgb.jpg',1,NULL),(6,'HIP101186-w4-Cool-pow-99.5.jpg',1,'marked/HIP101186-w4-Cool-pow-99.5_m.jpg'),(7,'HIP101186-w4-Heat-pow-99.5.jpg',1,NULL),(8,'HIP101186-w4-Hsv-pow-99.5.jpg',1,NULL),(9,'HIP114990-rgb.jpg',1,''),(10,'HIP114990-w4-Cool-pow-99.5.jpg',1,NULL),(11,'HIP114990-w4-Heat-pow-99.5.jpg',1,NULL),(12,'HIP114990-w4-Hsv-pow-99.5.jpg',1,NULL),(13,'HIP11891-rgb.jpg',1,NULL),(14,'HIP11891-w4-Cool-pow-99.5.jpg',1,NULL),(15,'HIP11891-w4-Heat-pow-99.5.jpg',1,'marked/HIP11891-w4-Heat-pow-99.5_m.jpg'),(16,'HIP11891-w4-Hsv-pow-99.5.jpg',1,NULL),(17,'HIP16518-rgb.jpg',1,NULL),(18,'HIP16518-w4-Cool-pow-99.5.jpg',1,NULL),(19,'HIP16518-w4-Heat-pow-99.5.jpg',1,NULL),(20,'HIP16518-w4-Hsv-pow-99.5.jpg',1,'marked/HIP16518-w4-Hsv-pow-99.5_m.jpg'),(21,'HIP2036-rgb.jpg',1,NULL),(22,'HIP2036-w4-Cool-pow-99.5.jpg',1,NULL),(23,'HIP2036-w4-Heat-pow-99.5.jpg',1,NULL),(24,'HIP2036-w4-Hsv-pow-99.5.jpg',1,NULL),(25,'HIP22783-rgb.jpg',1,NULL),(26,'HIP22783-w4-Cool-pow-99.5.jpg',1,NULL),(27,'HIP22783-w4-Heat-pow-99.5.jpg',1,NULL),(28,'HIP22783-w4-Hsv-pow-99.5.jpg',1,NULL),(29,'HIP24575-rgb.jpg',1,NULL),(30,'HIP24575-w4-Cool-pow-99.5.jpg',1,NULL),(31,'HIP24575-w4-Heat-pow-99.5.jpg',1,NULL),(32,'HIP24575-w4-Hsv-pow-99.5.jpg',1,NULL),(33,'HIP25923-rgb.jpg',1,NULL),(34,'HIP25923-w4-Cool-pow-99.5.jpg',1,NULL),(35,'HIP25923-w4-Heat-pow-99.5.jpg',1,NULL),(36,'HIP25923-w4-Hsv-pow-99.5.jpg',1,NULL),(37,'HIP2599-rgb.jpg',1,NULL),(38,'HIP2599-w4-Cool-pow-99.5.jpg',1,NULL),(39,'HIP2599-w4-Heat-pow-99.5.jpg',1,NULL),(40,'HIP2599-w4-Hsv-pow-99.5.jpg',1,NULL),(41,'HIP28881-rgb.jpg',1,NULL),(42,'HIP28881-w4-Cool-pow-99.5.jpg',1,NULL),(43,'HIP28881-w4-Heat-pow-99.5.jpg',1,NULL),(44,'HIP28881-w4-Hsv-pow-99.5.jpg',1,NULL),(45,'HIP29276-rgb.jpg',1,NULL),(46,'HIP29276-w4-Cool-pow-99.5.jpg',1,NULL),(47,'HIP29276-w4-Heat-pow-99.5.jpg',1,NULL),(48,'HIP29276-w4-Hsv-pow-99.5.jpg',1,NULL),(49,'HIP31766-rgb.jpg',1,NULL),(50,'HIP31766-w4-Cool-pow-99.5.jpg',1,NULL),(51,'HIP31766-w4-Heat-pow-99.5.jpg',1,NULL),(52,'HIP31766-w4-Hsv-pow-99.5.jpg',1,NULL),(53,'HIP32067-rgb.jpg',1,NULL),(54,'HIP32067-w4-Cool-pow-99.5.jpg',1,NULL),(55,'HIP32067-w4-Heat-pow-99.5.jpg',1,NULL),(56,'HIP32067-w4-Hsv-pow-99.5.jpg',1,NULL),(57,'HIP34536-rgb.jpg',1,NULL),(58,'HIP34536-w4-Cool-pow-99.5.jpg',1,NULL),(59,'HIP34536-w4-Heat-pow-99.5.jpg',1,NULL),(60,'HIP34536-w4-Hsv-pow-99.5.jpg',1,NULL),(61,'HIP38430-rgb.jpg',1,NULL),(62,'HIP38430-w4-Cool-pow-99.5.jpg',1,NULL),(63,'HIP38430-w4-Heat-pow-99.5.jpg',1,NULL),(64,'HIP38430-w4-Hsv-pow-99.5.jpg',1,NULL),(65,'HIP62322-rgb.jpg',1,NULL),(66,'HIP62322-w4-Cool-pow-99.5.jpg',1,NULL),(67,'HIP62322-w4-Heat-pow-99.5.jpg',1,NULL),(68,'HIP62322-w4-Hsv-pow-99.5.jpg',1,NULL),(69,'HIP72510-rgb.jpg',1,NULL),(70,'HIP72510-w4-Cool-pow-99.5.jpg',1,NULL),(71,'HIP72510-w4-Heat-pow-99.5.jpg',1,NULL),(72,'HIP72510-w4-Hsv-pow-99.5.jpg',1,NULL),(73,'HIP75095-rgb.jpg',1,NULL),(74,'HIP75095-w4-Cool-pow-99.5.jpg',1,NULL),(75,'HIP75095-w4-Heat-pow-99.5.jpg',1,NULL),(76,'HIP75095-w4-Hsv-pow-99.5.jpg',1,NULL),(77,'HIP77391-rgb.jpg',1,NULL),(78,'HIP77391-w4-Cool-pow-99.5.jpg',1,NULL),(79,'HIP77391-w4-Heat-pow-99.5.jpg',1,NULL),(80,'HIP77391-w4-Hsv-pow-99.5.jpg',1,NULL),(81,'HIP81377-rgb.jpg',1,NULL),(82,'HIP81377-w4-Cool-pow-99.5.jpg',1,NULL),(83,'HIP81377-w4-Heat-pow-99.5.jpg',1,NULL),(84,'HIP81377-w4-Hsv-pow-99.5.jpg',1,NULL),(85,'HIP88652-rgb.jpg',1,NULL),(86,'HIP88652-w4-Cool-pow-99.5.jpg',1,NULL),(87,'HIP88652-w4-Heat-pow-99.5.jpg',1,NULL),(88,'HIP88652-w4-Hsv-pow-99.5.jpg',1,NULL),(89,'HIP110386-rgb.jpg',0,NULL),(90,'HIP110386-w3-Cool-pow-99.5.jpg',0,NULL),(91,'HIP110386-w3-Heat-pow-99.5.jpg',0,NULL),(92,'HIP110386-w3-Hsv-pow-99.5.jpg',0,NULL),(93,'HIP110386-w4-Cool-pow-99.5.jpg',0,NULL),(94,'HIP110386-w4-Heat-pow-99.5.jpg',0,NULL),(95,'HIP110386-w4-Hsv-pow-99.5.jpg',0,NULL),(96,'HIP114482-rgb.jpg',0,NULL),(97,'HIP114482-w3-Cool-pow-99.5.jpg',0,NULL),(98,'HIP114482-w3-Heat-pow-99.5.jpg',0,NULL),(99,'HIP114482-w3-Hsv-pow-99.5.jpg',0,NULL),(100,'HIP114482-w4-Cool-pow-99.5.jpg',0,NULL),(101,'HIP114482-w4-Heat-pow-99.5.jpg',0,NULL),(102,'HIP114482-w4-Hsv-pow-99.5.jpg',0,NULL),(103,'HIP14969-rgb.jpg',0,NULL),(104,'HIP14969-w3-Cool-pow-99.5.jpg',0,NULL),(105,'HIP14969-w3-Heat-pow-99.5.jpg',0,NULL),(106,'HIP14969-w3-Hsv-pow-99.5.jpg',0,NULL),(107,'HIP14969-w4-Cool-pow-99.5.jpg',0,NULL),(108,'HIP14969-w4-Heat-pow-99.5.jpg',0,NULL),(109,'HIP14969-w4-Hsv-pow-99.5.jpg',0,NULL),(110,'HIP29201-rgb.jpg',0,NULL),(111,'HIP29201-w3-Cool-pow-99.5.jpg',0,NULL),(112,'HIP29201-w3-Heat-pow-99.5.jpg',0,NULL),(113,'HIP29201-w3-Hsv-pow-99.5.jpg',0,NULL),(114,'HIP29201-w4-Cool-pow-99.5.jpg',0,NULL),(115,'HIP29201-w4-Heat-pow-99.5.jpg',0,NULL),(116,'HIP29201-w4-Hsv-pow-99.5.jpg',0,NULL),(117,'HIP398-rgb.jpg',0,NULL),(118,'HIP398-w3-Cool-pow-99.5.jpg',0,NULL),(119,'HIP398-w3-Heat-pow-99.5.jpg',0,NULL),(120,'HIP398-w3-Hsv-pow-99.5.jpg',0,NULL),(121,'HIP398-w4-Cool-pow-99.5.jpg',0,NULL),(122,'HIP398-w4-Heat-pow-99.5.jpg',0,NULL),(123,'HIP398-w4-Hsv-pow-99.5.jpg',0,NULL),(124,'HIP48730-rgb.jpg',0,NULL),(125,'HIP48730-w3-Cool-pow-99.5.jpg',0,NULL),(126,'HIP48730-w3-Heat-pow-99.5.jpg',0,NULL),(127,'HIP48730-w3-Hsv-pow-99.5.jpg',0,NULL),(128,'HIP48730-w4-Cool-pow-99.5.jpg',0,NULL),(129,'HIP48730-w4-Heat-pow-99.5.jpg',0,NULL),(130,'HIP48730-w4-Hsv-pow-99.5.jpg',0,NULL),(131,'HIP505-rgb.jpg',0,NULL),(132,'HIP505-w3-Cool-pow-99.5.jpg',0,NULL),(133,'HIP505-w3-Heat-pow-99.5.jpg',0,NULL),(134,'HIP505-w3-Hsv-pow-99.5.jpg',0,NULL),(135,'HIP505-w4-Cool-pow-99.5.jpg',0,NULL),(136,'HIP505-w4-Heat-pow-99.5.jpg',0,NULL),(137,'HIP505-w4-Hsv-pow-99.5.jpg',0,NULL),(138,'HIP61958-rgb.jpg',0,NULL),(139,'HIP61958-w3-Cool-pow-99.5.jpg',0,NULL),(140,'HIP61958-w3-Heat-pow-99.5.jpg',0,NULL),(141,'HIP61958-w3-Hsv-pow-99.5.jpg',0,NULL),(142,'HIP61958-w4-Cool-pow-99.5.jpg',0,NULL),(143,'HIP61958-w4-Heat-pow-99.5.jpg',0,NULL),(144,'HIP61958-w4-Hsv-pow-99.5.jpg',0,NULL),(145,'HIP92133-rgb.jpg',0,NULL),(146,'HIP92133-w3-Cool-pow-99.5.jpg',0,NULL),(147,'HIP92133-w3-Heat-pow-99.5.jpg',0,NULL),(148,'HIP92133-w3-Hsv-pow-99.5.jpg',0,NULL),(149,'HIP92133-w4-Cool-pow-99.5.jpg',0,NULL),(150,'HIP92133-w4-Heat-pow-99.5.jpg',0,NULL),(151,'HIP92133-w4-Hsv-pow-99.5.jpg',0,NULL),(152,'HIP99303-rgb.jpg',0,NULL),(153,'HIP99303-w3-Cool-pow-99.5.jpg',0,NULL),(154,'HIP99303-w3-Heat-pow-99.5.jpg',0,NULL),(155,'HIP99303-w3-Hsv-pow-99.5.jpg',0,NULL),(156,'HIP99303-w4-Cool-pow-99.5.jpg',0,NULL),(157,'HIP99303-w4-Heat-pow-99.5.jpg',0,NULL),(158,'HIP99303-w4-Hsv-pow-99.5.jpg',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=big5;
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
  `image_served_id` int(11) DEFAULT NULL,
  `pointsEarned` int(11) DEFAULT NULL,
  `answered_at` datetime DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `training_task_id` int(11) DEFAULT NULL,
  `correct_answer` int(11) NOT NULL,
  `participant_answer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participant_response_image1_idx` (`image_served_id`),
  KEY `fk_participant_response_session_participant_idx` (`session_id`),
  KEY `fk_participant_response_training_task_idx` (`training_task_id`),
  CONSTRAINT `fk_participant_response_image1` FOREIGN KEY (`image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_session` FOREIGN KEY (`session_id`) REFERENCES `participant_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_training_task` FOREIGN KEY (`training_task_id`) REFERENCES `training_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=big5;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=big5;
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
  `image_served_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_training_task_image1_idx` (`image_served_id`),
  CONSTRAINT `fk_training_task_image1` FOREIGN KEY (`image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_task`
--

LOCK TABLES `training_task` WRITE;
/*!40000 ALTER TABLE `training_task` DISABLE KEYS */;
INSERT INTO `training_task` VALUES (1,1,'Es una runaway star',1),(2,2,'No es una runaway star',120),(3,3,'No es una runaway star',130),(4,4,'Es una runaway star',6),(5,5,'No es una runaway star',125),(6,6,'Es una runaway star',15),(7,7,'Es una runaway star',20);
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

-- Dump completed on 2017-03-14 22:05:10
