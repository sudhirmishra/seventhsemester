-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 28, 2012 at 09:39 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `college_connect`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(20) NOT NULL AUTO_INCREMENT,
  `post_id` int(20) NOT NULL,
  `comment_user` text NOT NULL,
  `body` text NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `post_id`, `comment_user`, `body`, `comment_date`) VALUES
(1, 5, 'sudhir', 'm', '2012-11-17 01:05:25'),
(2, 5, 'sudhir', 'm', '2012-11-17 01:09:29'),
(3, 5, 'sudhir', 'm', '2012-11-17 01:10:00'),
(4, 4, 'sudhir', 'n', '2012-11-17 11:20:41'),
(5, 1, 'sudhir', 'This is the first comment on the first post', '2012-11-22 13:03:51'),
(6, 1, 'sudhir', 'Second Comment', '2012-11-22 13:04:06'),
(7, 1, 'sudhir', 'Second Comment', '2012-11-22 13:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `file_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `branch` text NOT NULL,
  `subject` text NOT NULL,
  `user` text NOT NULL,
  `source` text NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `name`, `type`, `branch`, `subject`, `user`, `source`) VALUES
(27, 'Head First Servlets', 'Text Book', 'IT', 'null', 'sudhir', 'files/Head First Servlets.pdf'),
(28, 'abc', 'Lab Manual', 'IT', 'null', 'sudhir', 'files/abc.pdf'),
(29, 'Credit', 'Lab Manual', 'IT', 'null', 'sudhir', 'files/Credit.pdf'),
(30, 'as', 'Lab Manual', 'IT', 'null', 'upasi', 'files/as.pdf'),
(31, 'Sudhir', 'Lab Manual', 'IT', 'null', 'sudhir', 'files/Sudhir.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `ozekismsin`
--

CREATE TABLE IF NOT EXISTS `ozekismsin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(30) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `msg` varchar(160) DEFAULT NULL,
  `senttime` varchar(100) DEFAULT NULL,
  `receivedtime` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ozekismsout`
--

CREATE TABLE IF NOT EXISTS `ozekismsout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(30) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `msg` varchar(160) DEFAULT NULL,
  `senttime` varchar(100) DEFAULT NULL,
  `receivedtime` varchar(100) DEFAULT NULL,
  `reference` varchar(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ozekismsout`
--

INSERT INTO `ozekismsout` (`id`, `sender`, `receiver`, `msg`, `senttime`, `receivedtime`, `reference`, `status`, `operator`) VALUES
(1, '9712224080', '8000663132', 'Hello', NULL, NULL, NULL, NULL, NULL),
(2, NULL, '+918000663132', 'Hello world, this is my first SMS message', NULL, NULL, NULL, 'send', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(20) NOT NULL AUTO_INCREMENT,
  `header` text NOT NULL,
  `body` text NOT NULL,
  `post_user` text NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `header`, `body`, `post_user`, `post_date`) VALUES
(1, 'First Post', 'This is the first post of blog comment architechture', 'Sudhir', '2012-11-12 09:02:44'),
(4, 'Second Post', 'This is the second post of blog comment architechture', 'sudhir', '2012-11-14 13:02:34'),
(5, 'Third Post', 'This is the third post of blog comment architechture', 'sudhir', '2012-11-14 13:03:02'),
(7, 'Fourth Post', 'This is the fourth post.', 'sudhir', '2012-11-17 11:22:35'),
(8, 'Fifth Post', 'This is the fifth post.', 'sudhir', '2012-11-17 11:22:45'),
(9, 'Sixth', 'This is the sixth post.', 'sudhir', '2012-11-17 11:22:57'),
(10, 'Seventh', 'This is the 7th post.', 'sudhir', '2012-11-17 11:23:07'),
(11, '8th', '8th post.', 'sudhir', '2012-11-17 11:23:14'),
(12, '9th', 'Post number 9.', 'sudhir', '2012-11-17 11:23:24'),
(13, '10th', 'Deci', 'sudhir', '2012-11-17 11:23:34'),
(14, '11th', 'ek aur ek gyaraah', 'sudhir', '2012-11-17 11:23:47'),
(15, 'Garbage', 'Garbage', 'Sudhir', '2012-11-23 08:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `Username` text NOT NULL,
  `FirstName` text NOT NULL,
  `LastName` text NOT NULL,
  `Branch` text NOT NULL,
  `CollegeID` int(10) NOT NULL,
  `Add_Street` text NOT NULL,
  `Add_Line2` text NOT NULL,
  `City` text NOT NULL,
  `State` text NOT NULL,
  `Country` text NOT NULL,
  `Mobile` bigint(12) NOT NULL,
  `Email` text NOT NULL,
  `Gender` text NOT NULL,
  `Zip` int(10) NOT NULL,
  `AboutYou` text NOT NULL,
  `DOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`Username`, `FirstName`, `LastName`, `Branch`, `CollegeID`, `Add_Street`, `Add_Line2`, `City`, `State`, `Country`, `Mobile`, `Email`, `Gender`, `Zip`, `AboutYou`, `DOB`) VALUES
('tejask06', 'Tejas', 'Kemkar', 'IT', 2147483647, 'asdfgh', 'dfghj', 'sdfghj', 'dfghjk', 'Denmark', 9428394721, 'asdfghj@asdfghjk', 'null', 0, 'sadfghj', '3912-10-11'),
('nirmmesh', 'Nirmesh', 'Khandelwal', 'CE', 234567, 'dfgyhuj', 'drftgyhuji', 'fvgbhnj', 'fghj', 'Nicaragua', 8000492229, 'sdfg@gh.com', 'null', 0, 'dfgvhbjnkmfvgbhnjmk,', '3891-10-15'),
('sudhir', 'Sudhir', 'Mishra', 'IT', 96057, '1074', 'Sector 2 D', 'Gandhinagar', 'Gujarat', 'India', 9712224080, 'sudhirxps@gmail.com', 'null', 0, 'hello world', '3891-06-09'),
('upasi', 'Upasi', 'Mehta', 'IT', 123456, '123', 'Vasna', 'Ahmedabad', 'Gujarat', 'India', 8000663132, 'upasicool@gmail.com', 'Female', 382007, 'ads', '3891-03-13'),
('rathin', 'Rathin', 'Shukla', 'IC', 123123, '123', 'Dab', 'Surat', 'Gujarat', 'India', 9638109849, 'rathinshukla20@gmail.com', 'Male', 382007, 'awsd', '3912-11-02'),
('Nirali', 'Nirali', 'Kotak', 'IT', 96047, 'abcd', 'abcd1', 'pbr', 'Gujarat', 'India', 9427965629, 'niralikotak1@gmail.com', 'Female', 382007, '', '3892-02-01'),
('Parth', 'Parth', 'Khatwani', 'IT', 96045, 'asdfgh', 'xcvgbhnm', 'vgbhnm', 'xcvvvbn', 'India', 9876543, 'sdf@dfgh.com', 'Male', 2345678, 'srfgthjkl', '3894-01-05'),
('Himesh', 'Himesh', 'Reshmiya', 'null', 123, 'Atta Road', 'Bale Bale', 'Jawai Bandh', 'Rajasthan', 'Albania', 123, 'asdfg@sdfghj', 'null', 129, 'singer', '3912-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE IF NOT EXISTS `user_login` (
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Role` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`Username`, `Password`, `Role`) VALUES
('tejask06', 'ÛƒÊÄzÁè', 'Student'),
('nirmmesh', '­„F`', 'Student'),
('sudhir', '­„F', 'Student'),
('upasi', '­„F', 'Student'),
('rathin', '­„F', 'Student'),
('Nirali', '©ô2(¦Ôó—!''V:', 'Student'),
('Parth', '­„F', 'Student'),
('null', ')ÞE', 'null'),
('Himesh', '­„F', 'Student');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
