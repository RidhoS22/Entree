<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if (!isset($_SESSION['username'])) {
    header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
    exit;
}

$user_id = $_SESSION['user_id'];

$query_user = "SELECT role FROM users WHERE id = '$user_id'";
$result_user = $conn->query($query_user);

if ($result_user && $result_user->num_rows > 0) {
    $user = $result_user->fetch_assoc();
    $role = $user['role'];
} else {
    die("User tidak ditemukan atau role tidak valid.");
}

if ($role == 'Mahasiswa') {
    $query = "SELECT * FROM mahasiswa WHERE user_id = '$user_id'";
} else {
    die("Role tidak valid.");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama = $_POST['nama'];
    $npm = $_POST['npm'];
    $tahun_ajaran = $_POST['tahun_ajaran'];
    $alamat = $_POST['alamat'];
    $email = $_POST['email'];
    $contact = $_POST['contact'];
    $insert_query = "INSERT INTO mahasiswa (user_id, nama, npm, email, contact, alamat) VALUES ('$user_id', '$nama', '$npm', '$email', '$contact', '$alamat')";
    $conn->query($insert_query);
        
    // Update first_login pada tabel users
    $update_user_query = "UPDATE users SET first_login = 0 WHERE id = '$user_id'";
    $conn->query($update_user_query);

    // Redirect ke halaman mahasiswa
    header("Location: /Aplikasi-Kewirausahaan/components/pages/mahasiswa/pagemahasiswa.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lengkapi Data <?= ucfirst($role) ?></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/lengkapi_dataa.css">
</head>
<body>
    <div class="container">
        <div class="image-container">
            <img alt="Illustration of user registration" src="/Aplikasi-Kewirausahaan/assets/img/background.png" />
        </div>
        
        <div class="form-container">
            <h2>Lengkapi Data Anda Sebagai <?= ucfirst($role) ?></h2>
            <form method="POST" action="">
                <div class="form-group">
                    <label for="nama">Nama</label>
                    <input id="nama" name="nama" type="text" value="<?= htmlspecialchars($_SESSION['displayName']) ?>" readonly />
                </div>
                <div class="form-group">
                    <label for="npm">NPM</label>
                    <input id="npm" name="npm" type="text" value="<?= htmlspecialchars($_SESSION['npm']) ?>" />
                </div>
                <div class="form-group">
                    <label for="fakultas">Fakultas</label>
                    <input id="fakultas" name="fakultas" type="text" readonly />
                </div>
                <div class="form-group">
                    <label for="program_studi">Program Studi</label>
                    <input id="program_studi" name="program_studi" type="text" readonly />
                </div>
                <div class="form-group">
                    <label for="tahun_ajaran">Tahun Ajaran</label>
                    <input id="tahun_ajaran" name="tahun_ajaran" type="text" placeholder="Tahun Ajaran" readonly />
                </div>
                <div class="form-group">
                    <label for="alamat">Alamat</label>
                    <input id="alamat" name="alamat" type="text" value="<?= htmlspecialchars($_SESSION['street']) ?>" required />
                </div>
                <div class="form-group">
                    <label for="contact">Nomor Telepon</label>
                    <input id="contact" name="contact" type="text" value="<?= htmlspecialchars($_SESSION['contact']) ?>" readonly/>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" name="email" type="email" value="<?= htmlspecialchars($data['email'] ?? '') ?>" required />
                </div>       
                <button type="submit" class="submit-btn">Tambahkan</button>
            </form>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const npmField = document.getElementById('npm');
            const tahunAjaranField = document.getElementById('tahun_ajaran');
            const npm = npmField.value;
            const angkatan = parseInt(npm.substring(5, 7));
            const tahunAjaranStart = 2000 + angkatan;
            const tahunAjaranEnd = tahunAjaranStart + 1;
            const tahunSekarang = new Date().getFullYear();
            const tahunSelisih = tahunSekarang - tahunAjaranStart;
            const semesterLalu = tahunSelisih * 2;
            const bulanSekarang = new Date().getMonth() + 1;
            let semesterText;
            let currentSemester;

            if (bulanSekarang >= 7) {
                semesterText = 'Ganjil';
                currentSemester = semesterLalu + 1;
            } else {
                semesterText = 'Genap';
                currentSemester = semesterLalu + 2;
            }

            const tahunAjaranText = `${tahunAjaranStart} / ${tahunAjaranEnd} ${semesterText} (Semester ${currentSemester})`;
            tahunAjaranField.value = tahunAjaranText;
        });
    </script>
</body>

</html>


