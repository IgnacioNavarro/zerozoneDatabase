<?php session_start();
if (!isset($_SESSION["log"]))
	Header("Location: ../inicioSesion.php"); ?>
<html lang="es">

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE PARTIDOS DE CLASH ROYALE</title>
</head>

<body>
	<img class="bg" src="../images/fondo.png">
	<header>
		<div class="topnav">
			<ul>
				<li><a href="../index.php">Inicio</a></li>
				<li><a href="../social.php" class="main">Social</a></li>
				<li class="dropdown"><a class="dropdownbutton">Juegos</a>
					<div class="dropdown-content">
						<a class="brawl-bar" href="../brawlstars/BrawlStars.html">Brawl Stars</a>
						<a class="fortnite-bar" href="../fortnite/Fortnite.html">Fortnite</a>
						<a class="clash-bar" href="ClashRoyale.html">Clash royale</a>
						<a class="csgo-bar" href="../csgo/CSGO.html">CS:GO</a>
						<a class="lol-bar" href="../lol/LoL.html">LoL</a>
						<a class="fifa-bar" href="../fifa/FIFA.html">FIFA</a>
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

	<a href="javascript:history.back()" id="backArrow"><img src="../images/back-arrow.png"></a>

	<?php
	require_once('../validaciones.php');
	$regex_nombre = REGEX_NOMBRE;
	$regex_texto = REGEX_TEXTO;
	if (!isset($_SESSION["formulario"])) {
		$formulario["puntuacion"] = "";
		$formulario["baneos"] = "";
		$formulario["mazos"] = "";
		$formulario["modo"] = "";
		$formulario["resultado"] = "";
		$formulario["tipo"] = "";
		$formulario["fecha"] = "";
		$formulario["jugadores"] = "";
		$formulario["liga"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>

	<form action="partidosclashroyale_validation.php" method="POST">
		<h1 id="title">NUEVO PARTIDO</h1>
		<div class="form">

			<label for="puntuacion">Puntuacion</label>
			<input type="number" id="puntuacion" name="puntuacion"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["puntuacion"] ?>">
			<span class="error" id="ERRpuntuacion"></span>
			<br><br>

			<label for="baneos">Baneos</label>
			<input type="text" id="baneos" name="baneos"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["baneos"] ?>">
			<span class="error" id="ERRbaneos"></span>
			<br><br>

			<label for="mazos">Mazos</label>
			<input type="text" id="mazos" name="mazos"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["mazos"] ?>">
			<span class="error" id="ERRmazos"></span>
			<br><br>

			<label for="modo">Modo</label>
			<select id="modo" required name="modo">
				<span class="error" id="ERRmodo"></span>
				<option value='1vs1' <?php if ($formulario["modo"] == "1vs1")
											echo "selected" ?>>1vs1</option>

				<option value='2vs2' <?php if ($formulario["modo"] == "2vs2")
											echo "selected" ?>>2vs2</option>
			</select>
			<br><br>

			<label for="resultado">Resultado</label>
			<input type="text" id="resultado" name="resultado"
			pattern="<?php echo $regex_nombre ?>"
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
			<input type="date" id="fecha" name="fecha"
			value="<?php if ($formulario['fecha'] == '') echo '';
				else echo DateTime::createFromFormat('d/m/y', $formulario['fecha'])->format("Y-m-d"); ?>">
			<span class="error" id="ERRfecha"></span>
			<br><br>

			<label for="jugadores">Jugadores</label>
			<input type="text" id="jugadores" name="jugadores"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["jugadores"] ?>">
			<span class="error" id="ERRjugadores"></span>
			<br><br>

			<label for="liga">Liga</label>
			<input list="lista" name="liga" id="liga"
			value="<?php echo $formulario['liga'] ?>" />
			<datalist id="lista">
				<?php
				require_once("../bd/gestionBD.php");
				require_once("../bd/partidosfornite_bd.php");
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
		<input type="image" id="submitPartido" name="submit" src="../images/tick.png" alt="submit">
		</div>
	</form>

</body>

<script>
	var tipos = ["Partido Amistoso", "Liga", "Entrenamiento"];
	var modos = ["1vs1", "2vs2"];
	var regex_texto = <?php echo REGEXJS_TEXTO ?>;
	var regex_nombre = <?php echo REGEXJS_NOMBRE ?>;
	var data = <?php echo json_encode($data); ?>;
	var ligas = data.map(x => x["OID_LG"]);

	function validate() {

		var test_puntuacion = textValidation(regex_texto, "puntuacion");
		var test_resultado = textValidation(regex_nombre, "resultado");
		var test_baneos = textValidation(regex_texto, "baneos");
		var test_mazos = textValidation(regex_texto, "mazos");
		var test_fecha = dateValidation("fecha");
		var test_tipo = typeValidation(tipos, "tipo");
		var test_modo = typeValidation(modos, "modo");
		var test_jugadores = textValidation(regex_texto, "jugadores");
		var test_liga = typeValidation(ligas, "liga");
		if (test_puntuacion && test_resultado && test_baneos && test_mazos
			&& test_fecha && test_tipo && test_modo && test_jugadores && test_liga)
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