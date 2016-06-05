start transaction;

create database `Acme-Barter2.0`;

use `Acme-Barter2.0`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';

create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete	on `Acme-Barter2.0`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `Acme-Barter2.0`.* to 'acme-manager'@'%';



-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Barter2.0
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (4,0,'Daniel','673543687','673543689','Gonzalez',1);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barter`
--

DROP TABLE IF EXISTS `barter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barter` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `canceled` bit(1) DEFAULT NULL,
  `closeBarter` bit(1) DEFAULT NULL,
  `moment` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `administrator_id` int(11) DEFAULT NULL,
  `itemOffered_id` int(11) NOT NULL,
  `itemRequest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_ovd0t4mv7du1lkdcw70vtdv6u` (`title`),
  KEY `UK_2nu43q63g10007unne2pi62ih` (`canceled`),
  KEY `FK_qmamltjbm22frsus2w3vrxms9` (`administrator_id`),
  KEY `FK_cpv4ip9gk8u3kok1jrne2g64r` (`itemOffered_id`),
  KEY `FK_p6wrrhcq7q0t4j8fwgl2wlitr` (`itemRequest_id`),
  KEY `FK_i3x9l14dpct1ps9l8cpe176ov` (`user_id`),
  CONSTRAINT `FK_i3x9l14dpct1ps9l8cpe176ov` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_cpv4ip9gk8u3kok1jrne2g64r` FOREIGN KEY (`itemOffered_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_p6wrrhcq7q0t4j8fwgl2wlitr` FOREIGN KEY (`itemRequest_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_qmamltjbm22frsus2w3vrxms9` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barter`
--

LOCK TABLES `barter` WRITE;
/*!40000 ALTER TABLE `barter` DISABLE KEYS */;
INSERT INTO `barter` VALUES (18,0,'\0','\0','2016-01-04','barter1',NULL,7,8,5),(19,0,'\0','\0','2016-03-02','barter2',NULL,9,10,6),(20,0,'\0','','2016-02-02','barter3',4,11,12,6),(21,0,'\0','\0','2016-03-02','barter4',NULL,7,8,5),(22,0,'','\0','2016-01-02','barter5',NULL,13,7,5),(23,0,'\0','','2016-01-02','barter6',4,13,8,5),(24,0,'\0','\0','2016-03-02','barter7',NULL,7,13,5),(25,0,'\0','\0','2016-03-08','barter8',NULL,10,12,6),(26,0,'\0','','2016-04-01','barter9',4,12,11,6),(27,0,'\0','\0','2016-03-01','barter10',NULL,12,9,6),(28,0,'\0','','2016-01-02','barter11',4,13,7,5);
/*!40000 ALTER TABLE `barter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barter_complaint`
--

DROP TABLE IF EXISTS `barter_complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barter_complaint` (
  `Barter_id` int(11) NOT NULL,
  `complaints_id` int(11) NOT NULL,
  UNIQUE KEY `UK_cfqiles1oia2ohdxs6unqwp1r` (`complaints_id`),
  KEY `FK_aw2ow40h73w2xtniubwc4cqsg` (`Barter_id`),
  CONSTRAINT `FK_aw2ow40h73w2xtniubwc4cqsg` FOREIGN KEY (`Barter_id`) REFERENCES `barter` (`id`),
  CONSTRAINT `FK_cfqiles1oia2ohdxs6unqwp1r` FOREIGN KEY (`complaints_id`) REFERENCES `complaint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barter_complaint`
--

LOCK TABLES `barter_complaint` WRITE;
/*!40000 ALTER TABLE `barter_complaint` DISABLE KEYS */;
INSERT INTO `barter_complaint` VALUES (18,15),(22,14);
/*!40000 ALTER TABLE `barter_complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f8qlpctuuanticxv4a7m0mthj` (`user_id`),
  CONSTRAINT `FK_f8qlpctuuanticxv4a7m0mthj` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (14,0,'description 1','title 1',5),(15,0,'description 2','title 2',6),(16,0,'description 3','title 3',5),(17,0,'description 4','title 4',6);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_l1kp977466ddsv762wign7kdh` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (42,0,'inbox',4),(43,0,'outbox',4),(44,0,'spambox',4),(45,0,'trashbox',4),(46,0,'inbox',5),(47,0,'outbox',5),(48,0,'spambox',5),(49,0,'trashbox',5),(50,0,'inbox',6),(51,0,'outbox',6),(52,0,'spambox',6),(53,0,'trashbox',6);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `canceled` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_7vricge9ixwbtjv77iqw0si8c` (`canceled`),
  KEY `UK_a5hxmfx1a4325hg0uds5ulqdp` (`name`),
  KEY `UK_e5v2cea418b3qy8uhb4qovh90` (`description`),
  KEY `FK_r540dp19wvjcy00hftuhf3ejp` (`user_id`),
  CONSTRAINT `FK_r540dp19wvjcy00hftuhf3ejp` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (7,0,'\0','item1 description','item1',5),(8,0,'\0','item2 description','item2',5),(9,0,'\0','item3 description','item3',6),(10,0,'\0','item4 description','item4',6),(11,0,'\0','item5 description','item5',6),(12,0,'\0','item6 description','item6',6),(13,0,'\0','item7 description','item7',5);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_barter`
--

DROP TABLE IF EXISTS `item_barter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_barter` (
  `Item_id` int(11) NOT NULL,
  `bartersRequested_id` int(11) NOT NULL,
  `bartersOffered_id` int(11) NOT NULL,
  UNIQUE KEY `UK_mx09329xauy5pi5xipgm0p3j1` (`bartersRequested_id`),
  UNIQUE KEY `UK_7uv1m0ptjg1qctd2ily4mwnop` (`bartersOffered_id`),
  KEY `FK_qev0ftacpr77w0860cr458ph7` (`Item_id`),
  CONSTRAINT `FK_7uv1m0ptjg1qctd2ily4mwnop` FOREIGN KEY (`bartersOffered_id`) REFERENCES `barter` (`id`),
  CONSTRAINT `FK_mx09329xauy5pi5xipgm0p3j1` FOREIGN KEY (`bartersRequested_id`) REFERENCES `barter` (`id`),
  CONSTRAINT `FK_qev0ftacpr77w0860cr458ph7` FOREIGN KEY (`Item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_barter`
--

LOCK TABLES `item_barter` WRITE;
/*!40000 ALTER TABLE `item_barter` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_barter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pictures`
--

DROP TABLE IF EXISTS `item_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pictures` (
  `Item_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_qo3ea4pf194lddsr8jitxod28` (`Item_id`),
  CONSTRAINT `FK_qo3ea4pf194lddsr8jitxod28` FOREIGN KEY (`Item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pictures`
--

LOCK TABLES `item_pictures` WRITE;
/*!40000 ALTER TABLE `item_pictures` DISABLE KEYS */;
INSERT INTO `item_pictures` VALUES (7,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(7,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(8,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(8,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(9,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(9,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(10,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(10,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(11,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(11,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(12,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(12,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(13,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg'),(13,'http://cdn.lopezdoriga.com/wp-content/uploads/2016/01/gim3.jpg');
/*!40000 ALTER TABLE `item_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legaltext`
--

DROP TABLE IF EXISTS `legaltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legaltext` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legaltext`
--

LOCK TABLES `legaltext` WRITE;
/*!40000 ALTER TABLE `legaltext` DISABLE KEYS */;
INSERT INTO `legaltext` VALUES (29,0,'legalText1'),(30,0,'legalText2'),(31,0,'legalText3'),(32,0,'legalText4'),(33,0,'legalText5');
/*!40000 ALTER TABLE `legaltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_`
--

DROP TABLE IF EXISTS `match_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `canceled` bit(1) DEFAULT NULL,
  `closeMatch` bit(1) DEFAULT NULL,
  `momentCreation` date DEFAULT NULL,
  `offerBarterDate` date DEFAULT NULL,
  `requestBarterDate` date DEFAULT NULL,
  `legalText_id` int(11) NOT NULL,
  `offerBarter_id` int(11) NOT NULL,
  `requestBarter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_qvlt4ljm3y5cfsqx1qc4nem64` (`momentCreation`),
  KEY `UK_evpq0jyxi19uu174fartbjxnt` (`offerBarterDate`),
  KEY `UK_mpohq9vsxsdwn96ruiym8ncg` (`requestBarterDate`),
  KEY `UK_c2jg94awllia5lstim4fiya75` (`canceled`),
  KEY `FK_qfi5kjuea95x90t868itrj1qw` (`legalText_id`),
  KEY `FK_5bj4ty66ip0wfdxnijr97o2vk` (`offerBarter_id`),
  KEY `FK_evrhn7g63mgdtnj8tbdkxj820` (`requestBarter_id`),
  CONSTRAINT `FK_evrhn7g63mgdtnj8tbdkxj820` FOREIGN KEY (`requestBarter_id`) REFERENCES `barter` (`id`),
  CONSTRAINT `FK_5bj4ty66ip0wfdxnijr97o2vk` FOREIGN KEY (`offerBarter_id`) REFERENCES `barter` (`id`),
  CONSTRAINT `FK_qfi5kjuea95x90t868itrj1qw` FOREIGN KEY (`legalText_id`) REFERENCES `legaltext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_`
--

LOCK TABLES `match_` WRITE;
/*!40000 ALTER TABLE `match_` DISABLE KEYS */;
INSERT INTO `match_` VALUES (34,0,'\0','','2016-03-02','2016-04-02',NULL,29,18,19),(35,0,'','\0','2016-02-02','2016-02-01',NULL,30,20,21),(36,0,'\0','','2016-03-08','2016-03-10','2016-04-03',29,20,21),(37,0,'\0','\0','2016-02-08',NULL,NULL,33,23,25),(38,0,'\0','\0','2016-04-08',NULL,'2016-04-09',33,24,26);
/*!40000 ALTER TABLE `match_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match__complaint`
--

DROP TABLE IF EXISTS `match__complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match__complaint` (
  `Match_id` int(11) NOT NULL,
  `complaints_id` int(11) NOT NULL,
  UNIQUE KEY `UK_4s2g9niirha6uy6dmq8s56276` (`complaints_id`),
  KEY `FK_al8767qwkoh8m8fophweeuaga` (`Match_id`),
  CONSTRAINT `FK_al8767qwkoh8m8fophweeuaga` FOREIGN KEY (`Match_id`) REFERENCES `match_` (`id`),
  CONSTRAINT `FK_4s2g9niirha6uy6dmq8s56276` FOREIGN KEY (`complaints_id`) REFERENCES `complaint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match__complaint`
--

LOCK TABLES `match__complaint` WRITE;
/*!40000 ALTER TABLE `match__complaint` DISABLE KEYS */;
INSERT INTO `match__complaint` VALUES (35,16),(37,17);
/*!40000 ALTER TABLE `match__complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` date DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `folder_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7t1ls63lqb52igs4ms20cf94t` (`folder_id`),
  CONSTRAINT `FK_7t1ls63lqb52igs4ms20cf94t` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (54,0,'body1','2015-05-12','subject1',43,5,4),(55,0,'body1','2015-05-12','subject1',46,5,4),(56,0,'body','2016-04-12','viagra',47,6,5),(57,0,'body','2016-04-12','viagra',52,6,5),(58,0,'viagra','2015-05-12','subject5',43,5,4),(59,0,'viagra','2015-05-12','subject5',48,5,4),(60,0,'body7','2016-03-08','subject7',51,4,6),(61,0,'body7','2016-03-08','subject7',45,4,6);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialidentity`
--

DROP TABLE IF EXISTS `socialidentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialidentity` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_adc08eqomstl4mtqaecc3c9as` (`user_id`),
  CONSTRAINT `FK_adc08eqomstl4mtqaecc3c9as` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialidentity`
--

LOCK TABLES `socialidentity` WRITE;
/*!40000 ALTER TABLE `socialidentity` DISABLE KEYS */;
INSERT INTO `socialidentity` VALUES (39,0,'user1','socialIdentity1','https://es-es.face.com/','http://www.mastermagazine.info/termino/wp-content/uploads/Usuario-Icono.jpg',5),(40,0,'user2','socialIdentity2','https://twitter.com/?lang=es','http://tn-ar.cdncmd.com/sites/all/themes/leono/images/usertnylgt.svg',6),(41,0,'user1','socialIdentity3','https://www.tumblr.com/','http://www.ivannaobando.com/site/ap_ivanna/img/usuario.png',5);
/*!40000 ALTER TABLE `socialidentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spamword`
--

DROP TABLE IF EXISTS `spamword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spamword` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spamword`
--

LOCK TABLES `spamword` WRITE;
/*!40000 ALTER TABLE `spamword` DISABLE KEYS */;
INSERT INTO `spamword` VALUES (62,0,'viagra'),(63,0,'cialis'),(64,0,'sex'),(65,0,'scort'),(66,0,'money transfe'),(67,0,'lottery'),(68,0,'green card'),(69,0,'email quota'),(70,0,'click here'),(71,0,'spam');
/*!40000 ALTER TABLE `spamword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o6s94d43co03sx067ili5760c` (`userAccount_id`),
  CONSTRAINT `FK_o6s94d43co03sx067ili5760c` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,0,'user1','643543987','673543689','surname1',2),(6,0,'user2','643543987','673543689','surname2',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (1,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(2,0,'24c9e15e52afc47c225b757e7bee1f9d','user1'),(3,0,'7e58d63b60197ceb55a1c487989a3720','user2');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (1,'ADMIN'),(2,'USER'),(3,'USER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-06 12:04:43


commit;