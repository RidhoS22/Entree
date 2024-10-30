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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/kelompok_bisnis_mahasiswa.css">
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
                <li class="sidebar-item active">
                    <a href="#" class="sidebar-link">
                        <i class="fa-solid fa-users"></i>
                        <span>Kelompok Bisnis</span>
                    </a>
                </li>
                <li class="sidebar-item">
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
                <h1>Kelompok Bisnis</h1>
                <a href="#" class="notification">
                    <i class="fa-regular fa-bell"></i>
                </a>
            </div>

            <div class="main_wrapper">
        
                <button id="openFormBtn"><i class="fa-solid fa-plus"></i> Tambahkan Kelompok Bisnis</button>

                <!-- Modal Form -->
                <div id="modalForm" class="modal">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>Pengajuan Kelompok Bisnis Kewirausahaan</h2>

                        <form method="POST" action="">
                            <!-- Nama Kelompok -->
                            <div class="form-group">
                                <label for="nama_kelompok">Nama Kelompok:</label>
                                <input type="text" id="nama_kelompok" name="nama_kelompok" required>
                            </div>

                            <!-- Dropdown untuk memilih jumlah anggota -->
                            <div class="form-group">
                                <label for="jumlah_anggota">Jumlah Anggota:</label>
                                <select id="jumlah_anggota" name="jumlah_anggota" required>
                                    <option value="0">Pilih Jumlah Anggota kelompok</option>
                                    <option value="1">1 Anggota</option>
                                    <option value="2">2 Anggota</option>
                                    <option value="3">3 Anggota</option>
                                    <option value="4">4 Anggota</option>
                                    <option value="5">5 Anggota</option>
                                </select>
                            </div>

                            <!-- Tempat untuk field nama anggota yang dinamis -->
                            <div id="anggota_fields"></div>

                            <!-- Nama Bisnis -->
                            <div class="form-group">
                                <label for="nama_bisnis">Nama Bisnis:</label>
                                <input type="text" id="nama_bisnis" name="nama_bisnis" required>
                            </div>

                            <!-- Ide Bisnis -->
                            <div class="form-group">
                                <label for="ide_bisnis">Ide Bisnis:</label>
                                <input type="text" id="ide_bisnis" name="ide_bisnis" required>
                            </div>

                            <!-- Deskripsi Bisnis Kelompok -->
                            <div class="form-group">
                                <label for="deskripsi">Deskripsi Singkat Bisnis Kelompok:</label>
                                <textarea id="deskripsi" name="deskripsi" required></textarea>
                            </div>

                            <!-- Logo Bisnis -->
                            <div class="form-group">
                                <label for="logo_bisnis">Logo Bisnis:</label>
                                <input type="file" id="logo_bisnis" name="logo_bisnis" accept=".pdf,.doc,.docx,.ppt,.pptx,.mp4,.avi,.mov,.mkv" required>
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

                    // Mengambil elemen dropdown dan container field anggota
                    var jumlahAnggota = document.getElementById("jumlah_anggota");
                    var anggotaFieldsContainer = document.getElementById("anggota_fields");

                    // Fungsi untuk menampilkan field anggota sesuai dengan jumlah yang dipilih
                    jumlahAnggota.onchange = function() {
                        // Menghapus field anggota yang ada sebelumnya
                        anggotaFieldsContainer.innerHTML = "";

                        // Menambahkan field baru sesuai dengan jumlah yang dipilih
                        for (var i = 1; i <= jumlahAnggota.value; i++) {
                            var formGroup = document.createElement("div");
                            formGroup.className = "form-group";
                            
                            var label = document.createElement("label");
                            label.for = "nama_anggota_" + i;
                            label.textContent = "Nama Anggota " + i + ":";

                            var input = document.createElement("input");
                            input.type = "text";
                            input.id = "nama_anggota_" + i;
                            input.name = "nama_anggota_" + i;
                            input.required = true;

                            formGroup.appendChild(label);
                            formGroup.appendChild(input);
                            anggotaFieldsContainer.appendChild(formGroup);
                        }
                    };
            
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