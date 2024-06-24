-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2024 a las 01:00:34
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
-- Base de datos: `wtt2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion_equipos`
--

CREATE TABLE `distribucion_equipos` (
  `id_registro` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `fecha_distribucion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `numero_serie` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `ubicacion` enum('almacen_softteam','tienda') NOT NULL DEFAULT 'almacen_softteam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `nombre`, `tipo`, `numero_serie`, `estado`, `ubicacion`) VALUES
(1, 'Sigueqq', 'Funqq', 'cioqq', 'nandoqq', 'tienda'),
(2, 'Equipo 2', 'Tipo 2', 'NS-002', 'Inactivo', 'tienda'),
(3, 'Equipo 3', 'Tipo 3', 'NS-003', 'Activo', 'almacen_softteam'),
(4, 'Equipo 4', 'Tipo 4', 'NS-004', 'Inactivo', 'tienda'),
(5, 'Equipo 5', 'Tipo 5', 'Cambie eto', 'Activo', 'almacen_softteam'),
(6, 'Equipo 6', 'Tipo 6', 'NS-006', 'Inactivo', 'tienda'),
(7, 'Equipo 7', 'Tipo 7', 'NS-007', 'Activo', 'almacen_softteam'),
(8, 'Equipo 8', 'Tipo 8', 'NS-008', 'Inactivo', 'tienda'),
(9, 'Equipo 9', 'Tipo 9', 'NS-009', 'Activo', 'almacen_softteam'),
(10, 'Equipo 10', 'Tipo 10', 'NS-010', 'Inactivo', 'tienda'),
(11, 'Equipo 11', 'Tipo 11', 'NS-011', 'Activo', 'almacen_softteam'),
(12, 'Equipo 12', 'Tipo 12', 'NS-012', 'Inactivo', 'tienda'),
(13, 'Equipo 13', 'Tipo 13', 'NS-013', 'Activo', 'almacen_softteam'),
(14, 'Equipo 14', 'Tipo 14', 'NS-014', 'Inactivo', 'tienda'),
(15, 'Equipo 17', 'Tipo 17', 'NS-014', 'Inactivo', 'tienda'),
(16, 'FuncionaAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 'Equipo', 'Cambie eto', 'asd', 'tienda'),
(17, 'Funciona', 'Equipo', 'Cambie eto', 'asd', 'almacen_softteam'),
(18, 'asd', 'asd', 'asd', 'asd', 'almacen_softteam');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_08_054815_create_distribucion_equipos_table', 2),
(6, '2024_04_08_054815_create_equipos_table', 2),
(7, '2024_04_08_054815_create_ticket_mantenimiento_table', 2),
(8, '2024_04_08_054815_create_tiendas_equipos_table', 2),
(9, '2024_04_08_054815_create_tiendas_table', 2),
(10, '2024_04_08_054818_add_foreign_keys_to_distribucion_equipos_table', 2),
(11, '2024_04_08_054818_add_foreign_keys_to_tiendas_equipos_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 31, 'main', 'e8343fba9fcd6a200ac3c0f75664978b5c481509d1323fbffb3924ab4a918d01', '[\"*\"]', '2024-04-08 13:00:13', NULL, '2024-04-08 12:59:13', '2024-04-08 13:00:13'),
(4, 'App\\Models\\User', 32, 'main', '30f9b5c348004a7701536a280356c9787c070c18bc907e3a8751e7cf356dbdc5', '[\"*\"]', '2024-04-08 22:24:15', NULL, '2024-04-08 22:24:08', '2024-04-08 22:24:15'),
(5, 'App\\Models\\User', 32, 'main', 'cb2f06efecd477e4455476007dc68ced8e554f38811be8505bd43c0c1e57cda0', '[\"*\"]', NULL, NULL, '2024-04-08 22:24:12', '2024-04-08 22:24:12'),
(6, 'App\\Models\\User', 32, 'main', '2c3fc7af2df06d7f9811fa98fa5e0737f0e7d814d6111d858ab5647b3ced382f', '[\"*\"]', NULL, NULL, '2024-04-08 22:24:12', '2024-04-08 22:24:12'),
(7, 'App\\Models\\User', 32, 'main', 'b1b40bc30f45f0dbdabe6dc0177ac7d9bdcce8cda87981557c332d2d707d1578', '[\"*\"]', NULL, NULL, '2024-04-08 22:24:12', '2024-04-08 22:24:12'),
(8, 'App\\Models\\User', 32, 'main', '470c3bca393b49b90eee8fee05afb7ee2e1b6f6cb74a8c5097e514903035e4f5', '[\"*\"]', NULL, NULL, '2024-04-08 22:24:13', '2024-04-08 22:24:13'),
(13, 'App\\Models\\User', 32, 'main', 'e85f069af1d1e45782b49a90855a8b632b9e8aca8d82b6a225fc36752a291be7', '[\"*\"]', '2024-04-09 03:47:18', NULL, '2024-04-09 03:47:12', '2024-04-09 03:47:18'),
(14, 'App\\Models\\User', 32, 'main', 'fbe5022392830d846b42d8db5662624c6a06806110ba5698913b42fa5f6b483b', '[\"*\"]', NULL, NULL, '2024-04-09 03:47:16', '2024-04-09 03:47:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_mantenimiento`
--

CREATE TABLE `ticket_mantenimiento` (
  `id_ticket` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id_tienda` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`id_tienda`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Ara 1234', 'ADASD', '8008135'),
(2, 'Tienda B', 'Dirección B1', '2345678901'),
(3, 'Tienda C', 'Dirección C1', '3456789012'),
(4, 'Tienda D', 'Dirección D1', '4567890123'),
(5, 'Tienda E', 'Dirección E1', '5678901234'),
(6, 'Tienda F', 'Dirección F1', '6789012345'),
(7, 'Tienda G', 'Dirección G1', '7890123456'),
(8, 'Tienda H', 'Dirección H1', '8901234567'),
(9, 'Tienda I', 'Dirección I1', '9012345678'),
(10, 'Tienda J', 'Dirección J1', '0123456789'),
(11, 'Tienda K', 'Dirección K1', '1234567890'),
(12, 'Tienda L', 'Dirección L1', '2345678901'),
(13, 'Tienda M', 'Dirección M1', '3456789012'),
(14, 'Tienda N', 'Dirección N1', '4567890123'),
(15, 'Tienda O', 'Dirección O1', '5678901234'),
(16, 'ARA 1050', 'DASDAS', 'ASDASD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas_equipos`
--

CREATE TABLE `tiendas_equipos` (
  `id_tienda` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hellen Predovic II', 'wbahringer@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aGOTlBN3yG', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(2, 'Miss Madelyn West', 'blindgren@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pPHtNLzwgt', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(3, 'Ms. Addie Kertzmann PhD', 'brisa.anderson@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lu2IUauEOm', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(4, 'Dr. Karl Collins IV', 'chet33@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'h1XPZSzfcv', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(5, 'Mike Mueller III', 'thelma.kemmer@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Vwpf3tNUkl', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(6, 'Kiel Abshire', 'schiller.dion@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rf5dQizgbO', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(7, 'Prof. Cicero Brown Sr.', 'lebsack.baron@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Okm99DAdxt', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(8, 'Annabell Jacobson', 'nestor06@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oMyQfANqck', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(9, 'Pierre Jacobson', 'zrath@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bLxgWIt1Jv', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(10, 'Reanna Abernathy V', 'eliane64@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gTsEsKcxmU', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(11, 'Prof. Nathanial Prosacco', 'amari.jast@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8pRu6XJX8f', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(12, 'Billy Hessel', 'elbert.howe@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DG5K0qLK2L', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(13, 'Brant Stehr', 'novella.gutkowski@example.com', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4oxqpzswtb', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(14, 'Willy Senger II', 'larue72@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'K4yYiJJ2L2', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(15, 'Ms. Hope Lindgren IV', 'mlittel@example.com', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VwcXfLdAG6', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(16, 'Rahsaan Jones V', 'curt.feest@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YpoKiaqhyz', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(17, 'Reyes Bins', 'concepcion.harris@example.com', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6lU9PTpeR6', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(18, 'Keyon Blanda', 'adelle.anderson@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rLDl7wJZIO', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(19, 'Jayme Murazik', 'madison.gislason@example.com', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'src60l9Uzh', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(20, 'Dr. Tremaine Streich', 'mjacobson@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ThtNTRc5Pj', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(21, 'Stan Cronin II', 'robb74@example.com', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oDTpM8HIJO', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(22, 'Cordie Kertzmann', 'schmidt.clemens@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gMvCXxrkuK', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(23, 'Dr. Zaria Dooley III', 'rolfson.pamela@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'w8dPuSmTs1', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(24, 'Mrs. Karlie Ratke', 'mayert.gunner@example.com', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ea7tBfrmCv', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(25, 'Earline Schroeder', 'oral40@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tJD0yFPjba', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(26, 'Oda Schimmel', 'ernest.wehner@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Rl7D3VOC6k', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(27, 'Beth Gerhold', 'brendon37@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'z8V1kr3lMi', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(28, 'Katherine Halvorson', 'samir.kris@example.org', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KgRHuj7w9k', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(29, 'Ludie Muller', 'gerlach.kaci@example.net', '2024-04-08 12:40:01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '474DtJjXM0', '2024-04-08 12:40:01', '2024-04-08 12:40:01'),
(32, 'tom', 'tom@gmail.com', NULL, '$2y$10$depfzsR/1ImSXXgqfrfeg.UHz5DtmbwFwLpAlw8p23JGoRy8J2H7W', NULL, '2024-04-08 13:02:35', '2024-04-08 13:02:35'),
(33, 'assur', 'assur@gmail.com', NULL, '$2y$10$YR3rw/flt0cdp./OvbvSoOHuDlAHf/9KBMCjjn7/LZPxed2FJ4sXu', NULL, '2024-04-09 03:40:57', '2024-04-09 03:40:57'),
(34, 'lance', 'lance@gmail.com', NULL, '$2y$10$IFaDXicfi8GVxptR/dZmgumRN4TD5gsnVMQ3Xbqwe8/e6dpdXxzg.', NULL, '2024-04-09 03:45:19', '2024-04-09 03:45:19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `distribucion_equipos`
--
ALTER TABLE `distribucion_equipos`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `distribucion_equipos_ibfk_1` (`id_equipo`),
  ADD KEY `distribucion_equipos_ibfk_2` (`id_tienda`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id_tienda`);

--
-- Indices de la tabla `tiendas_equipos`
--
ALTER TABLE `tiendas_equipos`
  ADD PRIMARY KEY (`id_tienda`,`id_equipo`),
  ADD KEY `tiendas_equipos_ibfk_2` (`id_equipo`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id_tienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `distribucion_equipos`
--
ALTER TABLE `distribucion_equipos`
  ADD CONSTRAINT `distribucion_equipos_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  ADD CONSTRAINT `distribucion_equipos_ibfk_2` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`);

--
-- Filtros para la tabla `tiendas_equipos`
--
ALTER TABLE `tiendas_equipos`
  ADD CONSTRAINT `tiendas_equipos_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id_tienda`),
  ADD CONSTRAINT `tiendas_equipos_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
