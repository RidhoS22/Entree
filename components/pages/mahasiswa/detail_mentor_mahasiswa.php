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
    <style>
        .card {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin: 20px;
        width: 50%;
        box-sizing: border-box;
        float: left;
        }
        .card img {
        border-radius: 50%;
        width: 50px;
        height: 50px;
        }
        .card h2 {
        font-size: 18px;
        margin: 10px 0;
        }
        .card p {
        font-size: 14px;
        color: #666;
        margin: 5px 0;
        }
        .clearfix::after {
        content: "";
        clear: both;
        display: table;
        }

        /* Responsiveness */
        @media (max-width: 800px) {
        .card {
            width: calc(
            50% - 40px
            ); /* Setiap card mengambil 50% lebar, dikurangi margin */
        }
        }

        @media (max-width: 670px) {
        .card {
            width: calc(
            100% - 40px
            ); /* Setiap card mengambil 50% lebar, dikurangi margin */
        }
        }
    </style>
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
                    $pageTitle = "Mentor Bisnis"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <div class="clearfix">
                <?php
                    include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

                    $sql = "SELECT * FROM daftar_mentor_bisnis LIMIT 1"; // Batasi hasil query hanya 1 baris
                    $result = $conn->query($sql);

                    if ($result === false) {
                        echo "<p>Error pada query: " . $conn->error . "</p>";
                    } elseif ($result->num_rows > 0) {
                        // Ambil data baris pertama
                        $row = $result->fetch_assoc();
                        echo '
                        <div class="d-flex justify-content-center">
                            <div class="card p-3" style="width: 50%;">
                                <img alt="Profile picture of the mentor" height="50" src="https://storage.googleapis.com/a1aa/image/Q1BtK1AStCLeOKUuTRnqzR27EJRLg5SmUePjrHw1ilMCaVsTA.jpg" width="50" class="card-img-top mx-auto d-block mt-3"/>
                                <h2 class="card-title text-center">' . htmlspecialchars($row["nama"]) . '</h2>
                                <div class="card-body">
                                    <p class="card-text">Peran:</p>
                                    <p class="card-text">Keahlian:</p>
                                    <p class="card-text">Fakultas:</p>
                                    <p class="card-text">Prodi:</p>
                                    <p class="card-text">Nomor Telepon:</p>
                                    <p class="card-text">Alamat Email:</p>
                                </div>
                            </div>
                        </div>';
                    } else {
                        echo "<p>0 hasil</p>";
                    }

                    $conn->close(); // Tutup koneksi setelah selesai
                    ?>

                </div>
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
