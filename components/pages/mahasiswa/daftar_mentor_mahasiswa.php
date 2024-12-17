<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if (!isset($_SESSION['username'])) {
    header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
    exit;
}

// Ambil kata kunci pencarian jika ada
$search = isset($_GET['search']) ? $_GET['search'] : '';

// Modifikasi query untuk mencari mentor berdasarkan nama jika ada input pencarian
$query_mentor = "
    SELECT 
        mentor.*, 
        users.role AS peran 
    FROM mentor 
    JOIN users ON mentor.user_id = users.id
    WHERE mentor.nama LIKE '%$search%'"; // Filter berdasarkan nama mentor
$result_mentor = $conn->query($query_mentor);

if (!$result_mentor) {
    die("Error: " . $conn->error);
}
?>

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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/daftar_mentor.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'daftar_mentor_mahasiswa'; // Halaman ini aktif
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Daftar Mentor Bisnis"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <form action="" method="get" class="mb-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Cari mentor..." name="search" value="<?= htmlspecialchars($search); ?>">
                        <button class="btn btn-primary" type="submit">Cari</button>
                    </div>
                </form>


                <div class="clearfix">
                    <?php while ($mentor = $result_mentor->fetch_assoc()) : ?>
                        <!-- Wrapper Collapse -->
                        <div class="accordion" id="accordionExample">
                            <!-- Card Mentor -->
                            <div class="card mb-3">
                                <a data-bs-toggle="collapse" href="#collapse<?= $mentor['id']; ?>" role="button" 
                                    aria-expanded="false" aria-controls="collapse<?= $mentor['id']; ?>">
                                    <div class="card-header">
                                        <img alt="Profile picture of the mentor" class="w-12 h-12 rounded-full me-2" height="50" 
                                        src="<?= htmlspecialchars($mentor['foto_profile']); ?>" width="50"/>
                                        <div>
                                            <h2 class="font-bold mb-0"><?= htmlspecialchars($mentor['nama']); ?></h2>
                                            <p class="mb-0">Peran: <?= htmlspecialchars($mentor['peran']); ?></p>
                                        </div>
                                        <div class="klik d-flex flex-column align-items-center">
                                            <span class="toggle-text" id="toggle-text-<?= $mentor['id']; ?>">
                                                Klik untuk melihat detail data mentor
                                            </span>
                                            <i class="fa-solid fa-caret-down"></i>
                                        </div>
                                    </div>
                                </a>

                                <!-- Content Collapse -->
                                <div id="collapse<?= $mentor['id']; ?>" class="collapse" data-bs-parent="#accordionExample">
                                    <div class="card-body">
                                        <p>Keahlian: <?= htmlspecialchars($mentor['keahlian']); ?></p>
                                        <p>Fakultas: <?= htmlspecialchars($mentor['fakultas']); ?></p>
                                        <p>Prodi: <?= htmlspecialchars($mentor['prodi']); ?></p>    
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                </div>
                    
            </div>
        </div>
    </div> 

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Pilih semua elemen collapse yang digunakan
            const collapses = document.querySelectorAll('.collapse');

            collapses.forEach(function (collapse) {
                collapse.addEventListener('show.bs.collapse', function () {
                    const mentorId = this.id.replace('collapse', '');
                    const toggleText = document.getElementById('toggle-text-' + mentorId);
                    const caretIcon = toggleText.nextElementSibling; // Mengambil ikon setelah span
                    
                    if (toggleText) {
                        toggleText.style.display = 'none'; // Hilangkan teks
                    }
                    if (caretIcon) {
                        caretIcon.style.display = 'none'; // Hilangkan ikon
                    }
                });

                collapse.addEventListener('hide.bs.collapse', function () {
                    const mentorId = this.id.replace('collapse', '');
                    const toggleText = document.getElementById('toggle-text-' + mentorId);
                    const caretIcon = toggleText.nextElementSibling; // Mengambil ikon setelah span

                    if (toggleText) {
                        toggleText.style.display = 'inline'; // Tampilkan teks
                    }
                    if (caretIcon) {
                        caretIcon.style.display = 'inline'; // Tampilkan ikon
                    }
                });
            });
        });

    </script>
</body>

</html>
