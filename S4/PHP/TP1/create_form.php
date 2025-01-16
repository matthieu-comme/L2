<html>
<body>
<?php //if !(isset($_POST["nbselect"]) || isset($_POST["nbtext"])) echo "VIDE !"; else { ?>

<h3> Mon formulaire </h3>
<form method="get" action="">
<?php 
// $nbText = 4; $nbSelect =2; $tabSelect = array("chien;chat;poisson;rhinoceros","riz;semoule;pommes de terre;pates;frites;lentilles");
$nbText = $_POST["nbtext"];
$nbSelect = $_POST["nbselect"];
$tabSelect = explode("\n",$_POST['optionselect']);
var_dump($tabSelect);
foreach($tabSelect as $key) 
	$tabSelect[$key] = explode(';',$tabSelect[$key]);

for($i = 1; $i <= $nbText; $i++) {
	echo "<input type=\"text\" name=\"text$i\"/><br><br>\n";
}

for($i = 1; $i <= $nbSelect; $i++) {
?>
<select name="select<?php echo $i?>"/>
	<?php $tab = explode(";",$tabSelect[$i-1]);
	for ($j = 0; $j < count($tab); $j++) {
		echo '<option value="'.$tab[$j].'">'.$tab[$j].'</option>',"\n";
	}?>
	
</select> <br><br>
<?php } ?>


<input type="submit" name="submit" value="Envoyer"/>
</form>

<?php //}?>
</body>
</html>
