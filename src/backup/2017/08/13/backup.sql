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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acto`
--

LOCK TABLES `acto` WRITE;
/*!40000 ALTER TABLE `acto` DISABLE KEYS */;
INSERT INTO `acto` VALUES (1,'2017-07-28T09:00:00','2017-07-28T16:00:00','JUICIO DE PRESENTACION',1,1,1,1,'ASIGNADO',0,'2017-07-27 03:08:58'),(2,'2017-07-27T09:30:00','2017-07-27T16:30:00','JUICIO DE SALIDA',1,2,2,3,'ASIGNADO',2,'2017-07-27 03:23:28');
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
INSERT INTO `alguacil` VALUES (1,'V-21301062');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,1,'MODIFICAR','2017-07-27 03:19:15','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-07-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-07-27T09:30:00\",fin : \"2017-07-27T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}','{id : 2,inicio : \"2017-07-27T09:30:00\",fin : \"2017-07-27T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 3}'),(2,2,'MODIFICAR','2017-07-27 03:23:28','ACTO','SE HA MODIFICADO UN ACTO PARA EL DIA 2017-07-27T09:30:00 CUYA DESCRIPCION ES JUICIO DE SALIDA Y SU ESTATUS ES ASIGNADO','{id : 2,inicio : \"2017-07-27T09:30:00\",fin : \"2017-07-27T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 1,id_tribunal : 3}','{id : 2,inicio : \"2017-07-27T09:30:00\",fin : \"2017-07-27T16:30:00\",descripcion : \"JUICIO DE SALIDA\",id_sala : 2,id_tribunal : 3}');
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
INSERT INTO `caso` VALUES (1,1,'ROBO A MANO ARMADA',0,'2017-07-27 03:05:56');
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
INSERT INTO `caso_imputado` VALUES (1,1,'V-21301065');
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
INSERT INTO `caso_victima` VALUES (1,1,'V-21301064');
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
INSERT INTO `defensor` VALUES (1,'V-21301060','PRIVADO','3874783784');
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
INSERT INTO `fiscal` VALUES (1,'V-21301067',18,0);
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
INSERT INTO `imputado` VALUES (1,'V-21301065','IMPUTADO');
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
INSERT INTO `juez` VALUES (1,'V-21301061');
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
  `icon` varchar(5000) NOT NULL,
  `body` varchar(5000) NOT NULL,
  `url` varchar(5000) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 15:37:04',0),(2,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:13:55',0),(3,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:13:50',0),(4,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:12:55',0),(5,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:12:54',0),(6,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:11:15',0),(7,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:10:19',0),(8,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:10:13',0),(9,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:07:57',0),(10,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:04:34',0),(11,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:02:30',0),(12,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:02:25',0),(13,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:02:23',0),(14,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:23:01',0),(15,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:23:03',0),(16,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:25:26',0),(17,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:25:24',0),(18,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:25:28',0),(19,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:29:03',0),(20,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:29:01',0),(21,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:29:05',0),(22,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:25:35',0),(23,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:21:45',0),(24,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:21:42',0),(25,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:21:40',0),(26,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:21:31',0),(27,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:20:33',0),(28,'Jose Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:19:22',0),(29,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:19:17',0),(30,'Juan Medina ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:18:42',0),(31,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:18:33',0),(32,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:38:58',0),(33,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:35:53',0),(34,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:32:17',0),(35,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:31:26',0),(36,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:31:23',0),(37,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:30:21',0),(38,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:40:23',0),(39,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:42:18',0),(40,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:00:51',0),(41,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:44:08',0),(42,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:44:06',0),(43,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:44:04',0),(44,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:44:03',0),(45,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:44:01',0),(46,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:43:42',0),(47,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:43:36',0),(48,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:43:34',0),(49,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:43:32',0),(50,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:43:29',0),(51,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 17:43:22',0),(52,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:01:38',0),(53,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:30:27',0),(54,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:01:34',0),(55,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:01:33',0),(56,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:01:31',0),(57,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:01:30',0),(58,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:01:28',0),(59,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:01:26',0),(60,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 18:01:24',0),(61,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 19:02:11',0),(62,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 20:19:36',1),(63,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 20:47:58',0),(64,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 20:48:22',0),(65,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 20:48:20',0),(66,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 20:19:59',0),(67,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 20:19:53',0),(68,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 20:55:29',1),(69,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 20:56:58',1),(70,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:00:54',1),(71,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:00:54',1),(72,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:00:55',1),(73,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:00:56',1),(74,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:00:56',1),(75,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:00:57',1),(76,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:00:57',1),(77,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:01:55',1),(78,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:01:58',1),(79,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:01:59',1),(80,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:03:20',1),(81,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:03:21',1),(82,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:05:01',1),(83,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:05:01',1),(84,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:05:48',1),(85,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:06:56',1),(86,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:08:49',1),(87,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:09:38',1),(88,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:10:24',1),(89,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:12:05',1),(90,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:12:06',1),(91,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:12:58',1),(92,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:12:59',1),(93,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:16:59',1),(94,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:17:00',1),(95,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:17:01',1),(96,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:17:02',1),(97,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:17:02',1),(98,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:17:03',1),(99,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:19:47',1),(100,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:20:45',1),(101,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:21:15',1),(102,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:22:44',1),(103,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:23:32',1),(104,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:25:24',1),(105,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:25:30',1),(106,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:25:34',1),(107,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:26:24',1),(108,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:29:07',1),(109,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:29:08',1),(110,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:29:08',1),(111,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:29:09',1),(112,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:30:01',1),(113,'Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:06',1),(114,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:24',1),(115,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:24',1),(116,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:25',1),(117,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:25',1),(118,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:28',1),(119,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:29',1),(120,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:30',1),(121,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:30',1),(122,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:31',1),(123,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:32',1),(124,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:32',1),(125,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:31:33',1),(126,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:35:52',1),(127,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:36:46',1),(128,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:36:47',1),(129,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:36:47',1),(130,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:36:48',1),(131,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:36:49',1),(132,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:36:49',1),(133,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:38:49',1),(134,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:38:52',1),(135,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:42:43',1),(136,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:44:48',1),(137,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:45:36',1),(138,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:49:52',1),(139,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:52:27',1),(140,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:55:04',1),(141,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:56:20',1),(142,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 21:56:20',1),(143,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:02:21',1),(144,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:03:21',1),(145,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:04:52',1),(146,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:10:08',0),(147,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:07:10',0),(148,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:08:10',0),(149,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:10:23',0),(150,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:10:42',0),(151,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:10:40',0),(152,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:11:28',0),(153,'Jose Perez ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:11:48',0),(154,'Jose 2 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:12:27',0),(155,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:12:40',0),(156,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:18:31',0),(157,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:19:01',0),(158,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:18:53',0),(159,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:21:37',0),(160,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:24:10',0),(161,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:21:30',1),(162,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:23:39',0),(163,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:23:45',0),(164,'Jose 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:23:48',0),(165,'totup 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:24:54',0),(166,'kjss 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:24:49',0),(167,'kjss 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:26:48',0),(168,'kjss skjshkjs ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','','2017-08-14 01:55:15',0),(169,'ANthony 33 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-14 01:54:14',0),(170,'kjss 33398 ha agregado un nuevo acto','3.png','Juan Medina a agregado un nuevo acto para el numero de causa NM-839CF, cuyo descripcion corresponde a robo a mano armada en la sala numero 3','programador','2017-08-13 22:27:51',0);
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
  `id_tipo_persona` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`,`email`,`telefono`),
  UNIQUE KEY `cedula_2` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'V-21301059','ANTHONY','MEDINA','ANTHONYJMEDINAF@GMAIL.COM','+58 426 357 54 89','20/10/1993',9,1,'2017-08-10 19:39:52'),(2,'V-21301060','JUAN','PEREZ','JUANPEREZ@GMAIL.COM','+58 398 394 83 74','20/10/1992',1,0,'2017-07-27 02:56:56'),(3,'V-21301061','JOSE','MUJICA','JOSEMUJICA@GMAIL.COM','+58 398 389 83 83','20/10/1992',5,0,'2017-07-27 02:57:27'),(4,'V-21301062','RAUL','MEJIAS','RANUELMEDIN@GMAIL.COM','+58 393 893 83 30','20/20/1992',3,0,'2017-07-27 02:58:05'),(5,'V-21301063','JUANA','ARAUJO','JUANAARAUJO@GMAIL.COM','+58 393 998 89 33','20/10/1992',2,0,'2017-07-27 02:59:08'),(6,'V-21301064','MANUEL','MOLINOS','MANUELMOLINO@GMAIL.COM','+58 398 393 89 83','20/10/1993',6,0,'2017-07-27 02:59:43'),(7,'V-21301065','MILAGROS','PEREZ','MILIPEREZ@GMAIL.COM','+58 828 393 83 93','20/10/1992',4,0,'2017-07-27 03:00:24'),(8,'V-21301066','JUAN','SANCHEZ','JUANSAN@GMAIL.COM','+58 393 893 83 93','20/10/1992',7,0,'2017-07-27 03:00:56'),(9,'V-21301067','CARLOS','CAMACAROS','CARLOSCA@GMAIL.COM','+58 393 933 89 38','20/10/1992',8,0,'2017-07-27 03:01:45'),(10,'V-21301058','JUAN','RODRIGUEZ','JUANRODRIGUEZ@GMAIL.COM','+58 393 930 30 39','20/10/1993',9,1,'2017-07-27 03:21:15'),(11,'V-21301057','MONICA','SUAREZ','MONICASUA@GMAIL.COM','+58 398 390 30 39','20/10/1992',9,1,'2017-07-27 03:21:56'),(12,'V-21301056','MILAGROS','MIJARES','MMILIA@GMAIL.COM','+58 393 903 03 93','20/10/1992',9,1,'2017-07-27 03:22:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'SALA 1','#f92323',0,'2017-07-27 02:53:49'),(2,'SALA 2','#3882ea',0,'2017-07-27 02:54:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretaria`
--

LOCK TABLES `secretaria` WRITE;
/*!40000 ALTER TABLE `secretaria` DISABLE KEYS */;
INSERT INTO `secretaria` VALUES (1,'V-21301063');
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
INSERT INTO `testigo` VALUES (1,'V-21301066',0);
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
  `nivel` varchar(100) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`cedula`),
  UNIQUE KEY `id_persona` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'V-21301059','ae45ad6d9902c5483018e334239613881a77b5dd','ADMINISTRADOR',0,'2017-07-27 02:53:17'),(2,'V-21301058','b8998f23236c710ce4ab903c39f71f5b9aa13b33','USUARIO ESPECIAL',NULL,'2017-07-27 03:21:15'),(3,'V-21301057','37c29f74d31ed6e17adf640d5b1210ee302ef101','USUARIO COMUN',NULL,'2017-07-27 03:21:56'),(4,'V-21301056','2ccbc5f6e258bcdaffd9e7d0eedd0d8db4d59109','SECRETARIA',NULL,'2017-07-27 03:22:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victima`
--

LOCK TABLES `victima` WRITE;
/*!40000 ALTER TABLE `victima` DISABLE KEYS */;
INSERT INTO `victima` VALUES (1,'V-21301064');
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

-- Dump completed on 2017-08-13 23:11:30
