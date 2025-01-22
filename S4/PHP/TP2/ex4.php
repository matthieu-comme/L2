<?php 
if (isset($_GET['email'])) {
	echo $_GET['email'],"<br>";
	$user_pattern='[^ @]+';
	$domain_pattern='([a-z0-9\-]+\.)+[a-z]{2,3}';
	if(preg_match("/^${user_pattern}@${domain_pattern}$/",$_GET['email']))
		echo "Bravo, l'adresse email est valide !";
	else
		echo "L'adresse email n'est pas valide";
}; 
?>

<html>
<body>
<form method="get" action="">
	<label for="email">Adresse email : </label>
	<input type="text" name="email"> <br>
	<input type="submit" name="envoyer">
<form>
</body>
</html>
