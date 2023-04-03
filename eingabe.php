<?php include('./template/navbar.php'); ?>
<h1>Datenerfassung</h1>

<?php
if (isset($_POST["abschicken"]))
{
    $dbcon = new mysqli("localhost", "root", "", "sql_auftrag_Klausur");
    $neu = $dbcon->prepare("INSERT INTO kunden"
     . "(KuName, KuVorname, KuStrasse, KuHNr, KuPLZ, KuOrt)"
     . "VALUES(?,?,?,?,?,?)");
    $neu->bind_param("sssiis",$_POST["na"],  $_POST["vn"], $_POST["st"], $_POST["nr"], $_POST["pl"], $_POST["ort"]);
    $neu->execute();

    if ($neu->affected_rows > 0)
        echo "Datensatz hinzugekommen<br>";
    else
        echo "Fehler, kein Datensatz hinzugekommen<br>";

    $neu->close();
    $dbcon->close();
}
?>

<p>Geben Sie einen Datensatz ein:<br>
<form action = "eingabe.php" method = "post">   
    <p><input name="na"> Name</p>
    <p><input name="vn"> Vorname</p>
    <p><input name="st"> Strasse</p>
    <p><input name="nr"> Hausnummer</p>
    <p><input name="pl"> PLZ</p>
    <p><input name="ort"> Ort</p>
    <p><input type="submit" name="abschicken"> <input type="reset"></p>
</form>
<p>Alle <a href="abfrage.php">anzeigen</a></p>
</body></html>

<?php include('./template/footer.php'); ?>