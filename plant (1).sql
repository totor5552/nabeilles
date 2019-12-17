-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2019 at 12:05 AM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Nabeilles`
--

-- --------------------------------------------------------

--
-- Table structure for table `plant`
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
-- Dumping data for table `plant`
--

INSERT INTO `plant` (`id_plant`, `latin_name`, `french_name`, `size`, `definition`, `nectar`, `pollen`, `localisation`, `picture`) VALUES
(1, 'Acer campestris', 'érable champêtre', 15, '', 3, 2, 'collection historique', ''),
(2, 'Acer pseudoplatanus', 'érable sycomore', 25, '', 2, 2, 'forêt', ''),
(3, 'Alnus glutinosa', 'aulne glutineux', 25, '', 1, 2, 'étang', ''),
(4, 'Aquilegia vulgaris', 'ancolie', 0.5, '', 2, 3, 'collection historique', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `plant`
--
ALTER TABLE `plant`
  ADD PRIMARY KEY (`id_plant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `plant`
--
ALTER TABLE `plant`
  MODIFY `id_plant` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
