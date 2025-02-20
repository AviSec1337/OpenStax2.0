-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 03:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `openstax`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `resource_type` enum('note','video','file') NOT NULL,
  `status` enum('pending','approved','denied') DEFAULT 'pending',
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `user_id`, `resource_id`, `resource_type`, `status`, `requested_at`) VALUES
(39, 28, 41, 'file', 'denied', '2025-01-25 09:25:40'),
(42, 28, 44, '', 'approved', '2025-02-17 12:38:55'),
(43, 28, 45, '', 'pending', '2025-02-17 12:39:17'),
(44, 28, 46, '', 'approved', '2025-02-17 15:34:35'),
(45, 28, 47, '', 'pending', '2025-02-17 15:35:07'),
(48, 28, 50, '', 'pending', '2025-02-17 15:51:59'),
(49, 28, 51, '', 'approved', '2025-02-17 15:52:06'),
(50, 28, 52, '', 'pending', '2025-02-17 15:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `role`) VALUES
(9, 'krinisha', 'Shrestha', 'shamyashrestha21st@gmail.com', '$2y$10$c9xKoeD7MhEIBojdoo2O5udUpWYWTgSrhfLwiRY/muocAI2XxXNfy', '2024-12-19 02:44:19', 'user'),
(13, 'sudeep', 'bhattrai', 'sudeep@gmail.com', '$2y$10$XDqblglEPJFgQ.aQA9CqR./dgZkgAk9QjPXAal4yWNLoe3W20l.l2', '2024-12-20 01:03:03', 'user'),
(28, 'test', 'test', 'test@gmail.com', '$2y$10$zKf3WUv5J0sRc4h.9n3xFuceRtjRgb5kZLVS3VqYqtqdLiZ1E6ljW', '2025-01-22 16:33:29', 'user'),
(31, 'Krinisha', 'Shrestha', 'krinishashrestha@gmail.com', '$2y$10$tjp6ckweUN52vBwtsLqb9.ASZ5IWDdOf5wp3G9RR4Bh5Z1wGN1/Mm', '2025-02-20 14:06:09', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('audio','video','file','youtube') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `user_id`, `name`, `description`, `file_path`, `created_at`, `type`) VALUES
(5, 0, 'testtt', 'testtt', '../uploads/myvid.mp4', '2025-01-04 17:24:28', 'audio'),
(6, 0, 'tttesttt', 'testtttt', '../uploads/myvid.mp4', '2025-01-04 17:25:00', 'video'),
(8, 0, 'nnote', 'note', '../uploads/mynotes.txt', '2025-01-04 19:12:20', 'file'),
(39, 27, 'CKC', 'CKC', 'https://www.youtube.com/watch?v=LqCbpiDyN8o&t=249s', '2025-01-13 06:44:13', 'youtube'),
(41, 28, 'Krinisha', 'my files', '../uploads/Context diagram.drawio.png', '2025-01-25 09:25:40', 'file'),
(44, 28, 'Me', 'My JS learning experience', 'https://youtu.be/EerdGm-ehJQ?si=SggfiEi2VrslOEas', '2025-02-17 12:38:55', 'youtube'),
(45, 28, 'Me', 'My JS learning experience', 'https://youtu.be/EerdGm-ehJQ?si=SggfiEi2VrslOEas', '2025-02-17 12:39:17', 'youtube'),
(46, 28, 'my resource', 'java', 'https://www.youtube.com/watch?v=EerdGm-ehJQ', '2025-02-17 15:34:35', 'youtube'),
(47, 28, 'my resource', 'java', 'https://www.youtube.com/watch?v=EerdGm-ehJQ', '2025-02-17 15:35:07', 'youtube'),
(50, 28, 'my music', 'jpt', 'https://www.youtube.com/watch?v=HGTJBPNC-Gw', '2025-02-17 15:51:59', 'youtube'),
(51, 28, 'my music', 'jpt', 'https://www.youtube.com/watch?v=HGTJBPNC-Gw', '2025-02-17 15:52:06', 'youtube'),
(52, 28, 'my music', 'jpt', 'https://www.youtube.com/watch?v=HGTJBPNC-Gw', '2025-02-17 15:52:21', 'youtube');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `full_name`, `comment`) VALUES
(2, 'Krinisha', 'One of the best LMS portal ever created.'),
(3, 'test', 'test'),
(10, 'Nuts', 'nice note shared file'),
(11, 'Krinisha Shrestha', 'my experience in OpenStax was incredible.'),
(12, 'Hari', 'Best LMS Site.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
