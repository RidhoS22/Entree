<?php
include 'db_connection.php'; 

$accounts = [
    ['username' => 'akunMahasiswa', 'password' => 'mhsiswa123', 'role' => 'mahasiswa'],
    ['username' => 'akunMentor', 'password' => 'mntr123', 'role' => 'mentor bisnis'],
    ['username' => 'akunAdmin', 'password' => 'admn123', 'role' => 'admin pikk'],
];

foreach ($accounts as $account) {
    $hashedPassword = password_hash($account['password'], PASSWORD_DEFAULT);

    $username = $account['username'];
    $role = $account['role'];

    $query = "INSERT INTO login (username, password, role) VALUES ('$username', '$hashedPassword', '$role')";

    if (mysqli_query($conn, $query)) {
        echo "Akun untuk $username berhasil dimasukkan.<br>";
    } else {
        echo "Gagal memasukkan akun untuk $username: " . mysqli_error($conn) . "<br>";
    }
}

mysqli_close($conn);
?>
