-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 23, 2014 at 04:27 PM
-- Server version: 5.5.34-0ubuntu0.12.10.1
-- PHP Version: 5.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
CREATE TABLE IF NOT EXISTS `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') CHARACTER SET utf8 DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Surname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `RememberLoginToken` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `Bounced` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AutoLoginHash` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `TimeFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Suburb` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Postcode` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `SecondEmail` mediumtext CHARACTER SET utf8,
  `ThirdEmail` mediumtext CHARACTER SET utf8,
  `HasBeenEmailed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShirtSize` enum('Extra Small','Small','Medium','Large','XL','XXL') CHARACTER SET utf8 DEFAULT 'Extra Small',
  `CompanyAffliations` mediumtext CHARACTER SET utf8,
  `StatementOfInterest` mediumtext CHARACTER SET utf8,
  `FoodPreference` mediumtext CHARACTER SET utf8,
  `OtherFood` mediumtext CHARACTER SET utf8,
  `IRCHandle` mediumtext CHARACTER SET utf8,
  `TwitterName` mediumtext CHARACTER SET utf8,
  `Projects` mediumtext CHARACTER SET utf8,
  `OtherProject` mediumtext CHARACTER SET utf8,
  `SubscribedToNewsletter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `City` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Bio` mediumtext CHARACTER SET utf8,
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `OrgID` int(11) NOT NULL DEFAULT '0',
  `CompanyID` int(11) NOT NULL DEFAULT '0',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `JobTitle` mediumtext CHARACTER SET utf8,
  `DisplayOnSite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Role` mediumtext CHARACTER SET utf8,
  `LinkedInProfile` mediumtext CHARACTER SET utf8,
  `Gender` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`),
  KEY `Member_CompanyAffliations` (`CompanyAffliations`(32)),
  KEY `PhotoID` (`PhotoID`),
  KEY `OrgID` (`OrgID`),
  KEY `CompanyID` (`CompanyID`),
  FULLTEXT KEY `SearchFields` (`FirstName`,`Surname`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14540 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `Created`, `LastEdited`, `FirstName`, `Surname`, `Email`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `Bounced`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`, `Address`, `Suburb`, `State`, `Postcode`, `Country`, `SecondEmail`, `ThirdEmail`, `HasBeenEmailed`, `ShirtSize`, `CompanyAffliations`, `StatementOfInterest`, `FoodPreference`, `OtherFood`, `IRCHandle`, `TwitterName`, `Projects`, `OtherProject`, `SubscribedToNewsletter`, `City`, `Bio`, `PhotoID`, `OrgID`, `CompanyID`, `SortOrder`, `JobTitle`, `DisplayOnSite`, `Role`, `LinkedInProfile`, `Gender`) VALUES
(100, 'Member', '2014-01-23 16:25:14', '2014-01-23 16:25:14', 'Admin', 'Charlie', 'admin@example.com', 'admin', NULL, 0, '2014-01-23 16:25:14', 0, NULL, NULL, 'none', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Extra Small', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 4999, 0, 0, 0, NULL, 1, NULL, NULL, NULL);

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') CHARACTER SET utf8 DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `IPRestrictions` mediumtext CHARACTER SET utf8,
  `HtmlEditorConfig` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES (4,'Group','2012-07-18 21:50:41','2012-07-18 21:50:41','Users',NULL,'users',0,4,NULL,NULL,0);
INSERT INTO `Group` VALUES (5,'Group','2012-07-31 23:09:11','2013-12-23 21:39:51','Foundation Members',NULL,'foundation-members',0,5,NULL,NULL,0);
INSERT INTO `Group` VALUES (8,'Group','2013-06-17 18:55:26','2013-06-17 18:55:26','Speakers',NULL,'speakers',0,8,NULL,NULL,0);
INSERT INTO `Group` VALUES (31,'Group','2014-11-11 14:40:36','2014-11-11 14:41:14','oauth2 server admin',NULL,'oauth2-server-admin',0,0,NULL,NULL,0);
INSERT INTO `Group` VALUES (33,'Group','2014-11-11 14:43:12','2014-11-11 14:43:44','openstackid server admin',NULL,'openstackid-server-admin',0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_Members`
--

DROP TABLE IF EXISTS `Group_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=MyISAM AUTO_INCREMENT=51939 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_Members`
--

LOCK TABLES `Group_Members` WRITE;
/*!40000 ALTER TABLE `Group_Members` DISABLE KEYS */;
INSERT INTO `Group_Members` VALUES (100,5,100,0);
INSERT INTO `Group_Members` VALUES (101,4,100,0);
INSERT INTO `Group_Members` VALUES (102,8,100,0);
INSERT INTO `Group_Members` VALUES (103,31,100,0);
INSERT INTO `Group_Members` VALUES (104,32,100,0);
/*!40000 ALTER TABLE `Group_Members` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','FLV','MP3','AttachmentFile','Image','Folder','BetterImage','Image_Cached','AttachmentImage') CHARACTER SET utf8 DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Filename` mediumtext CHARACTER SET utf8,
  `Content` mediumtext CHARACTER SET utf8,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `Secured` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=6228 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `File`
--
-- WHERE:  ID = 4741

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
INSERT INTO `File` VALUES (4999,'BetterImage','2014-04-08 04:27:48','2014-04-08 04:27:48','martonkiss.jpg','martonkiss','assets/profile-images/martonkiss.jpg',NULL,0,887,0,0,3996,1);
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
