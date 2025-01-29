<?php
function compute(string $operation) {
    $tab = explode("+",$operation);
    $somme = 0;
    foreach ($tab as $op) {
        if (!preg_match('/\*/',$op)) {
            $somme = $somme + $op;
        }
        else {
            $mult = explode('*',$op);
            $produit = 1;
            foreach($mult as $n) {
                $produit *= $n;
            }
            $somme += $produit;
        }
    }
    echo "$operation = $somme";
    return $somme;
}
?>

<html>
<body>
<h3>Calcul : plus et fois</h3>
<form method='get' action=''>
	<label for='calcul'>Ton calcul</label>
	<input type='text' name='calcul' value="1+4+6*4+6+4+2*2*2*2+19*9*3*4+2+3">
	<input type='submit' name='submit'>
</form>
<?php
if(isset($_GET['calcul'])) {
	$arg = $_GET['calcul'];
	echo $arg.' = '.compute($arg);
} 
?>
</body>
</html>
