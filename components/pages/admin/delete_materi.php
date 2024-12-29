<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if (!isset($_GET['id'])) {
    echo "ID materi tidak ditemukan.";
    exit;
}

$id = $conn->real_escape_string($_GET['id']);

$baseDir = '/Aplikasi-Kewirausahaan/components/pages/admin/uploads/';

$sql = "SELECT * FROM materi_kewirausahaan WHERE id = '$id'";
$result = $conn->query($sql);

if ($result === false || $result->num_rows === 0) {
    header("Location: materikewirausahaan_admin.php?status=error");
    exit;
}

$row = $result->fetch_assoc();
$filePath = $baseDir . htmlspecialchars($row["file_path"]);

// Hapus file dari server
if (file_exists($filePath)) {
    unlink($filePath);
}

// Hapus data dari database
$deleteSql = "DELETE FROM materi_kewirausahaan WHERE id = '$id'";
if ($conn->query($deleteSql) === TRUE) {
    header("Location: materikewirausahaan_admin.php?status=success");
} else {
    header("Location: materikewirausahaan_admin.php?status=error");
}

$conn->close();
exit;
?>