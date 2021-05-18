<?php

	include "./includes/header.html";
	require "./includes/functions.php";
	session_start();
	$questions = randomQuestion();
	if(isLoggedIn()):
?>
<div class="container">
	<form action="submitQuiz.php" method="post">

	<?php
	$i = 0;
	foreach($questions as $question){
	 ?>
		<label>Q<?php echo $i+1; ?>. <?php echo $question->questionString; ?></label><br>
		<input type="radio" name="question<?php echo $i?>" value="<?php echo $question->option1Value; ?>" id="a<?php echo $i?>">
		<label for="a<?php echo $i?>"><?php echo $question->option1Value; ?></label><br>
		<input type="radio" name="question<?php echo $i?>" value="<?php echo $question->option2Value; ?>" id="b<?php echo $i?>">
		<label for="b<?php echo $i?>"><?php echo $question->option2Value; ?></label><br>
		<input type="radio" name="question<?php echo $i?>" value="<?php echo $question->option3Value; ?>" id="c<?php echo $i?>">
		<label for="c<?php echo $i?>"><?php echo $question->option3Value; ?></label><br>
		<input type="radio" name="question<?php echo $i?>" value="<?php echo $question->option4Value; ?>" id="d<?php echo $i?>">
		<label for="d<?php echo $i?>"><?php echo $question->option4Value; ?></label><br><br>
		<input type="hidden" name="question<?php echo $i?>hidden" value="<?php echo sha1($question->correctOptionId); ?>" style="display: none;">

	 <?php
	 $i++;
	} ?>
	<input type="hidden" name="totalQuestionCount" value="<?php echo count($question); ?>">
	<input type="submit" value="Complete" name="quizSubmitted" class="btn btn-primary">
</form>
</div>

<?php endif; ?>