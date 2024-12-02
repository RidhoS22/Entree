<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_SESSION['user_id'])) {
        echo json_encode(['status' => 'error', 'message' => 'User belum login.']);
        exit;
    }

    $user_id = $_SESSION['user_id'];
    $data = json_decode(file_get_contents("php://input"), true);
    $new_phone = $data['phone'] ?? '';

    // Validasi format nomor telepon
    if (!preg_match('/^\d{10,15}$/', $new_phone)) {
        echo json_encode(['status' => 'error', 'message' => 'Nomor telepon tidak valid.']);
        exit;
    }

    // Ambil nomor telepon lama dari database
    $query_check = "SELECT contact FROM mahasiswa WHERE user_id = ?";
    $stmt_check = $conn->prepare($query_check);

    if (!$stmt_check) {
        echo json_encode(['status' => 'error', 'message' => 'Error in query preparation.']);
        exit;
    }

    $stmt_check->bind_param("i", $user_id);
    $stmt_check->execute();
    $result_check = $stmt_check->get_result();
    $row = $result_check->fetch_assoc();

    if (!$row) {
        echo json_encode(['status' => 'error', 'message' => 'Data mahasiswa tidak ditemukan.']);
        exit;
    }

    $current_phone = $row['contact'];

    // Periksa apakah nomor telepon baru sama dengan nomor telepon lama
    if ($new_phone === $current_phone) {
        echo json_encode(['status' => 'error', 'message' => 'Tolong masukkan nomor telepon yang ingin diperbarui.']);
        exit;
    }

    // Update nomor telepon jika berbeda
    $query_update = "UPDATE mahasiswa SET contact = ? WHERE user_id = ?";
    $stmt_update = $conn->prepare($query_update);

    if (!$stmt_update) {
        echo json_encode(['status' => 'error', 'message' => 'Error in query preparation.']);
        exit;
    }

    $stmt_update->bind_param("si", $new_phone, $user_id);

    if ($stmt_update->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Nomor telepon berhasil diperbarui.']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Terjadi kesalahan saat memperbarui nomor telepon.']);
    }

    $stmt_check->close();
    $stmt_update->close();
    $conn->close();
    exit;
} else {
    echo json_encode(['status' => 'error', 'message' => 'Metode HTTP tidak valid.']);
    exit;
}
?>