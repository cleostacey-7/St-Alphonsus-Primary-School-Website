<?php
include "db_connect.php";

// get points info
$PointsResult = $conn->query("SELECT PointsID, PupilsID FROM points ORDER BY PointsID");
$all_points = $PointsResult->fetch_all(MYSQLI_ASSOC);

//add points
if (isset($_POST["addPoints"])) {
    $id = $_POST["PointsID"];
    $pos = $_POST["Positive"];
    $neg = $_POST["Negative"];
    $tot = $_POST["Total"];
    $pupil = $_POST["PupilsID"];

    $insert = "INSERT INTO points (PointsID, Positive, Negative, Total, PupilsID)
               VALUES ('$id', '$pos', '$neg', '$tot', '$pupil')";
    $msg = $conn->query($insert) ? "Points added successfully!" : "Error: " . $conn->error;
}

// delete points
if (isset($_POST["deletePoints"])) {
    $delID = $_POST["DeletePointsID"];
    $stmt = $conn->prepare("DELETE FROM points WHERE PointsID = ?");
    $stmt->bind_param("i", $delID);
    $msg = $stmt->execute() ? "Points deleted successfully!" : "Error deleting: " . $stmt->error;
    $stmt->close();
}

//update points
if (isset($_POST["updatePoints"])) {
    $id = $_POST["uPointsID"];
    $pos = $_POST["uPositive"];
    $neg = $_POST["uNegative"];
    $tot = $_POST["uTotal"];
    $pupil = $_POST["uPupilsID"];

    $update = "UPDATE points SET Positive='$pos', Negative='$neg', Total='$tot', PupilsID='$pupil' WHERE PointsID=$id";
    $msg = $conn->query($update) ? "Points updated successfully!" : "Error updating: " . $conn->error;
}
?>
<html>
<head>
<meta charset="utf-8">
<title>Points - St Alphonsus Primary School</title>
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
    <h4>Points</h4>
</div>
<!--Sidebar-->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<h3 class="w3-bar-item w3-green">School Portal</h3>
<a href="Admin.php" class="w3-bar-item w3-button">Admin</a>
<a href="Admin_Attendance.php" class="w3-bar-item w3-button">Attendance</a>
<a href="Admin_Classes.php" class="w3-bar-item w3-button">Classes</a>
<a href="Admin_Parents.php" class="w3-bar-item w3-button">Parent</a>
<a href="Admin_Parent&Pupil.php" class="w3-bar-item w3-button">Parents & Pupil</a>
<a href="Admin_Points.php" class="w3-bar-item w3-button w3-green">Points</a>
<a href="Admin_Students.php" class="w3-bar-item w3-button">Student</a>
<a href="Admin_Teacher.php" class="w3-bar-item w3-button">Teacher</a>
<a href="Admin_TeacherAssistant.php" class="w3-bar-item w3-button">Teacher Assistant</a>
<h7><a href="index.php" class="w3-bar-item w3-button w3-green">Log Out</a></h7>
</div>

<div style="margin-left:25%; padding:20px;">
<?php if (!empty($msg)) echo "<p style='color:green;font-weight:bold;'>$msg</p>"; ?>

<!-- Look at points -->
<h2>View Points</h2>
<form method="POST">
    <label>Select Points:</label>
    <select name="Points" onchange="this.form.submit()">
        <option value="">-- Select --</option>
        <?php foreach ($all_points as $p): ?>
            <option value="<?= $p['PointsID'] ?>">PointsID <?= $p['PointsID'] ?> - Pupil <?= $p['PupilsID'] ?></option>
        <?php endforeach; ?>
    </select>
</form>

<!-- Show Points -->
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST["Points"])) {
    $id = $_POST["Points"];
    $query = "SELECT * FROM points WHERE PointsID=$id";
    $res = $conn->query($query);
    $row = $res->fetch_assoc();
    if ($row) {
        echo "<div class='table-responsive'>
                <table>
                    <thead>
                        <tr><th>PointsID</th>
                        <th>Positive</th>
                        <th>Negative</th>
                        <th>Total</th>
                        <th>PupilsID</th></tr>
                    </thead>
                    <tbody>
                        <tr><td>{$row['PointsID']}</td><td>{$row['Positive']}</td><td>{$row['Negative']}</td><td>{$row['Total']}</td><td>{$row['PupilsID']}</td></tr>
                    </tbody>
                </table>
              </div>";
    }
}
?>

<!-- Add Points -->
<h2>Add Points</h2>
<form method="POST">
    <label>PointsID:</label>
    <input type="text" name="PointsID" required>
    <label>Positive:</label>
    <input type="text" name="Positive" required>
    <label>Negative:</label>
    <input type="text" name="Negative" required>
    <label>Total:</label>
    <input type="text" name="Total" required>
    <label>PupilsID:</label>
    <input type="text" name="PupilsID" required>
    <br><br>
    <input type="submit" name="addPoints" value="Add">
</form>

<!-- Delete Points -->
<h2>Delete Points</h2>
<form method="POST">
    <label>PointsID to Delete:</label>
    <input type="text" name="DeletePointsID" required>
    <input type="submit" name="deletePoints" value="Delete">
</form>

<!-- Update Points -->
<h2>Update Points</h2>
<form method="POST">
    <label>Select PointsID to Update:</label>
    <select name="uPointsID" required>
        <?php foreach ($all_points as $p): ?>
            <option value="<?= $p['PointsID'] ?>">PointsID <?= $p['PointsID'] ?> - Pupil <?= $p['PupilsID'] ?></option>
        <?php endforeach; ?>
    </select>
    <label>Positive:</label>
    <input type="text" name="uPositive">
    <label>Negative:</label>
    <input type="text" name="uNegative">
    <label>Total:</label>
    <input type="text" name="uTotal">
    <label>PupilsID:</label>
    <input type="text" name="uPupilsID">
    <br><br>
    <input type="submit" name="updatePoints" value="Update">
</form>

</div>
</body>
</html>

<?php $conn->close(); ?>
