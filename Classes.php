<?php
session_start();
include "db_connect.php";

if (!isset($_SESSION["logged_in_pupil"])) {
    header("Location: Student_Login.php");
    exit;
}

$pupilID = $_SESSION["logged_in_pupil"];

// Get pupils class
$query = "SELECT ClassID, ClassName, Size, Capacity, TeachingAssistantID, TeacherID
          FROM classes WHERE ClassID = (SELECT ClassID FROM pupils WHERE PupilsID = $pupilID )";
$result = $conn->query($query);
$all_classes = $result->fetch_all(MYSQLI_ASSOC);

?>

<html>
<head>
  <meta charset="utf-8">
  <title>My Class - Student - St Alphonsus Primary School </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <style> /*Page and Table Layout*/
.page-header {
    background-color: #4CAF50;
    color: white;
    padding: 40px 20px;
    text-align: center;
}
.table-responsive {
    width: 95%;
    margin: 20px auto;
}
table {
    width: 100%;
    border-collapse: collapse;
    border: 2px solid #4CAF50;
    border-radius: 10px;
}
thead th {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    text-align: left;
}
tbody td {
    border: 1px solid #dddddd;
    padding: 8px;
}
tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}
  </style>
</head>

<body>
<!--Page Header-->
<div class="page-header">
    <h1>St Alphonsus Primary School</h1>
    <h4> Classes</h4>
</div>

<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
  <br>
  <h3 class="w3-bar-item w3-green">Student Portal</h3>
  <a href="Student.php" class="w3-bar-item w3-button">Student Profile</a>
  <a href="Attendance.php" class="w3-bar-item w3-button">Attendance</a>
  <a href="Classes.php" class="w3-bar-item w3-button w3-green">Classes</a>
  <a href="Points.php" class="w3-bar-item w3-button">Points</a>
  <a href="index.php" class="w3-bar-item w3-button w3-green">Log Out</a>
</div>

<!-- Page content -->
<div style="margin-left:25%; padding: 20px;">
    <h3>Class Details</h3>
    <div class="table-responsive">
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
                <?php foreach ($all_classes as $row): ?>
                    <tr>
                        <td><?= $row['ClassID'] ?></td>
                        <td><?= $row['ClassName'] ?></td>
                        <td><?= $row['Size'] ?></td>
                        <td><?= $row['Capacity'] ?></td>
                        <td><?= $row['TeachingAssistantID'] ?></td>
                        <td><?= $row['TeacherID'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
