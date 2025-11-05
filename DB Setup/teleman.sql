SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teleman`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

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
(25, 'Can add fault', 7, 'add_fault'),
(26, 'Can change fault', 7, 'change_fault'),
(27, 'Can delete fault', 7, 'delete_fault'),
(28, 'Can view fault', 7, 'view_fault'),
(29, 'Can add network component', 8, 'add_networkcomponent'),
(30, 'Can change network component', 8, 'change_networkcomponent'),
(31, 'Can delete network component', 8, 'delete_networkcomponent'),
(32, 'Can view network component', 8, 'view_networkcomponent'),
(33, 'Can add notification', 9, 'add_notification'),
(34, 'Can change notification', 9, 'change_notification'),
(35, 'Can delete notification', 9, 'delete_notification'),
(36, 'Can view notification', 9, 'view_notification'),
(37, 'Can add technician', 10, 'add_technician'),
(38, 'Can change technician', 10, 'change_technician'),
(39, 'Can delete technician', 10, 'delete_technician'),
(40, 'Can view technician', 10, 'view_technician'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add counters', 12, 'add_counters'),
(46, 'Can change counters', 12, 'change_counters'),
(47, 'Can delete counters', 12, 'delete_counters'),
(48, 'Can view counters', 12, 'view_counters'),
(49, 'Can add configuration settings', 13, 'add_configurationsettings'),
(50, 'Can change configuration settings', 13, 'change_configurationsettings'),
(51, 'Can delete configuration settings', 13, 'delete_configurationsettings'),
(52, 'Can view configuration settings', 13, 'view_configurationsettings');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$U5S50t2Rt41m6zyIYRNQz0$IGZqL88VR0DCtEJ33ePpRIOSwMk77ix7skcOXSZAtXk=', '2024-11-26 21:14:18.769757', 1, 'admin', 'Teleman', 'Admin', 'admin@teleman.system', 1, 1, '2024-11-21 09:34:40.000000'),
(2, 'pbkdf2_sha256$870000$2adgxyufaGwRkbn8M0vd1c$GN+Gj9IcbfjrZDd0VCpuhe1aLJ9rgtZWWzqHu56iOyc=', '2024-11-26 21:09:51.127661', 0, 'spyman', 'Spy', 'Man', 'spyman@teleman.system', 0, 1, '2024-11-25 18:09:50.000000'),
(3, 'pbkdf2_sha256$870000$Rp1mmfUYHGsrksmE9QTRPa$n0NDXN5Ge/0oAMa0d8NL0ABkVLEBCJ6bwh0gjABp3Xo=', NULL, 0, 'elonmusk', 'Elon', 'Musk', 'elonmusk@teleman.system', 0, 1, '2024-11-25 18:14:31.000000'),
(4, 'pbkdf2_sha256$870000$MvqQUqekstyJOIhiZcbeyD$NvkOEMqaHlnQxo38aU1yc4qVLwqJ29FUH7zpi1SQwBE=', NULL, 0, 'falcon', 'Falcon', '', 'falcon@teleman.system', 0, 1, '2024-11-25 18:14:42.000000'),
(5, 'pbkdf2_sha256$870000$DnoYikmfYUxbrtoVbO8SCs$BmpTqIRIw6j1k7ZHYQG9wHAqOg9TUQpiWoi8HgsIfMc=', NULL, 0, 'suspect', 'Suspect', '', 'suspect@teleman.system', 0, 1, '2024-11-25 18:16:42.000000'),
(6, 'pbkdf2_sha256$870000$Jir0tfAjnCRcW48MvfXHVB$yKDeq4t6Ds2HBg80SxBBtkAUzxbquaa4l+dUfgDrEdA=', NULL, 0, 'tesla', 'Nikola', 'Tesla', 'nikolatesla@teleman.system', 0, 1, '2024-11-25 18:17:12.000000'),
(7, 'pbkdf2_sha256$870000$LFlV9zWTE2Wy7J1zw5lEZq$oKEitBzjTahvWORr1kojUnw57vJvx7/S2t6O0/CpXz0=', NULL, 0, 'nasir', 'Nasir', 'Jacob', 'nasirjacob@teleman.system', 0, 1, '2024-11-25 18:17:40.000000'),
(8, 'pbkdf2_sha256$870000$60OcNxJUncKtCSLI5ydTP3$aj8enoFkP3OgwO8PB0XBKhU7a+OB/dXeMQ09NaJW13A=', NULL, 0, 'osteen', 'Osteen', 'Ngetich', 'osteenngetich@teleman.system', 0, 1, '2024-11-25 18:18:37.000000'),
(9, 'pbkdf2_sha256$870000$9lbjfC1CafHUFxvx7UdBEU$OsERPX14DCrVL4hhdVajcHcSZljBi0Zq5r7QZt7ZyjM=', NULL, 0, 'mohamed', 'Mohamed', 'Ibrahim', 'mohamedibrahim@teleman.system', 0, 1, '2024-11-25 18:19:01.000000'),
(10, 'pbkdf2_sha256$870000$E3sFOluZdrFUCTptjQnBiv$Y4tjAi7L/Soz9zQCh6on3AKeGXVQu69cFU6npKkvHFM=', NULL, 0, 'idah', 'Idah', 'Amondi', 'idahamondi@teleman.system', 0, 1, '2024-11-25 18:19:27.000000'),
(11, 'pbkdf2_sha256$870000$2UnAm8YzrdoN6kPeoX1eTq$Wfa0ISCcZOvK85oeNZjAy9BqPunA/GufhQELau+8H9o=', NULL, 0, 'faith', 'Faith', 'Nyawira', 'faithnyawira@teleman.system', 0, 1, '2024-11-25 18:19:50.000000'),
(12, 'pbkdf2_sha256$870000$XKqOU5JBZWfKyAWTFVj5Ca$RDWBzaaQrMay0krvq+4188weI2IUOnYXob59h0Epq9E=', NULL, 1, 'manager', 'Teleman', 'Manager', 'manager@teleman.system', 1, 1, '2024-11-25 18:20:52.000000'),
(13, 'pbkdf2_sha256$870000$oHdUPOkbeeXkUwGrZyLQnP$/wR98LpUhchkvyzPJUp+kU/QDpuPkwuNS0Rp0KajfG8=', NULL, 0, 'technician1', 'Technician', 'One', 'technician1@teleman.system', 0, 1, '2024-11-25 18:38:20.000000'),
(14, 'pbkdf2_sha256$870000$EBMklCZYfwfqeLKNLqPvO9$U5Yf9KKwlSKre97E6I1tYi27h6XYCI7Ovyhh/pJUSy4=', NULL, 0, 'technician2', 'Technician', 'Two', 'technician2@teleman.system', 0, 1, '2024-11-25 18:38:56.000000'),
(15, 'pbkdf2_sha256$870000$i3fIOfP3Hf7AFnBhkiakGC$ww+OqXpWCrBtspcrlygXO4DXwzhxYcOi089ZZt68x+U=', NULL, 0, 'technician3', 'Technician', 'Three', 'technician3@teleman.system', 0, 1, '2024-11-25 18:39:47.000000'),
(16, 'pbkdf2_sha256$870000$rcawwMtmeCTBbumicw6xA7$HxBDMCn0OFFs5s/RjsA5e0PdvxPMr6Getq5wiLDugW8=', NULL, 0, 'technician4', 'Technician', 'Four', 'technician4@teleman.system', 0, 1, '2024-11-25 18:40:15.000000'),
(17, 'pbkdf2_sha256$870000$QoDmu7y4qoCgD2vvQXUOLm$f1qRoWhK4k7lzoc3O8ofjs4+AY49NvkIW8NDjZnLjas=', NULL, 0, 'technician5', 'Technician', 'Five', 'technician5@teleman.system', 0, 1, '2024-11-25 18:40:49.000000'),
(18, 'pbkdf2_sha256$870000$xxZ8tKq60ltIHKy20qeF5T$lTdVvIhk6oKg63exM6h8Xz3137DN6S7B3TdrTCJggQM=', NULL, 0, 'technician6', 'Technician', 'Six', 'technician6@teleman.system', 0, 1, '2024-11-25 18:41:13.000000'),
(19, 'pbkdf2_sha256$870000$LfRS6uTo9ErtxhYpyraFkX$YvVcCAdeJ/xluf//XnVlRZ1REcs/Ljw/tEiKLEdgit8=', NULL, 0, 'technician7', 'Technician', 'Seven', 'technician7@teleman.system', 0, 1, '2024-11-25 18:41:40.000000'),
(20, 'pbkdf2_sha256$870000$JbEKKZrudHm6cD25TEZcDP$f4IwANow7YXd7n5m+qk02my5L+AE5IcYI40dgP3eFVo=', NULL, 0, 'technician8', 'Technician', 'Eight', 'technician8@teleman.system', 0, 1, '2024-11-25 18:42:06.000000'),
(21, 'pbkdf2_sha256$870000$hmDvFd9v3I3XhVoo1gfOjV$YSs05HsJSqeco9tpwX1bhiHXxlDE6tITa+lmPwPojDw=', NULL, 0, 'technician9', 'Technician', 'Nine', 'technician9@teleman.system', 0, 1, '2024-11-25 18:42:36.000000'),
(22, 'pbkdf2_sha256$870000$ynKqVDffWBSrfvlGuhUU0P$4pGw/3GvsYvROiuUX9Ch0yJsDdmYTwKtt9HD9d6k0h8=', NULL, 0, 'technician10', 'Technician', 'Ten', 'technician10@teleman.system', 0, 1, '2024-11-25 18:43:02.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-11-25 17:36:29.362624', 'USER-001', 'USER-001', 1, '[{\"added\": {}}]', 11, 1),
(2, '2024-11-25 17:54:12.540054', 'USER-002', 'USER-002', 1, '[{\"added\": {}}]', 11, 1),
(3, '2024-11-25 17:56:17.822495', 'USER-003', 'USER-003', 1, '[{\"added\": {}}]', 11, 1),
(4, '2024-11-25 17:57:15.056513', 'USER-004', 'USER-004', 1, '[{\"added\": {}}]', 11, 1),
(5, '2024-11-25 17:57:55.836579', 'USER-005', 'USER-005', 1, '[{\"added\": {}}]', 11, 1),
(6, '2024-11-25 17:58:44.946709', 'USER-006', 'USER-006', 1, '[{\"added\": {}}]', 11, 1),
(7, '2024-11-25 17:59:36.999966', 'USER-007', 'USER-007', 1, '[{\"added\": {}}]', 11, 1),
(8, '2024-11-25 18:00:13.199991', 'USER-008', 'USER-008', 1, '[{\"added\": {}}]', 11, 1),
(9, '2024-11-25 18:01:09.242604', 'USER-009', 'USER-009', 1, '[{\"added\": {}}]', 11, 1),
(10, '2024-11-25 18:01:46.435671', 'USER-010', 'USER-010', 1, '[{\"added\": {}}]', 11, 1),
(11, '2024-11-25 18:02:47.632903', 'ADMIN-001', 'ADMIN-001', 1, '[{\"added\": {}}]', 11, 1),
(12, '2024-11-25 18:03:40.273877', 'ADMIN-002', 'ADMIN-002', 1, '[{\"added\": {}}]', 11, 1),
(13, '2024-11-25 18:09:54.174901', '2', 'spyman', 1, '[{\"added\": {}}]', 4, 1),
(14, '2024-11-25 18:14:32.093996', '3', 'elonmusk', 1, '[{\"added\": {}}]', 4, 1),
(15, '2024-11-25 18:14:43.873941', '4', 'falcon', 1, '[{\"added\": {}}]', 4, 1),
(16, '2024-11-25 18:15:49.507120', '3', 'elonmusk', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(17, '2024-11-25 18:16:10.674035', '2', 'spyman', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(18, '2024-11-25 18:16:30.164423', '4', 'falcon', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Email address\"]}}]', 4, 1),
(19, '2024-11-25 18:16:44.336998', '5', 'suspect', 1, '[{\"added\": {}}]', 4, 1),
(20, '2024-11-25 18:16:57.423052', '5', 'suspect', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Email address\"]}}]', 4, 1),
(21, '2024-11-25 18:17:14.112556', '6', 'tesla', 1, '[{\"added\": {}}]', 4, 1),
(22, '2024-11-25 18:17:30.097056', '6', 'tesla', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(23, '2024-11-25 18:17:43.137402', '7', 'nasir', 1, '[{\"added\": {}}]', 4, 1),
(24, '2024-11-25 18:18:27.723450', '7', 'nasir', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(25, '2024-11-25 18:18:39.424486', '8', 'osteen', 1, '[{\"added\": {}}]', 4, 1),
(26, '2024-11-25 18:18:53.845809', '8', 'osteen', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(27, '2024-11-25 18:19:04.598861', '9', 'mohamed', 1, '[{\"added\": {}}]', 4, 1),
(28, '2024-11-25 18:19:14.971707', '9', 'mohamed', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(29, '2024-11-25 18:19:29.672256', '10', 'idah', 1, '[{\"added\": {}}]', 4, 1),
(30, '2024-11-25 18:19:43.302380', '10', 'idah', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(31, '2024-11-25 18:19:52.719049', '11', 'faith', 1, '[{\"added\": {}}]', 4, 1),
(32, '2024-11-25 18:20:05.752652', '11', 'faith', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(33, '2024-11-25 18:20:55.001093', '12', 'manager', 1, '[{\"added\": {}}]', 4, 1),
(34, '2024-11-25 18:21:04.873196', '12', 'manager', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(35, '2024-11-25 18:21:43.828041', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(36, '2024-11-25 18:21:55.468878', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(37, '2024-11-25 18:28:49.132249', 'TECH-001', 'TECH-001', 1, '[{\"added\": {}}]', 10, 1),
(38, '2024-11-25 18:29:47.253078', 'TECH-002', 'TECH-002', 1, '[{\"added\": {}}]', 10, 1),
(39, '2024-11-25 18:30:47.828106', 'TECH-003', 'TECH-003', 1, '[{\"added\": {}}]', 10, 1),
(40, '2024-11-25 18:31:04.388608', 'TECH-002', 'TECH-002', 2, '[{\"changed\": {\"fields\": [\"Skillset\"]}}]', 10, 1),
(41, '2024-11-25 18:32:06.220665', 'TECH-004', 'TECH-004', 1, '[{\"added\": {}}]', 10, 1),
(42, '2024-11-25 18:33:01.644336', 'TECH-005', 'TECH-005', 1, '[{\"added\": {}}]', 10, 1),
(43, '2024-11-25 18:34:00.886617', 'TECH-006', 'TECH-006', 1, '[{\"added\": {}}]', 10, 1),
(44, '2024-11-25 18:35:00.081209', 'TECH-007', 'TECH-007', 1, '[{\"added\": {}}]', 10, 1),
(45, '2024-11-25 18:35:45.741248', 'TECH-008', 'TECH-008', 1, '[{\"added\": {}}]', 10, 1),
(46, '2024-11-25 18:37:04.161540', 'TECH-009', 'TECH-009', 1, '[{\"added\": {}}]', 10, 1),
(47, '2024-11-25 18:37:48.243268', 'TECH-010', 'TECH-010', 1, '[{\"added\": {}}]', 10, 1),
(48, '2024-11-25 18:38:21.935212', '13', 'technician1', 1, '[{\"added\": {}}]', 4, 1),
(49, '2024-11-25 18:38:45.697627', '13', 'technician1', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(50, '2024-11-25 18:38:58.265501', '14', 'technician2', 1, '[{\"added\": {}}]', 4, 1),
(51, '2024-11-25 18:39:27.317734', '14', 'technician2', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(52, '2024-11-25 18:39:49.644230', '15', 'technician3', 1, '[{\"added\": {}}]', 4, 1),
(53, '2024-11-25 18:40:03.428130', '15', 'technician3', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(54, '2024-11-25 18:40:17.185265', '16', 'v', 1, '[{\"added\": {}}]', 4, 1),
(55, '2024-11-25 18:40:32.867766', '16', 'technician4', 2, '[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(56, '2024-11-25 18:40:51.158310', '17', 'technician5', 1, '[{\"added\": {}}]', 4, 1),
(57, '2024-11-25 18:40:59.971153', '17', 'technician5', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(58, '2024-11-25 18:41:16.752027', '18', 'technician6', 1, '[{\"added\": {}}]', 4, 1),
(59, '2024-11-25 18:41:29.531938', '18', 'technician6', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(60, '2024-11-25 18:41:42.096724', '19', 'technician7', 1, '[{\"added\": {}}]', 4, 1),
(61, '2024-11-25 18:41:54.767722', '19', 'technician7', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(62, '2024-11-25 18:42:08.463773', '20', 'technician8', 1, '[{\"added\": {}}]', 4, 1),
(63, '2024-11-25 18:42:26.823563', '20', 'technician8', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(64, '2024-11-25 18:42:39.018350', '21', 'technician9', 1, '[{\"added\": {}}]', 4, 1),
(65, '2024-11-25 18:42:53.526469', '21', 'technician9', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(66, '2024-11-25 18:43:04.395012', '22', 'technician10', 1, '[{\"added\": {}}]', 4, 1),
(67, '2024-11-25 18:43:17.556675', '22', 'technician10', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(68, '2024-11-25 18:45:13.165791', '12', 'manager', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(69, '2024-11-26 17:49:55.730034', 'Computer-HP', 'Computer-HP', 1, '[{\"added\": {}}]', 13, 1),
(70, '2024-11-26 17:50:07.812344', 'Computer-Apple', 'Computer-Apple', 1, '[{\"added\": {}}]', 13, 1),
(71, '2024-11-26 17:50:16.843666', 'Computer-ASUS', 'Computer-ASUS', 1, '[{\"added\": {}}]', 13, 1),
(72, '2024-11-26 17:50:25.381799', 'Computer-Lenovo', 'Computer-Lenovo', 1, '[{\"added\": {}}]', 13, 1),
(73, '2024-11-26 17:50:35.721801', 'Computer-Dell', 'Computer-Dell', 1, '[{\"added\": {}}]', 13, 1),
(74, '2024-11-26 17:51:10.774299', 'Router-Tenda', 'Router-Tenda', 1, '[{\"added\": {}}]', 13, 1),
(75, '2024-11-26 17:51:24.475644', 'Router-Huawei', 'Router-Huawei', 1, '[{\"added\": {}}]', 13, 1),
(76, '2024-11-26 17:51:40.266337', 'Router-TP-Link', 'Router-TP-Link', 1, '[{\"added\": {}}]', 13, 1),
(77, '2024-11-26 17:51:50.650343', 'Router-Netgear', 'Router-Netgear', 1, '[{\"added\": {}}]', 13, 1),
(78, '2024-11-26 17:52:02.606436', 'Repeater-Tenda', 'Repeater-Tenda', 1, '[{\"added\": {}}]', 13, 1),
(79, '2024-11-26 17:52:29.455525', 'Repeater-Tenda', 'Repeater-Tenda', 3, '', 13, 1),
(80, '2024-11-26 17:52:43.973899', 'Repeater-Motorola', 'Repeater-Motorola', 1, '[{\"added\": {}}]', 13, 1),
(81, '2024-11-26 17:52:53.705682', 'Repeater-KenWood', 'Repeater-KenWood', 1, '[{\"added\": {}}]', 13, 1),
(82, '2024-11-26 17:53:05.095041', 'Repeater-BridgeCom', 'Repeater-BridgeCom', 1, '[{\"added\": {}}]', 13, 1),
(83, '2024-11-26 17:53:14.115624', 'Repeater-Yaesu', 'Repeater-Yaesu', 1, '[{\"added\": {}}]', 13, 1),
(84, '2024-11-26 17:53:31.275372', 'Repeater-ICOM', 'Repeater-ICOM', 1, '[{\"added\": {}}]', 13, 1),
(85, '2024-11-26 17:53:51.806403', 'Cable-Belden', 'Cable-Belden', 1, '[{\"added\": {}}]', 13, 1),
(86, '2024-11-26 17:54:10.441772', 'Cable-CommScope', 'Cable-CommScope', 1, '[{\"added\": {}}]', 13, 1),
(87, '2024-11-26 17:54:22.262577', 'Cable-Nexans', 'Cable-Nexans', 1, '[{\"added\": {}}]', 13, 1),
(88, '2024-11-26 17:54:42.268104', 'Cable-Prysmian', 'Cable-Prysmian', 1, '[{\"added\": {}}]', 13, 1),
(89, '2024-11-26 17:55:23.880567', 'Switch-Cisco', 'Switch-Cisco', 1, '[{\"added\": {}}]', 13, 1),
(90, '2024-11-26 17:55:33.512355', 'Switch-TP-Link', 'Switch-TP-Link', 1, '[{\"added\": {}}]', 13, 1),
(91, '2024-11-26 17:55:51.841429', 'Switch-Juniper', 'Switch-Juniper', 1, '[{\"added\": {}}]', 13, 1),
(92, '2024-11-26 17:56:39.617068', 'NET-0005', 'NET-0005', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(93, '2024-11-26 17:56:50.116174', 'NET-0004', 'NET-0004', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(94, '2024-11-26 17:56:57.790861', 'NET-0003', 'NET-0003', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(95, '2024-11-26 17:57:06.132091', 'NET-0002', 'NET-0002', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(96, '2024-11-26 17:57:14.123226', 'NET-0001', 'NET-0001', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(97, '2024-11-26 17:58:40.156336', 'DEVICE-0055', 'DEVICE-0055', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(98, '2024-11-26 17:58:49.023735', 'DEVICE-0054', 'DEVICE-0054', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(99, '2024-11-26 17:58:56.759977', 'DEVICE-0053', 'DEVICE-0053', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(100, '2024-11-26 17:59:02.794288', 'DEVICE-0052', 'DEVICE-0052', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(101, '2024-11-26 17:59:13.043546', 'DEVICE-0051', 'DEVICE-0051', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(102, '2024-11-26 17:59:20.206586', 'DEVICE-0050', 'DEVICE-0050', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(103, '2024-11-26 17:59:26.897613', 'DEVICE-0049', 'DEVICE-0049', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(104, '2024-11-26 17:59:34.462309', 'DEVICE-0048', 'DEVICE-0048', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(105, '2024-11-26 17:59:43.055829', 'DEVICE-0047', 'DEVICE-0047', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(106, '2024-11-26 17:59:59.278887', 'DEVICE-0046', 'DEVICE-0046', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(107, '2024-11-26 18:00:11.872457', 'DEVICE-0045', 'DEVICE-0045', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(108, '2024-11-26 18:00:17.545868', 'DEVICE-0044', 'DEVICE-0044', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(109, '2024-11-26 18:00:21.323436', 'DEVICE-0044', 'DEVICE-0044', 2, '[]', 8, 1),
(110, '2024-11-26 18:00:28.599121', 'DEVICE-0043', 'DEVICE-0043', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(111, '2024-11-26 18:00:40.900345', 'DEVICE-0042', 'DEVICE-0042', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(112, '2024-11-26 18:00:49.569617', 'DEVICE-0041', 'DEVICE-0041', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(113, '2024-11-26 18:00:58.294081', 'DEVICE-0040', 'DEVICE-0040', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(114, '2024-11-26 18:01:12.059014', 'DEVICE-0039', 'DEVICE-0039', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(115, '2024-11-26 18:01:36.317734', 'DEVICE-0038', 'DEVICE-0038', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(116, '2024-11-26 18:01:48.639476', 'DEVICE-0037', 'DEVICE-0037', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(117, '2024-11-26 18:01:56.435222', 'DEVICE-0036', 'DEVICE-0036', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(118, '2024-11-26 18:02:03.699144', 'DEVICE-0035', 'DEVICE-0035', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(119, '2024-11-26 18:02:11.400436', 'DEVICE-0034', 'DEVICE-0034', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(120, '2024-11-26 18:02:21.915441', 'DEVICE-0033', 'DEVICE-0033', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(121, '2024-11-26 18:02:29.110210', 'DEVICE-0032', 'DEVICE-0032', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(122, '2024-11-26 18:02:34.483914', 'DEVICE-0031', 'DEVICE-0031', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(123, '2024-11-26 18:02:43.300062', 'DEVICE-0030', 'DEVICE-0030', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(124, '2024-11-26 18:02:49.771713', 'DEVICE-0029', 'DEVICE-0029', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(125, '2024-11-26 18:02:56.916627', 'DEVICE-0028', 'DEVICE-0028', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(126, '2024-11-26 18:03:09.052269', 'DEVICE-0027', 'DEVICE-0027', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(127, '2024-11-26 18:03:19.577131', 'DEVICE-0026', 'DEVICE-0026', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(128, '2024-11-26 18:03:26.608915', 'DEVICE-0025', 'DEVICE-0025', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(129, '2024-11-26 18:03:37.087816', 'DEVICE-0024', 'DEVICE-0024', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(130, '2024-11-26 18:03:43.909504', 'DEVICE-0023', 'DEVICE-0023', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(131, '2024-11-26 18:03:51.212646', 'DEVICE-0022', 'DEVICE-0022', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(132, '2024-11-26 18:03:57.142061', 'DEVICE-0021', 'DEVICE-0021', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(133, '2024-11-26 18:04:12.943325', 'DEVICE-0020', 'DEVICE-0020', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(134, '2024-11-26 18:04:22.746042', 'DEVICE-0019', 'DEVICE-0019', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(135, '2024-11-26 18:04:30.730550', 'DEVICE-0018', 'DEVICE-0018', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(136, '2024-11-26 18:04:41.777701', 'DEVICE-0017', 'DEVICE-0017', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(137, '2024-11-26 18:04:47.759446', 'DEVICE-0016', 'DEVICE-0016', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(138, '2024-11-26 18:04:58.910806', 'DEVICE-0015', 'DEVICE-0015', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(139, '2024-11-26 18:05:08.411069', 'DEVICE-0014', 'DEVICE-0014', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(140, '2024-11-26 18:05:18.314580', 'DEVICE-0013', 'DEVICE-0013', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(141, '2024-11-26 18:05:28.611285', 'DEVICE-0012', 'DEVICE-0012', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(142, '2024-11-26 18:05:40.277593', 'DEVICE-0011', 'DEVICE-0011', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(143, '2024-11-26 18:05:48.387769', 'DEVICE-0010', 'DEVICE-0010', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(144, '2024-11-26 18:05:58.465288', 'DEVICE-0009', 'DEVICE-0009', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(145, '2024-11-26 18:06:07.940086', 'DEVICE-0008', 'DEVICE-0008', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(146, '2024-11-26 18:06:16.561961', 'DEVICE-0007', 'DEVICE-0007', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1),
(147, '2024-11-26 18:06:24.442774', 'DEVICE-0006', 'DEVICE-0006', 2, '[{\"changed\": {\"fields\": [\"Configuration id\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'main', 'fault'),
(8, 'main', 'networkcomponent'),
(9, 'main', 'notification'),
(10, 'main', 'technician'),
(11, 'main', 'user'),
(12, 'main', 'counters'),
(13, 'main', 'configurationsettings');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-18 16:03:00.235260'),
(2, 'auth', '0001_initial', '2024-11-18 16:03:00.954199'),
(3, 'admin', '0001_initial', '2024-11-18 16:03:01.115189'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-18 16:03:01.121179'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-18 16:03:01.135181'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-18 16:03:01.256179'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-18 16:03:01.307181'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-18 16:03:01.371186'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-18 16:03:01.390183'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-18 16:03:01.441181'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-18 16:03:01.442183'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-18 16:03:01.456181'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-18 16:03:01.512228'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-18 16:03:01.575181'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-18 16:03:01.623183'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-18 16:03:01.637183'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-18 16:03:01.690195'),
(18, 'sessions', '0001_initial', '2024-11-18 16:03:01.750222'),
(19, 'main', '0001_initial', '2024-11-24 13:33:53.851934'),
(20, 'main', '0002_counters_and_more', '2024-11-24 13:35:57.368607'),
(21, 'main', '0003_user_permissions', '2024-11-25 08:18:46.265270'),
(22, 'main', '0004_remove_technician_role', '2024-11-25 18:27:46.554838'),
(23, 'main', '0005_remove_configurationsettings_component_id_and_more', '2024-11-26 16:52:41.748705'),
(24, 'main', '0006_notification_type', '2024-11-27 09:44:20.578354');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('nrb0lvv4mbd1tgwm16u3mcwvt72zjkj5', '.eJxVjEEOgjAQRe_StWk6MNLWpXvOQKYzU0FNSSisjHdXEha6_e-9_zIDbes4bFWXYRJzMWBOv1sifmjZgdyp3GbLc1mXKdldsQettp9Fn9fD_TsYqY7fOicHKJxJQwNB2aF0HaPPmij7VhwjgEfAJkB7zpE6jB4lK3uOQdC8P_x6ODs:1tG2t0:G_05EnKVRujdP1DfTkgRJhf3-N624YLw3W9Iq76BT58', '2024-12-10 21:14:18.771610');

-- --------------------------------------------------------

--
-- Table structure for table `main_configurationsettings`
--

DROP TABLE IF EXISTS `main_configurationsettings`;
CREATE TABLE IF NOT EXISTS `main_configurationsettings` (
  `configuration_id` varchar(25) NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`details`)),
  PRIMARY KEY (`configuration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_configurationsettings`
--

INSERT INTO `main_configurationsettings` (`configuration_id`, `details`) VALUES
('Computer-HP', '{\"brand\": \"HP\", \"processor\": \"Intel Core i7\", \"RAM\": \"16GB\", \"storage\": \"512GB SSD\", \"graphics\": \"NVIDIA GeForce GTX 1650\", \"OS\": \"Windows 10 Pro\", \"warranty\": \"3 years\"}'),
('Computer-Apple', '{\"brand\": \"Apple\", \"processor\": \"Apple M1\", \"RAM\": \"8GB\", \"storage\": \"256GB SSD\", \"graphics\": \"Integrated Apple GPU\", \"OS\": \"macOS Big Sur\", \"warranty\": \"1 year\"}'),
('Computer-ASUS', '{\"brand\": \"ASUS\", \"processor\": \"AMD Ryzen 7\", \"RAM\": \"16GB\", \"storage\": \"1TB SSD\", \"graphics\": \"NVIDIA GeForce RTX 3060\", \"OS\": \"Windows 11\", \"warranty\": \"2 years\"}'),
('Computer-Lenovo', '{\"brand\": \"Lenovo\", \"processor\": \"Intel Core i5\", \"RAM\": \"8GB\", \"storage\": \"256GB SSD\", \"graphics\": \"Intel Integrated Graphics\", \"OS\": \"Windows 10 Home\", \"warranty\": \"1 year\"}'),
('Computer-Dell', '{\"brand\": \"Dell\", \"processor\": \"Intel Core i9\", \"RAM\": \"32GB\", \"storage\": \"1TB SSD\", \"graphics\": \"NVIDIA GeForce RTX 3080\", \"OS\": \"Windows 11 Pro\", \"warranty\": \"3 years\"}'),
('Router-Tenda', '{\"brand\": \"Tenda\", \"model\": \"AC10\", \"speed\": \"1200Mbps\", \"frequency\": \"Dual-band 2.4GHz/5GHz\", \"ports\": \"4 LAN, 1 WAN\", \"features\": \"MU-MIMO, Beamforming\"}'),
('Router-Huawei', '{\"brand\": \"Huawei\", \"model\": \"AX3 Pro\", \"speed\": \"3000Mbps\", \"frequency\": \"Dual-band 2.4GHz/5GHz\", \"ports\": \"4 LAN, 1 WAN\", \"features\": \"Wi-Fi 6, OFDMA\"}'),
('Router-TP-Link', '{\"brand\": \"TP-Link\", \"model\": \"Archer AX50\", \"speed\": \"3000Mbps\", \"frequency\": \"Dual-band 2.4GHz/5GHz\", \"ports\": \"4 LAN, 1 WAN\", \"features\": \"Wi-Fi 6, MU-MIMO\"}'),
('Router-Netgear', '{\"brand\": \"Netgear\", \"model\": \"Nighthawk R7000\", \"speed\": \"1900Mbps\", \"frequency\": \"Dual-band 2.4GHz/5GHz\", \"ports\": \"4 LAN, 1 WAN\", \"features\": \"Beamforming+, Dynamic QoS\"}'),
('Repeater-Motorola', '{\"brand\": \"Motorola\", \"model\": \"DR3000\", \"frequencyRange\": \"UHF/VHF\", \"powerOutput\": \"25-40W\", \"channels\": \"16\", \"connectivity\": \"Ethernet, USB\", \"features\": \"IP Site Connect, Capacity Plus\"}'),
('Repeater-KenWood', '{\"brand\": \"KenWood\", \"model\": \"TKR-D710\", \"frequencyRange\": \"UHF/VHF\", \"powerOutput\": \"50W\", \"channels\": \"30\", \"connectivity\": \"Ethernet, USB\", \"features\": \"NXDN, DMR\"}'),
('Repeater-BridgeCom', '{\"brand\": \"BridgeCom\", \"model\": \"BCR-50V\", \"frequencyRange\": \"VHF\", \"powerOutput\": \"50W\", \"channels\": \"16\", \"connectivity\": \"Ethernet, USB\", \"features\": \"Analog/Digital\"}'),
('Repeater-Yaesu', '{\"brand\": \"Yaesu\", \"model\": \"DR-2X\", \"frequencyRange\": \"VHF/UHF\", \"powerOutput\": \"50W\", \"channels\": \"16\", \"connectivity\": \"Ethernet, USB\", \"features\": \"AMS, Wires-X\"}'),
('Repeater-ICOM', '{\"brand\": \"ICOM\", \"model\": \"IC-FR5200H\", \"frequencyRange\": \"UHF\", \"powerOutput\": \"50W\", \"channels\": \"32\", \"connectivity\": \"Ethernet, USB\", \"features\": \"IDAS, DMR\"}'),
('Cable-Belden', '{\"brand\": \"Belden\", \"model\": \"1694A\", \"type\": \"Coaxial\", \"length\": \"1000 ft\", \"impedance\": \"75 ohms\", \"jacketMaterial\": \"PVC\", \"frequencyRange\": \"Up to 3GHz\"}'),
('Cable-CommScope', '{\"brand\": \"CommScope\", \"model\": \"2227V\", \"type\": \"Twisted Pair\", \"length\": \"1000 ft\", \"impedance\": \"100 ohms\", \"jacketMaterial\": \"LSZH\", \"frequencyRange\": \"Up to 500MHz\"}'),
('Cable-Nexans', '{\"brand\": \"Nexans\", \"model\": \"LANmark-6\", \"type\": \"Cat6\", \"length\": \"1000 ft\", \"impedance\": \"100 ohms\", \"jacketMaterial\": \"PVC\", \"frequencyRange\": \"Up to 250MHz\"}'),
('Cable-Prysmian', '{\"brand\": \"Prysmian\", \"model\": \"Afumex\", \"type\": \"Fiber Optic\", \"length\": \"1000 ft\", \"coreType\": \"Single-mode\", \"jacketMaterial\": \"LSZH\", \"frequencyRange\": \"Up to 10GHz\"}'),
('Switch-Cisco', '{\"brand\": \"Cisco\", \"model\": \"Catalyst 9300\", \"ports\": \"24\", \"speed\": \"1Gbps/10Gbps\", \"management\": \"Managed\", \"features\": \"Stackable, Layer 3\", \"powerSupply\": \"Redundant\"}'),
('Switch-TP-Link', '{\"brand\": \"TP-Link\", \"model\": \"TL-SG1024\", \"ports\": \"24\", \"speed\": \"1Gbps\", \"management\": \"Unmanaged\", \"features\": \"Rackmountable, Plug and Play\", \"powerSupply\": \"Internal\"}'),
('Switch-Juniper', '{\"brand\": \"Juniper\", \"model\": \"EX2300\", \"ports\": \"24\", \"speed\": \"1Gbps\", \"management\": \"Managed\", \"features\": \"Layer 3, Virtual Chassis\", \"powerSupply\": \"Internal\"}');

-- --------------------------------------------------------

--
-- Table structure for table `main_counters`
--

DROP TABLE IF EXISTS `main_counters`;
CREATE TABLE IF NOT EXISTS `main_counters` (
  `Pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `value` int(11) NOT NULL,
  `last_updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_counters`
--

INSERT INTO `main_counters` (`Pid`, `name`, `value`, `last_updated`) VALUES
(1, 'users', 0, NULL),
(2, 'technicians', 0, NULL),
(3, 'faults', 0, NULL),
(4, 'network_components', 55, 1732630667),
(5, 'notifications', 0, NULL),
(6, 'configuration_settings', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `main_fault`
--

DROP TABLE IF EXISTS `main_fault`;
CREATE TABLE IF NOT EXISTS `main_fault` (
  `fault_id` varchar(25) NOT NULL,
  `date_reported` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `priority_level` varchar(10) NOT NULL,
  `resolution_start_time` int(11) DEFAULT NULL,
  `resolution_end_time` int(11) DEFAULT NULL,
  `affected_component_id_id` varchar(25) NOT NULL,
  `assigned_technician_id_id` varchar(25) NOT NULL,
  PRIMARY KEY (`fault_id`),
  KEY `main_fault_affected_component_id_id_d0448ebd` (`affected_component_id_id`),
  KEY `main_fault_assigned_technician_id_id_91572727` (`assigned_technician_id_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `main_networkcomponent`
--

DROP TABLE IF EXISTS `main_networkcomponent`;
CREATE TABLE IF NOT EXISTS `main_networkcomponent` (
  `component_id` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `affects_uptime` tinyint(1) NOT NULL,
  `location` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` int(11) NOT NULL,
  `configuration_id_id` varchar(25) NOT NULL,
  PRIMARY KEY (`component_id`),
  KEY `main_networkcomponent_configuration_id_id_cd439f50` (`configuration_id_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_networkcomponent`
--

INSERT INTO `main_networkcomponent` (`component_id`, `type`, `manufacturer`, `affects_uptime`, `location`, `status`, `date_added`, `configuration_id_id`) VALUES
('NET-0001', 'router', 'Huawei', 1, 'nakuru', 1, 1732457881, 'Router-Huawei'),
('NET-0002', 'router', 'Tenda', 1, 'nairobi', 1, 1732460346, 'Router-Tenda'),
('NET-0003', 'cable', 'Belden', 1, 'mombasa', 1, 1732460367, 'Cable-Belden'),
('NET-0004', 'switch', 'Cisco', 1, 'nairobi', 1, 1732460711, 'Switch-Cisco'),
('NET-0005', 'computer', 'HP', 1, 'nairobi', 1, 1732460889, 'Computer-HP'),
('DEVICE-0006', 'repeater', 'Motorola', 0, 'nairobi', 1, 1732560839, 'Repeater-Motorola'),
('DEVICE-0007', 'repeater', 'KenWood', 0, 'juja', 1, 1732560862, 'Repeater-KenWood'),
('DEVICE-0008', 'repeater', 'BridgeCom', 0, 'thika', 1, 1732560962, 'Repeater-BridgeCom'),
('DEVICE-0009', 'repeater', 'Yaesu', 0, 'nakuru', 1, 1732561007, 'Repeater-Yaesu'),
('DEVICE-0010', 'repeater', 'ICOM', 0, 'mombasa', 1, 1732561031, 'Repeater-ICOM'),
('DEVICE-0011', 'computer', 'Apple', 1, 'mombasa', 1, 1732561200, 'Computer-Apple'),
('DEVICE-0012', 'computer', 'Dell', 1, 'juja', 1, 1732561218, 'Computer-Dell'),
('DEVICE-0013', 'computer', 'HP', 1, 'nakuru', 1, 1732561245, 'Computer-HP'),
('DEVICE-0014', 'computer', 'Lenovo', 1, 'thika', 1, 1732561308, 'Computer-Lenovo'),
('DEVICE-0015', 'computer', 'Asus', 1, 'mombasa', 1, 1732561326, 'Computer-ASUS'),
('DEVICE-0016', 'switch', 'Cisco', 1, 'nairobi', 1, 1732629408, 'Switch-Cisco'),
('DEVICE-0017', 'switch', 'Cisco', 1, 'thika', 1, 1732629426, 'Switch-Cisco'),
('DEVICE-0018', 'switch', 'TP-Link', 1, 'juja', 1, 1732629441, 'Switch-TP-Link'),
('DEVICE-0019', 'switch', 'TP-Link', 1, 'nakuru', 1, 1732629450, 'Switch-TP-Link'),
('DEVICE-0020', 'switch', 'Juniper', 1, 'mombasa', 1, 1732629464, 'Switch-Juniper'),
('DEVICE-0021', 'cable', 'Belden', 1, 'mombasa', 1, 1732629909, 'Cable-Belden'),
('DEVICE-0022', 'cable', 'Belden', 1, 'mombasa', 1, 1732629937, 'Cable-Belden'),
('DEVICE-0023', 'cable', 'Belden', 1, 'mombasa', 1, 1732629939, 'Cable-Belden'),
('DEVICE-0024', 'cable', 'CommScope', 1, 'nairobi', 1, 1732629960, 'Cable-CommScope'),
('DEVICE-0025', 'cable', 'CommScope', 1, 'nairobi', 1, 1732629961, 'Cable-CommScope'),
('DEVICE-0026', 'cable', 'CommScope', 1, 'nairobi', 1, 1732629963, 'Cable-CommScope'),
('DEVICE-0027', 'cable', 'CommScope', 1, 'nairobi', 1, 1732629965, 'Cable-CommScope'),
('DEVICE-0028', 'cable', 'CommScope', 1, 'juja', 1, 1732629972, 'Cable-CommScope'),
('DEVICE-0029', 'cable', 'CommScope', 1, 'juja', 1, 1732629974, 'Cable-CommScope'),
('DEVICE-0030', 'cable', 'CommScope', 1, 'juja', 1, 1732629975, 'Cable-CommScope'),
('DEVICE-0031', 'cable', 'Nexans', 1, 'nakuru', 1, 1732629990, 'Cable-Nexans'),
('DEVICE-0032', 'cable', 'Nexans', 1, 'nakuru', 1, 1732629992, 'Cable-Nexans'),
('DEVICE-0033', 'cable', 'Nexans', 1, 'nakuru', 1, 1732629994, 'Cable-Nexans'),
('DEVICE-0034', 'cable', 'Nexans', 1, 'nakuru', 1, 1732629997, 'Cable-Nexans'),
('DEVICE-0035', 'cable', 'Nexans', 1, 'nakuru', 1, 1732629999, 'Cable-Nexans'),
('DEVICE-0036', 'cable', 'Prysmian', 1, 'thika', 1, 1732630015, 'Cable-Prysmian'),
('DEVICE-0037', 'cable', 'Prysmian', 1, 'thika', 1, 1732630017, 'Cable-Prysmian'),
('DEVICE-0038', 'cable', 'Prysmian', 1, 'thika', 1, 1732630019, 'Cable-Prysmian'),
('DEVICE-0039', 'repeater', 'Motorola', 0, 'nairobi', 1, 1732630100, 'Repeater-Motorola'),
('DEVICE-0040', 'repeater', 'KenWood', 0, 'juja', 1, 1732630118, 'Repeater-KenWood'),
('DEVICE-0041', 'repeater', 'KenWood', 0, 'juja', 1, 1732630120, 'Repeater-KenWood'),
('DEVICE-0042', 'repeater', 'ICOM', 0, 'mombasa', 1, 1732630139, 'Repeater-ICOM'),
('DEVICE-0043', 'computer', 'Dell', 1, 'juja', 1, 1732630247, 'Computer-Dell'),
('DEVICE-0044', 'computer', 'HP', 1, 'nairobi', 1, 1732630271, 'Computer-HP'),
('DEVICE-0045', 'computer', 'Apple', 1, 'mombasa', 1, 1732630312, 'Computer-Apple'),
('DEVICE-0046', 'computer', 'HP', 1, 'nairobi', 1, 1732630322, 'Computer-HP'),
('DEVICE-0047', 'computer', 'HP', 1, 'nakuru', 1, 1732630358, 'Computer-HP'),
('DEVICE-0048', 'computer', 'Lenovo', 1, 'thika', 1, 1732630369, 'Computer-Dell'),
('DEVICE-0049', 'computer', 'Lenovo', 1, 'thika', 1, 1732630372, 'Computer-Lenovo'),
('DEVICE-0050', 'router', 'Netgear', 1, 'thika', 1, 1732630623, 'Router-Netgear'),
('DEVICE-0051', 'router', 'Netgear', 1, 'juja', 1, 1732630630, 'Router-Netgear'),
('DEVICE-0052', 'router', 'Netgear', 1, 'juja', 1, 1732630632, 'Router-Netgear'),
('DEVICE-0053', 'router', 'Netgear', 1, 'thika', 1, 1732630639, 'Router-Netgear'),
('DEVICE-0054', 'router', 'TP-Link', 1, 'mombasa', 1, 1732630666, 'Router-TP-Link'),
('DEVICE-0055', 'router', 'TP-Link', 1, 'mombasa', 1, 1732630667, 'Router-TP-Link');

-- --------------------------------------------------------

--
-- Table structure for table `main_notification`
--

DROP TABLE IF EXISTS `main_notification`;
CREATE TABLE IF NOT EXISTS `main_notification` (
  `notification_id` varchar(25) NOT NULL,
  `message` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` int(11) NOT NULL,
  `fault_id_id` varchar(25) NOT NULL,
  `user_id_id` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `main_notification_fault_id_id_22de1b79` (`fault_id_id`),
  KEY `main_notification_user_id_id_01edcfd6` (`user_id_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `main_technician`
--

DROP TABLE IF EXISTS `main_technician`;
CREATE TABLE IF NOT EXISTS `main_technician` (
  `technician_id` varchar(25) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contact_info`)),
  `skillset` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`skillset`)),
  `availability` tinyint(1) NOT NULL,
  PRIMARY KEY (`technician_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_technician`
--

INSERT INTO `main_technician` (`technician_id`, `name`, `username`, `email`, `password`, `contact_info`, `skillset`, `availability`) VALUES
('TECH-001', 'Technician 1', 'technician1', 'technician1@teleman.system', 'access1111', '{\"address\": \"P.O. Box 41298-00200\", \"phone_number\": \"+254 742 459 134\"}', '[\"cable_management\", \"router_management\", \"switch_management\"]', 1),
('TECH-002', 'Technician 2', 'technician2', 'technician2@teleman.system', 'access2222', '{\"address\": \"P.O. Box 41558-00200\", \"phone_number\": \"+254 799 123 003\"}', '[\"cable_management\", \"router_management\", \"switch_management\", \"computer_management\", \"extender_management\"]', 1),
('TECH-003', 'Technician 3', 'technician3', 'technician3@teleman.system', 'access3333', '{\"address\": \"P.O. Box 19531-00200\", \"phone_number\": \"+254 766 928 853\"}', '[\"router_management\", \"computer_management\", \"repeater_management\"]', 1),
('TECH-004', 'Technician 4', 'technician4', 'technician4@teleman.system', 'access4444', '{\"address\": \"P.O. Box 99135-00200\", \"phone_number\": \"+254 777 323 357\"}', '[\"router_management\", \"extender_management\"]', 1),
('TECH-005', 'Technician 5', 'technician5', 'technician5@teleman.system', 'access5555', '{\"address\": \"P.O. Box 41558-00200\", \"phone_number\": \"+254 799 123 003\"}', '[\"cable_management\", \"switch_management\", \"computer_management\"]', 1),
('TECH-006', 'Technician 6', 'technician6', 'technician6@teleman.system', 'access6666', '{\"address\": \"P.O. Box 91354-00200\", \"phone_number\": \"+254 721 559 135\"}', '[\"computer_management\"]', 1),
('TECH-007', 'Technician 7', 'technician7', 'technician7@teleman.system', 'access7777', '{\"address\": \"P.O. Box 67914-00200\", \"phone_number\": \"+254 712 563 349\"}', '[\"router_management\", \"switch_management\", \"computer_management\", \"extender_management\"]', 1),
('TECH-008', 'Technician 8', 'technician8', 'technician8@teleman.system', 'access8888', '{\"address\": \"P.O. Box 11345-00200\", \"phone_number\": \"+254 755 234 774\"}', '[\"switch_management\", \"computer_management\"]', 1),
('TECH-009', 'Technician 9', 'technician9', 'technician9@teleman.system', 'access9999', '{\"address\": \"P.O. Box 94146-00200\", \"phone_number\": \"+254 712 646 234\"}', '[\"router_management\", \"extender_management\"]', 1),
('TECH-010', 'Technician 10', 'technician10', 'technician10@teleman.system', 'access1010', '{\"address\": \"P.O. Box 44732-00200\", \"phone_number\": \"+254 703 356 773\"}', '[\"cable_management\", \"router_management\", \"switch_management\", \"computer_management\", \"extender_management\"]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `main_user`
--

DROP TABLE IF EXISTS `main_user`;
CREATE TABLE IF NOT EXISTS `main_user` (
  `user_id` varchar(25) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(20) NOT NULL,
  `contact_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contact_info`)),
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `location` varchar(50) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permissions`)),
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_user`
--

INSERT INTO `main_user` (`user_id`, `name`, `username`, `role`, `contact_info`, `email`, `password`, `location`, `permissions`) VALUES
('USER-001', 'Spy Man', 'spyman', 'user', '{\"address\": \"P.O. Box 12345-00200\", \"phone_number\": \"254 702 012 456\"}', 'spyman@teleman.system', 'spyman', 'nairobi', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-002', 'Elon Musk', 'elonmusk', 'user', '{\"address\": \"P.O. Box 78000-00200\", \"phone_number\": \"+254 707 778 123\"}', 'elonmusk@teleman.system', 'elonmusk', 'juja', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-003', 'Falcon', 'falcon', 'user', '{\"address\": \"P.O. Box 33589-00200\", \"phone_number\": \"+254 711 556 324\"}', 'falcon@teleman.system', 'elonmusk', 'thika', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-004', 'Suspect', 'suspect', 'user', '{\"address\": \"P.O. Box 23555-00200\", \"phone_number\": \"+254 764 993 112\"}', 'suspect@teleman.system', 'suspect', 'nakuru', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-005', 'Nikola Tesla', 'tesla', 'user', '{\"address\": \"P.O. Box 77234-00200\", \"phone_number\": \"+254 790 884 134\"}', 'nikolatesla@teleman.system', 'tesla', 'mombasa', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-006', 'Nasir Jacob', 'nasir', 'user', '{\"address\": \"P.O. Box 33589-00200\", \"phone_number\": \"+254 706 688 879\"}', 'nasirjacob@teleman.system', 'nasir', 'nairobi', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-007', 'Osteen Ngetich', 'osteen', 'user', '{\"address\": \"P.O. Box 78000-00200\", \"phone_number\": \"+254 700 344 127\"}', 'osteenngetich@teleman.system', 'osteen', 'nakuru', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-008', 'Mohamed Ibrahim', 'mohamed', 'user', '{\"address\": \"P.O. Box 42996-00200\", \"phone_number\": \"+254 799 235 773\"}', 'mohamedibrahim@teleman.system', 'mohamed', 'mombasa', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-009', 'Idah Amondi', 'idah', 'user', '{\"address\": \"P.O. Box 23412-00200\", \"phone_number\": \"+254 788 324 135\"}', 'idahamondi@teleman.system', 'idah', 'thika', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('USER-010', 'Faith Nyawira', 'faith', 'user', '{\"address\": \"P.O. Box 41298-00200\", \"phone_number\": \"+254 642 459 134\"}', 'faithnyawira@teleman.system', 'faith', 'juja', '[\"report_fault\", \"view_network_status\", \"track_fault_status\"]'),
('ADMIN-001', 'Teleman Admin', 'admin', 'admin', '{\"address\": \"P.O. Box 56312-00200\", \"phone_number\": \"+254 722 555 312\"}', 'admin@teleman.system', 'teleman', 'nairobi', '[\"generate_incident_reports\", \"view_network_status\", \"track_fault_status\"]'),
('ADMIN-002', 'Teleman Manager', 'manager', 'admin', '{\"address\": \"P.O. Box 69124-00200\", \"phone_number\": \"+254 793 123 663\"}', 'manager@teleman.system', 'manager', 'juja', '[\"generate_incident_reports\", \"view_network_status\", \"track_fault_status\"]');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
