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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'JUICIO DE PRESENTACION',1,1,'2017-07-04 13:00:03'),(2,'JUICIO DE SALIDA',1,1,'2017-09-30 16:59:01'),(3,'JUICIO DE ENTRADA',1,1,'2017-09-30 16:59:03'),(4,'JUICIO DE PRESENTACION',2,1,'2017-09-30 16:59:52'),(5,'ANTESALA DE JUICIO',2,1,'2017-09-30 16:59:54'),(6,'JUICIO DE SALIDA',3,1,'2017-09-30 17:00:31'),(7,'JUICIO DE ENTRADA',3,1,'2017-09-30 17:00:33');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_actividad` AFTER INSERT ON `actividad`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA REGISTRADO UNA ACTIVIDAD COMO ', NEW.actividad),
               NEW.id_usuario, 
               NULL, 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'actividad : "', NEW.actividad, '",',
                      'id_tipo_tribunal : "', NEW.id_tipo_tribunal, '"',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_actividad` AFTER UPDATE ON `actividad`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA CAMBIADO UNA ACTIVIDAD DE ' , OLD.actividad,  ' A ', NEW.actividad),
               NEW.id_usuario, 
               CONCAT(
                   '{',
                      'id : ', OLD.id, ',',
                      'actividad : "', OLD.actividad, '",',
                      'id_tipo_tribunal : "', OLD.id_tipo_tribunal, '"',
                   '}'
               ), 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'actividad : "', NEW.actividad, '",',
                      'id_tipo_tribunal : "', NEW.id_tipo_tribunal, '"',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_actividad` AFTER DELETE ON `actividad`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA ELIMINADO UNA ACTIVIDAD CUYA DESCRIPCION FUE REGISTRADA COMO ', OLD.actividad),
               OLD.id_usuario, 
               CONCAT(
                   '{',
                   		'id : ', OLD.id, ',',
                   		'actividad : "', OLD.actividad, '",',
                   		'id_tipo_tribunal : "', OLD.id_tipo_tribunal, '"',
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
  `numero_caso` varchar(50) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_sala` int(11) DEFAULT '1',
  `id_tribunal` int(11) NOT NULL DEFAULT '0',
  `estatus` varchar(20) NOT NULL DEFAULT 'ASIGNADO',
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-10-06T08:00:00','2017-10-06T10:30:00','DESCRIPCION','EXP-001',4,2,6,'FINALIZADO',1,'2017-10-06 15:31:48'),(2,'2017-10-18T08:30:00','2017-10-18T16:00:00','EXP-001: ANTESALA DE JUICIO','EXP-001',5,2,6,'ASIGNADO',1,'2017-10-17 11:43:02'),(3,'2017-10-08T09:00:00','2017-10-08T16:00:00','DE','EXP-001',2,3,1,'ASIGNADO',1,'2017-10-06 15:34:47'),(4,'2017-10-18T10:30:00','2017-10-18T18:00:00','EXP-001: JUICIO DE PRESENTACION','EXP-001',4,6,7,'ASIGNADO',1,'2017-10-17 11:46:14'),(5,'0000-00-00T00:00:00','0000-00-00T00:00:00','DES','EXP-001',1,1,1,'DIFERIDA',1,'2017-10-06 15:43:47'),(6,'2017-10-18T10:00:00','2017-10-18T12:00:00','HOLA','EXP-001',4,5,7,'ASIGNADO',1,'2017-10-17 11:43:39'),(7,'2017-10-07T08:30:00','2017-10-07T17:00:00','EXP-001: JUICIO DE ENTRADA','EXP-001',7,2,9,'ASIGNADO',1,'2017-10-06 16:02:58'),(8,'2017-10-06T08:00:00','2017-10-06T10:30:00','DESCRIPCION','EXP-001',4,1,6,'FINALIZADO',1,'2017-10-06 15:42:08'),(9,'2017-10-06T08:00:00','2017-10-06T10:30:00','DESCRIPCION','EXP-001',4,3,6,'FINALIZADO',1,'2017-10-06 15:42:08'),(10,'2017-10-12T08:00:00','2017-10-12T10:30:00','DESCRIPCION','EXP-001',4,4,6,'FINALIZADO',1,'2017-10-13 15:20:35'),(11,'2017-10-20T13:20:00','2017-10-20T16:30:00','DESCRIPCION','EXP-001',4,5,6,'FINALIZADO',1,'2017-10-20 20:31:43'),(12,'2017-10-20T10:00:00','2017-10-20T18:00:00','EXP-001: ANTESALA DE JUICIO','EXP-001',5,4,6,'FINALIZADO',1,'2017-10-20 22:30:28'),(13,'2017-10-20T08:00:00','2017-10-20T17:30:00','DESCRIPCION','EXP-001',6,1,9,'FINALIZADO',1,'2017-10-20 21:31:31');
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
  `tribunal` tinyint NOT NULL,
  `id_tipo_tribunal` tinyint NOT NULL,
  `tipo_de_tribunal` tinyint NOT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alguacil`
--

LOCK TABLES `alguacil` WRITE;
/*!40000 ALTER TABLE `alguacil` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,1,'INSERTAR','2017-10-01 18:50:04','SALA','SE HA REGISTRADO UNA SALA COMO SALA 1',NULL,'{id : 1,descripcion : \"SALA 1\",color : \"#e82c2c\"}'),(2,1,'INSERTAR','2017-10-01 18:50:36','SALA','SE HA REGISTRADO UNA SALA COMO SALA 2',NULL,'{id : 2,descripcion : \"SALA 2\",color : \"#06147f\"}'),(3,1,'INSERTAR','2017-10-01 18:50:53','SALA','SE HA REGISTRADO UNA SALA COMO SALA 3',NULL,'{id : 3,descripcion : \"SALA 3\",color : \"#ffee00\"}'),(4,1,'INSERTAR','2017-10-01 18:51:10','SALA','SE HA REGISTRADO UNA SALA COMO SALA 4',NULL,'{id : 4,descripcion : \"SALA 4\",color : \"#008e21\"}'),(5,1,'INSERTAR','2017-10-01 18:51:29','SALA','SE HA REGISTRADO UNA SALA COMO SALA 5',NULL,'{id : 5,descripcion : \"SALA 5\",color : \"#00797f\"}'),(6,1,'INSERTAR','2017-10-01 18:51:55','SALA','SE HA REGISTRADO UNA SALA COMO SALA 6',NULL,'{id : 6,descripcion : \"SALA 6\",color : \"#ffc000\"}'),(7,1,'MODIFICAR','2017-10-01 18:53:47','SALA','SE HA CAMBIADO NOMBRE DE SALA 6 A SALA 6','{id : 6,descripcion : \"SALA 6\",color : \"#ffc000\"}','{id : 6,descripcion : \"SALA 6\",color : \"#ffc000\"}'),(8,1,'ELIMINAR','2017-10-01 18:53:47','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 6','{id : 6,descripcion : \"SALA 6\",color : \"#ffc000\"}',NULL),(9,1,'INSERTAR','2017-10-01 19:21:22','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-02T08:00:00 CUYA DESCRIPCION ES PRIMER JUICIO DEL CASO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 1,inicio : \"2017-10-02T08:00:00\",fin : \"2017-10-02T18:00:00\",descripcion : \"PRIMER JUICIO DEL CASO\",id_sala : 1,id_tribunal : 1}'),(10,1,'MODIFICAR','2017-10-01 19:28:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRIMER JUICIO DEL CASO Y SU ESTATUS ES ESPERA','{id : 1,inicio : \"2017-10-02T08:00:00\",fin : \"2017-10-02T18:00:00\",descripcion : \"PRIMER JUICIO DEL CASO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMER JUICIO DEL CASO\",id_sala : 1,id_tribunal : 1}'),(11,1,'MODIFICAR','2017-10-01 19:28:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-02T09:30:00 CUYA DESCRIPCION ES PRIMER JUICIO DEL CASO Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMER JUICIO DEL CASO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-10-02T09:30:00\",fin : \"2017-10-02T11:30:00\",descripcion : \"PRIMER JUICIO DEL CASO\",id_sala : 2,id_tribunal : 1}'),(12,1,'MODIFICAR','2017-10-01 19:28:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-02T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-02T09:30:00\",fin : \"2017-10-02T11:30:00\",descripcion : \"PRIMER JUICIO DEL CASO\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"2017-10-02T09:30:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(13,1,'ELIMINAR','2017-10-01 19:28:33','ACTO','','{id : 1,inicio : \"2017-10-02T09:30:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}',NULL),(14,1,'INSERTAR','2017-10-01 23:04:14','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-02T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(15,1,'MODIFICAR','2017-10-02 12:02:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-02T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(16,1,'MODIFICAR','2017-10-02 12:02:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-02T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(17,1,'MODIFICAR','2017-10-02 12:02:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-02T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(18,1,'MODIFICAR','2017-10-02 12:04:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-02T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(19,1,'MODIFICAR','2017-10-02 12:04:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-02T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(20,1,'MODIFICAR','2017-10-02 12:04:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-02T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(21,1,'INSERTAR','2017-10-05 14:35:05','SALA','SE HA REGISTRADO UNA SALA COMO SALA 6',NULL,'{id : 6,descripcion : \"SALA 6\",color : \"#0053ff\"}'),(22,1,'MODIFICAR','2017-10-05 14:35:15','SALA','SE HA CAMBIADO NOMBRE DE SALA 6 A SALA 62','{id : 6,descripcion : \"SALA 6\",color : \"#0053ff\"}','{id : 6,descripcion : \"SALA 62\",color : \"#0053ff\"}'),(23,1,'MODIFICAR','2017-10-06 15:28:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-02T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-06T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(24,1,'MODIFICAR','2017-10-06 15:28:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-06T10:00:00\",fin : \"2017-10-02T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-06T10:00:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(25,1,'MODIFICAR','2017-10-06 15:28:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T10:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-06T10:00:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-06T10:00:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(26,1,'MODIFICAR','2017-10-06 15:29:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-06T10:00:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(27,1,'MODIFICAR','2017-10-06 15:29:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(28,1,'MODIFICAR','2017-10-06 15:31:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 1,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(29,1,'INSERTAR','2017-10-06 15:34:10','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-07T08:00:00 CUYA DESCRIPCION ES DESCRIPCION 2 Y SU ESTATUS ES ASIGNADO',NULL,'{id : 2,inicio : \"2017-10-07T08:00:00\",fin : \"2017-10-07T16:00:00\",descripcion : \"DESCRIPCION 2\",id_sala : 1,id_tribunal : 6}'),(30,1,'INSERTAR','2017-10-06 15:34:47','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-08T09:00:00 CUYA DESCRIPCION ES DE Y SU ESTATUS ES ASIGNADO',NULL,'{id : 3,inicio : \"2017-10-08T09:00:00\",fin : \"2017-10-08T16:00:00\",descripcion : \"DE\",id_sala : 3,id_tribunal : 1}'),(31,1,'INSERTAR','2017-10-06 15:35:16','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ESPERA',NULL,'{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 7}'),(32,1,'INSERTAR','2017-10-06 15:35:43','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DES Y SU ESTATUS ES ESPERA',NULL,'{id : 5,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DES\",id_sala : 1,id_tribunal : 1}'),(33,1,'INSERTAR','2017-10-06 15:36:06','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ESPERA',NULL,'{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 7}'),(34,1,'INSERTAR','2017-10-06 15:36:37','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DES Y SU ESTATUS ES ESPERA',NULL,'{id : 7,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DES\",id_sala : 1,id_tribunal : 9}'),(35,1,'INSERTAR','2017-10-06 15:41:22','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 8,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 6}'),(36,1,'INSERTAR','2017-10-06 15:41:22','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 9,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}'),(37,1,'INSERTAR','2017-10-06 15:41:22','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 10,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(38,1,'INSERTAR','2017-10-06 15:41:22','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 11,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(39,1,'MODIFICAR','2017-10-06 15:42:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 8,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 6}','{id : 8,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 6}'),(40,1,'MODIFICAR','2017-10-06 15:42:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 9,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}','{id : 9,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}'),(41,1,'MODIFICAR','2017-10-06 15:42:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(42,1,'MODIFICAR','2017-10-06 15:42:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 10,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 10,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(43,1,'MODIFICAR','2017-10-06 15:43:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DES Y SU ESTATUS ES DIFERIDA','{id : 5,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DES\",id_sala : 1,id_tribunal : 1}','{id : 5,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DES\",id_sala : 1,id_tribunal : 1}'),(44,1,'MODIFICAR','2017-10-06 16:02:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCION 2 Y SU ESTATUS ES ESPERA','{id : 2,inicio : \"2017-10-07T08:00:00\",fin : \"2017-10-07T16:00:00\",descripcion : \"DESCRIPCION 2\",id_sala : 1,id_tribunal : 6}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION 2\",id_sala : 1,id_tribunal : 6}'),(45,1,'MODIFICAR','2017-10-06 16:02:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-07T11:00:00 CUYA DESCRIPCION ES DES Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DES\",id_sala : 1,id_tribunal : 9}','{id : 7,inicio : \"2017-10-07T11:00:00\",fin : \"2017-10-07T13:00:00\",descripcion : \"DES\",id_sala : 2,id_tribunal : 9}'),(46,1,'MODIFICAR','2017-10-06 16:02:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-07T08:30:00 CUYA DESCRIPCION ES DES Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-07T11:00:00\",fin : \"2017-10-07T13:00:00\",descripcion : \"DES\",id_sala : 2,id_tribunal : 9}','{id : 7,inicio : \"2017-10-07T08:30:00\",fin : \"2017-10-07T10:30:00\",descripcion : \"DES\",id_sala : 2,id_tribunal : 9}'),(47,1,'MODIFICAR','2017-10-06 16:02:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-07T08:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-07T08:30:00\",fin : \"2017-10-07T10:30:00\",descripcion : \"DES\",id_sala : 2,id_tribunal : 9}','{id : 7,inicio : \"2017-10-07T08:30:00\",fin : \"2017-10-07T17:00:00\",descripcion : \"EXP-001: JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 9}'),(48,1,'MODIFICAR','2017-10-07 01:23:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(49,1,'MODIFICAR','2017-10-07 01:24:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-06T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-06T13:20:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(50,1,'MODIFICAR','2017-10-13 15:17:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-13T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-06T13:20:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(51,1,'MODIFICAR','2017-10-13 15:17:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-13T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-06T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(52,1,'MODIFICAR','2017-10-13 15:17:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-13T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 10,inicio : \"2017-10-06T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 10,inicio : \"2017-10-13T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(53,1,'MODIFICAR','2017-10-13 15:17:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-13T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 10,inicio : \"2017-10-13T08:00:00\",fin : \"2017-10-06T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 10,inicio : \"2017-10-13T08:00:00\",fin : \"2017-10-13T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(54,1,'MODIFICAR','2017-10-13 15:20:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-12T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-12T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(55,1,'MODIFICAR','2017-10-13 15:20:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-12T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-12T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-12T13:20:00\",fin : \"2017-10-12T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(56,1,'MODIFICAR','2017-10-13 15:20:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-12T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 10,inicio : \"2017-10-13T08:00:00\",fin : \"2017-10-13T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 10,inicio : \"2017-10-12T08:00:00\",fin : \"2017-10-13T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(57,1,'MODIFICAR','2017-10-13 15:20:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-12T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 10,inicio : \"2017-10-12T08:00:00\",fin : \"2017-10-13T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 10,inicio : \"2017-10-12T08:00:00\",fin : \"2017-10-12T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(58,1,'MODIFICAR','2017-10-13 15:25:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-13T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-12T13:20:00\",fin : \"2017-10-12T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-12T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(59,1,'MODIFICAR','2017-10-13 15:25:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-13T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-12T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-3T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(60,1,'MODIFICAR','2017-10-13 15:26:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-13T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-3T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(61,1,'MODIFICAR','2017-10-14 01:27:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-13T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(62,1,'MODIFICAR','2017-10-16 21:56:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-13T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(63,1,'MODIFICAR','2017-10-16 21:56:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-13T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(64,1,'MODIFICAR','2017-10-16 21:56:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(65,1,'MODIFICAR','2017-10-16 22:04:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(66,1,'MODIFICAR','2017-10-16 22:05:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(67,1,'MODIFICAR','2017-10-16 22:05:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(68,1,'MODIFICAR','2017-10-16 22:06:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(69,1,'MODIFICAR','2017-10-16 22:06:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(70,1,'MODIFICAR','2017-10-16 22:06:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(71,1,'MODIFICAR','2017-10-16 22:07:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(72,1,'MODIFICAR','2017-10-16 22:08:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(73,1,'MODIFICAR','2017-10-16 22:09:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(74,1,'MODIFICAR','2017-10-16 22:09:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(75,1,'MODIFICAR','2017-10-16 22:09:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(76,1,'MODIFICAR','2017-10-16 22:09:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(77,1,'MODIFICAR','2017-10-16 22:10:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(78,1,'MODIFICAR','2017-10-16 22:12:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(79,1,'MODIFICAR','2017-10-16 22:13:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(80,1,'MODIFICAR','2017-10-16 22:18:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(81,1,'MODIFICAR','2017-10-16 22:18:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(82,1,'MODIFICAR','2017-10-16 22:40:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(83,1,'MODIFICAR','2017-10-16 22:41:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(84,1,'MODIFICAR','2017-10-16 22:44:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(85,1,'MODIFICAR','2017-10-16 22:45:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(86,1,'MODIFICAR','2017-10-16 22:45:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(87,1,'MODIFICAR','2017-10-16 22:45:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(88,1,'MODIFICAR','2017-10-16 22:46:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(89,1,'MODIFICAR','2017-10-16 22:47:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(90,1,'MODIFICAR','2017-10-16 22:47:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(91,1,'MODIFICAR','2017-10-16 22:48:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(92,1,'MODIFICAR','2017-10-16 22:49:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(93,1,'MODIFICAR','2017-10-16 22:49:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(94,1,'MODIFICAR','2017-10-16 22:51:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(95,1,'MODIFICAR','2017-10-16 22:52:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(96,1,'MODIFICAR','2017-10-16 22:52:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(97,1,'MODIFICAR','2017-10-16 22:55:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(98,1,'MODIFICAR','2017-10-16 22:55:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(99,1,'MODIFICAR','2017-10-16 22:55:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-16T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(100,1,'MODIFICAR','2017-10-17 11:22:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T10:30:00 CUYA DESCRIPCION ES DESCRIPCION 2 Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION 2\",id_sala : 1,id_tribunal : 6}','{id : 2,inicio : \"2017-10-18T10:30:00\",fin : \"2017-10-18T12:30:00\",descripcion : \"DESCRIPCION 2\",id_sala : 2,id_tribunal : 6}'),(101,1,'INSERTAR','2017-10-17 11:22:52','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-18T09:00:00 CUYA DESCRIPCION ES CUALQUIER DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 12,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T17:30:00\",descripcion : \"CUALQUIER DESCRIPCION\",id_sala : 3,id_tribunal : 6}'),(102,1,'MODIFICAR','2017-10-17 11:22:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T09:00:00 CUYA DESCRIPCION ES CUALQUIER DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T17:30:00\",descripcion : \"CUALQUIER DESCRIPCION\",id_sala : 3,id_tribunal : 6}','{id : 12,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T17:30:00\",descripcion : \"CUALQUIER DESCRIPCION\",id_sala : 6,id_tribunal : 6}'),(103,1,'MODIFICAR','2017-10-17 11:23:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T09:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T17:30:00\",descripcion : \"CUALQUIER DESCRIPCION\",id_sala : 6,id_tribunal : 6}','{id : 12,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T13:30:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 6,id_tribunal : 6}'),(104,1,'MODIFICAR','2017-10-17 11:23:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T09:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T13:30:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 6,id_tribunal : 6}','{id : 12,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T13:30:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 6,id_tribunal : 6}'),(105,1,'MODIFICAR','2017-10-17 11:23:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ESPERA','{id : 12,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T13:30:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 6,id_tribunal : 6}','{id : 12,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 1,id_tribunal : 6}'),(106,1,'MODIFICAR','2017-10-17 11:23:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T09:30:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 1,id_tribunal : 6}','{id : 12,inicio : \"2017-10-18T09:30:00\",fin : \"2017-10-18T11:30:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(107,1,'INSERTAR','2017-10-17 11:24:46','SALA','SE HA REGISTRADO UNA SALA COMO SALA 6',NULL,'{id : 7,descripcion : \"SALA 6\",color : \"#f31a1a\"}'),(108,1,'MODIFICAR','2017-10-17 11:24:59','SALA','SE HA CAMBIADO NOMBRE DE SALA 6 A SALA 7','{id : 7,descripcion : \"SALA 6\",color : \"#f31a1a\"}','{id : 7,descripcion : \"SALA 7\",color : \"#f31a1a\"}'),(109,1,'MODIFICAR','2017-10-17 11:25:09','SALA','SE HA CAMBIADO NOMBRE DE SALA 7 A SALA 7','{id : 7,descripcion : \"SALA 7\",color : \"#f31a1a\"}','{id : 7,descripcion : \"SALA 7\",color : \"#f31a1a\"}'),(110,1,'ELIMINAR','2017-10-17 11:25:09','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 7','{id : 7,descripcion : \"SALA 7\",color : \"#f31a1a\"}',NULL),(111,1,'MODIFICAR','2017-10-17 11:42:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T10:00:00 CUYA DESCRIPCION ES DESCRIPCION 2 Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-18T10:30:00\",fin : \"2017-10-18T12:30:00\",descripcion : \"DESCRIPCION 2\",id_sala : 2,id_tribunal : 6}','{id : 2,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T12:00:00\",descripcion : \"DESCRIPCION 2\",id_sala : 1,id_tribunal : 6}'),(112,1,'MODIFICAR','2017-10-17 11:42:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T13:30:00 CUYA DESCRIPCION ES DESCRIPCION 2 Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T12:00:00\",descripcion : \"DESCRIPCION 2\",id_sala : 1,id_tribunal : 6}','{id : 2,inicio : \"2017-10-18T13:30:00\",fin : \"2017-10-18T15:30:00\",descripcion : \"DESCRIPCION 2\",id_sala : 1,id_tribunal : 6}'),(113,1,'MODIFICAR','2017-10-17 11:42:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T08:30:00 CUYA DESCRIPCION ES DESCRIPCION 2 Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-18T13:30:00\",fin : \"2017-10-18T15:30:00\",descripcion : \"DESCRIPCION 2\",id_sala : 1,id_tribunal : 6}','{id : 2,inicio : \"2017-10-18T08:30:00\",fin : \"2017-10-18T10:30:00\",descripcion : \"DESCRIPCION 2\",id_sala : 2,id_tribunal : 6}'),(114,1,'MODIFICAR','2017-10-17 11:43:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T08:30:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-18T08:30:00\",fin : \"2017-10-18T10:30:00\",descripcion : \"DESCRIPCION 2\",id_sala : 2,id_tribunal : 6}','{id : 2,inicio : \"2017-10-18T08:30:00\",fin : \"2017-10-18T16:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 2,id_tribunal : 6}'),(115,1,'MODIFICAR','2017-10-17 11:43:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-18T09:30:00\",fin : \"2017-10-18T11:30:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T12:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 3,id_tribunal : 6}'),(116,1,'MODIFICAR','2017-10-17 11:43:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T12:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 3,id_tribunal : 6}','{id : 12,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T17:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 3,id_tribunal : 6}'),(117,1,'MODIFICAR','2017-10-17 11:43:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T08:30:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-18T08:30:00\",fin : \"2017-10-18T16:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 2,id_tribunal : 6}','{id : 2,inicio : \"2017-10-18T08:30:00\",fin : \"2017-10-18T16:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 2,id_tribunal : 6}'),(118,1,'MODIFICAR','2017-10-17 11:43:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ESPERA','{id : 12,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T17:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 3,id_tribunal : 6}','{id : 12,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 1,id_tribunal : 6}'),(119,1,'MODIFICAR','2017-10-17 11:43:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 1,id_tribunal : 6}','{id : 12,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T12:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(120,1,'MODIFICAR','2017-10-17 11:43:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T10:00:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 7}','{id : 6,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T12:00:00\",descripcion : \"HOLA\",id_sala : 5,id_tribunal : 7}'),(121,1,'MODIFICAR','2017-10-17 11:43:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T12:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(122,1,'INSERTAR','2017-10-17 11:44:37','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-18T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 13,inicio : \"2017-10-18T08:00:00\",fin : \"2017-10-18T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(123,1,'INSERTAR','2017-10-17 11:45:41','SALA','SE HA REGISTRADO UNA SALA COMO SALA 6',NULL,'{id : 8,descripcion : \"SALA 6\",color : \"#e01212\"}'),(124,1,'MODIFICAR','2017-10-17 11:45:54','SALA','SE HA CAMBIADO NOMBRE DE SALA 6 A SALA 7','{id : 8,descripcion : \"SALA 6\",color : \"#e01212\"}','{id : 8,descripcion : \"SALA 7\",color : \"#e01212\"}'),(125,1,'MODIFICAR','2017-10-17 11:46:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 7}','{id : 4,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 8,id_tribunal : 7}'),(126,1,'MODIFICAR','2017-10-17 11:46:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 8,id_tribunal : 7}','{id : 4,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 8,id_tribunal : 7}'),(127,1,'MODIFICAR','2017-10-17 11:46:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-18T10:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 4,inicio : \"2017-10-18T09:00:00\",fin : \"2017-10-18T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 8,id_tribunal : 7}','{id : 4,inicio : \"2017-10-18T10:30:00\",fin : \"2017-10-18T18:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 7}'),(128,1,'MODIFICAR','2017-10-17 11:46:27','SALA','SE HA CAMBIADO NOMBRE DE SALA 7 A SALA 7','{id : 8,descripcion : \"SALA 7\",color : \"#e01212\"}','{id : 8,descripcion : \"SALA 7\",color : \"#e01212\"}'),(129,1,'MODIFICAR','2017-10-17 11:46:36','SALA','SE HA CAMBIADO NOMBRE DE SALA 7 A SALA 7','{id : 8,descripcion : \"SALA 7\",color : \"#e01212\"}','{id : 8,descripcion : \"SALA 7\",color : \"#e01212\"}'),(130,1,'ELIMINAR','2017-10-17 11:46:36','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 7','{id : 8,descripcion : \"SALA 7\",color : \"#e01212\"}',NULL),(131,1,'MODIFICAR','2017-10-20 19:47:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-18T08:00:00\",fin : \"2017-10-18T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-18T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(132,1,'MODIFICAR','2017-10-20 19:47:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-18T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(133,1,'MODIFICAR','2017-10-20 19:48:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(134,1,'MODIFICAR','2017-10-20 19:49:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-19T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-19T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(135,1,'MODIFICAR','2017-10-20 19:49:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-19T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-19T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-19T08:00:00\",fin : \"2017-10-19T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(136,1,'MODIFICAR','2017-10-20 19:52:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-19T08:00:00\",fin : \"2017-10-19T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-19T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(137,1,'MODIFICAR','2017-10-20 19:52:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-19T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(138,1,'MODIFICAR','2017-10-20 19:52:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-18T10:00:00\",fin : \"2017-10-18T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-18T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(139,1,'MODIFICAR','2017-10-20 19:52:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-18T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(140,1,'MODIFICAR','2017-10-20 19:53:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-16T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(141,1,'MODIFICAR','2017-10-20 19:53:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-16T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(142,1,'MODIFICAR','2017-10-20 19:53:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(143,1,'MODIFICAR','2017-10-20 19:53:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(144,1,'MODIFICAR','2017-10-20 19:53:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(145,1,'MODIFICAR','2017-10-20 19:53:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(146,1,'MODIFICAR','2017-10-20 19:53:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(147,1,'MODIFICAR','2017-10-20 19:53:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(148,1,'MODIFICAR','2017-10-20 19:53:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(149,1,'MODIFICAR','2017-10-20 19:53:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(150,1,'MODIFICAR','2017-10-20 19:53:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(151,1,'MODIFICAR','2017-10-20 19:53:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(152,1,'MODIFICAR','2017-10-20 19:53:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(153,1,'MODIFICAR','2017-10-20 19:53:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(154,1,'MODIFICAR','2017-10-20 19:53:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(155,1,'MODIFICAR','2017-10-20 19:53:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(156,1,'MODIFICAR','2017-10-20 19:53:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(157,1,'MODIFICAR','2017-10-20 19:53:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(158,1,'MODIFICAR','2017-10-20 19:53:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(159,1,'MODIFICAR','2017-10-20 19:53:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(160,1,'MODIFICAR','2017-10-20 19:53:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(161,1,'MODIFICAR','2017-10-20 19:58:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(162,1,'MODIFICAR','2017-10-20 19:58:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(163,1,'MODIFICAR','2017-10-20 19:58:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(164,1,'MODIFICAR','2017-10-20 19:58:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(165,1,'MODIFICAR','2017-10-20 19:58:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(166,1,'MODIFICAR','2017-10-20 19:58:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(167,1,'MODIFICAR','2017-10-20 20:06:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(168,1,'MODIFICAR','2017-10-20 20:06:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(169,1,'MODIFICAR','2017-10-20 20:06:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(170,1,'MODIFICAR','2017-10-20 20:06:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(171,1,'MODIFICAR','2017-10-20 20:06:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(172,1,'MODIFICAR','2017-10-20 20:06:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(173,1,'MODIFICAR','2017-10-20 20:07:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(174,1,'MODIFICAR','2017-10-20 20:07:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(175,1,'MODIFICAR','2017-10-20 20:07:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(176,1,'MODIFICAR','2017-10-20 20:07:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(177,1,'MODIFICAR','2017-10-20 20:07:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(178,1,'MODIFICAR','2017-10-20 20:07:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(179,1,'MODIFICAR','2017-10-20 20:14:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(180,1,'MODIFICAR','2017-10-20 20:14:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(181,1,'MODIFICAR','2017-10-20 20:14:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(182,1,'MODIFICAR','2017-10-20 20:14:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(183,1,'MODIFICAR','2017-10-20 20:14:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(184,1,'MODIFICAR','2017-10-20 20:14:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(185,1,'MODIFICAR','2017-10-20 20:15:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(186,1,'MODIFICAR','2017-10-20 20:15:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(187,1,'MODIFICAR','2017-10-20 20:15:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(188,1,'MODIFICAR','2017-10-20 20:17:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(189,1,'MODIFICAR','2017-10-20 20:17:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(190,1,'MODIFICAR','2017-10-20 20:17:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(191,1,'MODIFICAR','2017-10-20 20:17:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(192,1,'MODIFICAR','2017-10-20 20:17:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(193,1,'MODIFICAR','2017-10-20 20:17:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(194,1,'MODIFICAR','2017-10-20 20:17:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES DIFERIDA','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(195,1,'MODIFICAR','2017-10-20 20:17:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(196,1,'MODIFICAR','2017-10-20 20:17:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(197,1,'MODIFICAR','2017-10-20 20:17:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(198,1,'MODIFICAR','2017-10-20 20:17:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(199,1,'MODIFICAR','2017-10-20 20:18:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(200,1,'MODIFICAR','2017-10-20 20:19:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(201,1,'MODIFICAR','2017-10-20 20:19:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(202,1,'MODIFICAR','2017-10-20 20:19:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(203,1,'MODIFICAR','2017-10-20 20:19:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(204,1,'MODIFICAR','2017-10-20 20:20:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(205,1,'MODIFICAR','2017-10-20 20:20:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(206,1,'MODIFICAR','2017-10-20 20:20:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(207,1,'MODIFICAR','2017-10-20 20:20:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(208,1,'MODIFICAR','2017-10-20 20:20:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(209,1,'MODIFICAR','2017-10-20 20:20:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(210,1,'MODIFICAR','2017-10-20 20:21:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(211,1,'MODIFICAR','2017-10-20 20:21:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(212,1,'MODIFICAR','2017-10-20 20:21:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(213,1,'MODIFICAR','2017-10-20 20:22:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(214,1,'MODIFICAR','2017-10-20 20:22:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(215,1,'MODIFICAR','2017-10-20 20:22:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(216,1,'MODIFICAR','2017-10-20 20:22:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(217,1,'MODIFICAR','2017-10-20 20:22:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(218,1,'MODIFICAR','2017-10-20 20:22:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(219,1,'MODIFICAR','2017-10-20 20:22:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(220,1,'MODIFICAR','2017-10-20 20:22:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(221,1,'MODIFICAR','2017-10-20 20:22:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(222,1,'MODIFICAR','2017-10-20 20:23:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(223,1,'MODIFICAR','2017-10-20 20:23:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(224,1,'MODIFICAR','2017-10-20 20:23:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(225,1,'MODIFICAR','2017-10-20 20:24:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(226,1,'MODIFICAR','2017-10-20 20:24:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(227,1,'MODIFICAR','2017-10-20 20:24:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(228,1,'MODIFICAR','2017-10-20 20:25:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(229,1,'MODIFICAR','2017-10-20 20:25:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(230,1,'MODIFICAR','2017-10-20 20:25:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(231,1,'MODIFICAR','2017-10-20 20:25:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(232,1,'MODIFICAR','2017-10-20 20:25:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(233,1,'MODIFICAR','2017-10-20 20:25:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(234,1,'MODIFICAR','2017-10-20 20:25:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(235,1,'MODIFICAR','2017-10-20 20:25:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(236,1,'MODIFICAR','2017-10-20 20:25:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(237,1,'MODIFICAR','2017-10-20 20:26:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(238,1,'MODIFICAR','2017-10-20 20:26:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(239,1,'MODIFICAR','2017-10-20 20:26:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(240,1,'MODIFICAR','2017-10-20 20:28:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(241,1,'MODIFICAR','2017-10-20 20:28:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(242,1,'MODIFICAR','2017-10-20 20:28:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(243,1,'MODIFICAR','2017-10-20 20:28:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(244,1,'MODIFICAR','2017-10-20 20:28:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(245,1,'MODIFICAR','2017-10-20 20:28:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(246,1,'MODIFICAR','2017-10-20 20:31:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(247,1,'MODIFICAR','2017-10-20 20:31:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(248,1,'MODIFICAR','2017-10-20 20:31:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(249,1,'MODIFICAR','2017-10-20 20:31:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(250,1,'MODIFICAR','2017-10-20 20:31:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T13:20:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}','{id : 11,inicio : \"2017-10-20T13:20:00\",fin : \"2017-10-20T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 6}'),(251,1,'MODIFICAR','2017-10-20 20:31:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(252,1,'MODIFICAR','2017-10-20 20:41:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(253,1,'MODIFICAR','2017-10-20 20:41:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(254,1,'MODIFICAR','2017-10-20 20:47:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(255,1,'MODIFICAR','2017-10-20 20:47:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(256,1,'MODIFICAR','2017-10-20 20:47:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(257,1,'MODIFICAR','2017-10-20 20:47:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(258,1,'MODIFICAR','2017-10-20 20:48:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(259,1,'MODIFICAR','2017-10-20 20:48:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(260,1,'MODIFICAR','2017-10-20 20:48:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(261,1,'MODIFICAR','2017-10-20 20:48:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(262,1,'MODIFICAR','2017-10-20 20:48:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(263,1,'MODIFICAR','2017-10-20 20:48:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(264,1,'MODIFICAR','2017-10-20 20:50:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(265,1,'MODIFICAR','2017-10-20 20:50:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(266,1,'MODIFICAR','2017-10-20 20:54:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(267,1,'MODIFICAR','2017-10-20 20:54:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(268,1,'MODIFICAR','2017-10-20 20:56:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(269,1,'MODIFICAR','2017-10-20 20:56:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(270,1,'MODIFICAR','2017-10-20 20:56:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(271,1,'MODIFICAR','2017-10-20 20:56:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(272,1,'MODIFICAR','2017-10-20 20:56:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(273,1,'MODIFICAR','2017-10-20 20:56:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(274,1,'MODIFICAR','2017-10-20 21:10:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(275,1,'MODIFICAR','2017-10-20 21:10:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(276,1,'MODIFICAR','2017-10-20 21:10:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(277,1,'MODIFICAR','2017-10-20 21:10:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(278,1,'MODIFICAR','2017-10-20 21:18:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(279,1,'MODIFICAR','2017-10-20 21:18:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(280,1,'MODIFICAR','2017-10-20 21:18:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(281,1,'MODIFICAR','2017-10-20 21:18:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(282,1,'MODIFICAR','2017-10-20 21:22:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(283,1,'MODIFICAR','2017-10-20 21:22:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(284,1,'MODIFICAR','2017-10-20 21:22:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(285,1,'MODIFICAR','2017-10-20 21:22:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(286,1,'MODIFICAR','2017-10-20 21:31:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(287,1,'MODIFICAR','2017-10-20 21:31:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T08:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}','{id : 13,inicio : \"2017-10-20T08:00:00\",fin : \"2017-10-20T17:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 9}'),(288,1,'MODIFICAR','2017-10-20 21:31:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(289,1,'MODIFICAR','2017-10-20 21:35:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(290,1,'MODIFICAR','2017-10-20 21:35:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(291,1,'MODIFICAR','2017-10-20 21:35:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(292,1,'MODIFICAR','2017-10-20 21:35:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(293,1,'MODIFICAR','2017-10-20 21:36:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(294,1,'MODIFICAR','2017-10-20 21:36:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(295,1,'MODIFICAR','2017-10-20 22:30:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES FINALIZADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}'),(296,1,'MODIFICAR','2017-10-20 22:30:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-20T10:00:00 CUYA DESCRIPCION ES EXP-001: ANTESALA DE JUICIO Y SU ESTATUS ES FINALIZADO','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}','{id : 12,inicio : \"2017-10-20T10:00:00\",fin : \"2017-10-20T18:00:00\",descripcion : \"EXP-001: ANTESALA DE JUICIO\",id_sala : 4,id_tribunal : 6}');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
INSERT INTO `caso` VALUES (1,'EXP-001','ROBO A MANO ARMADA',0,'2017-10-01 19:20:40');
/*!40000 ALTER TABLE `caso` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_caso` AFTER INSERT ON `caso`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA ', NEW.numero),
               NEW.id_usuario, 
               NULL, 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'numero : "', NEW.numero, '",',
                      'descripcion : "', NEW.descripcion, '"',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_caso` AFTER UPDATE ON `caso`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES ', NEW.numero),
               NEW.id_usuario, 
               CONCAT(
                   '{',
                      'id : ', OLD.id, ',',
                      'numero : "', OLD.numero, '",',
                      'descripcion : "', OLD.descripcion, '"',
                   '}'
               ), 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'numero : "', NEW.numero, '",',
                      'descripcion : "', NEW.descripcion, '"',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_caso` AFTER DELETE ON `caso`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA ELIMINADO UN CASO CUYA NUMERO DE CAUSA FUE REGISTRADA COMO ', OLD.numero),
               OLD.id_usuario, 
               CONCAT(
                   '{',
                   		'id : ', OLD.id, ',',
                   		'numero : "', OLD.numero, '",',
                   		'descripcion : "', OLD.descripcion, '"',
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
-- Table structure for table `caso_alguacil`
--

DROP TABLE IF EXISTS `caso_alguacil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_alguacil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(50) NOT NULL,
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
  `numero_caso` varchar(50) NOT NULL,
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
  `numero_caso` varchar(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '8',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'FISCAL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_fiscal`
--

LOCK TABLES `caso_fiscal` WRITE;
/*!40000 ALTER TABLE `caso_fiscal` DISABLE KEYS */;
INSERT INTO `caso_fiscal` VALUES (1,'EXP-001','V-21301059',8,'FISCAL');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_imputado`
--

LOCK TABLES `caso_imputado` WRITE;
/*!40000 ALTER TABLE `caso_imputado` DISABLE KEYS */;
INSERT INTO `caso_imputado` VALUES (1,'EXP-001','V-21301059',4,'IMPUTADO');
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
  `id_tipo_persona` int(11) NOT NULL DEFAULT '5',
  `tipo_persona` varchar(50) NOT NULL DEFAULT 'JUEZ',
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
  `numero_caso` varchar(50) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '2',
  `tipo_persona` varchar(50) NOT NULL DEFAULT 'SECRETARIA',
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
  `numero_caso` varchar(50) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_victima`
--

LOCK TABLES `caso_victima` WRITE;
/*!40000 ALTER TABLE `caso_victima` DISABLE KEYS */;
INSERT INTO `caso_victima` VALUES (1,'EXP-001','V-21301060',6,'VICTIMA');
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
  `niveles_acesso` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_generales`
--

LOCK TABLES `config_generales` WRITE;
/*!40000 ALTER TABLE `config_generales` DISABLE KEYS */;
INSERT INTO `config_generales` VALUES (1,'dem','root','root','{\"/\":[1,2,3,4],\"/perfil\":[1,2,3,4],\"/programador\":[1,2,3],\"/programador/:fecha\":[1,2,3],\"/programador/:fecha/:id\":[1,2,3],\"/defensor\":[1,2],\"/secretaria\":[1,2],\"/alguacil\":[1,2],\"/imputado\":[1,2],\"/juez\":[1,2],\"/actividad\":[1,2],\"/victima\":[1,2],\"/testigo\":[1,2],\"/fiscal\":[1,2],\"/sala\":[1,2],\"/tribunal\":[1,2],\"/tipo_de_tribunal\":[1,2],\"/usuario\":[1],\"/acto\":[1,2,3],\"/actos\":[1,2,3],\"/caso\":[1,2,3],\"/casos\":[1,2,3],\"/bitacora\":[1],\"/respaldo\":[1],\"/mensajes\":[1,2],\"/notificaciones\":[1,2,3,4],\"/ajustes\":[1],\"/nivel\":[1]}');
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
INSERT INTO `config_notificaciones` VALUES (1,'../message_server/sms/api/outbox','../message_server/sms/schedule','../message_server/mail/api','smtp.gmail.com',465,'dem.sanfelipe@gmail.com','qwertyuiop1234567890','192.168.1.2',9300);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor`
--

LOCK TABLES `defensor` WRITE;
/*!40000 ALTER TABLE `defensor` DISABLE KEYS */;
INSERT INTO `defensor` VALUES (1,'V-21301059','PUBLICO','8298208');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscal`
--

LOCK TABLES `fiscal` WRITE;
/*!40000 ALTER TABLE `fiscal` DISABLE KEYS */;
INSERT INTO `fiscal` VALUES (3,'V-21301060',7,0),(5,'V-21301059',9,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juez`
--

LOCK TABLES `juez` WRITE;
/*!40000 ALTER TABLE `juez` DISABLE KEYS */;
INSERT INTO `juez` VALUES (1,'V-21301059');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'V-21301059','ANTHONY JOSE','MEDINA FUENTES','ANTHONYJMEDINAF@GMAIL.COM','+584263575489','20/10/1993',0,'2017-10-01 18:48:40'),(3,'V-21301060','MARIANGEL JOSNELLY','MEDINA GAUTIER','MARIANGELGAUTIER@GMAIL.COM','+58 426 783 99 44','26/12/1993',1,'2017-10-01 18:55:07'),(4,'V-21301061','MILAGROS DEL CARMEN','PEREZ SANCHEZ','MILAGROSPEREZ@GMAIL.COM','+58 424 785 99 44','20/10/1992',1,'2017-10-01 18:56:02'),(5,'V-25646293','ARCADIO','AREVALO','AREVALOARCADIO.96@GMAIL.COM','+58 127 724 31 10','15/10/1996',1,'2017-10-05 14:48:10');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_persona` AFTER INSERT ON `persona`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA REGISTRADO UNA PERSONA CON LA CEDULA  ', NEW.cedula, ' Y NOMBRE ES ', NEW.nombres, ' ', NEW.apellidos),
               NEW.id_usuario, 
               NULL, 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'cedula : "', NEW.cedula, '",',
                      'nombres : "', NEW.nombres, '"',
                      'apellidos : "', NEW.apellidos, '"',
                      'email : "', NEW.email, '"',
                      'telefono : "', NEW.telefono, '"',
                      'fecha_de_nacimiento : "', NEW.fecha_de_nacimiento, '"',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_persona` AFTER UPDATE ON `persona`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES ' , OLD.cedula,  ' Y NOMBRE ES ', NEW.nombres, ' ', NEW.apellidos),
               NEW.id_usuario, 
               CONCAT(
                   '{',
                      'id : ', OLD.id, ',',
                      'cedula : "', OLD.cedula, '",',
                      'nombres : "', OLD.nombres, '"',
                      'apellidos : "', OLD.apellidos, '"',
                      'email : "', OLD.email, '"',
                      'telefono : "', OLD.telefono, '"',
                      'fecha_de_nacimiento : "', OLD.fecha_de_nacimiento, '"',
                   '}'
               ), 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'cedula : "', NEW.cedula, '",',
                      'nombres : "', NEW.nombres, '"',
                      'apellidos : "', NEW.apellidos, '"',
                      'email : "', NEW.email, '"',
                      'telefono : "', NEW.telefono, '"',
                      'fecha_de_nacimiento : "', NEW.fecha_de_nacimiento, '"',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_persona` AFTER DELETE ON `persona`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA ELIMINADO UNA PERSONA CUYA CEDULA FUE REGISTRADA COMO ', OLD.cedula, ' Y NOMBRE ES ', OLD.nombres, ' ', OLD.apellidos),
               OLD.id_usuario, 
               CONCAT(
                   '{',
                   		'id : ', OLD.id, ',',
                   		'cedula : "', OLD.cedula, '",',
                   		'nombres : "', OLD.nombres, '"',
                      'apellidos : "', OLD.apellidos, '"',
                      'email : "', OLD.email, '"',
                      'telefono : "', OLD.telefono, '"',
                      'fecha_de_nacimiento : "', OLD.fecha_de_nacimiento, '"',
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_tipo`
--

LOCK TABLES `persona_tipo` WRITE;
/*!40000 ALTER TABLE `persona_tipo` DISABLE KEYS */;
INSERT INTO `persona_tipo` VALUES (1,'V-21301059',1),(3,'V-21301059',5),(6,'V-21301060',2),(8,'V-21301059',6),(9,'V-21301059',4),(11,'V-21301059',7),(15,'V-21301060',8),(17,'V-21301059',8),(18,'V-21301059',9),(19,'V-25646293',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'SALA 1','#e82c2c',1,'2017-10-01 18:50:04'),(2,'SALA 2','#06147f',1,'2017-10-01 18:50:36'),(3,'SALA 3','#ffee00',1,'2017-10-01 18:50:53'),(4,'SALA 4','#008e21',1,'2017-10-01 18:51:10'),(5,'SALA 5','#00797f',1,'2017-10-01 18:51:29'),(6,'SALA 62','#0053ff',1,'2017-10-05 14:35:15');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_sala` AFTER INSERT ON `sala`
 FOR EACH ROW BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_sala` AFTER UPDATE ON `sala`
 FOR EACH ROW BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_sala` AFTER DELETE ON `sala`
 FOR EACH ROW BEGIN
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
INSERT INTO `secretaria` VALUES (2,'V-21301060');
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
INSERT INTO `testigo` VALUES (1,'V-21301059',0);
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar` AFTER INSERT ON `tipo_de_tribunal`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA REGISTRADO UN TIPO DE TRIBUNAL COMO ', NEW.descripcion),
               NEW.id_usuario, 
               NULL, 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'descripcion : "', NEW.descripcion, '",',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar` AFTER UPDATE ON `tipo_de_tribunal`
 FOR EACH ROW BEGIN
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
                   '}'
               ), 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'descripcion : "', NEW.descripcion, '",',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar` AFTER DELETE ON `tipo_de_tribunal`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA ELIMINADO UN TIPO DE TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO ', OLD.descripcion),
               OLD.id_usuario, 
               CONCAT(
                   '{',
                   		'id : ', OLD.id, ',',
                   		'descripcion : "', OLD.descripcion, '",',
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
INSERT INTO `tipo_persona` VALUES (1,'DEFENSOR',1,'2017-07-12 02:25:03'),(2,'SECRETARIA',1,'2017-07-12 02:25:06'),(3,'ALGUACIL',1,'2017-07-12 02:25:08'),(4,'IMPUTADO',1,'2017-07-12 02:25:10'),(5,'JUEZ',1,'2017-07-12 02:25:13'),(6,'VICTIMA',1,'2017-07-12 02:25:16'),(7,'TESTIGO',1,'2017-07-12 02:25:19'),(8,'FISCAL',1,'2017-07-12 02:25:21'),(9,'USUARIO',1,'2017-07-12 02:24:53');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tribunal`
--

LOCK TABLES `tribunal` WRITE;
/*!40000 ALTER TABLE `tribunal` DISABLE KEYS */;
INSERT INTO `tribunal` VALUES (1,'TRIBUNAL 1',1,0,'2017-07-27 02:55:24'),(3,'TRIBUNAL 2',1,0,'2017-09-30 16:47:13'),(4,'TRIBUNAL 3',1,0,'2017-09-30 16:54:12'),(6,'TRIBUNAL 2',2,0,'2017-09-30 16:55:57'),(7,'TRIBUNAL 1',2,0,'2017-09-30 16:56:34'),(8,'TRIBUNAL 3',2,0,'2017-09-30 16:56:17'),(9,'TRIBUNAL 1',3,0,'2017-09-30 16:56:50'),(10,'TRIBUNAL 2',3,0,'2017-09-30 16:57:06'),(11,'TRIBUNAL 3',3,0,'2017-09-30 16:57:23');
/*!40000 ALTER TABLE `tribunal` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_tribunal` AFTER INSERT ON `tribunal`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA REGISTRADO UN TRIBUNAL COMO ', NEW.numero),
               NEW.id_usuario, 
               NULL, 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'numero : "', NEW.numero, '",',
                      'id_tipo_tribunal : "', NEW.id_tipo_tribunal, '"',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_tribunal` AFTER UPDATE ON `tribunal`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA CAMBIADO UN TRIBUNAL DE ' , OLD.numero,  ' A ', NEW.numero),
               NEW.id_usuario, 
               CONCAT(
                   '{',
                      'id : ', OLD.id, ',',
                      'numero : "', OLD.numero, '",',
                      'id_tipo_tribunal : "', OLD.id_tipo_tribunal, '"',
                   '}'
               ), 
               CONCAT(
                   '{',
                      'id : ', NEW.id, ',',
                      'numero : "', NEW.numero, '",',
                      'id_tipo_tribunal : "', NEW.id_tipo_tribunal, '"',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_tribunal` AFTER DELETE ON `tribunal`
 FOR EACH ROW BEGIN
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
               CONCAT('SE HA ELIMINADO UNA TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO ', OLD.numero),
               OLD.id_usuario, 
               CONCAT(
                   '{',
                   		'id : ', OLD.id, ',',
                   		'numero : "', OLD.numero, '",',
                   		'id_tipo_tribunal : "', OLD.id_tipo_tribunal, '"',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd','icon-user.png','ADMINISTRADOR',0,'2017-10-01 23:01:49'),(2,'V-25646293','5db2beeb4acb003f82f9ba0c74bb9eab9d30cd7f','icon-user.png','USUARIO COMUN',NULL,'2017-10-05 14:52:14');
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
INSERT INTO `victima` VALUES (2,'V-21301059');
/*!40000 ALTER TABLE `victima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_actividad`
--

DROP TABLE IF EXISTS `vista_actividad`;
/*!50001 DROP VIEW IF EXISTS `vista_actividad`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_actividad` (
  `id` tinyint NOT NULL,
  `actividad` tinyint NOT NULL,
  `descripcion` tinyint NOT NULL,
  `id_usuario` tinyint NOT NULL,
  `fecha_de_registro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_acto`
--

DROP TABLE IF EXISTS `vista_acto`;
/*!50001 DROP VIEW IF EXISTS `vista_acto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_acto` (
  `ID` tinyint NOT NULL,
  `CAUSA` tinyint NOT NULL,
  `IMPUTADO` tinyint NOT NULL,
  `TRIBUNAL` tinyint NOT NULL,
  `ACTO` tinyint NOT NULL,
  `HORA` tinyint NOT NULL,
  `SALA` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
/*!50001 VIEW `acto_sala` AS select `acto`.`id` AS `id`,`acto`.`inicio` AS `start`,`acto`.`fin` AS `end`,`acto`.`id_sala` AS `resourceId`,`acto`.`estatus` AS `estatus`,concat(`caso`.`numero`,': ',`actividad`.`actividad`) AS `title`,`caso`.`numero` AS `numero`,`caso`.`descripcion` AS `descripcion`,`acto`.`descripcion` AS `descripcion_acto`,`sala`.`descripcion` AS `sala`,`tribunal`.`id` AS `id_tribunal`,`tribunal`.`numero` AS `tribunal`,`tribunal`.`id_tipo_tribunal` AS `id_tipo_tribunal`,`tipo_de_tribunal`.`descripcion` AS `tipo_de_tribunal` from (((((`acto` join `actividad` on((`acto`.`id_actividad` = `actividad`.`id`))) join `caso` on((`acto`.`numero_caso` = `caso`.`numero`))) join `sala` on((`acto`.`id_sala` = `sala`.`id`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `tipo_de_tribunal` on((`tribunal`.`id_tipo_tribunal` = `tipo_de_tribunal`.`id`))) */;
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
-- Final view structure for view `vista_actividad`
--

/*!50001 DROP TABLE IF EXISTS `vista_actividad`*/;
/*!50001 DROP VIEW IF EXISTS `vista_actividad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_actividad` AS select `t`.`id` AS `id`,`t`.`actividad` AS `actividad`,`tdt`.`descripcion` AS `descripcion`,`t`.`id_usuario` AS `id_usuario`,`t`.`fecha_de_registro` AS `fecha_de_registro` from (`actividad` `t` join `tipo_de_tribunal` `tdt` on((`t`.`id_tipo_tribunal` = `tdt`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_acto`
--

/*!50001 DROP TABLE IF EXISTS `vista_acto`*/;
/*!50001 DROP VIEW IF EXISTS `vista_acto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_acto` AS select `acto`.`id` AS `ID`,`acto`.`numero_caso` AS `CAUSA`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `IMPUTADO`,`tribunal`.`numero` AS `TRIBUNAL`,`actividad`.`actividad` AS `ACTO`,`acto`.`inicio` AS `HORA`,`sala`.`descripcion` AS `SALA` from (((((`acto` join `caso_imputado` on((`acto`.`numero_caso` = `caso_imputado`.`numero_caso`))) join `persona` on((`caso_imputado`.`cedula` = `persona`.`cedula`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `actividad` on((`actividad`.`id` = `acto`.`id_actividad`))) join `sala` on((`sala`.`id` = `acto`.`id_sala`))) */;
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

-- Dump completed on 2017-10-20 19:05:38
