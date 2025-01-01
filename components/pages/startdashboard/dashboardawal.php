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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/sidebar.css">
    <style>
        .main_wrapper {
            width: 100%;
            height: 95vh;
            overflow-y: auto;
        }

        .icon {
            font-size: 24px;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .icon:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <button class="toggle-btn2" type="button">
            <i class="fa-solid fa-bars"></i>
        </button>
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

        <div class="main p-3">

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
                                <i class="fa-solid fa-arrow-pointer icon"></i>
                                <h5 class="mt-3">Tampilan Interaktif</h5>
                                <p>Pantau progres Anda secara real-time.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-4 border rounded">
                                <i class="fa-solid fa-bell icon"></i>
                                <h5 class="mt-3">Notifikasi Pintar</h5>
                                <p>Tetap terhubung dengan pengingat otomatis.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        </div>
        
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
    <script>
            document.addEventListener('DOMContentLoaded', function () {
            const toggleBtn2 = document.querySelector('.toggle-btn2'); // Tombol toggle
            const sidebar = document.querySelector('#sidebar'); // Sidebar

            // Fungsi untuk toggle display pada sidebar
            toggleBtn2.addEventListener('click', function () {
                if (sidebar.style.display === 'block') {
                    sidebar.style.display = 'none'; // Sembunyikan sidebar
                } else {
                    sidebar.style.display = 'block'; // Tampilkan sidebar
                }
            });
        });

    </script>
</body>

</html>
