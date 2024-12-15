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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/daftar_mentor_mahasiswa.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'daftar_mentor_mahasiswa'; // Halaman ini aktif
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Daftar Mentor Bisnis"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <div class="clearfix">
                    <?php
                    include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

                    $sql = "SELECT * FROM daftar_mentor_bisnis";
                    $result = $conn->query($sql);

                    if ($result === false) {
                        echo "<p>Error pada query: " . $conn->error . "</p>";
                    } elseif ($result->num_rows > 0) {
                        // Output data dari setiap baris
                        while ($row = $result->fetch_assoc()) {
                            echo '<div class="card">';
                            echo '<img alt="Profile picture of the mentor" height="50" src="https://storage.googleapis.com/a1aa/image/Q1BtK1AStCLeOKUuTRnqzR27EJRLg5SmUePjrHw1ilMCaVsTA.jpg" width="50"/>';
                            echo '<h2>' . htmlspecialchars($row["nama"]) . '</h2>';
                            echo '<p>' . htmlspecialchars($row["deskripsi"]) . '</p>';
                            echo '<p>Prodi: </p>';
                            echo '<p>Keahlian: </p>';
                            echo '</div>';
                        }
                    } else {
                        echo "<p>0 hasil</p>";
                    }

                    $conn->close(); // Tutup koneksi setelah selesai
                    ?>
                </div>
            </div>
        </div>
    </div> 
</body>

</html>
