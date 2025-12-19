<?php
$host = "localhost"; // Change if not using localhost
$username = "root"; // Default XAMPP user
$password = "";
// Default is empty in XAMPP
$database = "school_web"; // Database name
 
// Create connection
$conn = new mysqli($host, $username, $password, $database,3307);
 
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
 
echo "Connected successfully";
?>