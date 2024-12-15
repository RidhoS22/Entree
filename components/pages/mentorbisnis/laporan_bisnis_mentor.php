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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/laporan_bisnis.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'laporan_bisnis_mentor'; // Halaman ini aktif
        include 'sidebar_mentor.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Laporan Kemajuan Bisnis"; // Judul halaman
                    include 'header_mentor.php'; 
                ?>
            </div>

            <div class="main_wrapper">

                <div class="card">
                    <div class="card-header">
                        <h2>Laporan Bisnis</h2>
                    </div>
                    <a href="detail_laporan_bisnis_mentor.php">
                        <div class="card-body">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente at quidem commodi. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Perferendis suscipit dolores sunt molestias. Iusto dignissimos doloremque tempore architecto fuga vero quibusdam molestias quis pariatur impedit, odit delectus explicabo magni vitae quam! Quam aliquam voluptas voluptatem minima aspernatur provident amet atque eligendi eveniet veritatis, ullam eaque iste perspiciatis impedit ex. Reprehenderit aperiam, quod atque voluptas unde facilis mollitia corporis expedita aspernatur asperiores et molestias soluta accusantium repellendus neque itaque consequuntur voluptates laboriosam, minima vitae laborum illum perferendis possimus? Blanditiis provident nihil magni iure nostrum perspiciatis omnis, corrupti ipsa assumenda quisquam maiores esse aliquid quis tenetur veritatis beatae est libero earum nulla! Illum, officia quidem, vel eaque deleniti mollitia voluptate rerum earum nemo quas ex provident doloremque, quis alias fugiat saepe commodi culpa ullam nostrum minus iure. Unde in nostrum optio voluptatibus nemo delectus sed dolore consectetur odit excepturi ab aspernatur rem, tempore iusto et veniam. Hic soluta debitis totam, modi quae doloribus sapiente voluptatem. Possimus voluptatum adipisci, earum corporis consequatur laborum aut illo necessitatibus ducimus quis laboriosam eveniet magni animi neque iste eum facilis tempora sunt? Iste veniam maxime cumque a, eum ab! Enim architecto in repellat modi perferendis et qui, quam, sed maiores veritatis praesentium cupiditate impedit cum accusantium ad dignissimos sapiente. Reprehenderit placeat dicta non nesciunt iusto ad veniam ab laudantium sit ratione. Enim nobis porro repudiandae deserunt totam minima in harum fuga assumenda, consequuntur deleniti velit repellendus ipsa error voluptate cum.</p>
                        <i class="fa-solid fa-eye detail-icon" title="Lihat Detail Laporan Kemajuan Bisnis"></i>
                    </div>
                    </a>
                    <div class="card-footer">
                        <a href="detail_laporan_bisnis_mentor.php">Beri Umpan Balik</a>
                    </div>
                </div>

            </div>
        </div>
</body>

</html>