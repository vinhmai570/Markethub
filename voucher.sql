-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2020 at 05:34 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `markethub`
--

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` int(11) NOT NULL,
  `voucher_code` char(9) NOT NULL,
  `voucher_name` varchar(100) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`voucher_id`, `voucher_code`, `voucher_name`, `discount`, `quantity`, `shop_id`, `expiration`, `status`, `create_date`, `update_date`) VALUES
(1, 'XZ5I1WI1', 'Voucher cua hang A', 5, 0, 2, 5, 1, '2020-10-01', '2020-10-02'),
(3, 'LLAK7PS0', 'Voucher cua hang B', 5, 20, 2, 2, 1, '2020-10-02', '2020-10-02'),
(5, 'JI2QN1PV', 'Voucher cua hang D', 5, 20, 2, 1, 1, '2020-10-02', '2020-10-02'),
(6, '3O3XO7L2', 'Voucher cua hang E', 10, 20, 2, 1, 1, '2020-10-02', '2020-10-02'),
(8, 'VGGF1FGI', 'Voucher cua hang G', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(10, 'ZY3HQ60U', 'Voucher cua hang H', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(11, 'B97UK8A5', 'Voucher cua hang po', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(12, 'JJXDVXG1', 'Voucher cua hang ppo', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(13, 'BF7I2VEK', 'Voucher cua hang dssad', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(14, 'AVFSKLE0', 'Voucher cua hang ', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(15, 'JU0JRFGW', 'Voucher cua hang 1', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(16, '9OUTT52Z', 'Voucher cua hang 2', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(17, '167HKCD9', 'Voucher cua hang 3', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(18, '0QFB108E', 'Voucher cua hang 4', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(19, '55OXYXOH', 'Voucher cua hang 5', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
