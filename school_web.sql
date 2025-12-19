-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307:3307
-- Generation Time: Dec 19, 2025 at 03:45 PM
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
-- Database: `school_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `PhoneNumber` varchar(12) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `AnnualSalary` float DEFAULT NULL,
  `DinnerMoney` float DEFAULT NULL,
  `Medical` varchar(255) DEFAULT NULL,
  `BackgroundCheck` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `FirstName`, `LastName`, `PhoneNumber`, `Email`, `Address`, `AnnualSalary`, `DinnerMoney`, `Medical`, `BackgroundCheck`) VALUES
(7001, 'Alice', 'Smith', '07011112222', 'alice.smith@gmail.com', '12 Baker Street, London', 40000, 250, 'None', 1),
(7002, 'Bob', 'Johnson', '07011113333', 'bob.johnson@gmail.com', '34 King\'s Road, London', 38000.5, 220, 'Asthma', 1),
(7003, 'Clara', 'Brown', '07011114444', 'clara.brown@gmail.com', '56 Abbey Road, London', 42000, 230.5, 'Diabetes', 1),
(7004, 'David', 'Wilson', '07011115555', 'david.wilson@gmail.com', '78 Fleet Street, London', 39000.8, 210, 'None', 1),
(7005, 'Eva', 'Taylor', '07011116666', 'eva.taylor@gmail.com', '90 Oxford Street, London', 41000, 240, 'Allergy', 1),
(7007, 'Henry', 'Adams', '07011117777', 'henry.adams@gmail.com', '14 Regent Street, London', 39500, 225, 'None', 1),
(7008, 'Maya', 'Carter', '07011118888', 'maya.carter@gmail.com', '28 Kensington High Street, London', 40500, 235, 'None', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `ID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`ID`, `AdminID`, `Username`, `Password`) VALUES
(8001, 7001, 'SMITH8001@St Alphonsus.com', 'Alice8001'),
(8002, 7002, 'JOHNSON8002@St Alphonsus.com', 'Bob8002'),
(8003, 7003, 'BROWN8003@St Alphonsus.com', 'Clara8003'),
(8004, 7004, 'WILSON8004@St Alphonsus.com', 'David8004'),
(8005, 7005, 'TAYLOR8005@St Alphonsus.com', 'Eva8005'),
(8006, 7006, 'ADAMS8006@St Alphonsus.com', 'Henry8006'),
(8007, 7007, 'CARTER8007@St Alphonsus.com', 'Maya8007');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `AttendanceID` int(11) NOT NULL,
  `Present` int(11) NOT NULL,
  `Absent` int(11) NOT NULL,
  `Lateness` int(11) NOT NULL,
  `PupilsID` int(11) NOT NULL,
  `OverallAttendance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`AttendanceID`, `Present`, `Absent`, `Lateness`, `PupilsID`, `OverallAttendance`) VALUES
(1, 180, 5, 2, 1, 95),
(2, 160, 25, 5, 2, 84),
(3, 182, 3, 2, 3, 96),
(4, 150, 20, 5, 4, 85),
(5, 181, 4, 1, 5, 96),
(6, 178, 5, 2, 6, 95),
(7, 140, 30, 10, 7, 77),
(8, 182, 2, 2, 8, 97),
(9, 179, 3, 2, 9, 96),
(10, 155, 20, 10, 10, 83),
(11, 180, 4, 1, 11, 95),
(12, 182, 3, 2, 12, 97),
(13, 181, 3, 1, 13, 97),
(14, 185, 2, 1, 14, 98),
(15, 145, 25, 10, 15, 78),
(16, 180, 3, 2, 16, 96),
(17, 179, 4, 1, 17, 96),
(18, 182, 2, 2, 18, 97),
(19, 180, 3, 1, 19, 96),
(20, 181, 2, 2, 20, 97),
(21, 183, 1, 1, 21, 98),
(22, 180, 4, 1, 22, 95),
(23, 179, 3, 2, 23, 96),
(24, 182, 2, 2, 24, 97),
(25, 180, 3, 1, 25, 96),
(26, 181, 2, 2, 26, 97),
(27, 182, 3, 1, 27, 97),
(28, 180, 4, 1, 28, 95),
(29, 181, 2, 2, 29, 97),
(30, 182, 3, 1, 30, 97),
(31, 182, 3, 2, 31, 97),
(32, 180, 4, 1, 32, 95),
(33, 155, 20, 5, 33, 88),
(34, 181, 2, 2, 34, 97),
(35, 180, 3, 1, 35, 96),
(36, 179, 4, 1, 36, 96),
(37, 182, 3, 2, 37, 97),
(38, 150, 25, 5, 38, 83),
(39, 181, 2, 2, 39, 97),
(40, 180, 3, 1, 40, 96),
(41, 182, 2, 1, 41, 97),
(42, 183, 1, 1, 42, 98),
(43, 180, 3, 2, 43, 96),
(44, 179, 4, 1, 44, 96),
(45, 182, 3, 1, 45, 97),
(46, 180, 2, 2, 46, 96),
(47, 181, 3, 1, 47, 97),
(48, 182, 4, 2, 48, 96),
(49, 178, 5, 3, 49, 95),
(50, 180, 3, 1, 50, 96),
(51, 182, 2, 2, 51, 97),
(52, 179, 3, 1, 52, 96),
(53, 180, 4, 1, 53, 95),
(54, 181, 3, 2, 54, 97),
(55, 150, 20, 5, 55, 85),
(56, 182, 2, 1, 56, 97),
(57, 180, 3, 1, 57, 96),
(58, 181, 2, 2, 58, 97),
(59, 182, 3, 1, 59, 97),
(60, 180, 4, 2, 60, 96),
(61, 182, 3, 2, 61, 97),
(62, 180, 4, 1, 62, 95),
(63, 175, 15, 5, 63, 88),
(64, 181, 2, 2, 64, 97),
(65, 180, 3, 1, 65, 96),
(66, 179, 4, 1, 66, 96),
(67, 182, 3, 2, 67, 97),
(68, 150, 20, 5, 68, 83),
(69, 181, 2, 2, 69, 97),
(70, 180, 3, 1, 70, 96),
(71, 182, 2, 1, 71, 97),
(72, 183, 1, 1, 72, 98),
(73, 180, 3, 2, 73, 96),
(74, 179, 4, 1, 74, 96),
(75, 182, 3, 1, 75, 97),
(76, 180, 2, 2, 76, 96),
(77, 181, 3, 1, 77, 97),
(78, 182, 4, 2, 78, 96),
(79, 178, 5, 3, 79, 95),
(80, 180, 3, 1, 80, 96),
(81, 182, 2, 2, 81, 97),
(82, 179, 3, 1, 82, 96),
(83, 180, 4, 1, 83, 95),
(84, 181, 3, 2, 84, 97),
(85, 150, 20, 5, 85, 85),
(86, 182, 2, 1, 86, 97),
(87, 180, 3, 1, 87, 96),
(88, 181, 2, 2, 88, 97),
(89, 182, 3, 1, 89, 97),
(90, 180, 4, 2, 90, 96),
(91, 182, 3, 2, 91, 97),
(92, 180, 4, 1, 92, 95),
(93, 181, 2, 2, 93, 97),
(94, 155, 15, 5, 94, 88),
(95, 180, 3, 1, 95, 96),
(96, 179, 4, 1, 96, 96),
(97, 182, 3, 2, 97, 97),
(98, 181, 2, 2, 98, 97),
(99, 180, 3, 1, 99, 96),
(100, 182, 2, 1, 100, 97),
(101, 183, 1, 1, 101, 98),
(102, 180, 3, 2, 102, 96),
(103, 179, 4, 1, 103, 96),
(104, 182, 3, 1, 104, 97),
(105, 180, 2, 2, 105, 96),
(106, 181, 3, 1, 106, 97),
(107, 182, 4, 2, 107, 96),
(108, 178, 5, 3, 108, 95),
(109, 180, 3, 1, 109, 96),
(110, 182, 2, 2, 110, 97),
(111, 179, 3, 1, 111, 96),
(112, 180, 4, 1, 112, 95),
(113, 181, 3, 2, 113, 97),
(114, 182, 2, 1, 114, 97),
(115, 180, 4, 2, 115, 96),
(116, 150, 20, 5, 116, 85),
(117, 182, 2, 1, 117, 97),
(118, 180, 3, 1, 118, 96),
(119, 181, 2, 2, 119, 97),
(120, 182, 3, 1, 120, 97),
(121, 182, 3, 2, 121, 97),
(122, 180, 4, 1, 122, 95),
(123, 181, 2, 2, 123, 97),
(124, 155, 15, 5, 124, 88),
(125, 180, 3, 1, 125, 96),
(126, 179, 4, 1, 126, 96),
(127, 182, 3, 2, 127, 97),
(128, 181, 2, 2, 128, 97),
(129, 180, 3, 1, 129, 96),
(130, 182, 2, 1, 130, 97),
(131, 183, 1, 1, 131, 98),
(132, 180, 3, 2, 132, 96),
(133, 179, 4, 1, 133, 96),
(134, 182, 3, 1, 134, 97),
(135, 180, 2, 2, 135, 96),
(136, 181, 3, 1, 136, 97),
(137, 182, 4, 2, 137, 96),
(138, 178, 5, 3, 138, 95),
(139, 180, 3, 1, 139, 96),
(140, 182, 2, 2, 140, 97),
(141, 179, 3, 1, 141, 96),
(142, 180, 4, 1, 142, 95),
(143, 181, 3, 2, 143, 97),
(144, 182, 2, 1, 144, 97),
(145, 180, 4, 2, 145, 96),
(146, 150, 20, 5, 146, 85),
(147, 182, 2, 1, 147, 97),
(148, 180, 3, 1, 148, 96),
(149, 181, 2, 2, 149, 97),
(150, 155, 15, 5, 150, 88),
(181, 182, 3, 2, 181, 97),
(182, 180, 4, 1, 182, 95),
(183, 181, 2, 2, 183, 97),
(184, 155, 15, 5, 184, 88),
(185, 180, 3, 1, 185, 96),
(186, 179, 4, 1, 186, 96),
(187, 182, 3, 2, 187, 97),
(188, 181, 2, 2, 188, 97),
(189, 180, 3, 1, 189, 96),
(190, 182, 2, 1, 190, 97),
(191, 183, 1, 1, 191, 98),
(192, 180, 3, 2, 192, 96),
(193, 179, 4, 1, 193, 96),
(194, 182, 3, 1, 194, 97),
(195, 180, 2, 2, 195, 96),
(196, 181, 3, 1, 196, 97),
(197, 182, 4, 2, 197, 96),
(198, 178, 5, 3, 198, 95),
(199, 180, 3, 1, 199, 96),
(200, 182, 2, 2, 200, 97),
(201, 179, 3, 1, 201, 96),
(202, 150, 20, 5, 202, 85),
(203, 181, 3, 2, 203, 97),
(204, 182, 2, 1, 204, 97),
(205, 180, 4, 2, 205, 96),
(206, 155, 15, 5, 206, 88),
(207, 182, 2, 1, 207, 97),
(208, 180, 3, 1, 208, 96),
(209, 181, 2, 2, 209, 97),
(210, 182, 3, 1, 210, 97),
(211, 182, 3, 2, 211, 97),
(212, 180, 4, 1, 212, 95),
(213, 155, 15, 5, 213, 88);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassID` int(11) NOT NULL,
  `ClassName` varchar(25) NOT NULL,
  `Size` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `TeachingAssistantID` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `ClassName`, `Size`, `Capacity`, `TeachingAssistantID`, `TeacherID`) VALUES
(1, 'Reception', 30, 30, 2000, 1000),
(2, 'Year 1', 30, 30, 2001, 1001),
(3, 'Year 2', 30, 30, 2002, 1002),
(4, 'Year 3', 30, 30, 2003, 1003),
(5, 'Year 4', 30, 30, 2004, 1004),
(6, 'Year 5', 30, 30, 2005, 1005),
(7, 'Year 6', 30, 30, 2006, 1006);

-- --------------------------------------------------------

--
-- Table structure for table `parentpupil`
--

CREATE TABLE `parentpupil` (
  `ParentPupilID` int(11) NOT NULL,
  `PupilsID` int(11) NOT NULL,
  `ParentsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentpupil`
--

INSERT INTO `parentpupil` (`ParentPupilID`, `PupilsID`, `ParentsID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40),
(41, 41, 41),
(42, 42, 42),
(43, 43, 43),
(44, 44, 44),
(45, 45, 45),
(46, 46, 46),
(47, 47, 47),
(48, 48, 48),
(49, 49, 49),
(50, 50, 50),
(51, 51, 51),
(52, 52, 52),
(53, 53, 53),
(54, 54, 54),
(55, 55, 55),
(56, 56, 56),
(57, 57, 57),
(58, 58, 58),
(59, 59, 59),
(60, 60, 60),
(61, 61, 61),
(62, 62, 62),
(63, 63, 63),
(64, 64, 64),
(65, 65, 65),
(66, 66, 66),
(67, 67, 67),
(68, 68, 68),
(69, 69, 69),
(70, 70, 70),
(71, 71, 71),
(72, 72, 72),
(73, 73, 73),
(74, 74, 74),
(75, 75, 75),
(76, 76, 76),
(77, 77, 77),
(78, 78, 78),
(79, 79, 79),
(80, 80, 80),
(81, 81, 81),
(82, 82, 82),
(83, 83, 83),
(84, 84, 84),
(85, 85, 85),
(86, 86, 86),
(87, 87, 87),
(88, 88, 88),
(89, 89, 89),
(90, 90, 90),
(91, 91, 91),
(92, 92, 92),
(93, 93, 93),
(94, 94, 94),
(95, 95, 95),
(96, 96, 96),
(97, 97, 97),
(98, 98, 98),
(99, 99, 99),
(100, 100, 100),
(101, 101, 101),
(102, 102, 102),
(103, 103, 103),
(104, 104, 104),
(105, 105, 105),
(106, 106, 106),
(107, 107, 107),
(108, 108, 108),
(109, 109, 109),
(110, 110, 110),
(111, 111, 111),
(112, 112, 112),
(113, 113, 113),
(114, 114, 114),
(115, 115, 115),
(116, 116, 116),
(117, 117, 117),
(118, 118, 118),
(119, 119, 119),
(120, 120, 120),
(121, 121, 121),
(122, 122, 122),
(123, 123, 123),
(124, 124, 124),
(125, 125, 125),
(126, 126, 126),
(127, 127, 127),
(128, 128, 128),
(129, 129, 129),
(130, 130, 130),
(131, 131, 131),
(132, 132, 132),
(133, 133, 133),
(134, 134, 134),
(135, 135, 135),
(136, 136, 136),
(137, 137, 137),
(138, 138, 138),
(139, 139, 139),
(140, 140, 140),
(141, 141, 141),
(142, 142, 142),
(143, 143, 143),
(144, 144, 144),
(145, 145, 145),
(146, 146, 146),
(147, 147, 147),
(148, 148, 148),
(149, 149, 149),
(150, 150, 150),
(151, 151, 151),
(152, 152, 152),
(153, 153, 153),
(154, 154, 154),
(155, 155, 155),
(156, 156, 156),
(157, 157, 157),
(158, 158, 158),
(159, 159, 159),
(160, 160, 160),
(161, 161, 161),
(162, 162, 162),
(163, 163, 163),
(164, 164, 164),
(165, 165, 165),
(166, 166, 166),
(167, 167, 167),
(168, 168, 168),
(169, 169, 169),
(170, 170, 170),
(171, 171, 171),
(172, 172, 172),
(173, 173, 173),
(174, 174, 174),
(175, 175, 175),
(176, 176, 176),
(177, 177, 177),
(178, 178, 178),
(179, 179, 179),
(180, 180, 180),
(181, 181, 181),
(182, 182, 182),
(183, 183, 183),
(184, 184, 184),
(185, 185, 185),
(186, 186, 186),
(187, 187, 187),
(188, 188, 188),
(189, 189, 189),
(190, 190, 190),
(191, 191, 191),
(192, 192, 192),
(193, 193, 193),
(194, 194, 194),
(195, 195, 195),
(196, 196, 196),
(197, 197, 197),
(198, 198, 198),
(199, 199, 199),
(200, 200, 200),
(201, 201, 201),
(202, 202, 202),
(203, 203, 203),
(204, 204, 204),
(205, 205, 205),
(206, 206, 206),
(207, 207, 207),
(208, 208, 208),
(209, 209, 209),
(210, 210, 210),
(211, 211, 211),
(212, 212, 212),
(213, 213, 213);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `ParentsID` int(11) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `PhoneNumber` varchar(12) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`ParentsID`, `FirstName`, `LastName`, `PhoneNumber`, `Email`, `Address`) VALUES
(1, 'Robert', 'Smith', '07123456789', 'robert.smith@email.com', '12 Oak Street'),
(2, 'Sarah', 'Johnson', '07234567890', 'sarah.johnson@email.com', '34 Pine Avenue'),
(3, 'Karen', 'Brown', '07345678901', 'karen.brown@email.com', '56 Maple Road'),
(4, 'David', 'Davis', '07456789012', 'david.davis@email.com', '78 Birch Lane'),
(5, 'Michael', 'Miller', '07567890123', 'michael.miller@email.com', '90 Cedar Street'),
(6, 'Laura', 'Wilson', '07678901234', 'laura.wilson@email.com', '11 Spruce Avenue'),
(7, 'James', 'Taylor', '07789012345', 'james.taylor@email.com', '22 Elm Road'),
(8, 'Patricia', 'Moore', '07890123456', 'patricia.moore@email.com', '33 Willow Lane'),
(9, 'Robert', 'Anderson', '07901234567', 'robert.anderson@email.com', '44 Cherry Street'),
(10, 'Linda', 'Thomas', '07012345678', 'linda.thomas@email.com', '55 Walnut Avenue'),
(11, 'John', 'White', '07123456780', 'john.white@email.com', '66 Aspen Road'),
(12, 'Barbara', 'Harris', '07234567881', 'barbara.harris@email.com', '77 Magnolia Lane'),
(13, 'William', 'Martin', '07345678982', 'william.martin@email.com', '88 Poplar Street'),
(14, 'Elizabeth', 'Lee', '07456789083', 'elizabeth.lee@email.com', '99 Beech Avenue'),
(15, 'Richard', 'Walker', '07567890184', 'richard.walker@email.com', '101 Maple Lane'),
(16, 'Jennifer', 'Hall', '07678901285', 'jennifer.hall@email.com', '202 Oak Road'),
(17, 'Thomas', 'Allen', '07789012386', 'thomas.allen@email.com', '303 Pine Street'),
(18, 'Susan', 'Young', '07890123487', 'susan.young@email.com', '404 Cedar Avenue'),
(19, 'Charles', 'King', '07012345688', 'charles.king@email.com', '505 Birch Lane'),
(20, 'Jessica', 'Wright', '07123456789', 'jessica.wright@email.com', '606 Spruce Street'),
(21, 'Daniel', 'Scott', '07234567890', 'daniel.scott@email.com', '707 Elm Avenue'),
(22, 'Sarah', 'Green', '07345678901', 'sarah.green@email.com', '808 Willow Road'),
(23, 'Anthony', 'Adams', '07456789012', 'anthony.adams@email.com', '909 Poplar Lane'),
(24, 'Nancy', 'Baker', '07567890123', 'nancy.baker@email.com', '1010 Cherry Street'),
(25, 'Kevin', 'Gonzalez', '07678901234', 'kevin.gonzalez@email.com', '1111 Oak Avenue'),
(26, 'Angela', 'Nelson', '07789012345', 'angela.nelson@email.com', '1212 Maple Street'),
(27, 'Brian', 'Carter', '07890123456', 'brian.carter@email.com', '1313 Pine Lane'),
(28, 'Melissa', 'Mitchell', '07012345678', 'melissa.mitchell@email.co', '1414 Cedar Road'),
(29, 'Robert', 'Smith', '07123456789', 'robert.smith@email.com', '12 Oak Street'),
(30, 'Sarah', 'Johnson', '07234567890', 'sarah.johnson@email.com', '34 Pine Avenue'),
(31, 'Karen', 'Brown', '07345678901', 'karen.brown@email.com', '56 Maple Road'),
(32, 'David', 'Davis', '07456789012', 'david.davis@email.com', '78 Birch Lane'),
(33, 'Michael', 'Miller', '07567890123', 'michael.miller@email.com', '90 Cedar Street'),
(34, 'Laura', 'Wilson', '07678901234', 'laura.wilson@email.com', '11 Spruce Avenue'),
(35, 'James', 'Taylor', '07789012345', 'james.taylor@email.com', '22 Elm Road'),
(36, 'Patricia', 'Moore', '07890123456', 'patricia.moore@email.com', '33 Willow Lane'),
(37, 'Robert', 'Anderson', '07012345678', 'robert.anderson@email.com', '44 Cherry Street'),
(38, 'Linda', 'Thomas', '07123456780', 'linda.thomas@email.com', '55 Walnut Avenue'),
(39, 'John', 'White', '07234567881', 'john.white@email.com', '66 Aspen Road'),
(40, 'Barbara', 'Harris', '07345678982', 'barbara.harris@email.com', '77 Magnolia Lane'),
(41, 'William', 'Martin', '07456789083', 'william.martin@email.com', '88 Poplar Street'),
(42, 'Elizabeth', 'Lee', '07567890184', 'elizabeth.lee@email.com', '99 Beech Avenue'),
(43, 'Richard', 'Walker', '07678901285', 'richard.walker@email.com', '101 Maple Lane'),
(44, 'Jennifer', 'Hall', '07789012386', 'jennifer.hall@email.com', '202 Oak Road'),
(45, 'Thomas', 'Allen', '07890123487', 'thomas.allen@email.com', '303 Pine Street'),
(46, 'Susan', 'Young', '07012345688', 'susan.young@email.com', '404 Cedar Avenue'),
(47, 'Charles', 'King', '07123456789', 'charles.king@email.com', '505 Birch Lane'),
(48, 'Jessica', 'Wright', '07234567890', 'jessica.wright@email.com', '606 Spruce Street'),
(49, 'Daniel', 'Scott', '07345678901', 'daniel.scott@email.com', '707 Elm Avenue'),
(50, 'Sarah', 'Green', '07456789012', 'sarah.green@email.com', '808 Willow Road'),
(51, 'Anthony', 'Adams', '07567890123', 'anthony.adams@email.com', '909 Poplar Lane'),
(52, 'Nancy', 'Baker', '07678901234', 'nancy.baker@email.com', '1010 Cherry Street'),
(53, 'Kevin', 'Gonzalez', '07789012345', 'kevin.gonzalez@email.com', '1111 Oak Avenue'),
(54, 'Angela', 'Nelson', '07890123456', 'angela.nelson@email.com', '1212 Maple Street'),
(55, 'Brian', 'Carter', '07012345678', 'brian.carter@email.com', '1313 Pine Lane'),
(56, 'Melissa', 'Mitchell', '07123456789', 'melissa.mitchell@email.co', '1414 Cedar Road'),
(57, 'Robert', 'Perez', '07234567890', 'robert.perez@email.com', '1515 Oak Lane'),
(58, 'Laura', 'Roberts', '07345678901', 'laura.roberts@email.com', '1616 Maple Avenue'),
(59, 'Robert', 'Smith', '07123456789', 'robert.smith@email.com', '12 Oak Street'),
(60, 'Laura', 'Evans', '07234567890', 'laura.evans@email.com', '202 Maple Road'),
(61, 'Sarah', 'Johnson', '07345678901', 'sarah.johnson@email.com', '34 Pine Avenue'),
(62, 'Karen', 'Brown', '07456789012', 'karen.brown@email.com', '56 Maple Road'),
(63, 'David', 'Davis', '07567890123', 'david.davis@email.com', '78 Birch Lane'),
(64, 'Michael', 'Miller', '07678901234', 'michael.miller@email.com', '90 Cedar Street'),
(65, 'Laura', 'Wilson', '07789012345', 'laura.wilson@email.com', '11 Spruce Avenue'),
(66, 'James', 'Taylor', '07890123456', 'james.taylor@email.com', '22 Elm Road'),
(67, 'Patricia', 'Moore', '07012345678', 'patricia.moore@email.com', '33 Willow Lane'),
(68, 'Robert', 'Anderson', '07123456780', 'robert.anderson@email.com', '44 Cherry Street'),
(69, 'Linda', 'Thomas', '07234567881', 'linda.thomas@email.com', '55 Walnut Avenue'),
(70, 'John', 'White', '07345678982', 'john.white@email.com', '66 Aspen Road'),
(71, 'Barbara', 'Harris', '07456789083', 'barbara.harris@email.com', '77 Magnolia Lane'),
(72, 'William', 'Martin', '07567890184', 'william.martin@email.com', '88 Poplar Street'),
(73, 'Elizabeth', 'Lee', '07678901285', 'elizabeth.lee@email.com', '99 Beech Avenue'),
(74, 'Richard', 'Walker', '07789012386', 'richard.walker@email.com', '101 Maple Lane'),
(75, 'Jennifer', 'Hall', '07890123487', 'jennifer.hall@email.com', '202 Oak Road'),
(76, 'Thomas', 'Allen', '07012345688', 'thomas.allen@email.com', '303 Pine Street'),
(77, 'Susan', 'Young', '07123456789', 'susan.young@email.com', '404 Cedar Avenue'),
(78, 'Charles', 'King', '07234567890', 'charles.king@email.com', '505 Birch Lane'),
(79, 'Jessica', 'Wright', '07345678901', 'jessica.wright@email.com', '606 Spruce Street'),
(80, 'Daniel', 'Scott', '07456789012', 'daniel.scott@email.com', '707 Elm Avenue'),
(81, 'Sarah', 'Green', '07567890123', 'sarah.green@email.com', '808 Willow Road'),
(82, 'Anthony', 'Adams', '07678901234', 'anthony.adams@email.com', '909 Poplar Lane'),
(83, 'Nancy', 'Baker', '07789012345', 'nancy.baker@email.com', '1010 Cherry Street'),
(84, 'Kevin', 'Gonzalez', '07890123456', 'kevin.gonzalez@email.com', '1111 Oak Avenue'),
(85, 'Angela', 'Nelson', '07012345678', 'angela.nelson@email.com', '1212 Maple Street'),
(86, 'Brian', 'Carter', '07123456789', 'brian.carter@email.com', '1313 Pine Lane'),
(87, 'Melissa', 'Mitchell', '07234567890', 'melissa.mitchell@email.co', '1414 Cedar Road'),
(88, 'Robert', 'Smith', '07123456789', 'robert.smith@email.com', '12 Oak Street'),
(89, 'Karen', 'Brown', '07345678901', 'karen.brown@email.com', '56 Maple Road'),
(90, 'David', 'Davis', '07456789012', 'david.davis@email.com', '78 Birch Lane'),
(91, 'Michael', 'Miller', '07567890123', 'michael.miller@email.com', '90 Cedar Street'),
(92, 'Laura', 'Wilson', '07678901234', 'laura.wilson@email.com', '11 Spruce Avenue'),
(93, 'James', 'Taylor', '07789012345', 'james.taylor@email.com', '22 Elm Road'),
(94, 'Patricia', 'Moore', '07890123456', 'patricia.moore@email.com', '33 Willow Lane'),
(95, 'Robert', 'Anderson', '07012345678', 'robert.anderson@email.com', '44 Cherry Street'),
(96, 'Linda', 'Thomas', '07123456780', 'linda.thomas@email.com', '55 Walnut Avenue'),
(97, 'John', 'White', '07234567881', 'john.white@email.com', '66 Aspen Road'),
(98, 'Barbara', 'Harris', '07345678982', 'barbara.harris@email.com', '77 Magnolia Lane'),
(99, 'William', 'Martin', '07456789083', 'william.martin@email.com', '88 Poplar Street'),
(100, 'Elizabeth', 'Lee', '07567890184', 'elizabeth.lee@email.com', '99 Beech Avenue'),
(101, 'Richard', 'Walker', '07678901285', 'richard.walker@email.com', '101 Maple Lane'),
(102, 'Jennifer', 'Hall', '07789012386', 'jennifer.hall@email.com', '202 Oak Road'),
(103, 'Thomas', 'Allen', '07890123487', 'thomas.allen@email.com', '303 Pine Street'),
(104, 'Susan', 'Young', '07012345688', 'susan.young@email.com', '404 Cedar Avenue'),
(105, 'Charles', 'King', '07123456789', 'charles.king@email.com', '505 Birch Lane'),
(106, 'Jessica', 'Wright', '07234567890', 'jessica.wright@email.com', '606 Spruce Street'),
(107, 'Daniel', 'Scott', '07345678901', 'daniel.scott@email.com', '707 Elm Avenue'),
(108, 'Sarah', 'Green', '07456789012', 'sarah.green@email.com', '808 Willow Road'),
(109, 'Anthony', 'Adams', '07567890123', 'anthony.adams@email.com', '909 Poplar Lane'),
(110, 'Nancy', 'Baker', '07678901234', 'nancy.baker@email.com', '1010 Cherry Street'),
(111, 'Kevin', 'Gonzalez', '07789012345', 'kevin.gonzalez@email.com', '1111 Oak Avenue'),
(112, 'Angela', 'Nelson', '07890123456', 'angela.nelson@email.com', '1212 Maple Street'),
(113, 'Brian', 'Carter', '07012345678', 'brian.carter@email.com', '1313 Pine Lane'),
(114, 'Melissa', 'Mitchell', '07123456789', 'melissa.mitchell@email.co', '1414 Cedar Road'),
(115, 'Robert', 'Perez', '07234567890', 'robert.perez@email.com', '1515 Oak Lane'),
(116, 'Laura', 'Roberts', '07345678901', 'laura.roberts@email.com', '1616 Maple Avenue'),
(117, 'William', 'Clark', '07456789012', 'william.clark@email.com', '1717 Pine Street'),
(118, 'Helen', 'Ford', '07123456789', 'helen.ford@email.com', '1 Willow Lane'),
(119, 'Karen', 'Hall', '07234567890', 'karen.hall@email.com', '2 Maple Street'),
(120, 'David', 'Bell', '07345678901', 'david.bell@email.com', '3 Oak Avenue'),
(121, 'Michael', 'Hunt', '07456789012', 'michael.hunt@email.com', '4 Birch Road'),
(122, 'Laura', 'Cole', '07567890123', 'laura.cole@email.com', '5 Cedar Lane'),
(123, 'James', 'Knight', '07678901234', 'james.knight@email.com', '6 Pine Street'),
(124, 'Patricia', 'Webb', '07789012345', 'patricia.webb@email.com', '7 Spruce Avenue'),
(125, 'Robert', 'Reed', '07890123456', 'robert.reed@email.com', '8 Cherry Lane'),
(126, 'Linda', 'Fox', '07012345678', 'linda.fox@email.com', '9 Poplar Road'),
(127, 'John', 'Page', '07123456780', 'john.page@email.com', '10 Maple Lane'),
(128, 'Barbara', 'Cross', '07234567881', 'barbara.cross@email.com', '11 Oak Lane'),
(129, 'William', 'Grant', '07345678982', 'william.grant@email.com', '12 Cedar Road'),
(130, 'Elizabeth', 'Carter', '07456789083', 'elizabeth.carter@email.co', '13 Pine Avenue'),
(131, 'Richard', 'Coleman', '07567890184', 'richard.coleman@email.com', '14 Spruce Lane'),
(132, 'Jennifer', 'Frost', '07678901285', 'jennifer.frost@email.com', '15 Maple Street'),
(133, 'Thomas', 'Hayes', '07789012386', 'thomas.hayes@email.com', '16 Oak Avenue'),
(134, 'Susan', 'Shaw', '07890123487', 'susan.shaw@email.com', '17 Birch Lane'),
(135, 'Charles', 'Tate', '07012345688', 'charles.tate@email.com', '18 Cedar Street'),
(136, 'Jessica', 'Wells', '07123456789', 'jessica.wells@email.com', '19 Pine Lane'),
(137, 'Daniel', 'Lane', '07234567890', 'daniel.lane@email.com', '20 Spruce Road'),
(138, 'Sarah', 'Reid', '07345678901', 'sarah.reid@email.com', '21 Maple Avenue'),
(139, 'Anthony', 'Mason', '07456789012', 'anthony.mason@email.com', '22 Oak Street'),
(140, 'Nancy', 'Dean', '07567890123', 'nancy.dean@email.com', '23 Birch Road'),
(141, 'Kevin', 'Cole', '07678901234', 'kevin.cole@email.com', '24 Cedar Lane'),
(142, 'Angela', 'Bennett', '07789012345', 'angela.bennett@email.com', '25 Pine Street'),
(143, 'Brian', 'Reynolds', '07890123456', 'brian.reynolds@email.com', '26 Spruce Avenue'),
(144, 'Melissa', 'Webster', '07012345678', 'melissa.webster@email.com', '27 Maple Road'),
(145, 'Robert', 'Holloway', '07123456789', 'robert.holloway@email.com', '28 Oak Lane'),
(146, 'Laura', 'Franklin', '07234567890', 'laura.franklin@email.com', '29 Birch Street'),
(147, 'William', 'Palmer', '07345678901', 'william.palmer@email.com', '30 Cedar Avenue'),
(148, 'Helen', 'Ford', '07123456789', 'helen.ford@email.com', '1 Willow Lane'),
(149, 'Karen', 'Harper', '07234567890', 'karen.harper@email.com', '2 Maple Street'),
(150, 'David', 'Lane', '07345678901', 'david.lane@email.com', '3 Oak Avenue'),
(151, 'Michael', 'Fletcher', '07456789012', 'michael.fletcher@email.co', '4 Birch Road'),
(152, 'Laura', 'Morrison', '07567890123', 'laura.morrison@email.com', '5 Cedar Lane'),
(153, 'James', 'Webb', '07678901234', 'james.webb@email.com', '6 Pine Street'),
(154, 'Patricia', 'Fox', '07789012345', 'patricia.fox@email.com', '7 Spruce Avenue'),
(155, 'Robert', 'Page', '07890123456', 'robert.page@email.com', '8 Cherry Lane'),
(156, 'Linda', 'Cross', '07012345678', 'linda.cross@email.com', '9 Poplar Road'),
(157, 'John', 'Grant', '07123456780', 'john.grant@email.com', '10 Maple Lane'),
(158, 'Barbara', 'Carter', '07234567881', 'barbara.carter@email.com', '11 Oak Lane'),
(159, 'William', 'Coleman', '07345678982', 'william.coleman@email.com', '12 Cedar Road'),
(160, 'Elizabeth', 'Frost', '07456789083', 'elizabeth.frost@email.com', '13 Pine Avenue'),
(161, 'Richard', 'Hayes', '07567890184', 'richard.hayes@email.com', '14 Spruce Lane'),
(162, 'Jennifer', 'Shaw', '07678901285', 'jennifer.shaw@email.com', '15 Maple Street'),
(163, 'Thomas', 'Tate', '07789012386', 'thomas.tate@email.com', '16 Oak Avenue'),
(164, 'Susan', 'Wells', '07890123487', 'susan.wells@email.com', '17 Birch Lane'),
(165, 'Charles', 'Lane', '07012345688', 'charles.lane@email.com', '18 Cedar Street'),
(166, 'Jessica', 'Dean', '07123456789', 'jessica.dean@email.com', '19 Pine Lane'),
(167, 'Daniel', 'Mason', '07234567890', 'daniel.mason@email.com', '20 Spruce Road'),
(168, 'Sarah', 'Webster', '07345678901', 'sarah.webster@email.com', '21 Maple Avenue'),
(169, 'Anthony', 'Bennett', '07456789012', 'anthony.bennett@email.com', '22 Oak Street'),
(170, 'Nancy', 'Holloway', '07567890123', 'nancy.holloway@email.com', '23 Birch Road'),
(171, 'Kevin', 'Franklin', '07678901234', 'kevin.franklin@email.com', '24 Cedar Lane'),
(172, 'Angela', 'Palmer', '07789012345', 'angela.palmer@email.com', '25 Pine Street'),
(173, 'Brian', 'Frost', '07890123456', 'brian.frost@email.com', '26 Spruce Avenue'),
(174, 'Melissa', 'Hunt', '07012345678', 'melissa.hunt@email.com', '27 Maple Road'),
(175, 'Robert', 'Cole', '07123456789', 'robert.cole@email.com', '28 Oak Lane'),
(176, 'Laura', 'Frost', '07234567890', 'laura.frost@email.com', '29 Birch Street'),
(177, 'William', 'Cole', '07345678901', 'william.cole@email.com', '30 Cedar Avenue'),
(178, 'Helen', 'Ford', '07123456789', 'helen.ford@email.com', '1 Willow Lane'),
(179, 'Karen', 'Harper', '07234567890', 'karen.harper@email.com', '2 Maple Street'),
(180, 'David', 'Lane', '07345678901', 'david.lane@email.com', '3 Oak Avenue'),
(181, 'Michael', 'Fletcher', '07456789012', 'michael.fletcher@email.co', '4 Birch Road'),
(182, 'Laura', 'Morrison', '07567890123', 'laura.morrison@email.com', '5 Cedar Lane'),
(183, 'James', 'Webb', '07678901234', 'james.webb@email.com', '6 Pine Street'),
(184, 'Patricia', 'Fox', '07789012345', 'patricia.fox@email.com', '7 Spruce Avenue'),
(185, 'Robert', 'Page', '07890123456', 'robert.page@email.com', '8 Cherry Lane'),
(186, 'Linda', 'Cross', '07012345678', 'linda.cross@email.com', '9 Poplar Road'),
(187, 'John', 'Grant', '07123456780', 'john.grant@email.com', '10 Maple Lane'),
(188, 'Barbara', 'Carter', '07234567881', 'barbara.carter@email.com', '11 Oak Lane'),
(189, 'William', 'Coleman', '07345678982', 'william.coleman@email.com', '12 Cedar Road'),
(190, 'Elizabeth', 'Frost', '07456789083', 'elizabeth.frost@email.com', '13 Pine Avenue'),
(191, 'Richard', 'Hayes', '07567890184', 'richard.hayes@email.com', '14 Spruce Lane'),
(192, 'Jennifer', 'Shaw', '07678901285', 'jennifer.shaw@email.com', '15 Maple Street'),
(193, 'Thomas', 'Tate', '07789012386', 'thomas.tate@email.com', '16 Oak Avenue'),
(194, 'Susan', 'Wells', '07890123487', 'susan.wells@email.com', '17 Birch Lane'),
(195, 'Charles', 'Dean', '07012345688', 'charles.dean@email.com', '18 Cedar Street'),
(196, 'Jessica', 'Mason', '07123456789', 'jessica.mason@email.com', '19 Pine Lane'),
(197, 'Daniel', 'Webster', '07234567890', 'daniel.webster@email.com', '20 Spruce Road'),
(198, 'Sarah', 'Bennett', '07345678901', 'sarah.bennett@email.com', '21 Maple Avenue'),
(199, 'Anthony', 'Holloway', '07456789012', 'anthony.holloway@email.co', '22 Oak Street'),
(200, 'Nancy', 'Franklin', '07567890123', 'nancy.franklin@email.com', '23 Birch Road'),
(201, 'Kevin', 'Palmer', '07678901234', 'kevin.palmer@email.com', '24 Cedar Lane'),
(202, 'Angela', 'Frost', '07789012345', 'angela.frost@email.com', '25 Pine Street'),
(203, 'Brian', 'Hunt', '07890123456', 'brian.hunt@email.com', '26 Spruce Avenue'),
(204, 'Melissa', 'Cole', '07012345678', 'melissa.cole@email.com', '27 Maple Road'),
(205, 'Robert', 'Knight', '07123456789', 'robert.knight@email.com', '28 Oak Lane'),
(206, 'Laura', 'Carter', '07234567890', 'laura.carter@email.com', '29 Birch Street'),
(207, 'William', 'Palmer', '07345678901', 'william.palmer@email.com', '30 Cedar Avenue');

-- --------------------------------------------------------

--
-- Table structure for table `parent_login`
--

CREATE TABLE `parent_login` (
  `ID` int(11) NOT NULL,
  `ParentsID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parent_login`
--

INSERT INTO `parent_login` (`ID`, `ParentsID`, `Username`, `Password`) VALUES
(1, 1, '1Smith@StAlphonsus.com', 'Robert1'),
(2, 2, '2Johnson@StAlphonsus.com', 'Sarah2'),
(3, 3, '3Brown@StAlphonsus.com', 'Karen3'),
(4, 4, '4Davis@StAlphonsus.com', 'David4'),
(5, 5, '5Miller@StAlphonsus.com', 'Michael5'),
(6, 6, '6Wilson@StAlphonsus.com', 'Laura6'),
(7, 7, '7Taylor@StAlphonsus.com', 'James7'),
(8, 8, '8Moore@StAlphonsus.com', 'Patricia8'),
(9, 9, '9Anderson@StAlphonsus.com', 'Robert9'),
(10, 10, '10Thomas@StAlphonsus.com', 'Linda10'),
(11, 11, '11White@StAlphonsus.com', 'John11'),
(12, 12, '12Harris@StAlphonsus.com', 'Barbara12'),
(13, 13, '13Martin@StAlphonsus.com', 'William13'),
(14, 14, '14Lee@StAlphonsus.com', 'Elizabeth14'),
(15, 15, '15Walker@StAlphonsus.com', 'Richard15'),
(16, 16, '16Hall@StAlphonsus.com', 'Jennifer16'),
(17, 17, '17Allen@StAlphonsus.com', 'Thomas17'),
(18, 18, '18Young@StAlphonsus.com', 'Susan18'),
(19, 19, '19King@StAlphonsus.com', 'Charles19'),
(20, 20, '20Wright@StAlphonsus.com', 'Jessica20'),
(21, 21, '21Scott@StAlphonsus.com', 'Daniel21'),
(22, 22, '22Green@StAlphonsus.com', 'Sarah22'),
(23, 23, '23Adams@StAlphonsus.com', 'Anthony23'),
(24, 24, '24Baker@StAlphonsus.com', 'Nancy24'),
(25, 25, '25Gonzalez@StAlphonsus.com', 'Kevin25'),
(26, 26, '26Nelson@StAlphonsus.com', 'Angela26'),
(27, 27, '27Carter@StAlphonsus.com', 'Brian27'),
(28, 28, '28Mitchell@StAlphonsus.com', 'Melissa28'),
(29, 29, '29Smith@StAlphonsus.com', 'Robert29'),
(30, 30, '30Johnson@StAlphonsus.com', 'Sarah30'),
(31, 31, '31Brown@StAlphonsus.com', 'Karen31'),
(32, 32, '32Davis@StAlphonsus.com', 'David32'),
(33, 33, '33Miller@StAlphonsus.com', 'Michael33'),
(34, 34, '34Wilson@StAlphonsus.com', 'Laura34'),
(35, 35, '35Taylor@StAlphonsus.com', 'James35'),
(36, 36, '36Moore@StAlphonsus.com', 'Patricia36'),
(37, 37, '37Anderson@StAlphonsus.com', 'Robert37'),
(38, 38, '38Thomas@StAlphonsus.com', 'Linda38'),
(39, 39, '39White@StAlphonsus.com', 'John39'),
(40, 40, '40Harris@StAlphonsus.com', 'Barbara40'),
(41, 41, '41Martin@StAlphonsus.com', 'William41'),
(42, 42, '42Lee@StAlphonsus.com', 'Elizabeth42'),
(43, 43, '43Walker@StAlphonsus.com', 'Richard43'),
(44, 44, '44Hall@StAlphonsus.com', 'Jennifer44'),
(45, 45, '45Allen@StAlphonsus.com', 'Thomas45'),
(46, 46, '46Young@StAlphonsus.com', 'Susan46'),
(47, 47, '47King@StAlphonsus.com', 'Charles47'),
(48, 48, '48Wright@StAlphonsus.com', 'Jessica48'),
(49, 49, '49Scott@StAlphonsus.com', 'Daniel49'),
(50, 50, '50Green@StAlphonsus.com', 'Sarah50'),
(51, 51, '51Adams@StAlphonsus.com', 'Anthony51'),
(52, 52, '52Baker@StAlphonsus.com', 'Nancy52'),
(53, 53, '53Gonzalez@StAlphonsus.com', 'Kevin53'),
(54, 54, '54Nelson@StAlphonsus.com', 'Angela54'),
(55, 55, '55Carter@StAlphonsus.com', 'Brian55'),
(56, 56, '56Mitchell@StAlphonsus.com', 'Melissa56'),
(57, 57, '57Perez@StAlphonsus.com', 'Robert57'),
(58, 58, '58Roberts@StAlphonsus.com', 'Laura58'),
(59, 59, '59Smith@StAlphonsus.com', 'Robert59'),
(60, 60, '60Evans@StAlphonsus.com', 'Laura60'),
(61, 61, '61Johnson@StAlphonsus.com', 'Sarah61'),
(62, 62, '62Brown@StAlphonsus.com', 'Karen62'),
(63, 63, '63Davis@StAlphonsus.com', 'David63'),
(64, 64, '64Miller@StAlphonsus.com', 'Michael64'),
(65, 65, '65Wilson@StAlphonsus.com', 'Laura65'),
(66, 66, '66Taylor@StAlphonsus.com', 'James66'),
(67, 67, '67Moore@StAlphonsus.com', 'Patricia67'),
(68, 68, '68Anderson@StAlphonsus.com', 'Robert68'),
(69, 69, '69Thomas@StAlphonsus.com', 'Linda69'),
(70, 70, '70White@StAlphonsus.com', 'John70'),
(71, 71, '71Harris@StAlphonsus.com', 'Barbara71'),
(72, 72, '72Martin@StAlphonsus.com', 'William72'),
(73, 73, '73Lee@StAlphonsus.com', 'Elizabeth73'),
(74, 74, '74Walker@StAlphonsus.com', 'Richard74'),
(75, 75, '75Hall@StAlphonsus.com', 'Jennifer75'),
(76, 76, '76Allen@StAlphonsus.com', 'Thomas76'),
(77, 77, '77Young@StAlphonsus.com', 'Susan77'),
(78, 78, '78King@StAlphonsus.com', 'Charles78'),
(79, 79, '79Wright@StAlphonsus.com', 'Jessica79'),
(80, 80, '80Scott@StAlphonsus.com', 'Daniel80'),
(81, 81, '81Green@StAlphonsus.com', 'Sarah81'),
(82, 82, '82Adams@StAlphonsus.com', 'Anthony82'),
(83, 83, '83Baker@StAlphonsus.com', 'Nancy83'),
(84, 84, '84Gonzalez@StAlphonsus.com', 'Kevin84'),
(85, 85, '85Nelson@StAlphonsus.com', 'Angela85'),
(86, 86, '86Carter@StAlphonsus.com', 'Brian86'),
(87, 87, '87Mitchell@StAlphonsus.com', 'Melissa87'),
(88, 88, '88Smith@StAlphonsus.com', 'Robert88'),
(89, 89, '89Brown@StAlphonsus.com', 'Karen89'),
(90, 90, '90Davis@StAlphonsus.com', 'David90'),
(91, 91, '91Miller@StAlphonsus.com', 'Michael91'),
(92, 92, '92Wilson@StAlphonsus.com', 'Laura92'),
(93, 93, '93Taylor@StAlphonsus.com', 'James93'),
(94, 94, '94Moore@StAlphonsus.com', 'Patricia94'),
(95, 95, '95Anderson@StAlphonsus.com', 'Robert95'),
(96, 96, '96Thomas@StAlphonsus.com', 'Linda96'),
(97, 97, '97White@StAlphonsus.com', 'John97'),
(98, 98, '98Harris@StAlphonsus.com', 'Barbara98'),
(99, 99, '99Martin@StAlphonsus.com', 'William99'),
(100, 100, '100Lee@StAlphonsus.com', 'Elizabeth100'),
(101, 101, '101Walker@StAlphonsus.com', 'Richard101'),
(102, 102, '102Hall@StAlphonsus.com', 'Jennifer102'),
(103, 103, '103Allen@StAlphonsus.com', 'Thomas103'),
(104, 104, '104Young@StAlphonsus.com', 'Susan104'),
(105, 105, '105King@StAlphonsus.com', 'Charles105'),
(106, 106, '106Wright@StAlphonsus.com', 'Jessica106'),
(107, 107, '107Scott@StAlphonsus.com', 'Daniel107'),
(108, 108, '108Green@StAlphonsus.com', 'Sarah108'),
(109, 109, '109Adams@StAlphonsus.com', 'Anthony109'),
(110, 110, '110Baker@StAlphonsus.com', 'Nancy110'),
(111, 111, '111Gonzalez@StAlphonsus.com', 'Kevin111'),
(112, 112, '112Nelson@StAlphonsus.com', 'Angela112'),
(113, 113, '113Carter@StAlphonsus.com', 'Brian113'),
(114, 114, '114Mitchell@StAlphonsus.com', 'Melissa114'),
(115, 115, '115Perez@StAlphonsus.com', 'Robert115'),
(116, 116, '116Roberts@StAlphonsus.com', 'Laura116'),
(117, 117, '117Clark@StAlphonsus.com', 'William117'),
(118, 118, '118Ford@StAlphonsus.com', 'Helen118'),
(119, 119, '119Hall@StAlphonsus.com', 'Karen119'),
(120, 120, '120Bell@StAlphonsus.com', 'David120'),
(121, 121, '121Hunt@StAlphonsus.com', 'Michael121'),
(122, 122, '122Cole@StAlphonsus.com', 'Laura122'),
(123, 123, '123Knight@StAlphonsus.com', 'James123'),
(124, 124, '124Webb@StAlphonsus.com', 'Patricia124'),
(125, 125, '125Reed@StAlphonsus.com', 'Robert125'),
(126, 126, '126Fox@StAlphonsus.com', 'Linda126'),
(127, 127, '127Page@StAlphonsus.com', 'John127'),
(128, 128, '128Cross@StAlphonsus.com', 'Barbara128'),
(129, 129, '129Grant@StAlphonsus.com', 'William129'),
(130, 130, '130Carter@StAlphonsus.com', 'Elizabeth130'),
(131, 131, '131Coleman@StAlphonsus.com', 'Richard131'),
(132, 132, '132Frost@StAlphonsus.com', 'Jennifer132'),
(133, 133, '133Hayes@StAlphonsus.com', 'Thomas133'),
(134, 134, '134Shaw@StAlphonsus.com', 'Susan134'),
(135, 135, '135Tate@StAlphonsus.com', 'Charles135'),
(136, 136, '136Wells@StAlphonsus.com', 'Jessica136'),
(137, 137, '137Lane@StAlphonsus.com', 'Daniel137'),
(138, 138, '138Reid@StAlphonsus.com', 'Sarah138'),
(139, 139, '139Mason@StAlphonsus.com', 'Anthony139'),
(140, 140, '140Dean@StAlphonsus.com', 'Nancy140'),
(141, 141, '141Cole@StAlphonsus.com', 'Kevin141'),
(142, 142, '142Bennett@StAlphonsus.com', 'Angela142'),
(143, 143, '143Reynolds@StAlphonsus.com', 'Brian143'),
(144, 144, '144Webster@StAlphonsus.com', 'Melissa144'),
(145, 145, '145Holloway@StAlphonsus.com', 'Robert145'),
(146, 146, '146Franklin@StAlphonsus.com', 'Laura146'),
(147, 147, '147Palmer@StAlphonsus.com', 'William147'),
(148, 148, '148Ford@StAlphonsus.com', 'Helen148'),
(149, 149, '149Harper@StAlphonsus.com', 'Karen149'),
(150, 150, '150Lane@StAlphonsus.com', 'David150'),
(151, 151, '151Fletcher@StAlphonsus.com', 'Michael151'),
(152, 152, '152Morrison@StAlphonsus.com', 'Laura152'),
(153, 153, '153Webb@StAlphonsus.com', 'James153'),
(154, 154, '154Fox@StAlphonsus.com', 'Patricia154'),
(155, 155, '155Page@StAlphonsus.com', 'Robert155'),
(156, 156, '156Cross@StAlphonsus.com', 'Linda156'),
(157, 157, '157Grant@StAlphonsus.com', 'John157'),
(158, 158, '158Carter@StAlphonsus.com', 'Barbara158'),
(159, 159, '159Coleman@StAlphonsus.com', 'William159'),
(160, 160, '160Frost@StAlphonsus.com', 'Elizabeth160'),
(161, 161, '161Hayes@StAlphonsus.com', 'Richard161'),
(162, 162, '162Shaw@StAlphonsus.com', 'Jennifer162'),
(163, 163, '163Tate@StAlphonsus.com', 'Thomas163'),
(164, 164, '164Wells@StAlphonsus.com', 'Susan164'),
(165, 165, '165Lane@StAlphonsus.com', 'Charles165'),
(166, 166, '166Dean@StAlphonsus.com', 'Jessica166'),
(167, 167, '167Mason@StAlphonsus.com', 'Daniel167'),
(168, 168, '168Webster@StAlphonsus.com', 'Sarah168'),
(169, 169, '169Bennett@StAlphonsus.com', 'Anthony169'),
(170, 170, '170Holloway@StAlphonsus.com', 'Nancy170'),
(171, 171, '171Franklin@StAlphonsus.com', 'Kevin171'),
(172, 172, '172Palmer@StAlphonsus.com', 'Angela172'),
(173, 173, '173Frost@StAlphonsus.com', 'Brian173'),
(174, 174, '174Hunt@StAlphonsus.com', 'Melissa174'),
(175, 175, '175Cole@StAlphonsus.com', 'Robert175'),
(176, 176, '176Frost@StAlphonsus.com', 'Laura176'),
(177, 177, '177Cole@StAlphonsus.com', 'William177'),
(178, 178, '178Ford@StAlphonsus.com', 'Helen178'),
(179, 179, '179Harper@StAlphonsus.com', 'Karen179'),
(180, 180, '180Lane@StAlphonsus.com', 'David180'),
(181, 181, '181Fletcher@StAlphonsus.com', 'Michael181'),
(182, 182, '182Morrison@StAlphonsus.com', 'Laura182'),
(183, 183, '183Webb@StAlphonsus.com', 'James183'),
(184, 184, '184Fox@StAlphonsus.com', 'Patricia184'),
(185, 185, '185Page@StAlphonsus.com', 'Robert185'),
(186, 186, '186Cross@StAlphonsus.com', 'Linda186'),
(187, 187, '187Grant@StAlphonsus.com', 'John187'),
(188, 188, '188Carter@StAlphonsus.com', 'Barbara188'),
(189, 189, '189Coleman@StAlphonsus.com', 'William189'),
(190, 190, '190Frost@StAlphonsus.com', 'Elizabeth190'),
(191, 191, '191Hayes@StAlphonsus.com', 'Richard191'),
(192, 192, '192Shaw@StAlphonsus.com', 'Jennifer192'),
(193, 193, '193Tate@StAlphonsus.com', 'Thomas193'),
(194, 194, '194Wells@StAlphonsus.com', 'Susan194'),
(195, 195, '195Dean@StAlphonsus.com', 'Charles195'),
(196, 196, '196Mason@StAlphonsus.com', 'Jessica196'),
(197, 197, '197Webster@StAlphonsus.com', 'Daniel197'),
(198, 198, '198Bennett@StAlphonsus.com', 'Sarah198'),
(199, 199, '199Holloway@StAlphonsus.com', 'Anthony199'),
(200, 200, '200Franklin@StAlphonsus.com', 'Nancy200'),
(201, 201, '201Palmer@StAlphonsus.com', 'Kevin201'),
(202, 202, '202Frost@StAlphonsus.com', 'Angela202'),
(203, 203, '203Hunt@StAlphonsus.com', 'Brian203'),
(204, 204, '204Cole@StAlphonsus.com', 'Melissa204'),
(205, 205, '205Knight@StAlphonsus.com', 'Robert205'),
(206, 206, '206Carter@StAlphonsus.com', 'Laura206'),
(207, 207, '207Palmer@StAlphonsus.com', 'William207');

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `PointsID` int(11) NOT NULL,
  `Positive` int(11) NOT NULL,
  `Negative` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `PupilsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`PointsID`, `Positive`, `Negative`, `Total`, `PupilsID`) VALUES
(1, 31, 1, 30, 1),
(2, 37, 9, 28, 2),
(3, 20, 2, 18, 3),
(4, 18, 2, 16, 4),
(5, 38, 5, 33, 5),
(6, 34, 8, 26, 6),
(7, 26, 4, 22, 7),
(8, 30, 2, 28, 8),
(9, 15, 7, 8, 9),
(10, 24, 6, 18, 10),
(11, 14, 1, 13, 11),
(12, 31, 7, 24, 12),
(13, 22, 2, 20, 13),
(14, 15, 1, 14, 14),
(15, 39, 10, 29, 15),
(16, 12, 8, 4, 16),
(17, 32, 6, 26, 17),
(18, 31, 4, 27, 18),
(19, 33, 6, 27, 19),
(20, 27, 0, 27, 20),
(21, 11, 4, 7, 21),
(22, 23, 8, 15, 22),
(23, 12, 2, 10, 23),
(24, 31, 8, 23, 24),
(25, 31, 9, 22, 25),
(26, 35, 7, 28, 26),
(27, 14, 3, 11, 27),
(28, 27, 9, 18, 28),
(29, 33, 0, 33, 29),
(30, 28, 8, 20, 30),
(31, 11, 2, 9, 31),
(32, 40, 8, 32, 32),
(33, 39, 4, 35, 33),
(34, 40, 1, 39, 34),
(35, 11, 1, 10, 35),
(36, 12, 1, 11, 36),
(37, 18, 4, 14, 37),
(38, 18, 0, 18, 38),
(39, 21, 5, 16, 39),
(40, 23, 9, 14, 40),
(41, 32, 7, 25, 41),
(42, 35, 9, 26, 42),
(43, 20, 6, 14, 43),
(44, 22, 9, 13, 44),
(45, 23, 1, 22, 45),
(46, 37, 7, 30, 46),
(47, 15, 0, 15, 47),
(48, 28, 3, 25, 48),
(49, 29, 8, 21, 49),
(50, 16, 4, 12, 50),
(51, 25, 5, 20, 51),
(52, 32, 8, 24, 52),
(53, 28, 2, 26, 53),
(54, 19, 1, 18, 54),
(55, 22, 6, 16, 55),
(56, 37, 5, 32, 56),
(57, 15, 0, 15, 57),
(58, 24, 3, 21, 58),
(59, 26, 7, 19, 59),
(60, 31, 4, 27, 60),
(61, 33, 6, 27, 61),
(62, 20, 1, 19, 62),
(63, 21, 0, 21, 63),
(64, 34, 8, 26, 64),
(65, 29, 5, 24, 65),
(66, 18, 3, 15, 66),
(67, 22, 4, 18, 67),
(68, 30, 2, 28, 68),
(69, 27, 1, 26, 69),
(70, 35, 9, 26, 70),
(71, 16, 2, 14, 71),
(72, 32, 6, 26, 72),
(73, 20, 0, 20, 73),
(74, 31, 7, 24, 74),
(75, 28, 3, 25, 75),
(76, 23, 4, 19, 76),
(77, 36, 5, 31, 77),
(78, 21, 2, 19, 78),
(79, 33, 8, 25, 79),
(80, 29, 6, 23, 80),
(81, 17, 1, 16, 81),
(82, 24, 3, 21, 82),
(83, 22, 0, 22, 83),
(84, 35, 7, 28, 84),
(85, 18, 4, 14, 85),
(86, 26, 2, 24, 86),
(87, 31, 5, 26, 87),
(88, 19, 1, 18, 88),
(89, 30, 6, 24, 89),
(90, 25, 3, 22, 90),
(91, 33, 9, 24, 91),
(92, 20, 0, 20, 92),
(93, 28, 4, 24, 93),
(94, 32, 7, 25, 94),
(95, 27, 2, 25, 95),
(96, 23, 0, 23, 96),
(97, 21, 5, 16, 97),
(98, 36, 6, 30, 98),
(99, 29, 3, 26, 99),
(100, 34, 8, 26, 100),
(101, 28, 3, 25, 101),
(102, 31, 5, 26, 102),
(103, 22, 1, 21, 103),
(104, 35, 7, 28, 104),
(105, 20, 0, 20, 105),
(106, 33, 6, 27, 106),
(107, 26, 4, 22, 107),
(108, 24, 2, 22, 108),
(109, 30, 8, 22, 109),
(110, 27, 3, 24, 110),
(111, 32, 5, 27, 111),
(112, 21, 0, 21, 112),
(113, 29, 7, 22, 113),
(114, 18, 2, 16, 114),
(115, 25, 4, 21, 115),
(116, 36, 6, 30, 116),
(117, 23, 1, 22, 117),
(118, 34, 9, 25, 118),
(119, 20, 0, 20, 119),
(120, 31, 8, 23, 120),
(121, 28, 5, 23, 121),
(122, 22, 3, 19, 122),
(123, 30, 7, 23, 123),
(124, 26, 2, 24, 124),
(125, 33, 6, 27, 125),
(126, 19, 1, 18, 126),
(127, 21, 0, 21, 127),
(128, 35, 9, 26, 128),
(129, 24, 4, 20, 129),
(130, 27, 5, 22, 130),
(131, 32, 8, 24, 131),
(132, 23, 2, 21, 132),
(133, 29, 7, 22, 133),
(134, 18, 0, 18, 134),
(135, 31, 6, 25, 135),
(136, 25, 3, 22, 136),
(137, 30, 5, 25, 137),
(138, 26, 2, 24, 138),
(139, 34, 7, 27, 139),
(140, 22, 1, 21, 140),
(141, 28, 4, 24, 141),
(142, 33, 8, 25, 142),
(143, 21, 0, 21, 143),
(144, 27, 3, 24, 144),
(145, 30, 5, 25, 145),
(146, 24, 2, 22, 146),
(147, 32, 7, 25, 147),
(148, 23, 1, 22, 148),
(149, 29, 6, 23, 149),
(150, 35, 8, 27, 150),
(151, 28, 3, 25, 151),
(152, 32, 6, 26, 152),
(153, 24, 2, 22, 153),
(154, 30, 5, 25, 154),
(155, 26, 4, 22, 155),
(156, 35, 7, 28, 156),
(157, 21, 0, 21, 157),
(158, 29, 3, 26, 158),
(159, 33, 8, 25, 159),
(160, 23, 1, 22, 160),
(161, 31, 5, 26, 161),
(162, 27, 2, 25, 162),
(163, 34, 6, 28, 163),
(164, 20, 0, 20, 164),
(165, 32, 7, 25, 165),
(166, 25, 3, 22, 166),
(167, 30, 5, 25, 167),
(168, 26, 2, 24, 168),
(169, 35, 9, 26, 169),
(170, 22, 0, 22, 170),
(171, 28, 4, 24, 171),
(172, 33, 7, 26, 172),
(173, 21, 1, 20, 173),
(174, 29, 5, 24, 174),
(175, 31, 6, 25, 175),
(176, 24, 2, 22, 176),
(177, 32, 8, 24, 177),
(178, 23, 1, 22, 178),
(179, 27, 3, 24, 179),
(180, 34, 5, 29, 180),
(181, 20, 0, 20, 181),
(182, 30, 6, 24, 182),
(183, 25, 2, 23, 183),
(184, 31, 7, 24, 184),
(185, 28, 4, 24, 185),
(186, 33, 9, 24, 186),
(187, 22, 1, 21, 187),
(188, 29, 5, 24, 188),
(189, 35, 7, 28, 189),
(190, 24, 2, 22, 190),
(191, 32, 6, 26, 191),
(192, 23, 1, 22, 192),
(193, 27, 4, 23, 193),
(194, 30, 5, 25, 194),
(195, 26, 2, 24, 195),
(196, 34, 8, 26, 196),
(197, 21, 0, 21, 197),
(198, 28, 3, 25, 198),
(199, 31, 6, 25, 199),
(200, 25, 2, 23, 200),
(201, 33, 7, 26, 201),
(202, 22, 1, 21, 202),
(203, 29, 4, 25, 203),
(204, 35, 5, 30, 204),
(205, 24, 2, 22, 205),
(206, 32, 6, 26, 206),
(207, 23, 1, 22, 207),
(208, 27, 4, 23, 208),
(209, 30, 5, 25, 209),
(210, 26, 2, 24, 210),
(211, 34, 8, 26, 211),
(212, 21, 0, 21, 212),
(213, 28, 3, 25, 213);

-- --------------------------------------------------------

--
-- Table structure for table `pupils`
--

CREATE TABLE `pupils` (
  `PupilsID` int(11) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DoB` date NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Medical` varchar(25) NOT NULL,
  `DinnerMoney` float NOT NULL,
  `ClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pupils`
--

INSERT INTO `pupils` (`PupilsID`, `FirstName`, `LastName`, `Gender`, `DoB`, `Address`, `Medical`, `DinnerMoney`, `ClassID`) VALUES
(1, 'John', 'Smith', 'M', '2021-05-12', '12 Oak Street', 'None', 5, 2),
(2, 'Emma', 'Smith', 'F', '2020-07-22', '12 Oak Street', 'Asthma', 5.5, 1),
(3, 'Liam', 'Johnson', 'M', '2020-03-14', '34 Pine Avenue', 'None', 5, 1),
(4, 'Olivia', 'Johnson', 'F', '2021-09-02', '34 Pine Avenue', 'Allergy', 5, 1),
(5, 'Noah', 'Brown', 'M', '2021-12-21', '56 Maple Road', 'None', 5.25, 1),
(6, 'Ava', 'Davis', 'F', '2021-01-30', '78 Birch Lane', 'None', 5.25, 1),
(7, 'Ethan', 'Miller', 'M', '2021-04-10', '90 Cedar Street', 'None', 5, 1),
(8, 'Sophia', 'Wilson', 'F', '2020-06-18', '11 Spruce Avenue', 'None', 0, 1),
(9, 'Mason', 'Taylor', 'M', '2021-08-25', '22 Elm Road', 'None', 5.5, 1),
(10, 'Isabella', 'Moore', 'F', '2021-11-05', '33 Willow Lane', 'None', 5.5, 1),
(11, 'James', 'Anderson', 'M', '2021-02-14', '44 Cherry Street', 'None', 5.25, 1),
(12, 'Mia', 'Thomas', 'F', '2020-09-30', '55 Walnut Avenue', 'None', 5.25, 1),
(13, 'Benjamin', 'White', 'M', '2021-03-22', '66 Aspen Road', 'None', 5, 1),
(14, 'Charlotte', 'Harris', 'F', '2021-07-19', '77 Magnolia Lane', 'None', 5.5, 1),
(15, 'Alexander', 'Martin', 'M', '2021-05-05', '88 Poplar Street', 'None', 5.5, 1),
(16, 'Amelia', 'Lee', 'F', '2020-10-25', '99 Beech Avenue', 'None', 5.25, 1),
(17, 'Daniel', 'Walker', 'M', '2021-01-15', '101 Maple Lane', 'None', 5.25, 1),
(18, 'Harper', 'Hall', 'F', '2020-12-05', '202 Oak Road', 'None', 5, 1),
(19, 'Michael', 'Allen', 'M', '2021-06-02', '303 Pine Street', 'None', 5.5, 1),
(20, 'Evelyn', 'Young', 'F', '2020-11-20', '404 Cedar Avenue', 'None', 5.5, 1),
(21, 'William', 'King', 'M', '2021-03-18', '505 Birch Lane', 'None', 5, 1),
(22, 'Ella', 'Wright', 'F', '2021-08-01', '606 Spruce Street', 'None', 5.25, 1),
(23, 'David', 'Scott', 'M', '2020-05-30', '707 Elm Avenue', 'None', 0, 1),
(24, 'Lily', 'Green', 'F', '2021-09-12', '808 Willow Road', 'None', 5.25, 1),
(25, 'Joseph', 'Adams', 'M', '2021-02-28', '909 Poplar Lane', 'None', 5, 1),
(26, 'Chloe', 'Baker', 'F', '2020-07-08', '1010 Cherry Street', 'None', 5.5, 1),
(27, 'Samuel', 'Gonzalez', 'M', '2021-06-22', '1111 Oak Avenue', 'None', 5.5, 1),
(28, 'Grace', 'Nelson', 'F', '2021-03-11', '1212 Maple Street', 'None', 5.25, 1),
(29, 'Matthew', 'Carter', 'M', '2020-10-18', '1313 Pine Lane', 'None', 5.25, 1),
(30, 'Hannah', 'Mitchell', 'F', '2021-01-27', '1414 Cedar Road', 'None', 5, 1),
(31, 'Lucas', 'Smith', 'M', '2020-03-12', '12 Oak Street', 'None', 4.75, 2),
(32, 'Lily', 'Johnson', 'F', '2019-11-05', '34 Pine Avenue', 'None', 4.8, 2),
(33, 'Ethan', 'Brown', 'M', '2020-06-20', '56 Maple Road', 'None', 4.85, 2),
(34, 'Sophia', 'Davis', 'F', '2020-01-15', '78 Birch Lane', 'None', 4.9, 2),
(35, 'Mason', 'Miller', 'M', '2019-09-28', '90 Cedar Street', 'None', 4.95, 2),
(36, 'Ava', 'Wilson', 'F', '2020-04-10', '11 Spruce Avenue', 'None', 5, 2),
(37, 'James', 'Taylor', 'M', '2019-12-22', '22 Elm Road', 'None', 5.05, 2),
(38, 'Amelia', 'Moore', 'F', '2020-02-14', '33 Willow Lane', 'None', 5.1, 2),
(39, 'Benjamin', 'Anderson', 'M', '2020-08-01', '44 Cherry Street', 'None', 5.15, 2),
(40, 'Charlotte', 'Thomas', 'F', '2019-10-18', '55 Walnut Avenue', 'None', 5.2, 2),
(41, 'Alexander', 'White', 'M', '2020-05-05', '66 Aspen Road', 'None', 5.25, 2),
(42, 'Harper', 'Harris', 'F', '2020-03-30', '77 Magnolia Lane', 'None', 5.3, 2),
(43, 'Daniel', 'Martin', 'M', '2019-11-11', '88 Poplar Street', 'None', 5.35, 2),
(44, 'Evelyn', 'Lee', 'F', '2020-07-19', '99 Beech Avenue', 'None', 5.4, 2),
(45, 'William', 'Walker', 'M', '2019-09-30', '101 Maple Lane', 'None', 5.45, 2),
(46, 'Ella', 'Hall', 'F', '2020-06-12', '202 Oak Road', 'None', 5.5, 2),
(47, 'Michael', 'Allen', 'M', '2020-01-22', '303 Pine Street', 'None', 5.55, 2),
(48, 'Lily', 'Young', 'F', '2019-12-05', '404 Cedar Avenue', 'None', 5.6, 2),
(49, 'Joseph', 'King', 'M', '2020-08-08', '505 Birch Lane', 'None', 5.65, 2),
(50, 'Grace', 'Wright', 'F', '2020-04-18', '606 Spruce Street', 'None', 5.7, 2),
(51, 'Samuel', 'Scott', 'M', '2019-10-25', '707 Elm Avenue', 'None', 5.75, 2),
(52, 'Chloe', 'Green', 'F', '2020-05-30', '808 Willow Road', 'None', 5.8, 2),
(53, 'Matthew', 'Adams', 'M', '2020-03-11', '909 Poplar Lane', 'None', 5.85, 2),
(54, 'Hannah', 'Baker', 'F', '2020-07-27', '1010 Cherry Street', 'None', 5.9, 2),
(55, 'David', 'Gonzalez', 'M', '2019-11-19', '1111 Oak Avenue', 'None', 5.95, 2),
(56, 'Ella', 'Nelson', 'F', '2020-02-05', '1212 Maple Street', 'None', 6, 2),
(57, 'Jack', 'Carter', 'M', '2020-06-15', '1313 Pine Lane', 'None', 6.05, 2),
(58, 'Sofia', 'Mitchell', 'F', '2020-01-30', '1414 Cedar Road', 'None', 6.1, 2),
(59, 'Henry', 'Perez', 'M', '2019-10-08', '1515 Oak Lane', 'None', 6.15, 2),
(60, 'Zoe', 'Roberts', 'F', '2020-05-20', '1616 Maple Avenue', 'None', 6.2, 2),
(61, 'Oliver', 'Smith', 'M', '2019-02-14', '12 Oak Street', 'None', 6.25, 3),
(62, 'Charlotte', 'Evans', 'F', '2018-11-20', '202 Maple Road', 'None', 6.3, 3),
(63, 'Henry', 'Evans', 'M', '2019-05-15', '202 Maple Road', 'None', 6.35, 3),
(64, 'Liam', 'Johnson', 'M', '2018-09-18', '34 Pine Avenue', 'None', 6.4, 3),
(65, 'Ava', 'Brown', 'F', '2019-01-12', '56 Maple Road', 'None', 6.45, 3),
(66, 'Noah', 'Davis', 'M', '2019-04-10', '78 Birch Lane', 'None', 6.5, 3),
(67, 'Mia', 'Miller', 'F', '2019-06-28', '90 Cedar Street', 'None', 6.55, 3),
(68, 'Ethan', 'Wilson', 'M', '2018-12-05', '11 Spruce Avenue', 'None', 6.6, 3),
(69, 'Isabella', 'Taylor', 'F', '2019-03-22', '22 Elm Road', 'None', 6.65, 3),
(70, 'James', 'Moore', 'M', '2019-07-18', '33 Willow Lane', 'None', 6.7, 3),
(71, 'Amelia', 'Anderson', 'F', '2018-10-30', '44 Cherry Street', 'None', 6.75, 3),
(72, 'Benjamin', 'Thomas', 'M', '2019-02-02', '55 Walnut Avenue', 'None', 6.8, 3),
(73, 'Harper', 'White', 'F', '2018-09-25', '66 Aspen Road', 'None', 6.85, 3),
(74, 'Daniel', 'Harris', 'M', '2019-01-17', '77 Magnolia Lane', 'None', 6.9, 3),
(75, 'Evelyn', 'Martin', 'F', '2019-06-05', '88 Poplar Street', 'None', 6.95, 3),
(76, 'William', 'Lee', 'M', '2018-12-20', '99 Beech Avenue', 'None', 7, 3),
(77, 'Ella', 'Walker', 'F', '2019-03-11', '101 Maple Lane', 'None', 7.05, 3),
(78, 'Michael', 'Hall', 'M', '2019-05-27', '202 Oak Road', 'None', 7.1, 3),
(79, 'Lily', 'Allen', 'F', '2019-07-02', '303 Pine Street', 'None', 7.15, 3),
(80, 'Joseph', 'Young', 'M', '2018-11-12', '404 Cedar Avenue', 'None', 7.2, 3),
(81, 'Grace', 'King', 'F', '2019-04-18', '505 Birch Lane', 'None', 7.25, 3),
(82, 'Samuel', 'Wright', 'M', '2019-06-23', '606 Spruce Street', 'None', 7.3, 3),
(83, 'Chloe', 'Scott', 'F', '2018-09-10', '707 Elm Avenue', 'None', 7.35, 3),
(84, 'Matthew', 'Green', 'M', '2019-01-29', '808 Willow Road', 'None', 7.4, 3),
(85, 'Hannah', 'Adams', 'F', '2019-05-08', '909 Poplar Lane', 'None', 7.45, 3),
(86, 'David', 'Baker', 'M', '2018-12-15', '1010 Cherry Street', 'None', 7.5, 3),
(87, 'Ella', 'Gonzalez', 'F', '2019-03-07', '1111 Oak Avenue', 'None', 7.55, 3),
(88, 'Jack', 'Nelson', 'M', '2019-06-30', '1212 Maple Street', 'None', 7.6, 3),
(89, 'Sofia', 'Carter', 'F', '2018-10-05', '1313 Pine Lane', 'None', 7.65, 3),
(90, 'Henry', 'Mitchell', 'M', '2019-02-20', '1414 Cedar Road', 'None', 7.7, 3),
(91, 'Eleanor', 'Harrison', 'F', '2018-03-10', '12 Oak Street', 'None', 7.75, 4),
(92, 'Lucas', 'Johnson', 'M', '2017-12-18', '34 Pine Avenue', 'None', 7.8, 4),
(93, 'Charlotte', 'Evans', 'F', '2018-11-20', '202 Maple Road', 'None', 7.85, 4),
(94, 'Henry', 'Evans', 'M', '2018-05-15', '202 Maple Road', 'None', 7.9, 4),
(95, 'Liam', 'Brown', 'M', '2017-09-18', '56 Maple Road', 'None', 7.95, 4),
(96, 'Ava', 'Davis', 'F', '2018-01-12', '78 Birch Lane', 'None', 8, 4),
(97, 'Noah', 'Miller', 'M', '2018-07-09', '90 Cedar Street', 'None', 8.05, 4),
(98, 'Mia', 'Wilson', 'F', '2017-11-02', '11 Spruce Avenue', 'None', 8.1, 4),
(99, 'Ethan', 'Taylor', 'M', '2018-01-25', '22 Elm Road', 'None', 8.15, 4),
(100, 'Isabella', 'Moore', 'F', '2018-06-18', '33 Willow Lane', 'None', 8.2, 4),
(101, 'James', 'Anderson', 'M', '2017-10-30', '44 Cherry Street', 'None', 8.25, 4),
(102, 'Amelia', 'Thomas', 'F', '2018-04-12', '55 Walnut Avenue', 'None', 8.3, 4),
(103, 'Benjamin', 'White', 'M', '2018-02-08', '66 Aspen Road', 'None', 8.35, 4),
(104, 'Harper', 'Harris', 'F', '2017-09-15', '77 Magnolia Lane', 'None', 8.4, 4),
(105, 'Daniel', 'Martin', 'M', '2018-03-28', '88 Poplar Street', 'None', 8.45, 4),
(106, 'Evelyn', 'Lee', 'F', '2017-12-05', '99 Beech Avenue', 'None', 8.5, 4),
(107, 'William', 'Walker', 'M', '2018-07-01', '101 Maple Lane', 'None', 8.55, 4),
(108, 'Ella', 'Hall', 'F', '2018-05-30', '202 Oak Road', 'None', 8.6, 4),
(109, 'Michael', 'Allen', 'M', '2018-01-18', '303 Pine Street', 'None', 8.65, 4),
(110, 'Lily', 'Young', 'F', '2018-06-05', '404 Cedar Avenue', 'None', 8.7, 4),
(111, 'Joseph', 'King', 'M', '2017-09-25', '505 Birch Lane', 'None', 8.75, 4),
(112, 'Grace', 'Wright', 'F', '2018-02-12', '606 Spruce Street', 'None', 8.8, 4),
(113, 'Samuel', 'Scott', 'M', '2018-04-28', '707 Elm Avenue', 'None', 8.85, 4),
(114, 'Chloe', 'Green', 'F', '2017-11-20', '808 Willow Road', 'None', 8.9, 4),
(115, 'Matthew', 'Adams', 'M', '2018-06-15', '909 Poplar Lane', 'None', 8.95, 4),
(116, 'Hannah', 'Baker', 'F', '2018-01-30', '1010 Cherry Street', 'None', 9, 4),
(117, 'David', 'Gonzalez', 'M', '2017-12-18', '1111 Oak Avenue', 'None', 9.05, 4),
(118, 'Ella', 'Nelson', 'F', '2018-05-08', '1212 Maple Street', 'None', 9.1, 4),
(119, 'Jack', 'Carter', 'M', '2018-03-22', '1313 Pine Lane', 'None', 9.15, 4),
(120, 'Sofia', 'Mitchell', 'F', '2017-10-12', '1414 Cedar Road', 'None', 9.2, 4),
(121, 'Henry', 'Perez', 'M', '2018-02-18', '1515 Oak Lane', 'None', 9.25, 4),
(122, 'Zoe', 'Roberts', 'F', '2018-04-05', '1616 Maple Avenue', 'None', 9.3, 4),
(123, 'Leo', 'Clark', 'M', '2017-11-28', '1717 Pine Street', 'None', 9.35, 4),
(124, 'Alice', 'Ford', 'F', '2017-01-12', '1 Willow Lane', 'None', 9.4, 5),
(125, 'Ethan', 'Ford', 'M', '2016-09-25', '1 Willow Lane', 'None', 9.45, 5),
(126, 'Benjamin', 'Hall', 'M', '2017-03-18', '2 Maple Street', 'None', 9.5, 5),
(127, 'Clara', 'Bell', 'F', '2016-12-05', '3 Oak Avenue', 'None', 9.55, 5),
(128, 'Daniel', 'Hunt', 'M', '2017-06-20', '4 Birch Road', 'None', 9.6, 5),
(129, 'Emma', 'Cole', 'F', '2016-11-15', '5 Cedar Lane', 'None', 9.65, 5),
(130, 'Felix', 'Knight', 'M', '2017-02-10', '6 Pine Street', 'None', 9.7, 5),
(131, 'Grace', 'Webb', 'F', '2017-04-05', '7 Spruce Avenue', 'None', 9.75, 5),
(132, 'Henry', 'Reed', 'M', '2016-09-30', '8 Cherry Lane', 'None', 9.8, 5),
(133, 'Isla', 'Fox', 'F', '2017-05-18', '9 Poplar Road', 'None', 9.85, 5),
(134, 'Jack', 'Page', 'M', '2017-01-25', '10 Maple Lane', 'None', 9.9, 5),
(135, 'Katie', 'Cross', 'F', '2016-10-12', '11 Oak Lane', 'None', 9.95, 5),
(136, 'Leo', 'Grant', 'M', '2017-03-12', '12 Cedar Road', 'None', 10, 5),
(137, 'Mia', 'Carter', 'F', '2016-11-28', '13 Pine Avenue', 'None', 10.05, 5),
(138, 'Noah', 'Coleman', 'M', '2017-06-05', '14 Spruce Lane', 'None', 10.1, 5),
(139, 'Olivia', 'Frost', 'F', '2016-09-18', '15 Maple Street', 'None', 10.15, 5),
(140, 'Peter', 'Hayes', 'M', '2017-02-22', '16 Oak Avenue', 'None', 10.2, 5),
(141, 'Quinn', 'Shaw', 'F', '2016-12-10', '17 Birch Lane', 'None', 10.25, 5),
(142, 'Ryan', 'Tate', 'M', '2017-04-18', '18 Cedar Street', 'None', 10.3, 5),
(143, 'Sophie', 'Wells', 'F', '2017-01-30', '19 Pine Lane', 'None', 10.35, 5),
(144, 'Thomas', 'Lane', 'M', '2016-10-25', '20 Spruce Road', 'None', 10.4, 5),
(145, 'Una', 'Reid', 'F', '2017-05-05', '21 Maple Avenue', 'None', 10.45, 5),
(146, 'Victor', 'Mason', 'M', '2017-03-15', '22 Oak Street', 'None', 10.5, 5),
(147, 'Willa', 'Dean', 'F', '2016-12-22', '23 Birch Road', 'None', 10.55, 5),
(148, 'Xavier', 'Cole', 'M', '2017-06-10', '24 Cedar Lane', 'None', 10.6, 5),
(149, 'Yara', 'Bennett', 'F', '2016-09-20', '25 Pine Street', 'None', 10.65, 5),
(150, 'Zane', 'Reynolds', 'M', '2017-02-28', '26 Spruce Avenue', 'None', 10.7, 5),
(151, 'Aria', 'Webster', 'F', '2017-01-10', '27 Maple Road', 'None', 10.75, 5),
(152, 'Bruno', 'Holloway', 'M', '2016-11-05', '28 Oak Lane', 'None', 10.8, 5),
(153, 'Cleo', 'Sikasi', 'F', '2017-06-26', '29 Cool Street', 'None', 100.85, 5),
(154, 'Dante', 'Palmer', 'M', '2017-03-30', '30 Cedar Avenue', 'None', 10.9, 5),
(155, 'Eleanor', 'Ford', 'F', '2015-12-12', '1 Willow Lane', 'None', 10.95, 6),
(156, 'Oscar', 'Ford', 'M', '2016-03-05', '1 Willow Lane', 'None', 11, 6),
(157, 'Finn', 'Harper', 'M', '2015-11-18', '2 Maple Street', 'None', 11.05, 6),
(158, 'Giselle', 'Lane', 'F', '2016-06-22', '3 Oak Avenue', 'None', 11.1, 6),
(159, 'Hugo', 'Fletcher', 'M', '2015-09-12', '4 Birch Road', 'None', 11.15, 6),
(160, 'Isabel', 'Morrison', 'F', '2016-02-10', '5 Cedar Lane', 'None', 11.2, 6),
(161, 'Jack', 'Webb', 'M', '2015-10-28', '6 Pine Street', 'None', 11.25, 6),
(162, 'Kira', 'Fox', 'F', '2016-05-18', '7 Spruce Avenue', 'None', 11.3, 6),
(163, 'Lorenzo', 'Page', 'M', '2016-01-12', '8 Cherry Lane', 'None', 11.35, 6),
(164, 'Maya', 'Cross', 'F', '2015-12-05', '9 Poplar Road', 'None', 11.4, 6),
(165, 'Nolan', 'Grant', 'M', '2016-04-10', '10 Maple Lane', 'None', 11.45, 6),
(166, 'Olive', 'Carter', 'F', '2016-06-20', '11 Oak Lane', 'None', 11.5, 6),
(167, 'Patrick', 'Coleman', 'M', '2015-09-25', '12 Cedar Road', 'None', 11.55, 6),
(168, 'Quincy', 'Frost', 'M', '2016-02-28', '13 Pine Avenue', 'None', 11.6, 6),
(169, 'Rose', 'Hayes', 'F', '2015-12-15', '14 Spruce Lane', 'None', 11.65, 6),
(170, 'Sebastian', 'Shaw', 'M', '2016-05-05', '15 Maple Street', 'None', 11.7, 6),
(171, 'Talia', 'Tate', 'F', '2016-01-18', '16 Oak Avenue', 'None', 11.75, 6),
(172, 'Umar', 'Wells', 'M', '2015-09-30', '17 Birch Lane', 'None', 11.8, 6),
(173, 'Violet', 'Lane', 'F', '2016-03-25', '18 Cedar Street', 'None', 11.85, 6),
(174, 'Wyatt', 'Dean', 'M', '2016-06-12', '19 Pine Lane', 'None', 11.9, 6),
(175, 'Xena', 'Mason', 'F', '2015-10-18', '20 Spruce Road', 'None', 11.95, 6),
(176, 'Yusuf', 'Webster', 'M', '2016-02-05', '21 Maple Avenue', 'None', 12, 6),
(177, 'Zara', 'Bennett', 'F', '2016-05-22', '22 Oak Street', 'None', 12.05, 6),
(178, 'Aaron', 'Holloway', 'M', '2015-09-28', '23 Birch Road', 'None', 12.1, 6),
(179, 'Bella', 'Franklin', 'F', '2016-01-15', '24 Cedar Lane', 'None', 12.15, 6),
(180, 'Cameron', 'Palmer', 'M', '2016-06-05', '25 Pine Street', 'None', 12.2, 6),
(181, 'Dahlia', 'Frost', 'F', '2015-12-22', '26 Spruce Avenue', 'None', 12.25, 6),
(182, 'Eli', 'Hunt', 'M', '2016-03-12', '27 Maple Road', 'None', 12.3, 6),
(183, 'Faye', 'Cole', 'F', '2016-06-18', '28 Oak Lane', 'None', 12.35, 6),
(184, 'Alice', 'Ford', 'F', '2015-01-12', '1 Willow Lane', 'None', 12.4, 7),
(185, 'Oscar', 'Ford', 'M', '2014-09-25', '1 Willow Lane', 'None', 12.45, 7),
(186, 'George', 'Harper', 'M', '2014-12-18', '2 Maple Street', 'None', 12.5, 7),
(187, 'Holly', 'Lane', 'F', '2015-06-22', '3 Oak Avenue', 'None', 12.55, 7),
(188, 'Ian', 'Fletcher', 'M', '2014-09-12', '4 Birch Road', 'None', 12.6, 7),
(189, 'Jade', 'Morrison', 'F', '2015-02-10', '5 Cedar Lane', 'None', 12.65, 7),
(190, 'Kevin', 'Webb', 'M', '2014-10-28', '6 Pine Street', 'None', 12.7, 7),
(191, 'Luna', 'Fox', 'F', '2015-05-18', '7 Spruce Avenue', 'None', 12.75, 7),
(192, 'Mason', 'Page', 'M', '2015-01-12', '8 Cherry Lane', 'None', 12.8, 7),
(193, 'Nina', 'Cross', 'F', '2014-12-05', '9 Poplar Road', 'None', 12.85, 7),
(194, 'Owen', 'Grant', 'M', '2015-04-10', '10 Maple Lane', 'None', 12.9, 7),
(195, 'Paige', 'Carter', 'F', '2015-06-20', '11 Oak Lane', 'None', 12.95, 7),
(196, 'Quentin', 'Coleman', 'M', '2014-09-25', '12 Cedar Road', 'None', 13, 7),
(197, 'Ruby', 'Frost', 'F', '2015-02-28', '13 Pine Avenue', 'None', 13.05, 7),
(198, 'Simon', 'Hayes', 'M', '2014-12-15', '14 Spruce Lane', 'None', 13.1, 7),
(199, 'Tina', 'Shaw', 'F', '2015-05-05', '15 Maple Street', 'None', 13.15, 7),
(200, 'Ulysses', 'Tate', 'M', '2015-01-18', '16 Oak Avenue', 'None', 13.2, 7),
(201, 'Vera', 'Wells', 'F', '2014-09-30', '17 Birch Lane', 'None', 13.25, 7),
(202, 'Wyatt', 'Dean', 'M', '2015-03-25', '18 Cedar Street', 'None', 13.3, 7),
(203, 'Xanthe', 'Mason', 'F', '2015-06-12', '19 Pine Lane', 'None', 13.35, 7),
(204, 'Yanni', 'Webster', 'M', '2014-10-18', '20 Spruce Road', 'None', 13.4, 7),
(205, 'Zoe', 'Bennett', 'F', '2015-02-05', '21 Maple Avenue', 'None', 13.45, 7),
(206, 'Aaron', 'Holloway', 'M', '2015-05-22', '22 Oak Street', 'None', 13.5, 7),
(207, 'Bella', 'Franklin', 'F', '2014-09-28', '23 Birch Road', 'None', 13.55, 7),
(208, 'Cameron', 'Palmer', 'M', '2015-01-15', '24 Cedar Lane', 'None', 13.6, 7),
(209, 'Dahlia', 'Frost', 'F', '2015-06-05', '25 Pine Street', 'None', 13.65, 7),
(210, 'Eli', 'Hunt', 'M', '2014-12-22', '26 Spruce Avenue', 'None', 13.7, 7),
(211, 'Faye', 'Cole', 'F', '2015-03-12', '27 Maple Road', 'None', 13.75, 7),
(212, 'Gavin', 'Knight', 'M', '2015-06-18', '28 Oak Lane', 'None', 13.8, 7),
(213, 'Hazel', 'Carter', 'F', '2014-12-05', '29 Birch Street', 'None', 13.85, 7),
(215, 'Cleo', 'Sikasi', 'F', '2017-07-07', '20 Film Street ', 'None', 3.7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL,
  `TeachingAssistantID` int(11) NOT NULL,
  `TeachersID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `AdminID`, `TeachingAssistantID`, `TeachersID`) VALUES
(9000, 7001, 2000, 1000),
(9001, 7002, 2001, 1001),
(9002, 7003, 2002, 1002),
(9003, 7004, 2003, 1003),
(9004, 7005, 2004, 1004),
(9005, 7006, 2005, 1005),
(9006, 7007, 2006, 1006);

-- --------------------------------------------------------

--
-- Table structure for table `student_login`
--

CREATE TABLE `student_login` (
  `ID` int(11) NOT NULL,
  `PupilsID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_login`
--

INSERT INTO `student_login` (`ID`, `PupilsID`, `Username`, `Password`) VALUES
(5000, 1, '1Smith@StAlphonsus.com', 'John2021'),
(5001, 2, '2Smith@StAlphonsus.com', 'Emma2020'),
(5002, 3, '3Johnson@StAlphonsus.com', 'Liam2020'),
(5003, 4, '4Johnson@StAlphonsus.com', 'Olivia2021'),
(5004, 5, '5Brown@StAlphonsus.com', 'Noah2021'),
(5005, 6, '6Davis@StAlphonsus.com', 'Ava2021'),
(5006, 7, '7Miller@StAlphonsus.com', 'Ethan2021'),
(5007, 8, '8Wilson@StAlphonsus.com', 'Sophia2020'),
(5008, 9, '9Taylor@StAlphonsus.com', 'Mason2021'),
(5009, 10, '10Moore@StAlphonsus.com', 'Isabella2021'),
(5010, 11, '11Anderson@StAlphonsus.com', 'James2021'),
(5011, 12, '12Thomas@StAlphonsus.com', 'Mia2020'),
(5012, 13, '13White@StAlphonsus.com', 'Benjamin2021'),
(5013, 14, '14Harris@StAlphonsus.com', 'Charlotte2021'),
(5014, 15, '15Martin@StAlphonsus.com', 'Alexander2021'),
(5015, 16, '16Lee@StAlphonsus.com', 'Amelia2020'),
(5016, 17, '17Walker@StAlphonsus.com', 'Daniel2021'),
(5017, 18, '18Hall@StAlphonsus.com', 'Harper2020'),
(5018, 19, '19Allen@StAlphonsus.com', 'Michael2021'),
(5019, 20, '20Young@StAlphonsus.com', 'Evelyn2020'),
(5020, 21, '21King@StAlphonsus.com', 'William2021'),
(5021, 22, '22Wright@StAlphonsus.com', 'Ella2021'),
(5022, 23, '23Scott@StAlphonsus.com', 'David2020'),
(5023, 24, '24Green@StAlphonsus.com', 'Lily2021'),
(5024, 25, '25Adams@StAlphonsus.com', 'Joseph2021'),
(5025, 26, '26Baker@StAlphonsus.com', 'Chloe2020'),
(5026, 27, '27Gonzalez@StAlphonsus.com', 'Samuel2021'),
(5027, 28, '28Nelson@StAlphonsus.com', 'Grace2021'),
(5028, 29, '29Carter@StAlphonsus.com', 'Matthew2020'),
(5029, 30, '30Mitchell@StAlphonsus.com', 'Hannah2021'),
(5030, 31, '31Smith@StAlphonsus.com', 'Lucas2020'),
(5031, 32, '32Johnson@StAlphonsus.com', 'Lily2019'),
(5032, 33, '33Brown@StAlphonsus.com', 'Ethan2020'),
(5033, 34, '34Davis@StAlphonsus.com', 'Sophia2020'),
(5034, 35, '35Miller@StAlphonsus.com', 'Mason2019'),
(5035, 36, '36Wilson@StAlphonsus.com', 'Ava2020'),
(5036, 37, '37Taylor@StAlphonsus.com', 'James2019'),
(5037, 38, '38Moore@StAlphonsus.com', 'Amelia2020'),
(5038, 39, '39Anderson@StAlphonsus.com', 'Benjamin2020'),
(5039, 40, '40Thomas@StAlphonsus.com', 'Charlotte2019'),
(5040, 41, '41White@StAlphonsus.com', 'Alexander2020'),
(5041, 42, '42Harris@StAlphonsus.com', 'Harper2020'),
(5042, 43, '43Martin@StAlphonsus.com', 'Daniel2019'),
(5043, 44, '44Lee@StAlphonsus.com', 'Evelyn2020'),
(5044, 45, '45Walker@StAlphonsus.com', 'William2019'),
(5045, 46, '46Hall@StAlphonsus.com', 'Ella2020'),
(5046, 47, '47Allen@StAlphonsus.com', 'Michael2020'),
(5047, 48, '48Young@StAlphonsus.com', 'Lily2019'),
(5048, 49, '49King@StAlphonsus.com', 'Joseph2020'),
(5049, 50, '50Wright@StAlphonsus.com', 'Grace2020'),
(5050, 51, '51Scott@StAlphonsus.com', 'Samuel2019'),
(5051, 52, '52Green@StAlphonsus.com', 'Chloe2020'),
(5052, 53, '53Adams@StAlphonsus.com', 'Matthew2020'),
(5053, 54, '54Baker@StAlphonsus.com', 'Hannah2020'),
(5054, 55, '55Gonzalez@StAlphonsus.com', 'David2019'),
(5055, 56, '56Nelson@StAlphonsus.com', 'Ella2020'),
(5056, 57, '57Carter@StAlphonsus.com', 'Jack2020'),
(5057, 58, '58Mitchell@StAlphonsus.com', 'Sofia2020'),
(5058, 59, '59Perez@StAlphonsus.com', 'Henry2019'),
(5059, 60, '60Roberts@StAlphonsus.com', 'Zoe2020'),
(5060, 61, '61Smith@StAlphonsus.com', 'Oliver2019'),
(5061, 62, '62Evans@StAlphonsus.com', 'Charlotte2018'),
(5062, 63, '63Evans@StAlphonsus.com', 'Henry2019'),
(5063, 64, '64Johnson@StAlphonsus.com', 'Liam2018'),
(5064, 65, '65Brown@StAlphonsus.com', 'Ava2019'),
(5065, 66, '66Davis@StAlphonsus.com', 'Noah2019'),
(5066, 67, '67Miller@StAlphonsus.com', 'Mia2019'),
(5067, 68, '68Wilson@StAlphonsus.com', 'Ethan2018'),
(5068, 69, '69Taylor@StAlphonsus.com', 'Isabella2019'),
(5069, 70, '70Moore@StAlphonsus.com', 'James2019'),
(5070, 71, '71Anderson@StAlphonsus.com', 'Amelia2018'),
(5071, 72, '72Thomas@StAlphonsus.com', 'Benjamin2019'),
(5072, 73, '73White@StAlphonsus.com', 'Harper2018'),
(5073, 74, '74Harris@StAlphonsus.com', 'Daniel2019'),
(5074, 75, '75Martin@StAlphonsus.com', 'Evelyn2019'),
(5075, 76, '76Lee@StAlphonsus.com', 'William2018'),
(5076, 77, '77Walker@StAlphonsus.com', 'Ella2019'),
(5077, 78, '78Hall@StAlphonsus.com', 'Michael2019'),
(5078, 79, '79Allen@StAlphonsus.com', 'Lily2019'),
(5079, 80, '80Young@StAlphonsus.com', 'Joseph2018'),
(5080, 81, '81King@StAlphonsus.com', 'Grace2019'),
(5081, 82, '82Wright@StAlphonsus.com', 'Samuel2019'),
(5082, 83, '83Scott@StAlphonsus.com', 'Chloe2018'),
(5083, 84, '84Green@StAlphonsus.com', 'Matthew2019'),
(5084, 85, '85Adams@StAlphonsus.com', 'Hannah2019'),
(5085, 86, '86Baker@StAlphonsus.com', 'David2018'),
(5086, 87, '87Gonzalez@StAlphonsus.com', 'Ella2019'),
(5087, 88, '88Nelson@StAlphonsus.com', 'Jack2019'),
(5088, 89, '89Carter@StAlphonsus.com', 'Sofia2018'),
(5089, 90, '90Mitchell@StAlphonsus.com', 'Henry2019'),
(5090, 91, '91Harrison@StAlphonsus.com', 'Eleanor2018'),
(5091, 92, '92Johnson@StAlphonsus.com', 'Lucas2017'),
(5092, 93, '93Evans@StAlphonsus.com', 'Charlotte2018'),
(5093, 94, '94Evans@StAlphonsus.com', 'Henry2018'),
(5094, 95, '95Brown@StAlphonsus.com', 'Liam2017'),
(5095, 96, '96Davis@StAlphonsus.com', 'Ava2018'),
(5096, 97, '97Miller@StAlphonsus.com', 'Noah2018'),
(5097, 98, '98Wilson@StAlphonsus.com', 'Mia2017'),
(5098, 99, '99Taylor@StAlphonsus.com', 'Ethan2018'),
(5099, 100, '100Moore@StAlphonsus.com', 'Isabella2018'),
(5100, 101, '101Anderson@StAlphonsus.com', 'James2017'),
(5101, 102, '102Thomas@StAlphonsus.com', 'Amelia2018'),
(5102, 103, '103White@StAlphonsus.com', 'Benjamin2018'),
(5103, 104, '104Harris@StAlphonsus.com', 'Harper2017'),
(5104, 105, '105Martin@StAlphonsus.com', 'Daniel2018'),
(5105, 106, '106Lee@StAlphonsus.com', 'Evelyn2017'),
(5106, 107, '107Walker@StAlphonsus.com', 'William2018'),
(5107, 108, '108Hall@StAlphonsus.com', 'Ella2018'),
(5108, 109, '109Allen@StAlphonsus.com', 'Michael2018'),
(5109, 110, '110Young@StAlphonsus.com', 'Lily2018'),
(5110, 111, '111King@StAlphonsus.com', 'Joseph2017'),
(5111, 112, '112Wright@StAlphonsus.com', 'Grace2018'),
(5112, 113, '113Scott@StAlphonsus.com', 'Samuel2018'),
(5113, 114, '114Green@StAlphonsus.com', 'Chloe2017'),
(5114, 115, '115Adams@StAlphonsus.com', 'Matthew2018'),
(5115, 116, '116Baker@StAlphonsus.com', 'Hannah2018'),
(5116, 117, '117Gonzalez@StAlphonsus.com', 'David2017'),
(5117, 118, '118Nelson@StAlphonsus.com', 'Ella2018'),
(5118, 119, '119Carter@StAlphonsus.com', 'Jack2018'),
(5119, 120, '120Mitchell@StAlphonsus.com', 'Sofia2017'),
(5120, 121, '121Perez@StAlphonsus.com', 'Henry2018'),
(5121, 122, '122Roberts@StAlphonsus.com', 'Zoe2018'),
(5122, 123, '123Clark@StAlphonsus.com', 'Leo2017'),
(5123, 124, '124Ford@StAlphonsus.com', 'Alice2017'),
(5124, 125, '125Ford@StAlphonsus.com', 'Ethan2016'),
(5125, 126, '126Hall@StAlphonsus.com', 'Benjamin2017'),
(5126, 127, '127Bell@StAlphonsus.com', 'Clara2016'),
(5127, 128, '128Hunt@StAlphonsus.com', 'Daniel2017'),
(5128, 129, '129Cole@StAlphonsus.com', 'Emma2016'),
(5129, 130, '130Knight@StAlphonsus.com', 'Felix2017'),
(5130, 131, '131Webb@StAlphonsus.com', 'Grace2017'),
(5131, 132, '132Reed@StAlphonsus.com', 'Henry2016'),
(5132, 133, '133Fox@StAlphonsus.com', 'Isla2017'),
(5133, 134, '134Page@StAlphonsus.com', 'Jack2017'),
(5134, 135, '135Cross@StAlphonsus.com', 'Katie2016'),
(5135, 136, '136Grant@StAlphonsus.com', 'Leo2017'),
(5136, 137, '137Carter@StAlphonsus.com', 'Mia2016'),
(5137, 138, '138Coleman@StAlphonsus.com', 'Noah2017'),
(5138, 139, '139Frost@StAlphonsus.com', 'Olivia2016'),
(5139, 140, '140Hayes@StAlphonsus.com', 'Peter2017'),
(5140, 141, '141Shaw@StAlphonsus.com', 'Quinn2016'),
(5141, 142, '142Tate@StAlphonsus.com', 'Ryan2017'),
(5142, 143, '143Wells@StAlphonsus.com', 'Sophie2017'),
(5143, 144, '144Lane@StAlphonsus.com', 'Thomas2016'),
(5144, 145, '145Reid@StAlphonsus.com', 'Una2017'),
(5145, 146, '146Mason@StAlphonsus.com', 'Victor2017'),
(5146, 147, '147Dean@StAlphonsus.com', 'Willa2016'),
(5147, 148, '148Cole@StAlphonsus.com', 'Xavier2017'),
(5148, 149, '149Bennett@StAlphonsus.com', 'Yara2016'),
(5149, 150, '150Reynolds@StAlphonsus.com', 'Zane2017'),
(5150, 151, '151Webster@StAlphonsus.com', 'Aria2017'),
(5151, 152, '152Holloway@StAlphonsus.com', 'Bruno2016'),
(5152, 153, '153Sikasi@StAlphonsus.com', 'Cleo2017'),
(5153, 154, '154Palmer@StAlphonsus.com', 'Dante2017'),
(5154, 155, '155Ford@StAlphonsus.com', 'Eleanor2015'),
(5155, 156, '156Ford@StAlphonsus.com', 'Oscar2016'),
(5156, 157, '157Harper@StAlphonsus.com', 'Finn2015'),
(5157, 158, '158Lane@StAlphonsus.com', 'Giselle2016'),
(5158, 159, '159Fletcher@StAlphonsus.com', 'Hugo2015'),
(5159, 160, '160Morrison@StAlphonsus.com', 'Isabel2016'),
(5160, 161, '161Webb@StAlphonsus.com', 'Jack2015'),
(5161, 162, '162Fox@StAlphonsus.com', 'Kira2016'),
(5162, 163, '163Page@StAlphonsus.com', 'Lorenzo2016'),
(5163, 164, '164Cross@StAlphonsus.com', 'Maya2015'),
(5164, 165, '165Grant@StAlphonsus.com', 'Nolan2016'),
(5165, 166, '166Carter@StAlphonsus.com', 'Olive2016'),
(5166, 167, '167Coleman@StAlphonsus.com', 'Patrick2015'),
(5167, 168, '168Frost@StAlphonsus.com', 'Quincy2016'),
(5168, 169, '169Hayes@StAlphonsus.com', 'Rose2015'),
(5169, 170, '170Shaw@StAlphonsus.com', 'Sebastian2016'),
(5170, 171, '171Tate@StAlphonsus.com', 'Talia2016'),
(5171, 172, '172Wells@StAlphonsus.com', 'Umar2015'),
(5172, 173, '173Lane@StAlphonsus.com', 'Violet2016'),
(5173, 174, '174Dean@StAlphonsus.com', 'Wyatt2016'),
(5174, 175, '175Mason@StAlphonsus.com', 'Xena2015'),
(5175, 176, '176Webster@StAlphonsus.com', 'Yusuf2016'),
(5176, 177, '177Bennett@StAlphonsus.com', 'Zara2016'),
(5177, 178, '178Holloway@StAlphonsus.com', 'Aaron2015'),
(5178, 179, '179Franklin@StAlphonsus.com', 'Bella2016'),
(5179, 180, '180Palmer@StAlphonsus.com', 'Cameron2016'),
(5180, 181, '181Frost@StAlphonsus.com', 'Dahlia2015'),
(5181, 182, '182Hunt@StAlphonsus.com', 'Eli2016'),
(5182, 183, '183Cole@StAlphonsus.com', 'Faye2016'),
(5183, 184, '184Ford@StAlphonsus.com', 'Alice2015'),
(5184, 185, '185Ford@StAlphonsus.com', 'Oscar2014'),
(5185, 186, '186Harper@StAlphonsus.com', 'George2014'),
(5186, 187, '187Lane@StAlphonsus.com', 'Holly2015'),
(5187, 188, '188Fletcher@StAlphonsus.com', 'Ian2014'),
(5188, 189, '189Morrison@StAlphonsus.com', 'Jade2015'),
(5189, 190, '190Webb@StAlphonsus.com', 'Kevin2014'),
(5190, 191, '191Fox@StAlphonsus.com', 'Luna2015'),
(5191, 192, '192Page@StAlphonsus.com', 'Mason2015'),
(5192, 193, '193Cross@StAlphonsus.com', 'Nina2014'),
(5193, 194, '194Grant@StAlphonsus.com', 'Owen2015'),
(5194, 195, '195Carter@StAlphonsus.com', 'Paige2015'),
(5195, 196, '196Coleman@StAlphonsus.com', 'Quentin2014'),
(5196, 197, '197Frost@StAlphonsus.com', 'Ruby2015'),
(5197, 198, '198Hayes@StAlphonsus.com', 'Simon2014'),
(5198, 199, '199Shaw@StAlphonsus.com', 'Tina2015'),
(5199, 200, '200Tate@StAlphonsus.com', 'Ulysses2015'),
(5200, 201, '201Wells@StAlphonsus.com', 'Vera2014'),
(5201, 202, '202Dean@StAlphonsus.com', 'Wyatt2015'),
(5202, 203, '203Mason@StAlphonsus.com', 'Xanthe2015'),
(5203, 204, '204Webster@StAlphonsus.com', 'Yanni2014'),
(5204, 205, '205Bennett@StAlphonsus.com', 'Zoe2015'),
(5205, 206, '206Holloway@StAlphonsus.com', 'Aaron2015'),
(5206, 207, '207Franklin@StAlphonsus.com', 'Bella2014'),
(5207, 208, '208Palmer@StAlphonsus.com', 'Cameron2015'),
(5208, 209, '209Frost@StAlphonsus.com', 'Dahlia2015'),
(5209, 210, '210Hunt@StAlphonsus.com', 'Eli2014'),
(5210, 211, '211Cole@StAlphonsus.com', 'Faye2015'),
(5211, 212, '212Knight@StAlphonsus.com', 'Gavin2015'),
(5212, 213, '213Carter@StAlphonsus.com', 'Hazel2014');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `TeachersID` int(11) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `AnnualSalary` float NOT NULL,
  `DinnerMoney` float NOT NULL,
  `Medical` varchar(25) NOT NULL,
  `BackgroundCheck` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TeachersID`, `FirstName`, `LastName`, `PhoneNumber`, `Email`, `Address`, `AnnualSalary`, `DinnerMoney`, `Medical`, `BackgroundCheck`) VALUES
(1000, 'Alice', 'Morgan', 2147483647, 'alice.morgan@gmail.com', '10 Oak Street, London', 35000, 30, 'None', 1),
(1001, 'Brian', 'Hughes', 2147483647, 'brian.hughes@gmail.com', '22 Maple Avenue, London', 36000, 25, 'None', 1),
(1002, 'Charlotte', 'Price', 2147483647, 'charlotte.price@gmail.com', '33 Cedar Lane, London', 35500, 50, 'None', 1),
(1003, 'David', 'Clark', 2147483647, 'david.clark@gmail.com', '44 Birch Road, London', 36500, 55, 'None', 1),
(1004, 'Ella', 'Turner', 2147483647, 'ella.turner@gmail.com', '55 Pine Street, London', 35000, 35, 'None', 1),
(1005, 'Frank', 'Mitchell', 2147483647, 'frank.mitchell@gmail.com', '66 Spruce Avenue, London', 36000, 15, 'None', 1),
(1006, 'Grace', 'Phillips', 2147483647, 'grace.phillips@gmail.com', '77 Poplar Lane, London', 35500, 20, 'None', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_login`
--

CREATE TABLE `teacher_login` (
  `ID` int(11) NOT NULL,
  `TeachersID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher_login`
--

INSERT INTO `teacher_login` (`ID`, `TeachersID`, `Username`, `Password`) VALUES
(3000, 1000, '1000Morgan@StAlphonsus.com', '1000'),
(3001, 1001, '1001Hughes@StAlphonsus.com', '1001'),
(3002, 1002, '1002Price@StAlphonsus.com', '1002'),
(3003, 1003, '1003Clark@StAlphonsus.com', '1003'),
(3004, 1004, '1004Turner@StAlphonsus.com', '1004'),
(3005, 1005, '1005Mitchell@StAlphonsus.com', '1005'),
(3006, 1006, '1006Phillips@StAlphonsus.com', '1006');

-- --------------------------------------------------------

--
-- Table structure for table `teachingassistant`
--

CREATE TABLE `teachingassistant` (
  `TeachingAssistantID` int(11) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `DinnerMoney` float NOT NULL,
  `BackgroundCheck` tinyint(1) NOT NULL,
  `AnnualSalary` float NOT NULL,
  `Medical` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachingassistant`
--

INSERT INTO `teachingassistant` (`TeachingAssistantID`, `FirstName`, `LastName`, `PhoneNumber`, `Email`, `DinnerMoney`, `BackgroundCheck`, `AnnualSalary`, `Medical`) VALUES
(2000, 'Sarah', 'Brown', 2147483647, 'sarah.brown@gmail.com', 80, 1, 22000, 'None'),
(2001, 'James', 'Wilson', 2147483647, 'james.wilson@gmail.com', 90, 1, 22500, 'None'),
(2002, 'Emily', 'Taylor', 2147483647, 'emily.taylor@gmail.com', 30, 1, 22000, 'None'),
(2003, 'Daniel', 'Evans', 2147483647, 'daniel.evans@gmail.com', 50, 1, 23000, 'None'),
(2004, 'Hannah', 'Walker', 2147483647, 'hannah.walker@gmail.com', 10, 1, 22500, 'None'),
(2005, 'Oliver', 'Roberts', 2147483647, 'oliver.roberts@gmail.com', 20, 1, 22000, 'None'),
(2006, 'Sophia', 'Green', 2147483647, 'sophia.green@gmail.com', 24, 1, 23000, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `teachingassistant_login`
--

CREATE TABLE `teachingassistant_login` (
  `ID` int(11) NOT NULL,
  `TeachingAssistantID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachingassistant_login`
--

INSERT INTO `teachingassistant_login` (`ID`, `TeachingAssistantID`, `Username`, `Password`) VALUES
(4000, 2000, '2000Brown@StAlphonsus.com', '2000'),
(4001, 2001, '2001Wilson@StAlphonsus.com', '2001'),
(4002, 2002, '2002Taylor@StAlphonsus.com', '2002'),
(4003, 2003, '2003Evans@StAlphonsus.com', '2003'),
(4004, 2004, '2004Walker@StAlphonsus.com', '2004'),
(4005, 2005, '2005Roberts@StAlphonsus.com', '2005'),
(4006, 2006, '2006Green@StAlphonsus.com', '2006');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `PupilsID` (`PupilsID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `TeachingAssistantID` (`TeachingAssistantID`,`TeacherID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `parentpupil`
--
ALTER TABLE `parentpupil`
  ADD PRIMARY KEY (`ParentPupilID`),
  ADD KEY `PupilsID` (`PupilsID`,`ParentsID`),
  ADD KEY `ParentsID` (`ParentsID`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`ParentsID`);

--
-- Indexes for table `parent_login`
--
ALTER TABLE `parent_login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentsID` (`ParentsID`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`PointsID`),
  ADD KEY `PupilsID` (`PupilsID`);

--
-- Indexes for table `pupils`
--
ALTER TABLE `pupils`
  ADD PRIMARY KEY (`PupilsID`),
  ADD KEY `ClassID` (`ClassID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `AdminID` (`AdminID`,`TeachingAssistantID`,`TeachersID`),
  ADD KEY `TeachersID` (`TeachersID`),
  ADD KEY `TeachingAssistantID` (`TeachingAssistantID`);

--
-- Indexes for table `student_login`
--
ALTER TABLE `student_login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PupilsID` (`PupilsID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TeachersID`);

--
-- Indexes for table `teacher_login`
--
ALTER TABLE `teacher_login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TeacherID` (`TeachersID`) USING BTREE;

--
-- Indexes for table `teachingassistant`
--
ALTER TABLE `teachingassistant`
  ADD PRIMARY KEY (`TeachingAssistantID`);

--
-- Indexes for table `teachingassistant_login`
--
ALTER TABLE `teachingassistant_login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TeachingAssistantID` (`TeachingAssistantID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7009;

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8009;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `ParentsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `parent_login`
--
ALTER TABLE `parent_login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `PointsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `pupils`
--
ALTER TABLE `pupils`
  MODIFY `PupilsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9007;

--
-- AUTO_INCREMENT for table `student_login`
--
ALTER TABLE `student_login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5214;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `TeachersID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `teacher_login`
--
ALTER TABLE `teacher_login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3007;

--
-- AUTO_INCREMENT for table `teachingassistant`
--
ALTER TABLE `teachingassistant`
  MODIFY `TeachingAssistantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2007;

--
-- AUTO_INCREMENT for table `teachingassistant_login`
--
ALTER TABLE `teachingassistant_login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4007;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`PupilsID`) REFERENCES `pupils` (`PupilsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`TeachersID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`TeachingAssistantID`) REFERENCES `teachingassistant` (`TeachingAssistantID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parentpupil`
--
ALTER TABLE `parentpupil`
  ADD CONSTRAINT `parentpupil_ibfk_1` FOREIGN KEY (`ParentsID`) REFERENCES `parents` (`ParentsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parentpupil_ibfk_2` FOREIGN KEY (`PupilsID`) REFERENCES `pupils` (`PupilsID`);

--
-- Constraints for table `parent_login`
--
ALTER TABLE `parent_login`
  ADD CONSTRAINT `parent_login_ibfk_1` FOREIGN KEY (`ParentsID`) REFERENCES `parents` (`ParentsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`PupilsID`) REFERENCES `pupils` (`PupilsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pupils`
--
ALTER TABLE `pupils`
  ADD CONSTRAINT `pupils_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`TeachersID`) REFERENCES `teachers` (`TeachersID`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`TeachingAssistantID`) REFERENCES `teachingassistant` (`TeachingAssistantID`),
  ADD CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`AdminID`) REFERENCES `admin_login` (`AdminID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_login`
--
ALTER TABLE `student_login`
  ADD CONSTRAINT `student_login_ibfk_1` FOREIGN KEY (`PupilsID`) REFERENCES `pupils` (`PupilsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_login`
--
ALTER TABLE `teacher_login`
  ADD CONSTRAINT `teacher_login_ibfk_1` FOREIGN KEY (`TeachersID`) REFERENCES `teachers` (`TeachersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachingassistant_login`
--
ALTER TABLE `teachingassistant_login`
  ADD CONSTRAINT `teachingassistant_login_ibfk_1` FOREIGN KEY (`TeachingAssistantID`) REFERENCES `teachingassistant` (`TeachingAssistantID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
