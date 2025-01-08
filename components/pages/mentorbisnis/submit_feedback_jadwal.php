<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Ambil data dari session dan form
$feedback = isset($_POST['feedback']) ? $_POST['feedback'] : null;
$jadwalId = isset($_POST['jadwal_id']) ? $_POST['jadwal_id'] : null;

// Cek apakah feedback dan jadwal ID valid
if (!$feedback || !$jadwalId) {
    echo "Feedback atau Jadwal ID tidak valid!";
    exit;
}

// Query untuk menyimpan feedback ke database
$sql = "UPDATE jadwal SET feedback_mentor = ? WHERE id = ?";

// Persiapkan query
$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $feedback, $jadwalId);

// Eksekusi query
if ($stmt->execute()) {
    // Jika berhasil, tampilkan toast sukses
    header("Location: detail_jadwal_mentor.php?id=$jadwalId&toast=Umpan Balik berhasil dikirim");
    exit;
} else {
    // Jika gagal, tampilkan pesan error
    echo "Terjadi kesalahan saat menyimpan Umpan Balik: " . $stmt->error;
    exit;
}
?>
