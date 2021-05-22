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
	<meta charset="utf-8">
	<title>ZEROZONE: REGISTRO DE ESTADÍSTICAS DE CS:GO</title>
</head>

<body>
	<img class="bg" src="../images/fondo.png">
	<header>
		<div class="topnav">
			<ul>
				<li><a href="../index.php">Inicio</a></li>
				<li><a href="../social/social.php" class="main">Social</a></li>
				<li class="dropdown"><a class="dropdownbutton">Juegos</a>
					<div class="dropdown-content">
						<a class="brawl-bar" href="../brawlstars/BrawlStars.html">Brawl Stars</a>
						<a class="fortnite-bar" href="../fortnite/Fortnite.html">Fortnite</a>
						<a class="clash-bar" href="../clashroyale/ClashRoyale.html">Clash royale</a>
						<a class="csgo-bar" href="CSGO.html">CS:GO</a>
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

	<div class="backArrow">
		<a href="javascript:history.back()"><img src="../images/back-arrow.png"></a>
	</div>

	<?php
	require_once('../validaciones.php');
	$regex_wr = REGEX_WR;
	$regex_int = REGEX_INT;
	if (!isset($_SESSION["formulario"])) {
		$formulario["fecha"] = "";
		$formulario["horas"] = "";
		$formulario["wr"] = "";
		$formulario["kda"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>

	<form action="estadisticas_csgo_validation.php" method="POST">

		<fieldset>
			<label for="fecha">Mes: </label>
			<input type="month" id="fecha" name="fecha" value="<?php echo $formulario["fecha"] ?>">
			<span class="error" id="ERRfecha"></span>
			<br>

			<label for="horas">Horas trabajadas: </label>
			<input type="text" id="horas" name="horas" pattern="<?php echo $regex_int ?>" value="<?php echo $formulario["horas"] ?>">
			<span class="error" id="ERRhoras"></span>
			<br>

			<label for="wr">Winrate (%): </label>
			<input type="text" id="wr" name="wr" pattern="<?php echo $regex_wr ?>" value="<?php echo $formulario["wr"] ?>">
			<span class="error" id="ERRwr"></span>
			<br>

			<label for="kda">KDA: </label>
			<input type="text" id="kda" name="kda" pattern="<?php echo $regex_wr ?>" value="<?php echo $formulario["kda"] ?>">
			<span class="error" id="ERRkda"></span>
			<br>

			<input type="submit" id="submitEstadisticasCSGO" name="submitEstadisticasCSGO" value="Registrar estadisticas">
		</fieldset>

		<script>
			function validate() {

				Boolean test_fecha = dateValidation("fecha");
				Boolean test_horas = textValidation($regex_int, "horas", 1);
				Boolean test_wr = textValidation($regex_wr, "wr", 2);
				Boolean test_kda = textValidation($regex_wr, "kda", 2);
				if (test_fecha && test_horas && test_wr && test_kda)
					document.getElementById("submitEstadisticasCSGO").disabled = "";
				else
					document.getElementById("submitEstadisticasCSGO").disabled = "disabled";
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