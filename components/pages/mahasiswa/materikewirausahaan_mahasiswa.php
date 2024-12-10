<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirausahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/mahasiswa/sidebar_mahasiswa.css">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/materikewirausahaan.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'materikewirausahaan_mahasiswa'; // Halaman ini aktif
        include 'sidebar_mahasiswa.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Materi Kewirausahaan"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">

                <!-- PHP untuk menampilkan materi -->
                <div class="card-container">
                <?php
                include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';
                
                $sql = "SELECT * FROM materi_kewirausahaan";
                $result = $conn->query($sql);
                
                if ($result === false) {
                    echo "<p>Error pada query: " . $conn->error . "</p>";
                } elseif ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $filePath = htmlspecialchars($row["file_path"]);
                        $fileExtension = pathinfo($filePath, PATHINFO_EXTENSION);

                        // Tampilkan kartu dengan pratinjau file
                        echo '
                            <a href="detail_materi_kewirausahaan.php?id=' . $row["id"] . '" >
                                <div title="Lihat Detail Materi" class="card" onclick="showDetailModal(\'' . $row["id"] . '\', \'' . htmlspecialchars($row["judul"]) . '\', \'' . htmlspecialchars($row["deskripsi"]) . '\', \'' . $filePath . '\')">
                                    <div class="card-img-top">' . generateFilePreview($filePath, $fileExtension, 200) . '</div>
                                    <div class="card-body">
                                        <h5 class="card-title">' . htmlspecialchars($row["judul"]) . '</h5>
                                        <p class="card-text">' . htmlspecialchars($row["deskripsi"]) . '</p>
                                    </div>
                                </div>
                            </a>';

                        
                    }

                    echo '</div>';
                } else {
                    echo "<p>Belum ada materi ditambahkan</p>";
                }

                $conn->close();

                // Fungsi PHP untuk pratinjau file
                function generateFilePreview($filePath, $fileExtension, $height = 200) {
                    $fileExtension = strtolower($fileExtension);

                    if (in_array($fileExtension, ['jpg', 'jpeg', 'png', 'gif'])) {
                        return '<img src="' . $filePath . '" alt="Pratinjau Gambar" class="img-fluid rounded" style="max-height:' . $height . 'px;">';
                    } elseif ($fileExtension === 'pdf') {
                        return '<iframe src="' . $filePath . '" width="100%" height="' . $height . 'px"></iframe>';
                    } elseif (in_array($fileExtension, ['mp4', 'webm', 'mov', 'avi'])) {
                        return '
                        <video width="100%" height="' . $height . 'px" controls>
                            <source src="' . $filePath . '" type="video/' . $fileExtension . '">
                            Browser Anda tidak mendukung pemutar video.
                        </video>';
                    } else {
                        return '<div class="alert alert-danger">Jenis file tidak didukung untuk pratinjau.</div>';
                    }
                }
                ?>

                <!-- Script -->
                <script>
                    // Fungsi pratinjau file
                    function generateFilePreview(filePath, fileExtension, container, height = 500) {
                        fileExtension = fileExtension.toLowerCase();
                        container.innerHTML = ""; // Reset konten sebelumnya

                        if (['jpg', 'jpeg', 'png', 'gif'].includes(fileExtension)) {
                            container.innerHTML = `<img src="${filePath}" alt="Pratinjau Gambar" class="img-fluid rounded shadow" style="max-height:${height}px;">`;
                        } else if (fileExtension === 'pdf') {
                            container.innerHTML = `<iframe src="${filePath}" width="100%" height="${height}px" style="overflow: hidden;"></iframe>`;
                        } else if (['mp4', 'webm', 'mov', 'avi'].includes(fileExtension)) {
                            container.innerHTML = `
                            <video width="100%" height="${height}px" controls>
                                <source src="${filePath}" type="video/${fileExtension}">
                                Browser Anda tidak mendukung pemutar video.
                            </video>`;
                        } else {
                            container.innerHTML = '<div class="alert alert-danger">Jenis file tidak didukung untuk pratinjau.</div>';
                        }
                    }
                </script>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>