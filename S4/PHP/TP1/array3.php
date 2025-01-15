<html>
<body>
<?php
if (!isset($_GET["depart"]))
die("manque la ville");
$ville1=($_GET["depart"]);
$distance=array("paris"=>array("nice"=>900,"lille"=>300),
"nice"=>array("paris"=>900,"tours"=>800,"lille"=>1200),
"tours"=>array("nice"=>800,"lille" =>500),
"lille"=>array("paris"=>300,"nice"=>1200,"tours"=>800));
if (isset($distance[$ville1])) {
?>
<h2>ville de d&eacute;part : <?php echo $_GET["depart"] ?></h2>
<table border="1">
<tr><th>destination</th><th>distance</th></tr>
<?php
foreach($distance as $key1 => $arr) {
	if($key1 == $ville1) {
		foreach($arr as $key2 => $value) {
			echo "<tr><td>".$key2."</td>"."<td>".$value."</td></tr>";
		}
	}
}
} else
	echo '<p>pas de liaison à partir de cette ville</p>';
?>
</table>
</body>
</html>
