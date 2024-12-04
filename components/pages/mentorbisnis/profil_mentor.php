<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Cek apakah pengguna sudah login
if (!isset($_SESSION['username'])) {
    header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
    exit;
}

// Ambil data mentor beserta perannya dari tabel mentor dan users
$query_mentor = "
    SELECT mentor.*, users.role AS peran 
    FROM mentor 
    JOIN users ON mentor.user_id = users.id
    WHERE users.username = ?";
$stmt = $conn->prepare($query_mentor);
$stmt->bind_param("s", $_SESSION['username']);
$stmt->execute();
$result_mentor = $stmt->get_result();

if ($result_mentor->num_rows > 0) {
    $mentor = $result_mentor->fetch_assoc();
} else {
    die("Mentor tidak ditemukan.");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil Mentor</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/profil.css">
</head>

<body>
    <div class="wrapper">
        <?php
        $activePage = 'profil_mentor'; // Halaman ini adalah Profil
        include 'sidebar_mentor.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Profil"; // Judul halaman
                    include 'header_mentor.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <button class="edit-btn" type="button">
                    <i class="fas fa-edit"></i>
                </button>
                <div class="profile-header">
                    <div class="profile-item">
                        <h2>Username</h2>
                        <p><?= htmlspecialchars($_SESSION['username']); ?></p>
                    </div>
                </div>

                <!-- Grid profile data -->
                <div class="profile-grid">
                    <div class="profile-item">
                        <h2>Nama Lengkap</h2>
                        <p><?= htmlspecialchars($mentor['nama']); ?></p>
                    </div>
                    <div class="profile-item">
                        <h2>NIDN</h2>
                        <p><?= htmlspecialchars($mentor['nidn']); ?></p>
                    </div>
                    <div class="profile-item">
                        <h2>Peran</h2>
                        <p><?= htmlspecialchars($mentor['peran']); ?></p>
                    </div>
                    <div class="profile-item">
                        <h2>Keahlian</h2>
                        <p class="skill-text"><?= htmlspecialchars($mentor['keahlian']); ?></p>
                        <input type="text" class="skill-input" style="display: none;" value="<?= htmlspecialchars($mentor['keahlian']); ?>">
                    </div>
                    <div class="profile-item">
                        <h2>Fakultas</h2>
                        <p><?= htmlspecialchars($mentor['fakultas']); ?></p>
                    </div>
                    <div class="profile-item">
                        <h2>Program Studi</h2>
                        <p><?= htmlspecialchars($mentor['prodi']); ?></p>
                    </div>
                    <div class="profile-item">
                        <h2>Alamat Email</h2>
                        <p><?= htmlspecialchars($mentor['email']); ?></p>
                    </div>
                    <div class="profile-item">
                        <h2>Nomor Telepon</h2>
                        <p class="phone-text"><?= htmlspecialchars($mentor['contact']); ?></p>
                        <input type="text" class="phone-input" style="display: none;" value="<?= htmlspecialchars($mentor['contact']); ?>">
                    </div>
                </div>

                <div class="action-buttons" style="display: none;">
                    <button class="save-btn">Simpan</button>
                    <button class="cancel-btn">Batal</button>
                </div>

            </div>

        </div>
    </div>

    <script>
    document.querySelector('.edit-btn').addEventListener('click', function () {
        // Ambil elemen terkait
        const phoneText = document.querySelector('.phone-text');
        const phoneInput = document.querySelector('.phone-input');
        const skillText = document.querySelector('.skill-text');
        const skillInput = document.querySelector('.skill-input');
        const actionButtons = document.querySelector('.action-buttons');

        // Sembunyikan teks, tampilkan input, dan tombol aksi
        phoneText.style.display = 'none';
        phoneInput.style.display = 'block';
        skillText.style.display = 'none';
        skillInput.style.display = 'block';
        actionButtons.style.display = 'flex';

        // Fokuskan input pertama
        phoneInput.focus();
    });

    // Tombol Simpan
    document.querySelector('.save-btn').addEventListener('click', function () {
        const phoneText = document.querySelector('.phone-text');
        const phoneInput = document.querySelector('.phone-input');
        const skillText = document.querySelector('.skill-text');
        const skillInput = document.querySelector('.skill-input');
        const actionButtons = document.querySelector('.action-buttons');

        // Validasi nomor telepon (10-15 digit angka)
        const newPhone = phoneInput.value.trim();
        if (!newPhone.match(/^\d{10,15}$/)) {
            alert('Nomor telepon tidak valid. Masukkan 10-15 digit angka.');
            return;
        }

        // Ambil nilai keahlian
        const newSkill = skillInput.value.trim();
        if (newSkill === '') {
            alert('Keahlian tidak boleh kosong.');
            return;
        }

        // Perbarui tampilan teks
        phoneText.textContent = newPhone || 'Belum diisi';
        skillText.textContent = newSkill || 'Belum diisi';

        // Sembunyikan input dan tombol aksi
        phoneText.style.display = 'block';
        phoneInput.style.display = 'none';
        skillText.style.display = 'block';
        skillInput.style.display = 'none';
        actionButtons.style.display = 'none';

        // Kirim data ke server menggunakan AJAX
        updateProfile(newPhone, newSkill);
    });

    // Tombol Batal
    document.querySelector('.cancel-btn').addEventListener('click', function () {
        const phoneText = document.querySelector('.phone-text');
        const phoneInput = document.querySelector('.phone-input');
        const skillText = document.querySelector('.skill-text');
        const skillInput = document.querySelector('.skill-input');
        const actionButtons = document.querySelector('.action-buttons');

        // Kembalikan nilai awal
        phoneInput.value = phoneText.textContent.trim();
        skillInput.value = skillText.textContent.trim();

        // Kembalikan tampilan awal
        phoneText.style.display = 'block';
        phoneInput.style.display = 'none';
        skillText.style.display = 'block';
        skillInput.style.display = 'none';
        actionButtons.style.display = 'none';
    });

    // Fungsi untuk kirim data ke server
    function updateProfile(phone, skill) {
        fetch('/Aplikasi-Kewirausahaan/components/pages/mentorbisnis/update_profile.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ phone: phone, skill: skill })
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message); // Tampilkan pesan sukses/gagal
        })
        .catch(error => {
            console.error('Error:', error); // Tangani error
        });
    }

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>

</html>