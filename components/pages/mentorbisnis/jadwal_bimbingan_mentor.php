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
</head>

<body>
    <div class="wrapper">
   
                <?php 
                $activePage = 'jadwal_bimbingan_mentor'; // Halaman ini adalah Profil
                include 'sidebar_mentor.php'; 
                ?>

                <div class="main p-3">
                    <div class="main_header">
                        <?php 
                            $pageTitle = "Jadwal Bimbingan"; // Judul halaman
                            include 'header_mentor.php'; 
                        ?>
                    </div>

                <div class="main_wrapper">
                    <div class="container mt-4">
                        <?php
                        include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

                        // Ambil semua jadwal
                        $sql = "SELECT * FROM jadwal ORDER BY tanggal, waktu";
                        $result = $conn->query($sql);
                        ?>

                        <h2>Daftar Jadwal</h2>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama Kelompok</th>
                                    <th>Nama Kegiatan</th>
                                    <th>Tanggal</th>
                                    <th>Waktu</th>
                                    <th>Lokasi</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if ($result->num_rows > 0): ?>
                                    <?php $no = 1; ?>
                                    <?php while ($row = $result->fetch_assoc()): ?>
                                        <tr>
                                            <td><?php echo $no++; ?></td>
                                            <td>ArTECH</td>
                                            <td><?php echo htmlspecialchars($row['nama_kegiatan']); ?></td>
                                            <td><?php echo htmlspecialchars($row['tanggal']); ?></td>
                                            <td><?php echo htmlspecialchars($row['waktu']); ?></td>
                                            <td><?php echo htmlspecialchars($row['lokasi']); ?></td>
                                            <td><?php echo isset($row['status']) ? htmlspecialchars($row['status']) : 'N/A'; ?></td>
                                            <td>
                                                <a href="detail_jadwal_mentor.php?id=<?php echo $row['id']; ?>" class="btn btn-info btn-sm">
                                                    <i class="fa-solid fa-eye" title="Lihat Detail Jadwal Bimbingan"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    <?php endwhile; ?>
                                <?php else: ?>
                                    <tr>
                                        <td colspan="8">Tidak ada jadwal tersedia.</td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                    
                </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>