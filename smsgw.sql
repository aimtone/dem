-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-03-2017 a las 13:57:35
-- Versión del servidor: 5.5.53-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `smsgw`
--
CREATE DATABASE IF NOT EXISTS `smsgw`;
USE `smsgw`; 
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inbox`
--

CREATE TABLE IF NOT EXISTS `inbox` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL DEFAULT '',
  `smsdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insertdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text,
  `phone` tinyint(4) DEFAULT NULL,
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `inbox`
--

INSERT INTO `inbox` (`id`, `number`, `smsdate`, `insertdate`, `text`, `phone`, `processed`) VALUES
(1, 'MOVISTAR', '2016-08-05 15:19:16', '2017-02-12 02:40:05', 'Actualiza tu correo electronico https://mi.movistar.com.ve seccion perfil de usuario/Modificar Perfil y realiza tus operaciones', NULL, 0),
(2, '+584127615199', '2016-08-04 14:11:06', '2017-02-12 02:40:05', 'Hola', NULL, 0),
(3, '77106', '2016-08-03 14:51:59', '2017-02-12 02:40:05', 'BBVA PROVINCIAL COMPRA CON TDD.3884  POR BS.25,965.00(TPV) SI UD. NO LA REALIZO, ENVIE LA LETRA N AL 77106 O LLAME 0500-5087432 F2016/08/03 H18:51:50', NULL, 0),
(4, '+584127615199', '2016-08-02 20:50:54', '2017-02-12 02:40:05', 'Y de que trabajas amigo y que estudias.. En esta semana nos tomamos ese café', NULL, 0),
(5, '+584127615199', '2016-08-02 19:01:22', '2017-02-12 02:40:05', 'Cheveré vale..  En casa. Acabo de llegar de tomar café con mi esposa.. Cuéntame de ti', NULL, 0),
(6, '+584127615199', '2016-08-02 18:58:44', '2017-02-12 02:40:05', 'Buenas como estas? Esta mañana me dejaste tu numero en la red. Yo aparezco como maduro_sf', NULL, 0),
(7, '+584127615199', '2016-08-02 13:39:57', '2017-02-12 02:40:05', 'Hola buenas tardes', NULL, 0),
(8, '+0811', '2016-08-01 22:46:21', '2017-02-12 02:40:05', 'Su saldo es Bs.F. 0,03, su bono es de Bs.F. 0,00, sus cupos: Bono 10 Min a Todos 10 Min, Bono 600 Seg a Todos 0 Seg y Bono 100 SMS 0 Msj', NULL, 0),
(9, '+584168573634', '2016-08-01 22:37:31', '2017-02-12 02:40:05', 'IMEI: 351764050099056\n SVN: 78', NULL, 0),
(10, '77106', '2016-07-28 08:13:09', '2017-02-12 02:40:05', 'BBVA Provincial informa Clave Digital:  16075515  para Actualizacion datos. Si ud. no esta realizando esta oper. llame al 212-5044009', NULL, 0),
(11, '+584145293479', '2016-05-27 19:11:56', '2017-02-12 02:40:05', 'holaa', NULL, 0),
(12, '+584269012804', '2016-05-28 01:18:45', '2017-02-12 02:40:06', ' 2 llamadas sin contestar:<27/05> ,04269012804 ,13:37', NULL, 0),
(13, '+584145293479', '2016-05-27 08:32:06', '2017-02-12 02:40:06', 'hola buenos días como amanece ', NULL, 0),
(14, '+584262525009', '2016-05-27 08:35:45', '2017-02-12 02:40:06', 'Mira mmg vamos hacer la expo que tengo que viajar', NULL, 0),
(15, '+584145293479', '2016-05-26 17:25:54', '2017-02-12 02:40:06', 'el papa de mi padrastro ', NULL, 0),
(16, '+584145293479', '2016-05-26 17:10:46', '2017-02-12 02:40:06', 'claro el entierro és mañana en la tarde', NULL, 0),
(17, '+584145293479', '2016-05-26 16:59:19', '2017-02-12 02:40:06', 'ya voy en camino al pueblo', NULL, 0),
(18, '+584145293479', '2016-05-26 16:23:48', '2017-02-12 02:40:06', 'hola rey como esta ', NULL, 0),
(19, '+584120504070', '2016-05-26 16:00:05', '2017-02-12 02:40:06', 'Ok cuenta con eso del mio men ', NULL, 0),
(20, '+584162398667', '2016-05-26 15:56:35', '2017-02-12 02:40:06', 'Disculpa me ekivoke x un nro y te cayo ati disculpa Joven', NULL, 0),
(21, '+584120504070', '2016-05-26 14:45:27', '2017-02-12 02:40:06', '??', NULL, 0),
(22, '+584120504070', '2016-05-26 14:23:32', '2017-02-12 02:40:06', 'No tienes  para prestsr 3mil hadta el 31', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multipartinbox`
--

CREATE TABLE IF NOT EXISTS `multipartinbox` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL DEFAULT '',
  `smsdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insertdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` varchar(160) DEFAULT NULL,
  `phone` tinyint(4) DEFAULT NULL,
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `refnum` smallint(6) DEFAULT NULL,
  `maxnum` smallint(6) DEFAULT NULL,
  `curnum` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `outbox`
--

CREATE TABLE IF NOT EXISTS `outbox` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL,
  `processed_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `insertdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text,
  `phone` tinyint(4) DEFAULT NULL,
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `error` tinyint(4) NOT NULL DEFAULT '-1',
  `dreport` tinyint(4) NOT NULL DEFAULT '0',
  `not_before` time NOT NULL DEFAULT '00:00:00',
  `not_after` time NOT NULL DEFAULT '23:59:59',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
