-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2022 at 03:41 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='admin details';

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `email`, `password`) VALUES
('gib', 'gib@gmail.com', '1000'),
('root', 'root@gmail.com', '3000');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `username` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `telephone` int(15) NOT NULL,
  `country` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `location` varchar(50) NOT NULL,
  `medical` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(30) NOT NULL,
  `appointment_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`username`, `email`, `time`, `telephone`, `country`, `city`, `location`, `medical`, `status`, `created_date`, `user_id`, `appointment_id`) VALUES
('cli', '', '0000-00-00 00:00:00', 0, '', '', '', '', 'pending', '2021-03-10 12:00:11', 0, 0),
('maryline', 'chebet@gmail.com', '2021-03-11 15:23:00', 7800000, 'Kenya', 'nairobi', 'karen', 'fghjdawjuifyeifgjhkasxahdc', 'approved', '2021-03-07 15:23:53', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user');

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'users', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-30 13:15:30.917537'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-10-30 13:15:31.719628'),
(3, 'auth', '0001_initial', '2021-10-30 13:15:34.842591'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-10-30 13:15:34.947589'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-10-30 13:15:35.031594'),
(6, 'auth', '0004_alter_user_username_opts', '2021-10-30 13:15:35.318362'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-10-30 13:15:35.644659'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-10-30 13:15:35.669655'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-10-30 13:15:35.736662'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-10-30 13:15:35.768653'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-10-30 13:15:35.799656'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-10-30 13:15:35.934661'),
(13, 'auth', '0011_update_proxy_permissions', '2021-10-30 13:15:35.975651'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-10-30 13:15:36.011656'),
(15, 'users', '0001_initial', '2021-10-30 13:15:40.745100'),
(16, 'admin', '0001_initial', '2021-10-30 13:15:42.897145'),
(17, 'admin', '0002_logentry_remove_auto_add', '2021-10-30 13:15:42.958489'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-30 13:15:43.005443'),
(19, 'sessions', '0001_initial', '2021-10-30 13:15:43.452822');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(50) NOT NULL,
  `doctor_name` varchar(30) NOT NULL,
  `doctor_experience` varchar(100) NOT NULL,
  `speciality` varchar(30) NOT NULL,
  `doctor_desc` varchar(200) NOT NULL,
  `charges` varchar(50) NOT NULL,
  `phone` int(20) NOT NULL,
  `doctor_image` varchar(500) NOT NULL,
  `more_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `doctor_name`, `doctor_experience`, `speciality`, `doctor_desc`, `charges`, `phone`, `doctor_image`, `more_desc`) VALUES
(1, 'DR.CHER MARYLINE', '43 years of experience', 'doctor', 'Director, Founder MBChB, MMED (Int.Med), 43 years of experience\r\n\r\n', '5000', 75400200, 'https://cdn1.iconfinder.com/data/icons/diversity-avatars-volume-01-circles/64/doctor-woman-white-128.png', 'Dr. Dan Gikonyo is one of the most coveted Cardiologists in Kenya. He is both an interventional and non-invasive adult cardiologist. He has a thriving practice of over 43+ years. He has been instrumental in mentoring and training of the majority of adult cardiologists in the country and in the region. With over four decades of experience, Dr. Gikonyo has attended thousands of patients drawn from various parts of the world. He is a Post-Doctoral Fellow in Adult Cardiology from the University of Minnesota, USA. Dr. Gikonyo is a member of the American College of Cardiology and previously lectured at the Faculty of Medicine (University of Nairobi). He is also a member of the Kenya Medical Association and Kenya Cardiac Society. He has attended several international conferences and written numerous papers touching on cardiac and other topical health matters.'),
(2, 'DR. MOSE ONSERIO', '40 years of experience', 'doctor', 'Founder and Chairman of The Karen Hospital Board. MBChB, MMED (Paed)', '2000', 79003465, 'https://cdn3.iconfinder.com/data/icons/diversity-avatars/64/doctor-man-asian-128.png', 'She is a renowned paediatric cardiologist in Kenya. She is both an interventional and non-invasive paediatric cardiologist. She was the first Kenyan female cardiologist and has been instrumental in mentoring and training of majority paediatric cardiologists in the country. Dr. Betty is a Post-Doctoral Fellow in Paediatric Cardiology, University of Minnesota, USA and has a Masters of Medicine in Paediatrics, (University of Nairobi), Kenya, Bachelor of Medicine and Surgery (University of Nairobi) and a Diploma in Tropical Medicine from the same university. Dr. Betty Gikonyo is also a professional member of the Kenya Medical Association, Kenya Cardiac Society, Kenya Paediatric Association, Kenya Medical Women Association, Founding chair and member of University of Nairobi Alumni Association. She was also the Chairperson of Nairobi Health Management Board, a position she held for 7 years and a member of the University Council for 14 years which saw her rise to the role of deputy chair of the University of Nairobi Council. She is the recipient of two Presidential awards-MBS & SS. She won the CEO Global Limited East Africa Regional Awards- Most influential Woman (Medical category) in 2016. She has also penned her own autobiography titled, “The Girl who dared to dream.”'),
(3, 'DR.ALLANYATOR', '18 years of experience', 'doctor', 'INTERVENTIONAL CARDIOLOGIST MBChB, MRCP', '2000', 78034300, 'https://cdn4.iconfinder.com/data/icons/bzzricon-frontliners/512/03_Surgeon_with_Masker-128.png', 'Dr. Antony Gikonyo is an interventional and non-invasive adult cardiologist in Kenya. He performs Surgical and Interventional, Coronary artery and aortic procedures and actively participates in continuous medical education through seminars and workshops at The Karen Hospital. He graduated from Howard Medical School in 2001 and then became a member of the Royal College of Physicians UK in 2007. He completed his cardiology training in 2011, South Africa. For the past four years, he has been in charge of the medical internship program at The Karen Hospital, Nairobi. He is part of the Heart Team which performs regular coronary and artery bypass grafts at The Karen Hospital. Dr. Antony Gikonyo has published a Retrospective Review of Coronary Artery Bypass Graft surgery at The Karen Hospital, Kenya among other research papers.'),
(4, 'DR. MARK DALE', '25 years of experience', 'doctor', 'CHIEF CARDIOTHORACIC & VASCULAR SURGEON\r\nMS, Mch, FIACS, FICS, FCCP, FICA ', '3000', 10002343, 'https://cdn4.iconfinder.com/data/icons/scenarium-vol-6/128/009_doctor_experiment_man-128.png', 'Dr. Premanand has been a Cardiac surgeon for more than 25 years. He has performed more than 15,000 surgeries since he started practicing. At The Karen Hospital, he has been able to perform over 150 open heart operations since he joined the institution. Premanand performs CABG surgeries on “beating hearts” which means, the heart is not stopped. In other similar operations, the heart is usually stopped and then a heart-lung machine takes over the functions of the heart. He attended a Fellowship in heart and lung transplantation at the Department of Cardiothoracic Surgery, Oregon Health & Science University, Portland OR, USA. Dr. Premanand holds a Bachelor of Medicines-Bachelor of Surgery, Nalanda Medical College, Patna Bihar, India. He has served in reputed cardiothoracic centres in the USA, Australia and New Zealand. He has also done a fellowship in heart and lung transplantation at the Department of Cardiothoracic Surgery at Oregon Health & Science University, Portland, OR, United States. He has attended numerous international conferences and written numerous articles on cardiac and other health topics.'),
(5, 'DR. RITA SANCHEZ', '18 years of experience', 'doctor', 'CARDIAC ANAESTHESIOLOGIST\r\nMBBS, DA, DNB, PGDHS, FECMO, FICCC, FCA.', '4000', 70492323, 'https://cdn4.iconfinder.com/data/icons/medical-flat-19/128/healthcare_avatar_hospital_doctor_nurse_woman_assistant-128.png', 'Dr. Shrikant has performed more than 10,000 cardiothoracic and vascular surgeries. He is a life member and fellow Indian Association of Cardiothoracic and Vascular Anaesthesia. His first case of open-heart surgery was in 2004 Dr. Shrikant is a fellow in Cardiac Critical Care( FICCC) and a fellow in ECMO (FECMO) Dr Shrikant has specialized in adult and Paediatric Cardiac Anaesthesia. He is also an intensivist for adult and paediatric post-cardiac surgery cases. Dr Shrikant has specialized in (TEE)Transesophageal Echocardiography since 10 years and doing it regularly in TKH'),
(6, 'DR. MAINA JUMA', '10 years of experience', 'doctor', 'DENTAL SURGEON BDS., MSc', '4000', 75954323, 'https://cdn4.iconfinder.com/data/icons/medical-staff-characters-2/128/doctor_hospital_staff_female_smile_medical_black-128.png', 'Dr. Nyabutoh holds a bachelor of Medicine and Surgery from the University of Nairobi. He has attended to over 137,280 patients since he started practising. In his career, he has done numerous procedures including but not limited to caesarean sections, stitching various wounds and debridements, incision and drainage, lumpectomies at various sites, tubal ligation under LA, amputation of severed digits and general running of Accident and Emergency departments Dr Nyabutoh also runs cardiac clinics at the Meru branch performing ECG and ECHO and thereafter sending referrals to the main hospital for patients who require cath lab procedures and surgeries. He has undergone significant training which includes BLS at The Karen Hospital –Nakuru branch-2011, HIV/AIDS with special emphasis on anti-retroviral therapy; 26th July2003-Symposium, Physician Mini-laparotomy under local anaesthesia course 17th January-15th February 1992 and many more.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `phone` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='patients details';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `password`, `phone`) VALUES
('cher', 'cher@gmail.com', '2000', 7200000),
('Rita', 'rita@gmail.com', '9000', 7500000);

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `id` bigint(20) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`id`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `name`, `email`, `password`) VALUES
(1, NULL, 0, '', '', 0, 1, '2021-10-30 16:51:47.832878', 'cher', 'chebet@gmail.com', 'Z'),
(2, NULL, 0, '', '', 0, 1, '2021-10-30 17:00:25.510953', 'joy', 'joy@gmail.com', 'pbkdf2_sha256$260000$AY99mnmBvO9V3tzKTIF0G2$PjEszKwsccTsKSjBHr5Jby4AQSa+7H2TNHwdQfG/xuA='),
(3, NULL, 0, '', '', 0, 1, '2021-10-30 19:07:55.571664', 'toto', 'toto@gmail.com', 'pbkdf2_sha256$260000$1p8isup0MdzaZ1RkbzyyfP$LtB6LYFCWF6mn/6ZfIzuzsnxbTd7YLHR9CMTth6wGS8='),
(4, NULL, 0, '', '', 0, 1, '2021-10-30 22:07:13.134624', 'roy', 'roy@gmail.com', 'pbkdf2_sha256$260000$EYu5QkQdyPHRLqo90jeaYz$8gvmNlfIUU/4QA5x39jvw/mejbawcX+6/5tmv5CUyLc=');

-- --------------------------------------------------------

--
-- Table structure for table `users_user_groups`
--

CREATE TABLE `users_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_user_user_permissions`
--

CREATE TABLE `users_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

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
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`);

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
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  ADD KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
