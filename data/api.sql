-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 14 déc. 2023 à 15:09
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `api`
--

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `price` float(8,2) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Pull jaune', 200.00, 'Ceci est un super pull jaune', '2023-12-14 13:12:46', '2023-12-14 13:12:46'),
(3, 'Pull violet', 220.00, 'Ceci est un super pull violet', '2023-12-14 13:31:22', '2023-12-14 13:31:22'),
(4, 'Pull orange', 220.00, 'Ceci est un super pull orange', '2023-12-14 13:32:43', '2023-12-14 13:32:43'),
(5, 'Pull rose', 220.00, 'Ceci est un super pull rose', '2023-12-14 13:34:54', '2023-12-14 13:34:54'),
(6, 'Pull gris', 220.00, 'Ceci est un super pull gris', '2023-12-14 13:38:34', '2023-12-14 13:38:34'),
(7, 'Pull vert', 220.00, 'Ceci est un super pull vert', '2023-12-14 13:39:42', '2023-12-14 13:39:42'),
(8, 'Pull vert', 220.00, 'Ceci est un super pull vert', '2023-12-14 13:39:57', '2023-12-14 13:39:57'),
(9, 'Pull vert', 220.00, 'Ceci est un super pull vert', '2023-12-14 13:40:51', '2023-12-14 13:40:51'),
(10, 'Pull marron', 220.00, 'Ceci est un super pull marron', '2023-12-14 13:52:57', '2023-12-14 13:52:57'),
(11, 'Pull marron', 220.00, 'Ceci est un super pull marron', '2023-12-14 13:53:19', '2023-12-14 13:53:19'),
(12, 'Pull marron', 220.00, 'Ceci est un super pull marron', '2023-12-14 13:54:23', '2023-12-14 13:54:23'),
(13, 'Pull marron', 220.00, 'Ceci est un super pull marron', '2023-12-14 13:55:22', '2023-12-14 13:55:22'),
(14, 'Pull magenta', 220.00, 'Ceci est un super pull magenta', '2023-12-14 14:20:18', '2023-12-14 14:20:18'),
(15, 'Pull cyan', 220.00, 'Ceci est un super pull cyan', '2023-12-14 14:20:37', '2023-12-14 14:20:37');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `hash`, `created_at`, `updated_at`) VALUES
(1, 'Cherif B', 'cherifb@hotmail.com', '$2b$10$Y1UcZaKv7wf.km6XirOGKOsxkRFVWyP.PNjPq8m4E4wGLzfL5.aKK', '2023-12-14 14:26:25', '2023-12-14 14:26:25'),
(3, 'Cherif B', 'cherifbellah@hotmail.com', '$2b$10$xPZW9PQuhLMcywJ9ZwPhyuC4nS.5j5uQym/X0JYfdpqliVmz1vWKq', '2023-12-14 14:40:45', '2023-12-14 14:40:45');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
