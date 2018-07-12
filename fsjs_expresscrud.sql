-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2018 at 08:09 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fsjs_expresscrud`
--
CREATE DATABASE IF NOT EXISTS `fsjs_expresscrud` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fsjs_expresscrud`;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desr` text,
  `start_date` date DEFAULT NULL,
  `duration` varchar(55) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `pimg` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `desr`, `start_date`, `duration`, `subject`, `price`, `pimg`, `createdAt`, `updatedAt`) VALUES
(2, 'sssssss', ';;', '2018-07-10', '5 months', 'ssssssss', 500, '9deacb1277dabc80afffdc3566092c9f', '2018-07-10 09:17:11', '2018-07-11 09:13:33'),
(3, 'Full-stack Js Developer', '-detals des', '2018-08-31', '5 months', 'nodejs, express, mongod, angular, reactjs', 5000, 'ee16c60f347e396cf0668104a02a76b2', '2018-07-10 09:39:47', '2018-07-10 15:49:27'),
(4, 'Android Kotlin Course II', 'ss', '2020-11-04', '5 months', 'kotlin, android, java,', 50000, '1b7bdc91359eaf5540d2cc9e821d9e81', '2018-07-10 11:40:42', '2018-07-11 16:49:41'),
(5, 'PHP', 'testing', '2018-07-28', 'testing', 'hello', 500, '4252ba3d938b4bf22e5949847a0fd5d3', '2018-07-10 15:21:40', '2018-07-10 15:21:40'),
(6, 'Android Kotlin Course VII', 'ssss', '2020-11-04', '5 months', 'kotlin, android, java,', 50000, 'f9a46972dc243f798358dc25b8917da6', '2018-07-10 15:27:30', '2018-07-10 17:11:01'),
(7, '5th Heven and floor', 'apppple', NULL, '', 'testsssssssssssssssss', 500, '298d6dfc6736e62b8f5d21031b87b1dd', '2018-07-11 09:25:19', '2018-07-11 09:26:18'),
(8, '3D Animation and Modeling Master Class Beginner to Advanced', 'This course was designed to be the ultimate bootcamp for any one who wants to master Maya, 3DSMax, and Mudbox, the film and game industrie\'s most power modeling, animation, and visual effects tools. \r\n\r\nThis Master Class covers everything from the core fundamentals of these award winning programs all the ways up to advanced techniques in 3D modeling and sculpting. \r\n\r\nThrough each section of this course you will complete fun and simple projects that make learning these complex programs simple! \r\n\r\nBy the end of this course you will have a deep understanding of animation, rigging, modeling, texturing, lighting, rendering, and projects workflow in MAYA, 3DSMax, and Mudbox! \r\n\r\nOur team here at the School of Game Design is incredibly proud to present such a complete series on 3D modeling and animation.  \r\n\r\nWhether you are looking to doing some 3D printing, or be a rockstar at a game studio, this Master Class is guaranteed to get you there!\r\n\r\nWho is the target audience?\r\nGraphic designers\r\nGame designers\r\nEducators\r\n3D professionals looking to learn new tools\r\nBeginner to advanced 3D artists', '2018-07-31', '3 years', 'Animation, Polygon Modeling, Texturing, Rigging, Lighting, Digital Sculpting, Rendering', 10, '627fc6e7ed4a56fb92848098e60e646b', '2018-07-11 16:47:32', '2018-07-11 16:47:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
