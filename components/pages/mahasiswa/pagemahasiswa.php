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

    $showToast = false;
    if (!isset($_SESSION['show_toast'])) {
        $showToast = true;
        $_SESSION['show_toast'] = true;
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIbml3AdvoEwyCvRhtojA0RsIB7BYAYfK59VeBYo6H" crossorigin="anonymous"></script>
    <link href="\Aplikasi-Kewirausahaan\assets\css\materikewirausahaan.css" rel="stylesheet" />
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'pagemahasiswa'; 
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Beranda"; 
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper"></div>
        </div>
    </div>

    <?php if ($showToast): ?>
    <div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3" style="z-index: 1055;">
        <div class="toast" id="myToast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <img src="\Aplikasi-Kewirausahaan\assets\img\Frame 64 1.png" style="width:20%; height:20%"; class="rounded me-2" alt="Logo">
                <strong class="me-auto">Welcome</strong>
                <small>Just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Hallo! Selamat datang <?= htmlspecialchars($mahasiswa['nama'] ?? 'Belum diisi'); ?> di aplikasi bimbingan kewirausahaan! Semoga sukses belajar!
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const toastEl = document.getElementById('myToast');
            const toast = new bootstrap.Toast(toastEl);
            toast.show();
        });
    </script>
    <?php endif; ?>
</body>

</html>