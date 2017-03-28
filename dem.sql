-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-03-2017 a las 13:57:23
-- Versión del servidor: 5.5.53-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `titulo` varchar(5000) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `inicio`, `fin`, `titulo`, `descripcion`, `id_sala`, `id_usuario`, `fecha_de_registro`) VALUES
(1, '2017-02-24 03:00:00', '2017-02-24 08:00:00', 'Audiencia Juan Sanchez', 'Audiencia de Juan sanchez por el caso de su hijo', 2, 1, '2017-02-22 16:24:28'),
(2, '2017-02-25 00:00:00', '2017-02-25 00:00:00', 'Evento nuevo', 'evento de citacion', 3, 1, '2017-02-22 16:36:14');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `evento_sala`
--
CREATE TABLE IF NOT EXISTS `evento_sala` (
`id` int(11)
,`resourceId` int(11)
,`start` datetime
,`end` datetime
,`title` varchar(5000)
);
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`id`, `descripcion`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'ADMINISTRADOR', NULL, '2017-02-18 19:45:06'),
(2, 'USUARIO COMUN', 1, '2017-02-18 20:19:10');

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
(25, 'V-21301059', 'ANTHONY JOSE', 'MEDINA FUENTES', 'ANTHONYJMEDINAF@GMAIL.COM', '+58 426 357 54 89', '20/10/1993', 1, NULL, '2017-03-14 13:16:33'),
(26, 'V-89898989', 'juan', 'rodriguez', 'skjlksjdlks@wkjds', '+58 034 983 09 84', '08/03/2017', 2, NULL, '2017-03-18 11:52:14'),
(27, 'V-43870398', 'LSKDJDLKJ', 'KJSDLKJLK', 'DJKFHDL@SDLKJS', '+58 893 479 83 77', '17/03/2017', 3, NULL, '2017-03-18 11:52:17'),
(28, 'V-39330933', 'MILAGROS', 'MANZANARES', 'MILAGROSMANZANARES@HOTMAIL.COM', '+58 549 893 89 38', '14/03/1969', 1, 0, '2017-03-18 14:38:40'),
(29, 'V-21301058', 'JUAN JOSE', 'SANCHEZ', 'JUANJOSE@GMAIL.COM', '+58 329 832 89 38', '21/10/1992', 1, 0, '2017-03-18 17:23:49'),
(30, 'v-73849555', 'manuela josefina', 'bolivar perez', 'boli.manu@gmail.com', '+58 424 737 84 84', '01/03/2017', 1, 0, '2017-03-18 17:36:26'),
(31, 'V-23839823', 'dsksjkKJ', 'KDK', 'KSJJKDW#@DNSDJ', '+58 398 298 38 32', '31/03/2017', 1, NULL, '2017-03-18 17:37:48'),
(32, 'V2828282', 'CNCJ', 'JH', 'DSKSJKD@DFJSDJ', '+58 239 838 38 93', '06/03/2017', 1, NULL, '2017-03-18 17:38:03'),
(33, 'V239898289', 'FKJKJ', 'KJD', '', '+58 298 329 83 89', '25/03/2017', 1, NULL, '2017-03-18 17:38:25'),
(34, 'V287128399', 'KJSJKDS', 'JKDFKJ', '', '+58 398 934 90 39', '08/03/2017', 1, NULL, '2017-03-18 17:38:51'),
(35, 'V328938392', 'JSDK', 'JKDSJK', '', '+58 320 998 93 29', '06/03/2017', 1, NULL, '2017-03-18 17:39:04'),
(36, 'V329320949', 'KLFDJLKD', 'LKDLK', '', '+58 328 989 23 89', '14/03/2017', 1, NULL, '2017-03-18 17:39:18'),
(37, 'V382389', 'SJKSKJ', 'KKJS3', '', '+58 349 839 48 90', '14/03/2017', 1, NULL, '2017-03-18 17:39:44');

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
  `colorEvento` varchar(7) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id`, `descripcion`, `colorEvento`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'sala 1', 'red', 1, '2017-02-20 17:09:50'),
(2, 'sala 2', 'orange', 1, '2017-02-22 13:32:46'),
(3, 'sala 3', 'gray', 1, '2017-02-22 13:31:52'),
(4, 'sala 4', 'pink', 1, '2017-02-22 16:38:54');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id`, `descripcion`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'DEFENSOR', 1, '2017-03-14 02:06:14'),
(2, 'FISCAL', 1, '2017-03-14 02:06:43'),
(3, 'JUEZ', 1, '2017-03-14 02:06:43'),
(4, 'SECRETARIA', 1, '2017-03-14 02:07:40'),
(5, 'VICTIMA', 1, '2017-03-14 02:07:40'),
(6, 'IMPUTADO', 1, '2017-03-14 02:07:40'),
(7, 'TESTIGO', 1, '2017-03-14 02:07:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_persona` varchar(11) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`cedula_persona`),
  UNIQUE KEY `id_persona` (`cedula_persona`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `cedula_persona`, `clave`, `id_nivel`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'V0021301059', 'e807f1fcf82d132f9bb018ca6738a19f', 1, NULL, '2017-02-18 20:02:38'),
(2, 'V0021301060', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '2017-03-09 03:37:22');

-- --------------------------------------------------------

--
-- Estructura para la vista `evento_sala`
--
DROP TABLE IF EXISTS `evento_sala`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `evento_sala` AS select `evento`.`id` AS `id`,`sala`.`id` AS `resourceId`,`evento`.`inicio` AS `start`,`evento`.`fin` AS `end`,`evento`.`titulo` AS `title` from (`evento` join `sala` on((`evento`.`id_sala` = `sala`.`id`))) where ((`sala`.`id` <> '') and (`evento`.`inicio` <> '') and (`evento`.`fin` <> ''));

-- --------------------------------------------------------

--
-- Estructura para la vista `persona_tipo_persona`
--
DROP TABLE IF EXISTS `persona_tipo_persona`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `persona_tipo_persona` AS select `persona`.`cedula` AS `cedula`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `nombre_completo`,`tipo_persona`.`descripcion` AS `descripcion` from (`persona` join `tipo_persona` on((`persona`.`id_tipo_persona` = `tipo_persona`.`id`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
