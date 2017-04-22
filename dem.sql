-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-04-2017 a las 13:50:29
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
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `titulo` varchar(5000) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `acto_sala`
--
CREATE TABLE IF NOT EXISTS `acto_sala` (
`id` int(11)
,`resourceId` int(11)
,`start` datetime
,`end` datetime
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `alguacil`
--

INSERT INTO `alguacil` (`id`, `cedula`) VALUES
(2, 'V-22839339');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `fiscal`
--

INSERT INTO `fiscal` (`id`, `cedula`, `numero`) VALUES
(2, 'V-9288338', 25);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

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
(36, 'V-9288338', 'BAUDILIO JOSE', 'SUAREZ', 'BAUDLIOSUAREZ@GMAIL.COM', '+58 426 738 38 38', '10/10/1982', 3, NULL, '2017-04-17 17:47:49');

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
  `color` varchar(7) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`descripcion`),
  UNIQUE KEY `color` (`color`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id`, `descripcion`, `color`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'SALA 1', '#1E1652', NULL, '2017-04-14 23:57:12'),
(2, 'SALA 2', '#ED00C8', NULL, '2017-04-14 19:37:59'),
(3, 'SALA 3', '#FF1212', NULL, '2017-04-05 19:25:55'),
(4, 'SALA 4', '#8A147F', NULL, '2017-04-05 19:26:17'),
(5, 'SALA 5', '#118C0C', NULL, '2017-04-05 19:26:38'),
(7, 'SALA 6', '#FF9300', NULL, '2017-04-05 19:27:06'),
(8, 'SALA 7', '#520E0E', NULL, '2017-04-05 19:29:23'),
(13, 'SALA 8', '#C90000', NULL, '2017-04-14 23:57:32');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `testigo`
--

INSERT INTO `testigo` (`id`, `cedula`) VALUES
(2, 'V-23776782');

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
(1, 'V-21301059', '21301059', 1, 1, '2017-04-14 21:00:30');

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
