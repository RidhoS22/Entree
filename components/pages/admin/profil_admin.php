<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if (!isset($_SESSION['username'])) {
    header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
    exit;
}

$user_id = $_SESSION['user_id']; // Ambil user_id dari session

// Mengambil data mahasiswa dari database berdasarkan user_id
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
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Profil"; 
                    include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <button class="edit-btn" type="button" title="Edit Profil">
                    <i class="fas fa-edit"></i>
                </button>
                <div class="profile-header">
                    <div class="profile-item">
                        <h2>Username</h2>
                        <p><?= htmlspecialchars($_SESSION['username']); ?></p>
                    </div>
                </div>
                <button class="btn change-password-btn" style="background-color: #2ea56f; color: white; display: none;" 
                    data-bs-toggle="modal" data-bs-target="#changePasswordModal">
                    Ganti Kata Sandi
                </button>
            </div>
        </div>
    </div>

    <!-- Modal Ganti Kata Sandi -->
    <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changePasswordModalLabel">Ganti Kata Sandi</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="process_change_password.php" method="POST">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">Kata Sandi Baru</label>
                            <input type="password" class="form-control" id="newPassword" name="new_password" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Konfirmasi Kata Sandi Baru</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirm_password" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-cancel" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary btn-submit">Simpan Perubahan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        // JavaScript untuk menampilkan tombol "Ganti Kata Sandi"
        document.querySelector('.edit-btn').addEventListener('click', function () {
            const changePasswordBtn = document.querySelector('.change-password-btn');
            changePasswordBtn.style.display = 'block'; // Tampilkan tombol "Ganti Kata Sandi"
        });
    </script>
</body>

</html>
