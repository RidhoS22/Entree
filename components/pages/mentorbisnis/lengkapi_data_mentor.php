<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Redirect jika belum login
if (!isset($_SESSION['username'])) {
    header("Location: /Aplikasi-Kewirausahaan/loginform.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Query untuk mendapatkan data role dari tabel users
$query_user = "SELECT role FROM users WHERE id = '$user_id'";
$result_user = $conn->query($query_user);

if ($result_user && $result_user->num_rows > 0) {
    $user = $result_user->fetch_assoc();
    $role = $user['role'];
} else {
    die("User tidak ditemukan atau role tidak valid.");
}

// Cek apakah role adalah 'mentor'
if ($role == 'Tutor') {
    // Ambil data mentor berdasarkan user_id
    $query_mentor = "SELECT * FROM mentor WHERE user_id = '$user_id'";
    $result_mentor = $conn->query($query_mentor);

    if ($result_mentor && $result_mentor->num_rows > 0) {
        $data = $result_mentor->fetch_assoc();
    } else {
        die("Data mentor tidak ditemukan.");
    }
} else {
    die("Role tidak valid.");
}

// Proses pengiriman form (POST)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil data dari form
    $keahlian = mysqli_real_escape_string($conn, $_POST['keahlian']);
    $fakultas = mysqli_real_escape_string($conn, $_POST['fakultas']);
    $prodi = mysqli_real_escape_string($conn, $_POST['prodi']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $no_telepon = mysqli_real_escape_string($conn, $_POST['no_telepon']);

    // Inisialisasi variabel foto profil
    $foto_profile = null;

    // Cek apakah ada file yang diunggah
    if (isset($_FILES['foto_profil']) && $_FILES['foto_profil']['error'] === UPLOAD_ERR_OK) {
        // Mendapatkan info file yang diunggah
        $file_tmp = $_FILES['foto_profil']['tmp_name'];
        $file_name = basename($_FILES['foto_profil']['name']);
        $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);

        // Validasi ekstensi file
        $valid_ext = ['jpg', 'jpeg', 'png', 'gif'];
        if (in_array($file_ext, $valid_ext)) {
            // Tentukan folder penyimpanan
            $upload_dir = $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/components/pages/mentorbisnis/uploads/';
            if (!file_exists($upload_dir)) {
                mkdir($upload_dir, 0777, true);
            }

            // Generate nama file unik
            $new_file_name = 'mentor_' . time() . '.' . $file_ext;
            $target_file = $upload_dir . $new_file_name;

            // Pindahkan file ke folder tujuan
            if (move_uploaded_file($file_tmp, $target_file)) {
                $foto_profile = '/Aplikasi-Kewirausahaan/components/pages/mentorbisnis/uploads/' . $new_file_name;
            } else {
                die("Gagal mengunggah foto profil.");
            }
        } else {
            die("Ekstensi file tidak valid. Harap unggah file dengan ekstensi JPG, JPEG, PNG, atau GIF.");
        }
    }

    // Array untuk menyimpan field yang akan diupdate
    $update_fields = [
        "keahlian" => $keahlian,
        "fakultas" => $fakultas,
        "prodi" => $prodi,
        "email" => $email,
        "contact" => $no_telepon,
    ];

    // Jika foto profil diunggah, tambahkan ke array
    if ($foto_profile) {
        $update_fields['foto_profile'] = $foto_profile;
    }

    // Query untuk update data mentor
    $set_clause = [];
    foreach ($update_fields as $key => $value) {
        $set_clause[] = "$key = '$value'";
    }

    $update_query = "UPDATE mentor SET " . implode(', ', $set_clause) . " WHERE user_id = '$user_id'";
    $conn->query($update_query);

    // Update status first_login di tabel users
    $update_user_query = "UPDATE users SET first_login = 0 WHERE id = '$user_id'";
    $conn->query($update_user_query);

    // Redirect ke halaman profile mentor setelah update
    header("Location: /Aplikasi-Kewirausahaan/components/pages/mentorbisnis/pagementor.php");
    exit;
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lengkapi Data <?= ucfirst($role) ?></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/lengkapi_data.css">
</head>
<body>
    <div class="container">
        <div class="image-container">
            <img alt="Illustration of a person holding a key in front of a computer screen with a user login interface" src="/Aplikasi-Kewirausahaan/assets/img/user_login.png"/>
        </div>
        <div class="form-container">
            <h2>Lengkapi Data Anda Sebagai Mentor Bisnis</h2>
            <form method="POST" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="nama">Nama Lengkap</label>
                    <input id="nama" name="nama" type="text" value="<?php echo htmlspecialchars($data['nama']); ?>" readonly />
                </div>
                <div class="form-group">
                    <label for="nidn">NIDN</label>
                    <input id="nidn" name="nidn" type="text" value="<?php echo htmlspecialchars($data['nidn']); ?>" readonly />
                </div>
                <div class="form-group">
                    <label for="keahlian">Keahlian</label>
                    <input id="keahlian" name="keahlian" type="text" value="<?php echo htmlspecialchars($data['keahlian'] ?? ''); ?>" required />
                </div>
                <div class="form-group">
                    <label for="fakultas">Fakultas</label>
                    <input id="fakultas" name="fakultas" type="text" value="<?php echo htmlspecialchars($data['fakultas'] ?? ''); ?>" required />
                </div>
                <div class="form-group">
                    <label for="prodi">Program Studi</label>
                    <input id="prodi" name="prodi" type="text" value="<?php echo htmlspecialchars($data['prodi'] ?? ''); ?>" required />
                </div>
                <div class="form-group">
                    <label for="email">Alamat Email</label>
                    <input id="email" name="email" type="text" value="<?php echo htmlspecialchars($data['email'] ?? ''); ?>" required />
                </div>
                <div class="form-group">
                    <label for="no_telepon">Nomor Telepon</label>
                    <input id="no_telepon" name="no_telepon" type="text" value="<?php echo htmlspecialchars($data['no_telepon'] ?? ''); ?>" required />
                </div>
                <div class="form-group">
                    <label for="foto_profil" class="form-label">Foto Profil 
                        <small class="text-muted">(JPG, JPEG, PNG)</small>
                    </label>
                    <div class="input-group">
                        <input type="file" class="form-control" id="foto_profil" name="foto_profil" accept=".jpg,.jpeg,.png,.gif" required>
                    </div>
                </div>
                <button class="submit-btn" type="submit">Tambahkan</button>
            </form>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
