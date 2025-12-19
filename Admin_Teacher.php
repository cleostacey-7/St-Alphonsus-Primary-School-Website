<?php
include "db_connect.php";

// Get Teacher info
$teachersResult = $conn->query("SELECT TeachersID, FirstName, LastName FROM teachers ORDER BY TeachersID");
$all_teachers = $teachersResult->fetch_all(MYSQLI_ASSOC);

// Add teacher
if (isset($_POST["addTeacher"])) {
    $insert = "INSERT INTO teachers 
        (FirstName, LastName, PhoneNumber, Email, Address, AnnualSalary, DinnerMoney, Medical, BackgroundCheck)
        VALUES (
            '{$_POST['FirstName']}',
            '{$_POST['LastName']}',
            '{$_POST['PhoneNumber']}',
            '{$_POST['Email']}',
            '{$_POST['Address']}',
            '{$_POST['AnnualSalary']}',
            '{$_POST['DinnerMoney']}',
            '{$_POST['Medical']}',
            '{$_POST['BackgroundCheck']}'
        )";
    $msg = $conn->query($insert) ? "Teacher added successfully!" : "Error: ".$conn->error;
}

// Delete teacher
if (isset($_POST["deleteTeacher"])) {
    $stmt = $conn->prepare("DELETE FROM teachers WHERE TeachersID=?");
    $stmt->bind_param("i", $_POST["deleteID"]);
    $msg = $stmt->execute() ? "Teacher deleted successfully!" : "Error: ".$stmt->error;
    $stmt->close();
}

// update teacher
if (isset($_POST["updateTeacher"])) {
    $update = "UPDATE teachers SET
                FirstName='{$_POST['uFirst']}',
                LastName='{$_POST['uLast']}',
                PhoneNumber='{$_POST['uPhone']}',
                Email='{$_POST['uEmail']}',
                Address='{$_POST['uAddress']}',
                AnnualSalary='{$_POST['uSalary']}',
                DinnerMoney='{$_POST['uDinner']}',
                Medical='{$_POST['uMedical']}',
                BackgroundCheck='{$_POST['uBackground']}'
               WHERE TeachersID={$_POST['updateRealID']}";
    $msg = $conn->query($update) ? "Teacher updated successfully!" : "Error: ".$conn->error;
}
?>
<html>
<head>
<meta charset="utf-8">
<title>St Alphonsus Primary School - Teacher</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style> /* Style for Page & Table Layout */

.page-header { 
    background-color:#4CAF50; 
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
select,input[type="text"], input[type="email"], input[type="number"] { 
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
    overflow-x:auto; 
}
table { 
    width:100%; 
    border-collapse:collapse; 
    border:2px solid #4CAF50; 
    border-radius:10px; 
    overflow:hidden; 
    font-family:Arial,sans-serif; 
}
thead th { 
    background-color:#4CAF50; 
    color:white; 
    padding:10px; 
    text-align:left; 
}
tbody td { 
    border:1px solid #ddd; 
    padding:8px; 
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
    <h4>Teachers</h4>
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
<a href="Admin_Students.php" class="w3-bar-item w3-button">Student</a>
<a href="Admin_Teacher.php" class="w3-bar-item w3-button w3-green">Teacher</a>
<a href="Admin_TeacherAssistant.php" class="w3-bar-item w3-button">Teacher Assistant</a>
<h7><a href="index.php" class="w3-bar-item w3-button w3-green">Log Out</a></h7>
</div>

<div style="margin-left:25%; padding:20px;">
<?php if(!empty($msg)) echo "<p style='color:green;font-weight:bold;'>$msg</p>"; ?>

<!-- Look at teacher -->
<h2>View Teacher</h2>
<form method="POST">
    <label>Select Teacher:</label>
    <select name="Teacher" onchange="this.form.submit()">
        <option value="">-- Select --</option>
        <?php foreach($all_teachers as $t): ?>
            <option value="<?= $t['TeachersID'] ?>"><?= $t['FirstName'].' '.$t['LastName'] ?></option>
        <?php endforeach; ?>
    </select>
</form>

<!-- Show Teacher Info -->
<?php
if(!empty($_POST["Teacher"])) {
    $tid = $_POST["Teacher"];
    $res = $conn->query("SELECT * FROM teachers WHERE TeachersID=$tid");
    $row = $res->fetch_assoc();
    if($row){
        echo "<div class='table-responsive'><table><thead>
            <tr>
                <th>TeachersID</th>
              <th>FirstName</th>
              <th>LastName</th>
              <th>PhoneNumber</th>
              <th>Email</th>
              <th>Address</th>
              <th>AnnualSalary</th>
              <th>DinnerMoney</th>
              <th>Medical</th>
              <th>BackgroundCheck</th>
            </tr>
              </thead><tbody><tr>";
        foreach($row as $el) echo "<td>$el</td>";
        echo "</tr></tbody></table></div>";
    }
}
?>

<!-- Add teacher -->
<h2>Add Teacher</h2>
<form method="POST">
    <label>First Name:</label>
    <input type="text" name="FirstName" required>
    <label>Last Name:</label>
    <input type="text" name="LastName" required>
    <label>Email:</label>
    <input type="email" name="Email" required>
    <label>Phone Number:</label>
    <input type="text" name="PhoneNumber" required>
    <label>Address:</label>
    <input type="text" name="Address" required>
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
    <br><input type="submit" name="addTeacher" value="Add Teacher">
</form>

<!-- delete teacher -->
<h2>Delete Teacher</h2>
<form method="POST">
    <label>Teacher ID:</label>
    <input type="number" name="deleteID" required>
    <button type="submit" name="deleteTeacher">Delete</button>
</form>

<!-- update teacher -->
<h2>Update Teacher</h2>
<form method="POST">
    <label>Select Teacher:</label>
    <select name="updateID" onchange="this.form.submit()">
        <option value="">-- Choose Teacher --</option>
        <?php foreach($all_teachers as $t): 
            $sel = (!empty($_POST['updateID']) && $_POST['updateID']==$t['TeachersID']) ? "selected" : "";
        ?>
            <option value="<?= $t['TeachersID'] ?>" <?= $sel ?>><?= $t['FirstName'].' '.$t['LastName'] ?></option>
        <?php endforeach; ?>
    </select>
</form>

<?php
if(!empty($_POST['updateID'])){
    $uid = $_POST['updateID'];
    $u = $conn->query("SELECT * FROM teachers WHERE TeachersID=$uid")->fetch_assoc();
?>
<form method="POST">
    <input type="hidden" name="updateRealID" value="<?= $u['TeachersID']; ?>">
    <label>First Name:</label>
    <input type="text" name="uFirst" value="<?= $u['FirstName']; ?>" required>
    <label>Last Name:</label>
    <input type="text" name="uLast" value="<?= $u['LastName']; ?>" required>
    <label>Email:</label>
    <input type="email" name="uEmail" value="<?= $u['Email']; ?>" required>
    <label>Phone Number:</label>
    <input type="text" name="uPhone" value="<?= $u['PhoneNumber']; ?>" required>
    <label>Address:</label>
    <input type="text" name="uAddress" value="<?= $u['Address']; ?>" required>
    <label>Annual Salary:</label>
    <input type="number" name="uSalary" value="<?= $u['AnnualSalary']; ?>" required>
    <label>Dinner Money:</label>
    <input type="number" name="uDinner" step="0.01" value="<?= $u['DinnerMoney']; ?>" required>
    <label>Medical:</label>
    <input type="text" name="uMedical" value="<?= $u['Medical']; ?>" required>
    <label>Background Check:</label>
    <select name="uBackground">
        <option value="1" <?= $u['BackgroundCheck']==1?"selected":""; ?>>Passed</option>
        <option value="0" <?= $u['BackgroundCheck']==0?"selected":""; ?>>Not Passed</option>
    </select>
    <br><input type="submit" name="updateTeacher" value="Update Teacher">
</form>
<?php } ?>

<?php $conn->close(); ?>
</div>
</body>
</html>

