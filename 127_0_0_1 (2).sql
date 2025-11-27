-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2025 a las 03:55:52
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
-- Base de datos: `21112025_escuela`
--
CREATE DATABASE IF NOT EXISTS `21112025_escuela` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `21112025_escuela`;
--
-- Base de datos: `consultasmedico`
--
CREATE DATABASE IF NOT EXISTS `consultasmedico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `consultasmedico`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL,
  `generarconsulta` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id_consulta`, `generarconsulta`) VALUES
(2001, 'generada'),
(3001, 'no generada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadousuario`
--

CREATE TABLE `estadousuario` (
  `id_estadousuario` int(11) NOT NULL,
  `activo` enum('si','no') NOT NULL,
  `inactivo` enum('si','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadousuario`
--

INSERT INTO `estadousuario` (`id_estadousuario`, `activo`, `inactivo`) VALUES
(1, 'si', ''),
(2, '', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE `expediente` (
  `id_expediente` int(11) NOT NULL,
  `nss` varchar(55) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipodusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`id_expediente`, `nss`, `id_usuario`, `id_tipodusuario`) VALUES
(1001, '12345', 1, 1),
(10001, '567855', 4, 1),
(10002, '56789', 2, 2),
(10003, '5678', 3, 4),
(10004, '567855', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialclinico`
--

CREATE TABLE `historialclinico` (
  `id_historial` int(11) NOT NULL,
  `id_expediente` int(11) NOT NULL,
  `id_estadousuario` int(11) NOT NULL,
  `id_consuta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historialclinico`
--

INSERT INTO `historialclinico` (`id_historial`, `id_expediente`, `id_estadousuario`, `id_consuta`) VALUES
(11, 1001, 1, 3001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id_receta` int(11) NOT NULL,
  `fecha` date DEFAULT curdate(),
  `id_consulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id_receta`, `fecha`, `id_consulta`) VALUES
(123, '2025-11-06', 2001),
(12345, '2025-11-04', 2001),
(123456, '2025-11-07', 2001),
(1234567, '2025-11-19', 3001),
(12345678, '2025-11-18', 3001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id_Sexo` int(11) NOT NULL,
  `h` varchar(55) NOT NULL,
  `m` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id_Sexo`, `h`, `m`) VALUES
(1, 'hombre', ''),
(2, '', 'mujer ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodeusuario`
--

CREATE TABLE `tipodeusuario` (
  `id_tipo` int(11) NOT NULL,
  `medico` varchar(100) NOT NULL,
  `paciente` varchar(100) NOT NULL,
  `visitante` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodeusuario`
--

INSERT INTO `tipodeusuario` (`id_tipo`, `medico`, `paciente`, `visitante`) VALUES
(1, 'juanito', '', ''),
(2, '', 'sofia', ''),
(3, '', '', 'romelia'),
(4, 'israel', '', ''),
(5, '', 'wilson', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ap` varchar(255) NOT NULL,
  `am` varchar(55) NOT NULL,
  `id_sexo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `ap`, `am`, `id_sexo`) VALUES
(1, 'Eduardo', 'alvarez', 'sanchez', 1),
(2, 'edson', 'quintana', 'aldair', 1),
(3, 'alexis', 'moreno', 'quintana', 1),
(4, 'sofia', 'ortiz', 'arellano', 2),
(5, 'karen', 'ortiz', 'ortiz', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `estadousuario`
--
ALTER TABLE `estadousuario`
  ADD PRIMARY KEY (`id_estadousuario`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`id_expediente`);

--
-- Indices de la tabla `historialclinico`
--
ALTER TABLE `historialclinico`
  ADD PRIMARY KEY (`id_historial`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id_receta`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id_Sexo`);

--
-- Indices de la tabla `tipodeusuario`
--
ALTER TABLE `tipodeusuario`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3002;

--
-- AUTO_INCREMENT de la tabla `estadousuario`
--
ALTER TABLE `estadousuario`
  MODIFY `id_estadousuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `id_expediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10005;

--
-- AUTO_INCREMENT de la tabla `historialclinico`
--
ALTER TABLE `historialclinico`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id_Sexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipodeusuario`
--
ALTER TABLE `tipodeusuario`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Base de datos: `ejemplo`
--
CREATE DATABASE IF NOT EXISTS `ejemplo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ejemplo`;
--
-- Base de datos: `escuela_211125`
--
CREATE DATABASE IF NOT EXISTS `escuela_211125` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escuela_211125`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `Matricula` int(100) NOT NULL,
  `Nombre` int(50) NOT NULL,
  `Fecha de Nacimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`Matricula`);
--
-- Base de datos: `escuela_2111250`
--
CREATE DATABASE IF NOT EXISTS `escuela_2111250` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escuela_2111250`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursa`
--

CREATE TABLE `cursa` (
  `Matricula` varchar(100) NOT NULL,
  `Clave` varchar(55) NOT NULL,
  `Grupo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `Matricula` varchar(100) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Fecha de Nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `Clave` varchar(55) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Semestre` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursa`
--
ALTER TABLE `cursa`
  ADD PRIMARY KEY (`Clave`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`Matricula`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`Clave`);
--
-- Base de datos: `hospital_db`
--
CREATE DATABASE IF NOT EXISTS `hospital_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `hospital_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(10) UNSIGNED NOT NULL,
  `id_paciente` int(10) UNSIGNED NOT NULL,
  `id_medico` int(10) UNSIGNED NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `estado` enum('programada','completada','cancelada','no_asistio') DEFAULT 'programada',
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_paciente`, `id_medico`, `fecha_hora`, `estado`, `creado_en`) VALUES
(1, 3, 2, '2025-11-28 10:00:00', 'programada', '2025-11-26 20:53:10');

--
-- Disparadores `citas`
--
DELIMITER $$
CREATE TRIGGER `tr_no_citas_pasado` BEFORE INSERT ON `citas` FOR EACH ROW BEGIN
    IF NEW.fecha_hora < NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permiten citas en el pasado.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_validar_paciente_cita` BEFORE INSERT ON `citas` FOR EACH ROW BEGIN
    DECLARE rol_pac TINYINT UNSIGNED;
    SELECT id_rol INTO rol_pac FROM usuarios WHERE id_usuario = NEW.id_paciente;
    IF rol_pac != (SELECT id_rol FROM roles WHERE nombre_rol = 'paciente') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo los pacientes pueden tener citas.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas_citas`
--

CREATE TABLE `encuestas_citas` (
  `id_encuesta` int(10) UNSIGNED NOT NULL,
  `id_cita` int(10) UNSIGNED NOT NULL,
  `calificacion` tinyint(3) UNSIGNED NOT NULL CHECK (`calificacion` between 1 and 5),
  `comentarios` text DEFAULT NULL,
  `respondido_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientes_clinicos`
--

CREATE TABLE `expedientes_clinicos` (
  `id_expediente` int(10) UNSIGNED NOT NULL,
  `id_paciente` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `contenido` text NOT NULL,
  `creado_por` int(10) UNSIGNED NOT NULL,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `expedientes_clinicos`
--

INSERT INTO `expedientes_clinicos` (`id_expediente`, `id_paciente`, `titulo`, `contenido`, `creado_por`, `creado_en`) VALUES
(1, 3, 'Primera consulta', 'Hipertensión leve. Se indica dieta baja en sodio.', 2, '2025-11-26 20:53:10');

--
-- Disparadores `expedientes_clinicos`
--
DELIMITER $$
CREATE TRIGGER `tr_validar_medico_expediente` BEFORE INSERT ON `expedientes_clinicos` FOR EACH ROW BEGIN
    DECLARE rol_med TINYINT UNSIGNED;
    SELECT id_rol INTO rol_med FROM usuarios WHERE id_usuario = NEW.creado_por;
    IF rol_med != (SELECT id_rol FROM roles WHERE nombre_rol = 'medico') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo los médicos pueden crear expedientes.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `cedula_profesional` varchar(50) NOT NULL,
  `consultorio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_usuario`, `especialidad`, `cedula_profesional`, `consultorio`) VALUES
(2, 'Cardiología', 'C123456', 'C-205');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_notificacion` int(10) UNSIGNED NOT NULL,
  `id_usuario_destino` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `leido` tinyint(1) DEFAULT 0,
  `tipo` enum('recordatorio','alerta','informacion') DEFAULT 'informacion',
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id_notificacion`, `id_usuario_destino`, `titulo`, `mensaje`, `leido`, `tipo`, `creado_en`) VALUES
(1, 3, 'Recordatorio de cita', 'Tienes una cita mañana a las 10:00 AM con el Dr. Ana López.', 0, 'recordatorio', '2025-11-26 20:53:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` enum('M','F','Otro') NOT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_usuario`, `fecha_nacimiento`, `genero`, `direccion`) VALUES
(3, '1985-06-15', 'M', 'Av. Siempre Viva 123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int(10) UNSIGNED NOT NULL,
  `id_paciente` int(10) UNSIGNED NOT NULL,
  `id_medico` int(10) UNSIGNED NOT NULL,
  `id_cita` int(10) UNSIGNED DEFAULT NULL,
  `medicamentos` text NOT NULL,
  `instrucciones` text DEFAULT NULL,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id_receta`, `id_paciente`, `id_medico`, `id_cita`, `medicamentos`, `instrucciones`, `creado_en`) VALUES
(1, 3, 2, NULL, 'Lisinopril 10mg', 'Tomar 1 tableta diaria por 30 días.', '2025-11-26 20:53:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` tinyint(3) UNSIGNED NOT NULL,
  `nombre_rol` varchar(20) NOT NULL CHECK (`nombre_rol` in ('sistema','medico','paciente'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(2, 'medico'),
(3, 'paciente'),
(1, 'sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimientos`
--

CREATE TABLE `seguimientos` (
  `id_seguimiento` int(10) UNSIGNED NOT NULL,
  `id_paciente` int(10) UNSIGNED NOT NULL,
  `id_medico` int(10) UNSIGNED NOT NULL,
  `datos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`datos`)),
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `seguimientos`
--

INSERT INTO `seguimientos` (`id_seguimiento`, `id_paciente`, `id_medico`, `datos`, `fecha`) VALUES
(1, 3, 2, '{\"peso\": 78, \"presion\": \"130/85\", \"notas\": \"Estable\"}', '2025-11-26 20:53:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_rol` tinyint(3) UNSIGNED NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `nombre_completo`, `email`, `telefono`, `password_hash`, `activo`, `creado_en`) VALUES
(1, 1, 'Admin Sistema', 'admin@hospital.com', '555-0000', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 1, '2025-11-26 20:53:09'),
(2, 2, 'Dr. Ana López', 'ana@hospital.com', '555-1111', '673ab82a6530ee3bd9b04ee72a4d66afa7fa059aedc685cf44e35d29d90ebafa', 1, '2025-11-26 20:53:10'),
(3, 3, 'Carlos Méndez', 'carlos@email.com', '555-2222', '299fbb455c42239c86d2ee3b15403ed1b468259ecaedf0c3527451e1f0d63d59', 1, '2025-11-26 20:53:10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD UNIQUE KEY `uk_medico_hora` (`id_medico`,`fecha_hora`),
  ADD KEY `idx_paciente_fecha` (`id_paciente`,`fecha_hora`),
  ADD KEY `idx_medico_fecha` (`id_medico`,`fecha_hora`);

--
-- Indices de la tabla `encuestas_citas`
--
ALTER TABLE `encuestas_citas`
  ADD PRIMARY KEY (`id_encuesta`),
  ADD UNIQUE KEY `uk_cita` (`id_cita`);

--
-- Indices de la tabla `expedientes_clinicos`
--
ALTER TABLE `expedientes_clinicos`
  ADD PRIMARY KEY (`id_expediente`),
  ADD KEY `creado_por` (`creado_por`),
  ADD KEY `idx_paciente` (`id_paciente`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `cedula_profesional` (`cedula_profesional`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `idx_destino_leido` (`id_usuario_destino`,`leido`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `id_cita` (`id_cita`),
  ADD KEY `idx_paciente` (`id_paciente`),
  ADD KEY `idx_medico` (`id_medico`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `seguimientos`
--
ALTER TABLE `seguimientos`
  ADD PRIMARY KEY (`id_seguimiento`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `idx_paciente_fecha` (`id_paciente`,`fecha`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `encuestas_citas`
--
ALTER TABLE `encuestas_citas`
  MODIFY `id_encuesta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expedientes_clinicos`
--
ALTER TABLE `expedientes_clinicos`
  MODIFY `id_expediente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_notificacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id_receta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seguimientos`
--
ALTER TABLE `seguimientos`
  MODIFY `id_seguimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `encuestas_citas`
--
ALTER TABLE `encuestas_citas`
  ADD CONSTRAINT `encuestas_citas_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `expedientes_clinicos`
--
ALTER TABLE `expedientes_clinicos`
  ADD CONSTRAINT `expedientes_clinicos_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expedientes_clinicos_ibfk_2` FOREIGN KEY (`creado_por`) REFERENCES `medicos` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario_destino`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `recetas_ibfk_3` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `seguimientos`
--
ALTER TABLE `seguimientos`
  ADD CONSTRAINT `seguimientos_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seguimientos_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE;
--
-- Base de datos: `medicos`
--
CREATE DATABASE IF NOT EXISTS `medicos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `medicos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipouser`
--

CREATE TABLE `tipouser` (
  `id_tuser` int(11) NOT NULL,
  `nombretuser` varchar(55) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipouser`
--

INSERT INTO `tipouser` (`id_tuser`, `nombretuser`, `descripcion`) VALUES
(1, 'SISTEMAS', 'USUARIO ESPECIALIZADO EN EL ANTENIMIENTO DEL SISTEMA'),
(2, 'MEDICO', 'USUARIO ESPECIALIZADO EN EL SECTOR SALUD'),
(3, 'PACIENTE', 'PERSONA ATENDIDA DENTRO DE LA INTITUCIÓN'),
(4, 'VISITANTE', 'PERSONA DE LA CUAL SU ESTADIA ES PARCIAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `Ap` varchar(55) NOT NULL,
  `Am` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `id_tuser` int(11) NOT NULL,
  `f_registro` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `Ap`, `Am`, `email`, `password_hash`, `id_tuser`, `f_registro`) VALUES
(1, 'ERIC', 'GOMEZ', 'MARTINEZ', 'eric@gmail.com', '546aa56dc1b06c31f9fafd86b2cda5d0', 1, '2025-11-19'),
(2, 'GABI', 'LOPEZ', 'VARGAS', 'gabi@gmail.com', '557319843e92ee97928c1a37b2eb842c', 2, '2025-11-19'),
(3, 'TAMARA', 'SEGURA', 'ARCINIEGA', 'tam@gmai.com', '2999f62796492ac2ec584c001f8627be', 3, '2025-11-19'),
(4, 'Sandra', 'VALENCIA', 'HERNANDEZ', 'sandraqgmail.com', 'a83c136705ab8ba224088419236b57e5', 4, '2025-11-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipouser`
--
ALTER TABLE `tipouser`
  ADD PRIMARY KEY (`id_tuser`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_tuser` (`id_tuser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipouser`
--
ALTER TABLE `tipouser`
  MODIFY `id_tuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tuser`) REFERENCES `tipouser` (`id_tuser`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('soportetecnico', 1, 'SoporteTecnico'),
('soporte_tecnico', 2, 'Mybase1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"soporte_tecnico\",\"table\":\"clientes\"},{\"db\":\"soporte_tecnico\",\"table\":\"empleados\"},{\"db\":\"soporte_tecnico\",\"table\":\"categorias_equipo\"},{\"db\":\"soporte_tecnico\",\"table\":\"inventario\"},{\"db\":\"soporte_tecnico\",\"table\":\"soporte_tickets\"},{\"db\":\"soportetecnico\",\"table\":\"tickets_detalles\"},{\"db\":\"soportetecnico\",\"table\":\"soporte_tickets\"},{\"db\":\"soportetecnico\",\"table\":\"informes_soporte\"},{\"db\":\"soportetecnico\",\"table\":\"equipos\"},{\"db\":\"soportetecnico\",\"table\":\"empleados\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Volcado de datos para la tabla `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('soporte_tecnico', 'categorias_equipo', 2, 141, 275),
('soporte_tecnico', 'clientes', 2, 450, 357),
('soporte_tecnico', 'empleados', 2, 472, 34),
('soporte_tecnico', 'equipos', 2, 123, 517),
('soporte_tecnico', 'informes_soporte', 2, 745, 218),
('soporte_tecnico', 'inventario', 2, 165, 44),
('soporte_tecnico', 'soporte_tickets', 2, 764, 405),
('soporte_tecnico', 'ticket_detalles', 2, 470, 541),
('soportetecnico', 'categoria_equipo', 1, 621, 53),
('soportetecnico', 'clientes', 1, 470, 441),
('soportetecnico', 'empleados', 1, 787, 215),
('soportetecnico', 'equipos', 1, 506, 184),
('soportetecnico', 'informes_soporte', 1, 0, 182),
('soportetecnico', 'inventario', 1, 45, 368),
('soportetecnico', 'soporte_tickets', 1, 815, 439),
('soportetecnico', 'tickets_detalles', 1, 1007, 108);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-10-23 17:06:22', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `rescate_animal`
--
CREATE DATABASE IF NOT EXISTS `rescate_animal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rescate_animal`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopcion`
--

CREATE TABLE `adopcion` (
  `id_adopcion` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_adoptante` int(11) NOT NULL,
  `fecha_adopcion` date NOT NULL,
  `estado` enum('pendiente','aprobada','rechazada') DEFAULT 'pendiente',
  `acta_generada` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `id_animal` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `especie` varchar(30) NOT NULL CHECK (`especie` in ('perro','gato','otro')),
  `raza` varchar(50) DEFAULT NULL,
  `edad_aprox` int(11) DEFAULT NULL CHECK (`edad_aprox` >= 0 and `edad_aprox` <= 30),
  `sexo` enum('macho','hembra') NOT NULL,
  `estado_salud` varchar(100) DEFAULT NULL,
  `fecha_rescate` date NOT NULL,
  `ubicacion_rescate` varchar(255) DEFAULT NULL,
  `estado` enum('disponible','adoptado','en_tratamiento','fallecido') DEFAULT 'disponible',
  `id_rescatista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` int(11) NOT NULL,
  `tabla_afectada` varchar(50) NOT NULL,
  `operacion` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `id_registro_afectado` int(11) DEFAULT NULL,
  `datos_anteriores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_anteriores`)),
  `datos_nuevos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_nuevos`)),
  `usuario_sistema` varchar(50) DEFAULT user(),
  `fecha_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientemedico`
--

CREATE TABLE `expedientemedico` (
  `id_expediente` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_veterinaria` int(11) DEFAULT NULL,
  `fecha_consulta` date NOT NULL,
  `diagnostico` text DEFAULT NULL,
  `tratamiento` text DEFAULT NULL,
  `vacunas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vacunas`)),
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimientoadopcion`
--

CREATE TABLE `seguimientoadopcion` (
  `id_seguimiento` int(11) NOT NULL,
  `id_adopcion` int(11) NOT NULL,
  `fecha_seguimiento` date NOT NULL,
  `observaciones` text DEFAULT NULL,
  `estado_seguimiento` enum('bueno','regular','malo') NOT NULL,
  `acta_generada` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id_tipo` int(11) NOT NULL,
  `nombre_tipo` varchar(20) NOT NULL CHECK (`nombre_tipo` in ('rescatista','adoptante','veterinario'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinaria`
--

CREATE TABLE `veterinaria` (
  `id_veterinaria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `latitud` decimal(10,8) DEFAULT NULL,
  `longitud` decimal(11,8) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` enum('activa','inactiva') DEFAULT 'activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD PRIMARY KEY (`id_adopcion`),
  ADD UNIQUE KEY `id_animal` (`id_animal`),
  ADD KEY `id_adoptante` (`id_adoptante`);

--
-- Indices de la tabla `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `id_rescatista` (`id_rescatista`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`);

--
-- Indices de la tabla `expedientemedico`
--
ALTER TABLE `expedientemedico`
  ADD PRIMARY KEY (`id_expediente`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_veterinaria` (`id_veterinaria`);

--
-- Indices de la tabla `seguimientoadopcion`
--
ALTER TABLE `seguimientoadopcion`
  ADD PRIMARY KEY (`id_seguimiento`),
  ADD KEY `id_adopcion` (`id_adopcion`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `nombre_tipo` (`nombre_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `veterinaria`
--
ALTER TABLE `veterinaria`
  ADD PRIMARY KEY (`id_veterinaria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  MODIFY `id_adopcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `animal`
--
ALTER TABLE `animal`
  MODIFY `id_animal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_auditoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expedientemedico`
--
ALTER TABLE `expedientemedico`
  MODIFY `id_expediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seguimientoadopcion`
--
ALTER TABLE `seguimientoadopcion`
  MODIFY `id_seguimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `veterinaria`
--
ALTER TABLE `veterinaria`
  MODIFY `id_veterinaria` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD CONSTRAINT `adopcion_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `adopcion_ibfk_2` FOREIGN KEY (`id_adoptante`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_rescatista`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `expedientemedico`
--
ALTER TABLE `expedientemedico`
  ADD CONSTRAINT `expedientemedico_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`) ON DELETE CASCADE,
  ADD CONSTRAINT `expedientemedico_ibfk_2` FOREIGN KEY (`id_veterinaria`) REFERENCES `veterinaria` (`id_veterinaria`) ON DELETE SET NULL;

--
-- Filtros para la tabla `seguimientoadopcion`
--
ALTER TABLE `seguimientoadopcion`
  ADD CONSTRAINT `seguimientoadopcion_ibfk_1` FOREIGN KEY (`id_adopcion`) REFERENCES `adopcion` (`id_adopcion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipousuario` (`id_tipo`);
--
-- Base de datos: `soportecomputo`
--
CREATE DATABASE IF NOT EXISTS `soportecomputo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `soportecomputo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `id_informe` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_generacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_item` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones`
--

CREATE TABLE `reparaciones` (
  `id_equipo` int(11) NOT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `fecha_reparacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `costos` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id_tecnico` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL,
  `id_tecnico_asignado` int(11) DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_reparacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `informes`
--
ALTER TABLE `informes`
  ADD PRIMARY KEY (`id_informe`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_ticket` (`id_ticket`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_item`);

--
-- Indices de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_ticket` (`id_ticket`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_tecnico_asignado` (`id_tecnico_asignado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `informes`
--
ALTER TABLE `informes`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id_tecnico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `informes`
--
ALTER TABLE `informes`
  ADD CONSTRAINT `informes_ibfk_1` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`),
  ADD CONSTRAINT `informes_ibfk_2` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`);

--
-- Filtros para la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD CONSTRAINT `reparaciones_ibfk_1` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`),
  ADD CONSTRAINT `reparaciones_ibfk_2` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`);

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_tecnico_asignado`) REFERENCES `tecnicos` (`id_tecnico`);
--
-- Base de datos: `soporte_tecnico`
--
CREATE DATABASE IF NOT EXISTS `soporte_tecnico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `soporte_tecnico`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_equipo`
--

CREATE TABLE `categorias_equipo` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias_equipo`
--

INSERT INTO `categorias_equipo` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Laptop', 'Computadoras portátiles de diferentes marcas'),
(2, 'Desktop', 'Computadoras de escritorio'),
(3, 'Servidor', 'Servidores empresariales'),
(4, 'Impresora', 'Equipos de impresión'),
(5, 'Red', 'Equipos de networking'),
(6, 'Periféricos', 'Dispositivos adicionales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `fecha_registro` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `email`, `telefono`, `direccion`, `fecha_registro`) VALUES
(1, 'Ana García', 'ana.garcia@email.com', '600123456', 'Calle Principal 123, Madrid', '2025-10-23'),
(2, 'Carlos López', 'carlos.lopez@email.com', '600234567', 'Avenida Central 45, Barcelona', '2025-10-23'),
(3, 'María Rodríguez', 'maria.rodriguez@email.com', '600345678', 'Plaza Mayor 67, Valencia', '2025-10-23'),
(4, 'Javier Martínez', 'javier.martinez@email.com', '600456789', 'Calle Secundaria 89, Sevilla', '2025-10-23'),
(5, 'Laura Fernández', 'laura.fernandez@email.com', '600567890', 'Avenida Norte 12, Bilbao', '2025-10-23'),
(6, 'David Sánchez', 'david.sanchez@email.com', '600678901', 'Calle Este 34, Málaga', '2025-10-23'),
(7, 'Elena Pérez', 'elena.perez@email.com', '600789012', 'Plaza Sur 56, Zaragoza', '2025-10-23'),
(8, 'Miguel Torres', 'miguel.torres@email.com', '600890123', 'Avenida Oeste 78, Murcia', '2025-10-23'),
(9, 'Sofía Ramírez', 'sofia.ramirez@email.com', '600901234', 'Calle Central 90, Palma', '2025-10-23'),
(10, 'Daniel Castro', 'daniel.castro@email.com', '601012345', 'Paseo Marítimo 23, Las Palmas', '2025-10-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `especialidad`, `email`, `telefono`, `activo`) VALUES
(1, 'Roberto Jiménez', 'Hardware', 'roberto.jimenez@empresa.com', '610123456', 1),
(2, 'Sara Morales', 'Software', 'sara.morales@empresa.com', '610234567', 1),
(3, 'Pablo Ortega', 'Redes', 'pablo.ortega@empresa.com', '610345678', 1),
(4, 'Carmen Vega', 'Base de Datos', 'carmen.vega@empresa.com', '610456789', 1),
(5, 'Alejandro Ruiz', 'Seguridad', 'alejandro.ruiz@empresa.com', '610567890', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `numero_serie` varchar(100) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `garantia_hasta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `id_cliente`, `id_categoria`, `modelo`, `numero_serie`, `fecha_compra`, `garantia_hasta`) VALUES
(1, 1, 1, 'Dell Latitude 5490', 'DL5490XYZ123', '2023-01-15', '2025-01-15'),
(2, 2, 1, 'HP EliteBook 840', 'HP840ABC456', '2023-02-20', '2025-02-20'),
(3, 3, 2, 'Dell OptiPlex 7070', 'DO7070DEF789', '2023-03-10', '2025-03-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes_soporte`
--

CREATE TABLE `informes_soporte` (
  `id_informe` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_informe` enum('Diario','Semanal','Mensual','Anual') DEFAULT NULL,
  `fecha_generacion` datetime DEFAULT current_timestamp(),
  `datos_informe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_informe`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_item` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `stock_minimo` int(11) DEFAULT 5,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_item`, `nombre`, `descripcion`, `categoria`, `stock`, `stock_minimo`, `precio_unitario`, `ubicacion`) VALUES
(1, 'RAM DDR4 8GB', 'Memoria RAM DDR4 8GB 2666MHz', 'Componentes', 25, 5, 45.50, 'Almacen A'),
(2, 'SSD 500GB', 'Disco sólido 500GB SATA', 'Almacenamiento', 15, 3, 89.99, 'Almacen A'),
(3, 'Teclado USB', 'Teclado multimedia USB', 'Periféricos', 30, 10, 25.00, 'Almacen B'),
(4, 'Mouse Inalámbrico', 'Mouse óptico inalámbrico', 'Periféricos', 40, 15, 18.50, 'Almacen B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte_tickets`
--

CREATE TABLE `soporte_tickets` (
  `id_ticket` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `id_empleado_asignado` int(11) DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `prioridad` enum('Baja','Media','Alta','Crítica') DEFAULT 'Media',
  `estado` enum('Abierto','En Progreso','Espera Repuesto','Cerrado') DEFAULT 'Abierto',
  `fecha_apertura` datetime DEFAULT current_timestamp(),
  `fecha_cierre` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `soporte_tickets`
--

INSERT INTO `soporte_tickets` (`id_ticket`, `id_cliente`, `id_equipo`, `id_empleado_asignado`, `titulo`, `descripcion`, `prioridad`, `estado`, `fecha_apertura`, `fecha_cierre`) VALUES
(1, 1, 1, 1, 'Problema de rendimiento', 'La laptop se encuentra muy lenta al ejecutar aplicaciones', 'Media', 'En Progreso', '2025-10-23 12:46:41', NULL),
(2, 2, 2, 2, 'Error de software', 'No inicia el sistema operativo, muestra pantalla azul', 'Alta', 'Abierto', '2025-10-23 12:46:41', NULL),
(3, 3, 3, 3, 'Problema de conexión', 'No se conecta a la red corporativa', 'Media', 'Cerrado', '2025-10-23 12:46:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_detalles`
--

CREATE TABLE `ticket_detalles` (
  `id_detalle` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp(),
  `horas_trabajadas` decimal(4,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ticket_detalles`
--

INSERT INTO `ticket_detalles` (`id_detalle`, `id_ticket`, `id_empleado`, `descripcion`, `fecha_hora`, `horas_trabajadas`) VALUES
(1, 1, 1, 'Diagnóstico inicial: posible falta de memoria RAM', '2025-10-23 12:46:41', 0.50),
(2, 1, 1, 'Instalada memoria RAM adicional - 8GB DDR4', '2025-10-23 12:46:41', 1.00),
(3, 3, 3, 'Configurada conexión de red y actualizados drivers', '2025-10-23 12:46:41', 1.50);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias_equipo`
--
ALTER TABLE `categorias_equipo`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD UNIQUE KEY `numero_serie` (`numero_serie`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `informes_soporte`
--
ALTER TABLE `informes_soporte`
  ADD PRIMARY KEY (`id_informe`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_item`);

--
-- Indices de la tabla `soporte_tickets`
--
ALTER TABLE `soporte_tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_empleado_asignado` (`id_empleado_asignado`);

--
-- Indices de la tabla `ticket_detalles`
--
ALTER TABLE `ticket_detalles`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias_equipo`
--
ALTER TABLE `categorias_equipo`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `informes_soporte`
--
ALTER TABLE `informes_soporte`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `soporte_tickets`
--
ALTER TABLE `soporte_tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ticket_detalles`
--
ALTER TABLE `ticket_detalles`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_equipo` (`id_categoria`);

--
-- Filtros para la tabla `soporte_tickets`
--
ALTER TABLE `soporte_tickets`
  ADD CONSTRAINT `soporte_tickets_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `soporte_tickets_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  ADD CONSTRAINT `soporte_tickets_ibfk_3` FOREIGN KEY (`id_empleado_asignado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `ticket_detalles`
--
ALTER TABLE `ticket_detalles`
  ADD CONSTRAINT `ticket_detalles_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `soporte_tickets` (`id_ticket`),
  ADD CONSTRAINT `ticket_detalles_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tienda2`
--
CREATE DATABASE IF NOT EXISTS `tienda2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_equipo`
--

CREATE TABLE `categoria_equipo` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_equipo`
--

INSERT INTO `categoria_equipo` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Laptop', 'Computadoras portátiles de diferentes marcas'),
(2, 'Desktop', 'Computadoras de escritorio'),
(3, 'Servidor', 'Servidores empresariales'),
(4, 'Impresora', 'Equipos de impresión'),
(5, 'Red', 'Equipos de networking'),
(6, 'Periféricos', 'Dispositivos adicionales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `descuento` decimal(10,0) NOT NULL,
  `tipo` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombre`, `direccion`, `telefono`, `rfc`, `descuento`, `tipo`, `email`) VALUES
(1, 'Susana Oria', 'Naucalpan', 2147483647, 'SUPAVA900424N', 10, 0, 'susanaplata@gmail.com'),
(2, 'Juan Carlos Bodoque', 'Vallejo', 2147483647, 'JUCABR568790A', 15, 0, 'juancarlos@gmail.com'),
(3, 'Obama', 'Wachinton Dece', 57857496, 'OBA9823', 100, 3, 'nueveonce@hotmail.com'),
(4, 'Laura León', 'Nezayork N°09', 550168494, 'TESO9734', 0, 0, 'tesorito@gmail.com'),
(5, 'Kemonito Hernández', 'CDMX La Narvarte N°83', 558974631, 'KECDM2973', 3, 0, 'kemonitostoy@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `fecha_registro` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `email`, `telefono`, `direccion`, `fecha_registro`) VALUES
(1, 'Ana García', 'ana.garcia@email.com', '600123456', 'Calle Principal 123, Madrid', '2025-10-15'),
(2, 'Carlos López', 'carlos.lopez@email.com', '600234567', 'Avenida Central 45, Barcelona', '2025-10-15'),
(3, 'María Rodríguez', 'maria.rodriguez@email.com', '600345678', 'Plaza Mayor 67, Valencia', '2025-10-15'),
(4, 'Javier Martínez', 'javier.martinez@email.com', '600456789', 'Calle Secundaria 89, Sevilla', '2025-10-15'),
(5, 'Laura Fernández', 'laura.fernandez@email.com', '600567890', 'Avenida Norte 12, Bilbao', '2025-10-15'),
(6, 'David Sánchez', 'david.sanchez@email.com', '600678901', 'Calle Este 34, Málaga', '2025-10-15'),
(7, 'Elena Pérez', 'elena.perez@email.com', '600789012', 'Plaza Sur 56, Zaragoza', '2025-10-15'),
(8, 'Miguel Torres', 'miguel.torres@email.com', '600890123', 'Avenida Oeste 78, Murcia', '2025-10-15'),
(9, 'Sofía Ramírez', 'sofia.ramirez@email.com', '600901234', 'Calle Central 90, Palma', '2025-10-15'),
(10, 'Daniel Castro', 'daniel.castro@email.com', '601012345', 'Paseo Marítimo 23, Las Palmas', '2025-10-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idempleado` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `fechanacimiento` date NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(18) NOT NULL,
  `curp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idempleado`, `nombre`, `apellido`, `fechanacimiento`, `direccion`, `telefono`, `curp`) VALUES
(1, 'LUIS', 'MIGUEL', '1999-01-01', 'Atizapan de Zaragoza', '5553974316', 'JECRGA990101A'),
(2, 'JUAN', 'GABRIEL', '2014-03-24', 'Tlalnepantla de Baz', '5692784021', 'HAGOHE140324T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `sku` int(11) NOT NULL,
  `descipcion` text NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `costo` decimal(10,0) NOT NULL,
  `lineaa` int(11) NOT NULL,
  `existencia` decimal(10,0) NOT NULL,
  `caducidad` date NOT NULL,
  `marca` int(11) NOT NULL,
  `provedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `sku`, `descipcion`, `precio`, `costo`, `lineaa`, `existencia`, `caducidad`, `marca`, `provedor`) VALUES
(1, 29876, 'POLLO RANCHERO', 100, 50, 2, 8, '2024-09-16', 2, 2),
(2, 39876, 'COCA COLA CHICA', 20, 16, 3, 25, '2024-08-18', 1, 1),
(3, 457754, 'POLLO ASADO', 90, 50, 4, 58, '2024-11-23', 2, 2),
(4, 345678, 'SPRITE CHICO', 25, 15, 3, 10, '2024-12-18', 1, 1),
(5, 209876, 'FANTA CHICA', 25, 15, 3, 15, '2024-12-25', 1, 1),
(6, 712345, 'PEPSI CHICO', 25, 15, 3, 12, '2025-09-03', 4, 4),
(7, 3019284, 'PEPSI LIGHT CHICA', 25, 15, 3, 12, '2025-04-18', 4, 4),
(8, 930412, 'ORDEN DE PESCUEZITOS', 20, 15, 8, 30, '2025-04-09', 2, 3),
(9, 876512, 'ORDEN DE SALCHICHAS', 20, 15, 9, 30, '2025-10-10', 8, 7),
(10, 619473, 'SPRITE GRANDE', 35, 20, 1, 34, '2025-02-12', 1, 1),
(11, 293749, 'FANTA GRANDE', 35, 20, 1, 25, '2025-06-03', 1, 1),
(12, 585642, 'PEPSI LIGHT GRANDE', 40, 25, 1, 10, '2026-10-16', 4, 4),
(13, 375951, 'PEPSI GRANDE', 40, 20, 1, 28, '2026-10-23', 4, 4),
(14, 963852, 'ORDEN DE ARROZ', 45, 20, 7, 9, '2024-11-24', 5, 5),
(15, 741963, 'PAPAS GRANDES SABRITAS', 40, 35, 5, 7, '2026-10-24', 6, 6),
(16, 963748, 'PAPAS CHICAS SABRITAS', 26, 20, 6, 10, '2026-10-21', 6, 6),
(17, 258735, 'PAPAS GRANDES PAPS', 35, 15, 5, 20, '2024-10-23', 7, 8),
(18, 147042, 'PAPAS CHICAS PAPS', 25, 10, 6, 32, '0000-00-00', 7, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `idlinea` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `linea`
--

INSERT INTO `linea` (`idlinea`, `nombre`) VALUES
(1, 'REFRESCO 1 LITRO'),
(2, 'POLLOS RANCH'),
(3, 'REFRESCOS 600ML\r\n'),
(4, 'POLLO ASADO'),
(5, 'PAPITAS BOLSA 300gr'),
(6, 'PAPITAS BOLSA 180gr'),
(7, 'ARROZ 100gr'),
(8, 'PEZCUECITOS 4pzs'),
(9, 'SALCHICHAS 4pzas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idmarca`, `nombre`) VALUES
(1, 'COCA COLA\r\n'),
(2, 'POLLITO EN FUGA'),
(4, 'PEPSI'),
(5, 'CAMPO DORADO'),
(6, 'SABRITAS'),
(7, 'PAPS'),
(8, 'HAMANTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedor`
--

CREATE TABLE `provedor` (
  `idprovedor` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `direccion` varchar(90) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rfc` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provedor`
--

INSERT INTO `provedor` (`idprovedor`, `nombre`, `direccion`, `telefono`, `email`, `rfc`) VALUES
(1, 'COCA COLA', 'Atizapan de Zaragoza', 2147483647, 'CocaCola@gmail.com', 'COCA010199FGH'),
(2, 'POLLOS EL LEO', 'Tlalnepantla de baz', 2147483647, 'LEOPOLLO@gmail.com', 'LPLLO250312D'),
(3, 'EL COGOTE', 'PASEO DE LAS LOMÁS N°52 COLONIA CENTRO', 55666778, 'elpezcuesito42@gmail.com', 'PEZ2345'),
(4, 'PEPSI', 'COLONIA ZACARIAS FLORES DELCAMPO', 666, 'cocanosaberica81@gmail.com', 'ERREFECE6879'),
(5, 'EL CAMPO VERDE', 'UN CAMPO N°66', 9087653, 'arrozalreves@hotmail.com', 'ARRZ0907'),
(6, 'SABRITAS', 'COLONIA BARCEL N°36', 556728930, 'teamobarcel@gmail.com', 'SBRT6533'),
(7, 'HAMANTA', 'TIZAYORK N°35', 55123456, 'jamontocino@hotmail.com', 'HMAN8634'),
(8, 'DON CHUI', 'LA CONDESA N°47', 5598814, 'noseusargmail@gmial.com', 'CHUI87230');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uusuarios`
--

CREATE TABLE `uusuarios` (
  `id` int(11) NOT NULL,
  `idempleados` int(11) NOT NULL,
  `usuario1` varchar(10) NOT NULL,
  `password1` varchar(12) NOT NULL,
  `nivel1` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `uusuarios`
--

INSERT INTO `uusuarios` (`id`, `idempleados`, `usuario1`, `password1`, `nivel1`, `id_genero`) VALUES
(1, 1, 'LUIS23', '12345', 1, 1),
(2, 1, 'JUANGA', '23456', 1, 1),
(3, 0, 'luis', '12344', 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`idlinea`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idmarca`);

--
-- Indices de la tabla `provedor`
--
ALTER TABLE `provedor`
  ADD PRIMARY KEY (`idprovedor`);

--
-- Indices de la tabla `uusuarios`
--
ALTER TABLE `uusuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `idlinea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idmarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `provedor`
--
ALTER TABLE `provedor`
  MODIFY `idprovedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `uusuarios`
--
ALTER TABLE `uusuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Base de datos: `tienda_autos`
--
CREATE DATABASE IF NOT EXISTS `tienda_autos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda_autos`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
