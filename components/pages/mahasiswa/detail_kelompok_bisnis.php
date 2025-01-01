<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mendapatkan NPM mahasiswa dari session
$npm_mahasiswa = $_SESSION['npm'] ?? null; // Pastikan variabel tidak null

// Cek apakah mahasiswa adalah ketua atau anggota kelompok
$cekKelompokQuery = "
    SELECT kb.*, ak.id_kelompok AS anggota_id
    FROM kelompok_bisnis kb
    LEFT JOIN anggota_kelompok ak ON kb.id_kelompok = ak.id_kelompok
    WHERE kb.npm_ketua = '$npm_mahasiswa' OR ak.npm_anggota = '$npm_mahasiswa' LIMIT 1";
$cekKelompokResult = mysqli_query($conn, $cekKelompokQuery);
$kelompokTerdaftar = mysqli_fetch_assoc($cekKelompokResult) ?: []; // Defaultkan ke array kosong jika null

// Ambil detail mentor berdasarkan nama mentor dari kelompok bisnis
$mentorData = [];
if (!empty($kelompokTerdaftar['id_mentor'])) {
    // Query untuk detail mentor
    $mentorQuery = "
    SELECT m.nama AS nama_mentor, 
        m.fakultas, 
        m.prodi, 
        m.contact, 
        m.email,
        m.keahlian, 
        m.foto_profile,
        u.role 
    FROM mentor m
    JOIN users u ON m.user_id = u.id
    WHERE m.id = '" . $kelompokTerdaftar['id_mentor'] . "' 
    LIMIT 1";
    
$mentorResult = mysqli_query($conn, $mentorQuery);
$mentorData = mysqli_fetch_assoc($mentorResult); 
}

$mentorAda = !empty($kelompokTerdaftar['id_mentor']);
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
</head>
<body>
    <div class="wrapper">
        <?php include 'sidebar_mahasiswa.php'; ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Kelompok Bisnis"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <?php if ($kelompokTerdaftar) { ?>
                    <div class="container">
                        <div class="left">
                            <!-- Logo Bisnis -->
                            <img alt="Logo Bisnis" src="/Aplikasi-Kewirausahaan/components/pages/mahasiswa/logos/<?php echo $kelompokTerdaftar['logo_bisnis']; ?>" />
                        </div>

                        <div class="right">
                            <!-- Tombol Edit hanya tampil jika mentor belum ditugaskan -->
                            <?php if (!$mentorAda) { ?>
                                <div class="title-edit">
                                    <h1 id="nama-kelompok-text"><?php echo htmlspecialchars($kelompokTerdaftar['nama_kelompok']); ?></h1>
                                    <input type="text" id="nama-kelompok-input" value="<?php echo htmlspecialchars($kelompokTerdaftar['nama_kelompok']); ?>" style="display: none;" />
                                    <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editModal">
                                        <i class="fas fa-edit"></i> Edit
                                    </button>
                                </div>
                            <?php } else { ?>
                                <!-- Jika sudah ada mentor, tombol edit tidak ditampilkan -->
                                <div class="title-edit">
                                    <h1 id="nama-kelompok-text"><?php echo htmlspecialchars($kelompokTerdaftar['nama_kelompok']); ?></h1>
                                </div>
                            <?php } ?>

                                <!-- Menambahkan Nama Bisnis -->
                                <div class="ide_bisnis">
                                    <p><strong>Nama Bisnis:</strong> <?php echo htmlspecialchars($kelompokTerdaftar['nama_bisnis'] ?? '--'); ?></p>
                                </div>
                                <div class="ide_bisnis">
                                    <p><strong>Ide Bisnis:</strong> <?php echo htmlspecialchars($kelompokTerdaftar['ide_bisnis'] ?? '--'); ?></p>
                                </div>
                                <div class="category">
                                    <p><strong>Kategori Bisnis:</strong> <?php echo htmlspecialchars($kelompokTerdaftar['kategori_bisnis'] ?? '--'); ?></p>
                                </div>
                                <div class="sdg">
                                    <p><strong>Sustainable Development Goals (SDGs):</strong> <?php echo htmlspecialchars($kelompokTerdaftar['sdg'] ?? '--'); ?></p>
                                </div>

                            <div class="bottom">
                                <div class="members">
                                    <p><strong>Ketua Kelompok:</strong> 
                                        <?php
                                        // Mendapatkan nama ketua kelompok berdasarkan npm ketua
                                        $ketuaQuery = "SELECT nama FROM mahasiswa WHERE npm = '" . ($kelompokTerdaftar['npm_ketua'] ?? '') . "' LIMIT 1";
                                        $ketuaResult = mysqli_query($conn, $ketuaQuery);
                                        $ketuaData = mysqli_fetch_assoc($ketuaResult) ?: [];
                                        echo htmlspecialchars($ketuaData['nama'] ?? 'Data tidak tersedia');
                                        ?>
                                    </p>

                                    <p><strong>Anggota Kelompok:</strong></p>
                                    <?php
                                    // Menampilkan anggota kelompok
                                    $anggotaQuery = "
                                        SELECT ak.npm_anggota, m.nama
                                        FROM anggota_kelompok ak
                                        JOIN mahasiswa m ON ak.npm_anggota = m.npm
                                        WHERE ak.id_kelompok = '" . ($kelompokTerdaftar['id_kelompok'] ?? '') . "'";
                                    $anggotaResult = mysqli_query($conn, $anggotaQuery);
                                    if (mysqli_num_rows($anggotaResult) > 0) {
                                        while ($anggota = mysqli_fetch_assoc($anggotaResult)) {
                                            echo "<p><i class='fas fa-user'></i> " . htmlspecialchars($anggota['nama'] ?? 'Nama tidak tersedia') . " (" . htmlspecialchars($anggota['npm_anggota'] ?? 'NPM tidak tersedia') . ")</p>";
                                        }
                                    } else {
                                        echo "<p>Belum ada anggota kelompok.</p>";
                                    }
                                    ?>
                                </div>

                                <!-- Mentor Bisnis Section -->
                                <div class="tutor">
                                    <div class="d-flex align-items-center mentor">
                                        <strong class="me-2">Mentor Bisnis:</strong>
                                        <?php if ($mentorAda) { ?>
                                            <a class="text-decoration-none" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <div class="card d-inline-block" title="Lihat Detail Mentor Bisnis">
                                                    <div class="card-body p-0">
                                                        <p class="card-text m-0 text-center">
                                                            <?php echo htmlspecialchars($mentorData['nama_mentor']); ?>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>
                                        <?php } else { ?>
                                            <!-- Jika belum ada mentor, tampilkan teks info -->
                                            <span class="text-muted">Belum ada mentor bisnis</span>
                                        <?php } ?>
                                    </div>
                                    
                                    <!-- Collapsible mentor details (hanya aktif jika mentor ada) -->
                                    <?php if ($mentorAda) { ?>
                                        <div class="collapse" id="collapseExample">
                                            <div class="card-mentor p-3">
                                                <img 
                                                    alt="Profile picture of the mentor" 
                                                    height="50" 
                                                    src="<?= htmlspecialchars($mentorData['foto_profile'] ?? '\Aplikasi-Kewirausahaan\assets\img\user_9071610.png'); ?>" 
                                                    width="50" 
                                                    class="card-img-top mx-auto d-block mt-3"
                                                />
                                                <h2 class="card-mentor-title text-center"><?= htmlspecialchars($mentorData['nama_mentor'] ?? 'Nama mentor tidak tersedia'); ?></h2>
                                                <div class="card-mentor-body">
                                                    <p class="card-mentor-text"><strong>Peran:</strong> <?= htmlspecialchars($mentorData['role'] ?? 'Data tidak tersedia'); ?></p>
                                                    <p class="card-mentor-text"><strong>Keahlian:</strong> <?= htmlspecialchars($mentorData['keahlian'] ?? 'Data tidak tersedia'); ?></p>
                                                    <p class="card-mentor-text"><strong>Fakultas:</strong> <?= htmlspecialchars($mentorData['fakultas'] ?? 'Data tidak tersedia'); ?></p>
                                                    <p class="card-mentor-text"><strong>Prodi:</strong> <?= htmlspecialchars($mentorData['prodi'] ?? 'Data tidak tersedia'); ?></p>
                                                    <p class="card-mentor-text"><strong>Nomor Telepon:</strong> <?= htmlspecialchars($mentorData['contact'] ?? 'Data tidak tersedia'); ?></p>
                                                    <p class="card-mentor-text"><strong>Alamat Email:</strong> <?= htmlspecialchars($mentorData['email'] ?? 'Data tidak tersedia'); ?></p>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form id="editForm">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editModalLabel">Edit Kelompok Bisnis</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="mb-3">
                                                        <label for="namaKelompok" class="form-label">Nama Kelompok</label>
                                                        <input type="text" class="form-control" id="namaKelompok" name="nama_kelompok" value="<?php echo htmlspecialchars($kelompokTerdaftar['nama_kelompok']); ?>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="namaBisnis" class="form-label">Nama Bisnis</label>
                                                        <input type="text" class="form-control" id="namaBisnis" name="nama_bisnis" value="<?php echo htmlspecialchars($kelompokTerdaftar['nama_bisnis'] ?? ''); ?>" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } else { ?>
                    <div class="alert alert-warning">Kelompok Bisnis belum terdaftar.</div>
                <?php } ?>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Handle form submission
        document.getElementById('editForm').addEventListener('submit', function (event) {
            event.preventDefault();

            const namaKelompok = document.getElementById('namaKelompok').value;
            const namaBisnis = document.getElementById('namaBisnis').value;

            fetch('/Aplikasi-Kewirausahaan/components/pages/mahasiswa/update_kelompok.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    id_kelompok: <?php echo json_encode($kelompokTerdaftar['id_kelompok']); ?>,
                    nama_kelompok: namaKelompok,
                    nama_bisnis: namaBisnis
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert('Data berhasil diperbarui.');
                    location.reload();
                } else {
                    alert('Terjadi kesalahan saat memperbarui data.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Terjadi kesalahan.');
            });
        });
    </script>
</body>
</html>