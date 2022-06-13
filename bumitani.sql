-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id_cart` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `id_category` int NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_price` int NOT NULL,
  `product_stock` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id_cart`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,0,3,'Beras Rojolele Super',11500,100,20),(2,2,0,7,'Cabai Merah Keriting',47000,100,12);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Beras Kualitas Bawah'),(2,'Beras Kualitas Medium'),(3,'Beras Kualitas Super'),(4,'Bawang Merah Ukuran Sedang'),(5,'Bawang Putih Ukurang Sedang'),(6,'Cabai Merah Besar'),(7,'Cabai Merah Keriting'),(8,'Cabai Rawit Hijau'),(9,'Cabai Rawit Merah');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_price`
--

DROP TABLE IF EXISTS `daily_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_price` (
  `id_dailyprice` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `price` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_dailyprice`),
  KEY `categoryID_idx` (`id_category`),
  CONSTRAINT `` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_price`
--

LOCK TABLES `daily_price` WRITE;
/*!40000 ALTER TABLE `daily_price` DISABLE KEYS */;
INSERT INTO `daily_price` VALUES (1,1,8300,'2022-05-30'),(2,1,8300,'2022-05-31'),(3,1,8300,'2022-06-02'),(4,1,8300,'2022-06-03'),(5,2,8850,'2022-05-30'),(6,2,8850,'2022-05-31'),(7,2,8850,'2022-06-02'),(8,2,8850,'2022-06-03'),(9,3,14650,'2022-05-30'),(10,3,14650,'2022-05-31'),(11,3,14650,'2022-06-02'),(12,3,14650,'2022-06-03'),(13,4,27800,'2022-05-30'),(14,4,27800,'2022-05-31'),(15,4,27800,'2022-06-02'),(16,4,27800,'2022-06-03'),(17,5,20200,'2022-05-30'),(18,5,20200,'2022-05-31'),(19,5,20200,'2022-06-02'),(20,5,20200,'2022-06-03'),(21,6,34350,'2022-05-30'),(22,6,34350,'2022-05-31'),(23,6,34350,'2022-06-02'),(24,6,34350,'2022-06-03'),(25,7,29050,'2022-05-30'),(26,7,29050,'2022-05-31'),(27,7,29050,'2022-06-02'),(28,7,29050,'2022-06-03'),(29,8,26650,'2022-05-30'),(30,8,26650,'2022-05-31'),(31,8,26650,'2022-06-02'),(32,8,26650,'2022-06-03'),(33,9,35750,'2022-05-30'),(34,9,35750,'2022-05-31'),(35,9,35750,'2022-06-02'),(36,9,35750,'2022-06-03');
/*!40000 ALTER TABLE `daily_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_history` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_payment` int NOT NULL,
  `id_product` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `date_order` date NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `expedition` varchar(45) NOT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  `product_price` int NOT NULL,
  `product_stock` int NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `production_location` varchar(30) NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,3,'Beras Rojolele super','Beras Rojolele kualitas super, harga per kilo.',11500,100,'https://storage.googleapis.com/product_c22_ps353/sample_beras_rojolele.jpg','Kota Bandung'),(2,7,'Cabai Merah Keriting','Cabai merah berkualitas bagus, harga per kilo.',47000,100,'https://storage.googleapis.com/product_c22_ps353/sample_cabai_cropped.jpg','Kab. Sidoarjo'),(3,3,'Beras Maknyus','Beras maknyus kualitas super, harga per kilo.',10100,100,'https://storage.googleapis.com/product_c22_ps353/sample_beras_maknyus.jpg','Kab. Cirebon'),(4,3,'Beras Anak Daro SUPER','Beras anak daro kualitas super, harga per kilo.',13000,100,'https://storage.googleapis.com/product_c22_ps353/sample_beras_anakdaro.jpg','Kab. Kampar'),(5,8,'Cabai Rawit Hijau','Cabai rawit hijau, harga per kilo.',60000,100,'https://storage.googleapis.com/product_c22_ps353/sample_cabai_rawit.jpg','Bandung'),(6,6,'Cabai Merah Besar','Cabai merah besar, harga per kilo.',71000,100,'https://storage.googleapis.com/product_c22_ps353/sample_cabai_besar.jpg','Semarang'),(7,5,'Bawang Putih ','Bawang putih ukuran sedang, harga per kilo.',31000,100,'https://storage.googleapis.com/product_c22_ps353/sample_bawang_putih.jpg','Semarang'),(8,4,'Bawang Merah Jawa','Bawang merah ukuran sedang, harga per kilo',37600,100,'https://storage.googleapis.com/product_c22_ps353/sample_bawangmerah.jpg','Kota Surabaya');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'freshy','freshh@gmail.com','freshh',NULL,'089514206899');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12 14:18:11
