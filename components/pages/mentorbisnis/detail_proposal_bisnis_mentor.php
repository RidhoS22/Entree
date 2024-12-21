<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mengambil id dan id_kelompok dari URL
$id_proposal = isset($_GET['id']) ? $_GET['id'] : null;
$id_kelompok = isset($_GET['id_kelompok']) ? $_GET['id_kelompok'] : null;

// Memastikan mentor yang login
$mentor_name = isset($_SESSION['nama']) ? $_SESSION['nama'] : null;

if ($id_proposal) {
    // Mengambil data proposal bisnis yang terkait dengan kelompok yang login
    $sql = "SELECT * FROM proposal_bisnis WHERE id = $id_proposal";
    $result = $conn->query($sql);
}

// Memeriksa apakah proposal ditemukan
if ($result->num_rows > 0) {
    $proposal = $result->fetch_assoc();
} else {
    // Menangani kasus jika proposal tidak ditemukan
    echo "Proposal tidak ditemukan.";
    exit;
}

// Mengambil nama mentor dari kelompok bisnis
$sql_kelompok = "SELECT mentor_bisnis FROM kelompok_bisnis WHERE id_kelompok = $id_kelompok";
$kelompok_result = $conn->query($sql_kelompok);
$kelompok_data = $kelompok_result->fetch_assoc();
$kelompok_mentor = $kelompok_data['mentor_bisnis'] ?? null;

// Cek apakah mentor yang login sama dengan mentor yang terdaftar di kelompok
$is_mentor_matched = ($mentor_name === $kelompok_mentor);

// Proses SDG menjadi label deskriptif
$sdg_mapping = [
    "mengakhiri_kemiskinan" => "1. Mengakhiri Kemiskinan",
    "mengakhiri_kelaparan" => "2. Mengakhiri Kelaparan",
    "kesehatan_kesejahteraan" => "3. Kesehatan dan Kesejahteraan",
    "pendidikan_berkualitas" => "4. Pendidikan Berkualitas",
    "kesetaraan_gender" => "5. Kesetaraan Gender",
    "air_bersih_sanitasi" => "6. Air Bersih dan Sanitasi",
    "energi_bersih_terjangkau" => "7. Energi Bersih dan Terjangkau",
    "pekerjaan_pertumbuhan_ekonomi" => "8. Pekerjaan Layak dan Pertumbuhan Ekonomi",
    "industri_inovasi_infrastruktur" => "9. Industri, Inovasi, dan Infrastruktur",
    "mengurangi_ketimpangan" => "10. Mengurangi Ketimpangan",
    "kota_komunitas_berkelanjutan" => "11. Kota dan Komunitas Berkelanjutan",
    "konsumsi_produksi_bertanggung_jawab" => "12. Konsumsi dan Produksi yang Bertanggung Jawab",
    "penanganan_perubahan_iklim" => "13. Penanganan Perubahan Iklim",
    "ekosistem_lautan" => "14. Ekosistem Lautan",
    "ekosistem_daratan" => "15. Ekosistem Daratan",
    "perdamaian_keadilan_institusi_kuat" => "16. Perdamaian, Keadilan, dan Kelembagaan yang Kuat",
    "kemitraan_tujuan" => "17. Kemitraan untuk Mencapai Tujuan"
];

// Proses SDG menjadi label deskriptif
$sdg_selected = explode(",", $proposal['sdg']);
$sdg_labels = array_map(function ($key) use ($sdg_mapping) {
    return $sdg_mapping[$key] ?? $key;
}, $sdg_selected);
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
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_proposal.css">
</head>
<style>
    .Feedback {
        margin: 20px 0;
        padding: 15px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        line-height: 1.6;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }
</style>

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
                <h2><?php echo htmlspecialchars($proposal['judul_proposal']); ?></h2>
                <div class="description">
                    <strong>Ide Bisnis:</strong>
                    <p><?php echo htmlspecialchars($proposal['ide_bisnis'] ?? 'Tidak ada ide bisnis.'); ?></p>
                </div>

                <!-- Table Section -->
                <table class="styled-table">
                    <tr>
                        <td><strong>Tahapan Bisnis:</strong></td>
                        <td class="file-box">
                            <?php echo htmlspecialchars($proposal['tahapan_bisnis']); ?>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>SDG Bisnis:</strong></td>
                        <td class="file-box">
                            <ul>
                                <?php foreach ($sdg_labels as $label): ?>
                                    <li><?php echo htmlspecialchars($label); ?></li>
                                <?php endforeach; ?>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Kategori Bisnis:</strong></td>
                        <td class="file-box">
                            <?php
                            if ($proposal['kategori'] === 'lainnya') {
                                echo htmlspecialchars($proposal['other_category']);
                            } else {
                                echo htmlspecialchars($proposal['kategori']);
                            }
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>File Proposal Bisnis:</strong></td>
                        <td class="file-box">
                            <ul id="fileList">
                                <li class="file-box">
                                    <div class="file-info">
                                        <?php echo htmlspecialchars(basename($proposal['proposal_pdf'])); ?>
                                    </div>
                                    <div class="icon-group">
                                        <a href="<?php echo htmlspecialchars($proposal['proposal_pdf']); ?>" target="_blank" class="detail-icon">
                                            <i class="fa-solid fa-eye"></i>
                                        </a>
                                        <a href="<?php echo htmlspecialchars($proposal['proposal_pdf']); ?>" download class="btn-icon">
                                            <i class="fa-solid fa-download"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>Status:</td>
                        <td class="file-box">
                            <?php if ($is_mentor_matched): ?>
                                <div class="action-buttons">
                                    <button type="button" class="accept-btn">Setujui Proposal</button>
                                    <button type="button" class="reject-btn">Tolak Proposal</button>
                                </div>
                            <?php else: ?>
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
                            <?php endif; ?>
                        </td>
                    </tr>
                </table>
                <!-- Feedback Section -->
            <?php if ($is_mentor_matched): ?>
                <form id="feedbackForm">
                    <div class="mb-3">
                        <label for="feedbackInput" class="form-label">Masukkan Umpan Balik Anda:</label>
                        <textarea class="form-control" id="feedbackInput" name="feedback" rows="5" placeholder="Tulis umpan balik Anda di sini..." required></textarea>
                    </div>
                    <input type="hidden" id="proposalId" value="<?php echo htmlspecialchars($proposal['id']); ?>">
                    <div class="btn_container d-flex justify-content-between">
                        <button type="submit" class="btn btn-danger">Kirim Umpan Balik</button>
                    </div>
                </form>
                <div id="feedbackMessage" class="mt-3"></div>
                
                <script>
                    document.getElementById('feedbackForm').addEventListener('submit', async function (event) {
                        event.preventDefault();

                        const feedback = document.getElementById('feedbackInput').value;
                        const proposalId = document.getElementById('proposalId').value;

                        try {
                            const response = await fetch('submit_feedback.php', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                },
                                body: JSON.stringify({
                                    feedback: feedback,
                                    proposal_id: proposalId,
                                }),
                            });

                            const result = await response.json();
                            const messageDiv = document.getElementById('feedbackMessage');

                            if (result.success) {
                                messageDiv.innerHTML = `<div class="alert alert-success">${result.message}</div>`;
                            } else {
                                messageDiv.innerHTML = `<div class="alert alert-danger">${result.message}</div>`;
                            }
                        } catch (error) {
                            console.error('Error:', error);
                            document.getElementById('feedbackMessage').innerHTML = `<div class="alert alert-danger">Terjadi kesalahan. Silakan coba lagi.</div>`;
                        }
                    });
                </script>
            <?php else: ?>
                <div class="Feedback">
                    <strong>Feedback:</strong>
                    <p><?php echo htmlspecialchars($proposal['feedback'] ?? 'Tidak ada Feedback.'); ?></p>
                </div>
            <?php endif; ?>
                <!-- Tambahkan tombol "Kembali" di luar form -->
            <div class="mt-4 text-left">
                <button type="button" class="btn btn-primary" onclick="window.location.href='proposal_bisnis_mentor.php?id_kelompok=<?php echo $id_kelompok ?>'">Kembali</button>
            </div>
            </div>
        </div>
    </div>

    <script>
    document.querySelector('.accept-btn').addEventListener('click', () => {
    if (confirm("Apakah Anda yakin ingin menyetujui proposal ini?")) {
        // Get proposal ID and group ID
        const proposalId = <?php echo $id_proposal; ?>;
        const groupId = <?php echo $id_kelompok; ?>;

            // Mengirim data ke server menggunakan fetch
            fetch('update_proposal_status.php', {
                method: 'POST',
                body: JSON.stringify({
                    action: 'disetujui',  // atau 'ditolak'
                    proposal_id: proposalId,
                    group_id: groupId
                }),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);  // Debugging untuk melihat respons
                if (data.success) {
                    alert("Proposal berhasil diperbarui!");
                    location.reload();  // Reload the page to reflect changes
                } else {
                    alert("Gagal memperbarui status proposal.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Terjadi kesalahan.");
            });
        }
    });

    document.querySelector('.reject-btn').addEventListener('click', () => {
        if (confirm("Apakah Anda yakin ingin menolak proposal ini?")) {
            // Get proposal ID and group ID
            const proposalId = <?php echo $id_proposal; ?>;
            const groupId = <?php echo $id_kelompok; ?>;

            // Make an AJAX request to update the proposal status
            fetch('update_proposal_status.php', {
                method: 'POST',
                body: JSON.stringify({
                    action: 'ditolak',
                    proposal_id: proposalId,
                    group_id: groupId
                }),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("Proposal berhasil ditolak!");
                    location.reload();  // Reload the page to reflect changes
                } else {
                    alert("Gagal memperbarui status proposal: " + data.message); // Display error message
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Terjadi kesalahan: " + error.message); // Display detailed error
            });
        }
    });
</script>
</body>

</html>
