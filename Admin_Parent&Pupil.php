<?php
include "db_connect.php"; 

// Get ParentPupil info
$ParentPupilResult = $conn->query("SELECT ParentPupilID, PupilsID, ParentsID FROM parentpupil ORDER BY ParentPupilID");
$all_parentpupil = $ParentPupilResult->fetch_all(MYSQLI_ASSOC);

// Add new ParentPupil info
if (isset($_POST["addParentPupil"])) {
    $id = $_POST["ParentPupilID"];
    $pupil = $_POST["PupilsID"];
    $parent = $_POST["ParentsID"];

    $insert = "INSERT INTO parentpupil (ParentPupilID, PupilsID, ParentsID) 
               VALUES ('$id', '$pupil', '$parent')";
    $msg = $conn->query($insert) ? "Parent-Pupil added successfully!" : "Error: " . $conn->error;
}

// Delete ParentPupil info
if (isset($_POST["deleteParentPupil"])) {
    $delID = $_POST["DeleteParentPupilID"];
    $stmt = $conn->prepare("DELETE FROM parentpupil WHERE ParentPupilID = ?");
    $stmt->bind_param("i", $delID);
    $msg = $stmt->execute() ? "Parent-Pupil deleted successfully!" : "Error deleting: " . $stmt->error;
    $stmt->close();
}

//Update ParentPupil
if (isset($_POST["updateParentPupil"])) {
    $id = $_POST["uParentPupilID"];
    $pupil = $_POST["uPupilsID"];
    $parent = $_POST["uParentsID"];

    $update = "UPDATE parentpupil SET PupilsID='$pupil', ParentsID='$parent' WHERE ParentPupilID=$id";
    $msg = $conn->query($update) ? "Parent-Pupil updated successfully!" : "Error updating: " . $conn->error;
}
?>
<html>
<head>
<meta charset="utf-8">
<title>Parent & Pupil - St Alphonsus Primary School</title>
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
select, input[type="text"] { 
    padding:6px; 
    margin-bottom:10px; 
    width:250px; 
    border-radius:5px; 
    border:1px solid #ccc; 
}
input[type="submit"] { 
    padding:8px 15px; 
    background:#4CAF50; 
    color:white; 
    border:none; 
    border-radius:5px; 
    cursor:pointer; 
}
input[type="submit"]:hover { 
    background:#45a049; 
}
.table-responsive { 
    width:95%; 
    margin:20px auto; 
    overflow-x:auto; 
}
table { 
    width:100%; 
    border-collapse:collapse; 
    border:2px solid #4CAF50; 
    font-family:Arial,sans-serif; 
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
    <h4>Parent & Pupil</h4>
</div>
<!--Sidebar-->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<h3 class="w3-bar-item w3-green">School Portal</h3>
<a href="Admin_Admin.php" class="w3-bar-item w3-button">Admin</a>
<a href="Admin_Attendance.php" class="w3-bar-item w3-button">Attendance</a>
<a href="Admin_Classes.php" class="w3-bar-item w3-button">Classes</a>
<a href="Admin_Parents.php" class="w3-bar-item w3-button">Parent</a>
<a href="Admin_Parent&Pupil.php" class="w3-bar-item w3-button w3-green">Parents & Pupil</a>
<a href="Admin_Points.php" class="w3-bar-item w3-button">Points</a>
<a href="Admin_Students.php" class="w3-bar-item w3-button">Student</a>
<a href="Admin_Teacher.php" class="w3-bar-item w3-button">Teacher</a>
<a href="Admin_TeacherAssistant.php" class="w3-bar-item w3-button">Teacher Assistant</a>
<h7><a href="index.php" class="w3-bar-item w3-button w3-green">Log Out</a></h7>
</div>

<div style="margin-left:25%; padding:20px;">
<?php if (!empty($msg)) echo "<p style='color:green;font-weight:bold;'>$msg</p>"; ?>

<!-- Choosing Parent & Pupil Info -->
<h2>View Parent & Pupil</h2>
<form method="POST">
    <label>Select Parent & Pupil:</label>
    <select name="ParentPupil" onchange="this.form.submit()">
        <option value="">-- Select --</option>
        <?php foreach ($all_parentpupil as $pp): ?>
            <option value="<?= $pp['ParentPupilID'] ?>"><?= $pp['ParentPupilID'] ?> - Parent <?= $pp['ParentsID'] ?> / Pupil <?= $pp['PupilsID'] ?></option>
        <?php endforeach; ?>
    </select>
</form>

<!-- Show Parent & Pupil Info -->
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST["ParentPupil"])) {
    $id = $_POST["ParentPupil"];
    $query = "SELECT * FROM parentpupil WHERE ParentPupilID=$id";
    $res = $conn->query($query);
    $row = $res->fetch_assoc();
    if ($row) {
        echo "<div class='table-responsive'>
                <table>
                    <thead>
                        <tr>
                        <th>ParentPupilID</th>
                        <th>ParentsID</th>
                        <th>PupilsID</th></tr>
                    </thead>
                    <tbody>
                        <tr><td>{$row['ParentPupilID']}</td><td>{$row['ParentsID']}</td><td>{$row['PupilsID']}</td></tr>
                    </tbody>
                </table>
              </div>";
    }
}
?>

<!-- Adding Parent & Pupil -->
<h2>Add Parent & Pupil</h2>
<form method="POST">
    <label>ParentPupilID:</label>
    <input type="text" name="ParentPupilID" required>
    <label>PupilsID:</label>
    <input type="text" name="PupilsID" required>
    <label>ParentsID:</label>
    <input type="text" name="ParentsID" required>
    <br><br>
    <input type="submit" name="addParentPupil" value="Add">
</form>

<!-- Deleting Parent & Pupil -->
<h2>Delete Parent & Pupil</h2>
<form method="POST">
    <label>ParentPupilID to Delete:</label>
    <input type="text" name="DeleteParentPupilID" required>
    <input type="submit" name="deleteParentPupil" value="Delete">
</form>

<!-- Updating Parent & Pupil -->
<h2>Update Parent & Pupil</h2>
<form method="POST">
    <label>Select ParentPupilID to Update:</label>
    <select name="uParentPupilID" required>
        <?php foreach ($all_parentpupil as $pp): ?>
            <option value="<?= $pp['ParentPupilID'] ?>"><?= $pp['ParentPupilID'] ?> - Parent <?= $pp['ParentsID'] ?> / Pupil <?= $pp['PupilsID'] ?></option>
        <?php endforeach; ?>
    </select>
    <label>PupilsID:</label>
    <input type="text" name="uPupilsID">
    <label>ParentsID:</label>
    <input type="text" name="uParentsID">
    <br><br>
    <input type="submit" name="updateParentPupil" value="Update">
</form>

</div>
</body>
</html>

<?php $conn->close(); ?>
