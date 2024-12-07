<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

$data = json_decode(file_get_contents('php://input'), true);
$id_kelompok = $data['id_kelompok'];
$nama_kelompok = $data['nama_kelompok'];
$ide_bisnis = $data['ide_bisnis'];

// Validasi input
if (empty($nama_kelompok) || empty($ide_bisnis)) {
    echo json_encode(['status' => 'error', 'message' => 'Semua bidang wajib diisi.']);
    exit;
}

// Update database
$query = "UPDATE kelompok_bisnis SET nama_kelompok = ?, ide_bisnis = ? WHERE id_kelompok = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param('ssi', $nama_kelompok, $ide_bisnis, $id_kelompok);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success', 'message' => 'Data berhasil diperbarui.']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Gagal memperbarui data.']);
}
?>
