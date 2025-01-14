<?php
session_start();
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: /Entree/login');
    exit;
}

// Cek apakah role pengguna sesuai
if ($_SESSION['role'] !== 'Mahasiswa') {
    header('Location: /Entree/login');
    exit;
}
include $_SERVER['DOCUMENT_ROOT'] . '/Entree/config/db_connection.php';

$data = $_POST;
$id_kelompok = $data['id_kelompok'];
$nama_kelompok = $data['nama_kelompok'];
$nama_bisnis = $data['nama_bisnis'];
$uploadDir = 'logos/';
$logo_bisnis = null;

// Cek apakah file logo diunggah
if (isset($_FILES['logo_bisnis']) && $_FILES['logo_bisnis']['error'] === UPLOAD_ERR_OK) {
    $fileTmpPath = $_FILES['logo_bisnis']['tmp_name'];
    $fileName = time() . '_' . $_FILES['logo_bisnis']['name']; // Buat nama file unik dengan timestamp
    $destination = $uploadDir . $fileName;

    // Pindahkan file ke folder tujuan
    if (move_uploaded_file($fileTmpPath, $destination)) {
        $logo_bisnis = $fileName; // Simpan hanya nama file
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Gagal mengunggah logo bisnis.']);
        exit;
    }
}

// Update database
$sql = "UPDATE kelompok_bisnis 
        SET nama_kelompok = ?, nama_bisnis = ?, logo_bisnis = IFNULL(?, logo_bisnis) 
        WHERE id_kelompok = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('sssi', $nama_kelompok, $nama_bisnis, $logo_bisnis, $id_kelompok);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Gagal memperbarui data kelompok bisnis.']);
}
?>
