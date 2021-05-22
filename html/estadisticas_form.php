<!DOCTYPE html>
<?php session_start();
if (!isset($_SESSION["log"]))
	Header("Location: ../inicioSesion.php"); ?>

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE ESTADÍSTICAS</title>
</head>

<body>
	<img class="bg" src="../images/fondo.png">
	<header>
		<div class="topnav">
			<ul>
				<li><a href="index.php">Inicio</a></li>
				<li><a href="social/social.php">Social</a></li>
				<li class="dropdown"><a class="dropdownbutton main">Juegos</a>
					<div class="dropdown-content">
						<a class="brawl-bar" href="brawlstars/BrawlStars.php">Brawl Stars</a>
						<a class="fortnite-bar" href="fortnite/Fortnite.php">Fortnite</a>
						<a class="clash-bar main" href="clashroyale/ClashRoyale.php">Clash royale</a>
						<a class="csgo-bar" href="csgo/CSGO.php">CS:GO</a>
						<a class="lol-bar" href="lol/LoL.php">LoL</a>
						<a class="fifa-bar" href="fifa/FIFA.php">FIFA</a>
					</div>
				</li>
				<?php
				if ($_SESSION["log"] != null) { ?>
					<a class="inicio-sesion" href="logOut.php">Cerrar sesión</a>
					<a class="inicio-sesion" id="welcoming">Bienvenido, <?php echo $_SESSION["log"]; ?></a>
				<?php } else {
				?>
					<a class="inicio-sesion" href="InicioSesion.php">Iniciar Sesión</a>
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
	$regex_int = REGEX_INT;
	if (!isset($_SESSION["formulario"])) {
		$formulario["fecha"] = "";
		$formulario["horas"] = "";
		$formulario["wr"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>

	<form action="estadisticas_validation.php" method="POST">

		<div>
			<h1 id="title"> ESTADISTICAS EMPLEADO </h1>
		</div>
		<div class="form">
			<label for="fecha">Mes: </label>
			<input type="date" id="fecha" name="fecha" value="<?php if ($formulario['fecha'] == '') echo '';
																else echo DateTime::createFromFormat('d/m/y', $formulario['fecha'])->format("Y-m-d"); ?>">
			<span class="error" id="ERRfecha"></span>


			<label for="horas">Horas trabajadas: </label>
			<input type="text" id="horas" name="horas" pattern="<?php echo $regex_int ?>" value="<?php echo $formulario["horas"] ?>">
			<span class="error" id="ERRhoras"></span>

			<input type="submit" id="submitEstadisticas" name="submit" value="Registrar estadisticas">
		</div>
		<script>
			var regex_int = <?php echo REGEXJS_INT ?>;

			function validate() {

				Boolean test_fecha = dateValidation("fecha");
				Boolean test_horas = textValidation(regex_int, "horas", 1);
				if (test_fecha && test_horas)
					document.getElementById("submitEstadisticas").disabled = "";
				else
					document.getElementById("submitEstadisticas").disabled = "disabled";
			}
			$(document).ready(function() {
				validate();
			});
			$(":input").keyup(function() {
				validate();
			});
		</script>
	</form>
</body>

</html>