<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirusahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/admin/materikewirausahaan_admin.css">
</head>

<body>
    <div class="wrapper">
    <aside id="sidebar">
            <div class="d-flex">
                <button class="toggle-btn" type="button">
                    <i class="fa-solid fa-bars"></i>
                </button>
                <div class="sidebar-logo">
                    <a href="#">Yarsi Entree</a>
                </div>
            </div>
            <ul class="sidebar-nav">
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link">
                        <i class="fa-solid fa-user"></i>
                        <span>Profil</span>
                    </a>
                </li>
                <li class="sidebar-item active">
                    <a href="pageadmin.php" class="sidebar-link">
                        <i class="fa-solid fa-house"></i>
                        <span>Beranda</span>
                    </a>
                </li>
                <hr>
                <li class="sidebar-header">
                    <h1>Admin PIKK</h1>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link">
                        <i class="fa-solid fa-book"></i>
                        <span>Materi Kewirausahaan</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link">
                    <i class="fa-solid fa-address-card"></i>  
                    <span>Daftar Mentor Bisnis</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link">
                        <i class="fa-solid fa-users"></i>
                        <span>Daftar Kelompok Bisnis</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link">
                        <i class="fa-solid fa-file"></i>
                        <span>Daftar Bisnis Kelompok</span>
                    </a>
                </li>
                <li class="sidebar-item sign-out">
                    <a href="/Aplikasi-Kewirausahaan/components/pages/startdashboard/dashboardawal.php" class="sidebar-link">
                        <i class="fa-solid fa-sign-out"></i>
                        <span>Keluar</span>
                    </a>
                </li>
            </ul>
        </aside>

        <div class="main p-3">
            <div class="main_header">
                <h1>Materi Kewirausahaan</h1>
                <a href="#" class="notification">
                    <i class="fa-regular fa-bell"></i>
                </a>
            </div>

            <div class="main_wrapper">
        
                <button id="openFormBtn"><i class="fa-solid fa-plus"></i> Tambahkan Materi</button>

                <!-- Modal Form -->
                <div id="modalForm" class="modal">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>Tambahkan Materi</h2>

                        <form method="POST" action="" enctype="multipart/form-data">
                            <!-- Judul Materi -->
                            <div class="form-group">
                                <label for="judul">Judul Materi:</label>
                                <input type="text" id="judul" name="judul" required>
                            </div>

                            <!-- Materi (file input) -->
                            <div class="form-group">
                                <label for="materi">Materi (Video, Dokumen, PPT, dll):</label>
                                <input type="file" id="materi" name="materi" accept=".pdf,.doc,.docx,.ppt,.pptx,.mp4,.avi,.mov,.mkv" required>
                            </div>

                            <!-- Deskripsi Materi -->
                            <div class="form-group">
                                <label for="deskripsi">Deskripsi Materi:</label>
                                <textarea id="deskripsi" name="deskripsi" required></textarea>
                            </div>

                            <div class="form-group">
                                <button type="submit" name="kirim">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>


                <?php
                    include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

                    // Cek apakah form telah dikirim
                    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                        // Ambil data dari form
                        $judul = $_POST['judul'];
                        $deskripsi = $_POST['deskripsi'];

                        // Proses unggah file
                        if (isset($_FILES['materi']) && $_FILES['materi']['error'] === UPLOAD_ERR_OK) {
                            $fileTmpPath = $_FILES['materi']['tmp_name'];
                            $fileName = basename($_FILES['materi']['name']);
                            $uploadFolder = $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/components/pages/admin/uploads/';
                            $destPath = $uploadFolder . $fileName;

                            // Pindahkan file ke folder 'uploads'
                            if (move_uploaded_file($fileTmpPath, $destPath)) {
                                // Buat URL lengkap untuk file yang diunggah
                                $domain = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'];
                                $filePath = $domain . '/Aplikasi-Kewirausahaan/components/pages/admin/uploads/' . $fileName;

                                // Persiapkan dan eksekusi query menggunakan prepared statement untuk keamanan
                                $sql = "INSERT INTO materi_kewirausahaan (judul, deskripsi, file_path) VALUES (?, ?, ?)";
                                $stmt = $conn->prepare($sql);
                                
                                // Bind parameter
                                $stmt->bind_param("sss", $judul, $deskripsi, $filePath);

                                // Eksekusi query dan cek hasil
                                if ($stmt->execute()) {
                                    echo "<div class='alert alert-success'>Data berhasil disimpan!</div>";
                                } else {
                                    echo "<div class='alert alert-danger'>Gagal menyimpan data ke database.</div>";
                                }

                                // Tutup statement
                                $stmt->close();
                            } else {
                                echo "<div class='alert alert-danger'>Gagal mengunggah file.</div>";
                            }
                        } else {
                            echo "<div class='alert alert-danger'>File tidak valid atau tidak ada file yang diunggah.</div>";
                        }
                    }
                    ?>

                <script>
                            // Mengambil elemen-elemen yang diperlukan
                    var modal = document.getElementById("modalForm");
                    var openBtn = document.getElementById("openFormBtn");
                    var closeBtn = document.getElementsByClassName("close-btn")[0];

                    // Ketika tombol "Buka Form" diklik, tampilkan modal
                    openBtn.onclick = function() {
                        modal.style.display = "block";
                    }

                    // Ketika tombol close (x) diklik, sembunyikan modal
                    closeBtn.onclick = function() {
                        modal.style.display = "none";
                    }

                    // Ketika pengguna mengklik di luar modal, sembunyikan modal
                    window.onclick = function(event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }

                </script>
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