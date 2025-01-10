<?php
session_start();
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: /Entree/login');
    exit;
}

// Cek apakah role pengguna sesuai
if ($_SESSION['role'] !== 'Tutor' && $_SESSION['role'] !== 'Dosen Pengampu') {
    header('Location: /Entree/login');
    exit;
}
include $_SERVER['DOCUMENT_ROOT'] . '/Entree/config/db_connection.php';

// Cek apakah file foto diunggah
if (isset($_FILES['profile_picture'])) {
    $file = $_FILES['profile_picture'];
    $fileName = $_FILES['profile_picture']['name'];
    $fileTmpName = $_FILES['profile_picture']['tmp_name'];
    $fileSize = $_FILES['profile_picture']['size'];
    $fileError = $_FILES['profile_picture']['error'];
    $fileType = $_FILES['profile_picture']['type'];

    // Validasi format file
    $allowedTypes = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif'];
    if (!in_array($fileType, $allowedTypes)) {
        echo json_encode(['success' => false, 'message' => 'Format file tidak valid.']);
        exit;
    }

    // Cek jika ada error saat upload
    if ($fileError !== 0) {
        echo json_encode(['success' => false, 'message' => 'Terjadi kesalahan saat mengunggah foto.']);
        exit;
    }

    // Tentukan lokasi folder untuk menyimpan foto
    $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/Entree/components/pages/mentorbisnis/uploads/';
    if (!file_exists($uploadDir)) {
        mkdir($uploadDir, 0777, true); // Buat folder jika belum ada
    }

    // Buat nama file yang unik
    $fileExt = pathinfo($fileName, PATHINFO_EXTENSION);
    $fileNewName = uniqid('', true) . '.' . $fileExt;
    $fileDestination = $uploadDir . $fileNewName;

    // Pindahkan file yang diunggah ke folder
    if (move_uploaded_file($fileTmpName, $fileDestination)) {
        // Update URL foto di database
        $photoUrl = '/Entree/components/pages/mentorbisnis/uploads/' . $fileNewName;

        // Update di database (tabel mentor)
        $stmt = $conn->prepare("UPDATE mentor SET foto_profile = ? WHERE user_id = (SELECT id FROM users WHERE username = ?)");
        $stmt->bind_param("ss", $photoUrl, $_SESSION['username']);
        if ($stmt->execute()) {
            echo json_encode(['success' => true, 'photo_url' => $photoUrl]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Gagal memperbarui database.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Gagal mengunggah foto.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Tidak ada file yang diunggah.']);
}
?>