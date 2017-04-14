-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: raway_db_multi
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
  `is_correct` tinyint(4) NOT NULL,
  `marked_heat_image_path` varchar(255) DEFAULT NULL,
  `marked_hsv_image_path` varchar(255) DEFAULT NULL,
  `cool_image_path` varchar(255) NOT NULL,
  `rgb_image_path` varchar(255) NOT NULL,
  `heat_image_path` varchar(255) NOT NULL,
  `hsv_image_path` varchar(255) NOT NULL,
  `marked_cool_image_path` varchar(255) DEFAULT NULL,
  `marked_rgb_image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (229,0,NULL,NULL,'HIP505-w4-Cool-pow-99.5.jpg','HIP505-rgb.jpg','HIP505-w4-Heat-pow-99.5.jpg','HIP505-w4-Hsv-pow-99.5.jpg',NULL,NULL),(230,0,NULL,NULL,'HIP14969-w4-Cool-pow-99.5.jpg','HIP14969-rgb.jpg','HIP14969-w4-Heat-pow-99.5.jpg','HIP14969-w4-Hsv-pow-99.5.jpg',NULL,NULL),(231,0,NULL,NULL,'HIP29201-w4-Cool-pow-99.5.jpg','HIP29201-rgb.jpg','HIP29201-w4-Heat-pow-99.5.jpg','HIP29201-w4-Hsv-pow-99.5.jpg',NULL,NULL),(232,0,NULL,NULL,'HIP92133-w4-Cool-pow-99.5.jpg','HIP92133-rgb.jpg','HIP92133-w4-Heat-pow-99.5.jpg','HIP92133-w4-Hsv-pow-99.5.jpg',NULL,NULL),(233,0,NULL,NULL,'HIP398-w4-Cool-pow-99.5.jpg','HIP398-rgb.jpg','HIP398-w4-Heat-pow-99.5.jpg','HIP398-w4-Hsv-pow-99.5.jpg',NULL,NULL),(234,0,NULL,NULL,'HIP14969-w4-Cool-pow-99.5.jpg','HIP14969-rgb.jpg','HIP14969-w4-Heat-pow-99.5.jpg','HIP14969-w4-Hsv-pow-99.5.jpg',NULL,NULL),(235,0,NULL,NULL,'HIP29201-w4-Cool-pow-99.5.jpg','HIP29201-rgb.jpg','HIP29201-w4-Heat-pow-99.5.jpg','HIP29201-w4-Hsv-pow-99.5.jpg',NULL,NULL),(236,0,NULL,NULL,'HIP48730-w4-Cool-pow-99.5.jpg','HIP48730-rgb.jpg','HIP48730-w4-Heat-pow-99.5.jpg','HIP48730-w4-Hsv-pow-99.5.jpg',NULL,NULL),(237,0,NULL,NULL,'HIP61958-w4-Cool-pow-99.5.jpg','HIP61958-rgb.jpg','HIP61958-w4-Heat-pow-99.5.jpg','HIP61958-w4-Hsv-pow-99.5.jpg',NULL,NULL),(238,0,NULL,NULL,'HIP99303-w4-Cool-pow-99.5.jpg','HIP99303-rgb.jpg','HIP99303-w4-Heat-pow-99.5.jpg','HIP99303-w4-Hsv-pow-99.5.jpg',NULL,NULL),(239,0,NULL,NULL,'HIP110386-w4-Cool-pow-99.5.jpg','HIP110386-rgb.jpg','HIP110386-w4-Heat-pow-99.5.jpg','HIP110386-w4-Hsv-pow-99.5.jpg',NULL,NULL),(240,0,NULL,NULL,'HIP114482-w4-Cool-pow-99.5.jpg','HIP114482-rgb.jpg','HIP114482-w4-Heat-pow-99.5.jpg','HIP114482-w4-Hsv-pow-99.5.jpg',NULL,NULL),(241,0,NULL,NULL,'HIP3013-w4-Cool-pow-99.5.jpg','HIP3013-rgb.jpg','HIP3013-w4-Heat-pow-99.5.jpg','HIP3013-w4-Hsv-pow-99.5.jpg',NULL,NULL),(242,0,NULL,NULL,'HIP4532-w4-Cool-pow-99.5.jpg','HIP4532-rgb.jpg','HIP4532-w4-Heat-pow-99.5.jpg','HIP4532-w4-Hsv-pow-99.5.jpg',NULL,NULL),(243,0,NULL,NULL,'HIP11792-w4-Cool-pow-99.5.jpg','HIP11792-rgb.jpg','HIP11792-w4-Heat-pow-99.5.jpg','HIP11792-w4-Hsv-pow-99.5.jpg',NULL,NULL),(244,0,NULL,NULL,'HIP26064-w4-Cool-pow-99.5.jpg','HIP26064-rgb.jpg','HIP26064-w4-Heat-pow-99.5.jpg','HIP26064-w4-Hsv-pow-99.5.jpg',NULL,NULL),(245,0,NULL,NULL,'HIP31878-w4-Cool-pow-99.5.jpg','HIP31878-rgb.jpg','HIP31878-w4-Heat-pow-99.5.jpg','HIP31878-w4-Hsv-pow-99.5.jpg',NULL,NULL),(246,0,NULL,NULL,'HIP48715-w4-Cool-pow-99.5.jpg','HIP48715-rgb.jpg','HIP48715-w4-Heat-pow-99.5.jpg','HIP48715-w4-Hsv-pow-99.5.jpg',NULL,NULL),(247,0,NULL,NULL,'HIP52849-w4-Cool-pow-99.5.jpg','HIP52849-rgb.jpg','HIP52849-w4-Heat-pow-99.5.jpg','HIP52849-w4-Hsv-pow-99.5.jpg',NULL,NULL),(248,0,NULL,NULL,'HIP70877-w4-Cool-pow-99.5.jpg','HIP70877-rgb.jpg','HIP70877-w4-Heat-pow-99.5.jpg','HIP70877-w4-Hsv-pow-99.5.jpg',NULL,NULL),(249,0,NULL,NULL,'HIP81100-w4-Cool-pow-99.5.jpg','HIP81100-rgb.jpg','HIP81100-w4-Heat-pow-99.5.jpg','HIP81100-w4-Hsv-pow-99.5.jpg',NULL,NULL),(250,0,NULL,NULL,'HIP85885-w4-Cool-pow-99.5.jpg','HIP85885-rgb.jpg','HIP85885-w4-Heat-pow-99.5.jpg','HIP85885-w4-Hsv-pow-99.5.jpg',NULL,NULL),(251,0,NULL,NULL,'HIP505-w3-Cool-pow-99.5.jpg','HIP505-rgb.jpg','HIP505-w3-Heat-pow-99.5.jpg','HIP505-w3-Hsv-pow-99.5.jpg',NULL,NULL),(252,0,NULL,NULL,'HIP14969-w3-Cool-pow-99.5.jpg','HIP14969-rgb.jpg','HIP14969-w3-Heat-pow-99.5.jpg','HIP14969-w3-Hsv-pow-99.5.jpg',NULL,NULL),(253,0,NULL,NULL,'HIP29201-w3-Cool-pow-99.5.jpg','HIP29201-rgb.jpg','HIP29201-w3-Heat-pow-99.5.jpg','HIP29201-w3-Hsv-pow-99.5.jpg',NULL,NULL),(254,0,NULL,NULL,'HIP92133-w3-Cool-pow-99.5.jpg','HIP92133-rgb.jpg','HIP92133-w3-Heat-pow-99.5.jpg','HIP92133-w3-Hsv-pow-99.5.jpg',NULL,NULL),(255,0,NULL,NULL,'HIP398-w3-Cool-pow-99.5.jpg','HIP398-rgb.jpg','HIP398-w3-Heat-pow-99.5.jpg','HIP398-w3-Hsv-pow-99.5.jpg',NULL,NULL),(256,0,NULL,NULL,'HIP14969-w3-Cool-pow-99.5.jpg','HIP14969-rgb.jpg','HIP14969-w3-Heat-pow-99.5.jpg','HIP14969-w3-Hsv-pow-99.5.jpg',NULL,NULL),(257,0,NULL,NULL,'HIP29201-w3-Cool-pow-99.5.jpg','HIP29201-rgb.jpg','HIP29201-w3-Heat-pow-99.5.jpg','HIP29201-w3-Hsv-pow-99.5.jpg',NULL,NULL),(258,0,NULL,NULL,'HIP48730-w3-Cool-pow-99.5.jpg','HIP48730-rgb.jpg','HIP48730-w3-Heat-pow-99.5.jpg','HIP48730-w3-Hsv-pow-99.5.jpg',NULL,NULL),(259,0,NULL,NULL,'HIP61958-w3-Cool-pow-99.5.jpg','HIP61958-rgb.jpg','HIP61958-w3-Heat-pow-99.5.jpg','HIP61958-w3-Hsv-pow-99.5.jpg',NULL,NULL),(260,0,NULL,NULL,'HIP99303-w3-Cool-pow-99.5.jpg','HIP99303-rgb.jpg','HIP99303-w3-Heat-pow-99.5.jpg','HIP99303-w3-Hsv-pow-99.5.jpg',NULL,NULL),(261,0,NULL,NULL,'HIP110386-w3-Cool-pow-99.5.jpg','HIP110386-rgb.jpg','HIP110386-w3-Heat-pow-99.5.jpg','HIP110386-w3-Hsv-pow-99.5.jpg',NULL,NULL),(262,0,NULL,NULL,'HIP114482-w3-Cool-pow-99.5.jpg','HIP114482-rgb.jpg','HIP114482-w3-Heat-pow-99.5.jpg','HIP114482-w3-Hsv-pow-99.5.jpg',NULL,NULL),(263,0,NULL,NULL,'HIP3013-w3-Cool-pow-99.5.jpg','HIP3013-rgb.jpg','HIP3013-w3-Heat-pow-99.5.jpg','HIP3013-w3-Hsv-pow-99.5.jpg',NULL,NULL),(264,0,NULL,NULL,'HIP4532-w3-Cool-pow-99.5.jpg','HIP4532-rgb.jpg','HIP4532-w3-Heat-pow-99.5.jpg','HIP4532-w3-Hsv-pow-99.5.jpg',NULL,NULL),(265,0,NULL,NULL,'HIP11792-w3-Cool-pow-99.5.jpg','HIP11792-rgb.jpg','HIP11792-w3-Heat-pow-99.5.jpg','HIP11792-w3-Hsv-pow-99.5.jpg',NULL,NULL),(266,0,NULL,NULL,'HIP26064-w3-Cool-pow-99.5.jpg','HIP26064-rgb.jpg','HIP26064-w3-Heat-pow-99.5.jpg','HIP26064-w3-Hsv-pow-99.5.jpg',NULL,NULL),(267,0,NULL,NULL,'HIP31878-w3-Cool-pow-99.5.jpg','HIP31878-rgb.jpg','HIP31878-w3-Heat-pow-99.5.jpg','HIP31878-w3-Hsv-pow-99.5.jpg',NULL,NULL),(268,0,NULL,NULL,'HIP48715-w3-Cool-pow-99.5.jpg','HIP48715-rgb.jpg','HIP48715-w3-Heat-pow-99.5.jpg','HIP48715-w3-Hsv-pow-99.5.jpg',NULL,NULL),(269,0,NULL,NULL,'HIP52849-w3-Cool-pow-99.5.jpg','HIP52849-rgb.jpg','HIP52849-w3-Heat-pow-99.5.jpg','HIP52849-w3-Hsv-pow-99.5.jpg',NULL,NULL),(270,0,NULL,NULL,'HIP70877-w3-Cool-pow-99.5.jpg','HIP70877-rgb.jpg','HIP70877-w3-Heat-pow-99.5.jpg','HIP70877-w3-Hsv-pow-99.5.jpg',NULL,NULL),(271,0,NULL,NULL,'HIP81100-w3-Cool-pow-99.5.jpg','HIP81100-rgb.jpg','HIP81100-w3-Heat-pow-99.5.jpg','HIP81100-w3-Hsv-pow-99.5.jpg',NULL,NULL),(272,0,NULL,NULL,'HIP85885-w3-Cool-pow-99.5.jpg','HIP85885-rgb.jpg','HIP85885-w3-Heat-pow-99.5.jpg','HIP85885-w3-Hsv-pow-99.5.jpg',NULL,NULL),(273,1,NULL,NULL,'HIP2036-w4-Cool-pow-99.5.jpg','HIP2036-rgb.jpg','HIP2036-w4-Heat-pow-99.5.jpg','HIP2036-w4-Hsv-pow-99.5.jpg',NULL,NULL),(274,1,NULL,NULL,'HIP2599-w4-Cool-pow-99.5.jpg','HIP2599-rgb.jpg','HIP2599-w4-Heat-pow-99.5.jpg','HIP2599-w4-Hsv-pow-99.5.jpg',NULL,NULL),(275,1,NULL,NULL,'HIP11891-w4-Cool-pow-99.5.jpg','HIP11891-rgb.jpg','HIP11891-w4-Heat-pow-99.5.jpg','HIP11891-w4-Hsv-pow-99.5.jpg',NULL,NULL),(276,1,NULL,NULL,'HIP16518-w4-Cool-pow-99.5.jpg','HIP16518-rgb.jpg','HIP16518-w4-Heat-pow-99.5.jpg','HIP16518-w4-Hsv-pow-99.5.jpg',NULL,NULL),(277,1,NULL,NULL,'HIP22783-w4-Cool-pow-99.5.jpg','HIP22783-rgb.jpg','HIP22783-w4-Heat-pow-99.5.jpg','HIP22783-w4-Hsv-pow-99.5.jpg',NULL,NULL),(278,1,NULL,NULL,'HIP24575-w4-Cool-pow-99.5.jpg','HIP24575-rgb.jpg','HIP24575-w4-Heat-pow-99.5.jpg','HIP24575-w4-Hsv-pow-99.5.jpg',NULL,NULL),(279,1,NULL,NULL,'HIP25923-w4-Cool-pow-99.5.jpg','HIP25923-rgb.jpg','HIP25923-w4-Heat-pow-99.5.jpg','HIP25923-w4-Hsv-pow-99.5.jpg',NULL,NULL),(280,1,NULL,NULL,'HIP28881-w4-Cool-pow-99.5.jpg','HIP28881-rgb.jpg','HIP28881-w4-Heat-pow-99.5.jpg','HIP28881-w4-Hsv-pow-99.5.jpg',NULL,NULL),(281,1,NULL,NULL,'HIP29276-w4-Cool-pow-99.5.jpg','HIP29276-rgb.jpg','HIP29276-w4-Heat-pow-99.5.jpg','HIP29276-w4-Hsv-pow-99.5.jpg',NULL,NULL),(282,1,NULL,NULL,'HIP31766-w4-Cool-pow-99.5.jpg','HIP31766-rgb.jpg','HIP31766-w4-Heat-pow-99.5.jpg','HIP31766-w4-Hsv-pow-99.5.jpg',NULL,NULL),(283,1,NULL,NULL,'HIP32067-w4-Cool-pow-99.5.jpg','HIP32067-rgb.jpg','HIP32067-w4-Heat-pow-99.5.jpg','HIP32067-w4-Hsv-pow-99.5.jpg',NULL,NULL),(284,1,'marked/HIP34536-w4-Heat-pow-99.5_m.jpg','marked/HIP34536-w4-Hsv-pow-99.5_m.jpg','HIP34536-w4-Cool-pow-99.5.jpg','HIP34536-rgb.jpg','HIP34536-w4-Heat-pow-99.5.jpg','HIP34536-w4-Hsv-pow-99.5.jpg','marked/HIP34536-w4-Cool-pow-99.5_m.jpg','marked/HIP34536-rgb_m.jpg'),(285,1,NULL,NULL,'HIP38430-w4-Cool-pow-99.5.jpg','HIP38430-rgb.jpg','HIP38430-w4-Heat-pow-99.5.jpg','HIP38430-w4-Hsv-pow-99.5.jpg',NULL,NULL),(286,1,NULL,NULL,'HIP62322-w4-Cool-pow-99.5.jpg','HIP62322-rgb.jpg','HIP62322-w4-Heat-pow-99.5.jpg','HIP62322-w4-Hsv-pow-99.5.jpg',NULL,NULL),(287,1,NULL,NULL,'HIP72510-w4-Cool-pow-99.5.jpg','HIP72510-rgb.jpg','HIP72510-w4-Heat-pow-99.5.jpg','HIP72510-w4-Hsv-pow-99.5.jpg',NULL,NULL),(288,1,NULL,NULL,'HIP75095-w4-Cool-pow-99.5.jpg','HIP75095-rgb.jpg','HIP75095-w4-Heat-pow-99.5.jpg','HIP75095-w4-Hsv-pow-99.5.jpg',NULL,NULL),(289,1,NULL,NULL,'HIP77391-w4-Cool-pow-99.5.jpg','HIP77391-rgb.jpg','HIP77391-w4-Heat-pow-99.5.jpg','HIP77391-w4-Hsv-pow-99.5.jpg',NULL,NULL),(290,1,NULL,NULL,'HIP81377-w4-Cool-pow-99.5.jpg','HIP81377-rgb.jpg','HIP81377-w4-Heat-pow-99.5.jpg','HIP81377-w4-Hsv-pow-99.5.jpg',NULL,NULL),(291,1,NULL,NULL,'HIP88652-w4-Cool-pow-99.5.jpg','HIP88652-rgb.jpg','HIP88652-w4-Heat-pow-99.5.jpg','HIP88652-w4-Hsv-pow-99.5.jpg',NULL,NULL),(292,1,NULL,NULL,'HIP101186-w4-Cool-pow-99.5.jpg','HIP101186-rgb.jpg','HIP101186-w4-Heat-pow-99.5.jpg','HIP101186-w4-Hsv-pow-99.5.jpg',NULL,NULL),(293,1,'marked/bd433654-w4-Heat-pow-99.5_m.jpg','marked/bd433654-w4-Hsv-pow-99.5_m.jpg','bd433654-w4-Cool-pow-99.5.jpg','bd433654-rgb.jpg','bd433654-w4-Heat-pow-99.5.jpg','bd433654-w4-Hsv-pow-99.5.jpg','marked/bd433654-w4-Cool-pow-99.5_m.jpg','marked/bd433654-rgb_m.jpg'),(294,1,NULL,NULL,'HIP114990-w4-Cool-pow-99.5.jpg','HIP114990-rgb.jpg','HIP114990-w4-Heat-pow-99.5.jpg','HIP114990-w4-Hsv-pow-99.5.jpg',NULL,NULL),(295,1,NULL,NULL,'bd433654-w3-Cool-pow-99.5.jpg','bd433654-rgb.jpg','bd433654-w3-Heat-pow-99.5.jpg','bd433654-w3-Hsv-pow-99.5.jpg',NULL,NULL),(296,1,NULL,NULL,'HIP33654-w3-Cool-pow-99.5.jpg','HIP33654-rgb.jpg','HIP33654-w3-Heat-pow-99.5.jpg','HIP33654-w3-Hsv-pow-99.5.jpg',NULL,NULL),(297,1,NULL,NULL,'HIP11891-w3-Cool-pow-99.5.jpg','HIP11891-rgb.jpg','HIP11891-w3-Heat-pow-99.5.jpg','HIP11891-w3-Hsv-pow-99.5.jpg',NULL,NULL),(298,1,'marked/HIP24575-w3-Heat-pow-99.5_m.jpg','marked/HIP24575-w3-Hsv-pow-99.5_m.jpg','HIP24575-w3-Cool-pow-99.5.jpg','HIP24575-rgb.jpg','HIP24575-w3-Heat-pow-99.5.jpg','HIP24575-w3-Hsv-pow-99.5.jpg','marked/HIP24575-w3-Cool-pow-99.5_m.jpg','marked/HIP24575-rgb_m.jpg'),(299,1,NULL,NULL,'HIP31766-w3-Cool-pow-99.5.jpg','HIP31766-rgb.jpg','HIP31766-w3-Heat-pow-99.5.jpg','HIP31766-w3-Hsv-pow-99.5.jpg',NULL,NULL),(300,1,NULL,NULL,'HIP32067-w3-Cool-pow-99.5.jpg','HIP32067-rgb.jpg','HIP32067-w3-Heat-pow-99.5.jpg','HIP32067-w3-Hsv-pow-99.5.jpg',NULL,NULL),(301,1,NULL,NULL,'HIP38430-w3-Cool-pow-99.5.jpg','HIP38430-rgb.jpg','HIP38430-w3-Heat-pow-99.5.jpg','HIP38430-w3-Hsv-pow-99.5.jpg',NULL,NULL),(302,1,NULL,NULL,'HIP81377-w3-Cool-pow-99.5.jpg','HIP81377-rgb.jpg','HIP81377-w3-Heat-pow-99.5.jpg','HIP81377-w3-Hsv-pow-99.5.jpg',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (2,'MIguel Veintimilla',33,'Docente Universitario',NULL),(3,'usuario4',31,'ing telecomunicaciones',NULL),(4,'usuario8',41,'Ingeniero en Sistemas',NULL),(5,'usuario9',41,'Docente',NULL),(6,'usuario10',41,'Docente Universitario',NULL),(8,'usuario12',36,'profesora',NULL),(9,'usuario14',42,'ingeniero en sistemas',NULL),(10,'usuario16',35,'Docente Universitario',NULL);
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
  `images_used_to_respond` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participant_response_image1_idx` (`image_served_id`),
  KEY `fk_participant_response_session_participant_idx` (`session_id`),
  KEY `fk_participant_response_training_task_idx` (`training_task_id`),
  CONSTRAINT `fk_participant_response_image1` FOREIGN KEY (`image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_session` FOREIGN KEY (`session_id`) REFERENCES `participant_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_training_task` FOREIGN KEY (`training_task_id`) REFERENCES `training_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_response`
--

LOCK TABLES `participant_response` WRITE;
/*!40000 ALTER TABLE `participant_response` DISABLE KEYS */;
INSERT INTO `participant_response` VALUES (7,2,293,10,'2017-03-30 09:48:16','training',1,1,1,NULL),(8,2,241,0,'2017-03-30 09:48:30','training',2,0,2,NULL),(9,2,298,10,'2017-03-30 09:48:40','training',3,1,1,NULL),(10,2,284,10,'2017-03-30 09:48:53','training',4,1,1,NULL),(11,2,268,0,'2017-03-30 09:49:03','training',5,0,1,NULL),(12,2,263,NULL,'2017-03-30 09:49:47','real',NULL,0,0,'rgb'),(13,2,293,NULL,'2017-03-30 09:50:01','real',NULL,1,1,'rgb,cool'),(14,2,300,NULL,'2017-03-30 09:50:13','real',NULL,1,1,'rgb'),(15,2,252,NULL,'2017-03-30 09:50:26','real',NULL,0,1,'rgb'),(16,2,255,NULL,'2017-03-30 09:50:40','real',NULL,0,0,'rgb,cool'),(17,2,289,NULL,'2017-03-30 09:50:59','real',NULL,1,0,'rgb,hsv'),(18,2,249,NULL,'2017-03-30 09:51:17','real',NULL,0,0,'cool,hsv'),(19,2,285,NULL,'2017-03-30 09:51:26','real',NULL,1,1,'rgb'),(20,2,252,NULL,'2017-03-30 09:51:39','real',NULL,0,1,'rgb,cool'),(21,2,263,NULL,'2017-03-30 09:51:49','real',NULL,0,0,'rgb,hsv'),(22,2,298,NULL,'2017-03-30 09:52:00','real',NULL,1,1,'rgb,hsv'),(23,2,300,NULL,'2017-03-30 09:52:12','real',NULL,1,1,'rgb'),(24,2,246,NULL,'2017-03-30 09:52:22','real',NULL,0,0,'rgb,hsv'),(25,2,274,NULL,'2017-03-30 09:52:35','real',NULL,1,1,'rgb,hsv'),(26,2,252,NULL,'2017-03-30 09:52:44','real',NULL,0,0,'rgb'),(27,2,234,NULL,'2017-03-30 09:52:50','real',NULL,0,0,'rgb'),(28,2,288,NULL,'2017-03-30 09:52:59','real',NULL,1,0,'rgb,hsv'),(29,2,272,NULL,'2017-03-30 09:53:09','real',NULL,0,0,'rgb,hsv'),(30,2,266,NULL,'2017-03-30 09:53:17','real',NULL,0,1,'rgb'),(31,2,253,NULL,'2017-03-30 09:53:31','real',NULL,0,0,'rgb,cool'),(32,2,266,NULL,'2017-03-30 09:53:40','real',NULL,0,0,'rgb'),(33,2,288,NULL,'2017-03-30 09:53:48','real',NULL,1,0,'rgb,hsv'),(34,2,269,NULL,'2017-03-30 09:54:04','real',NULL,0,1,'rgb'),(35,2,292,NULL,'2017-03-30 09:54:14','real',NULL,1,1,'rgb,hsv'),(36,2,282,NULL,'2017-03-30 09:54:22','real',NULL,1,1,'rgb'),(37,2,279,NULL,'2017-03-30 09:54:34','real',NULL,1,0,'rgb,hsv'),(38,2,264,NULL,'2017-03-30 09:54:42','real',NULL,0,0,'rgb'),(39,2,263,NULL,'2017-03-30 09:54:50','real',NULL,0,0,'rgb'),(40,3,293,10,'2017-03-30 10:21:51','training',1,1,1,NULL),(41,3,241,10,'2017-03-30 10:22:01','training',2,0,0,NULL),(42,3,298,10,'2017-03-30 10:22:08','training',3,1,1,NULL),(43,3,284,10,'2017-03-30 10:22:18','training',4,1,1,NULL),(44,3,268,10,'2017-03-30 10:22:29','training',5,0,0,NULL),(45,3,285,NULL,'2017-03-30 10:23:13','real',NULL,1,1,'rgb,hsv'),(46,3,290,NULL,'2017-03-30 10:23:27','real',NULL,1,1,'rgb,cool'),(47,3,278,NULL,'2017-03-30 10:23:37','real',NULL,1,1,'rgb,hsv'),(48,3,293,NULL,'2017-03-30 10:23:45','real',NULL,1,1,'rgb,hsv'),(49,3,248,NULL,'2017-03-30 10:23:56','real',NULL,0,0,'rgb,hsv'),(50,3,293,NULL,'2017-03-30 10:24:04','real',NULL,1,1,'rgb,hsv'),(51,3,263,NULL,'2017-03-30 10:24:12','real',NULL,0,0,'rgb,hsv'),(52,3,262,NULL,'2017-03-30 10:24:23','real',NULL,0,0,'rgb'),(53,3,276,NULL,'2017-03-30 10:24:35','real',NULL,1,1,'cool,hsv'),(54,3,258,NULL,'2017-03-30 10:24:46','real',NULL,0,0,'rgb,hsv'),(55,3,256,NULL,'2017-03-30 10:24:55','real',NULL,0,0,'rgb,hsv'),(56,3,293,NULL,'2017-03-30 10:25:03','real',NULL,1,1,'rgb,hsv'),(57,3,254,NULL,'2017-03-30 10:25:10','real',NULL,0,0,'rgb,hsv'),(58,3,295,NULL,'2017-03-30 10:25:15','real',NULL,1,1,'rgb,hsv'),(59,3,284,NULL,'2017-03-30 10:25:24','real',NULL,1,1,'hsv'),(60,3,242,NULL,'2017-03-30 10:25:35','real',NULL,0,0,'hsv'),(61,3,298,NULL,'2017-03-30 10:25:45','real',NULL,1,1,'rgb,hsv'),(62,3,246,NULL,'2017-03-30 10:25:57','real',NULL,0,0,'rgb'),(63,3,251,NULL,'2017-03-30 10:26:06','real',NULL,0,0,'rgb,hsv'),(64,3,293,NULL,'2017-03-30 10:26:13','real',NULL,1,1,'rgb,hsv'),(65,4,293,10,'2017-03-31 09:46:57','training',1,1,1,NULL),(66,4,241,10,'2017-03-31 09:47:17','training',2,0,0,NULL),(67,4,298,10,'2017-03-31 09:47:25','training',3,1,1,NULL),(68,4,284,0,'2017-03-31 09:47:34','training',4,1,0,NULL),(69,4,268,10,'2017-03-31 09:47:53','training',5,0,0,NULL),(70,4,259,NULL,'2017-03-31 09:48:52','real',NULL,0,1,'rgb'),(71,4,287,NULL,'2017-03-31 09:49:17','real',NULL,1,1,'rgb'),(72,4,236,NULL,'2017-03-31 09:49:37','real',NULL,0,1,'rgb,cool,heat,hsv'),(73,4,292,NULL,'2017-03-31 09:50:30','real',NULL,1,1,'rgb'),(74,4,282,NULL,'2017-03-31 09:50:50','real',NULL,1,0,'rgb'),(75,4,232,NULL,'2017-03-31 09:51:05','real',NULL,0,1,'rgb,cool,heat,hsv'),(76,4,243,NULL,'2017-03-31 09:51:22','real',NULL,0,0,'rgb,cool,heat,hsv'),(77,4,286,NULL,'2017-03-31 09:51:37','real',NULL,1,1,'rgb'),(78,4,260,NULL,'2017-03-31 09:51:54','real',NULL,0,1,'rgb,hsv'),(79,4,251,NULL,'2017-03-31 09:52:05','real',NULL,0,1,'rgb,hsv'),(80,4,237,NULL,'2017-03-31 09:52:15','real',NULL,0,0,'hsv'),(81,4,262,NULL,'2017-03-31 09:52:26','real',NULL,0,1,'rgb,hsv'),(82,5,293,0,'2017-03-31 10:04:52','training',1,1,0,NULL),(83,5,241,10,'2017-03-31 10:05:07','training',2,0,0,NULL),(84,5,298,10,'2017-03-31 10:05:19','training',3,1,1,NULL),(85,5,284,10,'2017-03-31 10:05:31','training',4,1,1,NULL),(86,5,268,10,'2017-03-31 10:05:43','training',5,0,0,NULL),(87,5,251,NULL,'2017-03-31 10:06:53','real',NULL,0,0,'cool'),(88,5,295,NULL,'2017-03-31 10:07:03','real',NULL,1,1,'rgb'),(89,5,261,NULL,'2017-03-31 10:07:19','real',NULL,0,0,'cool'),(90,5,236,NULL,'2017-03-31 10:07:42','real',NULL,0,1,'hsv'),(91,5,283,NULL,'2017-03-31 10:08:05','real',NULL,1,0,'cool'),(92,5,244,NULL,'2017-03-31 10:08:25','real',NULL,0,0,'rgb'),(93,5,283,NULL,'2017-03-31 10:08:56','real',NULL,1,0,'cool'),(94,5,264,NULL,'2017-03-31 10:09:19','real',NULL,0,0,'cool'),(95,5,246,NULL,'2017-03-31 10:09:48','real',NULL,0,0,'cool'),(96,5,266,NULL,'2017-03-31 10:10:01','real',NULL,0,0,'cool'),(97,5,242,NULL,'2017-03-31 10:10:19','real',NULL,0,0,'cool'),(98,5,243,NULL,'2017-03-31 10:10:55','real',NULL,0,0,'rgb'),(99,6,293,10,'2017-03-31 10:20:22','training',1,1,1,NULL),(100,6,241,0,'2017-03-31 10:20:46','training',2,0,2,NULL),(101,6,298,10,'2017-03-31 10:20:58','training',3,1,1,NULL),(102,6,284,0,'2017-03-31 10:21:08','training',4,1,0,NULL),(103,6,268,10,'2017-03-31 10:21:28','training',5,0,0,NULL),(104,7,293,10,'2017-03-31 10:22:04','training',1,1,1,NULL),(105,7,241,0,'2017-03-31 10:22:19','training',2,0,1,NULL),(106,7,298,10,'2017-03-31 10:22:26','training',3,1,1,NULL),(107,7,284,0,'2017-03-31 10:22:35','training',4,1,0,NULL),(108,7,268,0,'2017-03-31 10:22:41','training',5,0,1,NULL),(109,7,275,NULL,'2017-03-31 10:23:34','real',NULL,1,1,'rgb,cool'),(110,7,241,NULL,'2017-03-31 10:23:55','real',NULL,0,0,'cool'),(111,7,233,NULL,'2017-03-31 10:24:11','real',NULL,0,0,'heat'),(112,7,258,NULL,'2017-03-31 10:24:24','real',NULL,0,1,'rgb'),(113,7,242,NULL,'2017-03-31 10:24:38','real',NULL,0,0,'heat'),(114,7,232,NULL,'2017-03-31 10:24:49','real',NULL,0,1,'rgb,heat'),(115,7,248,NULL,'2017-03-31 10:25:02','real',NULL,0,2,NULL),(116,7,252,NULL,'2017-03-31 10:25:19','real',NULL,0,0,'rgb'),(117,7,273,NULL,'2017-03-31 10:25:30','real',NULL,1,1,'rgb'),(118,7,236,NULL,'2017-03-31 10:25:46','real',NULL,0,1,'heat,hsv'),(119,7,237,NULL,'2017-03-31 10:26:03','real',NULL,0,1,'cool'),(120,7,291,NULL,'2017-03-31 10:26:24','real',NULL,1,1,'rgb,hsv'),(121,8,293,10,'2017-03-31 11:19:26','training',1,1,1,NULL),(122,8,241,0,'2017-03-31 11:19:37','training',2,0,1,NULL),(123,8,298,10,'2017-03-31 11:19:43','training',3,1,1,NULL),(124,8,284,0,'2017-03-31 11:19:50','training',4,1,0,NULL),(125,8,268,0,'2017-03-31 11:20:00','training',5,0,2,NULL),(126,9,293,10,'2017-03-31 11:57:25','training',1,1,2,NULL),(127,9,241,0,'2017-03-31 11:57:42','training',2,0,1,NULL),(128,9,298,10,'2017-03-31 11:57:53','training',3,1,1,NULL),(129,9,284,10,'2017-03-31 11:58:30','training',4,1,2,NULL),(130,9,268,0,'2017-03-31 11:59:19','training',5,0,1,NULL),(131,9,236,NULL,'2017-03-31 12:00:31','real',NULL,0,1,'rgb'),(132,9,231,NULL,'2017-03-31 12:00:51','real',NULL,0,1,'rgb'),(133,9,252,NULL,'2017-03-31 12:01:22','real',NULL,0,0,'heat'),(134,9,259,NULL,'2017-03-31 12:01:41','real',NULL,0,0,'hsv'),(135,9,241,NULL,'2017-03-31 12:01:58','real',NULL,0,2,NULL),(136,9,275,NULL,'2017-03-31 12:02:08','real',NULL,1,1,'rgb'),(137,9,259,NULL,'2017-03-31 12:02:16','real',NULL,0,2,NULL),(138,9,299,NULL,'2017-03-31 12:02:32','real',NULL,1,0,'hsv'),(139,10,293,0,'2017-03-31 12:23:48','training',1,1,0,NULL),(140,10,241,0,'2017-03-31 12:23:56','training',2,0,1,NULL),(141,10,298,10,'2017-03-31 12:24:05','training',3,1,1,NULL),(142,10,284,10,'2017-03-31 12:24:21','training',4,1,1,NULL),(143,10,268,0,'2017-03-31 12:24:33','training',5,0,1,NULL),(144,10,256,NULL,'2017-03-31 12:25:34','real',NULL,0,0,'rgb');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_session`
--

LOCK TABLES `participant_session` WRITE;
/*!40000 ALTER TABLE `participant_session` DISABLE KEYS */;
INSERT INTO `participant_session` VALUES (2,2,'pj5rsl21sdg197n1a6ickpm172','2017-03-30 09:45:38','2017-03-30 09:54:58',30,4,100,1,NULL),(3,3,'pj5rsl21sdg197n1a6ickpm172','2017-03-30 10:19:11','2017-03-30 10:26:49',50,4,100,9,NULL),(4,4,'o9t3002vnvdidgf43nem0pbo41','2017-03-31 09:44:38','2017-03-31 09:52:34',40,4,66.6667,8,NULL),(5,5,'o9t3002vnvdidgf43nem0pbo41','2017-03-31 10:01:31','2017-03-31 10:11:05',40,1,75,8,NULL),(6,6,'o9t3002vnvdidgf43nem0pbo41','2017-03-31 10:18:16',NULL,30,1,40,4,7),(7,6,'o9t3002vnvdidgf43nem0pbo41','2017-03-31 10:21:48','2017-03-31 10:26:27',20,1,16.6667,4,NULL),(8,8,'3iqf3usp8vhj3tslmf94v0apt5','2017-03-31 11:16:56','2017-03-31 11:20:24',20,4,28.5714,2,NULL),(9,9,'3iqf3usp8vhj3tslmf94v0apt5','2017-03-31 11:51:57','2017-03-31 12:02:48',30,1,62.5,7,NULL),(10,10,'bi1teq5dlg761pvcuq2jscnv65','2017-03-31 12:20:31','2017-03-31 12:25:44',20,4,33.3333,7,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_task`
--

LOCK TABLES `training_task` WRITE;
/*!40000 ALTER TABLE `training_task` DISABLE KEYS */;
INSERT INTO `training_task` VALUES (1,1,'Es una runaway star!',293),(2,2,'No es una runaway star',241),(3,3,'Es una runaway star!',298),(4,4,'Es una runaway star',284),(5,5,'No es una runaway star',268);
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

-- Dump completed on 2017-04-14 14:07:05
