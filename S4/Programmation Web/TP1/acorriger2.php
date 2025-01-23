<html>
<body>
<h2 align=center>A corriger 2</h2>
<p>
<?php
$tab = array(3, 5, 7, 1, 2, 8, 6, 4) ;
echo 'tableau <br/>', "<table>\n";
for($i = 0 ; $i < count($tab); $i++) {
	echo "<tr><td>\'.$i.\'</td><td>";
	echo "$tab[$i]</td></tr>";
}
echo '</table>';
$somme = 0;
for($i = 0 ; $i < count($tab); $i++) $somme += $tab[$i];
echo "<br />somme = ".$somme ;
?>
</p>
</body>
</html>
