<?php // a revoir

function foo($chaine1) : string {
	$pattern = '/\b[A-Za-z]+\b/';
	preg_match_all($pattern,$chaine1,$tab_match);
	var_dump($tab_match[0]);
	$tab_match[0] = preg_replace_callback($pattern, function ($m) {
			if(preg_match('/^[^AEIOUYaeiouy]+$/', $m[0])) {
				$res = "";
				var_dump(strlen($m[0]));
				for($i = 0; $i < count($m); $i++)
					$res = '1'.$res;
			} else $res = $m[0];
			var_dump($res);
			return $res;
			 },
		$tab_match[0]);
	var_dump($tab_match[0]);
	return $chaine1;
}
?>
<html>
<body>
<h2> Fonction qui n'aime pas les consonnes</h2>
<form method="get" action="ex8.php">
	<label for="phrase">Votre phrase  </label>
	<input type=text name="phrase">
	<input type="submit" name="submit">
</form>
<?php if (isset($_GET['phrase'])) {
	$s = $_GET['phrase'];
	echo $s."<br>";
	$s = foo($s);
	echo $s;
}
?>
</body>
</html>
