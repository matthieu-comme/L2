<?php function echoTable2D($arr, $reqprep) // $arr = resultat de la requete en tableau
{
    echo '<table border="1">';
    $nb_col = $reqprep->columnCount();
    echo '<tr>';
    for ($i = 0; $i < $nb_col; $i++) {
        $meta = $reqprep->getColumnMeta($i);

        echo '<th>' . $meta['name'] . '</th>';
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
