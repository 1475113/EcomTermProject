-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2018 at 05:56 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cartrader`
--

-- --------------------------------------------------------

--
-- Table structure for table `carpartlisting`
--

CREATE TABLE `carpartlisting` (
  `CarPartListingId` int(11) NOT NULL,
  `PostDate` date NOT NULL,
  `Description` mediumtext NOT NULL,
  `LoginId` int(11) NOT NULL,
  `Price` decimal(15,2) NOT NULL,
  `ImageId` int(11) DEFAULT NULL,
  `RegionId` int(11) NOT NULL,
  `Views` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carpartlisting`
--

INSERT INTO `carpartlisting` (`CarPartListingId`, `PostDate`, `Description`, `LoginId`, `Price`, `ImageId`, `RegionId`, `Views`) VALUES
(22, '2018-05-10', 'asdddd', 4, '12312.00', 22, 1, 0),
(23, '2018-05-10', 'asdddd', 4, '12312.00', 23, 1, 0),
(24, '2018-05-10', 'asdddd', 4, '12312.00', 24, 1, 0),
(25, '2018-05-10', 'asdddd', 4, '12312.00', 25, 1, 0),
(26, '2018-05-10', 'asdddd', 4, '12312.00', 26, 1, 0),
(27, '2018-05-10', 'asdddd', 4, '12312.00', 27, 1, 0),
(28, '2018-05-10', 'asdddd', 4, '12312.00', 28, 1, 0),
(29, '2018-05-10', 'asdddd', 4, '12312.00', 29, 1, 0),
(30, '2018-05-10', 'asdddd', 4, '12312.00', 30, 1, 0),
(31, '2018-05-10', 'asdddd', 4, '12312.00', 31, 1, 0),
(32, '2018-05-10', 'asdddd', 4, '12312.00', 32, 1, 0),
(33, '2018-05-10', 'asdddd', 4, '12312.00', 33, 1, 0),
(34, '2018-05-10', 'asdddd', 4, '12312.00', NULL, 1, 0),
(35, '2018-05-10', 'asdddd', 4, '12312.00', NULL, 1, 0),
(36, '2018-05-10', 'asdddd', 4, '12312.00', NULL, 1, 0),
(37, '2018-05-10', 'asdddd', 4, '12312.00', NULL, 1, 0),
(38, '2018-05-10', 'asdddd', 4, '12312.00', NULL, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carpartlisting`
--
ALTER TABLE `carpartlisting`
  ADD PRIMARY KEY (`CarPartListingId`),
  ADD KEY `FK_CarPartListings_ToLogin` (`LoginId`),
  ADD KEY `FK_CarPartListings_ToRegion` (`RegionId`),
  ADD KEY `FK_CarPartListings_ToImagepart` (`ImageId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carpartlisting`
--
ALTER TABLE `carpartlisting`
  MODIFY `CarPartListingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `carpartlisting`
--
ALTER TABLE `carpartlisting`
  ADD CONSTRAINT `FK_CarPartListings_ToImagepart` FOREIGN KEY (`ImageId`) REFERENCES `imagepart` (`ImageId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CarPartListings_ToLogin` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CarPartListings_ToRegion` FOREIGN KEY (`RegionId`) REFERENCES `region` (`RegionId`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
