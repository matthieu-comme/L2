<html>
<body>
<p>
<?php
if (!isset($_GET['depart']) || !isset($_GET['arrivee']))
die('manque les villes');
$ville1=strtolower($_GET["depart"]);
$ville2=strtolower($_GET["arrivee"]);
$distance=array("paris" => array("nice" => 900, "lille" => 300),
"nice" => array("paris" => 900, "tours" => 800, "lille" => 1200),
"tours" => array("nice" => 800, "lille" => 500),
"lille" => array("paris" => 300, "nice" => 1200, "tours" =>
800));

function distanceAB($distance,$A,$B) {
	$d = $distance["$A"]["$B"];
	if (isset($d)) return "La distance $A - $B est $d km";
	else return "Trajet non trouvé...";
}
echo distanceAB($distance,$ville1,$ville2);
?>
</p>
</body>
</html>
