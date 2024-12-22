<?php
// Mengimpor koneksi database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mendapatkan ID kelompok dari parameter URL
$id_kelompok = isset($_GET['id_kelompok']) ? $_GET['id_kelompok'] : null;

if ($id_kelompok) {
    // Mengambil data proposal bisnis yang terkait dengan kelompok yang login
    $sql = "SELECT * FROM proposal_bisnis WHERE kelompok_id = $id_kelompok";
    $result = $conn->query($sql);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirausahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/proposal_bisnis.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'proposal_bisnis_admin'; // Halaman ini aktif
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Proposal Bisnis Kewirausahaan"; // Judul halaman
                    include 'header_admin.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <!-- Menampilkan proposal bisnis dalam bentuk card -->
                <div class="card-container">
                    <?php
                    // Memeriksa apakah ada data proposal yang diambil dari database
                    if ($result && mysqli_num_rows($result) > 0) {
                        while ($proposal = mysqli_fetch_assoc($result)) {
                            // Ambil id untuk URL
                            $id = $proposal['id'];
                            ?>
                            <div class="card" style="width: 33%; margin: 10px;">
                                <div class="card-icon text-center py-4">
                                    <img src="\Aplikasi-Kewirausahaan\assets\img\document-file_6424455.png" alt="Dokumen" style="width: 50px; height: 50px;">
                                </div>
                                <div class="card-body m-0">
                                    <h5 class="card-title"><?php echo htmlspecialchars($proposal['judul_proposal']); ?></h5>
                                </div>
                                <table class="table table-bordered m-0 styled-table">
                                    <tbody>
                                        <tr>
                                            <td>Status Proposal Bisnis</td>
                                            <td>
                                                <span id="status-label" class="status" 
                                                    style="background-color: <?php 
                                                        if ($proposal['status'] == 'disetujui') {
                                                            echo '#2ea56f';
                                                        } elseif ($proposal['status'] == 'ditolak') {
                                                            echo '#dc3545';
                                                        } else {
                                                            echo 'orange';
                                                        }
                                                    ?>; padding: 5px 10px; border-radius: 3px;">
                                                    <?php echo htmlspecialchars($proposal['status']); ?>            
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="card-footer">
                                <a href="detail_proposal_bisnis_admin.php?id=<?php echo $id; ?>&id_kelompok=<?php echo $id_kelompok; ?>">
                                    <i class="fa-solid fa-eye detail-icon" title="Lihat Detail Proposal Bisnis"></i>
                                </a>
                                </div>
                            </div>

                            <?php
                        }
                    } else {
                        echo "<p>No proposals found for this group.</p>";
                    }
                    ?>
                </div>
                <div class="mt-3" onclick="window.location.href='detail_kelompok.php?id_kelompok=<?php echo $id_kelompok; ?>'" title="Kembali ke Detail Kelompok Bisnis">
                <!-- Tombol dengan ukuran lebih kecil dan penataan posisi di tengah -->
                    <button class="btn btn-secondary mt-3">Kembali ke Detail Kelompok Bisnis</button>
                </div>
            </div>  
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag@3.1.0/dist/js/multi-select-tag.js"></script>
    <script>
        new MultiSelectTag('sdg', {
        rounded: true,    // default true
        placeholder: 'Search',  // default Search...
        tagColor: {
            textColor: '#327b2c',
            borderColor: '#92e681',
            bgColor: '#eaffe6',
        },
        onChange: function(values) {
            console.log(values)
        }
    })
    </script>
</body>

</html>

<?php
// Menutup koneksi database
mysqli_close($conn);
?> 