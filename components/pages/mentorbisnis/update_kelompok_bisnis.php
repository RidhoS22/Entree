<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_kelompok = $_POST['id_kelompok'];
    $id_mentor = $_POST['id_mentor'];

    // Validasi input
    if (empty($id_kelompok) || empty($id_mentor)) {
        echo "Gagal: Data kelompok atau mentor tidak valid.";
        exit;
    }

    // Update id_mentor pada kelompok_bisnis
    $sql = "UPDATE kelompok_bisnis SET id_mentor = ? WHERE id_kelompok = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('ii', $id_mentor, $id_kelompok);

    if ($stmt->execute()) {
        header("Location: daftar_kelompok_bisnis_mentor.php?success=1"); // Redirect dengan parameter success
        exit;
    } else {
        echo "Gagal: " . $conn->error;
    }
}
?>
