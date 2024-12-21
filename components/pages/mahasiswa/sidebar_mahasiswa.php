<?php
// Mulai session jika belum dimulai
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Ambil data pengguna yang sedang login
$npm = $_SESSION['npm'];  // Pastikan npm sudah diset dalam session

// Query untuk memeriksa apakah pengguna sudah menjadi ketua atau anggota dalam kelompok
$cekKelompokQuery = "
    SELECT k.id_kelompok, k.npm_ketua, a.npm_anggota
    FROM kelompok_bisnis k
    LEFT JOIN anggota_kelompok a ON a.id_kelompok = k.id_kelompok
    WHERE k.npm_ketua = '$npm' OR a.npm_anggota = '$npm'
";
$cekKelompokResult = mysqli_query($conn, $cekKelompokQuery);

// Jika pengguna sudah menjadi ketua atau anggota dalam kelompok
$kelompokStatus = mysqli_num_rows($cekKelompokResult) > 0 ? true : false;

// Inisialisasi variabel proposalApproved
$proposalApproved = false;

// Query untuk memeriksa status proposal
$cekProposalQuery = "
    SELECT COUNT(*) AS jumlah_disetujui
    FROM proposal_bisnis p
    LEFT JOIN kelompok_bisnis k ON p.kelompok_id = k.id_kelompok
    LEFT JOIN anggota_kelompok a ON a.id_kelompok = k.id_kelompok
    WHERE (k.npm_ketua = '$npm' OR a.npm_anggota = '$npm') AND p.status = 'disetujui';
";

$cekProposalResult = mysqli_query($conn, $cekProposalQuery);
$proposalApproved = false;

if ($cekProposalResult && mysqli_num_rows($cekProposalResult) > 0) {
    $proposalData = mysqli_fetch_assoc($cekProposalResult);
    $proposalApproved = $proposalData['jumlah_disetujui'] > 0;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirusahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/sidebar.css">
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
                    <img src="\Aplikasi-Kewirausahaan\assets\img\Frame 64 1.png" alt="">
                </div>
            </div>
            <ul class="sidebar-nav">
                <li class="sidebar-item <?php echo ($activePage == 'profil') ? 'active' : ''; ?>">
                    <a href="profil_mahasiswa.php" class="sidebar-link">
                        <i class="fa-solid fa-user"></i>
                        <span>Profil</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'pagemahasiswa') ? 'active' : ''; ?>">
                    <a href="pagemahasiswa.php" class="sidebar-link">
                        <i class="fa-solid fa-house"></i>
                        <span>Beranda</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'materikewirausahaan_mahasiswa') ? 'active' : ''; ?>">
                    <a href="materikewirausahaan_mahasiswa.php" class="sidebar-link">
                        <i class="fa-solid fa-book"></i>
                        <span>Materi Kewirausahaan</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'daftar_mentor_mahasiswa') ? 'active' : ''; ?>">
                    <a href="daftar_mentor_mahasiswa.php" class="sidebar-link">
                        <i class="fa-solid fa-address-card"></i>  
                        <span>Daftar Mentor Bisnis</span>
                    </a>
                </li>
                <hr>
                <li class="sidebar-header">
                    <h1>Mahasiswa</h1>
                </li>
                <li class="sidebar-item <?php echo ($activePage == 'kelompok_bisnis_mahasiswa') ? 'active' : ''; ?>">
                    <a href="kelompok_bisnis_mahasiswa.php" class="sidebar-link">
                        <i class="fa-solid fa-users"></i>
                        <span>Kelompok Bisnis</span>
                    </a>
                </li>

                <!-- Sidebar -->
                <?php if ($kelompokStatus): ?>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                    data-bs-target="#kelola_bisnis_kelompok" aria-expanded="false" aria-controls="kelola_bisnis_kelompok">
                        <i class="fa-solid fa-user-pen"></i>
                        <span>Kelola Bisnis</span>
                    </a>
                    <ul id="kelola_bisnis_kelompok" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item <?php echo ($activePage == 'proposal_bisnis_mahasiswa') ? 'active' : ''; ?>">
                            <a href="proposal_bisnis_mahasiswa.php" class="sidebar-link">
                                <i class="fa-regular fa-file"></i>
                                Proposal Bisnis
                            </a>
                        </li>
                        <?php if ($proposalApproved): ?>
                        <li class="sidebar-item <?php echo ($activePage == 'laporan_bisnis_mahasiswa') ? 'active' : ''; ?>">
                            <a href="laporan_bisnis_mahasiswa.php" class="sidebar-link">
                                <i class="fa-solid fa-file-invoice"></i>    
                                Laporan Kemajuan Bisnis
                            </a>
                        </li>
                        <?php endif; ?>
                        <li class="sidebar-item <?php echo ($activePage == 'jadwal_bimbingan_mahasiswa') ? 'active' : ''; ?>">
                            <a href="jadwal_bimbingan_mahasiswa.php" class="sidebar-link">
                                <i class="fa-solid fa-calendar"></i>
                                Jadwal Bimbingan
                            </a>
                        </li>
                    </ul>
                </li>
                <?php endif; ?>

                <li class="sidebar-item sign-out">
                    <a href="javascript:void(0);" class="sidebar-link" id="logoutLink">
                        <i class="fa-solid fa-sign-out"></i>
                        <span>Keluar</span>
                    </a>
                </li>

                <script>
                    document.getElementById('logoutLink').addEventListener('click', function() {
                        // Kirim permintaan logout ke backend
                        const xhr = new XMLHttpRequest();
                        xhr.open('POST', '/Aplikasi-Kewirausahaan/components/pages/logout.php', true);
                        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                        xhr.onload = function() {
                            if (xhr.status === 200) {
                                // Jika berhasil, arahkan ke halaman login
                                window.location.href = '/Aplikasi-Kewirausahaan/components/pages/startdashboard/dashboardawal.php';
                            } else {
                                alert('Terjadi kesalahan saat logout.');
                            }
                        };
                        xhr.send('logout=true');
                    });
                </script>                
            </ul>
        </aside>
    </div>

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
