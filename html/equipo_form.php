<?php	session_start();
		if (!isset($_SESSION["log"]))
			Header("Location: ../inicioSesion.php"); ?>
<html lang="es">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE EQUIPOS</title>
</head>
<body>
	<img class="bg" src="../images/fondo.png">
	<header>
		<div class="topnav">
			<ul>
				<li><a href="../index.html">Inicio</a></li>
				<li><a href="social.php" class="main">Social</a></li>
				<li class="dropdown"><a class="dropdownbutton">Juegos</a>
					<div class="dropdown-content">
						<a class="brawl-bar" href="../brawlstars/BrawlStars.php">Brawl Stars</a>
						<a class="fortnite-bar" href="../fortnite/Fortnite.php">Fortnite</a>
						<a class="clash-bar" href="../clashroyale/ClashRoyale.php">Clash royale</a>
						<a class="csgo-bar" href="../csgo/CSGO.php">CS:GO</a>
						<a class="lol-bar" href="../lol/LoL.php">LoL</a>
						<a class="fifa-bar" href="../fifa/FIFA.php">FIFA</a>
					</div>
				</li>
				<a class="inicio-sesion" href="../InicioSesion.php">Iniciar Sesión</a>
			</ul>
		</div>
	</header>

	<div class="backArrow">
	<a href="javascript:history.back()"><img src="../images/back-arrow.png"></a>
	</div>
    <?php
	require_once('../validaciones.php');
    $regex_nombre = REGEX_NOMBRE;
    $regex_dni = REGEX_DNI;
	if (!isset($_SESSION["formulario"])) {
		$formulario["dni"] = "";
		$formulario["nombre"] = "";
		$formulario["clasificacionGlobal"] = "";
        $formulario["clasificacionNacional"] = "";
        $formulario["manager"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>
		<form action="equipo_validation.php" method="POST">
        <div>
			<h1 id="title"> NUEVO EQUIPO </h1>
			</div>
			<div class="form">

            <label for="dni">DNI</label>
                <input type="text" id="dni" name="dni" required
				pattern="<?php echo $regex_dni ?>" value="<?php echo $formulario["dni"] ?>">
				<span class="error" id="ERRdni"></span>
				<br><br>

            <label for="nombre">Nombre</label>
				<input type="text" id="nombre" name="nombre" required
				pattern="<?php echo $regex_nombre ?>"
				value="<?php echo $formulario["nombre"] ?>">
				<span class="error" id="ERRnombre"></span>
				<br><br>
				
            <label for="clasificacionGlobal">Clasificacion Global</label>
                <input type="number" id="clasificacionGlobal" name="clasificacionGlobal" value="<?php echo $formulario["clasificacionGlobal"] ?>">
				<span class="error" id="ERRclasificacionGlobal"></span>
				<br><br>

            <label for="clasificacionNacional">Clasificacion Global</label>
                <input type="number" id="clasificacionNacional" name="clasificacionNacional" value="<?php echo $formulario["clasificacionNacional"] ?>">
				<span class="error" id="clasificacionNacional"></span>
				<br><br>

				<label for="manager">Manager:</label>
				<input list="managers" name="manager" id="manager"value="<?php echo $formulario['manager']?>"/>
				<datalist id="managers">
					<?php
						require_once("../bd/gestionBD.php");
						require_once("../bd/empleados_BD.php"); 
						$conexion = crearConexionBD();
						$data = listadoManagers($conexion);
						foreach($data as $man) {
							echo "<option label='" . $man["NOMBRE"] . "' value='" . $man["DNI"] . "'>";
						}
						cerrarConexionBD($conexion)
					?>
				</datalist>
				<span class="error" id="ERRmanager"></span>

			</div>
			<div class="send-button">
			<input type="image" id="submitEvento" name="submit" src="../images/tick.png" alt="submit">
		</div>			
		</form>

</body>

<script>
	var data = <?php echo json_encode($data); ?>;
	var regex = <?php echo REGEXJS_NOMBRE ?>;
    var regexdni = <?php echo REGEXJS_DNI ?>;
	var managers = data.map(x => x["DNI"]); 
	
	function validate()  {
		
		var test_nombre = textValidation(regex, "nombre");
        var test_dni = textValidation(regexdni, "dni");
		var test_manager = typeValidation(managers, "manager");
		if (test_nombre && test_manager && test_dni)
			document.getElementById("submitEvento").disabled = "";
		else
			document.getElementById("submitEvento").disabled = "disabled";
	}
	$(document).ready(function() {
		validate();
	});
	$(":input").change(function() {
		validate();
	});
</script>
</html>