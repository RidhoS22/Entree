<?php
include 'db_connection.php'; 

// Set header response untuk JSON
header('Content-Type: application/json');

// Membaca input JSON
$data = json_decode(file_get_contents("php://input"), true);

// Pastikan data ada dan tidak kosong
if (isset($data['accounts']) && !empty($data['accounts'])) {
    $accounts = $data['accounts'];
    $response = [];

    // Loop untuk setiap akun yang akan dimasukkan
    foreach ($accounts as $account) {
        $username = $account['username'];
        $role = $account['role'];
        $hashedPassword = password_hash($account['password'], PASSWORD_DEFAULT);

        // Insert akun utama (users)
        $query = "INSERT INTO users (username, password, role, first_login) VALUES ('$username', '$hashedPassword', '$role', {$account['first_login']})";

        if (mysqli_query($conn, $query)) {
            $userId = mysqli_insert_id($conn);

            // Insert data mahasiswa atau mentor
            if ($role == 'mahasiswa') {
                $nama = $account['nama'];
                $npm = $account['npm'];
                $programStudi = $account['program_studi'];
                $tahunAngkatan = $account['tahun_angkatan'];

                $queryMahasiswa = "INSERT INTO mahasiswa (user_id, nama, npm, program_studi, tahun_angkatan) 
                                   VALUES ($userId, '$nama', '$npm', '$programStudi', '$tahunAngkatan')";
                if (mysqli_query($conn, $queryMahasiswa)) {
                    $response[] = ["status" => "success", "message" => "Data mahasiswa untuk $username berhasil dimasukkan."];
                } else {
                    $response[] = ["status" => "error", "message" => "Gagal memasukkan data mahasiswa untuk $username: " . mysqli_error($conn)];
                }
            } elseif ($role == 'mentor') {
                $nama = $account['nama'];
                $nidn = $account['nidn'];

                $queryMentor = "INSERT INTO mentor (user_id, nama, nidn) 
                                VALUES ($userId, '$nama', '$nidn')";
                if (mysqli_query($conn, $queryMentor)) {
                    $response[] = ["status" => "success", "message" => "Data mentor untuk $username berhasil dimasukkan."];
                } else {
                    $response[] = ["status" => "error", "message" => "Gagal memasukkan data mentor untuk $username: " . mysqli_error($conn)];
                }
            }
        } else {
            if (mysqli_errno($conn) == 1062) {
                $response[] = ["status" => "error", "message" => "Username $username sudah ada. Tidak bisa memasukkan data duplikat."];
            } else {
                $response[] = ["status" => "error", "message" => "Gagal memasukkan akun untuk $username: " . mysqli_error($conn)];
            }
        }
    }

    // Menutup koneksi
    mysqli_close($conn);

    // Mengembalikan response dalam format JSON
    echo json_encode($response);
} else {
    // Jika data tidak valid atau kosong
    echo json_encode(["status" => "error", "message" => "Data akun tidak ditemukan atau format salah."]);
}
?>
