-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 24 Janvier 2020 à 13:40
-- Version du serveur :  5.7.28-0ubuntu0.18.04.4
-- Version de PHP :  7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nabeilles`
--

-- --------------------------------------------------------

--
-- Structure de la table `plant`
--

CREATE TABLE `plant` (
  `id_plant` int(6) UNSIGNED NOT NULL,
  `latin_name` varchar(30) NOT NULL,
  `french_name` varchar(30) NOT NULL,
  `size` float NOT NULL,
  `definition` varchar(40) NOT NULL,
  `nectar` float DEFAULT NULL,
  `pollen` float DEFAULT NULL,
  `localisation` varchar(30) NOT NULL,
  `picture` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `plant`
--

INSERT INTO `plant` (`id_plant`, `latin_name`, `french_name`, `size`, `definition`, `nectar`, `pollen`, `localisation`, `picture`) VALUES
(1, 'Acer campestris', 'érable champêtre', 15, '', 3, 2, 'collection historique', ''),
(2, 'Acer pseudoplatanus', 'érable sycomore', 25, '', 2, 2, 'forêt', ''),
(3, 'Alnus glutinosa', 'aulne glutineux', 25, '', 1, 2, 'étang', ''),
(4, 'Aquilegia vulgaris', 'ancolie', 0.5, '', 2, 3, 'collection historique', '');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname_user` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `firstname_user`, `pseudo`, `level`) VALUES
(1, 'Jean', 'Aiassez', 'xxAbeillexx', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `plant`
--
ALTER TABLE `plant`
  ADD PRIMARY KEY (`id_plant`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `plant`
--
ALTER TABLE `plant`
  MODIFY `id_plant` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
