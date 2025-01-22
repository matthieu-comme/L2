<?php 
$date = date("Y-m-d H:i:s");
//echo $date."<br>";
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
echo "c'est ecrit inch";
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
fread($fichier);
if(!flock($fichier,3)) {
	echo "erreur de deverouillage";
	return;
}
if(!fclose($fichier)) {
	echo "erreur lors de la fermeture du fichier";
	return;
}
?>

<html>
<body>

</body>
</html>
