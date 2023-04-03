<?php include('./template/head.php');
      echo"<br><br><br>";?>

<h1> Zugangskontrolle </h1>

<?php
$benutzer = htmlentities($_POST["benutzer"]);
$passwort = htmlentities($_POST["passwort"]);

if($benutzer == "dude" && $passwort == "thedude")
    {
        echo "<form action='form_versteckt_b.php' method='post'>";
        echo "<p>Zugang erlaubt</p>";
        echo "<input type='hidden' name='benutzer' value='$benutzer'>";
        echo "<p><input type='submit'></p>";
        echo "</form>";
    }
else
    echo "<p>Zugang nur über erfolgreiche
        <a href='index.php'>Eingabe</a></p>";

include("./template/footer.php");?>