<?php
include "db_connect.php";

//Collecting classes
$ClassResult = $conn->query("SELECT ClassID, ClassName FROM classes ORDER BY ClassID");
$all_classes = $ClassResult->fetch_all(MYSQLI_ASSOC);

// Adding a class
if (isset($_POST["addClass"])) {
    $classID = $_POST["ClassID"];
    $name = $_POST["ClassName"];
    $size = $_POST["Size"];
    $capacity = $_POST["Capacity"];
    $TA = $_POST["TeachingAssistantID"];
    $teacher = $_POST["TeacherID"];

    $insert = "INSERT INTO classes (ClassID, ClassName, Size, Capacity, TeachingAssistantID, TeacherID)
               VALUES ('$classID', '$name', '$size', '$capacity', '$TA', '$teacher')";

    if ($conn->query($insert)) {
        $msg = "Class added successfully!";
    } else {
        $msg = "Error: " . $conn->error;
    }
}

// Deleting a class
if (isset($_POST["deleteClass"])) {
    $delID = $_POST["DeleteClassID"];
    $stmt = $conn->prepare("DELETE FROM classes WHERE ClassID = ?");
    $stmt->bind_param("i", $delID);
    if ($stmt->execute()) {
        $msg = "Class deleted successfully!";
    } else {
        $msg = "Error deleting class: " . $stmt->error;
    }
    $stmt->close();
}

// updating a class
if (isset($_POST["updateClass"])) {
    $cid = $_POST["uClassID"];
    $name = $_POST["uClassName"];
    $size = $_POST["uSize"];
    $capacity = $_POST["uCapacity"];
    $TA = $_POST["uTeachingAssistantID"];
    $teacher = $_POST["uTeacherID"];

    $update = "UPDATE classes SET 
               ClassName='$name', Size='$size', Capacity='$capacity', 
               TeachingAssistantID='$TA', TeacherID='$teacher'
               WHERE ClassID=$cid";

    if ($conn->query($update)) {
        $msg = "Class updated successfully!";
    } else {
        $msg = "Error updating class: " . $conn->error;
    }
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Classes - St Alphonsus Primary School</title>
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
select, input[type="text"], input[type="number"] { 
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
<div class="page-header">
    <h1>St Alphonsus Primary School</h1>
    <h4>Classes</h4>
</div>
<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<h3 class="w3-bar-item w3-green">School Portal</h3>
<a href="Admin.php" class="w3-bar-item w3-button">Admin</a>
<a href="Admin_Attendance.php" class="w3-bar-item w3-button">Attendance</a>
<a href="Admin_Classes.php" class="w3-bar-item w3-button w3-green">Classes</a>
<a href="Admin_Parents.php" class="w3-bar-item w3-button">Parent</a>
<a href="Admin_Parent&Pupil.php" class="w3-bar-item w3-button">Parents & Pupil</a>
<a href="Admin_Points.php" class="w3-bar-item w3-button">Points</a>
<a href="Admin_Students.php" class="w3-bar-item w3-button">Student</a>
<a href="Admin_Teacher.php" class="w3-bar-item w3-button">Teacher</a>
<a href="Admin_TeacherAssistant.php" class="w3-bar-item w3-button">Teacher Assistant</a>
<h7><a href="index.php" class="w3-bar-item w3-button w3-green">Log Out</a></h7>
</div>

<div style="margin-left:25%; padding:20px;">
<?php if (!empty($msg)) echo "<p style='color:green;font-weight:bold;'>$msg</p>"; ?>

<!-- Choosing class -->
<h2>View Class</h2>
<form method="POST">
    <label>Select Class:</label>
    <select name="ClassID" onchange="this.form.submit()">
        <option value="">-- Select a Class --</option>
        <?php foreach ($all_classes as $cl): ?>
            <option value="<?= $cl['ClassID'] ?>"><?= $cl['ClassID'] ?> - <?= $cl['ClassName'] ?></option>
        <?php endforeach; ?>
    </select>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST["ClassID"])) {
    $classID = $_POST["ClassID"];
    $query = "SELECT * FROM classes WHERE ClassID = $classID";
    $res = $conn->query($query);
    $row = $res->fetch_assoc();

    // Showing the Class info in a table 
    if ($row) {
        echo "<div class='table-responsive'>
                <table>
                    <thead>
                        <tr>
                            <th>ClassID</th>
                            <th>ClassName</th>
                            <th>Size</th>
                            <th>Capacity</th>
                            <th>TeachingAssistantID</th>
                            <th>TeacherID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{$row['ClassID']}</td>
                            <td>{$row['ClassName']}</td>
                            <td>{$row['Size']}</td>
                            <td>{$row['Capacity']}</td>
                            <td>{$row['TeachingAssistantID']}</td>
                            <td>{$row['TeacherID']}</td>
                        </tr>
                    </tbody>
                </table>
              </div>";
    }
}
?>

<!-- adding class -->
<h2>Add Class</h2>
<form method="POST">
    <label>ClassID:</label>
    <input type="text" name="ClassID" required>
    <label>ClassName:</label>
    <input type="text" name="ClassName" required>
    <label>Size:</label>
    <input type="text" name="Size" required>
    <label>Capacity:</label>
    <input type="text" name="Capacity" required>
    <label>TeachingAssistantID:</label>
    <input type="text" name="TeachingAssistantID" required>
    <label>TeacherID:</label>
    <input type="text" name="TeacherID" required>
    <br><br>
    <input type="submit" name="addClass" value="Add Class">
</form>

<!-- deleting class -->
<h2>Delete Class</h2>
<form method="POST">
    <label>ClassID to Delete:</label>
    <input type="text" name="DeleteClassID" required>
    <input type="submit" name="deleteClass" value="Delete">
</form>

<!-- updating class -->
<h2>Update Class</h2>
<form method="POST">
    <label>Select ClassID to Update:</label>
    <select name="uClassID" required>
        <?php foreach ($all_classes as $cl): ?>
            <option value="<?= $cl['ClassID'] ?>"><?= $cl['ClassID'] ?> - <?= $cl['ClassName'] ?></option>
        <?php endforeach; ?>
    </select>
    <label>ClassName:</label>
    <input type="text" name="uClassName">
    <label>Size:</label>
    <input type="text" name="uSize">
    <label>Capacity:</label>
    <input type="text" name="uCapacity">
    <label>TeachingAssistantID:</label>
    <input type="text" name="uTeachingAssistantID">
    <label>TeacherID:</label>
    <input type="text" name="uTeacherID">
    <br><br>
    <input type="submit" name="updateClass" value="Update Class">
</form>

</div>
</body>
</html>

<?php $conn->close(); ?>