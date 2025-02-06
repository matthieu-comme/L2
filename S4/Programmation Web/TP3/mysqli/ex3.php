<?php
function isIDValid($id) : bool {
	$pattern = '/^[A-Z0-9]{1,10}$/';
	return preg_match($pattern,$id);
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Modèle - Insertion</title>
<style type="text/css" >
table {border-style:double;border-width: 3px;border-color: red;background-color: yellow;}
</style>
</head>
<body>
<h1>Insérer dans `Modèle`</h1>
<form method='get' action=''>
<fieldset>
<label for='id_modele'>ID Modèle [A-Z0-9]{1,10}</label> <input type='text' name='id_modele'> <br>
<label for='nom_modele'>Modèle</label> <input type='text' name='nom_modele'><br>
<label for='carburant'>Carburant</label>
<select name='carburant'>
<option value='essence'>Essence</option>
<option value='diesel'>Diesel</option>
<option value='electrique'>Electrique</option>
</select><br>
<input type='submit' name='submit' value='Envoyer'>
</fieldset>
</form>
<?php
if(!(isset($_GET['id_modele']) && isset($_GET['nom_modele']) && isset($_GET['carburant']))) return;
include("connex.inc.php");
$idcom=connex("matthieucomme","myparam");
$id_mod=$_GET['id_modele'];
$nom_mod=$_GET['nom_modele'];
$carbu = $_GET['carburant'];
if(!isIDValid($id_mod)) {

	echo "L'identifiant '$id_mod' n'est pas conforme<br>Une chaine de longueur maximale égale à 10, composée de chiffres et de lettres majuscules ";	
} 
else if (strlen($nom_mod)>=30) {
	echo "Le nom du modèle '$nom_mod' est trop long (+30 caractères)";
}
else {
$requete="SELECT * FROM `modele` WHERE `id_modele` = '$id_mod'";
$result=@mysqli_query($idcom,$requete);
($result) or die("Lecture impossible");
if(mysqli_num_rows($result) != 0) { 
	$ligne = mysqli_fetch_array($result);
	echo "Le modèle ".$ligne[1]." existe déjà avec cet identifiant...";
	exit;
}
$requete = "INSERT INTO `modele` VALUES('$id_mod', '$nom_mod', '$carbu')";
$result=@mysqli_query($idcom,$requete);
if (!$result) { echo "Erreur lors de l'insertion"; }
else { echo "Modèle inséré !"; }

mysqli_free_result($result);
}
?>
</body>
</html>

