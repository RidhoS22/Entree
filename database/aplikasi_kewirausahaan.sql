-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jan 2025 pada 10.51
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
(32, 25, '1402022040'),
(33, 26, '1402022044'),
(34, 26, '1402022060'),
(36, 28, '1402016053');

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
(36, 28, '1402016053');

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
  `status` enum('menunggu','ditolak','disetujui','alternatif','selesai') NOT NULL,
  `bukti_kegiatan` varchar(255) DEFAULT NULL,
  `id_klmpk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal`
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
  `feedback_mentor` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
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
  `status_inkubasi` enum('direkomendasikan','disetujui','ditolak') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelompok_bisnis`
--

INSERT INTO `kelompok_bisnis` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `logo_bisnis`, `tahun_akademik_id`, `kategori_bisnis`, `sdg`, `ide_bisnis`, `id_mentor`, `status_inkubasi`) VALUES
(20, '1402022071', 'MACAN', 'a', 'hq720.jpg', 18, 'Bisnis Teknologi atau Digital', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'TESTER', 1, 'direkomendasikan'),
(25, '1402022055', 'TESTER', 'BISNIS AYAM', 'wlpper.jpg', 18, NULL, NULL, NULL, 2, NULL),
(26, '1402022068', 'ArTech', 'Bisnis Ikan', 'BMW.svg_.png', 18, 'Bisnis Konstruksi dan Real Estate', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'TES', 2, NULL),
(28, '1402022013', 'Tester', 'Bisnis Ayam', 'ayam.jpg', 18, NULL, NULL, NULL, NULL, NULL);

--
-- Trigger `kelompok_bisnis`
--
DELIMITER $$
CREATE TRIGGER `after_insert_kelompok_bisnis` AFTER INSERT ON `kelompok_bisnis` FOR EACH ROW BEGIN
    INSERT INTO kelompok_bisnis_backup (
        id_kelompok, npm_ketua, nama_kelompok, nama_bisnis, logo_bisnis, 
        tahun_akademik_id, kategori_bisnis, sdg, ide_bisnis, id_mentor, 
        status_inkubasi, status_kelompok_bisnis
    )
    VALUES (
        NEW.id_kelompok, NEW.npm_ketua, NEW.nama_kelompok, NEW.nama_bisnis, NEW.logo_bisnis, 
        NEW.tahun_akademik_id, NEW.kategori_bisnis, NEW.sdg, NEW.ide_bisnis, NEW.id_mentor,
        NEW.status_inkubasi, 'aktif'
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_kelompok_bisnis` AFTER UPDATE ON `kelompok_bisnis` FOR EACH ROW BEGIN
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
        status_kelompok_bisnis = 
            CASE 
                WHEN NEW.status_inkubasi IS NULL THEN 'aktif'
                WHEN NEW.status_inkubasi IN ('direkomendasikan', 'disetujui') THEN 'aktif'
                ELSE 'nonaktif'
            END
    WHERE id_kelompok = NEW.id_kelompok;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_bisnis_backup`
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
  `id_mentor` int(11) DEFAULT NULL,
  `status_kelompok_bisnis` enum('aktif','tidak aktif') DEFAULT 'aktif',
  `status_inkubasi` enum('direkomendasikan','disetujui','ditolak') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelompok_bisnis_backup`
--

INSERT INTO `kelompok_bisnis_backup` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `logo_bisnis`, `tahun_akademik_id`, `kategori_bisnis`, `sdg`, `ide_bisnis`, `id_mentor`, `status_kelompok_bisnis`, `status_inkubasi`) VALUES
(20, '1402022071', 'MACAN', 'a', 'hq720.jpg', 18, 'Bisnis Teknologi atau Digital', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'TESTER', 1, 'aktif', 'direkomendasikan'),
(25, '1402022055', 'TESTER', 'BISNIS AYAM', 'wlpper.jpg', 18, NULL, NULL, NULL, 2, 'aktif', NULL),
(26, '1402022068', 'ArTech', 'Bisnis Ikan', 'BMW.svg_.png', 18, 'Bisnis Konstruksi dan Real Estate', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'TES', 2, 'aktif', NULL),
(27, '1402022013', 'Nothing To Loser', 'Bisnis Ayam', 'ayam.jpg', 18, NULL, NULL, NULL, NULL, 'tidak aktif', NULL),
(28, '1402022013', 'Tester', 'Bisnis Ayam', 'ayam.jpg', 18, NULL, NULL, NULL, NULL, 'aktif', NULL);

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
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan_bisnis`
--

INSERT INTO `laporan_bisnis` (`id`, `judul_laporan`, `jenis_laporan`, `laporan_penjualan`, `laporan_pemasaran`, `laporan_produksi`, `laporan_sdm`, `laporan_keuangan`, `laporan_pdf`, `tanggal_upload`, `id_kelompok`, `feedback`) VALUES
(52, 'Laporan 1', 'laporan_kemajuan', '', '', '', '', '', '[\"Progres Kerja tanggal 23 December 2024 (1402022055).pdf\",\"Progres Kerja tanggal 18 December 2024 (1402022055) (1).pdf\",\"Progres Kerja tanggal 16 December 2024 (1402022055) (1) (1).pdf\"]', '2024-12-25 14:39:27', 20, 'bagus laporanya'),
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
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan_bisnis_backup`
--

INSERT INTO `laporan_bisnis_backup` (`id`, `judul_laporan`, `jenis_laporan`, `laporan_penjualan`, `laporan_pemasaran`, `laporan_produksi`, `laporan_sdm`, `laporan_keuangan`, `laporan_pdf`, `tanggal_upload`, `id_kelompok`, `feedback`) VALUES
(52, 'Laporan 1', 'laporan_kemajuan', '', '', '', '', '', '[\"Progres Kerja tanggal 23 December 2024 (1402022055).pdf\",\"Progres Kerja tanggal 18 December 2024 (1402022055) (1).pdf\",\"Progres Kerja tanggal 16 December 2024 (1402022055) (1) (1).pdf\"]', '2024-12-25 14:39:27', 20, 'bagus laporanya'),
(53, 'LAPORAN 1', 'laporan_kemajuan', 'TES', 'TES', 'TES', 'TES', 'TES', '[\"0206101221BUKU_3_MODUL_2_KONSEP_DASAR_KEWIRAUSAHAAN.pdf\",\"Buku-Modul-Kuliah-Kewirausahaan.pdf\"]', '2024-12-29 12:00:03', 26, 'LAPORAN YANG BAGUS');

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
  `logout_time` timestamp NULL DEFAULT NULL,
  `session_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_activity`
--

INSERT INTO `log_activity` (`id`, `timestamp`, `username`, `ip_address`, `user_agent`, `status`, `role`, `aksi`, `error_message`, `logout_time`, `session_token`) VALUES
(31, '2024-12-17 06:18:34', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:18:42', ''),
(32, '2024-12-17 06:21:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:24:00', ''),
(33, '2024-12-17 06:24:06', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(34, '2024-12-17 06:31:30', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 06:31:40', ''),
(35, '2024-12-17 06:31:49', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(36, '2024-12-17 06:39:43', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(37, '2024-12-17 07:06:24', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(38, '2024-12-17 07:12:19', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(39, '2024-12-17 07:12:36', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(40, '2024-12-17 07:12:42', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(41, '2024-12-17 07:13:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(42, '2024-12-17 07:13:13', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(43, '2024-12-17 07:13:31', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(44, '2024-12-17 07:54:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(45, '2024-12-17 07:54:57', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(46, '2024-12-17 08:22:00', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:11:54', ''),
(47, '2024-12-17 08:37:00', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:11:54', ''),
(48, '2024-12-17 09:12:07', 'fitra.rama', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(49, '2024-12-17 09:12:21', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:21:08', ''),
(50, '2024-12-17 09:21:14', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:24:51', ''),
(51, '2024-12-17 09:25:05', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 09:25:18', ''),
(52, '2024-12-17 09:25:28', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(53, '2024-12-17 10:58:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(54, '2024-12-17 11:43:28', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(55, '2024-12-17 13:39:52', 'einstein', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 13:44:39', ''),
(56, '2024-12-17 13:44:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(57, '2024-12-17 19:59:37', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(58, '2024-12-17 20:02:56', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 20:04:56', ''),
(59, '2024-12-17 20:05:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(60, '2024-12-17 20:35:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 20:42:26', ''),
(61, '2024-12-17 20:42:34', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(62, '2024-12-17 20:45:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:08:58', ''),
(63, '2024-12-17 20:45:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:08:58', ''),
(64, '2024-12-17 21:09:05', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:09:53', ''),
(65, '2024-12-17 21:10:01', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-17 21:26:56', ''),
(66, '2024-12-19 14:51:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 14:54:45', ''),
(67, '2024-12-19 14:54:51', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(68, '2024-12-19 14:54:59', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(69, '2024-12-19 14:58:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(70, '2024-12-19 14:58:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(71, '2024-12-19 15:00:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:08:36', ''),
(72, '2024-12-19 15:08:43', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:22:00', ''),
(73, '2024-12-19 15:22:26', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:26:06', ''),
(74, '2024-12-19 15:26:12', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 15:54:00', ''),
(75, '2024-12-19 15:54:13', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 16:08:48', ''),
(76, '2024-12-19 16:09:00', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
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
(87, '2024-12-19 17:55:53', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(88, '2024-12-19 18:43:48', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 18:45:15', ''),
(89, '2024-12-19 18:45:21', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(90, '2024-12-19 18:52:36', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 18:54:00', ''),
(91, '2024-12-19 18:54:08', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(92, '2024-12-19 18:54:33', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 19:21:40', ''),
(93, '2024-12-19 19:21:46', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(94, '2024-12-19 19:45:55', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 19:48:57', ''),
(95, '2024-12-19 19:49:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(96, '2024-12-19 20:01:21', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
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
(109, '2024-12-19 20:56:21', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(110, '2024-12-19 20:59:03', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-19 20:59:25', ''),
(111, '2024-12-19 20:59:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(112, '2024-12-19 21:01:41', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(113, '2024-12-19 21:01:46', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(114, '2024-12-20 05:18:41', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-20 06:15:08', ''),
(115, '2024-12-20 05:59:25', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(116, '2024-12-20 06:03:41', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(117, '2024-12-20 06:11:26', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(118, '2024-12-20 06:12:15', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(119, '2024-12-20 06:12:51', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(120, '2024-12-20 06:13:18', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-20 06:15:08', ''),
(121, '2024-12-20 06:15:15', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:17:58', ''),
(122, '2024-12-20 06:17:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(123, '2024-12-20 06:19:04', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(124, '2024-12-20 06:19:57', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(125, '2024-12-21 04:41:31', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 05:21:56', ''),
(126, '2024-12-21 05:22:12', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(127, '2024-12-21 05:37:40', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(128, '2024-12-21 05:38:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(129, '2024-12-21 05:40:43', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(130, '2024-12-21 05:48:56', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(131, '2024-12-21 05:58:19', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(132, '2024-12-21 06:17:43', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(133, '2024-12-21 06:20:26', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(134, '2024-12-21 06:36:54', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 06:38:28', ''),
(135, '2024-12-21 06:38:34', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(136, '2024-12-21 07:24:05', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(137, '2024-12-21 08:13:47', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:16:24', ''),
(138, '2024-12-21 08:16:32', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 08:17:58', ''),
(139, '2024-12-21 08:18:05', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(140, '2024-12-21 08:20:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(141, '2024-12-21 08:23:06', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(142, '2024-12-21 08:24:40', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(143, '2024-12-21 08:37:15', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(144, '2024-12-21 08:41:39', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(145, '2024-12-21 10:06:16', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(146, '2024-12-21 10:06:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(147, '2024-12-21 10:09:08', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(148, '2024-12-21 10:09:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(149, '2024-12-21 10:15:45', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 10:19:39', ''),
(150, '2024-12-21 10:19:52', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(151, '2024-12-21 10:41:10', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:49:53', ''),
(152, '2024-12-21 10:41:39', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(153, '2024-12-21 11:29:35', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(154, '2024-12-21 11:39:14', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(155, '2024-12-21 11:39:44', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(156, '2024-12-21 13:25:12', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:25:56', ''),
(157, '2024-12-21 13:26:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(158, '2024-12-21 13:46:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:49:53', ''),
(159, '2024-12-21 13:49:58', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:52:28', ''),
(160, '2024-12-21 13:52:32', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:54:06', ''),
(161, '2024-12-21 13:54:10', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:54:20', ''),
(162, '2024-12-21 13:54:25', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(163, '2024-12-21 13:55:53', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 13:57:47', ''),
(164, '2024-12-21 13:57:53', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(165, '2024-12-21 14:00:17', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(166, '2024-12-21 14:01:46', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(167, '2024-12-21 14:02:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(168, '2024-12-21 14:03:55', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-21 14:06:25', ''),
(169, '2024-12-21 14:06:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(170, '2024-12-21 14:10:30', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(171, '2024-12-23 05:14:34', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 05:15:41', ''),
(172, '2024-12-23 05:15:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(173, '2024-12-23 05:17:24', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(174, '2024-12-23 05:18:19', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(175, '2024-12-23 05:20:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 06:34:29', ''),
(176, '2024-12-23 06:33:58', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 06:34:29', ''),
(177, '2024-12-23 06:34:48', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:08:24', ''),
(178, '2024-12-23 08:08:31', 'asril.affandhi', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:08:35', ''),
(179, '2024-12-23 08:08:41', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:08:46', ''),
(180, '2024-12-23 08:08:55', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:10:39', ''),
(181, '2024-12-23 08:11:16', 'mahasiswa2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 08:11:39', ''),
(182, '2024-12-23 08:11:45', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 12:25:13', ''),
(183, '2024-12-23 12:25:20', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(184, '2024-12-23 12:36:38', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 12:38:13', ''),
(185, '2024-12-23 12:38:20', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(186, '2024-12-23 12:38:38', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(187, '2024-12-23 13:15:10', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(188, '2024-12-23 13:20:41', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 13:21:19', ''),
(189, '2024-12-23 13:21:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(190, '2024-12-23 13:23:21', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-23 13:48:28', ''),
(191, '2024-12-23 13:48:34', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(192, '2024-12-23 13:53:10', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(193, '2024-12-23 19:10:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(194, '2024-12-24 08:11:05', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:13:35', ''),
(195, '2024-12-24 08:13:43', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-24 08:17:27', ''),
(196, '2024-12-25 07:35:40', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-25 09:05:48', ''),
(197, '2024-12-25 08:37:58', 'ridho.syahferoo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 08:51:37', ''),
(198, '2024-12-25 08:38:13', 'm.fadly', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 08:39:34', ''),
(199, '2024-12-25 08:39:39', 'ridho.syahferoo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 08:51:37', ''),
(200, '2024-12-25 09:29:47', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f6fc3df9896ea23e8a8265ed33ef4015'),
(201, '2024-12-25 09:30:07', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f6fc3df9896ea23e8a8265ed33ef4015'),
(202, '2024-12-25 11:02:22', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(203, '2024-12-25 11:02:54', 'mahasiswa1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 11:03:07', ''),
(204, '2024-12-25 11:03:14', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 11:03:47', ''),
(205, '2024-12-25 11:03:56', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(206, '2024-12-25 11:04:55', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:02:20', ''),
(207, '2024-12-25 12:02:27', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:17:53', ''),
(208, '2024-12-25 12:18:01', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:20:09', ''),
(209, '2024-12-25 12:20:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:39:07', ''),
(210, '2024-12-25 12:39:12', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:40:28', ''),
(211, '2024-12-25 12:40:48', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:52:02', ''),
(212, '2024-12-25 12:52:07', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:52:21', ''),
(213, '2024-12-25 12:52:27', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(214, '2024-12-25 12:59:36', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 12:59:45', ''),
(215, '2024-12-25 12:59:54', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(216, '2024-12-25 13:18:00', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:18:38', ''),
(217, '2024-12-25 13:18:46', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(218, '2024-12-25 13:31:59', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(219, '2024-12-25 13:34:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(220, '2024-12-25 13:35:04', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:35:10', ''),
(221, '2024-12-25 13:35:16', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:43:18', ''),
(222, '2024-12-25 13:43:31', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:43:34', ''),
(223, '2024-12-25 13:43:40', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(224, '2024-12-25 13:43:40', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Username tidak ditemukan', NULL, ''),
(225, '2024-12-25 13:43:46', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(226, '2024-12-25 13:46:29', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:46:37', ''),
(227, '2024-12-25 13:46:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(228, '2024-12-25 13:46:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Username tidak ditemukan', NULL, ''),
(229, '2024-12-25 13:46:50', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(230, '2024-12-25 13:47:47', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-25 13:48:14', ''),
(231, '2024-12-25 13:47:47', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-25 13:48:14', ''),
(232, '2024-12-25 13:47:53', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:48:14', ''),
(233, '2024-12-25 13:48:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-26 05:53:15', ''),
(234, '2024-12-25 13:48:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-26 05:53:15', ''),
(235, '2024-12-25 13:48:25', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-25 13:48:33', ''),
(236, '2024-12-25 13:48:39', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(237, '2024-12-25 18:15:08', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 05:53:15', ''),
(238, '2024-12-26 05:48:12', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 05:53:15', ''),
(239, '2024-12-26 05:53:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 08:07:44', ''),
(240, '2024-12-26 08:07:51', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 08:08:02', ''),
(241, '2024-12-26 08:08:15', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 10:05:47', ''),
(242, '2024-12-26 10:06:01', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(243, '2024-12-26 10:06:36', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(244, '2024-12-26 11:31:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(245, '2024-12-26 11:33:15', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 11:33:22', ''),
(246, '2024-12-26 11:33:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(247, '2024-12-26 12:38:23', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(248, '2024-12-26 12:38:44', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(249, '2024-12-26 12:39:08', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 12:39:18', '');
INSERT INTO `log_activity` (`id`, `timestamp`, `username`, `ip_address`, `user_agent`, `status`, `role`, `aksi`, `error_message`, `logout_time`, `session_token`) VALUES
(250, '2024-12-26 12:39:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(251, '2024-12-26 12:41:15', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(252, '2024-12-26 12:50:03', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(253, '2024-12-26 13:06:29', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 14:10:43', ''),
(254, '2024-12-26 14:10:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(255, '2024-12-26 17:45:46', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 17:47:42', ''),
(256, '2024-12-26 17:47:48', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(257, '2024-12-26 17:48:56', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(258, '2024-12-26 17:53:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
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
(276, '2024-12-26 18:56:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(277, '2024-12-26 19:03:47', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(278, '2024-12-26 19:04:31', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(279, '2024-12-26 19:04:43', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(280, '2024-12-26 19:14:17', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(281, '2024-12-26 19:24:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-26 19:24:27', ''),
(282, '2024-12-26 19:25:39', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(283, '2024-12-26 19:26:50', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(284, '2024-12-26 20:12:08', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(285, '2024-12-26 20:18:20', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(286, '2024-12-26 20:23:33', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(287, '2024-12-26 20:23:54', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(288, '2024-12-26 20:24:20', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(289, '2024-12-26 20:24:52', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(290, '2024-12-26 20:25:13', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(291, '2024-12-27 07:06:18', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-27 07:06:37', ''),
(292, '2024-12-27 07:38:36', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-28 08:38:12', ''),
(293, '2024-12-27 07:38:58', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:55:25', ''),
(294, '2024-12-27 07:38:58', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:55:25', ''),
(295, '2024-12-28 08:20:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 08:38:12', ''),
(296, '2024-12-28 08:38:19', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(297, '2024-12-28 08:38:40', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(298, '2024-12-28 08:38:40', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(299, '2024-12-28 08:46:58', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(300, '2024-12-28 09:11:02', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(301, '2024-12-28 09:14:49', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(302, '2024-12-28 10:27:23', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 10:30:41', ''),
(303, '2024-12-28 10:30:47', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(304, '2024-12-28 10:30:55', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(305, '2024-12-28 13:20:05', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 13:24:12', ''),
(306, '2024-12-28 13:24:22', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 13:48:42', ''),
(307, '2024-12-28 13:49:01', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(308, '2024-12-28 13:54:24', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(309, '2024-12-28 14:06:25', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(310, '2024-12-28 14:06:36', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(311, '2024-12-28 14:09:56', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(312, '2024-12-28 14:20:29', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 14:22:07', ''),
(313, '2024-12-28 14:22:15', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(314, '2024-12-28 14:31:23', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-28 14:31:49', ''),
(315, '2024-12-28 14:31:54', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(316, '2024-12-29 06:34:25', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 06:35:41', ''),
(317, '2024-12-29 06:35:48', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(318, '2024-12-29 06:36:27', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(319, '2024-12-29 07:02:47', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(320, '2024-12-29 07:03:12', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(321, '2024-12-29 07:03:36', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(322, '2024-12-29 07:32:22', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(323, '2024-12-29 07:48:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 07:48:20', ''),
(324, '2024-12-29 07:48:28', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 08:30:37', ''),
(325, '2024-12-29 08:33:34', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:55:25', ''),
(326, '2024-12-29 08:42:28', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:55:25', ''),
(327, '2024-12-29 10:42:18', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:42:21', ''),
(328, '2024-12-29 10:42:27', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(329, '2024-12-29 10:45:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(330, '2024-12-29 10:52:05', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:52:12', ''),
(331, '2024-12-29 10:55:35', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(332, '2024-12-29 10:56:47', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-29 10:58:19', ''),
(333, '2024-12-29 10:56:47', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-29 10:58:19', ''),
(334, '2024-12-29 10:56:55', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 10:58:19', ''),
(335, '2024-12-29 10:58:25', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(336, '2024-12-29 10:59:14', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-29 11:00:18', ''),
(337, '2024-12-29 10:59:14', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2024-12-29 11:00:18', ''),
(338, '2024-12-29 10:59:21', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 11:00:18', ''),
(339, '2024-12-29 11:00:24', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(340, '2024-12-29 11:00:58', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 11:01:56', ''),
(341, '2024-12-29 11:02:03', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(342, '2024-12-29 11:04:03', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(343, '2024-12-29 11:04:58', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 11:08:45', ''),
(344, '2024-12-29 11:08:51', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(345, '2024-12-29 11:51:05', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(346, '2024-12-29 11:51:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-29 11:51:34', ''),
(347, '2024-12-29 11:51:42', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(348, '2024-12-31 06:15:57', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 06:17:31', ''),
(349, '2024-12-31 06:16:09', 'muhammad.asril', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(350, '2024-12-31 06:16:31', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 06:17:31', ''),
(351, '2024-12-31 06:17:37', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 06:20:30', ''),
(352, '2024-12-31 06:20:38', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(353, '2024-12-31 06:38:30', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 06:50:51', ''),
(354, '2024-12-31 06:50:58', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(355, '2024-12-31 06:52:10', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 08:42:27', ''),
(356, '2024-12-31 08:42:33', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(357, '2024-12-31 08:43:00', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 09:13:08', ''),
(358, '2024-12-31 09:13:22', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 09:16:14', ''),
(359, '2024-12-31 09:16:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 09:17:17', ''),
(360, '2024-12-31 09:17:23', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(361, '2024-12-31 09:18:36', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(362, '2024-12-31 09:19:07', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(363, '2024-12-31 09:19:44', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(364, '2024-12-31 09:39:49', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(365, '2024-12-31 09:51:24', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(366, '2024-12-31 09:51:54', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(367, '2024-12-31 10:21:23', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(368, '2024-12-31 11:08:50', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(369, '2024-12-31 11:12:59', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(370, '2024-12-31 11:13:09', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(371, '2024-12-31 11:15:53', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(372, '2024-12-31 11:17:07', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(373, '2024-12-31 11:18:00', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(374, '2024-12-31 11:18:36', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(375, '2024-12-31 11:35:04', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2024-12-31 11:35:10', ''),
(376, '2024-12-31 11:37:01', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(377, '2024-12-31 11:38:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 08:34:42', ''),
(378, '2024-12-31 11:44:36', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 19:40:18', ''),
(379, '2025-01-01 07:02:39', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(380, '2025-01-01 08:34:16', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 08:34:42', ''),
(381, '2025-01-01 08:35:20', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-01 10:13:49', ''),
(382, '2025-01-01 10:13:56', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(383, '2025-01-01 10:23:28', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(384, '2025-01-01 10:24:09', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(385, '2025-01-01 10:24:45', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(386, '2025-01-01 10:34:34', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 06:09:39', ''),
(387, '2025-01-02 05:48:07', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 06:09:39', ''),
(388, '2025-01-02 06:09:46', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-02 06:10:43', ''),
(389, '2025-01-02 06:10:13', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 06:10:43', ''),
(390, '2025-01-02 06:19:26', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 06:20:18', ''),
(391, '2025-01-02 06:20:29', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(392, '2025-01-02 06:42:07', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 06:57:07', ''),
(393, '2025-01-02 06:57:12', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 07:02:06', ''),
(394, '2025-01-02 07:02:46', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 07:17:58', ''),
(395, '2025-01-02 07:18:09', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(396, '2025-01-02 07:31:58', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(397, '2025-01-02 07:35:38', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 07:39:00', ''),
(398, '2025-01-02 07:39:17', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(399, '2025-01-02 07:39:46', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(400, '2025-01-02 07:49:11', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 07:56:16', ''),
(401, '2025-01-02 08:12:13', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 08:42:12', ''),
(402, '2025-01-02 08:44:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-02 14:45:24', ''),
(403, '2025-01-02 08:44:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-02 14:45:24', ''),
(404, '2025-01-02 08:45:06', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 14:45:24', ''),
(405, '2025-01-02 14:16:41', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 14:17:10', ''),
(406, '2025-01-02 14:17:16', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(407, '2025-01-02 14:18:03', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 14:45:24', ''),
(408, '2025-01-02 14:45:38', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(409, '2025-01-02 15:31:27', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(410, '2025-01-02 15:36:24', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(411, '2025-01-02 17:51:06', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 17:51:19', ''),
(412, '2025-01-02 17:51:35', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(413, '2025-01-02 18:22:30', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(414, '2025-01-02 18:23:01', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 18:29:24', ''),
(415, '2025-01-02 18:29:29', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(416, '2025-01-02 18:32:04', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(417, '2025-01-02 18:32:25', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 18:34:14', ''),
(418, '2025-01-02 18:34:29', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(419, '2025-01-02 18:43:59', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 18:46:26', ''),
(420, '2025-01-02 18:46:33', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 19:40:18', ''),
(421, '2025-01-02 19:40:29', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(422, '2025-01-02 19:45:34', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(423, '2025-01-02 19:49:24', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 19:54:33', ''),
(424, '2025-01-02 19:54:39', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 19:56:56', ''),
(425, '2025-01-02 19:57:02', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 20:00:15', ''),
(426, '2025-01-02 20:00:22', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-02 20:00:28', ''),
(427, '2025-01-02 20:01:09', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(428, '2025-01-02 20:03:15', 'lily.admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(429, '2025-01-02 20:03:53', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(430, '2025-01-02 20:04:42', 'admin3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(431, '2025-01-02 20:05:47', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(432, '2025-01-03 02:26:32', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 02:26:48', ''),
(433, '2025-01-03 02:42:18', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 02:42:27', ''),
(434, '2025-01-03 02:42:33', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 02:42:52', ''),
(435, '2025-01-03 02:42:59', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 02:44:22', ''),
(436, '2025-01-03 02:44:29', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 02:46:55', ''),
(437, '2025-01-03 02:47:04', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 02:50:25', ''),
(438, '2025-01-03 02:50:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(439, '2025-01-03 02:53:48', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(440, '2025-01-03 02:58:36', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 03:00:54', ''),
(441, '2025-01-03 03:01:18', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(442, '2025-01-03 03:02:12', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(443, '2025-01-03 03:04:35', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, ''),
(444, '2025-01-03 03:07:14', 'admin3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Tutor', 'Login', '', NULL, ''),
(445, '2025-01-03 03:10:26', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 03:10:29', ''),
(446, '2025-01-03 03:10:40', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 18:37:02', ''),
(447, '2025-01-03 18:11:48', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 18:40:33', ''),
(448, '2025-01-03 18:17:42', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 18:37:02', ''),
(449, '2025-01-03 18:37:11', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 18:40:18', ''),
(450, '2025-01-03 18:40:23', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-03 18:40:33', ''),
(451, '2025-01-03 18:40:38', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-04 17:36:41', ''),
(452, '2025-01-04 17:10:03', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', NULL, ''),
(453, '2025-01-04 17:10:30', 'bilal.hakkul', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', NULL, ''),
(454, '2025-01-04 17:15:04', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-04 17:36:41', ''),
(455, '2025-01-04 17:35:50', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Gagal', 'Unknown', 'Login', 'Password salah', '2025-01-04 17:36:41', ''),
(456, '2025-01-04 17:36:19', 'ridho.syahfero', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-04 17:36:41', ''),
(457, '2025-01-04 17:36:49', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-04 17:37:04', ''),
(458, '2025-01-04 17:37:55', 'einsteins', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Mahasiswa', 'Login', '', '2025-01-04 17:38:16', ''),
(459, '2025-01-04 17:38:24', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(460, '2025-01-04 17:40:32', 'akunMntr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Dosen Pengampu', 'Login', '', NULL, ''),
(461, '2025-01-04 17:40:52', 'akunAdmin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'Login Berhasil', 'Admin', 'Login', '', NULL, '');

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
  `tahun_ajaran` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `fakultas` varchar(100) DEFAULT NULL,
  `id_kelompok` int(11) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
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
(22, 33, 'Bilal Hakkul Mubin', '1402022013', 'Teknik Informatika', '2022 / 2023 Ganjil (Semester 5)', 'Johndoe@gmail.com', '081317254563', 'Teknologi Informasi', 28, 'Jalan Lagoa Gg1 C1 Terusan No 14'),
(23, 34, 'Salsha Billa Yunita Sari', '1502022028', 'Ilmu Perpustakaan', '2022 / 2023 Ganjil (Semester 5)', 'salsabilla@gmailc.com', '083834155938', 'Teknologi Informasi', NULL, 'Jl. Kalibaru Barat IV No.05'),
(24, 35, 'I KOMANG ABIMANYU', '1402016053', 'Teknik Informatika', '2016 / 2017 Genap (Semester 20)', 'komangabi@gmail.com', '089637203833', 'Teknologi Informasi', 28, 'JL.TARNA BARU NO.23 RT/RW:003/010');

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
(119, 'Buku Modul Kuliah Kewirausahaan', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 'Buku ini merupakan panduan lengkap untuk memahami dan mempraktikkan konsep dasar kewirausahaan dalam dunia nyata. Disusun secara sistematis, modul ini dirancang untuk mendukung mahasiswa dalam mengikuti perkuliahan kewirausahaan dengan materi yang relevan, aplikatif, dan mudah dipahami.\r\n\r\nIsi Buku:\r\nKonsep Dasar Kewirausahaan: Definisi, sejarah, dan pentingnya kewirausahaan.\r\nPola Pikir Wirausaha (Entrepreneurial Mindset): Mengembangkan kreativitas, inovasi, dan keberanian mengambil risiko.\r\nProses ', '2025-01-01 07:01:16');

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
(1, 2, 'Mr Ridho Syahfero', '022456788', 'rendhyat@gmail.com', '089637167774', 'Entrepreneur', 'Kewirausahaan', 'Bisnis', '/Aplikasi-Kewirausahaan/components/pages/mentorbisnis/uploads/6773b6b5aee324.72886015.jpg'),
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
  `feedback` varchar(255) DEFAULT NULL,
  `anggaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `proposal_bisnis`
--

INSERT INTO `proposal_bisnis` (`id`, `judul_proposal`, `tahapan_bisnis`, `sdg`, `kategori`, `other_category`, `proposal_pdf`, `kelompok_id`, `status`, `ide_bisnis`, `feedback`, `anggaran`) VALUES
(35, 'TESTER PROPOSAL', 'Tahapan Bertumbuh', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'Bisnis Teknologi atau Digital', '', 'Progres Kerja tanggal 16 December 2024 (1402022055).pdf', 20, 'disetujui', 'TESTER', 'BAGUS BANGET', NULL),
(36, 'PROPOSAL 1', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055).pdf', 25, 'menunggu', 'BISNIS IDE', 'tes', NULL),
(40, 'PROPOSAL 2', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055) (1).pdf', 25, 'menunggu', 'CAUSE THIS IS ALL WE KNOW', NULL, NULL),
(41, 'PROPOSAL 1', 'Tahapan Awal', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'Bisnis Konstruksi dan Real Estate', '', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 26, 'disetujui', 'TES', 'Proposal Anda memiliki tujuan yang bagus', NULL),
(42, 'proposal 3', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Pariwisata dan Perhotelan', '', 'Progres Kerja tanggal 31December 2024 (1402022055).pdf', 25, 'menunggu', 'Bisnis Kambing', NULL, 20000);

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
  `feedback` varchar(255) DEFAULT NULL,
  `anggaran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `proposal_bisnis_backup`
--

INSERT INTO `proposal_bisnis_backup` (`id`, `judul_proposal`, `tahapan_bisnis`, `sdg`, `kategori`, `other_category`, `proposal_pdf`, `kelompok_id`, `status`, `ide_bisnis`, `feedback`, `anggaran`) VALUES
(35, 'TESTER PROPOSAL', 'Tahapan Bertumbuh', 'mengakhiri_kemiskinan,mengakhiri_kelaparan', 'Bisnis Teknologi atau Digital', '', 'Progres Kerja tanggal 16 December 2024 (1402022055).pdf', 20, 'disetujui', 'TESTER', 'BAGUS BANGET', NULL),
(36, 'PROPOSAL 1', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055).pdf', 25, 'menunggu', 'BISNIS IDE', 'tes', NULL),
(40, 'PROPOSAL 2', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Konstruksi dan Real Estate', '', 'Progres Kerja tanggal 23 December 2024 (1402022055) (1).pdf', 25, 'menunggu', 'CAUSE THIS IS ALL WE KNOW', NULL, NULL),
(41, 'PROPOSAL 1', 'Tahapan Awal', 'pekerjaan_pertumbuhan_ekonomi,industri_inovasi_infrastruktur', 'Bisnis Konstruksi dan Real Estate', '', 'Buku-Modul-Kuliah-Kewirausahaan.pdf', 26, 'disetujui', 'TES', 'Proposal Anda memiliki tujuan yang bagus', NULL),
(42, 'proposal 3', 'Tahapan Awal', 'mengakhiri_kemiskinan', 'Bisnis Pariwisata dan Perhotelan', '', 'Progres Kerja tanggal 31December 2024 (1402022055).pdf', 25, 'menunggu', 'Bisnis Kambing', NULL, '20000');

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
(3, 'akunAdmin', '$2y$10$nX/.ODSzsZSfYvx0Ufi8Keq0UktTybfbtDR54A/hLajur1JTWfjue', 'Admin', 0),
(8, 'mahasiswa1', '$2y$10$uXNSNBz9vAwlD7AV4E1Qn.6DxK0zKygd1LuWcdgARKC/xBIHnXm5y', 'Mahasiswa', 0),
(9, 'mahasiswa2', '$2y$10$Jt7qe4u8hF2g6WjASB0XTey08sA3hHAna8VuU.P1yLoVIHI4whV/m', 'Mahasiswa', 0),
(10, 'mahasiswa3', '$2y$10$YFFZe1tX8Cq58eJTyJNNOOkIP7MS4U325GWQ2QsREj/hahNIPkTOG', 'Mahasiswa', 0),
(13, 'admin3', '$2y$10$myraeyhvLDu8j7iK09qyxOX6Dp8vy2ed4VmS3EJgodkXjrN4U6r4u', 'Tutor', 0),
(19, 'einsteins', '$2y$10$Jb6XVt2bJMTkMj0/nbpPJu3HGFnEgzaEK4OsWJyqZBFXKwlPWeFu.', 'Mahasiswa', 0),
(20, 'fitra.rama', '$2y$10$flIOsaEwvG7ib/T9YAKMmuSWxbO4zl19kJ/3yAD3YNxgR7r78lR6G', 'Mahasiswa', 0),
(26, 'ridho.syahfero', '$2y$10$wYf/aVrLiIj5812kTgkYP.kgDXDAnRmcizHs0j5.iN.80V2.tGq02', 'Mahasiswa', 0),
(27, 'm.fadly', '$2y$10$0Ly1LagxN3316nnCxFK9NOZkcalTj3B5UH7NEqPoILdholBwFvBgy', 'Mahasiswa', 0),
(32, 'muhammad.asril', '$2y$10$NW1KpcIDt5U2O/Gd7jih.OatL61jCZ1/ToQc/fQTMrw9VMA95mtxW', 'Mahasiswa', 0),
(33, 'bilal.hakkul', '$2y$10$uAU0LsZpqzZbqSFBy60kuudIsSN3G9lrI34CFva4uuAzq/eOTePgu', 'Mahasiswa', 0),
(34, 'salsha.billa', '$2y$10$/eU8DmXMjUyIO5XH2swuN.f0r90vdlWOjfcBXkijnVZSDH.8VlVka', 'Mahasiswa', 0),
(35, 'i.komang', '$2y$10$R.wSoMuXreeaON.8aLKnPOq3QvhtJvgupJHlU6suT9B4tOCFhKZB2', 'Mahasiswa', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `laporan_bisnis`
--
ALTER TABLE `laporan_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `materi_kewirausahaan`
--
ALTER TABLE `materi_kewirausahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `mentor`
--
ALTER TABLE `mentor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `proposal_bisnis`
--
ALTER TABLE `proposal_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
