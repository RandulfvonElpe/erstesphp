<?php include('./template/head.php');
      echo"<br><br><br>";?>
<h1> Zugang </h1>

<?php
if(isset($_POST["benutzer"]))
{
      echo "Benutzer: " . $_POST["benutzer"];
      include('./template/navbar.php');
}

else 
      echo"<p>Zugang nur über erfolgreiche
      <a href='login.php'>Eingabe</a></p>";

include("./template/footer.php");
?>