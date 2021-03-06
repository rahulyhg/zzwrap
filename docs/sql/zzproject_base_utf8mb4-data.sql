-- MySQL dump 10.13  Distrib 5.7.21, for osx10.12 (x86_64)
--
-- Host: localhost    Database: zzproject_base_utf8mb4
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Current Database: `zzproject_base_utf8mb4`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zzproject_base_utf8mb4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `zzproject_base_utf8mb4`;

--
-- Table structure for table `_logging`
--

DROP TABLE IF EXISTS `_logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_id` int(10) unsigned DEFAULT NULL,
  `user` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_logging`
--

LOCK TABLES `_logging` WRITE;
/*!40000 ALTER TABLE `_logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `_logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_relations`
--

DROP TABLE IF EXISTS `_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_relations` (
  `rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_db` varchar(127) COLLATE latin1_general_cs NOT NULL,
  `master_table` varchar(127) COLLATE latin1_general_cs NOT NULL,
  `master_field` varchar(127) COLLATE latin1_general_cs NOT NULL,
  `detail_db` varchar(127) COLLATE latin1_general_cs NOT NULL,
  `detail_table` varchar(127) COLLATE latin1_general_cs NOT NULL,
  `detail_field` varchar(127) COLLATE latin1_general_cs NOT NULL,
  `delete` enum('delete','ask','no-delete','update') COLLATE latin1_general_cs NOT NULL DEFAULT 'no-delete',
  `detail_id_field` varchar(127) COLLATE latin1_general_cs NOT NULL,
  `detail_url` varchar(63) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`rel_id`),
  UNIQUE KEY `master_db` (`master_db`,`master_table`,`master_field`,`detail_db`,`detail_table`,`detail_field`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_relations`
--

LOCK TABLES `_relations` WRITE;
/*!40000 ALTER TABLE `_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_settings`
--

DROP TABLE IF EXISTS `_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_settings` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_id` int(10) unsigned DEFAULT NULL,
  `setting_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `explanation` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `setting_key_login_id` (`setting_key`,`login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_settings`
--

LOCK TABLES `_settings` WRITE;
/*!40000 ALTER TABLE `_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_translationfields`
--

DROP TABLE IF EXISTS `_translationfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_translationfields` (
  `translationfield_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `table_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `field_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `field_type` enum('varchar','text') COLLATE latin1_general_cs NOT NULL DEFAULT 'varchar',
  PRIMARY KEY (`translationfield_id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`field_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_translationfields`
--

LOCK TABLES `_translationfields` WRITE;
/*!40000 ALTER TABLE `_translationfields` DISABLE KEYS */;
INSERT INTO `_translationfields` VALUES (1,'zzproject_base_utf8mb4','text','text','varchar');
/*!40000 ALTER TABLE `_translationfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_translations_text`
--

DROP TABLE IF EXISTS `_translations_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_translations_text` (
  `translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `translationfield_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `translation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`translation_id`),
  UNIQUE KEY `field_id` (`field_id`,`translationfield_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `translationfield_id` (`translationfield_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_translations_text`
--

LOCK TABLES `_translations_text` WRITE;
/*!40000 ALTER TABLE `_translations_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `_translations_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_translations_varchar`
--

DROP TABLE IF EXISTS `_translations_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_translations_varchar` (
  `translation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `translationfield_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `translation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`translation_id`),
  UNIQUE KEY `field_id` (`field_id`,`translationfield_id`,`language_id`),
  KEY `translationfield_id` (`translationfield_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_translations_varchar`
--

LOCK TABLES `_translations_varchar` WRITE;
/*!40000 ALTER TABLE `_translations_varchar` DISABLE KEYS */;
INSERT INTO `_translations_varchar` VALUES (1,1,2,'Kategorien',105,'2013-08-16 12:51:51'),(2,1,3,'Kategorie',105,'2013-08-16 12:52:50'),(3,1,7,'Hauptkategorie',105,'2013-08-16 12:52:58'),(4,1,9,'nein',105,'2013-08-16 12:54:51'),(5,1,1,'Länder',105,'2013-08-16 12:56:08'),(6,1,12,'Land',105,'2013-08-16 12:56:15'),(7,1,10,'Ländercode',105,'2013-08-16 12:56:22'),(8,1,20,'Sprache, englisch',105,'2013-08-16 12:56:45'),(9,1,21,'Sprache, französisch',105,'2013-08-16 12:56:55'),(10,1,22,'Sprache, deutsch',105,'2013-08-16 12:57:07'),(11,1,15,'Sprachen',105,'2013-08-16 12:57:19'),(12,1,8,'ja',105,'2013-08-16 12:57:29'),(13,1,50,'Reihenfolge',105,'2013-08-16 12:57:37'),(14,1,24,'Titel',105,'2013-08-16 12:57:40'),(15,1,23,'Webseiten',105,'2013-08-16 12:57:54'),(16,1,5,'Stand',105,'2013-08-16 12:59:10'),(17,1,28,'Unterseite&nbsp;von',105,'2013-08-16 12:59:24'),(18,1,33,'oben',105,'2013-08-16 12:59:30'),(19,1,32,'keine',105,'2013-08-16 12:59:40'),(20,1,25,'Inhalt',105,'2013-08-16 13:00:22'),(21,1,48,'Ordner',105,'2013-08-16 13:00:26'),(22,1,46,'Medienpool',105,'2013-08-16 13:00:32'),(23,1,53,'Quelle',105,'2013-08-16 13:00:38'),(24,1,57,'Sie sind hier:',105,'2013-08-16 13:00:46'),(25,1,4,'Beschreibung',105,'2013-08-16 13:00:53'),(26,1,6,'Kennung',105,'2013-08-16 13:00:59'),(27,1,36,'Adresse der Seite, sollte hierarchisch aufgebaut sein, ohne <code>/</code> am Ende!<br>Die Kennung sollte nur Kleinbuchstaben (<code>a-z</code>), Ziffern (<code>0-9</code>) und das <code>-</code> Zeichen enthalten.',105,'2013-08-16 13:06:39'),(28,1,27,'Folge',105,'2013-08-16 13:07:27'),(29,1,29,'Öffentlich?',105,'2013-08-16 13:07:42'),(30,1,31,'Menü',105,'2013-08-16 13:08:01'),(31,1,34,'unten',105,'2013-08-16 13:08:27'),(32,1,58,'intern',105,'2013-08-16 13:08:41'),(33,1,26,'Endung',105,'2013-08-16 13:10:17'),(34,1,30,'WWW?',105,'2013-08-16 13:11:10'),(35,1,47,'Datei',105,'2013-08-16 13:11:38'),(36,1,13,'Ländercode gemäß ISO 3166',105,'2013-08-16 13:15:01'),(37,1,55,'um',105,'2013-08-16 13:33:04'),(38,1,49,'Der Dateiname wird als Wert benutzt, wenn nichts eingegeben wird.',105,'2013-08-16 13:37:21'),(39,1,54,'Uhr',105,'2013-08-16 13:37:47'),(40,1,59,'Farbiger Rand: Medium ist veröffentlicht; grauer Rand: Medium ist nicht veröffentlicht.',105,'2013-08-16 13:40:25'),(41,1,60,'Digitales Photo: wenn hier nichts eingegeben wird, werden die Daten aus der Datei ausgelesen.',105,'2013-08-16 13:49:29'),(42,1,61,'Dateityp des Vorschaubilds. JPEG ist gut für photos, PNG/GIF für Strichzeichnungen.',105,'2013-08-16 13:54:42'),(43,1,52,'Falls es kein selbst erstelltes Medium ist, woher kommt es?',105,'2013-08-16 13:55:19'),(44,1,62,'Typ Vorschaubild',105,'2013-08-16 13:57:49'),(45,1,63,'Darstellung als Galerie',105,'2013-08-16 13:59:36'),(46,1,64,'Darstellung als Tabelle',105,'2013-08-16 14:00:02'),(47,1,65,'ID',105,'2013-08-16 14:00:38'),(48,1,66,'Übersetzungsfeld',105,'2013-08-16 14:01:55'),(49,1,67,'Dateigröße',105,'2013-08-16 14:02:22'),(50,1,68,'MD5',105,'2013-08-16 14:03:05'),(51,1,69,'Text',105,'2013-08-16 14:03:43'),(52,1,70,'Sprache',105,'2013-08-16 14:04:00'),(53,1,71,'Übersetzung auf',105,'2013-08-16 14:04:44'),(54,1,17,'Sprachcode ISO 639-1',105,'2013-08-16 14:08:10'),(55,1,18,'Sprachcode ISO 639-2, bibliographisch',105,'2013-08-16 14:08:32'),(56,1,19,'Sprachcode ISO 639-2, Terminologie',105,'2013-08-16 14:08:46'),(57,1,16,'Soll Sprache auf Website genutzt werden?',105,'2013-08-16 14:09:02'),(58,1,14,'Soll Land auf Website genutzt werden?',105,'2013-08-16 14:09:14'),(59,1,11,'Website',105,'2013-08-16 14:09:19'),(60,1,72,'Uhrzeit',105,'2013-08-16 14:10:22'),(61,1,73,'Version',105,'2013-08-16 14:10:56'),(62,1,74,'Medium',105,'2013-08-16 14:11:41'),(63,1,75,'Bereich',105,'2013-08-16 14:55:33'),(64,1,76,'Logins',105,'2013-08-16 15:05:20'),(65,1,77,'Person',105,'2013-08-16 15:05:28'),(66,1,78,'PW ändern?',105,'2013-08-16 15:05:47'),(67,1,79,'Eingeloggt',105,'2013-08-16 15:05:55'),(68,1,80,'Klick',105,'2013-08-16 15:05:59'),(69,1,81,'Aktiv',105,'2013-08-16 15:06:05'),(70,1,82,'Um ein Login zu deaktivieren',105,'2013-08-16 15:06:15'),(71,1,83,'Letzte Aktivität in Datenbank',105,'2013-08-16 15:06:26'),(72,1,84,'»Ja« bedeutet, daß der Benutzer sein Paßwort beim nächsten Login ändern muß.',105,'2013-08-16 15:07:04'),(73,1,85,'Paßwort',105,'2013-08-16 15:07:20');
/*!40000 ALTER TABLE `_translations_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_uris`
--

DROP TABLE IF EXISTS `_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_uris` (
  `uri_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uri_scheme` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `uri_host` varchar(63) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `uri_path` varchar(127) COLLATE latin1_general_ci NOT NULL,
  `uri_query` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `content_type` varchar(127) COLLATE latin1_general_ci NOT NULL,
  `character_encoding` varchar(31) COLLATE latin1_general_ci DEFAULT NULL,
  `content_length` mediumint(8) unsigned NOT NULL,
  `user` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT 'none',
  `status_code` smallint(6) NOT NULL,
  `etag_md5` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `hits` int(10) unsigned NOT NULL,
  `first_access` datetime NOT NULL,
  `last_access` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uri_id`),
  UNIQUE KEY `uri_scheme_uri_host_uri_path_uri_query_user` (`uri_scheme`,`uri_host`,`uri_path`,`uri_query`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_uris`
--

LOCK TABLES `_uris` WRITE;
/*!40000 ALTER TABLE `_uris` DISABLE KEYS */;
/*!40000 ALTER TABLE `_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `main_category_id` int(10) unsigned DEFAULT NULL,
  `path` varchar(63) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `parameters` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `sequence` tinyint(3) unsigned DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `path` (`path`),
  KEY `main_category_id` (`main_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` char(2) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `country` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` enum('yes','no') CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT 'no',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_code` (`country_code`),
  KEY `website` (`website`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan','no'),(2,'AL','Albania','no'),(3,'DZ','Algeria','no'),(4,'AS','American Samoa','no'),(5,'AD','Andorra','no'),(6,'AO','Angola','no'),(7,'AI','Anguilla','no'),(8,'AQ','Antarctica','no'),(9,'AG','Antigua and Barbuda','no'),(10,'AR','Argentina','no'),(11,'AM','Armenia','no'),(12,'AW','Aruba','no'),(13,'AU','Australia','no'),(14,'AT','Austria','no'),(15,'AZ','Azerbaijan','no'),(16,'BS','Bahamas','no'),(17,'BH','Bahrain','no'),(18,'BD','Bangladesh','no'),(19,'BB','Barbados','no'),(20,'BY','Belarus','yes'),(21,'BE','Belgium','no'),(22,'BZ','Belize','no'),(23,'BJ','Benin','no'),(24,'BM','Bermuda','no'),(25,'BT','Bhutan','no'),(26,'BO','Bolivia','no'),(27,'BA','Bosnia and Herzegovina','no'),(28,'BW','Botswana','no'),(29,'BV','Bouvet Island','no'),(30,'BR','Brazil','no'),(31,'IO','British Indian Ocean Territory','no'),(32,'BN','Brunei Darussalam','no'),(33,'BG','Bulgaria','no'),(34,'BF','Burkina Faso','no'),(35,'BI','Burundi','no'),(36,'KH','Cambodia','no'),(37,'CM','Cameroon','no'),(38,'CA','Canada','no'),(39,'CV','Cape Verde','no'),(40,'KY','Cayman Islands','no'),(41,'CF','Central African Republic','no'),(42,'TD','Chad','no'),(43,'CL','Chile','no'),(44,'CN','China','no'),(45,'CX','Christmas Island','no'),(46,'CC','Cocos (Keeling) Islands','no'),(47,'CO','Colombia','no'),(48,'KM','Comoros','no'),(49,'CG','Congo','no'),(50,'CD','Congo, The Democratic Republic of the','no'),(51,'CK','Cook Islands','no'),(52,'CR','Costa Rica','no'),(53,'CI','Cote D\'Ivoire','no'),(54,'HR','Croatia','no'),(55,'CU','Cuba','no'),(56,'CY','Cyprus','no'),(57,'CZ','Czech Republic','no'),(58,'DK','Denmark','no'),(59,'DJ','Djibouti','no'),(60,'DM','Dominica','no'),(61,'DO','Dominican Republic','no'),(62,'EC','Ecuador','no'),(63,'EG','Egypt','no'),(64,'SV','El Salvador','no'),(65,'GQ','Equatorial Guinea','no'),(66,'ER','Eritrea','no'),(67,'EE','Estonia','no'),(68,'ET','Ethiopia','no'),(69,'FK','Falkland Islands (Malvinas)','no'),(70,'FO','Faroe Islands','no'),(71,'FJ','Fiji','no'),(72,'FI','Finland','no'),(73,'FR','France','no'),(74,'GF','French Guiana','no'),(75,'PF','French Polynesia','no'),(76,'TF','French Southern Territories','no'),(77,'GA','Gabon','no'),(78,'GM','Gambia','no'),(79,'GE','Georgia','no'),(80,'DE','Germany','yes'),(81,'GH','Ghana','no'),(82,'GI','Gibraltar','no'),(83,'GR','Greece','no'),(84,'GL','Greenland','no'),(85,'GD','Grenada','no'),(86,'GP','Guadeloupe','no'),(87,'GU','Guam','no'),(88,'GT','Guatemala','no'),(89,'GN','Guinea','no'),(90,'GW','Guinea-Bissau','no'),(91,'GY','Guyana','no'),(92,'HT','Haiti','no'),(93,'HM','Heard Island and Mcdonald Islands','no'),(94,'VA','Holy See (Vatican City State)','no'),(95,'HN','Honduras','no'),(96,'HK','Hong Kong','no'),(97,'HU','Hungary','no'),(98,'IS','Iceland','no'),(99,'IN','India','no'),(100,'ID','Indonesia','no'),(101,'IR','Iran, Islamic Republic Of','no'),(102,'IQ','Iraq','no'),(103,'IE','Ireland','no'),(104,'IL','Israel','no'),(105,'IT','Italy','no'),(106,'JM','Jamaica','no'),(107,'JP','Japan','no'),(108,'JO','Jordan','no'),(109,'KZ','Kazakhstan','no'),(110,'KE','Kenya','no'),(111,'KI','Kiribati','no'),(112,'KP','Korea, Democratic People\'s Republic of','no'),(113,'KR','Korea, Republic of','no'),(114,'KW','Kuwait','no'),(115,'KG','Kyrgyzstan','no'),(116,'LA','Lao People\'s Democratic Republic','no'),(117,'LV','Latvia','no'),(118,'LB','Lebanon','no'),(119,'LS','Lesotho','no'),(120,'LR','Liberia','no'),(121,'LY','Libyan Arab Jamahiriya','no'),(122,'LI','Liechtenstein','no'),(123,'LT','Lithuania','no'),(124,'LU','Luxembourg','no'),(125,'MO','Macao','no'),(126,'MK','Macedonia, The Former Yugoslav Republic of','no'),(127,'MG','Madagascar','no'),(128,'MW','Malawi','no'),(129,'MY','Malaysia','no'),(130,'MV','Maldives','no'),(131,'ML','Mali','no'),(132,'MT','Malta','no'),(133,'MH','Marshall Islands','no'),(134,'MQ','Martinique','no'),(135,'MR','Mauritania','no'),(136,'MU','Mauritius','no'),(137,'YT','Mayotte','no'),(138,'MX','Mexico','no'),(139,'FM','Micronesia, Federated States of','no'),(140,'MD','Moldova, Republic of','no'),(141,'MC','Monaco','no'),(142,'MN','Mongolia','no'),(143,'MS','Montserrat','no'),(144,'MA','Morocco','no'),(145,'MZ','Mozambique','no'),(146,'MM','Myanmar','no'),(147,'NA','Namibia','no'),(148,'NR','Nauru','no'),(149,'NP','Nepal','no'),(150,'NL','Netherlands','no'),(151,'AN','Netherlands Antilles','no'),(152,'NC','New Caledonia','no'),(153,'NZ','New Zealand','no'),(154,'NI','Nicaragua','no'),(155,'NE','Niger','no'),(156,'NG','Nigeria','no'),(157,'NU','Niue','no'),(158,'NF','Norfolk Island','no'),(159,'MP','Northern Mariana Islands','no'),(160,'NO','Norway','no'),(161,'OM','Oman','no'),(162,'PK','Pakistan','no'),(163,'PW','Palau','no'),(164,'PS','Palestinian Territory, Occupied','no'),(165,'PA','Panama','no'),(166,'PG','Papua New Guinea','no'),(167,'PY','Paraguay','no'),(168,'PE','Peru','no'),(169,'PH','Philippines','no'),(170,'PN','Pitcairn','no'),(171,'PL','Poland','yes'),(172,'PT','Portugal','no'),(173,'PR','Puerto Rico','no'),(174,'QA','Qatar','no'),(175,'RE','Reunion','no'),(176,'RO','Romania','no'),(177,'RU','Russian Federation','no'),(178,'RW','Rwanda','no'),(179,'SH','Saint Helena','no'),(180,'KN','Saint Kitts and Nevis','no'),(181,'LC','Saint Lucia','no'),(182,'PM','Saint Pierre and Miquelon','no'),(183,'VC','Saint Vincent and The grenadines','no'),(184,'WS','Samoa','no'),(185,'SM','San Marino','no'),(186,'ST','Sao Tome and Principe','no'),(187,'SA','Saudi Arabia','no'),(188,'SN','Senegal','no'),(189,'CS','Serbia and Montenegro','no'),(190,'SC','Seychelles','no'),(191,'SL','Sierra Leone','no'),(192,'SG','Singapore','no'),(193,'SK','Slovakia','no'),(194,'SI','Slovenia','no'),(195,'SB','Solomon Islands','no'),(196,'SO','Somalia','no'),(197,'ZA','South Africa','no'),(198,'GS','South Georgia and the South Sandwich Islands','no'),(199,'ES','Spain','no'),(200,'LK','Sri Lanka','no'),(201,'SD','Sudan','no'),(202,'SR','Suriname','no'),(203,'SJ','Svalbard and Jan Mayen','no'),(204,'SZ','Swaziland','no'),(205,'SE','Sweden','no'),(206,'CH','Switzerland','no'),(207,'SY','Syrian Arab Republic','no'),(208,'TW','Taiwan, Province of China','no'),(209,'TJ','Tajikistan','no'),(210,'TZ','Tanzania, United Republic of','no'),(211,'TH','Thailand','no'),(212,'TL','Timor-Leste','no'),(213,'TG','Togo','no'),(214,'TK','Tokelau','no'),(215,'TO','Tonga','no'),(216,'TT','Trinidad and Tobago','no'),(217,'TN','Tunisia','no'),(218,'TR','Turkey','no'),(219,'TM','Turkmenistan','no'),(220,'TC','Turks And Caicos Islands','no'),(221,'TV','Tuvalu','no'),(222,'UG','Uganda','no'),(223,'UA','Ukraine','no'),(224,'AE','United Arab Emirates','no'),(225,'GB','United Kingdom','no'),(226,'US','United States','no'),(227,'UM','United States Minor Outlying Islands','no'),(228,'UY','Uruguay','no'),(229,'UZ','Uzbekistan','no'),(230,'VU','Vanuatu','no'),(231,'VE','Venezuela','no'),(232,'VN','Viet Nam','no'),(233,'VG','Virgin Islands, British','no'),(234,'VI','Virgin Islands, U.S.','no'),(235,'WF','Wallis And Futuna','no'),(236,'EH','Western Sahara','no'),(237,'YE','Yemen','no'),(238,'ZM','Zambia','no'),(239,'ZW','Zimbabwe','no');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filetypes`
--

DROP TABLE IF EXISTS `filetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filetypes` (
  `filetype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filetype` varchar(7) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `mime_content_type` varchar(31) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `mime_subtype` varchar(127) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `filetype_description` varchar(63) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(7) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`filetype_id`),
  UNIQUE KEY `filetype` (`filetype`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filetypes`
--

LOCK TABLES `filetypes` WRITE;
/*!40000 ALTER TABLE `filetypes` DISABLE KEYS */;
INSERT INTO `filetypes` VALUES (1,'jpeg','image','jpeg','JPEG Image','jpeg'),(2,'gif','image','gif','GIF Image','gif'),(3,'pdf','application','pdf','Portable Document Format','pdf'),(4,'txt','text','plain','Text File','txt'),(5,'html','text','html','Hypertext Markup Language','html'),(6,'tiff','image','tiff','TIFF Image','tif'),(7,'png','image','png','Portable Network Graphic','png'),(8,'rtf','text','rtf','Rich Text Format','rtf'),(9,'xls','application','vnd.ms-excel','MS Excel Document','xls'),(10,'3gp','video','3gpp','3GPP-Video','3gp'),(11,'zip','application','zip','ZIP Archive','zip'),(12,'doc','application','msword','MS Word Document','doc'),(14,'mdb','application','msaccess','MS Access Database','mdb'),(15,'dot','application','msword','MS Word Document Template','dot'),(16,'folder','example','x-folder',NULL,''),(17,'css','text','css','Cascading Stylesheets','css'),(18,'js','application','javascript','JavaScript','js');
/*!40000 ALTER TABLE `filetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iso_639_2t` char(3) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `iso_639_2b` char(3) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `iso_639_1` char(2) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `language_de` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_fr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` enum('yes','no') CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT 'no',
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `iso_639_2t` (`iso_639_2t`),
  KEY `website` (`website`)
) ENGINE=MyISAM AUTO_INCREMENT=486 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'aar',NULL,'aa','Afar','Afar','afar','no'),(2,'abk',NULL,'ab','Abchasisch','Abkhazian','abkhaze','no'),(3,'ace',NULL,NULL,'Aceh-Sprache','Achinese','aceh','no'),(4,'ach',NULL,NULL,'Acholi-Sprache','Acoli','acoli','no'),(5,'ada',NULL,NULL,'Adangme-Sprache','Adangme','adangme','no'),(6,'ady',NULL,NULL,'Adygisch','Adyghe; Adygei','adyghé','no'),(7,'afa',NULL,NULL,'Hamitosemitische Sprachen (Andere)','Afro-Asiatic (Other)','afro-asiatiques, autres langues','no'),(8,'afh',NULL,NULL,'Afrihili','Afrihili','afrihili','no'),(9,'afr',NULL,'af','Afrikaans','Afrikaans','afrikaans','no'),(10,'ain',NULL,NULL,'Ainu-Sprache','Ainu','ainou','no'),(11,'aka',NULL,'ak','Akan-Sprache','Akan','akan','no'),(12,'akk',NULL,NULL,'Akkadisch','Akkadian','akkadien','no'),(13,'ale',NULL,NULL,'Aleutisch','Aleut','aléoute','no'),(14,'alg',NULL,NULL,'Algonkin-Sprachen (Andere)','Algonquian languages','algonquines, langues','no'),(15,'alt',NULL,NULL,'Südaltaisch','Southern Altai','altai du Sud','no'),(16,'amh',NULL,'am','Amharisch','Amharic','amharique','no'),(17,'ang',NULL,NULL,'Altenglisch','English, Old (ca.450-1100)','anglo-saxon (ca.450-1100)','no'),(18,'anp',NULL,NULL,'Anga-Sprache','Angika','angika','no'),(19,'apa',NULL,NULL,'Apachen-Sprache','Apache languages','apache','no'),(20,'ara',NULL,'ar','Arabisch','Arabic','arabe','no'),(21,'arc',NULL,NULL,'Aramäisch','Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)','araméen d\'empire (700-300 BCE)','no'),(22,'arg',NULL,'an','Aragonesisch','Aragonese','aragonais','no'),(23,'arn',NULL,NULL,'Arauka-Sprachen','Mapudungun; Mapuche','mapudungun; mapuche; mapuce','no'),(24,'arp',NULL,NULL,'Arapaho-Sprache','Arapaho','arapaho','no'),(25,'art',NULL,NULL,'Kunstsprachen (Andere)','Artificial (Other)','artificielles, autres langues','no'),(26,'arw',NULL,NULL,'Arawak-Sprachen','Arawak','arawak','no'),(27,'asm',NULL,'as','Assamesisch','Assamese','assamais','no'),(28,'ast',NULL,NULL,'Asturisch','Asturian; Bable; Leonese; Asturleonese','asturien; bable; léonais; asturoléonais','no'),(29,'ath',NULL,NULL,'Athapaskische Sprachen','Athapascan languages','athapascanes, langues','no'),(30,'aus',NULL,NULL,'Australische Sprachen','Australian languages','australiennes, langues','no'),(31,'ava',NULL,'av','Awarisch','Avaric','avar','no'),(32,'ave',NULL,'ae','Avestisch','Avestan','avestique','no'),(33,'awa',NULL,NULL,'Awadhi','Awadhi','awadhi','no'),(34,'aym',NULL,'ay','Aymará-Sprache','Aymara','aymara','no'),(35,'aze',NULL,'az','Aserbeidschanisch','Azerbaijani','azéri','no'),(36,'bad',NULL,NULL,'Banda-Sprache (Ubangi-Sprachen)','Banda languages','banda, langues','no'),(37,'bai',NULL,NULL,'Bamileke-Sprache','Bamileke languages','bamilékés, langues','no'),(38,'bak',NULL,'ba','Baschkirisch','Bashkir','bachkir','no'),(39,'bal',NULL,NULL,'Belutschisch','Baluchi','baloutchi','no'),(40,'bam',NULL,'bm','Bambara-Sprache','Bambara','bambara','no'),(41,'ban',NULL,NULL,'Balinesisch','Balinese','balinais','no'),(42,'bas',NULL,NULL,'Basaa-Sprache','Basa','basa','no'),(43,'bat',NULL,NULL,'Baltische Sprachen (Andere)','Baltic (Other)','baltiques, autres langues','no'),(44,'bej',NULL,NULL,'Bedauye','Beja; Bedawiyet','bedja','no'),(45,'bel',NULL,'be','Weißrussisch','Belarusian','biélorusse','yes'),(46,'bem',NULL,NULL,'Bemba-Sprache','Bemba','bemba','no'),(47,'ben',NULL,'bn','Bengali','Bengali','bengali','no'),(48,'ber',NULL,NULL,'Berbersprachen (Andere)','Berber (Other)','berberes, autres langues','no'),(49,'bho',NULL,NULL,'Bhojpuri','Bhojpuri','bhojpuri','no'),(50,'bih',NULL,'bh','Bihari','Bihari','bihari','no'),(51,'bik',NULL,NULL,'Bikol-Sprache','Bikol','bikol','no'),(52,'bin',NULL,NULL,'Edo-Sprache','Bini; Edo','bini; edo','no'),(53,'bis',NULL,'bi','Beach-la-mar','Bislama','bichlamar','no'),(54,'bla',NULL,NULL,'Blackfoot-Sprache','Siksika','blackfoot','no'),(55,'bnt',NULL,NULL,'Bantusprachen (Andere)','Bantu (Other)','bantoues, autres langues','no'),(56,'bod','tib','bo','Tibetisch','Tibetan','tibétain','no'),(57,'bos',NULL,'bs','Bosnisch','Bosnian','bosniaque','no'),(58,'bra',NULL,NULL,'Braj-Bhakha','Braj','braj','no'),(59,'bre',NULL,'br','Bretonisch','Breton','breton','no'),(60,'btk',NULL,NULL,'Batak-Sprache','Batak languages','batak, langues','no'),(61,'bua',NULL,NULL,'Burjatisch','Buriat','bouriate','no'),(62,'bug',NULL,NULL,'Bugi-Sprache','Buginese','bugi','no'),(63,'bul',NULL,'bg','Bulgarisch','Bulgarian','bulgare','no'),(64,'byn',NULL,NULL,'Bilin-Sprache','Blin; Bilin','blin; bilen','no'),(65,'cad',NULL,NULL,'Caddo-Sprachen','Caddo','caddo','no'),(66,'cai',NULL,NULL,'Indianersprachen, Zentralamerika (Andere)','Central American Indian (Other)','indiennes d\'Amérique centrale, autres langues','no'),(67,'car',NULL,NULL,'Karibische Sprachen','Galibi Carib','karib; galibi; carib','no'),(68,'cat',NULL,'ca','Katalanisch','Catalan; Valencian','catalan; valencien','no'),(69,'cau',NULL,NULL,'Kaukasische Sprachen (Andere)','Caucasian (Other)','caucasiennes, autres langues','no'),(70,'ceb',NULL,NULL,'Cebuano','Cebuano','cebuano','no'),(71,'cel',NULL,NULL,'Keltische Sprachen (Andere)','Celtic (Other)','celtiques, autres langues','no'),(72,'ces','cze','cs','Tschechisch','Czech','tcheque','no'),(73,'cha',NULL,'ch','Chamorro-Sprache','Chamorro','chamorro','no'),(74,'chb',NULL,NULL,'Chibcha-Sprachen','Chibcha','chibcha','no'),(75,'che',NULL,'ce','Tschetschenisch','Chechen','tchétchene','no'),(76,'chg',NULL,NULL,'Tschagataisch','Chagatai','djaghatai','no'),(77,'chk',NULL,NULL,'Trukesisch','Chuukese','chuuk','no'),(78,'chm',NULL,NULL,'Tscheremissisch','Mari','mari','no'),(79,'chn',NULL,NULL,'Chinook-Jargon','Chinook jargon','chinook, jargon','no'),(80,'cho',NULL,NULL,'Choctaw-Sprache','Choctaw','choctaw','no'),(81,'chp',NULL,NULL,'Chipewyan-Sprache','Chipewyan; Dene Suline','chipewyan','no'),(82,'chr',NULL,NULL,'Cherokee-Sprache','Cherokee','cherokee','no'),(83,'chu',NULL,'cu','Kirchenslawisch','Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic','slavon d\'église; vieux slave; slavon liturgique; vieux bulgare','no'),(84,'chv',NULL,'cv','Tschuwaschisch','Chuvash','tchouvache','no'),(85,'chy',NULL,NULL,'Cheyenne-Sprache','Cheyenne','cheyenne','no'),(86,'cmc',NULL,NULL,'Cham-Sprachen','Chamic languages','chames, langues','no'),(87,'cop',NULL,NULL,'Koptisch','Coptic','copte','no'),(88,'cor',NULL,'kw','Kornisch','Cornish','cornique','no'),(89,'cos',NULL,'co','Korsisch','Corsican','corse','no'),(90,'cpe',NULL,NULL,'Kreolisch-Englisch (Andere)','Creoles and pidgins, English based (Other)','créoles et pidgins anglais, autres','no'),(91,'cpf',NULL,NULL,'Kreolisch-Französisch (Andere)','Creoles and pidgins, French-based (Other)','créoles et pidgins français, autres','no'),(92,'cpp',NULL,NULL,'Kreolisch-Portugiesisch (Andere)','Creoles and pidgins, Portuguese-based (Other)','créoles et pidgins portugais, autres','no'),(93,'cre',NULL,'cr','Cree-Sprache','Cree','cree','no'),(94,'crh',NULL,NULL,'Krimtatarisch','Crimean Tatar; Crimean Turkish','tatar de Crimé','no'),(95,'crp',NULL,NULL,'Kreolische Sprachen; Pidginsprachen (Andere)','Creoles and pidgins (Other)','créoles et pidgins divers','no'),(96,'csb',NULL,NULL,'Kaschubisch','Kashubian','kachoube','no'),(97,'cus',NULL,NULL,'Kuschitische Sprachen (Andere)','Cushitic (Other)','couchitiques, autres langues','no'),(98,'cym','wel','cy','Kymrisch','Welsh','gallois','no'),(99,'dak',NULL,NULL,'Dakota-Sprache','Dakota','dakota','no'),(100,'dan',NULL,'da','Danakil-Sprache','Danish','danois','no'),(101,'dar',NULL,NULL,'Darginisch','Dargwa','dargwa','no'),(102,'day',NULL,NULL,'Dajakisch','Land Dayak languages','dayak, langues','no'),(103,'del',NULL,NULL,'Delaware-Sprache','Delaware','delaware','no'),(104,'den',NULL,NULL,'Slave-Sprache','Slave (Athapascan)','esclave (athapascan)','no'),(105,'deu','ger','de','Deutsch','German','allemand','yes'),(106,'dgr',NULL,NULL,'Dogrib-Sprache','Dogrib','dogrib','no'),(107,'din',NULL,NULL,'Dinka-Sprache','Dinka','dinka','no'),(108,'div',NULL,'dv','Maledivisch','Divehi; Dhivehi; Maldivian','maldivien','no'),(109,'doi',NULL,NULL,'Dogri','Dogri','dogri','no'),(110,'dra',NULL,NULL,'Drawidische Sprachen (Andere)','Dravidian (Other)','dravidiennes, autres langues','no'),(111,'dsb',NULL,NULL,'Niedersorbisch','Lower Sorbian','bas-sorabe','no'),(112,'dua',NULL,NULL,'Duala-Sprachen','Duala','douala','no'),(113,'dum',NULL,NULL,'Mittelniederländisch','Dutch, Middle (ca.1050-1350)','néerlandais moyen (ca. 1050-1350)','no'),(114,'dyu',NULL,NULL,'Dyula-Sprache','Dyula','dioula','no'),(115,'dzo',NULL,'dz','Dzongkha','Dzongkha','dzongkha','no'),(116,'efi',NULL,NULL,'Efik','Efik','efik','no'),(117,'egy',NULL,NULL,'Ägyptisch','Egyptian (Ancient)','égyptien','no'),(118,'eka',NULL,NULL,'Ekajuk','Ekajuk','ekajuk','no'),(119,'ell','gre','el','Neugriechisch','Greek, Modern (1453-)','grec moderne (apres 1453)','no'),(120,'elx',NULL,NULL,'Elamisch','Elamite','élamite','no'),(121,'eng',NULL,'en','Englisch','English','anglais','yes'),(122,'enm',NULL,NULL,'Mittelenglisch','English, Middle (1100-1500)','anglais moyen (1100-1500)','no'),(123,'epo',NULL,'eo','Esperanto','Esperanto','espéranto','no'),(124,'est',NULL,'et','Estnisch','Estonian','estonien','no'),(125,'eus','baq','eu','Baskisch','Basque','basque','no'),(126,'ewe',NULL,'ee','Ewe-Sprache','Ewe','éwé','no'),(127,'ewo',NULL,NULL,'Ewondo','Ewondo','éwondo','no'),(128,'fan',NULL,NULL,'Pangwe-Sprache','Fang','fang','no'),(129,'fao',NULL,'fo','Färöisch','Faroese','féroien','no'),(130,'fas','per','fa','Persisch','Persian','persan','no'),(131,'fat',NULL,NULL,'Fante-Sprache','Fanti','fanti','no'),(132,'fij',NULL,'fj','Fidschi-Sprache','Fijian','fidjien','no'),(133,'fil',NULL,NULL,'Pilipino','Filipino; Pilipino','filipino; pilipino','no'),(134,'fin',NULL,'fi','Finnisch','Finnish','finnois','no'),(135,'fiu',NULL,NULL,'Finnougrische Sprachen (Andere)','Finno-Ugrian (Other)','finno-ougriennes, autres langues','no'),(136,'fon',NULL,NULL,'Fon-Sprache','Fon','fon','no'),(137,'fra','fre','fr','Französisch','French','français','no'),(138,'frm',NULL,NULL,'Mittelfranzösisch','French, Middle (ca.1400-1600)','français moyen (1400-1600)','no'),(139,'fro',NULL,NULL,'Altfranzösisch','French, Old (842-ca.1400)','français ancien (842-ca.1400)','no'),(140,'frr',NULL,NULL,'Nordfriesisch','Northern Frisian','frison septentrional','no'),(141,'frs',NULL,NULL,'Ostfriesisch','Eastern Frisian','frison oriental','no'),(142,'fry',NULL,'fy','Friesisch','Western Frisian','frison occidental','no'),(143,'ful',NULL,'ff','Ful','Fulah','peul','no'),(144,'fur',NULL,NULL,'Friulisch','Friulian','frioulan','no'),(145,'gaa',NULL,NULL,'Ga-Sprache','Ga','ga','no'),(146,'gay',NULL,NULL,'Gayo-Sprache','Gayo','gayo','no'),(147,'gba',NULL,NULL,'Gbaya-Sprache','Gbaya','gbaya','no'),(148,'gem',NULL,NULL,'Germanische Sprachen (Andere)','Germanic (Other)','germaniques, autres langues','no'),(149,'gez',NULL,NULL,'Altäthiopisch','Geez','gueze','no'),(150,'gil',NULL,NULL,'Gilbertesisch','Gilbertese','kiribati','no'),(151,'gla',NULL,'gd','Gälisch-Schottisch','Gaelic; Scottish Gaelic','gaélique; gaélique écossais','no'),(152,'gle',NULL,'ga','Irisch','Irish','irlandais','no'),(153,'glg',NULL,'gl','Galicisch','Galician','galicien','no'),(154,'glv',NULL,'gv','Manx','Manx','manx; mannois','no'),(155,'gmh',NULL,NULL,'Mittelhochdeutsch','German, Middle High (ca.1050-1500)','allemand, moyen haut (ca. 1050-1500)','no'),(156,'goh',NULL,NULL,'Althochdeutsch','German, Old High (ca.750-1050)','allemand, vieux haut (ca. 750-1050)','no'),(157,'gon',NULL,NULL,'Gondi-Sprache','Gondi','gond','no'),(158,'gor',NULL,NULL,'Gorontalesisch','Gorontalo','gorontalo','no'),(159,'got',NULL,NULL,'Gotisch','Gothic','gothique','no'),(160,'grb',NULL,NULL,'Grebo-Sprache','Grebo','grebo','no'),(161,'grc',NULL,NULL,'Griechisch','Greek, Ancient (to 1453)','grec ancien (jusqu\'a 1453)','no'),(162,'grn',NULL,'gn','Guaraní-Sprache','Guarani','guarani','no'),(163,'gsw',NULL,NULL,'Schweizerdeutsch','Swiss German; Alemannic; Alsatian','suisse alémanique; alémanique; alsacien','no'),(164,'guj',NULL,'gu','Gujarati-Sprache','Gujarati','goudjrati','no'),(165,'gwi',NULL,NULL,'Kutchin-Sprache','Gwich\'in','gwich\'in','no'),(166,'hai',NULL,NULL,'Haida-Sprache','Haida','haida','no'),(167,'hat',NULL,'ht','Haitien','Haitian; Haitian Creole','haitien; créole haitien','no'),(168,'hau',NULL,'ha','Haussa-Sprache','Hausa','haoussa','no'),(169,'haw',NULL,NULL,'Hawaiisch','Hawaiian','hawaien','no'),(170,'heb',NULL,'he','Hebräisch','Hebrew','hébreu','no'),(171,'her',NULL,'hz','Herero-Sprache','Herero','herero','no'),(172,'hil',NULL,NULL,'Hiligaynon-Sprache','Hiligaynon','hiligaynon','no'),(173,'him',NULL,NULL,'Himachali','Himachali','himachali','no'),(174,'hin',NULL,'hi','Hindi','Hindi','hindi','no'),(175,'hit',NULL,NULL,'Hethitisch','Hittite','hittite','no'),(176,'hmn',NULL,NULL,'Miao-Sprachen','Hmong','hmong','no'),(177,'hmo',NULL,'ho','Hiri-Motu','Hiri Motu','hiri motu','no'),(178,'hrv','scr','hr','Kroatisch','Croatian','croate','no'),(179,'hsb',NULL,NULL,'Obersorbisch','Upper Sorbian','haut-sorabe','no'),(180,'hun',NULL,'hu','Ungarisch','Hungarian','hongrois','no'),(181,'hup',NULL,NULL,'Hupa-Sprache','Hupa','hupa','no'),(182,'hye','arm','hy','Armenisch','Armenian','arménien','no'),(183,'iba',NULL,NULL,'Iban-Sprache','Iban','iban','no'),(184,'ibo',NULL,'ig','Ibo-Sprache','Igbo','igbo','no'),(185,'ido',NULL,'io','Ido','Ido','ido','no'),(186,'iii',NULL,'ii','Lalo-Sprache','Sichuan Yi; Nuosu','yi de Sichuan','no'),(187,'ijo',NULL,NULL,'Ijo-Sprache','Ijo languages','ijo, langues','no'),(188,'iku',NULL,'iu','Inuktitut','Inuktitut','inuktitut','no'),(189,'ile',NULL,'ie','Interlingue','Interlingue; Occidental','interlingue','no'),(190,'ilo',NULL,NULL,'Ilokano-Sprache','Iloko','ilocano','no'),(191,'ina',NULL,'ia','Interlingua','Interlingua (International Auxiliary Language Association)','interlingua (langue auxiliaire internationale)','no'),(192,'inc',NULL,NULL,'Indoarische Sprachen (Andere)','Indic (Other)','indo-aryennes, autres langues','no'),(193,'ind',NULL,'id','Bahasa Indonesia','Indonesian','indonésien','no'),(194,'ine',NULL,NULL,'Indogermanische Sprachen (Andere)','Indo-European (Other)','indo-européennes, autres langues','no'),(195,'inh',NULL,NULL,'Inguschisch','Ingush','ingouche','no'),(196,'ipk',NULL,'ik','Inupik','Inupiaq','inupiaq','no'),(197,'ira',NULL,NULL,'Iranische Sprachen (Andere)','Iranian (Other)','iraniennes, autres langues','no'),(198,'iro',NULL,NULL,'Irokesische Sprachen','Iroquoian languages','iroquoises, langues (famille)','no'),(199,'isl','ice','is','Isländisch','Icelandic','islandais','no'),(200,'ita',NULL,'it','Italienisch','Italian','italien','no'),(201,'jav',NULL,'jv','Javanisch','Javanese','javanais','no'),(202,'jbo',NULL,NULL,'Lojban','Lojban','lojban','no'),(203,'jpn',NULL,'ja','Japanisch','Japanese','japonais','no'),(204,'jpr',NULL,NULL,'Jüdisch-Persisch','Judeo-Persian','judéo-persan','no'),(205,'jrb',NULL,NULL,'Jüdisch-Arabisch','Judeo-Arabic','judéo-arabe','no'),(206,'kaa',NULL,NULL,'Karakalpakisch','Kara-Kalpak','karakalpak','no'),(207,'kab',NULL,NULL,'Kabylisch','Kabyle','kabyle','no'),(208,'kac',NULL,NULL,'Kachin-Sprache','Kachin; Jingpho','kachin; jingpho','no'),(209,'kal',NULL,'kl','Grönländisch','Kalaallisut; Greenlandic','groenlandais','no'),(210,'kam',NULL,NULL,'Kamba-Sprache','Kamba','kamba','no'),(211,'kan',NULL,'kn','Kannada','Kannada','kannada','no'),(212,'kar',NULL,NULL,'Karenisch','Karen languages','karen, langues','no'),(213,'kas',NULL,'ks','Kaschmiri','Kashmiri','kashmiri','no'),(214,'kat','geo','ka','Georgisch','Georgian','géorgien','no'),(215,'kau',NULL,'kr','Kanuri-Sprache','Kanuri','kanouri','no'),(216,'kaw',NULL,NULL,'Kawi','Kawi','kawi','no'),(217,'kaz',NULL,'kk','Kasachisch','Kazakh','kazakh','no'),(218,'kbd',NULL,NULL,'Kabardinisch','Kabardian','kabardien','no'),(219,'kha',NULL,NULL,'Khasi-Sprache','Khasi','khasi','no'),(220,'khi',NULL,NULL,'Khoisan-Sprachen (Andere)','Khoisan (Other)','khoisan, autres langues','no'),(221,'khm',NULL,'km','Kambodschanisch','Central Khmer','khmer central','no'),(222,'kho',NULL,NULL,'Sakisch','Khotanese','khotanais','no'),(223,'kik',NULL,'ki','Kikuyu-Sprache','Kikuyu; Gikuyu','kikuyu','no'),(224,'kin',NULL,'rw','Rwanda-Sprache','Kinyarwanda','rwanda','no'),(225,'kir',NULL,'ky','Kirgisisch','Kirghiz; Kyrgyz','kirghiz','no'),(226,'kmb',NULL,NULL,'Kimbundu-Sprache','Kimbundu','kimbundu','no'),(227,'kok',NULL,NULL,'Konkani','Konkani','konkani','no'),(228,'kom',NULL,'kv','Komi-Sprache','Komi','kom','no'),(229,'kon',NULL,'kg','Kongo-Sprache','Kongo','kongo','no'),(230,'kor',NULL,'ko','Koreanisch','Korean','coréen','no'),(231,'kos',NULL,NULL,'Kosreanisch','Kosraean','kosrae','no'),(232,'kpe',NULL,NULL,'Kpelle-Sprache','Kpelle','kpellé','no'),(233,'krc',NULL,NULL,'Karatschaiisch-Balkarisch','Karachay-Balkar','karatchai balkar','no'),(234,'krl',NULL,NULL,'Karelisch','Karelian','carélien','no'),(235,'kro',NULL,NULL,'Kru-Sprachen','Kru languages','krou, langues','no'),(236,'kru',NULL,NULL,'Oraon-Sprache','Kurukh','kurukh','no'),(237,'kua',NULL,'kj','Kwanyama-Sprache','Kuanyama; Kwanyama','kuanyama; kwanyama','no'),(238,'kum',NULL,NULL,'Kumükisch','Kumyk','koumyk','no'),(239,'kur',NULL,'ku','Kurdisch','Kurdish','kurde','no'),(240,'kut',NULL,NULL,'Kutenai-Sprache','Kutenai','kutenai','no'),(241,'lad',NULL,NULL,'Judenspanisch','Ladino','judéo-espagnol','no'),(242,'lah',NULL,NULL,'Lahnda','Lahnda','lahnda','no'),(243,'lam',NULL,NULL,'Lamba-Sprache (Bantusprache)','Lamba','lamba','no'),(244,'lao',NULL,'lo','Laotisch','Lao','lao','no'),(245,'lat',NULL,'la','Latein','Latin','latin','no'),(246,'lav',NULL,'lv','Lettisch','Latvian','letton','no'),(247,'lez',NULL,NULL,'Lesgisch','Lezghian','lezghien','no'),(248,'lim',NULL,'li','Limburgisch','Limburgan; Limburger; Limburgish','limbourgeois','no'),(249,'lin',NULL,'ln','Lingala','Lingala','lingala','no'),(250,'lit',NULL,'lt','Litauisch','Lithuanian','lituanien','no'),(251,'lol',NULL,NULL,'Mongo-Sprache','Mongo','mongo','no'),(252,'loz',NULL,NULL,'Rotse-Sprache','Lozi','lozi','no'),(253,'ltz',NULL,'lb','Luxemburgisch','Luxembourgish; Letzeburgesch','luxembourgeois','no'),(254,'lua',NULL,NULL,'Lulua-Sprache','Luba-Lulua','luba-lulua','no'),(255,'lub',NULL,'lu','Luba-Katanga-Sprache','Luba-Katanga','luba-katanga','no'),(256,'lug',NULL,'lg','Ganda-Sprache','Ganda','ganda','no'),(257,'lui',NULL,NULL,'Luiseno-Sprache','Luiseno','luiseno','no'),(258,'lun',NULL,NULL,'Lunda-Sprache','Lunda','lunda','no'),(259,'luo',NULL,NULL,'Luo-Sprache','Luo (Kenya and Tanzania)','luo (Kenya et Tanzanie)','no'),(260,'lus',NULL,NULL,'Lushai-Sprache','Lushai','lushai','no'),(261,'mad',NULL,NULL,'Maduresisch','Madurese','madourais','no'),(262,'mag',NULL,NULL,'Khotta','Magahi','magahi','no'),(263,'mah',NULL,'mh','Marschallesisch','Marshallese','marshall','no'),(264,'mai',NULL,NULL,'Maithili','Maithili','maithili','no'),(265,'mak',NULL,NULL,'Makassarisch','Makasar','makassar','no'),(266,'mal',NULL,'ml','Malayalam','Malayalam','malayalam','no'),(267,'man',NULL,NULL,'Malinke-Sprache','Mandingo','mandingue','no'),(268,'map',NULL,NULL,'Austronesische Sprachen (Andere)','Austronesian (Other)','malayo-polynésiennes, autres langues','no'),(269,'mar',NULL,'mr','Marathi','Marathi','marathe','no'),(270,'mas',NULL,NULL,'Massai-Sprache','Masai','massai','no'),(271,'mdf',NULL,NULL,'Mokscha-Sprache','Moksha','moksa','no'),(272,'mdr',NULL,NULL,'Mandaresisch','Mandar','mandar','no'),(273,'men',NULL,NULL,'Mende-Sprache','Mende','mendé','no'),(274,'mga',NULL,NULL,'Mittelirisch','Irish, Middle (900-1200)','irlandais moyen (900-1200)','no'),(275,'mic',NULL,NULL,'Micmac-Sprache','Mi\'kmaq; Micmac','mi\'kmaq; micmac','no'),(276,'min',NULL,NULL,'Minangkabau-Sprache','Minangkabau','minangkabau','no'),(277,'mis',NULL,NULL,'Einzelne andere Sprachen','Uncoded languages','langues non codées','no'),(278,'mkd','mac','mk','Makedonisch','Macedonian','macédonien','no'),(279,'mkh',NULL,NULL,'Mon-Khmer-Sprachen (Andere)','Mon-Khmer (Other)','môn-khmer, autres langues','no'),(280,'mlg',NULL,'mg','Malagassi-Sprache','Malagasy','malgache','no'),(281,'mlt',NULL,'mt','Maltesisch','Maltese','maltais','no'),(282,'mnc',NULL,NULL,'Mandschurisch','Manchu','mandchou','no'),(283,'mni',NULL,NULL,'Meithei-Sprache','Manipuri','manipuri','no'),(284,'mno',NULL,NULL,'Manobo-Sprache','Manobo languages','manobo, langues','no'),(285,'moh',NULL,NULL,'Mohawk-Sprache','Mohawk','mohawk','no'),(286,'mol',NULL,'mo','Moldauisch','Moldavian','moldave','no'),(287,'mon',NULL,'mn','Mongolisch','Mongolian','mongol','no'),(288,'mos',NULL,NULL,'Mossi-Sprache','Mossi','moré','no'),(289,'mri','mao','mi','Maori-Sprache','Maori','maori','no'),(290,'msa','may','ms','Malaiisch','Malay','malais','no'),(291,'mul',NULL,NULL,'Mehrere Sprachen','Multiple languages','multilingue','no'),(292,'mun',NULL,NULL,'Mundasprachen (Andere)','Munda languages','mounda, langues','no'),(293,'mus',NULL,NULL,'Muskogisch','Creek','muskogee','no'),(294,'mwl',NULL,NULL,'Mirandesisch','Mirandese','mirandais','no'),(295,'mwr',NULL,NULL,'Marwari','Marwari','marvari','no'),(296,'mya','bur','my','Birmanisch','Burmese','birman','no'),(297,'myn',NULL,NULL,'Maya-Sprachen','Mayan languages','maya, langues','no'),(298,'myv',NULL,NULL,'Erza-Mordwinisch','Erzya','erza','no'),(299,'nah',NULL,NULL,'Nahuatl','Nahuatl languages','nahuatl, langues','no'),(300,'nai',NULL,NULL,'Indianersprachen, Nordamerika (Andere)','North American Indian','indiennes d\'Amérique du Nord, autres langues','no'),(301,'nap',NULL,NULL,'Neapel / Mundart','Neapolitan','napolitain','no'),(302,'nau',NULL,'na','Nauruanisch','Nauru','nauruan','no'),(303,'nav',NULL,'nv','Navajo-Sprache','Navajo; Navaho','navaho','no'),(304,'nbl',NULL,'nr','Ndebele-Sprache (Transvaal)','Ndebele, South; South Ndebele','ndébélé du Sud','no'),(305,'nde',NULL,'nd','Ndebele-Sprache (Simbabwe)','Ndebele, North; North Ndebele','ndébélé du Nord','no'),(306,'ndo',NULL,'ng','Ndonga','Ndonga','ndonga','no'),(307,'nds',NULL,NULL,'Niederdeutsch','Low German; Low Saxon; German, Low; Saxon, Low','bas allemand; bas saxon; allemand, bas; saxon, bas','no'),(308,'nep',NULL,'ne','Nepali','Nepali','népalais','no'),(309,'new',NULL,NULL,'Newari','Nepal Bhasa; Newari','nepal bhasa; newari','no'),(310,'nia',NULL,NULL,'Nias-Sprache','Nias','nias','no'),(311,'nic',NULL,NULL,'Nigerkordofanische Sprachen (Andere)','Niger-Kordofanian (Other)','nigéro-congolaises, autres langues','no'),(312,'niu',NULL,NULL,'Niue-Sprache','Niuean','niué','no'),(313,'nld','dut','nl','Niederländisch','Dutch; Flemish','néerlandais; flamand','no'),(314,'nno',NULL,'nn','Nynorsk','Norwegian Nynorsk; Nynorsk, Norwegian','norvégien nynorsk; nynorsk, norvégien','no'),(315,'nob',NULL,'nb','Bokmal','Bokmal, Norwegian; Norwegian Bokmal','norvégien bokmal','no'),(316,'nog',NULL,NULL,'Nogaisch','Nogai','nogai; nogay','no'),(317,'non',NULL,NULL,'Altnorwegisch','Norse, Old','norrois, vieux','no'),(318,'nor',NULL,'no','Norwegisch','Norwegian','norvégien','no'),(319,'nqo',NULL,NULL,'N\'ko','N\'Ko','n\'ko','no'),(320,'nso',NULL,NULL,'Pedi-Sprache','Pedi; Sepedi; Northern Sotho','pedi; sepedi; sotho du Nord','no'),(321,'nub',NULL,NULL,'Nubische Sprachen','Nubian languages','nubiennes, langues','no'),(322,'nwc',NULL,NULL,'Alt-Newari','Classical Newari; Old Newari; Classical Nepal Bhasa','newari classique','no'),(323,'nya',NULL,'ny','Nyanja-Sprache','Chichewa; Chewa; Nyanja','chichewa; chewa; nyanja','no'),(324,'nym',NULL,NULL,'Nyamwezi-Sprache','Nyamwezi','nyamwezi','no'),(325,'nyn',NULL,NULL,'Nkole-Sprache','Nyankole','nyankolé','no'),(326,'nyo',NULL,NULL,'Nyoro-Sprache','Nyoro','nyoro','no'),(327,'nzi',NULL,NULL,'Nzima-Sprache','Nzima','nzema','no'),(328,'oci',NULL,'oc','Okzitanisch','Occitan (post 1500); Provençal','occitan (apres 1500); provençal','no'),(329,'oji',NULL,'oj','Ojibwa-Sprache','Ojibwa','ojibwa','no'),(330,'ori',NULL,'or','Oriya-Sprache','Oriya','oriya','no'),(331,'orm',NULL,'om','Galla-Sprache','Oromo','galla','no'),(332,'osa',NULL,NULL,'Osage-Sprache','Osage','osage','no'),(333,'oss',NULL,'os','Ossetisch','Ossetian; Ossetic','ossete','no'),(334,'ota',NULL,NULL,'Osmanisch','Turkish, Ottoman (1500-1928)','turc ottoman (1500-1928)','no'),(335,'oto',NULL,NULL,'Otomangue-Sprachen','Otomian languages','otomangue, langues','no'),(336,'paa',NULL,NULL,'Papuasprachen (Andere)','Papuan (Other)','papoues, autres langues','no'),(337,'pag',NULL,NULL,'Pangasinan-Sprache','Pangasinan','pangasinan','no'),(338,'pal',NULL,NULL,'Mittelpersisch','Pahlavi','pahlavi','no'),(339,'pam',NULL,NULL,'Pampanggan-Sprache','Pampanga; Kapampangan','pampangan','no'),(340,'pan',NULL,'pa','Pandschabi-Sprache','Panjabi; Punjabi','pendjabi','no'),(341,'pap',NULL,NULL,'Papiamento','Papiamento','papiamento','no'),(342,'pau',NULL,NULL,'Palau-Sprache','Palauan','palau','no'),(343,'peo',NULL,NULL,'Altpersisch','Persian, Old (ca.600-400 B.C.)','perse, vieux (ca. 600-400 av. J.-C.)','no'),(344,'phi',NULL,NULL,'Philippinen-Austronesisch (Other)','Philippine (Other)','philippines, autres langues','no'),(345,'phn',NULL,NULL,'Phönikisch','Phoenician','phénicien','no'),(346,'pli',NULL,'pi','Pali','Pali','pali','no'),(347,'pol',NULL,'pl','Polnisch','Polish','polonais','yes'),(348,'pon',NULL,NULL,'Ponapeanisch','Pohnpeian','pohnpei','no'),(349,'por',NULL,'pt','Portugiesisch','Portuguese','portugais','no'),(350,'pra',NULL,NULL,'Prakrit','Prakrit languages','prâkrit','no'),(351,'pro',NULL,NULL,'Altokzitanisch','Provençal, Old (to 1500)','provençal ancien (jusqu\'a 1500)','no'),(352,'pus',NULL,'ps','Paschtu','Pushto; Pashto','pachto','no'),(353,'que',NULL,'qu','Quechua-Sprache','Quechua','quechua','no'),(354,'raj',NULL,NULL,'Rajasthani','Rajasthani','rajasthani','no'),(355,'rap',NULL,NULL,'Osterinsel-Sprache','Rapanui','rapanui','no'),(356,'rar',NULL,NULL,'Rarotonganisch','Rarotongan; Cook Islands Maori','rarotonga; maori des îles Cook','no'),(357,'roa',NULL,NULL,'Romanes (andere)','Romance (Other)','romanes, autres langues','no'),(358,'roh',NULL,'rm','Romanische Sprachen (Andere)','Romansh','romanche','no'),(359,'rom',NULL,NULL,'Romani (Sprache)','Romany','tsigane','no'),(360,'ron','rum','ro','Rumänisch','Romanian','roumain','no'),(361,'run',NULL,'rn','Rundi-Sprache','Rundi','rundi','no'),(362,'rup',NULL,NULL,'Aromunisch','Aromanian; Arumanian; Macedo-Romanian','aroumain; macédo-roumain','no'),(363,'rus',NULL,'ru','Russisch','Russian','russe','no'),(364,'sad',NULL,NULL,'Sandawe-Sprache','Sandawe','sandawe','no'),(365,'sag',NULL,'sg','Sango-Sprache','Sango','sango','no'),(366,'sah',NULL,NULL,'Jakutisch','Yakut','iakoute','no'),(367,'sai',NULL,NULL,'Indianersprachen, Südamerika (Andere)','South American Indian (Other)','indiennes d\'Amérique du Sud, autres langues','no'),(368,'sal',NULL,NULL,'Salish-Sprache','Salishan languages','salish, langues','no'),(369,'sam',NULL,NULL,'Samaritanisch','Samaritan Aramaic','samaritain','no'),(370,'san',NULL,'sa','Sanskrit','Sanskrit','sanskrit','no'),(371,'sas',NULL,NULL,'Sasak','Sasak','sasak','no'),(372,'sat',NULL,NULL,'Santali','Santali','santal','no'),(373,'scn',NULL,NULL,'Sizilianisch','Sicilian','sicilien','no'),(374,'sco',NULL,NULL,'Schottisch','Scots','écossais','no'),(375,'sel',NULL,NULL,'Selkupisch','Selkup','selkoupe','no'),(376,'sem',NULL,NULL,'Semitische Sprachen (Andere)','Semitic (Other)','sémitiques, autres langues','no'),(377,'sga',NULL,NULL,'Altirisch','Irish, Old (to 900)','irlandais ancien (jusqu\'a 900)','no'),(378,'sgn',NULL,NULL,'Zeichensprachen','Sign Languages','langues des signes','no'),(379,'shn',NULL,NULL,'Schan-Sprache','Shan','chan','no'),(380,'sid',NULL,NULL,'Sidamo-Sprache','Sidamo','sidamo','no'),(381,'sin',NULL,'si','Singhalesisch','Sinhala; Sinhalese','singhalais','no'),(382,'sio',NULL,NULL,'Sioux-Sprachen','Siouan languages','sioux, langues','no'),(383,'sit',NULL,NULL,'Sinotibetische Sprachen (Andere)','Sino-Tibetan (Other)','sino-tibétaines, autres langues','no'),(384,'sla',NULL,NULL,'Slawische Sprachen (Andere)','Slavic (Other)','slaves, autres langues','no'),(385,'slk','slo','sk','Slowakisch','Slovak','slovaque','no'),(386,'slv',NULL,'sl','Slowenisch','Slovenian','slovene','no'),(387,'sma',NULL,NULL,'Südsaamisch','Southern Sami','sami du Sud','no'),(388,'sme',NULL,'se','Nordsaamisch','Northern Sami','sami du Nord','no'),(389,'smi',NULL,NULL,'Saamisch (Andere)','Sami languages (Other)','sami, autres langues','no'),(390,'smj',NULL,NULL,'Lulesaamisch','Lule Sami','sami de Lule','no'),(391,'smn',NULL,NULL,'Inarisaamisch','Inari Sami','sami d\'Inari','no'),(392,'smo',NULL,'sm','Samoanisch','Samoan','samoan','no'),(393,'sms',NULL,NULL,'Skoltsaamisch','Skolt Sami','sami skolt','no'),(394,'sna',NULL,'sn','Schona-Sprache','Shona','shona','no'),(395,'snd',NULL,'sd','Sindhi-Sprache','Sindhi','sindhi','no'),(396,'snk',NULL,NULL,'Soninke-Sprache','Soninke','soninké','no'),(397,'sog',NULL,NULL,'Sogdisch','Sogdian','sogdien','no'),(398,'som',NULL,'so','Somali','Somali','somali','no'),(399,'son',NULL,NULL,'Songhai-Sprache','Songhai languages','songhai, langues','no'),(400,'sot',NULL,'st','Süd-Sotho-Sprache','Sotho, Southern','sotho du Sud','no'),(401,'spa',NULL,'es','Spanisch','Spanish; Castilian','espagnol; castillan','no'),(402,'sqi','alb','sq','Albanisch','Albanian','albanais','no'),(403,'srd',NULL,'sc','Sardisch','Sardinian','sarde','no'),(404,'srn',NULL,NULL,'Sranantongo','Sranan Tongo','sranan tongo','no'),(405,'srp','scc','sr','Serbisch','Serbian','serbe','no'),(406,'srr',NULL,NULL,'Serer-Sprache','Serer','sérere','no'),(407,'ssa',NULL,NULL,'Nilosaharanische Sprachen (Andere)','Nilo-Saharan (Other)','nilo-sahariennes, autres langues','no'),(408,'ssw',NULL,'ss','Swasi-Sprache','Swati','swati','no'),(409,'suk',NULL,NULL,'Sukuma-Sprache','Sukuma','sukuma','no'),(410,'sun',NULL,'su','Sundanesisch','Sundanese','soundanais','no'),(411,'sus',NULL,NULL,'Susu','Susu','soussou','no'),(412,'sux',NULL,NULL,'Sumerisch','Sumerian','sumérien','no'),(413,'swa',NULL,'sw','Swahili','Swahili','swahili','no'),(414,'swe',NULL,'sv','Schwedisch','Swedish','suédois','no'),(415,'syc',NULL,NULL,'Klassisches Syrisch','Classical Syriac','syriaque classique','no'),(416,'syr',NULL,NULL,'Syrisch','Syriac','syriaque','no'),(417,'tah',NULL,'ty','Tahitisch','Tahitian','tahitien','no'),(418,'tai',NULL,NULL,'Thaisprachen (Andere)','Tai (Other)','thaies, autres langues','no'),(419,'tam',NULL,'ta','Tamil','Tamil','tamoul','no'),(420,'tat',NULL,'tt','Tatarisch','Tatar','tatar','no'),(421,'tel',NULL,'te','Telugu-Sprache','Telugu','télougou','no'),(422,'tem',NULL,NULL,'Temne-Sprache','Timne','temne','no'),(423,'ter',NULL,NULL,'Tereno-Sprache','Tereno','tereno','no'),(424,'tet',NULL,NULL,'Tetum-Sprache','Tetum','tetum','no'),(425,'tgk',NULL,'tg','Tadschikisch','Tajik','tadjik','no'),(426,'tgl',NULL,'tl','Tagalog','Tagalog','tagalog','no'),(427,'tha',NULL,'th','Thailändisch','Thai','thai','no'),(428,'tig',NULL,NULL,'Tigre-Sprache','Tigre','tigré','no'),(429,'tir',NULL,'ti','Tigrinja-Sprache','Tigrinya','tigrigna','no'),(430,'tiv',NULL,NULL,'Tiv-Sprache','Tiv','tiv','no'),(431,'tkl',NULL,NULL,'Tokelauanisch','Tokelau','tokelau','no'),(432,'tlh',NULL,NULL,'Klingonisch','Klingon; tlhIngan-Hol','klingon','no'),(433,'tli',NULL,NULL,'Tlingit-Sprache','Tlingit','tlingit','no'),(434,'tmh',NULL,NULL,'Tamašeq','Tamashek','tamacheq','no'),(435,'tog',NULL,NULL,'Tonga (Bantusprache, Sambia)','Tonga (Nyasa)','tonga (Nyasa)','no'),(436,'ton',NULL,'to','Tongaisch','Tonga (Tonga Islands)','tongan (Îles Tonga)','no'),(437,'tpi',NULL,NULL,'Neumelanesisch','Tok Pisin','tok pisin','no'),(438,'tsi',NULL,NULL,'Tsimshian-Sprache','Tsimshian','tsimshian','no'),(439,'tsn',NULL,'tn','Tswana-Sprache','Tswana','tswana','no'),(440,'tso',NULL,'ts','Tsonga-Sprache','Tsonga','tsonga','no'),(441,'tuk',NULL,'tk','Turkmenisch','Turkmen','turkmene','no'),(442,'tum',NULL,NULL,'Tumbuka-Sprache','Tumbuka','tumbuka','no'),(443,'tup',NULL,NULL,'Tupi-Sprache','Tupi languages','tupi, langues','no'),(444,'tur',NULL,'tr','Türkisch','Turkish','turc','no'),(445,'tut',NULL,NULL,'Altaische Sprachen (Andere)','Altaic (Other)','altaiques, autres langues','no'),(446,'tvl',NULL,NULL,'Elliceanisch','Tuvalu','tuvalu','no'),(447,'twi',NULL,'tw','Twi-Sprache','Twi','twi','no'),(448,'tyv',NULL,NULL,'Tuwinisch','Tuvinian','touva','no'),(449,'udm',NULL,NULL,'Udmurtisch','Udmurt','oudmourte','no'),(450,'uga',NULL,NULL,'Ugaritisch','Ugaritic','ougaritique','no'),(451,'uig',NULL,'ug','Uigurisch','Uighur; Uyghur','ouigour','no'),(452,'ukr',NULL,'uk','Ukrainisch','Ukrainian','ukrainien','no'),(453,'umb',NULL,NULL,'Mbundu-Sprache','Umbundu','umbundu','no'),(454,'und',NULL,NULL,'Nicht zu entscheiden','Undetermined','indéterminée','no'),(455,'urd',NULL,'ur','Urdu','Urdu','ourdou','no'),(456,'uzb',NULL,'uz','Usbekisch','Uzbek','ouszbek','no'),(457,'vai',NULL,NULL,'Vai-Sprache','Vai','vai','no'),(458,'ven',NULL,'ve','Venda-Sprache','Venda','venda','no'),(459,'vie',NULL,'vi','Vietnamesisch','Vietnamese','vietnamien','no'),(460,'vol',NULL,'vo','Volapük','Volapük','volapük','no'),(461,'vot',NULL,NULL,'Wotisch','Votic','vote','no'),(462,'wak',NULL,NULL,'Wakash-Sprachen','Wakashan languages','wakashennes, langues','no'),(463,'wal',NULL,NULL,'Walamo-Sprache','Walamo','walamo','no'),(464,'war',NULL,NULL,'Waray','Waray','waray','no'),(465,'was',NULL,NULL,'Washo-Sprache','Washo','washo','no'),(466,'wen',NULL,NULL,'Sorbisch','Sorbian languages','sorabes, langues','no'),(467,'wln',NULL,'wa','Wallonisch','Walloon','wallon','no'),(468,'wol',NULL,'wo','Wolof-Sprache','Wolof','wolof','no'),(469,'xal',NULL,NULL,'Kalmückisch','Kalmyk; Oirat','kalmouk; oirat','no'),(470,'xho',NULL,'xh','Xhosa-Sprache','Xhosa','xhosa','no'),(471,'yao',NULL,NULL,'Yao-Sprache (Bantusprache)','Yao','yao','no'),(472,'yap',NULL,NULL,'Yapesisch','Yapese','yapois','no'),(473,'yid',NULL,'yi','Jiddisch','Yiddish','yiddish','no'),(474,'yor',NULL,'yo','Yoruba-Sprache','Yoruba','yoruba','no'),(475,'ypk',NULL,NULL,'Yupik-Sprache','Yupik languages','yupik, langues','no'),(476,'zap',NULL,NULL,'Zapotekisch','Zapotec','zapoteque','no'),(477,'zbl',NULL,NULL,'Bliss-Symbol','Blissymbols; Blissymbolics; Bliss','symboles Bliss; Bliss','no'),(478,'zen',NULL,NULL,'Zenaga','Zenaga','zenaga','no'),(479,'zha',NULL,'za','Zhuang','Zhuang; Chuang','zhuang; chuang','no'),(480,'zho','chi','zh','Chinesisch','Chinese','chinois','no'),(481,'znd',NULL,NULL,'Zande-Sprachen','Zande languages','zandé, langues','no'),(482,'zul',NULL,'zu','Zulu-Sprache','Zulu','zoulou','no'),(483,'zun',NULL,NULL,'Zuni-Sprache','Zuni','zuni','no'),(484,'zxx',NULL,NULL,'kein linguistischer Inhalt, nicht anwendbar','No linguistic content; Not applicable','pas de contenu linguistique; non applicable','no'),(485,'zza',NULL,NULL,'Zazaki','Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki','zaza; dimili; dimli; kirdki; kirmanjki; zazaki','no');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(63) COLLATE latin1_general_cs NOT NULL,
  `login_rights` enum('admin','read and write','read') COLLATE latin1_general_cs NOT NULL DEFAULT 'read',
  `password` varchar(60) COLLATE latin1_general_cs NOT NULL,
  `password_change` enum('yes','no') COLLATE latin1_general_cs NOT NULL DEFAULT 'no',
  `logged_in` enum('yes','no') COLLATE latin1_general_cs NOT NULL DEFAULT 'no',
  `last_click` int(10) unsigned DEFAULT NULL,
  `active` enum('yes','no') COLLATE latin1_general_cs NOT NULL DEFAULT 'yes',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `benutzername` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `medium_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `main_medium_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `language_id` int(10) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` enum('yes','no') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'yes',
  `clipping` enum('center','top','right','bottom','left') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'center',
  `sequence` smallint(5) unsigned DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `filetype_id` int(10) unsigned NOT NULL,
  `thumb_filetype_id` int(10) unsigned DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  `md5_hash` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `version` tinyint(3) unsigned DEFAULT NULL,
  `width_px` mediumint(8) unsigned DEFAULT NULL,
  `height_px` mediumint(8) unsigned DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medium_id`),
  KEY `filetype_id` (`filetype_id`),
  KEY `thumb_filetype_id` (`thumb_filetype_id`),
  KEY `main_medium_id` (`main_medium_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirects` (
  `redirect_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` smallint(5) unsigned NOT NULL DEFAULT '301',
  `area` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`redirect_id`),
  UNIQUE KEY `alt` (`old_url`),
  KEY `area` (`area`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirects`
--

LOCK TABLES `redirects` WRITE;
/*!40000 ALTER TABLE `redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `text_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `more_text` text COLLATE utf8mb4_unicode_ci,
  `area` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`text_id`),
  UNIQUE KEY `text` (`text`(250)),
  KEY `area` (`area`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'Countries',NULL,'Countries','2011-06-15 19:10:54'),(2,'Categories',NULL,'Categories','2011-06-15 19:12:23'),(3,'Category',NULL,'Categories','2011-06-15 19:15:01'),(4,'Description',NULL,'Tables','2011-06-15 19:15:40'),(5,'Updated',NULL,'Tables','2011-06-15 19:15:36'),(6,'Identifier',NULL,'Tables','2011-06-15 19:15:49'),(7,'Main Category',NULL,'Categories','2011-06-15 19:16:03'),(8,'yes',NULL,'Tables','2011-06-15 19:16:26'),(9,'no',NULL,'Tables','2011-06-15 19:16:36'),(10,'Country Code',NULL,'Countries','2011-06-15 19:17:59'),(11,'Website',NULL,'Countries','2011-06-15 19:18:10'),(12,'Country',NULL,'Countries','2011-06-15 19:18:25'),(13,'Country code according to ISO 3166',NULL,'Countries','2011-06-15 19:18:57'),(14,'Will country be used on website?',NULL,'Countries','2011-06-15 19:19:18'),(15,'Languages',NULL,'Languages','2011-06-15 19:19:38'),(16,'Will language be used on website?',NULL,'Languages','2011-06-15 19:20:20'),(17,'Language code ISO 639-1',NULL,'Languages','2011-06-15 19:20:40'),(18,'Language code ISO 639-2, Bibliographic',NULL,'Languages','2011-06-15 19:21:00'),(19,'Language code ISO 639-2, Terminology',NULL,'Languages','2011-06-15 19:21:16'),(20,'Language, english',NULL,'Languages','2011-06-15 19:21:33'),(21,'Language, french',NULL,'Languages','2011-06-15 19:21:45'),(22,'Language, german',NULL,'Languages','2011-06-15 19:21:55'),(23,'Webpages',NULL,'Webpages','2011-06-15 19:46:17'),(24,'Title',NULL,'Tables','2011-06-15 19:46:27'),(25,'Content',NULL,'Tables','2011-06-15 19:46:35'),(26,'Ending',NULL,'Webpages','2011-06-15 19:46:53'),(27,'Seq.',NULL,'Webpages','2011-06-15 19:47:05'),(28,'Subpage&nbsp;of',NULL,'Webpages','2011-06-15 19:47:19'),(29,'Published?',NULL,'Webpages','2011-06-15 19:47:53'),(30,'WWW?',NULL,'Webpages','2011-06-15 19:48:10'),(31,'Menu',NULL,'Webpages','2011-06-15 19:48:31'),(32,'none',NULL,'Webpages','2011-06-15 19:49:58'),(33,'top',NULL,'Webpages','2011-06-15 19:50:07'),(34,'bottom',NULL,'Webpages','2011-06-15 19:50:14'),(37,'Redirects',NULL,'Redirects','2011-06-15 19:54:18'),(38,'Old URL',NULL,'Redirects','2011-06-15 19:54:46'),(39,'New URL',NULL,'Redirects','2011-06-15 19:54:53'),(36,'Address of page, should show hierarchy, no / at the end!<br>The identifier should contain only letters a-z, numbers 0-9 and the - sign.',NULL,'Webpages','2011-06-15 19:52:41'),(40,'Code',NULL,'Redirects','2011-06-15 19:55:06'),(41,'301 Moved Permanently',NULL,'Redirects','2011-06-15 19:58:17'),(42,'302 Found',NULL,'Redirects','2011-06-15 19:58:29'),(43,'303 See Other',NULL,'Redirects','2011-06-15 19:59:02'),(44,'307 Temporary Redirect',NULL,'Redirects','2011-06-15 19:59:22'),(45,'410 Gone',NULL,'Redirects','2011-06-15 20:00:37'),(46,'Media Pool',NULL,'Media','2011-06-15 20:35:07'),(47,'File',NULL,'Media','2011-06-15 20:35:34'),(48,'Folder',NULL,'Media','2011-06-15 20:35:39'),(49,'The filename will be used as a default if nothing is entered.',NULL,'Media','2011-06-15 20:36:36'),(50,'Sequence',NULL,'Tables','2011-06-15 20:36:52'),(62,'Thumbnail Type',NULL,'Media','2013-08-16 11:57:49'),(63,'Display as gallery',NULL,'Media','2013-08-16 11:59:36'),(52,'If it\'s not a medium created by yourself, who created it, where did you find it?',NULL,'Media','2011-06-15 20:39:00'),(53,'Source',NULL,'Media','2011-06-15 20:39:16'),(54,'h',NULL,'Media','2011-06-15 20:39:36'),(55,'at',NULL,'Media','2011-06-15 20:40:08'),(59,'Coloured border: medium is published; gray border: medium is not published.',NULL,'Media','2013-08-16 11:40:25'),(57,'You are here:',NULL,'Page','2011-06-16 06:53:12'),(58,'internal',NULL,'Webpages','2013-08-16 11:08:41'),(60,'Digital photography: If nothing is entered, date and time will be read from file.',NULL,'Media','2013-08-16 11:49:29'),(61,'Filetype of the thumbnail image. JPEG is good for photos, PNG or GIF for line art.',NULL,'Media','2013-08-16 11:54:42'),(64,'Display as table',NULL,'Media','2013-08-16 12:00:02'),(65,'ID',NULL,'Tables','2013-08-16 12:00:38'),(66,'Translation field',NULL,'Translations','2013-08-16 12:01:55'),(67,'Filesize',NULL,'Media','2013-08-16 12:02:22'),(68,'MD5',NULL,'Media','2013-08-16 12:03:05'),(69,'Text',NULL,'Tables','2013-08-16 12:03:43'),(70,'Language',NULL,'Translations','2013-08-16 12:04:00'),(71,'Translation to',NULL,'Translations','2013-08-16 12:04:44'),(72,'Time',NULL,'Media','2013-08-16 12:10:22'),(73,'Version',NULL,'Media','2013-08-16 12:10:56'),(74,'Medium',NULL,'Media','2013-08-16 12:11:41'),(75,'Area',NULL,'Translations','2013-08-16 12:55:33'),(76,'Logins',NULL,'Logins','2013-08-16 13:05:20'),(77,'Person',NULL,'Logins','2013-08-16 13:05:28'),(78,'Change Pwd?',NULL,'Logins','2013-08-16 13:05:47'),(79,'Logged in',NULL,'Logins','2013-08-16 13:05:55'),(80,'Click',NULL,'Logins','2013-08-16 13:05:59'),(81,'Active',NULL,'Logins','2013-08-16 13:06:05'),(82,'To deactivate a login',NULL,'Logins','2013-08-16 13:06:15'),(83,'Last activity in database',NULL,'Logins','2013-08-16 13:06:26'),(84,'\"Yes\" means that the user has to change the password next time he or she logs in.',NULL,'Logins','2013-08-16 13:07:04'),(85,'Password',NULL,'Logins','2013-08-16 13:07:20');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webpages`
--

DROP TABLE IF EXISTS `webpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webpages` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(127) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `ending` enum('.html','/','none') CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT 'none',
  `sequence` tinyint(4) NOT NULL,
  `mother_page_id` int(10) unsigned DEFAULT NULL,
  `live` enum('yes','no') CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT 'yes',
  `menu` enum('top','bottom','internal') CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `parameters` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webpages`
--

LOCK TABLES `webpages` WRITE;
/*!40000 ALTER TABLE `webpages` DISABLE KEYS */;
INSERT INTO `webpages` VALUES (1,'Website','Hallo Welt','/','none',1,NULL,'yes','top',NULL,'2010-08-24 18:30:43'),(5,'Interner Bereich','#Interner Bereich\r\n\r\n## Website\r\n\r\n* [Webseiten](/db/webpages)\r\n\r\n## Hilfe\r\n\r\n* [Markdown](/hilfe/markdown)\r\n\r\n## Administrative Tabellen (Zugriff normalerweise nicht notwendig)\r\n\r\n* [Umleitungen](/db/redirects), falls sich eine Web-Adresse mal geändert hat.\r\n* [Protokoll der Änderungen](/db/logging)\r\n* [Tabellenbeziehungen](/db/relations)\r\n* [Logins](/db/logins)\r\n\r\n## [Logout](/logout/)\r\n','/db','/',2,NULL,'yes','internal',NULL,'2010-07-13 12:35:35'),(6,'Datenbankskripte','%%% tables * %%%','/db*','none',1,5,'yes',NULL,NULL,'2009-02-23 22:08:18'),(7,'Login','%%% request login %%%','/login','/',0,5,'yes',NULL,NULL,'2009-01-21 10:22:27'),(8,'Logout','%%% request logout %%%','/logout','/',10,5,'yes','internal',NULL,'2009-03-12 19:50:33'),(9,'Markdown-Hilfe','# Markdown\r\n\r\n## HTML\r\n\r\nHTML kann direkt in den Text geschrieben werden und wird direkt ausgegeben. Blockelemente sollten durch Leerzeilen vom Text abgetrennt und die Start- und Endmarkierungen nicht eingerückt werden. Innerhalb von HTML-Blockelementen (Tabellen, Überschriften, Absätzen etc.) wird kein Markdown interpretiert.\r\n\r\nBeispiel:\r\n\r\n	Normaler Absatz.\r\n\r\n	<table>\r\n		<tr>\r\n			<td>Bla</td>\r\n		</tr>\r\n	</table>\r\n	\r\n	Neuer Absatz, hier kann auch eine \r\n	<abbr title=\"Abkürzung\">Abk.</abbr> eingebaut werden.\r\n\r\n## Sonderzeichen\r\n\r\n& sowie < und > werden von Markdown automatisch maskiert.\r\n\r\n## Block-Elemente\r\n\r\n### Absätze und Zeilenumbrüche\r\n\r\nEin Absatz besteht aus mehreren Zeilen, die von anderen Absätzen durch eine Leerzeile abgetrennt werden.\r\n\r\nZeilenumbrüche können durch das Einfügen von zwei Leerzeichen am Ende einer Zeile erzwungen werden.\r\n\r\n### Überschriften\r\n\r\n	Dies ist eine Überschrift 1. Ordnung (H1)\r\n	=========================================\r\n\r\n	Dies ist eine Überschrift 2. Ordnung (H2)\r\n	-----------------------------------------\r\n\r\noder\r\n\r\n	# Dies ist eine H1\r\n\r\n	## Dies ist eine H2\r\n\r\n	###### Dies ist eine H6\r\n\r\noder\r\n\r\n	# Dies ist eine H1 #\r\n\r\n	## Dies ist eine H2 ##\r\n\r\n	### Dies ist eine H3 ######\r\n\r\n### Zitate\r\n\r\n	> Zitatblöcke funktionieren wie in E-Mails.\r\n	> Zitate können auch verschachtelt werden:\r\n	>> Dies ist ein Zitat von meinem Vorredner.\r\n\r\n### Listen\r\n\r\n	* unsortierte Listen werden mit * oder\r\n	* mit - oder\r\n	* mit + als erstem Zeichen einer Zeile markiert.\r\n\r\n	1. Sortierte Listen\r\n	2. beginnen mit Zahlen, Punkt und Leerzeichen\r\n	\r\n	* Hierarchische Listen\r\n	  * mit zwei Leerzeichen Einrückung\r\n	  * dann wird die Liste automatisch hierarchisch dargestellt\r\n	* weitere Punkte wieder ausgerückt\r\n\r\nDa jede Nummer mit Punkt und Leerzeichen dazu führt, dass Text als Listeneintrag interpretiert wird, kann man dies durch Einfügen eines \\ verhindern:\r\n\r\n	1986\\. Was für ein wundervolles Jahr.\r\n	\r\n### Code-Blöcke\r\n\r\nCode-Blöcke (Programmauszüge, HTML-Schnipsel) werden mit vier Leerzeichen oder einem Tabulator eingerückt und werden dann so dargestellt wie eingegeben.\r\n\r\n### Horizontale Linien\r\n\r\n	* * *\r\n\r\n	***\r\n\r\n	*****\r\n\r\n	- - -\r\n\r\n	---------------------------------------\r\n\r\n	_ _ _\r\n\r\n## Text-Elemente\r\n\r\n### Links\r\n\r\nDirekt im Text:\r\n\r\n	Dies ist [ein Beispiel](http://example.com/ \"Titel\") Inline-Link.\r\n	\r\n	[Dieser Link](http://example.net/) hat kein Titel-Attribut.\r\n\r\n	Auf der Seite [Über mich](/about/) gibt es weitere Informationen.\r\n\r\nOder als Referenz im Text, mit Angabe der URL am Ende eines Textes. Groß- und Kleinschreibung wird dabei nicht beachtet.\r\n\r\n	Dies ist [ein Beispiel][id] für einen Referenz-Link.\r\n\r\n	[id]: http://example.com/  \"Optionalen Titel hier eintragen\"\r\n\r\nLinkreferenzen können auch abgekürzt werden:\r\n\r\n	[Google][]\r\n	\r\n	[Google]: http://google.com/\r\n\r\n### Betonung\r\n\r\n	*Betonter Text, wird meist kursiv dargestellt*\r\n\r\n	_Betonter Text, wird meist kursiv dargestellt_\r\n	\r\n	**Stark betonter Text, wird meist fett dargestellt**\r\n	\r\n	__Stark betonter Text, wird meist fett dargestellt__\r\n	\r\n	\\*Text, von Sternchen umschlossen \\*\r\n\r\n### Code\r\n\r\nCode-Blöcke werden in Zollzeichen (\'\' \' \'\') eingebunden. Enthält der Code selber ein Zollzeichen, muß der Code mit zwei Zollzeichen eingeführt und beendet werden.\r\n\r\n	Z. B. HTML-Code: \'<title>\' \r\n	\r\n	\'\'Code mit \' im Text.\'\'\r\n	\r\n\r\n### Grafiken\r\n\r\nDirekt im Text\r\n\r\n	![Alternativer Text](/pfad/zu/img.jpg)\r\n\r\n	![Alternativer Text](/pfad/zu/img.jpg \"Optionaler Titel\")\r\n\r\noder als Referenz im Text, mit Angabe der URL am Ende eines Textes\r\n\r\n	![Alternativer Text][id]\r\n\r\n	[id]: url/zur/grafik  \"Optionales title-Attribut\"\r\n\r\n### einfache Links\r\n\r\n	<http://www.example.com/>\r\n\r\n	<address@example.com>\r\n\r\n### Maskierung\r\n\r\nDa einige Zeichen an bestimmten Stellen in Markdown eine besondere Bedeutung haben, muß man sie mit einem \'\\\' maskieren, wenn man sie trotzdem darstellen möchte:\r\n\r\n	\\ \' * _ {} [] () # + - . !\r\n\r\n***\r\n	\r\n* [Komplette Referenz Markdown, Original auf Englisch](http://daringfireball.net/projects/markdown/syntax)\r\n* [Komplette Referenz Markdown, Deutsche Übersetzung](http://markdown.de/syntax/)\r\n\r\n***\r\n\r\nMarkdown-Extra            {#extra}\r\n==============\r\n\r\nMarkdown-Extra ist eine Erweiterung zu Markdown. Dadurch gibt es ein paar weitere Möglichkeiten:\r\n\r\n### Abkürzungen\r\n\r\nsehen ähnlich wie Links aus und werden an das Ende des Textes gestellt. Die Abkürzung wird dann überall im Text automatisch mit der Langform hinterlegt. \r\n\r\n	*[BBR]: Bundesamt für Bauwesen und Raumordnung\r\n\r\n### Tabellen\r\n\r\nsind etwas komplizierter: einzelne Tabellenzellen werden durch | getrennt, jede Tabelle benötigt einen Tabellenkopf (wichtig auch für die Barrierefreiheit)\r\n\r\n  Tabellenbeispiel:\r\n\r\n	Jahr    | Ereignis \r\n	------- | ------------------\r\n	1969    | Mondlandung\r\n	1989    | Mauerfall \r\n\r\n### Markdown innerhalb von HTML-Blöcken\r\n\r\nfunktioniert mit &lt;div markdown=\"1\"> ... &lt;/div> - so kann man z. B. einfach Klassen auf Markdown-Bereiche anwenden und den Bereich darüber formatieren.\r\n\r\nDazu kommen weitere Formatierungsmöglichkeiten für Fußnoten, Definitionslisten (in HTML: DL, DT, DD) und Linkanker bei Überschriften.\r\n\r\n***\r\n\r\n* [Komplette Referenz Markdown-Extra, Original auf Englisch](http://michelf.com/projects/php-markdown/extra/)\r\n','/hilfe/markdown','none',9,5,'yes',NULL,NULL,'2009-03-12 19:50:44'),(10,'Datenbankverwaltung','%%% request maintenance %%%','/db/maintenance','/',7,5,'yes',NULL,NULL,'2010-06-08 11:43:40');
/*!40000 ALTER TABLE `webpages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
