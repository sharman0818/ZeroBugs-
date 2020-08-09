-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: 
-- Server version: 10.4.11-MariaDB-log
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zeroBugs_workout`
--

-- --------------------------------------------------------

--
-- Table structure for table `CompletedWorkouts`
--

CREATE TABLE `CompletedWorkouts` (
  `completionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3,
  `workoutName` varchar(20) NOT NULL,
  `bodyPart` varchar(20) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `workoutDate` date NOT NULL,
  `sets` int(11) NOT NULL,
  `reps` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CompletedWorkouts`
--

INSERT INTO `CompletedWorkouts` (`completionID`, `workoutName`, `bodyPart`, `userID`, `workoutDate`, `sets`, `reps`) VALUES
(1, `Squats`, `Legs`, 1, '2020-08-01', 3, 10),
(2, `Bench Press`, `Chest`, 2, '2020-07-31', 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Workouts`
--

CREATE TABLE `Workouts` (
  `workoutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5,
  `workoutName` varchar(20) NOT NULL,
  `bodyPart` varchar(20) NOT NULL,
  `linkToVideo` varchar(20) NOT NULL,
  `baseReps` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Workouts`
--

INSERT INTO `Workouts` (`workoutID`, `workoutName`, `bodyPart`, `linkToVideo`, `baseReps`) VALUES
(1, 'Squats', 'Legs', '#', 0),
(2, 'Bench Press', 'Chest', '#', 1),
(3, 'Sit Ups', 'Core', '#', 5);

-- --------------------------------------------------------

--
-- Table structure for table `DailyWorkouts`
--

CREATE TABLE `DailyWorkouts` (
  `listID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2,
  `userID` int(11) NOT NULL,
  `workoutID` int(11) NOT NULL,
  `workoutName` varchar(20) NOT NULL,
  `bodyPart` varchar(20) NOT NULL,
  `linkToVideo` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `sets` int(2) NOT NULL,
  `reps` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DailyWorkouts`
--

INSERT INTO `DailyWorkouts` (`listID`, `userID`, `worrkoutID`, `workoutName`, `bodyPart`, `linkToVideo`, `date`, `sets`, `reps`) VALUES
(1, 1, 2, 'Bench Press', 'Chest', '#', '2020-08-02', 4, 10),
(2, 1, 3, 'Sit Ups', 'Core', '#', '2020-08-02', 4, 14),
(3, 2, 1, 'Squats', 'Legs', '#', '2020-08-02', 3, 7),
(4, 2, 2, 'Bench Press', 'Chest', '#', '2020-08-02', 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4,
  `userName` varchar(20) NOT NULL,
  `userPW` varchar(200) NOT NULL,
  `userEmail` varchar(30) NOT NULL,
  `userGender` varchar(20) NOT NULL,
  `userAge` int(11) NOT NULL,
  `ageRepAdd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `userName`, `userPW`, `userEmail`, `userGender`, `userAge`, `ageRepAdd`) VALUES
(1, 'test1', 'BoyPerson', 'password1', 'bp@gmail.com', 'male', 50, 9),
(2, 'test2', 'GirlPerson', 'password2', 'gp@yahoo.com', 'female', 70, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CompletedWorkouts`
--
ALTER TABLE `CompletedWorkouts`
  ADD PRIMARY KEY (`workoutID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `Workouts`
--
ALTER TABLE `Workouts`
  ADD PRIMARY KEY (`workoutID`);

--
-- Indexes for table `DailyWorkouts`
--
ALTER TABLE `DailyWorkouts`
  ADD PRIMARY KEY (`listID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `workoutID` (`workoutID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--

-- Constraints for dumped tables
--

--
-- Constraints for table `CompletedWorkouts`
--
ALTER TABLE `CompletedWorkouts`
  ADD CONSTRAINT `Fulfillments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

--
-- Constraints for table `DailyWorkouts`
--
ALTER TABLE `DailyWorkouts`
  ADD CONSTRAINT `RequestedItems_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
