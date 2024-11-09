<?php
session_start();
include 'db_connection.php'; 

$username = $_POST['username'];
$password = $_POST['password'];

$query = "SELECT * FROM login WHERE username = '$username'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) == 1) {
    $row = mysqli_fetch_assoc($result);
    if (password_verify($password, $row['password'])) {
        $_SESSION['username'] = $row['username'];
        $_SESSION['role'] = $row['role'];
        
        if ($row['role'] == 'mahasiswa') {
            header("Location: /Aplikasi-Kewirausahaan/components/pages/mahasiswa/pagemahasiswa.php");
        } elseif ($row['role'] == 'mentor bisnis') {
            header("Location: /Aplikasi-Kewirausahaan/components/pages/mentorbisnis/pagementor.php");
        } elseif ($row['role'] == 'admin pikk') {
            header("Location: /Aplikasi-Kewirausahaan/components/pages/admin/pageadmin.php");
        } else {
            echo "<script>alert('Role tidak dikenal!'); window.location.href = '/Aplikasi-Kewirausahaan/auth/login/loginform.php';</script>";
        }
    } else {
        echo "<script>alert('Password salah!'); window.location.href = '/Aplikasi-Kewirausahaan/auth/login/loginform.php';</script>";
    }
} else {
    echo "<script>alert('Username tidak ditemukan!'); window.location.href = '/Aplikasi-Kewirausahaan/auth/login/loginform.php';</script>";
}
?>
