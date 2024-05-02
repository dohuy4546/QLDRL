-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: trainingpointdb
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'congtac'),(3,'sinhvien'),(1,'troli');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (6,1,49),(7,1,50),(8,1,51),(9,1,52),(10,1,61),(11,1,62),(12,1,63),(1,1,64),(2,1,69),(3,1,70),(4,1,71),(5,1,72),(13,3,41),(14,3,42),(15,3,44),(16,3,45),(17,3,46),(18,3,47),(19,3,48),(20,3,49),(21,3,50),(22,3,51),(23,3,52),(24,3,61),(25,3,62),(26,3,64),(27,3,65),(28,3,66),(29,3,67),(30,3,68),(31,3,69),(32,3,70),(33,3,71),(34,3,72),(35,3,73),(36,3,74),(37,3,75),(38,3,76);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add dieu',6,'add_dieu'),(22,'Can change dieu',6,'change_dieu'),(23,'Can delete dieu',6,'delete_dieu'),(24,'Can view dieu',6,'view_dieu'),(25,'Can add hoc ky_ nam hoc',7,'add_hocky_namhoc'),(26,'Can change hoc ky_ nam hoc',7,'change_hocky_namhoc'),(27,'Can delete hoc ky_ nam hoc',7,'delete_hocky_namhoc'),(28,'Can view hoc ky_ nam hoc',7,'view_hocky_namhoc'),(29,'Can add khoa',8,'add_khoa'),(30,'Can change khoa',8,'change_khoa'),(31,'Can delete khoa',8,'delete_khoa'),(32,'Can view khoa',8,'view_khoa'),(33,'Can add tag',9,'add_tag'),(34,'Can change tag',9,'change_tag'),(35,'Can delete tag',9,'delete_tag'),(36,'Can view tag',9,'view_tag'),(37,'Can add user',10,'add_taikhoan'),(38,'Can change user',10,'change_taikhoan'),(39,'Can delete user',10,'delete_taikhoan'),(40,'Can view user',10,'view_taikhoan'),(41,'Can add bai viet',11,'add_baiviet'),(42,'Can change bai viet',11,'change_baiviet'),(43,'Can delete bai viet',11,'delete_baiviet'),(44,'Can view bai viet',11,'view_baiviet'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment'),(49,'Can add hoat dong ngoai khoa',13,'add_hoatdongngoaikhoa'),(50,'Can change hoat dong ngoai khoa',13,'change_hoatdongngoaikhoa'),(51,'Can delete hoat dong ngoai khoa',13,'delete_hoatdongngoaikhoa'),(52,'Can view hoat dong ngoai khoa',13,'view_hoatdongngoaikhoa'),(53,'Can add lop',14,'add_lop'),(54,'Can change lop',14,'change_lop'),(55,'Can delete lop',14,'delete_lop'),(56,'Can view lop',14,'view_lop'),(57,'Can add sinh vien',15,'add_sinhvien'),(58,'Can change sinh vien',15,'change_sinhvien'),(59,'Can delete sinh vien',15,'delete_sinhvien'),(60,'Can view sinh vien',15,'view_sinhvien'),(61,'Can add diem ren luyen',16,'add_diemrenluyen'),(62,'Can change diem ren luyen',16,'change_diemrenluyen'),(63,'Can delete diem ren luyen',16,'delete_diemrenluyen'),(64,'Can view diem ren luyen',16,'view_diemrenluyen'),(65,'Can add tham gia',17,'add_thamgia'),(66,'Can change tham gia',17,'change_thamgia'),(67,'Can delete tham gia',17,'delete_thamgia'),(68,'Can view tham gia',17,'view_thamgia'),(69,'Can add minh chung',18,'add_minhchung'),(70,'Can change minh chung',18,'change_minhchung'),(71,'Can delete minh chung',18,'delete_minhchung'),(72,'Can view minh chung',18,'view_minhchung'),(73,'Can add like',19,'add_like'),(74,'Can change like',19,'change_like'),(75,'Can delete like',19,'delete_like'),(76,'Can view like',19,'view_like'),(77,'Can add application',20,'add_application'),(78,'Can change application',20,'change_application'),(79,'Can delete application',20,'delete_application'),(80,'Can view application',20,'view_application'),(81,'Can add access token',21,'add_accesstoken'),(82,'Can change access token',21,'change_accesstoken'),(83,'Can delete access token',21,'delete_accesstoken'),(84,'Can view access token',21,'view_accesstoken'),(85,'Can add grant',22,'add_grant'),(86,'Can change grant',22,'change_grant'),(87,'Can delete grant',22,'delete_grant'),(88,'Can view grant',22,'view_grant'),(89,'Can add refresh token',23,'add_refreshtoken'),(90,'Can change refresh token',23,'change_refreshtoken'),(91,'Can delete refresh token',23,'delete_refreshtoken'),(92,'Can view refresh token',23,'view_refreshtoken'),(93,'Can add id token',24,'add_idtoken'),(94,'Can change id token',24,'change_idtoken'),(95,'Can delete id token',24,'delete_idtoken'),(96,'Can view id token',24,'view_idtoken'),(97,'Can add tro ly sinh vien_ khoa',25,'add_trolysinhvien_khoa'),(98,'Can change tro ly sinh vien_ khoa',25,'change_trolysinhvien_khoa'),(99,'Can delete tro ly sinh vien_ khoa',25,'delete_trolysinhvien_khoa'),(100,'Can view tro ly sinh vien_ khoa',25,'view_trolysinhvien_khoa');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb3_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_trainingpoint_taikhoan_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_trainingpoint_taikhoan_id` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-23 08:06:39.415660','1','troli',1,'[{\"added\": {}}]',3,1),(2,'2024-04-23 08:10:17.465514','2','troli1',1,'[{\"added\": {}}]',10,1),(3,'2024-04-23 08:11:01.341957','2','troli1',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',10,1),(4,'2024-04-23 08:11:34.688691','2','troli1',2,'[]',10,1),(5,'2024-04-23 08:12:59.047435','2','congtac',1,'[{\"added\": {}}]',3,1),(6,'2024-04-23 08:13:19.427423','3','congtac1',1,'[{\"added\": {}}]',10,1),(7,'2024-04-23 08:15:49.947362','3','sinhvien',1,'[{\"added\": {}}]',3,1),(8,'2024-04-23 08:16:06.895093','4','sinhvien1',1,'[{\"added\": {}}]',10,1),(9,'2024-04-23 08:17:18.807945','1','Dieu object (1)',1,'[{\"added\": {}}]',6,1),(10,'2024-04-23 08:17:26.504957','2','Dieu object (2)',1,'[{\"added\": {}}]',6,1),(11,'2024-04-23 08:17:32.371576','3','Dieu object (3)',1,'[{\"added\": {}}]',6,1),(12,'2024-04-23 08:17:37.737296','4','Dieu object (4)',1,'[{\"added\": {}}]',6,1),(13,'2024-04-23 08:17:48.298923','1','HocKy_NamHoc object (1)',1,'[{\"added\": {}}]',7,1),(14,'2024-04-23 08:21:26.603440','1','HoatDongNgoaiKhoa object (1)',1,'[{\"added\": {}}]',13,1),(15,'2024-04-23 08:21:37.080678','1','Tag1',1,'[{\"added\": {}}]',9,1),(16,'2024-04-23 08:21:41.059190','2','Tag2',1,'[{\"added\": {}}]',9,1),(17,'2024-04-23 08:22:36.325651','1','Bai viet 1',1,'[{\"added\": {}}]',11,1),(18,'2024-04-23 08:25:34.163526','2','HocKy_NamHoc object (2)',1,'[{\"added\": {}}]',7,1),(19,'2024-04-23 08:25:40.285176','3','HocKy_NamHoc object (3)',1,'[{\"added\": {}}]',7,1),(20,'2024-04-23 08:25:47.852164','4','HocKy_NamHoc object (4)',1,'[{\"added\": {}}]',7,1),(21,'2024-04-23 08:25:50.001608','2','HoatDongNgoaiKhoa object (2)',1,'[{\"added\": {}}]',13,1),(22,'2024-04-23 08:25:58.193766','2','Bai viet 2',1,'[{\"added\": {}}]',11,1),(23,'2024-04-27 03:22:38.122462','1','Comment object (1)',1,'[{\"added\": {}}]',12,1),(24,'2024-04-27 03:22:46.082943','2','Comment object (2)',1,'[{\"added\": {}}]',12,1),(25,'2024-04-27 03:22:52.767073','3','Comment object (3)',1,'[{\"added\": {}}]',12,1),(26,'2024-04-27 03:22:59.148960','4','Comment object (4)',1,'[{\"added\": {}}]',12,1),(27,'2024-04-29 02:12:19.474766','1','Like object (1)',3,'',19,1),(28,'2024-04-30 03:16:14.112945','1','cntt21',1,'[{\"added\": {}}]',8,1),(29,'2024-04-30 03:16:26.480071','2','cs21',1,'[{\"added\": {}}]',8,1),(30,'2024-04-30 03:16:32.493752','1','it2102',1,'[{\"added\": {}}]',14,1),(31,'2024-04-30 03:16:34.881400','1','sv1',1,'[{\"added\": {}}]',15,1),(32,'2024-04-30 03:17:24.748468','2','cs200',1,'[{\"added\": {}}]',14,1),(33,'2024-04-30 03:17:27.849942','2','sv2',1,'[{\"added\": {}}]',15,1),(34,'2024-04-30 03:17:38.370246','1','DiemRenLuyen object (1)',1,'[{\"added\": {}}]',16,1),(35,'2024-04-30 03:17:47.209708','2','DiemRenLuyen object (2)',1,'[{\"added\": {}}]',16,1),(36,'2024-04-30 03:17:52.934041','3','DiemRenLuyen object (3)',1,'[{\"added\": {}}]',16,1),(37,'2024-04-30 03:18:05.438007','4','DiemRenLuyen object (4)',1,'[{\"added\": {}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(21,'oauth2_provider','accesstoken'),(20,'oauth2_provider','application'),(22,'oauth2_provider','grant'),(24,'oauth2_provider','idtoken'),(23,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(11,'trainingpoint','baiviet'),(12,'trainingpoint','comment'),(16,'trainingpoint','diemrenluyen'),(6,'trainingpoint','dieu'),(13,'trainingpoint','hoatdongngoaikhoa'),(7,'trainingpoint','hocky_namhoc'),(8,'trainingpoint','khoa'),(19,'trainingpoint','like'),(14,'trainingpoint','lop'),(18,'trainingpoint','minhchung'),(15,'trainingpoint','sinhvien'),(9,'trainingpoint','tag'),(10,'trainingpoint','taikhoan'),(17,'trainingpoint','thamgia'),(25,'trainingpoint','trolysinhvien_khoa');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-23 07:51:44.010433'),(2,'contenttypes','0002_remove_content_type_name','2024-04-23 07:51:46.714640'),(3,'auth','0001_initial','2024-04-23 07:51:49.312352'),(4,'auth','0002_alter_permission_name_max_length','2024-04-23 07:51:49.578674'),(5,'auth','0003_alter_user_email_max_length','2024-04-23 07:51:49.609840'),(6,'auth','0004_alter_user_username_opts','2024-04-23 07:51:49.641092'),(7,'auth','0005_alter_user_last_login_null','2024-04-23 07:51:49.703603'),(8,'auth','0006_require_contenttypes_0002','2024-04-23 07:51:49.719320'),(9,'auth','0007_alter_validators_add_error_messages','2024-04-23 07:51:49.750492'),(10,'auth','0008_alter_user_username_max_length','2024-04-23 07:51:49.781820'),(11,'auth','0009_alter_user_last_name_max_length','2024-04-23 07:51:49.813070'),(12,'auth','0010_alter_group_name_max_length','2024-04-23 07:51:50.031723'),(13,'auth','0011_update_proxy_permissions','2024-04-23 07:51:50.047424'),(14,'auth','0012_alter_user_first_name_max_length','2024-04-23 07:51:50.094213'),(15,'trainingpoint','0001_initial','2024-04-23 07:52:05.078978'),(16,'admin','0001_initial','2024-04-23 07:52:10.047627'),(17,'admin','0002_logentry_remove_auto_add','2024-04-23 07:52:10.203877'),(18,'admin','0003_logentry_add_action_flag_choices','2024-04-23 07:52:11.250745'),(19,'oauth2_provider','0001_initial','2024-04-23 07:52:19.406986'),(20,'oauth2_provider','0002_auto_20190406_1805','2024-04-23 07:52:20.063357'),(21,'oauth2_provider','0003_auto_20201211_1314','2024-04-23 07:52:21.047703'),(22,'oauth2_provider','0004_auto_20200902_2022','2024-04-23 07:52:24.313304'),(23,'oauth2_provider','0005_auto_20211222_2352','2024-04-23 07:52:24.750744'),(24,'oauth2_provider','0006_alter_application_client_secret','2024-04-23 07:52:24.907000'),(25,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-04-23 07:52:25.610133'),(26,'sessions','0001_initial','2024-04-23 07:52:26.110232'),(27,'trainingpoint','0002_alter_dieu_ma_dieu_alter_khoa_ma_khoa_and_more','2024-04-23 07:52:27.909935'),(28,'trainingpoint','0003_like','2024-04-23 07:52:29.722513'),(29,'trainingpoint','0004_alter_sinhvien_gioi_tinh','2024-04-23 07:52:30.285004'),(30,'trainingpoint','0005_alter_hoatdongngoaikhoa_diem_ren_luyen','2024-04-23 07:52:30.472451'),(31,'trainingpoint','0006_alter_hocky_namhoc_nam_hoc','2024-04-23 08:23:49.997692'),(32,'trainingpoint','0006_alter_hocky_namhoc_nam_hoc_and_more','2024-04-29 02:24:35.708395'),(33,'trainingpoint','0007_alter_thamgia_state','2024-04-29 02:24:35.786469'),(34,'trainingpoint','0008_alter_thamgia_state','2024-04-29 02:24:35.895870'),(35,'trainingpoint','0009_merge_20240429_0924','2024-04-29 02:24:35.927149'),(36,'trainingpoint','0009_trolysinhvien_khoa','2024-04-29 04:48:28.174115'),(37,'trainingpoint','0010_alter_taikhoan_role','2024-04-29 04:48:28.252190'),(38,'trainingpoint','0011_merge_20240429_1148','2024-04-29 04:48:28.283473');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb3_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5qpqxoy3o94yiy16man0uwy6po8bmz1u','.eJxVjDsOwyAQRO9CHSHAGHZTpvcZ0PILTiKQjF1FuXtsyUVSjTTvzbyZo20tbutpcXNkVybZ5bfzFJ6pHiA-qN4bD62uy-z5ofCTdj61mF630_07KNTLvvY62aAHSXlUEUVGkMJCNKgIJQ4arRZWZm0k5jSC8iYR-D0BsgIS7PMFxBw3AQ:1rzB3t:f4xzVsCFzLvln37nx9pNSLIQQDfOTVe6RZEkmiPSKUg','2024-05-07 07:59:33.978488');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_acce_user_id_6e4c9a65_fk_trainingp` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_user_id_6e4c9a65_fk_trainingp` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'Xd51dXdVUvqmmSu8ybLvO0fw8oxFZv','2024-04-28 14:12:14.259195','read write',1,1,'2024-04-28 04:12:14.261738','2024-04-28 04:12:14.261738',NULL,NULL),(2,'RsvjwDDi70TbWgx3YZTDUYMG5gBuhc','2024-04-29 12:06:41.952175','read write',1,1,'2024-04-29 02:06:41.953184','2024-04-29 02:06:41.953184',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb3_unicode_ci NOT NULL,
  `post_logout_redirect_uris` longtext COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_trainingp` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_trainingp` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'4eba8S2TpUPaiIhyFmeNtcLzvQfv9pbaorXZUVd1','','confidential','password','pbkdf2_sha256$720000$ePOD2Xd7fbYni1pusFQH3q$HwGUThIL+XJ230hDGwjcm/Qjw9I5ROSBsgSXcNNhvns=','MyApp',1,0,'2024-04-28 04:08:00.142843','2024-04-28 04:08:00.143849','','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_gran_user_id_e8f62af8_fk_trainingp` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_gran_user_id_e8f62af8_fk_trainingp` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idto_user_id_dd512b59_fk_trainingp` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idto_user_id_dd512b59_fk_trainingp` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_trainingp` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_trainingp` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'LAbtWtX90rnuVcspmukHFJYO5Ba2fm',1,1,1,'2024-04-28 04:12:14.379129','2024-04-28 04:12:14.379129',NULL),(2,'AuXnXhBH8J3BeOEg2hyZLrFMVrHnd1',2,1,1,'2024-04-29 02:06:42.045070','2024-04-29 02:06:42.045070',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_baiviet`
--

DROP TABLE IF EXISTS `trainingpoint_baiviet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_baiviet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb3_unicode_ci,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tro_ly_id` bigint NOT NULL,
  `hoat_dong_ngoai_khoa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_baivie_hoat_dong_ngoai_khoa_d2e2c787_fk_trainingp` (`hoat_dong_ngoai_khoa_id`),
  KEY `trainingpoint_baivie_tro_ly_id_d68632a4_fk_trainingp` (`tro_ly_id`),
  CONSTRAINT `trainingpoint_baivie_hoat_dong_ngoai_khoa_d2e2c787_fk_trainingp` FOREIGN KEY (`hoat_dong_ngoai_khoa_id`) REFERENCES `trainingpoint_hoatdongngoaikhoa` (`id`),
  CONSTRAINT `trainingpoint_baivie_tro_ly_id_d68632a4_fk_trainingp` FOREIGN KEY (`tro_ly_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_baiviet`
--

LOCK TABLES `trainingpoint_baiviet` WRITE;
/*!40000 ALTER TABLE `trainingpoint_baiviet` DISABLE KEYS */;
INSERT INTO `trainingpoint_baiviet` VALUES (1,'2024-04-23 08:22:31.639307','2024-04-23 08:22:31.639307',1,'Bai viet 1','<p>Bai viet 1&nbsp;Bai viet 1&nbsp;Bai viet 1&nbsp;Bai viet 1&nbsp;Bai viet 1&nbsp;Bai viet 1</p>','image/upload/v1713860558/vj3iuxyhc4o42b4yrwgo.jpg',2,1),(2,'2024-04-23 08:25:53.836249','2024-04-23 08:25:53.836249',1,'Bai viet 2','<p>Bai viet 2&nbsp;Bai viet 2&nbsp;Bai viet 2&nbsp;Bai viet 2&nbsp;Bai viet 2&nbsp;Bai viet 2&nbsp;</p>','image/upload/v1713860760/bhu93stnax9ntypdcyhi.jpg',2,2);
/*!40000 ALTER TABLE `trainingpoint_baiviet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_baiviet_tags`
--

DROP TABLE IF EXISTS `trainingpoint_baiviet_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_baiviet_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `baiviet_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_baiviet_tags_baiviet_id_tag_id_2b40e7fd_uniq` (`baiviet_id`,`tag_id`),
  KEY `trainingpoint_baivie_tag_id_96498648_fk_trainingp` (`tag_id`),
  CONSTRAINT `trainingpoint_baivie_baiviet_id_3098828d_fk_trainingp` FOREIGN KEY (`baiviet_id`) REFERENCES `trainingpoint_baiviet` (`id`),
  CONSTRAINT `trainingpoint_baivie_tag_id_96498648_fk_trainingp` FOREIGN KEY (`tag_id`) REFERENCES `trainingpoint_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_baiviet_tags`
--

LOCK TABLES `trainingpoint_baiviet_tags` WRITE;
/*!40000 ALTER TABLE `trainingpoint_baiviet_tags` DISABLE KEYS */;
INSERT INTO `trainingpoint_baiviet_tags` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `trainingpoint_baiviet_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_comment`
--

DROP TABLE IF EXISTS `trainingpoint_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `content` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `bai_viet_id` bigint NOT NULL,
  `tai_khoan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_commen_bai_viet_id_a2c3e1eb_fk_trainingp` (`bai_viet_id`),
  KEY `trainingpoint_commen_tai_khoan_id_e072273e_fk_trainingp` (`tai_khoan_id`),
  CONSTRAINT `trainingpoint_commen_bai_viet_id_a2c3e1eb_fk_trainingp` FOREIGN KEY (`bai_viet_id`) REFERENCES `trainingpoint_baiviet` (`id`),
  CONSTRAINT `trainingpoint_commen_tai_khoan_id_e072273e_fk_trainingp` FOREIGN KEY (`tai_khoan_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_comment`
--

LOCK TABLES `trainingpoint_comment` WRITE;
/*!40000 ALTER TABLE `trainingpoint_comment` DISABLE KEYS */;
INSERT INTO `trainingpoint_comment` VALUES (1,'2024-04-27 03:22:37.999316','2024-04-27 03:22:37.999316',1,'comment1',1,2),(2,'2024-04-27 03:22:46.081943','2024-04-27 03:22:46.081943',1,'comment2',2,3),(3,'2024-04-27 03:22:52.765072','2024-04-27 03:22:52.766077',1,'comment3',1,2),(4,'2024-04-27 03:22:59.147971','2024-04-27 03:22:59.147971',1,'comment4',2,4),(5,'2024-04-28 04:17:21.531738','2024-04-28 04:17:21.531738',1,'test',1,1);
/*!40000 ALTER TABLE `trainingpoint_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_diemrenluyen`
--

DROP TABLE IF EXISTS `trainingpoint_diemrenluyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_diemrenluyen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `diem_tong` int NOT NULL,
  `hk_nh_id` bigint NOT NULL,
  `sinh_vien_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_diemre_hk_nh_id_623de615_fk_trainingp` (`hk_nh_id`),
  KEY `trainingpoint_diemre_sinh_vien_id_80a60410_fk_trainingp` (`sinh_vien_id`),
  CONSTRAINT `trainingpoint_diemre_hk_nh_id_623de615_fk_trainingp` FOREIGN KEY (`hk_nh_id`) REFERENCES `trainingpoint_hocky_namhoc` (`id`),
  CONSTRAINT `trainingpoint_diemre_sinh_vien_id_80a60410_fk_trainingp` FOREIGN KEY (`sinh_vien_id`) REFERENCES `trainingpoint_sinhvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_diemrenluyen`
--

LOCK TABLES `trainingpoint_diemrenluyen` WRITE;
/*!40000 ALTER TABLE `trainingpoint_diemrenluyen` DISABLE KEYS */;
INSERT INTO `trainingpoint_diemrenluyen` VALUES (1,'2024-04-30 03:17:38.212499','2024-04-30 03:17:38.212499',1,50,1,1),(2,'2024-04-30 03:17:47.207551','2024-04-30 03:17:47.207551',1,26,1,2),(3,'2024-04-30 03:17:52.933046','2024-04-30 03:17:52.933046',1,100,4,1),(4,'2024-04-30 03:18:05.436008','2024-04-30 03:18:05.436008',1,70,4,2);
/*!40000 ALTER TABLE `trainingpoint_diemrenluyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_dieu`
--

DROP TABLE IF EXISTS `trainingpoint_dieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_dieu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `ma_dieu` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ten_dieu` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_dieu_ma_dieu_3a4ab3bb_uniq` (`ma_dieu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_dieu`
--

LOCK TABLES `trainingpoint_dieu` WRITE;
/*!40000 ALTER TABLE `trainingpoint_dieu` DISABLE KEYS */;
INSERT INTO `trainingpoint_dieu` VALUES (1,'2024-04-23 08:17:18.806947','2024-04-23 08:17:18.806947',1,'1','Dieu 1'),(2,'2024-04-23 08:17:26.503959','2024-04-23 08:17:26.503959',1,'2','Dieu 2'),(3,'2024-04-23 08:17:32.369578','2024-04-23 08:17:32.370579',1,'3','Dieu 3'),(4,'2024-04-23 08:17:37.735302','2024-04-23 08:17:37.735302',1,'4','Dieu 4');
/*!40000 ALTER TABLE `trainingpoint_dieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_hoatdongngoaikhoa`
--

DROP TABLE IF EXISTS `trainingpoint_hoatdongngoaikhoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_hoatdongngoaikhoa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `ma_hoat_dong` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ten_hoat_dong` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `ngay` datetime(6) NOT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci,
  `diem_ren_luyen` int NOT NULL,
  `dieu_id` bigint NOT NULL,
  `hk_nh_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_hoat_dong` (`ma_hoat_dong`),
  KEY `trainingpoint_hoatdo_dieu_id_29c4cf28_fk_trainingp` (`dieu_id`),
  KEY `trainingpoint_hoatdo_hk_nh_id_3c4aba73_fk_trainingp` (`hk_nh_id`),
  CONSTRAINT `trainingpoint_hoatdo_dieu_id_29c4cf28_fk_trainingp` FOREIGN KEY (`dieu_id`) REFERENCES `trainingpoint_dieu` (`id`),
  CONSTRAINT `trainingpoint_hoatdo_hk_nh_id_3c4aba73_fk_trainingp` FOREIGN KEY (`hk_nh_id`) REFERENCES `trainingpoint_hocky_namhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_hoatdongngoaikhoa`
--

LOCK TABLES `trainingpoint_hoatdongngoaikhoa` WRITE;
/*!40000 ALTER TABLE `trainingpoint_hoatdongngoaikhoa` DISABLE KEYS */;
INSERT INTO `trainingpoint_hoatdongngoaikhoa` VALUES (1,'2024-04-23 08:21:26.600431','2024-04-23 08:21:26.601456',1,'1','Hoat dong ngoai khoa1','2024-04-23 12:00:00.000000','<p>Hoat dong ngoai khoa1&nbsp;Hoat dong ngoai khoa1&nbsp;Hoat dong ngoai khoa1&nbsp;Hoat dong ngoai khoa1</p>',5,1,1),(2,'2024-04-23 08:25:49.999591','2024-04-23 08:25:50.000608',1,'2','Hoat dong 2','2024-04-23 00:00:00.000000','<p>Hoat dong 2Hoat dong 2Hoat dong 2Hoat dong 2</p>',5,3,2);
/*!40000 ALTER TABLE `trainingpoint_hoatdongngoaikhoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_hocky_namhoc`
--

DROP TABLE IF EXISTS `trainingpoint_hocky_namhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_hocky_namhoc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hoc_ky` int NOT NULL,
  `nam_hoc` varchar(9) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_hocky_namhoc_hoc_ky_nam_hoc_9672aae3_uniq` (`hoc_ky`,`nam_hoc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_hocky_namhoc`
--

LOCK TABLES `trainingpoint_hocky_namhoc` WRITE;
/*!40000 ALTER TABLE `trainingpoint_hocky_namhoc` DISABLE KEYS */;
INSERT INTO `trainingpoint_hocky_namhoc` VALUES (1,1,'2022-2023'),(4,1,'2023-2024'),(2,2,'2022-2023'),(3,3,'2022-2023');
/*!40000 ALTER TABLE `trainingpoint_hocky_namhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_khoa`
--

DROP TABLE IF EXISTS `trainingpoint_khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_khoa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `ma_khoa` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ten_khoa` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_khoa_ma_khoa_26d2be7b_uniq` (`ma_khoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_khoa`
--

LOCK TABLES `trainingpoint_khoa` WRITE;
/*!40000 ALTER TABLE `trainingpoint_khoa` DISABLE KEYS */;
INSERT INTO `trainingpoint_khoa` VALUES (1,'2024-04-30 03:16:14.014803','2024-04-30 03:16:14.014803',1,'it21','cntt21'),(2,'2024-04-30 03:16:26.479160','2024-04-30 03:16:26.479160',1,'21','cs21');
/*!40000 ALTER TABLE `trainingpoint_khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_like`
--

DROP TABLE IF EXISTS `trainingpoint_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `bai_viet_id` bigint NOT NULL,
  `tai_khoan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_like_tai_khoan_id_bai_viet_id_bfebd66b_uniq` (`tai_khoan_id`,`bai_viet_id`),
  KEY `trainingpoint_like_bai_viet_id_baef50a3_fk_trainingp` (`bai_viet_id`),
  CONSTRAINT `trainingpoint_like_bai_viet_id_baef50a3_fk_trainingp` FOREIGN KEY (`bai_viet_id`) REFERENCES `trainingpoint_baiviet` (`id`),
  CONSTRAINT `trainingpoint_like_tai_khoan_id_d2304d56_fk_trainingp` FOREIGN KEY (`tai_khoan_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_like`
--

LOCK TABLES `trainingpoint_like` WRITE;
/*!40000 ALTER TABLE `trainingpoint_like` DISABLE KEYS */;
INSERT INTO `trainingpoint_like` VALUES (2,'2024-04-29 02:17:23.173853','2024-04-29 02:36:05.296320',1,1,1);
/*!40000 ALTER TABLE `trainingpoint_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_lop`
--

DROP TABLE IF EXISTS `trainingpoint_lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_lop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `ma_lop` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ten_lop` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `khoa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_lop_ma_lop_00fe0d9e_uniq` (`ma_lop`),
  KEY `trainingpoint_lop_khoa_id_5ca17a50_fk_trainingpoint_khoa_id` (`khoa_id`),
  CONSTRAINT `trainingpoint_lop_khoa_id_5ca17a50_fk_trainingpoint_khoa_id` FOREIGN KEY (`khoa_id`) REFERENCES `trainingpoint_khoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_lop`
--

LOCK TABLES `trainingpoint_lop` WRITE;
/*!40000 ALTER TABLE `trainingpoint_lop` DISABLE KEYS */;
INSERT INTO `trainingpoint_lop` VALUES (1,'2024-04-30 03:16:32.482829','2024-04-30 03:16:32.482829',1,'it2102','it2102',1),(2,'2024-04-30 03:17:24.746476','2024-04-30 03:17:24.746476',1,'cs22','cs200',2);
/*!40000 ALTER TABLE `trainingpoint_lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_minhchung`
--

DROP TABLE IF EXISTS `trainingpoint_minhchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_minhchung` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `anh_minh_chung` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tham_gia_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_minhch_tham_gia_id_f447c1a5_fk_trainingp` (`tham_gia_id`),
  CONSTRAINT `trainingpoint_minhch_tham_gia_id_f447c1a5_fk_trainingp` FOREIGN KEY (`tham_gia_id`) REFERENCES `trainingpoint_thamgia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_minhchung`
--

LOCK TABLES `trainingpoint_minhchung` WRITE;
/*!40000 ALTER TABLE `trainingpoint_minhchung` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingpoint_minhchung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_sinhvien`
--

DROP TABLE IF EXISTS `trainingpoint_sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_sinhvien` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `mssv` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ho_ten` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ngay_sinh` date NOT NULL,
  `gioi_tinh` int NOT NULL,
  `dia_chi` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `lop_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_sinhvien_mssv_5ba0afec_uniq` (`mssv`),
  KEY `trainingpoint_sinhvien_lop_id_5ec37963_fk_trainingpoint_lop_id` (`lop_id`),
  CONSTRAINT `trainingpoint_sinhvien_lop_id_5ec37963_fk_trainingpoint_lop_id` FOREIGN KEY (`lop_id`) REFERENCES `trainingpoint_lop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_sinhvien`
--

LOCK TABLES `trainingpoint_sinhvien` WRITE;
/*!40000 ALTER TABLE `trainingpoint_sinhvien` DISABLE KEYS */;
INSERT INTO `trainingpoint_sinhvien` VALUES (1,'2024-04-30 03:16:34.879402','2024-04-30 03:16:34.879402',1,'2131231231','sv1','2023-01-04',1,'s',1),(2,'2024-04-30 03:17:27.847940','2024-04-30 03:17:27.847940',1,'21333','sv2','2022-03-01',2,'r',2);
/*!40000 ALTER TABLE `trainingpoint_sinhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_tag`
--

DROP TABLE IF EXISTS `trainingpoint_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_tag`
--

LOCK TABLES `trainingpoint_tag` WRITE;
/*!40000 ALTER TABLE `trainingpoint_tag` DISABLE KEYS */;
INSERT INTO `trainingpoint_tag` VALUES (1,'2024-04-23 08:21:37.079653','2024-04-23 08:21:37.079653',1,'Tag1'),(2,'2024-04-23 08:21:41.057164','2024-04-23 08:21:41.057164',1,'Tag2');
/*!40000 ALTER TABLE `trainingpoint_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_taikhoan`
--

DROP TABLE IF EXISTS `trainingpoint_taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_taikhoan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_taikhoan`
--

LOCK TABLES `trainingpoint_taikhoan` WRITE;
/*!40000 ALTER TABLE `trainingpoint_taikhoan` DISABLE KEYS */;
INSERT INTO `trainingpoint_taikhoan` VALUES (1,'pbkdf2_sha256$720000$pGza5KeXcumG7aWRf4c2AD$A6JLW9OKwAieE3aF7aH2DEnIYQYaXXYpS2ZHMmZ8N9g=','2024-04-23 07:59:33.921567',1,'admin','','','abc@gmail.com',1,1,'2024-04-23 07:59:17.856150',NULL,NULL),(2,'troli1',NULL,0,'troli1','troli1','','',0,1,'2024-04-23 08:00:25.000000','image/upload/v1713859863/t2bx7vv7kh7xshggtdzw.png',2),(3,'congtac1',NULL,0,'congtac1','congtac1','','',0,1,'2024-04-23 08:11:34.000000','image/upload/v1713860001/qmk1lfy4lcoyoc20q4ds.jpg',3),(4,'sinhvien1','2024-04-23 08:13:26.000000',0,'sinhvien1','sinhvien1','','',0,1,'2024-04-23 08:13:19.000000','image/upload/v1713860168/higjsqhnr8drwmgqlnop.png',1),(5,'pbkdf2_sha256$720000$rX6Ape6TQlXBj3MkRy5Aha$JOgC8PCgwn1bSq5R68CdDhmbhBMRpdRismAk0dg+tsg=',NULL,0,'test','abc','df','',0,1,'2024-04-27 08:33:03.032267',NULL,2),(6,'pbkdf2_sha256$720000$AWa3Ugk6aGzcyeImp7TEW2$ZEKKiJzH5nE0ltknIWPuHJ8QYlNHmkDRMwJ1vr2Mnpc=',NULL,0,'test1','abc','df','',0,1,'2024-04-27 08:33:32.136711',NULL,2),(7,'pbkdf2_sha256$720000$gsRlE9tTXSfnzU14CXu53F$wdC3FfTBABLWADD4LbsZHo/YvAtI8QkKmge3QhGDoWM=',NULL,0,'test123','abc','df','',0,1,'2024-04-27 08:41:12.750998',NULL,2),(8,'pbkdf2_sha256$720000$zgYUihr9HYxSmQIwpGtMjl$MgtTxsKV3wqENMop+ZSLVH0g2G7PMCpZ55LvF7xbo5o=',NULL,0,'test123s','abc','df','',0,1,'2024-04-27 08:42:05.945213',NULL,2);
/*!40000 ALTER TABLE `trainingpoint_taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_taikhoan_groups`
--

DROP TABLE IF EXISTS `trainingpoint_taikhoan_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_taikhoan_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `taikhoan_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_taikhoan_groups_taikhoan_id_group_id_37061ae1_uniq` (`taikhoan_id`,`group_id`),
  KEY `trainingpoint_taikhoan_groups_group_id_ce9e76a9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `trainingpoint_taikho_taikhoan_id_22d55c3d_fk_trainingp` FOREIGN KEY (`taikhoan_id`) REFERENCES `trainingpoint_taikhoan` (`id`),
  CONSTRAINT `trainingpoint_taikhoan_groups_group_id_ce9e76a9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_taikhoan_groups`
--

LOCK TABLES `trainingpoint_taikhoan_groups` WRITE;
/*!40000 ALTER TABLE `trainingpoint_taikhoan_groups` DISABLE KEYS */;
INSERT INTO `trainingpoint_taikhoan_groups` VALUES (1,2,1),(2,3,2),(3,4,3);
/*!40000 ALTER TABLE `trainingpoint_taikhoan_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_taikhoan_user_permissions`
--

DROP TABLE IF EXISTS `trainingpoint_taikhoan_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_taikhoan_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `taikhoan_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_taikhoan_u_taikhoan_id_permission_i_0755fbaf_uniq` (`taikhoan_id`,`permission_id`),
  KEY `trainingpoint_taikho_permission_id_6f169ded_fk_auth_perm` (`permission_id`),
  CONSTRAINT `trainingpoint_taikho_permission_id_6f169ded_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `trainingpoint_taikho_taikhoan_id_3ccbe85f_fk_trainingp` FOREIGN KEY (`taikhoan_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_taikhoan_user_permissions`
--

LOCK TABLES `trainingpoint_taikhoan_user_permissions` WRITE;
/*!40000 ALTER TABLE `trainingpoint_taikhoan_user_permissions` DISABLE KEYS */;
INSERT INTO `trainingpoint_taikhoan_user_permissions` VALUES (1,2,64);
/*!40000 ALTER TABLE `trainingpoint_taikhoan_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_thamgia`
--

DROP TABLE IF EXISTS `trainingpoint_thamgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_thamgia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `state` int DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `hoat_dong_ngoai_khoa_id` bigint NOT NULL,
  `sinh_vien_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_thamgi_hoat_dong_ngoai_khoa_07fbed16_fk_trainingp` (`hoat_dong_ngoai_khoa_id`),
  KEY `trainingpoint_thamgi_sinh_vien_id_2db71d83_fk_trainingp` (`sinh_vien_id`),
  CONSTRAINT `trainingpoint_thamgi_hoat_dong_ngoai_khoa_07fbed16_fk_trainingp` FOREIGN KEY (`hoat_dong_ngoai_khoa_id`) REFERENCES `trainingpoint_hoatdongngoaikhoa` (`id`),
  CONSTRAINT `trainingpoint_thamgi_sinh_vien_id_2db71d83_fk_trainingp` FOREIGN KEY (`sinh_vien_id`) REFERENCES `trainingpoint_sinhvien` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_thamgia`
--

LOCK TABLES `trainingpoint_thamgia` WRITE;
/*!40000 ALTER TABLE `trainingpoint_thamgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingpoint_thamgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingpoint_trolysinhvien_khoa`
--

DROP TABLE IF EXISTS `trainingpoint_trolysinhvien_khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingpoint_trolysinhvien_khoa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `khoa_id` bigint NOT NULL,
  `tro_ly_sinh_vien_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_trolys_khoa_id_6642e7cd_fk_trainingp` (`khoa_id`),
  KEY `trainingpoint_trolys_tro_ly_sinh_vien_id_40fe8a1c_fk_trainingp` (`tro_ly_sinh_vien_id`),
  CONSTRAINT `trainingpoint_trolys_khoa_id_6642e7cd_fk_trainingp` FOREIGN KEY (`khoa_id`) REFERENCES `trainingpoint_khoa` (`id`),
  CONSTRAINT `trainingpoint_trolys_tro_ly_sinh_vien_id_40fe8a1c_fk_trainingp` FOREIGN KEY (`tro_ly_sinh_vien_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_trolysinhvien_khoa`
--

LOCK TABLES `trainingpoint_trolysinhvien_khoa` WRITE;
/*!40000 ALTER TABLE `trainingpoint_trolysinhvien_khoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingpoint_trolysinhvien_khoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 14:50:33
