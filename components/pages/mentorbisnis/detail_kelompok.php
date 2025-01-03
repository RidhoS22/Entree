<?php
// Mengimpor koneksi database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mendapatkan ID kelompok dari parameter URL
$id_kelompok = isset($_GET['id_kelompok']) ? $_GET['id_kelompok'] : null;

if ($id_kelompok) {
    // Query untuk mengambil detail kelompok bisnis berdasarkan id
    $sql = "SELECT * FROM kelompok_bisnis WHERE id_kelompok = $id_kelompok";
    $result = $conn->query($sql);
    $kelompok = $result->fetch_assoc();

    // Query untuk mengambil nama ketua kelompok berdasarkan npm_ketua
    $ketuaQuery = "SELECT nama FROM mahasiswa WHERE npm = '" . $kelompok['npm_ketua'] . "' LIMIT 1";
    $ketuaResult = $conn->query($ketuaQuery);
    $ketua = $ketuaResult->fetch_assoc();

    // Query untuk mengambil anggota kelompok berdasarkan id_kelompok
    $anggotaSql = "SELECT m.nama, m.npm 
                   FROM anggota_kelompok ak 
                   JOIN mahasiswa m ON ak.npm_anggota = m.npm 
                   WHERE ak.id_kelompok = $id_kelompok";
    $anggotaResult = $conn->query($anggotaSql);
} else {
    echo "Kelompok bisnis tidak ditemukan.";
    exit;
}

$mentorQuery = "
    SELECT m.nama AS nama_mentor
    FROM mentor m
    WHERE m.id = '" . $kelompok['id_mentor'] . "' LIMIT 1";
$mentorResult = mysqli_query($conn, $mentorQuery);
$mentor = mysqli_fetch_assoc($mentorResult);
$namaMentor = $mentor['nama_mentor'] ?? 'Nama mentor tidak tersedia';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Kelompok Bisnis</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_kelompok.css">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/jadwal_bimbingan_mahasiswa.css">
</head>
<style>
    /* CSS untuk toast */
    .toast {
        position: fixed;
        top: 20px; /* Posisi di ujung kanan atas */
        right: 20px; /* Posisi di ujung kanan */
        padding: 10px 20px;
        background-color: #28a745; /* Hijau untuk toast sukses */
        color: white;
        border-radius: 5px;
        opacity: 0;
        transition: opacity 0.5s ease-in-out;
        z-index: 9999; /* Pastikan toast muncul di atas elemen lain */
    }

    .toast.show {
        opacity: 1;
    }
</style>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'daftar_kelompok_bisnis_mentor'; 
        include 'sidebar_mentor.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Detail Kelompok Bisnis"; 
                    include 'header_mentor.php'; 
                ?>
            </div>

            <div class="main_wrapper">
            <?php if ($kelompok) { ?>
                <div class="container">
                    <div class="left">
                        <!-- Logo Bisnis -->
                        <?php if (!empty($kelompok['logo_bisnis'])) { ?>
                            <img alt="Logo Bisnis" src="/Aplikasi-Kewirausahaan/components/pages/mahasiswa/logos/<?php echo htmlspecialchars($kelompok['logo_bisnis']); ?>" />
                        <?php } else { ?>
                            <p><em>Logo bisnis belum diunggah</em></p>
                        <?php } ?>
                    </div>

                    <div class="right">
                        <div class="title-edit">
                            <h1 id="nama-kelompok-text"><?php echo htmlspecialchars($kelompok['nama_kelompok']); ?></h1>
                            <input type="text" id="nama-kelompok-input" value="<?php echo htmlspecialchars($kelompok['nama_kelompok']); ?>" style="display: none;" />
                            <button type="button" class="btn btn-secondary mt-3" data-bs-toggle="modal" data-bs-target="#recommendationModal">
                                Program Inkubasi
                            </button>
                            <!-- Modal Rekomendasi -->
                            <div class="modal fade" id="recommendationModal" tabindex="-1" aria-labelledby="recommendationModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="recommendationModalLabel">Rekomendasi Program Inkubasi</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Apakah Anda ingin merekomendasikan kelompok ini untuk masuk ke program inkubasi bisnis?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary btn-cancel" data-bs-dismiss="modal">Batal</button>
                                            <button type="button" class="btn btn-secondary btn-submit" id="submitRecommendation" data-bs-dismiss="modal">Iya</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                document.getElementById('submitRecommendation').addEventListener('click', function() {
                                    // Ambil ID kelompok dari URL
                                    const urlParams = new URLSearchParams(window.location.search);
                                    const kelompokId = <?php echo $id_kelompok; ?>

                                    if (kelompokId) {
                                        // Kirim data ke server menggunakan AJAX
                                        fetch('update_kelompok_status.php', {
                                            method: 'POST',
                                            headers: {
                                                'Content-Type': 'application/x-www-form-urlencoded',
                                            },
                                            body: `id_kelompok=${kelompokId}&status_inkubasi=direkomendasikan`
                                        })
                                        .then(response => response.json())
                                        .then(data => {
                                            if (data.success) {
                                                // Tampilkan pesan toast
                                                let toastMessage = document.createElement('div');
                                                toastMessage.classList.add('toast', 'show');
                                                toastMessage.classList.add('toast-success');
                                                toastMessage.textContent = 'Kelompok bisnis berhasil direkomendasikan ke dalam program inkubasi bisnis.';
                                                document.body.appendChild(toastMessage);
                                                setTimeout(() => toastMessage.classList.remove('show'), 3000); // Hilangkan toast setelah 3 detik
                                            } else {
                                                alert('Gagal mengupdate status');
                                            }
                                        })
                                        .catch(error => console.error('Error:', error));
                                    } else {
                                        alert('ID kelompok tidak ditemukan');
                                    }
                                });
                            </script>
                        </div>
                        
                        <div class="Nama_bisnis">
                            <p><strong>Nama Bisnis:</strong> <?php echo htmlspecialchars($kelompok['nama_bisnis'] ?? '--'); ?></p>
                        </div>
                        <div class="Ide_Bisnis">
                            <p><strong>Ide Bisnis:</strong> <?php echo htmlspecialchars($kelompok['ide_bisnis'] ?? '--'); ?></p>
                        </div>
                        <div class="category">
                            <p><strong>Kategori Bisnis:</strong> <?php echo htmlspecialchars($kelompok['kategori_bisnis'] ?? '--'); ?></p>
                        </div>
                        <div class="sdg">
                            <p><strong>Sustainable Development Goals (SDGs):</strong> <?php echo htmlspecialchars($kelompok['sdg'] ?? '--'); ?></p>
                        </div>

                        <div class="bottom">
                            <div class="members">
                                <p><strong>Ketua Kelompok:</strong> 
                                    <?php echo htmlspecialchars($ketua['nama']) . ' (' . htmlspecialchars($kelompok['npm_ketua']) . ')'; ?>
                                </p>

                                <p><strong>Anggota Kelompok:</strong></p>
                                <?php while ($anggota = $anggotaResult->fetch_assoc()) { ?>
                                    <p><i class="fas fa-user"></i> <?php echo htmlspecialchars($anggota['nama']) . " (" . htmlspecialchars($anggota['npm']) . ")"; ?></p>
                                <?php } ?>
                            </div>
                                
                            <div class="tutor">
                                <p><strong>Mentor Bisnis:</strong> <?php echo htmlspecialchars($namaMentor); ?></p>
                            </div>
                        </div>
                        <div class="cards-container">
                            <!-- Card 1 -->
                            <div class="card" onclick="window.location.href='proposal_bisnis_mentor.php?id_kelompok=<?php echo $id_kelompok; ?>'" title="Lihat Proposal Bisnis Kelompok Disini">
                                <h5>Proposal Bisnis</h5>
                            </div>
                            <!-- Card 2 -->
                            <div class="card" onclick="window.location.href='laporan_bisnis_mentor.php?id_kelompok=<?php echo $id_kelompok; ?>'" title="Laporan Kemajuan Bisnis Kelompok Disini">
                                <h5>Laporan Kemajuan Bisnis</h5>
                            </div>
                        </div>

                        <div class="accordion accordion-flush mt-4" id="accordionFlushExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                    Lihat Riwayat Bimbingan
                                </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <div class="container">
                                        <?php
                                            $sql = "SELECT * FROM jadwal WHERE id_klmpk = ? ORDER BY tanggal, waktu";
                                            $stmt = $conn->prepare($sql);
                                            $stmt->bind_param("i", $id_kelompok); // Bind parameter id_kelompok
                                            $stmt->execute();
                                            $result = $stmt->get_result();
                                        ?>

                                    <div class="table-container">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Nama Kelompok</th>
                                                    <th>Nama Kegiatan</th>
                                                    <th>Tanggal</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php if ($result->num_rows > 0): ?>
                                                    <?php $no = 1; ?>
                                                    <?php while ($row = $result->fetch_assoc()): ?>
                                                        <tr>
                                                            <td><?php echo $no++; ?></td>
                                                            <td><?php echo htmlspecialchars($kelompok['nama_kelompok']); ?></td>
                                                            <td><?php echo htmlspecialchars($row['nama_kegiatan']); ?></td>
                                                            <td><?php echo htmlspecialchars($row['tanggal']); ?></td>
                                                            <td>
                                                                <span id="status-label" class="status" 
                                                                    style="background-color: <?php 
                                                                        if ($row['status'] == 'disetujui') {
                                                                            echo '#2ea56f';
                                                                        } elseif ($row['status'] == 'ditolak') {
                                                                            echo '#dc3545';
                                                                        } elseif  ($row['status'] == 'selesai') {
                                                                            echo '#007bff';
                                                                        } elseif  ($row['status'] == 'alternatif'){
                                                                            echo '#ffc107';
                                                                        } else {
                                                                            echo 'orange';
                                                                        }
                                                                    ?>;">
                                                                    <?php echo htmlspecialchars($row['status']); ?>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    <?php endwhile; ?>
                                                <?php else: ?>
                                                    <tr>
                                                        <td colspan="8">Tidak ada jadwal tersedia.</td>
                                                    </tr>
                                                <?php endif; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>



                                </div>
                                </div>
                            </div>
    
                        </div>

                    </div>
                </div>
            <?php } else { ?>
                <p>Data kelompok tidak ditemukan.</p>
            <?php } ?>


                <!-- Tombol Back -->
                <div class="mt-3">
                    <a href="daftar_kelompok_bisnis_mentor.php" class="btn btn-secondary mt-3">Kembali ke Daftar Kelompok Bisnis</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>

<?php
// Menutup koneksi database
$conn->close();
?>