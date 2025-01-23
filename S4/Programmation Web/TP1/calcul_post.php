<html>
<body>
<h2 align=center> Simple Calculette</h2>
<p>
<form method="post">
Premiere valeur : <input type="text" name="valeur1"><br>
Seconde valeur : <input type="text" name="valeur2"><br>
<input type="submit" name="operation" value="+">
<input type="submit" name="operation" value="-">
</form>
</p>
<?php
if (isset($_POST["operation"])) {
$a = $_POST["valeur1"];
$b = $_POST["valeur2"];
$op = $_POST["operation"];
if ($op == "+") $res = $a + $b;
else $res = $a - $b;
echo $a.$op.$b." = ".$res;	
}
?>
</body>
</html>
