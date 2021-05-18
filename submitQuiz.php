<?php
	session_start();
	require "./includes/functions.php";

	$totalScore = 0;
	$count = $_POST['totalQuestionCount'];
	for($i = 0;$i < $count;$i++){
		$name = "question".$i;
		$nameC = "question".$i."hidden";

		if(sha1($_POST[$name]) == $_POST[$nameC]){
			$totalScore += 1;
		}
	}

	if(updateScore($totalScore,$_SESSION['loggedUserId'])){
		$_SESSION['loggedUserId'] = -1;
		$_SESSION['isLoggedIn'] = 0;
		echo "<h1>Thankyou for your Submission</h1><br/><p>Contact Administrator for result</p>";
	} else {
		echo "<p>SYSTEM ERROR: CONTACT YOUR ADMINISTRATOR FOR HELP.</p>";
	}

?>