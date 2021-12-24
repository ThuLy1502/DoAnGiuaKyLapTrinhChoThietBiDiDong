-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Dec 24, 2021 at 06:31 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitnami_redmine`
--

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'production', '2021-12-10 15:52:20', '2021-12-10 15:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int NOT NULL,
  `container_id` int DEFAULT NULL,
  `container_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `disk_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filesize` bigint NOT NULL DEFAULT '0',
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `digest` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `downloads` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk_directory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `container_id`, `container_type`, `filename`, `disk_filename`, `filesize`, `content_type`, `digest`, `downloads`, `author_id`, `created_on`, `description`, `disk_directory`) VALUES
(1, 13, 'Issue', '266638308_672311140594949_6940592863617591179_n.png', '211222164546_7f7ed62765d5f269a533c1cc0ddc3269.png', 19779, 'image/png', '666a15739b00720da9d48b6fa519ff656dff6e9dcf3fc9dbd53a845eadafee26', 0, 9, '2021-12-22 09:45:46', '', '2021/12');

-- --------------------------------------------------------

--
-- Table structure for table `auth_sources`
--

CREATE TABLE `auth_sources` (
  `id` int NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int DEFAULT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `base_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_login` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_firstname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_lastname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_mail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` text COLLATE utf8mb4_unicode_ci,
  `timeout` int DEFAULT NULL,
  `verify_peer` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `topics_count` int NOT NULL DEFAULT '0',
  `messages_count` int NOT NULL DEFAULT '0',
  `last_message_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changes`
--

CREATE TABLE `changes` (
  `id` int NOT NULL,
  `changeset_id` int NOT NULL,
  `action` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_path` text COLLATE utf8mb4_unicode_ci,
  `from_revision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changesets`
--

CREATE TABLE `changesets` (
  `id` int NOT NULL,
  `repository_id` int NOT NULL,
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `committer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changesets_issues`
--

CREATE TABLE `changesets_issues` (
  `changeset_id` int NOT NULL,
  `issue_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changeset_parents`
--

CREATE TABLE `changeset_parents` (
  `changeset_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `commented_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `commented_id` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_format` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `possible_values` text COLLATE utf8mb4_unicode_ci,
  `regexp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_length` int DEFAULT NULL,
  `max_length` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text COLLATE utf8mb4_unicode_ci,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  `format_store` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_projects`
--

CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_roles`
--

CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_trackers`
--

CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int NOT NULL DEFAULT '0',
  `tracker_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_enumerations`
--

CREATE TABLE `custom_field_enumerations` (
  `id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_values`
--

CREATE TABLE `custom_values` (
  `id` int NOT NULL,
  `customized_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customized_id` int NOT NULL DEFAULT '0',
  `custom_field_id` int NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE `email_addresses` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `user_id`, `address`, `is_default`, `notify`, `created_on`, `updated_on`) VALUES
(1, 1, 'chutaza7891@gmail.com', 1, 1, '2021-12-10 15:52:18', '2021-12-10 15:52:18'),
(2, 5, 'user1@gmail.com', 1, 1, '2021-12-10 16:58:08', '2021-12-10 16:58:08'),
(3, 6, 'user2@gmail.com', 1, 1, '2021-12-10 16:59:49', '2021-12-10 16:59:49'),
(4, 7, 'user3@gmail.com', 1, 1, '2021-12-10 17:00:41', '2021-12-10 17:00:41'),
(5, 8, 'hoangthu@gmail.com', 1, 1, '2021-12-14 19:33:54', '2021-12-14 19:33:54'),
(6, 9, 'congnha@gmail.com', 1, 1, '2021-12-14 19:34:29', '2021-12-14 19:34:29'),
(7, 10, 'admin@gmail.com', 1, 1, '2021-12-21 22:05:05', '2021-12-21 22:05:05'),
(8, 11, 'lyhoangthu@gmail.com', 1, 1, '2021-12-21 22:09:18', '2021-12-21 22:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `enabled_modules`
--

CREATE TABLE `enabled_modules` (
  `id` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enabled_modules`
--

INSERT INTO `enabled_modules` (`id`, `project_id`, `name`) VALUES
(21, 3, 'issue_tracking'),
(22, 3, 'time_tracking'),
(23, 3, 'news'),
(24, 3, 'documents'),
(25, 3, 'files'),
(26, 3, 'wiki'),
(27, 3, 'repository'),
(28, 3, 'boards'),
(29, 3, 'calendar'),
(30, 3, 'gantt');

-- --------------------------------------------------------

--
-- Table structure for table `enumerations`
--

CREATE TABLE `enumerations` (
  `id` int NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `position_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enumerations`
--

INSERT INTO `enumerations` (`id`, `name`, `position`, `is_default`, `type`, `active`, `project_id`, `parent_id`, `position_name`) VALUES
(1, 'Low', 1, 0, 'IssuePriority', 1, NULL, NULL, 'lowest'),
(2, 'Normal', 2, 1, 'IssuePriority', 1, NULL, NULL, 'default'),
(3, 'High', 3, 0, 'IssuePriority', 1, NULL, NULL, 'high3'),
(4, 'Urgent', 4, 0, 'IssuePriority', 1, NULL, NULL, 'high2'),
(5, 'Immediate', 5, 0, 'IssuePriority', 1, NULL, NULL, 'highest'),
(6, 'User documentation', 1, 0, 'DocumentCategory', 1, NULL, NULL, NULL),
(7, 'Technical documentation', 2, 0, 'DocumentCategory', 1, NULL, NULL, NULL),
(8, 'Design', 1, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL),
(9, 'Development', 2, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups_users`
--

CREATE TABLE `groups_users` (
  `group_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `total_items` int DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_items`
--

CREATE TABLE `import_items` (
  `id` int NOT NULL,
  `import_id` int NOT NULL,
  `position` int NOT NULL,
  `obj_id` int DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int NOT NULL,
  `tracker_id` int NOT NULL,
  `project_id` int NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `due_date` date DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `assigned_to_id` int DEFAULT NULL,
  `priority_id` int NOT NULL,
  `fixed_version_id` int DEFAULT NULL,
  `author_id` int NOT NULL,
  `lock_version` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rgt` int DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `tracker_id`, `project_id`, `subject`, `description`, `due_date`, `category_id`, `status_id`, `assigned_to_id`, `priority_id`, `fixed_version_id`, `author_id`, `lock_version`, `created_on`, `updated_on`, `start_date`, `done_ratio`, `estimated_hours`, `parent_id`, `root_id`, `lft`, `rgt`, `is_private`, `closed_on`) VALUES
(4, 2, 3, 'Đăng nhập', 'Chức năng đăng nhập tài khoản', '2021-12-22', NULL, 5, 8, 2, NULL, 1, 2, '2021-12-21 15:24:11', '2021-12-22 16:44:41', '2021-12-21', 100, NULL, NULL, 4, 1, 2, 0, '2021-12-22 23:44:41'),
(5, 2, 3, 'About', 'Chức năng dùng để mô tả thông tin cá nhân, gọi điện, bản đồ', '2021-12-22', NULL, 5, 9, 2, NULL, 1, 4, '2021-12-21 15:32:14', '2021-12-22 16:49:15', '2021-12-21', 100, NULL, NULL, 5, 1, 2, 0, '2021-12-22 23:49:15'),
(6, 2, 3, 'Quản lý sản phẩm', 'Chức năng dùng để quản lý sản phẩm như: thêm, xóa, sửa, xem chi tiết sản phẩm', '2021-12-22', NULL, 5, 9, 2, NULL, 1, 5, '2021-12-21 15:33:30', '2021-12-22 16:48:28', '2021-12-21', 100, NULL, NULL, 6, 1, 2, 0, '2021-12-22 23:48:28'),
(7, 2, 3, 'Quản lý thương hiệu', 'Chức năng quản lý thương hiệu dùng để thêm, sửa, xóa thương hiệu', '2021-12-22', NULL, 5, 8, 2, NULL, 1, 2, '2021-12-21 15:34:50', '2021-12-22 16:43:00', '2021-12-21', 100, NULL, NULL, 7, 1, 2, 0, '2021-12-22 23:43:00'),
(9, 1, 3, 'Lỗi đăng nhập tài khoản', 'Nhập đúng tên tài khoản và mật khẩu nhưng hệ thống thông báo \"Sai mật khẩu\", không thể đăng nhập', '2021-12-23', NULL, 5, 9, 2, NULL, 8, 2, '2021-12-22 07:12:45', '2021-12-22 07:19:32', '2021-12-22', 100, NULL, NULL, 9, 1, 2, 0, '2021-12-22 14:19:32'),
(10, 1, 3, 'Lỗi nút gọi trong about', 'Khi nhấn nút gọi thì không gọi được trong khi đã thêm đủ hàm gọi, kiểm trả quyền và yêu cầu cấp quyền gọi', '2021-12-23', NULL, 5, 8, 2, NULL, 9, 1, '2021-12-22 07:23:42', '2021-12-22 07:30:35', '2021-12-22', 100, NULL, NULL, 10, 1, 2, 0, '2021-12-22 14:30:35'),
(11, 1, 3, 'Lỗi hiển thị danh sách thương hiệu', 'Đã có hàm đọc dữ liệu từ assets, có biến chứa tên cơ sở dữ liệu của assets nhưng vẫn không thể hiện thị được danh sách thương hiệu lên giao diện', '2021-12-23', NULL, 5, 9, 3, NULL, 8, 1, '2021-12-22 08:27:49', '2021-12-22 08:34:15', '2021-12-22', 100, NULL, NULL, 11, 1, 2, 0, '2021-12-22 15:34:15'),
(12, 1, 3, 'Lỗi thêm thương hiệu sai thứ tự', 'Khi thêm một thương hiệu vào danh sách thì thứ tự hiển thị bị đảo ngược từ \"mã - tên\" thành \"tên - mã\"', '2021-12-22', NULL, 5, 8, 1, NULL, 8, 1, '2021-12-22 08:52:43', '2021-12-22 08:57:08', '2021-12-22', 100, NULL, NULL, 12, 1, 2, 0, '2021-12-22 15:57:08'),
(13, 1, 3, 'Lỗi cập nhật thương hiệu', 'Khi sửa tên thương hiệu và cập nhật lại thì vẫn hiển thị thông báo \"cập nhật thành công\" nhưng danh sách thương hiệu vẫn chưa cập nhật lại thông tin sau khi sửa', '2021-12-22', NULL, 5, 9, 2, NULL, 8, 1, '2021-12-22 09:21:51', '2021-12-22 09:52:19', '2021-12-22', 100, NULL, NULL, 13, 1, 2, 0, '2021-12-22 16:52:19'),
(14, 1, 3, 'Lỗi xóa thương hiệu sản phẩm', 'Có đầy đủ hàm xóa thương hiệu, đọc dữ liệu sản phẩm từ assets nhưng không thể xóa\r\nKhi nhấp vào trang thương hiệu bị văng ra, không vào được', '2021-12-22', NULL, 5, 8, 2, NULL, 8, 1, '2021-12-22 10:51:06', '2021-12-22 10:55:41', '2021-12-22', 100, NULL, NULL, 14, 1, 2, 0, '2021-12-22 17:55:41'),
(15, 1, 3, 'Lỗi hiện thị sản phẩm', 'Không thể hiển thị tên, giá, hình ảnh lên giao diện', '2021-12-22', NULL, 5, 8, 2, NULL, 9, 1, '2021-12-22 11:38:14', '2021-12-22 11:41:36', '2021-12-22', 100, NULL, NULL, 15, 1, 2, 0, '2021-12-22 18:41:36'),
(16, 1, 3, 'Lỗi thêm hình sản phẩm', 'Khi nhấn vào nút thêm trong giao diện thêm sản phẩm, hệ thống thông báo \"Đã từ chối quyền\", không thể thêm hình', '2021-12-22', NULL, 5, 9, 2, NULL, 9, 1, '2021-12-22 13:52:18', '2021-12-22 14:47:27', '2021-12-22', 100, NULL, NULL, 16, 1, 2, 0, '2021-12-22 21:47:27'),
(17, 1, 3, 'Lỗi hiển thị sai thông tin', 'Sau khi thêm một sản phẩm, thông tin của sản phẩm đó khi hiển thị lên giao diện danh sách sản phẩm bị sai so với thông tin lúc thêm vào.', '2021-12-22', NULL, 5, 9, 2, NULL, 9, 1, '2021-12-22 13:54:50', '2021-12-22 14:50:34', '2021-12-22', 100, NULL, NULL, 17, 1, 2, 0, '2021-12-22 21:50:34'),
(18, 1, 3, 'Lỗi nút ImageButton sửa sản phẩm', 'Khi nhấn vào nút ImageButton thì không chuyển sang trang giao diện sửa sản phẩm', '2021-12-22', NULL, 5, 8, 2, NULL, 9, 1, '2021-12-22 14:59:33', '2021-12-22 15:16:09', '2021-12-22', 100, NULL, NULL, 18, 1, 2, 0, '2021-12-22 22:16:09'),
(19, 1, 3, 'Lỗi cập nhật sản phẩm', 'Khi sửa bất kì sản phẩm nào thì chỉ có sản phẩm đầu tiên được cập nhật', '2021-12-22', NULL, 5, 9, 2, NULL, 8, 1, '2021-12-22 15:21:24', '2021-12-22 15:27:27', '2021-12-22', 100, NULL, NULL, 19, 1, 2, 0, '2021-12-22 22:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `issue_categories`
--

CREATE TABLE `issue_categories` (
  `id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `assigned_to_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issue_relations`
--

CREATE TABLE `issue_relations` (
  `id` int NOT NULL,
  `issue_from_id` int NOT NULL,
  `issue_to_id` int NOT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delay` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issue_statuses`
--

CREATE TABLE `issue_statuses` (
  `id` int NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `default_done_ratio` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issue_statuses`
--

INSERT INTO `issue_statuses` (`id`, `name`, `is_closed`, `position`, `default_done_ratio`) VALUES
(1, 'New', 0, 1, NULL),
(2, 'In Progress', 0, 2, NULL),
(3, 'Resolved', 0, 3, NULL),
(4, 'Feedback', 0, 4, NULL),
(5, 'Closed', 1, 5, NULL),
(6, 'Rejected', 1, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int NOT NULL,
  `journalized_id` int NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `journalized_id`, `journalized_type`, `user_id`, `notes`, `created_on`, `private_notes`) VALUES
(3, 4, 'Issue', 1, NULL, '2021-12-21 22:30:18', 0),
(4, 5, 'Issue', 1, NULL, '2021-12-21 22:35:48', 0),
(5, 6, 'Issue', 1, NULL, '2021-12-21 22:35:56', 0),
(6, 7, 'Issue', 1, NULL, '2021-12-21 22:36:03', 0),
(8, 9, 'Issue', 8, '', '2021-12-22 14:13:15', 0),
(9, 9, 'Issue', 9, 'Lí do bị lỗi là gán sai id cho biến txtTaiKhoan và txtMatKhau trong MainActivity.java', '2021-12-22 14:19:32', 0),
(10, 10, 'Issue', 8, ' Cần cấp quyền ACCESS_FINE_LOCATION và CALL_PHONE trong AndroidMainifest.xml', '2021-12-22 14:30:35', 0),
(11, 11, 'Issue', 9, 'Do ghi sai tên cơ sở dữ liệu chứa trong assets\r\nSai tên bảng thương hiệu của cơ sở dữ liệu', '2021-12-22 15:34:15', 0),
(12, 12, 'Issue', 8, 'Do truyền sai thứ tự thuộc tính trong bảng \"thương hiệu\" khi thêm vào cơ sở dữ liệu', '2021-12-22 15:57:08', 0),
(13, 13, 'Issue', 9, 'Do ghi sai tên biến gán vị trí getItem (thChon) thành biến th (trong th là biến của model thương hiệu)\r\nDo vậy cần sửa \"th.getIdth()\" thành \"thChon.getIdth()\"', '2021-12-22 16:52:19', 0),
(14, 14, 'Issue', 8, 'Lí do bị lỗi là do thiếu tạo biến chứa danh sách sản phẩm trong hàm onCreate ở BrandActivity.java', '2021-12-22 17:55:41', 0),
(15, 15, 'Issue', 8, 'Thiếu khai báo biến trong hàm getView của lvAdapter', '2021-12-22 18:41:36', 0),
(16, 16, 'Issue', 9, 'Lí do bị lỗi là chưa thêm cấp quyền WRITE_EXTERNAL_STORAGE, READ_EXTERNAL_STORAGE cho AndroidManifest.xml', '2021-12-22 21:47:27', 0),
(17, 17, 'Issue', 9, 'Do truyền sai thứ tự giá trị trong biến \"sp\" của model SanPham', '2021-12-22 21:50:34', 0),
(18, 18, 'Issue', 8, 'Trong adapter/lvAdapter, ghi sai từ khóa putExtra trong sự kiện onClick của imgEdit', '2021-12-22 22:16:09', 0),
(19, 19, 'Issue', 9, 'Do truyền sai giá trị vào thuộc tính \"id\" của biến \"sanpham\" trong nút sự kiện cập nhật sản phẩm', '2021-12-22 22:27:27', 0),
(20, 6, 'Issue', 9, 'Quản lý sản phẩm có:\r\n- Thêm sản phẩm\r\n- Sửa sản phẩm\r\n- Xóa sản phẩm', '2021-12-22 23:39:14', 0),
(21, 6, 'Issue', 9, '', '2021-12-22 23:39:39', 0),
(22, 5, 'Issue', 9, 'About có:\r\n- Thông tin cá nhân\r\n- Nút gọi', '2021-12-22 23:41:10', 0),
(23, 7, 'Issue', 8, 'Quản lý thương hiệu có:\r\n- Thêm thương hiệu\r\n- Sửa thương hiệu\r\n- Xóa thương hiệu', '2021-12-22 23:43:00', 0),
(24, 4, 'Issue', 8, 'Đăng nhập tài khoản vào trang giao diện danh sách sản phẩm.', '2021-12-22 23:44:41', 0),
(25, 6, 'Issue', 1, '', '2021-12-22 23:45:38', 0),
(26, 5, 'Issue', 1, '', '2021-12-22 23:46:55', 0),
(27, 6, 'Issue', 9, '', '2021-12-22 23:48:28', 0),
(28, 5, 'Issue', 9, '', '2021-12-22 23:49:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `id` int NOT NULL,
  `journal_id` int NOT NULL DEFAULT '0',
  `property` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prop_key` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `old_value` longtext COLLATE utf8mb4_unicode_ci,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journal_details`
--

INSERT INTO `journal_details` (`id`, `journal_id`, `property`, `prop_key`, `old_value`, `value`) VALUES
(3, 3, 'attr', 'assigned_to_id', NULL, '8'),
(4, 4, 'attr', 'assigned_to_id', NULL, '9'),
(5, 5, 'attr', 'assigned_to_id', NULL, '9'),
(6, 6, 'attr', 'assigned_to_id', NULL, '8'),
(10, 8, 'attr', 'done_ratio', '0', '50'),
(11, 9, 'attr', 'status_id', '1', '5'),
(12, 9, 'attr', 'done_ratio', '50', '100'),
(13, 10, 'attr', 'status_id', '1', '5'),
(14, 10, 'attr', 'done_ratio', '60', '100'),
(15, 11, 'attr', 'status_id', '1', '5'),
(16, 11, 'attr', 'done_ratio', '10', '100'),
(17, 12, 'attr', 'status_id', '1', '5'),
(18, 12, 'attr', 'done_ratio', '80', '100'),
(19, 13, 'attachment', '1', NULL, '266638308_672311140594949_6940592863617591179_n.png'),
(20, 13, 'attr', 'status_id', '1', '5'),
(21, 13, 'attr', 'done_ratio', '60', '100'),
(22, 14, 'attr', 'status_id', '1', '5'),
(23, 14, 'attr', 'done_ratio', '60', '100'),
(24, 15, 'attr', 'status_id', '1', '5'),
(25, 15, 'attr', 'done_ratio', '50', '100'),
(26, 16, 'attr', 'status_id', '1', '5'),
(27, 16, 'attr', 'done_ratio', '30', '100'),
(28, 17, 'attr', 'status_id', '1', '5'),
(29, 17, 'attr', 'done_ratio', '30', '100'),
(30, 18, 'attr', 'status_id', '1', '5'),
(31, 18, 'attr', 'done_ratio', '50', '100'),
(32, 19, 'attr', 'status_id', '1', '5'),
(33, 19, 'attr', 'done_ratio', '50', '100'),
(34, 20, 'attr', 'status_id', '1', '5'),
(35, 20, 'attr', 'done_ratio', '0', '100'),
(36, 21, 'attr', 'done_ratio', '100', '90'),
(37, 22, 'attr', 'status_id', '1', '5'),
(38, 22, 'attr', 'done_ratio', '0', '80'),
(39, 23, 'attr', 'status_id', '1', '5'),
(40, 23, 'attr', 'done_ratio', '0', '100'),
(41, 24, 'attr', 'status_id', '1', '5'),
(42, 24, 'attr', 'done_ratio', '0', '100'),
(43, 25, 'attr', 'status_id', '5', '3'),
(44, 26, 'attr', 'status_id', '5', '2'),
(45, 27, 'attr', 'status_id', '3', '5'),
(46, 27, 'attr', 'done_ratio', '90', '100'),
(47, 28, 'attr', 'status_id', '2', '5'),
(48, 28, 'attr', 'done_ratio', '80', '100');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `user_id`, `project_id`, `created_on`, `mail_notification`) VALUES
(6, 8, 3, '2021-12-21 15:26:26', 0),
(7, 9, 3, '2021-12-21 15:26:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_roles`
--

CREATE TABLE `member_roles` (
  `id` int NOT NULL,
  `member_id` int NOT NULL,
  `role_id` int NOT NULL,
  `inherited_from` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_roles`
--

INSERT INTO `member_roles` (`id`, `member_id`, `role_id`, `inherited_from`) VALUES
(6, 6, 4, NULL),
(7, 7, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `board_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `author_id` int DEFAULT NULL,
  `replies_count` int NOT NULL DEFAULT '0',
  `last_reply_id` int DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `author_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `comments_count` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `open_id_authentication_associations`
--

CREATE TABLE `open_id_authentication_associations` (
  `id` int NOT NULL,
  `issued` int DEFAULT NULL,
  `lifetime` int DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assoc_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_url` blob,
  `secret` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `open_id_authentication_nonces`
--

CREATE TABLE `open_id_authentication_nonces` (
  `id` int NOT NULL,
  `timestamp` int NOT NULL,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `lft` int DEFAULT NULL,
  `rgt` int DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  `default_version_id` int DEFAULT NULL,
  `default_assigned_to_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `homepage`, `is_public`, `parent_id`, `created_on`, `updated_on`, `identifier`, `status`, `lft`, `rgt`, `inherit_members`, `default_version_id`, `default_assigned_to_id`) VALUES
(3, 'DoAnGiuaKyLapTrinhChoThietBiDiDong', 'Đồ án giữa kỳ môn Lập trình cho thiết bị di động', '', 1, NULL, '2021-12-21 15:22:39', '2021-12-21 15:22:39', 'doangiuakylaptrinhchothietbididong', 1, 1, 2, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects_trackers`
--

CREATE TABLE `projects_trackers` (
  `project_id` int NOT NULL DEFAULT '0',
  `tracker_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects_trackers`
--

INSERT INTO `projects_trackers` (`project_id`, `tracker_id`) VALUES
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filters` text COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL DEFAULT '0',
  `column_names` text COLLATE utf8mb4_unicode_ci,
  `sort_criteria` text COLLATE utf8mb4_unicode_ci,
  `group_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `project_id`, `name`, `filters`, `user_id`, `column_names`, `sort_criteria`, `group_by`, `type`, `visibility`, `options`) VALUES
(1, NULL, 'Issues assigned to me', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nassigned_to_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 0, NULL, '---\n- - priority\n  - desc\n- - updated_on\n  - desc\n', NULL, 'IssueQuery', 2, NULL),
(2, NULL, 'Reported issues', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nauthor_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 0, NULL, '---\n- - updated_on\n  - desc\n', NULL, 'IssueQuery', 2, NULL),
(3, NULL, 'Updated issues', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nupdated_by:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 0, NULL, '---\n- - updated_on\n  - desc\n', NULL, 'IssueQuery', 2, NULL),
(4, NULL, 'Watched issues', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nwatcher_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 0, NULL, '---\n- - updated_on\n  - desc\n', NULL, 'IssueQuery', 2, NULL),
(5, NULL, 'My projects', '---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - mine\n', 0, NULL, NULL, NULL, 'ProjectQuery', 2, NULL),
(6, NULL, 'My bookmarks', '---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - bookmarks\n', 0, NULL, NULL, NULL, 'ProjectQuery', 2, NULL),
(7, NULL, 'Spent time', '---\nspent_on:\n  :operator: \"*\"\n  :values:\n  - \'\'\nuser_id:\n  :operator: \"=\"\n  :values:\n  - me\n', 0, NULL, '---\n- - spent_on\n  - desc\n', NULL, 'TimeEntryQuery', 2, '---\n:totalable_names:\n- :hours\n');

-- --------------------------------------------------------

--
-- Table structure for table `queries_roles`
--

CREATE TABLE `queries_roles` (
  `query_id` int NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repositories`
--

CREATE TABLE `repositories` (
  `id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `root_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_encoding` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_encoding` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_info` longtext COLLATE utf8mb4_unicode_ci,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `issues_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT '1',
  `settings` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `position`, `assignable`, `builtin`, `permissions`, `issues_visibility`, `users_visibility`, `time_entries_visibility`, `all_roles_managed`, `settings`) VALUES
(1, 'Non member', 0, 1, 1, '---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default', 'all', 'all', 1, NULL),
(2, 'Anonymous', 0, 1, 2, '---\n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default', 'all', 'all', 1, NULL),
(3, 'Manager', 1, 1, 0, '---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_news\n- :manage_news\n- :comment_news\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_wiki\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_gantt\n', 'all', 'all', 'all', 1, NULL),
(4, 'Developer', 2, 1, 0, '---\n- :manage_versions\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :view_private_notes\n- :set_notes_private\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n', 'default', 'all', 'all', 1, NULL),
(5, 'Reporter', 3, 1, 0, '---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default', 'all', 'all', 1, NULL),
(6, 'PostBug', 4, 1, 0, '---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :add_issue_notes\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n', 'default', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(7, 'View', 5, 1, 0, '---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n', 'default', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(8, 'NotFound', 6, 1, 0, '---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n', 'default', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n');

-- --------------------------------------------------------

--
-- Table structure for table `roles_managed_roles`
--

CREATE TABLE `roles_managed_roles` (
  `role_id` int NOT NULL,
  `managed_role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('1'),
('10'),
('100'),
('101'),
('102'),
('103'),
('104'),
('105'),
('106'),
('107'),
('108'),
('11'),
('12'),
('13'),
('14'),
('15'),
('16'),
('17'),
('18'),
('19'),
('2'),
('20'),
('20090214190337'),
('20090312172426'),
('20090312194159'),
('20090318181151'),
('20090323224724'),
('20090401221305'),
('20090401231134'),
('20090403001910'),
('20090406161854'),
('20090425161243'),
('20090503121501'),
('20090503121505'),
('20090503121510'),
('20090614091200'),
('20090704172350'),
('20090704172355'),
('20090704172358'),
('20091010093521'),
('20091017212227'),
('20091017212457'),
('20091017212644'),
('20091017212938'),
('20091017213027'),
('20091017213113'),
('20091017213151'),
('20091017213228'),
('20091017213257'),
('20091017213332'),
('20091017213444'),
('20091017213536'),
('20091017213642'),
('20091017213716'),
('20091017213757'),
('20091017213835'),
('20091017213910'),
('20091017214015'),
('20091017214107'),
('20091017214136'),
('20091017214236'),
('20091017214308'),
('20091017214336'),
('20091017214406'),
('20091017214440'),
('20091017214519'),
('20091017214611'),
('20091017214644'),
('20091017214720'),
('20091017214750'),
('20091025163651'),
('20091108092559'),
('20091114105931'),
('20091123212029'),
('20091205124427'),
('20091220183509'),
('20091220183727'),
('20091220184736'),
('20091225164732'),
('20091227112908'),
('20100129193402'),
('20100129193813'),
('20100221100219'),
('20100313132032'),
('20100313171051'),
('20100705164950'),
('20100819172912'),
('20101104182107'),
('20101107130441'),
('20101114115114'),
('20101114115359'),
('20110220160626'),
('20110223180944'),
('20110223180953'),
('20110224000000'),
('20110226120112'),
('20110226120132'),
('20110227125750'),
('20110228000000'),
('20110228000100'),
('20110401192910'),
('20110408103312'),
('20110412065600'),
('20110511000000'),
('20110902000000'),
('20111201201315'),
('20120115143024'),
('20120115143100'),
('20120115143126'),
('20120127174243'),
('20120205111326'),
('20120223110929'),
('20120301153455'),
('20120422150750'),
('20120705074331'),
('20120707064544'),
('20120714122000'),
('20120714122100'),
('20120714122200'),
('20120731164049'),
('20120930112914'),
('20121026002032'),
('20121026003537'),
('20121209123234'),
('20121209123358'),
('20121213084931'),
('20130110122628'),
('20130201184705'),
('20130202090625'),
('20130207175206'),
('20130207181455'),
('20130215073721'),
('20130215111127'),
('20130215111141'),
('20130217094251'),
('20130602092539'),
('20130710182539'),
('20130713104233'),
('20130713111657'),
('20130729070143'),
('20130911193200'),
('20131004113137'),
('20131005100610'),
('20131124175346'),
('20131210180802'),
('20131214094309'),
('20131215104612'),
('20131218183023'),
('20140228130325'),
('20140903143914'),
('20140920094058'),
('20141029181752'),
('20141029181824'),
('20141109112308'),
('20141122124142'),
('20150113194759'),
('20150113211532'),
('20150113213922'),
('20150113213955'),
('20150208105930'),
('20150510083747'),
('20150525103953'),
('20150526183158'),
('20150528084820'),
('20150528092912'),
('20150528093249'),
('20150725112753'),
('20150730122707'),
('20150730122735'),
('20150921204850'),
('20150921210243'),
('20151020182334'),
('20151020182731'),
('20151021184614'),
('20151021185456'),
('20151021190616'),
('20151024082034'),
('20151025072118'),
('20151031095005'),
('20160404080304'),
('20160416072926'),
('20160529063352'),
('20161001122012'),
('20161002133421'),
('20161010081301'),
('20161010081528'),
('20161010081600'),
('20161126094932'),
('20161220091118'),
('20170207050700'),
('20170302015225'),
('20170309214320'),
('20170320051650'),
('20170418090031'),
('20170419144536'),
('20170723112801'),
('20180501132547'),
('20180913072918'),
('20180923082945'),
('20180923091603'),
('20190315094151'),
('20190315102101'),
('20190510070108'),
('20190620135549'),
('20200826153401'),
('20200826153402'),
('21'),
('22'),
('23'),
('24'),
('25'),
('26'),
('27'),
('28'),
('29'),
('3'),
('30'),
('31'),
('32'),
('33'),
('34'),
('35'),
('36'),
('37'),
('38'),
('39'),
('4'),
('40'),
('41'),
('42'),
('43'),
('44'),
('45'),
('46'),
('47'),
('48'),
('49'),
('5'),
('50'),
('51'),
('52'),
('53'),
('54'),
('55'),
('56'),
('57'),
('58'),
('59'),
('6'),
('60'),
('61'),
('62'),
('63'),
('64'),
('65'),
('66'),
('67'),
('68'),
('69'),
('7'),
('70'),
('71'),
('72'),
('73'),
('74'),
('75'),
('76'),
('77'),
('78'),
('79'),
('8'),
('80'),
('81'),
('82'),
('83'),
('84'),
('85'),
('86'),
('87'),
('88'),
('89'),
('9'),
('90'),
('91'),
('92'),
('93'),
('94'),
('95'),
('96'),
('97'),
('98'),
('99');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci,
  `updated_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `updated_on`) VALUES
(1, 'default_projects_tracker_ids', '---\n- \'1\'\n- \'2\'\n- \'3\'\n', '2021-12-10 08:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `time_entries`
--

CREATE TABLE `time_entries` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `issue_id` int DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_id` int NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int NOT NULL,
  `tmonth` int NOT NULL,
  `tweek` int NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_entries`
--

INSERT INTO `time_entries` (`id`, `project_id`, `author_id`, `user_id`, `issue_id`, `hours`, `comments`, `activity_id`, `spent_on`, `tyear`, `tmonth`, `tweek`, `created_on`, `updated_on`) VALUES
(2, 3, 9, 9, 9, 1, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 14:19:32', '2021-12-22 14:19:32'),
(3, 3, 8, 8, 10, 1, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 14:30:35', '2021-12-22 14:30:35'),
(4, 3, 9, 9, 11, 1, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 15:34:15', '2021-12-22 15:34:15'),
(5, 3, 8, 8, 12, 0.5, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 15:57:08', '2021-12-22 15:57:08'),
(6, 3, 9, 9, 13, 0.5, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 16:52:19', '2021-12-22 16:52:19'),
(7, 3, 8, 8, 14, 0.5, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 17:55:41', '2021-12-22 17:55:41'),
(8, 3, 8, 8, 15, 0.5, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 18:41:36', '2021-12-22 18:41:36'),
(9, 3, 9, 9, 16, 0.5, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 21:47:27', '2021-12-22 21:47:27'),
(10, 3, 9, 9, 17, 1, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 21:50:34', '2021-12-22 21:50:34'),
(11, 3, 8, 8, 18, 0.5, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 22:16:09', '2021-12-22 22:16:09'),
(12, 3, 9, 9, 19, 0.5, 'Đã sửa xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 22:27:27', '2021-12-22 22:27:27'),
(13, 3, 9, 9, 6, 6, 'Đã làm xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 23:39:14', '2021-12-22 23:39:14'),
(14, 3, 9, 9, 5, 6, 'Đã làm xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 23:41:10', '2021-12-22 23:41:10'),
(15, 3, 8, 8, 7, 6, 'Đã làm xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 23:43:00', '2021-12-22 23:43:00'),
(16, 3, 8, 8, 4, 6, 'Đã làm xong', 9, '2021-12-22', 2021, 12, 51, '2021-12-22 23:44:41', '2021-12-22 23:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `action` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `action`, `value`, `created_on`, `updated_on`) VALUES
(1, 1, 'session', 'b48665d4df3854e3f852e021284db129066019e1', '2021-12-10 15:58:07', '2021-12-10 08:58:07'),
(2, 1, 'feeds', '6e5a2b41446e2a47b82e9142af141fe6f54b6056', '2021-12-10 15:58:08', '2021-12-10 08:58:08'),
(5, 5, 'feeds', '9c421d1d3bc992ac0a81733195807a0862e11155', '2021-12-10 17:48:55', '2021-12-10 10:48:55'),
(9, 1, 'session', 'faaf487712adcb4bd77449b6ff856b70bfb1d3d0', '2021-12-10 18:12:49', '2021-12-10 11:27:23'),
(10, 1, 'session', 'd8eccbb608b2360e8f8ec1945c7d97ca177d00f3', '2021-12-14 19:31:37', '2021-12-14 13:00:25'),
(12, 8, 'feeds', '0a867a27ff0eb8cefde85e2778500dc6ae7c99b9', '2021-12-14 19:39:17', '2021-12-14 12:39:17'),
(13, 8, 'session', '2c1b354bc5c7eb6c7ea3a66564a6dc4c17c0bcc0', '2021-12-14 19:59:24', '2021-12-14 13:02:57'),
(17, 9, 'feeds', '8151cad959723a8102bd94b3e8b434903487e13d', '2021-12-21 22:20:09', '2021-12-21 15:20:09'),
(21, 8, 'session', '3cd2002bc12a43d38a736981e6eccd3fda3dab55', '2021-12-21 22:36:35', '2021-12-21 16:09:34'),
(26, 8, 'session', 'fdcc8a476dcbcd49fc573b5fdc7c09040af47c63', '2021-12-22 14:24:18', '2021-12-22 16:44:41'),
(31, 1, 'session', '2e58fc54aa0dad1f92b3357ed2594f1fdb0ffed0', '2021-12-22 23:50:39', '2021-12-22 17:15:15'),
(32, 1, 'session', '6b4a8bd1134b764f3ab0e0c9181608ed3646cbeb', '2021-12-24 13:19:56', '2021-12-24 06:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `trackers`
--

CREATE TABLE `trackers` (
  `id` int NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int DEFAULT '0',
  `default_status_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trackers`
--

INSERT INTO `trackers` (`id`, `name`, `description`, `is_in_chlog`, `position`, `is_in_roadmap`, `fields_bits`, `default_status_id`) VALUES
(1, 'Bug', NULL, 1, 1, 0, 0, 1),
(2, 'Feature', NULL, 1, 2, 1, 0, 1),
(3, 'Support', NULL, 0, 3, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hashed_password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auth_source_id` int DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_notification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT '0',
  `passwd_changed_on` datetime DEFAULT NULL,
  `twofa_scheme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_totp_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_totp_last_used_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `hashed_password`, `firstname`, `lastname`, `admin`, `status`, `last_login_on`, `language`, `auth_source_id`, `created_on`, `updated_on`, `type`, `identity_url`, `mail_notification`, `salt`, `must_change_passwd`, `passwd_changed_on`, `twofa_scheme`, `twofa_totp_key`, `twofa_totp_last_used_at`) VALUES
(1, 'thuly', 'd06f83d85dd619ab9fe8a2f0a5d062670b3383f3', 'Thu Ly', 'Admin', 1, 1, '2021-12-24 13:19:56', 'en', NULL, '2021-12-10 08:52:04', '2021-12-10 08:52:04', 'User', NULL, 'all', 'c22e5e77280a7a35e01eeb046dbc02e7', 0, NULL, NULL, NULL, NULL),
(2, '', '', '', 'Anonymous users', 0, 1, NULL, '', NULL, '2021-12-10 08:52:17', '2021-12-10 08:52:17', 'GroupAnonymous', NULL, '', NULL, 0, NULL, NULL, NULL, NULL),
(3, '', '', '', 'Non member users', 0, 1, NULL, '', NULL, '2021-12-10 08:52:17', '2021-12-10 08:52:17', 'GroupNonMember', NULL, '', NULL, 0, NULL, NULL, NULL, NULL),
(4, '', '', '', 'Anonymous', 0, 0, NULL, '', NULL, '2021-12-10 08:52:34', '2021-12-10 08:52:34', 'AnonymousUser', NULL, 'only_my_events', NULL, 0, NULL, NULL, NULL, NULL),
(5, 'user1', '95d502e358f34fb7f0a69a589f4197c8d0cd4423', '1', 'user', 0, 3, '2021-12-10 18:11:49', 'en', NULL, '2021-12-10 09:58:08', '2021-12-10 11:19:11', 'User', NULL, 'only_my_events', '3d947c7c7c69f16fd6923044009c35ed', 0, '2021-12-10 16:58:08', NULL, NULL, NULL),
(6, 'user2', '6ec068d43f21b1f53986eb4df5f3977c4a58db79', '2', 'user', 0, 3, NULL, 'en', NULL, '2021-12-10 09:59:49', '2021-12-14 12:32:23', 'User', NULL, 'only_my_events', 'a5161b1e1c3ce62a6c1319c4052d9eb2', 0, '2021-12-10 16:59:49', NULL, NULL, NULL),
(7, 'user3', '90a779947fc93b27e757f6a998586e60ccd5ae86', '3', 'user', 0, 3, NULL, 'en', NULL, '2021-12-10 10:00:41', '2021-12-14 12:32:24', 'User', NULL, 'only_my_events', '69104f589cfcd6917edb8b9e3752f0cf', 0, '2021-12-10 17:00:41', NULL, NULL, NULL),
(8, 'hoangthu', '20e65469cdff1b3ebfc8eb3037b8e0d0b5b13aa7', 'Thu', 'Hoang', 0, 1, '2021-12-22 14:24:18', 'en', NULL, '2021-12-14 12:33:54', '2021-12-14 12:33:54', 'User', NULL, 'only_my_events', 'ab0e8898ec753fd9ca0ea3a4f7a19936', 0, '2021-12-14 19:33:54', NULL, NULL, NULL),
(9, 'congnha', 'b3aa22cd4b8c1c987f99eb3c510bc9a0f9a9467f', 'Nha', 'Huynh', 0, 1, '2021-12-22 23:47:15', 'en', NULL, '2021-12-14 12:34:29', '2021-12-14 12:34:29', 'User', NULL, 'only_my_events', '4bc33bb563716fef8f4643e46cf55086', 0, '2021-12-14 19:34:29', NULL, NULL, NULL),
(10, 'admin', '886c2ef4b6d1397f583f920dc99120a68af932f1', 'Ly', 'Thu', 0, 2, NULL, 'en', NULL, '2021-12-21 15:05:05', '2021-12-21 15:05:05', 'User', NULL, 'only_my_events', '0a5d2c6b51e75aed86aca52b17cf9753', 0, '2021-12-21 22:05:05', NULL, NULL, NULL),
(11, 'lyhoangthu', 'b752a11061426d16bdd25a12173cda196217fc7c', 'Thu', 'Ly', 0, 2, NULL, 'en', NULL, '2021-12-21 15:09:18', '2021-12-21 15:09:18', 'User', NULL, 'only_my_events', 'ddb9f7511b896f5a55b7201749f7ca5a', 0, '2021-12-21 22:09:18', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `others` text COLLATE utf8mb4_unicode_ci,
  `hide_mail` tinyint(1) DEFAULT '1',
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `others`, `hide_mail`, `time_zone`) VALUES
(1, 1, '---\n:no_self_notified: \'1\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'3,1,2\'\n:gantt_zoom: 2\n:gantt_months: 6\n:bookmarked_project_ids: \'\'\n', 1, ''),
(2, 5, '---\n:no_self_notified: \'1\'\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'1\'\n', 1, ''),
(3, 6, '---\n:no_self_notified: \'1\'\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n', 1, ''),
(4, 7, '---\n:no_self_notified: \'1\'\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n', 1, ''),
(5, 8, '---\n:no_self_notified: \'1\'\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'3,2\'\n', 1, ''),
(6, 9, '---\n:no_self_notified: \'1\'\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'3\'\n', 1, ''),
(7, 10, '---\n:no_self_notified: \'1\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n', 1, ''),
(8, 11, '---\n:no_self_notified: \'1\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `wiki_page_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `sharing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watchers`
--

CREATE TABLE `watchers` (
  `id` int NOT NULL,
  `watchable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `watchable_id` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `watchers`
--

INSERT INTO `watchers` (`id`, `watchable_type`, `watchable_id`, `user_id`) VALUES
(2, 'Issue', 5, 9),
(3, 'Issue', 6, 9),
(4, 'Issue', 7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `wikis`
--

CREATE TABLE `wikis` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `start_page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wikis`
--

INSERT INTO `wikis` (`id`, `project_id`, `start_page`, `status`) VALUES
(3, 3, 'Wiki', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_contents`
--

CREATE TABLE `wiki_contents` (
  `id` int NOT NULL,
  `page_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_content_versions`
--

CREATE TABLE `wiki_content_versions` (
  `id` int NOT NULL,
  `wiki_content_id` int NOT NULL,
  `page_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_pages`
--

CREATE TABLE `wiki_pages` (
  `id` int NOT NULL,
  `wiki_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_redirects`
--

CREATE TABLE `wiki_redirects` (
  `id` int NOT NULL,
  `wiki_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirects_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `id` int NOT NULL,
  `tracker_id` int NOT NULL DEFAULT '0',
  `old_status_id` int NOT NULL DEFAULT '0',
  `new_status_id` int NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workflows`
--

INSERT INTO `workflows` (`id`, `tracker_id`, `old_status_id`, `new_status_id`, `role_id`, `assignee`, `author`, `type`, `field_name`, `rule`) VALUES
(1, 1, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(2, 1, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(3, 1, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(4, 1, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(5, 1, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(6, 1, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(7, 1, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(8, 1, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(9, 1, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(10, 1, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(11, 1, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(12, 1, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(13, 1, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(14, 1, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(15, 1, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(16, 1, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(17, 1, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(18, 1, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(19, 1, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(20, 1, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(21, 1, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(22, 1, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(23, 1, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(24, 1, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(25, 1, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(26, 1, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(27, 1, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(28, 1, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(29, 1, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(30, 1, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(31, 2, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(32, 2, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(33, 2, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(34, 2, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(35, 2, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(36, 2, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(37, 2, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(38, 2, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(39, 2, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(40, 2, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(41, 2, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(42, 2, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(43, 2, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(44, 2, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(45, 2, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(46, 2, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(47, 2, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(48, 2, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(49, 2, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(50, 2, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(51, 2, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(52, 2, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(53, 2, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(54, 2, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(55, 2, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(56, 2, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(57, 2, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(58, 2, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(59, 2, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(60, 2, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(61, 3, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(62, 3, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(63, 3, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(64, 3, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(65, 3, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(66, 3, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(67, 3, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(68, 3, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(69, 3, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(70, 3, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(71, 3, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(72, 3, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(73, 3, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(74, 3, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(75, 3, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(76, 3, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(77, 3, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(78, 3, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(79, 3, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(80, 3, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(81, 3, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(82, 3, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(83, 3, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(84, 3, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(85, 3, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(86, 3, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(87, 3, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(88, 3, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(89, 3, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(90, 3, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(91, 1, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(92, 1, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(93, 1, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(94, 1, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(95, 1, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(96, 1, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(97, 1, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(98, 1, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(99, 1, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(100, 1, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(101, 1, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(102, 1, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(103, 1, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(104, 2, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(105, 2, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(106, 2, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(107, 2, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(108, 2, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(109, 2, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(110, 2, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(111, 2, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(112, 2, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(113, 2, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(114, 2, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(115, 2, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(116, 2, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(117, 3, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(118, 3, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(119, 3, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(120, 3, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(121, 3, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(122, 3, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(123, 3, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(124, 3, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(125, 3, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(126, 3, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(127, 3, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(128, 3, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(129, 3, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(130, 1, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(131, 1, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(132, 1, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(133, 1, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(134, 1, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(135, 2, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(136, 2, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(137, 2, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(138, 2, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(139, 2, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(140, 3, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(141, 3, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(142, 3, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(143, 3, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(144, 3, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_attachments_on_author_id` (`author_id`),
  ADD KEY `index_attachments_on_created_on` (`created_on`),
  ADD KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`),
  ADD KEY `index_attachments_on_disk_filename` (`disk_filename`);

--
-- Indexes for table `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_auth_sources_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boards_project_id` (`project_id`),
  ADD KEY `index_boards_on_last_message_id` (`last_message_id`);

--
-- Indexes for table `changes`
--
ALTER TABLE `changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `changesets_changeset_id` (`changeset_id`);

--
-- Indexes for table `changesets`
--
ALTER TABLE `changesets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  ADD KEY `index_changesets_on_user_id` (`user_id`),
  ADD KEY `index_changesets_on_repository_id` (`repository_id`),
  ADD KEY `index_changesets_on_committed_on` (`committed_on`),
  ADD KEY `changesets_repos_scmid` (`repository_id`,`scmid`);

--
-- Indexes for table `changesets_issues`
--
ALTER TABLE `changesets_issues`
  ADD UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`),
  ADD KEY `index_changesets_issues_on_issue_id` (`issue_id`);

--
-- Indexes for table `changeset_parents`
--
ALTER TABLE `changeset_parents`
  ADD KEY `changeset_parents_changeset_ids` (`changeset_id`),
  ADD KEY `changeset_parents_parent_ids` (`parent_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  ADD KEY `index_comments_on_author_id` (`author_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_fields_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `custom_fields_projects`
--
ALTER TABLE `custom_fields_projects`
  ADD UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`);

--
-- Indexes for table `custom_fields_roles`
--
ALTER TABLE `custom_fields_roles`
  ADD UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`);

--
-- Indexes for table `custom_fields_trackers`
--
ALTER TABLE `custom_fields_trackers`
  ADD UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`);

--
-- Indexes for table `custom_field_enumerations`
--
ALTER TABLE `custom_field_enumerations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_values`
--
ALTER TABLE `custom_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_values_customized` (`customized_type`,`customized_id`),
  ADD KEY `index_custom_values_on_custom_field_id` (`custom_field_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_project_id` (`project_id`),
  ADD KEY `index_documents_on_category_id` (`category_id`),
  ADD KEY `index_documents_on_created_on` (`created_on`);

--
-- Indexes for table `email_addresses`
--
ALTER TABLE `email_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_email_addresses_on_user_id` (`user_id`);

--
-- Indexes for table `enabled_modules`
--
ALTER TABLE `enabled_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled_modules_project_id` (`project_id`);

--
-- Indexes for table `enumerations`
--
ALTER TABLE `enumerations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_enumerations_on_project_id` (`project_id`),
  ADD KEY `index_enumerations_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `groups_users`
--
ALTER TABLE `groups_users`
  ADD UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_items`
--
ALTER TABLE `import_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_import_items_on_import_id_and_unique_id` (`import_id`,`unique_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_project_id` (`project_id`),
  ADD KEY `index_issues_on_status_id` (`status_id`),
  ADD KEY `index_issues_on_category_id` (`category_id`),
  ADD KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  ADD KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  ADD KEY `index_issues_on_tracker_id` (`tracker_id`),
  ADD KEY `index_issues_on_priority_id` (`priority_id`),
  ADD KEY `index_issues_on_author_id` (`author_id`),
  ADD KEY `index_issues_on_created_on` (`created_on`),
  ADD KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`),
  ADD KEY `index_issues_on_parent_id` (`parent_id`);

--
-- Indexes for table `issue_categories`
--
ALTER TABLE `issue_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issue_categories_project_id` (`project_id`),
  ADD KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`);

--
-- Indexes for table `issue_relations`
--
ALTER TABLE `issue_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  ADD KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  ADD KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`);

--
-- Indexes for table `issue_statuses`
--
ALTER TABLE `issue_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_issue_statuses_on_position` (`position`),
  ADD KEY `index_issue_statuses_on_is_closed` (`is_closed`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  ADD KEY `index_journals_on_user_id` (`user_id`),
  ADD KEY `index_journals_on_journalized_id` (`journalized_id`),
  ADD KEY `index_journals_on_created_on` (`created_on`);

--
-- Indexes for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_details_journal_id` (`journal_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  ADD KEY `index_members_on_user_id` (`user_id`),
  ADD KEY `index_members_on_project_id` (`project_id`);

--
-- Indexes for table `member_roles`
--
ALTER TABLE `member_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_member_roles_on_member_id` (`member_id`),
  ADD KEY `index_member_roles_on_role_id` (`role_id`),
  ADD KEY `index_member_roles_on_inherited_from` (`inherited_from`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_board_id` (`board_id`),
  ADD KEY `messages_parent_id` (`parent_id`),
  ADD KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  ADD KEY `index_messages_on_author_id` (`author_id`),
  ADD KEY `index_messages_on_created_on` (`created_on`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_project_id` (`project_id`),
  ADD KEY `index_news_on_author_id` (`author_id`),
  ADD KEY `index_news_on_created_on` (`created_on`);

--
-- Indexes for table `open_id_authentication_associations`
--
ALTER TABLE `open_id_authentication_associations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `open_id_authentication_nonces`
--
ALTER TABLE `open_id_authentication_nonces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_projects_on_lft` (`lft`),
  ADD KEY `index_projects_on_rgt` (`rgt`);

--
-- Indexes for table `projects_trackers`
--
ALTER TABLE `projects_trackers`
  ADD UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  ADD KEY `projects_trackers_project_id` (`project_id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_queries_on_project_id` (`project_id`),
  ADD KEY `index_queries_on_user_id` (`user_id`);

--
-- Indexes for table `queries_roles`
--
ALTER TABLE `queries_roles`
  ADD UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`);

--
-- Indexes for table `repositories`
--
ALTER TABLE `repositories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_repositories_on_project_id` (`project_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_managed_roles`
--
ALTER TABLE `roles_managed_roles`
  ADD UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_settings_on_name` (`name`);

--
-- Indexes for table `time_entries`
--
ALTER TABLE `time_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_entries_project_id` (`project_id`),
  ADD KEY `time_entries_issue_id` (`issue_id`),
  ADD KEY `index_time_entries_on_activity_id` (`activity_id`),
  ADD KEY `index_time_entries_on_user_id` (`user_id`),
  ADD KEY `index_time_entries_on_created_on` (`created_on`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_value` (`value`),
  ADD KEY `index_tokens_on_user_id` (`user_id`);

--
-- Indexes for table `trackers`
--
ALTER TABLE `trackers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_users_on_id_and_type` (`id`,`type`),
  ADD KEY `index_users_on_auth_source_id` (`auth_source_id`),
  ADD KEY `index_users_on_type` (`type`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_preferences_on_user_id` (`user_id`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `versions_project_id` (`project_id`),
  ADD KEY `index_versions_on_sharing` (`sharing`);

--
-- Indexes for table `watchers`
--
ALTER TABLE `watchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  ADD KEY `index_watchers_on_user_id` (`user_id`),
  ADD KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`);

--
-- Indexes for table `wikis`
--
ALTER TABLE `wikis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wikis_project_id` (`project_id`);

--
-- Indexes for table `wiki_contents`
--
ALTER TABLE `wiki_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_contents_page_id` (`page_id`),
  ADD KEY `index_wiki_contents_on_author_id` (`author_id`);

--
-- Indexes for table `wiki_content_versions`
--
ALTER TABLE `wiki_content_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  ADD KEY `index_wiki_content_versions_on_updated_on` (`updated_on`);

--
-- Indexes for table `wiki_pages`
--
ALTER TABLE `wiki_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  ADD KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  ADD KEY `index_wiki_pages_on_parent_id` (`parent_id`);

--
-- Indexes for table `wiki_redirects`
--
ALTER TABLE `wiki_redirects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  ADD KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  ADD KEY `index_workflows_on_old_status_id` (`old_status_id`),
  ADD KEY `index_workflows_on_role_id` (`role_id`),
  ADD KEY `index_workflows_on_new_status_id` (`new_status_id`),
  ADD KEY `index_workflows_on_tracker_id` (`tracker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `changes`
--
ALTER TABLE `changes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `changesets`
--
ALTER TABLE `changesets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_enumerations`
--
ALTER TABLE `custom_field_enumerations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_values`
--
ALTER TABLE `custom_values`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_addresses`
--
ALTER TABLE `email_addresses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `enabled_modules`
--
ALTER TABLE `enabled_modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `enumerations`
--
ALTER TABLE `enumerations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `issue_categories`
--
ALTER TABLE `issue_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_relations`
--
ALTER TABLE `issue_relations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_statuses`
--
ALTER TABLE `issue_statuses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `member_roles`
--
ALTER TABLE `member_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `open_id_authentication_associations`
--
ALTER TABLE `open_id_authentication_associations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `open_id_authentication_nonces`
--
ALTER TABLE `open_id_authentication_nonces`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `repositories`
--
ALTER TABLE `repositories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_entries`
--
ALTER TABLE `time_entries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `trackers`
--
ALTER TABLE `trackers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `versions`
--
ALTER TABLE `versions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watchers`
--
ALTER TABLE `watchers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wikis`
--
ALTER TABLE `wikis`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wiki_contents`
--
ALTER TABLE `wiki_contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_content_versions`
--
ALTER TABLE `wiki_content_versions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_pages`
--
ALTER TABLE `wiki_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_redirects`
--
ALTER TABLE `wiki_redirects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
