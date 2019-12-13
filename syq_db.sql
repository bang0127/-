-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: syq_db
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `likes` int(11) NOT NULL,
  `collects` int(11) NOT NULL,
  `owner_id` varchar(11) NOT NULL,
  `publish` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `albums_owner_id_3e51acdb_fk_user_username` (`owner_id`),
  CONSTRAINT `albums_owner_id_3e51acdb_fk_user_username` FOREIGN KEY (`owner_id`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (21,'【美景】旅游景色','今年去了世界各地旅游，随手拍了许多漂亮的美景，今天分享一些给大家。','2019-11-09 16:36:37.476660','2019-11-25 17:14:11.286693',1,61,1,'czc',1),(22,'俺的跑车','最近买了两辆新跑车给大家看看！','2019-11-09 16:38:26.455778','2019-11-22 16:29:01.414978',1,36,0,'czc',1),(29,'跑车','今天看到好多跑车，一激动都给拍下来了。','2019-11-09 17:17:37.582265','2019-11-22 16:57:07.383859',1,2,0,'czc',1),(30,'美女','今天给美女模特拍了组写真，给大家分享一下！！小姐姐漂亮的很！！','2019-11-09 17:19:21.031742','2019-11-22 17:04:18.941167',1,208,3,'xufan',1),(31,'去旅游了','上个礼拜出去旅游了，拍了些美景，喜欢的朋友点个赞吧！','2019-11-09 17:23:24.153212','2019-11-22 17:17:30.839185',1,1,1,'xufan',1),(32,'天气之子','跟女朋友去看了动漫电影天气之子，真是太好看了！！我一回来就去网上搜集了一些好看的壁纸。喜欢的朋友点个赞！','2019-11-09 17:25:40.027385','2019-11-22 17:17:53.553997',1,15,2,'xufan',1),(33,'王俊凯真棒！','王俊凯好帅！王俊凯加油！王俊凯最棒！','2019-11-09 17:29:36.933560','2019-11-22 16:54:35.125509',1,1,1,'xufan',1),(34,'【美食】今日餐饮','没什么好拍的了，今天给大家看看我一天的伙食吧！','2019-11-09 17:31:48.547872','2019-11-22 17:24:00.865550',1,2,1,'czc',1),(35,'家居内饰','新房子终于装修好了，大家看看装修的怎么样','2019-11-09 17:40:48.112601','2019-11-22 16:54:53.947452',1,1,0,'czc',1),(36,'看得你流口水','都是我喜欢的美女，分享给大家！求赞！','2019-11-09 17:43:23.120707','2019-11-25 17:17:55.150965',1,0,1,'wangyan',1),(37,'看得你又流口水','好看又漂亮的mm，喜欢点个赞，我还会持续更新','2019-11-09 17:44:57.865113','2019-11-09 17:44:57.865202',1,0,0,'wangyan',1),(38,'测试','测试一下','2019-11-09 18:19:31.791867','2019-11-09 18:19:31.791928',1,0,0,'wangyan',1),(39,'测试2','再测试一下','2019-11-09 18:22:02.365537','2019-11-09 18:22:02.365563',1,0,0,'wangyan',1),(40,'测试一下','就测试一下','2019-11-15 17:02:52.909818','2019-11-15 17:02:52.909886',1,0,0,'wangyan',1),(41,'这里风景不错','出去旅游散散心，顺便拍点照片','2019-11-19 16:10:49.707370','2019-11-22 16:54:48.935583',1,2,1,'czc',1),(42,'明星','我的易烊千玺','2019-11-19 16:12:52.560715','2019-11-19 16:12:52.560749',1,0,0,'czc',1),(43,'赵丽颖','美','2019-11-19 16:18:40.221354','2019-11-22 16:56:44.846820',1,1,1,'czc',1),(44,'今天我们吃顿好的','我要吃遍天下美食','2019-11-19 16:20:29.109253','2019-11-19 16:20:29.109282',1,0,0,'yonghu1',1),(45,'龙猫','好看','2019-11-19 16:23:51.364837','2019-11-22 16:57:09.835615',1,3,0,'yonghu1',1),(46,'家','家是心灵的港湾','2019-11-19 16:26:22.210627','2019-11-19 16:26:22.210653',1,0,0,'yonghu2',1),(47,'海贼王','海贼王壁纸','2019-11-25 11:37:09.126007','2019-11-25 11:37:30.193477',1,12,0,'zhujialei',1);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 用户表',7,'add_user'),(20,'Can change 用户表',7,'change_user'),(21,'Can delete 用户表',7,'delete_user'),(22,'Can add 相册表',8,'add_albums'),(23,'Can change 相册表',8,'change_albums'),(24,'Can delete 相册表',8,'delete_albums'),(25,'Can add 图片表',9,'add_pictures'),(26,'Can change 图片表',9,'change_pictures'),(27,'Can delete 图片表',9,'delete_pictures'),(28,'Can add 关系表',10,'add_relation'),(29,'Can change 关系表',10,'change_relation'),(30,'Can delete 关系表',10,'delete_relation'),(31,'Can add 收藏表',11,'add_collections'),(32,'Can change 收藏表',11,'change_collections'),(33,'Can delete 收藏表',11,'delete_collections'),(34,'Can add weibo user',12,'add_weibouser'),(35,'Can change weibo user',12,'change_weibouser'),(36,'Can delete weibo user',12,'delete_weibouser');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$u3U2n2LoDk0D$pl2SN8C51cVOlybzvBf9MPLGqY7rMKN9pYmRKsnZbI8=','2019-11-22 12:17:44.174315',1,'hxp','','','',1,1,'2019-11-05 08:16:20.367612');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collected_time` datetime(6) NOT NULL,
  `collected_album_id` int(11) NOT NULL,
  `collecter_id` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collections_collected_album_id_30abee14_fk_albums_id` (`collected_album_id`),
  KEY `collections_collecter_id_41ba254f_fk_user_username` (`collecter_id`),
  CONSTRAINT `collections_collected_album_id_30abee14_fk_albums_id` FOREIGN KEY (`collected_album_id`) REFERENCES `albums` (`id`),
  CONSTRAINT `collections_collecter_id_41ba254f_fk_user_username` FOREIGN KEY (`collecter_id`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,'2019-11-22 15:21:36.278474',45,'xufan'),(2,'2019-11-22 15:59:58.262355',30,'czc'),(4,'2019-11-22 16:45:54.434446',21,'czc'),(6,'2019-11-22 16:50:38.945968',32,'czc'),(7,'2019-11-22 16:51:25.601519',31,'czc'),(8,'2019-11-22 16:54:30.518298',30,'wangyan'),(9,'2019-11-22 16:54:35.053244',33,'wangyan'),(10,'2019-11-22 16:54:39.684370',41,'wangyan'),(11,'2019-11-22 16:56:44.753968',43,'wangyan'),(14,'2019-11-22 17:17:53.487047',32,'wangyan'),(15,'2019-11-22 17:24:00.821257',34,'wangyan'),(17,'2019-11-25 17:17:55.097362',36,'xufan');
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-05 08:24:26.332120','hxp','User object',3,'',7,1),(2,'2019-11-05 08:24:29.459771','ccc','User object',3,'',7,1),(3,'2019-11-07 20:38:51.630278','hxp','User object',3,'',7,1),(4,'2019-11-07 20:38:57.008148','xufan','User object',3,'',7,1),(5,'2019-11-08 16:08:46.291709','7','Albums object',3,'',8,1),(6,'2019-11-08 16:08:46.396594','5','Albums object',3,'',8,1),(7,'2019-11-08 16:08:46.541208','4','Albums object',3,'',8,1),(8,'2019-11-08 16:08:46.630380','3','Albums object',3,'',8,1),(9,'2019-11-08 20:27:17.586947','12','Albums object',3,'',8,1),(10,'2019-11-08 20:27:17.732918','11','Albums object',3,'',8,1),(11,'2019-11-09 12:21:42.168914','19','Albums object',3,'',8,1),(12,'2019-11-09 16:47:17.142618','xufan','User object',2,'[{\"changed\": {\"fields\": [\"nickname\", \"email\", \"sign\", \"info\", \"avatar\", \"login_time\"]}}]',7,1),(13,'2019-11-09 16:48:09.913916','czc','User object',2,'[{\"changed\": {\"fields\": [\"nickname\", \"email\", \"sign\", \"info\", \"avatar\", \"login_time\"]}}]',7,1),(14,'2019-11-09 17:04:34.601995','22','Albums object',2,'[{\"changed\": {\"fields\": [\"likes\"]}}]',8,1),(15,'2019-11-09 17:05:17.100236','21','Albums object',2,'[{\"changed\": {\"fields\": [\"likes\"]}}]',8,1),(16,'2019-11-09 17:12:03.041010','26','Albums object',3,'',8,1),(17,'2019-11-09 17:12:03.129534','25','Albums object',3,'',8,1),(18,'2019-11-09 17:12:03.263259','24','Albums object',3,'',8,1),(19,'2019-11-09 17:19:29.098858','28','Albums object',3,'',8,1),(20,'2019-11-09 17:19:29.206941','27','Albums object',3,'',8,1),(21,'2019-11-09 17:19:37.561001','23','Albums object',3,'',8,1),(22,'2019-11-09 17:19:48.699524','20','Albums object',3,'',8,1),(23,'2019-11-09 17:19:48.818937','18','Albums object',3,'',8,1),(24,'2019-11-09 17:19:48.929734','6','Albums object',3,'',8,1),(25,'2019-11-09 17:19:48.985442','2','Albums object',3,'',8,1),(26,'2019-11-09 17:19:49.096953','1','Albums object',3,'',8,1),(27,'2019-11-09 18:18:32.436737','63','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(28,'2019-11-09 18:18:32.547770','62','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(29,'2019-11-09 18:18:32.659221','61','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(30,'2019-11-09 18:18:32.881511','60','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(31,'2019-11-09 18:18:32.993481','58','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(32,'2019-11-09 18:18:33.104736','57','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(33,'2019-11-09 18:18:33.216381','56','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(34,'2019-11-09 18:18:33.327199','55','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(35,'2019-11-09 18:18:33.438729','54','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(36,'2019-11-09 18:18:33.550020','52','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(37,'2019-11-09 18:18:33.661319','51','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(38,'2019-11-09 18:18:33.772507','50','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(39,'2019-11-09 18:18:33.883905','48','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(40,'2019-11-09 18:18:33.995040','47','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(41,'2019-11-09 18:18:34.106572','46','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(42,'2019-11-09 18:18:34.217638','45','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(43,'2019-11-09 18:18:34.329199','43','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(44,'2019-11-09 18:18:34.440531','42','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(45,'2019-11-09 18:18:34.551865','41','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(46,'2019-11-09 18:18:34.663233','40','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(47,'2019-11-09 18:18:34.774734','39','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(48,'2019-11-09 18:18:34.885952','37','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(49,'2019-11-09 18:18:34.986057','36','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(50,'2019-11-09 18:18:35.075242','35','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(51,'2019-11-09 18:18:35.164143','33','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(52,'2019-11-09 18:18:35.253247','32','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(53,'2019-11-09 18:18:35.342410','31','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(54,'2019-11-09 18:18:35.431360','30','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(55,'2019-11-09 18:18:35.520533','29','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(56,'2019-11-09 18:18:35.609743','27','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(57,'2019-11-09 18:18:35.698787','26','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(58,'2019-11-09 18:18:35.788157','25','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(59,'2019-11-09 18:18:35.899219','23','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(60,'2019-11-09 18:18:35.999025','22','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(61,'2019-11-09 18:18:36.088596','21','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(62,'2019-11-09 18:18:36.199573','19','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(63,'2019-11-09 18:18:36.288494','18','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(64,'2019-11-09 18:18:36.388642','17','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(65,'2019-11-09 18:18:36.489230','15','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(66,'2019-11-09 18:18:36.600438','14','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(67,'2019-11-09 18:18:36.711774','13','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(68,'2019-11-09 18:18:36.823056','12','Pictures object',2,'[{\"changed\": {\"fields\": [\"cover\"]}}]',9,1),(69,'2019-11-11 19:28:31.723461','30','Albums object',2,'[{\"changed\": {\"fields\": [\"likes\"]}}]',8,1),(70,'2019-11-13 12:15:37.397406','3','Relation object',3,'',10,1),(71,'2019-11-13 12:16:07.145526','4','Relation object',3,'',10,1),(72,'2019-11-13 12:17:47.634580','5','Relation object',3,'',10,1),(73,'2019-11-13 12:20:47.445339','7','Relation object',3,'',10,1),(74,'2019-11-13 12:20:47.594660','6','Relation object',3,'',10,1),(75,'2019-11-13 12:29:51.566888','9','Relation object',3,'',10,1),(76,'2019-11-13 12:29:51.689219','8','Relation object',3,'',10,1),(77,'2019-11-13 12:35:50.904854','10','Relation object',3,'',10,1),(78,'2019-11-13 12:37:08.077094','11','Relation object',3,'',10,1),(79,'2019-11-13 12:45:52.097523','13','Relation object',3,'',10,1),(80,'2019-11-13 12:45:52.180161','12','Relation object',3,'',10,1),(81,'2019-11-22 15:21:36.278993','1','Collections object',1,'[{\"added\": {}}]',11,1),(82,'2019-11-22 15:59:58.263231','2','Collections object',1,'[{\"added\": {}}]',11,1),(83,'2019-11-22 16:32:11.519385','30','美女',2,'[{\"changed\": {\"fields\": [\"collects\"]}}]',8,1),(84,'2019-11-22 16:46:27.803004','21','【美景】旅游景色',2,'[{\"changed\": {\"fields\": [\"collects\"]}}]',8,1),(85,'2019-11-22 16:48:03.635512','3','Collections object',3,'',11,1),(86,'2019-11-22 17:04:49.800554','12','Collections object',3,'',11,1),(87,'2019-11-25 11:37:30.194280','47','海贼王',2,'[{\"changed\": {\"fields\": [\"likes\"]}}]',8,1);
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(8,'albums','albums'),(11,'albums','collections'),(9,'albums','pictures'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'user','relation'),(7,'user','user'),(12,'user','weibouser');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-05 08:07:57.307579'),(2,'auth','0001_initial','2019-11-05 08:08:08.502954'),(3,'admin','0001_initial','2019-11-05 08:08:10.937619'),(4,'admin','0002_logentry_remove_auto_add','2019-11-05 08:08:11.081910'),(5,'contenttypes','0002_remove_content_type_name','2019-11-05 08:08:12.397669'),(6,'auth','0002_alter_permission_name_max_length','2019-11-05 08:08:13.505421'),(7,'auth','0003_alter_user_email_max_length','2019-11-05 08:08:14.395809'),(8,'auth','0004_alter_user_username_opts','2019-11-05 08:08:14.462265'),(9,'auth','0005_alter_user_last_login_null','2019-11-05 08:08:15.298705'),(10,'auth','0006_require_contenttypes_0002','2019-11-05 08:08:15.355563'),(11,'auth','0007_alter_validators_add_error_messages','2019-11-05 08:08:15.430498'),(12,'auth','0008_alter_user_username_max_length','2019-11-05 08:08:17.721814'),(13,'sessions','0001_initial','2019-11-05 08:08:18.700653'),(14,'user','0001_initial','2019-11-05 08:14:17.800962'),(15,'user','0002_auto_20191105_1621','2019-11-05 08:21:18.097605'),(16,'user','0003_user_login_time','2019-11-06 03:29:27.926429'),(17,'albums','0001_initial','2019-11-07 20:38:07.389804'),(18,'albums','0002_auto_20191107_2037','2019-11-07 20:38:07.476335'),(19,'albums','0003_auto_20191108_1245','2019-11-08 12:45:29.616145'),(20,'albums','0004_auto_20191108_1321','2019-11-08 13:21:21.483352'),(21,'user','0004_relation','2019-11-12 19:45:31.579114'),(22,'albums','0005_collections','2019-11-12 19:45:33.805423'),(23,'user','0005_weibouser','2019-11-20 19:35:09.086653');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7xbk3qrt6h0ly8w179vjqu49heas3hjs','ZGVkMjI0Mzc1NTM1YmQ3NTI2NjQwZjM5NmIwNWE3YTRhMDZkMGE3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyY2E3NDMwNjYzZWU4Y2NhYjg4YzA0N2I4MWEzMjc3YTc5OWI4NjhmIn0=','2019-12-06 12:17:44.229630'),('8xbpoo6ujo6pdbi2rn6rq1c056g94hab','ZGVkMjI0Mzc1NTM1YmQ3NTI2NjQwZjM5NmIwNWE3YTRhMDZkMGE3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyY2E3NDMwNjYzZWU4Y2NhYjg4YzA0N2I4MWEzMjc3YTc5OWI4NjhmIn0=','2019-12-03 16:27:49.445414'),('loi5j9tsboy1nw9bf4iabiusz7zc0zqp','ZGVkMjI0Mzc1NTM1YmQ3NTI2NjQwZjM5NmIwNWE3YTRhMDZkMGE3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyY2E3NDMwNjYzZWU4Y2NhYjg4YzA0N2I4MWEzMjc3YTc5OWI4NjhmIn0=','2019-11-19 08:16:28.415573');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `cover` tinyint(1) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pictures_album_id_ef9fa4f3_fk_albums_id` (`album_id`),
  CONSTRAINT `pictures_album_id_ef9fa4f3_fk_albums_id` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (11,'pictures/fj2.jpg',1,21),(12,'pictures/fj4.jpg',0,21),(13,'pictures/fj6.jpg',0,21),(14,'pictures/fj8.jpg',0,21),(15,'pictures/fj12.jpg',0,21),(16,'pictures/fll488.jpg',1,22),(17,'pictures/fll488-2.jpg',0,22),(18,'pictures/lbjn1.jpg',0,22),(19,'pictures/lbjn2.jpg',0,22),(20,'pictures/fll1.jpg',1,29),(21,'pictures/fll2.jpg',0,29),(22,'pictures/fll3.jpg',0,29),(23,'pictures/fll4.jpg',0,29),(24,'pictures/mn4.jpg',1,30),(25,'pictures/mn5.jpg',0,30),(26,'pictures/mn6.jpg',0,30),(27,'pictures/mn7.jpg',0,30),(28,'pictures/fj15.jpg',1,31),(29,'pictures/fj16.jpg',0,31),(30,'pictures/fj17.jpg',0,31),(31,'pictures/fj18.jpg',0,31),(32,'pictures/fj19.jpg',0,31),(33,'pictures/fj20.jpg',0,31),(34,'pictures/tqzz1.jpg',1,32),(35,'pictures/tqzz2.jpg',0,32),(36,'pictures/tqzz3.jpg',0,32),(37,'pictures/tqzz4.jpg',0,32),(38,'pictures/wjk1.jpg',1,33),(39,'pictures/wjk2.jpg',0,33),(40,'pictures/wjk3.jpg',0,33),(41,'pictures/wjk4.jpg',0,33),(42,'pictures/wjk5.jpg',0,33),(43,'pictures/wjk6.jpg',0,33),(44,'pictures/ms1.jpg',1,34),(45,'pictures/ms2.jpg',0,34),(46,'pictures/ms5.jpg',0,34),(47,'pictures/ms6.jpg',0,34),(48,'pictures/ms9.jpg',0,34),(49,'pictures/jj1.jpg',1,35),(50,'pictures/jj5.jpg',0,35),(51,'pictures/jj6.jpg',0,35),(52,'pictures/jj7.jpg',0,35),(53,'pictures/mn10.jpg',1,36),(54,'pictures/mn11.jpg',0,36),(55,'pictures/mn12.jpg',0,36),(56,'pictures/mn13.jpg',0,36),(57,'pictures/mn14.jpg',0,36),(58,'pictures/mn15.jpg',0,36),(59,'pictures/mn16.jpg',1,37),(60,'pictures/mn17.jpg',0,37),(61,'pictures/mn18.jpg',0,37),(62,'pictures/mn19.jpg',0,37),(63,'pictures/mn20.jpg',0,37),(64,'pictures/mn7_oabDhyp.jpg',1,38),(65,'pictures/mn7_2XCLwIc.jpg',1,39),(66,'pictures/mn8.jpg',0,39),(67,'pictures/mn9.jpg',0,39),(68,'pictures/ms7.jpg',1,40),(69,'pictures/ms8.jpg',0,40),(70,'pictures/ms9_NdLQvs6.jpg',0,40),(71,'pictures/ms10.jpg',0,40),(72,'pictures/ms11.jpg',0,40),(73,'pictures/fj17_2BEa9g4.jpg',1,41),(74,'pictures/fj18_JV3u6oH.jpg',0,41),(75,'pictures/fj19_RhYT8UB.jpg',0,41),(76,'pictures/fj20_RLPimxx.jpg',0,41),(77,'pictures/yyqx1.jpg',1,42),(78,'pictures/yyqx2.jpg',0,42),(79,'pictures/zly1.jpeg',1,43),(80,'pictures/zly3.jpeg',0,43),(81,'pictures/zly4.jpeg',0,43),(82,'pictures/ms2_VbH0G4X.jpg',1,44),(83,'pictures/ms3.jpg',0,44),(84,'pictures/ms4.jpg',0,44),(85,'pictures/153511-1489044911de46.jpg',1,45),(86,'pictures/jj2.jpg',1,46),(87,'pictures/jj3.jpg',0,46),(88,'pictures/hz1.jpg',1,47),(89,'pictures/hz2.jpg',0,47),(90,'pictures/hz3.jpg',0,47);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a` varchar(11) NOT NULL,
  `b` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES (1,'wangyan','czc'),(2,'wangyan','xufan'),(14,'czc','xufan'),(15,'czc','wangyan'),(16,'czc','yonghu1'),(17,'czc','zhujialei'),(18,'xufan','czc');
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(11) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sign` varchar(50) NOT NULL,
  `info` varchar(150) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `login_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('czc','蔡智成','caizhicheng@qq.com','01db58e95361ecf5d50a41cd9fbf47f9','我最有钱','在座的各位都是乐色','2019-11-09 16:32:13.691652','2019-11-25 16:40:21.640687','avatar/1565419861_735564.jpg',1,'2019-11-25 16:40:21.640413'),('huang','','','b1185aa67df7ced5bf6ceb0ba800841a','','','2019-11-20 20:08:25.618086','2019-11-20 20:08:25.618104','',1,NULL),('hxp','','','b1185aa67df7ced5bf6ceb0ba800841a','','','2019-11-20 20:03:43.485286','2019-11-20 20:04:05.736698','',1,'2019-11-20 20:04:05.736394'),('wangyan','','','043aa421bce9ea657ad8a97f12c086c6','','','2019-11-09 17:41:40.415759','2019-11-25 16:41:43.317204','',1,'2019-11-25 16:41:43.316534'),('wy123','','','e9a124024a11398ba9129e5c20e2f886','','','2019-11-05 10:20:33.309470','2019-11-07 20:40:45.017247','',1,'2019-11-07 20:40:45.017048'),('xufan','徐繁','xufanzuishuai@qq.com','ee5a316194791d799d6fe9a480218cbd','老子最帅','帅到被人砍','2019-11-07 20:40:04.474754','2019-11-25 17:19:41.999436','avatar/img1-8.jpg',1,'2019-11-25 17:19:41.999214'),('yonghu1','','','e2fc30484e5204b6970487a2f1b2c632','','','2019-11-19 16:19:09.493866','2019-11-19 16:19:19.849816','',1,'2019-11-19 16:19:19.849658'),('yonghu2','','','475076a10bd815b8fa0a95876ac02be8','','','2019-11-19 16:24:30.498680','2019-11-19 16:24:42.741993','',1,'2019-11-19 16:24:42.741176'),('zhujialei','','','baa55381d215013371419edee3750d88','','','2019-11-20 20:17:13.848929','2019-11-25 11:33:01.000942','',1,'2019-11-25 11:33:01.000348');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weibo_user`
--

DROP TABLE IF EXISTS `weibo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weibo_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wuid` varchar(50) NOT NULL,
  `access_token` varchar(200) NOT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `weibo_user_wuid_e8cb2a9e` (`wuid`),
  KEY `weibo_user_access_token_b4663584` (`access_token`),
  CONSTRAINT `weibo_user_user_id_36f50543_fk_user_username` FOREIGN KEY (`user_id`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weibo_user`
--

LOCK TABLES `weibo_user` WRITE;
/*!40000 ALTER TABLE `weibo_user` DISABLE KEYS */;
INSERT INTO `weibo_user` VALUES (1,'6989886765','2.00HrqCdHmYs8DC5c063bc561ifoI9E','huang'),(2,'5092436882','2.00k92dYFmYs8DC35de78ef29UbfXuC','zhujialei');
/*!40000 ALTER TABLE `weibo_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-27 13:49:46
