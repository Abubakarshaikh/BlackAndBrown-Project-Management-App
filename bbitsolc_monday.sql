-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 05, 2022 at 05:42 PM
-- Server version: 5.7.38
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbitsolc_monday`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `userId` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`userId`, `email`, `password`, `token`) VALUES
(6, 'aaraf@gmail.com', '123', 'e2e3e1e6-0363-4b87-9307-2afd32588814'),
(5, 'aftab@gmail.com', '123', 'd2b766ac-878f-4223-910d-733b861dc736'),
(4, 'anas@gmail.com', '123', 'ab58256b-72b8-4044-978b-f70013e35108'),
(3, 'anjum@gmail.com', '123', '792496bc-9b75-4591-b123-68cc3d7f5a0c');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(5, 'Information Techlogy(IT)', '2022-03-29 08:08:40', '2022-03-29 08:08:40'),
(6, 'Procurement', '2022-03-29 08:10:25', '2022-03-29 08:10:25'),
(7, 'Human resources(HR)', '2022-03-29 08:11:05', '2022-03-29 08:11:05'),
(8, 'Maintenance', '2022-03-29 08:11:16', '2022-03-29 08:11:16'),
(9, 'Expansion', '2022-03-29 08:11:25', '2022-03-29 08:11:25'),
(10, 'Audit', '2022-03-29 08:11:33', '2022-03-29 08:11:33'),
(11, 'Software', '2022-03-29 08:11:40', '2022-03-29 08:11:40'),
(12, 'Creative', '2022-03-29 08:11:49', '2022-03-29 08:11:49'),
(13, 'Administration(ADMIN)', '2022-03-29 08:11:59', '2022-03-29 08:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `projectId` int(10) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `senderId` int(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `projectId`, `message`, `senderId`, `createdAt`) VALUES
(52, 57, 'let\'s play ', 0, '2022-04-11 11:16:00'),
(53, 57, 'ok nowhere ', 0, '2022-04-11 11:16:08'),
(54, 57, 'new project', 3, '2022-04-11 11:19:29'),
(55, 58, 'now let\'s do it', 0, '2022-04-11 11:23:28'),
(56, 55, 'ok', 3, '2022-04-11 11:24:35'),
(57, 58, 'ok', 3, '2022-04-11 11:25:59'),
(58, 58, 'ok', 0, '2022-04-11 11:26:05'),
(59, 57, 'ok', 0, '2022-04-12 20:51:08'),
(60, 57, 'ok', 0, '2022-04-12 20:51:20'),
(61, 57, 'ok let\'s do it now', 0, '2022-04-12 20:51:36'),
(62, 57, 'ok let\'s do it now', 0, '2022-04-12 20:51:39'),
(63, 57, 'i have it now', 0, '2022-04-12 20:59:02'),
(64, 57, 'OK LET\'S ', 4, '2022-04-13 08:50:08'),
(65, 57, 'ok done', 5, '2022-04-13 12:19:52'),
(66, 76, 'zhjja', 5, '2022-04-13 16:46:58'),
(67, 61, 'hi', 5, '2022-04-13 18:13:12'),
(68, 60, 'ok', 5, '2022-04-13 19:23:07'),
(69, 60, ' let\'s play.', 5, '2022-04-13 19:23:16'),
(70, 60, 'no today\'s ', 5, '2022-04-13 19:23:26'),
(71, 93, 'ok ', 5, '2022-04-13 20:18:05'),
(72, 60, 'ok', 5, '2022-04-14 08:17:57'),
(73, 60, ' rh', 5, '2022-04-14 08:20:22'),
(74, 60, ' rhzz', 5, '2022-04-14 08:20:25'),
(75, 60, 'ok', 5, '2022-04-14 08:22:44'),
(76, 60, 'let\'s play', 5, '2022-04-14 08:22:51'),
(77, 60, '', 5, '2022-04-14 08:25:06'),
(78, 60, '', 5, '2022-04-14 08:25:07'),
(79, 60, '', 5, '2022-04-14 08:25:24'),
(80, 57, 'OK DOME', 5, '2022-04-14 08:26:09'),
(81, 57, 'ok done', 5, '2022-04-14 08:26:17'),
(82, 0, 'ok', 0, '2022-04-14 08:28:42'),
(83, 0, 'ok', 0, '2022-04-14 08:28:45'),
(84, 60, 'ok', 5, '2022-04-14 08:33:50'),
(85, 60, 'okhsbhs', 5, '2022-04-14 08:33:55'),
(86, 60, 'okhsbhs', 5, '2022-04-14 08:33:55'),
(87, 60, 'okhsbhs', 5, '2022-04-14 08:33:55'),
(88, 60, 'okhsbhs', 5, '2022-04-14 08:33:55'),
(89, 60, 'h', 5, '2022-04-14 08:35:31'),
(90, 60, 'hh', 5, '2022-04-14 08:35:33'),
(91, 60, 'u', 5, '2022-04-14 08:35:36'),
(92, 60, '', 5, '2022-04-14 08:38:59'),
(93, 60, '1', 5, '2022-04-14 08:39:04'),
(94, 60, '1', 5, '2022-04-14 08:39:05'),
(95, 60, '1', 5, '2022-04-14 08:39:06'),
(96, 60, '1', 5, '2022-04-14 08:39:07'),
(97, 60, '', 5, '2022-04-14 08:41:14'),
(98, 60, '2', 5, '2022-04-14 08:41:21'),
(99, 60, '2', 5, '2022-04-14 08:42:11'),
(100, 60, '9', 5, '2022-04-14 08:42:35'),
(101, 60, 'ok', 5, '2022-04-14 08:43:41'),
(102, 60, 'i will update you ', 5, '2022-04-14 08:43:54'),
(103, 58, 'ok', 0, '2022-04-14 08:53:52'),
(104, 58, 'okok', 0, '2022-04-14 08:53:57'),
(105, 0, 'ok', 0, '2022-04-14 08:54:01'),
(106, 0, 'ok', 0, '2022-04-14 08:54:02'),
(107, 0, 'ok', 0, '2022-04-14 08:54:02'),
(108, 0, 'ok', 0, '2022-04-14 08:54:02'),
(109, 0, 'ok', 0, '2022-04-14 08:54:05'),
(110, 0, 'ok', 0, '2022-04-14 08:54:05'),
(111, 0, 'ok', 0, '2022-04-14 08:54:05'),
(112, 0, 'ok', 0, '2022-04-14 08:54:05'),
(113, 0, 'ok', 0, '2022-04-14 08:54:06'),
(114, 0, 'ok', 0, '2022-04-14 08:54:06'),
(115, 60, 'ok', 5, '2022-04-14 08:54:56'),
(116, 60, 'now move om', 5, '2022-04-14 08:55:01'),
(117, 60, 'ok', 5, '2022-04-14 08:57:37'),
(118, 60, 'ok', 5, '2022-04-14 08:57:41'),
(119, 60, 'ok', 5, '2022-04-14 09:00:24'),
(120, 60, 'okok', 5, '2022-04-14 09:00:28'),
(121, 60, 'ok ', 5, '2022-04-14 09:01:43'),
(122, 61, 'sjsjnskoko', 5, '2022-04-14 09:09:06'),
(123, 61, 'sjsjzj', 5, '2022-04-14 09:09:09'),
(124, 61, 'hdhjs', 5, '2022-04-14 09:12:08'),
(125, 68, 'ok', 5, '2022-04-14 09:15:32'),
(126, 68, 'now let\'s plays ', 5, '2022-04-14 09:15:38'),
(127, 97, 'i love you.', 5, '2022-04-14 09:15:59'),
(128, 59, 'ok', 5, '2022-04-14 09:16:12'),
(129, 59, 'ok', 5, '2022-04-14 09:16:17'),
(130, 57, 'need 2 minutes.', 5, '2022-04-14 10:02:07'),
(131, 57, 'ok', 5, '2022-04-14 10:02:11'),
(132, 57, 'ok', 5, '2022-04-14 10:02:14'),
(133, 60, 'confidentiality ', 5, '2022-04-14 10:06:47'),
(134, 60, 'ok', 5, '2022-04-14 10:17:00'),
(135, 60, 'let\'s do something ', 5, '2022-04-14 10:17:59'),
(136, 60, 'ok', 5, '2022-04-14 10:18:03'),
(137, 103, 'ok', 5, '2022-04-14 20:58:50'),
(138, 103, 'now', 5, '2022-04-14 20:58:52'),
(139, 60, 'ok', 5, '2022-04-14 20:59:05'),
(140, 61, 'ok', 5, '2022-04-14 20:59:50'),
(141, 77, 'ok', 5, '2022-04-14 21:01:54'),
(142, 77, 'ok', 5, '2022-04-14 21:01:56'),
(143, 77, 'ok', 5, '2022-04-14 21:01:57'),
(144, 77, 'ok', 5, '2022-04-14 21:01:59'),
(145, 75, 'ok', 5, '2022-04-14 21:02:09'),
(146, 79, 'wsd', 5, '2022-04-16 10:07:49'),
(147, 0, 'wsd', 0, '2022-04-16 10:07:50'),
(148, 57, 'ok', 4, '2022-04-21 11:00:20'),
(149, 98, 'ok', 4, '2022-04-21 11:00:29'),
(150, 86, 'ok', 4, '2022-04-21 11:00:40'),
(151, 72, 'ok', 4, '2022-04-21 11:00:48'),
(152, 63, 'ok', 3, '2022-04-21 11:15:30'),
(153, 60, 'Not ok', 5, '2022-04-21 11:17:37'),
(154, 57, 'not okay.', 5, '2022-04-21 11:18:19'),
(155, 57, 'let\'s create it.', 3, '2022-04-21 11:18:35'),
(156, 57, 'thanks ', 5, '2022-04-21 11:18:48'),
(157, 79, 'ok', 4, '2022-04-25 07:38:06'),
(158, 79, 'lets\'s finished it.', 4, '2022-04-25 07:38:26'),
(159, 86, 'ok', 4, '2022-04-25 07:38:51'),
(160, 86, 'njm', 4, '2022-04-25 07:39:03'),
(161, 111, 'ok', 5, '2022-04-25 09:29:53'),
(162, 110, 'ok', 5, '2022-04-25 10:23:27'),
(163, 109, 'ok', 6, '2022-04-25 11:23:10'),
(164, 110, 'done', 6, '2022-04-25 11:23:18'),
(165, 109, 'ok', 6, '2022-04-25 11:58:07'),
(166, 112, 'jzbs', 5, '2022-04-25 12:27:33'),
(167, 109, 'ok', 5, '2022-04-26 08:05:35'),
(168, 113, 'ok', 5, '2022-04-26 08:05:40'),
(169, 112, 'ok', 5, '2022-04-26 08:05:44'),
(170, 109, 'ok', 5, '2022-04-26 08:05:49'),
(171, 109, 'hilal', 6, '2022-04-26 08:55:04'),
(172, 111, 'done', 5, '2022-04-26 10:34:51'),
(173, 109, 'let\'s play ', 6, '2022-04-26 19:49:11'),
(174, 120, 'ok', 5, '2022-04-26 19:55:23'),
(175, 122, 'done', 5, '2022-04-27 09:03:15'),
(176, 123, 'done', 6, '2022-04-27 10:31:24'),
(177, 123, 'ok', 6, '2022-04-27 21:31:34'),
(178, 123, 'ok', 6, '2022-04-27 21:31:50'),
(179, 122, 'ok', 6, '2022-04-27 21:31:58'),
(180, 122, 'ok', 5, '2022-04-27 21:32:35'),
(181, 124, 'do it.', 5, '2022-04-27 21:33:35'),
(182, 124, 'ok', 5, '2022-04-27 21:35:01'),
(183, 123, 'done', 5, '2022-04-28 09:22:29'),
(184, 124, 'ok', 5, '2022-04-28 09:23:53'),
(185, 125, 'please make as soon possible', 5, '2022-04-28 09:24:59'),
(186, 123, 'ok', 5, '2022-04-28 09:40:20'),
(187, 123, 'ok', 5, '2022-04-28 09:40:36'),
(188, 122, 'ok', 5, '2022-04-28 09:40:49'),
(189, 125, 'ok', 5, '2022-04-28 09:41:03'),
(190, 123, 'ok', 6, '2022-04-28 10:09:01'),
(191, 123, 'ok', 6, '2022-04-28 10:10:03'),
(192, 123, 'ok', 6, '2022-04-28 10:11:15'),
(193, 123, 'ok', 6, '2022-04-28 10:13:20'),
(194, 123, 'ok', 6, '2022-04-28 10:18:46'),
(195, 123, 'iko', 6, '2022-04-28 10:19:01'),
(196, 123, 'iiiiiiio', 6, '2022-04-28 10:21:34'),
(197, 123, 'mmmmmk', 6, '2022-04-28 10:23:47'),
(198, 123, 'JoJo ', 6, '2022-04-28 10:24:43'),
(199, 123, 'iiiii', 6, '2022-04-28 10:25:48'),
(200, 123, 'uji', 6, '2022-04-28 10:35:57'),
(201, 123, 'iko', 6, '2022-04-28 10:37:57'),
(202, 123, 'ji', 6, '2022-04-28 10:38:10'),
(203, 125, 'Hyderabad ', 6, '2022-04-28 10:38:49'),
(204, 125, 'karachi', 6, '2022-04-28 10:54:56'),
(205, 125, 'lahore', 6, '2022-04-28 10:55:14'),
(206, 123, '1', 6, '2022-04-28 10:59:44'),
(207, 123, '2', 6, '2022-04-28 10:59:58'),
(208, 123, '3', 6, '2022-04-28 11:00:24'),
(209, 123, '4', 6, '2022-04-28 11:01:17'),
(210, 123, '5', 6, '2022-04-28 11:01:29'),
(211, 123, '6', 6, '2022-04-28 11:02:42'),
(212, 123, '7', 6, '2022-04-28 11:02:59'),
(213, 123, '8', 6, '2022-04-28 11:04:39'),
(214, 123, 'ty', 6, '2022-04-28 11:04:55'),
(215, 123, '9', 6, '2022-04-28 11:05:02'),
(216, 123, '10', 6, '2022-04-28 11:06:03'),
(217, 123, '11', 6, '2022-04-28 11:06:27'),
(218, 122, '1', 6, '2022-04-28 11:18:03'),
(219, 122, '2', 6, '2022-04-28 11:18:04'),
(220, 122, '3', 6, '2022-04-28 11:18:06'),
(221, 122, '4', 6, '2022-04-28 11:18:08'),
(222, 122, '5', 6, '2022-04-28 11:18:09'),
(223, 122, '6', 6, '2022-04-28 11:18:10'),
(224, 122, 'here we are', 6, '2022-04-28 11:18:28'),
(225, 122, 'where are you?', 6, '2022-04-28 11:18:36'),
(226, 122, 'when i', 6, '2022-04-28 11:18:53'),
(227, 125, 'o', 6, '2022-04-28 11:24:00'),
(228, 125, '9', 6, '2022-04-28 11:25:06'),
(229, 123, '12', 6, '2022-04-28 11:30:18'),
(230, 123, '13', 5, '2022-04-28 11:32:16'),
(231, 123, '14', 5, '2022-04-28 11:32:24'),
(232, 125, '10', 5, '2022-04-28 11:32:34'),
(233, 124, 'not ok', 5, '2022-04-28 11:32:58'),
(234, 126, 'loop', 5, '2022-04-28 11:33:49'),
(235, 127, 'ok', 5, '2022-04-28 11:35:26'),
(236, 128, 'ok', 5, '2022-04-28 11:38:42'),
(237, 128, 'not ok', 5, '2022-04-28 11:38:51'),
(238, 128, 'not right', 5, '2022-04-28 11:39:06'),
(239, 129, 'talha', 6, '2022-04-28 11:41:43'),
(240, 130, 'complete', 6, '2022-04-28 11:44:59'),
(241, 130, 'ok', 6, '2022-04-28 11:45:08'),
(242, 130, 'done', 5, '2022-04-28 11:45:32'),
(243, 127, 'ok', 5, '2022-04-28 11:57:24'),
(244, 127, 'kl', 5, '2022-04-28 11:57:29'),
(245, 127, 'mjkl', 5, '2022-04-28 11:57:36'),
(246, 127, 'vfgb', 5, '2022-04-28 11:57:40'),
(247, 127, 'vfgv', 5, '2022-04-28 11:57:50'),
(248, 127, 'dfcds', 5, '2022-04-28 11:57:59'),
(249, 130, 'ok', 6, '2022-04-28 11:59:07'),
(250, 130, 'rrd', 6, '2022-04-28 11:59:21'),
(251, 132, 'done', 6, '2022-04-28 12:07:52'),
(252, 133, 'done', 5, '2022-04-28 12:16:20'),
(253, 133, 'ok', 6, '2022-04-28 23:44:00'),
(254, 133, 'ok', 6, '2022-04-28 23:44:02'),
(255, 133, 'ol', 6, '2022-04-28 23:44:04'),
(256, 133, 'ko', 6, '2022-04-28 23:44:06'),
(257, 133, 'tch', 6, '2022-04-28 23:44:07'),
(258, 133, 'viv', 6, '2022-04-28 23:44:08'),
(259, 133, 'bkb', 6, '2022-04-28 23:44:09'),
(260, 133, ' jf', 6, '2022-04-28 23:44:11'),
(261, 122, '9', 6, '2022-04-28 23:49:01'),
(262, 122, '0', 6, '2022-04-28 23:49:04'),
(263, 123, 'yu', 5, '2022-04-29 08:19:00'),
(264, 123, 'uv', 5, '2022-04-29 09:02:05'),
(265, 123, 'on refresh ', 6, '2022-04-29 09:02:37'),
(266, 123, 'ok done', 6, '2022-04-29 09:02:58'),
(267, 125, 'cg', 5, '2022-04-29 09:03:31'),
(268, 131, 'vg', 5, '2022-04-29 09:03:42'),
(269, 131, 'gh', 5, '2022-04-29 09:03:47'),
(270, 139, 'vg', 5, '2022-04-29 09:03:55'),
(271, 123, 'vhgfy ', 6, '2022-04-29 09:09:35'),
(272, 0, 'fy', 0, '2022-04-29 09:09:43'),
(273, 0, 'fy', 0, '2022-04-29 09:09:45'),
(274, 123, 'gh', 6, '2022-04-29 09:10:01'),
(275, 123, 'vgg', 6, '2022-04-29 09:11:14'),
(276, 123, 'ff', 6, '2022-04-29 09:11:18'),
(277, 123, 'vv v', 6, '2022-04-29 09:11:23'),
(278, 123, 'cgych', 6, '2022-04-29 09:11:28'),
(279, 123, 'y', 6, '2022-04-29 09:11:34'),
(280, 123, 'chv', 6, '2022-04-29 09:13:08'),
(281, 123, 'vb', 6, '2022-04-29 09:13:09'),
(282, 123, 'vv', 6, '2022-04-29 09:13:13'),
(283, 123, 'vvttt', 6, '2022-04-29 09:13:20'),
(284, 123, '11', 6, '2022-04-29 09:13:25'),
(285, 123, '234455', 6, '2022-04-29 09:13:29'),
(286, 139, 'ghu', 6, '2022-04-29 09:15:07'),
(287, 139, 'fff', 6, '2022-04-29 09:15:16'),
(288, 139, 'cccgi', 6, '2022-04-29 09:15:20'),
(289, 123, '6', 6, '2022-04-29 09:16:51'),
(290, 123, '7', 6, '2022-04-29 09:16:54'),
(291, 123, '8', 6, '2022-04-29 09:16:56'),
(292, 123, '9', 6, '2022-04-29 09:16:59'),
(293, 152, 'hh', 5, '2022-04-29 10:46:13'),
(294, 153, 'gg', 5, '2022-04-29 10:47:34'),
(295, 0, 'vg', 0, '2022-04-29 10:47:45'),
(296, 151, 'u', 5, '2022-04-29 10:49:48'),
(297, 151, 'y', 5, '2022-04-29 10:49:50'),
(298, 151, 'y', 5, '2022-04-29 10:49:56'),
(299, 151, '5', 5, '2022-04-29 10:49:59'),
(300, 154, 'ok', 5, '2022-04-29 21:35:12'),
(301, 154, 'ok', 5, '2022-04-29 21:35:15'),
(302, 154, 'ujoh', 5, '2022-04-29 21:35:18'),
(303, 155, 'ok', 5, '2022-04-29 21:36:12'),
(304, 128, 'ok', 5, '2022-04-29 21:38:01'),
(305, 128, 'pop', 5, '2022-04-29 21:38:05'),
(306, 128, 'opop', 5, '2022-04-29 21:38:07'),
(307, 128, 'gc', 5, '2022-04-29 21:38:08'),
(308, 128, 'hsibw', 5, '2022-04-29 21:38:11'),
(309, 128, 'q', 5, '2022-04-29 21:38:20'),
(310, 128, 'q', 5, '2022-04-29 21:38:23'),
(311, 155, 'the ', 6, '2022-04-29 21:39:44'),
(312, 155, 'hsn. Ka', 6, '2022-04-29 21:39:47'),
(313, 155, 'wwruja', 6, '2022-04-29 21:39:52'),
(314, 155, 'nz a', 6, '2022-04-29 21:39:54'),
(315, 155, 'nznkq', 6, '2022-04-29 21:39:55'),
(316, 155, 'bzkaow', 6, '2022-04-29 21:39:56'),
(317, 155, 'bzbja', 6, '2022-04-29 21:39:58'),
(318, 155, 'om', 6, '2022-04-29 21:39:59'),
(319, 155, 'nzja', 6, '2022-04-29 21:40:02'),
(320, 155, 'qhana', 6, '2022-04-29 21:40:03'),
(321, 141, 'baj', 6, '2022-04-29 21:40:12'),
(322, 141, 'kska', 6, '2022-04-29 21:40:14'),
(323, 141, 'kska', 6, '2022-04-29 21:40:14'),
(324, 141, 'ss', 6, '2022-04-29 21:40:17'),
(325, 155, 'ok', 5, '2022-05-02 13:37:22'),
(326, 155, 'Abubakar ', 5, '2022-05-02 13:40:46'),
(327, 155, 'Abubakar bhai', 5, '2022-05-02 13:40:57'),
(328, 155, 'han bhai', 6, '2022-05-02 13:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) NOT NULL,
  `departmentId` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `descriptions` varchar(1000) NOT NULL,
  `percentage` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deadline` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `departmentId`, `name`, `descriptions`, `percentage`, `status`, `deadline`, `createdAt`, `updatedAt`) VALUES
(122, 5, 'Delivery app', 'as soon possible', 100, 1, '2022-04-27 10:09:36', '2022-04-27 08:53:03', '2022-04-27 08:53:03'),
(123, 5, 'meter app', 'complete as son possible ', 0, 0, '2022-04-29 17:00:00', '2022-04-27 10:10:34', '2022-04-27 10:10:34'),
(124, 9, 'buy chairs', 'as soon possible ', 0, 0, '2022-04-29 17:00:00', '2022-04-27 21:33:05', '2022-04-27 21:33:05'),
(125, 5, 'New website', 'as soon possible', 0, 0, '2022-05-30 17:00:00', '2022-04-28 09:24:35', '2022-04-28 09:24:35'),
(126, 7, 'loop', 'loop ui', 0, 0, '2022-04-29 17:00:00', '2022-04-28 11:33:38', '2022-04-28 11:33:38'),
(127, 6, 'new car', 'ok', 0, 0, '2022-04-05 17:00:00', '2022-04-28 11:35:17', '2022-04-28 11:35:17'),
(128, 12, 'chlo thek hy', 'ok', 0, 0, '2022-04-06 17:00:00', '2022-04-28 11:38:34', '2022-04-28 11:38:34'),
(129, 5, 'ninety nine', 'nuininjnj', 0, 0, '2022-03-31 17:00:00', '2022-04-28 11:41:12', '2022-04-28 11:41:12'),
(130, 5, 'new website', 'update', 0, 0, '2022-04-03 17:00:00', '2022-04-28 11:44:17', '2022-04-28 11:44:17'),
(131, 5, 'description ', 'no', 0, 0, '2022-04-21 17:00:00', '2022-04-28 11:59:49', '2022-04-28 11:59:49'),
(132, 5, 'new app', 'ok done', 0, 0, '2022-04-29 17:00:00', '2022-04-28 12:05:12', '2022-04-28 12:05:12'),
(133, 5, 'buy new mobile', 'dvfsefgm ', 0, 0, '2022-04-29 17:00:00', '2022-04-28 12:15:59', '2022-04-28 12:15:59'),
(134, 5, 'dome', 'jdns', 0, 0, '2022-04-01 17:00:00', '2022-04-29 07:58:25', '2022-04-29 07:58:25'),
(135, 5, 'godbjs', 'bsna', 0, 0, '2022-04-29 17:00:00', '2022-04-29 07:59:28', '2022-04-29 07:59:28'),
(136, 5, 'yh', 'vh', 0, 0, '2022-04-29 17:00:00', '2022-04-29 08:06:14', '2022-04-29 08:06:14'),
(137, 5, 'bggg', '', 0, 0, '2022-04-29 17:00:00', '2022-04-29 08:06:34', '2022-04-29 08:06:34'),
(138, 5, 'j', 'j', 0, 0, '2022-04-07 17:00:00', '2022-04-29 08:06:46', '2022-04-29 08:06:46'),
(139, 5, 'ui', 'ii', 0, 0, '2022-04-21 17:00:00', '2022-04-29 08:06:56', '2022-04-29 08:06:56'),
(140, 5, 'jdo', 'dkod', 0, 0, '2022-04-28 17:00:00', '2022-04-29 09:35:59', '2022-04-29 09:35:59'),
(141, 5, 'new project ', 'xx', 0, 0, '2022-04-28 17:00:00', '2022-04-29 09:36:25', '2022-04-29 09:36:25'),
(142, 5, 'kake lao', 'ok', 0, 0, '2022-04-29 17:00:00', '2022-04-29 09:37:33', '2022-04-29 09:37:33'),
(143, 5, 'ok', 'h', 0, 0, '2022-04-29 17:00:00', '2022-04-29 09:59:00', '2022-04-29 09:59:00'),
(144, 5, 'hjj', 'jj', 0, 0, '2022-04-29 17:00:00', '2022-04-29 09:59:17', '2022-04-29 09:59:17'),
(145, 5, 'bb', 'bb', 0, 0, '2022-04-29 17:00:00', '2022-04-29 09:59:28', '2022-04-29 09:59:28'),
(146, 5, 'jjn', 'nnn', 0, 0, '2022-04-07 17:00:00', '2022-04-29 10:05:36', '2022-04-29 10:05:36'),
(147, 5, 'gh', 'gg', 0, 0, '2022-04-29 17:00:00', '2022-04-29 10:25:14', '2022-04-29 10:25:14'),
(148, 5, 'bb', 'bb', 0, 0, '2022-04-29 17:00:00', '2022-04-29 10:25:27', '2022-04-29 10:25:27'),
(149, 5, 'ok', 'ok', 0, 0, '2022-04-29 17:00:00', '2022-04-29 10:37:22', '2022-04-29 10:37:22'),
(150, 5, 'hh', 'hh', 0, 0, '2022-04-29 17:00:00', '2022-04-29 10:38:51', '2022-04-29 10:38:51'),
(151, 5, 'done', 'bja', 0, 0, '2022-04-29 17:00:00', '2022-04-29 10:41:43', '2022-04-29 10:41:43'),
(152, 5, 'bbb', 'bb', 0, 0, '2022-04-22 17:00:00', '2022-04-29 10:43:20', '2022-04-29 10:43:20'),
(153, 5, 'nnn', 'jj', 0, 0, '2022-04-29 17:00:00', '2022-04-29 10:44:13', '2022-04-29 10:44:13'),
(154, 5, 'nb', 'nn', 0, 0, '2022-04-07 17:00:00', '2022-04-29 10:45:41', '2022-04-29 10:45:41'),
(155, 5, 'ok', 'ol', 0, 0, '2022-04-28 17:00:00', '2022-04-29 21:36:00', '2022-04-29 21:36:00'),
(156, 9, 'new branch ', 'quickly ', 0, 0, '2022-05-30 17:00:00', '2022-05-02 13:36:32', '2022-05-02 13:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `departmentId` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `departmentId`, `name`, `createdAt`, `updatedAt`) VALUES
(3, 5, 'Anjum Arain', '2022-03-29 07:48:05', '2022-03-29 07:48:05'),
(4, 5, 'Anas Suhail', '2022-03-29 07:54:15', '2022-03-29 07:54:15'),
(5, 786, 'aftab', '2022-04-04 10:15:08', '2022-04-04 10:15:08'),
(6, 5, 'aaraf', '2022-04-25 11:19:40', '2022-04-25 11:19:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
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
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
