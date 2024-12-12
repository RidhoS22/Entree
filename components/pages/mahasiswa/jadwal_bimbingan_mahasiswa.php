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
                $activePage = 'jadwal_bimbingan_mahasiswa'; // Halaman ini adalah Profil
                include 'sidebar_mahasiswa.php'; 
                ?>

                <div class="main p-3">
                    <div class="main_header">
                        <?php 
                            $pageTitle = "Jadwal Bimbingan"; // Judul halaman
                            include 'header_mahasiswa.php'; 
                        ?>
                    </div>

                <div class="main_wrapper">
                    <div class="container mt-4">
                        <?php
                        include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

                        // Tambahkan jadwal baru atau perbarui jadwal yang ada
                        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                            $nama_kegiatan = $_POST['nama_kegiatan'];
                            $tanggal = $_POST['tanggal'];
                            $waktu = $_POST['waktu'];
                            $agenda = $_POST['agenda'];
                            $lokasi = $_POST['lokasi'];
                            $id = isset($_POST['id']) ? $_POST['id'] : null;

                            if ($id) {
                                // Update jadwal
                                $sql = "UPDATE jadwal SET nama_kegiatan = ?, tanggal = ?, waktu = ?, agenda = ?, lokasi = ? WHERE id = ?";
                                $stmt = $conn->prepare($sql);
                                $stmt->bind_param("sssssi", $nama_kegiatan, $tanggal, $waktu, $agenda, $lokasi, $id);
                                $message = $stmt->execute() ? "Jadwal berhasil diperbarui!" : "Gagal memperbarui jadwal.";
                            } else {
                                // Tambah jadwal baru
                                $sql = "INSERT INTO jadwal (nama_kegiatan, tanggal, waktu, agenda, lokasi) VALUES (?, ?, ?, ?, ?)";
                                $stmt = $conn->prepare($sql);
                                $stmt->bind_param("sssss", $nama_kegiatan, $tanggal, $waktu, $agenda, $lokasi);
                                $message = $stmt->execute() ? "Jadwal berhasil ditambahkan!" : "Gagal menambahkan jadwal.";

                            }
                            
                            echo "<script>window.location='jadwal_bimbingan_mahasiswa.php';</script>";
                            echo "<div class='alert alert-info'>$message</div>";
                            $stmt->close();
                        }

                        // Hapus jadwal berdasarkan ID
                        if (isset($_GET['delete_id'])) {
                            $delete_id = $_GET['delete_id'];
                            $sql_delete = "DELETE FROM jadwal WHERE id = ?";
                            $stmt = $conn->prepare($sql_delete);
                            $stmt->bind_param("i", $delete_id);
                            $message = $stmt->execute() ? "Jadwal berhasil dihapus!" : "Gagal menghapus jadwal.";
                            echo "<script>window.location='jadwal_bimbingan_mahasiswa.php';</script>";
                            echo "<div class='alert alert-info'>$message</div>";
                            $stmt->close();
                        }

                        // Ambil data untuk diedit
                        $edit_data = null;
                        if (isset($_GET['edit_id'])) {
                            $edit_id = $_GET['edit_id'];
                            $sql_edit = "SELECT * FROM jadwal WHERE id = ?";
                            $stmt = $conn->prepare($sql_edit);
                            $stmt->bind_param("i", $edit_id);
                            $stmt->execute();
                            $result = $stmt->get_result();
                            $edit_data = $result->fetch_assoc();
                            $stmt->close();
                        }

                        // Ambil semua jadwal
                        $sql = "SELECT * FROM jadwal ORDER BY tanggal, waktu";
                        $result = $conn->query($sql);
                        ?>

                        <h2><?php echo isset($edit_data) ? "Edit Jadwal" : "Tambah Jadwal"; ?></h2>
                        <form action="" method="post">
                            <input type="hidden" name="id" value="<?php echo isset($edit_data['id']) ? $edit_data['id'] : ''; ?>">
                            <div class="mb-3">
                                <label for="nama_kegiatan" class="form-label">Nama Kegiatan</label>
                                <input type="text" name="nama_kegiatan" id="nama_kegiatan" class="form-control" required
                                    value="<?php echo isset($edit_data['nama_kegiatan']) ? $edit_data['nama_kegiatan'] : ''; ?>">
                            </div>
                            <div class="mb-3">
                                <label for="tanggal" class="form-label">Tanggal</label>
                                <input type="date" name="tanggal" id="tanggal" class="form-control" required
                                    value="<?php echo isset($edit_data['tanggal']) ? $edit_data['tanggal'] : ''; ?>">
                            </div>
                            <div class="mb-3">
                                <label for="waktu" class="form-label">Waktu</label>
                                <input type="time" name="waktu" id="waktu" class="form-control" required
                                    value="<?php echo isset($edit_data['waktu']) ? $edit_data['waktu'] : ''; ?>">
                            </div>
                            <div class="mb-3">
                                <label for="agenda" class="form-label">agenda</label>
                                <textarea name="agenda" id="agenda" class="form-control"><?php echo isset($edit_data['agenda']) ? $edit_data['agenda'] : ''; ?></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="lokasi" class="form-label">Lokasi</label>
                                <input type="text" name="lokasi" id="lokasi" class="form-control"
                                    value="<?php echo isset($edit_data['lokasi']) ? $edit_data['lokasi'] : ''; ?>">
                            </div>
                            <button type="submit" class="btn btn-primary"><?php echo isset($edit_data) ? "Perbarui" : "Simpan"; ?></button>
                            <?php if ($edit_data): ?>
                                <a href="jadwal_bimbingan_mahasiswa.php" class="btn btn-secondary">Batal</a>
                            <?php endif; ?>
                        </form>
                        <hr>

                        <h2>Daftar Jadwal</h2>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No</th>
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
                                                <a href="?edit_id=<?php echo $row['id']; ?>" class="btn btn-warning btn-sm">
                                                    <i class="fas fa-edit" title="Edit Jadwal Bimbingan"></i> 
                                                </a>
                                                <a href="#" class="btn btn-danger btn-sm" 
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#deleteConfirmModal"
                                                    onclick="setDeleteUrl(<?php echo $row['id']; ?>)">
                                                    <i class="fa-solid fa-trash-can" title="Hapus Jadwal Bimbingan"></i> 
                                                </a>
                                                <a href="detail_jadwal_mahasiswa.php?id=<?php echo $row['id']; ?>" class="btn btn-info btn-sm">
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

                    <!-- Modal Konfirmasi -->
                    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteConfirmLabel">Konfirmasi Hapus</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Apakah Anda yakin ingin menghapus jadwal ini?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tidak</button>
                                    <a href="#" id="confirmDeleteBtn" class="btn btn-danger">Ya, Hapus</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

    </div>
        <script>
    // Fungsi untuk menetapkan URL hapus ke tombol modal
    function setDeleteUrl(id) {
        const deleteUrl = `?delete_id=${id}`; // URL dengan parameter ID
        const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
        confirmDeleteBtn.setAttribute('href', deleteUrl); // Set URL pada tombol modal
    }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>