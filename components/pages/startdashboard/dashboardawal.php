<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirausahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');
    ::after,
    ::before {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    a {
        text-decoration: none;
    }

    li {
        list-style: none;
    }

    h1 {
        font-weight: 600;
        font-size: 1.5rem;
    }
    
    body {
        background-color: #f4f4f4;
        font-family: 'Poppins', sans-serif;        
        margin: 0;
        padding: 0;
        height: 100%; /* Ensure body covers the entire height */
    }

    .html {
        height: 100%; /* Ensure HTML root covers the entire height */
    }

    .wrapper {
        display: flex;
        height: 100vh; /* Full viewport height */
    }

    #sidebar {
        width: 70px;
        min-width: 70px;
        z-index: 1000;
        transition: all 0.25s ease-in-out;
        background-color: #2ea56f;
        display: flex;
        flex-direction: column;
        height: 100vh; /* Sidebar covers the full height */
    }

    #sidebar.expand {
        width: 260px;
        min-width: 260px;
    }

    .toggle-btn {
        background-color: transparent;
        cursor: pointer;
        border: 0;
        padding: 1rem 1.5rem;
    }

    .toggle-btn i {
        font-size: 1.5rem;
        color: #FFF;
    }

    .sidebar-logo {
        margin: auto 0;
    }

    .sidebar-logo a {
        color: #FFF;
        font-size: 1.15rem;
        font-weight: 600;
    }

    #sidebar:not(.expand) .sidebar-logo,
    #sidebar:not(.expand) a.sidebar-link span {
        display: none;
    }

    .sidebar-nav {
        padding: 2rem 0;
        flex: 1 1 auto;
    }

    a.sidebar-link {
        padding: 0.625rem 1.625rem;
        color: #FFF;
        display: block;
        font-size: 0.9rem;
        white-space: nowrap;
        border-left: 3px solid transparent;
    }

    .sidebar-link i {
        font-size: 1.1rem;
        margin-right: 0.75rem;
    }

    a.sidebar-link:hover {
        background-color: rgba(255, 255, 255, 0.075);
        border-left: 4px solid white;
    }

    .sidebar-item.active a {
        background-color: rgba(255, 255, 255, 0.075);
        border-left: 4px solid white;
    }

    .sidebar-item {
        position: relative;
    }

    #sidebar:not(.expand) .sidebar-item .sidebar-dropdown {
        position: absolute;
        top: 0;
        left: 70px;
        background-color: #0e2238;
        padding: 0;
        min-width: 15rem;
        display: none;
    }

    #sidebar:not(.expand) .sidebar-item:hover .has-dropdown + .sidebar-dropdown {
        display: block;
        max-height: 15em;
        width: 100%;
        opacity: 1;
    }

    #sidebar.expand .sidebar-link[data-bs-toggle="collapse"]::after {
        border: solid;
        border-width: 0 0.075rem 0.075rem 0;
        content: "";
        display: inline-block;
        padding: 2px;
        position: absolute;
        right: 1.5rem;
        top: 1.4rem;
        transform: rotate(-135deg);
        transition: all 0.2s ease-out;
    }

    #sidebar.expand .sidebar-link[data-bs-toggle="collapse"].collapsed::after {
        transform: rotate(45deg);
        transition: all 0.2s ease-out;
    }

    .main_wrapper {
        flex-grow: 1;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        margin: 20px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }
</style>

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
                <li class="sidebar-item active">
                    <a href="#" class="sidebar-link">
                        <i class="fa-solid fa-house"></i>
                        <span>Beranda</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#auth" aria-expanded="false" aria-controls="auth">
                        <i class="lni lni-protection"></i>
                        <span>Auth</span>
                    </a>
                    <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="/APLIKASI-KEWIRAUSAHAAN/auth/login/loginform.php" class="sidebar-link">Login</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </aside>
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
                                <i class="fa-solid fa-address-card icon" data-bs-target="#exampleModalToggle"
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>
