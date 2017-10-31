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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-10-26T08:00:00','2017-10-26T16:00:00','EXP-001: JUICIO DE PRESENTACION','EXP-001',1,3,1,'FINALIZADO',1,'2017-10-27 00:58:00'),(2,'2017-10-27T08:00:00','2017-10-27T16:00:00','EXP-003: JUICIO DE SALIDA','EXP-003',2,4,1,'FINALIZADO',1,'2017-10-28 00:58:43'),(4,'2017-10-27T09:00:00','2017-10-27T15:30:00','ACTO','EXP-001',2,3,3,'FINALIZADO',1,'2017-10-28 00:58:43'),(5,'2017-10-28T09:00:00','2017-10-28T15:30:00','DESCRIPCION','EXP-001',1,2,3,'ASIGNADO',1,'2017-10-28 00:59:34'),(6,'2017-10-28T08:30:00','2017-10-28T15:30:00','DESCRIPCION','EXP-002',4,3,7,'ASIGNADO',1,'2017-10-28 00:59:54'),(7,'2017-10-28T08:30:00','2017-10-28T16:00:00','DESCRIPCION','EXP-003',5,4,6,'ASIGNADO',1,'2017-10-28 01:00:18'),(8,'2017-10-30T08:30:00','2017-10-30T17:30:00','HOLA','EXP-001',2,2,1,'ASIGNADO',1,'2017-10-30 14:24:48'),(9,'2017-10-30T08:30:00','2017-10-30T15:30:00','JUICIO DE ENTRADA','EXP-002',2,4,1,'ASIGNADO',1,'2017-10-30 14:30:25'),(10,'2017-10-30T09:00:00','2017-10-30T11:00:00','DESCRIPCION','EXP-003',1,1,1,'FINALIZADO',1,'2017-10-30 15:09:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,0,'INSERTAR','2017-10-26 22:05:38','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-001',NULL,'{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}'),(2,0,'INSERTAR','2017-10-26 22:06:53','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-002',NULL,'{id : 2,numero : \"EXP-002\",descripcion : \"ASESINATO\"}'),(3,0,'INSERTAR','2017-10-26 22:08:54','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-003',NULL,'{id : 3,numero : \"EXP-003\",descripcion : \"HOLA MUNDO\"}'),(4,1,'INSERTAR','2017-10-26 22:10:42','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 1,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 2,id_tribunal : 1}'),(5,1,'INSERTAR','2017-10-26 22:11:32','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 3,id_tribunal : 1}'),(6,1,'INSERTAR','2017-10-26 22:11:57','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 4,id_tribunal : 1}'),(7,1,'MODIFICAR','2017-10-26 22:12:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ESPERA','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 3,id_tribunal : 1}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 1,id_tribunal : 1}'),(8,1,'MODIFICAR','2017-10-26 22:16:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T10:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T10:00:00\",fin : \"2017-10-27T12:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 3,id_tribunal : 1}'),(9,1,'MODIFICAR','2017-10-26 22:16:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ESPERA','{id : 2,inicio : \"2017-10-27T10:00:00\",fin : \"2017-10-27T12:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 3,id_tribunal : 1}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 1,id_tribunal : 1}'),(10,1,'MODIFICAR','2017-10-26 22:17:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 4,id_tribunal : 1}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}'),(11,1,'MODIFICAR','2017-10-26 22:18:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:30:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T11:30:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}'),(12,1,'MODIFICAR','2017-10-26 22:18:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T11:30:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}'),(13,1,'MODIFICAR','2017-10-26 22:19:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}'),(14,1,'MODIFICAR','2017-10-26 22:19:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(15,1,'MODIFICAR','2017-10-26 22:20:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 4,id_tribunal : 1}'),(16,1,'MODIFICAR','2017-10-26 22:20:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES PRESENTACION DE CASO Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 4,id_tribunal : 1}'),(17,1,'MODIFICAR','2017-10-26 22:20:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"PRESENTACION DE CASO\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(18,1,'MODIFICAR','2017-10-26 22:20:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(19,1,'MODIFICAR','2017-10-26 22:23:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES ESPERA','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(20,1,'MODIFICAR','2017-10-26 22:24:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(21,1,'MODIFICAR','2017-10-26 22:24:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(22,1,'MODIFICAR','2017-10-26 22:24:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(23,1,'MODIFICAR','2017-10-26 22:26:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(24,1,'ELIMINAR','2017-10-26 22:26:59','ACTO','','{id : 3,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}',NULL),(25,0,'INSERTAR','2017-10-26 22:34:13','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-004',NULL,'{id : 4,numero : \"EXP-004\",descripcion : \"DEXCRIPCION\"}'),(26,1,'MODIFICAR','2017-10-26 22:41:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DE ACTO Y SU ESTATUS ES ESPERA','{id : 1,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T18:00:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}'),(27,1,'MODIFICAR','2017-10-26 22:41:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(28,1,'MODIFICAR','2017-10-26 22:41:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T10:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(29,1,'MODIFICAR','2017-10-26 22:42:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DE ACTO Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}'),(30,1,'MODIFICAR','2017-10-26 22:42:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"PRIMERA PRESENTACION DE ACTO\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(31,1,'MODIFICAR','2017-10-26 22:42:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(32,1,'MODIFICAR','2017-10-26 23:28:21','PERSONA','SE HA CAMBIADO EL REGISTRO DE UNA PERSONA CUYO NUMERO DE CEDULA ES V-29355522 Y NOMBRE ES MIGUEL ALVES','{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+58 377 373 73 37\"fecha_de_nacimiento : \"18/08/1980\"}','{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+58 377 373 73 37\"fecha_de_nacimiento : \"18/08/1980\"}'),(33,1,'MODIFICAR','2017-10-27 00:57:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-26T08:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(34,1,'MODIFICAR','2017-10-27 00:57:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-26T08:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-26T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(35,1,'MODIFICAR','2017-10-27 00:58:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-26T08:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-26T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-26T08:00:00\",fin : \"2017-10-26T16:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(36,1,'INSERTAR','2017-10-27 01:22:26','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T09:00:00 CUYA DESCRIPCION ES ACTO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 4,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T15:30:00\",descripcion : \"ACTO\",id_sala : 3,id_tribunal : 3}'),(37,1,'MODIFICAR','2017-10-27 02:00:35','CASO','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-001','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}','{id : 1,numero : \"EXP-001\",descripcion : \"ROBO A MANO ARMADA\"}'),(38,1,'MODIFICAR','2017-10-28 00:58:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}','{id : 2,inicio : \"2017-10-27T08:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-003: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(39,1,'MODIFICAR','2017-10-28 00:58:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:00:00 CUYA DESCRIPCION ES ACTO Y SU ESTATUS ES FINALIZADO','{id : 4,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T15:30:00\",descripcion : \"ACTO\",id_sala : 3,id_tribunal : 3}','{id : 4,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T15:30:00\",descripcion : \"ACTO\",id_sala : 3,id_tribunal : 3}'),(40,1,'INSERTAR','2017-10-28 00:59:34','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(41,1,'INSERTAR','2017-10-28 00:59:54','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(42,1,'INSERTAR','2017-10-28 01:00:18','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(43,1,'MODIFICAR','2017-10-28 14:06:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(44,1,'MODIFICAR','2017-10-28 14:06:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(45,1,'MODIFICAR','2017-10-28 14:06:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(46,1,'MODIFICAR','2017-10-28 14:06:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(47,1,'MODIFICAR','2017-10-28 14:06:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(48,1,'MODIFICAR','2017-10-28 14:06:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(49,1,'MODIFICAR','2017-10-28 14:08:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(50,1,'MODIFICAR','2017-10-28 14:08:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(51,1,'MODIFICAR','2017-10-28 14:08:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(52,1,'MODIFICAR','2017-10-28 14:08:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(53,1,'MODIFICAR','2017-10-28 14:08:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(54,1,'MODIFICAR','2017-10-28 14:08:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(55,1,'MODIFICAR','2017-10-28 14:08:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(56,1,'MODIFICAR','2017-10-28 14:08:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(57,1,'MODIFICAR','2017-10-28 14:08:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(58,1,'MODIFICAR','2017-10-28 14:08:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(59,1,'MODIFICAR','2017-10-28 14:08:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(60,1,'MODIFICAR','2017-10-28 14:08:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(61,1,'INSERTAR','2017-10-28 14:09:12','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-29T10:00:00 CUYA DESCRIPCION ES ACTO 1 Y SU ESTATUS ES ASIGNADO',NULL,'{id : 8,inicio : \"2017-10-29T10:00:00\",fin : \"2017-10-29T13:00:00\",descripcion : \"ACTO 1\",id_sala : 3,id_tribunal : 1}'),(62,1,'MODIFICAR','2017-10-28 14:09:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(63,1,'MODIFICAR','2017-10-28 14:09:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(64,1,'MODIFICAR','2017-10-28 14:09:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(65,1,'MODIFICAR','2017-10-28 14:09:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES ACTO 1 Y SU ESTATUS ES ESPERA','{id : 8,inicio : \"2017-10-29T10:00:00\",fin : \"2017-10-29T13:00:00\",descripcion : \"ACTO 1\",id_sala : 3,id_tribunal : 1}','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ACTO 1\",id_sala : 1,id_tribunal : 1}'),(66,1,'MODIFICAR','2017-10-28 14:09:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-29T09:00:00 CUYA DESCRIPCION ES ACTO 1 Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ACTO 1\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-10-29T09:00:00\",fin : \"2017-10-29T11:00:00\",descripcion : \"ACTO 1\",id_sala : 4,id_tribunal : 1}'),(67,1,'MODIFICAR','2017-10-28 14:09:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-29T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-29T09:00:00\",fin : \"2017-10-29T11:00:00\",descripcion : \"ACTO 1\",id_sala : 4,id_tribunal : 1}','{id : 8,inicio : \"2017-10-29T09:00:00\",fin : \"2017-10-29T17:30:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(68,1,'ELIMINAR','2017-10-28 14:09:38','ACTO','','{id : 8,inicio : \"2017-10-29T09:00:00\",fin : \"2017-10-29T17:30:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}',NULL),(69,1,'MODIFICAR','2017-10-28 14:09:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(70,1,'MODIFICAR','2017-10-28 14:09:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(71,1,'MODIFICAR','2017-10-28 14:09:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(72,1,'MODIFICAR','2017-10-28 14:16:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(73,1,'MODIFICAR','2017-10-28 14:16:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(74,1,'MODIFICAR','2017-10-28 14:16:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(75,1,'MODIFICAR','2017-10-28 14:16:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(76,1,'MODIFICAR','2017-10-28 14:16:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(77,1,'MODIFICAR','2017-10-28 14:16:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(78,1,'MODIFICAR','2017-10-28 14:17:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(79,1,'MODIFICAR','2017-10-28 14:17:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(80,1,'MODIFICAR','2017-10-28 14:17:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(81,1,'MODIFICAR','2017-10-28 14:17:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(82,1,'MODIFICAR','2017-10-28 14:17:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(83,1,'MODIFICAR','2017-10-28 14:17:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(84,1,'MODIFICAR','2017-10-28 14:17:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(85,1,'MODIFICAR','2017-10-28 14:17:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(86,1,'MODIFICAR','2017-10-28 14:17:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(87,1,'MODIFICAR','2017-10-28 14:17:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(88,1,'MODIFICAR','2017-10-28 14:17:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(89,1,'MODIFICAR','2017-10-28 14:17:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(90,1,'MODIFICAR','2017-10-28 17:02:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(91,1,'MODIFICAR','2017-10-28 17:02:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(92,1,'MODIFICAR','2017-10-28 17:02:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(93,1,'MODIFICAR','2017-10-28 17:13:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(94,1,'MODIFICAR','2017-10-28 17:13:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(95,1,'MODIFICAR','2017-10-28 17:13:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(96,1,'MODIFICAR','2017-10-28 17:13:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(97,1,'MODIFICAR','2017-10-28 17:13:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(98,1,'MODIFICAR','2017-10-28 17:13:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(99,1,'MODIFICAR','2017-10-28 17:23:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(100,1,'MODIFICAR','2017-10-28 17:23:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(101,1,'MODIFICAR','2017-10-28 17:23:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(102,1,'MODIFICAR','2017-10-28 17:23:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(103,1,'MODIFICAR','2017-10-28 17:23:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(104,1,'MODIFICAR','2017-10-28 17:23:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(105,1,'MODIFICAR','2017-10-28 17:23:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(106,1,'MODIFICAR','2017-10-28 17:23:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(107,1,'MODIFICAR','2017-10-28 17:23:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(108,1,'MODIFICAR','2017-10-28 17:33:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(109,1,'MODIFICAR','2017-10-28 17:33:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(110,1,'MODIFICAR','2017-10-28 17:33:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(111,1,'MODIFICAR','2017-10-28 17:50:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(112,1,'MODIFICAR','2017-10-28 17:50:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(113,1,'MODIFICAR','2017-10-28 17:50:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(114,1,'MODIFICAR','2017-10-28 17:54:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(115,1,'MODIFICAR','2017-10-28 17:54:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(116,1,'MODIFICAR','2017-10-28 17:54:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(117,1,'MODIFICAR','2017-10-28 18:36:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(118,1,'MODIFICAR','2017-10-28 18:36:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(119,1,'MODIFICAR','2017-10-28 18:36:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(120,1,'MODIFICAR','2017-10-28 18:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(121,1,'MODIFICAR','2017-10-28 18:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(122,1,'MODIFICAR','2017-10-28 18:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(123,1,'MODIFICAR','2017-10-28 18:36:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(124,1,'MODIFICAR','2017-10-28 18:36:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(125,1,'MODIFICAR','2017-10-28 18:36:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(126,1,'MODIFICAR','2017-10-28 18:37:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(127,1,'MODIFICAR','2017-10-28 18:37:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(128,1,'MODIFICAR','2017-10-28 18:37:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(129,1,'MODIFICAR','2017-10-28 18:56:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(130,1,'MODIFICAR','2017-10-28 18:56:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(131,1,'MODIFICAR','2017-10-28 18:56:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(132,1,'MODIFICAR','2017-10-28 18:56:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(133,1,'MODIFICAR','2017-10-28 18:56:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(134,1,'MODIFICAR','2017-10-28 18:56:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(135,1,'MODIFICAR','2017-10-28 18:56:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(136,1,'MODIFICAR','2017-10-28 18:56:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(137,1,'MODIFICAR','2017-10-28 18:56:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(138,1,'MODIFICAR','2017-10-28 19:00:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(139,1,'MODIFICAR','2017-10-28 19:00:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(140,1,'MODIFICAR','2017-10-28 19:00:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(141,1,'MODIFICAR','2017-10-28 19:03:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}','{id : 5,inicio : \"2017-10-28T09:00:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 3}'),(142,1,'MODIFICAR','2017-10-28 19:03:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}','{id : 6,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(143,1,'MODIFICAR','2017-10-28 19:03:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-28T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}','{id : 7,inicio : \"2017-10-28T08:30:00\",fin : \"2017-10-28T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 6}'),(144,1,'INSERTAR','2017-10-30 14:24:48','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(145,1,'MODIFICAR','2017-10-30 14:24:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(146,1,'MODIFICAR','2017-10-30 14:27:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(147,1,'MODIFICAR','2017-10-30 14:28:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(148,1,'MODIFICAR','2017-10-30 14:28:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(149,1,'MODIFICAR','2017-10-30 14:28:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(150,1,'MODIFICAR','2017-10-30 14:28:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(151,1,'MODIFICAR','2017-10-30 14:28:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(152,1,'MODIFICAR','2017-10-30 14:28:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(153,1,'MODIFICAR','2017-10-30 14:29:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(154,1,'MODIFICAR','2017-10-30 14:29:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(155,1,'MODIFICAR','2017-10-30 14:29:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(156,1,'MODIFICAR','2017-10-30 14:29:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(157,1,'INSERTAR','2017-10-30 14:30:25','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(158,1,'MODIFICAR','2017-10-30 14:30:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(159,1,'MODIFICAR','2017-10-30 14:30:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(160,1,'MODIFICAR','2017-10-30 14:30:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(161,1,'MODIFICAR','2017-10-30 14:30:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(162,1,'INSERTAR','2017-10-30 14:30:56','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ESPERA',NULL,'{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(163,1,'MODIFICAR','2017-10-30 14:30:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(164,1,'MODIFICAR','2017-10-30 14:30:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(165,1,'MODIFICAR','2017-10-30 14:31:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(166,1,'MODIFICAR','2017-10-30 14:34:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(167,1,'MODIFICAR','2017-10-30 14:34:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(168,1,'MODIFICAR','2017-10-30 14:34:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(169,1,'MODIFICAR','2017-10-30 14:34:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(170,1,'MODIFICAR','2017-10-30 14:34:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(171,1,'MODIFICAR','2017-10-30 14:34:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(172,1,'MODIFICAR','2017-10-30 14:34:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(173,1,'MODIFICAR','2017-10-30 14:34:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(174,1,'MODIFICAR','2017-10-30 14:34:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(175,1,'MODIFICAR','2017-10-30 14:36:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(176,1,'MODIFICAR','2017-10-30 14:36:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(177,1,'MODIFICAR','2017-10-30 14:36:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(178,1,'MODIFICAR','2017-10-30 14:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(179,1,'MODIFICAR','2017-10-30 14:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(180,1,'MODIFICAR','2017-10-30 14:36:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(181,1,'MODIFICAR','2017-10-30 14:50:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(182,1,'MODIFICAR','2017-10-30 14:50:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(183,1,'MODIFICAR','2017-10-30 14:50:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(184,1,'MODIFICAR','2017-10-30 14:50:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(185,1,'MODIFICAR','2017-10-30 14:50:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(186,1,'MODIFICAR','2017-10-30 14:50:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(187,1,'MODIFICAR','2017-10-30 14:52:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(188,1,'MODIFICAR','2017-10-30 14:52:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(189,1,'MODIFICAR','2017-10-30 14:52:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(190,1,'MODIFICAR','2017-10-30 14:52:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(191,1,'MODIFICAR','2017-10-30 14:52:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(192,1,'MODIFICAR','2017-10-30 14:52:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(193,1,'MODIFICAR','2017-10-30 15:09:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(194,1,'MODIFICAR','2017-10-30 15:09:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(195,1,'MODIFICAR','2017-10-30 15:09:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES FINALIZADO','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-10-30T09:00:00\",fin : \"2017-10-30T11:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(196,1,'MODIFICAR','2017-10-30 15:09:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(197,1,'MODIFICAR','2017-10-30 15:09:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(198,1,'MODIFICAR','2017-10-30 15:10:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(199,1,'MODIFICAR','2017-10-30 15:10:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(200,1,'MODIFICAR','2017-10-30 15:10:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(201,1,'MODIFICAR','2017-10-30 15:10:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(202,1,'MODIFICAR','2017-10-30 15:17:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(203,1,'MODIFICAR','2017-10-30 15:17:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(204,1,'MODIFICAR','2017-10-30 15:28:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(205,1,'MODIFICAR','2017-10-30 15:28:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(206,1,'MODIFICAR','2017-10-30 15:51:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(207,1,'MODIFICAR','2017-10-30 15:51:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(208,1,'MODIFICAR','2017-10-30 15:58:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(209,1,'MODIFICAR','2017-10-30 15:58:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(210,1,'MODIFICAR','2017-10-30 15:58:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(211,1,'MODIFICAR','2017-10-30 15:58:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(212,1,'MODIFICAR','2017-10-30 16:01:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(213,1,'MODIFICAR','2017-10-30 16:01:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(214,1,'MODIFICAR','2017-10-30 16:02:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(215,1,'MODIFICAR','2017-10-30 16:02:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(216,1,'MODIFICAR','2017-10-30 16:02:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(217,1,'MODIFICAR','2017-10-30 16:02:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(218,1,'INSERTAR','2017-10-30 16:05:41','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T17:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 3}'),(219,1,'MODIFICAR','2017-10-30 16:05:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(220,1,'MODIFICAR','2017-10-30 16:05:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(221,1,'MODIFICAR','2017-10-30 16:10:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T17:00:00\",descripcion : \"DESCRIPCION\",id_sala : 4,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 3}'),(222,1,'MODIFICAR','2017-10-30 16:13:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 3}'),(223,1,'MODIFICAR','2017-10-30 16:13:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 3}'),(224,1,'MODIFICAR','2017-10-30 16:13:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T13:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T13:00:00\",fin : \"2017-10-31T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(225,1,'MODIFICAR','2017-10-30 16:13:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T09:30:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"2017-10-31T13:00:00\",fin : \"2017-10-31T16:30:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 3}'),(226,1,'MODIFICAR','2017-10-30 16:21:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ESPERA','{id : 11,inicio : \"2017-10-31T09:30:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 3}','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 3}'),(227,1,'MODIFICAR','2017-10-30 16:22:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-31T11:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 3}','{id : 11,inicio : \"2017-10-31T11:00:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 3}'),(228,1,'ELIMINAR','2017-10-30 16:22:57','ACTO','','{id : 11,inicio : \"2017-10-31T11:00:00\",fin : \"2017-10-31T13:00:00\",descripcion : \"EXP-001: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 3}',NULL),(229,1,'MODIFICAR','2017-10-30 16:25:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(230,1,'MODIFICAR','2017-10-30 16:25:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(231,1,'MODIFICAR','2017-10-30 16:25:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(232,1,'MODIFICAR','2017-10-30 16:25:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(233,1,'MODIFICAR','2017-10-30 16:25:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(234,1,'MODIFICAR','2017-10-30 16:25:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(235,1,'MODIFICAR','2017-10-30 16:44:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(236,1,'MODIFICAR','2017-10-30 16:44:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}'),(237,1,'MODIFICAR','2017-10-30 16:55:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T17:30:00\",descripcion : \"HOLA\",id_sala : 2,id_tribunal : 1}'),(238,1,'MODIFICAR','2017-10-30 16:55:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-30T08:30:00 CUYA DESCRIPCION ES JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}','{id : 9,inicio : \"2017-10-30T08:30:00\",fin : \"2017-10-30T15:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 4,id_tribunal : 1}');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
INSERT INTO `caso` VALUES (1,'EXP-001','ROBO A MANO ARMADA',1,'2017-10-26 22:05:38'),(2,'EXP-002','ASESINATO',0,'2017-10-26 22:06:53'),(3,'EXP-003','HOLA MUNDO',0,'2017-10-26 22:08:54'),(4,'EXP-004','DEXCRIPCION',0,'2017-10-26 22:34:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_alguacil`
--

LOCK TABLES `caso_alguacil` WRITE;
/*!40000 ALTER TABLE `caso_alguacil` DISABLE KEYS */;
INSERT INTO `caso_alguacil` VALUES (2,'EXP-003','V-19844933',3,'ALGUACIL'),(3,'EXP-001','V-19844933',3,'ALGUACIL');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_defensor`
--

LOCK TABLES `caso_defensor` WRITE;
/*!40000 ALTER TABLE `caso_defensor` DISABLE KEYS */;
INSERT INTO `caso_defensor` VALUES (1,'EXP-003','V-20193932',1,'DEFENSOR'),(2,'EXP-004','V-20894394',1,'DEFENSOR'),(3,'EXP-001','V-20894394',1,'DEFENSOR');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_fiscal`
--

LOCK TABLES `caso_fiscal` WRITE;
/*!40000 ALTER TABLE `caso_fiscal` DISABLE KEYS */;
INSERT INTO `caso_fiscal` VALUES (1,'EXP-003','V-17383922',8,'FISCAL'),(2,'EXP-001','V-14859333',8,'FISCAL');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_imputado`
--

LOCK TABLES `caso_imputado` WRITE;
/*!40000 ALTER TABLE `caso_imputado` DISABLE KEYS */;
INSERT INTO `caso_imputado` VALUES (2,'EXP-002','V-23485533',4,'IMPUTADO'),(3,'EXP-003','V-23485533',4,'IMPUTADO'),(4,'EXP-004','V-23485533',4,'IMPUTADO'),(5,'EXP-001','V-12849847',4,'IMPUTADO');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_victima`
--

LOCK TABLES `caso_victima` WRITE;
/*!40000 ALTER TABLE `caso_victima` DISABLE KEYS */;
INSERT INTO `caso_victima` VALUES (2,'EXP-002','V-12938443',6,'VICTIMA'),(3,'EXP-003','V-12849844',6,'VICTIMA'),(4,'EXP-003','V-12938443',6,'VICTIMA'),(5,'EXP-004','V-12849844',6,'VICTIMA'),(6,'EXP-001','V-12893944',6,'VICTIMA');
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
INSERT INTO `config_notificaciones` VALUES (1,'../message_server/sms/api/outbox','../message_server/sms/schedule','../message_server/mail/api','smtp.gmail.com',465,'dem.sanfelipe@gmail.com','qwertyuiop1234567890','192.168.1.8',9300);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor`
--

LOCK TABLES `defensor` WRITE;
/*!40000 ALTER TABLE `defensor` DISABLE KEYS */;
INSERT INTO `defensor` VALUES (1,'V-21301059','PUBLICO','8298208'),(2,'V-20894394','PRIVADO','883488493'),(3,'V-20193932','PUBLICO','488484848'),(4,'V-12783944','PUBLICO','378337732'),(5,'V-17834993','PRIVADO','38388448'),(6,'V-29355522','PUBLICO','890099');
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
INSERT INTO `fiscal` VALUES (3,'V-21301060',7,'',0),(5,'V-21301059',9,'',0),(6,'V-17383922',11,'PRINCIPAL',1),(7,'V-18344034',1,'SUPLENTE',1),(8,'V-14859333',2,'PRINCIPAL',1),(9,'V-29355522',8888,'PRINCIPAL',3),(10,'V-21301062',909,'SUPLENTE',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'Hola','3.png','Hola Juan','V-21301061','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 12:28:53',1),(2,'MILDRED DE JESUS VARGAS JUAREZ HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO MILDRED DE JESUS VARGAS JUAREZ CUYA CEDULA DE IDENTIDAD ES V-21301062 HA FINALIZADO EL ACTO NUMERO 13 DE LA CAUSA EXP-001 DE FECHA 26/10/2017','','ADMINISTRADOR','MILDRED DE JESUS VARGAS JUAREZ','','notificacion','2017-10-26 19:27:18',0),(3,'MILDRED DE JESUS VARGAS JUAREZ HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO MILDRED DE JESUS VARGAS JUAREZ CUYA CEDULA DE IDENTIDAD ES V-21301062 HA DIFERIDO EL ACTO NUMERO 16 DE LA CAUSA EXP-002 DE FECHA 26/10/2017','','ADMINISTRADOR','MILDRED DE JESUS VARGAS JUAREZ','','notificacion','2017-10-26 19:36:13',0),(4,'Hola','4.png','Hola, como estas>?','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 19:53:48',0),(5,'HOLA','4.png','HOLa','','','ANTHONY JOSE MEDINA FUENTES','192.168.43.216','notificacion','2017-10-26 20:01:09',1),(6,'Hola a todos','4.png','Buenos dias, recuerdenrevisar eso','','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 20:54:17',1),(7,'Hola JHuan','3.png','Hola','V-21301061','','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 20:54:51',1),(8,'Mensajepara todos los usuarios espaciales','5.png','que tal','','USUARIO ESPECIAL','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 20:55:27',1),(9,'este mensaje me debe llegar','5.png','si','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','','notificacion','2017-10-26 21:00:40',0),(10,'hola','4.png','hola','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 21:00:49',1),(11,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO REGISTROS EN LA TABLA DE IMPUTADO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO REGISTROS EN LA TABLA DE IMPUTADO, POR FAVOR, VERIFIQUE ESTA INFORMACION EN LA BITACORA DEL SISTEMA PARA VER MAS DETALLES','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 21:22:42',0),(12,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 2 DE LA CAUSA EXP-003 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:13:09',0),(13,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 2 DE LA CAUSA EXP-003 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:16:44',0),(14,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:17:39',1),(15,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:18:44',0),(16,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA NaN/NaN/NaN EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:20:26',0),(17,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 2 DE LA CAUSA EXP-003 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:23:15',0),(18,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:24:50',0),(19,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 3 DE LA CAUSA EXP-002 DE FECHA 27/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:27:08',0),(20,'Hola, buenos dias','4.png','Este mensaje es para recodarles que tienen que asistir','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:29:04',1),(21,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 1 DE LA CAUSA EXP-001 EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-26 22:41:36',1),(22,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 8 DE LA CAUSA EXP-001 EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:09:25',1),(23,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 8 DE LA CAUSA EXP-001 DE FECHA 29/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:09:38',1),(24,'nuevo mensaje','4.png','mensaje','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:10:13',1),(25,'Asuntodel mensaje','3.png','mensaje','V-21301059','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:16:09',0),(26,'hola','5.png','ha','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-28 14:16:13',0),(27,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 11 DE LA CAUSA EXP-001 EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.4','notificacion','2017-10-30 16:21:00',1),(28,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 11 DE LA CAUSA EXP-001 DE FECHA 31/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.4','notificacion','2017-10-30 16:22:57',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones_usuario`
--

LOCK TABLES `notificaciones_usuario` WRITE;
/*!40000 ALTER TABLE `notificaciones_usuario` DISABLE KEYS */;
INSERT INTO `notificaciones_usuario` VALUES (1,1,'V-21301061',0),(5,4,'V-21301061',0),(6,4,'V-29355522',1),(7,4,'V-21301062',1),(9,5,'V-21301061',0),(10,5,'V-29355522',1),(11,5,'V-21301062',1),(13,6,'V-21301061',0),(14,6,'V-29355522',1),(15,6,'V-21301062',1),(16,7,'V-21301061',0),(17,8,'V-21301061',0),(20,10,'V-21301061',0),(21,10,'V-29355522',1),(22,10,'V-21301062',1),(33,20,'V-21301061',0),(34,20,'V-29355522',1),(35,20,'V-21301062',1),(40,24,'V-21301061',0),(41,24,'V-29355522',1),(42,24,'V-21301062',1),(43,25,'V-21301059',0),(44,26,'V-21301059',0),(45,27,'V-21301059',1),(46,28,'V-21301059',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'V-21301059','ANTHONY JOSE','MEDINA FUENTES','ANTHONYJMEDINAF@GMAIL.COM','+584263575489','20/10/1993',0,'2017-10-01 18:48:40'),(6,'V-21301061','JUAN MANUEL','GONZALEZ PEREZ','JUANMANUELPEREZ@GMAIL.COM','+58 426 783 99 49','20/10/1992',1,'2017-10-21 14:39:48'),(7,'V-29355522','MIGUEL','ALVES','MIGUELALVES@GMAIL.COM','+58 377 373 73 37','18/08/1980',1,'2017-10-21 14:41:02'),(8,'V-21301062','MILDRED DE JESUS','VARGAS JUAREZ','MIL.1DRED@GMAIL.COM','+58 426 784 03 44','12/12/1992',1,'2017-10-21 14:42:11'),(9,'V-20894394','KIMBERLY MERCEDES','PEREZ TOVAR','KIMBERLY20@GMAIL.COM','+58 416 327 38 38','10/10/1992',1,'2017-10-21 14:46:48'),(10,'V-20193932','DANILO JOSE','MEDINA PARRA','DANILOJOSE@OUTLOOK.COM','+58 426 578 48 48','01/01/1957',1,'2017-10-21 14:47:50'),(11,'V-12783944','DOROTEA JOSEFINA','MUJICA MIJARES','DOROTEAJOSEFINA@GMAIL.COM','+58 463 777 38 38','19/01/1920',1,'2017-10-21 14:51:14'),(12,'V-17834993','MONICA MARIA','SUAREZ COLMENAREZ','MONICAMARIA@GMAIL.COM','+58 412 383 83 83','12/12/1991',1,'2017-10-21 14:52:02'),(13,'V-12884894','JUAN JOSE','MENDEZ','ABOG.JUANMENDEZ@YAHOO.ES','+58 412 939 39 44','09/08/1950',1,'2017-10-21 15:16:55'),(14,'V-18943933','MILAGROS','RODRIGUEZ','MILAGROSROD@GMAIL.COM','+58 414 843 93 93','12/12/1945',1,'2017-10-21 15:17:42'),(15,'V-4675893','JUANA','MUJICA','JUANAMUJICA@TSJ.COM.VE','+58 412 849 49 94','15/01/1930',1,'2017-10-21 15:25:47'),(16,'V-12849333','ZORAIDA DEL CARMEN','AQUAVIVA RODRIGUEZ','ABOG.AQUAVIDAZORAIDA@TSJ.COM.VE','+58 412 848 94 40','17/12/1970',1,'2017-10-21 15:27:27'),(17,'V-18940594','DANIEL MANUEL','SUAREZ CAMACHO','MANUELCAMACHO@YAHOO.COM.VE','+58 426 839 92 92','02/09/1992',1,'2017-10-21 15:29:22'),(18,'V-19844933','OMAR JOSE','PINTO JIMENEZ','OMARJOSE@GMAIL.COM','+58 424 320 94 83','10/10/1992',1,'2017-10-21 15:30:11'),(19,'V-24883944','MIGUEL JOSE','EMAN PEREZ','EMANPEREZ@GMAIL.COM','+58 412 839 04 54','26/12/1996',1,'2017-10-21 15:31:26'),(20,'V-12893004','JUAN MIGUEL','SUAREZ VIRGUEZ','JUANSUAREZ@TSJ.GOB.VE','+58 414 289 93 54','29/01/1992',1,'2017-10-21 15:32:57'),(21,'V-12849331','MANUELA JOSEFINA','PINTO CAMACHO','MANUELJOSEFINA@GMAIL.COM','+58 412 738 83 04','12/12/1945',1,'2017-10-21 15:37:17'),(22,'V-12384954','KATIUSKA','JUAREZ','KATYJUAREZ@TSJ.COM.VE','+58 412 838 49 43','08/07/1970',1,'2017-10-21 15:41:23'),(23,'V-8903944','FAUSTINA','CAMACHO BUSTILLO','LIC.BUSTILLOFAUSTINA@TSJ.GOB.VE','+58 426 838 30 40','09/08/1950',1,'2017-10-21 15:42:52'),(24,'V-17383922','JOHAN MIGUEL','CHAVEZ RODRIGUEZ','JOHANCHAVEZ@TSJ.COM.VE','+58 412 484 93 99','12/12/1968',1,'2017-10-21 15:47:43'),(25,'V-18344034','MANUEL','COLMENAREZ','MANUELCOLMENAREZ@HOTMAIL.COM','+58 414 938 48 44','12/10/1992',1,'2017-10-21 15:49:12'),(26,'V-14859333','JUAN ESTEBAN','MOAD AHMAD','JUANESTEBAN@GMAIL.COM','+58 412 838 38 33','13/08/1960',1,'2017-10-21 15:50:39'),(27,'V-12893944','JUAN MANUEL','PEREZ SUAREZ','PEREZJUAN@GMAIL.COM','+58 414 858 58 93','12/10/1967',1,'2017-10-21 16:12:16'),(28,'V-12849844','MANUEL','PEREZ SUAREZ','MANUELPEREZ1@GMAIL.COM','+58 426 940 93 34','17/12/1938',1,'2017-10-21 16:13:20'),(29,'V-12849847','WILKENSON DANIEL','CAMACHO CUICAS','WILKEON@HOTMAIL.COM','+58 426 933 09 30','18/10/1995',1,'2017-10-21 16:15:31'),(30,'V-12849344','JORGE MIGUEL','HUACK CAMACHO','GEORGEHUACK@YAHOO.COM.VE','+58 424 632 83 43','11/10/1992',1,'2017-10-21 16:16:59'),(31,'V-23485533','BRAYAN','COLMENAREZ','ELBRAYITA@GMAIL.COM','+58 426 256 39 93','12/12/1992',1,'2017-10-21 16:25:25'),(32,'V-12938443','MARIA JOSE','MOACK SANCHEZ','MARIAJOSE@GMAIL.COM','+58 426 738 39 44','12/12/1997',1,'2017-10-21 16:26:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_tipo`
--

LOCK TABLES `persona_tipo` WRITE;
/*!40000 ALTER TABLE `persona_tipo` DISABLE KEYS */;
INSERT INTO `persona_tipo` VALUES (1,'V-21301059',9),(2,'V-21301061',9),(3,'V-29355522',9),(4,'V-21301062',9),(5,'V-20894394',1),(6,'V-20193932',1),(7,'V-12783944',1),(8,'V-17834993',1),(9,'V-12884894',5),(10,'V-18943933',5),(11,'V-4675893',5),(12,'V-12849333',5),(13,'V-18940594',3),(14,'V-19844933',3),(15,'V-24883944',3),(16,'V-12893004',3),(17,'V-12849331',2),(18,'V-12384954',2),(19,'V-8903944',2),(20,'V-17383922',8),(21,'V-18344034',8),(22,'V-14859333',8),(23,'V-12893944',6),(24,'V-12849844',6),(25,'V-12849847',4),(26,'V-12849344',7),(27,'V-23485533',4),(28,'V-12938443',6),(29,'V-29355522',1),(31,'V-29355522',8),(32,'V-21301062',8);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd','IMG_094B77B74D184F04DF365AC18A3C5E0B.jpg','ADMINISTRADOR',0,'2017-10-28 14:16:39'),(3,'V-21301061','459f8140b2d1fb5df5af039c301f09d4cb88b7a1','icon-user.png','USUARIO ESPECIAL',NULL,'2017-10-22 20:39:46'),(4,'V-29355522','8c886f47c17317dd6809341353e1a1eb64288c1b','icon-user.png','USUARIO COMUN',NULL,'2017-10-21 14:41:02'),(5,'V-21301062','bf0c261aac38cbdc59337cd40f0201a07dc8ac8d','icon-user.png','SECRETARIA',NULL,'2017-10-23 23:23:59');
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
/*!50001 VIEW `vista_acto` AS select `acto`.`id` AS `ID`,`acto`.`numero_caso` AS `CAUSA`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `IMPUTADO`,`tribunal`.`numero` AS `TRIBUNAL`,`actividad`.`actividad` AS `ACTO`,`acto`.`inicio` AS `HORA`,`acto`.`descripcion` AS `OBSERVACION`,`sala`.`descripcion` AS `SALA`,`fiscal`.`numero` AS `FISCAL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_alguacil`.`cedula`)) AS `ALGUACIL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_defensor`.`cedula`)) AS `DEFENSOR` from (((((((((`acto` join `caso_imputado` on((`acto`.`numero_caso` = `caso_imputado`.`numero_caso`))) join `persona` on((`caso_imputado`.`cedula` = `persona`.`cedula`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `actividad` on((`actividad`.`id` = `acto`.`id_actividad`))) join `sala` on((`sala`.`id` = `acto`.`id_sala`))) join `caso_fiscal` on((`caso_fiscal`.`numero_caso` = `acto`.`numero_caso`))) join `fiscal` on((`caso_fiscal`.`cedula` = `fiscal`.`cedula`))) join `caso_alguacil` on((`caso_alguacil`.`numero_caso` = `acto`.`numero_caso`))) join `caso_defensor` on((`caso_defensor`.`numero_caso` = `acto`.`numero_caso`))) */;
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

-- Dump completed on 2017-10-30 12:55:42
