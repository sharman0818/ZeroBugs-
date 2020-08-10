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
(1, 'Bench Press', 'Chest', 'https://www.youtube.com/watch?v=vthMCtgVtFw', 3),
(2, 'Incline Bench Press', 'Chest', 'https://www.youtube.com/watch?v=SrqOu55lrYU', 1),
(3, 'Decline Bench Press', 'Chest', 'https://www.youtube.com/watch?v=LfyQBUKR8SE', 1)
(4, 'Planks', 'Core', 'https://www.youtube.com/watch?v=pSHjTRCQxIw', 2)
(5, 'Crunches', 'Core', 'https://www.youtube.com/watch?v=MKmrqcoCZ-M', 2)
(6, 'Leg Raises', 'Core', 'https://www.youtube.com/watch?v=l4kQd9eWclE', 2)
(7, 'Dumbbell Curl', 'Arm', 'https://www.youtube.com/watch?v=ykJmrZ5v0Oo', 5)
(8, 'Dips', 'Arm', 'https://www.youtube.com/watch?v=jdFzYGmvDyg', 3)
(9, 'Pull-Ups', 'Arm', 'https://www.youtube.com/watch?v=IpxAG2z91Ys', 3)
(10, 'Squats', 'Legs', 'https://www.youtube.com/watch?v=aclHkVaku9U', 1)
(11, 'Deadlift', 'Legs', 'https://www.youtube.com/watch?v=hCDzSR6bW10', 1)
(12, 'Calf Raises', 'Legs', 'https://www.youtube.com/watch?v=-M4-G8p8fmc', 4)
(13, 'Dumbbell Shoulder Press', 'Shoulder', 'https://www.youtube.com/watch?v=qEwKCR5JCog', 3)
(14, 'Dumbbell Lateral Press', 'Shoulder', 'https://www.youtube.com/watch?v=3VcKaXpzqRo', 3)
(15, 'Barbell Shrugs', 'Shoulder', 'https://www.youtube.com/watch?v=NAqCVe2mwzM', 2)
(16, 'Cable Row', 'Chest', 'https://www.youtube.com/watch?v=GZbfZ033f74', 5)
(17, 'Lat Pull-down', 'Chest', 'https://www.youtube.com/watch?v=CAwf7n6Luuc', 5)
(18, 'Kettlebell Swings', 'Chest', 'https://www.youtube.com/watch?v=YSxHifyI6s8', 3);

-- --------------------------------------------------------

--
-- Table structure for table `DailyWorkouts`
--

CREATE TABLE `DailyWorkouts` (
  `listID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2,
  `userID` int(11) NOT NULL,
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

INSERT INTO `DailyWorkouts` (`listID`, `userID`, `workoutName`, `bodyPart`, `linkToVideo`, `date`, `sets`, `reps`) VALUES
(1, 1, 'Bench Press', 'Chest', '#', '2020-08-02', 4, 10),
(2, 1, 'Sit Ups', 'Core', '#', '2020-08-02', 4, 14),
(3, 2, 'Squats', 'Legs', '#', '2020-08-02', 3, 7),
(4, 2, 'Bench Press', 'Chest', '#', '2020-08-02', 3, 8);

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
