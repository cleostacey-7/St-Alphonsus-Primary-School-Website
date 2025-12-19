<?php
session_start();
include "db_connect.php";

if (!isset($_SESSION["logged_in_parent"])) {
    header("Location: Parent_Login.php");
    exit;
}

$parentID = $_SESSION["logged_in_parent"];

// Get parent and pupil info
$query = "
    SELECT ParentPupilID, PupilsID, ParentsID
    FROM parentpupil
    WHERE ParentsID = $parentID
";
$result = $conn->query($query);
$links = $result->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Parent Portal - Links</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

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
}

tbody td { 
    border: 1px solid #ddd; 
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
    <h4>Parent & Pupil</h4>
</div>

<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
    <br>
    <h3 class="w3-bar-item w3-green">Parent Portal</h3>
    <a href="Parent.php" class="w3-bar-item w3-button">My Details</a>
    <br>
    <a href="Index.php" class="w3-bar-item w3-button w3-green">Log Out</a>
</div>

<!-- Page Content -->
<div style="margin-left:25%; padding:20px;">

<h2>Parent-Pupil Relationships</h2>
<div class="table-responsive">
<table>
<thead>
<tr>
    <th>ParentPupilID</th>
    <th>PupilID</th>
    <th>ParentID</th>
</tr>
</thead>
<tbody>
<?php if (count($links) > 0): ?>
    <?php foreach ($links as $link): ?>
    <tr>
        <td><?= $link['ParentPupilID'] ?></td>
        <td><?= $link['PupilsID'] ?></td>
        <td><?= $link['ParentsID'] ?></td>
    </tr>
    <?php endforeach; ?>
<?php else: ?>
<tr>
    <td colspan="3">No links found</td>
</tr>
<?php endif; ?>
</tbody>
</table>
</div>

</div>
</body>
</html>
