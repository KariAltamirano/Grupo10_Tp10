-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2025 a las 03:57:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biblioteca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_libros` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `contenido_com` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_libros`, `id_miembro`, `contenido_com`) VALUES
(1, 1, 1, 'Una historia mágica y épica'),
(2, 1, 3, 'Me encantó la profundidad del mundo'),
(3, 1, 4, 'Demasiado largo, pero atrapante'),
(4, 2, 1, 'Muy entretenido y fácil de leer'),
(5, 2, 2, 'La magia me atrapó desde el inicio'),
(6, 2, 4, 'Personajes entrañables'),
(7, 3, 1, 'Oscuro y misterioso'),
(8, 3, 3, 'Me dio escalofríos al leerlo'),
(9, 3, 4, 'El final es impactante'),
(10, 4, 2, 'Una historia romántica distinta'),
(11, 4, 3, 'Muy tierno, me gustó');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libros` int(11) NOT NULL,
  `titulo_libros` varchar(120) NOT NULL,
  `autor_libros` varchar(60) NOT NULL,
  `genero_libros` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libros`, `titulo_libros`, `autor_libros`, `genero_libros`) VALUES
(1, 'El señor de los anillos', 'J. R. R. Tolkien', 'Fantasía'),
(2, 'Harry Potter: la piedra filosofal', 'J. K. Rowling', 'Fantasía'),
(3, 'La caída de la casa Usher', 'Edgar Allan Poe', 'Terror literario'),
(4, 'Un amor de otra época', 'Adam West', 'Novela Rosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `id_miembro` int(11) NOT NULL,
  `nombre_miembro` varchar(60) NOT NULL,
  `dirc_miembro` varchar(120) NOT NULL,
  `telefono_miembro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`id_miembro`, `nombre_miembro`, `dirc_miembro`, `telefono_miembro`) VALUES
(1, 'Karina', 'pintamostodalacasa@', 2665709993),
(2, 'Matías', 'dosdetrescaidas@', 2657609993),
(3, 'Ezequiel', 'soychicarebelde@', 2664809945),
(4, 'Alejo', 'pupitre15@', 2665709845);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamoslibros`
--

CREATE TABLE `prestamoslibros` (
  `id_prestamo` int(11) NOT NULL,
  `id_libros` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamoslibros`
--

INSERT INTO `prestamoslibros` (`id_prestamo`, `id_libros`, `id_miembro`, `fecha_prestamo`, `fecha_devolucion`) VALUES
(1, 1, 1, '2024-03-15', '0000-00-00'),
(2, 2, 2, '2024-04-10', '0000-00-00'),
(3, 3, 3, '2024-05-20', '2024-06-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_libros` (`id_libros`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libros`);

--
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`id_miembro`);

--
-- Indices de la tabla `prestamoslibros`
--
ALTER TABLE `prestamoslibros`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_libros` (`id_libros`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `miembros`
--
ALTER TABLE `miembros`
  MODIFY `id_miembro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `prestamoslibros`
--
ALTER TABLE `prestamoslibros`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_libros`) REFERENCES `libros` (`id_libros`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`);

--
-- Filtros para la tabla `prestamoslibros`
--
ALTER TABLE `prestamoslibros`
  ADD CONSTRAINT `prestamoslibros_ibfk_1` FOREIGN KEY (`id_libros`) REFERENCES `libros` (`id_libros`),
  ADD CONSTRAINT `prestamoslibros_ibfk_2` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
