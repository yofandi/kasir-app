-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2026 at 02:33 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vuetailwinddash`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('483e8180cf4678cf1292d8c46d0cbd6b', 'i:1;', 1773802966),
('483e8180cf4678cf1292d8c46d0cbd6b:timer', 'i:1773802966;', 1773802966),
('7e384c5f4ae3a99781b46ad9e8ea22d4', 'i:1;', 1774487793),
('7e384c5f4ae3a99781b46ad9e8ea22d4:timer', 'i:1774487793;', 1774487793),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:30:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:15:\"dashboard.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:21:\"dashboard.sales_chart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:21:\"dashboard.sales_today\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:23:\"dashboard.profits_today\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:30:\"dashboard.best_selling_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:23:\"dashboard.product_stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:11:\"users.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"users.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:10:\"users.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:12:\"users.delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:11:\"roles.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:12:\"roles.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:10:\"roles.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:12:\"roles.delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:17:\"permissions.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:16:\"categories.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:17:\"categories.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:15:\"categories.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:17:\"categories.delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:14:\"products.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:15:\"products.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:13:\"products.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:15:\"products.delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:15:\"customers.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:16:\"customers.create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:14:\"customers.edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:16:\"customers.delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:18:\"transactions.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:11:\"sales.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:13:\"profits.index\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:3:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:7:\"cashier\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:8:\"producer\";s:1:\"c\";s:3:\"web\";}}}', 1774575105);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cashier_id` bigint UNSIGNED NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `qty`, `created_at`, `updated_at`, `cashier_id`, `price`) VALUES
('3b8095a3-b014-440d-852c-ff69cc6b5b32', '243edd9e-b13b-4977-acec-84cf279a0fed', 2, '2026-02-06 07:03:08', '2026-02-06 07:03:10', 2, 11000),
('da9dc6d5-173c-4a96-89c8-cee33840af46', '243edd9e-b13b-4977-acec-84cf279a0fed', 1, '2026-03-26 01:32:10', '2026-03-26 01:32:10', 4, 5500);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `image`, `name`, `description`, `created_at`, `updated_at`) VALUES
('68498e24-5a93-4965-97fc-feaf2187fb76', 't1kQCpgMPGk1GrHr4BGctdgKiX3K3CAt8cO1Viwz.jpg', 'soft drink', 'ukuran mini', '2025-10-31 09:51:52', '2025-11-04 18:09:06'),
('8d3b1e6f-1e08-40fb-bea3-1e1da51ba8ba', 'nD7Q7qvCOp4sUGmO0d8ssmjXMeArDJW4h473KIuE.jpg', 'Isotinik', 'ukuran mini', '2025-10-31 09:46:28', '2025-11-04 18:09:17'),
('f149106d-4476-4a7f-80ca-e1743dd97090', 'GNDjjBgQsYFN6YxEvFuK7m8hgc6DPSkGMjunvgt0.jpg', 'Roti', 'roti aja', '2026-01-28 15:54:48', '2026-01-28 15:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `no_telp`, `address`, `created_at`, `updated_at`) VALUES
('1ad02774-9a0f-4bc8-bd9a-460dff07c62e', 'Kornelius Valentino Nagata', '029384920284', 'mencoba kembali', '2025-11-08 06:20:37', '2025-11-08 06:20:37'),
('921048d1-4113-4f1d-bdd7-c3859636c4ee', 'Yohana Putri Tampubolon', '027382910183', 'mencoba input data', '2025-11-08 06:19:20', '2025-11-08 06:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(51, '2025_05_30_231154_add_two_factor_columns_to_users_table', 2),
(63, '0001_01_01_000000_create_users_table', 3),
(64, '0001_01_01_000001_create_cache_table', 3),
(65, '0001_01_01_000002_create_jobs_table', 3),
(66, '2025_05_27_155006_create_categories_table', 3),
(67, '2025_05_27_155509_create_products_table', 3),
(68, '2025_05_27_155756_create_customers_table', 3),
(69, '2025_05_27_155850_create_transactions_table', 3),
(70, '2025_05_27_160020_create_transaction_details_table', 3),
(71, '2025_05_27_160055_create_profits_table', 3),
(72, '2025_05_27_160140_create_carts_table', 3),
(73, '2025_05_30_225300_create_permission_tables', 3),
(74, '2025_06_23_205711_add_two_factor_columns_to_users_table', 3),
(75, '2025_12_28_142335_add_price_column_to_carts_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('tester@example.com', '$2y$12$LPLRx0SaJKW6KePlPfq0d.eTfbzawU4LOJL8P4YQdtiVtp/R/12lm', '2025-06-23 19:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(2, 'dashboard.sales_chart', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(3, 'dashboard.sales_today', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(4, 'dashboard.profits_today', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(5, 'dashboard.best_selling_product', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(6, 'dashboard.product_stock', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(7, 'users.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(8, 'users.create', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(9, 'users.edit', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(10, 'users.delete', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(11, 'roles.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(12, 'roles.create', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(13, 'roles.edit', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(14, 'roles.delete', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(15, 'permissions.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(16, 'categories.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(17, 'categories.create', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(18, 'categories.edit', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(19, 'categories.delete', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(20, 'products.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(21, 'products.create', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(22, 'products.edit', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(23, 'products.delete', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(24, 'customers.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(25, 'customers.create', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(26, 'customers.edit', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(27, 'customers.delete', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(28, 'transactions.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(29, 'sales.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(30, 'profits.index', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `buy_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sell_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `stock` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `image`, `barcode`, `title`, `description`, `buy_price`, `sell_price`, `stock`, `created_at`, `updated_at`) VALUES
('243edd9e-b13b-4977-acec-84cf279a0fed', '68498e24-5a93-4965-97fc-feaf2187fb76', 'C7JqmIdCHc4Yc1D4jT6ddcQ5AnPahImRtkbxK4c4.png', 'SF-01', 'Fanta Strawberry', 'fanta 500ml', 3000.00, 5500.00, 86, '2025-11-04 18:28:04', '2026-02-02 16:30:07'),
('41d26132-ec44-40f8-990a-17bc51db869f', 'f149106d-4476-4a7f-80ca-e1743dd97090', '46qhRjHnrx3wMjgdyH1sdvI3ObHqFQzrh4gosgw5.jpg', 'SF-03', 'Roti Tawar Sari Roti', 'roti ini saja', 10000.00, 15000.00, 87, '2026-01-28 15:56:29', '2026-02-02 16:30:07'),
('ee6b72a6-83c3-4072-ae30-d864006360d3', '68498e24-5a93-4965-97fc-feaf2187fb76', 'oewfgh3Rl1wxWb6Y1VUH4eCUFcpfTtz7mEx47XlZ.png', 'SF-02', 'BigCola', 'minuman berkarbonasi ukuran 1.5 L', 10000.00, 15000.00, 90, '2025-11-04 18:15:34', '2026-02-02 16:30:07');

-- --------------------------------------------------------

--
-- Table structure for table `profits`
--

CREATE TABLE `profits` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profits`
--

INSERT INTO `profits` (`id`, `transaction_id`, `total`, `created_at`, `updated_at`) VALUES
('a0f2083e-db9f-4135-8cd0-d7e9bd687f4c', 'a0f2083e-d4e2-48b5-b556-b012d35b00dd', 10000.00, '2026-01-28 15:23:28', '2026-01-28 15:23:28'),
('a0f2083e-dde1-45ca-9849-d2b21be0b43b', 'a0f2083e-d4e2-48b5-b556-b012d35b00dd', 12500.00, '2026-01-28 15:23:28', '2026-01-28 15:23:28'),
('a0f2144c-e054-4e84-bc3d-33254d05374d', 'a0f2144c-d842-487d-8600-b8b683317203', 5000.00, '2026-01-28 15:57:11', '2026-01-28 15:57:11'),
('a0f2195f-b3aa-4a97-9718-d96648ed63ac', 'a0f2195f-adf5-46be-9eac-df37fee62f25', 5000.00, '2026-01-28 16:11:22', '2026-01-28 16:11:22'),
('a0fc25ac-0fa5-4969-b373-138f8ff884c4', 'a0fc25ac-090b-4635-b0d2-9442b8e3892c', 25000.00, '2026-02-02 16:04:02', '2026-02-02 16:04:02'),
('a0fc29a2-29ee-4443-800b-2431335643a8', 'a0fc29a2-2561-48a5-b59b-39143acbbe03', 10000.00, '2026-02-02 16:15:06', '2026-02-02 16:15:06'),
('a0fc2a63-de7a-4f9c-b013-9d5264890366', 'a0fc2a63-d973-45f5-85fe-5ddbf4e0b66f', 15000.00, '2026-02-02 16:17:13', '2026-02-02 16:17:13'),
('a0fc2d7e-14bd-4220-97d0-06eee267f625', 'a0fc2d7e-0e4c-4a5c-976d-975150082aab', 15000.00, '2026-02-02 16:25:54', '2026-02-02 16:25:54'),
('a0fc2eff-a053-45f0-8f62-862546e0a30f', 'a0fc2eff-9b7e-4a74-95fe-9bd0f4e5f481', 25000.00, '2026-02-02 16:30:07', '2026-02-02 16:30:07'),
('a0fc2eff-a166-4eb0-8816-1444e11751ea', 'a0fc2eff-9b7e-4a74-95fe-9bd0f4e5f481', 20000.00, '2026-02-02 16:30:07', '2026-02-02 16:30:07'),
('a0fc2eff-a228-4ca3-bdaf-357db1204a9d', 'a0fc2eff-9b7e-4a74-95fe-9bd0f4e5f481', 7500.00, '2026-02-02 16:30:07', '2026-02-02 16:30:07');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-07-01 07:08:57', '2025-07-01 07:08:57'),
(2, 'cashier', 'web', '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(4, 'producer', 'web', '2025-10-30 03:45:21', '2025-10-30 03:45:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(20, 4),
(21, 4),
(22, 4),
(23, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('wf0D34KoX0ah6WOwuPlf5w4Rr6MJVYxKenybBfgZ', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiek1ZSE1zZFdwWGJ6U2t2NEtNY3RvUlp1SzlDT2FVTHN6SmFjVEFJVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHBzL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7fQ==', 1774488730);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cash` decimal(15,2) NOT NULL,
  `change` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cashier_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customer_id`, `invoice`, `cash`, `change`, `discount`, `grand_total`, `created_at`, `updated_at`, `cashier_id`) VALUES
('a0f20020-d7c3-4c92-8b65-5fb16c12eada', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-Z0SS0L0B43', 50000.00, 12500.00, 20000.00, 37500.00, '2026-01-28 15:00:47', '2026-01-28 15:00:47', 2),
('a0f20527-3fa8-47ce-9d87-db6617a25940', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-68271L8L1Z', 50000.00, 12500.00, 20000.00, 37500.00, '2026-01-28 15:14:49', '2026-01-28 15:14:49', 2),
('a0f20554-0a04-49cd-a764-44aa94cf1f7f', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-PQQ70YUUBR', 50000.00, 12500.00, 20000.00, 37500.00, '2026-01-28 15:15:19', '2026-01-28 15:15:19', 2),
('a0f206c5-21f8-4e55-9bec-18df284a7e45', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-6YS30GT2F9', 50000.00, 12500.00, 20000.00, 37500.00, '2026-01-28 15:19:21', '2026-01-28 15:19:21', 2),
('a0f207d4-9301-40b8-92cf-4f39f51513df', '1ad02774-9a0f-4bc8-bd9a-460dff07c62e', 'TRX-5669041ECG', 50000.00, 2500.00, 10000.00, 47500.00, '2026-01-28 15:22:19', '2026-01-28 15:22:19', 2),
('a0f2083e-d4e2-48b5-b556-b012d35b00dd', '1ad02774-9a0f-4bc8-bd9a-460dff07c62e', 'TRX-G3YRTK764T', 50000.00, 2500.00, 10000.00, 47500.00, '2026-01-28 15:23:28', '2026-01-28 15:23:28', 2),
('a0f2144c-d842-487d-8600-b8b683317203', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-5FAEK7G061', 15000.00, 1000.00, 1000.00, 14000.00, '2026-01-28 15:57:11', '2026-01-28 15:57:11', 2),
('a0f2195f-adf5-46be-9eac-df37fee62f25', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-EMXE0596R2', 12000.00, 1000.00, 0.00, 11000.00, '2026-01-28 16:11:22', '2026-01-28 16:11:22', 2),
('a0fc25ac-090b-4635-b0d2-9442b8e3892c', '1ad02774-9a0f-4bc8-bd9a-460dff07c62e', 'TRX-A45JV6C10P', 70000.00, 5000.00, 10000.00, 65000.00, '2026-02-02 16:04:02', '2026-02-02 16:04:02', 2),
('a0fc29a2-2561-48a5-b59b-39143acbbe03', '1ad02774-9a0f-4bc8-bd9a-460dff07c62e', 'TRX-W90K81IYF2', 30000.00, 0.00, 0.00, 22000.00, '2026-02-02 16:15:06', '2026-02-02 16:15:06', 2),
('a0fc2a63-d973-45f5-85fe-5ddbf4e0b66f', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-D6B5N1BV3H', 50000.00, 5000.00, 0.00, 45000.00, '2026-02-02 16:17:13', '2026-02-02 16:17:13', 2),
('a0fc2d7e-0e4c-4a5c-976d-975150082aab', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-7HYLW30HP0', 50000.00, 5000.00, 0.00, 45000.00, '2026-02-02 16:25:54', '2026-02-02 16:25:54', 2),
('a0fc2eff-9b7e-4a74-95fe-9bd0f4e5f481', '921048d1-4113-4f1d-bdd7-c3859636c4ee', 'TRX-K1R266B8LW', 150000.00, 3500.00, 5000.00, 146500.00, '2026-02-02 16:30:07', '2026-02-02 16:30:07', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `transaction_id`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
('3027cada-daaa-461a-8567-5928c21eaa97', 'a0f206c5-21f8-4e55-9bec-18df284a7e45', 'ee6b72a6-83c3-4072-ae30-d864006360d3', 2, 30000.00, '2026-01-28 15:19:21', '2026-01-28 15:19:21'),
('a0f207d4-978f-4e18-b957-ea40801ac9ee', 'a0f207d4-9301-40b8-92cf-4f39f51513df', 'ee6b72a6-83c3-4072-ae30-d864006360d3', 2, 30000.00, '2026-01-28 15:22:19', '2026-01-28 15:22:19'),
('a0f2083e-da57-4715-ad0f-9be24d67aa81', 'a0f2083e-d4e2-48b5-b556-b012d35b00dd', 'ee6b72a6-83c3-4072-ae30-d864006360d3', 2, 30000.00, '2026-01-28 15:23:28', '2026-01-28 15:23:28'),
('a0f2083e-dcf7-46ca-ab88-324d656ba49d', 'a0f2083e-d4e2-48b5-b556-b012d35b00dd', '243edd9e-b13b-4977-acec-84cf279a0fed', 5, 27500.00, '2026-01-28 15:23:28', '2026-01-28 15:23:28'),
('a0f2144c-deda-41ba-8b9c-36387ac3bdba', 'a0f2144c-d842-487d-8600-b8b683317203', '41d26132-ec44-40f8-990a-17bc51db869f', 1, 15000.00, '2026-01-28 15:57:11', '2026-01-28 15:57:11'),
('a0f2195f-b25e-4574-9bc0-2c1ec6a4b02e', 'a0f2195f-adf5-46be-9eac-df37fee62f25', '243edd9e-b13b-4977-acec-84cf279a0fed', 2, 11000.00, '2026-01-28 16:11:22', '2026-01-28 16:11:22'),
('a0fc25ac-0e0e-4cb6-b6d4-ff004a293d40', 'a0fc25ac-090b-4635-b0d2-9442b8e3892c', '41d26132-ec44-40f8-990a-17bc51db869f', 5, 75000.00, '2026-02-02 16:04:02', '2026-02-02 16:04:02'),
('a0fc29a2-28ae-4b96-a4e7-bebd56df8487', 'a0fc29a2-2561-48a5-b59b-39143acbbe03', '243edd9e-b13b-4977-acec-84cf279a0fed', 4, 22000.00, '2026-02-02 16:15:06', '2026-02-02 16:15:06'),
('a0fc2a63-dcdd-45cd-a654-583a54ef6dea', 'a0fc2a63-d973-45f5-85fe-5ddbf4e0b66f', 'ee6b72a6-83c3-4072-ae30-d864006360d3', 3, 45000.00, '2026-02-02 16:17:13', '2026-02-02 16:17:13'),
('a0fc2d7e-137e-428f-8055-6a6022042601', 'a0fc2d7e-0e4c-4a5c-976d-975150082aab', '41d26132-ec44-40f8-990a-17bc51db869f', 3, 45000.00, '2026-02-02 16:25:54', '2026-02-02 16:25:54'),
('a0fc2eff-9f3d-4a01-aca9-204ca3833a70', 'a0fc2eff-9b7e-4a74-95fe-9bd0f4e5f481', 'ee6b72a6-83c3-4072-ae30-d864006360d3', 5, 75000.00, '2026-02-02 16:30:07', '2026-02-02 16:30:07'),
('a0fc2eff-a110-4a97-8bb9-b311d132e9ab', 'a0fc2eff-9b7e-4a74-95fe-9bd0f4e5f481', '41d26132-ec44-40f8-990a-17bc51db869f', 4, 60000.00, '2026-02-02 16:30:07', '2026-02-02 16:30:07'),
('a0fc2eff-a1d9-4d0a-a0e2-880d051da0c9', 'a0fc2eff-9b7e-4a74-95fe-9bd0f4e5f481', '243edd9e-b13b-4977-acec-84cf279a0fed', 3, 16500.00, '2026-02-02 16:30:07', '2026-02-02 16:30:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tester Reset', 'tester@example.com', NULL, '$2y$12$3QZXDnadYA9h.Fb2G2ocQec8NjGPRnAojH97bgrIMQEiXm02E4x3G', NULL, NULL, NULL, '3HEFO2Kwjz0FJwKtJQTjhqcZa4cYrJFIwObRBlRxkH5AsCuEELfC0Bfy3PBI', '2025-06-23 18:55:00', '2025-06-23 18:56:33'),
(2, 'Administrator 1', 'admin@gmail.com', NULL, '$2y$12$PBvGh9spzZrcOtaF/Z9gBeHMgIBK2rlzV8W3daiZHSuowk/H6k1Ui', NULL, NULL, NULL, NULL, '2025-07-01 07:08:58', '2025-07-01 07:08:58'),
(4, 'Yofandi', 'yofandirikiwinata24@gmail.com', NULL, '$2y$12$txKAWZoJutSZ175g.VICsuZkp6eDgU/O.G1FFstp3/dGZHL1jLh7K', NULL, NULL, NULL, NULL, '2025-10-31 09:37:54', '2025-10-31 09:37:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_cashier_id_foreign` (`cashier_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `profits`
--
ALTER TABLE `profits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profits_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_invoice_unique` (`invoice`),
  ADD KEY `transactions_cashier_id_foreign` (`cashier_id`),
  ADD KEY `transactions_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_details_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_cashier_id_foreign` FOREIGN KEY (`cashier_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profits`
--
ALTER TABLE `profits`
  ADD CONSTRAINT `profits_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_cashier_id_foreign` FOREIGN KEY (`cashier_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_details_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
