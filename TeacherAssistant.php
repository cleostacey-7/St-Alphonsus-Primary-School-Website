<?php
session_start();
include "db_connect.php";


if (!isset($_SESSION["logged_in_teacherassistant"])) {
    header("Location: TeacherAssistant_Login.php");
    exit;
}

$TeachingAssistantID = $_SESSION["logged_in_teacherassistant"];

// Get teacher assistant Info
$teacherassistantQuery = "
   SELECT FirstName, LastName, PhoneNumber, Email,
           DinnerMoney, BackgroundCheck, AnnualSalary, Medical
    FROM teachingassistant
    WHERE TeachingAssistantID = $TeachingAssistantID
";

$teacherassistantResult = $conn->query($teacherassistantQuery);
$teacherassistant = $teacherassistantResult->fetch_assoc();

// Get classes info assgined to the correct teacher assistant
$classQuery = "
    SELECT ClassID, ClassName, Size, Capacity
    FROM classes
    WHERE TeachingAssistantID = $TeachingAssistantID
";
$classResult = $conn->query($classQuery);
$classes = $classResult->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Teacher Assistant Portal</title>
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
    <h4>Teacher Assistant </h4>
</div>

<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
    <br>
    <h3 class="w3-bar-item w3-green">Teacher Assistant Portal</h3>
    <a href="TeacherAssistant.php" class="w3-bar-item w3-button w3-green">My Details</a>
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
    <th>Dinner Money</th>
    <th>Background Check</th>
    <th>Annual Salary</th>
    <th>Medical</th>
</tr>
</thead>
<tbody>
<tr>
    <td><?= $teacherassistant ['FirstName'] ?></td>
    <td><?= $teacherassistant ['LastName'] ?></td>
    <td><?= $teacherassistant ['PhoneNumber'] ?></td>
    <td><?= $teacherassistant ['Email'] ?></td>
    <td><?= $teacherassistant ['DinnerMoney'] ?></td>
    <td><?= $teacherassistant ['BackgroundCheck'] == 1 ? "Passed" : "Not Passed" ?></td>
    <td><?= $teacherassistant ['AnnualSalary'] ?></td>
    <td><?= $teacherassistant ['Medical'] ?></td>
</tr>
</tbody>
</table>
</div>

<!-- CLASSES -->
<h2>Your Class(es)</h2>
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
<?php if (count($classes) > 0) { ?>
    <?php foreach ($classes as $class) { ?>
    <tr>
        <td><?= $class['ClassID'] ?></td>
        <td><?= $class['ClassName'] ?></td>
        <td><?= $class['Size'] ?></td>
        <td><?= $class['Capacity'] ?></td>
    </tr>
    <?php } ?>
<?php } else { ?>
    <tr>
        <td colspan="4">No classes assigned.</td>
    </tr>
<?php } ?>
</tbody>
</table>
</div>

</div>

</body>
</html>