<?php

	function getAdminCode(){
		return "F0un@123";
	}
	function getAdminKey(){
		return "9nupXA0vbbpxTUyOEn4gEV8EWN9NHJH9LUhvusReOXjkcLql13gWs0Q8X0sXRR85";
	}
	function isLoggedIn(){
			return $_SESSION['isLoggedIn'] == 1;
	}
	function addUser($rid){
		$conn = makeDbConnection();

		$sql_query = "Insert into mc_users (rid) values ('$rid');";

		$done = mysqli_query($conn,$sql_query);
		mysqli_close($conn);
		return $done;
	}

	function loginUser($rid){
		$conn = makeDbConnection();
		$id = -1;

		$sql = "SELECT id,hasplayed FROM mc_users WHERE rid = '$rid';";
        $result = mysqli_query($conn,$sql);
        $count = mysqli_num_rows($result);
        if($count == 1){
           	$row = mysqli_fetch_assoc($result);
           	$id = $row['id'];
           	$hasPlayed = $row['hasplayed'];
           	if($hasPlayed == 0){
           	$sql_query = "update mc_users set hasplayed = 1 where id = $id;";
           	if(!mysqli_query($conn,$sql_query)){
           		$id = -1;
        	}
           } else {
           	$id = -1;
           }

        }
        mysqli_close($conn);
        return $id;

	}

	function getUsers(){
		$conn = makeDbConnection();
		$sql = "SELECT rid,totalscore From mc_users where hasplayed = 1;";
		$result = mysqli_query($conn,$sql);
		mysqli_close($conn);
		return $result;
	}

	function addQuestion($quesString,$opt1,$opt2,$opt3,$opt4,$correctOption){
		// $conn = makeDbConnection();

		// $sqlOption1 = "Insert into mc_options1 (optionValue) values ('$opt1');";
		// mysqli_query($conn,$sqlOption1);
		// $id1 = mysqli_insert_id($conn,$sqlOption1);

		// $sqlOption2 = "Insert into mc_options2 (optionId,optionValue) values ($id1,'$opt2');";
		// mysqli_query($conn,$sqlOption2);
		// $id2 = mysqli_insert_id($conn);

		// $sqlOption3 = "Insert into mc_options3 (optionId,optionValue) values ($id1,'$opt3');";
		// mysqli_query($conn,$sqlOption3);
		// $id3 = mysqli_insert_id($conn);
		// $sqlOption4 = "Insert into mc_options4 (optionId,optionValue) values ($id1,'$opt4');";
		// mysqli_query($conn,$sqlOption4);
		// $id4 = mysqli_insert_id($conn);

		// $sqlQuestion = "Insert into mc_question (quesString,correctOptId,option1,option2,option3,option4) values ('$quesString',$id1,$id2,$id3,$id4,$correctOption);";
		// mysqli_query($conn,$sqlQuestion);

		$conn = makeDbConnection();
		$sqlGetCount = "SELECT * from mc_options1";
		$result = mysqli_query($conn,$sqlGetCount);
		$id = mysqli_num_rows($result) + 1;

		$sqlOption1 = "Insert into mc_options1 (optionId,optionValue) values ($id,'$opt1');";
		mysqli_query($conn,$sqlOption1);
		// $id1 = mysql_insert_id();

		$sqlOption2 = "Insert into mc_options2 (optionId,optionValue) values ($id,'$opt2');";
		mysqli_query($conn,$sqlOption2);

		$sqlOption3 = "Insert into mc_options3 (optionId,optionValue) values ($id,'$opt3');";
		mysqli_query($conn,$sqlOption3);

		$sqlOption4 = "Insert into mc_options4 (optionId,optionValue) values ($id,'$opt4');";
		mysqli_query($conn,$sqlOption4);

		$sqlQuestion = "Insert into mc_question (qid,quesString,correctOptId,option1,option2,option3,option4) values ($id,'$quesString',$correctOption,$id,$id,$id,$id);";

		mysqli_query($conn,$sqlQuestion);
		mysqli_close($conn);

	}

	function randomQuestion(){
		$conn = makeDbConnection();
		$sql = "SELECT * FRom mc_question order by RAND() limit 20;";
		$questions = array();
		$result = mysqli_query($conn,$sql);
		$i = 0;
		while($row = mysqli_fetch_assoc($result)){
			$question = new Questions();
			$question->questionId = $row['qid'];
			$question->questionString = $row['quesString'];
			$question->correctOptionId = getOptionsFromQuestion($row['option1'],$row['correctOptId']);
			$question->option1Id = $row['option1'];
			$question->option1Value = getOptionsFromQuestion($row['option1'],1);
			$question->option2Id = $row['option2'];
			$question->option2Value = getOptionsFromQuestion($row['option2'],2);
			$question->option3Id = $row['option3'];
			$question->option3Value = getOptionsFromQuestion($row['option3'],3);
			$question->option4Id = $row['option4'];
			$question->option4Value = getOptionsFromQuestion($row['option4'],4);

			array_push($questions,$question);
		}
		mysqli_close($conn);
		return $questions;
	}

	class Questions{
		public $questionId = "";
		public $questionString = "";
		public $correctOptionId = "";
		public $option1Id = "";
		public $option1Value = "";
		public $option2Id = "";
		public $option2Value = "";
		public $option3Id = "";
		public $option3Value = "";
		public $option4Id = "";
		public $option4Value = "";

		// public function __construct($questionId,$questionString,$correctOption,$option1Id,$option1Value,$option2Id,$option2Value,$option3Id,$option3Value,$option4Id,$option4Value){

		// 	this

		// }


	}

	function getOptionsFromQuestion($id,$optionNumber){
		$conn = makeDbConnection();
		$tableName = "mc_options".$optionNumber;
		$sql = "SELECT optionValue FRom $tableName where optionId = $id;";
		$result = mysqli_query($conn,$sql);
		mysqli_close($conn);
		return mysqli_fetch_assoc($result)['optionValue'];
	}

	function updateScore($score,$uid){
		$conn = makeDbConnection();
		$sql = "update mc_users set totalscore = $score where id=$uid";
		return mysqli_query($conn,$sql);
	}

	function makeDbConnection(){
		$servername = "localhost";
		$username = "tanseersaji";
		$password = "";
		$database = "mindcoder";
		$conn = mysqli_connect($servername, $username, $password,$database);
		if (!$conn) {
	    	return null;
		} else {
			return $conn;
		}
	}

?>