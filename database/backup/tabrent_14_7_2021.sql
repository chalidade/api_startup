-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2021 at 07:28 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tabrent`
--

-- --------------------------------------------------------

--
-- Table structure for table `tm_category`
--

CREATE TABLE `tm_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) DEFAULT NULL,
  `category_status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tm_reff`
--

CREATE TABLE `tm_reff` (
  `reff_id` int(11) NOT NULL,
  `reff_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tm_reff`
--

INSERT INTO `tm_reff` (`reff_id`, `reff_name`) VALUES
(1, 'Product Status'),
(2, 'Order Status');

-- --------------------------------------------------------

--
-- Table structure for table `tr_reff`
--

CREATE TABLE `tr_reff` (
  `reff_tr_id` int(11) NOT NULL,
  `reff_tm_id` int(11) DEFAULT NULL,
  `reff_id` int(3) DEFAULT NULL,
  `reff_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tr_reff`
--

INSERT INTO `tr_reff` (`reff_tr_id`, `reff_tm_id`, `reff_id`, `reff_name`) VALUES
(1, 1, 1, 'Waiting Approval'),
(2, 1, 2, 'Publish '),
(3, 1, 3, 'Rejected'),
(4, 2, 1, 'Waiting Payment'),
(5, 2, 2, 'Waiting Confirmation by Tabrent'),
(6, 2, 3, 'Payment Confirm'),
(7, 2, 4, 'Process to rent owner'),
(8, 2, 5, 'Rented'),
(9, 2, 6, 'Overtime'),
(10, 2, 7, 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `tx_article`
--

CREATE TABLE `tx_article` (
  `article_id` int(11) NOT NULL,
  `article_name` varchar(100) NOT NULL,
  `article_description` text NOT NULL,
  `article_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tx_bank`
--

CREATE TABLE `tx_bank` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tx_favorite`
--

CREATE TABLE `tx_favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_product_id` int(3) DEFAULT NULL,
  `favorite_product_owner` int(3) DEFAULT NULL,
  `favorite_status` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tx_order`
--

CREATE TABLE `tx_order` (
  `order_id` int(11) NOT NULL,
  `order_product_id` int(3) DEFAULT NULL,
  `order_user_id` int(3) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_message` varchar(255) DEFAULT NULL,
  `order_transfer_id` int(3) DEFAULT NULL,
  `order_payment_total` int(15) DEFAULT NULL,
  `order_picture` varchar(200) DEFAULT NULL,
  `order_status` int(3) DEFAULT NULL,
  `order_create_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tx_product`
--

CREATE TABLE `tx_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_price` varchar(20) DEFAULT NULL,
  `product_rating` int(11) DEFAULT NULL,
  `product_rent_count` int(11) DEFAULT NULL,
  `product_brand` varchar(20) DEFAULT NULL,
  `product_category` int(2) DEFAULT NULL,
  `product_rental_rules_overtime` text DEFAULT NULL,
  `product_rental_rules_regulation` text DEFAULT NULL,
  `product_pickup_rules` text DEFAULT NULL,
  `product_cancelation_policy` text DEFAULT NULL,
  `product_owner` int(3) DEFAULT NULL,
  `product_status` int(3) DEFAULT NULL,
  `product_image` text DEFAULT NULL,
  `product_created_date` datetime DEFAULT current_timestamp(),
  `product_update_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tx_rating`
--

CREATE TABLE `tx_rating` (
  `rating_id` int(11) NOT NULL,
  `rating_number` int(3) DEFAULT NULL,
  `rating_product_id` int(3) DEFAULT NULL,
  `rating_message` text DEFAULT NULL,
  `rating_status` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tx_user`
--

CREATE TABLE `tx_user` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(20) DEFAULT NULL,
  `user_last_name` varchar(20) DEFAULT NULL,
  `user_phone_number` varchar(15) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_username` varchar(20) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `user_profile` varchar(200) DEFAULT NULL,
  `user_personal_id_number` int(25) DEFAULT NULL,
  `user_bank_type` int(2) DEFAULT NULL,
  `user_bank_number` varchar(25) DEFAULT NULL,
  `user_address` text DEFAULT NULL,
  `user_id_photo` varchar(200) DEFAULT NULL,
  `user_id_photo_with_user` varchar(200) DEFAULT NULL,
  `user_type` int(3) DEFAULT NULL,
  `user_status` int(3) DEFAULT NULL,
  `user_created_date` datetime DEFAULT current_timestamp(),
  `user_updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tm_category`
--
ALTER TABLE `tm_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tm_reff`
--
ALTER TABLE `tm_reff`
  ADD PRIMARY KEY (`reff_id`);

--
-- Indexes for table `tr_reff`
--
ALTER TABLE `tr_reff`
  ADD PRIMARY KEY (`reff_tr_id`);

--
-- Indexes for table `tx_bank`
--
ALTER TABLE `tx_bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `tx_favorite`
--
ALTER TABLE `tx_favorite`
  ADD PRIMARY KEY (`favorite_id`);

--
-- Indexes for table `tx_order`
--
ALTER TABLE `tx_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tx_product`
--
ALTER TABLE `tx_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tx_rating`
--
ALTER TABLE `tx_rating`
  ADD PRIMARY KEY (`rating_id`) USING BTREE;

--
-- Indexes for table `tx_user`
--
ALTER TABLE `tx_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tm_category`
--
ALTER TABLE `tm_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tm_reff`
--
ALTER TABLE `tm_reff`
  MODIFY `reff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tr_reff`
--
ALTER TABLE `tr_reff`
  MODIFY `reff_tr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tx_bank`
--
ALTER TABLE `tx_bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_favorite`
--
ALTER TABLE `tx_favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_order`
--
ALTER TABLE `tx_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_product`
--
ALTER TABLE `tx_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_rating`
--
ALTER TABLE `tx_rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_user`
--
ALTER TABLE `tx_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
