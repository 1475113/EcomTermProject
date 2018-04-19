-- BusinessProfile Table

CREATE TABLE IF NOT EXISTS `BusinessProfile` (
    `ID`     INT          NOT NULL,
    `LoginId`               INT          NOT NULL,
    `BusinessName`          VARCHAR (50) NOT NULL,
    `Rating`                INT              NULL,
    `RatingCounter`         INT          NOT NULL,
    `Phone`                 VARCHAR (15) NOT NULL,
    `Email`                 VARCHAR (50) NOT NULL,
    `Address`               VARCHAR (50) NOT NULL,
    `Postal`                VARCHAR (7)  NOT NULL,
    PRIMARY KEY CLUSTERED (`ID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- CarListing Table

CREATE TABLE IF NOT EXISTS `CarListing` (
    `ID` INT              NOT NULL,
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
    `ID` INT             NOT NULL,
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
    `RegionId`   INT          NOT NULL,
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
