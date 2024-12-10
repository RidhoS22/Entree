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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_proposal.css">
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <?php 
            $activePage = 'laporan_bisnis_admin'; // Halaman ini aktif
            include 'sidebar_admin.php'; 
        ?>

        <!-- Main Content -->
        <div class="main">
            <!-- Header -->
            <?php 
                $pageTitle = "Detail Proposal Bisnis"; // Judul halaman
                include 'header_admin.php'; 
            ?>

            <!-- Content Wrapper -->
            <div class="main_wrapper">
                <h2>Judul Proposal</h2>
                <div class="description">
                    Deskripsi Deskripsi Deskripsi Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus
                    repudiandae temporibus laborum nemo dolore est in id vel ratione nobis.
                </div>

                <!-- Table Section -->
                <table class="styled-table">
                    <tr>
                        <td>SDG Bisnis:</td>
                        <td class="file-box">SDG Bisnis</td>
                    </tr>
                    <tr>
                        <td>Kategori Bisnis:</td>
                        <td class="file-box">Kategori Bisnis</td>
                    </tr>
                    <tr>
                        <td>File Proposal Bisnis:</td>
                        <td class="file-box"><a href="">proposal_bisnis.pdf</a></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td class="file-box">
                            <span id="status-label" class="status">Menunggu Konfirmasi</span>
                        </td>
                    </tr>
                </table>

                <!-- Feedback Section -->
                <p>Umpan Balik Dari Mentor:</p>
                <div class="feedback-box">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi molestiae adipisci necessitatibus
                        repudiandae... Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolorem, nobis. Magni ducimus repellat inventore sapiente numquam facere quasi beatae velit ea illo vero, suscipit ullam? Laudantium voluptate ex illo iure expedita minus eligendi fuga doloremque rerum. Ratione, ipsum. Suscipit velit quis animi. Voluptas earum doloribus suscipit dolorem cumque id voluptatem maiores, deserunt aliquid. Dolor reprehenderit repudiandae, porro ratione sunt animi perspiciatis vitae neque quam deserunt officia sequi, velit perferendis similique. Ut debitis, assumenda et tenetur aperiam obcaecati voluptatum, excepturi sapiente earum laboriosam eos esse magni ducimus, minus neque doloribus quod necessitatibus? Natus provident sit quaerat suscipit sunt numquam quibusdam reiciendis iste deleniti at. Corrupti odio eaque tempora magni repellat facilis quasi consequatur, assumenda reiciendis dicta harum veniam itaque labore iure commodi exercitationem beatae!</p>
                </div>
                <a href="proposal_bisnis_admin.php" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>
    <script>
        // Simulasi status (dari API atau database)
        const status = "approved"; // "approved", "rejected", atau "pending"

        // Ambil elemen status
        const statusLabel = document.getElementById("status-label");

        // Tetapkan teks dan kelas berdasarkan status
        if (status === "approved") {
            statusLabel.textContent = "Disetujui";
            statusLabel.classList.add("approved");
        } else if (status === "rejected") {
            statusLabel.textContent = "Ditolak";
            statusLabel.classList.add("rejected");
        } else if (status === "pending") {
            statusLabel.textContent = "Menunggu Konfirmasi";
            statusLabel.classList.add("pending");
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>