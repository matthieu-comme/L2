<html>
<head>
<title>Calcul de volume d’un cube</title>
</head>
<body>
<h1>Calcul de volume d’un cube</h1>
<form action="cube.php" method="GET">
<label>Longueur du côté du cube en m:</label>
<input type="number" name="cote" min="0" required>
<button type="submit">Calculer volume</button>
</form>

<?php 
if (isset($_GET["cote"])) {
$l = $_GET["cote"];
$l = $l * $l * $l;
echo $l."m^3"; 
}
?>
</body>
</html>
