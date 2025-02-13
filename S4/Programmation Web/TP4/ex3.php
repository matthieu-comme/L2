<?php
define('SEPARATEUR',';'); // separe user de avis dans le livre d'or
function cleanInput($string) { return preg_replace('/'.SEPARATEUR.'/',',',$string); }
function isSetAvis() { return (isset($_POST['user']) && isset($_POST['avis'])); }
function isEmptyAvis() { return (empty($_POST['user']) || empty($_POST['avis'])); }
function echoTable2D($arr) { // arr[i][j];
	echo '<table border="1">';
	foreach($arr as $ligne) {
		echo '<tr>';
		foreach($ligne as $case) { echo '<td>'.$case.'</td>'; }
		echo '</tr>';
	}
	echo '</table>';
}
if(isSetAvis()) {
	if(isEmptyAvis()) {
		echo "<strong>Ne laissez pas de champ vide !</strong>";
	}
	else {
		$user = cleanInput($_POST['user']);
		$avis = cleanInput($_POST['avis']);
		$ligne = $user.SEPARATEUR.$avis."\n";
		$file = fopen('livredor.txt','a');
		if ($file == null) { 
			echo "Je n'arrive pas à ouvrir le livre d'or pour ajouter l'avis";
			return;
		}
		if(flock($file,2)) {
			fputs($file,$ligne);
		}
		else { echo "Impossible de verrouiller le livre d'or"; }
		fclose($file);	
	}
} 
$file = fopen('livredor.txt','r');
if ($file == null) { 
	echo "Je n'arrive pas à ouvrir le livre d'or pour afficher les avis";
	return;
}
if(flock($file,1)) {
	while($texte = fgets($file)) $tab[] = $texte;
	foreach($tab as $i => $ligne) {
		$tab[$i] = explode(SEPARATEUR,$ligne);
	}	
	flock($file,3);
	$lon = count($tab);
	for($i = $lon -1 ; $i >= $lon-5; $i--) $cinq[] = $tab[$i];	
} 
else {
	echo "Impossible de verrouiller le livre d'or";
}
fclose($file);
?>
<html><body>  
<h2>Les 5 derniers avis</h2>
<?php echoTable2D($cinq); ?>
<h2>Donnez le votre !</h2>
<form method='post' action=''>
<label for='user'>Votre nom</label><input type='text' name='user'><br>
<label for='avis'>Votre avis</label><input type='text' name='avis'>
<input type='submit' name='submit' value='Commenter'>
</form>
</body></html>
