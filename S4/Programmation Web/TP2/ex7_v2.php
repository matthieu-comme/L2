<?php 
function bizarre($arg) {
	$pattern = '/\b[0-9]+\b/';
	$res = preg_replace_callback($pattern, function ($matches) {
				$s = 2*$matches[0];
				return "$s.$s";} , 
		$arg);
	echo "La phrase :<i> ".$arg."</i></br>Bizarre : <i>".$res."</i>";
}
?>
<html>
<body>

<h2> Fonction bizarre... ?</h2>
<form method="get" action="">
	<label for="phrase">Votre phrase avec des nombres </label>
	<input type=text name="phrase">
	<input type="submit" name="submit">
</form>
<?php
 if (isset($_GET['phrase'])) {	
	bizarre($_GET['phrase']);
}
?>
</body>
</html>
