-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2022 at 09:11 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dollyeffect`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `name`, `email`, `phone`, `date`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sandra Peck', 'citoqyfe@mailinator.com', '+1 (164) 856-5191', '07-11-2022 12:00 AM', 'Porro voluptas et re', '2022-11-07 17:52:41', '2022-11-07 17:52:41', NULL),
(2, 'Colt Gallegos', 'kega@mailinator.com', '111-111-1111', '2008-02-02T08:01', 'Cumque rerum quia en', '2022-11-07 17:58:33', '2022-11-07 17:58:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text NOT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `author`, `description`, `image`, `date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333266.jpg', '2022-02-11 14:00:00', 1, '2022-05-20 08:49:49', '2022-05-23 19:14:26', NULL),
(2, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333289.jpg', '2022-02-11 14:00:00', 1, '2022-05-20 09:15:38', '2022-05-23 19:14:49', NULL),
(3, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333299.jpg', '2022-02-11 14:00:00', 1, '2022-05-20 09:16:16', '2022-05-23 19:14:59', NULL),
(4, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333314.jpg', '2022-06-21 07:45:52', 1, '2022-05-20 09:17:09', '2022-06-21 16:45:52', '2022-06-21 16:45:52'),
(5, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333325.jpg', '2022-06-21 07:45:49', 1, '2022-05-20 09:17:45', '2022-06-21 16:45:49', '2022-06-21 16:45:49'),
(6, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333336.jpg', '2022-06-21 07:45:45', 1, '2022-05-20 09:18:10', '2022-06-21 16:45:45', '2022-06-21 16:45:45'),
(7, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333344.jpg', '2022-06-21 07:45:42', 1, '2022-05-20 09:18:50', '2022-06-21 16:45:42', '2022-06-21 16:45:42'),
(8, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333356.jpg', '2022-06-21 07:45:39', 1, '2022-05-20 09:20:36', '2022-06-21 16:45:39', '2022-06-21 16:45:39'),
(9, 'Lorem Ipsum', 'Jane Doe', 'Lorem ipsum dolor sit amet,elit, sed do eiusmod tempor incididunt ut labore et dolore magna.', 'uploads/admin/article/1653333365.jpg', '2022-06-21 07:45:35', 1, '2022-05-20 09:20:59', '2022-06-21 16:45:35', '2022-06-21 16:45:35'),
(10, 'puppy for adoption', 'clay', 'Vestibulum neque massa, scelerisque sit amet ligula eu, congue molestie mi. Praesent ut varius sem. Nullam at porttitor arcu, nec lacinia nisi. Ut ac dolor vitae odio interdum condimentum. Vivamus dapibus sodales ex,', 'uploads/admin/article/1654638932.png', '2022-06-21 07:45:30', 1, '2022-06-07 16:55:32', '2022-06-21 16:45:30', '2022-06-21 16:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`page_name`, `id`, `heading`, `sub_title`, `description`, `image_path`, `button_name`, `button_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
('Home Page', 1, 'Change Your Self', 'Perfect Eyelashes', '<span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.</span><br>', 'uploads/admin/banner/1667864668.png', 'DISCOVER MORE', 'https://localhost/Haris/dollyeffect/about', '2021-12-20 06:57:01', '2022-11-07 18:44:28', NULL),
('About Us', 2, 'About Us', NULL, NULL, 'uploads/admin/banner/1667864799.jpg', NULL, NULL, NULL, '2022-11-07 18:46:39', NULL),
('Our Location', 3, 'Our Location', NULL, NULL, 'uploads/admin/banner/1667839418.jpg', NULL, NULL, NULL, '2022-10-11 12:00:24', NULL),
('Services', 4, 'Services', NULL, NULL, 'uploads/admin/banner/1667839418.jpg', NULL, NULL, NULL, '2022-10-11 12:04:15', NULL),
('Detail Services', 5, 'Detail Services', NULL, NULL, 'uploads/admin/banner/1667839418.jpg', NULL, NULL, NULL, '2022-11-07 11:43:38', NULL),
('Gift Card', 6, 'Gift Card', NULL, NULL, 'uploads/admin/banner/1667839418.jpg', NULL, NULL, NULL, '2022-10-11 12:06:35', NULL),
('Contact US', 7, 'Contact US', NULL, NULL, 'uploads/admin/banner/1667839418.jpg', NULL, NULL, NULL, '2022-10-11 12:09:27', NULL),
('Login', 9, 'Login', NULL, NULL, 'uploads/admin/banner/1667856123.jpg', NULL, NULL, NULL, '2022-11-07 16:22:09', NULL),
('Forget Password', 11, 'Forget Password', NULL, NULL, 'uploads/admin/banner/1667856139.jpg', NULL, NULL, NULL, '2022-11-07 16:22:19', NULL),
('Privacy', 18, 'Privacy Policy', NULL, NULL, 'uploads/admin/banner/1667856150.jpg', NULL, NULL, NULL, '2022-11-07 16:22:30', NULL),
('Booking', 19, 'BOOKING', NULL, NULL, 'uploads/admin/banner/1667856167.jpg', NULL, NULL, NULL, '2022-11-07 16:22:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `blogger_name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `short_description`, `description`, `blogger_name`, `image_path`, `tag`, `view`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'how-stay-calm-from-the-first-time', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', 'CASETHEMES', 'uploads/admin/blog/16657862491.png', 'blog', 0, 1, '2021-12-21 02:31:27', '2022-10-14 22:24:09', NULL),
(2, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'how-stay-calm-from-the-first-time1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', '2 CASETHEMES', 'uploads/admin/blog/16657862841.png', 'blog', 0, 1, '2021-12-21 02:31:27', '2022-10-14 22:24:44', NULL),
(4, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'how-stay-calm-from-the-first-time2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', 'CASETHEMES', 'uploads/admin/blog/16657863111.png', 'blog', 0, 1, '2021-12-21 02:31:27', '2022-10-14 22:25:11', NULL),
(5, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'how-stay-calm-from-the-first-time3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', 'CASETHEMES', 'uploads/admin/blog/16657863361.png', 'blog', 0, 1, '2021-12-21 02:31:27', '2022-10-14 22:25:36', NULL),
(6, 'How stay calm from the first time.', 'how-stay-calm-from-the-first-time4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad', '<p><span style=\"color: rgb(33, 37, 41); font-family: Raleway, sans-serif; font-size: 13.86px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</span><span style=\"color: rgb(33, 37, 41); font-family: Raleway, sans-serif; font-size: 13.86px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</span><span style=\"color: rgb(33, 37, 41); font-family: Raleway, sans-serif; font-size: 13.86px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</span><span style=\"color: rgb(33, 37, 41); font-family: Raleway, sans-serif; font-size: 13.86px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</span><br></p>', 'CASETHEMES', 'uploads/admin/blog/16401085071.png', 'blog', 0, 1, '2021-12-21 02:31:27', '2022-02-10 17:42:29', '2022-02-10 17:42:29'),
(7, 'How stay calm from the first time.', 'how-stay-calm-from-the-first-time5', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad', '<p><span style=\"color: rgb(33, 37, 41); font-family: Raleway, sans-serif; font-size: 13.86px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</span><span style=\"color: rgb(33, 37, 41); font-family: Raleway, sans-serif; font-size: 13.86px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</span><span style=\"color: rgb(33, 37, 41); font-family: Raleway, sans-serif; font-size: 13.86px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</span><span style=\"color: rgb(33, 37, 41); font-family: Raleway, sans-serif; font-size: 13.86px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</span><br></p>', 'CASETHEMES', 'uploads/admin/blog/16402094601.png', 'blog', 0, 1, '2021-12-21 02:31:27', '2022-02-10 17:42:26', '2022-02-10 17:42:26'),
(8, 'Test Blog', 'test-blog', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;<br></p>', 'test', 'uploads/admin/blog/1640206152.png', 'blog', 0, 1, '2021-12-22 05:49:12', '2021-12-22 20:51:26', '2021-12-22 20:51:26'),
(9, 'How stay calm from the first time.', 'how-stay-calm-from-the-first-time', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;<br></p>', 'CASETHEMES', 'uploads/admin/blog/1640206185.jpg', 'blog', 0, 1, '2021-12-22 05:49:45', '2021-12-22 20:51:30', '2021-12-22 20:51:30'),
(10, 'How stay calm from the first time.', 'how-stay-calm-from-the-first-time', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. ut labore et dolore&nbsp;<br></p>', 'CASETHEMES', 'uploads/admin/blog/1640206228.jpg', 'blog', 0, 1, '2021-12-22 05:50:28', '2021-12-22 20:51:34', '2021-12-22 20:51:34'),
(11, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'test', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', NULL, 'uploads/admin/blog/16657863791.png', NULL, NULL, 1, '2022-10-13 17:25:27', '2022-10-14 22:26:19', NULL),
(12, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'lorem-ipsum-dolor-sit-amt-adipisicg-elit-sed-do', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', NULL, 'uploads/admin/blog/1665786473.png', NULL, NULL, 1, '2022-10-14 17:27:53', '2022-10-14 22:27:53', NULL),
(13, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'lorem-ipsum-dolor-sit-amt-adipisicg-elit-sed-do', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', NULL, 'uploads/admin/blog/1665786497.png', NULL, NULL, 1, '2022-10-14 17:28:17', '2022-10-14 22:28:17', NULL),
(14, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'lorem-ipsum-dolor-sit-amt-adipisicg-elit-sed-do', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', NULL, 'uploads/admin/blog/1665786518.png', NULL, NULL, 1, '2022-10-14 17:28:38', '2022-10-14 22:28:38', NULL),
(15, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'lorem-ipsum-dolor-sit-amt-adipisicg-elit-sed-do', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', NULL, 'uploads/admin/blog/1665786560.png', NULL, NULL, 1, '2022-10-14 17:29:20', '2022-10-14 22:29:20', NULL),
(16, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'lorem-ipsum-dolor-sit-amt-adipisicg-elit-sed-do', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', NULL, 'uploads/admin/blog/1665786584.png', NULL, NULL, 1, '2022-10-14 17:29:44', '2022-10-14 22:29:44', NULL),
(17, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'lorem-ipsum-dolor-sit-amt-adipisicg-elit-sed-do', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', NULL, 'uploads/admin/blog/1665786607.png', NULL, NULL, 1, '2022-10-14 17:30:07', '2022-10-14 22:30:07', NULL);
INSERT INTO `blogs` (`id`, `title`, `slug`, `short_description`, `description`, `blogger_name`, `image_path`, `tag`, `view`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, 'Lorem Ipsum Dolor Sit Amt, Adipisicg Elit Sed Do', 'lorem-ipsum-dolor-sit-amt-adipisicg-elit-sed-do', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. sed do eiusmod citation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(0, 0, 0); font-size: 16px; line-height: 30px; font-family: Roboto; background-color: rgb(248, 248, 248);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quised nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla pariatur excepteur sint occaecat cupidatat non proident, sunt culpa qui oficia deserunt mollit anim id est laborum sed perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consecteture adipisci velit, sed quia non numquam eius mod tempora incidunt ut labore et dolor magnam aliquam quaerat voluptatem.</p>', NULL, 'uploads/admin/blog/1665786625.png', NULL, NULL, 1, '2022-10-14 17:30:25', '2022-10-14 22:30:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `blog_id`, `user_id`, `name`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'Kaden Farrell', 'xunufa@mailinator.com', 'Nulla officia ut odi', 'Expedita ea reprehensad', 1, '2022-10-17 19:45:04', '2022-10-18 22:01:04', NULL),
(2, 2, 1, 'Kaden Farrell', 'xunufa@mailinator.com', 'Nulla officia ut odi', 'Expedita ea reprehensad', 1, '2022-10-17 19:45:41', '2022-10-18 22:01:03', NULL),
(3, 2, 1, 'Kaden Farrell', 'xunufa@mailinator.com', 'Nulla officia ut odi', 'Expedita ea reprehensad', 1, '2022-10-17 19:46:21', '2022-10-18 22:01:01', NULL),
(4, 2, 1, 'Aria', 'test@test.com', 'test', 'asasd', 1, '2022-10-17 20:00:38', '2022-10-18 17:12:49', '2022-10-18 17:12:49');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `booking_num` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `book_fname` varchar(255) NOT NULL,
  `book_lname` varchar(255) NOT NULL,
  `book_email` varchar(255) NOT NULL,
  `book_phone` varchar(255) NOT NULL,
  `book_country` varchar(255) NOT NULL,
  `book_city` varchar(255) NOT NULL,
  `book_state` varchar(255) NOT NULL,
  `book_zip` int(11) NOT NULL,
  `book_addr` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `orientation` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `eye_color` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `hair` varchar(255) DEFAULT NULL,
  `additional_requirement` text DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `book_services`
--

CREATE TABLE `book_services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `package` varchar(255) DEFAULT NULL,
  `breed` int(11) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `last_groomed` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_services`
--

INSERT INTO `book_services` (`id`, `name`, `email`, `phone`, `address`, `package`, `breed`, `style`, `last_groomed`, `date`, `time`, `services`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Aria', 'test@test.com', '123-213-1231', 'test', 'asd', 22, 'asd', 'asd', '2022-08-09', '04:43:00', 1, '2022-08-15 23:41:35', '2022-08-15 23:41:35', NULL),
(2, 'Aria', 'HJGHJG@dasfsd.dsfa', '123-213-1231', 'test', 'asd', 2, 'asd', 'asd', '2022-01-01', '01:00:00', 1, '2022-08-16 00:02:47', '2022-08-16 00:02:47', NULL),
(3, 'Aria', 'test@test.com', '442-443-1321', 'test', 'asd', 2, 'asd', 'asd', '2022-01-01', '01:00:00', 1, '2022-08-16 00:04:27', '2022-08-16 00:04:27', NULL),
(4, 'Aria', 'test@test.com', '444-444-4444', 'sa', 'as', 1, '1', 'asd', '2022-01-01', '01:00:00', 1, '2022-08-16 01:21:49', '2022-08-16 01:21:49', NULL),
(5, 'Jack gill', 'jackgill560@gmail.com', '011-122-3335', 'test road 5254', 'test pacakge', 4, '2', 'best salon', '2022-08-03', '20:41:00', 1, '2022-08-16 13:39:30', '2022-08-16 13:39:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `slug`, `name`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'puppy', 'Greeting Cards', 'uploads/admin/category/16659945981.png', 1, '2022-08-04 20:51:44', '2022-10-17 08:16:38', NULL),
(2, 'reptile', 'Badges', 'uploads/admin/category/16659946291.png', 1, '2022-08-04 20:53:33', '2022-10-17 08:17:09', NULL),
(3, 'dog-bowls', 'Dog Bowls', 'uploads/admin/category/1665994397.png', 1, '2022-10-17 08:13:17', '2022-10-17 08:13:17', NULL),
(4, 'keyrings', 'Keyrings', 'uploads/admin/category/1665994658.png', 1, '2022-10-17 08:17:38', '2022-10-17 08:17:38', NULL),
(5, 'mousepads', 'Mousepads', 'uploads/admin/category/1665994682.png', 1, '2022-10-17 08:18:02', '2022-10-17 08:18:02', NULL),
(6, 'notebooks', 'Notebooks', 'uploads/admin/category/1665994704.png', 1, '2022-10-17 08:18:24', '2022-10-17 08:18:24', NULL),
(7, 'tape-measure', 'Tape Measure', 'uploads/admin/category/1665994733.png', 1, '2022-10-17 08:18:53', '2022-10-17 08:18:53', NULL),
(8, 'wall-prints', 'Wall Prints', 'uploads/admin/category/1665994761.png', 1, '2022-10-17 08:19:21', '2022-10-17 08:19:21', NULL),
(9, 'water-bottles', 'Water Bottles', 'uploads/admin/category/1665994792.png', 1, '2022-10-17 08:19:52', '2022-10-17 08:19:52', NULL),
(10, 'wine-labels', 'Wine Labels', 'uploads/admin/category/1665994812.png', 1, '2022-10-17 08:20:12', '2022-10-17 08:20:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button1link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button2link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button3link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button4link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Button5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `page_section` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `page_name`, `title`, `subtitle`, `description`, `description2`, `image_path`, `title1`, `text1`, `title2`, `text2`, `title3`, `text3`, `text4`, `image1`, `image2`, `image3`, `image4`, `image5`, `image6`, `video`, `button1`, `button1link`, `button2`, `button2link`, `button3`, `button3link`, `button4`, `button4link`, `Button5`, `created_at`, `updated_at`, `deleted_at`, `page_section`) VALUES
(4, 'About Us', 'About Us', 'Dolly Effect', '<p style=\"max-width: 525px;margin-right: 0px; margin-bottom: 30px; margin-left: 0px; font-family: Poppins, sans-serif; font-size: 16px; color: rgb(147, 145, 145); line-height: 30px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p><p style=\"margin-right: 0px;max-width: 525px; margin-bottom: 30px; margin-left: 0px; font-family: Poppins, sans-serif; font-size: 16px; color: rgb(147, 145, 145); line-height: 30px;\">Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida.</p>', '<p style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; font-family: Poppins, sans-serif; font-size: 16px; color: rgb(147, 145, 145); line-height: 30px;\">Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida.</p><p style=\"margin-right: 0px; margin-bottom: 30px; margin-left: 0px; font-family: Poppins, sans-serif; font-size: 16px; color: rgb(147, 145, 145); line-height: 30px;\">Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida.</p>', 'uploads/admin/CMS/16678500371.png', 'Your Lash Beautifier', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 15:19:42', NULL, 'Section 1'),
(5, 'Contact Us', 'Contact Details', 'Leave Your Message', '<span style=\"color: rgb(0, 0, 0); font-family: Poppins;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</span>', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 11:48:33', NULL, 'Heading'),
(14, 'About Us', 'HAPPY COUSTOMERS', '', NULL, NULL, NULL, 'SKILLED EMPLOYES', '<h3 style=\"margin: 30px 0px 0px; font-weight: 700; line-height: 34px; font-size: 48px; font-family: Poppins; color: rgb(255, 255, 255); text-align: center;\">30K+</h3>', 'PROJECT COMPLETED', '<h3 style=\"margin: 30px 0px 0px; font-weight: 700; line-height: 34px; font-size: 48px; font-family: Poppins; color: rgb(255, 255, 255); text-align: center;\">90K+</h3>', 'CHAMP TROPHY AWARDS', '<h3 style=\"margin: 30px 0px 0px; font-weight: 700; line-height: 34px; font-size: 48px; font-family: Poppins; color: rgb(255, 255, 255); text-align: center;\">27K+</h3>', '<h3 style=\"margin: 30px 0px 0px; font-weight: 700; line-height: 34px; font-size: 48px; font-family: Poppins; color: rgb(255, 255, 255); text-align: center;\">20K+</h3>', 'uploads/admin/CMS/16678505311.png', 'uploads/admin/CMS/16678505312.png', 'uploads/admin/CMS/16678505313.png', 'uploads/admin/CMS/16678505314.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 14:48:52', NULL, 'section 2'),
(15, 'About Us', 'Our Experts', NULL, '<span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px; text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</span>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 14:53:48', NULL, 'section 3'),
(16, 'Home Page', 'About Us', 'Dolly Effect', '<p style=\"margin-right: 0px; max-width: 525px; margin-bottom: 30px; margin-left: 0px; font-family: Poppins, sans-serif; font-size: 16px; color: rgb(147, 145, 145); line-height: 30px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p><p style=\"margin-right: 0px; margin-bottom: 30px;max-width: 525px; margin-left: 0px; font-family: Poppins, sans-serif; font-size: 16px; color: rgb(147, 145, 145); line-height: 30px;\">Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Quis ipsum suspendisse ultrices gravida.</p>', NULL, 'uploads/admin/CMS/16678500371.png', 'Your Lash Beautifier', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'READ MORE', 'javascript:void(0)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 15:19:12', NULL, 'Section 1'),
(17, 'Home Page', 'Our Services', '', '<span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px; text-align: center; background-color: rgb(250, 249, 247);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.</span>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 15:39:55', NULL, 'Section 2'),
(18, 'Home Page', 'Eyelashes Extensions!', 'The most volume to create a dramatic glamorous look', NULL, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', 'BOOK NOW', 'javascript:void(0)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 15:42:15', NULL, 'Section 3'),
(19, 'Home Page', 'Request Appointment', 'YOU MAY CONTACT US HERE:', NULL, NULL, '', '', NULL, '', '', '', '', NULL, 'uploads/admin/CMS/16678539771.png', '', '', '', '', NULL, '', NULL, 'javascript:void(0)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 15:46:17', NULL, 'Section 4'),
(20, 'Home Page', 'FOLLOW US ON INSTAGRAM', '@dolly.effect', NULL, NULL, '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-17 19:19:13', NULL, 'Section 5'),
(23, 'Service', 'How We Work', '', '<span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px; text-align: center; background-color: rgb(250, 249, 247);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.</span>', NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 16:10:07', NULL, 'Section 1'),
(24, 'Service', 'Select A Service', '', NULL, NULL, NULL, 'Select Your Master', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</p>', 'Make An Appointment', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</p>', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</p>', '', 'uploads/admin/CMS/16678546361.png', 'uploads/admin/CMS/16678546372.png', 'uploads/admin/CMS/16678546373.png', '', NULL, NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 16:18:15', NULL, 'Section 2'),
(45, 'Service', 'ALWAYS BEAUTIFUL EYES', '', NULL, NULL, NULL, 'NO MORE MAKEUP', '<span style=\"color: rgb(69, 67, 66); font-family: Poppins; text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed</span><br>', 'HYPOALLERGENIC', '<span style=\"color: rgb(69, 67, 66); font-family: Poppins; text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed</span><br>', 'YOU CAN SWIM IN THE SEA', '<span style=\"color: rgb(69, 67, 66); font-family: Poppins; text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed</span><br>', '<span style=\"color: rgb(69, 67, 66); font-family: Poppins; text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed</span><br>', 'uploads/admin/CMS/16678544371.png', 'uploads/admin/CMS/16678544382.png', 'uploads/admin/CMS/16678544383.png', 'uploads/admin/CMS/16678544384.png', NULL, NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-07 15:53:59', NULL, 'Section 3'),
(47, 'Terms & Condition', 'Terms & Condition', '', '<span style=\"color: rgb(133, 140, 168); font-family: Poppins, sans-serif; font-size: 16px; text-align: center;\">is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br>', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-24 17:22:04', NULL, 'Terms and condition'),
(50, 'About Us', 'ELLEN JORDAN', 'Top Lashmaker', '', NULL, 'uploads/admin/CMS/16678574101.png', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#', NULL, '#', '', '#', NULL, '#', NULL, '#', NULL, '2022-11-07 16:43:30', NULL, 'Expert 1'),
(51, 'About Us', 'ELLEN JORDAN', 'Top Lashmaker', '', NULL, 'uploads/admin/CMS/16678574251.png', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#', NULL, '#', '', '#', NULL, '#', NULL, '#', NULL, '2022-11-07 16:43:45', NULL, 'Expert 2'),
(52, 'About Us', 'ELLEN JORDAN', 'Top Lashmaker', '', NULL, 'uploads/admin/CMS/16678574341.png', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#', NULL, '#', '', '#', NULL, '#', NULL, '#', NULL, '2022-11-07 16:43:54', NULL, 'Expert 3');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `wikiDataId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rapid API GeoDB Cities'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `wikiDataId`) VALUES
(1, 'Afghanistan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q889'),
(2, 'Aland Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(3, 'Albania', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q222'),
(4, 'Algeria', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q262'),
(5, 'American Samoa', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(6, 'Andorra', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q228'),
(7, 'Angola', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q916'),
(8, 'Anguilla', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(9, 'Antarctica', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(10, 'Antigua And Barbuda', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q781'),
(11, 'Argentina', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q414'),
(12, 'Armenia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q399'),
(13, 'Aruba', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(14, 'Australia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q408'),
(15, 'Austria', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q40'),
(16, 'Azerbaijan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q227'),
(17, 'Bahamas The', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q778'),
(18, 'Bahrain', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q398'),
(19, 'Bangladesh', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q902'),
(20, 'Barbados', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q244'),
(21, 'Belarus', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q184'),
(22, 'Belgium', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q31'),
(23, 'Belize', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q242'),
(24, 'Benin', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q962'),
(25, 'Bermuda', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(26, 'Bhutan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q917'),
(27, 'Bolivia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q750'),
(28, 'Bosnia and Herzegovina', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q225'),
(29, 'Botswana', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q963'),
(30, 'Bouvet Island', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(31, 'Brazil', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q155'),
(32, 'British Indian Ocean Territory', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(33, 'Brunei', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q921'),
(34, 'Bulgaria', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q219'),
(35, 'Burkina Faso', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q965'),
(36, 'Burundi', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q967'),
(37, 'Cambodia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q424'),
(38, 'Cameroon', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1009'),
(39, 'Canada', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q16'),
(40, 'Cape Verde', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1011'),
(41, 'Cayman Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(42, 'Central African Republic', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q929'),
(43, 'Chad', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q657'),
(44, 'Chile', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q298'),
(45, 'China', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q148'),
(46, 'Christmas Island', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(47, 'Cocos (Keeling) Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(48, 'Colombia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q739'),
(49, 'Comoros', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q970'),
(50, 'Congo', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q971'),
(51, 'Democratic Republic of the Congo', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q974'),
(52, 'Cook Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q26988'),
(53, 'Costa Rica', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q800'),
(54, 'Cote D\'Ivoire (Ivory Coast)', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1008'),
(55, 'Croatia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q224'),
(56, 'Cuba', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q241'),
(57, 'Cyprus', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q229'),
(58, 'Czech Republic', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q213'),
(59, 'Denmark', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q35'),
(60, 'Djibouti', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q977'),
(61, 'Dominica', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q784'),
(62, 'Dominican Republic', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q786'),
(63, 'East Timor', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q574'),
(64, 'Ecuador', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q736'),
(65, 'Egypt', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q79'),
(66, 'El Salvador', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q792'),
(67, 'Equatorial Guinea', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q983'),
(68, 'Eritrea', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q986'),
(69, 'Estonia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q191'),
(70, 'Ethiopia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q115'),
(71, 'Falkland Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(72, 'Faroe Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(73, 'Fiji Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q712'),
(74, 'Finland', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q33'),
(75, 'France', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q142'),
(76, 'French Guiana', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(77, 'French Polynesia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(78, 'French Southern Territories', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(79, 'Gabon', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1000'),
(80, 'Gambia The', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1005'),
(81, 'Georgia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q230'),
(82, 'Germany', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q183'),
(83, 'Ghana', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q117'),
(84, 'Gibraltar', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(85, 'Greece', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q41'),
(86, 'Greenland', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(87, 'Grenada', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q769'),
(88, 'Guadeloupe', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(89, 'Guam', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(90, 'Guatemala', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q774'),
(91, 'Guernsey and Alderney', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(92, 'Guinea', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1006'),
(93, 'Guinea-Bissau', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1007'),
(94, 'Guyana', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q734'),
(95, 'Haiti', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q790'),
(96, 'Heard Island and McDonald Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(97, 'Honduras', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q783'),
(98, 'Hong Kong S.A.R.', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q8646'),
(99, 'Hungary', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q28'),
(100, 'Iceland', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q189'),
(101, 'India', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q668'),
(102, 'Indonesia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q252'),
(103, 'Iran', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q794'),
(104, 'Iraq', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q796'),
(105, 'Ireland', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q27'),
(106, 'Israel', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q801'),
(107, 'Italy', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q38'),
(108, 'Jamaica', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q766'),
(109, 'Japan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q17'),
(110, 'Jersey', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q785'),
(111, 'Jordan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q810'),
(112, 'Kazakhstan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q232'),
(113, 'Kenya', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q114'),
(114, 'Kiribati', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q710'),
(115, 'North Korea', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q423'),
(116, 'South Korea', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q884'),
(117, 'Kuwait', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q817'),
(118, 'Kyrgyzstan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q813'),
(119, 'Laos', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q819'),
(120, 'Latvia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q211'),
(121, 'Lebanon', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q822'),
(122, 'Lesotho', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1013'),
(123, 'Liberia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1014'),
(124, 'Libya', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1016'),
(125, 'Liechtenstein', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q347'),
(126, 'Lithuania', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q37'),
(127, 'Luxembourg', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q32'),
(128, 'Macau S.A.R.', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(129, 'Macedonia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q221'),
(130, 'Madagascar', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1019'),
(131, 'Malawi', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1020'),
(132, 'Malaysia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q833'),
(133, 'Maldives', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q826'),
(134, 'Mali', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q912'),
(135, 'Malta', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q233'),
(136, 'Man (Isle of)', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(137, 'Marshall Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q709'),
(138, 'Martinique', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(139, 'Mauritania', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1025'),
(140, 'Mauritius', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1027'),
(141, 'Mayotte', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(142, 'Mexico', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q96'),
(143, 'Micronesia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q702'),
(144, 'Moldova', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q217'),
(145, 'Monaco', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q235'),
(146, 'Mongolia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q711'),
(147, 'Montenegro', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q236'),
(148, 'Montserrat', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(149, 'Morocco', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1028'),
(150, 'Mozambique', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1029'),
(151, 'Myanmar', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q836'),
(152, 'Namibia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1030'),
(153, 'Nauru', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q697'),
(154, 'Nepal', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q837'),
(155, 'Bonaire, Sint Eustatius and Saba', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q27561'),
(156, 'Netherlands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q55'),
(157, 'New Caledonia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(158, 'New Zealand', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q664'),
(159, 'Nicaragua', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q811'),
(160, 'Niger', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1032'),
(161, 'Nigeria', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1033'),
(162, 'Niue', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q34020'),
(163, 'Norfolk Island', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(164, 'Northern Mariana Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(165, 'Norway', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q20'),
(166, 'Oman', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q842'),
(167, 'Pakistan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q843'),
(168, 'Palau', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q695'),
(169, 'Palestinian Territory Occupied', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(170, 'Panama', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q804'),
(171, 'Papua new Guinea', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q691'),
(172, 'Paraguay', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q733'),
(173, 'Peru', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q419'),
(174, 'Philippines', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q928'),
(175, 'Pitcairn Island', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(176, 'Poland', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q36'),
(177, 'Portugal', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q45'),
(178, 'Puerto Rico', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(179, 'Qatar', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q846'),
(180, 'Reunion', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(181, 'Romania', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q218'),
(182, 'Russia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q159'),
(183, 'Rwanda', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1037'),
(184, 'Saint Helena', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(185, 'Saint Kitts And Nevis', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q763'),
(186, 'Saint Lucia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q760'),
(187, 'Saint Pierre and Miquelon', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(188, 'Saint Vincent And The Grenadines', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q757'),
(189, 'Saint-Barthelemy', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(190, 'Saint-Martin (French part)', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(191, 'Samoa', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q683'),
(192, 'San Marino', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q238'),
(193, 'Sao Tome and Principe', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1039'),
(194, 'Saudi Arabia', '2018-07-20 11:11:03', '2021-09-26 04:09:09', NULL, 'Q851'),
(195, 'Senegal', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1041'),
(196, 'Serbia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q403'),
(197, 'Seychelles', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1042'),
(198, 'Sierra Leone', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1044'),
(199, 'Singapore', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q334'),
(200, 'Slovakia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q214'),
(201, 'Slovenia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q215'),
(202, 'Solomon Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q685'),
(203, 'Somalia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1045'),
(204, 'South Africa', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q258'),
(205, 'South Georgia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(206, 'South Sudan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q958'),
(207, 'Spain', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q29'),
(208, 'Sri Lanka', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q854'),
(209, 'Sudan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1049'),
(210, 'Suriname', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q730'),
(211, 'Svalbard And Jan Mayen Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(212, 'Swaziland', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1050'),
(213, 'Sweden', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q34'),
(214, 'Switzerland', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q39'),
(215, 'Syria', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q858'),
(216, 'Taiwan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q865'),
(217, 'Tajikistan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q863'),
(218, 'Tanzania', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q924'),
(219, 'Thailand', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q869'),
(220, 'Togo', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q945'),
(221, 'Tokelau', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(222, 'Tonga', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q678'),
(223, 'Trinidad And Tobago', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q754'),
(224, 'Tunisia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q948'),
(225, 'Turkey', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q43'),
(226, 'Turkmenistan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q874'),
(227, 'Turks And Caicos Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(228, 'Tuvalu', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q672'),
(229, 'Uganda', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q1036'),
(230, 'Ukraine', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q212'),
(231, 'United Arab Emirates', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q878'),
(232, 'United Kingdom', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q145'),
(233, 'United States', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q30'),
(234, 'United States Minor Outlying Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(235, 'Uruguay', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q77'),
(236, 'Uzbekistan', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q265'),
(237, 'Vanuatu', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q686'),
(238, 'Vatican City State (Holy See)', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q237'),
(239, 'Venezuela', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q717'),
(240, 'Vietnam', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q881'),
(241, 'Virgin Islands (British)', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(242, 'Virgin Islands (US)', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(243, 'Wallis And Futuna Islands', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(244, 'Western Sahara', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, NULL),
(245, 'Yemen', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q805'),
(246, 'Zambia', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q953'),
(247, 'Zimbabwe', '2018-07-20 11:11:03', '2021-08-01 05:37:27', NULL, 'Q954'),
(248, 'Kosovo', '2020-08-15 06:33:50', '2021-08-01 05:37:57', NULL, 'Q1246'),
(249, 'Curaçao', '2020-10-25 05:54:20', '2021-08-01 05:37:27', NULL, 'Q25279'),
(250, 'Sint Maarten (Dutch part)', '2020-12-05 03:03:39', '2021-08-01 05:37:27', NULL, 'Q26273');

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `answer` text CHARACTER SET utf8mb4 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'When would I be able to purchase a puppy?', '<p style=\"margin:0in;margin-bottom:.0001pt;line-height:25.5pt;mso-outline-level:\r\n3\"><span style=\"font-size:13.5pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#666666\">Current\r\npuppy availability is always a question, and at this time we are in puppy\r\nheaven! We have a few litters now and would love to learn a bit about our\r\npuppies new homes which is why we have a puppy application.<o:p></o:p></span></p>\r\n\r\n<p style=\"margin-top: 0in; line-height: 25.5pt;\"><span style=\"font-size:13.5pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\ncolor:#666666\">​If you\'re a veteran small breed dog owner, we don\'t\r\nwant to waste your time regaling things you already know; by the same token, if\r\nthis is your first puppy or first small breed dog, we want to make sure you\r\nleave prepared for what life with a puppy may bring.<o:p></o:p></span></p>', '2021-11-25 01:04:41', '2022-05-10 18:42:31', NULL),
(2, 'What do I need to do to get a puppy?', '<p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><font color=\"#666666\" face=\"Arial, sans-serif\"><span style=\"font-size: 18px;\">Great question! To purchase one of our cute puppies, you must do the following:</span></font></p><p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAAGWB6gOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFxEAABcRAcom8z8AAAg4SURBVEhLxZcJWFTXFYCnEAhbgIAgkppGllpbq4ilEtbEETUoMAjEYNQEIhWDmIaIS1LrF/ZBGBbzmbSJWkKS9msjLaugsqo1iSG2USHAsGiZVJZUZt+YOT3nvYdSwcC4fP2/ud97c++55933zrnnnsObjL+//03u9jaAtH91Cbi/PJ4RO4qKS1T29va/4AUEBJIAFIiKVdw4y8jIKPwU4f5OwZ278nhmZmZvqNRa9gEODk4xGu04/bHmafQGMODjmJEJ6Gnc7fR8cOx4nVpngNq6k3cVjCYtKnwOcep0Iyu4a9drDXjZnZ6+B8bxwXlCoY4ZmIRXbW0tyJVqoM+A/83Z7pnZ7+bmdom7n5ZHmcUgeB/Gdk0DLtYgV+lApVLDuojIFq77Ntk5OVKtnn0zYnvyDhk3xPLe734vVeOrG41GwG+/xc7OLgq7f0BjO9eGh5elp++VVtfUMLOxbzMN3II6dZxdSAN2vcSOTCIiIrLr7xcugG7cCJFRUaNc91TWR0SUkcYj777HmuBeOVJ6ZGVTS+t/xscNcHNMatywIVbs4uJixw3PmkeDgoM/HpRIQKPDL4Qra2s7B4mJ23o2btz4Zxz/CSs2A+aWloLMrOwxWo1Sowe1Vs8o1Ol0cKiwCHbv2Tvj68bm5ObJjPiZtThxwlWFwkPy+PhNY6fPnIH33/8AFnh6vsXJM1hzV968efOiUlJ3yWrr6tBc48zTiYKCQg0Ob2WlpvLWpycq9EqlEkZGRqDt7HkYlNyALy5+yUwmCgtFGltb2/91ijvx8vLulimU3BQAhVqH34BcDnBT5Y+hyCZWcnY4oiljXtj0Yjd5vRKVUYigVdbU1PyIkzGJJWjS5vLyck1RcfGQm5v7Aex7hB16cDw1Z86czwMCAqR4f5DtMpG4uDjLT/70lw+HhoaNBoMBqmpqDc4uLvu44dmzaNEifo+4lzGGFnevXq+HhMRX2nDItC1iYWHhmyvM05EiMoQSI2FGZrYyJSXlnIuL825ObFZY8/mrxOQStCLGRdRqkEqlkH+owGBrbZ3LyX0vjkuX+lRd7egEA24VBQZGLYZ+oqX1LBw4+Dbseu31GfeaY3BwaGVn5zfMRLlKy+z8Ca7/SwLvHHkX+GFh1zj5abH6pb9/ZUdHBzOJVkJKevv6Yc3a5yQlJSW4jS5C7PMb+1D2x+yUqVgHBAZWD0q+ZZTQByb6UImv7/JWHLdBAyxxcnLagPf2zIxJWHHXx8PD11UVlxyG/v4BNDX7MmT+kJDQRhx/jBWbindISMhHO3fuxFPQ7MDq1WtP5OYKYd++/SDBiEgMDFyDoMCgJpR1ZadMQ2JiYv3goAQUCgV8ffkyiPuuQWvbeZDKZIyS/oEBWLZsGTmfIzvjLhw//gdmglKtZ66TrdLTIwY/vxX0OreC3l0R5h8a4+YBHY1ypZY5xLq6uyEwMKgeRR5nJWdg8eLFaRhCobGxEcS9fajMCPiD8xc+A0tLyzc5sVlhZmNj4+Pu7i6sqPgbszIFviYdqf3XJWWczOzx8PBwLSgsZBQRo6PfwZYtW//IDZvEI97eC9OLikpulH9Urtmy9SWy1HJ26P9A6NJQx/jNm2O2/Wp7ZV6ecPDo0aPqY8eOaQpFon+/nPBKk5eX1x4UW4pt1snYPYMR+cn6U02ZHZ3dgzK5gvvYtxkZHcXkuBQE0dEfe3p6zuemPTTsHRwcBEnJyc1VmLApVSpmEZRyTMQOjUYDJ0/WY7Tf1oNJQb6rq2s0ZqKUl1P8MGO0PGAs7ezt98fFPX/js8+/YPYsJYsajMsU6JUqDRMVWzE+12GKXl/fAKWlh0EgEHyD6cwbON+bVfNgoGAXteLppyuysnNHOzu7mAXRvqWkTIaBgE6eSfkyZjzfQgOWBBTzk7Yny+iUYlXdHxSd45b7+ZETj125ehUfyj5VjeaiQ4dMRgubDB3UlIZhfQW/+e1B2I2lya9fT7uvZPkxjFTRPj4+1ZiKSbu6upi0jKAvQgcXk6rhfwMO9PT04lF6Di5fvoIxZRRUeEbLZHL46tI/cFFFxkiB4ByaW8TpNgkn3LCC58LDKwsKRfKurm52FQhlq7SQiayVEPf2Qm6eUIsJeh3OfdPc3CJj3br1n6SlpTVlZGS0JCQkfOrh4bUXx5Yw2k3AFltsWNjqSvQR6cUv29EMbBJBFqJqa+KLEHQGCoX5Wr8VK+gcjMd251lIPke7i6mp7oQ6Ken6GRbQYbh9V6E5qKwg/7AxNzff8Oyz/CpM/qVvZ2bBjldTgMJ6e3s7Vg+TvBShhYhExeplvr5nraysKKenFzGJJxcuXJi6Zs3ar7OysnE71lFGjUpFEL/pxeH16yP7Sg6/c7Omrh7z/mLIzcmDhoZTMDZ26zRl6BGLqS5QY+5C5/HL2EwuvBgWLPC4grvjOyk62PdB1sEqD3eMhuthobiCRbs2NPQZWggVKXMYxfdKYFAwlJV9yKlngxg5JmUk5JyUbNKVGsY2Bto1lBvg7lJjmtNiYWFFPuLMarxP0D8ytyVtb6JKYBhLNCqIKMRTU2komLFxhFxlYgs3nDoNwSEhgzidEhSTfWQ2LMK2Z+VK/onk5OTzO3a8KsbyV3mmsRnkXBmoYspg/EpouxtDQ1BRUaHNyskpTU1NdWFVPDxoKz7zQnx884mKvzI1OEGmVGsN6Evsxh4eHoHTTc0VSUkpP2enPUTmzp1r6+zsnB4TE9uFh+C4VCozjmOBR00uVxirqquNmMRfx0z/oJ2d3f05sYn8EFvm/Pnz/8nn86X8Vauk7k88cQX7crA9RQIPFh7vvwSNNihRBJLSAAAAAElFTkSuQmCC\" style=\"width: 36px;\" data-filename=\"image.png\">&nbsp; &nbsp;<span style=\"font-size: 18px; color: rgb(102, 102, 102); font-family: Arial, sans-serif;\">Submit a Puppy Application</span></p><p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><font color=\"#666666\" face=\"Arial, sans-serif\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Due to the high volume of puppy applications we receive, please reach out to us after you complete the application!</span></font></p><p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><font color=\"#666666\" face=\"Arial, sans-serif\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Please Note: Your application does not need to be approved. We collect the information used in the application for</span></font></p><p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><font color=\"#666666\" face=\"Arial, sans-serif\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; documents that you\'ll sign later!</span></font></p><p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><img src=\"data:image/png;base64,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\" style=\"width: 36px;\" data-filename=\"image.png\">&nbsp; &nbsp;<span style=\"font-size: 18px; color: rgb(102, 102, 102); font-family: Arial, sans-serif;\">Submit a Financing Application (If you plan to pay with Financi</span><br></p><p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><img src=\"data:image/png;base64,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\" style=\"width: 36px;\" data-filename=\"image.png\">&nbsp; &nbsp;<span style=\"font-size: 18px; color: rgb(102, 102, 102); font-family: Arial, sans-serif;\">Pay a NON-REFUNDABLE deposit on our website for an available pu</span><br></p><p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><img src=\"data:image/png;base64,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\" style=\"width: 36px;\" data-filename=\"image.png\">&nbsp; &nbsp;<span style=\"font-size: 18px; color: rgb(102, 102, 102); font-family: Arial, sans-serif;\">Sign and Submit an Authorization Form</span><br></p><p class=\"MsoNormal\" style=\"line-height:25.5pt;mso-outline-level:3\"><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAAGWB6gOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFxEAABcRAcom8z8AAAg4SURBVEhLxZcJWFTXFYCnEAhbgIAgkppGllpbq4ilEtbEETUoMAjEYNQEIhWDmIaIS1LrF/ZBGBbzmbSJWkKS9msjLaugsqo1iSG2USHAsGiZVJZUZt+YOT3nvYdSwcC4fP2/ud97c++55933zrnnnsObjL+//03u9jaAtH91Cbi/PJ4RO4qKS1T29va/4AUEBJIAFIiKVdw4y8jIKPwU4f5OwZ278nhmZmZvqNRa9gEODk4xGu04/bHmafQGMODjmJEJ6Gnc7fR8cOx4nVpngNq6k3cVjCYtKnwOcep0Iyu4a9drDXjZnZ6+B8bxwXlCoY4ZmIRXbW0tyJVqoM+A/83Z7pnZ7+bmdom7n5ZHmcUgeB/Gdk0DLtYgV+lApVLDuojIFq77Ntk5OVKtnn0zYnvyDhk3xPLe734vVeOrG41GwG+/xc7OLgq7f0BjO9eGh5elp++VVtfUMLOxbzMN3II6dZxdSAN2vcSOTCIiIrLr7xcugG7cCJFRUaNc91TWR0SUkcYj777HmuBeOVJ6ZGVTS+t/xscNcHNMatywIVbs4uJixw3PmkeDgoM/HpRIQKPDL4Qra2s7B4mJ23o2btz4Zxz/CSs2A+aWloLMrOwxWo1Sowe1Vs8o1Ol0cKiwCHbv2Tvj68bm5ObJjPiZtThxwlWFwkPy+PhNY6fPnIH33/8AFnh6vsXJM1hzV968efOiUlJ3yWrr6tBc48zTiYKCQg0Ob2WlpvLWpycq9EqlEkZGRqDt7HkYlNyALy5+yUwmCgtFGltb2/91ijvx8vLulimU3BQAhVqH34BcDnBT5Y+hyCZWcnY4oiljXtj0Yjd5vRKVUYigVdbU1PyIkzGJJWjS5vLyck1RcfGQm5v7Aex7hB16cDw1Z86czwMCAqR4f5DtMpG4uDjLT/70lw+HhoaNBoMBqmpqDc4uLvu44dmzaNEifo+4lzGGFnevXq+HhMRX2nDItC1iYWHhmyvM05EiMoQSI2FGZrYyJSXlnIuL825ObFZY8/mrxOQStCLGRdRqkEqlkH+owGBrbZ3LyX0vjkuX+lRd7egEA24VBQZGLYZ+oqX1LBw4+Dbseu31GfeaY3BwaGVn5zfMRLlKy+z8Ca7/SwLvHHkX+GFh1zj5abH6pb9/ZUdHBzOJVkJKevv6Yc3a5yQlJSW4jS5C7PMb+1D2x+yUqVgHBAZWD0q+ZZTQByb6UImv7/JWHLdBAyxxcnLagPf2zIxJWHHXx8PD11UVlxyG/v4BNDX7MmT+kJDQRhx/jBWbindISMhHO3fuxFPQ7MDq1WtP5OYKYd++/SDBiEgMDFyDoMCgJpR1ZadMQ2JiYv3goAQUCgV8ffkyiPuuQWvbeZDKZIyS/oEBWLZsGTmfIzvjLhw//gdmglKtZ66TrdLTIwY/vxX0OreC3l0R5h8a4+YBHY1ypZY5xLq6uyEwMKgeRR5nJWdg8eLFaRhCobGxEcS9fajMCPiD8xc+A0tLyzc5sVlhZmNj4+Pu7i6sqPgbszIFviYdqf3XJWWczOzx8PBwLSgsZBQRo6PfwZYtW//IDZvEI97eC9OLikpulH9Urtmy9SWy1HJ26P9A6NJQx/jNm2O2/Wp7ZV6ecPDo0aPqY8eOaQpFon+/nPBKk5eX1x4UW4pt1snYPYMR+cn6U02ZHZ3dgzK5gvvYtxkZHcXkuBQE0dEfe3p6zuemPTTsHRwcBEnJyc1VmLApVSpmEZRyTMQOjUYDJ0/WY7Tf1oNJQb6rq2s0ZqKUl1P8MGO0PGAs7ezt98fFPX/js8+/YPYsJYsajMsU6JUqDRMVWzE+12GKXl/fAKWlh0EgEHyD6cwbON+bVfNgoGAXteLppyuysnNHOzu7mAXRvqWkTIaBgE6eSfkyZjzfQgOWBBTzk7Yny+iUYlXdHxSd45b7+ZETj125ehUfyj5VjeaiQ4dMRgubDB3UlIZhfQW/+e1B2I2lya9fT7uvZPkxjFTRPj4+1ZiKSbu6upi0jKAvQgcXk6rhfwMO9PT04lF6Di5fvoIxZRRUeEbLZHL46tI/cFFFxkiB4ByaW8TpNgkn3LCC58LDKwsKRfKurm52FQhlq7SQiayVEPf2Qm6eUIsJeh3OfdPc3CJj3br1n6SlpTVlZGS0JCQkfOrh4bUXx5Yw2k3AFltsWNjqSvQR6cUv29EMbBJBFqJqa+KLEHQGCoX5Wr8VK+gcjMd251lIPke7i6mp7oQ6Ken6GRbQYbh9V6E5qKwg/7AxNzff8Oyz/CpM/qVvZ2bBjldTgMJ6e3s7Vg+TvBShhYhExeplvr5nraysKKenFzGJJxcuXJi6Zs3ar7OysnE71lFGjUpFEL/pxeH16yP7Sg6/c7Omrh7z/mLIzcmDhoZTMDZ26zRl6BGLqS5QY+5C5/HL2EwuvBgWLPC4grvjOyk62PdB1sEqD3eMhuthobiCRbs2NPQZWggVKXMYxfdKYFAwlJV9yKlngxg5JmUk5JyUbNKVGsY2Bto1lBvg7lJjmtNiYWFFPuLMarxP0D8ytyVtb6JKYBhLNCqIKMRTU2komLFxhFxlYgs3nDoNwSEhgzidEhSTfWQ2LMK2Z+VK/onk5OTzO3a8KsbyV3mmsRnkXBmoYspg/EpouxtDQ1BRUaHNyskpTU1NdWFVPDxoKz7zQnx884mKvzI1OEGmVGsN6Evsxh4eHoHTTc0VSUkpP2enPUTmzp1r6+zsnB4TE9uFh+C4VCozjmOBR00uVxirqquNmMRfx0z/oJ2d3f05sYn8EFvm/Pnz/8nn86X8Vauk7k88cQX7crA9RQIPFh7vvwSNNihRBJLSAAAAAElFTkSuQmCC\" style=\"width: 36px;\" data-filename=\"image.png\">&nbsp; &nbsp;<span style=\"font-size: 18px; color: rgb(102, 102, 102); font-family: Arial, sans-serif;\">Schedule your Puppy Pick-Up Appointment or Schedule for meeting - Don\'t forget a face mask, gloves, and your own ink pen!</span><br></p><div><br></div>', '2021-12-21 18:51:06', '2022-05-23 18:22:08', NULL),
(3, 'Are the puppies kept in crates?', '<p style=\"margin: 0in 0in 0.0001pt; line-height: 25.5pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:13.5pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\ncolor:#666666\">The puppies are family too! All the puppies are either outside\r\nin the fenced in yard, playing in a puppy playpen or in their baby cribs\r\nnapping. There are numerous water bowls and lots of toys!! Every one of the\r\npuppies are friendly and ready...</span></p>', '2022-05-10 18:11:24', '2022-05-23 18:02:28', NULL),
(4, 'Are the puppies healthy?', '<p style=\"margin:0in;margin-bottom:.0001pt;line-height:25.5pt;mso-outline-level:\r\n3\"><span style=\"font-size:13.5pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#666666\">We\r\ndo want you to know that all of our puppies come from Licensed 4 and 5 star\r\nbreeders and local Hobby breeders, visited, and hand-selected through a\r\nrigorous process from us. After we choose a puppy,<o:p></o:p></span></p>\r\n\r\n<p style=\"margin-top: 0in; line-height: 25.5pt;\"><span style=\"font-size:13.5pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\ncolor:#666666\">We do want you to know that all of our puppies come\r\nfrom Licensed 4 and 5 star breeders and local Hobby breeders, visited, and\r\nhand-selected through a rigorous process from us. After we choose a puppy,<o:p></o:p></span></p>', '2022-05-10 18:11:45', '2022-05-23 18:06:59', '2022-05-23 18:06:59'),
(5, 'Are the puppies healthy?', '<p><span style=\"color: rgb(102, 102, 102); font-family: Arial, &quot;sans-serif&quot;; font-size: 18px;\">We do want you to know that all of our puppies come from Licensed 4 and 5 star breeders and local Hobby breeders, visited, and hand-section through a rigorous process from us. After we choose a puppy</span><br></p>', '2022-05-23 18:07:35', '2022-05-23 18:09:58', NULL),
(6, 'when will the puppy arrive', '<p>as soon you order it<br></p>', '2022-06-07 21:43:22', '2022-06-07 21:47:25', '2022-06-07 21:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image`, `link`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'uploads/admin/gallery/1667860125.png', 'https://www.instagram.com/?hl=en', 1, '2022-05-11 18:01:27', '2022-11-07 22:28:45', NULL),
(2, 'uploads/admin/gallery/1667860133.png', 'https://www.instagram.com/?hl=en', 1, '2022-05-11 18:07:28', '2022-11-07 22:28:53', NULL),
(3, 'uploads/admin/gallery/1667860143.png', 'https://www.instagram.com/?hl=en', 1, '2022-05-11 18:07:38', '2022-11-07 22:29:03', NULL),
(4, 'uploads/admin/gallery/1667860151.png', 'https://www.instagram.com/?hl=en', 1, '2022-05-11 18:10:33', '2022-11-07 22:29:11', NULL),
(5, 'uploads/admin/gallery/1667860160.png', 'https://www.instagram.com/?hl=en', 1, '2022-05-11 18:10:43', '2022-11-07 22:29:20', NULL),
(6, 'uploads/admin/galley/1652292653.jpg', 'https://www.instagram.com/?hl=en', 1, '2022-05-11 18:10:53', '2022-11-07 22:29:36', '2022-11-07 22:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `giftcard`
--

CREATE TABLE `giftcard` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image1` text NOT NULL,
  `link` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `giftcard`
--

INSERT INTO `giftcard` (`id`, `slug`, `title`, `price`, `image1`, `link`, `status`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, NULL, 'GIFT CARD NAME', 250, 'uploads/admin/giftcard/1667610116.jpg', 'text', 1, '2022-10-18 19:54:21', NULL, '2022-11-05 01:01:56'),
(2, NULL, 'GIFT CARD NAME', 250, 'uploads/admin/giftcard/1667610102.jpg', 'text', 1, '2022-10-25 20:04:48', NULL, '2022-11-05 01:01:42'),
(3, NULL, 'GIFT CARD NAME', 250, 'uploads/admin/giftcard/1667610085.jpg', 'text', 1, '2022-11-05 01:01:25', NULL, '2022-11-05 01:01:25'),
(4, NULL, 'GIFT CARD NAME', 250, 'uploads/admin/giftcard/1667610085.jpg', 'text', 1, '2022-11-05 01:01:25', NULL, '2022-11-05 01:01:25'),
(5, NULL, 'GIFT CARD NAME', 250, 'uploads/admin/giftcard/1667610085.jpg', 'text', 1, '2022-11-05 01:01:25', NULL, '2022-11-05 01:01:25'),
(6, NULL, 'GIFT CARD NAME', 250, 'uploads/admin/giftcard/1667610085.jpg', 'text', 1, '2022-11-05 01:01:25', NULL, '2022-11-05 01:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `imagetable`
--

CREATE TABLE `imagetable` (
  `id` int(11) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `img_path` text DEFAULT NULL,
  `img_href` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ref_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT 1,
  `is_active_img` varchar(1) DEFAULT '1',
  `additional_attributes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagetable`
--

INSERT INTO `imagetable` (`id`, `table_name`, `img_path`, `img_href`, `created_at`, `updated_at`, `ref_id`, `type`, `is_active_img`, `additional_attributes`) VALUES
(2, 'logo', 'uploads/imagetable/1667864196.png', NULL, '2022-11-07 23:36:36', '2022-11-07 18:36:36', NULL, 1, '1', NULL),
(3, 'favicon', 'uploads/imagetable/1667599806.png', NULL, '2022-11-04 22:10:06', '2022-11-04 17:10:06', NULL, 1, '1', NULL),
(4, 'logo2', 'uploads/imagetable/1667864190.png', NULL, '2022-11-07 23:36:30', '2022-11-07 18:36:30', NULL, 1, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `name`, `subject`, `email`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Virginia Knox', 'Facere quis optio c', 'kemi@mailinator.com', 'Aliqua Ducimus sun', '2022-11-04 17:39:37', '2022-11-04 22:39:37', NULL),
(2, 'Virginia Knox', 'Facere quis optio c', 'kemi@mailinator.com', 'Aliqua Ducimus sun', '2022-11-04 17:40:32', '2022-11-04 22:40:32', NULL),
(3, 'Flavia Wright', 'Earum temporibus cum', 'zalig@mailinator.com', 'Id exercitation per', '2022-11-07 12:53:32', '2022-11-07 17:53:32', NULL),
(4, 'Flavia Wright', 'Earum temporibus cum', 'zalig@mailinator.com', 'Id exercitation per', '2022-11-07 12:53:32', '2022-11-07 17:53:32', NULL),
(5, 'Flavia Wright', 'Earum temporibus cum', 'zalig@mailinator.com', 'Id exercitation per', '2022-11-07 12:53:42', '2022-11-07 17:53:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MASSAGE NAME', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore', 'uploads/admin/message/16468759711.png', 1, '2022-03-09 09:25:28', '2022-03-09 10:32:51', NULL);

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
  `flag_value` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `flag_additionalText` text DEFAULT NULL,
  `has_image` varchar(1) DEFAULT '0',
  `is_active` varchar(1) DEFAULT '1',
  `is_config` varchar(1) DEFAULT '0',
  `flag_show_text` text DEFAULT NULL,
  `is_featured` int(11) DEFAULT 0,
  `is_deleted` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m_flag`
--

INSERT INTO `m_flag` (`id`, `flag_type`, `flag_value`, `created_at`, `updated_at`, `flag_additionalText`, `has_image`, `is_active`, `is_config`, `flag_show_text`, `is_featured`, `is_deleted`, `user_id`) VALUES
(59, 'Phone', '706-373-8261', '2022-11-04 22:08:43', '2022-11-04 17:08:43', '706-373-8261', '0', '1', '1', 'Phone', 0, 0, 0),
(60, 'COMPANYURL', 'Free Shipping', '2022-03-10 10:00:34', '0000-00-00 00:00:00', 'Free Shipping', '0', '1', '0', 'Shipping', 0, 0, 0),
(218, 'Email', 'Dreamskinx@yahoo.com', '2022-11-04 22:08:43', '2022-11-04 17:08:43', 'Dreamskinx@yahoo.com', '0', '1', '1', 'Email', 0, 0, 0),
(499, 'copyright', 'All Rights Reserved Lorem Ipsum 2022', '2022-11-04 22:08:43', '2022-11-04 17:08:43', 'All Rights Reserved Lorem Ipsum 2022', '0', '1', '1', 'Copyright', 0, 0, 0),
(519, 'ADDRESS', '246 Robert C Daniel Jr Pkwy #1271', '2022-11-04 22:08:43', '2022-11-04 17:08:43', '246 Robert C Daniel Jr Pkwy #1271', '0', '1', '1', 'Address', 0, 0, 0),
(682, 'FACEBOOK', 'https://www.facebook.com/demo', '2021-09-26 10:31:30', '2021-09-26 14:31:30', 'https://www.facebook.com/demo', '0', '1', '1', 'Facebook', 0, 0, 0),
(1960, 'TWITTER', 'https://twitter.com/demo', '2022-09-12 23:34:52', '2021-09-26 14:31:30', 'https://twitter.com/demo', '0', '1', '1', 'Twitter', 0, 0, 0),
(1961, 'Pinterest', 'https://www.pinterest.com/', '2022-11-07 16:36:23', '2022-03-01 08:47:58', 'https://www.pinterest.com/', '0', '0', '0', 'Pinterest', 0, 0, 0),
(1962, 'INSTAGRAM', 'https://www.instagram.com/demo', '2022-03-01 13:43:43', '2021-09-26 14:31:30', 'https://www.instagram.com/demo', '0', '1', '1', 'Instagram', 0, 0, 0),
(1963, 'LinkedIn', 'https://www.linkedin.com/company/demo', '2022-11-07 16:36:28', '0000-00-00 00:00:00', 'https://www.linkedin.com/company/demo', '0', '1', '1', 'Linkedin', 0, 0, 0),
(1964, 'Youtube', 'https://www.youtube.com', '2022-10-11 00:27:31', '0000-00-00 00:00:00', 'https://www.youtube.com', '0', '0', '0', 'Youtube', 0, 0, 0),
(1965, 'Whatsapp', '+123 - 456789', '2022-03-10 09:59:13', '0000-00-00 00:00:00', '+123 - 456789', '0', '1', '0', 'Whatsapp Number', 0, 0, 0),
(1966, 'GOOGLEMAP', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26359630.09737905!2d-113.7240346513082!3d36.2460939887435!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2sUnited%20States!5e0!3m2!1sen!2s!4v1663942700505!5m2!1sen!2s', '2022-10-24 20:49:34', '2022-10-24 15:49:34', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26359630.09737905!2d-113.7240346513082!3d36.2460939887435!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2sUnited%20States!5e0!3m2!1sen!2s!4v1663942700505!5m2!1sen!2s', '0', '1', '1', 'GOOGLE MAP', 0, 0, 0),
(1967, 'Topbar', '*PUPPIES FOR SALE*', '2022-10-11 00:28:39', '2022-05-10 04:05:25', '*PUPPIES FOR SALE*', '0', '0', '0', 'Top Bar', 0, 0, 0),
(1968, 'FOOTER', 'Rib Ticklers is your one stop shop to purchase the most hilarious products for yourself and your loved ones at an affordable price.', '2022-10-22 00:31:02', '2022-10-21 19:31:02', 'Rib Ticklers is your one stop shop to purchase the most hilarious products for yourself and your loved ones at an affordable price.', '0', '1', '1', 'Footer', 0, 0, 0),
(1970, 'Gmail', 'https://accounts.google.com/ServiceLogin/signinchooser?flowName=GlifWebSignIn&flowEntry=ServiceLogin', '2022-05-10 09:04:32', '2022-03-10 05:07:16', 'https://accounts.google.com/ServiceLogin/signinchooser?flowName=GlifWebSignIn&flowEntry=ServiceLogin', '0', '0', '0', 'Gmail', 0, 0, 0),
(1971, 'Google', 'https://accounts.google.com/ServiceLogin/signinchooser?flowName=GlifWebSignIn&flowEntry=ServiceLogin', '2022-03-10 10:02:22', '2022-03-10 05:02:22', 'https://accounts.google.com/ServiceLogin/signinchooser?flowName=GlifWebSignIn&flowEntry=ServiceLogin', '0', '1', '0', 'www.gmail.com', 0, 0, 0),
(1972, 'HOURS', '<h3><br></h3>', '2022-11-04 22:08:43', '2022-11-04 17:08:43', '<h3><br></h3>', '0', '1', '1', 'OFFICE HOURS', 0, 0, 0),
(1973, 'Meeting', '15 Minute Meeting', '2022-10-11 00:30:57', '2022-06-03 06:33:28', '15 Minute Meeting', '0', '0', '0', 'Meeting Time', 0, 0, 0),
(1974, 'Time', '15 min', '2022-10-11 00:30:52', '2022-06-10 06:35:12', '15 min', '0', '0', '0', 'Time', 0, 0, 0),
(1975, 'Globle', 'USA, Maldives Time', '2022-10-11 00:30:24', '2022-06-10 01:40:26', 'USA, Maldives Time', '0', '0', '0', 'Globle Time', 0, 0, 0),
(1976, 'Phone2', '866-33PUPPY', '2022-10-11 00:30:06', '2022-06-20 12:33:41', '866-33PUPPY', '0', '0', '0', 'Contact', 0, 0, 0),
(1977, 'Tiktok', 'https://www.tiktok.com/@dannysfamilypets', '2022-10-11 00:29:43', '0000-00-00 00:00:00', 'https://www.tiktok.com/@dannysfamilypets', '0', '0', '0', 'https://www.tiktok.com/@dannysfamilypets', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `title` varchar(11) NOT NULL,
  `description` text NOT NULL,
  `package_detail` text DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `title`, `description`, `package_detail`, `total_price`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'asdasd', 'asdasd', '<h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Bronze</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">65</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning Monthl</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Silver</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning And One Air Brush Tan Monthly</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Gold</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning, One Airbrush Tan, And One Custom Beauty Suites Facial</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Beauty Plus</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">One Custom Beauty Suites Facial Per Month</font></p>', 213, 1, '2022-02-10 09:00:00', '2022-03-09 10:13:44', '2022-03-10 01:13:44'),
(3, 'test', 'test', '<h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Bronze</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">65</font></span></h4><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; line-height: 29px; font-size: 18px; font-family: helvetica; color: rgb(255, 255, 255); display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><p style=\"color: rgb(0, 0, 0); font-weight: 400; text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Unlimited UV Tanning Monthl</font></p></h4><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Silver</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; line-height: 29px; font-size: 18px; font-family: helvetica; color: rgb(255, 255, 255); display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><p style=\"color: rgb(0, 0, 0); font-weight: 400; text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Unlimited UV Tanning And One Air Brush Tan Monthly</font></p></h4><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Gold</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; line-height: 29px; font-size: 18px; font-family: helvetica; color: rgb(255, 255, 255); display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><p style=\"color: rgb(0, 0, 0); font-weight: 400; text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Unlimited UV Tanning, One Airbrush Tan, And One Custom Beauty Suites Facial</font></p></h4><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Beauty Plus</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; line-height: 29px; font-size: 18px; font-family: helvetica; color: rgb(255, 255, 255); display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><p style=\"color: rgb(0, 0, 0); font-weight: 400; text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">One Custom Beauty Suites Facial Per Month</font></p></h4>', 800, 1, '2022-02-10 09:00:00', '2022-02-10 09:00:00', NULL),
(4, 'asdasd', 'asda', '<h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Bronze</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">65</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning Monthl</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Silver</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning And One Air Brush Tan Monthly</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Gold</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning, One Airbrush Tan, And One Custom Beauty Suites Facial</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Beauty Plus</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">One Custom Beauty Suites Facial Per Month</font></p>', 2, 1, '2022-02-10 09:00:00', '2022-02-10 09:00:00', NULL),
(5, 'asd', 'asdasd', '<h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Bronze</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">65</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning Monthl</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Silver</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning And One Air Brush Tan Monthly</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Gold</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning, One Airbrush Tan, And One Custom Beauty Suites Facial</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Beauty Plus</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">One Custom Beauty Suites Facial Per Month</font></p><p></p>', 234, 1, '2022-02-10 09:00:00', '2022-02-10 09:00:00', NULL),
(6, 'asd', 'asdasd', '<h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Bronze</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">65</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning Monthl</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Silver</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning And One Air Brush Tan Monthly</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Gold</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">Unlimited UV Tanning, One Airbrush Tan, And One Custom Beauty Suites Facial</font></p><h4 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: helvetica; font-weight: 600; line-height: 29px; font-size: 18px; text-transform: capitalize; display: flex; align-items: center; justify-content: space-between; padding-left: 30px; position: relative; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">Beauty Plus</font><span style=\"font-size: 20px; font-weight: 500; transition: all 0.5s ease-in-out 0s;\"><font color=\"#000000\">100</font></span></h4><p style=\"color: rgb(0, 0, 0); text-transform: capitalize; font-size: 16px; line-height: 25px; padding-left: 30px; padding-right: 50px; transition: all 0.5s ease-in-out 0s; font-family: helvetica;\"><font color=\"#000000\">One Custom Beauty Suites Facial Per Month</font></p><p></p>', 234, 1, '2022-02-10 09:00:00', '2022-02-10 09:00:00', NULL),
(7, 'Basic', 'Membership (A 20% when auto billed yearly)', NULL, 12, 1, '2022-03-09 10:07:57', '2022-03-09 10:13:37', NULL);

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
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `schedule`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '11am - 8:30pm', 1, '2022-06-10 05:08:45', '2022-06-10 10:16:50', NULL),
(2, '12pm - 5pm', 1, '2022-06-10 05:09:38', '2022-06-10 05:17:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `long_description` text NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `slug`, `title`, `short_description`, `long_description`, `image1`, `image2`, `status`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Natural', 'Natural', '<span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px;\">Very natual look, less lashes are being applied</span>', '<div class=\"col-lg-3\" style=\"flex-basis: auto; width: 330px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg2\" style=\"margin-bottom: 24.4688px; font-size: 16px; color: rgb(147, 145, 145);\">New set</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">1 week refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">2 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">3 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">4 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">New Client\'s Touch-up service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Lash span</li></ul></div><div class=\"col-lg-9\" style=\"flex-basis: auto; width: 990px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg\" style=\"line-height: 30px; font-size: 16px; color: rgb(147, 145, 145);\">New / Existing clients with no, with lashes remaining below our miniumum requirement for refill service, the previous appointment passed our 28th 4 weeks refill service period</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 7th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 14th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 21st day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 28th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who have existing lashes from another studio, must have at least 50% remaining upon their arrival</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service are for new/existing clients with lashes that needs to be removed</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who need to have their lashes deep clean</li></ul></div>', 'uploads/admin/service/16679254241.png', 'uploads/admin/service/16679254241.jpg', 1, 1, '2022-03-03 04:43:26', '2022-11-08 17:42:58', NULL),
(2, 'Mixed', 'Mixed', '<p><span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px;\">Very natual look, less lashes are being applied</span><br></p>', '<div class=\"col-lg-3\" style=\"width: 330px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg2\" style=\"margin-bottom: 24.4688px; font-size: 16px; color: rgb(147, 145, 145);\">New set</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">1 week refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">2 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">3 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">4 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">New Client\'s Touch-up service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Lash span</li></ul></div><div class=\"col-lg-9\" style=\"width: 990px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg\" style=\"line-height: 30px; font-size: 16px; color: rgb(147, 145, 145);\">New / Existing clients with no, with lashes remaining below our miniumum requirement for refill service, the previous appointment passed our 28th 4 weeks refill service period</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 7th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 14th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 21st day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 28th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who have existing lashes from another studio, must have at least 50% remaining upon their arrival</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service are for new/existing clients with lashes that needs to be removed</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who need to have their lashes deep clean</li></ul></div>', 'uploads/admin/service/16679272941.png', 'uploads/admin/service/16679272951.jpg', 1, 1, '2022-03-03 04:43:26', '2022-11-08 17:43:02', NULL),
(3, 'Volume', 'Volume', '<span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px;\">Very natual look, less lashes are being applied</span>', '<div class=\"col-lg-3\" style=\"width: 330px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg2\" style=\"margin-bottom: 24.4688px; font-size: 16px; color: rgb(147, 145, 145);\">New set</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">1 week refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">2 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">3 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">4 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">New Client\'s Touch-up service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Lash span</li></ul></div><div class=\"col-lg-9\" style=\"width: 990px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg\" style=\"line-height: 30px; font-size: 16px; color: rgb(147, 145, 145);\">New / Existing clients with no, with lashes remaining below our miniumum requirement for refill service, the previous appointment passed our 28th 4 weeks refill service period</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 7th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 14th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 21st day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 28th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who have existing lashes from another studio, must have at least 50% remaining upon their arrival</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service are for new/existing clients with lashes that needs to be removed</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who need to have their lashes deep clean</li></ul></div>', 'uploads/admin/service/16679273451.png', 'uploads/admin/service/16679273451.jpg', 1, 1, '2022-03-03 04:43:26', '2022-11-08 17:43:05', NULL),
(4, 'Enhanced Volume', 'Enhanced Volume', '<span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px;\">Very natual look, less lashes are being applied</span>', '<div class=\"col-lg-3\" style=\"width: 330px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg2\" style=\"margin-bottom: 24.4688px; font-size: 16px; color: rgb(147, 145, 145);\">New set</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">1 week refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">2 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">3 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">4 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">New Client\'s Touch-up service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Lash span</li></ul></div><div class=\"col-lg-9\" style=\"width: 990px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg\" style=\"line-height: 30px; font-size: 16px; color: rgb(147, 145, 145);\">New / Existing clients with no, with lashes remaining below our miniumum requirement for refill service, the previous appointment passed our 28th 4 weeks refill service period</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 7th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 14th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 21st day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 28th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who have existing lashes from another studio, must have at least 50% remaining upon their arrival</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service are for new/existing clients with lashes that needs to be removed</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who need to have their lashes deep clean</li></ul></div>', 'uploads/admin/service/16679274151.png', 'uploads/admin/service/16679274161.jpg', 1, 1, '2022-03-03 04:43:26', '2022-11-08 17:43:12', NULL),
(5, 'Other Services', 'Other Services', '<span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px;\">Very natual look, less lashes are being applied</span>', '<div class=\"col-lg-3\" style=\"width: 330px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg2\" style=\"margin-bottom: 24.4688px; font-size: 16px; color: rgb(147, 145, 145);\">New set</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">1 week refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">2 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">3 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">4 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">New Client\'s Touch-up service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Lash span</li></ul></div><div class=\"col-lg-9\" style=\"width: 990px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg\" style=\"line-height: 30px; font-size: 16px; color: rgb(147, 145, 145);\">New / Existing clients with no, with lashes remaining below our miniumum requirement for refill service, the previous appointment passed our 28th 4 weeks refill service period</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 7th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 14th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 21st day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 28th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who have existing lashes from another studio, must have at least 50% remaining upon their arrival</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service are for new/existing clients with lashes that needs to be removed</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who need to have their lashes deep clean</li></ul></div>', 'uploads/admin/service/16679275271.png', 'uploads/admin/service/16679274531.jpg', 1, 1, '2022-03-03 04:43:26', '2022-11-08 17:43:15', NULL),
(17, 'Your Services Here', 'Your Services Here', '<p><span style=\"color: rgb(147, 145, 145); font-family: Poppins, sans-serif; font-size: 16px;\">Very natual look, less lashes are being applied</span><br></p>', '<div class=\"col-lg-3\" style=\"width: 330px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg2\" style=\"margin-bottom: 24.4688px; font-size: 16px; color: rgb(147, 145, 145);\">New set</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">1 week refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">2 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">3 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">4 weeks refill</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">New Client\'s Touch-up service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Lash span</li></ul></div><div class=\"col-lg-9\" style=\"width: 990px; padding-right: calc(var(--bs-gutter-x) / 2); padding-left: calc(var(--bs-gutter-x) / 2); flex-basis: auto; max-width: 100%; margin-top: var(--bs-gutter-y); color: rgb(57, 57, 57); font-family: Poppins, sans-serif; font-size: 15px;\"><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; list-style-type: none; line-height: 40px;\"><li class=\"chg\" style=\"line-height: 30px; font-size: 16px; color: rgb(147, 145, 145);\">New / Existing clients with no, with lashes remaining below our miniumum requirement for refill service, the previous appointment passed our 28th 4 weeks refill service period</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 7th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 14th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 21st day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">on or before the 28th day since last visit</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who have existing lashes from another studio, must have at least 50% remaining upon their arrival</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">Removal service are for new/existing clients with lashes that needs to be removed</li><li style=\"font-size: 16px; color: rgb(147, 145, 145);\">For clients who need to have their lashes deep clean</li></ul></div>', 'uploads/admin/service/1667927555.png', 'uploads/admin/service/1667927555.jpg', 1, 1, '2022-11-08 12:12:35', '2022-11-08 17:44:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'S-chest-25-34cm', '2022-06-14 17:56:11', '2022-06-14 17:56:53', NULL),
(2, 'M-chest-34-40cm', '2022-06-14 17:57:08', '2022-06-14 17:57:08', NULL),
(3, 'L-chest-40-46cm', '2022-06-14 17:57:17', '2022-06-14 17:57:17', NULL),
(4, 'XS', '2022-06-14 17:57:57', '2022-06-14 17:57:57', NULL),
(5, 'S', '2022-06-14 17:58:14', '2022-06-14 17:58:14', NULL),
(6, 'M', '2022-06-14 17:58:24', '2022-06-14 17:58:24', NULL),
(7, 'L', '2022-06-14 17:58:31', '2022-06-14 17:58:31', NULL),
(8, 'XL', '2022-06-14 17:58:40', '2022-06-14 17:58:40', NULL),
(9, 'XXL', '2022-06-14 17:58:48', '2022-06-14 17:58:48', NULL),
(10, 'XXS', '2022-06-14 17:59:01', '2022-06-14 17:59:01', NULL),
(11, 'Small', '2022-06-14 18:00:32', '2022-06-14 18:00:32', NULL),
(12, 'Medium', '2022-06-14 18:00:49', '2022-06-14 18:00:49', NULL),
(13, 'Large', '2022-06-15 23:50:44', '2022-06-15 23:50:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `slider_image` text NOT NULL,
  `button` varchar(255) DEFAULT 'Shop Now',
  `button_link` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `title`, `description`, `slider_image`, `button`, `button_link`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'RibTickLerz', '<h5 class=\"themes-h5\">Get Up to 30% Off</h5>\n<p>Hurry up and enjoy up to 30% off on all your favorite products.  </p>', 'uploads/admin/slider/1666047127.png', 'Shop Now', NULL, 1, '2022-03-02 05:27:29', '2022-10-17 23:21:33', NULL),
(2, 'RibTickLerz', '<h5 class=\"themes-h5\">Get Up to 30% Off</h5>\n<p>Hurry up and enjoy up to 30% off on all your favorite products.  </p>', 'uploads/admin/slider/1666047875.png', 'Shop Now', NULL, 1, '2022-03-10 07:06:47', '2022-10-17 23:21:35', NULL),
(3, 'RibTickLerz', '<h5 class=\"themes-h5\">Get Up to 30% Off</h5>\n<p>Hurry up and enjoy up to 30% off on all your favorite products.  </p>', 'uploads/admin/slider/1666047891.png', 'Shop Now', NULL, 1, '2022-05-11 03:22:46', '2022-10-17 23:21:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Style 1', 1, '2022-08-16 00:46:50', '2022-08-16 00:46:50', NULL),
(2, 'Style 2', 1, '2022-08-16 00:46:59', '2022-08-16 00:46:59', NULL),
(3, 'Style 3', 1, '2022-08-16 00:47:08', '2022-08-16 00:47:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test@test.com', '2022-10-10 18:18:46', '2022-10-10 18:33:29', '2022-10-10 23:33:29'),
(2, 'Test@test2.com', '2022-10-10 18:19:13', '2022-10-10 18:33:42', '2022-10-10 23:33:42'),
(3, 'Test@test2.com', '2022-10-25 12:45:46', '2022-10-25 12:45:46', NULL),
(4, 'Test@test.com', '2022-10-25 12:45:55', '2022-10-25 12:45:55', NULL),
(5, 'Test2@test.com', '2022-10-25 12:45:58', '2022-10-25 12:45:58', NULL),
(6, 'Test24@test.com', '2022-10-25 12:47:51', '2022-10-25 12:47:51', NULL),
(7, 'Testasdasd@test.com', '2022-10-25 12:48:29', '2022-10-25 12:48:29', NULL),
(8, 'Testq@test.com', '2022-10-25 12:48:52', '2022-10-25 12:48:52', NULL),
(9, 'Tes6t@test.com', '2022-10-25 12:53:56', '2022-10-25 12:53:56', NULL),
(10, 'Testasd@test.com', '2022-10-25 12:54:30', '2022-10-25 12:54:30', NULL);

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
(1, 'Admin', '', 'Admin', '', 'admin@dollyeffect.com', '611-211-1111', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$bp.ZvKqzhHXCbUk6YGKFquYE/Sjn/2/zySRvt76ufcdFU/WvT8LuK', 'N6d87ld3b8hSSPu58t0mt5eNV8i0Rtk9L0G0iqnMtg1wAr78CELQzHuxJ4r0', '2021-08-12 14:06:10', '2022-05-10 05:57:55', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_services`
--
ALTER TABLE `book_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giftcard`
--
ALTER TABLE `giftcard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
-- Indexes for table `package`
--
ALTER TABLE `package`
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
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_services`
--
ALTER TABLE `book_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `giftcard`
--
ALTER TABLE `giftcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_flag`
--
ALTER TABLE `m_flag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1978;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
