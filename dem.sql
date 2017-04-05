-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-04-2017 a las 19:24:42
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dem`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarUsuario` (IN `cedula` VARCHAR(20), IN `clave` VARCHAR(20))  BEGIN

SET @VConsulta = CONCAT("SELECT * FROM usuario WHERE cedula = '",cedula,"' AND clave ='",clave,"';");
PREPARE Declaracion FROM @VConsulta;
EXECUTE Declaracion;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acto`
--

CREATE TABLE `acto` (
  `id` int(11) NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `titulo` varchar(5000) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `acto_sala`
--
CREATE TABLE `acto_sala` (
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

CREATE TABLE `alguacil` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alguacil`
--

INSERT INTO `alguacil` (`id`, `cedula`) VALUES
(1, 'V-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `defensor`
--

CREATE TABLE `defensor` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `impres` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `defensor`
--

INSERT INTO `defensor` (`id`, `cedula`, `tipo`, `impres`) VALUES
(1, 'V2929', 'PUBLICO', '2828282'),
(3, 'HSHS', 'PRIVATE', '2823'),
(5, 'V29223', 'PUBLICO', '2828282'),
(6, 'V9392', '393', '3939'),
(7, 'V949449', 'PUBLICO', '4848483');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fiscal`
--

CREATE TABLE `fiscal` (
  `id` int(11) NOT NULL,
  `cedula` text NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fiscal`
--

INSERT INTO `fiscal` (`id`, `cedula`, `numero`) VALUES
(1, 'V009', 838378);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imputado`
--

CREATE TABLE `imputado` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `condicion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imputado`
--

INSERT INTO `imputado` (`id`, `cedula`, `condicion`) VALUES
(1, 'IMPUTADO', ''),
(2, 'V2828', 'IMPUTADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juez`
--

CREATE TABLE `juez` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juez`
--

INSERT INTO `juez` (`id`, `cedula`) VALUES
(1, 'V-21301059'),
(2, 'V-21301060'),
(6, 'V-28404');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(9) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(17) NOT NULL,
  `fecha_de_nacimiento` text NOT NULL,
  `id_tipo_persona` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `cedula`, `nombres`, `apellidos`, `email`, `telefono`, `fecha_de_nacimiento`, `id_tipo_persona`, `id_usuario`, `fecha_de_registro`) VALUES
(1, 'V-21301059', 'ANTHONY', 'MEDINA', 'ANTHONYJMEDINA@GMAIL.COM', '+58 426 357 54 89', '20/10/1992', 5, NULL, '2017-04-05 14:29:15'),
(2, 'V-21301060', 'MARIANGEL', 'GAUTIER', 'MARIGAUTIER@GMAIL.COM', '+58 858 558 66 66', '20/10/1992', 5, NULL, '2017-04-05 15:11:16'),
(6, 'V-1829333', 'MONICA', 'PEREZ', 'MONC@HOTMAIL.COM', '+58 228 282 88 22', '20/19/1922', 2, NULL, '2017-04-05 15:16:12'),
(8, 'V-23', 'JUAN', 'SJSJ', 'SJS@SSJHH', '+58 338 383 83 33', '18/04/2017', 3, NULL, '2017-04-05 14:47:34'),
(9, 'V939', 'KSK', 'KSKSDJDJDJDJDJ', 'SJSJSJ@SJS', '+58 322 222 22 22', '03/04/2017', 7, NULL, '2017-04-05 14:50:06'),
(10, 'V939393', 'SSJSJ', 'JSJSJSSS', 'JSSJJ@SJS', '+58 292 929 92 92', '04/04/2017', 6, NULL, '2017-04-05 14:53:14'),
(11, 'V009', 'SJSJHHHHHHHHHHHHHHHH', 'SJSJSJ', 'KSKS@SJS', '+58 333 333 33 33', '12/04/2017', 3, NULL, '2017-04-05 14:56:06'),
(12, 'V292', 'AJJ', 'SJSJ', 'JSJS@SJSJ', '+58 828 282 82 82', '06/04/2017', 4, NULL, '2017-04-05 14:59:17'),
(13, 'V2828', 'SJSJSJ', 'JSJSJ', 'HWHW@SHSH', '+58 222 222 22 22', '08/04/2017', 4, NULL, '2017-04-05 15:00:53'),
(16, 'HSHS', 'JEE989', 'JE', 'HDHD@D', '+58 222 222 22 22', '03/04/2017', 1, NULL, '2017-04-05 17:05:40'),
(17, 'V-28404', 'KILYE', 'RODRÃGUEZ', 'KYKIE@GMAIL.COM', '+58 125 558 88 88', '10/06/2015', 5, NULL, '2017-04-05 15:13:42'),
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
(28, 'V9392', 'KSKDJD', 'KSKSDJDJDJDJDJ', 'SJSJSJ@SJS', '+58 322 222 22 22', '03/04/2017', 1, NULL, '2017-04-05 17:21:57'),
(29, 'V949449', 'NUEVA', 'PERSONA', 'SJJS2S@DJSD', '+58 393 939 39 30', '25/04/2017', 1, NULL, '2017-04-05 17:23:12');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `persona_tipo_persona`
--
CREATE TABLE `persona_tipo_persona` (
`cedula` varchar(10)
,`nombre_completo` varchar(201)
,`descripcion` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `colorEvento` varchar(7) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE `secretaria` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `secretaria`
--

INSERT INTO `secretaria` (`id`, `cedula`) VALUES
(1, 'V-1829333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suplente`
--

CREATE TABLE `suplente` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `id_fiscal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testigo`
--

CREATE TABLE `testigo` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `testigo`
--

INSERT INTO `testigo` (`id`, `cedula`) VALUES
(1, 'V939');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_testigo`
--

CREATE TABLE `tipo_de_testigo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE `tipo_persona` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `cedula` varchar(11) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_de_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `victima`
--

CREATE TABLE `victima` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `victima`
--

INSERT INTO `victima` (`id`, `cedula`) VALUES
(1, 'V939393');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_alguacil`
--
CREATE TABLE `vista_alguacil` (
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
CREATE TABLE `vista_defensor` (
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
CREATE TABLE `vista_fiscal` (
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
CREATE TABLE `vista_imputado` (
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
CREATE TABLE `vista_juez` (
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
CREATE TABLE `vista_secretaria` (
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
CREATE TABLE `vista_testigo` (
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
CREATE TABLE `vista_victima` (
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `acto_sala`  AS  select `acto`.`id` AS `id`,`sala`.`id` AS `resourceId`,`acto`.`inicio` AS `start`,`acto`.`fin` AS `end`,`acto`.`titulo` AS `title` from (`acto` join `sala` on((`acto`.`id_sala` = `sala`.`id`))) where ((`sala`.`id` <> '') and (`acto`.`inicio` <> '') and (`acto`.`fin` <> '')) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `persona_tipo_persona`
--
DROP TABLE IF EXISTS `persona_tipo_persona`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `persona_tipo_persona`  AS  select `persona`.`cedula` AS `cedula`,concat(`persona`.`nombres`,' ',`persona`.`apellidos`) AS `nombre_completo`,`tipo_persona`.`descripcion` AS `descripcion` from (`persona` join `tipo_persona` on((`persona`.`id_tipo_persona` = `tipo_persona`.`id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_alguacil`
--
DROP TABLE IF EXISTS `vista_alguacil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_alguacil`  AS  select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `alguacil` `a` on((`p`.`cedula` = `a`.`cedula`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_defensor`
--
DROP TABLE IF EXISTS `vista_defensor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_defensor`  AS  select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`d`.`tipo` AS `tipo`,`d`.`impres` AS `impres`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `defensor` `d` on((`p`.`cedula` = `d`.`cedula`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_fiscal`
--
DROP TABLE IF EXISTS `vista_fiscal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_fiscal`  AS  select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`fiscal`.`numero` AS `numero`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `fiscal` on((`persona`.`cedula` = `fiscal`.`cedula`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_imputado`
--
DROP TABLE IF EXISTS `vista_imputado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_imputado`  AS  select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`imputado`.`condicion` AS `condicion`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `imputado` on((`persona`.`cedula` = `imputado`.`cedula`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_juez`
--
DROP TABLE IF EXISTS `vista_juez`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_juez`  AS  select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `juez` on((`persona`.`cedula` = `juez`.`cedula`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_secretaria`
--
DROP TABLE IF EXISTS `vista_secretaria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_secretaria`  AS  select `p`.`id` AS `id`,`p`.`cedula` AS `cedula`,`p`.`nombres` AS `nombres`,`p`.`apellidos` AS `apellidos`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`p`.`id_tipo_persona` AS `id_tipo_persona`,`p`.`id_usuario` AS `id_usuario`,`p`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` `p` join `secretaria` `s` on((`p`.`cedula` = `s`.`cedula`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_testigo`
--
DROP TABLE IF EXISTS `vista_testigo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_testigo`  AS  select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `testigo` on((`persona`.`cedula` = `testigo`.`cedula`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_victima`
--
DROP TABLE IF EXISTS `vista_victima`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_victima`  AS  select `persona`.`id` AS `id`,`persona`.`cedula` AS `cedula`,`persona`.`nombres` AS `nombres`,`persona`.`apellidos` AS `apellidos`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`persona`.`id_tipo_persona` AS `id_tipo_persona`,`persona`.`id_usuario` AS `id_usuario`,`persona`.`fecha_de_registro` AS `fecha_de_registro` from (`persona` join `victima` on((`persona`.`cedula` = `victima`.`cedula`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acto`
--
ALTER TABLE `acto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alguacil`
--
ALTER TABLE `alguacil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `defensor`
--
ALTER TABLE `defensor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `fiscal`
--
ALTER TABLE `fiscal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imputado`
--
ALTER TABLE `imputado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `juez`
--
ALTER TABLE `juez`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`,`email`,`telefono`),
  ADD UNIQUE KEY `cedula_2` (`cedula`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `suplente`
--
ALTER TABLE `suplente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `cedula_fiscal` (`id_fiscal`);

--
-- Indices de la tabla `testigo`
--
ALTER TABLE `testigo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `tipo_de_testigo`
--
ALTER TABLE `tipo_de_testigo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`cedula`),
  ADD UNIQUE KEY `id_persona` (`cedula`);

--
-- Indices de la tabla `victima`
--
ALTER TABLE `victima`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acto`
--
ALTER TABLE `acto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `alguacil`
--
ALTER TABLE `alguacil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `defensor`
--
ALTER TABLE `defensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `fiscal`
--
ALTER TABLE `fiscal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `imputado`
--
ALTER TABLE `imputado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `juez`
--
ALTER TABLE `juez`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `suplente`
--
ALTER TABLE `suplente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `testigo`
--
ALTER TABLE `testigo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_de_testigo`
--
ALTER TABLE `tipo_de_testigo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `victima`
--
ALTER TABLE `victima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
