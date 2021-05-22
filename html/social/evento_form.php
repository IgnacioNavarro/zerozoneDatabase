<?php session_start();
if (!isset($_SESSION["log"]))
	Header("Location: ../inicioSesion.php"); ?>
<html lang="es">

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE EVENTOS</title>
</head>

<body>
	<img class="bg" src="../images/fondo.png">
	<header>
		<div class="topnav">
			<ul>
				<li><a href="../index.php">Inicio</a></li>
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
	if (!isset($_SESSION["formulario"])) {
		$formulario["nombre"] = "";
		$formulario["fecha"] = "";
		$formulario["tipo"] = "Informativa";
		$formulario["rival"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>


	<form action="evento_validation.php" method="POST">
		<div>
			<h1 id="title"> NUEVO EVENTO </h1>
		</div>
		<div class="form">
			<label for="nombre">Nombre</label>
			<input type="text" id="nombre" name="nombre" required pattern="<?php echo $regex_nombre ?>" value="<?php echo $formulario["nombre"] ?>">
			<span class="error" id="ERRnombre"></span>
			<br><br>

			<label for="fecha">Fecha programada</label>
			<input type="date" id="fecha" name="fecha" value="<?php if ($formulario['fecha'] == '') echo '';
																else echo DateTime::createFromFormat('d/m/y', $formulario['fecha'])->format("Y-m-d"); ?>">
			<span class="error" id="ERRfecha"></span>
			<br><br>

			<label for="tipo">Tipo evento</label>
			<select id="tipo" required name="tipo">
				<option value='Partido previsto' <?php if ($formulario["tipo"] == "Partido previsto")
														echo "selected" ?>>Partido previsto</option>

				<option value='Jugada' <?php if ($formulario["tipo"] == "Jugada")
											echo "selected" ?>>Jugada</option>

				<option value='Presentacion' <?php if ($formulario["tipo"] == "Presentacion")
													echo "selected" ?>>Presentación</option>

				<option value='Informativa' <?php if ($formulario["tipo"] == "Informativa")
												echo "selected" ?>>Informativa</option>
			</select>
			<span class="error" id="ERRtipo"></span>
			<br><br>

			<label for="rival">Equipo rival participante:</label>
			<input list="rivales" name="rival" id="rival" value="<?php echo $formulario['rival'] ?>" />
			<datalist id="rivales">
				<?php
				require_once("../bd/gestionBD.php");
				require_once("../bd/equipos_rivales_BD.php");
				$conexion = crearConexionBD();
				$data = listadoEquiposRivales($conexion);
				foreach ($data as $equipo) {
					echo "<option label='" . $equipo["NOMBRE"] . "' value='" . $equipo["OID_ER"] . "'>";
				}
				cerrarConexionBD($conexion)
				?>
			</datalist>
			<span class="error" id="ERRrival"></span>

		</div>
		<div class="send-button">
			<input type="image" id="submitEvento" name="submit" src="../images/tick.png" alt="submit">
		</div>
	</form>

</body>

<script>
	var tipos = ["Partido previsto", "Jugada", "Presentacion", "Informativa"];
	var data = <?php echo json_encode($data); ?>;
	var regex = <?php echo REGEXJS_NOMBRE ?>;
	var equipos = data.map(x => x["OID_ER"]);

	function validate() {

		var test_nombre = textValidation(regex, "nombre");
		var test_fecha = dateValidation("fecha");
		var test_tipo = typeValidation(tipos, "tipo");
		var test_equipo = typeValidation(equipos, "rival");
		if (test_nombre && test_fecha && test_tipo && test_equipo)
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