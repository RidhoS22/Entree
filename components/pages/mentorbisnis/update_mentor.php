<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_kelompok'], $_POST['nama_mentor'])) {
    $id_kelompok = $_POST['id_kelompok'];
    $nama_mentor = $_POST['nama_mentor'];

    $updateSql = "UPDATE kelompok_bisnis SET mentor_bisnis = ? WHERE id_kelompok = ?";
    $stmt = $conn->prepare($updateSql);
    $stmt->bind_param('si', $nama_mentor, $id_kelompok);

    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Mentor berhasil ditambahkan ke kelompok bisnis.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Gagal menambahkan mentor: ' . $conn->error]);
    }
}

$conn->close();
?>
