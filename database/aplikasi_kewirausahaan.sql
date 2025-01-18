-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jan 2025 pada 11.09
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
(33, 26, '1402022044'),
(34, 26, '1402022060'),
(36, 28, '1402016053'),
(40, 31, '1402022045'),
(46, 36, '1402022070');

--
-- Trigger `anggota_kelompok`
--
DELIMITER $$
CREATE TRIGGER `after_insert_anggota_kelompok` AFTER INSERT ON `anggota_kelompok` FOR EACH ROW BEGIN
    INSERT INTO anggota_kelompok_backup (
        id, id_kelompok, npm_anggota
    ) VALUES (
        NEW.id, NEW.id_kelompok, NEW.npm_anggota
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_anggota_kelompok` AFTER UPDATE ON `anggota_kelompok` FOR EACH ROW BEGIN
    UPDATE anggota_kelompok_backup
    SET 
        id_kelompok = NEW.id_kelompok,
        npm_anggota = NEW.npm_anggota
    WHERE id = NEW.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota_kelompok_backup`
--

CREATE TABLE `anggota_kelompok_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `id_kelompok` int(11) DEFAULT NULL,
  `npm_anggota` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota_kelompok_backup`
--

INSERT INTO `anggota_kelompok_backup` (`id`, `id_kelompok`, `npm_anggota`) VALUES
(25, 20, '1402023001'),
(26, 20, '1402022033'),
(32, 25, '1402022040'),
(33, 26, '1402022044'),
(34, 26, '1402022060'),
(35, 27, '1502022028'),
(36, 28, '1402016053'),
(37, 29, '1402022040'),
(38, 30, '1402022040'),
(39, 30, '1502022028'),
(40, 31, '1402022045'),
(41, 32, '1402022040'),
(42, 33, '1402022040'),
(43, 34, '1402022040'),
(44, 34, '1402022070'),
(45, 35, '1402022070'),
(46, 36, '1402022070'),
(47, 37, '1402022033'),
(48, 38, '1402022063');

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
  `feedback_mentor` varchar(2000) NOT NULL,
  `status` enum('menunggu','ditolak','disetujui','alternatif','selesai') NOT NULL,
  `bukti_kegiatan` varchar(255) DEFAULT NULL,
  `id_klmpk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `nama_kegiatan`, `tanggal`, `waktu`, `agenda`, `lokasi`, `feedback_mentor`, `status`, `bukti_kegiatan`, `id_klmpk`) VALUES
(42, 'Bimbingan satu', '2024-12-17', '08:02', 'Bimbingan', 'Kantin', 'bagus', 'selesai', NULL, 26),
(46, 'Tes', '2025-01-21', '13:28', 'kandknd', 'tenmer', '', 'disetujui', NULL, 26),
(47, 'Bimbingan 1', '2025-01-11', '15:45', 'Membahas masalah yang sedang terjadi', 'Gedung Yarsi', '', 'disetujui', NULL, 28),
(48, 'Bimbingan 1', '2025-01-13', '16:56', 'Bimbingan', 'Takana', '', 'disetujui', NULL, 31),
(50, 'Bimbingan 2', '2025-01-13', '15:48', 'Today is the day', 'Tenmer', '', 'disetujui', NULL, 28),
(51, 'Bimbingan 3', '2025-01-13', '15:50', 'aksn', 'arkansas', '', 'disetujui', NULL, 28),
(53, 'Bimbingan 3', '2025-01-13', '16:02', 'Membahas masalah', 'Yarsi', '', 'disetujui', NULL, 31),
(54, 'Membahas Proposal 1', '2025-01-13', '17:04', 'Membahas masalah pada proposal kelompok kamu', 'Yarsi', '', 'disetujui', NULL, 28);

--
-- Trigger `jadwal`
--
DELIMITER $$
CREATE TRIGGER `after_insert_jadwal` AFTER INSERT ON `jadwal` FOR EACH ROW BEGIN
    INSERT INTO jadwal_backup (
        id, nama_kegiatan, tanggal, waktu, agenda, lokasi, feedback_mentor, 
        status, bukti_kegiatan, id_klmpk
    ) VALUES (
        NEW.id, NEW.nama_kegiatan, NEW.tanggal, NEW.waktu, NEW.agenda, 
        NEW.lokasi, NEW.feedback_mentor, NEW.status, NEW.bukti_kegiatan, NEW.id_klmpk
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_jadwal` AFTER UPDATE ON `jadwal` FOR EACH ROW BEGIN
    UPDATE jadwal_backup
    SET 
        nama_kegiatan = NEW.nama_kegiatan,
        tanggal = NEW.tanggal,
        waktu = NEW.waktu,
        agenda = NEW.agenda,
        lokasi = NEW.lokasi,
        feedback_mentor = NEW.feedback_mentor,
        status = NEW.status,
        bukti_kegiatan = NEW.bukti_kegiatan,
        id_klmpk = NEW.id_klmpk
    WHERE id = NEW.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_backup`
--

CREATE TABLE `jadwal_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `nama_kegiatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `agenda` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `feedback_mentor` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('menunggu','ditolak','disetujui','alternatif','selesai') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bukti_kegiatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_klmpk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal_backup`
--

INSERT INTO `jadwal_backup` (`id`, `nama_kegiatan`, `tanggal`, `waktu`, `agenda`, `lokasi`, `feedback_mentor`, `status`, `bukti_kegiatan`, `id_klmpk`) VALUES
(26, 'TESTER 2', '2024-12-13', '20:30', 'BIMBINGAN 1', 'Yarsi', '', 'menunggu', NULL, 20),
(31, 'Bimbingan 2', '2024-12-12', '20:36', 'jabs', 'Yarsi', '', 'ditolak', NULL, 20),
(34, 'Bimbingan seterusnya', '2024-12-11', '21:02', 'jadkaknd', 'Yarsi', '', 'menunggu', NULL, 20),
(35, 'Bimbingan 1', '2024-12-19', '04:41', 'jandand', 'Kantin', '', 'menunggu', NULL, 25),
(36, 'kokoko', '2024-12-18', '23:13', 'ijmbjkh', 'ujj', '', 'menunggu', NULL, 25),
(37, 'sadksn', '2024-12-13', '21:23', 'as,', 'Takana', 'ts', 'disetujui', NULL, 25),
(38, 'jsd', '2024-12-04', '14:22', 'sdds', 'dka', 'tes', 'selesai', 'uploads/bukti_kegiatan/CV English Task.pdf', 20),
(39, 'dknd', '2024-12-11', '17:42', 'asada', 'Tenmer', '', 'disetujui', NULL, 20),
(40, 'BIMBINGAN', '2024-12-15', '05:32', 'Bimbingan ke 10', 'YARSI', '', 'disetujui', NULL, 20),
(42, 'Bimbingan satu', '2024-12-17', '08:02', 'Bimbingan', 'Kantin', 'bagus', 'selesai', NULL, 26),
(43, 'nadnkdnak', '2025-01-24', '16:18', 'slkaknd', 'ams m a', '', 'menunggu', NULL, 20),
(44, 'akndknadas', '2025-01-16', '05:18', 'ajda', 'mak smd', '', 'menunggu', NULL, 20),
(45, 'adad', '2025-01-21', '12:55', 'xma a', 'Tenmer', '', 'disetujui', NULL, 20),
(46, 'Tes', '2025-01-21', '13:28', 'kandknd', 'tenmer', '', 'disetujui', NULL, 26),
(47, 'Bimbingan 1', '2025-01-11', '15:45', 'Membahas masalah yang sedang terjadi', 'Gedung Yarsi', '', 'disetujui', NULL, 28),
(48, 'Bimbingan 1', '2025-01-13', '16:56', 'Bimbingan', 'Takana', '', 'disetujui', NULL, 31),
(49, 'asnknas', '2025-01-21', '15:50', 'asnks', 'as', '', 'disetujui', NULL, 20),
(50, 'Bimbingan 2', '2025-01-13', '15:48', 'Today is the day', 'Tenmer', '', 'disetujui', NULL, 28),
(51, 'Bimbingan 3', '2025-01-13', '15:50', 'aksn', 'arkansas', '', 'disetujui', NULL, 28),
(52, 'Bimbingan 10', '2025-01-13', '15:56', 'Kitto', 'Japan', '', 'disetujui', NULL, 20),
(53, 'Bimbingan 3', '2025-01-13', '16:02', 'Membahas masalah', 'Yarsi', '', 'disetujui', NULL, 31),
(54, 'Membahas Proposal 1', '2025-01-13', '17:04', 'Membahas masalah pada proposal kelompok kamu', 'Yarsi', '', 'disetujui', NULL, 28),
(55, 'Bimbingan 1', '2025-01-18', '13:54', 'Bimbingan awal', 'Yarsi', '', 'disetujui', NULL, 35),
(56, 'Bimbingan 1', '2025-01-18', '14:10', 'Bimbingan awal', 'Lantai 5 Yarsi', '', 'disetujui', NULL, 20);

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
  `tahun_akademik_id` int(11) DEFAULT NULL,
  `kategori_bisnis` varchar(255) DEFAULT NULL,
  `sdg` varchar(255) DEFAULT NULL,
  `ide_bisnis` varchar(255) DEFAULT NULL,
  `id_mentor` int(11) DEFAULT NULL,
  `status_inkubasi` enum('direkomendasikan','disetujui','ditolak','masuk','tidak masuk') DEFAULT NULL,
  `status_kelompok_bisnis` enum('aktif','tidak aktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelompok_bisnis`
--

INSERT INTO `kelompok_bisnis` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `logo_bisnis`, `tahun_akademik_id`, `kategori_bisnis`, `sdg`, `ide_bisnis`, `id_mentor`, `status_inkubasi`, `status_kelompok_bisnis`) VALUES
(26, '1402022068', 'ArTech', 'Bisnis Ikan', 'BMW.svg_.png', 18, 'Bisnis Konstruksi dan Real Estate', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'TES', 1, 'disetujui', 'aktif'),
(28, '1402022013', 'Cappo', 'Bisnis Ayam', 'ayam.jpg', 18, NULL, NULL, NULL, 1, 'masuk', 'aktif'),
(31, '1402022022', 'Saturn', 'Bisnis Ayam', 'ayam.jpg', 18, 'Bisnis Energi dan Lingkungan', 'pendidikan_berkualitas,kesetaraan_gender', 'tes', 1, 'direkomendasikan', 'aktif'),
(36, '1402022071', 'KACANG', 'Herry', '13.png', 18, NULL, NULL, NULL, NULL, NULL, 'aktif');

--
-- Trigger `kelompok_bisnis`
--
DELIMITER $$
CREATE TRIGGER `after_kelompok_bisnis_insert` AFTER INSERT ON `kelompok_bisnis` FOR EACH ROW BEGIN
  INSERT INTO kelompok_bisnis_backup 
  (id_kelompok, npm_ketua, nama_kelompok, nama_bisnis, logo_bisnis, tahun_akademik_id, kategori_bisnis, sdg, ide_bisnis, id_mentor, status_inkubasi, status_kelompok_bisnis)
  VALUES 
  (NEW.id_kelompok, NEW.npm_ketua, NEW.nama_kelompok, NEW.nama_bisnis, NEW.logo_bisnis, NEW.tahun_akademik_id, NEW.kategori_bisnis, NEW.sdg, NEW.ide_bisnis, NEW.id_mentor, NEW.status_inkubasi, NEW.status_kelompok_bisnis);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_kelompok_bisnis_update` AFTER UPDATE ON `kelompok_bisnis` FOR EACH ROW BEGIN
  UPDATE kelompok_bisnis_backup
  SET 
    npm_ketua = NEW.npm_ketua,
    nama_kelompok = NEW.nama_kelompok,
    nama_bisnis = NEW.nama_bisnis,
    logo_bisnis = NEW.logo_bisnis,
    tahun_akademik_id = NEW.tahun_akademik_id,
    kategori_bisnis = NEW.kategori_bisnis,
    sdg = NEW.sdg,
    ide_bisnis = NEW.ide_bisnis,
    id_mentor = NEW.id_mentor,
    status_inkubasi = NEW.status_inkubasi,
    status_kelompok_bisnis = NEW.status_kelompok_bisnis
  WHERE id_kelompok = NEW.id_kelompok;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_bisnis_backup`
--

CREATE TABLE `kelompok_bisnis_backup` (
  `id_kelompok` int(11) NOT NULL,
  `npm_ketua` varchar(20) DEFAULT NULL,
  `nama_kelompok` varchar(50) DEFAULT NULL,
  `nama_bisnis` varchar(50) DEFAULT NULL,
  `logo_bisnis` varchar(255) DEFAULT NULL,
  `tahun_akademik_id` int(11) DEFAULT NULL,
  `kategori_bisnis` varchar(255) DEFAULT NULL,
  `sdg` varchar(255) DEFAULT NULL,
  `ide_bisnis` varchar(255) DEFAULT NULL,
  `id_mentor` int(11) DEFAULT NULL,
  `status_inkubasi` enum('direkomendasikan','disetujui','ditolak','masuk','tidak masuk') DEFAULT NULL,
  `status_kelompok_bisnis` enum('aktif','tidak aktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelompok_bisnis_backup`
--

INSERT INTO `kelompok_bisnis_backup` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `logo_bisnis`, `tahun_akademik_id`, `kategori_bisnis`, `sdg`, `ide_bisnis`, `id_mentor`, `status_inkubasi`, `status_kelompok_bisnis`) VALUES
(20, '1402022071', 'MACANS', 'a', 'hq720.jpg', 18, 'Bisnis Teknologi atau Digital', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'TESTER', 1, 'ditolak', 'tidak aktif'),
(25, '1402022055', 'TESTER', 'BISNIS AYAM', 'wlpper.jpg', 17, NULL, NULL, NULL, 2, '', 'tidak aktif'),
(26, '1402022068', 'ArTech', 'Bisnis Ikan', 'BMW.svg_.png', 18, 'Bisnis Konstruksi dan Real Estate', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'TES', 1, 'disetujui', 'aktif'),
(28, '1402022013', 'Cappo', 'Bisnis Ayam', 'ayam.jpg', 18, NULL, NULL, NULL, 1, 'masuk', 'aktif'),
(30, '1402022055', 'IYADEH', 'Bisnis Kerapus', 'wlpper.jpg', 18, NULL, NULL, NULL, NULL, NULL, 'tidak aktif'),
(31, '1402022022', 'Saturn', 'Bisnis Ayam', 'ayam.jpg', 18, 'Bisnis Energi dan Lingkungan', 'pendidikan_berkualitas,kesetaraan_gender', 'tes', 1, 'direkomendasikan', 'aktif'),
(32, '1402022055', 'Kentro', 'Bisnis', 'localhost_Aplikasi-Kewirausahaan_components_pages_mahasiswa_profil_mahasiswa.php(iPhone SE).png', 18, NULL, NULL, NULL, 2, 'disetujui', 'tidak aktif'),
(33, '1402022055', 'ksans', 'sans', 'wlpper.jpg', 18, NULL, NULL, NULL, NULL, NULL, 'tidak aktif'),
(34, '1402022055', 'Heroic', 'HEROIC TEST', '1736842703_ayam.jpg', 18, NULL, NULL, NULL, NULL, NULL, 'tidak aktif'),
(35, '1402022055', 'ArTech', 'Bisnis Ayam', 'ayam.jpg', 18, 'Bisnis Dagang (Perdagangan)', 'mengakhiri_kelaparan,kesehatan_kesejahteraan', 'Bisnis Ayam', 2, 'masuk', 'tidak aktif'),
(36, '1402022071', 'KACANG', 'Herry', '13.png', 18, NULL, NULL, NULL, NULL, NULL, 'aktif'),
(37, '1402022055', 'andknd', 'aks', '14.png', 18, NULL, NULL, NULL, NULL, NULL, 'tidak aktif'),
(38, '1402022055', 'Kelompok Kacau', 'aksnaks', 'White_and_Blue_Illustrative_Class_Logo-removebg-preview.png', 18, NULL, NULL, NULL, NULL, NULL, 'tidak aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_bisnis`
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
  `feedback` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan_bisnis`
--

INSERT INTO `laporan_bisnis` (`id`, `judul_laporan`, `jenis_laporan`, `laporan_penjualan`, `laporan_pemasaran`, `laporan_produksi`, `laporan_sdm`, `laporan_keuangan`, `laporan_pdf`, `tanggal_upload`, `id_kelompok`, `feedback`) VALUES
(20, 'Laporan 1', 'laporan_kemajuan', '', '', '', '', '', NULL, '2025-01-06 07:11:45', NULL, NULL),
(53, 'LAPORAN 1', 'laporan_kemajuan', 'TES', 'TES', 'TES', 'TES', 'TES', '[\"0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf\",\"Buku-Modul-Kuliah-Kewirausahaan.pdf\"]', '2024-12-29 12:00:03', 26, 'LAPORAN YANG BAGUS');

--
-- Trigger `laporan_bisnis`
--
DELIMITER $$
CREATE TRIGGER `after_insert_laporan_bisnis` AFTER INSERT ON `laporan_bisnis` FOR EACH ROW BEGIN
    INSERT INTO laporan_bisnis_backup (
        id, judul_laporan, jenis_laporan, laporan_penjualan, laporan_pemasaran, laporan_produksi, 
        laporan_sdm, laporan_keuangan, laporan_pdf, tanggal_upload, id_kelompok, feedback
    ) VALUES (
        NEW.id, NEW.judul_laporan, NEW.jenis_laporan, NEW.laporan_penjualan, NEW.laporan_pemasaran, 
        NEW.laporan_produksi, NEW.laporan_sdm, NEW.laporan_keuangan, NEW.laporan_pdf, 
        NEW.tanggal_upload, NEW.id_kelompok, NEW.feedback
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_laporan_bisnis` AFTER UPDATE ON `laporan_bisnis` FOR EACH ROW BEGIN
    UPDATE laporan_bisnis_backup
    SET 
        judul_laporan = NEW.judul_laporan,
        jenis_laporan = NEW.jenis_laporan,
        laporan_penjualan = NEW.laporan_penjualan,
        laporan_pemasaran = NEW.laporan_pemasaran,
        laporan_produksi = NEW.laporan_produksi,
        laporan_sdm = NEW.laporan_sdm,
        laporan_keuangan = NEW.laporan_keuangan,
        laporan_pdf = NEW.laporan_pdf,
        tanggal_upload = NEW.tanggal_upload,
        id_kelompok = NEW.id_kelompok,
        feedback = NEW.feedback
    WHERE id = NEW.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_bisnis_backup`
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
  `feedback` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan_bisnis_backup`
--

INSERT INTO `laporan_bisnis_backup` (`id`, `judul_laporan`, `jenis_laporan`, `laporan_penjualan`, `laporan_pemasaran`, `laporan_produksi`, `laporan_sdm`, `laporan_keuangan`, `laporan_pdf`, `tanggal_upload`, `id_kelompok`, `feedback`) VALUES
(52, 'Laporan 1', 'laporan_kemajuan', '', '', '', '', '', '[\"Progres Kerja tanggal 23 December 2024 (1402022055).pdf\",\"Progres Kerja tanggal 18 December 2024 (1402022055) (1).pdf\",\"Progres Kerja tanggal 16 December 2024 (1402022055) (1) (1).pdf\"]', '2024-12-25 14:39:27', 20, 'bagus laporanya'),
(53, 'LAPORAN 1', 'laporan_kemajuan', 'TES', 'TES', 'TES', 'TES', 'TES', '[\"0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf\",\"Buku-Modul-Kuliah-Kewirausahaan.pdf\"]', '2024-12-29 12:00:03', 26, 'LAPORAN YANG BAGUS'),
(54, 'Laporan 2', 'laporan_kemajuan', '', '', '', '', '', '[\"Kartu Ujian Basing.pdf\"]', '2025-01-06 07:03:27', 20, 'tester'),
(20, 'Laporan 1', 'laporan_kemajuan', '', '', '', '', '', NULL, '2025-01-06 07:11:45', NULL, NULL),
(55, 'Laporan 10', 'laporan_kemajuan', '', '', '', '', '', '[\"Kartu Ujian Basing_2.pdf\"]', '2025-01-06 07:18:53', 20, NULL),
(56, 'Laporan 3', 'laporan_kemajuan', '', '', '', '', '', NULL, '2025-01-09 08:13:17', 20, NULL),
(57, 'Laporan 2', 'Laporan Kemajuan', '', '', '', '', '', NULL, '2025-01-14 07:44:35', 20, NULL),
(58, 'Laporan 3', 'Laporan Akhir', '', '', '', '', '', NULL, '2025-01-14 07:46:29', 20, NULL),
(59, 'Laporan 4', 'Laporan Kemajuan', '', '', '', '', '', NULL, '2025-01-14 07:50:20', 20, NULL),
(60, 'Laporan 1', 'Laporan Kemajuan', 'testeer', 'tester', 'tester', 'tester', 'tester', '[\"0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN (2).pdf\",\"Progres Kerja tanggal 9 Januari 2025 (1402022055).pdf\"]', '2025-01-15 19:58:13', 35, NULL);

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
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `fakultas` varchar(100) DEFAULT NULL,
  `id_kelompok` int(11) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `nama`, `npm`, `program_studi`, `email`, `contact`, `fakultas`, `id_kelompok`, `alamat`) VALUES
(4, 8, 'Ruffino Noor', '1402022044', 'Teknik Informatika', 'komangabi@gmail.com', '089765347779', 'Teknik Informasi', 26, NULL),
(5, 9, 'Sharil Hamza', '1402022060', 'Teknik Informatika', 'akunmllimitbruno@gmail.com', '089637162255', NULL, 26, NULL),
(6, 10, 'John Doe', '1402023001', 'Teknik Informatika', 'Johndoe@gmail.com', '087654327778', NULL, NULL, NULL),
(9, 19, 'ridho odir', '1402022071', 'Teknik Informatika', 'bcakun71@gmail.com', '0897653617', 'Fakultas Teknologi Informasi', 36, NULL),
(10, 20, 'fitra rama', '1402022033', 'Teknik Informatika', 'riskyarur@gmail.com', '08963546662', 'Fakultas Teknologi Informasi', NULL, NULL),
(18, 27, 'Muhammad Fadly Abdillah', '1402022040', '', 'ridhosyahfero35@gmail.com', '087828628734', NULL, NULL, 'JL Sungai Kapuas IV, Semper Barat, Cilincing, Jakarta Utara'),
(21, 32, 'Muhammad Asril Afandhi', '1402022068', 'Teknik Informatika', 'Johndoe@gmail.com', '082113185983', 'Teknologi Informasi', 26, 'KAMP RAWA PASUNG'),
(22, 33, 'Bilal Hakkul Mubin', '1402022013', 'Teknik Informatika', 'Johndoe@gmail.com', '081317254563', 'Teknologi Informasi', 28, 'Jalan Lagoa Gg1 C1 Terusan No 14'),
(23, 34, 'Salsha Billa Yunita Sari', '1502022028', 'Ilmu Perpustakaan', 'salsabilla@gmailc.com', '083834155938', 'Teknologi Informasi', NULL, 'Jl. Kalibaru Barat IV No.05'),
(24, 35, 'I KOMANG ABIMANYU', '1402016053', 'Teknik Informatika', 'komangabi@gmail.com', '089637203833', 'Teknologi Informasi', 28, 'JL.TARNA BARU NO.23 RT/RW:003/010'),
(25, 36, 'Muhammad Taufiqulhakim Maha', '1402022045', 'Teknik Informatika', 'emailaja@gmail.com', '082111119406', 'Teknologi Informasi', 31, 'Jalan Kelapa Molek IV 42/2 Perumahan Kelapa Gading  Permai'),
(26, 37, 'Hafizh Vito Pratomo', '1402022022', 'Teknik Informatika', 'Johndoe@gmail.com', '085694311138', 'Teknologi Informasi', 31, 'KAMP RAWA PASUNG'),
(27, 38, 'Ruffino Ahmad Noor', '1402022070', 'Teknik Informatika', 'eyeryry@gmail.com', '083808959228', 'Teknologi Informasi', 36, 'rdtrtry'),
(28, 51, 'Virgiawan Ardiatno', '1402022063', 'Teknik Informatika', 'kajaskn@gmail.com', '081298407008', 'Teknologi Informasi', NULL, 'KAMP RAWA PASUNG'),
(31, 83, 'Ridho Syahfero', '1402022055', 'Teknik Informatika', 'ridhosyahfero35@gmail.com', '089637167773', 'Teknologi Informasi', NULL, 'Jl.Remaja 3 Gg gabus RT.9/RW.8 No.27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi_kewirausahaan`
--

CREATE TABLE `materi_kewirausahaan` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `file_path` varchar(300) NOT NULL,
  `deskripsi` varchar(3000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `materi_kewirausahaan`
--

INSERT INTO `materi_kewirausahaan` (`id`, `judul`, `file_path`, `deskripsi`, `created_at`) VALUES
(116, 'Konsep Dasar Kewirausahaan', '0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf', 'Dalam mater ini, Anda akan mempelajari konsep dasar kewirausahaan yang menjadi fondasi penting bagi setiap calon wirausahawan. Kami akan membahas:\r\n\r\nApa itu kewirausahaan? Definisi dan esensi dari menjadi seorang wirausahawan.\r\nKarakteristik seorang wirausahawan sukses seperti inovasi, kreativitas, dan keberanian mengambil risiko.\r\nProses kewirausahaan mulai dari menemukan ide bisnis, memvalidasi pasar, hingga merancang model bisnis.\r\nManfaat kewirausahaan baik secara individu maupun bagi perekonomi', '2025-01-01 07:01:16'),
(117, 'Konsep Kewirausahaan Kuliah gratis Prof Rhenald Kasali', 'konsep-kewirausahaan-kuliah-gratis-prof-rhenald-kasali-ytshorts.savetube.me.mp4', 'Dalam video ini, Prof. Rhenald Kasali, seorang pakar dan praktisi terkemuka di bidang kewirausahaan, memberikan kuliah gratis yang membahas Konsep Kewirausahaan secara mendalam. Anda akan belajar:\r\n\r\nPengertian kewirausahaan menurut perspektif akademis dan praktis.\r\nPola pikir wirausaha (entrepreneurial mindset) yang mendorong inovasi dan keberanian dalam menghadapi tantangan.\r\nStrategi menemukan peluang bisnis di era perubahan dan disrupsi.\r\nPrinsip dasar membangun bisnis yang berkelanjutan dan rele', '2025-01-01 07:01:16'),
(118, 'Prospek Kerja Kuliah Jurusan Kewirausahaan', 'prospek-kerja-kuliah-jurusan-kewirausahaan-ytshorts.savetube.me.mp4', 'Apakah Anda penasaran dengan peluang karier setelah lulus dari jurusan Kewirausahaan? Dalam video ini, kami akan membahas berbagai prospek kerja menjanjikan bagi lulusan jurusan Kewirausahaan. Anda akan mengetahui:\r\n\r\nBagaimana lulusan jurusan ini bisa menjadi pengusaha sukses di berbagai bidang.\r\nPeluang bekerja sebagai konsultan bisnis dan membantu perusahaan berkembang.\r\nPeran strategis sebagai Business Development Manager atau pendiri startup inovatif.\r\nKarier di dunia sosial sebagai social entre', '2025-01-01 07:01:16'),
(119, 'Buku Modul Kuliah Kewirausahaan', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 'Buku ini merupakan panduan lengkap untuk memahami dan mempraktikkan konsep dasar kewirausahaan dalam dunia nyata. Disusun secara sistematis, modul ini dirancang untuk mendukung mahasiswa dalam mengikuti perkuliahan kewirausahaan dengan materi yang relevan, aplikatif, dan mudah dipahami.\r\n\r\nIsi Buku:\r\nKonsep Dasar Kewirausahaan: Definisi, sejarah, dan pentingnya kewirausahaan.\r\nPola Pikir Wirausaha (Entrepreneurial Mindset): Mengembangkan kreativitas, inovasi, dan keberanian mengambil risiko.\r\nProses ', '2025-01-01 07:01:16'),
(124, 'Materi A', 'Progres Kerja tanggal 9 Januari 2025 (1402022055).pdf', 'Materi', '2025-01-15 19:15:26');

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
(1, 2, 'Mr Ridho Syahfero', '022456788', 'rendhyat@gmail.com', '089637167774', 'Entrepreneur', 'Kewirausahaan', 'Bisnis', '/Entree/components/pages/mentorbisnis/uploads/677f8f197365b9.44072527.jpg'),
(2, 13, 'CONTOH 2', '02247896', 'ridhosyahfero35@gmail.com', '089637167673', 'Busineseman', 'Kewirausahaan', 'Bisnis', '/Entree/components/pages/mentorbisnis/uploads/mentr.jpg');

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
  `feedback` varchar(2000) DEFAULT NULL,
  `anggaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `proposal_bisnis`
--

INSERT INTO `proposal_bisnis` (`id`, `judul_proposal`, `tahapan_bisnis`, `sdg`, `kategori`, `other_category`, `proposal_pdf`, `kelompok_id`, `status`, `ide_bisnis`, `feedback`, `anggaran`) VALUES
(41, 'PROPOSAL 1', 'Tahapan Awal', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'Bisnis Konstruksi dan Real Estate', '', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 26, 'disetujui', 'TES', 'Proposal Anda memiliki tujuan yang bagus', NULL),
(43, 'Proposal 1', 'Tahapan Awal', 'pendidikan_berkualitas,kesetaraan_gender', 'Bisnis Energi dan Lingkungan', '', 'Progres Kerja tanggal 31December 2024 (1402022055).pdf', 31, 'disetujui', 'tes', NULL, 20000),
(46, 'TEST', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Agrikultur dan Perkebunan', '', '0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN (2).pdf', 28, 'menunggu', 'TEST', NULL, 10290912);

--
-- Trigger `proposal_bisnis`
--
DELIMITER $$
CREATE TRIGGER `after_insert_proposal_bisnis` AFTER INSERT ON `proposal_bisnis` FOR EACH ROW BEGIN
    INSERT INTO proposal_bisnis_backup (
        id, judul_proposal, tahapan_bisnis, sdg, kategori, 
        other_category, proposal_pdf, kelompok_id, status, ide_bisnis, feedback, anggaran
    ) VALUES (
        NEW.id, NEW.judul_proposal, NEW.tahapan_bisnis, NEW.sdg, NEW.kategori, 
        NEW.other_category, NEW.proposal_pdf, NEW.kelompok_id, NEW.status, NEW.ide_bisnis, NEW.feedback, NEW.anggaran
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_proposal_bisnis` AFTER UPDATE ON `proposal_bisnis` FOR EACH ROW BEGIN
    UPDATE proposal_bisnis_backup
    SET 
        judul_proposal = NEW.judul_proposal,
        tahapan_bisnis = NEW.tahapan_bisnis,
        sdg = NEW.sdg,
        kategori = NEW.kategori,
        other_category = NEW.other_category,
        proposal_pdf = NEW.proposal_pdf,
        kelompok_id = NEW.kelompok_id,
        status = NEW.status,
        ide_bisnis = NEW.ide_bisnis,
        feedback = NEW.feedback,
        anggaran = NEW.anggaran
    WHERE id = NEW.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `proposal_bisnis_backup`
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
  `feedback` varchar(2000) DEFAULT NULL,
  `anggaran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `proposal_bisnis_backup`
--

INSERT INTO `proposal_bisnis_backup` (`id`, `judul_proposal`, `tahapan_bisnis`, `sdg`, `kategori`, `other_category`, `proposal_pdf`, `kelompok_id`, `status`, `ide_bisnis`, `feedback`, `anggaran`) VALUES
(35, 'TESTER PROPOSAL', 'Tahapan Bertumbuh', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'Bisnis Teknologi atau Digital', '', 'Progres Kerja tanggal 16 December 2024 (1402022055).pdf', 20, 'disetujui', 'TESTER', 'tes', NULL),
(36, 'PROPOSAL 1', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055).pdf', 25, 'menunggu', 'BISNIS IDE', 'tes', NULL),
(40, 'PROPOSAL 2', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055) (1).pdf', 25, 'menunggu', 'CAUSE THIS IS ALL WE KNOW', NULL, NULL),
(41, 'PROPOSAL 1', 'Tahapan Awal', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'Bisnis Konstruksi dan Real Estate', '', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 26, 'disetujui', 'TES', 'Proposal Anda memiliki tujuan yang bagus', NULL),
(42, 'proposal 3', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Pariwisata dan Perhotelan', '', 'Progres Kerja tanggal 31December 2024 (1402022055).pdf', 25, 'menunggu', 'Bisnis Kambing', NULL, '20000'),
(43, 'Proposal 1', 'Tahapan Awal', 'pendidikan_berkualitas,kesetaraan_gender', 'Bisnis Energi dan Lingkungan', '', 'Progres Kerja tanggal 31December 2024 (1402022055).pdf', 31, 'disetujui', 'tes', NULL, '20000'),
(44, 'sjansdabjbds', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Teknologi atau Digital', '', 'Kartu Ujian Basing (1).pdf', 20, 'menunggu', 'jdbas', NULL, '0'),
(45, 'Proposal 1', 'Tahapan Awal', 'mengakhiri_kelaparan,kesehatan_kesejahteraan', 'Bisnis Dagang (Perdagangan)', '', '0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN (2).pdf', 35, 'disetujui', 'Bisnis Ayam', 'Proposal kelompok anda bagus', '100000'),
(46, 'TEST', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Agrikultur dan Perkebunan', '', '0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN (2).pdf', 28, 'menunggu', 'TEST', NULL, '10290912');

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
(2, 'akunMntr', '$2y$10$7aCTxTjDGfzG7N/3eVjrtO5g13wGc/RaqaDZbuZMRo7B/XHzKa3Me', 'Dosen Pengampu', 0),
(3, 'akunAdmin', '$2y$10$UxdFSeTIYqyXF90rzaXPNubfSPwdgKjvcz5ne/TMRt9hO8qt7BViK', 'Admin', 0),
(8, 'mahasiswa1', '$2y$10$uXNSNBz9vAwlD7AV4E1Qn.6DxK0zKygd1LuWcdgARKC/xBIHnXm5y', 'Mahasiswa', 0),
(9, 'mahasiswa2', '$2y$10$Jt7qe4u8hF2g6WjASB0XTey08sA3hHAna8VuU.P1yLoVIHI4whV/m', 'Mahasiswa', 0),
(10, 'mahasiswa3', '$2y$10$YFFZe1tX8Cq58eJTyJNNOOkIP7MS4U325GWQ2QsREj/hahNIPkTOG', 'Mahasiswa', 0),
(13, 'admin3', '$2y$10$myraeyhvLDu8j7iK09qyxOX6Dp8vy2ed4VmS3EJgodkXjrN4U6r4u', 'Tutor', 0),
(19, 'einsteins', '$2y$10$Jb6XVt2bJMTkMj0/nbpPJu3HGFnEgzaEK4OsWJyqZBFXKwlPWeFu.', 'Mahasiswa', 0),
(20, 'fitra.rama', '$2y$10$flIOsaEwvG7ib/T9YAKMmuSWxbO4zl19kJ/3yAD3YNxgR7r78lR6G', 'Mahasiswa', 0),
(27, 'm.fadly', '$2y$10$0Ly1LagxN3316nnCxFK9NOZkcalTj3B5UH7NEqPoILdholBwFvBgy', 'Mahasiswa', 0),
(32, 'muhammad.asril', '$2y$10$NW1KpcIDt5U2O/Gd7jih.OatL61jCZ1/ToQc/fQTMrw9VMA95mtxW', 'Mahasiswa', 0),
(33, 'bilal.hakkul', '$2y$10$uAU0LsZpqzZbqSFBy60kuudIsSN3G9lrI34CFva4uuAzq/eOTePgu', 'Mahasiswa', 0),
(34, 'salsha.billa', '$2y$10$/eU8DmXMjUyIO5XH2swuN.f0r90vdlWOjfcBXkijnVZSDH.8VlVka', 'Mahasiswa', 0),
(35, 'i.komang', '$2y$10$R.wSoMuXreeaON.8aLKnPOq3QvhtJvgupJHlU6suT9B4tOCFhKZB2', 'Mahasiswa', 0),
(36, 'muhammad.taufiqulhakim', '$2y$10$gxtr4RRPWerQtKLnZLGoD.P4c0KxXubcqijNwYXPDbaodOtvDGMVe', 'Mahasiswa', 0),
(37, 'hafizh.vito', '$2y$10$WDaW3x9DLf4Ju9yj50Uq/OIg1g8njJ3MqzfbsRWGUTz/r8aIeVBQ2', 'Mahasiswa', 0),
(38, 'ruffino.ahmad', '$2y$10$oV3h66ijmcCgk2aqsCJ0IOk97qzCvIYi0RYd.MnRaHR0h6u3d5uRW', 'Mahasiswa', 0),
(51, 'Virgiawan.ardiatno', '', 'Mahasiswa', 0),
(83, 'ridho.syahfero', '', 'Mahasiswa', 0);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_klmpk` (`id_klmpk`);

--
-- Indeks untuk tabel `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  ADD PRIMARY KEY (`id_kelompok`),
  ADD KEY `npm_ketua` (`npm_ketua`),
  ADD KEY `fk_id_mentor` (`id_mentor`);

--
-- Indeks untuk tabel `laporan_bisnis`
--
ALTER TABLE `laporan_bisnis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelompok` (`id_kelompok`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `laporan_bisnis`
--
ALTER TABLE `laporan_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `materi_kewirausahaan`
--
ALTER TABLE `materi_kewirausahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT untuk tabel `mentor`
--
ALTER TABLE `mentor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

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
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_id_klmpk` FOREIGN KEY (`id_klmpk`) REFERENCES `kelompok_bisnis` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  ADD CONSTRAINT `fk_id_mentor` FOREIGN KEY (`id_mentor`) REFERENCES `mentor` (`id`),
  ADD CONSTRAINT `kelompok_bisnis_ibfk_1` FOREIGN KEY (`npm_ketua`) REFERENCES `mahasiswa` (`npm`);

--
-- Ketidakleluasaan untuk tabel `laporan_bisnis`
--
ALTER TABLE `laporan_bisnis`
  ADD CONSTRAINT `laporan_bisnis_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok_bisnis` (`id_kelompok`) ON DELETE CASCADE;

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
