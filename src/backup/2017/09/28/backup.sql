-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dem
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'JUICIO DE PRESENTACION',1,1,'2017-07-04 13:00:03'),(2,'JUICIO DE SALIDA',2,1,'2017-07-04 12:59:39'),(3,'JUICIO DE ENTRADA',3,1,'2017-07-04 12:59:56');
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
  `inicio` varchar(40) NOT NULL DEFAULT '0000-00-00T00:00:00',
  `fin` varchar(20) DEFAULT '0000-00-00T00:00:00',
  `descripcion` varchar(200) NOT NULL,
  `numero_caso` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_sala` int(11) DEFAULT '1',
  `id_tribunal` int(11) NOT NULL DEFAULT '0',
  `estatus` varchar(20) NOT NULL DEFAULT 'ASIGNADO',
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-08-26T08:00:00','2017-08-26T09:00:00','presentacion',1,1,1,1,'FINALIZADO',7,'2017-08-26 13:38:38'),(3,'2017-08-26T08:00:00','2017-08-26T09:30:00','JUICIO DE SALIDA',2,2,2,3,'FINALIZADO',7,'2017-08-26 13:40:17'),(4,'2017-09-03T11:00:00','2017-09-03T13:00:00','1: JUICIO DE PRESENTACION',1,1,1,1,'ASIGNADO',7,'2017-09-02 15:10:54'),(5,'2017-08-27T12:00:00','2017-08-27T20:00:00','JUICIO DE SALIDA',1,2,6,3,'ASIGNADO',7,'2017-08-26 18:39:14'),(6,'2017-08-27T09:30:00','2017-08-27T11:30:00','JUICIO DE PRESENTACION',1,1,3,1,'FINALIZADO',7,'2017-08-27 15:31:25'),(7,'2017-08-27T09:00:00','2017-08-27T15:00:00','hola',1,2,4,3,'ASIGNADO',7,'2017-08-26 18:50:25'),(8,'2017-08-27T09:30:00','2017-08-27T16:30:00','HOLA',1,1,7,1,'ASIGNADO',7,'2017-08-26 19:31:51'),(9,'2017-09-03T10:30:00','2017-09-03T12:30:00','1: JUICIO DE SALIDA',1,2,7,3,'ASIGNADO',7,'2017-09-02 15:11:49'),(10,'2017-09-03T09:00:00','2017-09-03T18:00:00','HOLA',1,1,4,1,'ASIGNADO',7,'2017-09-02 15:16:04'),(11,'2017-09-03T10:00:00','2017-09-03T12:00:00','1: JUICIO DE PRESENTACION',1,1,3,1,'ASIGNADO',7,'2017-09-02 15:16:43'),(12,'2017-09-05T08:00:00','2017-09-05T14:30:00','HOLA',1,1,3,1,'ASIGNADO',7,'2017-09-02 15:31:21'),(13,'2017-09-05T09:30:00','2017-09-05T15:00:00','HDHD',1,2,4,3,'ASIGNADO',7,'2017-09-02 15:31:46'),(14,'2017-09-05T09:30:00','2017-09-05T13:00:00','HOLA',1,2,6,3,'ASIGNADO',7,'2017-09-02 15:32:31'),(15,'2017-09-06T10:00:00','2017-09-06T17:00:00','HILA',1,1,3,1,'ASIGNADO',7,'2017-09-02 15:32:57'),(16,'2017-09-07T09:00:00','2017-09-07T14:00:00','KD',1,2,4,3,'ASIGNADO',7,'2017-09-02 15:34:27'),(17,'2017-09-07T10:30:00','2017-09-07T16:00:00','HOLA',1,3,7,4,'ASIGNADO',7,'2017-09-02 15:35:41'),(18,'2017-09-13T08:30:00','2017-09-13T16:30:00','1: JUICIO DE SALIDA',1,2,3,3,'ASIGNADO',7,'2017-09-12 12:57:12'),(19,'2017-09-14T10:00:00','2017-09-14T13:00:00','1: JUICIO DE PRESENTACION',1,1,3,1,'FINALIZADO',7,'2017-09-14 22:48:00'),(20,'2017-09-15T08:30:00','2017-09-15T13:00:00','1: JUICIO DE PRESENTACION',1,1,6,1,'ASIGNADO',7,'2017-09-13 16:18:22'),(21,'2017-09-14T10:00:00','2017-09-14T14:00:00','1: JUICIO DE PRESENTACION',1,1,7,1,'FINALIZADO',7,'2017-09-14 22:48:00');
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
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "ACTO", 
               CONCAT('SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA ', NEW.inicio, ' CUYA DESCRIPCION ES ', NEW.descripcion, ' Y SU ESTATUS ES ', NEW.estatus),
               NEW.id_usuario, 
               NULL, 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'inicio : "', NEW.inicio, '",',
                      'fin : "', NEW.fin, '",',
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
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "ACTO", 
               CONCAT('SE HA MODIFICADO UN ACTO PARA EL DIA ', NEW.inicio, ' CUYA DESCRIPCION ES ', NEW.descripcion, ' Y SU ESTATUS ES ', NEW.estatus),
               NEW.id_usuario, 
               CONCAT(
                   '{',
                      'id : ', OLD.id, ',',
                      'inicio : "', OLD.inicio, '",',
                      'fin : "', OLD.fin, '",',
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
  `start` tinyint NOT NULL,
  `end` tinyint NOT NULL,
  `resourceId` tinyint NOT NULL,
  `estatus` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `descripcion` tinyint NOT NULL,
  `descripcion_acto` tinyint NOT NULL,
  `sala` tinyint NOT NULL,
  `id_tribunal` tinyint NOT NULL,
  `tribunal` tinyint NOT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alguacil`
--

LOCK TABLES `alguacil` WRITE;
/*!40000 ALTER TABLE `alguacil` DISABLE KEYS */;
INSERT INTO `alguacil` VALUES (2,'V-21301059');
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
  `accion` mediumtext NOT NULL,
  `registro_anterior` longtext,
  `registro_nuevo` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,7,'INSERTAR','2017-08-24 20:21:04','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-08-25T08:30:00 CUYA DESCRIPCION ES presentacion Y SU ESTATUS ES ASIGNADO',NULL,'{id : 1,inicio : \"2017-08-25T08:30:00\",fin : \"2017-08-25T10:30:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}'),(2,7,'INSERTAR','2017-08-24 20:21:45','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-08-25T09:30:00 CUYA DESCRIPCION ES presentacion Y SU ESTATUS ES ASIGNADO',NULL,'{id : 2,inicio : \"2017-08-25T09:30:00\",fin : \"2017-08-25T12:30:00\",descripcion : \"presentacion\",id_sala : 2,id_tribunal : 1}'),(3,7,'MODIFICAR','2017-08-24 20:21:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES presentacion Y SU ESTATUS ES ESPERA','{id : 2,inicio : \"2017-08-25T09:30:00\",fin : \"2017-08-25T12:30:00\",descripcion : \"presentacion\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}'),(4,7,'MODIFICAR','2017-08-24 20:21:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-25T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-08-25T09:30:00\",fin : \"2017-08-25T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(5,7,'ELIMINAR','2017-08-24 20:22:16','ACTO','','{id : 2,inicio : \"2017-08-25T09:30:00\",fin : \"2017-08-25T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}',NULL),(6,7,'INSERTAR','2017-08-24 20:23:08','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES otro Y SU ESTATUS ES ESPERA',NULL,'{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"otro\",id_sala : 1,id_tribunal : 3}'),(7,7,'MODIFICAR','2017-08-24 20:23:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-25T08:30:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"otro\",id_sala : 1,id_tribunal : 3}','{id : 3,inicio : \"2017-08-25T08:30:00\",fin : \"2017-08-25T10:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(8,7,'INSERTAR','2017-08-26 13:15:57','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES Descripcion Y SU ESTATUS ES ESPERA',NULL,'{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"Descripcion\",id_sala : 1,id_tribunal : 1}'),(9,7,'MODIFICAR','2017-08-26 13:16:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"Descripcion\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(10,7,'INSERTAR','2017-08-26 13:16:37','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES descripcion Y SU ESTATUS ES ASIGNADO',NULL,'{id : 5,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T13:30:00\",descripcion : \"descripcion\",id_sala : 2,id_tribunal : 3}'),(11,7,'MODIFICAR','2017-08-26 13:23:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T13:30:00\",descripcion : \"descripcion\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T16:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(12,7,'MODIFICAR','2017-08-26 13:24:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T16:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(13,7,'MODIFICAR','2017-08-26 13:24:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T08:30:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T08:30:00\",fin : \"2017-08-27T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(14,7,'INSERTAR','2017-08-26 13:24:39','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES TRIBUNAL Y SU ESTATUS ES ESPERA',NULL,'{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"TRIBUNAL\",id_sala : 1,id_tribunal : 1}'),(15,7,'MODIFICAR','2017-08-26 13:24:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-29T08:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"TRIBUNAL\",id_sala : 1,id_tribunal : 1}','{id : 6,inicio : \"2017-08-29T08:30:00\",fin : \"2017-08-29T10:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 0,id_tribunal : 1}'),(16,7,'MODIFICAR','2017-08-26 13:26:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-29T08:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-29T08:30:00\",fin : \"2017-08-29T10:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 0,id_tribunal : 1}','{id : 6,inicio : \"2017-08-29T08:30:00\",fin : \"2017-08-29T10:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(17,7,'MODIFICAR','2017-08-26 13:27:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 6,inicio : \"2017-08-29T08:30:00\",fin : \"2017-08-29T10:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(18,7,'MODIFICAR','2017-08-26 13:27:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-30T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 6,inicio : \"2017-08-30T09:30:00\",fin : \"2017-08-30T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 0,id_tribunal : 1}'),(19,7,'MODIFICAR','2017-08-26 13:28:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-30T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-30T09:30:00\",fin : \"2017-08-30T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 0,id_tribunal : 1}','{id : 6,inicio : \"2017-08-30T09:30:00\",fin : \"2017-08-30T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(20,7,'ELIMINAR','2017-08-26 13:29:15','ACTO','','{id : 6,inicio : \"2017-08-30T09:30:00\",fin : \"2017-08-30T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}',NULL),(21,7,'MODIFICAR','2017-08-26 13:30:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-26T09:30:00 CUYA DESCRIPCION ES presentacion Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-08-25T08:30:00\",fin : \"2017-08-25T10:30:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-08-26T09:30:00\",fin : \"2017-08-25T10:30:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}'),(22,7,'MODIFICAR','2017-08-26 13:30:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-26T09:30:00 CUYA DESCRIPCION ES presentacion Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-08-26T09:30:00\",fin : \"2017-08-25T10:30:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-08-26T09:30:00\",fin : \"2017-08-26T10:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}'),(23,7,'MODIFICAR','2017-08-26 13:33:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-26T08:00:00 CUYA DESCRIPCION ES presentacion Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-08-26T09:30:00\",fin : \"2017-08-26T10:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-08-26T08:00:00\",fin : \"2017-08-26T10:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}'),(24,7,'MODIFICAR','2017-08-26 13:33:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-26T08:00:00 CUYA DESCRIPCION ES presentacion Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-08-26T08:00:00\",fin : \"2017-08-26T10:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-08-26T08:00:00\",fin : \"2017-08-26T09:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}'),(25,7,'MODIFICAR','2017-08-26 13:38:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-26T08:00:00 CUYA DESCRIPCION ES presentacion Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-08-26T08:00:00\",fin : \"2017-08-26T09:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-08-26T08:00:00\",fin : \"2017-08-26T09:00:00\",descripcion : \"presentacion\",id_sala : 1,id_tribunal : 1}'),(26,7,'MODIFICAR','2017-08-26 13:40:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-26T08:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-08-25T08:30:00\",fin : \"2017-08-25T10:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 3,inicio : \"2017-08-26T08:00:00\",fin : \"2017-08-26T09:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(27,7,'MODIFICAR','2017-08-26 13:40:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-26T08:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 3,inicio : \"2017-08-26T08:00:00\",fin : \"2017-08-26T09:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 3,inicio : \"2017-08-26T08:00:00\",fin : \"2017-08-26T09:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(28,7,'MODIFICAR','2017-08-26 17:35:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T11:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T08:30:00\",fin : \"2017-08-27T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T11:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(29,7,'MODIFICAR','2017-08-26 17:35:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T08:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T11:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T08:00:00\",fin : \"2017-08-27T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(30,7,'INSERTAR','2017-08-26 17:37:06','SALA','SE HA REGISTRADO UNA SALA COMO SALA 4',NULL,'{id : 3,descripcion : \"SALA 4\",color : \"#b20c0c\"}'),(31,7,'INSERTAR','2017-08-26 17:37:27','SALA','SE HA REGISTRADO UNA SALA COMO SALA3',NULL,'{id : 4,descripcion : \"SALA3\",color : \"#e6ec18\"}'),(32,7,'MODIFICAR','2017-08-26 17:37:38','SALA','SE HA CAMBIADO NOMBRE DE SALA3 A SALA 3','{id : 4,descripcion : \"SALA3\",color : \"#e6ec18\"}','{id : 4,descripcion : \"SALA 3\",color : \"#e6ec18\"}'),(33,7,'INSERTAR','2017-08-26 17:38:08','SALA','SE HA REGISTRADO UNA SALA COMO SALA 5',NULL,'{id : 6,descripcion : \"SALA 5\",color : \"#ed02d0\"}'),(34,7,'INSERTAR','2017-08-26 17:38:24','SALA','SE HA REGISTRADO UNA SALA COMO SALA 6',NULL,'{id : 7,descripcion : \"SALA 6\",color : \"#1de2f2\"}'),(35,7,'INSERTAR','2017-08-26 17:38:51','SALA','SE HA REGISTRADO UNA SALA COMO SALA 7',NULL,'{id : 8,descripcion : \"SALA 7\",color : \"#08da0c\"}'),(36,7,'INSERTAR','2017-08-26 17:44:47','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES llucis Y SU ESTATUS ES ESPERA',NULL,'{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"llucis\",id_sala : 1,id_tribunal : 1}'),(37,7,'MODIFICAR','2017-08-26 17:46:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"llucis\",id_sala : 1,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(38,7,'MODIFICAR','2017-08-26 17:47:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 6,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(39,7,'MODIFICAR','2017-08-26 17:47:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T08:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T08:30:00\",fin : \"2017-08-27T10:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(40,7,'MODIFICAR','2017-08-26 17:47:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 6,inicio : \"2017-08-27T08:30:00\",fin : \"2017-08-27T10:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(41,7,'MODIFICAR','2017-08-26 18:04:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(42,7,'MODIFICAR','2017-08-26 18:05:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(43,7,'MODIFICAR','2017-08-26 18:09:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(44,7,'MODIFICAR','2017-08-26 18:11:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ESPERA','{id : 5,inicio : \"2017-08-27T08:00:00\",fin : \"2017-08-27T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 3}'),(45,7,'MODIFICAR','2017-08-26 18:24:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(46,7,'MODIFICAR','2017-08-26 18:24:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T17:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(47,7,'MODIFICAR','2017-08-26 18:24:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T08:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T17:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T08:00:00\",fin : \"2017-08-27T16:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(48,7,'MODIFICAR','2017-08-26 18:24:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T08:00:00\",fin : \"2017-08-27T16:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T17:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(49,7,'MODIFICAR','2017-08-26 18:28:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T09:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(50,7,'MODIFICAR','2017-08-26 18:28:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(51,7,'MODIFICAR','2017-08-26 18:28:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-09-03T09:30:00\",fin : \"2017-09-03T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(52,7,'MODIFICAR','2017-08-26 18:28:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-02T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-09-03T09:30:00\",fin : \"2017-09-03T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-09-02T09:30:00\",fin : \"2017-09-02T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(53,7,'MODIFICAR','2017-08-26 18:36:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T09:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(54,7,'MODIFICAR','2017-08-26 18:36:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-09-02T09:30:00\",fin : \"2017-09-02T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(55,7,'MODIFICAR','2017-08-26 18:39:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T10:30:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T17:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T10:30:00\",fin : \"2017-08-27T18:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(56,7,'MODIFICAR','2017-08-26 18:39:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T10:30:00\",fin : \"2017-08-27T18:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(57,7,'MODIFICAR','2017-08-26 18:39:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(58,7,'MODIFICAR','2017-08-26 18:39:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T09:00:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(59,7,'INSERTAR','2017-08-26 18:50:25','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO',NULL,'{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(60,7,'INSERTAR','2017-08-26 19:31:51','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(61,7,'MODIFICAR','2017-08-27 13:12:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(62,7,'MODIFICAR','2017-08-27 13:12:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(63,7,'MODIFICAR','2017-08-27 13:12:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(64,7,'MODIFICAR','2017-08-27 13:12:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(65,7,'MODIFICAR','2017-08-27 13:12:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(66,7,'MODIFICAR','2017-08-27 13:12:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(67,7,'MODIFICAR','2017-08-27 13:12:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(68,7,'MODIFICAR','2017-08-27 13:12:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(69,7,'MODIFICAR','2017-08-27 13:12:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(70,7,'MODIFICAR','2017-08-27 13:12:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(71,7,'MODIFICAR','2017-08-27 13:12:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(72,7,'MODIFICAR','2017-08-27 13:12:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(73,7,'MODIFICAR','2017-08-27 13:12:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(74,7,'MODIFICAR','2017-08-27 13:12:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(75,7,'MODIFICAR','2017-08-27 13:12:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(76,7,'MODIFICAR','2017-08-27 13:12:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(77,7,'MODIFICAR','2017-08-27 13:12:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(78,7,'MODIFICAR','2017-08-27 13:12:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(79,7,'MODIFICAR','2017-08-27 13:12:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(80,7,'MODIFICAR','2017-08-27 13:12:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(81,7,'MODIFICAR','2017-08-27 13:12:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(82,7,'MODIFICAR','2017-08-27 13:12:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(83,7,'MODIFICAR','2017-08-27 13:12:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(84,7,'MODIFICAR','2017-08-27 13:12:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(85,7,'MODIFICAR','2017-08-27 13:13:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(86,7,'MODIFICAR','2017-08-27 13:13:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(87,7,'MODIFICAR','2017-08-27 13:13:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(88,7,'MODIFICAR','2017-08-27 13:13:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(89,7,'MODIFICAR','2017-08-27 13:13:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(90,7,'MODIFICAR','2017-08-27 13:13:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(91,7,'MODIFICAR','2017-08-27 13:13:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(92,7,'MODIFICAR','2017-08-27 13:13:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(93,7,'MODIFICAR','2017-08-27 13:13:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(94,7,'MODIFICAR','2017-08-27 13:13:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(95,7,'MODIFICAR','2017-08-27 13:13:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(96,7,'MODIFICAR','2017-08-27 13:13:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(97,7,'MODIFICAR','2017-08-27 13:13:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(98,7,'MODIFICAR','2017-08-27 13:13:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(99,7,'MODIFICAR','2017-08-27 13:13:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(100,7,'MODIFICAR','2017-08-27 13:13:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(101,7,'MODIFICAR','2017-08-27 13:22:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(102,7,'MODIFICAR','2017-08-27 13:22:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(103,7,'MODIFICAR','2017-08-27 13:22:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(104,7,'MODIFICAR','2017-08-27 13:22:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(105,7,'MODIFICAR','2017-08-27 13:23:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(106,7,'MODIFICAR','2017-08-27 13:23:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(107,7,'MODIFICAR','2017-08-27 13:23:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(108,7,'MODIFICAR','2017-08-27 13:23:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(109,7,'MODIFICAR','2017-08-27 13:34:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(110,7,'MODIFICAR','2017-08-27 13:34:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(111,7,'MODIFICAR','2017-08-27 13:34:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(112,7,'MODIFICAR','2017-08-27 13:34:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(113,7,'MODIFICAR','2017-08-27 13:34:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(114,7,'MODIFICAR','2017-08-27 13:34:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(115,7,'MODIFICAR','2017-08-27 13:34:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(116,7,'MODIFICAR','2017-08-27 13:34:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(117,7,'MODIFICAR','2017-08-27 13:40:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(118,7,'MODIFICAR','2017-08-27 13:40:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(119,7,'MODIFICAR','2017-08-27 13:40:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(120,7,'MODIFICAR','2017-08-27 13:40:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(121,7,'MODIFICAR','2017-08-27 13:40:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(122,7,'MODIFICAR','2017-08-27 13:40:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(123,7,'MODIFICAR','2017-08-27 13:40:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(124,7,'MODIFICAR','2017-08-27 13:40:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(125,7,'MODIFICAR','2017-08-27 13:42:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(126,7,'MODIFICAR','2017-08-27 13:42:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(127,7,'MODIFICAR','2017-08-27 13:42:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(128,7,'MODIFICAR','2017-08-27 13:42:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(129,7,'MODIFICAR','2017-08-27 13:43:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(130,7,'MODIFICAR','2017-08-27 13:43:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(131,7,'MODIFICAR','2017-08-27 13:43:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(132,7,'MODIFICAR','2017-08-27 13:43:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(133,7,'MODIFICAR','2017-08-27 13:44:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(134,7,'MODIFICAR','2017-08-27 13:44:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(135,7,'MODIFICAR','2017-08-27 13:44:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(136,7,'MODIFICAR','2017-08-27 13:44:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(137,7,'MODIFICAR','2017-08-27 13:44:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(138,7,'MODIFICAR','2017-08-27 13:44:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(139,7,'MODIFICAR','2017-08-27 13:44:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(140,7,'MODIFICAR','2017-08-27 13:44:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(141,7,'MODIFICAR','2017-08-27 13:45:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(142,7,'MODIFICAR','2017-08-27 13:45:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(143,7,'MODIFICAR','2017-08-27 13:45:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(144,7,'MODIFICAR','2017-08-27 13:45:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(145,7,'MODIFICAR','2017-08-27 13:48:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(146,7,'MODIFICAR','2017-08-27 13:48:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(147,7,'MODIFICAR','2017-08-27 13:48:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(148,7,'MODIFICAR','2017-08-27 13:48:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(149,7,'MODIFICAR','2017-08-27 13:48:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(150,7,'MODIFICAR','2017-08-27 13:48:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(151,7,'MODIFICAR','2017-08-27 13:48:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(152,7,'MODIFICAR','2017-08-27 13:48:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(153,7,'MODIFICAR','2017-08-27 13:50:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(154,7,'MODIFICAR','2017-08-27 13:50:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(155,7,'MODIFICAR','2017-08-27 13:50:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(156,7,'MODIFICAR','2017-08-27 13:50:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(157,7,'MODIFICAR','2017-08-27 13:50:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(158,7,'MODIFICAR','2017-08-27 13:50:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(159,7,'MODIFICAR','2017-08-27 13:50:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(160,7,'MODIFICAR','2017-08-27 13:50:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(161,7,'MODIFICAR','2017-08-27 13:52:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(162,7,'MODIFICAR','2017-08-27 13:52:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(163,7,'MODIFICAR','2017-08-27 13:52:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(164,7,'MODIFICAR','2017-08-27 13:52:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(165,7,'MODIFICAR','2017-08-27 13:53:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(166,7,'MODIFICAR','2017-08-27 13:53:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(167,7,'MODIFICAR','2017-08-27 13:53:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(168,7,'MODIFICAR','2017-08-27 13:53:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(169,7,'MODIFICAR','2017-08-27 13:55:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(170,7,'MODIFICAR','2017-08-27 13:55:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(171,7,'MODIFICAR','2017-08-27 13:55:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(172,7,'MODIFICAR','2017-08-27 13:55:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(173,7,'MODIFICAR','2017-08-27 13:55:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(174,7,'MODIFICAR','2017-08-27 13:55:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(175,7,'MODIFICAR','2017-08-27 13:55:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(176,7,'MODIFICAR','2017-08-27 13:55:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(177,7,'MODIFICAR','2017-08-27 14:00:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(178,7,'MODIFICAR','2017-08-27 14:00:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(179,7,'MODIFICAR','2017-08-27 14:00:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(180,7,'MODIFICAR','2017-08-27 14:00:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(181,7,'MODIFICAR','2017-08-27 14:00:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(182,7,'MODIFICAR','2017-08-27 14:00:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(183,7,'MODIFICAR','2017-08-27 14:00:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(184,7,'MODIFICAR','2017-08-27 14:00:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(185,7,'MODIFICAR','2017-08-27 14:00:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(186,7,'MODIFICAR','2017-08-27 14:00:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(187,7,'MODIFICAR','2017-08-27 14:00:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(188,7,'MODIFICAR','2017-08-27 14:00:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(189,7,'MODIFICAR','2017-08-27 14:01:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(190,7,'MODIFICAR','2017-08-27 14:01:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(191,7,'MODIFICAR','2017-08-27 14:01:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(192,7,'MODIFICAR','2017-08-27 14:01:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(193,7,'MODIFICAR','2017-08-27 14:01:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(194,7,'MODIFICAR','2017-08-27 14:01:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(195,7,'MODIFICAR','2017-08-27 14:01:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(196,7,'MODIFICAR','2017-08-27 14:01:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(197,7,'MODIFICAR','2017-08-27 14:04:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(198,7,'MODIFICAR','2017-08-27 14:04:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(199,7,'MODIFICAR','2017-08-27 14:04:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(200,7,'MODIFICAR','2017-08-27 14:04:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(201,7,'MODIFICAR','2017-08-27 14:04:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(202,7,'MODIFICAR','2017-08-27 14:04:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(203,7,'MODIFICAR','2017-08-27 14:04:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(204,7,'MODIFICAR','2017-08-27 14:04:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(205,7,'MODIFICAR','2017-08-27 14:04:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(206,7,'MODIFICAR','2017-08-27 14:04:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(207,7,'MODIFICAR','2017-08-27 14:04:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(208,7,'MODIFICAR','2017-08-27 14:04:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(209,7,'MODIFICAR','2017-08-27 14:05:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(210,7,'MODIFICAR','2017-08-27 14:05:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(211,7,'MODIFICAR','2017-08-27 14:05:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(212,7,'MODIFICAR','2017-08-27 14:05:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(213,7,'MODIFICAR','2017-08-27 14:05:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(214,7,'MODIFICAR','2017-08-27 14:05:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(215,7,'MODIFICAR','2017-08-27 14:05:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(216,7,'MODIFICAR','2017-08-27 14:05:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(217,7,'MODIFICAR','2017-08-27 14:06:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(218,7,'MODIFICAR','2017-08-27 14:06:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(219,7,'MODIFICAR','2017-08-27 14:06:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(220,7,'MODIFICAR','2017-08-27 14:06:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(221,7,'MODIFICAR','2017-08-27 14:06:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(222,7,'MODIFICAR','2017-08-27 14:06:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(223,7,'MODIFICAR','2017-08-27 14:06:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(224,7,'MODIFICAR','2017-08-27 14:06:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(225,7,'MODIFICAR','2017-08-27 14:06:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(226,7,'MODIFICAR','2017-08-27 14:06:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(227,7,'MODIFICAR','2017-08-27 14:06:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(228,7,'MODIFICAR','2017-08-27 14:06:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(229,7,'MODIFICAR','2017-08-27 14:06:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(230,7,'MODIFICAR','2017-08-27 14:06:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(231,7,'MODIFICAR','2017-08-27 14:06:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(232,7,'MODIFICAR','2017-08-27 14:06:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(233,7,'MODIFICAR','2017-08-27 14:06:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(234,7,'MODIFICAR','2017-08-27 14:06:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(235,7,'MODIFICAR','2017-08-27 14:06:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(236,7,'MODIFICAR','2017-08-27 14:06:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(237,7,'MODIFICAR','2017-08-27 14:06:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(238,7,'MODIFICAR','2017-08-27 14:06:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(239,7,'MODIFICAR','2017-08-27 14:06:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(240,7,'MODIFICAR','2017-08-27 14:06:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(241,7,'MODIFICAR','2017-08-27 14:06:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(242,7,'MODIFICAR','2017-08-27 14:06:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(243,7,'MODIFICAR','2017-08-27 14:06:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(244,7,'MODIFICAR','2017-08-27 14:06:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(245,7,'MODIFICAR','2017-08-27 14:16:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(246,7,'MODIFICAR','2017-08-27 14:16:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(247,7,'MODIFICAR','2017-08-27 14:16:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(248,7,'MODIFICAR','2017-08-27 14:16:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(249,7,'MODIFICAR','2017-08-27 14:16:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(250,7,'MODIFICAR','2017-08-27 14:16:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(251,7,'MODIFICAR','2017-08-27 14:16:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(252,7,'MODIFICAR','2017-08-27 14:16:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(253,7,'MODIFICAR','2017-08-27 14:16:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(254,7,'MODIFICAR','2017-08-27 14:16:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(255,7,'MODIFICAR','2017-08-27 14:16:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(256,7,'MODIFICAR','2017-08-27 14:16:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(257,7,'MODIFICAR','2017-08-27 14:54:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(258,7,'MODIFICAR','2017-08-27 14:54:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(259,7,'MODIFICAR','2017-08-27 14:54:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(260,7,'MODIFICAR','2017-08-27 14:54:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(261,7,'MODIFICAR','2017-08-27 15:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(262,7,'MODIFICAR','2017-08-27 15:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(263,7,'MODIFICAR','2017-08-27 15:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(264,7,'MODIFICAR','2017-08-27 15:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(265,7,'MODIFICAR','2017-08-27 15:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(266,7,'MODIFICAR','2017-08-27 15:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(267,7,'MODIFICAR','2017-08-27 15:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(268,7,'MODIFICAR','2017-08-27 15:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(269,7,'MODIFICAR','2017-08-27 15:18:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(270,7,'MODIFICAR','2017-08-27 15:18:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(271,7,'MODIFICAR','2017-08-27 15:18:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(272,7,'MODIFICAR','2017-08-27 15:18:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(273,7,'MODIFICAR','2017-08-27 15:18:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(274,7,'MODIFICAR','2017-08-27 15:18:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(275,7,'MODIFICAR','2017-08-27 15:18:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(276,7,'MODIFICAR','2017-08-27 15:18:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(277,7,'MODIFICAR','2017-08-27 15:21:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(278,7,'MODIFICAR','2017-08-27 15:21:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(279,7,'MODIFICAR','2017-08-27 15:21:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(280,7,'MODIFICAR','2017-08-27 15:21:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(281,7,'MODIFICAR','2017-08-27 15:21:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(282,7,'MODIFICAR','2017-08-27 15:21:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(283,7,'MODIFICAR','2017-08-27 15:21:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(284,7,'MODIFICAR','2017-08-27 15:21:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(285,7,'MODIFICAR','2017-08-27 15:25:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(286,7,'MODIFICAR','2017-08-27 15:25:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(287,7,'MODIFICAR','2017-08-27 15:25:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(288,7,'MODIFICAR','2017-08-27 15:25:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(289,7,'MODIFICAR','2017-08-27 15:26:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(290,7,'MODIFICAR','2017-08-27 15:26:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(291,7,'MODIFICAR','2017-08-27 15:26:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(292,7,'MODIFICAR','2017-08-27 15:26:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(293,7,'MODIFICAR','2017-08-27 15:26:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(294,7,'MODIFICAR','2017-08-27 15:26:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(295,7,'MODIFICAR','2017-08-27 15:26:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(296,7,'MODIFICAR','2017-08-27 15:26:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(297,7,'MODIFICAR','2017-08-27 15:31:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(298,7,'MODIFICAR','2017-08-27 15:31:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(299,7,'MODIFICAR','2017-08-27 15:31:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(300,7,'MODIFICAR','2017-08-27 15:31:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(301,7,'MODIFICAR','2017-08-27 16:35:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(302,7,'MODIFICAR','2017-08-27 16:35:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(303,7,'MODIFICAR','2017-08-27 16:35:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(304,7,'MODIFICAR','2017-08-27 16:38:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(305,7,'MODIFICAR','2017-08-27 16:38:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(306,7,'MODIFICAR','2017-08-27 16:38:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(307,7,'MODIFICAR','2017-08-27 16:38:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(308,7,'MODIFICAR','2017-08-27 16:38:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(309,7,'MODIFICAR','2017-08-27 16:38:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(310,7,'MODIFICAR','2017-08-27 16:46:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(311,7,'MODIFICAR','2017-08-27 16:46:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(312,7,'MODIFICAR','2017-08-27 16:46:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(313,7,'MODIFICAR','2017-08-27 16:46:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(314,7,'MODIFICAR','2017-08-27 16:46:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(315,7,'MODIFICAR','2017-08-27 16:46:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(316,7,'MODIFICAR','2017-08-27 16:46:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(317,7,'MODIFICAR','2017-08-27 16:46:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(318,7,'MODIFICAR','2017-08-27 16:46:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(319,7,'MODIFICAR','2017-08-27 16:47:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(320,7,'MODIFICAR','2017-08-27 16:47:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(321,7,'MODIFICAR','2017-08-27 16:47:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(322,7,'MODIFICAR','2017-08-27 16:47:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T12:00:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 5,inicio : \"2017-08-27T12:00:00\",fin : \"2017-08-27T20:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(323,7,'MODIFICAR','2017-08-27 16:47:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:00:00 CUYA DESCRIPCION ES hola Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}','{id : 7,inicio : \"2017-08-27T09:00:00\",fin : \"2017-08-27T15:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 3}'),(324,7,'MODIFICAR','2017-08-27 16:47:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-08-27T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}','{id : 8,inicio : \"2017-08-27T09:30:00\",fin : \"2017-08-27T16:30:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 1}'),(325,7,'INSERTAR','2017-09-02 15:09:59','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ESPERA',NULL,'{id : 9,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 3}'),(326,7,'MODIFICAR','2017-09-02 15:10:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-10T09:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-09-10T09:00:00\",fin : \"2017-09-10T11:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(327,7,'MODIFICAR','2017-09-02 15:10:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T09:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-09-10T09:00:00\",fin : \"2017-09-10T11:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T11:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(328,7,'MODIFICAR','2017-09-02 15:10:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T11:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T11:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-09-03T11:00:00\",fin : \"2017-09-03T13:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(329,7,'MODIFICAR','2017-09-02 15:11:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T09:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 3}','{id : 9,inicio : \"2017-09-03T09:30:00\",fin : \"2017-09-03T11:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(330,7,'MODIFICAR','2017-09-02 15:11:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T09:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-09-03T09:30:00\",fin : \"2017-09-03T11:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 9,inicio : \"2017-09-03T09:30:00\",fin : \"2017-09-03T11:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}'),(331,7,'MODIFICAR','2017-09-02 15:11:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T10:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-09-03T09:30:00\",fin : \"2017-09-03T11:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 3}','{id : 9,inicio : \"2017-09-03T10:30:00\",fin : \"2017-09-03T12:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 7,id_tribunal : 3}'),(332,7,'INSERTAR','2017-09-02 15:16:04','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-03T09:00:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 10,inicio : \"2017-09-03T09:00:00\",fin : \"2017-09-03T18:00:00\",descripcion : \"HOLA\",id_sala : 4,id_tribunal : 1}'),(333,7,'INSERTAR','2017-09-02 15:16:37','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ESPERA',NULL,'{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(334,7,'MODIFICAR','2017-09-02 15:16:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-03T10:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-09-03T10:00:00\",fin : \"2017-09-03T12:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(335,7,'INSERTAR','2017-09-02 15:31:21','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-05T08:00:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 12,inicio : \"2017-09-05T08:00:00\",fin : \"2017-09-05T14:30:00\",descripcion : \"HOLA\",id_sala : 3,id_tribunal : 1}'),(336,7,'INSERTAR','2017-09-02 15:31:46','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-05T09:30:00 CUYA DESCRIPCION ES HDHD Y SU ESTATUS ES ASIGNADO',NULL,'{id : 13,inicio : \"2017-09-05T09:30:00\",fin : \"2017-09-05T15:00:00\",descripcion : \"HDHD\",id_sala : 4,id_tribunal : 3}'),(337,7,'INSERTAR','2017-09-02 15:32:31','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-05T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 14,inicio : \"2017-09-05T09:30:00\",fin : \"2017-09-05T13:00:00\",descripcion : \"HOLA\",id_sala : 6,id_tribunal : 3}'),(338,7,'INSERTAR','2017-09-02 15:32:57','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-06T10:00:00 CUYA DESCRIPCION ES HILA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 15,inicio : \"2017-09-06T10:00:00\",fin : \"2017-09-06T17:00:00\",descripcion : \"HILA\",id_sala : 3,id_tribunal : 1}'),(339,7,'INSERTAR','2017-09-02 15:34:27','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-07T09:00:00 CUYA DESCRIPCION ES KD Y SU ESTATUS ES ASIGNADO',NULL,'{id : 16,inicio : \"2017-09-07T09:00:00\",fin : \"2017-09-07T14:00:00\",descripcion : \"KD\",id_sala : 4,id_tribunal : 3}'),(340,7,'INSERTAR','2017-09-02 15:35:41','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-07T10:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 17,inicio : \"2017-09-07T10:30:00\",fin : \"2017-09-07T16:00:00\",descripcion : \"HOLA\",id_sala : 7,id_tribunal : 4}'),(341,7,'INSERTAR','2017-09-12 12:56:33','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ESPERA',NULL,'{id : 18,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 3}'),(342,7,'MODIFICAR','2017-09-12 12:56:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T09:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T09:30:00\",fin : \"2017-09-13T11:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(343,7,'MODIFICAR','2017-09-12 12:56:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T09:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T09:30:00\",fin : \"2017-09-13T11:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T09:30:00\",fin : \"2017-09-13T17:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(344,7,'MODIFICAR','2017-09-12 12:57:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:00:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T09:30:00\",fin : \"2017-09-13T17:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:00:00\",fin : \"2017-09-13T16:00:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 8,id_tribunal : 3}'),(345,7,'MODIFICAR','2017-09-12 12:57:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T10:00:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:00:00\",fin : \"2017-09-13T16:00:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 8,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T10:00:00\",fin : \"2017-09-13T18:00:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}'),(346,7,'MODIFICAR','2017-09-12 12:57:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T09:00:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T10:00:00\",fin : \"2017-09-13T18:00:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T09:00:00\",fin : \"2017-09-13T17:00:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 3}'),(347,7,'MODIFICAR','2017-09-12 12:57:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T09:00:00\",fin : \"2017-09-13T17:00:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(348,7,'MODIFICAR','2017-09-13 16:00:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(349,7,'MODIFICAR','2017-09-13 16:00:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(350,7,'MODIFICAR','2017-09-13 16:01:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(351,7,'MODIFICAR','2017-09-13 16:01:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(352,7,'MODIFICAR','2017-09-13 16:03:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(353,7,'MODIFICAR','2017-09-13 16:04:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(354,7,'MODIFICAR','2017-09-13 16:04:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(355,7,'INSERTAR','2017-09-13 16:05:39','SALA','SE HA REGISTRADO UNA SALA COMO SALA20',NULL,'{id : 9,descripcion : \"SALA20\",color : \"#611111\"}'),(356,7,'MODIFICAR','2017-09-13 16:08:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(357,7,'MODIFICAR','2017-09-13 16:08:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(358,7,'MODIFICAR','2017-09-13 16:10:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(359,7,'MODIFICAR','2017-09-13 16:11:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(360,7,'MODIFICAR','2017-09-13 16:14:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(361,7,'MODIFICAR','2017-09-13 16:14:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(362,7,'MODIFICAR','2017-09-13 16:14:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(363,7,'MODIFICAR','2017-09-13 16:15:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(364,7,'INSERTAR','2017-09-13 16:16:04','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-14T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 19,inicio : \"2017-09-14T09:00:00\",fin : \"2017-09-14T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 1}'),(365,7,'MODIFICAR','2017-09-13 16:16:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(366,7,'MODIFICAR','2017-09-13 16:16:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(367,7,'MODIFICAR','2017-09-13 16:16:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(368,7,'MODIFICAR','2017-09-13 16:16:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(369,7,'INSERTAR','2017-09-13 16:16:38','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES SS Y SU ESTATUS ES ESPERA',NULL,'{id : 20,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"SS\",id_sala : 1,id_tribunal : 1}'),(370,7,'MODIFICAR','2017-09-13 16:16:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(371,7,'MODIFICAR','2017-09-13 16:16:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-15T09:30:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 20,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"SS\",id_sala : 1,id_tribunal : 1}','{id : 20,inicio : \"2017-09-15T09:30:00\",fin : \"2017-09-15T11:30:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}'),(372,7,'MODIFICAR','2017-09-13 16:16:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-15T09:30:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 20,inicio : \"2017-09-15T09:30:00\",fin : \"2017-09-15T11:30:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}','{id : 20,inicio : \"2017-09-15T09:30:00\",fin : \"2017-09-15T17:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}'),(373,7,'MODIFICAR','2017-09-13 16:17:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-15T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 20,inicio : \"2017-09-15T09:30:00\",fin : \"2017-09-15T17:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}','{id : 20,inicio : \"2017-09-15T08:30:00\",fin : \"2017-09-15T16:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(374,7,'MODIFICAR','2017-09-13 16:17:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-15T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 20,inicio : \"2017-09-15T08:30:00\",fin : \"2017-09-15T16:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 20,inicio : \"2017-09-15T08:30:00\",fin : \"2017-09-15T16:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 8,id_tribunal : 1}'),(375,7,'MODIFICAR','2017-09-13 16:17:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-15T09:30:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 20,inicio : \"2017-09-15T08:30:00\",fin : \"2017-09-15T16:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 8,id_tribunal : 1}','{id : 20,inicio : \"2017-09-15T09:30:00\",fin : \"2017-09-15T17:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}'),(376,7,'MODIFICAR','2017-09-13 16:17:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-15T10:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 20,inicio : \"2017-09-15T09:30:00\",fin : \"2017-09-15T17:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}','{id : 20,inicio : \"2017-09-15T10:00:00\",fin : \"2017-09-15T17:30:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(377,7,'MODIFICAR','2017-09-13 16:17:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-15T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 20,inicio : \"2017-09-15T10:00:00\",fin : \"2017-09-15T17:30:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 20,inicio : \"2017-09-15T08:30:00\",fin : \"2017-09-15T16:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(378,7,'MODIFICAR','2017-09-13 16:18:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-15T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 20,inicio : \"2017-09-15T08:30:00\",fin : \"2017-09-15T16:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 20,inicio : \"2017-09-15T08:30:00\",fin : \"2017-09-15T13:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(379,7,'MODIFICAR','2017-09-13 16:18:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(380,7,'MODIFICAR','2017-09-13 16:18:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(381,7,'MODIFICAR','2017-09-13 16:18:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(382,7,'INSERTAR','2017-09-13 16:18:45','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-09-14T09:30:00 CUYA DESCRIPCION ES DD Y SU ESTATUS ES ASIGNADO',NULL,'{id : 21,inicio : \"2017-09-14T09:30:00\",fin : \"2017-09-14T13:30:00\",descripcion : \"DD\",id_sala : 6,id_tribunal : 1}'),(383,7,'MODIFICAR','2017-09-13 16:18:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(384,7,'MODIFICAR','2017-09-13 16:18:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-14T09:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 19,inicio : \"2017-09-14T09:00:00\",fin : \"2017-09-14T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 1}','{id : 19,inicio : \"2017-09-14T09:00:00\",fin : \"2017-09-14T12:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(385,7,'MODIFICAR','2017-09-13 16:18:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-14T12:30:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 21,inicio : \"2017-09-14T09:30:00\",fin : \"2017-09-14T13:30:00\",descripcion : \"DD\",id_sala : 6,id_tribunal : 1}','{id : 21,inicio : \"2017-09-14T12:30:00\",fin : \"2017-09-14T16:30:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(386,7,'MODIFICAR','2017-09-13 16:19:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-14T10:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 21,inicio : \"2017-09-14T12:30:00\",fin : \"2017-09-14T16:30:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 21,inicio : \"2017-09-14T10:00:00\",fin : \"2017-09-14T14:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}'),(387,7,'MODIFICAR','2017-09-13 16:19:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-14T10:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 19,inicio : \"2017-09-14T09:00:00\",fin : \"2017-09-14T12:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 19,inicio : \"2017-09-14T10:00:00\",fin : \"2017-09-14T13:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(388,7,'MODIFICAR','2017-09-13 16:19:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(389,7,'MODIFICAR','2017-09-13 16:19:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(390,7,'MODIFICAR','2017-09-13 16:19:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(391,7,'MODIFICAR','2017-09-13 16:19:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(392,7,'MODIFICAR','2017-09-13 16:20:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(393,7,'MODIFICAR','2017-09-13 16:21:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(394,7,'MODIFICAR','2017-09-13 16:22:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(395,7,'MODIFICAR','2017-09-13 16:22:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(396,7,'MODIFICAR','2017-09-13 16:22:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(397,7,'MODIFICAR','2017-09-13 16:22:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(398,7,'MODIFICAR','2017-09-13 16:23:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(399,7,'MODIFICAR','2017-09-13 16:23:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(400,7,'MODIFICAR','2017-09-13 16:24:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(401,7,'MODIFICAR','2017-09-13 16:24:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(402,7,'MODIFICAR','2017-09-13 16:25:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(403,7,'MODIFICAR','2017-09-13 16:26:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(404,7,'MODIFICAR','2017-09-13 16:26:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(405,7,'MODIFICAR','2017-09-13 16:26:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-13T08:30:00 CUYA DESCRIPCION ES 1: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}','{id : 18,inicio : \"2017-09-13T08:30:00\",fin : \"2017-09-13T16:30:00\",descripcion : \"1: JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 3}'),(406,7,'MODIFICAR','2017-09-14 22:48:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-14T10:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 19,inicio : \"2017-09-14T10:00:00\",fin : \"2017-09-14T13:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 19,inicio : \"2017-09-14T10:00:00\",fin : \"2017-09-14T13:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(407,7,'MODIFICAR','2017-09-14 22:48:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-09-14T10:00:00 CUYA DESCRIPCION ES 1: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 21,inicio : \"2017-09-14T10:00:00\",fin : \"2017-09-14T14:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}','{id : 21,inicio : \"2017-09-14T10:00:00\",fin : \"2017-09-14T14:00:00\",descripcion : \"1: JUICIO DE PRESENTACION\",id_sala : 7,id_tribunal : 1}');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso`
--

DROP TABLE IF EXISTS `caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(300) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
INSERT INTO `caso` VALUES (1,'1','ROBO A MANO ARMADAS',7,'2017-08-24 18:18:12'),(2,'2','robo',0,'2017-08-24 20:04:22');
/*!40000 ALTER TABLE `caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_alguacil`
--

DROP TABLE IF EXISTS `caso_alguacil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_alguacil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '3',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'ALGUACIL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_alguacil`
--

LOCK TABLES `caso_alguacil` WRITE;
/*!40000 ALTER TABLE `caso_alguacil` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_alguacil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_defensor`
--

DROP TABLE IF EXISTS `caso_defensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_defensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '1',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'DEFENSOR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_defensor`
--

LOCK TABLES `caso_defensor` WRITE;
/*!40000 ALTER TABLE `caso_defensor` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_defensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_fiscal`
--

DROP TABLE IF EXISTS `caso_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '8',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'FISCAL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_fiscal`
--

LOCK TABLES `caso_fiscal` WRITE;
/*!40000 ALTER TABLE `caso_fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_imputado`
--

DROP TABLE IF EXISTS `caso_imputado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_imputado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(200) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '4',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'IMPUTADO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_imputado`
--

LOCK TABLES `caso_imputado` WRITE;
/*!40000 ALTER TABLE `caso_imputado` DISABLE KEYS */;
INSERT INTO `caso_imputado` VALUES (4,'2','V-21301059',4,'IMPUTADO'),(5,'XHR-212','V-21301059',4,'IMPUTADO'),(6,'CHR-32','V-21301059',4,'IMPUTADO'),(7,'1','V-21301059',4,'IMPUTADO');
/*!40000 ALTER TABLE `caso_imputado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_juez`
--

DROP TABLE IF EXISTS `caso_juez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_juez` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_juez`
--

LOCK TABLES `caso_juez` WRITE;
/*!40000 ALTER TABLE `caso_juez` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_juez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_secretaria`
--

DROP TABLE IF EXISTS `caso_secretaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_secretaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_secretaria`
--

LOCK TABLES `caso_secretaria` WRITE;
/*!40000 ALTER TABLE `caso_secretaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_secretaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_testigo`
--

DROP TABLE IF EXISTS `caso_testigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_testigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '7',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'TESTIGO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_testigo`
--

LOCK TABLES `caso_testigo` WRITE;
/*!40000 ALTER TABLE `caso_testigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_testigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_victima`
--

DROP TABLE IF EXISTS `caso_victima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_victima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(200) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '6',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'VICTIMA',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_victima`
--

LOCK TABLES `caso_victima` WRITE;
/*!40000 ALTER TABLE `caso_victima` DISABLE KEYS */;
INSERT INTO `caso_victima` VALUES (6,'2','V-21301061',6,'VICTIMA'),(7,'XHR-212','V-21301061',6,'VICTIMA'),(8,'CHR-32','V-21301061',6,'VICTIMA'),(9,'1','V-21301063',6,'VICTIMA');
/*!40000 ALTER TABLE `caso_victima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_datatables`
--

DROP TABLE IF EXISTS `config_datatables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_datatables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_keys` tinyint(1) NOT NULL,
  `info` tinyint(1) NOT NULL,
  `stateSave` tinyint(1) NOT NULL,
  `scrollCollapse` tinyint(1) NOT NULL,
  `responsive` tinyint(1) NOT NULL,
  `paging` tinyint(1) NOT NULL,
  `colReorder` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_datatables`
--

LOCK TABLES `config_datatables` WRITE;
/*!40000 ALTER TABLE `config_datatables` DISABLE KEYS */;
INSERT INTO `config_datatables` VALUES (1,1,0,1,1,1,1,1);
/*!40000 ALTER TABLE `config_datatables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_generales`
--

DROP TABLE IF EXISTS `config_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_generales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basedatos` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_generales`
--

LOCK TABLES `config_generales` WRITE;
/*!40000 ALTER TABLE `config_generales` DISABLE KEYS */;
INSERT INTO `config_generales` VALUES (1,'dem','root','root');
/*!40000 ALTER TABLE `config_generales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_notificaciones`
--

DROP TABLE IF EXISTS `config_notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servSMSinst` varchar(1000) NOT NULL,
  `servSMSprog` varchar(1000) NOT NULL,
  `servEmail` varchar(1000) NOT NULL,
  `servSMTP` varchar(1000) NOT NULL,
  `puerto` int(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `socket_address` varchar(200) NOT NULL,
  `socket_port` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_notificaciones`
--

LOCK TABLES `config_notificaciones` WRITE;
/*!40000 ALTER TABLE `config_notificaciones` DISABLE KEYS */;
INSERT INTO `config_notificaciones` VALUES (1,'../message_server/sms/api/outbox','../message_server/sms/schedule','../message_server/mail/api','smtp.gmail.com',465,'dem.sanfelipe@gmail.com','qwertyuiop1234567890','127.0.0.1',9300);
/*!40000 ALTER TABLE `config_notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_programador`
--

DROP TABLE IF EXISTS `config_programador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_programador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(100) NOT NULL,
  `weekends` tinyint(1) NOT NULL,
  `weekNumbers` tinyint(1) NOT NULL,
  `weekNumbersWithinDays` tinyint(1) NOT NULL,
  `start` varchar(20) NOT NULL,
  `end` varchar(20) NOT NULL,
  `showNonCurrentDates` tinyint(1) NOT NULL,
  `minTime` varchar(20) NOT NULL,
  `maxTime` varchar(20) NOT NULL,
  `slotDuration` varchar(20) NOT NULL,
  `noEventsMessage` varchar(200) NOT NULL,
  `nowIndicator` tinyint(1) NOT NULL,
  `defaultView` varchar(100) NOT NULL,
  `allDaySlot` tinyint(1) NOT NULL,
  `hiddenDays` varchar(20) NOT NULL,
  `eventOverlap` tinyint(1) NOT NULL,
  `selectable` tinyint(1) NOT NULL,
  `droppable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_programador`
--

LOCK TABLES `config_programador` WRITE;
/*!40000 ALTER TABLE `config_programador` DISABLE KEYS */;
INSERT INTO `config_programador` VALUES (1,'es',1,0,1,'08:00:00','18:00:00',1,'08:00:00','18:00:00','00:30:00','NO SE HAN CREADO ACTOS',1,'agendaDay',0,'',0,1,1);
/*!40000 ALTER TABLE `config_programador` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor`
--

LOCK TABLES `defensor` WRITE;
/*!40000 ALTER TABLE `defensor` DISABLE KEYS */;
INSERT INTO `defensor` VALUES (3,'V-21301059','PUBLICO','393939'),(4,'V-21301089','PUBLICO','78378783');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscal`
--

LOCK TABLES `fiscal` WRITE;
/*!40000 ALTER TABLE `fiscal` DISABLE KEYS */;
INSERT INTO `fiscal` VALUES (1,'V-21301059',4,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imputado`
--

LOCK TABLES `imputado` WRITE;
/*!40000 ALTER TABLE `imputado` DISABLE KEYS */;
INSERT INTO `imputado` VALUES (1,'V-21301059','IMPUTADO');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juez`
--

LOCK TABLES `juez` WRITE;
/*!40000 ALTER TABLE `juez` DISABLE KEYS */;
INSERT INTO `juez` VALUES (30,'V-21301059');
/*!40000 ALTER TABLE `juez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `icon` varchar(5000) NOT NULL DEFAULT '3.png',
  `body` varchar(5000) NOT NULL,
  `user` varchar(20) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `ip` varchar(300) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'HOLA','3.png','hola','V-22222222','','192.168.1.4','notificacion','2017-08-22 14:24:47',0),(2,'HOLA','3.png','hola','V-22222222','','192.168.1.4','notificacion','2017-08-22 14:28:37',0),(3,'HOLA','5.png','hola','','USUARIO ESPECIAL','192.168.1.4','notificacion','2017-08-22 14:28:35',0),(4,'HOLA','4.png','hola','','','192.168.1.4','notificacion','2017-08-22 14:28:38',0),(5,'HOLA','4.png','hola','','','192.168.1.4','notificacion','2017-08-22 14:53:26',0),(6,'HOLA','4.png','hola','','','192.168.1.4','notificacion','2017-08-26 22:17:18',0),(7,'HOLA','5.png','hola','','USUARIO ESPECIAL','192.168.1.4','notificacion','2017-08-22 14:43:44',0);
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
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
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`,`email`,`telefono`),
  UNIQUE KEY `cedula_2` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (3,'V-21301061','PEDRO JOSE H','SANCHEZ','PEDRO@GMAIL.COM','+58 389 390 37 30','20/10/1992',7,'2017-08-24 00:48:30'),(4,'V-21301062','JOSE','SANCHEZ','JOSE@GMAIL.COM','+58 983 489 38 43','12/12/1992',7,'2017-08-24 01:19:13'),(5,'V-21301059','ANTHONY','MEDINA','ANTHONYJMEDINAF@GMAIL.COM','+58 432 844 95 44','20/10/1992',7,'2017-08-24 17:25:47'),(6,'V-21301063','JUAN','PEREZ','JUANPQ2@GMAIL.COM','+58 849 934 34 38','07/08/2017',7,'2017-08-23 23:52:05'),(13,'V-21301064','MILAGROS','RODRIGUEZ','MILI@GMAIL.COM','+58 398 339 38 33','08/08/2017',7,'2017-08-24 00:42:21'),(22,'V-21301065','JAU','PEREZ','JUA@SKS','+58 933 993 93 93','15/08/2017',7,'2017-08-24 16:59:51'),(23,'V-21301066','JOSE','MORELO','JA@SJS','+58 494 949 49 49','15/08/2017',7,'2017-08-24 17:01:31'),(25,'V-21301067','MANUEL','MANU','HSHS@DSFJKDSF','+58 938 934 83 44','09/08/2017',7,'2017-08-24 17:04:39'),(27,'V-21301089','JUAN','SANCEGZ','KJSKJ@SJS','+58 387 938 93 83','01/08/2017',7,'2017-08-24 17:21:05'),(28,'V-21301087','MARIALES','SUAREZ','JOSE@GMAIL.COM','+58 239 834 72 97','22/08/2017',7,'2017-08-24 17:21:44'),(31,'V-21301833','MANIE','KFJKLDJF','SKJJSS@AJK','+58 894 739 84 09','23/08/2017',7,'2017-08-24 17:22:54'),(33,'V-21301054','TO','SKJS','KDKJD@SKS','+58 329 849 03 28','01/08/2017',7,'2017-08-24 17:23:51'),(35,'V-28228333','JAJA','SJS','SJSJS@SJS','+58 398 389 38 33','01/08/2017',7,'2017-08-24 17:24:44'),(37,'V-28283822','JKSLKJS','JSKH','JJSJS@SKS','+58 834 394 83 94','16/08/2017',7,'2017-08-24 17:26:14'),(38,'V-19355522','MIGUEL','ALVES','MIGUELALVES@GMAIL.COM','+58 487 398 47 39','19/10/1992',7,'2017-09-14 22:48:41'),(39,'V-21301333','JUAN','PEREZ','JUAN@GMAIL.COM','+58 489 349 73 97','20/10/1992',7,'2017-09-14 23:06:36');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_tipo`
--

DROP TABLE IF EXISTS `persona_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `tipo_persona` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_tipo`
--

LOCK TABLES `persona_tipo` WRITE;
/*!40000 ALTER TABLE `persona_tipo` DISABLE KEYS */;
INSERT INTO `persona_tipo` VALUES (1,'V-21301059',9),(26,'V-21301059',5),(30,'V-21301059',1),(32,'V-21301059',3),(33,'V-21301089',1),(35,'V-21301064',2),(36,'V-21301061',6),(38,'V-21301059',4),(40,'V-21301063',6),(42,'V-21301059',8),(43,'V-19355522',9),(44,'V-21301333',9);
/*!40000 ALTER TABLE `persona_tipo` ENABLE KEYS */;
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
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `descripcion` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'SALA 1','#f92323',0,'2017-07-27 02:53:49'),(2,'SALA 2','#3882ea',0,'2017-07-27 02:54:06'),(3,'SALA 4','#b20c0c',7,'2017-08-26 17:37:06'),(4,'SALA 3','#e6ec18',7,'2017-08-26 17:37:38'),(6,'SALA 5','#ed02d0',7,'2017-08-26 17:38:08'),(7,'SALA 6','#1de2f2',7,'2017-08-26 17:38:24'),(8,'SALA 7','#08da0c',7,'2017-08-26 17:38:51'),(9,'SALA20','#611111',7,'2017-09-13 16:05:39');
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
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "SALA",
               CONCAT('SE HA REGISTRADO UNA SALA COMO ', NEW.descripcion),
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
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "SALA", 
               CONCAT('SE HA CAMBIADO NOMBRE DE ' , OLD.descripcion,  ' A ', NEW.descripcion),
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
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "ELIMINAR", 
               "SALA", 
               CONCAT('SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO ', OLD.descripcion),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretaria`
--

LOCK TABLES `secretaria` WRITE;
/*!40000 ALTER TABLE `secretaria` DISABLE KEYS */;
INSERT INTO `secretaria` VALUES (2,'V-21301064');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testigo`
--

LOCK TABLES `testigo` WRITE;
/*!40000 ALTER TABLE `testigo` DISABLE KEYS */;
INSERT INTO `testigo` VALUES (1,'V-21301063',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_testigo`
--

LOCK TABLES `tipo_de_testigo` WRITE;
/*!40000 ALTER TABLE `tipo_de_testigo` DISABLE KEYS */;
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
INSERT INTO `tipo_de_tribunal` VALUES (1,'TRIBUNAL ITINERANTE',0,'2017-07-27 02:54:39'),(2,'TRIBUNAL DE JUICIO',0,'2017-07-27 02:54:51'),(3,'TRIBUNAL DE CONTROL',0,'2017-07-27 02:55:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_persona`
--

LOCK TABLES `tipo_persona` WRITE;
/*!40000 ALTER TABLE `tipo_persona` DISABLE KEYS */;
INSERT INTO `tipo_persona` VALUES (1,'DEFENSOR',1,'2017-07-11 22:25:03'),(2,'SECRETARIA',1,'2017-07-11 22:25:06'),(3,'ALGUACIL',1,'2017-07-11 22:25:08'),(4,'IMPUTADO',1,'2017-07-11 22:25:10'),(5,'JUEZ',1,'2017-07-11 22:25:13'),(6,'VICTIMA',1,'2017-07-11 22:25:16'),(7,'TESTIGO',1,'2017-07-11 22:25:19'),(8,'FISCAL',1,'2017-07-11 22:25:21'),(9,'USUARIO',1,'2017-07-11 22:24:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tribunal`
--

LOCK TABLES `tribunal` WRITE;
/*!40000 ALTER TABLE `tribunal` DISABLE KEYS */;
INSERT INTO `tribunal` VALUES (1,'TRIBUNAL 1',1,0,'2017-07-27 02:55:24'),(3,'TRIBUNAL 2',2,0,'2017-07-27 02:55:49'),(4,'TRIBUNAL 3',3,0,'2017-07-27 02:56:15');
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
  `imagen` varchar(2000) NOT NULL DEFAULT 'icon-user.png',
  `nivel` varchar(100) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`cedula`),
  UNIQUE KEY `id_persona` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (7,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd','IMG_9F893DE4D24C3ED98C95109A693A1D8C.jpg','ADMINISTRADOR',NULL,'2017-08-27 16:47:21'),(8,'V-19355522','cd384cb025c665f7ff97c16478b3ea9b4b456c58','icon-user.png','USUARIO ESPECIAL',NULL,'2017-09-14 22:50:56'),(9,'V-21301333','7f06c04d59bd83605193621e8d0d693bd30cdc9e','icon-user.png','USUARIO COMUN',NULL,'2017-09-14 23:07:52');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victima`
--

LOCK TABLES `victima` WRITE;
/*!40000 ALTER TABLE `victima` DISABLE KEYS */;
INSERT INTO `victima` VALUES (2,'V-21301061'),(1,'V-21301063');
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
  `tipo_persona` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_bitacora`
--

DROP TABLE IF EXISTS `vista_bitacora`;
/*!50001 DROP VIEW IF EXISTS `vista_bitacora`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_bitacora` (
  `id` tinyint NOT NULL,
  `operacion` tinyint NOT NULL,
  `fecha` tinyint NOT NULL,
  `tabla` tinyint NOT NULL,
  `accion` tinyint NOT NULL,
  `registro_anterior` tinyint NOT NULL,
  `registro_nuevo` tinyint NOT NULL,
  `usuario` tinyint NOT NULL
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
  `impres` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `tipo_persona` tinyint NOT NULL
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
  `tipo_persona` tinyint NOT NULL,
  `numero` tinyint NOT NULL
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
  `tipo_persona` tinyint NOT NULL,
  `condicion` tinyint NOT NULL
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
  `tipo_persona` tinyint NOT NULL
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
  `tipo_persona` tinyint NOT NULL
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
-- Temporary table structure for view `vista_usuario`
--

DROP TABLE IF EXISTS `vista_usuario`;
/*!50001 DROP VIEW IF EXISTS `vista_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_usuario` (
  `id` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `nombres` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefono` tinyint NOT NULL,
  `fecha_de_nacimiento` tinyint NOT NULL,
  `clave` tinyint NOT NULL,
  `nivel` tinyint NOT NULL,
  `id_tipo_persona` tinyint NOT NULL,
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
  `tipo_persona` tinyint NOT NULL
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
/*!50001 VIEW `acto_sala` AS select `acto`.`id` AS `id`,`acto`.`inicio` AS `start`,`acto`.`fin` AS `end`,`acto`.`id_sala` AS `resourceId`,`acto`.`estatus` AS `estatus`,concat(`caso`.`numero`,': ',`actividad`.`actividad`) AS `title`,`caso`.`numero` AS `numero`,`caso`.`descripcion` AS `descripcion`,`acto`.`descripcion` AS `descripcion_acto`,`sala`.`descripcion` AS `sala`,`tribunal`.`id` AS `id_tribunal`,`tribunal`.`numero` AS `tribunal` from ((((`acto` join `actividad` on((`acto`.`id_actividad` = `actividad`.`id`))) join `caso` on((`acto`.`numero_caso` = `caso`.`numero`))) join `sala` on((`acto`.`id_sala` = `sala`.`id`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) */;
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
/*!50001 VIEW `persona_tipo_persona` AS select `persona_tipo`.`cedula` AS `cedula`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `nombre_completo`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`telefono` AS `telefono`,`tipo_persona`.`descripcion` AS `descripcion`,`tipo_persona`.`id` AS `id_tipo_persona` from ((`persona_tipo` join `persona` on((`persona_tipo`.`cedula` = `persona`.`cedula`))) join `tipo_persona` on((`tipo_persona`.`id` = `persona_tipo`.`tipo_persona`))) */;
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
/*!50001 VIEW `vista_alguacil` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_bitacora`
--

/*!50001 DROP TABLE IF EXISTS `vista_bitacora`*/;
/*!50001 DROP VIEW IF EXISTS `vista_bitacora`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_bitacora` AS select `b`.`id` AS `id`,`b`.`operacion` AS `operacion`,`b`.`fecha` AS `fecha`,`b`.`tabla` AS `tabla`,`b`.`accion` AS `accion`,`b`.`registro_anterior` AS `registro_anterior`,`b`.`registro_nuevo` AS `registro_nuevo`,concat(`p`.`nombres`,' ',`p`.`apellidos`) AS `usuario` from ((`bitacora` `b` join `usuario` `u` on((`b`.`usuario` = `u`.`id`))) join `persona` `p` on((`p`.`cedula` = `u`.`cedula`))) */;
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
/*!50001 VIEW `vista_defensor` AS select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`d`.`impres` AS `impres`,`d`.`tipo` AS `tipo`,`pt`.`tipo_persona` AS `tipo_persona` from ((`persona` `p` join `defensor` `d` on((`p`.`cedula` = `d`.`cedula`))) join `persona_tipo` `pt` on((`pt`.`cedula` = `p`.`cedula`))) where (`pt`.`tipo_persona` = 1) */;
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
/*!50001 VIEW `vista_fiscal` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona`,`fiscal`.`numero` AS `numero` from ((`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) join `fiscal` on((`persona`.`cedula` = `fiscal`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 8) */;
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
/*!50001 VIEW `vista_imputado` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona`,`imputado`.`condicion` AS `condicion` from ((`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) join `imputado` on((`persona`.`cedula` = `imputado`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 4) */;
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
/*!50001 VIEW `vista_juez` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 5) */;
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
/*!50001 VIEW `vista_secretaria` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 2) */;
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
/*!50001 VIEW `vista_testigo` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 7) */;
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
-- Final view structure for view `vista_usuario`
--

/*!50001 DROP TABLE IF EXISTS `vista_usuario`*/;
/*!50001 DROP VIEW IF EXISTS `vista_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuario` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`usuario`.`clave` AS `clave`,`usuario`.`nivel` AS `nivel`,`persona_tipo`.`tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from ((`persona` join `usuario` on((`persona`.`cedula` = `usuario`.`cedula`))) join `persona_tipo` on((`persona_tipo`.`cedula` = `persona`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 9) */;
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
/*!50001 VIEW `vista_victima` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 6) */;
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

-- Dump completed on 2017-09-28  8:26:11
