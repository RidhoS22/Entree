<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ambil data dari form
    $id = $_POST['id'];
    $judul = $conn->real_escape_string($_POST['judul']);
    $deskripsi = $conn->real_escape_string($_POST['deskripsi']);

    // SQL untuk mengupdate materi
    $sql = "UPDATE materi_kewirausahaan SET judul = '$judul', deskripsi = '$deskripsi' WHERE id = '$id'";

    if ($conn->query($sql) === TRUE) {
        // Pada file edit_materi.php setelah update berhasil
        header("Location: detail_materi_kewirausahaan.php?id=" . $id . "&status=success");
        exit();
    } else {
        // Pada file edit_materi.php setelah gagal update
        header("Location: detail_materi_kewirausahaan.php?id=" . $id . "&status=error");
        exit();
    }
}

$conn->close();
?>
