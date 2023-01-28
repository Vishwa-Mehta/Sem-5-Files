-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 09, 2022 at 04:33 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` int(10) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `cust_email_id` varchar(50) NOT NULL,
  `cust_name` varchar(50) NOT NULL,
  `str_no` int(11) DEFAULT NULL,
  `str_name` varchar(50) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  PRIMARY KEY (`cust_id`,`phone_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `phone_no`, `cust_email_id`, `cust_name`, `str_no`, `str_name`, `pincode`) VALUES
(57317, 5289998172, 'inderpal@gmail.com', 'Inderpal Ravinder', 12, 'Goel Street', 649721),
(26864, 8043894922, 'ishi@gmail.com', 'Ishita Devraj', 14, 'Ramkissoon Street', 427425),
(58462, 8545588678, 'anikp@gmail.com', 'Anik Prabhakar', 56, 'Sekhon Street', 139845),
(63698, 3816889497, 'ninadram@gmail.com', 'Ninad Ram', 37, 'Kari Street', 456639),
(33295, 9489333654, 'devis@yahoo.com', 'Devi Sunder', 28, 'Subramaniam Street', 376921),
(22150, 9056364822, 'rama123@yahoo.com', 'Ramadevi Gopala', 57, 'Sen Street', 758086),
(76443, 7294778333, 'pravinajaya@gmail.com', 'Pravina Jaya', 22, 'Raja Street', 591648),
(45406, 4305436406, 'anilabhi@gmail.com', 'Anil Abhishek', 71, 'Shroff Street', 234740),
(26864, 8145956923, 'nilofara@hotmail.com', 'Nilofar Amardeep', 83, 'Vig Street', 158657),
(43143, 5636459498, 'vinayarvind24@hotmail.com', 'Vinay Aravind', 26, 'Chakraborty Street', 525343);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `prod_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `invoice_date` date NOT NULL,
  `selling_price` float NOT NULL,
  `prod_qty` int(11) DEFAULT '0',
  `discount` float DEFAULT NULL,
  `phone_no` bigint(10) DEFAULT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`prod_id`,`invoice_no`),
  KEY `phone_no` (`phone_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`prod_id`, `invoice_no`, `invoice_date`, `selling_price`, `prod_qty`, `discount`, `phone_no`, `vendor_id`) VALUES
(59854, 38980, '2022-10-22', 22.8, 2, 0.2, 5289998172, 75071),
(59854, 85957, '2022-10-23', 22.8, 2, 0.2, 8043894922, 75071),
(59854, 99454, '2022-10-23', 22.8, 2, 0.2, 8545588678, 40101);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `email_id` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email_id`, `pass`) VALUES
('harry@gmail.com', 'har1234%'),
('ramesh@gmail.com', 'rameshH234'),
('ram@gmail.com', 'ram135&'),
('ranjeeta@gmail.com', 'ran234%'),
('rakesh@gmail.com', 'rakeshm345');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `cost_price` float NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `mrp` float NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `cost_price`, `manufacturer`, `mrp`) VALUES
(59854, 'milk', 15, 'Amul', 19),
(53028, 'curd', 30, 'Amul', 34),
(56145, 'butter', 25, 'Amul', 28),
(81010, 'cow milk', 15, 'Nandini', 17),
(99016, 'yougurt', 25, 'Nandini', 30),
(15292, 'paneer', 55, 'Milky Mist', 60),
(45124, 'cheese', 85, 'Amul', 90),
(14270, 'ghee', 440, 'Nandini', 450),
(86934, 'ice cream family pack', 180, 'Quality Walls', 200),
(98390, 'ice cream cone', 35, 'Cornetto', 40);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `pid` int(10) NOT NULL,
  `purchase_date` date NOT NULL,
  `mfg_date` date NOT NULL,
  `pqty` int(11) DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`pid`, `purchase_date`, `mfg_date`, `pqty`) VALUES
(59854, '2022-10-21', '2022-10-21', 80),
(53028, '2022-10-18', '2022-10-18', 90),
(56145, '2022-10-12', '2022-10-10', 60),
(81010, '2022-10-21', '2022-10-21', 60),
(99016, '2022-10-17', '2022-10-16', 50),
(15292, '2022-10-19', '2022-10-19', 30),
(45124, '2022-10-04', '2022-09-29', 35),
(14270, '2022-10-02', '2022-09-20', 40),
(86934, '2022-09-20', '2022-09-10', 50),
(98390, '2022-10-01', '2022-09-30', 35);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `cust_id` int(10) DEFAULT NULL,
  KEY `email_id` (`email_id`),
  KEY `cust_id` (`cust_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`fname`, `lname`, `vendor_id`, `email_id`, `product_id`, `cust_id`) VALUES
('harry', 'singh', 75071, 'harry@gmail.com', 59854, 57317),
('harry', 'singh', 75071, 'harry@gmail.com', 59854, 26864),
('harry', 'singh', 75071, 'harry@gmail.com', 59854, 58462),
('harry', 'singh', 75071, 'harry@gmail.com', 53028, 57317),
('harry', 'singh', 75071, 'harry@gmail.com', 14270, 58462),
('harry', 'singh', 75071, 'harry@gmail.com', 59854, 63698),
('harry', 'singh', 75071, 'harry@gmail.com', 98390, 63698),
('ramesh', 'sharma', 40101, 'ramesh@gmail.com', 59854, 33295),
('ramesh', 'sharma', 40101, 'ramesh@gmail.com', 15292, 33295),
('ramesh', 'sharma', 40101, 'ramesh@gmail.com', 59854, 33295),
('ramesh', 'sharma', 40101, 'ramesh@gmail.com', 14270, 22150),
('ramesh', 'sharma', 40101, 'ramesh@gmail.com', 59854, 22150),
('ram', 'c', 70978, 'ram@gmail.com', 53028, 76443),
('ram', 'c', 70978, 'ram@gmail.com', 59854, 76443),
('ranjeeta', 's', 94138, 'ranjeeta@gmail.com', 59854, 45406),
('ranjeeta', 's', 94138, 'ranjeeta@gmail.com', 45124, 26864),
('ranjeeta', 's', 94138, 'ranjeeta@gmail.com', 98390, 45406),
('rakesh', 'sharma', 29690, 'rakesh@gmail.com', 81010, 43143),
('rakesh', 'sharma', 29690, 'rakesh@gmail.com', 15292, 43143);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
