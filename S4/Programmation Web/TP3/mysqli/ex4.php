<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<?php
include("connex.inc.php");
$idcom=connex("matthieucomme","myparam");
$requete="SELECT DISTINCT(id_modele) FROM modele ORDER BY id_modele";
$result=@mysqli_query($idcom,$requete);
if(!$result) { echo "erreur lors de la requête"; return; }
?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Modèle - Recherche</title>
<style type="text/css" >
table {border-style:double;border-width: 3px;border-color: red;background-color: yellow;}
</style>
</head>
<body>
<h1>Recherche de proprios</h1>

<form method='get' action=''>
<fieldset>
<label for='id_modele'>ID Modèle</label>
<select name='id_modele'>
<?php 
while($row = mysqli_fetch_array($result)) {
	echo '<option value="'.$row[0].'">'.$row[0].'</option>';
}

?>

</select><br>
<input type='submit' name='submit' value='Envoyer'>
</fieldset>
</form>
<?php
if(isset($_GET['id_modele'])) {
	$requete="SELECT proprietaire.prenom, proprietaire.nom, cartegrise.immat FROM modele,voiture,cartegrise,proprietaire WHERE modele.id_modele=voiture.id_modele AND voiture.immat = cartegrise.immat AND cartegrise.id_pers = proprietaire.id_pers AND modele.id_modele = '".$_GET['id_modele']."'";
	$result=@mysqli_query($idcom,$requete);
	if(!$result) { echo "erreur lors de la requête"; return; }
	echo "Modèle selectionné : ".$_GET['id_modele'];
	echo "<table border='1'><br><tr><th>Prénom</th><th>Nom</th><th>Immatriculation</th></tr>";
	while($row = mysqli_fetch_array($result))
	{
	echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td></tr>";
	}
	echo "</table>";
}

?>
</body>
</html>

