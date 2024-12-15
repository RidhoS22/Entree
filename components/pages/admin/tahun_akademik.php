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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/admin/tahun_akademik.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'tahun_akademik'; // Halaman ini aktif
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">

            <div class="main_header">
                <?php 
                    $pageTitle = "Tahun Akademik"; // Judul halaman
                    include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">

                <!-- Tombol untuk Membuka Modal -->
                <button type="button" class="btn-tambah" data-bs-toggle="modal" data-bs-target="#tahunAkademikModal">
                    Tambah Tahun Akademik
                </button>

               <!-- Modal -->
                <div class="modal fade" id="tahunAkademikModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalTitle">Tambah Tahun Akademik</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <!-- Modal Body -->
                            <div class="modal-body">
                                <!-- Dropdown Tahun -->
                                <div class="mb-3">
                                    <label for="tahunDropdown" class="form-label">Pilih Tahun:</label>
                                    <select class="form-select" id="tahunDropdown" onchange="filterJenisTahun()">
                                        <option value="" disabled selected>Pilih Tahun</option>
                                        <?php
                                        // Mengisi dropdown tahun dengan PHP
                                        $currentYear = date('Y');
                                        for ($i = 2010; $i <= $currentYear; $i++) {
                                            echo "<option value='$i'>$i</option>";
                                        }
                                        ?>
                                    </select>
                                </div>

                                <!-- Radio Button Jenis Tahun -->
                                <div class="mb-3" id="jenisTahunSection" style="display: none;">
                                    <label class="form-label">Pilih Jenis Tahun:</label>
                                    <div>
                                        <input type="radio" name="jenisTahun" id="ganjil" value="ganjil" onclick="tampilkanHasil()">
                                        <label for="ganjil">Ganjil</label>
                                        <input type="radio" name="jenisTahun" id="genap" value="genap" onclick="tampilkanHasil()">
                                        <label for="genap">Genap</label>
                                    </div>
                                </div>

                                <!-- Hasil Filter Tahun Akademik -->
                                <div id="hasilTahun" class="mt-3"></div>
                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success" onclick="simpanTahun()">Simpan</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <!-- Heading untuk daftar file -->
                    <h5 id="fileHeading">Daftar Tahun Akademik</h5>

                    <!-- Daftar file -->
                    <ul id="fileList">
                        <li>
                            <div class="file-info">
                                2024/2025 - Ganjil 
                                <span>(Aktif)</span>
                            </div>
                            <div class="icon-group">
                                <i class="fa-solid fa-trash-can"></i>
                            </div>
                        </li>
                        <li>
                            <div class="file-info">
                                2024/2025 - Genap 
                                <span></span>
                            </div>
                            <div class="icon-group">
                                <i class="fa-solid fa-trash-can"></i>
                            </div>
                        </li>
                    </ul>
                </div>
                
            </div>
        </div>

    </div>
    <!-- JavaScript -->
    <script>
        let tahunTerpilih = ''; // Variabel untuk menyimpan tahun yang dipilih

        // Fungsi saat Dropdown Tahun berubah
        function filterJenisTahun() {
            tahunTerpilih = document.getElementById('tahunDropdown').value;
            document.getElementById('jenisTahunSection').style.display = 'block';
            document.getElementById('hasilTahun').innerHTML = ''; // Reset hasil
        }

        // Fungsi untuk menampilkan hasil berdasarkan jenis tahun
        function tampilkanHasil() {
            const jenisTahun = document.querySelector('input[name="jenisTahun"]:checked').value;

            if (tahunTerpilih) {
                const tahunBerikutnya = parseInt(tahunTerpilih) + 1; // Hitung tahun berikutnya
                let tahunAkademik = `${tahunTerpilih}/${tahunBerikutnya} - ${jenisTahun.charAt(0).toUpperCase() + jenisTahun.slice(1)}`;

                // Tampilkan hasil tahun akademik
                document.getElementById('hasilTahun').innerHTML = `
                    <div class="alert alert-info">
                        Tahun Akademik: <strong>${tahunAkademik}</strong>
                    </div>
                `;
            }
        }

        // Fungsi untuk menyimpan pilihan
        function simpanTahun() {
            const hasil = document.getElementById('hasilTahun').innerText;
            if (hasil) {
                alert("Pilihan Anda: " + hasil.replace("Tahun Akademik: ", "").trim());
                // Anda juga bisa menambahkan logika penyimpanan ke database di sini
            } else {
                alert("Harap pilih tahun dan jenis tahun terlebih dahulu!");
            }
        }

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>