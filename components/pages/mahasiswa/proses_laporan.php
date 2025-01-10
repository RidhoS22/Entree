<?php
session_start();
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
// Pastikan mahasiswa sudah login dan memiliki session

if (!isset($_SESSION['npm'])) {
    // Redirect jika mahasiswa belum login
    header('Location: login.php');
    exit;
}
// Ambil npm_mahasiswa dari sesi
$npm_mahasiswa = $_SESSION['npm'];

// Query untuk mengambil id_kelompok dari anggota_kelompok
$query_kelompok = "SELECT k.id_kelompok 
                   FROM kelompok_bisnis k
                   JOIN anggota_kelompok a ON k.id_kelompok = a.id_kelompok
                   WHERE k.npm_ketua = '$npm_mahasiswa' OR a.npm_anggota = '$npm_mahasiswa'";

$result_kelompok = mysqli_query($conn, $query_kelompok);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil data laporan yang di-submit dari form
    $laporan_penjualan = isset($_POST['laporan_penjualan']) && !empty($_POST['laporan_penjualan']) ? str_replace(array("\r", "\n"), ' ', $_POST['laporan_penjualan']) : null;
    $laporan_pemasaran = isset($_POST['laporan_pemasaran']) && !empty($_POST['laporan_pemasaran']) ? str_replace(array("\r", "\n"), ' ', $_POST['laporan_pemasaran']) : null;
    $laporan_produksi = isset($_POST['laporan_produksi']) && !empty($_POST['laporan_produksi']) ? str_replace(array("\r", "\n"), ' ', $_POST['laporan_produksi']) : null;
    $laporan_sdm = isset($_POST['laporan_sdm']) && !empty($_POST['laporan_sdm']) ? str_replace(array("\r", "\n"), ' ', $_POST['laporan_sdm']) : null;
    $laporan_keuangan = isset($_POST['laporan_keuangan']) && !empty($_POST['laporan_keuangan']) ? str_replace(array("\r", "\n"), ' ', $_POST['laporan_keuangan']) : null;

    // Selain itu, jika Anda ingin mengubah karakter khusus (seperti tanda kutip, dll) menjadi entitas HTML
    $judul_laporan = mysqli_real_escape_string($conn, $_POST['judul_laporan']);
    $jenis_laporan = mysqli_real_escape_string($conn, $_POST['jenis_laporan']);
    $laporan_penjualan = htmlspecialchars($laporan_penjualan);
    $laporan_pemasaran = htmlspecialchars($laporan_pemasaran);
    $laporan_produksi = htmlspecialchars($laporan_produksi);
    $laporan_sdm = htmlspecialchars($laporan_sdm);
    $laporan_keuangan = htmlspecialchars($laporan_keuangan);

    // Ambil ID kelompok dari session
    if (!isset($_SESSION['id_kelompok'])) {
        echo "ID kelompok tidak ditemukan di session!";
        exit;
    }
    $id_kelompok = $_SESSION['id_kelompok'];

    // Proses upload file lampiran
    $lampiran_dir = $_SERVER['DOCUMENT_ROOT'] . '/Entree/components/pages/mahasiswa/uploads/laporan_kemajuan/';
    if (!is_dir($lampiran_dir)) {
        mkdir($lampiran_dir, 0777, true); // Buat direktori jika belum ada
    }

    // Array untuk menyimpan nama file yang berhasil diupload
    $uploaded_files = [];

    // Cek apakah ada file yang diupload
    if (isset($_FILES['lampiran_laporan']) && count($_FILES['lampiran_laporan']['name']) > 0) {
        foreach ($_FILES['lampiran_laporan']['name'] as $key => $file_name) {
            // Mendapatkan informasi file
            $file_tmp = $_FILES['lampiran_laporan']['tmp_name'][$key];
            $file_size = $_FILES['lampiran_laporan']['size'][$key];
            $file_error = $_FILES['lampiran_laporan']['error'][$key];

            // Validasi file (hanya file PDF dan ukuran file)
            $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
            if ($file_error === 0 && $file_ext === 'pdf') {
                // Pastikan file tidak menimpa file lain
                $file_destination = $lampiran_dir . $file_name;

                // Jika file sudah ada, tambahkan suffix (misalnya '_1')
                $file_counter = 1;
                while (file_exists($file_destination)) {
                    $file_name_no_ext = pathinfo($file_name, PATHINFO_FILENAME);
                    $file_destination = $lampiran_dir . $file_name_no_ext . '_' . $file_counter . '.' . $file_ext;
                    $file_counter++;
                }

                // Memindahkan file ke direktori tujuan
                if (move_uploaded_file($file_tmp, $file_destination)) {
                    // Menyimpan basename file (tanpa path) yang berhasil diupload
                    $uploaded_files[] = basename($file_destination);
                } else {
                    echo "Error: Gagal mengupload file $file_name.<br>";
                }
            } else {
                echo "Error: Hanya file PDF yang diperbolehkan atau terjadi kesalahan pada file $file_name.<br>";
            }
        }
    }

    // Konversi array file ke format JSON untuk disimpan di database
    $lampiran_json = count($uploaded_files) > 0 ? json_encode($uploaded_files) : null; // Jika tidak ada file, set ke null

    // Ambil tanggal upload
    $tanggal_upload = date('Y-m-d H:i:s'); // Mengambil tanggal dan waktu saat ini

    // Simpan laporan ke database
    $stmt = $conn->prepare("INSERT INTO laporan_bisnis (judul_laporan, jenis_laporan, laporan_penjualan, laporan_pemasaran, laporan_produksi, laporan_sdm, laporan_keuangan, laporan_pdf, tanggal_upload, id_kelompok) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param(
        "sssssssssi",
        $judul_laporan,
        $jenis_laporan,
        $laporan_penjualan,
        $laporan_pemasaran,
        $laporan_produksi,
        $laporan_sdm,
        $laporan_keuangan,
        $lampiran_json, // ini bisa null jika tidak ada file yang diupload
        $tanggal_upload,
        $id_kelompok
    );

    if ($stmt->execute()) {
        $_SESSION['message'] = "Laporan berhasil diunggah!";
        header("Location: laporan_bisnis");
        exit;
    } else {
        $_SESSION['error'] = "Gagal menyimpan laporan ke database!";
        header("Location: laporan_bisnis");
        exit;
    }
} else {
    header("Location: laporan_bisnis");
    exit;
}
?>