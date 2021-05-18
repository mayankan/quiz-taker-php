<?php
session_start();
$_SESSION['adminAccessGraned'] = 0;
require "./includes/functions.php";

	include "./includes/header.html";
	include "./includes/login.php";
	include "./includes/footer.html";
?>