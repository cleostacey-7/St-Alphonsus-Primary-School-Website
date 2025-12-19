<?php
include "db_connect.php";

// get teaching assistants info
$taResult = $conn->query("SELECT TeachingAssistantID, FirstName, LastName FROM teachingassistant ORDER BY TeachingAssistantID");
$all_ta = $taResult->fetch_all(MYSQLI_ASSOC);

// adding Teaching Assistant
if (isset($_POST["addTeachingAssistant"])) {
    $fname = $_POST["FirstName"];
    $lname = $_POST["LastName"];
    $phone = $_POST["PhoneNumber"];
    $email = $_POST["Email"];
    $salary = $_POST["AnnualSalary"];
    $dinner = $_POST["DinnerMoney"];
    $medical = $_POST["Medical"];
    $background = $_POST["BackgroundCheck"];

    $insert = "INSERT INTO teachingassistant
        (FirstName, LastName, PhoneNumber, Email, AnnualSalary, DinnerMoney, Medical, BackgroundCheck)
        VALUES ('$fname', '$lname', '$phone', '$email', $salary, $dinner, '$medical', $background)";

    $msg = $conn->query($insert) ? "Teaching Assistant added successfully!" : "Error: ".$conn->error;
}

//  Delete teaching assistant
if (isset($_POST["deleteTA"])) {
    $id = $_POST["deleteID"];
    $stmt = $conn->prepare("DELETE FROM teachingassistant WHERE TeachingAssistantID=?");
    $stmt->bind_param("i", $id);
    $msg = $stmt->execute() ? "Teaching Assistant deleted!" : "Error: ".$stmt->error;
    $stmt->close();
}

//  Update teaching assistant
if (isset($_POST["updateTA"])) {
    $id = $_POST["updateRealID"];
    $update = "UPDATE teachingassistant SET 
        FirstName='{$_POST['uFirst']}', 
        LastName='{$_POST['uLast']}', 
        PhoneNumber='{$_POST['uPhone']}', 
        Email='{$_POST['uEmail']}', 
        AnnualSalary={$_POST['uSalary']}, 
        DinnerMoney={$_POST['uDinner']}, 
        Medical='{$_POST['uMedical']}', 
        BackgroundCheck={$_POST['uBackground']} 
        WHERE TeachingAssistantID=$id";

    $msg = $conn->query($update) ? "Teaching Assistant updated!" : "Error: ".$conn->error;
}
?>
<html>
<head>
<meta charset="utf-8">
<title>St Alphonsus Primary School - Teaching Assistant</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style> /* Style for Page & Table Layout */
.page-header { 
    background-color: #4CAF50; 
    color: white; 
    padding: 40px 20px; 
    text-align: center; 
    position: sticky; 
    top: 0; 
    z-index: 10; 
}
label { 
    font-weight: bold; 
    display: block; 
    margin-top: 10px; 
}
select,input[type="text"], input[type="email"], input[type="number"] { 
    padding:6px 10px; 
    margin-bottom:10px; 
    border-radius:5px; 
    border:1px solid #ccc; 
    width:250px; 
}
input[type="submit"],button { 
    padding:8px 15px; 
    background-color:#4CAF50; 
    color:white; 
    border:none; 
    border-radius:5px; 
    cursor:pointer; 
}
input[type="submit"]:hover,button:hover { 
    background-color:#45a049; 
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
    border-radius:10px; 
    font-family: Arial, sans-serif; 
}
thead th { 
    background-color:#4CAF50; 
    color:white; 
    font-weight:bold; 
    padding:10px; 
    text-align:left; 
}
tbody td { 
    border:1px solid #ddd; 
    padding:8px; 
    text-align:left; 
}
tbody tr:nth-child(even) { 
    background-color:#f2f2f2; 
}

</style>
</head>
<body>
<!--Page Header-->
<div class="page-header">
    <h1>St Alphonsus Primary School</h1>
    <h4>Teachering Assistant</h4>
</div>

<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<h3 class="w3-bar-item w3-green">School Portal</h3>
<a href="Admin.php" class="w3-bar-item w3-button">Admin</a>
<a href="Admin_Attendance.php" class="w3-bar-item w3-button">Attendance</a>
<a href="Admin_Classes.php" class="w3-bar-item w3-button">Classes</a>
<a href="Admin_Parents.php" class="w3-bar-item w3-button">Parent</a>
<a href="Admin_Parent&Pupil.php" class="w3-bar-item w3-button">Parents & Pupil</a>
<a href="Admin_Points.php" class="w3-bar-item w3-button">Points</a>
<a href="Admin_Students.php" class="w3-bar-item w3-button">Student</a>
<a href="Admin_Teacher.php" class="w3-bar-item w3-button">Teacher</a>
<a href="Admin_TeacherAssistant.php" class="w3-bar-item w3-button w3-green">Teacher Assistant</a>
<h7><a href="index.php" class="w3-bar-item w3-button w3-green">Log Out</a></h7>
</div>

<div style="margin-left:25%; padding:20px;">
<?php if(!empty($msg)) echo "<p style='color:green;font-weight:bold;'>$msg</p>"; ?>

<!-- Select Teaching Assistant -->
<form method="POST">
    <label>Select Teaching Assistant:</label>
    <select name="TeachingAssistant" onchange="this.form.submit()">
        <option value="">-- Select a Teaching Assistant --</option>
        <?php foreach($all_ta as $t): ?>
            <option value="<?= $t['TeachingAssistantID'] ?>" <?= !empty($_POST['TeachingAssistant']) && $_POST['TeachingAssistant']==$t['TeachingAssistantID']?'selected':'' ?>><?= $t['FirstName'].' '.$t['LastName'] ?></option>
        <?php endforeach; ?>
    </select>
</form>

<!-- Show Teaching Assistant Info -->
<?php
if (!empty($_POST["TeachingAssistant"])) {
    $taID = $_POST["TeachingAssistant"];
    $res = $conn->query("SELECT * FROM teachingassistant WHERE TeachingAssistantID=$taID");
    $ta = $res->fetch_assoc();
    if ($ta) {
        echo "<div class='table-responsive'>
        <table>
            <thead>
                <tr>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>PhoneNumber</th>
                    <th>Email</th>
                    <th>AnnualSalary</th>
                    <th>DinnerMoney</th>
                    <th>Medical</th>
                    <th>BackgroundCheck</th>
                </tr>
            </thead>
            <tbody>
                <tr>";
        foreach ($ta as $k=>$v) if($k!="TeachingAssistantID") echo "<td>$v</td>";
        echo "</tr></tbody></table></div>";
    }
}
?>

<!-- Add Teaching Assistant -->
<h3>Add New Teaching Assistant</h3>
<form method="POST">
    <label>First Name:</label>
    <input type="text" name="FirstName" required>
    <label>Last Name:</label>
    <input type="text" name="LastName" required>
    <label>Phone Number:</label>
    <input type="text" name="PhoneNumber" required>
    <label>Email:</label>
    <input type="email" name="Email" required>
    <label>Annual Salary:</label>
    <input type="number" name="AnnualSalary" required>
    <label>Dinner Money:</label>
    <input type="number" name="DinnerMoney" step="0.01" required>
    <label>Medical:</label>
    <input type="text" name="Medical" required>
    <label>Background Check:</label>
    <select name="BackgroundCheck">
        <option value="1">Passed</option>
        <option value="0">Not Passed</option>
    </select>
    <br><br>
    <input type="submit" name="addTeachingAssistant" value="Add Teaching Assistant">
</form>

<!-- Update Teaching Assistant -->
<?php
if (!empty($_POST["TeachingAssistant"])) {
    $u = $ta;
?>
<hr>
<h3>Update Teaching Assistant</h3>
<form method="POST">
    <input type="hidden" name="updateRealID" value="<?= $u['TeachingAssistantID']; ?>">
    <label>First Name:</label>
    <input type="text" name="uFirst" value="<?= $u['FirstName']; ?>" required>
    <label>Last Name:</label>
    <input type="text" name="uLast" value="<?= $u['LastName']; ?>" required>
    <label>Phone Number:</label>
    <input type="text" name="uPhone" value="<?= $u['PhoneNumber']; ?>" required>
    <label>Email:</label>
    <input type="email" name="uEmail" value="<?= $u['Email']; ?>" required>
    <label>Annual Salary:</label>
    <input type="number" name="uSalary" value="<?= $u['AnnualSalary']; ?>" required>
    <label>Dinner Money:</label>
    <input type="number" name="uDinner" step="0.01" value="<?= $u['DinnerMoney']; ?>" required>
    <label>Medical:</label>
    <input type="text" name="uMedical" value="<?= $u['Medical']; ?>" required>
    <label>Background Check:</label>
    <select name="uBackground">
        <option value="1" <?= $u['BackgroundCheck']==1?'selected':'' ?>>Passed</option>
        <option value="0" <?= $u['BackgroundCheck']==0?'selected':'' ?>>Not Passed</option>
    </select>
    <br><br>
    <input type="submit" name="updateTA" value="Update Teaching Assistant">
</form>

<!-- Delete Teaching Assistant -->
<hr>
<h3>Delete Teaching Assistant</h3>
<form method="POST">
    <label>Teaching Assistant ID:</label>
    <input type="number" name="deleteID" value="<?= $u['TeachingAssistantID']; ?>" required>
    <input type="submit" name="deleteTA" value="Delete Teaching Assistant">
</form>
<?php } ?>

</div>
<?php $conn->close(); ?>
</body>
</html>
