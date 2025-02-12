<?php // style='background-color:<?php echo $couleur_fond ;color:<?php echo $couleur_txt'
function isColorSet($s) { return (isset($_GET['R_'.$s]) && isset($_GET['V_'.$s]) && isset($_GET['B_'.$s])); }
function isCookieSet($s) { return isset($_COOKIES['couleurs']); }
function colorToString($s) { return '#'.$_GET['R_'.$s].$_GET['V_'.$s].$_GET['B_'.$s]; }
$couleur_txt = (isColorSet('txt')) ? colorToString('txt') : 'black';
$couleur_fond = (isColorSet('fond')) ? colorToString('fond') : 'white';
$valeur_cookie = 'style="background-color:'.$couleur_fond.';color:'.$couleur_txt.'"';
$delai_cookie = 3600*24*30*2;
setcookie('couleurs',$valeur_cookie, time() + $delai_cookie);
?>
<html><body <?php if (isset($_COOKIE['couleurs'])) echo $_COOKIE['couleurs'];?>>  
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
<input type='submit' value='Envoyer'>
</form>
</body></html>
