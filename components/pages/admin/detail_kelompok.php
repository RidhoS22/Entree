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
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'daftar_kelompok_bisnis_admin'; 
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Detail Kelompok Bisnis"; 
                    include 'header_admin.php'; 
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
                                Program Ingkubasi
                            </button>
                            <!-- Modal Rekomendasi -->
                            <div class="modal fade" id="recommendationModal" tabindex="-1" aria-labelledby="recommendationModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="recommendationModalLabel">Rekomendasi Program Inkubasi</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form id="recommendationForm">
                                            <div class="modal-body">
                                                <p>Apakah Anda menyetujui rekomendasi dari mentor bisnis untuk memasukkan kelompok ini ke dalam Program Inkubasi Bisnis?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary btn-cancel" data-bs-dismiss="modal">Tolak</button>
                                                <button type="submit" class="btn btn-secondary btn-submit">Setuju</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="Nama_bisnis">
                            <p><strong>Nama Bisnis:</strong> <?php echo htmlspecialchars($kelompok['nama_bisnis'] ?? '--'); ?></p>
                        </div>
                        <div class="ide_bisnis">
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
                            <div class="card" onclick="window.location.href='proposal_bisnis_admin.php?id_kelompok=<?php echo $id_kelompok; ?>'" title="Lihat Proposal Bisnis Kelompok Disini">
                                <h5>Proposal Bisnis</h5>
                            </div>
                            <!-- Card 2 -->
                            <div class="card" onclick="window.location.href='laporan_bisnis_admin.php?id_kelompok=<?php echo $id_kelompok; ?>'" title="Laporan Kemajuan Bisnis Kelompok Disini">
                                <h5>Laporan Kemajuan Bisnis</h5>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } else { ?>
                <p>Data kelompok tidak ditemukan.</p>
            <?php } ?>


                <!-- Tombol Back -->
                <div class="mt-3">
                    <a href="daftar_kelompok_bisnis_admin.php" class="btn btn-secondary mt-3">Kembali ke Daftar Kelompok Bisnis</a>
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
