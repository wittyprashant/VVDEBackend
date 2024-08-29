-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2024 at 09:10 AM
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
-- Database: `data_entry_software`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `display_order` bigint(20) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `display_order`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(9, 'First Category', '202312266989ac66dbf669f80783dea1c8cc2a8a.png', 0, 1, 1, 0, '2023-12-26 01:02:37', '2023-12-26 01:04:18'),
(10, 'Category Second', '202312298ddb3eb1af3af5ec19b6aa224c60ce1a.png', 0, 2, 1, 0, '2023-12-28 22:41:20', '2023-12-28 22:41:20'),
(80, '', 'no_image.png', 0, 0, 1, 0, '2024-07-16 05:51:39', '2024-07-16 05:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `contributor_meta`
--

CREATE TABLE `contributor_meta` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `publication_reviewed` int(1) NOT NULL COMMENT '1 - Yes, 2 - No, 3 - In Review',
  `corresponding_author` varchar(200) DEFAULT NULL,
  `publication_title` varchar(200) DEFAULT NULL,
  `publication_weblink` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 - Active, 2 - Inactive',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - Not Deleted, 1 -Deleted	',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contributor_meta`
--

INSERT INTO `contributor_meta` (`id`, `name`, `category_id`, `affiliation`, `email`, `publication_reviewed`, `corresponding_author`, `publication_title`, `publication_weblink`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(8, 'Test Contributor', 3, 'Affiliation', 'testcontributor@gmail.com', 1, 'Corresponding Author', 'Publication Title', 'Publication Weblink', 1, 0, '2024-04-17 08:27:30', '2024-04-17 13:57:30'),
(9, 'New Contributor User', 1, 'Test', 'newcontributoruser12154@gmail.com', 1, 'sasd', 'sadasd', 'asd', 1, 0, '2024-07-11 02:01:12', '2024-07-11 07:31:12'),
(10, 'testuser1', 1, 'testuser1', 'testuser15@gmail.com', 1, 'testuser1', 'testuser1', 'testuser1', 1, 0, '2024-07-11 02:04:25', '2024-07-11 07:34:25'),
(11, 'New Contributor User', 1, 'Test', 'newcontribu25toruser12154@gmail.com', 1, 'sasd', 'sadasd', 'asd', 1, 0, '2024-07-11 03:59:07', '2024-07-11 09:29:07'),
(12, 'witty', 20, 'witty', 'witty@gmail.com', 2, 'witty', 'witty', 'witty', 1, 0, '2024-07-11 04:37:06', '2024-07-11 10:07:06');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_meta`
--

CREATE TABLE `dataset_meta` (
  `id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `material_image` text DEFAULT NULL,
  `data_type_id` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - Primary, 1 - Secondary',
  `data_reliability_id` varchar(200) NOT NULL,
  `data_source_id` varchar(100) NOT NULL,
  `process_review_id` varchar(100) NOT NULL DEFAULT 'yes' COMMENT '0 - No, 1 - Yes',
  `start_date` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `beginning_year` int(11) DEFAULT NULL,
  `beginning_month` int(11) DEFAULT NULL,
  `ending_year` int(11) DEFAULT NULL,
  `ending_month` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_meta`
--

INSERT INTO `dataset_meta` (`id`, `material_id`, `category_id`, `manufacturer`, `material_image`, `data_type_id`, `data_reliability_id`, `data_source_id`, `process_review_id`, `start_date`, `end_time`, `beginning_year`, `beginning_month`, `ending_year`, `ending_month`, `created_at`, `updated_at`) VALUES
(8, 75, 79, '', '', 3, 'measured', '1', '1', NULL, NULL, 0, 0, 0, 0, '2024-07-16 11:08:39', '2024-07-16 11:08:39'),
(9, 76, 80, '', '', 3, 'measured', '1', '1', NULL, NULL, 0, 0, 0, 0, '2024-07-16 11:21:39', '2024-07-16 11:21:39'),
(10, 1, 1, 'manufacturer', NULL, 1, 'measured', '1', '2', NULL, NULL, 0, 0, 0, 0, '2024-08-27 10:00:31', '2024-08-27 10:00:31'),
(11, 1, 1, 'manufacturer', NULL, 1, 'measured', '1', '2', NULL, NULL, 0, 0, 0, 0, '2024-08-28 05:20:07', '2024-08-28 05:20:07'),
(12, 1, 1, 'manufacturer', NULL, 1, 'measured', '1', '2', NULL, NULL, 0, 0, 0, 0, '2024-08-28 08:20:41', '2024-08-28 08:20:41'),
(13, 1, 1, 'manufacturer', NULL, 1, 'measured', '1', '2', NULL, NULL, 0, 0, 0, 0, '2024-08-28 11:08:19', '2024-08-28 11:08:19'),
(14, 1, 1, 'manufacturer', NULL, 1, 'measured', '1', '2', NULL, NULL, 0, 0, 0, 0, '2024-08-28 11:55:54', '2024-08-28 11:55:54');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_meta_a1`
--

CREATE TABLE `dataset_meta_a1` (
  `id` bigint(11) NOT NULL,
  `cantributor_id` int(11) NOT NULL,
  `contributor_meta_id` int(11) NOT NULL,
  `dataset_meta_id` int(11) DEFAULT NULL,
  `dataseta1_category_id` int(11) NOT NULL,
  `dataseta1_category_name` varchar(200) DEFAULT NULL,
  `a1_raw_material` varchar(255) DEFAULT NULL,
  `a1_raw_material_qty` varchar(255) DEFAULT NULL,
  `a1_raw_material_extraction_status` varchar(255) DEFAULT NULL,
  `a1_raw_material_extraction_process` varchar(255) DEFAULT NULL,
  `a1_raw_material_extraction_site_lat` varchar(255) DEFAULT NULL,
  `a1_raw_material_extraction_site_lon` varchar(255) DEFAULT NULL,
  `a1_raw_material_extraction_site_district` varchar(255) DEFAULT NULL,
  `a1_raw_material_extraction_site_state` varchar(255) DEFAULT NULL,
  `a1_fuel_mix` varchar(255) DEFAULT NULL,
  `a1_fuel_qty` varchar(255) DEFAULT NULL,
  `a1_fuel_density` varchar(255) DEFAULT NULL,
  `a1_fuel_calorific_value` varchar(255) DEFAULT NULL,
  `a1_embodied_energy_details` varchar(255) DEFAULT NULL,
  `a1_characterization_factor` varchar(255) DEFAULT NULL,
  `a1_embodied_energy_unit` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_meta_a1`
--

INSERT INTO `dataset_meta_a1` (`id`, `cantributor_id`, `contributor_meta_id`, `dataset_meta_id`, `dataseta1_category_id`, `dataseta1_category_name`, `a1_raw_material`, `a1_raw_material_qty`, `a1_raw_material_extraction_status`, `a1_raw_material_extraction_process`, `a1_raw_material_extraction_site_lat`, `a1_raw_material_extraction_site_lon`, `a1_raw_material_extraction_site_district`, `a1_raw_material_extraction_site_state`, `a1_fuel_mix`, `a1_fuel_qty`, `a1_fuel_density`, `a1_fuel_calorific_value`, `a1_embodied_energy_details`, `a1_characterization_factor`, `a1_embodied_energy_unit`, `created_at`, `updated_at`) VALUES
(78, 0, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-07-16 05:38:39', '2024-07-16 11:08:39'),
(79, 0, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-07-16 05:51:39', '2024-07-16 11:21:39'),
(80, 0, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-27 04:30:31', '2024-08-27 10:00:31'),
(81, 0, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-27 23:50:07', '2024-08-28 05:20:07'),
(82, 0, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-28 02:50:41', '2024-08-28 08:20:41'),
(83, 0, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-28 05:38:19', '2024-08-28 11:08:19'),
(84, 0, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-28 06:25:54', '2024-08-28 11:55:54');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_meta_a2`
--

CREATE TABLE `dataset_meta_a2` (
  `id` bigint(20) NOT NULL,
  `cantributor_id` int(11) DEFAULT NULL,
  `contributor_meta_id` int(11) DEFAULT NULL,
  `dataset_meta_id` int(11) DEFAULT NULL,
  `dataseta2_category_id` int(11) DEFAULT NULL,
  `dataseta2_category_name` varchar(150) DEFAULT NULL,
  `a2_raw_material` varchar(255) DEFAULT NULL,
  `a2_raw_material_manufacturing_plant` varchar(255) DEFAULT NULL,
  `a2_raw_material_extraction_site` varchar(255) DEFAULT NULL,
  `a2_raw_material_district` varchar(255) DEFAULT NULL,
  `a2_raw_material_state` varchar(255) DEFAULT NULL,
  `a2_raw_mat_distance_between_extraction_and_manufacturing_site` varchar(255) DEFAULT NULL,
  `a2_raw_material_vehicle_make` varchar(255) DEFAULT NULL,
  `a2_raw_material_vehicle_model` varchar(255) DEFAULT NULL,
  `a2_raw_material_vehicle_capacity` varchar(255) DEFAULT NULL,
  `a2_raw_material_vehicle_category` varchar(255) DEFAULT NULL,
  `a2_raw_material_trip_required_transporting_raw_material_qty` varchar(255) DEFAULT NULL,
  `a2_raw_material_total_distance_travel_transporting_raw_material` varchar(255) DEFAULT NULL,
  `a2_fuel_mix` varchar(255) DEFAULT NULL,
  `a2_fuel_mix_qty` varchar(255) DEFAULT NULL,
  `a2_fuel_density` varchar(255) DEFAULT NULL,
  `a2_fuel_calorific_value` varchar(255) DEFAULT NULL,
  `a2_fuel_embodied_energy_details_qty` varchar(255) DEFAULT NULL,
  `a2_fuel_embodied_carbon_details_unit` varchar(255) DEFAULT NULL,
  `a2_embodied_energy` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_meta_a2`
--

INSERT INTO `dataset_meta_a2` (`id`, `cantributor_id`, `contributor_meta_id`, `dataset_meta_id`, `dataseta2_category_id`, `dataseta2_category_name`, `a2_raw_material`, `a2_raw_material_manufacturing_plant`, `a2_raw_material_extraction_site`, `a2_raw_material_district`, `a2_raw_material_state`, `a2_raw_mat_distance_between_extraction_and_manufacturing_site`, `a2_raw_material_vehicle_make`, `a2_raw_material_vehicle_model`, `a2_raw_material_vehicle_capacity`, `a2_raw_material_vehicle_category`, `a2_raw_material_trip_required_transporting_raw_material_qty`, `a2_raw_material_total_distance_travel_transporting_raw_material`, `a2_fuel_mix`, `a2_fuel_mix_qty`, `a2_fuel_density`, `a2_fuel_calorific_value`, `a2_fuel_embodied_energy_details_qty`, `a2_fuel_embodied_carbon_details_unit`, `a2_embodied_energy`, `created_at`, `updated_at`) VALUES
(65, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-28 06:25:54', '2024-08-28 11:55:54'),
(64, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-28 05:38:19', '2024-08-28 11:08:19'),
(63, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-28 02:50:41', '2024-08-28 08:20:41'),
(62, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-27 23:50:07', '2024-08-28 05:20:07'),
(61, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-08-27 04:30:31', '2024-08-27 10:00:31'),
(60, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-07-16 05:51:39', '2024-07-16 11:21:39'),
(59, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-07-16 05:51:39', '2024-07-16 11:21:39'),
(58, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-07-16 05:38:39', '2024-07-16 11:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_meta_a3`
--

CREATE TABLE `dataset_meta_a3` (
  `id` bigint(11) NOT NULL,
  `cantributor_id` int(11) DEFAULT NULL,
  `contributor_meta_id` int(11) DEFAULT NULL,
  `dataset_meta_id` int(11) DEFAULT NULL,
  `dataseta3_category_id` int(11) DEFAULT NULL,
  `dataseta3_category_name` varchar(200) DEFAULT NULL,
  `a3_raw_material` varchar(255) DEFAULT NULL,
  `a3_manufacturing_technology` varchar(255) DEFAULT NULL,
  `a3_processes_undertaken_during_manufacturing` varchar(255) DEFAULT NULL,
  `a3_plant_standard_operation_temperature` varchar(255) DEFAULT NULL,
  `a3_plant_standard_operation_pressure` varchar(255) DEFAULT NULL,
  `a3_material_quality` varchar(255) DEFAULT NULL,
  `a3_fuel_mix` varchar(255) DEFAULT NULL,
  `a3_fuel_qty` varchar(255) DEFAULT NULL,
  `a3_fuel_density` varchar(255) DEFAULT NULL,
  `a3_calorific_value` varchar(255) DEFAULT NULL,
  `a1_embodied_energy_details_qty` varchar(255) DEFAULT NULL,
  `a3_characterization_factor` varchar(255) DEFAULT NULL,
  `a3_embodied_energy_for_reference_raw_materia_qty` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_meta_a3`
--

INSERT INTO `dataset_meta_a3` (`id`, `cantributor_id`, `contributor_meta_id`, `dataset_meta_id`, `dataseta3_category_id`, `dataseta3_category_name`, `a3_raw_material`, `a3_manufacturing_technology`, `a3_processes_undertaken_during_manufacturing`, `a3_plant_standard_operation_temperature`, `a3_plant_standard_operation_pressure`, `a3_material_quality`, `a3_fuel_mix`, `a3_fuel_qty`, `a3_fuel_density`, `a3_calorific_value`, `a1_embodied_energy_details_qty`, `a3_characterization_factor`, `a3_embodied_energy_for_reference_raw_materia_qty`, `created_at`, `updated_at`) VALUES
(79, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '20', '10', 'Fuel Density', '2024-08-28 06:25:54', '2024-08-28 11:55:54'),
(78, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '20', '10', 'Fuel Density', '2024-08-28 05:38:19', '2024-08-28 11:08:19'),
(77, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '20', '10', 'Fuel Density', '2024-08-28 02:50:41', '2024-08-28 08:20:41'),
(76, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '20', '10', 'Fuel Density', '2024-08-27 23:50:07', '2024-08-28 05:20:07'),
(75, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '20', '10', 'Fuel Density', '2024-08-27 04:30:31', '2024-08-27 10:00:31'),
(74, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-07-16 05:51:39', '2024-07-16 11:21:39'),
(73, 1, 1, 1, 1, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-07-16 05:38:39', '2024-07-16 11:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-Active, 2-Inactive',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-Not Deleted, 1-Deleted',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `name`, `image`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(2, 'Cement', '', 1, 0, '2024-03-04 13:31:08', '2024-03-04 13:31:08'),
(3, 'Sand', '', 1, 0, '2024-03-04 13:31:08', '2024-03-04 13:31:08'),
(4, 'Aggregate', '', 1, 0, '2024-03-04 13:31:30', '2024-03-04 13:31:30'),
(5, 'Burnt Clay Bricks', '', 1, 0, '2024-03-04 13:31:30', '2024-03-04 13:31:30'),
(6, 'AAC Blocks', '', 1, 0, '2024-03-04 13:31:46', '2024-03-04 13:31:46'),
(7, 'Fly Ash Bricks', '', 1, 0, '2024-03-04 13:31:46', '2024-03-04 13:31:46'),
(76, '6', NULL, 1, 0, '2024-07-16 11:21:39', '2024-07-16 11:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(13, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(14, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(15, '2016_06_01_000004_create_oauth_clients_table', 1),
(16, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 1),
(18, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6b3456aa3fabc9ccca8942c4fc716d7f542e20ffc1978deeb93cd0b9f98644c8d3f3c7c06da36830', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2023-12-25 03:33:46', '2023-12-25 03:33:46', '2024-06-25 09:03:46'),
('46ce83199f42b5d198ae26d5ae303b8796a102dabface9345a62a128a1a530fede513df873a1ca50', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2023-12-26 04:04:06', '2023-12-26 04:04:06', '2024-06-26 09:34:06'),
('e3768caa4ccb1966334bedadbfc0e7178f113f13c7e1307930cc4d7b5966eb899259e75713ceebfe', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2023-12-26 04:16:26', '2023-12-26 04:16:26', '2024-06-26 09:46:26'),
('b2b659ce4c1b74c39653d59d747dad3031b898b4e019b136803fbdd7c95c1d79fa93fc0466a95372', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-02-21 05:10:04', '2024-02-21 05:10:04', '2024-08-21 10:40:04'),
('6a6543eaddec02da9c051212066eecbbf51e57532be9c504bf23dcccbaa7775ba4722e47a5171120', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-02-21 05:27:35', '2024-02-21 05:27:35', '2024-08-21 10:57:35'),
('97b3d4b744ce75227bf3cb97c27d5ebfdd22f47d7ff3fa71ca3434e5641203910256e09eb0a9de96', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-02-21 05:28:18', '2024-02-21 05:28:18', '2024-08-21 10:58:18'),
('51471a4695b9fc68a36dadbdd4c542fb6b9d05be5b1ca90704bc4db167ea5b85597816c9e1929600', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-02-21 05:31:54', '2024-02-21 05:31:54', '2024-08-21 11:01:54'),
('2b8a3816ca8b40b660e22b6aba4a6c2cae0bb029c3bd4a087ff62bddc79a8d998c18b30cb687349a', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-02-21 05:37:38', '2024-02-21 05:37:38', '2024-08-21 11:07:38'),
('39b86c0939a99b76fe97aa2d4a8fc01084bbfbaf7495b31ee6331f1b67651551a63b2b782f84dc29', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-02-21 05:40:03', '2024-02-21 05:40:03', '2024-08-21 11:10:03'),
('329d29f3e39fcf4ac4383329b75dfc26882d133ee668fff1f1c19c2a7fb6ee131ca23cb1e102b9c3', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-02-22 01:23:08', '2024-02-22 01:23:08', '2024-08-22 06:53:08'),
('4ec0f21b5a215c68cac85ce4d8be970f32cda9e6d0c1195a79ef18cf55a4f1dbfdcc430c26c6a039', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-06 05:19:12', '2024-03-06 05:19:12', '2024-09-06 10:49:12'),
('9941e7b6da163554c23b2c3a5b62434476bc42ef349dd7206f75af8e1567d95646ec4d391fa1014d', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-06 05:22:21', '2024-03-06 05:22:21', '2024-09-06 10:52:21'),
('df8c6f4ae4ae70e118a0ab42a98b5c25ec81c0ef126632d1a523df5d524ffe5dd409ff796f27bf0e', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-06 05:22:56', '2024-03-06 05:22:56', '2024-09-06 10:52:56'),
('455f101ca44559ddee709911b8c23dd7c24c861a27cc9df94a4db9cd07dfe7871d52ba60beb88101', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-06 05:23:53', '2024-03-06 05:23:53', '2024-09-06 10:53:53'),
('d257df8f75f3e5888ad072f9df09ce9246aa5cf59ee93f4182bc7935b3b4e22268302578fbfd354b', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-06 05:26:39', '2024-03-06 05:26:39', '2024-09-06 10:56:39'),
('c5c1a46936a7e9801e77288b2ce46dba2f2a02411f5707f821af0413d6882927e76ea594caba2c67', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-06 05:27:04', '2024-03-06 05:27:04', '2024-09-06 10:57:04'),
('70e9857a84aaaf1bfe1b46cfec5cced664105c6c3ec26d453d0b177e446590680447cc8d5148d646', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-06 05:27:15', '2024-03-06 05:27:15', '2024-09-06 10:57:15'),
('efd3264b05adaaf565fe770eebae68b1c43cd4d036b0ff0c540b582f874d94be02f42774fbfc7653', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-06 08:22:33', '2024-03-06 08:22:33', '2024-09-06 13:52:33'),
('79b8237d3bd1182e285188d7372be9ca550683d581d6bba2b15c527be1023b46c93598ed5f08d4ef', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 00:12:20', '2024-03-07 00:12:20', '2024-09-07 05:42:20'),
('0fe850ff83b76f620185950c9da44a5e295d4f69fed5e784ef7e3ad72e6bed152cd1b57672c73501', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 00:12:32', '2024-03-07 00:12:32', '2024-09-07 05:42:32'),
('48468ca305dc430b3c23a70e7c36d842c13a5391eebcf07135a6c90b225563896ee24391d2e00916', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 00:13:08', '2024-03-07 00:13:08', '2024-09-07 05:43:08'),
('8d4d00c4ffdf60bd8fdde76947ee0b4eaf28985e5cab5e6fac12c3560cec7bbb5976aa3d2d82d142', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 01:07:10', '2024-03-07 01:07:10', '2024-09-07 06:37:10'),
('39adfa2344073da5aca7e7130dff47650331e5712a0114daaec1bcda6bfc26d3d6856052583d404b', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 01:30:39', '2024-03-07 01:30:39', '2024-09-07 07:00:39'),
('20aea7646ce907e53c10f10c76c4b7c44328be4712b91326a79abc3472762ce70f1ababe33a2f965', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 01:32:17', '2024-03-07 01:32:17', '2024-09-07 07:02:17'),
('528ded606a090d6e3195dc183d3912fc984cdfc0f4d306842a595511bb38194dbbf557c077bb2739', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 01:34:13', '2024-03-07 01:34:13', '2024-09-07 07:04:13'),
('9cc107a2dad2624e9286061f422dc301194643d0e79ad8443fefaf4bed0f25f3b55b334b83b80e04', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 01:53:46', '2024-03-07 01:53:46', '2024-09-07 07:23:46'),
('1275dd526ec5244adfb88013eb2a0644ff15b360965b4e46c48a9194d040f7b5c45c067c3530d991', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 01:58:22', '2024-03-07 01:58:22', '2024-09-07 07:28:22'),
('bcab75471233c6c30e4aa765a3ef0f11aace5bbc1dc73f46f6b7c480c89fec210012bf0084255822', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 02:15:23', '2024-03-07 02:15:23', '2024-09-07 07:45:23'),
('cf9eb25e2628c31070c2f66aa89bbe1a0d6beeac488539b5b3d06753446d987707777f98098f864d', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 04:09:00', '2024-03-07 04:09:00', '2024-09-07 09:39:00'),
('b5b30482fc1e35bc21331355385d14c52a741715361ea47e2c6debb03b88068fa5cdff9f5a83518b', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 04:10:26', '2024-03-07 04:10:26', '2024-09-07 09:40:26'),
('a94c8f7bddd4d86deb8fb75d9be2cb2f29d975fb6c66a3ba2573a9bacf83969984b366d5bd31abd4', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 04:12:57', '2024-03-07 04:12:57', '2024-09-07 09:42:57'),
('7808be683de7cae8bfb3557931e798bdc35bf4d540baeaca07fd9187bcb8b41d245fbae74611ba1b', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 04:18:17', '2024-03-07 04:18:17', '2024-09-07 09:48:17'),
('599af3dc815733ba510247baa6d83601225c248b31b500d89ef72fa3a65c7efa4b5032f3aa4e26b8', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 04:23:33', '2024-03-07 04:23:33', '2024-09-07 09:53:33'),
('96fd7b1f1d9b91ea8442774d2ab9f4aa33b8a61dfbeb995a71097d10e8194389fc2d4b8a4af7acd2', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 04:26:54', '2024-03-07 04:26:54', '2024-09-07 09:56:54'),
('ee0d179683d23228a2056f6374ab04c19269f931990d75bd4a094b6da15611b841a1c9660d6aaf73', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 05:53:29', '2024-03-07 05:53:29', '2024-09-07 11:23:29'),
('ea5a5cd289dfd0c0e133615f2af48f230740badec9559bce5932e1346032b4a52b49e73ced0bf90f', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 05:53:45', '2024-03-07 05:53:45', '2024-09-07 11:23:45'),
('e191a3c37da2477f03bb8c23aff56b3b578aebaaa156912d3774ab2a6f836d02bd7b8ec160be4d61', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 06:26:48', '2024-03-07 06:26:48', '2024-09-07 11:56:48'),
('34488e7c7911248e3d9d22b1135eece77cb7d4973673ffe8b45c816845b086b3f81cbecff207f2df', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 06:27:48', '2024-03-07 06:27:48', '2024-09-07 11:57:48'),
('6e86bda2132c8df6b5cea235e380e5ead61be5963a5e59576f0e7317058987bd3fa682f8906d91d2', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 06:41:06', '2024-03-07 06:41:06', '2024-09-07 12:11:06'),
('9c0a0c74eb5a8910424e7084405eb1b44ed24b2be14ba78613a3f982610aaed04c33d88dad5c2066', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 06:41:15', '2024-03-07 06:41:15', '2024-09-07 12:11:15'),
('2c396500516f4e5fd22b73f2f81ae5bcde998ec9c43d87b7a923b1b611535fb65cfc5edbe26e2349', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-07 23:18:09', '2024-03-07 23:18:09', '2024-09-08 04:48:09'),
('0f3898b538552086a0a37d32e600ac3e611f7076225845fc8989274f1bc60eb3ac75f8524ce1a7f1', 7, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:45:42', '2024-03-08 07:45:42', '2024-09-08 13:15:42'),
('533b5cbbabd8efc360dccc3056cfd685895820664f5ef7f16ff7aea6c4407015c426ea05161ba85f', 8, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:51:33', '2024-03-08 07:51:33', '2024-09-08 13:21:33'),
('f3bcb5b93804575c1ed115bb0c3ab886f3393f4628485bdc0134432487bde9a473f98926ab376be1', 9, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:51:46', '2024-03-08 07:51:46', '2024-09-08 13:21:46'),
('11156f7f913c2bb464f2c77bd32c5b2d5a4bf2972a02377909143a8fa081d4e9c54620e87962937a', 10, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:52:03', '2024-03-08 07:52:03', '2024-09-08 13:22:03'),
('32f7b6a2ee0b1716b8a492091896c65e50a843db07f96a93994774084ce66f9c0aedcfaa423467e6', 11, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:53:25', '2024-03-08 07:53:25', '2024-09-08 13:23:25'),
('0ef23de551c02f9445363fe5b01476ada4fb09597a5ebbc90e11ef6b3ed2bdef416cd1b97904c880', 12, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:53:42', '2024-03-08 07:53:42', '2024-09-08 13:23:42'),
('a8c0303b06f6d1cb7d08e248f126af7c67ce3d5236288668c9ceaab96226723783283816cd10750f', 13, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:54:06', '2024-03-08 07:54:06', '2024-09-08 13:24:06'),
('3a52a23a3f72a37c86c73ae22bcfeb3101cf5f14267e9d266e8b3171977d30fd16caaa1167fc2c4f', 14, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:59:13', '2024-03-08 07:59:13', '2024-09-08 13:29:13'),
('83f79831251469d51988dadbae7d0b2c76522b1bcb42b8e45ad966453d617afb1a6ff1f028d24de8', 15, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 07:59:44', '2024-03-08 07:59:44', '2024-09-08 13:29:44'),
('4ab1a46b163e92b544ba707b633ad3058c24a4e8853cfa5548ea8b5c62b9508cf4a6c7b783cb7a02', 16, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:07:26', '2024-03-08 08:07:26', '2024-09-08 13:37:26'),
('18d6fcadeb16356b90438891d3ffc5ac4b9a12738e941fecdf26682fe1345a6bc67b59a9d4dc0385', 17, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:09:53', '2024-03-08 08:09:53', '2024-09-08 13:39:53'),
('5f930b789f7d937785b57338040927eb9b88f23f9ed8f010eaabcb0bf38e1246f92330ce3ce408b5', 18, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:10:50', '2024-03-08 08:10:50', '2024-09-08 13:40:50'),
('521cb5e436394f12ad3f0fe7cb4ae6347267a70c0f0eb2287ca9ddcc4bcab1011a69936b6fad09b4', 19, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:11:17', '2024-03-08 08:11:17', '2024-09-08 13:41:17'),
('f76b92624040c5f4b6dd7439dd5ed0747819001ba80a8253f5b12f2cceaecddf1cf411068f63dc6f', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:16:44', '2024-03-08 08:16:44', '2024-09-08 13:46:44'),
('5cd605b947af84f8604cb9777bcc194877ee498592642c8db6577db225a058eb1a5c091875685082', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:18:34', '2024-03-08 08:18:34', '2024-09-08 13:48:34'),
('a1bb796d12d1b2af526b9668ce4c101b6ecbc578c41c559c154e2c6d865d5fe9be50a81577c7e8c1', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:19:20', '2024-03-08 08:19:20', '2024-09-08 13:49:20'),
('cf74affe6eb541802094a21fcc8a03ad515c1b35ea7f7e56a4ba5c693407c41a02ba89e98722f8d3', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:21:45', '2024-03-08 08:21:45', '2024-09-08 13:51:45'),
('243f0b2936715d7e32130b73afffc2f60494c91e6b8aec9ad4d7a6eb7720308c57fe8e92c4f50d53', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:28:01', '2024-03-08 08:28:01', '2024-09-08 13:58:01'),
('c84dec88388fdab2c103861a38e39fe0fb12efa846943b5d441396247ccc3bdcdd9036727f66693c', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:33:53', '2024-03-08 08:33:53', '2024-09-08 14:03:53'),
('d206755c3698c923ec9e24cd4984dc17d5ccd5f4dbb110f337e4e8e6b76f0161798edc57195e5b8f', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:34:34', '2024-03-08 08:34:34', '2024-09-08 14:04:34'),
('e074ce5837b055681f7addb39840133f316ca949719c4c3826264161ca88e03620eec141ea1170e3', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:34:58', '2024-03-08 08:34:58', '2024-09-08 14:04:58'),
('db7a18dba25d86407b7f9ec9748eb2deea05cc8e1b67fa7e2d8673d2a765422dcc76d16aec53ce34', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:35:32', '2024-03-08 08:35:32', '2024-09-08 14:05:32'),
('a3c36e555fee5f913ff84fb38e39370c7a4565e210d96fdfef7889686f7970a0fb73e5cc59d1fdaf', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:37:51', '2024-03-08 08:37:51', '2024-09-08 14:07:51'),
('959b81ef3a68f19a74cd74fdcbcbb7dd461267b58b23ca5e091464b71de4e025e2c380794517ec47', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:38:15', '2024-03-08 08:38:15', '2024-09-08 14:08:15'),
('709ddace670892339a932e7993c1ab402bf02871d5d50a80c7a53a3b481cac8238cd8e503d2ab355', 20, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:38:42', '2024-03-08 08:38:42', '2024-09-08 14:08:42'),
('fc154ca5ce745b3348036e8d7fbbb03872edbe8e6112d84d2cbb31c11cf883e3afa2abc940d070d6', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:40:32', '2024-03-08 08:40:32', '2024-09-08 14:10:32'),
('709f5e6001e728e20f016a0a724bff92a87a95eb96797ee79db0c405fa499b0ed844ea63d304ae0d', 21, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:42:41', '2024-03-08 08:42:41', '2024-09-08 14:12:41'),
('608c8a06aaead9b3910410e56c99f676b9b822ad3b94b06b9cc2525e9302e2c22d44b9581812f8b5', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-08 08:49:17', '2024-03-08 08:49:17', '2024-09-08 14:19:17'),
('504ad9b34425d47fd5327b3dec4db207e5de313518a9a59bebb30566f2133421705623782cbc7f93', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-10 23:37:24', '2024-03-10 23:37:24', '2024-09-11 05:07:24'),
('89a36e7f967e2557c45e8f4ba305a7ed508cf1cf4333436313a36636e5e48d60eec959a738700fa5', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 00:09:07', '2024-03-11 00:09:07', '2024-09-11 05:39:07'),
('ca4da4b97c9718126a2f266fcbb5c02fff025b026e61b301fd796a265e1416d273ed1dbb3371f239', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 00:16:21', '2024-03-11 00:16:21', '2024-09-11 05:46:21'),
('02965b2aa32e3393fe6ae9097e2b99ed9dff9235db8f42f8942caafe54acb593dc9d3950c8ace183', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 00:18:24', '2024-03-11 00:18:24', '2024-09-11 05:48:24'),
('67e03b79c9a636748c754d019649a7c098b98c78c697fd42f1a52c43bd665c7b92184e43961d436f', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 00:23:33', '2024-03-11 00:23:33', '2024-09-11 05:53:33'),
('cc3d1c0ba6d320e217597fa0c0bfdcbcde22e062ec241e6a713525902a1bc1287287ab557923857d', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 00:39:08', '2024-03-11 00:39:08', '2024-09-11 06:09:08'),
('01ace02892e428fe53552539c1f8da6bfb4aeae4b36a5e4518ade9ccb3b770a8ade9bd073b9d434a', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 00:44:54', '2024-03-11 00:44:54', '2024-09-11 06:14:54'),
('8e57db0548cecce551641d0b932d2580d69a7b216518ff196f0faf9eafdffcce7693e7e76b0f84e3', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 00:46:03', '2024-03-11 00:46:03', '2024-09-11 06:16:03'),
('4321a13b542c8997a69d9f941da525e2908cbb414d317c133efa08c54bb71d494966b07d7a9b3023', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 08:25:42', '2024-03-11 08:25:42', '2024-09-11 13:55:42'),
('c9854afb85535f0a420d093643d4af6cf6c8a4d9a75d325f78420b6a49fd5fda4fcc492883f6ca01', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-11 09:26:08', '2024-03-11 09:26:08', '2024-09-11 14:56:08'),
('000764442f27ce2e64d43c914e1a4c9348ac9c5115ffdabc5b1817c5c2da1a2176a3559920e873b6', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 01:28:44', '2024-03-12 01:28:44', '2024-09-12 06:58:44'),
('af3259765dbf7cd9cc93a0c28ecb4faf1fa384852217a30d3a4939fe4328073c5fa0d651eff8d1f5', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 01:30:06', '2024-03-12 01:30:06', '2024-09-12 07:00:06'),
('2d7c9c755b4bce322f2aba00f23809604b83fac02a4326521d8ded730d8c092c47c8d1d1bfe25030', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 01:40:53', '2024-03-12 01:40:53', '2024-09-12 07:10:53'),
('7adeb7ef63e1b3679647fe572fd329d2f4214b7e74f8d62c50816c428481538834ccc7f529f115b3', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 01:41:21', '2024-03-12 01:41:21', '2024-09-12 07:11:21'),
('313e3f0acd311921a674b67c4992812621169e06b5ee6b872272fafe199213588d301a268e028979', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 01:45:37', '2024-03-12 01:45:37', '2024-09-12 07:15:37'),
('0f8b5a218673c85e6938c87670548acf280863110496e0e885a2d5b9247e71c66df5af4b5f554a91', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 01:46:21', '2024-03-12 01:46:21', '2024-09-12 07:16:21'),
('b1a28053f28feebd14a9971871254de0959f5a671867e1ea9d75ca6bbc3f5b1a811857759365286c', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 01:47:35', '2024-03-12 01:47:35', '2024-09-12 07:17:35'),
('29b61628763387dc1ea6c37fe3ae9567829d5cbd809cfde28afef9b835f153aeb564f88e3363ec63', 22, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 02:20:04', '2024-03-12 02:20:04', '2024-09-12 07:50:04'),
('84ef14e3026ce0efc0d0b553352102d56b1f921369f828ae695ac2c6c9b4a5472d2ab62d77d1468c', 23, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 02:27:47', '2024-03-12 02:27:47', '2024-09-12 07:57:47'),
('01f1965425d9928fedb8097e451b612db43599edbae9c3ac79ce95ac138af502d79d63225b686c4e', 24, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 02:32:15', '2024-03-12 02:32:15', '2024-09-12 08:02:15'),
('6e2d56007240c0238389d30717e09d45657277a1d632208db654fad0e10c6ea1752a4b1498668ade', 25, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 03:39:41', '2024-03-12 03:39:41', '2024-09-12 09:09:41'),
('7feca07b97ba168b1398567b60f7a278e5d3af1dff1988ea94e5be78084c0ead6c798ff02fa2530f', 26, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 03:40:55', '2024-03-12 03:40:55', '2024-09-12 09:10:55'),
('78581c8a3e3cf1a8925a90627a78a498fbd5a4b047ac9584282023e2e3fbc5229f399145fb3c98a8', 27, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 03:41:31', '2024-03-12 03:41:31', '2024-09-12 09:11:31'),
('157033e70c9963c17402e77b9e0c4c47b49aaea3680a916ac532f0c2923659f94dd590c63de3e06f', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 08:22:31', '2024-03-12 08:22:31', '2024-09-12 13:52:31'),
('462e2c6056e08c9249e7eef0904a3e35c6138a3a98e14e3ee166064454b1a5c3161dbac65f61f717', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-12 08:41:37', '2024-03-12 08:41:37', '2024-09-12 14:11:37'),
('c81da1882edcdd173f79a13c53856db304437413f7c0b4b94c8222183c4f5be8a9b4a009e170fdbd', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-13 00:07:29', '2024-03-13 00:07:29', '2024-09-13 05:37:29'),
('8974f21674d2021fbdb1a8913974241115ff57401bef4ef089b344074f3da0062c2e3bece11d3b79', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-13 09:11:02', '2024-03-13 09:11:02', '2024-09-13 14:41:02'),
('7ee608914d993c74c5451766029b00ebf2cc5488d0b91b2c8ddde717a6beea5bdc92fcb7b35c58b4', 4, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-13 09:11:43', '2024-03-13 09:11:43', '2024-09-13 14:41:43'),
('0310dd0be0c114363b14f3854dbecf8e45a32d91c9cf1af66b38e10360c542adba2339605337de57', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-13 09:17:12', '2024-03-13 09:17:12', '2024-09-13 14:47:12'),
('6ebdf2c5c1ef4d7a13452fe5c47be5653d7a32fd77bceb46d49a1e18d0a7fb2864cf4e2ae6a2189e', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-13 09:19:03', '2024-03-13 09:19:03', '2024-09-13 14:49:03'),
('84d605fb1af290f9d66a847bfb89e2562c3fe281ddc51aad985c61b7c2ae84c68dd044d69086c80b', 4, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-13 09:19:23', '2024-03-13 09:19:23', '2024-09-13 14:49:23'),
('bde465881370d1f52828f42a23f3a2524cff39554c5353ace48b866355cf58f5b8017fd969d2636a', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-14 05:25:09', '2024-03-14 05:25:09', '2024-09-14 10:55:09'),
('ff3db2917dd99b30def1c034a607e684583254276b197f7861ab0053e764f0d9a256bf7c2dd66daf', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-14 05:26:28', '2024-03-14 05:26:28', '2024-09-14 10:56:28'),
('70c8529771d3cb00af6d98f0853635337b58cee75806134a5aa725a426102b1d05893f2702a94321', 27, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-18 07:39:13', '2024-03-18 07:39:13', '2024-09-18 13:09:13'),
('ef75816811605f7ae2bc336ed120df64dae801b373f35718ca4ae1683626981185df2f6b6456cab1', 28, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-18 07:39:35', '2024-03-18 07:39:35', '2024-09-18 13:09:35'),
('cccf65bfd817e95f1dd81c176402770996896c89230a8b59d8596216490872d81caa42e4f47107bf', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-03-21 05:25:21', '2024-03-21 05:25:21', '2024-09-21 10:55:21'),
('64b8d838952bad73ef350d8f5b3ba1e6c79dfb52c73acff08b38d4b4a129cf3b58c73f75464ee7d8', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-09 07:34:56', '2024-04-09 07:34:56', '2024-10-09 13:04:56'),
('00c7e129559d6880fe68905a7adbf5b7b5a860601c0ad32ace8dc93043a6c878fd81de47f68034af', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-09 07:43:11', '2024-04-09 07:43:11', '2024-10-09 13:13:11'),
('2975d78e90d2701049fb21cefd6e5ea05e63becdefced99625bc6518302b5d0d82673f90640c6379', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-09 08:31:17', '2024-04-09 08:31:17', '2024-10-09 14:01:17'),
('c5b83d73099338e81d514d9a5d999589c5a5ea9774dee55bec788d60a3006f617f103fdd302ab926', 29, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 01:55:02', '2024-04-10 01:55:02', '2024-10-10 07:25:02'),
('7ffb12bca760ae5493950514dcfb9a75bcc28186636f559f8f414a378e416938d1a5f4766edc79a0', 30, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 01:59:33', '2024-04-10 01:59:33', '2024-10-10 07:29:33'),
('fd9548c2940185fb206d5c153360b5b0501995e54dae4409c27d498d7e1ef607eb233f86b4c51ce1', 4, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 04:58:25', '2024-04-10 04:58:25', '2024-10-10 10:28:25'),
('d66f166729b30b035167484e5271a5422f283ca1a84da92b7362bfd7e30555da35f19de6c9b7f78c', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 04:58:46', '2024-04-10 04:58:46', '2024-10-10 10:28:46'),
('49ec9b23a15a5b51f0cddbc8ca04924bfaa73c5b481b3ba0a040bf0a1f0fc455e83c8168c18586cc', 2, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 04:59:12', '2024-04-10 04:59:12', '2024-10-10 10:29:12'),
('00c50585d8a1ba965975216b1c951fcef61a05ecb0df4f671316730d52d7b77bcf81514f31d854bc', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 05:00:43', '2024-04-10 05:00:43', '2024-10-10 10:30:43'),
('6b5235c54855a513cf821c84ef0f94fa6180c3d92335b5d08423a10e6c1f3f7343ffa811e6a9a9b7', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 05:00:44', '2024-04-10 05:00:44', '2024-10-10 10:30:44'),
('e62e3ed329a297cde2c32ef6ff6ac5f8e9d2145913213ec9f760da26739086082eb3405ef1497fcd', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 05:00:44', '2024-04-10 05:00:44', '2024-10-10 10:30:44'),
('767cc4d8985720d4d552c461bf1fa60669afd17e137f362fdad7fe2f4c0ea603fe4e51e14f88dfbd', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 05:00:44', '2024-04-10 05:00:44', '2024-10-10 10:30:44'),
('ca3c3b3c272b55c3dc4256ad41fecee6ce2a525ed3f6366b9b1b81f89d190851f6321daa9f3cc36b', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 05:00:45', '2024-04-10 05:00:45', '2024-10-10 10:30:45'),
('a95e4ea722214c15d91359630f4b9415c7fa3bde97b290a66956d810d660c348e335a43790bd39ae', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 05:01:30', '2024-04-10 05:01:30', '2024-10-10 10:31:30'),
('c81014172a938ec82635aea70e2bf1c38bd157cefa32a49e21959cc69b1ca505d2d3f1d67a4303c2', 3, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 05:03:07', '2024-04-10 05:03:07', '2024-10-10 10:33:07'),
('ab3f590e14346989e672a364766a85750eff3a0357e804715d90ae445af97baa09ffb14e221b4604', 31, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-10 05:15:21', '2024-04-10 05:15:21', '2024-10-10 10:45:21'),
('d24cd973d4d5bcd288a12e8bb823703f404551d88553e733c67dfe37df96b5f290f397e8e20e8b71', 35, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-11 00:42:15', '2024-04-11 00:42:15', '2024-10-11 06:12:15'),
('cd47a63bebb685a53d75642ebf49c89930183590b60c5a35b270e11d3a69c7d5c99a3581d5c9fa9c', 37, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-11 06:00:32', '2024-04-11 06:00:32', '2024-10-11 11:30:32'),
('09163c929b693557562ea6df54b24c9d47efdd1b203436d83842bc6e3227a8fc93b67931c9e590bb', 37, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-11 06:43:57', '2024-04-11 06:43:57', '2024-10-11 12:13:57'),
('595d0a2ad2663b3d4687e827b3931d8258dac32e4f04db09deb1823a1d730c5e66a445a3ab24cc0b', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-11 07:52:42', '2024-04-11 07:52:42', '2024-10-11 13:22:42'),
('6b3bb945725c8e6e1e836d4492a38a9e16e16a6a65dd0d3479c76027ae90c3b5eacc82a81e514766', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-11 07:53:08', '2024-04-11 07:53:08', '2024-10-11 13:23:08'),
('a3741fac516d2b98c744fed34396a1078be9b9e3965b2ee6142a5e41c0e1282d948ae0f9ca819b57', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-11 07:57:05', '2024-04-11 07:57:05', '2024-10-11 13:27:05'),
('047676d82c696054428b6243f6e783aead16e0cdeaa74a033b0f5314c99a4079986df96e14ea0abc', 37, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-11 07:58:36', '2024-04-11 07:58:36', '2024-10-11 13:28:36'),
('ca36ed2076b9c885f1c3bd7ba882fea16c8300eb4d6fcad5a02ccf08fb3b6d6803978b9737c030db', 38, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 06:08:31', '2024-04-16 06:08:31', '2024-10-16 11:38:31'),
('6adfc9f7d4fe4d5a4139f7c78a766894021a5ef2c159c7ab31f30d20d461e3f54c6c97b12928c8cb', 39, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 06:26:37', '2024-04-16 06:26:37', '2024-10-16 11:56:37'),
('6a382fd1cea34bb0cde73d49b1ebd550de6e143a872891fee6f222d4196c202d45d7b9895dd33275', 40, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 06:40:02', '2024-04-16 06:40:02', '2024-10-16 12:10:02'),
('4046c5fc9a124a9c1d980adfdf9bcd1de7dd9805e34c0d27bebee17b5fe2d0115d12382a7c6c73a1', 41, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 06:55:22', '2024-04-16 06:55:22', '2024-10-16 12:25:22'),
('105ff8226cda450f59cad4dc5b0d25ad3d47468bd73a9a0ff245d00b8b051ff53cd5a4f6aeb76926', 42, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 07:06:52', '2024-04-16 07:06:52', '2024-10-16 12:36:52'),
('58874b1e94f566b2b6e1794a03e4610ae339448c596f3a19c2efc1c5bfffe0df654aefef0282c7b3', 43, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 07:44:13', '2024-04-16 07:44:13', '2024-10-16 13:14:13'),
('f6fa8b1068ea90ea1e79c850481b812e3088ef8632dec2fde7f635fe07afa39d8783385e6c107da0', 44, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 07:56:56', '2024-04-16 07:56:56', '2024-10-16 13:26:56'),
('36b7a999d6d87a03488453233cce3bfac0f23d869937610f647d459c4220d33663e7408455871784', 45, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 08:16:33', '2024-04-16 08:16:33', '2024-10-16 13:46:33'),
('26a2cecc6e8f3cec16762416f2336ad89c7098dbf576f79c6074ee16477088b24caf2cb2a1a5e62d', 46, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-16 23:19:46', '2024-04-16 23:19:46', '2024-10-17 04:49:46'),
('ca116a5946109a4b2d5e3dc440f212397a5f2e929f4b1a9607e91b13a2cc3bcb3570370ad553338f', 53, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-17 06:57:52', '2024-04-17 06:57:52', '2024-10-17 12:27:52'),
('5304c803d574df102d9157f2adb60829ff0944813e6fd857090d396bbde54f8b7d0d84b9003f97ef', 57, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-17 07:47:30', '2024-04-17 07:47:30', '2024-10-17 13:17:30'),
('dcb73f56146aed51ec6945d8cc8d933af8ac51b58889f6d1a6833e3dad6393cd62534467db710e88', 58, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-17 07:48:54', '2024-04-17 07:48:54', '2024-10-17 13:18:54'),
('23667f26715f91eff5d6701fec420d871b3d531b0aaea721eb15ce083bb228fe8cb390fb0d5aad4f', 60, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-17 08:19:22', '2024-04-17 08:19:22', '2024-10-17 13:49:22'),
('f759766607e3dac66f8a9286417a55a6b71f2b7fd4aedaa2293c38321c6e8f558e6d347b80c5cf98', 62, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-17 08:25:43', '2024-04-17 08:25:43', '2024-10-17 13:55:43'),
('47c537de32400f02251f8a2ab4231dd1426948e548435d1ef12fe33d1e2d2cbf2cc9646c889419fc', 63, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-17 08:27:30', '2024-04-17 08:27:30', '2024-10-17 13:57:30'),
('6ea1ed24f0f741cdd768abb84ada059612fa943202d778f72f9b0713f59d04e7d2a7dfa9d2aabb49', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-17 08:31:42', '2024-04-17 08:31:42', '2024-10-17 14:01:42'),
('e17340930d211517ae85ee02a9ca1c206ec23d56ed8d46af12f58c41656d18658a23a72a3850b41b', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-17 08:44:31', '2024-04-17 08:44:31', '2024-10-17 14:14:31'),
('137958766b17a1d2abf14dfbbe29ecd3b3b3dadf9151797c620aa1fdd2f917ba808f29c91b29a6e5', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-23 04:48:47', '2024-04-23 04:48:47', '2024-10-23 10:18:47'),
('5b8d42ec44843b23ac73fc5fdd82444d50c6acfa2defb38848d77b67947411e8af0ffabb0a5b2841', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-23 05:07:31', '2024-04-23 05:07:31', '2024-10-23 10:37:31'),
('757329b81b4cb762956f0fb9718305f60e4877884acb88648a01151a6e90dfe95d714f8e24ecafaa', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-24 06:37:24', '2024-04-24 06:37:24', '2024-10-24 12:07:24'),
('05c09895a7b6da73091c1d2cafe46458f59cb58140224d16277b27bbf550c9ece3b8cd99ae093fc5', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-24 07:45:37', '2024-04-24 07:45:37', '2024-10-24 13:15:37'),
('d0826ee4116737289e9301d993396333d98abbdfd22cb056d500450e8b642570913ca9c33ec2756b', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-25 07:06:04', '2024-04-25 07:06:04', '2024-10-25 12:36:04'),
('58be6fb03a3cd195b2782e19d292ae4f9be058d627dd5227e469ce420980cdeba87969d6dc545b31', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-04-25 07:11:22', '2024-04-25 07:11:22', '2024-10-25 12:41:22'),
('4d02671de524c00932e6198684114b017e8786ad92f698fffda955151336ad14e44d1abe334ed54b', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-05-21 00:05:27', '2024-05-21 00:05:27', '2024-11-21 05:35:27'),
('af22e0cd626aeb35a7fe86fc55f27f4018c448068cc0cc5c8fad12f752bd62902d27cfec069ff49c', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-06-17 04:26:24', '2024-06-17 04:26:24', '2024-12-17 09:56:24'),
('ed9810a4cdddea76925710019505dc9538f819827022e38c1bd85165cc3004f255913baba5d909b7', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-06-17 04:28:58', '2024-06-17 04:28:58', '2024-12-17 09:58:58'),
('8447d449fa53f0936351ca3cb37410f905122dc2adaedc7350d114708a433d0d351da0e81e9c17b1', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-06-17 05:12:57', '2024-06-17 05:12:57', '2024-12-17 10:42:57'),
('a38b50af579e23c7fe4128f3766e891f87f0038e76839e9ac55f1a25ec0514e6cc35b3972fa7d135', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-06-17 05:13:08', '2024-06-17 05:13:08', '2024-12-17 10:43:08'),
('b337f76d10258e8014fbc235fd157b6f70d1f08fad572987e2e8cd0aeff0c507a2b50a98185e9399', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-06-17 05:14:43', '2024-06-17 05:14:43', '2024-12-17 10:44:43'),
('528135f125526da702597a6147e754a94425450e59cef854dffaa2db7e13a455be355c43e21ec679', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-06-17 05:15:58', '2024-06-17 05:15:58', '2024-12-17 10:45:58'),
('e4b01fd43ef26c1ccb325bd53e8880baf80cae35d87dbab545cf7aa01338449389f84e4da5b5bf1d', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-06-17 05:18:24', '2024-06-17 05:18:24', '2024-12-17 10:48:24'),
('f3ae4739321aecac87a53a2a3cbd9763c5d5004d45ed3aa3f16ee4da46653a84e8ed40a1cd1df790', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-06-17 05:18:37', '2024-06-17 05:18:37', '2024-12-17 10:48:37'),
('70e4fba0318750e774c97568bfd8085ec3ac8629a393fc8c274722bc37c45655d4c4aa9e65f4a282', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-04 01:41:49', '2024-07-04 01:41:49', '2025-01-04 07:11:49'),
('653e76193e23c6730d63cf95c183be2aab91c58aaadce6a32979ac607e7f287aa843ed52fdb91219', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-04 04:20:57', '2024-07-04 04:20:57', '2025-01-04 09:50:57'),
('f97d3cf28ca4609c4016887bfabf8f0de6062869a362bca90eca8465a8e2638f2f796dd261c2cdf7', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-05 06:40:38', '2024-07-05 06:40:38', '2025-01-05 12:10:38'),
('529bb99fa5d85c4dac278f58fc2f06f1680a4563ab81366101efb33bf885245e64038dfc92abcd09', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-08 00:17:18', '2024-07-08 00:17:18', '2025-01-08 05:47:18'),
('433c62e5df7895f91f37cbba4b94c973e5b7702eeb33a80e937ec447f1eb173a852a5efa43b3b110', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-08 00:17:23', '2024-07-08 00:17:23', '2025-01-08 05:47:23'),
('8e47d088954a3dd4abfb11cebff9ae30a5dd4b13152b55a9ac28c02751b99114fdb252c785a9f800', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-09 05:10:17', '2024-07-09 05:10:17', '2025-01-09 10:40:17'),
('a2fb4e8aef66962b8742248c57c928113914ed12a39cc61803f23ff181fb01230e5c12b40ac6d2d4', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-09 06:59:20', '2024-07-09 06:59:20', '2025-01-09 12:29:20'),
('fe2535da264702cb081c345bdc0f7cb373154ca753b9890d6991aaaab59805463c77e5a6547e0625', 63, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-09 07:00:10', '2024-07-09 07:00:10', '2025-01-09 12:30:10'),
('f7d78ca250109645d86249e93ecdb16e988938233c6924465051928add6df2dfa51f66dba530f7ef', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 00:45:56', '2024-07-11 00:45:56', '2025-01-11 06:15:56'),
('99e2be48bf2b1254db9c4e946189fe98c221936f1efe653338862028de5eb94be8b7a00fca382011', 66, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 01:02:13', '2024-07-11 01:02:13', '2025-01-11 06:32:13'),
('8a856283c14f8ab319b1dd698ae7422eb7e49169bd8a7a2745608bc32b50a9de620475b84d542ce8', 67, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 01:47:42', '2024-07-11 01:47:42', '2025-01-11 07:17:42'),
('c871628d751c6e6f8d4a738978d4de82521a3558454469fd0e5fc9d9b92959c3f8dc4d86a8fdcc5f', 68, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:01:13', '2024-07-11 02:01:13', '2025-01-11 07:31:13'),
('2c1245b162977f8c9ed14f768d14a9a13f8f22ec8e895a8d34d6511710d0a3c8a24246e625fb12b3', 69, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:04:26', '2024-07-11 02:04:26', '2025-01-11 07:34:26'),
('2466423071d68debf8df7b41ef71808ccb17c68487041ff78e7ad97109ef6d46fc51e47e622bda26', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:49:27', '2024-07-11 02:49:27', '2025-01-11 08:19:27'),
('7d250e3691923227faed32c1e3329087d3e871f53ecdf10d172ece18f1cef267dc95eab73b7df5ad', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:49:42', '2024-07-11 02:49:42', '2025-01-11 08:19:42'),
('514fbba10f2d09c2b07664b8c14b24ea904aeaa2fa7c38359af353e4c4b570508c34d47dac687c49', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:49:46', '2024-07-11 02:49:46', '2025-01-11 08:19:46'),
('180802ecc2b2c162f29a41ec190578acb288ebd50cb8447507327643087ec1d726deb06b9a45b1c0', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:50:44', '2024-07-11 02:50:44', '2025-01-11 08:20:44'),
('a8c40c06631b831960e8d3fe457661c57506cbdf8bd3703163a3c4750fd1c4c92e7484cd42cd5623', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:50:46', '2024-07-11 02:50:46', '2025-01-11 08:20:46'),
('bb615d9a1625c90c6aaf0cfc386d9d565755fa5e9c222906aa38f629ef7bf23fe86ef301f49a52d4', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:50:46', '2024-07-11 02:50:46', '2025-01-11 08:20:46'),
('8664cf1700c5a501816a5e151cd60d3afd7e4ab2985d55b844103f90ab26a449115c138fe05f3b3c', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:50:47', '2024-07-11 02:50:47', '2025-01-11 08:20:47'),
('590e2b52d9fa87211460e60229825140e7664d43fdf20fd3087d77a443f71a3c8e0ffed27c502fda', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:50:47', '2024-07-11 02:50:47', '2025-01-11 08:20:47'),
('ea766b81d851016622d14d09766699232e0756ebbe07cf03c3bf91a44526b50ba2beb97d2e6cce87', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:50:47', '2024-07-11 02:50:47', '2025-01-11 08:20:47'),
('dcb98d85e2d3edbee9df88d1b87d53e9d6b4b990241bdf153b4dd59dbd16ede7efc9ba7fb3a9a946', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:50:47', '2024-07-11 02:50:47', '2025-01-11 08:20:47'),
('d86589c411085a4c5cb7eec4c062eda5ef059a5400f415b0ae24008daedb20cc5e0014500ac9414e', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:50:48', '2024-07-11 02:50:48', '2025-01-11 08:20:48'),
('0828510d116f46186ced5816c09426d5acf143b4abedda786ee7d5b645f3a51dba2d5610dc89acd2', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:27', '2024-07-11 02:54:27', '2025-01-11 08:24:27'),
('2fe88a5070ccd006766fe33f1e14dd1a7a29c248bef30c5aef45ef0e0e018abc3e58c4c79c108a44', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:27', '2024-07-11 02:54:27', '2025-01-11 08:24:27'),
('8f20d02e8cafbdbb7bd069d22a3e72ace7e0e7ee0862d8b5e6518c7400a6caf63081915294037bcd', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:28', '2024-07-11 02:54:28', '2025-01-11 08:24:28'),
('22a031e213c89e117c595bea996761e59cbd400892c58f1928f4a8ee0118825d6ee7ee5503322c85', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:28', '2024-07-11 02:54:28', '2025-01-11 08:24:28'),
('16e7afbfe02bb94529589ca27727cd3bd99e5003a31284096ffa1610b10a3856ff2ed43fc130a88c', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:28', '2024-07-11 02:54:28', '2025-01-11 08:24:28'),
('46cd133854dc5bf2bad7c70d91779ccac964339da03fcb99962dca7a6697d62e08ae7466126a39c6', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:28', '2024-07-11 02:54:28', '2025-01-11 08:24:28'),
('5a4801761c7dc99642d229423867f50e0e794f5f01d9ba65943a8e1ae28a3828280b88139f37d65d', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:28', '2024-07-11 02:54:28', '2025-01-11 08:24:28'),
('332bfe6529535b5c3f1cf1da860c012966c100d1a1d2d3bf9cd58c152695b444621668274aba9c27', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:28', '2024-07-11 02:54:28', '2025-01-11 08:24:28'),
('2a156580198c1087a398d3f59b94a78cb89bcffdf5b728a15afec08e7eec3177da56cd9dda0c125b', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:28', '2024-07-11 02:54:28', '2025-01-11 08:24:28'),
('583d6488a88d6acfdde65def552ad7a5599b4cf463ac0d721d17000e5471ab78df0785db27116d99', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:32', '2024-07-11 02:54:32', '2025-01-11 08:24:32'),
('82865ab9bf0aae1c0adfecf8520c3c44c00a0b4f43919600de5f9f13c5c91be658f0f3480a1958ce', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:33', '2024-07-11 02:54:33', '2025-01-11 08:24:33'),
('a61e41c11ae50bb2eaeae36b6ccd12d0f24285494ab28cfc400ae230352df729b6ffcfed3f5e4580', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:34', '2024-07-11 02:54:34', '2025-01-11 08:24:34'),
('1394b70a531783883bed507e112b46ef67455ea29e2c72b01a76610b270c2e21408b65c1f72d666f', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:54:34', '2024-07-11 02:54:34', '2025-01-11 08:24:34'),
('49588ae48419d6c794a9840b4016fce0e04d0f007c5241b5b88d2248528bef7a7e352314e081af34', 65, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 02:59:37', '2024-07-11 02:59:37', '2025-01-11 08:29:37'),
('2e03283d7757d1f5e10ea5b36ba09316c0380137cbe755b140e62ea490852c65979a09ac2f2d0886', 67, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 03:02:54', '2024-07-11 03:02:54', '2025-01-11 08:32:54'),
('e46dc00b422eea4433c132d8332aa41b3db40bb3ef26b46c7f23a1f5cd1496d808ece8dac57041e3', 67, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 03:02:56', '2024-07-11 03:02:56', '2025-01-11 08:32:56'),
('bbdd89296f2f4a06fedb57b5b40464fada6ab78af81b8241842083d3c9a717eb709854a43c503d86', 70, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 03:59:07', '2024-07-11 03:59:07', '2025-01-11 09:29:07'),
('4c7c98ffa37b8a7198bd54e32b35c74cc2c27300e3690a7f8389782bacbacb7091ab0e9278d650bf', 71, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:37:06', '2024-07-11 04:37:06', '2025-01-11 10:07:06'),
('bea9ce592c1e61c6ae627c1691983d686ae0238053c8d7ff037bf4b342305b11f54d84f05e45b0e2', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:18', '2024-07-11 04:38:18', '2025-01-11 10:08:18'),
('7ac75fdcdac0a3e0fde4e3a57cb4515997f3e47938dec7ff851ff2c068715512dfb63decec94aed4', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:19', '2024-07-11 04:38:19', '2025-01-11 10:08:19'),
('71d5b144faaee9bed094a01296ecd8acf6483d099be80fb016cf5dbe5257acbbdbff470c2aba7fec', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:19', '2024-07-11 04:38:19', '2025-01-11 10:08:19'),
('471a8fa31452d5453421ed1ed772c449f2216c0675722a1e85cce56a4d4a0a0f252c88b09ec19f58', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:20', '2024-07-11 04:38:20', '2025-01-11 10:08:20'),
('fd76bd2a77de59fe69ace46d6ffc74f56dbc0d28876029a2a100fc2f1ed62889ee02ed32d74bf305', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:20', '2024-07-11 04:38:20', '2025-01-11 10:08:20'),
('2ec64e184b2d0aa7c61eba09c2d85add61b1684ed35609d7e03ad8152b12610649dbed117c611d67', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:20', '2024-07-11 04:38:20', '2025-01-11 10:08:20'),
('64a88f60456f0e432369302daa7c39f9ce91be7115c21917e41f8b2e04b36b42a1abdd14f611fcea', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:20', '2024-07-11 04:38:20', '2025-01-11 10:08:20'),
('af50a1d256fcb9b8a25f31f302684a218cba16e29e61490b54b578c6fd6fb3e8fe54b11cef5c29d5', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:20', '2024-07-11 04:38:20', '2025-01-11 10:08:20'),
('34ebab604abc40dbbd1a25c59683f646d71b4cb05218cd707d9e2882bd55714e5cd7007c6efc1933', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:20', '2024-07-11 04:38:20', '2025-01-11 10:08:20'),
('7bfb62b44e35426e1a00e795879fe492422a8d9ecd13fae4a1079fe3977d1aa0e5b0a28ac8caa664', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:20', '2024-07-11 04:38:20', '2025-01-11 10:08:20'),
('ea074509d4af79ecfe9ebab209deb7b2bd21cb4bc0c7abd7a5c0d7383f8cdaa597062829849a0f37', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:38:21', '2024-07-11 04:38:21', '2025-01-11 10:08:21'),
('5934317ae58818a3e2862d7ab82e7576acb8f5233fe9cce745c791747f39fc79512543e2411f38b7', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:39:16', '2024-07-11 04:39:16', '2025-01-11 10:09:16'),
('88860771d287f392d55b9788646e1baa5d3d6e077734cdcb7d744eeeec819e29ccc08308d954e2fc', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 04:53:16', '2024-07-11 04:53:16', '2025-01-11 10:23:16'),
('cdbcd8abc5e8e35346e4d59be19ebae89756971e36ce8865d6817f58901da75f24387bce91adcbd0', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 05:07:25', '2024-07-11 05:07:25', '2025-01-11 10:37:25'),
('266b7d952ef348138c4170f27ad067747e7f6c30be24cf25f8007ac67d6191990b99a7085ad6e418', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 05:07:56', '2024-07-11 05:07:56', '2025-01-11 10:37:56'),
('e520b7a45588578217a161c857158e99752d6e9a89d5f9a4b54dacbafa3ebac77dcbe27a854c8f18', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 05:09:15', '2024-07-11 05:09:15', '2025-01-11 10:39:15'),
('434001e1bf41e394dbb02a781122e0eb5b6d99821725072b6389e3b16064253320fb5a331b9be098', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-11 05:12:31', '2024-07-11 05:12:31', '2025-01-11 10:42:31'),
('29ee1536ea0fa9013343a04be181ec26c946d6330b8a1ebc39a207491942e038c6b477071f1ca356', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-16 05:32:14', '2024-07-16 05:32:14', '2025-01-16 11:02:14'),
('6912811710b21a84f240329f2592ac70c5361420cb68dd7111e9b898463df29cd64ba491d45fc72d', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-07-16 05:35:15', '2024-07-16 05:35:15', '2025-01-16 11:05:15'),
('f222457d51d2a1956efd1ea760bc78118312f17bd23324e50993dc62747192bf55d710d1d4ba4b4d', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-08-24 04:47:46', '2024-08-24 04:47:46', '2025-02-24 10:17:46'),
('a008a4a71547689de5838694eb4d904b7bbf3f9c8621cd0568431f39a04a63ba930805a513580fce', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-08-24 05:20:47', '2024-08-24 05:20:47', '2025-02-24 10:50:47'),
('990ceb0ec76eb4587f008a3f11a694022bd078d353addac32914b6dcf18cddb663262d9a3bc7f1d4', 64, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-08-24 05:30:46', '2024-08-24 05:30:46', '2025-02-24 11:00:46'),
('f32816f481a07f7084f860a234c7cbc4ff1021f9189f9da0b0081772077b0714779971de4a5b245f', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-08-24 05:39:22', '2024-08-24 05:39:22', '2025-02-24 11:09:22'),
('f7bdf0cc726784288d347283d9644865b192f934354ddad4ae34905344eb2d5f3c93c1a8e9233bec', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-08-27 04:30:23', '2024-08-27 04:30:23', '2025-02-27 10:00:23'),
('49624c80116ecbf878b0ea21718c8d2427a49d023fdfe506db9f907cdc095aa87e5065b699ae6e93', 1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', 'Token Name', '[]', 0, '2024-08-27 23:40:10', '2024-08-27 23:40:10', '2025-02-28 05:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9aee8737-5b19-4264-bc3b-cd04d4f4b897', NULL, 'Laravel Personal Access Client', 'kxmFeZtIB0tg1erozOb0RtsT8j9whK0AqOxw6gC8', NULL, 'http://localhost', 1, 0, 0, '2023-12-25 02:53:34', '2023-12-25 02:53:34'),
('9aee8737-648e-42ea-afef-839b99065dd0', NULL, 'Laravel Password Grant Client', '9UVaUyTUNc4pj7uJ1qwvyvvszVBryyIuibkHgmpe', 'users', 'http://localhost', 0, 1, 0, '2023-12-25 02:53:34', '2023-12-25 02:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9aee8737-5b19-4264-bc3b-cd04d4f4b897', '2023-12-25 02:53:34', '2023-12-25 02:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `permission` text NOT NULL,
  `action_permission` text NOT NULL,
  `is_listing` tinyint(4) NOT NULL COMMENT '1-Yes, 2-No',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-Active, 2-Inactive',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-Not Deleted, 1-Deleted',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `permission`, `action_permission`, `is_listing`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'roles~users', 'Create~View~Edit~Delete', 2, 1, 0, '2021-12-12 10:10:10', '2021-12-12 10:10:10'),
(3, 'User', 'roles', 'View', 2, 1, 0, '2023-12-25 05:57:25', '2023-12-25 06:07:25'),
(2, 'Contributor', '', 'Create~View~Edit', 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 'test@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2024-02-12 11:10:18', '2024-02-12 11:10:24'),
(3, 3, 'Normal', 'normaluser@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2023-12-26 04:25:03', '2023-12-26 04:25:03'),
(63, 2, 'Test Contributor', 'testcontributor@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2024-04-17 08:27:30', '2024-04-17 08:27:30'),
(64, 3, 'Test User', 'testuser@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2024-04-17 08:31:42', '2024-04-17 08:31:42'),
(65, 3, 'testuser1', 'testuser1@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2024-07-11 00:45:55', '2024-07-11 00:45:55'),
(66, 3, 'wittyuser2', 'wittyuser2@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2024-07-11 01:02:13', '2024-07-11 01:02:13'),
(67, 3, 'wittyuser3', 'wittyuser3@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2024-07-11 01:47:39', '2024-07-11 01:47:39'),
(68, 2, 'New Contributor User', 'newcontributoruser12154@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2024-07-11 02:01:12', '2024-07-11 02:01:12'),
(69, 2, 'testuser1', 'testuser15@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, '2024-07-11 02:04:25', '2024-07-11 02:04:25'),
(70, 2, 'New Contributor User', 'newcontribu25toruser12154@gmail.com', NULL, '$2y$10$91u.kneW37DWIdFHaz4gce6TkXsz9ZhFeWHs8Y2O.d3qyTeSuvwSS', NULL, '2024-07-11 03:59:07', '2024-07-11 03:59:07'),
(71, 2, 'witty', 'witty@gmail.com', NULL, '$2y$10$F2iiMlmDYojuvGyjhDnYoOiOT3W8kkq5Qt9jC9/tAMDTIoY9BaTnS', NULL, '2024-07-11 04:37:06', '2024-07-11 04:37:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_display_order_index` (`display_order`),
  ADD KEY `status` (`status`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `contributor_meta`
--
ALTER TABLE `contributor_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dataset_meta`
--
ALTER TABLE `dataset_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dataset_meta_a1`
--
ALTER TABLE `dataset_meta_a1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cantributor_id` (`cantributor_id`),
  ADD KEY `contributor_meta_id` (`contributor_meta_id`),
  ADD KEY `category_id` (`dataseta1_category_id`);

--
-- Indexes for table `dataset_meta_a2`
--
ALTER TABLE `dataset_meta_a2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cantributor_id` (`cantributor_id`),
  ADD KEY `dataset_meta_id` (`dataset_meta_id`),
  ADD KEY `dataseta2_category_id` (`dataseta2_category_id`),
  ADD KEY `contributor_meta_id` (`contributor_meta_id`);

--
-- Indexes for table `dataset_meta_a3`
--
ALTER TABLE `dataset_meta_a3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cantributor_id` (`cantributor_id`),
  ADD KEY `dataset_meta_id` (`dataset_meta_id`),
  ADD KEY `dataseta2_category_id` (`dataseta3_category_id`),
  ADD KEY `contributor_meta_id` (`contributor_meta_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_status_is_deleted_is_listing_index` (`status`,`is_deleted`,`is_listing`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `contributor_meta`
--
ALTER TABLE `contributor_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dataset_meta`
--
ALTER TABLE `dataset_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `dataset_meta_a1`
--
ALTER TABLE `dataset_meta_a1`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `dataset_meta_a2`
--
ALTER TABLE `dataset_meta_a2`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `dataset_meta_a3`
--
ALTER TABLE `dataset_meta_a3`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
