-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2024 a las 23:48:12
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
-- Base de datos: `taskapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(2, '2024-10-04-224103', 'App\\Database\\Migrations\\CreateTask', 'default', 'App', 1728085301, 1),
(4, '2024-10-04-114500', 'App\\Database\\Migrations\\AddTimestampsToTask', 'default', 'App', 1728315300, 2),
(5, '2024-10-08-005824', 'App\\Database\\Migrations\\CreateUser', 'default', 'App', 1728349932, 3),
(6, '2024-10-08-013448', 'App\\Database\\Migrations\\CreateUser', 'default', 'App', 1728351391, 4),
(7, '2024-10-09-041011', 'App\\Database\\Migrations\\AddUserIdToTask', 'default', 'App', 1728447839, 5),
(8, '2024-10-09-190955', 'App\\Database\\Migrations\\AddIndexToTaskCreatedAt', 'default', 'App', 1728501557, 6),
(9, '2024-10-10-003953', 'App\\Database\\Migrations\\AddIsAdminToUser', 'default', 'App', 1728521060, 7),
(10, '2024-10-10-051516', 'App\\Database\\Migrations\\AddAccountActivationToUser', 'default', 'App', 1728537347, 8),
(11, '2024-10-14-185222', 'App\\Database\\Migrations\\AddPasswordResetToUser', 'default', 'App', 1728933090, 9),
(12, '2024-10-15-034858', 'App\\Database\\Migrations\\AddProfileImageToUser', 'default', 'App', 1728964169, 10),
(13, '2024-10-15-210608', 'App\\Database\\Migrations\\CreateRememberedLogin', 'default', 'App', 1729026752, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remembered_login`
--

CREATE TABLE `remembered_login` (
  `token_hash` varchar(64) NOT NULL,
  `user_id` int(5) UNSIGNED NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE `task` (
  `id` int(5) UNSIGNED NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `task`
--

INSERT INTO `task` (`id`, `description`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Task one ', NULL, NULL, 6),
(2, 'This task', NULL, NULL, 6),
(3, 'Another task', NULL, NULL, 6),
(4, '', NULL, NULL, 6),
(5, 'An important task', NULL, NULL, 6),
(7, 'An interesting task', NULL, NULL, 6),
(9, '<em>XSS?</em>', NULL, NULL, 6),
(10, 'To do today urgently', NULL, NULL, 6),
(11, 'A task with timestamps edited', '2024-10-08 19:44:53', '2024-10-08 19:45:29', 6),
(12, 'something interesting', '2024-10-09 03:43:42', '2024-10-09 03:43:42', 6),
(13, 'A new task', '2024-10-09 07:57:29', '2024-10-09 07:57:29', NULL),
(14, 'A fun task changed', '2024-10-09 08:02:28', '2024-10-09 08:09:30', 6),
(15, 'Urgent task now', '2024-10-09 08:15:15', '2024-10-16 17:16:01', 6),
(17, 'Here is another task', '2024-10-16 07:22:55', '2024-10-16 07:22:55', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `activation_hash` varchar(64) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `reset_hash` varchar(64) DEFAULT NULL,
  `reset_expires_at` datetime DEFAULT NULL,
  `profile_image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`, `is_admin`, `activation_hash`, `is_active`, `reset_hash`, `reset_expires_at`, `profile_image`) VALUES
(1, 'David', 'dave@example.com', '', '2024-10-08 03:03:59', '2024-10-10 04:48:25', 0, NULL, 0, NULL, NULL, NULL),
(6, 'Mary', 'mary@example.com', '$2y$10$1adHY/KHdj9/7kLswMyKcu6Tmipu2HTmuxGgvl5qcFnQijabtDZJq', '2024-10-08 05:53:22', '2024-10-17 01:19:50', 1, NULL, 1, NULL, NULL, '1729127866_857b1de075d10a88fcad.png'),
(12, 'Alice', 'alice@example.com', '$2y$10$FBCkcFkQ8fnWwqps2WGkRulxJgI4DqQXk4jx.BYPyiD.xPRfvuBq2', '2024-10-08 05:05:14', '2024-10-17 21:20:14', 0, NULL, 1, NULL, NULL, NULL),
(20, 'johann', 'johann@example.com', '$2y$10$Wb779B5lcMoayobyfLONXeJLOPJ6Vw3B4WbntOZw/FmhWA8tT3kd2', '2024-10-10 01:45:27', '2024-10-10 01:45:27', 0, NULL, 0, NULL, NULL, NULL),
(21, 'Admin', 'admin@example.com', '$2y$10$EFGHnGTDB9cMSiFG2F2jsOP7/fd45v7dQ.WiIqBjIKi.y4VO/yzu6', '2024-10-10 01:50:07', '2024-10-17 20:14:59', 1, NULL, 1, '16bf3434062dc1dc13067ff5ebb380fa03caeff29b5852e23d77b103d10728f9', '2024-10-17 22:09:09', '1729196099_9927597a203aab0c001f.jpg'),
(22, 'Another admin', 'admin2@example.com', '$2y$10$cmZN7FmN.Fpgl2mM/8/wNuJuawLMeHoto4PccXpB48iiDYUWy8dGu', '2024-10-10 04:05:46', '2024-10-10 04:05:46', 0, NULL, 0, NULL, NULL, NULL),
(23, 'Yet another admin', 'admin3@example.com', '$2y$10$BGGVmhGwgsJm424EjroqN.TfpNH/OYRppV3ngosA9RxkTyKEA1iyK', '2024-10-10 04:13:03', '2024-10-10 04:13:03', 1, NULL, 0, NULL, NULL, NULL),
(24, 'Emily', 'emily@example.com', '$2y$10$tlAApYxns2clxK2pTRzYfONRASzDfACWKO2XibaEIx8SQaq3VHX5i', '2024-10-10 06:20:23', '2024-10-10 06:20:23', 0, '650c03e530f2fc87773cb4b942649ad3a9f2075cf879166183960e6fc6c56909', 1, NULL, NULL, NULL),
(26, 'jairo', 'notzjairo@gmail.com', '$2y$10$3pp53G56Je5CmpgR9LqaPuph6E4ltQjplSBwONWk7ToozxE18f9Zy', '2024-10-14 07:23:56', '2024-10-16 21:29:02', 0, NULL, 1, NULL, NULL, '1729021437_b0837b1ddebedbc45dc8.png'),
(27, 'And another admin', 'admin4@example.com', '$2y$10$Bx2Jk64Fug0KgJjIxuq9xOVBHN4B3aCpBmNxDPGs0B.E6.v5e0.Su', '2024-10-14 08:37:33', '2024-10-14 08:37:52', 0, NULL, 0, NULL, NULL, NULL),
(28, 'david', 'david@example.com', '$2y$10$2GCYxpTb1/f5jYNSorVW6e4MmoiIUjvgssZdQFjJ/nWa9btaVlWES', '2024-10-16 21:00:11', '2024-10-16 21:00:11', 0, '8e3f89d2df1c57a7302f1a695af0f38c33d53d1f8d54831836b79a3a4b581c48', 0, NULL, NULL, NULL),
(29, 'josue', 'josueranos1527@gmail.com', '$2y$10$s8dQEH6D4IVSo8hV049XM.bdclDb6W7PuXiyFGNhfnHdawBUi6/ga', '2024-10-17 00:21:29', '2024-10-17 18:41:02', 0, NULL, 1, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD PRIMARY KEY (`token_hash`),
  ADD KEY `remembered_login_user_id_foreign` (`user_id`),
  ADD KEY `expires_at` (`expires_at`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_user_id_fk` (`user_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `activation_hash` (`activation_hash`),
  ADD UNIQUE KEY `reset_hash` (`reset_hash`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `task`
--
ALTER TABLE `task`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD CONSTRAINT `remembered_login_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
