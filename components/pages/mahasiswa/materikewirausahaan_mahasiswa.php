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
                <!-- Menghapus tombol tambah materi dan modal form tambah materi -->

                <!-- Modal Detail Materi -->
                <div id="detailModal" class="modal">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>Detail Materi Kewirausahaan</h2>
                        <p id="detailJudul"></p>
                        <p id="detailDeskripsi"></p>
                        <div class="btn_container">
                            <a id="detailFileLink" href="#" target="_blank" class="file-link">
                                <i class="fa-solid fa-eye detail-icon"></i>
                            </a>
                            <a id="detailFileLink" href="#" target="_blank" class="file-download">
                                <i class="fa-solid fa-download download-icon"></i>
                            </a>
                        </div>
                        <div id="filePreview"></div>
                    </div>
                </div>

                <!-- PHP untuk menampilkan materi -->
                <?php
                include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';
                
                $sql = "SELECT * FROM materi_kewirausahaan";
                $result = $conn->query($sql);
                
                if ($result === false) {
                    echo "<p>Error pada query: " . $conn->error . "</p>";
                } elseif ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo '<div class="container_materi" onclick="showDetailModal(\'' . $row["id"] . '\', \'' . htmlspecialchars($row["judul"]) . '\', \'' . htmlspecialchars($row["deskripsi"]) . '\', \'' . htmlspecialchars($row["file_path"]) . '\')">';
                        echo '<div class="judul_materi">' . htmlspecialchars($row["judul"]) . '</div>';
                        echo '<div class="deskripsi_materi">' 
                                . htmlspecialchars($row["deskripsi"]) . 
                                '<i class="fa-solid fa-eye detail-icon"></i> </div>';
                        echo '</div>';
                    }
                } else {
                    echo "<p>Belum ada materi ditambahkan</p>";
                }
                
                $conn->close();
                ?>

                <script>
                    var detailModal = document.getElementById("detailModal");
                    var closeBtns = document.getElementsByClassName("close-btn");

                    Array.from(closeBtns).forEach(btn => {
                        btn.onclick = function() {
                            detailModal.style.display = "none";
                        };
                    });

                    window.onclick = function(event) {
                        if (event.target == detailModal) {
                            detailModal.style.display = "none";
                        }
                    };

                    function showDetailModal(id, judul, deskripsi, filePath) {
                        document.getElementById("detailJudul").textContent = judul;
                        document.getElementById("detailDeskripsi").textContent = deskripsi;
                        document.getElementById("detailFileLink").href = filePath;
                        document.getElementById("detailModal").style.display = "block";

                        const filePreview = document.getElementById("filePreview");
                        filePreview.innerHTML = '';

                        const fileExtension = filePath.split('.').pop().toLowerCase();

                        if (fileExtension === 'pdf') {
                            filePreview.innerHTML = `<iframe src="${filePath}" width="100%" height="500px"></iframe>`;
                        } else if (['jpg', 'jpeg', 'png', 'gif'].includes(fileExtension)) {
                            filePreview.innerHTML = `<img src="${filePath}" alt="Pratinjau Gambar" class="img-fluid rounded shadow">`;
                        } else if (fileExtension === 'txt') {
                            fetch(filePath)
                                .then(response => response.text())
                                .then(text => {
                                    filePreview.innerHTML = `<pre class="border rounded p-3 bg-light">${text}</pre>`;
                                })
                                .catch(error => {
                                    filePreview.innerHTML = '<p>Gagal memuat konten teks.</p>';
                                });
                        } else if (['mp4', 'webm', 'mov', 'avi'].includes(fileExtension)) {
                            filePreview.innerHTML = `
                                <video width="100%" height="300px" controls>
                                    <source src="${filePath}" type="video/${fileExtension}">
                                    Browser Anda tidak mendukung pemutar video.
                                </video>`;
                        } else {
                            filePreview.innerHTML = '<div class="alert alert-danger">Jenis file tidak didukung untuk pratinjau.</div>';
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
