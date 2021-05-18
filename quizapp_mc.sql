-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 29, 2018 at 06:51 AM
-- Server version: 5.6.38
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `mindcoder`
--

-- --------------------------------------------------------

--
-- Table structure for table `mc_options1`
--

CREATE TABLE `mc_options1` (
  `optionId` int(11) NOT NULL,
  `optionValue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mc_options1`
--

INSERT INTO `mc_options1` (`optionId`, `optionValue`) VALUES
(1, 'Managing function calls'),
(2, 'Counting microseconds ');

-- --------------------------------------------------------

--
-- Table structure for table `mc_options2`
--

CREATE TABLE `mc_options2` (
  `optionId` int(11) NOT NULL DEFAULT '0',
  `optionValue` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mc_options2`
--

INSERT INTO `mc_options2` (`optionId`, `optionValue`) VALUES
(1, 'Stock span problem'),
(2, 'Counting the number of key operations');

-- --------------------------------------------------------

--
-- Table structure for table `mc_options3`
--

CREATE TABLE `mc_options3` (
  `optionId` int(11) NOT NULL DEFAULT '0',
  `optionValue` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mc_options3`
--

INSERT INTO `mc_options3` (`optionId`, `optionValue`) VALUES
(1, 'Arithmetic expression evaluation'),
(2, ' Counting the number of statements');

-- --------------------------------------------------------

--
-- Table structure for table `mc_options4`
--

CREATE TABLE `mc_options4` (
  `optionId` int(11) NOT NULL DEFAULT '0',
  `optionValue` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mc_options4`
--

INSERT INTO `mc_options4` (`optionId`, `optionValue`) VALUES
(1, 'All of the above'),
(2, 'Counting the kilobytes of algorithm'),
(3, '0'),
(6, '0'),
(7, 'csaca'),
(8, 'bujbvjubv'),
(9, 'wfewfw'),
(10, 'sdcss'),
(11, 'cs');

-- --------------------------------------------------------

--
-- Table structure for table `mc_question`
--

CREATE TABLE `mc_question` (
  `qid` int(11) NOT NULL,
  `quesString` text NOT NULL,
  `correctOptId` int(11) NOT NULL,
  `option1` int(11) NOT NULL,
  `option2` int(11) NOT NULL,
  `option3` int(11) NOT NULL,
  `option4` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mc_question`
--

INSERT INTO `mc_question` (`qid`, `quesString`, `correctOptId`, `option1`, `option2`, `option3`, `option4`) VALUES
(1, 'Which one of the following is an application of Stack Data Structure?', 4, 1, 1, 1, 1),
(2, 'The time factor when determining the efficiency of algorithm is measured by', 3, 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mc_users`
--

CREATE TABLE `mc_users` (
  `id` int(11) NOT NULL,
  `rid` varchar(255) NOT NULL,
  `totalscore` int(11) NOT NULL DEFAULT '0',
  `hasplayed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mc_users`
--

INSERT INTO `mc_users` (`id`, `rid`, `totalscore`, `hasplayed`) VALUES
(2, '123456', 2, 1),
(3, '5678', 2, 1),
(4, '', 2, 0),
(5, '78883', 0, 1),
(6, '1997', 0, 1),
(7, 'ckjcbkj', 1, 1),
(8, 'kitchen', 0, 1),
(9, 'jobs', 2, 1),
(10, '1234opp', 0, 1),
(11, '8586019653', 2, 1),
(12, 'shreyans', 0, 1),
(13, 'godzilla', 1, 1),
(14, '85237482', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mc_options1`
--
ALTER TABLE `mc_options1`
  ADD PRIMARY KEY (`optionId`);

--
-- Indexes for table `mc_options2`
--
ALTER TABLE `mc_options2`
  ADD PRIMARY KEY (`optionId`);

--
-- Indexes for table `mc_options3`
--
ALTER TABLE `mc_options3`
  ADD PRIMARY KEY (`optionId`);

--
-- Indexes for table `mc_options4`
--
ALTER TABLE `mc_options4`
  ADD PRIMARY KEY (`optionId`);

--
-- Indexes for table `mc_question`
--
ALTER TABLE `mc_question`
  ADD PRIMARY KEY (`qid`),
  ADD KEY `correctOptId` (`correctOptId`),
  ADD KEY `option1` (`option1`),
  ADD KEY `option2` (`option2`),
  ADD KEY `option3` (`option3`),
  ADD KEY `option4` (`option4`);

--
-- Indexes for table `mc_users`
--
ALTER TABLE `mc_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`rid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mc_options1`
--
ALTER TABLE `mc_options1`
  MODIFY `optionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mc_question`
--
ALTER TABLE `mc_question`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mc_users`
--
ALTER TABLE `mc_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mc_question`
--
ALTER TABLE `mc_question`
  ADD CONSTRAINT `mc_question_ibfk_1` FOREIGN KEY (`option1`) REFERENCES `mc_options1` (`optionId`),
  ADD CONSTRAINT `mc_question_ibfk_2` FOREIGN KEY (`option2`) REFERENCES `mc_options2` (`optionId`),
  ADD CONSTRAINT `mc_question_ibfk_3` FOREIGN KEY (`option3`) REFERENCES `mc_options3` (`optionId`);
