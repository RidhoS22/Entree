<?php
session_start();
$error_message = isset($_SESSION['error']) ? $_SESSION['error'] : '';
unset($_SESSION['error']);
?>
<!DOCTYPE html>
<html>
<head>
	<title>Entree | Masuk</title>
	<link rel="stylesheet" href="/Entree/assets/css/loginstyle.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<img class="wave" src="/Entree/assets/img/wave.png">
	<div class="container">
		<div class="img">
			<img src="/Entree/assets/img/bg.svg">
		</div>
		<div class="login-content">
			<form action="/Entree/config/login.php" method="post">
				<img src="/Entree\assets\img\image1.png">
				<!-- <img src="/Entree\assets\img\image.png" style="width: 300px; height: 100px"> -->
				<h2 class="title">E N T R E E</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Nama Pengguna</h5>
           		   		<input type="text" class="input username" name="username" oninvalid="this.setCustomValidity('Kolom ini tidak boleh kosong')" oninput="this.setCustomValidity('')">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Kata Sandi</h5>
           		    	<input type="password" class="input password" name="password" required oninvalid="this.setCustomValidity('Kolom ini tidak boleh kosong')" oninput="this.setCustomValidity('')">
            	   </div>
            	</div>
            	<input type="submit" class="btnLogin" name="login" value="Masuk">
				<a href="/Entree"></a>
            </form>
        </div>
    </div>

	<!-- Pop-Up Notifikasi -->
	<div id="errorPopup" class="popup hidden">
		<p id="errorMessage"></p>
		<button onclick="closePopup()">Tutup</button>
	</div>

    <script type="text/javascript" src="/Entree/assets/js/login.js"></script>
    <script>
        // Menangani pesan error dari sesi PHP
        const errorMessage = "<?php echo $error_message; ?>";
        if (errorMessage) {
            document.getElementById('errorMessage').textContent = errorMessage;
            document.getElementById('errorPopup').classList.remove('hidden');
        }

        function closePopup() {
            document.getElementById('errorPopup').classList.add('hidden');
        }
    </script>
</body>
</html>
