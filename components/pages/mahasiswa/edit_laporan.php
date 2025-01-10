<?php
session_start();
// Koneksi ke database
include $_SERVER['DOCUMENT_ROOT'] . '/Entree/config/db_connection.php';
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: /Entree/login');
    exit;
}

// Cek apakah role pengguna sesuai
if ($_SESSION['role'] !== 'Mahasiswa') {
    header('Location: /Entree/login');
    exit;
}

if (isset($_POST['kirim'])) {
    // Mengambil data dari form
    $id_laporan = $_POST['id_laporan'];
    $judul_laporan = $_POST['judul_laporan'];
    $jenis_laporan = $_POST['jenis_laporan'];
    $laporan_penjualan = $_POST['laporan_penjualan'];
    $laporan_pemasaran = $_POST['laporan_pemasaran'];
    $laporan_produksi = $_POST['laporan_produksi'];
    $laporan_sdm = $_POST['laporan_sdm'];
    $laporan_keuangan = $_POST['laporan_keuangan'];

    // Mengunggah lampiran jika ada
    $lampiran_laporan = null;
    if (isset($_FILES['lampiran_laporan']) && $_FILES['lampiran_laporan']['error'][0] == 0) {
        // Mengambil file yang diunggah
        $file_names = $_FILES['lampiran_laporan']['name'];
        $file_tmp = $_FILES['lampiran_laporan']['tmp_name'];
        $file_type = $_FILES['lampiran_laporan']['type'];
        $file_error = $_FILES['lampiran_laporan']['error'];

        // Menyimpan file PDF
        $lampiran_laporan = [];
        foreach ($file_names as $key => $file_name) {
            $target_dir = "uploads/"; // Direktori untuk menyimpan file
            $target_file = $target_dir . basename($file_name);

            if ($file_error[$key] == 0 && $file_type[$key] == 'application/pdf') {
                if (move_uploaded_file($file_tmp[$key], $target_file)) {
                    $lampiran_laporan[] = $target_file;
                }
            }
        }
        // Menyimpan lampiran sebagai JSON string
        $lampiran_laporan = json_encode($lampiran_laporan);
    }

    // Menyusun query untuk memperbarui laporan
    $sql = "UPDATE laporan_bisnis SET 
                judul_laporan = ?, 
                jenis_laporan = ?, 
                laporan_penjualan = ?, 
                laporan_pemasaran = ?, 
                laporan_produksi = ?, 
                laporan_sdm = ?, 
                laporan_keuangan = ?";

    // Jika ada lampiran baru, tambahkan ke query
    if ($lampiran_laporan) {
        $sql .= ", laporan_pdf = ?";
    }

    // Menambahkan kondisi WHERE untuk ID laporan yang ingin diperbarui
    $sql .= " WHERE id = ?";

    // Persiapkan query
    if ($stmt = $conn->prepare($sql)) {
        // Bind parameter untuk query
        if ($lampiran_laporan) {
            $stmt->bind_param('ssssssssi', $judul_laporan, $jenis_laporan, $laporan_penjualan, $laporan_pemasaran, $laporan_produksi, $laporan_sdm, $laporan_keuangan, $lampiran_laporan, $id_laporan);
        } else {
            $stmt->bind_param('sssssssi', $judul_laporan, $jenis_laporan, $laporan_penjualan, $laporan_pemasaran, $laporan_produksi, $laporan_sdm, $laporan_keuangan, $id_laporan);
        }

        // Eksekusi query
        if ($stmt->execute()) {
            echo "Laporan berhasil diperbarui!";
            header("Location: laporan_bisnis"); // Redirect ke halaman daftar laporan setelah berhasil
        } else {
            echo "Terjadi kesalahan: " . $stmt->error;
        }
    }

    // Tutup koneksi dan statement
    $stmt->close();
    $conn->close();
}
?>