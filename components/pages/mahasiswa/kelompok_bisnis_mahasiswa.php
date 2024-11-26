<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

$npm_ketua = $_SESSION['npm']; // NPM ketua yang sedang login

$cekKelompokQuery = "SELECT * FROM kelompok_bisnis WHERE npm_ketua = '$npm_ketua' LIMIT 1";
$cekKelompokResult = mysqli_query($conn, $cekKelompokQuery);
$kelompokTerdaftar = mysqli_fetch_assoc($cekKelompokResult);

if ($kelompokTerdaftar) {
    header("Location: detail_kelompok_bisnis.php?id=" . $kelompokTerdaftar['id_kelompok']);
    exit();
}

$cekAnggotaQuery = "SELECT * FROM anggota_kelompok WHERE npm_anggota = '$npm_ketua' LIMIT 1";
$cekAnggotaResult = mysqli_query($conn, $cekAnggotaQuery);
$anggotaTerdaftar = mysqli_fetch_assoc($cekAnggotaResult);

if ($anggotaTerdaftar) {
    $kelompokID = $anggotaTerdaftar['id_kelompok'];
    header("Location: detail_kelompok_bisnis.php?id=" . $kelompokID);
    exit();
}

// Query untuk mengambil NPM ketua yang sudah terdaftar di tabel kelompok_bisnis
$cekKetuaKelompokQuery = "SELECT npm_ketua FROM kelompok_bisnis";
$cekKetuaKelompokResult = mysqli_query($conn, $cekKetuaKelompokQuery);

$npmKetuaTerdaftar = [];
while ($row = mysqli_fetch_assoc($cekKetuaKelompokResult)) {
    $npmKetuaTerdaftar[] = $row['npm_ketua'];
}

// Menambahkan ketua yang sedang login ke dalam daftar (ketua yang login tidak bisa menjadi anggota kelompok baru)
$npmKetuaTerdaftar[] = $npm_ketua;

// Query untuk mengambil NPM anggota yang sudah ada di kelompok lain
$cekAnggotaDiKelompokQuery = "SELECT npm_anggota FROM anggota_kelompok";
$cekAnggotaDiKelompokResult = mysqli_query($conn, $cekAnggotaDiKelompokQuery);

$npmAnggotaDiKelompok = [];
while ($row = mysqli_fetch_assoc($cekAnggotaDiKelompokResult)) {
    $npmAnggotaDiKelompok[] = $row['npm_anggota'];
}

// Gabungkan NPM ketua dan anggota yang sudah ada dalam kelompok lain
$npmAnggotaDiKelompok = array_merge($npmAnggotaDiKelompok, $npmKetuaTerdaftar);

// Query untuk menampilkan mahasiswa yang belum ada dalam kelompok dan sudah memiliki email dan nomor telepon
$query = "SELECT npm, nama, email, contact FROM mahasiswa WHERE npm NOT IN ('" . implode("','", $npmAnggotaDiKelompok) . "') AND email IS NOT NULL AND contact IS NOT NULL";
$result = mysqli_query($conn, $query);

$mahasiswaList = [];
while ($row = mysqli_fetch_assoc($result)) {
    if ($row['email'] && $row['contact']) {  // Pastikan email dan nomor telepon tidak kosong
        $mahasiswaList[] = $row;
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
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/kelompok_bisnis_mahasiswa.css">
</head>
<body>
    <div class="wrapper">
        <?php include 'sidebar_mahasiswa.php'; ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Kelompok Bisnis";
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <button id="openFormBtn"><i class="fa-solid fa-plus"></i> Tambahkan Kelompok Bisnis</button>

                <div id="modalForm" class="modal">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>Pengajuan Kelompok Bisnis Kewirausahaan</h2>

                        <!-- Form dengan autocomplete="off" -->
                        <form method="POST" action="proses_kelompok_bisnis.php" enctype="multipart/form-data" autocomplete="off">
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
                                <label for="logo_bisnis">Logo Bisnis:</label>
                                <input type="file" id="logo_bisnis" name="logo_bisnis" accept=".png, .jpg" required>
                                <div id="logo_preview" class="mt-2"></div>
                            </div>

                            <div class="form-group">
                                <button type="submit">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>
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
                label.for = "npm_anggota_" + i;
                label.textContent = "NPM Anggota " + i + ":";

                var input = document.createElement("input");
                input.type = "text";
                input.id = "npm_anggota_" + i;
                input.name = "npm_anggota_" + i;
                input.placeholder = "Ketik NPM Anggota " + i;
                input.required = true;
                input.setAttribute("autocomplete", "off");

                // Tambahkan event listener untuk pencarian anggota
                input.addEventListener('input', function() {
                    var npmField = this;
                    var value = npmField.value.toLowerCase();
                    var selectedNPMs = Array.from(anggotaFieldsContainer.querySelectorAll("input"))
                        .map(function(input) { return input.value.split(" - ")[0].toLowerCase(); });

                    var matchingMembers = <?php echo json_encode($mahasiswaList); ?>.filter(function(mahasiswa) {
                        return mahasiswa.npm.toLowerCase().includes(value) && !selectedNPMs.includes(mahasiswa.npm.toLowerCase());
                    });

                    var datalist = document.getElementById(npmField.id + "-datalist");
                    if (!datalist) {
                        datalist = document.createElement("datalist");
                        datalist.id = npmField.id + "-datalist";
                        npmField.setAttribute("list", datalist.id);
                        npmField.parentNode.appendChild(datalist);
                    }

                    datalist.innerHTML = ""; // Clear previous options
                    matchingMembers.forEach(function(mahasiswa) {
                        var option = document.createElement("option");
                        option.value = mahasiswa.npm + " - " + mahasiswa.nama;
                        datalist.appendChild(option);
                    });
                });

                formGroup.appendChild(label);
                formGroup.appendChild(input);
                anggotaFieldsContainer.appendChild(formGroup);
            }
        }
        
        // Validasi sebelum form disubmit
        document.querySelector('form').addEventListener('submit', function(event) {
            var invalidNPMs = [];
            anggotaFieldsContainer.querySelectorAll("input").forEach(function(input) {
                var selectedNPM = input.value.split(" - ")[0];  // Get only NPM from the value
                if (!isNPMValid(selectedNPM)) {  // Check if the NPM is valid
                    invalidNPMs.push(input.value);
                }
            });

            if (invalidNPMs.length > 0) {
                event.preventDefault();  // Prevent form submission
                alert("NPM berikut sudah terdaftar dalam kelompok lain atau tidak valid: " + invalidNPMs.join(", "));
            }
        });

        // Function to check if NPM is valid
        function isNPMValid(npm) {
            var valid = <?php echo json_encode($mahasiswaList); ?>.some(function(mahasiswa) {
                return mahasiswa.npm === npm;
            });
            return valid;
        }
    </script>
</body>
</html>
