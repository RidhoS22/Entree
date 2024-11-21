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
            padding: 30px;
            background-color: #f4f4f9;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            height: 85vh;
            padding: 30px;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .description {
            margin: 20px 0;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            line-height: 1.6;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .styled-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .styled-table td {
            padding: 10px 15px;
            border: 1px solid #ddd;
            background-color: #fefefe;
            vertical-align: middle;
        }

        .file-box {
            background-color: #f9f9f9;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .feedback-box {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            background-color: #f8fef8;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            overflow-y: auto;
            max-height: 200px;
            line-height: 1.6;
            margin-bottom: 20px;
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
                $pageTitle = "Detail Proposal Bisnis"; // Judul halaman
                include 'header_mahasiswa.php'; 
            ?>

            <!-- Content Wrapper -->
            <div class="main_wrapper">
                <h2>Judul Proposal</h2>
                <div class="description">
                    Deskripsi Deskripsi Deskripsi Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus
                    repudiandae temporibus laborum nemo dolore est in id vel ratione nobis.
                </div>

                <!-- Table Section -->
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
                        <td class="file-box"><a href="">proposal_bisnis.pdf</a></td>
                    </tr>
                </table>

                <!-- Feedback Section -->
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