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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Chuyên viên công tác sinh viên'),(1,'Trợ lí sinh viên');
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,21),(2,1,22),(3,1,23),(4,1,24),(100,1,25),(101,1,26),(102,1,27),(103,1,28),(5,1,33),(6,1,34),(7,1,35),(8,1,36),(9,1,41),(10,1,42),(11,1,43),(12,1,44),(13,1,45),(14,1,46),(15,1,47),(16,1,48),(17,1,49),(18,1,50),(19,1,51),(20,1,52),(21,1,57),(22,1,58),(23,1,59),(24,1,60),(25,1,61),(26,1,62),(27,1,63),(28,1,64),(29,1,66),(30,1,67),(31,1,68),(98,1,69),(99,1,70),(32,1,71),(33,1,72),(34,1,73),(35,1,74),(36,1,75),(37,1,76),(38,2,21),(39,2,22),(40,2,23),(41,2,24),(42,2,25),(43,2,26),(44,2,27),(45,2,28),(46,2,29),(47,2,30),(48,2,31),(49,2,32),(50,2,33),(51,2,34),(52,2,35),(53,2,36),(54,2,37),(55,2,38),(56,2,39),(57,2,40),(58,2,41),(59,2,42),(60,2,43),(61,2,44),(62,2,45),(63,2,46),(64,2,47),(65,2,48),(66,2,49),(67,2,50),(68,2,51),(69,2,52),(70,2,53),(71,2,54),(72,2,55),(73,2,56),(74,2,57),(75,2,58),(76,2,59),(77,2,60),(78,2,61),(79,2,62),(80,2,63),(81,2,64),(82,2,65),(83,2,66),(84,2,67),(85,2,68),(86,2,69),(87,2,70),(88,2,71),(89,2,72),(90,2,73),(91,2,74),(92,2,75),(93,2,76),(94,2,77),(95,2,78),(96,2,79),(97,2,80);
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add dieu',6,'add_dieu'),(22,'Can change dieu',6,'change_dieu'),(23,'Can delete dieu',6,'delete_dieu'),(24,'Can view dieu',6,'view_dieu'),(25,'Can add hoc ky_ nam hoc',7,'add_hocky_namhoc'),(26,'Can change hoc ky_ nam hoc',7,'change_hocky_namhoc'),(27,'Can delete hoc ky_ nam hoc',7,'delete_hocky_namhoc'),(28,'Can view hoc ky_ nam hoc',7,'view_hocky_namhoc'),(29,'Can add khoa',8,'add_khoa'),(30,'Can change khoa',8,'change_khoa'),(31,'Can delete khoa',8,'delete_khoa'),(32,'Can view khoa',8,'view_khoa'),(33,'Can add tag',9,'add_tag'),(34,'Can change tag',9,'change_tag'),(35,'Can delete tag',9,'delete_tag'),(36,'Can view tag',9,'view_tag'),(37,'Can add user',10,'add_taikhoan'),(38,'Can change user',10,'change_taikhoan'),(39,'Can delete user',10,'delete_taikhoan'),(40,'Can view user',10,'view_taikhoan'),(41,'Can add bai viet',11,'add_baiviet'),(42,'Can change bai viet',11,'change_baiviet'),(43,'Can delete bai viet',11,'delete_baiviet'),(44,'Can view bai viet',11,'view_baiviet'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment'),(49,'Can add hoat dong ngoai khoa',13,'add_hoatdongngoaikhoa'),(50,'Can change hoat dong ngoai khoa',13,'change_hoatdongngoaikhoa'),(51,'Can delete hoat dong ngoai khoa',13,'delete_hoatdongngoaikhoa'),(52,'Can view hoat dong ngoai khoa',13,'view_hoatdongngoaikhoa'),(53,'Can add lop',14,'add_lop'),(54,'Can change lop',14,'change_lop'),(55,'Can delete lop',14,'delete_lop'),(56,'Can view lop',14,'view_lop'),(57,'Can add sinh vien',15,'add_sinhvien'),(58,'Can change sinh vien',15,'change_sinhvien'),(59,'Can delete sinh vien',15,'delete_sinhvien'),(60,'Can view sinh vien',15,'view_sinhvien'),(61,'Can add diem ren luyen',16,'add_diemrenluyen'),(62,'Can change diem ren luyen',16,'change_diemrenluyen'),(63,'Can delete diem ren luyen',16,'delete_diemrenluyen'),(64,'Can view diem ren luyen',16,'view_diemrenluyen'),(65,'Can add tham gia',17,'add_thamgia'),(66,'Can change tham gia',17,'change_thamgia'),(67,'Can delete tham gia',17,'delete_thamgia'),(68,'Can view tham gia',17,'view_thamgia'),(69,'Can add minh chung',18,'add_minhchung'),(70,'Can change minh chung',18,'change_minhchung'),(71,'Can delete minh chung',18,'delete_minhchung'),(72,'Can view minh chung',18,'view_minhchung'),(73,'Can add like',19,'add_like'),(74,'Can change like',19,'change_like'),(75,'Can delete like',19,'delete_like'),(76,'Can view like',19,'view_like'),(77,'Can add tro ly sinh vien_ khoa',20,'add_trolysinhvien_khoa'),(78,'Can change tro ly sinh vien_ khoa',20,'change_trolysinhvien_khoa'),(79,'Can delete tro ly sinh vien_ khoa',20,'delete_trolysinhvien_khoa'),(80,'Can view tro ly sinh vien_ khoa',20,'view_trolysinhvien_khoa'),(81,'Can add application',21,'add_application'),(82,'Can change application',21,'change_application'),(83,'Can delete application',21,'delete_application'),(84,'Can view application',21,'view_application'),(85,'Can add access token',22,'add_accesstoken'),(86,'Can change access token',22,'change_accesstoken'),(87,'Can delete access token',22,'delete_accesstoken'),(88,'Can view access token',22,'view_accesstoken'),(89,'Can add grant',23,'add_grant'),(90,'Can change grant',23,'change_grant'),(91,'Can delete grant',23,'delete_grant'),(92,'Can view grant',23,'view_grant'),(93,'Can add refresh token',24,'add_refreshtoken'),(94,'Can change refresh token',24,'change_refreshtoken'),(95,'Can delete refresh token',24,'delete_refreshtoken'),(96,'Can view refresh token',24,'view_refreshtoken'),(97,'Can add id token',25,'add_idtoken'),(98,'Can change id token',25,'change_idtoken'),(99,'Can delete id token',25,'delete_idtoken'),(100,'Can view id token',25,'view_idtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-27 06:53:19.005972','2','tlsv1',1,'[{\"added\": {}}]',10,1),(2,'2024-05-27 06:56:27.895151','2','tlsv1',2,'[]',10,1),(3,'2024-05-27 06:57:10.455277','2','tlsv1',3,'',10,1),(4,'2024-05-27 06:57:35.292748','3','tlsv1',1,'[{\"added\": {}}]',10,1),(5,'2024-05-27 06:58:31.384332','3','tlsv1',2,'[]',10,1),(6,'2024-05-27 06:58:50.066601','3','tlsv1',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,1),(7,'2024-05-27 06:58:53.692895','3','tlsv1',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,1),(8,'2024-05-27 07:00:29.942446','3','tlsv1',2,'[]',10,1),(9,'2024-05-27 07:07:01.421885','3','tlsv1',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',10,1),(10,'2024-05-27 07:07:45.207587','3','tlsv1',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,1),(11,'2024-05-27 07:11:07.035089','3','tlsv1',2,'[]',10,1),(12,'2024-05-27 07:11:57.451321','3','tlsv1',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,1),(13,'2024-05-27 07:13:38.077555','3','tlsv1',2,'[]',10,1),(14,'2024-05-27 07:13:48.476910','3','tlsv1',2,'[]',10,1),(15,'2024-05-27 07:14:08.220724','3','tlsv1',2,'[]',10,1),(16,'2024-05-27 07:14:55.432564','3','tlsv1',2,'[]',10,1),(17,'2024-05-27 07:42:11.141716','1','Trợ lí sinh viên',1,'[{\"added\": {}}]',3,1),(18,'2024-05-27 07:43:31.746879','3','tlsv1',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}, {\"added\": {\"name\": \"taikhoan-group relationship\", \"object\": \"TaiKhoan_groups object (1)\"}}]',10,1),(19,'2024-05-27 10:20:47.624195','2','Chuyên viên công tác sinh viên',1,'[{\"added\": {}}]',3,1),(20,'2024-05-27 10:23:24.768875','4','cvctsv1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"taikhoan-group relationship\", \"object\": \"TaiKhoan_groups object (2)\"}}]',10,1),(21,'2024-05-27 10:41:06.887808','1','Trợ lí sinh viên',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(22,'2024-05-27 11:09:06.874751','5','test',1,'[{\"added\": {}}]',10,4),(23,'2024-05-27 11:11:48.000060','5','test',3,'',10,1),(24,'2024-05-29 08:52:31.178271','1','Công nghệ thông tin',1,'[{\"added\": {}}]',8,1),(25,'2024-05-29 08:52:36.251945','1','Lớp IT03',1,'[{\"added\": {}}]',14,1),(26,'2024-05-29 08:52:39.234225','1','Đỗ Gia Huy',1,'[{\"added\": {}}]',15,1),(27,'2024-05-29 08:53:26.274595','2','Vũ Ngọc Đang',1,'[{\"added\": {}}]',15,1),(28,'2024-05-29 08:54:15.045729','2','Lớp IT02',1,'[{\"added\": {}}]',14,1),(29,'2024-05-29 08:54:16.304624','3','Lê Thanh Danh',1,'[{\"added\": {}}]',15,1),(30,'2024-05-29 08:54:59.395369','2','Kỹ thuật xây dựng',1,'[{\"added\": {}}]',8,1),(31,'2024-05-29 08:55:06.584647','3','Lớp XD 01 Khóa 22',1,'[{\"added\": {}}]',14,1),(32,'2024-05-29 08:55:09.269172','4','Ngô Huy Hoàng',1,'[{\"added\": {}}]',15,1),(33,'2024-05-29 08:56:45.410306','5','Đỗ Gia Huy',1,'[{\"added\": {}}]',15,1),(34,'2024-05-29 08:57:51.169126','8','sv1',1,'[{\"added\": {}}]',10,1),(35,'2024-05-29 08:58:25.931987','1','1 - 2024',1,'[{\"added\": {}}]',7,1),(36,'2024-05-29 09:01:23.017957','1','Điều 1',1,'[{\"added\": {}}]',6,1),(37,'2024-05-29 09:01:30.616434','2','Điều 2',1,'[{\"added\": {}}]',6,1),(38,'2024-05-29 09:01:50.728324','1','Điều 1',2,'[{\"changed\": {\"fields\": [\"Diem toi da\"]}}]',6,1),(39,'2024-05-29 09:02:03.451330','2','Điều 2',2,'[{\"changed\": {\"fields\": [\"Diem toi da\"]}}]',6,1),(40,'2024-05-29 09:02:46.409846','1','Hoạt động 1',1,'[{\"added\": {}}]',13,1),(41,'2024-05-29 09:03:56.037731','2','Hoạt động 2',1,'[{\"added\": {}}]',13,1),(42,'2024-05-29 09:04:03.688292','1','Hoạt động 1',2,'[{\"changed\": {\"fields\": [\"Diem ren luyen\"]}}]',13,1),(43,'2024-05-29 09:04:40.807052','3','Hoạt động 3',1,'[{\"added\": {}}]',13,1),(44,'2024-05-29 09:14:26.738192','1','2151050153 - Hoạt động 1',1,'[{\"added\": {}}]',17,1),(45,'2024-05-29 09:14:32.203893','2','2151050152 - Hoạt động 1',1,'[{\"added\": {}}]',17,1),(46,'2024-05-29 09:14:38.102606','3','2151050153 - Hoạt động 2',1,'[{\"added\": {}}]',17,1),(47,'2024-05-29 09:14:44.432244','4','2151050153 - Hoạt động 3',1,'[{\"added\": {}}]',17,1),(48,'2024-05-29 09:15:03.883482','5','2151050152 - Hoạt động 3',1,'[{\"added\": {}}]',17,1),(49,'2024-05-29 09:45:11.465435','6','2151050154 - Hoạt động 1',1,'[{\"added\": {}}]',17,1),(50,'2024-05-29 09:45:57.007016','6','DiemRenLuyen object (6)',3,'',16,1),(51,'2024-05-29 09:48:11.678087','2','2 - 2024',1,'[{\"added\": {}}]',7,1),(52,'2024-05-31 05:51:43.628446','1','Môi trường',1,'[{\"added\": {}}]',9,1),(53,'2024-05-31 05:52:08.912051','1','Bài viết 1',1,'[{\"added\": {}}]',11,1),(54,'2024-05-31 05:52:45.973450','2','Tình Nguyện',1,'[{\"added\": {}}]',9,1),(55,'2024-05-31 05:52:50.987352','2','Bài viết 2',1,'[{\"added\": {}}]',11,1),(56,'2024-05-31 05:53:32.363295','3','Bài viết 3',1,'[{\"added\": {}}]',11,1),(57,'2024-06-08 06:15:57.060608','1','admin',2,'[{\"changed\": {\"fields\": [\"Avatar\", \"Role\"]}}]',10,1),(58,'2024-06-08 06:21:17.308906','1','admin',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,9),(59,'2024-06-08 06:21:43.980988','1','admin',2,'[]',10,1),(60,'2024-06-10 07:57:40.806178','10','sv2',3,'',10,1),(61,'2024-06-11 10:37:06.637886','3','tlsv1',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',10,1),(62,'2024-06-11 10:43:26.914875','4','cvctsv1',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',10,1),(63,'2024-06-11 10:43:33.432956','3','tlsv1',2,'[]',10,1),(64,'2024-06-11 10:43:40.491347','1','admin',2,'[]',10,1),(65,'2024-06-11 10:43:49.390037','8','sv1',2,'[]',10,1),(66,'2024-06-11 10:43:55.413383','11','sv2',2,'[]',10,1),(67,'2024-06-12 13:41:49.279136','5','Đỗ Gia Huy',2,'[{\"changed\": {\"fields\": [\"Ho\", \"Ten\"]}}]',15,1),(68,'2024-06-12 13:41:58.202322','4','Ngô Huy Hoàng',2,'[{\"changed\": {\"fields\": [\"Ho\", \"Ten\"]}}]',15,1),(69,'2024-06-12 13:42:12.427088','3','Lê Thanh Danh',2,'[{\"changed\": {\"fields\": [\"Ho\", \"Ten\"]}}]',15,1),(70,'2024-06-12 13:42:20.573637','2','Vũ Ngọc Đang',2,'[{\"changed\": {\"fields\": [\"Ho\", \"Ten\"]}}]',15,1),(71,'2024-06-12 13:42:29.134184','1','Đỗ Gia Huy',2,'[{\"changed\": {\"fields\": [\"Ho\", \"Ten\"]}}]',15,1),(72,'2024-06-12 14:03:51.553422','1','TroLySinhVien_Khoa object (1)',1,'[{\"added\": {}}]',20,1),(73,'2024-06-12 14:09:04.678567','11','sv2',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',10,1),(74,'2024-06-12 14:10:45.819052','6','Sinh viên A',1,'[{\"added\": {}}]',15,1);
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(22,'oauth2_provider','accesstoken'),(21,'oauth2_provider','application'),(23,'oauth2_provider','grant'),(25,'oauth2_provider','idtoken'),(24,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(11,'trainingpoint','baiviet'),(12,'trainingpoint','comment'),(16,'trainingpoint','diemrenluyen'),(6,'trainingpoint','dieu'),(13,'trainingpoint','hoatdongngoaikhoa'),(7,'trainingpoint','hocky_namhoc'),(8,'trainingpoint','khoa'),(19,'trainingpoint','like'),(14,'trainingpoint','lop'),(18,'trainingpoint','minhchung'),(15,'trainingpoint','sinhvien'),(9,'trainingpoint','tag'),(10,'trainingpoint','taikhoan'),(17,'trainingpoint','thamgia'),(20,'trainingpoint','trolysinhvien_khoa');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-25 05:30:36.352909'),(2,'contenttypes','0002_remove_content_type_name','2024-05-25 05:30:36.537690'),(3,'auth','0001_initial','2024-05-25 05:30:37.732799'),(4,'auth','0002_alter_permission_name_max_length','2024-05-25 05:30:37.903265'),(5,'auth','0003_alter_user_email_max_length','2024-05-25 05:30:37.913932'),(6,'auth','0004_alter_user_username_opts','2024-05-25 05:30:37.927598'),(7,'auth','0005_alter_user_last_login_null','2024-05-25 05:30:37.942278'),(8,'auth','0006_require_contenttypes_0002','2024-05-25 05:30:37.950619'),(9,'auth','0007_alter_validators_add_error_messages','2024-05-25 05:30:37.960852'),(10,'auth','0008_alter_user_username_max_length','2024-05-25 05:30:37.973276'),(11,'auth','0009_alter_user_last_name_max_length','2024-05-25 05:30:37.989701'),(12,'auth','0010_alter_group_name_max_length','2024-05-25 05:30:38.038271'),(13,'auth','0011_update_proxy_permissions','2024-05-25 05:30:38.049853'),(14,'auth','0012_alter_user_first_name_max_length','2024-05-25 05:30:38.059739'),(15,'trainingpoint','0001_initial','2024-05-25 05:30:42.809314'),(16,'admin','0001_initial','2024-05-25 05:30:43.126215'),(17,'admin','0002_logentry_remove_auto_add','2024-05-25 05:30:43.139876'),(18,'admin','0003_logentry_add_action_flag_choices','2024-05-25 05:30:43.153185'),(19,'oauth2_provider','0001_initial','2024-05-25 05:30:45.122667'),(20,'oauth2_provider','0002_auto_20190406_1805','2024-05-25 05:30:45.329301'),(21,'oauth2_provider','0003_auto_20201211_1314','2024-05-25 05:30:45.528423'),(22,'oauth2_provider','0004_auto_20200902_2022','2024-05-25 05:30:46.739911'),(23,'oauth2_provider','0005_auto_20211222_2352','2024-05-25 05:30:46.821287'),(24,'oauth2_provider','0006_alter_application_client_secret','2024-05-25 05:30:46.856671'),(25,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-05-25 05:30:47.074522'),(26,'sessions','0001_initial','2024-05-25 05:30:47.181350'),(27,'trainingpoint','0002_alter_dieu_ma_dieu_alter_khoa_ma_khoa_and_more','2024-05-25 05:30:47.455427'),(28,'trainingpoint','0003_like','2024-05-25 05:30:47.875892'),(29,'trainingpoint','0004_alter_sinhvien_gioi_tinh','2024-05-25 05:30:48.078375'),(30,'trainingpoint','0005_alter_hoatdongngoaikhoa_diem_ren_luyen','2024-05-25 05:30:48.092170'),(31,'trainingpoint','0006_alter_hocky_namhoc_nam_hoc_and_more','2024-05-25 05:30:48.197980'),(32,'trainingpoint','0007_alter_thamgia_state','2024-05-25 05:30:48.220392'),(33,'trainingpoint','0008_alter_thamgia_state','2024-05-25 05:30:48.243911'),(34,'trainingpoint','0009_trolysinhvien_khoa','2024-05-25 05:30:48.606055'),(35,'trainingpoint','0010_alter_taikhoan_role','2024-05-25 05:30:48.623590'),(36,'trainingpoint','0006_alter_hocky_namhoc_nam_hoc','2024-05-25 05:30:48.634965'),(37,'trainingpoint','0009_merge_20240429_0924','2024-05-25 05:30:48.646561'),(38,'trainingpoint','0011_merge_20240429_1148','2024-05-25 05:30:48.655995'),(39,'trainingpoint','0012_sinhvien_cccd_sinhvien_email','2024-05-25 05:30:48.824914'),(40,'trainingpoint','0013_alter_sinhvien_cccd_alter_sinhvien_email','2024-05-25 05:30:49.031282'),(41,'trainingpoint','0014_sinhvien_tai_khoan_alter_baiviet_tro_ly_and_more','2024-05-25 05:30:49.494918'),(42,'trainingpoint','0015_remove_sinhvien_tai_khoan','2024-05-25 05:30:49.745475'),(43,'trainingpoint','0016_dieu_diem_toi_da_alter_minhchung_tham_gia','2024-05-25 05:30:50.137038'),(44,'trainingpoint','0017_alter_minhchung_tham_gia','2024-05-25 05:30:50.384882'),(45,'trainingpoint','0018_sinhvien_ho_sinhvien_ten','2024-06-12 13:41:15.044284'),(46,'trainingpoint','0019_alter_baiviet_options_alter_comment_options_and_more','2024-06-12 14:28:57.291128');
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
INSERT INTO `django_session` VALUES ('84ksk5dljoxigjy2punsgv28wrljt3bt','.eJxVjMsOwiAQRf-FtSE8poy4dN9vIAMMUjU0Ke3K-O_apAvd3nPOfYlA21rD1nkJUxYXocXpd4uUHtx2kO_UbrNMc1uXKcpdkQftcpwzP6-H-3dQqddvXTxRcQAOwVsFxp5zZiQ9WO9tNCoOxqaCGg0gamccaLQKmWNkVAzi_QG8Fja3:1sHPLm:NzldW5APw6rYOw0VB105Ml7V359J6HcBhr_L-dZLhH8','2024-06-26 14:53:22.137097'),('jtv46zxz4zm3ubgq7kzrqkihpxqybupm','.eJxVjEEOwiAQRe_C2hBgaltcuu8ZyMDMSNVAUtqV8e7apAvd_vfef6mA25rD1ngJM6mLsur0u0VMDy47oDuWW9WplnWZo94VfdCmp0r8vB7u30HGlr81JGI7OvGDiHjHYHoDzJQGi5ggUmcREox4NrED4wB99CKWe2JnDan3BwPGOKo:1sAk0G:X3X6Z903oJtyGrOkcBuONFDCk9_Urdn9nUMM-mAO0MY','2024-06-08 05:31:36.701362');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'uV1poXkKdaXMmTmQytSPZatEXUQ4dF','2024-05-31 16:08:03.893234','read write',1,8,'2024-05-31 06:08:03.893234','2024-05-31 06:08:03.893234',NULL,NULL),(2,'zBqP3yNzOinQE3WJkmMnUmxHZL3Z6m','2024-05-31 16:09:02.614312','read write',1,3,'2024-05-31 06:09:02.614312','2024-05-31 06:09:02.614312',NULL,NULL),(3,'VViEZj1ED1xvdmaUnqp7PCLCYauNxo','2024-05-31 16:31:05.289435','read write',1,8,'2024-05-31 06:31:05.289435','2024-05-31 06:31:05.289435',NULL,NULL),(4,'PLnYksZoF7OjTIJPfcWhAocaJm8QMs','2024-05-31 16:39:37.005088','read write',1,8,'2024-05-31 06:39:37.013274','2024-05-31 06:39:37.013274',NULL,NULL),(5,'99ddeADHwXO19cau9OUaqdLM6LdeOU','2024-05-31 16:40:19.483888','read write',1,3,'2024-05-31 06:40:19.483888','2024-05-31 06:40:19.483888',NULL,NULL),(6,'kzlhNH9wtfkfzidwGX5Ypw1RC0DFsE','2024-05-31 16:47:27.805655','read write',1,8,'2024-05-31 06:47:27.805655','2024-05-31 06:47:27.805655',NULL,NULL),(7,'PNcPQQRTtRb4qb50QdagcIrBeLZEHr','2024-05-31 16:51:00.654489','read write',1,3,'2024-05-31 06:51:00.654489','2024-05-31 06:51:00.654489',NULL,NULL),(8,'2OhT1nxFkmwvEQHAsl2vJVJJvuZFjV','2024-05-31 16:53:35.356551','read write',1,8,'2024-05-31 06:53:35.356551','2024-05-31 06:53:35.356551',NULL,NULL),(9,'IDUTbegIOQa15IVb8wHUVlWCDUKjci','2024-05-31 16:54:30.258198','read write',1,3,'2024-05-31 06:54:30.258198','2024-05-31 06:54:30.258198',NULL,NULL),(10,'32ZMNrkBS7Q001KoBHOR6QH7cCP2CC','2024-06-09 15:42:02.127521','read write',1,8,'2024-06-09 05:42:02.132905','2024-06-09 05:42:02.132905',NULL,NULL),(11,'u0JnpFuvWmePFTeLkKowF39AYlKhig','2024-06-09 16:59:10.820454','read write',1,8,'2024-06-09 06:59:10.825859','2024-06-09 06:59:10.825859',NULL,NULL),(12,'JruxBoCRb4AP3CjfVluHAjXDdIAvCA','2024-06-09 17:32:27.941090','read write',1,8,'2024-06-09 07:32:27.941090','2024-06-09 07:32:27.941090',NULL,NULL),(13,'GG0Ix8K8vIVB7MbZxrmbQC1iyAyXFA','2024-06-09 19:13:56.260809','read write',1,3,'2024-06-09 09:13:56.261801','2024-06-09 09:13:56.261801',NULL,NULL),(14,'yxHnFARlVwO1n3FwM0gdwDUGMCUr4f','2024-06-09 19:19:43.333020','read write',1,3,'2024-06-09 09:19:43.333020','2024-06-09 09:19:43.333020',NULL,NULL),(15,'ESPy3XSw9tUOEKt7anhtLSPGs6Kywd','2024-06-09 19:20:26.390415','read write',1,8,'2024-06-09 09:20:26.390415','2024-06-09 09:20:26.390415',NULL,NULL),(16,'PYLlJgRSTx2GWf4E7FTSNynnUq85oO','2024-06-09 19:20:50.511535','read write',1,8,'2024-06-09 09:20:50.511535','2024-06-09 09:20:50.511535',NULL,NULL),(17,'zw2109AtSaRBZ565XF7775vbr8x5JG','2024-06-09 19:21:42.339157','read write',1,8,'2024-06-09 09:21:42.339157','2024-06-09 09:21:42.339157',NULL,NULL),(18,'7EOWEztKMODiMp1fanXpZkCsy9PSxM','2024-06-09 19:23:32.551729','read write',1,3,'2024-06-09 09:23:32.559782','2024-06-09 09:23:32.559782',NULL,NULL),(19,'IAILDh3O5cJwj3vjhnO2Z4B8WNXFga','2024-06-09 19:23:43.705765','read write',1,8,'2024-06-09 09:23:43.705765','2024-06-09 09:23:43.705765',NULL,NULL),(20,'fxTpxXKuXY5Fa8MFvUHCYAsHhxeGeG','2024-06-09 19:25:11.447978','read write',1,8,'2024-06-09 09:25:11.447978','2024-06-09 09:25:11.447978',NULL,NULL),(21,'2Cr6W1sJeNR2mOJSqzoFoooBukIPyu','2024-06-09 22:56:35.874558','read write',1,3,'2024-06-09 12:56:35.874558','2024-06-09 12:56:35.874558',NULL,NULL),(22,'XoY7Zno9AAghGDzF8yfNBhbHaM0Hjm','2024-06-09 23:00:33.668263','read write',1,8,'2024-06-09 13:00:33.668263','2024-06-09 13:00:33.668263',NULL,NULL),(23,'6MVMgvgOebWj8T9wrU6Fvi594s8fri','2024-06-10 16:13:41.865700','read write',1,8,'2024-06-10 06:13:41.866688','2024-06-10 06:13:41.866688',NULL,NULL),(24,'zm5ktGPvTPn3jzL7wgucFlLkfg1DxK','2024-06-10 18:03:06.854898','read write',1,11,'2024-06-10 08:03:06.854898','2024-06-10 08:03:06.854898',NULL,NULL),(25,'fmM2j4NSw36RVQHPY21aFckXfsiFS0','2024-06-10 18:08:26.876422','read write',1,11,'2024-06-10 08:08:26.876422','2024-06-10 08:08:26.876422',NULL,NULL),(26,'aCp4QPdxOZe7p3T2iaCRTuy1aNHBXh','2024-06-10 18:09:49.578439','read write',1,11,'2024-06-10 08:09:49.578439','2024-06-10 08:09:49.578439',NULL,NULL),(27,'W0VdihqfGhcitV4mabZaCTBaGOzrTJ','2024-06-10 18:47:53.350642','read write',1,11,'2024-06-10 08:47:53.350642','2024-06-10 08:47:53.350642',NULL,NULL),(28,'ND34jwOwqOyzphAViIZ0tK3zt0z3CE','2024-06-10 23:06:23.631711','read write',1,11,'2024-06-10 13:06:23.632711','2024-06-10 13:06:23.632711',NULL,NULL),(29,'bf8szs8LbdcOEWtNl5QTMF5vLljMHw','2024-06-10 23:07:06.530398','read write',1,11,'2024-06-10 13:07:06.531394','2024-06-10 13:07:06.531394',NULL,NULL),(30,'9v0na1u9QHE4yqkBDGtYB7gKok8M6Q','2024-06-10 23:08:37.572852','read write',1,11,'2024-06-10 13:08:37.573842','2024-06-10 13:08:37.573842',NULL,NULL),(31,'VnzVaVhpj4hmew9mBGycK8ZHgn8wQ7','2024-06-11 12:37:58.446818','read write',1,11,'2024-06-11 02:37:58.446818','2024-06-11 02:37:58.446818',NULL,NULL),(32,'LR8cGQ0S5LsKcVpjOCRf5pVGncqcvq','2024-06-11 13:28:26.872434','read write',1,8,'2024-06-11 03:28:26.872434','2024-06-11 03:28:26.872434',NULL,NULL),(33,'j0yQOX1Yk8LyrXwnP5SWv3O8bCHi2s','2024-06-12 12:48:46.029888','read write',1,11,'2024-06-12 02:48:46.030876','2024-06-12 02:48:46.030876',NULL,NULL),(34,'NyzzEOHcxLJIPAybvwOguMxywVxe6c','2024-06-12 15:17:35.729300','read write',1,8,'2024-06-12 05:17:35.730484','2024-06-12 05:17:35.730484',NULL,NULL),(35,'vdsfzQym4yHFTmE75Rl8mMyE1EaYLu','2024-06-12 15:55:50.226216','read write',1,3,'2024-06-12 05:55:50.227218','2024-06-12 05:55:50.227218',NULL,NULL),(36,'v7pc52mRRDVQz2jWl6bvtsJQhlv6ox','2024-06-12 16:39:00.086502','read write',1,11,'2024-06-12 06:39:00.086502','2024-06-12 06:39:00.086502',NULL,NULL),(37,'YAqeWbHkdcjrPIKZeYLkxu0qXbBnPC','2024-06-12 18:36:26.447368','read write',1,3,'2024-06-12 08:36:26.455421','2024-06-12 08:36:26.455421',NULL,NULL),(38,'IJQPVEVkmbMuLYVdIYp8dGOO4HbAOf','2024-06-13 00:17:24.988141','read write',1,12,'2024-06-12 14:17:24.989132','2024-06-12 14:17:24.989132',NULL,NULL),(39,'u8Dy0wl5XeNMCkSUTxivvr3BKtkQbJ','2024-06-13 00:36:58.817915','read write',1,3,'2024-06-12 14:36:58.817915','2024-06-12 14:36:58.817915',NULL,NULL),(40,'9fsCHQteSo0DCmbo0bAHR0p8V72mlO','2024-06-13 00:48:20.557126','read write',1,8,'2024-06-12 14:48:20.557126','2024-06-12 14:48:20.557126',NULL,NULL);
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
INSERT INTO `oauth2_provider_application` VALUES (1,'gSyJ0fZ4vNY2ULgKf3QpY2iqjJbPuqbo4PvK63Yt','','confidential','password','pbkdf2_sha256$720000$4EHTNFayOcjYz3ISQgoYyJ$BBjdjBCudu+Ngv7NCbvCHk6+asNv3nG1Vr0YugVqJTY=','QLDR',1,0,'2024-05-31 06:07:09.040761','2024-05-31 06:07:09.040761','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'QvOKoJLarBBUAhE5AILNf3o0RsHbBv',1,1,8,'2024-05-31 06:08:03.923821','2024-05-31 06:08:03.923821',NULL),(2,'nJFLp36WJAwahXsy6S6f9KavkIr1zG',2,1,3,'2024-05-31 06:09:02.648109','2024-05-31 06:09:02.648109',NULL),(3,'kDa65iYjBHMvCHrVi2iKdDzPA3Jr5T',3,1,8,'2024-05-31 06:31:05.297483','2024-05-31 06:31:05.297483',NULL),(4,'bSSoJA6Ttn6PmywG0XxPebCgAolzIR',4,1,8,'2024-05-31 06:39:37.056969','2024-05-31 06:39:37.056969',NULL),(5,'2fA3DhOLr7FDCfRVEhMsTjECwYe1bh',5,1,3,'2024-05-31 06:40:19.491925','2024-05-31 06:40:19.491925',NULL),(6,'sS2iXu1QtecjTIjTMTGuLvTVAQKObx',6,1,8,'2024-05-31 06:47:27.839518','2024-05-31 06:47:27.839518',NULL),(7,'Q9z6oUQTFhy1FqoJ78l7QuJ4vVL9d5',7,1,3,'2024-05-31 06:51:00.655489','2024-05-31 06:51:00.655489',NULL),(8,'8oU3r9lGS7Kj2vs00GDea6ur6sGXKk',8,1,8,'2024-05-31 06:53:35.391686','2024-05-31 06:53:35.391686',NULL),(9,'A3WgrbK0X0af9FIw9FlabZRIC4hhzr',9,1,3,'2024-05-31 06:54:30.294550','2024-05-31 06:54:30.294550',NULL),(10,'h1xobVR0WU77ZVscN7DyBfM5b7KvRb',10,1,8,'2024-06-09 05:42:02.176878','2024-06-09 05:42:02.176878',NULL),(11,'G36QZemBPPrhnAtL9GRQDjIvqVlt5W',11,1,8,'2024-06-09 06:59:10.837800','2024-06-09 06:59:10.837800',NULL),(12,'Or3CxxORvwVtaxKeyp3igRHBMq54FW',12,1,8,'2024-06-09 07:32:27.956728','2024-06-09 07:32:27.956728',NULL),(13,'jDceUOeuA2OEBcoQMg7DcDg9V4BjI0',13,1,3,'2024-06-09 09:13:56.294620','2024-06-09 09:13:56.294620',NULL),(14,'hBDzYr79UlDhQtwUzehb7VlChYGTSx',14,1,3,'2024-06-09 09:19:43.370019','2024-06-09 09:19:43.370019',NULL),(15,'kdFsVXYr57QSpKuYMxdGq6sDhBMATS',15,1,8,'2024-06-09 09:20:26.410170','2024-06-09 09:20:26.410170',NULL),(16,'50idyzafZVXOuIRnOP59zGCrpq9QXC',16,1,8,'2024-06-09 09:20:50.511535','2024-06-09 09:20:50.511535',NULL),(17,'38jypEGw2TzreG1qZkcD4puz1VT7vU',17,1,8,'2024-06-09 09:21:42.359447','2024-06-09 09:21:42.359447',NULL),(18,'hEQN7kWo6qEkTzCuxoXxbb4347rwqv',18,1,3,'2024-06-09 09:23:32.582244','2024-06-09 09:23:32.582244',NULL),(19,'i6Nk9X1HjCF9rOtOlpv735gOL4J3Jx',19,1,8,'2024-06-09 09:23:43.705765','2024-06-09 09:23:43.705765',NULL),(20,'br0hxpfst00t8WFIak8eSCpgGPsGDa',20,1,8,'2024-06-09 09:25:11.447978','2024-06-09 09:25:11.447978',NULL),(21,'YopdqqhnMg14ZdQ9AanMry4YZbP57n',21,1,3,'2024-06-09 12:56:35.908553','2024-06-09 12:56:35.908553',NULL),(22,'iYwoLgtaCVgRpWaXefXUU8ubNGUQ9p',22,1,8,'2024-06-09 13:00:33.692733','2024-06-09 13:00:33.692733',NULL),(23,'JB0y8AD4BCVTPAA4AhHQNGTL4eNAgN',23,1,8,'2024-06-10 06:13:41.914589','2024-06-10 06:13:41.914589',NULL),(24,'jC6RMLgr5jpN2aB2IBKHmmjyiDUpNL',24,1,11,'2024-06-10 08:03:06.863901','2024-06-10 08:03:06.863901',NULL),(25,'kznPLlKiJDv3qb4HTaPr1UNfi4t4Yf',25,1,11,'2024-06-10 08:08:26.879069','2024-06-10 08:08:26.879069',NULL),(26,'2DnpWGuvv2E69NJCijxbLvwFhx91cR',26,1,11,'2024-06-10 08:09:49.608584','2024-06-10 08:09:49.608584',NULL),(27,'JTeD5mh1jUQHdABUDL0YQYHLkS2wNO',27,1,11,'2024-06-10 08:47:53.377007','2024-06-10 08:47:53.377007',NULL),(28,'1SDnXi6tV8CrWsHjNdOibWvPTt6IfL',28,1,11,'2024-06-10 13:06:23.683144','2024-06-10 13:06:23.683144',NULL),(29,'qwvfL7L6k0Au4OScG0qbHffgsyZAZq',29,1,11,'2024-06-10 13:07:06.559849','2024-06-10 13:07:06.559849',NULL),(30,'pSOBJw85YqfowpntN9Dh5h6Ct513rX',30,1,11,'2024-06-10 13:08:37.605768','2024-06-10 13:08:37.605768',NULL),(31,'b824jmioh2ZfurZaYyhioD88vcuLWD',31,1,11,'2024-06-11 02:37:58.503916','2024-06-11 02:37:58.503916',NULL),(32,'g1EdE3howbDISltL9gKsNcyE4pKjAU',32,1,8,'2024-06-11 03:28:26.908833','2024-06-11 03:28:26.908833',NULL),(33,'SqWxZZ5pXeyIdJq124VaJeMDHGVoLq',33,1,11,'2024-06-12 02:48:46.044388','2024-06-12 02:48:46.045390',NULL),(34,'Gr0eqISjAI0W5B4qxcFL8B8sPRFq3s',34,1,8,'2024-06-12 05:17:35.777261','2024-06-12 05:17:35.777261',NULL),(35,'Ch0Ha7ZQHEeBLSgM7EP3LwCkMbgxBz',35,1,3,'2024-06-12 05:55:50.246381','2024-06-12 05:55:50.246381',NULL),(36,'Up50V5Qy4zjY8EXzHDlsEAKTytayQk',36,1,11,'2024-06-12 06:39:00.121456','2024-06-12 06:39:00.121456',NULL),(37,'kNK5NZtSva3KogTJ5yLq0L5QijU7Sa',37,1,3,'2024-06-12 08:36:26.457459','2024-06-12 08:36:26.457459',NULL),(38,'qEIgew2z0plzunTwtwdeSu0W1l9EB5',38,1,12,'2024-06-12 14:17:25.034355','2024-06-12 14:17:25.034355',NULL),(39,'uhZztKlbB0SUbgCeCFTBEjeCweNMdt',39,1,3,'2024-06-12 14:36:58.845406','2024-06-12 14:36:58.845406',NULL),(40,'2N7fZtekYIVxqTtMqP541qXaM3blCS',40,1,8,'2024-06-12 14:48:20.602346','2024-06-12 14:48:20.602346',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_baiviet`
--

LOCK TABLES `trainingpoint_baiviet` WRITE;
/*!40000 ALTER TABLE `trainingpoint_baiviet` DISABLE KEYS */;
INSERT INTO `trainingpoint_baiviet` VALUES (1,'2024-05-31 05:51:59.459105','2024-05-31 05:51:59.459105',1,'Bài viết 1','<p>Lorem ipsum dolor sit amet. Non obcaecati rerum in quia voluptatem qui saepe quibusdam sed veniam dolor ad fugiat velit! Vel ipsa debitis aut molestiae voluptas ex illum consequatur. Non molestiae maxime sit ullam iste aut quas commodi sed alias veritatis 33 rerum enim. Est reprehenderit quia ab numquam tempore est harum dolorem est optio blanditiis quo vero voluptas.</p>\r\n\r\n<p>Eum officia veritatis vel vitae omnis non numquam magni in galisum alias. Non voluptas incidunt aut voluptate animi aut excepturi molestias qui incidunt quam et magni magnam. Qui reprehenderit quas aut iste harum ea dolor perspiciatis qui velit neque qui placeat provident 33 esse quos.</p>\r\n\r\n<p>Sit tenetur nobis eum saepe soluta qui libero velit. Et eligendi enim ut ipsa consequatur et dolores omnis id sint tenetur. In quam exercitationem sit consequatur quis quo eius delectus a itaque quasi et delectus atque! Sed nesciunt quia non odit placeat ad culpa dolorem non facilis officiis et quisquam recusandae sed quia illum.</p>','image/upload/v1717134729/dwb0ymqwhpuvqxqt9bgl.jpg',3,1),(2,'2024-05-31 05:52:50.423693','2024-05-31 05:52:50.423693',1,'Bài viết 2','<p>Lorem ipsum dolor sit amet. Non obcaecati rerum in quia voluptatem qui saepe quibusdam sed veniam dolor ad fugiat velit! Vel ipsa debitis aut molestiae voluptas ex illum consequatur. Non molestiae maxime sit ullam iste aut quas commodi sed alias veritatis 33 rerum enim. Est reprehenderit quia ab numquam tempore est harum dolorem est optio blanditiis quo vero voluptas.</p>\r\n\r\n<p>Eum officia veritatis vel vitae omnis non numquam magni in galisum alias. Non voluptas incidunt aut voluptate animi aut excepturi molestias qui incidunt quam et magni magnam. Qui reprehenderit quas aut iste harum ea dolor perspiciatis qui velit neque qui placeat provident 33 esse quos.</p>\r\n\r\n<p>Sit tenetur nobis eum saepe soluta qui libero velit. Et eligendi enim ut ipsa consequatur et dolores omnis id sint tenetur. In quam exercitationem sit consequatur quis quo eius delectus a itaque quasi et delectus atque! Sed nesciunt quia non odit placeat ad culpa dolorem non facilis officiis et quisquam recusandae sed quia illum.</p>','image/upload/v1717134771/jq0htwskkjdlwpflruyg.jpg',3,2),(3,'2024-05-31 05:53:25.303974','2024-05-31 05:53:25.303974',1,'Bài viết 3','<p>Lorem ipsum dolor sit amet. Non obcaecati rerum in quia voluptatem qui saepe quibusdam sed veniam dolor ad fugiat velit! Vel ipsa debitis aut molestiae voluptas ex illum consequatur. Non molestiae maxime sit ullam iste aut quas commodi sed alias veritatis 33 rerum enim. Est reprehenderit quia ab numquam tempore est harum dolorem est optio blanditiis quo vero voluptas.</p>\r\n\r\n<p>Eum officia veritatis vel vitae omnis non numquam magni in galisum alias. Non voluptas incidunt aut voluptate animi aut excepturi molestias qui incidunt quam et magni magnam. Qui reprehenderit quas aut iste harum ea dolor perspiciatis qui velit neque qui placeat provident 33 esse quos.</p>\r\n\r\n<p>Sit tenetur nobis eum saepe soluta qui libero velit. Et eligendi enim ut ipsa consequatur et dolores omnis id sint tenetur. In quam exercitationem sit consequatur quis quo eius delectus a itaque quasi et delectus atque! Sed nesciunt quia non odit placeat ad culpa dolorem non facilis officiis et quisquam recusandae sed quia illum.</p>','image/upload/v1717134812/rvwgnnjvezbqibcu6o7w.jpg',3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_baiviet_tags`
--

LOCK TABLES `trainingpoint_baiviet_tags` WRITE;
/*!40000 ALTER TABLE `trainingpoint_baiviet_tags` DISABLE KEYS */;
INSERT INTO `trainingpoint_baiviet_tags` VALUES (1,1,1),(2,2,2),(3,3,1),(4,3,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_comment`
--

LOCK TABLES `trainingpoint_comment` WRITE;
/*!40000 ALTER TABLE `trainingpoint_comment` DISABLE KEYS */;
INSERT INTO `trainingpoint_comment` VALUES (1,'2024-05-31 06:37:44.655024','2024-05-31 06:37:44.655024',1,'hello',3,8),(2,'2024-05-31 06:39:43.389588','2024-05-31 06:39:43.389588',1,'wut',3,8),(3,'2024-05-31 06:40:26.145463','2024-05-31 06:40:26.145463',1,'???',3,3),(4,'2024-05-31 06:46:29.779281','2024-05-31 06:46:29.779281',1,'alo',3,3),(5,'2024-06-09 06:13:12.050413','2024-06-09 06:13:12.050413',1,'hello',3,8),(6,'2024-06-11 03:41:26.772035','2024-06-11 03:41:26.772035',1,'hello',3,11),(7,'2024-06-12 06:58:55.831625','2024-06-12 06:58:55.831625',1,'abc',3,11),(8,'2024-06-12 06:58:59.455193','2024-06-12 06:58:59.455193',1,'...',3,11),(9,'2024-06-12 06:59:02.184391','2024-06-12 06:59:02.184391',1,'hhhhhh',3,11),(10,'2024-06-12 06:59:04.187754','2024-06-12 06:59:04.187754',1,'ssss',3,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_diemrenluyen`
--

LOCK TABLES `trainingpoint_diemrenluyen` WRITE;
/*!40000 ALTER TABLE `trainingpoint_diemrenluyen` DISABLE KEYS */;
INSERT INTO `trainingpoint_diemrenluyen` VALUES (1,'2024-05-29 09:44:26.434578','2024-06-12 14:52:44.819131',1,90,1,1),(2,'2024-05-29 09:44:26.461070','2024-06-12 14:52:44.832731',1,50,1,2),(3,'2024-05-29 09:44:26.475208','2024-06-12 14:52:44.845915',1,30,1,3),(4,'2024-05-29 09:44:26.491235','2024-06-12 14:52:44.861297',1,0,1,4),(5,'2024-05-29 09:44:26.508380','2024-06-12 14:52:44.876601',1,50,1,5),(7,'2024-05-29 09:48:15.474928','2024-05-29 09:48:15.474928',1,0,2,1),(8,'2024-05-29 09:48:15.491205','2024-05-29 09:48:15.491205',1,0,2,2),(9,'2024-05-29 09:48:15.502587','2024-05-29 09:48:15.502587',1,0,2,3),(10,'2024-05-29 09:48:15.514454','2024-05-29 09:48:15.514454',1,0,2,4),(11,'2024-05-29 09:48:15.527375','2024-05-29 09:48:15.527375',1,0,2,5),(12,'2024-06-12 14:52:44.890311','2024-06-12 14:52:44.890311',1,0,1,6);
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
  `diem_toi_da` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_dieu_ma_dieu_3a4ab3bb_uniq` (`ma_dieu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_dieu`
--

LOCK TABLES `trainingpoint_dieu` WRITE;
/*!40000 ALTER TABLE `trainingpoint_dieu` DISABLE KEYS */;
INSERT INTO `trainingpoint_dieu` VALUES (1,'2024-05-29 09:01:23.016899','2024-05-29 09:01:50.725366',1,'HT1','Điều 1',50),(2,'2024-05-29 09:01:30.613434','2024-05-29 09:02:03.449330',1,'HT2','Điều 2',50);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_hoatdongngoaikhoa`
--

LOCK TABLES `trainingpoint_hoatdongngoaikhoa` WRITE;
/*!40000 ALTER TABLE `trainingpoint_hoatdongngoaikhoa` DISABLE KEYS */;
INSERT INTO `trainingpoint_hoatdongngoaikhoa` VALUES (1,'2024-05-29 09:02:46.402846','2024-05-29 09:04:03.686757',1,'HĐ2401','Hoạt động 1','2024-05-29 15:00:00.000000','<p>Lorem ipsum dolor sit amet. Id sapiente fuga aut minus quia et enim aliquid aut sint nesciunt ut beatae optio 33 sint cupiditate est nobis quibusdam. Aut doloribus necessitatibus id quas nulla aut pariatur modi est fugiat possimus sed fuga distinctio vel fuga quasi.</p>\r\n\r\n<p>Ut error deserunt qui delectus voluptatem nam rerum quam sit possimus perspiciatis qui asperiores sapiente est unde commodi aut minima libero. Qui minus reprehenderit qui nesciunt dolores aut aliquid officia ut quis consequatur. Et itaque odio quo quam sunt non harum reprehenderit et dolorem voluptas est unde nihil. Et repellendus necessitatibus aut quia rerum ut dolorum eligendi non eaque deserunt ex quam dolore eum veniam quibusdam.</p>\r\n\r\n<p>Non quia eligendi qui culpa laudantium est modi officiis eum dolore pariatur et velit placeat. Qui architecto fuga qui molestiae ipsam ad voluptatem aliquid et assumenda deleniti?<br />\r\n&nbsp;</p>',30,1,1),(2,'2024-05-29 09:03:56.037731','2024-05-29 09:03:56.037731',1,'HĐ2402','Hoạt động 2','2024-05-30 06:00:00.000000','<p>Lorem ipsum dolor sit amet. Ut deserunt dolor id reprehenderit omnis vel similique natus et suscipit sapiente sit atque eligendi et quasi omnis qui laborum alias. Hic ducimus obcaecati et sint officiis et nihil perferendis rem voluptas sint. Et odio fugit non explicabo sapiente et quam corrupti est omnis aperiam ut ducimus dignissimos. Quo cupiditate provident eum cupiditate voluptatum ea voluptatem placeat sit voluptatem omnis.</p>\r\n\r\n<p>Vel suscipit nobis qui quia omnis eos consequatur nobis a ratione nemo qui corporis odio. Et inventore consectetur aut officia consequatur sed officiis excepturi aut quaerat maiores ea error enim et rerum magni! Ab voluptatem adipisci cum corrupti debitis non perspiciatis accusamus et velit beatae vel dignissimos sint est beatae quia. Sit adipisci quos id quos molestiae qui amet voluptatem nam amet numquam.</p>\r\n\r\n<p>Quo odit maiores sed impedit sint eos omnis suscipit sit quia impedit ea fuga error ut quisquam magni ex tenetur dolor. Ea veniam possimus ut facere quam eum aliquam tempore aut dolorem dolorum et sunt dicta. Nam vitae soluta ut iure pariatur et blanditiis quaerat aut nesciunt ullam. Quo commodi dolor ea commodi quisquam qui iusto perspiciatis non debitis nostrum ut soluta quia 33 quia natus.</p>',40,2,1),(3,'2024-05-29 09:04:40.804045','2024-05-29 09:04:40.804045',1,'HĐ2403','Hoạt động 3','2024-05-31 09:04:22.000000','<p>Lorem ipsum dolor sit amet. Ut deserunt dolor id reprehenderit omnis vel similique natus et suscipit sapiente sit atque eligendi et quasi omnis qui laborum alias. Hic ducimus obcaecati et sint officiis et nihil perferendis rem voluptas sint. Et odio fugit non explicabo sapiente et quam corrupti est omnis aperiam ut ducimus dignissimos. Quo cupiditate provident eum cupiditate voluptatum ea voluptatem placeat sit voluptatem omnis.</p>\r\n\r\n<p>Vel suscipit nobis qui quia omnis eos consequatur nobis a ratione nemo qui corporis odio. Et inventore consectetur aut officia consequatur sed officiis excepturi aut quaerat maiores ea error enim et rerum magni! Ab voluptatem adipisci cum corrupti debitis non perspiciatis accusamus et velit beatae vel dignissimos sint est beatae quia. Sit adipisci quos id quos molestiae qui amet voluptatem nam amet numquam.</p>\r\n\r\n<p>Quo odit maiores sed impedit sint eos omnis suscipit sit quia impedit ea fuga error ut quisquam magni ex tenetur dolor. Ea veniam possimus ut facere quam eum aliquam tempore aut dolorem dolorum et sunt dicta. Nam vitae soluta ut iure pariatur et blanditiis quaerat aut nesciunt ullam. Quo commodi dolor ea commodi quisquam qui iusto perspiciatis non debitis nostrum ut soluta quia 33 quia natus.</p>',25,1,1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_hocky_namhoc`
--

LOCK TABLES `trainingpoint_hocky_namhoc` WRITE;
/*!40000 ALTER TABLE `trainingpoint_hocky_namhoc` DISABLE KEYS */;
INSERT INTO `trainingpoint_hocky_namhoc` VALUES (1,1,'2024'),(2,2,'2024');
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
INSERT INTO `trainingpoint_khoa` VALUES (1,'2024-05-29 08:52:31.167287','2024-05-29 08:52:31.167287',1,'CNTT','Công nghệ thông tin'),(2,'2024-05-29 08:54:59.391900','2024-05-29 08:54:59.391900',1,'KTXD','Kỹ thuật xây dựng');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_like`
--

LOCK TABLES `trainingpoint_like` WRITE;
/*!40000 ALTER TABLE `trainingpoint_like` DISABLE KEYS */;
INSERT INTO `trainingpoint_like` VALUES (1,'2024-06-10 06:21:43.772670','2024-06-10 06:21:43.772670',1,3,8),(2,'2024-06-10 06:21:45.179412','2024-06-10 06:21:45.179412',1,1,8),(3,'2024-06-11 03:57:57.534256','2024-06-11 03:57:57.534256',1,3,11),(4,'2024-06-11 03:57:59.721164','2024-06-11 03:57:59.721164',1,1,11);
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
INSERT INTO `trainingpoint_lop` VALUES (1,'2024-05-29 08:52:36.248922','2024-05-29 08:52:36.248922',1,'DH21IT03','Lớp IT03',1),(2,'2024-05-29 08:54:15.044728','2024-05-29 08:54:15.044728',1,'DH21IT02','Lớp IT02',1),(3,'2024-05-29 08:55:06.582752','2024-05-29 08:55:06.582752',1,'KT22XD01','Lớp XD 01 Khóa 22',2);
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
  KEY `trainingpoint_minhchung_tham_gia_id_f447c1a5` (`tham_gia_id`),
  CONSTRAINT `trainingpoint_minhch_tham_gia_id_f447c1a5_fk_trainingp` FOREIGN KEY (`tham_gia_id`) REFERENCES `trainingpoint_thamgia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_minhchung`
--

LOCK TABLES `trainingpoint_minhchung` WRITE;
/*!40000 ALTER TABLE `trainingpoint_minhchung` DISABLE KEYS */;
INSERT INTO `trainingpoint_minhchung` VALUES (1,'2024-05-31 06:50:05.290488','2024-05-31 06:50:05.290488',1,'báo thiếu 1','image/upload/v1717138208/dc6yjuzobb53yliye2cf.jpg',7),(2,'2024-06-09 09:12:47.942229','2024-06-09 09:12:47.942229',1,'báo thiếu hd1','image/upload/v1717924369/n6jiidf3t2zoqmudcn2r.jpg',8);
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
  `ho` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_sinhvien_mssv_5ba0afec_uniq` (`mssv`),
  UNIQUE KEY `trainingpoint_sinhvien_cccd_0e526d26_uniq` (`cccd`),
  UNIQUE KEY `trainingpoint_sinhvien_email_cffac5bd_uniq` (`email`),
  KEY `trainingpoint_sinhvien_lop_id_5ec37963_fk_trainingpoint_lop_id` (`lop_id`),
  CONSTRAINT `trainingpoint_sinhvien_lop_id_5ec37963_fk_trainingpoint_lop_id` FOREIGN KEY (`lop_id`) REFERENCES `trainingpoint_lop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_sinhvien`
--

LOCK TABLES `trainingpoint_sinhvien` WRITE;
/*!40000 ALTER TABLE `trainingpoint_sinhvien` DISABLE KEYS */;
INSERT INTO `trainingpoint_sinhvien` VALUES (1,'2024-05-29 08:52:39.230421','2024-06-12 13:42:29.132177',1,'2151050153','Đỗ Gia Huy','2003-11-24',1,'abc',1,'930412738917','2151050153huy@ou.edu.vn','Đỗ','Gia Huy'),(2,'2024-05-29 08:53:26.271592','2024-06-12 13:42:20.572638',1,'2151050152','Vũ Ngọc Đang','2003-01-14',1,'abc',1,'194780127497','sv2@gmail.com','Vũ','Ngọc Đang'),(3,'2024-05-29 08:54:16.302624','2024-06-12 13:42:12.425088',1,'2151050154','Lê Thanh Danh','2003-03-24',1,'abc',2,'723847288309','sv3@gmail.com','Lê','Thanh Danh'),(4,'2024-05-29 08:55:09.267171','2024-06-12 13:41:58.200048',1,'2151050155','Ngô Huy Hoàng','2003-05-04',1,'abc',3,'123124152352','sv4@gmail.com','Ngô','Huy Hoàng'),(5,'2024-05-29 08:56:45.400526','2024-06-12 13:41:49.274769',1,'2151050156','Đỗ Gia Huy','2003-05-04',1,'abc',2,'123129850820','dohuy4546@gmail.com','Đỗ','Gia Huy'),(6,'2024-06-12 14:10:45.817049','2024-06-12 14:10:45.817049',1,'2151050159','Sinh viên A','2003-05-04',1,'abc',3,'134124109240','dohuy5053@gmail.com','Sinh viên','A');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_tag`
--

LOCK TABLES `trainingpoint_tag` WRITE;
/*!40000 ALTER TABLE `trainingpoint_tag` DISABLE KEYS */;
INSERT INTO `trainingpoint_tag` VALUES (1,'2024-05-31 05:51:43.625402','2024-05-31 05:51:43.625402',1,'Môi trường'),(2,'2024-05-31 05:52:45.971874','2024-05-31 05:52:45.971874',1,'Tình Nguyện');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_taikhoan`
--

LOCK TABLES `trainingpoint_taikhoan` WRITE;
/*!40000 ALTER TABLE `trainingpoint_taikhoan` DISABLE KEYS */;
INSERT INTO `trainingpoint_taikhoan` VALUES (1,'pbkdf2_sha256$720000$IfUElH6w690q0xpzeC5m65$biUCftq0AEjo+/V6T0LAFG0niVfOpoCjNXEWQZgxU20=','2024-06-12 14:53:22.125288',1,'admin','','','',1,1,'2024-05-25 05:31:16.000000','image/upload/v1717827357/qcamyntkyzagkgfinp1o.png',4),(3,'pbkdf2_sha256$720000$B8878PRqJ30h3k5IPwvp7o$UxJ+3nPNiKw8HxI4/4F5NtSoJsoZs68Tv4kqeSK4euM=','2024-06-12 14:52:35.931822',0,'tlsv1','Hoàng','Kha','tlsv1@gmail.com',1,1,'2024-05-27 06:57:12.000000','image/upload/v1716793058/bvjhsst2skexq8xlbbm3.png',2),(4,'pbkdf2_sha256$720000$6rq72X4CsbLwwZpyHFDMYD$NlDodxxSLGcK0UJ3dbbMUWSAgb/uLNNJ9ijCkM2fl6Q=','2024-05-27 11:07:28.000000',0,'cvctsv1','Nguyễn','Văn A','cvctsv1@gmail.com',1,1,'2024-05-27 10:22:19.000000','image/upload/v1716805408/sbda8vr4ryfhxxihekb1.jpg',3),(8,'pbkdf2_sha256$720000$FFXODEWXjiOkB1Cz7JLSym$w94j2JMie8dwYcceiGyrdOp3YJntuDxkoZIUVC9G5LM=',NULL,0,'sv1','Đỗ','Huy','dohuy4546@gmail.com',0,1,'2024-05-29 08:56:54.000000','image/upload/v1716973072/xaqgforye9ldg9nevzn6.png',1),(9,'pbkdf2_sha256$720000$8O1hYMvDVoU2T3dmzENcfD$W+tAAe0kQNqICSWEf8IErWwpSwk1cA3BhFp204kXdTo=','2024-06-08 06:21:08.408802',1,'admin2','','','',1,1,'2024-06-08 06:20:40.645370',NULL,NULL),(11,'pbkdf2_sha256$720000$VSBf7YxMBzs0CeiDuuibH1$PYemyySxBmemTC2pguaZfvR7bIaWSjWGL2QkaQYL6yc=',NULL,0,'sv2','Đỗ','Gia Huy','2151050153huy@ou.edu.vn',0,1,'2024-06-10 07:58:22.000000','image/upload/v1718006307/rhg8ivetcttwixqcehri.jpg',1),(12,'pbkdf2_sha256$720000$vRFKuxvzYzP7xe7FMwOE2q$Voykb1riW86ZHGEnvUdEqNW82I2IFPKcp64QtV//iH8=',NULL,0,'dohuy5053','Sinh viên','A','dohuy5053@gmail.com',0,1,'2024-06-12 14:12:46.001872','image/upload/v1718201569/ex3mr4e2zfsbslvyl16q.jpg',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_taikhoan_groups`
--

LOCK TABLES `trainingpoint_taikhoan_groups` WRITE;
/*!40000 ALTER TABLE `trainingpoint_taikhoan_groups` DISABLE KEYS */;
INSERT INTO `trainingpoint_taikhoan_groups` VALUES (1,3,1),(2,4,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `state` int NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `hoat_dong_ngoai_khoa_id` bigint NOT NULL,
  `sinh_vien_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trainingpoint_thamgi_hoat_dong_ngoai_khoa_07fbed16_fk_trainingp` (`hoat_dong_ngoai_khoa_id`),
  KEY `trainingpoint_thamgi_sinh_vien_id_2db71d83_fk_trainingp` (`sinh_vien_id`),
  CONSTRAINT `trainingpoint_thamgi_hoat_dong_ngoai_khoa_07fbed16_fk_trainingp` FOREIGN KEY (`hoat_dong_ngoai_khoa_id`) REFERENCES `trainingpoint_hoatdongngoaikhoa` (`id`),
  CONSTRAINT `trainingpoint_thamgi_sinh_vien_id_2db71d83_fk_trainingp` FOREIGN KEY (`sinh_vien_id`) REFERENCES `trainingpoint_sinhvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_thamgia`
--

LOCK TABLES `trainingpoint_thamgia` WRITE;
/*!40000 ALTER TABLE `trainingpoint_thamgia` DISABLE KEYS */;
INSERT INTO `trainingpoint_thamgia` VALUES (1,1,'2024-05-29 09:14:26.735742','2024-05-29 09:14:26.735742',1,1),(2,1,'2024-05-29 09:14:32.162985','2024-05-29 09:14:32.162985',1,2),(3,1,'2024-05-29 09:14:38.101606','2024-05-29 09:14:38.101606',2,1),(4,1,'2024-05-29 09:14:44.408979','2024-05-29 09:14:44.408979',3,1),(5,1,'2024-05-29 09:15:03.883482','2024-05-29 09:15:03.883482',3,2),(6,1,'2024-05-29 09:45:11.464427','2024-05-29 09:45:11.464427',1,3),(7,1,'2024-05-31 06:47:30.846497','2024-05-31 06:51:36.293372',3,5),(8,1,'2024-05-31 06:47:35.855428','2024-06-12 14:47:49.894513',1,5),(21,0,'2024-06-09 09:07:10.271961','2024-06-09 09:07:10.271961',2,5);
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
INSERT INTO `trainingpoint_trolysinhvien_khoa` VALUES (1,'2024-06-12 14:03:51.551878','2024-06-12 14:03:51.551878',1,1,3);
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

-- Dump completed on 2024-06-12 23:02:15
