-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2023 at 10:24 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_python`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_firstline` text DEFAULT NULL,
  `address_secondline` text DEFAULT NULL,
  `address_town` text NOT NULL,
  `address_postcode` text NOT NULL,
  `address_country` text NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_firstline`, `address_secondline`, `address_town`, `address_postcode`, `address_country`, `student_id`) VALUES
(1, 'Dean Road', NULL, 'Bolton', 'BL1', 'United Kingdom', 1),
(2, 'Dean Road', NULL, 'Bolton', 'BL1', 'United Kingdom', 2),
(3, 'Derby Street', NULL, 'Bolton', 'BL2', 'United Kingdom', 3),
(4, 'Bradshawgate', NULL, 'Bolton', 'BL3', 'United Kingdom', 4),
(5, 'Derby Street', NULL, 'Bolton', 'BL1', 'United Kingdom', 5);

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `application_id` int(11) NOT NULL,
  `home_address` text NOT NULL,
  `home_address_postcode` text NOT NULL,
  `home_address_country` text NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`application_id`, `home_address`, `home_address_postcode`, `home_address_country`, `student_id`) VALUES
(1, 'Mumbai', '400008', 'India', 1),
(2, 'Gujrat', '900008', 'India', 2),
(3, 'Hyderabad', '600009', 'India', 3),
(4, 'Chennai', '600559', 'India', 4),
(5, 'Gujrat', '700009', 'India', 5);

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `application_id` int(11) NOT NULL,
  `application_status` text NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_code` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`application_id`, `application_status`, `student_id`, `course_code`) VALUES
(1, 'Enrolled', 1, 'SWE_0001'),
(2, 'Enrolled', 2, 'SWE_0001'),
(3, 'Enrolled', 3, 'SWE_0002'),
(4, 'Enrolled', 4, 'SWE_0002'),
(5, 'Enrolled', 5, 'SWE_0001');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `attendance_date` text NOT NULL,
  `timetable_event_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `attendance_date`, `timetable_event_id`, `student_id`, `attendance_status`) VALUES
(1, '', 1, 1, 'Present'),
(2, '', 2, 2, 'Absent'),
(3, '', 5, 3, 'Present'),
(4, '', 5, 4, 'Present'),
(5, '', 6, 3, 'Absent'),
(6, '', 1, 5, 'Present'),
(7, '', 2, 5, 'Not Checked-in'),
(8, '', 3, 5, 'Not Checked-in'),
(9, '', 6, 4, 'Absent'),
(10, '', 2, 1, 'Absent'),
(11, '', 2, 1, 'Not Checked-in'),
(12, '', 1, 2, 'Present'),
(13, '', 3, 1, 'Present'),
(14, '', 4, 1, 'Absent'),
(15, '', 3, 2, 'Present'),
(16, '', 4, 2, 'Not Checked-in');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_code` varchar(60) NOT NULL,
  `course_title` text NOT NULL,
  `course_description` text NOT NULL,
  `course_level` int(11) NOT NULL,
  `course_credits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_code`, `course_title`, `course_description`, `course_level`, `course_credits`) VALUES
('SWE_0001', 'Software Engineering', 'Masters in Software Engineering', 4, 60),
('SWE_0002', 'Data Analytics', 'Masters in Data Analytics', 4, 60);

-- --------------------------------------------------------

--
-- Table structure for table `enrolment`
--

CREATE TABLE `enrolment` (
  `enrolment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_code` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `enrolment`
--

INSERT INTO `enrolment` (`enrolment_id`, `student_id`, `course_code`) VALUES
(1, 1, 'SWE_0001'),
(2, 2, 'SWE_0001'),
(3, 3, 'SWE_0002'),
(4, 4, 'SWE_0001'),
(5, 5, 'SWE_0001');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `module_title` text NOT NULL,
  `module_description` text NOT NULL,
  `module_level` int(11) NOT NULL,
  `module_credits` int(11) NOT NULL,
  `course_code` varchar(60) NOT NULL,
  `Semester_ID` int(11) NOT NULL,
  `Taught_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `module_title`, `module_description`, `module_level`, `module_credits`, `course_code`, `Semester_ID`, `Taught_by`) VALUES
(1, 'Research Methods', 'Research methods are ways of collecting and analyzing data', 1, 20, 'SWE_0001', 1, 1),
(2, 'DevOps', 'DevOps is the combination of cultural philosophies, practices, and tools ', 1, 20, 'SWE_0001', 1, 2),
(3, 'Advanced Software Development', 'Courses in software development and software management skills, including language', 1, 20, 'SWE_0001', 2, 2),
(4, 'Contemporary Software Engineering', 'Learn Agile', 1, 20, 'SWE_0001', 2, 3),
(5, 'Big Data Applications', 'This module will introduce students to state-of-the-art approaches to Big Data problem', 1, 20, 'SWE_0002', 1, 4),
(6, 'Data Analytics Infrastructure', 'The module introduces Business Intelligence/Analytics and Data Infrastructure', 1, 20, 'SWE_0002', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `Semester_ID` int(11) NOT NULL,
  `Year` year(4) NOT NULL,
  `Start Date` date NOT NULL,
  `End Date` date NOT NULL,
  `Semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`Semester_ID`, `Year`, `Start Date`, `End Date`, `Semester`) VALUES
(1, 2022, '2022-09-19', '2023-01-06', 1),
(2, 2023, '2023-01-09', '2023-05-15', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `std_id` int(11) NOT NULL,
  `student_forname` text NOT NULL,
  `student_surname` text NOT NULL,
  `student_email` text NOT NULL,
  `student_category` text NOT NULL,
  `course_code` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`std_id`, `student_forname`, `student_surname`, `student_email`, `student_category`, `course_code`) VALUES
(1, 'Farheen', 'Siddiqui', 'fs@bolton.ac.uk', 'International', 'SWE_0001'),
(2, 'Rital', 'Paneliya', 'rp@bolton.ac.uk', 'Internaional', 'SWE_0001'),
(3, 'Jay', 'Payalakurthi', 'jp@bolton.ac.uk', 'International', 'SWE_0002'),
(4, 'Sifat', 'Shinwari', 'ss@bolton.ac.uk', 'International', 'SWE_0002'),
(5, 'Madhuri', 'Dadeniya', 'md@bolton.ac.uk', 'International', 'SWE_0001');

-- --------------------------------------------------------

--
-- Table structure for table `student_transcript`
--

CREATE TABLE `student_transcript` (
  `student_transcript_id` int(11) NOT NULL,
  `module_mark` varchar(30) NOT NULL,
  `student_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `course_code` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_transcript`
--

INSERT INTO `student_transcript` (`student_transcript_id`, `module_mark`, `student_id`, `module_id`, `course_code`) VALUES
(1, '50', 1, 1, 'SWE_0001'),
(2, '50', 1, 2, 'SWE_0001'),
(3, '50', 1, 4, 'SWE_0001'),
(4, '50', 1, 3, 'SWE_0001'),
(5, '50', 2, 1, 'SWE_0001'),
(6, '50', 2, 2, 'SWE_0001');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_event`
--

CREATE TABLE `timetable_event` (
  `timetable_event_id` int(11) NOT NULL,
  `timetable_event_day` text NOT NULL,
  `timetable_event_timestart` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timetable_event_duration` int(11) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `timetable_event`
--

INSERT INTO `timetable_event` (`timetable_event_id`, `timetable_event_day`, `timetable_event_timestart`, `timetable_event_duration`, `module_id`) VALUES
(1, '', '2022-11-01 03:30:00', 3, 1),
(2, '', '2022-11-02 03:30:00', 3, 2),
(3, '', '2023-02-01 03:30:00', 3, 3),
(4, '', '2023-02-02 03:30:00', 3, 4),
(5, '', '2023-03-01 03:30:00', 3, 5),
(6, '', '2023-04-03 03:30:00', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `tutor_id` int(11) NOT NULL,
  `tutor_forname` varchar(60) NOT NULL,
  `tutor_surname` varchar(60) NOT NULL,
  `tutor_email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`tutor_id`, `tutor_forname`, `tutor_surname`, `tutor_email`) VALUES
(1, 'Celestine', 'Iwendi', 'Celestine@bolton.ac.uk'),
(2, 'Naveed ', 'Islam', 'Naveed@bolton.ac.uk'),
(3, 'Ibtisam', 'Mogul', 'Ibtisam@bolton.ac.uk'),
(4, 'Anchal', 'Garge', 'Anchal@bolton.ac.uk'),
(6, 'Francis', 'Morrissey', 'Francis@bolton.ac.uk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_address_student_id` (`student_id`);

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `fk_applicant_student_id` (`student_id`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `fk_application_student_id` (`student_id`),
  ADD KEY `application_course_code` (`course_code`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `fk_attendance_timetable_event_id` (`timetable_event_id`),
  ADD KEY `fk_attendance_student_id` (`student_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_code`),
  ADD UNIQUE KEY `course_title` (`course_title`) USING HASH;

--
-- Indexes for table `enrolment`
--
ALTER TABLE `enrolment`
  ADD PRIMARY KEY (`enrolment_id`),
  ADD KEY `fk_enrolment_student_id` (`student_id`),
  ADD KEY `fk_enrolment_course_code` (`course_code`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `fk_module_course_code` (`course_code`),
  ADD KEY `fk_module_semester` (`Semester_ID`),
  ADD KEY `fk_module_taught_by` (`Taught_by`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`Semester_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`std_id`),
  ADD UNIQUE KEY `uq_student_email` (`student_email`) USING HASH,
  ADD KEY `fk_student_course_code` (`course_code`);

--
-- Indexes for table `student_transcript`
--
ALTER TABLE `student_transcript`
  ADD PRIMARY KEY (`student_transcript_id`),
  ADD KEY `fk_student_trancript_student_id` (`student_id`),
  ADD KEY `fk_student_trancript_module_id` (`module_id`),
  ADD KEY `fk_student_trancript_course_id` (`course_code`);

--
-- Indexes for table `timetable_event`
--
ALTER TABLE `timetable_event`
  ADD PRIMARY KEY (`timetable_event_id`),
  ADD KEY `fk_timetable_event_module_id` (`module_id`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`tutor_id`),
  ADD UNIQUE KEY `tutor_email` (`tutor_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `enrolment`
--
ALTER TABLE `enrolment`
  MODIFY `enrolment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `timetable_event`
--
ALTER TABLE `timetable_event`
  MODIFY `timetable_event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `tutor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applicant`
--
ALTER TABLE `applicant`
  ADD CONSTRAINT `fk_applicant_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_course_code` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_application_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_attendance_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_attendance_timetable_event_id` FOREIGN KEY (`timetable_event_id`) REFERENCES `timetable_event` (`timetable_event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrolment`
--
ALTER TABLE `enrolment`
  ADD CONSTRAINT `fk_enrolment_course_code` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enrolment_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `fk_module_course_code` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_module_semester` FOREIGN KEY (`Semester_ID`) REFERENCES `semester` (`Semester_ID`),
  ADD CONSTRAINT `fk_module_taught_by` FOREIGN KEY (`Taught_by`) REFERENCES `tutor` (`tutor_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_course_code` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_transcript`
--
ALTER TABLE `student_transcript`
  ADD CONSTRAINT `fk_student_trancript_course_id` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_trancript_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_trancript_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timetable_event`
--
ALTER TABLE `timetable_event`
  ADD CONSTRAINT `fk_timetable_event_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
