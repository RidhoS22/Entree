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
<?php
function getFileIcon($fileExtension) {
    // Standarisasi ekstensi menjadi huruf kecil
    $fileExtension = strtolower($fileExtension);

    // Tentukan icon berdasarkan ekstensi
    switch ($fileExtension) {
        case 'mp4':
        case 'webm':
        case 'mov':
        case 'avi':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_video.png'; // Icon video
        case 'ppt':
        case 'pptx':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_ppt.png'; // Icon PPT
        case 'pdf':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_pdf.png'; // Icon PDF
        case 'doc':
        case 'docx':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_word.png'; // Icon Word
        case 'xls':
        case 'xlsx':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_excel.png'; // Icon Excel
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_image.png'; // Icon gambar
        default:
            return '/Aplikasi-Kewirausahaan/assets/img/icon_default.png'; // Icon default
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/materikewirausahaan.css">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_materikewirausahaan.css">
</head>

<body>
    <div class="wrapper">
        <?php
        $activePage = 'materikewirausahaan_mentor';
        include 'sidebar_mentor.php';
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php
                $pageTitle = "Materi Kewirausahaan";
                include 'header_mentor.php';
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
                                <div class="btn_container">
                                    <a id="detailFileLink" href="#" target="_blank" class="file icon" title="Lihat Materi Kewirausahaan">
                                        <i class="fa-solid fa-eye btn-icon"></i>
                                    </a>
                                    <a id="detailFileLink" href="#" target="_blank" class="file icon" title="Unduh Materi Kewirausahaan">
                                        <i class="fa-solid fa-download btn-icon"></i>
                                    </a>
                                </div>
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
                                
                                    // Gunakan fungsi getFileIcon untuk mendapatkan jalur icon
                                    $iconSrc = getFileIcon($fileExtension);
                                
                                    echo '
                                    <a href="detail_materi_kewirausahaan.php?id=' . $row["id"] . '">
                                        <div title="Lihat Detail Materi" class="card" onclick="showDetailModal(\'' . $row["id"] . '\', \'' . htmlspecialchars($row["judul"]) . '\', \'' . htmlspecialchars($row["deskripsi"]) . '\', \'' . $filePath . '\')">
                                            <div class="icon-container""> 
                                                <img src="' . $iconSrc . '" alt="File Icon" class="icon">
                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-title">' . htmlspecialchars($row["judul"]) . '</h5>
                                                <p class="card-text">' . htmlspecialchars($row["deskripsi"]) . '</p>
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
</body>

</html>
