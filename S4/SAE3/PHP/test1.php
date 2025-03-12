<?php
require_once('connexoci.inc.php');
require_once('functions.php');
$idcom = connexoci("myparam");
var_dump($idcom);
$requete = "SELECT * FROM utilisateur";
$stid = oci_parse($idcom, $requete);
if (!$stid) {
     $e = oci_error($conn);
     trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}
$result = oci_execute($stid);
//oci_fetch_all($stid, $arr, OCI_ASSOC);

v2_echoTable2D($stid);
$requete = "SELECT * FROM Jouet";
$stid = oci_parse($idcom, $requete);
$result = oci_execute($stid);
v2_echoTable2D($stid);

$requete = "SELECT * FROM Enfant";
$stid = oci_parse($idcom, $requete);
$result = oci_execute($stid);
v2_echoTable2D($stid);
