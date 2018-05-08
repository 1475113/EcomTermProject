-- BusinessProfile Table

CREATE TABLE IF NOT EXISTS `BusinessProfile` (
    `BusinessProfileId`     INT          NOT NULL,
    `LoginId`               INT          NOT NULL,
    `BusinessName`          VARCHAR (50) NOT NULL,
    `Rating`                INT              NULL,
    `RatingCounter`         INT          NOT NULL,
    `Phone`                 VARCHAR (15) NOT NULL,
    `Email`                 VARCHAR (50) NOT NULL,
    `Address`               VARCHAR (50) NOT NULL,
    `Postal`                VARCHAR (7)  NOT NULL,
    PRIMARY KEY CLUSTERED (`BusinessProfileId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- CarListing Table

CREATE TABLE IF NOT EXISTS `CarListing` (
    `CarListingId` INT              NOT NULL,
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
    `Views`        INT                  NULL,
    PRIMARY KEY CLUSTERED (`CarListingId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- CarPartListing Table

CREATE TABLE IF NOT EXISTS `CarPartListing` (
    `CarPartListingId` INT             NOT NULL,
    `PostDate`         DATE            NOT NULL,
    `Description`      VARCHAR (65535) NOT NULL,
    `LoginId`          INT             NOT NULL,
    `Price`            DECIMAL (15,2)  NOT NULL,
    `ImageId`          INT                 NULL,
    `RegionId`         INT             NOT NULL,
    `Views`            INT                 NULL,
    PRIMARY KEY CLUSTERED (`CarPartListingId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Comments Table

CREATE TABLE IF NOT EXISTS `Comment` (
    `CommentId`     INT             NOT NULL,
    `LoginId`       INT             NOT NULL,
    `Comment`       VARCHAR (65535) NOT NULL,
    `ListingId`     INT                 NULL,
    `PartListingId` INT                 NULL,
    PRIMARY KEY CLUSTERED (`CommentId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Image Table

CREATE TABLE IF NOT EXISTS `Image` (
    `ImageId`       INT             NOT NULL,
    `ListingId`     INT             NOT NULL,
    `ImageURL`      VARCHAR (65535) NOT NULL,
    PRIMARY KEY CLUSTERED (`ImageId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Inbox Table

CREATE TABLE IF NOT EXISTS `Inbox` (
    `MessageId`        INT             NOT NULL,
    `SenderLoginId`    INT             NOT NULL,
    `ReceiverLoginId`  INT             NOT NULL,
    `Message`          VARCHAR (65535) NOT NULL,
    `Date`             DATE            NOT NULL,
    PRIMARY KEY CLUSTERED (`MessageId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Login Table

CREATE TABLE IF NOT EXISTS `Login` (
    `LoginId`      INT             NOT NULL,
    `Username`     VARCHAR (50)    NOT NULL,
    `PasswordHash` VARCHAR (65535) NOT NULL,
    `Status`       INT                 NULL,
    PRIMARY KEY CLUSTERED (`LoginId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Profile Table

CREATE TABLE IF NOT EXISTS `Profile` (
    `ProfileId` INT          NOT NULL,
    `LoginId`   INT          NOT NULL,
    `FirstName` VARCHAR (50) NOT NULL,
    `LastName`  VARCHAR (50) NOT NULL,
    `Phone`     VARCHAR (50) NOT NULL,
    `Email`     VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED (`ProfileId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Region Table

CREATE TABLE IF NOT EXISTS `Region` (
    `RegionId`   INT          NOT NULL,
    `RegionName` VARCHAR (30)     NULL,
    PRIMARY KEY CLUSTERED (`RegionId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Wishlist Table

CREATE TABLE IF NOT EXISTS `Wishlist` (
    `WishlistId`    INT NOT NULL,
    `ListingId`     INT     NULL,
    `PartListingId` INT     NULL,
    PRIMARY KEY CLUSTERED (`WishlistId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Add Unique to Login
ALTER TABLE `Login`
    ADD UNIQUE(`Username`);

-- Add Auto-Incrementing for tables
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

-- Add Unique to Login
ALTER TABLE `Login`
    ADD UNIQUE(`Username`);

-- Add Constraints to Tables

-- BusinessProfile
ALTER TABLE `BusinessProfile`
    ADD CONSTRAINT `FK_BusinessProfileId_ToLogin` FOREIGN KEY (`LoginId`)
    REFERENCES `Login` (`LoginId`) ON DELETE CASCADE;

-- CarListing
ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToLogin` FOREIGN KEY (`LoginId`)
    REFERENCES `Login` (`LoginId`) ON DELETE CASCADE;

ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToRegion` FOREIGN KEY (`RegionId`)
    REFERENCES `Region` (`RegionId`) ON DELETE CASCADE;

ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToImage` FOREIGN KEY (`ImageId`) 
    REFERENCES `Image` (`ImageId`) ON DELETE CASCADE;

-- CarPartListing
ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToLogin` FOREIGN KEY (`LoginId`) 
    REFERENCES `Login` (`LoginId`) ON DELETE CASCADE;

ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToRegion` FOREIGN KEY (`RegionId`)
    REFERENCES `Region` (`RegionId`) ON DELETE CASCADE;

ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToImage` FOREIGN KEY (`ImageId`)
    REFERENCES `Image` (`ImageId`) ON DELETE CASCADE;

-- Comment
ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToCarPartListing` FOREIGN KEY (`PartListingId`)
    REFERENCES `CarPartListing` (`CarPartListingId`) ON DELETE CASCADE;

ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToCarListing` FOREIGN KEY (`ListingId`)
    REFERENCES `CarListing` (`CarListingId`) ON DELETE CASCADE;

ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToLogin` FOREIGN KEY (`LoginId`)
    REFERENCES `Login` (`LoginId`) ON DELETE CASCADE;

-- Inbox
ALTER TABLE `Inbox`
    ADD CONSTRAINT `FK_Table_ReceiverLogin` FOREIGN KEY (`ReceiverLoginId`)
    REFERENCES `Login` (`LoginId`) ON DELETE CASCADE;

ALTER TABLE `Inbox`
    ADD CONSTRAINT `FK_Table_SenderLogin` FOREIGN KEY (`SenderLoginId`)
    REFERENCES `Login` (`LoginId`) ON DELETE CASCADE;

-- Profile
ALTER TABLE `Profile`
    ADD CONSTRAINT `FK_Profile_Login` FOREIGN KEY (`LoginId`)
    REFERENCES `Login` (`LoginId`) ON DELETE CASCADE;

-- Wishlist
ALTER TABLE `Wishlist`
    ADD CONSTRAINT `FK_Wishlist_ToCarPartListing` FOREIGN KEY (`PartListingId`)
    REFERENCES `CarPartListing` (`CarPartListingId`) ON DELETE CASCADE;

ALTER TABLE `Wishlist`
    ADD CONSTRAINT `FK_Wishlist_ToCarListing` FOREIGN KEY (`ListingId`)
    REFERENCES `CarListing` (`CarListingId`) ON DELETE CASCADE;

-- Insert Statements
INSERT INTO `region` (`RegionId`, `RegionName`) VALUES ('1', 'Montreal'),
('2', 'Laval'), ('3', 'Laurentides'), ('4', 'Monteregie'), ('5', 'Lanaudiere') 
