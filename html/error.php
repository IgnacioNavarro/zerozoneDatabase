<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>Error</title>
</head>

<body>
	<img class="bg" src="images/error-zz-web.png">
	<header>
		<div class="topnav">
			<ul>
				<li><a href="index.php">Inicio</a></li>
				<li><a href="formulario_evento/social.php">Social</a></li>
				<li class="dropdown"><a class="dropdownbutton">Juegos</a>
					<div class="dropdown-content">
						<a class="brawl-bar" href="brawlstars/BrawlStars.php">Brawl Stars</a>
						<a class="fortnite-bar" href="fortnite/Fortnite.php">Fortnite</a>
						<a class="clash-bar" href="clashroyale/ClashRoyale.php">Clash royale</a>
						<a class="csgo-bar" href="/csgo/CSGO.php">CS:GO</a>
						<a class="lol-bar" href="lol/LoL.php">LoL</a>
						<a class="fifa-bar" href="fifa/FIFA.php">FIFA</a>
					</div>
				</li>
				<a class="inicio-sesion" href="InicioSesion.php">Iniciar Sesión</a>
			</ul>
		</div>
	</header> 

    <a href="javascript:history.back()" id="backArrow"><img src="images/back-arrow.png"></a>
	
	<div class="details">
    <a href="javascript:void(0)" class="moreDetailsButton" onclick="toggle('downArrow');toggle('upArrow');toggle('errorMsg');">
		<b>Ver más detalles <span class="downArrow">&#11167;</span><span class="upArrow hiden">&#11165;</span></b>
	</a>
	<a href="./index.html" class="moreDetailsButton index"><b>Volver al inicio</b></a>
    
        <p class="errorMsg hiden">
			<?php
				session_start();
				$error = $_SESSION['excepcion'];
				echo $error;
			?>
        </p>
    </div>
    
<script src="javascrypt/script.js"></script>
</body>
</html>