<?php
session_start();
include 'db_connection.php';  // Koneksi database

// Set zona waktu ke Indonesia (WIB)
date_default_timezone_set('Asia/Jakarta');

// Fungsi untuk mencatat aktivitas login
function log_activity($username, $status, $role, $aksi, $error_message = NULL) {
    global $conn;  // Gunakan koneksi yang sudah ada dari luar fungsi

    // Log untuk memastikan fungsi dipanggil
    error_log("log_activity dipanggil dengan username: $username");

    // Memastikan username ada di tabel users
    $user_check_query = "SELECT username FROM users WHERE username = '$username'";
    $user_check_result = $conn->query($user_check_query);

    if ($user_check_result->num_rows == 0) {
        // Jika username tidak ditemukan di tabel users
        error_log("Username $username tidak ditemukan di tabel users. Log tidak dicatat.");
        return false;
    }

    // Mendapatkan informasi IP address dan user agent
    $ip_address = $_SERVER['REMOTE_ADDR']; 
    $user_agent = $_SERVER['HTTP_USER_AGENT']; 

    // Mendapatkan timestamp dalam format Indonesia (WIB)
    $timestamp = date('Y-m-d H:i:s');  // Format tanggal dan jam Indonesia (WIB)
    
    // Query untuk mencatat log aktivitas ke dalam tabel log_activity
    $query = "INSERT INTO log_activity (timestamp, username, ip_address, user_agent, status, role, aksi, error_message) 
              VALUES ('$timestamp', '$username', '$ip_address', '$user_agent', '$status', '$role', '$aksi', '$error_message')";

    // Menambahkan pengecekan error pada query
    if ($conn->query($query) === TRUE) {
        error_log("Log aktivitas berhasil ditambahkan untuk username: $username");
        return true;
    } else {
        // Mencetak kesalahan jika query gagal
        error_log("Error inserting log: " . $conn->error);
        return false;
    }
}

// Proses login
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // Query untuk mencari username di database
    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        $_SESSION['user_id'] = $user['id'];

        // Verifikasi password
        if (password_verify($password, $user['password'])) {
            $_SESSION['username'] = $user['username'];
            $_SESSION['role'] = $user['role'];

            // Log aktivitas login berhasil
            $status = 'Login Berhasil';
            $role = $user['role'];
            $aksi = 'Login';
            $error_message = NULL;  // Tidak ada kesalahan
            log_activity($username, $status, $role, $aksi, $error_message);

            // Menyimpan informasi tambahan berdasarkan role
            if ($user['role'] == 'Mahasiswa') {
                $mahasiswa_query = "SELECT * FROM mahasiswa WHERE user_id = '".$user['id']."'";
                $mahasiswa_result = $conn->query($mahasiswa_query);
                
                if ($mahasiswa_result->num_rows > 0) {
                    $mahasiswa_data = $mahasiswa_result->fetch_assoc();
                    $_SESSION['nama'] = $mahasiswa_data['nama'];
                    $_SESSION['npm'] = $mahasiswa_data['npm'];
                    $_SESSION['program_studi'] = $mahasiswa_data['program_studi'];
                    $_SESSION['tahun_angkatan'] = $mahasiswa_data['tahun_angkatan'];
                    $_SESSION['fakultas'] = $mahasiswa_data['fakultas'];
                }
            } elseif (($user['role'] == 'Tutor') || ($user['role'] == 'Dosen Pengampu')) {
                $mentor_query = "SELECT * FROM mentor WHERE user_id = '".$user['id']."'";
                $mentor_result = $conn->query($mentor_query);

                if ($mentor_result->num_rows > 0) {
                    $mentor_data = $mentor_result->fetch_assoc();
                    $_SESSION['nama'] = $mentor_data['nama'];
                }
            }

            // Redirect berdasarkan role dan status login
            if ($user['role'] == 'Admin') {
                header("Location: /Aplikasi-Kewirausahaan/components/pages/admin/pageadmin.php");
            } elseif ($user['first_login'] == 1) {
                if ($user['role'] == 'Mahasiswa') {
                    header("Location: /Aplikasi-Kewirausahaan/components/pages/mahasiswa/lengkapi_data_mahasiswa.php");
                } elseif ($user['role'] == 'Tutor') {
                    header("Location: /Aplikasi-Kewirausahaan/components/pages/mentorbisnis/lengkapi_data_mentor.php");
                }
            } else {
                if ($user['role'] == 'Mahasiswa') {
                    header("Location: /Aplikasi-Kewirausahaan/components/pages/mahasiswa/pagemahasiswa.php");
                } elseif ($user['role'] == 'Tutor' || $user['role'] == 'Dosen Pengampu') {
                    header("Location: /Aplikasi-Kewirausahaan/components/pages/mentorbisnis/pagementor.php");
                }
            }
            exit;
        } else {
            $_SESSION['error'] = "Password salah!";

            // Log aktivitas login gagal (salah password)
            $status = 'Login Gagal';
            $role = 'Unknown';  // Role tidak diketahui karena login gagal
            $aksi = 'Login';
            $error_message = "Password salah";  // Pesan kesalahan
            log_activity($username, $status, $role, $aksi, $error_message);

            header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
        }
    } else {
        $_SESSION['error'] = "Username tidak ditemukan!";

        // Log aktivitas login gagal (username tidak ditemukan)
        $status = 'Login Gagal';
        $role = 'Unknown';  // Role tidak diketahui karena login gagal
        $aksi = 'Login';
        $error_message = "Username tidak ditemukan";  // Pesan kesalahan
        log_activity($username, $status, $role, $aksi, $error_message);

        header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
    }
} else {
    echo "Metode pengiriman tidak valid.";
}

$conn->close();
?>
