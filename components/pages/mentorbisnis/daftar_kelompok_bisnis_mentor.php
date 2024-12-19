<?php
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

session_start();

$sql = "SELECT * FROM kelompok_bisnis";
$result = $conn->query($sql);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_kelompok'], $_POST['nama_mentor'])) {
    $id_kelompok = $_POST['id_kelompok'];
    $nama_mentor = $_POST['nama_mentor'];

    $updateSql = "UPDATE kelompok_bisnis SET mentor_bisnis = ? WHERE id_kelompok = ?";
    $stmt = $conn->prepare($updateSql);
    $stmt->bind_param('si', $nama_mentor, $id_kelompok);

    if ($stmt->execute()) {
        $successMessage = "Mentor berhasil ditambahkan ke kelompok bisnis.";
    } else {
        $errorMessage = "Gagal menambahkan mentor: " . $conn->error;
    }
}

// Ambil kata kunci pencarian jika ada
$search = isset($_GET['search']) ? $_GET['search'] : '';

// Modifikasi query untuk mencari mentor berdasarkan nama jika ada input pencarian
$query_mentor = "
    SELECT 
        mentor.*, 
        users.role AS peran 
    FROM mentor 
    JOIN users ON mentor.user_id = users.id
    WHERE mentor.nama LIKE '%$search%'"; // Filter berdasarkan nama mentor
$result_mentor = $conn->query($query_mentor);

if (!$result_mentor) {
    die("Error: " . $conn->error);
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/daftar_kelompok.css">
    <style>
        .card-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <?php
        $activePage = 'daftar_kelompok_bisnis_mentor';
        include 'sidebar_mentor.php';
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php
                $pageTitle = "Daftar Kelompok Bisnis";
                include 'header_mentor.php';
                ?>
            </div>

            <div class="main_wrapper">
                <?php if (isset($successMessage)) { ?>
                    <div class="alert alert-success"><?php echo $successMessage; ?></div>
                <?php } elseif (isset($errorMessage)) { ?>
                    <div class="alert alert-danger"><?php echo $errorMessage; ?></div>
                <?php } ?>

                <div class="nav_main_wrapper">
                    <nav class="navbar navbar-expand-lg bg-body-tertiary">
                        <div class="container-fluid">
                            <select name="year" class="form-select filter-tahun" required>
                                <option value="" disabled selected>Pilih Tahun Akademik</option>
                                <?php
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
                                        <td>STATUS</td>
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
                            <div class="card-footer">';

                        if ($_SESSION['role'] == 'Dosen Pengampu') {
                            echo '<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#mentorModal' . $id_kelompok . '">Tambah Mentor</button>';
                        }

                        echo '<a href="detail_kelompok.php?id_kelompok=' . $id_kelompok . '">
                                <i class="fa-solid fa-eye detail-icon" title="Lihat Detail Kelompok Bisnis"></i>
                            </a>';

                        echo '</div>';
                        echo '</div>';

                        echo '<div class="modal fade" id="mentorModal' . $id_kelompok . '" tabindex="-1" aria-labelledby="mentorModalLabel' . $id_kelompok . '" aria-hidden="true">';
                        echo '<div class="modal-dialog modal-dialog-centered modal-xl">';
                        echo '<div class="modal-content">';
                        echo '<div class="modal-header">';
                        echo '<h5 class="modal-title" id="mentorModalLabel' . $id_kelompok . '">Pilih Mentor Bisnis</h5>';
                        echo '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';
                        echo '</div>';
                        echo '<div class="modal-body">';
                        echo '<form method="POST" action="">';
                        echo '<input type="hidden" name="id_kelompok" value="' . $id_kelompok . '">';

                        $mentorSql = "SELECT nama FROM mentor";
                        $mentorResult = $conn->query($mentorSql);

                        echo '<div class="mb-3">';
                        echo '<label for="mentor" class="form-label">Pilih Mentor:</label>';
                        echo '<select class="form-select" id="mentor" name="nama_mentor" required>';
                        while ($mentor = $mentorResult->fetch_assoc()) {
                            echo '<option value="' . htmlspecialchars($mentor['nama']) . '">' . htmlspecialchars($mentor['nama']) . '</option>';
                        }
                        echo '</select>';
                        echo '</div>';
                        echo '<button type="submit" class="btn btn-success">Simpan</button>';
                        echo '</form>';

                        // Query untuk mendapatkan data mentor
                        $mentorQuery = "SELECT * FROM mentor";
                        $result_mentor = $conn->query($mentorQuery);

                        echo '<form action="" method="get" class="mb-4">
                            <div class="input-group mt-4">
                                <input type="text" class="form-control" placeholder="Cari mentor..." name="search" value="' . htmlspecialchars($search) . '">
                                <button class="btn btn-success" type="submit">Cari</button>
                            </div>
                        </form>';        
                        if ($result_mentor->num_rows > 0) {
                            echo '<div class="clearfix">';
                            while ($mentor = $result_mentor->fetch_assoc()) {
                                echo '
                                <div class="accordion" id="accordionExample">
                                    <div class="card-mentor mb-3">
                                        <a data-bs-toggle="collapse" href="#collapse' . $mentor['id'] . '" role="button" 
                                            aria-expanded="false" aria-controls="collapse' . $mentor['id'] . '">
                                            <div class="card-mentor-header">
                                                <img alt="Profile picture of the mentor" class="w-12 h-12 rounded-full me-2" height="50" 
                                                src="' . htmlspecialchars($mentor['foto_profile']) . '" width="50"/>
                                                <div>
                                                    <h2 class="font-bold mb-0">' . htmlspecialchars($mentor['nama']) . '</h2>
                                                    <p class="mb-0">Peran: ' . htmlspecialchars($mentor['peran'] ?? 'Belum ada peran') . '</p>
                                                </div>
                                                <div class="klik d-flex flex-column align-items-center">
                                                    <span class="toggle-text" id="toggle-text-' . $mentor['id'] . '">
                                                        Klik untuk melihat detail data mentor
                                                    </span>
                                                    <i class="fa-solid fa-caret-down"></i>
                                                </div>
                                            </div>
                                        </a>
                                        <div id="collapse' . $mentor['id'] . '" class="collapse" data-bs-parent="#accordionExample">
                                            <div class="card-mentor-body">
                                                <p>NIDN: ' . htmlspecialchars($mentor['nidn']) . '</p>
                                                <p>Keahlian: ' . htmlspecialchars($mentor['keahlian']) . '</p>
                                                <p>Fakultas: ' . htmlspecialchars($mentor['fakultas']) . '</p>
                                                <p>Prodi: ' . htmlspecialchars($mentor['prodi']) . '</p>
                                                <p>Email: ' . htmlspecialchars($mentor['email']) . '</p>
                                                <p>Nomor Telepon: ' . htmlspecialchars($mentor['contact']) . '</p>
                        
                                                <button type="submit" class="btn btn-success mt-2">Pilih sebagai Mentor</button>
                        
                                            </div>
                                        </div>
                                    </div>
                                </div>';
                            }
                            echo '</div>';
                        } else {
                            echo '<p>Tidak ada mentor yang ditemukan.</p>';
                        }
                        
                        echo '</div>';
                        echo '</div>';
                        echo '</div>';
                        echo '</div>';
                    }
                } else {
                    echo '<p>Tidak ada kelompok bisnis yang tersedia.</p>';
                }
                ?>
            </div>
        </div>
    </div>
     <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Pilih semua elemen collapse yang digunakan
            const collapses = document.querySelectorAll('.collapse');

            collapses.forEach(function (collapse) {
                collapse.addEventListener('show.bs.collapse', function () {
                    const mentorId = this.id.replace('collapse', '');
                    const toggleText = document.getElementById('toggle-text-' + mentorId);
                    const caretIcon = toggleText.nextElementSibling; // Mengambil ikon setelah span
                    
                    if (toggleText) {
                        toggleText.style.display = 'none'; // Hilangkan teks
                    }
                    if (caretIcon) {
                        caretIcon.style.display = 'none'; // Hilangkan ikon
                    }
                });

                collapse.addEventListener('hide.bs.collapse', function () {
                    const mentorId = this.id.replace('collapse', '');
                    const toggleText = document.getElementById('toggle-text-' + mentorId);
                    const caretIcon = toggleText.nextElementSibling; // Mengambil ikon setelah span

                    if (toggleText) {
                        toggleText.style.display = 'inline'; // Tampilkan teks
                    }
                    if (caretIcon) {
                        caretIcon.style.display = 'inline'; // Tampilkan ikon
                    }
                });
            });
        });

    </script>
    <script>

        const dropdownButton = document.getElementById("dropdownMenuButton");
        const dropdownItems = document.querySelectorAll(".dropdown-item");

        dropdownItems.forEach(item => {
            item.addEventListener("click", function(event) {
                event.preventDefault();

                const selectedText = this.textContent;
                const selectedClass = this.getAttribute("data-status");

                dropdownButton.classList.remove("btn-secondary", "btn-success", "btn-warning", "btn-info");

                dropdownButton.classList.add(selectedClass);

                dropdownButton.textContent = selectedText;
            });
        });
    </script>
    
</body>

</html>

<?php
$conn->close();
?>