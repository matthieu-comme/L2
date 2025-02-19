<?php
require_once('functions.php');
require_once('connexpdo.inc.php');
$idcom = connexpdo('sae3', "myparam");
$requete = 'SELECT * FROM cartegrise';
$reqprep = $idcom->prepare($requete);
$reqprep->execute();
$result = $reqprep->fetchAll(PDO::FETCH_ASSOC);
echoTable2D($result, $reqprep);
createFormSQL($idcom, 'cartegrise');
