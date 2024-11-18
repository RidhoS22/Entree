<?php
include 'db_connection.php'; 

$accounts = [
    ['username' => 'ridho.syahfero', 'password' => '220304', 'role' => 'mahasiswa', 'first_login' => 1, 'nama' => 'Ridho Syahfero', 'npm' => '1402022055', 'program_studi' => 'Teknik Informatika', 'tahun_angkatan' => '2022/2023 Teknik Informatika'],
    ['username' => 'asril.affandhi', 'password' => '220305', 'role' => 'mahasiswa', 'first_login' => 1, 'nama' => 'Asril Affandhi', 'npm' => '1402022068', 'program_studi' => 'Teknik Informatika', 'tahun_angkatan' => '2022/2023 Teknik Informatika'],
    ['username' => 'fadly.abdillah', 'password' => '220306', 'role' => 'mahasiswa', 'first_login' => 1, 'nama' => 'Fadly Abdillah', 'npm' => '1402022040', 'program_studi' => 'Teknik Informatika', 'tahun_angkatan' => '2022/2023 Teknik Informatika'],
    ['username' => 'akunMntr', 'password' => 'mntr123', 'role' => 'mentor', 'first_login' => 1, 'nama' => 'Tes Mentor', 'nidn' => '022456788'],
    ['username' => 'akunAdmin', 'password' => 'admin123', 'role' => 'admin', 'first_login' => 0]
];

foreach ($accounts as $account) {
    $username = $account['username'];
    $role = $account['role'];
    $hashedPassword = password_hash($account['password'], PASSWORD_DEFAULT);

    $query = "INSERT INTO users (username, password, role, first_login) VALUES ('$username', '$hashedPassword', '$role', {$account['first_login']})";

    if (mysqli_query($conn, $query)) {
        $userId = mysqli_insert_id($conn);

        if ($role == 'mahasiswa') {
            $nama = $account['nama'];
            $npm = $account['npm'];
            $programStudi = $account['program_studi'];
            $tahunAngkatan = $account['tahun_angkatan'];

            $queryMahasiswa = "INSERT INTO mahasiswa (user_id, nama, npm, program_studi, tahun_angkatan) 
                               VALUES ($userId, '$nama', '$npm', '$programStudi', '$tahunAngkatan')";
            if (mysqli_query($conn, $queryMahasiswa)) {
                echo "Data mahasiswa untuk $username berhasil dimasukkan.<br>";
            } else {
                echo "Gagal memasukkan data mahasiswa untuk $username: " . mysqli_error($conn) . "<br>";
            }
        } elseif ($role == 'mentor') {
            $nama = $account['nama'];
            $nidn = $account['nidn'];

            $queryMentor = "INSERT INTO mentor (user_id, nama, nidn) 
                            VALUES ($userId, '$nama', '$nidn')";
            if (mysqli_query($conn, $queryMentor)) {
                echo "Data mentor untuk $username berhasil dimasukkan.<br>";
            } else {
                echo "Gagal memasukkan data mentor untuk $username: " . mysqli_error($conn) . "<br>";
            }
        }
    } else {
        if (mysqli_errno($conn) == 1062) {
            echo "Username $username sudah ada. Tidak bisa memasukkan data duplikat.<br>";
        } else {
            echo "Gagal memasukkan akun untuk $username: " . mysqli_error($conn) . "<br>";
        }
    }
}

mysqli_close($conn);
?>
