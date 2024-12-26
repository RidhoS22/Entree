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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/pagemahasiswa.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'pageadmin'; // Halaman ini aktif
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">

            <div class="main_header">
                <?php 
                    $pageTitle = "Beranda"; // Judul halaman
                    include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                
             <!-- Hero Section -->
            <header class="bg-success text-white text-center py-5">
                <div class="container">
                    <h1 class="display-4">Entree</h1>
                    <p class="lead">Platform Bimbingan Kewirausahaan Mahasiswa</p>
                </div>
            </header>

            <!-- Highlight Features Section -->
            <section id="features" class="py-5">
                <div class="container text-center">
                    <h2 class="mb-4">Fitur Unggulan</h2>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="p-4 border rounded">
                            <i class="fa-solid fa-address-card icon"
                                data-bs-target="#exampleModalToggle" 
                                data-bs-toggle="modal"></i>  
                            <h5 class="mt-3">Mentor Berkualitas</h5>
                                <p>Dapatkan bimbingan dari para ahli di bidangnya.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-4 border rounded">
                                <i class="bi bi-bar-chart-line fs-1 text-primary"></i>
                                <h5 class="mt-3">Dashboard Interaktif</h5>
                                <p>Pantau progres Anda secara real-time.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-4 border rounded">
                                <i class="bi bi-bell fs-1 text-primary"></i>
                                <h5 class="mt-3">Notifikasi Pintar</h5>
                                <p>Tetap terhubung dengan pengingat otomatis.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

   
         
            </div>
        </div>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Modal 1</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Show a second modal and hide this one with the button below.
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Open second modal</button>
                    </div>
                    </div>
                </div>
                </div>
                <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">Modal 2</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Hide this modal and show the first with the button below.
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Back to first</button>
                    </div>
                    </div>
                </div>
                </div>
    </div>
</body>

</html>