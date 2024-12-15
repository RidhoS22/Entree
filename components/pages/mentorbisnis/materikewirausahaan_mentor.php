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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/materikewirausahaan.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'materikewirausahaan_mentor'; // Halaman ini aktif
        include 'sidebar_mentor.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Materi Kewirausahaan"; // Judul halaman
                    include 'header_mentor.php'; 
                ?>
            </div>

            <div class="main_wrapper">

                <!-- PHP untuk menampilkan materi -->
                <div class="card-container">
                <?php
                include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';
                
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

                    echo '</div>';
                } else {
                    echo "<p>Belum ada materi ditambahkan</p>";
                }

                $conn->close();

                ?>
            </div>
        </div>
    </div>
</body>

</html>