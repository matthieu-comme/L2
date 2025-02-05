<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<?php

?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Qui Possède Quoi ?</title>
<style type="text/css" >
table {border-style:double;border-width: 3px;border-color: red;background-color: yellow;}
</style>
</head>
<body>
<h1>QuiPossedeQuoi.fr</h1>

<form method='get' action=''>
<fieldset>
<p>Tu veux retrouver tous les véhicules possédés par cette personne ?</p>
<label for='prenom'>Prénom</label> <input type='text' name='prenom' value='Mac' pattern='^[A-Za-z]{1,29}$'><br><br>
<label for='nom'>Nom</label> <input type='text' name='nom' value='Donald' pattern='^[A-Za-z]{1,29}$'><br><br>
<input type='submit' name='submit' value='Envoyer'>
</fieldset>
</form>
<?php
if (isset($_GET['nom']) && isset($_GET['prenom'])) {
	$nom = strtoupper(trim($_GET['nom']));
	$prenom = strtoupper(trim($_GET['prenom']));
	include("connex.inc.php");
	$idcom=connex("matthieucomme","myparam");
	$requete = "SELECT * FROM proprietaire WHERE UPPER(nom) = '".$nom."' AND UPPER(prenom) = '".$prenom."'";
	$result=@mysqli_query($idcom,$requete);
	if(!$result) {
		echo "erreur lors de la requête";
		return;
	}
	if(mysqli_num_rows($result) == 0){ 
		echo $_GET['prenom']." ". $_GET['nom']." n'est pas inscrit dans notre BDD";
		return;
	}
	
	$requete='SELECT v.immat, v.id_modele, v.couleur, v.datevoiture FROM voiture v, cartegrise cg, proprietaire p WHERE v.immat = cg.immat AND cg.id_pers = p.id_pers AND UPPER(p.nom) = "'.$nom.'" AND UPPER(p.prenom) = "'.$prenom.'" ORDER BY v.immat';	
	$result=@mysqli_query($idcom,$requete);
	if(!$result) die("erreur lors de la requête");
	if(mysqli_num_rows($result) == 0) {
		echo $_GET['prenom']." ". $_GET['nom']." ne possède pas de voiture";
	} else {
		echo 'Les voitures de '.$_GET['prenom'].' '.$_GET['nom'];
		echo '<table border="1"><br><tr>';
		while($test = mysqli_fetch_field($result)) echo '<td><strong>'.$test->name.'</strong></td>';
		while($ligne = mysqli_fetch_array($result)) {
			echo "<tr>";
			for($i = 0; $i < count($ligne)/2; $i++) {
				echo "<td>".$ligne[$i]."</td>";
			}
			echo "</tr><br>";
		}
		echo '</table>';
	}
}

?>
</body>
</html>

