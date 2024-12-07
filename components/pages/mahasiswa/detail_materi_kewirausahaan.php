<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if (!isset($_GET['id'])) {
    echo "ID materi tidak ditemukan.";
    exit;
}

$id = $conn->real_escape_string($_GET['id']);

$sql = "SELECT * FROM materi_kewirausahaan WHERE id = '$id'";
$result = $conn->query($sql);

if ($result === false || $result->num_rows === 0) {
    echo "Materi tidak ditemukan.";
    exit;
}

$row = $result->fetch_assoc();
$filePath = htmlspecialchars($row["file_path"]);
$fileExtension = pathinfo($filePath, PATHINFO_EXTENSION);

// Fungsi hanya dideklarasikan sekali
if (!function_exists('generateFilePreview')) {
    function generateFilePreview($filePath, $fileExtension, $height = 500)
    {
        $fileExtension = strtolower($fileExtension);

        if (in_array($fileExtension, ['jpg', 'jpeg', 'png', 'gif'])) {
            return '<img src="' . $filePath . '" alt="Pratinjau Gambar" class="img-fluid rounded shadow" style="max-height:' . $height . 'px;">';
        } elseif ($fileExtension === 'pdf') {
            return '<iframe src="' . $filePath . '" width="100%" height="' . $height . 'px"></iframe>';
        } elseif (in_array($fileExtension, ['mp4', 'webm', 'mov', 'avi'])) {
            return '
            <video width="100%" height="' . $height . 'px" controls>
                <source src="' . $filePath . '" type="video/' . $fileExtension . '">
                Browser Anda tidak mendukung pemutar video.
            </video>';
        } else {
            return '<div class="alert alert-danger">Jenis file tidak didukung untuk pratinjau.</div>';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirausahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/sidebar_mahasiswa.css">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/materikewirausahaan.css">
    <style>
        /* Gaya untuk layout kiri dan kanan */
        .horizontal-layout {
            display: flex;
            flex-direction: row; /* Susun elemen secara horizontal */
            gap: 20px; /* Jarak antar elemen kiri dan kanan */
            margin: 20px 0; /* Spasi di atas dan bawah layout */
        }

        .layout-left {
            flex: 1; /* Bagian kiri menggunakan 1 bagian dari lebar */
            overflow: hidden; /* Potong konten yang terlalu panjang */
        }

        .layout-right {
            flex: 1; /* Bagian kanan menggunakan 2 bagian dari lebar */
            overflow: hidden; /* Potong konten yang terlalu panjang */
        }

        .card{
            height: 300px !important;
        }

        /* .file-preview{
            width: 70%;
        } */

        /* Responsif untuk perangkat kecil */
        @media (max-width: 768px) {
            .horizontal-layout {
                flex-direction: column; /* Susun elemen secara vertikal */
            }

            .layout-left,
            .layout-right {
                flex: none; /* Tidak ada pembagian lebar */
                width: 100%; /* Gunakan lebar penuh */
                margin-bottom: 20px; /* Jarak antar elemen */
            }
        }

    </style>
</head>

<body>
    <div class="wrapper">
        <?php
        $activePage = 'materikewirausahaan_mahasiswa';
        include 'sidebar_mahasiswa.php';
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php
                $pageTitle = "Materi Kewirausahaan";
                include 'header_mahasiswa.php';
                ?>
            </div>

            <div class="main_wrapper">
                            <div class="file-preview">
                                <?= generateFilePreview($filePath, $fileExtension) ?>
                            </div>
                <div class="horizontal-layout">
                    <div class="layout-left">
                            <h1><?= htmlspecialchars($row["judul"]) ?></h1>
                            <p><?= htmlspecialchars($row["deskripsi"]) ?></p>
                            <div class="mt-3">
                                <a href="<?= $filePath ?>" target="_blank" class="btn btn-primary">Lihat File</a>
                                <a href="<?= $filePath ?>" download class="btn btn-secondary">Unduh File</a>
                            </div>
                    </div>
                    <div class="layout-right">
                        <div class="card-container">
                            <?php
                            $sql = "SELECT * FROM materi_kewirausahaan";
                            $result = $conn->query($sql);

                            if ($result === false) {
                                echo "<p>Error pada query: " . $conn->error . "</p>";
                            } elseif ($result->num_rows > 0) {
                                while ($row = $result->fetch_assoc()) {
                                    $filePath = htmlspecialchars($row["file_path"]);
                                    $fileExtension = pathinfo($filePath, PATHINFO_EXTENSION);

                                    echo '
                                    <a href="detail_materi_kewirausahaan.php?id=' . $row["id"] . '">
                                        <div class="card">
                                            <div class="card-img-top">' . generateFilePreview($filePath, $fileExtension, 200) . '</div>
                                            <div class="card-body">
                                                <h5 class="card-title">' . htmlspecialchars($row["judul"]) . '</h5>
                                            </div>
                                        </div>
                                    </a>';
                                }
                            } else {
                                echo "<p>Belum ada materi ditambahkan.</p>";
                            }

                            $conn->close();
                            ?>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>
