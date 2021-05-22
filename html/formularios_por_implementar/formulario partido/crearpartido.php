<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>

<?php
$eqErr=$eqriErr=$riErr=$paErr=$nomErr="";
$eq=$eqri=$ri=$pa=$nom="";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["nombreequipo"])) {
        $eqErr = "Se requiere un nombre.";
      } else {
        $eq = test_input($_POST["nombreequipo"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$eq)) {
          $eqErr = "Solo se permiten letras y espacios en blanco.";
        }
      }
      if (empty($_POST["nombrerival"])) {
        $eqriErr = "Se requiere un nombre.";
      } else {
        $ri = test_input($_POST["nombrerival"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$eqri)) {
          $eqriErr = "Solo se permiten letras y espacios en blanco.";
        }
      }
      if (empty($_POST["nombrerivales"])) {
        $riErr = "Se requiere un nombre.";
      } else {
        $ri = test_input($_POST["nombrerivales"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$ri)) {
          $riErr = "Solo se permiten letras y espacios en blanco.";
        }
      }
      if (empty($_POST["tipopartido"])) {
        $paErr = "Se requiere un nombre.";
      } else {
        $pa = test_input($_POST["tipopartido"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$pa)) {
          $paErr = "Solo se permiten letras y espacios en blanco.";
        }
      }
      if (empty($_POST["nombreliga"])) {
        $nomErr = "Se requiere un nombre.";
      } else {
        $nom = test_input($_POST["nombreliga"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$nom)) {
          $nomErr = "Solo se permiten letras y espacios en blanco.";
        }
      }     
}
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
EQUIPO:<input type="text" name="nombreequipo" value=""><br>
JUGADORES:<input type="checkbox" name="jugadores" value="Axel">Axel
<input type="checkbox" name="jugadores" value="Angel">Angel
<input type="checkbox" name="jugadores" value="Peter">Peter
<input type="checkbox" name="jugadores" value="Mario">Mario
<input type="checkbox" name="jugadores" value="Marta">Marta<br>
EQUIPO RIVAL:<input type="text" name="nombrerival" value=""><br>
RIVALES:<input type="text" name="nombrerivales" value=""><br>
TIPO PARTIDO:<input type="text" name="tipopartido" value=""><br>
LIGA:<input type="text" name="tipopartido" value=""><br>
FECHA: <input type="date" name="fecha" value=""><br>
RESULTADO:<input type="text" name="resultado" value=""><br>
<input type="submit"  name="submit" value="Submit">
</form>
</body>
</html>
