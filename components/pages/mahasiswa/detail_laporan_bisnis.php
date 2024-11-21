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

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
           
        }

        .main {
            padding: 20px;
        }

        .main_wrapper {
            height: 85vh;
            padding: 30px;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        p {
            margin: 0 0 10px;
        }

        .file-box,
        .file-lampiran,
        .feedback-box {
            width: 100%;
            border: 1px solid #ddd;
            background-color: #fff;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
            max-height: 200px;
        }

        .feedback-box {
            background-color: #f8fef8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <?php 
            $activePage = 'laporan_bisnis_mahasiswa'; // Halaman ini aktif
            include 'sidebar_mahasiswa.php'; 
        ?>

        <!-- Main Content -->
        <div class="main">
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

                <p>Lampiran (Dokumentasi kegiatan dalam format PDF): <a href="#">lampiran.pdf</a></p>

                <p>Feedback Mentor:</p>
                <div class="feedback-box">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi molestiae adipisci necessitatibus
                        repudiandae... Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorem, nobis. Magni ducimus repellat inventore sapiente numquam facere quasi beatae velit ea illo vero, suscipit ullam? Laudantium voluptate ex illo iure expedita minus eligendi fuga doloremque rerum. Ratione, ipsum. Suscipit velit quis animi. Voluptas earum doloribus suscipit dolorem cumque id voluptatem maiores, deserunt aliquid. Dolor reprehenderit repudiandae, porro ratione sunt animi perspiciatis vitae neque quam deserunt officia sequi, velit perferendis similique. Ut debitis, assumenda et tenetur aperiam obcaecati voluptatum, excepturi sapiente earum laboriosam eos esse magni ducimus, minus neque doloribus quod necessitatibus? Natus provident sit quaerat suscipit sunt numquam quibusdam reiciendis iste deleniti at. Corrupti odio eaque tempora magni repellat facilis quasi consequatur, assumenda reiciendis dicta harum veniam itaque labore iure commodi exercitationem beatae!</p>
                </div>
                <a href="laporan_bisnis_mahasiswa.php" class="btn btn-secondary">Kembali</a>
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