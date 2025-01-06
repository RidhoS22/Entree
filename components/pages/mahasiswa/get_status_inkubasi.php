<?php
session_start();
// Ambil status inkubasi dari database untuk kelompok tertentu
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

$id_kelompok = $_GET['kelompok_id']; // Ambil ID kelompok dari parameter URL

// Query untuk mengambil status inkubasi
$query = "SELECT status_inkubasi FROM kelompok_bisnis WHERE id_kelompok = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $id_kelompok);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    echo json_encode(['status' => $row['status_inkubasi']]);
} else {
    echo json_encode(['status' => null]);
}
?>
