<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Ambil ID dari parameter URL
$toastMessage = isset($_GET['toast']) ? $_GET['toast'] : null;
$id = isset($_GET['id']) ? $_GET['id'] : null;
$userRole = $_SESSION['role'];
$userId = $_SESSION['user_id'];

// 1. Ambil ID dari tabel mentor_bisnis
$sql_id = "SELECT id FROM mentor WHERE user_id = '$userId'";
$result_id = $conn->query($sql_id);

if (!$result_id) {
    die("Error query sql_id: " . $conn->error); // Handle error query
}

if ($result_id->num_rows > 0) {
    $row_id = $result_id->fetch_assoc();
    $id_mentor = $row_id['id']; // Ambil nilai ID mentor
}

// 2. Cek apakah id_klmpk pada jadwal berhubungan dengan kelompok bisnis yang benar dan id_mentor sesuai
$groupCheckQuery = "SELECT k.id_mentor 
                    FROM kelompok_bisnis k 
                    INNER JOIN jadwal j ON k.id_kelompok = j.id_klmpk
                    WHERE j.id = ? AND k.id_mentor = ?";
$stmt_group_check = $conn->prepare($groupCheckQuery);
$stmt_group_check->bind_param("ii", $id, $id_mentor);
$stmt_group_check->execute();
$result_group_check = $stmt_group_check->get_result();

// Jika hasil query ada, maka id_mentor pada kelompok bisnis sama dengan id_mentor yang sedang login
if ($result_group_check->num_rows > 0) {
    // ID mentor pada kelompok bisnis cocok, fitur aksi dan feedback bisa diakses
    $canTakeAction = true;
} else {
    // Tidak cocok, berarti tidak bisa menggunakan fitur aksi dan feedback
    $canTakeAction = false;
}

if ($id) {
    // Query untuk mengambil detail jadwal
    $sql = "SELECT * FROM jadwal WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    // Cek apakah data ditemukan
    if ($result->num_rows > 0) {
        $data = $result->fetch_assoc();
    } else {
        echo "Jadwal tidak ditemukan!";
        exit;
    }
} else {
    echo "ID tidak valid!";
    exit;
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/jadwal_bimbingan_mahasiswa.css">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_proposal.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'daftar_kelompok_bisnis_admin'; 
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Jadwal Bimbingan"; // Judul halaman
                    include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <div class="container mt-5">
                    <h1>Detail Jadwal</h1>
                    <table class="table table-bordered">
                        <tr>
                            <th>Nama Kegiatan</th>
                            <td><?php echo htmlspecialchars($data['nama_kegiatan']); ?></td>
                        </tr>
                        <tr>
                            <th>Tanggal</th>
                            <td><?php echo htmlspecialchars($data['tanggal']); ?></td>
                        </tr>
                        <tr>
                            <th>Waktu</th>
                            <td><?php echo htmlspecialchars($data['waktu']); ?></td>
                        </tr>
                        <tr>
                            <th>Agenda</th>
                            <td><?php echo htmlspecialchars($data['agenda']); ?></td>
                        </tr>
                        <tr>
                            <th>Lokasi</th>
                            <td><?php echo htmlspecialchars($data['lokasi']); ?></td>
                        </tr>
                        <tr>
                            <th>Status:</th>
                            <td class="file-box">
                                <?php if ($canTakeAction): ?>
                                    <div class="dropdown d-flex align-items-center">
                                        <span id="status-label" class="status me-3" 
                                            style="background-color: <?php 
                                                if ($data['status'] == 'disetujui') {
                                                    echo '#2ea56f';
                                                } elseif ($data['status'] == 'ditolak') {
                                                    echo '#dc3545';
                                                } elseif  ($data['status'] == 'selesai') {
                                                    echo '#007bff';
                                                } elseif  ($data['status'] == 'alternatif'){
                                                    echo '#ffc107';
                                                } else {
                                                    echo 'orange';
                                                }
                                            ?>;">
                                            <?php echo htmlspecialchars($data['status']); ?>
                                        </span>
                                        <tr>
                                            <th><strong>Bukti Kegiatan:</strong></td>
                                            <td class="file-box">
                                                <ul id="fileList">
                                                    <li class="file-box">
                                                        <div class="file-info">
                                                            <?php echo htmlspecialchars(basename($data['bukti_kegiatan'] ?? 'Mahasiswa Belum Mengunggah bukti kegiatan')); ?>
                                                        </div>
                                                        <?php if (!empty($data['bukti_kegiatan'])): ?>
                                                            <div class="icon-group">
                                                                <!-- Ikon Lihat File -->
                                                                <a href="/Aplikasi-Kewirausahaan/components/pages/mahasiswa/uploads/bukti_kegiatan/<?php echo basename($data['bukti_kegiatan']); ?>" 
                                                                target="_blank" 
                                                                class="detail-icon" 
                                                                data-bs-toggle="tooltip" 
                                                                data-bs-custom-class="custom-tooltip" 
                                                                data-bs-title="Lihat File">
                                                                    <i class="fa-solid fa-eye"></i>
                                                                </a>
                                                                <!-- Ikon Unduh File -->
                                                                <a href="/Aplikasi-Kewirausahaan/components/pages/mahasiswa/uploads/bukti_kegiatan/<?php echo basename($data['bukti_kegiatan']); ?>" 
                                                                download 
                                                                class="btn-icon" 
                                                                data-bs-toggle="tooltip" 
                                                                data-bs-custom-class="custom-tooltip" 
                                                                data-bs-title="Unduh File">
                                                                    <i class="fa-solid fa-download"></i>
                                                                </a>
                                                            </div>
                                                        <?php endif; ?>
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </div>
                                <?php else: ?>
                                        <span id="status-label" class="status" 
                                            style="background-color: <?php 
                                                if ($data['status'] == 'disetujui') {
                                                    echo '#2ea56f';
                                                } elseif ($data['status'] == 'ditolak') {
                                                    echo '#dc3545';
                                                } else {
                                                    echo 'orange';
                                                }
                                            ?>;">
                                            <?php echo htmlspecialchars($data['status']); ?>
                                        </span>
                                <?php endif; ?>
                            </td>
                        </tr>
                    </table>

                    <?php
                        $referer = $_SERVER['HTTP_REFERER'] ?? 'detail_kelompok.php'; // Default .php jika tidak ada referer
                    ?>
                    <a href="<?= htmlspecialchars($referer) ?>" class="btn btn-secondary">Kembali</a>
                </div>       
            </div>
    </div>
</body>
</html>
