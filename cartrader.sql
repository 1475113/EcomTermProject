-- BusinessProfile Table

CREATE TABLE IF NOT EXISTS `BusinessProfile` (
    `BProfileId`    INT          NOT NULL,
    `Username`      VARCHAR (50) NOT NULL,
    `BusinessName`  VARCHAR (50) NOT NULL,
    `LocationId`    INT          NOT NULL,
    `Rating`        INT              NULL,
    `RatingCounter` INT          NOT NULL,
    `Phone`         VARCHAR (15) NOT NULL,
    `Email`         VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED (`BProfileId` ASC)
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
    `Username`     VARCHAR (50)     NOT NULL,
    `Mileage`      INT              NOT NULL,
    `Price`        DECIMAL (15,2)   NOT NULL,
    `ImageId`      INT                  NULL,
    `RegionId`     INT              NOT NULL,
    `Views`        INT              NOT NULL,
    PRIMARY KEY CLUSTERED (`CarListingId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- CarPartListing Table

CREATE TABLE IF NOT EXISTS `CarPartListing` (
    `CarPartListingId` INT             NOT NULL,
    `CarPartMake`      VARCHAR (50)    NOT NULL,
    `CarPartModel`     VARCHAR (50)    NOT NULL,
    `CarPartTrim`      VARCHAR (50)    NOT NULL,
    `CarPartYear`      INT             NOT NULL,
    `PostDate`         DATE            NOT NULL,
    `Description`      VARCHAR (65535) NOT NULL,
    `Username`         VARCHAR (50)    NOT NULL,
    `Mileage`          INT             NOT NULL,
    `Price`            DECIMAL (15,2)  NOT NULL,
    `ImageId`          INT                 NULL,
    `RegionId`         INT             NOT NULL,
    `Views`            INT             NOT NULL,
    PRIMARY KEY CLUSTERED (`CarPartListingId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Comments Table

CREATE TABLE IF NOT EXISTS `Comment` (
    `Id`            INT             NOT NULL,
    `username`      VARCHAR (50)    NOT NULL,
    `comment`       VARCHAR (65535) NOT NULL,
    `listingID`     INT                 NULL,
    `partListingID` INT                 NULL,
    PRIMARY KEY CLUSTERED (`Id` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Image Table

CREATE TABLE IF NOT EXISTS `Image` (
    `ImageId`  INT             NOT NULL,
    `ImageURL` VARCHAR (65535) NOT NULL,
    PRIMARY KEY CLUSTERED (`ImageId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Inbox Table

CREATE TABLE IF NOT EXISTS `Inbox` (
    `MessageId`        INT             NOT NULL,
    `SenderUsername`   VARCHAR (50)    NOT NULL,
    `ReceiverUsername` VARCHAR (50)    NOT NULL,
    `Message`          VARCHAR (65535) NOT NULL,
    `Date`             DATE            NOT NULL,
    PRIMARY KEY CLUSTERED (`MessageId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Location Table

CREATE TABLE IF NOT EXISTS `Location` (
    `LocationId` INT             NOT NULL,
    `Postal`     VARCHAR (7)     NOT NULL,
    `Address`    VARCHAR (65535) NOT NULL,
    PRIMARY KEY CLUSTERED (`LocationId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Login Table

CREATE TABLE IF NOT EXISTS `Login` (
    `Username`     VARCHAR (50)    NOT NULL,
    `PasswordHash` VARCHAR (65535) NOT NULL,
    `Status`       INT                 NULL,
    PRIMARY KEY CLUSTERED (`Username` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Profile Table

CREATE TABLE IF NOT EXISTS `Profile` (
    `ProfileId` INT          NOT NULL,
    `Username`  VARCHAR (50) NOT NULL,
    `FirstName` VARCHAR (50) NOT NULL,
    `LastName`  VARCHAR (50) NOT NULL,
    `Phone`     VARCHAR (50) NOT NULL,
    `Email`     VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED (`ProfileId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Region Table

CREATE TABLE IF NOT EXISTS `Region` (
    `RegionId`   INT          NOT NULL,
    `RegionName` VARCHAR (10)     NULL,
    PRIMARY KEY CLUSTERED (`RegionId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Wishlist Table

CREATE TABLE IF NOT EXISTS `Wishlist` (
    `wishlistId`    INT NOT NULL,
    `listingId`     INT     NULL,
    `partListingId` INT     NULL,
    PRIMARY KEY CLUSTERED (`wishlistId` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- Add Constraints to Tables

-- BusinessProfile
ALTER TABLE `BusinessProfile`
    ADD CONSTRAINT `FK_BusinessProfileId_ToLocation` FOREIGN KEY (`LocationId`) 
    REFERENCES `Location` (`LocationId`) ON DELETE CASCADE;

ALTER TABLE `BusinessProfile`
    ADD CONSTRAINT `FK_BusinessProfileId_ToLogin` FOREIGN KEY (`Username`)
    REFERENCES `Login` (`Username`) ON DELETE CASCADE;

-- CarListing
ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToLogin` FOREIGN KEY (`Username`)
    REFERENCES `Login` (`Username`) ON DELETE CASCADE;

ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToRegion` FOREIGN KEY (`RegionId`)
    REFERENCES `Region` (`RegionId`) ON DELETE CASCADE;

ALTER TABLE `CarListing`
    ADD CONSTRAINT `FK_CarListings_ToImage` FOREIGN KEY (`ImageId`) 
    REFERENCES `Image` (`ImageId`) ON DELETE CASCADE;

-- CarPartListing
ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToLogin` FOREIGN KEY (`Username`) 
    REFERENCES `Login` (`Username`) ON DELETE CASCADE;

ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToRegion` FOREIGN KEY (`RegionId`)
    REFERENCES `Region` (`RegionId`) ON DELETE CASCADE;

ALTER TABLE `CarPartListing`
    ADD CONSTRAINT `FK_CarPartListings_ToImage` FOREIGN KEY (`ImageId`)
    REFERENCES `Image` (`ImageId`) ON DELETE CASCADE;

-- Comment
ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToCarPartListing` FOREIGN KEY (`partListingID`)
    REFERENCES `CarPartListing` (`CarPartListingId`) ON DELETE CASCADE;

ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToCarListing` FOREIGN KEY (`listingID`)
    REFERENCES `CarListing` (`CarListingId`) ON DELETE CASCADE;

ALTER TABLE `Comment`
    ADD CONSTRAINT `FK_Comments_ToLogin` FOREIGN KEY (`username`)
    REFERENCES `Login` (`Username`) ON DELETE CASCADE;

-- Inbox
ALTER TABLE `Inbox`
    ADD CONSTRAINT `FK_Table_ReceiverLogin` FOREIGN KEY (`ReceiverUsername`)
    REFERENCES `Login` (`Username`) ON DELETE CASCADE;

ALTER TABLE `Inbox`
    ADD CONSTRAINT `FK_Table_SenderLogin` FOREIGN KEY (`SenderUsername`)
    REFERENCES `Login` (`Username`) ON DELETE CASCADE;

-- Profile
ALTER TABLE `Profile`
    ADD CONSTRAINT `FK_Profile_Login` FOREIGN KEY (`Username`)
    REFERENCES `Login` (`Username`) ON DELETE CASCADE;

-- Wishlist
ALTER TABLE `Wishlist`
    ADD CONSTRAINT `FK_Wishlist_ToCarPartListing` FOREIGN KEY (`partListingId`)
    REFERENCES `CarPartListing` (`CarPartListingId`) ON DELETE CASCADE;


ALTER TABLE `Wishlist`
    ADD CONSTRAINT `FK_Wishlist_ToCarListing` FOREIGN KEY (`listingId`)
    REFERENCES `CarListing` (`CarListingId`) ON DELETE CASCADE;