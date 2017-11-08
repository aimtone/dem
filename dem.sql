-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-11-2017 a las 09:55:43
-- Versión del servidor: 5.5.58-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dem`
--
CREATE DATABASE IF NOT EXISTS `dem`;
USE `dem`; 
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE IF NOT EXISTS `actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actividad` varchar(1000) NOT NULL,
  `id_tipo_tribunal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `actividad`
--
DROP TRIGGER IF EXISTS `eliminar_actividad`;
DELIMITER //
CREATE TRIGGER `eliminar_actividad` BEFORE DELETE ON `actividad`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertar_actividad`;
DELIMITER //
CREATE TRIGGER `insertar_actividad` AFTER INSERT ON `actividad`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `modificar_actividad`;
DELIMITER //
CREATE TRIGGER `modificar_actividad` BEFORE UPDATE ON `actividad`
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acto`
--

CREATE TABLE IF NOT EXISTS `acto` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `acto`
--
DROP TRIGGER IF EXISTS `eliminar_acto`;
DELIMITER //
CREATE TRIGGER `eliminar_acto` BEFORE DELETE ON `acto`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertar_acto`;
DELIMITER //
CREATE TRIGGER `insertar_acto` AFTER INSERT ON `acto`
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `acto_sala`
--
CREATE TABLE IF NOT EXISTS `acto_sala` (
`id` int(11)
,`start` varchar(40)
,`end` varchar(20)
,`resourceId` int(11)
,`estatus` varchar(20)
,`title` text
,`numero` varchar(300)
,`descripcion` varchar(5000)
,`descripcion_acto` varchar(200)
,`sala` varchar(100)
,`id_tribunal` int(11)
,`tribunal` varchar(200)
,`id_tipo_tribunal` int(11)
,`tipo_de_tribunal` varchar(200)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alguacil`
--

CREATE TABLE IF NOT EXISTS `alguacil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE IF NOT EXISTS `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `operacion` varchar(10) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tabla` varchar(40) NOT NULL,
  `accion` mediumtext NOT NULL,
  `registro_anterior` longtext,
  `registro_nuevo` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso`
--

CREATE TABLE IF NOT EXISTS `caso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(300) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `caso`
--
DROP TRIGGER IF EXISTS `eliminar_caso`;
DELIMITER //
CREATE TRIGGER `eliminar_caso` AFTER DELETE ON `caso`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertar_caso`;
DELIMITER //
CREATE TRIGGER `insertar_caso` AFTER INSERT ON `caso`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `modificar_caso`;
DELIMITER //
CREATE TRIGGER `modificar_caso` AFTER UPDATE ON `caso`
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_alguacil`
--

CREATE TABLE IF NOT EXISTS `caso_alguacil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(50) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '3',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'ALGUACIL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_defensor`
--

CREATE TABLE IF NOT EXISTS `caso_defensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(50) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '1',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'DEFENSOR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_fiscal`
--

CREATE TABLE IF NOT EXISTS `caso_fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '8',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'FISCAL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_imputado`
--

CREATE TABLE IF NOT EXISTS `caso_imputado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(200) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '4',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'IMPUTADO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_juez`
--

CREATE TABLE IF NOT EXISTS `caso_juez` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(20) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '5',
  `tipo_persona` varchar(50) NOT NULL DEFAULT 'JUEZ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_testigo`
--

CREATE TABLE IF NOT EXISTS `caso_testigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(50) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '7',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'TESTIGO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_victima`
--

CREATE TABLE IF NOT EXISTS `caso_victima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_caso` varchar(200) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL DEFAULT '6',
  `tipo_persona` varchar(200) NOT NULL DEFAULT 'VICTIMA',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_datatables`
--

CREATE TABLE IF NOT EXISTS `config_datatables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_keys` tinyint(1) NOT NULL,
  `info` tinyint(1) NOT NULL,
  `stateSave` tinyint(1) NOT NULL,
  `scrollCollapse` tinyint(1) NOT NULL,
  `responsive` tinyint(1) NOT NULL,
  `paging` tinyint(1) NOT NULL,
  `colReorder` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `config_datatables`
--

INSERT INTO `config_datatables` (`id`, `_keys`, `info`, `stateSave`, `scrollCollapse`, `responsive`, `paging`, `colReorder`) VALUES
(1, 1, 0, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_generales`
--

CREATE TABLE IF NOT EXISTS `config_generales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basedatos` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `niveles_acesso` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `config_generales`
--

INSERT INTO `config_generales` (`id`, `basedatos`, `usuario`, `clave`, `niveles_acesso`) VALUES
(1, 'dem', 'root', 'root', '{"/":[1,2,3,4],"/perfil":[1,2,3,4],"/programador":[1,2,3],"/programador/:fecha":[1,2,3],"/programador/:fecha/:id":[1,2,3],"/defensor":[1,2],"/secretaria":[1,2],"/alguacil":[1,2],"/imputado":[1,2],"/juez":[1,2],"/actividad":[1,2],"/victima":[1,2],"/testigo":[1,2],"/fiscal":[1,2],"/sala":[1,2],"/tribunal":[1,2],"/tipo_de_tribunal":[1,2],"/usuario":[1],"/acto":[1,2,3],"/actos":[1,2,3],"/caso":[1,2,3],"/casos":[1,2,3],"/bitacora":[1],"/respaldo":[1],"/mensajes":[1,2],"/notificaciones":[1,2,3,4],"/ajustes":[1],"/nivel":[1]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_notificaciones`
--

CREATE TABLE IF NOT EXISTS `config_notificaciones` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `config_notificaciones`
--

INSERT INTO `config_notificaciones` (`id`, `servSMSinst`, `servSMSprog`, `servEmail`, `servSMTP`, `puerto`, `email`, `clave`, `socket_address`, `socket_port`) VALUES
(1, '../message_server/sms/api/outbox', '../message_server/sms/schedule', '../message_server/mail/api', 'smtp.gmail.com', 465, 'dem.sanfelipe@gmail.com', 'qwertyuiop1234567890', '192.168.1.1', 9300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_programador`
--

CREATE TABLE IF NOT EXISTS `config_programador` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `config_programador`
--

INSERT INTO `config_programador` (`id`, `locale`, `weekends`, `weekNumbers`, `weekNumbersWithinDays`, `start`, `end`, `showNonCurrentDates`, `minTime`, `maxTime`, `slotDuration`, `noEventsMessage`, `nowIndicator`, `defaultView`, `allDaySlot`, `hiddenDays`, `eventOverlap`, `selectable`, `droppable`) VALUES
(1, 'es', 1, 0, 1, '08:00:00', '18:00:00', 1, '08:00:00', '18:00:00', '00:30:00', 'NO SE HAN CREADO ACTOS', 1, 'agendaDay', 0, '', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `defensor`
--

CREATE TABLE IF NOT EXISTS `defensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `impres` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fiscal`
--

CREATE TABLE IF NOT EXISTS `fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` text NOT NULL,
  `numero` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `id_tribunal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imputado`
--

CREATE TABLE IF NOT EXISTS `imputado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `condicion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juez`
--

CREATE TABLE IF NOT EXISTS `juez` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE IF NOT EXISTS `notificaciones` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones_usuario`
--

CREATE TABLE IF NOT EXISTS `notificaciones_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_notificacion` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `status` tinyint(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `persona`
--
DROP TRIGGER IF EXISTS `eliminar_persona`;
DELIMITER //
CREATE TRIGGER `eliminar_persona` AFTER DELETE ON `persona`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertar_persona`;
DELIMITER //
CREATE TRIGGER `insertar_persona` AFTER INSERT ON `persona`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `modificar_persona`;
DELIMITER //
CREATE TRIGGER `modificar_persona` AFTER UPDATE ON `persona`
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_tipo`
--

CREATE TABLE IF NOT EXISTS `persona_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `tipo_persona` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `persona_tipo_persona`
--
CREATE TABLE IF NOT EXISTS `persona_tipo_persona` (
`cedula` varchar(20)
,`nombre_completo` varchar(201)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`telefono` varchar(17)
,`descripcion` varchar(20)
,`id_tipo_persona` int(11)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE IF NOT EXISTS `sala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `color` varchar(20) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`),
  UNIQUE KEY `color` (`color`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `sala`
--
DROP TRIGGER IF EXISTS `eliminar_sala`;
DELIMITER //
CREATE TRIGGER `eliminar_sala` AFTER DELETE ON `sala`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertar_sala`;
DELIMITER //
CREATE TRIGGER `insertar_sala` AFTER INSERT ON `sala`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `modificar_sala`;
DELIMITER //
CREATE TRIGGER `modificar_sala` AFTER UPDATE ON `sala`
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testigo`
--

CREATE TABLE IF NOT EXISTS `testigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_tribunal`
--

CREATE TABLE IF NOT EXISTS `tipo_de_tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `tipo_de_tribunal`
--
DROP TRIGGER IF EXISTS `eliminar`;
DELIMITER //
CREATE TRIGGER `eliminar` AFTER DELETE ON `tipo_de_tribunal`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertar`;
DELIMITER //
CREATE TRIGGER `insertar` AFTER INSERT ON `tipo_de_tribunal`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `modificar`;
DELIMITER //
CREATE TRIGGER `modificar` AFTER UPDATE ON `tipo_de_tribunal`
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE IF NOT EXISTS `tipo_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id`, `descripcion`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'DEFENSOR', 1, '2017-11-07 19:37:36'),
(3, 'ALGUACIL', 1, '2017-11-07 19:37:38'),
(4, 'IMPUTADO', 1, '2017-11-07 19:37:40'),
(5, 'JUEZ', 1, '2017-11-07 19:37:43'),
(6, 'VICTIMA', 1, '2017-11-07 19:37:45'),
(7, 'TESTIGO', 1, '2017-07-12 02:25:19'),
(8, 'FISCAL', 1, '2017-07-12 02:25:21'),
(9, 'USUARIO', 1, '2017-07-12 02:24:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tribunal`
--

CREATE TABLE IF NOT EXISTS `tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(200) NOT NULL,
  `id_tipo_tribunal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Disparadores `tribunal`
--
DROP TRIGGER IF EXISTS `eliminar_tribunal`;
DELIMITER //
CREATE TRIGGER `eliminar_tribunal` AFTER DELETE ON `tribunal`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertar_tribunal`;
DELIMITER //
CREATE TRIGGER `insertar_tribunal` AFTER INSERT ON `tribunal`
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `modificar_tribunal`;
DELIMITER //
CREATE TRIGGER `modificar_tribunal` AFTER UPDATE ON `tribunal`
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `victima`
--

CREATE TABLE IF NOT EXISTS `victima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_actividad`
--
CREATE TABLE IF NOT EXISTS `vista_actividad` (
`id` int(11)
,`actividad` varchar(1000)
,`descripcion` varchar(200)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_acto`
--
CREATE TABLE IF NOT EXISTS `vista_acto` (
`ID` int(11)
,`CAUSA` varchar(50)
,`IMPUTADO` varchar(201)
,`CONDICION` varchar(20)
,`TRIBUNAL` varchar(200)
,`TIPO_DE_TRIBUNAL` varchar(200)
,`ACTO` text
,`HORA` varchar(40)
,`OBSERVACION` varchar(200)
,`SALA` varchar(100)
,`FISCAL` int(11)
,`ALGUACIL` varchar(201)
,`DEFENSOR` varchar(201)
,`NUMERO` text
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_alguacil`
--
CREATE TABLE IF NOT EXISTS `vista_alguacil` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`tipo_persona` int(1)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_bitacora`
--
CREATE TABLE IF NOT EXISTS `vista_bitacora` (
`id` int(11)
,`operacion` varchar(10)
,`fecha` timestamp
,`tabla` varchar(40)
,`accion` mediumtext
,`registro_anterior` longtext
,`registro_nuevo` longtext
,`usuario` varchar(201)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_defensor`
--
CREATE TABLE IF NOT EXISTS `vista_defensor` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`impres` text
,`tipo` varchar(20)
,`tipo_persona` int(1)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_estadistica`
--
CREATE TABLE IF NOT EXISTS `vista_estadistica` (
`ID` int(11)
,`CAUSA` varchar(50)
,`ESTATUS` varchar(20)
,`IMPUTADO` varchar(201)
,`TRIBUNAL` varchar(200)
,`TIPO_DE_TRIBUNAL` varchar(200)
,`ACTO` varchar(1000)
,`FECHA` date
,`HORA_INICIO` varchar(10)
,`HORA_FIN` varchar(10)
,`OBSERVACION` varchar(200)
,`SALA` varchar(100)
,`FISCAL` varchar(201)
,`ALGUACIL` varchar(201)
,`DEFENSOR` varchar(201)
,`VICTIMA` varchar(201)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_fiscal`
--
CREATE TABLE IF NOT EXISTS `vista_fiscal` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`tipo_persona` int(1)
,`numero` int(11)
,`tipo` varchar(100)
,`tribunal` varchar(200)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_imputado`
--
CREATE TABLE IF NOT EXISTS `vista_imputado` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`condicion` varchar(20)
,`tipo_persona` int(1)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_juez`
--
CREATE TABLE IF NOT EXISTS `vista_juez` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`id_tipo_persona` int(1)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_notificaciones`
--
CREATE TABLE IF NOT EXISTS `vista_notificaciones` (
`id` int(11)
,`title` varchar(500)
,`icon` varchar(5000)
,`body` longtext
,`user` varchar(20)
,`rol` varchar(20)
,`emisor` varchar(100)
,`tipo` varchar(100)
,`time` timestamp
,`id_notificaciones_usuario` int(11)
,`cedula` varchar(20)
,`status` tinyint(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_testigo`
--
CREATE TABLE IF NOT EXISTS `vista_testigo` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`tipo_persona` int(1)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_tribunal`
--
CREATE TABLE IF NOT EXISTS `vista_tribunal` (
`id` int(11)
,`numero` varchar(200)
,`descripcion` varchar(200)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuario`
--
CREATE TABLE IF NOT EXISTS `vista_usuario` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`clave` varchar(100)
,`nivel` varchar(100)
,`id_tipo_persona` int(1)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_victima`
--
CREATE TABLE IF NOT EXISTS `vista_victima` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`tipo_persona` int(1)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `acto_sala`
--
DROP TABLE IF EXISTS `acto_sala`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `acto_sala` AS select `acto`.`id` AS `id`,`acto`.`inicio` AS `start`,`acto`.`fin` AS `end`,`acto`.`id_sala` AS `resourceId`,`acto`.`estatus` AS `estatus`,concat(`caso`.`numero`,': ',`actividad`.`actividad`) AS `title`,`caso`.`numero` AS `numero`,`caso`.`descripcion` AS `descripcion`,`acto`.`descripcion` AS `descripcion_acto`,`sala`.`descripcion` AS `sala`,`tribunal`.`id` AS `id_tribunal`,`tribunal`.`numero` AS `tribunal`,`tribunal`.`id_tipo_tribunal` AS `id_tipo_tribunal`,`tipo_de_tribunal`.`descripcion` AS `tipo_de_tribunal` from (((((`acto` join `actividad` on((`acto`.`id_actividad` = `actividad`.`id`))) join `caso` on((`acto`.`numero_caso` = `caso`.`numero`))) join `sala` on((`acto`.`id_sala` = `sala`.`id`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `tipo_de_tribunal` on((`tribunal`.`id_tipo_tribunal` = `tipo_de_tribunal`.`id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `persona_tipo_persona`
--
DROP TABLE IF EXISTS `persona_tipo_persona`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `persona_tipo_persona` AS select `persona_tipo`.`cedula` AS `cedula`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `nombre_completo`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`telefono` AS `telefono`,`tipo_persona`.`descripcion` AS `descripcion`,`tipo_persona`.`id` AS `id_tipo_persona` from ((`persona_tipo` join `persona` on((`persona_tipo`.`cedula` = `persona`.`cedula`))) join `tipo_persona` on((`tipo_persona`.`id` = `persona_tipo`.`tipo_persona`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_actividad`
--
DROP TABLE IF EXISTS `vista_actividad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_actividad` AS select `t`.`id` AS `id`,`t`.`actividad` AS `actividad`,`tdt`.`descripcion` AS `descripcion`,`t`.`id_usuario` AS `id_usuario`,`t`.`fecha_de_registro` AS `fecha_de_registro` from (`actividad` `t` join `tipo_de_tribunal` `tdt` on((`t`.`id_tipo_tribunal` = `tdt`.`id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_acto`
--
DROP TABLE IF EXISTS `vista_acto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_acto` AS select `acto`.`id` AS `ID`,`acto`.`numero_caso` AS `CAUSA`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `IMPUTADO`,(select `imputado`.`condicion` from `imputado` where (`imputado`.`cedula` = `persona`.`cedula`)) AS `CONDICION`,`tribunal`.`numero` AS `TRIBUNAL`,(select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`)) AS `TIPO_DE_TRIBUNAL`,concat(`actividad`.`actividad`,' (',(select `imputado`.`condicion` from `imputado` where (`imputado`.`cedula` = `persona`.`cedula`)),')') AS `ACTO`,`acto`.`inicio` AS `HORA`,`acto`.`descripcion` AS `OBSERVACION`,`sala`.`descripcion` AS `SALA`,`fiscal`.`numero` AS `FISCAL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_alguacil`.`cedula`)) AS `ALGUACIL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_defensor`.`cedula`)) AS `DEFENSOR`,(select `defensor`.`impres` from `defensor` where (`defensor`.`cedula` = `caso_defensor`.`cedula`)) AS `NUMERO` from (((((((((`acto` join `caso_imputado` on((`acto`.`numero_caso` = `caso_imputado`.`numero_caso`))) join `persona` on((`caso_imputado`.`cedula` = `persona`.`cedula`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `actividad` on((`actividad`.`id` = `acto`.`id_actividad`))) join `sala` on((`sala`.`id` = `acto`.`id_sala`))) join `caso_fiscal` on((`caso_fiscal`.`numero_caso` = `acto`.`numero_caso`))) join `fiscal` on((`caso_fiscal`.`cedula` = `fiscal`.`cedula`))) join `caso_alguacil` on((`caso_alguacil`.`numero_caso` = `acto`.`numero_caso`))) join `caso_defensor` on((`caso_defensor`.`numero_caso` = `acto`.`numero_caso`))) order by (select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_alguacil`
--
DROP TABLE IF EXISTS `vista_alguacil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_alguacil` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 3);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_bitacora`
--
DROP TABLE IF EXISTS `vista_bitacora`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_bitacora` AS select `b`.`id` AS `id`,`b`.`operacion` AS `operacion`,`b`.`fecha` AS `fecha`,`b`.`tabla` AS `tabla`,`b`.`accion` AS `accion`,`b`.`registro_anterior` AS `registro_anterior`,`b`.`registro_nuevo` AS `registro_nuevo`,concat(`p`.`nombres`,' ',`p`.`apellidos`) AS `usuario` from ((`bitacora` `b` join `usuario` `u` on((`b`.`usuario` = `u`.`id`))) join `persona` `p` on((`p`.`cedula` = `u`.`cedula`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_defensor`
--
DROP TABLE IF EXISTS `vista_defensor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_defensor` AS select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`d`.`impres` AS `impres`,`d`.`tipo` AS `tipo`,`pt`.`tipo_persona` AS `tipo_persona` from ((`persona` `p` join `defensor` `d` on((`p`.`cedula` = `d`.`cedula`))) join `persona_tipo` `pt` on((`pt`.`cedula` = `p`.`cedula`))) where (`pt`.`tipo_persona` = 1);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_estadistica`
--
DROP TABLE IF EXISTS `vista_estadistica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estadistica` AS select `acto`.`id` AS `ID`,`acto`.`numero_caso` AS `CAUSA`,`acto`.`estatus` AS `ESTATUS`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `IMPUTADO`,`tribunal`.`numero` AS `TRIBUNAL`,(select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`)) AS `TIPO_DE_TRIBUNAL`,`actividad`.`actividad` AS `ACTO`,cast(`acto`.`inicio` as date) AS `FECHA`,date_format(`acto`.`inicio`,'%H:%I') AS `HORA_INICIO`,date_format(`acto`.`fin`,'%H:%I') AS `HORA_FIN`,`acto`.`descripcion` AS `OBSERVACION`,`sala`.`descripcion` AS `SALA`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_fiscal`.`cedula`)) AS `FISCAL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_alguacil`.`cedula`)) AS `ALGUACIL`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_defensor`.`cedula`)) AS `DEFENSOR`,(select concat(`persona`.`nombres`,' ',`persona`.`apellidos`) from `persona` where (`persona`.`cedula` = `caso_victima`.`cedula`)) AS `VICTIMA` from ((((((((((`acto` join `caso_imputado` on((`acto`.`numero_caso` = `caso_imputado`.`numero_caso`))) join `persona` on((`caso_imputado`.`cedula` = `persona`.`cedula`))) join `tribunal` on((`acto`.`id_tribunal` = `tribunal`.`id`))) join `actividad` on((`actividad`.`id` = `acto`.`id_actividad`))) join `sala` on((`sala`.`id` = `acto`.`id_sala`))) join `caso_fiscal` on((`caso_fiscal`.`numero_caso` = `acto`.`numero_caso`))) join `fiscal` on((`caso_fiscal`.`cedula` = `fiscal`.`cedula`))) join `caso_alguacil` on((`caso_alguacil`.`numero_caso` = `acto`.`numero_caso`))) join `caso_defensor` on((`caso_defensor`.`numero_caso` = `acto`.`numero_caso`))) join `caso_victima` on((`caso_victima`.`numero_caso` = `acto`.`numero_caso`))) order by (select `tipo_de_tribunal`.`descripcion` from `tipo_de_tribunal` where (`tipo_de_tribunal`.`id` = `tribunal`.`id_tipo_tribunal`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_fiscal`
--
DROP TABLE IF EXISTS `vista_fiscal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_fiscal` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona`,`fiscal`.`numero` AS `numero`,`fiscal`.`tipo` AS `tipo`,`tribunal`.`numero` AS `tribunal` from (((`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) join `fiscal` on((`persona`.`cedula` = `fiscal`.`cedula`))) join `tribunal` on((`fiscal`.`id_tribunal` = `tribunal`.`id`))) where (`persona_tipo`.`tipo_persona` = 8);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_imputado`
--
DROP TABLE IF EXISTS `vista_imputado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_imputado` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`imputado`.`condicion` AS `condicion`,`persona_tipo`.`tipo_persona` AS `tipo_persona` from ((`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) join `imputado` on((`persona`.`cedula` = `imputado`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 4);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_juez`
--
DROP TABLE IF EXISTS `vista_juez`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_juez` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 5);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_notificaciones`
--
DROP TABLE IF EXISTS `vista_notificaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_notificaciones` AS select `n`.`id` AS `id`,`n`.`title` AS `title`,`n`.`icon` AS `icon`,`n`.`body` AS `body`,`n`.`user` AS `user`,`n`.`rol` AS `rol`,`n`.`emisor` AS `emisor`,`n`.`tipo` AS `tipo`,`n`.`time` AS `time`,`u`.`id` AS `id_notificaciones_usuario`,`u`.`cedula` AS `cedula`,`u`.`status` AS `status` from (`notificaciones` `n` join `notificaciones_usuario` `u` on((`n`.`id` = `u`.`id_notificacion`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_testigo`
--
DROP TABLE IF EXISTS `vista_testigo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_testigo` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 7);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_tribunal`
--
DROP TABLE IF EXISTS `vista_tribunal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_tribunal` AS select `t`.`id` AS `id`,`t`.`numero` AS `numero`,`tdt`.`descripcion` AS `descripcion`,`t`.`id_usuario` AS `id_usuario`,`t`.`fecha_de_registro` AS `fecha_de_registro` from (`tribunal` `t` join `tipo_de_tribunal` `tdt` on((`t`.`id_tipo_tribunal` = `tdt`.`id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario`
--
DROP TABLE IF EXISTS `vista_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`usuario`.`clave` AS `clave`,`usuario`.`nivel` AS `nivel`,`persona_tipo`.`tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from ((`persona` join `usuario` on((`persona`.`cedula` = `usuario`.`cedula`))) join `persona_tipo` on((`persona_tipo`.`cedula` = `persona`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 9);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_victima`
--
DROP TABLE IF EXISTS `vista_victima`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_victima` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona_tipo`.`tipo_persona` AS `tipo_persona` from (`persona` join `persona_tipo` on((`persona`.`cedula` = `persona_tipo`.`cedula`))) where (`persona_tipo`.`tipo_persona` = 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
