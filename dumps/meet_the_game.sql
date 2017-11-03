-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: meet_the_game
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
INSERT INTO `image` VALUES (229,0,NULL,NULL,'HIP505-w4-Cool-pow-99.5.jpg','HIP505-rgb.jpg','HIP505-w4-Heat-pow-99.5.jpg','HIP505-w4-Hsv-pow-99.5.jpg',NULL,NULL),(230,0,NULL,NULL,'HIP14969-w4-Cool-pow-99.5.jpg','HIP14969-rgb.jpg','HIP14969-w4-Heat-pow-99.5.jpg','HIP14969-w4-Hsv-pow-99.5.jpg',NULL,NULL),(231,0,NULL,NULL,'HIP29201-w4-Cool-pow-99.5.jpg','HIP29201-rgb.jpg','HIP29201-w4-Heat-pow-99.5.jpg','HIP29201-w4-Hsv-pow-99.5.jpg',NULL,NULL),(232,0,NULL,NULL,'HIP92133-w4-Cool-pow-99.5.jpg','HIP92133-rgb.jpg','HIP92133-w4-Heat-pow-99.5.jpg','HIP92133-w4-Hsv-pow-99.5.jpg',NULL,NULL),(233,0,NULL,NULL,'HIP398-w4-Cool-pow-99.5.jpg','HIP398-rgb.jpg','HIP398-w4-Heat-pow-99.5.jpg','HIP398-w4-Hsv-pow-99.5.jpg',NULL,NULL),(234,0,NULL,NULL,'HIP14969-w4-Cool-pow-99.5.jpg','HIP14969-rgb.jpg','HIP14969-w4-Heat-pow-99.5.jpg','HIP14969-w4-Hsv-pow-99.5.jpg',NULL,NULL),(235,0,NULL,NULL,'HIP29201-w4-Cool-pow-99.5.jpg','HIP29201-rgb.jpg','HIP29201-w4-Heat-pow-99.5.jpg','HIP29201-w4-Hsv-pow-99.5.jpg',NULL,NULL),(236,0,NULL,NULL,'HIP48730-w4-Cool-pow-99.5.jpg','HIP48730-rgb.jpg','HIP48730-w4-Heat-pow-99.5.jpg','HIP48730-w4-Hsv-pow-99.5.jpg',NULL,NULL),(237,0,NULL,NULL,'HIP61958-w4-Cool-pow-99.5.jpg','HIP61958-rgb.jpg','HIP61958-w4-Heat-pow-99.5.jpg','HIP61958-w4-Hsv-pow-99.5.jpg',NULL,NULL),(238,0,NULL,NULL,'HIP99303-w4-Cool-pow-99.5.jpg','HIP99303-rgb.jpg','HIP99303-w4-Heat-pow-99.5.jpg','HIP99303-w4-Hsv-pow-99.5.jpg',NULL,NULL),(239,0,NULL,NULL,'HIP110386-w4-Cool-pow-99.5.jpg','HIP110386-rgb.jpg','HIP110386-w4-Heat-pow-99.5.jpg','HIP110386-w4-Hsv-pow-99.5.jpg',NULL,NULL),(240,0,NULL,NULL,'HIP114482-w4-Cool-pow-99.5.jpg','HIP114482-rgb.jpg','HIP114482-w4-Heat-pow-99.5.jpg','HIP114482-w4-Hsv-pow-99.5.jpg',NULL,NULL),(241,0,NULL,NULL,'HIP3013-w4-Cool-pow-99.5.jpg','HIP3013-rgb.jpg','HIP3013-w4-Heat-pow-99.5.jpg','HIP3013-w4-Hsv-pow-99.5.jpg',NULL,NULL),(242,0,NULL,NULL,'HIP4532-w4-Cool-pow-99.5.jpg','HIP4532-rgb.jpg','HIP4532-w4-Heat-pow-99.5.jpg','HIP4532-w4-Hsv-pow-99.5.jpg',NULL,NULL),(243,0,NULL,NULL,'HIP11792-w4-Cool-pow-99.5.jpg','HIP11792-rgb.jpg','HIP11792-w4-Heat-pow-99.5.jpg','HIP11792-w4-Hsv-pow-99.5.jpg',NULL,NULL),(244,0,NULL,NULL,'HIP26064-w4-Cool-pow-99.5.jpg','HIP26064-rgb.jpg','HIP26064-w4-Heat-pow-99.5.jpg','HIP26064-w4-Hsv-pow-99.5.jpg',NULL,NULL),(245,0,NULL,NULL,'HIP31878-w4-Cool-pow-99.5.jpg','HIP31878-rgb.jpg','HIP31878-w4-Heat-pow-99.5.jpg','HIP31878-w4-Hsv-pow-99.5.jpg',NULL,NULL),(246,0,NULL,NULL,'HIP48715-w4-Cool-pow-99.5.jpg','HIP48715-rgb.jpg','HIP48715-w4-Heat-pow-99.5.jpg','HIP48715-w4-Hsv-pow-99.5.jpg',NULL,NULL),(247,0,NULL,NULL,'HIP52849-w4-Cool-pow-99.5.jpg','HIP52849-rgb.jpg','HIP52849-w4-Heat-pow-99.5.jpg','HIP52849-w4-Hsv-pow-99.5.jpg',NULL,NULL),(248,0,NULL,NULL,'HIP70877-w4-Cool-pow-99.5.jpg','HIP70877-rgb.jpg','HIP70877-w4-Heat-pow-99.5.jpg','HIP70877-w4-Hsv-pow-99.5.jpg',NULL,NULL),(249,0,NULL,NULL,'HIP81100-w4-Cool-pow-99.5.jpg','HIP81100-rgb.jpg','HIP81100-w4-Heat-pow-99.5.jpg','HIP81100-w4-Hsv-pow-99.5.jpg',NULL,NULL),(250,0,NULL,NULL,'HIP85885-w4-Cool-pow-99.5.jpg','HIP85885-rgb.jpg','HIP85885-w4-Heat-pow-99.5.jpg','HIP85885-w4-Hsv-pow-99.5.jpg',NULL,NULL),(251,0,NULL,NULL,'HIP505-w3-Cool-pow-99.5.jpg','HIP505-rgb.jpg','HIP505-w3-Heat-pow-99.5.jpg','HIP505-w3-Hsv-pow-99.5.jpg',NULL,NULL),(252,0,NULL,NULL,'HIP14969-w3-Cool-pow-99.5.jpg','HIP14969-rgb.jpg','HIP14969-w3-Heat-pow-99.5.jpg','HIP14969-w3-Hsv-pow-99.5.jpg',NULL,NULL),(253,0,NULL,NULL,'HIP29201-w3-Cool-pow-99.5.jpg','HIP29201-rgb.jpg','HIP29201-w3-Heat-pow-99.5.jpg','HIP29201-w3-Hsv-pow-99.5.jpg',NULL,NULL),(254,0,NULL,NULL,'HIP92133-w3-Cool-pow-99.5.jpg','HIP92133-rgb.jpg','HIP92133-w3-Heat-pow-99.5.jpg','HIP92133-w3-Hsv-pow-99.5.jpg',NULL,NULL),(255,0,NULL,NULL,'HIP398-w3-Cool-pow-99.5.jpg','HIP398-rgb.jpg','HIP398-w3-Heat-pow-99.5.jpg','HIP398-w3-Hsv-pow-99.5.jpg',NULL,NULL),(256,0,NULL,NULL,'HIP14969-w3-Cool-pow-99.5.jpg','HIP14969-rgb.jpg','HIP14969-w3-Heat-pow-99.5.jpg','HIP14969-w3-Hsv-pow-99.5.jpg',NULL,NULL),(257,0,NULL,NULL,'HIP29201-w3-Cool-pow-99.5.jpg','HIP29201-rgb.jpg','HIP29201-w3-Heat-pow-99.5.jpg','HIP29201-w3-Hsv-pow-99.5.jpg',NULL,NULL),(258,0,NULL,NULL,'HIP48730-w3-Cool-pow-99.5.jpg','HIP48730-rgb.jpg','HIP48730-w3-Heat-pow-99.5.jpg','HIP48730-w3-Hsv-pow-99.5.jpg',NULL,NULL),(259,0,NULL,NULL,'HIP61958-w3-Cool-pow-99.5.jpg','HIP61958-rgb.jpg','HIP61958-w3-Heat-pow-99.5.jpg','HIP61958-w3-Hsv-pow-99.5.jpg',NULL,NULL),(260,0,NULL,NULL,'HIP99303-w3-Cool-pow-99.5.jpg','HIP99303-rgb.jpg','HIP99303-w3-Heat-pow-99.5.jpg','HIP99303-w3-Hsv-pow-99.5.jpg',NULL,NULL),(261,0,NULL,NULL,'HIP110386-w3-Cool-pow-99.5.jpg','HIP110386-rgb.jpg','HIP110386-w3-Heat-pow-99.5.jpg','HIP110386-w3-Hsv-pow-99.5.jpg',NULL,NULL),(262,0,NULL,NULL,'HIP114482-w3-Cool-pow-99.5.jpg','HIP114482-rgb.jpg','HIP114482-w3-Heat-pow-99.5.jpg','HIP114482-w3-Hsv-pow-99.5.jpg',NULL,NULL),(263,0,NULL,NULL,'HIP3013-w3-Cool-pow-99.5.jpg','HIP3013-rgb.jpg','HIP3013-w3-Heat-pow-99.5.jpg','HIP3013-w3-Hsv-pow-99.5.jpg',NULL,NULL),(264,0,NULL,NULL,'HIP4532-w3-Cool-pow-99.5.jpg','HIP4532-rgb.jpg','HIP4532-w3-Heat-pow-99.5.jpg','HIP4532-w3-Hsv-pow-99.5.jpg',NULL,NULL),(265,0,NULL,NULL,'HIP11792-w3-Cool-pow-99.5.jpg','HIP11792-rgb.jpg','HIP11792-w3-Heat-pow-99.5.jpg','HIP11792-w3-Hsv-pow-99.5.jpg',NULL,NULL),(266,0,NULL,NULL,'HIP26064-w3-Cool-pow-99.5.jpg','HIP26064-rgb.jpg','HIP26064-w3-Heat-pow-99.5.jpg','HIP26064-w3-Hsv-pow-99.5.jpg',NULL,NULL),(267,0,NULL,NULL,'HIP31878-w3-Cool-pow-99.5.jpg','HIP31878-rgb.jpg','HIP31878-w3-Heat-pow-99.5.jpg','HIP31878-w3-Hsv-pow-99.5.jpg',NULL,NULL),(268,0,NULL,NULL,'HIP48715-w3-Cool-pow-99.5.jpg','HIP48715-rgb.jpg','HIP48715-w3-Heat-pow-99.5.jpg','HIP48715-w3-Hsv-pow-99.5.jpg',NULL,NULL),(269,0,NULL,NULL,'HIP52849-w3-Cool-pow-99.5.jpg','HIP52849-rgb.jpg','HIP52849-w3-Heat-pow-99.5.jpg','HIP52849-w3-Hsv-pow-99.5.jpg',NULL,NULL),(270,0,NULL,NULL,'HIP70877-w3-Cool-pow-99.5.jpg','HIP70877-rgb.jpg','HIP70877-w3-Heat-pow-99.5.jpg','HIP70877-w3-Hsv-pow-99.5.jpg',NULL,NULL),(271,0,NULL,NULL,'HIP81100-w3-Cool-pow-99.5.jpg','HIP81100-rgb.jpg','HIP81100-w3-Heat-pow-99.5.jpg','HIP81100-w3-Hsv-pow-99.5.jpg',NULL,NULL),(272,0,NULL,NULL,'HIP85885-w3-Cool-pow-99.5.jpg','HIP85885-rgb.jpg','HIP85885-w3-Heat-pow-99.5.jpg','HIP85885-w3-Hsv-pow-99.5.jpg',NULL,NULL),(273,1,NULL,NULL,'HIP2036-w4-Cool-pow-99.5.jpg','HIP2036-rgb.jpg','HIP2036-w4-Heat-pow-99.5.jpg','HIP2036-w4-Hsv-pow-99.5.jpg',NULL,NULL),(274,1,NULL,NULL,'HIP2599-w4-Cool-pow-99.5.jpg','HIP2599-rgb.jpg','HIP2599-w4-Heat-pow-99.5.jpg','HIP2599-w4-Hsv-pow-99.5.jpg',NULL,NULL),(275,1,NULL,NULL,'HIP11891-w4-Cool-pow-99.5.jpg','HIP11891-rgb.jpg','HIP11891-w4-Heat-pow-99.5.jpg','HIP11891-w4-Hsv-pow-99.5.jpg',NULL,NULL),(276,1,NULL,NULL,'HIP16518-w4-Cool-pow-99.5.jpg','HIP16518-rgb.jpg','HIP16518-w4-Heat-pow-99.5.jpg','HIP16518-w4-Hsv-pow-99.5.jpg',NULL,NULL),(277,1,NULL,NULL,'HIP22783-w4-Cool-pow-99.5.jpg','HIP22783-rgb.jpg','HIP22783-w4-Heat-pow-99.5.jpg','HIP22783-w4-Hsv-pow-99.5.jpg',NULL,NULL),(278,1,NULL,NULL,'HIP24575-w4-Cool-pow-99.5.jpg','HIP24575-rgb.jpg','HIP24575-w4-Heat-pow-99.5.jpg','HIP24575-w4-Hsv-pow-99.5.jpg',NULL,NULL),(279,1,NULL,NULL,'HIP25923-w4-Cool-pow-99.5.jpg','HIP25923-rgb.jpg','HIP25923-w4-Heat-pow-99.5.jpg','HIP25923-w4-Hsv-pow-99.5.jpg',NULL,NULL),(280,1,NULL,NULL,'HIP28881-w4-Cool-pow-99.5.jpg','HIP28881-rgb.jpg','HIP28881-w4-Heat-pow-99.5.jpg','HIP28881-w4-Hsv-pow-99.5.jpg',NULL,NULL),(281,1,NULL,NULL,'HIP29276-w4-Cool-pow-99.5.jpg','HIP29276-rgb.jpg','HIP29276-w4-Heat-pow-99.5.jpg','HIP29276-w4-Hsv-pow-99.5.jpg',NULL,NULL),(282,1,NULL,NULL,'HIP31766-w4-Cool-pow-99.5.jpg','HIP31766-rgb.jpg','HIP31766-w4-Heat-pow-99.5.jpg','HIP31766-w4-Hsv-pow-99.5.jpg',NULL,NULL),(283,1,NULL,NULL,'HIP32067-w4-Cool-pow-99.5.jpg','HIP32067-rgb.jpg','HIP32067-w4-Heat-pow-99.5.jpg','HIP32067-w4-Hsv-pow-99.5.jpg',NULL,NULL),(284,1,'marked/HIP34536-w4-Heat-pow-99.5_m.gif','marked/HIP34536-w4-Hsv-pow-99.5_m.gif','HIP34536-w4-Cool-pow-99.5.jpg','HIP34536-rgb.jpg','HIP34536-w4-Heat-pow-99.5.jpg','HIP34536-w4-Hsv-pow-99.5.jpg','marked/HIP34536-w4-Cool-pow-99.5_m.gif','marked/HIP34536-rgb_m.gif'),(285,1,NULL,NULL,'HIP38430-w4-Cool-pow-99.5.jpg','HIP38430-rgb.jpg','HIP38430-w4-Heat-pow-99.5.jpg','HIP38430-w4-Hsv-pow-99.5.jpg',NULL,NULL),(286,1,NULL,NULL,'HIP62322-w4-Cool-pow-99.5.jpg','HIP62322-rgb.jpg','HIP62322-w4-Heat-pow-99.5.jpg','HIP62322-w4-Hsv-pow-99.5.jpg',NULL,NULL),(287,1,NULL,NULL,'HIP72510-w4-Cool-pow-99.5.jpg','HIP72510-rgb.jpg','HIP72510-w4-Heat-pow-99.5.jpg','HIP72510-w4-Hsv-pow-99.5.jpg',NULL,NULL),(288,1,NULL,NULL,'HIP75095-w4-Cool-pow-99.5.jpg','HIP75095-rgb.jpg','HIP75095-w4-Heat-pow-99.5.jpg','HIP75095-w4-Hsv-pow-99.5.jpg',NULL,NULL),(289,1,NULL,NULL,'HIP77391-w4-Cool-pow-99.5.jpg','HIP77391-rgb.jpg','HIP77391-w4-Heat-pow-99.5.jpg','HIP77391-w4-Hsv-pow-99.5.jpg',NULL,NULL),(290,1,NULL,NULL,'HIP81377-w4-Cool-pow-99.5.jpg','HIP81377-rgb.jpg','HIP81377-w4-Heat-pow-99.5.jpg','HIP81377-w4-Hsv-pow-99.5.jpg',NULL,NULL),(292,1,NULL,NULL,'HIP101186-w4-Cool-pow-99.5.jpg','HIP101186-rgb.jpg','HIP101186-w4-Heat-pow-99.5.jpg','HIP101186-w4-Hsv-pow-99.5.jpg',NULL,NULL),(293,1,'marked/bd433654-w4-Heat-pow-99.5_m.gif','marked/bd433654-w4-Hsv-pow-99.5_m.gif','bd433654-w4-Cool-pow-99.5.jpg','bd433654-rgb.jpg','bd433654-w4-Heat-pow-99.5.jpg','bd433654-w4-Hsv-pow-99.5.jpg','marked/bd433654-w4-Cool-pow-99.5_m.gif','marked/bd433654-rgb_m.gif'),(294,1,NULL,NULL,'HIP114990-w4-Cool-pow-99.5.jpg','HIP114990-rgb.jpg','HIP114990-w4-Heat-pow-99.5.jpg','HIP114990-w4-Hsv-pow-99.5.jpg',NULL,NULL),(295,1,NULL,NULL,'bd433654-w3-Cool-pow-99.5.jpg','bd433654-rgb.jpg','bd433654-w3-Heat-pow-99.5.jpg','bd433654-w3-Hsv-pow-99.5.jpg',NULL,NULL),(297,1,NULL,NULL,'HIP11891-w3-Cool-pow-99.5.jpg','HIP11891-rgb.jpg','HIP11891-w3-Heat-pow-99.5.jpg','HIP11891-w3-Hsv-pow-99.5.jpg',NULL,NULL),(298,1,'marked/HIP24575-w3-Heat-pow-99.5_m.gif','marked/HIP24575-w3-Hsv-pow-99.5_m.gif','HIP24575-w3-Cool-pow-99.5.jpg','HIP24575-rgb.jpg','HIP24575-w3-Heat-pow-99.5.jpg','HIP24575-w3-Hsv-pow-99.5.jpg','marked/HIP24575-w3-Cool-pow-99.5_m.gif','marked/HIP24575-rgb_m.gif'),(299,1,NULL,NULL,'HIP31766-w3-Cool-pow-99.5.jpg','HIP31766-rgb.jpg','HIP31766-w3-Heat-pow-99.5.jpg','HIP31766-w3-Hsv-pow-99.5.jpg',NULL,NULL),(300,1,NULL,NULL,'HIP32067-w3-Cool-pow-99.5.jpg','HIP32067-rgb.jpg','HIP32067-w3-Heat-pow-99.5.jpg','HIP32067-w3-Hsv-pow-99.5.jpg',NULL,NULL),(301,1,NULL,NULL,'HIP38430-w3-Cool-pow-99.5.jpg','HIP38430-rgb.jpg','HIP38430-w3-Heat-pow-99.5.jpg','HIP38430-w3-Hsv-pow-99.5.jpg',NULL,NULL),(302,1,NULL,NULL,'HIP81377-w3-Cool-pow-99.5.jpg','HIP81377-rgb.jpg','HIP81377-w3-Heat-pow-99.5.jpg','HIP81377-w3-Hsv-pow-99.5.jpg',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (2,'aaaa',35,'aa',NULL),(3,'yelomba',36,'lic',NULL),(5,'laura',39,'artista videojuegos',NULL),(6,'Diego',31,'Programador',NULL),(7,'Marcelo J Simeoni',34,'Animador 3D',NULL),(8,'Hernan Chirico',28,'Game Designer',NULL),(9,'Luciano',20,'Estudiante',NULL),(10,'sebas',29,'Investigador',NULL),(11,'Ivan',25,'Periodista',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_response`
--

LOCK TABLES `participant_response` WRITE;
/*!40000 ALTER TABLE `participant_response` DISABLE KEYS */;
INSERT INTO `participant_response` VALUES (1,1,293,10,'2017-08-26 13:14:16','training',1,1,1,NULL),(2,1,241,10,'2017-08-26 13:14:23','training',2,0,0,NULL),(3,1,298,10,'2017-08-26 13:14:31','training',3,1,1,NULL),(4,1,284,10,'2017-08-26 13:14:38','training',4,1,1,NULL),(5,1,268,10,'2017-08-26 13:14:43','training',5,0,0,NULL),(6,1,285,NULL,'2017-08-26 13:15:12','real',NULL,1,1,'rgb,cool,heat'),(7,1,264,NULL,'2017-08-26 13:15:24','real',NULL,0,0,'rgb,cool,heat,hsv'),(8,1,285,NULL,'2017-08-26 13:15:49','real',NULL,1,1,'rgb'),(9,1,267,NULL,'2017-08-26 13:16:05','real',NULL,0,0,'rgb'),(10,1,253,NULL,'2017-08-26 13:16:16','real',NULL,0,0,'rgb'),(11,1,269,NULL,'2017-08-26 13:16:23','real',NULL,0,0,'rgb'),(12,1,257,NULL,'2017-08-26 13:16:29','real',NULL,0,0,'rgb'),(13,1,283,NULL,'2017-08-26 13:16:44','real',NULL,1,1,'cool,heat'),(14,1,289,NULL,'2017-08-26 13:16:54','real',NULL,1,1,'rgb,cool,heat'),(15,1,266,NULL,'2017-08-26 13:17:04','real',NULL,0,0,'rgb'),(16,1,244,NULL,'2017-08-26 13:17:15','real',NULL,0,0,'rgb'),(17,1,274,NULL,'2017-08-26 13:17:24','real',NULL,1,1,'rgb,cool,heat'),(18,1,288,NULL,'2017-08-26 13:17:33','real',NULL,1,1,'rgb,cool'),(19,1,269,NULL,'2017-08-26 13:17:47','real',NULL,0,0,'rgb'),(20,1,281,NULL,'2017-08-26 13:17:52','real',NULL,1,1,'rgb'),(21,1,267,NULL,'2017-08-26 13:17:56','real',NULL,0,0,'rgb'),(22,3,293,10,'2017-08-26 14:48:13','training',1,1,1,NULL),(23,3,241,10,'2017-08-26 14:48:25','training',2,0,0,NULL),(24,3,298,10,'2017-08-26 14:50:32','training',3,1,1,NULL),(25,3,284,10,'2017-08-26 14:51:03','training',4,1,1,NULL),(26,3,268,10,'2017-08-26 14:51:13','training',5,0,0,NULL),(27,3,281,NULL,'2017-08-26 15:00:48','real',NULL,1,1,'rgb,cool,hsv'),(28,3,290,NULL,'2017-08-26 15:02:18','real',NULL,1,1,'rgb,cool,heat,hsv'),(29,3,290,NULL,'2017-08-26 15:02:36','real',NULL,1,1,'rgb,cool,heat,hsv'),(30,3,284,NULL,'2017-08-26 15:02:55','real',NULL,1,1,'rgb,cool,heat,hsv'),(31,3,234,NULL,'2017-08-26 15:03:12','real',NULL,0,0,'rgb,cool,heat,hsv'),(32,3,273,NULL,'2017-08-26 15:03:49','real',NULL,1,1,'rgb,cool,heat,hsv'),(33,3,267,NULL,'2017-08-26 15:07:48','real',NULL,0,0,'rgb,cool,heat,hsv'),(34,3,300,NULL,'2017-08-26 15:07:57','real',NULL,1,2,NULL),(35,3,258,NULL,'2017-08-26 15:08:02','real',NULL,0,2,NULL),(36,4,293,10,'2017-08-26 15:19:51','training',1,1,1,NULL),(37,4,241,10,'2017-08-26 15:20:00','training',2,0,0,NULL),(38,4,298,10,'2017-08-26 15:20:09','training',3,1,1,NULL),(39,4,284,10,'2017-08-26 15:20:22','training',4,1,1,NULL),(40,4,268,10,'2017-08-26 15:20:31','training',5,0,0,NULL),(41,4,293,NULL,'2017-08-26 15:21:52','real',NULL,1,1,'rgb,cool,heat,hsv'),(42,4,240,NULL,'2017-08-26 15:22:08','real',NULL,0,0,'rgb,cool,heat,hsv'),(43,4,300,NULL,'2017-08-26 15:22:19','real',NULL,1,1,'rgb'),(44,4,234,NULL,'2017-08-26 15:23:16','real',NULL,0,0,'rgb,cool,heat,hsv'),(45,4,270,NULL,'2017-08-26 15:23:49','real',NULL,0,0,'rgb,cool,heat,hsv'),(46,4,246,NULL,'2017-08-26 15:23:58','real',NULL,0,0,'rgb,cool,heat,hsv'),(47,4,275,NULL,'2017-08-26 15:24:13','real',NULL,1,1,'rgb,cool,heat,hsv'),(48,5,293,10,'2017-08-26 16:10:06','training',1,1,1,NULL),(49,5,241,10,'2017-08-26 16:10:12','training',2,0,0,NULL),(50,5,298,10,'2017-08-26 16:10:19','training',3,1,1,NULL),(51,5,284,10,'2017-08-26 16:10:26','training',4,1,1,NULL),(52,5,268,10,'2017-08-26 16:10:32','training',5,0,0,NULL),(53,5,294,NULL,'2017-08-26 16:11:34','real',NULL,1,1,'hsv'),(54,5,234,NULL,'2017-08-26 16:11:46','real',NULL,0,0,'cool,heat'),(55,5,272,NULL,'2017-08-26 16:12:03','real',NULL,0,0,'rgb,cool,heat,hsv'),(56,5,290,NULL,'2017-08-26 16:12:13','real',NULL,1,1,'rgb,cool,heat,hsv'),(57,5,257,NULL,'2017-08-26 16:12:26','real',NULL,0,0,'rgb,cool,heat,hsv'),(58,5,274,NULL,'2017-08-26 16:12:37','real',NULL,1,1,'rgb,cool,heat,hsv'),(59,5,256,NULL,'2017-08-26 16:12:47','real',NULL,0,0,'rgb,cool,heat,hsv'),(60,5,265,NULL,'2017-08-26 16:13:04','real',NULL,0,1,'rgb,cool,heat,hsv'),(61,5,248,NULL,'2017-08-26 16:13:26','real',NULL,0,0,'rgb,cool,heat,hsv'),(62,5,230,NULL,'2017-08-26 16:13:45','real',NULL,0,0,'rgb,cool,heat,hsv'),(63,5,251,NULL,'2017-08-26 16:13:55','real',NULL,0,0,'rgb,cool,heat,hsv'),(64,6,293,10,'2017-08-26 16:41:15','training',1,1,1,NULL),(65,6,241,10,'2017-08-26 16:41:30','training',2,0,0,NULL),(66,6,298,10,'2017-08-26 16:41:48','training',3,1,1,NULL),(67,6,284,10,'2017-08-26 16:42:06','training',4,1,1,NULL),(68,6,268,10,'2017-08-26 16:42:17','training',5,0,0,NULL),(69,6,259,NULL,'2017-08-26 16:43:21','real',NULL,0,0,'rgb,hsv'),(70,7,293,10,'2017-08-26 17:13:17','training',1,1,1,NULL),(71,7,241,10,'2017-08-26 17:13:21','training',2,0,0,NULL),(72,7,298,10,'2017-08-26 17:13:25','training',3,1,1,NULL),(73,7,284,10,'2017-08-26 17:13:31','training',4,1,1,NULL),(74,7,268,10,'2017-08-26 17:13:36','training',5,0,0,NULL),(75,7,273,NULL,'2017-08-26 17:14:07','real',NULL,1,1,'rgb,cool,heat,hsv'),(76,7,244,NULL,'2017-08-26 17:14:25','real',NULL,0,2,NULL),(77,7,243,NULL,'2017-08-26 17:14:46','real',NULL,0,1,'cool,heat,hsv'),(78,7,261,NULL,'2017-08-26 17:15:00','real',NULL,0,0,'rgb,cool,heat,hsv'),(79,7,293,NULL,'2017-08-26 17:15:09','real',NULL,1,1,'rgb,cool,heat,hsv'),(80,7,236,NULL,'2017-08-26 17:15:19','real',NULL,0,1,'rgb,cool,heat,hsv'),(81,7,281,NULL,'2017-08-26 17:15:42','real',NULL,1,1,'rgb,cool,heat,hsv'),(82,7,263,NULL,'2017-08-26 17:15:50','real',NULL,0,0,'rgb,cool,heat,hsv'),(83,7,267,NULL,'2017-08-26 17:15:59','real',NULL,0,0,'rgb,cool,heat,hsv'),(84,7,270,NULL,'2017-08-26 17:16:11','real',NULL,0,0,'rgb,cool,heat,hsv'),(85,7,252,NULL,'2017-08-26 17:16:31','real',NULL,0,2,NULL),(86,7,256,NULL,'2017-08-26 17:16:34','real',NULL,0,2,NULL),(87,7,275,NULL,'2017-08-26 17:16:43','real',NULL,1,1,'rgb,cool,heat,hsv'),(88,7,264,NULL,'2017-08-26 17:17:25','real',NULL,0,1,'rgb,cool,heat,hsv'),(89,7,289,NULL,'2017-08-26 17:17:43','real',NULL,1,1,'rgb,cool,heat,hsv'),(90,7,268,NULL,'2017-08-26 17:17:48','real',NULL,0,2,NULL),(91,7,281,NULL,'2017-08-26 17:17:55','real',NULL,1,1,'rgb,cool,heat,hsv'),(92,7,262,NULL,'2017-08-26 17:18:05','real',NULL,0,2,NULL),(93,7,281,NULL,'2017-08-26 17:18:11','real',NULL,1,1,'rgb,cool,heat,hsv'),(94,7,247,NULL,'2017-08-26 17:18:14','real',NULL,0,2,NULL),(95,7,267,NULL,'2017-08-26 17:18:16','real',NULL,0,2,NULL),(96,7,231,NULL,'2017-08-26 17:18:24','real',NULL,0,1,'rgb,cool,heat,hsv'),(97,7,258,NULL,'2017-08-26 17:18:26','real',NULL,0,2,NULL),(98,7,260,NULL,'2017-08-26 17:18:29','real',NULL,0,2,NULL),(99,7,279,NULL,'2017-08-26 17:18:39','real',NULL,1,1,'rgb,cool,heat,hsv'),(100,7,297,NULL,'2017-08-26 17:18:45','real',NULL,1,1,'rgb,cool,heat,hsv'),(101,7,289,NULL,'2017-08-26 17:18:53','real',NULL,1,1,'rgb,cool,heat,hsv'),(102,7,275,NULL,'2017-08-26 17:19:00','real',NULL,1,1,'rgb,cool,heat,hsv'),(103,7,242,NULL,'2017-08-26 17:19:14','real',NULL,0,1,'rgb,cool,heat,hsv'),(104,7,261,NULL,'2017-08-26 17:19:17','real',NULL,0,2,NULL),(105,7,292,NULL,'2017-08-26 17:19:24','real',NULL,1,1,'rgb,cool,heat,hsv'),(106,7,261,NULL,'2017-08-26 17:19:26','real',NULL,0,2,NULL),(107,7,293,NULL,'2017-08-26 17:19:34','real',NULL,1,1,'rgb,cool,heat,hsv'),(108,7,280,NULL,'2017-08-26 17:19:41','real',NULL,1,1,'rgb,cool,heat,hsv'),(109,7,289,NULL,'2017-08-26 17:19:48','real',NULL,1,1,'rgb,cool,heat,hsv'),(110,7,250,NULL,'2017-08-26 17:19:52','real',NULL,0,2,NULL),(111,7,263,NULL,'2017-08-26 17:20:01','real',NULL,0,0,'rgb,cool,heat,hsv'),(112,7,269,NULL,'2017-08-26 17:20:08','real',NULL,0,2,NULL),(113,7,268,NULL,'2017-08-26 17:20:10','real',NULL,0,2,NULL),(114,7,229,NULL,'2017-08-26 17:20:14','real',NULL,0,2,NULL),(115,7,259,NULL,'2017-08-26 17:20:16','real',NULL,0,2,NULL),(116,7,274,NULL,'2017-08-26 17:20:23','real',NULL,1,1,'rgb,cool,heat,hsv'),(117,7,231,NULL,'2017-08-26 17:20:33','real',NULL,0,1,'rgb,cool,heat,hsv'),(118,7,279,NULL,'2017-08-26 17:20:47','real',NULL,1,1,'rgb,cool,heat,hsv'),(119,7,261,NULL,'2017-08-26 17:20:55','real',NULL,0,0,'rgb,cool,heat,hsv'),(120,7,266,NULL,'2017-08-26 17:20:58','real',NULL,0,2,NULL),(121,7,262,NULL,'2017-08-26 17:21:07','real',NULL,0,0,'rgb,cool,heat,hsv'),(122,7,252,NULL,'2017-08-26 17:21:14','real',NULL,0,0,'rgb,cool,heat,hsv'),(123,7,278,NULL,'2017-08-26 17:21:24','real',NULL,1,1,'rgb,cool,heat,hsv'),(124,7,266,NULL,'2017-08-26 17:21:39','real',NULL,0,0,'rgb,cool,heat,hsv'),(125,7,270,NULL,'2017-08-26 17:21:56','real',NULL,0,0,'rgb,cool,heat,hsv'),(126,7,233,NULL,'2017-08-26 17:22:05','real',NULL,0,1,'rgb,cool,heat,hsv'),(127,7,284,NULL,'2017-08-26 17:22:13','real',NULL,1,1,'rgb,cool,heat,hsv'),(128,7,233,NULL,'2017-08-26 17:22:18','real',NULL,0,2,NULL),(129,7,277,NULL,'2017-08-26 17:22:36','real',NULL,1,1,'rgb,cool,heat,hsv'),(130,7,273,NULL,'2017-08-26 17:22:43','real',NULL,1,1,'rgb,cool,heat,hsv'),(131,7,272,NULL,'2017-08-26 17:22:52','real',NULL,0,0,'rgb,cool,heat,hsv'),(132,7,236,NULL,'2017-08-26 17:22:55','real',NULL,0,2,NULL),(133,7,295,NULL,'2017-08-26 17:23:03','real',NULL,1,1,'rgb,cool,heat,hsv'),(134,7,285,NULL,'2017-08-26 17:23:40','real',NULL,1,1,'rgb,cool,heat,hsv'),(135,7,233,NULL,'2017-08-26 17:23:44','real',NULL,0,2,NULL),(136,7,285,NULL,'2017-08-26 17:23:50','real',NULL,1,1,'rgb,cool,heat,hsv'),(137,7,274,NULL,'2017-08-26 17:24:02','real',NULL,1,1,'rgb,cool,heat,hsv'),(138,7,235,NULL,'2017-08-26 17:24:15','real',NULL,0,1,'rgb,cool,heat'),(139,7,254,NULL,'2017-08-26 17:24:18','real',NULL,0,2,NULL),(140,7,265,NULL,'2017-08-26 17:24:27','real',NULL,0,0,'rgb,cool,heat,hsv'),(141,7,261,NULL,'2017-08-26 17:24:39','real',NULL,0,0,'rgb,cool,heat,hsv'),(142,7,300,NULL,'2017-08-26 17:24:51','real',NULL,1,1,'rgb,cool,heat,hsv'),(143,7,283,NULL,'2017-08-26 17:24:59','real',NULL,1,1,'rgb,cool,heat,hsv'),(144,7,229,NULL,'2017-08-26 17:25:03','real',NULL,0,2,NULL),(145,7,234,NULL,'2017-08-26 17:25:05','real',NULL,0,2,NULL),(146,7,277,NULL,'2017-08-26 17:25:17','real',NULL,1,1,'rgb,cool,heat,hsv'),(147,8,293,10,'2017-08-26 17:41:31','training',1,1,1,NULL),(148,8,241,10,'2017-08-26 17:41:47','training',2,0,0,NULL),(149,8,298,10,'2017-08-26 17:42:01','training',3,1,1,NULL),(150,8,284,10,'2017-08-26 17:42:14','training',4,1,1,NULL),(151,8,268,10,'2017-08-26 17:42:31','training',5,0,0,NULL),(152,8,247,NULL,'2017-08-26 17:44:08','real',NULL,0,0,'rgb,cool,heat,hsv'),(153,8,245,NULL,'2017-08-26 17:44:36','real',NULL,0,0,'rgb,cool,heat,hsv'),(154,8,252,NULL,'2017-08-26 17:44:48','real',NULL,0,0,'rgb,cool,heat,hsv'),(155,8,241,NULL,'2017-08-26 17:45:00','real',NULL,0,0,'rgb,cool,heat,hsv'),(156,8,297,NULL,'2017-08-26 17:45:28','real',NULL,1,1,'rgb,cool,heat,hsv'),(157,8,292,NULL,'2017-08-26 17:45:57','real',NULL,1,1,'rgb,cool,heat,hsv'),(158,8,238,NULL,'2017-08-26 17:46:38','real',NULL,0,0,'rgb,cool,heat'),(159,8,261,NULL,'2017-08-26 17:46:56','real',NULL,0,0,'rgb,cool,heat,hsv'),(160,8,281,NULL,'2017-08-26 17:47:15','real',NULL,1,1,'rgb,heat'),(161,8,262,NULL,'2017-08-26 17:47:31','real',NULL,0,0,'rgb,cool,heat,hsv'),(162,8,256,NULL,'2017-08-26 17:48:56','real',NULL,0,0,'rgb,cool,heat,hsv'),(163,8,294,NULL,'2017-08-26 17:49:15','real',NULL,1,1,'rgb'),(164,8,265,NULL,'2017-08-26 17:50:17','real',NULL,0,1,'hsv'),(165,9,293,10,'2017-08-26 18:16:52','training',1,1,1,NULL),(166,9,241,10,'2017-08-26 18:17:02','training',2,0,0,NULL),(167,9,298,10,'2017-08-26 18:17:09','training',3,1,1,NULL),(168,9,284,10,'2017-08-26 18:17:17','training',4,1,1,NULL),(169,9,268,10,'2017-08-26 18:17:24','training',5,0,0,NULL),(170,9,229,NULL,'2017-08-26 18:19:08','real',NULL,0,0,'rgb,cool,heat'),(171,9,267,NULL,'2017-08-26 18:19:27','real',NULL,0,0,'rgb,cool,heat,hsv'),(172,9,254,NULL,'2017-08-26 18:19:39','real',NULL,0,0,'rgb,cool,heat,hsv'),(173,9,258,NULL,'2017-08-26 18:21:03','real',NULL,0,0,'cool,heat,hsv'),(174,9,284,NULL,'2017-08-26 18:21:14','real',NULL,1,1,'cool,heat,hsv'),(175,9,245,NULL,'2017-08-26 18:21:30','real',NULL,0,0,'rgb,cool,heat'),(176,9,267,NULL,'2017-08-26 18:22:01','real',NULL,0,0,'cool,heat,hsv');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_session`
--

LOCK TABLES `participant_session` WRITE;
/*!40000 ALTER TABLE `participant_session` DISABLE KEYS */;
INSERT INTO `participant_session` VALUES (1,2,'vjs640j232c5kgstp1gjp9j0u3','2017-08-26 13:13:00','2017-08-26 13:18:03',50,4,100,10,NULL),(2,3,'vjs640j232c5kgstp1gjp9j0u3','2017-08-26 13:27:41',NULL,0,1,NULL,NULL,NULL),(3,5,'fvnupj5ol7trb5n4htvhfo56o6','2017-08-26 14:46:12','2017-08-26 15:08:03',50,1,100,10,NULL),(4,6,'fvnupj5ol7trb5n4htvhfo56o6','2017-08-26 15:17:41','2017-08-26 15:25:57',50,4,100,9,NULL),(5,7,'fvnupj5ol7trb5n4htvhfo56o6','2017-08-26 16:08:16','2017-08-26 16:13:56',50,1,100,10,NULL),(6,8,'fvnupj5ol7trb5n4htvhfo56o6','2017-08-26 16:33:40','2017-08-26 16:49:50',50,4,100,10,NULL),(7,9,'fvnupj5ol7trb5n4htvhfo56o6','2017-08-26 17:11:58','2017-08-26 17:25:22',50,4,100,8,NULL),(8,10,'fvnupj5ol7trb5n4htvhfo56o6','2017-08-26 17:38:54','2017-08-26 17:51:31',50,1,100,8,NULL),(9,11,'fvnupj5ol7trb5n4htvhfo56o6','2017-08-26 18:14:50','2017-08-26 18:24:07',50,1,100,8,NULL);
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

-- Dump completed on 2017-10-25 20:42:09
