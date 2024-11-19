<?php
// Koneksi ke database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Ambil ID dari parameter URL
$id = isset($_GET['id']) ? $_GET['id'] : null;

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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Jadwal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
                <th>Deskripsi</th>
                <td><?php echo htmlspecialchars($data['deskripsi']); ?></td>
            </tr>
            <tr>
                <th>Lokasi</th>
                <td><?php echo htmlspecialchars($data['lokasi']); ?></td>
            </tr>
            <tr>
                <th>Status</th>
                <td><?php echo isset($data['status']) ? htmlspecialchars($data['status']) : 'N/A'; ?></td>
            </tr>
        </table>
        <a href="jadwal_bimbingan_mahasiswa.php" class="btn btn-secondary">Kembali</a>
    </div>
</body>
</html>
