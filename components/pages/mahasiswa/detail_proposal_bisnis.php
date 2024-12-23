<?php
// Koneksi ke database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mengambil id dari URL
$id_proposal = isset($_GET['id']) ? $_GET['id'] : '';

// Fetch data proposal berdasarkan id
$query = "SELECT * FROM proposal_bisnis WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $id_proposal);  // Menggunakan "i" untuk integer
$stmt->execute();
$result = $stmt->get_result();

// Memeriksa apakah proposal ditemukan
if ($result->num_rows > 0) {
    $proposal = $result->fetch_assoc();
} else {
    // Menangani kasus jika proposal tidak ditemukan
    echo "Proposal tidak ditemukan.";
    exit;
}

// Mapping SDG
$sdg_mapping = [
    "mengakhiri_kemiskinan" => "1. Mengakhiri Kemiskinan",
    "mengakhiri_kelaparan" => "2. Mengakhiri Kelaparan",
    "kesehatan_kesejahteraan" => "3. Kesehatan dan Kesejahteraan",
    "pendidikan_berkualitas" => "4. Pendidikan Berkualitas",
    "kesetaraan_gender" => "5. Kesetaraan Gender",
    "air_bersih_sanitasi" => "6. Air Bersih dan Sanitasi",
    "energi_bersih_terjangkau" => "7. Energi Bersih dan Terjangkau",
    "pekerjaan_pertumbuhan_ekonomi" => "8. Pekerjaan Layak dan Pertumbuhan Ekonomi",
    "industri_inovasi_infrastruktur" => "9. Industri, Inovasi, dan Infrastruktur",
    "mengurangi_ketimpangan" => "10. Mengurangi Ketimpangan",
    "kota_komunitas_berkelanjutan" => "11. Kota dan Komunitas Berkelanjutan",
    "konsumsi_produksi_bertanggung_jawab" => "12. Konsumsi dan Produksi yang Bertanggung Jawab",
    "penanganan_perubahan_iklim" => "13. Penanganan Perubahan Iklim",
    "ekosistem_lautan" => "14. Ekosistem Lautan",
    "ekosistem_daratan" => "15. Ekosistem Daratan",
    "perdamaian_keadilan_institusi_kuat" => "16. Perdamaian, Keadilan, dan Kelembagaan yang Kuat",
    "kemitraan_tujuan" => "17. Kemitraan untuk Mencapai Tujuan"
];

// Proses SDG menjadi label deskriptif
$sdg_selected = explode(",", $proposal['sdg']);
$sdg_labels = array_map(function($key) use ($sdg_mapping) {
    return $sdg_mapping[$key] ?? $key;
}, $sdg_selected);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirausahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_proposal.css">
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <?php 
            $activePage = 'laporan_bisnis_mahasiswa'; // Halaman ini aktif
            include 'sidebar_mahasiswa.php'; 
        ?>

        <!-- Main Content -->
        <div class="main">
            <!-- Header -->
            <?php 
                $pageTitle = "Detail Proposal Bisnis"; // Judul halaman
                include 'header_mahasiswa.php'; 
            ?>

            <!-- Content Wrapper -->
            <div class="main_wrapper">
                <h2><?php echo htmlspecialchars($proposal['judul_proposal']); ?></h2>
                <div class="description">
                    <strong>Ide Bisnis:</strong>
                    <p><?php echo htmlspecialchars($proposal['ide_bisnis'] ?? 'Tidak ada ide bisnis.'); ?></p>
                </div>

                <!-- Table Section -->
                <table class="styled-table">
                    <tr>
                        <td><strong>Tahapan Bisnis:</strong></td>
                        <td class="file-box">
                            <?php echo htmlspecialchars($proposal['tahapan_bisnis']); ?>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Tujuan SDGs:</strong></td>
                        <td class="file-box">
                            <ul>
                                <?php foreach ($sdg_labels as $label): ?>
                                    <li><?php echo htmlspecialchars($label); ?></li>
                                <?php endforeach; ?>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Kategori Bisnis:</strong></td>
                        <td class="file-box">
                            <?php 
                            if ($proposal['kategori'] === 'lainnya') {
                                echo htmlspecialchars($proposal['other_category']);
                            } else {
                                echo htmlspecialchars($proposal['kategori']);
                            }
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>File Proposal Bisnis:</strong></td>
                        <td class="file-box">
                            <ul id="fileList">
                                <li class="file-box">
                                    <div class="file-info">
                                        <?php echo htmlspecialchars(basename($proposal['proposal_pdf'])); ?>
                                    </div>
                                    <div class="icon-group">
                                        <a href="/Aplikasi-Kewirausahaan/components/pages/mahasiswa/uploads/proposal/<?php echo basename($proposal['proposal_pdf']); ?>" target="_blank" class="detail-icon" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Lihat File">
                                            <i class="fa-solid fa-eye"></i>
                                        </a>
                                        <a href="/Aplikasi-Kewirausahaan/components/pages/mahasiswa/uploads/proposal/<?php echo basename($proposal['proposal_pdf']); ?>" download class="btn-icon" data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-title="Unduh File">
                                            <i class="fa-solid fa-download"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Status:</strong></td>
                        <td class="file-box">
                            <span id="status-label" class="status" 
                                style="background-color: <?php 
                                    if ($proposal['status'] == 'disetujui') {
                                        echo '#2ea56f';
                                    } elseif ($proposal['status'] == 'ditolak') {
                                        echo '#dc3545';
                                    } else {
                                        echo 'orange';
                                    }
                                ?>;">
                            <?php echo htmlspecialchars($proposal['status']); ?>
                            </span>
                        </td>
                    </tr>
                </table>

                <!-- Feedback Section -->
                <strong>Umpan Balik Dari Mentor:</strong>
                <div class="feedback-box">
                    <p><?php echo htmlspecialchars($proposal['feedback'] ?? 'Belum ada umpan balik.'); ?></p>
                </div>
                <a href="proposal_bisnis_mahasiswa.php" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>
</body>

</html>
