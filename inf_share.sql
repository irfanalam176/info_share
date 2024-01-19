-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2024 at 03:15 PM
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
-- Database: `inf_share`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `blogCard` ()   SELECT blog_id,title,thumbnail,description,user_id FROM blogs$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletBlog` (IN `blogId` VARCHAR(255))   DELETE FROM blogs WHERE blog_id=blogId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `postBlog` (IN `blogId` VARCHAR(255), IN `blogTitle` VARCHAR(255), IN `blogThumbnail` VARCHAR(255), IN `blogDescription` VARCHAR(255), IN `blogData` LONGTEXT, IN `userId` VARCHAR(255))   INSERT INTO blogs(blog_id,title,thumbnail,description,blog,user_id) VALUES(blogId,blogTitle,blogThumbnail,blogDescription,blogData,userId)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `profileCard` (IN `userId` VARCHAR(255))   SELECT blog_id,title,thumbnail,description,user_id FROM blogs WHERE user_id=userId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `readBlog` (IN `blogId` VARCHAR(255))   SELECT blog FROM blogs WHERE blog_id=blogId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `searchBlog` (IN `searchDescription` VARCHAR(255))   SELECT blog_id,title,thumbnail,description,user_id FROM blogs WHERE description LIKE CONCAT('%', searchDescription, '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `signIn` (IN `userEmail` VARCHAR(255))   SELECT *FROM user WHERE email=userEmail$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `signUp` (IN `userId` VARCHAR(255), IN `userName` TEXT, IN `userEmail` VARCHAR(255), IN `userPassword` VARCHAR(255))   INSERT INTO user(user_id,user_name,email,password) VALUES(userId,userName,userEmail,userPassword)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `userSelection` (IN `userId` VARCHAR(255))   SELECT user_name FROM user WHERE user_id=userId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `blog` longtext NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `user_name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_2` (`email`,`password`),
  ADD KEY `email_3` (`email`,`password`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
