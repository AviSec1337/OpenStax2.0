-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2025 at 07:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `file_path`, `user_id`, `created_at`) VALUES
(1, 'tt', 'tttt', '../uploads/courses/mynotes.txt', 17, '2025-01-04 19:23:33'),
(2, 'tt', 'tttt', '../uploads/courses/mynotes.txt', 17, '2025-01-04 19:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `filename`, `filepath`, `uploaded_at`, `user_id`) VALUES
(1, 'Arrays in java.pptx', 'uploads/Arrays in java.pptx', '2024-12-19 01:44:33', 1),
(2, 'DBMS.docx', '../uploads/DBMS.docx', '2024-12-19 01:46:20', 1),
(3, 'JAVA.pptx', '../uploads/JAVA.pptx', '2024-12-19 01:57:41', 1),
(14, 'Arrays in java.pptx', '../uploads/Arrays in java.pptx', '2024-12-19 02:39:50', 1),
(19, 'Architecture design.drawio.png', '../uploads/Architecture design.drawio.png', '2025-01-01 03:55:39', 1),
(20, 'mynotes.txt', '../uploads/mynotes.txt', '2025-01-03 16:32:00', 17),
(21, 'mynotes.txt', '../uploads/mynotes.txt', '2025-01-03 16:38:43', 17),
(22, 'mynotes.txt', '../uploads/mynotes.txt', '2025-01-04 17:54:43', 0),
(23, 'mynotes.txt', '../uploads/mynotes.txt', '2025-01-04 17:54:52', 0),
(24, 'mynotes.txt', '../uploads/mynotes.txt', '2025-01-04 17:54:55', 0),
(25, 'myvid.mp4', '../uploads/myvid.mp4', '2025-01-04 18:25:17', 0),
(26, 'myvid.mp4', '../uploads/myvid.mp4', '2025-01-04 18:26:38', 0),
(27, 'myvid.mp4', '../uploads/myvid.mp4', '2025-01-04 18:27:29', 0);

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
(1, 17, 22, 'note', 'denied', '2025-01-04 17:54:43'),
(2, 17, 23, 'note', 'approved', '2025-01-04 17:54:52'),
(3, 17, 24, 'note', 'approved', '2025-01-04 17:54:55'),
(4, 17, 25, 'video', 'denied', '2025-01-04 18:25:17'),
(5, 17, 26, 'video', 'denied', '2025-01-04 18:26:38'),
(6, 17, 27, 'video', 'denied', '2025-01-04 18:27:29'),
(7, 17, 8, 'file', 'approved', '2025-01-04 19:12:20'),
(8, 17, 9, '', 'approved', '2025-01-04 19:13:11'),
(9, 17, 10, '', 'approved', '2025-01-04 19:15:57'),
(10, 17, 11, '', 'denied', '2025-01-04 19:16:05'),
(11, 17, 12, 'video', 'approved', '2025-01-04 19:16:19'),
(12, 17, 13, 'video', 'approved', '2025-01-04 19:16:28'),
(14, 17, 16, '', 'approved', '2025-01-04 20:21:45'),
(15, 17, 17, 'file', 'denied', '2025-01-04 20:22:29'),
(16, 17, 18, 'file', 'denied', '2025-01-04 20:22:40'),
(17, 21, 19, 'file', 'approved', '2025-01-05 11:01:59'),
(18, 21, 20, 'file', 'denied', '2025-01-05 11:03:17'),
(19, 21, 21, 'file', 'denied', '2025-01-05 11:03:35'),
(20, 21, 22, 'file', 'approved', '2025-01-05 11:03:45'),
(21, 21, 23, 'file', 'approved', '2025-01-09 10:36:03'),
(22, 21, 24, 'file', 'pending', '2025-01-09 10:36:38'),
(23, 21, 25, '', 'approved', '2025-01-09 10:37:32'),
(24, 21, 26, '', 'pending', '2025-01-09 10:37:40'),
(25, 21, 27, 'file', 'approved', '2025-01-10 11:03:47'),
(29, 17, 31, 'video', 'approved', '2025-01-10 12:00:09'),
(30, 17, 32, 'video', 'pending', '2025-01-10 12:00:29'),
(31, 21, 33, '', 'approved', '2025-01-10 12:19:42'),
(32, 27, 34, 'file', 'approved', '2025-01-13 06:31:51'),
(37, 27, 39, '', 'approved', '2025-01-13 06:44:13');

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
(11, 'Ram bahadur ', 'Khadka', 'rambdr@gmail.com', '$2y$10$1j95shy4Wcy31BKEzIrE4uCOmOj/ZossiRC6WwAP6iCWMJfpuumYG', '2024-12-19 16:33:43', 'user'),
(13, 'sudeep', 'bhattrai', 'sudeep@gmail.com', '$2y$10$XDqblglEPJFgQ.aQA9CqR./dgZkgAk9QjPXAal4yWNLoe3W20l.l2', '2024-12-20 01:03:03', 'user'),
(17, 'Abishek', 'Bahadur', 'abishek@gmail.com', '$2y$10$h2XaUseQDQJAaUytfYkPwuFrvGNWpfEieHLXaHAITtnLIOsGsAAqS', '2025-01-03 15:56:11', 'user'),
(18, 'admin', 'admin', 'admin@example.com', '$2y$10$p49uaX4/7AHbtWz/7dCfUuf978SmfLPxJlbW1uRBRqh0P5a2ufQFy', '2025-01-03 16:47:10', 'admin'),
(19, 'John', 'Doe', 'john.doe@example.com', '$2y$10$FGftXJJVaEDyN3E.vucjP.OKL275cMNIDfndE6AWjFC1lkz0f4Pj2', '2025-01-03 16:52:18', 'admin'),
(21, 'hahaha', 'hohoho', 'abishek1@gmail.com', '$2y$10$q60IxYKOQAFCebj0dsUug.mqzpwCkOzW2V/JbU.o4a1zaof4t2Z46', '2025-01-04 20:24:01', 'user'),
(22, 'test', 'test', 'test@example.com', '$2y$10$Wezlb0fDvW3togAyEiytIe4gnuQzFUgsv8.v3qgmds.Uw1DnFyrve', '2025-01-05 02:01:49', 'user'),
(23, 'test', 'test', 'testtest@example.com', '$2y$10$cztSt2.Do.SP7hHqYAoMneh0TC0EHMtfG3isvycFo2QHIZXRCXCRy', '2025-01-09 10:33:14', 'user'),
(24, 'Abishek', 'Shrestha', 'testtesttest@example.com', '$2y$10$02wmi5Eadj/Sl14Gi9mVxezCa6HgTBRJpFBbGLXVoTpxIjn9wrfue', '2025-01-09 10:33:50', 'user'),
(25, 'admin', 'admin', 'admintest@example.com', '$2y$10$P8wOSRsfSYi43vqewro0TebTtWrG7dVWHRA8G.TSjoM3knRQt0Ab6', '2025-01-09 10:39:19', 'user'),
(26, 'test', 'test', '1@example.com', '$2y$10$qMj8njCLMkXB5WuZYH1QpeLAYkGAmtmEby9aV5HqqXDD8xVIaJ2Om', '2025-01-09 10:45:58', 'admin'),
(27, 'Nirmal', 'Poudel', 'nirmalpoudel@gmail.com', '$2y$10$CewneoHaO5G1qQG3UVEaI./WwqJth/6QfKsjs/x1y2nl0sSwf2x/e', '2025-01-13 06:30:29', 'user');

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
(2, 0, 'Resource 2', 'Description for resource 2', '../uploads/sample2.docx', '2025-01-04 17:06:12', 'audio'),
(3, 0, 'Resource 3', 'Description for resource 3', '../uploads/sample3.pptx', '2025-01-04 17:06:12', 'audio'),
(5, 0, 'testtt', 'testtt', '../uploads/myvid.mp4', '2025-01-04 17:24:28', 'audio'),
(6, 0, 'tttesttt', 'testtttt', '../uploads/myvid.mp4', '2025-01-04 17:25:00', 'video'),
(8, 0, 'nnote', 'note', '../uploads/mynotes.txt', '2025-01-04 19:12:20', 'file'),
(10, 0, 'te', 'test', '../uploads/myvid.mp4', '2025-01-04 19:15:57', 'audio'),
(12, 0, 'vv', 'vv', '../uploads/myvid.mp4', '2025-01-04 19:16:19', 'video'),
(13, 0, 'vv', 'vv', '../uploads/myvid.mp4', '2025-01-04 19:16:28', 'video'),
(15, 0, 'tttt', 'ttttt', 'https://www.youtube.com/watch?v=Exl4P3fsF7U', '2025-01-04 20:10:06', 'youtube'),
(16, 0, 'test', 'test', 'https://www.youtube.com/watch?v=Exl4P3fsF7U', '2025-01-04 20:21:45', 'youtube'),
(17, 0, 'tt', 'tt', '../uploads/IDOR (1).pdf', '2025-01-04 20:22:29', 'file'),
(18, 0, 'tt', 'tt', '../uploads/IDOR (1).pdf', '2025-01-04 20:22:40', 'file'),
(19, 0, 'my res', 'res', '../uploads/IDOR (1).pdf', '2025-01-05 11:01:59', 'file'),
(20, 0, 'my res', 'res', '../uploads/IDOR (1).pdf', '2025-01-05 11:03:17', 'file'),
(21, 0, 'rrrr', 'rrrr', '../uploads/openstax (1).sql', '2025-01-05 11:03:35', 'file'),
(22, 0, 'rrrr', 'rrrr', '../uploads/openstax (1).sql', '2025-01-05 11:03:45', 'file'),
(23, 0, 'NXLOG', 'Agent File', '../uploads/nxlog-ce-3.2.2329_rhel9.x86_64.rpm', '2025-01-09 10:36:03', 'file'),
(24, 0, 'NXLOG', 'Agent File', '../uploads/nxlog-ce-3.2.2329_rhel9.x86_64.rpm', '2025-01-09 10:36:38', 'file'),
(25, 0, 'youtube', 'youtube', 'https://www.youtube.com/watch?v=HPF8y_gDP7w', '2025-01-09 10:37:32', 'youtube'),
(26, 0, 'youtube', 'youtube', 'https://www.youtube.com/watch?v=HPF8y_gDP7w', '2025-01-09 10:37:40', 'youtube'),
(27, 0, 'ttesttt', 'test', '../uploads/1736311203044.jpg', '2025-01-10 11:03:47', 'file'),
(31, 17, 'bahadur', 'bahadur', '../uploads/tutor3.jpg', '2025-01-10 12:00:09', 'video'),
(32, 17, 'bahadur', 'bahadur', '../uploads/tutor3.jpg', '2025-01-10 12:00:29', 'video'),
(33, 21, 'testtttt', 'testt', '../uploads/1736311203044.jpg', '2025-01-10 12:19:42', 'audio'),
(34, 27, 'redhat', 'redhat', '../uploads/redhat-certified-engineer-linux-study-guide1.pdf', '2025-01-13 06:31:51', 'file'),
(39, 27, 'CKC', 'CKC', 'https://www.youtube.com/watch?v=LqCbpiDyN8o&t=249s', '2025-01-13 06:44:13', 'youtube');

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
(1, 'Abishek Shrestha', 'best of the best'),
(2, 'Krinisha', 'One of the best LMS portal ever created.'),
(3, 'test', 'test'),
(4, 'kri', 'kri'),
(5, 'testtttes', 'testtt'),
(6, 'Abishek Kafle', 'test test'),
(7, 'Gori Aryal', 'Best LMS Portal ever created.'),
(8, 'Nirmal Poudel', 'Atti nia babbal LMS website.');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `file_path`, `uploaded_at`, `user_id`) VALUES
(1, 'CV', 'uploads/IMG_9996 - Copy.MOV', '2024-12-30 16:11:06', 1),
(2, 'CV', 'uploads/IMG_9996 - Copy.MOV', '2024-12-30 16:11:32', 1),
(3, 'CV', 'uploads/IMG_9996 - Copy.MOV', '2024-12-30 16:16:03', 1),
(4, 'CV', 'uploads/IMG_9996 - Copy.MOV', '2024-12-30 16:16:20', 1),
(5, 'me', 'uploads/6773a906a0c67_8ce657131283c5d41fe3a9bf4937db77.mp4', '2024-12-31 08:19:18', 1),
(6, 'me', 'uploads/6773a91145203_8ce657131283c5d41fe3a9bf4937db77.mp4', '2024-12-31 08:19:29', 1),
(7, 'myvid.mp4', '../uploads/myvid.mp4', '2025-01-03 16:35:39', 17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
