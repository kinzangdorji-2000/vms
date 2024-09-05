-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2024 at 08:42 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`, `language_chooser_control`, `list_filter_highlight`, `list_filter_removal_links`, `show_fieldsets_as_tabs`, `show_inlines_as_tabs`) VALUES
(1, 'Django panel', 1, 'Visitor Management System', 1, '', 0, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1, 'default-select', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add departments', 7, 'add_departments'),
(26, 'Can change departments', 7, 'change_departments'),
(27, 'Can delete departments', 7, 'delete_departments'),
(28, 'Can view departments', 7, 'view_departments'),
(29, 'Can add visitors', 8, 'add_visitors'),
(30, 'Can change visitors', 8, 'change_visitors'),
(31, 'Can delete visitors', 8, 'delete_visitors'),
(32, 'Can view visitors', 8, 'view_visitors'),
(33, 'Can add Theme', 9, 'add_theme'),
(34, 'Can change Theme', 9, 'change_theme'),
(35, 'Can delete Theme', 9, 'delete_theme'),
(36, 'Can view Theme', 9, 'view_theme');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$iErIekyKo7ZF1tj6u4LCxb$GeSopG/CcGdBw4NhGcZjrPtsn6+JQFoYrBNoEsrCMjM=', '2023-12-06 04:21:28.321642', 1, 'admin', 'Veronica', 'Park', 'admin@gmail.com', 1, 1, '2023-11-26 16:14:09.000000'),
(2, 'pbkdf2_sha256$600000$iErIekyKo7ZF1tj6u4LCxb$GeSopG/CcGdBw4NhGcZjrPtsn6+JQFoYrBNoEsrCMjM=', '2023-12-05 04:42:06.061471', 0, 'dema', 'Veronica', 'Park', 'dema@gmail.com', 0, 1, '2023-11-27 10:15:30.095228');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-11-27 10:15:30.371945', '2', 'dema', 1, '[{\"added\": {}}]', 4, 1),
(2, '2023-11-27 10:50:55.736767', '1', 'John', 2, '[{\"changed\": {\"fields\": [\"Date added\"]}}]', 8, 1),
(3, '2023-11-27 10:56:18.659641', '1', 'John', 2, '[{\"changed\": {\"fields\": [\"Date added\"]}}]', 8, 1),
(4, '2023-12-01 04:06:14.895033', '2', 'dema', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(5, '2023-12-06 04:21:48.662211', '1', 'Django', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(6, '2023-12-06 04:23:10.795403', '1', 'Django', 2, '[{\"changed\": {\"fields\": [\"Visible\"]}}]', 9, 1),
(7, '2023-12-06 04:25:51.751016', '1', 'Django panel', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Visible\", \"Visible\"]}}]', 9, 1),
(8, '2023-12-06 04:28:13.011815', '1', 'Django panel', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'admin_interface', 'theme'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'vmsApp', 'departments'),
(8, 'vmsApp', 'visitors');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-27 10:13:51.721763'),
(2, 'auth', '0001_initial', '2023-11-27 10:13:52.568681'),
(3, 'admin', '0001_initial', '2023-11-27 10:13:52.832818'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-27 10:13:52.839795'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-27 10:13:52.847359'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-27 10:13:52.955966'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-27 10:13:53.036472'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-27 10:13:53.079568'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-27 10:13:53.087637'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-27 10:13:53.202204'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-27 10:13:53.206025'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-27 10:13:53.212536'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-27 10:13:53.240204'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-27 10:13:53.269443'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-27 10:13:53.296276'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-27 10:13:53.303337'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-27 10:13:53.328594'),
(18, 'sessions', '0001_initial', '2023-11-27 10:13:53.397712'),
(19, 'vmsApp', '0001_initial', '2023-11-27 10:13:53.442076'),
(20, 'vmsApp', '0002_visitors', '2023-11-27 10:13:53.571711'),
(21, 'vmsApp', '0003_visitors_status', '2023-11-28 05:21:35.118367'),
(22, 'vmsApp', '0004_visitors_date_checkout', '2023-11-28 08:47:34.813466'),
(23, 'vmsApp', '0005_alter_visitors_date_checkout', '2023-11-28 08:48:26.425563'),
(24, 'vmsApp', '0006_alter_departments_options_alter_visitors_date_added_and_more', '2023-12-01 10:14:39.984331'),
(25, 'admin_interface', '0001_initial', '2023-12-04 10:13:26.437032'),
(26, 'admin_interface', '0002_add_related_modal', '2023-12-04 10:13:26.595360'),
(27, 'admin_interface', '0003_add_logo_color', '2023-12-04 10:13:26.633356'),
(28, 'admin_interface', '0004_rename_title_color', '2023-12-04 10:13:26.654083'),
(29, 'admin_interface', '0005_add_recent_actions_visible', '2023-12-04 10:13:26.692879'),
(30, 'admin_interface', '0006_bytes_to_str', '2023-12-04 10:13:26.737469'),
(31, 'admin_interface', '0007_add_favicon', '2023-12-04 10:13:26.770466'),
(32, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2023-12-04 10:13:26.822238'),
(33, 'admin_interface', '0009_add_enviroment', '2023-12-04 10:13:26.890934'),
(34, 'admin_interface', '0010_add_localization', '2023-12-04 10:13:26.905402'),
(35, 'admin_interface', '0011_add_environment_options', '2023-12-04 10:13:27.041430'),
(36, 'admin_interface', '0012_update_verbose_names', '2023-12-04 10:13:27.047436'),
(37, 'admin_interface', '0013_add_related_modal_close_button', '2023-12-04 10:13:27.086356'),
(38, 'admin_interface', '0014_name_unique', '2023-12-04 10:13:27.108875'),
(39, 'admin_interface', '0015_add_language_chooser_active', '2023-12-04 10:13:27.146258'),
(40, 'admin_interface', '0016_add_language_chooser_display', '2023-12-04 10:13:27.185182'),
(41, 'admin_interface', '0017_change_list_filter_dropdown', '2023-12-04 10:13:27.191541'),
(42, 'admin_interface', '0018_theme_list_filter_sticky', '2023-12-04 10:13:27.231709'),
(43, 'admin_interface', '0019_add_form_sticky', '2023-12-04 10:13:27.303960'),
(44, 'admin_interface', '0020_module_selected_colors', '2023-12-04 10:13:27.378144'),
(45, 'admin_interface', '0021_file_extension_validator', '2023-12-04 10:13:27.384215'),
(46, 'admin_interface', '0022_add_logo_max_width_and_height', '2023-12-04 10:13:27.452287'),
(47, 'admin_interface', '0023_theme_foldable_apps', '2023-12-04 10:13:27.486957'),
(48, 'admin_interface', '0024_remove_theme_css', '2023-12-04 10:13:27.508909'),
(49, 'admin_interface', '0025_theme_language_chooser_control', '2023-12-04 10:13:27.547325'),
(50, 'admin_interface', '0026_theme_list_filter_highlight', '2023-12-04 10:13:27.586016'),
(51, 'admin_interface', '0027_theme_list_filter_removal_links', '2023-12-04 10:13:27.624431'),
(52, 'admin_interface', '0028_theme_show_fieldsets_as_tabs_and_more', '2023-12-04 10:13:27.694618'),
(53, 'vmsApp', '0007_alter_visitors_department', '2023-12-06 04:42:28.970827');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('zgusbk8pxrnoqri1j92kf1t3nxrrn7g5', '.eJxVjMsOgjAUBf-la9P0AaV16Z5vaO6jtagpCYWV8d-FhIVuz8yct4iwrSVuLS1xYnEVWlx-NwR6pnoAfkC9z5Lmui4TykORJ21ynDm9bqf7d1Cglb1WBlXPGTODS4jOh84o64NlRzZZqywFPWRwZujIm-wI3U60yj1hABafL-wnOCs:1rAjPc:x5eEby2J_-qYTIx-9YDzDOucodXpi9BawM4EzPiUHlc', '2023-12-20 04:21:28.326746');

-- --------------------------------------------------------

--
-- Table structure for table `vmsapp_departments`
--

CREATE TABLE `vmsapp_departments` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` varchar(2) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vmsapp_departments`
--

INSERT INTO `vmsapp_departments` (`id`, `name`, `status`, `delete_flag`, `date_added`, `date_created`) VALUES
(1, 'Employee', '1', 0, '2023-11-27 10:23:24.522617', '2023-11-28 04:58:15.224799'),
(2, 'Tourist', '1', 0, '2023-11-27 10:23:34.927541', '2023-11-28 04:58:51.686332'),
(3, 'Bhutanese', '1', 0, '2023-11-27 10:23:46.466842', '2023-11-27 10:23:46.468840');

-- --------------------------------------------------------

--
-- Table structure for table `vmsapp_visitors`
--

CREATE TABLE `vmsapp_visitors` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `address` longtext NOT NULL,
  `reason` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `date_checkout` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vmsapp_visitors`
--

INSERT INTO `vmsapp_visitors` (`id`, `name`, `gender`, `contact`, `email`, `address`, `reason`, `status`, `date_added`, `date_created`, `department_id`, `date_checkout`) VALUES
(1, 'John', 'Male', '97511234567', 'test@gmail.com', 'thimphu', 'visit musuem', 'checkout', '2023-11-28 10:06:05.000000', '2023-12-04 10:43:42.636066', 2, '2023-11-28 10:43:42.636066'),
(2, 'Sangay Lhamo', 'Female', '97511234567', 'ict.official@gmail.com', 'babesa', 'tour', 'checkin', '2023-11-29 12:39:17.000000', '2023-12-04 10:17:44.626215', 3, '2023-11-07 15:48:29.000000'),
(3, 'Sonam Dema', 'Female', '97511234560', 'sonamlhaden@gmail.com', 'ncndx', 'nvd', 'checkin', '2023-11-30 12:23:33.000000', '2023-11-28 09:52:24.466843', 2, '2023-11-28 08:47:34.000000'),
(4, 'test', 'Male', '345467878443', '', 'rfrv', 'dcvf', 'checkin', '2023-12-01 12:23:38.000000', '2023-11-28 06:47:31.129648', 3, '2023-11-28 08:47:34.000000'),
(5, 'test2', 'Male', 'gtbh', '', 'vf', 'ffb', 'checkin', '2023-12-01 12:23:43.000000', '2023-11-28 08:48:56.057746', 2, '2023-11-28 08:48:56.000000'),
(6, 'Tashi Dema', 'Female', '848r49r4739', '', 'rgrf', 'rgr', 'checkout', '2023-12-01 12:23:46.000000', '2023-11-28 10:34:15.460911', 1, '2023-11-28 10:34:15.460911'),
(7, 'Kunzang Pemo', 'Female', '747r84833939', '', 'dbjc nd', 'cdcn s', 'checkin', '2023-12-01 12:23:49.000000', '2023-11-28 10:35:46.654772', 2, '2023-11-28 10:35:46.654772'),
(8, 'cema', 'Female', '97511234567', '', 'bdc', 'cndc d', 'checkout', '2023-12-01 12:23:52.000000', '2023-11-28 10:42:43.503096', 2, '2023-11-28 10:42:43.502027'),
(9, 'hello', 'Male', 'ff', '', 'c', 'd', 'checkin', '2023-12-01 12:23:55.000000', '2023-11-28 10:44:40.898353', 2, '2023-11-28 10:44:40.898353'),
(10, 'test wednesday', 'Male', '1234567', '', 'tegyde', 'cn dc', 'checkin', '2023-12-01 12:23:58.000000', '2023-11-29 03:39:02.875890', 2, '2023-11-29 03:39:02.876887'),
(11, 'Karma Wangchuk', 'Male', '56898', '', 'ttetsts', 'hcbdjc', 'checkin', '2023-12-01 12:24:02.000000', '2023-11-29 03:48:05.975816', 2, '2023-11-29 03:48:05.975816');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `vmsapp_departments`
--
ALTER TABLE `vmsapp_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vmsapp_visitors`
--
ALTER TABLE `vmsapp_visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vmsApp_visitors_department_id_f3565f53_fk_vmsApp_departments_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `vmsapp_departments`
--
ALTER TABLE `vmsapp_departments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vmsapp_visitors`
--
ALTER TABLE `vmsapp_visitors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `vmsapp_visitors`
--
ALTER TABLE `vmsapp_visitors`
  ADD CONSTRAINT `vmsApp_visitors_department_id_f3565f53_fk_vmsApp_departments_id` FOREIGN KEY (`department_id`) REFERENCES `vmsapp_departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
