<?php
$dbcon= @new mysqli("localhost", "root", "DAA", "sql_auftrag_Klausur");  //Konstruktor
if ($dbcon->connect_error)
    exit("Fehler bei Verbindung");
$abfrage = "SELECT * FROM kunden";
if ($ergebniss = $dbcon->query($abfrage))
{
    if($ergebniss -> num_rows == 0)
        echo "Keine Ergebniss";
    
    while ($dsatz = $ergebniss->fetch_assoc())
            echo $dsatz["KuVorname"] ." " . $dsatz["KuName"] . "<br>";
        
    $ergebniss->close();
    $dbcon->close();
}
else
    exit("Fehler bei Abfrage");
?>