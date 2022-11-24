-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2022 at 09:53 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realitypos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `icon`) VALUES
(1, 'Pares', 'https://cdn-icons-png.flaticon.com/512/2387/2387954.png'),
(2, 'Burger', 'https://cdn-icons-png.flaticon.com/512/1923/1923515.png'),
(3, 'Shawarma', 'https://cdn-icons-png.flaticon.com/512/6978/6978175.png'),
(4, 'Milk Tea', 'https://cdn-icons-png.flaticon.com/512/5825/5825361.png'),
(5, 'Dimsum', 'https://cdn-icons-png.flaticon.com/512/4191/4191694.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `price`, `category`) VALUES
(2, 'Pares Tendon', 'Pares Tendon', '180', 1),
(3, 'Cheese Burger', 'Cheese Burger', '35', 2),
(4, 'Beef Shawarma', 'Beef Shawarma', '80', 3),
(5, 'Classic Pares', 'Classic Pares', '170', 1),
(6, 'Salted Egg Pares Rice', '1', '123', 1),
(15, 'Kutsinta', 'Kutsinta', '5', 5),
(18, 'Oreo Cheesecake', 'Oreo Cheesecake', '90', 4),
(19, 'Pares Rice Supreme\n', 'Angus Pares Rice Supreme\r\n', '230', 1),
(20, 'Quarter Pound', 'Quarter Pound', '250', 2),
(21, 'Beef Pares Mami', 'Beef Pares Mami', '150', 1),
(22, 'Camto Soup	', 'Camto Soup	', '120', 1),
(23, 'Premium Pares	', 'Premium Pares	', '200', 1),
(24, 'Bone Marrow', 'Bone Marrow (Large)	', '300', 1),
(25, 'Chicken Ala Pares', 'Chicken Ala Pares	', '100', 1),
(26, 'Garlic Butter Chix', 'Garlic Butter Chix', '150', 1),
(27, 'Pares Lotong Rice', 'Pares Lotong Rice', '120', 1),
(28, 'Pares Siomai Rice', 'Pares Siomai Rice	', '80', 1),
(31, 'Pares Siopao	', 'Pares Siopao	', '50', 1),
(32, 'Bangsilog	', 'Bangsilog	', '100', 1),
(33, 'Lechonsilog', 'Pares Siopao	', '100', 1),
(34, 'Bangsilog	', 'Porkchopsilog', '100', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
