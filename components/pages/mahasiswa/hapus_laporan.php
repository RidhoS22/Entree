<?php
// Mengimpor koneksi database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mendapatkan ID proposal dari URL
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Menyiapkan query untuk menghapus proposal berdasarkan ID
    $sql = "DELETE FROM laporan_bisnis WHERE id = ?";

    // Menyiapkan statement
    if ($stmt = $conn->prepare($sql)) {
        // Bind parameter
        $stmt->bind_param("i", $id);

        // Eksekusi query
        if ($stmt->execute()) {
            // Jika berhasil menghapus, redirect ke halaman daftar proposal
            header("Location: laporan_bisnis_mahasiswa.php?message=Laporan Kemajuan berhasil dihapus");
            exit();
        } else {
            // Jika gagal menghapus, tampilkan pesan error
            echo "Terjadi kesalahan saat menghapus laporan.";
        }

        // Menutup statement
        $stmt->close();
    } else {
        echo "Terjadi kesalahan pada query database.";
    }
} else {
    // Jika ID tidak ditemukan, tampilkan pesan error
    echo "ID proposal tidak ditemukan.";
}

// Menutup koneksi database
$conn->close();
?>
