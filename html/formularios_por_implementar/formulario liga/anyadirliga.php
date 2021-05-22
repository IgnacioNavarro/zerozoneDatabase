<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>
      
<?php
$name1Err=$name2Err=$impErr=$posErr="";
$name1=$name2=$imp=$pos="";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["nombreequipo"])) {
        $name2Err = "Se requiere un nombre.";
      } else {
        $name2 = test_input($_POST["nombreequipo"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name2)) {
          $name2Err = "Solo se permiten letras y espacios en blanco.";
        }
      }
    if (empty($_POST["nombreliga"])) {
        $name1Err = "Se requiere un nombre.";
      } else {
        $name1 = test_input($_POST["nombreliga"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name1)) {
          $name1Err = "Solo se permiten letras y espacios en blanco.";
        }
      }
      if (empty($_POST["importe"])) {
        $impErr = "Se requiere un importe.";
      } else {
        $imp = test_input($_POST["importe"]);
      }
      if (empty($_POST["posicion"])) {
        $posErr = "Se requiere una posición.";
      } else {
        $pos = test_input($_POST["posicion"]);
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
NOMBRE EQUIPO:<input type="text" name="nombreequipo" value=""><br>
IMPORTE PREMIO: <input type="number" name="importe" value=""><br>
NOMBRE LIGA: <input type="text" name="nombreliga" value=""><br>
POSICIÓN ACTUAL: <input type="number" name="posicion" value=""><br>
FECHA COBRO: <input type="date" name="fechacobro" value=""><br>
<input type="submit"  name="submit" value="Submit">
</form>
</body>
</html>