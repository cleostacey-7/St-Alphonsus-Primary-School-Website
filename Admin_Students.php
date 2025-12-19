<?php
include "db_connect.php";

//Get pupil info
$pupilsResult = $conn->query("SELECT PupilsID, FirstName, LastName FROM pupils ORDER BY PupilsID");
$all_pupils = $pupilsResult->fetch_all(MYSQLI_ASSOC);

//add pupil
if (isset($_POST["addPupil"])) {
    $insert = "INSERT INTO pupils (FirstName, LastName, Gender, DoB, Address, Medical, DinnerMoney, ClassID)
               VALUES (
                   '{$_POST['FirstName']}',
                   '{$_POST['LastName']}',
                   '{$_POST['Gender']}',
                   '{$_POST['DoB']}',
                   '{$_POST['Address']}',
                   '{$_POST['Medical']}',
                   '{$_POST['DinnerMoney']}',
                   '{$_POST['ClassID']}'
               )";
    $msg = $conn->query($insert) ? "Pupil added successfully!" : "Error: ".$conn->error;
}

// delete pupil
if (isset($_POST["deletePupil"])) {
    $stmt = $conn->prepare("DELETE FROM pupils WHERE PupilsID=?");
    $stmt->bind_param("i", $_POST["deleteID"]);
    $msg = $stmt->execute() ? "Pupil deleted successfully!" : "Error: ".$stmt->error;
    $stmt->close();
}

// update pupil
if (isset($_POST["updatePupil"])) {
    $update = "UPDATE pupils SET
                FirstName='{$_POST['uFirst']}',
                LastName='{$_POST['uLast']}',
                Gender='{$_POST['uGender']}',
                DoB='{$_POST['uDoB']}',
                Address='{$_POST['uAddress']}',
                Medical='{$_POST['uMedical']}',
                DinnerMoney='{$_POST['uDinner']}',
                ClassID='{$_POST['uClass']}'
               WHERE PupilsID={$_POST['updateRealID']}";
    $msg = $conn->query($update) ? "Pupil updated successfully!" : "Error: ".$conn->error;
}
?>
<html>
<head>
<meta charset="utf-8">
<title>St Alphonsus Primary School - Student</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style> /* Style for Page & Table Layout */
.page-header { 
    background:#4CAF50; 
    color:white; 
    padding:40px 20px; 
    text-align:center; 
    position:sticky; 
    top:0; 
    z-index:10; 
}
label { 
    font-weight:bold; 
    display:block; 
    margin-top:10px; 
}
select,input[type="text"], input[type="email"], input[type="number"], input[type="date"] { 
    padding:6px; 
    margin-bottom:10px; 
    border:1px solid #ccc; 
    border-radius:5px; 
    width:250px; 
}
input[type="submit"],button { 
    padding:8px 15px; 
    background:#4CAF50; 
    color:white; 
    border:none; 
    border-radius:5px; 
    cursor:pointer; 
}
input[type="submit"]:hover,button:hover { 
    background:#45a049; 
}
.table-responsive { 
    width:95%; 
    margin:20px auto; 
}
table { 
    width:100%; 
    border-collapse:collapse; 
    border:2px solid #4CAF50; 
    border-radius:10px; 
    overflow:hidden; 
}
thead th { 
    background:#4CAF50; 
    color:white; 
    padding:10px; 
}
tbody td { 
    border:1px solid #ddd; 
    padding:8px; 
}
tbody tr:nth-child(even) { 
    background:#f2f2f2; 
    }
</style>
</head>
<body>

<!--Page Header-->
<div class="page-header">
    <h1>St Alphonsus Primary School</h1>
    <h4>Pupils</h4>
</div>
<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<h3 class="w3-bar-item w3-green">School Portal</h3>
<a href="Admin.php" class="w3-bar-item w3-button">Admin</a>
<a href="Admin_Attendance.php" class="w3-bar-item w3-button">Attendance</a>
<a href="Admin_Classes.php" class="w3-bar-item w3-button">Classes</a>
<a href="Admin_Parents.php" class="w3-bar-item w3-button">Parent</a>
<a href="Admin_Parent&Pupil.php" class="w3-bar-item w3-button">Parents & Pupil</a>
<a href="Admin_Points.php" class="w3-bar-item w3-button">Points</a>
<a href="Admin_Students.php" class="w3-bar-item w3-button w3-green">Student</a>
<a href="Admin_Teacher.php" class="w3-bar-item w3-button">Teacher</a>
<a href="Admin_TeacherAssistant.php" class="w3-bar-item w3-button">Teacher Assistant</a>
<h7><a href="index.php" class="w3-bar-item w3-button w3-green">Log Out</a></h7>
</div>

<div style="margin-left:25%; padding:20px;">
<?php if(!empty($msg)) echo "<p style='color:green;font-weight:bold;'>$msg</p>"; ?>

<!-- Look at Pupil -->
<h2>View Pupil</h2>
<form method="POST">
    <label>Select Pupil:</label>
    <select name="Pupil" onchange="this.form.submit()">
        <option value="">-- Select --</option>
        <?php foreach($all_pupils as $p): ?>
            <option value="<?= $p['PupilsID'] ?>"><?= $p['FirstName'].' '.$p['LastName'] ?></option>
        <?php endforeach; ?>
    </select>
</form>

<!-- Show Pupils Info -->
<?php
if(!empty($_POST["Pupil"])) {
    $pid = $_POST["Pupil"];
    $res = $conn->query("SELECT * FROM pupils WHERE PupilsID=$pid");
    $row = $res->fetch_assoc();
    if($row){
        echo "<div class='table-responsive'>
        <table>
        <thead>
        <tr>
        <th>PupilsID</th>
        <th>FirstName</th>
              <th>LastName</th>
              <th>Gender</th>
              <th>DoB</th>
              <th>Address</th>
              <th>Medical</th>
              <th>DinnerMoney</th>
              <th>ClassID</th>
        </tr>
        </thead>
        <tbody><tr>";
        foreach($row as $el) echo "<td>$el</td>";
        echo "</tr></tbody></table></div>";
    }
}
?>

<!-- Add Pupil -->
<h2>Add Pupil</h2>
<form method="POST">
    <label>First Name:</label>
    <input type="text" name="FirstName" required>
    <label>Last Name:</label>
    <input type="text" name="LastName" required>
    <label>Gender:</label>
    <select name="Gender">
        <option value="F">Female</option>
        <option value="M">Male</option>
    </select>
    <label>DoB:</label>
    <input type="date" name="DoB" required>
    <label>Address:</label>
    <input type="text" name="Address" required>
    <label>Medical:</label>
    <input type="text" name="Medical" required>
    <label>Dinner Money:</label>
    <input type="number" name="DinnerMoney" step="0.01" required>
    <label>ClassID:</label>
    <input type="text" name="ClassID" required>
    <br><input type="submit" name="addPupil" value="Add Pupil">
</form>

<!-- Delete Pupil -->
<h2>Delete Pupil</h2>
<form method="POST">
    <label>Pupils ID:</label>
    <input type="number" name="deleteID" required>
    <button type="submit" name="deletePupil">Delete</button>
</form>

<!-- Update Pupil -->
<h2>Update Pupil</h2>
<form method="POST">
    <label>Select Pupil:</label>
    <select name="updateID" onchange="this.form.submit()">
        <option value="">-- Choose Pupil --</option>
        <?php foreach($all_pupils as $p): 
            $sel = (!empty($_POST['updateID']) && $_POST['updateID']==$p['PupilsID']) ? "selected" : "";
        ?>
            <option value="<?= $p['PupilsID'] ?>" <?= $sel ?>><?= $p['FirstName'].' '.$p['LastName'] ?></option>
        <?php endforeach; ?>
    </select>
</form>

<?php
if(!empty($_POST['updateID'])){
    $uid = $_POST['updateID'];
    $u = $conn->query("SELECT * FROM pupils WHERE PupilsID=$uid")->fetch_assoc();
?>
<form method="POST">
    <input type="hidden" name="updateRealID" value="<?= $u['PupilsID']; ?>">
    <label>First Name:</label>
    <input type="text" name="uFirst" value="<?= $u['FirstName']; ?>" required>
    <label>Last Name:</label>
    <input type="text" name="uLast" value="<?= $u['LastName']; ?>" required>
    <label>Gender:</label>
    <select name="uGender">
        <option value="F" <?= $u['Gender']=="F"?"selected":""; ?>>Female</option>
        <option value="M" <?= $u['Gender']=="M"?"selected":""; ?>>Male</option>
    </select>
    <label>DoB:</label>
    <input type="date" name="uDoB" value="<?= $u['DoB']; ?>" required>
    <label>Address:</label>
    <input type="text" name="uAddress" value="<?= $u['Address']; ?>" required>
    <label>Medical:</label>
    <input type="text" name="uMedical" value="<?= $u['Medical']; ?>" required>
    <label>Dinner Money:</label>
    <input type="number" name="uDinner" step="0.01" value="<?= $u['DinnerMoney']; ?>" required>
    <label>ClassID:</label>
    <input type="text" name="uClass" value="<?= $u['ClassID']; ?>" required>
    <br><input type="submit" name="updatePupil" value="Update Pupil">
</form>
<?php } ?>

</div>
<?php $conn->close(); ?>
</body>
</html>
