<?php
// update_kelompok.php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mengambil data yang dikirimkan oleh frontend
$data = json_decode(file_get_contents('php://input'), true);

// Mengambil data dari JSON
$nama_kelompok = mysqli_real_escape_string($conn, $data['nama_kelompok']);
$nama_bisnis = mysqli_real_escape_string($conn, $data['nama_bisnis']);
$id_kelompok = $data['id_kelompok'];

// Query untuk memperbarui data kelompok bisnis
$updateQuery = "
    UPDATE kelompok_bisnis 
    SET nama_kelompok = '$nama_kelompok', nama_bisnis = '$nama_bisnis'
    WHERE id_kelompok = $id_kelompok
";

if (mysqli_query($conn, $updateQuery)) {
    // Jika berhasil
    echo json_encode(['status' => 'success']);
} else {
    // Jika gagal
    echo json_encode(['status' => 'error', 'message' => mysqli_error($conn)]);
}

mysqli_close($conn);
?>
