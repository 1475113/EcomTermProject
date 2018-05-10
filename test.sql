-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2018 at 05:02 PM
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
-- Table structure for table `businessprofile`
--

CREATE TABLE `businessprofile` (
  `BusinessProfileId` int(11) NOT NULL,
  `LoginId` int(11) NOT NULL,
  `BusinessName` varchar(50) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `RatingCounter` int(11) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Postal` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `CommentId` int(11) NOT NULL,
  `LoginId` int(11) NOT NULL,
  `Comment` mediumtext NOT NULL,
  `ListingId` int(11) DEFAULT NULL,
  `PartListingId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `ImageId` int(11) NOT NULL,
  `ListingId` int(11) NOT NULL,
  `ImageURL` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `imagepart` (
  `ImageId` int(11) NOT NULL,
  `ListingId` int(11) NOT NULL,
  `ImageURL` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `MessageId` int(11) NOT NULL,
  `SenderLoginId` int(11) NOT NULL,
  `ReceiverLoginId` int(11) NOT NULL,
  `Message` mediumtext NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `LoginId` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` mediumtext NOT NULL,
  `Status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `ProfileId` int(11) NOT NULL,
  `LoginId` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `RegionId` int(11) NOT NULL,
  `RegionName` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `WishlistId` int(11) NOT NULL,
  `ListingId` int(11) DEFAULT NULL,
  `PartListingId` int(11) DEFAULT NULL,
  `CarMake` varchar(50) NOT NULL,
  `CarModel` varchar(50) NOT NULL,
  `CarTrim` varchar(50) NOT NULL,
  `CarYear` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businessprofile`
--
ALTER TABLE `businessprofile`
  ADD PRIMARY KEY (`BusinessProfileId`),
  ADD KEY `FK_BusinessProfileId_ToLogin` (`LoginId`);

--
-- Indexes for table `carlisting`
--
ALTER TABLE `carlisting`
  ADD PRIMARY KEY (`CarListingId`),
  ADD KEY `FK_CarListings_ToLogin` (`LoginId`),
  ADD KEY `FK_CarListings_ToRegion` (`RegionId`),
  ADD KEY `FK_CarListings_ToImage` (`ImageId`);

--
-- Indexes for table `carpartlisting`
--
ALTER TABLE `carpartlisting`
  ADD PRIMARY KEY (`CarPartListingId`),
  ADD KEY `FK_CarPartListings_ToLogin` (`LoginId`),
  ADD KEY `FK_CarPartListings_ToRegion` (`RegionId`),
  ADD KEY `FK_CarPartListings_ToImagepart` (`ImageId`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentId`),
  ADD KEY `FK_Comments_ToCarPartListing` (`PartListingId`),
  ADD KEY `FK_Comments_ToCarListing` (`ListingId`),
  ADD KEY `FK_Comments_ToLogin` (`LoginId`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ImageId`);

ALTER TABLE `imagepart`
  ADD PRIMARY KEY (`ImageId`);
--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`MessageId`),
  ADD KEY `FK_Table_ReceiverLogin` (`ReceiverLoginId`),
  ADD KEY `FK_Table_SenderLogin` (`SenderLoginId`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`LoginId`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Username_2` (`Username`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`ProfileId`),
  ADD KEY `FK_Profile_Login` (`LoginId`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`RegionId`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`WishlistId`),
  ADD KEY `FK_Wishlist_ToCarPartListing` (`PartListingId`),
  ADD KEY `FK_Wishlist_ToCarListing` (`ListingId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businessprofile`
--
ALTER TABLE `businessprofile`
  MODIFY `BusinessProfileId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `carlisting`
--
ALTER TABLE `carlisting`
  MODIFY `CarListingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `carpartlisting`
--
ALTER TABLE `carpartlisting`
  MODIFY `CarPartListingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `ImageId` int(11) NOT NULL AUTO_INCREMENT;
  
  ALTER TABLE `imagepart`
  MODIFY `ImageId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `MessageId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `LoginId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `ProfileId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `RegionId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `WishlistId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `businessprofile`
--
ALTER TABLE `businessprofile`
  ADD CONSTRAINT `FK_BusinessProfileId_ToLogin` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE;

--
-- Constraints for table `carlisting`
--
ALTER TABLE `carlisting`
  ADD CONSTRAINT `FK_CarListings_ToImage` FOREIGN KEY (`ImageId`) REFERENCES `image` (`ImageId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CarListings_ToLogin` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CarListings_ToRegion` FOREIGN KEY (`RegionId`) REFERENCES `region` (`RegionId`) ON DELETE CASCADE;

--
-- Constraints for table `carpartlisting`
--
ALTER TABLE `carpartlisting`
  ADD CONSTRAINT `FK_CarPartListings_ToImage` FOREIGN KEY (`ImageId`) REFERENCES `image` (`ImageId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CarPartListings_ToLogin` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CarPartListings_ToRegion` FOREIGN KEY (`RegionId`) REFERENCES `region` (`RegionId`) ON DELETE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_Comments_ToCarListing` FOREIGN KEY (`ListingId`) REFERENCES `carlisting` (`CarListingId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Comments_ToCarPartListing` FOREIGN KEY (`PartListingId`) REFERENCES `carpartlisting` (`CarPartListingId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Comments_ToLogin` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE;

--
-- Constraints for table `inbox`
--
ALTER TABLE `inbox`
  ADD CONSTRAINT `FK_Table_ReceiverLogin` FOREIGN KEY (`ReceiverLoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Table_SenderLogin` FOREIGN KEY (`SenderLoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `FK_Profile_Login` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `FK_Wishlist_ToCarListing` FOREIGN KEY (`ListingId`) REFERENCES `carlisting` (`CarListingId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Wishlist_ToCarPartListing` FOREIGN KEY (`PartListingId`) REFERENCES `carpartlisting` (`CarPartListingId`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
