<?php
// Mengimpor koneksi database
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Query untuk mengambil data kelompok bisnis
$sql = "SELECT * FROM kelompok_bisnis";
$result = $conn->query($sql);
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/daftar_kelompok.css">
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
                    $pageTitle = "Daftar Kelompok Bisnis"; 
                    include 'header_admin.php'; 
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
                                    <li><a class="dropdown-item" href="#" data-status="btn-secondary">Semua Kelompok</a></li>
                                    <li><a class="dropdown-item" href="#" data-status="btn-success">Direkomendasi</a></li>
                                    <li><a class="dropdown-item" href="#" data-status="btn-info">Kelompok Inkubasi</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
                            
                <?php
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $id_kelompok = $row['id_kelompok'];
                        echo '
                        <div class="card" style="width: 45%; margin: 10px;">
                            <div class="card-icon text-center py-4">
                                <i class="fa-solid fa-users"></i>
                            </div>
                            <div class="card-body m-0">
                                <h5 class="card-title">Kelompok ' . htmlspecialchars($row['nama_kelompok']) . '</h5>
                            </div>
                            <table class="table table-bordered m-0 styled-table">
                                <tbody>
                                    <tr>
                                        <td>Mentor Bisnis</td>
                                        <td>Bapak LALA</td>
                                    </tr>
                                    <tr>
                                        <td>Status Proposal Bisnis</td>
                                        <td>STATUS</td>
                                    </tr>
                                    <tr>
                                        <td>Program Inkubasi Bisnis</td>
                                        <td>STATUS</td>

                                    </tr>
                                </tbody>
                            </table>
                            <div class="card-footer">
                                <a href="detail_kelompok.php?id_kelompok=' . $id_kelompok . '">
                                    <i class="fa-solid fa-eye detail-icon" title="Lihat Detail Kelompok Bisnis"></i>
                                </a>
                            </div> 
                        </div>';
                    }
                } else {
                    echo '<p>Tidak ada kelompok bisnis yang tersedia.</p>';
                }
                ?>
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

<?php
// Menutup koneksi database
$conn->close();
?>
