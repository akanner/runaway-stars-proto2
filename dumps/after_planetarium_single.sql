-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: raway_db
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'bd433654-rgb.jpg',1,'marked/bd433654-rgb_m.jpg'),(2,'bd433654-w4-Cool-pow-99.5.jpg',1,NULL),(3,'bd433654-w4-Heat-pow-99.5.jpg',1,NULL),(4,'bd433654-w4-Hsv-pow-99.5.jpg',1,NULL),(5,'HIP101186-rgb.jpg',1,NULL),(6,'HIP101186-w4-Cool-pow-99.5.jpg',1,'marked/HIP101186-w4-Cool-pow-99.5_m.jpg'),(7,'HIP101186-w4-Heat-pow-99.5.jpg',1,NULL),(8,'HIP101186-w4-Hsv-pow-99.5.jpg',1,NULL),(9,'HIP114990-rgb.jpg',1,''),(10,'HIP114990-w4-Cool-pow-99.5.jpg',1,NULL),(11,'HIP114990-w4-Heat-pow-99.5.jpg',1,NULL),(12,'HIP114990-w4-Hsv-pow-99.5.jpg',1,NULL),(13,'HIP11891-rgb.jpg',1,NULL),(14,'HIP11891-w4-Cool-pow-99.5.jpg',1,NULL),(15,'HIP11891-w4-Heat-pow-99.5.jpg',1,'marked/HIP11891-w4-Heat-pow-99.5_m.jpg'),(16,'HIP11891-w4-Hsv-pow-99.5.jpg',1,NULL),(17,'HIP16518-rgb.jpg',1,NULL),(18,'HIP16518-w4-Cool-pow-99.5.jpg',1,NULL),(19,'HIP16518-w4-Heat-pow-99.5.jpg',1,NULL),(20,'HIP16518-w4-Hsv-pow-99.5.jpg',1,'marked/HIP16518-w4-Hsv-pow-99.5_m.jpg'),(21,'HIP2036-rgb.jpg',1,NULL),(22,'HIP2036-w4-Cool-pow-99.5.jpg',1,NULL),(23,'HIP2036-w4-Heat-pow-99.5.jpg',1,NULL),(24,'HIP2036-w4-Hsv-pow-99.5.jpg',1,NULL),(25,'HIP22783-rgb.jpg',1,NULL),(26,'HIP22783-w4-Cool-pow-99.5.jpg',1,NULL),(27,'HIP22783-w4-Heat-pow-99.5.jpg',1,NULL),(28,'HIP22783-w4-Hsv-pow-99.5.jpg',1,NULL),(29,'HIP24575-rgb.jpg',1,NULL),(30,'HIP24575-w4-Cool-pow-99.5.jpg',1,NULL),(31,'HIP24575-w4-Heat-pow-99.5.jpg',1,NULL),(32,'HIP24575-w4-Hsv-pow-99.5.jpg',1,NULL),(33,'HIP25923-rgb.jpg',1,NULL),(34,'HIP25923-w4-Cool-pow-99.5.jpg',1,NULL),(35,'HIP25923-w4-Heat-pow-99.5.jpg',1,NULL),(36,'HIP25923-w4-Hsv-pow-99.5.jpg',1,NULL),(37,'HIP2599-rgb.jpg',1,NULL),(38,'HIP2599-w4-Cool-pow-99.5.jpg',1,NULL),(39,'HIP2599-w4-Heat-pow-99.5.jpg',1,NULL),(40,'HIP2599-w4-Hsv-pow-99.5.jpg',1,NULL),(41,'HIP28881-rgb.jpg',1,NULL),(42,'HIP28881-w4-Cool-pow-99.5.jpg',1,NULL),(43,'HIP28881-w4-Heat-pow-99.5.jpg',1,NULL),(44,'HIP28881-w4-Hsv-pow-99.5.jpg',1,NULL),(45,'HIP29276-rgb.jpg',1,NULL),(46,'HIP29276-w4-Cool-pow-99.5.jpg',1,NULL),(47,'HIP29276-w4-Heat-pow-99.5.jpg',1,NULL),(48,'HIP29276-w4-Hsv-pow-99.5.jpg',1,NULL),(49,'HIP31766-rgb.jpg',1,NULL),(50,'HIP31766-w4-Cool-pow-99.5.jpg',1,NULL),(51,'HIP31766-w4-Heat-pow-99.5.jpg',1,NULL),(52,'HIP31766-w4-Hsv-pow-99.5.jpg',1,NULL),(53,'HIP32067-rgb.jpg',1,NULL),(54,'HIP32067-w4-Cool-pow-99.5.jpg',1,NULL),(55,'HIP32067-w4-Heat-pow-99.5.jpg',1,NULL),(56,'HIP32067-w4-Hsv-pow-99.5.jpg',1,NULL),(57,'HIP34536-rgb.jpg',1,NULL),(58,'HIP34536-w4-Cool-pow-99.5.jpg',1,NULL),(59,'HIP34536-w4-Heat-pow-99.5.jpg',1,NULL),(60,'HIP34536-w4-Hsv-pow-99.5.jpg',1,NULL),(61,'HIP38430-rgb.jpg',1,NULL),(62,'HIP38430-w4-Cool-pow-99.5.jpg',1,NULL),(63,'HIP38430-w4-Heat-pow-99.5.jpg',1,NULL),(64,'HIP38430-w4-Hsv-pow-99.5.jpg',1,NULL),(65,'HIP62322-rgb.jpg',1,NULL),(66,'HIP62322-w4-Cool-pow-99.5.jpg',1,NULL),(67,'HIP62322-w4-Heat-pow-99.5.jpg',1,NULL),(68,'HIP62322-w4-Hsv-pow-99.5.jpg',1,NULL),(69,'HIP72510-rgb.jpg',1,NULL),(70,'HIP72510-w4-Cool-pow-99.5.jpg',1,NULL),(71,'HIP72510-w4-Heat-pow-99.5.jpg',1,NULL),(72,'HIP72510-w4-Hsv-pow-99.5.jpg',1,NULL),(73,'HIP75095-rgb.jpg',1,NULL),(74,'HIP75095-w4-Cool-pow-99.5.jpg',1,NULL),(75,'HIP75095-w4-Heat-pow-99.5.jpg',1,NULL),(76,'HIP75095-w4-Hsv-pow-99.5.jpg',1,NULL),(77,'HIP77391-rgb.jpg',1,NULL),(78,'HIP77391-w4-Cool-pow-99.5.jpg',1,NULL),(79,'HIP77391-w4-Heat-pow-99.5.jpg',1,NULL),(80,'HIP77391-w4-Hsv-pow-99.5.jpg',1,NULL),(81,'HIP81377-rgb.jpg',1,NULL),(82,'HIP81377-w4-Cool-pow-99.5.jpg',1,NULL),(83,'HIP81377-w4-Heat-pow-99.5.jpg',1,NULL),(84,'HIP81377-w4-Hsv-pow-99.5.jpg',1,NULL),(85,'HIP88652-rgb.jpg',1,NULL),(86,'HIP88652-w4-Cool-pow-99.5.jpg',1,NULL),(87,'HIP88652-w4-Heat-pow-99.5.jpg',1,NULL),(88,'HIP88652-w4-Hsv-pow-99.5.jpg',1,NULL),(89,'HIP110386-rgb.jpg',0,NULL),(90,'HIP110386-w3-Cool-pow-99.5.jpg',0,NULL),(91,'HIP110386-w3-Heat-pow-99.5.jpg',0,NULL),(92,'HIP110386-w3-Hsv-pow-99.5.jpg',0,NULL),(93,'HIP110386-w4-Cool-pow-99.5.jpg',0,NULL),(94,'HIP110386-w4-Heat-pow-99.5.jpg',0,NULL),(95,'HIP110386-w4-Hsv-pow-99.5.jpg',0,NULL),(96,'HIP114482-rgb.jpg',0,NULL),(97,'HIP114482-w3-Cool-pow-99.5.jpg',0,NULL),(98,'HIP114482-w3-Heat-pow-99.5.jpg',0,NULL),(99,'HIP114482-w3-Hsv-pow-99.5.jpg',0,NULL),(100,'HIP114482-w4-Cool-pow-99.5.jpg',0,NULL),(101,'HIP114482-w4-Heat-pow-99.5.jpg',0,NULL),(102,'HIP114482-w4-Hsv-pow-99.5.jpg',0,NULL),(103,'HIP14969-rgb.jpg',0,NULL),(104,'HIP14969-w3-Cool-pow-99.5.jpg',0,NULL),(105,'HIP14969-w3-Heat-pow-99.5.jpg',0,NULL),(106,'HIP14969-w3-Hsv-pow-99.5.jpg',0,NULL),(107,'HIP14969-w4-Cool-pow-99.5.jpg',0,NULL),(108,'HIP14969-w4-Heat-pow-99.5.jpg',0,NULL),(109,'HIP14969-w4-Hsv-pow-99.5.jpg',0,NULL),(110,'HIP29201-rgb.jpg',0,NULL),(111,'HIP29201-w3-Cool-pow-99.5.jpg',0,NULL),(112,'HIP29201-w3-Heat-pow-99.5.jpg',0,NULL),(113,'HIP29201-w3-Hsv-pow-99.5.jpg',0,NULL),(114,'HIP29201-w4-Cool-pow-99.5.jpg',0,NULL),(115,'HIP29201-w4-Heat-pow-99.5.jpg',0,NULL),(116,'HIP29201-w4-Hsv-pow-99.5.jpg',0,NULL),(117,'HIP398-rgb.jpg',0,NULL),(118,'HIP398-w3-Cool-pow-99.5.jpg',0,NULL),(119,'HIP398-w3-Heat-pow-99.5.jpg',0,NULL),(120,'HIP398-w3-Hsv-pow-99.5.jpg',0,NULL),(121,'HIP398-w4-Cool-pow-99.5.jpg',0,NULL),(122,'HIP398-w4-Heat-pow-99.5.jpg',0,NULL),(123,'HIP398-w4-Hsv-pow-99.5.jpg',0,NULL),(124,'HIP48730-rgb.jpg',0,NULL),(125,'HIP48730-w3-Cool-pow-99.5.jpg',0,NULL),(126,'HIP48730-w3-Heat-pow-99.5.jpg',0,NULL),(127,'HIP48730-w3-Hsv-pow-99.5.jpg',0,NULL),(128,'HIP48730-w4-Cool-pow-99.5.jpg',0,NULL),(129,'HIP48730-w4-Heat-pow-99.5.jpg',0,NULL),(130,'HIP48730-w4-Hsv-pow-99.5.jpg',0,NULL),(131,'HIP505-rgb.jpg',0,NULL),(132,'HIP505-w3-Cool-pow-99.5.jpg',0,NULL),(133,'HIP505-w3-Heat-pow-99.5.jpg',0,NULL),(134,'HIP505-w3-Hsv-pow-99.5.jpg',0,NULL),(135,'HIP505-w4-Cool-pow-99.5.jpg',0,NULL),(136,'HIP505-w4-Heat-pow-99.5.jpg',0,NULL),(137,'HIP505-w4-Hsv-pow-99.5.jpg',0,NULL),(138,'HIP61958-rgb.jpg',0,NULL),(139,'HIP61958-w3-Cool-pow-99.5.jpg',0,NULL),(140,'HIP61958-w3-Heat-pow-99.5.jpg',0,NULL),(141,'HIP61958-w3-Hsv-pow-99.5.jpg',0,NULL),(142,'HIP61958-w4-Cool-pow-99.5.jpg',0,NULL),(143,'HIP61958-w4-Heat-pow-99.5.jpg',0,NULL),(144,'HIP61958-w4-Hsv-pow-99.5.jpg',0,NULL),(145,'HIP92133-rgb.jpg',0,NULL),(146,'HIP92133-w3-Cool-pow-99.5.jpg',0,NULL),(147,'HIP92133-w3-Heat-pow-99.5.jpg',0,NULL),(148,'HIP92133-w3-Hsv-pow-99.5.jpg',0,NULL),(149,'HIP92133-w4-Cool-pow-99.5.jpg',0,NULL),(150,'HIP92133-w4-Heat-pow-99.5.jpg',0,NULL),(151,'HIP92133-w4-Hsv-pow-99.5.jpg',0,NULL),(152,'HIP99303-rgb.jpg',0,NULL),(153,'HIP99303-w3-Cool-pow-99.5.jpg',0,NULL),(154,'HIP99303-w3-Heat-pow-99.5.jpg',0,NULL),(155,'HIP99303-w3-Hsv-pow-99.5.jpg',0,NULL),(156,'HIP99303-w4-Cool-pow-99.5.jpg',0,NULL),(157,'HIP99303-w4-Heat-pow-99.5.jpg',0,NULL),(158,'HIP99303-w4-Hsv-pow-99.5.jpg',0,NULL),(159,'HIP11792-rgb.jpg',0,NULL),(160,'HIP11792-w3-Cool-pow-99.5.jpg',0,NULL),(161,'HIP11792-w3-Heat-pow-99.5.jpg',0,NULL),(162,'HIP11792-w3-Hsv-pow-99.5.jpg',0,NULL),(163,'HIP11792-w4-Cool-pow-99.5.jpg',0,NULL),(164,'HIP11792-w4-Heat-pow-99.5.jpg',0,NULL),(165,'HIP11792-w4-Hsv-pow-99.5.jpg',0,NULL),(166,'HIP26064-rgb.jpg',0,NULL),(167,'HIP26064-w3-Cool-pow-99.5.jpg',0,NULL),(168,'HIP26064-w3-Heat-pow-99.5.jpg',0,NULL),(169,'HIP26064-w3-Hsv-pow-99.5.jpg',0,NULL),(170,'HIP26064-w4-Cool-pow-99.5.jpg',0,NULL),(171,'HIP26064-w4-Heat-pow-99.5.jpg',0,NULL),(172,'HIP26064-w4-Hsv-pow-99.5.jpg',0,NULL),(173,'HIP3013-rgb.jpg',0,NULL),(174,'HIP3013-w3-Cool-pow-99.5.jpg',0,NULL),(175,'HIP3013-w3-Heat-pow-99.5.jpg',0,NULL),(176,'HIP3013-w3-Hsv-pow-99.5.jpg',0,NULL),(177,'HIP3013-w4-Cool-pow-99.5.jpg',0,NULL),(178,'HIP3013-w4-Heat-pow-99.5.jpg',0,NULL),(179,'HIP3013-w4-Hsv-pow-99.5.jpg',0,NULL),(180,'HIP31878-rgb.jpg',0,NULL),(181,'HIP31878-w3-Cool-pow-99.5.jpg',0,NULL),(182,'HIP31878-w3-Heat-pow-99.5.jpg',0,NULL),(183,'HIP31878-w3-Hsv-pow-99.5.jpg',0,NULL),(184,'HIP31878-w4-Cool-pow-99.5.jpg',0,NULL),(185,'HIP31878-w4-Heat-pow-99.5.jpg',0,NULL),(186,'HIP31878-w4-Hsv-pow-99.5.jpg',0,NULL),(187,'HIP4532-rgb.jpg',0,NULL),(188,'HIP4532-w3-Cool-pow-99.5.jpg',0,NULL),(189,'HIP4532-w3-Heat-pow-99.5.jpg',0,NULL),(190,'HIP4532-w3-Hsv-pow-99.5.jpg',0,NULL),(191,'HIP4532-w4-Cool-pow-99.5.jpg',0,NULL),(192,'HIP4532-w4-Heat-pow-99.5.jpg',0,NULL),(193,'HIP4532-w4-Hsv-pow-99.5.jpg',0,NULL),(194,'HIP48715-rgb.jpg',0,NULL),(195,'HIP48715-w3-Cool-pow-99.5.jpg',0,NULL),(196,'HIP48715-w3-Heat-pow-99.5.jpg',0,NULL),(197,'HIP48715-w3-Hsv-pow-99.5.jpg',0,NULL),(198,'HIP48715-w4-Cool-pow-99.5.jpg',0,NULL),(199,'HIP48715-w4-Heat-pow-99.5.jpg',0,NULL),(200,'HIP48715-w4-Hsv-pow-99.5.jpg',0,NULL),(201,'HIP52849-rgb.jpg',0,NULL),(202,'HIP52849-w3-Cool-pow-99.5.jpg',0,NULL),(203,'HIP52849-w3-Heat-pow-99.5.jpg',0,NULL),(204,'HIP52849-w3-Hsv-pow-99.5.jpg',0,NULL),(205,'HIP52849-w4-Cool-pow-99.5.jpg',0,NULL),(206,'HIP52849-w4-Heat-pow-99.5.jpg',0,NULL),(207,'HIP52849-w4-Hsv-pow-99.5.jpg',0,NULL),(208,'HIP70877-rgb.jpg',0,NULL),(209,'HIP70877-w3-Cool-pow-99.5.jpg',0,NULL),(210,'HIP70877-w3-Heat-pow-99.5.jpg',0,NULL),(211,'HIP70877-w3-Hsv-pow-99.5.jpg',0,NULL),(212,'HIP70877-w4-Cool-pow-99.5.jpg',0,NULL),(213,'HIP70877-w4-Heat-pow-99.5.jpg',0,NULL),(214,'HIP70877-w4-Hsv-pow-99.5.jpg',0,NULL),(215,'HIP81100-rgb.jpg',0,NULL),(216,'HIP81100-w3-Cool-pow-99.5.jpg',0,NULL),(217,'HIP81100-w3-Heat-pow-99.5.jpg',0,NULL),(218,'HIP81100-w3-Hsv-pow-99.5.jpg',0,NULL),(219,'HIP81100-w4-Cool-pow-99.5.jpg',0,NULL),(220,'HIP81100-w4-Heat-pow-99.5.jpg',0,NULL),(221,'HIP81100-w4-Hsv-pow-99.5.jpg',0,NULL),(222,'HIP85885-rgb.jpg',0,NULL),(223,'HIP85885-w3-Cool-pow-99.5.jpg',0,NULL),(224,'HIP85885-w3-Heat-pow-99.5.jpg',0,NULL),(225,'HIP85885-w3-Hsv-pow-99.5.jpg',0,NULL),(226,'HIP85885-w4-Cool-pow-99.5.jpg',0,NULL),(227,'HIP85885-w4-Heat-pow-99.5.jpg',0,NULL),(228,'HIP85885-w4-Hsv-pow-99.5.jpg',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (2,'usuario1',37,'Ingeniero Informatico',NULL),(3,'usuario3',33,'Docente Universitario',NULL),(4,'6',34,'Docencia',NULL),(5,'Monica',37,'Docente',NULL),(6,'usuari11',39,'Profesor',NULL),(7,'usuario13',39,'Docente Universitario',NULL),(8,'usuario13',39,'Docente Universitario',NULL),(9,'usuario15',37,'ing en computacion',NULL),(10,'17',42,'Docente Universitario',NULL),(11,'usuario5',0,'',NULL),(12,'usuario18',23,'trabajador',NULL),(13,'usuiario21',37,'ama de casa',NULL),(14,'usuario23',16,'estudiante',NULL),(15,'usuario25',44,'astronomo ',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_response`
--

LOCK TABLES `participant_response` WRITE;
/*!40000 ALTER TABLE `participant_response` DISABLE KEYS */;
INSERT INTO `participant_response` VALUES (9,2,1,10,'2017-03-30 09:34:59','training',1,1,1),(10,2,120,10,'2017-03-30 09:35:05','training',2,0,0),(11,2,130,0,'2017-03-30 09:35:22','training',3,0,2),(12,2,6,0,'2017-03-30 09:35:31','training',4,1,0),(13,2,125,10,'2017-03-30 09:35:39','training',5,0,0),(14,2,15,10,'2017-03-30 09:35:49','training',6,1,1),(15,2,20,10,'2017-03-30 09:35:58','training',7,1,1),(16,3,1,10,'2017-03-30 09:36:48','training',1,1,1),(17,3,120,10,'2017-03-30 09:36:54','training',2,0,0),(18,3,130,10,'2017-03-30 09:37:02','training',3,0,0),(19,3,6,10,'2017-03-30 09:37:09','training',4,1,1),(20,3,125,10,'2017-03-30 09:37:14','training',5,0,0),(21,3,15,10,'2017-03-30 09:37:19','training',6,1,1),(22,3,20,10,'2017-03-30 09:37:24','training',7,1,1),(23,3,150,NULL,'2017-03-30 09:38:06','real',NULL,0,1),(24,3,225,NULL,'2017-03-30 09:38:11','real',NULL,0,0),(25,3,30,NULL,'2017-03-30 09:38:15','real',NULL,1,1),(26,3,90,NULL,'2017-03-30 09:38:18','real',NULL,0,0),(27,3,189,NULL,'2017-03-30 09:38:23','real',NULL,0,0),(28,3,45,NULL,'2017-03-30 09:38:32','real',NULL,1,1),(29,3,120,NULL,'2017-03-30 09:38:35','real',NULL,0,0),(30,3,134,NULL,'2017-03-30 09:38:38','real',NULL,0,0),(31,3,204,NULL,'2017-03-30 09:38:43','real',NULL,0,0),(32,3,202,NULL,'2017-03-30 09:38:46','real',NULL,0,0),(33,3,56,NULL,'2017-03-30 09:38:50','real',NULL,1,1),(34,3,98,NULL,'2017-03-30 09:38:55','real',NULL,0,0),(35,3,95,NULL,'2017-03-30 09:38:59','real',NULL,0,0),(36,3,45,NULL,'2017-03-30 09:39:03','real',NULL,1,1),(37,3,141,NULL,'2017-03-30 09:39:08','real',NULL,0,0),(38,3,7,NULL,'2017-03-30 09:39:12','real',NULL,1,1),(39,3,118,NULL,'2017-03-30 09:39:16','real',NULL,0,0),(40,3,188,NULL,'2017-03-30 09:39:20','real',NULL,0,0),(41,3,125,NULL,'2017-03-30 09:39:23','real',NULL,0,0),(42,3,96,NULL,'2017-03-30 09:39:30','real',NULL,0,2),(43,3,48,NULL,'2017-03-30 09:39:35','real',NULL,1,2),(44,4,1,10,'2017-03-30 10:04:18','training',1,1,1),(45,4,120,10,'2017-03-30 10:04:40','training',2,0,0),(46,4,130,0,'2017-03-30 10:04:52','training',3,0,1),(47,4,6,10,'2017-03-30 10:05:05','training',4,1,2),(48,4,125,10,'2017-03-30 10:05:30','training',5,0,0),(49,4,15,10,'2017-03-30 10:05:38','training',6,1,1),(50,4,20,0,'2017-03-30 10:05:49','training',7,1,0),(51,5,1,10,'2017-03-30 10:06:30','training',1,1,1),(52,5,120,10,'2017-03-30 10:06:44','training',2,0,0),(53,5,130,10,'2017-03-30 10:06:55','training',3,0,0),(54,5,6,10,'2017-03-30 10:07:03','training',4,1,1),(55,5,125,10,'2017-03-30 10:07:12','training',5,0,0),(56,5,15,10,'2017-03-30 10:07:19','training',6,1,1),(57,5,20,10,'2017-03-30 10:07:31','training',7,1,2),(58,5,146,NULL,'2017-03-30 10:08:07','real',NULL,0,0),(59,5,222,NULL,'2017-03-30 10:08:15','real',NULL,0,2),(60,5,100,NULL,'2017-03-30 10:08:23','real',NULL,0,1),(61,5,21,NULL,'2017-03-30 10:08:28','real',NULL,1,1),(62,5,100,NULL,'2017-03-30 10:08:34','real',NULL,0,0),(63,5,99,NULL,'2017-03-30 10:08:40','real',NULL,0,0),(64,5,98,NULL,'2017-03-30 10:08:46','real',NULL,0,0),(65,5,129,NULL,'2017-03-30 10:08:54','real',NULL,0,0),(66,5,51,NULL,'2017-03-30 10:08:59','real',NULL,1,1),(67,5,11,NULL,'2017-03-30 10:09:04','real',NULL,1,0),(68,5,35,NULL,'2017-03-30 10:09:11','real',NULL,1,1),(69,5,84,NULL,'2017-03-30 10:09:16','real',NULL,1,0),(70,5,28,NULL,'2017-03-30 10:09:24','real',NULL,1,0),(71,5,91,NULL,'2017-03-30 10:09:28','real',NULL,0,0),(72,5,86,NULL,'2017-03-30 10:09:33','real',NULL,1,1),(73,5,31,NULL,'2017-03-30 10:09:36','real',NULL,1,1),(74,5,11,NULL,'2017-03-30 10:09:40','real',NULL,1,0),(75,5,149,NULL,'2017-03-30 10:09:44','real',NULL,0,0),(76,5,94,NULL,'2017-03-30 10:09:48','real',NULL,0,0),(77,5,189,NULL,'2017-03-30 10:09:54','real',NULL,0,1),(78,5,79,NULL,'2017-03-30 10:10:00','real',NULL,1,2),(79,5,97,NULL,'2017-03-30 10:10:04','real',NULL,0,0),(80,5,166,NULL,'2017-03-30 10:10:10','real',NULL,0,0),(81,5,68,NULL,'2017-03-30 10:10:13','real',NULL,1,0),(82,13,15,0,'2017-03-30 11:33:56','training',6,1,0),(83,13,111,NULL,'2017-03-30 11:35:08','real',NULL,0,1),(84,13,181,NULL,'2017-03-30 11:35:21','real',NULL,0,1),(85,13,60,NULL,'2017-03-30 11:35:25','real',NULL,1,0),(86,13,149,NULL,'2017-03-30 11:35:33','real',NULL,0,1),(87,13,163,NULL,'2017-03-30 11:35:37','real',NULL,0,0),(88,13,214,NULL,'2017-03-30 11:35:42','real',NULL,0,0),(89,13,40,NULL,'2017-03-30 11:35:56','real',NULL,1,1),(90,13,228,NULL,'2017-03-30 11:36:05','real',NULL,0,0),(91,13,218,NULL,'2017-03-30 11:36:12','real',NULL,0,0),(92,13,194,NULL,'2017-03-30 11:36:21','real',NULL,0,1),(93,13,168,NULL,'2017-03-30 11:36:26','real',NULL,0,1),(94,13,195,NULL,'2017-03-30 11:36:34','real',NULL,0,1),(95,13,21,NULL,'2017-03-30 11:36:39','real',NULL,1,1),(96,13,184,NULL,'2017-03-30 11:36:46','real',NULL,0,0),(97,13,55,NULL,'2017-03-30 11:36:54','real',NULL,1,0),(98,13,80,NULL,'2017-03-30 11:36:59','real',NULL,1,0),(99,13,203,NULL,'2017-03-30 11:37:08','real',NULL,0,0),(100,13,186,NULL,'2017-03-30 11:37:11','real',NULL,0,1),(101,13,104,NULL,'2017-03-30 11:37:16','real',NULL,0,1),(102,13,112,NULL,'2017-03-30 11:37:24','real',NULL,0,0),(103,13,115,NULL,'2017-03-30 11:37:29','real',NULL,0,1),(104,13,15,NULL,'2017-03-30 11:37:36','real',NULL,1,0),(105,13,13,NULL,'2017-03-30 11:37:40','real',NULL,1,1),(106,13,215,NULL,'2017-03-30 11:37:45','real',NULL,0,1),(107,13,73,NULL,'2017-03-30 11:37:50','real',NULL,1,0),(108,13,196,NULL,'2017-03-30 11:37:56','real',NULL,0,1),(109,13,124,NULL,'2017-03-30 11:38:08','real',NULL,0,1),(110,13,201,NULL,'2017-03-30 11:38:11','real',NULL,0,1),(111,13,138,NULL,'2017-03-30 11:38:15','real',NULL,0,0),(112,13,78,NULL,'2017-03-30 11:38:21','real',NULL,1,0),(113,13,65,NULL,'2017-03-30 11:38:24','real',NULL,1,1),(114,13,154,NULL,'2017-03-30 11:38:33','real',NULL,0,1),(115,13,121,NULL,'2017-03-30 11:38:39','real',NULL,0,1),(116,13,222,NULL,'2017-03-30 11:38:44','real',NULL,0,0),(117,13,4,NULL,'2017-03-30 11:38:49','real',NULL,1,0),(118,13,52,NULL,'2017-03-30 11:38:55','real',NULL,1,0),(119,13,75,NULL,'2017-03-30 11:38:59','real',NULL,1,0),(120,13,92,NULL,'2017-03-30 11:39:02','real',NULL,0,0),(121,13,214,NULL,'2017-03-30 11:39:06','real',NULL,0,0),(122,13,71,NULL,'2017-03-30 11:39:09','real',NULL,1,0),(123,13,52,NULL,'2017-03-30 11:39:14','real',NULL,1,0),(124,6,1,10,'2017-03-30 11:51:02','training',1,1,1),(125,6,120,10,'2017-03-30 11:51:12','training',2,0,0),(126,6,130,10,'2017-03-30 11:51:21','training',3,0,0),(127,6,6,0,'2017-03-30 11:51:30','training',4,1,0),(128,6,125,10,'2017-03-30 11:51:35','training',5,0,0),(129,6,15,10,'2017-03-30 11:51:43','training',6,1,1),(130,6,20,0,'2017-03-30 11:51:50','training',7,1,0),(131,6,112,NULL,'2017-03-30 11:52:30','real',NULL,0,0),(132,6,89,NULL,'2017-03-30 11:52:38','real',NULL,0,0),(133,6,50,NULL,'2017-03-30 11:52:42','real',NULL,1,1),(134,6,142,NULL,'2017-03-30 11:52:46','real',NULL,0,0),(135,6,163,NULL,'2017-03-30 11:52:53','real',NULL,0,0),(136,6,133,NULL,'2017-03-30 11:52:58','real',NULL,0,0),(137,6,83,NULL,'2017-03-30 11:53:01','real',NULL,1,1),(138,6,31,NULL,'2017-03-30 11:53:06','real',NULL,1,1),(139,6,198,NULL,'2017-03-30 11:53:11','real',NULL,0,0),(140,6,106,NULL,'2017-03-30 11:53:15','real',NULL,0,0),(141,6,145,NULL,'2017-03-30 11:53:18','real',NULL,0,0),(142,6,14,NULL,'2017-03-30 11:53:21','real',NULL,1,1),(143,6,6,NULL,'2017-03-30 11:53:26','real',NULL,1,1),(144,6,203,NULL,'2017-03-30 11:53:30','real',NULL,0,0),(145,6,92,NULL,'2017-03-30 11:53:35','real',NULL,0,0),(146,6,59,NULL,'2017-03-30 11:53:42','real',NULL,1,0),(147,6,63,NULL,'2017-03-30 11:53:46','real',NULL,1,0),(148,6,211,NULL,'2017-03-30 11:53:50','real',NULL,0,0),(149,6,188,NULL,'2017-03-30 11:53:54','real',NULL,0,0),(150,6,173,NULL,'2017-03-30 11:53:58','real',NULL,0,0),(151,6,183,NULL,'2017-03-30 11:54:02','real',NULL,0,0),(152,6,143,NULL,'2017-03-30 11:54:06','real',NULL,0,0),(153,6,217,NULL,'2017-03-30 11:54:12','real',NULL,0,0),(154,6,86,NULL,'2017-03-30 11:54:16','real',NULL,1,1),(155,6,10,NULL,'2017-03-30 11:54:19','real',NULL,1,0),(156,6,131,NULL,'2017-03-30 11:54:22','real',NULL,0,0),(157,6,78,NULL,'2017-03-30 11:54:25','real',NULL,1,1),(158,6,175,NULL,'2017-03-30 11:54:31','real',NULL,0,0),(159,6,34,NULL,'2017-03-30 11:54:36','real',NULL,1,0),(160,6,53,NULL,'2017-03-30 11:54:41','real',NULL,1,1),(161,6,12,NULL,'2017-03-30 11:54:45','real',NULL,1,0),(162,6,185,NULL,'2017-03-30 11:54:48','real',NULL,0,0),(163,6,96,NULL,'2017-03-30 11:54:51','real',NULL,0,0),(164,6,198,NULL,'2017-03-30 11:54:55','real',NULL,0,0),(165,6,199,NULL,'2017-03-30 11:54:58','real',NULL,0,0),(166,6,177,NULL,'2017-03-30 11:55:03','real',NULL,0,0),(167,6,191,NULL,'2017-03-30 11:55:06','real',NULL,0,0),(168,6,103,NULL,'2017-03-30 11:55:09','real',NULL,0,0),(169,6,100,NULL,'2017-03-30 11:55:13','real',NULL,0,0),(170,6,195,NULL,'2017-03-30 11:55:15','real',NULL,0,0),(171,6,1,NULL,'2017-03-30 11:55:18','real',NULL,1,1),(172,6,22,NULL,'2017-03-30 11:55:25','real',NULL,1,1),(173,6,86,NULL,'2017-03-30 11:55:27','real',NULL,1,1),(174,6,228,NULL,'2017-03-30 11:55:30','real',NULL,0,0),(175,6,5,NULL,'2017-03-30 11:55:34','real',NULL,1,1),(176,6,44,NULL,'2017-03-30 11:55:39','real',NULL,1,0),(177,6,134,NULL,'2017-03-30 11:55:42','real',NULL,0,0),(178,6,130,NULL,'2017-03-30 11:55:44','real',NULL,0,0),(179,6,51,NULL,'2017-03-30 11:55:47','real',NULL,1,1),(180,6,48,NULL,'2017-03-30 11:55:50','real',NULL,1,0),(181,6,188,NULL,'2017-03-30 11:55:53','real',NULL,0,0),(182,6,149,NULL,'2017-03-30 11:55:55','real',NULL,0,0),(183,6,161,NULL,'2017-03-30 11:55:58','real',NULL,0,0),(184,6,210,NULL,'2017-03-30 11:56:01','real',NULL,0,0),(185,6,194,NULL,'2017-03-30 11:56:04','real',NULL,0,0),(186,6,29,NULL,'2017-03-30 11:56:07','real',NULL,1,1),(187,6,96,NULL,'2017-03-30 11:56:10','real',NULL,0,0),(188,6,60,NULL,'2017-03-30 11:56:12','real',NULL,1,0),(189,6,67,NULL,'2017-03-30 11:56:17','real',NULL,1,0),(190,6,84,NULL,'2017-03-30 11:56:22','real',NULL,1,0),(191,6,126,NULL,'2017-03-30 11:56:24','real',NULL,0,0),(192,7,1,0,'2017-03-30 12:06:50','training',1,1,0),(193,7,120,10,'2017-03-30 12:07:05','training',2,0,0),(194,7,130,10,'2017-03-30 12:07:17','training',3,0,0),(195,7,6,0,'2017-03-30 12:07:28','training',4,1,0),(196,7,125,10,'2017-03-30 12:07:40','training',5,0,0),(197,7,15,10,'2017-03-30 12:07:57','training',6,1,1),(198,7,20,10,'2017-03-30 12:08:04','training',7,1,1),(199,7,113,NULL,'2017-03-30 12:09:25','real',NULL,0,0),(200,7,92,NULL,'2017-03-30 12:09:34','real',NULL,0,1),(201,7,40,NULL,'2017-03-30 12:09:43','real',NULL,1,1),(202,7,64,NULL,'2017-03-30 12:09:46','real',NULL,1,1),(203,7,12,NULL,'2017-03-30 12:09:52','real',NULL,1,0),(204,7,64,NULL,'2017-03-30 12:09:57','real',NULL,1,1),(205,7,48,NULL,'2017-03-30 12:10:03','real',NULL,1,1),(206,7,66,NULL,'2017-03-30 12:10:12','real',NULL,1,1),(207,7,57,NULL,'2017-03-30 12:10:17','real',NULL,1,0),(208,7,181,NULL,'2017-03-30 12:10:40','real',NULL,0,0),(209,7,174,NULL,'2017-03-30 12:10:47','real',NULL,0,0),(210,7,136,NULL,'2017-03-30 12:10:51','real',NULL,0,1),(211,7,81,NULL,'2017-03-30 12:11:03','real',NULL,1,0),(212,7,184,NULL,'2017-03-30 12:11:13','real',NULL,0,1),(213,7,152,NULL,'2017-03-30 12:11:28','real',NULL,0,1),(214,7,22,NULL,'2017-03-30 12:11:32','real',NULL,1,1),(215,7,190,NULL,'2017-03-30 12:11:36','real',NULL,0,0),(216,7,200,NULL,'2017-03-30 12:11:45','real',NULL,0,1),(217,8,1,0,'2017-03-31 10:34:35','training',1,1,0),(218,8,120,0,'2017-03-31 10:34:44','training',2,0,1),(219,8,130,10,'2017-03-31 10:34:51','training',3,0,0),(220,8,6,10,'2017-03-31 10:34:59','training',4,1,2),(221,8,125,10,'2017-03-31 10:35:06','training',5,0,0),(222,8,15,0,'2017-03-31 10:35:14','training',6,1,0),(223,8,20,10,'2017-03-31 10:35:18','training',7,1,2),(224,8,34,NULL,'2017-03-31 10:36:13','real',NULL,1,0),(225,8,141,NULL,'2017-03-31 10:36:19','real',NULL,0,2),(226,9,1,10,'2017-03-31 11:37:57','training',1,1,1),(227,9,120,10,'2017-03-31 11:38:05','training',2,0,0),(228,9,130,0,'2017-03-31 11:38:21','training',3,0,1),(229,9,6,0,'2017-03-31 11:38:33','training',4,1,0),(230,9,125,10,'2017-03-31 11:38:40','training',5,0,0),(231,9,15,0,'2017-03-31 11:38:47','training',6,1,0),(232,9,20,10,'2017-03-31 11:38:58','training',7,1,1),(233,10,1,10,'2017-03-31 11:41:57','training',1,1,1),(234,10,120,10,'2017-03-31 11:42:06','training',2,0,0),(235,10,130,0,'2017-03-31 11:42:13','training',3,0,1),(236,10,6,10,'2017-03-31 11:42:16','training',4,1,1),(237,10,125,10,'2017-03-31 11:42:19','training',5,0,0),(238,10,15,10,'2017-03-31 11:42:23','training',6,1,1),(239,10,20,10,'2017-03-31 11:42:26','training',7,1,1),(240,11,1,0,'2017-03-31 12:11:34','training',1,1,0),(241,11,120,0,'2017-03-31 12:11:41','training',2,0,1),(242,11,130,0,'2017-03-31 12:11:46','training',3,0,1),(243,11,6,0,'2017-03-31 12:11:53','training',4,1,0),(244,11,125,10,'2017-03-31 12:11:58','training',5,0,0),(245,11,15,10,'2017-03-31 12:12:03','training',6,1,1),(246,11,20,10,'2017-03-31 12:12:09','training',7,1,1),(247,11,83,NULL,'2017-03-31 12:12:35','real',NULL,1,1),(248,11,1,NULL,'2017-03-31 12:12:40','real',NULL,1,0),(249,11,124,NULL,'2017-03-31 12:12:45','real',NULL,0,0),(250,11,224,NULL,'2017-03-31 12:12:49','real',NULL,0,0),(251,11,150,NULL,'2017-03-31 12:12:52','real',NULL,0,0),(252,11,124,NULL,'2017-03-31 12:12:55','real',NULL,0,1),(253,11,120,NULL,'2017-03-31 12:12:58','real',NULL,0,0),(254,11,145,NULL,'2017-03-31 12:13:01','real',NULL,0,1),(255,11,95,NULL,'2017-03-31 12:13:04','real',NULL,0,1),(256,11,208,NULL,'2017-03-31 12:13:07','real',NULL,0,1),(257,11,106,NULL,'2017-03-31 12:13:10','real',NULL,0,1),(258,11,33,NULL,'2017-03-31 12:13:12','real',NULL,1,1),(259,12,1,10,'2017-03-31 12:45:27','training',1,1,1),(260,12,120,0,'2017-03-31 12:45:42','training',2,0,2),(261,12,130,10,'2017-03-31 12:45:54','training',3,0,0),(262,12,6,10,'2017-03-31 12:46:08','training',4,1,1),(263,12,125,10,'2017-03-31 12:46:34','training',5,0,0),(264,12,15,0,'2017-03-31 12:46:48','training',6,1,0),(265,12,20,0,'2017-03-31 12:47:01','training',7,1,0),(266,12,92,NULL,'2017-03-31 12:48:42','real',NULL,0,0),(267,12,54,NULL,'2017-03-31 12:48:47','real',NULL,1,0),(268,12,196,NULL,'2017-03-31 12:48:55','real',NULL,0,0),(269,12,71,NULL,'2017-03-31 12:49:01','real',NULL,1,0),(270,12,138,NULL,'2017-03-31 12:49:06','real',NULL,0,1),(271,12,52,NULL,'2017-03-31 12:49:14','real',NULL,1,1),(272,12,45,NULL,'2017-03-31 12:49:22','real',NULL,1,1),(273,14,1,0,'2017-05-21 17:11:43','training',1,1,0),(274,14,120,0,'2017-05-21 17:11:54','training',2,0,1),(275,14,130,0,'2017-05-21 17:12:05','training',3,0,1),(276,14,6,10,'2017-05-21 17:12:10','training',4,1,1),(277,14,125,10,'2017-05-21 17:12:17','training',5,0,0),(278,14,15,10,'2017-05-21 17:12:24','training',6,1,1),(279,14,20,0,'2017-05-21 17:12:35','training',7,1,0),(280,14,128,NULL,'2017-05-21 17:13:38','real',NULL,0,2),(281,14,224,NULL,'2017-05-21 17:13:44','real',NULL,0,0),(282,14,57,NULL,'2017-05-21 17:13:50','real',NULL,1,1),(283,14,61,NULL,'2017-05-21 17:13:54','real',NULL,1,1),(284,14,18,NULL,'2017-05-21 17:14:10','real',NULL,1,1),(285,14,224,NULL,'2017-05-21 17:14:20','real',NULL,0,0),(286,14,57,NULL,'2017-05-21 17:14:24','real',NULL,1,1),(287,14,164,NULL,'2017-05-21 17:14:33','real',NULL,0,2),(288,14,171,NULL,'2017-05-21 17:14:38','real',NULL,0,2),(289,14,43,NULL,'2017-05-21 17:14:42','real',NULL,1,1),(290,14,16,NULL,'2017-05-21 17:14:46','real',NULL,1,1),(291,14,114,NULL,'2017-05-21 17:14:52','real',NULL,0,0),(292,14,228,NULL,'2017-05-21 17:14:59','real',NULL,0,0),(293,14,137,NULL,'2017-05-21 17:15:08','real',NULL,0,2),(294,14,203,NULL,'2017-05-21 17:15:20','real',NULL,0,0),(295,14,188,NULL,'2017-05-21 17:15:33','real',NULL,0,0),(296,14,1,NULL,'2017-05-21 17:15:39','real',NULL,1,1),(297,15,1,10,'2017-05-21 17:44:35','training',1,1,1),(298,15,120,10,'2017-05-21 17:44:43','training',2,0,0),(299,15,130,10,'2017-05-21 17:44:51','training',3,0,0),(300,15,6,10,'2017-05-21 17:45:00','training',4,1,1),(301,15,125,10,'2017-05-21 17:45:07','training',5,0,0),(302,15,15,0,'2017-05-21 17:45:15','training',6,1,0),(303,15,20,10,'2017-05-21 17:45:27','training',7,1,1),(304,15,16,NULL,'2017-05-21 17:46:53','real',NULL,1,1),(305,15,23,NULL,'2017-05-21 17:46:58','real',NULL,1,1),(306,15,101,NULL,'2017-05-21 17:47:09','real',NULL,0,0),(307,15,77,NULL,'2017-05-21 17:47:15','real',NULL,1,0),(308,15,45,NULL,'2017-05-21 17:47:19','real',NULL,1,1),(309,15,153,NULL,'2017-05-21 17:47:24','real',NULL,0,0),(310,15,180,NULL,'2017-05-21 17:47:27','real',NULL,0,1),(311,15,136,NULL,'2017-05-21 17:47:37','real',NULL,0,1),(312,15,58,NULL,'2017-05-21 17:47:43','real',NULL,1,0),(313,15,203,NULL,'2017-05-21 17:47:49','real',NULL,0,0),(314,15,159,NULL,'2017-05-21 17:47:53','real',NULL,0,1),(315,15,87,NULL,'2017-05-21 17:48:01','real',NULL,1,1),(316,15,94,NULL,'2017-05-21 17:48:06','real',NULL,0,0),(317,15,225,NULL,'2017-05-21 17:48:10','real',NULL,0,0),(318,15,157,NULL,'2017-05-21 17:48:15','real',NULL,0,0),(319,15,97,NULL,'2017-05-21 17:48:21','real',NULL,0,0),(320,15,52,NULL,'2017-05-21 17:48:26','real',NULL,1,1),(321,15,128,NULL,'2017-05-21 17:48:39','real',NULL,0,0),(322,15,76,NULL,'2017-05-21 17:48:47','real',NULL,1,0),(323,16,1,10,'2017-05-21 18:32:11','training',1,1,1),(324,16,120,10,'2017-05-21 18:32:21','training',2,0,0),(325,16,130,10,'2017-05-21 18:32:34','training',3,0,0),(326,16,6,0,'2017-05-21 18:32:49','training',4,1,0),(327,16,125,0,'2017-05-21 18:32:59','training',5,0,2),(328,16,15,10,'2017-05-21 18:33:07','training',6,1,1),(329,16,20,0,'2017-05-21 18:33:13','training',7,1,0),(330,16,19,NULL,'2017-05-21 18:34:13','real',NULL,1,1),(331,16,150,NULL,'2017-05-21 18:34:23','real',NULL,0,0),(332,16,9,NULL,'2017-05-21 18:34:38','real',NULL,1,2),(333,16,148,NULL,'2017-05-21 18:34:43','real',NULL,0,0),(334,16,146,NULL,'2017-05-21 18:34:50','real',NULL,0,1),(335,16,223,NULL,'2017-05-21 18:35:05','real',NULL,0,0),(336,16,128,NULL,'2017-05-21 18:35:12','real',NULL,0,1),(337,16,174,NULL,'2017-05-21 18:35:18','real',NULL,0,1),(338,16,226,NULL,'2017-05-21 18:35:34','real',NULL,0,2),(339,16,23,NULL,'2017-05-21 18:35:39','real',NULL,1,0),(340,16,101,NULL,'2017-05-21 18:35:46','real',NULL,0,1),(341,17,1,10,'2017-05-21 19:11:03','training',1,1,1),(342,17,120,10,'2017-05-21 19:11:10','training',2,0,0),(343,17,130,10,'2017-05-21 19:11:18','training',3,0,0),(344,17,6,10,'2017-05-21 19:11:24','training',4,1,1),(345,17,125,10,'2017-05-21 19:11:29','training',5,0,0),(346,17,15,10,'2017-05-21 19:11:34','training',6,1,1),(347,17,20,10,'2017-05-21 19:11:42','training',7,1,1),(348,17,11,NULL,'2017-05-21 19:12:18','real',NULL,1,0),(349,17,108,NULL,'2017-05-21 19:12:23','real',NULL,0,0),(350,17,20,NULL,'2017-05-21 19:12:27','real',NULL,1,1),(351,17,144,NULL,'2017-05-21 19:12:30','real',NULL,0,0),(352,17,44,NULL,'2017-05-21 19:12:33','real',NULL,1,1),(353,17,81,NULL,'2017-05-21 19:12:36','real',NULL,1,1),(354,17,150,NULL,'2017-05-21 19:12:39','real',NULL,0,0),(355,17,43,NULL,'2017-05-21 19:12:42','real',NULL,1,1),(356,17,42,NULL,'2017-05-21 19:12:44','real',NULL,1,1),(357,17,81,NULL,'2017-05-21 19:12:47','real',NULL,1,1),(358,17,127,NULL,'2017-05-21 19:12:50','real',NULL,0,0),(359,17,171,NULL,'2017-05-21 19:12:53','real',NULL,0,0),(360,17,99,NULL,'2017-05-21 19:12:56','real',NULL,0,0),(361,17,120,NULL,'2017-05-21 19:12:59','real',NULL,0,0),(362,17,17,NULL,'2017-05-21 19:13:03','real',NULL,1,0),(363,17,127,NULL,'2017-05-21 19:13:06','real',NULL,0,0),(364,17,158,NULL,'2017-05-21 19:13:10','real',NULL,0,1),(365,17,151,NULL,'2017-05-21 19:13:13','real',NULL,0,0),(366,17,188,NULL,'2017-05-21 19:13:18','real',NULL,0,0),(367,17,210,NULL,'2017-05-21 19:13:21','real',NULL,0,0),(368,17,1,NULL,'2017-05-21 19:13:24','real',NULL,1,1),(369,17,208,NULL,'2017-05-21 19:13:27','real',NULL,0,0),(370,17,144,NULL,'2017-05-21 19:13:30','real',NULL,0,0),(371,17,42,NULL,'2017-05-21 19:13:33','real',NULL,1,1),(372,17,91,NULL,'2017-05-21 19:13:35','real',NULL,0,0),(373,17,183,NULL,'2017-05-21 19:13:38','real',NULL,0,0),(374,17,150,NULL,'2017-05-21 19:13:42','real',NULL,0,0),(375,17,17,NULL,'2017-05-21 19:13:46','real',NULL,1,0),(376,17,143,NULL,'2017-05-21 19:13:48','real',NULL,0,0),(377,17,195,NULL,'2017-05-21 19:13:54','real',NULL,0,0),(378,17,23,NULL,'2017-05-21 19:13:57','real',NULL,1,1),(379,17,18,NULL,'2017-05-21 19:14:00','real',NULL,1,1),(380,17,21,NULL,'2017-05-21 19:14:03','real',NULL,1,1),(381,17,132,NULL,'2017-05-21 19:14:06','real',NULL,0,0),(382,17,97,NULL,'2017-05-21 19:14:09','real',NULL,0,0),(383,17,81,NULL,'2017-05-21 19:14:12','real',NULL,1,1),(384,17,171,NULL,'2017-05-21 19:14:15','real',NULL,0,0),(385,17,113,NULL,'2017-05-21 19:14:25','real',NULL,0,0),(386,17,26,NULL,'2017-05-21 19:14:28','real',NULL,1,1),(387,17,89,NULL,'2017-05-21 19:14:32','real',NULL,0,0),(388,17,43,NULL,'2017-05-21 19:14:35','real',NULL,1,1),(389,17,77,NULL,'2017-05-21 19:14:42','real',NULL,1,1),(390,17,123,NULL,'2017-05-21 19:14:50','real',NULL,0,0),(391,17,217,NULL,'2017-05-21 19:15:06','real',NULL,0,0),(392,17,215,NULL,'2017-05-21 19:15:12','real',NULL,0,0),(393,17,171,NULL,'2017-05-21 19:15:16','real',NULL,0,0),(394,17,200,NULL,'2017-05-21 19:15:26','real',NULL,0,0),(395,17,71,NULL,'2017-05-21 19:15:29','real',NULL,1,1),(396,17,43,NULL,'2017-05-21 19:15:33','real',NULL,1,1),(397,17,31,NULL,'2017-05-21 19:15:36','real',NULL,1,1),(398,17,72,NULL,'2017-05-21 19:15:39','real',NULL,1,1),(399,17,35,NULL,'2017-05-21 19:15:42','real',NULL,1,1),(400,17,90,NULL,'2017-05-21 19:15:45','real',NULL,0,0),(401,17,2,NULL,'2017-05-21 19:15:48','real',NULL,1,1),(402,17,27,NULL,'2017-05-21 19:15:52','real',NULL,1,1),(403,17,143,NULL,'2017-05-21 19:16:02','real',NULL,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_session`
--

LOCK TABLES `participant_session` WRITE;
/*!40000 ALTER TABLE `participant_session` DISABLE KEYS */;
INSERT INTO `participant_session` VALUES (2,2,'pj5rsl21sdg197n1a6ickpm172','2017-03-30 09:32:21',NULL,50,1,100,6,3),(3,2,'pj5rsl21sdg197n1a6ickpm172','2017-03-30 09:36:40','2017-03-30 11:39:20',70,1,100,3,NULL),(4,3,'pj5rsl21sdg197n1a6ickpm172','2017-03-30 10:01:19',NULL,50,1,66.6667,6,5),(5,3,'pj5rsl21sdg197n1a6ickpm172','2017-03-30 10:06:20','2017-03-30 10:10:15',70,1,100,8,NULL),(6,4,'pj5rsl21sdg197n1a6ickpm172','2017-03-30 11:48:39','2017-03-30 11:56:31',50,4,60,8,NULL),(7,5,'pj5rsl21sdg197n1a6ickpm172','2017-03-30 12:02:52','2017-03-30 12:11:51',50,4,66.6667,5,NULL),(8,6,'o9t3002vnvdidgf43nem0pbo41','2017-03-31 10:31:47','2017-03-31 10:36:28',40,1,14.2857,3,NULL),(9,7,'3iqf3usp8vhj3tslmf94v0apt5','2017-03-31 11:32:44','2017-03-31 11:40:25',40,1,25,8,NULL),(10,8,'3iqf3usp8vhj3tslmf94v0apt5','2017-03-31 11:41:23','2017-03-31 11:49:23',60,4,77.7778,8,NULL),(11,9,'4l9tn5mag0sao9e5v0gfrnkmi2','2017-03-31 12:09:23',NULL,30,4,10,4,NULL),(12,10,'bi1teq5dlg761pvcuq2jscnv65','2017-03-31 12:38:16','2017-03-31 12:49:26',40,1,36.3636,1,NULL),(13,11,'555','2017-03-30 11:30:00','2017-03-30 11:45:00',NULL,4,50,5,NULL),(14,12,'qtq5lp797mj9k5disa4432abe4','2017-05-21 17:07:00','2017-05-21 17:15:43',30,1,23.0769,6,NULL),(15,13,'qtq5lp797mj9k5disa4432abe4','2017-05-21 17:39:38','2017-05-21 17:48:50',60,1,85.7143,8,NULL),(16,14,'qtq5lp797mj9k5disa4432abe4','2017-05-21 18:28:03','2017-05-21 18:35:50',40,1,46.6667,2,NULL),(17,15,'pv2847uu0mdj24d9dcj8eufeg0','2017-05-21 19:08:50','2017-05-21 19:16:05',70,4,100,5,NULL);
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

-- Dump completed on 2017-07-04 19:03:18
