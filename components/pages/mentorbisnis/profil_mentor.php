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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/profil.css">
</head>

<body>
    <div class="wrapper">
   
    <?php 
    $activePage = 'profil'; // Halaman ini adalah Profil
    include 'sidebar_mentor.php'; 
    ?>

        <div class="main p-3">
            <div class="main_header">
                <h1>Profil Mentor Bisnis</h1>
                <a href="#" class="notification">
                    <i class="fa-regular fa-bell"></i>
                </a>
            </div>

            <div class="main_wrapper">
                <div class="profile-container">
                    <div class="profile-header">
                        <div class="profile-item">
                            <h2>Username</h2>
                            <p>mfadly</p>
                        </div>
                        <button class="edit-btn" type="button">
                            <i class="fas fa-edit"></i>
                        </button>
                    </div>
                    <div class="profile-item">
                        <h2>Nama Lengkap</h2>
                        <p>Muhammad Fadly Abdillah</p>
                    </div>
                    <div class="profile-item">
                        <h2>NIDN</h2>
                        <p>14020242342</p>
                    </div>
                    <div class="profile-item">
                        <h2>Peran</h2>
                        <p>Dosen Pengampu</p>
                    </div>
                    <div class="profile-item">
                        <h2>Keahlian</h2>
                        <p>Bisnis StartUp</p>
                    </div>
                    <div class="profile-item">
                        <h2>Fakultas</h2>
                        <p>Teknik Informasi</p>
                    </div>
                    <div class="profile-item">
                        <h2>Program Studi</h2>
                        <p>Teknik Informasi</p>
                    </div>
                    <div class="profile-item">
                        <h2>Alamat Email</h2>
                        <p>astil@gmailcom</p>
                    </div>
                    <div class="profile-item">
                        <h2>Nomor Telepon</h2>
                        <p>0898970980</p>
                    </div>
                </div>
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