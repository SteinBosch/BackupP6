-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Machine: localhost:8889
-- Gegenereerd op: 28 nov 2014 om 09:46
-- Serverversie: 5.5.34
-- PHP-versie: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `webapp_p6`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ErrorPage`
--

CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Gegevens worden geëxporteerd voor tabel `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ErrorPage_Live`
--

CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Gegevens worden geëxporteerd voor tabel `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ErrorPage_versions`
--

CREATE TABLE `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Gegevens worden geëxporteerd voor tabel `ErrorPage_versions`
--

INSERT INTO `ErrorPage_versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Exercise`
--

CREATE TABLE `Exercise` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Exercise') DEFAULT 'Exercise',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `FearScore` int(11) NOT NULL DEFAULT '0',
  `Objective` varchar(255) DEFAULT NULL,
  `PatientID` int(11) NOT NULL DEFAULT '0',
  `Prevention` varchar(255) DEFAULT NULL,
  `Exposure` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Gegevens worden geëxporteerd voor tabel `Exercise`
--

INSERT INTO `Exercise` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `FearScore`, `Objective`, `PatientID`, `Prevention`, `Exposure`) VALUES
(1, 'Exercise', '2014-11-11 13:47:38', '2014-11-17 22:27:49', 'Naar de wc gaan, zitten op de bril en een broodje eten', 100, NULL, 4, 'Niet handen wassen', 'Naar de wc gaan, zitten op de bril en een broodje eten'),
(2, 'Exercise', '2014-11-11 13:48:18', '2014-11-17 22:28:41', 'Naar de wc gaan, zitten op de bril en daarna nog handen wassen', 90, NULL, 4, 'Op niet dwangmatige manier', 'Naar de wc gaan, zitten op de bril daarna nog handen wassen'),
(3, 'Exercise', '2014-11-11 19:15:51', '2014-11-17 22:29:01', 'In de wc. aanraken van kranen, papierrol, prullenbak enz.', 80, NULL, 4, 'Niet handen wassen', 'In de wc. aanraken van kranen, papierrol, prullenbak enz.'),
(4, 'Exercise', '2014-11-11 19:16:08', '2014-11-17 22:29:13', 'In het ziekenhuis een broodje eten', 70, NULL, 4, 'Niet handen wassen', 'In het ziekenhuis een broodje eten'),
(5, 'Exercise', '2014-11-11 19:16:37', '2014-11-17 22:29:33', 'Een broodje eten in het winkelcentrum na het aanraken van stoplichtknopjes', 60, NULL, 4, 'Niet handen wassen', 'Een broodje eten in het winkelcentrum na het aanraken van stoplichtknopjes'),
(6, 'Exercise', '2014-11-11 19:17:00', '2014-11-17 22:29:52', 'Pinnen bij het winkelcentrum', 50, NULL, 4, 'Niet handen wassen', 'Pinnen bij het winkelcentrum'),
(7, 'Exercise', '2014-11-11 19:23:23', '2014-11-17 22:30:12', 'Naar de wc gaan als ik moet (dus niet vermijden door ophouden)', 40, NULL, 4, 'Niet vermijden', 'Naar de wc gaan als ik moet'),
(8, 'Exercise', '2014-11-11 19:23:37', '2014-11-17 22:30:26', 'Aanraken van de kranen op de wc', 30, NULL, 4, 'Niet handen wassen', 'Aanraken van de kranen op de wc'),
(9, 'Exercise', '2014-11-11 19:24:13', '2014-11-17 22:30:39', 'Aanraken van de deurknoppen van de wc', 20, NULL, 4, 'Niet handen wassen', 'Aanraken van de deurknoppen van de wc'),
(10, 'Exercise', '2014-11-11 19:24:34', '2014-11-17 22:31:00', 'Aanraken van de deurknoppen en trapleuningen', 10, NULL, 4, 'Niet handen wassen', 'Aanraken van de deurknoppen en trapleuningen'),
(15, 'Exercise', '2014-11-18 14:53:54', '2014-11-18 14:53:54', NULL, 40, NULL, 4, 'Geen vaatwasser', 'Doe de vaatwas met de hand'),
(16, 'Exercise', '2014-11-20 14:04:41', '2014-11-20 14:04:41', NULL, 80, NULL, 4, 'Niet handen wassen', 'Nieuw test oefening'),
(17, 'Exercise', '2014-11-20 14:15:24', '2014-11-20 14:15:24', NULL, 20, NULL, 4, 'Niet handenwassen', 'Test oefening'),
(18, 'Exercise', '2014-11-20 14:18:55', '2014-11-20 14:18:55', NULL, 10, NULL, 4, 'Test', 'Nieuwe test oefening'),
(19, 'Exercise', '2014-11-26 13:10:54', '2014-11-26 13:10:54', NULL, 100, NULL, 4, 'Geen nieuwe bugs', 'Opschonen van de code'),
(20, 'Exercise', '2014-11-26 15:46:47', '2014-11-26 15:46:47', NULL, 70, NULL, 4, 'test', 'testingt'),
(21, 'Exercise', '2014-11-27 12:36:35', '2014-11-27 12:36:35', NULL, 90, NULL, 5, 'Niet falen', 'De eerste oefening'),
(22, 'Exercise', '2014-11-27 13:31:58', '2014-11-27 13:31:58', NULL, 90, NULL, 5, 'test', 'Test oefening'),
(24, 'Exercise', '2014-11-27 14:04:00', '2014-11-27 14:04:00', NULL, 80, NULL, 6, 'test', 'test'),
(27, 'Exercise', '2014-11-27 14:15:17', '2014-11-27 14:15:17', NULL, 80, NULL, 6, 'test', 'test'),
(28, 'Exercise', '2014-11-27 14:58:59', '2014-11-27 14:58:59', NULL, 80, NULL, 6, 'so far so good', 'test validatie');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `File`
--

CREATE TABLE `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Folder','Image','Image_Cached') DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Group`
--

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(255) DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Gegevens worden geëxporteerd voor tabel `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2014-10-10 10:13:09', '2014-11-05 16:55:15', 'Patient', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'Group', '2014-10-10 10:13:09', '2014-10-31 10:09:13', 'Therapist', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Group_Members`
--

CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Gegevens worden geëxporteerd voor tabel `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Group_Roles`
--

CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `LoginAttempt`
--

CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Member`
--

CREATE TABLE `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member','Patient','Therapist') DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `RememberLoginToken` varchar(160) DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) DEFAULT NULL,
  `TimeFormat` varchar(30) DEFAULT NULL,
  `ApiToken` varchar(160) DEFAULT NULL,
  `ApiTokenExpire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`(255)),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Gegevens worden geëxporteerd voor tabel `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `Created`, `LastEdited`, `FirstName`, `Surname`, `Email`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`, `ApiToken`, `ApiTokenExpire`) VALUES
(1, 'Member', '2014-10-10 10:13:09', '2014-11-27 12:28:16', 'Default Admin', NULL, NULL, NULL, NULL, 19, '2014-11-28 09:42:57', NULL, NULL, NULL, NULL, NULL, NULL, 'en_US', 0, NULL, NULL, NULL, 0),
(2, 'Therapist', '2014-10-31 10:10:08', '2014-10-31 10:10:08', 'pieter', 'ooms', 'pieter.ooms@hva.nl', '$2y$10$b0ae54447b352370408a2upMBfRcvVizv0hsZb7.SIuZL95njGmcW', NULL, 0, NULL, NULL, NULL, 'blowfish', '10$b0ae54447b352370408a21', NULL, NULL, 'nl_NL', 0, 'MMM d, y', 'h:mm:ss a', NULL, 0),
(3, 'Patient', '2014-10-31 10:10:32', '2014-10-31 10:11:03', 'luuk', 'gruijs', 'luuk.gruijs@hva.nl', '$2y$10$01db5a3ef15b8ba572329uv8L8p/SyOjd.j6/KeWHIqqIsvLi6WGS', NULL, 0, NULL, NULL, NULL, 'blowfish', '10$01db5a3ef15b8ba5723298', NULL, NULL, 'nl_NL', 0, 'MMM d, y', 'h:mm:ss a', NULL, 0),
(4, 'Patient', '2014-10-31 10:46:11', '2014-11-28 09:43:52', 'Stein ', 'Bosch', 'stein.bosch@hva.nl', '$2y$10$9edf3c4fd04e0d4bec872uYEqQ.Uls4pWSnBbkjJG28bHc3PKeVpC', NULL, 221, '2014-11-27 11:43:54', NULL, NULL, 'blowfish', '10$9edf3c4fd04e0d4bec8720', NULL, NULL, 'nl_NL', 0, 'MMM d, y', 'h:mm:ss a', 'e1cdaec0a37468f6a2607e0byOSk8EdEEwdrsnjbSUBulkMdqcKsa', 1417175029),
(5, 'Patient', '2014-10-31 10:47:34', '2014-11-27 13:52:42', 'Ruben', 'Kuipers', 'test@test.nl', '$2y$10$46881a5adae8dd9d51be7OHsuJpFBxnaQnGdNKT8bp76aPpRL9wiK', NULL, 16, NULL, NULL, NULL, 'blowfish', '10$46881a5adae8dd9d51be7d', NULL, NULL, 'en_US', 0, 'MMM d, y', 'h:mm:ss a', '0d7a768c3877b0affeb68uyK4V4bnHBKQJadPNQJ9BfOrOJvPVEcG', 1417098573),
(6, 'Patient', '2014-11-27 13:54:12', '2014-11-27 15:19:29', 'Test', 'Patient', 'Patient@test.nl', '$2y$10$82b35a956cfd660817b9euxBjXHM10w7h1BsoalqgwpYew8Ox5WjW', NULL, 24, NULL, NULL, NULL, 'blowfish', '10$82b35a956cfd660817b9e8', NULL, NULL, 'en_US', 0, 'MMM d, y', 'h:mm:ss a', '438d2947f622d0c3203a0upqAONdwGQVyQ8gzBlai8PFHPS6mXRAa', 1417104861);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `MemberPassword`
--

CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Gegevens worden geëxporteerd voor tabel `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `Created`, `LastEdited`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'MemberPassword', '2014-10-31 10:10:08', '2014-10-31 10:10:08', '$2y$10$b0ae54447b352370408a2upMBfRcvVizv0hsZb7.SIuZL95njGmcW', '10$b0ae54447b352370408a21', 'blowfish', 2),
(2, 'MemberPassword', '2014-10-31 10:10:32', '2014-10-31 10:10:32', '$2y$10$01db5a3ef15b8ba572329uv8L8p/SyOjd.j6/KeWHIqqIsvLi6WGS', '10$01db5a3ef15b8ba5723298', 'blowfish', 3),
(3, 'MemberPassword', '2014-10-31 10:46:11', '2014-10-31 10:46:11', '$2y$10$9edf3c4fd04e0d4bec872uYEqQ.Uls4pWSnBbkjJG28bHc3PKeVpC', '10$9edf3c4fd04e0d4bec8720', 'blowfish', 4),
(4, 'MemberPassword', '2014-10-31 10:47:34', '2014-10-31 10:47:34', '$2y$10$46881a5adae8dd9d51be7OHsuJpFBxnaQnGdNKT8bp76aPpRL9wiK', '10$46881a5adae8dd9d51be7d', 'blowfish', 5),
(5, 'MemberPassword', '2014-11-27 13:54:12', '2014-11-27 13:54:12', '$2y$10$82b35a956cfd660817b9euxBjXHM10w7h1BsoalqgwpYew8Ox5WjW', '10$82b35a956cfd660817b9e8', 'blowfish', 6);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Message`
--

CREATE TABLE `Message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Message') DEFAULT 'Message',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FearScore` int(11) NOT NULL DEFAULT '0',
  `Message` mediumtext,
  `ExerciseID` int(11) NOT NULL DEFAULT '0',
  `Date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ExerciseID` (`ExerciseID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Gegevens worden geëxporteerd voor tabel `Message`
--

INSERT INTO `Message` (`ID`, `ClassName`, `Created`, `LastEdited`, `FearScore`, `Message`, `ExerciseID`, `Date`) VALUES
(1, 'Message', '2014-11-11 16:26:05', '2014-11-11 16:26:05', 80, 'ging goed! Ik had gezien dat de schoonmaakster net geweest was dus dat was fijn', 1, '10-07-2014'),
(2, 'Message', '2014-11-11 20:11:50', '2014-11-11 20:11:50', 50, 'Gaat goed', 1, '12-07-2014'),
(11, 'Message', '2014-11-18 21:34:26', '2014-11-18 21:34:26', 20, 'ging goed', 8, '16-07-2014'),
(12, 'Message', '2014-11-18 21:38:29', '2014-11-18 21:38:29', 10, 'Ik vond het zeer goed gaan. Ik heb een tosti gemaakt nadat ik naar de wc ben geweest en ben niet ziek geworden!', 8, '20-07-2014'),
(13, 'Message', '2014-11-18 21:44:43', '2014-11-18 21:44:43', 60, 'Ik voelde me erg vies nadat ik naar de wc was gegaan dus ik ben wel mijn handen gaan wassen', 8, '24-07-2014'),
(14, 'Message', '2014-11-18 21:47:48', '2014-11-18 21:47:48', 10, 'Nu ging het erg goed. Er is verder niks gebeurd', 8, '26-07-2014'),
(15, 'Message', '2014-11-18 21:54:16', '2014-11-18 21:54:16', 30, 'Nu ging het erg goed. Er is verder niks gebeurd', 8, '29-07-2014'),
(16, 'Message', '2014-11-18 22:01:39', '2014-11-18 22:01:40', 60, 'Heb zelfs de deur met mijn handpalm aangeraakt!', 9, '01-08-2014'),
(17, 'Message', '2014-11-18 22:05:55', '2014-11-18 22:05:55', 10, 'ging al een stuk beter', 9, '05-08-2014'),
(18, 'Message', '2014-11-18 22:10:25', '2014-11-18 22:10:25', 20, 'Geen opmerkingen toe te voegen', 9, '09-08-2014'),
(19, 'Message', '2014-11-18 22:21:11', '2014-11-18 22:21:11', 30, 'TEST', 9, '10-08-2014'),
(20, 'Message', '2014-11-18 22:24:17', '2014-11-18 22:24:17', 90, 'Vond het erg eng', 9, '12-08-2014'),
(21, 'Message', '2014-11-18 22:29:20', '2014-11-18 22:29:20', 10, 'de schoonmaakster was net geweest!', 8, '18-08-2014'),
(22, 'Message', '2014-11-18 22:32:39', '2014-11-18 22:32:40', 50, 'Vond het erg goed gaan', 9, '24-08-2014'),
(23, 'Message', '2014-11-18 22:33:52', '2014-11-18 22:33:52', 10, 'Vond dat het goed ging', 9, '29-08-2014'),
(24, 'Message', '2014-11-18 22:43:26', '2014-11-18 22:43:26', 10, 'De trap zag er schoon uit.', 10, '02-09-2014'),
(25, 'Message', '2014-11-18 22:47:36', '2014-11-18 22:47:36', 60, 'Het apparaat zag er vies uit', 6, '06-09-2014'),
(26, 'Message', '2014-11-18 22:49:04', '2014-11-18 22:49:04', 90, 'Ik vond het erg vies :(', 3, '10-09-2014'),
(27, 'Message', '2014-11-18 22:51:45', '2014-11-18 22:51:45', 80, 'Ik voelde me erg vies en het broodje was niet lekker :(', 5, '15-09-2014'),
(28, 'Message', '2014-11-18 22:55:50', '2014-11-18 22:55:50', 50, 'Ik zag dat ze met handschoenen aan mijn broodje klaarmaakte dus dat gaf me een veiligere gevoel', 4, '21-09-2014'),
(36, 'Message', '2014-11-18 23:26:04', '2014-11-18 23:26:04', 30, 'yesh', 7, '28-09-2014'),
(37, 'Message', '2014-11-18 23:26:53', '2014-11-18 23:26:53', 70, 'test', 2, '01-10-2014'),
(38, 'Message', '2014-11-18 23:27:59', '2014-11-18 23:27:59', 10, 'het was niet zo vies', 15, '06-10-2014'),
(39, 'Message', '2014-11-18 23:28:15', '2014-11-18 23:28:15', 50, 'HEEL VIES', 15, '14-10-2014'),
(46, 'Message', '2014-11-18 23:41:59', '2014-11-18 23:41:59', 10, 'Vandaag vond ik het niet vies', 15, '21-10-2014'),
(47, 'Message', '2014-11-18 23:42:55', '2014-11-18 23:42:55', 20, 'gdfgdf', 15, '01-11-2014'),
(48, 'Message', '2014-11-18 23:54:26', '2014-11-18 23:54:26', 20, 'vond de leuning niet goed schoon', 10, '01-11-2014'),
(49, 'Message', '2014-11-18 23:56:20', '2014-11-18 23:56:20', 10, 'Heb er zelf eerst een doekje overheen gehaald, toen vond ik het minder eng', 6, '02-11-2014'),
(50, 'Message', '2014-11-18 23:56:57', '2014-11-18 23:56:57', 100, 'vond het maar eng :(....', 1, '04-11-2014'),
(51, 'Message', '2014-11-19 09:10:35', '2014-11-19 09:10:35', 80, 'test', 15, '07-11-2014'),
(52, 'Message', '2014-11-19 09:11:08', '2014-11-19 09:11:08', 30, 'test', 15, '08-11-2014'),
(53, 'Message', '2014-11-20 11:57:52', '2014-11-20 11:57:52', 10, 'Ging goed', 9, '11-11-2014'),
(54, 'Message', '2014-11-20 13:22:28', '2014-11-20 13:22:28', 20, 'vond het niet zo vies', 5, '12-11-2014'),
(55, 'Message', '2014-11-20 13:25:52', '2014-11-20 13:25:52', 20, 'test', 5, '13-11-2014'),
(69, 'Message', '2014-11-20 14:29:35', '2014-11-20 14:29:35', 90, 'test', 18, '15-11-2014'),
(70, 'Message', '2014-11-20 14:29:43', '2014-11-20 14:29:43', 30, 'test', 18, '16-11-2014'),
(71, 'Message', '2014-11-20 14:29:54', '2014-11-20 14:29:54', 30, 'test', 18, '20-11-2014'),
(72, 'Message', '2014-11-20 14:31:36', '2014-11-20 14:31:36', 40, 'test', 9, '20-11-2014'),
(73, 'Message', '2014-11-20 14:33:30', '2014-11-20 14:33:30', 20, 'test', 17, '20-11-2014'),
(74, 'Message', '2014-11-20 14:33:39', '2014-11-20 14:33:39', 90, 'test', 17, '20-11-2014'),
(75, 'Message', '2014-11-20 14:33:46', '2014-11-20 14:33:46', 30, 'test', 17, '20-11-2014'),
(76, 'Message', '2014-11-20 16:24:06', '2014-11-20 16:24:06', 40, 'test', 8, '20-11-2014'),
(77, 'Message', '2014-11-20 22:52:52', '2014-11-20 22:52:52', 30, 'done!', 18, '20-11-2014'),
(79, 'Message', '2014-11-26 12:06:08', '2014-11-26 12:06:08', 40, 'test', 3, '26-11-2014'),
(80, 'Message', '2014-11-26 13:11:14', '2014-11-26 13:11:14', 80, 'So far so good', 19, '26-11-2014'),
(81, 'Message', '2014-11-26 15:46:59', '2014-11-26 15:46:59', 40, 'tesyyy', 20, '26-11-2014'),
(82, 'Message', '2014-11-26 15:58:29', '2014-11-26 15:58:29', 0, 'test', 20, '26-11-2014'),
(83, 'Message', '2014-11-27 13:28:09', '2014-11-27 13:28:09', 70, 'so far so good', 21, '27-11-2014'),
(84, 'Message', '2014-11-27 13:32:06', '2014-11-27 13:32:06', 20, 'goed!', 22, '27-11-2014'),
(85, 'Message', '2014-11-27 13:52:11', '2014-11-27 13:52:11', 40, 'test', 22, '27-11-2014'),
(86, 'Message', '2014-11-27 13:52:36', '2014-11-27 13:52:36', 70, 'testtt', 21, '27-11-2014'),
(87, 'Message', '2014-11-27 13:52:42', '2014-11-27 13:52:42', 20, 'etst', 21, '27-11-2014'),
(88, 'Message', '2014-11-27 15:16:18', '2014-11-27 15:16:18', 30, 'ttestt', 28, '27-11-2014'),
(89, 'Message', '2014-11-27 15:18:58', '2014-11-27 15:18:58', 70, 'test', 28, '27-11-2014'),
(90, 'Message', '2014-11-27 15:19:29', '2014-11-27 15:19:29', 80, 'rwar', 28, '27-11-2014');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Patient`
--

CREATE TABLE `Patient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TherapistID` int(11) NOT NULL DEFAULT '0',
  `TherapyGroupID` int(11) NOT NULL DEFAULT '0',
  `ApiToken` varchar(160) DEFAULT NULL,
  `ApiTokenExpire` int(11) NOT NULL DEFAULT '0',
  `showProfile` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `TherapistID` (`TherapistID`),
  KEY `TherapyGroupID` (`TherapyGroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Gegevens worden geëxporteerd voor tabel `Patient`
--

INSERT INTO `Patient` (`ID`, `TherapistID`, `TherapyGroupID`, `ApiToken`, `ApiTokenExpire`, `showProfile`) VALUES
(3, 2, 1, NULL, 0, 1),
(4, 2, 2, NULL, 0, 1),
(5, 2, 2, NULL, 0, 1),
(6, 2, 2, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Permission`
--

CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Gegevens worden geëxporteerd voor tabel `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `Created`, `LastEdited`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(6, 'Permission', '2014-10-31 10:09:13', '2014-10-31 10:09:13', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `PermissionRole`
--

CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `PermissionRoleCode`
--

CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `QueuedJobDescriptor`
--

CREATE TABLE `QueuedJobDescriptor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('QueuedJobDescriptor') DEFAULT 'QueuedJobDescriptor',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `JobTitle` varchar(255) DEFAULT NULL,
  `Signature` varchar(64) DEFAULT NULL,
  `Implementation` varchar(64) DEFAULT NULL,
  `StartAfter` datetime DEFAULT NULL,
  `JobStarted` datetime DEFAULT NULL,
  `JobRestarted` datetime DEFAULT NULL,
  `JobFinished` datetime DEFAULT NULL,
  `TotalSteps` int(11) NOT NULL DEFAULT '0',
  `StepsProcessed` int(11) NOT NULL DEFAULT '0',
  `LastProcessedCount` int(11) NOT NULL DEFAULT '0',
  `ResumeCounts` int(11) NOT NULL DEFAULT '0',
  `SavedJobData` mediumtext,
  `SavedJobMessages` mediumtext,
  `JobStatus` varchar(16) DEFAULT NULL,
  `JobType` varchar(16) DEFAULT NULL,
  `RunAsID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RunAsID` (`RunAsID`),
  KEY `JobStatus` (`JobStatus`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `RedirectorPage`
--

CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `RedirectorPage_Live`
--

CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `RedirectorPage_versions`
--

CREATE TABLE `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteConfig`
--

CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `Theme` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Gegevens worden geëxporteerd voor tabel `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`) VALUES
(1, 'SiteConfig', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'Your Site Name', 'your tagline here', NULL, 'Anyone', 'LoggedInUsers', 'LoggedInUsers');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteConfig_EditorGroups`
--

CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteConfig_ViewerGroups`
--

CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteTree`
--

CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','TestPage','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Gegevens worden geëxporteerd voor tabel `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(2, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(3, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(4, 'ErrorPage', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2014-10-10 10:13:10', '2014-10-10 10:13:10', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteTree_EditorGroups`
--

CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteTree_ImageTracking`
--

CREATE TABLE `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteTree_LinkTracking`
--

CREATE TABLE `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteTree_Live`
--

CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','TestPage','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Gegevens worden geëxporteerd voor tabel `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(2, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(3, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(4, 'ErrorPage', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2014-10-10 10:13:10', '2014-10-10 10:13:10', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteTree_versions`
--

CREATE TABLE `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','TestPage','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Gegevens worden geëxporteerd voor tabel `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 1, 1, 1, 0, 0, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(2, 2, 1, 1, 0, 0, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(3, 3, 1, 1, 0, 0, 'Page', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(4, 4, 1, 1, 0, 0, 'ErrorPage', '2014-10-10 10:13:09', '2014-10-10 10:13:09', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(5, 5, 1, 1, 0, 0, 'ErrorPage', '2014-10-10 10:13:10', '2014-10-10 10:13:10', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SiteTree_ViewerGroups`
--

CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TherapyGroup`
--

CREATE TABLE `TherapyGroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('TherapyGroup') DEFAULT 'TherapyGroup',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `TherapistID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TherapistID` (`TherapistID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Gegevens worden geëxporteerd voor tabel `TherapyGroup`
--

INSERT INTO `TherapyGroup` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `TherapistID`) VALUES
(1, 'TherapyGroup', '2014-10-31 10:10:53', '2014-10-31 10:10:53', 'Angststoornissen', '<p>Therapie groep met angstoornissen</p>', 2),
(2, 'TherapyGroup', '2014-10-31 10:45:39', '2014-10-31 10:45:39', 'Smetvrees', '<p>Groep voor mensen met smetvrees</p>', 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VirtualPage`
--

CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VirtualPage_Live`
--

CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VirtualPage_versions`
--

CREATE TABLE `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
