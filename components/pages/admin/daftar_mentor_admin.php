<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

if (!isset($_SESSION['username'])) {
    header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
    exit;
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
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Mentor Bisnis</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>

<body>
    <div class="wrapper">
        <?php
        $activePage = 'daftar_mentor_admin'; // Halaman ini aktif
        include 'sidebar_admin.php';
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php
                $pageTitle = "Daftar Mentor Bisnis"; // Judul halaman
                include 'header_admin.php';
                ?>
            </div>
            <div class="main_wrapper">
                <form action="" method="get" class="mb-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Cari mentor..." name="search" value="<?= htmlspecialchars($search); ?>">
                        <button class="btn btn-primary" type="submit">Cari</button>
                    </div>
                </form>
                
                <div class="grid grid-cols-3 gap-8">
                    <?php while ($mentor = $result_mentor->fetch_assoc()) : ?>
                        <div class="bg-white p-4 rounded-lg shadow-md">
                            <div class="flex items-center mb-4">
                                <img alt="Profile picture of the mentor" class="w-12 h-12 rounded-full" height="50" src="https://storage.googleapis.com/a1aa/image/60LA1xO6dyL2LFetVAwefJrBSFz6yOaTM9L4lgigtC4peNTPB.jpg" width="50"/>
                            </div>
                            <div class="text-gray-800">
                                <p class="font-bold">Nama: <?= htmlspecialchars($mentor['nama']); ?></p>
                                <p>NIDN: <?= htmlspecialchars($mentor['nidn']); ?></p>
                                <p>Peran: <?= htmlspecialchars($mentor['peran']); ?></p>
                                <p>Keahlian: <?= htmlspecialchars($mentor['keahlian']); ?></p>
                                <p>Fakultas: <?= htmlspecialchars($mentor['fakultas']); ?></p>
                                <p>Prodi: <?= htmlspecialchars($mentor['prodi']); ?></p>
                                <p>Email: <?= htmlspecialchars($mentor['email']); ?></p>
                                <p>Nomor Telepon: <?= htmlspecialchars($mentor['contact']); ?></p>
                            </div>
                            <form action="update_role.php" method="POST">
                                <input type="hidden" name="mentor_id" value="<?= $mentor['id']; ?>">
                                <?php if ($mentor['peran'] === 'Tutor') : ?>
                                    <button name="action" value="naik" class="items-center mt-4 text-white py-2 px-4 rounded"
                                        style="background-color: #2ea56f;">
                                        Naikkan Role
                                    </button>
                                <?php elseif ($mentor['peran'] === 'Dosen Pengampu') : ?>
                                    <button name="action" value="turun" class="items-center mt-4 text-white py-2 px-4 rounded"
                                        style="background-color: #e74c3c;">
                                        Turunkan Role
                                    </button>
                                <?php endif; ?>
                            </form>
                        </div>
                    <?php endwhile; ?>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>

</html>
