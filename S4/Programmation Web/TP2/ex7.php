<?php // a revoir
function bizarre(string $arg_1) : string {	
	$pattern = '/[0-9]+/';
	preg_match_all($pattern,$arg_1,$tab_match);
	var_dump($tab_match);
		foreach($tab_match[0] as $number) {			
			$number *= 2;			
			$sub = $number.".".$number;
			$number /=2;
			$number = '/'.$number.'/';
			echo "Sub : ".$sub."<br>";
			$arg_1 = preg_replace($number,$sub,$arg_1);
			echo "Phrase : ".$arg_1."<br>";
		}
		var_dump($arg_1);
		return $arg_1;
}
?>
<html>
<body>
<h2> Fonction bizarre... ?</h2>
<form method="get" action="ex7.php">
	<label for="phrase">Votre phrase avec des nombres </label>
	<input type=text name="phrase">
	<input type="submit" name="submit">
</form>
<?php if (isset($_GET['phrase'])) {
	$s = $_GET['phrase'];	
	$s = bizarre($s);
	echo $s;
}
?>
</body>
</html>
