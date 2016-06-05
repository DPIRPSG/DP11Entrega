start transaction;

create database `Acme-Barter`;

use `Acme-Barter`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';

create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete on `Acme-Barter`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, create temporary tables, lock tables, create view, create routine, alter routine, execute, trigger, show view on `Acme-Barter`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Barter
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
  `surname` varchar(255) DEFAULT NULL,
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
INSERT INTO `administrator` VALUES (16,0,'Miguel','666777888','Rodriguez',1),(17,0,'Carlos Alberto','682541397','Gil',15);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (199,0,'color'),(200,0,'size'),(201,0,'type'),(202,0,'power'),(203,0,'warranty'),(204,0,'use time');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributedescription`
--

DROP TABLE IF EXISTS `attributedescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributedescription` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `attribute_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r9ueubjva9twdn8fbio6ks452` (`attribute_id`),
  KEY `FK_inpf5n3y1a3k989dbb31pfhw2` (`item_id`),
  CONSTRAINT `FK_inpf5n3y1a3k989dbb31pfhw2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_r9ueubjva9twdn8fbio6ks452` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributedescription`
--

LOCK TABLES `attributedescription` WRITE;
/*!40000 ALTER TABLE `attributedescription` DISABLE KEYS */;
INSERT INTO `attributedescription` VALUES (205,0,'blue',199,124),(206,0,'black',199,124),(207,0,'big',200,124),(208,0,'hp',201,124),(209,0,'i5',202,124),(210,0,'2 years',204,124),(211,0,'magenta',199,125),(212,0,'new',204,126);
/*!40000 ALTER TABLE `attributedescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_img3kaubb62u0h0jujkh1tejo` (`userAccount_id`),
  KEY `UK_avdstpil73shpg9jh6od6wvci` (`name`),
  KEY `UK_ffq9bbqe5yv7qn1njy8k6cbpr` (`surname`),
  CONSTRAINT `FK_img3kaubb62u0h0jujkh1tejo` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (18,0,'Pablo','652148745','López',6),(19,0,'Antonio','630157841','Serrano',7),(20,0,'Jose','632112358','Ruiz',8),(21,0,'Rocío','674185293','Cuesta',9),(22,0,'Verónica','693852741','Gil',10),(23,0,'Carlos','622852741','Mata',11);
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreply`
--

DROP TABLE IF EXISTS `autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreply` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreply`
--

LOCK TABLES `autoreply` WRITE;
/*!40000 ALTER TABLE `autoreply` DISABLE KEYS */;
INSERT INTO `autoreply` VALUES (190,0,'¡Vendo un Ford Fiesta Rojo! Contesta a este mensaje si te interesa.',30),(191,0,'¡Cambio consolas! Las vendo o cambio por móviles, portátiles... Acepto ofertas.',30),(192,0,'Si tienes cualquier tipo de moto me interesa, soy coleccionista.',30),(193,0,'Lo siento, no vendo nada, sólo acepto intercambios.',30),(194,0,'Estoy decorando mi jardín, así que si tienes flores y te interesa algçun artículo de mi perfil avísame.',30),(195,0,'¡NO vendo oro! ¡Ya basta!',30),(196,0,'Lo siento, no compro ni intercambio nada por comida en internet.',24),(197,0,'Tengo un portátil HP con un i5 de hace 2 años, mira mi perfil y avisa si te interesa.',24),(198,0,'Gracias, muy amable :)',25);
/*!40000 ALTER TABLE `autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreply_keywords`
--

DROP TABLE IF EXISTS `autoreply_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreply_keywords` (
  `Autoreply_id` int(11) NOT NULL,
  `keyWords` varchar(255) DEFAULT NULL,
  KEY `FK_5gpbg7focj04iofcr4x9ygwx1` (`Autoreply_id`),
  CONSTRAINT `FK_5gpbg7focj04iofcr4x9ygwx1` FOREIGN KEY (`Autoreply_id`) REFERENCES `autoreply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreply_keywords`
--

LOCK TABLES `autoreply_keywords` WRITE;
/*!40000 ALTER TABLE `autoreply_keywords` DISABLE KEYS */;
INSERT INTO `autoreply_keywords` VALUES (190,'coche'),(190,'rojo'),(191,'xbox'),(191,'playstation'),(191,'nintendo'),(191,'wii'),(191,'ds'),(192,'moto'),(193,'compro'),(194,'flor'),(194,'flores'),(194,'orquídeas'),(194,'rosas'),(195,'compro'),(195,'oro'),(196,'comida'),(197,'portatil'),(197,'pc'),(197,'ordenador'),(198,'hola'),(198,'saludos'),(198,'bienvenido');
/*!40000 ALTER TABLE `autoreply_keywords` ENABLE KEYS */;
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
  `cancelled` bit(1) NOT NULL,
  `closed` bit(1) NOT NULL,
  `registerMoment` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `administrator_id` int(11) DEFAULT NULL,
  `offered_id` int(11) NOT NULL,
  `requested_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nqjsw6o9p0r779e595c8mksmr` (`offered_id`),
  UNIQUE KEY `UK_gkaec90s2mtteti23so9di9dm` (`requested_id`),
  KEY `UK_nhmhxf9yweyocubkbdvufgr89` (`cancelled`),
  KEY `UK_ovd0t4mv7du1lkdcw70vtdv6u` (`title`),
  KEY `FK_qmamltjbm22frsus2w3vrxms9` (`administrator_id`),
  KEY `FK_i3x9l14dpct1ps9l8cpe176ov` (`user_id`),
  CONSTRAINT `FK_i3x9l14dpct1ps9l8cpe176ov` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_gkaec90s2mtteti23so9di9dm` FOREIGN KEY (`requested_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_nqjsw6o9p0r779e595c8mksmr` FOREIGN KEY (`offered_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_qmamltjbm22frsus2w3vrxms9` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barter`
--

LOCK TABLES `barter` WRITE;
/*!40000 ALTER TABLE `barter` DISABLE KEYS */;
INSERT INTO `barter` VALUES (156,0,'\0','\0','2016-01-12 12:30:00','Te lo cambio',NULL,124,125,30),(157,0,'\0','','2016-03-10 11:00:00','¡¡Intercambio urgente!!',16,126,127,24),(158,0,'\0','\0','2016-03-01 17:15:00','Acepto ofertas',NULL,128,129,25),(159,0,'','\0','2015-12-03 12:00:00','¡Que me lo quitan de las manos!',NULL,130,131,30),(160,0,'\0','','2016-02-02 02:00:00','Lo cambio por este o cualquier otro portatil de las mismas características',NULL,132,133,24),(161,0,'\0','','2016-02-11 16:10:00','Solo hasta Junio o lo vendo a mi vecino',16,134,135,25),(162,0,'\0','\0','2016-01-12 12:30:00','No lo cambio',NULL,136,137,24),(163,0,'\0','\0','2016-01-12 12:30:00','Quiero otro PC',NULL,138,139,30),(164,0,'\0','\0','2016-01-12 12:30:00','Quiero otro Portátil',NULL,141,140,24),(165,0,'\0','','2016-01-12 12:30:00','Quiero otro Móvil',17,143,142,24),(166,0,'\0','\0','2016-01-12 12:30:00','Busco guitarra',NULL,145,144,30),(167,0,'\0','\0','2016-01-12 12:30:00','Busco otro bajo',NULL,146,147,24),(168,0,'\0','\0','2016-04-24 12:30:00','Cambio de consola',NULL,149,148,24);
/*!40000 ALTER TABLE `barter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barter_barter`
--

DROP TABLE IF EXISTS `barter_barter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barter_barter` (
  `Barter_id` int(11) NOT NULL,
  `relatedBarter_id` int(11) NOT NULL,
  KEY `FK_jdddda5iuepxoso7fy0be6lvg` (`relatedBarter_id`),
  KEY `FK_bhi2aehwte3r1vxv6543xp4c6` (`Barter_id`),
  CONSTRAINT `FK_bhi2aehwte3r1vxv6543xp4c6` FOREIGN KEY (`Barter_id`) REFERENCES `barter` (`id`),
  CONSTRAINT `FK_jdddda5iuepxoso7fy0be6lvg` FOREIGN KEY (`relatedBarter_id`) REFERENCES `barter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barter_barter`
--

LOCK TABLES `barter_barter` WRITE;
/*!40000 ALTER TABLE `barter_barter` DISABLE KEYS */;
INSERT INTO `barter_barter` VALUES (157,156),(160,159),(161,160),(164,162),(164,163);
/*!40000 ALTER TABLE `barter_barter` ENABLE KEYS */;
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
  `text` varchar(255) DEFAULT NULL,
  `barter_id` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3fpo6up1j6sr3w0i8g8tn5w49` (`barter_id`),
  KEY `FK_1jri0rj8y7tfvficsl9lj3ai5` (`match_id`),
  KEY `FK_f8qlpctuuanticxv4a7m0mthj` (`user_id`),
  CONSTRAINT `FK_f8qlpctuuanticxv4a7m0mthj` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_1jri0rj8y7tfvficsl9lj3ai5` FOREIGN KEY (`match_id`) REFERENCES `matchtable` (`id`),
  CONSTRAINT `FK_3fpo6up1j6sr3w0i8g8tn5w49` FOREIGN KEY (`barter_id`) REFERENCES `barter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (175,0,'Pero esto qué es?!',156,NULL,30),(176,0,'No es lo que esperaba',156,NULL,30),(177,0,'No tiene sentido esto...',156,NULL,24),(178,0,'Mmm... ¿En serio cambias esto?',156,NULL,25),(179,0,'¡Está intentando engañaros!',156,NULL,26),(180,0,'¡Demasiado barato! Seguro que es mentira...',156,NULL,28),(181,0,'¡Poco creíble!...',NULL,169,30),(182,0,'¡Poco creíble!...',NULL,169,24),(183,0,'¡Poco creíble!...',NULL,169,24),(184,0,'¡Poco creíble!...',NULL,169,30),(185,0,'¡Poco creíble!...',NULL,169,24),(186,0,'¡Poco creíble!...',NULL,169,24),(187,0,'¡Poco creíble!...',NULL,170,25),(188,0,'¡Poco creíble!...',NULL,171,24),(189,0,'¡Poco creíble!...',157,NULL,25);
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
  `isSystem` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_l1kp977466ddsv762wign7kdh` (`name`),
  KEY `UK_a5prtxr1c0vwoxbpixtnse2nq` (`isSystem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (40,0,'','InBox',16),(41,0,'','OutBox',16),(42,0,'','TrashBox',16),(43,0,'','SpamBox',16),(44,0,'','InBox',30),(45,0,'','OutBox',30),(46,0,'','TrashBox',30),(47,0,'','SpamBox',30),(48,0,'','InBox',24),(49,0,'','OutBox',24),(50,0,'','TrashBox',24),(51,0,'','SpamBox',24),(52,0,'','InBox',25),(53,0,'','OutBox',25),(54,0,'','TrashBox',25),(55,0,'','SpamBox',25),(56,0,'','InBox',26),(57,0,'','OutBox',26),(58,0,'','TrashBox',26),(59,0,'','SpamBox',26),(60,0,'','InBox',18),(61,0,'','OutBox',18),(62,0,'','TrashBox',18),(63,0,'','SpamBox',18),(64,0,'','InBox',19),(65,0,'','OutBox',19),(66,0,'','TrashBox',19),(67,0,'','SpamBox',19),(68,0,'','InBox',20),(69,0,'','OutBox',20),(70,0,'','TrashBox',20),(71,0,'','SpamBox',20),(72,0,'','InBox',21),(73,0,'','OutBox',21),(74,0,'','TrashBox',21),(75,0,'','SpamBox',21),(76,0,'','InBox',22),(77,0,'','OutBox',22),(78,0,'','TrashBox',22),(79,0,'','SpamBox',22),(80,0,'','InBox',23),(81,0,'','OutBox',23),(82,0,'','TrashBox',23),(83,0,'','SpamBox',23),(84,0,'\0','MyBox',30),(85,0,'','InBox',27),(86,0,'','OutBox',27),(87,0,'','TrashBox',27),(88,0,'','SpamBox',27),(89,0,'','InBox',28),(90,0,'','OutBox',28),(91,0,'','TrashBox',28),(92,0,'','SpamBox',28),(93,0,'\0','MyBox2',30),(94,0,'','InBox',29),(95,0,'','OutBox',29),(96,0,'','TrashBox',29),(97,0,'','SpamBox',29),(98,0,'','Auto-reply box',16),(99,0,'','Auto-reply box',18),(100,0,'','Auto-reply box',19),(101,0,'','Auto-reply box',20),(102,0,'','Auto-reply box',21),(103,0,'','Auto-reply box',22),(104,0,'','Auto-reply box',23),(105,0,'','Auto-reply box',30),(106,0,'','Auto-reply box',24),(107,0,'','Auto-reply box',25),(108,0,'','Auto-reply box',26),(109,0,'','Auto-reply box',27),(110,0,'','Auto-reply box',28),(111,0,'','Auto-reply box',29),(112,0,'','InBox',17),(113,0,'','OutBox',17),(114,0,'','TrashBox',17),(115,0,'','SpamBox',17),(116,0,'','Auto-reply box',17);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_message`
--

DROP TABLE IF EXISTS `folder_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder_message` (
  `folders_id` int(11) NOT NULL,
  `messages_id` int(11) NOT NULL,
  KEY `FK_5nh3mwey9bw25ansh2thcbcdh` (`messages_id`),
  KEY `FK_o1e2m8i8khapsgpd6jg28dr7e` (`folders_id`),
  CONSTRAINT `FK_o1e2m8i8khapsgpd6jg28dr7e` FOREIGN KEY (`folders_id`) REFERENCES `folder` (`id`),
  CONSTRAINT `FK_5nh3mwey9bw25ansh2thcbcdh` FOREIGN KEY (`messages_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_message`
--

LOCK TABLES `folder_message` WRITE;
/*!40000 ALTER TABLE `folder_message` DISABLE KEYS */;
INSERT INTO `folder_message` VALUES (41,31),(44,31),(44,35),(44,36),(44,37),(44,38),(44,39),(46,31),(47,32),(47,33),(48,31),(49,34),(49,35),(49,36),(49,37),(49,38),(49,39),(52,31),(55,34),(56,31),(57,32),(57,33);
/*!40000 ALTER TABLE `folder_message` ENABLE KEYS */;
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
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_a5hxmfx1a4325hg0uds5ulqdp` (`name`),
  KEY `UK_e5v2cea418b3qy8uhb4qovh90` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (124,0,'Es normalillo, pero corre bien el Minecraft.','Portatil HP'),(125,0,'El PORTÁTIL más versatil del mercado.','Surface Pro 4'),(126,0,'Bueno... es lo que tengo.','iPhone'),(127,0,'Cualquier me vale si se pueden ver vídeo de YouTube en 1080p.','Tablet Android'),(128,0,'Para dormir las siestas está de lujo, si te cabe en el coche yo me la llevo hasta al campo.','Cama plegable'),(129,0,'Ahora con los niños necesito una litera, con protector para la cama de arriba a ser posible.','Litera'),(130,0,'Del 2001, como nuevo. El maletero no cierra bien, por lo demás perfecto.','Ford Fiesta'),(131,0,'A ser posible negro, pago la diferencia en efectivo en el momento del intercambio.','Seat León'),(132,0,'Rapido! Te he propuesto emparejamiento para que lo veas! Antes de que me pillen los Auditores!!','VENDO GATOS'),(133,0,'Rapido! Te he propuesto emparejamiento para que lo veas!  Antes de que me pillen los Auditores!!','VENDO GATOS'),(134,0,'Clean your house in only 1 hour!','Amazing Turbo Cleaner'),(135,0,'Any laptop bought in 2015 is fine for me.','Any laptop bought in 2015'),(136,0,'Es normalillo, pero corre bien el Minecraft.','Portatil HP'),(137,0,'El PORTÁTIL más versatil del mercado.','Surface Pro 4'),(138,0,'Portátil marca HP','PC HP'),(139,0,'Portátil marca Asus','PC Asus'),(140,0,'Portátil marca HP','Portátil HP'),(141,0,'Portátil marca Asus','Portátil Asus'),(142,0,'Quiero un iPhone','iPhone'),(143,0,'Ofrezco un nexus','Nexus'),(144,0,'Guitarra eléctrica','Guitarra'),(145,0,'Bajo en buenas condiciones','Bajo'),(146,0,'Guitarra eléctrica bastante buena','Guitarra'),(147,0,'Quiero un bajo que vaya bien','Bajo'),(148,0,'Quiero una PS4 en buenas condiciones','PS4'),(149,0,'Consola en buenas condiciones','Xbox One');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
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
INSERT INTO `item_pictures` VALUES (124,'http://imagenes.pccomponentes.com/hp_g62_b67es_p6100_4gb_500gb_ati_hd5470_15_6__1.jpg'),(125,'http://dri1.img.digitalrivercontent.net/Storefront/Company/msintl/images/English/en-INTL-Surface-Pro4-SU3-00001/PDP/en-INTL-PDP0-Surface-Pro4-SU3-00001-P1.jpg'),(125,'http://dri1.img.digitalrivercontent.net/Storefront/Company/msintl/images/English/en-INTL-Surface-Pro4-SU3-00001/en-INTL-L-Surface-Pro4-SU3-00001-RM3-mnco.jpg'),(126,'http://laseptimaentrevista.com/wp-content/uploads/2014/09/pantalla-completa-iphone-5-blanca-lcd-digitalizador-home-cam-8764-MLM20007595312_112013-O.jpg'),(128,'http://www.practiletto.com/33-thickbox_default/cama-plegable.jpg'),(128,'http://www.decoestilo.com/wp-content/uploads/2013/09/camas_invitados_3.jpg'),(136,'http://imagenes.pccomponentes.com/hp_g62_b67es_p6100_4gb_500gb_ati_hd5470_15_6__1.jpg'),(137,'http://dri1.img.digitalrivercontent.net/Storefront/Company/msintl/images/English/en-INTL-Surface-Pro4-SU3-00001/PDP/en-INTL-PDP0-Surface-Pro4-SU3-00001-P1.jpg'),(137,'http://dri1.img.digitalrivercontent.net/Storefront/Company/msintl/images/English/en-INTL-Surface-Pro4-SU3-00001/en-INTL-L-Surface-Pro4-SU3-00001-RM3-mnco.jpg');
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
INSERT INTO `legaltext` VALUES (150,0,'Queda sujeto a las condiciones del creador del Emparejamiento, aunque Acme Barter Inc. (y cualquiera de sus auditores) se reserva el derecho de controlar y/o cancelar cualquier intercambio sin previo aviso.'),(151,0,'Queda sujeto a las condiciones del receptor del Emparejamiento, aunque Acme Barter Inc. (y cualquiera de sus auditores) se reserva el derecho de controlar y/o cancelar cualquier intercambio sin previo aviso.'),(152,0,'Queda sujeto a las condiciones del auditor del Emparejamiento, Acme Barter Inc. (y cualquiera de sus auditores) se reserva el derecho de controlar y/o cancelar cualquier intercambio sin previo aviso.'),(153,0,'Una vez firmado por el creador, ninguna de las partes debe cancelarlo o podrá ser denunciado por la otra parte si esta así lo cree conveniente.'),(154,0,'Una vez firmado por el receptor, ninguna de las partes debe cancelarlo o podrá ser denunciado por la otra parte si esta así lo cree conveniente.'),(155,0,'Una vez reportado por un auditor, ninguna de las partes debe cancelarlo o podrá ser denunciado por la otra parte si esta así lo cree conveniente.');
/*!40000 ALTER TABLE `legaltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchtable`
--

DROP TABLE IF EXISTS `matchtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchtable` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cancelled` bit(1) NOT NULL,
  `closed` bit(1) NOT NULL,
  `creationMoment` datetime DEFAULT NULL,
  `offerSignsDate` datetime DEFAULT NULL,
  `report` varchar(255) DEFAULT NULL,
  `requestSignsDate` datetime DEFAULT NULL,
  `auditor_id` int(11) DEFAULT NULL,
  `creatorBarter_id` int(11) NOT NULL,
  `legalText_id` int(11) NOT NULL,
  `receiverBarter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_8qajp42lj3mgojwx6j4rqotei` (`cancelled`),
  KEY `UK_6ybp7okmtt5jq86396gbfo9l5` (`offerSignsDate`),
  KEY `UK_geyl7kc6p1yg4f80j6utkr7en` (`requestSignsDate`),
  KEY `UK_7s7m5nvq7fmppfg5gp4433b0l` (`creationMoment`),
  KEY `FK_jt2ge3spcdoxqgh059m99kfmj` (`auditor_id`),
  KEY `FK_74whxtgpokd7xu1w4w2squbxq` (`creatorBarter_id`),
  KEY `FK_ej5aiqrpwye7pq0fpkdb9sjw5` (`legalText_id`),
  KEY `FK_f6n74hxs4liwyueaeuec7mwwv` (`receiverBarter_id`),
  CONSTRAINT `FK_f6n74hxs4liwyueaeuec7mwwv` FOREIGN KEY (`receiverBarter_id`) REFERENCES `barter` (`id`),
  CONSTRAINT `FK_74whxtgpokd7xu1w4w2squbxq` FOREIGN KEY (`creatorBarter_id`) REFERENCES `barter` (`id`),
  CONSTRAINT `FK_ej5aiqrpwye7pq0fpkdb9sjw5` FOREIGN KEY (`legalText_id`) REFERENCES `legaltext` (`id`),
  CONSTRAINT `FK_jt2ge3spcdoxqgh059m99kfmj` FOREIGN KEY (`auditor_id`) REFERENCES `auditor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchtable`
--

LOCK TABLES `matchtable` WRITE;
/*!40000 ALTER TABLE `matchtable` DISABLE KEYS */;
INSERT INTO `matchtable` VALUES (169,0,'\0','\0','2016-04-01 12:00:00','2016-04-02 13:30:00','Me parece apropiado.','2016-04-02 18:30:00',18,156,150,157),(170,0,'\0','','2016-03-02 10:00:00','2016-04-03 14:30:00',NULL,NULL,NULL,158,151,159),(171,0,'\0','\0','2016-03-03 12:00:00',NULL,'Posiblemente inadecuado, estar pendiente de sus Matchs.','2016-03-03 16:13:00',20,160,150,161),(172,0,'','\0','2016-04-05 14:00:00','2016-04-06 13:30:00','Quitar de inmediato.','2016-04-07 20:00:00',20,160,150,161),(173,0,'','\0','2016-03-05 14:00:00',NULL,NULL,NULL,NULL,166,150,167),(174,0,'\0','','2016-03-05 14:00:00',NULL,NULL,NULL,NULL,166,150,167);
/*!40000 ALTER TABLE `matchtable` ENABLE KEYS */;
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
  `sentMoment` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (31,0,'Registrado con exito, bienvenido a Acme-Barter','2015-10-13 22:15:00','Bienvenido',16),(32,0,'Compra viagra','2016-02-05 22:15:00','Hola',26),(33,0,'Esto es spam','2016-02-05 22:15:00','Hola',26),(34,0,'Esto es spam','2016-02-05 22:15:00','Hola',24),(35,0,'Este es mi mensaje 2 para ti','2016-02-05 22:15:00','Mi mensaje 2',30),(36,0,'Este es mi mensaje 3 para ti','2016-02-05 22:15:00','Mi mensaje 3',30),(37,0,'Este es mi mensaje 4 para ti','2016-02-05 22:15:00','Mi mensaje 4',30),(38,0,'Este es mi mensaje 5 para ti','2016-02-05 22:15:00','Mi mensaje 5',24),(39,0,'Este es mi mensaje 6 para ti','2016-02-05 22:15:00','Mi mensaje 6',24);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_actor`
--

DROP TABLE IF EXISTS `message_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_actor` (
  `received_id` int(11) NOT NULL,
  `recipients_id` int(11) NOT NULL,
  KEY `FK_s15b8cpmjbq3qqa55fool5tp7` (`received_id`),
  CONSTRAINT `FK_s15b8cpmjbq3qqa55fool5tp7` FOREIGN KEY (`received_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_actor`
--

LOCK TABLES `message_actor` WRITE;
/*!40000 ALTER TABLE `message_actor` DISABLE KEYS */;
INSERT INTO `message_actor` VALUES (31,30),(31,24),(31,25),(31,26),(32,30),(33,30),(34,25),(35,24),(36,24),(37,24),(38,30),(39,30);
/*!40000 ALTER TABLE `message_actor` ENABLE KEYS */;
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
  `homePage` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
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
INSERT INTO `socialidentity` VALUES (117,0,'http://www.twitter.com/Manolo','Manolo','@Manolo','http://1.bp.blogspot.com/-BB4biccPxuM/VquRIDFbBRI/AAAAAAAAJX8/v0sfOPr3R40/s1600-r/yo%2B2.png',30),(118,0,'http://www.facebook.com/ManoloLopez','Manolo López','ManoloLopez','http://www.codigo.pe/wp-content/uploads/2012/11/Minigote.jpg',30),(119,0,'http://plus.google.com/Manolo','Manolo','Manolo+','http://www.codigo.pe/wp-content/uploads/2012/11/Minigote.jpg',30),(120,0,'http://www.linkedin.com/Manolo','Manolo','ManoloLopez','http://www.codigo.pe/wp-content/uploads/2012/11/Minigote.jpg',30),(121,0,'http://www.instagram.com/Manolo','Manolo','ManoloLopez','http://www.codigo.pe/wp-content/uploads/2012/11/Minigote.jpg',30),(122,0,'http://www.weongame.com/Manolo','Manolo','ManoloLopez','http://www.codigo.pe/wp-content/uploads/2012/11/Minigote.jpg',30),(123,0,'http://www.instagram.com/RubenSanchez','Ruben','RubenSanchez','https://pbs.twimg.com/profile_images/1361012701/monigote_400x400.jpg',24);
/*!40000 ALTER TABLE `socialidentity` ENABLE KEYS */;
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
  `surname` varchar(255) DEFAULT NULL,
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
INSERT INTO `user` VALUES (24,0,'Ruben','612342289','Sanchez',3),(25,0,'Guillermo','633422897','Alcala',4),(26,0,'Mónica','626667791','Ordóñez',5),(27,0,'Carlos','662554778','Mata',12),(28,0,'Miguel','699332542','Rodríguez',13),(29,0,'Pepito','612453587','Perez',14),(30,0,'Manolo','612345789','Lopez',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `User_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL,
  KEY `FK_fkljans6a6pux89xnqbfcw3ho` (`followed_id`),
  KEY `FK_nlnx78x3m38aq2r86t1d5eio1` (`User_id`),
  CONSTRAINT `FK_nlnx78x3m38aq2r86t1d5eio1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_fkljans6a6pux89xnqbfcw3ho` FOREIGN KEY (`followed_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (25,24),(26,24),(26,25),(27,24),(28,24),(29,24),(30,24),(30,25),(30,26),(30,27),(30,28),(30,29);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
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
INSERT INTO `useraccount` VALUES (1,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(2,0,'24c9e15e52afc47c225b757e7bee1f9d','user1'),(3,0,'7e58d63b60197ceb55a1c487989a3720','user2'),(4,0,'92877af70a45fd6a2ed7fe81e1236b78','user3'),(5,0,'3f02ebe3d7929b091e3d8ccfde2f3bc6','user4'),(6,0,'175d2e7a63f386554a4dd66e865c3e14','auditor1'),(7,0,'04dd94ba3212ac52ad3a1f4cbfb52d4f','auditor2'),(8,0,'fc2073dbe4f65dfd71e46602f8e6a5f3','auditor3'),(9,0,'6cc8affcba51a854192a33af68c08f49','auditor4'),(10,0,'3775bf00262284e83013c9cea5f41431','auditor5'),(11,0,'5d78d53d65022ce05a759cd3c057782e','auditor6'),(12,0,'0a791842f52a0acfbb3a783378c066b8','user5'),(13,0,'affec3b64cf90492377a8114c86fc093','user6'),(14,0,'3e0469fb134991f8f75a2760e409c6ed','user7'),(15,0,'c84258e9c39059a89ab77d846ddab909','admin2');
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
INSERT INTO `useraccount_authorities` VALUES (1,'ADMIN'),(2,'USER'),(3,'USER'),(4,'USER'),(5,'USER'),(6,'AUDITOR'),(7,'AUDITOR'),(8,'AUDITOR'),(9,'AUDITOR'),(10,'AUDITOR'),(11,'AUDITOR'),(12,'USER'),(13,'USER'),(14,'USER'),(15,'ADMIN');
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

-- Dump completed on 2016-05-03 11:22:52

commit;