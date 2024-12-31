<?php
// Koneksi ke database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Ambil ID dari parameter URL
$id = isset($_GET['id']) ? $_GET['id'] : null;

if ($id) {
    // Query untuk mengambil detail jadwal
    $sql = "SELECT * FROM jadwal WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    // Cek apakah data ditemukan
    if ($result->num_rows > 0) {
        $data = $result->fetch_assoc();
    } else {
        echo "Jadwal tidak ditemukan!";
        exit;
    }
} else {
    echo "ID tidak valid!";
    exit;
}

// Cek jika form disubmit dan status jadwal adalah 'selesai'
$message = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['bukti_kegiatan']) && $data['status'] == 'selesai') {
    // Tentukan lokasi penyimpanan file
    $targetDir = "uploads/bukti_kegiatan/"; // Pastikan folder ini ada di server Anda
    $targetFile = $targetDir . basename($_FILES["bukti_kegiatan"]["name"]);
    $fileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Cek apakah file adalah PDF atau gambar
    $allowedTypes = array("pdf", "jpg", "jpeg", "png", "gif");
    if (in_array($fileType, $allowedTypes)) {
        // Pindahkan file ke folder upload
        if (move_uploaded_file($_FILES["bukti_kegiatan"]["tmp_name"], $targetFile)) {
            // Simpan nama file ke database
            $sqlUpdate = "UPDATE jadwal SET bukti_kegiatan = ? WHERE id = ?";
            $stmtUpdate = $conn->prepare($sqlUpdate);
            $stmtUpdate->bind_param("si", $targetFile, $id);
            if ($stmtUpdate->execute()) {
                $message = "Bukti kegiatan telah dikirim!";
            } else {
                $message = "Terjadi kesalahan saat menyimpan bukti kegiatan.";
            }
        } else {
            $message = "File gagal diunggah.";
        }
    } else {
        $message = "Tolong masukan bukti kegiatanya terlebih dahulu.";
    }
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/jadwal_bimbingan_mahasiswa.css">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_jadwal_bimbingan.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'pagemahasiswa'; 
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Jadwal Bimbingan"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <div class="container mt-5">
                    <h1>Detail Jadwal</h1>
                    <form action="" method="POST" enctype="multipart/form-data">
                        <table class="table table-bordered">
                            <tr>
                                <th>Nama Kegiatan</th>
                                <td><?php echo htmlspecialchars($data['nama_kegiatan']); ?></td>
                            </tr>
                            <tr>
                                <th>Tanggal</th>
                                <td><?php echo htmlspecialchars($data['tanggal']); ?></td>
                            </tr>
                            <tr>
                                <th>Waktu</th>
                                <td><?php echo htmlspecialchars($data['waktu']); ?></td>
                            </tr>
                            <tr>
                                <th>Agenda</th>
                                <td><?php echo htmlspecialchars($data['agenda']); ?></td>
                            </tr>
                            <tr>
                                <th>Lokasi</th>
                                <td><?php echo htmlspecialchars($data['lokasi']); ?></td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td>
                                    <span id="status-label" class="status" 
                                        style="background-color: <?php 
                                             if ($data['status'] == 'disetujui') {
                                                echo '#2ea56f'; // Hijau
                                            } elseif ($data['status'] == 'ditolak') {
                                                echo '#dc3545'; // Merah
                                            } elseif ($data['status'] == 'jadwal alternatif') {
                                                echo '#ffc107'; // Kuning
                                            } elseif ($data['status'] == 'selesai') {
                                                echo '#007bff'; // Biru
                                            } else {
                                                echo '#fd7e14'; // Oranye
                                            }
                                        ?>;">
                                        <?php echo htmlspecialchars($data['status']); ?>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th title="Masukkan Bukti Kegiatan Anda dalam format Pdf atau Gambar disini">Bukti Kegiatan</th>
                                <td>
                                    <div class="input-group">
                                        <input type="file" class="form-control" id="customFile" name="bukti_kegiatan" accept=".pdf, .jpg, .jpeg, .png, .gif" <?php echo $data['status'] != 'selesai' ? 'disabled' : ''; ?> >
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <a href="jadwal_bimbingan_mahasiswa.php" class="btn btn-secondary">Kembali</a>
                        <?php if ($data['status'] == 'selesai'): ?>
                            <div class="d-flex justify-content-end mt-3">
                                <button type="submit" class="btn btn-success me-2">Simpan</button>
                            </div>
                        <?php else: ?>
                            <div class="alert alert-warning mt-3">Bukti Kegiatan hanya bisa diunggah jika status jadwal bimbingan adalah "Selesai".</div>
                            <div class="d-flex justify-content-end mt-3">
                            </div>
                        <?php endif; ?>

                        <!-- Menampilkan pesan jika ada -->
                        <?php if (!empty($message)): ?>
                            <div id="message" class="alert alert-success">
                                <?php echo $message; ?>
                            </div>
                            
                            <script type="text/javascript">
                                // Menghilangkan pesan setelah 2 detik (2000 ms)
                                setTimeout(function() {
                                    document.getElementById("message").style.display = "none";
                                }, 2000); // 2000 ms = 2 detik
                            </script>
                        <?php endif; ?>
                    </form>
                </div>       
            </div>
        </div>
    </div>
    <script>
        const fileInput = document.getElementById("customFile");
        const actionButtons = document.querySelector(".action-buttons");

        // Event listener untuk input file
        fileInput.addEventListener("change", function () {
            if (fileInput.files.length > 0) {
                actionButtons.style.display = "block"; // Tampilkan tombol jika ada file
            } else {
                actionButtons.style.display = "none"; // Sembunyikan tombol jika tidak ada file
            }
        });
    </script>
</body>
</html>
