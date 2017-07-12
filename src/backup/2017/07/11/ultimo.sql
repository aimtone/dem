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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-07-11T08:00:00','2017-07-11T18:00:00','EVENTO',1,1,1,1,'FINALIZADO',1,'2017-07-11 22:01:14'),(2,'2017-07-11T08:00:00','2017-07-11T09:00:00','JUICIO DE PRESENTACION',1,1,2,1,'FINALIZADO',1,'2017-07-11 14:35:10'),(3,'2017-07-12T09:00:00','2017-07-12T15:00:00','h',1,1,3,1,'ASIGNADO',1,'2017-07-11 17:10:19'),(4,'2017-07-13T09:30:00','2017-07-13T15:30:00','JUICIO DE SALIDA',1,2,2,2,'ASIGNADO',1,'2017-07-11 17:16:47'),(5,'2017-07-13T09:30:00','2017-07-13T15:30:00','HSS',1,1,3,1,'ASIGNADO',1,'2017-07-11 17:13:20'),(6,'2017-07-13T09:30:00','2017-07-13T15:30:00','HX',1,1,5,1,'ASIGNADO',1,'2017-07-11 17:15:03'),(7,'2017-07-13T09:30:00','2017-07-13T15:30:00','JUICIO DE PRESENTACION',1,1,6,1,'ASIGNADO',1,'2017-07-11 17:25:29'),(8,'2017-07-12T09:00:00','2017-07-12T14:30:00','jh',1,2,4,2,'ASIGNADO',0,'2017-07-11 23:57:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alguacil`
--

LOCK TABLES `alguacil` WRITE;
/*!40000 ALTER TABLE `alguacil` DISABLE KEYS */;
INSERT INTO `alguacil` VALUES (1,'V-11');
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
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,1,'INSERTAR','2017-07-03 18:28:49','SALA',NULL,'{id : 1,descripcion : \"SALA 1\",color : \"#ff0000\"}'),(2,1,'INSERTAR','2017-07-04 15:50:15','SALA',NULL,'{id : 2,descripcion : \"SALA 2\",color : \"#1f68b0\"}'),(3,1,'INSERTAR','2017-07-04 16:02:52','ACTO',NULL,'{id : 1,inicio : \"2017-07-04T10:00:00\",fin : \"2017-07-04T13:30:00\",titulo : \"\",descripcion : \"jkjkjkjkjj\",id_sala : 2,id_tribunal : 1}'),(4,1,'INSERTAR','2017-07-04 16:49:33','ACTO',NULL,'{id : 26,inicio : \"2017-07-05T08:30:00\",fin : \"2017-07-05T15:00:00\",descripcion : \"kjkjjkj\",id_sala : 2,id_tribunal : 2}'),(5,1,'INSERTAR','2017-07-04 16:49:59','ACTO',NULL,'{id : 27,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T16:30:00\",descripcion : \"jhhhjsajhaa\",id_sala : 1,id_tribunal : 2}'),(6,1,'INSERTAR','2017-07-04 16:59:20','ACTO',NULL,'{id : 28,inicio : \"2017-07-05T15:00:00\",fin : \"2017-07-05T17:30:00\",descripcion : \"EL TRIBUNAL 12 CUYO FISCAL ES EL 18, TIENE COMO FIN HACER ESTA AUDIENCIA PARA MEDIR EL GRADO\",id_sala : 2,id_tribunal : 1}'),(7,1,'MODIFICAR','2017-07-04 17:14:52','ACTO','{id : 27,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T16:30:00\",descripcion : \"jhhhjsajhaa\",id_sala : 1,id_tribunal : 2}','{id : 27,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(8,1,'MODIFICAR','2017-07-04 17:15:09','ACTO','{id : 27,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 27,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T11:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(9,1,'MODIFICAR','2017-07-04 17:15:32','ACTO','{id : 28,inicio : \"2017-07-05T15:00:00\",fin : \"2017-07-05T17:30:00\",descripcion : \"EL TRIBUNAL 12 CUYO FISCAL ES EL 18, TIENE COMO FIN HACER ESTA AUDIENCIA PARA MEDIR EL GRADO\",id_sala : 2,id_tribunal : 1}','{id : 28,inicio : \"2017-07-05T13:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(10,1,'MODIFICAR','2017-07-04 17:16:06','ACTO','{id : 26,inicio : \"2017-07-05T08:30:00\",fin : \"2017-07-05T15:00:00\",descripcion : \"kjkjjkj\",id_sala : 2,id_tribunal : 2}','{id : 26,inicio : \"2017-07-05T09:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(11,1,'INSERTAR','2017-07-04 17:37:37','ACTO',NULL,'{id : 29,inicio : \"2017-07-04T10:00:00\",fin : \"2017-07-04T18:00:00\",descripcion : \"jaaj\",id_sala : 1,id_tribunal : 2}'),(12,1,'MODIFICAR','2017-07-04 17:37:41','ACTO','{id : 29,inicio : \"2017-07-04T10:00:00\",fin : \"2017-07-04T18:00:00\",descripcion : \"jaaj\",id_sala : 1,id_tribunal : 2}','{id : 29,inicio : \"2017-07-04T09:00:00\",fin : \"2017-07-04T17:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(13,1,'INSERTAR','2017-07-05 17:00:29','ACTO',NULL,'{id : 30,inicio : \"2017-07-06T08:30:00\",fin : \"2017-07-06T12:30:00\",descripcion : \"HOLA MUNDO\",id_sala : 1,id_tribunal : 1}'),(14,1,'INSERTAR','2017-07-05 17:55:23','ACTO',NULL,'{id : 31,inicio : \"2017-07-06T09:30:00\",fin : \"2017-07-06T16:30:00\",descripcion : \"kakak\",id_sala : 2,id_tribunal : 2}'),(15,1,'INSERTAR','2017-07-05 17:58:34','ACTO',NULL,'{id : 32,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T13:30:00\",descripcion : \"ksks\",id_sala : 2,id_tribunal : 2}'),(16,1,'INSERTAR','2017-07-05 18:01:43','ACTO',NULL,'{id : 33,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T13:30:00\",descripcion : \"ajaj\",id_sala : 1,id_tribunal : 2}'),(17,1,'INSERTAR','2017-07-05 18:07:02','ACTO',NULL,'{id : 34,inicio : \"2017-07-08T14:00:00\",fin : \"2017-07-08T16:30:00\",descripcion : \"jsjs\",id_sala : 1,id_tribunal : 2}'),(18,1,'INSERTAR','2017-07-05 18:09:30','ACTO',NULL,'{id : 35,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T15:30:00\",descripcion : \"123\",id_sala : 2,id_tribunal : 2}'),(19,1,'INSERTAR','2017-07-05 18:13:34','ACTO',NULL,'{id : 36,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"hola\",id_sala : 1,id_tribunal : 1}'),(20,1,'INSERTAR','2017-07-05 18:14:54','ACTO',NULL,'{id : 37,inicio : \"2017-07-10T08:30:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"juixio\",id_sala : 2,id_tribunal : 2}'),(21,1,'INSERTAR','2017-07-05 18:19:11','ACTO',NULL,'{id : 38,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T16:00:00\",descripcion : \"ksjsjs\",id_sala : 1,id_tribunal : 2}'),(22,1,'INSERTAR','2017-07-05 18:21:07','ACTO',NULL,'{id : 39,inicio : \"2017-07-15T08:30:00\",fin : \"2017-07-15T12:30:00\",descripcion : \"hola\",id_sala : 2,id_tribunal : 2}'),(23,1,'INSERTAR','2017-07-05 18:24:45','ACTO',NULL,'{id : 40,inicio : \"2017-07-15T09:30:00\",fin : \"2017-07-15T17:30:00\",descripcion : \"ksdksd\",id_sala : 1,id_tribunal : 2}'),(24,1,'INSERTAR','2017-07-05 18:32:26','ACTO',NULL,'{id : 41,inicio : \"2017-07-16T10:00:00\",fin : \"2017-07-16T13:30:00\",descripcion : \"dkd\",id_sala : 2,id_tribunal : 2}'),(25,1,'INSERTAR','2017-07-05 18:35:37','ACTO',NULL,'{id : 42,inicio : \"2017-07-16T09:00:00\",fin : \"2017-07-16T12:30:00\",descripcion : \"jsjs\",id_sala : 1,id_tribunal : 1}'),(26,1,'INSERTAR','2017-07-05 18:37:38','ACTO',NULL,'{id : 43,inicio : \"2017-07-16T13:30:00\",fin : \"2017-07-16T15:30:00\",descripcion : \"kd\",id_sala : 1,id_tribunal : 2}'),(27,1,'INSERTAR','2017-07-05 18:40:30','ACTO',NULL,'{id : 44,inicio : \"2017-07-16T13:30:00\",fin : \"2017-07-16T15:30:00\",descripcion : \"kdjc\",id_sala : 1,id_tribunal : 2}'),(28,1,'INSERTAR','2017-07-05 18:43:57','ACTO',NULL,'{id : 45,inicio : \"2017-07-26T09:30:00\",fin : \"2017-07-26T14:00:00\",descripcion : \"juicio\",id_sala : 2,id_tribunal : 2}'),(29,1,'INSERTAR','2017-07-05 18:49:11','ACTO',NULL,'{id : 46,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:30:00\",descripcion : \"juicio numero 2\",id_sala : 1,id_tribunal : 2}'),(30,1,'INSERTAR','2017-07-05 19:03:40','ACTO',NULL,'{id : 47,inicio : \"2017-07-21T09:30:00\",fin : \"2017-07-21T16:30:00\",descripcion : \"PRIMERA AUDIENCIA CON EL FIN DE CONOCER LOS TESTIGOS DEL JUICIO\",id_sala : 1,id_tribunal : 1}'),(31,1,'INSERTAR','2017-07-05 21:43:44','ACTO',NULL,'{id : 48,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T15:30:00\",descripcion : \"ROBO\",id_sala : 1,id_tribunal : 3}'),(32,1,'INSERTAR','2017-07-05 21:46:12','ACTO',NULL,'{id : 49,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T11:00:00\",descripcion : \"My Event 1\",id_sala : 1,id_tribunal : 0}'),(33,1,'INSERTAR','2017-07-05 21:46:20','ACTO',NULL,'{id : 50,inicio : \"2017-07-05T10:30:00\",fin : \"2017-07-05T12:30:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}'),(34,1,'INSERTAR','2017-07-05 21:46:24','ACTO',NULL,'{id : 51,inicio : \"2017-07-06T10:00:00\",fin : \"2017-07-06T12:00:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}'),(35,1,'INSERTAR','2017-07-05 21:46:26','ACTO',NULL,'{id : 52,inicio : \"2017-07-06T10:00:00\",fin : \"2017-07-06T12:00:00\",descripcion : \"My Event 5\",id_sala : 2,id_tribunal : 0}'),(36,1,'INSERTAR','2017-07-06 02:35:09','ACTO',NULL,'{id : 53,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T12:30:00\",descripcion : \"HAH\",id_sala : 1,id_tribunal : 1}'),(37,1,'INSERTAR','2017-07-06 02:49:48','ACTO',NULL,'{id : 54,inicio : \"2017-07-06T09:00:00\",fin : \"2017-07-06T14:30:00\",descripcion : \"este es un campo\",id_sala : 2,id_tribunal : 1}'),(38,1,'INSERTAR','2017-07-06 02:50:02','ACTO',NULL,'{id : 55,inicio : \"2017-07-06T10:30:00\",fin : \"2017-07-06T12:30:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}'),(39,1,'MODIFICAR','2017-07-06 02:51:27','ACTO','{id : 39,inicio : \"2017-07-15T08:30:00\",fin : \"2017-07-15T12:30:00\",descripcion : \"hola\",id_sala : 2,id_tribunal : 2}','{id : 39,inicio : \"2017-07-15T10:00:00\",fin : \"2017-07-15T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(40,1,'MODIFICAR','2017-07-06 02:51:51','ACTO','{id : 54,inicio : \"2017-07-06T09:00:00\",fin : \"2017-07-06T14:30:00\",descripcion : \"este es un campo\",id_sala : 2,id_tribunal : 1}','{id : 54,inicio : \"2017-07-06T08:00:00\",fin : \"2017-07-06T13:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(41,1,'MODIFICAR','2017-07-06 02:52:02','ACTO','{id : 54,inicio : \"2017-07-06T08:00:00\",fin : \"2017-07-06T13:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 54,inicio : \"2017-07-06T08:00:00\",fin : \"2017-07-06T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(42,1,'INSERTAR','2017-07-06 02:52:35','SALA',NULL,'{id : 3,descripcion : \"SALA 3\",color : \"#319836\"}'),(43,1,'INSERTAR','2017-07-06 02:52:51','SALA',NULL,'{id : 4,descripcion : \"SALA 4\",color : \"#8124cc\"}'),(44,1,'INSERTAR','2017-07-06 02:53:10','SALA',NULL,'{id : 5,descripcion : \"SALA 5\",color : \"#fb9f00\"}'),(45,1,'INSERTAR','2017-07-06 02:53:33','SALA',NULL,'{id : 6,descripcion : \"SALA 6\",color : \"#d926de\"}'),(46,1,'INSERTAR','2017-07-06 02:54:00','ACTO',NULL,'{id : 56,inicio : \"2017-07-06T08:30:00\",fin : \"2017-07-06T09:00:00\",descripcion : \"jaja\",id_sala : 2,id_tribunal : 2}'),(47,1,'MODIFICAR','2017-07-06 02:54:15','ACTO','{id : 56,inicio : \"2017-07-06T08:30:00\",fin : \"2017-07-06T09:00:00\",descripcion : \"jaja\",id_sala : 2,id_tribunal : 2}','{id : 56,inicio : \"2017-07-06T08:30:00\",fin : \"2017-07-06T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(48,1,'INSERTAR','2017-07-06 03:01:53','ACTO',NULL,'{id : 57,inicio : \"2017-07-05T10:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"ds\",id_sala : 4,id_tribunal : 1}'),(49,1,'INSERTAR','2017-07-08 15:19:01','ACTO',NULL,'{id : 58,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T16:00:00\",descripcion : \"CASO ABIERTO\",id_sala : 3,id_tribunal : 1}'),(50,1,'INSERTAR','2017-07-08 15:59:00','ACTO',NULL,'{id : 59,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T15:30:00\",descripcion : \"haja\",id_sala : 4,id_tribunal : 1}'),(51,1,'INSERTAR','2017-07-08 16:00:15','ACTO',NULL,'{id : 60,inicio : \"2017-07-08T08:30:00\",fin : \"2017-07-08T10:30:00\",descripcion : \"My Event 1\",id_sala : 2,id_tribunal : 0}'),(52,1,'INSERTAR','2017-07-08 16:02:03','ACTO',NULL,'{id : 61,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T11:00:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 0}'),(53,1,'INSERTAR','2017-07-08 16:04:58','ACTO',NULL,'{id : 62,inicio : \"2017-07-08T09:30:00\",fin : \"2017-07-08T11:30:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}'),(54,1,'INSERTAR','2017-07-08 16:06:21','ACTO',NULL,'{id : 63,inicio : \"2017-07-08T10:30:00\",fin : \"2017-07-08T12:30:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}'),(55,1,'INSERTAR','2017-07-08 16:06:36','ACTO',NULL,'{id : 64,inicio : \"2017-07-08T12:30:00\",fin : \"2017-07-08T14:30:00\",descripcion : \"My Event 2\",id_sala : 4,id_tribunal : 1}'),(56,1,'MODIFICAR','2017-07-08 16:06:38','ACTO','{id : 64,inicio : \"2017-07-08T12:30:00\",fin : \"2017-07-08T14:30:00\",descripcion : \"My Event 2\",id_sala : 4,id_tribunal : 1}','{id : 64,inicio : \"2017-07-08T10:00:00\",fin : \"2017-07-08T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(57,1,'MODIFICAR','2017-07-08 16:06:46','ACTO','{id : 64,inicio : \"2017-07-08T10:00:00\",fin : \"2017-07-08T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 64,inicio : \"2017-07-08T13:30:00\",fin : \"2017-07-08T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(58,1,'MODIFICAR','2017-07-08 16:07:16','ACTO','{id : 63,inicio : \"2017-07-08T10:30:00\",fin : \"2017-07-08T12:30:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}','{id : 63,inicio : \"2017-07-08T10:30:00\",fin : \"2017-07-08T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(59,1,'MODIFICAR','2017-07-08 16:07:22','ACTO','{id : 63,inicio : \"2017-07-08T10:30:00\",fin : \"2017-07-08T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 63,inicio : \"2017-07-08T08:30:00\",fin : \"2017-07-08T14:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(60,1,'INSERTAR','2017-07-08 16:10:32','ACTO',NULL,'{id : 65,inicio : \"2017-07-08T10:00:00\",fin : \"2017-07-08T12:00:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}'),(61,1,'INSERTAR','2017-07-08 16:10:36','ACTO',NULL,'{id : 66,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:00:00\",descripcion : \"My Event 1\",id_sala : 2,id_tribunal : 1}'),(62,1,'INSERTAR','2017-07-08 16:10:42','ACTO',NULL,'{id : 67,inicio : \"2017-07-08T10:30:00\",fin : \"2017-07-08T12:30:00\",descripcion : \"My Event 4\",id_sala : 4,id_tribunal : 1}'),(63,1,'INSERTAR','2017-07-08 16:14:06','ACTO',NULL,'{id : 68,inicio : \"2017-07-09T10:00:00\",fin : \"2017-07-09T12:00:00\",descripcion : \"My Event 4\",id_sala : 5,id_tribunal : 1}'),(64,1,'MODIFICAR','2017-07-08 16:20:50','ACTO','{id : 59,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T15:30:00\",descripcion : \"haja\",id_sala : 4,id_tribunal : 1}','{id : 59,inicio : \"2017-07-09T12:00:00\",fin : \"2017-07-09T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(65,1,'MODIFICAR','2017-07-08 16:20:52','ACTO','{id : 68,inicio : \"2017-07-09T10:00:00\",fin : \"2017-07-09T12:00:00\",descripcion : \"My Event 4\",id_sala : 5,id_tribunal : 1}','{id : 68,inicio : \"2017-07-09T10:00:00\",fin : \"2017-07-09T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(66,1,'MODIFICAR','2017-07-08 16:21:00','ACTO','{id : 59,inicio : \"2017-07-09T12:00:00\",fin : \"2017-07-09T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 59,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(67,1,'MODIFICAR','2017-07-08 16:21:06','ACTO','{id : 65,inicio : \"2017-07-08T10:00:00\",fin : \"2017-07-08T12:00:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}','{id : 65,inicio : \"2017-07-08T10:00:00\",fin : \"2017-07-08T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(68,1,'INSERTAR','2017-07-08 16:27:42','ACTO',NULL,'{id : 69,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:00:00\",descripcion : \"My Event 2\",id_sala : 5,id_tribunal : 1}'),(69,1,'MODIFICAR','2017-07-08 16:28:23','ACTO','{id : 69,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:00:00\",descripcion : \"My Event 2\",id_sala : 5,id_tribunal : 1}','{id : 69,inicio : \"2017-07-09T12:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(70,1,'MODIFICAR','2017-07-08 16:28:25','ACTO','{id : 69,inicio : \"2017-07-09T12:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 69,inicio : \"2017-07-09T12:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(71,1,'MODIFICAR','2017-07-08 16:28:27','ACTO','{id : 58,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T16:00:00\",descripcion : \"CASO ABIERTO\",id_sala : 3,id_tribunal : 1}','{id : 58,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(72,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 1,inicio : \"2017-07-04T10:00:00\",fin : \"2017-07-04T13:30:00\",descripcion : \"jkjkjkjkjj\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"2017-07-04T10:00:00\",fin : \"2017-07-04T13:30:00\",descripcion : \"jkjkjkjkjj\",id_sala : 2,id_tribunal : 1}'),(73,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 26,inicio : \"2017-07-05T09:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 26,inicio : \"2017-07-05T09:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(74,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 27,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T11:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 27,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T11:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(75,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 28,inicio : \"2017-07-05T13:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 28,inicio : \"2017-07-05T13:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(76,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 29,inicio : \"2017-07-04T09:00:00\",fin : \"2017-07-04T17:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 29,inicio : \"2017-07-04T09:00:00\",fin : \"2017-07-04T17:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(77,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 30,inicio : \"2017-07-06T08:30:00\",fin : \"2017-07-06T12:30:00\",descripcion : \"HOLA MUNDO\",id_sala : 1,id_tribunal : 1}','{id : 30,inicio : \"2017-07-06T08:30:00\",fin : \"2017-07-06T12:30:00\",descripcion : \"HOLA MUNDO\",id_sala : 1,id_tribunal : 1}'),(78,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 31,inicio : \"2017-07-06T09:30:00\",fin : \"2017-07-06T16:30:00\",descripcion : \"kakak\",id_sala : 2,id_tribunal : 2}','{id : 31,inicio : \"2017-07-06T09:30:00\",fin : \"2017-07-06T16:30:00\",descripcion : \"kakak\",id_sala : 2,id_tribunal : 2}'),(79,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 32,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T13:30:00\",descripcion : \"ksks\",id_sala : 2,id_tribunal : 2}','{id : 32,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T13:30:00\",descripcion : \"ksks\",id_sala : 2,id_tribunal : 2}'),(80,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 33,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T13:30:00\",descripcion : \"ajaj\",id_sala : 1,id_tribunal : 2}','{id : 33,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T13:30:00\",descripcion : \"ajaj\",id_sala : 1,id_tribunal : 2}'),(81,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 34,inicio : \"2017-07-08T14:00:00\",fin : \"2017-07-08T16:30:00\",descripcion : \"jsjs\",id_sala : 1,id_tribunal : 2}','{id : 34,inicio : \"2017-07-08T14:00:00\",fin : \"2017-07-08T16:30:00\",descripcion : \"jsjs\",id_sala : 1,id_tribunal : 2}'),(82,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 35,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T15:30:00\",descripcion : \"123\",id_sala : 2,id_tribunal : 2}','{id : 35,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T15:30:00\",descripcion : \"123\",id_sala : 2,id_tribunal : 2}'),(83,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 36,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"hola\",id_sala : 1,id_tribunal : 1}','{id : 36,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"hola\",id_sala : 1,id_tribunal : 1}'),(84,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 37,inicio : \"2017-07-10T08:30:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"juixio\",id_sala : 2,id_tribunal : 2}','{id : 37,inicio : \"2017-07-10T08:30:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"juixio\",id_sala : 2,id_tribunal : 2}'),(85,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 38,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T16:00:00\",descripcion : \"ksjsjs\",id_sala : 1,id_tribunal : 2}','{id : 38,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T16:00:00\",descripcion : \"ksjsjs\",id_sala : 1,id_tribunal : 2}'),(86,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 39,inicio : \"2017-07-15T10:00:00\",fin : \"2017-07-15T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 39,inicio : \"2017-07-15T10:00:00\",fin : \"2017-07-15T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(87,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 40,inicio : \"2017-07-15T09:30:00\",fin : \"2017-07-15T17:30:00\",descripcion : \"ksdksd\",id_sala : 1,id_tribunal : 2}','{id : 40,inicio : \"2017-07-15T09:30:00\",fin : \"2017-07-15T17:30:00\",descripcion : \"ksdksd\",id_sala : 1,id_tribunal : 2}'),(88,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 41,inicio : \"2017-07-16T10:00:00\",fin : \"2017-07-16T13:30:00\",descripcion : \"dkd\",id_sala : 2,id_tribunal : 2}','{id : 41,inicio : \"2017-07-16T10:00:00\",fin : \"2017-07-16T13:30:00\",descripcion : \"dkd\",id_sala : 2,id_tribunal : 2}'),(89,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 42,inicio : \"2017-07-16T09:00:00\",fin : \"2017-07-16T12:30:00\",descripcion : \"jsjs\",id_sala : 1,id_tribunal : 1}','{id : 42,inicio : \"2017-07-16T09:00:00\",fin : \"2017-07-16T12:30:00\",descripcion : \"jsjs\",id_sala : 1,id_tribunal : 1}'),(90,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 43,inicio : \"2017-07-16T13:30:00\",fin : \"2017-07-16T15:30:00\",descripcion : \"kd\",id_sala : 1,id_tribunal : 2}','{id : 43,inicio : \"2017-07-16T13:30:00\",fin : \"2017-07-16T15:30:00\",descripcion : \"kd\",id_sala : 1,id_tribunal : 2}'),(91,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 44,inicio : \"2017-07-16T13:30:00\",fin : \"2017-07-16T15:30:00\",descripcion : \"kdjc\",id_sala : 1,id_tribunal : 2}','{id : 44,inicio : \"2017-07-16T13:30:00\",fin : \"2017-07-16T15:30:00\",descripcion : \"kdjc\",id_sala : 1,id_tribunal : 2}'),(92,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 45,inicio : \"2017-07-26T09:30:00\",fin : \"2017-07-26T14:00:00\",descripcion : \"juicio\",id_sala : 2,id_tribunal : 2}','{id : 45,inicio : \"2017-07-26T09:30:00\",fin : \"2017-07-26T14:00:00\",descripcion : \"juicio\",id_sala : 2,id_tribunal : 2}'),(93,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 46,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:30:00\",descripcion : \"juicio numero 2\",id_sala : 1,id_tribunal : 2}','{id : 46,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:30:00\",descripcion : \"juicio numero 2\",id_sala : 1,id_tribunal : 2}'),(94,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 47,inicio : \"2017-07-21T09:30:00\",fin : \"2017-07-21T16:30:00\",descripcion : \"PRIMERA AUDIENCIA CON EL FIN DE CONOCER LOS TESTIGOS DEL JUICIO\",id_sala : 1,id_tribunal : 1}','{id : 47,inicio : \"2017-07-21T09:30:00\",fin : \"2017-07-21T16:30:00\",descripcion : \"PRIMERA AUDIENCIA CON EL FIN DE CONOCER LOS TESTIGOS DEL JUICIO\",id_sala : 1,id_tribunal : 1}'),(95,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 48,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T15:30:00\",descripcion : \"ROBO\",id_sala : 1,id_tribunal : 3}','{id : 48,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T15:30:00\",descripcion : \"ROBO\",id_sala : 1,id_tribunal : 3}'),(96,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 49,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T11:00:00\",descripcion : \"My Event 1\",id_sala : 1,id_tribunal : 0}','{id : 49,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T11:00:00\",descripcion : \"My Event 1\",id_sala : 1,id_tribunal : 0}'),(97,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 50,inicio : \"2017-07-05T10:30:00\",fin : \"2017-07-05T12:30:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}','{id : 50,inicio : \"2017-07-05T10:30:00\",fin : \"2017-07-05T12:30:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}'),(98,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 51,inicio : \"2017-07-06T10:00:00\",fin : \"2017-07-06T12:00:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}','{id : 51,inicio : \"2017-07-06T10:00:00\",fin : \"2017-07-06T12:00:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}'),(99,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 52,inicio : \"2017-07-06T10:00:00\",fin : \"2017-07-06T12:00:00\",descripcion : \"My Event 5\",id_sala : 2,id_tribunal : 0}','{id : 52,inicio : \"2017-07-06T10:00:00\",fin : \"2017-07-06T12:00:00\",descripcion : \"My Event 5\",id_sala : 2,id_tribunal : 0}'),(100,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 53,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T12:30:00\",descripcion : \"HAH\",id_sala : 1,id_tribunal : 1}','{id : 53,inicio : \"2017-07-05T09:00:00\",fin : \"2017-07-05T12:30:00\",descripcion : \"HAH\",id_sala : 1,id_tribunal : 1}'),(101,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 54,inicio : \"2017-07-06T08:00:00\",fin : \"2017-07-06T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 54,inicio : \"2017-07-06T08:00:00\",fin : \"2017-07-06T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(102,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 55,inicio : \"2017-07-06T10:30:00\",fin : \"2017-07-06T12:30:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}','{id : 55,inicio : \"2017-07-06T10:30:00\",fin : \"2017-07-06T12:30:00\",descripcion : \"My Event 3\",id_sala : 1,id_tribunal : 0}'),(103,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 56,inicio : \"2017-07-06T08:30:00\",fin : \"2017-07-06T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 56,inicio : \"2017-07-06T08:30:00\",fin : \"2017-07-06T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(104,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 57,inicio : \"2017-07-05T10:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"ds\",id_sala : 4,id_tribunal : 1}','{id : 57,inicio : \"2017-07-05T10:30:00\",fin : \"2017-07-05T16:00:00\",descripcion : \"ds\",id_sala : 4,id_tribunal : 1}'),(105,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 58,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 58,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(106,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 59,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 59,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(107,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 60,inicio : \"2017-07-08T08:30:00\",fin : \"2017-07-08T10:30:00\",descripcion : \"My Event 1\",id_sala : 2,id_tribunal : 0}','{id : 60,inicio : \"2017-07-08T08:30:00\",fin : \"2017-07-08T10:30:00\",descripcion : \"My Event 1\",id_sala : 2,id_tribunal : 0}'),(108,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 61,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T11:00:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 0}','{id : 61,inicio : \"2017-07-08T09:00:00\",fin : \"2017-07-08T11:00:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 0}'),(109,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 62,inicio : \"2017-07-08T09:30:00\",fin : \"2017-07-08T11:30:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}','{id : 62,inicio : \"2017-07-08T09:30:00\",fin : \"2017-07-08T11:30:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}'),(110,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 63,inicio : \"2017-07-08T08:30:00\",fin : \"2017-07-08T14:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 63,inicio : \"2017-07-08T08:30:00\",fin : \"2017-07-08T14:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(111,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 64,inicio : \"2017-07-08T13:30:00\",fin : \"2017-07-08T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 64,inicio : \"2017-07-08T13:30:00\",fin : \"2017-07-08T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(112,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 65,inicio : \"2017-07-08T10:00:00\",fin : \"2017-07-08T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 65,inicio : \"2017-07-08T10:00:00\",fin : \"2017-07-08T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(113,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 66,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:00:00\",descripcion : \"My Event 1\",id_sala : 2,id_tribunal : 1}','{id : 66,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:00:00\",descripcion : \"My Event 1\",id_sala : 2,id_tribunal : 1}'),(114,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 67,inicio : \"2017-07-08T10:30:00\",fin : \"2017-07-08T12:30:00\",descripcion : \"My Event 4\",id_sala : 4,id_tribunal : 1}','{id : 67,inicio : \"2017-07-08T10:30:00\",fin : \"2017-07-08T12:30:00\",descripcion : \"My Event 4\",id_sala : 4,id_tribunal : 1}'),(115,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 68,inicio : \"2017-07-09T10:00:00\",fin : \"2017-07-09T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 68,inicio : \"2017-07-09T10:00:00\",fin : \"2017-07-09T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(116,1,'MODIFICAR','2017-07-08 16:49:53','ACTO','{id : 69,inicio : \"2017-07-09T12:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 69,inicio : \"2017-07-09T12:30:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(117,1,'INSERTAR','2017-07-08 16:52:34','ACTO',NULL,'{id : 70,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"HOLA\",id_sala : 5,id_tribunal : 2}'),(118,1,'INSERTAR','2017-07-08 17:32:28','ACTO',NULL,'{id : 71,inicio : \"2017-07-09T15:00:00\",fin : \"2017-07-09T16:00:00\",descripcion : \"hola\",id_sala : 4,id_tribunal : 1}'),(119,1,'MODIFICAR','2017-07-08 17:41:39','ACTO','{id : 70,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"HOLA\",id_sala : 5,id_tribunal : 2}','{id : 70,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(120,1,'INSERTAR','2017-07-08 17:46:55','ACTO',NULL,'{id : 72,inicio : \"2017-07-09T12:00:00\",fin : \"2017-07-09T18:00:00\",descripcion : \"haha\",id_sala : 3,id_tribunal : 2}'),(121,1,'INSERTAR','2017-07-08 17:49:43','ACTO',NULL,'{id : 73,inicio : \"2017-07-09T16:00:00\",fin : \"2017-07-09T17:30:00\",descripcion : \"hka\",id_sala : 6,id_tribunal : 2}'),(122,1,'INSERTAR','2017-07-08 17:55:01','ACTO',NULL,'{id : 74,inicio : \"2017-07-09T15:30:00\",fin : \"2017-07-09T17:30:00\",descripcion : \"My Event 3\",id_sala : 2,id_tribunal : 1}'),(123,1,'MODIFICAR','2017-07-08 18:00:29','ACTO','{id : 70,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 70,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(124,1,'INSERTAR','2017-07-08 18:27:20','ACTO',NULL,'{id : 75,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T17:30:00\",descripcion : \"juicio y audiencia numero 1\",id_sala : 4,id_tribunal : 1}'),(125,1,'INSERTAR','2017-07-08 18:32:04','ACTO',NULL,'{id : 76,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"hol\",id_sala : 5,id_tribunal : 1}'),(126,0,'INSERTAR','2017-07-08 18:32:45','ACTO',NULL,NULL),(127,1,'INSERTAR','2017-07-08 18:55:22','ACTO',NULL,'{id : 1,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T15:00:00\",descripcion : \"PRIMERA AUDIENCIA DE IMPUTADO\",id_sala : 2,id_tribunal : 1}'),(128,0,'INSERTAR','2017-07-08 18:56:11','ACTO',NULL,NULL),(129,0,'MODIFICAR','2017-07-08 18:59:25','ACTO',NULL,NULL),(130,0,'MODIFICAR','2017-07-08 18:59:30','ACTO',NULL,'{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}'),(131,1,'INSERTAR','2017-07-08 18:59:51','ACTO',NULL,'{id : 3,inicio : \"2017-07-09T13:00:00\",fin : \"2017-07-09T15:00:00\",descripcion : \"My Event 2\",id_sala : 4,id_tribunal : 1}'),(132,1,'MODIFICAR','2017-07-08 19:00:40','ACTO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}'),(133,1,'MODIFICAR','2017-07-08 19:00:43','ACTO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 2,id_tribunal : 2}'),(134,1,'MODIFICAR','2017-07-08 19:01:16','ACTO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 2,id_tribunal : 2}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}'),(135,1,'MODIFICAR','2017-07-08 19:01:21','ACTO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}','{id : 2,inicio : \"NULL\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}'),(136,1,'MODIFICAR','2017-07-08 19:01:24','ACTO','{id : 2,inicio : \"NULL\",fin : \"0000-00-00T00:00:00\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}'),(137,1,'MODIFICAR','2017-07-08 19:01:44','ACTO','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 2,id_tribunal : 2}'),(138,1,'MODIFICAR','2017-07-08 19:02:51','ACTO','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 2,id_tribunal : 2}','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}'),(139,1,'MODIFICAR','2017-07-08 19:02:54','ACTO','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}'),(140,1,'MODIFICAR','2017-07-08 19:02:55','ACTO','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}'),(141,1,'MODIFICAR','2017-07-08 19:02:58','ACTO','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 0,id_tribunal : 2}','{id : 2,inicio : \"NULL\",fin : \"NULL\",descripcion : \"DEFINICION DEL JUICIO\",id_sala : 1,id_tribunal : 2}'),(142,0,'INSERTAR','2017-07-08 19:07:20','ACTO',NULL,NULL),(143,1,'INSERTAR','2017-07-08 19:07:42','ACTO',NULL,'{id : 2,inicio : \"2017-07-09T08:00:00\",fin : \"2017-07-09T10:00:00\",descripcion : \"My Event 4\",id_sala : 1,id_tribunal : 1}'),(144,1,'INSERTAR','2017-07-08 19:07:45','ACTO',NULL,'{id : 3,inicio : \"2017-07-09T10:00:00\",fin : \"2017-07-09T12:00:00\",descripcion : \"My Event 4\",id_sala : 2,id_tribunal : 1}'),(145,1,'INSERTAR','2017-07-08 19:07:47','ACTO',NULL,'{id : 4,inicio : \"2017-07-09T11:30:00\",fin : \"2017-07-09T13:30:00\",descripcion : \"My Event 2\",id_sala : 3,id_tribunal : 1}'),(146,1,'INSERTAR','2017-07-08 19:08:47','ACTO',NULL,'{id : 5,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T15:00:00\",descripcion : \"SEGUNDA AUDIENCIA\",id_sala : 3,id_tribunal : 1}'),(147,1,'INSERTAR','2017-07-08 19:13:24','ACTO',NULL,'{id : 6,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T11:30:00\",descripcion : \"My Event 3\",id_sala : 2,id_tribunal : 1}'),(148,1,'INSERTAR','2017-07-08 19:13:27','ACTO',NULL,'{id : 7,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T11:30:00\",descripcion : \"My Event 4\",id_sala : 2,id_tribunal : 1}'),(149,1,'INSERTAR','2017-07-08 19:14:32','ACTO',NULL,'{id : 8,inicio : \"2017-07-09T09:30:00\",fin : \"2017-07-09T17:00:00\",descripcion : \"jd\",id_sala : 5,id_tribunal : 3}'),(150,0,'MODIFICAR','2017-07-08 19:19:27','ACTO',NULL,NULL),(151,0,'MODIFICAR','2017-07-08 19:19:33','ACTO',NULL,'{id : 1,inicio : \"2017-07-09T08:00:00\",fin : \"2017-07-09T10:00:00\",descripcion : \"INICIO DE AUDIENCIAS\",id_sala : 1,id_tribunal : 1}'),(152,0,'MODIFICAR','2017-07-08 19:20:43','ACTO','{id : 1,inicio : \"2017-07-09T08:00:00\",fin : \"2017-07-09T10:00:00\",descripcion : \"INICIO DE AUDIENCIAS\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-09T10:00:00\",descripcion : \"INICIO DE AUDIENCIAS\",id_sala : 1,id_tribunal : 1}'),(153,0,'MODIFICAR','2017-07-08 19:20:45','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-09T10:00:00\",descripcion : \"INICIO DE AUDIENCIAS\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"INICIO DE AUDIENCIAS\",id_sala : 1,id_tribunal : 1}'),(154,0,'INSERTAR','2017-07-08 19:25:06','ACTO',NULL,'{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ACTO DE INICIO\",id_sala : 1,id_tribunal : 1}'),(155,1,'INSERTAR','2017-07-08 19:26:08','ACTO',NULL,'{id : 2,inicio : \"2017-07-09T08:30:00\",fin : \"2017-07-09T16:00:00\",descripcion : \"ACTO DE SEGUNDA\",id_sala : 2,id_tribunal : 2}'),(156,1,'INSERTAR','2017-07-08 19:26:29','ACTO',NULL,'{id : 3,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:00:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}'),(157,1,'ELIMINAR','2017-07-08 19:26:47','ACTO','{id : 3,inicio : \"2017-07-09T09:00:00\",fin : \"2017-07-09T11:00:00\",descripcion : \"My Event 1\",id_sala : 3,id_tribunal : 1}',NULL),(158,0,'INSERTAR','2017-07-08 19:55:15','ACTO',NULL,'{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO 2\",id_sala : 1,id_tribunal : 2}'),(159,1,'INSERTAR','2017-07-09 16:18:16','ACTO',NULL,'{id : 5,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"My Event 5\",id_sala : 1,id_tribunal : 1}'),(160,1,'MODIFICAR','2017-07-09 16:21:45','ACTO','{id : 5,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"My Event 5\",id_sala : 1,id_tribunal : 1}','{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(161,1,'INSERTAR','2017-07-09 17:18:25','ACTO',NULL,'{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(162,1,'INSERTAR','2017-07-09 17:20:34','ACTO',NULL,'{id : 7,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(163,1,'INSERTAR','2017-07-09 17:20:37','ACTO',NULL,'{id : 8,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(164,0,'INSERTAR','2017-07-09 17:21:32','ACTO',NULL,'{id : 9,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ha\",id_sala : 1,id_tribunal : 1}'),(165,0,'INSERTAR','2017-07-09 17:21:48','ACTO',NULL,'{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"hs\",id_sala : 1,id_tribunal : 2}'),(166,0,'INSERTAR','2017-07-09 17:22:06','ACTO',NULL,'{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"h\",id_sala : 1,id_tribunal : 1}'),(167,0,'INSERTAR','2017-07-09 17:22:23','ACTO',NULL,'{id : 12,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"h\",id_sala : 1,id_tribunal : 2}'),(168,0,'INSERTAR','2017-07-09 17:22:44','ACTO',NULL,'{id : 13,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"h\",id_sala : 1,id_tribunal : 1}'),(169,0,'INSERTAR','2017-07-09 17:23:00','ACTO',NULL,'{id : 14,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ha\",id_sala : 1,id_tribunal : 2}'),(170,0,'INSERTAR','2017-07-09 17:23:16','ACTO',NULL,'{id : 15,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"s\",id_sala : 1,id_tribunal : 1}'),(171,0,'INSERTAR','2017-07-09 17:23:30','ACTO',NULL,'{id : 16,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"hs\",id_sala : 1,id_tribunal : 1}'),(172,0,'INSERTAR','2017-07-09 17:23:46','ACTO',NULL,'{id : 17,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"hs\",id_sala : 1,id_tribunal : 1}'),(173,0,'INSERTAR','2017-07-09 17:24:00','ACTO',NULL,'{id : 18,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"hs\",id_sala : 1,id_tribunal : 2}'),(174,0,'INSERTAR','2017-07-09 17:24:14','ACTO',NULL,'{id : 19,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"hs\",id_sala : 1,id_tribunal : 1}'),(175,0,'INSERTAR','2017-07-09 17:24:32','ACTO',NULL,'{id : 20,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"hs\",id_sala : 1,id_tribunal : 2}'),(176,0,'INSERTAR','2017-07-09 17:24:55','ACTO',NULL,'{id : 21,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"hs\",id_sala : 1,id_tribunal : 3}'),(177,1,'INSERTAR','2017-07-09 18:18:31','ACTO',NULL,'{id : 22,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(178,1,'INSERTAR','2017-07-09 18:19:09','ACTO',NULL,'{id : 23,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(179,1,'INSERTAR','2017-07-09 18:20:21','ACTO',NULL,'{id : 24,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(180,1,'INSERTAR','2017-07-09 18:22:04','ACTO',NULL,'{id : 25,inicio : \"2017-07-10T13:30:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 1}'),(181,1,'INSERTAR','2017-07-09 18:22:39','ACTO',NULL,'{id : 26,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(182,1,'INSERTAR','2017-07-09 18:24:18','ACTO',NULL,'{id : 27,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 1}'),(183,1,'INSERTAR','2017-07-09 18:27:25','ACTO',NULL,'{id : 28,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(184,1,'INSERTAR','2017-07-09 18:27:32','ACTO',NULL,'{id : 29,inicio : \"2017-07-10T15:00:00\",fin : \"2017-07-10T17:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(185,1,'INSERTAR','2017-07-09 18:29:12','ACTO',NULL,'{id : 30,inicio : \"2017-07-10T15:00:00\",fin : \"2017-07-10T17:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(186,1,'INSERTAR','2017-07-09 18:29:16','ACTO',NULL,'{id : 31,inicio : \"2017-07-10T15:00:00\",fin : \"2017-07-10T17:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 1}'),(187,0,'MODIFICAR','2017-07-09 18:33:46','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ACTO DE INICIO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-11T11:30:00\",descripcion : \"ACTO DE INICIO\",id_sala : 2,id_tribunal : 1}'),(188,0,'MODIFICAR','2017-07-09 18:34:30','ACTO','{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO 2\",id_sala : 1,id_tribunal : 2}','{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-11T11:00:00\",descripcion : \"JUICIO 2\",id_sala : 2,id_tribunal : 2}'),(189,0,'MODIFICAR','2017-07-09 18:35:14','ACTO','{id : 9,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ha\",id_sala : 1,id_tribunal : 1}','{id : 9,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-11T12:00:00\",descripcion : \"ha\",id_sala : 2,id_tribunal : 1}'),(190,0,'MODIFICAR','2017-07-09 18:36:16','ACTO','{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"hs\",id_sala : 1,id_tribunal : 2}','{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-11T11:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(191,0,'MODIFICAR','2017-07-09 18:36:40','ACTO','{id : 13,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"h\",id_sala : 1,id_tribunal : 1}','{id : 13,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-11T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(192,0,'MODIFICAR','2017-07-09 18:38:12','ACTO','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"h\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(193,0,'INSERTAR','2017-07-09 18:39:19','ACTO',NULL,'{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA MUNDO\",id_sala : 1,id_tribunal : 1}'),(194,0,'MODIFICAR','2017-07-09 18:40:17','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA MUNDO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(195,0,'MODIFICAR','2017-07-09 18:41:46','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(196,0,'MODIFICAR','2017-07-09 18:41:54','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(197,0,'MODIFICAR','2017-07-09 18:42:30','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(198,0,'MODIFICAR','2017-07-09 18:43:49','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(199,0,'MODIFICAR','2017-07-09 18:44:20','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(200,0,'MODIFICAR','2017-07-09 18:45:25','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(201,0,'MODIFICAR','2017-07-09 18:45:53','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(202,0,'MODIFICAR','2017-07-09 18:46:36','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(203,0,'MODIFICAR','2017-07-09 18:46:58','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(204,0,'MODIFICAR','2017-07-09 18:47:55','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(205,0,'MODIFICAR','2017-07-09 18:48:30','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(206,0,'INSERTAR','2017-07-09 18:56:02','ACTO',NULL,'{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 3}'),(207,1,'INSERTAR','2017-07-09 18:56:32','ACTO',NULL,'{id : 3,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"HOLA\",id_sala : 3,id_tribunal : 2}'),(208,1,'MODIFICAR','2017-07-09 19:23:25','ACTO','{id : 3,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"HOLA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 2}'),(209,0,'MODIFICAR','2017-07-09 19:25:42','ACTO','{id : 1,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(210,1,'MODIFICAR','2017-07-09 19:25:49','ACTO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(211,0,'MODIFICAR','2017-07-09 19:25:51','ACTO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"HOLA\",id_sala : 1,id_tribunal : 3}','{id : 2,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 3,id_tribunal : 3}'),(212,0,'MODIFICAR','2017-07-09 19:25:54','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(213,0,'MODIFICAR','2017-07-09 19:26:12','ACTO','{id : 1,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(214,0,'MODIFICAR','2017-07-09 19:28:06','ACTO','{id : 2,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T11:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 3,id_tribunal : 3}','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 1,id_tribunal : 3}'),(215,0,'MODIFICAR','2017-07-09 19:28:11','ACTO','{id : 2,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 1,id_tribunal : 3}','{id : 2,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 5,id_tribunal : 3}'),(216,0,'MODIFICAR','2017-07-09 19:28:15','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(217,1,'MODIFICAR','2017-07-09 19:28:20','ACTO','{id : 3,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(218,1,'INSERTAR','2017-07-09 19:39:03','ACTO',NULL,'{id : 4,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"ha\",id_sala : 3,id_tribunal : 1}'),(219,1,'MODIFICAR','2017-07-09 19:39:10','ACTO','{id : 4,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"ha\",id_sala : 3,id_tribunal : 1}','{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ha\",id_sala : 1,id_tribunal : 1}'),(220,1,'MODIFICAR','2017-07-09 19:39:15','ACTO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T08:30:00\",fin : \"2017-07-10T10:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(221,1,'MODIFICAR','2017-07-09 19:39:18','ACTO','{id : 4,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ha\",id_sala : 1,id_tribunal : 1}','{id : 4,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(222,1,'MODIFICAR','2017-07-09 19:42:13','ACTO','{id : 3,inicio : \"2017-07-10T08:30:00\",fin : \"2017-07-10T10:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(223,1,'MODIFICAR','2017-07-09 19:44:02','ACTO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(224,1,'MODIFICAR','2017-07-09 19:50:49','ACTO','{id : 3,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(225,0,'MODIFICAR','2017-07-09 19:51:49','ACTO','{id : 1,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(226,0,'ELIMINAR','2017-07-09 19:51:55','ACTO','{id : 2,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 5,id_tribunal : 3}',NULL),(227,1,'MODIFICAR','2017-07-09 19:52:12','ACTO','{id : 4,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 4,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(228,1,'ELIMINAR','2017-07-09 19:52:17','ACTO','{id : 4,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}',NULL),(229,0,'MODIFICAR','2017-07-09 19:52:20','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(230,1,'MODIFICAR','2017-07-09 19:52:23','ACTO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(231,1,'MODIFICAR','2017-07-09 19:52:27','ACTO','{id : 1,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 1,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(232,1,'MODIFICAR','2017-07-09 19:52:29','ACTO','{id : 3,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(233,1,'MODIFICAR','2017-07-09 19:52:39','ACTO','{id : 1,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 1,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(234,1,'MODIFICAR','2017-07-09 20:10:57','ACTO','{id : 3,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(235,1,'MODIFICAR','2017-07-09 20:11:02','ACTO','{id : 1,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 1,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(236,1,'MODIFICAR','2017-07-09 21:15:54','ACTO','{id : 1,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(237,1,'MODIFICAR','2017-07-09 21:16:01','ACTO','{id : 3,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(238,1,'MODIFICAR','2017-07-09 21:16:05','ACTO','{id : 1,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(239,1,'MODIFICAR','2017-07-09 21:16:08','ACTO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(240,1,'MODIFICAR','2017-07-09 21:16:13','ACTO','{id : 3,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(241,1,'ELIMINAR','2017-07-09 21:16:25','ACTO','{id : 1,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}',NULL),(242,1,'MODIFICAR','2017-07-09 21:16:29','ACTO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(243,1,'MODIFICAR','2017-07-09 21:16:46','ACTO','{id : 3,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(244,1,'MODIFICAR','2017-07-09 21:16:56','ACTO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(245,1,'MODIFICAR','2017-07-09 21:16:59','ACTO','{id : 3,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(246,1,'MODIFICAR','2017-07-09 21:18:10','ACTO','{id : 3,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T13:00:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(247,1,'MODIFICAR','2017-07-09 21:18:44','ACTO','{id : 3,inicio : \"2017-07-10T13:00:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-16T09:30:00\",fin : \"2017-07-16T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(248,1,'MODIFICAR','2017-07-09 21:18:46','ACTO','{id : 3,inicio : \"2017-07-16T09:30:00\",fin : \"2017-07-16T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-16T13:00:00\",fin : \"2017-07-16T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(249,1,'MODIFICAR','2017-07-09 21:18:51','ACTO','{id : 3,inicio : \"2017-07-16T13:00:00\",fin : \"2017-07-16T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-30T13:00:00\",fin : \"2017-07-30T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(250,1,'MODIFICAR','2017-07-09 21:19:46','ACTO','{id : 3,inicio : \"2017-07-30T13:00:00\",fin : \"2017-07-30T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-25T11:30:00\",fin : \"2017-07-25T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(251,1,'MODIFICAR','2017-07-09 21:19:54','ACTO','{id : 3,inicio : \"2017-07-25T11:30:00\",fin : \"2017-07-25T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(252,1,'MODIFICAR','2017-07-09 21:20:32','ACTO','{id : 3,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(253,1,'MODIFICAR','2017-07-09 21:59:24','ACTO','{id : 3,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 3,inicio : \"2017-07-08T20:00:00\",fin : \"2017-07-08T22:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(254,1,'INSERTAR','2017-07-10 00:35:16','ACTO',NULL,'{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"jaj\",id_sala : 5,id_tribunal : 2}'),(255,1,'INSERTAR','2017-07-10 00:35:36','ACTO',NULL,'{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"js\",id_sala : 4,id_tribunal : 1}'),(256,1,'MODIFICAR','2017-07-10 00:35:42','ACTO','{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"jaj\",id_sala : 5,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(257,1,'MODIFICAR','2017-07-10 00:35:45','ACTO','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(258,1,'MODIFICAR','2017-07-10 00:35:47','ACTO','{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(259,1,'MODIFICAR','2017-07-10 00:35:49','ACTO','{id : 5,inicio : \"2017-07-10T12:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(260,1,'MODIFICAR','2017-07-10 00:35:50','ACTO','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(261,1,'MODIFICAR','2017-07-10 00:36:27','ACTO','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(262,1,'MODIFICAR','2017-07-10 00:36:28','ACTO','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(263,1,'MODIFICAR','2017-07-10 00:36:31','ACTO','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T10:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(264,1,'MODIFICAR','2017-07-10 00:36:31','ACTO','{id : 5,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T10:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(265,1,'MODIFICAR','2017-07-10 00:36:56','ACTO','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(266,1,'MODIFICAR','2017-07-10 00:36:57','ACTO','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(267,1,'MODIFICAR','2017-07-10 00:36:59','ACTO','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(268,1,'MODIFICAR','2017-07-10 00:37:02','ACTO','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(269,1,'MODIFICAR','2017-07-10 00:37:03','ACTO','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(270,1,'MODIFICAR','2017-07-10 00:37:05','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(271,1,'MODIFICAR','2017-07-10 00:37:35','ACTO','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"js\",id_sala : 4,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(272,1,'MODIFICAR','2017-07-10 00:37:36','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(273,1,'MODIFICAR','2017-07-10 00:37:39','ACTO','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(274,1,'MODIFICAR','2017-07-10 00:37:41','ACTO','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(275,1,'MODIFICAR','2017-07-10 00:38:23','ACTO','{id : 6,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(276,1,'MODIFICAR','2017-07-10 00:38:41','ACTO','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(277,1,'MODIFICAR','2017-07-10 00:38:42','ACTO','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(278,1,'MODIFICAR','2017-07-10 00:38:45','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(279,1,'MODIFICAR','2017-07-10 00:38:46','ACTO','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(280,1,'MODIFICAR','2017-07-10 00:39:42','ACTO','{id : 6,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(281,1,'MODIFICAR','2017-07-10 00:39:44','ACTO','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(282,1,'MODIFICAR','2017-07-10 00:39:46','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(283,1,'MODIFICAR','2017-07-10 00:39:47','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(284,1,'MODIFICAR','2017-07-10 00:39:48','ACTO','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(285,1,'MODIFICAR','2017-07-10 00:39:49','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(286,1,'MODIFICAR','2017-07-10 00:39:51','ACTO','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(287,1,'MODIFICAR','2017-07-10 00:40:56','ACTO','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(288,0,'INSERTAR','2017-07-10 00:41:26','ACTO',NULL,'{id : 7,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"jx\",id_sala : 1,id_tribunal : 2}'),(289,0,'MODIFICAR','2017-07-10 00:41:31','ACTO','{id : 7,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"jx\",id_sala : 1,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(290,1,'MODIFICAR','2017-07-10 00:41:33','ACTO','{id : 7,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(291,1,'MODIFICAR','2017-07-10 00:41:35','ACTO','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(292,1,'MODIFICAR','2017-07-10 00:42:36','ACTO','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(293,1,'MODIFICAR','2017-07-10 00:42:38','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(294,1,'MODIFICAR','2017-07-10 00:43:46','ACTO','{id : 6,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(295,1,'MODIFICAR','2017-07-10 00:44:21','ACTO','{id : 7,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(296,0,'INSERTAR','2017-07-10 00:45:37','ACTO',NULL,'{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"j\",id_sala : 1,id_tribunal : 1}'),(297,1,'MODIFICAR','2017-07-10 00:45:44','ACTO','{id : 6,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(298,1,'MODIFICAR','2017-07-10 00:46:26','ACTO','{id : 7,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(299,1,'MODIFICAR','2017-07-10 00:46:28','ACTO','{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(300,1,'MODIFICAR','2017-07-10 00:46:29','ACTO','{id : 6,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(301,1,'MODIFICAR','2017-07-10 00:46:31','ACTO','{id : 5,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(302,1,'MODIFICAR','2017-07-10 00:47:31','ACTO','{id : 7,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(303,1,'MODIFICAR','2017-07-10 00:47:34','ACTO','{id : 7,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(304,1,'MODIFICAR','2017-07-10 00:47:40','ACTO','{id : 7,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T12:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(305,1,'MODIFICAR','2017-07-10 00:47:41','ACTO','{id : 7,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(306,1,'MODIFICAR','2017-07-10 00:51:27','ACTO','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(307,1,'MODIFICAR','2017-07-10 00:57:31','ACTO','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(308,1,'MODIFICAR','2017-07-10 00:57:33','ACTO','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(309,1,'MODIFICAR','2017-07-10 00:58:45','ACTO','{id : 7,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(310,1,'MODIFICAR','2017-07-10 00:58:46','ACTO','{id : 7,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(311,1,'MODIFICAR','2017-07-10 00:58:48','ACTO','{id : 7,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(312,1,'MODIFICAR','2017-07-10 01:18:26','ACTO','{id : 7,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(313,1,'MODIFICAR','2017-07-10 01:18:30','ACTO','{id : 7,inicio : \"2017-07-10T12:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(314,1,'MODIFICAR','2017-07-10 01:18:51','ACTO','{id : 7,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T12:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T13:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(315,1,'MODIFICAR','2017-07-10 01:36:21','ACTO','{id : 6,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(316,1,'MODIFICAR','2017-07-10 01:36:23','ACTO','{id : 6,inicio : \"2017-07-10T09:30:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 6,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(317,1,'MODIFICAR','2017-07-10 01:36:34','ACTO','{id : 5,inicio : \"2017-07-10T11:30:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}'),(318,1,'MODIFICAR','2017-07-10 01:39:14','ACTO','{id : 5,inicio : \"2017-07-10T10:00:00\",fin : \"2017-07-10T13:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 5,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(319,1,'MODIFICAR','2017-07-10 01:49:47','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(320,1,'MODIFICAR','2017-07-10 01:49:49','ACTO','{id : 5,inicio : \"2017-07-10T11:00:00\",fin : \"2017-07-10T14:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(321,0,'MODIFICAR','2017-07-10 01:53:08','ACTO','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"j\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(322,0,'MODIFICAR','2017-07-10 01:53:14','ACTO','{id : 8,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T11:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(323,1,'ELIMINAR','2017-07-10 01:53:31','ACTO','{id : 6,inicio : \"2017-07-10T09:00:00\",fin : \"2017-07-10T14:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}',NULL),(324,0,'MODIFICAR','2017-07-10 17:36:08','ACTO','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T09:30:00\",fin : \"2017-07-11T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(325,0,'MODIFICAR','2017-07-10 17:36:13','ACTO','{id : 8,inicio : \"2017-07-11T09:30:00\",fin : \"2017-07-11T11:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(326,0,'MODIFICAR','2017-07-10 17:36:18','ACTO','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T11:00:00\",fin : \"2017-07-11T13:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(327,1,'INSERTAR','2017-07-11 01:58:47','ACTO',NULL,'{id : 9,inicio : \"2017-07-11T08:03:00\",fin : \"2017-07-11T08:19:00\",descripcion : \"Hola\",id_sala : 3,id_tribunal : 3}'),(328,1,'MODIFICAR','2017-07-11 01:59:53','ACTO','{id : 9,inicio : \"2017-07-11T08:03:00\",fin : \"2017-07-11T08:19:00\",descripcion : \"Hola\",id_sala : 3,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:03:00\",fin : \"2017-07-11T16:19:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 3,id_tribunal : 3}'),(329,1,'MODIFICAR','2017-07-11 01:59:56','ACTO','{id : 9,inicio : \"2017-07-11T08:03:00\",fin : \"2017-07-11T16:19:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 3,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T09:03:00\",fin : \"2017-07-11T17:19:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 3,id_tribunal : 3}'),(330,0,'INSERTAR','2017-07-11 02:00:16','ACTO',NULL,'{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ja\",id_sala : 1,id_tribunal : 1}'),(331,1,'INSERTAR','2017-07-11 02:01:00','ACTO',NULL,'{id : 11,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:00:00\",descripcion : \"co\",id_sala : 4,id_tribunal : 1}'),(332,1,'INSERTAR','2017-07-11 02:06:41','ACTO',NULL,'{id : 12,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:00:00\",descripcion : \"js\",id_sala : 6,id_tribunal : 1}'),(333,1,'INSERTAR','2017-07-11 02:09:59','ACTO',NULL,'{id : 13,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:00:00\",descripcion : \"hhh\",id_sala : 2,id_tribunal : 2}'),(334,1,'INSERTAR','2017-07-11 02:11:13','ACTO',NULL,'{id : 14,inicio : \"2017-07-12T09:00:00\",fin : \"2017-07-12T17:00:00\",descripcion : \"KKK\",id_sala : 3,id_tribunal : 1}'),(335,1,'INSERTAR','2017-07-11 02:13:45','ACTO',NULL,'{id : 15,inicio : \"2017-07-17T09:00:00\",fin : \"2017-07-17T16:00:00\",descripcion : \"DDJD\",id_sala : 4,id_tribunal : 1}'),(336,1,'INSERTAR','2017-07-11 02:14:36','ACTO',NULL,'{id : 16,inicio : \"2017-07-13T12:00:00\",fin : \"2017-07-13T16:00:00\",descripcion : \"NJ\",id_sala : 3,id_tribunal : 2}'),(337,0,'MODIFICAR','2017-07-11 02:19:13','ACTO','{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"ja\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T10:30:00\",fin : \"2017-07-11T12:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(338,1,'MODIFICAR','2017-07-11 02:19:17','ACTO','{id : 10,inicio : \"2017-07-11T10:30:00\",fin : \"2017-07-11T12:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T14:00:00\",fin : \"2017-07-11T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(339,1,'MODIFICAR','2017-07-11 02:19:19','ACTO','{id : 9,inicio : \"2017-07-11T09:03:00\",fin : \"2017-07-11T17:19:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 3,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T09:03:00\",fin : \"2017-07-11T17:19:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 1,id_tribunal : 3}'),(340,1,'MODIFICAR','2017-07-11 02:19:20','ACTO','{id : 13,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:00:00\",descripcion : \"hhh\",id_sala : 2,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T09:30:00\",fin : \"2017-07-11T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(341,1,'MODIFICAR','2017-07-11 02:19:29','ACTO','{id : 9,inicio : \"2017-07-11T09:03:00\",fin : \"2017-07-11T17:19:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 1,id_tribunal : 3}','{id : 9,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 1,id_tribunal : 3}'),(342,1,'MODIFICAR','2017-07-11 02:19:35','ACTO','{id : 13,inicio : \"2017-07-11T09:30:00\",fin : \"2017-07-11T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 13,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}'),(343,1,'MODIFICAR','2017-07-11 02:19:41','ACTO','{id : 11,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:00:00\",descripcion : \"co\",id_sala : 4,id_tribunal : 1}','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"co\",id_sala : 1,id_tribunal : 1}'),(344,0,'MODIFICAR','2017-07-11 02:19:48','ACTO','{id : 8,inicio : \"2017-07-11T11:00:00\",fin : \"2017-07-11T13:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(345,1,'MODIFICAR','2017-07-11 02:19:53','ACTO','{id : 10,inicio : \"2017-07-11T14:00:00\",fin : \"2017-07-11T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(346,1,'MODIFICAR','2017-07-11 02:20:00','ACTO','{id : 12,inicio : \"2017-07-11T10:00:00\",fin : \"2017-07-11T14:00:00\",descripcion : \"js\",id_sala : 6,id_tribunal : 1}','{id : 12,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"js\",id_sala : 1,id_tribunal : 1}'),(347,0,'MODIFICAR','2017-07-11 02:20:56','ACTO','{id : 8,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T08:30:00\",fin : \"2017-07-11T10:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(348,1,'MODIFICAR','2017-07-11 02:20:58','ACTO','{id : 8,inicio : \"2017-07-11T08:30:00\",fin : \"2017-07-11T10:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(349,1,'MODIFICAR','2017-07-11 02:21:00','ACTO','{id : 9,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 1,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:30:00\",fin : \"2017-07-11T10:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(350,1,'MODIFICAR','2017-07-11 02:21:01','ACTO','{id : 9,inicio : \"2017-07-11T08:30:00\",fin : \"2017-07-11T10:30:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(351,1,'MODIFICAR','2017-07-11 02:21:05','ACTO','{id : 10,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(352,1,'MODIFICAR','2017-07-11 02:21:12','ACTO','{id : 11,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"co\",id_sala : 1,id_tribunal : 1}','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(353,1,'MODIFICAR','2017-07-11 02:21:14','ACTO','{id : 12,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"js\",id_sala : 1,id_tribunal : 1}','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(354,1,'MODIFICAR','2017-07-11 02:21:18','ACTO','{id : 13,inicio : \"0000-00-00T00:00:00\",fin : \"0000-00-00T00:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(355,1,'MODIFICAR','2017-07-11 02:21:24','ACTO','{id : 8,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(356,1,'MODIFICAR','2017-07-11 02:21:30','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(357,1,'MODIFICAR','2017-07-11 02:21:34','ACTO','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(358,1,'MODIFICAR','2017-07-11 02:21:37','ACTO','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(359,1,'MODIFICAR','2017-07-11 02:21:39','ACTO','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(360,1,'MODIFICAR','2017-07-11 02:21:43','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T10:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(361,1,'MODIFICAR','2017-07-11 03:08:16','ACTO','{id : 8,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T14:30:00\",fin : \"2017-07-12T00:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(362,1,'MODIFICAR','2017-07-11 03:08:21','ACTO','{id : 8,inicio : \"2017-07-11T14:30:00\",fin : \"2017-07-12T00:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T13:30:00\",fin : \"2017-07-11T23:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(363,1,'MODIFICAR','2017-07-11 03:09:27','ACTO','{id : 8,inicio : \"2017-07-11T13:30:00\",fin : \"2017-07-11T23:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(364,1,'MODIFICAR','2017-07-11 03:13:49','ACTO','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}','{id : 5,inicio : \"2017-07-10T10:30:00\",fin : \"2017-07-10T13:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 4,id_tribunal : 2}'),(365,1,'MODIFICAR','2017-07-11 03:13:49','ACTO','{id : 7,inicio : \"2017-07-10T13:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}','{id : 7,inicio : \"2017-07-10T13:00:00\",fin : \"2017-07-10T15:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(366,1,'MODIFICAR','2017-07-11 21:38:25','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(367,1,'MODIFICAR','2017-07-11 04:25:26','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(368,1,'MODIFICAR','2017-07-11 04:25:27','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(369,1,'MODIFICAR','2017-07-11 04:25:27','ACTO','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(370,1,'MODIFICAR','2017-07-11 04:25:27','ACTO','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(371,1,'MODIFICAR','2017-07-11 04:25:27','ACTO','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(372,1,'MODIFICAR','2017-07-11 04:25:27','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(373,1,'MODIFICAR','2017-07-11 04:25:40','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(374,1,'MODIFICAR','2017-07-11 04:25:40','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(375,1,'MODIFICAR','2017-07-11 04:25:40','ACTO','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(376,1,'MODIFICAR','2017-07-11 04:25:40','ACTO','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(377,1,'MODIFICAR','2017-07-11 04:25:40','ACTO','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(378,1,'MODIFICAR','2017-07-11 04:25:40','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(379,1,'MODIFICAR','2017-07-11 04:27:04','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(380,1,'MODIFICAR','2017-07-11 04:27:04','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(381,1,'MODIFICAR','2017-07-11 04:27:04','ACTO','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(382,1,'MODIFICAR','2017-07-11 04:27:04','ACTO','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(383,1,'MODIFICAR','2017-07-11 04:27:04','ACTO','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(384,1,'MODIFICAR','2017-07-11 04:27:04','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(385,1,'MODIFICAR','2017-07-11 04:28:33','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(386,1,'MODIFICAR','2017-07-11 04:28:33','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(387,1,'MODIFICAR','2017-07-11 04:28:33','ACTO','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(388,1,'MODIFICAR','2017-07-11 04:28:33','ACTO','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(389,1,'MODIFICAR','2017-07-11 04:28:33','ACTO','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(390,1,'MODIFICAR','2017-07-11 04:28:33','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(391,1,'MODIFICAR','2017-07-11 13:43:49','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(392,1,'MODIFICAR','2017-07-11 13:43:49','ACTO','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(393,1,'MODIFICAR','2017-07-11 13:43:49','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(394,1,'MODIFICAR','2017-07-11 13:43:49','ACTO','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(395,1,'MODIFICAR','2017-07-11 13:43:49','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(396,1,'MODIFICAR','2017-07-11 13:43:50','ACTO','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(397,1,'MODIFICAR','2017-07-11 14:03:50','ACTO','{id : 14,inicio : \"2017-07-12T09:00:00\",fin : \"2017-07-12T17:00:00\",descripcion : \"KKK\",id_sala : 3,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(398,1,'MODIFICAR','2017-07-11 14:03:52','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(399,1,'MODIFICAR','2017-07-11 14:03:54','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(400,1,'MODIFICAR','2017-07-11 14:03:58','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(401,1,'MODIFICAR','2017-07-11 14:03:59','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(402,1,'MODIFICAR','2017-07-11 14:04:00','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(403,1,'MODIFICAR','2017-07-11 14:04:01','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(404,1,'MODIFICAR','2017-07-11 14:04:02','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(405,1,'MODIFICAR','2017-07-11 14:04:04','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(406,1,'MODIFICAR','2017-07-11 14:04:06','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T10:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(407,1,'MODIFICAR','2017-07-11 14:04:14','ACTO','{id : 14,inicio : \"2017-07-12T10:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:30:00\",fin : \"2017-07-12T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(408,1,'MODIFICAR','2017-07-11 14:04:16','ACTO','{id : 14,inicio : \"2017-07-12T08:30:00\",fin : \"2017-07-12T16:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(409,1,'MODIFICAR','2017-07-11 14:04:18','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T07:30:00\",fin : \"2017-07-12T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(410,1,'MODIFICAR','2017-07-11 14:04:20','ACTO','{id : 14,inicio : \"2017-07-12T07:30:00\",fin : \"2017-07-12T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(411,1,'MODIFICAR','2017-07-11 14:04:22','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(412,1,'MODIFICAR','2017-07-11 14:04:32','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(413,1,'MODIFICAR','2017-07-11 14:07:01','ACTO','{id : 14,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 14,inicio : \"2017-07-19T08:00:00\",fin : \"2017-07-19T16:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(414,1,'MODIFICAR','2017-07-11 14:07:03','ACTO','{id : 10,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 10,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(415,1,'MODIFICAR','2017-07-11 14:07:08','ACTO','{id : 11,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}','{id : 11,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 4,id_tribunal : 1}'),(416,1,'MODIFICAR','2017-07-11 14:07:20','ACTO','{id : 10,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}','{id : 10,inicio : \"2017-07-12T09:00:00\",fin : \"2017-07-12T19:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(417,1,'MODIFICAR','2017-07-11 14:07:23','ACTO','{id : 10,inicio : \"2017-07-12T09:00:00\",fin : \"2017-07-12T19:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 10,inicio : \"2017-07-12T07:30:00\",fin : \"2017-07-12T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 3,id_tribunal : 1}'),(418,1,'MODIFICAR','2017-07-11 14:07:51','ACTO','{id : 16,inicio : \"2017-07-13T12:00:00\",fin : \"2017-07-13T16:00:00\",descripcion : \"NJ\",id_sala : 3,id_tribunal : 2}','{id : 16,inicio : \"2017-07-14T10:30:00\",fin : \"2017-07-14T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(419,1,'MODIFICAR','2017-07-11 14:07:53','ACTO','{id : 16,inicio : \"2017-07-14T10:30:00\",fin : \"2017-07-14T14:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}','{id : 16,inicio : \"2017-07-13T11:30:00\",fin : \"2017-07-13T15:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 3,id_tribunal : 2}'),(420,1,'MODIFICAR','2017-07-11 14:08:13','ACTO','{id : 12,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(421,1,'MODIFICAR','2017-07-11 14:11:39','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(422,1,'MODIFICAR','2017-07-11 14:11:39','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(423,1,'MODIFICAR','2017-07-11 14:11:39','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(424,1,'MODIFICAR','2017-07-11 14:12:49','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(425,1,'MODIFICAR','2017-07-11 14:12:49','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(426,1,'MODIFICAR','2017-07-11 14:12:49','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(427,1,'MODIFICAR','2017-07-11 14:13:16','ACTO','{id : 8,inicio : \"2017-07-11T07:30:00\",fin : \"2017-07-11T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}','{id : 8,inicio : \"2017-07-13T07:30:00\",fin : \"2017-07-13T17:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 1,id_tribunal : 1}'),(428,1,'MODIFICAR','2017-07-11 14:13:50','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(429,1,'MODIFICAR','2017-07-11 14:13:50','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(430,1,'MODIFICAR','2017-07-11 14:14:49','ACTO','{id : 9,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(431,1,'MODIFICAR','2017-07-11 14:14:57','ACTO','{id : 9,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}','{id : 9,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE ENTRADA\",id_sala : 2,id_tribunal : 3}'),(432,1,'MODIFICAR','2017-07-11 14:15:05','ACTO','{id : 13,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(433,1,'MODIFICAR','2017-07-11 14:15:12','ACTO','{id : 13,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}','{id : 13,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 6,id_tribunal : 2}'),(434,1,'MODIFICAR','2017-07-11 14:15:19','ACTO','{id : 12,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(435,1,'MODIFICAR','2017-07-11 14:15:23','ACTO','{id : 12,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-12T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}','{id : 12,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}'),(436,1,'ELIMINAR','2017-07-11 14:15:57','ACTO','{id : 12,inicio : \"2017-07-10T08:00:00\",fin : \"2017-07-10T18:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 5,id_tribunal : 1}',NULL),(437,1,'INSERTAR','2017-07-11 14:17:55','ACTO',NULL,'{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(438,1,'INSERTAR','2017-07-11 14:18:39','ACTO',NULL,'{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T08:00:00\",descripcion : \"EVENTO 2\",id_sala : 2,id_tribunal : 1}'),(439,1,'MODIFICAR','2017-07-11 14:18:56','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(440,1,'MODIFICAR','2017-07-11 14:18:56','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T08:00:00\",descripcion : \"EVENTO 2\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T08:00:00\",descripcion : \"EVENTO 2\",id_sala : 2,id_tribunal : 1}'),(441,1,'MODIFICAR','2017-07-11 14:19:16','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T08:00:00\",descripcion : \"EVENTO 2\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"EVENTO 2\",id_sala : 2,id_tribunal : 1}'),(442,1,'MODIFICAR','2017-07-11 14:19:36','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(443,1,'MODIFICAR','2017-07-11 14:20:51','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(444,1,'MODIFICAR','2017-07-11 14:21:27','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"EVENTO 2\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(445,1,'MODIFICAR','2017-07-11 14:22:01','ACTO','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(446,1,'MODIFICAR','2017-07-11 14:22:05','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(447,1,'MODIFICAR','2017-07-11 14:22:22','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(448,1,'MODIFICAR','2017-07-11 14:24:05','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(449,1,'MODIFICAR','2017-07-11 14:24:26','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(450,1,'MODIFICAR','2017-07-11 14:24:36','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(451,1,'MODIFICAR','2017-07-11 14:26:37','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(452,1,'MODIFICAR','2017-07-11 14:26:38','ACTO','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(453,1,'MODIFICAR','2017-07-11 14:26:43','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(454,1,'MODIFICAR','2017-07-11 14:27:04','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(455,1,'MODIFICAR','2017-07-11 14:27:14','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(456,1,'MODIFICAR','2017-07-11 14:28:59','ACTO','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(457,1,'MODIFICAR','2017-07-11 14:29:00','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(458,1,'MODIFICAR','2017-07-11 14:29:05','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(459,1,'MODIFICAR','2017-07-11 14:29:20','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(460,1,'MODIFICAR','2017-07-11 14:29:29','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(461,1,'MODIFICAR','2017-07-11 14:34:22','ACTO','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-13T08:00:00\",fin : \"2017-07-13T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(462,1,'MODIFICAR','2017-07-11 14:34:24','ACTO','{id : 2,inicio : \"2017-07-13T08:00:00\",fin : \"2017-07-13T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(463,1,'MODIFICAR','2017-07-11 14:34:35','ACTO','{id : 2,inicio : \"2017-07-12T08:00:00\",fin : \"2017-07-12T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-13T08:00:00\",fin : \"2017-07-13T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(464,1,'MODIFICAR','2017-07-11 14:34:38','ACTO','{id : 2,inicio : \"2017-07-13T08:00:00\",fin : \"2017-07-13T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-14T08:00:00\",fin : \"2017-07-14T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(465,1,'MODIFICAR','2017-07-11 14:35:05','ACTO','{id : 2,inicio : \"2017-07-14T08:00:00\",fin : \"2017-07-14T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-14T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(466,1,'MODIFICAR','2017-07-11 14:35:10','ACTO','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-14T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}','{id : 2,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T09:00:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 2,id_tribunal : 1}'),(467,1,'MODIFICAR','2017-07-11 14:35:25','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(468,1,'MODIFICAR','2017-07-11 14:38:19','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(469,1,'MODIFICAR','2017-07-11 14:39:22','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(470,1,'MODIFICAR','2017-07-11 14:40:41','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(471,1,'MODIFICAR','2017-07-11 14:41:02','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(472,1,'MODIFICAR','2017-07-11 14:41:26','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(473,1,'MODIFICAR','2017-07-11 14:42:20','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(474,1,'MODIFICAR','2017-07-11 14:43:53','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(475,1,'MODIFICAR','2017-07-11 14:44:57','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(476,1,'MODIFICAR','2017-07-11 14:46:08','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(477,1,'MODIFICAR','2017-07-11 14:47:13','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(478,1,'MODIFICAR','2017-07-11 14:49:49','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(479,1,'MODIFICAR','2017-07-11 14:50:46','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(480,1,'MODIFICAR','2017-07-11 14:52:17','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(481,1,'MODIFICAR','2017-07-11 14:54:27','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(482,1,'MODIFICAR','2017-07-11 14:56:53','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(483,1,'MODIFICAR','2017-07-11 14:57:24','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(484,1,'MODIFICAR','2017-07-11 14:58:42','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(485,1,'MODIFICAR','2017-07-11 15:02:39','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(486,1,'MODIFICAR','2017-07-11 15:05:36','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(487,1,'MODIFICAR','2017-07-11 15:07:17','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(488,1,'MODIFICAR','2017-07-11 15:08:14','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(489,1,'MODIFICAR','2017-07-11 15:09:10','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(490,1,'MODIFICAR','2017-07-11 15:10:21','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(491,1,'MODIFICAR','2017-07-11 15:12:04','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(492,1,'MODIFICAR','2017-07-11 15:12:38','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(493,1,'MODIFICAR','2017-07-11 15:13:45','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(494,1,'MODIFICAR','2017-07-11 15:15:35','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(495,1,'MODIFICAR','2017-07-11 15:16:03','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(496,1,'MODIFICAR','2017-07-11 15:18:41','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(497,1,'MODIFICAR','2017-07-11 15:19:33','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(498,1,'MODIFICAR','2017-07-11 15:20:45','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(499,1,'MODIFICAR','2017-07-11 15:23:00','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(500,1,'MODIFICAR','2017-07-11 17:06:26','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(501,1,'MODIFICAR','2017-07-11 17:09:42','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(502,1,'INSERTAR','2017-07-11 17:10:19','ACTO',NULL,'{id : 3,inicio : \"2017-07-12T09:00:00\",fin : \"2017-07-12T15:00:00\",descripcion : \"h\",id_sala : 3,id_tribunal : 1}'),(503,1,'MODIFICAR','2017-07-11 17:11:47','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(504,1,'INSERTAR','2017-07-11 17:12:10','ACTO',NULL,'{id : 4,inicio : \"2017-07-13T09:30:00\",fin : \"2017-07-13T15:30:00\",descripcion : \"HSS\",id_sala : 3,id_tribunal : 2}'),(505,1,'MODIFICAR','2017-07-11 17:13:06','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(506,1,'INSERTAR','2017-07-11 17:13:20','ACTO',NULL,'{id : 5,inicio : \"2017-07-13T09:30:00\",fin : \"2017-07-13T15:30:00\",descripcion : \"HSS\",id_sala : 3,id_tribunal : 1}'),(507,1,'MODIFICAR','2017-07-11 17:13:30','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(508,1,'MODIFICAR','2017-07-11 17:14:30','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(509,1,'INSERTAR','2017-07-11 17:15:03','ACTO',NULL,'{id : 6,inicio : \"2017-07-13T09:30:00\",fin : \"2017-07-13T15:30:00\",descripcion : \"HX\",id_sala : 5,id_tribunal : 1}'),(510,1,'INSERTAR','2017-07-11 17:15:59','ACTO',NULL,'{id : 7,inicio : \"2017-07-13T09:00:00\",fin : \"2017-07-13T13:00:00\",descripcion : \"ZH\",id_sala : 6,id_tribunal : 1}'),(511,1,'MODIFICAR','2017-07-11 17:16:47','ACTO','{id : 4,inicio : \"2017-07-13T09:30:00\",fin : \"2017-07-13T15:30:00\",descripcion : \"HSS\",id_sala : 3,id_tribunal : 2}','{id : 4,inicio : \"2017-07-13T09:30:00\",fin : \"2017-07-13T15:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 2}'),(512,1,'MODIFICAR','2017-07-11 17:25:27','ACTO','{id : 7,inicio : \"2017-07-13T09:00:00\",fin : \"2017-07-13T13:00:00\",descripcion : \"ZH\",id_sala : 6,id_tribunal : 1}','{id : 7,inicio : \"2017-07-13T09:30:00\",fin : \"2017-07-13T13:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(513,1,'MODIFICAR','2017-07-11 17:25:29','ACTO','{id : 7,inicio : \"2017-07-13T09:30:00\",fin : \"2017-07-13T13:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}','{id : 7,inicio : \"2017-07-13T09:30:00\",fin : \"2017-07-13T15:30:00\",descripcion : \"JUICIO DE PRESENTACION\",id_sala : 6,id_tribunal : 1}'),(514,1,'MODIFICAR','2017-07-11 17:45:06','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(515,1,'MODIFICAR','2017-07-11 17:48:25','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(516,1,'MODIFICAR','2017-07-11 17:49:21','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(517,1,'MODIFICAR','2017-07-11 17:50:53','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(518,1,'MODIFICAR','2017-07-11 17:52:34','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(519,1,'MODIFICAR','2017-07-11 17:54:20','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(520,1,'MODIFICAR','2017-07-11 17:54:38','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(521,1,'MODIFICAR','2017-07-11 17:56:26','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(522,1,'MODIFICAR','2017-07-11 17:57:10','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(523,1,'MODIFICAR','2017-07-11 18:00:02','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(524,1,'MODIFICAR','2017-07-11 18:02:38','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(525,1,'MODIFICAR','2017-07-11 18:03:27','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(526,1,'MODIFICAR','2017-07-11 18:03:54','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(527,1,'MODIFICAR','2017-07-11 18:04:13','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(528,1,'MODIFICAR','2017-07-11 18:06:29','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(529,1,'MODIFICAR','2017-07-11 18:07:49','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(530,1,'MODIFICAR','2017-07-11 18:22:22','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(531,1,'MODIFICAR','2017-07-11 18:23:44','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(532,1,'MODIFICAR','2017-07-11 18:27:05','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(533,1,'MODIFICAR','2017-07-11 18:27:18','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(534,1,'MODIFICAR','2017-07-11 18:27:48','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(535,1,'MODIFICAR','2017-07-11 18:28:18','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(536,1,'MODIFICAR','2017-07-11 18:29:09','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(537,1,'MODIFICAR','2017-07-11 18:29:36','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(538,1,'MODIFICAR','2017-07-11 18:33:39','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(539,1,'MODIFICAR','2017-07-11 18:36:43','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(540,1,'MODIFICAR','2017-07-11 18:38:17','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(541,1,'MODIFICAR','2017-07-11 18:39:00','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(542,1,'MODIFICAR','2017-07-11 18:39:17','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(543,1,'MODIFICAR','2017-07-11 18:42:07','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(544,1,'MODIFICAR','2017-07-11 18:42:20','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(545,1,'MODIFICAR','2017-07-11 18:43:07','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(546,1,'MODIFICAR','2017-07-11 18:43:21','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(547,1,'MODIFICAR','2017-07-11 18:45:04','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(548,1,'MODIFICAR','2017-07-11 18:45:16','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(549,1,'MODIFICAR','2017-07-11 18:48:43','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(550,1,'MODIFICAR','2017-07-11 18:48:55','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(551,1,'MODIFICAR','2017-07-11 18:50:06','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(552,1,'MODIFICAR','2017-07-11 18:50:25','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(553,1,'MODIFICAR','2017-07-11 18:52:48','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(554,1,'MODIFICAR','2017-07-11 18:53:37','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(555,1,'MODIFICAR','2017-07-11 18:54:41','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(556,1,'MODIFICAR','2017-07-11 18:56:23','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(557,1,'MODIFICAR','2017-07-11 18:56:56','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(558,1,'MODIFICAR','2017-07-11 18:58:30','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(559,1,'MODIFICAR','2017-07-11 19:10:14','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(560,1,'MODIFICAR','2017-07-11 19:10:50','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(561,1,'MODIFICAR','2017-07-11 19:11:20','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(562,1,'MODIFICAR','2017-07-11 19:32:03','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(563,1,'MODIFICAR','2017-07-11 19:32:23','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(564,1,'MODIFICAR','2017-07-11 19:34:02','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(565,1,'MODIFICAR','2017-07-11 19:34:16','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(566,1,'MODIFICAR','2017-07-11 19:43:19','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(567,1,'MODIFICAR','2017-07-11 19:43:44','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(568,1,'MODIFICAR','2017-07-11 19:50:41','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(569,1,'MODIFICAR','2017-07-11 19:51:14','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(570,1,'MODIFICAR','2017-07-11 19:53:04','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(571,1,'MODIFICAR','2017-07-11 19:53:19','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(572,1,'MODIFICAR','2017-07-11 19:55:45','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(573,1,'MODIFICAR','2017-07-11 19:55:59','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(574,1,'MODIFICAR','2017-07-11 19:59:14','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(575,1,'MODIFICAR','2017-07-11 19:59:28','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(576,1,'MODIFICAR','2017-07-11 20:05:06','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(577,1,'MODIFICAR','2017-07-11 20:05:27','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(578,1,'MODIFICAR','2017-07-11 20:08:12','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(579,1,'MODIFICAR','2017-07-11 20:08:29','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(580,1,'MODIFICAR','2017-07-11 20:22:17','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(581,1,'MODIFICAR','2017-07-11 20:22:57','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(582,1,'MODIFICAR','2017-07-11 20:23:26','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(583,1,'MODIFICAR','2017-07-11 20:25:48','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(584,1,'MODIFICAR','2017-07-11 20:26:11','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(585,1,'MODIFICAR','2017-07-11 20:28:02','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(586,1,'MODIFICAR','2017-07-11 20:28:15','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(587,1,'MODIFICAR','2017-07-11 20:30:24','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(588,1,'MODIFICAR','2017-07-11 20:30:39','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(589,1,'MODIFICAR','2017-07-11 20:45:12','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(590,1,'MODIFICAR','2017-07-11 20:46:37','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(591,1,'MODIFICAR','2017-07-11 20:48:07','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(592,1,'MODIFICAR','2017-07-11 20:49:49','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(593,1,'MODIFICAR','2017-07-11 20:53:11','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(594,1,'MODIFICAR','2017-07-11 20:53:49','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(595,1,'MODIFICAR','2017-07-11 20:55:05','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(596,1,'MODIFICAR','2017-07-11 20:56:18','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(597,1,'MODIFICAR','2017-07-11 20:57:57','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(598,1,'MODIFICAR','2017-07-11 21:00:19','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(599,1,'MODIFICAR','2017-07-11 21:00:49','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(600,1,'MODIFICAR','2017-07-11 21:01:23','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(601,1,'MODIFICAR','2017-07-11 21:06:26','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(602,1,'MODIFICAR','2017-07-11 21:07:13','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(603,1,'MODIFICAR','2017-07-11 21:08:26','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(604,1,'MODIFICAR','2017-07-11 21:08:49','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(605,1,'MODIFICAR','2017-07-11 21:09:23','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(606,1,'MODIFICAR','2017-07-11 21:10:20','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(607,1,'MODIFICAR','2017-07-11 21:15:03','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(608,1,'MODIFICAR','2017-07-11 21:15:39','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(609,1,'MODIFICAR','2017-07-11 21:16:48','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(610,1,'MODIFICAR','2017-07-11 21:17:41','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(611,1,'MODIFICAR','2017-07-11 21:18:05','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(612,1,'MODIFICAR','2017-07-11 21:18:47','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(613,1,'MODIFICAR','2017-07-11 21:19:25','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(614,1,'MODIFICAR','2017-07-11 21:19:50','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(615,1,'MODIFICAR','2017-07-11 21:20:14','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(616,1,'MODIFICAR','2017-07-11 21:21:07','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(617,1,'MODIFICAR','2017-07-11 21:21:33','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(618,1,'MODIFICAR','2017-07-11 21:22:15','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(619,1,'MODIFICAR','2017-07-11 21:22:40','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(620,1,'MODIFICAR','2017-07-11 21:23:17','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(621,1,'MODIFICAR','2017-07-11 21:40:39','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(622,1,'MODIFICAR','2017-07-11 21:40:55','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(623,1,'MODIFICAR','2017-07-11 21:41:28','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(624,1,'MODIFICAR','2017-07-11 21:41:52','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(625,1,'MODIFICAR','2017-07-11 21:42:16','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(626,1,'MODIFICAR','2017-07-11 21:47:03','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(627,1,'MODIFICAR','2017-07-11 21:48:21','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(628,1,'MODIFICAR','2017-07-11 21:50:41','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(629,1,'MODIFICAR','2017-07-11 21:51:07','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(630,1,'MODIFICAR','2017-07-11 21:52:46','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(631,1,'MODIFICAR','2017-07-11 21:53:37','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(632,1,'MODIFICAR','2017-07-11 21:54:14','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(633,1,'MODIFICAR','2017-07-11 21:54:52','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(634,1,'MODIFICAR','2017-07-11 21:55:39','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(635,1,'MODIFICAR','2017-07-11 21:56:05','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(636,1,'MODIFICAR','2017-07-11 21:57:04','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(637,1,'MODIFICAR','2017-07-11 22:01:14','ACTO','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}','{id : 1,inicio : \"2017-07-11T08:00:00\",fin : \"2017-07-11T18:00:00\",descripcion : \"EVENTO\",id_sala : 1,id_tribunal : 1}'),(638,0,'INSERTAR','2017-07-11 23:57:01','ACTO',NULL,'{id : 8,inicio : \"2017-07-12T09:00:00\",fin : \"2017-07-12T14:30:00\",descripcion : \"jh\",id_sala : 4,id_tribunal : 2}');
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
  `numero` int(11) NOT NULL,
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
INSERT INTO `caso` VALUES (1,1,'ROBO A MANO ARMADA',0,'2017-07-08 18:54:07');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_fiscal`
--

LOCK TABLES `caso_fiscal` WRITE;
/*!40000 ALTER TABLE `caso_fiscal` DISABLE KEYS */;
INSERT INTO `caso_fiscal` VALUES (1,1,'V-13');
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
  `numero_caso` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_imputado`
--

LOCK TABLES `caso_imputado` WRITE;
/*!40000 ALTER TABLE `caso_imputado` DISABLE KEYS */;
INSERT INTO `caso_imputado` VALUES (1,1,'V-21301059');
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
  `numero_caso` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_victima`
--

LOCK TABLES `caso_victima` WRITE;
/*!40000 ALTER TABLE `caso_victima` DISABLE KEYS */;
INSERT INTO `caso_victima` VALUES (1,1,'V-2130160');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_notificaciones`
--

LOCK TABLES `config_notificaciones` WRITE;
/*!40000 ALTER TABLE `config_notificaciones` DISABLE KEYS */;
INSERT INTO `config_notificaciones` VALUES (1,'../message_server/sms/api/outbox','../message_server/sms/schedule','../message_server/mail/api','smtp.gmail.com',465,'dem.sanfelipe@gmail.com','qwertyuiop1234567890');
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
INSERT INTO `config_programador` VALUES (1,'es',0,0,1,'08:00:00','18:00:00',1,'08:00:00','18:00:00','00:30:00','NO SE HAN CREADO ACTOS',1,'agendaDay',0,'',0,1,1);
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
INSERT INTO `defensor` VALUES (1,'V-3','PRIVADO','28828282');
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
INSERT INTO `fiscal` VALUES (1,'V-13',12,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imputado`
--

LOCK TABLES `imputado` WRITE;
/*!40000 ALTER TABLE `imputado` DISABLE KEYS */;
INSERT INTO `imputado` VALUES (1,'V-21301059','IMPUTADO'),(2,'V-1','IMPUTADO');
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
INSERT INTO `juez` VALUES (1,'V-9');
/*!40000 ALTER TABLE `juez` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (2,'V-2130160','MARIANGEL JOSNELLY','MEDINA GAUTIER','MARIANGELJMEDINAG@GMAIL.COM','+58 426 784 95 55','27/12/1993',6,NULL,'2017-07-03 18:31:20'),(4,'V-1','MONICA','PEREZ','MONICAPEREZ@GMAIL.COM','+58 838 838 38 38','12/12/1992',4,NULL,'2017-07-04 11:51:06'),(5,'V-2','JUAN','RODRIGUEZ','JUAN@H.COM','+58 394 839 84 83','20/10/1992',6,NULL,'2017-07-04 11:51:44'),(6,'V-3','JUAN','RODRIGUEZ','JUA@JSJ.COM','+58 282 882 82 82','12/12/1992',1,NULL,'2017-07-04 12:08:11'),(7,'V-9','MANUEL','PEREZ','SJSJS@SJS','+58 828 288 28 28','20/10/1992',5,NULL,'2017-07-04 12:08:38'),(8,'V-10','ZUAH','MOJARES','AJA@SJS','+58 282 882 82 82','20/10/1992',7,NULL,'2017-07-04 12:09:34'),(9,'V-11','MKS','SISIS','SJSJS@SJS','+58 282 828 82 82','20/10/1992',3,NULL,'2017-07-04 12:09:59'),(10,'V-12','MARIA','PEREZ','JUA@SJS','+58 999 292 92 92','20/10/1992',2,NULL,'2017-07-04 12:11:58'),(11,'V-13','MABRE ','RODRIGUEZ','AAJAJ@SJSJ','+58 343 33 33 333','20/10/1993',8,1,'2017-07-04 12:17:28'),(16,'V-21301059','ANTHONY','MEDINA','ANTHONYJMEDINAF@GMAIL.COM','+58 426 357 54 89','20/10/1992',4,1,'2017-07-11 20:33:47'),(25,'V-39394309','MILAGROS','RODRIGUEZ','ANTHONYJMEDINAF@GMAIL.COM','+58 282 828 28 28','13/07/2017',4,NULL,'2017-07-11 20:27:04'),(27,'V-29292983','SJSJSJ','JSSJSJ','ANTHONYJMEDINAF@GMAIL.COM','+58 398 383 93 83','27/07/2017',4,NULL,'2017-07-11 20:31:19'),(28,'V-21301060','JUAN','PEREZ','JUAN@SJS','+58 388 838 38 38','13/07/2017',4,NULL,'2017-07-11 21:42:52'),(29,'V-21301061','JUSJ','QJSSJQ','HDHDD2@CH','+58 982 303 90 29','04/07/2017',4,NULL,'2017-07-11 21:43:53'),(30,'V-21301062','JAJAJAJ','JWJWJ','JSJSJ@SJS','+58 387 398 38 93','19/07/2017',4,NULL,'2017-07-11 21:44:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'SALA 1','#ff0000',1,'2017-07-03 18:28:49'),(2,'SALA 2','#1f68b0',1,'2017-07-04 15:50:15'),(3,'SALA 3','#319836',1,'2017-07-06 02:52:35'),(4,'SALA 4','#8124cc',1,'2017-07-06 02:52:51'),(5,'SALA 5','#fb9f00',1,'2017-07-06 02:53:10'),(6,'SALA 6','#d926de',1,'2017-07-06 02:53:33');
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
INSERT INTO `secretaria` VALUES (1,'V-12');
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
INSERT INTO `testigo` VALUES (1,'V-10',0);
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
INSERT INTO `tipo_de_tribunal` VALUES (1,'TRIBUNAL DE JUICIO',0,'2017-07-04 12:55:09'),(2,'TRIBUNAL DE CONTROL',0,'2017-07-04 12:55:16'),(3,'TRIBUNAL ITINERANTE',0,'2017-07-04 12:55:31');
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
INSERT INTO `tipo_persona` VALUES (1,'DEFENSOR',1,'2017-07-11 18:25:03'),(2,'SECRETARIA',1,'2017-07-11 18:25:06'),(3,'ALGUACIL',1,'2017-07-11 18:25:08'),(4,'IMPUTADO',1,'2017-07-11 18:25:10'),(5,'JUEZ',1,'2017-07-11 18:25:13'),(6,'VICTIMA',1,'2017-07-11 18:25:16'),(7,'TESTIGO',1,'2017-07-11 18:25:19'),(8,'FISCAL',1,'2017-07-11 18:25:21'),(9,'USUARIO',1,'2017-07-11 18:24:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tribunal`
--

LOCK TABLES `tribunal` WRITE;
/*!40000 ALTER TABLE `tribunal` DISABLE KEYS */;
INSERT INTO `tribunal` VALUES (1,'TRIBUNAL 12',1,0,'2017-07-04 16:23:53'),(2,'TRIBUNAL 13',2,0,'2017-07-04 16:23:57'),(3,'TRIBUNAL 14',3,0,'2017-07-04 16:24:02');
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
  `nivel` varchar(100) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`cedula`),
  UNIQUE KEY `id_persona` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (6,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd','ADMINISTRADOR',1,'2017-07-11 19:40:55'),(18,'V-21301060','82d5efc7445e0ef2cc38692b039bc874fca2b009','USUARIO ESPECIAL',NULL,'2017-07-11 21:42:52'),(19,'V-21301061','815b6f098b817d8fc731ad5f4518505b88a32fbc','USUARIO COMUN',NULL,'2017-07-11 21:43:53'),(20,'V-21301062','c9c4edfbf342df60e476b70f428962e1bbce1ff4','SECRETARIA',NULL,'2017-07-11 21:44:23');
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
INSERT INTO `victima` VALUES (2,'V-2'),(1,'V-2130160');
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
/*!50001 VIEW `acto_sala` AS select `acto`.`id` AS `id`,`acto`.`inicio` AS `start`,`acto`.`fin` AS `end`,`acto`.`id_sala` AS `resourceId`,`acto`.`estatus` AS `estatus`,`actividad`.`actividad` AS `title`,`caso`.`numero` AS `numero`,`caso`.`descripcion` AS `descripcion`,`sala`.`descripcion` AS `sala`,`tribunal`.`id` AS `id_tribunal`,`tribunal`.`numero` AS `tribunal` from ((((`acto` join `actividad` on((`acto`.`id_actividad` = `actividad`.`id`))) join `caso` on((`acto`.`numero_caso` = `caso`.`numero`))) join `sala` on((`acto`.`id_sala` = `sala`.`id`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) */;
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
/*!50001 VIEW `vista_usuario` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`usuario`.`clave` AS `clave`,`usuario`.`nivel` AS `nivel`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `usuario` on((`persona`.`cedula` = `usuario`.`cedula`))) */;
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

-- Dump completed on 2017-07-11 20:14:24
