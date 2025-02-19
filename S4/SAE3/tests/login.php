<?php
if (isset($_POST['pseudo']) && isset($_POST['mdp'])) {
    if (empty($_POST['pseudo']) || empty($_POST['mdp']))
        $message = "Concentre toi chef, laisse pas de vide<br>";
    else {
        require_once('connexpdo.inc.php');
        $idcom = connexpdo('sae3', "myparam");
        $pseudo = $_POST['pseudo'];
        $mdp = $_POST['mdp'];
        $requete = "SELECT * FROM lutin WHERE pseudo = ?";
        $reqprep = $idcom->prepare($requete);
        $reqprep->execute(array($pseudo));

        if ($reqprep->rowCount() == 0)
            $message =  "<strong>Pseudo incorrect</strong><br>";
        else {
            $message = "";
            $result = $reqprep->fetch(PDO::FETCH_ASSOC);
            if ($result['pseudo'] !== $pseudo) $message .=  "<strong>Pseudo incorrect (casse)</strong><br>";
            else if ($result['mdp'] !== $mdp) $message .=  "<strong>Mot de passe incorrect</strong>";
            else $message = "Je te connais, " . $pseudo; // rediriger en ouvrant une session et affecter les variables
        }
    }
} ?>

<html>

<head>
    <title>Connexion - Chris Kindle</title>
</head>

<body>
    <main>
        <h1>Veuillez vous connecter</h1>
        <div id="login" style="border:1px solid black;width:400px">
            <form method="POST" action="">
                <label for="pseudo">Pseudo</label> <input type="text" name="pseudo" pattern="[A-Za-z0-9]{3,20}" required></input><br>
                <label for="mdp">Mot de passe</label> <input type="password" name="mdp" pattern="[A-Za-z0-9]{3,20}" required></input><br>
                <input type="submit" name="submit" value="Se connecter">
            </form>
        </div>
        <?php if (!empty($message)) echo $message; ?>
    </main>
</body>

</html>