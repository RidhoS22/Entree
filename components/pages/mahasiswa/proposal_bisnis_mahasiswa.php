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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/proposal_bisnis_mahasiswa.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'proposal_bisnis_mahasiswa'; // Halaman ini aktif
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Proposal Bisnis Kewirausahaan"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
        
                <button id="openFormBtn"><i class="fa-solid fa-plus"></i> Tambahkan Proposal Bisnis</button>

                <!-- Modal Form -->
                <div id="modalForm" class="modal">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>Pengajuan Proposal Bisnis Kewirausahaan</h2>

                        <form method="POST" action="">
                            <!-- Judul Proposal Bisnis -->
                            <div class="form-group">
                                <label for="judul_proposal">Judul Proposal Bisnis:<span style="color:red;">*</span></label>
                                <input type="text" id="judul_proposal" name="judul_proposal" required>
                            </div>

                            <!-- SDG Bisnis -->
                            <div class="form-group">
                                <label for="sdg">SDG Bisnis:<span style="color:red;">*</span></label>
                                <select id="sdg" name="sdg" required>
                                    <option value="" style="color:darkgrey;">
                                        ~ Pilih SDG Bisnis Anda ~
                                    </option>
                                    <option value="mengakhiri_kemiskinan">Mengakhiri Kemiskinan</option>
                                    <option value="mengakhiri_kelaparan">Mengakhiri Kelaparan</option>
                                    <option value="kesehatan_kesejahteraan">Kesehatan dan Kesejahteraan</option>
                                    <option value="pendidikan_berkualitas">Pendidikan Berkualitas</option>
                                    <option value="kesetaraan_gender">Kesetaraan Gender</option>
                                    <option value="air_bersih_sanitasi">Air Bersih dan Sanitasi</option>
                                    <option value="energi_bersih_terjangkau">Energi Bersih dan Terjangkau</option>
                                    <option value="pekerjaan_pertumbuhan_ekonomi">Pekerjaan Layak dan Pertumbuhan Ekonomi</option>
                                    <option value="industri_inovasi_infrastruktur">Industri, Inovasi, dan Infrastruktur</option>
                                    <option value="mengurangi_ketimpangan">Mengurangi Ketimpangan</option>
                                    <option value="kota_komunitas_berkelanjutan">Kota dan Komunitas Berkelanjutan</option>
                                    <option value="konsumsi_produksi_bertanggung_jawab">Konsumsi dan Produksi yang Bertanggung Jawab</option>
                                    <option value="penanganan_perubahan_iklim">Penanganan Perubahan Iklim</option>
                                    <option value="ekosistem_lautan">Ekosistem Lautan</option>
                                    <option value="ekosistem_daratan">Ekosistem Daratan</option>
                                    <option value="perdamaian_keadilan_institusi_kuat">Perdamaian, Keadilan, dan Kelembagaan yang Kuat</option>
                                    <option value="kemitraan_tujuan">Kemitraan untuk Mencapai Tujuan</option>
                                </select>
                            </div>


                            <!-- Kategori Bisnis -->
                            <div class="form-group">
                                <label for="kategori">Kategori Bisnis:<span style="color:red;">*</span></label>
                                <select id="kategori" name="kategori" required>
                                    <option value="" style="color:darkgrey;">~ Pilih Kategori Bisnis Anda ~</option>
                                    <option value="jasa">Bisnis Jasa</option>
                                    <option value="manufaktur">Bisnis Manufaktur</option>
                                    <option value="perdagangan">Bisnis Dagang (Perdagangan)</option>
                                    <option value="agrikultur">Bisnis Agrikultur dan Perkebunan</option>
                                    <option value="kreatif">Bisnis Kreatif dan Industri Kreatif</option>
                                    <option value="teknologi">Bisnis Teknologi atau Digital</option>
                                    <option value="energi">Bisnis Energi dan Lingkungan</option>
                                    <option value="konstruksi">Bisnis Konstruksi dan Real Estate</option>
                                    <option value="pariwisata">Bisnis Pariwisata dan Perhotelan</option>
                                    <option value="finansial">Bisnis Finansial</option>
                                </select>
                            </div>



                            <!-- Proposal (file input) -->
                            <div class="form-group">
                                <label for="proposal">Proposal bisnis kewirausahaan (pdf only):<span style="color:red;">*</span></label>
                                </label>
                                <input type="file" id="proposal" name="proposal" accept=".pdf" required>
                            </div>

                            <!-- Deskripsi Proposal Bisnis Kelompok -->
                            <div class="form-group">
                                <label for="deskripsi">Deskripsi Proposal Bisnis Kelompok:<span style="color:red;">*</span></label>
                                <textarea id="deskripsi" name="deskripsi" required></textarea>
                            </div>

                            <div class="form-group">
                                <button type="submit">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <a href="detail_proposal_bisnis.php">
                        <div class="card-header">
                            <h2>Proposal Bisnis Kelompok ArTech</h2>
                            <i class="fas fa-edit edit-icon"></i>
                        </div>
                        <div class="card-body">
                            Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story. lorem120
                        </div>
                        <div class="card-footer">
                            <a href="detail_proposal_bisnis.php">View Feedback</a>
                        </div>
                    </a>
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