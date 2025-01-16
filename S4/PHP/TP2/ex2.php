<html>
<body>
<h2 align=center> matrice symetrique </h2>
<?php 
if(isset($_POST['lignes'])) {
$tab_lignes=explode("\n", $_POST['lignes']);
$dim=count($tab_lignes);
for ($i=0; $i<$dim; ++$i) {
$matrice[$i]=explode(",", trim($tab_lignes[$i]));
}
if ($blabla == "toto") echo "titi";
else echo "la matrice n'est pas carree<br>" ;
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
