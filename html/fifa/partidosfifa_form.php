<?php session_start();
if (!isset($_SESSION["log"]))
	Header("Location: ../inicioSesion.php"); ?>
<html lang="es">

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE PARTIDOS DE FIFA</title>
</head>

<body>
<img class="bg" src="../images/fondo.png">
	<header>
		<div class="topnav">
			<ul>
				<li><a href="../index.php">Inicio</a></li>
				<li><a href="../social/Social.php">Social</a></li>
				<li class="dropdown"><a class="dropdownbutton main">Juegos</a>
					<div class="dropdown-content">
						<a class="brawl-bar" href="../brawlstars/BrawlStars.php">Brawl Stars</a>
						<a class="fortnite-bar" href="../fortnite/Fortnite.php">Fortnite</a>
						<a class="clash-bar" href="../clashroyale/ClashRoyale.php">Clash royale</a>
						<a class="csgo-bar" href="../csgo/CSGO.php">CS:GO</a>
						<a class="lol-bar" href="../lol/LoL.php">LoL</a>
						<a class="fifa-bar main" href="FIFA.php">FIFA</a>
					</div>
				</li>
				<?php
				if ($_SESSION["log"] != null) { ?>
					<a class="inicio-sesion" href="../logOut.php">Cerrar sesión</a>
					<a class="inicio-sesion" id="welcoming">Bienvenido, <?php echo $_SESSION["log"]; ?></a>
				<?php } else {
				?>
					<a class="inicio-sesion" href="../InicioSesion.php">Iniciar Sesión</a>
				<?php }
				?>

			</ul>
		</div>
	</header>

	<div class="backArrow">
		<a href="javascript:history.back()"><img src="../images/back-arrow.png"></a>
	</div>
	<?php
	require_once('../validaciones.php');
	$regex_texto = REGEX_TEXTO;
	$regex_nombre = REGEX_NOMBRE;
	$regex_int = REGEX_INT;
	if (!isset($_SESSION["formulario"])) {
		$formulario["equiposFutbol"] = "";
		$formulario["goles"] = "";
		$formulario["resultado"] = "";
		$formulario["tipo"] = "";
		$formulario["fecha"] = "";
		$formulario["jugadores"] = "";
		$formulario["liga"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];

	?>
	<form action="partidosfifa_validation.php" method="POST">
		<h1 id="title">NUEVO PARTIDO</h1>
		<div class="form">

			<label>Equipos de Futbol</label>
			<input type="text" id="equiposFutbol" name="equiposFutbol" 
			pattern="<?php echo $regex_nombre ?>"
			value="<?php echo $formulario["equiposFutbol"] ?>">
			<span class="error" id="ERRequiposFutbol"></span>
			<br><br>

			<label>Goles</label>
			<input type="text" id="goles" name="goles"
			pattern="<?php echo $regex_int ?>"
			value="<?php echo $formulario["goles"] ?>">
			<span class="error" id="ERRgoles"></span>
			<br><br>

			<label for="resultado">Resultado</label>
			<input type="text" id="resultado" name="resultado"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["resultado"] ?>">
			<span class="error" id="ERRresultado"></span>
			<br><br>

			<label for="tipo">Tipo partido</label>
			<select id="tipo" required name="tipo">
				<span class="error" id="ERRtipo"></span>
				<option value='Amistoso' <?php if ($formulario["tipo"] == "Partido Amistoso")
												echo "selected" ?>>Amistoso</option>

				<option value='Liga' <?php if ($formulario["tipo"] == "Liga")
											echo "selected" ?>>Liga</option>

				<option value='Entrenamiento' <?php if ($formulario["tipo"] == "Entrenamiento")
													echo "selected" ?>>Entrenamiento</option>

			</select>
			<br><br>

			<label for="fecha">Fecha</label>
			<input type="date" id="fecha" name="fecha" value="<?php if ($formulario['fecha'] == '') echo '';
																else echo DateTime::createFromFormat('d/m/y', $formulario['fecha'])->format("Y-m-d"); ?>">
			<span class="error" id="ERRfecha"></span>
			<br><br>

			<label for="jugadores">Jugadores</label>
			<input type="text" id="jugadores" name="jugadores" pattern="<?php echo $regex_texto ?>" value="<?php echo $formulario["jugadores"] ?>">
			<span class="error" id="ERRjugadores"></span>
			<br><br>

			<label for="liga">Liga</label>
			<input list="lista" name="liga" id="liga" value="<?php echo $formulario['liga'] ?>" />
			<datalist id="lista">
				<?php
				require_once("../bd/gestionBD.php");
				require_once("../bd/ligas_BD.php");
				$conexion = crearConexionBD();
				$data = listadoLigas($conexion);
				foreach ($data as $lig) {
					echo "<option label='" . $lig["NOMBRE"] . "' value='" . $lig["OID_LG"] . "'>";
				}
				cerrarConexionBD($conexion)
				?>
			</datalist>
			<span class="error" id="ERRliga"></span>


		</div>
		<div class="send-button">
			<input type="image" id="submitPartido" name="submit" src="../images/tick.png" alt="submit">
		</div>
	</form>
</body>

<script>
	var tipos = ["Partido Amistoso", "Liga", "Entrenamiento"];
	var regex_texto = <?php echo REGEXJS_TEXTO ?>;
	var regex_nombre = <?php echo REGEXJS_NOMBRE ?>;
	var regex_int = <?php echo REGEXJS_INT ?>;
	var data = <?php echo json_encode($data); ?>;
	var ligas = data.map(x => x["OID_LG"]);

	function validate() {
		
		var test_equipos = textValidation(regex_nombre, "equiposFutbol");
		var test_goles = textValidation(regex_int, "goles");

		var test_fecha = dateValidation("fecha");
		var test_resultado = textValidation(regex_nombre, "resultado");
		var test_tipo = typeValidation(tipos, "tipo");
		var test_jugadores = textValidation(regex_texto, "jugadores", 2);
		var test_liga = typeValidation(ligas, "liga");
		if (test_equipos && test_goles && test_fecha && test_resultado
			test_tipo && test_jugadores && test_liga)
			document.getElementById("submit").disabled = "";
		else
			document.getElementById("submit").disabled = "disabled";
	}
	$(document).ready(function() {
		validate();
	});
	$(":input").keyup(function() {
		validate();
	});
</script>



</html>