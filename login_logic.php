<?php
	require "./includes/functions.php";
	session_start();
	$rid = $_POST['uname'];

	if(trim($rid) == ""){
		header("location:index.php");
	}

	if(addUser($rid)){
		$id = loginUser($rid);
	}
		if($id != -1){
		$_SESSION['loggedUserId'] = $id;
		$_SESSION['isLoggedIn'] = 1;
		header("location:quiz.php");
	} else {
		 include "./includes/header.html";
		echo "<p>Some glitch happened. <br/> Ask your nearest Coordinator or Volunteer for help.</p>";
	}

?>