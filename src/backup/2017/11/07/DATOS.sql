-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dem
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
INSERT INTO `actividad` VALUES (1,'JUICIO DE PRESENTACION',1,1,'2017-07-04 13:00:03'),(2,'JUICIO DE SALIDA',1,1,'2017-09-30 16:59:01'),(3,'JUICIO DE ENTRADA',1,1,'2017-09-30 16:59:03'),(4,'JUICIO DE PRESENTACION',2,1,'2017-09-30 16:59:52'),(5,'ANTESALA DE JUICIO',2,1,'2017-09-30 16:59:54'),(7,'JUICIO DE ENTRADA',3,1,'2017-09-30 17:00:33');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_actividad` AFTER INSERT ON `actividad` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "ACTIVIDAD",
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_actividad` AFTER UPDATE ON `actividad` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "ACTIVIDAD", 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_actividad` AFTER DELETE ON `actividad` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "ELIMINAR", 
               "ACTIVIDAD", 
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-10-26T08:00:00','2017-10-26T16:00:00','EXP-001: JUICIO DE PRESENTACION','EXP-001',1,3,1,'FINALIZADO',1,'2017-10-27 00:58:00'),(2,'2017-10-27T08:00:00','2017-10-27T16:00:00','EXP-003: JUICIO DE SALIDA','EXP-003',2,4,1,'FINALIZADO',1,'2017-10-28 00:58:43'),(4,'2017-10-27T09:00:00','2017-10-27T15:30:00','ACTO','EXP-001',2,3,3,'FINALIZADO',1,'2017-10-28 00:58:43'),(5,'2017-10-28T09:00:00','2017-10-28T15:30:00','DESCRIPCION','EXP-001',1,2,3,'ASIGNADO',1,'2017-10-28 00:59:34'),(6,'2017-10-28T08:30:00','2017-10-28T15:30:00','DESCRIPCION','EXP-002',4,3,7,'ASIGNADO',1,'2017-10-28 00:59:54'),(7,'2017-10-28T08:30:00','2017-10-28T16:00:00','DESCRIPCION','EXP-003',5,4,6,'ASIGNADO',1,'2017-10-28 01:00:18'),(8,'2017-10-30T08:30:00','2017-10-30T17:30:00','HOLA','EXP-001',2,2,1,'FINALIZADO',1,'2017-10-31 00:25:23'),(9,'2017-10-30T08:30:00','2017-10-30T15:30:00','JUICIO DE ENTRADA','EXP-002',2,4,1,'FINALIZADO',1,'2017-10-31 00:25:23'),(10,'2017-10-30T09:00:00','2017-10-30T11:00:00','DESCRIPCION','EXP-003',1,1,1,'FINALIZADO',1,'2017-10-30 15:09:07'),(11,'2017-11-07T09:30:00','2017-11-07T17:00:00','HOLA','EXP-001',3,1,1,'ASIGNADO',1,'2017-11-07 15:11:18'),(12,'2017-11-07T08:00:00','2017-11-07T16:00:00','DESCR','EXP-002',1,3,1,'DIFERIDA',1,'2017-11-07 18:52:10'),(13,'2017-11-07T09:30:00','2017-11-07T11:00:00','SD','EXP-003',5,4,6,'FINALIZADO',1,'2017-11-07 16:03:35'),(15,'2017-11-11T09:30:00','2017-11-11T16:30:00','EXP-005: JUICIO DE PRESENTACION','EXP-005',4,4,6,'ASIGNADO',1,'2017-11-07 17:23:00'),(16,'2017-11-07T11:00:00','2017-11-07T17:00:00','','EXP-005',7,3,11,'ASIGNADO',1,'2017-11-07 19:27:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alguacil`
--

LOCK TABLES `alguacil` WRITE;
/*!40000 ALTER TABLE `alguacil` DISABLE KEYS */;
INSERT INTO `alguacil` VALUES (4,'V-12893004'),(1,'V-18940594'),(2,'V-19844933'),(3,'V-24883944');
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
) ENGINE=InnoDB AUTO_INCREMENT=852 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,0,'INSERTAR','2017-10-26 22:05:38','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-001',NULL,'{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}'),(2,0,'INSERTAR','2017-10-26 22:06:53','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-002',NULL,'{id : 2,numero : \"EXP-002\",descripcion : \"ASESINATO\"}'),(3,0,'INSERTAR','2017-10-26 22:08:54','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-003',NULL,'{id : 3,numero : \"EXP-003\",descripcion : \"HOLA MUNDO\"}'),(4,1,'INSERTAR','2017-10-26 22:10:42','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 1,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 2,id_tribunal : 1}'),(5,1,'INSERTAR','2017-10-26 22:11:32','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 3,id_tribunal : 1}'),(6,1,'INSERTAR','2017-10-26 22:11:57','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 4,id_tribunal : 1}'),(7,1,'MODIFICAR','2017-10-26 22:12:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ESPERA','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 3,id_tribunal : 1}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 1,id_tribunal : 1}'),(8,1,'MODIFICAR','2017-10-26 22:16:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T10:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T10:00:00\",fin : \"2017-10-27T12:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 3,id_tribunal : 1}'),(9,1,'MODIFICAR','2017-10-26 22:16:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ESPERA','{id : 2,inicio : \"2017-10-27T10:00:00\",fin : \"2017-10-27T12:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 3,id_tribunal : 1}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 1,id_tribunal : 1}'),(10,1,'MODIFICAR','2017-10-26 22:17:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 4,id_tribunal : 1}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}'),(11,1,'MODIFICAR','2017-10-26 22:18:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:30:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T11:30:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}'),(12,1,'MODIFICAR','2017-10-26 22:18:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T11:30:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}'),(13,1,'MODIFICAR','2017-10-26 22:19:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}'),(14,1,'MODIFICAR','2017-10-26 22:19:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(15,1,'MODIFICAR','2017-10-26 22:20:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 4,id_tribunal : 1}'),(16,1,'MODIFICAR','2017-10-26 22:20:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 4,id_tribunal : 1}'),(17,1,'MODIFICAR','2017-10-26 22:20:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(18,1,'MODIFICAR','2017-10-26 22:20:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(19,1,'MODIFICAR','2017-10-26 22:23:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES ESPERA','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(20,1,'MODIFICAR','2017-10-26 22:24:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(21,1,'MODIFICAR','2017-10-26 22:24:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(22,1,'MODIFICAR','2017-10-26 22:24:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(23,1,'MODIFICAR','2017-10-26 22:26:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(24,1,'ELIMINAR','2017-10-26 22:26:59','ACTO','','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}',NULL),(25,0,'INSERTAR','2017-10-26 22:34:13','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-004',NULL,'{id : 4,numero : \"EXP-004\",descripcion : \"DEXCRIPCION\"}'),(26,1,'MODIFICAR','2017-10-26 22:41:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DE ACTO Y SU ESTATUS ES ESPERA','{id : 1,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}'),(27,1,'MODIFICAR','2017-10-26 22:41:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(28,1,'MODIFICAR','2017-10-26 22:41:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(29,1,'MODIFICAR','2017-10-26 22:42:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}'),(30,1,'MODIFICAR','2017-10-26 22:42:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(31,1,'MODIFICAR','2017-10-26 22:42:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(32,1,'MODIFICAR','2017-10-26 23:28:21','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-29355522 Y NOMBRE ES MIGUEL ALVES','{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+58 377 373 73 37\"fecha_de_nacimiento : \"18/08/1980\"}','{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+58 377 373 73 37\"fecha_de_nacimiento : \"18/08/1980\"}'),(33,1,'MODIFICAR','2017-10-27 00:57:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-26T08:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(34,1,'MODIFICAR','2017-10-27 00:57:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-26T08:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-26T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(35,1,'MODIFICAR','2017-10-27 00:58:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-26T08:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-26T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-26T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(36,1,'INSERTAR','2017-10-27 01:22:26','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T09:00:00 CUYA DESCRIPCION ES ACTO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 4,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T15:30:00\",descripcion : \"ACTO\",id_sala : 3,id_tribunal : 3}'),(37,1,'MODIFICAR','2017-10-27 02:00:35','CASO','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-001','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}'),(38,1,'MODIFICAR','2017-10-28 00:58:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(39,1,'MODIFICAR','2017-10-28 00:58:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:00:00 CUYA DESCRIPCION ES ACTO Y SU ESTATUS ES FINALIZADO','{id : 4,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T15:30:00\",descripcion : \"ACTO\",id_sala : 3,id_tribunal : 3}','{id : 4,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T15:30:00\",descripcion : \"ACTO\",id_sala : 3,id_tribunal : 3}'),(40,1,'INSERTAR','2017-10-28 00:59:34','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(41,1,'INSERTAR','2017-10-28 00:59:54','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(42,1,'INSERTAR','2017-10-28 01:00:18','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(43,1,'MODIFICAR','2017-10-28 14:06:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(44,1,'MODIFICAR','2017-10-28 14:06:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(45,1,'MODIFICAR','2017-10-28 14:06:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(46,1,'MODIFICAR','2017-10-28 14:06:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(47,1,'MODIFICAR','2017-10-28 14:06:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(48,1,'MODIFICAR','2017-10-28 14:06:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(49,1,'MODIFICAR','2017-10-28 14:08:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(50,1,'MODIFICAR','2017-10-28 14:08:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(51,1,'MODIFICAR','2017-10-28 14:08:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(52,1,'MODIFICAR','2017-10-28 14:08:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(53,1,'MODIFICAR','2017-10-28 14:08:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(54,1,'MODIFICAR','2017-10-28 14:08:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(55,1,'MODIFICAR','2017-10-28 14:08:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(56,1,'MODIFICAR','2017-10-28 14:08:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(57,1,'MODIFICAR','2017-10-28 14:08:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(58,1,'MODIFICAR','2017-10-28 14:08:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(59,1,'MODIFICAR','2017-10-28 14:08:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(60,1,'MODIFICAR','2017-10-28 14:08:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(61,1,'INSERTAR','2017-10-28 14:09:12','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-29T10:00:00 CUYA DESCRIPCION ES ACTO 1 Y SU ESTATUS ES ASIGNADO',NULL,'{id : 8,inicio : \"2017-10-29T10:00:00\",fin : \"2017-10-29T13:00:00\",descripcion : \"ACTO 1\",id_sala : 3,id_tribunal : 1}'),(62,1,'MODIFICAR','2017-10-28 14:09:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(63,1,'MODIFICAR','2017-10-28 14:09:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(64,1,'MODIFICAR','2017-10-28 14:09:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(65,1,'MODIFICAR','2017-10-28 14:09:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES ACTO 1 Y SU ESTATUS ES ESPERA','{id : 8,inicio : \"2017-10-29T10:00:00\",fin : \"2017-10-29T13:00:00\",descripcion : \"ACTO 1\",id_sala : 3,id_tribunal : 1}','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ACTO 1\",id_sala : 1,id_tribunal : 1}'),(66,1,'MODIFICAR','2017-10-28 14:09:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-29T09:00:00 CUYA DESCRIPCION ES ACTO 1 Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ACTO 1\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-10-29T09:00:00\",fin : \"2017-10-29T11:00:00\",descripcion : \"ACTO 1\",id_sala : 4,id_tribunal : 1}'),(67,1,'MODIFICAR','2017-10-28 14:09:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-29T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-29T09:00:00\",fin : \"2017-10-29T11:00:00\",descripcion : \"ACTO 1\",id_sala : 4,id_tribunal : 1}','{id : 8,inicio : \"2017-10-29T09:00:00\",fin : \"2017-10-29T17:30:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(68,1,'ELIMINAR','2017-10-28 14:09:38','ACTO','','{id : 8,inicio : \"2017-10-29T09:00:00\",fin : \"2017-10-29T17:30:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}',NULL),(69,1,'MODIFICAR','2017-10-28 14:09:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(70,1,'MODIFICAR','2017-10-28 14:09:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(71,1,'MODIFICAR','2017-10-28 14:09:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(72,1,'MODIFICAR','2017-10-28 14:16:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(73,1,'MODIFICAR','2017-10-28 14:16:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(74,1,'MODIFICAR','2017-10-28 14:16:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(75,1,'MODIFICAR','2017-10-28 14:16:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(76,1,'MODIFICAR','2017-10-28 14:16:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(77,1,'MODIFICAR','2017-10-28 14:16:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(78,1,'MODIFICAR','2017-10-28 14:17:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(79,1,'MODIFICAR','2017-10-28 14:17:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(80,1,'MODIFICAR','2017-10-28 14:17:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(81,1,'MODIFICAR','2017-10-28 14:17:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(82,1,'MODIFICAR','2017-10-28 14:17:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(83,1,'MODIFICAR','2017-10-28 14:17:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(84,1,'MODIFICAR','2017-10-28 14:17:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(85,1,'MODIFICAR','2017-10-28 14:17:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(86,1,'MODIFICAR','2017-10-28 14:17:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(87,1,'MODIFICAR','2017-10-28 14:17:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(88,1,'MODIFICAR','2017-10-28 14:17:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(89,1,'MODIFICAR','2017-10-28 14:17:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(90,1,'MODIFICAR','2017-10-28 17:02:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(91,1,'MODIFICAR','2017-10-28 17:02:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(92,1,'MODIFICAR','2017-10-28 17:02:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(93,1,'MODIFICAR','2017-10-28 17:13:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(94,1,'MODIFICAR','2017-10-28 17:13:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(95,1,'MODIFICAR','2017-10-28 17:13:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(96,1,'MODIFICAR','2017-10-28 17:13:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(97,1,'MODIFICAR','2017-10-28 17:13:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(98,1,'MODIFICAR','2017-10-28 17:13:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(99,1,'MODIFICAR','2017-10-28 17:23:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(100,1,'MODIFICAR','2017-10-28 17:23:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(101,1,'MODIFICAR','2017-10-28 17:23:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(102,1,'MODIFICAR','2017-10-28 17:23:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(103,1,'MODIFICAR','2017-10-28 17:23:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(104,1,'MODIFICAR','2017-10-28 17:23:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(105,1,'MODIFICAR','2017-10-28 17:23:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(106,1,'MODIFICAR','2017-10-28 17:23:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(107,1,'MODIFICAR','2017-10-28 17:23:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(108,1,'MODIFICAR','2017-10-28 17:33:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(109,1,'MODIFICAR','2017-10-28 17:33:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(110,1,'MODIFICAR','2017-10-28 17:33:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(111,1,'MODIFICAR','2017-10-28 17:50:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(112,1,'MODIFICAR','2017-10-28 17:50:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(113,1,'MODIFICAR','2017-10-28 17:50:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(114,1,'MODIFICAR','2017-10-28 17:54:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(115,1,'MODIFICAR','2017-10-28 17:54:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(116,1,'MODIFICAR','2017-10-28 17:54:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(117,1,'MODIFICAR','2017-10-28 18:36:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(118,1,'MODIFICAR','2017-10-28 18:36:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(119,1,'MODIFICAR','2017-10-28 18:36:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(120,1,'MODIFICAR','2017-10-28 18:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(121,1,'MODIFICAR','2017-10-28 18:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(122,1,'MODIFICAR','2017-10-28 18:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(123,1,'MODIFICAR','2017-10-28 18:36:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(124,1,'MODIFICAR','2017-10-28 18:36:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(125,1,'MODIFICAR','2017-10-28 18:36:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(126,1,'MODIFICAR','2017-10-28 18:37:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(127,1,'MODIFICAR','2017-10-28 18:37:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(128,1,'MODIFICAR','2017-10-28 18:37:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(129,1,'MODIFICAR','2017-10-28 18:56:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(130,1,'MODIFICAR','2017-10-28 18:56:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(131,1,'MODIFICAR','2017-10-28 18:56:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(132,1,'MODIFICAR','2017-10-28 18:56:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(133,1,'MODIFICAR','2017-10-28 18:56:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(134,1,'MODIFICAR','2017-10-28 18:56:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(135,1,'MODIFICAR','2017-10-28 18:56:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(136,1,'MODIFICAR','2017-10-28 18:56:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(137,1,'MODIFICAR','2017-10-28 18:56:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(138,1,'MODIFICAR','2017-10-28 19:00:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(139,1,'MODIFICAR','2017-10-28 19:00:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(140,1,'MODIFICAR','2017-10-28 19:00:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(141,1,'MODIFICAR','2017-10-28 19:03:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(142,1,'MODIFICAR','2017-10-28 19:03:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(143,1,'MODIFICAR','2017-10-28 19:03:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(144,1,'INSERTAR','2017-10-30 14:24:48','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(145,1,'MODIFICAR','2017-10-30 14:24:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(146,1,'MODIFICAR','2017-10-30 14:27:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(147,1,'MODIFICAR','2017-10-30 14:28:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(148,1,'MODIFICAR','2017-10-30 14:28:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(149,1,'MODIFICAR','2017-10-30 14:28:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(150,1,'MODIFICAR','2017-10-30 14:28:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(151,1,'MODIFICAR','2017-10-30 14:28:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(152,1,'MODIFICAR','2017-10-30 14:28:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(153,1,'MODIFICAR','2017-10-30 14:29:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(154,1,'MODIFICAR','2017-10-30 14:29:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(155,1,'MODIFICAR','2017-10-30 14:29:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(156,1,'MODIFICAR','2017-10-30 14:29:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(157,1,'INSERTAR','2017-10-30 14:30:25','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(158,1,'MODIFICAR','2017-10-30 14:30:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(159,1,'MODIFICAR','2017-10-30 14:30:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(160,1,'MODIFICAR','2017-10-30 14:30:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(161,1,'MODIFICAR','2017-10-30 14:30:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(162,1,'INSERTAR','2017-10-30 14:30:56','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ESPERA',NULL,'{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(163,1,'MODIFICAR','2017-10-30 14:30:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(164,1,'MODIFICAR','2017-10-30 14:30:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(165,1,'MODIFICAR','2017-10-30 14:31:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(166,1,'MODIFICAR','2017-10-30 14:34:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(167,1,'MODIFICAR','2017-10-30 14:34:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(168,1,'MODIFICAR','2017-10-30 14:34:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(169,1,'MODIFICAR','2017-10-30 14:34:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(170,1,'MODIFICAR','2017-10-30 14:34:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(171,1,'MODIFICAR','2017-10-30 14:34:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(172,1,'MODIFICAR','2017-10-30 14:34:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(173,1,'MODIFICAR','2017-10-30 14:34:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(174,1,'MODIFICAR','2017-10-30 14:34:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(175,1,'MODIFICAR','2017-10-30 14:36:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(176,1,'MODIFICAR','2017-10-30 14:36:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(177,1,'MODIFICAR','2017-10-30 14:36:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(178,1,'MODIFICAR','2017-10-30 14:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(179,1,'MODIFICAR','2017-10-30 14:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(180,1,'MODIFICAR','2017-10-30 14:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(181,1,'MODIFICAR','2017-10-30 14:50:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(182,1,'MODIFICAR','2017-10-30 14:50:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(183,1,'MODIFICAR','2017-10-30 14:50:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(184,1,'MODIFICAR','2017-10-30 14:50:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(185,1,'MODIFICAR','2017-10-30 14:50:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(186,1,'MODIFICAR','2017-10-30 14:50:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(187,1,'MODIFICAR','2017-10-30 14:52:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(188,1,'MODIFICAR','2017-10-30 14:52:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(189,1,'MODIFICAR','2017-10-30 14:52:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(190,1,'MODIFICAR','2017-10-30 14:52:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(191,1,'MODIFICAR','2017-10-30 14:52:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(192,1,'MODIFICAR','2017-10-30 14:52:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(193,1,'MODIFICAR','2017-10-30 15:09:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(194,1,'MODIFICAR','2017-10-30 15:09:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(195,1,'MODIFICAR','2017-10-30 15:09:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(196,1,'MODIFICAR','2017-10-30 15:09:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(197,1,'MODIFICAR','2017-10-30 15:09:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(198,1,'MODIFICAR','2017-10-30 15:10:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(199,1,'MODIFICAR','2017-10-30 15:10:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(200,1,'MODIFICAR','2017-10-30 15:10:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(201,1,'MODIFICAR','2017-10-30 15:10:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(202,1,'MODIFICAR','2017-10-30 15:17:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(203,1,'MODIFICAR','2017-10-30 15:17:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(204,1,'MODIFICAR','2017-10-30 15:28:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(205,1,'MODIFICAR','2017-10-30 15:28:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(206,1,'MODIFICAR','2017-10-30 15:51:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(207,1,'MODIFICAR','2017-10-30 15:51:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(208,1,'MODIFICAR','2017-10-30 15:58:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(209,1,'MODIFICAR','2017-10-30 15:58:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(210,1,'MODIFICAR','2017-10-30 15:58:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(211,1,'MODIFICAR','2017-10-30 15:58:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(212,1,'MODIFICAR','2017-10-30 16:01:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(213,1,'MODIFICAR','2017-10-30 16:01:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(214,1,'MODIFICAR','2017-10-30 16:02:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(215,1,'MODIFICAR','2017-10-30 16:02:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(216,1,'MODIFICAR','2017-10-30 16:02:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(217,1,'MODIFICAR','2017-10-30 16:02:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(218,1,'INSERTAR','2017-10-30 16:05:41','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T17:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 3}'),(219,1,'MODIFICAR','2017-10-30 16:05:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(220,1,'MODIFICAR','2017-10-30 16:05:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(221,1,'MODIFICAR','2017-10-30 16:10:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T17:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 3}'),(222,1,'MODIFICAR','2017-10-30 16:13:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 3}'),(223,1,'MODIFICAR','2017-10-30 16:13:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 3}'),(224,1,'MODIFICAR','2017-10-30 16:13:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T13:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T13:00:00\",fin : \"2017-10-31T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(225,1,'MODIFICAR','2017-10-30 16:13:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T13:00:00\",fin : \"2017-10-31T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 3}'),(226,1,'MODIFICAR','2017-10-30 16:21:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 3}','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 3}'),(227,1,'MODIFICAR','2017-10-30 16:22:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T11:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T11:00:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 3}'),(228,1,'ELIMINAR','2017-10-30 16:22:57','ACTO','','{id : 11,inicio : \"2017-10-31T11:00:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 3}',NULL),(229,1,'MODIFICAR','2017-10-30 16:25:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(230,1,'MODIFICAR','2017-10-30 16:25:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(231,1,'MODIFICAR','2017-10-30 16:25:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(232,1,'MODIFICAR','2017-10-30 16:25:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(233,1,'MODIFICAR','2017-10-30 16:25:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(234,1,'MODIFICAR','2017-10-30 16:25:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(235,1,'MODIFICAR','2017-10-30 16:44:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(236,1,'MODIFICAR','2017-10-30 16:44:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(237,1,'MODIFICAR','2017-10-30 16:55:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(238,1,'MODIFICAR','2017-10-30 16:55:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(239,1,'MODIFICAR','2017-10-31 00:25:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES FINALIZADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(240,1,'MODIFICAR','2017-10-31 00:25:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES FINALIZADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(241,1,'MODIFICAR','2017-10-31 00:31:16','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-21301062 Y NOMBRE ES MILDRED DE JESUS VARGAS JUAREZ','{id : 8,cedula : \"V-21301062\",nombres : \"MILDRED DE JESUS\"apellidos : \"VARGAS JUAREZ\"email : \"MIL.1DRED@GMAIL.COM\"telefono : \"+58 426 784 03 44\"fecha_de_nacimiento : \"12/12/1992\"}','{id : 8,cedula : \"V-21301062\",nombres : \"MILDRED DE JESUS\"apellidos : \"VARGAS JUAREZ\"email : \"MIL.1DRED@GMAIL.COM\"telefono : \"+58 426 784 03 44\"fecha_de_nacimiento : \"12/12/1992\"}'),(242,1,'MODIFICAR','2017-10-31 00:34:55','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12384954 Y NOMBRE ES KATIUSKA JUAREZ','{id : 22,cedula : \"V-12384954\",nombres : \"KATIUSKA\"apellidos : \"JUAREZ\"email : \"KATYJUAREZ@TSJ.COM.VE\"telefono : \"+58 412 838 49 43\"fecha_de_nacimiento : \"08/07/1970\"}','{id : 22,cedula : \"V-12384954\",nombres : \"KATIUSKA\"apellidos : \"JUAREZ\"email : \"KATYJUAREZ@TSJ.COM.VE\"telefono : \"+58 412 838 49 43\"fecha_de_nacimiento : \"08/07/1970\"}'),(243,1,'MODIFICAR','2017-10-31 00:39:04','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}'),(244,1,'MODIFICAR','2017-10-31 00:45:23','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}'),(245,1,'MODIFICAR','2017-10-31 00:46:15','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}'),(246,1,'MODIFICAR','2017-10-31 00:46:25','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}'),(247,1,'MODIFICAR','2017-10-31 00:46:44','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}'),(248,1,'MODIFICAR','2017-10-31 00:46:55','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}'),(249,1,'MODIFICAR','2017-10-31 00:47:05','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}'),(250,1,'MODIFICAR','2017-10-31 00:47:17','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-17834993 Y NOMBRE ES MONICA MARIA SUAREZ COLMENAREZ','{id : 12,cedula : \"V-17834993\",nombres : \"MONICA MARIA\"apellidos : \"SUAREZ COLMENAREZ\"email : \"MONICAMARIA@GMAIL.COM\"telefono : \"+58 412 383 83 83\"fecha_de_nacimiento : \"12/12/1991\"}','{id : 12,cedula : \"V-17834993\",nombres : \"MONICA MARIA\"apellidos : \"SUAREZ COLMENAREZ\"email : \"MONICAMARIA@GMAIL.COM\"telefono : \"+58 412 383 83 83\"fecha_de_nacimiento : \"12/12/1991\"}'),(251,1,'MODIFICAR','2017-10-31 00:47:33','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-17834993 Y NOMBRE ES MONICA MARIA SUAREZ COLMENAREZ','{id : 12,cedula : \"V-17834993\",nombres : \"MONICA MARIA\"apellidos : \"SUAREZ COLMENAREZ\"email : \"MONICAMARIA@GMAIL.COM\"telefono : \"+58 412 383 83 83\"fecha_de_nacimiento : \"12/12/1991\"}','{id : 12,cedula : \"V-17834993\",nombres : \"MONICA MARIA\"apellidos : \"SUAREZ COLMENAREZ\"email : \"MONICAMARIA@GMAIL.COM\"telefono : \"+58 412 383 83 83\"fecha_de_nacimiento : \"12/12/1991\"}'),(252,1,'MODIFICAR','2017-10-31 00:47:48','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-20894394 Y NOMBRE ES KIMBERLY MERCEDES PEREZ TOVAR','{id : 9,cedula : \"V-20894394\",nombres : \"KIMBERLY MERCEDES\"apellidos : \"PEREZ TOVAR\"email : \"KIMBERLY20@GMAIL.COM\"telefono : \"+58 416 327 38 38\"fecha_de_nacimiento : \"10/10/1992\"}','{id : 9,cedula : \"V-20894394\",nombres : \"KIMBERLY MERCEDES\"apellidos : \"PEREZ TOVAR\"email : \"KIMBERLY20@GMAIL.COM\"telefono : \"+58 416 327 38 38\"fecha_de_nacimiento : \"10/10/1992\"}'),(253,1,'MODIFICAR','2017-10-31 00:47:58','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-21301062 Y NOMBRE ES MILDRED DE JESUS VARGAS JUAREZ','{id : 8,cedula : \"V-21301062\",nombres : \"MILDRED DE JESUS\"apellidos : \"VARGAS JUAREZ\"email : \"MIL.1DRED@GMAIL.COM\"telefono : \"+58 426 784 03 44\"fecha_de_nacimiento : \"12/12/1992\"}','{id : 8,cedula : \"V-21301062\",nombres : \"MILDRED DE JESUS\"apellidos : \"VARGAS JUAREZ\"email : \"MIL.1DRED@GMAIL.COM\"telefono : \"+58 426 784 03 44\"fecha_de_nacimiento : \"12/12/1992\"}'),(254,1,'MODIFICAR','2017-10-31 00:48:14','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12384954 Y NOMBRE ES KATIUSKA JUAREZ','{id : 22,cedula : \"V-12384954\",nombres : \"KATIUSKA\"apellidos : \"JUAREZ\"email : \"KATYJUAREZ@TSJ.COM.VE\"telefono : \"+58 412 838 49 43\"fecha_de_nacimiento : \"08/07/1970\"}','{id : 22,cedula : \"V-12384954\",nombres : \"KATIUSKA\"apellidos : \"JUAREZ\"email : \"KATYJUAREZ@TSJ.COM.VE\"telefono : \"+58 412 838 49 43\"fecha_de_nacimiento : \"08/07/1970\"}'),(255,1,'MODIFICAR','2017-10-31 00:48:23','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12783944 Y NOMBRE ES DOROTEA JOSEFINA MUJICA MIJARES','{id : 11,cedula : \"V-12783944\",nombres : \"DOROTEA JOSEFINA\"apellidos : \"MUJICA MIJARES\"email : \"DOROTEAJOSEFINA@GMAIL.COM\"telefono : \"+58 463 777 38 38\"fecha_de_nacimiento : \"19/01/1920\"}','{id : 11,cedula : \"V-12783944\",nombres : \"DOROTEA JOSEFINA\"apellidos : \"MUJICA MIJARES\"email : \"DOROTEAJOSEFINA@GMAIL.COM\"telefono : \"+58 463 777 38 38\"fecha_de_nacimiento : \"19/01/1920\"}'),(256,1,'MODIFICAR','2017-10-31 00:48:32','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-20193932 Y NOMBRE ES DANILO JOSE MEDINA PARRA','{id : 10,cedula : \"V-20193932\",nombres : \"DANILO JOSE\"apellidos : \"MEDINA PARRA\"email : \"DANILOJOSE@OUTLOOK.COM\"telefono : \"+58 426 578 48 48\"fecha_de_nacimiento : \"01/01/1957\"}','{id : 10,cedula : \"V-20193932\",nombres : \"DANILO JOSE\"apellidos : \"MEDINA PARRA\"email : \"DANILOJOSE@OUTLOOK.COM\"telefono : \"+58 426 578 48 48\"fecha_de_nacimiento : \"01/01/1957\"}'),(257,1,'MODIFICAR','2017-10-31 00:48:47','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-29355522 Y NOMBRE ES MIGUEL ALVES','{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+58 377 373 73 37\"fecha_de_nacimiento : \"18/08/1980\"}','{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+58 377 373 73 37\"fecha_de_nacimiento : \"18/08/1980\"}'),(258,1,'MODIFICAR','2017-10-31 00:53:56','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12938443 Y NOMBRE ES MARIA JOSE MOACK SANCHEZ','{id : 32,cedula : \"V-12938443\",nombres : \"MARIA JOSE\"apellidos : \"MOACK SANCHEZ\"email : \"MARIAJOSE@GMAIL.COM\"telefono : \"+58 426 738 39 44\"fecha_de_nacimiento : \"12/12/1997\"}','{id : 32,cedula : \"V-12938443\",nombres : \"MARIA JOSE\"apellidos : \"MOACK SANCHEZ\"email : \"MARIAJOSE@GMAIL.COM\"telefono : \"+58 426 738 39 44\"fecha_de_nacimiento : \"12/12/1997\"}'),(259,1,'MODIFICAR','2017-10-31 14:34:09','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12384954 Y NOMBRE ES KATIUSKA JUAREZ','{id : 22,cedula : \"V-12384954\",nombres : \"KATIUSKA\"apellidos : \"JUAREZ\"email : \"KATYJUAREZ@TSJ.COM.VE\"telefono : \"+58 412 838 49 43\"fecha_de_nacimiento : \"08/07/1970\"}','{id : 22,cedula : \"V-12384954\",nombres : \"KATIUSKA\"apellidos : \"JUAREZ\"email : \"KATYJUAREZ@TSJ.COM.VE\"telefono : \"+584128384943\"fecha_de_nacimiento : \"08/07/1970\"}'),(260,1,'MODIFICAR','2017-10-31 14:34:19','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12783944 Y NOMBRE ES DOROTEA JOSEFINA MUJICA MIJARES','{id : 11,cedula : \"V-12783944\",nombres : \"DOROTEA JOSEFINA\"apellidos : \"MUJICA MIJARES\"email : \"DOROTEAJOSEFINA@GMAIL.COM\"telefono : \"+58 463 777 38 38\"fecha_de_nacimiento : \"19/01/1920\"}','{id : 11,cedula : \"V-12783944\",nombres : \"DOROTEA JOSEFINA\"apellidos : \"MUJICA MIJARES\"email : \"DOROTEAJOSEFINA@GMAIL.COM\"telefono : \"+584637773838\"fecha_de_nacimiento : \"19/01/1920\"}'),(261,1,'MODIFICAR','2017-10-31 14:34:28','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12849333 Y NOMBRE ES ZORAIDA DEL CARMEN AQUAVIVA RODRIGUEZ','{id : 16,cedula : \"V-12849333\",nombres : \"ZORAIDA DEL CARMEN\"apellidos : \"AQUAVIVA RODRIGUEZ\"email : \"ABOG.AQUAVIDAZORAIDA@TSJ.COM.VE\"telefono : \"+58 412 848 94 40\"fecha_de_nacimiento : \"17/12/1970\"}','{id : 16,cedula : \"V-12849333\",nombres : \"ZORAIDA DEL CARMEN\"apellidos : \"AQUAVIVA RODRIGUEZ\"email : \"ABOG.AQUAVIDAZORAIDA@TSJ.COM.VE\"telefono : \"+584128489440\"fecha_de_nacimiento : \"17/12/1970\"}'),(262,1,'MODIFICAR','2017-10-31 14:34:37','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}','{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+584148585893\"fecha_de_nacimiento : \"12/10/1967\"}'),(263,1,'MODIFICAR','2017-10-31 14:34:46','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12938443 Y NOMBRE ES MARIA JOSE MOACK SANCHEZ','{id : 32,cedula : \"V-12938443\",nombres : \"MARIA JOSE\"apellidos : \"MOACK SANCHEZ\"email : \"MARIAJOSE@GMAIL.COM\"telefono : \"+58 426 738 39 44\"fecha_de_nacimiento : \"12/12/1997\"}','{id : 32,cedula : \"V-12938443\",nombres : \"MARIA JOSE\"apellidos : \"MOACK SANCHEZ\"email : \"MARIAJOSE@GMAIL.COM\"telefono : \"+584267383944\"fecha_de_nacimiento : \"12/12/1997\"}'),(264,1,'MODIFICAR','2017-10-31 14:34:58','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-17834993 Y NOMBRE ES MONICA MARIA SUAREZ COLMENAREZ','{id : 12,cedula : \"V-17834993\",nombres : \"MONICA MARIA\"apellidos : \"SUAREZ COLMENAREZ\"email : \"MONICAMARIA@GMAIL.COM\"telefono : \"+58 412 383 83 83\"fecha_de_nacimiento : \"12/12/1991\"}','{id : 12,cedula : \"V-17834993\",nombres : \"MONICA MARIA\"apellidos : \"SUAREZ COLMENAREZ\"email : \"MONICAMARIA@GMAIL.COM\"telefono : \"+584123838383\"fecha_de_nacimiento : \"12/12/1991\"}'),(265,1,'MODIFICAR','2017-10-31 14:35:07','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-20193932 Y NOMBRE ES DANILO JOSE MEDINA PARRA','{id : 10,cedula : \"V-20193932\",nombres : \"DANILO JOSE\"apellidos : \"MEDINA PARRA\"email : \"DANILOJOSE@OUTLOOK.COM\"telefono : \"+58 426 578 48 48\"fecha_de_nacimiento : \"01/01/1957\"}','{id : 10,cedula : \"V-20193932\",nombres : \"DANILO JOSE\"apellidos : \"MEDINA PARRA\"email : \"DANILOJOSE@OUTLOOK.COM\"telefono : \"+584265784848\"fecha_de_nacimiento : \"01/01/1957\"}'),(266,1,'MODIFICAR','2017-10-31 14:35:19','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-20894394 Y NOMBRE ES KIMBERLY MERCEDES PEREZ TOVAR','{id : 9,cedula : \"V-20894394\",nombres : \"KIMBERLY MERCEDES\"apellidos : \"PEREZ TOVAR\"email : \"KIMBERLY20@GMAIL.COM\"telefono : \"+58 416 327 38 38\"fecha_de_nacimiento : \"10/10/1992\"}','{id : 9,cedula : \"V-20894394\",nombres : \"KIMBERLY MERCEDES\"apellidos : \"PEREZ TOVAR\"email : \"KIMBERLY20@GMAIL.COM\"telefono : \"+584163273838\"fecha_de_nacimiento : \"10/10/1992\"}'),(267,1,'MODIFICAR','2017-10-31 14:35:29','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-29355522 Y NOMBRE ES MIGUEL ALVES','{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+58 377 373 73 37\"fecha_de_nacimiento : \"18/08/1980\"}','{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+583773737337\"fecha_de_nacimiento : \"18/08/1980\"}'),(268,1,'MODIFICAR','2017-10-31 14:35:38','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-21301062 Y NOMBRE ES MILDRED DE JESUS VARGAS JUAREZ','{id : 8,cedula : \"V-21301062\",nombres : \"MILDRED DE JESUS\"apellidos : \"VARGAS JUAREZ\"email : \"MIL.1DRED@GMAIL.COM\"telefono : \"+58 426 784 03 44\"fecha_de_nacimiento : \"12/12/1992\"}','{id : 8,cedula : \"V-21301062\",nombres : \"MILDRED DE JESUS\"apellidos : \"VARGAS JUAREZ\"email : \"MIL.1DRED@GMAIL.COM\"telefono : \"+584267840344\"fecha_de_nacimiento : \"12/12/1992\"}'),(269,1,'MODIFICAR','2017-10-31 14:35:55','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12884894 Y NOMBRE ES JUAN JOSE MENDEZ','{id : 13,cedula : \"V-12884894\",nombres : \"JUAN JOSE\"apellidos : \"MENDEZ\"email : \"ABOG.JUANMENDEZ@YAHOO.ES\"telefono : \"+58 412 939 39 44\"fecha_de_nacimiento : \"09/08/1950\"}','{id : 13,cedula : \"V-12884894\",nombres : \"JUAN JOSE\"apellidos : \"MENDEZ\"email : \"ABOG.JUANMENDEZ@YAHOO.ES\"telefono : \"+584129393944\"fecha_de_nacimiento : \"09/08/1950\"}'),(270,1,'MODIFICAR','2017-10-31 14:36:05','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-18943933 Y NOMBRE ES MILAGROS RODRIGUEZ','{id : 14,cedula : \"V-18943933\",nombres : \"MILAGROS\"apellidos : \"RODRIGUEZ\"email : \"MILAGROSROD@GMAIL.COM\"telefono : \"+58 414 843 93 93\"fecha_de_nacimiento : \"12/12/1945\"}','{id : 14,cedula : \"V-18943933\",nombres : \"MILAGROS\"apellidos : \"RODRIGUEZ\"email : \"MILAGROSROD@GMAIL.COM\"telefono : \"+584148439393\"fecha_de_nacimiento : \"12/12/1945\"}'),(271,1,'MODIFICAR','2017-10-31 14:36:14','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-4675893 Y NOMBRE ES JUANA MUJICA','{id : 15,cedula : \"V-4675893\",nombres : \"JUANA\"apellidos : \"MUJICA\"email : \"JUANAMUJICA@TSJ.COM.VE\"telefono : \"+58 412 849 49 94\"fecha_de_nacimiento : \"15/01/1930\"}','{id : 15,cedula : \"V-4675893\",nombres : \"JUANA\"apellidos : \"MUJICA\"email : \"JUANAMUJICA@TSJ.COM.VE\"telefono : \"+584128494994\"fecha_de_nacimiento : \"15/01/1930\"}'),(272,1,'MODIFICAR','2017-10-31 14:36:30','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12893004 Y NOMBRE ES JUAN MIGUEL SUAREZ VIRGUEZ','{id : 20,cedula : \"V-12893004\",nombres : \"JUAN MIGUEL\"apellidos : \"SUAREZ VIRGUEZ\"email : \"JUANSUAREZ@TSJ.GOB.VE\"telefono : \"+58 414 289 93 54\"fecha_de_nacimiento : \"29/01/1992\"}','{id : 20,cedula : \"V-12893004\",nombres : \"JUAN MIGUEL\"apellidos : \"SUAREZ VIRGUEZ\"email : \"JUANSUAREZ@TSJ.GOB.VE\"telefono : \"+584142899354\"fecha_de_nacimiento : \"29/01/1992\"}'),(273,1,'MODIFICAR','2017-10-31 14:36:39','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-18940594 Y NOMBRE ES DANIEL MANUEL SUAREZ CAMACHO','{id : 17,cedula : \"V-18940594\",nombres : \"DANIEL MANUEL\"apellidos : \"SUAREZ CAMACHO\"email : \"MANUELCAMACHO@YAHOO.COM.VE\"telefono : \"+58 426 839 92 92\"fecha_de_nacimiento : \"02/09/1992\"}','{id : 17,cedula : \"V-18940594\",nombres : \"DANIEL MANUEL\"apellidos : \"SUAREZ CAMACHO\"email : \"MANUELCAMACHO@YAHOO.COM.VE\"telefono : \"+584268399292\"fecha_de_nacimiento : \"02/09/1992\"}'),(274,1,'MODIFICAR','2017-10-31 14:36:49','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-19844933 Y NOMBRE ES OMAR JOSE PINTO JIMENEZ','{id : 18,cedula : \"V-19844933\",nombres : \"OMAR JOSE\"apellidos : \"PINTO JIMENEZ\"email : \"OMARJOSE@GMAIL.COM\"telefono : \"+58 424 320 94 83\"fecha_de_nacimiento : \"10/10/1992\"}','{id : 18,cedula : \"V-19844933\",nombres : \"OMAR JOSE\"apellidos : \"PINTO JIMENEZ\"email : \"OMARJOSE@GMAIL.COM\"telefono : \"+584243209483\"fecha_de_nacimiento : \"10/10/1992\"}'),(275,1,'MODIFICAR','2017-10-31 14:36:58','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-24883944 Y NOMBRE ES MIGUEL JOSE EMAN PEREZ','{id : 19,cedula : \"V-24883944\",nombres : \"MIGUEL JOSE\"apellidos : \"EMAN PEREZ\"email : \"EMANPEREZ@GMAIL.COM\"telefono : \"+58 412 839 04 54\"fecha_de_nacimiento : \"26/12/1996\"}','{id : 19,cedula : \"V-24883944\",nombres : \"MIGUEL JOSE\"apellidos : \"EMAN PEREZ\"email : \"EMANPEREZ@GMAIL.COM\"telefono : \"+584128390454\"fecha_de_nacimiento : \"26/12/1996\"}'),(276,1,'MODIFICAR','2017-10-31 14:37:15','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12849844 Y NOMBRE ES MANUEL PEREZ SUAREZ','{id : 28,cedula : \"V-12849844\",nombres : \"MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"MANUELPEREZ1@GMAIL.COM\"telefono : \"+58 426 940 93 34\"fecha_de_nacimiento : \"17/12/1938\"}','{id : 28,cedula : \"V-12849844\",nombres : \"MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"MANUELPEREZ1@GMAIL.COM\"telefono : \"+584269409334\"fecha_de_nacimiento : \"17/12/1938\"}'),(277,1,'MODIFICAR','2017-10-31 14:37:30','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12849847 Y NOMBRE ES WILKENSON DANIEL CAMACHO CUICAS','{id : 29,cedula : \"V-12849847\",nombres : \"WILKENSON DANIEL\"apellidos : \"CAMACHO CUICAS\"email : \"WILKEON@HOTMAIL.COM\"telefono : \"+58 426 933 09 30\"fecha_de_nacimiento : \"18/10/1995\"}','{id : 29,cedula : \"V-12849847\",nombres : \"WILKENSON DANIEL\"apellidos : \"CAMACHO CUICAS\"email : \"WILKEON@HOTMAIL.COM\"telefono : \"+584269330930\"fecha_de_nacimiento : \"18/10/1995\"}'),(278,1,'MODIFICAR','2017-10-31 14:37:39','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-23485533 Y NOMBRE ES BRAYAN COLMENAREZ','{id : 31,cedula : \"V-23485533\",nombres : \"BRAYAN\"apellidos : \"COLMENAREZ\"email : \"ELBRAYITA@GMAIL.COM\"telefono : \"+58 426 256 39 93\"fecha_de_nacimiento : \"12/12/1992\"}','{id : 31,cedula : \"V-23485533\",nombres : \"BRAYAN\"apellidos : \"COLMENAREZ\"email : \"ELBRAYITA@GMAIL.COM\"telefono : \"+584262563993\"fecha_de_nacimiento : \"12/12/1992\"}'),(279,1,'MODIFICAR','2017-10-31 14:38:05','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-12849344 Y NOMBRE ES JORGE MIGUEL HUACK CAMACHO','{id : 30,cedula : \"V-12849344\",nombres : \"JORGE MIGUEL\"apellidos : \"HUACK CAMACHO\"email : \"GEORGEHUACK@YAHOO.COM.VE\"telefono : \"+58 424 632 83 43\"fecha_de_nacimiento : \"11/10/1992\"}','{id : 30,cedula : \"V-12849344\",nombres : \"JORGE MIGUEL\"apellidos : \"HUACK CAMACHO\"email : \"GEORGEHUACK@YAHOO.COM.VE\"telefono : \"+584246328343\"fecha_de_nacimiento : \"11/10/1992\"}'),(280,1,'MODIFICAR','2017-10-31 14:38:32','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-14859333 Y NOMBRE ES JUAN ESTEBAN MOAD AHMAD','{id : 26,cedula : \"V-14859333\",nombres : \"JUAN ESTEBAN\"apellidos : \"MOAD AHMAD\"email : \"JUANESTEBAN@GMAIL.COM\"telefono : \"+58 412 838 38 33\"fecha_de_nacimiento : \"13/08/1960\"}','{id : 26,cedula : \"V-14859333\",nombres : \"JUAN ESTEBAN\"apellidos : \"MOAD AHMAD\"email : \"JUANESTEBAN@GMAIL.COM\"telefono : \"+584128383833\"fecha_de_nacimiento : \"13/08/1960\"}'),(281,1,'MODIFICAR','2017-10-31 14:38:44','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-17383922 Y NOMBRE ES JOHAN MIGUEL CHAVEZ RODRIGUEZ','{id : 24,cedula : \"V-17383922\",nombres : \"JOHAN MIGUEL\"apellidos : \"CHAVEZ RODRIGUEZ\"email : \"JOHANCHAVEZ@TSJ.COM.VE\"telefono : \"+58 412 484 93 99\"fecha_de_nacimiento : \"12/12/1968\"}','{id : 24,cedula : \"V-17383922\",nombres : \"JOHAN MIGUEL\"apellidos : \"CHAVEZ RODRIGUEZ\"email : \"JOHANCHAVEZ@TSJ.COM.VE\"telefono : \"+58 412 484 93 99\"fecha_de_nacimiento : \"12/12/1968\"}'),(282,1,'MODIFICAR','2017-10-31 14:39:00','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-17383922 Y NOMBRE ES JOHAN MIGUEL CHAVEZ RODRIGUEZ','{id : 24,cedula : \"V-17383922\",nombres : \"JOHAN MIGUEL\"apellidos : \"CHAVEZ RODRIGUEZ\"email : \"JOHANCHAVEZ@TSJ.COM.VE\"telefono : \"+58 412 484 93 99\"fecha_de_nacimiento : \"12/12/1968\"}','{id : 24,cedula : \"V-17383922\",nombres : \"JOHAN MIGUEL\"apellidos : \"CHAVEZ RODRIGUEZ\"email : \"JOHANCHAVEZ@TSJ.COM.VE\"telefono : \"+584124849399\"fecha_de_nacimiento : \"12/12/1968\"}'),(283,1,'MODIFICAR','2017-10-31 14:39:14','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-18344034 Y NOMBRE ES MANUEL COLMENAREZ','{id : 25,cedula : \"V-18344034\",nombres : \"MANUEL\"apellidos : \"COLMENAREZ\"email : \"MANUELCOLMENAREZ@HOTMAIL.COM\"telefono : \"+58 414 938 48 44\"fecha_de_nacimiento : \"12/10/1992\"}','{id : 25,cedula : \"V-18344034\",nombres : \"MANUEL\"apellidos : \"COLMENAREZ\"email : \"MANUELCOLMENAREZ@HOTMAIL.COM\"telefono : \"+584149384844\"fecha_de_nacimiento : \"12/10/1992\"}'),(284,1,'INSERTAR','2017-11-07 14:29:02','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 1',NULL,'{id : 12,numero : \"TRIBUNAL 1\",id_tipo_tribunal : \"3\"}'),(285,0,'ELIMINAR','2017-11-07 14:29:16','TRIBUNAL','SE HA ELIMINADO UNA TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO TRIBUNAL 1','{id : 9,numero : \"TRIBUNAL 1\",id_tipo_tribunal : \"3\"}',NULL),(286,1,'INSERTAR','2017-11-07 14:54:26','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-19355522 Y NOMBRE ES MIGUELINA ALVES',NULL,'{id : 33,cedula : \"V-19355522\",nombres : \"MIGUELINA\"apellidos : \"ALVES\"email : \"MIGUEL_ALVES_89@HOTMAIL.COM\"telefono : \"+584262525009\"fecha_de_nacimiento : \"20/10/1899\"}'),(287,1,'ELIMINAR','2017-11-07 15:01:03','TRIBUNAL','SE HA ELIMINADO UNA TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO TRIBUNAL 1','{id : 12,numero : \"TRIBUNAL 1\",id_tipo_tribunal : \"3\"}',NULL),(288,1,'MODIFICAR','2017-11-07 15:09:33','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-19355522 Y NOMBRE ES MIGUEL ALVES','{id : 33,cedula : \"V-19355522\",nombres : \"MIGUELINA\"apellidos : \"ALVES\"email : \"MIGUEL_ALVES_89@HOTMAIL.COM\"telefono : \"+584262525009\"fecha_de_nacimiento : \"20/10/1899\"}','{id : 33,cedula : \"V-19355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUEL_ALVES_89@HOTMAIL.COM\"telefono : \"+584262525009\"fecha_de_nacimiento : \"20/10/1899\"}'),(289,1,'MODIFICAR','2017-11-07 15:10:03','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-19355522 Y NOMBRE ES MIGUEL ALVES','{id : 33,cedula : \"V-19355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUEL_ALVES_89@HOTMAIL.COM\"telefono : \"+584262525009\"fecha_de_nacimiento : \"20/10/1899\"}','{id : 33,cedula : \"V-19355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUEL_ALVES_89@HOTMAIL.COM\"telefono : \"+584262525009\"fecha_de_nacimiento : \"20/10/1899\"}'),(290,1,'INSERTAR','2017-11-07 15:11:18','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(291,1,'MODIFICAR','2017-11-07 15:11:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(292,1,'MODIFICAR','2017-11-07 15:12:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(293,1,'MODIFICAR','2017-11-07 15:12:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(294,1,'MODIFICAR','2017-11-07 15:12:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(295,1,'MODIFICAR','2017-11-07 15:13:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(296,1,'MODIFICAR','2017-11-07 15:13:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(297,1,'MODIFICAR','2017-11-07 15:15:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(298,1,'MODIFICAR','2017-11-07 15:20:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(299,1,'MODIFICAR','2017-11-07 15:20:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(300,1,'MODIFICAR','2017-11-07 15:20:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(301,1,'MODIFICAR','2017-11-07 15:20:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(302,1,'MODIFICAR','2017-11-07 15:20:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(303,1,'MODIFICAR','2017-11-07 15:21:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(304,1,'MODIFICAR','2017-11-07 15:21:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(305,1,'MODIFICAR','2017-11-07 15:21:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(306,1,'MODIFICAR','2017-11-07 15:21:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(307,1,'MODIFICAR','2017-11-07 15:21:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(308,1,'MODIFICAR','2017-11-07 15:21:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(309,1,'MODIFICAR','2017-11-07 15:21:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(310,1,'MODIFICAR','2017-11-07 15:21:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(311,1,'MODIFICAR','2017-11-07 15:21:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(312,1,'MODIFICAR','2017-11-07 15:21:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(313,1,'MODIFICAR','2017-11-07 15:21:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(314,1,'MODIFICAR','2017-11-07 15:21:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(315,1,'MODIFICAR','2017-11-07 15:21:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(316,1,'MODIFICAR','2017-11-07 15:22:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(317,1,'MODIFICAR','2017-11-07 15:30:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(318,1,'MODIFICAR','2017-11-07 15:30:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(319,1,'MODIFICAR','2017-11-07 15:32:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(320,1,'MODIFICAR','2017-11-07 15:32:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(321,1,'MODIFICAR','2017-11-07 15:32:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(322,1,'MODIFICAR','2017-11-07 15:34:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(323,1,'MODIFICAR','2017-11-07 15:34:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(324,1,'MODIFICAR','2017-11-07 15:34:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(325,1,'MODIFICAR','2017-11-07 15:34:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(326,1,'MODIFICAR','2017-11-07 15:34:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(327,1,'MODIFICAR','2017-11-07 15:34:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(328,1,'MODIFICAR','2017-11-07 16:01:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(329,1,'MODIFICAR','2017-11-07 16:01:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(330,1,'MODIFICAR','2017-11-07 16:01:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(331,1,'MODIFICAR','2017-11-07 16:01:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(332,1,'MODIFICAR','2017-11-07 16:01:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(333,1,'MODIFICAR','2017-11-07 16:01:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(334,1,'MODIFICAR','2017-11-07 16:02:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(335,1,'INSERTAR','2017-11-07 16:03:17','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO',NULL,'{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(336,1,'MODIFICAR','2017-11-07 16:03:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(337,1,'MODIFICAR','2017-11-07 16:03:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(338,1,'MODIFICAR','2017-11-07 16:03:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(339,1,'MODIFICAR','2017-11-07 16:03:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(340,1,'INSERTAR','2017-11-07 16:03:34','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES SD Y SU ESTATUS ES ASIGNADO',NULL,'{id : 13,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T11:00:00\",descripcion : \"SD\",id_sala : 4,id_tribunal : 6}'),(341,1,'MODIFICAR','2017-11-07 16:03:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(342,1,'MODIFICAR','2017-11-07 16:03:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(343,1,'MODIFICAR','2017-11-07 16:03:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES SD Y SU ESTATUS ES FINALIZADO','{id : 13,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T11:00:00\",descripcion : \"SD\",id_sala : 4,id_tribunal : 6}','{id : 13,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T11:00:00\",descripcion : \"SD\",id_sala : 4,id_tribunal : 6}'),(344,1,'MODIFICAR','2017-11-07 16:03:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(345,1,'MODIFICAR','2017-11-07 16:03:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(346,1,'MODIFICAR','2017-11-07 16:03:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(347,1,'MODIFICAR','2017-11-07 16:03:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(348,1,'MODIFICAR','2017-11-07 16:54:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(349,1,'MODIFICAR','2017-11-07 16:54:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(350,1,'MODIFICAR','2017-11-07 16:54:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(351,1,'MODIFICAR','2017-11-07 16:54:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(352,1,'MODIFICAR','2017-11-07 16:55:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(353,1,'MODIFICAR','2017-11-07 16:55:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(354,1,'MODIFICAR','2017-11-07 16:58:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(355,1,'MODIFICAR','2017-11-07 16:58:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(356,1,'MODIFICAR','2017-11-07 16:59:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(357,1,'MODIFICAR','2017-11-07 16:59:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(358,1,'MODIFICAR','2017-11-07 17:02:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(359,1,'MODIFICAR','2017-11-07 17:02:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(360,1,'MODIFICAR','2017-11-07 17:04:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(361,1,'MODIFICAR','2017-11-07 17:04:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(362,1,'MODIFICAR','2017-11-07 17:08:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(363,1,'MODIFICAR','2017-11-07 17:08:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(364,1,'MODIFICAR','2017-11-07 17:09:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(365,1,'MODIFICAR','2017-11-07 17:09:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(366,1,'MODIFICAR','2017-11-07 17:09:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(367,1,'MODIFICAR','2017-11-07 17:09:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(368,1,'MODIFICAR','2017-11-07 17:09:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(369,1,'MODIFICAR','2017-11-07 17:09:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(370,1,'MODIFICAR','2017-11-07 17:09:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(371,1,'MODIFICAR','2017-11-07 17:09:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(372,1,'MODIFICAR','2017-11-07 17:09:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(373,1,'MODIFICAR','2017-11-07 17:09:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(374,1,'MODIFICAR','2017-11-07 17:09:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(375,1,'MODIFICAR','2017-11-07 17:09:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(376,1,'MODIFICAR','2017-11-07 17:09:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(377,1,'MODIFICAR','2017-11-07 17:09:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(378,1,'MODIFICAR','2017-11-07 17:09:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(379,1,'MODIFICAR','2017-11-07 17:09:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(380,1,'MODIFICAR','2017-11-07 17:10:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(381,1,'MODIFICAR','2017-11-07 17:10:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(382,1,'MODIFICAR','2017-11-07 17:15:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(383,1,'MODIFICAR','2017-11-07 17:15:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(384,1,'MODIFICAR','2017-11-07 17:15:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(385,1,'MODIFICAR','2017-11-07 17:15:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(386,1,'INSERTAR','2017-11-07 17:16:40','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-005',NULL,'{id : 5,numero : \"EXP-005\",descripcion : \"HOMICIDIO\"}'),(387,1,'MODIFICAR','2017-11-07 17:16:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(388,1,'MODIFICAR','2017-11-07 17:16:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(389,1,'MODIFICAR','2017-11-07 17:17:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(390,1,'MODIFICAR','2017-11-07 17:17:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(391,1,'MODIFICAR','2017-11-07 17:17:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(392,1,'MODIFICAR','2017-11-07 17:17:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(393,1,'INSERTAR','2017-11-07 17:18:12','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-09T09:00:00 CUYA DESCRIPCION ES DESCRIPCOI Y SU ESTATUS ES ASIGNADO',NULL,'{id : 14,inicio : \"2017-11-09T09:00:00\",fin : \"2017-11-09T16:00:00\",descripcion : \"DESCRIPCOI\",id_sala : 3,id_tribunal : 1}'),(394,1,'MODIFICAR','2017-11-07 17:18:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(395,1,'MODIFICAR','2017-11-07 17:18:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(396,1,'MODIFICAR','2017-11-07 17:19:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCOI Y SU ESTATUS ES ESPERA','{id : 14,inicio : \"2017-11-09T09:00:00\",fin : \"2017-11-09T16:00:00\",descripcion : \"DESCRIPCOI\",id_sala : 3,id_tribunal : 1}','{id : 14,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCOI\",id_sala : 1,id_tribunal : 1}'),(397,1,'MODIFICAR','2017-11-07 17:20:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-10T09:00:00 CUYA DESCRIPCION ES DESCRIPCOI Y SU ESTATUS ES ASIGNADO','{id : 14,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCOI\",id_sala : 1,id_tribunal : 1}','{id : 14,inicio : \"2017-11-10T09:00:00\",fin : \"2017-11-10T11:00:00\",descripcion : \"DESCRIPCOI\",id_sala : 5,id_tribunal : 1}'),(398,1,'MODIFICAR','2017-11-07 17:20:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-10T09:00:00 CUYA DESCRIPCION ES EXP-005: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 14,inicio : \"2017-11-10T09:00:00\",fin : \"2017-11-10T11:00:00\",descripcion : \"DESCRIPCOI\",id_sala : 5,id_tribunal : 1}','{id : 14,inicio : \"2017-11-10T09:00:00\",fin : \"2017-11-10T16:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(399,1,'MODIFICAR','2017-11-07 17:20:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-10T08:00:00 CUYA DESCRIPCION ES EXP-005: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 14,inicio : \"2017-11-10T09:00:00\",fin : \"2017-11-10T16:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 14,inicio : \"2017-11-10T08:00:00\",fin : \"2017-11-10T15:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(400,1,'MODIFICAR','2017-11-07 17:20:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-10T08:00:00 CUYA DESCRIPCION ES EXP-005: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 14,inicio : \"2017-11-10T08:00:00\",fin : \"2017-11-10T15:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 14,inicio : \"2017-11-10T08:00:00\",fin : \"2017-11-10T15:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(401,1,'ELIMINAR','2017-11-07 17:21:27','ACTO','','{id : 14,inicio : \"2017-11-10T08:00:00\",fin : \"2017-11-10T15:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}',NULL),(402,1,'MODIFICAR','2017-11-07 17:21:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(403,1,'MODIFICAR','2017-11-07 17:21:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(404,1,'INSERTAR','2017-11-07 17:22:22','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ESPERA',NULL,'{id : 15,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 6}'),(405,1,'MODIFICAR','2017-11-07 17:22:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(406,1,'MODIFICAR','2017-11-07 17:22:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(407,1,'MODIFICAR','2017-11-07 17:22:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-11T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 15,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 6}','{id : 15,inicio : \"2017-11-11T09:00:00\",fin : \"2017-11-11T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(408,1,'MODIFICAR','2017-11-07 17:22:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-11T09:00:00 CUYA DESCRIPCION ES EXP-005: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 15,inicio : \"2017-11-11T09:00:00\",fin : \"2017-11-11T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 15,inicio : \"2017-11-11T09:00:00\",fin : \"2017-11-11T16:00:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 6}'),(409,1,'MODIFICAR','2017-11-07 17:22:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-11T08:30:00 CUYA DESCRIPCION ES EXP-005: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 15,inicio : \"2017-11-11T09:00:00\",fin : \"2017-11-11T16:00:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 6}','{id : 15,inicio : \"2017-11-11T08:30:00\",fin : \"2017-11-11T15:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 6}'),(410,1,'MODIFICAR','2017-11-07 17:23:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-11T09:30:00 CUYA DESCRIPCION ES EXP-005: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 15,inicio : \"2017-11-11T08:30:00\",fin : \"2017-11-11T15:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 6}','{id : 15,inicio : \"2017-11-11T09:30:00\",fin : \"2017-11-11T16:30:00\",descripcion : \"EXP-005: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 6}'),(411,1,'MODIFICAR','2017-11-07 17:23:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(412,1,'MODIFICAR','2017-11-07 17:23:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(413,1,'MODIFICAR','2017-11-07 17:23:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(414,1,'MODIFICAR','2017-11-07 17:23:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(415,1,'MODIFICAR','2017-11-07 17:24:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(416,1,'MODIFICAR','2017-11-07 17:24:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(417,1,'MODIFICAR','2017-11-07 17:29:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(418,1,'MODIFICAR','2017-11-07 17:29:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(419,1,'MODIFICAR','2017-11-07 17:30:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(420,1,'MODIFICAR','2017-11-07 17:30:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(421,1,'MODIFICAR','2017-11-07 17:37:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(422,1,'MODIFICAR','2017-11-07 17:37:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(423,1,'MODIFICAR','2017-11-07 17:38:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(424,1,'MODIFICAR','2017-11-07 17:38:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(425,1,'MODIFICAR','2017-11-07 17:39:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(426,1,'MODIFICAR','2017-11-07 17:39:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(427,1,'MODIFICAR','2017-11-07 17:39:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(428,1,'MODIFICAR','2017-11-07 17:39:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(429,1,'MODIFICAR','2017-11-07 17:43:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(430,1,'MODIFICAR','2017-11-07 17:43:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(431,1,'MODIFICAR','2017-11-07 17:43:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(432,1,'MODIFICAR','2017-11-07 17:43:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(433,1,'MODIFICAR','2017-11-07 18:37:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(434,1,'MODIFICAR','2017-11-07 18:37:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(435,1,'MODIFICAR','2017-11-07 18:37:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(436,1,'MODIFICAR','2017-11-07 18:37:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(437,1,'MODIFICAR','2017-11-07 18:38:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(438,1,'MODIFICAR','2017-11-07 18:38:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(439,1,'MODIFICAR','2017-11-07 18:38:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(440,1,'MODIFICAR','2017-11-07 18:38:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(441,1,'MODIFICAR','2017-11-07 18:39:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(442,1,'MODIFICAR','2017-11-07 18:39:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(443,1,'MODIFICAR','2017-11-07 18:40:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(444,1,'MODIFICAR','2017-11-07 18:40:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(445,1,'MODIFICAR','2017-11-07 18:40:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(446,1,'MODIFICAR','2017-11-07 18:40:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(447,1,'MODIFICAR','2017-11-07 18:40:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(448,1,'MODIFICAR','2017-11-07 18:40:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(449,1,'MODIFICAR','2017-11-07 18:40:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(450,1,'MODIFICAR','2017-11-07 18:40:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(451,1,'MODIFICAR','2017-11-07 18:42:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(452,1,'MODIFICAR','2017-11-07 18:42:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(453,1,'MODIFICAR','2017-11-07 18:42:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(454,1,'MODIFICAR','2017-11-07 18:42:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(455,1,'MODIFICAR','2017-11-07 18:43:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(456,1,'MODIFICAR','2017-11-07 18:43:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(457,1,'MODIFICAR','2017-11-07 18:43:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(458,1,'MODIFICAR','2017-11-07 18:43:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(459,1,'MODIFICAR','2017-11-07 18:43:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(460,1,'MODIFICAR','2017-11-07 18:43:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(461,1,'MODIFICAR','2017-11-07 18:43:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(462,1,'MODIFICAR','2017-11-07 18:43:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(463,1,'MODIFICAR','2017-11-07 18:43:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(464,1,'MODIFICAR','2017-11-07 18:43:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(465,1,'MODIFICAR','2017-11-07 18:43:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(466,1,'MODIFICAR','2017-11-07 18:43:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(467,1,'MODIFICAR','2017-11-07 18:43:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(468,1,'MODIFICAR','2017-11-07 18:43:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(469,1,'MODIFICAR','2017-11-07 18:43:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(470,1,'MODIFICAR','2017-11-07 18:43:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(471,1,'MODIFICAR','2017-11-07 18:43:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(472,1,'MODIFICAR','2017-11-07 18:43:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(473,1,'MODIFICAR','2017-11-07 18:43:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(474,1,'MODIFICAR','2017-11-07 18:43:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(475,1,'MODIFICAR','2017-11-07 18:43:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(476,1,'MODIFICAR','2017-11-07 18:43:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(477,1,'MODIFICAR','2017-11-07 18:43:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(478,1,'MODIFICAR','2017-11-07 18:43:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(479,1,'MODIFICAR','2017-11-07 18:43:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(480,1,'MODIFICAR','2017-11-07 18:43:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(481,1,'MODIFICAR','2017-11-07 18:43:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(482,1,'MODIFICAR','2017-11-07 18:43:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(483,1,'MODIFICAR','2017-11-07 18:43:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(484,1,'MODIFICAR','2017-11-07 18:43:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(485,1,'MODIFICAR','2017-11-07 18:43:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(486,1,'MODIFICAR','2017-11-07 18:43:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(487,1,'MODIFICAR','2017-11-07 18:43:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(488,1,'MODIFICAR','2017-11-07 18:43:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(489,1,'MODIFICAR','2017-11-07 18:43:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(490,1,'MODIFICAR','2017-11-07 18:43:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(491,1,'MODIFICAR','2017-11-07 18:43:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(492,1,'MODIFICAR','2017-11-07 18:43:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(493,1,'MODIFICAR','2017-11-07 18:43:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(494,1,'MODIFICAR','2017-11-07 18:43:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(495,1,'MODIFICAR','2017-11-07 18:43:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(496,1,'MODIFICAR','2017-11-07 18:43:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(497,1,'MODIFICAR','2017-11-07 18:43:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(498,1,'MODIFICAR','2017-11-07 18:43:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(499,1,'MODIFICAR','2017-11-07 18:43:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(500,1,'MODIFICAR','2017-11-07 18:43:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(501,1,'MODIFICAR','2017-11-07 18:43:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(502,1,'MODIFICAR','2017-11-07 18:43:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(503,1,'MODIFICAR','2017-11-07 18:43:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(504,1,'MODIFICAR','2017-11-07 18:43:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(505,1,'MODIFICAR','2017-11-07 18:43:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(506,1,'MODIFICAR','2017-11-07 18:43:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(507,1,'MODIFICAR','2017-11-07 18:43:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(508,1,'MODIFICAR','2017-11-07 18:43:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(509,1,'MODIFICAR','2017-11-07 18:43:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(510,1,'MODIFICAR','2017-11-07 18:43:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(511,1,'MODIFICAR','2017-11-07 18:43:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(512,1,'MODIFICAR','2017-11-07 18:43:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(513,1,'MODIFICAR','2017-11-07 18:43:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(514,1,'MODIFICAR','2017-11-07 18:43:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(515,1,'MODIFICAR','2017-11-07 18:43:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(516,1,'MODIFICAR','2017-11-07 18:43:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(517,1,'MODIFICAR','2017-11-07 18:43:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(518,1,'MODIFICAR','2017-11-07 18:43:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(519,1,'MODIFICAR','2017-11-07 18:43:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(520,1,'MODIFICAR','2017-11-07 18:43:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(521,1,'MODIFICAR','2017-11-07 18:43:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(522,1,'MODIFICAR','2017-11-07 18:43:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(523,1,'MODIFICAR','2017-11-07 18:43:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(524,1,'MODIFICAR','2017-11-07 18:43:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(525,1,'MODIFICAR','2017-11-07 18:43:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(526,1,'MODIFICAR','2017-11-07 18:43:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(527,1,'MODIFICAR','2017-11-07 18:43:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(528,1,'MODIFICAR','2017-11-07 18:43:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(529,1,'MODIFICAR','2017-11-07 18:43:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(530,1,'MODIFICAR','2017-11-07 18:43:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(531,1,'MODIFICAR','2017-11-07 18:43:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(532,1,'MODIFICAR','2017-11-07 18:43:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(533,1,'MODIFICAR','2017-11-07 18:43:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(534,1,'MODIFICAR','2017-11-07 18:43:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(535,1,'MODIFICAR','2017-11-07 18:44:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(536,1,'MODIFICAR','2017-11-07 18:44:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(537,1,'MODIFICAR','2017-11-07 18:44:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(538,1,'MODIFICAR','2017-11-07 18:44:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(539,1,'MODIFICAR','2017-11-07 18:44:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(540,1,'MODIFICAR','2017-11-07 18:44:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(541,1,'MODIFICAR','2017-11-07 18:44:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(542,1,'MODIFICAR','2017-11-07 18:44:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(543,1,'MODIFICAR','2017-11-07 18:44:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(544,1,'MODIFICAR','2017-11-07 18:44:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(545,1,'MODIFICAR','2017-11-07 18:44:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(546,1,'MODIFICAR','2017-11-07 18:44:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(547,1,'MODIFICAR','2017-11-07 18:44:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(548,1,'MODIFICAR','2017-11-07 18:44:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(549,1,'MODIFICAR','2017-11-07 18:44:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(550,1,'MODIFICAR','2017-11-07 18:44:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(551,1,'MODIFICAR','2017-11-07 18:44:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(552,1,'MODIFICAR','2017-11-07 18:44:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(553,1,'MODIFICAR','2017-11-07 18:44:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(554,1,'MODIFICAR','2017-11-07 18:44:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(555,1,'MODIFICAR','2017-11-07 18:44:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(556,1,'MODIFICAR','2017-11-07 18:44:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(557,1,'MODIFICAR','2017-11-07 18:44:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(558,1,'MODIFICAR','2017-11-07 18:44:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(559,1,'MODIFICAR','2017-11-07 18:44:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(560,1,'MODIFICAR','2017-11-07 18:44:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(561,1,'MODIFICAR','2017-11-07 18:44:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(562,1,'MODIFICAR','2017-11-07 18:44:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(563,1,'MODIFICAR','2017-11-07 18:44:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(564,1,'MODIFICAR','2017-11-07 18:44:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(565,1,'MODIFICAR','2017-11-07 18:44:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(566,1,'MODIFICAR','2017-11-07 18:44:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(567,1,'MODIFICAR','2017-11-07 18:44:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(568,1,'MODIFICAR','2017-11-07 18:44:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(569,1,'MODIFICAR','2017-11-07 18:44:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(570,1,'MODIFICAR','2017-11-07 18:44:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(571,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(572,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(573,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(574,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(575,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(576,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(577,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(578,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(579,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(580,1,'MODIFICAR','2017-11-07 18:44:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(581,1,'MODIFICAR','2017-11-07 18:44:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(582,1,'MODIFICAR','2017-11-07 18:44:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(583,1,'MODIFICAR','2017-11-07 18:44:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(584,1,'MODIFICAR','2017-11-07 18:44:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(585,1,'MODIFICAR','2017-11-07 18:44:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(586,1,'MODIFICAR','2017-11-07 18:44:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(587,1,'MODIFICAR','2017-11-07 18:44:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(588,1,'MODIFICAR','2017-11-07 18:44:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(589,1,'MODIFICAR','2017-11-07 18:44:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(590,1,'MODIFICAR','2017-11-07 18:44:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(591,1,'MODIFICAR','2017-11-07 18:44:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(592,1,'MODIFICAR','2017-11-07 18:44:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(593,1,'MODIFICAR','2017-11-07 18:44:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(594,1,'MODIFICAR','2017-11-07 18:44:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(595,1,'MODIFICAR','2017-11-07 18:44:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(596,1,'MODIFICAR','2017-11-07 18:44:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(597,1,'MODIFICAR','2017-11-07 18:44:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(598,1,'MODIFICAR','2017-11-07 18:44:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(599,1,'MODIFICAR','2017-11-07 18:44:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(600,1,'MODIFICAR','2017-11-07 18:44:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(601,1,'MODIFICAR','2017-11-07 18:44:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(602,1,'MODIFICAR','2017-11-07 18:44:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(603,1,'MODIFICAR','2017-11-07 18:44:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(604,1,'MODIFICAR','2017-11-07 18:44:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(605,1,'MODIFICAR','2017-11-07 18:44:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(606,1,'MODIFICAR','2017-11-07 18:44:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(607,1,'MODIFICAR','2017-11-07 18:44:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(608,1,'MODIFICAR','2017-11-07 18:44:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(609,1,'MODIFICAR','2017-11-07 18:44:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(610,1,'MODIFICAR','2017-11-07 18:44:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(611,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(612,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(613,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(614,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(615,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(616,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(617,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(618,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(619,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(620,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(621,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(622,1,'MODIFICAR','2017-11-07 18:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(623,1,'MODIFICAR','2017-11-07 18:44:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(624,1,'MODIFICAR','2017-11-07 18:44:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(625,1,'MODIFICAR','2017-11-07 18:44:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(626,1,'MODIFICAR','2017-11-07 18:44:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(627,1,'MODIFICAR','2017-11-07 18:44:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(628,1,'MODIFICAR','2017-11-07 18:44:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(629,1,'MODIFICAR','2017-11-07 18:44:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(630,1,'MODIFICAR','2017-11-07 18:44:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(631,1,'MODIFICAR','2017-11-07 18:44:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(632,1,'MODIFICAR','2017-11-07 18:44:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(633,1,'MODIFICAR','2017-11-07 18:44:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(634,1,'MODIFICAR','2017-11-07 18:44:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(635,1,'MODIFICAR','2017-11-07 18:44:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(636,1,'MODIFICAR','2017-11-07 18:44:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(637,1,'MODIFICAR','2017-11-07 18:44:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(638,1,'MODIFICAR','2017-11-07 18:44:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(639,1,'MODIFICAR','2017-11-07 18:44:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(640,1,'MODIFICAR','2017-11-07 18:44:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(641,1,'MODIFICAR','2017-11-07 18:44:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(642,1,'MODIFICAR','2017-11-07 18:44:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(643,1,'MODIFICAR','2017-11-07 18:44:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(644,1,'MODIFICAR','2017-11-07 18:44:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(645,1,'MODIFICAR','2017-11-07 18:44:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(646,1,'MODIFICAR','2017-11-07 18:44:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(647,1,'MODIFICAR','2017-11-07 18:44:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(648,1,'MODIFICAR','2017-11-07 18:44:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(649,1,'MODIFICAR','2017-11-07 18:44:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(650,1,'MODIFICAR','2017-11-07 18:44:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(651,1,'MODIFICAR','2017-11-07 18:44:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(652,1,'MODIFICAR','2017-11-07 18:44:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(653,1,'MODIFICAR','2017-11-07 18:44:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(654,1,'MODIFICAR','2017-11-07 18:44:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(655,1,'MODIFICAR','2017-11-07 18:44:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(656,1,'MODIFICAR','2017-11-07 18:44:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(657,1,'MODIFICAR','2017-11-07 18:44:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(658,1,'MODIFICAR','2017-11-07 18:44:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(659,1,'MODIFICAR','2017-11-07 18:44:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(660,1,'MODIFICAR','2017-11-07 18:44:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(661,1,'MODIFICAR','2017-11-07 18:44:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(662,1,'MODIFICAR','2017-11-07 18:44:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(663,1,'MODIFICAR','2017-11-07 18:44:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(664,1,'MODIFICAR','2017-11-07 18:44:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(665,1,'MODIFICAR','2017-11-07 18:44:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(666,1,'MODIFICAR','2017-11-07 18:44:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(667,1,'MODIFICAR','2017-11-07 18:44:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(668,1,'MODIFICAR','2017-11-07 18:44:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(669,1,'MODIFICAR','2017-11-07 18:44:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(670,1,'MODIFICAR','2017-11-07 18:44:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(671,1,'MODIFICAR','2017-11-07 18:44:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(672,1,'MODIFICAR','2017-11-07 18:44:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(673,1,'MODIFICAR','2017-11-07 18:44:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(674,1,'MODIFICAR','2017-11-07 18:44:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(675,1,'MODIFICAR','2017-11-07 18:44:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(676,1,'MODIFICAR','2017-11-07 18:44:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(677,1,'MODIFICAR','2017-11-07 18:44:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(678,1,'MODIFICAR','2017-11-07 18:44:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(679,1,'MODIFICAR','2017-11-07 18:44:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(680,1,'MODIFICAR','2017-11-07 18:44:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(681,1,'MODIFICAR','2017-11-07 18:44:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(682,1,'MODIFICAR','2017-11-07 18:44:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(683,1,'MODIFICAR','2017-11-07 18:44:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(684,1,'MODIFICAR','2017-11-07 18:44:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(685,1,'MODIFICAR','2017-11-07 18:44:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(686,1,'MODIFICAR','2017-11-07 18:44:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(687,1,'MODIFICAR','2017-11-07 18:44:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(688,1,'MODIFICAR','2017-11-07 18:44:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(689,1,'MODIFICAR','2017-11-07 18:44:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(690,1,'MODIFICAR','2017-11-07 18:44:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(691,1,'MODIFICAR','2017-11-07 18:44:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(692,1,'MODIFICAR','2017-11-07 18:44:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(693,1,'MODIFICAR','2017-11-07 18:44:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(694,1,'MODIFICAR','2017-11-07 18:44:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(695,1,'MODIFICAR','2017-11-07 18:44:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(696,1,'MODIFICAR','2017-11-07 18:44:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(697,1,'MODIFICAR','2017-11-07 18:44:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(698,1,'MODIFICAR','2017-11-07 18:44:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(699,1,'MODIFICAR','2017-11-07 18:44:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(700,1,'MODIFICAR','2017-11-07 18:44:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(701,1,'MODIFICAR','2017-11-07 18:44:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(702,1,'MODIFICAR','2017-11-07 18:44:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(703,1,'MODIFICAR','2017-11-07 18:44:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(704,1,'MODIFICAR','2017-11-07 18:44:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(705,1,'MODIFICAR','2017-11-07 18:44:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(706,1,'MODIFICAR','2017-11-07 18:44:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(707,1,'MODIFICAR','2017-11-07 18:44:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(708,1,'MODIFICAR','2017-11-07 18:44:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(709,1,'MODIFICAR','2017-11-07 18:44:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(710,1,'MODIFICAR','2017-11-07 18:44:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(711,1,'MODIFICAR','2017-11-07 18:44:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(712,1,'MODIFICAR','2017-11-07 18:44:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(713,1,'MODIFICAR','2017-11-07 18:44:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(714,1,'MODIFICAR','2017-11-07 18:44:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(715,1,'MODIFICAR','2017-11-07 18:44:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(716,1,'MODIFICAR','2017-11-07 18:44:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(717,1,'MODIFICAR','2017-11-07 18:44:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(718,1,'MODIFICAR','2017-11-07 18:44:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(719,1,'MODIFICAR','2017-11-07 18:44:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(720,1,'MODIFICAR','2017-11-07 18:44:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(721,1,'MODIFICAR','2017-11-07 18:44:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(722,1,'MODIFICAR','2017-11-07 18:44:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(723,1,'MODIFICAR','2017-11-07 18:44:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(724,1,'MODIFICAR','2017-11-07 18:44:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(725,1,'MODIFICAR','2017-11-07 18:44:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(726,1,'MODIFICAR','2017-11-07 18:44:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(727,1,'MODIFICAR','2017-11-07 18:44:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(728,1,'MODIFICAR','2017-11-07 18:44:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(729,1,'MODIFICAR','2017-11-07 18:44:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(730,1,'MODIFICAR','2017-11-07 18:44:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(731,1,'MODIFICAR','2017-11-07 18:44:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(732,1,'MODIFICAR','2017-11-07 18:44:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(733,1,'MODIFICAR','2017-11-07 18:45:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(734,1,'MODIFICAR','2017-11-07 18:45:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(735,1,'MODIFICAR','2017-11-07 18:45:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(736,1,'MODIFICAR','2017-11-07 18:45:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(737,1,'MODIFICAR','2017-11-07 18:45:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(738,1,'MODIFICAR','2017-11-07 18:45:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(739,1,'MODIFICAR','2017-11-07 18:45:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(740,1,'MODIFICAR','2017-11-07 18:45:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(741,1,'MODIFICAR','2017-11-07 18:45:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(742,1,'MODIFICAR','2017-11-07 18:45:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(743,1,'MODIFICAR','2017-11-07 18:45:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(744,1,'MODIFICAR','2017-11-07 18:45:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(745,1,'MODIFICAR','2017-11-07 18:45:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(746,1,'MODIFICAR','2017-11-07 18:45:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(747,1,'MODIFICAR','2017-11-07 18:45:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(748,1,'MODIFICAR','2017-11-07 18:45:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(749,1,'MODIFICAR','2017-11-07 18:45:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(750,1,'MODIFICAR','2017-11-07 18:45:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(751,1,'MODIFICAR','2017-11-07 18:45:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(752,1,'MODIFICAR','2017-11-07 18:45:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(753,1,'MODIFICAR','2017-11-07 18:45:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(754,1,'MODIFICAR','2017-11-07 18:45:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(755,1,'MODIFICAR','2017-11-07 18:45:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(756,1,'MODIFICAR','2017-11-07 18:45:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(757,1,'MODIFICAR','2017-11-07 18:46:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(758,1,'MODIFICAR','2017-11-07 18:46:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(759,1,'MODIFICAR','2017-11-07 18:46:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(760,1,'MODIFICAR','2017-11-07 18:46:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(761,1,'MODIFICAR','2017-11-07 18:47:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(762,1,'MODIFICAR','2017-11-07 18:47:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(763,1,'MODIFICAR','2017-11-07 18:47:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(764,1,'MODIFICAR','2017-11-07 18:47:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(765,1,'MODIFICAR','2017-11-07 18:47:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(766,1,'MODIFICAR','2017-11-07 18:47:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(767,1,'MODIFICAR','2017-11-07 18:47:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(768,1,'MODIFICAR','2017-11-07 18:47:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(769,1,'MODIFICAR','2017-11-07 18:47:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(770,1,'MODIFICAR','2017-11-07 18:47:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(771,1,'MODIFICAR','2017-11-07 18:48:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(772,1,'MODIFICAR','2017-11-07 18:48:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(773,1,'MODIFICAR','2017-11-07 18:48:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(774,1,'MODIFICAR','2017-11-07 18:48:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(775,1,'MODIFICAR','2017-11-07 18:48:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(776,1,'MODIFICAR','2017-11-07 18:48:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(777,1,'MODIFICAR','2017-11-07 18:49:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(778,1,'MODIFICAR','2017-11-07 18:49:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(779,1,'MODIFICAR','2017-11-07 18:49:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(780,1,'MODIFICAR','2017-11-07 18:49:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(781,1,'MODIFICAR','2017-11-07 18:50:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(782,1,'MODIFICAR','2017-11-07 18:50:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(783,1,'MODIFICAR','2017-11-07 18:50:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(784,1,'MODIFICAR','2017-11-07 18:50:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(785,1,'MODIFICAR','2017-11-07 18:50:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(786,1,'MODIFICAR','2017-11-07 18:50:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(787,6,'MODIFICAR','2017-11-07 18:50:50','CASO','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-001','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}'),(788,1,'MODIFICAR','2017-11-07 18:50:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(789,1,'MODIFICAR','2017-11-07 18:50:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(790,1,'MODIFICAR','2017-11-07 18:51:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(791,1,'MODIFICAR','2017-11-07 18:51:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(792,6,'MODIFICAR','2017-11-07 18:51:07','CASO','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-001','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}'),(793,1,'MODIFICAR','2017-11-07 18:51:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(794,1,'MODIFICAR','2017-11-07 18:51:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(795,1,'MODIFICAR','2017-11-07 18:51:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(796,1,'MODIFICAR','2017-11-07 18:51:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(797,6,'MODIFICAR','2017-11-07 18:51:55','CASO','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"ASESINATO\"}','{id : 2,numero : \"EXP-002\",descripcion : \"ASESINATO\"}'),(798,1,'MODIFICAR','2017-11-07 18:51:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(799,1,'MODIFICAR','2017-11-07 18:51:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(800,1,'MODIFICAR','2017-11-07 18:52:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T08:00:00 CUYA DESCRIPCION ES DESCR Y SU ESTATUS ES DIFERIDA','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}','{id : 12,inicio : \"2017-11-07T08:00:00\",fin : \"2017-11-07T16:00:00\",descripcion : \"DESCR\",id_sala : 3,id_tribunal : 1}'),(801,1,'MODIFICAR','2017-11-07 18:52:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(802,1,'MODIFICAR','2017-11-07 18:52:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(803,1,'MODIFICAR','2017-11-07 18:52:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(804,1,'MODIFICAR','2017-11-07 18:57:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(805,1,'MODIFICAR','2017-11-07 18:58:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(806,1,'MODIFICAR','2017-11-07 19:00:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(807,1,'MODIFICAR','2017-11-07 19:00:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(808,1,'MODIFICAR','2017-11-07 19:00:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(809,1,'MODIFICAR','2017-11-07 19:01:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(810,1,'MODIFICAR','2017-11-07 19:01:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(811,1,'MODIFICAR','2017-11-07 19:01:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(812,1,'MODIFICAR','2017-11-07 19:01:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(813,6,'MODIFICAR','2017-11-07 19:01:34','CASO','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-001','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}'),(814,1,'MODIFICAR','2017-11-07 19:01:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(815,1,'MODIFICAR','2017-11-07 19:01:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(816,1,'MODIFICAR','2017-11-07 19:01:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(817,1,'MODIFICAR','2017-11-07 19:01:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(818,1,'MODIFICAR','2017-11-07 19:01:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(819,1,'MODIFICAR','2017-11-07 19:02:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(820,1,'MODIFICAR','2017-11-07 19:02:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(821,1,'MODIFICAR','2017-11-07 19:02:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(822,1,'MODIFICAR','2017-11-07 19:10:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(823,1,'MODIFICAR','2017-11-07 19:10:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(824,1,'MODIFICAR','2017-11-07 19:22:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(825,1,'MODIFICAR','2017-11-07 19:22:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(826,1,'MODIFICAR','2017-11-07 19:23:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(827,1,'MODIFICAR','2017-11-07 19:23:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(828,1,'MODIFICAR','2017-11-07 19:24:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(829,1,'MODIFICAR','2017-11-07 19:24:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(830,1,'MODIFICAR','2017-11-07 19:24:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(831,1,'MODIFICAR','2017-11-07 19:25:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(832,1,'MODIFICAR','2017-11-07 19:25:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(833,1,'MODIFICAR','2017-11-07 19:26:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(834,1,'MODIFICAR','2017-11-07 19:26:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(835,1,'MODIFICAR','2017-11-07 19:27:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(836,1,'MODIFICAR','2017-11-07 19:27:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(837,1,'INSERTAR','2017-11-07 19:27:17','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-07T11:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}'),(838,1,'MODIFICAR','2017-11-07 19:27:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(839,1,'MODIFICAR','2017-11-07 19:27:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T11:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}'),(840,1,'MODIFICAR','2017-11-07 19:27:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(841,1,'MODIFICAR','2017-11-07 19:27:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T11:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}'),(842,1,'MODIFICAR','2017-11-07 19:33:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(843,1,'MODIFICAR','2017-11-07 19:33:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T11:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}'),(844,1,'MODIFICAR','2017-11-07 19:33:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(845,1,'MODIFICAR','2017-11-07 19:33:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T11:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}'),(846,1,'MODIFICAR','2017-11-07 19:33:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(847,1,'MODIFICAR','2017-11-07 19:33:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T11:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}'),(848,1,'MODIFICAR','2017-11-07 19:33:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(849,1,'MODIFICAR','2017-11-07 19:33:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T11:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}'),(850,1,'MODIFICAR','2017-11-07 19:33:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T09:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-11-07T09:30:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 1}'),(851,1,'MODIFICAR','2017-11-07 19:33:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-11-07T11:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}','{id : 16,inicio : \"2017-11-07T11:00:00\",fin : \"2017-11-07T17:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 11}');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
INSERT INTO `caso` VALUES (1,'EXP-001','ROBO A MANO ARMADA',6,'2017-10-26 22:05:38'),(2,'EXP-002','ASESINATO',6,'2017-10-26 22:06:53'),(3,'EXP-003','HOLA MUNDO',0,'2017-10-26 22:08:54'),(4,'EXP-004','DEXCRIPCION',0,'2017-10-26 22:34:13'),(5,'EXP-005','HOMICIDIO',1,'2017-11-07 17:16:40');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_caso` AFTER INSERT ON `caso` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "CASO",
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_caso` AFTER UPDATE ON `caso` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "CASO", 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_caso` AFTER DELETE ON `caso` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "ELIMINAR", 
               "CASO", 
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_alguacil`
--

LOCK TABLES `caso_alguacil` WRITE;
/*!40000 ALTER TABLE `caso_alguacil` DISABLE KEYS */;
INSERT INTO `caso_alguacil` VALUES (2,'EXP-003','V-19844933',3,'ALGUACIL'),(4,'EXP-005','V-19844933',3,'ALGUACIL'),(7,'EXP-002','V-12893004',3,'ALGUACIL'),(8,'EXP-001','V-19844933',3,'ALGUACIL');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_defensor`
--

LOCK TABLES `caso_defensor` WRITE;
/*!40000 ALTER TABLE `caso_defensor` DISABLE KEYS */;
INSERT INTO `caso_defensor` VALUES (1,'EXP-003','V-20193932',1,'DEFENSOR'),(2,'EXP-004','V-20894394',1,'DEFENSOR'),(4,'EXP-005','V-20193932',1,'DEFENSOR'),(7,'EXP-002','V-20193932',1,'DEFENSOR'),(8,'EXP-001','V-20894394',1,'DEFENSOR');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_fiscal`
--

LOCK TABLES `caso_fiscal` WRITE;
/*!40000 ALTER TABLE `caso_fiscal` DISABLE KEYS */;
INSERT INTO `caso_fiscal` VALUES (1,'EXP-003','V-17383922',8,'FISCAL'),(3,'EXP-005','V-14859333',8,'FISCAL'),(6,'EXP-002','V-14859333',8,'FISCAL'),(7,'EXP-001','V-14859333',8,'FISCAL');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_imputado`
--

LOCK TABLES `caso_imputado` WRITE;
/*!40000 ALTER TABLE `caso_imputado` DISABLE KEYS */;
INSERT INTO `caso_imputado` VALUES (3,'EXP-003','V-23485533',4,'IMPUTADO'),(4,'EXP-004','V-23485533',4,'IMPUTADO'),(6,'EXP-005','V-23485533',4,'IMPUTADO'),(9,'EXP-002','V-23485533',4,'IMPUTADO'),(10,'EXP-001','V-12849847',4,'IMPUTADO');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_juez`
--

LOCK TABLES `caso_juez` WRITE;
/*!40000 ALTER TABLE `caso_juez` DISABLE KEYS */;
INSERT INTO `caso_juez` VALUES (5,0,'V-4675893',5,'JUEZ');
/*!40000 ALTER TABLE `caso_juez` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_testigo`
--

LOCK TABLES `caso_testigo` WRITE;
/*!40000 ALTER TABLE `caso_testigo` DISABLE KEYS */;
INSERT INTO `caso_testigo` VALUES (1,'EXP-005','V-12849344',7,'TESTIGO');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_victima`
--

LOCK TABLES `caso_victima` WRITE;
/*!40000 ALTER TABLE `caso_victima` DISABLE KEYS */;
INSERT INTO `caso_victima` VALUES (3,'EXP-003','V-12849844',6,'VICTIMA'),(4,'EXP-003','V-12938443',6,'VICTIMA'),(5,'EXP-004','V-12849844',6,'VICTIMA'),(7,'EXP-005','V-12938443',6,'VICTIMA'),(12,'EXP-002','V-12938443',6,'VICTIMA'),(13,'EXP-001','V-12893944',6,'VICTIMA'),(14,'EXP-001','V-12849844',6,'VICTIMA');
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
INSERT INTO `config_notificaciones` VALUES (1,'../message_server/sms/api/outbox','../message_server/sms/schedule','../message_server/mail/api','smtp.gmail.com',465,'dem.sanfelipe@gmail.com','qwertyuiop1234567890','192.168.1.1',9300);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor`
--

LOCK TABLES `defensor` WRITE;
/*!40000 ALTER TABLE `defensor` DISABLE KEYS */;
INSERT INTO `defensor` VALUES (1,'V-21301059','PUBLICO','8298208'),(2,'V-20894394','PRIVADO','0'),(3,'V-20193932','PUBLICO','3'),(4,'V-12783944','PUBLICO','2'),(5,'V-17834993','PRIVADO','0'),(6,'V-29355522','PUBLICO','4'),(7,'V-21301062','PRIVADO','0'),(8,'V-12384954','PUBLICO','1'),(9,'V-12893944','PRIVADO','0'),(10,'V-12849333','PRIVADO','0'),(11,'V-12938443','PRIVADO','0');
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
  `tipo` varchar(100) NOT NULL,
  `id_tribunal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscal`
--

LOCK TABLES `fiscal` WRITE;
/*!40000 ALTER TABLE `fiscal` DISABLE KEYS */;
INSERT INTO `fiscal` VALUES (3,'V-21301060',7,'',0),(5,'V-21301059',9,'',0),(6,'V-17383922',11,'PRINCIPAL',3),(7,'V-18344034',1,'SUPLENTE',1),(8,'V-14859333',2,'PRINCIPAL',1),(9,'V-29355522',8888,'PRINCIPAL',3),(10,'V-21301062',909,'SUPLENTE',4);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imputado`
--

LOCK TABLES `imputado` WRITE;
/*!40000 ALTER TABLE `imputado` DISABLE KEYS */;
INSERT INTO `imputado` VALUES (2,'V-12849847'),(1,'V-21301059'),(3,'V-23485533');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juez`
--

LOCK TABLES `juez` WRITE;
/*!40000 ALTER TABLE `juez` DISABLE KEYS */;
INSERT INTO `juez` VALUES (5,'V-12849333'),(2,'V-12884894'),(3,'V-18943933'),(1,'V-21301059'),(4,'V-4675893');
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
  `body` longtext NOT NULL,
  `user` varchar(20) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `emisor` varchar(100) NOT NULL,
  `ip` varchar(300) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'Hola','3.png','Hola Juan','V-21301061','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 12:28:53',1),(2,'MILDRED DE JESUS VARGAS JUAREZ HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO MILDRED DE JESUS VARGAS JUAREZ CUYA CEDULA DE IDENTIDAD ES V-21301062 HA FINALIZADO EL ACTO NUMERO 13 DE LA CAUSA EXP-001 DE FECHA 26/10/2017','','ADMINISTRADOR','MILDRED DE JESUS VARGAS JUAREZ','','notificacion','2017-10-26 19:27:18',0),(3,'MILDRED DE JESUS VARGAS JUAREZ HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO MILDRED DE JESUS VARGAS JUAREZ CUYA CEDULA DE IDENTIDAD ES V-21301062 HA DIFERIDO EL ACTO NUMERO 16 DE LA CAUSA EXP-002 DE FECHA 26/10/2017','','ADMINISTRADOR','MILDRED DE JESUS VARGAS JUAREZ','','notificacion','2017-10-26 19:36:13',0),(4,'Hola','4.png','Hola, como estas>?','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 19:53:48',0),(5,'HOLA','4.png','HOLa','','','ANTHONY JOSE MEDINA FUENTES','192.168.43.216','notificacion','2017-10-26 20:01:09',1),(6,'Hola a todos','4.png','Buenos dias, recuerdenrevisar eso','','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 20:54:17',1),(7,'Hola JHuan','3.png','Hola','V-21301061','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 20:54:51',1),(8,'Mensajepara todos los usuarios espaciales','5.png','que tal','','USUARIO ESPECIAL','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 20:55:27',1),(9,'este mensaje me debe llegar','5.png','si','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 21:00:40',0),(10,'hola','4.png','hola','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 21:00:49',1),(11,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO REGISTROS EN LA TABLA DE IMPUTADO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO REGISTROS EN LA TABLA DE IMPUTADO, POR FAVOR, VERIFIQUE ESTA INFORMACION EN LA BITACORA DEL SISTEMA PARA VER MAS DETALLES','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 21:22:42',0),(12,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 2 DE LA CAUSA EXP-003 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:13:09',0),(13,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 2 DE LA CAUSA EXP-003 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:16:44',0),(14,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:17:39',1),(15,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:18:44',0),(16,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA NaN/NaN/NaN EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:20:26',0),(17,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 2 DE LA CAUSA EXP-003 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:23:15',0),(18,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:24:50',0),(19,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA 27/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:27:08',0),(20,'Hola, buenos dias','4.png','Este mensaje es para recodarles que tienen que asistir','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:29:04',1),(21,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 1 DE LA CAUSA EXP-001 EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:41:36',1),(22,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 8 DE LA CAUSA EXP-001 EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:09:25',1),(23,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 8 DE LA CAUSA EXP-001 DE FECHA 29/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:09:38',1),(24,'nuevo mensaje','4.png','mensaje','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:10:13',1),(25,'Asuntodel mensaje','3.png','mensaje','V-21301059','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:16:09',0),(26,'hola','5.png','ha','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:16:13',0),(27,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 11 DE LA CAUSA EXP-001 EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.4','notificacion','2017-10-30 16:21:00',1),(28,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 11 DE LA CAUSA EXP-001 DE FECHA 31/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.4','notificacion','2017-10-31 16:24:26',0),(29,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO REGISTROS EN LA TABLA DE TRIBUNAL','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO REGISTROS EN LA TABLA DE TRIBUNAL, POR FAVOR, VERIFIQUE ESTA INFORMACION EN LA BITACORA DEL SISTEMA PARA VER MAS DETALLES','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.9','notificacion','2017-11-07 14:29:24',0),(30,'LA PUTA','3.png','PERRA SUCIA','V-21301059','','MIGUELINA ALVES','','notificacion','2017-11-07 14:58:13',1),(31,'HOLA','3.png','HOLA AMIGA','V-21301059','','MIGUELINA ALVES','','notificacion','2017-11-07 14:58:50',1),(32,'Hola perra irresponsable','3.png','se te olvidaron los actos pa q te pago','V-19355522','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-11-07 14:59:33',1),(33,'MIGUELINA ALVES HA ELIMINADO REGISTROS EN LA TABLA DE TRIBUNAL','5.png','EL USUARIO MIGUELINA ALVES CUYA CEDULA DE IDENTIDAD ES V-19355522 HA ELIMINADO REGISTROS EN LA TABLA DE TRIBUNAL, POR FAVOR, VERIFIQUE ESTA INFORMACION EN LA BITACORA DEL SISTEMA PARA VER MAS DETALLES','','ADMINISTRADOR','MIGUELINA ALVES','','notificacion','2017-11-07 15:01:03',1),(34,'hhjj','3.png','g','V-19355522','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-11-07 15:06:09',0),(35,'RIN','5.png','RINURIGOF4','','ADMINISTRADOR','MIGUELINA ALVES','','notificacion','2017-11-07 15:06:32',1),(36,'LOCA LOCA','5.png','IENFIOENFIONEF','','ADMINISTRADOR','MIGUELINA ALVES','','notificacion','2017-11-07 15:08:03',0),(37,'djkdjdj','3.png','chaoiaa','V-29355522','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-11-07 15:08:15',1),(38,'ksjksdjlkdj','3.png','jkslkds','V-19355522','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-11-07 18:52:28',0),(39,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 14 DE LA CAUSA EXP-005 EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.9','notificacion','2017-11-07 17:19:39',1),(40,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 14 DE LA CAUSA EXP-005 DE FECHA 10/11/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.9','notificacion','2017-11-07 17:21:27',1),(41,'MIGUEL ALVES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO MIGUEL ALVES CUYA CEDULA DE IDENTIDAD ES V-19355522 HA DIFERIDO EL ACTO NUMERO 12 DE LA CAUSA EXP-002 DE FECHA 07/11/2017','','ADMINISTRADOR','MIGUEL ALVES','192.168.1.10','notificacion','2017-11-07 18:52:10',1);
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones_usuario`
--

DROP TABLE IF EXISTS `notificaciones_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_notificacion` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `status` tinyint(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones_usuario`
--

LOCK TABLES `notificaciones_usuario` WRITE;
/*!40000 ALTER TABLE `notificaciones_usuario` DISABLE KEYS */;
INSERT INTO `notificaciones_usuario` VALUES (1,1,'V-21301061',0),(5,4,'V-21301061',0),(6,4,'V-29355522',1),(7,4,'V-21301062',1),(9,5,'V-21301061',0),(10,5,'V-29355522',1),(11,5,'V-21301062',1),(13,6,'V-21301061',0),(14,6,'V-29355522',1),(15,6,'V-21301062',1),(16,7,'V-21301061',0),(17,8,'V-21301061',0),(20,10,'V-21301061',0),(21,10,'V-29355522',1),(22,10,'V-21301062',1),(33,20,'V-21301061',0),(34,20,'V-29355522',1),(35,20,'V-21301062',1),(40,24,'V-21301061',0),(41,24,'V-29355522',1),(42,24,'V-21301062',1),(43,25,'V-21301059',0),(44,26,'V-21301059',0),(45,27,'V-21301059',0),(46,28,'V-21301059',0),(47,29,'V-21301059',0),(48,30,'V-21301059',0),(49,31,'V-21301059',0),(51,33,'V-21301059',0),(52,34,'V-19355522',0),(53,35,'V-21301059',0),(54,36,'V-21301059',0),(55,37,'V-29355522',1),(56,38,'V-19355522',0),(57,39,'V-21301059',1),(58,40,'V-21301059',1),(59,41,'V-21301059',1);
/*!40000 ALTER TABLE `notificaciones_usuario` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'V-21301059','ANTHONY JOSE','MEDINA FUENTES','ANTHONYJMEDINAF@GMAIL.COM','+584263575489','20/10/1993',0,'2017-10-01 18:48:40'),(6,'V-21301061','JUAN MANUEL','GONZALEZ PEREZ','JUANMANUELPEREZ@GMAIL.COM','+58 426 783 99 49','20/10/1992',1,'2017-10-21 14:39:48'),(7,'V-29355522','MIGUEL','ALVES','MIGUELALVES@GMAIL.COM','+583773737337','18/08/1980',1,'2017-10-31 14:35:29'),(8,'V-21301062','MILDRED DE JESUS','VARGAS JUAREZ','MIL.1DRED@GMAIL.COM','+584267840344','12/12/1992',1,'2017-10-31 14:35:38'),(9,'V-20894394','KIMBERLY MERCEDES','PEREZ TOVAR','KIMBERLY20@GMAIL.COM','+584163273838','10/10/1992',1,'2017-10-31 14:35:19'),(10,'V-20193932','DANILO JOSE','MEDINA PARRA','DANILOJOSE@OUTLOOK.COM','+584265784848','01/01/1957',1,'2017-10-31 14:35:07'),(11,'V-12783944','DOROTEA JOSEFINA','MUJICA MIJARES','DOROTEAJOSEFINA@GMAIL.COM','+584637773838','19/01/1920',1,'2017-10-31 14:34:19'),(12,'V-17834993','MONICA MARIA','SUAREZ COLMENAREZ','MONICAMARIA@GMAIL.COM','+584123838383','12/12/1991',1,'2017-10-31 14:34:58'),(13,'V-12884894','JUAN JOSE','MENDEZ','ABOG.JUANMENDEZ@YAHOO.ES','+584129393944','09/08/1950',1,'2017-10-31 14:35:55'),(14,'V-18943933','MILAGROS','RODRIGUEZ','MILAGROSROD@GMAIL.COM','+584148439393','12/12/1945',1,'2017-10-31 14:36:05'),(15,'V-4675893','JUANA','MUJICA','JUANAMUJICA@TSJ.COM.VE','+584128494994','15/01/1930',1,'2017-10-31 14:36:14'),(16,'V-12849333','ZORAIDA DEL CARMEN','AQUAVIVA RODRIGUEZ','ABOG.AQUAVIDAZORAIDA@TSJ.COM.VE','+584128489440','17/12/1970',1,'2017-10-31 14:34:28'),(17,'V-18940594','DANIEL MANUEL','SUAREZ CAMACHO','MANUELCAMACHO@YAHOO.COM.VE','+584268399292','02/09/1992',1,'2017-10-31 14:36:39'),(18,'V-19844933','OMAR JOSE','PINTO JIMENEZ','OMARJOSE@GMAIL.COM','+584243209483','10/10/1992',1,'2017-10-31 14:36:49'),(19,'V-24883944','MIGUEL JOSE','EMAN PEREZ','EMANPEREZ@GMAIL.COM','+584128390454','26/12/1996',1,'2017-10-31 14:36:58'),(20,'V-12893004','JUAN MIGUEL','SUAREZ VIRGUEZ','JUANSUAREZ@TSJ.GOB.VE','+584142899354','29/01/1992',1,'2017-10-31 14:36:30'),(21,'V-12849331','MANUELA JOSEFINA','PINTO CAMACHO','MANUELJOSEFINA@GMAIL.COM','+58 412 738 83 04','12/12/1945',1,'2017-10-21 15:37:17'),(22,'V-12384954','KATIUSKA','JUAREZ','KATYJUAREZ@TSJ.COM.VE','+584128384943','08/07/1970',1,'2017-10-31 14:34:09'),(23,'V-8903944','FAUSTINA','CAMACHO BUSTILLO','LIC.BUSTILLOFAUSTINA@TSJ.GOB.VE','+58 426 838 30 40','09/08/1950',1,'2017-10-21 15:42:52'),(24,'V-17383922','JOHAN MIGUEL','CHAVEZ RODRIGUEZ','JOHANCHAVEZ@TSJ.COM.VE','+584124849399','12/12/1968',1,'2017-10-31 14:39:00'),(25,'V-18344034','MANUEL','COLMENAREZ','MANUELCOLMENAREZ@HOTMAIL.COM','+584149384844','12/10/1992',1,'2017-10-31 14:39:14'),(26,'V-14859333','JUAN ESTEBAN','MOAD AHMAD','JUANESTEBAN@GMAIL.COM','+584128383833','13/08/1960',1,'2017-10-31 14:38:32'),(27,'V-12893944','JUAN MANUEL','PEREZ SUAREZ','PEREZJUAN@GMAIL.COM','+584148585893','12/10/1967',1,'2017-10-31 14:34:37'),(28,'V-12849844','MANUEL','PEREZ SUAREZ','MANUELPEREZ1@GMAIL.COM','+584269409334','17/12/1938',1,'2017-10-31 14:37:15'),(29,'V-12849847','WILKENSON DANIEL','CAMACHO CUICAS','WILKEON@HOTMAIL.COM','+584269330930','18/10/1995',1,'2017-10-31 14:37:30'),(30,'V-12849344','JORGE MIGUEL','HUACK CAMACHO','GEORGEHUACK@YAHOO.COM.VE','+584246328343','11/10/1992',1,'2017-10-31 14:38:05'),(31,'V-23485533','BRAYAN','COLMENAREZ','ELBRAYITA@GMAIL.COM','+584262563993','12/12/1992',1,'2017-10-31 14:37:39'),(32,'V-12938443','MARIA JOSE','MOACK SANCHEZ','MARIAJOSE@GMAIL.COM','+584267383944','12/12/1997',1,'2017-10-31 14:34:46'),(33,'V-19355522','MIGUEL','ALVES','MIGUEL_ALVES_89@HOTMAIL.COM','+584262525009','20/10/1899',1,'2017-11-07 15:09:33');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_persona` AFTER INSERT ON `persona` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "PERSONA",
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_persona` AFTER UPDATE ON `persona` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "PERSONA", 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_persona` AFTER DELETE ON `persona` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "ELIMINAR", 
               "PERSONA", 
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_tipo`
--

LOCK TABLES `persona_tipo` WRITE;
/*!40000 ALTER TABLE `persona_tipo` DISABLE KEYS */;
INSERT INTO `persona_tipo` VALUES (1,'V-21301059',9),(2,'V-21301061',9),(3,'V-29355522',9),(4,'V-21301062',9),(5,'V-20894394',1),(6,'V-20193932',1),(7,'V-12783944',1),(8,'V-17834993',1),(9,'V-12884894',5),(10,'V-18943933',5),(11,'V-4675893',5),(12,'V-12849333',5),(13,'V-18940594',3),(14,'V-19844933',3),(15,'V-24883944',3),(16,'V-12893004',3),(17,'V-12849331',2),(18,'V-12384954',2),(19,'V-8903944',2),(20,'V-17383922',8),(21,'V-18344034',8),(22,'V-14859333',8),(23,'V-12893944',6),(24,'V-12849844',6),(25,'V-12849847',4),(26,'V-12849344',7),(27,'V-23485533',4),(28,'V-12938443',6),(29,'V-29355522',1),(31,'V-29355522',8),(32,'V-21301062',8),(33,'V-21301062',1),(34,'V-12384954',1),(35,'V-12893944',1),(36,'V-12849333',1),(37,'V-12938443',1),(38,'V-19355522',9);
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
INSERT INTO `sala` VALUES (1,'SALA 1','#e82c2c',1,'2017-10-01 18:50:04'),(2,'SALA 2','#06147f',1,'2017-10-01 18:50:36'),(3,'SALA 3','#ffee00',1,'2017-10-01 18:50:53'),(4,'SALA 4','#008e21',1,'2017-10-01 18:51:10'),(5,'SALA 5','#00797f',1,'2017-10-01 18:51:29'),(6,'SALA 6','#0053ff',1,'2017-10-21 14:42:39');
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
-- Table structure for table `testigo`
--

DROP TABLE IF EXISTS `testigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testigo`
--

LOCK TABLES `testigo` WRITE;
/*!40000 ALTER TABLE `testigo` DISABLE KEYS */;
INSERT INTO `testigo` VALUES (2,'V-12849344'),(1,'V-21301059');
/*!40000 ALTER TABLE `testigo` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar` AFTER INSERT ON `tipo_de_tribunal` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "TIPO DE TRIBUNAL",
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar` AFTER UPDATE ON `tipo_de_tribunal` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "TIPO DE TRIBUNAL", 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar` AFTER DELETE ON `tipo_de_tribunal` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "ELIMINAR", 
               "TIPO DE TRIBUNAL", 
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
INSERT INTO `tipo_persona` VALUES (1,'DEFENSOR',1,'2017-07-12 02:25:03'),(3,'ALGUACIL',1,'2017-07-12 02:25:08'),(4,'IMPUTADO',1,'2017-07-12 02:25:10'),(5,'JUEZ',1,'2017-07-12 02:25:13'),(6,'VICTIMA',1,'2017-07-12 02:25:16'),(7,'TESTIGO',1,'2017-07-12 02:25:19'),(8,'FISCAL',1,'2017-07-12 02:25:21'),(9,'USUARIO',1,'2017-07-12 02:24:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tribunal`
--

LOCK TABLES `tribunal` WRITE;
/*!40000 ALTER TABLE `tribunal` DISABLE KEYS */;
INSERT INTO `tribunal` VALUES (1,'TRIBUNAL 1',1,0,'2017-07-27 02:55:24'),(3,'TRIBUNAL 2',1,0,'2017-09-30 16:47:13'),(4,'TRIBUNAL 3',1,0,'2017-09-30 16:54:12'),(6,'TRIBUNAL 2',2,0,'2017-09-30 16:55:57'),(7,'TRIBUNAL 1',2,0,'2017-09-30 16:56:34'),(8,'TRIBUNAL 3',2,0,'2017-09-30 16:56:17'),(10,'TRIBUNAL 2',3,0,'2017-09-30 16:57:06'),(11,'TRIBUNAL 3',3,0,'2017-09-30 16:57:23');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_tribunal` AFTER INSERT ON `tribunal` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "INSERTAR", 
               "TRIBUNAL",
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_tribunal` AFTER UPDATE ON `tribunal` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "MODIFICAR", 
               "TRIBUNAL", 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_tribunal` AFTER DELETE ON `tribunal` FOR EACH ROW BEGIN
           INSERT INTO bitacora(
               operacion, 
               tabla, 
               accion,
               usuario, 
               registro_anterior, 
               registro_nuevo
           ) VALUES(
               
               "ELIMINAR", 
               "TRIBUNAL", 
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd','IMG_094B77B74D184F04DF365AC18A3C5E0B.jpg','ADMINISTRADOR',0,'2017-10-28 14:16:39'),(3,'V-21301061','459f8140b2d1fb5df5af039c301f09d4cb88b7a1','icon-user.png','USUARIO ESPECIAL',NULL,'2017-10-22 20:39:46'),(4,'V-29355522','8c886f47c17317dd6809341353e1a1eb64288c1b','icon-user.png','USUARIO COMUN',NULL,'2017-10-21 14:41:02'),(5,'V-21301062','bf0c261aac38cbdc59337cd40f0201a07dc8ac8d','icon-user.png','SECRETARIA',NULL,'2017-10-23 23:23:59'),(6,'V-19355522','cd384cb025c665f7ff97c16478b3ea9b4b456c58','icon-user.png','SECRETARIA',NULL,'2017-11-07 15:10:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victima`
--

LOCK TABLES `victima` WRITE;
/*!40000 ALTER TABLE `victima` DISABLE KEYS */;
INSERT INTO `victima` VALUES (4,'V-12849844'),(3,'V-12893944'),(5,'V-12938443'),(2,'V-21301059');
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
  `TIPO_DE_TRIBUNAL` tinyint NOT NULL,
  `ACTO` tinyint NOT NULL,
  `HORA` tinyint NOT NULL,
  `OBSERVACION` tinyint NOT NULL,
  `SALA` tinyint NOT NULL,
  `FISCAL` tinyint NOT NULL,
  `ALGUACIL` tinyint NOT NULL,
  `DEFENSOR` tinyint NOT NULL
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
-- Temporary table structure for view `vista_estadistica`
--

DROP TABLE IF EXISTS `vista_estadistica`;
/*!50001 DROP VIEW IF EXISTS `vista_estadistica`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_estadistica` (
  `ID` tinyint NOT NULL,
  `CAUSA` tinyint NOT NULL,
  `ESTATUS` tinyint NOT NULL,
  `IMPUTADO` tinyint NOT NULL,
  `TRIBUNAL` tinyint NOT NULL,
  `TIPO_DE_TRIBUNAL` tinyint NOT NULL,
  `ACTO` tinyint NOT NULL,
  `FECHA` tinyint NOT NULL,
  `HORA_INICIO` tinyint NOT NULL,
  `HORA_FIN` tinyint NOT NULL,
  `OBSERVACION` tinyint NOT NULL,
  `SALA` tinyint NOT NULL,
  `FISCAL` tinyint NOT NULL,
  `ALGUACIL` tinyint NOT NULL,
  `DEFENSOR` tinyint NOT NULL,
  `VICTIMA` tinyint NOT NULL
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
  `numero` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `tribunal` tinyint NOT NULL
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
  `tipo_persona` tinyint NOT NULL
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
-- Temporary table structure for view `vista_notificaciones`
--

DROP TABLE IF EXISTS `vista_notificaciones`;
/*!50001 DROP VIEW IF EXISTS `vista_notificaciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_notificaciones` (
  `id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `icon` tinyint NOT NULL,
  `body` tinyint NOT NULL,
  `user` tinyint NOT NULL,
  `rol` tinyint NOT NULL,
  `emisor` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `time` tinyint NOT NULL,
  `id_notificaciones_usuario` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `status` tinyint NOT NULL
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
/*!50001 VIEW `vista_acto` AS select `acto`.`id` AS `ID`,`acto`.`numero_caso` AS `CAUSA`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `IMPUTADO`,`tribunal`.`numero` AS `TRIBUNAL`,(select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`)) AS `TIPO_DE_TRIBUNAL`,`actividad`.`actividad` AS `ACTO`,`acto`.`inicio` AS `HORA`,`acto`.`descripcion` AS `OBSERVACION`,`sala`.`descripcion` AS `SALA`,`fiscal`.`numero` AS `FISCAL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_alguacil`.`cedula`)) AS `ALGUACIL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_defensor`.`cedula`)) AS `DEFENSOR` from (((((((((`acto` join `caso_imputado` on((`acto`.`numero_caso` = `caso_imputado`.`numero_caso`))) join `persona` on((`caso_imputado`.`cedula` = `persona`.`cedula`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `actividad` on((`actividad`.`id` = `acto`.`id_actividad`))) join `sala` on((`sala`.`id` = `acto`.`id_sala`))) join `caso_fiscal` on((`caso_fiscal`.`numero_caso` = `acto`.`numero_caso`))) join `fiscal` on((`caso_fiscal`.`cedula` = `fiscal`.`cedula`))) join `caso_alguacil` on((`caso_alguacil`.`numero_caso` = `acto`.`numero_caso`))) join `caso_defensor` on((`caso_defensor`.`numero_caso` = `acto`.`numero_caso`))) order by (select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`)) */;
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
-- Final view structure for view `vista_estadistica`
--

/*!50001 DROP TABLE IF EXISTS `vista_estadistica`*/;
/*!50001 DROP VIEW IF EXISTS `vista_estadistica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estadistica` AS select `acto`.`id` AS `ID`,`acto`.`numero_caso` AS `CAUSA`,`acto`.`estatus` AS `ESTATUS`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `IMPUTADO`,`tribunal`.`numero` AS `TRIBUNAL`,(select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`)) AS `TIPO_DE_TRIBUNAL`,`actividad`.`actividad` AS `ACTO`,cast(`acto`.`inicio` as date) AS `FECHA`,date_format(`acto`.`inicio`,'%H:%I') AS `HORA_INICIO`,date_format(`acto`.`fin`,'%H:%I') AS `HORA_FIN`,`acto`.`descripcion` AS `OBSERVACION`,`sala`.`descripcion` AS `SALA`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_fiscal`.`cedula`)) AS `FISCAL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_alguacil`.`cedula`)) AS `ALGUACIL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_defensor`.`cedula`)) AS `DEFENSOR`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_victima`.`cedula`)) AS `VICTIMA` from ((((((((((`acto` join `caso_imputado` on((`acto`.`numero_caso` = `caso_imputado`.`numero_caso`))) join `persona` on((`caso_imputado`.`cedula` = `persona`.`cedula`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `actividad` on((`actividad`.`id` = `acto`.`id_actividad`))) join `sala` on((`sala`.`id` = `acto`.`id_sala`))) join `caso_fiscal` on((`caso_fiscal`.`numero_caso` = `acto`.`numero_caso`))) join `fiscal` on((`caso_fiscal`.`cedula` = `fiscal`.`cedula`))) join `caso_alguacil` on((`caso_alguacil`.`numero_caso` = `acto`.`numero_caso`))) join `caso_defensor` on((`caso_defensor`.`numero_caso` = `acto`.`numero_caso`))) join `caso_victima` on((`caso_victima`.`numero_caso` = `acto`.`numero_caso`))) order by (select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`)) */;
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
/*!50001 VIEW `vista_fiscal` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona`,`fiscal`.`numero` AS `numero`,`fiscal`.`tipo` AS `tipo`,`tribunal`.`numero` AS `tribunal` from (((`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) join `fiscal` on((`persona`.`cedula` = `fiscal`.`cedula`))) join `tribunal` on((`fiscal`.`id_tribunal` = `tribunal`.`id`))) where (`persona_tipo`.`tipo_persona` = 8) */;
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
/*!50001 VIEW `vista_imputado` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona` from ((`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) join `imputado` on((`persona`.`cedula` = `imputado`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 4) */;
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
-- Final view structure for view `vista_notificaciones`
--

/*!50001 DROP TABLE IF EXISTS `vista_notificaciones`*/;
/*!50001 DROP VIEW IF EXISTS `vista_notificaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_notificaciones` AS select `n`.`id` AS `id`,`n`.`title` AS `title`,`n`.`icon` AS `icon`,`n`.`body` AS `body`,`n`.`user` AS `user`,`n`.`rol` AS `rol`,`n`.`emisor` AS `emisor`,`n`.`tipo` AS `tipo`,`n`.`time` AS `time`,`u`.`id` AS `id_notificaciones_usuario`,`u`.`cedula` AS `cedula`,`u`.`status` AS `status` from (`notificaciones` `n` join `notificaciones_usuario` `u` on((`n`.`id` = `u`.`id_notificacion`))) */;
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

-- Dump completed on 2017-11-07 15:33:52
