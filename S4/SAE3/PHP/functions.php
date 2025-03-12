<?php function echoTable2D($stid, $arr) // $arr = resultat de la requete en tableau
{
    echo '<table border="1">';
    $nb_col = oci_num_fields($stid);

    echo '<tr>';
    for ($i = 0; $i < $nb_col; $i++) {
        $nom = oci_field_name($stid, $i);
        echo '<th>' . $nom . '</th>';
    }
    echo '</tr>';
    
    foreach ($arr as $ligne) {
        echo '<tr>';
        foreach ($ligne as $case) {
            echo '<td>' . $case . '</td>';
        }
        echo '</tr>';
    }
    echo '</table>';
}
function v2_echoTable2D($stid) {	
	echo '<table border="1">';
	$nb_col = oci_num_fields($stid);
	echo '<tr>';
	for ($i = 1; $i <= $nb_col; $i++) {
  		$nom = oci_field_name($stid, $i);
        		echo '<th>'. $nom.'</th>';
    	}
    	echo '</tr>';
	while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
		echo "<tr>\n";
		foreach ($row as $item) 
			echo "<td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "") . "</td>\n";
		echo "</tr>\n";
	}
	echo '</table>';
}

function createFormSQL($idcom, $table)
{
    $requete = $idcom->query("DESCRIBE $table");
    $requete->execute();
    $colonnes = $requete->fetchAll(PDO::FETCH_COLUMN);
    echo '<form method="POST" action ="">';
    foreach ($colonnes as $attr) {
        echo '<label for="' . $attr . '">' . $attr . ' : </label><input type="text" name="' . $attr . '"><br>';
    }
    echo '<input type="submit" name="submit" value="Inserer"><br>';
    echo '</form>';
}
