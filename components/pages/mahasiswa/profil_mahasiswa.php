<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if (!isset($_SESSION['username'])) {
    header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
    exit;
}

$user_id = $_SESSION['user_id'];

$query_user = "SELECT username FROM users WHERE id = '$user_id'";
$result_user = $conn->query($query_user);

if ($result_user && $result_user->num_rows > 0) {
    $user = $result_user->fetch_assoc();
    $username = $user['username'];
} else {
    die("User tidak ditemukan.");
}

$query_mahasiswa = "SELECT * FROM mahasiswa WHERE user_id = '$user_id'";
$result_mahasiswa = $conn->query($query_mahasiswa);

if ($result_mahasiswa && $result_mahasiswa->num_rows > 0) {
    $mahasiswa = $result_mahasiswa->fetch_assoc();
} else {
    die("Data mahasiswa tidak ditemukan.");
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/profil.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'profil'; 
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Profil"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">

                    <button class="edit-btn" type="button">
                        <i class="fas fa-edit"></i>
                    </button>
                    <div class="profile-header">
                        <div class="profile-item">
                            <h2>Username</h2>
                            <p><?= htmlspecialchars($username); ?></p>
                        </div>
                    </div>
                    <!-- Tambahkan grid untuk profil item -->
                    <div class="profile-grid">
                        <div class="profile-item">
                            <h2>Nama Lengkap</h2>
                            <p><?= htmlspecialchars($mahasiswa['nama'] ?? 'Belum diisi'); ?></p>
                        </div>
                        <div class="profile-item">
                            <h2>NPM</h2>
                            <p><?= htmlspecialchars($mahasiswa['npm'] ?? 'Belum diisi'); ?></p>
                        </div>
                        <div class="profile-item">
                            <h2>Program Studi</h2>
                            <p><?= htmlspecialchars($mahasiswa['program_studi'] ?? 'Belum diisi'); ?></p>
                        </div>
                        <div class="profile-item">
                            <h2>Alamat Email</h2>
                            <p><?= htmlspecialchars($mahasiswa['email'] ?? 'Belum diisi'); ?></p>
                        </div>
                        <div class="profile-item">
                            <h2>Nomor Telepon</h2>
                            <p><?= htmlspecialchars($mahasiswa['contact'] ?? 'Belum diisi'); ?></p>
                        </div>
                </div>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>
