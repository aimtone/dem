-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dem
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actividad` varchar(1000) NOT NULL,
  `id_tipo_tribunal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'JUICIO DE PRESENTACION',1,1,'2017-07-01 14:50:38'),(2,'JUICIO DE CONTROL',2,1,'2017-07-01 14:50:38'),(3,'JUICIO 2',3,1,'2017-07-01 14:51:25'),(4,'JUICIO 3D',1,1,'2017-07-01 14:51:17');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acto`
--

DROP TABLE IF EXISTS `acto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` text,
  `fin` text,
  `titulo` varchar(5000) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_sala` int(11) NOT NULL DEFAULT '0',
  `id_tribunal` int(11) NOT NULL DEFAULT '0',
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-05-24T12:00:00','2017-05-24T17:30:00','hla','hla',2,0,1,'2017-05-23 20:52:26'),(2,'2017-05-24T09:00:00','2017-05-24T18:00:00','My Event 2','My Event 2',11,0,1,'2017-05-24 12:39:37'),(3,'2017-05-24T09:30:00','2017-05-24T18:00:00','My Event 4','My Event 4',7,0,1,'2017-05-24 12:40:31'),(4,'2017-05-24T08:30:00','2017-05-24T09:30:00','nuevo','nuevo',2,0,1,'2017-05-24 02:25:30'),(5,'2017-05-24T13:00:00','2017-05-24T17:00:00','giola','giola',3,0,1,'2017-05-24 12:39:41'),(6,'2017-05-24T14:30:00','2017-05-24T18:00:00','haia','haia',4,0,1,'2017-05-24 02:25:25'),(7,'2017-05-24T14:30:00','2017-05-24T19:30:00','hola','hola',40,0,1,'2017-05-24 14:44:52'),(8,'2017-05-23T08:30:00','2017-05-23T10:30:00','My Event 1','My Event 1',2,0,1,'2017-05-24 02:25:38'),(9,'2017-05-23T10:00:00','2017-05-23T12:00:00','My Event 1','My Event 1',3,0,1,'2017-05-24 02:25:41'),(10,'2017-05-23T10:30:00','2017-05-23T12:30:00','My Event 4','My Event 4',4,0,1,'2017-05-24 02:25:43'),(11,'2017-05-23T10:00:00','2017-05-23T12:00:00','My Event 5','My Event 5',6,0,1,'2017-05-24 02:25:48'),(12,'2017-05-25T10:00:00','2017-05-25T14:00:00','hola','hola',2,0,1,'2017-05-24 14:29:54'),(13,'2017-05-25T10:30:00','2017-05-25T17:00:00','audenciuan presentaion','audenciuan presentaion',41,0,1,'2017-05-25 19:15:33'),(14,'2017-05-24T12:00:00','2017-05-24T19:30:00','sfkfdkjshfkdjh','sfkfdkjshfkdjh',12,0,1,'2017-05-24 12:52:52'),(15,'2017-05-24T09:00:00','2017-05-24T09:30:00','dd','dd',7,0,1,'2017-05-24 12:42:05'),(16,'2017-05-24T10:00:00','2017-05-24T12:00:00','My Event 5','My Event 5',3,0,1,'2017-05-24 12:42:28'),(17,'2017-05-24T09:30:00','2017-05-24T11:30:00','My Event 5','My Event 5',6,0,1,'2017-05-24 12:45:28'),(18,'2017-05-24T13:00:00','2017-05-24T15:30:00','fhdhjf','fhdhjf',6,0,1,'2017-05-24 12:49:17'),(19,'2017-05-25T08:30:00','2017-05-25T16:30:00','hsghgshasa','hsghgshasa',3,0,1,'2017-05-25 19:14:56'),(20,'2017-05-25T09:00:00','2017-05-25T16:30:00','wffdf','wffdf',4,0,1,'2017-05-25 19:14:32'),(21,'2017-05-24T12:00:00','2017-05-24T14:00:00','My Event 5','My Event 5',40,0,1,'2017-05-24 14:32:47'),(22,'2017-05-27T09:30:00','2017-05-27T11:30:00','My Event 1','My Event 1',41,0,1,'2017-05-25 19:15:48'),(23,'2017-05-27T08:30:00','2017-05-27T14:00:00','My Event 3','My Event 3',40,0,1,'2017-05-25 19:16:37'),(24,'2017-05-27T09:00:00','2017-05-27T14:30:00','My Event 3','My Event 3',3,0,1,'2017-05-27 00:13:41'),(25,'2017-05-25T08:00:00','2017-05-25T10:00:00','My Event 2','My Event 2',2,0,1,'2017-05-25 19:19:51'),(26,'2017-05-25T14:30:00','2017-05-25T16:30:00','My Event 5','My Event 5',2,0,1,'2017-05-25 19:21:07'),(27,'2017-05-25T17:00:00','2017-05-25T19:00:00','My Event 1','My Event 1',3,0,1,'2017-05-25 19:21:09'),(28,'2017-05-25T17:00:00','2017-05-25T19:00:00','My Event 1','My Event 1',4,0,1,'2017-05-25 19:21:14'),(29,'2017-05-25T10:30:00','2017-05-25T12:30:00','My Event 5','My Event 5',6,0,1,'2017-05-25 19:21:23'),(30,'2017-05-25T09:30:00','2017-05-25T11:30:00','My Event 4','My Event 4',12,0,1,'2017-05-25 19:21:25'),(31,'2017-05-26T09:30:00','2017-05-26T16:30:00','USUSUSUS','UDUDUDUDUDUD',2,0,1,'2017-05-25 21:53:28'),(32,'2017-05-26T13:00:00','2017-05-26T20:00:00','HAHAHAHHA','HAHAHAHHA',6,0,1,'2017-05-27 03:42:26'),(33,'2017-05-28T08:00:00','2017-05-28T13:00:00','NUEVO EVENTO','NUEVO EVENTO',2,0,1,'2017-05-27 14:13:31'),(34,'2017-05-26T09:00:00','2017-05-26T15:00:00','AUDIENCIA DE PRESENTACION DE JULIO PEREZ','AUDIENCIA DE PRESENTACION DE JULIO PEREZ',4,0,1,'2017-05-27 01:51:36'),(35,'2017-05-28T08:00:00','2017-05-28T13:30:00','ss','ss',3,0,1,'2017-05-27 14:13:33'),(36,'2017-05-27T10:00:00','2017-05-27T12:00:00','My Event 3','My Event 3',4,0,1,'2017-05-27 00:13:46'),(37,'2017-05-28T08:30:00','2017-05-28T10:30:00','My Event 2','My Event 2',0,0,1,'2017-05-27 00:09:21'),(38,'2017-05-27T09:30:00','2017-05-27T14:30:00','titulo evento','descripcion',6,0,1,'2017-05-27 01:21:02'),(39,'2017-05-26T11:30:00','2017-05-26T12:00:00','ddd','sdsd',6,0,1,'2017-05-27 01:33:07'),(40,'2017-05-26T09:00:00','2017-05-26T09:30:00','nueva','byecaa',3,0,1,'2017-05-27 02:22:02'),(41,'2017-05-26T11:30:00','2017-05-26T16:00:00','nuevi evento','programadr',3,0,1,'2017-05-27 02:22:26'),(42,'2017-05-28T08:00:00','2017-05-28T17:00:00','TITULO 20','JDJDJDJD',4,0,1,'2017-05-27 14:13:45'),(43,'2017-05-27T11:30:00','2017-05-27T12:00:00','dd','dd',2,0,1,'2017-05-27 14:20:40'),(44,'2017-05-28T10:30:00','2017-05-28T17:30:00','s','s',7,0,1,'2017-05-28 23:55:07'),(45,'2017-05-27T13:00:00','2017-05-27T16:30:00','HOLA','HOLA',4,0,1,'2017-05-27 15:24:33'),(46,'2017-05-28T13:30:00','2017-05-28T16:30:00','AUDIENCIA DE PRESENTACION POR PRESUNTOS DELITOS COMETIDOS EN LA INSPECTORIA DE TRABAJO DE SAN FELIPE ESTADO YATACUY','AUDIENCIA DE PRESENTACION POR PRESUNTOS DELITOS COMETIDOS EN LA INSPECTORIA DE TRABAJO DE SAN FELIPE ESTADO YATACUY',2,0,1,'2017-05-27 15:40:20'),(47,'2017-05-28T08:00:00','2017-05-28T09:00:00','otra audiencia','audiencia 4',6,0,1,'2017-05-27 15:40:58'),(48,'2017-05-28T15:00:00','2017-05-28T17:00:00','My Event 4','My Event 4',3,0,1,'2017-05-27 15:41:37'),(49,'2017-05-29T09:30:00','2017-05-29T11:30:00','My Event 4','My Event 4',2,0,1,'2017-05-27 15:42:10'),(50,'2017-05-29T09:00:00','2017-05-29T11:00:00','My Event 1','My Event 1',3,0,1,'2017-05-27 15:42:18'),(51,'2017-05-29T08:30:00','2017-05-29T10:30:00','My Event 2','My Event 2',4,0,1,'2017-05-27 15:42:22'),(52,'2017-05-29T13:00:00','2017-05-29T15:00:00','My Event 1','My Event 1',3,0,1,'2017-05-27 15:42:24'),(53,'2017-05-29T11:00:00','2017-05-29T13:00:00','My Event 4','My Event 4',4,0,1,'2017-05-27 15:42:26'),(54,'2017-05-29T10:30:00','2017-05-29T12:30:00','My Event 5','My Event 5',6,0,1,'2017-05-27 15:42:31'),(55,'2017-05-29T12:30:00','2017-05-29T14:30:00','My Event 4','My Event 4',2,0,1,'2017-05-27 15:42:34'),(56,'2017-05-29T11:00:00','2017-05-29T13:00:00','My Event 5','My Event 5',3,0,1,'2017-05-27 15:42:37'),(57,'2017-05-28T10:00:00','2017-05-28T12:00:00','NUEVO EVENTO','NUEVO EVENTO',6,0,1,'2017-05-28 23:55:08'),(58,'2017-05-28T13:00:00','2017-05-28T16:30:00','NEUEUE','EJE',6,0,1,'2017-05-28 23:55:17'),(59,'2017-05-28T08:30:00','2017-05-28T09:30:00','DHHDD','DHDHD',7,0,1,'2017-05-28 23:55:28'),(60,'2017-06-04T08:30:00','2017-06-04T14:30:00','Audiencia de pedro vargas','Audiencia definida',3,0,1,'2017-06-03 11:31:35'),(61,'2017-06-06T08:30:00','2017-06-06T14:30:00','jjj','jsjs',4,0,1,'2017-06-03 12:38:38'),(62,'2017-06-04T09:00:00','2017-06-04T15:30:00','juan jose','jajaj',4,0,1,'2017-06-03 12:40:57'),(63,'2017-06-05T08:30:00','2017-06-05T17:00:00','Audiencia de control de juicio de manuel jose olivares','audiencia numero 5 de este impitado',3,0,1,'2017-06-03 12:41:46'),(64,'2017-06-04T09:00:00','2017-06-04T14:30:00','My Event 1','My Event 1',2,0,1,'2017-06-04 11:18:54'),(65,'2017-06-04T10:30:00','2017-06-04T17:00:00','My Event 4','My Event 4',6,0,1,'2017-06-04 11:18:57'),(66,'2017-06-04T14:30:00','2017-06-04T17:30:00','jj','j',3,0,1,'2017-06-04 11:19:05'),(67,'2017-06-21T09:30:00','2017-06-21T17:30:00','audiencia de juan perez','audiencia de juan perez',7,0,1,'2017-06-20 13:32:00'),(68,'2017-06-21T10:00:00','2017-06-21T17:00:00','My Event 1','My Event 1',2,0,1,'2017-06-20 13:32:03'),(69,'2017-06-21T08:30:00','2017-06-21T11:30:00','audiencia de jose','audiencia de jose',4,0,1,'2017-06-20 14:07:19'),(70,'2017-06-21T10:00:00','2017-06-21T12:00:00','My Event 1','My Event 1',3,0,1,'2017-06-20 14:08:27'),(71,'2017-06-21T12:30:00','2017-06-21T14:30:00','My Event 2','My Event 2',6,0,1,'2017-06-20 14:08:29'),(72,'2017-06-21T13:30:00','2017-06-21T15:30:00','My Event 2','My Event 2',4,0,1,'2017-06-20 14:08:33'),(73,'2017-06-21T08:00:00','2017-06-21T15:00:00','xhxhg','gsgsgs',8,0,1,'2017-06-20 14:16:51');
/*!40000 ALTER TABLE `acto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_acto` AFTER INSERT ON `acto` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "ACTO", 
               NEW.id_usuario, 
               NULL, 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'inicio : "', NEW.inicio, '",',
                      'fin : "', NEW.fin, '",',
                      'titulo : "', NEW.titulo, '",',
                      'descripcion : "', NEW.descripcion, '",',
                      'id_sala : ', NEW.id_sala, ',',
                      'id_tribunal : ', NEW.id_tribunal, '',
                   '}'
               )
           );
       END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_acto` AFTER UPDATE ON `acto` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "ACTO", 
               NEW.id_usuario, 
               CONCAT(
                   '{',
                      'id : ', OLD.id, ',',
                      'inicio : "', OLD.inicio, '",',
                      'fin : "', OLD.fin, '",',
                      'titulo : "', OLD.titulo, '",',
                      'descripcion : "', OLD.descripcion, '",',
                      'id_sala : ', OLD.id_sala, ',',
                      'id_tribunal : ', OLD.id_tribunal, '',
                   '}'
               ), 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'inicio : "', NEW.inicio, '",',
                      'fin : "', NEW.fin, '",',
                      'titulo : "', NEW.titulo, '",',
                      'descripcion : "', NEW.descripcion, '",',
                      'id_sala : ', NEW.id_sala, ',',
                      'id_tribunal : ', NEW.id_tribunal, '',
                   '}'
               )
           );
       END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_acto` BEFORE DELETE ON `acto` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "ELIMINAR", 
               "ACTO", 
               OLD.id_usuario, 
               CONCAT(
                   '{',
                      'id : ', OLD.id, ',',
                      'inicio : "', OLD.inicio, '",',
                      'fin : "', OLD.fin, '",',
                      'titulo : "', OLD.titulo, '",',
                      'descripcion : "', OLD.descripcion, '",',
                      'id_sala : ', OLD.id_sala, ',',
                      'id_tribunal : ', OLD.id_tribunal, '',
                   '}'
               ), 
               NULL
           );
       END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `acto_sala`
--

DROP TABLE IF EXISTS `acto_sala`;
/*!50001 DROP VIEW IF EXISTS `acto_sala`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `acto_sala` (
  `id` tinyint NOT NULL,
  `resourceId` tinyint NOT NULL,
  `start` tinyint NOT NULL,
  `end` tinyint NOT NULL,
  `title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `alguacil`
--

DROP TABLE IF EXISTS `alguacil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alguacil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alguacil`
--

LOCK TABLES `alguacil` WRITE;
/*!40000 ALTER TABLE `alguacil` DISABLE KEYS */;
INSERT INTO `alguacil` VALUES (3,'V-123453773'),(2,'V-22839339'),(4,'V-2393932');
/*!40000 ALTER TABLE `alguacil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `operacion` varchar(10) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tabla` varchar(40) NOT NULL,
  `registro_anterior` longtext,
  `registro_nuevo` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (31,1,'INSERTAR','2017-05-24 12:41:53','ACTO','{\"id\" : 15,\"inicio\" : \"2017-05-24T10:30:00\",\"fin\" : \"2017-05-24T12:00:00\",\"titulo\" : \"dd\",\"descripcion\" : \"xx\",\"id_sala\" : 6,\"id_tribunal\" : 0}','{\"id\" : 15,\"inicio\" : \"2017-05-24T10:30:00\",\"fin\" : \"2017-05-24T12:00:00\",\"titulo\" : \"dd\",\"descripcion\" : \"xx\",\"id_sala\" : 6,\"id_tribunal\" : 0}');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defensor`
--

DROP TABLE IF EXISTS `defensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `impres` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor`
--

LOCK TABLES `defensor` WRITE;
/*!40000 ALTER TABLE `defensor` DISABLE KEYS */;
INSERT INTO `defensor` VALUES (1,'V2929','PUBLICO','2828282'),(5,'V29223','PUBLICO','2828282'),(8,'V-22738489','PRIVADO','233823742'),(9,'V-21389221','PUBLICO','9393240238'),(10,'V-232323','282828','39393939393939');
/*!40000 ALTER TABLE `defensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiscal`
--

DROP TABLE IF EXISTS `fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` text NOT NULL,
  `numero` int(11) NOT NULL,
  `id_tribunal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscal`
--

LOCK TABLES `fiscal` WRITE;
/*!40000 ALTER TABLE `fiscal` DISABLE KEYS */;
INSERT INTO `fiscal` VALUES (2,'V-9288338',25,6),(3,'V-2939383',2992,0);
/*!40000 ALTER TABLE `fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imputado`
--

DROP TABLE IF EXISTS `imputado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imputado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `condicion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imputado`
--

LOCK TABLES `imputado` WRITE;
/*!40000 ALTER TABLE `imputado` DISABLE KEYS */;
INSERT INTO `imputado` VALUES (1,'IMPUTADO',''),(3,'V-20192933','IMPUTADO'),(4,'V-2393283928','IMPUTADO'),(5,'V-323','9292'),(6,'V-2323','|387347834');
/*!40000 ALTER TABLE `imputado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juez`
--

DROP TABLE IF EXISTS `juez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juez` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juez`
--

LOCK TABLES `juez` WRITE;
/*!40000 ALTER TABLE `juez` DISABLE KEYS */;
INSERT INTO `juez` VALUES (1,'V-21301059'),(2,'V-21301060'),(3,'V-32322');
/*!40000 ALTER TABLE `juez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(17) NOT NULL,
  `fecha_de_nacimiento` text NOT NULL,
  `id_tipo_persona` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`,`email`,`telefono`),
  UNIQUE KEY `cedula_2` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'V-21301059','ANTHONY','MEDINA','ANTHONYJMEDINA@GMAIL.COM','+58 426 357 54 89','20/10/1992',5,NULL,'2017-04-05 14:29:15'),(2,'V-21301060','MARIANGEL','GAUTIER','MARIGAUTIER@GMAIL.COM','+58 858 558 66 66','20/10/1992',5,NULL,'2017-04-05 15:11:16'),(6,'V-1829333','MONICA','PEREZ','MONICA@HOTMAIL.COM','+58 228 282 88 22','20/09/1992',2,NULL,'2017-04-17 17:43:37'),(12,'V292','AJJ','SJSJ','JSJS@SJSJ','+58 828 282 82 82','06/04/2017',4,NULL,'2017-04-05 14:59:17'),(18,'V889393','SJSJSJ','JAJAJ','JSJJS@HSHS','+58 222 222 22 22','22/04/2017',2,NULL,'2017-04-05 16:23:00'),(19,'V28292829','JSSJJS','JSJSJ','JJD@SHS','+58 222 222 22 22','27/04/2017',1,NULL,'2017-04-05 16:26:22'),(20,'V-21201','HUAN','SSJ','JSSJ@SJSJ','+58 222 222 22 22','22/04/2017',1,NULL,'2017-04-05 17:04:39'),(21,'V-283838','JUAN','PERE','SHS2@SJHS','+58 292 929 29 29','21/04/2017',1,NULL,'2017-04-05 17:05:21'),(22,'V338','SJSJ','SJSJ','DJDJDW@SHDH','+58 222 222 22 22','20/04/2017',1,NULL,'2017-04-05 17:08:00'),(23,'V-3883','JOSE','MEDINA','SJSJ@SJSJ','+58 222 222 22 22','12/04/2017',1,NULL,'2017-04-05 17:08:52'),(24,'V9393','SKS','KDKS','JSJS@AJH','+58 229 292 92 90','29/04/2017',1,NULL,'2017-04-05 17:10:58'),(25,'V030','JDDJDJ','JSJS','SKSK2SJSJ@SJ','+58 292 920 00 00','21/04/2017',1,NULL,'2017-04-05 17:11:38'),(26,'V92292','SKSK','KSSK','SS@SS','+58 220 000 00 00','14/04/2017',1,NULL,'2017-04-05 17:12:53'),(27,'V8228','SHSH','SHSHS','JSHS@SJHS','+58 229 800 00 00','30/04/2017',1,NULL,'2017-04-05 17:13:45'),(30,'V-22738489','JUAN ANTONIO','PEREZ RODRIGUEZ','JUANANTONIO@GMAIL.COM','+58 426 563 63 73','20/10/1929',1,NULL,'2017-04-17 17:19:38'),(31,'V-21389221','MARIA','RODRIGUEZ','MARIARODRIGUEZ@GMAIL.COM','+58 424 567 38 38','12/12/1989',1,NULL,'2017-04-17 17:41:18'),(32,'V-22839339','JUAN','ZAMORA','JUANZAMORA@GMAIL.COM','+58 426 738 99 44','12/12/1992',3,NULL,'2017-04-17 17:42:46'),(33,'V-28388339','MILAGROS','MENDOZA','MILAGROSMENDOZA@GMAIL.COM','+58 424 363 83 78','12/12/1992',6,NULL,'2017-04-17 17:44:57'),(34,'V-20192933','SEBASTIAN','PEREZ','SEBASTIAN@GMAIL.COM','+58 426 373 83 83','12/12/1999',4,NULL,'2017-04-17 17:45:47'),(35,'V-23776782','MANUEL','MIJARES','MANUELMIJARES@GMAIL.COM','+58 892 489 28 42','20/10/1992',7,NULL,'2017-04-17 17:46:35'),(36,'V-9288338','JUAN','SUAREZ','BAUDLIOSUAREZ@GMAIL.COM','+58 426 738 38 38','10/10/1982',3,NULL,'2017-05-25 21:27:16'),(37,'V-12345377','JUAN','PEREZ','JUAN@GMAIL.COM','+58 783 782 30 00','05/04/1992',3,NULL,'2017-04-27 15:00:33'),(39,'V-21301033','juan','perez','sksjjs@dkdk','','2017-10-20',8,1,'2017-05-24 12:05:23'),(49,'V-838383','AJAJAJ','JASAJAJ','SJHSHJSHJ@SJSJS','+58 894 398 49 83','19/05/2017',1,NULL,'2017-05-24 12:22:46'),(50,'V-23932839','HAHAHSH','JDJDJ','JDJD@SHS','+58 233 333 33 33','10/05/2017',4,NULL,'2017-05-25 16:32:55'),(51,'V-323','SJAJAJ','JUAN','JSJS!SJS2@SHS','+58 000 000 00 00','21/05/2017',4,NULL,'2017-05-25 16:52:07'),(52,'V-2323','SSJSJ','JSSJJ','JJSJSJ@SSJ','+58 328 949 28 48','06/05/2017',4,NULL,'2017-05-25 16:51:55'),(53,'V-232','AAJA','SECRETARIA','AJAJA@SJSJ','+58 942 343 29 84','20/10/1992',1,NULL,'2017-05-25 16:52:46'),(54,'V-232323','SJSJSJ','SJSJSJ','SJSJS@SJSJ','+58 383 838 38 38','20/10/1992',1,NULL,'2017-05-25 16:53:28'),(55,'V-32322','AJAJA','JUEZ','SSJSJ2S2@SJSJS','+58 328 948 93 24','20/10/1999',5,NULL,'2017-05-25 16:54:22'),(56,'V-2393932','ALGUACIL','JUAN','SJSJSQ2@SJHSJ','+58 298 299 29 29','20/10/1992',3,NULL,'2017-05-25 16:54:53'),(57,'V-83383838','VICTIMA','JSJSJS','JSJSJ@SJSKSJSJS','+58 928 840 83 20','20/10/1992',6,NULL,'2017-05-25 16:55:36'),(58,'V-32382838','TESTIGO','1','JSJS@SJSJS','+58 892 498 28 74','20/19/1992',7,NULL,'2017-05-25 16:56:14'),(59,'V-2939383','FISCAL','2822828','SHSHSH@HWW','+58 192 929 29 29','20/10/1992',3,NULL,'2017-05-25 16:56:49'),(60,'V-38338823','SECRETARUA','HAHAHA','AJAJ2@SJSJS','+58 329 292 29 29','20/19/1992',1,NULL,'2017-05-25 16:57:29');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `persona_tipo_persona`
--

DROP TABLE IF EXISTS `persona_tipo_persona`;
/*!50001 DROP VIEW IF EXISTS `persona_tipo_persona`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `persona_tipo_persona` (
  `cedula` tinyint NOT NULL,
  `nombre_completo` tinyint NOT NULL,
  `descripcion` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `color` varchar(20) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`),
  UNIQUE KEY `color` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (2,'SALA 1','#f7f022',1,'2017-05-23 20:20:33'),(3,'SALA 2','#3100ff',1,'2017-05-23 20:20:45'),(4,'SALA 3','#fb1919',1,'2017-05-23 20:20:57'),(6,'SALA 4','#2d9c0e',1,'2017-05-23 20:24:53'),(7,'SALA 29','#000000',1,'2017-05-27 16:24:42'),(8,'SALA 65','#a40e0e',1,'2017-06-20 14:16:32');
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar` AFTER INSERT ON `sala` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "SALA", 
               NEW.id_usuario, 
               NULL, 
               CONCAT(
                   '{',
                   		'id : ', NEW.id, ',',
                   		'descripcion : "', NEW.descripcion, '",',
                   		'color : "', NEW.color, '"',
                   '}'
               )
           );
       END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar` AFTER UPDATE ON `sala` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "SALA", 
               NEW.id_usuario, 
               CONCAT(
                   '{',
                   		'id : ', OLD.id, ',',
                   		'descripcion : "', OLD.descripcion, '",',
                   		'color : "', OLD.color, '"',
                   '}'
               ), 
               CONCAT(
                   '{',
                   		'id : ', NEW.id, ',',
                   		'descripcion : "', NEW.descripcion, '",',
                   		'color : "', NEW.color, '"',
                   '}'
               )
           );
       END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar` AFTER DELETE ON `sala` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "ELIMINAR", 
               "SALA", 
               OLD.id_usuario, 
               CONCAT(
                   '{',
                   		'id : ', OLD.id, ',',
                   		'descripcion : "', OLD.descripcion, '",',
                   		'color : "', OLD.color, '"',
                   '}'
               ), 
               NULL
           );
       END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `secretaria`
--

DROP TABLE IF EXISTS `secretaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secretaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretaria`
--

LOCK TABLES `secretaria` WRITE;
/*!40000 ALTER TABLE `secretaria` DISABLE KEYS */;
INSERT INTO `secretaria` VALUES (1,'V-1829333');
/*!40000 ALTER TABLE `secretaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suplente`
--

DROP TABLE IF EXISTS `suplente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suplente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `id_fiscal` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `cedula_fiscal` (`id_fiscal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suplente`
--

LOCK TABLES `suplente` WRITE;
/*!40000 ALTER TABLE `suplente` DISABLE KEYS */;
/*!40000 ALTER TABLE `suplente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testigo`
--

DROP TABLE IF EXISTS `testigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_de_testigo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testigo`
--

LOCK TABLES `testigo` WRITE;
/*!40000 ALTER TABLE `testigo` DISABLE KEYS */;
INSERT INTO `testigo` VALUES (2,'V-23776782',1),(3,'V-32382838273',0);
/*!40000 ALTER TABLE `testigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_testigo`
--

DROP TABLE IF EXISTS `tipo_de_testigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_de_testigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_testigo`
--

LOCK TABLES `tipo_de_testigo` WRITE;
/*!40000 ALTER TABLE `tipo_de_testigo` DISABLE KEYS */;
INSERT INTO `tipo_de_testigo` VALUES (1,'TESTIGO PRESENCIAL','2017-05-17 14:54:29',1);
/*!40000 ALTER TABLE `tipo_de_testigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_tribunal`
--

DROP TABLE IF EXISTS `tipo_de_tribunal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_de_tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_tribunal`
--

LOCK TABLES `tipo_de_tribunal` WRITE;
/*!40000 ALTER TABLE `tipo_de_tribunal` DISABLE KEYS */;
INSERT INTO `tipo_de_tribunal` VALUES (1,'TRIBUNAL ITINERANTE',1,'2017-04-05 19:57:17'),(2,'TRIBUNAL DE JUICIO',0,'2017-07-01 14:49:36'),(3,'TRIBUNAL DE CONTROL',0,'2017-07-01 14:49:39');
/*!40000 ALTER TABLE `tipo_de_tribunal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_persona`
--

DROP TABLE IF EXISTS `tipo_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_persona`
--

LOCK TABLES `tipo_persona` WRITE;
/*!40000 ALTER TABLE `tipo_persona` DISABLE KEYS */;
INSERT INTO `tipo_persona` VALUES (1,'DEFENSOR',0,'2017-04-05 14:19:52'),(2,'SECRETARIA',0,'2017-04-05 14:22:41'),(3,'ALGUACIL',0,'2017-04-05 14:22:41'),(4,'IMPUTADO',0,'2017-04-05 14:22:41'),(5,'JUEZ',0,'2017-04-05 14:22:41'),(6,'VICTIMA',0,'2017-04-05 14:22:41'),(7,'TESTIGO',0,'2017-04-05 14:22:41'),(8,'FISCAL',0,'2017-04-05 14:22:41');
/*!40000 ALTER TABLE `tipo_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tribunal`
--

DROP TABLE IF EXISTS `tribunal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(200) NOT NULL,
  `id_tipo_tribunal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tribunal`
--

LOCK TABLES `tribunal` WRITE;
/*!40000 ALTER TABLE `tribunal` DISABLE KEYS */;
INSERT INTO `tribunal` VALUES (6,'TRIBUNAL 2',2,0,'2017-04-05 20:54:28'),(7,'TRIBUNAL 93',10,0,'2017-04-14 20:40:38'),(8,'TRIBUNAL  34',1,0,'2017-04-14 20:41:07'),(10,'TRIBUANAL 4',9,0,'2017-04-17 17:40:19'),(11,'234',1,0,'2017-05-25 16:31:45'),(12,'TRIBUNAL 23',3,0,'2017-07-01 15:49:44');
/*!40000 ALTER TABLE `tribunal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(11) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`cedula`),
  UNIQUE KEY `id_persona` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd',1,1,'2017-05-23 16:20:21');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `victima`
--

DROP TABLE IF EXISTS `victima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `victima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victima`
--

LOCK TABLES `victima` WRITE;
/*!40000 ALTER TABLE `victima` DISABLE KEYS */;
INSERT INTO `victima` VALUES (2,'V-28388339'),(3,'V-8338383874');
/*!40000 ALTER TABLE `victima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_alguacil`
--

DROP TABLE IF EXISTS `vista_alguacil`;
/*!50001 DROP VIEW IF EXISTS `vista_alguacil`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_alguacil` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_defensor`
--

DROP TABLE IF EXISTS `vista_defensor`;
/*!50001 DROP VIEW IF EXISTS `vista_defensor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_defensor` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `impres` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_fiscal`
--

DROP TABLE IF EXISTS `vista_fiscal`;
/*!50001 DROP VIEW IF EXISTS `vista_fiscal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_fiscal` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_imputado`
--

DROP TABLE IF EXISTS `vista_imputado`;
/*!50001 DROP VIEW IF EXISTS `vista_imputado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_imputado` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `condicion` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_juez`
--

DROP TABLE IF EXISTS `vista_juez`;
/*!50001 DROP VIEW IF EXISTS `vista_juez`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_juez` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_secretaria`
--

DROP TABLE IF EXISTS `vista_secretaria`;
/*!50001 DROP VIEW IF EXISTS `vista_secretaria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_secretaria` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_testigo`
--

DROP TABLE IF EXISTS `vista_testigo`;
/*!50001 DROP VIEW IF EXISTS `vista_testigo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_testigo` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_tribunal`
--

DROP TABLE IF EXISTS `vista_tribunal`;
/*!50001 DROP VIEW IF EXISTS `vista_tribunal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_tribunal` (
  `id` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `descripcion` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_victima`
--

DROP TABLE IF EXISTS `vista_victima`;
/*!50001 DROP VIEW IF EXISTS `vista_victima`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_victima` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `acto_sala`
--

/*!50001 DROP TABLE IF EXISTS `acto_sala`*/;
/*!50001 DROP VIEW IF EXISTS `acto_sala`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `acto_sala` AS select `acto`.`id` AS `id`,`sala`.`id` AS `resourceId`,`acto`.`inicio` AS `start`,`acto`.`fin` AS `end`,`acto`.`titulo` AS `title` from (`acto` join `sala` on((`acto`.`id_sala` = `sala`.`id`))) where ((`sala`.`id` <> '') and (`acto`.`inicio` <> '') and (`acto`.`fin` <> '')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `persona_tipo_persona`
--

/*!50001 DROP TABLE IF EXISTS `persona_tipo_persona`*/;
/*!50001 DROP VIEW IF EXISTS `persona_tipo_persona`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `persona_tipo_persona` AS select `persona`.`cedula` AS `cedula`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `nombre_completo`,`tipo_persona`.`descripcion` AS `descripcion` from (`persona` join `tipo_persona` on((`persona`.`id_tipo_persona` = `tipo_persona`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_alguacil`
--

/*!50001 DROP TABLE IF EXISTS `vista_alguacil`*/;
/*!50001 DROP VIEW IF EXISTS `vista_alguacil`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_alguacil` AS select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `alguacil` `a` on((`p`.`cedula` = `a`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_defensor`
--

/*!50001 DROP TABLE IF EXISTS `vista_defensor`*/;
/*!50001 DROP VIEW IF EXISTS `vista_defensor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_defensor` AS select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`d`.`tipo` AS `tipo`,`d`.`impres` AS `impres`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `defensor` `d` on((`p`.`cedula` = `d`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_fiscal`
--

/*!50001 DROP TABLE IF EXISTS `vista_fiscal`*/;
/*!50001 DROP VIEW IF EXISTS `vista_fiscal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_fiscal` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`fiscal`.`numero` AS `numero`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `fiscal` on((`persona`.`cedula` = `fiscal`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_imputado`
--

/*!50001 DROP TABLE IF EXISTS `vista_imputado`*/;
/*!50001 DROP VIEW IF EXISTS `vista_imputado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_imputado` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`imputado`.`condicion` AS `condicion`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `imputado` on((`persona`.`cedula` = `imputado`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_juez`
--

/*!50001 DROP TABLE IF EXISTS `vista_juez`*/;
/*!50001 DROP VIEW IF EXISTS `vista_juez`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_juez` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `juez` on((`persona`.`cedula` = `juez`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_secretaria`
--

/*!50001 DROP TABLE IF EXISTS `vista_secretaria`*/;
/*!50001 DROP VIEW IF EXISTS `vista_secretaria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_secretaria` AS select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `secretaria` `s` on((`p`.`cedula` = `s`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_testigo`
--

/*!50001 DROP TABLE IF EXISTS `vista_testigo`*/;
/*!50001 DROP VIEW IF EXISTS `vista_testigo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_testigo` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `testigo` on((`persona`.`cedula` = `testigo`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tribunal`
--

/*!50001 DROP TABLE IF EXISTS `vista_tribunal`*/;
/*!50001 DROP VIEW IF EXISTS `vista_tribunal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tribunal` AS select `t`.`id` AS `id`,`t`.`numero` AS `numero`,`tdt`.`descripcion` AS `descripcion`,`t`.`id_usuario` AS `id_usuario`,`t`.`fecha_de_registro` AS `fecha_de_registro` from (`tribunal` `t` join `tipo_de_tribunal` `tdt` on((`t`.`id_tipo_tribunal` = `tdt`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_victima`
--

/*!50001 DROP TABLE IF EXISTS `vista_victima`*/;
/*!50001 DROP VIEW IF EXISTS `vista_victima`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_victima` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `victima` on((`persona`.`cedula` = `victima`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-02 11:53:52
