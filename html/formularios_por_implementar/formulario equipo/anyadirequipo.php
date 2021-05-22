<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
$name1Err=$name2Err=$name3Err=$name4Err=$name5Err=$name6Err=$name7Err=$name8Err=$name9Err="";
$name1=$name2=$name3=$name4=$name5=$name6=$name7=$name8=$name9="";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    if (empty($_POST["jugador1"])) {
      $name1Err = "Se requiere un nombre.";
    } else {
      $name1 = test_input($_POST["jugador1"]);
      if (!preg_match("/^[a-zA-Z ]*$/",$name1)) {
        $name1Err = "Solo se permiten letras y espacios en blanco.";
      }
    }
    if (empty($_POST["jugador2"])) {
        $name2Err = "Se requiere un nombre.";
      } else {
        $name2 = test_input($_POST["jugador2"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name2)) {
          $name2Err = "Solo se permiten letras y espacios en blanco.";
        }
    }
    if (empty($_POST["jugador3"])) {
        $name3Err = "Se requiere un nombre.";
      } else {
        $name3 = test_input($_POST["jugador3"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name3)) {
          $name3Err = "Solo se permiten letras y espacios en blanco.";
        }
    }
    if (empty($_POST["jugador4"])) {
        $name4Err = "Se requiere un nombre.";
      } else {
        $name4 = test_input($_POST["jugador4"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name4)) {
          $name4Err = "Solo se permiten letras y espacios en blanco.";
        }
    }
    if (empty($_POST["coach"])) {
        $name5Err = "Se requiere un nombre.";
      } else {
        $name5 = test_input($_POST["coach"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name5)) {
          $name5Err = "Solo se permiten letras y espacios en blanco.";
        }
    }
    if (empty($_POST["analista"])) {
        $name6Err = "Se requiere un nombre.";
      } else {
        $name6 = test_input($_POST["analista"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name6)) {
          $name6Err = "Solo se permiten letras y espacios en blanco.";
        }
    }
    if (empty($_POST["manager"])) {
        $name7Err = "Se requiere un nombre.";
      } else {
        $name7 = test_input($_POST["manager"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name7)) {
          $name7Err = "Solo se permiten letras y espacios en blanco.";
        }
    }
    if (empty($_POST["liga1"])) {
        $name8Err = "Se requiere un nombre.";
      } else {
        $name8 = test_input($_POST["liga1"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name8)) {
          $name8Err = "Solo se permiten letras y espacios en blanco.";
        }
    }
    if (empty($_POST["liga2"])) {
        $name9Err = "Se requiere un nombre.";
      } else {
        $name9 = test_input($_POST["liga2"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$name9)) {
          $name9Err = "Solo se permiten letras y espacios en blanco.";
        }
    }
    if($name1Err=""){
      Header("Location: exito.php");
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
JUGADOR 1: <input type="text" name="jugador1" value="<?php echo $name1;?>"><?php echo $name1Err ?><br>

JUGADOR 2: <input type="text" name="jugador2" value="<?php echo $name2;?>"><br>
JUGADOR 3: <input type="text" name="jugador3" value="<?php echo $name3;?>"><br>
JUGADOR 4: <input type="text" name="jugador4" value="<?php echo $name4;?>"><br>
<br><br>
COACH: <input type="text" name="coach" value="<?php echo $name5;?>"><br>
ANALISTA: <input type="text" name="analista" value="<?php echo $name6;?>"><br>
MANAGER: <input type="text" name="manager" value="<?php echo $name7;?>"><br>
<br><br>
LIGA 1: <input type="text" name="liga1" value="<?php echo $name8;?>"><br>
LIGA 2: <input type="text" name="liga2" value="<?php echo $name9;?>"><br>
<input type="submit"  name="submit" value="Submit">
</form>
</body>
</html>