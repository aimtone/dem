-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-04-2017 a las 22:09:04
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
-- Estructura de tabla para la tabla `alguacil`
--

CREATE TABLE IF NOT EXISTS `alguacil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `alguacil`
--

INSERT INTO `alguacil` (`id`, `cedula`) VALUES
(18, 'V-028383'),
(0, 'V-21301049'),
(11, 'V-21301051'),
(8, 'V-21939302'),
(10, 'V-383839929'),
(15, 'v099030923');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `defensor`
--

INSERT INTO `defensor` (`id`, `cedula`, `tipo`, `impres`) VALUES
(2, 'V-21301059', 'PUBLICO', '38393939'),
(3, 'v-2929', '1', '3908309393'),
(4, 'v393398', 'PRIVADO', '900');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento_sala`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dem`.`evento_sala` AS select `dem`.`evento`.`id` AS `id`,`dem`.`sala`.`id` AS `resourceId`,`dem`.`evento`.`inicio` AS `start`,`dem`.`evento`.`fin` AS `end`,`dem`.`evento`.`titulo` AS `title` from (`dem`.`evento` join `dem`.`sala` on((`dem`.`evento`.`id_sala` = `dem`.`sala`.`id`))) where ((`dem`.`sala`.`id` <> '') and (`dem`.`evento`.`inicio` <> '') and (`dem`.`evento`.`fin` <> ''));
-- Error leyendo datos: (#1356 - View 'dem.evento_sala' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fiscal`
--

CREATE TABLE IF NOT EXISTS `fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` text NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `fiscal`
--

INSERT INTO `fiscal` (`id`, `cedula`, `numero`) VALUES
(1, 'v8292', 388);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `imputado`
--

INSERT INTO `imputado` (`id`, `cedula`, `condicion`) VALUES
(0, 'V049340493', 'IMPUTADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juez`
--

CREATE TABLE IF NOT EXISTS `juez` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `juez`
--

INSERT INTO `juez` (`id`, `cedula`) VALUES
(1, 'V-23988323');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `cedula`, `nombres`, `apellidos`, `email`, `telefono`, `fecha_de_nacimiento`, `id_tipo_persona`, `id_usuario`, `fecha_de_registro`) VALUES
(8, 'V-21301059', 'ANTHONY', 'MEDINA', 'ANTHONYJMEDINAF@GMAIL.COM', '', '20/10/1992', 1, NULL, '2017-04-03 18:04:40'),
(11, 'V-12364783', 'ANGUSTIA DEL CARMEN', 'PEREZ MOLINA', 'ANGUSTIAPEREZMOLINA@GMAIL.COM', '+58 416 738 92 23', '10/10/1950', 2, NULL, '2017-04-03 18:18:38'),
(13, 'V-21939302', 'PEDRO JOSE', 'SANCHEZ TOLEDO', 'PEDRITOZ@GMAIL.COM', '+58 426 949 03 00', '20/10/1992', 3, NULL, '2017-04-03 18:30:53'),
(15, 'V-38383992', 'ANTHONy', 'MEDINA', 'ANTHONY@GMAIL.COm', '+58 993 930 90 39', '01/04/2017', 3, NULL, '2017-04-03 20:01:12'),
(16, 'V-21301051', 'ANTHONY JOSE', 'SANCHEZ', 'JUA@KA.COM', '+58 099 090 90 09', '20/10/1992', 3, NULL, '2017-04-03 20:50:53'),
(20, 'v099030923', 'JUAN JOSE', 'SANCHEZ MEJIAS', 'JUANMEJIOAS@HOTMAIL.COM', '+58 398 383 89 93', '14/04/2017', 3, NULL, '2017-04-03 21:49:12'),
(23, 'V-028383', 'ANTHONY JOSE', 'MEDINA', 'ANTHONY@SJHSHJ.COm', '+58 894 894 89 34', '16/04/2017', 3, NULL, '2017-04-04 00:07:40'),
(24, 'V-293883', 'JOSE', 'MEDINA', 'HSHSH@SHsh', '+58 389 393 98 38', '20/04/2017', 4, NULL, '2017-04-03 23:07:26'),
(26, 'V049340493', 'JUAN', 'PEREZ', 'ANJHAA@SJSJ.COm', '+58 984 834 93 84', '04/04/2017', 4, NULL, '2017-04-03 23:23:08'),
(28, 'V-23988323', 'CARLOS', 'PERIe', 'JSHHSSJ@JDjsd', '+58 393 300 00 00', '22/04/2017', 5, NULL, '2017-04-04 00:12:02'),
(29, 'v239023', 'JAj', 'MEDINA', 'JDJDJD@DJdjs', '+58 398 389 98 30', '29/04/2017', 6, NULL, '2017-04-03 23:41:16'),
(30, 'V-28393939', 'MILAGROSDELCARMEN', 'PEREZ', 'JSSJ@Ssh', '+58 324 923 84 98', '07/04/2017', 7, NULL, '2017-04-04 00:11:02'),
(31, 'V3093903', 'JUAn', 'MIGUEL', 'KSKJSKS@SKSKJkjs', '+58 233 243 24 23', '17/04/2017', 7, NULL, '2017-04-03 23:56:15'),
(32, 'v8292', 'ANTHONY', 'JAAJAJ', 'KJSKD@SDJHsdjhk', '+58 324 324 23 40', '11/04/2017', 8, NULL, '2017-04-04 00:02:44'),
(33, 'v-2929', 'JJSJSj', 'JSJsj', 'JSDKSD@JDj', '+58 000 000 00 00', '08/04/2017', 1, NULL, '2017-04-04 00:30:53'),
(34, 'v393398', 'JUAn', 'PEREz', 'HAHHA@SJsj', '+58 393 903 90 33', '11/04/2017', 1, NULL, '2017-04-04 00:36:58');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE IF NOT EXISTS `secretaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `secretaria`
--

INSERT INTO `secretaria` (`id`, `cedula`) VALUES
(7, 'V-12364783');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `testigo`
--

INSERT INTO `testigo` (`id`, `cedula`) VALUES
(1, 'V-28393939');

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
(1, 'DEFENSOR', 1, '2017-04-03 16:28:09'),
(2, 'SECRETARIA', 1, '2017-04-03 16:28:12'),
(3, 'ALGUACIL', 1, '2017-04-03 18:22:28'),
(4, 'IMPUTADO', 1, '2017-04-03 23:00:40'),
(5, 'JUEZ', 1, '2017-04-03 23:27:09'),
(6, 'VICTIMA', 1, '2017-04-03 23:35:55'),
(7, 'TESTIGO', 1, '2017-04-03 23:43:47'),
(8, 'FISCAL', 1, '2017-04-03 23:49:19');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `victima`
--

CREATE TABLE IF NOT EXISTS `victima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `victima`
--

INSERT INTO `victima` (`id`, `cedula`) VALUES
(0, 'v239023');

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
-- Estructura para la vista `vista_victima`
--
DROP TABLE IF EXISTS `vista_victima`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_victima` AS select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `victima` on((`persona`.`cedula` = `victima`.`cedula`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
