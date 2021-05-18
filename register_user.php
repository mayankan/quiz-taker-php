<?php

	require "./includes/functions.php";
$uname = $_POST['uname'];
$adminCode = $_POST['adc'];

if($adminCode == getAdminCode()){
	addUser($uname);
} else {
	echo "<h1>Wrong Admin Code</h1>";
}

?>