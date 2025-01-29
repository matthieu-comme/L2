<?php 
function foo2($arg) {
	$pattern='/<a href="([^<>"]+)">/';
	preg_match_all($pattern,$arg,$matches);
	//var_dump($matches);
	echo "<table border='1'><th>Lien</th>";
	for($i = 0; $i < count($matches[1]); $i++)
		echo ligneTableau($matches[1][$i]);
}

function ligneTableau($ligne) : string {
	return '<tr><td>'.$ligne.'</td></tr><br>';
}
?>


<html>
<body>

<h2> T'as la href ?</h2>
<form method="get" action="">
	<label for="balises">Vos balises < a > avec href </label>
	<textarea name="balises" rows="5" cols="50">
<a href="https://openclassrooms.com">
<a href="https://google.com">
<a href="https://youtube.com">
	</textarea>
	<input type="submit" name="submit">
</form>
<?php
 if (isset($_GET['balises'])) {
 	//var_dump($_GET["balises"]);
	foo2($_GET['balises']);
}
?>
</body>
</html>
