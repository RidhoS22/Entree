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
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'daftar_kelompok_bisnis_mentor'; 
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
                    <div class="card">
                        <div class="card-header">
                            <h2><?php echo htmlspecialchars($kelompok['nama_kelompok']); ?></h2>
                        </div>
                        <div class="card-body">
                            <!-- Menampilkan Logo Bisnis -->
                            <?php if (!empty($kelompok['logo_bisnis'])) { ?>
                                <img alt="Logo Bisnis" src="/Aplikasi-Kewirausahaan/components/pages/mahasiswa/logos/<?php echo htmlspecialchars($kelompok['logo_bisnis']); ?>" class="img-fluid mb-3" style="max-width: 200px;">
                            <?php } else { ?>
                                <p><em>Logo bisnis belum diunggah</em></p>
                            <?php } ?>

                            <p><strong>Nama Bisnis:</strong> <?php echo htmlspecialchars($kelompok['nama_bisnis']); ?></p>
                            <p><strong>Kategori Bisnis:</strong> --</p> 
                            <p><strong>Sustainable Development Goals (SDGs):</strong> --</p> 
                            <p><strong>Ide Bisnis:</strong> <?php echo htmlspecialchars($kelompok['ide_bisnis']); ?></p>
                        </div>
                        <div class="card-footer">
                            <h5><strong>Ketua Kelompok:</strong> <?php echo htmlspecialchars($ketua['nama']); ?> (<?php echo htmlspecialchars($kelompok['npm_ketua']); ?>)</h5>
                            <h6><strong>Anggota Kelompok:</strong></h6>
                            <ul>
                                <?php while ($anggota = $anggotaResult->fetch_assoc()) { ?>
                                    <li><?php echo htmlspecialchars($anggota['nama']) . ' (' . htmlspecialchars($anggota['npm']) . ')'; ?></li>
                                <?php } ?>
                            </ul>
                            <p><strong>Mentor Bisnis:</strong> --</p> <!-- Kosongkan mentor bisnis -->
                        </div>
                    </div>
                <?php } else { ?>
                    <p>Kelompok bisnis tidak ditemukan.</p>
                <?php } ?>

                <!-- Tombol Back -->
                <div class="mt-3">
                    <a href="daftar_kelompok_bisnis_admin.php" class="btn btn-primary mt-3">Kembali ke Daftar Kelompok Bisnis</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>

</html>

<?php
// Menutup koneksi database
$conn->close();
?>
