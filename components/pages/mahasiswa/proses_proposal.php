<?php
// Koneksi ke database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Pastikan mahasiswa sudah login dan memiliki session
session_start();
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

if ($result_kelompok && mysqli_num_rows($result_kelompok) > 0) {
    // Ambil id_kelompok yang terkait dengan mahasiswa
    $kelompok = mysqli_fetch_assoc($result_kelompok);
    $id_kelompok = $kelompok['id_kelompok'];

    // Simpan id_kelompok ke dalam session
    $_SESSION['id_kelompok'] = $id_kelompok;
} else {
    echo "<script>alert('Anda tidak terdaftar dalam kelompok!');</script>";
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil data dari form
    $judul_proposal = $_POST['judul_proposal'];
    $tahapan_bisnis = $_POST['tahapan_bisnis'];
    $sdg = implode(',', $_POST['sdg']); // Menyimpan SDG dalam format array
    $kategori = $_POST['kategori'];
    $other_category = isset($_POST['other_category']) ? $_POST['other_category'] : null;
    $proposal_file = $_FILES['proposal'];

    // Validasi dan proses file PDF
    if ($proposal_file['error'] == 0) {
        $fileTmpName = $proposal_file['tmp_name'];
        $fileName = $proposal_file['name'];
        $filePath = 'uploads/' . $fileName;

        // Pindahkan file ke folder yang ditentukan
        if (move_uploaded_file($fileTmpName, $filePath)) {
            // Masukkan data ke database
            $sql = "INSERT INTO proposal_bisnis (judul_proposal, tahapan_bisnis, sdg, kategori, other_category, proposal_pdf, kelompok_id)
                    VALUES ('$judul_proposal', '$tahapan_bisnis', '$sdg', '$kategori', '$other_category', '$filePath', '$id_kelompok')";
            
            if (mysqli_query($conn, $sql)) {
                echo "<script>alert('Proposal berhasil diajukan!');</script>";
                // Redirect ke halaman lain setelah berhasil mengirim data
                header('Location: proposal_bisnis_mahasiswa.php');
                exit;
            } else {
                echo "<script>alert('Terjadi kesalahan dalam mengajukan proposal!');</script>";
            }
        } else {
            echo "<script>alert('Gagal mengunggah file!');</script>";
        }
    } else {
        echo "<script>alert('Silakan pilih file proposal PDF!');</script>";
    }
}
?>
