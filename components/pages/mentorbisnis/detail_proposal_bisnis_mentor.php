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
        $activePage = 'proposal_bisnis_mentor'; // Halaman ini aktif
        include 'sidebar_mentor.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Proposal Bisnis Kewirausahaan"; // Judul halaman
                    include 'header_mentor.php'; 
                ?>
            </div>

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
                        <td>Status:</td>
                        <td class="file-box">
                                    <div class="action-buttons">
                                <button type="button" class="accept-btn">Setujui Proposal</button>
                                <button type="button" class="reject-btn">Tolak Proposal</button>
                            </div>
                        </td>
                    </tr>
                </table>

                <!-- Feedback Section -->
                <form action="submit_feedback.php" method="POST">
                    <div class="mb-3">
                        <label for="feedbackInput" class="form-label">Masukkan Umpan Balik Anda:</label>
                        <textarea class="form-control" id="feedbackInput" name="feedback" rows="5" placeholder="Tulis umpan balik Anda di sini..." required></textarea>
                    </div>
                    <div class="btn_container">
                        <button type="submit">Kirim Feedback</button>
                    </div>
                </form>

                <a href="proposal_Bisnis_mentor.php" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>
    <script>
        document.querySelector('.accept-btn').addEventListener('click', () => {
            if (confirm("Apakah Anda yakin ingin menyetujui proposal ini?")) {
                // Logika untuk ACC
                alert("Proposal berhasil disetujui!");
            }
        });

        document.querySelector('.reject-btn').addEventListener('click', () => {
            if (confirm("Apakah Anda yakin ingin menolak proposal ini?")) {
                // Logika untuk Tolak
                alert("Proposal berhasil ditolak!");
            }
        });

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>