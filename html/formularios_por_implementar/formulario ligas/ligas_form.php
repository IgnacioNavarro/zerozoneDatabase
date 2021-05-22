<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>ZEROZONE: REGISTRO DE LIGAS</title>
</head>
<body>
<?php
		session_start();
		if (!isset($_SESSION["formulario"]) ) {
            $formulario["nombre"]="";
            $formulario["posicion"]="";
            $formulario["importePremio"]="";
            $formulario["fechaCobroPremio"]="";
            $_SESSION["formulario"] = $formulario;
        }else{
            $formulario=$_SESSION["formulario"];
        }
        if (isset ($_SESSION["errNombre"]) ) {
            $errNombre=$_SESSION["errNombre"];
        }
        else {
            $errNombre = "";
		}
	?>
        	<form action="ligas_validation.php" method="POST">
        <fieldset>

        <label for="nombre">NOMBRE:</label>
		<input type="text" name="nombre" value="<?php echo $formulario["nombre"]?>">
		<?php echo $errNombre?><br>     
        <label for="posicion">POSICIÓN:</label>
		<input type="number" name="posicion" value="<?php echo $formulario["posicion"]?>">  
        <label for="importePremio">IMPORTE DEL PREMIO:</label>
		<input type="number" name="importePremio" value="<?php echo $formulario["importePremio"]?>">   
        <label for="fechaCobroPremio">FECHA DE COBRO DEL PREMIO:</label>
		<input type="date" name="fechaCobroPremio" value="<?php echo $formulario["fechaCobroPremio"]?>">
	 

        <input type="submit" name="submit" value="Crear liga"> 
        </fieldset> 
	</form>
</body>
</html>
