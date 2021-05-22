<?php	session_start();
		if (!isset($_SESSION["log"]))
			Header("Location: ../inicioSesion.php"); ?>
<html lang="es">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script defer src="../javascrypt/form_functions.js"></script>
	<title>ZEROZONE: REGISTRO DE PARTIDOS DE FORTNITE</title>
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
						<a class="lol-bar" href="../lol/LoL.php">LoL</a>
						<a class="fifa-bar main" href="../fifa/FIFA.php">FIFA</a>
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
    if (!isset($_SESSION["formulario"])) {
		$formulario["bajas"] = "";
		$formulario["tipoFortnite"] = "";
        $formulario["posicion"] = "";
        $formulario["puntos"] = "";
        $formulario["resultado"] = "";
        $formulario["tipo"] = "";
        $formulario["fecha"] = "";
		$formulario["jugadores"] = "";
		$formulario["liga"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
        $formulario = $_SESSION["formulario"];

    ?>
		<form action="partidosfortnite_validation.php" method="POST">
			<h1 id="title">NUEVO PARTIDO</h1>
			<div class="form">
            
                <label>Bajas</label>
				<input type="number" id="bajas" name="bajas" value="<?php echo $formulario["bajas"] ?>">
				<span class="error" id="ERRbajas"></span>
				<br><br>            
    
                <label for="tipoFortnite">Tipo partido</label>
				<select id="tipoFortnite" required name="tipoFortnite">
				<span class="error" id="ERRtipoFortnite"></span>
					<option value='SOLO' <?php if ($formulario["tipoFortnite"] == "SOLO")
														echo "selected" ?>>SOLO</option>

					<option value='DUO' <?php if ($formulario["tipoFortnite"] == "DUO")
												echo "selected" ?>>DUO</option>

					<option value='SQUAD' <?php if ($formulario["tipoFortnite"] == "SQUAD")
														echo "selected" ?>>SQUAD</option>

				</select>
				<br><br>

				<label for="posicion">Posicion</label>
				<input type="number" id="posicion" name="posicion" value="<?php echo $formulario["posicion"] ?>">
				<span class="error" id="ERRPosicion"></span>
				<br><br>

				<label for="puntos">Puntos</label>
				<input type="number" id="puntos" name="puntos" value="<?php echo $formulario["puntos"] ?>">
				<span class="error" id="ERRpuntos"></span>
				<br><br>

                <label for="resultado">Resultado</label>
				<input type="text" id="resultado" name="resultado" value="<?php echo $formulario["resultado"] ?>">
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
				<input type="date" id="fecha" name="fecha" value="<?php echo $formulario["fecha"] ?>">
				<span class="error" id="ERRfecha"></span>
				<br><br>

                <label for="jugadores">Jugadores</label>
				<input type="text" id="jugadores" name="jugadores" required
				pattern="<?php echo $regex_texto ?>" value="<?php echo $formulario["jugadores"] ?>">
				<span class="error" id="ERRjugadores"></span>
				<br><br>

				<label for="liga">Liga</label>
				<input list="lista" name="liga" id="liga"value="<?php echo $formulario['liga']?>"/>
				<datalist id="lista">
					<?php
						require_once("../bd/gestionBD.php");
						require_once("../bd/partidosfornite_bd.php");
						$conexion = crearConexionBD();
						$data = listadoLigas($conexion);
						foreach($data as $lig) {
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
					var tiposFortnite = ["SOLO", "DUO", "SQUAD"];
					var tipos = ["Partido Amistoso", "Liga", "Entrenamiento"];
					var regex = <?php echo REGEXJS_TEXTO ?>;
					var data = <?php echo json_encode($data); ?>;
					var ligas = data.map(x => x["OID_LG"]);

				function validate()  {
				
					var test_fecha = dateValidation("fecha");
					var test_tipo = typeValidation(tipos, "tipo");
					var test_tipos = typeValidation(tiposFornite, "tipoFortnite");
					var test_jugadores = textValidation(regex, "jugadores");
					var test_liga = typeValidation(ligas, "liga");
					if (test_fecha && test_tipo && test_tipos && test_jugadores && test_liga)
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