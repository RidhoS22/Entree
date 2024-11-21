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

                            <!-- Dropdown Tahapan Bisnis -->
                            <div class="form-group">
                                <label for="tahapan_bisnis">Tahapan Bisnis:<span style="color:red;">*</span></label>
                                <select id="tahapan_bisnis" name="tahapan_bisnis" required>
                                    <option value="" style="color:darkgrey;">
                                        ~ Pilih Tahapan Bisnis ~
                                    </option>
                                    <option value="tahapan_awal">Tahapan Awal</option>
                                    <option value="tahapan_bertumbuh">Tahapan Bertumbuh</option>
                                </select>
                            </div>


                            <!-- SDG Bisnis -->
                            <div class="form-group">
                                <label for="sdg">SDG Bisnis:<span style="color:red;">*</span></label>
                                <select id="sdg" name="sdg" required>
                                    <option value="" style="color:darkgrey;">
                                        ~ Pilih SDGs Bisnis ~
                                    </option>
                                    <option value="mengakhiri_kemiskinan">1. Mengakhiri Kemiskinan</option>
                                    <option value="mengakhiri_kelaparan">2. Mengakhiri Kelaparan</option>
                                    <option value="kesehatan_kesejahteraan">3. Kesehatan dan Kesejahteraan</option>
                                    <option value="pendidikan_berkualitas">4. Pendidikan Berkualitas</option>
                                    <option value="kesetaraan_gender">5. Kesetaraan Gender</option>
                                    <option value="air_bersih_sanitasi">6. Air Bersih dan Sanitasi</option>
                                    <option value="energi_bersih_terjangkau">7. Energi Bersih dan Terjangkau</option>
                                    <option value="pekerjaan_pertumbuhan_ekonomi">8. Pekerjaan Layak dan Pertumbuhan Ekonomi</option>
                                    <option value="industri_inovasi_infrastruktur">9. Industri, Inovasi, dan Infrastruktur</option>
                                    <option value="mengurangi_ketimpangan">10. Mengurangi Ketimpangan</option>
                                    <option value="kota_komunitas_berkelanjutan">11. Kota dan Komunitas Berkelanjutan</option>
                                    <option value="konsumsi_produksi_bertanggung_jawab">12. Konsumsi dan Produksi yang Bertanggung Jawab</option>
                                    <option value="penanganan_perubahan_iklim">13. Penanganan Perubahan Iklim</option>
                                    <option value="ekosistem_lautan">14. Ekosistem Lautan</option>
                                    <option value="ekosistem_daratan">15. Ekosistem Daratan</option>
                                    <option value="perdamaian_keadilan_institusi_kuat">16. Perdamaian, Keadilan, dan Kelembagaan yang Kuat</option>
                                    <option value="kemitraan_tujuan">17. Kemitraan untuk Mencapai Tujuan</option>
                                </select>
                            </div>


                            <!-- Kategori Bisnis -->
                            <div class="form-group">
                            <label for="kategori">Kategori Bisnis:<span style="color:red;">*</span></label>
                            <select id="kategori" name="kategori" class="form-control" required onchange="toggleOtherCategoryInput()">
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
                                <option value="lainnya">Lainnya</option>
                            </select>

                            <!-- Input untuk "Lainnya" -->
                            <div id="other-category-container" style="display: none; margin-top: 10px;">
                                <label for="other-category">Masukkan Kategori Bisnis Anda:</label>
                                <input 
                                type="text" 
                                id="other-category" 
                                name="other_category" 
                                class="form-control" 
                                placeholder="Tulis kategori Anda di sini..."
                                />
                            </div>
                            </div>

                            <script>
                            function toggleOtherCategoryInput() {
                                const dropdown = document.getElementById('kategori');
                                const otherCategoryContainer = document.getElementById('other-category-container');
                                
                                // Tampilkan input "Lainnya" jika opsi "Lainnya" dipilih
                                if (dropdown.value === 'lainnya') {
                                otherCategoryContainer.style.display = 'block';
                                } else {
                                otherCategoryContainer.style.display = 'none';
                                }
                            }
                            </script>


                            <!-- Proposal (file input) -->
                            <div class="form-group">
                                <label for="proposal">Proposal bisnis kewirausahaan (pdf only):<span style="color:red;">*</span></label>
                                </label>
                                <input type="file" id="proposal" name="proposal" accept=".pdf" required>
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
                            <h2>Proposal Bisnis kelompok ArTech</h2>
                            <i class="fas fa-edit edit-icon"></i>
                        </div>
                        <div class="card-body">
                            Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story.
                        </div>
                        <div class="card-footer">
                            <a href="detail_proposal_bisnis.php">View Feedback</a>
                            <i class="fa-solid fa-trash-can delete-icon"></i> 
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