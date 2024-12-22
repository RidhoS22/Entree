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
        include 'sidebar_mentor.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Jadwal Bimbingan"; // Judul halaman
                    include 'header_mentor.php'; 
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
                            <th>Status:</th>
                            <td class="file-box">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="actionDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                        Pilih Aksi
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="actionDropdown">
                                        <li><button class="dropdown-item accept-btn">Setujui Jadwal</button></li>
                                        <li><button class="dropdown-item reject-btn">Tolak Jadwal</button></li>
                                        <li><button class="dropdown-item alt-schedule-btn">Berikan Jadwal Alternatif</button></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>                                               
                        <tr>
                            <th title="Masukkan Bukti Kegiatan Anda dalam format Pdf atau Gambar disini" >Bukti Kegiatan</th>
                            <td>Mahasiswa akan mengunggah bukti kegiatan disini</td>                        
                        </tr>
                    </table>

                    <!-- Modal Jadwal Alternatif -->
                    <div class="modal fade" id="altScheduleModal" tabindex="-1" aria-labelledby="altScheduleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="altScheduleModalLabel">Berikan Jadwal Alternatif</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="submit_alternative_schedule.php" method="POST">
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="altDateInput" class="form-label">Tanggal:</label>
                                            <input type="date" class="form-control" id="altDateInput" name="alt_date" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="altTimeInput" class="form-label">Waktu:</label>
                                            <input type="time" class="form-control" id="altTimeInput" name="alt_time" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="altLocationInput" class="form-label">Lokasi:</label>
                                            <input type="text" class="form-control" id="altLocationInput" name="alt_location" placeholder="Masukkan lokasi" required>
                                        </div>
                                        <input type="hidden" name="jadwal_id" value="<?php echo htmlspecialchars($id); ?>">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary btn-cancel" data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-secondary btn-submit">Kirim</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                                    <!-- Feedback Section -->
                    <form action="submit_feedback.php" method="POST">
                        <div class="mb-3">
                            <label for="feedbackInput" class="form-label">Masukkan Umpan Balik Anda:</label>
                            <textarea class="form-control" id="feedbackInput" name="feedback" rows="5" placeholder="Tulis umpan balik Anda di sini..." required></textarea>
                        </div>
                        <div class="btn_container mentor-buttons">
                            <button type="submit">Kirim Feedback</button>
                        </div>
                    </form>

                    <a href="jadwal_bimbingan_mentor.php" class="btn btn-secondary">Kembali</a>
                </div>       
            </div>
    </div>
    <script>
        document.querySelector('.accept-btn').addEventListener('click', () => {
            if (confirm("Apakah Anda yakin ingin menyetujui Jadwal ini?")) {
                alert("Jadwal berhasil disetujui!");
            }
        });

        document.querySelector('.reject-btn').addEventListener('click', () => {
            if (confirm("Apakah Anda yakin ingin menolak Jadwal ini?")) {
                alert("Jadwal berhasil ditolak!");
            }
        });

        document.querySelector('.alt-schedule-btn').addEventListener('click', () => {
            const altScheduleModal = new bootstrap.Modal(document.getElementById('altScheduleModal'));
            altScheduleModal.show();
        });
    </script>
</body>
</html>
