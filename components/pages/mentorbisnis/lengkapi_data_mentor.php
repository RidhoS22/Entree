<?php
session_start();
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: /Entree/login');
    exit;
}

// Cek apakah role pengguna sesuai
if ($_SESSION['role'] !== 'Tutor' && $_SESSION['role'] !== 'Dosen Pengampu') {
    header('Location: /Entree/login');
    exit;
}
include $_SERVER['DOCUMENT_ROOT'] . '/Entree/config/db_connection.php';

// Redirect jika belum login
if (!isset($_SESSION['username'])) {
    header("Location: /Entree/loginform.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Proses pengiriman form (POST)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil data dari form
    $nama = $_POST['nama'];
    $npm = $_POST['nik'];
    $keahlian = mysqli_real_escape_string($conn, $_POST['keahlian']);
    $fakultas = mysqli_real_escape_string($conn, $_POST['fakultas']);
    $prodi = mysqli_real_escape_string($conn, $_POST['prodi']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $no_telepon = $_POST['no_telepon'];

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
            $upload_dir = $_SERVER['DOCUMENT_ROOT'] . '/Entree/components/pages/mentorbisnis/uploads/';
            if (!file_exists($upload_dir)) {
                mkdir($upload_dir, 0777, true);
            }

            // Generate nama file unik
            $new_file_name = 'mentor_' . time() . '.' . $file_ext;
            $target_file = $upload_dir . $new_file_name;

            // Pindahkan file ke folder tujuan
            if (move_uploaded_file($file_tmp, $target_file)) {
                $foto_profile = '/Entree/components/pages/mentorbisnis/uploads/' . $new_file_name;
            } else {
                die("Gagal mengunggah foto profil.");
            }
        } else {
            die("Ekstensi file tidak valid. Harap unggah file dengan ekstensi JPG, JPEG, PNG, atau GIF.");
        }
    }

    // Insert data baru ke tabel mentor
    $insert_query = "INSERT INTO mentor (user_id, nama, npm, keahlian, fakultas, prodi, email, contact, foto_profile) 
                     VALUES ('$user_id', '$nama', '$npm', '$keahlian', '$fakultas', '$prodi', '$email', '$no_telepon', '$foto_profile')";
    
    if ($conn->query($insert_query) === TRUE) {
        // Update status first_login di tabel users
        $update_user_query = "UPDATE users SET first_login = 0 WHERE id = '$user_id'";
        $conn->query($update_user_query);

        // Redirect ke halaman profile mentor setelah insert
        header("Location: /Entree/mentor/pagementor");
        exit;
    } else {
        die("Gagal menyimpan data: " . $conn->error);
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lengkapi Data Mentor Bisnis | Entree</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="/Entree/assets/css/lengkapi_dataa.css">
</head>
<body>
    <div class="container">
        <div class="image-container">
            <img alt="Illustration of user registration" src="/Entree/assets/img/background.png" />
        </div>

        <div class="form-container">
            <h2>Lengkapi Data Anda Sebagai Mentor Bisnis</h2>
            <form method="POST" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="nama">Nama Lengkap</label>
                    <input id="nama" name="nama" type="text" value="<?= htmlspecialchars($_SESSION['displayName']) ?>" readonly />
                </div>
                <div class="form-group">
                    <label for="nik">NIK</label>
                    <input id="nik" name="nik" type="text" value="<?= htmlspecialchars($_SESSION['npm']) ?>" readonly />
                </div>
                <div class="form-group">
                    <label for="keahlian">Keahlian</label>
                    <input id="keahlian" name="keahlian" type="text" value="<?php echo htmlspecialchars($data['keahlian'] ?? ''); ?>" required />
                </div>
                <div class="form-group">
                    <label for="fakultas">Fakultas</label>
                    <select id="fakultas" name="fakultas" required>
                        <option value="">Pilih Fakultas</option>
                        <option value="ekonomi_bisnis">Fakultas Ekonomi dan Bisnis</option>
                        <option value="hukum">Fakultas Hukum</option>
                        <option value="psikologi">Fakultas Psikologi</option>
                        <option value="teknologi_informasi">Fakultas Teknologi Informasi</option>
                        <option value="kedokteran">Fakultas Kedokteran</option>
                        <option value="kedokteran_gigi">Fakultas Kedokteran Gigi</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="prodi">Program Studi</label>
                    <select id="prodi" name="prodi" required>
                        <option value="">Pilih Program Studi</option>
                    </select>
                </div>

                <script>
                    const prodiOptions = {
                        ekonomi_bisnis: ['Akuntansi', 'Manajemen'],
                        hukum: ['Hukum'],
                        psikologi: ['Psikologi'],
                        teknologi_informasi: ['Teknik Informatika', 'Perpustakaan dan Sains Informasi'],
                        kedokteran: ['Kedokteran Program Sarjana', 'Pendidikan Profesi Dokter'],
                        kedokteran_gigi: ['Kedokteran Gigi Program Sarjana', 'Kedokteran Gigi Program Profesi']
                    };

                    document.getElementById('fakultas').addEventListener('change', function() {
                        const fakultas = this.value;
                        const prodiSelect = document.getElementById('prodi');
                        
                        // Clear existing options
                        prodiSelect.innerHTML = '<option value="">Pilih Program Studi</option>';

                        // Add new options
                        if (fakultas && prodiOptions[fakultas]) {
                            prodiOptions[fakultas].forEach(function(prodi) {
                                const option = document.createElement('option');
                                option.value = prodi.toLowerCase().replace(/ /g, '_');
                                option.textContent = prodi;
                                prodiSelect.appendChild(option);
                            });
                        }
                    });
                </script>

                <div class="form-group">
                    <label for="email">Alamat Email</label>
                    <input id="email" name="email" type="text" value="<?php echo htmlspecialchars($data['email'] ?? ''); ?>" required />
                </div>
                <div class="form-group">
                    <label for="no_telepon">Nomor Telepon</label>
                    <input id="no_telepon" name="no_telepon" type="text" value="<?= htmlspecialchars($_SESSION['contact']) ?>" readonly/>
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
