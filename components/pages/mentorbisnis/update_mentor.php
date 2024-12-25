<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_kelompok'], $_POST['id_mentor'])) {
    $id_kelompok = $_POST['id_kelompok'];
    $id_mentor = $_POST['id_mentor'];

    $updateSql = "UPDATE kelompok_bisnis SET id_mentor = ? WHERE id_kelompok = ?";
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
