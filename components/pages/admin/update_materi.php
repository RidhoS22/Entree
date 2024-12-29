<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $conn->real_escape_string($_POST['id']);
    $judul = $conn->real_escape_string($_POST['judul']);
    $deskripsi = $conn->real_escape_string($_POST['deskripsi']);

    $sql = "UPDATE materi_kewirausahaan SET judul = '$judul', deskripsi = '$deskripsi' WHERE id = '$id'";

    if ($conn->query($sql) === TRUE) {
        echo "Materi berhasil diperbarui.";
    } else {
        echo "Gagal memperbarui materi: " . $conn->error;
    }

    $conn->close();
    header("Location: materi_kewirausahaan.php"); // Kembali ke halaman utama
    exit;
}
?>
