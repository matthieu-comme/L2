<?php function convertLien($arr) { // on suppose un lien valide entre les #
	$pattern = '/#([^#]+)#/';
	$arr = preg_replace_callback($pattern, function($m) {
		return "<a href='".$m[1]."'/>".$m[1]."</a>";
	}, $arr);
	//var_dump($arr);
	return $arr;
}

?>


<html>
<body>

<h2> Transforme en # lien # ?</h2>
<form method="get" action="">
	<label for="tex">Vos balises < a > avec href </label> <br>
	<textarea name="balises" rows="5" cols="50">
Premier lien : #https://openclassrooms.com#
Deuxieme lien : #https://google.com#
Troisieme lien : #https://youtube.com#
	</textarea>
	<input type="submit" name="submit">
</form>
<?php
 if (isset($_GET['balises'])) {
 	$tab = explode("\n",$_GET["balises"]);
 	//var_dump($tab);
 	$tab = convertLien($tab);
 	//var_dump($tab);
 	for($i = 0; $i < count($tab); $i++) {
 	echo $tab[$i].'<br>';
 	}

}
?>
</body>
</html>
