<?php 
if (isset($_GET['adresse'])) {
	echo $_GET['adresse'],"<br>";
	if(preg_match('/^www\.[A-Za-z]+((\.|-)[A-Za-z]+)*\.[A-Za-z]{2,4}$/',$_GET['adresse']))
		echo "Bravo, l'adresse est valide !";
	else
		echo "L'adresse n'est pas valide";
}; '(\.|-[A-Za-z]+)+'
?>

<html>
<body>
<form method="get" action="">
	<label for="adresse">Adresse HTTP</label>
	<input type="text" name="adresse"> <br>
	<input type="submit" name="envoyer">
<form>
</body>
</html>
