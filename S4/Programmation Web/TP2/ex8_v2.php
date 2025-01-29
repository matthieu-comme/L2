<?php 
function foo($arg) {
	$pattern = '/\b[zZrRtTpPqQsSdDfFgGhHjJkKlLmMwWxXcCvVbBnN]+\b/';
	$res = preg_replace_callback($pattern, function ($m) {
				$s = "";
				for($i = 0; $i < strlen($m[0]); $i++) 
					$s =$s.'1';
				return "$s";} , 
		$arg);
	echo "La phrase :<i> ".$arg."</i></br>Bizarre : <i>".$res."</i>";
}
?>
<html>
<body>

<h2> Je n'aime pas les consonnes !</h2>
<form method="get" action="">
	<label for="phrase">Votre phrase avec des mots consonnes</label>
	<input type=text name="phrase">
	<input type="submit" name="submit">
</form>
<?php
 if (isset($_GET['phrase'])) {	
	foo($_GET['phrase']);
}
?>
</body>
</html>
