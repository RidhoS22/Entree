<?php
// Mengimpor koneksi database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Query untuk mengambil data kelompok bisnis
$sql = "SELECT * FROM kelompok_bisnis";
$result = $conn->query($sql);
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mentorbisnis/daftar_kelompok_bisnis_mentor.css">
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
                    $pageTitle = "Daftar Kelompok Bisnis"; 
                    include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <?php
                // Cek apakah ada data kelompok bisnis
                if ($result->num_rows > 0) {
                    // Menampilkan data kelompok bisnis
                    while($row = $result->fetch_assoc()) {
                        $id_kelompok = $row['id_kelompok'];
                        echo '<div class="card">';
                        echo '<div class="card-header">';
                        echo '<h2>' . htmlspecialchars($row['nama_kelompok']) . '</h2>';
                        echo '</div>';
                        echo '<a href="detail_kelompok.php?id_kelompok=' . $id_kelompok . '">';
                        echo '<div class="card-body">';
                        echo '<p>' . htmlspecialchars($row['ide_bisnis']) . '</p>';
                        echo '<i class="fa-solid fa-eye detail-icon"></i>';
                        echo '</div>';
                        echo '</a>';
                        echo '<div class="card-footer">';
                        echo '<a href="detail_kelompok.php?id_kelompok=' . $id_kelompok . '">Lihat Detail Kelompok Bisnis</a>';
                        echo '</div>';
                        echo '</div>';
                    }
                } else {
                    echo '<p>Tidak ada kelompok bisnis yang tersedia.</p>';
                }
                ?>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>

<?php
// Menutup koneksi database
$conn->close();
?>
