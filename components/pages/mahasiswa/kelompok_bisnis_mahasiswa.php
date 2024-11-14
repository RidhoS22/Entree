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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/kelompok_bisnis_mahasiswa.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'kelompok_bisnis_mahasiswa';
        include 'sidebar_mahasiswa.php'; 
        ?>

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
                            <div class="form-group">
                                <label for="nama_kelompok">Nama Kelompok:</label>
                                <input type="text" id="nama_kelompok" name="nama_kelompok" required>
                            </div>

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

                            <div id="anggota_fields"></div>

                            <div class="form-group">
                                <label for="nama_bisnis">Nama Bisnis:</label>
                                <input type="text" id="nama_bisnis" name="nama_bisnis" required>
                            </div>

                            <div class="form-group">
                                <label for="ide_bisnis">Ide Bisnis:</label>
                                <input type="text" id="ide_bisnis" name="ide_bisnis" required>
                            </div>

                            <div class="form-group">
                                <label for="deskripsi">Deskripsi Singkat Bisnis Kelompok:</label>
                                <textarea id="deskripsi" name="deskripsi" required></textarea>
                            </div>

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

                <div class="container">
                    <div class="left">
                        <img alt="Logo of Fish Corporation with a stylized fish graphic" height="400" width="400" src="https://storage.googleapis.com/a1aa/image/KTfOztGxYpSnK6SKheWu6Z3KLGKEoMaCPLrNGyZpwBeqR5hnA.jpg"/>
                    </div>

                    <div class="right">
                    <div class="right">
                        <div class="title-edit">
                            <h1>Nama Bisnis</h1>
                            <button class="edit-btn" type="button">
                                <i class="fas fa-edit"></i>
                            </button>
                        </div>
                        <p>Deskripsi Bisnis lorem123</p>
                        
                        
                        <div class="category">
                            <p><strong>Kategori Bisnis:</strong> StartUp</p>
                        </div>
                        <div class="sdg">
                            <p><strong>Sustainable Development Goals (SDGs):</strong></p>
                            <p>Pendidikan Berkualitas</p>
                        </div>

                        <div class="bottom">
                        <div class="members">
                            <p><strong>Anggota kelompok Artech:</strong></p>
                            <p>1. Asril 1402022000</p>
                            <p>2. Ridho 1402022000</p>
                            <p>3. Fadly 1402022000</p>
                        </div>

                        <div class="tutor">
                            <p><strong>Dosen Tutor Artech:</strong></p>
                            <p>1. Bapak Suhaeri</p>
                        </div>
                    </div>
                    </div>

                    
                </div>

                <?php ?>
            </div>
        </div>
    </div>

    <script>
        var modal = document.getElementById("modalForm");
        var openBtn = document.getElementById("openFormBtn");
        var closeBtn = document.getElementsByClassName("close-btn")[0];

        openBtn.onclick = function() {
            modal.style.display = "block";
        }

        closeBtn.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        var jumlahAnggota = document.getElementById("jumlah_anggota");
        var anggotaFieldsContainer = document.getElementById("anggota_fields");

        jumlahAnggota.onchange = function() {
            anggotaFieldsContainer.innerHTML = "";
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>
```