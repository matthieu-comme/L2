<?php 
$date = date("Y-m-d H:i:s")."\n";
if (!file_exists("historique.txt")) {
	echo "Je ne trouve pas l'historique...";
	return;
}
$fichier = fopen("historique.txt","a");
if ($fichier == null) {
	echo "erreur lors de l'ouverture du fichier en mode 'a'";
	return;
}
if(!flock($fichier,2)) {
	echo "erreur de verouillage mode 2";
	return;
}
if(!fwrite($fichier,$date)) {
	echo "erreur lors de l'ecriture";
	return;
}

if(!flock($fichier,3)) {
	echo "erreur de deverouillage";
	return;
}
if(!fclose($fichier)) {
	echo "erreur lors de la fermeture du fichier";
	return;
}

$fichier = fopen("historique.txt","r");
if ($fichier == null) {
	echo "erreur lors de l'ouverture du fichier en mode 'r'";
	return;
}
if(!flock($fichier,1)) {
	echo "erreur de verouillage mode 1";
	return;
}
?>


<html>
<body>
<table border="1">
<tr>
	<th>Index</th>
	<th>Heure de connexion</th>
</tr>
<?php
$ligne = fgets($fichier);
$cpt = 1;
while($ligne != "") {
	echo "<tr><td>".$cpt."</td><td>".$ligne."</td></tr>";	
	$ligne = fgets($fichier);
	$cpt = $cpt +1;
}
echo "</table>";
if(!flock($fichier,3)) {
	echo "erreur de deverouillage";
	return;
}
if(!fclose($fichier)) {
	echo "erreur lors de la fermeture du fichier";
	return;
}
?>

</body>
</html>
