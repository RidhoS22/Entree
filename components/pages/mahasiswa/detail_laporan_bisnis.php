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
            margin: 40px;
        }

        .main_wrapper {
            padding: 30px;
        }
       
        h2 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        p {
            margin: 0;
        }
        
        .file-box {
            width: 100%;
            border: 1px solid #000;
            background-color: #fff;
            padding: 10px;
            margin-bottom: 20px;
            margin-top: -15px;
            min-height: 100px;
            max-height: 200px;
        }

        .file-lampiran {
            width: 100%;
            border: 1px solid #000;
            background-color: #fff;
            padding: 5px;
            margin-bottom: 20px;
            margin-top: -15px;
        }

        .feedback-box {
            width: 100%;
            min-height: 100px;
            max-height: 200px;
            overflow: auto;
            border: 1px solid #000;
            background-color: #f8fef8;
            padding: 10px;
            margin-bottom: 20px;
            margin-top: -15px;
        }

        table{
            background-color: #fff;
            border: 2px solid black;
        }

        tbody{
            padding: 20px;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'laporan_bisnis_mahasiswa'; // Halaman ini aktif
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <h1>Detail Laporan Kemajuan Bisnis</h1>
                <a href="#" class="notification">
                    <i class="fa-regular fa-bell"></i>
                </a>
            </div>

            <div class="main_wrapper">
                <h2>Judul</h2>
                   

                <p>Laporan Penjualan:</p>
                <div class="file-box">
                    <p>Laporan Penjualan</p>
                </div>

                <p>Laporan Pemasaran:</p>
                <div class="file-box">
                    <p>Laporan Pemasaran:</p>
                </div>

                <p>Laporan Produksi:</p>
                <div class="file-box">
                    <p>Laporan Produksi:</p>
                </div>

                <p>Laporan SDM:</p>
                <div class="file-box">
                    <p>Laporan SDM:</p>
                </div>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Laporan Penjualan</th>
                            <th>Laporan Pemasaran</th>
                            <th>Laporan Produksi</th>
                            <th>Laporan SDM</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Laporan Penjualan Lorem ipsum dolor sit amet consectetur, adipisicing elit. Porro, rem architecto et amet consectetur, quia aperiam corporis provident pariatur molestiae adipisci!</td>
                            <td>Laporan Pemasaran Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reprehenderit dignissimos dolorum error, eveniet ad rerum cupiditate unde eligendi, recusandae suscipit, modi neque perspiciatis esse non!</td>
                            <td>Laporan Produksi Lorem ipsum dolor, sit amet consectetur adipisicing elit. Mollitia, numquam. Perferendis, autem nesciunt. Nam, nisi similique accusamus eum mollitia itaque tenetur placeat.</td>
                            <td>Laporan SDM Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita laudantium obcaecati esse eveniet voluptas, ut ducimus deserunt doloremque earum vitae corrupti deleniti officiis error recusandae!</td>
                        <tr>
                    </tbody>
                </table>

                <p>Lampiran (Dokumentasi kegiatan secara pdf): <a href="">lampiran.pdf</a></p>
                <div class="file-lampiran">
                    <p>lampiran.pdf</p>
                </div>



                
                
                <p>Feedback mentor :</p>
                <div class="feedback-box">
                    <div>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Animi molestiae adipisci necessitatibus repudiandae, aspernatur ea alias aliquid accusantium reiciendis cumque? Deskripsi Deskripsi Deskripsi Deskripsi Deskripsi Lorem ipsum, dolor sit amet consectetur adipisicing elit. Molestiae fugit unde omnis perferendis soluta consequuntur ullam ipsa labore ea voluptatem officiis architecto quas accusamus corrupti, nemo voluptas facere cupiditate, alias tenetur exercitationem. Illum impedit expedita nisi consectetur qui placeat, nesciunt praesentium, dolores ipsa aspernatur, eligendi quisquam eum. Nemo iste ratione reiciendis nisi animi qui, fugiat veritatis facere debitis placeat sequi quos laboriosam similique magni repudiandae unde! Laudantium earum harum dolor modi facere sequi facilis, autem enim quisquam suscipit nam excepturi rem repellendus quos vero ex? Doloremque nihil voluptate esse, at vel, excepturi adipisci repudiandae pariatur nam maxime expedita quo commodi odit explicabo voluptatibus numquam quibusdam asperiores eligendi quos optio unde quasi? Earum et pariatur aspernatur, modi ipsum numquam recusandae, voluptas obcaecati asperiores commodi possimus ratione iure totam temporibus veritatis. Delectus, soluta!</div>
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