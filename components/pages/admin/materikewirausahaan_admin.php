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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Aplikasi Kewirausahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/materikewirausahaan.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'materikewirausahaan_admin'; // Halaman ini aktif
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Materi Kewirausahaan"; // Judul halaman
                    include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">

            <!-- Button trigger modal -->
                <button type="button" class="btn-hijau" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Tambah Materi
                </button>

                <!-- Modal -->
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
                                <label for="materi" class="form-label">
                                    Materi 
                                    <small class="text-muted">(Video, Dokumen, PPT, dll)</small>
                                </label>
                                <div class="input-group">
                                    <input 
                                        type="file" 
                                        class="form-control" 
                                        id="materi" 
                                        name="materi" 
                                        accept=".pdf,.doc,.docx,.ppt,.pptx,.mp4,.avi,.mov,.mkv" 
                                        required 
                                    />
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

                <?php
                include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    $judul = $_POST['judul'];
                    $deskripsi = $_POST['deskripsi'];

                    if (isset($_FILES['materi']) && $_FILES['materi']['error'] === UPLOAD_ERR_OK) {
                        $fileTmpPath = $_FILES['materi']['tmp_name'];
                        $fileName = basename($_FILES['materi']['name']);
                        $uploadFolder = $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/components/pages/admin/uploads/';
                        $destPath = $uploadFolder . $fileName;

                        if (move_uploaded_file($fileTmpPath, $destPath)) {
                            $domain = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'];
                            $filePath = $domain . '/Aplikasi-Kewirausahaan/components/pages/admin/uploads/' . $fileName;

                            $sql = "INSERT INTO materi_kewirausahaan (judul, deskripsi, file_path) VALUES (?, ?, ?)";
                            $stmt = $conn->prepare($sql);
                            $stmt->bind_param("sss", $judul, $deskripsi, $filePath);

                            if ($stmt->execute()) {
                                echo "<script>window.location='materikewirausahaan_admin.php';</script>";
                                echo "<div class='alert alert-success'>Data berhasil disimpan!</div>";
                            } else {
                                echo "<div class='alert alert-danger'>Gagal menyimpan data ke database.</div>";
                            }

                            $stmt->close();
                        } else {
                            echo "<div class='alert alert-danger'>Gagal mengunggah file.</div>";
                        }
                    } else {
                        echo "<div class='alert alert-danger'>File tidak valid atau tidak ada file yang diunggah.</div>";
                    }
                }
                ?>

                <!-- PHP untuk Menghapus Materi -->
                <?php
                    include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

                    // Fungsi untuk menghapus materi
                    if (isset($_POST['hapusMateri'])) {
                        $materiId = $_POST['materiId'];

                        // Cari file path dari database menggunakan ID
                        $sql = "SELECT file_path FROM materi_kewirausahaan WHERE id = ?";
                        $stmt = $conn->prepare($sql);
                        $stmt->bind_param("i", $materiId);
                        $stmt->execute();
                        $stmt->bind_result($filePath);
                        $stmt->fetch();
                        $stmt->close();

                        if ($filePath) {
                            // Hapus file dari folder uploads
                            $uploadFolder = $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/components/pages/admin/uploads/';
                            $fileName = basename($filePath); // Ambil nama file dari path
                            $fileToDelete = $uploadFolder . $fileName;

                            if (file_exists($fileToDelete)) {
                                unlink($fileToDelete); // Hapus file dari server
                            }

                            // Hapus entri dari database
                            $deleteSql = "DELETE FROM materi_kewirausahaan WHERE id = ?";
                            $deleteStmt = $conn->prepare($deleteSql);
                            $deleteStmt->bind_param("i", $materiId);

                            if ($deleteStmt->execute()) {
                                echo "<div class='alert alert-success'>Materi berhasil dihapus!</div>";
                                echo "<script>window.location='materikewirausahaan_admin.php';</script>";
                            } else {
                                echo "<div class='alert alert-danger'>Gagal menghapus materi dari database.</div>";
                            }

                            $deleteStmt->close();
                        } else {
                            echo "<div class='alert alert-danger'>Materi tidak ditemukan.</div>";
                        }

                        $conn->close();
                    }
                    ?>

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
    </div>

</body>

</html>
