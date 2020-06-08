-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2020 at 05:58 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_comment`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentNumber` int(11) NOT NULL,
  `courseCode` varchar(8) NOT NULL,
  `content` text NOT NULL,
  `postDate` date NOT NULL,
  `year` text NOT NULL,
  `Semester` int(1) NOT NULL,
  `Grade` text NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseCode` varchar(8) NOT NULL,
  `courseName` text NOT NULL,
  `courseCluster` varchar(1) NOT NULL,
  `chinaRelated` varchar(1) NOT NULL,
  `commentAmount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseCode`, `courseName`, `courseCluster`, `chinaRelated`, `commentAmount`) VALUES
('BHMH1021', 'Personal Financial Planning', 'B', 'N', 0),
('BHMH1041', 'Accounting for Non-Business Students', 'B', 'N', 0),
('BHMH1042', 'Economics and Society (for Non-Business Students)', 'B', 'N', 0),
('BHMH2001', 'Introduction to Chinese Political and Legal System', 'B', 'Y', 0),
('BHMH2002', 'Introduction to Economics', 'B', 'N', 0),
('BHMH2003', 'Introduction to Marketing', 'B', 'N', 0),
('BHMH2004', 'Managing Organisations', 'B', 'N', 0),
('BHMH2005', 'Organisational Behaviour', 'B', 'N', 0),
('BHMH2006', 'Understanding Globalisation', 'B', 'N', 0),
('BHMH2053', 'Chinese Management Wisdom', 'B', 'Y', 0),
('LCH1011', 'Elementary French', 'E', 'N', 0),
('LCH1019', 'Japanese I', 'E', 'N', 0),
('LCH1024', 'Putonghua for College Students', 'E', 'N', 0),
('LCH2007', 'Business Putonghua', 'E', 'N', 0),
('LCH2009', 'Chinese for Academic Purposes', 'E', 'N', 0),
('LCH2010', 'English for Workplace Communication', 'E', 'N', 0),
('LCH2016', 'Grammar in Context', 'E', 'N', 0),
('LCH2018', 'Introduction to Chinese Literature', 'C', 'Y', 0),
('LCH2019', 'Introduction to Communication Studies', 'E', 'N', 0),
('LCH2022', 'Japanese II', 'E', 'N', 0),
('LCH2027', 'Oral Communication in English', 'E', 'N', 0),
('LCH2202', 'Chinese Film and Fiction', 'C', 'Y', 0),
('LCH2203', 'Classical Chinese Fiction', 'C', 'Y', 0),
('LCH2282', 'Chinese Creative Writing', 'C', 'N', 0),
('LCH2329', 'Classical Chinese Poetry', 'C', 'Y', 0),
('SEHH1012', 'Foundation of Traditional Chinese Medicine', 'D', 'N', 0),
('SEHH1015', 'Healthy Living and Common Health Problems', 'D', 'N', 0),
('SEHH1016', 'Introduction to Internet Technology', 'D', 'N', 0),
('SEHH1049', 'Physics I', 'D', 'N', 0),
('SEHH1051', 'Physics II', 'D', 'N', 0),
('SEHH2008', 'Chemistry and Modern Living', 'D', 'N', 0),
('SEHH2011', 'Environmental Science', 'D', 'N', 0),
('SEHH2014', 'Food Hygiene and Nutritional Health', 'D', 'N', 0),
('SEHH2023', 'Light, Man and Environment', 'D', 'N', 0),
('SEHH2028', 'Products and Materials in Modern Society', 'D', 'N', 0),
('SEHH2042', 'COMPUTER PROGRAMMING', 'D', 'N', 0),
('SEHH2045', 'Healthy Ageing', 'D', 'N', 0),
('SEHH2057', 'Health and Fitness: Theory and Practice', 'D', 'N', 0),
('SHDH1014', 'Fundamental Visualisation Skills', 'E', 'N', 0),
('SHDH1017', 'Introduction to Psychology', 'A', 'N', 0),
('SHDH1018', 'Introduction to Sociology', 'A', 'N', 0),
('SHDH1022', 'Personal Growth and Development', 'A', 'N', 0),
('SHDH1025', 'The History and Culture of Hong Kong', 'C', 'N', 0),
('SHDH2012', 'Experiencing Architecture', 'C', 'N', 0),
('SHDH2013', 'Exploring Human Nature', 'A', 'N', 0),
('SHDH2015', 'Gender Issues', 'A', 'N', 0),
('SHDH2017', 'Introduction to Chinese Culture', 'C', 'Y', 0),
('SHDH2020', 'Introduction to Philosophy', 'C', 'N', 0),
('SHDH2021', 'Introduction to Political Science', 'B', 'N', 0),
('SHDH2024', 'Logic and Reasoning', 'C', 'N', 0),
('SHDH2025', 'Love, Intimacy and Identity', 'A', 'N', 0),
('SHDH2026', 'Mass Media and Culture', 'C', 'N', 0),
('SHDH2029', 'Professionals and the Society', 'B', 'N', 0),
('SHDH2030', 'Social Development in China', 'C', 'Y', 0),
('SHDH2032', 'The History and Culture of East Asia', 'C', 'N', 0),
('SHDH2035', 'Values and Ethics in Daily Life', 'A', 'N', 0),
('SHDH2043', 'Digital Storytelling', 'E', 'N', 0),
('SHDH2044', 'Digital Visualisation in New Media', 'D', 'N', 0),
('SHDH2046', 'Music, Mind and Human Behaviour', 'A', 'N', 0),
('SHDH2047', 'Understanding Society through Visual Arts', 'B', 'N', 0),
('SHDH2048', 'The History and Culture of Modern China', 'C', 'Y', 0),
('SHDH2049', 'Chinese and Western Cultures', 'C', 'Y', 0),
('SHDH2050', 'Creativity and Everyday Life', 'A', 'N', 0),
('SHDH2051', 'Positive Psychology in Daily Life', 'A', 'N', 0),
('SHDH2052', 'China in the Era of Globalisation', 'B', 'Y', 0),
('SHDH2055', 'Exploring Culture through Field Trip', 'C', 'N', 0),
('SHDH2056', 'Exploring Life, Death and Human Relations in Traditional Chinese Thoughts', 'A', 'Y', 0),
('SHDH2201', 'Chinese Family and Culture', 'C', 'Y', 0),
('SHDH2214', 'The Role of Chinese Women in Historical Development', 'C', 'Y', 0),
('SHDH2216', 'Wisdom in Eastern Tradition', 'C', 'Y', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentNumber`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
