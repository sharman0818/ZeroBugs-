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
-- Table structure for table `UserWorkouts`
--

CREATE TABLE `UserWorkouts` (
  `userWorkoutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3,
  `workoutName` varchar(20) NOT NULL,
  `bodyPart` varchar(20) NOT NULL,
  `completed` varchar(20) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `workoutDate` date NOT NULL,
  `sets` int(11) NOT NULL,
  `reps` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserWorkouts`
--

INSERT INTO `UserWorkouts` (`userWorkoutID`, `workoutName`, `bodyPart`, `completed`, `userID`, `workoutDate`, `sets`, `reps`) VALUES
(1, `Squats`, `Legs`, `Y`, 1, '2020-08-01', 3, 10),
(2, `Bench Press`, `Chest`, `N`, 2, '2020-07-31', 4, 6)
(1, 'Bench Press', 'Chest', 'N', 1, '2020-08-02', 4, 10),
(2, 'Sit Ups', 'Core', 'N', 1, '2020-08-02', 4, 14),
(3, 'Squats', 'Legs', 'N', 2, '2020-08-02', 3, 7),
(4, 'Bench Press', 'Chest', `N`, 2, '2020-08-02', 3, 8);

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

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5,
  `postUserID` int(11) NOT NULL,
  `likes` int(22) IDENTITY (0, 1),
  `postText` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`postID`, `postUserID`, `postText`) VALUES
(5, 1, 'I am so awesome because I workout'),
(10, 1, 'This is a comment by a user. Just saying.'),
(15, 2, 'I like to squat and bench press'),
(20, 2, 'To be or not to be that is the question.  Foo bar');


-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `commentPostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5,
  `commentUserID` int(11) NOT NULL,
  `commentText` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`postID`, `commentUserID`, `commentText`) VALUES
(5, 2, 'I am the second test user and I am commenting on this'),
(5, 1, 'Thank you for your input.'),
(20, 1, 'You like to work out.'),
(20, 2, 'Yes I do.');

-- --------------------------------------------------------
--
-- Indexes for dumped tables
--

--
-- Indexes for table `CompletedWorkouts`
--
ALTER TABLE `UserWorkouts`
  ADD PRIMARY KEY (`userWorkoutID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `Workouts`
--
ALTER TABLE `Workouts`
  ADD PRIMARY KEY (`workoutID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD KEY `postID` (`postID`),
  ADD KEY `userID` (`userID`);

--

-- Constraints for dumped tables
--

--
-- Constraints for table `UserWorkouts`
--
ALTER TABLE `UserWorkouts`
  ADD CONSTRAINT `UserWorkouts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

--
-- Constraints for table `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`postUserID`) REFERENCES `Users` (`userID`);

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`commentUserID`) REFERENCES `Users` (`userID`);
  ADD CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`commentPostID`) REFERENCES `Posts` (`postID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
