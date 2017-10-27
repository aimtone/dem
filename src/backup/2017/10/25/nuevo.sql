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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-10-21T08:30:00','2017-10-21T17:00:00','EXP-002: JUICIO DE PRESENTACION','EXP-002',1,3,1,'FINALIZADO',1,'2017-10-21 22:02:45'),(2,'2017-10-21T09:00:00','2017-10-21T16:00:00','EXP-001: JUICIO DE SALIDA','EXP-001',2,1,1,'FINALIZADO',1,'2017-10-21 21:42:25'),(3,'2017-10-22T09:00:00','2017-10-22T16:30:00','EXP-002: JUICIO DE PRESENTACION','EXP-002',1,3,3,'FINALIZADO',1,'2017-10-22 20:29:32'),(6,'2017-10-22T09:30:00','2017-10-22T13:30:00','GOLA 2','EXP-001',5,4,6,'FINALIZADO',1,'2017-10-22 18:20:53'),(8,'2017-10-23T08:30:00','2017-10-23T16:30:00','EXP-002: JUICIO DE PRESENTACION','EXP-002',4,4,7,'FINALIZADO',3,'2017-10-23 20:30:42'),(9,'2017-10-23T08:30:00','2017-10-23T17:00:00','DESCRIPCION20','EXP-001',4,5,6,'FINALIZADO',3,'2017-10-23 21:01:28'),(10,'2017-10-24T09:00:00','2017-10-24T15:00:00','DESCRIPCION','EXP-001',1,2,4,'ASIGNADO',1,'2017-10-23 23:01:15'),(11,'2017-10-24T08:30:00','2017-10-24T16:00:00','DESCRIPCION','EXP-002',4,3,7,'ASIGNADO',1,'2017-10-23 23:01:36'),(12,'0000-00-00T00:00:00','0000-00-00T00:00:00','EXP-003: JUICIO DE ENTRADA','EXP-003',3,1,1,'ESPERA',1,'2017-10-26 03:28:19'),(13,'2017-10-26T08:30:00','2017-10-26T15:30:00','DESCRIPCION','EXP-001',1,1,3,'ASIGNADO',1,'2017-10-26 00:14:47'),(16,'2017-10-26T09:00:00','2017-10-26T13:30:00','ACTO DE PRESENTACION','EXP-002',4,4,6,'ASIGNADO',1,'2017-10-26 01:04:13'),(17,'2017-10-26T09:00:00','2017-10-26T14:30:00','PRIMERA  AUDIENCIA','EXP-004',2,2,1,'ASIGNADO',1,'2017-10-26 03:06:46'),(18,'2017-10-27T09:00:00','2017-10-27T16:00:00','EXP-004: JUICIO DE PRESENTACION','EXP-004',4,2,7,'ASIGNADO',1,'2017-10-26 03:12:44'),(19,'2017-10-27T09:30:00','2017-10-27T17:30:00','EXP-004: JUICIO DE SALIDA','EXP-004',2,4,1,'ASIGNADO',1,'2017-10-26 03:18:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,1,'INSERTAR','2017-10-01 18:50:04','SALA','SE HA REGISTRADO UNA SALA COMO SALA 1',NULL,'{id : 1,descripcion : \"SALA 1\",color : \"#e82c2c\"}'),(297,1,'ELIMINAR','2017-10-21 14:35:06','SALA','SE HA ELIMINADO UNA PERSONA CUYA CEDULA FUE REGISTRADA COMO V-21301060 Y NOMBRE ES MARIANGEL JOSNELLY MEDINA GAUTIER','{id : 3,cedula : \"V-21301060\",nombres : \"MARIANGEL JOSNELLY\"apellidos : \"MEDINA GAUTIER\"email : \"MARIANGELGAUTIER@GMAIL.COM\"telefono : \"+58 426 783 99 44\"fecha_de_nacimiento : \"26/12/1993\"}',NULL),(298,1,'ELIMINAR','2017-10-21 14:35:06','SALA','SE HA ELIMINADO UNA PERSONA CUYA CEDULA FUE REGISTRADA COMO V-21301061 Y NOMBRE ES MILAGROS DEL CARMEN PEREZ SANCHEZ','{id : 4,cedula : \"V-21301061\",nombres : \"MILAGROS DEL CARMEN\"apellidos : \"PEREZ SANCHEZ\"email : \"MILAGROSPEREZ@GMAIL.COM\"telefono : \"+58 424 785 99 44\"fecha_de_nacimiento : \"20/10/1992\"}',NULL),(299,1,'ELIMINAR','2017-10-21 14:35:06','SALA','SE HA ELIMINADO UNA PERSONA CUYA CEDULA FUE REGISTRADA COMO V-25646293 Y NOMBRE ES ARCADIO AREVALO','{id : 5,cedula : \"V-25646293\",nombres : \"ARCADIO\"apellidos : \"AREVALO\"email : \"AREVALOARCADIO.96@GMAIL.COM\"telefono : \"+58 127 724 31 10\"fecha_de_nacimiento : \"15/10/1996\"}',NULL),(300,1,'INSERTAR','2017-10-21 14:39:48','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301061 Y NOMBRE ES JUAN MANUEL GONZALEZ PEREZ',NULL,'{id : 6,cedula : \"V-21301061\",nombres : \"JUAN MANUEL\"apellidos : \"GONZALEZ PEREZ\"email : \"JUANMANUELPEREZ@GMAIL.COM\"telefono : \"+58 426 783 99 49\"fecha_de_nacimiento : \"20/10/1992\"}'),(301,1,'INSERTAR','2017-10-21 14:41:02','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-29355522 Y NOMBRE ES MIGUEL ALVES',NULL,'{id : 7,cedula : \"V-29355522\",nombres : \"MIGUEL\"apellidos : \"ALVES\"email : \"MIGUELALVES@GMAIL.COM\"telefono : \"+58 377 373 73 37\"fecha_de_nacimiento : \"18/08/1980\"}'),(302,1,'INSERTAR','2017-10-21 14:42:11','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301062 Y NOMBRE ES MILDRED DE JESUS VARGAS JUAREZ',NULL,'{id : 8,cedula : \"V-21301062\",nombres : \"MILDRED DE JESUS\"apellidos : \"VARGAS JUAREZ\"email : \"MIL.1DRED@GMAIL.COM\"telefono : \"+58 426 784 03 44\"fecha_de_nacimiento : \"12/12/1992\"}'),(303,1,'MODIFICAR','2017-10-21 14:42:39','SALA','SE HA CAMBIADO NOMBRE DE SALA 62 A SALA 6','{id : 6,descripcion : \"SALA 62\",color : \"#0053ff\"}','{id : 6,descripcion : \"SALA 6\",color : \"#0053ff\"}'),(304,1,'INSERTAR','2017-10-21 14:46:48','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-20894394 Y NOMBRE ES KIMBERLY MERCEDES PEREZ TOVAR',NULL,'{id : 9,cedula : \"V-20894394\",nombres : \"KIMBERLY MERCEDES\"apellidos : \"PEREZ TOVAR\"email : \"KIMBERLY20@GMAIL.COM\"telefono : \"+58 416 327 38 38\"fecha_de_nacimiento : \"10/10/1992\"}'),(305,1,'INSERTAR','2017-10-21 14:47:50','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-20193932 Y NOMBRE ES DANILO JOSE MEDINA PARRA',NULL,'{id : 10,cedula : \"V-20193932\",nombres : \"DANILO JOSE\"apellidos : \"MEDINA PARRA\"email : \"DANILOJOSE@OUTLOOK.COM\"telefono : \"+58 426 578 48 48\"fecha_de_nacimiento : \"01/01/1957\"}'),(306,1,'INSERTAR','2017-10-21 14:51:14','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12783944 Y NOMBRE ES DOROTEA JOSEFINA MUJICA MIJARES',NULL,'{id : 11,cedula : \"V-12783944\",nombres : \"DOROTEA JOSEFINA\"apellidos : \"MUJICA MIJARES\"email : \"DOROTEAJOSEFINA@GMAIL.COM\"telefono : \"+58 463 777 38 38\"fecha_de_nacimiento : \"19/01/1920\"}'),(307,1,'INSERTAR','2017-10-21 14:52:02','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-17834993 Y NOMBRE ES MONICA MARIA SUAREZ COLMENAREZ',NULL,'{id : 12,cedula : \"V-17834993\",nombres : \"MONICA MARIA\"apellidos : \"SUAREZ COLMENAREZ\"email : \"MONICAMARIA@GMAIL.COM\"telefono : \"+58 412 383 83 83\"fecha_de_nacimiento : \"12/12/1991\"}'),(308,1,'INSERTAR','2017-10-21 15:16:55','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12884894 Y NOMBRE ES JUAN JOSE MENDEZ',NULL,'{id : 13,cedula : \"V-12884894\",nombres : \"JUAN JOSE\"apellidos : \"MENDEZ\"email : \"ABOG.JUANMENDEZ@YAHOO.ES\"telefono : \"+58 412 939 39 44\"fecha_de_nacimiento : \"09/08/1950\"}'),(309,1,'INSERTAR','2017-10-21 15:17:42','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-18943933 Y NOMBRE ES MILAGROS RODRIGUEZ',NULL,'{id : 14,cedula : \"V-18943933\",nombres : \"MILAGROS\"apellidos : \"RODRIGUEZ\"email : \"MILAGROSROD@GMAIL.COM\"telefono : \"+58 414 843 93 93\"fecha_de_nacimiento : \"12/12/1945\"}'),(310,1,'INSERTAR','2017-10-21 15:25:47','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-4675893 Y NOMBRE ES JUANA MUJICA',NULL,'{id : 15,cedula : \"V-4675893\",nombres : \"JUANA\"apellidos : \"MUJICA\"email : \"JUANAMUJICA@TSJ.COM.VE\"telefono : \"+58 412 849 49 94\"fecha_de_nacimiento : \"15/01/1930\"}'),(311,1,'INSERTAR','2017-10-21 15:27:27','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12849333 Y NOMBRE ES ZORAIDA DEL CARMEN AQUAVIVA RODRIGUEZ',NULL,'{id : 16,cedula : \"V-12849333\",nombres : \"ZORAIDA DEL CARMEN\"apellidos : \"AQUAVIVA RODRIGUEZ\"email : \"ABOG.AQUAVIDAZORAIDA@TSJ.COM.VE\"telefono : \"+58 412 848 94 40\"fecha_de_nacimiento : \"17/12/1970\"}'),(312,1,'INSERTAR','2017-10-21 15:29:22','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-18940594 Y NOMBRE ES DANIEL MANUEL SUAREZ CAMACHO',NULL,'{id : 17,cedula : \"V-18940594\",nombres : \"DANIEL MANUEL\"apellidos : \"SUAREZ CAMACHO\"email : \"MANUELCAMACHO@YAHOO.COM.VE\"telefono : \"+58 426 839 92 92\"fecha_de_nacimiento : \"02/09/1992\"}'),(313,1,'INSERTAR','2017-10-21 15:30:11','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-19844933 Y NOMBRE ES OMAR JOSE PINTO JIMENEZ',NULL,'{id : 18,cedula : \"V-19844933\",nombres : \"OMAR JOSE\"apellidos : \"PINTO JIMENEZ\"email : \"OMARJOSE@GMAIL.COM\"telefono : \"+58 424 320 94 83\"fecha_de_nacimiento : \"10/10/1992\"}'),(314,1,'INSERTAR','2017-10-21 15:31:26','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-24883944 Y NOMBRE ES MIGUEL JOSE EMAN PEREZ',NULL,'{id : 19,cedula : \"V-24883944\",nombres : \"MIGUEL JOSE\"apellidos : \"EMAN PEREZ\"email : \"EMANPEREZ@GMAIL.COM\"telefono : \"+58 412 839 04 54\"fecha_de_nacimiento : \"26/12/1996\"}'),(315,1,'INSERTAR','2017-10-21 15:32:57','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12893004 Y NOMBRE ES JUAN MIGUEL SUAREZ VIRGUEZ',NULL,'{id : 20,cedula : \"V-12893004\",nombres : \"JUAN MIGUEL\"apellidos : \"SUAREZ VIRGUEZ\"email : \"JUANSUAREZ@TSJ.GOB.VE\"telefono : \"+58 414 289 93 54\"fecha_de_nacimiento : \"29/01/1992\"}'),(316,1,'INSERTAR','2017-10-21 15:37:17','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12849331 Y NOMBRE ES MANUELA JOSEFINA PINTO CAMACHO',NULL,'{id : 21,cedula : \"V-12849331\",nombres : \"MANUELA JOSEFINA\"apellidos : \"PINTO CAMACHO\"email : \"MANUELJOSEFINA@GMAIL.COM\"telefono : \"+58 412 738 83 04\"fecha_de_nacimiento : \"12/12/1945\"}'),(317,1,'INSERTAR','2017-10-21 15:41:23','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12384954 Y NOMBRE ES KATIUSKA JUAREZ',NULL,'{id : 22,cedula : \"V-12384954\",nombres : \"KATIUSKA\"apellidos : \"JUAREZ\"email : \"KATYJUAREZ@TSJ.COM.VE\"telefono : \"+58 412 838 49 43\"fecha_de_nacimiento : \"08/07/1970\"}'),(318,1,'INSERTAR','2017-10-21 15:42:52','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-8903944 Y NOMBRE ES FAUSTINA CAMACHO BUSTILLO',NULL,'{id : 23,cedula : \"V-8903944\",nombres : \"FAUSTINA\"apellidos : \"CAMACHO BUSTILLO\"email : \"LIC.BUSTILLOFAUSTINA@TSJ.GOB.VE\"telefono : \"+58 426 838 30 40\"fecha_de_nacimiento : \"09/08/1950\"}'),(319,1,'INSERTAR','2017-10-21 15:47:43','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-17383922 Y NOMBRE ES JOHAN MIGUEL CHAVEZ RODRIGUEZ',NULL,'{id : 24,cedula : \"V-17383922\",nombres : \"JOHAN MIGUEL\"apellidos : \"CHAVEZ RODRIGUEZ\"email : \"JOHANCHAVEZ@TSJ.COM.VE\"telefono : \"+58 412 484 93 99\"fecha_de_nacimiento : \"12/12/1968\"}'),(320,1,'INSERTAR','2017-10-21 15:49:12','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-18344034 Y NOMBRE ES MANUEL COLMENAREZ',NULL,'{id : 25,cedula : \"V-18344034\",nombres : \"MANUEL\"apellidos : \"COLMENAREZ\"email : \"MANUELCOLMENAREZ@HOTMAIL.COM\"telefono : \"+58 414 938 48 44\"fecha_de_nacimiento : \"12/10/1992\"}'),(321,1,'INSERTAR','2017-10-21 15:50:39','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-14859333 Y NOMBRE ES JUAN ESTEBAN MOAD AHMAD',NULL,'{id : 26,cedula : \"V-14859333\",nombres : \"JUAN ESTEBAN\"apellidos : \"MOAD AHMAD\"email : \"JUANESTEBAN@GMAIL.COM\"telefono : \"+58 412 838 38 33\"fecha_de_nacimiento : \"13/08/1960\"}'),(322,1,'INSERTAR','2017-10-21 16:12:16','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12893944 Y NOMBRE ES JUAN MANUEL PEREZ SUAREZ',NULL,'{id : 27,cedula : \"V-12893944\",nombres : \"JUAN MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"PEREZJUAN@GMAIL.COM\"telefono : \"+58 414 858 58 93\"fecha_de_nacimiento : \"12/10/1967\"}'),(323,1,'INSERTAR','2017-10-21 16:13:20','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12849844 Y NOMBRE ES MANUEL PEREZ SUAREZ',NULL,'{id : 28,cedula : \"V-12849844\",nombres : \"MANUEL\"apellidos : \"PEREZ SUAREZ\"email : \"MANUELPEREZ1@GMAIL.COM\"telefono : \"+58 426 940 93 34\"fecha_de_nacimiento : \"17/12/1938\"}'),(324,1,'INSERTAR','2017-10-21 16:15:31','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12849847 Y NOMBRE ES WILKENSON DANIEL CAMACHO CUICAS',NULL,'{id : 29,cedula : \"V-12849847\",nombres : \"WILKENSON DANIEL\"apellidos : \"CAMACHO CUICAS\"email : \"WILKEON@HOTMAIL.COM\"telefono : \"+58 426 933 09 30\"fecha_de_nacimiento : \"18/10/1995\"}'),(325,1,'INSERTAR','2017-10-21 16:16:59','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12849344 Y NOMBRE ES JORGE MIGUEL HUACK CAMACHO',NULL,'{id : 30,cedula : \"V-12849344\",nombres : \"JORGE MIGUEL\"apellidos : \"HUACK CAMACHO\"email : \"GEORGEHUACK@YAHOO.COM.VE\"telefono : \"+58 424 632 83 43\"fecha_de_nacimiento : \"11/10/1992\"}'),(326,0,'INSERTAR','2017-10-21 16:24:15','SALA','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-001',NULL,'{id : 1,numero : \"EXP-001\",descripcion : \"SE ATRAPO IN FRAGANTI AL IMPUTADO COMETIENDO ROBO A MANO ARMADA, EL IMPUTADO SE RESISTIO A SER ARRESTADO\"}'),(327,1,'INSERTAR','2017-10-21 16:25:25','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-23485533 Y NOMBRE ES BRAYAN COLMENAREZ',NULL,'{id : 31,cedula : \"V-23485533\",nombres : \"BRAYAN\"apellidos : \"COLMENAREZ\"email : \"ELBRAYITA@GMAIL.COM\"telefono : \"+58 426 256 39 93\"fecha_de_nacimiento : \"12/12/1992\"}'),(328,1,'INSERTAR','2017-10-21 16:26:25','SALA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12938443 Y NOMBRE ES MARIA JOSE MOACK SANCHEZ',NULL,'{id : 32,cedula : \"V-12938443\",nombres : \"MARIA JOSE\"apellidos : \"MOACK SANCHEZ\"email : \"MARIAJOSE@GMAIL.COM\"telefono : \"+58 426 738 39 44\"fecha_de_nacimiento : \"12/12/1997\"}'),(329,0,'INSERTAR','2017-10-21 16:28:35','SALA','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-002',NULL,'{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(330,1,'INSERTAR','2017-10-21 16:29:16','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ Y SU ESTATUS ES ESPERA',NULL,'{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 1,id_tribunal : 1}'),(331,1,'INSERTAR','2017-10-21 16:30:29','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ Y SU ESTATUS ES ESPERA',NULL,'{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 1,id_tribunal : 1}'),(332,1,'MODIFICAR','2017-10-21 16:31:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T11:00:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 1,id_tribunal : 1}'),(333,1,'MODIFICAR','2017-10-21 16:31:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T10:00:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-10-22T10:00:00\",fin : \"2017-10-22T12:00:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 3,id_tribunal : 1}'),(334,1,'MODIFICAR','2017-10-21 16:31:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T11:00:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(335,1,'MODIFICAR','2017-10-21 16:31:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T08:30:00 CUYA DESCRIPCION ES PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-22T10:00:00\",fin : \"2017-10-22T12:00:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-22T08:30:00\",fin : \"2017-10-22T10:30:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 3,id_tribunal : 1}'),(336,1,'MODIFICAR','2017-10-21 16:31:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-22T08:30:00\",fin : \"2017-10-22T10:30:00\",descripcion : \"PRIMERA PRESENTACION DEL CASO ANTE EL JUEZ\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-22T08:30:00\",fin : \"2017-10-22T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(337,1,'MODIFICAR','2017-10-21 16:32:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-22T08:30:00\",fin : \"2017-10-22T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-22T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(338,1,'MODIFICAR','2017-10-21 16:32:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-22T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(339,1,'MODIFICAR','2017-10-21 16:32:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-22T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(340,1,'MODIFICAR','2017-10-21 16:32:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-22T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(341,1,'MODIFICAR','2017-10-21 16:32:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(342,1,'MODIFICAR','2017-10-21 16:32:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(343,1,'MODIFICAR','2017-10-21 16:39:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(344,1,'MODIFICAR','2017-10-21 16:39:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(345,1,'MODIFICAR','2017-10-21 16:39:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(346,1,'MODIFICAR','2017-10-21 16:39:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(347,1,'MODIFICAR','2017-10-21 16:42:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(348,1,'MODIFICAR','2017-10-21 16:42:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(349,1,'MODIFICAR','2017-10-21 16:42:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(350,1,'MODIFICAR','2017-10-21 16:42:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(351,1,'MODIFICAR','2017-10-21 16:43:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(352,1,'MODIFICAR','2017-10-21 16:43:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(353,1,'MODIFICAR','2017-10-21 16:43:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(354,1,'MODIFICAR','2017-10-21 16:43:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(355,1,'MODIFICAR','2017-10-21 16:43:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(356,1,'MODIFICAR','2017-10-21 16:43:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(357,1,'MODIFICAR','2017-10-21 16:46:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(358,1,'MODIFICAR','2017-10-21 16:46:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(359,1,'MODIFICAR','2017-10-21 16:47:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(360,1,'MODIFICAR','2017-10-21 16:47:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(361,1,'MODIFICAR','2017-10-21 16:47:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(362,1,'MODIFICAR','2017-10-21 16:47:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(363,1,'MODIFICAR','2017-10-21 16:49:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(364,1,'MODIFICAR','2017-10-21 16:49:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(365,1,'MODIFICAR','2017-10-21 17:01:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(366,1,'MODIFICAR','2017-10-21 17:01:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(367,1,'MODIFICAR','2017-10-21 17:01:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(368,1,'MODIFICAR','2017-10-21 17:01:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(369,1,'MODIFICAR','2017-10-21 17:03:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(370,1,'MODIFICAR','2017-10-21 17:03:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(371,1,'MODIFICAR','2017-10-21 17:03:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(372,1,'MODIFICAR','2017-10-21 17:03:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(373,1,'MODIFICAR','2017-10-21 17:03:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(374,1,'MODIFICAR','2017-10-21 17:03:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(375,1,'MODIFICAR','2017-10-21 17:03:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(376,1,'MODIFICAR','2017-10-21 17:03:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(377,1,'MODIFICAR','2017-10-21 17:04:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(378,1,'MODIFICAR','2017-10-21 17:04:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(379,1,'MODIFICAR','2017-10-21 17:04:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(380,1,'MODIFICAR','2017-10-21 17:04:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(381,1,'MODIFICAR','2017-10-21 17:04:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(382,1,'MODIFICAR','2017-10-21 17:04:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(383,1,'INSERTAR','2017-10-21 17:04:46','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES JUICIO NUMERO 2 Y SU ESTATUS ES ASIGNADO',NULL,'{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:00:00\",descripcion : \"JUICIO NUMERO 2\",id_sala : 2,id_tribunal : 3}'),(384,1,'MODIFICAR','2017-10-21 17:04:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(385,1,'MODIFICAR','2017-10-21 17:04:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(386,1,'MODIFICAR','2017-10-21 17:05:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES JUICIO NUMERO 2 Y SU ESTATUS ES ESPERA','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:00:00\",descripcion : \"JUICIO NUMERO 2\",id_sala : 2,id_tribunal : 3}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO NUMERO 2\",id_sala : 1,id_tribunal : 3}'),(387,1,'MODIFICAR','2017-10-21 17:05:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T11:30:00 CUYA DESCRIPCION ES JUICIO NUMERO 2 Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO NUMERO 2\",id_sala : 1,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T11:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"JUICIO NUMERO 2\",id_sala : 4,id_tribunal : 3}'),(388,1,'MODIFICAR','2017-10-21 17:05:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T10:00:00 CUYA DESCRIPCION ES JUICIO NUMERO 2 Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T11:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"JUICIO NUMERO 2\",id_sala : 4,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T10:00:00\",fin : \"2017-10-22T12:00:00\",descripcion : \"JUICIO NUMERO 2\",id_sala : 2,id_tribunal : 3}'),(389,1,'MODIFICAR','2017-10-21 17:05:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T10:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T10:00:00\",fin : \"2017-10-22T12:00:00\",descripcion : \"JUICIO NUMERO 2\",id_sala : 2,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T10:00:00\",fin : \"2017-10-22T17:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 3}'),(390,1,'MODIFICAR','2017-10-21 17:05:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T10:00:00\",fin : \"2017-10-22T17:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(391,1,'MODIFICAR','2017-10-21 19:52:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(392,1,'MODIFICAR','2017-10-21 19:52:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(393,1,'MODIFICAR','2017-10-21 19:52:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(394,1,'MODIFICAR','2017-10-21 19:52:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(395,1,'MODIFICAR','2017-10-21 19:52:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(396,1,'MODIFICAR','2017-10-21 19:52:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(397,1,'MODIFICAR','2017-10-21 19:53:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(398,1,'MODIFICAR','2017-10-21 19:53:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(399,1,'MODIFICAR','2017-10-21 20:01:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(400,1,'MODIFICAR','2017-10-21 20:01:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(401,1,'MODIFICAR','2017-10-21 20:01:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(402,1,'MODIFICAR','2017-10-21 20:01:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(403,1,'MODIFICAR','2017-10-21 20:01:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(404,1,'MODIFICAR','2017-10-21 20:02:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(405,1,'MODIFICAR','2017-10-21 20:04:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(406,1,'MODIFICAR','2017-10-21 20:04:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(407,1,'MODIFICAR','2017-10-21 20:05:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(408,1,'MODIFICAR','2017-10-21 20:05:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(409,1,'MODIFICAR','2017-10-21 20:05:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(410,1,'MODIFICAR','2017-10-21 20:06:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(411,1,'MODIFICAR','2017-10-21 20:06:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(412,1,'MODIFICAR','2017-10-21 20:06:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(413,1,'MODIFICAR','2017-10-21 20:08:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(414,1,'MODIFICAR','2017-10-21 20:08:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(415,1,'MODIFICAR','2017-10-21 20:09:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(416,1,'MODIFICAR','2017-10-21 20:09:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(417,1,'MODIFICAR','2017-10-21 20:10:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(418,1,'MODIFICAR','2017-10-21 20:16:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(419,1,'MODIFICAR','2017-10-21 20:16:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(420,1,'MODIFICAR','2017-10-21 20:16:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(421,1,'MODIFICAR','2017-10-21 20:16:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(422,1,'MODIFICAR','2017-10-21 20:22:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(423,1,'MODIFICAR','2017-10-21 20:22:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(424,1,'MODIFICAR','2017-10-21 20:22:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(425,1,'MODIFICAR','2017-10-21 20:23:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(426,1,'MODIFICAR','2017-10-21 20:23:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(427,1,'MODIFICAR','2017-10-21 20:24:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(428,1,'MODIFICAR','2017-10-21 20:24:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(429,1,'MODIFICAR','2017-10-21 20:28:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(430,1,'MODIFICAR','2017-10-21 20:28:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(431,1,'MODIFICAR','2017-10-21 20:28:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(432,1,'MODIFICAR','2017-10-21 20:29:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(433,1,'MODIFICAR','2017-10-21 20:34:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(434,1,'MODIFICAR','2017-10-21 20:34:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(435,1,'MODIFICAR','2017-10-21 20:35:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(436,1,'MODIFICAR','2017-10-21 20:35:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(437,1,'MODIFICAR','2017-10-21 20:44:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(438,1,'MODIFICAR','2017-10-21 20:44:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(439,1,'MODIFICAR','2017-10-21 20:45:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(440,1,'MODIFICAR','2017-10-21 20:45:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(441,1,'INSERTAR','2017-10-21 20:47:05','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES HAO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 4,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T15:00:00\",descripcion : \"HAO\",id_sala : 4,id_tribunal : 6}'),(442,1,'MODIFICAR','2017-10-21 20:47:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(443,1,'MODIFICAR','2017-10-21 20:47:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(444,1,'INSERTAR','2017-10-21 20:48:06','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-22T10:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 5,inicio : \"2017-10-22T10:30:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"HOLA\",id_sala : 5,id_tribunal : 3}'),(445,1,'MODIFICAR','2017-10-21 20:48:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(446,1,'ELIMINAR','2017-10-21 20:48:20','ACTO','','{id : 4,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T15:00:00\",descripcion : \"HAO\",id_sala : 4,id_tribunal : 6}',NULL),(447,1,'MODIFICAR','2017-10-21 20:48:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(448,1,'MODIFICAR','2017-10-21 20:52:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(449,1,'MODIFICAR','2017-10-21 20:52:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(450,1,'MODIFICAR','2017-10-21 20:52:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(451,1,'ELIMINAR','2017-10-21 20:53:01','ACTO','','{id : 5,inicio : \"2017-10-22T10:30:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"HOLA\",id_sala : 5,id_tribunal : 3}',NULL),(452,1,'MODIFICAR','2017-10-21 20:53:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(453,1,'MODIFICAR','2017-10-21 20:54:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(454,1,'MODIFICAR','2017-10-21 20:54:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(455,1,'MODIFICAR','2017-10-21 20:58:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(456,1,'MODIFICAR','2017-10-21 20:58:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(457,1,'MODIFICAR','2017-10-21 20:58:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(458,1,'MODIFICAR','2017-10-21 20:58:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(459,1,'MODIFICAR','2017-10-21 20:59:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(460,1,'MODIFICAR','2017-10-21 21:06:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(461,1,'MODIFICAR','2017-10-21 21:06:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(462,1,'MODIFICAR','2017-10-21 21:27:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(463,1,'MODIFICAR','2017-10-21 21:27:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(464,1,'MODIFICAR','2017-10-21 21:28:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(465,1,'MODIFICAR','2017-10-21 21:28:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(466,1,'MODIFICAR','2017-10-21 21:37:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(467,1,'MODIFICAR','2017-10-21 21:37:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(468,1,'MODIFICAR','2017-10-21 21:37:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(469,1,'MODIFICAR','2017-10-21 21:37:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(470,1,'MODIFICAR','2017-10-21 21:37:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(471,1,'MODIFICAR','2017-10-21 21:37:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(472,1,'MODIFICAR','2017-10-21 21:37:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(473,1,'MODIFICAR','2017-10-21 21:37:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(474,0,'MODIFICAR','2017-10-21 21:38:28','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(475,1,'MODIFICAR','2017-10-21 21:42:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(476,1,'MODIFICAR','2017-10-21 21:42:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(477,1,'MODIFICAR','2017-10-21 21:42:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(478,1,'MODIFICAR','2017-10-21 21:42:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(479,0,'MODIFICAR','2017-10-21 21:42:32','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-001','{id : 1,numero : \"EXP-001\",descripcion : \"SE ATRAPO IN FRAGANTI AL IMPUTADO COMETIENDO ROBO A MANO ARMADA, EL IMPUTADO SE RESISTIO A SER ARRESTADO\"}','{id : 1,numero : \"EXP-001\",descripcion : \"SE ATRAPO IN FRAGANTI AL IMPUTADO COMETIENDO ROBO A MANO ARMADA, EL IMPUTADO SE RESISTIO A SER ARRESTADO\"}'),(480,1,'MODIFICAR','2017-10-21 21:43:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(481,1,'MODIFICAR','2017-10-21 21:43:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(482,0,'MODIFICAR','2017-10-21 21:43:52','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(483,1,'MODIFICAR','2017-10-21 21:47:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(484,1,'MODIFICAR','2017-10-21 21:47:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(485,0,'MODIFICAR','2017-10-21 21:47:31','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(486,1,'MODIFICAR','2017-10-21 21:49:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(487,1,'MODIFICAR','2017-10-21 21:50:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(488,0,'MODIFICAR','2017-10-21 21:50:03','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(489,1,'MODIFICAR','2017-10-21 21:53:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(490,1,'MODIFICAR','2017-10-21 21:53:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(491,0,'MODIFICAR','2017-10-21 21:53:13','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(492,1,'MODIFICAR','2017-10-21 21:54:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(493,1,'MODIFICAR','2017-10-21 21:54:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(494,0,'MODIFICAR','2017-10-21 21:54:52','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(495,1,'MODIFICAR','2017-10-21 21:55:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(496,1,'MODIFICAR','2017-10-21 21:55:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(497,0,'MODIFICAR','2017-10-21 21:56:00','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(498,1,'MODIFICAR','2017-10-21 21:56:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(499,1,'MODIFICAR','2017-10-21 21:56:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(500,0,'MODIFICAR','2017-10-21 21:56:44','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(501,1,'MODIFICAR','2017-10-21 21:58:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(502,1,'MODIFICAR','2017-10-21 21:58:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(503,0,'MODIFICAR','2017-10-21 21:58:37','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(504,1,'MODIFICAR','2017-10-21 21:59:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(505,1,'MODIFICAR','2017-10-21 22:00:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(506,0,'MODIFICAR','2017-10-21 22:00:11','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(507,1,'MODIFICAR','2017-10-21 22:01:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(508,1,'MODIFICAR','2017-10-21 22:01:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(509,0,'MODIFICAR','2017-10-21 22:01:32','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(510,1,'MODIFICAR','2017-10-21 22:02:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASGINADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(511,1,'MODIFICAR','2017-10-21 22:02:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(512,1,'MODIFICAR','2017-10-21 22:02:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 1,inicio : \"2017-10-21T08:30:00\",fin : \"2017-10-21T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(513,0,'MODIFICAR','2017-10-21 22:02:47','SALA','SE HA CAMBIADO UN CASO CUYO NUMERO DE CAUSA ES EXP-002','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}','{id : 2,numero : \"EXP-002\",descripcion : \"INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE\"}'),(514,1,'INSERTAR','2017-10-21 23:05:38','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA\",id_sala : 4,id_tribunal : 6}'),(515,1,'MODIFICAR','2017-10-21 23:05:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA\",id_sala : 4,id_tribunal : 6}'),(516,1,'MODIFICAR','2017-10-21 23:06:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(517,1,'MODIFICAR','2017-10-21 23:10:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-21T09:00:00 CUYA DESCRIPCION ES EXP-001: JUICIO DE SALIDA Y SU ESTATUS ES FINALIZADO','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}','{id : 2,inicio : \"2017-10-21T09:00:00\",fin : \"2017-10-21T16:00:00\",descripcion : \"EXP-001: JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(518,1,'MODIFICAR','2017-10-21 23:11:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(519,1,'MODIFICAR','2017-10-22 12:57:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(520,1,'MODIFICAR','2017-10-22 12:57:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(521,1,'MODIFICAR','2017-10-22 12:57:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(522,1,'MODIFICAR','2017-10-22 12:57:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(523,1,'MODIFICAR','2017-10-22 12:57:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(524,1,'MODIFICAR','2017-10-22 12:57:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(525,1,'MODIFICAR','2017-10-22 12:57:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(526,1,'MODIFICAR','2017-10-22 12:57:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(527,1,'MODIFICAR','2017-10-22 12:57:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(528,1,'MODIFICAR','2017-10-22 12:57:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(529,1,'MODIFICAR','2017-10-22 13:01:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(530,1,'MODIFICAR','2017-10-22 13:01:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(531,1,'MODIFICAR','2017-10-22 13:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(532,1,'MODIFICAR','2017-10-22 13:03:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(533,1,'MODIFICAR','2017-10-22 13:03:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(534,1,'MODIFICAR','2017-10-22 13:03:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(535,1,'MODIFICAR','2017-10-22 13:03:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(536,1,'MODIFICAR','2017-10-22 13:03:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(537,1,'MODIFICAR','2017-10-22 13:19:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(538,1,'MODIFICAR','2017-10-22 13:19:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(539,1,'MODIFICAR','2017-10-22 13:19:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(540,1,'MODIFICAR','2017-10-22 13:19:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(541,1,'MODIFICAR','2017-10-22 13:22:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(542,1,'MODIFICAR','2017-10-22 13:22:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(543,1,'MODIFICAR','2017-10-22 13:22:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(544,1,'MODIFICAR','2017-10-22 13:22:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(545,1,'MODIFICAR','2017-10-22 13:25:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(546,1,'MODIFICAR','2017-10-22 13:25:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(547,1,'MODIFICAR','2017-10-22 13:25:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(548,1,'MODIFICAR','2017-10-22 13:25:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(549,1,'MODIFICAR','2017-10-22 13:26:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(550,1,'MODIFICAR','2017-10-22 13:26:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(551,1,'MODIFICAR','2017-10-22 13:26:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(552,1,'MODIFICAR','2017-10-22 13:26:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(553,1,'MODIFICAR','2017-10-22 13:41:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(554,1,'MODIFICAR','2017-10-22 13:41:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(555,1,'MODIFICAR','2017-10-22 13:41:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(556,1,'MODIFICAR','2017-10-22 13:41:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(557,1,'MODIFICAR','2017-10-22 14:04:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(558,1,'MODIFICAR','2017-10-22 14:04:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(559,1,'MODIFICAR','2017-10-22 14:04:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(560,1,'MODIFICAR','2017-10-22 14:04:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(561,1,'MODIFICAR','2017-10-22 14:29:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(562,1,'MODIFICAR','2017-10-22 14:29:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(563,1,'MODIFICAR','2017-10-22 14:29:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(564,1,'MODIFICAR','2017-10-22 14:29:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(565,1,'MODIFICAR','2017-10-22 14:56:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(566,1,'MODIFICAR','2017-10-22 14:56:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(567,1,'MODIFICAR','2017-10-22 14:56:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(568,1,'MODIFICAR','2017-10-22 14:56:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(569,1,'MODIFICAR','2017-10-22 15:21:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(570,1,'MODIFICAR','2017-10-22 15:21:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(571,1,'MODIFICAR','2017-10-22 15:21:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(572,1,'MODIFICAR','2017-10-22 15:21:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(573,1,'MODIFICAR','2017-10-22 15:30:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(574,1,'MODIFICAR','2017-10-22 15:30:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(575,1,'MODIFICAR','2017-10-22 15:30:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(576,1,'MODIFICAR','2017-10-22 15:30:56','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(577,1,'MODIFICAR','2017-10-22 15:40:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(578,1,'MODIFICAR','2017-10-22 15:40:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(579,1,'MODIFICAR','2017-10-22 15:40:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(580,1,'MODIFICAR','2017-10-22 15:40:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(581,1,'MODIFICAR','2017-10-22 15:43:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(582,1,'MODIFICAR','2017-10-22 15:43:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(583,1,'MODIFICAR','2017-10-22 15:43:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(584,1,'MODIFICAR','2017-10-22 15:43:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(585,1,'MODIFICAR','2017-10-22 15:45:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(586,1,'MODIFICAR','2017-10-22 15:45:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(587,1,'MODIFICAR','2017-10-22 15:46:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(588,1,'MODIFICAR','2017-10-22 15:46:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(589,1,'MODIFICAR','2017-10-22 15:47:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(590,1,'MODIFICAR','2017-10-22 15:47:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(591,1,'MODIFICAR','2017-10-22 15:48:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(592,1,'MODIFICAR','2017-10-22 15:48:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(593,1,'MODIFICAR','2017-10-22 15:49:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(594,1,'MODIFICAR','2017-10-22 15:49:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(595,1,'MODIFICAR','2017-10-22 15:50:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(596,1,'MODIFICAR','2017-10-22 15:50:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(597,1,'MODIFICAR','2017-10-22 15:51:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(598,1,'MODIFICAR','2017-10-22 15:51:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(599,1,'MODIFICAR','2017-10-22 15:54:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(600,1,'MODIFICAR','2017-10-22 15:54:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(601,1,'MODIFICAR','2017-10-22 15:58:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(602,1,'MODIFICAR','2017-10-22 15:58:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(603,1,'MODIFICAR','2017-10-22 15:58:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(604,1,'MODIFICAR','2017-10-22 15:58:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(605,1,'MODIFICAR','2017-10-22 15:58:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(606,1,'MODIFICAR','2017-10-22 15:58:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(607,1,'MODIFICAR','2017-10-22 15:59:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(608,1,'MODIFICAR','2017-10-22 15:59:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(609,1,'MODIFICAR','2017-10-22 16:01:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(610,1,'MODIFICAR','2017-10-22 16:01:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(611,1,'MODIFICAR','2017-10-22 16:03:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(612,1,'MODIFICAR','2017-10-22 16:03:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(613,1,'MODIFICAR','2017-10-22 16:03:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(614,1,'MODIFICAR','2017-10-22 16:03:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(615,1,'MODIFICAR','2017-10-22 16:03:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(616,1,'MODIFICAR','2017-10-22 16:03:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(617,1,'MODIFICAR','2017-10-22 16:29:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(618,1,'MODIFICAR','2017-10-22 16:29:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(619,1,'MODIFICAR','2017-10-22 16:29:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(620,1,'MODIFICAR','2017-10-22 16:29:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(621,1,'MODIFICAR','2017-10-22 16:31:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(622,1,'MODIFICAR','2017-10-22 16:31:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(623,1,'MODIFICAR','2017-10-22 16:32:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(624,1,'MODIFICAR','2017-10-22 16:32:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(625,1,'MODIFICAR','2017-10-22 16:32:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(626,1,'MODIFICAR','2017-10-22 16:32:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(627,1,'MODIFICAR','2017-10-22 16:32:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(628,1,'MODIFICAR','2017-10-22 16:32:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(629,1,'MODIFICAR','2017-10-22 16:33:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(630,1,'MODIFICAR','2017-10-22 16:33:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(631,1,'MODIFICAR','2017-10-22 16:46:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(632,1,'MODIFICAR','2017-10-22 16:46:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(633,1,'MODIFICAR','2017-10-22 16:46:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(634,1,'MODIFICAR','2017-10-22 16:46:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(635,1,'MODIFICAR','2017-10-22 16:46:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(636,1,'MODIFICAR','2017-10-22 16:46:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(637,1,'MODIFICAR','2017-10-22 16:47:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(638,1,'MODIFICAR','2017-10-22 16:47:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(639,1,'MODIFICAR','2017-10-22 16:47:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(640,1,'MODIFICAR','2017-10-22 16:47:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(641,1,'MODIFICAR','2017-10-22 16:47:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(642,1,'MODIFICAR','2017-10-22 16:47:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(643,1,'MODIFICAR','2017-10-22 16:48:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(644,1,'MODIFICAR','2017-10-22 16:48:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(645,1,'MODIFICAR','2017-10-22 16:48:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(646,1,'MODIFICAR','2017-10-22 16:48:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(647,1,'MODIFICAR','2017-10-22 16:48:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(648,1,'MODIFICAR','2017-10-22 16:48:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(649,1,'MODIFICAR','2017-10-22 16:48:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(650,1,'MODIFICAR','2017-10-22 16:48:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(651,1,'MODIFICAR','2017-10-22 16:50:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(652,1,'MODIFICAR','2017-10-22 16:50:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(653,1,'MODIFICAR','2017-10-22 16:51:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(654,1,'MODIFICAR','2017-10-22 16:51:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(655,1,'MODIFICAR','2017-10-22 16:54:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(656,1,'MODIFICAR','2017-10-22 16:54:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(657,1,'MODIFICAR','2017-10-22 16:54:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(658,1,'MODIFICAR','2017-10-22 16:54:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(659,1,'MODIFICAR','2017-10-22 16:55:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(660,1,'MODIFICAR','2017-10-22 16:55:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(661,1,'MODIFICAR','2017-10-22 16:55:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(662,1,'MODIFICAR','2017-10-22 16:55:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES ASIGNADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(663,1,'MODIFICAR','2017-10-22 18:20:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(664,1,'MODIFICAR','2017-10-22 18:20:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:30:00 CUYA DESCRIPCION ES GOLA 2 Y SU ESTATUS ES FINALIZADO','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}','{id : 6,inicio : \"2017-10-22T09:30:00\",fin : \"2017-10-22T13:30:00\",descripcion : \"GOLA 2\",id_sala : 4,id_tribunal : 6}'),(665,1,'MODIFICAR','2017-10-22 18:20:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(666,1,'MODIFICAR','2017-10-22 18:20:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(667,1,'MODIFICAR','2017-10-22 18:21:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(668,1,'MODIFICAR','2017-10-22 18:23:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(669,1,'MODIFICAR','2017-10-22 18:23:45','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(670,1,'MODIFICAR','2017-10-22 18:26:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(671,1,'MODIFICAR','2017-10-22 18:26:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(672,1,'MODIFICAR','2017-10-22 18:28:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(673,1,'MODIFICAR','2017-10-22 18:32:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(674,1,'MODIFICAR','2017-10-22 18:33:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(675,1,'MODIFICAR','2017-10-22 18:34:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(676,1,'MODIFICAR','2017-10-22 18:34:25','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(677,1,'MODIFICAR','2017-10-22 18:48:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(678,1,'MODIFICAR','2017-10-22 18:48:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(679,1,'MODIFICAR','2017-10-22 18:48:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(680,1,'MODIFICAR','2017-10-22 18:48:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(681,1,'MODIFICAR','2017-10-22 18:48:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(682,1,'MODIFICAR','2017-10-22 18:48:57','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(683,1,'MODIFICAR','2017-10-22 18:49:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(684,1,'MODIFICAR','2017-10-22 18:49:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(685,1,'MODIFICAR','2017-10-22 18:49:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(686,1,'MODIFICAR','2017-10-22 18:49:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(687,1,'MODIFICAR','2017-10-22 18:49:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(688,1,'MODIFICAR','2017-10-22 18:49:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(689,1,'MODIFICAR','2017-10-22 19:10:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(690,1,'INSERTAR','2017-10-22 19:10:27','SALA','SE HA REGISTRADO UNA SALA COMO SALA 90',NULL,'{id : 7,descripcion : \"SALA 90\",color : \"#d91d1d\"}'),(691,1,'MODIFICAR','2017-10-22 19:10:43','SALA','SE HA CAMBIADO NOMBRE DE SALA 90 A SALA 90','{id : 7,descripcion : \"SALA 90\",color : \"#d91d1d\"}','{id : 7,descripcion : \"SALA 90\",color : \"#d91d1d\"}'),(692,1,'ELIMINAR','2017-10-22 19:10:43','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 90','{id : 7,descripcion : \"SALA 90\",color : \"#d91d1d\"}',NULL),(693,1,'INSERTAR','2017-10-22 19:11:16','SALA','SE HA REGISTRADO UNA SALA COMO SALA 12',NULL,'{id : 8,descripcion : \"SALA 12\",color : \"#5b11ff\"}'),(694,1,'MODIFICAR','2017-10-22 19:12:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(695,1,'MODIFICAR','2017-10-22 19:12:26','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(696,1,'MODIFICAR','2017-10-22 19:12:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(697,1,'MODIFICAR','2017-10-22 19:12:44','SALA','SE HA CAMBIADO NOMBRE DE SALA 12 A SALA 12','{id : 8,descripcion : \"SALA 12\",color : \"#5b11ff\"}','{id : 8,descripcion : \"SALA 12\",color : \"#5b11ff\"}'),(698,1,'ELIMINAR','2017-10-22 19:12:44','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 12','{id : 8,descripcion : \"SALA 12\",color : \"#5b11ff\"}',NULL),(699,1,'MODIFICAR','2017-10-22 19:17:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(700,1,'INSERTAR','2017-10-22 19:18:03','SALA','SE HA REGISTRADO UNA SALA COMO SALA1',NULL,'{id : 9,descripcion : \"SALA1\",color : \"#710404\"}'),(701,1,'MODIFICAR','2017-10-22 19:18:13','SALA','SE HA CAMBIADO NOMBRE DE SALA1 A SALA1','{id : 9,descripcion : \"SALA1\",color : \"#710404\"}','{id : 9,descripcion : \"SALA1\",color : \"#710404\"}'),(702,1,'ELIMINAR','2017-10-22 19:18:13','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA1','{id : 9,descripcion : \"SALA1\",color : \"#710404\"}',NULL),(703,1,'MODIFICAR','2017-10-22 19:20:51','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(704,1,'INSERTAR','2017-10-22 19:21:09','SALA','SE HA REGISTRADO UNA SALA COMO SALA 12',NULL,'{id : 10,descripcion : \"SALA 12\",color : \"#2d2929\"}'),(705,1,'MODIFICAR','2017-10-22 19:21:22','SALA','SE HA CAMBIADO NOMBRE DE SALA 12 A SALA 12','{id : 10,descripcion : \"SALA 12\",color : \"#2d2929\"}','{id : 10,descripcion : \"SALA 12\",color : \"#2d2929\"}'),(706,1,'ELIMINAR','2017-10-22 19:21:22','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 12','{id : 10,descripcion : \"SALA 12\",color : \"#2d2929\"}',NULL),(707,1,'MODIFICAR','2017-10-22 19:22:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(708,1,'INSERTAR','2017-10-22 19:22:35','SALA','SE HA REGISTRADO UNA SALA COMO HKLDHCX',NULL,'{id : 11,descripcion : \"HKLDHCX\",color : \"#ffd000\"}'),(709,1,'MODIFICAR','2017-10-22 19:22:46','SALA','SE HA CAMBIADO NOMBRE DE HKLDHCX A HKLDHCX','{id : 11,descripcion : \"HKLDHCX\",color : \"#ffd000\"}','{id : 11,descripcion : \"HKLDHCX\",color : \"#ffd000\"}'),(710,1,'ELIMINAR','2017-10-22 19:22:46','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO HKLDHCX','{id : 11,descripcion : \"HKLDHCX\",color : \"#ffd000\"}',NULL),(711,1,'MODIFICAR','2017-10-22 19:32:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(712,1,'MODIFICAR','2017-10-22 19:32:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(713,1,'MODIFICAR','2017-10-22 19:32:55','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(714,1,'MODIFICAR','2017-10-22 19:33:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(715,1,'INSERTAR','2017-10-22 19:33:29','SALA','SE HA REGISTRADO UNA SALA COMO SALA 393',NULL,'{id : 13,descripcion : \"SALA 393\",color : \"#ff0000\"}'),(716,1,'MODIFICAR','2017-10-22 19:33:50','SALA','SE HA CAMBIADO NOMBRE DE SALA 393 A SALA 393','{id : 13,descripcion : \"SALA 393\",color : \"#ff0000\"}','{id : 13,descripcion : \"SALA 393\",color : \"#ff0000\"}'),(717,1,'ELIMINAR','2017-10-22 19:33:50','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 393','{id : 13,descripcion : \"SALA 393\",color : \"#ff0000\"}',NULL),(718,1,'MODIFICAR','2017-10-22 19:36:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(719,1,'INSERTAR','2017-10-22 19:36:58','SALA','SE HA REGISTRADO UNA SALA COMO SALA 232',NULL,'{id : 14,descripcion : \"SALA 232\",color : \"#dc1313\"}'),(720,1,'MODIFICAR','2017-10-22 19:37:09','SALA','SE HA CAMBIADO NOMBRE DE SALA 232 A SALA 232','{id : 14,descripcion : \"SALA 232\",color : \"#dc1313\"}','{id : 14,descripcion : \"SALA 232\",color : \"#dc1313\"}'),(721,1,'ELIMINAR','2017-10-22 19:37:09','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 232','{id : 14,descripcion : \"SALA 232\",color : \"#dc1313\"}',NULL),(722,1,'INSERTAR','2017-10-22 19:41:12','SALA','SE HA REGISTRADO UNA SALA COMO SALA 493',NULL,'{id : 15,descripcion : \"SALA 493\",color : \"#83f704\"}'),(723,1,'MODIFICAR','2017-10-22 19:41:23','SALA','SE HA CAMBIADO NOMBRE DE SALA 493 A SALA 493','{id : 15,descripcion : \"SALA 493\",color : \"#83f704\"}','{id : 15,descripcion : \"SALA 493\",color : \"#83f704\"}'),(724,1,'ELIMINAR','2017-10-22 19:41:23','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 493','{id : 15,descripcion : \"SALA 493\",color : \"#83f704\"}',NULL),(725,1,'MODIFICAR','2017-10-22 19:43:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(726,1,'INSERTAR','2017-10-22 19:43:44','SALA','SE HA REGISTRADO UNA SALA COMO SALA 388',NULL,'{id : 16,descripcion : \"SALA 388\",color : \"#ff8300\"}'),(727,1,'MODIFICAR','2017-10-22 19:43:56','SALA','SE HA CAMBIADO NOMBRE DE SALA 388 A SALA 388','{id : 16,descripcion : \"SALA 388\",color : \"#ff8300\"}','{id : 16,descripcion : \"SALA 388\",color : \"#ff8300\"}'),(728,1,'ELIMINAR','2017-10-22 19:43:56','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 388','{id : 16,descripcion : \"SALA 388\",color : \"#ff8300\"}',NULL),(729,1,'MODIFICAR','2017-10-22 19:47:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(730,1,'MODIFICAR','2017-10-22 19:47:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(731,1,'MODIFICAR','2017-10-22 19:47:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(732,1,'INSERTAR','2017-10-22 19:47:42','SALA','SE HA REGISTRADO UNA SALA COMO AHDAO903',NULL,'{id : 17,descripcion : \"AHDAO903\",color : \"#1ae856\"}'),(733,1,'MODIFICAR','2017-10-22 19:47:52','SALA','SE HA CAMBIADO NOMBRE DE AHDAO903 A AHDAO903','{id : 17,descripcion : \"AHDAO903\",color : \"#1ae856\"}','{id : 17,descripcion : \"AHDAO903\",color : \"#1ae856\"}'),(734,1,'ELIMINAR','2017-10-22 19:47:52','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO AHDAO903','{id : 17,descripcion : \"AHDAO903\",color : \"#1ae856\"}',NULL),(735,1,'MODIFICAR','2017-10-22 19:49:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(736,1,'INSERTAR','2017-10-22 19:49:31','SALA','SE HA REGISTRADO UNA SALA COMO SALA 83',NULL,'{id : 18,descripcion : \"SALA 83\",color : \"#ff0064\"}'),(737,1,'MODIFICAR','2017-10-22 19:49:42','SALA','SE HA CAMBIADO NOMBRE DE SALA 83 A SALA 83','{id : 18,descripcion : \"SALA 83\",color : \"#ff0064\"}','{id : 18,descripcion : \"SALA 83\",color : \"#ff0064\"}'),(738,1,'ELIMINAR','2017-10-22 19:49:42','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA 83','{id : 18,descripcion : \"SALA 83\",color : \"#ff0064\"}',NULL),(739,1,'MODIFICAR','2017-10-22 19:53:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(740,1,'MODIFICAR','2017-10-22 19:53:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(741,1,'INSERTAR','2017-10-22 19:54:03','SALA','SE HA REGISTRADO UNA SALA COMO DJJDJDD',NULL,'{id : 19,descripcion : \"DJJDJDD\",color : \"#580b0b\"}'),(742,1,'MODIFICAR','2017-10-22 19:56:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(743,1,'MODIFICAR','2017-10-22 19:56:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(744,1,'MODIFICAR','2017-10-22 19:56:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(745,1,'MODIFICAR','2017-10-22 19:57:10','SALA','SE HA CAMBIADO NOMBRE DE DJJDJDD A DJJDJDD','{id : 19,descripcion : \"DJJDJDD\",color : \"#580b0b\"}','{id : 19,descripcion : \"DJJDJDD\",color : \"#580b0b\"}'),(746,1,'ELIMINAR','2017-10-22 19:57:10','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO DJJDJDD','{id : 19,descripcion : \"DJJDJDD\",color : \"#580b0b\"}',NULL),(747,1,'MODIFICAR','2017-10-22 19:57:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(748,1,'MODIFICAR','2017-10-22 20:11:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(749,1,'MODIFICAR','2017-10-22 20:11:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(750,1,'MODIFICAR','2017-10-22 20:11:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(751,1,'MODIFICAR','2017-10-22 20:11:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(752,1,'MODIFICAR','2017-10-22 20:13:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(753,1,'MODIFICAR','2017-10-22 20:13:03','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(754,1,'MODIFICAR','2017-10-22 20:13:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(755,1,'MODIFICAR','2017-10-22 20:13:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(756,1,'MODIFICAR','2017-10-22 20:13:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(757,3,'INSERTAR','2017-10-22 20:13:42','SALA','SE HA REGISTRADO UNA SALA COMO KLLJJ',NULL,'{id : 20,descripcion : \"KLLJJ\",color : \"#641313\"}'),(758,3,'MODIFICAR','2017-10-22 20:14:12','SALA','SE HA CAMBIADO NOMBRE DE KLLJJ A KLLJJ','{id : 20,descripcion : \"KLLJJ\",color : \"#641313\"}','{id : 20,descripcion : \"KLLJJ\",color : \"#641313\"}'),(759,3,'ELIMINAR','2017-10-22 20:14:12','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO KLLJJ','{id : 20,descripcion : \"KLLJJ\",color : \"#641313\"}',NULL),(760,1,'MODIFICAR','2017-10-22 20:14:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(761,1,'MODIFICAR','2017-10-22 20:17:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(762,1,'MODIFICAR','2017-10-22 20:18:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(763,3,'INSERTAR','2017-10-22 20:18:32','SALA','SE HA REGISTRADO UNA SALA COMO SALA999',NULL,'{id : 21,descripcion : \"SALA999\",color : \"#2171e3\"}'),(764,3,'MODIFICAR','2017-10-22 20:18:44','SALA','SE HA CAMBIADO NOMBRE DE SALA999 A SALA999','{id : 21,descripcion : \"SALA999\",color : \"#2171e3\"}','{id : 21,descripcion : \"SALA999\",color : \"#2171e3\"}'),(765,3,'ELIMINAR','2017-10-22 20:18:44','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SALA999','{id : 21,descripcion : \"SALA999\",color : \"#2171e3\"}',NULL),(766,1,'MODIFICAR','2017-10-22 20:18:53','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(767,1,'MODIFICAR','2017-10-22 20:19:59','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(768,1,'MODIFICAR','2017-10-22 20:20:40','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(769,1,'MODIFICAR','2017-10-22 20:24:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(770,1,'MODIFICAR','2017-10-22 20:25:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(771,1,'MODIFICAR','2017-10-22 20:28:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(772,3,'INSERTAR','2017-10-22 20:28:43','SALA','SE HA REGISTRADO UNA SALA COMO JKKLSKLDSD',NULL,'{id : 22,descripcion : \"JKKLSKLDSD\",color : \"#ff0000\"}'),(773,3,'INSERTAR','2017-10-22 20:28:55','SALA','SE HA REGISTRADO UNA SALA COMO DDJJSDSD',NULL,'{id : 23,descripcion : \"DDJJSDSD\",color : \"#000000\"}'),(774,1,'MODIFICAR','2017-10-22 20:29:32','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-22T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}','{id : 3,inicio : \"2017-10-22T09:00:00\",fin : \"2017-10-22T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 3}'),(775,3,'MODIFICAR','2017-10-22 20:30:49','SALA','SE HA CAMBIADO NOMBRE DE DDJJSDSD A DDJJSDSD','{id : 23,descripcion : \"DDJJSDSD\",color : \"#000000\"}','{id : 23,descripcion : \"DDJJSDSD\",color : \"#000000\"}'),(776,3,'ELIMINAR','2017-10-22 20:30:49','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO DDJJSDSD','{id : 23,descripcion : \"DDJJSDSD\",color : \"#000000\"}',NULL),(777,3,'MODIFICAR','2017-10-22 20:33:01','SALA','SE HA CAMBIADO NOMBRE DE JKKLSKLDSD A JKKLSKLDSD','{id : 22,descripcion : \"JKKLSKLDSD\",color : \"#ff0000\"}','{id : 22,descripcion : \"JKKLSKLDSD\",color : \"#ff0000\"}'),(778,3,'ELIMINAR','2017-10-22 20:33:01','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO JKKLSKLDSD','{id : 22,descripcion : \"JKKLSKLDSD\",color : \"#ff0000\"}',NULL),(779,3,'INSERTAR','2017-10-22 20:35:45','SALA','SE HA REGISTRADO UNA SALA COMO SSOD',NULL,'{id : 24,descripcion : \"SSOD\",color : \"#811313\"}'),(780,3,'MODIFICAR','2017-10-22 20:35:56','SALA','SE HA CAMBIADO NOMBRE DE SSOD A SSOD','{id : 24,descripcion : \"SSOD\",color : \"#811313\"}','{id : 24,descripcion : \"SSOD\",color : \"#811313\"}'),(781,3,'ELIMINAR','2017-10-22 20:35:56','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SSOD','{id : 24,descripcion : \"SSOD\",color : \"#811313\"}',NULL),(782,3,'INSERTAR','2017-10-22 20:37:49','SALA','SE HA REGISTRADO UNA SALA COMO XKKSS',NULL,'{id : 25,descripcion : \"XKKSS\",color : \"#3e0d7f\"}'),(783,3,'MODIFICAR','2017-10-22 20:37:59','SALA','SE HA CAMBIADO NOMBRE DE XKKSS A XKKSS','{id : 25,descripcion : \"XKKSS\",color : \"#3e0d7f\"}','{id : 25,descripcion : \"XKKSS\",color : \"#3e0d7f\"}'),(784,3,'ELIMINAR','2017-10-22 20:37:59','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO XKKSS','{id : 25,descripcion : \"XKKSS\",color : \"#3e0d7f\"}',NULL),(785,3,'INSERTAR','2017-10-22 20:42:17','SALA','SE HA REGISTRADO UNA SALA COMO IDIDDIDI',NULL,'{id : 26,descripcion : \"IDIDDIDI\",color : \"#6eff00\"}'),(786,3,'MODIFICAR','2017-10-22 20:42:29','SALA','SE HA CAMBIADO NOMBRE DE IDIDDIDI A IDIDDIDI','{id : 26,descripcion : \"IDIDDIDI\",color : \"#6eff00\"}','{id : 26,descripcion : \"IDIDDIDI\",color : \"#6eff00\"}'),(787,3,'ELIMINAR','2017-10-22 20:42:29','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO IDIDDIDI','{id : 26,descripcion : \"IDIDDIDI\",color : \"#6eff00\"}',NULL),(788,3,'INSERTAR','2017-10-22 20:44:40','SALA','SE HA REGISTRADO UNA SALA COMO KKKKJKKNMNKNK',NULL,'{id : 27,descripcion : \"KKKKJKKNMNKNK\",color : \"#003bff\"}'),(789,3,'MODIFICAR','2017-10-22 20:44:54','SALA','SE HA CAMBIADO NOMBRE DE KKKKJKKNMNKNK A KKKKJKKNMNKNK','{id : 27,descripcion : \"KKKKJKKNMNKNK\",color : \"#003bff\"}','{id : 27,descripcion : \"KKKKJKKNMNKNK\",color : \"#003bff\"}'),(790,3,'ELIMINAR','2017-10-22 20:44:54','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO KKKKJKKNMNKNK','{id : 27,descripcion : \"KKKKJKKNMNKNK\",color : \"#003bff\"}',NULL),(791,3,'INSERTAR','2017-10-22 20:53:56','SALA','SE HA REGISTRADO UNA SALA COMO SJSJSJSR904',NULL,'{id : 28,descripcion : \"SJSJSJSR904\",color : \"#833977\"}'),(792,3,'MODIFICAR','2017-10-22 20:54:11','SALA','SE HA CAMBIADO NOMBRE DE SJSJSJSR904 A SJSJSJSR904','{id : 28,descripcion : \"SJSJSJSR904\",color : \"#833977\"}','{id : 28,descripcion : \"SJSJSJSR904\",color : \"#833977\"}'),(793,3,'ELIMINAR','2017-10-22 20:54:11','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SJSJSJSR904','{id : 28,descripcion : \"SJSJSJSR904\",color : \"#833977\"}',NULL),(794,3,'INSERTAR','2017-10-22 21:09:42','SALA','SE HA REGISTRADO UNA SALA COMO SJJS',NULL,'{id : 29,descripcion : \"SJJS\",color : \"#ff0000\"}'),(795,3,'MODIFICAR','2017-10-22 21:09:53','SALA','SE HA CAMBIADO NOMBRE DE SJJS A SJJS','{id : 29,descripcion : \"SJJS\",color : \"#ff0000\"}','{id : 29,descripcion : \"SJJS\",color : \"#ff0000\"}'),(796,3,'ELIMINAR','2017-10-22 21:09:53','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SJJS','{id : 29,descripcion : \"SJJS\",color : \"#ff0000\"}',NULL),(797,3,'INSERTAR','2017-10-22 21:12:05','SALA','SE HA REGISTRADO UNA SALA COMO JXJXJX',NULL,'{id : 30,descripcion : \"JXJXJX\",color : \"#d60d0d\"}'),(798,3,'MODIFICAR','2017-10-22 21:12:15','SALA','SE HA CAMBIADO NOMBRE DE JXJXJX A JXJXJX','{id : 30,descripcion : \"JXJXJX\",color : \"#d60d0d\"}','{id : 30,descripcion : \"JXJXJX\",color : \"#d60d0d\"}'),(799,3,'ELIMINAR','2017-10-22 21:12:15','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO JXJXJX','{id : 30,descripcion : \"JXJXJX\",color : \"#d60d0d\"}',NULL),(800,3,'INSERTAR','2017-10-22 21:36:05','SALA','SE HA REGISTRADO UNA SALA COMO AJSJSJS',NULL,'{id : 31,descripcion : \"AJSJSJS\",color : \"#e41313\"}'),(801,3,'MODIFICAR','2017-10-22 21:36:17','SALA','SE HA CAMBIADO NOMBRE DE AJSJSJS A AJSJSJS','{id : 31,descripcion : \"AJSJSJS\",color : \"#e41313\"}','{id : 31,descripcion : \"AJSJSJS\",color : \"#e41313\"}'),(802,3,'ELIMINAR','2017-10-22 21:36:17','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO AJSJSJS','{id : 31,descripcion : \"AJSJSJS\",color : \"#e41313\"}',NULL),(803,3,'INSERTAR','2017-10-22 21:40:10','SALA','SE HA REGISTRADO UNA SALA COMO AKAAKA',NULL,'{id : 32,descripcion : \"AKAAKA\",color : \"#ff0000\"}'),(804,3,'MODIFICAR','2017-10-22 21:40:21','SALA','SE HA CAMBIADO NOMBRE DE AKAAKA A AKAAKA','{id : 32,descripcion : \"AKAAKA\",color : \"#ff0000\"}','{id : 32,descripcion : \"AKAAKA\",color : \"#ff0000\"}'),(805,3,'ELIMINAR','2017-10-22 21:40:21','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO AKAAKA','{id : 32,descripcion : \"AKAAKA\",color : \"#ff0000\"}',NULL),(806,3,'INSERTAR','2017-10-22 21:43:26','SALA','SE HA REGISTRADO UNA SALA COMO DDJDJD',NULL,'{id : 33,descripcion : \"DDJDJD\",color : \"#fc0000\"}'),(807,3,'MODIFICAR','2017-10-22 21:43:35','SALA','SE HA CAMBIADO NOMBRE DE DDJDJD A DDJDJD','{id : 33,descripcion : \"DDJDJD\",color : \"#fc0000\"}','{id : 33,descripcion : \"DDJDJD\",color : \"#fc0000\"}'),(808,3,'ELIMINAR','2017-10-22 21:43:36','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO DDJDJD','{id : 33,descripcion : \"DDJDJD\",color : \"#fc0000\"}',NULL),(809,3,'INSERTAR','2017-10-22 21:47:54','SALA','SE HA REGISTRADO UNA SALA COMO ALA  2',NULL,'{id : 34,descripcion : \"ALA  2\",color : \"#ff0000\"}'),(810,3,'ELIMINAR','2017-10-22 21:48:07','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO ALA  2','{id : 34,descripcion : \"ALA  2\",color : \"#ff0000\"}',NULL),(811,3,'INSERTAR','2017-10-22 21:54:56','SALA','SE HA REGISTRADO UNA SALA COMO JJJ',NULL,'{id : 35,descripcion : \"JJJ\",color : \"#b12828\"}'),(812,3,'INSERTAR','2017-10-22 21:55:09','SALA','SE HA REGISTRADO UNA SALA COMO JJJKLK',NULL,'{id : 36,descripcion : \"JJJKLK\",color : \"#d71919\"}'),(813,3,'MODIFICAR','2017-10-22 21:58:38','SALA','SE HA CAMBIADO NOMBRE DE JJJKLK A JJJKLK','{id : 36,descripcion : \"JJJKLK\",color : \"#d71919\"}','{id : 36,descripcion : \"JJJKLK\",color : \"#d71919\"}'),(814,3,'ELIMINAR','2017-10-22 21:58:38','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO JJJKLK','{id : 36,descripcion : \"JJJKLK\",color : \"#d71919\"}',NULL),(815,3,'MODIFICAR','2017-10-22 21:58:56','SALA','SE HA CAMBIADO NOMBRE DE JJJ A JJJ','{id : 35,descripcion : \"JJJ\",color : \"#b12828\"}','{id : 35,descripcion : \"JJJ\",color : \"#b12828\"}'),(816,3,'ELIMINAR','2017-10-22 21:58:56','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO JJJ','{id : 35,descripcion : \"JJJ\",color : \"#b12828\"}',NULL),(817,3,'INSERTAR','2017-10-22 22:01:50','SALA','SE HA REGISTRADO UNA SALA COMO KSKSKS',NULL,'{id : 37,descripcion : \"KSKSKS\",color : \"#a01212\"}'),(818,3,'INSERTAR','2017-10-22 22:02:15','SALA','SE HA REGISTRADO UNA SALA COMO KSKSKSS',NULL,'{id : 39,descripcion : \"KSKSKSS\",color : \"#e92e93\"}'),(819,3,'INSERTAR','2017-10-22 22:02:31','SALA','SE HA REGISTRADO UNA SALA COMO LSI',NULL,'{id : 40,descripcion : \"LSI\",color : \"#0cbf56\"}'),(820,3,'INSERTAR','2017-10-22 22:02:49','SALA','SE HA REGISTRADO UNA SALA COMO KIKO',NULL,'{id : 41,descripcion : \"KIKO\",color : \"#451919\"}'),(821,3,'INSERTAR','2017-10-22 22:03:07','SALA','SE HA REGISTRADO UNA SALA COMO VENEZUEKA',NULL,'{id : 42,descripcion : \"VENEZUEKA\",color : \"#ff0000\"}'),(822,3,'INSERTAR','2017-10-22 22:03:45','SALA','SE HA REGISTRADO UNA SALA COMO OTROSD',NULL,'{id : 44,descripcion : \"OTROSD\",color : \"#9e4444\"}'),(823,3,'INSERTAR','2017-10-22 22:04:08','SALA','SE HA REGISTRADO UNA SALA COMO KJKLNKN',NULL,'{id : 45,descripcion : \"KJKLNKN\",color : \"#000000\"}'),(824,3,'MODIFICAR','2017-10-22 22:05:05','SALA','SE HA CAMBIADO NOMBRE DE KIKO A KIKO','{id : 41,descripcion : \"KIKO\",color : \"#451919\"}','{id : 41,descripcion : \"KIKO\",color : \"#451919\"}'),(825,3,'ELIMINAR','2017-10-22 22:05:05','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO KIKO','{id : 41,descripcion : \"KIKO\",color : \"#451919\"}',NULL),(826,3,'MODIFICAR','2017-10-22 22:12:10','SALA','SE HA CAMBIADO NOMBRE DE KJKLNKN A KJKLNKN','{id : 45,descripcion : \"KJKLNKN\",color : \"#000000\"}','{id : 45,descripcion : \"KJKLNKN\",color : \"#000000\"}'),(827,3,'ELIMINAR','2017-10-22 22:12:10','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO KJKLNKN','{id : 45,descripcion : \"KJKLNKN\",color : \"#000000\"}',NULL),(828,3,'MODIFICAR','2017-10-22 22:14:58','SALA','SE HA CAMBIADO NOMBRE DE KSKSKSS A KSKSKSS','{id : 39,descripcion : \"KSKSKSS\",color : \"#e92e93\"}','{id : 39,descripcion : \"KSKSKSS\",color : \"#e92e93\"}'),(829,3,'ELIMINAR','2017-10-22 22:14:58','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO KSKSKSS','{id : 39,descripcion : \"KSKSKSS\",color : \"#e92e93\"}',NULL),(830,3,'MODIFICAR','2017-10-22 22:20:34','SALA','SE HA CAMBIADO NOMBRE DE KSKSKS A KSKSKS','{id : 37,descripcion : \"KSKSKS\",color : \"#a01212\"}','{id : 37,descripcion : \"KSKSKS\",color : \"#a01212\"}'),(831,3,'ELIMINAR','2017-10-22 22:20:34','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO KSKSKS','{id : 37,descripcion : \"KSKSKS\",color : \"#a01212\"}',NULL),(832,3,'MODIFICAR','2017-10-22 22:22:39','SALA','SE HA CAMBIADO NOMBRE DE LSI A LSI','{id : 40,descripcion : \"LSI\",color : \"#0cbf56\"}','{id : 40,descripcion : \"LSI\",color : \"#0cbf56\"}'),(833,3,'ELIMINAR','2017-10-22 22:22:39','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO LSI','{id : 40,descripcion : \"LSI\",color : \"#0cbf56\"}',NULL),(834,3,'MODIFICAR','2017-10-22 22:23:50','SALA','SE HA CAMBIADO NOMBRE DE OTROSD A OTROSD','{id : 44,descripcion : \"OTROSD\",color : \"#9e4444\"}','{id : 44,descripcion : \"OTROSD\",color : \"#9e4444\"}'),(835,3,'ELIMINAR','2017-10-22 22:23:50','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO OTROSD','{id : 44,descripcion : \"OTROSD\",color : \"#9e4444\"}',NULL),(836,3,'MODIFICAR','2017-10-22 22:24:02','SALA','SE HA CAMBIADO NOMBRE DE VENEZUEKA A VENEZUEKA','{id : 42,descripcion : \"VENEZUEKA\",color : \"#ff0000\"}','{id : 42,descripcion : \"VENEZUEKA\",color : \"#ff0000\"}'),(837,3,'ELIMINAR','2017-10-22 22:24:02','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO VENEZUEKA','{id : 42,descripcion : \"VENEZUEKA\",color : \"#ff0000\"}',NULL),(838,3,'INSERTAR','2017-10-22 23:12:15','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-23T08:00:00 CUYA DESCRIPCION ES DESCRIPCIO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 7,inicio : \"2017-10-23T08:00:00\",fin : \"2017-10-23T16:00:00\",descripcion : \"DESCRIPCIO\",id_sala : 3,id_tribunal : 6}'),(839,3,'MODIFICAR','2017-10-22 23:12:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCIO Y SU ESTATUS ES ESPERA','{id : 7,inicio : \"2017-10-23T08:00:00\",fin : \"2017-10-23T16:00:00\",descripcion : \"DESCRIPCIO\",id_sala : 3,id_tribunal : 6}','{id : 7,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCIO\",id_sala : 1,id_tribunal : 6}'),(840,3,'MODIFICAR','2017-10-22 23:13:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T10:30:00 CUYA DESCRIPCION ES DESCRIPCIO Y SU ESTATUS ES ASIGNADO','{id : 7,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCIO\",id_sala : 1,id_tribunal : 6}','{id : 7,inicio : \"2017-10-23T10:30:00\",fin : \"2017-10-23T12:30:00\",descripcion : \"DESCRIPCIO\",id_sala : 3,id_tribunal : 6}'),(841,3,'ELIMINAR','2017-10-22 23:13:17','ACTO','','{id : 7,inicio : \"2017-10-23T10:30:00\",fin : \"2017-10-23T12:30:00\",descripcion : \"DESCRIPCIO\",id_sala : 3,id_tribunal : 6}',NULL),(842,3,'INSERTAR','2017-10-22 23:14:52','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T11:00:00\",descripcion : \"HOLA\",id_sala : 4,id_tribunal : 7}'),(843,3,'MODIFICAR','2017-10-22 23:15:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ESPERA','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T11:00:00\",descripcion : \"HOLA\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 7}'),(844,3,'MODIFICAR','2017-10-22 23:15:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T09:00:00 CUYA DESCRIPCION ES HOLA Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T09:00:00\",fin : \"2017-10-23T11:00:00\",descripcion : \"HOLA\",id_sala : 5,id_tribunal : 7}'),(845,3,'MODIFICAR','2017-10-22 23:15:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T09:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T09:00:00\",fin : \"2017-10-23T11:00:00\",descripcion : \"HOLA\",id_sala : 5,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T09:00:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 7}'),(846,3,'MODIFICAR','2017-10-22 23:15:21','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:00:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T09:00:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:00:00\",fin : \"2017-10-23T16:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(847,3,'MODIFICAR','2017-10-22 23:15:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:00:00\",fin : \"2017-10-23T16:00:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(848,3,'INSERTAR','2017-10-22 23:16:19','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO',NULL,'{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(849,1,'ELIMINAR','2017-10-22 23:20:11','ACTIVIDAD','SE HA ELIMINADO UNA ACTIVIDAD CUYA DESCRIPCION FUE REGISTRADA COMO JUICIO DE SALIDA','{id : 6,actividad : \"JUICIO DE SALIDA\",id_tipo_tribunal : \"3\"}',NULL),(850,3,'INSERTAR','2017-10-22 23:23:07','SALA','SE HA REGISTRADO UNA SALA COMO SSLA',NULL,'{id : 46,descripcion : \"SSLA\",color : \"#ff0000\"}'),(851,3,'MODIFICAR','2017-10-22 23:23:20','SALA','SE HA CAMBIADO NOMBRE DE SSLA A SSLA','{id : 46,descripcion : \"SSLA\",color : \"#ff0000\"}','{id : 46,descripcion : \"SSLA\",color : \"#ff0000\"}'),(852,3,'ELIMINAR','2017-10-22 23:23:20','SALA','SE HA ELIMINADO UNA SALA CUYA DESCRIPCION FUE REGISTRADA COMO SSLA','{id : 46,descripcion : \"SSLA\",color : \"#ff0000\"}',NULL),(853,0,'INSERTAR','2017-10-22 23:23:44','TIPO DE TRIBUNAL','SE HA REGISTRADO UN TIPO DE TRIBUNAL COMO DFDJFDF',NULL,'{id : 4,descripcion : \"DFDJFDF\",}'),(854,0,'ELIMINAR','2017-10-22 23:23:54','TIPO DE TRIBUNAL','SE HA ELIMINADO UN TIPO DE TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO DFDJFDF','{id : 4,descripcion : \"DFDJFDF\",}',NULL),(855,0,'INSERTAR','2017-10-22 23:24:09','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO SSFD',NULL,'{id : 12,numero : \"SSFD\",id_tipo_tribunal : \"1\"}'),(856,0,'ELIMINAR','2017-10-22 23:24:18','TRIBUNAL','SE HA ELIMINADO UNA TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO SSFD','{id : 12,numero : \"SSFD\",id_tipo_tribunal : \"1\"}',NULL),(857,0,'INSERTAR','2017-10-22 23:24:36','ACTIVIDAD','SE HA REGISTRADO UNA ACTIVIDAD COMO SJSJSJS',NULL,'{id : 8,actividad : \"SJSJSJS\",id_tipo_tribunal : \"1\"}'),(858,0,'ELIMINAR','2017-10-22 23:24:45','ACTIVIDAD','SE HA ELIMINADO UNA ACTIVIDAD CUYA DESCRIPCION FUE REGISTRADA COMO SJSJSJS','{id : 8,actividad : \"SJSJSJS\",id_tipo_tribunal : \"1\"}',NULL),(859,3,'MODIFICAR','2017-10-23 19:02:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(860,3,'MODIFICAR','2017-10-23 19:02:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(861,3,'MODIFICAR','2017-10-23 19:02:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(862,3,'MODIFICAR','2017-10-23 19:02:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(863,3,'MODIFICAR','2017-10-23 19:02:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(864,3,'MODIFICAR','2017-10-23 19:02:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(865,3,'MODIFICAR','2017-10-23 19:05:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(866,3,'MODIFICAR','2017-10-23 19:05:11','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(867,3,'MODIFICAR','2017-10-23 19:05:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(868,3,'MODIFICAR','2017-10-23 19:05:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(869,3,'MODIFICAR','2017-10-23 19:05:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(870,3,'MODIFICAR','2017-10-23 19:05:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(871,3,'MODIFICAR','2017-10-23 19:07:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(872,3,'MODIFICAR','2017-10-23 19:07:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(873,3,'MODIFICAR','2017-10-23 19:08:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(874,3,'MODIFICAR','2017-10-23 19:08:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(875,3,'MODIFICAR','2017-10-23 19:08:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(876,3,'MODIFICAR','2017-10-23 19:08:06','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(877,3,'MODIFICAR','2017-10-23 19:09:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(878,3,'MODIFICAR','2017-10-23 19:09:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(879,3,'MODIFICAR','2017-10-23 19:09:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(880,3,'MODIFICAR','2017-10-23 19:09:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(881,3,'MODIFICAR','2017-10-23 19:09:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(882,3,'MODIFICAR','2017-10-23 19:09:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(883,3,'MODIFICAR','2017-10-23 19:10:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(884,3,'MODIFICAR','2017-10-23 19:10:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(885,3,'MODIFICAR','2017-10-23 19:10:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(886,3,'MODIFICAR','2017-10-23 19:10:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(887,3,'MODIFICAR','2017-10-23 19:12:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(888,3,'MODIFICAR','2017-10-23 19:12:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(889,3,'MODIFICAR','2017-10-23 19:12:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(890,3,'MODIFICAR','2017-10-23 19:12:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(891,3,'MODIFICAR','2017-10-23 19:16:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(892,3,'MODIFICAR','2017-10-23 19:16:34','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(893,3,'MODIFICAR','2017-10-23 19:16:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(894,3,'MODIFICAR','2017-10-23 19:16:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(895,3,'MODIFICAR','2017-10-23 19:18:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(896,3,'MODIFICAR','2017-10-23 19:18:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(897,3,'MODIFICAR','2017-10-23 19:18:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(898,3,'MODIFICAR','2017-10-23 19:18:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(899,3,'MODIFICAR','2017-10-23 19:19:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(900,3,'MODIFICAR','2017-10-23 19:19:13','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(901,3,'MODIFICAR','2017-10-23 19:19:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(902,3,'MODIFICAR','2017-10-23 19:19:14','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(903,3,'MODIFICAR','2017-10-23 19:19:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(904,3,'MODIFICAR','2017-10-23 19:19:20','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(905,3,'MODIFICAR','2017-10-23 19:21:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(906,3,'MODIFICAR','2017-10-23 19:21:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(907,3,'MODIFICAR','2017-10-23 19:22:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(908,3,'MODIFICAR','2017-10-23 19:22:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(909,3,'MODIFICAR','2017-10-23 19:22:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(910,3,'MODIFICAR','2017-10-23 19:22:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(911,3,'MODIFICAR','2017-10-23 19:22:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(912,3,'MODIFICAR','2017-10-23 19:22:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(913,3,'MODIFICAR','2017-10-23 19:24:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(914,3,'MODIFICAR','2017-10-23 19:24:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(915,3,'MODIFICAR','2017-10-23 19:24:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(916,3,'MODIFICAR','2017-10-23 19:24:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(917,3,'MODIFICAR','2017-10-23 19:24:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(918,3,'MODIFICAR','2017-10-23 19:24:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(919,3,'MODIFICAR','2017-10-23 19:29:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(920,3,'MODIFICAR','2017-10-23 19:29:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(921,3,'MODIFICAR','2017-10-23 19:31:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(922,3,'MODIFICAR','2017-10-23 19:31:09','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(923,3,'MODIFICAR','2017-10-23 19:31:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(924,3,'MODIFICAR','2017-10-23 19:31:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(925,3,'MODIFICAR','2017-10-23 19:31:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(926,3,'MODIFICAR','2017-10-23 19:31:17','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(927,3,'MODIFICAR','2017-10-23 19:32:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(928,3,'MODIFICAR','2017-10-23 19:32:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(929,3,'MODIFICAR','2017-10-23 19:37:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(930,3,'MODIFICAR','2017-10-23 19:37:47','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(931,3,'MODIFICAR','2017-10-23 19:42:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(932,3,'MODIFICAR','2017-10-23 19:42:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(933,3,'MODIFICAR','2017-10-23 19:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(934,3,'MODIFICAR','2017-10-23 19:44:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(935,3,'MODIFICAR','2017-10-23 19:45:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(936,3,'MODIFICAR','2017-10-23 19:45:16','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(937,3,'MODIFICAR','2017-10-23 19:45:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(938,3,'MODIFICAR','2017-10-23 19:45:27','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(939,3,'MODIFICAR','2017-10-23 19:47:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(940,3,'MODIFICAR','2017-10-23 19:47:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(941,3,'MODIFICAR','2017-10-23 19:47:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(942,3,'MODIFICAR','2017-10-23 19:47:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(943,3,'MODIFICAR','2017-10-23 19:47:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(944,3,'MODIFICAR','2017-10-23 19:47:48','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(945,3,'MODIFICAR','2017-10-23 19:48:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(946,3,'MODIFICAR','2017-10-23 19:48:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(947,3,'MODIFICAR','2017-10-23 19:48:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(948,3,'MODIFICAR','2017-10-23 19:48:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(949,3,'MODIFICAR','2017-10-23 19:48:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(950,3,'MODIFICAR','2017-10-23 19:48:58','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(951,3,'MODIFICAR','2017-10-23 19:57:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(952,3,'MODIFICAR','2017-10-23 19:57:30','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(953,3,'MODIFICAR','2017-10-23 19:57:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(954,3,'MODIFICAR','2017-10-23 19:57:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(955,3,'MODIFICAR','2017-10-23 19:57:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(956,3,'MODIFICAR','2017-10-23 19:57:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(957,3,'MODIFICAR','2017-10-23 19:59:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(958,3,'MODIFICAR','2017-10-23 19:59:04','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(959,3,'MODIFICAR','2017-10-23 19:59:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(960,3,'MODIFICAR','2017-10-23 19:59:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(961,3,'MODIFICAR','2017-10-23 20:06:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(962,3,'MODIFICAR','2017-10-23 20:06:35','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(963,3,'MODIFICAR','2017-10-23 20:06:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(964,3,'MODIFICAR','2017-10-23 20:06:37','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(965,3,'MODIFICAR','2017-10-23 20:06:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(966,3,'MODIFICAR','2017-10-23 20:06:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(967,3,'MODIFICAR','2017-10-23 20:07:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(968,3,'MODIFICAR','2017-10-23 20:07:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(969,3,'MODIFICAR','2017-10-23 20:07:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(970,3,'MODIFICAR','2017-10-23 20:07:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(971,3,'MODIFICAR','2017-10-23 20:12:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(972,3,'MODIFICAR','2017-10-23 20:12:07','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(973,3,'MODIFICAR','2017-10-23 20:12:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(974,3,'MODIFICAR','2017-10-23 20:12:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(975,3,'MODIFICAR','2017-10-23 20:12:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(976,3,'MODIFICAR','2017-10-23 20:12:18','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(977,3,'MODIFICAR','2017-10-23 20:19:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(978,3,'MODIFICAR','2017-10-23 20:19:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(979,3,'MODIFICAR','2017-10-23 20:19:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(980,3,'MODIFICAR','2017-10-23 20:19:46','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(981,3,'MODIFICAR','2017-10-23 20:19:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(982,3,'MODIFICAR','2017-10-23 20:19:54','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(983,3,'MODIFICAR','2017-10-23 20:26:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(984,3,'MODIFICAR','2017-10-23 20:26:24','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(985,3,'MODIFICAR','2017-10-23 20:28:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(986,3,'MODIFICAR','2017-10-23 20:28:00','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(987,3,'MODIFICAR','2017-10-23 20:30:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES EXP-002: JUICIO DE PRESENTACION Y SU ESTATUS ES FINALIZADO','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}','{id : 8,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T16:30:00\",descripcion : \"EXP-002: JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 7}'),(988,3,'MODIFICAR','2017-10-23 20:30:43','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(989,3,'MODIFICAR','2017-10-23 20:32:39','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(990,3,'MODIFICAR','2017-10-23 20:35:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(991,3,'MODIFICAR','2017-10-23 20:47:22','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(992,3,'MODIFICAR','2017-10-23 20:47:23','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(993,3,'MODIFICAR','2017-10-23 20:51:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(994,3,'MODIFICAR','2017-10-23 20:51:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(995,3,'MODIFICAR','2017-10-23 20:55:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(996,3,'MODIFICAR','2017-10-23 20:55:01','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(997,3,'MODIFICAR','2017-10-23 20:57:52','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES ASIGNADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(998,3,'MODIFICAR','2017-10-23 21:01:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-23T08:30:00 CUYA DESCRIPCION ES DESCRIPCION20 Y SU ESTATUS ES FINALIZADO','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}','{id : 9,inicio : \"2017-10-23T08:30:00\",fin : \"2017-10-23T17:00:00\",descripcion : \"DESCRIPCION20\",id_sala : 5,id_tribunal : 6}'),(999,0,'INSERTAR','2017-10-23 23:00:50','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-003',NULL,'{id : 3,numero : \"EXP-003\",descripcion : \"DESCR\"}'),(1000,1,'INSERTAR','2017-10-23 23:01:15','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-24T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 10,inicio : \"2017-10-24T09:00:00\",fin : \"2017-10-24T15:00:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 4}'),(1001,1,'INSERTAR','2017-10-23 23:01:36','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-24T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 11,inicio : \"2017-10-24T08:30:00\",fin : \"2017-10-24T16:00:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 7}'),(1002,1,'INSERTAR','2017-10-23 23:01:59','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-24T09:00:00 CUYA DESCRIPCION ES DESCRIPCION 4 Y SU ESTATUS ES ASIGNADO',NULL,'{id : 12,inicio : \"2017-10-24T09:00:00\",fin : \"2017-10-24T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}'),(1003,1,'INSERTAR','2017-10-26 00:14:47','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-26T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 13,inicio : \"2017-10-26T08:30:00\",fin : \"2017-10-26T15:30:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 3}'),(1004,1,'INSERTAR','2017-10-26 00:15:13','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-26T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 14,inicio : \"2017-10-26T09:00:00\",fin : \"2017-10-26T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}'),(1005,1,'INSERTAR','2017-10-26 00:15:52','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-26T09:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 15,inicio : \"2017-10-26T09:00:00\",fin : \"2017-10-26T13:00:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 3}'),(1006,1,'MODIFICAR','2017-10-26 00:21:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ESPERA','{id : 14,inicio : \"2017-10-26T09:00:00\",fin : \"2017-10-26T16:30:00\",descripcion : \"DESCRIPCION\",id_sala : 2,id_tribunal : 6}','{id : 14,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 6}'),(1007,1,'ELIMINAR','2017-10-26 00:47:54','ACTO','','{id : 15,inicio : \"2017-10-26T09:00:00\",fin : \"2017-10-26T13:00:00\",descripcion : \"DESCRIPCION\",id_sala : 5,id_tribunal : 3}',NULL),(1008,1,'INSERTAR','2017-10-26 01:04:13','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-26T09:00:00 CUYA DESCRIPCION ES ACTO DE PRESENTACION Y SU ESTATUS ES ASIGNADO',NULL,'{id : 16,inicio : \"2017-10-26T09:00:00\",fin : \"2017-10-26T13:30:00\",descripcion : \"ACTO DE PRESENTACION\",id_sala : 4,id_tribunal : 6}'),(1009,0,'INSERTAR','2017-10-26 03:05:48','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-004',NULL,'{id : 4,numero : \"EXP-004\",descripcion : \"ROBO\"}'),(1010,1,'INSERTAR','2017-10-26 03:06:46','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-26T09:00:00 CUYA DESCRIPCION ES PRIMERA  AUDIENCIA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 17,inicio : \"2017-10-26T09:00:00\",fin : \"2017-10-26T14:30:00\",descripcion : \"PRIMERA  AUDIENCIA\",id_sala : 2,id_tribunal : 1}'),(1011,1,'INSERTAR','2017-10-26 03:09:12','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-10-27T09:00:00 CUYA DESCRIPCION ES DESC Y SU ESTATUS ES ASIGNADO',NULL,'{id : 18,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T15:30:00\",descripcion : \"DESC\",id_sala : 2,id_tribunal : 7}'),(1012,1,'MODIFICAR','2017-10-26 03:09:42','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESC Y SU ESTATUS ES ESPERA','{id : 18,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T15:30:00\",descripcion : \"DESC\",id_sala : 2,id_tribunal : 7}','{id : 18,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESC\",id_sala : 1,id_tribunal : 7}'),(1013,1,'MODIFICAR','2017-10-26 03:12:41','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:00:00 CUYA DESCRIPCION ES DESC Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESC\",id_sala : 1,id_tribunal : 7}','{id : 18,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T11:00:00\",descripcion : \"DESC\",id_sala : 2,id_tribunal : 7}'),(1014,1,'MODIFICAR','2017-10-26 03:12:44','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:00:00 CUYA DESCRIPCION ES EXP-004: JUICIO DE PRESENTACION Y SU ESTATUS ES ASIGNADO','{id : 18,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T11:00:00\",descripcion : \"DESC\",id_sala : 2,id_tribunal : 7}','{id : 18,inicio : \"2017-10-27T09:00:00\",fin : \"2017-10-27T16:00:00\",descripcion : \"EXP-004: JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 7}'),(1015,1,'MODIFICAR','2017-10-26 03:13:29','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T08:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 14,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 6}','{id : 14,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}'),(1016,1,'MODIFICAR','2017-10-26 03:13:31','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T13:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 14,inicio : \"2017-10-27T08:30:00\",fin : \"2017-10-27T10:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}','{id : 14,inicio : \"2017-10-27T13:00:00\",fin : \"2017-10-27T15:00:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}'),(1017,1,'MODIFICAR','2017-10-26 03:13:49','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:30:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ASIGNADO','{id : 14,inicio : \"2017-10-27T13:00:00\",fin : \"2017-10-27T15:00:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}','{id : 14,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T11:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}'),(1018,1,'MODIFICAR','2017-10-26 03:13:50','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:30:00 CUYA DESCRIPCION ES EXP-003: ANTESALA DE JUICIO Y SU ESTATUS ES ASIGNADO','{id : 14,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T11:30:00\",descripcion : \"DESCRIPCION\",id_sala : 3,id_tribunal : 6}','{id : 14,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T17:00:00\",descripcion : \"EXP-003: ANTESALA DE JUICIO\",id_sala : 3,id_tribunal : 6}'),(1019,1,'ELIMINAR','2017-10-26 03:14:08','ACTO','','{id : 14,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T17:00:00\",descripcion : \"EXP-003: ANTESALA DE JUICIO\",id_sala : 3,id_tribunal : 6}',NULL),(1020,1,'INSERTAR','2017-10-26 03:16:46','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES HGSJHGDSDS Y SU ESTATUS ES ESPERA',NULL,'{id : 19,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HGSJHGDSDS\",id_sala : 1,id_tribunal : 1}'),(1021,1,'MODIFICAR','2017-10-26 03:18:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:30:00 CUYA DESCRIPCION ES HGSJHGDSDS Y SU ESTATUS ES ASIGNADO','{id : 19,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HGSJHGDSDS\",id_sala : 1,id_tribunal : 1}','{id : 19,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T11:30:00\",descripcion : \"HGSJHGDSDS\",id_sala : 4,id_tribunal : 1}'),(1022,1,'MODIFICAR','2017-10-26 03:18:38','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-27T09:30:00 CUYA DESCRIPCION ES EXP-004: JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 19,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T11:30:00\",descripcion : \"HGSJHGDSDS\",id_sala : 4,id_tribunal : 1}','{id : 19,inicio : \"2017-10-27T09:30:00\",fin : \"2017-10-27T17:30:00\",descripcion : \"EXP-004: JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 1}'),(1023,1,'MODIFICAR','2017-10-26 03:23:05','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-25T09:00:00 CUYA DESCRIPCION ES DESCRIPCION 4 Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-24T09:00:00\",fin : \"2017-10-24T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-24T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}'),(1024,1,'MODIFICAR','2017-10-26 03:23:10','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-25T09:00:00 CUYA DESCRIPCION ES DESCRIPCION 4 Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-24T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}'),(1025,1,'MODIFICAR','2017-10-26 03:24:36','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-25T09:00:00 CUYA DESCRIPCION ES DESCRIPCION 4 Y SU ESTATUS ES DIFERIDA','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}'),(1026,1,'MODIFICAR','2017-10-26 03:25:08','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-25T09:00:00 CUYA DESCRIPCION ES DESCRIPCION 4 Y SU ESTATUS ES ASIGNADA','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}'),(1027,1,'MODIFICAR','2017-10-26 03:26:02','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-25T09:00:00 CUYA DESCRIPCION ES DESCRIPCION 4 Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}'),(1028,1,'MODIFICAR','2017-10-26 03:26:33','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-25T09:00:00 CUYA DESCRIPCION ES DESCRIPCION 4 Y SU ESTATUS ES DIFERIDA','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}'),(1029,1,'MODIFICAR','2017-10-26 03:27:12','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-26T08:30:00 CUYA DESCRIPCION ES DESCRIPCION 4 Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-25T09:00:00\",fin : \"2017-10-25T14:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 4,id_tribunal : 1}','{id : 12,inicio : \"2017-10-26T08:30:00\",fin : \"2017-10-26T10:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 6,id_tribunal : 1}'),(1030,1,'MODIFICAR','2017-10-26 03:27:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-10-26T08:30:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE ENTRADA Y SU ESTATUS ES ASIGNADO','{id : 12,inicio : \"2017-10-26T08:30:00\",fin : \"2017-10-26T10:30:00\",descripcion : \"DESCRIPCION 4\",id_sala : 6,id_tribunal : 1}','{id : 12,inicio : \"2017-10-26T08:30:00\",fin : \"2017-10-26T17:00:00\",descripcion : \"EXP-003: JUICIO DE ENTRADA\",id_sala : 6,id_tribunal : 1}'),(1031,1,'MODIFICAR','2017-10-26 03:28:19','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES EXP-003: JUICIO DE ENTRADA Y SU ESTATUS ES ESPERA','{id : 12,inicio : \"2017-10-26T08:30:00\",fin : \"2017-10-26T17:00:00\",descripcion : \"EXP-003: JUICIO DE ENTRADA\",id_sala : 6,id_tribunal : 1}','{id : 12,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"EXP-003: JUICIO DE ENTRADA\",id_sala : 1,id_tribunal : 1}');
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
INSERT INTO `caso` VALUES (1,'EXP-001','SE ATRAPO IN FRAGANTI AL IMPUTADO COMETIENDO ROBO A MANO ARMADA, EL IMPUTADO SE RESISTIO A SER ARRESTADO',0,'2017-10-01 19:20:40'),(2,'EXP-002','INTENTO DE HOMICIDIO CON OBJETO CORTOPUNZANTE',0,'2017-10-21 16:28:35'),(3,'EXP-003','DESCR',0,'2017-10-23 23:00:50'),(4,'EXP-004','ROBO',0,'2017-10-26 03:05:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_alguacil`
--

LOCK TABLES `caso_alguacil` WRITE;
/*!40000 ALTER TABLE `caso_alguacil` DISABLE KEYS */;
INSERT INTO `caso_alguacil` VALUES (4,'EXP-001','V-24883944',3,'ALGUACIL'),(15,'EXP-002','V-19844933',3,'ALGUACIL');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_defensor`
--

LOCK TABLES `caso_defensor` WRITE;
/*!40000 ALTER TABLE `caso_defensor` DISABLE KEYS */;
INSERT INTO `caso_defensor` VALUES (4,'EXP-001','V-20894394',1,'DEFENSOR'),(15,'EXP-002','V-20894394',1,'DEFENSOR');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_fiscal`
--

LOCK TABLES `caso_fiscal` WRITE;
/*!40000 ALTER TABLE `caso_fiscal` DISABLE KEYS */;
INSERT INTO `caso_fiscal` VALUES (5,'EXP-001','V-14859333',8,'FISCAL'),(16,'EXP-002','V-17383922',8,'FISCAL');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_imputado`
--

LOCK TABLES `caso_imputado` WRITE;
/*!40000 ALTER TABLE `caso_imputado` DISABLE KEYS */;
INSERT INTO `caso_imputado` VALUES (5,'EXP-001','V-12849847',4,'IMPUTADO'),(16,'EXP-002','V-23485533',4,'IMPUTADO'),(17,'EXP-003','V-12849847',4,'IMPUTADO'),(18,'EXP-004','V-12849847',4,'IMPUTADO');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_juez`
--

LOCK TABLES `caso_juez` WRITE;
/*!40000 ALTER TABLE `caso_juez` DISABLE KEYS */;
INSERT INTO `caso_juez` VALUES (27,0,'V-4675893',5,'JUEZ'),(28,0,'V-12849333',5,'JUEZ');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_secretaria`
--

LOCK TABLES `caso_secretaria` WRITE;
/*!40000 ALTER TABLE `caso_secretaria` DISABLE KEYS */;
INSERT INTO `caso_secretaria` VALUES (4,'EXP-001','V-12384954',2,'SECRETARIA'),(15,'EXP-002','V-12849331',2,'SECRETARIA');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_testigo`
--

LOCK TABLES `caso_testigo` WRITE;
/*!40000 ALTER TABLE `caso_testigo` DISABLE KEYS */;
INSERT INTO `caso_testigo` VALUES (3,'EXP-001','V-12849344',7,'TESTIGO'),(14,'EXP-002','V-12849344',7,'TESTIGO');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_victima`
--

LOCK TABLES `caso_victima` WRITE;
/*!40000 ALTER TABLE `caso_victima` DISABLE KEYS */;
INSERT INTO `caso_victima` VALUES (6,'EXP-001','V-12893944',6,'VICTIMA'),(7,'EXP-001','V-12849844',6,'VICTIMA'),(18,'EXP-002','V-12938443',6,'VICTIMA'),(19,'EXP-003','V-12849844',6,'VICTIMA'),(20,'EXP-004','V-12938443',6,'VICTIMA');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor`
--

LOCK TABLES `defensor` WRITE;
/*!40000 ALTER TABLE `defensor` DISABLE KEYS */;
INSERT INTO `defensor` VALUES (1,'V-21301059','PUBLICO','8298208'),(2,'V-20894394','PRIVADO','883488493'),(3,'V-20193932','PUBLICO','488484848'),(4,'V-12783944','PUBLICO','378337732'),(5,'V-17834993','PRIVADO','38388448');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscal`
--

LOCK TABLES `fiscal` WRITE;
/*!40000 ALTER TABLE `fiscal` DISABLE KEYS */;
INSERT INTO `fiscal` VALUES (3,'V-21301060',7,0),(5,'V-21301059',9,0),(6,'V-17383922',11,0),(7,'V-18344034',1,0),(8,'V-14859333',2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imputado`
--

LOCK TABLES `imputado` WRITE;
/*!40000 ALTER TABLE `imputado` DISABLE KEYS */;
INSERT INTO `imputado` VALUES (1,'V-21301059','IMPUTADO'),(2,'V-12849847','IMPUTADO'),(3,'V-23485533','IMPUTADO');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'HolaAnthony','3.png','Que tal','V-21301059','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:28:26',0),(2,'no','3.png','nn','V-21301061','','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-23 22:28:01',1),(3,'Holacomo mestas','5.png','Gjhft','','ADMINISTRADOR','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:28:35',1),(4,'Hjj','4.png','Gh','','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:30:35',1),(5,'Ggg','4.png','Hg','','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:31:14',1),(6,'Hftvfyvg','4.png','Hgr','','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:31:34',1),(7,'Hgfy','3.png','Vcg','V-21301059','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:31:52',1),(8,'Vgg','3.png','Hgt','V-21301059','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:32:48',1),(9,'k','4.png','k','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-23 22:33:03',1),(10,'Vg','4.png','Hh','','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:33:19',1),(11,'Hlla','3.png','Hshs','V-21301059','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:33:33',1),(12,'Gff','5.png','Hgt','','ADMINISTRADOR','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:33:51',1),(13,'khkjhk12gh','4.png','lkjl','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-23 22:35:14',1),(14,'Holacomo mestas','4.png','T','','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:35:30',1),(15,'Hhh','4.png','Ggt','','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:43:38',0),(16,'Chao','4.png','Hh','','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:43:32',0),(17,'Hola','4.png','Hola','','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:43:27',0),(18,'jjj','4.png','jj','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-23 22:43:23',0),(19,'holJ','3.png','JHKH','V-21301061','','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-23 22:42:40',1),(20,'Bd su','3.png','D','V-21301059','','JUAN MANUEL GONZALEZ PEREZ','192.168.1.6','notificacion','2017-10-23 22:43:18',0),(21,'Hola','3.png','hOla','V-21301059','','MILDRED DE JESUS VARGAS JUAREZ','192.168.1.2','notificacion','2017-10-23 23:27:44',1),(22,'Hola','4.png','Hoola','','','ANTHONY JOSE MEDINA FUENTES','192.168.1.8','notificacion','2017-10-25 23:24:23',1),(23,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 14 DE LA CAUSA EXP-003 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-26 00:21:41',1),(24,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 15 DE LA CAUSA EXP-002 DE FECHA 26/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-26 00:47:54',1),(25,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 18 DE LA CAUSA EXP-004 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-26 03:11:17',0),(26,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO UN ACTO','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO EL ACTO NUMERO 14 DE LA CAUSA EXP-003 DE FECHA 27/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-26 03:14:58',0),(27,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA DIFERIDO EL ACTO NUMERO 12 DE LA CAUSA EXP-003 DE FECHA 25/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-26 03:24:36',1),(28,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA DIFERIDO EL ACTO NUMERO 12 DE LA CAUSA EXP-003 DE FECHA 25/10/2017','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-26 03:26:33',1),(29,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 12 DE LA CAUSA EXP-003 DE FECHA Invalid date EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.2','notificacion','2017-10-26 03:28:19',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones_usuario`
--

LOCK TABLES `notificaciones_usuario` WRITE;
/*!40000 ALTER TABLE `notificaciones_usuario` DISABLE KEYS */;
INSERT INTO `notificaciones_usuario` VALUES (6,4,'V-29355522',1),(7,4,'V-21301062',1),(10,5,'V-29355522',1),(11,5,'V-21301062',1),(14,6,'V-29355522',1),(15,6,'V-21301062',0),(20,9,'V-29355522',1),(21,9,'V-21301062',1),(23,10,'V-21301061',0),(24,10,'V-29355522',1),(25,10,'V-21301062',1),(30,13,'V-29355522',1),(31,13,'V-21301062',1),(34,14,'V-29355522',1),(35,14,'V-21301062',1),(37,15,'V-21301061',0),(38,15,'V-29355522',1),(39,15,'V-21301062',1),(41,16,'V-21301061',0),(42,16,'V-29355522',1),(43,16,'V-21301062',0),(46,17,'V-29355522',1),(47,17,'V-21301062',0),(50,18,'V-29355522',1),(51,18,'V-21301062',0),(52,19,'V-21301061',0),(56,22,'V-21301061',1),(57,22,'V-29355522',1),(58,22,'V-21301062',1),(59,23,'V-21301059',0),(60,24,'V-21301059',0),(61,25,'V-21301059',0),(62,26,'V-21301059',0),(63,27,'V-21301059',1),(64,28,'V-21301059',1),(65,29,'V-21301059',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_tipo`
--

LOCK TABLES `persona_tipo` WRITE;
/*!40000 ALTER TABLE `persona_tipo` DISABLE KEYS */;
INSERT INTO `persona_tipo` VALUES (1,'V-21301059',9),(2,'V-21301061',9),(3,'V-29355522',9),(4,'V-21301062',9),(5,'V-20894394',1),(6,'V-20193932',1),(7,'V-12783944',1),(8,'V-17834993',1),(9,'V-12884894',5),(10,'V-18943933',5),(11,'V-4675893',5),(12,'V-12849333',5),(13,'V-18940594',3),(14,'V-19844933',3),(15,'V-24883944',3),(16,'V-12893004',3),(17,'V-12849331',2),(18,'V-12384954',2),(19,'V-8903944',2),(20,'V-17383922',8),(21,'V-18344034',8),(22,'V-14859333',8),(23,'V-12893944',6),(24,'V-12849844',6),(25,'V-12849847',4),(26,'V-12849344',7),(27,'V-23485533',4),(28,'V-12938443',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretaria`
--

LOCK TABLES `secretaria` WRITE;
/*!40000 ALTER TABLE `secretaria` DISABLE KEYS */;
INSERT INTO `secretaria` VALUES (4,'V-12384954'),(3,'V-12849331'),(2,'V-21301060'),(5,'V-8903944');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testigo`
--

LOCK TABLES `testigo` WRITE;
/*!40000 ALTER TABLE `testigo` DISABLE KEYS */;
INSERT INTO `testigo` VALUES (1,'V-21301059',0),(2,'V-12849344',0);
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
INSERT INTO `usuario` VALUES (1,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd','icon-user.png','ADMINISTRADOR',0,'2017-10-01 23:01:49'),(3,'V-21301061','459f8140b2d1fb5df5af039c301f09d4cb88b7a1','icon-user.png','USUARIO ESPECIAL',NULL,'2017-10-22 20:39:46'),(4,'V-29355522','8c886f47c17317dd6809341353e1a1eb64288c1b','icon-user.png','USUARIO COMUN',NULL,'2017-10-21 14:41:02'),(5,'V-21301062','bf0c261aac38cbdc59337cd40f0201a07dc8ac8d','icon-user.png','SECRETARIA',NULL,'2017-10-23 23:23:59');
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

-- Dump completed on 2017-10-25 23:36:22
