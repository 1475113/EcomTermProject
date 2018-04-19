-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2018 at 04:59 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `carlisting`
--

CREATE TABLE `carlisting` (
  `CarListingId` int(11) NOT NULL,
  `CarMake` varchar(50) NOT NULL,
  `CarModel` varchar(50) NOT NULL,
  `CarTrim` varchar(50) NOT NULL,
  `CarYear` int(11) NOT NULL,
  `PostDate` date NOT NULL,
  `Description` mediumtext NOT NULL,
  `LoginId` int(11) NOT NULL,
  `Mileage` int(11) NOT NULL,
  `Price` decimal(15,2) NOT NULL,
  `ImageId` int(11) DEFAULT NULL,
  `RegionId` int(11) NOT NULL,
  `Views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carlisting`
--
ALTER TABLE `carlisting`
  ADD PRIMARY KEY (`CarListingId`),
  ADD KEY `FK_CarListings_ToLogin` (`LoginId`),
  ADD KEY `FK_CarListings_ToRegion` (`RegionId`),
  ADD KEY `FK_CarListings_ToImage` (`ImageId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carlisting`
--
ALTER TABLE `carlisting`
  MODIFY `CarListingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `carlisting`
--
ALTER TABLE `carlisting`
  ADD CONSTRAINT `FK_CarListings_ToImage` FOREIGN KEY (`ImageId`) REFERENCES `image` (`ImageId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CarListings_ToLogin` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CarListings_ToRegion` FOREIGN KEY (`RegionId`) REFERENCES `region` (`RegionId`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
