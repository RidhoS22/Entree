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
// Koneksi ke database
include $_SERVER['DOCUMENT_ROOT'] . '/Entree/config/db_connection.php';
// Mengambil data dari body request JSON
$data = json_decode(file_get_contents('php://input'), true);

// Mengecek apakah data yang diperlukan ada
if (isset($data['id_kelompok'], $data['nama_kelompok'], $data['nama_bisnis'])) {
    $id_kelompok = $data['id_kelompok'];
    $nama_kelompok = $data['nama_kelompok'];
    $nama_bisnis = $data['nama_bisnis'];

    // Query untuk mengupdate data kelompok
    $sql = "UPDATE kelompok_bisnis SET nama_kelompok = ?, nama_bisnis = ? WHERE id_kelompok = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssi", $nama_kelompok, $nama_bisnis, $id_kelompok);

    // Menjalankan query dan mengecek hasilnya
    if ($stmt->execute()) {
        // Jika berhasil mengupdate data
        echo json_encode(['status' => 'success', 'message' => 'Data berhasil diperbarui.']);
    } else {
        // Jika terjadi kesalahan saat mengupdate
        echo json_encode(['status' => 'error', 'message' => 'Terjadi kesalahan saat memperbarui data.']);
    }

    // Menutup statement
    $stmt->close();
} else {
    // Jika data tidak lengkap
    echo json_encode(['status' => 'error', 'message' => 'Data tidak lengkap.']);
}

// Menutup koneksi
$conn->close();
?>
