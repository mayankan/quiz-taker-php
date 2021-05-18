<?php

	session_start();
	require "../includes/functions.php";
	include "../includes/header.html";
	if($_POST['adminAccessRequested']){
		if($_POST['pass'] == "admin1" || $_POST['pass'] == "admin2" || $_POST['pass'] == "admin3"){
			$_SESSION['adminAccessGraned'] = 1;
		}
	}

	if($_SESSION['adminAccessGraned'] != 1):
?>
<div class="container center">
	<form action="index.php" method="post">
		<div class="form-group">
		<label for="pass">Enter Admin Password</label><br>
		<input type="password" id="pass" name="pass"><br>
		</div>
		<input type="submit" value="Login" name="adminAccessRequested" class="btn btn-primary">
	</form>
</div>

<?php elseif ($_SESSION['adminAccessGraned'] == 1): ?>
<div class="container center">
	<table border="1" cellpadding="20px" align="center">
		<tr>
			<th>Registration ID</th>
			<th>Total Score</th>
		</tr>

		<?php
			$result = getUsers();

			while($row = mysqli_fetch_assoc($result)){
		 ?>

			<tr>
				<td><?php echo $row['rid']; ?></td>
				<td><?php echo $row['totalscore']; ?>/20</td>
			</tr>

			<?php } ?>
	</table>
</div>
<?php endif; ?>