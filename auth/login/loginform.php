<!DOCTYPE html>
<html>
<head>
	<title>Animated Login Form</title>
	<link rel="stylesheet" href="/Aplikasi Kewirausahaan/assets/css/loginstyle.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<img class="wave" src="/Aplikasi Kewirausahaan/assets/img/wave.png">
	<div class="container">
		<div class="img">
			<img src="/Aplikasi Kewirausahaan/assets/img/bg.svg">
		</div>
		<div class="login-content">
			<form action="/APlikasi Kewirausahaan/config/ldap.php" method="post">
				<img src="/Aplikasi Kewirausahaan/assets/img/avatar.svg">
				<h2 class="title">L O G I N</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Username</h5>
           		   		<input type="text" class="input username" name="username" oninvalid="this.setCustomValidity('Kolom ini tidak boleh kosong')" oninput="this.setCustomValidity('')">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Password</h5>
           		    	<input type="password" class="input password" name="password" required oninvalid="this.setCustomValidity('Kolom ini tidak boleh kosong')" oninput="this.setCustomValidity('')">
            	   </div>
            	</div>
            	<input type="submit" class="btnLogin" value="Login">
				<a href="/Aplikasi Kewirausahaan"></a>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="/Aplikasi Kewirausahaan/assets/js/login.js"></script>
</body>
</html>
