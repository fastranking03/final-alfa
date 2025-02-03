-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 03, 2025 at 06:45 PM
-- Server version: 8.0.40-0ubuntu0.22.04.1
-- PHP Version: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Alfa`
--

-- --------------------------------------------------------

--
-- Table structure for table `alfa_cart`
--

CREATE TABLE `alfa_cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `product_size` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `product_price` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `product_image` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alfa_cart`
--

INSERT INTO `alfa_cart` (`id`, `user_id`, `product_id`, `product_name`, `product_size`, `product_price`, `quantity`, `product_image`, `created_at`) VALUES
(52, 2, 16, 'Giordano Big Paisley', 'M', '89.95', 1, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737732199/product-images/nnrskmccwjszvzzmli6g.png', '2025-02-03 14:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `alfa_users`
--

CREATE TABLE `alfa_users` (
  `id` int NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `otp` int DEFAULT NULL,
  `otp_expiry` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alfa_users`
--

INSERT INTO `alfa_users` (`id`, `name`, `email`, `password`, `type`, `status`, `otp`, `otp_expiry`, `created_at`) VALUES
(2, 'Arif Khanfswf', 'fastranking03@gmail.com', '$2b$10$dfrd.PnNwlkSvox5qH8Q9.WJDH1vaIGVrPLHtaejQeupzUpOGqNM.', '0', '0', 0, '', '2025-01-29 11:49:12'),
(3, 'Alfa Mens', 'alfamens@gmail.com', '$2b$10$dfrd.PnNwlkSvox5qH8Q9.WJDH1vaIGVrPLHtaejQeupzUpOGqNM.', 'admin', '0', 0, '', '2025-01-25 17:34:04'),
(5, 'Vani Mendiratta', 'vani.mendiratta@fastranking.tech', '$2b$10$QsPWvcgN.Aqscclo.IpZLOGFeEfYpFi1CFhJNTwgQTeMEu3R2OTJq', 'user', '0', NULL, NULL, '2025-01-29 12:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `alfa_whislist`
--

CREATE TABLE `alfa_whislist` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `product_size` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `product_image` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alfa_whislist`
--

INSERT INTO `alfa_whislist` (`id`, `user_id`, `product_id`, `product_name`, `product_size`, `product_price`, `quantity`, `product_image`, `created_at`) VALUES
(38, 2, 16, 'Giordano Big Paisley', NULL, '89.95', 1, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737732199/product-images/nnrskmccwjszvzzmli6g.png', '2025-02-03 10:35:39'),
(41, 5, 19, 'Giordano Oceanlife', NULL, '89.95', 1, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737726758/test-product-images/d4taqbnwmne91j04glih.jpg', '2025-02-03 12:41:45'),
(42, 5, 29, 'Olymp White Luxor Modern', NULL, '89.95', 1, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737738216/test-product-images/r4yjiv1qjllobsrxk2zi.jpg', '2025-02-03 12:46:30'),
(43, 5, 23, 'Giordano Floral Cuff ', NULL, '89.95 ', 1, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737731147/test-product-images/blu5f2c5qnuhe58wluyp.jpg', '2025-02-03 12:47:27'),
(44, 3, 11, 'Cavani Alvari Trousers', NULL, '74.99', 1, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737716613/test-product-images/tnaxjbwswz1j3hmtul7z.jpg', '2025-02-03 13:08:51'),
(47, 3, 12, 'Cavani Artega Charcoal', NULL, '99.95', 1, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601577/product-images/zhokrhxdoswzuwmhjxmx.webp', '2025-02-03 17:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int NOT NULL,
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `wear_type_id` int NOT NULL,
  `cat_name` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `cat_slug` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `is_accessories` int NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `wear_type_id`, `cat_name`, `cat_slug`, `is_accessories`, `status`, `created_at`) VALUES
(1, 1, 'Shirts', 'shirts', 1, 'active', '2025-01-24 10:18:50'),
(2, 2, 'Jeans', 'jeans', 1, 'active', '2025-01-24 10:18:54'),
(3, 2, 'Trousers ', 'trousers ', 1, 'active', '2025-01-24 10:18:59'),
(4, 1, 'Tshirts', 'tshirts', 1, 'active', '2025-01-24 10:19:02'),
(5, 1, 'Suits', 'suits', 1, 'active', '2025-01-24 10:19:11'),
(6, 1, 'Jackets', 'jackets', 1, 'active', '2025-01-24 10:19:06'),
(7, 1, 'Polos', 'polos', 1, 'active', '2025-01-24 10:19:14'),
(8, 1, 'Knitwear', 'knitwear', 1, 'active', '2025-01-24 10:19:17'),
(9, 4, 'Wallets', 'wallets', 0, 'active', '2025-01-24 10:19:21'),
(10, 3, 'Shoes', 'shoes', 0, 'active', '2025-01-24 10:21:20'),
(13, 4, 'Belts', 'belts', 0, 'active', '2025-01-29 09:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `address_2` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address_type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `default_address` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `postcode` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `user_id`, `full_name`, `mobile`, `email`, `address`, `address_2`, `city`, `address_type`, `default_address`, `postcode`, `created_at`) VALUES
(4, 2, 'Vani Mendiratta', '1050505005', 'vani.mendiratta@fastranking.tech', 'dsa', 'jjj', 'Uk', 'Commercial', 'no', '2okk', '2025-01-30 09:15:25'),
(5, 2, 'Haris Khan', '9027373518', 'fastranking03@gmail.com', 'Lotus', 'sdfrsd', 'UK', 'Personal', 'yes', 'lu33qb', '2025-01-30 09:15:16'),
(6, 5, 'satpal Singh', '6396144772', 'fastranking015@gmail.com', 'Future House The Moakes, Luton LU3 3QB, UK', 'Future House The Moakes, Luton LU3 3QB, UK', 'Delhi', 'Commercial', 'no', 'LU3 3QB', '2025-01-29 12:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `get_in_touch`
--

CREATE TABLE `get_in_touch` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `message` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `get_in_touch`
--

INSERT INTO `get_in_touch` (`id`, `name`, `email`, `contact`, `subject`, `message`, `created_at`) VALUES
(4, 'Arif Khan', 'fastranking03@gmail.com', '1828828282', 'New One', 'warqwer', '2025-01-29 10:52:07'),
(5, 'Satpal Singh', 'fastranking015@gmail.com', '6396148772', 'mujhe jeans lena hai ', 'HI jone', '2025-01-29 13:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_type`
--

CREATE TABLE `inventory_type` (
  `id` int NOT NULL,
  `i_type` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `type_url` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_type`
--

INSERT INTO `inventory_type` (`id`, `i_type`, `type_url`, `status`, `created_at`) VALUES
(1, 'Top', 'top-wear', 'active', '2025-01-24 14:17:58'),
(2, 'Bottom', 'bottom-wear', 'active', '2025-01-24 14:18:03'),
(3, 'Footwear', 'footwear', 'active', '2025-01-24 10:05:48'),
(4, 'Accessories', 'accessories', 'active', '2025-01-24 10:05:59');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `new_order`
--

CREATE TABLE `new_order` (
  `id` int NOT NULL,
  `paypal_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `order_id` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  `total_price` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_type` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_status` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `new_order`
--

INSERT INTO `new_order` (`id`, `paypal_id`, `order_id`, `user_id`, `address_id`, `total_price`, `payment_method`, `payment_type`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(98, '5U32052549144500J', 'ALFA0005', 2, 2, '99.95', 'Paypal', '', 'CANCELLED', 'PENDING', '2025-01-25 17:13:50', '2025-01-24 17:18:39'),
(99, '8H189371HH113701C', 'ALFA0006', 2, 2, '89.95', 'Paypal', '', 'DELIVERED', 'PENDING', '2025-01-25 17:39:14', '2025-01-25 16:26:24'),
(100, '68B0045159850061R', 'ALFA0007', 2, 3, '89.95', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-27 14:45:21', '2025-01-27 14:45:21'),
(101, '43U86284G4012784S', 'ALFA0008', 2, 4, '89.95', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-27 17:04:15', '2025-01-27 17:04:15'),
(102, '8P9473284M6637510', 'ALFA0009', 2, 4, '89.95', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-28 10:43:20', '2025-01-28 10:43:20'),
(103, '6KL083970V580912S', 'ALFA0010', 2, 4, '269.85', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-28 17:51:37', '2025-01-28 17:51:37'),
(104, '9VD37142HY801000M', 'ALFA0011', 2, 4, '179.90', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-28 17:56:00', '2025-01-28 17:56:00'),
(105, '82H37970H3444413X', 'ALFA0012', 2, 3, '179.90', 'Paypal', '', 'CANCELLED', 'PENDING', '2025-01-29 09:30:38', '2025-01-28 17:58:09'),
(106, '4RN046196G117433M', 'ALFA0013', 5, 6, '179.90', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-29 12:31:51', '2025-01-29 12:31:51'),
(107, '2F269434RL052314K', 'ALFA0014', 5, 6, '269.85', 'Paypal', '', 'SHIPPED', 'PENDING', '2025-02-03 13:05:34', '2025-01-29 12:32:21'),
(108, '8A342940ND842644Y', 'ALFA0015', 2, 5, '74.99', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-29 12:51:48', '2025-01-29 12:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `new_order_itemsss`
--

CREATE TABLE `new_order_itemsss` (
  `id` int NOT NULL,
  `orders_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_order_itemsss`
--

INSERT INTO `new_order_itemsss` (`id`, `orders_id`, `product_id`, `quantity`, `created_at`) VALUES
(140, 97, 4, 1, '2025-01-23 16:25:30'),
(141, 98, 12, 1, '2025-01-24 17:18:39'),
(142, 99, 16, 1, '2025-01-25 16:26:24'),
(143, 100, 14, 1, '2025-01-27 14:45:21'),
(144, 101, 14, 1, '2025-01-27 17:04:15'),
(145, 102, 14, 1, '2025-01-28 10:43:20'),
(146, 103, 14, 1, '2025-01-28 17:51:37'),
(147, 103, 18, 1, '2025-01-28 17:51:37'),
(148, 103, 23, 1, '2025-01-28 17:51:37'),
(149, 104, 14, 1, '2025-01-28 17:56:00'),
(150, 104, 23, 1, '2025-01-28 17:56:00'),
(151, 105, 14, 1, '2025-01-28 17:58:09'),
(152, 105, 23, 1, '2025-01-28 17:58:09'),
(153, 106, 16, 1, '2025-01-29 12:31:51'),
(154, 106, 23, 1, '2025-01-29 12:31:51'),
(155, 107, 16, 2, '2025-01-29 12:32:21'),
(156, 107, 23, 1, '2025-01-29 12:32:21'),
(157, 108, 11, 1, '2025-01-29 12:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `order_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  `total_price` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_size` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `price` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `wear_type_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `p_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `p_price` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discount` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `p_main_price` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `p_url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `p_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `similar_product` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `p_image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `p_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `p_key_features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sku` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `barcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `colour` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `new_arrival` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `best_seller` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `wear_type_id`, `cat_id`, `p_name`, `p_price`, `discount`, `p_main_price`, `p_url`, `p_title`, `similar_product`, `p_image`, `p_desc`, `p_key_features`, `tags`, `brand`, `sku`, `barcode`, `colour`, `new_arrival`, `best_seller`, `position`, `status`, `created_at`) VALUES
(11, 2, 3, 'Cavani Alvari Trousers', '74.99', '0', '74.99', 'cavani-alvari-trousers', 'Cavani Alvari Trousers', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601339/product-images/kn7uaerghsiahhwn2k9e.webp', '                                                                                                                                                                                                                                                                                                                                                 Introducing the Alvari Navy Trousers – a blend of style and comfort. Crafted from a unique composition of 46% linen, 38% rayon, 14% Sorona, and 2% spandex, this blazer offers a perfect balance of brea                                                                                                                                                                                               \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '', '', '100423', '5060000000000', 'Navy', 'no', 'no', 1, 1, '2025-02-03 16:49:00'),
(12, 1, 6, 'Cavani Artega Charcoal', '99.95', '0', '99.95', 'cavani-artega-charcoal', 'Cavani Artega Charcoal', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601577/product-images/zhokrhxdoswzuwmhjxmx.webp', '                                                                                                                                                A classic blend of style and comfort. Crafted from 100% cotton, this jacket offers a breathable and soft feel. The zip-up design adds a touch of modern functionality, making it versatile for various occasions. Elevate your casual wardrobe with the timeless appeal of the Artega Jacket, where pure cotton meets effortless style in a convenient zip-up silhouette.                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '', '', '100436', '5060000000000', '', 'no', 'no', 1, 1, '2025-02-03 16:52:58'),
(13, 2, 2, 'Cavani Milano Pants Black', '89.95', '0', '89.95', 'cavani-milano-pants-black', 'Cavani Milano Pants Black', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601736/product-images/gv3ogtyhiegw0fr1qdfl.jpg', '                                                                                                Cavani Milano Black Stretch Denim Jeans.                                                                                                                                                                                                                                               \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '', '', '100681', '5060000000000', 'Black', '', '', 1, 1, '2025-02-03 16:58:10'),
(14, 2, 2, 'Cavani Elliot Jeans', '89.95', '0', '89.95', 'cavani-elliot-jeans', 'Cavani Elliot Jeans', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738602095/product-images/dzuyv0suhvjxmv4uaebm.webp', '                                                Elliot Indigo Stretch Slim Fit Jeans and 5 Pocket Stretch Jeans.                                                \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '100591', '5060000000000', '', 'no', 'no', 1, 1, '2025-02-03 17:01:36'),
(15, 2, 2, 'Cavani Evans Grey Jeans', '89.95', '0', '89.95', 'cavani-evans-grey-jeans', 'Cavani Evans Grey Jeans', 'yes', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603060/product-images/qg2sm6kedce49ipjglm8.webp', '                                                                                                Evans Grey Stretch Slim Fit Jeans                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '', '', '100605', '5060000000000', 'Grey ', 'no', 'yes', 1, 1, '2025-02-03 17:17:41'),
(16, 1, 1, 'Giordano Big Paisley', '89.95', '0', '89.95', 'giordano-big-paisley', 'Giordano Big Paisley', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603812/product-images/tuzbq7katabcernwlv2w.webp', '                                                                                                                                                                                                                                                                                                                                                Maggiore, Long Sleeve, Semi Cutaway Collar.                                                                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '', '', '101180', '8720000000000', '', 'no', 'no', 1, 1, '2025-02-03 17:30:12'),
(17, 1, 1, 'Giordano Fancy Flower Print', '119.95', '0', '119.95', 'giordano-fancy-flower-print', 'Giordano Fancy Flower Print', 'yes', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603866/product-images/ntvoppyzsbe94hev98bb.webp', '                                                                                                                                                Maggiore, Long Sleeve, Semi Cutaway Collar Fancy Flower Print 100% Cotton.\r\n\r\n                                              \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '', '', '101190', '8720000000000', '', 'yes', 'yes', 1, 1, '2025-02-03 17:31:07'),
(18, 1, 1, 'Giordano Fancy Safari', '89.95', '0', '89.95', 'giordano-fancy-safari', 'Giordano Fancy Safari', 'yes', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603912/product-images/rrpkmmhh6luzc0mtgq8m.webp', '                                                                                                Maggiore, Long Sleeve, Semi Cutaway Collar Fancy Safari Print 97% Cotton 3% Elasthane.                                                \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            ', '', '', '101195', '', '', 'yes', 'yes', 1, 1, '2025-02-03 17:31:53'),
(19, 1, 1, 'Giordano Oceanlife', '89.95', '0', '89.95', 'giordano-oceanlife', 'Giordano Oceanlife', 'yes', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603958/product-images/hxwnxhs0ia6tcfcshem5.webp', '                                                                                                Oceanlife Long Sleeve Button Down Collar                                                \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            ', '', '', '101227', '8720000000000', '', 'yes', 'yes', 1, 1, '2025-02-03 17:32:38'),
(20, 1, 6, 'Giordano Peppe Packable Coat', '299', '0', '299', 'giordano-peppe-packable-coat', 'Giordano Peppe Packable Coat', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603721/product-images/p3dstimlfnrhuffvtlmk.webp', '                                                Peppe Packable Parka Lightweight Jacket Water & Windproof with removable hood. Inside pocket 88% polyester, 12% elastane Wash inside out.                                          \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '101248', '8720000000000', '', 'no', 'no', 1, 1, '2025-02-03 17:28:41'),
(21, 1, 5, 'Giordano Robert Blazer', '249', '0', '249', 'giordano-robert-blazer', 'Giordano Robert Blazer', '', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604084/product-images/un2bcbaj4yyeqfbhu0jz.webp', '                                                Blazer Robert Twill Print with Tencel, brown/multicolour big paisley print.                                                \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '101249', '8720000000000', '', 'no', 'no', 1, 1, '2025-02-03 17:34:44'),
(22, 1, 1, 'Giordano Floral Cuff', '89.95', '0', '89.95', 'giordano-floral-cuff', 'Giordano Floral Cuff', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604130/product-images/bqwguz6egkyl9laiwfyj.webp', '                                                 Maggiore, Long Sleeve Semi Cutaway Collar Mid Blue Fine Twill with Contrast Cuff and Collar 100% Cotton                                               \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '101196', '872000000000', 'Light Blue', 'no', 'no', 1, 1, '2025-02-03 17:35:31'),
(23, 1, 1, 'Giordano Floral Cuff', '89.95', '0', '89.95', 'giordano-floral-cuff', 'Giordano Floral Cuff', 'yes', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604275/product-images/e4nuhncca4irafuvivst.webp', '                                                Maggiore, Long Sleeve Semi Cutaway Collar, White Fine Twill with Contrast Cuff and Collar.                                             \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '101201', '8720000000000', 'White', 'yes', 'yes', 1, 1, '2025-02-03 17:37:55'),
(24, 1, 1, 'Giordano Floral Cuff', '89.95', '0', '89.95', 'giordano-floral-cuff', 'Giordano Floral Cuff', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604313/product-images/ajftmhq28owkxhwo2fba.webp', '                                                Maggiore, Long Sleeve Semi Cutaway Collar Navy Fine Twill with Floral Contrast Cuf And Collar 100%  Cotton\r\n                                                \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '101211', '8720000000000', 'Navy', 'no', 'no', 1, 1, '2025-02-03 17:38:34'),
(25, 1, 1, 'Giordano Floral Cuff ', '89.95', '0', '89.95', 'giordano-floral-cuff', 'Giordano Floral Cuff ', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604348/product-images/fxfozdvhqq6qpljteamh.webp', '                                                 Maggiore, Long Sleeve Semi Cutaway Collar Light Pink Fine Twill with Floral Contrast Cuf And Collar 100%  Cotton\r\n                                                                                              \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            ', '', '', '101206', '8720000000000', 'Pink', 'no', 'no', 1, 1, '2025-02-03 17:39:08'),
(26, 1, 6, 'Giordano Leo Tech', '299', '0', '299', 'giordano-leo-tech', 'Giordano Leo Tech', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604401/product-images/mbdznfyadecqonrbwvy2.webp', '                                                Leo Technical Jacket Laser Fused Real Down Parka with removable hood Water & windproof Fabric. Inside pocket 88% polyester, 12% elastane Wash inside out                                                \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '101219', '8720000000000', '', 'no', 'no', 1, 1, '2025-02-03 17:40:02'),
(27, 1, 5, 'Cavani Caridi Navy Blazer', '199', '0', '199', 'cavani-caridi-navy-blazer', 'Cavani Caridi Navy Blazer', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604491/product-images/n1p4ophc6vkbbgdhsiol.webp', '                                                The Caridi single-breasted Blazer is a refined choice for the modern gentleman. This suit is crafted from a blend of 61% Polyester and 39% Viscose, ensuring a smooth and comfortable fit. This single-breast, fully lined Blazer, offers a perfect blend of style and sophistication. Perfect for both special occasions and a normal day at the office. Matching Waistcoats and Trousers are also available.                                                \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '100459', '5060000000000', 'Navy', 'no', 'no', 1, 1, '2025-02-03 17:41:32'),
(28, 1, 5, 'Cavani Caridi Wasitcoat Navy ', '89.95', '0', '89.95', 'cavani-caridi-wasitcoat-navy', 'Cavani Caridi Wasitcoat Navy ', 'yes', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604565/product-images/gn56fitvfbzgtev4iw1i.webp', '                                                The Caridi Navy Waistcoat is a refined choice for the modern gentleman. This suit is crafted from a blend of 61% Polyester and 39% Viscose, ensuring a smooth and comfortable fit. Perfect for both special occasions and a normal day at the office.                                                                                                \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            ', '', '', '100526', '5060000000000', 'Navy', 'no', '', 1, 1, '2025-02-03 17:42:46'),
(29, 1, 1, 'Olymp White Luxor Modern', '89.95', '0', '89.95', 'olymp-white-luxor-modern', 'Olymp White Luxor Modern', 'yes', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737738216/test-product-images/r4yjiv1qjllobsrxk2zi.jpg', 'Simply wash, dry and wear – OLYMP Luxor\'s modern fit stays smooth all day even without ironing. The wrinkle-free and non-iron business shirt made from 100% cotton always looks good. The white-coloured fabric is breathable, kind to the skin and stays immaculate no matter how stressful and long your working day may be.                                                                                                                                                                                           \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '', '', '102129', '4060000000000', 'White', 'yes', 'yes', 1, 1, '2025-01-25 09:46:52'),
(30, 1, 1, 'Olymp White Contrast', '89.95', '0', '89.95', 'olymp-white-contrast', 'Olymp White Contrast', 'yes', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737739234/test-product-images/q3bry7zzfvudcq9w6wgx.jpg', 'LYMP Luxor business shirt made of fine cotton in a sporty, slim-fitting cut. The Global Kent collar finishes off the look in a chic, cosmopolitan way. 100% cotton, lightweight chambray weave, skin-friendly, easy-care and non-iron. A special eye-catcher is a contrasting trim.                                                                                                \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '102142', '4070000000000', 'White', 'yes', 'yes', 1, 1, '2025-01-25 09:46:17'),
(31, 1, 1, 'Olymp Mauve Luxor Modern', '89.95', '0', '89.95', 'olymp-mauve-luxor-modern', 'Olymp Mauve Luxor Modern', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737740054/test-product-images/ii6tm8qjoppd1dlsahja.jpg', '                                                Festive OLYMP Luxor shirts are both sophisticated and elegant and underline any special occasion look in a very unique way. The particularly finely spun yarns have a lightweight and elegant texture. The modern Global Kent collar shape goes perfectly with the attractive, close-fitting modern fit. Easy care and non-iron.                                              \r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '102118', '4070000000000', 'Mauve', 'no', 'no', 1, 1, '2025-01-25 11:03:18'),
(32, 1, 1, 'Olymp Marine Luxor Modern ', '99.95', '0', '99.95', 'olymp-marine-luxor-modern', 'Olymp Marine Luxor Modern ', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737740312/test-product-images/asf46fziknbepbovsh96.jpg', 'Pixel-sharp colour gradients and an all-over floral pattern with marine accents make this Luxor business shirt a real eye-catcher. Designed in a sporty Modern fit, finished with a fashionable Global Kent collar. 100% cotton, easy-care and time-saving non-iron.\r\n                                            \r\n                                            ', '                                                                                                \r\n                                            \r\n                                            ', '', '', '102114', '4070000000000', '', 'no', 'no', 1, 1, '2025-01-25 11:13:09'),
(33, 1, 8, 'MASSOTI Navy Cardigan W10', '99.95', '0', '99.95', 'massoti-navy-cardigan-w10', 'MASSOTI Navy Cardigan W10', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737797435/test-product-images/bgku5q51mpilswu182q2.png', 'Merino Wool V Neck long sleeve, button-down front cardigan with 2 pockets. This beautiful cardigan is lovely, and soft and is crafted from Extra Fine 100% Pure Merino Wool.\r\n                                            ', '                                                \r\n                                            ', '', '', '101650', 'W102XL', 'Navy', 'no', 'no', 1, 1, '2025-01-25 09:43:27'),
(34, 1, 8, 'MASSOTI L05', '89.95', '0', '89.95', 'massoti-l05', 'MASSOTI L05', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737797810/test-product-images/j7osp3u1riahgpwcqiko.png', 'Raspberry crew neck jumper. crafted from 100% Lambswool.', '                                                                                                \r\n                                            \r\n                                            ', '', '', '101642', 'L052XL', 'Raspberry', 'no', 'no', 1, 1, '2025-01-25 09:42:39'),
(35, 1, 8, 'MASSOTI Shawl Cardigan L07', '120', '0', '120', 'massoti-shawl-cardigan-l07', 'MASSOTI Shawl Cardigan L07', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737798097/test-product-images/lz9ioxfh4sjctjgwktcs.jpg', 'Massoti Ribbed Shawl Collar Cardigan in Fawn crafted from 100% Lambswool. It is a heavier weight, a regular fit piece with five contrasting contemporary look buttons.\r\n                                            ', '                                                \r\n                                            ', '', '', '101664', 'L072XL', '', 'no', 'no', 1, 1, '2025-01-25 09:41:57'),
(36, 2, 3, 'Cavani Fredrik Trousers', '74.99', '0', '74.99', 'cavani-fredrik-trousers', 'Cavani Fredrik Trousers', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737800039/test-product-images/mdeybkk4qp9ukyjvrlky.png', 'The Fredrik trouser is a high-quality clothing item made from a blend of linen, cotton, and spandex, resulting in a super soft and stretchy fabric that will ensure comfort and ease of movement.', '', '', '', '100642', '5060000000000', '', 'no', 'no', 1, 1, '2025-01-25 10:13:59'),
(37, 2, 3, 'Cavani Caridi Navy Trousers', '89.95', '0', '89.95', 'cavani-caridi-navy-trousers', 'Cavani Caridi Navy Trousers', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737800750/test-product-images/vihlaf6njwasc1knxnep.png', 'The Caridi Navy Trouser is a refined choice for the modern gentleman. This suit is crafted from a blend of 61% Polyester and 39% Viscose, ensuring a smooth and comfortable fit. This fully lined slim-fit trouser offers a perfect blend of style and sophistication. Perfect for both special occasions and a normal day at the office. A matching Waistcoat and Blazer are also available.', '', '', '', '100474', '5060000000000', 'Navy', 'no', 'no', 1, 1, '2025-01-25 10:25:50'),
(38, 2, 2, 'M5 Slim 1-6283/18', '149', '0', '149', 'm5-slim-1628318', 'M5 Slim 1-6283/18', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737801431/test-product-images/wzbst1iipnssygj5hyqt.jpg', 'This denim in pleasantly soft organic cotton stands out with its exciting multicolour stitching. Thanks to the dark fabric, this playful detail is shown to its best advantage. In a slim fit and with individually hand-applied special effects, this denim will enhance your business outfit and your leisure look. The super-stretch fabric provides maximum freedom of movement and the highest level of comfort. Made in a 100% climate-neutral manner, FAIRLY & responsibly in our European production facilities.', '', '', '', '101534', '4070000000000', '', 'no', 'no', 1, 1, '2025-01-25 10:37:13'),
(39, 1, 1, 'Rose Structured Shirt Modern Fit', '89.95', '0', '89.95', 'rose-structured-shirt-modern-fit', 'Rose Structured Shirt Modern Fit', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737802867/test-product-images/rkrfub9wehgwcxxb3njm.jpg', 'From our premium collection \"1863 by ETERNA\"! With this structured COMFORT FIT shirt you will be a tasteful eye-catcher. Special qualities, cotton fabrics with the best finish, and high-quality workmanship - all these advantages come together in our premium line. This twill shirt is made from pure, non-iron cotton and is, therefore, a guarantee for the best-wearing comfort and feel-good character. It comes with a classic Kent collar, no breast pocket and a comfortable cut. The sewn-in decorative band in the front is a special detail. The hem is rounded to a normal length so that this shirt can also be worn casually over trousers.', '', '', '', '1187', '', 'Rose', 'no', 'no', 1, 1, '2025-01-25 11:01:08'),
(40, 1, 1, 'Orchid structured Shirt Modern Fit', '89.95', '0', '89.95', 'orchid-structured-shirt-modern-fit', 'Orchid structured Shirt Modern Fit', '', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737806293/test-product-images/no1lizrmcavtw8bz29rj.jpg', 'From our premium collection \"1863 by ETERNA\"! With this structured COMFORT FIT shirt you will be a tasteful eye-catcher. Special qualities, cotton fabrics with the best finish, and high-quality workmanship - all these advantages come together in our premium line. This twill shirt is made from pure, non-iron cotton and is, therefore, a guarantee for the best-wearing comfort and feel-good character. It comes with a classic Kent collar, no breast pocket and a comfortable cut. The sewn-in decorative band in the front is a special detail. The hem is rounded to a normal length so that this shirt can also be worn casually over trousers.', '', '', '', '1187', '', 'Orchid', 'no', 'no', 1, 1, '2025-01-25 11:58:13'),
(41, 1, 1, 'Red printed shirt Modern Fit', '89.95', '0', '89.95', 'red-printed-shirt-modern-fit', 'Red printed shirt Modern Fit', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737806577/test-product-images/xcgozgfp5etttrngjw9m.jpg', 'For trendy shirt wearers, we offer you a long-sleeved shirt that complements your outfits casually and fashionably. It is made of non-iron twill (100% cotton) and promises a comfortable fit all day long. This MODERN FIT shirt in a fashionably tailored cut comes with a casual all-over print, buttons in matching colours and a classic Kent collar. The hem is rounded to a normal length so that this shirt (without a breast pocket) can also be worn casually over trousers. The perfect symbiosis of style and comfort.', '', '', '', '2341', '', '', 'no', 'no', 1, 1, '2025-01-25 12:02:57'),
(42, 1, 1, 'Navy printed Shirt Modern Fit', '89.95', '0', '89.95', 'navy-printed-shirt-modern-fit', 'Navy printed Shirt Modern Fit', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737806734/test-product-images/a0dejqqxk5weibmxlrtp.jpg', 'This printed long-sleeve shirt is an absolute eye-catcher! The fashionable shark collar and eye-catching floral print make this shirt (without a breast pocket) a must-have. The slightly tailored cut appeals to those who want a slightly more modern interpretation of the classic look. The hem is rounded at a normal length so that this shirt can also be worn casually outside the trousers. It is made from 100% finest cotton (twill, non-iron) and offers first-class comfort.', '', '', '', '2239', '', 'Navy', 'no', 'no', 1, 1, '2025-01-25 12:05:35'),
(43, 1, 1, 'Purple Plain Shirt Modern Fit', '89.95', '0', '89.95', 'purple-plain-shirt-modern-fit', 'Purple Plain Shirt Modern Fit', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737806998/test-product-images/f4sllsyhid2dc8uauf6d.jpg', 'Opaque, non-slip and non-iron. This shirt only shows what it is supposed to show. It reliably conceals tattoos and body hair. With the opaque ETERNA COVER SHIRT, in a slightly tailored cut, you\'ll be way ahead in terms of fashion. As a half-ply shirt made of 100% cotton (twill, non-iron), the opaque COVER SHIRT offers excellent comfort. The patches on the shark collar and cuffs give it a modern touch. The hem is rounded at a normal length so that this shirt (without a breast pocket) can also be worn casually outside the trousers. Always the right fit, always stylish.', '', '', '', '8224', '', '', 'no', 'no', 1, 1, '2025-01-25 12:09:58'),
(45, 1, 5, 'Cavani Fredrik Half Lined Blazer', '199.00', '0', '199', 'cavani-fredrik-half-lined-blazer', 'Cavani Fredrik Half Lined Blazer', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737808484/test-product-images/zm7pj8broxigpgs3t1ik.png', 'The Fredrik Blazer is a high-quality clothing item made from a blend of linen, cotton, and spandex, resulting in a super soft and stretchy fabric that will ensure comfort and ease of movement. This Bl', '', '', '', '', '', '', 'no', 'no', 1, 1, '2025-01-25 12:34:45'),
(46, 1, 5, 'Cavani Alvari Navy Quarter Lined Blazer', '199.00', '0', '199', 'cavani-alvari-navy-quarter-lined-blazer', 'Cavani Alvari Navy Quarter Lined Blazer', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737808774/test-product-images/x5zemktd6h2rgoume8xp.png', 'Introducing the Alvari Navy Quarter Lined Blazer – a blend of style and comfort. Crafted from a unique composition of 46% linen, 38% rayon, 14% Sorona, and 2% spandex, this blazer offers a perfect bal', '', '', '', '', '', '', 'no', 'no', 1, 1, '2025-01-25 12:39:34'),
(47, 1, 5, 'Giordano Paulo Blazer', '299', '0', '299', 'giordano-paulo-blazer', 'Giordano Paulo Blazer', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737809145/test-product-images/ytvop196n2s3yvb5pwok.jpg', 'Blazer Paulo Unconstructed Knit with Wool in Sand colour.', '', '', '', '101232', '8720000000000', '', 'no', 'no', 1, 1, '2025-01-25 12:45:45'),
(48, 1, 6, 'Cavani Artega Charcoal Jacket', '99.95', '0', '99.95', 'cavani-artega-charcoal-jacket', 'Cavani Artega Charcoal Jacket', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737809673/test-product-images/cmg7lk2kyja4f731ebfp.png', 'A classic blend of style and comfort. Crafted from 100% cotton, this jacket offers a breathable and soft feel. The zip-up design adds a touch of modern functionality, making it versatile for various', '', '', '', '', '', '', 'no', 'no', 1, 1, '2025-01-25 12:54:33'),
(49, 1, 8, 'Cavani Kyle', '79.95', '0', '79.95', 'cavani-kyle', 'Cavani Kyle', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737810137/test-product-images/xsxilthpqc5lvhtplwhr.png', 'Layer your look with our new Cavani Half Zip knit. 100% Cotton. Dry clean only', '', '', '', '100680', '5060000000000', 'Rust', 'no', 'no', 1, 1, '2025-01-25 13:02:18'),
(50, 1, 8, 'Cavani Kyle', '79.95', '0', '79.95', 'cavani-kyle', 'Cavani Kyle', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737810550/test-product-images/t4oylkypvdogiqpykrzk.png', 'Layer your look with our new Cavani Half Zip knit. 100% Cotton. Dry clean only', '', '', '', '100676', '5060000000000', 'Wine', 'no', 'no', 1, 1, '2025-01-25 13:09:11'),
(51, 1, 8, 'Massoti Mustard L30C', '99.95', '0', '99.95', 'massoti-mustard-l30c', 'Massoti Mustard L30C', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737811054/test-product-images/lfa2bl9ugwtkcpeeqgki.png', 'Mustard crew neck, cable knit jumper. crafted from 100% Lambswool.', '', '', '', '101646', 'L30C2xl', '', 'no', 'no', 1, 1, '2025-01-25 13:17:35'),
(52, 3, 10, 'Oliver Sweeny Swanley Boots', '234', '0', '234', 'oliver-sweeny-swanley-boots', 'Oliver Sweeny Swanley Boots', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737813870/test-product-images/iph3oic4ewbueh2ymkgs.png', '                                                Our new zip boot is set on a slightly elongated, square-toed last. The simple classic upper is made from black milled calf leather and has a handy fabric back pull tab. – milled leather has a tumbled, grainy texture with a soft feel. The zip is set on the inner quarter and allows a relatively slim fit around the ankle. We’ve included a half leather lining and insock with cushioned heel. The upper is cemented to a Finproject Extralight sole – a super lightweight but durable compound with a low-profile cleat.\r\n                                            ', '                                                \r\n                                            ', '', '', '102060', '5060000000000', '', 'no', 'no', 1, 1, '2025-01-25 14:20:18'),
(53, 3, 10, 'Oliver Sweny Hayle Trainers', '159', '0', '159', 'oliver-sweny-hayle-trainers', 'Oliver Sweny Hayle Trainers', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737814436/test-product-images/vsx5cgxjc69z15rjuidx.png', 'Our classic low-top cupsole trainer is made from an inky blue calf leather with a soft sheen. The upper is fabric lined with a padded collar lined in suede and a cushioned leather insock. The trainer is made in the traditional way and secured with a side stitch to the white rubber cupsole.', '', '', '', '102067', '5060000000000', 'Navy', 'no', '', 1, 1, '2025-01-25 14:13:57'),
(54, 3, 10, 'Oliver Sweeny Aldeburgh Shoes', '229', '0', '229', 'oliver-sweeny-aldeburgh-shoes', 'Oliver Sweeny Aldeburgh Shoes', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737814771/test-product-images/ds5jiqgw2hukh2g9mfet.png', 'Our Aldeburgh oxford brogue has been your favourite for over 12 years now. We believe it’s the perfect proportions that make this style so versatile and timeless. The classic wingtip brogue has blind eyelets and a slightly elongated toe, which give it a clean profile and the versatility to dress up or down. The dark tan calf leather upper is fully leather lined in calf leather with a leather insock, and Goodyear welted to a leather sole.', '', '', '', '102034', '5060000000000', '', 'no', 'no', 1, 1, '2025-01-25 14:19:32'),
(55, 3, 10, 'Azor Calabria White Trainers', '129.00', '0', '129', 'azor-calabria-white-trainers', 'Azor Calabria White Trainers', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737815208/test-product-images/p4wsszzsznffe5ak6evn.jpg', 'Our Calabria is a premium Trainer, featuring cemented Eva/rubber soles for greater longevity and grip. Capri uses the ‘runner’ last shape for a generous fit and bold toe shape.', '', '', '', 'AzorCalabria', '', '', 'no', 'no', 1, 1, '2025-01-25 14:26:49'),
(56, 3, 10, 'Azor Pompei ZM3829 Navy', '139', '0', '139', 'azor-pompei-zm3829-navy', 'Azor Pompei ZM3829 Navy', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737815730/test-product-images/xvtxljd9x0wvr6z58js9.jpg', 'Our Monument derby shoes make an essential addition to your Azor footwear collections that you\'ll reach for through the seasons. Crafted from smooth leather and with a durable rubber sole.', '', '', '', '100287', 'Pomp44', 'Navy', 'no', 'no', 1, 1, '2025-01-25 14:35:31'),
(57, 3, 10, 'Azor Pompei ZM3840 Black Shoes', '139', '0', '139', 'azor-pompei-zm3840-black-shoes', 'Azor Pompei ZM3840 Black Shoes', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737815942/test-product-images/ry9ymrceddfbcxawvkpx.jpg', '                                                Our Monument derby shoes make an essential addition to your Azor footwear collections that you\'ll reach for through the seasons. Crafted from smooth leather and with a durable rubber sole.\r\n                                            ', '                                                \r\n                                            ', '', '', '100293', 'Bpompe10', 'Black ', 'no', 'no', 1, 1, '2025-01-25 14:39:39'),
(58, 3, 10, 'Azor Pompei ZM3828 Tan', '139.00', '0', '139', 'azor-pompei-zm3828-tan', 'Azor Pompei ZM3828 Tan', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737816215/test-product-images/qdnpqydamb18bqyrkwlq.jpg', 'Our Monument derby shoes make an essential addition to your Azor footwear collections that you\'ll reach for through the seasons. Crafted from smooth leather and with a durable rubber sole.', '', '', '', '100282', 'Pompeitan10', '', 'no', 'no', 1, 1, '2025-01-25 14:43:36');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_image` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_images`
--

CREATE TABLE `pro_images` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `p_images` varchar(250) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pro_images`
--

INSERT INTO `pro_images` (`id`, `product_id`, `p_images`) VALUES
(61, 30, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737739235/test-product-images/olr9b3djezhp0louph8d.jpg'),
(62, 31, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737740055/test-product-images/qxhlmdyjph1ftbhwmykn.jpg'),
(63, 32, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737740314/test-product-images/eektwixbmw0qtaw3vspj.jpg'),
(64, 33, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737797435/test-product-images/kguum9t0yzdtkduccubq.png'),
(65, 34, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737797811/test-product-images/ua8so8qmpqbucmrhqarr.png'),
(66, 35, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737798098/test-product-images/ihi125v2iqlw9swiijcb.jpg'),
(67, 36, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737800039/test-product-images/pyhf1b2tkhsudbldtldw.png'),
(68, 37, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737800751/test-product-images/jowcnmhfrm7g4wmykmnf.png'),
(69, 37, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737800752/test-product-images/nboo5wgvpt9gwgqac3zw.png'),
(70, 38, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737801433/test-product-images/kzqlrytbhqqdxpx3lhmr.jpg'),
(71, 38, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737801434/test-product-images/oaapakl6xquekyd1e7qq.jpg'),
(72, 38, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737801436/test-product-images/aollhnfeja5lueuwbhiw.jpg'),
(73, 39, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737802869/test-product-images/tqmkkzffctk3imemjzbg.jpg'),
(74, 40, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737806294/test-product-images/poyhfwhiz3g2xqtth0on.jpg'),
(75, 41, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737806578/test-product-images/ggksp6gzef4gwscqcw5j.jpg'),
(76, 42, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737806747/test-product-images/hfde1ul8xlah8xyayqxy.jpg'),
(79, 43, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737807004/test-product-images/zpebhefgzxwrhssm32rc.jpg'),
(80, 43, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737807020/test-product-images/gqjhcnrf54bir3rgoxkm.jpg'),
(81, 45, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737808485/test-product-images/gtn7buezndfvtt7eiv3a.png'),
(82, 45, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737808486/test-product-images/guy77pjvcw9rnde79aaj.png'),
(83, 46, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737808775/test-product-images/fgibbtw5uohrtmbh3kgr.png'),
(84, 46, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737808776/test-product-images/jjftswzjftwugrifh2xm.png'),
(85, 46, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737808776/test-product-images/fkfxpqrqbnryd51kdbtd.png'),
(86, 47, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737809145/test-product-images/yy0fdj2i3ren7wy0ogol.jpg'),
(87, 48, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737809673/test-product-images/aqz5uxeqjkpckjeniqq1.png'),
(88, 49, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737810138/test-product-images/ti0nsd3gqz9funfn2r0l.png'),
(89, 50, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737810551/test-product-images/n155m4jin9rtmghbezvh.png'),
(90, 50, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737810552/test-product-images/ru42rz3txtihvownyyzj.png'),
(91, 51, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737811055/test-product-images/crvjoenfanqbk95zq0v3.png'),
(92, 52, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737813871/test-product-images/lle4dwcvtrqzp6yqcsnp.png'),
(93, 52, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737813871/test-product-images/e891lstjurp6zkpevz6s.png'),
(94, 53, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737814437/test-product-images/ysvqnrmxjshebacytc1i.png'),
(95, 53, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737814438/test-product-images/cilw79eriwqq00wsaxvc.png'),
(96, 54, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737814772/test-product-images/lsboxm2jxwl3gbnnmjqf.png'),
(97, 54, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737814773/test-product-images/q8mhwib2iu3p0uhejqrl.png'),
(98, 55, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737815209/test-product-images/gp3efhlufv2gwju4erow.jpg'),
(99, 56, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737815731/test-product-images/xkegzrjsdznjsvrxp6cw.jpg'),
(100, 56, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737815732/test-product-images/mzxgy2zm2p9kkjz5sesm.jpg'),
(101, 57, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737815943/test-product-images/fwbklsbmjzfcywcp6tf9.jpg'),
(102, 57, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737815944/test-product-images/ufqcasaukks4nv7gwede.jpg'),
(103, 58, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737816216/test-product-images/ixbliirgmnxyt0vozjic.jpg'),
(104, 58, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737816217/test-product-images/hzyubmknjcunt4tagbbf.jpg'),
(105, 11, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601340/product-images/ebrroozus0tcmwlsvvjk.jpg'),
(106, 11, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601341/product-images/ltsppcjqoiysddkpbhlk.jpg'),
(107, 11, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601342/product-images/wkvtlyifwnqmkau120nu.jpg'),
(108, 12, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601578/product-images/axkb3v4uj2mbiutmdx67.jpg'),
(109, 12, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601579/product-images/v8hbtvybc73vn6f9dfsf.jpg'),
(110, 12, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601580/product-images/tjohvw2ia1olppc5gfdr.jpg'),
(111, 13, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601890/product-images/xagyb5whel8sbc9nmdqe.jpg'),
(112, 13, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601891/product-images/qbt6hpwsw01yyriry3vh.jpg'),
(113, 13, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738601891/product-images/bitkdjapydarnnsybtf1.jpg'),
(114, 14, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738602096/product-images/qstv9ag0gqd65rczgbbx.jpg'),
(116, 15, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603061/product-images/avgrlvvitr0zu9xd99eo.jpg'),
(122, 20, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603721/product-images/mdz6ibliei8pmw2623zh.jpg'),
(123, 16, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603813/product-images/i9qbh1ffvtcn9kxuvktg.jpg'),
(124, 17, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603867/product-images/fm7ls4twrhpqz3kwqcqx.jpg'),
(125, 18, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603913/product-images/q7vry7pm8bj4s1axo1bk.jpg'),
(126, 19, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738603959/product-images/kmogbptvtuzncsw7afwx.jpg'),
(127, 21, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604085/product-images/fqqkftdqljsn900hyx5s.jpg'),
(128, 22, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604131/product-images/zr3eryzeydpmyxybec7m.jpg'),
(129, 23, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604275/product-images/ljrdvmbabljdfm3spqjo.jpg'),
(130, 24, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604314/product-images/hygx5iierfyspkwaybzm.jpg'),
(131, 25, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604348/product-images/dqxsntfetgy8pvigzshz.jpg'),
(132, 26, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604402/product-images/kregabjjglrxzcdi2vyb.jpg'),
(133, 27, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604492/product-images/crq5ayswf51nvffjm4ry.jpg'),
(134, 27, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604493/product-images/dotaewibjdjqr8j9njpa.jpg'),
(135, 28, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604566/product-images/xd0aqwltnxrpsfvxeczd.jpg'),
(136, 28, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1738604567/product-images/gkef6xuai2mno9tgqmu2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `p_colour`
--

CREATE TABLE `p_colour` (
  `id` int NOT NULL,
  `colour_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `colour_code` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `p_colour`
--

INSERT INTO `p_colour` (`id`, `colour_name`, `colour_code`) VALUES
(1, 'orchid', '#DA70D6'),
(2, 'navy', '#FF007F'),
(3, 'orchid', '#000080'),
(4, 'purple', '#A020F0'),
(5, 'white', '#fff'),
(6, 'black', '#000');

-- --------------------------------------------------------

--
-- Table structure for table `p_size`
--

CREATE TABLE `p_size` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `p_size`
--

INSERT INTO `p_size` (`id`, `product_id`, `size`, `quantity`, `created_at`) VALUES
(97, 11, '30R', 1, '2025-01-29 15:20:43'),
(98, 11, '32R', 1, '2025-01-24 11:03:34'),
(100, 11, '34R', 1, '2025-01-24 11:03:34'),
(101, 11, '36R', 1, '2025-01-24 11:03:34'),
(106, 11, '46R', 1, '2025-01-24 11:03:34'),
(107, 12, '2XL', 5, '2025-01-24 11:16:13'),
(108, 12, 'L', 0, '2025-01-24 11:16:13'),
(109, 12, 'M', 2, '2025-01-24 11:16:13'),
(110, 12, 'S', 1, '2025-01-24 11:16:13'),
(111, 12, 'XL', 8, '2025-01-24 11:16:13'),
(112, 13, '30R', 1, '2025-01-24 11:21:55'),
(122, 14, '32R', 1, '2025-01-24 12:01:48'),
(125, 14, '34R', 1, '2025-01-24 12:01:48'),
(126, 14, '34S', 2, '2025-01-24 12:01:48'),
(127, 14, '36L', 1, '2025-01-24 12:01:48'),
(134, 15, '30R', 1, '2025-01-24 12:11:52'),
(135, 15, '32R', 1, '2025-01-24 12:11:52'),
(137, 15, '34L', 1, '2025-01-24 12:11:52'),
(138, 15, '34R', 1, '2025-01-24 12:11:52'),
(139, 15, '34S', 2, '2025-01-24 12:11:52'),
(140, 15, '36L', 0, '2025-01-24 12:11:52'),
(141, 15, '36R', -1, '2025-01-24 12:11:52'),
(142, 15, '36S', 0, '2025-01-24 12:11:52'),
(148, 13, '32R', 1, '2025-01-24 13:30:22'),
(149, 13, '32L', 1, '2025-01-24 13:30:22'),
(151, 13, '34L', 2, '2025-01-24 13:30:22'),
(152, 13, '34R', 2, '2025-01-24 13:30:22'),
(153, 13, '34S', 1, '2025-01-24 13:30:22'),
(154, 13, '36L', 1, '2025-01-24 13:30:22'),
(155, 13, '36R', 2, '2025-01-24 13:30:22'),
(156, 13, '36S', 1, '2025-01-24 13:30:22'),
(165, 17, '2XL', 0, '2025-01-24 13:42:41'),
(166, 17, 'L', 2, '2025-01-24 13:42:41'),
(167, 17, 'M', 3, '2025-01-24 13:42:41'),
(168, 17, 'S', 1, '2025-01-24 13:42:41'),
(169, 17, 'XL', 2, '2025-01-24 13:42:41'),
(170, 18, 'S', 0, '2025-01-24 13:46:16'),
(171, 18, 'M', 1, '2025-01-24 13:46:16'),
(172, 18, 'L', 1, '2025-01-24 13:46:16'),
(173, 18, 'XL', 0, '2025-01-24 13:46:16'),
(174, 18, '2XL', 0, '2025-01-24 13:46:16'),
(175, 19, 'M', 0, '2025-01-24 13:52:39'),
(176, 19, 'L', 0, '2025-01-24 13:52:39'),
(177, 19, 'XL', 1, '2025-01-24 13:52:39'),
(178, 19, '2XL', 0, '2025-01-24 13:52:39'),
(179, 19, '3XL', 1, '2025-01-24 13:52:39'),
(180, 20, 'M', 0, '2025-01-24 14:26:53'),
(181, 20, 'L', 0, '2025-01-24 14:26:53'),
(182, 20, 'XL', 1, '2025-01-24 14:26:53'),
(183, 20, '2XL', 1, '2025-01-24 14:26:53'),
(184, 21, '38', 1, '2025-01-24 14:35:25'),
(185, 21, '40', 0, '2025-01-24 14:35:25'),
(186, 21, '42', 0, '2025-01-24 14:35:25'),
(187, 21, '44', 0, '2025-01-24 14:35:25'),
(188, 21, '46', 1, '2025-01-24 14:35:25'),
(189, 21, '48', 1, '2025-01-24 14:35:25'),
(190, 22, '38', 0, '2025-01-24 15:02:31'),
(191, 22, '40', 2, '2025-01-24 15:02:31'),
(192, 22, '42', 0, '2025-01-24 15:02:31'),
(193, 22, '44', 1, '2025-01-24 15:02:31'),
(194, 22, '46', 0, '2025-01-24 15:02:31'),
(195, 23, '38', 0, '2025-01-24 15:05:49'),
(196, 23, '40', 2, '2025-01-24 15:05:49'),
(197, 23, '42', 0, '2025-01-24 15:05:49'),
(198, 23, '44', 1, '2025-01-24 15:05:49'),
(199, 23, '46', 0, '2025-01-24 15:05:49'),
(200, 24, '38', 1, '2025-01-24 15:11:41'),
(201, 24, '40', 0, '2025-01-24 15:11:41'),
(202, 24, '42', 2, '2025-01-24 15:11:41'),
(203, 24, '44', 0, '2025-01-24 15:11:41'),
(204, 24, '46', 0, '2025-01-24 15:11:41'),
(206, 16, 'S', 0, '2025-01-24 15:26:49'),
(207, 16, 'M', 2, '2025-01-24 15:27:39'),
(208, 16, 'L', 0, '2025-01-24 15:27:39'),
(209, 16, 'XL', 0, '2025-01-24 15:27:39'),
(211, 16, '3XL', 0, '2025-01-24 15:27:39'),
(212, 25, '38', 0, '2025-01-24 15:32:11'),
(213, 25, '40', 2, '2025-01-24 15:32:11'),
(214, 25, '42', 0, '2025-01-24 15:32:11'),
(215, 25, '46', 0, '2025-01-24 15:32:11'),
(216, 25, '48', 0, '2025-01-24 15:32:11'),
(217, 26, 'M', 1, '2025-01-24 15:40:04'),
(218, 26, 'L', 2, '2025-01-24 15:40:04'),
(219, 26, 'XL', 2, '2025-01-24 15:40:04'),
(220, 26, '2XL', 1, '2025-01-24 15:40:04'),
(221, 27, '36R', 1, '2025-01-24 16:43:03'),
(224, 27, '40S', 1, '2025-01-24 16:43:03'),
(226, 27, '42S', 1, '2025-01-24 16:43:03'),
(228, 27, '44S', 0, '2025-01-24 16:43:03'),
(229, 27, '46R', 2, '2025-01-24 16:43:03'),
(230, 27, '46S', 0, '2025-01-24 16:43:03'),
(231, 27, '48R', 1, '2025-01-24 16:43:03'),
(232, 27, '48S', 1, '2025-01-24 16:43:03'),
(233, 27, '50R', 0, '2025-01-24 16:43:03'),
(234, 27, '50S', 0, '2025-01-24 16:43:03'),
(235, 27, '52R', 1, '2025-01-24 16:43:03'),
(236, 27, '52S', 0, '2025-01-24 16:43:03'),
(237, 27, '54', 2, '2025-01-24 16:43:03'),
(238, 27, '56R', 1, '2025-01-24 16:43:03'),
(239, 28, '36R', 2, '2025-01-24 16:51:22'),
(244, 28, '46R', 1, '2025-01-24 16:51:22'),
(245, 28, '48R', 0, '2025-01-24 16:51:22'),
(246, 28, '50R', 0, '2025-01-24 16:51:22'),
(247, 28, '52', 1, '2025-01-24 16:51:22'),
(248, 29, '38', 1, '2025-01-24 17:03:37'),
(249, 29, '39', 0, '2025-01-24 17:03:37'),
(250, 29, '40', 0, '2025-01-24 17:03:37'),
(251, 29, '41', -1, '2025-01-24 17:03:37'),
(252, 29, '42', 2, '2025-01-24 17:03:37'),
(253, 29, '43', 1, '2025-01-24 17:03:37'),
(254, 29, '44', 0, '2025-01-24 17:03:37'),
(255, 29, '45', 1, '2025-01-24 17:03:37'),
(256, 29, '46', 0, '2025-01-24 17:03:37'),
(257, 29, '47', 0, '2025-01-24 17:03:37'),
(258, 28, '38R', 0, '2025-01-24 17:04:05'),
(259, 30, 'M', 0, '2025-01-24 17:20:35'),
(260, 30, 'L', 2, '2025-01-24 17:20:35'),
(261, 30, 'XL', 1, '2025-01-24 17:20:35'),
(262, 30, '2XL', 0, '2025-01-24 17:20:35'),
(265, 31, 'XL', 2, '2025-01-24 17:34:17'),
(266, 31, '2XL', 1, '2025-01-24 17:34:17'),
(269, 32, 'XL', 0, '2025-01-24 17:38:34'),
(270, 32, '2XL', 0, '2025-01-24 17:38:34'),
(271, 33, 'M', 1, '2025-01-25 09:30:36'),
(272, 33, 'L', 0, '2025-01-25 09:30:36'),
(273, 33, 'XL', 1, '2025-01-25 09:30:36'),
(274, 33, '2XL', 2, '2025-01-25 09:30:36'),
(275, 34, 'M', 1, '2025-01-25 09:36:52'),
(276, 34, 'L', 1, '2025-01-25 09:36:52'),
(277, 34, 'XL', 1, '2025-01-25 09:36:52'),
(278, 34, '2XL', 0, '2025-01-25 09:36:52'),
(279, 35, 'M', 0, '2025-01-25 09:41:38'),
(280, 35, 'L', 0, '2025-01-25 09:41:38'),
(281, 35, 'XL', 1, '2025-01-25 09:41:38'),
(282, 35, '2XL', 1, '2025-01-25 09:41:38'),
(283, 27, '38R', 1, '2025-01-25 09:47:53'),
(286, 14, '38S', 1, '2025-01-25 10:02:28'),
(287, 36, '30R', 1, '2025-01-25 10:14:00'),
(288, 36, '32R', 2, '2025-01-25 10:14:00'),
(289, 36, '34R', 0, '2025-01-25 10:14:00'),
(290, 36, '36R', 2, '2025-01-25 10:14:00'),
(291, 36, ' 38R ', 3, '2025-01-25 10:14:00'),
(292, 36, '40R ', 1, '2025-01-25 10:14:00'),
(293, 36, '42R ', 3, '2025-01-25 10:14:00'),
(294, 36, '44R ', 2, '2025-01-25 10:14:00'),
(295, 36, '46R', 2, '2025-01-25 10:14:00'),
(296, 37, '30R', 1, '2025-01-25 10:25:52'),
(297, 37, '32R', 3, '2025-01-25 10:25:52'),
(298, 37, '34R', 2, '2025-01-25 10:25:52'),
(299, 37, '36R', 3, '2025-01-25 10:25:52'),
(300, 37, ' 38R ', 2, '2025-01-25 10:25:52'),
(301, 37, '40R ', 1, '2025-01-25 10:25:52'),
(302, 37, '42R ', 1, '2025-01-25 10:25:52'),
(303, 37, '44R ', 1, '2025-01-25 10:25:52'),
(304, 38, '32R', 0, '2025-01-25 10:37:17'),
(305, 38, '32S ', 1, '2025-01-25 10:37:17'),
(306, 38, '34L', 0, '2025-01-25 10:37:17'),
(307, 38, '34R', 0, '2025-01-25 10:37:17'),
(308, 38, '34S', 0, '2025-01-25 10:37:17'),
(309, 38, '36L', 1, '2025-01-25 10:37:17'),
(310, 38, '36R', 1, '2025-01-25 10:37:17'),
(311, 38, '36S', 0, '2025-01-25 10:37:17'),
(312, 38, ' 38L', 1, '2025-01-25 10:37:17'),
(313, 38, ' 38R ', 1, '2025-01-25 10:37:17'),
(314, 38, ' 38S', 1, '2025-01-25 10:37:17'),
(315, 38, '40R ', 0, '2025-01-25 10:37:17'),
(316, 38, '40S', 0, '2025-01-25 10:37:17'),
(317, 39, 'XS', 0, '2025-01-25 11:01:09'),
(318, 39, 'S', 5, '2025-01-25 11:01:09'),
(319, 39, 'M', 5, '2025-01-25 11:01:09'),
(320, 39, 'L', 5, '2025-01-25 11:01:09'),
(321, 39, 'XL', 5, '2025-01-25 11:01:09'),
(322, 39, '2XL', 0, '2025-01-25 11:01:09'),
(323, 39, '3XL', 0, '2025-01-25 11:01:09'),
(324, 39, '4XL', 0, '2025-01-25 11:01:09'),
(325, 31, 'XS', 0, '2025-01-25 11:03:18'),
(326, 31, 'S', 0, '2025-01-25 11:03:18'),
(327, 31, 'M', 2, '2025-01-25 11:03:18'),
(328, 31, 'L', 2, '2025-01-25 11:03:18'),
(329, 31, '3XL', 0, '2025-01-25 11:03:18'),
(330, 32, 'XS', 0, '2025-01-25 11:13:09'),
(331, 32, 'S', 0, '2025-01-25 11:13:09'),
(332, 32, 'M', 1, '2025-01-25 11:13:09'),
(333, 32, 'L', 2, '2025-01-25 11:13:09'),
(334, 32, '3XL', 0, '2025-01-25 11:13:09'),
(335, 16, 'XS', 0, '2025-01-25 11:14:32'),
(336, 17, 'XS', 0, '2025-01-25 11:15:58'),
(337, 17, '3XL', 0, '2025-01-25 11:15:58'),
(338, 12, 'XS', 0, '2025-01-25 11:17:06'),
(339, 12, '3XL', 0, '2025-01-25 11:17:06'),
(340, 16, '2XL', 0, '2025-01-25 11:46:26'),
(341, 40, 'XS', 0, '2025-01-25 11:58:14'),
(342, 40, 'S', 2, '2025-01-25 11:58:14'),
(343, 40, 'M', 2, '2025-01-25 11:58:14'),
(344, 40, 'L', 2, '2025-01-25 11:58:14'),
(345, 40, 'XL', 2, '2025-01-25 11:58:14'),
(346, 40, '2XL', 0, '2025-01-25 11:58:14'),
(347, 40, '3XL', 0, '2025-01-25 11:58:14'),
(348, 40, '4XL', 0, '2025-01-25 11:58:14'),
(349, 41, 'XS', 0, '2025-01-25 12:02:58'),
(350, 41, 'S', 5, '2025-01-25 12:02:58'),
(351, 41, 'M', 5, '2025-01-25 12:02:58'),
(352, 41, 'L', 5, '2025-01-25 12:02:58'),
(353, 41, 'XL', 5, '2025-01-25 12:02:58'),
(354, 41, '2XL', 0, '2025-01-25 12:02:58'),
(355, 41, '3XL', 0, '2025-01-25 12:02:58'),
(356, 41, '4XL', 0, '2025-01-25 12:02:58'),
(357, 42, 'XS', 0, '2025-01-25 12:05:48'),
(358, 42, 'S', 5, '2025-01-25 12:05:48'),
(359, 42, 'M', 5, '2025-01-25 12:05:48'),
(360, 42, 'L', 5, '2025-01-25 12:05:48'),
(361, 42, 'XL', 5, '2025-01-25 12:05:48'),
(362, 42, '2XL', 0, '2025-01-25 12:05:48'),
(363, 42, '3XL', 0, '2025-01-25 12:05:48'),
(364, 42, '4XL', 0, '2025-01-25 12:05:48'),
(373, 43, 'XS', 0, '2025-01-25 12:10:20'),
(374, 43, 'S', 5, '2025-01-25 12:10:20'),
(375, 43, 'M', 5, '2025-01-25 12:10:20'),
(376, 43, 'L', 5, '2025-01-25 12:10:20'),
(377, 43, 'XL', 5, '2025-01-25 12:10:20'),
(378, 43, '2XL', 0, '2025-01-25 12:10:20'),
(379, 43, '3XL', 0, '2025-01-25 12:10:20'),
(380, 43, '4XL', 0, '2025-01-25 12:10:20'),
(381, 45, '34', 5, '2025-01-25 12:34:46'),
(382, 45, '36', 5, '2025-01-25 12:34:46'),
(383, 45, '38', 5, '2025-01-25 12:34:46'),
(384, 45, '40', 5, '2025-01-25 12:34:46'),
(385, 45, '42', 5, '2025-01-25 12:34:46'),
(386, 45, '44', 5, '2025-01-25 12:34:46'),
(387, 45, '46', 5, '2025-01-25 12:34:46'),
(388, 45, '48', 5, '2025-01-25 12:34:46'),
(389, 45, '50', 5, '2025-01-25 12:34:46'),
(390, 45, '52', 5, '2025-01-25 12:34:46'),
(391, 45, '54', 0, '2025-01-25 12:34:46'),
(392, 45, '56', 0, '2025-01-25 12:34:46'),
(393, 46, '34', 5, '2025-01-25 12:39:37'),
(394, 46, '36', 5, '2025-01-25 12:39:37'),
(395, 46, '38', 5, '2025-01-25 12:39:37'),
(396, 46, '40', 5, '2025-01-25 12:39:37'),
(397, 46, '42', 5, '2025-01-25 12:39:37'),
(398, 46, '44', 5, '2025-01-25 12:39:37'),
(399, 46, '46', 0, '2025-01-25 12:39:37'),
(400, 46, '48', 0, '2025-01-25 12:39:37'),
(401, 46, '50', 5, '2025-01-25 12:39:37'),
(402, 46, '52', 5, '2025-01-25 12:39:37'),
(403, 46, '54', 0, '2025-01-25 12:39:37'),
(404, 46, '56', 0, '2025-01-25 12:39:37'),
(405, 47, '34', 0, '2025-01-25 12:45:46'),
(406, 47, '36', 0, '2025-01-25 12:45:46'),
(407, 47, '38', 0, '2025-01-25 12:45:46'),
(408, 47, '40', 0, '2025-01-25 12:45:46'),
(409, 47, '42', 5, '2025-01-25 12:45:46'),
(410, 47, '44', 0, '2025-01-25 12:45:46'),
(411, 47, '46', 0, '2025-01-25 12:45:46'),
(412, 47, '48', 5, '2025-01-25 12:45:46'),
(413, 47, '50', 0, '2025-01-25 12:45:46'),
(414, 47, '52', 0, '2025-01-25 12:45:46'),
(415, 47, '54', 0, '2025-01-25 12:45:46'),
(416, 47, '56', 0, '2025-01-25 12:45:46'),
(417, 48, 'XS', 0, '2025-01-25 12:54:34'),
(418, 48, 'S', 0, '2025-01-25 12:54:34'),
(419, 48, 'M', 5, '2025-01-25 12:54:34'),
(420, 48, 'L', 5, '2025-01-25 12:54:34'),
(421, 48, 'XL', 5, '2025-01-25 12:54:34'),
(422, 48, '2XL', 5, '2025-01-25 12:54:34'),
(423, 48, '3XL', 0, '2025-01-25 12:54:34'),
(424, 48, '4XL', 0, '2025-01-25 12:54:34'),
(425, 49, 'XS', 0, '2025-01-25 13:02:19'),
(426, 49, 'S', 0, '2025-01-25 13:02:19'),
(427, 49, 'M', 5, '2025-01-25 13:02:19'),
(428, 49, 'L', 5, '2025-01-25 13:02:19'),
(429, 49, 'XL', 0, '2025-01-25 13:02:19'),
(430, 49, '2XL', 5, '2025-01-25 13:02:19'),
(431, 49, '3XL', 0, '2025-01-25 13:02:19'),
(432, 49, '4XL', 0, '2025-01-25 13:02:19'),
(433, 50, 'XS', 0, '2025-01-25 13:09:13'),
(434, 50, 'S', 0, '2025-01-25 13:09:13'),
(435, 50, 'M', 5, '2025-01-25 13:09:13'),
(436, 50, 'L', 5, '2025-01-25 13:09:13'),
(437, 50, 'XL', 5, '2025-01-25 13:09:13'),
(438, 50, '2XL', 5, '2025-01-25 13:09:13'),
(439, 50, '3XL', 0, '2025-01-25 13:09:13'),
(440, 50, '4XL', 0, '2025-01-25 13:09:13'),
(441, 51, 'XS', 0, '2025-01-25 13:17:36'),
(442, 51, 'S', 0, '2025-01-25 13:17:36'),
(443, 51, 'M', 0, '2025-01-25 13:17:36'),
(444, 51, 'L', 0, '2025-01-25 13:17:36'),
(445, 51, 'XL', 5, '2025-01-25 13:17:36'),
(446, 51, '2XL', 5, '2025-01-25 13:17:36'),
(447, 51, '3XL', 0, '2025-01-25 13:17:36'),
(448, 51, '4XL', 0, '2025-01-25 13:17:36'),
(449, 52, '6', 5, '2025-01-25 14:04:32'),
(450, 52, '7', 5, '2025-01-25 14:04:32'),
(451, 52, '8', 5, '2025-01-25 14:04:32'),
(452, 52, '9', 5, '2025-01-25 14:04:32'),
(453, 52, '10', 5, '2025-01-25 14:04:32'),
(454, 52, '11', 5, '2025-01-25 14:04:32'),
(455, 52, '12', 5, '2025-01-25 14:04:32'),
(456, 52, '13', 0, '2025-01-25 14:04:32'),
(457, 53, '6', 5, '2025-01-25 14:13:58'),
(458, 53, '7', 5, '2025-01-25 14:13:58'),
(459, 53, '8', 5, '2025-01-25 14:13:58'),
(460, 53, '9', 5, '2025-01-25 14:13:58'),
(461, 53, '10', 5, '2025-01-25 14:13:58'),
(462, 53, '11', 5, '2025-01-25 14:13:58'),
(463, 53, '12', 5, '2025-01-25 14:13:58'),
(464, 53, '13', 0, '2025-01-25 14:13:58'),
(465, 54, '6', 5, '2025-01-25 14:19:33'),
(466, 54, '7', 5, '2025-01-25 14:19:33'),
(467, 54, '8', 5, '2025-01-25 14:19:33'),
(468, 54, '9', 5, '2025-01-25 14:19:33'),
(469, 54, '10', 5, '2025-01-25 14:19:33'),
(470, 54, '11', 5, '2025-01-25 14:19:33'),
(471, 54, '12', 5, '2025-01-25 14:19:33'),
(472, 54, '13', 0, '2025-01-25 14:19:33'),
(473, 52, '6 UK', 5, '2025-01-25 14:20:18'),
(474, 52, '7 UK', 5, '2025-01-25 14:20:18'),
(475, 52, '8 UK', 5, '2025-01-25 14:20:18'),
(476, 52, '9 UK', 5, '2025-01-25 14:20:18'),
(477, 52, '10 UK', 5, '2025-01-25 14:20:18'),
(478, 52, '11 UK', 5, '2025-01-25 14:20:18'),
(479, 52, '12 UK', 5, '2025-01-25 14:20:18'),
(480, 52, '13 UK', 0, '2025-01-25 14:20:18'),
(481, 55, '6', 0, '2025-01-25 14:26:49'),
(482, 55, '7', 5, '2025-01-25 14:26:49'),
(483, 55, '8', 5, '2025-01-25 14:26:49'),
(484, 55, '9', 5, '2025-01-25 14:26:49'),
(485, 55, '10', 5, '2025-01-25 14:26:49'),
(486, 55, '11', 5, '2025-01-25 14:26:49'),
(487, 55, '12', 5, '2025-01-25 14:26:49'),
(488, 55, '13', 0, '2025-01-25 14:26:49'),
(489, 56, '6', 0, '2025-01-25 14:35:32'),
(490, 56, '7', 5, '2025-01-25 14:35:32'),
(491, 56, '8', 5, '2025-01-25 14:35:32'),
(492, 56, '9', 5, '2025-01-25 14:35:32'),
(493, 56, '10', 5, '2025-01-25 14:35:32'),
(494, 56, '11', 5, '2025-01-25 14:35:32'),
(495, 56, '12', 5, '2025-01-25 14:35:32'),
(496, 56, '13', 0, '2025-01-25 14:35:32'),
(497, 57, '6', 0, '2025-01-25 14:39:04'),
(498, 57, '7', 5, '2025-01-25 14:39:04'),
(499, 57, '8', 5, '2025-01-25 14:39:04'),
(500, 57, '9', 5, '2025-01-25 14:39:04'),
(501, 57, '10', 5, '2025-01-25 14:39:04'),
(502, 57, '11', 0, '2025-01-25 14:39:04'),
(503, 57, '12', 5, '2025-01-25 14:39:04'),
(504, 57, '13', 0, '2025-01-25 14:39:04'),
(505, 58, '6', 0, '2025-01-25 14:43:38'),
(506, 58, '7', 5, '2025-01-25 14:43:38'),
(507, 58, '8', 5, '2025-01-25 14:43:38'),
(508, 58, '9', 5, '2025-01-25 14:43:38'),
(509, 58, '10', 0, '2025-01-25 14:43:38'),
(510, 58, '11', 5, '2025-01-25 14:43:38'),
(511, 58, '12', 0, '2025-01-25 14:43:38'),
(512, 58, '13', 0, '2025-01-25 14:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `return_order`
--

CREATE TABLE `return_order` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `order_item_id` int NOT NULL,
  `return_order_id` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `reason` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `by_cs` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `r_status` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `return_order`
--

INSERT INTO `return_order` (`id`, `order_id`, `order_item_id`, `return_order_id`, `reason`, `by_cs`, `comment`, `r_status`, `created_at`) VALUES
(24, 99, 142, 'ALFARETURN0001', 'Not as expected', 'Return by Courier', 'dsafd', 'PENDING', '2025-01-27 14:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int NOT NULL,
  `size_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `size_name`, `status`, `created_at`) VALUES
(38, 'S', '0', '2025-01-20 14:18:11'),
(39, 'M', '0', '2025-01-20 14:21:01'),
(40, 'L', '0', '2025-01-20 14:21:06'),
(41, 'XL', '0', '2025-01-20 14:21:11'),
(42, '2XL', '0', '2025-01-20 14:21:19'),
(43, '3XL', '0', '2025-01-20 14:21:27'),
(44, '4XL', '0', '2025-01-20 14:21:41'),
(45, '28', '0', '2025-01-20 14:21:55'),
(46, '30', '0', '2025-01-20 14:22:00'),
(47, '32', '0', '2025-01-20 14:22:07'),
(48, '34', '0', '2025-01-20 14:22:11'),
(49, '36', '0', '2025-01-20 14:22:17'),
(50, '38', '0', '2025-01-20 14:22:20'),
(51, '40', '0', '2025-01-20 14:25:21'),
(52, '44', '0', '2025-01-20 14:25:25'),
(53, '46', '0', '2025-01-20 14:25:30'),
(54, '48', '0', '2025-01-20 14:25:36'),
(55, '50', '0', '2025-01-20 14:25:41'),
(56, '52', '0', '2025-01-20 14:25:55'),
(57, '32R', '0', '2025-01-20 14:30:47'),
(58, '32L', '0', '2025-01-20 14:31:10'),
(59, '34R', '0', '2025-01-20 14:31:15'),
(60, '34L', '0', '2025-01-21 10:17:04'),
(62, 'L-S', '0', '2025-01-22 15:11:17'),
(63, '52', 'active', '2025-01-23 17:33:04'),
(64, '30R', 'active', '2025-01-24 10:08:22'),
(65, '32S ', 'active', '2025-01-24 10:23:51'),
(66, '36R', 'active', '2025-01-24 10:24:27'),
(67, ' 38R ', 'active', '2025-01-24 10:24:54'),
(68, '40R ', 'active', '2025-01-24 10:25:05'),
(69, '42R ', 'active', '2025-01-24 10:25:12'),
(70, '44R ', 'active', '2025-01-24 10:25:20'),
(71, '46R', 'active', '2025-01-24 10:25:24'),
(72, '34S', 'active', '2025-01-24 11:24:27'),
(73, '36S', 'active', '2025-01-24 11:24:53'),
(74, '36L', 'active', '2025-01-24 11:25:04'),
(76, ' 38L', 'active', '2025-01-24 11:26:47'),
(77, ' 38S', 'active', '2025-01-24 11:26:54'),
(78, '42', 'active', '2025-01-24 14:31:30'),
(79, '40S', 'active', '2025-01-24 15:50:08'),
(80, '42S', 'active', '2025-01-24 15:50:23'),
(81, '44S', 'active', '2025-01-24 15:50:55'),
(82, '46S', 'active', '2025-01-24 15:51:02'),
(83, '48R', 'active', '2025-01-24 15:51:15'),
(84, '48S', 'active', '2025-01-24 15:51:21'),
(85, '50R', 'active', '2025-01-24 15:51:33'),
(86, '50S', 'active', '2025-01-24 15:51:38'),
(87, '52R', 'active', '2025-01-24 15:51:49'),
(88, '52S', 'active', '2025-01-24 15:51:58'),
(89, '54', 'active', '2025-01-24 15:52:17'),
(90, '56R', 'active', '2025-01-24 15:52:29'),
(91, '39', 'active', '2025-01-24 16:59:19'),
(92, '41', 'active', '2025-01-24 16:59:25'),
(93, '43', 'active', '2025-01-24 16:59:32'),
(94, '45', 'active', '2025-01-24 16:59:37'),
(95, '47', 'active', '2025-01-24 16:59:41'),
(96, 'XS', 'active', '2025-01-25 10:55:38'),
(97, '54', 'active', '2025-01-25 12:31:51'),
(98, '56', 'active', '2025-01-25 12:31:57'),
(99, '6', 'active', '2025-01-25 14:00:44'),
(100, '7', 'active', '2025-01-25 14:00:50'),
(101, '8', 'active', '2025-01-25 14:00:54'),
(102, '9', 'active', '2025-01-25 14:00:58'),
(103, '10', 'active', '2025-01-25 14:01:06'),
(104, '11', 'active', '2025-01-25 14:01:11'),
(105, '12', 'active', '2025-01-25 14:01:16'),
(106, '13', 'active', '2025-01-25 14:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `sizes_fits`
--

CREATE TABLE `sizes_fits` (
  `id` int NOT NULL,
  `size_id` int NOT NULL,
  `fit_name` varchar(70) COLLATE utf8mb4_general_ci NOT NULL,
  `f_quantity` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alfa_cart`
--
ALTER TABLE `alfa_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alfa_users`
--
ALTER TABLE `alfa_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alfa_whislist`
--
ALTER TABLE `alfa_whislist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `get_in_touch`
--
ALTER TABLE `get_in_touch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_type`
--
ALTER TABLE `inventory_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_order`
--
ALTER TABLE `new_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_order_itemsss`
--
ALTER TABLE `new_order_itemsss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_images`
--
ALTER TABLE `pro_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_colour`
--
ALTER TABLE `p_colour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_size`
--
ALTER TABLE `p_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_order`
--
ALTER TABLE `return_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes_fits`
--
ALTER TABLE `sizes_fits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alfa_cart`
--
ALTER TABLE `alfa_cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `alfa_users`
--
ALTER TABLE `alfa_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `alfa_whislist`
--
ALTER TABLE `alfa_whislist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `get_in_touch`
--
ALTER TABLE `get_in_touch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory_type`
--
ALTER TABLE `inventory_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `new_order`
--
ALTER TABLE `new_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `new_order_itemsss`
--
ALTER TABLE `new_order_itemsss`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pro_images`
--
ALTER TABLE `pro_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `p_colour`
--
ALTER TABLE `p_colour`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `p_size`
--
ALTER TABLE `p_size`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT for table `return_order`
--
ALTER TABLE `return_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `sizes_fits`
--
ALTER TABLE `sizes_fits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
