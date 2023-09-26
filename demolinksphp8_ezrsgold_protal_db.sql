-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2023 at 04:19 PM
-- Server version: 5.7.43
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demolinksphp8_ezrsgold_protal_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imagetable`
--

CREATE TABLE `imagetable` (
  `id` int(11) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `img_path` text,
  `img_href` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ref_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '1',
  `is_active_img` varchar(1) DEFAULT '1',
  `additional_attributes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagetable`
--

INSERT INTO `imagetable` (`id`, `table_name`, `img_path`, `img_href`, `created_at`, `updated_at`, `ref_id`, `type`, `is_active_img`, `additional_attributes`) VALUES
(2, 'logo', 'uploads/imagetable/1695412058.png', NULL, '2023-09-22 19:47:38', '2023-09-22 14:47:38', NULL, 1, '1', NULL),
(3, 'favicon', 'uploads/imagetable/1695412049.png', NULL, '2023-09-22 19:47:29', '2023-09-22 14:47:29', NULL, 1, '1', NULL),
(4, 'logo2', 'uploads/imagetable/1667864190.png', NULL, '2022-11-07 23:36:30', '2022-11-07 18:36:30', NULL, 1, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int(11) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `package` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `unitprice` varchar(255) DEFAULT NULL,
  `qty` varchar(50) NOT NULL,
  `cur_email` varchar(255) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `uid`, `name`, `package`, `email`, `price`, `unitprice`, `qty`, `cur_email`, `currency`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, '447121', 'mywydivo', 'OSRS GOLD', 'hywabyvody@mailinator.com', '18.00', '0.18', '100', 'zerycepy@mailinator.com', 'Paypal', '2023-09-22 17:40:15', '2023-09-22 22:40:15', NULL),
(9, '135753', 'vuvud', 'OSRS GOLD', 'lupelavyke@mailinator.com', '10.80', '0.18000000000000002', '60', 'kereqy@mailinator.com', 'Bitcoin', '2023-09-22 18:46:51', '2023-09-22 23:46:51', NULL),
(10, '378325', 'zagyfutupy', 'OSRS GOLD', 'wivaxyk@mailinator.com', '3.60', '0.18', '20', 'celixuk@mailinator.com', 'Bitcoin', '2023-09-22 19:21:34', '2023-09-23 00:21:34', NULL),
(11, '378309', 'foqyxasus', 'OSRS GOLD', 'ziqad@mailinator.com', '3.60', '0.18', '20', 'kiqinav@mailinator.com', 'Bitcoin', '2023-09-22 19:27:04', '2023-09-23 00:27:04', NULL),
(12, '327668', 'vafufe', 'OSRS GOLD', 'sakiv@mailinator.com', '3.60', '0.18', '20', 'jacyfat@mailinator.com', 'Bitcoin', '2023-09-22 19:27:56', '2023-09-23 00:27:56', NULL),
(13, '295980', 'varusynaw', 'OSRS GOLD', 'dibenehe@mailinator.com', '3.60', '0.18', '20', 'jisat@mailinator.com', 'Paypal', '2023-09-22 19:29:32', '2023-09-23 00:29:32', NULL),
(14, '569005', 'nyzyga', 'OSRS GOLD', 'buduzos@mailinator.com', '3.60', '0.18', '20', 'melyrilum@mailinator.com', 'Paypal', '2023-09-22 19:30:30', '2023-09-23 00:30:30', NULL),
(15, '156898', 'pubosygu', 'OSRS GOLD', 'biqimuwito@mailinator.com', '3.60', '0.18', '20', 'xyxejuq@mailinator.com', 'Bitcoin', '2023-09-22 19:32:46', '2023-09-23 00:32:46', NULL),
(16, '717066', 'xapyf', 'OSRS GOLD', 'zylaxavo@mailinator.com', '3.60', '0.18', '20', 'wyzymop@mailinator.com', 'Paypal', '2023-09-22 19:34:54', '2023-09-23 00:34:54', NULL),
(17, '913075', 'wubywoso', 'OSRS GOLD', 'xakicab@mailinator.com', '3.60', '0.18', '20', 'hele@mailinator.com', 'Paypal', '2023-09-22 19:37:38', '2023-09-23 00:37:38', NULL),
(18, '620833', 'gukiryn', 'OSRS GOLD', 'vemujygyle@mailinator.com', '7.20', '0.18', '40', 'fyxesywoha@mailinator.com', 'Paypal', '2023-09-22 19:43:51', '2023-09-23 00:43:51', NULL),
(19, '542964', 'buwuna', 'OSRS GOLD', 'venodunasu@mailinator.com', '10.80', '0.18000000000000002', '60', 'vyjoguz@mailinator.com', 'Bitcoin', '2023-09-22 19:44:58', '2023-09-23 00:44:58', NULL),
(20, '562340', 'qefyciqud', 'OSRS GOLD', 'fuhavufo@mailinator.com', '10.80', '0.18000000000000002', '60', 'vugy@mailinator.com', 'Bitcoin', '2023-09-22 19:45:44', '2023-09-23 00:45:44', NULL),
(21, '847522', 'xubeb', 'OSRS GOLD', 'gycosajy@mailinator.com', '10.80', '0.18000000000000002', '60', 'fimizikaba@mailinator.com', 'Paypal', '2023-09-22 19:48:56', '2023-09-23 00:48:56', NULL),
(22, '104167', 'xycar', 'OSRS GOLD', 'lebep@mailinator.com', '10.80', '0.18000000000000002', '60', 'huvyj@mailinator.com', 'Bitcoin', '2023-09-22 19:50:12', '2023-09-23 00:50:12', NULL),
(23, '943950', 'kypahe', 'OSRS GOLD', 'gykenu@mailinator.com', '10.80', '0.18000000000000002', '60', 'dypaqyj@mailinator.com', 'Bitcoin', '2023-09-22 19:51:36', '2023-09-23 00:51:36', NULL),
(24, '437806', 'vyhezu', 'OSRS GOLD', 'roramizi@mailinator.com', '10.80', '0.18000000000000002', '60', 'lerawi@mailinator.com', 'Bitcoin', '2023-09-22 19:52:03', '2023-09-23 00:52:03', NULL),
(25, '830558', 'manecucada', 'OSRS GOLD', 'bovylidab@mailinator.com', '10.80', '0.18000000000000002', '60', 'rexaji@mailinator.com', 'Bitcoin', '2023-09-22 19:53:11', '2023-09-23 00:53:11', NULL),
(26, '883999', 'ryfaqi', 'OSRS GOLD', 'dacovi@mailinator.com', '10.80', '0.18000000000000002', '60', 'wywa@mailinator.com', 'Paypal', '2023-09-22 19:54:03', '2023-09-23 00:54:03', NULL),
(27, '590179', 'Team', 'OSRS GOLD', 'waleedkhawer889@gmail.com', '14.40', '0.18', '80', 'ghjjhhj@test.com', 'Bitcoin', '2023-09-24 18:02:18', '2023-09-24 14:02:18', NULL),
(28, '210260', 'Team', 'OSRS GOLD', 'test@test.com', '10.80', '0.18000000000000002', '60', 'test', 'Bitcoin', '2023-09-24 18:14:54', '2023-09-24 14:14:54', NULL),
(29, '709503', 'Team', 'OSRS GOLD', 'test@test.com', '10.80', '0.18000000000000002', '60', 'test@tetss.com', 'Bitcoin', '2023-09-24 18:19:28', '2023-09-24 14:19:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `m_flag`
--

CREATE TABLE `m_flag` (
  `id` int(11) NOT NULL,
  `flag_type` varchar(100) NOT NULL,
  `flag_value` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flag_additionalText` text,
  `has_image` varchar(1) DEFAULT '0',
  `is_active` varchar(1) DEFAULT '1',
  `is_config` varchar(1) DEFAULT '0',
  `flag_show_text` text,
  `is_featured` int(11) DEFAULT '0',
  `is_deleted` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('user@beautysuites.com', '$2y$10$dpLXVxYQcK1YNkIn3.emH.wybELh6mlT94WAt.B2Oqi1LxxGfliFW', '2022-02-09 05:09:07'),
('admin@beautysuites.com', '$2y$10$qMQgGHpYBPBXVQreikc8suPnJvPFl/BkvvmVQ47BC/bV04qRjuDp.', '2022-02-09 05:11:18'),
('vendor@kenol.com', '$2y$10$i4GJP.h2cz/Y7GAO8DFWJe5ek7kUPna3a0.m1wx.DePRDRRTYOylq', '2022-03-14 06:08:51'),
('test@test.com', '$2y$10$wmOmRY/eQK35GT1jV2k7weT/sbByee9syiEfl1ziKpKTAtmHfF/CW', '2022-03-17 03:35:00'),
('haris.hussain2000@gmail.com', '$2y$10$cIwWMCmNWG5i.pOG4hiqJuL4EhklqMQtHrBKDIlfYGl125q1e/NGi', '2022-03-29 08:40:48'),
('admin@danny.com', '$2y$10$D0rND747RZ4ZQvzBoEopHOi2hV8I1qoRi7CR8vLsPCN6an.Wv.PSe', '2022-07-25 15:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `localisation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `bio`, `localisation`, `dob`, `gender`, `pic`, `country`, `state`, `city`, `address`, `postal`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'One Call Does It All', 'male', '2017-09-13', 'male', '1666037142.png', 'Pakistan', 'Sindh', 'Karachi', 'A-103, Street # 20, Downtown', '35768', '111-111-1111', '2019-12-09 13:00:46', '2022-10-17 15:05:42'),
(2, 2, NULL, NULL, '2022-05-12', 'male', 'profile.png', 'USA', 'NewYork', 'NewYork', 'Test Address', '11114', NULL, '2021-07-13 12:53:36', '2022-05-11 06:09:43'),
(129, 35, NULL, NULL, NULL, NULL, 'profile.png', NULL, NULL, NULL, NULL, NULL, '111-111-1111', '2022-10-13 16:02:32', '2022-10-13 16:02:32'),
(137, 43, NULL, NULL, NULL, NULL, 'profile.png', NULL, NULL, NULL, NULL, NULL, '111-111-1111', '2022-10-18 15:59:21', '2022-10-18 15:59:21'),
(139, 45, NULL, NULL, NULL, NULL, 'profile.png', NULL, NULL, NULL, NULL, NULL, '111-111-1111', '2022-10-18 16:02:04', '2022-10-18 16:02:04'),
(140, 46, NULL, NULL, NULL, NULL, 'profile.png', NULL, NULL, NULL, NULL, NULL, '111-111-1111', '2022-10-18 16:45:51', '2022-10-18 16:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, '2019-11-06 06:57:52', '2019-11-06 06:57:52'),
(2, 'user', NULL, '2019-11-06 06:57:52', '2019-11-06 06:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrival_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `email`, `contact`, `address_1`, `address_2`, `city`, `state`, `zip_code`, `arrival_source`, `shipping_address1`, `shipping_address2`, `shipping_city`, `shipping_state`, `shipping_zipcode`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', '', 'Admin', '', 'admin@ezrsgold.com', '611-211-1111', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$bp.ZvKqzhHXCbUk6YGKFquYE/Sjn/2/zySRvt76ufcdFU/WvT8LuK', 'N6d87ld3b8hSSPu58t0mt5eNV8i0Rtk9L0G0iqnMtg1wAr78CELQzHuxJ4r0', '2021-08-12 14:06:10', '2022-05-10 05:57:55', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_flag`
--
ALTER TABLE `m_flag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_flag`
--
ALTER TABLE `m_flag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
