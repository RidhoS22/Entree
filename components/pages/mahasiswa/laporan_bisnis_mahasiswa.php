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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/laporan_bisnis_mahasiswa.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'laporan_bisnis_mahasiswa'; // Halaman ini aktif
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Laporan Kemajuan Bisnis Kelompok"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
        
                <button id="openFormBtn"><i class="fa-solid fa-plus"></i>Tambahkan Laporan Kemajuan Bisnis</button>

                <!-- Modal Form -->
                <div id="modalForm" class="modal">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>Laporan Kemajuan Pengembangan Usaha</h2>

                        <form method="POST" action="">
                            <!-- Laporan Kemajuan Pengembangan Usaha -->
                            <div class="form-group">
                                <label for="judul_laporan">Judul Laporan:<span style="color:red;">*</span></label>
                                <input type="text" id="judul_laporan" name="judul_laporan" required>
                            </div>

                            

                            <!-- Laporan Penjualan Usaha -->
                            <div class="form-group">
                                <label for="laporan_penjualan">Laporan Penjualan:</label>
                                <textarea id="laporan_penjualan" name="laporan_penjualan" ></textarea>
                            </div>

                            <!-- Laporan Pemasaran Usaha -->
                            <div class="form-group">
                                <label for="laporan_pemasaran">Laporan Pemasaran:</label>
                                <textarea id="laporan_pemasaran" name="laporan_pemasaran" ></textarea>
                            </div>

                            <!-- Laporan Produksi Usaha -->
                            <div class="form-group">
                                <label for="laporan_produksi">Laporan Produksi:</label>
                                <textarea id="laporan_produksi" name="laporan_produksi" ></textarea>
                            </div>

                            <!-- Laporan Sdm Usaha -->
                            <div class="form-group">
                                <label for="laporan_sdm">Laporan Sdm:</label>
                                <textarea id="laporan_sdm" name="laporan_sdm" ></textarea>
                            </div>

                             <!-- Laporan Keuangan -->
                             <div class="form-group">
                                <label for="laporan_keuangan">Laporan Keuangan:</label>
                                <textarea id="laporan_keuangan" name="laporan_keuangan" ></textarea>
                            </div>


                            <!-- Lampiran (file input) -->
                            <div class="form-group">
                            <label for="lampiran_laporan">Lampiran (dokumentasi kegiatan secara PDF):</label>
                            <input 
                                type="file" 
                                id="lampiran_laporan" 
                                name="lampiran_laporan[]" 
                                accept=".pdf" 
                                multiple 
                            />
                            </div>


                            <div class="form-group">
                                <button type="submit">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h2>Laporan Bisnis</h2>
                        <i class="fas fa-edit edit-icon"></i>
                    </div>
                    <a href="detail_laporan_bisnis.php">
                        <div class="card-body">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente at quidem commodi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Perferendis suscipit dolores sunt molestias. Iusto dignissimos doloremque tempore architecto fuga vero quibusdam molestias quis pariatur impedit, odit delectus explicabo magni vitae quam! Quam aliquam voluptas voluptatem minima aspernatur provident amet atque eligendi eveniet veritatis, ullam eaque iste perspiciatis impedit ex. Reprehenderit aperiam, quod atque voluptas unde facilis mollitia corporis expedita aspernatur asperiores et molestias soluta accusantium repellendus neque itaque consequuntur voluptates laboriosam, minima vitae laborum illum perferendis possimus? Blanditiis provident nihil magni iure nostrum perspiciatis omnis, corrupti ipsa assumenda quisquam maiores esse aliquid quis tenetur veritatis beatae est libero earum nulla! Illum, officia quidem, vel eaque deleniti mollitia voluptate rerum earum nemo quas ex provident doloremque, quis alias fugiat saepe commodi culpa ullam nostrum minus iure. Unde in nostrum optio voluptatibus nemo delectus sed dolore consectetur odit excepturi ab aspernatur rem, tempore iusto et veniam. Hic soluta debitis totam, modi quae doloribus sapiente voluptatem. Possimus voluptatum adipisci, earum corporis consequatur laborum aut illo necessitatibus ducimus quis laboriosam eveniet magni animi neque iste eum facilis tempora sunt? Iste veniam maxime cumque a, eum ab! Enim architecto in repellat modi perferendis et qui, quam, sed maiores veritatis praesentium cupiditate impedit cum accusantium ad dignissimos sapiente. Reprehenderit placeat dicta non nesciunt iusto ad veniam ab laudantium sit ratione. Enim nobis porro repudiandae deserunt totam minima in harum fuga assumenda, consequuntur deleniti velit repellendus ipsa error voluptate cum.</p>
                        <i class="fa-solid fa-eye detail-icon"></i>
                    </div>
                    </a>
                    <div class="card-footer">
                        <a href="detail_laporan_bisnis.php">View Feedback</a>
                        <i class="fa-solid fa-trash-can delete-icon"></i> 
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