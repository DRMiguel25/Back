migue@migue-zorin:~$ cat ~/comandas_db_backup.sql
/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: comandas_db
-- ------------------------------------------------------
-- Server version	10.6.22-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idcategory` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('4716bb4e-0793-4c76-9b48-3dd8e7a9ba9a','Snacks','Botanas y snacks','2025-12-01 20:52:33'),('64afaea8-be6c-49ae-8e99-32132dd89630','Alitas','Alitas de pollo','2025-12-01 20:52:33'),('da99cc44-03a0-457a-8711-4660c3b5b45b','Hamburguesas','Hamburguesas especiales','2025-12-01 20:52:33');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `idingredients` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `min_stock` int(11) DEFAULT 0,
  `unit` varchar(20) DEFAULT NULL COMMENT 'kg, lt, pz, etc.',
  `extra` tinyint(1) DEFAULT 0 COMMENT 'Si es ingrediente extra con costo adicional',
  `required` tinyint(1) DEFAULT 1 COMMENT 'Si es ingrediente requerido en el producto',
  `cost` decimal(10,2) DEFAULT 0.00 COMMENT 'Costo adicional si es extra',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idingredients`),
  KEY `idx_stock` (`stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES ('0d4cf3d7-ced6-11f0-95a1-eb768d624531','Carne',100,20,'pz',0,1,0.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4cf5a0-ced6-11f0-95a1-eb768d624531','Queso',150,30,'pz',0,1,0.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4cf606-ced6-11f0-95a1-eb768d624531','Lechuga',80,15,'pz',0,1,0.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4cf622-ced6-11f0-95a1-eb768d624531','Jitomate',90,20,'pz',0,1,0.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4cf63d-ced6-11f0-95a1-eb768d624531','Cebolla',70,15,'pz',0,1,0.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4cf656-ced6-11f0-95a1-eb768d624531','Mayonesa',20,5,'lt',0,1,0.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4cf66e-ced6-11f0-95a1-eb768d624531','Mostaza',15,3,'lt',0,1,0.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4cf683-ced6-11f0-95a1-eb768d624531','Catsup',25,5,'lt',0,1,0.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4e23c7-ced6-11f0-95a1-eb768d624531','Tocino',60,10,'pz',1,0,15.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4e26a2-ced6-11f0-95a1-eb768d624531','Jamon',80,15,'pz',1,0,10.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4e26ee-ced6-11f0-95a1-eb768d624531','Aguacate',50,10,'pz',1,0,12.00,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d4e2766-ced6-11f0-95a1-eb768d624531','Piña',40,10,'pz',1,0,8.00,'2025-12-01 20:52:33','2025-12-01 20:52:33');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idorder` varchar(36) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `origin` varchar(50) DEFAULT NULL COMMENT 'Mostrador, Mesa, Delivery',
  `comments` text DEFAULT NULL,
  `client` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT 0 COMMENT '0=Pendiente, 1=En preparación, 2=Lista, 3=Entregada, 4=Cancelada',
  `users_idusers` varchar(36) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_order` timestamp NULL DEFAULT NULL,
  `finish_order` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idorder`),
  KEY `idx_status` (`status`),
  KEY `idx_date` (`date`),
  KEY `idx_user` (`users_idusers`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('012de947-9cb4-47a4-bc89-7c5dd28dc619',93.00,'Mostrador',NULL,'Miguelin',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 15:42:31','2025-12-02 15:42:43','2025-12-02 16:07:13','2025-12-02 15:42:31','2025-12-02 22:42:31'),('061626f4-22b3-4f42-b924-e30ba617d78e',100.00,'Mostrador',NULL,'alma',1,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 05:32:53','2025-12-02 15:29:10',NULL,'2025-12-02 05:32:53','2025-12-02 15:29:10'),('0dcbf847-977c-4b95-ad0e-99c02cfcf8bb',102.00,'Mostrador',NULL,'n',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-03 05:07:13','2025-12-03 05:07:23','2025-12-03 05:07:25','2025-12-03 05:07:13','2025-12-04 14:46:12'),('188d9772-41ed-47db-814f-10c16dead50e',97.00,'Mostrador',NULL,'s',1,'0d61ca6b-ced6-11f0-95a1-eb768d624531','2025-12-04 05:04:42','2025-12-04 06:00:04',NULL,'2025-12-04 05:04:42','2025-12-04 06:00:04'),('1e793f22-a892-4e02-bfa1-784ed9885a20',100.00,'Mostrador',NULL,'mike',3,'0d61ca6b-ced6-11f0-95a1-eb768d624531','2025-12-02 22:40:58','2025-12-02 22:41:16','2025-12-02 22:41:18','2025-12-02 22:40:58','2025-12-02 22:41:30'),('3da20252-c000-425c-9b47-365606201a2e',15.00,'App Cliente',NULL,'cliente2',4,'7401f3fd-595f-4c11-a96a-391cfe677603','2025-12-03 05:53:00',NULL,NULL,'2025-12-03 05:53:00','2025-12-03 05:53:04'),('3dd2c2a3-a834-4085-9021-f72f0cc6b16b',97.00,'Mostrador',NULL,'Cliente2',3,'7401f3fd-595f-4c11-a96a-391cfe677603','2025-12-03 05:14:39','2025-12-03 05:15:01','2025-12-03 05:15:56','2025-12-03 05:14:39','2025-12-04 14:46:15'),('45b20fcb-d2cc-4c04-bb3f-09ea19e824fd',107.00,'Mostrador',NULL,'mike',1,'7401f3fd-595f-4c11-a96a-391cfe677603','2025-12-03 05:09:15','2025-12-03 05:09:32',NULL,'2025-12-03 05:09:15','2025-12-03 05:09:32'),('4a561424-642d-4602-aa7e-fdb38d64289f',55.00,'Mostrador',NULL,'juana',4,'0d61ca6b-ced6-11f0-95a1-eb768d624531','2025-12-02 22:43:08',NULL,NULL,'2025-12-02 22:43:08','2025-12-02 22:43:10'),('5785f333-d2a6-48e8-92f9-d26e7b0754da',90.00,'App Cliente',NULL,'cliente5',2,'9823f679-9dda-49ae-bb1a-9b7af74a34b6','2025-12-04 06:48:03',NULL,'2025-12-04 06:48:19','2025-12-04 06:48:03','2025-12-04 06:48:19'),('5f0f5e94-ff5d-458d-aabe-cb4606ad686f',102.00,'Mostrador',NULL,'alma',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 05:32:35','2025-12-02 14:13:27','2025-12-02 15:15:03','2025-12-02 05:32:35','2025-12-02 22:42:26'),('5f63c2ab-ef83-4ddb-a1c7-5dcce23f9f93',100.00,'App Cliente',NULL,'cliente2',2,'7401f3fd-595f-4c11-a96a-391cfe677603','2025-12-04 05:31:45',NULL,'2025-12-04 06:44:43','2025-12-04 05:31:45','2025-12-04 06:44:43'),('9060b1d5-60c0-4d42-a6ea-9c89aa086792',97.00,'Mostrador',NULL,'Angel',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 15:38:19','2025-12-02 15:41:39','2025-12-02 15:41:54','2025-12-02 15:38:20','2025-12-02 22:42:28'),('961158fa-9e3a-446d-8099-0ebd2cbd4967',25.00,'Mostrador',NULL,'Mike',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 16:22:58','2025-12-02 16:23:11','2025-12-02 16:23:15','2025-12-02 16:22:58','2025-12-02 22:42:35'),('9a674cbe-ae1b-41c4-b452-d71e614ffaac',195.00,'App Cliente',NULL,'cliente4',0,'38970329-20c1-4223-b54e-5e96de76be9c','2025-12-04 06:51:01',NULL,NULL,'2025-12-04 06:51:01','2025-12-04 06:51:01'),('9ab08d90-cf17-11f0-9b60-fbbec5a1d64f',150.00,'Mesa','Todo bien','Cliente Mayo',3,'0d61ca6b-ced6-11f0-95a1-eb768d624531','2025-05-15 20:30:00',NULL,NULL,'2025-05-15 20:30:00','2025-12-02 00:41:13'),('9ab140e3-cf17-11f0-9b60-fbbec5a1d64f',250.00,'Mostrador','Para llevar','Cliente Junio',3,'0d61ca6b-ced6-11f0-95a1-eb768d624531','2025-06-21 01:00:00',NULL,NULL,'2025-06-21 01:00:00','2025-12-02 00:41:13'),('9ab1d989-cf17-11f0-9b60-fbbec5a1d64f',500.00,'Mesa','Fiesta','Cliente Agosto 1',3,'0d61ca6b-ced6-11f0-95a1-eb768d624531','2025-08-11 02:00:00',NULL,NULL,'2025-08-11 02:00:00','2025-12-02 00:41:13'),('9ab31a23-cf17-11f0-9b60-fbbec5a1d64f',350.00,'Delivery','Rápido','Cliente Agosto 2',3,'0d61ca6b-ced6-11f0-95a1-eb768d624531','2025-08-16 03:00:00',NULL,NULL,'2025-08-16 03:00:00','2025-12-02 00:41:13'),('9ab3ee9a-cf17-11f0-9b60-fbbec5a1d64f',100.00,'Mesa','Lunch','Migue',3,'0d61ca6b-ced6-11f0-95a1-eb768d624531','2025-12-02 00:41:13',NULL,NULL,'2025-12-02 00:41:13','2025-12-02 00:41:13'),('b115b18a-c233-4168-9597-223652e8a51c',85.00,'App Cliente',NULL,'cliente2',1,'7401f3fd-595f-4c11-a96a-391cfe677603','2025-12-04 02:32:48','2025-12-04 02:33:30',NULL,'2025-12-04 02:32:48','2025-12-04 02:33:30'),('c0b172de-aa27-4639-9158-7f1d2a3f3bf9',192.00,'Mostrador',NULL,'Luz',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 05:36:58','2025-12-02 06:05:50','2025-12-02 06:05:52','2025-12-02 05:36:58','2025-12-02 22:42:29'),('c74858a2-7930-402e-8980-c0b57323ea08',408.00,'Mostrador',NULL,'Alma',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 22:39:19','2025-12-02 22:40:08','2025-12-02 22:40:09','2025-12-02 22:39:19','2025-12-02 22:42:24'),('c7da1457-4a89-44d2-9293-6fa17683b96a',362.00,'Mostrador',NULL,'Angelin',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 16:11:44','2025-12-02 22:39:58','2025-12-02 22:40:00','2025-12-02 16:11:44','2025-12-02 22:42:32'),('d106f8f6-a64b-4c54-9835-b4dee7cc744d',95.00,'App Cliente',NULL,'cliente3',1,'331585e8-e62f-46c8-8433-e5cf6983f388','2025-12-04 02:35:20','2025-12-04 05:46:26',NULL,'2025-12-04 02:35:20','2025-12-04 05:46:26'),('d2814eb0-cd0d-461a-8abb-6fbade177b04',115.00,'Mostrador',NULL,'Mik3',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 16:24:16','2025-12-02 22:40:02','2025-12-02 22:40:04','2025-12-02 16:24:16','2025-12-02 22:42:33'),('d8d00b33-bd50-42fd-b595-1148bdb13796',15.00,'Mostrador',NULL,'Luz',3,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 05:35:29','2025-12-02 15:33:48','2025-12-02 15:37:21','2025-12-02 05:35:29','2025-12-02 16:08:22'),('e29a5034-7730-4f5b-91b6-06bc3472e6c2',85.00,'App Cliente',NULL,'cliente4',1,'38970329-20c1-4223-b54e-5e96de76be9c','2025-12-04 02:35:44','2025-12-04 05:22:39',NULL,'2025-12-04 02:35:44','2025-12-04 05:22:39'),('f35cd398-8bf6-47d7-9748-f7c777eff532',103.00,'App Cliente',NULL,'cliente2',2,'7401f3fd-595f-4c11-a96a-391cfe677603','2025-12-03 05:19:05','2025-12-03 05:19:26','2025-12-03 05:57:30','2025-12-03 05:19:05','2025-12-03 05:57:30'),('f8d3cfdc-93b8-4a78-ab85-55e2b8e95131',103.00,'Mostrador',NULL,'Miguelon',1,'0d61cd9c-ced6-11f0-95a1-eb768d624531','2025-12-02 15:37:12','2025-12-02 15:38:33',NULL,'2025-12-02 15:37:12','2025-12-02 15:38:33');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `idorderdetail` varchar(36) NOT NULL,
  `order_idorder` varchar(36) NOT NULL,
  `products_idproducts` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `order_type` varchar(50) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  PRIMARY KEY (`idorderdetail`),
  KEY `products_idproducts` (`products_idproducts`),
  KEY `idx_order` (`order_idorder`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_idorder`) REFERENCES `order` (`idorder`) ON DELETE CASCADE,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`products_idproducts`) REFERENCES `products` (`idproducts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES ('00df96a9-c727-4e8e-b415-ba29f06e1fd7','0dcbf847-977c-4b95-ad0e-99c02cfcf8bb','0d500185-ced6-11f0-95a1-eb768d624531','BBQ',1,90.00,'1',NULL),('0638a0ad-e3e3-4101-b79d-dd397a4984b1','45b20fcb-d2cc-4c04-bb3f-09ea19e824fd','0d500103-ced6-11f0-95a1-eb768d624531','Aloha',1,95.00,'1',NULL),('0a82087d-4e27-4507-8ef3-a20ac19fc837','f35cd398-8bf6-47d7-9748-f7c777eff532','0d500103-ced6-11f0-95a1-eb768d624531','Aloha',1,95.00,'0','carne bien jugosa'),('1b1a2127-3b71-4197-8c88-3b6d95c877a3','9060b1d5-60c0-4d42-a6ea-9c89aa086792','0d4ffdf3-ced6-11f0-95a1-eb768d624531','Agridulce',1,85.00,'1','Carne bien cocida'),('23b68551-4ad1-49aa-a2aa-5f9ba6de4ec7','5785f333-d2a6-48e8-92f9-d26e7b0754da','0d500260-ced6-11f0-95a1-eb768d624531','Búfalo',1,90.00,'0',NULL),('3350117d-3aaa-4d6e-8d67-1a771d3ecd55','e29a5034-7730-4f5b-91b6-06bc3472e6c2','0d5167a5-ced6-11f0-95a1-eb768d624531','Alitas BBQ',1,85.00,'0',NULL),('38229173-975f-401e-94f2-1ba10bdb261d','d2814eb0-cd0d-461a-8abb-6fbade177b04','0d52acb3-ced6-11f0-95a1-eb768d624531','Agua',1,15.00,'0','EN VASO'),('43807128-d692-4971-a3c1-fafb8f550c7b','c74858a2-7930-402e-8980-c0b57323ea08','0d516b9d-ced6-11f0-95a1-eb768d624531','Alitas Mango Habanero',1,90.00,'0',NULL),('4aedc9b8-a73f-473b-933a-c65cdaae1a7f','c74858a2-7930-402e-8980-c0b57323ea08','adcdc96d-cf30-11f0-9b60-fbbec5a1d64f','Hot dog',1,45.00,'1','sin cebolla'),('52127b73-28a9-46ee-8cfb-fd1bc9ddaa02','c74858a2-7930-402e-8980-c0b57323ea08','0d5003fa-ced6-11f0-95a1-eb768d624531','Honolulu',1,95.00,'1',NULL),('54f04975-57ca-4a65-9239-5733c5597f2b','1e793f22-a892-4e02-bfa1-784ed9885a20','0d4ffdf3-ced6-11f0-95a1-eb768d624531','Agridulce',1,85.00,'1','con sal extra'),('56317ca6-82ed-46ae-89bb-87e9c34eb824','c7da1457-4a89-44d2-9293-6fa17683b96a','0d516b9d-ced6-11f0-95a1-eb768d624531','Alitas Mango Habanero',1,90.00,'1',NULL),('5b9ddaf6-8652-4e9d-8332-f96b96af3cb2','9a674cbe-ae1b-41c4-b452-d71e614ffaac','0d5001f9-ced6-11f0-95a1-eb768d624531','BBQ Habanero',1,95.00,'0',NULL),('5f5f47b1-a973-403e-89d9-94bc58881ffa','5f0f5e94-ff5d-458d-aabe-cb4606ad686f','0d500185-ced6-11f0-95a1-eb768d624531','BBQ',1,90.00,'1',NULL),('6ecff03b-134b-4708-9d70-86db797c0c33','c0b172de-aa27-4639-9158-7f1d2a3f3bf9','0d5167a5-ced6-11f0-95a1-eb768d624531','Alitas BBQ',1,85.00,'1',NULL),('7025fb93-df6a-48e4-a1b4-1fe7b425f5cf','d8d00b33-bd50-42fd-b595-1148bdb13796','0d52acb3-ced6-11f0-95a1-eb768d624531','Agua',1,15.00,'0','con hielo'),('730ed419-bf8a-45bc-aed3-736f9b3ede9b','c74858a2-7930-402e-8980-c0b57323ea08','0d5002e3-ced6-11f0-95a1-eb768d624531','Chimichurri',1,85.00,'1',NULL),('7547bb94-2a53-4427-866f-8410506022dd','b115b18a-c233-4168-9597-223652e8a51c','0d4ffdf3-ced6-11f0-95a1-eb768d624531','Agridulce',1,85.00,'0',NULL),('76a6e8f7-97b0-4cf9-84b2-f870b6bd92fe','f8d3cfdc-93b8-4a78-ab85-55e2b8e95131','0d500103-ced6-11f0-95a1-eb768d624531','Aloha',1,95.00,'0',NULL),('779f1266-f297-4f99-98da-a8a99d9331a4','3da20252-c000-425c-9b47-365606201a2e','0d52acb3-ced6-11f0-95a1-eb768d624531','Agua',1,15.00,'0',NULL),('77a629aa-9624-4b1b-a193-1baa318e71e8','c7da1457-4a89-44d2-9293-6fa17683b96a','0d500461-ced6-11f0-95a1-eb768d624531','Mango Chipotle',1,90.00,'1',NULL),('79100bd2-dde2-4009-98fe-72c27758ca69','9a674cbe-ae1b-41c4-b452-d71e614ffaac','0d4ffdf3-ced6-11f0-95a1-eb768d624531','Agridulce',1,85.00,'0',NULL),('7afd5322-80e0-480e-a6e5-1fc95b324ec4','961158fa-9e3a-446d-8099-0ebd2cbd4967','0d52ac7c-ced6-11f0-95a1-eb768d624531','Refresco',1,25.00,'0','con hielo'),('816a2690-5c79-41af-a7f8-6f488381fef3','012de947-9cb4-47a4-bc89-7c5dd28dc619','0d4ffdf3-ced6-11f0-95a1-eb768d624531','Agridulce',1,85.00,'0','carne jugosa\n'),('85aeb63b-38af-42ac-a990-efe754857653','5f63c2ab-ef83-4ddb-a1c7-5dcce23f9f93','0d50042d-ced6-11f0-95a1-eb768d624531','Honolulu picante',1,100.00,'0',NULL),('8a1be825-0025-47cc-bf99-d8efc96d98d1','3dd2c2a3-a834-4085-9021-f72f0cc6b16b','0d4ffdf3-ced6-11f0-95a1-eb768d624531','Agridulce',1,85.00,'1',NULL),('90c9abdc-d069-459a-b7c2-0e78f49e6c65','c7da1457-4a89-44d2-9293-6fa17683b96a','0d50042d-ced6-11f0-95a1-eb768d624531','Honolulu picante',1,100.00,'1',NULL),('9ab4c5f0-cf17-11f0-9b60-fbbec5a1d64f','9ab08d90-cf17-11f0-9b60-fbbec5a1d64f','0d50032a-ced6-11f0-95a1-eb768d624531','Clásica',2,75.00,'Cocina',NULL),('9ab55ddf-cf17-11f0-9b60-fbbec5a1d64f','9ab140e3-cf17-11f0-9b60-fbbec5a1d64f','0d50035d-ced6-11f0-95a1-eb768d624531','Hawaina',2,95.00,'Cocina',NULL),('9ab56252-cf17-11f0-9b60-fbbec5a1d64f','9ab140e3-cf17-11f0-9b60-fbbec5a1d64f','0d52ac7c-ced6-11f0-95a1-eb768d624531','Refresco',2,25.00,'Barra',NULL),('9ab61ef9-cf17-11f0-9b60-fbbec5a1d64f','9ab1d989-cf17-11f0-9b60-fbbec5a1d64f','0d500185-ced6-11f0-95a1-eb768d624531','BBQ',4,90.00,'Cocina',NULL),('9ab6221d-cf17-11f0-9b60-fbbec5a1d64f','9ab1d989-cf17-11f0-9b60-fbbec5a1d64f','0d52abc6-ced6-11f0-95a1-eb768d624531','Orden de papas',4,35.00,'Cocina',NULL),('9b6e0ff1-4582-416a-8f4d-747e34793bda','c0b172de-aa27-4639-9158-7f1d2a3f3bf9','0d5003fa-ced6-11f0-95a1-eb768d624531','Honolulu',1,95.00,'1',NULL),('a99466e4-bfc8-4640-a389-800958980bd3','061626f4-22b3-4f42-b924-e30ba617d78e','0d500185-ced6-11f0-95a1-eb768d624531','BBQ',1,90.00,'1',NULL),('bfbfc0ed-0caa-4079-9e08-b8cdd1ec2ef0','4a561424-642d-4602-aa7e-fdb38d64289f','0d52ac11-ced6-11f0-95a1-eb768d624531','Orden de salchipapas',1,55.00,'0',NULL),('cc2f176e-7bce-4d95-9ce8-a2d66913186a','c7da1457-4a89-44d2-9293-6fa17683b96a','0d52ac11-ced6-11f0-95a1-eb768d624531','Orden de salchipapas',1,55.00,'1',NULL),('d5ec9261-22de-4bfc-82ec-56e46069a385','d2814eb0-cd0d-461a-8abb-6fbade177b04','0d500260-ced6-11f0-95a1-eb768d624531','Búfalo',1,90.00,'1',NULL),('dc3dae58-dffc-4bb7-a9d5-3be896ebc506','d106f8f6-a64b-4c54-9835-b4dee7cc744d','0d5001f9-ced6-11f0-95a1-eb768d624531','BBQ Habanero',1,95.00,'0',NULL),('eff20705-a17a-4847-af2a-13a3b494e6ff','c7da1457-4a89-44d2-9293-6fa17683b96a','0d52acb3-ced6-11f0-95a1-eb768d624531','Agua',1,15.00,'1','Agua con hielo '),('f96e39da-2cd8-4e6e-a4b3-e2b23825ac88','c74858a2-7930-402e-8980-c0b57323ea08','0d5167a5-ced6-11f0-95a1-eb768d624531','Alitas BBQ',1,85.00,'0',NULL),('fdd7fac7-58e5-48e2-a8a4-f05edefbd7f7','188d9772-41ed-47db-814f-10c16dead50e','0d5002e3-ced6-11f0-95a1-eb768d624531','Chimichurri',1,85.00,'1',NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details_ingredients`
--

DROP TABLE IF EXISTS `order_details_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details_ingredients` (
  `idorder_details_ingredients` varchar(36) NOT NULL,
  `order_details_idorderdetail` varchar(36) NOT NULL,
  `ingredients_idingredients` varchar(36) NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0=Excepción (sin), 1=Extra (con)',
  `price` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`idorder_details_ingredients`),
  KEY `order_details_idorderdetail` (`order_details_idorderdetail`),
  KEY `ingredients_idingredients` (`ingredients_idingredients`),
  CONSTRAINT `order_details_ingredients_ibfk_1` FOREIGN KEY (`order_details_idorderdetail`) REFERENCES `order_details` (`idorderdetail`) ON DELETE CASCADE,
  CONSTRAINT `order_details_ingredients_ibfk_2` FOREIGN KEY (`ingredients_idingredients`) REFERENCES `ingredients` (`idingredients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details_ingredients`
--

LOCK TABLES `order_details_ingredients` WRITE;
/*!40000 ALTER TABLE `order_details_ingredients` DISABLE KEYS */;
INSERT INTO `order_details_ingredients` VALUES ('0097f4ae-43f8-45c3-a417-024152b88f5e','85aeb63b-38af-42ac-a990-efe754857653','0d4e26ee-ced6-11f0-95a1-eb768d624531',0,0.00),('2623bb58-c824-4fce-b3cc-e123a419f35f','5b9ddaf6-8652-4e9d-8332-f96b96af3cb2','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1,0.00),('286c8fa2-b820-46c2-863b-450caae275f8','52127b73-28a9-46ee-8cfb-fd1bc9ddaa02','0d4e2766-ced6-11f0-95a1-eb768d624531',1,0.00),('2d61750b-901b-405d-a989-c9b5049c0dbc','1b1a2127-3b71-4197-8c88-3b6d95c877a3','0d4e26ee-ced6-11f0-95a1-eb768d624531',1,0.00),('35f05fe3-9182-49ed-ba57-b535ff020723','0638a0ad-e3e3-4101-b79d-dd397a4984b1','0d4e2766-ced6-11f0-95a1-eb768d624531',0,0.00),('38d04f73-be75-464b-ac91-40156db6380c','00df96a9-c727-4e8e-b415-ba29f06e1fd7','0d4e26ee-ced6-11f0-95a1-eb768d624531',1,0.00),('3a181090-63c8-4f19-b57a-710a7ecfd28c','d5ec9261-22de-4bfc-82ec-56e46069a385','0d4e26ee-ced6-11f0-95a1-eb768d624531',0,0.00),('44b860e8-33d7-4a84-a70c-fee37bf343d9','d5ec9261-22de-4bfc-82ec-56e46069a385','0d4e26a2-ced6-11f0-95a1-eb768d624531',1,0.00),('54cf98da-e783-4645-9e1a-722128c8e857','5f5f47b1-a973-403e-89d9-94bc58881ffa','0d4e26ee-ced6-11f0-95a1-eb768d624531',1,0.00),('5debfe9d-8c71-478b-b541-f3c5654df2a5','816a2690-5c79-41af-a7f8-6f488381fef3','0d4e2766-ced6-11f0-95a1-eb768d624531',1,0.00),('663f52f2-3cbc-4f09-86b8-b8d3c9588276','54f04975-57ca-4a65-9239-5733c5597f2b','0d4e23c7-ced6-11f0-95a1-eb768d624531',1,0.00),('7e8a2cc2-5625-49cf-ae0a-2a42f6cdf455','730ed419-bf8a-45bc-aed3-736f9b3ede9b','0d4e26ee-ced6-11f0-95a1-eb768d624531',0,0.00),('82397759-b747-44ec-bf14-27836a5799bf','8a1be825-0025-47cc-bf99-d8efc96d98d1','0d4e26ee-ced6-11f0-95a1-eb768d624531',1,0.00),('95d5e0a9-fec4-47c1-ab3e-a6564e44e5b3','0638a0ad-e3e3-4101-b79d-dd397a4984b1','0d4e26ee-ced6-11f0-95a1-eb768d624531',1,0.00),('bb8482ee-d65c-464d-a30a-ef4f6cb7e4e8','76a6e8f7-97b0-4cf9-84b2-f870b6bd92fe','0d4e2766-ced6-11f0-95a1-eb768d624531',1,0.00),('c2f8b5ad-39cf-417d-ac75-7b691df77226','fdd7fac7-58e5-48e2-a8a4-f05edefbd7f7','0d4e26ee-ced6-11f0-95a1-eb768d624531',1,0.00),('c7563412-ed6d-4f38-8d2e-0ec67e7e68b1','77a629aa-9624-4b1b-a193-1baa318e71e8','0d4e26ee-ced6-11f0-95a1-eb768d624531',1,0.00),('d0108bb0-8451-4893-8879-82a98824ae7c','77a629aa-9624-4b1b-a193-1baa318e71e8','0d4e2766-ced6-11f0-95a1-eb768d624531',0,0.00),('d2075395-ec1c-4bee-9017-e48b84fc8b08','85aeb63b-38af-42ac-a990-efe754857653','0d4cf606-ced6-11f0-95a1-eb768d624531',0,0.00),('dcd4889b-1e55-4235-8fc4-1a005400c00e','a99466e4-bfc8-4640-a389-800958980bd3','0d4e26a2-ced6-11f0-95a1-eb768d624531',1,0.00),('e1a25110-b522-427a-af7a-49f410aa3774','79100bd2-dde2-4009-98fe-72c27758ca69','0d4cf683-ced6-11f0-95a1-eb768d624531',0,0.00),('e2250278-92bf-4106-bf02-55af55e8f1ab','76a6e8f7-97b0-4cf9-84b2-f870b6bd92fe','0d4e26a2-ced6-11f0-95a1-eb768d624531',0,0.00),('e598c1b8-04ee-4fa2-8ba5-2d675a105e3a','a99466e4-bfc8-4640-a389-800958980bd3','0d4e23c7-ced6-11f0-95a1-eb768d624531',0,0.00),('e78de6bd-906a-4d1f-ba23-6f5366df1314','23b68551-4ad1-49aa-a2aa-5f9ba6de4ec7','0d4cf606-ced6-11f0-95a1-eb768d624531',0,0.00),('ebb08170-8a3a-4e95-9fca-be67eae30355','79100bd2-dde2-4009-98fe-72c27758ca69','0d4e23c7-ced6-11f0-95a1-eb768d624531',1,0.00),('ecd5de4f-8bbd-40d1-993a-2b7a92b247e8','23b68551-4ad1-49aa-a2aa-5f9ba6de4ec7','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1,0.00),('f07dd164-8657-4a62-8d2f-8d201f8a7732','0a82087d-4e27-4507-8ef3-a20ac19fc837','0d4e2766-ced6-11f0-95a1-eb768d624531',1,0.00),('f42c0da8-1e70-4f64-8450-0f7dc4e7e94c','9b6e0ff1-4582-416a-8f4d-747e34793bda','0d4e26ee-ced6-11f0-95a1-eb768d624531',1,0.00),('f52a19a9-c23e-4350-bf99-46d5b2244db1','fdd7fac7-58e5-48e2-a8a4-f05edefbd7f7','0d4cf606-ced6-11f0-95a1-eb768d624531',0,0.00);
/*!40000 ALTER TABLE `order_details_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_history` (
  `idhistory` varchar(36) NOT NULL,
  `orders_idorder` varchar(36) NOT NULL,
  `users_idusers` varchar(36) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idhistory`),
  KEY `users_idusers` (`users_idusers`),
  KEY `idx_order_history` (`orders_idorder`),
  KEY `idx_changed_at` (`changed_at`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`orders_idorder`) REFERENCES `order` (`idorder`) ON DELETE CASCADE,
  CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idproducts` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_idcategory` varchar(36) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idproducts`),
  KEY `idx_category` (`category_idcategory`),
  KEY `idx_active` (`active`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('0d4ffdf3-ced6-11f0-95a1-eb768d624531','Agridulce',85.00,'Con salsa agridulce','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d500103-ced6-11f0-95a1-eb768d624531','Aloha',95.00,'Con salsa agridulce y piña','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d500185-ced6-11f0-95a1-eb768d624531','BBQ',90.00,'Con salsa BBQ','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d5001f9-ced6-11f0-95a1-eb768d624531','BBQ Habanero',95.00,'Con salsa BBQ habanero','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d500260-ced6-11f0-95a1-eb768d624531','Búfalo',90.00,'Con salsa búfalo','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d5002e3-ced6-11f0-95a1-eb768d624531','Chimichurri',85.00,'Con salsa chimichurri','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d50032a-ced6-11f0-95a1-eb768d624531','Clásica',75.00,'Con salsa catsup','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d50035d-ced6-11f0-95a1-eb768d624531','Hawaina',95.00,'Con salsa catsup y piña','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d500395-ced6-11f0-95a1-eb768d624531','Hawii',100.00,'Con salsa mango habanero y piña','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d5003c8-ced6-11f0-95a1-eb768d624531','Hawii Chipotle',105.00,'Con salsa mango chipotle y piña','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d5003fa-ced6-11f0-95a1-eb768d624531','Honolulu',95.00,'Con salsa BBQ y piña','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d50042d-ced6-11f0-95a1-eb768d624531','Honolulu picante',100.00,'Con salsa BBQ habanero y piña','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d500461-ced6-11f0-95a1-eb768d624531','Mango Chipotle',90.00,'Con salsa mango chipotle','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d500492-ced6-11f0-95a1-eb768d624531','Mango Habanero',90.00,'Con salsa mango habanero','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d5004c2-ced6-11f0-95a1-eb768d624531','Ohana',95.00,'Con salsa tamarindo chipotle y piña','Hamburguesa.png','da99cc44-03a0-457a-8711-4660c3b5b45b',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d5167a5-ced6-11f0-95a1-eb768d624531','Alitas BBQ',85.00,'5 piezas con salsa BBQ','Alitas.png','64afaea8-be6c-49ae-8e99-32132dd89630',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d516ad6-ced6-11f0-95a1-eb768d624531','Alitas Búfalo',85.00,'5 piezas con salsa búfalo','Alitas.png','64afaea8-be6c-49ae-8e99-32132dd89630',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d516b9d-ced6-11f0-95a1-eb768d624531','Alitas Mango Habanero',90.00,'5 piezas con salsa mango habanero','Alitas.png','64afaea8-be6c-49ae-8e99-32132dd89630',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d52a97f-ced6-11f0-95a1-eb768d624531','Nuggets de pollo',65.00,'Nuggets de pollo empanizados','Nuggets de pollo.png','4716bb4e-0793-4c76-9b48-3dd8e7a9ba9a',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d52abc6-ced6-11f0-95a1-eb768d624531','Orden de papas',35.00,'Papas a la francesa','Orden de papas.png','4716bb4e-0793-4c76-9b48-3dd8e7a9ba9a',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d52ac11-ced6-11f0-95a1-eb768d624531','Orden de salchipapas',55.00,'Papas con salchicha','Orden de salchipapas.png','4716bb4e-0793-4c76-9b48-3dd8e7a9ba9a',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d52ac47-ced6-11f0-95a1-eb768d624531','Banderilla',15.00,'Banderilla de salchicha','Banderilla.png','4716bb4e-0793-4c76-9b48-3dd8e7a9ba9a',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d52ac7c-ced6-11f0-95a1-eb768d624531','Refresco',25.00,'Refresco de 600ml','Refresco.png','4716bb4e-0793-4c76-9b48-3dd8e7a9ba9a',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('0d52acb3-ced6-11f0-95a1-eb768d624531','Agua',15.00,'Agua natural','Agua.png','4716bb4e-0793-4c76-9b48-3dd8e7a9ba9a',1,'2025-12-01 20:52:33','2025-12-01 20:52:33'),('adcdc96d-cf30-11f0-9b60-fbbec5a1d64f','Hot dog',45.00,'Clásico con jitomate y cebolla','Hot dog.png','4716bb4e-0793-4c76-9b48-3dd8e7a9ba9a',1,'2025-12-02 04:32:10','2025-12-02 04:32:10');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_ingredients`
--

DROP TABLE IF EXISTS `products_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_ingredients` (
  `idproduct_ingredient` varchar(36) NOT NULL,
  `products_idproducts` varchar(36) NOT NULL,
  `ingredients_idingredients` varchar(36) NOT NULL,
  `quantity` decimal(10,2) NOT NULL DEFAULT 1.00,
  PRIMARY KEY (`idproduct_ingredient`),
  UNIQUE KEY `unique_product_ingredient` (`products_idproducts`,`ingredients_idingredients`),
  KEY `ingredients_idingredients` (`ingredients_idingredients`),
  CONSTRAINT `products_ingredients_ibfk_1` FOREIGN KEY (`products_idproducts`) REFERENCES `products` (`idproducts`) ON DELETE CASCADE,
  CONSTRAINT `products_ingredients_ibfk_2` FOREIGN KEY (`ingredients_idingredients`) REFERENCES `ingredients` (`idingredients`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_ingredients`
--

LOCK TABLES `products_ingredients` WRITE;
/*!40000 ALTER TABLE `products_ingredients` DISABLE KEYS */;
INSERT INTO `products_ingredients` VALUES ('0d5464de-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d5467e8-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546871-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d5468e8-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546963-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d5469bd-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d5469f7-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546a31-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546a72-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546ab0-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546af2-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546b32-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546b70-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546bab-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d546be6-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4cf3d7-ced6-11f0-95a1-eb768d624531',1.00),('0d55a2fe-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55a5cb-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55a6be-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55a786-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55a847-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55a916-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55a9e4-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55aabc-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55ab8e-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55ac5d-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55ad36-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55adf7-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55aed2-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55afa2-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d55b081-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4cf5a0-ced6-11f0-95a1-eb768d624531',1.00),('0d56ab85-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56ae05-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56aec6-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56af63-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56affa-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b13c-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b213-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b2cd-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b35f-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b3f2-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b48c-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b51c-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b5af-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b63c-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d56b6cf-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4cf606-ced6-11f0-95a1-eb768d624531',1.00),('0d57b3ae-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57b609-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57b6c3-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57b773-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57b80e-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57b8a2-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57b935-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57b9d4-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57ba6e-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57bafe-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57bb97-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57bc30-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57bcca-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57bd5f-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d57bdee-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4cf622-ced6-11f0-95a1-eb768d624531',1.00),('0d587444-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d58761b-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d587676-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d5876c2-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d587714-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d58775a-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d5877a0-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d5877ea-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d587831-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d587873-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d5878c0-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d58790c-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d587959-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d58799d-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d5879e0-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4cf63d-ced6-11f0-95a1-eb768d624531',1.00),('0d5996c7-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599929-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d59997f-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d5999ce-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599a1e-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599a6b-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599ab6-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599b02-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599b4e-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599b98-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599be5-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599c29-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599c75-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599cc4-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d599d0b-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4cf656-ced6-11f0-95a1-eb768d624531',1.00),('0d5a3a7d-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a3d21-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a3dea-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a3e99-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a3f49-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a3fee-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a4097-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a4148-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a41f8-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a429b-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a4344-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a43de-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a4481-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a452d-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5a45d1-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4cf66e-ced6-11f0-95a1-eb768d624531',1.00),('0d5b735b-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5b75ec-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5b76a6-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5b7760-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5b7815-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5b78c2-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5b796d-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5b7a22-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5b7ad1-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5c947f-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5c955b-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5c95b2-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5c9608-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5c9660-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5c96af-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4e23c7-ced6-11f0-95a1-eb768d624531',1.00),('0d5d90a3-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d93da-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d94b9-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d9577-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d962d-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d96e5-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d979a-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d9857-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d9901-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d99b0-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d9a67-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d9b0c-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d9bc5-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d9c62-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5d9d11-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4e26a2-ced6-11f0-95a1-eb768d624531',1.00),('0d5e5552-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5e57f0-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5e5857-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5e58b9-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5e590c-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f7e72-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f8067-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f80ec-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f8169-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f81cc-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f822e-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f827e-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f8337-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f83c6-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d5f842b-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4e26ee-ced6-11f0-95a1-eb768d624531',1.00),('0d6082e1-ced6-11f0-95a1-eb768d624531','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608631-ced6-11f0-95a1-eb768d624531','0d500103-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608746-ced6-11f0-95a1-eb768d624531','0d500185-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d60883c-ced6-11f0-95a1-eb768d624531','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d60891c-ced6-11f0-95a1-eb768d624531','0d500260-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608a08-ced6-11f0-95a1-eb768d624531','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608b00-ced6-11f0-95a1-eb768d624531','0d50032a-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608bfc-ced6-11f0-95a1-eb768d624531','0d50035d-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608cba-ced6-11f0-95a1-eb768d624531','0d500395-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608d1a-ced6-11f0-95a1-eb768d624531','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608d80-ced6-11f0-95a1-eb768d624531','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608ded-ced6-11f0-95a1-eb768d624531','0d50042d-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608e5b-ced6-11f0-95a1-eb768d624531','0d500461-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608ec2-ced6-11f0-95a1-eb768d624531','0d500492-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('0d608f2c-ced6-11f0-95a1-eb768d624531','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4e2766-ced6-11f0-95a1-eb768d624531',1.00),('7a473fd0-d0c0-11f0-957a-ea74853ea992','0d4ffdf3-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a4742eb-d0c0-11f0-957a-ea74853ea992','0d500103-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a47436a-d0c0-11f0-957a-ea74853ea992','0d500185-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a4743de-d0c0-11f0-957a-ea74853ea992','0d5001f9-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a474457-d0c0-11f0-957a-ea74853ea992','0d500260-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a485758-d0c0-11f0-957a-ea74853ea992','0d5002e3-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a485867-d0c0-11f0-957a-ea74853ea992','0d50032a-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a4858e0-d0c0-11f0-957a-ea74853ea992','0d50035d-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a485968-d0c0-11f0-957a-ea74853ea992','0d500395-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a4859d8-d0c0-11f0-957a-ea74853ea992','0d5003c8-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a485a2f-d0c0-11f0-957a-ea74853ea992','0d5003fa-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a485a7d-d0c0-11f0-957a-ea74853ea992','0d50042d-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a485acf-d0c0-11f0-957a-ea74853ea992','0d500461-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a485b1d-d0c0-11f0-957a-ea74853ea992','0d500492-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00),('7a485bb5-d0c0-11f0-957a-ea74853ea992','0d5004c2-ced6-11f0-95a1-eb768d624531','0d4cf683-ced6-11f0-95a1-eb768d624531',1.00);
/*!40000 ALTER TABLE `products_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `rol` int(11) NOT NULL COMMENT '1=Admin, 2=Chef, 3=Mesero',
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `actual_order` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_rol` (`rol`),
  KEY `idx_name` (`name`),
  KEY `fk_users_actual_order` (`actual_order`),
  CONSTRAINT `fk_users_actual_order` FOREIGN KEY (`actual_order`) REFERENCES `order` (`idorder`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0d61ca6b-ced6-11f0-95a1-eb768d624531','admin','$2b$10$k.nIwe9./STxgAQXsBswm.bOVWMYva8aX9mL6JnhBxJW.AkAiFVFu','4421234567',1,1,'2025-12-01 20:52:33','2025-12-02 22:41:18',NULL),('0d61ccd2-ced6-11f0-95a1-eb768d624531','chef1','$2b$10$k.nIwe9./STxgAQXsBswm.bOVWMYva8aX9mL6JnhBxJW.AkAiFVFu','4421234568',2,1,'2025-12-01 20:52:33','2025-12-04 06:44:43',NULL),('0d61cd9c-ced6-11f0-95a1-eb768d624531','mesero1','$2b$10$k.nIwe9./STxgAQXsBswm.bOVWMYva8aX9mL6JnhBxJW.AkAiFVFu','4421234569',3,1,'2025-12-01 20:52:33','2025-12-02 02:39:10',NULL),('331585e8-e62f-46c8-8433-e5cf6983f388','cliente3','$2b$08$43XplJOPLZs4H2B.Xj6g2.X/gn7kFEP9FWlxf/uGeWSwrUGFYFBIm','4151248879',4,1,'2025-12-04 02:35:11','2025-12-04 02:35:11',NULL),('38970329-20c1-4223-b54e-5e96de76be9c','cliente4','$2b$08$o2vs3w44RATnJDpJXbYzOe63LbQlkHn2ahi7u3/GpgDeo2s6Fupz2','4151034887',4,1,'2025-12-04 02:35:36','2025-12-04 02:35:36',NULL),('7401f3fd-595f-4c11-a96a-391cfe677603','cliente2','$2b$08$w7NA6OoP.4borJtucLtFp.ebme8jYGFHSwBXE8AumZjKM.ktPov6W','4151024889',4,1,'2025-12-03 05:01:26','2025-12-03 05:51:48',NULL),('8511fc6f-fc19-4b5c-8128-54de632998fb','cliente','$2b$08$locbpAwXXAIvDNxLp9JrvuMo3ytnrM2BsJyGgAFhHRF57/EB2wCzO','4151024887',4,1,'2025-12-03 04:59:01','2025-12-03 04:59:01',NULL),('9823f679-9dda-49ae-bb1a-9b7af74a34b6','cliente5','$2b$08$iGfOEhxmkwtz8KqS8sAgDuF9bgtQLNhb/RzmXshBHskidjVrfQxUm','4151024890',4,1,'2025-12-04 06:45:32','2025-12-04 06:45:32',NULL),('e7af3f10-cf20-11f0-9b60-fbbec5a1d64f','cajero1','$2b$10$k.nIwe9./STxgAQXsBswm.bOVWMYva8aX9mL6JnhBxJW.AkAiFVFu','4421234569',3,1,'2025-12-02 02:39:15','2025-12-02 02:39:15',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-04 22:06:12
migue@migue-zorin:~$ 

