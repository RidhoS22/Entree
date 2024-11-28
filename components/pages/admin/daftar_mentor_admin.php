<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Kewirusahaan</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/77a99d5f4f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="/Aplikasi-Kewirausahaan/assets/css/admin/daftar_mentor_admin.css">
</head>

<body>
    <div class="wrapper">
        <?php 
        $activePage = 'daftar_mentor_admin'; // Halaman ini aktif
        include 'sidebar_admin.php'; 
        ?>

        <div class="main p-3">
            <div class="main_header">
                <?php 
                    $pageTitle = "Daftar Mentor Bisnis"; // Judul halaman
                    include 'header_admin.php'; 
                ?>
            </div>
            <div class="main_wrapper">
                </h1>
    <div class="grid grid-cols-3 gap-8">
     <!-- Card 1 -->
     <div class="bg-white p-4 rounded-lg shadow-md">
      <div class="flex items-center mb-4">
       <img alt="Profile picture of the mentor" class="w-12 h-12 rounded-full" height="50" src="https://storage.googleapis.com/a1aa/image/60LA1xO6dyL2LFetVAwefJrBSFz6yOaTM9L4lgigtC4peNTPB.jpg" width="50"/>
      </div>
      <div class="text-gray-800">
       <p class="font-bold">Nama Dosen</p>
       <p>NIDN :</p>
       <p>Keahlian :</p>
       <p>Fakultas :</p>
       <p>Prodi :</p>
       <p>Role :</p>
       <p>Gmail :</p>
       <p>Contact : 0812121212121</p>
      </div>
      <button class="items-center mt-4 text-white py-2 px-4 rounded" style="background-color: #2ea56f;">
       Naikan Role
      </button>
      <button class="items-center mt-4 text-white py-2 px-4 rounded" style="background-color: #2ea56f;">
       Turunkan Role
      </button>
     </div>
     <!-- Card 2 -->
     <div class="bg-white p-4 rounded-lg shadow-md">
      <div class="flex items-center mb-4">
       <img alt="Profile picture of the mentor" class="w-12 h-12 rounded-full" height="50" src="https://storage.googleapis.com/a1aa/image/60LA1xO6dyL2LFetVAwefJrBSFz6yOaTM9L4lgigtC4peNTPB.jpg" width="50"/>
      </div>
      <div class="text-gray-800">
       <p class="font-bold">Nama Dosen</p>
       <p>NIDN :</p>
       <p>Keahlian :</p>
       <p>Fakultas :</p>
       <p>Prodi :</p>
       <p>Role :</p>
       <p>Gmail :</p>
       <p>Contact : 0812121212121</p>
      </div>
      <button class="items-center mt-4 text-white py-2 px-4 rounded" style="background-color: #2ea56f;">
       Naikan Role
      </button>
      <button class="items-center mt-4 text-white py-2 px-4 rounded" style="background-color: #2ea56f;">
       Turunkan Role
      </button>
     </div>
     <!-- Card 3 -->
     <div class="bg-white p-4 rounded-lg shadow-md">
      <div class="flex items-center mb-4">
       <img alt="Profile picture of the mentor" class="w-12 h-12 rounded-full" height="50" src="https://storage.googleapis.com/a1aa/image/60LA1xO6dyL2LFetVAwefJrBSFz6yOaTM9L4lgigtC4peNTPB.jpg" width="50"/>
      </div>
      <div class="text-gray-800">
       <p class="font-bold">Nama Dosen</p>
       <p>NIDN :</p>
       <p>Keahlian :</p>
       <p>Fakultas :</p>
       <p>Prodi :</p>
       <p>Role :</p>
       <p>Gmail :</p>
       <p>Contact : 0812121212121</p>
      </div>
      <button class="items-center mt-4 text-white py-2 px-4 rounded" style="background-color: #2ea56f;">
       Naikan Role
      </button>
      <button class="items-center mt-4 text-white py-2 px-4 rounded" style="background-color: #2ea56f;">
       Turunkan Role
      </button>
     </div>
    </div>

            
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
    <script type="text/javascript" src="/Aplikasi-Kewirausahaan/assets/js/hamburger.js"></script>
</body>

</html>

