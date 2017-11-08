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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'PRESENTACION',2,1,'2017-11-08 14:10:51'),(2,'JUICIO DE CONTROL',1,1,'2017-11-08 14:11:03');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificar_actividad` BEFORE UPDATE ON `actividad`
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_actividad` BEFORE DELETE ON `actividad`
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-11-09T08:00:00','2017-11-09T14:00:00','','EXP-001',2,1,1,'ASIGNADO',1,'2017-11-08 14:36:01'),(2,'2017-11-09T14:00:00','2017-11-09T18:00:00','','EXP-002',2,1,6,'ASIGNADO',1,'2017-11-08 14:36:21'),(3,'2017-11-09T08:00:00','2017-11-09T18:00:00','','EXP-003',2,2,1,'ASIGNADO',1,'2017-11-08 14:36:54'),(4,'2017-11-10T08:30:00','2017-11-10T15:00:00','','EXP-001',2,3,6,'ASIGNADO',1,'2017-11-08 14:37:12'),(5,'2017-11-10T10:30:00','2017-11-10T16:00:00','','EXP-002',2,6,2,'ASIGNADO',1,'2017-11-08 14:48:57'),(6,'2017-11-10T08:30:00','2017-11-10T15:00:00','','EXP-003',1,5,4,'ASIGNADO',1,'2017-11-08 14:37:56'),(7,'2017-11-11T09:00:00','2017-11-11T15:30:00','PRIMER  ACTO','EXP-003',1,4,8,'ASIGNADO',1,'2017-11-08 14:43:08'),(8,'2017-11-11T09:30:00','2017-11-11T14:30:00','','EXP-001',2,7,2,'ASIGNADO',1,'2017-11-08 14:43:32'),(9,'2017-11-11T09:30:00','2017-11-11T17:00:00','','EXP-002',1,5,4,'ASIGNADO',1,'2017-11-08 14:43:58'),(10,'2017-11-12T08:30:00','2017-11-12T14:30:00','','EXP-001',2,1,2,'ASIGNADO',1,'2017-11-08 14:44:24'),(11,'2017-11-12T08:00:00','2017-11-12T18:00:00','TODO EL DIA','EXP-003',1,6,3,'ASIGNADO',1,'2017-11-08 14:44:46'),(12,'2017-11-12T08:30:00','2017-11-12T16:30:00','','EXP-002',1,4,8,'ASIGNADO',1,'2017-11-08 14:45:06'),(13,'2017-11-08T09:00:00','2017-11-08T17:30:00','','EXP-001',2,4,7,'ASIGNADO',1,'2017-11-08 14:45:59'),(14,'2017-11-08T09:00:00','2017-11-08T15:30:00','','EXP-002',2,6,9,'ASIGNADO',1,'2017-11-08 14:46:17'),(15,'2017-11-08T08:30:00','2017-11-08T17:00:00','','EXP-003',1,10,8,'ASIGNADO',1,'2017-11-08 14:46:45'),(16,'2017-11-13T08:00:00','2017-11-13T16:00:00','','EXP-003',1,6,4,'ASIGNADO',1,'2017-11-08 14:47:29'),(17,'2017-11-13T09:00:00','2017-11-13T16:30:00','','EXP-002',2,3,2,'ASIGNADO',1,'2017-11-08 14:47:52'),(18,'2017-11-13T09:30:00','2017-11-13T17:30:00','','EXP-001',2,8,6,'ASIGNADO',1,'2017-11-08 14:48:13'),(19,'0000-00-00T00:00:00','0000-00-00T00:00:00','DESCRIPCION','EXP-001',2,1,1,'ESPERA',1,'2017-11-08 15:07:57'),(20,'0000-00-00T00:00:00','0000-00-00T00:00:00','','EXP-001',2,1,2,'ESPERA',1,'2017-11-08 15:06:59'),(21,'0000-00-00T00:00:00','0000-00-00T00:00:00','','EXP-002',1,1,10,'ESPERA',1,'2017-11-08 15:07:22'),(22,'0000-00-00T00:00:00','0000-00-00T00:00:00','','EXP-003',1,1,4,'ESPERA',1,'2017-11-08 15:07:41');
/*!40000 ALTER TABLE `acto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_acto` AFTER INSERT ON `acto`
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_acto` BEFORE DELETE ON `acto`
 FOR EACH ROW BEGIN
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alguacil`
--

LOCK TABLES `alguacil` WRITE;
/*!40000 ALTER TABLE `alguacil` DISABLE KEYS */;
INSERT INTO `alguacil` VALUES (2,'V-21301059'),(1,'V-21301823'),(3,'V-21392343');
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,0,'INSERTAR','2017-11-08 13:58:39','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301059 Y NOMBRE ES ANTHONY JOSE MEDINA FUENTES',NULL,'{id : 1,cedula : \"V-21301059\",nombres : \"ANTHONY JOSE\"apellidos : \"MEDINA FUENTES\"email : \"ANTHONYJMEDINAF@GMAIL.COM\"telefono : \"+584263575489\"fecha_de_nacimiento : \"20/10/1993\"}'),(2,1,'INSERTAR','2017-11-08 13:59:43','SALA','SE HA REGISTRADO UNA SALA COMO SALA A-1',NULL,'{id : 1,descripcion : \"SALA A-1\",color : \"#ffee00\"}'),(3,1,'INSERTAR','2017-11-08 14:00:01','SALA','SE HA REGISTRADO UNA SALA COMO SALA A-4',NULL,'{id : 2,descripcion : \"SALA A-4\",color : \"#009cee\"}'),(4,1,'MODIFICAR','2017-11-08 14:00:29','SALA','SE HA CAMBIADO NOMBRE DE SALA A-1 A SALA 1A','{id : 1,descripcion : \"SALA A-1\",color : \"#ffee00\"}','{id : 1,descripcion : \"SALA 1A\",color : \"#ffee00\"}'),(5,1,'MODIFICAR','2017-11-08 14:00:48','SALA','SE HA CAMBIADO NOMBRE DE SALA A-4 A SALA 2A','{id : 2,descripcion : \"SALA A-4\",color : \"#009cee\"}','{id : 2,descripcion : \"SALA 2A\",color : \"#009cee\"}'),(6,1,'INSERTAR','2017-11-08 14:01:08','SALA','SE HA REGISTRADO UNA SALA COMO SALA 3A',NULL,'{id : 3,descripcion : \"SALA 3A\",color : \"#ff0036\"}'),(7,1,'INSERTAR','2017-11-08 14:01:28','SALA','SE HA REGISTRADO UNA SALA COMO SALA 3B',NULL,'{id : 4,descripcion : \"SALA 3B\",color : \"#6f0963\"}'),(8,1,'INSERTAR','2017-11-08 14:01:46','SALA','SE HA REGISTRADO UNA SALA COMO SALA 2B',NULL,'{id : 5,descripcion : \"SALA 2B\",color : \"#ff0000\"}'),(9,1,'INSERTAR','2017-11-08 14:02:07','SALA','SE HA REGISTRADO UNA SALA COMO SALA 1',NULL,'{id : 6,descripcion : \"SALA 1\",color : \"#ff00fe\"}'),(10,1,'INSERTAR','2017-11-08 14:02:23','SALA','SE HA REGISTRADO UNA SALA COMO SALA 2',NULL,'{id : 7,descripcion : \"SALA 2\",color : \"#2c3d93\"}'),(11,1,'INSERTAR','2017-11-08 14:02:43','SALA','SE HA REGISTRADO UNA SALA COMO SALA 3',NULL,'{id : 8,descripcion : \"SALA 3\",color : \"#27685b\"}'),(12,1,'INSERTAR','2017-11-08 14:03:02','SALA','SE HA REGISTRADO UNA SALA COMO SALA 3C',NULL,'{id : 9,descripcion : \"SALA 3C\",color : \"#ca00ff\"}'),(13,1,'INSERTAR','2017-11-08 14:03:17','SALA','SE HA REGISTRADO UNA SALA COMO SALA 4',NULL,'{id : 10,descripcion : \"SALA 4\",color : \"#0d7309\"}'),(14,1,'INSERTAR','2017-11-08 14:04:41','TIPO DE TRIBUNAL','SE HA REGISTRADO UN TIPO DE TRIBUNAL COMO TRIBUNAL DE GUARDIA DE CONTROL',NULL,'{id : 1,descripcion : \"TRIBUNAL DE GUARDIA DE CONTROL\",}'),(15,1,'INSERTAR','2017-11-08 14:05:13','TIPO DE TRIBUNAL','SE HA REGISTRADO UN TIPO DE TRIBUNAL COMO TRIBUNAL DE PRESENTACION',NULL,'{id : 2,descripcion : \"TRIBUNAL DE PRESENTACION\",}'),(16,1,'INSERTAR','2017-11-08 14:05:24','TIPO DE TRIBUNAL','SE HA REGISTRADO UN TIPO DE TRIBUNAL COMO TRIBUNAL ITINERANTE',NULL,'{id : 3,descripcion : \"TRIBUNAL ITINERANTE\",}'),(17,1,'INSERTAR','2017-11-08 14:06:10','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 1',NULL,'{id : 1,numero : \"TRIBUNAL 1\",id_tipo_tribunal : \"1\"}'),(18,1,'INSERTAR','2017-11-08 14:06:23','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 2',NULL,'{id : 2,numero : \"TRIBUNAL 2\",id_tipo_tribunal : \"1\"}'),(19,1,'INSERTAR','2017-11-08 14:06:34','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 3',NULL,'{id : 3,numero : \"TRIBUNAL 3\",id_tipo_tribunal : \"2\"}'),(20,1,'INSERTAR','2017-11-08 14:06:47','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 4',NULL,'{id : 4,numero : \"TRIBUNAL 4\",id_tipo_tribunal : \"2\"}'),(21,1,'INSERTAR','2017-11-08 14:07:03','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 7',NULL,'{id : 5,numero : \"TRIBUNAL 7\",id_tipo_tribunal : \"3\"}'),(22,1,'INSERTAR','2017-11-08 14:07:20','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 18',NULL,'{id : 6,numero : \"TRIBUNAL 18\",id_tipo_tribunal : \"1\"}'),(23,1,'INSERTAR','2017-11-08 14:07:32','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 17',NULL,'{id : 7,numero : \"TRIBUNAL 17\",id_tipo_tribunal : \"1\"}'),(24,1,'INSERTAR','2017-11-08 14:07:49','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 19',NULL,'{id : 8,numero : \"TRIBUNAL 19\",id_tipo_tribunal : \"2\"}'),(25,1,'INSERTAR','2017-11-08 14:08:01','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 20',NULL,'{id : 9,numero : \"TRIBUNAL 20\",id_tipo_tribunal : \"1\"}'),(26,1,'INSERTAR','2017-11-08 14:08:15','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 21',NULL,'{id : 10,numero : \"TRIBUNAL 21\",id_tipo_tribunal : \"2\"}'),(27,1,'INSERTAR','2017-11-08 14:08:34','TRIBUNAL','SE HA REGISTRADO UN TRIBUNAL COMO TRIBUNAL 10',NULL,'{id : 11,numero : \"TRIBUNAL 10\",id_tipo_tribunal : \"3\"}'),(28,1,'ELIMINAR','2017-11-08 14:09:43','TRIBUNAL','SE HA ELIMINADO UNA TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO TRIBUNAL 10','{id : 11,numero : \"TRIBUNAL 10\",id_tipo_tribunal : \"3\"}',NULL),(29,1,'ELIMINAR','2017-11-08 14:09:57','TRIBUNAL','SE HA ELIMINADO UNA TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO TRIBUNAL 7','{id : 5,numero : \"TRIBUNAL 7\",id_tipo_tribunal : \"3\"}',NULL),(30,1,'ELIMINAR','2017-11-08 14:10:15','TIPO DE TRIBUNAL','SE HA ELIMINADO UN TIPO DE TRIBUNAL CUYA DESCRIPCION FUE REGISTRADA COMO TRIBUNAL ITINERANTE','{id : 3,descripcion : \"TRIBUNAL ITINERANTE\",}',NULL),(31,1,'INSERTAR','2017-11-08 14:10:51','ACTIVIDAD','SE HA REGISTRADO UNA ACTIVIDAD COMO PRESENTACION',NULL,'{id : 1,actividad : \"PRESENTACION\",id_tipo_tribunal : \"2\"}'),(32,1,'INSERTAR','2017-11-08 14:11:03','ACTIVIDAD','SE HA REGISTRADO UNA ACTIVIDAD COMO JUICIO DE CONTROL',NULL,'{id : 2,actividad : \"JUICIO DE CONTROL\",id_tipo_tribunal : \"1\"}'),(33,1,'INSERTAR','2017-11-08 14:12:23','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301060 Y NOMBRE ES MARIALA PEREZ',NULL,'{id : 2,cedula : \"V-21301060\",nombres : \"MARIALA\"apellidos : \"PEREZ\"email : \"MARIELAPEREZ@GMAIL.COM\"telefono : \"+582382083082\"fecha_de_nacimiento : \"20/10/1993\"}'),(34,1,'INSERTAR','2017-11-08 14:12:55','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301061 Y NOMBRE ES JUAN SANCHEZ',NULL,'{id : 3,cedula : \"V-21301061\",nombres : \"JUAN\"apellidos : \"SANCHEZ\"email : \"JUANPEREZ@GMAIL.COM\"telefono : \"+582320830293\"fecha_de_nacimiento : \"20/10/1992\"}'),(35,1,'INSERTAR','2017-11-08 14:13:47','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301070 Y NOMBRE ES PEDRO PEREZ',NULL,'{id : 4,cedula : \"V-21301070\",nombres : \"PEDRO\"apellidos : \"PEREZ\"email : \"PEDROPEREZ@GMAIL.COM\"telefono : \"+583490493943\"fecha_de_nacimiento : \"20/10/1992\"}'),(36,1,'INSERTAR','2017-11-08 14:14:39','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301058 Y NOMBRE ES MIGUEL SUAREZ',NULL,'{id : 5,cedula : \"V-21301058\",nombres : \"MIGUEL\"apellidos : \"SUAREZ\"email : \"MIGUELSUAREZ@GMAIL.COM\"telefono : \"+583289382893\"fecha_de_nacimiento : \"20/10/1993\"}'),(37,1,'INSERTAR','2017-11-08 14:15:18','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301043 Y NOMBRE ES KAUSTICA MEDINA',NULL,'{id : 6,cedula : \"V-21301043\",nombres : \"KAUSTICA\"apellidos : \"MEDINA\"email : \"KAUSTICAMEDINA@GMAIL.COM\"telefono : \"+588232908302\"fecha_de_nacimiento : \"20/10/1992\"}'),(38,1,'INSERTAR','2017-11-08 14:15:49','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-22384332 Y NOMBRE ES MANUEL GONZALEZ',NULL,'{id : 7,cedula : \"V-22384332\",nombres : \"MANUEL\"apellidos : \"GONZALEZ\"email : \"MANUELGON@GMAIL.COM\"telefono : \"+580392930920\"fecha_de_nacimiento : \"20/10/1992\"}'),(39,1,'INSERTAR','2017-11-08 14:16:35','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301823 Y NOMBRE ES SUSANA GONZALES',NULL,'{id : 8,cedula : \"V-21301823\",nombres : \"SUSANA\"apellidos : \"GONZALES\"email : \"SUSAN_23_23@GMAIL.COM\"telefono : \"+582839283232\"fecha_de_nacimiento : \"20/10/1992\"}'),(40,1,'INSERTAR','2017-11-08 14:17:14','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21392343 Y NOMBRE ES JUAN JIMENEZ',NULL,'{id : 10,cedula : \"V-21392343\",nombres : \"JUAN\"apellidos : \"JIMENEZ\"email : \"JUANJOPE@GMAIL.COM\"telefono : \"+589234982343\"fecha_de_nacimiento : \"20/10/1992\"}'),(41,1,'INSERTAR','2017-11-08 14:18:27','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-29323222 Y NOMBRE ES MILAGROS CUICAS',NULL,'{id : 11,cedula : \"V-29323222\",nombres : \"MILAGROS\"apellidos : \"CUICAS\"email : \"MILAGROSCUICAS@GMAIL.COM\"telefono : \"+588782328323\"fecha_de_nacimiento : \"20/10/1992\"}'),(42,1,'INSERTAR','2017-11-08 14:19:04','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21382343 Y NOMBRE ES JUAN MIJAREZ',NULL,'{id : 12,cedula : \"V-21382343\",nombres : \"JUAN\"apellidos : \"MIJAREZ\"email : \"JUANMIJAREZ@GMAIL.COM\"telefono : \"+583823923232\"fecha_de_nacimiento : \"20/10/1992\"}'),(43,1,'INSERTAR','2017-11-08 14:19:43','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-21301033 Y NOMBRE ES MANUEL LOPEZ',NULL,'{id : 13,cedula : \"V-21301033\",nombres : \"MANUEL\"apellidos : \"LOPEZ\"email : \"JUANJEMANUEL@GMAIL.COM\"telefono : \"+583984343434\"fecha_de_nacimiento : \"20/10/1992\"}'),(44,1,'INSERTAR','2017-11-08 14:22:02','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-22839332 Y NOMBRE ES DULCE MARIA SUAREZ',NULL,'{id : 14,cedula : \"V-22839332\",nombres : \"DULCE MARIA\"apellidos : \"SUAREZ\"email : \"DULCE@GMAIL.COM\"telefono : \"+583838393833\"fecha_de_nacimiento : \"20/10/1992\"}'),(45,1,'INSERTAR','2017-11-08 14:22:48','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-28332882 Y NOMBRE ES MILAGROS MIKARES',NULL,'{id : 15,cedula : \"V-28332882\",nombres : \"MILAGROS\"apellidos : \"MIKARES\"email : \"MILAGROS@GMAIL.COM\"telefono : \"+583498398344\"fecha_de_nacimiento : \"20/10/1992\"}'),(46,1,'INSERTAR','2017-11-08 14:23:20','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-8389332 Y NOMBRE ES MANUEL CUICAS',NULL,'{id : 16,cedula : \"V-8389332\",nombres : \"MANUEL\"apellidos : \"CUICAS\"email : \"MANU@GMAIL.COM\"telefono : \"+583838383833\"fecha_de_nacimiento : \"20/10/1992\"}'),(47,1,'INSERTAR','2017-11-08 14:24:27','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12832233 Y NOMBRE ES CERAPIO MOACK',NULL,'{id : 18,cedula : \"V-12832233\",nombres : \"CERAPIO\"apellidos : \"MOACK\"email : \"CERAPIOMOACK@GMAIL.COM\"telefono : \"+588398434343\"fecha_de_nacimiento : \"20/10/1992\"}'),(48,1,'INSERTAR','2017-11-08 14:25:23','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-14783933 Y NOMBRE ES MANUELA ZABALA',NULL,'{id : 19,cedula : \"V-14783933\",nombres : \"MANUELA\"apellidos : \"ZABALA\"email : \"MANUELAZABALA@TSJ.GOB.VE\"telefono : \"+588989898898\"fecha_de_nacimiento : \"20/10/1992\"}'),(49,1,'INSERTAR','2017-11-08 14:27:08','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-12893904 Y NOMBRE ES EUDO EMISAEL CASTRO TAMAYO',NULL,'{id : 21,cedula : \"V-12893904\",nombres : \"EUDO EMISAEL\"apellidos : \"CASTRO TAMAYO\"email : \"EUDOEMIASALE@GMAIL.COM\"telefono : \"+583983984343\"fecha_de_nacimiento : \"20/10/1992\"}'),(50,1,'INSERTAR','2017-11-08 14:27:44','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-13834933 Y NOMBRE ES JOSE GIMENEZ',NULL,'{id : 22,cedula : \"V-13834933\",nombres : \"JOSE\"apellidos : \"GIMENEZ\"email : \"JOSEGIMEZ@GMAIL.COM\"telefono : \"+588323829382\"fecha_de_nacimiento : \"20/10/1992\"}'),(51,1,'INSERTAR','2017-11-08 14:28:18','PERSONA','SE HA REGISTRADO UNA PERSONA CON LA CEDULA  V-32883992 Y NOMBRE ES LORENA ROJAS',NULL,'{id : 23,cedula : \"V-32883992\",nombres : \"LORENA\"apellidos : \"ROJAS\"email : \"LORENAROJAS@HOTMAIL.COM\"telefono : \"+583939393984\"fecha_de_nacimiento : \"20/10/1992\"}'),(52,1,'INSERTAR','2017-11-08 14:30:13','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-001',NULL,'{id : 1,numero : \"EXP-001\",descripcion : \"HOMICIDIO\"}'),(53,1,'INSERTAR','2017-11-08 14:31:40','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-002',NULL,'{id : 2,numero : \"EXP-002\",descripcion : \"ROBO\"}'),(54,1,'INSERTAR','2017-11-08 14:32:46','CASO','SE HA REGISTRADO UN CASO CON EL NUMERO DE CAUSA EXP-003',NULL,'{id : 3,numero : \"EXP-003\",descripcion : \"DESACATO\"}'),(55,1,'INSERTAR','2017-11-08 14:36:01','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-09T08:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 1,inicio : \"2017-11-09T08:00:00\",fin : \"2017-11-09T14:00:00\",descripcion : \"\",id_sala : 1,id_tribunal : 1}'),(56,1,'INSERTAR','2017-11-08 14:36:21','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-09T14:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 2,inicio : \"2017-11-09T14:00:00\",fin : \"2017-11-09T18:00:00\",descripcion : \"\",id_sala : 1,id_tribunal : 6}'),(57,1,'INSERTAR','2017-11-08 14:36:54','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-09T08:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 3,inicio : \"2017-11-09T08:00:00\",fin : \"2017-11-09T18:00:00\",descripcion : \"\",id_sala : 2,id_tribunal : 1}'),(58,1,'INSERTAR','2017-11-08 14:37:12','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-10T08:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 4,inicio : \"2017-11-10T08:30:00\",fin : \"2017-11-10T15:00:00\",descripcion : \"\",id_sala : 3,id_tribunal : 6}'),(59,1,'INSERTAR','2017-11-08 14:37:35','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-10T10:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 5,inicio : \"2017-11-10T10:30:00\",fin : \"2017-11-10T16:00:00\",descripcion : \"\",id_sala : 6,id_tribunal : 2}'),(60,1,'INSERTAR','2017-11-08 14:37:56','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-10T08:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 6,inicio : \"2017-11-10T08:30:00\",fin : \"2017-11-10T15:00:00\",descripcion : \"\",id_sala : 5,id_tribunal : 4}'),(61,1,'INSERTAR','2017-11-08 14:43:08','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-11T09:00:00 CUYA DESCRIPCION ES PRIMER  ACTO Y SU ESTATUS ES ASIGNADO',NULL,'{id : 7,inicio : \"2017-11-11T09:00:00\",fin : \"2017-11-11T15:30:00\",descripcion : \"PRIMER  ACTO\",id_sala : 4,id_tribunal : 8}'),(62,1,'INSERTAR','2017-11-08 14:43:32','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-11T09:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 8,inicio : \"2017-11-11T09:30:00\",fin : \"2017-11-11T14:30:00\",descripcion : \"\",id_sala : 7,id_tribunal : 2}'),(63,1,'INSERTAR','2017-11-08 14:43:58','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-11T09:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 9,inicio : \"2017-11-11T09:30:00\",fin : \"2017-11-11T17:00:00\",descripcion : \"\",id_sala : 5,id_tribunal : 4}'),(64,1,'INSERTAR','2017-11-08 14:44:24','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-12T08:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 10,inicio : \"2017-11-12T08:30:00\",fin : \"2017-11-12T14:30:00\",descripcion : \"\",id_sala : 1,id_tribunal : 2}'),(65,1,'INSERTAR','2017-11-08 14:44:46','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-12T08:00:00 CUYA DESCRIPCION ES TODO EL DIA Y SU ESTATUS ES ASIGNADO',NULL,'{id : 11,inicio : \"2017-11-12T08:00:00\",fin : \"2017-11-12T18:00:00\",descripcion : \"TODO EL DIA\",id_sala : 6,id_tribunal : 3}'),(66,1,'INSERTAR','2017-11-08 14:45:06','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-12T08:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 12,inicio : \"2017-11-12T08:30:00\",fin : \"2017-11-12T16:30:00\",descripcion : \"\",id_sala : 4,id_tribunal : 8}'),(67,1,'INSERTAR','2017-11-08 14:45:59','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-08T09:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 13,inicio : \"2017-11-08T09:00:00\",fin : \"2017-11-08T17:30:00\",descripcion : \"\",id_sala : 4,id_tribunal : 7}'),(68,1,'INSERTAR','2017-11-08 14:46:17','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-08T09:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 14,inicio : \"2017-11-08T09:00:00\",fin : \"2017-11-08T15:30:00\",descripcion : \"\",id_sala : 6,id_tribunal : 9}'),(69,1,'INSERTAR','2017-11-08 14:46:45','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-08T08:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 15,inicio : \"2017-11-08T08:30:00\",fin : \"2017-11-08T17:00:00\",descripcion : \"\",id_sala : 10,id_tribunal : 8}'),(70,1,'INSERTAR','2017-11-08 14:47:29','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-13T08:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 16,inicio : \"2017-11-13T08:00:00\",fin : \"2017-11-13T16:00:00\",descripcion : \"\",id_sala : 6,id_tribunal : 4}'),(71,1,'INSERTAR','2017-11-08 14:47:52','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-13T09:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 17,inicio : \"2017-11-13T09:00:00\",fin : \"2017-11-13T16:30:00\",descripcion : \"\",id_sala : 3,id_tribunal : 2}'),(72,1,'INSERTAR','2017-11-08 14:48:13','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 2017-11-13T09:30:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ASIGNADO',NULL,'{id : 18,inicio : \"2017-11-13T09:30:00\",fin : \"2017-11-13T17:30:00\",descripcion : \"\",id_sala : 8,id_tribunal : 6}'),(73,1,'INSERTAR','2017-11-08 15:06:23','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES DESCRIPCION Y SU ESTATUS ES ESPERA',NULL,'{id : 19,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DESCRIPCION\",id_sala : 1,id_tribunal : 1}'),(74,1,'INSERTAR','2017-11-08 15:06:59','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ESPERA',NULL,'{id : 20,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"\",id_sala : 1,id_tribunal : 2}'),(75,1,'INSERTAR','2017-11-08 15:07:22','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ESPERA',NULL,'{id : 21,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"\",id_sala : 1,id_tribunal : 10}'),(76,1,'INSERTAR','2017-11-08 15:07:41','ACTO','SE HA REGISTRADO UN NUEVO ACTO PARA EL DIA 0000-00-00T00:00:00 CUYA DESCRIPCION ES  Y SU ESTATUS ES ESPERA',NULL,'{id : 22,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"\",id_sala : 1,id_tribunal : 4}');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
INSERT INTO `caso` VALUES (1,'EXP-001','HOMICIDIO',1,'2017-11-08 14:30:13'),(2,'EXP-002','ROBO',1,'2017-11-08 14:30:13'),(3,'EXP-003','DESACATO',1,'2017-11-08 14:32:46');
/*!40000 ALTER TABLE `caso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
INSERT INTO `caso_alguacil` VALUES (1,'EXP-001','V-21301823',3,'ALGUACIL'),(2,'EXP-002','V-21301059',3,'ALGUACIL'),(3,'EXP-003','V-21392343',3,'ALGUACIL');
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
INSERT INTO `caso_defensor` VALUES (1,'EXP-001','V-21301060',1,'DEFENSOR'),(2,'EXP-002','V-21301061',1,'DEFENSOR'),(3,'EXP-003','V-21301070',1,'DEFENSOR');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_fiscal`
--

LOCK TABLES `caso_fiscal` WRITE;
/*!40000 ALTER TABLE `caso_fiscal` DISABLE KEYS */;
INSERT INTO `caso_fiscal` VALUES (1,'EXP-001','V-12832233',8,'FISCAL'),(2,'EXP-002','V-14783933',8,'FISCAL'),(3,'EXP-003','V-28332882',8,'FISCAL');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_imputado`
--

LOCK TABLES `caso_imputado` WRITE;
/*!40000 ALTER TABLE `caso_imputado` DISABLE KEYS */;
INSERT INTO `caso_imputado` VALUES (1,'EXP-001','V-22839332',4,'IMPUTADO'),(2,'EXP-002','V-28332882',4,'IMPUTADO'),(3,'EXP-003','V-8389332',4,'IMPUTADO');
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
  `numero_caso` varchar(20) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '5',
  `tipo_persona` varchar(50) NOT NULL DEFAULT 'JUEZ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_juez`
--

LOCK TABLES `caso_juez` WRITE;
/*!40000 ALTER TABLE `caso_juez` DISABLE KEYS */;
INSERT INTO `caso_juez` VALUES (1,'EXP-001','V-21301058',5,'JUEZ'),(2,'EXP-002','V-21301043',5,'JUEZ'),(3,'EXP-003','V-22384332',5,'JUEZ');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_testigo`
--

LOCK TABLES `caso_testigo` WRITE;
/*!40000 ALTER TABLE `caso_testigo` DISABLE KEYS */;
INSERT INTO `caso_testigo` VALUES (1,'EXP-001','V-12893904',7,'TESTIGO'),(2,'EXP-002','V-13834933',7,'TESTIGO'),(3,'EXP-003','V-32883992',7,'TESTIGO');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_victima`
--

LOCK TABLES `caso_victima` WRITE;
/*!40000 ALTER TABLE `caso_victima` DISABLE KEYS */;
INSERT INTO `caso_victima` VALUES (1,'EXP-001','V-29323222',6,'VICTIMA'),(2,'EXP-002','V-21382343',6,'VICTIMA'),(3,'EXP-003','V-21301033',6,'VICTIMA');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor`
--

LOCK TABLES `defensor` WRITE;
/*!40000 ALTER TABLE `defensor` DISABLE KEYS */;
INSERT INTO `defensor` VALUES (1,'V-21301060','PUBLICO','1'),(2,'V-21301061','PRIVADO','0'),(3,'V-21301070','PUBLICO','2');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscal`
--

LOCK TABLES `fiscal` WRITE;
/*!40000 ALTER TABLE `fiscal` DISABLE KEYS */;
INSERT INTO `fiscal` VALUES (1,'V-12832233',1,'PRINCIPAL',7),(2,'V-14783933',2,'PRINCIPAL',2),(3,'V-28332882',9,'SUPLENTE',8);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imputado`
--

LOCK TABLES `imputado` WRITE;
/*!40000 ALTER TABLE `imputado` DISABLE KEYS */;
INSERT INTO `imputado` VALUES (1,'V-22839332','C/D'),(2,'V-28332882','S/D'),(3,'V-8389332','A/D'),(4,'V-21301070','S/D');
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
INSERT INTO `juez` VALUES (2,'V-21301043'),(1,'V-21301058'),(3,'V-22384332');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO REGISTROS EN LA TABLA DE TRIBUNAL','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO REGISTROS EN LA TABLA DE TRIBUNAL, POR FAVOR, VERIFIQUE ESTA INFORMACION EN LA BITACORA DEL SISTEMA PARA VER MAS DETALLES','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.10','notificacion','2017-11-08 14:09:43',1),(2,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO REGISTROS EN LA TABLA DE TRIBUNAL','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO REGISTROS EN LA TABLA DE TRIBUNAL, POR FAVOR, VERIFIQUE ESTA INFORMACION EN LA BITACORA DEL SISTEMA PARA VER MAS DETALLES','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.10','notificacion','2017-11-08 14:09:57',1),(3,'ANTHONY JOSE MEDINA FUENTES HA ELIMINADO REGISTROS EN LA TABLA DE TIPO DE TRIBUNAL','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA ELIMINADO REGISTROS EN LA TABLA DE TIPO DE TRIBUNAL, POR FAVOR, VERIFIQUE ESTA INFORMACION EN LA BITACORA DEL SISTEMA PARA VER MAS DETALLES','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.10','notificacion','2017-11-08 14:10:15',1),(4,'ANTHONY JOSE MEDINA FUENTES HA PUESTO UN ACTO EN ESPERA','5.png','EL USUARIO ANTHONY JOSE MEDINA FUENTES CUYA CEDULA DE IDENTIDAD ES V-21301059 HA PUESTO EL ACTO NUMERO 19 DE LA CAUSA EXP-001 EN ESPERA','','ADMINISTRADOR','ANTHONY JOSE MEDINA FUENTES','192.168.1.10','notificacion','2017-11-08 15:07:58',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones_usuario`
--

LOCK TABLES `notificaciones_usuario` WRITE;
/*!40000 ALTER TABLE `notificaciones_usuario` DISABLE KEYS */;
INSERT INTO `notificaciones_usuario` VALUES (1,1,'V-21301059',1),(2,2,'V-21301059',1),(3,3,'V-21301059',1),(4,4,'V-21301059',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'V-21301059','ANTHONY JOSE','MEDINA FUENTES','ANTHONYJMEDINAF@GMAIL.COM','+584263575489','20/10/1993',0,'2017-11-08 13:58:39'),(2,'V-21301060','MARIALA','PEREZ','MARIELAPEREZ@GMAIL.COM','+582382083082','20/10/1993',1,'2017-11-08 14:12:23'),(3,'V-21301061','JUAN','SANCHEZ','JUANPEREZ@GMAIL.COM','+582320830293','20/10/1992',1,'2017-11-08 14:12:55'),(4,'V-21301070','PEDRO','PEREZ','PEDROPEREZ@GMAIL.COM','+583490493943','20/10/1992',1,'2017-11-08 14:13:47'),(5,'V-21301058','MIGUEL','SUAREZ','MIGUELSUAREZ@GMAIL.COM','+583289382893','20/10/1993',1,'2017-11-08 14:14:39'),(6,'V-21301043','KAUSTICA','MEDINA','KAUSTICAMEDINA@GMAIL.COM','+588232908302','20/10/1992',1,'2017-11-08 14:15:18'),(7,'V-22384332','MANUEL','GONZALEZ','MANUELGON@GMAIL.COM','+580392930920','20/10/1992',1,'2017-11-08 14:15:49'),(8,'V-21301823','SUSANA','GONZALES','SUSAN_23_23@GMAIL.COM','+582839283232','20/10/1992',1,'2017-11-08 14:16:35'),(10,'V-21392343','JUAN','JIMENEZ','JUANJOPE@GMAIL.COM','+589234982343','20/10/1992',1,'2017-11-08 14:17:14'),(11,'V-29323222','MILAGROS','CUICAS','MILAGROSCUICAS@GMAIL.COM','+588782328323','20/10/1992',1,'2017-11-08 14:18:27'),(12,'V-21382343','JUAN','MIJAREZ','JUANMIJAREZ@GMAIL.COM','+583823923232','20/10/1992',1,'2017-11-08 14:19:04'),(13,'V-21301033','MANUEL','LOPEZ','JUANJEMANUEL@GMAIL.COM','+583984343434','20/10/1992',1,'2017-11-08 14:19:43'),(14,'V-22839332','DULCE MARIA','SUAREZ','DULCE@GMAIL.COM','+583838393833','20/10/1992',1,'2017-11-08 14:22:02'),(15,'V-28332882','MILAGROS','MIKARES','MILAGROS@GMAIL.COM','+583498398344','20/10/1992',1,'2017-11-08 14:22:48'),(16,'V-8389332','MANUEL','CUICAS','MANU@GMAIL.COM','+583838383833','20/10/1992',1,'2017-11-08 14:23:20'),(18,'V-12832233','CERAPIO','MOACK','CERAPIOMOACK@GMAIL.COM','+588398434343','20/10/1992',1,'2017-11-08 14:24:27'),(19,'V-14783933','MANUELA','ZABALA','MANUELAZABALA@TSJ.GOB.VE','+588989898898','20/10/1992',1,'2017-11-08 14:25:23'),(21,'V-12893904','EUDO EMISAEL','CASTRO TAMAYO','EUDOEMIASALE@GMAIL.COM','+583983984343','20/10/1992',1,'2017-11-08 14:27:08'),(22,'V-13834933','JOSE','GIMENEZ','JOSEGIMEZ@GMAIL.COM','+588323829382','20/10/1992',1,'2017-11-08 14:27:44'),(23,'V-32883992','LORENA','ROJAS','LORENAROJAS@HOTMAIL.COM','+583939393984','20/10/1992',1,'2017-11-08 14:28:18');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_tipo`
--

LOCK TABLES `persona_tipo` WRITE;
/*!40000 ALTER TABLE `persona_tipo` DISABLE KEYS */;
INSERT INTO `persona_tipo` VALUES (1,'V-21301059',9),(2,'V-21301060',1),(3,'V-21301061',1),(4,'V-21301070',1),(5,'V-21301058',5),(6,'V-21301043',5),(7,'V-22384332',5),(8,'V-21301823',3),(9,'V-21301059',3),(10,'V-21392343',3),(11,'V-29323222',6),(12,'V-21382343',6),(13,'V-21301033',6),(14,'V-22839332',4),(15,'V-28332882',4),(16,'V-8389332',4),(17,'V-21301070',4),(18,'V-12832233',8),(19,'V-14783933',8),(20,'V-28332882',8),(21,'V-12893904',7),(22,'V-13834933',7),(23,'V-32883992',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'SALA 1A','#ffee00',1,'2017-11-08 14:00:29'),(2,'SALA 2A','#009cee',1,'2017-11-08 14:00:48'),(3,'SALA 3A','#ff0036',1,'2017-11-08 14:01:08'),(4,'SALA 3B','#6f0963',1,'2017-11-08 14:01:28'),(5,'SALA 2B','#ff0000',1,'2017-11-08 14:01:46'),(6,'SALA 1','#ff00fe',1,'2017-11-08 14:02:07'),(7,'SALA 2','#2c3d93',1,'2017-11-08 14:02:23'),(8,'SALA 3','#27685b',1,'2017-11-08 14:02:43'),(9,'SALA 3C','#ca00ff',1,'2017-11-08 14:03:02'),(10,'SALA 4','#0d7309',1,'2017-11-08 14:03:17');
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testigo`
--

LOCK TABLES `testigo` WRITE;
/*!40000 ALTER TABLE `testigo` DISABLE KEYS */;
INSERT INTO `testigo` VALUES (1,'V-12893904'),(2,'V-13834933'),(3,'V-32883992');
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
INSERT INTO `tipo_de_tribunal` VALUES (1,'TRIBUNAL DE GUARDIA DE CONTROL',1,'2017-11-08 14:04:41'),(2,'TRIBUNAL DE PRESENTACION',1,'2017-11-08 14:05:13');
/*!40000 ALTER TABLE `tipo_de_tribunal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
INSERT INTO `tipo_persona` VALUES (1,'DEFENSOR',1,'2017-11-07 19:37:36'),(3,'ALGUACIL',1,'2017-11-07 19:37:38'),(4,'IMPUTADO',1,'2017-11-07 19:37:40'),(5,'JUEZ',1,'2017-11-07 19:37:43'),(6,'VICTIMA',1,'2017-11-07 19:37:45'),(7,'TESTIGO',1,'2017-07-12 02:25:19'),(8,'FISCAL',1,'2017-07-12 02:25:21'),(9,'USUARIO',1,'2017-07-12 02:24:53');
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
INSERT INTO `tribunal` VALUES (1,'TRIBUNAL 1',1,1,'2017-11-08 14:06:10'),(2,'TRIBUNAL 2',1,1,'2017-11-08 14:06:23'),(3,'TRIBUNAL 3',2,1,'2017-11-08 14:06:34'),(4,'TRIBUNAL 4',2,1,'2017-11-08 14:06:47'),(6,'TRIBUNAL 18',1,1,'2017-11-08 14:07:20'),(7,'TRIBUNAL 17',1,1,'2017-11-08 14:07:32'),(8,'TRIBUNAL 19',2,1,'2017-11-08 14:07:49'),(9,'TRIBUNAL 20',1,1,'2017-11-08 14:08:01'),(10,'TRIBUNAL 21',2,1,'2017-11-08 14:08:15');
/*!40000 ALTER TABLE `tribunal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd','icon-user.png','ADMINISTRADOR',0,'2017-11-08 13:58:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victima`
--

LOCK TABLES `victima` WRITE;
/*!40000 ALTER TABLE `victima` DISABLE KEYS */;
INSERT INTO `victima` VALUES (3,'V-21301033'),(2,'V-21382343'),(1,'V-29323222');
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
  `CONDICION` tinyint NOT NULL,
  `TRIBUNAL` tinyint NOT NULL,
  `TIPO_DE_TRIBUNAL` tinyint NOT NULL,
  `ACTO` tinyint NOT NULL,
  `HORA` tinyint NOT NULL,
  `OBSERVACION` tinyint NOT NULL,
  `SALA` tinyint NOT NULL,
  `FISCAL` tinyint NOT NULL,
  `ALGUACIL` tinyint NOT NULL,
  `DEFENSOR` tinyint NOT NULL,
  `NUMERO` tinyint NOT NULL
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
  `condicion` tinyint NOT NULL,
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
/*!50001 VIEW `vista_acto` AS select `acto`.`id` AS `ID`,`acto`.`numero_caso` AS `CAUSA`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `IMPUTADO`,(select `imputado`.`condicion` from `imputado` where (`imputado`.`cedula` = `persona`.`cedula`)) AS `CONDICION`,`tribunal`.`numero` AS `TRIBUNAL`,(select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`)) AS `TIPO_DE_TRIBUNAL`,concat(`actividad`.`actividad`,' (',(select `imputado`.`condicion` from `imputado` where (`imputado`.`cedula` = `persona`.`cedula`)),')') AS `ACTO`,`acto`.`inicio` AS `HORA`,`acto`.`descripcion` AS `OBSERVACION`,`sala`.`descripcion` AS `SALA`,`fiscal`.`numero` AS `FISCAL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_alguacil`.`cedula`)) AS `ALGUACIL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_defensor`.`cedula`)) AS `DEFENSOR`,(select `defensor`.`impres` from `defensor` where (`defensor`.`cedula` = `caso_defensor`.`cedula`)) AS `NUMERO` from (((((((((`acto` join `caso_imputado` on((`acto`.`numero_caso` = `caso_imputado`.`numero_caso`))) join `persona` on((`caso_imputado`.`cedula` = `persona`.`cedula`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `actividad` on((`actividad`.`id` = `acto`.`id_actividad`))) join `sala` on((`sala`.`id` = `acto`.`id_sala`))) join `caso_fiscal` on((`caso_fiscal`.`numero_caso` = `acto`.`numero_caso`))) join `fiscal` on((`caso_fiscal`.`cedula` = `fiscal`.`cedula`))) join `caso_alguacil` on((`caso_alguacil`.`numero_caso` = `acto`.`numero_caso`))) join `caso_defensor` on((`caso_defensor`.`numero_caso` = `acto`.`numero_caso`))) order by (select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`)) */;
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
/*!50001 VIEW `vista_imputado` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`imputado`.`condicion` AS `condicion`,`persona_tipo`.`tipo_persona` AS `tipo_persona` from ((`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) join `imputado` on((`persona`.`cedula` = `imputado`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 4) */;
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

-- Dump completed on 2017-11-08 11:08:15
