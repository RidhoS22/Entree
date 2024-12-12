-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 06:53 PM
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
(13, 10, '1402022068'),
(14, 10, '1402022040'),
(19, 14, '1402022060');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_mentor_bisnis`
--

CREATE TABLE `daftar_mentor_bisnis` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `deskripsi` varchar(30) NOT NULL,
  `kontak` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `daftar_mentor_bisnis`
--

INSERT INTO `daftar_mentor_bisnis` (`id`, `nama`, `deskripsi`, `kontak`) VALUES
(2, 'Asril', 'Mentor Bisnis', '098427928'),
(3, 'Fadly', 'Dosen pengampu', '08234234242'),
(4, 'Afandhi', 'Mentor Bisnis', '098427928'),
(6, 'Ridho', 'Mentor Bisnis', '082125352516'),
(7, 'Syavero', 'Dosen Pengampu', '08211351I248');

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
  `status` enum('menunggu','ditolak','disetujui','jadwal alternatif','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `nama_kegiatan`, `tanggal`, `waktu`, `agenda`, `lokasi`, `feedback_mentor`, `status`) VALUES
(14, 'Bimbingan 1', '2024-11-17', '21:44', 'Istilah deskripsi memang sudah tidak asing lagi. Jenis teks deskripsi ini bisa ditemukan di mana-mana. Ada banyak jenis-jenis teks di dalam sebuah tulisan. Pada dasarnya, deskripsi adalah menjabarkan tentang sesuatu.', 'Yarsi', '', 'jadwal alternatif'),
(15, 'Bimbingan 2', '2024-11-21', '10:00', 'ingiin membahas tentang sesuatu yang ada ', 'Ruang Rapat FTI', '', 'menunggu'),
(19, 'Bimbingan 3', '2024-12-04', '13:03', 'Bimbingan ', 'Ruang Rapat', '', 'ditolak'),
(20, 'bimbingan 4', '2024-12-13', '00:23', '1', '1', '', 'disetujui'),
(21, 'bimbingan 5', '2024-12-14', '00:22', 'q', '1', '', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_bisnis`
--

CREATE TABLE `kelompok_bisnis` (
  `id_kelompok` int(11) NOT NULL,
  `npm_ketua` varchar(20) DEFAULT NULL,
  `nama_kelompok` varchar(50) DEFAULT NULL,
  `nama_bisnis` varchar(50) DEFAULT NULL,
  `ide_bisnis` text DEFAULT NULL,
  `logo_bisnis` varchar(255) DEFAULT NULL,
  `mentor_bisnis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelompok_bisnis`
--

INSERT INTO `kelompok_bisnis` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `ide_bisnis`, `logo_bisnis`, `mentor_bisnis`) VALUES
(10, '1402022055', 'ArTech', 'BMW RENT', 'BMW RENT INDONESIA', 'BMW.svg_.png', 'Sr Rendhy'),
(14, '1402022044', 'MACAN', 'Bisnis Ikan', 'Menjual ikan dengan harga us dollar', '5a85e6b620358754a3b71b8cf0d23bc1.jpg', 'Lily Devita');

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `username` varchar(50) NOT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `aksi` varchar(50) DEFAULT NULL,
  `error_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_activity`
--

INSERT INTO `log_activity` (`id`, `timestamp`, `username`, `ip_address`, `user_agent`, `status`, `role`, `aksi`, `error_message`) VALUES
(19, '2024-12-09 07:48:17', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', ''),
(20, '2024-12-09 07:52:29', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(21, '2024-12-09 13:53:36', 'asril.affandhi', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah'),
(22, '2024-12-09 13:53:42', 'asril.affandhi', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(23, '2024-12-09 14:00:52', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah'),
(24, '2024-12-09 14:00:58', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', ''),
(25, '2024-12-09 14:05:22', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(26, '2024-12-09 15:06:33', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', ''),
(27, '2024-12-09 15:16:04', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(28, '2024-12-09 15:16:16', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah'),
(29, '2024-12-09 15:20:46', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(30, '2024-12-09 15:23:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(31, '2024-12-09 15:29:36', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(32, '2024-12-09 15:34:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(33, '2024-12-09 15:34:54', 'mahasiswa3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(34, '2024-12-09 15:35:35', 'mahasiswa3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(35, '2024-12-09 15:37:52', 'mahasiswa3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(36, '2024-12-11 11:57:26', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(37, '2024-12-11 13:34:34', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(38, '2024-12-11 14:24:43', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(39, '2024-12-11 16:00:29', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(40, '2024-12-11 18:40:39', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(41, '2024-12-11 18:47:37', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(42, '2024-12-11 18:53:39', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(43, '2024-12-11 19:07:28', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(44, '2024-12-11 19:07:48', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(45, '2024-12-11 19:08:03', 'asril.affandhi', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(46, '2024-12-11 19:08:50', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(47, '2024-12-11 19:20:31', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(48, '2024-12-11 19:29:31', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(49, '2024-12-11 19:50:31', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(50, '2024-12-11 22:29:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Tutor', 'Login', ''),
(51, '2024-12-12 01:59:40', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(52, '2024-12-12 08:38:04', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(53, '2024-12-12 21:32:05', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(54, '2024-12-12 21:32:14', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Tutor', 'Login', ''),
(55, '2024-12-12 21:33:21', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Mahasiswa', 'Login', ''),
(56, '2024-12-12 22:49:18', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Tutor', 'Login', ''),
(57, '2024-12-13 00:38:20', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'Login Berhasil', 'Tutor', 'Login', '');

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
  `tahun_angkatan` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `nama`, `npm`, `program_studi`, `tahun_angkatan`, `email`, `contact`) VALUES
(1, 1, 'Ridho Syahfero', '1402022055', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'ridhosyahfero35@gmail.com', '089645672224'),
(2, 6, 'Asril Affandhi', '1402022068', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'asrilaffandhi@gmail.com', '089645672223'),
(3, 7, 'Fadly Abdillah', '1402022040', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'ridhosyahfero35@gmail.com', '089645672244'),
(4, 8, 'Ruffino Noor', '1402022044', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'asrilaffandhi@gmail.com', '089637167775'),
(5, 9, 'Sharil Hamza', '1402022060', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'akunmllimitbruno@gmail.com', '089637162255'),
(6, 10, 'John Doe', '1402023001', 'Teknik Informatika', '2023/2024 Teknik Informatika', 'Johndoe@gmail.com', '087654327778');

-- --------------------------------------------------------

--
-- Table structure for table `materi_kewirausahaan`
--

CREATE TABLE `materi_kewirausahaan` (
  `id` int(11) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `file_path` varchar(300) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `materi_kewirausahaan`
--

INSERT INTO `materi_kewirausahaan` (`id`, `judul`, `file_path`, `deskripsi`) VALUES
(96, 'Materi Kewirausahaan', 'http://localhost/Aplikasi-Kewirausahaan/components/pages/admin/uploads/prospek-kerja-kuliah-jurusan-kewirausahaan-ytshorts.savetube.me.mp4', 'Tren wirausaha saat ini memang sedang naik. Semakin banyak pula anak muda yang terjun langsung menjadi seorang wirausahawan setelah menuntaskan masa kuliahnya.  Selama masa perkuliahan, mahasiswa Kewirausahaan akan mempelajari ruang lingkup usaha dan belajar membuat usaha sendiri di mulai dari yang kecil-kecilan. '),
(97, 'Konsep Kewirausahaan ', 'http://localhost/Aplikasi-Kewirausahaan/components/pages/admin/uploads/konsep-kewirausahaan-kuliah-gratis-prof-rhenald-kasali-ytshorts.savetube.me.mp4', 'Kuliah Gratis Prof Rhenald Kasali'),
(105, 'Konsep Dasar Kewirausahaan', 'http://localhost/Aplikasi-Kewirausahaan/components/pages/admin/uploads/0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf', 'Entrepreneur berasal dari bahasa Perancis yaitu entreprendre yang artinya memulai atau melaksanakan.'),
(106, 'Buku Modul Kewirausahaan', 'http://localhost/Aplikasi-Kewirausahaan/components/pages/admin/uploads/Buku-Modul-Kuliah-Kewirausahaan.pdf', 'Tidak ada bangsa yang sejahtera dan dihargai bangsa lain tanpa kemajuan ekonomi. Kemajuan ekonomi akan dapat dicapai jika ada spirit kewirausahaan yang kuat dari warga bangsanya.');

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
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`id`, `user_id`, `nama`, `nidn`, `email`, `contact`, `keahlian`, `fakultas`, `prodi`) VALUES
(1, 2, 'Sr Rendhy', '022456788', 'rendhyat@gmail.com', '089637167776', 'Entrepreneur', 'Kewirausahaan', 'Bisnis'),
(2, 13, 'Lily Devita', '02247896', 'ridhosyahfero35@gmail.com', '089637167773', 'Busineseman', 'Kewirausahaan', 'Bisnis');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_bisnis`
--

CREATE TABLE `proposal_bisnis` (
  `id` int(11) NOT NULL,
  `judul_proposal` varchar(255) NOT NULL,
  `tahapan_bisnis` enum('tahapan_awal','tahapan_bertumbuh') NOT NULL,
  `sdg` text NOT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `other_category` varchar(255) DEFAULT NULL,
  `proposal_pdf` varchar(255) NOT NULL,
  `kelompok_id` int(11) NOT NULL,
  `status` enum('menunggu','ditolak','disetujui') DEFAULT 'menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proposal_bisnis`
--

INSERT INTO `proposal_bisnis` (`id`, `judul_proposal`, `tahapan_bisnis`, `sdg`, `kategori`, `other_category`, `proposal_pdf`, `kelompok_id`, `status`) VALUES
(14, 'Ini bener nih', '', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'Bisnis Konstruksi dan Real Estate', '', 'uploads/Progres Kerja tanggal 25 November 2024 (1402022055) (1).pdf', 10, 'disetujui'),
(15, 'a', '', 'mengakhiri_kemiskinan,pendidikan_berkualitas', 'Bisnis Finansial', '', 'uploads/Progres Kerja tanggal 25 November 2024 (1402022055) (2).pdf', 10, 'menunggu'),
(16, 'a', '', 'mengakhiri_kemiskinan,mengakhiri_kelaparan,kesehatan_kesejahteraan', 'Bisnis Konstruksi dan Real Estate', '', 'uploads/Progres Kerja tanggal 25 November 2024 (1402022055) (2).pdf', 10, 'menunggu');

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
(1, 'ridho.syahfero', '$2y$10$b3QGkvFZHitvz1OFfRWZLOMtgtLA/fECvebDxcSwnpYupDSIMt93G', 'Mahasiswa', 0),
(2, 'akunMntr', '$2y$10$7aCTxTjDGfzG7N/3eVjrtO5g13wGc/RaqaDZbuZMRo7B/XHzKa3Me', 'Tutor', 1),
(3, 'akunAdmin', '$2y$10$NuIAAIWAu7axw6tIyD1HFuuV5F4hR.q7koI3VQF0KUHJWM7jc2z6K', 'Admin', 0),
(6, 'asril.affandhi', '$2y$10$R0cSSdyr.54ypvNZP5NmlO4l.6bqw9iXIrPXF3qiqcRPliIWC90M.', 'Mahasiswa', 0),
(7, 'fadly.abdillah', '$2y$10$k9swYB1RsxVfWqgjp8YU2O3Ekok8/VukQlUAyWrSJTeayY8EujeFi', 'Mahasiswa', 0),
(8, 'mahasiswa1', '$2y$10$uXNSNBz9vAwlD7AV4E1Qn.6DxK0zKygd1LuWcdgARKC/xBIHnXm5y', 'Mahasiswa', 0),
(9, 'mahasiswa2', '$2y$10$Jt7qe4u8hF2g6WjASB0XTey08sA3hHAna8VuU.P1yLoVIHI4whV/m', 'Mahasiswa', 0),
(10, 'mahasiswa3', '$2y$10$YFFZe1tX8Cq58eJTyJNNOOkIP7MS4U325GWQ2QsREj/hahNIPkTOG', 'Mahasiswa', 0),
(13, 'lily.admin', '$2y$10$myraeyhvLDu8j7iK09qyxOX6Dp8vy2ed4VmS3EJgodkXjrN4U6r4u', 'Dosen Pengampu', 0);

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
-- Indexes for table `daftar_mentor_bisnis`
--
ALTER TABLE `daftar_mentor_bisnis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  ADD PRIMARY KEY (`id_kelompok`),
  ADD KEY `npm_ketua` (`npm_ketua`);

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `npm` (`npm`),
  ADD UNIQUE KEY `unique_contact` (`contact`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `daftar_mentor_bisnis`
--
ALTER TABLE `daftar_mentor_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `materi_kewirausahaan`
--
ALTER TABLE `materi_kewirausahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `mentor`
--
ALTER TABLE `mentor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- Constraints for table `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  ADD CONSTRAINT `kelompok_bisnis_ibfk_1` FOREIGN KEY (`npm_ketua`) REFERENCES `mahasiswa` (`npm`);

--
-- Constraints for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD CONSTRAINT `log_activity_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
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
