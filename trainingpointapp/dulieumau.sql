-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: trainingpointdb
-- ------------------------------------------------------
-- Server version	8.2.0

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_trainingpoint_taikhoan_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_trainingpoint_taikhoan_id` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-25 03:57:29.368757','1','Công nghệ thông tin',1,'[{\"added\": {}}]',8,1),(2,'2024-04-25 03:57:30.899221','1','Lớp IT03',1,'[{\"added\": {}}]',14,1),(3,'2024-04-25 03:57:34.448855','1','Đỗ Gia Huy',1,'[{\"added\": {}}]',15,1),(4,'2024-04-25 03:58:25.073093','1','Đỗ Gia Huy',2,'[]',15,1),(5,'2024-04-25 04:22:24.891092','2','Vũ Ngọc Đang',1,'[{\"added\": {}}]',15,1),(6,'2024-04-25 04:23:48.433915','2','Lớp IT02 Khóa 21',1,'[{\"added\": {}}]',14,1),(7,'2024-04-25 04:23:56.077109','1','Lớp IT03 khóa 21',2,'[{\"changed\": {\"fields\": [\"Ten lop\"]}}]',14,1),(8,'2024-04-25 04:24:00.729034','3','Lê Thanh Danh',1,'[{\"added\": {}}]',15,1),(9,'2024-04-25 04:25:19.901128','2','Kỹ thuật xây dựng',1,'[{\"added\": {}}]',8,1),(10,'2024-04-25 04:26:00.438086','3','Lớp XD 01 Khóa 22',1,'[{\"added\": {}}]',14,1),(11,'2024-04-25 04:26:02.517510','4','Ngô Huy Hoàng',1,'[{\"added\": {}}]',15,1),(12,'2024-04-25 06:35:39.149842','1','Dieu object (1)',1,'[{\"added\": {}}]',6,1),(13,'2024-04-25 06:35:55.515366','2','Dieu object (2)',1,'[{\"added\": {}}]',6,1),(14,'2024-04-25 06:38:44.532248','1','HocKy_NamHoc object (1)',1,'[{\"added\": {}}]',7,1),(15,'2024-04-25 06:38:47.816207','1','HoatDongNgoaiKhoa object (1)',1,'[{\"added\": {}}]',13,1),(16,'2024-04-25 06:39:44.546818','1','HoatDongNgoaiKhoa object (1)',2,'[]',13,1),(17,'2024-04-25 06:40:38.522974','2','HoatDongNgoaiKhoa object (2)',1,'[{\"added\": {}}]',13,1),(18,'2024-04-25 06:41:40.888635','3','HoatDongNgoaiKhoa object (3)',1,'[{\"added\": {}}]',13,1),(19,'2024-04-25 09:05:29.747075','1','ThamGia object (1)',1,'[{\"added\": {}}]',17,1),(20,'2024-04-25 09:05:36.777879','2','ThamGia object (2)',1,'[{\"added\": {}}]',17,1),(21,'2024-04-25 09:05:45.888290','3','ThamGia object (3)',1,'[{\"added\": {}}]',17,1),(22,'2024-04-25 09:05:51.560002','4','ThamGia object (4)',1,'[{\"added\": {}}]',17,1),(23,'2024-04-25 09:05:58.841066','5','ThamGia object (5)',1,'[{\"added\": {}}]',17,1),(24,'2024-04-26 07:08:18.374901','1','2151050153 - Tham gia trồng cây xanh',2,'[{\"changed\": {\"fields\": [\"State\"]}}]',17,1),(25,'2024-04-26 07:08:33.228175','1','MinhChung object (1)',1,'[{\"added\": {}}]',18,1),(26,'2024-04-26 07:08:58.232805','2','2151050152 - Hoạt động khuyến khích học tập 2024',2,'[{\"changed\": {\"fields\": [\"State\"]}}]',17,1),(27,'2024-04-26 07:09:09.967182','2','MinhChung object (2)',1,'[{\"added\": {}}]',18,1),(28,'2024-04-26 07:35:23.382576','1','MinhChung object (1)',3,'',18,1),(29,'2024-04-26 07:35:41.757772','3','MinhChung object (3)',1,'[{\"added\": {}}]',18,1),(30,'2024-04-26 07:50:08.814139','2','MinhChung object (2)',2,'[{\"changed\": {\"fields\": [\"Anh minh chung\"]}}]',18,1),(31,'2024-04-26 11:03:50.699183','4','abcsss',3,'',13,1),(32,'2024-04-28 06:42:33.288805','1','admin',2,'[{\"changed\": {\"fields\": [\"Avatar\", \"Role\"]}}]',10,1),(33,'2024-04-28 06:47:30.669313','2','tlsv1',1,'[{\"added\": {}}]',10,1),(34,'2024-04-28 06:47:36.910673','1','TroLySinhVien_Khoa object (1)',1,'[{\"added\": {}}]',25,1),(35,'2024-04-30 07:52:53.658227','1','Môi trường',1,'[{\"added\": {}}]',9,1),(36,'2024-04-30 07:52:57.826816','1','Bài viết 1',1,'[{\"added\": {}}]',11,1),(37,'2024-04-30 07:53:51.389646','3','sv1',1,'[{\"added\": {}}]',10,1),(38,'2024-04-30 07:54:41.629576','1','Comment object (1)',1,'[{\"added\": {}}]',12,1),(39,'2024-04-30 07:54:54.133985','2','Comment object (2)',1,'[{\"added\": {}}]',12,1),(40,'2024-04-30 07:55:06.604373','1','Like object (1)',1,'[{\"added\": {}}]',19,1),(41,'2024-05-02 06:57:31.611640','4','Ngô Huy Hoàng',2,'[{\"changed\": {\"fields\": [\"Cccd\", \"Email\"]}}]',15,1),(42,'2024-05-02 06:57:45.235329','3','Lê Thanh Danh',2,'[{\"changed\": {\"fields\": [\"Cccd\", \"Email\"]}}]',15,1),(43,'2024-05-02 06:58:01.210246','2','Vũ Ngọc Đang',2,'[{\"changed\": {\"fields\": [\"Cccd\", \"Email\"]}}]',15,1),(44,'2024-05-02 06:58:10.850671','1','Đỗ Gia Huy',2,'[{\"changed\": {\"fields\": [\"Cccd\", \"Email\"]}}]',15,1),(45,'2024-05-02 06:58:13.928925','4','Ngô Huy Hoàng',2,'[]',15,1),(46,'2024-05-02 07:09:03.556198','4','tlsv2',1,'[{\"added\": {}}]',10,1),(47,'2024-05-02 07:16:08.382784','5','tlsv3',3,'',10,1),(48,'2024-05-02 07:17:40.459483','6','tlsv3',3,'',10,1),(49,'2024-05-02 07:19:22.049239','7','tlsv3',3,'',10,1),(50,'2024-05-02 07:20:22.550060','8','tlsv3',3,'',10,1),(51,'2024-05-02 07:22:06.485623','9','tlsv3',3,'',10,1),(52,'2024-05-02 07:30:49.477696','3','sv1',2,'[]',10,1),(53,'2024-05-02 07:31:03.053501','3','sv1',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,1),(54,'2024-05-02 07:37:05.843257','4','tlsv2',2,'[]',10,1),(55,'2024-05-02 07:37:13.450338','3','sv1',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,1),(56,'2024-05-02 07:44:48.281111','2','tlsv1',2,'[]',10,1),(57,'2024-05-02 07:44:54.955635','3','sv1',2,'[]',10,1),(58,'2024-05-02 07:45:01.101658','4','tlsv2',2,'[]',10,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-13 05:42:29.345050'),(2,'contenttypes','0002_remove_content_type_name','2024-04-13 05:42:29.577624'),(3,'auth','0001_initial','2024-04-13 05:42:30.134741'),(4,'auth','0002_alter_permission_name_max_length','2024-04-13 05:42:30.263795'),(5,'auth','0003_alter_user_email_max_length','2024-04-13 05:42:30.275785'),(6,'auth','0004_alter_user_username_opts','2024-04-13 05:42:30.285789'),(7,'auth','0005_alter_user_last_login_null','2024-04-13 05:42:30.296790'),(8,'auth','0006_require_contenttypes_0002','2024-04-13 05:42:30.302791'),(9,'auth','0007_alter_validators_add_error_messages','2024-04-13 05:42:30.312793'),(10,'auth','0008_alter_user_username_max_length','2024-04-13 05:42:30.321795'),(11,'auth','0009_alter_user_last_name_max_length','2024-04-13 05:42:30.337814'),(12,'auth','0010_alter_group_name_max_length','2024-04-13 05:42:30.367807'),(13,'auth','0011_update_proxy_permissions','2024-04-13 05:42:30.378809'),(14,'auth','0012_alter_user_first_name_max_length','2024-04-13 05:42:30.390810'),(15,'trainingpoint','0001_initial','2024-04-13 05:42:35.004322'),(16,'admin','0001_initial','2024-04-13 05:42:35.392776'),(17,'admin','0002_logentry_remove_auto_add','2024-04-13 05:42:35.420786'),(18,'admin','0003_logentry_add_action_flag_choices','2024-04-13 05:42:35.438790'),(19,'sessions','0001_initial','2024-04-13 05:42:35.537811'),(20,'trainingpoint','0002_alter_dieu_ma_dieu_alter_khoa_ma_khoa_and_more','2024-04-18 06:53:01.245927'),(21,'trainingpoint','0003_like','2024-04-18 06:53:01.742199'),(22,'trainingpoint','0004_alter_sinhvien_gioi_tinh','2024-04-18 06:56:54.017703'),(23,'trainingpoint','0005_alter_hoatdongngoaikhoa_diem_ren_luyen','2024-04-18 06:58:34.770078'),(24,'oauth2_provider','0001_initial','2024-04-23 05:15:52.526475'),(25,'oauth2_provider','0002_auto_20190406_1805','2024-04-23 05:15:52.710234'),(26,'oauth2_provider','0003_auto_20201211_1314','2024-04-23 05:15:52.920041'),(27,'oauth2_provider','0004_auto_20200902_2022','2024-04-23 05:15:54.000869'),(28,'oauth2_provider','0005_auto_20211222_2352','2024-04-23 05:15:54.088828'),(29,'oauth2_provider','0006_alter_application_client_secret','2024-04-23 05:15:54.130865'),(30,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-04-23 05:15:54.322094'),(31,'trainingpoint','0006_alter_hocky_namhoc_nam_hoc_and_more','2024-04-23 10:21:04.622937'),(32,'trainingpoint','0007_alter_thamgia_state','2024-04-25 08:56:50.549590'),(33,'trainingpoint','0008_alter_thamgia_state','2024-04-25 08:59:57.257690'),(34,'trainingpoint','0009_trolysinhvien_khoa','2024-04-28 06:38:51.593711'),(35,'trainingpoint','0010_alter_taikhoan_role','2024-04-28 06:42:00.298428'),(36,'trainingpoint','0006_alter_hocky_namhoc_nam_hoc','2024-04-30 07:16:11.981031'),(37,'trainingpoint','0009_merge_20240429_0924','2024-04-30 07:16:11.995037'),(38,'trainingpoint','0011_merge_20240429_1148','2024-04-30 07:16:12.008040'),(39,'trainingpoint','0012_sinhvien_cccd_sinhvien_email','2024-05-02 06:56:28.379558'),(40,'trainingpoint','0013_alter_sinhvien_cccd_alter_sinhvien_email','2024-05-02 06:58:44.714053');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('p0ckljvnc15cnb446nv2xxd5frhg260g','.eJxVjEEOwiAQRe_C2hAgQMGle89AhplBqgaS0q6Md9cmXej2v_f-SyTY1pq2wUuaSZyFFqffLQM-uO2A7tBuXWJv6zJnuSvyoENeO_Hzcrh_BxVG_daWjEeDNqvikFl7HYPNPPlgHHEubiLSNmMszhUdVAwKokbPDIYDg3h_APUDOJ8:1rvWDs:EUx0DLWm1mIssiFdDGT9xXlC-mBH5YQW-Ai8aJvA-Vg','2024-04-27 05:46:44.227805'),('p7sjhijq9g5hy899cqc6kia3qo1pcdes','.eJxVjEEOwiAQRe_C2hAgQMGle89AhplBqgaS0q6Md9cmXej2v_f-SyTY1pq2wUuaSZyFFqffLQM-uO2A7tBuXWJv6zJnuSvyoENeO_Hzcrh_BxVG_daWjEeDNqvikFl7HYPNPPlgHHEubiLSNmMszhUdVAwKokbPDIYDg3h_APUDOJ8:1s0yCI:CVVwJQNFlG19XJ3mRhnAelkcwFAcXBAnoPPNFLt3irU','2024-05-12 06:39:38.368887');
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
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
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
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) NOT NULL,
  `post_logout_redirect_uris` longtext NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_trainingp` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_trainingp` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'OExYmZeWgGVkOh9VNlZ0EhJHH0xU4nvvPHnRQmuW','','confidential','password','pbkdf2_sha256$720000$qcpV4FGIPLufK0dXGQCztL$Ur5v1DB1Urw8tpzYoiA1XECHNNmmWIEEmYvLFSimxeE=','QLDR',1,0,'2024-04-30 08:44:19.410760','2024-04-30 08:44:19.410760','','');
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
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) NOT NULL,
  `code_challenge_method` varchar(10) NOT NULL,
  `nonce` varchar(255) NOT NULL,
  `claims` longtext NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_gran_user_id_e8f62af8_fk_trainingp` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_gran_user_id_e8f62af8_fk_trainingp` FOREIGN KEY (`user_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `jti` char(32) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `token` varchar(255) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
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
  `title` varchar(255) NOT NULL,
  `content` longtext,
  `image` varchar(255) NOT NULL,
  `tro_ly_id` bigint NOT NULL,
  `hoat_dong_ngoai_khoa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_baivie_hoat_dong_ngoai_khoa_d2e2c787_fk_trainingp` (`hoat_dong_ngoai_khoa_id`),
  KEY `trainingpoint_baivie_tro_ly_id_d68632a4_fk_trainingp` (`tro_ly_id`),
  CONSTRAINT `trainingpoint_baivie_hoat_dong_ngoai_khoa_d2e2c787_fk_trainingp` FOREIGN KEY (`hoat_dong_ngoai_khoa_id`) REFERENCES `trainingpoint_hoatdongngoaikhoa` (`id`),
  CONSTRAINT `trainingpoint_baivie_tro_ly_id_d68632a4_fk_trainingp` FOREIGN KEY (`tro_ly_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_baiviet`
--

LOCK TABLES `trainingpoint_baiviet` WRITE;
/*!40000 ALTER TABLE `trainingpoint_baiviet` DISABLE KEYS */;
INSERT INTO `trainingpoint_baiviet` VALUES (1,'2024-04-30 07:52:56.099776','2024-04-30 07:52:56.099776',1,'Bài viết 1','<p>B&agrave;i viết số 1</p>','image/upload/v1714463578/rta1hwtsbssdfd7dblgy.jpg',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_baiviet_tags`
--

LOCK TABLES `trainingpoint_baiviet_tags` WRITE;
/*!40000 ALTER TABLE `trainingpoint_baiviet_tags` DISABLE KEYS */;
INSERT INTO `trainingpoint_baiviet_tags` VALUES (1,1,1);
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
  `content` varchar(255) NOT NULL,
  `bai_viet_id` bigint NOT NULL,
  `tai_khoan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_commen_bai_viet_id_a2c3e1eb_fk_trainingp` (`bai_viet_id`),
  KEY `trainingpoint_commen_tai_khoan_id_e072273e_fk_trainingp` (`tai_khoan_id`),
  CONSTRAINT `trainingpoint_commen_bai_viet_id_a2c3e1eb_fk_trainingp` FOREIGN KEY (`bai_viet_id`) REFERENCES `trainingpoint_baiviet` (`id`),
  CONSTRAINT `trainingpoint_commen_tai_khoan_id_e072273e_fk_trainingp` FOREIGN KEY (`tai_khoan_id`) REFERENCES `trainingpoint_taikhoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_comment`
--

LOCK TABLES `trainingpoint_comment` WRITE;
/*!40000 ALTER TABLE `trainingpoint_comment` DISABLE KEYS */;
INSERT INTO `trainingpoint_comment` VALUES (1,'2024-04-30 07:54:41.624575','2024-04-30 07:54:41.624575',1,'Hay',1,3),(2,'2024-04-30 07:54:54.129983','2024-04-30 07:54:54.129983',1,'Very good',1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_diemrenluyen`
--

LOCK TABLES `trainingpoint_diemrenluyen` WRITE;
/*!40000 ALTER TABLE `trainingpoint_diemrenluyen` DISABLE KEYS */;
INSERT INTO `trainingpoint_diemrenluyen` VALUES (1,'2024-04-30 07:08:50.604800','2024-04-30 07:08:50.604800',1,80,1,1),(2,'2024-04-30 07:09:07.780143','2024-04-30 07:09:07.780143',1,85,1,2);
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
  `ma_dieu` varchar(10) NOT NULL,
  `ten_dieu` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_dieu_ma_dieu_3a4ab3bb_uniq` (`ma_dieu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_dieu`
--

LOCK TABLES `trainingpoint_dieu` WRITE;
/*!40000 ALTER TABLE `trainingpoint_dieu` DISABLE KEYS */;
INSERT INTO `trainingpoint_dieu` VALUES (1,'2024-04-25 06:35:39.142909','2024-04-25 06:35:39.142909',1,'HT1','Điều 1'),(2,'2024-04-25 06:35:55.512357','2024-04-25 06:35:55.512357',1,'HT2','Điều 2');
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
  `ma_hoat_dong` varchar(10) NOT NULL,
  `ten_hoat_dong` longtext NOT NULL,
  `ngay` datetime(6) NOT NULL,
  `description` longtext,
  `diem_ren_luyen` int NOT NULL,
  `dieu_id` bigint NOT NULL,
  `hk_nh_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_hoat_dong` (`ma_hoat_dong`),
  KEY `trainingpoint_hoatdo_dieu_id_29c4cf28_fk_trainingp` (`dieu_id`),
  KEY `trainingpoint_hoatdo_hk_nh_id_3c4aba73_fk_trainingp` (`hk_nh_id`),
  CONSTRAINT `trainingpoint_hoatdo_dieu_id_29c4cf28_fk_trainingp` FOREIGN KEY (`dieu_id`) REFERENCES `trainingpoint_dieu` (`id`),
  CONSTRAINT `trainingpoint_hoatdo_hk_nh_id_3c4aba73_fk_trainingp` FOREIGN KEY (`hk_nh_id`) REFERENCES `trainingpoint_hocky_namhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_hoatdongngoaikhoa`
--

LOCK TABLES `trainingpoint_hoatdongngoaikhoa` WRITE;
/*!40000 ALTER TABLE `trainingpoint_hoatdongngoaikhoa` DISABLE KEYS */;
INSERT INTO `trainingpoint_hoatdongngoaikhoa` VALUES (1,'2024-04-25 06:38:47.810241','2024-04-25 06:39:44.544148',1,'HĐ2401','Tham gia trồng cây xanh','2024-04-27 15:00:00.000000','<p>Hoạt động trồng c&acirc;y xanh bảo vệ m&ocirc;i trường 2024<br />\r\n&nbsp;</p>',5,2,1),(2,'2024-04-25 06:40:38.519973','2024-04-25 06:40:38.519973',1,'HĐ2402','Hoạt động khuyến khích học tập 2024','2024-04-25 06:40:10.000000','<p>Khuyến kh&iacute;ch học tập, &ocirc;n tập cho k&igrave; thi học k&igrave; 1 năm 2024</p>',5,1,1),(3,'2024-04-25 06:41:40.887633','2024-04-25 06:41:40.887633',1,'HĐ2403','Hoạt động hiến máu tình nguyện 2024 cùng sinh viên trường đại học Mở','2024-04-30 09:00:00.000000','<p>Hiến m&aacute;u t&igrave;nh nguyện năm 2024 c&ugrave;ng sinh vi&ecirc;n trường đại học Mở</p>',5,2,1),(5,'2024-04-26 11:19:09.467680','2024-04-26 11:19:09.467680',1,'HD2513','Hello','2024-04-26 18:19:00.000000','Hello',5,2,1),(6,'2024-04-26 11:22:37.105426','2024-04-26 11:22:37.105426',1,'HD2514','Hello','2024-04-26 18:22:00.000000','Hello',5,1,1);
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
  `nam_hoc` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_hocky_namhoc_hoc_ky_nam_hoc_9672aae3_uniq` (`hoc_ky`,`nam_hoc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_hocky_namhoc`
--

LOCK TABLES `trainingpoint_hocky_namhoc` WRITE;
/*!40000 ALTER TABLE `trainingpoint_hocky_namhoc` DISABLE KEYS */;
INSERT INTO `trainingpoint_hocky_namhoc` VALUES (1,1,'2024-2025');
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
  `ma_khoa` varchar(10) NOT NULL,
  `ten_khoa` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_khoa_ma_khoa_26d2be7b_uniq` (`ma_khoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_khoa`
--

LOCK TABLES `trainingpoint_khoa` WRITE;
/*!40000 ALTER TABLE `trainingpoint_khoa` DISABLE KEYS */;
INSERT INTO `trainingpoint_khoa` VALUES (1,'2024-04-25 03:57:29.331895','2024-04-25 03:57:29.331895',1,'CNTT','Công nghệ thông tin'),(2,'2024-04-25 04:25:19.900125','2024-04-25 04:25:19.900125',1,'KTXD','Kỹ thuật xây dựng');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_like`
--

LOCK TABLES `trainingpoint_like` WRITE;
/*!40000 ALTER TABLE `trainingpoint_like` DISABLE KEYS */;
INSERT INTO `trainingpoint_like` VALUES (1,'2024-04-30 07:55:06.602372','2024-04-30 07:55:06.602372',1,1,3);
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
  `ma_lop` varchar(10) NOT NULL,
  `ten_lop` varchar(255) NOT NULL,
  `khoa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_lop_ma_lop_00fe0d9e_uniq` (`ma_lop`),
  KEY `trainingpoint_lop_khoa_id_5ca17a50_fk_trainingpoint_khoa_id` (`khoa_id`),
  CONSTRAINT `trainingpoint_lop_khoa_id_5ca17a50_fk_trainingpoint_khoa_id` FOREIGN KEY (`khoa_id`) REFERENCES `trainingpoint_khoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_lop`
--

LOCK TABLES `trainingpoint_lop` WRITE;
/*!40000 ALTER TABLE `trainingpoint_lop` DISABLE KEYS */;
INSERT INTO `trainingpoint_lop` VALUES (1,'2024-04-25 03:57:30.894219','2024-04-25 04:23:56.072626',1,'DH21IT03','Lớp IT03 khóa 21',1),(2,'2024-04-25 04:23:48.431914','2024-04-25 04:23:48.431914',1,'DH21IT02','Lớp IT02 Khóa 21',1),(3,'2024-04-25 04:26:00.437087','2024-04-25 04:26:00.437087',1,'KT22XD01','Lớp XD 01 Khóa 22',2);
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
  `description` longtext NOT NULL,
  `anh_minh_chung` varchar(255) NOT NULL,
  `tham_gia_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_minhch_tham_gia_id_f447c1a5_fk_trainingp` (`tham_gia_id`),
  CONSTRAINT `trainingpoint_minhch_tham_gia_id_f447c1a5_fk_trainingp` FOREIGN KEY (`tham_gia_id`) REFERENCES `trainingpoint_thamgia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_minhchung`
--

LOCK TABLES `trainingpoint_minhchung` WRITE;
/*!40000 ALTER TABLE `trainingpoint_minhchung` DISABLE KEYS */;
INSERT INTO `trainingpoint_minhchung` VALUES (2,'2024-04-26 07:09:09.279886','2024-04-26 07:50:04.894281',1,'<p>Bổ sung minh chứng</p>','image/upload/v1714117808/rzpmkgcbtaf9yd1rqiud.jpg',2),(3,'2024-04-26 07:35:39.155179','2024-04-26 07:35:39.155179',1,'<p>Bổ sung minh chứng</p>','image/upload/v1714116942/m7fxffxkwtcwq2pza2km.png',1);
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
  `mssv` varchar(10) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `gioi_tinh` int NOT NULL,
  `dia_chi` longtext NOT NULL,
  `lop_id` bigint NOT NULL,
  `cccd` varchar(12) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_sinhvien_mssv_5ba0afec_uniq` (`mssv`),
  UNIQUE KEY `trainingpoint_sinhvien_cccd_0e526d26_uniq` (`cccd`),
  UNIQUE KEY `trainingpoint_sinhvien_email_cffac5bd_uniq` (`email`),
  KEY `trainingpoint_sinhvien_lop_id_5ec37963_fk_trainingpoint_lop_id` (`lop_id`),
  CONSTRAINT `trainingpoint_sinhvien_lop_id_5ec37963_fk_trainingpoint_lop_id` FOREIGN KEY (`lop_id`) REFERENCES `trainingpoint_lop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_sinhvien`
--

LOCK TABLES `trainingpoint_sinhvien` WRITE;
/*!40000 ALTER TABLE `trainingpoint_sinhvien` DISABLE KEYS */;
INSERT INTO `trainingpoint_sinhvien` VALUES (1,'2024-04-25 03:57:34.446858','2024-05-02 06:58:10.847670',1,'2151050153','Đỗ Gia Huy','2003-11-24',1,'abcxyz',1,'723847288309','2151050153huy@ou.edu.vn'),(2,'2024-04-25 04:22:24.882799','2024-05-02 06:58:01.207244',1,'2151050152','Vũ Ngọc Đang','2003-01-14',1,'Địa chỉ nhà sinh viên 2',1,'194780127497','vungocdang@gmail.com'),(3,'2024-04-25 04:24:00.728036','2024-05-02 06:57:45.235329',1,'2151050154','Lê Thanh Danh','2003-03-24',1,'Địa chỉ nhà sinh viên 3',2,'930412738917','lethanhdanh@gmail.com'),(4,'2024-04-25 04:26:02.514507','2024-05-02 06:58:13.928925',1,'2205012312','Ngô Huy Hoàng','2003-05-04',1,'Địa chỉ sinh viên số 4',3,'120930124017','ngohuyhoang@gmail.com');
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
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_tag`
--

LOCK TABLES `trainingpoint_tag` WRITE;
/*!40000 ALTER TABLE `trainingpoint_tag` DISABLE KEYS */;
INSERT INTO `trainingpoint_tag` VALUES (1,'2024-04-30 07:52:53.636222','2024-04-30 07:52:53.636222',1,'Môi trường');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_taikhoan`
--

LOCK TABLES `trainingpoint_taikhoan` WRITE;
/*!40000 ALTER TABLE `trainingpoint_taikhoan` DISABLE KEYS */;
INSERT INTO `trainingpoint_taikhoan` VALUES (1,'pbkdf2_sha256$720000$VFfe6amx1NfjzlIEOk7xg7$Hf6mbQYK9n+niizXjaJYbedZ9GjI7aFEeCdwF+yilv4=','2024-04-28 06:39:38.000000',1,'admin','','','',1,1,'2024-04-13 05:46:08.000000','image/upload/v1714286553/cvu3zlq7fqqyqtio6nlf.png',4),(2,'pbkdf2_sha256$720000$xBLMqmSTPMDSYHGxh3MOoH$5Y4WR5o63skhGwF4/9trjdK779ly59Lj51rxmR0KJ4M=',NULL,0,'tlsv1','Do','Huy','dohuy4546@gmail.com',0,1,'2024-04-28 06:46:28.000000','image/upload/v1714286851/wzqhifaboofej120k4ce.jpg',2),(3,'pbkdf2_sha256$720000$iWPx7uFTJv6E0DZiZoQPTl$Ql/JZryolSbJrxk7KesS2dvaQY+gNLwBLTAzKjKWRuc=',NULL,0,'sv1','Đỗ','Huy','2151050153huy@ou.edu.vn',0,1,'2024-04-30 07:53:11.000000','image/upload/v1714463632/v7fkd1dxh43r7kw2rs0a.png',1),(4,'pbkdf2_sha256$720000$5elMFN6UeeA7MGSFGTnj1Z$D6vboffxDteNVo545AAbjI1P8jdJL8nlKwoGCN/RTYo=',NULL,0,'tlsv2','Vũ','Đang','vungocdang@ou.edu.vn',1,1,'2024-05-02 07:08:03.000000','image/upload/v1714633746/q8ze5d6cm2sxryrapob1.jpg',2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_taikhoan_groups`
--

LOCK TABLES `trainingpoint_taikhoan_groups` WRITE;
/*!40000 ALTER TABLE `trainingpoint_taikhoan_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_taikhoan_user_permissions`
--

LOCK TABLES `trainingpoint_taikhoan_user_permissions` WRITE;
/*!40000 ALTER TABLE `trainingpoint_taikhoan_user_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_thamgia`
--

LOCK TABLES `trainingpoint_thamgia` WRITE;
/*!40000 ALTER TABLE `trainingpoint_thamgia` DISABLE KEYS */;
INSERT INTO `trainingpoint_thamgia` VALUES (1,2,'2024-04-25 09:05:29.746117','2024-04-26 07:08:18.351946',1,1),(2,2,'2024-04-25 09:05:36.761950','2024-04-26 07:08:58.230799',2,2),(3,0,'2024-04-25 09:05:45.885292','2024-04-25 09:05:45.885292',2,1),(4,0,'2024-04-25 09:05:51.559018','2024-04-25 09:05:51.559018',3,3),(5,0,'2024-04-25 09:05:58.838592','2024-04-25 09:05:58.838592',1,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_trolysinhvien_khoa`
--

LOCK TABLES `trainingpoint_trolysinhvien_khoa` WRITE;
/*!40000 ALTER TABLE `trainingpoint_trolysinhvien_khoa` DISABLE KEYS */;
INSERT INTO `trainingpoint_trolysinhvien_khoa` VALUES (1,'2024-04-28 06:47:36.907671','2024-04-28 06:47:36.907671',1,1,2);
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

-- Dump completed on 2024-05-02 14:46:30
