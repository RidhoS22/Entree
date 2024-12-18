<?php
session_start();
// Koneksi ke database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Pastikan id_kelompok sudah ada di sesi
$query = "SELECT id, judul_proposal, status FROM proposal_bisnis";
$result = mysqli_query($conn, $query);
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/proposal_bisnis.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag@3.1.0/dist/css/multi-select-tag.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'proposal_bisnis_mentor'; // Halaman ini aktif
        include 'sidebar_mentor.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Proposal Bisnis Kewirausahaan"; // Judul halaman
                    include 'header_mentor.php'; 
                ?>
            </div>

            <div class="main_wrapper">

                <!-- Menampilkan proposal bisnis dalam bentuk card -->
                <div class="card-container">
                    <?php
                    // Memeriksa apakah ada data proposal yang diambil dari database
                    if (mysqli_num_rows($result) > 0) {
                        while ($proposal = mysqli_fetch_assoc($result)) {
                            // Encode judul_proposal untuk URL
                            $judul_encoded = urlencode($proposal['judul_proposal']);
                            ?>
                            <div class="card" style="width: 33%; margin: 10px;">
                                <div class="card-icon text-center py-4">
                                    <img src="\Aplikasi-Kewirausahaan\assets\img\document-file_6424455.png" alt="Dokumen" style="width: 50px; height: 50px;">
                                </div>
                                <div class="card-body m-0">
                                    <h5 class="card-title"><?php echo htmlspecialchars($proposal['judul_proposal']); ?></h5>
                                </div>
                                <table class="table table-bordered m-0 styled-table">
                                    <tbody>
                                        <tr>
                                            <td>Status Proposal Bisnis</td>
                                            <td>
                                                <span id="status-label" class="status" 
                                                    style="background-color: <?php 
                                                        if ($proposal['status'] == 'disetujui') {
                                                            echo '#2ea56f';
                                                        } elseif ($proposal['status'] == 'ditolak') {
                                                            echo '#dc3545';
                                                        } else {
                                                            echo 'orange';
                                                        }
                                                    ?>; padding: 5px 10px; border-radius: 3px;">
                                                    <?php echo htmlspecialchars($proposal['status']); ?>            
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="card-footer">
                                <a href="detail_proposal_bisnis_mentor.php?judul=<?php echo urlencode($proposal['judul_proposal']); ?>">
                                        <i class="fa-solid fa-eye detail-icon" title="Lihat Detail Proposal Bisnis"></i>
                                    </a>
                                    <i class="fa-solid fa-trash-can delete-icon" title="Hapus Proposal Bisnis" onclick="window.location.href='delete_proposal.php?id=<?php echo $proposal['id']; ?>';"></i>
                                </div>
                            </div>

                            <?php
                        }
                    } else {
                        echo "<p>Tidak ada proposal bisnis yang ditemukan.</p>";
                    }
                    ?>
                </div>
                
             
            </div>
</body>

</html>