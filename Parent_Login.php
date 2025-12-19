<?php
session_start(); 
$host = "localhost";
$username = "root";
$password = "";
$database = "school_web";  

$conn = new mysqli($host, $username, $password, $database, 3307);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if (empty($_POST["username"]) || empty($_POST["password"])) {
        $error = "Username and Password must be set";
    } else {

        $uname = $_POST["username"];
        $pass = $_POST["password"];

        $stmt = $conn->prepare("SELECT ParentsID FROM Parent_Login WHERE Username=? AND Password=?");
        $stmt->bind_param("ss", $uname, $pass);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows == 1) {

            $stmt->bind_result($ParentsID);
            $stmt->fetch();

            // Parent ID saved
            $_SESSION["logged_in_parent"] = $ParentsID;

            // Take you to Parent.php
            header("Location: Parent.php");
            exit;
        } else {
            $error = "Username or password is incorrect";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>St Alphonsus Primary School</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="style.css" />
  <script src="main.js" defer></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<section class="vh-100" style="background-color: #3e5046;">
  <div class="container-fluid py-5 h-100"> 
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="card" style="width: 1000px; border-radius: 1rem;">
        <div class="row g-0">

          <div class="col-md-6 col-lg-6 d-none d-md-block">
            <img id="roleImage" src="SchoolBuilding.png"
              alt="login form" class="img-fluid" 
              style="border-radius: 1rem 0 0 1rem; width: 100%; height: 100%; object-fit: cover;" />
          </div>
          <div class="col-12 col-md-6 col-lg-6 d-flex align-items-center">
            <div class="card-body p-4 p-lg-5 text-black" style="width: 100%;">
              <form method="POST">
                <div class="d-flex align-items-start mb-3 pb-1">
                  <span class="h1 fw-bold mb-0" id="roleTitle">Sign into your parent account</span>
                </div>

                <?php if (!empty($error)) { ?>
                  <div class="alert alert-danger">
                    <?= $error ?>
                  </div>
                <?php } ?>

                <div class="form-outline mb-4">
                  <label class="form-label">Username</label>
                  <input type="text" name="username" class="form-control form-control-lg w-100" required />
                </div>

                <div class="form-outline mb-4">
                  <label class="form-label">Password</label>
                  <input type="password" name="password" class="form-control form-control-lg" required />
                </div>

                <div class="pt-1 mb-4">
                  <button class="btn btn-success btn-lg btn-block" type="submit">Login</button>
                </div>

                <a class="small text-muted" href="#">Forgot password?</a>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>