<html>
<body>
<h2 align=center>Jeu : plus grand, plus petit</h2>
<?php // FIXER LE PROBLEME DE RANDOM !!!!!
if (!isset($_POST["a_trouver"])) { //
	$a_trouver = mt_rand(0,100);
	$_POST['a_trouver'] = $a_trouver;
}  
?>
<form method="post" action="juste_prix.php">
	Proposez un prix entre 0 et 100 :
	<input type="text" name="propose"><br>
	<input type="hidden" name="a_trouver" value="<?php echo $a_trouver;?>">
	<input type="submit" name="submit" value="Essayer">
</form>
<?php
if (isset($_POST['propose'])) {
	$n = $a_trouver;
	if($n < $_POST['a_trouver']) echo "c'est +"; 
	else if ($n > $_POST['a_trouver']) echo "c'est -";
	else echo "VICTOIRE";
}
?>
</body>
</html>
