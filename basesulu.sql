-- MySQL dump 10.16  Distrib 10.2.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.2.22-MariaDB-1:10.2.22+maria~bionic-log

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
-- Table structure for table `ca_categories`
--

DROP TABLE IF EXISTS `ca_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idCategoriesParent` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3D85D789AF5206F3` (`category_key`),
  KEY `IDX_3D85D78937A3C3B1` (`idCategoriesParent`),
  KEY `IDX_3D85D789DBF11E1D` (`idUsersCreator`),
  KEY `IDX_3D85D78930D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_3D85D78930D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_3D85D78937A3C3B1` FOREIGN KEY (`idCategoriesParent`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3D85D789DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_categories`
--

LOCK TABLES `ca_categories` WRITE;
/*!40000 ALTER TABLE `ca_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_category_meta`
--

DROP TABLE IF EXISTS `ca_category_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_category_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idCategories` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2575BBB0B8075882` (`idCategories`),
  CONSTRAINT `FK_2575BBB0B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_category_meta`
--

LOCK TABLES `ca_category_meta` WRITE;
/*!40000 ALTER TABLE `ca_category_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_category_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_category_translation_keywords`
--

DROP TABLE IF EXISTS `ca_category_translation_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_category_translation_keywords` (
  `idKeywords` int(11) NOT NULL,
  `idCategoryTranslations` int(11) NOT NULL,
  PRIMARY KEY (`idKeywords`,`idCategoryTranslations`),
  KEY `IDX_D15FBE37F9FC9F05` (`idKeywords`),
  KEY `IDX_D15FBE3717CA14DA` (`idCategoryTranslations`),
  CONSTRAINT `FK_D15FBE3717CA14DA` FOREIGN KEY (`idCategoryTranslations`) REFERENCES `ca_category_translations` (`id`),
  CONSTRAINT `FK_D15FBE37F9FC9F05` FOREIGN KEY (`idKeywords`) REFERENCES `ca_keywords` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_category_translation_keywords`
--

LOCK TABLES `ca_category_translation_keywords` WRITE;
/*!40000 ALTER TABLE `ca_category_translation_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_category_translation_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_category_translation_medias`
--

DROP TABLE IF EXISTS `ca_category_translation_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_category_translation_medias` (
  `idCategoryTranslations` int(11) NOT NULL,
  `idMedia` int(11) NOT NULL,
  PRIMARY KEY (`idCategoryTranslations`,`idMedia`),
  KEY `IDX_39FC41BA17CA14DA` (`idCategoryTranslations`),
  KEY `IDX_39FC41BA7DE8E211` (`idMedia`),
  CONSTRAINT `FK_39FC41BA17CA14DA` FOREIGN KEY (`idCategoryTranslations`) REFERENCES `ca_category_translations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_39FC41BA7DE8E211` FOREIGN KEY (`idMedia`) REFERENCES `me_media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_category_translation_medias`
--

LOCK TABLES `ca_category_translation_medias` WRITE;
/*!40000 ALTER TABLE `ca_category_translation_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_category_translation_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_category_translations`
--

DROP TABLE IF EXISTS `ca_category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_category_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idCategories` int(11) NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5DCED5E3B8075882` (`idCategories`),
  KEY `IDX_5DCED5E3DBF11E1D` (`idUsersCreator`),
  KEY `IDX_5DCED5E330D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_5DCED5E330D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_5DCED5E3B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5DCED5E3DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_category_translations`
--

LOCK TABLES `ca_category_translations` WRITE;
/*!40000 ALTER TABLE `ca_category_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ca_keywords`
--

DROP TABLE IF EXISTS `ca_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx` (`keyword`,`locale`),
  KEY `IDX_FE02CA0BDBF11E1D` (`idUsersCreator`),
  KEY `IDX_FE02CA0B30D07CD5` (`idUsersChanger`),
  KEY `IDX_FE02CA0B5A93713B` (`keyword`),
  CONSTRAINT `FK_FE02CA0B30D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FE02CA0BDBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca_keywords`
--

LOCK TABLES `ca_keywords` WRITE;
/*!40000 ALTER TABLE `ca_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_addresses`
--

DROP TABLE IF EXISTS `co_account_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` tinyint(1) NOT NULL,
  `idAddresses` int(11) NOT NULL,
  `idAccounts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4165FE4893205E40996BB4F7` (`idAddresses`,`idAccounts`),
  KEY `IDX_4165FE4893205E40` (`idAddresses`),
  KEY `IDX_4165FE48996BB4F7` (`idAccounts`),
  CONSTRAINT `FK_4165FE4893205E40` FOREIGN KEY (`idAddresses`) REFERENCES `co_addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4165FE48996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_addresses`
--

LOCK TABLES `co_account_addresses` WRITE;
/*!40000 ALTER TABLE `co_account_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_bank_accounts`
--

DROP TABLE IF EXISTS `co_account_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_bank_accounts` (
  `idAccounts` int(11) NOT NULL,
  `idBankAccounts` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idBankAccounts`),
  KEY `IDX_C873A532996BB4F7` (`idAccounts`),
  KEY `IDX_C873A53237FCD1D8` (`idBankAccounts`),
  CONSTRAINT `FK_C873A53237FCD1D8` FOREIGN KEY (`idBankAccounts`) REFERENCES `co_bank_account` (`id`),
  CONSTRAINT `FK_C873A532996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_bank_accounts`
--

LOCK TABLES `co_account_bank_accounts` WRITE;
/*!40000 ALTER TABLE `co_account_bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_categories`
--

DROP TABLE IF EXISTS `co_account_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_categories` (
  `idAccounts` int(11) NOT NULL,
  `idCategories` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idCategories`),
  KEY `IDX_B60E9510996BB4F7` (`idAccounts`),
  KEY `IDX_B60E9510B8075882` (`idCategories`),
  CONSTRAINT `FK_B60E9510996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B60E9510B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_categories`
--

LOCK TABLES `co_account_categories` WRITE;
/*!40000 ALTER TABLE `co_account_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_contacts`
--

DROP TABLE IF EXISTS `co_account_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` tinyint(1) NOT NULL,
  `idPositions` int(11) DEFAULT NULL,
  `idContacts` int(11) NOT NULL,
  `idAccounts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_28C6CA0E60E33F28996BB4F7` (`idContacts`,`idAccounts`),
  KEY `IDX_28C6CA0E2A75CE2A` (`idPositions`),
  KEY `IDX_28C6CA0E60E33F28` (`idContacts`),
  KEY `IDX_28C6CA0E996BB4F7` (`idAccounts`),
  CONSTRAINT `FK_28C6CA0E2A75CE2A` FOREIGN KEY (`idPositions`) REFERENCES `co_positions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_28C6CA0E60E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_28C6CA0E996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_contacts`
--

LOCK TABLES `co_account_contacts` WRITE;
/*!40000 ALTER TABLE `co_account_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_emails`
--

DROP TABLE IF EXISTS `co_account_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_emails` (
  `idAccounts` int(11) NOT NULL,
  `idEmails` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idEmails`),
  KEY `IDX_3E246FC3996BB4F7` (`idAccounts`),
  KEY `IDX_3E246FC32F9040C8` (`idEmails`),
  CONSTRAINT `FK_3E246FC32F9040C8` FOREIGN KEY (`idEmails`) REFERENCES `co_emails` (`id`),
  CONSTRAINT `FK_3E246FC3996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_emails`
--

LOCK TABLES `co_account_emails` WRITE;
/*!40000 ALTER TABLE `co_account_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_faxes`
--

DROP TABLE IF EXISTS `co_account_faxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_faxes` (
  `idAccounts` int(11) NOT NULL,
  `idFaxes` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idFaxes`),
  KEY `IDX_7A4E77DC996BB4F7` (`idAccounts`),
  KEY `IDX_7A4E77DCCF6A2007` (`idFaxes`),
  CONSTRAINT `FK_7A4E77DC996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`),
  CONSTRAINT `FK_7A4E77DCCF6A2007` FOREIGN KEY (`idFaxes`) REFERENCES `co_faxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_faxes`
--

LOCK TABLES `co_account_faxes` WRITE;
/*!40000 ALTER TABLE `co_account_faxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_faxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_medias`
--

DROP TABLE IF EXISTS `co_account_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_medias` (
  `idAccounts` int(11) NOT NULL,
  `idMedias` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idMedias`),
  KEY `IDX_60772810996BB4F7` (`idAccounts`),
  KEY `IDX_6077281071C3071B` (`idMedias`),
  CONSTRAINT `FK_6077281071C3071B` FOREIGN KEY (`idMedias`) REFERENCES `me_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_60772810996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_medias`
--

LOCK TABLES `co_account_medias` WRITE;
/*!40000 ALTER TABLE `co_account_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_notes`
--

DROP TABLE IF EXISTS `co_account_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_notes` (
  `idAccounts` int(11) NOT NULL,
  `idNotes` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idNotes`),
  KEY `IDX_A3FBB24A996BB4F7` (`idAccounts`),
  KEY `IDX_A3FBB24A16DFE591` (`idNotes`),
  CONSTRAINT `FK_A3FBB24A16DFE591` FOREIGN KEY (`idNotes`) REFERENCES `co_notes` (`id`),
  CONSTRAINT `FK_A3FBB24A996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_notes`
--

LOCK TABLES `co_account_notes` WRITE;
/*!40000 ALTER TABLE `co_account_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_phones`
--

DROP TABLE IF EXISTS `co_account_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_phones` (
  `idAccounts` int(11) NOT NULL,
  `idPhones` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idPhones`),
  KEY `IDX_918DA964996BB4F7` (`idAccounts`),
  KEY `IDX_918DA9648039866F` (`idPhones`),
  CONSTRAINT `FK_918DA9648039866F` FOREIGN KEY (`idPhones`) REFERENCES `co_phones` (`id`),
  CONSTRAINT `FK_918DA964996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_phones`
--

LOCK TABLES `co_account_phones` WRITE;
/*!40000 ALTER TABLE `co_account_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_social_media_profiles`
--

DROP TABLE IF EXISTS `co_account_social_media_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_social_media_profiles` (
  `idAccounts` int(11) NOT NULL,
  `idSocialMediaProfiles` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idSocialMediaProfiles`),
  KEY `IDX_E06F75F5996BB4F7` (`idAccounts`),
  KEY `IDX_E06F75F5573F8344` (`idSocialMediaProfiles`),
  CONSTRAINT `FK_E06F75F5573F8344` FOREIGN KEY (`idSocialMediaProfiles`) REFERENCES `co_social_media_profiles` (`id`),
  CONSTRAINT `FK_E06F75F5996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_social_media_profiles`
--

LOCK TABLES `co_account_social_media_profiles` WRITE;
/*!40000 ALTER TABLE `co_account_social_media_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_social_media_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_tags`
--

DROP TABLE IF EXISTS `co_account_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_tags` (
  `idAccounts` int(11) NOT NULL,
  `idTags` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idTags`),
  KEY `IDX_E8D92005996BB4F7` (`idAccounts`),
  KEY `IDX_E8D920051C41CAB8` (`idTags`),
  CONSTRAINT `FK_E8D920051C41CAB8` FOREIGN KEY (`idTags`) REFERENCES `ta_tags` (`id`),
  CONSTRAINT `FK_E8D92005996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_tags`
--

LOCK TABLES `co_account_tags` WRITE;
/*!40000 ALTER TABLE `co_account_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_account_urls`
--

DROP TABLE IF EXISTS `co_account_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_account_urls` (
  `idAccounts` int(11) NOT NULL,
  `idUrls` int(11) NOT NULL,
  PRIMARY KEY (`idAccounts`,`idUrls`),
  KEY `IDX_ADF18382996BB4F7` (`idAccounts`),
  KEY `IDX_ADF183825969693F` (`idUrls`),
  CONSTRAINT `FK_ADF183825969693F` FOREIGN KEY (`idUrls`) REFERENCES `co_urls` (`id`),
  CONSTRAINT `FK_ADF18382996BB4F7` FOREIGN KEY (`idAccounts`) REFERENCES `co_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_account_urls`
--

LOCK TABLES `co_account_urls` WRITE;
/*!40000 ALTER TABLE `co_account_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_account_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_accounts`
--

DROP TABLE IF EXISTS `co_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `externalId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corporation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registerNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeOfJurisdiction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mainEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mainPhone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mainFax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mainUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idContactsMain` int(11) DEFAULT NULL,
  `idAccountsParent` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_805CD14A6D4A8651` (`idContactsMain`),
  KEY `IDX_805CD14AC9171171` (`idAccountsParent`),
  KEY `IDX_805CD14AE48E9A13` (`logo`),
  KEY `IDX_805CD14ADBF11E1D` (`idUsersCreator`),
  KEY `IDX_805CD14A30D07CD5` (`idUsersChanger`),
  KEY `IDX_805CD14A5E237E06` (`name`),
  CONSTRAINT `FK_805CD14A30D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_805CD14A6D4A8651` FOREIGN KEY (`idContactsMain`) REFERENCES `co_contacts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_805CD14AC9171171` FOREIGN KEY (`idAccountsParent`) REFERENCES `co_accounts` (`id`),
  CONSTRAINT `FK_805CD14ADBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_805CD14AE48E9A13` FOREIGN KEY (`logo`) REFERENCES `me_media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_accounts`
--

LOCK TABLES `co_accounts` WRITE;
/*!40000 ALTER TABLE `co_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_address_types`
--

DROP TABLE IF EXISTS `co_address_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_address_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_address_types`
--

LOCK TABLES `co_address_types` WRITE;
/*!40000 ALTER TABLE `co_address_types` DISABLE KEYS */;
INSERT INTO `co_address_types` VALUES (1,'sulu_contact.work'),(2,'sulu_contact.private');
/*!40000 ALTER TABLE `co_address_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_addresses`
--

DROP TABLE IF EXISTS `co_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primaryAddress` tinyint(1) DEFAULT NULL,
  `deliveryAddress` tinyint(1) DEFAULT NULL,
  `billingAddress` tinyint(1) DEFAULT NULL,
  `street` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addition` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postboxNumber` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postboxPostcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postboxCity` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idAdressTypes` int(11) NOT NULL,
  `idCountries` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_26E9A6142A37021A` (`idAdressTypes`),
  KEY `IDX_26E9A614A18CC0FB` (`idCountries`),
  CONSTRAINT `FK_26E9A6142A37021A` FOREIGN KEY (`idAdressTypes`) REFERENCES `co_address_types` (`id`),
  CONSTRAINT `FK_26E9A614A18CC0FB` FOREIGN KEY (`idCountries`) REFERENCES `co_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_addresses`
--

LOCK TABLES `co_addresses` WRITE;
/*!40000 ALTER TABLE `co_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_bank_account`
--

DROP TABLE IF EXISTS `co_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_bank_account`
--

LOCK TABLES `co_bank_account` WRITE;
/*!40000 ALTER TABLE `co_bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_addresses`
--

DROP TABLE IF EXISTS `co_contact_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` tinyint(1) NOT NULL,
  `idAddresses` int(11) NOT NULL,
  `idContacts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DEE056893205E4060E33F28` (`idAddresses`,`idContacts`),
  KEY `IDX_DEE056893205E40` (`idAddresses`),
  KEY `IDX_DEE056860E33F28` (`idContacts`),
  CONSTRAINT `FK_DEE056860E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DEE056893205E40` FOREIGN KEY (`idAddresses`) REFERENCES `co_addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_addresses`
--

LOCK TABLES `co_contact_addresses` WRITE;
/*!40000 ALTER TABLE `co_contact_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_bank_accounts`
--

DROP TABLE IF EXISTS `co_contact_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_bank_accounts` (
  `idContacts` int(11) NOT NULL,
  `idBankAccounts` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idBankAccounts`),
  KEY `IDX_76CDDA0660E33F28` (`idContacts`),
  KEY `IDX_76CDDA0637FCD1D8` (`idBankAccounts`),
  CONSTRAINT `FK_76CDDA0637FCD1D8` FOREIGN KEY (`idBankAccounts`) REFERENCES `co_bank_account` (`id`),
  CONSTRAINT `FK_76CDDA0660E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_bank_accounts`
--

LOCK TABLES `co_contact_bank_accounts` WRITE;
/*!40000 ALTER TABLE `co_contact_bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_categories`
--

DROP TABLE IF EXISTS `co_contact_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_categories` (
  `idContacts` int(11) NOT NULL,
  `idCategories` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idCategories`),
  KEY `IDX_8D2C3E2360E33F28` (`idContacts`),
  KEY `IDX_8D2C3E23B8075882` (`idCategories`),
  CONSTRAINT `FK_8D2C3E2360E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8D2C3E23B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_categories`
--

LOCK TABLES `co_contact_categories` WRITE;
/*!40000 ALTER TABLE `co_contact_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_emails`
--

DROP TABLE IF EXISTS `co_contact_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_emails` (
  `idContacts` int(11) NOT NULL,
  `idEmails` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idEmails`),
  KEY `IDX_8982963160E33F28` (`idContacts`),
  KEY `IDX_898296312F9040C8` (`idEmails`),
  CONSTRAINT `FK_898296312F9040C8` FOREIGN KEY (`idEmails`) REFERENCES `co_emails` (`id`),
  CONSTRAINT `FK_8982963160E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_emails`
--

LOCK TABLES `co_contact_emails` WRITE;
/*!40000 ALTER TABLE `co_contact_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_faxes`
--

DROP TABLE IF EXISTS `co_contact_faxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_faxes` (
  `idContacts` int(11) NOT NULL,
  `idFaxes` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idFaxes`),
  KEY `IDX_61EBBEA260E33F28` (`idContacts`),
  KEY `IDX_61EBBEA2CF6A2007` (`idFaxes`),
  CONSTRAINT `FK_61EBBEA260E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`),
  CONSTRAINT `FK_61EBBEA2CF6A2007` FOREIGN KEY (`idFaxes`) REFERENCES `co_faxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_faxes`
--

LOCK TABLES `co_contact_faxes` WRITE;
/*!40000 ALTER TABLE `co_contact_faxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_faxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_locales`
--

DROP TABLE IF EXISTS `co_contact_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_locales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idContacts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_31E5672760E33F28` (`idContacts`),
  CONSTRAINT `FK_31E5672760E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_locales`
--

LOCK TABLES `co_contact_locales` WRITE;
/*!40000 ALTER TABLE `co_contact_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_medias`
--

DROP TABLE IF EXISTS `co_contact_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_medias` (
  `idContacts` int(11) NOT NULL,
  `idMedias` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idMedias`),
  KEY `IDX_D7D1D1E260E33F28` (`idContacts`),
  KEY `IDX_D7D1D1E271C3071B` (`idMedias`),
  CONSTRAINT `FK_D7D1D1E260E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D7D1D1E271C3071B` FOREIGN KEY (`idMedias`) REFERENCES `me_media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_medias`
--

LOCK TABLES `co_contact_medias` WRITE;
/*!40000 ALTER TABLE `co_contact_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_notes`
--

DROP TABLE IF EXISTS `co_contact_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_notes` (
  `idContacts` int(11) NOT NULL,
  `idNotes` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idNotes`),
  KEY `IDX_B85E7B3460E33F28` (`idContacts`),
  KEY `IDX_B85E7B3416DFE591` (`idNotes`),
  CONSTRAINT `FK_B85E7B3416DFE591` FOREIGN KEY (`idNotes`) REFERENCES `co_notes` (`id`),
  CONSTRAINT `FK_B85E7B3460E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_notes`
--

LOCK TABLES `co_contact_notes` WRITE;
/*!40000 ALTER TABLE `co_contact_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_phones`
--

DROP TABLE IF EXISTS `co_contact_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_phones` (
  `idContacts` int(11) NOT NULL,
  `idPhones` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idPhones`),
  KEY `IDX_262B509660E33F28` (`idContacts`),
  KEY `IDX_262B50968039866F` (`idPhones`),
  CONSTRAINT `FK_262B509660E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`),
  CONSTRAINT `FK_262B50968039866F` FOREIGN KEY (`idPhones`) REFERENCES `co_phones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_phones`
--

LOCK TABLES `co_contact_phones` WRITE;
/*!40000 ALTER TABLE `co_contact_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_social_media_profiles`
--

DROP TABLE IF EXISTS `co_contact_social_media_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_social_media_profiles` (
  `idContacts` int(11) NOT NULL,
  `idSocialMediaProfiles` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idSocialMediaProfiles`),
  KEY `IDX_74FF4CC060E33F28` (`idContacts`),
  KEY `IDX_74FF4CC0573F8344` (`idSocialMediaProfiles`),
  CONSTRAINT `FK_74FF4CC0573F8344` FOREIGN KEY (`idSocialMediaProfiles`) REFERENCES `co_social_media_profiles` (`id`),
  CONSTRAINT `FK_74FF4CC060E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_social_media_profiles`
--

LOCK TABLES `co_contact_social_media_profiles` WRITE;
/*!40000 ALTER TABLE `co_contact_social_media_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_social_media_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_tags`
--

DROP TABLE IF EXISTS `co_contact_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_tags` (
  `idContacts` int(11) NOT NULL,
  `idTags` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idTags`),
  KEY `IDX_4CB5255060E33F28` (`idContacts`),
  KEY `IDX_4CB525501C41CAB8` (`idTags`),
  CONSTRAINT `FK_4CB525501C41CAB8` FOREIGN KEY (`idTags`) REFERENCES `ta_tags` (`id`),
  CONSTRAINT `FK_4CB5255060E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_tags`
--

LOCK TABLES `co_contact_tags` WRITE;
/*!40000 ALTER TABLE `co_contact_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_titles`
--

DROP TABLE IF EXISTS `co_contact_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4463FC02B36786B` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_titles`
--

LOCK TABLES `co_contact_titles` WRITE;
/*!40000 ALTER TABLE `co_contact_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contact_urls`
--

DROP TABLE IF EXISTS `co_contact_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contact_urls` (
  `idContacts` int(11) NOT NULL,
  `idUrls` int(11) NOT NULL,
  PRIMARY KEY (`idContacts`,`idUrls`),
  KEY `IDX_99D86D760E33F28` (`idContacts`),
  KEY `IDX_99D86D75969693F` (`idUrls`),
  CONSTRAINT `FK_99D86D75969693F` FOREIGN KEY (`idUrls`) REFERENCES `co_urls` (`id`),
  CONSTRAINT `FK_99D86D760E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contact_urls`
--

LOCK TABLES `co_contact_urls` WRITE;
/*!40000 ALTER TABLE `co_contact_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_contact_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_contacts`
--

DROP TABLE IF EXISTS `co_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` int(11) DEFAULT NULL,
  `firstName` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middleName` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `salutation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formOfAddress` int(11) DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mainEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mainPhone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mainFax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mainUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idTitles` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_79D45A95A254E939` (`idTitles`),
  KEY `IDX_79D45A951677722F` (`avatar`),
  KEY `IDX_79D45A95DBF11E1D` (`idUsersCreator`),
  KEY `IDX_79D45A9530D07CD5` (`idUsersChanger`),
  KEY `IDX_79D45A952392A156` (`firstName`),
  KEY `IDX_79D45A9591161A88` (`lastName`),
  CONSTRAINT `FK_79D45A951677722F` FOREIGN KEY (`avatar`) REFERENCES `me_media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_79D45A9530D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_79D45A95A254E939` FOREIGN KEY (`idTitles`) REFERENCES `co_contact_titles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_79D45A95DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_contacts`
--

LOCK TABLES `co_contacts` WRITE;
/*!40000 ALTER TABLE `co_contacts` DISABLE KEYS */;
INSERT INTO `co_contacts` VALUES (1,NULL,'Adam',NULL,'Ministrator',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-26 20:33:26','2019-08-26 20:33:26',NULL,NULL,NULL);
/*!40000 ALTER TABLE `co_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_countries`
--

DROP TABLE IF EXISTS `co_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_countries`
--

LOCK TABLES `co_countries` WRITE;
/*!40000 ALTER TABLE `co_countries` DISABLE KEYS */;
INSERT INTO `co_countries` VALUES (1,'Afghanistan','AF'),(2,'Åland Islands','AX'),(3,'Albania','AL'),(4,'Algeria','DZ'),(5,'American Samoa','AS'),(6,'Andorra','AD'),(7,'Angola','AO'),(8,'Anguilla','AI'),(9,'Antarctica','AQ'),(10,'Antigua and Barbuda','AG'),(11,'Argentina','AR'),(12,'Armenia','AM'),(13,'Aruba','AW'),(14,'Australia','AU'),(15,'Austria','AT'),(16,'Azerbaijan','AZ'),(17,'Bahamas','BS'),(18,'Bahrain','BH'),(19,'Bangladesh','BD'),(20,'Barbados','BB'),(21,'Belarus','BY'),(22,'Belgium','BE'),(23,'Belize','BZ'),(24,'Benin','BJ'),(25,'Bermuda','BM'),(26,'Bhutan','BT'),(27,'Bolivia','BO'),(28,'Bonaire, Sint Eustatius and Saba','BQ'),(29,'Bosnia and Herzegovina','BA'),(30,'Botswana','BW'),(31,'Bouvet Island','BV'),(32,'Brazil','BR'),(33,'British Indian Ocean Territory','IO'),(34,'Brunei Darussalam','BN'),(35,'Bulgaria','BG'),(36,'Burkina Faso','BF'),(37,'Burundi','BI'),(38,'Cambodia','KH'),(39,'Cameroon','CM'),(40,'Canada','CA'),(41,'Cape Verde','CV'),(42,'Cayman Islands','KY'),(43,'Central African Republic','CF'),(44,'Chad','TD'),(45,'Chile','CL'),(46,'China','CN'),(47,'Christmas Island','CX'),(48,'Cocos (Keeling) Islands','CC'),(49,'Colombia','CO'),(50,'Comoros','KM'),(51,'Congo','CG'),(52,'Cook Islands','CK'),(53,'Costa Rica','CR'),(54,'Côte d\'Ivoire','CI'),(55,'Croatia','HR'),(56,'Cuba','CU'),(57,'Curaçao','CW'),(58,'Cyprus','CY'),(59,'Czech Republic','CZ'),(60,'Denmark','DK'),(61,'Djibouti','DJ'),(62,'Dominica','DM'),(63,'Dominican Republic','DO'),(64,'Ecuador','EC'),(65,'Egypt','EG'),(66,'El Salvador','SV'),(67,'Equatorial Guinea','GQ'),(68,'Eritrea','ER'),(69,'Estonia','EE'),(70,'Ethiopia','ET'),(71,'Falkland Islands','FK'),(72,'Faroe Islands','FO'),(73,'Fiji','FJ'),(74,'Finland','FI'),(75,'France','FR'),(76,'French Guiana','GF'),(77,'French Polynesia','PF'),(78,'French Southern Territories','TF'),(79,'Gabon','GA'),(80,'Gambia','GM'),(81,'Georgia','GE'),(82,'Germany','DE'),(83,'Ghana','GH'),(84,'Gibraltar','GI'),(85,'Greece','GR'),(86,'Greenland','GL'),(87,'Grenada','GD'),(88,'Guadeloupe','GP'),(89,'Guam','GU'),(90,'Guatemala','GT'),(91,'Guernsey','GG'),(92,'Guinea','GN'),(93,'Guinea-Bissau','GW'),(94,'Guyana','GY'),(95,'Haiti','HT'),(96,'Heard Island and McDonald Islands','HM'),(97,'Holy See','VA'),(98,'Honduras','HN'),(99,'Hong Kong','HK'),(100,'Hungary','HU'),(101,'Iceland','IS'),(102,'India','IN'),(103,'Indonesia','ID'),(104,'Iran','IR'),(105,'Iraq','IQ'),(106,'Ireland','IE'),(107,'Isle of Man','IM'),(108,'Israel','IL'),(109,'Italy','IT'),(110,'Jamaica','JM'),(111,'Japan','JP'),(112,'Jersey','JE'),(113,'Jordan','JO'),(114,'Kazakhstan','KZ'),(115,'Kenya','KE'),(116,'Kiribati','KI'),(117,'Korea','KR'),(118,'Kuwait','KW'),(119,'Kyrgyzstan','KG'),(120,'Lao People\'s Democratic Republic','LA'),(121,'Latvia','LV'),(122,'Lebanon','LB'),(123,'Lesotho','LS'),(124,'Liberia','LR'),(125,'Libya','LY'),(126,'Liechtenstein','LI'),(127,'Lithuania','LT'),(128,'Luxembourg','LU'),(129,'Macao','MO'),(130,'Macedonia','MK'),(131,'Madagascar','MG'),(132,'Malawi','MW'),(133,'Malaysia','MY'),(134,'Maldives','MV'),(135,'Mali','ML'),(136,'Malta','MT'),(137,'Marshall Islands','MH'),(138,'Martinique','MQ'),(139,'Mauritania','MR'),(140,'Mauritius','MU'),(141,'Mayotte','YT'),(142,'Mexico','MX'),(143,'Micronesia','FM'),(144,'Moldova','MD'),(145,'Monaco','MC'),(146,'Mongolia','MN'),(147,'Montenegro','ME'),(148,'Montserrat','MS'),(149,'Morocco','MA'),(150,'Mozambique','MZ'),(151,'Myanmar','MM'),(152,'Namibia','NA'),(153,'Nauru','NR'),(154,'Nepal','NP'),(155,'Netherlands','NL'),(156,'New Caledonia','NC'),(157,'New Zealand','NZ'),(158,'Nicaragua','NI'),(159,'Niger','NE'),(160,'Nigeria','NG'),(161,'Niue','NU'),(162,'Norfolk Island','NF'),(163,'Northern Mariana Islands','MP'),(164,'Norway','NO'),(165,'Oman','OM'),(166,'Pakistan','PK'),(167,'Palau','PW'),(168,'Palestine','PS'),(169,'Panama','PA'),(170,'Papua New Guinea','PG'),(171,'Paraguay','PY'),(172,'Peru','PE'),(173,'Philippines','PH'),(174,'Pitcairn','PN'),(175,'Poland','PL'),(176,'Portugal','PT'),(177,'Puerto Rico','PR'),(178,'Qatar','QA'),(179,'Réunion','RE'),(180,'Romania','RO'),(181,'Russian Federation','RU'),(182,'Rwanda','RW'),(183,'Saint Barthélemy','BL'),(184,'Saint Helena, Ascension and Tristan da Cunha','SH'),(185,'Saint Kitts and Nevis','KN'),(186,'Saint Lucia','LC'),(187,'Saint Martin','MF'),(188,'Saint Pierre and Miquelon','PM'),(189,'Saint Vincent and the Grenadines','VC'),(190,'Samoa','WS'),(191,'San Marino','SM'),(192,'Sao Tome and Principe','ST'),(193,'Saudi Arabia','SA'),(194,'Senegal','SN'),(195,'Serbia','RS'),(196,'Seychelles','SC'),(197,'Sierra Leone','SL'),(198,'Singapore','SG'),(199,'Sint Maarten','SX'),(200,'Slovakia','SK'),(201,'Slovenia','SI'),(202,'Solomon Islands','SB'),(203,'Somalia','SO'),(204,'South Africa','ZA'),(205,'South Georgia and the South Sandwich Islands','GS'),(206,'South Sudan','SS'),(207,'Spain','ES'),(208,'Sri Lanka','LK'),(209,'Sudan','SD'),(210,'Suriname','SR'),(211,'Svalbard and Jan Mayen','SJ'),(212,'Swaziland','SZ'),(213,'Sweden','SE'),(214,'Switzerland','CH'),(215,'Syrian Arab Republic','SY'),(216,'Taiwan','TW'),(217,'Tajikistan','TJ'),(218,'Tanzania','TZ'),(219,'Thailand','TH'),(220,'Timor-Leste','TL'),(221,'Togo','TG'),(222,'Tokelau','TK'),(223,'Tonga','TO'),(224,'Trinidad and Tobago','TT'),(225,'Tunisia','TN'),(226,'Turkey','TR'),(227,'Turkmenistan','TM'),(228,'Turks and Caicos Islands','TC'),(229,'Tuvalu','TV'),(230,'Uganda','UG'),(231,'Ukraine','UA'),(232,'United Arab Emirates','AE'),(233,'United Kingdom','GB'),(234,'United States','US'),(235,'United States Minor Outlying Islands','UM'),(236,'Uruguay','UY'),(237,'Uzbekistan','UZ'),(238,'Vanuatu','VU'),(239,'Venezuela','VE'),(240,'Viet Nam','VN'),(241,'Virgin Islands (British)','VG'),(242,'Virgin Islands (U.S.)','VI'),(243,'Wallis and Futuna','WF'),(244,'Western Sahara','EH'),(245,'Yemen','YE'),(246,'Zambia','ZM'),(247,'Zimbabwe','ZW');
/*!40000 ALTER TABLE `co_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_email_types`
--

DROP TABLE IF EXISTS `co_email_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_email_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_email_types`
--

LOCK TABLES `co_email_types` WRITE;
/*!40000 ALTER TABLE `co_email_types` DISABLE KEYS */;
INSERT INTO `co_email_types` VALUES (1,'sulu_contact.work'),(2,'sulu_contact.private');
/*!40000 ALTER TABLE `co_email_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_emails`
--

DROP TABLE IF EXISTS `co_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idEmailTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A2F2CB77D816E840` (`idEmailTypes`),
  KEY `IDX_A2F2CB77E7927C74` (`email`),
  CONSTRAINT `FK_A2F2CB77D816E840` FOREIGN KEY (`idEmailTypes`) REFERENCES `co_email_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_emails`
--

LOCK TABLES `co_emails` WRITE;
/*!40000 ALTER TABLE `co_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_fax_types`
--

DROP TABLE IF EXISTS `co_fax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_fax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_fax_types`
--

LOCK TABLES `co_fax_types` WRITE;
/*!40000 ALTER TABLE `co_fax_types` DISABLE KEYS */;
INSERT INTO `co_fax_types` VALUES (1,'sulu_contact.work'),(2,'sulu_contact.private');
/*!40000 ALTER TABLE `co_fax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_faxes`
--

DROP TABLE IF EXISTS `co_faxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_faxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idFaxTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A5EC6A18B466C5DA` (`idFaxTypes`),
  CONSTRAINT `FK_A5EC6A18B466C5DA` FOREIGN KEY (`idFaxTypes`) REFERENCES `co_fax_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_faxes`
--

LOCK TABLES `co_faxes` WRITE;
/*!40000 ALTER TABLE `co_faxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_faxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_notes`
--

DROP TABLE IF EXISTS `co_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_notes`
--

LOCK TABLES `co_notes` WRITE;
/*!40000 ALTER TABLE `co_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_phone_types`
--

DROP TABLE IF EXISTS `co_phone_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_phone_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_phone_types`
--

LOCK TABLES `co_phone_types` WRITE;
/*!40000 ALTER TABLE `co_phone_types` DISABLE KEYS */;
INSERT INTO `co_phone_types` VALUES (1,'sulu_contact.work'),(2,'sulu_contact.private'),(3,'sulu_contact.mobile');
/*!40000 ALTER TABLE `co_phone_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_phones`
--

DROP TABLE IF EXISTS `co_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idPhoneTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D5B0DD0A4249AD7` (`idPhoneTypes`),
  CONSTRAINT `FK_D5B0DD0A4249AD7` FOREIGN KEY (`idPhoneTypes`) REFERENCES `co_phone_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_phones`
--

LOCK TABLES `co_phones` WRITE;
/*!40000 ALTER TABLE `co_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_positions`
--

DROP TABLE IF EXISTS `co_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9FBC367E462CE4F5` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_positions`
--

LOCK TABLES `co_positions` WRITE;
/*!40000 ALTER TABLE `co_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_social_media_profile_types`
--

DROP TABLE IF EXISTS `co_social_media_profile_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_social_media_profile_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_social_media_profile_types`
--

LOCK TABLES `co_social_media_profile_types` WRITE;
/*!40000 ALTER TABLE `co_social_media_profile_types` DISABLE KEYS */;
INSERT INTO `co_social_media_profile_types` VALUES (1,'Facebook'),(2,'Twitter'),(3,'Instagram');
/*!40000 ALTER TABLE `co_social_media_profile_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_social_media_profiles`
--

DROP TABLE IF EXISTS `co_social_media_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_social_media_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idSocialMediaTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DF585BFBB5BEA95F` (`idSocialMediaTypes`),
  CONSTRAINT `FK_DF585BFBB5BEA95F` FOREIGN KEY (`idSocialMediaTypes`) REFERENCES `co_social_media_profile_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_social_media_profiles`
--

LOCK TABLES `co_social_media_profiles` WRITE;
/*!40000 ALTER TABLE `co_social_media_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_social_media_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_url_types`
--

DROP TABLE IF EXISTS `co_url_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_url_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_url_types`
--

LOCK TABLES `co_url_types` WRITE;
/*!40000 ALTER TABLE `co_url_types` DISABLE KEYS */;
INSERT INTO `co_url_types` VALUES (1,'sulu_contact.work'),(2,'sulu_contact.private');
/*!40000 ALTER TABLE `co_url_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_urls`
--

DROP TABLE IF EXISTS `co_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idUrlTypes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6F03842E882335CC` (`idUrlTypes`),
  CONSTRAINT `FK_6F03842E882335CC` FOREIGN KEY (`idUrlTypes`) REFERENCES `co_url_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_urls`
--

LOCK TABLES `co_urls` WRITE;
/*!40000 ALTER TABLE `co_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_collection_meta`
--

DROP TABLE IF EXISTS `me_collection_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_collection_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCollections` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F8D5E71693782C96` (`idCollections`),
  KEY `IDX_F8D5E7162B36786B` (`title`),
  KEY `IDX_F8D5E7164180C698` (`locale`),
  CONSTRAINT `FK_F8D5E71693782C96` FOREIGN KEY (`idCollections`) REFERENCES `me_collections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_collection_meta`
--

LOCK TABLES `me_collection_meta` WRITE;
/*!40000 ALTER TABLE `me_collection_meta` DISABLE KEYS */;
INSERT INTO `me_collection_meta` VALUES (1,'System',NULL,'en',1),(2,'Sulu media',NULL,'en',2),(3,'Sulu Medien',NULL,'de',2),(4,'Preview images',NULL,'en',3),(5,'Vorschaubilder',NULL,'de',3),(6,'Sulu contacts',NULL,'en',4),(7,'Sulu Kontakte',NULL,'de',4),(8,'People',NULL,'en',5),(9,'Personen',NULL,'de',5),(10,'Organizations',NULL,'en',6),(11,'Organisationen',NULL,'de',6);
/*!40000 ALTER TABLE `me_collection_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_collection_types`
--

DROP TABLE IF EXISTS `me_collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_collection_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_type_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FB78DFB179078378` (`collection_type_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_collection_types`
--

LOCK TABLES `me_collection_types` WRITE;
/*!40000 ALTER TABLE `me_collection_types` DISABLE KEYS */;
INSERT INTO `me_collection_types` VALUES (1,'Default','collection.default',NULL),(2,'System Collections','collection.system',NULL);
/*!40000 ALTER TABLE `me_collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_collections`
--

DROP TABLE IF EXISTS `me_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `collection_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idCollectionsMetaDefault` int(11) DEFAULT NULL,
  `idCollectionTypes` int(11) NOT NULL,
  `idCollectionsParent` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F0D4887221904CD` (`collection_key`),
  UNIQUE KEY `UNIQ_F0D4887CFA3F467` (`idCollectionsMetaDefault`),
  KEY `IDX_F0D4887E67924D6` (`idCollectionTypes`),
  KEY `IDX_F0D4887A4F2DCF8` (`idCollectionsParent`),
  KEY `IDX_F0D4887DBF11E1D` (`idUsersCreator`),
  KEY `IDX_F0D488730D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_F0D488730D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F0D4887A4F2DCF8` FOREIGN KEY (`idCollectionsParent`) REFERENCES `me_collections` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F0D4887CFA3F467` FOREIGN KEY (`idCollectionsMetaDefault`) REFERENCES `me_collection_meta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F0D4887DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F0D4887E67924D6` FOREIGN KEY (`idCollectionTypes`) REFERENCES `me_collection_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_collections`
--

LOCK TABLES `me_collections` WRITE;
/*!40000 ALTER TABLE `me_collections` DISABLE KEYS */;
INSERT INTO `me_collections` VALUES (1,NULL,1,12,0,'system_collections','2019-08-26 20:33:27','2019-08-26 20:33:27',1,2,NULL,NULL,NULL),(2,NULL,2,5,1,'sulu_media','2019-08-26 20:33:27','2019-08-26 20:33:27',2,2,1,NULL,NULL),(3,NULL,3,4,2,'sulu_media.preview_image','2019-08-26 20:33:27','2019-08-26 20:33:27',4,2,2,NULL,NULL),(4,NULL,6,11,1,'sulu_contact','2019-08-26 20:33:27','2019-08-26 20:33:27',6,2,1,NULL,NULL),(5,NULL,7,8,2,'sulu_contact.contact','2019-08-26 20:33:27','2019-08-26 20:33:27',8,2,4,NULL,NULL),(6,NULL,9,10,2,'sulu_contact.account','2019-08-26 20:33:27','2019-08-26 20:33:27',10,2,4,NULL,NULL);
/*!40000 ALTER TABLE `me_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_categories`
--

DROP TABLE IF EXISTS `me_file_version_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_categories` (
  `idFileVersions` int(11) NOT NULL,
  `idCategories` int(11) NOT NULL,
  PRIMARY KEY (`idFileVersions`,`idCategories`),
  KEY `IDX_2F1E17D0911ADE33` (`idFileVersions`),
  KEY `IDX_2F1E17D0B8075882` (`idCategories`),
  CONSTRAINT `FK_2F1E17D0911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2F1E17D0B8075882` FOREIGN KEY (`idCategories`) REFERENCES `ca_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_categories`
--

LOCK TABLES `me_file_version_categories` WRITE;
/*!40000 ALTER TABLE `me_file_version_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_content_languages`
--

DROP TABLE IF EXISTS `me_file_version_content_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_content_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idFileVersions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F3FD652C911ADE33` (`idFileVersions`),
  CONSTRAINT `FK_F3FD652C911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_content_languages`
--

LOCK TABLES `me_file_version_content_languages` WRITE;
/*!40000 ALTER TABLE `me_file_version_content_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_content_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_meta`
--

DROP TABLE IF EXISTS `me_file_version_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idFileVersions` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AD44B0AD911ADE33` (`idFileVersions`),
  KEY `IDX_AD44B0AD2B36786B` (`title`),
  KEY `IDX_AD44B0AD4180C698` (`locale`),
  CONSTRAINT `FK_AD44B0AD911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_meta`
--

LOCK TABLES `me_file_version_meta` WRITE;
/*!40000 ALTER TABLE `me_file_version_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_publish_languages`
--

DROP TABLE IF EXISTS `me_file_version_publish_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_publish_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idFileVersions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_195DAB3C911ADE33` (`idFileVersions`),
  CONSTRAINT `FK_195DAB3C911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_publish_languages`
--

LOCK TABLES `me_file_version_publish_languages` WRITE;
/*!40000 ALTER TABLE `me_file_version_publish_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_publish_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_version_tags`
--

DROP TABLE IF EXISTS `me_file_version_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_version_tags` (
  `idFileVersions` int(11) NOT NULL,
  `idTags` int(11) NOT NULL,
  PRIMARY KEY (`idFileVersions`,`idTags`),
  KEY `IDX_150A30BE911ADE33` (`idFileVersions`),
  KEY `IDX_150A30BE1C41CAB8` (`idTags`),
  CONSTRAINT `FK_150A30BE1C41CAB8` FOREIGN KEY (`idTags`) REFERENCES `ta_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_150A30BE911ADE33` FOREIGN KEY (`idFileVersions`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_version_tags`
--

LOCK TABLES `me_file_version_tags` WRITE;
/*!40000 ALTER TABLE `me_file_version_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_version_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_file_versions`
--

DROP TABLE IF EXISTS `me_file_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_file_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `subVersion` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL,
  `downloadCounter` int(11) NOT NULL DEFAULT 0,
  `storageOptions` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mimeType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `focusPointX` int(11) DEFAULT NULL,
  `focusPointY` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idFileVersionsMetaDefault` int(11) DEFAULT NULL,
  `idFiles` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7B6E89456B801096` (`idFileVersionsMetaDefault`),
  KEY `IDX_7B6E894511F10344` (`idFiles`),
  KEY `IDX_7B6E8945DBF11E1D` (`idUsersCreator`),
  KEY `IDX_7B6E894530D07CD5` (`idUsersChanger`),
  KEY `IDX_7B6E8945D8F2A087` (`mimeType`),
  KEY `IDX_7B6E8945F7C0246A` (`size`),
  KEY `IDX_7B6E8945BF1CD3C3` (`version`),
  KEY `IDX_7B6E89455E237E06` (`name`),
  CONSTRAINT `FK_7B6E894511F10344` FOREIGN KEY (`idFiles`) REFERENCES `me_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7B6E894530D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7B6E89456B801096` FOREIGN KEY (`idFileVersionsMetaDefault`) REFERENCES `me_file_version_meta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7B6E8945DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_file_versions`
--

LOCK TABLES `me_file_versions` WRITE;
/*!40000 ALTER TABLE `me_file_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_file_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_files`
--

DROP TABLE IF EXISTS `me_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idMedia` int(11) NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CA8D04277DE8E211` (`idMedia`),
  KEY `IDX_CA8D0427DBF11E1D` (`idUsersCreator`),
  KEY `IDX_CA8D042730D07CD5` (`idUsersChanger`),
  KEY `IDX_CA8D0427BF1CD3C3` (`version`),
  CONSTRAINT `FK_CA8D042730D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA8D04277DE8E211` FOREIGN KEY (`idMedia`) REFERENCES `me_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CA8D0427DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_files`
--

LOCK TABLES `me_files` WRITE;
/*!40000 ALTER TABLE `me_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_format_options`
--

DROP TABLE IF EXISTS `me_format_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_format_options` (
  `format_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crop_x` int(11) NOT NULL,
  `crop_y` int(11) NOT NULL,
  `crop_width` int(11) NOT NULL,
  `crop_height` int(11) NOT NULL,
  `fileVersion` int(11) NOT NULL,
  PRIMARY KEY (`format_key`,`fileVersion`),
  KEY `IDX_6D25443B31852B63` (`fileVersion`),
  CONSTRAINT `FK_6D25443B31852B63` FOREIGN KEY (`fileVersion`) REFERENCES `me_file_versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_format_options`
--

LOCK TABLES `me_format_options` WRITE;
/*!40000 ALTER TABLE `me_format_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_format_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_media`
--

DROP TABLE IF EXISTS `me_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idMediaTypes` int(11) NOT NULL,
  `idPreviewImage` int(11) DEFAULT NULL,
  `idCollections` int(11) NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A694E572D1EB44DE` (`idPreviewImage`),
  KEY `IDX_A694E57284671716` (`idMediaTypes`),
  KEY `IDX_A694E57293782C96` (`idCollections`),
  KEY `IDX_A694E572DBF11E1D` (`idUsersCreator`),
  KEY `IDX_A694E57230D07CD5` (`idUsersChanger`),
  KEY `IDX_A694E572A3F33DFA` (`changed`),
  KEY `IDX_A694E572B23DB7B8` (`created`),
  CONSTRAINT `FK_A694E57230D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A694E57284671716` FOREIGN KEY (`idMediaTypes`) REFERENCES `me_media_types` (`id`),
  CONSTRAINT `FK_A694E57293782C96` FOREIGN KEY (`idCollections`) REFERENCES `me_collections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A694E572D1EB44DE` FOREIGN KEY (`idPreviewImage`) REFERENCES `me_media` (`id`),
  CONSTRAINT `FK_A694E572DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_media`
--

LOCK TABLES `me_media` WRITE;
/*!40000 ALTER TABLE `me_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_media_types`
--

DROP TABLE IF EXISTS `me_media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `me_media_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9A01D6E85E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_media_types`
--

LOCK TABLES `me_media_types` WRITE;
/*!40000 ALTER TABLE `me_media_types` DISABLE KEYS */;
INSERT INTO `me_media_types` VALUES (1,'document',NULL),(2,'image',NULL),(3,'video',NULL),(4,'audio',NULL);
/*!40000 ALTER TABLE `me_media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_binarydata`
--

DROP TABLE IF EXISTS `phpcr_binarydata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_binarydata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `property_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workspace_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idx` int(11) NOT NULL DEFAULT 0,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_37E65615460D9FD7413BC13C1AC10DC4E7087E10` (`node_id`,`property_name`,`workspace_name`,`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_binarydata`
--

LOCK TABLES `phpcr_binarydata` WRITE;
/*!40000 ALTER TABLE `phpcr_binarydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpcr_binarydata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_internal_index_types`
--

DROP TABLE IF EXISTS `phpcr_internal_index_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_internal_index_types` (
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `node_id` int(11) NOT NULL,
  PRIMARY KEY (`type`,`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_internal_index_types`
--

LOCK TABLES `phpcr_internal_index_types` WRITE;
/*!40000 ALTER TABLE `phpcr_internal_index_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpcr_internal_index_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_namespaces`
--

DROP TABLE IF EXISTS `phpcr_namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_namespaces` (
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_namespaces`
--

LOCK TABLES `phpcr_namespaces` WRITE;
/*!40000 ALTER TABLE `phpcr_namespaces` DISABLE KEYS */;
INSERT INTO `phpcr_namespaces` VALUES ('i18n','http://sulu.io/phpcr/locale'),('phpcrmig','http://www.danteech.com/phpcr-migrations'),('sec','http://sulu.io/phpcr/sec'),('settings','http://sulu.io/phpcr/settings'),('sulu','http://sulu.io/phpcr');
/*!40000 ALTER TABLE `phpcr_namespaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_nodes`
--

DROP TABLE IF EXISTS `phpcr_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workspace_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `props` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `numerical_props` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depth` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A4624AD7B548B0F1AC10DC4` (`path`,`workspace_name`),
  UNIQUE KEY `UNIQ_A4624AD7772E836A1AC10DC4` (`identifier`,`workspace_name`),
  KEY `IDX_A4624AD73D8E604F` (`parent`),
  KEY `IDX_A4624AD78CDE5729` (`type`),
  KEY `IDX_A4624AD7623C14D533E16B56` (`local_name`,`namespace`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_nodes`
--

LOCK TABLES `phpcr_nodes` WRITE;
/*!40000 ALTER TABLE `phpcr_nodes` DISABLE KEYS */;
INSERT INTO `phpcr_nodes` VALUES (1,'/','','','','default','952d1459-0c13-4ab2-95c1-bfd7a628bdf6','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property></sv:node>\n',NULL,0,NULL),(2,'/','','','','default_live','a8940c2f-cee0-482e-92b5-ae820cf3f502','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property></sv:node>\n',NULL,0,NULL),(3,'/cmf','/','cmf','','default','19ae906f-444d-48f1-9898-c54c8041c5d5','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">19ae906f-444d-48f1-9898-c54c8041c5d5</sv:value></sv:property></sv:node>\n',NULL,1,1),(4,'/cmf/example','/cmf','example','','default','fb9542f8-c6d0-4766-b46b-c11d4d93d82a','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">fb9542f8-c6d0-4766-b46b-c11d4d93d82a</sv:value></sv:property></sv:node>\n',NULL,2,1),(5,'/cmf/example/contents','/cmf/example','contents','','default','4b3d84e3-e06a-4f2a-9f91-05c866b9c68d','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:home</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">4b3d84e3-e06a-4f2a-9f91-05c866b9c68d</sv:value></sv:property><sv:property sv:name=\"i18n:de-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">Startseite</sv:value></sv:property><sv:property sv:name=\"i18n:de-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">/</sv:value></sv:property><sv:property sv:name=\"i18n:de-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:de-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:de-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:25.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:de-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:25.975+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:de-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:34:43.587+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:de-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:de-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">20</sv:value></sv:property><sv:property sv:name=\"i18n:de-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.136+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">Homepage</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">{\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">{\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:en-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">/</sv:value></sv:property><sv:property sv:name=\"i18n:en-article\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.156+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.156+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.156+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:en-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.165+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:de-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:de-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:de-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">{\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:de-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">{\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:de-article\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-author\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property></sv:node>\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"i18n:de-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:de-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">20</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-author\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property></sv:node>\n',3,1),(6,'/cmf/example/routes','/cmf/example','routes','','default','2a6c3a2e-854b-447a-a457-11ddf73a92fb','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">2a6c3a2e-854b-447a-a457-11ddf73a92fb</sv:value></sv:property></sv:node>\n',NULL,3,2),(7,'/cmf/example/routes/de','/cmf/example/routes','de','','default','7a863677-536c-4295-8a4a-ec8ca8f6dcb4','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">7a863677-536c-4295-8a4a-ec8ca8f6dcb4</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.173+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.173+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">4b3d84e3-e06a-4f2a-9f91-05c866b9c68d</sv:value></sv:property></sv:node>\n',NULL,4,1),(8,'/cmf/example/routes/en','/cmf/example/routes','en','','default','2a0a7f81-f055-4b0c-a5b6-1e3533171e59','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">2a0a7f81-f055-4b0c-a5b6-1e3533171e59</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.175+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.175+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">4b3d84e3-e06a-4f2a-9f91-05c866b9c68d</sv:value></sv:property></sv:node>\n',NULL,4,2),(9,'/cmf','/','cmf','','default_live','19ae906f-444d-48f1-9898-c54c8041c5d5','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">19ae906f-444d-48f1-9898-c54c8041c5d5</sv:value></sv:property></sv:node>\n',NULL,1,2),(10,'/cmf/example','/cmf','example','','default_live','fb9542f8-c6d0-4766-b46b-c11d4d93d82a','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">fb9542f8-c6d0-4766-b46b-c11d4d93d82a</sv:value></sv:property></sv:node>\n',NULL,2,2),(11,'/cmf/example/contents','/cmf/example','contents','','default_live','4b3d84e3-e06a-4f2a-9f91-05c866b9c68d','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:home</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">4b3d84e3-e06a-4f2a-9f91-05c866b9c68d</sv:value></sv:property><sv:property sv:name=\"i18n:de-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">Startseite</sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:de-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:de-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:de-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:de-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">{\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:de-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">{\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:de-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">/</sv:value></sv:property><sv:property sv:name=\"i18n:de-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:de-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:de-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.136+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:de-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:25.000+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:de-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:25.975+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:de-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:34:43.587+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:de-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:de-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">20</sv:value></sv:property><sv:property sv:name=\"i18n:en-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">Homepage</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-title\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-keywords\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-canonicalUrl\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noIndex\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-noFollow\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-seo-hideInSitemap\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-description\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-categories\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-tags\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-excerpt-icon\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">{\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:en-excerpt-images\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"10\">{\"ids\":[]}</sv:value></sv:property><sv:property sv:name=\"i18n:en-url\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"1\">/</sv:value></sv:property><sv:property sv:name=\"i18n:en-article\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:en-template\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"8\">homepage</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-published\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.165+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-authored\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.156+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.156+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.156+00:00</sv:value></sv:property><sv:property sv:name=\"i18n:en-navContexts\" sv:type=\"String\" sv:multi-valued=\"1\"/><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-article\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"0\"></sv:value></sv:property><sv:property sv:name=\"i18n:de-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-author\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property></sv:node>\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"i18n:de-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:de-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"sulu:order\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"2\">20</sv:value></sv:property><sv:property sv:name=\"i18n:en-state\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">2</sv:value></sv:property><sv:property sv:name=\"i18n:en-nodeType\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-creator\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-changer\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property><sv:property sv:name=\"i18n:de-author\" sv:type=\"Long\" sv:multi-valued=\"0\"><sv:value length=\"1\">1</sv:value></sv:property></sv:node>\n',3,3),(12,'/cmf/example/routes','/cmf/example','routes','','default_live','2a6c3a2e-854b-447a-a457-11ddf73a92fb','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">2a6c3a2e-854b-447a-a457-11ddf73a92fb</sv:value></sv:property></sv:node>\n',NULL,3,4),(13,'/cmf/example/routes/de','/cmf/example/routes','de','','default_live','7a863677-536c-4295-8a4a-ec8ca8f6dcb4','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">7a863677-536c-4295-8a4a-ec8ca8f6dcb4</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.173+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.173+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">4b3d84e3-e06a-4f2a-9f91-05c866b9c68d</sv:value></sv:property></sv:node>\n',NULL,4,3),(14,'/cmf/example/routes/en','/cmf/example/routes','en','','default_live','2a0a7f81-f055-4b0c-a5b6-1e3533171e59','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value><sv:value length=\"9\">sulu:path</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">2a0a7f81-f055-4b0c-a5b6-1e3533171e59</sv:value></sv:property><sv:property sv:name=\"sulu:history\" sv:type=\"Boolean\" sv:multi-valued=\"0\"><sv:value length=\"0\">0</sv:value></sv:property><sv:property sv:name=\"sulu:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.175+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:changed\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.175+00:00</sv:value></sv:property><sv:property sv:name=\"sulu:content\" sv:type=\"Reference\" sv:multi-valued=\"0\"><sv:value length=\"36\">4b3d84e3-e06a-4f2a-9f91-05c866b9c68d</sv:value></sv:property></sv:node>\n',NULL,4,4),(15,'/cmf/snippets','/cmf','snippets','','default','24fc8219-52ac-4f5c-9ffe-9fd1e4a85f85','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">24fc8219-52ac-4f5c-9ffe-9fd1e4a85f85</sv:value></sv:property></sv:node>\n',NULL,2,3),(16,'/cmf/example/custom-urls','/cmf/example','custom-urls','','default','9f93f663-295f-40bc-8e01-9596a47fafa0','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">9f93f663-295f-40bc-8e01-9596a47fafa0</sv:value></sv:property></sv:node>\n',NULL,3,5),(17,'/cmf/example/custom-urls/items','/cmf/example/custom-urls','items','','default','19d14271-3e59-478a-9dea-02c26f1f1f4f','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">19d14271-3e59-478a-9dea-02c26f1f1f4f</sv:value></sv:property></sv:node>\n',NULL,4,1),(18,'/cmf/example/custom-urls/routes','/cmf/example/custom-urls','routes','','default','b23e92fc-dcb7-48d3-8aef-bc1ebea14267','nt:unstructured','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"15\">nt:unstructured</sv:value></sv:property><sv:property sv:name=\"jcr:mixinTypes\" sv:type=\"Name\" sv:multi-valued=\"1\"><sv:value length=\"17\">mix:referenceable</sv:value></sv:property><sv:property sv:name=\"jcr:uuid\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"36\">b23e92fc-dcb7-48d3-8aef-bc1ebea14267</sv:value></sv:property></sv:node>\n',NULL,4,2),(19,'/jcr:versions','/','versions','http://www.jcp.org/jcr/1.0','default','98d84290-26d0-4a10-b544-1da68269c286','phpcrmig:versions','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"17\">phpcrmig:versions</sv:value></sv:property></sv:node>\n',NULL,1,3),(20,'/jcr:versions/201504271608','/jcr:versions','201504271608','','default','a6d2cc27-0698-4c8a-ae3d-6fd6b6f503fe','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.273+00:00</sv:value></sv:property></sv:node>\n',NULL,2,1),(21,'/jcr:versions/201504281842','/jcr:versions','201504281842','','default','2c054720-b14c-4dde-9b6d-8707efae523a','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.274+00:00</sv:value></sv:property></sv:node>\n',NULL,2,2),(22,'/jcr:versions/201507231648','/jcr:versions','201507231648','','default','4f0dd929-c154-4521-a6f7-9b643e4603c1','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.274+00:00</sv:value></sv:property></sv:node>\n',NULL,2,3),(23,'/jcr:versions/201507281529','/jcr:versions','201507281529','','default','321b20f4-1be0-4485-9750-9af007bbffe3','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.275+00:00</sv:value></sv:property></sv:node>\n',NULL,2,4),(24,'/jcr:versions/201510210733','/jcr:versions','201510210733','','default','68787062-e893-4850-a59b-9c3b7fdb4505','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.276+00:00</sv:value></sv:property></sv:node>\n',NULL,2,5),(25,'/jcr:versions/201511171538','/jcr:versions','201511171538','','default','2cc51426-8a0e-4b65-9e5a-d3e3412b41dd','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.276+00:00</sv:value></sv:property></sv:node>\n',NULL,2,6),(26,'/jcr:versions/201511240843','/jcr:versions','201511240843','','default','2ae4c90f-c03f-499c-829f-a6866b5f511f','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.277+00:00</sv:value></sv:property></sv:node>\n',NULL,2,7),(27,'/jcr:versions/201511240844','/jcr:versions','201511240844','','default','57399422-42a6-4149-91ab-31655401fa01','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.279+00:00</sv:value></sv:property></sv:node>\n',NULL,2,8),(28,'/jcr:versions/201512090753','/jcr:versions','201512090753','','default','de3fa11d-3a61-4b59-9070-26c727c6fc0c','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.282+00:00</sv:value></sv:property></sv:node>\n',NULL,2,9),(29,'/jcr:versions/201607181533','/jcr:versions','201607181533','','default','5a1c658e-e45d-44b2-a13d-fab7fdf3ee46','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.284+00:00</sv:value></sv:property></sv:node>\n',NULL,2,10),(30,'/jcr:versions/201702021447','/jcr:versions','201702021447','','default','3f0cf273-164c-4b87-950e-ede9bbc8b4d4','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.288+00:00</sv:value></sv:property></sv:node>\n',NULL,2,11),(31,'/jcr:versions/201903271333','/jcr:versions','201903271333','','default','67604820-8d6b-4937-9ab3-b722dbe43a94','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.289+00:00</sv:value></sv:property></sv:node>\n',NULL,2,12),(32,'/jcr:versions/201904110902','/jcr:versions','201904110902','','default','bfbcd362-6cc1-4930-9210-ec99894161b9','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.290+00:00</sv:value></sv:property></sv:node>\n',NULL,2,13),(33,'/jcr:versions/201905071542','/jcr:versions','201905071542','','default','91945183-6635-41b4-abd2-c48cb319d457','phpcrmig:version','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sv:node xmlns:mix=\"http://www.jcp.org/jcr/mix/1.0\" xmlns:nt=\"http://www.jcp.org/jcr/nt/1.0\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" xmlns:jcr=\"http://www.jcp.org/jcr/1.0\" xmlns:sv=\"http://www.jcp.org/jcr/sv/1.0\" xmlns:rep=\"internal\"><sv:property sv:name=\"jcr:primaryType\" sv:type=\"Name\" sv:multi-valued=\"0\"><sv:value length=\"16\">phpcrmig:version</sv:value></sv:property><sv:property sv:name=\"jcr:createdBy\" sv:type=\"String\" sv:multi-valued=\"0\"><sv:value length=\"5\">admin</sv:value></sv:property><sv:property sv:name=\"jcr:created\" sv:type=\"Date\" sv:multi-valued=\"0\"><sv:value length=\"29\">2019-08-26T20:33:26.290+00:00</sv:value></sv:property></sv:node>\n',NULL,2,14);
/*!40000 ALTER TABLE `phpcr_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_nodes_references`
--

DROP TABLE IF EXISTS `phpcr_nodes_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_nodes_references` (
  `source_id` int(11) NOT NULL,
  `source_property_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`source_id`,`source_property_name`,`target_id`),
  KEY `IDX_F3BF7E1158E0B66` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_nodes_references`
--

LOCK TABLES `phpcr_nodes_references` WRITE;
/*!40000 ALTER TABLE `phpcr_nodes_references` DISABLE KEYS */;
INSERT INTO `phpcr_nodes_references` VALUES (7,'sulu:content',5),(8,'sulu:content',5),(13,'sulu:content',11),(14,'sulu:content',11);
/*!40000 ALTER TABLE `phpcr_nodes_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_nodes_weakreferences`
--

DROP TABLE IF EXISTS `phpcr_nodes_weakreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_nodes_weakreferences` (
  `source_id` int(11) NOT NULL,
  `source_property_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`source_id`,`source_property_name`,`target_id`),
  KEY `IDX_F0E4F6FA158E0B66` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_nodes_weakreferences`
--

LOCK TABLES `phpcr_nodes_weakreferences` WRITE;
/*!40000 ALTER TABLE `phpcr_nodes_weakreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpcr_nodes_weakreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_type_childs`
--

DROP TABLE IF EXISTS `phpcr_type_childs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_type_childs` (
  `node_type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protected` tinyint(1) NOT NULL,
  `auto_created` tinyint(1) NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  `on_parent_version` int(11) NOT NULL,
  `primary_types` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_type_childs`
--

LOCK TABLES `phpcr_type_childs` WRITE;
/*!40000 ALTER TABLE `phpcr_type_childs` DISABLE KEYS */;
INSERT INTO `phpcr_type_childs` VALUES (10,'*',0,0,0,1,'phpcrmig:version',NULL);
/*!40000 ALTER TABLE `phpcr_type_childs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_type_nodes`
--

DROP TABLE IF EXISTS `phpcr_type_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_type_nodes` (
  `node_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supertypes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_abstract` tinyint(1) NOT NULL,
  `is_mixin` tinyint(1) NOT NULL,
  `queryable` tinyint(1) NOT NULL,
  `orderable_child_nodes` tinyint(1) NOT NULL,
  `primary_item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`node_type_id`),
  UNIQUE KEY `UNIQ_34B0A8095E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_type_nodes`
--

LOCK TABLES `phpcr_type_nodes` WRITE;
/*!40000 ALTER TABLE `phpcr_type_nodes` DISABLE KEYS */;
INSERT INTO `phpcr_type_nodes` VALUES (1,'sulu:base','mix:referenceable',1,1,0,0,NULL),(2,'sulu:path','sulu:base',0,1,0,0,NULL),(3,'sulu:content','sulu:base',0,1,0,0,NULL),(4,'sulu:snippet','sulu:content',0,1,0,0,NULL),(5,'sulu:page','sulu:content',0,1,0,0,NULL),(6,'sulu:home','sulu:content',0,1,0,0,NULL),(7,'sulu:custom_url','sulu:base',0,1,0,0,NULL),(8,'sulu:custom_url_route','sulu:base',0,1,0,0,NULL),(9,'phpcrmig:version','nt:base mix:created',0,0,1,0,NULL),(10,'phpcrmig:versions','nt:base',0,0,1,0,NULL);
/*!40000 ALTER TABLE `phpcr_type_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_type_props`
--

DROP TABLE IF EXISTS `phpcr_type_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_type_props` (
  `node_type_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protected` tinyint(1) NOT NULL,
  `auto_created` tinyint(1) NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  `on_parent_version` int(11) NOT NULL,
  `multiple` tinyint(1) NOT NULL,
  `fulltext_searchable` tinyint(1) NOT NULL,
  `query_orderable` tinyint(1) NOT NULL,
  `required_type` int(11) NOT NULL,
  `query_operators` int(11) NOT NULL,
  `default_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`node_type_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_type_props`
--

LOCK TABLES `phpcr_type_props` WRITE;
/*!40000 ALTER TABLE `phpcr_type_props` DISABLE KEYS */;
INSERT INTO `phpcr_type_props` VALUES (2,'sulu:content',0,0,1,1,0,0,0,9,0,NULL),(2,'sulu:history',0,1,1,1,0,0,0,6,0,'');
/*!40000 ALTER TABLE `phpcr_type_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpcr_workspaces`
--

DROP TABLE IF EXISTS `phpcr_workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpcr_workspaces` (
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpcr_workspaces`
--

LOCK TABLES `phpcr_workspaces` WRITE;
/*!40000 ALTER TABLE `phpcr_workspaces` DISABLE KEYS */;
INSERT INTO `phpcr_workspaces` VALUES ('default'),('default_live');
/*!40000 ALTER TABLE `phpcr_workspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ro_routes`
--

DROP TABLE IF EXISTS `ro_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ro_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `history` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_671DB7A4B548B0F4180C698` (`path`,`locale`),
  KEY `IDX_671DB7A4158E0B66` (`target_id`),
  KEY `IDX_671DB7A4DBF11E1D` (`idUsersCreator`),
  KEY `IDX_671DB7A430D07CD5` (`idUsersChanger`),
  KEY `IDX_671DB7A4B548B0F` (`path`),
  KEY `IDX_671DB7A44180C698` (`locale`),
  CONSTRAINT `FK_671DB7A4158E0B66` FOREIGN KEY (`target_id`) REFERENCES `ro_routes` (`id`),
  CONSTRAINT `FK_671DB7A430D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_671DB7A4DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ro_routes`
--

LOCK TABLES `ro_routes` WRITE;
/*!40000 ALTER TABLE `ro_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ro_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_access_controls`
--

DROP TABLE IF EXISTS `se_access_controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_access_controls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissions` smallint(6) NOT NULL,
  `entityId` int(11) NOT NULL,
  `entityClass` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idRoles` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C526DC52A1FA6DDA` (`idRoles`),
  KEY `IDX_C526DC52F62829FC` (`entityId`),
  KEY `IDX_C526DC523963FFAB` (`entityClass`),
  CONSTRAINT `FK_C526DC52A1FA6DDA` FOREIGN KEY (`idRoles`) REFERENCES `se_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_access_controls`
--

LOCK TABLES `se_access_controls` WRITE;
/*!40000 ALTER TABLE `se_access_controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_access_controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_group_roles`
--

DROP TABLE IF EXISTS `se_group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_group_roles` (
  `idGroups` int(11) NOT NULL,
  `idRoles` int(11) NOT NULL,
  PRIMARY KEY (`idGroups`,`idRoles`),
  KEY `IDX_9713F725937C91EA` (`idGroups`),
  KEY `IDX_9713F725A1FA6DDA` (`idRoles`),
  CONSTRAINT `FK_9713F725937C91EA` FOREIGN KEY (`idGroups`) REFERENCES `se_groups` (`id`),
  CONSTRAINT `FK_9713F725A1FA6DDA` FOREIGN KEY (`idRoles`) REFERENCES `se_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_group_roles`
--

LOCK TABLES `se_group_roles` WRITE;
/*!40000 ALTER TABLE `se_group_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_groups`
--

DROP TABLE IF EXISTS `se_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idGroupsParent` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_231E44ECBF274AB0` (`idGroupsParent`),
  KEY `IDX_231E44ECDBF11E1D` (`idUsersCreator`),
  KEY `IDX_231E44EC30D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_231E44EC30D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_231E44ECBF274AB0` FOREIGN KEY (`idGroupsParent`) REFERENCES `se_groups` (`id`),
  CONSTRAINT `FK_231E44ECDBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_groups`
--

LOCK TABLES `se_groups` WRITE;
/*!40000 ALTER TABLE `se_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_permissions`
--

DROP TABLE IF EXISTS `se_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` smallint(6) NOT NULL,
  `idRoles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5CEC3EEAE25D857EC242628A1FA6DDA` (`context`,`module`,`idRoles`),
  KEY `IDX_5CEC3EEAA1FA6DDA` (`idRoles`),
  CONSTRAINT `FK_5CEC3EEAA1FA6DDA` FOREIGN KEY (`idRoles`) REFERENCES `se_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_permissions`
--

LOCK TABLES `se_permissions` WRITE;
/*!40000 ALTER TABLE `se_permissions` DISABLE KEYS */;
INSERT INTO `se_permissions` VALUES (1,'sulu.contact.people',NULL,127,1),(2,'sulu.contact.organizations',NULL,127,1),(3,'sulu.media.collections',NULL,127,1),(4,'sulu.media.system_collections',NULL,127,1),(5,'sulu.security.roles',NULL,127,1),(6,'sulu.security.groups',NULL,127,1),(7,'sulu.security.users',NULL,127,1),(8,'sulu.settings.categories',NULL,127,1),(9,'sulu.settings.tags',NULL,127,1),(10,'sulu.global.snippets',NULL,127,1),(11,'sulu.webspaces.example.default-snippets',NULL,127,1),(12,'sulu.webspaces.example',NULL,127,1),(13,'sulu.webspaces.example.analytics',NULL,127,1),(14,'sulu.webspaces.example.custom-urls',NULL,127,1);
/*!40000 ALTER TABLE `se_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_role_settings`
--

DROP TABLE IF EXISTS `se_role_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_role_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settingKey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json_array)',
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DAD1C8CB3AA9950BB8C2FD88` (`settingKey`,`roleId`),
  KEY `IDX_DAD1C8CBB8C2FD88` (`roleId`),
  KEY `IDX_DAD1C8CB3AA9950B` (`settingKey`),
  CONSTRAINT `FK_DAD1C8CBB8C2FD88` FOREIGN KEY (`roleId`) REFERENCES `se_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_role_settings`
--

LOCK TABLES `se_role_settings` WRITE;
/*!40000 ALTER TABLE `se_role_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_role_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_roles`
--

DROP TABLE IF EXISTS `se_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `securitySystem` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idSecurityTypes` int(11) DEFAULT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_13B749A05E237E06` (`name`),
  KEY `IDX_13B749A0D02106C0` (`idSecurityTypes`),
  KEY `IDX_13B749A0DBF11E1D` (`idUsersCreator`),
  KEY `IDX_13B749A030D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_13B749A030D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_13B749A0D02106C0` FOREIGN KEY (`idSecurityTypes`) REFERENCES `se_security_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_13B749A0DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_roles`
--

LOCK TABLES `se_roles` WRITE;
/*!40000 ALTER TABLE `se_roles` DISABLE KEYS */;
INSERT INTO `se_roles` VALUES (1,'User','Sulu','2019-08-26 20:33:26','2019-08-26 20:33:26',NULL,NULL,NULL);
/*!40000 ALTER TABLE `se_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_security_types`
--

DROP TABLE IF EXISTS `se_security_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_security_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_security_types`
--

LOCK TABLES `se_security_types` WRITE;
/*!40000 ALTER TABLE `se_security_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_security_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_user_groups`
--

DROP TABLE IF EXISTS `se_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `idGroups` int(11) DEFAULT NULL,
  `idUsers` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E43ED0C8937C91EA` (`idGroups`),
  KEY `IDX_E43ED0C8347E6F4` (`idUsers`),
  CONSTRAINT `FK_E43ED0C8347E6F4` FOREIGN KEY (`idUsers`) REFERENCES `se_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E43ED0C8937C91EA` FOREIGN KEY (`idGroups`) REFERENCES `se_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_user_groups`
--

LOCK TABLES `se_user_groups` WRITE;
/*!40000 ALTER TABLE `se_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_user_roles`
--

DROP TABLE IF EXISTS `se_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `idUsers` int(11) DEFAULT NULL,
  `idRoles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E48BD9DB347E6F4` (`idUsers`),
  KEY `IDX_E48BD9DBA1FA6DDA` (`idRoles`),
  CONSTRAINT `FK_E48BD9DB347E6F4` FOREIGN KEY (`idUsers`) REFERENCES `se_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E48BD9DBA1FA6DDA` FOREIGN KEY (`idRoles`) REFERENCES `se_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_user_roles`
--

LOCK TABLES `se_user_roles` WRITE;
/*!40000 ALTER TABLE `se_user_roles` DISABLE KEYS */;
INSERT INTO `se_user_roles` VALUES (1,'[\"de\",\"en\"]',1,1);
/*!40000 ALTER TABLE `se_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_user_settings`
--

DROP TABLE IF EXISTS `se_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_user_settings` (
  `settingsValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingsKey` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idUsers` int(11) NOT NULL,
  PRIMARY KEY (`settingsKey`,`idUsers`),
  KEY `IDX_108FCAFA347E6F4` (`idUsers`),
  CONSTRAINT `FK_108FCAFA347E6F4` FOREIGN KEY (`idUsers`) REFERENCES `se_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_user_settings`
--

LOCK TABLES `se_user_settings` WRITE;
/*!40000 ALTER TABLE `se_user_settings` DISABLE KEYS */;
INSERT INTO `se_user_settings` VALUES ('\"4b3d84e3-e06a-4f2a-9f91-05c866b9c68d\"','sulu_admin.list_store.pages.page_list_example.active',1);
/*!40000 ALTER TABLE `se_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_users`
--

DROP TABLE IF EXISTS `se_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `lastLogin` datetime DEFAULT NULL,
  `confirmationKey` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordResetToken` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordResetTokenExpiresAt` datetime DEFAULT NULL,
  `passwordResetTokenEmailsSent` int(11) DEFAULT 0,
  `privateKey` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apiKey` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idContacts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B10AC28EF85E0677` (`username`),
  UNIQUE KEY `UNIQ_B10AC28E60E33F28` (`idContacts`),
  UNIQUE KEY `UNIQ_B10AC28EADC1CD13` (`passwordResetToken`),
  UNIQUE KEY `UNIQ_B10AC28EE7927C74` (`email`),
  CONSTRAINT `FK_B10AC28E60E33F28` FOREIGN KEY (`idContacts`) REFERENCES `co_contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_users`
--

LOCK TABLES `se_users` WRITE;
/*!40000 ALTER TABLE `se_users` DISABLE KEYS */;
INSERT INTO `se_users` VALUES (1,'admin','$2y$13$dzrd0PShHLE344iIvtzqDutuMTvGt2BNWZokhJmv2yTnY0SniV4Ua','en','nccZ+wYMK3///LaIlkvaQI/1KZ4RGejMSWgABVoMhak=',0,1,'2019-08-26 20:33:40',NULL,NULL,NULL,NULL,NULL,'d73c6fe53c5c6eb130d70d512e303d8b','admin@example.com',1);
/*!40000 ALTER TABLE `se_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_tags`
--

DROP TABLE IF EXISTS `ta_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ta_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `idUsersCreator` int(11) DEFAULT NULL,
  `idUsersChanger` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B258E4995E237E06` (`name`),
  KEY `IDX_B258E499DBF11E1D` (`idUsersCreator`),
  KEY `IDX_B258E49930D07CD5` (`idUsersChanger`),
  CONSTRAINT `FK_B258E49930D07CD5` FOREIGN KEY (`idUsersChanger`) REFERENCES `se_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B258E499DBF11E1D` FOREIGN KEY (`idUsersCreator`) REFERENCES `se_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_tags`
--

LOCK TABLES `ta_tags` WRITE;
/*!40000 ALTER TABLE `ta_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ta_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `we_analytics`
--

DROP TABLE IF EXISTS `we_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `we_analytics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webspace_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `all_domains` tinyint(1) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json_array)',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4E50BB8D1640EFD3` (`all_domains`),
  KEY `IDX_4E50BB8DAE248174` (`webspace_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `we_analytics`
--

LOCK TABLES `we_analytics` WRITE;
/*!40000 ALTER TABLE `we_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `we_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `we_analytics_domains`
--

DROP TABLE IF EXISTS `we_analytics_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `we_analytics_domains` (
  `analytics` int(11) NOT NULL,
  `domain` int(11) NOT NULL,
  PRIMARY KEY (`analytics`,`domain`),
  KEY `IDX_F9323B6EEAC2E688` (`analytics`),
  KEY `IDX_F9323B6EA7A91E0B` (`domain`),
  CONSTRAINT `FK_F9323B6EA7A91E0B` FOREIGN KEY (`domain`) REFERENCES `we_domains` (`id`),
  CONSTRAINT `FK_F9323B6EEAC2E688` FOREIGN KEY (`analytics`) REFERENCES `we_analytics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `we_analytics_domains`
--

LOCK TABLES `we_analytics_domains` WRITE;
/*!40000 ALTER TABLE `we_analytics_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `we_analytics_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `we_domains`
--

DROP TABLE IF EXISTS `we_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `we_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `environment` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7CFAB3F5F47645AE` (`url`),
  KEY `IDX_7CFAB3F54626DE22` (`environment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `we_domains`
--

LOCK TABLES `we_domains` WRITE;
/*!40000 ALTER TABLE `we_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `we_domains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-26 20:42:23
