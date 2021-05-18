<?php
	session_start();
	$_SESSION['loggedUserId'] = -1;
	$_SESSION['isLoggedIn'] = 0;
	header("location:index.php");
?>