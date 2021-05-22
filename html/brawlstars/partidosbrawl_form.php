<!DOCTYPE html>
<?php session_start();
if (!isset($_SESSION["log"]))
	Header("Location: ../inicioSesion.php"); ?>
<html lang="es">

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE PARTIDOS DE BRAWL STARS</title>
</head>

<body>
	<img class="bg" src="../images/fondo.png">
	<header>
		<div class="topnav">
			<ul>
				<li><a href="../index.php">Inicio</a></li>
				<li><a href="../social.php">Social</a></li>
				<li class="dropdown"><a class="dropdownbutton main">Juegos</a>
					<div class="dropdown-content">
						<a class="brawl-bar main" href="BrawlStars.php">Brawl Stars</a>
						<a class="fortnite-bar" href="../fortnite/Fortnite.php">Fortnite</a>
						<a class="clash-bar" href="../clashroyale/ClashRoyale.php">Clash royale</a>
						<a class="csgo-bar" href="../csgo/CSGO.php">CS:GO</a>
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
	if (!isset($_SESSION["formulario"])) {
		$formulario["mapa"] = "";
		$formulario["modo"] = "";
		$formulario["brawlers"] = "";
		$formulario["puntuacion"] = "";
		$formulario["resultado"] = "";
		$formulario["tipo"] = "";
		$formulario["fecha"] = "";
		$formulario["jugadores"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>

	<form action="partidosbrawl_validation.php" method="POST">
		<div>
			<h1 id="title"> NUEVO PARTIDO </h1>
		</div>
		<div class="form">
			<label for="mapa">Mapa</label>
			<input type="text" id="mapa" name="mapa"
			pattern="<?php echo $regex_nombre ?>"
			value="<?php echo $formulario["mapa"] ?>">
			<span class="error" id="ERRmapa"></span>
			<br><br>

			<label for="modo">Modo</label>
			<select id="modo" name="modo">
				<span class="error" id="ERRmodo"></span>
				<option value='Atrapa Gemas' <?php if ($formulario["modo"] == "Atrapa Gemas")
													echo "selected" ?>>Atrapa Gemas</option>

				<option value='Atraco' <?php if ($formulario["modo"] == "Atraco")
											echo "selected" ?>>Atraco</option>

				<option value='Caza Estelar' <?php if ($formulario["modo"] == "Caza Estelar")
													echo "selected" ?>>Caza Estelar</option>

				<option value='Balon Brawl' <?php if ($formulario["modo"] == "Balon Brawl")
												echo "selected" ?>>Balon Brawl</option>

				<option value='Asedio' <?php if ($formulario["modo"] == "Asedio")
											echo "selected" ?>>Asedio</option>
			</select>
			<br><br>

			<label for="brawlers">Brawlers</label>
			<input type="text" id="brawlers" name="brawlers"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["brawlers"] ?>">
			<span class="error" id="ERRbrawlers"></span>
			<br><br>

			<label for="puntuacion">Puntuacion</label>
			<input type="text" id="puntuacion" name="puntuacion"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["puntuacion"] ?>">
			<span class="error" id="ERRpuntuacion"></span>
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
	var modos = ["Atrapa Gemas", "Atraco", "Caza Estelar", "Balon Brawl", "Asedio"];
	var tipos = ["Partido Amistoso", "Liga", "Entrenamiento"];
	var regext = <?php echo REGEXJS_TEXTO ?>;
	var regexn = <?php echo REGEXJS_NOMBRE ?>;
	var data = <?php echo json_encode($data); ?>;
	var ligas = data.map(x => x["OID_LG"]);

	function validate() {
		var test_mapa = textValidation(regexn, "mapa");
		var test_brawlers = textValidation(regext, "brawlers", 3);
		var test_puntuacion = textValidation(regext, "puntuacion", 3);
		var test_modo = typeValidation(modos, "modo");

		var test_fecha = dateValidation("fecha");
		var test_resultado = textValidation(regexn, "resultado");
		var test_tipo = typeValidation(tipos, "tipo");
		var test_jugadores = textValidation(regext, "jugadores", 3);
		var test_liga = typeValidation(ligas, "liga");
		if (test_mapa && test_brawlers && test_fecha && test_puntuacion && test_resultado &&
			test_tipo && test_modo && test_jugadores && test_liga)
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