-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2023 at 01:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_login_table`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_table`
--

CREATE TABLE `chat_table` (
  `ID` int(11) NOT NULL,
  `Receiver_Id` int(11) NOT NULL,
  `Sender_id` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL,
  `Time_stamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_table`
--

INSERT INTO `chat_table` (`ID`, `Receiver_Id`, `Sender_id`, `Message`, `Time_stamp`) VALUES
(1, 4, 1, 'Hi', '2023-11-14 11:27:11'),
(2, 4, 1, 'hello dude', '2023-11-16 12:57:11'),
(4, 1, 4, 'kyaa karee', '2023-11-16 12:59:13'),
(7, 4, 1, 'nothing', '2023-11-18 11:43:42');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `Likes_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`ID`, `user_id`, `post_id`, `Likes_status`) VALUES
(1, 1, 2, 1),
(2, 3, 2, 0),
(3, 3, 4, 1),
(4, 3, 10, 0),
(5, 9, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post__table`
--

CREATE TABLE `post__table` (
  `ID` int(192) NOT NULL,
  `user_id` int(192) NOT NULL,
  `Title` varchar(192) NOT NULL,
  `Description` varchar(192) NOT NULL,
  `Image` varchar(192) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post__table`
--

INSERT INTO `post__table` (`ID`, `user_id`, `Title`, `Description`, `Image`) VALUES
(2, 2, 'Colors', 'Joyful Mood', 'S5.jpeg-1700027486373'),
(3, 3, 'Nature', 'Feeling Better', 'N2.jpg-1700027346674'),
(4, 4, 'Scenery', 'Nice one', 'N1.jpg-1699967502967'),
(5, 5, 'Courses', 'Build your Network', 'c2.jpg-1700027692714'),
(10, 1, 'aadhi', 'coder', 'bg.jpg-1700205260349');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Name` varchar(192) NOT NULL,
  `email` varchar(192) NOT NULL,
  `contact` varchar(192) NOT NULL,
  `Password` varchar(192) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Name`, `email`, `contact`, `Password`) VALUES
(1, 'Kiran', 'kiran@gmail.com', '5454', 'kir1'),
(2, 'Saksham', 'saksham@gmail.com', '4656', 'sak1'),
(3, 'Yash', 'yash@gmail.com', '7857', 'yas1'),
(4, 'Aadi', 'aadi@gmail.com', '15413', 'adi1'),
(5, 'shiv', 'shiv@gmail.com', '8431', 'shi1'),
(9, 'Shikha', '45176', 'shi@gmail.com', 'shi1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_table`
--
ALTER TABLE `chat_table`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sender_id` (`Sender_id`),
  ADD KEY `Receiver_Id` (`Receiver_Id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `post__table`
--
ALTER TABLE `post__table`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_table`
--
ALTER TABLE `chat_table`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post__table`
--
ALTER TABLE `post__table`
  MODIFY `ID` int(192) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_table`
--
ALTER TABLE `chat_table`
  ADD CONSTRAINT `chat_table_ibfk_1` FOREIGN KEY (`Sender_id`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `chat_table_ibfk_2` FOREIGN KEY (`Receiver_Id`) REFERENCES `user` (`ID`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post__table` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
