<html>
 <head>
  <title>
   Form Page
  </title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/lengkapi_data.css">
 </head>
 <body>
  <div class="container">
   <div class="image-container">
    <img alt="Illustration of a person holding a key in front of a computer screen with a user login interface" height="500" width="500" src="/Aplikasi-Kewirausahaan\assets\img\user_login.png"/>
   </div>
   <div class="form-container">
    <h2>
     Lengkapi Data Anda Sebagai Mentor Bisnis
    </h2>
    <div class="form-group">
     <label for="nama">
      Nama
     </label>
     <input id="nama" name="nama" type="text"/>
    </div>
    <div class="form-group">
     <label for="NIDN">
      NIDN
     </label>
     <input id="npm" name="npm" type="text"/>
    </div>
    <div class="form-group">
     <label for="peran">
      Peran
     </label>
     <select id="peran" name="peran">
      <option value="" style="color:darkgrey;">
       ~ Pilih Peran Anda ~
      </option>
      <option value="dosen_pengampu">
       Dosen Pengampu
      </option>
      <option value="tutor">
       Tutor
      </option>
     </select>
    </div>
    <div class="form-group">
     <label for="contact">
      Contact
     </label>
     <input id="contact" name="contact" type="text"/>
    </div>
    <button class="submit-btn">
     Tambahkan
    </button>
   </div>
  </div>
 </body>
</html>
