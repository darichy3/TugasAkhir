-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2018 at 07:41 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_jpacrud`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--
CREATE DATABASE IF NOT EXISTS db_jpacrud;
USE db_jpacrud;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(200) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `description`) VALUES
(1, 'Staff-IT-Java', 'Java Programmer'),
(2, 'Help-desk', 'Help desk');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` bigint(20) NOT NULL,
  `address` text NOT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(250) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `home_phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `province` varchar(250) NOT NULL,
  `ts_created` datetime DEFAULT NULL,
  `ts_modified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `work_phone` varchar(50) DEFAULT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `address`, `birth_date`, `birth_place`, `email`, `password`, `fullname`, `gender`, `home_phone`, `mobile_phone`, `province`, `ts_created`, `ts_modified`, `version`, `work_phone`, `dept_id`) VALUES
(1, 'Jl. Musyawarah No. 5 A, Kel. Ragunan, Kec. Pasar Minggu, Jakarta Selatan', '1990-07-13', 'Pati', 'dhanan_richy@yahoo.com', 'admin', 'Dhanan Dwi Rizki', 'L', NULL, '085810111395', 'DKI Jakarta', '2018-01-22 16:28:57', NULL, 0, NULL, 1),
(2, 'Jl. Kemang raya', '1989-03-23', 'jakarta', 'farhan@yahoo.com', 'admin', 'Farhan', 'L', NULL, '0868787812671', 'DKI Jakarta', '2018-01-25 15:54:14', NULL, 0, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `department_x1` (`dept_name`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `person_x1` (`fullname`),
  ADD KEY `person_x2` (`dept_id`),
  ADD KEY `person_x3` (`gender`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FK_bd2e0u9hc5dx69rkiredwtx1d` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
