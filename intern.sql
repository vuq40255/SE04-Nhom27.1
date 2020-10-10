-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 09, 2020 lúc 05:59 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `intern`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assigned_table`
--

CREATE TABLE `assigned_table` (
  `id` int(11) NOT NULL,
  `organization_request_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `capacity_dictionary`
--

CREATE TABLE `capacity_dictionary` (
  `id` int(11) NOT NULL,
  `ability_name` varchar(20) NOT NULL,
  `aibility_type` varchar(20) NOT NULL,
  `ability_note` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `capacity_dictionary`
--

INSERT INTO `capacity_dictionary` (`id`, `ability_name`, `aibility_type`, `ability_note`) VALUES
(1, '1', '1', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `enterprise`
--

CREATE TABLE `enterprise` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `date_establish` date DEFAULT NULL,
  `employee_count` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `cover_img` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gross_revenue` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `enterprise_recruitment_request_form`
--

CREATE TABLE `enterprise_recruitment_request_form` (
  `ID` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `short_description` text NOT NULL,
  `amount` int(11) NOT NULL,
  `date_submitted` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `enterprise_recruitment_request_form`
--

INSERT INTO `enterprise_recruitment_request_form` (`ID`, `organization_id`, `subject`, `short_description`, `amount`, `date_submitted`, `status`) VALUES
(1, 1, 'Request full stack web developer', 'java, react', 1, '2019-11-04', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_of_required_capacity_of_each_request_coupon`
--

CREATE TABLE `list_of_required_capacity_of_each_request_coupon` (
  `id` int(11) NOT NULL,
  `organization_request_id` int(11) NOT NULL,
  `ability_id` int(11) NOT NULL,
  `ability_required` int(11) NOT NULL,
  `note` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1602215405),
('m130524_201442_init', 1602215408),
('m190124_110200_add_verification_token_column_to_user_table', 1602215408),
('m201007_082621_create_news_table_student', 1602215408),
('m201007_082857_create_news_table_enterprise', 1602215409),
('m201007_083831_create_news_table_teachers', 1602215409);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_registration`
--

CREATE TABLE `student_registration` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `submit_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_skill_profile`
--

CREATE TABLE `student_skill_profile` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `ability_id` int(11) NOT NULL,
  `ability_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `assigned_table`
--
ALTER TABLE `assigned_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_assigned_student_skill` (`student_id`),
  ADD KEY `FK_assigned_enterprise_request` (`organization_request_id`);

--
-- Chỉ mục cho bảng `capacity_dictionary`
--
ALTER TABLE `capacity_dictionary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `enterprise`
--
ALTER TABLE `enterprise`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Chỉ mục cho bảng `enterprise_recruitment_request_form`
--
ALTER TABLE `enterprise_recruitment_request_form`
  ADD PRIMARY KEY (`organization_id`);

--
-- Chỉ mục cho bảng `list_of_required_capacity_of_each_request_coupon`
--
ALTER TABLE `list_of_required_capacity_of_each_request_coupon`
  ADD PRIMARY KEY (`id`,`organization_request_id`,`ability_id`),
  ADD KEY `FK_assigned_list` (`organization_request_id`),
  ADD KEY `ability_id` (`ability_id`);

--
-- Chỉ mục cho bảng `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Chỉ mục cho bảng `student_registration`
--
ALTER TABLE `student_registration`
  ADD PRIMARY KEY (`student_id`,`request_id`),
  ADD KEY `FK_student_registration_skill` (`request_id`);

--
-- Chỉ mục cho bảng `student_skill_profile`
--
ALTER TABLE `student_skill_profile`
  ADD PRIMARY KEY (`student_id`,`ability_id`),
  ADD KEY `ability_id` (`ability_id`);

--
-- Chỉ mục cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `enterprise`
--
ALTER TABLE `enterprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `assigned_table`
--
ALTER TABLE `assigned_table`
  ADD CONSTRAINT `FK_assigned_enterprise_request` FOREIGN KEY (`organization_request_id`) REFERENCES `enterprise_recruitment_request_form` (`organization_id`),
  ADD CONSTRAINT `FK_assigned_student` FOREIGN KEY (`student_id`) REFERENCES `student_registration` (`student_id`);

--
-- Các ràng buộc cho bảng `enterprise`
--
ALTER TABLE `enterprise`
  ADD CONSTRAINT `enterprise_ibfk_1` FOREIGN KEY (`id`) REFERENCES `enterprise_recruitment_request_form` (`organization_id`);

--
-- Các ràng buộc cho bảng `list_of_required_capacity_of_each_request_coupon`
--
ALTER TABLE `list_of_required_capacity_of_each_request_coupon`
  ADD CONSTRAINT `FK_assigned_list` FOREIGN KEY (`organization_request_id`) REFERENCES `assigned_table` (`organization_request_id`);

--
-- Các ràng buộc cho bảng `student_registration`
--
ALTER TABLE `student_registration`
  ADD CONSTRAINT `FK_student_registration_skill` FOREIGN KEY (`request_id`) REFERENCES `enterprise_recruitment_request_form` (`organization_id`),
  ADD CONSTRAINT `student_registration_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Các ràng buộc cho bảng `student_skill_profile`
--
ALTER TABLE `student_skill_profile`
  ADD CONSTRAINT `FK_student_profile_capacity` FOREIGN KEY (`ability_id`) REFERENCES `capacity_dictionary` (`id`),
  ADD CONSTRAINT `FK_student_skill_capacity` FOREIGN KEY (`ability_id`) REFERENCES `list_of_required_capacity_of_each_request_coupon` (`ability_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
