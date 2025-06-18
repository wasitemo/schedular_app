-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2025 at 12:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `idtask` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `categoryname` varchar(50) DEFAULT NULL,
  `membername` varchar(50) DEFAULT NULL,
  `taskname` varchar(50) DEFAULT NULL,
  `frequency` enum('everyday','everyweek','everymonth','everyyear') DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `selectdate` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`idtask`, `userid`, `categoryname`, `membername`, `taskname`, `frequency`, `period`, `selectdate`, `time`) VALUES
(1, 4, 'belanja', 'minatoyukina', 'task_name', 'everyday', 1, '2024-02-03', '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `token`) VALUES
(1, 'kousakareina', 'kousakareina@gmail.com', '$2y$10$qWLXUksP.bHCk9WYOSvZqebAID6HY9F.SadzVVwiITkN.AURb0SMS', NULL),
(2, 'horikitasuzune', 'horikitasuzune@gmail.com', '$2y$10$vsjte6kihlTdACWHC7teJuE9c.Oxv6joYxGoqKz.scJ//8wYd52xy', NULL),
(3, 'inouetakina', 'inouetakina@gmail.com', '$2y$10$8O23t9chDEOhSluN3Q2ouO10GJ7/LPZuLGvnBlaRh7eadNYJzWjQm', NULL),
(4, 'minatoyukina', 'minatoyukina@gmail.com', '$2y$10$0c5gFxMOHj9dN1E/tgkadO4wvypS53xG9xQ/goSJRfxF4wF7Z7Ew6', '71eab3f4398d26759c63e136a9f19579');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`idtask`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `idtask` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
