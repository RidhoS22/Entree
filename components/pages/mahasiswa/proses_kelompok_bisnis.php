<?php
session_start();
include $_SERVER['DOCUMENT_ROOT'] . '/Aplikasi-Kewirausahaan/config/db_connection.php';

$nama_kelompok = mysqli_real_escape_string($conn, $_POST['nama_kelompok']);
$jumlah_anggota = $_POST['jumlah_anggota'];
$npm_ketua = $_SESSION['npm'];
$nama_bisnis = mysqli_real_escape_string($conn, $_POST['nama_bisnis']);
$logo_bisnis = $_FILES['logo_bisnis'];

// Menghitung tahun ajaran
$currentYear = date("Y");
$currentMonth = date("m");
if ($currentMonth >= 7) { // Semester Ganjil
    $tahun_akademik = $currentYear . "/" . ($currentYear + 1) . " Ganjil";
} else { // Semester Genap
    $tahun_akademik = ($currentYear - 1) . "/" . $currentYear . " Genap";
}

// Ambil ID tahun akademik yang aktif
$cekTahunAktifQuery = "SELECT id FROM tahun_akademik WHERE status = 'Aktif' LIMIT 1";
$cekTahunAktifResult = mysqli_query($conn, $cekTahunAktifQuery);
$tahun_akademik_id = null;
if (mysqli_num_rows($cekTahunAktifResult) > 0) {
    $row = mysqli_fetch_assoc($cekTahunAktifResult);
    $tahun_akademik_id = $row['id'];
} else {
    echo "<script>alert('Tidak ada tahun akademik yang aktif.'); window.location.href='kelompok_bisnis.php';</script>";
    exit();
}

$logo_nama_file = basename($logo_bisnis['name']);
$logo_path = "logos/" . $logo_nama_file;

move_uploaded_file($logo_bisnis['tmp_name'], $logo_path);

$anggota_valid = true;
$anggota_terdaftar_valid = true;
$error_message = '';

$cekAnggotaDiKelompokQuery = "SELECT npm_anggota FROM anggota_kelompok";
$cekAnggotaDiKelompokResult = mysqli_query($conn, $cekAnggotaDiKelompokQuery);

$npmAnggotaDiKelompok = [];
while ($row = mysqli_fetch_assoc($cekAnggotaDiKelompokResult)) {
    $npmAnggotaDiKelompok[] = $row['npm_anggota'];
}

$npmAnggotaDiKelompok[] = $npm_ketua; // Menambahkan ketua kelompok yang sedang login

for ($i = 1; $i <= $jumlah_anggota; $i++) {
    $npm_anggota = $_POST['npm_anggota_' . $i];
    $npm_anggota_hanya_angka = preg_replace('/\D/', '', $npm_anggota);

    $cekMahasiswaQuery = "SELECT * FROM mahasiswa WHERE npm = '$npm_anggota_hanya_angka'";
    $cekMahasiswaResult = mysqli_query($conn, $cekMahasiswaQuery);

    if (mysqli_num_rows($cekMahasiswaResult) == 0) {
        $anggota_terdaftar_valid = false;
        $error_message = "Beberapa anggota yang dipilih tidak terdaftar di database mahasiswa.";
        break;
    }

    if (in_array($npm_anggota_hanya_angka, $npmAnggotaDiKelompok)) {
        $anggota_valid = false;
        $error_message = "Anggota yang dipilih sudah terdaftar dalam kelompok lain.";
        break;
    }
}

if (!$anggota_terdaftar_valid || !$anggota_valid) {
    echo "<script>
            alert('$error_message');
        </script>";
    exit();
}

$cekKetuaDiKelompokQuery = "SELECT * FROM kelompok_bisnis WHERE npm_ketua = '$npm_ketua'";
$cekKetuaDiKelompokResult = mysqli_query($conn, $cekKetuaDiKelompokQuery);
if (mysqli_num_rows($cekKetuaDiKelompokResult) > 0) {
    echo "<script>
            alert('Ketua yang sama sudah terdaftar dalam kelompok lain. Anda tidak bisa membuat kelompok baru.');
        </script>";
    exit();
}

// Menyimpan data kelompok bisnis dengan tahun akademik aktif
$sql = "INSERT INTO kelompok_bisnis (npm_ketua, nama_kelompok, nama_bisnis, logo_bisnis, tahun_akademik_id)
        VALUES ('$npm_ketua', '$nama_kelompok', '$nama_bisnis', '$logo_nama_file', '$tahun_akademik_id')";
if (mysqli_query($conn, $sql)) {
    $kelompok_id = mysqli_insert_id($conn);

    for ($i = 1; $i <= $jumlah_anggota; $i++) {
        $npm_anggota = $_POST['npm_anggota_' . $i];
        $npm_anggota_hanya_angka = preg_replace('/\D/', '', $npm_anggota);

        $anggota_sql = "INSERT INTO anggota_kelompok (id_kelompok, npm_anggota)
                        VALUES ('$kelompok_id', '$npm_anggota_hanya_angka')";
        if (!mysqli_query($conn, $anggota_sql)) {
            echo "<script>
                    alert('Error inserting anggota: " . mysqli_error($conn) . "');
                </script>";
            exit();
        }
    }

    header('Location: detail_kelompok_bisnis.php?id=' . $kelompok_id);
    exit();
} else {
    echo "<script>
            alert('Error: " . mysqli_error($conn) . "');
        </script>";
}
?>