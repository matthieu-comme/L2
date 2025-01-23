<html>
<body>
<p>
<?php
if (!isset($_GET['depart']) || !isset($_GET['arrivee']))
die('manque les villes');
$ville1=$_GET["depart"];
$ville2=$_GET["arrivee"];
$distance= array(array("paris", "nice", 900),
array("nice", "tours", 800),
array("tours", "lille", 500),
array("paris", "lille", 300),
array("nice", "lille", 1200) );

function distanceAB($A,$B,$arr) { // arr 2D
	for($i = 0; $i < count($arr) ; $i++) {
		$ville1 = $arr[$i][0];
		$ville2 = $arr[$i][1];
		if($ville1==$A && $ville2==$B || $ville1==$B && $ville2==$A)
			return "Distance ".$ville1." - ".$ville2." est ".$arr[$i][2]." km";		 		
	}
	return "Trajet non trouvé...";
}
echo distanceAB($ville1,$ville2,$distance);


?>
</p>
</body>
