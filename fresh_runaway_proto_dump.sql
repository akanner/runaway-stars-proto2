-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: expo_ludica_dev
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_parameter`
--

LOCK TABLES `app_parameter` WRITE;
/*!40000 ALTER TABLE `app_parameter` DISABLE KEYS */;
INSERT INTO `app_parameter` VALUES (1,'MAX_QUESTIONS','7'),(2,'CORRECT_ANSWER_TEXT','Respuesta correcta!'),(3,'INCORRECT_ANSWER_TEXT','Respuesta Incorrecta!'),(4,'LEVELS_BEGINNER_TEXT','Principiante'),(5,'LEVELS_BEGINNER_LEGEND','Ten&eacute;s que seguir practicando!'),(6,'LEVELS_INTERMEDIATE_TEXT','Intermedio'),(7,'LEVELS_INTERMEDIATE_LEGEND','Buen Trabajo...pero pod&eacute;s mejorar!'),(8,'LEVELS_EXPERT_TEXT','Experto'),(9,'LEVELS_EXPERT_LEGEND','Seguro qu&eacute; no sos un astr&oacute;nomo?'),(10,'BADGES_BEGINNER_LEGEND','Ganaste la insignia de principiante </br> &iquest;te anim&aacute;s a ganar la siguiente?'),(11,'BADGES_INTERMEDIATE_LEGEND','&iexcl;Buen Trabajo, ganaste la insignia intermedia! </br> Demostraste que ya pod&eacute;s identificar algunas runaway stars </br> ...pero todavia pod&eacute;s mejorar!'),(12,'BADGES_EXPERT_LEGEND','Ganaste la insignia de experto! </br> &iquest;Seguro qu&eacute; no sos un astr&oacute;nomo?'),(13,'BADGES_BEGINNER_BADGE','beginner_badge.png'),(14,'BADGES_INTERMEDIATE_BADGE','intermediate_badge.png'),(15,'BADGES_EXPERT_BADGE','expert_badge.png'),(16,'MINIMUM_PERCENTAGE_INTERMEDIATE_LEVEL','50'),(17,'MINIMUM_PERCENTAGE_EXPERT_LEVEL','80'),(18,'SHOW_USER_SESSION','0'),(19,'POINTS_CORRECT_RESPONSE','10'),(20,'POINTS_INCORRECT_RESPONSE','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=big5;
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
  `images_used_to_respond` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participant_response_image1_idx` (`image_served_id`),
  KEY `fk_participant_response_session_participant_idx` (`session_id`),
  KEY `fk_participant_response_training_task_idx` (`training_task_id`),
  CONSTRAINT `fk_participant_response_image1` FOREIGN KEY (`image_served_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_session` FOREIGN KEY (`session_id`) REFERENCES `participant_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_response_training_task` FOREIGN KEY (`training_task_id`) REFERENCES `training_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=big5;
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=big5;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_task`
--

LOCK TABLES `training_task` WRITE;
/*!40000 ALTER TABLE `training_task` DISABLE KEYS */;
INSERT INTO `training_task` VALUES (1,1,'En la imagen hay un arco!',293),(2,2,'No hay un arco en la imagen.\n',241),(3,3,'En la imagen hay un arco!',298),(4,4,'En la imagen hay un arco!',284),(5,5,'No hay un arco en la imagen.',268);
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

-- Dump completed on 2019-08-03 11:55:25
