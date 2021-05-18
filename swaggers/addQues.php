<?php
	session_start();
	if($_SESSION['adminAccessGraned'] != 1){
		header("location:index.php");
	}
	require "../includes/functions.php";
	include "../includes/header.html";

	if($_POST['addQues']){
		$quesString = $_POST['quesString'];
		$opt1 = $_POST['opt1'];
		$opt2 = $_POST['opt2'];
		$opt3 = $_POST['opt3'];
		$opt4 = $_POST['opt4'];
		$correctOption = $_POST['correctOption'];

		addQuestion($quesString,$opt1,$opt2,$opt3,$opt4,$correctOption);
		echo "Question Added Successfully. The page will be reloaded.";
	}
?>

<form action="addQues.php" method="post">
	<label for="qs">Question</label>
	<textarea name="quesString" id="qs" cols="30" rows="10"></textarea><br/>
	<label for="opt1">Option 1</label>
	<input type="text" name="opt1" id="opt1"><br/>
	<label for="opt1">Option 2</label>
	<input type="text" name="opt2" id="opt2"><br/>
	<label for="opt1">Option 3</label>
	<input type="text" name="opt3" id="opt3"><br/>
	<label for="opt1">Option 4</label>
	<input type="text" name="opt4" id="opt4"><br/>

	<label for="correctOption">Correct Option (1,2,3,4)</label>
	<input type="text" name="correctOption" id="correctOption"><br/>
	<input type="submit" value="submit" name="addQues">

</form>