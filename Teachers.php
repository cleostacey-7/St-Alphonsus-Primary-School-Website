<?php
session_start();
include "db_connect.php";


if (!isset($_SESSION["logged_in_teacher"])) {
    header("Location: Teacher_Login.php");
    exit;
}

$teacherID = $_SESSION["logged_in_teacher"];

// Get teacher Info
$teacherQuery = "
    SELECT FirstName, LastName, PhoneNumber, Email, Address,
           AnnualSalary, DinnerMoney, Medical, BackgroundCheck
    FROM teachers
    WHERE TeachersID = $teacherID
";
$teacherResult = $conn->query($teacherQuery);
$teacher = $teacherResult->fetch_assoc();

// Get classes info assgined to the correct teacher assistant
$classQuery = "
    SELECT ClassID, ClassName, Size, Capacity
    FROM classes
    WHERE TeacherID = $teacherID
";
$classResult = $conn->query($classQuery);
$classes = $classResult->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Teacher Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style> /*Page and Table Layout*/
.page-header {
    background-color: #4CAF50;
    color: white;
    padding: 35px;
    text-align: center;
}

.table-responsive {
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #4CAF50;
    color: white;
    padding: 10px;
}

td {
    padding: 8px;
    border: 1px solid #ddd;
}

tr:nth-child(even) {
    background: #f2f2f2;
}
</style>
</head>

<body>

<!--Page Header-->
<div class="page-header">
    <h1>St Alphonsus Primary School</h1>
    <h4>Teacher </h4>
</div>

<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
    <br>
    <h3 class="w3-bar-item w3-green">Teacher Portal</h3>
    <a href="Teacher.php" class="w3-bar-item w3-button w3-green">My Details</a>
    <br>
    <a href="Index.php" class="w3-bar-item w3-button w3-green">Log Out</a>
</div>

<!-- Page Content -->
<div style="margin-left:25%; padding:20px;">

<h2>My Information</h2>
<div class="table-responsive">
<table>
<thead>
<tr>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Phone</th>
    <th>Email</th>
    <th>Address</th>
    <th>Salary</th>
    <th>Dinner Money</th>
    <th>Medical</th>
    <th>Background Check</th>
</tr>
</thead>
<tbody>
<tr>
    <td><?= $teacher['FirstName'] ?></td>
    <td><?= $teacher['LastName'] ?></td>
    <td><?= $teacher['PhoneNumber'] ?></td>
    <td><?= $teacher['Email'] ?></td>
    <td><?= $teacher['Address'] ?></td>
    <td><?= $teacher['AnnualSalary'] ?></td>
    <td><?= $teacher['DinnerMoney'] ?></td>
    <td><?= $teacher['Medical'] ?></td>
    <td><?= $teacher['BackgroundCheck'] == 1 ? "Passed" : "Not Passed" ?></td>
</tr>
</tbody>
</table>
</div>

<!-- Classes Info -->
<h2 class="mt-4">Class(es)</h2>
<div class="table-responsive">
<table>
<thead>
<tr>
    <th>Class ID</th>
    <th>Class Name</th>
    <th>Size</th>
    <th>Capacity</th>
</tr>
</thead>
<tbody>
<?php if (count($classes) > 0): ?>
    <?php foreach ($classes as $class): ?>
    <tr>
        <td><?= $class['ClassID'] ?></td>
        <td><?= $class['ClassName'] ?></td>
        <td><?= $class['Size'] ?></td>
        <td><?= $class['Capacity'] ?></td>
    </tr>
    <?php endforeach; ?>
<?php else: ?>
<tr>
    <td colspan="4">No classes assigned</td>
</tr>
<?php endif; ?>
</tbody>
</table>
</div>

</div>

</body>
</html>