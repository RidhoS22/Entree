<?php
session_start();
include 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        $_SESSION['user_id'] = $user['id'];

        if (password_verify($password, $user['password'])) {
            $_SESSION['username'] = $user['username'];
            $_SESSION['role'] = $user['role'];

            if ($user['role'] == 'Mahasiswa') {
                $mahasiswa_query = "SELECT * FROM mahasiswa WHERE user_id = '".$user['id']."'";
                $mahasiswa_result = $conn->query($mahasiswa_query);
                
                if ($mahasiswa_result->num_rows > 0) {
                    $mahasiswa_data = $mahasiswa_result->fetch_assoc();
                    $_SESSION['nama'] = $mahasiswa_data['nama'];
                    $_SESSION['npm'] = $mahasiswa_data['npm'];
                    $_SESSION['program_studi'] = $mahasiswa_data['program_studi'];
                    $_SESSION['tahun_angkatan'] = $mahasiswa_data['tahun_angkatan'];
                }
            } elseif ($user['role'] == 'Tutor') {
                $mentor_query = "SELECT * FROM mentor WHERE user_id = '".$user['id']."'";
                $mentor_result = $conn->query($mentor_query);

                if ($mentor_result->num_rows > 0) {
                    $mentor_data = $mentor_result->fetch_assoc();
                    $_SESSION['nama'] = $mentor_data['nama'];
                }
            }

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
        }
    } else {
        $_SESSION['error'] = "Username tidak ditemukan!";
    }
    header("Location: /Aplikasi-Kewirausahaan/auth/login/loginform.php");
} else {
    echo "Metode pengiriman tidak valid.";
}
$conn->close();
?>
