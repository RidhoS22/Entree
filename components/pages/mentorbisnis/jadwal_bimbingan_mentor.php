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
                    <div class="nav_main_wrapper">
                        <nav class="navbar navbar-expand-lg bg-body-tertiary">
                            <div class="container-fluid">
                                <select name="year" class="form-select filter-tahun" required>
                                    <option value="" disabled selected>Pilih Tahun Akademik</option>
                                    <?php
                                    // Membuat dropdown tahun dari 2000 hingga tahun sekarang
                                    $currentYear = date('Y');
                                    for ($i = 2010; $i <= $currentYear; $i++) {
                                        echo "<option value='$i'>$i</option>";
                                    }
                                    ?>
                                </select>
                                <form class="d-flex" role="search">
                                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>

                            <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle text-white" type="button" 
                                            id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                        Semua Kelompok
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <li><a class="dropdown-item" href="#" data-status="btn-warning">Menunggu</a></li>
                                        <li><a class="dropdown-item" href="#" data-status="btn-success">Disetujui</a></li>
                                        <li><a class="dropdown-item" href="#" data-status="btn-info">Selesai</a></li>
                                    </ul>
                                </div>
                            </div>

                            <!-- Tombol untuk Membuka Modal -->
                            <button type="button" class="btn btn-success btn-tambah" data-bs-toggle="modal" data-bs-target="#altScheduleModal">
                                Tambah Jadwal Bimbingan
                            </button>

                            <!-- Modal Jadwal Alternatif -->
                            <div class="modal fade" id="altScheduleModal" tabindex="-1" aria-labelledby="altScheduleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="altScheduleModalLabel">Tambah Jadwal Bimbingan</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="submit_alternative_schedule.php" method="POST">
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <label for="altGroupInput" class="form-label">Pilih Kelompok:</label>
                                                    <select class="form-select" id="altGroupInput" name="alt_group" required>
                                                        <option value="" disabled selected>Pilih kelompok</option>
                                                        <option value="Kelompok 1">Kelompok 1</option>
                                                        <option value="Kelompok 2">Kelompok 2</option>
                                                        <option value="Kelompok 3">Kelompok 3</option>
                                                        <option value="Kelompok 4">Kelompok 4</option>
                                                    </select>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="nama_kegiatan" class="form-label">Nama Kegiatan</label>
                                                    <input type="text" name="nama_kegiatan" id="nama_kegiatan" class="form-control" required
                                                        value="<?php echo isset($edit_data['nama_kegiatan']) ? $edit_data['nama_kegiatan'] : ''; ?>">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="altDateInput" class="form-label">Tanggal:</label>
                                                    <input type="date" class="form-control" id="altDateInput" name="alt_date" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="altTimeInput" class="form-label">Waktu:</label>
                                                    <input type="time" class="form-control" id="altTimeInput" name="alt_time" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="agenda" class="form-label">agenda</label>
                                                    <textarea name="agenda" id="agenda" class="form-control"><?php echo isset($edit_data['agenda']) ? $edit_data['agenda'] : ''; ?></textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="altLocationInput" class="form-label">Lokasi:</label>
                                                    <input type="text" class="form-control" id="altLocationInput" name="alt_location" placeholder="Masukkan lokasi" required>
                                                </div>
                                                <input type="hidden" name="jadwal_id" value="<?php echo htmlspecialchars($id); ?>">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary btn-cancel" data-bs-dismiss="modal">Batal</button>
                                                <button type="submit" class="btn btn-success btn-submit">Buat Jadwal</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                        </nav>
                    </div>

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
                                            <td>
                                                <span id="status-label" class="status" 
                                                    style="background-color: <?php 
                                                        if ($row['status'] == 'disetujui') {
                                                            echo '#2ea56f';
                                                        } elseif ($row['status'] == 'ditolak') {
                                                            echo '#dc3545';
                                                        } else {
                                                            echo 'orange';
                                                        }
                                                    ?>;">
                                                    <?php echo htmlspecialchars($row['status']); ?>
                                                </span>
                                            </td>
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
    <script>
        const dropdownButton = document.getElementById("dropdownMenuButton");
        const dropdownItems = document.querySelectorAll(".dropdown-item");

        // Tambahkan event listener untuk setiap item di dropdown
        dropdownItems.forEach(item => {
            item.addEventListener("click", function(event) {
                event.preventDefault(); // Mencegah link default

                // Ambil teks dan status warna dari atribut data-status
                const selectedText = this.textContent;
                const selectedClass = this.getAttribute("data-status");

                // Reset semua kelas warna tombol
                dropdownButton.classList.remove("btn-secondary", "btn-success", "btn-warning", "btn-info");

                // Tambahkan kelas warna sesuai pilihan
                dropdownButton.classList.add(selectedClass);

                // Ubah teks tombol sesuai pilihan dropdown
                dropdownButton.textContent = selectedText;
            });
        });
    </script>
</body>

</html>