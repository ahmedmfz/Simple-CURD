-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2021 at 06:48 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_customers` ()  BEGIN
   SELECT * FROM customers;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `all_products` ()  BEGIN
	SELECT * FROM products;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNumberOfCity` (IN `customerCity` VARCHAR(25), OUT `total` INT)  BEGIN
	SELECT COUNT(city)
	FROM suppliers
	WHERE city = customerCity;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOfficeByCity` (IN `cityName` VARCHAR(255))  BEGIN
	SELECT * 
 	FROM suppliers
	WHERE city = cityName;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `name_category` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`, `created_at`, `updated_at`) VALUES
(2, 'updated product name', '2021-04-24 23:23:11', '2021-09-08 20:30:49'),
(3, 'category2', '2021-04-24 23:23:11', NULL),
(4, 'category3', '2021-04-24 23:23:11', NULL),
(5, 'Category 4 updated', '2021-04-24 23:23:11', '2021-09-08 20:44:28'),
(6, 'category5', '2021-04-24 23:23:11', NULL),
(7, 'reham', '2021-08-17 19:03:27', NULL),
(8, 'new record two dfasdf', '2021-08-24 18:53:55', '2021-08-24 19:14:29'),
(9, 'new record', '2021-08-24 18:54:07', NULL),
(10, 'dalia', '2021-08-24 18:54:28', NULL),
(11, 'new test name', '2021-09-08 18:30:44', NULL),
(12, 'new category from database class', '2021-09-08 20:36:29', NULL),
(13, 'new category from database class', '2021-09-08 20:36:40', NULL),
(14, 'new category from database class', '2021-09-08 20:42:21', NULL),
(15, 'new category from database class', '2021-09-08 20:42:21', NULL),
(16, 'new category from database class', '2021-09-08 20:42:22', NULL),
(17, 'new category from database class', '2021-09-08 20:43:07', NULL),
(18, 'new category from database class', '2021-09-08 20:43:07', NULL),
(19, 'new category from database class', '2021-09-08 20:43:08', NULL),
(20, 'new category from database class', '2021-09-08 20:43:08', NULL),
(21, 'test insert id', '2021-09-09 14:53:40', NULL),
(22, 'test insert id', '2021-09-09 14:53:42', NULL),
(23, 'test insert id', '2021-09-09 14:53:49', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cat_prod`
-- (See below for the actual view)
--
CREATE TABLE `cat_prod` (
);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `city` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `city`, `created_at`, `updated_at`) VALUES
(1, 'coustomer 1', 'coustomer1@gmail.com', 'b081132c034be399d48565715e9676687b782f82', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(2, 'coustomer 2', 'coustomer2@gmail.com', 'cff788778e5a2123e5c18c5039f77bb14ebd9c12', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(3, 'coustomer 3', 'coustomer3@gmail.com', '2faaad04fae0988e785766f0e3f46c8bb7e6e815', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(4, 'coustomer 4', 'coustomer4@gmail.com', 'abb6ede37615fb5ca5112d2e16ef1ea0ed4c4842', 'domiat', '2021-04-25 22:47:10', '2021-08-17 17:49:26'),
(5, 'coustomer 5', 'coustomer5@gmail.com', 'f369140c315cad8a42dd121d4e0ac24932ee39d0', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(6, 'coustomer 6', 'coustomer6@gmail.com', '693049b95848071c12a15ba94bd159cfccac524d', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(7, 'coustomer 7', 'coustomer7@gmail.com', '7a2ae562e5dcb5161b2bd5a2bb439f4325bfb25e', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(8, 'coustomer 8', 'coustomer8@gmail.com', 'cc5e71202e490d7fa938f34a6f8b46564176f7b3', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(9, 'coustomer 9', 'coustomer9@gmail.com', '10781d8f5454a9d4f69682fd05034fc30c630cff', 'alex', '2021-04-25 22:47:10', '2021-11-05 22:11:05'),
(10, 'coustomer 10', 'coustomer10@gmail.com', '3ba4c5ba075e63342222ba062a85535525cc36e1', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(11, 'coustomer 11', 'coustomer11@gmail.com', '72aa5da4aae84fa0c2cbd4fb5c62a93c376c1cd3', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(12, 'user number 1', 'user@gmail.com', '2faaad04fae0988e785766f0e3f46c8bb7e6e815', 'cairo', '2021-04-26 03:23:19', '2021-08-17 12:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `created_at`) VALUES
(1, 1, '2021-04-25 22:51:01'),
(2, 2, '2021-04-25 22:51:01'),
(3, 3, '2021-04-25 22:51:01'),
(4, 4, '2021-04-25 22:51:01'),
(5, 5, '2021-04-25 22:51:01'),
(6, 6, '2021-04-25 22:51:01'),
(7, 7, '2021-04-25 22:51:01'),
(8, 8, '2021-04-25 22:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_content`
--

CREATE TABLE `order_content` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_content`
--

INSERT INTO `order_content` (`order_id`, `product_id`) VALUES
(1, 24),
(1, 8),
(1, 29),
(1, 27),
(2, 21),
(2, 28),
(2, 12),
(2, 12),
(3, 3),
(3, 15),
(3, 2),
(3, 26),
(4, 5),
(4, 10),
(4, 26),
(4, 10),
(5, 11),
(5, 20),
(5, 19),
(5, 4),
(6, 30),
(6, 12),
(6, 12),
(6, 1),
(7, 6),
(7, 19),
(7, 21),
(7, 26);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `qty` smallint(4) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `category_id`, `name_product`, `price`, `qty`, `image`) VALUES
(1, 6, 'product number 1', 982, 599, '6193eb9a11c949.17886772.png'),
(2, 6, 'product number 2', 653, 518, '6193eba692fe95.79209042.png'),
(3, 6, 'product number 3', 1813, 500, '6193ebc848ad02.97437115.png'),
(4, 3, 'product number 4', 1133, 500, '6193ebd26f5954.28547572.png'),
(5, 6, 'product number 5', 1438, 500, '6193ebdba80a34.35434359.png'),
(6, 4, 'product number 6', 330, 575, '6193ebe6ae3ec8.38337604.png'),
(7, 5, 'product number 7', 330, 591, '6193ebf20565d4.53150250.png'),
(8, 5, 'product number 8', 939, 563, '6193ec46dedbe2.33423523.png'),
(9, 2, 'product number 9', 826, 577, '6193ec537e7d31.30009184.png'),
(10, 3, 'product number 10', 1801, 542, '6193ec6ab76214.55210890.png'),
(11, 4, 'product number 11', 576, 530, '6193ec823cd7e3.64559273.png'),
(12, 6, 'product number 12', 325, 566, '6193ec904382c2.02784354.png'),
(13, 4, 'product number 13', 1623, 576, '6193ec9c068963.18527759.png'),
(14, 3, 'product number 14', 1447, 534, '6193eca8eb0a00.01075879.png'),
(15, 3, 'product number 15', 859, 507, '6193ecbb371392.40245915.png'),
(16, 2, 'product number 16', 393, 350, '6193ecce27d9e8.55257358.png'),
(17, 5, 'product number 17', 633, 350, '6193ecdd57b8b2.89518115.png'),
(18, 2, 'product number 18', 762, 350, '6193eceb39a8b6.46668849.png'),
(19, 5, 'product number 19', 493, 594, '6193ed04431785.84125063.png'),
(20, 6, 'product number 20', 1533, 576, '6193ed17421349.82814412.png'),
(21, 2, 'product number 21', 700, 580, '6193ed5df2c949.53051017.png'),
(22, 2, 'product number 22', 700, 553, '6193ed71b27082.73352626.png'),
(23, 3, 'product number 23', 705, 558, '6193ed86416192.68844751.png'),
(24, 5, 'product number 24', 212, 513, '6193ed9bc217e8.10486138.png'),
(25, 5, 'product number 25', 729, 574, '6193edd212ee83.75500519.png'),
(26, 4, 'product number 26', 778, 544, '6193edde96c284.09085846.png'),
(27, 5, 'product number 27', 1500, 553, '6193edec3500f9.56395565.png'),
(28, 3, 'product number 28', 1500, 545, '6193edfdda3440.24053715.png'),
(29, 3, 'product number 29', 1255, 400, '6193ee11bf9b19.35015334.png'),
(30, 4, 'product number 30', 1292, 400, '6193ee277f70f9.67507492.png'),
(31, 2, 'product number 32', 230, 220, '6193ee3e7effe8.12958524.png');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `password`, `city`, `created_at`, `updated_at`) VALUES
(1, 'coustomer 1', 'coustomer1@gmail.com', 'b081132c034be399d48565715e9676687b782f82', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(2, 'coustomer 2', 'coustomer2@gmail.com', 'cff788778e5a2123e5c18c5039f77bb14ebd9c12', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(3, 'coustomer 3', 'coustomer3@gmail.com', '2faaad04fae0988e785766f0e3f46c8bb7e6e815', 'giza', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(4, 'coustomer 4', 'coustomer4@gmail.com', 'abb6ede37615fb5ca5112d2e16ef1ea0ed4c4842', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(5, 'coustomer 5', 'coustomer5@gmail.com', 'f369140c315cad8a42dd121d4e0ac24932ee39d0', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(6, 'coustomer 6', 'coustomer6@gmail.com', '693049b95848071c12a15ba94bd159cfccac524d', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(7, 'coustomer 7', 'coustomer7@gmail.com', '7a2ae562e5dcb5161b2bd5a2bb439f4325bfb25e', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(8, 'coustomer 8', 'coustomer8@gmail.com', 'cc5e71202e490d7fa938f34a6f8b46564176f7b3', 'giza', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(9, 'coustomer 9', 'coustomer9@gmail.com', '10781d8f5454a9d4f69682fd05034fc30c630cff', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(10, 'coustomer 10', 'coustomer10@gmail.com', '3ba4c5ba075e63342222ba062a85535525cc36e1', 'giza', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(11, 'coustomer 11', 'coustomer11@gmail.com', '72aa5da4aae84fa0c2cbd4fb5c62a93c376c1cd3', 'cairo', '2021-04-25 22:47:10', '2021-08-17 12:19:38'),
(12, 'user number 1', 'user@gmail.com', '2faaad04fae0988e785766f0e3f46c8bb7e6e815', 'cairo', '2021-04-26 03:23:19', '2021-08-17 12:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `test_prods`
--

CREATE TABLE `test_prods` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `descreption` varchar(100) NOT NULL DEFAULT 'default string',
  `code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `parent_id`) VALUES
(2, 'ahamd mostafa', 'user_2@gamil.com', NULL),
(3, 'user number 3', 'user_3@gamil.com', 2),
(4, 'user number 4', 'user_4@gamil.com', NULL),
(5, 'user number 5', 'user_5@gamil.com', 4),
(6, 'user number 6', 'user_6@gamil.com', NULL),
(7, 'user number 7', 'user_7@gamil.com', 6),
(8, 'user number 8', 'user_8@gamil.com', NULL),
(9, 'user number 9', 'user_9@gamil.com', 8),
(10, 'user number 10', 'user_10@gamil.com', NULL),
(11, 'user number 11', 'user_11@gamil.com', 10),
(12, 'user number 12', 'user_12@gamil.com', NULL),
(13, 'user number 13', 'user_13@gamil.com', 12),
(14, 'user number 14', 'user_14@gamil.com', NULL),
(15, 'user number 15', 'user_15@gamil.com', 14),
(16, 'user number 16', 'user_16@gamil.com', NULL),
(17, 'user number 17', 'user_17@gamil.com', 16),
(18, 'user number 18', 'user_18@gamil.com', NULL),
(19, 'user number 19', 'user_19@gamil.com', 18),
(20, 'user number 20', 'user_20@gamil.com', NULL),
(21, 'user number 21', 'user_21@gamil.com', 20),
(22, 'user number 22', 'user_22@gamil.com', NULL),
(23, 'user number 23', 'user_23@gamil.com', 22),
(24, 'user number 24', 'user_24@gamil.com', NULL),
(25, 'user number 25', 'user_25@gamil.com', 24),
(26, 'user number 26', 'user_26@gamil.com', NULL),
(27, 'user number 27', 'user_27@gamil.com', 26),
(28, 'user number 28', 'user_28@gamil.com', NULL),
(29, 'user number 29', 'user_29@gamil.com', 28),
(30, 'user number 30', 'user_30@gamil.com', NULL),
(31, 'user name', 'newemail@gmail.com', NULL),
(32, 'user name', 'newemail2@gmail.com', NULL),
(33, 'NAME WITH TRIGER0.18784380255997535', 'EMAILWITHTRIGGERA0.6248963136457804@GMAIL.COM', NULL),
(34, 'USER0.7263427960931722', 'user0.4544954462484414@gmail.com', NULL);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `up_chars` BEFORE INSERT ON `users` FOR EACH ROW SET NEW.name = UPPER(NEW.name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `cat_prod`
--
DROP TABLE IF EXISTS `cat_prod`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cat_prod`  AS SELECT `products`.`name` AS `prod_name`, `categories`.`name` AS `cat_name` FROM (`products` join `categories` on(`categories`.`id` = `products`.`category_id`)) LIMIT 0, 5 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_index` (`customer_id`),
  ADD KEY `customer_id_index` (`customer_id`);

--
-- Indexes for table `order_content`
--
ALTER TABLE `order_content`
  ADD KEY `order_index` (`order_id`),
  ADD KEY `product_index` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_email` (`email`);

--
-- Indexes for table `test_prods`
--
ALTER TABLE `test_prods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `quantity` (`quantity`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `test_prods`
--
ALTER TABLE `test_prods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_content`
--
ALTER TABLE `order_content`
  ADD CONSTRAINT `order_content_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_content_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`);

--
-- Constraints for table `test_prods`
--
ALTER TABLE `test_prods`
  ADD CONSTRAINT `test_prods_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
