-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: garden_service
-- ------------------------------------------------------
-- Server version	8.0.36-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `garden_service`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `garden_service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `garden_service`;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES ('79a02d98-711d-4236-a8a1-e8dcc11d7430',NULL),('d13df209-6473-458b-bc9b-d4c9f47d13fd',NULL);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_rows`
--

DROP TABLE IF EXISTS `bed_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed_rows` (
  `bed_id` varchar(36) NOT NULL,
  `rows_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_syqxvmmyj1f6ff9oa4xqf5e3m` (`rows_id`),
  KEY `FKds1a3drg7nnhde8x3007u1y0f` (`bed_id`),
  CONSTRAINT `FKds1a3drg7nnhde8x3007u1y0f` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`id`),
  CONSTRAINT `FKp2d36uxv45b600ijrliif3wu` FOREIGN KEY (`rows_id`) REFERENCES `layout_row` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_rows`
--

LOCK TABLES `bed_rows` WRITE;
/*!40000 ALTER TABLE `bed_rows` DISABLE KEYS */;
INSERT INTO `bed_rows` VALUES ('79a02d98-711d-4236-a8a1-e8dcc11d7430','55965a61-a0ad-4e28-b82b-52bd480bc43c'),('79a02d98-711d-4236-a8a1-e8dcc11d7430','ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1'),('d13df209-6473-458b-bc9b-d4c9f47d13fd','0f113718-038d-4a51-83a9-9d0b393f0688'),('d13df209-6473-458b-bc9b-d4c9f47d13fd','74c8d099-14ad-4094-a1c5-2cc15ee96087');
/*!40000 ALTER TABLE `bed_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garden`
--

DROP TABLE IF EXISTS `garden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garden` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `season` enum('SUMMER','AUTUMN','WINTER','SPRING') DEFAULT NULL,
  `year` int DEFAULT NULL,
  `layout_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe02q3lkdac07anlb4abjt1lnx` (`layout_id`),
  CONSTRAINT `FKe02q3lkdac07anlb4abjt1lnx` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garden`
--

LOCK TABLES `garden` WRITE;
/*!40000 ALTER TABLE `garden` DISABLE KEYS */;
INSERT INTO `garden` VALUES ('844f6131-5d36-4c00-b802-27341911a2e1',NULL,'WINTER',2025,'4ac54954-f545-47d0-b892-226f79dc4015');
/*!40000 ALTER TABLE `garden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garden_section_groups`
--

DROP TABLE IF EXISTS `garden_section_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garden_section_groups` (
  `garden_id` varchar(36) NOT NULL,
  `section_groups_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_12gv3gkjoh1snfigcld6459nu` (`section_groups_id`),
  KEY `FK1kx8gdaeeejjkhf8pw98hixnd` (`garden_id`),
  CONSTRAINT `FK1kx8gdaeeejjkhf8pw98hixnd` FOREIGN KEY (`garden_id`) REFERENCES `garden` (`id`),
  CONSTRAINT `FKqb8ljyrpxqf45xptt4l1qipn0` FOREIGN KEY (`section_groups_id`) REFERENCES `section_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garden_section_groups`
--

LOCK TABLES `garden_section_groups` WRITE;
/*!40000 ALTER TABLE `garden_section_groups` DISABLE KEYS */;
INSERT INTO `garden_section_groups` VALUES ('844f6131-5d36-4c00-b802-27341911a2e1','036c3b99-508f-4fe9-8207-4c852bdf0b09'),('844f6131-5d36-4c00-b802-27341911a2e1','3e3f5655-f668-402e-95db-78dffe990010'),('844f6131-5d36-4c00-b802-27341911a2e1','4506061c-fd84-42bf-94e5-269c1a4ae9da'),('844f6131-5d36-4c00-b802-27341911a2e1','aa6b4da8-a3ba-4a00-bad9-d8292b0f6831'),('844f6131-5d36-4c00-b802-27341911a2e1','b1fd8b1d-a829-490e-8b32-f60d3b6de103');
/*!40000 ALTER TABLE `garden_section_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garden_section_states`
--

DROP TABLE IF EXISTS `garden_section_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garden_section_states` (
  `garden_id` varchar(36) NOT NULL,
  `section_states_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_5qi9kclfnjh8tp4wqe0doxqah` (`section_states_id`),
  KEY `FKo8gmlcvd2lhr0mkchcnv4ypeb` (`garden_id`),
  CONSTRAINT `FKdfv2pwqpjme1hpjp975nj21ac` FOREIGN KEY (`section_states_id`) REFERENCES `section_state` (`id`),
  CONSTRAINT `FKo8gmlcvd2lhr0mkchcnv4ypeb` FOREIGN KEY (`garden_id`) REFERENCES `garden` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garden_section_states`
--

LOCK TABLES `garden_section_states` WRITE;
/*!40000 ALTER TABLE `garden_section_states` DISABLE KEYS */;
INSERT INTO `garden_section_states` VALUES ('844f6131-5d36-4c00-b802-27341911a2e1','106cb3de-8e99-4c0a-ae9f-997a4c96783d'),('844f6131-5d36-4c00-b802-27341911a2e1','130625cb-ea69-4415-a970-161cb28c03f7'),('844f6131-5d36-4c00-b802-27341911a2e1','14b35a60-f7a3-4427-87ef-e38ba7e2216f'),('844f6131-5d36-4c00-b802-27341911a2e1','169ca3dc-fbbf-4b86-812e-2420cfa85238'),('844f6131-5d36-4c00-b802-27341911a2e1','1bbabb76-26bd-4512-b895-a5232b2e9f49'),('844f6131-5d36-4c00-b802-27341911a2e1','270f0fae-7ada-4727-9930-a44a001cde96'),('844f6131-5d36-4c00-b802-27341911a2e1','28c222c8-7bcf-4a27-8d55-eaa2149a5f41'),('844f6131-5d36-4c00-b802-27341911a2e1','2960b904-57f0-4bec-a0a1-bb06aa595e95'),('844f6131-5d36-4c00-b802-27341911a2e1','2bb49b26-0036-4d7e-a208-49c0a23748af'),('844f6131-5d36-4c00-b802-27341911a2e1','2c639274-0615-46af-9285-4e3d177fed3f'),('844f6131-5d36-4c00-b802-27341911a2e1','34c0e1ba-356d-4742-ab84-731e0d9344b8'),('844f6131-5d36-4c00-b802-27341911a2e1','462e464c-8eae-446a-8ed1-5181fb8a4b12'),('844f6131-5d36-4c00-b802-27341911a2e1','4752a812-64c2-463f-b29b-673785c4d731'),('844f6131-5d36-4c00-b802-27341911a2e1','50ecfdd8-a1bc-4a95-b2d2-c56163cc544e'),('844f6131-5d36-4c00-b802-27341911a2e1','51997032-7eff-49a5-baa8-6c79932befc3'),('844f6131-5d36-4c00-b802-27341911a2e1','5b000385-95ab-46f1-9d6f-301a50cb15c4'),('844f6131-5d36-4c00-b802-27341911a2e1','60c60667-43f1-4acc-a919-ec129f4644c0'),('844f6131-5d36-4c00-b802-27341911a2e1','60e92b78-474a-4ee5-88af-fa9ce210211c'),('844f6131-5d36-4c00-b802-27341911a2e1','6d2e3931-ad1a-4c7f-9435-437bcf017245'),('844f6131-5d36-4c00-b802-27341911a2e1','6f0c384a-c0cc-4ff4-9ad5-053d16f5637e'),('844f6131-5d36-4c00-b802-27341911a2e1','73623941-54a3-4e96-bce8-5955d66dfc48'),('844f6131-5d36-4c00-b802-27341911a2e1','77c8e9be-f073-48a9-b12a-8b90c1d95839'),('844f6131-5d36-4c00-b802-27341911a2e1','7b96a0ac-f63f-40c1-9d44-3970e9428b39'),('844f6131-5d36-4c00-b802-27341911a2e1','83c53161-d3ac-45d6-bec3-aa49fe3cedc3'),('844f6131-5d36-4c00-b802-27341911a2e1','8a81720b-5a9f-45e2-9761-2d2f90ea53de'),('844f6131-5d36-4c00-b802-27341911a2e1','9280f4a0-0b4e-41e8-8089-edcc4d74f1f9'),('844f6131-5d36-4c00-b802-27341911a2e1','9a446443-f77e-4ba6-ba7f-722a61c9426b'),('844f6131-5d36-4c00-b802-27341911a2e1','a0a3e2b8-1a6f-4972-9823-0f381942a666'),('844f6131-5d36-4c00-b802-27341911a2e1','a105a523-26d5-4abf-ac33-b5b13135b3cd'),('844f6131-5d36-4c00-b802-27341911a2e1','a8c119da-83bd-4d8e-a50d-c8f3fa8b0dd1'),('844f6131-5d36-4c00-b802-27341911a2e1','b214642e-f674-4f69-adc1-a741bfaac814'),('844f6131-5d36-4c00-b802-27341911a2e1','b968ef50-8cd3-433b-a39e-8e8f277b7e6f'),('844f6131-5d36-4c00-b802-27341911a2e1','ba5fb4e0-e5e5-450c-a3db-6d58e2ea0547'),('844f6131-5d36-4c00-b802-27341911a2e1','bf64258c-c9ce-46d2-ac5b-75271bb0335f'),('844f6131-5d36-4c00-b802-27341911a2e1','c30ae05c-01c9-4779-82fe-e2202669cc38'),('844f6131-5d36-4c00-b802-27341911a2e1','cfbb0c71-170b-4291-baef-7408810fa511'),('844f6131-5d36-4c00-b802-27341911a2e1','e1c5849c-d86c-4678-9c88-a3a4f41ec237'),('844f6131-5d36-4c00-b802-27341911a2e1','e533b85b-0e7d-41a1-bc90-a3c84432f2ba'),('844f6131-5d36-4c00-b802-27341911a2e1','ece88cd7-2eb2-45d8-84aa-c1d656bd2f7f'),('844f6131-5d36-4c00-b802-27341911a2e1','fb78348d-4006-4ae7-a27c-da77a682250d');
/*!40000 ALTER TABLE `garden_section_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout`
--

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
INSERT INTO `layout` VALUES ('4ac54954-f545-47d0-b892-226f79dc4015','Main');
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_beds`
--

DROP TABLE IF EXISTS `layout_beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout_beds` (
  `layout_id` varchar(36) NOT NULL,
  `beds_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_jcxhee7ehxs3htm7jwq7246fx` (`beds_id`),
  KEY `FKab3n6pw9jw1hq76cu7u3j0dnb` (`layout_id`),
  CONSTRAINT `FK56dwem5uurosi4lgignmdblx6` FOREIGN KEY (`beds_id`) REFERENCES `bed` (`id`),
  CONSTRAINT `FKab3n6pw9jw1hq76cu7u3j0dnb` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_beds`
--

LOCK TABLES `layout_beds` WRITE;
/*!40000 ALTER TABLE `layout_beds` DISABLE KEYS */;
INSERT INTO `layout_beds` VALUES ('4ac54954-f545-47d0-b892-226f79dc4015','79a02d98-711d-4236-a8a1-e8dcc11d7430'),('4ac54954-f545-47d0-b892-226f79dc4015','d13df209-6473-458b-bc9b-d4c9f47d13fd');
/*!40000 ALTER TABLE `layout_beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_row`
--

DROP TABLE IF EXISTS `layout_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout_row` (
  `id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_row`
--

LOCK TABLES `layout_row` WRITE;
/*!40000 ALTER TABLE `layout_row` DISABLE KEYS */;
INSERT INTO `layout_row` VALUES ('0f113718-038d-4a51-83a9-9d0b393f0688'),('55965a61-a0ad-4e28-b82b-52bd480bc43c'),('74c8d099-14ad-4094-a1c5-2cc15ee96087'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1');
/*!40000 ALTER TABLE `layout_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_row_sections`
--

DROP TABLE IF EXISTS `layout_row_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout_row_sections` (
  `layout_row_id` varchar(36) NOT NULL,
  `sections_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_3xob6hu1l3ihut7x4whkilx23` (`sections_id`),
  KEY `FK1gch2n6r5rnqf6xoqb0fjgyay` (`layout_row_id`),
  CONSTRAINT `FK1gch2n6r5rnqf6xoqb0fjgyay` FOREIGN KEY (`layout_row_id`) REFERENCES `layout_row` (`id`),
  CONSTRAINT `FKt4b3b98cokqduy6gp503g9ayv` FOREIGN KEY (`sections_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_row_sections`
--

LOCK TABLES `layout_row_sections` WRITE;
/*!40000 ALTER TABLE `layout_row_sections` DISABLE KEYS */;
INSERT INTO `layout_row_sections` VALUES ('0f113718-038d-4a51-83a9-9d0b393f0688','0d855e4c-86f7-4b8c-b066-bc06aff4cecf'),('0f113718-038d-4a51-83a9-9d0b393f0688','45c165fc-5c55-4ac9-a2a7-a74f2a186ebb'),('0f113718-038d-4a51-83a9-9d0b393f0688','5ae4b366-d1cb-4d04-a18e-0cc2c9e6c622'),('0f113718-038d-4a51-83a9-9d0b393f0688','7046d2b9-1cb8-46cc-a01c-d7e4641c14ca'),('0f113718-038d-4a51-83a9-9d0b393f0688','737cd987-21f8-4a97-b9d4-1190b797a296'),('0f113718-038d-4a51-83a9-9d0b393f0688','74fad96a-782e-4e56-a45f-aed997a3a689'),('0f113718-038d-4a51-83a9-9d0b393f0688','96eab2f0-33f3-4ea4-82b6-d11b24bc2920'),('0f113718-038d-4a51-83a9-9d0b393f0688','9d67566a-99db-464d-bc44-a9cb4d8d7f84'),('0f113718-038d-4a51-83a9-9d0b393f0688','c5cfaf18-b9cc-4e6c-97e7-449de777e3fa'),('0f113718-038d-4a51-83a9-9d0b393f0688','c6aed72f-c152-4f36-940b-dac3e62d8abc'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','1192b63d-64e9-44fa-bae5-a834b7faeb5a'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','3f90d8dc-0fc9-4386-939e-f4c437c054f5'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','628b6452-d406-45c0-902a-158900957b05'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','6af24ad8-c964-43f5-a4f8-d143a4495552'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','877c2d37-2b37-4a83-99c6-1f148658abfb'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','a7cdc5dd-c666-4d38-bed3-2754469248c6'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','da5bfbf6-97be-4abb-a40c-16472723e441'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','e5966eaf-c32a-45b6-b08d-699452bc54ac'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','f0bee40b-a1f8-46df-9ee5-6850457f9469'),('55965a61-a0ad-4e28-b82b-52bd480bc43c','fdf494b3-8e3d-49b6-b6ab-1d5ff45e20d5'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','06036915-1209-4d9c-8381-f968b5aeb015'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','06439f5c-ce26-48db-8c68-4d064a04fb28'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','1a5f606a-5cb1-4ec2-9109-a57be7f6ccfd'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','44304820-2943-4df4-b9c3-a4e5d566e101'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','7f832a0b-22d4-4308-9a95-f972087551d1'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','848f7467-79e2-45ee-a5c0-a66d400e0d8d'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','a2078db9-a970-443c-af40-4a2b2c2c84d2'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','edd618b3-84c5-4ab9-bfeb-ec1f865d3238'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','f5ff184b-cf05-404c-98c3-62e9409863c1'),('74c8d099-14ad-4094-a1c5-2cc15ee96087','fc631669-bd4d-4539-8e80-d517e876a633'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','2d79597d-be9d-4b46-a42c-c62e0a4d3afd'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','33553dd1-6080-495a-b58b-5b21fddda747'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','34bb5e6a-a89a-4a31-89d6-8ae2a8556b6d'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','542f8a57-58e0-47c6-9a36-08d0810bd15f'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','5a19d499-0184-4c89-8f83-9a8359fa4774'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','941522dd-3233-4f5c-89d3-d7721aa9a41c'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','aaf7cfdf-a1d5-4771-b677-d5df5f327e79'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','c9b043a5-daa8-4e00-a139-d14dc888f827'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','cc724619-0271-422b-ba1f-a58b8426de78'),('ee8fc9bb-a989-4ef6-b5cf-36fcc7a9b4b1','ee58b855-eb9a-4691-b6b5-ee7c2f0f243c');
/*!40000 ALTER TABLE `layout_row_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `month_hardiness_zone`
--

DROP TABLE IF EXISTS `month_hardiness_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `month_hardiness_zone` (
  `id` varchar(36) NOT NULL,
  `hardiness_zone` enum('TWELVE','ELEVEN','TEN','NINE_A','NINE_B') DEFAULT NULL,
  `month` enum('JANUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY','AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `month_hardiness_zone`
--

LOCK TABLES `month_hardiness_zone` WRITE;
/*!40000 ALTER TABLE `month_hardiness_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `month_hardiness_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant`
--

DROP TABLE IF EXISTS `plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant` (
  `id` varchar(36) NOT NULL,
  `emoji_code_point` varchar(255) DEFAULT NULL,
  `family` enum('AMARYLLIDACEAE','UMBELLIFERAE','LAMIACEAE','SOLANACEAE','ASTERACEAE','BRASSICACEAE','LILIACEAE','ROSACEAE','CUCURBITACEAE','CHENOPODIACEAE','FABACEAE','POACEAE') DEFAULT NULL,
  `full_size_url` varchar(255) DEFAULT NULL,
  `height_range_cm` int DEFAULT NULL,
  `median_days_lifespan` int DEFAULT NULL,
  `median_days_to_first_harvest` int DEFAULT NULL,
  `median_days_to_last_harvest` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `perennial` bit(1) DEFAULT NULL,
  `position` enum('FULL_SUN','PART_SHADE') DEFAULT NULL,
  `spacing_cm` int DEFAULT NULL,
  `species` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `variety` varchar(255) DEFAULT NULL,
  `watering_level` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant`
--

LOCK TABLES `plant` WRITE;
/*!40000 ALTER TABLE `plant` DISABLE KEYS */;
INSERT INTO `plant` VALUES ('02bccc34-d243-41cc-bde8-7a3ec3b14c67','1F9C4','AMARYLLIDACEAE',NULL,NULL,NULL,NULL,NULL,'Garlic',NULL,NULL,NULL,NULL,NULL,'Generic',NULL),('36a254df-81c6-427b-a053-ea3d5a897f5a','1F346','SOLANACEAE',NULL,NULL,NULL,NULL,NULL,'Eggplant',NULL,NULL,NULL,NULL,NULL,'Generic',NULL),('4c329a09-cb07-4fe5-bf31-d9f9c049fd84','1F33D','LILIACEAE',NULL,NULL,NULL,NULL,NULL,'Corn',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('58a48052-188d-435e-bbad-6f465c0dc2d4','1F955','BRASSICACEAE',NULL,NULL,NULL,NULL,NULL,'Carrot',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8559d700-1b0e-44e6-9773-ca03d577713e','1F966','ASTERACEAE',NULL,NULL,NULL,NULL,NULL,'Brocolli',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b4867835-04e6-46e9-b8f0-01d8a1c55c45','1F9C5','AMARYLLIDACEAE',NULL,NULL,NULL,NULL,NULL,'Onion',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('f1eaa2dc-b6fd-4d30-942e-dc0b108b3b47','1F345','SOLANACEAE',NULL,NULL,NULL,NULL,NULL,'Tomato',NULL,NULL,NULL,NULL,NULL,'Generic',NULL),('ff02b1b2-072e-4a81-9f92-840f7250f567','1FADB','BRASSICACEAE',NULL,NULL,NULL,NULL,NULL,'Peas',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_companion_plants`
--

DROP TABLE IF EXISTS `plant_companion_plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_companion_plants` (
  `plant_id` varchar(36) NOT NULL,
  `companion_plants_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_srf56x66qfosqa5s1lhk5a5j0` (`companion_plants_id`),
  KEY `FKfeey2i9ga4uikwksujp57qia7` (`plant_id`),
  CONSTRAINT `FK3pm6w7pesvai4wqgc1epp91qp` FOREIGN KEY (`companion_plants_id`) REFERENCES `plant` (`id`),
  CONSTRAINT `FKfeey2i9ga4uikwksujp57qia7` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_companion_plants`
--

LOCK TABLES `plant_companion_plants` WRITE;
/*!40000 ALTER TABLE `plant_companion_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_companion_plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_plant_tasks`
--

DROP TABLE IF EXISTS `plant_plant_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_plant_tasks` (
  `plant_id` varchar(36) NOT NULL,
  `plant_tasks_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_5tlqbdv6ewvm5ihml31vubevg` (`plant_tasks_id`),
  KEY `FK37pvrilrir0sethk4igfts6ot` (`plant_id`),
  CONSTRAINT `FK37pvrilrir0sethk4igfts6ot` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`id`),
  CONSTRAINT `FK8e9xcv5yp0rqo7toqyl09ha8r` FOREIGN KEY (`plant_tasks_id`) REFERENCES `plant_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_plant_tasks`
--

LOCK TABLES `plant_plant_tasks` WRITE;
/*!40000 ALTER TABLE `plant_plant_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_plant_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_sowing_month_hardiness_zones`
--

DROP TABLE IF EXISTS `plant_sowing_month_hardiness_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_sowing_month_hardiness_zones` (
  `plant_id` varchar(36) NOT NULL,
  `sowing_month_hardiness_zones_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_f66opxpu4778dgl66mfc5t0j4` (`sowing_month_hardiness_zones_id`),
  KEY `FKr6ni4kgbfi17rpo1ou2hlpib0` (`plant_id`),
  CONSTRAINT `FK3gor4bfy7694df3v7hnuxhaxq` FOREIGN KEY (`sowing_month_hardiness_zones_id`) REFERENCES `month_hardiness_zone` (`id`),
  CONSTRAINT `FKr6ni4kgbfi17rpo1ou2hlpib0` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_sowing_month_hardiness_zones`
--

LOCK TABLES `plant_sowing_month_hardiness_zones` WRITE;
/*!40000 ALTER TABLE `plant_sowing_month_hardiness_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_sowing_month_hardiness_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plant_task`
--

DROP TABLE IF EXISTS `plant_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plant_task` (
  `id` varchar(36) NOT NULL,
  `start_offset` decimal(21,0) DEFAULT NULL,
  `type` enum('WATERING','SEEDING_TRAYS','SEEDING_DIRECT','WEEDING','FERTILIZING','TRANSPLANTING','HARVESTING','NETTING') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plant_task`
--

LOCK TABLES `plant_task` WRITE;
/*!40000 ALTER TABLE `plant_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `plant_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('06036915-1209-4d9c-8381-f968b5aeb015'),('06439f5c-ce26-48db-8c68-4d064a04fb28'),('0d855e4c-86f7-4b8c-b066-bc06aff4cecf'),('1192b63d-64e9-44fa-bae5-a834b7faeb5a'),('1a5f606a-5cb1-4ec2-9109-a57be7f6ccfd'),('2d79597d-be9d-4b46-a42c-c62e0a4d3afd'),('33553dd1-6080-495a-b58b-5b21fddda747'),('34bb5e6a-a89a-4a31-89d6-8ae2a8556b6d'),('3f90d8dc-0fc9-4386-939e-f4c437c054f5'),('44304820-2943-4df4-b9c3-a4e5d566e101'),('45c165fc-5c55-4ac9-a2a7-a74f2a186ebb'),('542f8a57-58e0-47c6-9a36-08d0810bd15f'),('5a19d499-0184-4c89-8f83-9a8359fa4774'),('5ae4b366-d1cb-4d04-a18e-0cc2c9e6c622'),('628b6452-d406-45c0-902a-158900957b05'),('6af24ad8-c964-43f5-a4f8-d143a4495552'),('7046d2b9-1cb8-46cc-a01c-d7e4641c14ca'),('737cd987-21f8-4a97-b9d4-1190b797a296'),('74fad96a-782e-4e56-a45f-aed997a3a689'),('7f832a0b-22d4-4308-9a95-f972087551d1'),('848f7467-79e2-45ee-a5c0-a66d400e0d8d'),('877c2d37-2b37-4a83-99c6-1f148658abfb'),('941522dd-3233-4f5c-89d3-d7721aa9a41c'),('96eab2f0-33f3-4ea4-82b6-d11b24bc2920'),('9d67566a-99db-464d-bc44-a9cb4d8d7f84'),('a2078db9-a970-443c-af40-4a2b2c2c84d2'),('a7cdc5dd-c666-4d38-bed3-2754469248c6'),('aaf7cfdf-a1d5-4771-b677-d5df5f327e79'),('c5cfaf18-b9cc-4e6c-97e7-449de777e3fa'),('c6aed72f-c152-4f36-940b-dac3e62d8abc'),('c9b043a5-daa8-4e00-a139-d14dc888f827'),('cc724619-0271-422b-ba1f-a58b8426de78'),('da5bfbf6-97be-4abb-a40c-16472723e441'),('e5966eaf-c32a-45b6-b08d-699452bc54ac'),('edd618b3-84c5-4ab9-bfeb-ec1f865d3238'),('ee58b855-eb9a-4691-b6b5-ee7c2f0f243c'),('f0bee40b-a1f8-46df-9ee5-6850457f9469'),('f5ff184b-cf05-404c-98c3-62e9409863c1'),('fc631669-bd4d-4539-8e80-d517e876a633'),('fdf494b3-8e3d-49b6-b6ab-1d5ff45e20d5');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_group`
--

DROP TABLE IF EXISTS `section_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_group` (
  `id` varchar(36) NOT NULL,
  `colour` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_group`
--

LOCK TABLES `section_group` WRITE;
/*!40000 ALTER TABLE `section_group` DISABLE KEYS */;
INSERT INTO `section_group` VALUES ('036c3b99-508f-4fe9-8207-4c852bdf0b09','orange','orange'),('3e3f5655-f668-402e-95db-78dffe990010','blue','blue'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','white','white'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','black','black'),('b1fd8b1d-a829-490e-8b32-f60d3b6de103','red','red');
/*!40000 ALTER TABLE `section_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_group_sections`
--

DROP TABLE IF EXISTS `section_group_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_group_sections` (
  `section_group_id` varchar(36) NOT NULL,
  `sections_id` varchar(36) NOT NULL,
  KEY `FKr8mcyoa3umhs17gqsvfk9sa8b` (`sections_id`),
  KEY `FKrqpudpq4i8oicbklciq0o3xx1` (`section_group_id`),
  CONSTRAINT `FKr8mcyoa3umhs17gqsvfk9sa8b` FOREIGN KEY (`sections_id`) REFERENCES `section` (`id`),
  CONSTRAINT `FKrqpudpq4i8oicbklciq0o3xx1` FOREIGN KEY (`section_group_id`) REFERENCES `section_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_group_sections`
--

LOCK TABLES `section_group_sections` WRITE;
/*!40000 ALTER TABLE `section_group_sections` DISABLE KEYS */;
INSERT INTO `section_group_sections` VALUES ('3e3f5655-f668-402e-95db-78dffe990010','fdf494b3-8e3d-49b6-b6ab-1d5ff45e20d5'),('3e3f5655-f668-402e-95db-78dffe990010','6af24ad8-c964-43f5-a4f8-d143a4495552'),('3e3f5655-f668-402e-95db-78dffe990010','da5bfbf6-97be-4abb-a40c-16472723e441'),('3e3f5655-f668-402e-95db-78dffe990010','a7cdc5dd-c666-4d38-bed3-2754469248c6'),('3e3f5655-f668-402e-95db-78dffe990010','e5966eaf-c32a-45b6-b08d-699452bc54ac'),('3e3f5655-f668-402e-95db-78dffe990010','877c2d37-2b37-4a83-99c6-1f148658abfb'),('3e3f5655-f668-402e-95db-78dffe990010','3f90d8dc-0fc9-4386-939e-f4c437c054f5'),('3e3f5655-f668-402e-95db-78dffe990010','628b6452-d406-45c0-902a-158900957b05'),('3e3f5655-f668-402e-95db-78dffe990010','1192b63d-64e9-44fa-bae5-a834b7faeb5a'),('3e3f5655-f668-402e-95db-78dffe990010','f0bee40b-a1f8-46df-9ee5-6850457f9469'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','edd618b3-84c5-4ab9-bfeb-ec1f865d3238'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','06036915-1209-4d9c-8381-f968b5aeb015'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','848f7467-79e2-45ee-a5c0-a66d400e0d8d'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','a2078db9-a970-443c-af40-4a2b2c2c84d2'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','06439f5c-ce26-48db-8c68-4d064a04fb28'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','7f832a0b-22d4-4308-9a95-f972087551d1'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','1a5f606a-5cb1-4ec2-9109-a57be7f6ccfd'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','f5ff184b-cf05-404c-98c3-62e9409863c1'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','fc631669-bd4d-4539-8e80-d517e876a633'),('036c3b99-508f-4fe9-8207-4c852bdf0b09','44304820-2943-4df4-b9c3-a4e5d566e101'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','737cd987-21f8-4a97-b9d4-1190b797a296'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','0d855e4c-86f7-4b8c-b066-bc06aff4cecf'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','7046d2b9-1cb8-46cc-a01c-d7e4641c14ca'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','c5cfaf18-b9cc-4e6c-97e7-449de777e3fa'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','5ae4b366-d1cb-4d04-a18e-0cc2c9e6c622'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','45c165fc-5c55-4ac9-a2a7-a74f2a186ebb'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','96eab2f0-33f3-4ea4-82b6-d11b24bc2920'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','74fad96a-782e-4e56-a45f-aed997a3a689'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','c6aed72f-c152-4f36-940b-dac3e62d8abc'),('4506061c-fd84-42bf-94e5-269c1a4ae9da','9d67566a-99db-464d-bc44-a9cb4d8d7f84'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','33553dd1-6080-495a-b58b-5b21fddda747'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','542f8a57-58e0-47c6-9a36-08d0810bd15f'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','5a19d499-0184-4c89-8f83-9a8359fa4774'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','cc724619-0271-422b-ba1f-a58b8426de78'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','34bb5e6a-a89a-4a31-89d6-8ae2a8556b6d'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','941522dd-3233-4f5c-89d3-d7721aa9a41c'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','2d79597d-be9d-4b46-a42c-c62e0a4d3afd'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','aaf7cfdf-a1d5-4771-b677-d5df5f327e79'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','ee58b855-eb9a-4691-b6b5-ee7c2f0f243c'),('aa6b4da8-a3ba-4a00-bad9-d8292b0f6831','c9b043a5-daa8-4e00-a139-d14dc888f827');
/*!40000 ALTER TABLE `section_group_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_snapshot`
--

DROP TABLE IF EXISTS `section_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_snapshot` (
  `id` varchar(36) NOT NULL,
  `harvested_timestamp` datetime(6) DEFAULT NULL,
  `planting_timestamp` datetime(6) DEFAULT NULL,
  `plant_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6j09qnwto92hn4nuhhylt3o9h` (`plant_id`),
  CONSTRAINT `FK6j09qnwto92hn4nuhhylt3o9h` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_snapshot`
--

LOCK TABLES `section_snapshot` WRITE;
/*!40000 ALTER TABLE `section_snapshot` DISABLE KEYS */;
INSERT INTO `section_snapshot` VALUES ('0033f143-7cf6-439c-bf12-fdd96cb5fb66',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('0668c1dc-e7c5-4077-b933-aa99483f7995',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('083f2ae6-5941-4346-80f5-802bcb97036a',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('223d2c24-f234-4932-ada7-078b0b78045f',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('2c2fc84a-3a55-4ab6-8b78-798ee4ef8d1a',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('32de7b61-07af-4292-b854-3e4f85e801b2',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('3a50c6c1-1699-4000-924d-c2e632fb2385',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('3baaffd6-4493-4fee-8799-e7cc9014c67b',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('3e0f3e92-aeec-42c4-9786-ca7d34e4d830',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('3f4baf76-3b6b-4f2a-965d-0896c31a206f',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('402c0a1c-f5d9-47ef-ac03-0f3cc6fafb76','2024-07-05 14:00:00.000000','2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('46603dcd-6c8f-44dc-97c2-2c6e4e41ab22',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('4e11f801-b49d-4eb4-979e-2d83889cdf3a',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('4e78d8f9-98a7-4c4d-80ea-6d7cf538be52',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('5067aeef-5c09-4062-8a62-2c6a652e7ef1',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('53a9ce81-cf8f-4c6e-b32d-77abd1a26450',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('5ae5383e-c562-40a1-a26f-3661d87d8803',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('5c120708-f86c-45f7-b3b1-f4c73cef1552',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('5ca77486-d26e-4e8a-87dc-d253237af779',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('5ce42e49-92b3-4764-a2b8-fe7dc416f0c7',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('636edcd6-35d5-4f99-a4d0-86c77464358c',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('665c075e-9645-4d45-9c75-e7ba72610398',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('6a0919f6-73ff-4cc0-9144-dd671c0eaa3d',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('746f8acf-d213-4ed9-a796-066897648bef',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('795027c2-83dd-46ee-9b24-002df45af047',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('7e7770c7-2442-4a1e-b0ef-604f1417beeb',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('81239dae-0abc-4be5-9348-3b1716d560f7',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('8627ec04-7e63-4df3-b6d6-d2f456dadf31',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('86dacf7a-2df9-4a50-8bcc-079ac479bd93',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('88e7a809-5494-4df9-baa0-5a549f5a6e28',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('a0819ced-cfe3-4d7f-8128-4aa728b5fa3e',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('aa69f56e-ffc1-47c2-b078-8dbf00f1c6d3',NULL,'2024-05-14 14:00:00.000000','b4867835-04e6-46e9-b8f0-01d8a1c55c45'),('b2028934-0a06-4390-b4c8-31443fe67dce',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('b2573e50-e4b9-4019-996d-467531551b6c',NULL,'2024-05-10 14:00:00.000000','58a48052-188d-435e-bbad-6f465c0dc2d4'),('bde398c6-ed76-41cf-b9e6-4a2ba67cc940',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('cfaabba2-c1b3-4e70-ac48-e8ebf61fbaff',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('d30d6dbc-2b44-49f5-95f6-5534444c4f08',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('d5ebc476-52e2-4c7b-8196-f54a2ca22705',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e'),('e894e2a9-965b-4775-b2f1-798bb0bb0fbe',NULL,'2024-04-30 14:00:00.000000','ff02b1b2-072e-4a81-9f92-840f7250f567'),('f8fbd78b-8df0-4005-8977-b2fc31516d6d',NULL,'2024-05-10 14:00:00.000000','8559d700-1b0e-44e6-9773-ca03d577713e');
/*!40000 ALTER TABLE `section_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_snapshot_section_treatments`
--

DROP TABLE IF EXISTS `section_snapshot_section_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_snapshot_section_treatments` (
  `section_snapshot_id` varchar(36) NOT NULL,
  `section_treatments_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_9tdnp4bw89qpe7et2wllntarf` (`section_treatments_id`),
  KEY `FK8l98nx6ftaxhsi2oh7qcnlyxe` (`section_snapshot_id`),
  CONSTRAINT `FK8l98nx6ftaxhsi2oh7qcnlyxe` FOREIGN KEY (`section_snapshot_id`) REFERENCES `section_snapshot` (`id`),
  CONSTRAINT `FKgq5bdlhny2rl44rbkqo7bcm6h` FOREIGN KEY (`section_treatments_id`) REFERENCES `section_treatment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_snapshot_section_treatments`
--

LOCK TABLES `section_snapshot_section_treatments` WRITE;
/*!40000 ALTER TABLE `section_snapshot_section_treatments` DISABLE KEYS */;
INSERT INTO `section_snapshot_section_treatments` VALUES ('86dacf7a-2df9-4a50-8bcc-079ac479bd93','946d6bb8-324e-44d8-89a1-8070a62c9946');
/*!40000 ALTER TABLE `section_snapshot_section_treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_state`
--

DROP TABLE IF EXISTS `section_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_state` (
  `id` varchar(36) NOT NULL,
  `section_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa6lelewhbtb1khiaajvg6ke43` (`section_id`),
  CONSTRAINT `FKa6lelewhbtb1khiaajvg6ke43` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_state`
--

LOCK TABLES `section_state` WRITE;
/*!40000 ALTER TABLE `section_state` DISABLE KEYS */;
INSERT INTO `section_state` VALUES ('14b35a60-f7a3-4427-87ef-e38ba7e2216f','06036915-1209-4d9c-8381-f968b5aeb015'),('5b000385-95ab-46f1-9d6f-301a50cb15c4','06439f5c-ce26-48db-8c68-4d064a04fb28'),('51997032-7eff-49a5-baa8-6c79932befc3','0d855e4c-86f7-4b8c-b066-bc06aff4cecf'),('270f0fae-7ada-4727-9930-a44a001cde96','1192b63d-64e9-44fa-bae5-a834b7faeb5a'),('2960b904-57f0-4bec-a0a1-bb06aa595e95','1a5f606a-5cb1-4ec2-9109-a57be7f6ccfd'),('8a81720b-5a9f-45e2-9761-2d2f90ea53de','2d79597d-be9d-4b46-a42c-c62e0a4d3afd'),('462e464c-8eae-446a-8ed1-5181fb8a4b12','33553dd1-6080-495a-b58b-5b21fddda747'),('2bb49b26-0036-4d7e-a208-49c0a23748af','34bb5e6a-a89a-4a31-89d6-8ae2a8556b6d'),('9a446443-f77e-4ba6-ba7f-722a61c9426b','3f90d8dc-0fc9-4386-939e-f4c437c054f5'),('50ecfdd8-a1bc-4a95-b2d2-c56163cc544e','44304820-2943-4df4-b9c3-a4e5d566e101'),('a0a3e2b8-1a6f-4972-9823-0f381942a666','45c165fc-5c55-4ac9-a2a7-a74f2a186ebb'),('bf64258c-c9ce-46d2-ac5b-75271bb0335f','542f8a57-58e0-47c6-9a36-08d0810bd15f'),('6f0c384a-c0cc-4ff4-9ad5-053d16f5637e','5a19d499-0184-4c89-8f83-9a8359fa4774'),('77c8e9be-f073-48a9-b12a-8b90c1d95839','5ae4b366-d1cb-4d04-a18e-0cc2c9e6c622'),('60c60667-43f1-4acc-a919-ec129f4644c0','628b6452-d406-45c0-902a-158900957b05'),('169ca3dc-fbbf-4b86-812e-2420cfa85238','6af24ad8-c964-43f5-a4f8-d143a4495552'),('e1c5849c-d86c-4678-9c88-a3a4f41ec237','7046d2b9-1cb8-46cc-a01c-d7e4641c14ca'),('c30ae05c-01c9-4779-82fe-e2202669cc38','737cd987-21f8-4a97-b9d4-1190b797a296'),('106cb3de-8e99-4c0a-ae9f-997a4c96783d','74fad96a-782e-4e56-a45f-aed997a3a689'),('2c639274-0615-46af-9285-4e3d177fed3f','7f832a0b-22d4-4308-9a95-f972087551d1'),('a105a523-26d5-4abf-ac33-b5b13135b3cd','848f7467-79e2-45ee-a5c0-a66d400e0d8d'),('73623941-54a3-4e96-bce8-5955d66dfc48','877c2d37-2b37-4a83-99c6-1f148658abfb'),('ba5fb4e0-e5e5-450c-a3db-6d58e2ea0547','941522dd-3233-4f5c-89d3-d7721aa9a41c'),('cfbb0c71-170b-4291-baef-7408810fa511','96eab2f0-33f3-4ea4-82b6-d11b24bc2920'),('9280f4a0-0b4e-41e8-8089-edcc4d74f1f9','9d67566a-99db-464d-bc44-a9cb4d8d7f84'),('130625cb-ea69-4415-a970-161cb28c03f7','a2078db9-a970-443c-af40-4a2b2c2c84d2'),('6d2e3931-ad1a-4c7f-9435-437bcf017245','a7cdc5dd-c666-4d38-bed3-2754469248c6'),('60e92b78-474a-4ee5-88af-fa9ce210211c','aaf7cfdf-a1d5-4771-b677-d5df5f327e79'),('28c222c8-7bcf-4a27-8d55-eaa2149a5f41','c5cfaf18-b9cc-4e6c-97e7-449de777e3fa'),('e533b85b-0e7d-41a1-bc90-a3c84432f2ba','c6aed72f-c152-4f36-940b-dac3e62d8abc'),('1bbabb76-26bd-4512-b895-a5232b2e9f49','c9b043a5-daa8-4e00-a139-d14dc888f827'),('34c0e1ba-356d-4742-ab84-731e0d9344b8','cc724619-0271-422b-ba1f-a58b8426de78'),('b214642e-f674-4f69-adc1-a741bfaac814','da5bfbf6-97be-4abb-a40c-16472723e441'),('83c53161-d3ac-45d6-bec3-aa49fe3cedc3','e5966eaf-c32a-45b6-b08d-699452bc54ac'),('fb78348d-4006-4ae7-a27c-da77a682250d','edd618b3-84c5-4ab9-bfeb-ec1f865d3238'),('4752a812-64c2-463f-b29b-673785c4d731','ee58b855-eb9a-4691-b6b5-ee7c2f0f243c'),('b968ef50-8cd3-433b-a39e-8e8f277b7e6f','f0bee40b-a1f8-46df-9ee5-6850457f9469'),('a8c119da-83bd-4d8e-a50d-c8f3fa8b0dd1','f5ff184b-cf05-404c-98c3-62e9409863c1'),('7b96a0ac-f63f-40c1-9d44-3970e9428b39','fc631669-bd4d-4539-8e80-d517e876a633'),('ece88cd7-2eb2-45d8-84aa-c1d656bd2f7f','fdf494b3-8e3d-49b6-b6ab-1d5ff45e20d5');
/*!40000 ALTER TABLE `section_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_state_snapshots`
--

DROP TABLE IF EXISTS `section_state_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_state_snapshots` (
  `section_state_id` varchar(36) NOT NULL,
  `snapshots_id` varchar(36) NOT NULL,
  UNIQUE KEY `UK_1bhnhdamt694rgy9y3fx92t1a` (`snapshots_id`),
  KEY `FK42m6xrjlfgwljaykkakmu5uj3` (`section_state_id`),
  CONSTRAINT `FK42m6xrjlfgwljaykkakmu5uj3` FOREIGN KEY (`section_state_id`) REFERENCES `section_state` (`id`),
  CONSTRAINT `FK4kuo6r0khwxj4x5bmdl9368rq` FOREIGN KEY (`snapshots_id`) REFERENCES `section_snapshot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_state_snapshots`
--

LOCK TABLES `section_state_snapshots` WRITE;
/*!40000 ALTER TABLE `section_state_snapshots` DISABLE KEYS */;
INSERT INTO `section_state_snapshots` VALUES ('106cb3de-8e99-4c0a-ae9f-997a4c96783d','4e78d8f9-98a7-4c4d-80ea-6d7cf538be52'),('130625cb-ea69-4415-a970-161cb28c03f7','5ca77486-d26e-4e8a-87dc-d253237af779'),('14b35a60-f7a3-4427-87ef-e38ba7e2216f','86dacf7a-2df9-4a50-8bcc-079ac479bd93'),('169ca3dc-fbbf-4b86-812e-2420cfa85238','7e7770c7-2442-4a1e-b0ef-604f1417beeb'),('1bbabb76-26bd-4512-b895-a5232b2e9f49','b2573e50-e4b9-4019-996d-467531551b6c'),('270f0fae-7ada-4727-9930-a44a001cde96','402c0a1c-f5d9-47ef-ac03-0f3cc6fafb76'),('28c222c8-7bcf-4a27-8d55-eaa2149a5f41','e894e2a9-965b-4775-b2f1-798bb0bb0fbe'),('2960b904-57f0-4bec-a0a1-bb06aa595e95','6a0919f6-73ff-4cc0-9144-dd671c0eaa3d'),('2bb49b26-0036-4d7e-a208-49c0a23748af','5067aeef-5c09-4062-8a62-2c6a652e7ef1'),('2c639274-0615-46af-9285-4e3d177fed3f','3e0f3e92-aeec-42c4-9786-ca7d34e4d830'),('34c0e1ba-356d-4742-ab84-731e0d9344b8','3baaffd6-4493-4fee-8799-e7cc9014c67b'),('462e464c-8eae-446a-8ed1-5181fb8a4b12','5c120708-f86c-45f7-b3b1-f4c73cef1552'),('4752a812-64c2-463f-b29b-673785c4d731','81239dae-0abc-4be5-9348-3b1716d560f7'),('50ecfdd8-a1bc-4a95-b2d2-c56163cc544e','aa69f56e-ffc1-47c2-b078-8dbf00f1c6d3'),('51997032-7eff-49a5-baa8-6c79932befc3','5ae5383e-c562-40a1-a26f-3661d87d8803'),('5b000385-95ab-46f1-9d6f-301a50cb15c4','3f4baf76-3b6b-4f2a-965d-0896c31a206f'),('60c60667-43f1-4acc-a919-ec129f4644c0','a0819ced-cfe3-4d7f-8128-4aa728b5fa3e'),('60e92b78-474a-4ee5-88af-fa9ce210211c','083f2ae6-5941-4346-80f5-802bcb97036a'),('6d2e3931-ad1a-4c7f-9435-437bcf017245','bde398c6-ed76-41cf-b9e6-4a2ba67cc940'),('6f0c384a-c0cc-4ff4-9ad5-053d16f5637e','4e11f801-b49d-4eb4-979e-2d83889cdf3a'),('73623941-54a3-4e96-bce8-5955d66dfc48','32de7b61-07af-4292-b854-3e4f85e801b2'),('77c8e9be-f073-48a9-b12a-8b90c1d95839','223d2c24-f234-4932-ada7-078b0b78045f'),('83c53161-d3ac-45d6-bec3-aa49fe3cedc3','cfaabba2-c1b3-4e70-ac48-e8ebf61fbaff'),('8a81720b-5a9f-45e2-9761-2d2f90ea53de','636edcd6-35d5-4f99-a4d0-86c77464358c'),('9280f4a0-0b4e-41e8-8089-edcc4d74f1f9','53a9ce81-cf8f-4c6e-b32d-77abd1a26450'),('9a446443-f77e-4ba6-ba7f-722a61c9426b','746f8acf-d213-4ed9-a796-066897648bef'),('a0a3e2b8-1a6f-4972-9823-0f381942a666','2c2fc84a-3a55-4ab6-8b78-798ee4ef8d1a'),('a105a523-26d5-4abf-ac33-b5b13135b3cd','5ce42e49-92b3-4764-a2b8-fe7dc416f0c7'),('a8c119da-83bd-4d8e-a50d-c8f3fa8b0dd1','0033f143-7cf6-439c-bf12-fdd96cb5fb66'),('b214642e-f674-4f69-adc1-a741bfaac814','795027c2-83dd-46ee-9b24-002df45af047'),('b968ef50-8cd3-433b-a39e-8e8f277b7e6f','f8fbd78b-8df0-4005-8977-b2fc31516d6d'),('ba5fb4e0-e5e5-450c-a3db-6d58e2ea0547','46603dcd-6c8f-44dc-97c2-2c6e4e41ab22'),('bf64258c-c9ce-46d2-ac5b-75271bb0335f','88e7a809-5494-4df9-baa0-5a549f5a6e28'),('c30ae05c-01c9-4779-82fe-e2202669cc38','b2028934-0a06-4390-b4c8-31443fe67dce'),('cfbb0c71-170b-4291-baef-7408810fa511','665c075e-9645-4d45-9c75-e7ba72610398'),('e1c5849c-d86c-4678-9c88-a3a4f41ec237','d30d6dbc-2b44-49f5-95f6-5534444c4f08'),('e533b85b-0e7d-41a1-bc90-a3c84432f2ba','8627ec04-7e63-4df3-b6d6-d2f456dadf31'),('ece88cd7-2eb2-45d8-84aa-c1d656bd2f7f','d5ebc476-52e2-4c7b-8196-f54a2ca22705'),('fb78348d-4006-4ae7-a27c-da77a682250d','0668c1dc-e7c5-4077-b933-aa99483f7995');
/*!40000 ALTER TABLE `section_state_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_treatment`
--

DROP TABLE IF EXISTS `section_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_treatment` (
  `id` varchar(36) NOT NULL,
  `treatment_timestamp` datetime(6) DEFAULT NULL,
  `treatment_type` enum('FERTILIZER','SOIL_CONDITIONER') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_treatment`
--

LOCK TABLES `section_treatment` WRITE;
/*!40000 ALTER TABLE `section_treatment` DISABLE KEYS */;
INSERT INTO `section_treatment` VALUES ('946d6bb8-324e-44d8-89a1-8070a62c9946','2024-05-11 04:44:20.263000','FERTILIZER');
/*!40000 ALTER TABLE `section_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'garden_service'
--

--
-- Dumping routines for database 'garden_service'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-11 17:44:44
