-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2023 at 11:41 AM
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
-- Database: `schoolmsdbnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(7) NOT NULL DEFAULT '0',
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `M.I.` varchar(255) NOT NULL,
  `phone no.` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `hiredate` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `city/municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `ZIP` int(4) NOT NULL,
  `Sex` char(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `lname`, `fname`, `M.I.`, `phone no.`, `email`, `DOB`, `hiredate`, `street`, `brgy`, `city/municipality`, `province`, `ZIP`, `Sex`, `user_id`) VALUES
('AD-001', 'Doe', 'John', 'D.', 1505625851, 'fovotiy760@recutv.com', '1990-08-01', '2023-09-20', '221B Baker Street', 'Kanluran', 'Naic', 'Cavite', 4110, 'M', 1),
('AD-002', 'Forger', 'Llyod', 'M.', 1505625851, 'random123@gmail.com', '1980-08-01', '2023-09-01', 'baker street', 'West', 'Naic', 'Etivac', 4110, 'M', 5),
('AD-003', 'Forger', 'Yor', 'A.', 1553252352, 'randomemail312@gmail.com', '1985-09-10', '2023-09-22', 'baker street', 'West', 'Naic', 'Etivac', 4110, 'F', 6),
('AD-004', 'Philips', 'Trevor', 'B.', 1231456789, 'randomizeemail@gmail.com', '1973-03-01', '2023-09-27', 'cut street', 'labac', 'Naic', 'Etivac', 4110, 'M', 7),
('AD-005', 'De Santa', 'Michael', 'T.', 1234567890, 'gta5@gmail.com', '1973-09-13', '2023-09-20', 'street street', 'pinili', 'batac', 'Ilocos norte', 4214, 'M', 8),
('AD-006', 'Cat', 'Garfie', 'D.', 1231456789, 'randomizeemail@gmail.com', '1993-03-01', '2023-09-27', 'cut street', 'labac', 'Naic', 'Etivac', 4110, 'M', 9),
('AD-007', 'Pusa', 'Michael', 'D.', 1234567890, 'gta5@gmail.com', '1973-09-13', '2023-09-20', 'street street', 'pinili', 'batac', 'Ilocos norte', 4214, 'M', 10),
('AD-008', 'Hanma', 'Yujiro', 'A.', 1234567890, 'gta5@gmail.com', '1973-09-13', '2023-09-20', 'street street', 'pinili', 'Shinjuku', 'Tokyo', 4214, 'M', 11);

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
  `attendance_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capstone_sched`
--

CREATE TABLE `capstone_sched` (
  `capstone_id` int(255) NOT NULL,
  `capstone_date` date NOT NULL,
  `time` time NOT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `capstone_sched`
--

INSERT INTO `capstone_sched` (`capstone_id`, `capstone_date`, `time`, `course_id`) VALUES
(1, '2023-09-30', '14:00:00', 1);

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
(1, 'BSCS', '101', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(255) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_code`, `course_name`) VALUES
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
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `M.I.` varchar(2) NOT NULL,
  `phone no.` int(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `admission_date` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `city/municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `ZIP` int(4) NOT NULL,
  `Sex` char(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `lname`, `fname`, `M.I.`, `phone no.`, `email`, `DOB`, `admission_date`, `street`, `brgy`, `city/municipality`, `province`, `ZIP`, `Sex`, `user_id`) VALUES
('ST-001', 'Doe', 'John', 'X.', 1505625851, 'missingme@gmail.com', '1983-09-04', '2023-09-01', 'random street', 'Bronx ', 'New York City', 'New York', 6969, 'M', 2);

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
  `teacher_id` varchar(255) NOT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`id`, `teacher_id`, `course_id`) VALUES
(1, 'te-001-01', 1);

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
(1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` varchar(7) NOT NULL DEFAULT '0',
  `lname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `M.I.` varchar(2) NOT NULL,
  `phone no.` int(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `hiredate` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `city/municipality` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `ZIP` int(4) NOT NULL,
  `Sex` char(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `lname`, `fname`, `M.I.`, `phone no.`, `email`, `DOB`, `hiredate`, `street`, `brgy`, `city/municipality`, `province`, `ZIP`, `Sex`, `user_id`) VALUES
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
  `teacherid` varchar(255) NOT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher_courses`
--

INSERT INTO `teacher_courses` (`id`, `teacherid`, `course_id`) VALUES
(1, 'teacher 1', 1);

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
(1, 'admin1', '123'),
(2, 'student1', '123'),
(3, 'teacher1', '123'),
(4, 'teacher2', '123');

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
  ADD PRIMARY KEY (`capstone_id`),
  ADD KEY `id` (`course_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

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
  ADD KEY `course_id` (`course_id`);

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
  ADD KEY `course_id` (`course_id`);

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capstone_sched`
--
ALTER TABLE `capstone_sched`
  MODIFY `capstone_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_seq`
--
ALTER TABLE `teacher_seq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `capstone_sched`
--
ALTER TABLE `capstone_sched`
  ADD CONSTRAINT `capstone_sched_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
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
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD CONSTRAINT `teacher_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
