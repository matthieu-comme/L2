<?php
function isColorSet($type) { return (isset($_GET['R_'.$type]) && isset($_GET['V_'.$type]) && isset($_GET['B_'.$type])); }
function colorToString($type) { return '#'.$_GET['R_'.$type].$_GET['V_'.$type].$_GET['B_'.$type]; }
function isColorValid($color) { 
	$pattern = '^/#[[0-9a-fA-F]{6}]$/';
	echo $color.'respecte le pattern '.$pattern;
	return preg_match($pattern,$color); 
}
session_start();

if($_GET['submit'] == 'RESET') session_unset();
if(!isset($_SESSION['style']) || $_GET['submit'] == 'Envoyer') {//or $_SESSION['style']=='style="background-color:#ffffff;color:#000000"') {
	$couleur_txt = (isColorSet('txt')) ? colorToString('txt') : '#000000';
	$couleur_fond = (isColorSet('fond')) ? colorToString('fond') : 'ffffff';
	$style = 'style="background-color:'.$couleur_fond.';color:'.$couleur_txt.'"';
	$_SESSION['style'] = $style;
}
?>
<html><body <?php echo $_SESSION['style'];?>>  
<h1>Choisis tes couleurs préférées <strong>(code hexa!)</strong></h1>
<form method='get'>
<fieldset style='display:inline_block'>
<p>Couleur du texte</p>
<label for='R_txt'>R</label> <input type='text' pattern='[0-9a-fA-F]{2}' name='R_txt' id='R_txt' value='00'>
<label for='V_txt'>V</label> <input type='text' pattern='[0-9a-fA-F]{2}' name='V_txt' id='V_txt' value='00'>
<label for='B_txt'>B</label> <input type='text' pattern='[0-9a-fA-F]{2}' name='B_txt' id='B_txt' value='00'><br>
</fieldset>
<fieldset>
<p>Couleur du fond</p>
<label for='R_fond'>R</label> <input type='text' pattern='[0-9a-fA-F]{2}' name='R_fond' id='R_fond' value='ff'>
<label for='V_fond'>V</label> <input type='text' pattern='[0-9a-fA-F]{2}' name='V_fond' id='V_fond' value='ff'>
<label for='B_fond'>B</label> <input type='text' pattern='[0-9a-fA-F]{2}' name='B_fond' id='B_fond' value='ff'><br>
</fieldset>
<input type='submit' name='submit' value='Envoyer'>
<input type='submit' name='submit' value='RESET'>
</form>

<a href='ex2_bis.php'>Lien mystère...</a>


</body></html>
