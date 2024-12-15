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
                                <option value="" disabled selected>Pilih Tahun</option>
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

                                 <!-- Tombol Awal -->
                            <button type="button" class="btn btn-secondary text-white btn-pi" id="myButton">Program Inkubasi</button>

                            <script>
                                // Ambil referensi tombol dengan ID
                                const button = document.getElementById("myButton");

                                // Tambahkan event listener untuk klik tombol
                                button.addEventListener("click", function() {
                                    // Periksa apakah tombol memiliki kelas 'btn-secondary'
                                    if (button.classList.contains("btn-secondary")) {
                                        // Jika iya, ubah ke kelas 'btn-success'
                                        button.classList.remove("btn-secondary");
                                        button.classList.add("btn-success");
                                        button.textContent = "Program Inkubasi";
                                    } else {
                                        // Jika tidak, kembalikan ke kelas 'btn-secondary'
                                        button.classList.remove("btn-success");
                                        button.classList.add("btn-secondary");
                                        button.textContent = "Program Inkubasi";
                                    }
                                });
                            </script>
                        </div>
                    </nav>
                </div>
                
                <?php
                // Cek apakah ada data kelompok bisnis
                if ($result->num_rows > 0) {
                    // Menampilkan data kelompok bisnis
                    while($row = $result->fetch_assoc()) {
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
                            </div>
                        ';
                    }
                } else {
                    echo '<p>Tidak ada kelompok bisnis yang tersedia.</p>';
                }
                ?>
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

<?php
// Menutup koneksi database
$conn->close();
?>
