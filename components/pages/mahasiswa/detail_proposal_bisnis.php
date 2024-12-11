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
                <?php
                // Koneksi ke database
                include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

                // Ambil judul proposal dari URL
                $judul_proposal = isset($_GET['judul']) ? $_GET['judul'] : '';

                // Query untuk mendapatkan data proposal dan ide bisnis menggunakan LEFT JOIN
                $query = "SELECT p.*, k.ide_bisnis 
                          FROM proposal_bisnis p 
                          LEFT JOIN kelompok_bisnis k ON p.kelompok_id = k.id_kelompok 
                          WHERE p.judul_proposal = ?";
                $stmt = $conn->prepare($query);
                $stmt->bind_param("s", $judul_proposal);
                $stmt->execute();
                $result = $stmt->get_result();

                // Cek apakah data ditemukan
                if ($result->num_rows > 0) {
                    $proposal = $result->fetch_assoc();
                ?>
                    <h2><?php echo htmlspecialchars($proposal['judul_proposal']); ?></h2>
                    <div class="description">
                        <strong>Ide Bisnis:</strong>
                        <p><?php echo htmlspecialchars($proposal['ide_bisnis'] ?? 'Tidak ada ide bisnis.'); ?></p>
                    </div>

                    <!-- Table Section -->
                    <table class="styled-table">
                        <tr>
                            <td><strong>SDG Bisnis:</td>
                            <td class="file-box"><?php echo htmlspecialchars($proposal['sdg']); ?></td>
                        </tr>
                        <tr>
                            <td><strong>Kategori Bisnis:</td>
                            <td class="file-box"><?php echo htmlspecialchars($proposal['kategori']); ?></td>
                        </tr>
                        <tr>
                            <td><strong>File Proposal Bisnis:</td>
                            <td class="file-box">
                                <!-- Menampilkan nama file tanpa path -->
                                <a href="<?php echo htmlspecialchars($proposal['proposal_pdf']); ?>" target="_blank">
                                    <?php echo basename($proposal['proposal_pdf']); ?>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Status:</td>
                            <td class="file-box">
                                <span id="status-label" class="status" 
                                      style="background-color: <?php 
                                          if ($proposal['status'] == 'disetujui') {
                                              echo 'green';
                                          } elseif ($proposal['status'] == 'ditolak') {
                                              echo 'red';
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
                        <p><?php echo htmlspecialchars($proposal['umpan_balik'] ?? 'Belum ada umpan balik.'); ?></p>
                    </div>
                    <a href="proposal_bisnis_mahasiswa.php" class="btn btn-secondary">Kembali</a>
                <?php
                } else {
                    echo "<p>Proposal tidak ditemukan.</p>";
                }
                ?>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>
