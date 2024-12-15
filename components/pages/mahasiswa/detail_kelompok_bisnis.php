<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

// Mendapatkan NPM mahasiswa dari session
$npm_mahasiswa = $_SESSION['npm'];

// Cek apakah mahasiswa adalah ketua atau anggota kelompok
$cekKelompokQuery = "
    SELECT kb.*, ak.id_kelompok AS anggota_id
    FROM kelompok_bisnis kb
    LEFT JOIN anggota_kelompok ak ON kb.id_kelompok = ak.id_kelompok
    WHERE kb.npm_ketua = '$npm_mahasiswa' OR ak.npm_anggota = '$npm_mahasiswa' LIMIT 1";
$cekKelompokResult = mysqli_query($conn, $cekKelompokQuery);
$kelompokTerdaftar = mysqli_fetch_assoc($cekKelompokResult);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Kelompok Bisnis</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/detail_kelompok.css">
</head>
<body>
    <div class="wrapper">
        <?php include 'sidebar_mahasiswa.php'; ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Kelompok Bisnis"; // Judul halaman
                    include 'header_mahasiswa.php'; 
                ?>
            </div>

            <div class="main_wrapper">
                <?php if ($kelompokTerdaftar) { ?>
                    <div class="container">
                        <div class="left">
                            <!-- Logo Bisnis -->
                            <img alt="Logo Bisnis" src="/Aplikasi-Kewirausahaan/components/pages/mahasiswa/logos/<?php echo $kelompokTerdaftar['logo_bisnis']; ?>" />
                        </div>

                        <div class="right">
                            <div class="title-edit">
                                <h1 id="nama-kelompok-text"><?php echo htmlspecialchars($kelompokTerdaftar['nama_kelompok']); ?></h1>
                                <input type="text" id="nama-kelompok-input" value="<?php echo htmlspecialchars($kelompokTerdaftar['nama_kelompok']); ?>" style="display: none;" />
                                <button class="edit-btn" type="button" title="Edit Kelompok Bisnis">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>

                            <!-- Menambahkan Nama Bisnis -->
                            <p><strong>Nama Bisnis:</strong></p>
                            <span id="nama-bisnis-text"><?php echo htmlspecialchars($kelompokTerdaftar['nama_bisnis']); ?></span>
                            <input type="text" id="nama-bisnis-input" value="<?php echo htmlspecialchars($kelompokTerdaftar['nama_bisnis']); ?>" style="display: none;" />

                            <!-- Memberikan jarak dengan margin-top -->
                            <p class="mt-3"><strong>Ide Bisnis:</strong></p>
                            <span id="ide-bisnis-text"><?php echo htmlspecialchars($kelompokTerdaftar['ide_bisnis']); ?></span>
                            <textarea id="ide-bisnis-input" style="display: none;"><?php echo htmlspecialchars($kelompokTerdaftar['ide_bisnis']); ?></textarea>

                            <div class="category">
                                <p><strong>Kategori Bisnis:</strong> -</p> <!-- Kategori kosong -->
                            </div>
                            <div class="sdg">
                                <p><strong>Sustainable Development Goals (SDGs):</strong> -</p> <!-- SDGs kosong -->
                            </div>

                            <div class="bottom">
                                <div class="members">
                                    <p><strong>Ketua Kelompok:</strong> 
                                        <?php
                                            // Mendapatkan nama ketua kelompok berdasarkan npm ketua
                                            $ketuaQuery = "SELECT nama FROM mahasiswa WHERE npm = '" . $kelompokTerdaftar['npm_ketua'] . "' LIMIT 1";
                                            $ketuaResult = mysqli_query($conn, $ketuaQuery);
                                            $ketuaData = mysqli_fetch_assoc($ketuaResult);
                                            echo $ketuaData['nama'];
                                        ?>
                                    </p>

                                    <p><strong>Anggota Kelompok:</strong></p>
                                    <?php
                                    // Menampilkan anggota kelompok
                                    $anggotaQuery = "
                                        SELECT ak.npm_anggota, m.nama
                                        FROM anggota_kelompok ak
                                        JOIN mahasiswa m ON ak.npm_anggota = m.npm
                                        WHERE ak.id_kelompok = " . $kelompokTerdaftar['id_kelompok'];
                                    $anggotaResult = mysqli_query($conn, $anggotaQuery);
                                    while ($anggota = mysqli_fetch_assoc($anggotaResult)) {
                                        echo "<p><i class='fas fa-user'></i> " . $anggota['nama'] . " (" . $anggota['npm_anggota'] . ")</p>";
                                    }
                                    ?>
                                </div>

                                <div class="tutor">
                                <div class="d-flex align-items-center mentor">
                                    <strong class="me-2">Mentor Bisnis:</strong>
                                    <a  class="text-decoration-none" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                        <div class="card d-inline-block" title="Lihat Detail Mentor Bisnis">
                                            <div class="card-body p-0">
                                                <p class="card-text m-0 text-center">
                                                    <?php echo htmlspecialchars($kelompokTerdaftar['mentor_bisnis']); ?>
                                                </p>
                                            </div>
                                        </div>
                                    </a>

                                </div>
                                <div class="collapse" id="collapseExample">
                                    <div class="d-flex justify-content-center collapse" id="collapseExample">
                                            <div class="card-mentor p-3">
                                                <img alt="Profile picture of the mentor" height="50" src="https://storage.googleapis.com/a1aa/image/Q1BtK1AStCLeOKUuTRnqzR27EJRLg5SmUePjrHw1ilMCaVsTA.jpg" width="50" class="card-img-top mx-auto d-block mt-3"/>
                                                <h2 class="card-mentor-title text-center">NAMA MEENTOR</h2>
                                                <div class="card-mentor-body">
                                                    <p class="card-mentor-text">Peran:</p>
                                                    <p class="card-mentor-text">Keahlian:</p>
                                                    <p class="card-mentor-text">Fakultas:</p>
                                                    <p class="card-mentor-text">Prodi:</p>
                                                    <p class="card-mentor-text">Nomor Telepon:</p>
                                                    <p class="card-mentor-text">Alamat Email:</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                

                                </div>

                                <div class="action-buttons" style="display: none;">
                                    <button class="save-btn">Simpan</button>
                                    <button class="cancel-btn">Batal</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } else { ?>
                    <div class="alert alert-warning">Kelompok Bisnis belum terdaftar.</div>
                <?php } ?>
            </div>
        </div>
    </div>
    <script>
document.querySelector('.edit-btn').addEventListener('click', function () {
    // Tampilkan input dan tombol aksi
    document.getElementById('nama-kelompok-text').style.display = 'none';
    document.getElementById('nama-kelompok-input').style.display = 'block';

    document.getElementById('nama-bisnis-text').style.display = 'none';
    document.getElementById('nama-bisnis-input').style.display = 'block';

    document.getElementById('ide-bisnis-text').style.display = 'none';
    document.getElementById('ide-bisnis-input').style.display = 'block';

    document.querySelector('.action-buttons').style.display = 'flex';
});

document.querySelector('.save-btn').addEventListener('click', function () {
    const namaKelompok = document.getElementById('nama-kelompok-input').value;
    const namaBisnis = document.getElementById('nama-bisnis-input').value;
    const ideBisnis = document.getElementById('ide-bisnis-input').value;

    // Kirim data ke server
    fetch('/Aplikasi-Kewirausahaan/components/pages/mahasiswa/update_kelompok.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            nama_kelompok: namaKelompok,
            nama_bisnis: namaBisnis,
            ide_bisnis: ideBisnis,
            id_kelompok: <?php echo json_encode($kelompokTerdaftar['id_kelompok']); ?>
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            alert('Data berhasil diperbarui.');

            // Update tampilan
            document.getElementById('nama-kelompok-text').textContent = namaKelompok;
            document.getElementById('nama-bisnis-text').textContent = namaBisnis;
            document.getElementById('ide-bisnis-text').textContent = ideBisnis;
        } else {
            alert('Gagal memperbarui data: ' + data.message);
        }
    })
    .catch(error => console.error('Error:', error))
    .finally(() => {
        // Kembalikan tampilan ke mode non-edit
        document.getElementById('nama-kelompok-text').style.display = 'block';
        document.getElementById('nama-kelompok-input').style.display = 'none';

        document.getElementById('nama-bisnis-text').style.display = 'block';
        document.getElementById('nama-bisnis-input').style.display = 'none';

        document.getElementById('ide-bisnis-text').style.display = 'block';
        document.getElementById('ide-bisnis-input').style.display = 'none';

        document.querySelector('.action-buttons').style.display = 'none';
    });
});

document.querySelector('.cancel-btn').addEventListener('click', function () {
    // Kembalikan tampilan ke mode non-edit
    document.getElementById('nama-kelompok-text').style.display = 'block';
    document.getElementById('nama-kelompok-input').style.display = 'none';

    document.getElementById('nama-bisnis-text').style.display = 'block';
    document.getElementById('nama-bisnis-input').style.display = 'none';

    document.getElementById('ide-bisnis-text').style.display = 'block';
    document.getElementById('ide-bisnis-input').style.display = 'none';

    document.querySelector('.action-buttons').style.display = 'none';
});
    </script>
</body>
</html>
