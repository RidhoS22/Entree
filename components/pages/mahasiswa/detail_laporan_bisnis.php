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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_laporan_bisnis.css">
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <?php 
            $activePage = 'laporan_bisnis_mahasiswa'; // Halaman ini aktif
            include 'sidebar_mahasiswa.php'; 
        ?>

        <!-- Main Content -->
        <div class="main p-3">
            <!-- Header -->
            <?php 
                $pageTitle = "Detail Laporan Kemajuan Bisnis"; // Judul halaman
                include 'header_mahasiswa.php'; 
            ?>

            <!-- Content Wrapper -->
            <div class="main_wrapper">
                <h2>Judul Laporan</h2>

                <p>Laporan Penjualan:</p>
                <div class="file-box">
                    <p>Laporan Penjualan</p>
                </div>

                <p>Laporan Pemasaran:</p>
                <div class="file-box">
                    <p>Laporan Pemasaran</p>
                </div>

                <p>Laporan Produksi:</p>
                <div class="file-box">
                    <p>Laporan Produksi</p>
                </div>

                <p>Laporan SDM:</p>
                <div class="file-box">
                    <p>Laporan SDM Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestias, mollitia. Nesciunt eaque delectus tempora id temporibus, odit ut consectetur necessitatibus laboriosam assumenda vitae quos dolores cumque dolor ipsam, rerum quod hic culpa tempore earum? Ratione provident magni adipisci possimus molestiae quidem aliquid veritatis at natus, neque atque facilis ad tempora cupiditate vel minus? Distinctio magni ad expedita ullam possimus laboriosam tempora alias porro consequuntur quo non, necessitatibus temporibus dolores accusantium dignissimos architecto libero ex aliquam vitae eius corrupti sunt enim, tenetur delectus? Praesentium non perspiciatis quae necessitatibus. Accusamus numquam minus nostrum. Cupiditate quam vero praesentium eveniet, culpa obcaecati quo ut aliquid optio, doloremque, ullam est qui nihil a! Repellat dolore, eaque, deserunt ducimus tenetur maxime rem facilis hic nemo illum, illo tempore! Nesciunt?</p>
                </div>

                <div>
                    <!-- Heading untuk daftar file -->
                    <h3 id="fileHeading">Daftar Lampiran</h3>

                    <!-- Daftar file -->
                    <ul id="fileList">
                    <li>
                        <div class="file-info">
                        Lampiran 1 - Laporan Keuangan 
                        <span>(PDF, 2MB)</span>
                        </div>
                        <div class="icon-group">
                        <i class="fa-solid fa-eye detail-icon"></i>
                        <i class="fa-solid fa-download btn-icon"></i>
                        </div>
                    </li>
                    <li>
                        <div class="file-info">
                        Lampiran 2 - Laporan Penjualan 
                        <span>(Excel, 1MB)</span>
                        </div>
                        <div class="icon-group">
                        <i class="fa-solid fa-eye detail-icon"></i>
                        <i class="fa-solid fa-download btn-icon"></i>
                        </div>
                    </li>
                    <li>
                        <div class="file-info">
                        Lampiran 3 - Laporan Produksi 
                        <span>(Word, 1.5MB)</span>
                        </div>
                        <div class="icon-group">
                        <i class="fa-solid fa-eye detail-icon"></i>
                        <i class="fa-solid fa-download btn-icon"></i>
                        </div>
                    </li>
                    <li>
                        <div class="file-info">
                        Lampiran 4 - Laporan SDM 
                        <span>(PDF, 1.2MB)</span>
                        </div>
                        <div class="icon-group">
                        <i class="fa-solid fa-eye detail-icon"></i>
                        <i class="fa-solid fa-download btn-icon"></i>
                        </div>
                    </li>
                    </ul>
                </div>

                <p>Umpan Balik Dari Mentor:</p>
                <div class="feedback-box">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi molestiae adipisci necessitatibus
                        repudiandae... Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorem, nobis. Magni ducimus repellat inventore sapiente numquam facere quasi beatae velit ea illo vero, suscipit ullam? Laudantium voluptate ex illo iure expedita minus eligendi fuga doloremque rerum. Ratione, ipsum. Suscipit velit quis animi. Voluptas earum doloribus suscipit dolorem cumque id voluptatem maiores, deserunt aliquid. Dolor reprehenderit repudiandae, porro ratione sunt animi perspiciatis vitae neque quam deserunt officia sequi, velit perferendis similique. Ut debitis, assumenda et tenetur aperiam obcaecati voluptatum, excepturi sapiente earum laboriosam eos esse magni ducimus, minus neque doloribus quod necessitatibus? Natus provident sit quaerat suscipit sunt numquam quibusdam reiciendis iste deleniti at. Corrupti odio eaque tempora magni repellat facilis quasi consequatur, assumenda reiciendis dicta harum veniam itaque labore iure commodi exercitationem beatae!</p>
                </div>
                <a href="laporan_bisnis_mahasiswa.php" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>
</body>

</html>