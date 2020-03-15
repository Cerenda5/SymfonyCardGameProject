-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 15 mars 2020 à 10:58
-- Version du serveur :  5.7.24
-- Version de PHP :  7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `unnomfun`
--

-- --------------------------------------------------------

--
-- Structure de la table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) DEFAULT NULL,
  `faction_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attack` int(11) NOT NULL,
  `life` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_161498D361220EA6` (`creator_id`),
  KEY `IDX_161498D34448F8DA` (`faction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `card`
--

INSERT INTO `card` (`id`, `creator_id`, `faction_id`, `name`, `attack`, `life`, `image`) VALUES
(22, NULL, 1, 'Ipssi', 2, 3, 'card-5e62736ab3b80.png'),
(23, NULL, 1, 'Linda Dogan', 2, 2, 'card-5e6274af8b6e9.png'),
(24, NULL, 1, 'Linda Dogan', 2, 2, 'card-5e6274b071f7a.png');

-- --------------------------------------------------------

--
-- Structure de la table `faction`
--

DROP TABLE IF EXISTS `faction`;
CREATE TABLE IF NOT EXISTS `faction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faction_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `faction`
--

INSERT INTO `faction` (`id`, `faction_name`) VALUES
(1, 'Elfe'),
(3, 'Titans'),
(4, 'Mongole'),
(5, 'GranDadais');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200304140640', '2020-03-04 14:14:24'),
('20200305130112', '2020-03-05 13:01:45'),
('20200306154213', '2020-03-06 15:42:30');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'linda.dogan@outlook.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$dU1YRUlHZzBrQlVEbVI3dw$llrUg0em66jclI2UULGtxursjRpsxIyfOyPS0P/PDcY'),
(2, 'linda.lala@outlook.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Qk5rREpzZ3p5dHZwUnJXMA$QXtdaFV9CiOGXUZ2Ix4JpCdpzNVxbsV+9ybOWVaBB0M'),
(3, 'gg@ll.kd', '[]', '$argon2id$v=19$m=65536,t=4,p=1$S2VhYUt3MjU2U2VMcEhJZw$Sv6YsblLyr7ZfgWHGdxjmhO67WjhTU9XAvNnFH8bJVg'),
(4, 'prout@outlook.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$dTA1OGVpR3liUFNFU05GQQ$10JxV1uiUCbvMQgpSiyM81A0VkZzQGYWwHMSUwMuH94'),
(5, 'loli@ldei.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$cmNEOC5lVlFNZExDRGM0cA$1DhDGK5IUmqFxtxlOf7RolMO9HVlgMQAZdHARuMsUCQ'),
(6, 'dada@outlook.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Q20zZGM1WWU0STVsVmlHMQ$TA/Dyzz0ZKM6G4MhZP6lHGHRkB7XV5Zphw/xXI4jfLw');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `FK_161498D34448F8DA` FOREIGN KEY (`faction_id`) REFERENCES `faction` (`id`),
  ADD CONSTRAINT `FK_161498D361220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
