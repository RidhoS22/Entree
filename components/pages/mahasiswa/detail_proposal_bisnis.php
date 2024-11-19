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
        }
        .description, .file-box, .feedback-box {
            margin-top: 20px;
            margin-bottom: 20px;
            
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

        .styled-table {
            width: 100%; /* Lebar penuh */
            border-collapse: collapse; /* Hilangkan garis ganda antar sel */
        }

        .styled-table td {
            padding: 10px;
            vertical-align: middle; /* Pusatkan teks secara vertikal */
            background-color: #fff;
            border: 1px solid black;
        }

        .file-box {
            width: 80%;
            background-color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            border: 1px solid black;
        }

        table{
            margin-top: 40px;
            margin-bottom: 40px;
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
                <?php 
                    $pageTitle = "Detail Proposal Bisnis"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">

                <h2>Judul</h2>
                <div class="description">
                    Deskripsi Deskripsi Deskripsi Deskripsi Deskripsi Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quia, harum voluptatem eos minima, nisi dolor iusto quas sapiente modi mollitia minus dignissimos veniam aut suscipit explicabo, deserunt eligendi assumenda reiciendis voluptas obcaecati amet recusandae doloremque quod. Consectetur atque quam quod eum commodi recusandae beatae eaque enim neque magnam quisquam asperiores adipisci minima excepturi eligendi impedit cum mollitia, dolorem exercitationem quo totam blanditiis. Iste temporibus animi repudiandae! Inventore qui recusandae blanditiis saepe magni incidunt maxime assumenda, libero eveniet. Possimus repudiandae temporibus laborum nemo dolore est in id vel ratione nobis, neque nulla quasi ab iure expedita tenetur soluta magni velit ea placeat architecto excepturi explicabo mollitia repellendus. Maiores voluptatem optio temporibus, nam labore culpa eos, accusamus voluptatum, mollitia fuga explicabo perferendis! Nam, ad repudiandae.
                </div>

                <table class="styled-table">
                    <tr>
                        <td>SDG Bisnis:</td>
                        <td class="file-box">SDG Bisnis</td>
                    </tr>
                    <tr>
                        <td>Kategori Bisnis:</td>
                        <td class="file-box">Kategori Bisnis</td>
                    </tr>
                    <tr>
                        <td>File Proposal Bisnis:</td>
                        <td class="file-box">proposal bisnis.pdf</td>
                    </tr>
                </table>
                
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