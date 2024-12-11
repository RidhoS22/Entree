<?php
// Menghubungkan ke database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mengambil data proposal bisnis dan ide bisnis dari tabel kelompok_bisnis
$query = "
    SELECT p.*, k.ide_bisnis
    FROM proposal_bisnis p
    LEFT JOIN kelompok_bisnis k ON p.kelompok_id = k.id_kelompok
";
$result = mysqli_query($conn, $query);
?>

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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/proposal_bisnis.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag@3.1.0/dist/css/multi-select-tag.css">
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

                        <form method="POST" action="proses_proposal.php" enctype="multipart/form-data" autocomplete="off">
                            <!-- Judul Proposal Bisnis -->
                            <div class="form-group">
                                <label for="judul_proposal">Judul Proposal Bisnis:<span style="color:red;">*</span></label>
                                <input type="text" id="judul_proposal" name="judul_proposal" required>
                            </div>

                            <!-- Dropdown Tahapan Bisnis -->
                            <div class="form-group">
                                <label for="tahapan_bisnis">Tahapan Bisnis:<span style="color:red;">*</span></label>
                                <select id="tahapan_bisnis" name="tahapan_bisnis" required>
                                    <option value="" style="color:darkgrey;" disabled selected>
                                        ~ Pilih Tahapan Bisnis ~
                                    </option>
                                    <option value="tahapan_awal">Tahapan Awal</option>
                                    <option value="tahapan_bertumbuh">Tahapan Bertumbuh</option>
                                </select>
                            </div>


                            <!-- SDG Bisnis -->
                            <div class="form-group">
                                <label for="sdg">SDG Bisnis:<span style="color:red;">*</span></label>
                                <select id="sdg" name="sdg[]" required multiple>
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
                                <option value="" style="color:darkgrey;" disabled selected>~ Pilih Kategori Bisnis Anda ~</option>
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
                            <div class="form-group mb-3">
                                <label for="proposal" class="form-label">Proposal Bisnis Kewirausahaan 
                                    <span style="color:red;">*</span>
                                    <small class="text-muted">(PDF only)</small>
                                </label>
                                <div class="input-group">
                                    <input type="file" class="form-control" id="proposal" name="proposal" accept=".pdf" required>
                                </div>
                            </div>


                            <div class="form-group">
                                <button type="submit">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Menampilkan proposal bisnis dalam bentuk card -->
                <div class="card-deck">
                    <?php
                    // Memeriksa apakah ada data proposal yang diambil dari database
                    if (mysqli_num_rows($result) > 0) {
                        while ($proposal = mysqli_fetch_assoc($result)) {
                            // Encode judul_proposal untuk URL
                            $judul_encoded = urlencode($proposal['judul_proposal']);
                            ?>
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title"><?php echo htmlspecialchars($proposal['judul_proposal']); ?></h5>
                                    <i class="fas fa-edit edit-icon" title="Edit Proposal Bisnis" onclick="window.location.href='edit_proposal.php?id=<?php echo $proposal['id']; ?>';"></i>
                                    </div>
                                <a href="detail_proposal_bisnis.php?judul=<?php echo urlencode($proposal['judul_proposal']); ?>">
                                    <div class="card-body">
                                        <!-- Ganti "Tahapan Bisnis" dengan "Ide Bisnis" -->
                                        <p><?php echo htmlspecialchars($proposal['ide_bisnis']); ?></p>
                                        <i class="fa-solid fa-eye detail-icon" title="Lihat Detail Proposal Bisnis"></i>
                                    </div>
                                </a>
                                <div class="card-footer">
                                    <a href="detail_proposal_bisnis.php?judul=<?php echo urlencode($proposal['judul_proposal']); ?>">Lihat Umpan Balik</a>
                                    <i class="fa-solid fa-trash-can delete-icon" title="Hapus Proposal Bisnis" onclick="window.location.href='delete_proposal.php?id=<?php echo $proposal['id']; ?>';"></i>
                                    </div>
                            </div>
                            <?php
                        }
                    } else {
                        echo "<p>Tidak ada proposal bisnis yang ditemukan.</p>";
                    }
                    ?>
                </div>

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

                <script src="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag@3.1.0/dist/js/multi-select-tag.js"></script>
                <script>
                    new MultiSelectTag('sdg', {
                    rounded: true,    // default true
                    placeholder: 'Search',  // default Search...
                    tagColor: {
                        textColor: '#327b2c',
                        borderColor: '#92e681',
                        bgColor: '#eaffe6',
                    },
                    onChange: function(values) {
                        console.log(values)
                    }
                })
                </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>

<?php
// Menutup koneksi database
mysqli_close($conn);
?>
