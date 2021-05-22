<?php session_start();
if (!isset($_SESSION["log"]))
	Header("Location: ../inicioSesion.php"); ?>
<html lang="es">

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script defer src="javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE LIGAS</title>
</head>

<body>
<img class="bg" src="images/fondo.png">
    <div class="topnav">
        <ul>
            <li><a href="index.php">Inicio</a></li>
            <li><a href="social/social.php">Social</a></li>
            <li class="dropdown"><a class="dropdownbutton">Juegos</a>
                <div class="dropdown-content">
                    <a class="brawl-bar" href="brawlstars/BrawlStars.php">Brawl Stars</a>
                    <a class="fortnite-bar" href="fortnite/Fortnite.php">Fortnite</a>
                    <a class="clash-bar" href="clashroyale/ClashRoyale.php">Clash royale</a>
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
	<a href="javascript:history.back()"><img src="images/back-arrow.png"></a>
	</div>
	<?php
	require_once('validaciones.php');
	if (!isset($_SESSION["formulario"])) {
		$formulario["nombre"] = "";
		$formulario["posicion"] = "";
		$formulario["importePremio"] = "";
		$formulario["fechaCobroPremio"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];

	?>
	<form action="ligas_validation.php" method="POST">
		<h1 id="title">NUEVA LIGA</h1>
		<div class="form">

			<label for="nombre">Nombre</label>
			<input type="text" id="nombre" name="nombre" required value="<?php echo $formulario["nombre"] ?>">
			<span class="error" id="ERRnombre"></span>
			<br><br>

			<label for="posicion">Posicion</label>
			<input type="number" id="posicion" name="posicion" value="<?php echo $formulario["posicion"] ?>">
			<span class="error" id="ERRposicion"></span>
			<br><br>
			<label for="importePremio">Importe del premio</label>
			<input type="number" id="importePremio" name="importePremio" value="<?php echo $formulario["importePremio"] ?>">
			<span class="error" id="ERRimportePremio"></span>
			<br><br>

			<label for="fechaCobroPremio">Fecha de cobro del premio</label>
			<input type="date" id="fechaCobroPremio" name="fechaCobroPremio" value="<?php if ($formulario['fechaCobroPremio'] == '') echo '';
																					else echo DateTime::createFromFormat('d/m/y', $formulario['fechaCobroPremio'])->format("Y-m-d"); ?>">
			<span class="error" id="ERRfechaCobroPremio"></span>
			<br><br>
		</div>
		<div class="send-button">
			<input type="image" id="submitLiga" name="submit" src="images/tick.png" alt="submit" width="50px" height="auto">
		</div>
	</form>
</body>




</html>