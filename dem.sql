-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-05-2017 a las 22:54:26
-- Versión del servidor: 5.5.54-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dem`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionar`(IN `Tabla` VARCHAR(50), IN `Campos` VARCHAR(255), IN `Donde` VARCHAR(255), IN `AgruparPor` VARCHAR(50), IN `OrdenarPor` VARCHAR(50))
BEGIN
  IF Donde <> '' THEN SET Donde = CONCAT(' WHERE ', Donde); END IF;
 IF AgruparPor <> '' THEN SET AgruparPor = CONCAT(' GROUP BY ', AgruparPor); END IF;
 IF OrdenarPor <> '' THEN SET OrdenarPor = CONCAT(' ORDER BY ', OrdenarPor); END IF;
 SET @VConsulta = CONCAT(
  "SELECT ", Campos , " FROM ", Tabla, Donde, AgruparPor, OrdenarPor, ";"
 );
  PREPARE Declaracion FROM @VConsulta;
 EXECUTE Declaracion;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acto`
--

CREATE TABLE IF NOT EXISTS `acto` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `acto`
--

INSERT INTO `acto` (`id`, `inicio`, `fin`, `titulo`, `descripcion`, `id_sala`, `id_tribunal`, `id_usuario`, `fecha_de_registro`) VALUES
(1, '2017-05-24T12:00:00', '2017-05-24T17:30:00', 'hla', 'hla', 2, 0, 1, '2017-05-23 20:52:26'),
(2, '2017-05-24T09:00:00', '2017-05-24T18:00:00', 'My Event 2', 'My Event 2', 3, 0, 1, '2017-05-23 20:53:12'),
(3, '2017-05-24T09:30:00', '2017-05-24T11:30:00', 'My Event 4', 'My Event 4', 6, 0, 1, '2017-05-23 20:39:55'),
(4, '2017-05-24T08:30:00', '2017-05-24T09:30:00', 'nuevo', 'nuevo', 2, 0, 1, '2017-05-24 02:25:30'),
(5, '2017-05-24T12:30:00', '2017-05-24T16:30:00', 'giola', 'hajaja', 6, 0, 1, '2017-05-23 20:50:02'),
(6, '2017-05-24T14:30:00', '2017-05-24T18:00:00', 'haia', 'haia', 4, 0, 1, '2017-05-24 02:25:25'),
(7, '2017-05-24T09:00:00', '2017-05-24T14:00:00', 'hola', 'haha', 4, 0, 1, '2017-05-24 02:24:58'),
(8, '2017-05-23T08:30:00', '2017-05-23T10:30:00', 'My Event 1', 'My Event 1', 2, 0, 1, '2017-05-24 02:25:38'),
(9, '2017-05-23T10:00:00', '2017-05-23T12:00:00', 'My Event 1', 'My Event 1', 3, 0, 1, '2017-05-24 02:25:41'),
(10, '2017-05-23T10:30:00', '2017-05-23T12:30:00', 'My Event 4', 'My Event 4', 4, 0, 1, '2017-05-24 02:25:43'),
(11, '2017-05-23T10:00:00', '2017-05-23T12:00:00', 'My Event 5', 'My Event 5', 6, 0, 1, '2017-05-24 02:25:48');

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
                      'titulo : "', OLD.titulo, '",',
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `modificar_acto`;
DELIMITER //
CREATE TRIGGER `modificar_acto` AFTER UPDATE ON `acto`
 FOR EACH ROW BEGIN
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `acto_sala`
--
CREATE TABLE IF NOT EXISTS `acto_sala` (
`id` int(11)
,`resourceId` int(11)
,`start` text
,`end` text
,`title` varchar(5000)
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `alguacil`
--

INSERT INTO `alguacil` (`id`, `cedula`) VALUES
(3, 'V-123453773'),
(2, 'V-22839339');

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
  `registro_anterior` longtext,
  `registro_nuevo` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `usuario`, `operacion`, `fecha`, `tabla`, `registro_anterior`, `registro_nuevo`) VALUES
(1, 1, 'MODIFICAR', '2017-05-23 20:52:26', 'ACTO', '{id : 1,inicio : "2017-05-24T08:30:00",fin : "2017-05-24T14:00:00",titulo : "hla",descripcion : "haha",id_sala : 2,id_tribunal : 0}', '{id : 1,inicio : "2017-05-24T12:00:00",fin : "2017-05-24T17:30:00",titulo : "hla",descripcion : "hla",id_sala : 2,id_tribunal : 0}'),
(2, 1, 'INSERTAR', '2017-05-23 20:52:39', 'ACTO', NULL, '{id : 6,inicio : "2017-05-24T08:30:00",fin : "2017-05-24T12:00:00",titulo : "haia",descripcion : "ddhjd",id_sala : 2,id_tribunal : 0}'),
(3, 1, 'MODIFICAR', '2017-05-23 20:52:56', 'ACTO', '{id : 2,inicio : "2017-05-24T09:00:00",fin : "2017-05-24T15:30:00",titulo : "My Event 2",descripcion : "My Event 2",id_sala : 4,id_tribunal : 0}', '{id : 2,inicio : "2017-05-24T09:00:00",fin : "2017-05-24T18:00:00",titulo : "My Event 2",descripcion : "My Event 2",id_sala : 4,id_tribunal : 0}'),
(4, 1, 'MODIFICAR', '2017-05-23 20:53:06', 'ACTO', '{id : 4,inicio : "2017-05-24T11:30:00",fin : "2017-05-24T19:00:00",titulo : "nuevo",descripcion : "nuevo",id_sala : 3,id_tribunal : 0}', '{id : 4,inicio : "2017-05-24T08:00:00",fin : "2017-05-24T15:30:00",titulo : "nuevo",descripcion : "nuevo",id_sala : 3,id_tribunal : 0}'),
(5, 1, 'MODIFICAR', '2017-05-23 20:53:08', 'ACTO', '{id : 4,inicio : "2017-05-24T08:00:00",fin : "2017-05-24T15:30:00",titulo : "nuevo",descripcion : "nuevo",id_sala : 3,id_tribunal : 0}', '{id : 4,inicio : "2017-05-24T08:00:00",fin : "2017-05-24T09:00:00",titulo : "nuevo",descripcion : "nuevo",id_sala : 3,id_tribunal : 0}'),
(6, 1, 'MODIFICAR', '2017-05-23 20:53:10', 'ACTO', '{id : 2,inicio : "2017-05-24T09:00:00",fin : "2017-05-24T18:00:00",titulo : "My Event 2",descripcion : "My Event 2",id_sala : 4,id_tribunal : 0}', '{id : 2,inicio : "2017-05-24T09:30:00",fin : "2017-05-24T18:30:00",titulo : "My Event 2",descripcion : "My Event 2",id_sala : 3,id_tribunal : 0}'),
(7, 1, 'MODIFICAR', '2017-05-23 20:53:12', 'ACTO', '{id : 2,inicio : "2017-05-24T09:30:00",fin : "2017-05-24T18:30:00",titulo : "My Event 2",descripcion : "My Event 2",id_sala : 3,id_tribunal : 0}', '{id : 2,inicio : "2017-05-24T09:00:00",fin : "2017-05-24T18:00:00",titulo : "My Event 2",descripcion : "My Event 2",id_sala : 3,id_tribunal : 0}'),
(8, 1, 'INSERTAR', '2017-05-24 02:24:58', 'ACTO', NULL, '{id : 7,inicio : "2017-05-24T09:00:00",fin : "2017-05-24T14:00:00",titulo : "hola",descripcion : "haha",id_sala : 4,id_tribunal : 0}'),
(9, 1, 'MODIFICAR', '2017-05-24 02:25:25', 'ACTO', '{id : 6,inicio : "2017-05-24T08:30:00",fin : "2017-05-24T12:00:00",titulo : "haia",descripcion : "ddhjd",id_sala : 2,id_tribunal : 0}', '{id : 6,inicio : "2017-05-24T14:30:00",fin : "2017-05-24T18:00:00",titulo : "haia",descripcion : "haia",id_sala : 4,id_tribunal : 0}'),
(10, 1, 'MODIFICAR', '2017-05-24 02:25:30', 'ACTO', '{id : 4,inicio : "2017-05-24T08:00:00",fin : "2017-05-24T09:00:00",titulo : "nuevo",descripcion : "nuevo",id_sala : 3,id_tribunal : 0}', '{id : 4,inicio : "2017-05-24T08:30:00",fin : "2017-05-24T09:30:00",titulo : "nuevo",descripcion : "nuevo",id_sala : 2,id_tribunal : 0}'),
(11, 1, 'INSERTAR', '2017-05-24 02:25:38', 'ACTO', NULL, '{id : 8,inicio : "2017-05-23T08:30:00",fin : "2017-05-23T10:30:00",titulo : "My Event 1",descripcion : "My Event 1",id_sala : 2,id_tribunal : 0}'),
(12, 1, 'INSERTAR', '2017-05-24 02:25:41', 'ACTO', NULL, '{id : 9,inicio : "2017-05-23T10:00:00",fin : "2017-05-23T12:00:00",titulo : "My Event 1",descripcion : "My Event 1",id_sala : 3,id_tribunal : 0}'),
(13, 1, 'INSERTAR', '2017-05-24 02:25:43', 'ACTO', NULL, '{id : 10,inicio : "2017-05-23T10:30:00",fin : "2017-05-23T12:30:00",titulo : "My Event 4",descripcion : "My Event 4",id_sala : 4,id_tribunal : 0}'),
(14, 1, 'INSERTAR', '2017-05-24 02:25:48', 'ACTO', NULL, '{id : 11,inicio : "2017-05-23T10:00:00",fin : "2017-05-23T12:00:00",titulo : "My Event 5",descripcion : "My Event 5",id_sala : 6,id_tribunal : 0}');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `defensor`
--

INSERT INTO `defensor` (`id`, `cedula`, `tipo`, `impres`) VALUES
(1, 'V2929', 'PUBLICO', '2828282'),
(5, 'V29223', 'PUBLICO', '2828282'),
(8, 'V-22738489', 'PRIVADO', '233823742'),
(9, 'V-21389221', 'PUBLICO', '9393240238');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fiscal`
--

CREATE TABLE IF NOT EXISTS `fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` text NOT NULL,
  `numero` int(11) NOT NULL,
  `id_tribunal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `fiscal`
--

INSERT INTO `fiscal` (`id`, `cedula`, `numero`, `id_tribunal`) VALUES
(2, 'V-9288338', 25, 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `imputado`
--

INSERT INTO `imputado` (`id`, `cedula`, `condicion`) VALUES
(1, 'IMPUTADO', ''),
(3, 'V-20192933', 'IMPUTADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juez`
--

CREATE TABLE IF NOT EXISTS `juez` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `juez`
--

INSERT INTO `juez` (`id`, `cedula`) VALUES
(1, 'V-21301059'),
(2, 'V-21301060');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE IF NOT EXISTS `nivel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`)
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
  `id_tipo_persona` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`,`email`,`telefono`),
  UNIQUE KEY `cedula_2` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `cedula`, `nombres`, `apellidos`, `email`, `telefono`, `fecha_de_nacimiento`, `id_tipo_persona`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'V-21301059', 'ANTHONY', 'MEDINA', 'ANTHONYJMEDINA@GMAIL.COM', '+58 426 357 54 89', '20/10/1992', 5, NULL, '2017-04-05 14:29:15'),
(2, 'V-21301060', 'MARIANGEL', 'GAUTIER', 'MARIGAUTIER@GMAIL.COM', '+58 858 558 66 66', '20/10/1992', 5, NULL, '2017-04-05 15:11:16'),
(6, 'V-1829333', 'MONICA', 'PEREZ', 'MONICA@HOTMAIL.COM', '+58 228 282 88 22', '20/09/1992', 2, NULL, '2017-04-17 17:43:37'),
(12, 'V292', 'AJJ', 'SJSJ', 'JSJS@SJSJ', '+58 828 282 82 82', '06/04/2017', 4, NULL, '2017-04-05 14:59:17'),
(18, 'V889393', 'SJSJSJ', 'JAJAJ', 'JSJJS@HSHS', '+58 222 222 22 22', '22/04/2017', 2, NULL, '2017-04-05 16:23:00'),
(19, 'V28292829', 'JSSJJS', 'JSJSJ', 'JJD@SHS', '+58 222 222 22 22', '27/04/2017', 1, NULL, '2017-04-05 16:26:22'),
(20, 'V-21201', 'HUAN', 'SSJ', 'JSSJ@SJSJ', '+58 222 222 22 22', '22/04/2017', 1, NULL, '2017-04-05 17:04:39'),
(21, 'V-283838', 'JUAN', 'PERE', 'SHS2@SJHS', '+58 292 929 29 29', '21/04/2017', 1, NULL, '2017-04-05 17:05:21'),
(22, 'V338', 'SJSJ', 'SJSJ', 'DJDJDW@SHDH', '+58 222 222 22 22', '20/04/2017', 1, NULL, '2017-04-05 17:08:00'),
(23, 'V-3883', 'JOSE', 'MEDINA', 'SJSJ@SJSJ', '+58 222 222 22 22', '12/04/2017', 1, NULL, '2017-04-05 17:08:52'),
(24, 'V9393', 'SKS', 'KDKS', 'JSJS@AJH', '+58 229 292 92 90', '29/04/2017', 1, NULL, '2017-04-05 17:10:58'),
(25, 'V030', 'JDDJDJ', 'JSJS', 'SKSK2SJSJ@SJ', '+58 292 920 00 00', '21/04/2017', 1, NULL, '2017-04-05 17:11:38'),
(26, 'V92292', 'SKSK', 'KSSK', 'SS@SS', '+58 220 000 00 00', '14/04/2017', 1, NULL, '2017-04-05 17:12:53'),
(27, 'V8228', 'SHSH', 'SHSHS', 'JSHS@SJHS', '+58 229 800 00 00', '30/04/2017', 1, NULL, '2017-04-05 17:13:45'),
(30, 'V-22738489', 'JUAN ANTONIO', 'PEREZ RODRIGUEZ', 'JUANANTONIO@GMAIL.COM', '+58 426 563 63 73', '20/10/1929', 1, NULL, '2017-04-17 17:19:38'),
(31, 'V-21389221', 'MARIA', 'RODRIGUEZ', 'MARIARODRIGUEZ@GMAIL.COM', '+58 424 567 38 38', '12/12/1989', 1, NULL, '2017-04-17 17:41:18'),
(32, 'V-22839339', 'JUAN', 'ZAMORA', 'JUANZAMORA@GMAIL.COM', '+58 426 738 99 44', '12/12/1992', 3, NULL, '2017-04-17 17:42:46'),
(33, 'V-28388339', 'MILAGROS', 'MENDOZA', 'MILAGROSMENDOZA@GMAIL.COM', '+58 424 363 83 78', '12/12/1992', 6, NULL, '2017-04-17 17:44:57'),
(34, 'V-20192933', 'SEBASTIAN', 'PEREZ', 'SEBASTIAN@GMAIL.COM', '+58 426 373 83 83', '12/12/1999', 4, NULL, '2017-04-17 17:45:47'),
(35, 'V-23776782', 'MANUEL', 'MIJARES', 'MANUELMIJARES@GMAIL.COM', '+58 892 489 28 42', '20/10/1992', 7, NULL, '2017-04-17 17:46:35'),
(36, 'V-9288338', 'BAUDILIO JOSE', 'SUAREZ', 'BAUDLIOSUAREZ@GMAIL.COM', '+58 426 738 38 38', '10/10/1982', 3, NULL, '2017-04-17 17:47:49'),
(37, 'V-12345377', 'JUAN', 'PEREZ', 'JUAN@GMAIL.COM', '+58 783 782 30 00', '05/04/1992', 3, NULL, '2017-04-27 15:00:33');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `persona_tipo_persona`
--
CREATE TABLE IF NOT EXISTS `persona_tipo_persona` (
`cedula` varchar(10)
,`nombre_completo` varchar(201)
,`descripcion` varchar(20)
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id`, `descripcion`, `color`, `id_usuario`, `fecha_de_registro`) VALUES
(2, 'SALA 1', '#f7f022', 1, '2017-05-23 20:20:33'),
(3, 'SALA 2', '#3100ff', 1, '2017-05-23 20:20:45'),
(4, 'SALA 3', '#fb1919', 1, '2017-05-23 20:20:57'),
(6, 'SALA 4', '#2d9c0e', 1, '2017-05-23 20:24:53');

--
-- Disparadores `sala`
--
DROP TRIGGER IF EXISTS `eliminar`;
DELIMITER //
CREATE TRIGGER `eliminar` AFTER DELETE ON `sala`
 FOR EACH ROW BEGIN
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertar`;
DELIMITER //
CREATE TRIGGER `insertar` AFTER INSERT ON `sala`
 FOR EACH ROW BEGIN
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
       END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `modificar`;
DELIMITER //
CREATE TRIGGER `modificar` AFTER UPDATE ON `sala`
 FOR EACH ROW BEGIN
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
       END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE IF NOT EXISTS `secretaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `secretaria`
--

INSERT INTO `secretaria` (`id`, `cedula`) VALUES
(1, 'V-1829333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suplente`
--

CREATE TABLE IF NOT EXISTS `suplente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `id_fiscal` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `cedula_fiscal` (`id_fiscal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testigo`
--

CREATE TABLE IF NOT EXISTS `testigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `id_tipo_de_testigo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `testigo`
--

INSERT INTO `testigo` (`id`, `cedula`, `id_tipo_de_testigo`) VALUES
(2, 'V-23776782', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_testigo`
--

CREATE TABLE IF NOT EXISTS `tipo_de_testigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tipo_de_testigo`
--

INSERT INTO `tipo_de_testigo` (`id`, `descripcion`, `fecha_de_registro`, `id_usuario`) VALUES
(1, 'TESTIGO PRESENCIAL', '2017-05-17 14:54:29', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tipo_de_tribunal`
--

INSERT INTO `tipo_de_tribunal` (`id`, `descripcion`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'TRIBUNAL ITINERANTE', 1, '2017-04-05 19:57:17'),
(9, 'TRIBUNAL DE JUICIO', 0, '2017-04-17 17:17:39'),
(10, 'TRIBUNAL DE CONTROL', 0, '2017-04-17 17:17:53');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id`, `descripcion`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'DEFENSOR', 0, '2017-04-05 14:19:52'),
(2, 'SECRETARIA', 0, '2017-04-05 14:22:41'),
(3, 'ALGUACIL', 0, '2017-04-05 14:22:41'),
(4, 'IMPUTADO', 0, '2017-04-05 14:22:41'),
(5, 'JUEZ', 0, '2017-04-05 14:22:41'),
(6, 'VICTIMA', 0, '2017-04-05 14:22:41'),
(7, 'TESTIGO', 0, '2017-04-05 14:22:41'),
(8, 'FISCAL', 0, '2017-04-05 14:22:41');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tribunal`
--

INSERT INTO `tribunal` (`id`, `numero`, `id_tipo_tribunal`, `id_usuario`, `fecha_de_registro`) VALUES
(6, 'TRIBUNAL 2', 2, 0, '2017-04-05 20:54:28'),
(7, 'TRIBUNAL 93', 10, 0, '2017-04-14 20:40:38'),
(8, 'TRIBUNAL  34', 1, 0, '2017-04-14 20:41:07'),
(10, 'TRIBUANAL 4', 9, 0, '2017-04-17 17:40:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(11) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`cedula`),
  UNIQUE KEY `id_persona` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `cedula`, `clave`, `id_nivel`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'V-21301059', 'ae45ad6d9902c5483018e334239613881a77b5dd', 1, 1, '2017-05-23 16:20:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `victima`
--

CREATE TABLE IF NOT EXISTS `victima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `victima`
--

INSERT INTO `victima` (`id`, `cedula`) VALUES
(2, 'V-28388339');

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
,`id_tipo_persona` int(11)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
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
,`tipo` varchar(20)
,`impres` text
,`id_tipo_persona` int(11)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
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
,`numero` int(11)
,`id_tipo_persona` int(11)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
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
,`id_tipo_persona` int(11)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
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
,`id_tipo_persona` int(11)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_secretaria`
--
CREATE TABLE IF NOT EXISTS `vista_secretaria` (
`id` int(9)
,`cedula` varchar(10)
,`nombres` varchar(100)
,`apellidos` varchar(100)
,`email` varchar(100)
,`telefono` varchar(17)
,`fecha_de_nacimiento` text
,`id_tipo_persona` int(11)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
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
,`id_tipo_persona` int(11)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
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
,`id_tipo_persona` int(11)
,`id_usuario` int(11)
,`fecha_de_registro` timestamp
);
-- --------------------------------------------------------

--
-- Estructura para la vista `acto_sala`
--
DROP TABLE IF EXISTS `acto_sala`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `acto_sala` AS select `acto`.`id` AS `id`,`sala`.`id` AS `resourceId`,`acto`.`inicio` AS `start`,`acto`.`fin` AS `end`,`acto`.`titulo` AS `title` from (`acto` join `sala` on((`acto`.`id_sala` = `sala`.`id`))) where ((`sala`.`id` <> '') and (`acto`.`inicio` <> '') and (`acto`.`fin` <> ''));

-- --------------------------------------------------------

--
-- Estructura para la vista `persona_tipo_persona`
--
DROP TABLE IF EXISTS `persona_tipo_persona`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `persona_tipo_persona` AS select `persona`.`cedula` AS `cedula`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `nombre_completo`,`tipo_persona`.`descripcion` AS `descripcion` from (`persona` join `tipo_persona` on((`persona`.`id_tipo_persona` = `tipo_persona`.`id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_alguacil`
--
DROP TABLE IF EXISTS `vista_alguacil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_alguacil` AS select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `alguacil` `a` on((`p`.`cedula` = `a`.`cedula`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_defensor`
--
DROP TABLE IF EXISTS `vista_defensor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_defensor` AS select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`d`.`tipo` AS `tipo`,`d`.`impres` AS `impres`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `defensor` `d` on((`p`.`cedula` = `d`.`cedula`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_fiscal`
--
DROP TABLE IF EXISTS `vista_fiscal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_fiscal` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`fiscal`.`numero` AS `numero`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `fiscal` on((`persona`.`cedula` = `fiscal`.`cedula`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_imputado`
--
DROP TABLE IF EXISTS `vista_imputado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_imputado` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`imputado`.`condicion` AS `condicion`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `imputado` on((`persona`.`cedula` = `imputado`.`cedula`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_juez`
--
DROP TABLE IF EXISTS `vista_juez`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_juez` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `juez` on((`persona`.`cedula` = `juez`.`cedula`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_secretaria`
--
DROP TABLE IF EXISTS `vista_secretaria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_secretaria` AS select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `secretaria` `s` on((`p`.`cedula` = `s`.`cedula`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_testigo`
--
DROP TABLE IF EXISTS `vista_testigo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_testigo` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `testigo` on((`persona`.`cedula` = `testigo`.`cedula`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_tribunal`
--
DROP TABLE IF EXISTS `vista_tribunal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_tribunal` AS select `t`.`id` AS `id`,`t`.`numero` AS `numero`,`tdt`.`descripcion` AS `descripcion`,`t`.`id_usuario` AS `id_usuario`,`t`.`fecha_de_registro` AS `fecha_de_registro` from (`tribunal` `t` join `tipo_de_tribunal` `tdt` on((`t`.`id_tipo_tribunal` = `tdt`.`id`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_victima`
--
DROP TABLE IF EXISTS `vista_victima`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_victima` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `victima` on((`persona`.`cedula` = `victima`.`cedula`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
