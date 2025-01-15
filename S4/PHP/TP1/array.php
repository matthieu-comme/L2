<html>
<body>
<p>
<?php
$distance= array(array("paris", "nice", 900),
array("nice", "tours", 800),
array("tours", "lille", 500),
array("paris", "lille", 300),
array("nice", "lille", 1200) );
echo '<table border="1"><br>';
for($i = 0; $i < count($distance) ; $i++) {
	echo "<tr>";
	for($j = 0; $j < count($distance[$i]) ; $j++) {
	echo "<td>".$distance[$i][$j]."</td>";
	} 
	echo "</tr>";
}
echo "</table>";
?>
</p>
</body>
</html>
