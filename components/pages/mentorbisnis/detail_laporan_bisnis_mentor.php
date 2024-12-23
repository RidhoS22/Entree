<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mendapatkan ID laporan dan ID kelompok dari parameter URL dan validasi
$id_laporan = isset($_GET['id']) ? $_GET['id'] : null;
$id_kelompok = isset($_GET['id_kelompok']) ? $_GET['id_kelompok'] : null;
$mentor_name = isset($_SESSION['nama']) ? $_SESSION['nama'] : null;

// Memeriksa apakah ID laporan dan ID kelompok ada
if ($id_laporan) {
    // Ambil data laporan berdasarkan ID laporan
    $sql = "SELECT * FROM laporan_bisnis WHERE id = ?";
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

$sql_kelompok = "SELECT mentor_bisnis FROM kelompok_bisnis WHERE id_kelompok = $id_kelompok";
$kelompok_result = $conn->query($sql_kelompok);
$kelompok_data = $kelompok_result->fetch_assoc();
$kelompok_mentor = $kelompok_data['mentor_bisnis'] ?? null;

// Cek apakah mentor yang login sama dengan mentor yang terdaftar di kelompok
$is_mentor_matched = ($mentor_name === $kelompok_mentor);

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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_laporan_bisnis.css">
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
            $activePage = 'laporan_bisnis_mentor'; // Halaman ini aktif
            include 'sidebar_mentor.php'; 
        ?>

        <!-- Main Content -->
        <div class="main p-3">
            <!-- Header -->
            <?php 
                $pageTitle = "Detail Laporan Kemajuan Bisnis"; // Judul halaman
                include 'header_mentor.php'; 
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
                            $file_path = $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/components/pages/mahasiswa/uploads/laporan_kemajuan/' . $file; 
                            $download_path = '/Aplikasi-Kewirausahaan/components/pages/mahasiswa/uploads/laporan_kemajuan/' . $file; // Path untuk akses di URL

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
                                            <a href="' . $download_path . '" target="_blank" class="fa-solid fa-eye detail-icon" title="Lihat PDF"></a>
                                            <a href="' . $download_path . '" download class="fa-solid fa-download btn-icon" title="Unduh PDF"></a>
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
                
                <?php if ($is_mentor_matched): ?>
                    <form id="feedbackForm">
                        <div class="mb-3">
                            <label for="feedbackInput" class="form-label">Masukkan Umpan Balik Anda:</label>
                            <textarea class="form-control" id="feedbackInput" name="feedback" rows="5" placeholder="Tulis umpan balik Anda di sini..." required></textarea>
                        </div>
                        <input type="hidden" id="laporanId" value="<?php echo htmlspecialchars($laporan['id']); ?>">
                        <div class="btn_container d-flex justify-content-between">
                            <button type="submit" class="btn btn-danger">Kirim Umpan Balik</button>
                        </div>
                    </form>
                    <div id="feedbackMessage" class="mt-3"></div>
                    
                    <script>
                        document.getElementById('feedbackForm').addEventListener('submit', async function (event) {
                            event.preventDefault();

                            const feedback = document.getElementById('feedbackInput').value;
                            const laporanId = document.getElementById('laporanId').value;

                            // Validasi feedback sebelum dikirim
                            if (feedback.trim() === "") {
                                alert("Feedback tidak boleh kosong!");
                                return;
                            }

                            try {
                                const response = await fetch('submit_feedback_laporan.php', {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/json',
                                    },
                                    body: JSON.stringify({
                                        feedback: feedback,
                                        laporan_id: laporanId,
                                    }),
                                });

                                const result = await response.json();
                                const messageDiv = document.getElementById('feedbackMessage');

                                if (result.success) {
                                    messageDiv.innerHTML = `<div class="alert alert-success">${result.message}</div>`;
                                } else {
                                    messageDiv.innerHTML = `<div class="alert alert-danger">${result.message}</div>`;
                                }
                            } catch (error) {
                                console.error('Error:', error);
                                document.getElementById('feedbackMessage').innerHTML = `<div class="alert alert-danger">Terjadi kesalahan. Silakan coba lagi.</div>`;
                            }
                        });
                    </script>
                <?php else: ?>
                    <<p>Umpan Balik Dari Mentor:</p>
                <div class="feedback-box">
                    <p><?php echo htmlspecialchars($laporan['feedback'] ?? 'Tidak ada Feedback.'); ?></p>
                </div>
                <?php endif; ?>
                <a href="laporan_bisnis_mentor.php?id_kelompok=<?php echo $id_kelompok; ?>" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>
</body>
</html>
