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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/admin/proposal_bisnis_admin.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'proposal_bisnis_admin'; // Halaman ini aktif
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">

            <div class="main_header">
                <?php 
                    $pageTitle = "Proposal Bisnis Kewirausahaan"; // Judul halaman
                    include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">
            <div class="card">
                    <div class="card-header">
                        <h2>Proposal Bisnis</h2>
                    </div>
                    <a href="detail_proposal_bisnis.php">
                        <div class="card-body">
                        <p>Lorem ipsum doloteo quibusdam ,asperiores et molestias soluta accusantium repellendus neque itaque riosam, m illum perferendis possimus? Blanditiis provident nihil magni iure nostrum perspiciatis omnis, corrupti ipsa assumenda quisquam maiores esse aliquid quis tenetur veritatis beatae est libero earum nulla! Illum, officia quidem, vel eaque deleniti mollitia voluptate rerum earum nemo quas ex provident doloremque, quis alias fugiat saepe commodi culpa ullam nostrum minus iure. Unde in nostrum optio voluptatibus nemo delectus sed dolore consectetur odit excepturi ab aspernatur rem, tempore iusto et veniam. Hic soluta debitis totam, modi quae doloribus sapiente voluptatem. Possimus voluptatum adipisci, earum corporis consequatur laborum aut illo necessitatibus ducimus quis laboriosam eveniet.</p>
                        <hr>
                        <i class="fa-solid fa-eye detail-icon"></i>
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