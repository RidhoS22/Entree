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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mentorbisnis/daftar_kelompok_bisnis_mentor.css">
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

                <?php
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $id_kelompok = $row['id_kelompok'];
                        echo '<div class="card">';
                        echo '<div class="card-header">';
                        echo '<h2>' . htmlspecialchars($row['nama_kelompok']) . '</h2>';
                        echo '</div>';
                        echo '<a href="detail_kelompok.php?id_kelompok=' . $id_kelompok . '">';
                        echo '<div class="card-body">';
                        echo '<p>' . htmlspecialchars($row['ide_bisnis']) . '</p>';
                        echo '<i class="fa-solid fa-eye detail-icon"></i>';
                        echo '</div>';
                        echo '</a>';
                        echo '<div class="card-footer">';
                        echo '<a href="detail_kelompok.php?id_kelompok=' . $id_kelompok . '">Lihat Detail Kelompok Bisnis</a>';

                        if ($_SESSION['role'] == 'Dosen Pengampu') {
                            echo '<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mentorModal' . $id_kelompok . '">Tambah Mentor</button>';
                        }

                        echo '</div>';
                        echo '</div>';

                        echo '<div class="modal fade" id="mentorModal' . $id_kelompok . '" tabindex="-1" aria-labelledby="mentorModalLabel' . $id_kelompok . '" aria-hidden="true">';
                        echo '<div class="modal-dialog">';
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
</body>

</html>

<?php
$conn->close();
?>
