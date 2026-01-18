-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2026 at 04:15 AM
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
-- Database: `sisari`
--

-- --------------------------------------------------------

--
-- Table structure for table `apbd`
--

CREATE TABLE `apbd` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `nilai` decimal(15,2) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id`, `judul`, `konten`, `kategori`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'Lomba memperingati 17 Agustus 2025 di RT 012', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 'Kegiatan', '/storage/berita/ymp5V1fPW1yA0PQP64PCo1OIPQMRk8en0G34fVNA.jpg', '2026-01-06 01:41:45', '2026-01-06 01:41:45'),
(2, 'Konser Amal RT 012', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'Kegiatan', '/storage/berita/8SkDKJaKEozkY91WPMFXCcLthpr9NtOABT4NzL9A.jpg', '2026-01-06 13:29:47', '2026-01-06 13:29:47'),
(3, 'PERINGATAN DINI', 'Cuaca ekstrem diprediksi terjadi besok. Harap waspada.', 'Info Darurat', '', '2026-01-06 14:51:10', '2026-01-06 14:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Diterima',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id`, `user_id`, `judul`, `lokasi`, `deskripsi`, `kategori`, `foto`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Jalan Berlubang', 'Jalan Depan Mia Ayam Pak Tarno RT 09 RW 004', 'Jalan berlubang dan tergenang air sehingga membahayakan pengguna jalan', NULL, 'laporan/mFXTTjUC6oNOrw0GgQ6K5SZyLavmN3ptPQwe1xgY.jpg', 'pending', '2026-01-06 13:06:08', '2026-01-17 19:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_01_01_000000_create_sisari_tables', 1),
(5, '2026_01_05_154851_create_personal_access_tokens_table', 1),
(6, '2026_01_06_000000_add_no_telp_to_users_table', 1),
(7, '2026_01_06_002044_add_no_telp_to_users_table', 1),
(8, '2026_01_06_003352_fix_tables_structure', 1),
(9, '2026_01_06_004000_fix_tables_structure', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `agama` varchar(255) NOT NULL,
  `pendidikan` varchar(255) NOT NULL,
  `status_perkawinan` enum('Lajang','Menikah','Cerai Hidup','Cerai Mati') NOT NULL,
  `status_kependudukan` enum('Aktif','Pindah','Meninggal') NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penduduk`
--

INSERT INTO `penduduk` (`id`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `pendidikan`, `status_perkawinan`, `status_kependudukan`, `pekerjaan`, `no_telp`, `created_at`, `updated_at`) VALUES
(1, '1234567890123456', 'Budi Warga', 'Klaten', '1990-01-01', 'Laki-laki', 'Islam', 'SMA', 'Menikah', 'Aktif', 'Wiraswasta', '08123456789', '2026-01-05 17:42:51', '2026-01-17 19:52:32'),
(2, '0987645890123451', 'Adnan', 'Klaten', '1946-01-31', 'Laki-laki', 'Islam', 'SD', 'Cerai Mati', 'Aktif', 'Tidak Bekerja', '-', '2026-01-06 01:40:22', '2026-01-06 01:40:22'),
(3, '3201000000000001', 'Warga 1', 'Bandung', '1980-01-02', 'Perempuan', 'Islam', 'SMA', 'Lajang', 'Aktif', 'Wiraswasta', '080000000001', NULL, NULL),
(4, '3201000000000002', 'Warga 2', 'Jakarta', '1980-01-03', 'Laki-laki', 'Kristen', 'D3', 'Menikah', 'Aktif', 'Karyawan', '080000000002', NULL, NULL),
(5, '3201000000000003', 'Warga 3', 'Bogor', '1980-01-04', 'Perempuan', 'Katolik', 'S1', 'Cerai Hidup', 'Aktif', 'PNS', '080000000003', NULL, NULL),
(6, '3201000000000004', 'Warga 4', 'Depok', '1980-01-05', 'Laki-laki', 'Hindu', 'S2', 'Cerai Mati', 'Aktif', 'Petani', '080000000004', NULL, NULL),
(7, '3201000000000005', 'Warga 5', 'Bekasi', '1980-01-06', 'Perempuan', 'Islam', 'SMA', 'Lajang', 'Aktif', 'Wiraswasta', '080000000005', NULL, NULL),
(8, '3201000000000006', 'Warga 6', 'Bandung', '1980-01-07', 'Laki-laki', 'Kristen', 'D3', 'Menikah', 'Aktif', 'Karyawan', '080000000006', NULL, NULL),
(9, '3201000000000007', 'Warga 7', 'Jakarta', '1980-01-08', 'Perempuan', 'Katolik', 'S1', 'Cerai Hidup', 'Aktif', 'PNS', '080000000007', NULL, NULL),
(11, '3201000000000009', 'Warga 9', 'Depok', '1980-01-10', 'Perempuan', 'Islam', 'SMA', 'Lajang', 'Aktif', 'Wiraswasta', '080000000009', NULL, NULL),
(12, '3201000000000010', 'Warga 10', 'Bekasi', '1980-01-11', 'Laki-laki', 'Kristen', 'D3', 'Menikah', '', 'Karyawan', '080000000010', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_surat`
--

CREATE TABLE `pengajuan_surat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `jenis_surat` varchar(255) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `data_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data_json`)),
  `status` enum('pending','diproses','disetujui','ditolak') NOT NULL DEFAULT 'pending',
  `file_pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengajuan_surat`
--

INSERT INTO `pengajuan_surat` (`id`, `user_id`, `jenis_surat`, `keterangan`, `data_json`, `status`, `file_pdf`, `created_at`, `updated_at`) VALUES
(1, 3, 'Surat Keterangan Domisili', 'Pendaftaran CPNS 2026', '[]', 'disetujui', NULL, '2026-01-06 13:14:30', '2026-01-17 19:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth-token', '81349fbf1c7d56bf1622f9db603e9ddb0dd06648e2df5abd9164108c1de2d017', '[\"*\"]', NULL, NULL, '2026-01-06 01:38:47', '2026-01-06 01:38:47'),
(2, 'App\\Models\\User', 1, 'auth-token', '011200e295e3b3c576ad733cc3296f351f2969860297bcfff05911327df6c1b7', '[\"*\"]', '2026-01-06 01:39:03', NULL, '2026-01-06 01:38:51', '2026-01-06 01:39:03'),
(3, 'App\\Models\\User', 1, 'auth-token', '38a9240d0eee3f6c6197560bf761a3d99c0d8d689236aa39e5f254d241ff240b', '[\"*\"]', '2026-01-06 14:56:09', NULL, '2026-01-06 01:38:57', '2026-01-06 14:56:09'),
(4, 'App\\Models\\User', 3, 'auth-token', 'd3aac1600b0029267f7dadec3bdc9128548b621053b034c0a5d5386c3095c298', '[\"*\"]', NULL, NULL, '2026-01-06 13:02:21', '2026-01-06 13:02:21'),
(5, 'App\\Models\\User', 3, 'auth-token', 'eebfebfc34d4419866be16c681d6b585c1cbaf2f21407f9d084496595b84109e', '[\"*\"]', '2026-01-06 13:11:56', NULL, '2026-01-06 13:03:11', '2026-01-06 13:11:56'),
(6, 'App\\Models\\User', 3, 'auth-token', 'f315b22476a5a5263de075d6aa2aaba1aa12ab4d0eebdbe7de4e084d8fbf6b75', '[\"*\"]', '2026-01-06 13:14:11', NULL, '2026-01-06 13:14:06', '2026-01-06 13:14:11'),
(7, 'App\\Models\\User', 3, 'auth-token', 'e35f5ff4637e256e9576814a5c982cc1655ef7374298a2dd25559bc85d782656', '[\"*\"]', '2026-01-06 14:56:08', NULL, '2026-01-06 13:14:09', '2026-01-06 14:56:08'),
(8, 'App\\Models\\User', 1, 'auth-token', '9218a180523bca07605c396aeb03aaa4b34022e1baa5a784f889b51d86ee3a9c', '[\"*\"]', '2026-01-06 14:56:07', NULL, '2026-01-06 13:15:55', '2026-01-06 14:56:07'),
(9, 'App\\Models\\User', 1, 'auth-token', 'c97e785ca511626fb1742bbc646b8bb05b1d3b54bc6b6be17d21e888f1adb332', '[\"*\"]', NULL, NULL, '2026-01-08 11:59:33', '2026-01-08 11:59:33'),
(10, 'App\\Models\\User', 1, 'auth-token', 'aeb14690ef63a277884c3a9ef6521ba4ec838f0c3131d01c24cda2ac3e881bb8', '[\"*\"]', NULL, NULL, '2026-01-08 11:59:37', '2026-01-08 11:59:37'),
(11, 'App\\Models\\User', 1, 'auth-token', '4664e65c5a9eb205ff5dc27ccc8ab284bfb3a09eebaab10b6a035691e1db4737', '[\"*\"]', '2026-01-08 12:00:15', NULL, '2026-01-08 11:59:44', '2026-01-08 12:00:15'),
(12, 'App\\Models\\User', 3, 'auth-token', '74b46f00f2841f95f6a34a180577a5635dd8eced4bdb354069274577b24b7225', '[\"*\"]', '2026-01-08 12:04:36', NULL, '2026-01-08 12:03:08', '2026-01-08 12:04:36'),
(13, 'App\\Models\\User', 4, 'auth-token', 'd4e19ad2e59a43a83e081368764ec0fef17d0e4683fa6fc9fd626e5f672a770a', '[\"*\"]', NULL, NULL, '2026-01-14 18:02:15', '2026-01-14 18:02:15'),
(14, 'App\\Models\\User', 3, 'auth-token', '8ef637f08ac16b326e9665c2a76d0412619d838ccd825ad0b472246081c136c7', '[\"*\"]', '2026-01-17 19:28:06', NULL, '2026-01-17 19:27:59', '2026-01-17 19:28:06'),
(16, 'App\\Models\\User', 1, 'auth-token', 'cbe42a03a391689d1a0cf6b1173427c453062581db5d219fea07a19177c70a71', '[\"*\"]', NULL, NULL, '2026-01-17 19:50:36', '2026-01-17 19:50:36'),
(17, 'App\\Models\\User', 1, 'auth-token', 'fd97e83ad8008ac71b03dd1fc6fc45ad0043b7ceea45aefb55a6751ad384b132', '[\"*\"]', NULL, NULL, '2026-01-17 19:50:39', '2026-01-17 19:50:39'),
(18, 'App\\Models\\User', 1, 'auth-token', '2fc10010d3091c70a4744579b46e8f64e432713add74810314031a634f3138b7', '[\"*\"]', '2026-01-17 19:55:45', NULL, '2026-01-17 19:51:31', '2026-01-17 19:55:45'),
(20, 'App\\Models\\User', 1, 'auth-token', '28d5df07a5cbf4dba297648c0fa4cec268a93c929370ee8d4310c21bce4d9d44', '[\"*\"]', '2026-01-17 20:09:16', NULL, '2026-01-17 20:06:56', '2026-01-17 20:09:16'),
(21, 'App\\Models\\User', 3, 'auth-token', '31e8e18f650ce60a82a081567f0a813833afc5a7f78eaa6eeed4817926592b63', '[\"*\"]', '2026-01-17 20:10:19', NULL, '2026-01-17 20:10:14', '2026-01-17 20:10:19'),
(22, 'App\\Models\\User', 3, 'auth-token', '7512c38b3cdea68398a71906aeacf529538d65e56e4ed57b9eebc0ddc014844d', '[\"*\"]', '2026-01-17 20:11:17', NULL, '2026-01-17 20:10:16', '2026-01-17 20:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ApksMJaigmtoaLjiE0aqDt7F6nphIQOJviRl5Xl6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUE9CR1I5MHBiVk1yRGFjdlMzVlhTTUlHeEtLa1AyRmxoRHpPQzk1cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767873785),
('E3PCjFQjn3IDs2r8KIrtsFGgeznWgg4UY3tRmg5Z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTFKbndEYmJwVmNjeUNzQVhxU0szQUVaSE1KSUlRVkVvOUtsNjdJQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767705353),
('fOHW22NQPcg7IePHjVrAsJ5wgvevRU7JvsNbMlYW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmd2NElCeFNFM0xBRjlnbHhwTkpvODIwN1ZyYjFpVVpIeVJLYm5IciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767705245),
('I0Bm990cYbNh1Q9PyxaQ8LwONNaXtYL8xZNqqMmn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXBkUnZyd2VXVGxJbUJ6ODAyN1RockV0VnlTQllHbUVjcHdHSDNYZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767663533),
('LFQfwuomF2Yen0sL9Whpz9bZLTNWrzT9kgMni0jT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUNoZFY1NmRyRkQ1QmZKZ2xZUEZPeFdHZXlRY2JZWFk3a0pvZlZ1UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768413847),
('NIYYyH7QcuKQx8CyT834vX2T2m6I3Es1Uo5bX6Eg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVV0aDluY3ZDTzRnSE0xRUZhMnFwdEltZDVjNnR1NXEzNnROUDZTaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768680611);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','masyarakat') NOT NULL DEFAULT 'masyarakat',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `name`, `email`, `no_telp`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', 'admin@desa.id', NULL, NULL, '$2y$12$6v0O94XjciuZmpvDecnI5OwmJcZkdt8Mu7geXyON39PZktvn7u1ua', 'admin', NULL, '2026-01-05 17:42:51', '2026-01-05 17:42:51'),
(2, '1234567890123456', 'Budi Warga', 'budi@desa.id', NULL, NULL, '$2y$12$YU.4XJqxWauJezYQcchD5u9qzAkJa3.MyoBPYXBZ5aQIncq1RCtb.', 'masyarakat', NULL, '2026-01-05 17:42:51', '2026-01-05 17:42:51'),
(3, '2347689018909760', 'Karmila Andara', 'karmilamila@gmail.com', '09876528290', NULL, '$2y$12$hfH/G/s3rnXMcUdbRLI6YeSo.Sqp7030dxrm4tLwC/KNHMQhd94WC', 'masyarakat', NULL, '2026-01-06 13:02:21', '2026-01-06 13:02:21'),
(4, '0898123789567345', 'Harmer', 'harmer123@gmail.com', '08978972399', NULL, '$2y$12$/V1Jb3RaVI2FmZ207atrBOmoXYNAlyaJB82Ahl9/vJd7ynROJomAK', 'masyarakat', NULL, '2026-01-14 18:02:15', '2026-01-14 18:02:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apbd`
--
ALTER TABLE `apbd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laporan_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penduduk_nik_unique` (`nik`);

--
-- Indexes for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_surat_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nik_unique` (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apbd`
--
ALTER TABLE `apbd`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  ADD CONSTRAINT `pengajuan_surat_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
