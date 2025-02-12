<?php 
session_start();
$style = $_SESSION['style'];
?>
<html><body <?php if (!empty($style)) echo $style;?>>  

<a href='ex2.php'>Reviens ici !</a>

</body></html>
