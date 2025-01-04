-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 07:45 PM
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
-- Database: `aplikasi_kewirausahaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota_kelompok`
--

CREATE TABLE `anggota_kelompok` (
  `id` int(11) NOT NULL,
  `id_kelompok` int(11) DEFAULT NULL,
  `npm_anggota` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota_kelompok`
--

INSERT INTO `anggota_kelompok` (`id`, `id_kelompok`, `npm_anggota`) VALUES
(25, 20, '1402023001'),
(26, 20, '1402022033'),
(32, 25, '1402022040'),
(33, 26, '1402022044'),
(34, 26, '1402022060'),
(35, 27, '1502022028');

-- --------------------------------------------------------

--
-- Table structure for table `anggota_kelompok_backup`
--

CREATE TABLE `anggota_kelompok_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `id_kelompok` int(11) DEFAULT NULL,
  `npm_anggota` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota_kelompok_backup`
--

INSERT INTO `anggota_kelompok_backup` (`id`, `id_kelompok`, `npm_anggota`) VALUES
(25, 20, '1402023001'),
(26, 20, '1402022033'),
(32, 25, '1402022040'),
(33, 26, '1402022044'),
(34, 26, '1402022060'),
(35, 27, '1502022028');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(5) NOT NULL,
  `agenda` text NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `feedback_mentor` varchar(1000) NOT NULL,
  `status` enum('menunggu','ditolak','disetujui','alternatif','selesai') NOT NULL,
  `bukti_kegiatan` varchar(255) DEFAULT NULL,
  `id_klmpk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `nama_kegiatan`, `tanggal`, `waktu`, `agenda`, `lokasi`, `feedback_mentor`, `status`, `bukti_kegiatan`, `id_klmpk`) VALUES
(26, 'TESTER 2', '2024-12-13', '20:30', 'BIMBINGAN 1', 'Yarsi', '', 'menunggu', NULL, 20),
(31, 'Bimbingan 2', '2024-12-12', '20:36', 'jabs', 'Yarsi', '', 'ditolak', NULL, 20),
(34, 'Bimbingan 2', '2024-12-11', '21:02', 'jadkaknd', 'Yarsi', '', 'menunggu', NULL, 20),
(35, 'Bimbingan 1', '2024-12-19', '04:41', 'jandand', 'Kantin', '', 'menunggu', NULL, 25),
(36, 'kokoko', '2024-12-18', '23:13', 'ijmbjkh', 'ujj', '', 'menunggu', NULL, 25),
(37, 'sadksn', '2024-12-13', '21:23', 'as,', 'Takana', 'ts', 'disetujui', NULL, 25),
(38, 'jsd', '2024-12-04', '14:22', 'sdds', 'dka', '', 'selesai', 'uploads/bukti_kegiatan/CV English Task.pdf', 20),
(39, 'dknd', '2024-12-11', '17:42', 'asada', 'Tenmer', '', 'disetujui', NULL, 20),
(40, 'BIMBINGAN', '2024-12-15', '05:32', 'Bimbingan ke 10', 'YARSI', '', 'disetujui', NULL, 20),
(42, 'Bimbingan satu', '2024-12-17', '08:02', 'Bimbingan', 'Kantin', '', 'disetujui', NULL, 26);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_backup`
--

CREATE TABLE `jadwal_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `nama_kegiatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `agenda` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `feedback_mentor` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('menunggu','ditolak','disetujui','alternatif','selesai') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bukti_kegiatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_klmpk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_backup`
--

INSERT INTO `jadwal_backup` (`id`, `nama_kegiatan`, `tanggal`, `waktu`, `agenda`, `lokasi`, `feedback_mentor`, `status`, `bukti_kegiatan`, `id_klmpk`) VALUES
(26, 'TESTER 2', '2024-12-13', '20:30', 'BIMBINGAN 1', 'Yarsi', '', 'menunggu', NULL, 20),
(31, 'Bimbingan 2', '2024-12-12', '20:36', 'jabs', 'Yarsi', '', 'ditolak', NULL, 20),
(34, 'Bimbingan 2', '2024-12-11', '21:02', 'jadkaknd', 'Yarsi', '', 'menunggu', NULL, 20),
(35, 'Bimbingan 1', '2024-12-19', '04:41', 'jandand', 'Kantin', '', 'menunggu', NULL, 25),
(36, 'kokoko', '2024-12-18', '23:13', 'ijmbjkh', 'ujj', '', 'menunggu', NULL, 25),
(37, 'sadksn', '2024-12-13', '21:23', 'as,', 'Takana', 'ts', 'disetujui', NULL, 25),
(38, 'jsd', '2024-12-04', '14:22', 'sdds', 'dka', '', 'selesai', 'uploads/bukti_kegiatan/CV English Task.pdf', 20),
(39, 'dknd', '2024-12-11', '17:42', 'asada', 'Tenmer', '', 'disetujui', NULL, 20),
(40, 'BIMBINGAN', '2024-12-15', '05:32', 'Bimbingan ke 10', 'YARSI', '', 'disetujui', NULL, 20),
(42, 'Bimbingan satu', '2024-12-17', '08:02', 'Bimbingan', 'Kantin', '', 'disetujui', NULL, 26);

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_bisnis`
--

CREATE TABLE `kelompok_bisnis` (
  `id_kelompok` int(11) NOT NULL,
  `npm_ketua` varchar(20) DEFAULT NULL,
  `nama_kelompok` varchar(50) DEFAULT NULL,
  `nama_bisnis` varchar(50) DEFAULT NULL,
  `logo_bisnis` varchar(255) DEFAULT NULL,
  `tahun_akademik_id` int(11) DEFAULT NULL,
  `kategori_bisnis` varchar(255) DEFAULT NULL,
  `sdg` varchar(255) DEFAULT NULL,
  `ide_bisnis` varchar(255) DEFAULT NULL,
  `id_mentor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelompok_bisnis`
--

INSERT INTO `kelompok_bisnis` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `logo_bisnis`, `tahun_akademik_id`, `kategori_bisnis`, `sdg`, `ide_bisnis`, `id_mentor`) VALUES
(20, '1402022071', 'a', 'a', 'hq720.jpg', 18, 'Bisnis Teknologi atau Digital', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'TESTER', 1),
(25, '1402022055', 'TESTER', 'BISNIS AYAM', 'wlpper.jpg', 18, NULL, NULL, NULL, 2),
(26, '1402022068', 'ArTech', 'Bisnis Ikan', 'BMW.svg_.png', 18, 'Bisnis Konstruksi dan Real Estate', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'TES', 1),
(27, '1402022013', 'Nothing To Lose', 'Bisnis Ayam', 'ayam.jpg', 18, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_bisnis_backup`
--

CREATE TABLE `kelompok_bisnis_backup` (
  `id_kelompok` int(11) NOT NULL DEFAULT 0,
  `npm_ketua` varchar(20) DEFAULT NULL,
  `nama_kelompok` varchar(50) DEFAULT NULL,
  `nama_bisnis` varchar(50) DEFAULT NULL,
  `logo_bisnis` varchar(255) DEFAULT NULL,
  `tahun_akademik_id` int(11) DEFAULT NULL,
  `kategori_bisnis` varchar(255) DEFAULT NULL,
  `sdg` varchar(255) DEFAULT NULL,
  `ide_bisnis` varchar(255) DEFAULT NULL,
  `id_mentor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelompok_bisnis_backup`
--

INSERT INTO `kelompok_bisnis_backup` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `logo_bisnis`, `tahun_akademik_id`, `kategori_bisnis`, `sdg`, `ide_bisnis`, `id_mentor`) VALUES
(20, '1402022071', 'a', 'a', 'hq720.jpg', 18, 'Bisnis Teknologi atau Digital', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'TESTER', 1),
(25, '1402022055', 'TESTER', 'BISNIS AYAM', 'wlpper.jpg', 18, NULL, NULL, NULL, 2),
(26, '1402022068', 'ArTech', 'Bisnis Ikan', 'BMW.svg_.png', 18, 'Bisnis Konstruksi dan Real Estate', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'TES', 1),
(27, '1402022013', 'Nothing To Lose', 'Bisnis Ayam', 'ayam.jpg', 18, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laporan_bisnis`
--

CREATE TABLE `laporan_bisnis` (
  `id` int(11) NOT NULL,
  `judul_laporan` varchar(255) NOT NULL,
  `jenis_laporan` varchar(30) NOT NULL,
  `laporan_penjualan` text DEFAULT NULL,
  `laporan_pemasaran` text DEFAULT NULL,
  `laporan_produksi` text DEFAULT NULL,
  `laporan_sdm` text DEFAULT NULL,
  `laporan_keuangan` text DEFAULT NULL,
  `laporan_pdf` text DEFAULT NULL,
  `tanggal_upload` datetime NOT NULL DEFAULT current_timestamp(),
  `id_kelompok` int(11) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_bisnis`
--

INSERT INTO `laporan_bisnis` (`id`, `judul_laporan`, `jenis_laporan`, `laporan_penjualan`, `laporan_pemasaran`, `laporan_produksi`, `laporan_sdm`, `laporan_keuangan`, `laporan_pdf`, `tanggal_upload`, `id_kelompok`, `feedback`) VALUES
(52, 'Laporan 1', 'laporan_kemajuan', '', '', '', '', '', '[\"Progres Kerja tanggal 23 December 2024 (1402022055).pdf\",\"Progres Kerja tanggal 18 December 2024 (1402022055) (1).pdf\",\"Progres Kerja tanggal 16 December 2024 (1402022055) (1) (1).pdf\"]', '2024-12-25 14:39:27', 20, 'bagus laporanya'),
(53, 'LAPORAN 1', 'laporan_kemajuan', 'TES', 'TES', 'TES', 'TES', 'TES', '[\"0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf\",\"Buku-Modul-Kuliah-Kewirausahaan.pdf\"]', '2024-12-29 12:00:03', 26, 'LAPORAN YANG BAGUS');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_bisnis_backup`
--

CREATE TABLE `laporan_bisnis_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `judul_laporan` varchar(255) NOT NULL,
  `jenis_laporan` varchar(30) NOT NULL,
  `laporan_penjualan` text DEFAULT NULL,
  `laporan_pemasaran` text DEFAULT NULL,
  `laporan_produksi` text DEFAULT NULL,
  `laporan_sdm` text DEFAULT NULL,
  `laporan_keuangan` text DEFAULT NULL,
  `laporan_pdf` text DEFAULT NULL,
  `tanggal_upload` datetime NOT NULL DEFAULT current_timestamp(),
  `id_kelompok` int(11) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_bisnis_backup`
--

INSERT INTO `laporan_bisnis_backup` (`id`, `judul_laporan`, `jenis_laporan`, `laporan_penjualan`, `laporan_pemasaran`, `laporan_produksi`, `laporan_sdm`, `laporan_keuangan`, `laporan_pdf`, `tanggal_upload`, `id_kelompok`, `feedback`) VALUES
(52, 'Laporan 1', 'laporan_kemajuan', '', '', '', '', '', '[\"Progres Kerja tanggal 23 December 2024 (1402022055).pdf\",\"Progres Kerja tanggal 18 December 2024 (1402022055) (1).pdf\",\"Progres Kerja tanggal 16 December 2024 (1402022055) (1) (1).pdf\"]', '2024-12-25 14:39:27', 20, 'bagus laporanya'),
(53, 'LAPORAN 1', 'laporan_kemajuan', 'TES', 'TES', 'TES', 'TES', 'TES', '[\"0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf\",\"Buku-Modul-Kuliah-Kewirausahaan.pdf\"]', '2024-12-29 12:00:03', 26, 'LAPORAN YANG BAGUS');

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `aksi` varchar(50) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `logout_time` timestamp NULL DEFAULT NULL,
  `session_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_activity`
--

INSERT INTO `log_activity` (`id`, `timestamp`, `username`, `ip_address`, `user_agent`, `status`, `role`, `aksi`, `error_message`, `logout_time`, `session_token`) VALUES
(31, '2024-12-17 06:18:34', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:18:42', ''),
(32, '2024-12-17 06:21:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:24:00', ''),
(33, '2024-12-17 06:24:06', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(34, '2024-12-17 06:31:30', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:31:40', ''),
(35, '2024-12-17 06:31:49', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(36, '2024-12-17 06:39:43', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', '2025-01-01 14:36:50', ''),
(37, '2024-12-17 07:06:24', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', '2025-01-01 14:36:50', ''),
(38, '2024-12-17 07:12:19', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(39, '2024-12-17 07:12:36', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(40, '2024-12-17 07:12:42', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(41, '2024-12-17 07:13:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(42, '2024-12-17 07:13:13', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(43, '2024-12-17 07:13:31', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(44, '2024-12-17 07:54:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(45, '2024-12-17 07:54:57', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', '2025-01-01 14:36:50', ''),
(46, '2024-12-17 08:22:00', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:11:54', ''),
(47, '2024-12-17 08:37:00', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:11:54', ''),
(48, '2024-12-17 09:12:07', 'fitra.rama', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(49, '2024-12-17 09:12:21', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:21:08', ''),
(50, '2024-12-17 09:21:14', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:24:51', ''),
(51, '2024-12-17 09:25:05', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:25:18', ''),
(52, '2024-12-17 09:25:28', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(53, '2024-12-17 10:58:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(54, '2024-12-17 11:43:28', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(55, '2024-12-17 13:39:52', 'einstein', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 13:44:39', ''),
(56, '2024-12-17 13:44:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(57, '2024-12-17 19:59:37', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(58, '2024-12-17 20:02:56', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 20:04:56', ''),
(59, '2024-12-17 20:05:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(60, '2024-12-17 20:35:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 20:42:26', ''),
(61, '2024-12-17 20:42:34', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', '2025-01-01 14:36:50', ''),
(62, '2024-12-17 20:45:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:08:58', ''),
(63, '2024-12-17 20:45:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:08:58', ''),
(64, '2024-12-17 21:09:05', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:09:53', ''),
(65, '2024-12-17 21:10:01', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:26:56', ''),
(66, '2024-12-19 14:51:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 14:54:45', ''),
(67, '2024-12-19 14:54:51', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(68, '2024-12-19 14:54:59', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(69, '2024-12-19 14:58:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(70, '2024-12-19 14:58:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(71, '2024-12-19 15:00:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:08:36', ''),
(72, '2024-12-19 15:08:43', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:22:00', ''),
(73, '2024-12-19 15:22:26', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:26:06', ''),
(74, '2024-12-19 15:26:12', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:54:00', ''),
(75, '2024-12-19 15:54:13', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 16:08:48', ''),
(76, '2024-12-19 16:09:00', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(77, '2024-12-19 16:41:12', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 16:42:10', ''),
(78, '2024-12-19 16:42:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 16:43:07', ''),
(79, '2024-12-19 16:43:16', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:21:06', ''),
(80, '2024-12-19 17:21:13', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:22:17', ''),
(81, '2024-12-19 17:22:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:44:04', ''),
(82, '2024-12-19 17:44:13', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:51:15', ''),
(83, '2024-12-19 17:51:21', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:51:26', ''),
(84, '2024-12-19 17:51:40', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:53:26', ''),
(85, '2024-12-19 17:53:35', 'asril.affandhi', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:54:00', ''),
(86, '2024-12-19 17:54:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:55:46', ''),
(87, '2024-12-19 17:55:53', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(88, '2024-12-19 18:43:48', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 18:45:15', ''),
(89, '2024-12-19 18:45:21', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(90, '2024-12-19 18:52:36', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 18:54:00', ''),
(91, '2024-12-19 18:54:08', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(92, '2024-12-19 18:54:33', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 19:21:40', ''),
(93, '2024-12-19 19:21:46', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(94, '2024-12-19 19:45:55', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 19:48:57', ''),
(95, '2024-12-19 19:49:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(96, '2024-12-19 20:01:21', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(97, '2024-12-19 20:06:30', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:07:13', ''),
(98, '2024-12-19 20:10:26', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:10:31', ''),
(99, '2024-12-19 20:10:56', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:11:01', ''),
(100, '2024-12-19 20:11:09', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(101, '2024-12-19 20:13:22', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(102, '2024-12-19 20:18:11', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(103, '2024-12-19 20:19:45', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(104, '2024-12-19 20:27:50', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(105, '2024-12-19 20:35:35', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(106, '2024-12-19 20:37:25', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(107, '2024-12-19 20:38:36', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(108, '2024-12-19 20:55:58', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:56:12', ''),
(109, '2024-12-19 20:56:21', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(110, '2024-12-19 20:59:03', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:59:25', ''),
(111, '2024-12-19 20:59:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(112, '2024-12-19 21:01:41', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(113, '2024-12-19 21:01:46', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(114, '2024-12-20 05:18:41', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-20 06:15:08', ''),
(115, '2024-12-20 05:59:25', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(116, '2024-12-20 06:03:41', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(117, '2024-12-20 06:11:26', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(118, '2024-12-20 06:12:15', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(119, '2024-12-20 06:12:51', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(120, '2024-12-20 06:13:18', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-20 06:15:08', ''),
(121, '2024-12-20 06:15:15', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:17:58', ''),
(122, '2024-12-20 06:17:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(123, '2024-12-20 06:19:04', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(124, '2024-12-20 06:19:57', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(125, '2024-12-21 04:41:31', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 05:21:56', ''),
(126, '2024-12-21 05:22:12', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(127, '2024-12-21 05:37:40', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(128, '2024-12-21 05:38:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(129, '2024-12-21 05:40:43', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(130, '2024-12-21 05:48:56', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(131, '2024-12-21 05:58:19', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(132, '2024-12-21 06:17:43', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(133, '2024-12-21 06:20:26', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(134, '2024-12-21 06:36:54', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 06:38:28', ''),
(135, '2024-12-21 06:38:34', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(136, '2024-12-21 07:24:05', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(137, '2024-12-21 08:13:47', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:16:24', ''),
(138, '2024-12-21 08:16:32', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:17:58', ''),
(139, '2024-12-21 08:18:05', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(140, '2024-12-21 08:20:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(141, '2024-12-21 08:23:06', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(142, '2024-12-21 08:24:40', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(143, '2024-12-21 08:37:15', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(144, '2024-12-21 08:41:39', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(145, '2024-12-21 10:06:16', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(146, '2024-12-21 10:06:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(147, '2024-12-21 10:09:08', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(148, '2024-12-21 10:09:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(149, '2024-12-21 10:15:45', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 10:19:39', ''),
(150, '2024-12-21 10:19:52', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(151, '2024-12-21 10:41:10', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:49:53', ''),
(152, '2024-12-21 10:41:39', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(153, '2024-12-21 11:29:35', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(154, '2024-12-21 11:39:14', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(155, '2024-12-21 11:39:44', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(156, '2024-12-21 13:25:12', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:25:56', ''),
(157, '2024-12-21 13:26:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(158, '2024-12-21 13:46:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:49:53', ''),
(159, '2024-12-21 13:49:58', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:52:28', ''),
(160, '2024-12-21 13:52:32', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:54:06', ''),
(161, '2024-12-21 13:54:10', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:54:20', ''),
(162, '2024-12-21 13:54:25', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(163, '2024-12-21 13:55:53', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:57:47', ''),
(164, '2024-12-21 13:57:53', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(165, '2024-12-21 14:00:17', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(166, '2024-12-21 14:01:46', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(167, '2024-12-21 14:02:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(168, '2024-12-21 14:03:55', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 14:06:25', ''),
(169, '2024-12-21 14:06:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(170, '2024-12-21 14:10:30', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(171, '2024-12-23 05:14:34', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 05:15:41', ''),
(172, '2024-12-23 05:15:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(173, '2024-12-23 05:17:24', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(174, '2024-12-23 05:18:19', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(175, '2024-12-23 05:20:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 06:34:29', ''),
(176, '2024-12-23 06:33:58', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 06:34:29', ''),
(177, '2024-12-23 06:34:48', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:08:24', ''),
(178, '2024-12-23 08:08:31', 'asril.affandhi', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:08:35', ''),
(179, '2024-12-23 08:08:41', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:08:46', ''),
(180, '2024-12-23 08:08:55', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:10:39', ''),
(181, '2024-12-23 08:11:16', 'mahasiswa2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:11:39', ''),
(182, '2024-12-23 08:11:45', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 12:25:13', ''),
(183, '2024-12-23 12:25:20', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(184, '2024-12-23 12:36:38', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 12:38:13', ''),
(185, '2024-12-23 12:38:20', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(186, '2024-12-23 12:38:38', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(187, '2024-12-23 13:15:10', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(188, '2024-12-23 13:20:41', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 13:21:19', ''),
(189, '2024-12-23 13:21:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(190, '2024-12-23 13:23:21', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 13:48:28', ''),
(191, '2024-12-23 13:48:34', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(192, '2024-12-23 13:53:10', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(193, '2024-12-23 19:10:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(194, '2024-12-24 08:11:05', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(195, '2024-12-24 08:13:43', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:17:27', ''),
(196, '2024-12-25 07:35:40', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-25 09:05:48', ''),
(197, '2024-12-25 08:37:58', 'ridho.syahferoo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 08:51:37', ''),
(198, '2024-12-25 08:38:13', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 08:39:34', ''),
(199, '2024-12-25 08:39:39', 'ridho.syahferoo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 08:51:37', ''),
(200, '2024-12-25 09:29:47', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f6fc3df9896ea23e8a8265ed33ef4015'),
(201, '2024-12-25 09:30:07', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f6fc3df9896ea23e8a8265ed33ef4015'),
(202, '2024-12-25 11:02:22', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(203, '2024-12-25 11:02:54', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 11:03:07', ''),
(204, '2024-12-25 11:03:14', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 11:03:47', ''),
(205, '2024-12-25 11:03:56', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(206, '2024-12-25 11:04:55', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:02:20', ''),
(207, '2024-12-25 12:02:27', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:17:53', ''),
(208, '2024-12-25 12:18:01', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:20:09', ''),
(209, '2024-12-25 12:20:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:39:07', ''),
(210, '2024-12-25 12:39:12', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:40:28', ''),
(211, '2024-12-25 12:40:48', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:52:02', ''),
(212, '2024-12-25 12:52:07', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:52:21', ''),
(213, '2024-12-25 12:52:27', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(214, '2024-12-25 12:59:36', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:59:45', ''),
(215, '2024-12-25 12:59:54', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(216, '2024-12-25 13:18:00', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:18:38', ''),
(217, '2024-12-25 13:18:46', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(218, '2024-12-25 13:31:59', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(219, '2024-12-25 13:34:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(220, '2024-12-25 13:35:04', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:35:10', ''),
(221, '2024-12-25 13:35:16', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:43:18', ''),
(222, '2024-12-25 13:43:31', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:43:34', ''),
(223, '2024-12-25 13:43:40', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-01 14:36:50', ''),
(224, '2024-12-25 13:43:40', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Username tidak ditemukan', '2025-01-01 14:36:50', ''),
(225, '2024-12-25 13:43:46', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(226, '2024-12-25 13:46:29', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:46:37', ''),
(227, '2024-12-25 13:46:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(228, '2024-12-25 13:46:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Username tidak ditemukan', '2025-01-03 19:26:06', ''),
(229, '2024-12-25 13:46:50', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(230, '2024-12-25 13:47:47', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-25 13:48:14', ''),
(231, '2024-12-25 13:47:47', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-25 13:48:14', ''),
(232, '2024-12-25 13:47:53', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:48:14', ''),
(233, '2024-12-25 13:48:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-26 05:53:15', ''),
(234, '2024-12-25 13:48:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-26 05:53:15', ''),
(235, '2024-12-25 13:48:25', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:48:33', ''),
(236, '2024-12-25 13:48:39', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(237, '2024-12-25 18:15:08', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 05:53:15', ''),
(238, '2024-12-26 05:48:12', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 05:53:15', ''),
(239, '2024-12-26 05:53:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 08:07:44', ''),
(240, '2024-12-26 08:07:51', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 08:08:02', ''),
(241, '2024-12-26 08:08:15', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 10:05:47', ''),
(242, '2024-12-26 10:06:01', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', '');
INSERT INTO `log_activity` (`id`, `timestamp`, `username`, `ip_address`, `user_agent`, `status`, `role`, `aksi`, `error_message`, `logout_time`, `session_token`) VALUES
(243, '2024-12-26 10:06:36', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(244, '2024-12-26 11:31:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(245, '2024-12-26 11:33:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 11:33:22', ''),
(246, '2024-12-26 11:33:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(247, '2024-12-26 12:38:23', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(248, '2024-12-26 12:38:44', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(249, '2024-12-26 12:39:08', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 12:39:18', ''),
(250, '2024-12-26 12:39:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(251, '2024-12-26 12:41:15', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(252, '2024-12-26 12:50:03', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(253, '2024-12-26 13:06:29', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 14:10:43', ''),
(254, '2024-12-26 14:10:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(255, '2024-12-26 17:45:46', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 17:47:42', ''),
(256, '2024-12-26 17:47:48', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(257, '2024-12-26 17:48:56', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(258, '2024-12-26 17:53:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(259, '2024-12-26 18:06:21', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:06:23', ''),
(260, '2024-12-26 18:17:45', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:17:47', ''),
(261, '2024-12-26 18:25:03', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:25:05', ''),
(262, '2024-12-26 18:27:45', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-26 18:28:40', ''),
(263, '2024-12-26 18:28:14', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:28:40', ''),
(264, '2024-12-26 18:28:46', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:30:02', ''),
(265, '2024-12-26 18:30:10', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:42:15', ''),
(266, '2024-12-26 18:42:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:45:05', ''),
(267, '2024-12-26 18:45:17', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:49:20', ''),
(268, '2024-12-26 18:49:27', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:51:12', ''),
(269, '2024-12-26 18:51:18', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:52:05', ''),
(270, '2024-12-26 18:51:18', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:52:05', ''),
(271, '2024-12-26 18:53:18', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:54:41', ''),
(272, '2024-12-26 18:53:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:54:41', ''),
(273, '2024-12-26 18:53:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:54:41', ''),
(274, '2024-12-26 18:53:40', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:54:41', ''),
(275, '2024-12-26 18:54:48', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 18:55:48', ''),
(276, '2024-12-26 18:56:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(277, '2024-12-26 19:03:47', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(278, '2024-12-26 19:04:31', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(279, '2024-12-26 19:04:43', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(280, '2024-12-26 19:14:17', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(281, '2024-12-26 19:24:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 19:24:27', ''),
(282, '2024-12-26 19:25:39', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(283, '2024-12-26 19:26:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(284, '2024-12-26 20:12:08', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(285, '2024-12-26 20:18:20', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(286, '2024-12-26 20:23:33', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(287, '2024-12-26 20:23:54', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(288, '2024-12-26 20:24:20', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(289, '2024-12-26 20:24:52', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(290, '2024-12-26 20:25:13', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(291, '2024-12-27 07:06:18', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-27 07:06:37', ''),
(292, '2024-12-27 07:38:36', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-28 08:38:12', ''),
(293, '2024-12-27 07:38:58', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:55:25', ''),
(294, '2024-12-27 07:38:58', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:55:25', ''),
(295, '2024-12-28 08:20:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 08:38:12', ''),
(296, '2024-12-28 08:38:19', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(297, '2024-12-28 08:38:40', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(298, '2024-12-28 08:38:40', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(299, '2024-12-28 08:46:58', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(300, '2024-12-28 09:11:02', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(301, '2024-12-28 09:14:49', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(302, '2024-12-28 10:27:23', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 10:30:41', ''),
(303, '2024-12-28 10:30:47', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(304, '2024-12-28 10:30:55', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(305, '2024-12-28 13:20:05', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 13:24:12', ''),
(306, '2024-12-28 13:24:22', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 13:48:42', ''),
(307, '2024-12-28 13:49:01', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(308, '2024-12-28 13:54:24', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(309, '2024-12-28 14:06:25', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(310, '2024-12-28 14:06:36', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(311, '2024-12-28 14:09:56', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(312, '2024-12-28 14:20:29', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 14:22:07', ''),
(313, '2024-12-28 14:22:15', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(314, '2024-12-28 14:31:23', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 14:31:49', ''),
(315, '2024-12-28 14:31:54', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(316, '2024-12-29 06:34:25', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 06:35:41', ''),
(317, '2024-12-29 06:35:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(318, '2024-12-29 06:36:27', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(319, '2024-12-29 07:02:47', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(320, '2024-12-29 07:03:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(321, '2024-12-29 07:03:36', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(322, '2024-12-29 07:32:22', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(323, '2024-12-29 07:48:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 07:48:20', ''),
(324, '2024-12-29 07:48:28', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 08:30:37', ''),
(325, '2024-12-29 08:33:34', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:55:25', ''),
(326, '2024-12-29 08:42:28', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:55:25', ''),
(327, '2024-12-29 10:42:18', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:42:21', ''),
(328, '2024-12-29 10:42:27', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(329, '2024-12-29 10:45:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(330, '2024-12-29 10:52:05', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:52:12', ''),
(331, '2024-12-29 10:55:35', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(332, '2024-12-29 10:56:47', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-29 10:58:19', ''),
(333, '2024-12-29 10:56:47', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-29 10:58:19', ''),
(334, '2024-12-29 10:56:55', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:58:19', ''),
(335, '2024-12-29 10:58:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(336, '2024-12-29 10:59:14', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-29 11:00:18', ''),
(337, '2024-12-29 10:59:14', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-29 11:00:18', ''),
(338, '2024-12-29 10:59:21', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 11:00:18', ''),
(339, '2024-12-29 11:00:24', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(340, '2024-12-29 11:00:58', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 11:01:56', ''),
(341, '2024-12-29 11:02:03', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(342, '2024-12-29 11:04:03', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(343, '2024-12-29 11:04:58', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 11:08:45', ''),
(344, '2024-12-29 11:08:51', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(345, '2024-12-29 11:51:05', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(346, '2024-12-29 11:51:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 11:51:34', ''),
(347, '2024-12-29 11:51:42', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(348, '2024-12-31 06:15:57', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 06:17:31', ''),
(349, '2024-12-31 06:16:09', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(350, '2024-12-31 06:16:31', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 06:17:31', ''),
(351, '2024-12-31 06:17:37', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 06:20:30', ''),
(352, '2024-12-31 06:20:38', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(353, '2024-12-31 06:38:30', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 06:50:51', ''),
(354, '2024-12-31 06:50:58', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(355, '2024-12-31 06:52:10', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 08:42:27', ''),
(356, '2024-12-31 08:42:33', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(357, '2024-12-31 08:43:00', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 09:13:08', ''),
(358, '2024-12-31 09:13:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 09:16:14', ''),
(359, '2024-12-31 09:16:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 09:17:17', ''),
(360, '2024-12-31 09:17:23', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(361, '2024-12-31 09:18:36', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(362, '2024-12-31 09:19:07', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(363, '2024-12-31 09:19:44', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(364, '2024-12-31 09:39:49', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(365, '2024-12-31 09:51:24', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(366, '2024-12-31 09:51:54', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(367, '2024-12-31 10:21:23', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(368, '2024-12-31 11:08:50', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(369, '2024-12-31 11:12:59', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(370, '2024-12-31 11:13:09', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(371, '2024-12-31 11:15:53', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(372, '2024-12-31 11:17:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(373, '2024-12-31 11:18:00', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(374, '2024-12-31 11:18:36', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(375, '2024-12-31 11:35:04', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 11:35:10', ''),
(376, '2024-12-31 11:37:01', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(377, '2024-12-31 11:38:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 08:34:42', ''),
(378, '2024-12-31 11:44:36', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 18:56:12', ''),
(379, '2025-01-01 07:02:39', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(380, '2025-01-01 08:34:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 08:34:42', ''),
(381, '2025-01-01 08:35:20', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 10:13:49', ''),
(382, '2025-01-01 10:13:56', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(383, '2025-01-01 10:23:28', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(384, '2025-01-01 10:24:09', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(385, '2025-01-01 10:24:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(386, '2025-01-01 10:34:34', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(387, '2025-01-01 13:59:29', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 16:02:31', ''),
(388, '2025-01-01 14:02:22', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(389, '2025-01-01 14:09:02', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-01 14:36:50', ''),
(390, '2025-01-01 14:37:01', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 16:02:31', ''),
(391, '2025-01-01 14:39:37', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(392, '2025-01-01 14:39:49', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(393, '2025-01-01 14:41:43', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(394, '2025-01-01 15:40:35', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(395, '2025-01-01 15:42:57', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(396, '2025-01-01 15:44:57', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(397, '2025-01-01 15:47:15', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(398, '2025-01-01 15:47:38', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(399, '2025-01-01 15:57:06', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(400, '2025-01-01 15:57:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(401, '2025-01-01 15:59:53', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(402, '2025-01-01 16:01:30', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(403, '2025-01-01 16:01:39', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 16:02:31', ''),
(404, '2025-01-01 16:02:40', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 16:02:45', ''),
(405, '2025-01-01 16:02:54', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(406, '2025-01-01 16:10:44', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 16:10:49', ''),
(407, '2025-01-01 16:11:09', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 16:11:18', ''),
(408, '2025-01-01 16:11:38', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(409, '2025-01-01 16:18:42', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(410, '2025-01-01 16:18:59', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(411, '2025-01-03 17:59:48', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(412, '2025-01-03 17:59:57', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', '2025-01-03 18:14:37', ''),
(413, '2025-01-03 18:14:56', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(414, '2025-01-03 18:15:21', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(415, '2025-01-03 18:15:55', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(416, '2025-01-03 18:48:08', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 18:56:12', ''),
(417, '2025-01-03 19:01:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(418, '2025-01-03 19:23:17', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-03 19:26:06', ''),
(419, '2025-01-03 19:23:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-03 19:26:06', ''),
(420, '2025-01-03 19:26:16', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(421, '2025-01-04 17:08:06', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(422, '2025-01-04 17:08:16', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(423, '2025-01-04 17:22:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-04 18:38:05', ''),
(424, '2025-01-04 17:57:24', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(425, '2025-01-04 18:02:11', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-04 18:38:05', ''),
(426, '2025-01-04 18:36:14', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(427, '2025-01-04 18:36:46', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Admin', 'Login', '', '2025-01-04 18:38:05', ''),
(428, '2025-01-04 18:38:33', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(429, '2025-01-04 18:43:38', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Admin', 'Login', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `npm` varchar(15) NOT NULL,
  `program_studi` varchar(100) NOT NULL,
  `tahun_ajaran` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `fakultas` varchar(100) DEFAULT NULL,
  `id_kelompok` int(11) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `nama`, `npm`, `program_studi`, `tahun_ajaran`, `email`, `contact`, `fakultas`, `id_kelompok`, `alamat`) VALUES
(4, 8, 'Ruffino Noor', '1402022044', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'komangabi@gmail.com', '089765347779', 'Teknik Informasi', 26, NULL),
(5, 9, 'Sharil Hamza', '1402022060', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'akunmllimitbruno@gmail.com', '089637162255', NULL, 26, NULL),
(6, 10, 'John Doe', '1402023001', 'Teknik Informatika', '2023/2024 Teknik Informatika', 'Johndoe@gmail.com', '087654327778', NULL, 20, NULL),
(9, 19, 'ridho odir', '1402022071', 'Teknik Informatika', '2022 / 2023 Ganjil (Semester 5)', 'bcakun71@gmail.com', '0897653617', 'Fakultas Teknologi Informasi', 20, NULL),
(10, 20, 'fitra rama', '1402022033', 'Teknik Informatika', '2022 / 2023 Ganjil (Semester 5)', 'riskyarur@gmail.com', '08963546662', 'Fakultas Teknologi Informasi', 20, NULL),
(17, 26, 'Ridho Syahfero', '1402022055', '', '', 'ridhosyahfero35@gmail.com', '089637167774', NULL, 25, 'Jl.Remaja 3 Gg gabus RT.9/RW.8 No.27'),
(18, 27, 'Muhammad Fadly Abdillah', '1402022040', '', '', 'ridhosyahfero35@gmail.com', '087828628734', NULL, 25, 'JL Sungai Kapuas IV, Semper Barat, Cilincing, Jakarta Utara'),
(21, 32, 'Muhammad Asril Afandhi', '1402022068', 'Teknik Informatika', '2022 / 2023 Ganjil (Semester 5)', 'Johndoe@gmail.com', '082113185983', 'Teknologi Informasi', 26, 'KAMP RAWA PASUNG'),
(22, 33, 'Bilal Hakkul Mubin', '1402022013', 'Teknik Informatika', '2022 / 2023 Ganjil (Semester 5)', 'Johndoe@gmail.com', '081317254563', 'Teknologi Informasi', 27, 'Jalan Lagoa Gg1 C1 Terusan No 14'),
(23, 34, 'Salsha Billa Yunita Sari', '1502022028', 'Ilmu Perpustakaan', '2022 / 2023 Ganjil (Semester 5)', 'salsabilla@gmailc.com', '083834155938', 'Teknologi Informasi', 27, 'Jl. Kalibaru Barat IV No.05');

-- --------------------------------------------------------

--
-- Table structure for table `materi_kewirausahaan`
--

CREATE TABLE `materi_kewirausahaan` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `file_path` varchar(300) NOT NULL,
  `deskripsi` varchar(3000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `materi_kewirausahaan`
--

INSERT INTO `materi_kewirausahaan` (`id`, `judul`, `file_path`, `deskripsi`, `created_at`) VALUES
(116, 'Konsep Dasar Kewirausahaan', '0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf', 'Dalam mater ini, Anda akan mempelajari konsep dasar kewirausahaan yang menjadi fondasi penting bagi setiap calon wirausahawan. Kami akan membahas:\r\n\r\nApa itu kewirausahaan? Definisi dan esensi dari menjadi seorang wirausahawan.\r\nKarakteristik seorang wirausahawan sukses seperti inovasi, kreativitas, dan keberanian mengambil risiko.\r\nProses kewirausahaan mulai dari menemukan ide bisnis, memvalidasi pasar, hingga merancang model bisnis.\r\nManfaat kewirausahaan baik secara individu maupun bagi perekonomi', '2025-01-01 07:01:16'),
(117, 'Konsep Kewirausahaan Kuliah gratis Prof Rhenald Kasali', 'konsep-kewirausahaan-kuliah-gratis-prof-rhenald-kasali-ytshorts.savetube.me.mp4', 'Dalam video ini, Prof. Rhenald Kasali, seorang pakar dan praktisi terkemuka di bidang kewirausahaan, memberikan kuliah gratis yang membahas Konsep Kewirausahaan secara mendalam. Anda akan belajar:\r\n\r\nPengertian kewirausahaan menurut perspektif akademis dan praktis.\r\nPola pikir wirausaha (entrepreneurial mindset) yang mendorong inovasi dan keberanian dalam menghadapi tantangan.\r\nStrategi menemukan peluang bisnis di era perubahan dan disrupsi.\r\nPrinsip dasar membangun bisnis yang berkelanjutan dan rele', '2025-01-01 07:01:16'),
(118, 'Prospek Kerja Kuliah Jurusan Kewirausahaan', 'prospek-kerja-kuliah-jurusan-kewirausahaan-ytshorts.savetube.me.mp4', 'Apakah Anda penasaran dengan peluang karier setelah lulus dari jurusan Kewirausahaan? Dalam video ini, kami akan membahas berbagai prospek kerja menjanjikan bagi lulusan jurusan Kewirausahaan. Anda akan mengetahui:\r\n\r\nBagaimana lulusan jurusan ini bisa menjadi pengusaha sukses di berbagai bidang.\r\nPeluang bekerja sebagai konsultan bisnis dan membantu perusahaan berkembang.\r\nPeran strategis sebagai Business Development Manager atau pendiri startup inovatif.\r\nKarier di dunia sosial sebagai social entre', '2025-01-01 07:01:16'),
(119, 'Buku Modul Kuliah Kewirausahaan', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 'Buku ini merupakan panduan lengkap untuk memahami dan mempraktikkan konsep dasar kewirausahaan dalam dunia nyata. Disusun secara sistematis, modul ini dirancang untuk mendukung mahasiswa dalam mengikuti perkuliahan kewirausahaan dengan materi yang relevan, aplikatif, dan mudah dipahami.\r\n\r\nIsi Buku:\r\nKonsep Dasar Kewirausahaan: Definisi, sejarah, dan pentingnya kewirausahaan.\r\nPola Pikir Wirausaha (Entrepreneurial Mindset): Mengembangkan kreativitas, inovasi, dan keberanian mengambil risiko.\r\nProses ', '2025-01-01 07:01:16'),
(120, 's', '05_Relasi Berhirarki_v.1.0.pptx', 's', '2025-01-04 17:22:32'),
(123, 'w', 'Kegiatan 9 Desember 2024 - 1402022040.pdf', '\r\n                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis consequatur odit in officiis harum ab ut exercitationem soluta consectetur expedita. Sapiente totam voluptatum optio provident? Ducimus quidem minima recusandae fuga maxime voluptates veritatis, porro laudantium a? Ab deleniti quibusdam minus quos omnis voluptatem, recusandae, est consequuntur rem temporibus similique aut laborum exercitationem aspernatur! Soluta magnam error iusto voluptate minus alias nihil numquam optio veritatis, atque ratione nemo voluptatibus suscipit nisi sunt cumque veniam maxime repellendus provident perspiciatis blanditiis eum. Quisquam harum nesciunt nemo odit iure et aperiam deleniti. Eum minus officiis cumque nostrum praesentium earum consequuntur, at nemo vitae quo molestiae quia quidem iste aliquam esse quibusdam inventore. Tempore non iure nulla amet mollitia et pariatur incidunt quaerat, maiores repellat voluptatum, repellendus nobis excepturi aut sunt nemo? Consequ', '2025-01-04 17:32:30'),
(124, 's', 'Kegiatan 9 Desember 2024 - 1402022040.pdf', '\r\n                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis consequatur odit in officiis harum ab ut exercitationem soluta consectetur expedita. Sapiente totam voluptatum optio provident? Ducimus quidem minima recusandae fuga maxime voluptates veritatis, porro laudantium a? Ab deleniti quibusdam minus quos omnis voluptatem, recusandae, est consequuntur rem temporibus similique aut laborum exercitationem aspernatur! Soluta magnam error iusto voluptate minus alias nihil numquam optio veritatis, atque ratione nemo voluptatibus suscipit nisi sunt cumque veniam maxime repellendus provident perspiciatis blanditiis eum. Quisquam harum nesciunt nemo odit iure et aperiam deleniti. Eum minus officiis cumque nostrum praesentium earum consequuntur, at nemo vitae quo molestiae quia quidem iste aliquam esse quibusdam inventore. Tempore non iure nulla amet mollitia et pariatur incidunt quaerat, maiores repellat voluptatum, repellendus nobis excepturi aut sunt nemo? Consequatur odio necessitatibus consectetur, incidunt corrupti, quo cupiditate id iure ducimus maxime facere, laudantium aut ea! Incidunt deserunt tempora voluptate debitis, at adipisci iste sit harum perferendis quia, ut earum atque, molestias dolore eaque minima reprehenderit iure temporibus autem ullam accusamus ratione officiis? Fugiat at dolore repudiandae dolorem illo in quae, error suscipit ipsum tenetur a corporis ipsa! Obcaecati quas dolorum animi facilis eveniet vitae eum harum fugit, labore, sequi voluptatibus maxime ipsum voluptatem quis libero delectus facere adipisci hic illo soluta enim. Doloremque nesciunt deserunt cupiditate voluptate officiis veritatis dolore quaerat amet eum illo rerum nostrum consequuntur doloribus illum, provident totam accusantium ad aut vel numquam? Explicabo rem minus assumenda quo amet quod adipisci molestias qui, enim obcaecati aperiam nulla sint excepturi, culpa illum necessitatibus nostrum, quos odio praesentium corrupti? Et debitis tempore commodi nihil nulla? Provident animi dolor reprehenderit aliquid, nobis doloremque accusamus illum dicta inventore error ullam deleniti obcaecati omnis quo sed delectus unde odit suscipit, sapiente placeat possimus, blanditiis nesciunt voluptatibus. Ut vero doloribus ea quia, ratione, eos consequatur ipsum accusantium, fugit quae ipsa illo minima! Autem quibusdam magni sapiente omnis, aut itaque? Hic provident reiciendis inventore sed aliquid quis molestias, sunt quo nisi dolorem totam nobis in ad labore amet magnam unde soluta rem voluptatem facere nam tempore, impedit saepe praesentium! Illo, est! Eaque explicabo dicta quidem! Officia cupiditate maxime, magni repellat vitae temporibus at aliquam? Asperiores maxime itaque vitae accusantium quisquam qui recusandae hic laudantium tempore a consequuntur ipsum dolorem iure optio sed quo perferendis, animi veniam ad cumque eos culpa nemo voluptatum natus. Quos blanditiis est quas, sit voluptate nulla dolorem, commodi ducimus nesciunt error labori', '2025-01-04 17:34:43'),
(125, 's', 'craiyon_212258_A_3D_render_of_a_YouTube_premium_logo_with_a_special_titanium_edition__The_logo_is_a_.png', 's', '2025-01-04 17:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE `mentor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nidn` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `keahlian` varchar(100) DEFAULT NULL,
  `fakultas` varchar(100) DEFAULT NULL,
  `prodi` varchar(100) DEFAULT NULL,
  `foto_profile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`id`, `user_id`, `nama`, `nidn`, `email`, `contact`, `keahlian`, `fakultas`, `prodi`, `foto_profile`) VALUES
(1, 2, 'Mr Ridho Syahfero', '022456788', 'rendhyat@gmail.com', '089637167774', 'Entrepreneur', 'Kewirausahaan', 'Bisnis', '/Aplikasi-Kewirausahaan/components/pages/mentorbisnis/uploads/6773b6b5aee324.72886015.jpg'),
(2, 13, 'CONTOH 2', '02247896', 'ridhosyahfero35@gmail.com', '089637167673', 'Busineseman', 'Kewirausahaan', 'Bisnis', '/Aplikasi-Kewirausahaan/components/pages/mentorbisnis/uploads/mentr.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_bisnis`
--

CREATE TABLE `proposal_bisnis` (
  `id` int(11) NOT NULL,
  `judul_proposal` varchar(255) NOT NULL,
  `tahapan_bisnis` varchar(25) NOT NULL,
  `sdg` text NOT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `other_category` varchar(255) DEFAULT NULL,
  `proposal_pdf` varchar(255) NOT NULL,
  `kelompok_id` int(11) NOT NULL,
  `status` enum('menunggu','ditolak','disetujui') DEFAULT 'menunggu',
  `ide_bisnis` varchar(255) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proposal_bisnis`
--

INSERT INTO `proposal_bisnis` (`id`, `judul_proposal`, `tahapan_bisnis`, `sdg`, `kategori`, `other_category`, `proposal_pdf`, `kelompok_id`, `status`, `ide_bisnis`, `feedback`) VALUES
(35, 'TESTER PROPOSAL', 'Tahapan Bertumbuh', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'Bisnis Teknologi atau Digital', '', 'Progres Kerja tanggal 16 December 2024 (1402022055).pdf', 20, 'disetujui', 'TESTER', 'BAGUS BANGET'),
(36, 'PROPOSAL 1', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055).pdf', 25, 'menunggu', 'BISNIS IDE', 'tes'),
(40, 'PROPOSAL 2', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055) (1).pdf', 25, 'menunggu', 'CAUSE THIS IS ALL WE KNOW', NULL),
(41, 'PROPOSAL 1', 'Tahapan Awal', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'Bisnis Konstruksi dan Real Estate', '', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 26, 'disetujui', 'TES', 'Proposal Anda memiliki tujuan yang bagus');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_bisnis_backup`
--

CREATE TABLE `proposal_bisnis_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `judul_proposal` varchar(255) NOT NULL,
  `tahapan_bisnis` varchar(25) NOT NULL,
  `sdg` text NOT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `other_category` varchar(255) DEFAULT NULL,
  `proposal_pdf` varchar(255) NOT NULL,
  `kelompok_id` int(11) NOT NULL,
  `status` enum('menunggu','ditolak','disetujui') DEFAULT 'menunggu',
  `ide_bisnis` varchar(255) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proposal_bisnis_backup`
--

INSERT INTO `proposal_bisnis_backup` (`id`, `judul_proposal`, `tahapan_bisnis`, `sdg`, `kategori`, `other_category`, `proposal_pdf`, `kelompok_id`, `status`, `ide_bisnis`, `feedback`) VALUES
(35, 'TESTER PROPOSAL', 'Tahapan Bertumbuh', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'Bisnis Teknologi atau Digital', '', 'Progres Kerja tanggal 16 December 2024 (1402022055).pdf', 20, 'disetujui', 'TESTER', 'BAGUS BANGET'),
(36, 'PROPOSAL 1', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055).pdf', 25, 'menunggu', 'BISNIS IDE', 'tes'),
(40, 'PROPOSAL 2', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055) (1).pdf', 25, 'menunggu', 'CAUSE THIS IS ALL WE KNOW', NULL),
(41, 'PROPOSAL 1', 'Tahapan Awal', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'Bisnis Konstruksi dan Real Estate', '', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 26, 'disetujui', 'TES', 'Proposal Anda memiliki tujuan yang bagus');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id` int(11) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `jenis_tahun` enum('Ganjil','Genap') NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`id`, `tahun`, `jenis_tahun`, `status`) VALUES
(16, '2023', 'Ganjil', 'Tidak Aktif'),
(17, '2023', 'Genap', 'Tidak Aktif'),
(18, '2024', 'Ganjil', 'Aktif'),
(19, '2022', 'Ganjil', 'Tidak Aktif'),
(20, '2022', 'Genap', 'Tidak Aktif'),
(21, '2021', 'Ganjil', 'Tidak Aktif'),
(22, '2021', 'Genap', 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Mahasiswa','Tutor','Dosen Pengampu','Admin') NOT NULL,
  `first_login` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `first_login`) VALUES
(2, 'akunMntr', '$2y$10$7aCTxTjDGfzG7N/3eVjrtO5g13wGc/RaqaDZbuZMRo7B/XHzKa3Me', 'Dosen Pengampu', 0),
(3, 'akunAdmin', '$2y$10$nX/.ODSzsZSfYvx0Ufi8Keq0UktTybfbtDR54A/hLajur1JTWfjue', 'Admin', 0),
(8, 'mahasiswa1', '$2y$10$uXNSNBz9vAwlD7AV4E1Qn.6DxK0zKygd1LuWcdgARKC/xBIHnXm5y', 'Mahasiswa', 0),
(9, 'mahasiswa2', '$2y$10$Jt7qe4u8hF2g6WjASB0XTey08sA3hHAna8VuU.P1yLoVIHI4whV/m', 'Mahasiswa', 0),
(10, 'mahasiswa3', '$2y$10$YFFZe1tX8Cq58eJTyJNNOOkIP7MS4U325GWQ2QsREj/hahNIPkTOG', 'Mahasiswa', 0),
(13, 'lily.admin', '$2y$10$myraeyhvLDu8j7iK09qyxOX6Dp8vy2ed4VmS3EJgodkXjrN4U6r4u', 'Dosen Pengampu', 0),
(19, 'einsteins', '$2y$10$Jb6XVt2bJMTkMj0/nbpPJu3HGFnEgzaEK4OsWJyqZBFXKwlPWeFu.', 'Mahasiswa', 0),
(20, 'fitra.rama', '$2y$10$flIOsaEwvG7ib/T9YAKMmuSWxbO4zl19kJ/3yAD3YNxgR7r78lR6G', 'Mahasiswa', 0),
(26, 'ridho.syahfero', '$2y$10$wYf/aVrLiIj5812kTgkYP.kgDXDAnRmcizHs0j5.iN.80V2.tGq02', 'Mahasiswa', 0),
(27, 'm.fadly', '$2y$10$0Ly1LagxN3316nnCxFK9NOZkcalTj3B5UH7NEqPoILdholBwFvBgy', 'Mahasiswa', 0),
(32, 'muhammad.asril', '$2y$10$NW1KpcIDt5U2O/Gd7jih.OatL61jCZ1/ToQc/fQTMrw9VMA95mtxW', 'Mahasiswa', 0),
(33, 'bilal.hakkul', '$2y$10$uAU0LsZpqzZbqSFBy60kuudIsSN3G9lrI34CFva4uuAzq/eOTePgu', 'Mahasiswa', 0),
(34, 'salsha.billa', '$2y$10$/eU8DmXMjUyIO5XH2swuN.f0r90vdlWOjfcBXkijnVZSDH.8VlVka', 'Mahasiswa', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota_kelompok`
--
ALTER TABLE `anggota_kelompok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelompok` (`id_kelompok`),
  ADD KEY `npm_anggota` (`npm_anggota`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_klmpk` (`id_klmpk`);

--
-- Indexes for table `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  ADD PRIMARY KEY (`id_kelompok`),
  ADD KEY `npm_ketua` (`npm_ketua`),
  ADD KEY `fk_id_mentor` (`id_mentor`);

--
-- Indexes for table `laporan_bisnis`
--
ALTER TABLE `laporan_bisnis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelompok` (`id_kelompok`);

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `npm` (`npm`),
  ADD UNIQUE KEY `unique_contact` (`contact`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_id_kelompok` (`id_kelompok`);

--
-- Indexes for table `materi_kewirausahaan`
--
ALTER TABLE `materi_kewirausahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nidn` (`nidn`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelompok_id` (`kelompok_id`);

--
-- Indexes for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota_kelompok`
--
ALTER TABLE `anggota_kelompok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `laporan_bisnis`
--
ALTER TABLE `laporan_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `materi_kewirausahaan`
--
ALTER TABLE `materi_kewirausahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `mentor`
--
ALTER TABLE `mentor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota_kelompok`
--
ALTER TABLE `anggota_kelompok`
  ADD CONSTRAINT `anggota_kelompok_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok_bisnis` (`id_kelompok`) ON DELETE CASCADE,
  ADD CONSTRAINT `anggota_kelompok_ibfk_2` FOREIGN KEY (`npm_anggota`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_id_klmpk` FOREIGN KEY (`id_klmpk`) REFERENCES `kelompok_bisnis` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  ADD CONSTRAINT `fk_id_mentor` FOREIGN KEY (`id_mentor`) REFERENCES `mentor` (`id`),
  ADD CONSTRAINT `kelompok_bisnis_ibfk_1` FOREIGN KEY (`npm_ketua`) REFERENCES `mahasiswa` (`npm`);

--
-- Constraints for table `laporan_bisnis`
--
ALTER TABLE `laporan_bisnis`
  ADD CONSTRAINT `laporan_bisnis_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok_bisnis` (`id_kelompok`) ON DELETE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `fk_id_kelompok` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok_bisnis` (`id_kelompok`),
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mentor`
--
ALTER TABLE `mentor`
  ADD CONSTRAINT `mentor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  ADD CONSTRAINT `proposal_bisnis_ibfk_1` FOREIGN KEY (`kelompok_id`) REFERENCES `kelompok_bisnis` (`id_kelompok`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
