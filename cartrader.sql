-- BusinessProfile Table

CREATE TABLE IF NOT EXISTS `BusinessProfile` (
    `ID`                    INT          NOT NULL,
    `LoginId`               INT          NOT NULL,
    `BusinessName`          VARCHAR (50) NOT NULL,
    `LocationId`            INT          NOT NULL,
    `Rating`                INT              NULL,
    `RatingCounter`         INT          NOT NULL,
    `Phone`                 VARCHAR (15) NOT NULL,
    `Email`                 VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- CarListing Table

CREATE TABLE IF NOT EXISTS `CarListing` (
    `ID`           INT              NOT NULL,
    `CarMake`      VARCHAR (50)     NOT NULL,
    `CarModel`     VARCHAR (50)     NOT NULL,
    `CarTrim`      VARCHAR (50)     NOT NULL,
    `CarYear`      INT              NOT NULL,
    `PostDate`     DATE             NOT NULL,
    `Description`  VARCHAR (65535)  NOT NULL,
    `LoginId`      INT              NOT NULL,
    `Mileage`      INT              NOT NULL,
    `Price`        DECIMAL (15,2)   NOT NULL,
    `ImageId`      INT                  NULL,
    `RegionId`     INT              NOT NULL,
    `Views`        INT              NOT NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- CarPartListing Table

CREATE TABLE IF NOT EXISTS `CarPartListing` (
    `ID`               INT             NOT NULL,
    `PostDate`         DATE            NOT NULL,
    `Description`      VARCHAR (65535) NOT NULL,
    `LoginId`          INT             NOT NULL,
    `Price`            DECIMAL (15,2)  NOT NULL,
    `ImageId`          INT                 NULL,
    `RegionId`         INT             NOT NULL,
    `Views`            INT             NOT NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Comments Table

CREATE TABLE IF NOT EXISTS `Comment` (
    `ID`     INT             NOT NULL,
    `LoginId`       INT             NOT NULL,
    `Comment`       VARCHAR (65535) NOT NULL,
    `ListingId`     INT                 NULL,
    `PartListingId` INT                 NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Image Table

CREATE TABLE IF NOT EXISTS `Image` (
    `ID`       INT             NOT NULL,
    `ListingId`     INT             NOT NULL,
    `ImageURL`      VARCHAR (65535) NOT NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Inbox Table

CREATE TABLE IF NOT EXISTS `Inbox` (
    `ID`        INT             NOT NULL,
    `SenderLoginId`    INT             NOT NULL,
    `ReceiverLoginId`  INT             NOT NULL,
    `Message`          VARCHAR (65535) NOT NULL,
    `Date`             DATE            NOT NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Location Table

CREATE TABLE IF NOT EXISTS `Location` (
    `ID` INT             NOT NULL,
    `Postal`     VARCHAR (7)     NOT NULL,
    `Address`    VARCHAR (65535) NOT NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Login Table

CREATE TABLE IF NOT EXISTS `Login` (
    `ID`      INT             NOT NULL,
    `Username`     VARCHAR (50)    NOT NULL,
    `PasswordHash` VARCHAR (65535) NOT NULL,
    `Status`       INT                 NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Profile Table

CREATE TABLE IF NOT EXISTS `Profile` (
    `ID` INT          NOT NULL,
    `LoginId`   INT          NOT NULL,
    `FirstName` VARCHAR (50) NOT NULL,
    `LastName`  VARCHAR (50) NOT NULL,
    `Phone`     VARCHAR (50) NOT NULL,
    `Email`     VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Region Table

CREATE TABLE IF NOT EXISTS `Region` (
    `ID`   INT          NOT NULL,
    `RegionName` VARCHAR (10)     NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Wishlist Table

CREATE TABLE IF NOT EXISTS `Wishlist` (
    `ID`    INT NOT NULL,
    `ListingId`     INT     NULL,
    `PartListingId` INT     NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Add Auto-Incrementing for tables
ALTER TABLE `businessprofile`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `carlisting`
--
ALTER TABLE `carlisting`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `carpartlisting`
--
ALTER TABLE `carpartlisting`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

-- Add Unique to Login
ALTER TABLE `Login`
    ADD UNIQUE(`Username`);

-- Add Constraints to Tables

-- BusinessProfile
ALTER TABLE `BusinessProfile`
    ADD CONSTRAINT `FK_BusinessProfileId_ToLocation` FOREIGN KEY (`ID`)
    REFERENCES `Location` (`ID`) ON DELETE CASCADE;

ALTER TABLE `BusinessProfile`
    ADD CONSTRAINT `FK_BusinessProfileId_ToLogin` FOREIGN KEY (`ID`)
    REFERENCES `Login` (`ID`) ON DELETE CASCADE;

-- CarListing
ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToLogin` FOREIGN KEY (`ID`)
    REFERENCES `Login` (`ID`) ON DELETE CASCADE;

ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToRegion` FOREIGN KEY (`ID`)
    REFERENCES `Region` (`ID`) ON DELETE CASCADE;

ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToImage` FOREIGN KEY (`ID`) 
    REFERENCES `Image` (`ID`) ON DELETE CASCADE;

-- CarPartListing
ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToLogin` FOREIGN KEY (`ID`) 
    REFERENCES `Login` (`ID`) ON DELETE CASCADE;

ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToRegion` FOREIGN KEY (`ID`)
    REFERENCES `Region` (`ID`) ON DELETE CASCADE;

ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToImage` FOREIGN KEY (`ID`)
    REFERENCES `Image` (`ID`) ON DELETE CASCADE;

-- Comment
ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToCarPartListing` FOREIGN KEY (`ID`)
    REFERENCES `CarPartListing` (`ID`) ON DELETE CASCADE;

ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToCarListing` FOREIGN KEY (`ID`)
    REFERENCES `CarListing` (`ID`) ON DELETE CASCADE;

ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToLogin` FOREIGN KEY (`ID`)
    REFERENCES `Login` (`ID`) ON DELETE CASCADE;

-- Inbox
ALTER TABLE `Inbox`
    ADD CONSTRAINT `FK_Table_ReceiverLogin` FOREIGN KEY (`ID`)
    REFERENCES `Login` (`ID`) ON DELETE CASCADE;

ALTER TABLE `Inbox`
    ADD CONSTRAINT `FK_Table_SenderLogin` FOREIGN KEY (`ID`)
    REFERENCES `Login` (`ID`) ON DELETE CASCADE;

-- Profile
ALTER TABLE `Profile`
    ADD CONSTRAINT `FK_Profile_Login` FOREIGN KEY (`ID`)
    REFERENCES `Login` (`ID`) ON DELETE CASCADE;

-- Wishlist
ALTER TABLE `Wishlist`
    ADD CONSTRAINT `FK_Wishlist_ToCarPartListing` FOREIGN KEY (`ID`)
    REFERENCES `CarPartListing` (`ID`) ON DELETE CASCADE;

ALTER TABLE `Wishlist`
    ADD CONSTRAINT `FK_Wishlist_ToCarListing` FOREIGN KEY (`ID`)
    REFERENCES `CarListing` (`ID`) ON DELETE CASCADE;
