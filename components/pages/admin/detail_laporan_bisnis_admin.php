<?php
session_start();
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: /Entree/login');
    exit;
}

// Cek apakah role pengguna sesuai
if ($_SESSION['role'] !== 'Admin') {
    header('Location: /Entree/login');
    exit;
}
include $_SERVER['DOCUMENT_ROOT'] . '/Entree/config/db_connection.php';

// Mendapatkan ID laporan dan ID kelompok dari parameter URL dan validasi
$id_laporan = isset($_GET['id']) ? $_GET['id'] : null;
$id_kelompok = isset($_GET['id_kelompok']) ? $_GET['id_kelompok'] : null;

// Memeriksa apakah ID laporan dan ID kelompok ada
if ($id_laporan) {
    // Ambil data laporan berdasarkan ID laporan
    $sql = "SELECT * FROM laporan_bisnis_backup WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_laporan);  // Mengikat parameter id_laporan dan id_kelompok
    $stmt->execute();
    $result = $stmt->get_result();

    // Menutup prepared statement setelah eksekusi
    $stmt->close();

    if ($result->num_rows > 0) {
        // Ambil data laporan
        $laporan = $result->fetch_assoc();
        // Tampilkan detail laporan di sini
    } else {
        echo "Laporan tidak ditemukan.";
    }
} else {
    echo "ID laporan atau ID kelompok tidak ditemukan!";
    exit;
}

// Mendapatkan nama-nama file PDF yang diupload
$laporan_pdf = $laporan['laporan_pdf']; // Nama file-file PDF disimpan dalam kolom ini
$pdf_files_clean = [];

// Jika kolom tidak kosong, bersihkan nama file dari simbol tidak diinginkan
if (!empty($laporan_pdf)) {
    $pdf_files = explode(',', $laporan_pdf); // Pisahkan file PDF berdasarkan koma
    $pdf_files_clean = array_map(function ($file) {
        return trim($file, ' "[]'); // Menghapus spasi, tanda kutip, dan []
    }, $pdf_files);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirusahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Entree/assets/css/detail_laporan_bisnis.css">
</head>
<style>
    .Feedback {
        margin: 20px 0;
        padding: 15px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        line-height: 1.6;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }
</style>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <?php 
            $activePage = 'laporan_bisnis_admin'; // Halaman ini aktif
            include 'sidebar_admin.php'; 
        ?>

        <!-- Main Content -->
        <div class="main p-3">
            <!-- Header -->
            <?php 
                $pageTitle = "Detail Laporan Kemajuan Bisnis"; // Judul halaman
                include 'header_admin.php'; 
            ?>

            <!-- Content Wrapper -->
            <div class="main_wrapper">
                <h2><?php echo htmlspecialchars($laporan['judul_laporan']); ?></h2>

                <p>Laporan Penjualan:</p>
                <div class="file-box">
                    <p><?php echo htmlspecialchars($laporan['laporan_penjualan']); ?></p>
                </div>

                <p>Laporan Pemasaran:</p>
                <div class="file-box">
                    <p><?php echo htmlspecialchars($laporan['laporan_pemasaran']); ?></p>
                </div>

                <p>Laporan Produksi:</p>
                <div class="file-box">
                    <p><?php echo htmlspecialchars($laporan['laporan_produksi']); ?></p>
                </div>

                <p>Laporan SDM:</p>
                <div class="file-box">
                    <p><?php echo htmlspecialchars($laporan['laporan_sdm']); ?></p>
                </div>

                <p>Laporan Keuangan:</p>
                <div class="file-box">
                    <p><?php echo htmlspecialchars($laporan['laporan_keuangan']); ?></p>
                </div>

                <!-- Menampilkan Lampiran PDF -->
                <div>
                    <h3 id="fileHeading">Daftar Lampiran</h3>
                    <ul id="fileList">
                    <?php
                    // Periksa jika ada file PDF
                    if (!empty($pdf_files_clean)) {
                        foreach ($pdf_files_clean as $file) {
                            // Path aktual tempat file PDF disimpan
                            $file_path = $_SERVER['DOCUMENT_ROOT'] . '/Entree/components/pages/mahasiswa/uploads/laporan_kemajuan/' . $file; 
                            $download_path = '/Entree/components/pages/mahasiswa/uploads/laporan_kemajuan/' . $file; // Path untuk akses di URL

                            if (file_exists($file_path)) {
                                // Mendapatkan ukuran file
                                $file_size = filesize($file_path);
                                if ($file_size >= 1048576) {
                                    $file_size = number_format($file_size / 1048576, 2) . ' MB';
                                } elseif ($file_size >= 1024) {
                                    $file_size = number_format($file_size / 1024, 2) . ' KB';
                                } else {
                                    $file_size = $file_size . ' bytes';
                                }

                                // Tampilkan file jika ditemukan
                                echo '<li>
                                        <div class="file-info">
                                            ' . htmlspecialchars(basename($file)) . ' 
                                            <span>(' . $file_size . ')</span>
                                        </div>
                                        <div class="icon-group">
                                            <a href="' . $download_path . '" target="_blank" class="fa-solid fa-eye detail-icon" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Lihat File"></a>
                                            <a href="' . $download_path . '" download class="fa-solid fa-download btn-icon" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Unduh File"></a>
                                        </div>
                                    </li>';
                            } else {
                                // Debugging untuk mencetak path yang dicari
                                echo '<li>File tidak ditemukan: ' . htmlspecialchars($file) . '<br>Path: ' . htmlspecialchars($file_path) . '</li>';
                            }
                        }
                    } else {
                        echo '<li>Tidak ada lampiran PDF yang tersedia.</li>';
                    }
                    ?>
                    </ul>
                </div>
                <p>Umpan Balik Dari Mentor:</p>
                <div class="feedback-box">
                    <p><?php echo htmlspecialchars($laporan['feedback']); ?></p>
                </div>
                <a href="laporan_bisnis?id_kelompok=<?php echo $id_kelompok; ?>" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>

</body>
</html>