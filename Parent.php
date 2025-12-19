<?php
session_start();
include "db_connect.php";

if (!isset($_SESSION["logged_in_parent"])) {
    header("Location: Parent_Login.php");
    exit;
}

$parentID = $_SESSION["logged_in_parent"];

// Get Parent Info
$parentQuery = "
    SELECT FirstName, LastName, PhoneNumber, Email, Address
    FROM parents
    WHERE ParentsID = $parentID
";
$parentResult = $conn->query($parentQuery);
$parent = $parentResult->fetch_assoc();

// Get info of the parent's child
$pupilQuery = "
    SELECT p.PupilsID, p.FirstName, p.LastName, p.Gender,
           p.DoB, p.Medical, p.DinnerMoney, p.ClassID
    FROM pupils p
    INNER JOIN parentpupil pp ON p.PupilsID = pp.PupilsID
    WHERE pp.ParentsID = $parentID
";
$pupilResult = $conn->query($pupilQuery);
$pupils = $pupilResult->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Parent Portal</title>
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
    <h4>Parent</h4>
</div>

<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
    <br>
    <h3 class="w3-bar-item w3-green">Parent Portal</h3>
    <a href="Parent.php" class="w3-bar-item w3-button w3-green">My Details</a>
    <a href="Parent&Pupil.php" class="w3-bar-item w3-button">Parent & Pupil</a>
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
</tr>
</thead>
<tbody>
<tr>
    <td><?= $parent['FirstName'] ?></td>
    <td><?= $parent['LastName'] ?></td>
    <td><?= $parent['PhoneNumber'] ?></td>
    <td><?= $parent['Email'] ?></td>
    <td><?= $parent['Address'] ?></td>
</tr>
</tbody>
</table>
</div>

<!-- Children Info -->
<h2 class="mt-4">My Children</h2>
<div class="table-responsive">
<table>
<thead>
<tr>
    <th>Pupil ID</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Gender</th>
    <th>Date of Birth</th>
    <th>Medical</th>
    <th>Dinner Money</th>
    <th>Class ID</th>
</tr>
</thead>
<tbody>
<?php if (count($pupils) > 0): ?>
    <?php foreach ($pupils as $pupil): ?>
    <tr>
        <td><?= $pupil['PupilsID'] ?></td>
        <td><?= $pupil['FirstName'] ?></td>
        <td><?= $pupil['LastName'] ?></td>
        <td><?= $pupil['Gender'] ?></td>
        <td><?= $pupil['DoB'] ?></td>
        <td><?= $pupil['Medical'] ? "Yes" : "No" ?></td>
        <td><?= $pupil['DinnerMoney'] ?></td>
        <td><?= $pupil['ClassID'] ?></td>
    </tr>
    <?php endforeach; ?>
<?php else: ?>
<tr>
    <td colspan="8">No children linked to this account</td>
</tr>
<?php endif; ?>
</tbody>
</table>
</div>

</div>

</body>
</html>
