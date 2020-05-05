-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: May 05, 2020 at 07:47 AM
-- Server version: 8.0.20
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kod3rsStore`
--

-- --------------------------------------------------------

--
-- Table structure for table `Albums`
--

CREATE TABLE `Albums` (
  `id_albums` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `id_categories` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` int NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Cities_catalog`
--

CREATE TABLE `Cities_catalog` (
  `id_cities_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `city` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_states_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_postal_codes` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Countries_catalog`
--

CREATE TABLE `Countries_catalog` (
  `id_countries_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `country` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `country_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `id_currencies` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Currencies`
--

CREATE TABLE `Currencies` (
  `id_currencies` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `currency` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Directions`
--

CREATE TABLE `Directions` (
  `id_directions` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_cities_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_countries_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_states_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `street` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `street_number` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_postal_codes` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `creation_date` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_users` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Modules`
--

CREATE TABLE `Modules` (
  `id_modules` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `module_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Module_access`
--

CREATE TABLE `Module_access` (
  `id_module_access` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_modules` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_security_levels` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_users` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `id_payments` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_users` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payments_history`
--

CREATE TABLE `Payments_history` (
  `id_payments_history` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_payments` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Postal_codes`
--

CREATE TABLE `Postal_codes` (
  `id_postal_codes` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_states_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_cities_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `id_products` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cost` bigint NOT NULL,
  `quantity` int NOT NULL,
  `creation_date` date NOT NULL,
  `id_seller` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `id_countries` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_albums` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Product_photos`
--

CREATE TABLE `Product_photos` (
  `id_product_photos` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_albums` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_date` date NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Security_levels`
--

CREATE TABLE `Security_levels` (
  `id_security_levels` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `secirity_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Shopping_carts`
--

CREATE TABLE `Shopping_carts` (
  `id_shopping_carts` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `creation_date` date NOT NULL,
  `puchase_date` date NOT NULL,
  `id_payments_history` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Shopping_cart_products`
--

CREATE TABLE `Shopping_cart_products` (
  `id_shopping_cart_products` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_products` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `quantity` int NOT NULL,
  `legacy_cost` bigint NOT NULL,
  `id_albums` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_countries` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_currencies` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_shopping_carts` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `creation_date` date NOT NULL,
  `id_payments_history` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_user_seller` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `States_catalog`
--

CREATE TABLE `States_catalog` (
  `id_states_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `state` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `state_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_countries_catalog` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id_users` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `login` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_security_levels` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_shopping_carts` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `creation_date` date DEFAULT NULL,
  `id_user_types` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `score` int NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `User_types`
--

CREATE TABLE `User_types` (
  `id_user_types` varchar(30) NOT NULL,
  `user_type` varchar(250) NOT NULL,
  `user_type_code` int NOT NULL,
  `available` tinyint(1) NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Albums`
--
ALTER TABLE `Albums`
  ADD PRIMARY KEY (`id_albums`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Indexes for table `Cities_catalog`
--
ALTER TABLE `Cities_catalog`
  ADD PRIMARY KEY (`id_cities_catalog`);

--
-- Indexes for table `Countries_catalog`
--
ALTER TABLE `Countries_catalog`
  ADD PRIMARY KEY (`id_countries_catalog`);

--
-- Indexes for table `Currencies`
--
ALTER TABLE `Currencies`
  ADD PRIMARY KEY (`id_currencies`);

--
-- Indexes for table `Directions`
--
ALTER TABLE `Directions`
  ADD PRIMARY KEY (`id_directions`);

--
-- Indexes for table `Modules`
--
ALTER TABLE `Modules`
  ADD PRIMARY KEY (`id_modules`);

--
-- Indexes for table `Module_access`
--
ALTER TABLE `Module_access`
  ADD PRIMARY KEY (`id_module_access`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`id_payments`);

--
-- Indexes for table `Payments_history`
--
ALTER TABLE `Payments_history`
  ADD PRIMARY KEY (`id_payments_history`);

--
-- Indexes for table `Postal_codes`
--
ALTER TABLE `Postal_codes`
  ADD PRIMARY KEY (`id_postal_codes`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id_products`);

--
-- Indexes for table `Product_photos`
--
ALTER TABLE `Product_photos`
  ADD PRIMARY KEY (`id_product_photos`);

--
-- Indexes for table `Security_levels`
--
ALTER TABLE `Security_levels`
  ADD PRIMARY KEY (`id_security_levels`);

--
-- Indexes for table `Shopping_carts`
--
ALTER TABLE `Shopping_carts`
  ADD PRIMARY KEY (`id_shopping_carts`);

--
-- Indexes for table `Shopping_cart_products`
--
ALTER TABLE `Shopping_cart_products`
  ADD PRIMARY KEY (`id_shopping_cart_products`);

--
-- Indexes for table `States_catalog`
--
ALTER TABLE `States_catalog`
  ADD PRIMARY KEY (`id_states_catalog`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `User_types`
--
ALTER TABLE `User_types`
  ADD PRIMARY KEY (`id_user_types`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
