-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2021 a las 13:50:33
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tallermoto_php`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `telefonoCliente` int(11) NOT NULL,
  `nombreCliente` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccionCliente` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `telefonoCliente`, `nombreCliente`, `direccionCliente`) VALUES
(1, 612894857, 'Rafael Nieto de Dios', '\r\nAlameda de Hércules, 24, 2ºB, 41002 Sevilla, España\r\n'),
(2, 604229966, 'Ramona Ponte Alegre', 'Av de Bellavista, 153, 4ºC, 41014 Sevilla, España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportivas`
--

CREATE TABLE `deportivas` (
  `idDeportiva` int(11) NOT NULL,
  `kilometroDeportiva` decimal(10,2) NOT NULL,
  `idMotoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `deportivas`
--

INSERT INTO `deportivas` (`idDeportiva`, `kilometroDeportiva`, `idMotoFK`) VALUES
(7, '330234.23', 1),
(8, '220456.23', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int(11) NOT NULL,
  `gananciaFactura` decimal(10,2) NOT NULL,
  `ventaFactura` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `gananciaFactura`, `ventaFactura`) VALUES
(1, '2400.32', '3.00'),
(2, '8991.12', '321.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monte`
--

CREATE TABLE `monte` (
  `idMonte` int(11) NOT NULL,
  `cilindradaMonte` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idMotoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `monte`
--

INSERT INTO `monte` (`idMonte`, `cilindradaMonte`, `idMotoFK`) VALUES
(21, '220cc', 4),
(22, '330cc', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motos`
--

CREATE TABLE `motos` (
  `idMoto` int(11) NOT NULL,
  `marcaMoto` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `modeloMoto` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precioMoto` decimal(10,2) NOT NULL,
  `cantidadMoto` int(11) NOT NULL,
  `idClienteFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `motos`
--

INSERT INTO `motos` (`idMoto`, `marcaMoto`, `modeloMoto`, `precioMoto`, `cantidadMoto`, `idClienteFK`) VALUES
(3, 'Yamaha', 'Ninja', '4999.00', 2, 1),
(4, 'Suzuki', 'kamisama', '3212.00', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realizaciones`
--

CREATE TABLE `realizaciones` (
  `idRealizacion` int(11) NOT NULL,
  `idFacturaFK` int(11) NOT NULL,
  `idTrabajadorFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `realizaciones`
--

INSERT INTO `realizaciones` (`idRealizacion`, `idFacturaFK`, `idTrabajadorFK`) VALUES
(10, 1, 22),
(11, 2, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `idTrabajador` int(11) NOT NULL,
  `dniTrabajador` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreTrabajador` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idDependienteDirectorFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`idTrabajador`, `dniTrabajador`, `nombreTrabajador`, `idDependienteDirectorFK`) VALUES
(22, '32092206D', 'Maria Cospedal', 0),
(23, '28384958O', 'Benancio Ortega', 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `idTrabajo` int(11) NOT NULL,
  `idMotoFK` int(11) NOT NULL,
  `idTrabajadorFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `trabajos`
--

INSERT INTO `trabajos` (`idTrabajo`, `idMotoFK`, `idTrabajadorFK`) VALUES
(1, 4, 22),
(2, 3, 23);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `deportivas`
--
ALTER TABLE `deportivas`
  ADD PRIMARY KEY (`idDeportiva`),
  ADD KEY `idMotoFK` (`idMotoFK`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `monte`
--
ALTER TABLE `monte`
  ADD PRIMARY KEY (`idMonte`),
  ADD KEY `idMotoFK` (`idMotoFK`);

--
-- Indices de la tabla `motos`
--
ALTER TABLE `motos`
  ADD PRIMARY KEY (`idMoto`),
  ADD KEY `idClienteFK` (`idClienteFK`);

--
-- Indices de la tabla `realizaciones`
--
ALTER TABLE `realizaciones`
  ADD PRIMARY KEY (`idRealizacion`),
  ADD KEY `idFacturaFK` (`idFacturaFK`),
  ADD KEY `idTrabajadorFK` (`idTrabajadorFK`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`idTrabajador`),
  ADD KEY `idDependienteDirectorFK` (`idDependienteDirectorFK`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`idTrabajo`),
  ADD KEY `idTrabajadorFK` (`idTrabajadorFK`),
  ADD KEY `idMotoFK` (`idMotoFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `deportivas`
--
ALTER TABLE `deportivas`
  MODIFY `idDeportiva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `monte`
--
ALTER TABLE `monte`
  MODIFY `idMonte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `motos`
--
ALTER TABLE `motos`
  MODIFY `idMoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `realizaciones`
--
ALTER TABLE `realizaciones`
  MODIFY `idRealizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `idTrabajador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  MODIFY `idTrabajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `monte`
--
ALTER TABLE `monte`
  ADD CONSTRAINT `monte_ibfk_1` FOREIGN KEY (`idMotoFK`) REFERENCES `motos` (`idMoto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `realizaciones`
--
ALTER TABLE `realizaciones`
  ADD CONSTRAINT `realizaciones_ibfk_1` FOREIGN KEY (`idFacturaFK`) REFERENCES `facturas` (`idFactura`),
  ADD CONSTRAINT `realizaciones_ibfk_2` FOREIGN KEY (`idTrabajadorFK`) REFERENCES `trabajadores` (`idTrabajador`);

--
-- Filtros para la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD CONSTRAINT `trabajos_ibfk_1` FOREIGN KEY (`idTrabajadorFK`) REFERENCES `trabajadores` (`idTrabajador`),
  ADD CONSTRAINT `trabajos_ibfk_2` FOREIGN KEY (`idMotoFK`) REFERENCES `motos` (`idMoto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
