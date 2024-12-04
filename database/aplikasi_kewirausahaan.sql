-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Des 2024 pada 13.16
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
(13, 10, '1402022068'),
(14, 10, '1402022040'),
(19, 14, '1402022060');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_mentor_bisnis`
--

CREATE TABLE `daftar_mentor_bisnis` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `deskripsi` varchar(30) NOT NULL,
  `kontak` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `agenda` text NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `feedback_mentor` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `nama_kegiatan`, `tanggal`, `waktu`, `agenda`, `lokasi`, `status`, `feedback_mentor`) VALUES
(14, 'Bimbingan 1', '2024-11-17', '21:44', 'Istilah deskripsi memang sudah tidak asing lagi. Jenis teks deskripsi ini bisa ditemukan di mana-mana. Ada banyak jenis-jenis teks di dalam sebuah tulisan. Pada dasarnya, deskripsi adalah menjabarkan tentang sesuatu.', 'Yarsi', '', ''),
(15, 'Bimbingan 2', '2024-11-21', '10:00', 'ingiin membahas tentang sesuatu yang ada ', 'Ruang Rapat FTI', '', ''),
(19, 'Bimbingan 3', '2024-12-04', '13:03', 'Bimbingan ', 'Ruang Rapat', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_bisnis`
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
-- Dumping data untuk tabel `kelompok_bisnis`
--

INSERT INTO `kelompok_bisnis` (`id_kelompok`, `npm_ketua`, `nama_kelompok`, `nama_bisnis`, `ide_bisnis`, `logo_bisnis`, `mentor_bisnis`) VALUES
(10, '1402022055', 'ArTech', 'BMW RENT', 'BMW RENT INDONESIA', 'BMW.svg_.png', 'Sr Rendhy'),
(14, '1402022044', 'MACAN', 'Bisnis Ikan', 'Menjual ikan dengan harga us dollar', '5a85e6b620358754a3b71b8cf0d23bc1.jpg', 'Lily Devita');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `nama`, `npm`, `program_studi`, `tahun_angkatan`, `email`, `contact`) VALUES
(1, 1, 'Ridho Syahfero', '1402022055', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'ridhosyahfero35@gmail.com', '089645672224'),
(2, 6, 'Asril Affandhi', '1402022068', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'asrilaffandhi@gmail.com', '089645672223'),
(3, 7, 'Fadly Abdillah', '1402022040', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'ridhosyahfero35@gmail.com', '089645672244'),
(4, 8, 'Ruffino Noor', '1402022044', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'asrilaffandhi@gmail.com', '089637167775'),
(5, 9, 'Sharil Hamza', '1402022060', 'Teknik Informatika', '2022/2023 Teknik Informatika', 'akunmllimitbruno@gmail.com', '089637162255'),
(6, 10, 'John Doe', '1402023001', 'Teknik Informatika', '2023/2024 Teknik Informatika', '', '');

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
  `prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mentor`
--

INSERT INTO `mentor` (`id`, `user_id`, `nama`, `nidn`, `email`, `contact`, `keahlian`, `fakultas`, `prodi`) VALUES
(1, 2, 'Sr Rendhy', '022456788', 'rendhyat@gmail.com', '089637167776', 'Entrepreneur', 'Kewirausahaan', 'Bisnis'),
(2, 13, 'Lily Devita', '02247896', 'ridhosyahfero35@gmail.com', '089637167773', 'Busineseman', 'Kewirausahaan', 'Bisnis');

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
(2, 'akunMntr', '$2y$10$7aCTxTjDGfzG7N/3eVjrtO5g13wGc/RaqaDZbuZMRo7B/XHzKa3Me', 'Tutor', 0),
(3, 'akunAdmin', '$2y$10$NuIAAIWAu7axw6tIyD1HFuuV5F4hR.q7koI3VQF0KUHJWM7jc2z6K', 'Admin', 0),
(6, 'asril.affandhi', '$2y$10$R0cSSdyr.54ypvNZP5NmlO4l.6bqw9iXIrPXF3qiqcRPliIWC90M.', 'Mahasiswa', 0),
(7, 'fadly.abdillah', '$2y$10$k9swYB1RsxVfWqgjp8YU2O3Ekok8/VukQlUAyWrSJTeayY8EujeFi', 'Mahasiswa', 0),
(8, 'mahasiswa1', '$2y$10$uXNSNBz9vAwlD7AV4E1Qn.6DxK0zKygd1LuWcdgARKC/xBIHnXm5y', 'Mahasiswa', 0),
(9, 'mahasiswa2', '$2y$10$Jt7qe4u8hF2g6WjASB0XTey08sA3hHAna8VuU.P1yLoVIHI4whV/m', 'Mahasiswa', 0),
(10, 'mahasiswa3', '$2y$10$YFFZe1tX8Cq58eJTyJNNOOkIP7MS4U325GWQ2QsREj/hahNIPkTOG', 'Mahasiswa', 1),
(13, 'lily.admin', '$2y$10$myraeyhvLDu8j7iK09qyxOX6Dp8vy2ed4VmS3EJgodkXjrN4U6r4u', 'Dosen Pengampu', 0);

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
-- Indeks untuk tabel `daftar_mentor_bisnis`
--
ALTER TABLE `daftar_mentor_bisnis`
  ADD PRIMARY KEY (`id`);

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
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `npm` (`npm`),
  ADD UNIQUE KEY `unique_contact` (`contact`),
  ADD KEY `user_id` (`user_id`);

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
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota_kelompok`
--
ALTER TABLE `anggota_kelompok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `daftar_mentor_bisnis`
--
ALTER TABLE `daftar_mentor_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `kelompok_bisnis`
--
ALTER TABLE `kelompok_bisnis`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mentor`
--
ALTER TABLE `mentor`
  ADD CONSTRAINT `mentor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
