-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2025 at 06:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_alfa`
--

-- --------------------------------------------------------

--
-- Table structure for table `alfa_cart`
--

CREATE TABLE `alfa_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_size` varchar(20) NOT NULL,
  `product_price` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alfa_users`
--

CREATE TABLE `alfa_users` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` varchar(11) NOT NULL,
  `otp` int(11) NOT NULL,
  `otp_expiry` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alfa_users`
--

INSERT INTO `alfa_users` (`id`, `name`, `email`, `password`, `type`, `status`, `otp`, `otp_expiry`, `created_at`) VALUES
(2, 'Arif Khan', 'fastranking03@gmail.com', '$2b$10$dfrd.PnNwlkSvox5qH8Q9.WJDH1vaIGVrPLHtaejQeupzUpOGqNM.', '', '0', 0, '', '2025-01-22 15:05:43'),
(3, 'Alfa Mens', 'alfamens@gmail.com', '$2b$10$dfrd.PnNwlkSvox5qH8Q9.WJDH1vaIGVrPLHtaejQeupzUpOGqNM.', 'admin', '', 0, '', '2025-01-23 09:27:27'),
(4, 'Vani Mendiratta', 'vani.mendiratta@fastranking.tech', '$2b$10$QUs..ICGquq8NNvUnIwGk.i1gJVkGYbMXzDWHdg1wCzPdeuYY5XpW', '', '0', 0, '', '2025-01-23 12:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `alfa_whislist`
--

CREATE TABLE `alfa_whislist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_size` varchar(20) NOT NULL,
  `product_price` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `slug_name` varchar(100) NOT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `image_path` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `instagram_link` varchar(150) DEFAULT NULL,
  `facebook_link` varchar(150) DEFAULT NULL,
  `linkedin_link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `wear_type_id` int(11) NOT NULL,
  `cat_name` varchar(80) NOT NULL,
  `cat_slug` varchar(100) NOT NULL,
  `is_accessories` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
(10, 3, 'Shoes', 'shoes', 0, 'active', '2025-01-24 10:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(120) NOT NULL,
  `address_2` varchar(150) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address_type` varchar(30) NOT NULL,
  `postcode` varchar(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `user_id`, `full_name`, `mobile`, `email`, `address`, `address_2`, `city`, `address_type`, `postcode`, `status`, `created_at`) VALUES
(2, 2, 'John', 2147483647, 'divjonny58@gmail.com', 'New Delhi', 'London', 'Delhi', 'Personal', '110085', 0, '2025-01-21 20:02:08'),
(3, 2, 'John', 2147483647, 'fastranking03@gmail.com', 'Lotus', 'sdfrsd', 'uk', 'Personal', 'SW12 8NX', 0, '2025-01-22 09:50:04'),
(4, 4, 'Vani Mendiratta', 1005859595, 'vani.mendiratta@fastranking.tech', 'Blackburn with Darwen ', 'sdfrsd', 'UK', 'Personal', 'SW12 8NX', 0, '2025-01-23 13:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_type`
--

CREATE TABLE `inventory_type` (
  `id` int(11) NOT NULL,
  `i_type` varchar(60) NOT NULL,
  `type_url` varchar(60) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_type`
--

INSERT INTO `inventory_type` (`id`, `i_type`, `type_url`, `status`, `created_at`) VALUES
(1, 'Top', 'top-wear', 'active', '2025-01-24 14:18:14'),
(2, 'Bottom', 'bottom-wear', 'active', '2025-01-24 14:18:19'),
(3, 'Footwear', 'footwear', 'active', '2025-01-24 10:05:48'),
(4, 'Accessories', 'accessories', 'active', '2025-01-24 10:05:59');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `status`, `created_at`) VALUES
(40, 'fastranking03@gmail.com', '', '2025-01-22 14:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `new_order`
--

CREATE TABLE `new_order` (
  `id` int(11) NOT NULL,
  `paypal_id` varchar(50) NOT NULL,
  `order_id` varchar(80) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `total_price` varchar(50) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_type` varchar(80) NOT NULL,
  `status` varchar(50) NOT NULL,
  `payment_status` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `new_order`
--

INSERT INTO `new_order` (`id`, `paypal_id`, `order_id`, `user_id`, `address_id`, `total_price`, `payment_method`, `payment_type`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(94, '37Y20895E9021541P', 'ALFA0001', 2, 2, '89.95', 'Paypal', '', 'DELIVERED', 'PENDING', '2025-01-23 14:03:19', '2025-01-22 10:25:00'),
(95, '4T43555558283364K', 'ALFA0002', 2, 2, '89.95', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-22 12:10:41', '2025-01-22 12:10:41'),
(96, '2Y157921XA7393305', 'ALFA0003', 2, 2, '449.75', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-22 18:08:17', '2025-01-22 18:08:17'),
(97, '5FB59812E3428432A', 'ALFA0004', 2, 2, '179.90', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-23 12:57:42', '2025-01-23 12:57:42'),
(98, '3U205949KY7875822', 'ALFA0005', 2, 2, '179.90', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-23 12:59:14', '2025-01-23 12:59:14'),
(99, '90G35844W6585341X', 'ALFA0006', 2, 3, '89.95', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-23 13:14:23', '2025-01-23 13:14:23'),
(100, '92B064875M3366003', 'ALFA0007', 4, 4, '89.95', 'Paypal', '', 'ORDER PLACED', 'PENDING', '2025-01-23 13:19:31', '2025-01-23 13:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `new_order_itemsss`
--

CREATE TABLE `new_order_itemsss` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_order_itemsss`
--

INSERT INTO `new_order_itemsss` (`id`, `orders_id`, `product_id`, `quantity`, `created_at`) VALUES
(136, 94, 4, 1, '2025-01-22 10:25:00'),
(137, 95, 4, 1, '2025-01-22 12:10:41'),
(138, 96, 4, 4, '2025-01-22 18:08:17'),
(139, 96, 9, 1, '2025-01-22 18:08:17'),
(140, 97, 6, 2, '2025-01-23 12:57:42'),
(141, 98, 6, 2, '2025-01-23 12:59:14'),
(142, 99, 7, 1, '2025-01-23 13:14:23'),
(143, 100, 5, 1, '2025-01-23 13:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `wear_type_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_price` varchar(11) NOT NULL,
  `discount` varchar(11) NOT NULL,
  `p_main_price` varchar(11) NOT NULL,
  `p_url` varchar(150) NOT NULL,
  `p_title` varchar(120) NOT NULL,
  `similar_product` varchar(100) NOT NULL,
  `p_image` varchar(150) NOT NULL,
  `p_desc` text NOT NULL,
  `p_key_features` text NOT NULL,
  `tags` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `barcode` varchar(40) NOT NULL,
  `colour` varchar(30) NOT NULL,
  `new_arrival` varchar(20) NOT NULL,
  `best_seller` varchar(20) NOT NULL,
  `position` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `wear_type_id`, `cat_id`, `p_name`, `p_price`, `discount`, `p_main_price`, `p_url`, `p_title`, `similar_product`, `p_image`, `p_desc`, `p_key_features`, `tags`, `brand`, `sku`, `barcode`, `colour`, `new_arrival`, `best_seller`, `position`, `status`, `created_at`) VALUES
(4, 1, 1, 'Giordano Big Paisley Print Long Sleeve Shirt', '89.95', '0', '89.95', 'giordano-big-paisley-print-long-sleeve-shirt', 'Giordano Big Paisley Print Long Sleeve Shirt', '', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737465331/product-images/pam5aq6ithvqajdz0jjf.jpg', '                                                 Maggiore, Long Sleeve, Semi Cutaway Collar.\r\n                                            \r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            \r\n                                            ', 'test', 'Eterna', '427489', '427489NfjAxqFY', 'red', 'yes', 'yes', 0, 0, '2025-01-24 16:15:31'),
(5, 3, 10, 'Rose Structured Shirt Modern Fit', '89.95', '0', '89.95', 'rose-structured-shirt-modern-fit', 'Rose Structured Shirt Modern Fit', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737727048/product-images/lvepovjkasrkqjnebelb.jpg', '                                                                                                                                                From our premium collection \"1863 by ETERNA\"!\r\nWith this structured COMFORT FIT shirt you will be a tasteful eye-catcher. Special qualities, cotton fabrics with the best finish, high-quality workmanship - all these advantages come together in our premium line.\r\nThis twill shirt is made from pure, non-iron cotton and is therefore a guarantee for the best wearing comfort and feel-good character.\r\nIt comes with a classic Kent collar, no breast pocket and a comfortable cut. The sewn-in decorative band in the front is a special detail. The hem is rounded to a normal length so that this shirt can also be worn casually over trousers.\r\n\r\n                                            \r\n                                            \r\n                                            ', '                                                                                                                                                \r\n                                            \r\n                                            \r\n                                            ', 'Structured, Comfort-Fit, Premium, Cotton, Non-Iron, Casual', 'Eterna', '1187', '1187thvcl0Dh', 'orchid', 'yes', 'yes', 0, 0, '2025-01-24 13:56:32'),
(6, 1, 1, 'Orchid structured Shirt Modern Fit', '89.95', '0', '89.95', 'orchid-structured-shirt-modern-fit', 'Orchid structured Shirt Modern Fit', '', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737390540/product-images/agddd9ht9lubvhcqbtv8.jpg', 'From our premium collection \"1863 by ETERNA\"!\r\nWith this structured COMFORT FIT shirt you will be a tasteful eye-catcher. Special qualities, cotton fabrics with the best finish, high-quality workmanship - all these advantages come together in our premium line.\r\nThis twill shirt is made from pure, non-iron cotton and is therefore a guarantee for the best wearing comfort and feel-good character.\r\nIt comes with a classic Kent collar, no breast pocket and a comfortable cut. The sewn-in decorative band in the front is a special detail. The hem is rounded to a normal length so that this shirt can also be worn casually over trousers.', '', 'Structured, Comfort-Fit, Premium, Cotton, Non-Iron, Casual', 'Eterna', '1187', '11875vGidgQY', 'rose', 'yes', 'yes', 0, 0, '2025-01-24 14:25:20'),
(7, 1, 1, 'Navy printed Shirt Modern Fit', '89.95', '0', '89.95', 'navy-printed-shirt-modern-fit', 'Navy printed Shirt Modern Fit', '', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737455685/product-images/amjllsjzyfhyi5yhwpci.jpg', 'This printed long-sleeve shirt is an absolute eye-catcher! The fashionable shark collar and eye-catching floral print make this shirt (without a breast pocket) a must-have. The slightly tailored cut appeals to those who want a slightly more modern interpretation of the classic look. The hem is rounded at a normal length so that this shirt can also be worn casually outside the trousers. It is made from 100% finest cotton (twill, non-iron) and offers first-class comfort.', '', 'Printed, Modern-Fit, Floral, Cotton, Non-Iron, Stylish', 'Eterna', '2239', '2239gzCVK8Hl', '', 'yes', 'yes', 0, 0, '2025-01-24 14:25:22'),
(8, 1, 1, 'Purple Plain Shirt Modern Fit', '89.95', '0', '89.95', 'purple-plain-shirt-modern-fit', 'Purple Plain Shirt Modern Fit', '', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737465277/product-images/e1usrmjtudoc4eyhexxp.jpg', 'Opaque, non-slip and non-iron. This shirt only shows what it is supposed to show. It reliably conceals tattoos and body hair.\r\nWith the opaque ETERNA COVER SHIRT, in a slightly tailored cut, you\'ll be way ahead in terms of fashion.\r\nAs a half-ply shirt made of 100% cotton (twill, non-iron), the opaque COVER SHIRT offers excellent comfort.\r\nThe patches on the shark collar and cuffs give it a modern touch. The hem is rounded at a normal length so that this shirt (without a breast pocket) can also be worn casually outside the trousers.\r\nAlways the right fit, always stylish', '', 'Plain, Opaque, Comfort-Fit, Non-Iron, Cotton, Casual', 'Eterna', '8224', '8224dKf54pKC', '', 'yes', 'yes', 0, 0, '2025-01-24 14:25:24'),
(9, 1, 1, 'Rose Structured Shirt Modern Fit', '89.95', '0', '89.95', 'rose-structured-shirt-modern-fit', 'Rose Structured Shirt Modern Fit', '', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737569298/product-images/qxk3w6hg8atwhqetfde7.jpg', 'sdaffsdfg', '', 'Structured, Comfort-Fit, Premium, Cotton, Non-Iron, Casual', 'Eterna', '11877', '11877o1i9gJIK', 'orchid', 'yes', 'no', 0, 0, '2025-01-24 14:25:26'),
(10, 1, 1, 'adsaasfd', '360', '0', '360', 'adsaasfd', 'dwdr', 'no', 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737714961/test-product-images/g2sfwjmeksoakead4mkc.jpg', 'dfsd', '', 'sdg', 'rqwe', 'eqwreq', 'eqwreqGDf3EYpw', 'sfdfgd', 'no', 'no', 1, 1, '2025-01-24 10:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` varchar(120) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_images`
--

CREATE TABLE `pro_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `p_images` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pro_images`
--

INSERT INTO `pro_images` (`id`, `product_id`, `p_images`) VALUES
(18, 4, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737389855/product-images/agupyprkojd8q6ozbhtn.png'),
(19, 5, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737390242/product-images/zy6slobn5lxksdk6klwm.jpg'),
(20, 5, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737390243/product-images/krwra4sbbccoyyjymkla.jpg'),
(21, 6, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737390541/product-images/faztcirfdjoxgnhy79xt.jpg'),
(22, 7, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737455687/product-images/zurqhmgkydg9nem0yhva.jpg'),
(23, 7, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737455689/product-images/ev0vuotzvojuya6y3lkv.jpg'),
(24, 8, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737465278/product-images/km7kdnbftktglhqp2dsp.jpg'),
(25, 8, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737465279/product-images/lshctqiiqoqacormsgzr.jpg'),
(26, 9, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737569300/product-images/cusekzjpbif0cdkmhn8w.jpg'),
(27, 9, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737569301/product-images/jhwispa5cjvzkxtkrrlo.jpg'),
(28, 10, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737714962/test-product-images/bnjr0iqhzal2kfsig1fm.jpg'),
(29, 5, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737727049/product-images/rbxtsp9pr5ctgru2htlu.jpg'),
(30, 5, 'https://res.cloudinary.com/dj7wogsju/image/upload/v1737727050/product-images/hezxvsstx2xjbwbm1aee.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `p_colour`
--

CREATE TABLE `p_colour` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(30) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `p_size`
--

CREATE TABLE `p_size` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `p_size`
--

INSERT INTO `p_size` (`id`, `product_id`, `size`, `quantity`, `created_at`) VALUES
(73, 4, 'S', 4, '2025-01-24 15:31:20'),
(74, 5, 'S', 0, '2025-01-21 13:17:46'),
(75, 5, 'M', 10, '2025-01-20 16:23:19'),
(76, 5, 'L', 10, '2025-01-20 16:23:19'),
(77, 5, 'XL', 10, '2025-01-20 16:23:19'),
(78, 6, 'S', 10, '2025-01-20 16:28:17'),
(79, 6, 'M', 10, '2025-01-21 14:16:03'),
(80, 6, 'L', 10, '2025-01-21 14:16:07'),
(81, 6, 'XL', 10, '2025-01-20 16:28:17'),
(82, 7, 'S', 10, '2025-01-21 10:34:03'),
(83, 7, 'M', 10, '2025-01-21 10:34:03'),
(84, 7, 'L', 10, '2025-01-21 10:34:03'),
(85, 7, 'XL', 10, '2025-01-21 10:34:03'),
(86, 8, 'S', 10, '2025-01-21 13:13:53'),
(87, 8, 'M', 10, '2025-01-21 13:13:53'),
(88, 8, 'L', 10, '2025-01-21 13:13:53'),
(89, 8, 'XL', 10, '2025-01-21 13:13:53'),
(92, 9, 'S', 10, '2025-01-22 18:07:31'),
(93, 9, 'M', 10, '2025-01-22 18:07:31'),
(94, 9, 'L', 10, '2025-01-22 18:07:31'),
(95, 5, 'La', 10, '2025-01-23 17:09:06'),
(96, 10, 'S', 10, '2025-01-24 10:35:07'),
(97, 10, 'M', 110, '2025-01-24 10:35:07'),
(98, 10, 'L', 10, '2025-01-24 10:35:07');

-- --------------------------------------------------------

--
-- Table structure for table `return_order`
--

CREATE TABLE `return_order` (
  `id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `return_order_id` varchar(60) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `by_cs` varchar(80) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `r_status` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `size_name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `size_name`, `quantity`, `status`, `created_at`) VALUES
(38, 'S', 1, 1, '2025-01-24 13:18:05'),
(39, 'M', 1, 0, '2025-01-20 14:21:01'),
(40, 'L', 1, 0, '2025-01-20 14:21:06'),
(41, 'XL', 1, 0, '2025-01-20 14:21:11'),
(42, '2XL', 1, 0, '2025-01-20 14:21:19'),
(43, '3XL', 1, 0, '2025-01-20 14:21:27'),
(44, '4XL', 1, 0, '2025-01-20 14:21:41'),
(45, '28', 1, 0, '2025-01-20 14:21:55'),
(46, '30', 1, 0, '2025-01-20 14:22:00'),
(47, '32', 1, 0, '2025-01-20 14:22:07'),
(48, '34', 1, 0, '2025-01-20 14:22:11'),
(49, '36', 1, 0, '2025-01-20 14:22:17'),
(50, '38', 1, 0, '2025-01-20 14:22:20'),
(51, '40', 1, 0, '2025-01-20 14:25:21'),
(52, '44', 1, 0, '2025-01-20 14:25:25'),
(53, '46', 1, 0, '2025-01-20 14:25:30'),
(54, '48', 1, 0, '2025-01-20 14:25:36'),
(55, '50', 1, 0, '2025-01-20 14:25:41'),
(56, '52', 1, 0, '2025-01-20 14:25:55'),
(57, '32R', 1, 0, '2025-01-20 14:30:47'),
(58, '32L', 1, 0, '2025-01-20 14:31:10'),
(59, '34R', 1, 0, '2025-01-20 14:31:15'),
(60, '34L', 1, 0, '2025-01-21 10:17:04'),
(62, 'L-S', 1, 0, '2025-01-22 15:11:17'),
(63, '42', 1, 0, '2025-01-23 16:31:37'),
(64, 'sadfds', 1, 0, '2025-01-23 16:50:36'),
(65, '50', 1, 0, '2025-01-23 16:50:40');

-- --------------------------------------------------------

--
-- Table structure for table `sizes_fits`
--

CREATE TABLE `sizes_fits` (
  `id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `fit_name` varchar(70) NOT NULL,
  `f_quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `alfa_users`
--
ALTER TABLE `alfa_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `alfa_whislist`
--
ALTER TABLE `alfa_whislist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory_type`
--
ALTER TABLE `inventory_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `new_order`
--
ALTER TABLE `new_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `new_order_itemsss`
--
ALTER TABLE `new_order_itemsss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pro_images`
--
ALTER TABLE `pro_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `p_colour`
--
ALTER TABLE `p_colour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p_size`
--
ALTER TABLE `p_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `return_order`
--
ALTER TABLE `return_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `sizes_fits`
--
ALTER TABLE `sizes_fits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
