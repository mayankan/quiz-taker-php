{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf200
{\fonttbl\f0\froman\fcharset0 TimesNewRomanPSMT;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\ri0\partightenfactor0

\f0\fs24 \cf0 -- phpMyAdmin SQL Dump\
-- version 4.7.5\
-- https://www.phpmyadmin.net/\
--\
-- Host: localhost\
-- Generation Time: Jan 28, 2018 at 10:24 AM\
-- Server version: 5.6.38\
-- PHP Version: 7.1.12\
\
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";\
SET time_zone = "+00:00";\
\
--\
-- Database: `mindcoder`\
--\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `mc_options`\
--\
\
CREATE TABLE `mc_options` (\
  `oid` int(11) NOT NULL,\
  `option1` text NOT NULL,\
  `option2` text NOT NULL,\
  `option3` text NOT NULL,\
  `option4` text NOT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `mc_options2`\
--\
\
CREATE TABLE `mc_options2` (\
  `optionId` int(11) NOT NULL DEFAULT '0',\
  `option1` int(11) DEFAULT NULL,\
  `option2` int(11) DEFAULT NULL,\
  `option3` int(11) DEFAULT NULL,\
  `option4` int(11) DEFAULT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `mc_options3`\
--\
\
CREATE TABLE `mc_options3` (\
  `optionId` int(11) NOT NULL DEFAULT '0',\
  `option1` int(11) DEFAULT NULL,\
  `option2` int(11) DEFAULT NULL,\
  `option3` int(11) DEFAULT NULL,\
  `option4` int(11) DEFAULT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `mc_options4`\
--\
\
CREATE TABLE `mc_options4` (\
  `optionId` int(11) NOT NULL DEFAULT '0',\
  `option1` int(11) DEFAULT NULL,\
  `option2` int(11) DEFAULT NULL,\
  `option3` int(11) DEFAULT NULL,\
  `option4` int(11) DEFAULT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `mc_question`\
--\
\
CREATE TABLE `mc_question` (\
  `qid` int(11) NOT NULL,\
  `quesString` text NOT NULL,\
  `correctOptId` int(11) NOT NULL,\
  `option1` int(11) NOT NULL,\
  `option2` int(11) NOT NULL,\
  `option3` int(11) NOT NULL,\
  `option4` int(11) NOT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
-- --------------------------------------------------------\
\
--\
-- Table structure for table `mc_users`\
--\
\
CREATE TABLE `mc_users` (\
  `id` int(11) NOT NULL,\
  `rid` varchar(255) NOT NULL,\
  `totalscore` int(11) NOT NULL DEFAULT '0',\
  `hasplayed` tinyint(1) NOT NULL DEFAULT '0'\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\
\
--\
-- Dumping data for table `mc_users`\
--\
\
INSERT INTO `mc_users` (`id`, `rid`, `totalscore`, `hasplayed`) VALUES\
(2, '123456', 0, 1),\
(3, '5678', 0, 1);\
\
--\
-- Indexes for dumped tables\
--\
\
--\
-- Indexes for table `mc_options`\
--\
ALTER TABLE `mc_options`\
  ADD PRIMARY KEY (`oid`);\
\
--\
-- Indexes for table `mc_options2`\
--\
ALTER TABLE `mc_options2`\
  ADD PRIMARY KEY (`optionId`);\
\
--\
-- Indexes for table `mc_options3`\
--\
ALTER TABLE `mc_options3`\
  ADD PRIMARY KEY (`optionId`);\
\
--\
-- Indexes for table `mc_options4`\
--\
ALTER TABLE `mc_options4`\
  ADD PRIMARY KEY (`optionId`);\
\
--\
-- Indexes for table `mc_question`\
--\
ALTER TABLE `mc_question`\
  ADD PRIMARY KEY (`qid`),\
  ADD KEY `correctOptId` (`correctOptId`),\
  ADD KEY `option1` (`option1`),\
  ADD KEY `option2` (`option2`),\
  ADD KEY `option3` (`option3`),\
  ADD KEY `option4` (`option4`);\
\
--\
-- Indexes for table `mc_users`\
--\
ALTER TABLE `mc_users`\
  ADD PRIMARY KEY (`id`),\
  ADD UNIQUE KEY `username` (`rid`);\
\
--\
-- AUTO_INCREMENT for dumped tables\
--\
\
--\
-- AUTO_INCREMENT for table `mc_options`\
--\
ALTER TABLE `mc_options`\
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT for table `mc_question`\
--\
ALTER TABLE `mc_question`\
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT for table `mc_users`\
--\
ALTER TABLE `mc_users`\
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;\
\
--\
-- Constraints for dumped tables\
--\
\
--\
-- Constraints for table `mc_question`\
--\
ALTER TABLE `mc_question`\
  ADD CONSTRAINT `mc_question_ibfk_1` FOREIGN KEY (`option1`) REFERENCES `mc_options` (`oid`),\
  ADD CONSTRAINT `mc_question_ibfk_2` FOREIGN KEY (`option2`) REFERENCES `mc_options2` (`optionId`),\
  ADD CONSTRAINT `mc_question_ibfk_3` FOREIGN KEY (`option3`) REFERENCES `mc_options3` (`optionId`),\
  ADD CONSTRAINT `mc_question_ibfk_4` FOREIGN KEY (`option4`) REFERENCES `mc_options4` (`optionId`);\
\pard\pardeftab720\ri0\partightenfactor0

\f1 \cf0 \
}