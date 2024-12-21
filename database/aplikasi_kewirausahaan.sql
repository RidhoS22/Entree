-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Des 2024 pada 15.13
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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
-- Struktur dari tabel `anggota_kelompok`
--

CREATE TABLE `anggota_kelompok` (
  `id` int(11) NOT NULL,
  `id_kelompok` int(11) DEFAULT NULL,
  `npm_anggota` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota_kelompok`
--

INSERT INTO `anggota_kelompok` (`id`, `id_kelompok`, `npm_anggota`) VALUES
(25, 20, '1402023001'),
(26, 20, '1402022033'),
(27, 21, '1402022040'),
(28, 21, '1402022068');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(5) NOT NULL,
  `agenda` text NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `feedback_mentor` varchar(1000) NOT NULL,
  `status` enum('menunggu','ditolak','disetujui','jadwal alternatif','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `nama_kegiatan`, `tanggal`, `waktu`, `agenda`, `lokasi`, `feedback_mentor`, `status`) VALUES
(14, 'Bimbingan 1', '2024-11-17', '22:44', 'Istilah deskripsi memang sudah tidak asing lagi. Jenis teks deskripsi ini bisa ditemukan di mana-mana. Ada banyak jenis-jenis teks di dalam sebuah tulisan. Pada dasarnya, deskripsi adalah menjabarkan tentang sesuatu.', 'Yarsi', '', 'jadwal alternatif'),
(15, 'Bimbingan 2', '2024-11-21', '10:00', 'ingiin membahas tentang sesuatu yang ada ', 'Ruang Rapat FTI', '', 'menunggu'),
(19, 'Bimbingan 3', '2024-12-04', '13:03', 'Bimbingan ', 'Ruang Rapat', '', 'ditolak'),
(20, 'bimbingan 4', '2024-12-13', '00:23', '1', '1', '', 'disetujui'),
(21, 'bimbingan 5', '2024-12-14', '00:22', 'q', '1', '', 'selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_bisnis`
--

CREATE TABLE `kelompok_bisnis` (
  `id_kelompok` int(11) NOT NULL,
  `npm_ketua` varchar(20) DEFAULT NULL,
  `nama_kelompok` varchar(50) DEFAULT NULL,
  `nama_bisnis` varchar(50) DEFAULT NULL,
  `logo_bisnis` varchar(255) DEFAULT NULL,
  `mentor_bisnis` varchar(255) DEFAULT NULL,
  `tahun_akademik_id` int(11) DEFAULT NULL,
  `kategori_bisnis` varchar(255) DEFAULT NULL,
  `sdg` varchar(255) DEFAULT NULL,
  `ide_bisnis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelompok_bisnis`
--

INSERT INTO `kelompok_bisnis` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `logo_bisnis`, `mentor_bisnis`, `tahun_akademik_id`, `kategori_bisnis`, `sdg`, `ide_bisnis`) VALUES
(20, '1402022071', 'a', 'a', 'hq720.jpg', 'CONTOH 2', 18, 'Bisnis Pariwisata dan Perhotelan', 'mengakhiri_kemiskinan,kesehatan_kesejahteraan', 'BUBUR KACA IJO TAPI KACANGNYA DI GANTI WIJEN'),
(21, '1402022055', 'ArTech', 'Bisnis BMW Indo Only', 'BMW.svg_.png', 'CONTOH 1', 18, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_activity`
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
  `logout_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_activity`
--

INSERT INTO `log_activity` (`id`, `timestamp`, `username`, `ip_address`, `user_agent`, `status`, `role`, `aksi`, `error_message`, `logout_time`) VALUES
(31, '2024-12-17 06:18:34', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:18:42'),
(32, '2024-12-17 06:21:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:24:00'),
(33, '2024-12-17 06:24:06', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(34, '2024-12-17 06:31:30', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:31:40'),
(35, '2024-12-17 06:31:49', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(36, '2024-12-17 06:39:43', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL),
(37, '2024-12-17 07:06:24', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL),
(38, '2024-12-17 07:12:19', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL),
(39, '2024-12-17 07:12:36', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL),
(40, '2024-12-17 07:12:42', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(41, '2024-12-17 07:13:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL),
(42, '2024-12-17 07:13:13', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(43, '2024-12-17 07:13:31', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL),
(44, '2024-12-17 07:54:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(45, '2024-12-17 07:54:57', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL),
(46, '2024-12-17 08:22:00', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:11:54'),
(47, '2024-12-17 08:37:00', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:11:54'),
(48, '2024-12-17 09:12:07', 'fitra.rama', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL),
(49, '2024-12-17 09:12:21', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:21:08'),
(50, '2024-12-17 09:21:14', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:24:51'),
(51, '2024-12-17 09:25:05', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:25:18'),
(52, '2024-12-17 09:25:28', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(53, '2024-12-17 10:58:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(54, '2024-12-17 11:43:28', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(55, '2024-12-17 13:39:52', 'einstein', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 13:44:39'),
(56, '2024-12-17 13:44:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(57, '2024-12-17 19:59:37', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(58, '2024-12-17 20:02:56', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 20:04:56'),
(59, '2024-12-17 20:05:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(60, '2024-12-17 20:35:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 20:42:26'),
(61, '2024-12-17 20:42:34', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL),
(62, '2024-12-17 20:45:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:08:58'),
(63, '2024-12-17 20:45:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:08:58'),
(64, '2024-12-17 21:09:05', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:09:53'),
(65, '2024-12-17 21:10:01', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:26:56'),
(66, '2024-12-19 14:51:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 14:54:45'),
(67, '2024-12-19 14:54:51', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL),
(68, '2024-12-19 14:54:59', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(69, '2024-12-19 14:58:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(70, '2024-12-19 14:58:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(71, '2024-12-19 15:00:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:08:36'),
(72, '2024-12-19 15:08:43', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:22:00'),
(73, '2024-12-19 15:22:26', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:26:06'),
(74, '2024-12-19 15:26:12', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:54:00'),
(75, '2024-12-19 15:54:13', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 16:08:48'),
(76, '2024-12-19 16:09:00', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(77, '2024-12-19 16:41:12', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 16:42:10'),
(78, '2024-12-19 16:42:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 16:43:07'),
(79, '2024-12-19 16:43:16', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:21:06'),
(80, '2024-12-19 17:21:13', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:22:17'),
(81, '2024-12-19 17:22:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:44:04'),
(82, '2024-12-19 17:44:13', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:51:15'),
(83, '2024-12-19 17:51:21', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:51:26'),
(84, '2024-12-19 17:51:40', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:53:26'),
(85, '2024-12-19 17:53:35', 'asril.affandhi', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:54:00'),
(86, '2024-12-19 17:54:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 17:55:46'),
(87, '2024-12-19 17:55:53', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(88, '2024-12-19 18:43:48', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 18:45:15'),
(89, '2024-12-19 18:45:21', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(90, '2024-12-19 18:52:36', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 18:54:00'),
(91, '2024-12-19 18:54:08', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(92, '2024-12-19 18:54:33', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 19:21:40'),
(93, '2024-12-19 19:21:46', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(94, '2024-12-19 19:45:55', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 19:48:57'),
(95, '2024-12-19 19:49:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(96, '2024-12-19 20:01:21', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(97, '2024-12-19 20:06:30', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:07:13'),
(98, '2024-12-19 20:10:26', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:10:31'),
(99, '2024-12-19 20:10:56', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:11:01'),
(100, '2024-12-19 20:11:09', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(101, '2024-12-19 20:13:22', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(102, '2024-12-19 20:18:11', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(103, '2024-12-19 20:19:45', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(104, '2024-12-19 20:27:50', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(105, '2024-12-19 20:35:35', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(106, '2024-12-19 20:37:25', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(107, '2024-12-19 20:38:36', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(108, '2024-12-19 20:55:58', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:56:12'),
(109, '2024-12-19 20:56:21', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(110, '2024-12-19 20:59:03', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:59:25'),
(111, '2024-12-19 20:59:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(112, '2024-12-19 21:01:41', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL),
(113, '2024-12-19 21:01:46', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(114, '2024-12-20 05:18:41', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-20 06:15:08'),
(115, '2024-12-20 05:59:25', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(116, '2024-12-20 06:03:41', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(117, '2024-12-20 06:11:26', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(118, '2024-12-20 06:12:15', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(119, '2024-12-20 06:12:51', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(120, '2024-12-20 06:13:18', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-20 06:15:08'),
(121, '2024-12-20 06:15:15', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:17:58'),
(122, '2024-12-20 06:17:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(123, '2024-12-20 06:19:04', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(124, '2024-12-20 06:19:57', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL),
(125, '2024-12-21 04:41:31', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 05:21:56'),
(126, '2024-12-21 05:22:12', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(127, '2024-12-21 05:37:40', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(128, '2024-12-21 05:38:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(129, '2024-12-21 05:40:43', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(130, '2024-12-21 05:48:56', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(131, '2024-12-21 05:58:19', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(132, '2024-12-21 06:17:43', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(133, '2024-12-21 06:20:26', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(134, '2024-12-21 06:36:54', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 06:38:28'),
(135, '2024-12-21 06:38:34', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(136, '2024-12-21 07:24:05', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(137, '2024-12-21 08:13:47', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:16:24'),
(138, '2024-12-21 08:16:32', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:17:58'),
(139, '2024-12-21 08:18:05', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(140, '2024-12-21 08:20:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(141, '2024-12-21 08:23:06', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(142, '2024-12-21 08:24:40', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(143, '2024-12-21 08:37:15', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(144, '2024-12-21 08:41:39', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(145, '2024-12-21 10:06:16', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(146, '2024-12-21 10:06:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(147, '2024-12-21 10:09:08', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(148, '2024-12-21 10:09:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(149, '2024-12-21 10:15:45', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 10:19:39'),
(150, '2024-12-21 10:19:52', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(151, '2024-12-21 10:41:10', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:49:53'),
(152, '2024-12-21 10:41:39', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(153, '2024-12-21 11:29:35', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(154, '2024-12-21 11:39:14', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(155, '2024-12-21 11:39:44', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(156, '2024-12-21 13:25:12', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:25:56'),
(157, '2024-12-21 13:26:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(158, '2024-12-21 13:46:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:49:53'),
(159, '2024-12-21 13:49:58', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:52:28'),
(160, '2024-12-21 13:52:32', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:54:06'),
(161, '2024-12-21 13:54:10', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:54:20'),
(162, '2024-12-21 13:54:25', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(163, '2024-12-21 13:55:53', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:57:47'),
(164, '2024-12-21 13:57:53', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(165, '2024-12-21 14:00:17', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(166, '2024-12-21 14:01:46', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(167, '2024-12-21 14:02:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL),
(168, '2024-12-21 14:03:55', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 14:06:25'),
(169, '2024-12-21 14:06:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL),
(170, '2024-12-21 14:10:30', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `npm` varchar(15) NOT NULL,
  `program_studi` varchar(100) NOT NULL,
  `tahun_angkatan` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `fakultas` varchar(100) DEFAULT NULL,
  `id_kelompok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `nama`, `npm`, `program_studi`, `tahun_angkatan`, `email`, `contact`, `fakultas`, `id_kelompok`) VALUES
(1, 1, 'Ridho Syahfero', '1402022055', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'ridhosyahfero5@gmail.com', '089645672220', NULL, 21),
(2, 6, 'Asril Affandhi', '1402022068', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'asrilaffandhi@gmail.com', '089645672223', NULL, 21),
(3, 7, 'Fadly Abdillah', '1402022040', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'ridhosyahfero8@gmail.com', '089645672244', NULL, 21),
(4, 8, 'Ruffino Noor', '1402022044', 'Teknik Informatika', '2022/2023 Teknik Informatika', '', '', 'Teknik Informasi', NULL),
(5, 9, 'Sharil Hamza', '1402022060', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'akunmllimitbruno@gmail.com', '089637162255', NULL, NULL),
(6, 10, 'John Doe', '1402023001', 'Teknik Informatika', '2023/2024 Teknik Informatika', 'Johndoe@gmail.com', '087654327778', NULL, 20),
(9, 19, 'ridho odir', '1402022071', 'Teknik Informatika', '2022 / 2023 Ganjil (Semester 5)', 'bcakun71@gmail.com', '0897653617', 'Fakultas Teknologi Informasi', 20),
(10, 20, 'fitra rama', '1402022033', 'Teknik Informatika', '2022 / 2023 Ganjil (Semester 5)', 'riskyarur@gmail.com', '08963546662', 'Fakultas Teknologi Informasi', 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi_kewirausahaan`
--

CREATE TABLE `materi_kewirausahaan` (
  `id` int(11) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `file_path` varchar(300) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `materi_kewirausahaan`
--

INSERT INTO `materi_kewirausahaan` (`id`, `judul`, `file_path`, `deskripsi`) VALUES
(96, 'Materi Kewirausahaan', 'http://localhost/Aplikasi-Kewirausahaan/components/pages/admin/uploads/prospek-kerja-kuliah-jurusan-kewirausahaan-ytshorts.savetube.me.mp4', 'Tren wirausaha saat ini memang sedang naik. Semakin banyak pula anak muda yang terjun langsung menjadi seorang wirausahawan setelah menuntaskan masa kuliahnya.  Selama masa perkuliahan, mahasiswa Kewirausahaan akan mempelajari ruang lingkup usaha dan belajar membuat usaha sendiri di mulai dari yang kecil-kecilan. '),
(97, 'Konsep Kewirausahaan ', 'http://localhost/Aplikasi-Kewirausahaan/components/pages/admin/uploads/konsep-kewirausahaan-kuliah-gratis-prof-rhenald-kasali-ytshorts.savetube.me.mp4', 'Kuliah Gratis Prof Rhenald Kasali'),
(105, 'Konsep Dasar Kewirausahaan', 'http://localhost/Aplikasi-Kewirausahaan/components/pages/admin/uploads/0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf', 'Entrepreneur berasal dari bahasa Perancis yaitu entreprendre yang artinya memulai atau melaksanakan.'),
(106, 'Buku Modul Kewirausahaan', 'http://localhost/Aplikasi-Kewirausahaan/components/pages/admin/uploads/Buku-Modul-Kuliah-Kewirausahaan.pdf', 'Tidak ada bangsa yang sejahtera dan dihargai bangsa lain tanpa kemajuan ekonomi. Kemajuan ekonomi akan dapat dicapai jika ada spirit kewirausahaan yang kuat dari warga bangsanya.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mentor`
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
-- Dumping data untuk tabel `mentor`
--

INSERT INTO `mentor` (`id`, `user_id`, `nama`, `nidn`, `email`, `contact`, `keahlian`, `fakultas`, `prodi`, `foto_profile`) VALUES
(1, 2, 'CONTOH 1', '022456788', 'rendhyat@gmail.com', '089637167773', 'Entrepreneur', 'Kewirausahaan', 'Bisnis', '/Aplikasi-Kewirausahaan/components/pages/mentorbisnis/uploads/mentr.jpg'),
(2, 13, 'CONTOH 2', '02247896', 'ridhosyahfero35@gmail.com', '089637167673', 'Busineseman', 'Kewirausahaan', 'Bisnis', '/Aplikasi-Kewirausahaan/components/pages/mentorbisnis/uploads/mentr.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `proposal_bisnis`
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
-- Dumping data untuk tabel `proposal_bisnis`
--

INSERT INTO `proposal_bisnis` (`id`, `judul_proposal`, `tahapan_bisnis`, `sdg`, `kategori`, `other_category`, `proposal_pdf`, `kelompok_id`, `status`, `ide_bisnis`, `feedback`) VALUES
(22, 'proposal 1', 'Tahapan Awal', 'mengakhiri_kemiskinan,kesehatan_kesejahteraan', 'Bisnis Pariwisata dan Perhotelan', '', '/Aplikasi-Kewirausahaan/components/pages/mahasiswa/uploads/Progres Kerja tanggal 16 December 2024 (1402022055).pdf', 20, 'disetujui', 'BUBUR KACA IJO TAPI KACANGNYA DI GANTI WIJEN', 'Proposal memiliki makna dan arti yang bagus'),
(27, 'Proposal Pertama', 'Tahapan Awal', 'mengakhiri_kelaparan,energi_bersih_terjangkau,konsumsi_produksi_bertanggung_jawab', 'Bisnis Dagang (Perdagangan)', '', 'uploads/Progres Kerja tanggal 18 December 2024 (1402022055).pdf', 21, 'ditolak', NULL, NULL),
(28, 'Proposal Kedua', 'Tahapan Bertumbuh', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'Bisnis Energi dan Lingkungan', '', 'uploads/Progres Kerja tanggal 16 December 2024 (1402022055).pdf', 21, 'disetujui', NULL, NULL),
(29, 'Proposal Ketiga', 'Tahapan Awal', 'pendidikan_berkualitas,kesetaraan_gender,air_bersih_sanitasi', 'lainnya', 'Test DB', 'uploads/Progres Kerja tanggal 12 December 2024 (1402022055).pdf', 21, 'ditolak', NULL, NULL),
(30, 'Proposal Kedua', 'Tahapan Awal', 'mengakhiri_kemiskinan,pendidikan_berkualitas', 'Bisnis Konstruksi dan Real Estate', '', 'uploads/Progres Kerja tanggal 18 December 2024 (1402022055).pdf', 20, 'ditolak', 'TEST', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id` int(11) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `jenis_tahun` enum('Ganjil','Genap') NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tahun_akademik`
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
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Mahasiswa','Tutor','Dosen Pengampu','Admin') NOT NULL,
  `first_login` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `first_login`) VALUES
(1, 'ridho.syahfero', '$2y$10$b3QGkvFZHitvz1OFfRWZLOMtgtLA/fECvebDxcSwnpYupDSIMt93G', 'Mahasiswa', 0),
(2, 'akunMntr', '$2y$10$7aCTxTjDGfzG7N/3eVjrtO5g13wGc/RaqaDZbuZMRo7B/XHzKa3Me', 'Dosen Pengampu', 0),
(3, 'akunAdmin', '$2y$10$NuIAAIWAu7axw6tIyD1HFuuV5F4hR.q7koI3VQF0KUHJWM7jc2z6K', 'Admin', 0),
(6, 'asril.affandhi', '$2y$10$R0cSSdyr.54ypvNZP5NmlO4l.6bqw9iXIrPXF3qiqcRPliIWC90M.', 'Mahasiswa', 0),
(7, 'fadly.abdillah', '$2y$10$k9swYB1RsxVfWqgjp8YU2O3Ekok8/VukQlUAyWrSJTeayY8EujeFi', 'Mahasiswa', 0),
(8, 'mahasiswa1', '$2y$10$uXNSNBz9vAwlD7AV4E1Qn.6DxK0zKygd1LuWcdgARKC/xBIHnXm5y', 'Mahasiswa', 1),
(9, 'mahasiswa2', '$2y$10$Jt7qe4u8hF2g6WjASB0XTey08sA3hHAna8VuU.P1yLoVIHI4whV/m', 'Mahasiswa', 0),
(10, 'mahasiswa3', '$2y$10$YFFZe1tX8Cq58eJTyJNNOOkIP7MS4U325GWQ2QsREj/hahNIPkTOG', 'Mahasiswa', 0),
(13, 'lily.admin', '$2y$10$myraeyhvLDu8j7iK09qyxOX6Dp8vy2ed4VmS3EJgodkXjrN4U6r4u', 'Tutor', 0),
(19, 'einsteins', '$2y$10$Jb6XVt2bJMTkMj0/nbpPJu3HGFnEgzaEK4OsWJyqZBFXKwlPWeFu.', 'Mahasiswa', 0),
(20, 'fitra.rama', '$2y$10$flIOsaEwvG7ib/T9YAKMmuSWxbO4zl19kJ/3yAD3YNxgR7r78lR6G', 'Mahasiswa', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota_kelompok`
--
ALTER TABLE `anggota_kelompok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelompok` (`id_kelompok`),
  ADD KEY `npm_anggota` (`npm_anggota`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  ADD PRIMARY KEY (`id_kelompok`),
  ADD KEY `npm_ketua` (`npm_ketua`);

--
-- Indeks untuk tabel `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `npm` (`npm`),
  ADD UNIQUE KEY `unique_contact` (`contact`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_id_kelompok` (`id_kelompok`);

--
-- Indeks untuk tabel `materi_kewirausahaan`
--
ALTER TABLE `materi_kewirausahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mentor`
--
ALTER TABLE `mentor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nidn` (`nidn`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelompok_id` (`kelompok_id`);

--
-- Indeks untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota_kelompok`
--
ALTER TABLE `anggota_kelompok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `materi_kewirausahaan`
--
ALTER TABLE `materi_kewirausahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT untuk tabel `mentor`
--
ALTER TABLE `mentor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anggota_kelompok`
--
ALTER TABLE `anggota_kelompok`
  ADD CONSTRAINT `anggota_kelompok_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok_bisnis` (`id_kelompok`) ON DELETE CASCADE,
  ADD CONSTRAINT `anggota_kelompok_ibfk_2` FOREIGN KEY (`npm_anggota`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  ADD CONSTRAINT `kelompok_bisnis_ibfk_1` FOREIGN KEY (`npm_ketua`) REFERENCES `mahasiswa` (`npm`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `fk_id_kelompok` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok_bisnis` (`id_kelompok`),
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mentor`
--
ALTER TABLE `mentor`
  ADD CONSTRAINT `mentor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  ADD CONSTRAINT `proposal_bisnis_ibfk_1` FOREIGN KEY (`kelompok_id`) REFERENCES `kelompok_bisnis` (`id_kelompok`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
