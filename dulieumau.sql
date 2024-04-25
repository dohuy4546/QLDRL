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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_hoatdongngoaikhoa`
--

LOCK TABLES `trainingpoint_hoatdongngoaikhoa` WRITE;
/*!40000 ALTER TABLE `trainingpoint_hoatdongngoaikhoa` DISABLE KEYS */;
INSERT INTO `trainingpoint_hoatdongngoaikhoa` VALUES (1,'2024-04-25 06:38:47.810241','2024-04-25 06:39:44.544148',1,'HĐ2401','Tham gia trồng cây xanh','2024-04-27 15:00:00.000000','<p>Hoạt động trồng c&acirc;y xanh bảo vệ m&ocirc;i trường 2024<br />\r\n&nbsp;</p>',5,2,1),(2,'2024-04-25 06:40:38.519973','2024-04-25 06:40:38.519973',1,'HĐ2402','Hoạt động khuyến khích học tập 2024','2024-04-25 06:40:10.000000','<p>Khuyến kh&iacute;ch học tập, &ocirc;n tập cho k&igrave; thi học k&igrave; 1 năm 2024</p>',5,1,1),(3,'2024-04-25 06:41:40.887633','2024-04-25 06:41:40.887633',1,'HĐ2403','Hoạt động hiến máu tình nguyện 2024 cùng sinh viên trường đại học Mở','2024-04-30 09:00:00.000000','<p>Hiến m&aacute;u t&igrave;nh nguyện năm 2024 c&ugrave;ng sinh vi&ecirc;n trường đại học Mở</p>',5,2,1);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `trainingpoint_sinhvien_mssv_5ba0afec_uniq` (`mssv`),
  KEY `trainingpoint_sinhvien_lop_id_5ec37963_fk_trainingpoint_lop_id` (`lop_id`),
  CONSTRAINT `trainingpoint_sinhvien_lop_id_5ec37963_fk_trainingpoint_lop_id` FOREIGN KEY (`lop_id`) REFERENCES `trainingpoint_lop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingpoint_sinhvien`
--

LOCK TABLES `trainingpoint_sinhvien` WRITE;
/*!40000 ALTER TABLE `trainingpoint_sinhvien` DISABLE KEYS */;
INSERT INTO `trainingpoint_sinhvien` VALUES (1,'2024-04-25 03:57:34.446858','2024-04-25 03:58:25.067619',1,'2151050153','Đỗ Gia Huy','2003-11-24',1,'abcxyz',1),(2,'2024-04-25 04:22:24.882799','2024-04-25 04:22:24.882799',1,'2151050152','Vũ Ngọc Đang','2003-01-14',1,'Địa chỉ nhà sinh viên 2',1),(3,'2024-04-25 04:24:00.728036','2024-04-25 04:24:00.728036',1,'2151050154','Lê Thanh Danh','2003-03-24',1,'Địa chỉ nhà sinh viên 3',2),(4,'2024-04-25 04:26:02.514507','2024-04-25 04:26:02.515522',1,'2205012312','Ngô Huy Hoàng','2003-05-04',1,'Địa chỉ sinh viên số 4',3);
/*!40000 ALTER TABLE `trainingpoint_sinhvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25 15:18:19
