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
                <button id="openFormBtn"><i class="fa-solid fa-plus"></i> Tambahkan Materi</button>

                <!-- Modal Form Tambah Materi -->
                <div id="modalForm" class="modal modal-form">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>Tambahkan Materi</h2>
                        <form method="POST" action="" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="judul">Judul Materi:</label>
                                <input type="text" id="judul" name="judul" required>
                            </div>
                            <div class="form-group">
                                <label for="materi">Materi (Video, Dokumen, PPT, dll):</label>
                                <input type="file" id="materi" name="materi" accept=".pdf,.doc,.docx,.ppt,.pptx,.mp4,.avi,.mov,.mkv" required>
                            </div>
                            <div class="form-group">
                                <label for="deskripsi">Deskripsi Materi: (Maks. 500 karakter)</label>
                                <textarea id="deskripsi" name="deskripsi" maxlength="500" required></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" name="kirim">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal Detail Materi -->
                <div id="detailModal" class="modal modal-detail">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <p id="detailJudul"></p>
                        <p id="detailDeskripsi"></p>
                        <div id="filePreview"></div>
                        <div class="btn_container">
                            <a id="detailFileLink" href="#" target="_blank" class="file icon">
                                <i class="fas fa-edit btn-icon"></i> 
                            </a>
                            <a id="detailFileLink" href="#" target="_blank" class="file icon">
                                <i class="fa-solid fa-trash-can btn-icon"></i> 
                            </a>
                        </div>

                        <!-- Tombol Hapus Materi -->
                        <form method="POST" action="">
                            <input type="hidden" id="materiId" name="materiId">
                        </form>
                    </div>
                </div>


                <!-- PHP untuk form detail materi kewirausahaan -->
                <?php
                include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';
                
                $sql = "SELECT * FROM materi_kewirausahaan";
                $result = $conn->query($sql);
                
                if ($result === false) {
                    echo "<p>Error pada query: " . $conn->error . "</p>";
                } elseif ($result->num_rows > 0) {
                    // Loop untuk menampilkan setiap materi kewirausahaan
                    while ($row = $result->fetch_assoc()) {
                        echo '<div class="container_materi" onclick="showDetailModal(\'' . $row["id"] . '\', \'' . htmlspecialchars($row["judul"]) . '\', \'' . htmlspecialchars($row["deskripsi"]) . '\', \'' . htmlspecialchars($row["file_path"]) . '\')">';
                        echo '<div class="judul_materi">' . htmlspecialchars($row["judul"]) . '</div>';
                        echo '<div class="deskripsi_materi">' 
                                . htmlspecialchars($row["deskripsi"]) . 
                                '<i class="fa-solid fa-eye detail-icon"></i> </div>';
                        echo '</div>';
                    }
                } else {
                    echo "<p>Belum ada materi ditambahkan</p>";
                }
                
                $conn->close();
                ?>
                

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


                <script>
                    var modalForm = document.getElementById("modalForm");
                    var detailModal = document.getElementById("detailModal");
                    var openFormBtn = document.getElementById("openFormBtn");
                    var closeBtns = document.getElementsByClassName("close-btn");

                    openFormBtn.onclick = function() {
                        modalForm.style.display = "block";
                    };

                    Array.from(closeBtns).forEach(btn => {
                        btn.onclick = function() {
                            modalForm.style.display = "none";
                            detailModal.style.display = "none";
                        };
                    });

                    window.onclick = function(event) {
                        if (event.target == modalForm) {
                            modalForm.style.display = "none";
                        } else if (event.target == detailModal) {
                            detailModal.style.display = "none";
                        }
                    };

                    // Function to show detail modal with data
                    function showDetailModal(id, judul, deskripsi, filePath) {
                        document.getElementById("detailJudul").textContent = judul;
                        document.getElementById("detailDeskripsi").textContent = deskripsi;
                        document.getElementById("detailFileLink").href = filePath;
                        document.getElementById("materiId").value = id; // Mengisi ID ke input hidden
                        document.getElementById("detailModal").style.display = "block";

                        // Dapatkan elemen pratinjau file
                        const filePreview = document.getElementById("filePreview");
                        filePreview.innerHTML = ''; // Bersihkan konten sebelumnya

                        // Deteksi jenis file berdasarkan ekstensi
                        const fileExtension = filePath.split('.').pop().toLowerCase();

                        if (fileExtension === 'pdf') {
                            // Pratinjau PDF
                            filePreview.innerHTML = `<iframe src="${filePath}" width="100%" height="500px"></iframe>`;
                        } else if (['jpg', 'jpeg', 'png', 'gif'].includes(fileExtension)) {
                            // Pratinjau Gambar
                            filePreview.innerHTML = `<img src="${filePath}" alt="Pratinjau Gambar" class="img-fluid rounded shadow">`;
                        } else if (fileExtension === 'txt') {
                            // Pratinjau Teks
                            fetch(filePath)
                                .then(response => response.text())
                                .then(text => {
                                    filePreview.innerHTML = `<pre class="border rounded p-3 bg-light">${text}</pre>`;
                                })
                                .catch(error => {
                                    filePreview.innerHTML = '<p>Gagal memuat konten teks.</p>';
                                });
                        } else if (['mp4', 'webm', 'mov', 'avi'].includes(fileExtension)) {
                            // Pratinjau Video
                            filePreview.innerHTML = `
                                <video width="100%" height="300px" controls>
                                    <source src="${filePath}" type="video/${fileExtension}">
                                    Browser Anda tidak mendukung pemutar video.
                                </video>`;
                        } else {
                            filePreview.innerHTML = '<div class="alert alert-danger">Jenis file tidak didukung untuk pratinjau.</div>';
                        }
                                }

                </script>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>
