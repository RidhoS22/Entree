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

if (!isset($_SESSION['npm'])) {
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
    $laporan_penjualan = isset($_POST['laporan_penjualan']) ? htmlspecialchars(str_replace(["\r", "\n"], ' ', $_POST['laporan_penjualan'])) : null;
    $laporan_pemasaran = isset($_POST['laporan_pemasaran']) ? htmlspecialchars(str_replace(["\r", "\n"], ' ', $_POST['laporan_pemasaran'])) : null;
    $laporan_produksi = isset($_POST['laporan_produksi']) ? htmlspecialchars(str_replace(["\r", "\n"], ' ', $_POST['laporan_produksi'])) : null;
    $laporan_sdm = isset($_POST['laporan_sdm']) ? htmlspecialchars(str_replace(["\r", "\n"], ' ', $_POST['laporan_sdm'])) : null;
    $laporan_keuangan = isset($_POST['laporan_keuangan']) ? htmlspecialchars(str_replace(["\r", "\n"], ' ', $_POST['laporan_keuangan'])) : null;

    $judul_laporan = mysqli_real_escape_string($conn, $_POST['judul_laporan']);
    $jenis_laporan = mysqli_real_escape_string($conn, $_POST['jenis_laporan']);

    if (!isset($_SESSION['id_kelompok'])) {
        echo "ID kelompok tidak ditemukan di session!";
        exit;
    }
    $id_kelompok = $_SESSION['id_kelompok'];

    $lampiran_dir = $_SERVER['DOCUMENT_ROOT'] . '/Entree/components/pages/mahasiswa/uploads/laporan_kemajuan/';
    if (!is_dir($lampiran_dir)) {
        mkdir($lampiran_dir, 0777, true);
    }

    $uploaded_files = [];
    if (isset($_FILES['lampiran_laporan']) && count($_FILES['lampiran_laporan']['name']) > 0) {
        foreach ($_FILES['lampiran_laporan']['name'] as $key => $file_name) {
            $file_tmp = $_FILES['lampiran_laporan']['tmp_name'][$key];
            $file_size = $_FILES['lampiran_laporan']['size'][$key];
            $file_error = $_FILES['lampiran_laporan']['error'][$key];
            $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

            if ($file_error === 0 && $file_ext === 'pdf') {
                $file_destination = $lampiran_dir . $file_name;
                $file_counter = 1;
                while (file_exists($file_destination)) {
                    $file_name_no_ext = pathinfo($file_name, PATHINFO_FILENAME);
                    $file_destination = $lampiran_dir . $file_name_no_ext . '_' . $file_counter . '.' . $file_ext;
                    $file_counter++;
                }

                if (move_uploaded_file($file_tmp, $file_destination)) {
                    $uploaded_files[] = basename($file_destination);
                }
            }
        }
    }

    $lampiran_json = count($uploaded_files) > 0 ? json_encode($uploaded_files) : null;
    $tanggal_upload = date('Y-m-d H:i:s');

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
        $lampiran_json,
        $tanggal_upload,
        $id_kelompok
    );

    if ($stmt->execute()) {
        header("Location: laporan_bisnis");
        exit;
    } else {
        header("Location: laporan_bisnis");
        exit;
    }
} else {
    header("Location: laporan_bisnis");
    exit;
}
?>