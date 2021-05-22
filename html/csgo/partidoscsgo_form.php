<!DOCTYPE html>

<html lang="es">
<?php session_start();
if (!isset($_SESSION["log"]))
	Header("Location: ../inicioSesion.php"); ?>

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE PARTIDOS DE CS:GO</title>
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
						<a class="csgo-bar main" href="CSGO.php">CS:GO</a>
						<a class="lol-bar" href="../lol/LoL.php">LoL</a>
						<a class="fifa-bar" href="../fifa/FIFA.php">FIFA</a>
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
	$regex_nombre = REGEX_NOMBRE;
	$regex_texto = REGEX_TEXTO;
	$regex_int = REGEX_INT;
	if (!isset($_SESSION["formulario"])) {
		$formulario["mapa"] = "";
		$formulario["puntuacion"] = "";
		$formulario["compras"] = "";
		$formulario["resultado"] = "";
		$formulario["tipo"] = "";
		$formulario["fecha"] = "";
		$formulario["jugadores"] = "";
		$formulario["liga"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>
	<form action="partidoscsgo_validation.php" method="POST">
		<h1 id="title">NUEVO PARTIDO</h1>
		<div class="form">
			<label for="mapa">Mapa</label>
			<input type="text" id="mapa" name="mapa"
			pattern="<?php echo $regex_nombre ?>"
			value="<?php echo $formulario["mapa"] ?>">
			<span class="error" id="ERRmapa"></span>
			<br><br>

			<label for="puntuacion">Puntuacion</label>
			<input type="text" id="puntuacion" name="puntuacion"
			pattern="<?php echo $regex_int ?>"
			value="<?php echo $formulario["puntuacion"] ?>">
			<span class="error" id="ERRpuntuacion"></span>
			<br><br>

			<label for="compras">Compras por ronda</label>
			<input type="text" id="compras" name="compras"
			pattern="<?php echo $regex_int ?>"
			value="<?php echo $formulario["compras"] ?>">
			<span class="error" id="ERRcompras"></span>
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
			<input type="text" id="jugadores" name="jugadores"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["jugadores"] ?>">
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
	var data = <?php echo json_encode($data); ?>;
	var ligas = data.map(x => x["OID_LG"]);
	var regexn = <?php echo REGEXJS_NOMBRE ?>;
	var regext = <?php echo REGEXJS_TEXTO ?>;
	var regexi = <?php echo REGEXJS_INT ?>;

	function validate() {
		var puntos = document.getElementById('#puntuacion').value;
		var test_puntos = puntos >= 0 && puntos <= 16;
		var test_mapa = textValidation(regexn, "mapa");
		var test_puntuacion = textValidation(regexi, "puntuacion");
		if (test_puntuacion && !test_puntos)
			document.getElementById("ERRpuntuacion").innerHTML = "La puntuacion debe tomar un valor entre 0 y 16";
		var test_compras = textValidation(regexi, "compras");
		var test_fecha = dateValidation("fecha");
		var test_tipo = typeValidation(tipos, "tipo");
		var test_jugadores = textValidation(regext, "jugadores");
		var test_liga = typeValidation(ligas, "liga");
			
		if (test_mapa && test_puntuacion && test_compras && test_fecha
			&& test_tipo && test_jugadores && test_liga && test_puntos)
			document.getElementById("submitPartido").disabled = "";
		else
			document.getElementById("submitPartido").disabled = "disabled";
	}
	$(document).ready(function() {
		validate();
	});
	$(":input").keyup(function() {
		validate();
	});
</script>

</html>