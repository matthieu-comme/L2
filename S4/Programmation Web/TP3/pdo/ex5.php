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
	include("connexpdo.inc.php");
	$idcom=connexpdo("matthieucomme","myparam");
	$reqprep = $idcom->prepare("SELECT * FROM proprietaire WHERE UPPER(nom) = ? AND UPPER(prenom) = ?");
	$result = $reqprep->execute(array($nom, $prenom));
	if(!$result) {
		echo "erreur lors de la requête";
		return;
	}
	if($reqprep->rowCount() == 0){ 
		echo $_GET['prenom']." ". $_GET['nom']." n'est pas inscrit dans notre BDD";
		return;
	}
	
	$reqprep=$idcom->prepare('SELECT v.immat, m.modele, v.couleur, v.datevoiture FROM voiture v, cartegrise cg, proprietaire p, modele m WHERE v.immat = cg.immat AND cg.id_pers = p.id_pers AND v.id_modele=m.id_modele AND UPPER(p.nom) = :nom AND UPPER(p.prenom) = :prenom ORDER BY v.immat');	
	$result = $reqprep->execute(array('nom' => $nom, 'prenom' => $prenom));;
	if(!$result) echo "erreur lors de la requête";
	if($reqprep->rowCount() == 0) {
		echo $_GET['prenom']." ". $_GET['nom']." ne possède pas de voiture";
	} else {
		echo 'Les voitures de '.$_GET['prenom'].' '.$_GET['nom'];
		echo '<table border="1"><br><tr>';
		for($i = 0; $i < 4; $i++) {
			$meta = $reqprep->getColumnMeta($i);
			echo '<th>'.$meta['name'].'</th>';
		}
		echo '</tr>';
		while($ligne = $reqprep->fetch(PDO::FETCH_NUM)) {
			echo "<tr>";
			for($i = 0; $i < count($ligne); $i++) {
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
