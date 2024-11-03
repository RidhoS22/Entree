<?php
// Detail koneksi database
$servername = "localhost"; // Biasanya "localhost" jika menggunakan server lokal
$username = "root"; // Ganti dengan username MySQL Anda
$password = ""; // Ganti dengan password MySQL Anda
$dbname = "aplikasi_bimbingan_kewirausahaan"; // Nama database Anda

// Buat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
