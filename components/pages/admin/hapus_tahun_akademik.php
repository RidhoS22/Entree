<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Ambil parameter
$tahun = $_GET['tahun'];
$jenis = $_GET['jenis'];

// Hapus data berdasarkan parameter
$sql = "DELETE FROM tahun_akademik WHERE tahun = '$tahun' AND jenis_tahun = '$jenis'";
if ($conn->query($sql) === TRUE) {
    echo "<script>alert('Tahun akademik berhasil dihapus!'); window.location.href='tahun_akademik.php';</script>";
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>
