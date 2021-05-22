<?php session_start();
if (!isset($_SESSION["log"]))
	Header("Location: ../inicioSesion.php"); ?>
<html lang="es">

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE PARTIDOS DE LEAGUE OF LEGENDS</title>
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
						<a class="lol-bar main" href="LoL.php">LoL</a>
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
	$regex_texto = REGEX_TEXTO;
	$regex_wr = REGEX_WR;
	$regex_int = REGEX_INT;
	if (!isset($_SESSION["formulario"])) {
		$formulario["kda"] = "";
		$formulario["campeones"] = "";
		$formulario["baneos"] = "";
		$formulario["objetivos"] = "";
		$formulario["builds"] = "";
		$formulario["resultado"] = "";
		$formulario["tipo"] = "";
		$formulario["fecha"] = "";
		$formulario["jugadores"] = "";
		$formulario["liga"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];

	?>
	<form action="partidoslol_validation.php" method="POST">
		<h1 id="title">NUEVO PARTIDO</h1>
		<div class="form">

			<label>KDA</label>
			<input type="text" id="kda" name="kda"
			pattern="<?php echo $regex_wr ?>" 
			value="<?php echo $formulario["kda"] ?>">
			<span class="error" id="ERRkda"></span>
			<br><br>

			<label>Campeones</label>
			<input type="text" id="campeones" name="campeones"
			pattern="<?php echo $regex_texto ?>" 
			value="<?php echo $formulario["campeones"] ?>">
			<span class="error" id="ERRcampeones"></span>
			<br><br>

			<label>Baneos</label>
			<input type="text" id="baneos" name="baneos"
			pattern="<?php echo $regex_texto ?>" 
			value="<?php echo $formulario["baneos"] ?>">
			<span class="error" id="ERRbaneos"></span>
			<br><br>

			<label>Objetivos</label>
			<input type="text" id="objetivos" name="objetivos"
			pattern="<?php echo $regex_int ?>" 
			value="<?php echo $formulario["objetivos"] ?>">
			<span class="error" id="ERRobjetivos"></span>
			<br><br>

			<label>Builds</label>
			<input type="text" id="builds" name="builds"
			pattern="<?php echo $regex_texto ?>" 
			value="<?php echo $formulario["builds"] ?>">
			<span class="error" id="ERRbuilds"></span>
			<br><br>

			<label for="resultado">Resultado</label>
			<input type="text" id="resultado" name="resultado"
			pattern="<?php echo $regex_texto ?>"
			value="<?php echo $formulario["resultado"] ?>">
			<span class="error" id="ERRresultado"></span>
			<br><br>

			<label for="tipo">Tipo partido</label>
			<select id="tipo" name="tipo">
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
	var regext = <?php echo REGEXJS_TEXTO ?>;
	var regexwr = <?php echo REGEXJS_WR ?>;
	var regexi = <?php echo REGEXJS_INT ?>;
	var data = <?php echo json_encode($data); ?>;
	var ligas = data.map(x => x["OID_LG"]);

	function validate() {

		var test_kda = textValidation(regexwr, "kda");
		var test_campeones = textValidation(regext, "campeones", 3)
		var test_baneos = textValidation(regext, "baneos", 3)
		var test_objetivos = textValidation(regexi, "objetivos", 1)
		var test_builds = textValidation(regext, "builds", 3)
		
		var test_fecha = dateValidation("fecha");
		var test_resultado = textValidation(regexn, "resultado");
		var test_tipo = typeValidation(tipos, "tipo");
		var test_jugadores = textValidation(regext, "jugadores", 3);
		var test_liga = typeValidation(ligas, "liga");
		if (test_kda && test_campeones && test_fecha && test_resultado && test_objetivos &&
			test_tipo && test_baneos && test_builds && test_jugadores && test_liga)
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