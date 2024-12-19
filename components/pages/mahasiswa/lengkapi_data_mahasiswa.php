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
} elseif ($role == 'Tutor') {
    $query = "SELECT * FROM mentor WHERE user_id = '$user_id'";
} else {
    die("Role tidak valid.");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $update_fields = [];
    if ($role == 'Mahasiswa') {
        if (empty($data['email']) && !empty($_POST['email'])) {
            $update_fields['email'] = $_POST['email'];
        }
        if (empty($data['contact']) && !empty($_POST['contact'])) {
            $update_fields['contact'] = $_POST['contact'];
        }

        if (!empty($update_fields)) {
            $set_clause = [];
            foreach ($update_fields as $key => $value) {
                $set_clause[] = "$key = '$value'";
            }
            $update_query = "UPDATE mahasiswa SET " . implode(', ', $set_clause) . " WHERE user_id = '$user_id'";
            $conn->query($update_query);
        }
    } elseif ($role == 'Tutor') {
        if (empty($data['peran']) && !empty($_POST['peran'])) {
            $update_fields['peran'] = $_POST['peran'];
        }
        if (empty($data['contact']) && !empty($_POST['contact'])) {
            $update_fields['contact'] = $_POST['contact'];
        }

        if (!empty($update_fields)) {
            $set_clause = [];
            foreach ($update_fields as $key => $value) {
                $set_clause[] = "$key = '$value'";
            }
            $update_query = "UPDATE mentor SET " . implode(', ', $set_clause) . " WHERE user_id = '$user_id'";
            $conn->query($update_query);
        }
    }

    $update_user_query = "UPDATE users SET first_login = 0 WHERE id = '$user_id'";
    $conn->query($update_user_query);

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
                <?php if ($role == 'Mahasiswa'): ?>
                    <div class="form-group">
                        <label for="nama">Nama</label>
                        <input id="nama" name="nama" type="text" value="<?= htmlspecialchars($_SESSION['nama']) ?>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="npm">NPM</label>
                        <input id="npm" name="npm" type="text" value="<?= htmlspecialchars($_SESSION['npm']) ?>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="fakultas">Fakultas</label>
                        <input id="fakultas" name="fakultas" type="text" value="<?= htmlspecialchars($_SESSION['fakultas']) ?>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="program_studi">Program Studi</label>
                        <input id="program_studi" name="program_studi" type="text" value="<?= htmlspecialchars($_SESSION['program_studi']) ?>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="tahun_angkatan">Tahun Angkatan</label>
                        <input id="tahun_angkatan" name="tahun_angkatan" type="text" value="<?= htmlspecialchars($_SESSION['tahun_angkatan']) ?>" readonly />
                    </div>
                <?php elseif ($role == 'Tutor'): ?>
                    <div class="form-group">
                        <label for="nama">Nama</label>
                        <input id="nama" name="nama" type="text" value="<?= htmlspecialchars($_SESSION['nama']) ?>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="peran">Peran</label>
                        <input id="peran" name="peran" type="text" value="<?= htmlspecialchars($data['peran']) ?>" />
                    </div>
                <?php endif; ?>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" name="email" type="email" value="<?= htmlspecialchars($data['email'] ?? '') ?>" required />
                </div>
                <div class="form-group">
                    <label for="contact">Nomor Telepon</label>
                    <input id="contact" name="contact" type="text" value="<?= htmlspecialchars($data['contact'] ?? '') ?>" required/>
                </div>
                
                <button type="submit" class="submit-btn">Tambahkan</button>
            </form>
        </div>
    </div>
</body>
</html>


