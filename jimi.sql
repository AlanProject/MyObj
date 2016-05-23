-- MySQL dump 10.13  Distrib 5.5.20, for Win32 (x86)
--
-- Host: localhost    Database: jimi
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add dog info',7,'add_doginfo'),(20,'Can change dog info',7,'change_doginfo'),(21,'Can delete dog info',7,'delete_doginfo'),(22,'Can add dog type',8,'add_dogtype'),(23,'Can change dog type',8,'change_dogtype'),(24,'Can delete dog type',8,'delete_dogtype'),(25,'Can add user profile',9,'add_userprofile'),(26,'Can change user profile',9,'change_userprofile'),(27,'Can delete user profile',9,'delete_userprofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$bxXWlMd9unUT$v+6krSIJl7XhNEQ9cOiDEdVeZKttw0N7/v+sHZc8s30=','2016-05-15 11:58:42',1,'alan','','','',1,1,'2016-05-03 09:29:35');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-05-03 09:30:27','1','DogInfo object',1,'Added.',7,1),(2,'2016-05-04 09:01:31','19','DogType object',3,'',8,1),(3,'2016-05-04 09:01:31','18','DogType object',3,'',8,1),(4,'2016-05-04 09:01:31','17','DogType object',3,'',8,1),(5,'2016-05-04 09:01:31','16','DogType object',3,'',8,1),(6,'2016-05-04 09:01:31','15','DogType object',3,'',8,1),(7,'2016-05-04 09:01:31','14','DogType object',3,'',8,1),(8,'2016-05-04 09:01:31','13','DogType object',3,'',8,1),(9,'2016-05-04 09:01:31','12','DogType object',3,'',8,1),(10,'2016-05-04 09:01:31','11','DogType object',3,'',8,1),(11,'2016-05-04 09:01:32','10','DogType object',3,'',8,1),(12,'2016-05-04 09:01:32','9','DogType object',3,'',8,1),(13,'2016-05-04 09:01:32','8','DogType object',3,'',8,1),(14,'2016-05-04 09:01:32','7','DogType object',3,'',8,1),(15,'2016-05-04 09:01:32','6','DogType object',3,'',8,1),(16,'2016-05-04 09:01:32','5','DogType object',3,'',8,1),(17,'2016-05-04 09:01:32','4','DogType object',3,'',8,1),(18,'2016-05-04 09:01:44','119','DogType object',3,'',8,1),(19,'2016-05-04 09:01:44','118','DogType object',3,'',8,1),(20,'2016-05-04 09:01:44','117','DogType object',3,'',8,1),(21,'2016-05-04 09:01:44','116','DogType object',3,'',8,1),(22,'2016-05-04 09:01:44','115','DogType object',3,'',8,1),(23,'2016-05-04 09:01:44','114','DogType object',3,'',8,1),(24,'2016-05-04 09:01:44','113','DogType object',3,'',8,1),(25,'2016-05-04 09:01:44','112','DogType object',3,'',8,1),(26,'2016-05-04 09:01:44','111','DogType object',3,'',8,1),(27,'2016-05-04 09:01:44','110','DogType object',3,'',8,1),(28,'2016-05-04 09:01:45','109','DogType object',3,'',8,1),(29,'2016-05-04 09:01:45','108','DogType object',3,'',8,1),(30,'2016-05-04 09:01:45','107','DogType object',3,'',8,1),(31,'2016-05-04 09:01:45','106','DogType object',3,'',8,1),(32,'2016-05-04 09:01:45','105','DogType object',3,'',8,1),(33,'2016-05-04 09:01:45','104','DogType object',3,'',8,1),(34,'2016-05-04 09:01:45','103','DogType object',3,'',8,1),(35,'2016-05-04 09:01:45','102','DogType object',3,'',8,1),(36,'2016-05-04 09:01:45','101','DogType object',3,'',8,1),(37,'2016-05-04 09:01:45','100','DogType object',3,'',8,1),(38,'2016-05-04 09:01:45','99','DogType object',3,'',8,1),(39,'2016-05-04 09:01:45','98','DogType object',3,'',8,1),(40,'2016-05-04 09:01:45','97','DogType object',3,'',8,1),(41,'2016-05-04 09:01:45','96','DogType object',3,'',8,1),(42,'2016-05-04 09:01:45','95','DogType object',3,'',8,1),(43,'2016-05-04 09:01:45','94','DogType object',3,'',8,1),(44,'2016-05-04 09:01:45','93','DogType object',3,'',8,1),(45,'2016-05-04 09:01:45','92','DogType object',3,'',8,1),(46,'2016-05-04 09:01:45','91','DogType object',3,'',8,1),(47,'2016-05-04 09:01:45','90','DogType object',3,'',8,1),(48,'2016-05-04 09:01:45','89','DogType object',3,'',8,1),(49,'2016-05-04 09:01:45','88','DogType object',3,'',8,1),(50,'2016-05-04 09:01:45','87','DogType object',3,'',8,1),(51,'2016-05-04 09:01:45','86','DogType object',3,'',8,1),(52,'2016-05-04 09:01:45','85','DogType object',3,'',8,1),(53,'2016-05-04 09:01:45','84','DogType object',3,'',8,1),(54,'2016-05-04 09:01:45','83','DogType object',3,'',8,1),(55,'2016-05-04 09:01:45','82','DogType object',3,'',8,1),(56,'2016-05-04 09:01:45','81','DogType object',3,'',8,1),(57,'2016-05-04 09:01:45','80','DogType object',3,'',8,1),(58,'2016-05-04 09:01:45','79','DogType object',3,'',8,1),(59,'2016-05-04 09:01:45','78','DogType object',3,'',8,1),(60,'2016-05-04 09:01:45','77','DogType object',3,'',8,1),(61,'2016-05-04 09:01:45','76','DogType object',3,'',8,1),(62,'2016-05-04 09:01:45','75','DogType object',3,'',8,1),(63,'2016-05-04 09:01:45','74','DogType object',3,'',8,1),(64,'2016-05-04 09:01:45','73','DogType object',3,'',8,1),(65,'2016-05-04 09:01:45','72','DogType object',3,'',8,1),(66,'2016-05-04 09:01:45','71','DogType object',3,'',8,1),(67,'2016-05-04 09:01:45','70','DogType object',3,'',8,1),(68,'2016-05-04 09:01:45','69','DogType object',3,'',8,1),(69,'2016-05-04 09:01:45','68','DogType object',3,'',8,1),(70,'2016-05-04 09:01:45','67','DogType object',3,'',8,1),(71,'2016-05-04 09:01:45','66','DogType object',3,'',8,1),(72,'2016-05-04 09:01:45','65','DogType object',3,'',8,1),(73,'2016-05-04 09:01:45','64','DogType object',3,'',8,1),(74,'2016-05-04 09:01:45','63','DogType object',3,'',8,1),(75,'2016-05-04 09:01:45','62','DogType object',3,'',8,1),(76,'2016-05-04 09:01:46','61','DogType object',3,'',8,1),(77,'2016-05-04 09:01:46','60','DogType object',3,'',8,1),(78,'2016-05-04 09:01:46','59','DogType object',3,'',8,1),(79,'2016-05-04 09:01:46','58','DogType object',3,'',8,1),(80,'2016-05-04 09:01:46','57','DogType object',3,'',8,1),(81,'2016-05-04 09:01:46','56','DogType object',3,'',8,1),(82,'2016-05-04 09:01:46','55','DogType object',3,'',8,1),(83,'2016-05-04 09:01:46','54','DogType object',3,'',8,1),(84,'2016-05-04 09:01:46','53','DogType object',3,'',8,1),(85,'2016-05-04 09:01:46','52','DogType object',3,'',8,1),(86,'2016-05-04 09:01:46','51','DogType object',3,'',8,1),(87,'2016-05-04 09:01:46','50','DogType object',3,'',8,1),(88,'2016-05-04 09:01:46','49','DogType object',3,'',8,1),(89,'2016-05-04 09:01:46','48','DogType object',3,'',8,1),(90,'2016-05-04 09:01:46','47','DogType object',3,'',8,1),(91,'2016-05-04 09:01:46','46','DogType object',3,'',8,1),(92,'2016-05-04 09:01:46','45','DogType object',3,'',8,1),(93,'2016-05-04 09:01:46','44','DogType object',3,'',8,1),(94,'2016-05-04 09:01:46','43','DogType object',3,'',8,1),(95,'2016-05-04 09:01:46','42','DogType object',3,'',8,1),(96,'2016-05-04 09:01:46','41','DogType object',3,'',8,1),(97,'2016-05-04 09:01:46','40','DogType object',3,'',8,1),(98,'2016-05-04 09:01:46','39','DogType object',3,'',8,1),(99,'2016-05-04 09:01:46','38','DogType object',3,'',8,1),(100,'2016-05-04 09:01:46','37','DogType object',3,'',8,1),(101,'2016-05-04 09:01:46','36','DogType object',3,'',8,1),(102,'2016-05-04 09:01:46','35','DogType object',3,'',8,1),(103,'2016-05-04 09:01:46','34','DogType object',3,'',8,1),(104,'2016-05-04 09:01:46','33','DogType object',3,'',8,1),(105,'2016-05-04 09:01:46','32','DogType object',3,'',8,1),(106,'2016-05-04 09:01:46','31','DogType object',3,'',8,1),(107,'2016-05-04 09:01:46','30','DogType object',3,'',8,1),(108,'2016-05-04 09:01:46','29','DogType object',3,'',8,1),(109,'2016-05-04 09:01:46','28','DogType object',3,'',8,1),(110,'2016-05-04 09:01:46','27','DogType object',3,'',8,1),(111,'2016-05-04 09:01:46','26','DogType object',3,'',8,1),(112,'2016-05-04 09:01:46','25','DogType object',3,'',8,1),(113,'2016-05-04 09:01:46','24','DogType object',3,'',8,1),(114,'2016-05-04 09:01:46','23','DogType object',3,'',8,1),(115,'2016-05-04 09:01:46','22','DogType object',3,'',8,1),(116,'2016-05-04 09:01:46','21','DogType object',3,'',8,1),(117,'2016-05-04 09:01:46','20','DogType object',3,'',8,1),(118,'2016-05-04 09:28:49','1','UserProfile object',1,'Added.',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'dog','doginfo'),(8,'dog','dogtype'),(9,'dog','userprofile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-05-03 09:25:00'),(2,'auth','0001_initial','2016-05-03 09:25:02'),(3,'admin','0001_initial','2016-05-03 09:25:03'),(4,'admin','0002_logentry_remove_auto_add','2016-05-03 09:25:03'),(5,'contenttypes','0002_remove_content_type_name','2016-05-03 09:25:03'),(6,'auth','0002_alter_permission_name_max_length','2016-05-03 09:25:03'),(7,'auth','0003_alter_user_email_max_length','2016-05-03 09:25:04'),(8,'auth','0004_alter_user_username_opts','2016-05-03 09:25:04'),(9,'auth','0005_alter_user_last_login_null','2016-05-03 09:25:04'),(10,'auth','0006_require_contenttypes_0002','2016-05-03 09:25:04'),(11,'auth','0007_alter_validators_add_error_messages','2016-05-03 09:25:04'),(13,'sessions','0001_initial','2016-05-03 09:25:04'),(15,'dog','0001_initial','2016-05-04 07:28:27'),(16,'dog','0002_auto_20160504_1138','2016-05-04 07:28:28'),(17,'dog','0003_userprofile','2016-05-04 07:28:28'),(18,'dog','0004_doginfo_author','2016-05-04 07:28:29'),(19,'dog','0005_auto_20160504_1452','2016-05-04 07:28:30'),(20,'dog','0006_auto_20160504_1454','2016-05-04 07:28:30'),(21,'dog','0007_auto_20160504_1518','2016-05-04 07:28:31'),(22,'dog','0008_auto_20160504_1520','2016-05-04 07:28:31'),(23,'dog','0009_auto_20160504_1529','2016-05-04 07:29:36'),(24,'dog','0010_auto_20160515_1713','2016-05-15 09:14:11');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a7q25rzq51sfq7rer1bs6m0eyopavgdh','NmY1NGRjNmI4YWJiNGI3Y2FhZDZlN2RjZjA0MmQzODVmMzc5Y2QzYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlYjQ0ZDJhNTNmMWQzNzc4OWM5NTVjOTdjOTU4OWIxZjdiZDEwODEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-29 11:51:30'),('bnlljtk03x79oea18wd2ysord91mci5w','NmY1NGRjNmI4YWJiNGI3Y2FhZDZlN2RjZjA0MmQzODVmMzc5Y2QzYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlYjQ0ZDJhNTNmMWQzNzc4OWM5NTVjOTdjOTU4OWIxZjdiZDEwODEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-22 12:43:19'),('ht3z34dqbkkj6h7edvr3ch698enwvmjr','NmY1NGRjNmI4YWJiNGI3Y2FhZDZlN2RjZjA0MmQzODVmMzc5Y2QzYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlYjQ0ZDJhNTNmMWQzNzc4OWM5NTVjOTdjOTU4OWIxZjdiZDEwODEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-19 06:24:10'),('oywl480k7eb87src6s7p0pvlwm41cz83','YjUxYWYzMTU0MDg2YjUyMjRkN2YxOWMzYTUyOGE2YWM0ZDMyNjIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlYjQ0ZDJhNTNmMWQzNzc4OWM5NTVjOTdjOTU4OWIxZjdiZDEwODEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-05-29 11:58:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dog_doginfo`
--

DROP TABLE IF EXISTS `dog_doginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dog_doginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DogName` varchar(32) NOT NULL,
  `DogColor` varchar(32) NOT NULL,
  `DogImg` varchar(100) NOT NULL,
  `DogDescribe` varchar(64) NOT NULL,
  `DogText` longtext NOT NULL,
  `Author_id` int(11) NOT NULL,
  `DogType_id` int(11) NOT NULL,
  `Create_date` date NOT NULL,
  `Update_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dog_doginfo_bad6f5b7` (`Author_id`),
  KEY `dog_doginfo_8fde5316` (`DogType_id`),
  CONSTRAINT `dog_doginfo_Author_id_25d2d543_fk_dog_userprofile_id` FOREIGN KEY (`Author_id`) REFERENCES `dog_userprofile` (`id`),
  CONSTRAINT `dog_doginfo_DogType_id_7e2ae85e_fk_dog_dogtype_id` FOREIGN KEY (`DogType_id`) REFERENCES `dog_dogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog_doginfo`
--

LOCK TABLES `dog_doginfo` WRITE;
/*!40000 ALTER TABLE `dog_doginfo` DISABLE KEYS */;
INSERT INTO `dog_doginfo` VALUES (9,'bigdog01','黑色','/static/imgs/1/big02.jpg','bigdog01bigdog01bigdog01','<p>bigdog01bigdog01bigdog01bigdog01bigdog01bigdog01bigdog01</p>',1,1,'2016-05-15','2016-05-15'),(10,'小狗狗','黑白','/static/imgs/1/smail02.jpg','小狗狗小狗狗小狗狗','<p>小狗狗小狗狗小狗狗小狗狗小狗狗小狗狗小狗狗小狗狗</p>',1,3,'2016-05-15','2016-05-15'),(11,'哼哈二将','黑','/static/imgs/1/z01.jpg','哼哈二将哼哈二将哼哈二将哼哈二将','<p>哼哈二将哼哈二将哼哈二将哼哈二将哼哈二将哼哈二将哼哈二将哼哈二将哼哈二将</p>',1,2,'2016-05-15','2016-05-15'),(12,'大型汪星人','黑色','/static/imgs/1/z02.jpg','大型汪星人来袭你做好准备了么','<p><strong>看护<strong>犬</strong></strong>：守护人类安全与财产、看家护院&hellip;。</p>\r\n\r\n<p><strong><a href=\"http://baike.baidu.com/view/1803327.htm\" target=\"_blank\"><strong>玩赏犬</strong></a></strong>：陪伴、玩赏&hellip;。</p>\r\n\r\n<p><a href=\"http://baike.baidu.com/view/1283047.htm\" target=\"_blank\"><strong>狩猎犬</strong></a><strong>：</strong>狩猎冲锋&hellip;。</p>\r\n\r\n<p><a href=\"http://baike.baidu.com/view/896348.htm\" target=\"_blank\"><strong>畜牧<strong>犬</strong></strong></a>：牧羊犬、牧牛犬&hellip;。<img src=\"http://c.hiphotos.baidu.com/baike/s%3D220/sign=d971b22b7bf0f736dcfe4b033a55b382/7af40ad162d9f2d32539a0bbaaec8a136327ccbe.jpg\" /></p>\r\n\r\n<p><strong>医<strong>疗</strong>犬</strong>：因为狗天性乐观、所以适合照顾和陪伴心里病症者、抑郁症患者、自闭症患者（不包括暴力患者）；前提是选择已经<a href=\"http://baike.baidu.com/view/873369.htm\" target=\"_blank\">驯化</a>好的不会捣乱添乱的狗、否则可能增加负担导致病症加重。</p>\r\n\r\n<p><strong><strong>护理</strong></strong><strong><strong>犬</strong></strong>：照顾生活自理困难的人、瘫痪者；可帮人脱鞋/袜、插卡取款、开/关门、开/关灯、推/拉车、从冰箱取物&hellip;。</p>\r\n\r\n<p><a href=\"http://baike.baidu.com/view/325940.htm\" target=\"_blank\"><strong>导盲犬</strong></a>：相比护理犬的责任更重些，时刻陪伴主人，主人做的大多事都需要导盲犬辅助；引导主人过马路，狗独自去买东西&hellip;。</p>\r\n\r\n<p><strong>军用犬：</strong>有些国家专门设有军犬勋章；<a href=\"http://baike.baidu.com/view/1233693.htm\" target=\"_blank\">军犬</a>、<a href=\"http://baike.baidu.com/view/33730.htm\" target=\"_blank\">警犬</a>、海关<a href=\"http://baike.baidu.com/view/65042.htm\" target=\"_blank\">缉毒犬</a>、机场<a href=\"http://baike.baidu.com/subview/3606/5031652.htm\" target=\"_blank\">火药</a>监测犬&hellip;。</p>\r\n\r\n<p><a href=\"http://baike.baidu.com/view/634504.htm\" target=\"_blank\"><strong><strong>搜</strong>救<strong>犬</strong></strong></a>：<a href=\"http://baike.baidu.com/view/39897.htm\" target=\"_blank\">雪崩</a>、地震、火灾等灾害发生作搜救工作。</p>\r\n\r\n<p><strong>交通<strong>犬</strong></strong>：如北极圈附近的<a href=\"http://baike.baidu.com/view/6122.htm\" target=\"_blank\">爱斯基摩人</a>和中国东北有些人使用&ldquo;<a href=\"http://baike.baidu.com/view/9028.htm\" target=\"_blank\">雪橇犬</a>&rdquo;。</p>\r\n\r\n<p><strong>表演<strong>犬</strong></strong>：大多马戏团都有专门用于表演的犬、有很多本领、才艺&hellip;。</p>',1,1,'2016-05-15','2016-05-15'),(13,'大型汪星人','黑色','/static/imgs/1/z02.jpg','大型汪星人来袭你做好准备了么','<p><strong>看护<strong>犬</strong></strong>：守护人类安全与财产、看家护院&hellip;。</p>\r\n\r\n<p><strong><a href=\"http://baike.baidu.com/view/1803327.htm\" target=\"_blank\"><strong>玩赏犬</strong></a></strong>：陪伴、玩赏&hellip;。</p>\r\n\r\n<p><a href=\"http://baike.baidu.com/view/1283047.htm\" target=\"_blank\"><strong>狩猎犬</strong></a><strong>：</strong>狩猎冲锋&hellip;。</p>\r\n\r\n<p><a href=\"http://baike.baidu.com/view/896348.htm\" target=\"_blank\"><strong>畜牧<strong>犬</strong></strong></a>：牧羊犬、牧牛犬&hellip;。<img src=\"http://c.hiphotos.baidu.com/baike/s%3D220/sign=d971b22b7bf0f736dcfe4b033a55b382/7af40ad162d9f2d32539a0bbaaec8a136327ccbe.jpg\" /></p>\r\n\r\n<p><strong>医<strong>疗</strong>犬</strong>：因为狗天性乐观、所以适合照顾和陪伴心里病症者、抑郁症患者、自闭症患者（不包括暴力患者）；前提是选择已经<a href=\"http://baike.baidu.com/view/873369.htm\" target=\"_blank\">驯化</a>好的不会捣乱添乱的狗、否则可能增加负担导致病症加重。</p>\r\n\r\n<p><strong><strong>护理</strong></strong><strong><strong>犬</strong></strong>：照顾生活自理困难的人、瘫痪者；可帮人脱鞋/袜、插卡取款、开/关门、开/关灯、推/拉车、从冰箱取物&hellip;。</p>\r\n\r\n<p><a href=\"http://baike.baidu.com/view/325940.htm\" target=\"_blank\"><strong>导盲犬</strong></a>：相比护理犬的责任更重些，时刻陪伴主人，主人做的大多事都需要导盲犬辅助；引导主人过马路，狗独自去买东西&hellip;。</p>\r\n\r\n<p><strong>军用犬：</strong>有些国家专门设有军犬勋章；<a href=\"http://baike.baidu.com/view/1233693.htm\" target=\"_blank\">军犬</a>、<a href=\"http://baike.baidu.com/view/33730.htm\" target=\"_blank\">警犬</a>、海关<a href=\"http://baike.baidu.com/view/65042.htm\" target=\"_blank\">缉毒犬</a>、机场<a href=\"http://baike.baidu.com/subview/3606/5031652.htm\" target=\"_blank\">火药</a>监测犬&hellip;。</p>\r\n\r\n<p><a href=\"http://baike.baidu.com/view/634504.htm\" target=\"_blank\"><strong><strong>搜</strong>救<strong>犬</strong></strong></a>：<a href=\"http://baike.baidu.com/view/39897.htm\" target=\"_blank\">雪崩</a>、地震、火灾等灾害发生作搜救工作。</p>\r\n\r\n<p><strong>交通<strong>犬</strong></strong>：如北极圈附近的<a href=\"http://baike.baidu.com/view/6122.htm\" target=\"_blank\">爱斯基摩人</a>和中国东北有些人使用&ldquo;<a href=\"http://baike.baidu.com/view/9028.htm\" target=\"_blank\">雪橇犬</a>&rdquo;。</p>\r\n\r\n<p><strong>表演<strong>犬</strong></strong>：大多马戏团都有专门用于表演的犬、有很多本领、才艺&hellip;。</p>',1,1,'2016-05-15','2016-05-15'),(14,'狼狗','黄色','/static/imgs/1/big03.jpg','居家过日子必备的大狼狗','<p>狗是一种很常见的犬科<a href=\"http://baike.baidu.com/subview/30264/9413853.htm\" target=\"_blank\">哺乳动物</a>，也是饲养率最高的宠物。</p>\r\n\r\n<p>据联合国统计，全球总犬数约有六亿只，我国大约有两亿只。犬是人类最早<a href=\"http://baike.baidu.com/view/263719.htm\" target=\"_blank\">驯养</a>的动物。</p>\r\n\r\n<p><a name=\"2\"></a><a name=\"sub11215001_2\"></a><a name=\"优点贡献\"></a></p>',1,1,'2016-05-15','2016-05-15'),(15,'小松狮','黄色','/static/imgs/1/u=2350085257,1872634976&fm=21&gp=0.jpg','小松狮小松狮小松狮小松狮小松狮小松狮小松狮小松狮','<p>小松狮小松狮小松狮小松狮小松狮小松狮小松狮小松狮小松狮</p>',1,3,'2016-05-15','2016-05-15'),(16,'哈士奇','黑白','/static/imgs/1/38dbb6fd5266d016450b210c902bd40735fa3587.jpg','冲纯种进口哈士奇冲纯种进口哈士奇冲纯种进口哈士奇冲纯种进口哈士奇','<p>[gǒu] <a href=\"javascript:;\">&nbsp;</a></p>\r\n\r\n<h1>狗</h1>\r\n\r\n<h2>（犬科哺乳动物）</h2>\r\n\r\n<p><a href=\"javascript:;\">编辑</a></p>\r\n\r\n<p>狗，（拉丁文:Canis lupus familiaris,英文名称dog）中文亦称&ldquo;犬&rdquo;，狗属于食肉目，分布于世界各地。</p>\r\n\r\n<p>狗与<a href=\"http://baike.baidu.com/view/6117.htm\" target=\"_blank\">马</a>、<a href=\"http://baike.baidu.com/view/15780.htm\" target=\"_blank\">牛</a>、<a href=\"http://baike.baidu.com/view/120321.htm\" target=\"_blank\">羊</a>、猪、鸡并称&ldquo;<a href=\"http://baike.baidu.com/view/39141.htm\" target=\"_blank\">六畜</a>&rdquo;。</p>\r\n\r\n<p>有科学家认为狗是由早期人类从<a href=\"http://baike.baidu.com/view/548491.htm\" target=\"_blank\">灰狼</a>驯化而来，驯养时间在4万年前~1.5万年前，发展至今日。被称为&ldquo;人类最忠实的朋友&rdquo;，现如今是饲养率最高的宠物。其寿命约十多年。</p>\r\n\r\n<p>在中国文化中，狗属于<a href=\"http://baike.baidu.com/subview/11006/8831393.htm\" target=\"_blank\">十二生肖</a>之一，在十二生肖中排名第11位。</p>\r\n\r\n<p><a name=\"specialtopic\"></a></p>\r\n\r\n<p>夏季狗狗为什么总爱伸出舌头</p>\r\n\r\n<p><img src=\"http://h.hiphotos.baidu.com/baike/w%3D480/sign=8b37a07cf8edab6474724cc8c737af81/1e30e924b899a901633085811e950a7b0208f504.jpg\" /> 哺乳动物都是恒温动物，体温在任何季节都是恒定不变的，在炎热的夏季，需要通过分泌汗液散发热量，保持体温。狗的汗腺集中在舌头和脚趾上，因此当需要散热时，它们就会伸出舌头来增加散热量。</p>\r\n\r\n<p>狗狗运动后也会伸舌头<a href=\"http://baike.baidu.com/subview/8633/11215001.htm#6_5\" target=\"_blank\">更多</a></p>\r\n\r\n<p>其实，即使不在夏天，狗在奔跑、打架等剧烈运动后，也会伸出舌头，通过舌头&ldquo;出汗&rdquo;来为自己降温。</p>\r\n\r\n<p>狗的饮食禁忌<a href=\"http://baike.baidu.com/subview/8633/11215001.htm#8_1\" target=\"_blank\">更多</a></p>\r\n\r\n<p>狗是一种肉食动物，有时也会吃素食，但是狗有许多饮食禁忌，例如葡萄干、调味料里的盐都可能损伤狗的肾脏，带来致命伤害。</p>\r\n\r\n<p>相关词条：</p>',1,2,'2016-05-15','2016-05-15');
/*!40000 ALTER TABLE `dog_doginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dog_dogtype`
--

DROP TABLE IF EXISTS `dog_dogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dog_dogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog_dogtype`
--

LOCK TABLES `dog_dogtype` WRITE;
/*!40000 ALTER TABLE `dog_dogtype` DISABLE KEYS */;
INSERT INTO `dog_dogtype` VALUES (1,'大型犬'),(2,'中型犬'),(3,'小型犬');
/*!40000 ALTER TABLE `dog_dogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dog_userprofile`
--

DROP TABLE IF EXISTS `dog_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dog_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `dog_userprofile_user_id_4117c0c2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog_userprofile`
--

LOCK TABLES `dog_userprofile` WRITE;
/*!40000 ALTER TABLE `dog_userprofile` DISABLE KEYS */;
INSERT INTO `dog_userprofile` VALUES (1,'Alan',1);
/*!40000 ALTER TABLE `dog_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-15 23:21:50
