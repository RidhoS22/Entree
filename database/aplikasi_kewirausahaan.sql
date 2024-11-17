-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17 Nov 2024 pada 15.52
-- Versi Server: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktur dari tabel `daftar_mentor_bisnis`
--

CREATE TABLE `daftar_mentor_bisnis` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `deskripsi` varchar(30) NOT NULL,
  `kontak` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `daftar_mentor_bisnis`
--

INSERT INTO `daftar_mentor_bisnis` (`id`, `nama`, `deskripsi`, `kontak`) VALUES
(2, 'Asril', 'Mentor Bisnis', '098427928'),
(3, 'Fadly', 'Dosen pengampu', '08234234242'),
(4, 'Afandhi', 'Mentor Bisnis', '098427928'),
(6, 'Ridho', 'Mentor Bisnis', '082125352516'),
(7, 'Syavero', 'Dosen Pengampu', '08211351I248');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(5) NOT NULL,
  `deskripsi` text NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `nama_kegiatan`, `tanggal`, `waktu`, `deskripsi`, `lokasi`, `status`) VALUES
(14, 'Bimbingan 1', '2024-11-17', '21:44', 'Istilah deskripsi memang sudah tidak asing lagi. Jenis teks deskripsi ini bisa ditemukan di mana-mana. Ada banyak jenis-jenis teks di dalam sebuah tulisan. Pada dasarnya, deskripsi adalah menjabarkan tentang sesuatu.', 'Yarsi', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('mahasiswa','mentor bisnis','admin pikk') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `role`) VALUES
(1, 'akunMahasiswa', '$2y$10$IijNYnS5NsREQ.VRjMgMB..cW.ejLJ5J/dxxhPUZJP7mF9WqxKnR2', 'mahasiswa'),
(2, 'akunMentor', '$2y$10$DRkDuU5c9x3CjsCTwbBhreMCJGnnJO/eFrDJrSADEKsvuz59Yg2uy', 'mentor bisnis'),
(3, 'akunAdmin', '$2y$10$2yib7FLRmOSYLMwC4ThuFOAvx5oeSMxGe57iwZ8VHUTcE96Iyd58y', 'admin pikk');

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
  `tahun_angkatan` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `nama`, `npm`, `program_studi`, `tahun_angkatan`, `email`, `contact`) VALUES
(1, 1, 'Ridho Syahfero', '1402022055', 'Teknik Informatika', '2022/2023 Teknik Informatika', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi_kewirausahaan`
--

CREATE TABLE `materi_kewirausahaan` (
  `id` int(11) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `file_path` varchar(300) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `peran` enum('dosen_pengampu','tutor') DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mentor`
--

INSERT INTO `mentor` (`id`, `user_id`, `nama`, `nidn`, `peran`, `email`, `contact`) VALUES
(1, 2, 'Tes Mentor', '022456788', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('mahasiswa','mentor','admin') NOT NULL,
  `first_login` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `first_login`) VALUES
(1, 'ridho.syahfero', '$2y$10$b3QGkvFZHitvz1OFfRWZLOMtgtLA/fECvebDxcSwnpYupDSIMt93G', 'mahasiswa', 1),
(2, 'akunMntr', '$2y$10$7aCTxTjDGfzG7N/3eVjrtO5g13wGc/RaqaDZbuZMRo7B/XHzKa3Me', 'mentor', 1),
(3, 'akunAdmin', '$2y$10$NuIAAIWAu7axw6tIyD1HFuuV5F4hR.q7koI3VQF0KUHJWM7jc2z6K', 'admin', 0);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `npm` (`npm`),
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_mentor_bisnis`
--
ALTER TABLE `daftar_mentor_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `materi_kewirausahaan`
--
ALTER TABLE `materi_kewirausahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `mentor`
--
ALTER TABLE `mentor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mentor`
--
ALTER TABLE `mentor`
  ADD CONSTRAINT `mentor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
