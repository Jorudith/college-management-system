-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2023 at 01:36 PM
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
  `phone no.` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `hire_date` date NOT NULL,
  `sex` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `l_name`, `f_name`, `m_initial`, `phone no.`, `email`, `dob`, `hire_date`, `sex`) VALUES
('AD-001', 'Doe', 'John', 'D', '1505625851', 'fovotiy760@urs.edu.ph', '1990-08-01', '2023-08-20', 'M'),
('AD-002', 'Forger', 'Llyod', 'M', '1505625851', 'random123@urs.edu.ph', '1980-08-01', '2023-09-01', 'M'),
('AD-003', 'Forger', 'Yor', 'A', '1553252352', 'randomemail312@urs.edu.ph', '1985-09-10', '2023-09-22', 'F'),
('AD-004', 'Philips', 'Trevor', 'B', '1231456789', 'randomizeemail@urs.edu.ph', '1973-03-01', '2023-09-27', 'M'),
('AD-005', 'De Santa', 'Michael', 'T', '1234567890', 'gta5@urs.edu.ph', '1973-09-13', '2023-09-20', 'M'),
('AD-006', 'Cat', 'Garfie', 'D', '1231456789', 'randomizeemail@urs.edu.ph', '1993-03-01', '2023-09-27', 'M'),
('AD-007', 'Pusa', 'Michael', 'D', '1234567890', 'gta5@urs.edu.ph', '1973-09-13', '2023-09-20', 'M'),
('AD-008', 'Hanma', 'Yujiro', 'A', '1234567890', 'gta5@urs.edu.ph', '1973-09-13', '2023-09-20', 'M');

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
(0, '2023-10-12', 'AD-001', 'admin', NULL),
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
(143, '2023-09-30', 'TE-001', '', NULL),
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
(172, '2023-09-30', 'TE-002', '', 'absent'),
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
(201, '2023-09-30', 'TE-003', '', 'absent'),
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
(230, '2023-09-30', 'TE-004', '', NULL),
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
(281, '2023-09-30', 'TE-006', '', NULL),
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
(310, '2023-09-30', 'ST-001', '', 'present'),
(311, '2023-10-01', 'AD-001', 'admin', 'absent'),
(312, '2023-10-01', 'AD-002', 'admin', 'absent'),
(313, '2023-10-01', 'AD-003', 'admin', 'absent'),
(314, '2023-10-01', 'AD-004', 'admin', 'present'),
(315, '2023-10-01', 'AD-005', 'admin', 'absent'),
(316, '2023-10-01', 'AD-006', 'admin', 'absent'),
(317, '2023-10-01', 'AD-007', 'admin', 'absent'),
(318, '2023-10-01', 'AD-008', 'admin', 'absent'),
(319, '2023-10-01', 'TE-001', 'teacher', 'present'),
(320, '2023-10-01', 'TE-002', 'teacher', NULL),
(321, '2023-10-01', 'TE-003', 'teacher', 'present'),
(322, '2023-10-01', 'TE-004', 'teacher', NULL),
(323, '2023-10-01', 'TE-005', 'teacher', NULL),
(324, '2023-10-01', 'TE-006', 'teacher', 'present'),
(325, '2023-10-01', 'ST-001', 'student', 'present'),
(326, '2023-10-02', 'AD-001', 'admin', NULL),
(327, '2023-10-03', 'AD-001', 'admin', NULL),
(328, '2023-10-04', 'AD-001', 'admin', NULL),
(329, '2023-10-05', 'AD-001', 'admin', NULL),
(330, '2023-10-02', 'AD-002', 'admin', NULL),
(331, '2023-10-03', 'AD-002', 'admin', NULL),
(332, '2023-10-04', 'AD-002', 'admin', NULL),
(333, '2023-10-05', 'AD-002', 'admin', NULL),
(334, '2023-10-02', 'AD-003', 'admin', NULL),
(335, '2023-10-03', 'AD-003', 'admin', NULL),
(336, '2023-10-04', 'AD-003', 'admin', NULL),
(337, '2023-10-05', 'AD-003', 'admin', NULL),
(338, '2023-10-02', 'AD-004', 'admin', NULL),
(339, '2023-10-03', 'AD-004', 'admin', NULL),
(340, '2023-10-04', 'AD-004', 'admin', NULL),
(341, '2023-10-05', 'AD-004', 'admin', NULL),
(342, '2023-10-02', 'AD-005', 'admin', NULL),
(343, '2023-10-03', 'AD-005', 'admin', NULL),
(344, '2023-10-04', 'AD-005', 'admin', NULL),
(345, '2023-10-05', 'AD-005', 'admin', NULL),
(346, '2023-10-02', 'AD-006', 'admin', NULL),
(347, '2023-10-03', 'AD-006', 'admin', NULL),
(348, '2023-10-04', 'AD-006', 'admin', NULL),
(349, '2023-10-05', 'AD-006', 'admin', NULL),
(350, '2023-10-02', 'AD-007', 'admin', NULL),
(351, '2023-10-03', 'AD-007', 'admin', NULL),
(352, '2023-10-04', 'AD-007', 'admin', NULL),
(353, '2023-10-05', 'AD-007', 'admin', NULL),
(354, '2023-10-02', 'AD-008', 'admin', NULL),
(355, '2023-10-03', 'AD-008', 'admin', NULL),
(356, '2023-10-04', 'AD-008', 'admin', NULL),
(357, '2023-10-05', 'AD-008', 'admin', NULL),
(358, '2023-10-02', 'TE-001', 'teacher', NULL),
(359, '2023-10-03', 'TE-001', 'teacher', NULL),
(360, '2023-10-04', 'TE-001', 'teacher', NULL),
(361, '2023-10-05', 'TE-001', 'teacher', 'absent'),
(362, '2023-10-02', 'TE-002', 'teacher', NULL),
(363, '2023-10-03', 'TE-002', 'teacher', NULL),
(364, '2023-10-04', 'TE-002', 'teacher', NULL),
(365, '2023-10-05', 'TE-002', 'teacher', 'absent'),
(366, '2023-10-02', 'TE-003', 'teacher', NULL),
(367, '2023-10-03', 'TE-003', 'teacher', NULL),
(368, '2023-10-04', 'TE-003', 'teacher', NULL),
(369, '2023-10-05', 'TE-003', 'teacher', 'absent'),
(370, '2023-10-02', 'TE-004', 'teacher', NULL),
(371, '2023-10-03', 'TE-004', 'teacher', NULL),
(372, '2023-10-04', 'TE-004', 'teacher', NULL),
(373, '2023-10-05', 'TE-004', 'teacher', 'absent'),
(374, '2023-10-02', 'TE-005', 'teacher', NULL),
(375, '2023-10-03', 'TE-005', 'teacher', NULL),
(376, '2023-10-04', 'TE-005', 'teacher', NULL),
(377, '2023-10-05', 'TE-005', 'teacher', 'absent'),
(378, '2023-10-02', 'TE-006', 'teacher', NULL),
(379, '2023-10-03', 'TE-006', 'teacher', NULL),
(380, '2023-10-04', 'TE-006', 'teacher', NULL),
(381, '2023-10-05', 'TE-006', 'teacher', 'absent'),
(382, '2023-10-02', 'ST-001', 'student', NULL),
(383, '2023-10-03', 'ST-001', 'student', NULL),
(384, '2023-10-04', 'ST-001', 'student', NULL),
(385, '2023-10-05', 'ST-001', 'student', NULL),
(386, '2023-10-06', 'AD-001', 'admin', NULL),
(387, '2023-10-07', 'AD-001', 'admin', NULL),
(388, '2023-10-08', 'AD-001', 'admin', NULL),
(389, '2023-10-09', 'AD-001', 'admin', NULL),
(390, '2023-10-10', 'AD-001', 'admin', NULL),
(391, '2023-10-11', 'AD-001', 'admin', NULL),
(392, '2023-10-06', 'AD-002', 'admin', NULL),
(393, '2023-10-07', 'AD-002', 'admin', NULL),
(394, '2023-10-08', 'AD-002', 'admin', NULL),
(395, '2023-10-09', 'AD-002', 'admin', NULL),
(396, '2023-10-10', 'AD-002', 'admin', NULL),
(397, '2023-10-11', 'AD-002', 'admin', NULL),
(398, '2023-10-06', 'AD-003', 'admin', NULL),
(399, '2023-10-07', 'AD-003', 'admin', NULL),
(400, '2023-10-08', 'AD-003', 'admin', NULL),
(401, '2023-10-09', 'AD-003', 'admin', NULL),
(402, '2023-10-10', 'AD-003', 'admin', NULL),
(403, '2023-10-11', 'AD-003', 'admin', NULL),
(404, '2023-10-06', 'AD-004', 'admin', NULL),
(405, '2023-10-07', 'AD-004', 'admin', NULL),
(406, '2023-10-08', 'AD-004', 'admin', NULL),
(407, '2023-10-09', 'AD-004', 'admin', NULL),
(408, '2023-10-10', 'AD-004', 'admin', NULL),
(409, '2023-10-11', 'AD-004', 'admin', NULL),
(410, '2023-10-06', 'AD-005', 'admin', NULL),
(411, '2023-10-07', 'AD-005', 'admin', NULL),
(412, '2023-10-08', 'AD-005', 'admin', NULL),
(413, '2023-10-09', 'AD-005', 'admin', NULL),
(414, '2023-10-10', 'AD-005', 'admin', NULL),
(415, '2023-10-11', 'AD-005', 'admin', NULL),
(416, '2023-10-06', 'AD-006', 'admin', NULL),
(417, '2023-10-07', 'AD-006', 'admin', NULL),
(418, '2023-10-08', 'AD-006', 'admin', NULL),
(419, '2023-10-09', 'AD-006', 'admin', NULL),
(420, '2023-10-10', 'AD-006', 'admin', NULL),
(421, '2023-10-11', 'AD-006', 'admin', NULL),
(422, '2023-10-06', 'AD-007', 'admin', NULL),
(423, '2023-10-07', 'AD-007', 'admin', NULL),
(424, '2023-10-08', 'AD-007', 'admin', NULL),
(425, '2023-10-09', 'AD-007', 'admin', NULL),
(426, '2023-10-10', 'AD-007', 'admin', NULL),
(427, '2023-10-11', 'AD-007', 'admin', NULL),
(428, '2023-10-06', 'AD-008', 'admin', NULL),
(429, '2023-10-07', 'AD-008', 'admin', NULL),
(430, '2023-10-08', 'AD-008', 'admin', NULL),
(431, '2023-10-09', 'AD-008', 'admin', NULL),
(432, '2023-10-10', 'AD-008', 'admin', NULL),
(433, '2023-10-11', 'AD-008', 'admin', NULL),
(434, '2023-10-06', 'TE-001', 'teacher', NULL),
(435, '2023-10-07', 'TE-001', 'teacher', NULL),
(436, '2023-10-08', 'TE-001', 'teacher', NULL),
(437, '2023-10-09', 'TE-001', 'teacher', NULL),
(438, '2023-10-10', 'TE-001', 'teacher', NULL),
(439, '2023-10-11', 'TE-001', 'teacher', NULL),
(440, '2023-10-06', 'TE-002', 'teacher', NULL),
(441, '2023-10-07', 'TE-002', 'teacher', NULL),
(442, '2023-10-08', 'TE-002', 'teacher', NULL),
(443, '2023-10-09', 'TE-002', 'teacher', NULL),
(444, '2023-10-10', 'TE-002', 'teacher', NULL),
(445, '2023-10-11', 'TE-002', 'teacher', NULL),
(446, '2023-10-06', 'TE-003', 'teacher', NULL),
(447, '2023-10-07', 'TE-003', 'teacher', NULL),
(448, '2023-10-08', 'TE-003', 'teacher', NULL),
(449, '2023-10-09', 'TE-003', 'teacher', NULL),
(450, '2023-10-10', 'TE-003', 'teacher', NULL),
(451, '2023-10-11', 'TE-003', 'teacher', NULL),
(452, '2023-10-06', 'TE-004', 'teacher', NULL),
(453, '2023-10-07', 'TE-004', 'teacher', NULL),
(454, '2023-10-08', 'TE-004', 'teacher', NULL),
(455, '2023-10-09', 'TE-004', 'teacher', NULL),
(456, '2023-10-10', 'TE-004', 'teacher', NULL),
(457, '2023-10-11', 'TE-004', 'teacher', NULL),
(458, '2023-10-06', 'TE-005', 'teacher', NULL),
(459, '2023-10-07', 'TE-005', 'teacher', NULL),
(460, '2023-10-08', 'TE-005', 'teacher', NULL),
(461, '2023-10-09', 'TE-005', 'teacher', NULL),
(462, '2023-10-10', 'TE-005', 'teacher', NULL),
(463, '2023-10-11', 'TE-005', 'teacher', NULL),
(464, '2023-10-06', 'TE-006', 'teacher', NULL),
(465, '2023-10-07', 'TE-006', 'teacher', NULL),
(466, '2023-10-08', 'TE-006', 'teacher', NULL),
(467, '2023-10-09', 'TE-006', 'teacher', NULL),
(468, '2023-10-10', 'TE-006', 'teacher', NULL),
(469, '2023-10-11', 'TE-006', 'teacher', NULL),
(470, '2023-10-06', 'ST-001', 'student', NULL),
(471, '2023-10-07', 'ST-001', 'student', NULL),
(472, '2023-10-08', 'ST-001', 'student', NULL),
(473, '2023-10-09', 'ST-001', 'student', NULL),
(474, '2023-10-10', 'ST-001', 'student', NULL),
(475, '2023-10-11', 'ST-001', 'student', NULL),
(476, '2023-10-13', 'AD-001', 'admin', NULL),
(477, '2023-10-12', 'AD-002', 'admin', NULL),
(478, '2023-10-13', 'AD-002', 'admin', NULL),
(479, '2023-10-12', 'AD-003', 'admin', NULL),
(480, '2023-10-13', 'AD-003', 'admin', NULL),
(481, '2023-10-12', 'AD-004', 'admin', NULL),
(482, '2023-10-13', 'AD-004', 'admin', NULL),
(483, '2023-10-12', 'AD-005', 'admin', NULL),
(484, '2023-10-13', 'AD-005', 'admin', NULL),
(485, '2023-10-12', 'AD-006', 'admin', NULL),
(486, '2023-10-13', 'AD-006', 'admin', NULL),
(487, '2023-10-12', 'AD-007', 'admin', NULL),
(488, '2023-10-13', 'AD-007', 'admin', NULL),
(489, '2023-10-12', 'AD-008', 'admin', NULL),
(490, '2023-10-13', 'AD-008', 'admin', NULL),
(491, '2023-10-12', 'TE-001', 'teacher', NULL),
(492, '2023-10-13', 'TE-001', 'teacher', NULL),
(493, '2023-10-12', 'TE-002', 'teacher', NULL),
(494, '2023-10-13', 'TE-002', 'teacher', NULL),
(495, '2023-10-12', 'TE-003', 'teacher', NULL),
(496, '2023-10-13', 'TE-003', 'teacher', NULL),
(497, '2023-10-12', 'TE-004', 'teacher', NULL),
(498, '2023-10-13', 'TE-004', 'teacher', NULL),
(499, '2023-10-12', 'TE-005', 'teacher', NULL),
(500, '2023-10-13', 'TE-005', 'teacher', NULL),
(501, '2023-10-12', 'TE-006', 'teacher', NULL),
(502, '2023-10-13', 'TE-006', 'teacher', NULL),
(503, '2023-10-12', 'ST-001', 'student', NULL),
(504, '2023-10-13', 'ST-001', 'student', NULL),
(505, '2023-10-07', 'ST-006', 'student', NULL),
(506, '2023-10-08', 'ST-006', 'student', NULL),
(507, '2023-10-09', 'ST-006', 'student', NULL),
(508, '2023-10-10', 'ST-006', 'student', NULL),
(509, '2023-10-11', 'ST-006', 'student', NULL),
(510, '2023-10-12', 'ST-006', 'student', NULL),
(511, '2023-10-13', 'ST-006', 'student', NULL),
(512, '2023-10-07', 'ST-007', 'student', NULL),
(513, '2023-10-08', 'ST-007', 'student', NULL),
(514, '2023-10-09', 'ST-007', 'student', NULL),
(515, '2023-10-10', 'ST-007', 'student', NULL),
(516, '2023-10-11', 'ST-007', 'student', NULL),
(517, '2023-10-12', 'ST-007', 'student', NULL),
(518, '2023-10-13', 'ST-007', 'student', NULL),
(519, '2023-10-11', 'ST-008', 'student', NULL),
(520, '2023-10-12', 'ST-008', 'student', NULL),
(521, '2023-10-13', 'ST-008', 'student', NULL),
(522, '2023-10-12', 'ST-009', 'student', NULL),
(523, '2023-10-13', 'ST-009', 'student', NULL),
(524, '2023-10-05', 'ST-010', 'student', NULL),
(525, '2023-10-06', 'ST-010', 'student', NULL),
(526, '2023-10-07', 'ST-010', 'student', NULL),
(527, '2023-10-08', 'ST-010', 'student', NULL),
(528, '2023-10-09', 'ST-010', 'student', NULL),
(529, '2023-10-10', 'ST-010', 'student', NULL),
(530, '2023-10-11', 'ST-010', 'student', NULL),
(531, '2023-10-12', 'ST-010', 'student', NULL),
(532, '2023-10-13', 'ST-010', 'student', NULL),
(533, '2023-10-04', 'ST-011', 'student', NULL),
(534, '2023-10-05', 'ST-011', 'student', NULL),
(535, '2023-10-06', 'ST-011', 'student', NULL),
(536, '2023-10-07', 'ST-011', 'student', NULL),
(537, '2023-10-08', 'ST-011', 'student', NULL),
(538, '2023-10-09', 'ST-011', 'student', NULL),
(539, '2023-10-10', 'ST-011', 'student', NULL),
(540, '2023-10-11', 'ST-011', 'student', NULL),
(541, '2023-10-12', 'ST-011', 'student', NULL),
(542, '2023-10-13', 'ST-011', 'student', NULL),
(543, '2023-10-12', 'ST-012', 'student', NULL),
(544, '2023-10-13', 'ST-012', 'student', NULL),
(545, '2023-10-14', 'AD-001', 'admin', NULL),
(546, '2023-10-14', 'AD-002', 'admin', NULL),
(547, '2023-10-14', 'AD-003', 'admin', NULL),
(548, '2023-10-14', 'AD-004', 'admin', NULL),
(549, '2023-10-14', 'AD-005', 'admin', NULL),
(550, '2023-10-14', 'AD-006', 'admin', NULL),
(551, '2023-10-14', 'AD-007', 'admin', NULL),
(552, '2023-10-14', 'AD-008', 'admin', NULL),
(553, '2023-10-14', 'TE-001', 'teacher', NULL),
(554, '2023-10-14', 'TE-002', 'teacher', NULL),
(555, '2023-10-14', 'TE-003', 'teacher', NULL),
(556, '2023-10-14', 'TE-004', 'teacher', NULL),
(557, '2023-10-14', 'TE-005', 'teacher', NULL),
(558, '2023-10-14', 'TE-006', 'teacher', NULL),
(559, '2023-10-14', 'ST-001', 'student', 'present'),
(560, '2023-10-14', 'ST-006', 'student', 'present'),
(561, '2023-10-14', 'ST-007', 'student', 'present'),
(562, '2023-10-14', 'ST-008', 'student', 'present'),
(563, '2023-10-14', 'ST-009', 'student', 'present'),
(564, '2023-10-14', 'ST-010', 'student', 'present'),
(565, '2023-10-14', 'ST-011', 'student', 'present'),
(566, '2023-10-14', 'ST-012', 'student', 'present'),
(567, '2023-10-15', 'AD-001', 'admin', NULL),
(568, '2023-10-15', 'AD-002', 'admin', NULL),
(569, '2023-10-15', 'AD-003', 'admin', NULL),
(570, '2023-10-15', 'AD-004', 'admin', NULL),
(571, '2023-10-15', 'AD-005', 'admin', NULL),
(572, '2023-10-15', 'AD-006', 'admin', NULL),
(573, '2023-10-15', 'AD-007', 'admin', NULL),
(574, '2023-10-15', 'AD-008', 'admin', NULL),
(575, '2023-10-15', 'TE-001', 'teacher', NULL),
(576, '2023-10-15', 'TE-002', 'teacher', NULL),
(577, '2023-10-15', 'TE-003', 'teacher', NULL),
(578, '2023-10-15', 'TE-004', 'teacher', NULL),
(579, '2023-10-15', 'TE-005', 'teacher', NULL),
(580, '2023-10-15', 'TE-006', 'teacher', NULL),
(581, '2023-10-15', 'ST-001', 'student', NULL),
(582, '2023-10-15', 'ST-006', 'student', NULL),
(583, '2023-10-15', 'ST-007', 'student', NULL),
(584, '2023-10-15', 'ST-008', 'student', NULL),
(585, '2023-10-15', 'ST-009', 'student', NULL),
(586, '2023-10-15', 'ST-010', 'student', NULL),
(587, '2023-10-15', 'ST-011', 'student', NULL),
(588, '2023-10-15', 'ST-012', 'student', NULL),
(589, '2023-09-19', 'ST-013', 'student', NULL),
(590, '2023-09-20', 'ST-013', 'student', NULL),
(591, '2023-09-21', 'ST-013', 'student', NULL),
(592, '2023-09-22', 'ST-013', 'student', NULL),
(593, '2023-09-23', 'ST-013', 'student', NULL),
(594, '2023-09-24', 'ST-013', 'student', NULL),
(595, '2023-09-25', 'ST-013', 'student', NULL),
(596, '2023-09-26', 'ST-013', 'student', NULL),
(597, '2023-09-27', 'ST-013', 'student', NULL),
(598, '2023-09-28', 'ST-013', 'student', NULL),
(599, '2023-09-29', 'ST-013', 'student', NULL),
(600, '2023-09-30', 'ST-013', 'student', NULL),
(601, '2023-10-01', 'ST-013', 'student', NULL),
(602, '2023-10-02', 'ST-013', 'student', NULL),
(603, '2023-10-03', 'ST-013', 'student', NULL),
(604, '2023-10-04', 'ST-013', 'student', NULL),
(605, '2023-10-05', 'ST-013', 'student', NULL),
(606, '2023-10-06', 'ST-013', 'student', NULL),
(607, '2023-10-07', 'ST-013', 'student', NULL),
(608, '2023-10-08', 'ST-013', 'student', NULL),
(609, '2023-10-09', 'ST-013', 'student', NULL),
(610, '2023-10-10', 'ST-013', 'student', NULL),
(611, '2023-10-11', 'ST-013', 'student', NULL),
(612, '2023-10-12', 'ST-013', 'student', NULL),
(613, '2023-10-13', 'ST-013', 'student', NULL),
(614, '2023-10-14', 'ST-013', 'student', NULL),
(615, '2023-10-15', 'ST-013', 'student', NULL),
(616, '2021-09-19', 'ST-014', 'student', NULL),
(617, '2021-09-20', 'ST-014', 'student', NULL),
(618, '2021-09-21', 'ST-014', 'student', NULL),
(619, '2021-09-22', 'ST-014', 'student', NULL),
(620, '2021-09-23', 'ST-014', 'student', NULL),
(621, '2021-09-24', 'ST-014', 'student', NULL),
(622, '2021-09-25', 'ST-014', 'student', NULL),
(623, '2021-09-26', 'ST-014', 'student', NULL),
(624, '2021-09-27', 'ST-014', 'student', NULL),
(625, '2021-09-28', 'ST-014', 'student', NULL),
(626, '2021-09-29', 'ST-014', 'student', NULL),
(627, '2021-09-30', 'ST-014', 'student', NULL),
(628, '2021-10-01', 'ST-014', 'student', NULL),
(629, '2021-10-02', 'ST-014', 'student', NULL),
(630, '2021-10-03', 'ST-014', 'student', NULL),
(631, '2021-10-04', 'ST-014', 'student', NULL),
(632, '2021-10-05', 'ST-014', 'student', NULL),
(633, '2021-10-06', 'ST-014', 'student', NULL),
(634, '2021-10-07', 'ST-014', 'student', NULL),
(635, '2021-10-08', 'ST-014', 'student', NULL),
(636, '2021-10-09', 'ST-014', 'student', NULL),
(637, '2021-10-10', 'ST-014', 'student', NULL),
(638, '2021-10-11', 'ST-014', 'student', NULL),
(639, '2021-10-12', 'ST-014', 'student', NULL),
(640, '2021-10-13', 'ST-014', 'student', NULL),
(641, '2021-10-14', 'ST-014', 'student', NULL),
(642, '2021-10-15', 'ST-014', 'student', NULL),
(643, '2021-10-16', 'ST-014', 'student', NULL),
(644, '2021-10-17', 'ST-014', 'student', NULL),
(645, '2021-10-18', 'ST-014', 'student', NULL),
(646, '2021-10-19', 'ST-014', 'student', NULL),
(647, '2021-10-20', 'ST-014', 'student', NULL),
(648, '2021-10-21', 'ST-014', 'student', NULL),
(649, '2021-10-22', 'ST-014', 'student', NULL),
(650, '2021-10-23', 'ST-014', 'student', NULL),
(651, '2021-10-24', 'ST-014', 'student', NULL),
(652, '2021-10-25', 'ST-014', 'student', NULL),
(653, '2021-10-26', 'ST-014', 'student', NULL),
(654, '2021-10-27', 'ST-014', 'student', NULL),
(655, '2021-10-28', 'ST-014', 'student', NULL),
(656, '2021-10-29', 'ST-014', 'student', NULL),
(657, '2021-10-30', 'ST-014', 'student', NULL),
(658, '2021-10-31', 'ST-014', 'student', NULL),
(659, '2021-11-01', 'ST-014', 'student', NULL),
(660, '2021-11-02', 'ST-014', 'student', NULL),
(661, '2021-11-03', 'ST-014', 'student', NULL),
(662, '2021-11-04', 'ST-014', 'student', NULL),
(663, '2021-11-05', 'ST-014', 'student', NULL),
(664, '2021-11-06', 'ST-014', 'student', NULL),
(665, '2021-11-07', 'ST-014', 'student', NULL),
(666, '2021-11-08', 'ST-014', 'student', NULL),
(667, '2021-11-09', 'ST-014', 'student', NULL),
(668, '2021-11-10', 'ST-014', 'student', NULL),
(669, '2021-11-11', 'ST-014', 'student', NULL),
(670, '2021-11-12', 'ST-014', 'student', NULL),
(671, '2021-11-13', 'ST-014', 'student', NULL),
(672, '2021-11-14', 'ST-014', 'student', NULL),
(673, '2021-11-15', 'ST-014', 'student', NULL),
(674, '2021-11-16', 'ST-014', 'student', NULL),
(675, '2021-11-17', 'ST-014', 'student', NULL),
(676, '2021-11-18', 'ST-014', 'student', NULL),
(677, '2021-11-19', 'ST-014', 'student', NULL),
(678, '2021-11-20', 'ST-014', 'student', NULL),
(679, '2021-11-21', 'ST-014', 'student', NULL),
(680, '2021-11-22', 'ST-014', 'student', NULL),
(681, '2021-11-23', 'ST-014', 'student', NULL),
(682, '2021-11-24', 'ST-014', 'student', NULL),
(683, '2021-11-25', 'ST-014', 'student', NULL),
(684, '2021-11-26', 'ST-014', 'student', NULL),
(685, '2021-11-27', 'ST-014', 'student', NULL),
(686, '2021-11-28', 'ST-014', 'student', NULL),
(687, '2021-11-29', 'ST-014', 'student', NULL),
(688, '2021-11-30', 'ST-014', 'student', NULL),
(689, '2021-12-01', 'ST-014', 'student', NULL),
(690, '2021-12-02', 'ST-014', 'student', NULL),
(691, '2021-12-03', 'ST-014', 'student', NULL),
(692, '2021-12-04', 'ST-014', 'student', NULL),
(693, '2021-12-05', 'ST-014', 'student', NULL),
(694, '2021-12-06', 'ST-014', 'student', NULL),
(695, '2021-12-07', 'ST-014', 'student', NULL),
(696, '2021-12-08', 'ST-014', 'student', NULL),
(697, '2021-12-09', 'ST-014', 'student', NULL),
(698, '2021-12-10', 'ST-014', 'student', NULL),
(699, '2021-12-11', 'ST-014', 'student', NULL),
(700, '2021-12-12', 'ST-014', 'student', NULL),
(701, '2021-12-13', 'ST-014', 'student', NULL),
(702, '2021-12-14', 'ST-014', 'student', NULL),
(703, '2021-12-15', 'ST-014', 'student', NULL),
(704, '2021-12-16', 'ST-014', 'student', NULL),
(705, '2021-12-17', 'ST-014', 'student', NULL),
(706, '2021-12-18', 'ST-014', 'student', NULL),
(707, '2021-12-19', 'ST-014', 'student', NULL),
(708, '2021-12-20', 'ST-014', 'student', NULL),
(709, '2021-12-21', 'ST-014', 'student', NULL),
(710, '2021-12-22', 'ST-014', 'student', NULL),
(711, '2021-12-23', 'ST-014', 'student', NULL),
(712, '2021-12-24', 'ST-014', 'student', NULL),
(713, '2021-12-25', 'ST-014', 'student', NULL),
(714, '2021-12-26', 'ST-014', 'student', NULL),
(715, '2021-12-27', 'ST-014', 'student', NULL),
(716, '2021-12-28', 'ST-014', 'student', NULL),
(717, '2021-12-29', 'ST-014', 'student', NULL),
(718, '2021-12-30', 'ST-014', 'student', NULL),
(719, '2021-12-31', 'ST-014', 'student', NULL),
(720, '2022-01-01', 'ST-014', 'student', NULL),
(721, '2022-01-02', 'ST-014', 'student', NULL),
(722, '2022-01-03', 'ST-014', 'student', NULL),
(723, '2022-01-04', 'ST-014', 'student', NULL),
(724, '2022-01-05', 'ST-014', 'student', NULL),
(725, '2022-01-06', 'ST-014', 'student', NULL),
(726, '2022-01-07', 'ST-014', 'student', NULL),
(727, '2022-01-08', 'ST-014', 'student', NULL),
(728, '2022-01-09', 'ST-014', 'student', NULL),
(729, '2022-01-10', 'ST-014', 'student', NULL),
(730, '2022-01-11', 'ST-014', 'student', NULL),
(731, '2022-01-12', 'ST-014', 'student', NULL),
(732, '2022-01-13', 'ST-014', 'student', NULL),
(733, '2022-01-14', 'ST-014', 'student', NULL),
(734, '2022-01-15', 'ST-014', 'student', NULL),
(735, '2022-01-16', 'ST-014', 'student', NULL),
(736, '2022-01-17', 'ST-014', 'student', NULL),
(737, '2022-01-18', 'ST-014', 'student', NULL),
(738, '2022-01-19', 'ST-014', 'student', NULL),
(739, '2022-01-20', 'ST-014', 'student', NULL),
(740, '2022-01-21', 'ST-014', 'student', NULL),
(741, '2022-01-22', 'ST-014', 'student', NULL),
(742, '2022-01-23', 'ST-014', 'student', NULL),
(743, '2022-01-24', 'ST-014', 'student', NULL),
(744, '2022-01-25', 'ST-014', 'student', NULL),
(745, '2022-01-26', 'ST-014', 'student', NULL),
(746, '2022-01-27', 'ST-014', 'student', NULL),
(747, '2022-01-28', 'ST-014', 'student', NULL),
(748, '2022-01-29', 'ST-014', 'student', NULL),
(749, '2022-01-30', 'ST-014', 'student', NULL),
(750, '2022-01-31', 'ST-014', 'student', NULL),
(751, '2022-02-01', 'ST-014', 'student', NULL),
(752, '2022-02-02', 'ST-014', 'student', NULL),
(753, '2022-02-03', 'ST-014', 'student', NULL),
(754, '2022-02-04', 'ST-014', 'student', NULL),
(755, '2022-02-05', 'ST-014', 'student', NULL),
(756, '2022-02-06', 'ST-014', 'student', NULL),
(757, '2022-02-07', 'ST-014', 'student', NULL),
(758, '2022-02-08', 'ST-014', 'student', NULL),
(759, '2022-02-09', 'ST-014', 'student', NULL),
(760, '2022-02-10', 'ST-014', 'student', NULL),
(761, '2022-02-11', 'ST-014', 'student', NULL),
(762, '2022-02-12', 'ST-014', 'student', NULL),
(763, '2022-02-13', 'ST-014', 'student', NULL),
(764, '2022-02-14', 'ST-014', 'student', NULL),
(765, '2022-02-15', 'ST-014', 'student', NULL),
(766, '2022-02-16', 'ST-014', 'student', NULL),
(767, '2022-02-17', 'ST-014', 'student', NULL),
(768, '2022-02-18', 'ST-014', 'student', NULL),
(769, '2022-02-19', 'ST-014', 'student', NULL),
(770, '2022-02-20', 'ST-014', 'student', NULL),
(771, '2022-02-21', 'ST-014', 'student', NULL),
(772, '2022-02-22', 'ST-014', 'student', NULL),
(773, '2022-02-23', 'ST-014', 'student', NULL),
(774, '2022-02-24', 'ST-014', 'student', NULL),
(775, '2022-02-25', 'ST-014', 'student', NULL),
(776, '2022-02-26', 'ST-014', 'student', NULL),
(777, '2022-02-27', 'ST-014', 'student', NULL),
(778, '2022-02-28', 'ST-014', 'student', NULL),
(779, '2022-03-01', 'ST-014', 'student', NULL),
(780, '2022-03-02', 'ST-014', 'student', NULL),
(781, '2022-03-03', 'ST-014', 'student', NULL),
(782, '2022-03-04', 'ST-014', 'student', NULL),
(783, '2022-03-05', 'ST-014', 'student', NULL),
(784, '2022-03-06', 'ST-014', 'student', NULL),
(785, '2022-03-07', 'ST-014', 'student', NULL),
(786, '2022-03-08', 'ST-014', 'student', NULL),
(787, '2022-03-09', 'ST-014', 'student', NULL),
(788, '2022-03-10', 'ST-014', 'student', NULL),
(789, '2022-03-11', 'ST-014', 'student', NULL),
(790, '2022-03-12', 'ST-014', 'student', NULL),
(791, '2022-03-13', 'ST-014', 'student', NULL),
(792, '2022-03-14', 'ST-014', 'student', NULL),
(793, '2022-03-15', 'ST-014', 'student', NULL),
(794, '2022-03-16', 'ST-014', 'student', NULL),
(795, '2022-03-17', 'ST-014', 'student', NULL),
(796, '2022-03-18', 'ST-014', 'student', NULL),
(797, '2022-03-19', 'ST-014', 'student', NULL),
(798, '2022-03-20', 'ST-014', 'student', NULL),
(799, '2022-03-21', 'ST-014', 'student', NULL),
(800, '2022-03-22', 'ST-014', 'student', NULL),
(801, '2022-03-23', 'ST-014', 'student', NULL),
(802, '2022-03-24', 'ST-014', 'student', NULL),
(803, '2022-03-25', 'ST-014', 'student', NULL),
(804, '2022-03-26', 'ST-014', 'student', NULL),
(805, '2022-03-27', 'ST-014', 'student', NULL),
(806, '2022-03-28', 'ST-014', 'student', NULL),
(807, '2022-03-29', 'ST-014', 'student', NULL),
(808, '2022-03-30', 'ST-014', 'student', NULL),
(809, '2022-03-31', 'ST-014', 'student', NULL),
(810, '2022-04-01', 'ST-014', 'student', NULL),
(811, '2022-04-02', 'ST-014', 'student', NULL),
(812, '2022-04-03', 'ST-014', 'student', NULL),
(813, '2022-04-04', 'ST-014', 'student', NULL),
(814, '2022-04-05', 'ST-014', 'student', NULL),
(815, '2022-04-06', 'ST-014', 'student', NULL),
(816, '2022-04-07', 'ST-014', 'student', NULL),
(817, '2022-04-08', 'ST-014', 'student', NULL),
(818, '2022-04-09', 'ST-014', 'student', NULL),
(819, '2022-04-10', 'ST-014', 'student', NULL),
(820, '2022-04-11', 'ST-014', 'student', NULL),
(821, '2022-04-12', 'ST-014', 'student', NULL),
(822, '2022-04-13', 'ST-014', 'student', NULL),
(823, '2022-04-14', 'ST-014', 'student', NULL),
(824, '2022-04-15', 'ST-014', 'student', NULL),
(825, '2022-04-16', 'ST-014', 'student', NULL),
(826, '2022-04-17', 'ST-014', 'student', NULL),
(827, '2022-04-18', 'ST-014', 'student', NULL),
(828, '2022-04-19', 'ST-014', 'student', NULL),
(829, '2022-04-20', 'ST-014', 'student', NULL),
(830, '2022-04-21', 'ST-014', 'student', NULL),
(831, '2022-04-22', 'ST-014', 'student', NULL),
(832, '2022-04-23', 'ST-014', 'student', NULL),
(833, '2022-04-24', 'ST-014', 'student', NULL),
(834, '2022-04-25', 'ST-014', 'student', NULL),
(835, '2022-04-26', 'ST-014', 'student', NULL),
(836, '2022-04-27', 'ST-014', 'student', NULL),
(837, '2022-04-28', 'ST-014', 'student', NULL),
(838, '2022-04-29', 'ST-014', 'student', NULL),
(839, '2022-04-30', 'ST-014', 'student', NULL),
(840, '2022-05-01', 'ST-014', 'student', NULL),
(841, '2022-05-02', 'ST-014', 'student', NULL),
(842, '2022-05-03', 'ST-014', 'student', NULL),
(843, '2022-05-04', 'ST-014', 'student', NULL),
(844, '2022-05-05', 'ST-014', 'student', NULL),
(845, '2022-05-06', 'ST-014', 'student', NULL),
(846, '2022-05-07', 'ST-014', 'student', NULL),
(847, '2022-05-08', 'ST-014', 'student', NULL),
(848, '2022-05-09', 'ST-014', 'student', NULL),
(849, '2022-05-10', 'ST-014', 'student', NULL),
(850, '2022-05-11', 'ST-014', 'student', NULL),
(851, '2022-05-12', 'ST-014', 'student', NULL),
(852, '2022-05-13', 'ST-014', 'student', NULL),
(853, '2022-05-14', 'ST-014', 'student', NULL),
(854, '2022-05-15', 'ST-014', 'student', NULL),
(855, '2022-05-16', 'ST-014', 'student', NULL),
(856, '2022-05-17', 'ST-014', 'student', NULL),
(857, '2022-05-18', 'ST-014', 'student', NULL),
(858, '2022-05-19', 'ST-014', 'student', NULL),
(859, '2022-05-20', 'ST-014', 'student', NULL),
(860, '2022-05-21', 'ST-014', 'student', NULL),
(861, '2022-05-22', 'ST-014', 'student', NULL),
(862, '2022-05-23', 'ST-014', 'student', NULL),
(863, '2022-05-24', 'ST-014', 'student', NULL),
(864, '2022-05-25', 'ST-014', 'student', NULL),
(865, '2022-05-26', 'ST-014', 'student', NULL),
(866, '2022-05-27', 'ST-014', 'student', NULL),
(867, '2022-05-28', 'ST-014', 'student', NULL),
(868, '2022-05-29', 'ST-014', 'student', NULL),
(869, '2022-05-30', 'ST-014', 'student', NULL),
(870, '2022-05-31', 'ST-014', 'student', NULL),
(871, '2022-06-01', 'ST-014', 'student', NULL),
(872, '2022-06-02', 'ST-014', 'student', NULL),
(873, '2022-06-03', 'ST-014', 'student', NULL),
(874, '2022-06-04', 'ST-014', 'student', NULL),
(875, '2022-06-05', 'ST-014', 'student', NULL),
(876, '2022-06-06', 'ST-014', 'student', NULL),
(877, '2022-06-07', 'ST-014', 'student', NULL),
(878, '2022-06-08', 'ST-014', 'student', NULL),
(879, '2022-06-09', 'ST-014', 'student', NULL),
(880, '2022-06-10', 'ST-014', 'student', NULL),
(881, '2022-06-11', 'ST-014', 'student', NULL),
(882, '2022-06-12', 'ST-014', 'student', NULL),
(883, '2022-06-13', 'ST-014', 'student', NULL),
(884, '2022-06-14', 'ST-014', 'student', NULL),
(885, '2022-06-15', 'ST-014', 'student', NULL),
(886, '2022-06-16', 'ST-014', 'student', NULL),
(887, '2022-06-17', 'ST-014', 'student', NULL),
(888, '2022-06-18', 'ST-014', 'student', NULL),
(889, '2022-06-19', 'ST-014', 'student', NULL),
(890, '2022-06-20', 'ST-014', 'student', NULL),
(891, '2022-06-21', 'ST-014', 'student', NULL),
(892, '2022-06-22', 'ST-014', 'student', NULL),
(893, '2022-06-23', 'ST-014', 'student', NULL),
(894, '2022-06-24', 'ST-014', 'student', NULL),
(895, '2022-06-25', 'ST-014', 'student', NULL),
(896, '2022-06-26', 'ST-014', 'student', NULL),
(897, '2022-06-27', 'ST-014', 'student', NULL),
(898, '2022-06-28', 'ST-014', 'student', NULL),
(899, '2022-06-29', 'ST-014', 'student', NULL),
(900, '2022-06-30', 'ST-014', 'student', NULL),
(901, '2022-07-01', 'ST-014', 'student', NULL),
(902, '2022-07-02', 'ST-014', 'student', NULL),
(903, '2022-07-03', 'ST-014', 'student', NULL),
(904, '2022-07-04', 'ST-014', 'student', NULL),
(905, '2022-07-05', 'ST-014', 'student', NULL),
(906, '2022-07-06', 'ST-014', 'student', NULL),
(907, '2022-07-07', 'ST-014', 'student', NULL),
(908, '2022-07-08', 'ST-014', 'student', NULL),
(909, '2022-07-09', 'ST-014', 'student', NULL),
(910, '2022-07-10', 'ST-014', 'student', NULL),
(911, '2022-07-11', 'ST-014', 'student', NULL),
(912, '2022-07-12', 'ST-014', 'student', NULL),
(913, '2022-07-13', 'ST-014', 'student', NULL),
(914, '2022-07-14', 'ST-014', 'student', NULL),
(915, '2022-07-15', 'ST-014', 'student', NULL),
(916, '2022-07-16', 'ST-014', 'student', NULL),
(917, '2022-07-17', 'ST-014', 'student', NULL),
(918, '2022-07-18', 'ST-014', 'student', NULL),
(919, '2022-07-19', 'ST-014', 'student', NULL),
(920, '2022-07-20', 'ST-014', 'student', NULL),
(921, '2022-07-21', 'ST-014', 'student', NULL),
(922, '2022-07-22', 'ST-014', 'student', NULL),
(923, '2022-07-23', 'ST-014', 'student', NULL),
(924, '2022-07-24', 'ST-014', 'student', NULL),
(925, '2022-07-25', 'ST-014', 'student', NULL),
(926, '2022-07-26', 'ST-014', 'student', NULL),
(927, '2022-07-27', 'ST-014', 'student', NULL),
(928, '2022-07-28', 'ST-014', 'student', NULL),
(929, '2022-07-29', 'ST-014', 'student', NULL),
(930, '2022-07-30', 'ST-014', 'student', NULL),
(931, '2022-07-31', 'ST-014', 'student', NULL),
(932, '2022-08-01', 'ST-014', 'student', NULL),
(933, '2022-08-02', 'ST-014', 'student', NULL),
(934, '2022-08-03', 'ST-014', 'student', NULL),
(935, '2022-08-04', 'ST-014', 'student', NULL),
(936, '2022-08-05', 'ST-014', 'student', NULL),
(937, '2022-08-06', 'ST-014', 'student', NULL),
(938, '2022-08-07', 'ST-014', 'student', NULL),
(939, '2022-08-08', 'ST-014', 'student', NULL),
(940, '2022-08-09', 'ST-014', 'student', NULL),
(941, '2022-08-10', 'ST-014', 'student', NULL),
(942, '2022-08-11', 'ST-014', 'student', NULL),
(943, '2022-08-12', 'ST-014', 'student', NULL),
(944, '2022-08-13', 'ST-014', 'student', NULL),
(945, '2022-08-14', 'ST-014', 'student', NULL),
(946, '2022-08-15', 'ST-014', 'student', NULL),
(947, '2022-08-16', 'ST-014', 'student', NULL),
(948, '2022-08-17', 'ST-014', 'student', NULL),
(949, '2022-08-18', 'ST-014', 'student', NULL),
(950, '2022-08-19', 'ST-014', 'student', NULL),
(951, '2022-08-20', 'ST-014', 'student', NULL),
(952, '2022-08-21', 'ST-014', 'student', NULL),
(953, '2022-08-22', 'ST-014', 'student', NULL),
(954, '2022-08-23', 'ST-014', 'student', NULL),
(955, '2022-08-24', 'ST-014', 'student', NULL),
(956, '2022-08-25', 'ST-014', 'student', NULL),
(957, '2022-08-26', 'ST-014', 'student', NULL),
(958, '2022-08-27', 'ST-014', 'student', NULL),
(959, '2022-08-28', 'ST-014', 'student', NULL),
(960, '2022-08-29', 'ST-014', 'student', NULL),
(961, '2022-08-30', 'ST-014', 'student', NULL),
(962, '2022-08-31', 'ST-014', 'student', NULL),
(963, '2022-09-01', 'ST-014', 'student', NULL),
(964, '2022-09-02', 'ST-014', 'student', NULL),
(965, '2022-09-03', 'ST-014', 'student', NULL),
(966, '2022-09-04', 'ST-014', 'student', NULL),
(967, '2022-09-05', 'ST-014', 'student', NULL),
(968, '2022-09-06', 'ST-014', 'student', NULL),
(969, '2022-09-07', 'ST-014', 'student', NULL),
(970, '2022-09-08', 'ST-014', 'student', NULL),
(971, '2022-09-09', 'ST-014', 'student', NULL),
(972, '2022-09-10', 'ST-014', 'student', NULL),
(973, '2022-09-11', 'ST-014', 'student', NULL),
(974, '2022-09-12', 'ST-014', 'student', NULL),
(975, '2022-09-13', 'ST-014', 'student', NULL),
(976, '2022-09-14', 'ST-014', 'student', NULL),
(977, '2022-09-15', 'ST-014', 'student', NULL),
(978, '2022-09-16', 'ST-014', 'student', NULL),
(979, '2022-09-17', 'ST-014', 'student', NULL),
(980, '2022-09-18', 'ST-014', 'student', NULL),
(981, '2022-09-19', 'ST-014', 'student', NULL),
(982, '2022-09-20', 'ST-014', 'student', NULL),
(983, '2022-09-21', 'ST-014', 'student', NULL),
(984, '2022-09-22', 'ST-014', 'student', NULL),
(985, '2022-09-23', 'ST-014', 'student', NULL),
(986, '2022-09-24', 'ST-014', 'student', NULL),
(987, '2022-09-25', 'ST-014', 'student', NULL),
(988, '2022-09-26', 'ST-014', 'student', NULL),
(989, '2022-09-27', 'ST-014', 'student', NULL),
(990, '2022-09-28', 'ST-014', 'student', NULL),
(991, '2022-09-29', 'ST-014', 'student', NULL),
(992, '2022-09-30', 'ST-014', 'student', NULL),
(993, '2022-10-01', 'ST-014', 'student', NULL),
(994, '2022-10-02', 'ST-014', 'student', NULL),
(995, '2022-10-03', 'ST-014', 'student', NULL),
(996, '2022-10-04', 'ST-014', 'student', NULL),
(997, '2022-10-05', 'ST-014', 'student', NULL),
(998, '2022-10-06', 'ST-014', 'student', NULL),
(999, '2022-10-07', 'ST-014', 'student', NULL),
(1000, '2022-10-08', 'ST-014', 'student', NULL),
(1001, '2022-10-09', 'ST-014', 'student', NULL),
(1002, '2022-10-10', 'ST-014', 'student', NULL),
(1003, '2022-10-11', 'ST-014', 'student', NULL),
(1004, '2022-10-12', 'ST-014', 'student', NULL),
(1005, '2022-10-13', 'ST-014', 'student', NULL),
(1006, '2022-10-14', 'ST-014', 'student', NULL),
(1007, '2022-10-15', 'ST-014', 'student', NULL),
(1008, '2022-10-16', 'ST-014', 'student', NULL),
(1009, '2022-10-17', 'ST-014', 'student', NULL),
(1010, '2022-10-18', 'ST-014', 'student', NULL),
(1011, '2022-10-19', 'ST-014', 'student', NULL),
(1012, '2022-10-20', 'ST-014', 'student', NULL),
(1013, '2022-10-21', 'ST-014', 'student', NULL),
(1014, '2022-10-22', 'ST-014', 'student', NULL),
(1015, '2022-10-23', 'ST-014', 'student', NULL),
(1016, '2022-10-24', 'ST-014', 'student', NULL),
(1017, '2022-10-25', 'ST-014', 'student', NULL),
(1018, '2022-10-26', 'ST-014', 'student', NULL),
(1019, '2022-10-27', 'ST-014', 'student', NULL),
(1020, '2022-10-28', 'ST-014', 'student', NULL),
(1021, '2022-10-29', 'ST-014', 'student', NULL),
(1022, '2022-10-30', 'ST-014', 'student', NULL),
(1023, '2022-10-31', 'ST-014', 'student', NULL),
(1024, '2022-11-01', 'ST-014', 'student', NULL),
(1025, '2022-11-02', 'ST-014', 'student', NULL),
(1026, '2022-11-03', 'ST-014', 'student', NULL),
(1027, '2022-11-04', 'ST-014', 'student', NULL),
(1028, '2022-11-05', 'ST-014', 'student', NULL),
(1029, '2022-11-06', 'ST-014', 'student', NULL),
(1030, '2022-11-07', 'ST-014', 'student', NULL),
(1031, '2022-11-08', 'ST-014', 'student', NULL),
(1032, '2022-11-09', 'ST-014', 'student', NULL),
(1033, '2022-11-10', 'ST-014', 'student', NULL),
(1034, '2022-11-11', 'ST-014', 'student', NULL),
(1035, '2022-11-12', 'ST-014', 'student', NULL),
(1036, '2022-11-13', 'ST-014', 'student', NULL),
(1037, '2022-11-14', 'ST-014', 'student', NULL),
(1038, '2022-11-15', 'ST-014', 'student', NULL),
(1039, '2022-11-16', 'ST-014', 'student', NULL),
(1040, '2022-11-17', 'ST-014', 'student', NULL),
(1041, '2022-11-18', 'ST-014', 'student', NULL),
(1042, '2022-11-19', 'ST-014', 'student', NULL),
(1043, '2022-11-20', 'ST-014', 'student', NULL),
(1044, '2022-11-21', 'ST-014', 'student', NULL),
(1045, '2022-11-22', 'ST-014', 'student', NULL),
(1046, '2022-11-23', 'ST-014', 'student', NULL),
(1047, '2022-11-24', 'ST-014', 'student', NULL),
(1048, '2022-11-25', 'ST-014', 'student', NULL),
(1049, '2022-11-26', 'ST-014', 'student', NULL),
(1050, '2022-11-27', 'ST-014', 'student', NULL),
(1051, '2022-11-28', 'ST-014', 'student', NULL),
(1052, '2022-11-29', 'ST-014', 'student', NULL),
(1053, '2022-11-30', 'ST-014', 'student', NULL),
(1054, '2022-12-01', 'ST-014', 'student', NULL),
(1055, '2022-12-02', 'ST-014', 'student', NULL),
(1056, '2022-12-03', 'ST-014', 'student', NULL),
(1057, '2022-12-04', 'ST-014', 'student', NULL),
(1058, '2022-12-05', 'ST-014', 'student', NULL),
(1059, '2022-12-06', 'ST-014', 'student', NULL),
(1060, '2022-12-07', 'ST-014', 'student', NULL),
(1061, '2022-12-08', 'ST-014', 'student', NULL),
(1062, '2022-12-09', 'ST-014', 'student', NULL),
(1063, '2022-12-10', 'ST-014', 'student', NULL),
(1064, '2022-12-11', 'ST-014', 'student', NULL),
(1065, '2022-12-12', 'ST-014', 'student', NULL),
(1066, '2022-12-13', 'ST-014', 'student', NULL),
(1067, '2022-12-14', 'ST-014', 'student', NULL),
(1068, '2022-12-15', 'ST-014', 'student', NULL),
(1069, '2022-12-16', 'ST-014', 'student', NULL),
(1070, '2022-12-17', 'ST-014', 'student', NULL),
(1071, '2022-12-18', 'ST-014', 'student', NULL),
(1072, '2022-12-19', 'ST-014', 'student', NULL),
(1073, '2022-12-20', 'ST-014', 'student', NULL),
(1074, '2022-12-21', 'ST-014', 'student', NULL),
(1075, '2022-12-22', 'ST-014', 'student', NULL),
(1076, '2022-12-23', 'ST-014', 'student', NULL),
(1077, '2022-12-24', 'ST-014', 'student', NULL),
(1078, '2022-12-25', 'ST-014', 'student', NULL),
(1079, '2022-12-26', 'ST-014', 'student', NULL),
(1080, '2022-12-27', 'ST-014', 'student', NULL),
(1081, '2022-12-28', 'ST-014', 'student', NULL),
(1082, '2022-12-29', 'ST-014', 'student', NULL),
(1083, '2022-12-30', 'ST-014', 'student', NULL),
(1084, '2022-12-31', 'ST-014', 'student', NULL),
(1085, '2023-01-01', 'ST-014', 'student', NULL),
(1086, '2023-01-02', 'ST-014', 'student', NULL),
(1087, '2023-01-03', 'ST-014', 'student', NULL),
(1088, '2023-01-04', 'ST-014', 'student', NULL),
(1089, '2023-01-05', 'ST-014', 'student', NULL),
(1090, '2023-01-06', 'ST-014', 'student', NULL),
(1091, '2023-01-07', 'ST-014', 'student', NULL),
(1092, '2023-01-08', 'ST-014', 'student', NULL);
INSERT INTO `attendance` (`id`, `date`, `attendee_id`, `role`, `status`) VALUES
(1093, '2023-01-09', 'ST-014', 'student', NULL),
(1094, '2023-01-10', 'ST-014', 'student', NULL),
(1095, '2023-01-11', 'ST-014', 'student', NULL),
(1096, '2023-01-12', 'ST-014', 'student', NULL),
(1097, '2023-01-13', 'ST-014', 'student', NULL),
(1098, '2023-01-14', 'ST-014', 'student', NULL),
(1099, '2023-01-15', 'ST-014', 'student', NULL),
(1100, '2023-01-16', 'ST-014', 'student', NULL),
(1101, '2023-01-17', 'ST-014', 'student', NULL),
(1102, '2023-01-18', 'ST-014', 'student', NULL),
(1103, '2023-01-19', 'ST-014', 'student', NULL),
(1104, '2023-01-20', 'ST-014', 'student', NULL),
(1105, '2023-01-21', 'ST-014', 'student', NULL),
(1106, '2023-01-22', 'ST-014', 'student', NULL),
(1107, '2023-01-23', 'ST-014', 'student', NULL),
(1108, '2023-01-24', 'ST-014', 'student', NULL),
(1109, '2023-01-25', 'ST-014', 'student', NULL),
(1110, '2023-01-26', 'ST-014', 'student', NULL),
(1111, '2023-01-27', 'ST-014', 'student', NULL),
(1112, '2023-01-28', 'ST-014', 'student', NULL),
(1113, '2023-01-29', 'ST-014', 'student', NULL),
(1114, '2023-01-30', 'ST-014', 'student', NULL),
(1115, '2023-01-31', 'ST-014', 'student', NULL),
(1116, '2023-02-01', 'ST-014', 'student', NULL),
(1117, '2023-02-02', 'ST-014', 'student', NULL),
(1118, '2023-02-03', 'ST-014', 'student', NULL),
(1119, '2023-02-04', 'ST-014', 'student', NULL),
(1120, '2023-02-05', 'ST-014', 'student', NULL),
(1121, '2023-02-06', 'ST-014', 'student', NULL),
(1122, '2023-02-07', 'ST-014', 'student', NULL),
(1123, '2023-02-08', 'ST-014', 'student', NULL),
(1124, '2023-02-09', 'ST-014', 'student', NULL),
(1125, '2023-02-10', 'ST-014', 'student', NULL),
(1126, '2023-02-11', 'ST-014', 'student', NULL),
(1127, '2023-02-12', 'ST-014', 'student', NULL),
(1128, '2023-02-13', 'ST-014', 'student', NULL),
(1129, '2023-02-14', 'ST-014', 'student', NULL),
(1130, '2023-02-15', 'ST-014', 'student', NULL),
(1131, '2023-02-16', 'ST-014', 'student', NULL),
(1132, '2023-02-17', 'ST-014', 'student', NULL),
(1133, '2023-02-18', 'ST-014', 'student', NULL),
(1134, '2023-02-19', 'ST-014', 'student', NULL),
(1135, '2023-02-20', 'ST-014', 'student', NULL),
(1136, '2023-02-21', 'ST-014', 'student', NULL),
(1137, '2023-02-22', 'ST-014', 'student', NULL),
(1138, '2023-02-23', 'ST-014', 'student', NULL),
(1139, '2023-02-24', 'ST-014', 'student', NULL),
(1140, '2023-02-25', 'ST-014', 'student', NULL),
(1141, '2023-02-26', 'ST-014', 'student', NULL),
(1142, '2023-02-27', 'ST-014', 'student', NULL),
(1143, '2023-02-28', 'ST-014', 'student', NULL),
(1144, '2023-03-01', 'ST-014', 'student', NULL),
(1145, '2023-03-02', 'ST-014', 'student', NULL),
(1146, '2023-03-03', 'ST-014', 'student', NULL),
(1147, '2023-03-04', 'ST-014', 'student', NULL),
(1148, '2023-03-05', 'ST-014', 'student', NULL),
(1149, '2023-03-06', 'ST-014', 'student', NULL),
(1150, '2023-03-07', 'ST-014', 'student', NULL),
(1151, '2023-03-08', 'ST-014', 'student', NULL),
(1152, '2023-03-09', 'ST-014', 'student', NULL),
(1153, '2023-03-10', 'ST-014', 'student', NULL),
(1154, '2023-03-11', 'ST-014', 'student', NULL),
(1155, '2023-03-12', 'ST-014', 'student', NULL),
(1156, '2023-03-13', 'ST-014', 'student', NULL),
(1157, '2023-03-14', 'ST-014', 'student', NULL),
(1158, '2023-03-15', 'ST-014', 'student', NULL),
(1159, '2023-03-16', 'ST-014', 'student', NULL),
(1160, '2023-03-17', 'ST-014', 'student', NULL),
(1161, '2023-03-18', 'ST-014', 'student', NULL),
(1162, '2023-03-19', 'ST-014', 'student', NULL),
(1163, '2023-03-20', 'ST-014', 'student', NULL),
(1164, '2023-03-21', 'ST-014', 'student', NULL),
(1165, '2023-03-22', 'ST-014', 'student', NULL),
(1166, '2023-03-23', 'ST-014', 'student', NULL),
(1167, '2023-03-24', 'ST-014', 'student', NULL),
(1168, '2023-03-25', 'ST-014', 'student', NULL),
(1169, '2023-03-26', 'ST-014', 'student', NULL),
(1170, '2023-03-27', 'ST-014', 'student', NULL),
(1171, '2023-03-28', 'ST-014', 'student', NULL),
(1172, '2023-03-29', 'ST-014', 'student', NULL),
(1173, '2023-03-30', 'ST-014', 'student', NULL),
(1174, '2023-03-31', 'ST-014', 'student', NULL),
(1175, '2023-04-01', 'ST-014', 'student', NULL),
(1176, '2023-04-02', 'ST-014', 'student', NULL),
(1177, '2023-04-03', 'ST-014', 'student', NULL),
(1178, '2023-04-04', 'ST-014', 'student', NULL),
(1179, '2023-04-05', 'ST-014', 'student', NULL),
(1180, '2023-04-06', 'ST-014', 'student', NULL),
(1181, '2023-04-07', 'ST-014', 'student', NULL),
(1182, '2023-04-08', 'ST-014', 'student', NULL),
(1183, '2023-04-09', 'ST-014', 'student', NULL),
(1184, '2023-04-10', 'ST-014', 'student', NULL),
(1185, '2023-04-11', 'ST-014', 'student', NULL),
(1186, '2023-04-12', 'ST-014', 'student', NULL),
(1187, '2023-04-13', 'ST-014', 'student', NULL),
(1188, '2023-04-14', 'ST-014', 'student', NULL),
(1189, '2023-04-15', 'ST-014', 'student', NULL),
(1190, '2023-04-16', 'ST-014', 'student', NULL),
(1191, '2023-04-17', 'ST-014', 'student', NULL),
(1192, '2023-04-18', 'ST-014', 'student', NULL),
(1193, '2023-04-19', 'ST-014', 'student', NULL),
(1194, '2023-04-20', 'ST-014', 'student', NULL),
(1195, '2023-04-21', 'ST-014', 'student', NULL),
(1196, '2023-04-22', 'ST-014', 'student', NULL),
(1197, '2023-04-23', 'ST-014', 'student', NULL),
(1198, '2023-04-24', 'ST-014', 'student', NULL),
(1199, '2023-04-25', 'ST-014', 'student', NULL),
(1200, '2023-04-26', 'ST-014', 'student', NULL),
(1201, '2023-04-27', 'ST-014', 'student', NULL),
(1202, '2023-04-28', 'ST-014', 'student', NULL),
(1203, '2023-04-29', 'ST-014', 'student', NULL),
(1204, '2023-04-30', 'ST-014', 'student', NULL),
(1205, '2023-05-01', 'ST-014', 'student', NULL),
(1206, '2023-05-02', 'ST-014', 'student', NULL),
(1207, '2023-05-03', 'ST-014', 'student', NULL),
(1208, '2023-05-04', 'ST-014', 'student', NULL),
(1209, '2023-05-05', 'ST-014', 'student', NULL),
(1210, '2023-05-06', 'ST-014', 'student', NULL),
(1211, '2023-05-07', 'ST-014', 'student', NULL),
(1212, '2023-05-08', 'ST-014', 'student', NULL),
(1213, '2023-05-09', 'ST-014', 'student', NULL),
(1214, '2023-05-10', 'ST-014', 'student', NULL),
(1215, '2023-05-11', 'ST-014', 'student', NULL),
(1216, '2023-05-12', 'ST-014', 'student', NULL),
(1217, '2023-05-13', 'ST-014', 'student', NULL),
(1218, '2023-05-14', 'ST-014', 'student', NULL),
(1219, '2023-05-15', 'ST-014', 'student', NULL),
(1220, '2023-05-16', 'ST-014', 'student', NULL),
(1221, '2023-05-17', 'ST-014', 'student', NULL),
(1222, '2023-05-18', 'ST-014', 'student', NULL),
(1223, '2023-05-19', 'ST-014', 'student', NULL),
(1224, '2023-05-20', 'ST-014', 'student', NULL),
(1225, '2023-05-21', 'ST-014', 'student', NULL),
(1226, '2023-05-22', 'ST-014', 'student', NULL),
(1227, '2023-05-23', 'ST-014', 'student', NULL),
(1228, '2023-05-24', 'ST-014', 'student', NULL),
(1229, '2023-05-25', 'ST-014', 'student', NULL),
(1230, '2023-05-26', 'ST-014', 'student', NULL),
(1231, '2023-05-27', 'ST-014', 'student', NULL),
(1232, '2023-05-28', 'ST-014', 'student', NULL),
(1233, '2023-05-29', 'ST-014', 'student', NULL),
(1234, '2023-05-30', 'ST-014', 'student', NULL),
(1235, '2023-05-31', 'ST-014', 'student', NULL),
(1236, '2023-06-01', 'ST-014', 'student', NULL),
(1237, '2023-06-02', 'ST-014', 'student', NULL),
(1238, '2023-06-03', 'ST-014', 'student', NULL),
(1239, '2023-06-04', 'ST-014', 'student', NULL),
(1240, '2023-06-05', 'ST-014', 'student', NULL),
(1241, '2023-06-06', 'ST-014', 'student', NULL),
(1242, '2023-06-07', 'ST-014', 'student', NULL),
(1243, '2023-06-08', 'ST-014', 'student', NULL),
(1244, '2023-06-09', 'ST-014', 'student', NULL),
(1245, '2023-06-10', 'ST-014', 'student', NULL),
(1246, '2023-06-11', 'ST-014', 'student', NULL),
(1247, '2023-06-12', 'ST-014', 'student', NULL),
(1248, '2023-06-13', 'ST-014', 'student', NULL),
(1249, '2023-06-14', 'ST-014', 'student', NULL),
(1250, '2023-06-15', 'ST-014', 'student', NULL),
(1251, '2023-06-16', 'ST-014', 'student', NULL),
(1252, '2023-06-17', 'ST-014', 'student', NULL),
(1253, '2023-06-18', 'ST-014', 'student', NULL),
(1254, '2023-06-19', 'ST-014', 'student', NULL),
(1255, '2023-06-20', 'ST-014', 'student', NULL),
(1256, '2023-06-21', 'ST-014', 'student', NULL),
(1257, '2023-06-22', 'ST-014', 'student', NULL),
(1258, '2023-06-23', 'ST-014', 'student', NULL),
(1259, '2023-06-24', 'ST-014', 'student', NULL),
(1260, '2023-06-25', 'ST-014', 'student', NULL),
(1261, '2023-06-26', 'ST-014', 'student', NULL),
(1262, '2023-06-27', 'ST-014', 'student', NULL),
(1263, '2023-06-28', 'ST-014', 'student', NULL),
(1264, '2023-06-29', 'ST-014', 'student', NULL),
(1265, '2023-06-30', 'ST-014', 'student', NULL),
(1266, '2023-07-01', 'ST-014', 'student', NULL),
(1267, '2023-07-02', 'ST-014', 'student', NULL),
(1268, '2023-07-03', 'ST-014', 'student', NULL),
(1269, '2023-07-04', 'ST-014', 'student', NULL),
(1270, '2023-07-05', 'ST-014', 'student', NULL),
(1271, '2023-07-06', 'ST-014', 'student', NULL),
(1272, '2023-07-07', 'ST-014', 'student', NULL),
(1273, '2023-07-08', 'ST-014', 'student', NULL),
(1274, '2023-07-09', 'ST-014', 'student', NULL),
(1275, '2023-07-10', 'ST-014', 'student', NULL),
(1276, '2023-07-11', 'ST-014', 'student', NULL),
(1277, '2023-07-12', 'ST-014', 'student', NULL),
(1278, '2023-07-13', 'ST-014', 'student', NULL),
(1279, '2023-07-14', 'ST-014', 'student', NULL),
(1280, '2023-07-15', 'ST-014', 'student', NULL),
(1281, '2023-07-16', 'ST-014', 'student', NULL),
(1282, '2023-07-17', 'ST-014', 'student', NULL),
(1283, '2023-07-18', 'ST-014', 'student', NULL),
(1284, '2023-07-19', 'ST-014', 'student', NULL),
(1285, '2023-07-20', 'ST-014', 'student', NULL),
(1286, '2023-07-21', 'ST-014', 'student', NULL),
(1287, '2023-07-22', 'ST-014', 'student', NULL),
(1288, '2023-07-23', 'ST-014', 'student', NULL),
(1289, '2023-07-24', 'ST-014', 'student', NULL),
(1290, '2023-07-25', 'ST-014', 'student', NULL),
(1291, '2023-07-26', 'ST-014', 'student', NULL),
(1292, '2023-07-27', 'ST-014', 'student', NULL),
(1293, '2023-07-28', 'ST-014', 'student', NULL),
(1294, '2023-07-29', 'ST-014', 'student', NULL),
(1295, '2023-07-30', 'ST-014', 'student', NULL),
(1296, '2023-07-31', 'ST-014', 'student', NULL),
(1297, '2023-08-01', 'ST-014', 'student', NULL),
(1298, '2023-08-02', 'ST-014', 'student', NULL),
(1299, '2023-08-03', 'ST-014', 'student', NULL),
(1300, '2023-08-04', 'ST-014', 'student', NULL),
(1301, '2023-08-05', 'ST-014', 'student', NULL),
(1302, '2023-08-06', 'ST-014', 'student', NULL),
(1303, '2023-08-07', 'ST-014', 'student', NULL),
(1304, '2023-08-08', 'ST-014', 'student', NULL),
(1305, '2023-08-09', 'ST-014', 'student', NULL),
(1306, '2023-08-10', 'ST-014', 'student', NULL),
(1307, '2023-08-11', 'ST-014', 'student', NULL),
(1308, '2023-08-12', 'ST-014', 'student', NULL),
(1309, '2023-08-13', 'ST-014', 'student', NULL),
(1310, '2023-08-14', 'ST-014', 'student', NULL),
(1311, '2023-08-15', 'ST-014', 'student', NULL),
(1312, '2023-08-16', 'ST-014', 'student', NULL),
(1313, '2023-08-17', 'ST-014', 'student', NULL),
(1314, '2023-08-18', 'ST-014', 'student', NULL),
(1315, '2023-08-19', 'ST-014', 'student', NULL),
(1316, '2023-08-20', 'ST-014', 'student', NULL),
(1317, '2023-08-21', 'ST-014', 'student', NULL),
(1318, '2023-08-22', 'ST-014', 'student', NULL),
(1319, '2023-08-23', 'ST-014', 'student', NULL),
(1320, '2023-08-24', 'ST-014', 'student', NULL),
(1321, '2023-08-25', 'ST-014', 'student', NULL),
(1322, '2023-08-26', 'ST-014', 'student', NULL),
(1323, '2023-08-27', 'ST-014', 'student', NULL),
(1324, '2023-08-28', 'ST-014', 'student', NULL),
(1325, '2023-08-29', 'ST-014', 'student', NULL),
(1326, '2023-08-30', 'ST-014', 'student', NULL),
(1327, '2023-08-31', 'ST-014', 'student', NULL),
(1328, '2023-09-01', 'ST-014', 'student', NULL),
(1329, '2023-09-02', 'ST-014', 'student', NULL),
(1330, '2023-09-03', 'ST-014', 'student', NULL),
(1331, '2023-09-04', 'ST-014', 'student', NULL),
(1332, '2023-09-05', 'ST-014', 'student', NULL),
(1333, '2023-09-06', 'ST-014', 'student', NULL),
(1334, '2023-09-07', 'ST-014', 'student', NULL),
(1335, '2023-09-08', 'ST-014', 'student', NULL),
(1336, '2023-09-09', 'ST-014', 'student', NULL),
(1337, '2023-09-10', 'ST-014', 'student', NULL),
(1338, '2023-09-11', 'ST-014', 'student', NULL),
(1339, '2023-09-12', 'ST-014', 'student', NULL),
(1340, '2023-09-13', 'ST-014', 'student', NULL),
(1341, '2023-09-14', 'ST-014', 'student', NULL),
(1342, '2023-09-15', 'ST-014', 'student', NULL),
(1343, '2023-09-16', 'ST-014', 'student', NULL),
(1344, '2023-09-17', 'ST-014', 'student', NULL),
(1345, '2023-09-18', 'ST-014', 'student', NULL),
(1346, '2023-09-19', 'ST-014', 'student', NULL),
(1347, '2023-09-20', 'ST-014', 'student', NULL),
(1348, '2023-09-21', 'ST-014', 'student', NULL),
(1349, '2023-09-22', 'ST-014', 'student', NULL),
(1350, '2023-09-23', 'ST-014', 'student', NULL),
(1351, '2023-09-24', 'ST-014', 'student', NULL),
(1352, '2023-09-25', 'ST-014', 'student', NULL),
(1353, '2023-09-26', 'ST-014', 'student', NULL),
(1354, '2023-09-27', 'ST-014', 'student', NULL),
(1355, '2023-09-28', 'ST-014', 'student', NULL),
(1356, '2023-09-29', 'ST-014', 'student', NULL),
(1357, '2023-09-30', 'ST-014', 'student', NULL),
(1358, '2023-10-01', 'ST-014', 'student', NULL),
(1359, '2023-10-02', 'ST-014', 'student', NULL),
(1360, '2023-10-03', 'ST-014', 'student', NULL),
(1361, '2023-10-04', 'ST-014', 'student', NULL),
(1362, '2023-10-05', 'ST-014', 'student', NULL),
(1363, '2023-10-06', 'ST-014', 'student', NULL),
(1364, '2023-10-07', 'ST-014', 'student', NULL),
(1365, '2023-10-08', 'ST-014', 'student', NULL),
(1366, '2023-10-09', 'ST-014', 'student', NULL),
(1367, '2023-10-10', 'ST-014', 'student', NULL),
(1368, '2023-10-11', 'ST-014', 'student', NULL),
(1369, '2023-10-12', 'ST-014', 'student', NULL),
(1370, '2023-10-13', 'ST-014', 'student', NULL),
(1371, '2023-10-14', 'ST-014', 'student', NULL),
(1372, '2023-10-15', 'ST-014', 'student', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `capstone_sched`
--

CREATE TABLE `capstone_sched` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `course_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `capstone_sched`
--

INSERT INTO `capstone_sched` (`id`, `date`, `time`, `course_id`, `class_id`, `program_id`) VALUES
(1, '2023-10-27', '07:00:00', 1, 5, 1),
(2, '2023-10-31', '13:00:00', 14, 2, 1),
(3, '2023-10-30', '08:00:00', 4, 5, 1),
(4, '2023-10-15', '12:00:00', 14, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `year`, `section`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 2),
(7, 4, 1),
(8, 4, 2);

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
(1, 'MATH 03', 'Linear Algebra'),
(2, 'DCIT 26', 'Application Development and Visual Computing'),
(3, 'DCIT 65', 'Social and Professional Issues'),
(4, 'COSC 75', 'Software Engineering II'),
(5, 'COSC 85', 'Networks and Communication'),
(6, 'GNED02', 'Ethics'),
(7, 'GNED05', 'Purposive Communication '),
(8, 'MATH1', 'Analytic Geometry'),
(9, 'DCIT 24', 'Information Management'),
(10, 'COSC95', 'Programming Languages'),
(11, 'DCIT60', 'Methods of Research'),
(12, 'COSC105', 'Intelligent System'),
(13, 'GNED10', 'Gender and Society'),
(14, 'NSTP 1', 'ROTC'),
(15, 'NSTP 2', 'ROTC'),
(16, 'CCTN50', 'Basic Trouble Shooting and Maintenance'),
(17, 'COSC60', 'Data Structures'),
(18, 'ITEC70', 'Computer Graphics'),
(19, 'DCIT65 ', 'Web Development'),
(20, 'ITEC75', 'Technopreneur'),
(21, 'ITEC80', 'Network Management'),
(22, 'GNED 07', 'The Contemporary World');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`id`, `course_id`, `class_id`, `program_id`) VALUES
(1, 1, 5, 1),
(2, 2, 5, 1),
(3, 3, 5, 1),
(4, 4, 3, 1),
(5, 5, 3, 1),
(6, 6, 1, 1),
(7, 7, 1, 1),
(8, 8, 2, 1),
(9, 9, 2, 1),
(10, 10, 4, 1),
(11, 11, 4, 1),
(12, 12, 7, 1),
(13, 13, 7, 1),
(14, 14, 1, 2),
(15, 15, 1, 2),
(16, 16, 2, 2),
(17, 17, 2, 2),
(18, 18, 3, 2),
(19, 19, 3, 2),
(20, 20, 4, 2),
(21, 21, 4, 2),
(22, 1, 6, 1),
(23, 2, 6, 1),
(24, 3, 6, 1),
(25, 12, 8, 1),
(26, 13, 8, 1),
(27, 5, 5, 1);

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
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `id` int(11) NOT NULL,
  `abbr` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id`, `abbr`, `description`) VALUES
(1, 'BSCS', 'Bachelor of Science in Computer Science'),
(2, 'BSIT', 'Bachelor of Science in Information Technology');

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
  `register_date` date NOT NULL,
  `sex` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `l_name`, `f_name`, `m_initial`, `phone_no`, `email`, `dob`, `register_date`, `sex`) VALUES
('ST-001', 'Doe', 'John', 'X', '1505625851', 'missingme@urs.edu.ph', '1983-09-04', '2023-09-01', 'M'),
('ST-006', 'Belnades', 'Sypha', 'A', '09234123894', 'sypha.belnades@urs.edu.ph', '2001-02-09', '2023-10-06', 'F'),
('ST-007', 'Tepes', 'Vladimir', 'D', '1111321345', 'Castlevania13mail!2@gmail.com', '1820-11-23', '2023-10-06', 'M'),
('ST-008', 'Báthory', 'Erzsebet', 'W', '1119876345', 'GarfieDCat@gmail.com', '1850-12-30', '2023-10-10', 'M'),
('ST-009', 'Grouchy', 'Emmanuel ', 'D', '1121132134', 'napoleonmarshall@gmail.com', '1766-10-23', '2023-10-11', 'M'),
('ST-010', 'Oudinot', 'Nicolas ', 'D', '1113311345', 'OudinotNicolas@yahoo.com', '1767-04-25', '2023-10-04', 'M'),
('ST-011', 'Davout', 'Louis-Nicolas', 'D', '222222222', 'DavoutLouis-Nicolas@gmail.com', '1770-05-10', '2023-10-03', 'M'),
('ST-012', 'Bonaparte ', 'Napoleon', 'A', '321987634', 'BonaparteNapoleon@gmail.com', '1769-08-15', '2023-10-11', 'M'),
('ST-013', 'Roger', 'Jolly', '', '09234123451', 'jolly.roger@urs.edu.ph', '2005-01-02', '2023-09-18', 'M'),
('ST-014', 'Reid', 'James', '', '09865711234', 'james.reid@urs.edu.ph', '2002-02-25', '2021-09-18', 'M');

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
-- Table structure for table `student_enroll`
--

CREATE TABLE `student_enroll` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `enroll_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_enroll`
--

INSERT INTO `student_enroll` (`id`, `student_id`, `enroll_id`) VALUES
(1, 'ST-001', 6),
(2, 'ST-001', 7),
(3, 'ST-006', 6),
(4, 'ST-006', 7),
(5, 'ST-007', 8),
(6, 'ST-007', 9),
(7, 'ST-008', 16),
(8, 'ST-008', 17),
(9, 'ST-009', 5),
(10, 'ST-009', 4),
(11, 'ST-010', 18),
(12, 'ST-010', 19),
(13, 'ST-011', 10),
(14, 'ST-011', 11),
(15, 'ST-012', 21),
(16, 'ST-012', 20),
(17, 'ST-014', 1),
(18, 'ST-014', 2),
(19, 'ST-014', 3),
(20, 'ST-013', 6),
(21, 'ST-013', 7);

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
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` varchar(7) NOT NULL DEFAULT '0',
  `l_name` varchar(255) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `m_initial` varchar(2) NOT NULL,
  `phone_no` varchar(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `hire_date` date NOT NULL,
  `sex` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `l_name`, `f_name`, `m_initial`, `phone_no`, `email`, `dob`, `hire_date`, `sex`) VALUES
('TE-001', 'Xavier', 'Charles', 'X.', '1505625851', 'xmentestemail@gmail.com', '1983-09-04', '2023-09-01', 'M'),
('TE-002', 'Shelby', 'Thomas Michael', 'A.', '1505625851', 'shelbyfamilylimited@gmail.com', '1993-09-04', '2023-09-01', 'M'),
('TE-003', 'Satoru', 'Gojo', 'M.', '1231456789', 'otaku69@yahoo.com', '1990-06-05', '2023-09-01', 'M'),
('TE-004', 'Cat', 'Luna', 'D.', '1231456789', 'otaku69@yahoo.com', '1990-06-05', '2023-09-01', 'F'),
('TE-005', 'Joestar', 'Joseph', 'D.', '1231456789', 'otaku69@yahoo.com', '1980-06-05', '2023-09-01', 'M'),
('TE-006', 'Nietzche', 'Fredrick', 'A.', '1231456789', 'philosopher@gmail.com', '1974-09-03', '2023-09-08', 'M');

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
-- Table structure for table `teacher_teaches`
--

CREATE TABLE `teacher_teaches` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(255) DEFAULT NULL,
  `enroll_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher_teaches`
--

INSERT INTO `teacher_teaches` (`id`, `teacher_id`, `enroll_id`) VALUES
(1, 'TE-001', 4),
(2, 'TE-001', 5),
(3, 'TE-002', 6),
(4, 'TE-002', 7),
(5, 'TE-003', 8),
(6, 'TE-003', 9),
(7, 'TE-004', 10),
(8, 'TE-004', 11),
(9, 'TE-005', 14),
(10, 'TE-005', 15),
(11, 'TE-006', 16),
(12, 'TE-006', 17),
(13, 'TE-001', 18),
(14, 'TE-001', 19),
(15, 'TE-002', 20),
(16, 'TE-002', 21);

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
(15, 'TE-006', '123'),
(16, 'ST-006', '123'),
(17, 'ST-007', '123'),
(18, 'ST-008', '123'),
(19, 'ST-009', '123'),
(20, 'ST-010', '123'),
(21, 'ST-011', '123'),
(22, 'ST-012', '123');

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
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
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
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_enroll`
--
ALTER TABLE `student_enroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_student_id` (`student_id`),
  ADD KEY `FK_enroll_id` (`enroll_id`);

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
-- Indexes for table `teacher_seq`
--
ALTER TABLE `teacher_seq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_teaches`
--
ALTER TABLE `teacher_teaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_teacher_teaches_enroll_id` (`enroll_id`),
  ADD KEY `FK_teacher_teaches_teacher_id` (`teacher_id`);

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1373;

--
-- AUTO_INCREMENT for table `capstone_sched`
--
ALTER TABLE `capstone_sched`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_enroll`
--
ALTER TABLE `student_enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `student_seq`
--
ALTER TABLE `student_seq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `teacher_seq`
--
ALTER TABLE `teacher_seq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teacher_teaches`
--
ALTER TABLE `teacher_teaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `student_enroll`
--
ALTER TABLE `student_enroll`
  ADD CONSTRAINT `FK_enroll_id` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`),
  ADD CONSTRAINT `FK_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `teacher_teaches`
--
ALTER TABLE `teacher_teaches`
  ADD CONSTRAINT `FK_teacher_teaches_enroll_id` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`),
  ADD CONSTRAINT `FK_teacher_teaches_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
