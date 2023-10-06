-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2023 at 03:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolmsdbnew_exp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(7) NOT NULL DEFAULT '0',
  `l_name` varchar(255) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `m_initial` varchar(255) NOT NULL,
  `phone no.` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `hire_date` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `city_municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `zip` int(4) NOT NULL,
  `sex` char(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `l_name`, `f_name`, `m_initial`, `phone no.`, `email`, `dob`, `hire_date`, `street`, `brgy`, `city_municipality`, `province`, `zip`, `sex`, `user_id`) VALUES
('AD-001', 'Doe', 'John', 'D', 1505625851, 'fovotiy760@urs.edu.ph', '1990-08-01', '2023-08-20', '221B Baker Street', 'Kanluran', 'Naic', 'Cavite', 4110, 'M', 1),
('AD-002', 'Forger', 'Llyod', 'M', 1505625851, 'random123@urs.edu.ph', '1980-08-01', '2023-09-01', 'baker street', 'West', 'Naic', 'Etivac', 4110, 'M', 5),
('AD-003', 'Forger', 'Yor', 'A', 1553252352, 'randomemail312@urs.edu.ph', '1985-09-10', '2023-09-22', 'baker street', 'West', 'Naic', 'Etivac', 4110, 'F', 6),
('AD-004', 'Philips', 'Trevor', 'B', 1231456789, 'randomizeemail@urs.edu.ph', '1973-03-01', '2023-09-27', 'cut street', 'labac', 'Naic', 'Etivac', 4110, 'M', 7),
('AD-005', 'De Santa', 'Michael', 'T', 1234567890, 'gta5@urs.edu.ph', '1973-09-13', '2023-09-20', 'street street', 'pinili', 'batac', 'Ilocos norte', 4214, 'M', 8),
('AD-006', 'Cat', 'Garfie', 'D', 1231456789, 'randomizeemail@urs.edu.ph', '1993-03-01', '2023-09-27', 'cut street', 'labac', 'Naic', 'Etivac', 4110, 'M', 9),
('AD-007', 'Pusa', 'Michael', 'D', 1234567890, 'gta5@urs.edu.ph', '1973-09-13', '2023-09-20', 'street street', 'pinili', 'batac', 'Ilocos norte', 4214, 'M', 10),
('AD-008', 'Hanma', 'Yujiro', 'A', 1234567890, 'gta5@urs.edu.ph', '1973-09-13', '2023-09-20', 'street street', 'pinili', 'Shinjuku', 'Tokyo', 4214, 'M', 11);

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `admin_insert` BEFORE INSERT ON `admin` FOR EACH ROW BEGIN
  INSERT INTO admin_seq VALUES (NULL);
  SET NEW.id = CONCAT('AD-', LPAD(LAST_INSERT_ID(), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_seq`
--

CREATE TABLE `admin_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_seq`
--

INSERT INTO `admin_seq` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(255) NOT NULL,
  `date` date NOT NULL,
  `attendee_id` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `date`, `attendee_id`, `role`, `status`) VALUES
(1, '2023-08-21', 'AD-001', 'admin', NULL),
(2, '2023-08-22', 'AD-001', 'admin', NULL),
(3, '2023-08-23', 'AD-001', 'admin', NULL),
(4, '2023-08-24', 'AD-001', 'admin', NULL),
(5, '2023-08-25', 'AD-001', 'admin', NULL),
(6, '2023-08-26', 'AD-001', 'admin', NULL),
(7, '2023-08-27', 'AD-001', 'admin', NULL),
(8, '2023-08-28', 'AD-001', 'admin', NULL),
(9, '2023-08-29', 'AD-001', 'admin', NULL),
(10, '2023-08-30', 'AD-001', 'admin', NULL),
(11, '2023-08-31', 'AD-001', 'admin', NULL),
(12, '2023-09-01', 'AD-001', 'admin', NULL),
(13, '2023-09-02', 'AD-001', 'admin', NULL),
(14, '2023-09-03', 'AD-001', 'admin', NULL),
(15, '2023-09-04', 'AD-001', 'admin', NULL),
(16, '2023-09-05', 'AD-001', 'admin', NULL),
(17, '2023-09-06', 'AD-001', 'admin', NULL),
(18, '2023-09-07', 'AD-001', 'admin', NULL),
(19, '2023-09-08', 'AD-001', 'admin', NULL),
(20, '2023-09-09', 'AD-001', 'admin', NULL),
(21, '2023-09-10', 'AD-001', 'admin', NULL),
(22, '2023-09-11', 'AD-001', 'admin', NULL),
(23, '2023-09-12', 'AD-001', 'admin', NULL),
(24, '2023-09-13', 'AD-001', 'admin', NULL),
(25, '2023-09-14', 'AD-001', 'admin', NULL),
(26, '2023-09-15', 'AD-001', 'admin', NULL),
(27, '2023-09-16', 'AD-001', 'admin', NULL),
(28, '2023-09-17', 'AD-001', 'admin', NULL),
(29, '2023-09-18', 'AD-001', 'admin', NULL),
(30, '2023-09-19', 'AD-001', 'admin', NULL),
(31, '2023-09-20', 'AD-001', 'admin', NULL),
(32, '2023-09-21', 'AD-001', 'admin', NULL),
(33, '2023-09-22', 'AD-001', 'admin', NULL),
(34, '2023-09-23', 'AD-001', 'admin', NULL),
(35, '2023-09-24', 'AD-001', 'admin', NULL),
(36, '2023-09-25', 'AD-001', 'admin', NULL),
(37, '2023-09-26', 'AD-001', 'admin', NULL),
(38, '2023-09-27', 'AD-001', 'admin', NULL),
(39, '2023-09-28', 'AD-001', 'admin', NULL),
(40, '2023-09-29', 'AD-001', 'admin', NULL),
(41, '2023-09-30', 'AD-001', '', 'present'),
(42, '2023-09-02', 'AD-002', 'admin', NULL),
(43, '2023-09-03', 'AD-002', 'admin', NULL),
(44, '2023-09-04', 'AD-002', 'admin', NULL),
(45, '2023-09-05', 'AD-002', 'admin', NULL),
(46, '2023-09-06', 'AD-002', 'admin', NULL),
(47, '2023-09-07', 'AD-002', 'admin', NULL),
(48, '2023-09-08', 'AD-002', 'admin', NULL),
(49, '2023-09-09', 'AD-002', 'admin', NULL),
(50, '2023-09-10', 'AD-002', 'admin', NULL),
(51, '2023-09-11', 'AD-002', 'admin', NULL),
(52, '2023-09-12', 'AD-002', 'admin', NULL),
(53, '2023-09-13', 'AD-002', 'admin', NULL),
(54, '2023-09-14', 'AD-002', 'admin', NULL),
(55, '2023-09-15', 'AD-002', 'admin', NULL),
(56, '2023-09-16', 'AD-002', 'admin', NULL),
(57, '2023-09-17', 'AD-002', 'admin', NULL),
(58, '2023-09-18', 'AD-002', 'admin', NULL),
(59, '2023-09-19', 'AD-002', 'admin', NULL),
(60, '2023-09-20', 'AD-002', 'admin', NULL),
(61, '2023-09-21', 'AD-002', 'admin', NULL),
(62, '2023-09-22', 'AD-002', 'admin', NULL),
(63, '2023-09-23', 'AD-002', 'admin', NULL),
(64, '2023-09-24', 'AD-002', 'admin', NULL),
(65, '2023-09-25', 'AD-002', 'admin', NULL),
(66, '2023-09-26', 'AD-002', 'admin', NULL),
(67, '2023-09-27', 'AD-002', 'admin', NULL),
(68, '2023-09-28', 'AD-002', 'admin', NULL),
(69, '2023-09-29', 'AD-002', 'admin', NULL),
(70, '2023-09-30', 'AD-002', '', 'present'),
(71, '2023-09-23', 'AD-003', 'admin', NULL),
(72, '2023-09-24', 'AD-003', 'admin', NULL),
(73, '2023-09-25', 'AD-003', 'admin', NULL),
(74, '2023-09-26', 'AD-003', 'admin', NULL),
(75, '2023-09-27', 'AD-003', 'admin', NULL),
(76, '2023-09-28', 'AD-003', 'admin', NULL),
(77, '2023-09-29', 'AD-003', 'admin', NULL),
(78, '2023-09-30', 'AD-003', '', 'present'),
(79, '2023-09-28', 'AD-004', 'admin', NULL),
(80, '2023-09-29', 'AD-004', 'admin', NULL),
(81, '2023-09-30', 'AD-004', '', 'present'),
(82, '2023-09-21', 'AD-005', 'admin', NULL),
(83, '2023-09-22', 'AD-005', 'admin', NULL),
(84, '2023-09-23', 'AD-005', 'admin', NULL),
(85, '2023-09-24', 'AD-005', 'admin', NULL),
(86, '2023-09-25', 'AD-005', 'admin', NULL),
(87, '2023-09-26', 'AD-005', 'admin', NULL),
(88, '2023-09-27', 'AD-005', 'admin', NULL),
(89, '2023-09-28', 'AD-005', 'admin', NULL),
(90, '2023-09-29', 'AD-005', 'admin', NULL),
(91, '2023-09-30', 'AD-005', '', 'present'),
(92, '2023-09-28', 'AD-006', 'admin', NULL),
(93, '2023-09-29', 'AD-006', 'admin', NULL),
(94, '2023-09-30', 'AD-006', '', 'present'),
(95, '2023-09-21', 'AD-007', 'admin', NULL),
(96, '2023-09-22', 'AD-007', 'admin', NULL),
(97, '2023-09-23', 'AD-007', 'admin', NULL),
(98, '2023-09-24', 'AD-007', 'admin', NULL),
(99, '2023-09-25', 'AD-007', 'admin', NULL),
(100, '2023-09-26', 'AD-007', 'admin', NULL),
(101, '2023-09-27', 'AD-007', 'admin', NULL),
(102, '2023-09-28', 'AD-007', 'admin', NULL),
(103, '2023-09-29', 'AD-007', 'admin', NULL),
(104, '2023-09-30', 'AD-007', '', 'present'),
(105, '2023-09-21', 'AD-008', 'admin', NULL),
(106, '2023-09-22', 'AD-008', 'admin', NULL),
(107, '2023-09-23', 'AD-008', 'admin', NULL),
(108, '2023-09-24', 'AD-008', 'admin', NULL),
(109, '2023-09-25', 'AD-008', 'admin', NULL),
(110, '2023-09-26', 'AD-008', 'admin', NULL),
(111, '2023-09-27', 'AD-008', 'admin', NULL),
(112, '2023-09-28', 'AD-008', 'admin', NULL),
(113, '2023-09-29', 'AD-008', 'admin', NULL),
(114, '2023-09-30', 'AD-008', '', 'present'),
(115, '2023-09-02', 'TE-001', 'teacher', NULL),
(116, '2023-09-03', 'TE-001', 'teacher', NULL),
(117, '2023-09-04', 'TE-001', 'teacher', NULL),
(118, '2023-09-05', 'TE-001', 'teacher', NULL),
(119, '2023-09-06', 'TE-001', 'teacher', NULL),
(120, '2023-09-07', 'TE-001', 'teacher', NULL),
(121, '2023-09-08', 'TE-001', 'teacher', NULL),
(122, '2023-09-09', 'TE-001', 'teacher', NULL),
(123, '2023-09-10', 'TE-001', 'teacher', NULL),
(124, '2023-09-11', 'TE-001', 'teacher', NULL),
(125, '2023-09-12', 'TE-001', 'teacher', NULL),
(126, '2023-09-13', 'TE-001', 'teacher', NULL),
(127, '2023-09-14', 'TE-001', 'teacher', NULL),
(128, '2023-09-15', 'TE-001', 'teacher', NULL),
(129, '2023-09-16', 'TE-001', 'teacher', NULL),
(130, '2023-09-17', 'TE-001', 'teacher', NULL),
(131, '2023-09-18', 'TE-001', 'teacher', NULL),
(132, '2023-09-19', 'TE-001', 'teacher', NULL),
(133, '2023-09-20', 'TE-001', 'teacher', NULL),
(134, '2023-09-21', 'TE-001', 'teacher', NULL),
(135, '2023-09-22', 'TE-001', 'teacher', NULL),
(136, '2023-09-23', 'TE-001', 'teacher', NULL),
(137, '2023-09-24', 'TE-001', 'teacher', NULL),
(138, '2023-09-25', 'TE-001', 'teacher', NULL),
(139, '2023-09-26', 'TE-001', 'teacher', NULL),
(140, '2023-09-27', 'TE-001', 'teacher', NULL),
(141, '2023-09-28', 'TE-001', 'teacher', NULL),
(142, '2023-09-29', 'TE-001', 'teacher', NULL),
(143, '2023-09-30', 'TE-001', '', 'present'),
(144, '2023-09-02', 'TE-002', 'teacher', NULL),
(145, '2023-09-03', 'TE-002', 'teacher', NULL),
(146, '2023-09-04', 'TE-002', 'teacher', NULL),
(147, '2023-09-05', 'TE-002', 'teacher', NULL),
(148, '2023-09-06', 'TE-002', 'teacher', NULL),
(149, '2023-09-07', 'TE-002', 'teacher', NULL),
(150, '2023-09-08', 'TE-002', 'teacher', NULL),
(151, '2023-09-09', 'TE-002', 'teacher', NULL),
(152, '2023-09-10', 'TE-002', 'teacher', NULL),
(153, '2023-09-11', 'TE-002', 'teacher', NULL),
(154, '2023-09-12', 'TE-002', 'teacher', NULL),
(155, '2023-09-13', 'TE-002', 'teacher', NULL),
(156, '2023-09-14', 'TE-002', 'teacher', NULL),
(157, '2023-09-15', 'TE-002', 'teacher', NULL),
(158, '2023-09-16', 'TE-002', 'teacher', NULL),
(159, '2023-09-17', 'TE-002', 'teacher', NULL),
(160, '2023-09-18', 'TE-002', 'teacher', NULL),
(161, '2023-09-19', 'TE-002', 'teacher', NULL),
(162, '2023-09-20', 'TE-002', 'teacher', NULL),
(163, '2023-09-21', 'TE-002', 'teacher', NULL),
(164, '2023-09-22', 'TE-002', 'teacher', NULL),
(165, '2023-09-23', 'TE-002', 'teacher', NULL),
(166, '2023-09-24', 'TE-002', 'teacher', NULL),
(167, '2023-09-25', 'TE-002', 'teacher', NULL),
(168, '2023-09-26', 'TE-002', 'teacher', NULL),
(169, '2023-09-27', 'TE-002', 'teacher', NULL),
(170, '2023-09-28', 'TE-002', 'teacher', NULL),
(171, '2023-09-29', 'TE-002', 'teacher', NULL),
(172, '2023-09-30', 'TE-002', '', 'present'),
(173, '2023-09-02', 'TE-003', 'teacher', NULL),
(174, '2023-09-03', 'TE-003', 'teacher', NULL),
(175, '2023-09-04', 'TE-003', 'teacher', NULL),
(176, '2023-09-05', 'TE-003', 'teacher', NULL),
(177, '2023-09-06', 'TE-003', 'teacher', NULL),
(178, '2023-09-07', 'TE-003', 'teacher', NULL),
(179, '2023-09-08', 'TE-003', 'teacher', NULL),
(180, '2023-09-09', 'TE-003', 'teacher', NULL),
(181, '2023-09-10', 'TE-003', 'teacher', NULL),
(182, '2023-09-11', 'TE-003', 'teacher', NULL),
(183, '2023-09-12', 'TE-003', 'teacher', NULL),
(184, '2023-09-13', 'TE-003', 'teacher', NULL),
(185, '2023-09-14', 'TE-003', 'teacher', NULL),
(186, '2023-09-15', 'TE-003', 'teacher', NULL),
(187, '2023-09-16', 'TE-003', 'teacher', NULL),
(188, '2023-09-17', 'TE-003', 'teacher', NULL),
(189, '2023-09-18', 'TE-003', 'teacher', NULL),
(190, '2023-09-19', 'TE-003', 'teacher', NULL),
(191, '2023-09-20', 'TE-003', 'teacher', NULL),
(192, '2023-09-21', 'TE-003', 'teacher', NULL),
(193, '2023-09-22', 'TE-003', 'teacher', NULL),
(194, '2023-09-23', 'TE-003', 'teacher', NULL),
(195, '2023-09-24', 'TE-003', 'teacher', NULL),
(196, '2023-09-25', 'TE-003', 'teacher', NULL),
(197, '2023-09-26', 'TE-003', 'teacher', NULL),
(198, '2023-09-27', 'TE-003', 'teacher', NULL),
(199, '2023-09-28', 'TE-003', 'teacher', NULL),
(200, '2023-09-29', 'TE-003', 'teacher', NULL),
(201, '2023-09-30', 'TE-003', '', 'present'),
(202, '2023-09-02', 'TE-004', 'teacher', NULL),
(203, '2023-09-03', 'TE-004', 'teacher', NULL),
(204, '2023-09-04', 'TE-004', 'teacher', NULL),
(205, '2023-09-05', 'TE-004', 'teacher', NULL),
(206, '2023-09-06', 'TE-004', 'teacher', NULL),
(207, '2023-09-07', 'TE-004', 'teacher', NULL),
(208, '2023-09-08', 'TE-004', 'teacher', NULL),
(209, '2023-09-09', 'TE-004', 'teacher', NULL),
(210, '2023-09-10', 'TE-004', 'teacher', NULL),
(211, '2023-09-11', 'TE-004', 'teacher', NULL),
(212, '2023-09-12', 'TE-004', 'teacher', NULL),
(213, '2023-09-13', 'TE-004', 'teacher', NULL),
(214, '2023-09-14', 'TE-004', 'teacher', NULL),
(215, '2023-09-15', 'TE-004', 'teacher', NULL),
(216, '2023-09-16', 'TE-004', 'teacher', NULL),
(217, '2023-09-17', 'TE-004', 'teacher', NULL),
(218, '2023-09-18', 'TE-004', 'teacher', NULL),
(219, '2023-09-19', 'TE-004', 'teacher', NULL),
(220, '2023-09-20', 'TE-004', 'teacher', NULL),
(221, '2023-09-21', 'TE-004', 'teacher', NULL),
(222, '2023-09-22', 'TE-004', 'teacher', NULL),
(223, '2023-09-23', 'TE-004', 'teacher', NULL),
(224, '2023-09-24', 'TE-004', 'teacher', NULL),
(225, '2023-09-25', 'TE-004', 'teacher', NULL),
(226, '2023-09-26', 'TE-004', 'teacher', NULL),
(227, '2023-09-27', 'TE-004', 'teacher', NULL),
(228, '2023-09-28', 'TE-004', 'teacher', NULL),
(229, '2023-09-29', 'TE-004', 'teacher', NULL),
(230, '2023-09-30', 'TE-004', '', 'present'),
(231, '2023-09-02', 'TE-005', 'teacher', NULL),
(232, '2023-09-03', 'TE-005', 'teacher', NULL),
(233, '2023-09-04', 'TE-005', 'teacher', NULL),
(234, '2023-09-05', 'TE-005', 'teacher', NULL),
(235, '2023-09-06', 'TE-005', 'teacher', NULL),
(236, '2023-09-07', 'TE-005', 'teacher', NULL),
(237, '2023-09-08', 'TE-005', 'teacher', NULL),
(238, '2023-09-09', 'TE-005', 'teacher', NULL),
(239, '2023-09-10', 'TE-005', 'teacher', NULL),
(240, '2023-09-11', 'TE-005', 'teacher', NULL),
(241, '2023-09-12', 'TE-005', 'teacher', NULL),
(242, '2023-09-13', 'TE-005', 'teacher', NULL),
(243, '2023-09-14', 'TE-005', 'teacher', NULL),
(244, '2023-09-15', 'TE-005', 'teacher', NULL),
(245, '2023-09-16', 'TE-005', 'teacher', NULL),
(246, '2023-09-17', 'TE-005', 'teacher', NULL),
(247, '2023-09-18', 'TE-005', 'teacher', NULL),
(248, '2023-09-19', 'TE-005', 'teacher', NULL),
(249, '2023-09-20', 'TE-005', 'teacher', NULL),
(250, '2023-09-21', 'TE-005', 'teacher', NULL),
(251, '2023-09-22', 'TE-005', 'teacher', NULL),
(252, '2023-09-23', 'TE-005', 'teacher', NULL),
(253, '2023-09-24', 'TE-005', 'teacher', NULL),
(254, '2023-09-25', 'TE-005', 'teacher', NULL),
(255, '2023-09-26', 'TE-005', 'teacher', NULL),
(256, '2023-09-27', 'TE-005', 'teacher', NULL),
(257, '2023-09-28', 'TE-005', 'teacher', NULL),
(258, '2023-09-29', 'TE-005', 'teacher', NULL),
(259, '2023-09-30', 'TE-005', '', 'present'),
(260, '2023-09-09', 'TE-006', 'teacher', NULL),
(261, '2023-09-10', 'TE-006', 'teacher', NULL),
(262, '2023-09-11', 'TE-006', 'teacher', NULL),
(263, '2023-09-12', 'TE-006', 'teacher', NULL),
(264, '2023-09-13', 'TE-006', 'teacher', NULL),
(265, '2023-09-14', 'TE-006', 'teacher', NULL),
(266, '2023-09-15', 'TE-006', 'teacher', NULL),
(267, '2023-09-16', 'TE-006', 'teacher', NULL),
(268, '2023-09-17', 'TE-006', 'teacher', NULL),
(269, '2023-09-18', 'TE-006', 'teacher', NULL),
(270, '2023-09-19', 'TE-006', 'teacher', NULL),
(271, '2023-09-20', 'TE-006', 'teacher', NULL),
(272, '2023-09-21', 'TE-006', 'teacher', NULL),
(273, '2023-09-22', 'TE-006', 'teacher', NULL),
(274, '2023-09-23', 'TE-006', 'teacher', NULL),
(275, '2023-09-24', 'TE-006', 'teacher', NULL),
(276, '2023-09-25', 'TE-006', 'teacher', NULL),
(277, '2023-09-26', 'TE-006', 'teacher', NULL),
(278, '2023-09-27', 'TE-006', 'teacher', NULL),
(279, '2023-09-28', 'TE-006', 'teacher', NULL),
(280, '2023-09-29', 'TE-006', 'teacher', NULL),
(281, '2023-09-30', 'TE-006', '', 'present'),
(282, '2023-09-02', 'ST-001', 'student', NULL),
(283, '2023-09-03', 'ST-001', 'student', NULL),
(284, '2023-09-04', 'ST-001', 'student', NULL),
(285, '2023-09-05', 'ST-001', 'student', NULL),
(286, '2023-09-06', 'ST-001', 'student', NULL),
(287, '2023-09-07', 'ST-001', 'student', NULL),
(288, '2023-09-08', 'ST-001', 'student', NULL),
(289, '2023-09-09', 'ST-001', 'student', NULL),
(290, '2023-09-10', 'ST-001', 'student', NULL),
(291, '2023-09-11', 'ST-001', 'student', NULL),
(292, '2023-09-12', 'ST-001', 'student', NULL),
(293, '2023-09-13', 'ST-001', 'student', NULL),
(294, '2023-09-14', 'ST-001', 'student', NULL),
(295, '2023-09-15', 'ST-001', 'student', NULL),
(296, '2023-09-16', 'ST-001', 'student', NULL),
(297, '2023-09-17', 'ST-001', 'student', NULL),
(298, '2023-09-18', 'ST-001', 'student', NULL),
(299, '2023-09-19', 'ST-001', 'student', NULL),
(300, '2023-09-20', 'ST-001', 'student', NULL),
(301, '2023-09-21', 'ST-001', 'student', NULL),
(302, '2023-09-22', 'ST-001', 'student', NULL),
(303, '2023-09-23', 'ST-001', 'student', NULL),
(304, '2023-09-24', 'ST-001', 'student', NULL),
(305, '2023-09-25', 'ST-001', 'student', NULL),
(306, '2023-09-26', 'ST-001', 'student', NULL),
(307, '2023-09-27', 'ST-001', 'student', NULL),
(308, '2023-09-28', 'ST-001', 'student', NULL),
(309, '2023-09-29', 'ST-001', 'student', NULL),
(310, '2023-09-30', 'ST-001', '', 'present');

-- --------------------------------------------------------

--
-- Table structure for table `capstone_sched`
--

CREATE TABLE `capstone_sched` (
  `id` int(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `capstone_sched`
--

INSERT INTO `capstone_sched` (`id`, `date`, `time`, `course_id`, `class_id`) VALUES
(1, '2023-09-30', '14:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `room` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `room`, `section`) VALUES
(1, 'BSCS', '101', 'A'),
(2, 'BSCS', '102', 'A'),
(3, 'BSABE', '201', 'A'),
(4, 'BSABE', '202', 'B'),
(5, 'BSIT', '301', 'A'),
(6, 'BSIT', '302', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `code`, `name`) VALUES
(1, 'Math 03', 'linear algebra'),
(2, 'DCIT-26', 'Application Development and Visual Computing'),
(3, 'DCIT-65', 'Social and Professional Issues'),
(4, 'COSC75', 'Software Engineering II'),
(5, 'COSC85', 'Networks and Communication');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(255) NOT NULL,
  `uploader_Id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_dir` blob NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `grade`, `student_id`, `course_id`) VALUES
(1, 1, 'ST-001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` varchar(7) NOT NULL DEFAULT '0',
  `l_name` varchar(255) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `m_initial` varchar(2) NOT NULL,
  `phone_no` varchar(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `admission_date` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `city_municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `zip` int(4) NOT NULL,
  `sex` char(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `l_name`, `f_name`, `m_initial`, `phone_no`, `email`, `dob`, `admission_date`, `street`, `brgy`, `city_municipality`, `province`, `zip`, `sex`, `user_id`) VALUES
('ST-001', 'Doe', 'John', 'X', '1505625851', 'missingme@urs.edu.ph', '1983-09-04', '2023-09-01', 'random street', 'Bronx ', 'New York City', 'New York', 6969, 'M', 2),
('ST-007', 'Belmont', 'Trevor', 'B', '321523535', 'random3mail@gmail.com', '1993-10-01', '2023-10-01', 'J.Riz', 'west', 'Targoviste', 'Dâmbovița', 245, 'M', 0),
('ST-008', 'Tepes', 'Adrian', 'L', '1111111111', 'random13mail@gmail.com', '1973-10-09', '2023-10-05', 'Capt C. Nazareno', 'South', 'Targoviste', 'Dâmbovița', 245, 'M', 0),
('ST-009', 'Belnades', 'Sypha', 'A', '1111111345', 'random13mail!2@gmail.com', '1980-10-14', '2023-10-06', 'Gomez ', 'North', 'Targoviste', 'Dâmbovița', 245, 'F', 0),
('ST-010', 'Tepes', 'Vladimir', 'D', '1111321345', 'Castlevania13mail!2@gmail.com', '1820-11-23', '2023-10-06', 'Burgos ', 'North West', 'Targoviste', 'Dâmbovița', 245, 'M', 0),
('ST-011', 'Báthory ', 'Erzsebet ', 'W', '1119876345', 'GarfieDCat@gmail.com', '1850-12-30', '2023-10-10', 'Zamora ', 'South West', 'Alexandria', 'Alexandria', 2031, 'M', 0);

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `tg_student_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN
  INSERT INTO student_seq VALUES (NULL);
  SET NEW.id = CONCAT('ST-', LPAD(LAST_INSERT_ID(), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` int(255) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`id`, `student_id`, `course_id`) VALUES
(1, 'ST-001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_seq`
--

CREATE TABLE `student_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_seq`
--

INSERT INTO `student_seq` (`id`) VALUES
(1),
(7),
(8),
(9),
(10),
(11);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` varchar(7) NOT NULL DEFAULT '0',
  `l_name` varchar(255) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `m_initial` varchar(2) NOT NULL,
  `phone_no` int(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `hire_date` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `city_municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `zip` int(4) NOT NULL,
  `sex` char(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `l_name`, `f_name`, `m_initial`, `phone_no`, `email`, `dob`, `hire_date`, `street`, `brgy`, `city_municipality`, `province`, `zip`, `sex`, `user_id`) VALUES
('TE-001', 'Xavier', 'Charles', 'X.', 1505625851, 'xmentestemail@gmail.com', '1983-09-04', '2023-09-01', 'random street', 'Bronx ', 'New York City', 'New York', 6969, 'M', 3),
('TE-002', 'Shelby', 'Thomas Michael', 'A.', 1505625851, 'shelbyfamilylimited@gmail.com', '1993-09-04', '2023-09-01', 'powis street', 'random ', 'birmingham', 'England', 6969, 'M', 4),
('TE-003', 'Satoru', 'Gojo', 'M.', 1231456789, 'otaku69@yahoo.com', '1990-06-05', '2023-09-01', 'japan', 'nihon', 'Akihabara', 'Tokyo', 6969, 'M', 12),
('TE-004', 'Cat', 'Luna', 'D.', 1231456789, 'otaku69@yahoo.com', '1990-06-05', '2023-09-01', 'japan', 'nihon', 'Akihabara', 'Tokyo', 6969, 'F', 13),
('TE-005', 'Joestar', 'Joseph', 'D.', 1231456789, 'otaku69@yahoo.com', '1980-06-05', '2023-09-01', 'japan', 'nihon', 'Akihabara', 'Tokyoo', 6979, 'M', 14),
('TE-006', 'Nietzche', 'Fredrick', 'A.', 1231456789, 'philosopher@gmail.com', '1974-09-03', '2023-09-08', 'german street', 'west', 'Berlin City', 'Berlin', 2110, 'M', 15);

--
-- Triggers `teacher`
--
DELIMITER $$
CREATE TRIGGER `tg_teacher_insert` BEFORE INSERT ON `teacher` FOR EACH ROW BEGIN
  INSERT INTO teacher_seq VALUES (NULL);
  SET NEW.id = CONCAT('TE-', LPAD(LAST_INSERT_ID(), 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_courses`
--

CREATE TABLE `teacher_courses` (
  `id` int(255) NOT NULL,
  `teacher_id` varchar(255) NOT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher_courses`
--

INSERT INTO `teacher_courses` (`id`, `teacher_id`, `course_id`) VALUES
(1, 'TE-001', 1),
(2, 'TE-002', 4),
(3, 'TE-003', 5),
(4, 'TE-005', 3),
(5, 'TE-006', 2),
(6, 'TE-004', 5);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_seq`
--

CREATE TABLE `teacher_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher_seq`
--

INSERT INTO `teacher_seq` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'AD-001', '123'),
(2, 'ST-001', '123'),
(3, 'TE-001', '123'),
(4, 'TE-002', '123'),
(5, 'AD-002', '123'),
(6, 'AD-003', '123'),
(7, 'AD-004', '123'),
(8, 'AD-005', '123'),
(9, 'AD-006', '123'),
(10, 'AD-007', '123'),
(11, 'AD-008', '123'),
(12, 'TE-003', '123'),
(13, 'TE-004', '123'),
(14, 'TE-005', '123'),
(15, 'TE-006', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_seq`
--
ALTER TABLE `admin_seq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `capstone_sched`
--
ALTER TABLE `capstone_sched`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`course_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_seq`
--
ALTER TABLE `student_seq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `teacher_seq`
--
ALTER TABLE `teacher_seq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_seq`
--
ALTER TABLE `admin_seq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `capstone_sched`
--
ALTER TABLE `capstone_sched`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_seq`
--
ALTER TABLE `student_seq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teacher_seq`
--
ALTER TABLE `teacher_seq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `capstone_sched`
--
ALTER TABLE `capstone_sched`
  ADD CONSTRAINT `capstone_sched_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `capstone_sched_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `student_courses_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD CONSTRAINT `teacher_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `teacher_courses_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
