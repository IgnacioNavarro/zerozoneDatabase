<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>ZEROZONE: REGISTRO DE EEQUIPOS</title>
</head>
<body>
<?php
		session_start();
		if (!isset($_SESSION["formulario"]) ) {
            $formulario["dni"]="";
            $formulario["nombre"]="";
            $formulario["clasificacionGlobal"]="";
            $formulario["clasificacionNacional"]="";
            $_SESSION["formulario"] = $formulario;
        }else{
            $formulario=$_SESSION["formulario"];
        }
        if (isset ($_SESSION["errNombre"]) || isset ($_SESSION["errDNI"]) ) {
			$errNombre=$_SESSION["errNombre"];
            $errDNI=$_SESSION["errDNI"];
        }
        else {
			$errNombre = "";
            $errDNI = "";
		}
	?>
    	<form action="equipo_validation.php" method="POST">
        <fieldset>

		<label for="dni">DNI:</label>
		<input type="text" name="dni" value="<?php echo $formulario["dni"]?>">
		<?php echo $errDNI?><br>
        <label for="nombre">NOMBRE:</label>
		<input type="text" name="nombre" value="<?php echo $formulario["nombre"]?>">
		<?php echo $errNombre?><br>       
        <label for="clasificacionGlobal">CLASIFICACIÓN GLOBAL:</label>
		<input type="number" name="clasificacionGlobal" value="<?php echo $formulario["clasificacionGlobal"]?>">   
        <label for="clasificacionNacional">CLASIFICACIÓN NACIONAL:</label>
		<input type="number" name="clasificacionNacional" value="<?php echo $formulario["clasificacionNacional"]?>">
	 

        <input type="submit" name="submit" value="Crear equipo"> 
        </fieldset> 
	</form>
</body>
</html>
