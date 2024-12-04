<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mendapatkan NPM mahasiswa dari session
$npm_mahasiswa = $_SESSION['npm'];

// Cek apakah mahasiswa adalah ketua atau anggota kelompok
$cekKelompokQuery = "
    SELECT kb.*, ak.id_kelompok AS anggota_id
    FROM kelompok_bisnis kb
    LEFT JOIN anggota_kelompok ak ON kb.id_kelompok = ak.id_kelompok
    WHERE kb.npm_ketua = '$npm_mahasiswa' OR ak.npm_anggota = '$npm_mahasiswa' LIMIT 1";
$cekKelompokResult = mysqli_query($conn, $cekKelompokQuery);
$kelompokTerdaftar = mysqli_fetch_assoc($cekKelompokResult);
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
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
        }
        .container {
            display: flex;
            flex-direction: row;
            gap: 30px;
            padding: 40px;
            justify-content: center;
        }
        .left {
            width: 350px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }
        .left img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .right {
            flex: 1;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .title-edit {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .title-edit h1 {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
            color: #333;
        }
        .edit-btn {
            font-size: 25px;
            cursor: pointer;
            border: 0;
            background-color: transparent;
            transition: transform 0.3s ease; /* Animasi ikon */
            }

        .edit-btn:hover {
        transform: scale(1.1); /* Ikon membesar saat hover */
        }
        .category, .sdg, .members, .tutor {
            margin-top: 20px;
        }
        .category p, .sdg p, .members p, .tutor p {
            font-size: 16px;
            color: #555;
        }
        .category strong, .sdg strong, .members strong, .tutor strong {
            font-weight: bold;
            color: #333;
        }
        .members p, .tutor p {
            font-size: 16px;
            color: #333;
            margin-bottom: 5px;
        }
        .members p i, .tutor p i {
            color: #007bff;
        }
        .bottom {
            margin-top: 20px;
        }
        .bottom p {
            font-size: 16px;
            color: #555;
        }
        .bottom p strong {
            font-weight: bold;
            color: #333;
        }

        /* Responsiveness */
        @media (max-width: 768px) {
            .container {
                flex-direction: column; /* Ubah orientasi menjadi vertikal */
                align-items: center;   /* Rata tengah secara horizontal */
                gap: 20px;             /* Jarak antar elemen */
            }

            .left, .right {
                width: 90%;            /* Sesuaikan lebar elemen agar tidak terlalu besar */
                max-width: 500px;      /* Batasi lebar maksimal */
            }

            .left img {
                width: 100%;           /* Pastikan gambar mengikuti lebar container */
                height: auto;          /* Menjaga rasio aspek gambar */
            }
        }

    </style>
</head>
<body>
    <div class="wrapper">
        <?php include 'sidebar_mahasiswa.php'; ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Detail Kelompok Bisnis"; // Judul halaman
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
                            <div class="title-edit">
                                <h1><?php echo $kelompokTerdaftar['nama_kelompok']; ?></h1>
                                <button class="edit-btn" type="button">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                            <p><strong>Ide Bisnis:</strong> <?php echo $kelompokTerdaftar['ide_bisnis']; ?></p>
                            <p><strong>Nama Bisnis:</strong> <?php echo $kelompokTerdaftar['nama_bisnis']; ?></p> <!-- Nama Bisnis -->

                            <div class="category">
                                <p><strong>Kategori Bisnis:</strong> -</p> <!-- Kategori kosong -->
                            </div>
                            <div class="sdg">
                                <p><strong>Sustainable Development Goals (SDGs):</strong> -</p> <!-- SDGs kosong -->
                            </div>

                            <div class="bottom">
                                <div class="members">
                                    <p><strong>Ketua Kelompok:</strong> 
                                        <?php
                                            // Mendapatkan nama ketua kelompok berdasarkan npm ketua
                                            $ketuaQuery = "SELECT nama FROM mahasiswa WHERE npm = '" . $kelompokTerdaftar['npm_ketua'] . "' LIMIT 1";
                                            $ketuaResult = mysqli_query($conn, $ketuaQuery);
                                            $ketuaData = mysqli_fetch_assoc($ketuaResult);
                                            echo $ketuaData['nama'];
                                        ?>
                                    </p>

                                    <p><strong>Anggota Kelompok:</strong></p>
                                    <?php
                                    // Menampilkan anggota kelompok
                                    $anggotaQuery = "
                                        SELECT ak.npm_anggota, m.nama
                                        FROM anggota_kelompok ak
                                        JOIN mahasiswa m ON ak.npm_anggota = m.npm
                                        WHERE ak.id_kelompok = " . $kelompokTerdaftar['id_kelompok'];
                                    $anggotaResult = mysqli_query($conn, $anggotaQuery);
                                    while ($anggota = mysqli_fetch_assoc($anggotaResult)) {
                                        echo "<p><i class='fas fa-user'></i> " . $anggota['nama'] . " (" . $anggota['npm_anggota'] . ")</p>";
                                    }
                                    ?>
                                </div>

                                <div class="tutor">
                                    <p><strong>Mentor Bisnis:</strong> <?php echo htmlspecialchars($kelompokTerdaftar ['mentor_bisnis']); ?></p> 
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
</body>
</html>
