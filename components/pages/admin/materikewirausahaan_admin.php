<?php
session_start();

function getFileIcon($fileExtension) {
    $fileExtension = strtolower($fileExtension);
    switch ($fileExtension) {
        case 'mp4':
        case 'webm':
        case 'mov':
        case 'avi':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_video.png';
        case 'ppt':
        case 'pptx':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_ppt.png';
        case 'pdf':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_pdf.png';
        case 'doc':
        case 'docx':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_word.png';
        case 'xls':
        case 'xlsx':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_excel.png';
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
            return '/Aplikasi-Kewirausahaan/assets/img/icon_image.png';
        default:
            return '/Aplikasi-Kewirausahaan/assets/img/icon_default.png';
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

    $judul = $_POST['judul'];
    $deskripsi = $_POST['deskripsi'];

    if (isset($_FILES['materi']) && $_FILES['materi']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['materi']['tmp_name'];
        $fileName = basename($_FILES['materi']['name']);
        $uploadFolder = $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/components/pages/admin/uploads/';
        $destPath = $uploadFolder . $fileName;

        if (move_uploaded_file($fileTmpPath, $destPath)) {
            // Simpan hanya nama file ke database
            $sql = "INSERT INTO materi_kewirausahaan (judul, file_path, deskripsi) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sss", $judul, $fileName, $deskripsi);

            if ($stmt->execute()) {
                $_SESSION['toast_success'] = true;
                header("Location: materikewirausahaan_admin.php");
                exit();
            }
            $stmt->close();
        }
    }
}
?>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirausahaan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/materikewirausahaan.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'materikewirausahaan_admin';
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                $pageTitle = "Materi Kewirausahaan";
                include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <button type="button" class="btn-hijau" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Tambah Materi
                </button>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Materi Kewirausahaan</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="judul">Judul Materi:</label>
                                        <input type="text" id="judul" name="judul" required>
                                    </div>
                                    
                                    <div class="form-group mb-3">
                                        <label for="materi" class="form-label">Materi (Video, Dokumen, PPT, dll)</label>
                                        <div class="input-group">
                                            <input type="file" class="form-control" id="materi" name="materi" accept=".pdf,.doc,.docx,.ppt,.pptx,.mp4,.avi,.mov,.mkv" required />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="deskripsi">Deskripsi Materi: (Maks. 500 karakter)</label>
                                        <textarea id="deskripsi" name="deskripsi" maxlength="500" required></textarea>
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                <button type="submit" class="btn btn-success" name="kirim">Unggah Materi</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Toast Notification -->
                <?php if (isset($_SESSION['toast_success'])): ?>
                    <div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3" style="z-index: 1055;">
                        <div class="toast text-bg-success border-0" id="toastSuccess" role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="toast-header">
                                <img src="\Aplikasi-Kewirausahaan\assets\img\Frame 64 1.png" style="width:20%; height:20%;" class="rounded me-2" alt="Logo">
                                <strong class="me-auto">Success</strong>
                                <small>Just now</small>
                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                            <div class="toast-body">
                                Materi berhasil diunggah!
                            </div>
                        </div>
                    </div>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            const toastSuccess = document.getElementById('toastSuccess');
                            if (toastSuccess) {
                                const toast = new bootstrap.Toast(toastSuccess);
                                toast.show();
                            }
                        });
                    </script>
                    <?php unset($_SESSION['toast_success']); ?>
                <?php endif; ?>


                <!-- Display Materials -->
                <div class="card-container">
                    <?php
                    include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';
                    $sql = "SELECT * FROM materi_kewirausahaan";
                    $result = $conn->query($sql);

                    if ($result && $result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            $fileName = htmlspecialchars($row["file_path"]);
                            $filePath = '/Aplikasi-Kewirausahaan/components/pages/admin/uploads/' . $fileName;
                            $fileExtension = pathinfo($fileName, PATHINFO_EXTENSION);
                            $iconSrc = getFileIcon($fileExtension);

                            echo '
                            <a href="detail_materi_kewirausahaan.php?id=' . $row["id"] . '">
                                <div class="card">
                                    <div class="icon-container"> 
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
