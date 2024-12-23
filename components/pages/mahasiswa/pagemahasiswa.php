<?php
    session_start();
    include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

    if (!isset($_SESSION['username'])) {
        header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
        exit;
    }

    $user_id = $_SESSION['user_id'];

    $query_user = "SELECT username FROM users WHERE id = '$user_id'";
    $result_user = $conn->query($query_user);

    if ($result_user && $result_user->num_rows > 0) {
        $user = $result_user->fetch_assoc();
        $username = $user['username'];
    } else {
        die("User tidak ditemukan.");
    }

    $query_mahasiswa = "SELECT * FROM mahasiswa WHERE user_id = '$user_id'";
    $result_mahasiswa = $conn->query($query_mahasiswa);

    if ($result_mahasiswa && $result_mahasiswa->num_rows > 0) {
        $mahasiswa = $result_mahasiswa->fetch_assoc();
    } else {
        die("Data mahasiswa tidak ditemukan.");
    }

    $showToast = false;
    if (!isset($_SESSION['show_toast'])) {
        $showToast = true;
        $_SESSION['show_toast'] = true;
    }

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
<?php
$query_materi = "SELECT * FROM materi_kewirausahaan";
$result_materi = $conn->query($query_materi);

$materi = [];
if ($result_materi && $result_materi->num_rows > 0) {
    while ($row = $result_materi->fetch_assoc()) {
        $filePath = $row['file_path'];
        $fileExtension = pathinfo($filePath, PATHINFO_EXTENSION);
        $icon = getFileIcon($fileExtension);

        $materi[] = [
            'id' => $row['id'],
            'judul' => htmlspecialchars($row['judul']),
            'deskripsi' => htmlspecialchars($row['deskripsi']),
            'icon' => $icon
        ];
    }
}

echo '<script>const cardsData = ' . json_encode($materi) . ';</script>';
?>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIbml3AdvoEwyCvRhtojA0RsIB7BYAYfK59VeBYo6H" crossorigin="anonymous"></script>
    <link href="\Aplikasi-Kewirausahaan\assets\css\materikewirausahaan.css" rel="stylesheet" />
    <style>
        .card-container {
            width: 80%;
        }
       
        .pagination-buttons {
            margin-top: 1rem;
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'pagemahasiswa'; 
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Beranda"; 
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <h4>Materi Kewirausahaan</h4>
                <div class="card-container" id="card-container"></div>
                <div class="pagination-buttons">
                    <button class="btn btn-primary" id="prev-button" disabled>Previous</button>
                    <button class="btn btn-primary" id="next-button">Next</button>
                </div>
            </div>
        </div>
    </div>

    <?php if ($showToast): ?>
    <div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3" style="z-index: 1055;">
        <div class="toast" id="myToast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <img src="\Aplikasi-Kewirausahaan\assets\img\Frame 64 1.png" style="width:20%; height:20%"; class="rounded me-2" alt="Logo">
                <strong class="me-auto">Welcome</strong>
                <small>Just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Hallo! Selamat datang <?= htmlspecialchars($mahasiswa['nama'] ?? 'Belum diisi'); ?> di aplikasi bimbingan kewirausahaan! Semoga sukses belajar!
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const toastEl = document.getElementById('myToast');
            const toast = new bootstrap.Toast(toastEl);
            toast.show();
        });
    </script>
    <?php endif; ?>

    <?php
        $query_materi = "SELECT * FROM materi_kewirausahaan";
        $result_materi = $conn->query($query_materi);

        $materi = [];
        if ($result_materi && $result_materi->num_rows > 0) {
            while ($row = $result_materi->fetch_assoc()) {
                $materi[] = [
                    'id' => $row['id'],
                    'judul' => htmlspecialchars($row['judul']),
                    'deskripsi' => htmlspecialchars($row['deskripsi']),
                ];
            }
        }

        echo '<script>const cardsData = ' . json_encode($materi) . ';</script>';
    ?>

    <script>
        const cardsPerPage = 3;
        let currentPage = 0;

        function renderCards() {
            const cardContainer = document.getElementById("card-container");
            cardContainer.innerHTML = "";

            const start = currentPage * cardsPerPage;
            const end = start + cardsPerPage;
            const currentCards = cardsData.slice(start, end);

            currentCards.forEach(card => {
                const cardHtml = `
                <a href="detail_materi_kewirausahaan.php?id=${card.id}">
                    <div title="Lihat Detail Materi" class="card" onclick="showDetailModal('${card.id}', '${card.judul}', '${card.deskripsi}', '${card.filePath}')">
                        <div class="icon-container">
                            <img src="${card.icon}" alt="File Icon" class="icon">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${card.judul}</h5>
                            <p class="card-text">${card.deskripsi}</p>
                        </div>
                    </div>
                </a>

                `;
                cardContainer.innerHTML += cardHtml;
            });

            document.getElementById("prev-button").disabled = currentPage === 0;
            document.getElementById("next-button").disabled = end >= cardsData.length;
        }


        document.getElementById("prev-button").addEventListener("click", () => {
            if (currentPage > 0) {
                currentPage--;
                renderCards();
            }
        });

        document.getElementById("next-button").addEventListener("click", () => {
            if ((currentPage + 1) * cardsPerPage < cardsData.length) {
                currentPage++;
                renderCards();
            }
        });

        renderCards();
    </script>
</body>

</html>
