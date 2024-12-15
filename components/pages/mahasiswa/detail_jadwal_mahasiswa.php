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
                            <th>Umpan Balik Dari Mentor</th>
                            <td><?php echo isset($data['status']) ? htmlspecialchars($data['feedback_mentor']) : 'N/A'; ?></td>
                        </tr>
                        <tr>
                            <th title="Masukkan Bukti Kegiatan Anda dalam format Pdf atau Gambar disini" >Bukti Kegiatan</th>
                            <td>
                                <div class="input-group">
                                    <input type="file" class="form-control" id="customFile" accept=".pdf, .jpg, .jpeg, .png, .gif">
                                </div>
                            </td>                        
                        </tr>
                    </table>

                    <div class="btn_container">
                        <div class="action-buttons" style="display: none;">
                            <button class="save-btn">Simpan</button>
                            <button class="cancel-btn">Batal</button>
                        </div>
                    </div>

                    <a href="jadwal_bimbingan_mahasiswa.php" class="btn btn-secondary">Kembali</a>
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
