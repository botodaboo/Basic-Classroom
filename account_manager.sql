-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2020 at 04:08 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `account_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activate` int(11) NOT NULL,
  `activate_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isGV` bit(1) DEFAULT NULL,
  `isAdmin` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`firstname`, `lastname`, `email`, `password`, `activate`, `activate_token`, `isGV`, `isAdmin`) VALUES
('Tran', 'Van An', 'antoan03031999@gmail.com', '$2y$10$muEqhbLW7xaL5u06Gi6SKOBeS6aP.Zvo4W4Ole3hmkISuoiBzCtw6', 1, '', b'0', NULL),
('Khanh', 'Duy', 'khanhduynguyen170900@gmail.com', '$2y$10$/ELge07fKRFGwjv9soZ8MedHorHd8LSAi4QKdTuHin.RfdSxTKveW', 1, '', b'1', b'1'),
('Hoc', 'Sinh', 'khanhduynguyen17092000@gmail.com', '$2y$10$WaQnLeo3aZFEZCHCmZZiaeVtsqOP8xmw0xvWmIP6bwNNQcYS547Q.', 1, '', b'0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `id` int(11) NOT NULL,
  `classname` varchar(50) NOT NULL,
  `room` varchar(10) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `emailteacher` varchar(255) DEFAULT NULL,
  `imageclass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`id`, `classname`, `room`, `subject`, `emailteacher`, `imageclass`) VALUES
(1, 'CTDL - ???? s???a', 'C404', 'Cau truc du lieu', 'khanhduynguyen170900@gmail.com', 'LOGO-G.png'),
(2, 'ML', 'A608', 'Nhap mon hoc may', 'khanhduynguyen170900@gmail.com', 'anh-nen-do-phan-giai-4k_105908693.jpg'),
(21, 'BMMT', 'C404', 'Bao mat may tinh', 'khanhduynguyen170900@gmail.com', 'wallpaper-4k_105912678.jpg'),
(27, 'ML', 'C404', 'Cau truc du lieu', 'khanhduynguyen170900@gmail.com', 'wallpaper-4k_105912678.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `classwork`
--

CREATE TABLE `classwork` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `classID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `emailuser` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `feedID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE `feed` (
  `id` int(11) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `classID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feed`
--

INSERT INTO `feed` (`id`, `content`, `classID`) VALUES
(1, 'Danh s??ch c???m thi do v???ng qu?? s??? bu???i h???c theo quy ?????nh (v???ng t??? 3 bu???i tr??? l??n). Hi???n t???i Nh??m 1 T??? 2 v???n c??n m???t bu???i h???c n???a n??n danh s??ch c?? th??? c??n c???p nh???t th??m. C??c em xem danh s??ch c???m thi v?? ph???n h???i cho th???y ?????n h???t 27/11.', 1),
(5, 'H??m nay l?? th??? b???y, anh ??i v??o bar!', 2),
(7, 'Hommmmmmmmmmmmmmmmmmmmmmmmmmm', 1),
(8, 'zzzzzzzzzzzzzzzzzzzzzz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reset_token`
--

CREATE TABLE `reset_token` (
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expire_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reset_token`
--

INSERT INTO `reset_token` (`email`, `token`, `expire_on`) VALUES
('antoan03031999@gmail.com', 'df081d1b1c1debe3546dccbd594b1f29', 1604578513),
('khanhduynguyen170900@gmail.com', '0da92ae765ada391e104b01167c516b1', 1604819777),
('mvmanh@gmail.com', '', 0),
('mvmanh@it.tdt.edu.vn', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `studentofclass`
--

CREATE TABLE `studentofclass` (
  `studentemail` varchar(255) NOT NULL,
  `classID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentofclass`
--

INSERT INTO `studentofclass` (`studentemail`, `classID`) VALUES
('khanhduynguyen17092000@gmail.com', 2),
('khanhduynguyen17092000@gmail.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classwork`
--
ALTER TABLE `classwork`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_token`
--
ALTER TABLE `reset_token`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classroom`
--
ALTER TABLE `classroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `classwork`
--
ALTER TABLE `classwork`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
