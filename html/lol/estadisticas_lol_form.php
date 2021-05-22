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
	<title>ZEROZONE: REGISTRO DE ESTADÍSTICAS DE LEAGUE OF LEGENDS</title>
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
						<a class="csgo-bar" href="../csgo/CSGO.html">CS:GO</a>
						<a class="lol-bar" href="LoL.html">LoL</a>
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
	$regex_wr = REGEX_WR;
	$regex_int = REGEX_INT;
	if (!isset($_SESSION["formulario"])) {
		$formulario["fecha"] = "";
		$formulario["horas"] = "";
		$formulario["wrcampeon"] = "";
		$formulario["kdacampeon"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>

	<form action="estadisticas_lol_validation.php" method="POST">
		<div>
			<h1 id="title"> ESTADISTICAS EMPLEADO </h1>
		</div>
		<div class="form">
			<label for="fecha">Mes: </label>
			<input type="date" id="fecha" name="fecha" value="<?php if ($formulario['fecha'] == '') echo '';
																else echo DateTime::createFromFormat('d/m/y', $formulario['fecha'])->format("Y-m-d"); ?>">
			<span class="error" id="ERRfecha"></span>
			<br>

			<label for="horas">Horas trabajadas: </label>
			<input type="text" id="horas" name="horas" pattern="<?php echo $regex_int ?>" value="<?php echo $formulario["horas"] ?>">
			<span class="error" id="ERRhoras"></span>
			<br>

			<label for="wrcampeon">Winrate por campeón: </label>
			<input type="text" id="wrcampeon" name="wrcampeon" pattern="<?php echo $regex_wr ?>" value="<?php echo $formulario["wrcampeon"] ?>">
			<span class="error" id="ERRwrcampeon"></span>
			<br>

			<label for="kdacampeon">KDA por campeón: </label>
			<input type="text" id="kdacampeon" name="kdacampeon" pattern="<?php echo $regex_wr ?>" value="<?php echo $formulario["kdacampeon"] ?>">
			<span class="error" id="ERRkdacampeon"></span>
			<br>
		</div>
		<input type="submit" id="submitEstadisticas" name="submitEstadisticas" value="Registrar estadisticas">
		<script>
			var regex_int = <?php echo REGEXJS_INT ?>;
			var regex_wr = <?php echo REGEXJS_WR ?>;

			function validate() {

				Boolean test_fecha = dateValidation("fecha");
				Boolean test_horas = textValidation($regex_int, "horas", 1);
				Boolean test_wrcampeon = textValidation($regex_wr, "wrcampeon", 2);
				Boolean test_kdacampeon = textValidation($regex_wr, "kdacampeon", 2);
				if (test_fecha && test_horas && test_wrcampeon && test_kdacampeon)
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