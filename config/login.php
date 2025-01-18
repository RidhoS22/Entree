<?php
session_start();

include 'db_connection.php';  // Koneksi database

/**
 * Perform an LDAP search using comma seperated search strings
 *
 * @param string search string of search values
 */
function _ldap_simple_search($ds,$dn,$search) {
	$results = explode(';', $search);
	foreach($results as $key=>$result) {
		$results[$key] = '('.$result.')';
	}
	return _ldap_search($ds,$dn,$results);
}

/**
 * Perform an LDAP search
 *
 * @param array Search Filters (array of strings)
 * @param string DN Override
 * @return array Multidimensional array of results
 * @access public
 */

 function _ldap_search($lconn, $dn, $filters) {
	$attributes = array ();

	foreach ($filters as $search_filter)
	{
		$search_result = @ldap_search($lconn, $dn, $search_filter);
		if ($search_result && ($count = @ldap_count_entries($lconn, $search_result)) > 0)
		{
			for ($i = 0; $i < $count; $i++)
			{
				$attributes[$i] = Array ();
				if (!$i) {
					$firstentry = @ldap_first_entry($lconn, $search_result);
				} else {
					$firstentry = @ldap_next_entry($lconn, $firstentry);
				}
				$attributes_array = @ldap_get_attributes($lconn, $firstentry); // load user-specified attributes
				// ldap returns an array of arrays, fit this into attributes result array
				foreach ($attributes_array as $ki => $ai)
				{
					if (is_array($ai))
					{
						$subcount = $ai['count'];
						$attributes[$i][$ki] = Array ();
						for ($k = 0; $k < $subcount; $k++) {
							$attributes[$i][$ki][$k] = $ai[$k];
						}
					}
				}
				$attributes[$i]['dn'] = @ldap_get_dn($lconn, $firstentry);
			}
		}
	}
	return $attributes;
}

$ldap_success = false;

// Konfigurasi LDAP
$CONFIG['ldap_host'] = 'pdc.yarsi.ac.id';
$CONFIG['ldap_port'] = '389';
$CONFIG['ldap_basedn'] = 'dc=yarsi,dc=ac,dc=id';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = $_POST['password']; // Jangan escape password untuk LDAP

    // Cek apakah pengguna adalah Admin (role Admin di database lokal)
    $query = "SELECT * FROM users WHERE username = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Pengecekan untuk role Admin, jika Admin lakukan verifikasi password dari database lokal
        if ($user['role'] == 'Admin') {
            // Verifikasi password untuk Admin
            if (password_verify($password, $user['password'])) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['username'] = $user['username'];
                $_SESSION['role'] = $user['role']; // Dapatkan role dari database
                $_SESSION['logged_in'] = true;

                // Redirect ke dashboard Admin
                header("Location: /Entree/admin/dashboard");
                exit;
            } else {
                $_SESSION['error'] = "Password tidak valid untuk Admin!";
                header("Location: /Entree/login");
                exit;
            }
        }
    }

    if ($result->num_rows === 0 || $user['role'] != 'Admin') {
        // Jika role bukan Admin, cek melalui LDAP
        // Koneksi ke server LDAP
        $ds = ldap_connect($CONFIG['ldap_host'], $CONFIG['ldap_port']);
        if ($ds) {  
            ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3); // Gunakan versi LDAP yang benar
            ldap_set_option($ds, LDAP_OPT_REFERRALS, 0);

            $bind = ldap_bind($ds); // Bind anonim (atau gunakan akun admin jika diperlukan)
            if ($bind) {
                $binddata = _ldap_simple_search($ds, $CONFIG['ldap_basedn'], 'uid=' . $username);
                if (isset($binddata[0]) && isset($binddata[0]['dn'])) {
                    // Verifikasi password dengan LDAP
                    $ldap_success = @ldap_bind($ds, $binddata[0]['dn'], $password);

                    if ($ldap_success) {
                        // Ambil informasi dari LDAP
                        $nama = isset($binddata[0]['displayName'][0]) ? $binddata[0]['displayName'][0] : null;
                        $npm = isset($binddata[0]['description'][0]) ? $binddata[0]['description'][0] : null;
                        $role = isset($binddata[0]['title'][0]) ? $binddata[0]['title'][0] : 'Unknown';
                        $contact = isset($binddata[0]['telephoneNumber'][0]) ? $binddata[0]['telephoneNumber'][0] : null;
                        $street = isset($binddata[0]['street'][0]) ? $binddata[0]['street'][0] : null;

                        $_SESSION['username'] = $username;
                        $_SESSION['displayName'] = $nama;
                        $_SESSION['npm'] = $npm;
                        $_SESSION['role'] = $role;
                        $_SESSION['contact'] = $contact;
                        $_SESSION['street'] = $street;
                        $_SESSION['logged_in'] = true;

                        // Cek apakah pengguna sudah ada di database
                        $check_user_query = "SELECT * FROM users WHERE username = ?";
                        $stmt = $conn->prepare($check_user_query);
                        $stmt->bind_param("s", $username);
                        $stmt->execute();
                        $result = $stmt->get_result();

                        if ($result->num_rows === 0) {
                            // Tambahkan pengguna baru ke database
                            $insert_user_query = "INSERT INTO users (username, role, first_login) VALUES (?, ?, ?)";
                            $stmt = $conn->prepare($insert_user_query);
                            $first_login = 1;
                            $role_in_db = ($role === 'M') ? 'Mahasiswa' : (($role === 'D' || $role === 'S') ? 'Tutor' : 'Unknown');

                            $stmt->bind_param("ssi", $username, $role_in_db, $first_login);
                            $stmt->execute();
                            $_SESSION['error'] = "Akun anda berhasil terdaftar, harap lakukan login ulang.";
                            header("Location: /Entree/login");
                        } else {
                            // Pengguna sudah ada di database, cek apakah first_login masih 1
                            $user = $result->fetch_assoc();
                            $_SESSION['user_id'] = $user['id'];
                            $_SESSION['role'] = $user['role'];

                            if ($user['first_login'] == 1) {
                                // Redirect ke halaman lengkapi data
                                if ($user['role'] === 'Mahasiswa') {
                                    header("Location: /Entree/lengkapi_data_mahasiswa");
                                } elseif ($user['role'] === 'Tutor') {
                                    header("Location: /Entree/lengkapi_data_mentor");
                                }
                            } else {
                                // Redirect ke dashboard berdasarkan role
                                if ($user['role'] === 'Mahasiswa') {
                                    $mahasiswa_query = "SELECT * FROM mahasiswa WHERE user_id = ?";
                                    $stmt = $conn->prepare($mahasiswa_query);
                                    $stmt->bind_param("i", $user['id']);
                                    $stmt->execute();
                                    $mahasiswa_result = $stmt->get_result();
                                    
                                    if ($mahasiswa_result->num_rows > 0) {
                                        $mahasiswa_data = $mahasiswa_result->fetch_assoc();
                                        $_SESSION['id_kelompok'] = $mahasiswa_data['id_kelompok']; // Menyimpan ID kelompok ke session
                                    }
                                    header("Location: /Entree/mahasiswa/dashboard");
                                } elseif ($user['role'] === 'Tutor') {
                                    header("Location: /Entree/mentor/dashboard");
                                } else {
                                    $_SESSION['error'] = "Role tidak dikenali.";
                                    header("Location: /Entree/login");
                                }
                            }
                        }
                        exit;
                    } else {
                        $_SESSION['error'] = "Password tidak valid!";
                        header("Location: /Entree/login");
                    }
                } else {
                    $_SESSION['error'] = "Username tidak ditemukan!";
                    header("Location: /Entree/login");
                }
            } else {
                $_SESSION['error'] = "Gagal melakukan autentikasi ke server LDAP.";
                header("Location: /Entree/login");
            }
            ldap_close($ds);
        } else {
            $_SESSION['error'] = "Gagal melakukan koneksi ke server LDAP.";
            header("Location: /Entree/login");
        }
    }
} else {
    echo "Metode pengiriman tidak valid.";
}
?>