<?php
for ($i = 0; $i <= 63; $i++) $tabN[$i] = $i;
foreach($tabN as $k) $tabR[$k] = $k/10;
foreach($tabR as $X => $value) $tabSin[$X] = sin($value);
//var_dump($tab);
?>
<html>
<body>
<table border="1">
<tr><th>Indice</th><th>Valeur</th><th>Sinus</th></tr>
<?php 
for($i = 0; $i < count($tabR); $i++) {
echo "<tr><td>$i</td><td>$tabR[$i]</td><td>$tabSin[$i]</td></tr>";
}?>
</table>

</body>
</html>
