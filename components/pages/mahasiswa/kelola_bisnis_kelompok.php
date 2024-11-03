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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/kelola_bisnis_kelompok.css">
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
                <li class="sidebar-item">
                    <a href="pagemahasiswa.php" class="sidebar-link">
                        <i class="fa-solid fa-house"></i>
                        <span>Beranda</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="materikewirausahaan_mahasiswa.php" class="sidebar-link">
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
                <hr>
                <li class="sidebar-header">
                    <h1>Mahasiswa</h1>
                </li>
                <li class="sidebar-item">
                    <a href="kelompok_bisnis_mahasiswa.php" class="sidebar-link">
                        <i class="fa-solid fa-users"></i>
                        <span>Kelompok Bisnis</span>
                    </a>
                </li>
                <li class="sidebar-item active">
                    <a href="kelola_bisnis_kelompok.php" class="sidebar-link">
                        <i class="fa-solid fa-file"></i>
                        <span>Kelola Bisnis Kelompok</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link">
                        <i class="fa-solid fa-calendar"></i>
                        <span>Jadwal Mentoring</span>
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
                <h1>Kelola Bisnis Kelompok</h1>
                <a href="#" class="notification">
                    <i class="fa-regular fa-bell"></i>
                </a>
            </div>

            <div class="main_wrapper">
        
                <button id="openFormBtn"><i class="fa-solid fa-plus"></i> Tambahkan Proposal Bisnis</button>
                <button id="openFormBtn2"><i class="fa-solid fa-plus"></i> Tambahkan Laporan Progres</button>

                <!-- Modal Form -->
                <div id="modalForm" class="modal">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>Pengajuan Proposal Bisnis Kewirausahaan</h2>

                        <form method="POST" action="">
                            <!-- Judul Proposal Bisnis -->
                            <div class="form-group">
                                <label for="judul_proposal">Judul Proposal Bisnis:</label>
                                <input type="text" id="judul_proposal" name="judul_proposal" required>
                            </div>

                            <!-- Proposal (file input) -->
                            <div class="form-group">
                                <label for="proposal">Proposal Bisnis Kewirausahaan:</label>
                                <input type="file" id="proposal" name="proposal" accept=".pdf,.doc,.docx,.ppt,.pptx,.mp4,.avi,.mov,.mkv" required>
                            </div>

                            <!-- Deskripsi Proposal Bisnis Kelompok -->
                            <div class="form-group">
                                <label for="deskripsi">Deskripsi Singkat Proposal Bisnis Kelompok:</label>
                                <textarea id="deskripsi" name="deskripsi" required></textarea>
                            </div>

                            <div class="form-group">
                                <button type="submit">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal Form 2-->
                <div id="modalForm2" class="modal">
                    <div class="modal-content">
                        <span class="close-btn2">&times;</span>
                        <h2>Laporan Kemajuan Pengembangan Usaha</h2>

                        <form method="POST" action="">
                            <!-- Laporan Kemajuan Pengembangan Usaha -->
                            <div class="form-group">
                                <label for="judul_laporan">Judul Laporan:</label>
                                <input type="text" id="judul_laporan" name="judul_laporan" required>
                            </div>

                            <!-- Laporan (file input) -->
                            <div class="form-group">
                                <label for="laporan">Laporan Pengembangan Usaha:</label>
                                <input type="file" id="laporan" name="laporan" accept=".pdf,.doc,.docx,.ppt,.pptx,.mp4,.avi,.mov,.mkv" required>
                            </div>

                            <!-- Deskripsi Laporan Pengembangan Usaha -->
                            <div class="form-group">
                                <label for="deskripsi_laporan">Deskripsi Laporan Pengembangan Usaha:</label>
                                <textarea id="deskripsi_laporan" name="deskripsi_laporan" required></textarea>
                            </div>

                            <div class="form-group">
                                <button type="submit">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>


                 <!-- PHP untuk menangani pengiriman form -->
                 <?php?>


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

                    // open form button 2

                     // Mengambil elemen-elemen yang diperlukan
                    var modal2 = document.getElementById("modalForm2");
                    var openBtn2 = document.getElementById("openFormBtn2");
                    var closeBtn2 = document.getElementsByClassName("close-btn2")[0];

                    // Ketika tombol "Buka Form" diklik, tampilkan modal
                    openBtn2.onclick = function() {
                        modal2.style.display = "block";
                    }

                    // Ketika tombol close (x) diklik, sembunyikan modal
                    closeBtn2.onclick = function() {
                        modal2.style.display = "none";
                    }

                    // Ketika pengguna mengklik di luar modal, sembunyikan modal
                    window.onclick = function(event) {
                        if (event.target == modal2) {
                            modal2.style.display = "none";
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