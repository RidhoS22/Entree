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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/admin/sidebar_admin.css">
</head>

<body>
    <div class="wrapper">
        <aside id="sidebar">
            <div class="d-flex">
                <button class="toggle-btn" type="button">
                    <i class="fa-solid fa-bars"></i>
                </button>
                <div class="sidebar-logo">
                    <a href="#">Yarsi Entree</a>
                </div>
            </div>
            <ul class="sidebar-nav">
                <li class="sidebar-item <?php echo ($activePage == 'profil_mentor') ? 'active' : ''; ?>">
                    <a href="profil_mentor.php" class="sidebar-link">
                        <i class="fa-solid fa-user"></i>
                        <span>Profil</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'pagementor') ? 'active' : ''; ?>">
                    <a href="pagementor.php" class="sidebar-link">
                        <i class="fa-solid fa-house"></i>
                        <span>Beranda</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'materikewirausahaan_mentor') ? 'active' : ''; ?>">
                    <a href="materikewirausahaan_mentor.php" class="sidebar-link">
                        <i class="fa-solid fa-book"></i>
                        <span>Materi Kewirausahaan</span>
                    </a>
                </li>
                <hr>
                <li class="sidebar-header">
                    <h1>Mentor Bisnis</h1>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'daftar_kelompok_bisnis_mentor') ? 'active' : ''; ?>">
                    <a href="daftar_kelompok_bisnis_mentor.php" class="sidebar-link">
                        <i class="fa-solid fa-users"></i>
                        <span>Daftar Kelompok Bisnis</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'kelola_kelompok_bimbingan_mentor') ? 'active' : ''; ?>">
                    <a href="kelola_kelompok_bimbingan_mentor.php" class="sidebar-link">
                        <i class="fa-solid fa-file"></i>
                        <span>Kelola Kelompok Bimbingan</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'jadwal_bimbingan_mentor') ? 'active' : ''; ?>">
                    <a href="jadwal_bimbingan_mentor.php" class="sidebar-link">
                        <i class="fa-solid fa-calendar"></i>
                        <span>Jadwal Bimbingan</span>
                    </a>
                </li>
                <li class="sidebar-item sign-out">
                    <a href="/Aplikasi-Kewirausahaan/components/pages/startdashboard/dashboardawal.php" class="sidebar-link">
                        <i class="fa-solid fa-sign-out"></i>
                        <span>Keluar</span>
                    </a>
                </li>
            </ul>
        </aside>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>