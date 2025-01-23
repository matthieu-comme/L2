<html>
<body>
<h2 align=center> matrice symetrique </h2>

<?php 
function tracerMatrice($matrice, int $dimension) { // retourne vrai si symetrique
	$sym = true;
	echo "<table border='1'>";
	for($i=0; $i<$dimension; $i++) {
		echo "<tr><br>";
		for($j=0; $j<$dimension; $j++) {
			if ($matrice[$i][$j] != $matrice[$j][$i]) {
				$sym = false;
			}
			echo "<td>".$matrice[$i][$j]."</td>";
		}
		echo "</tr>";
	}
	echo "</table><br>";
	return $sym;	
} 

?>
<?php
if(isset($_POST['lignes'])) {
	$tab_lignes=explode("\n", $_POST['lignes']);
	$dimension=count($tab_lignes);
	for ($i=0; $i<$dimension; $i++) {
		$matrice[$i]=explode(",", trim($tab_lignes[$i]));
		if (count($matrice[$i]) != $dimension) {
		echo "la matrice n'est pas carree<br>" ;
		return;
		}
	}	
	//tracerMatrice($matrice,$dimension);
	if(tracerMatrice($matrice,$dimension))
		echo "La matrice est symétrique";
	else
		echo "Ce n'est pas une matrice symétrique";
}
?>
<h3> Donnez une autre matrice : </h3>
<form action="ex2.php" method="POST">
ligne par ligne <br>
en separant les entiers par une virgule<br>
<textarea name="lignes" cols="40" rows="6"></textarea>
<input type="submit" value="verifier" >
</form>
</body>
</html>
