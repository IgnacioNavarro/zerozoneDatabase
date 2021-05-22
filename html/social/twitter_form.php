<!DOCTYPE html>
<?php
    session_start();
	if (!isset($_SESSION["log"]))
        Header("Location: ../inicioSesion.php");
?>
<html>

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="../javascrypt/social.js"></script>
    <meta charset="utf-8">
    <title>ZEROZONE</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
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
	if (!isset($_SESSION["formulario"])) {
        $formulario["seguidores"] = "";
        $formulario["interacciones"] = "";        
		$formulario["fecha"] = "";
		$_SESSION["formulario"] = $formulario;
	} else
		$formulario = $_SESSION["formulario"];
	?>
    <form action ="twitter_validation.php" method="POST">
        <div class="form">
            <label for="seguidores">SEGUIDORES</label>
            <input type="number" id="seguidores" name="seguidores" required value="<?php echo $formulario['seguidores'] ?>"><br><br>

            <label for="interacciones">INTERACCIONES</label>
            <input type="number" id="interacciones" name="interacciones" required value="<?php echo $formulario['interacciones'] ?>"><br><br>

            <label for="fecha">FECHA</label>
            <input type="date" id="fecha" name="fecha" required value="<?php if ($formulario['fecha'] == '') echo '';
            else echo DateTime::createFromFormat('d/m/y', $formulario['fecha'])->format("Y-m-d"); ?>">
            			<span class="error" id="ERRfecha"></span>
			<br><br>
        </div>
        <div class="send-button">
			<input type="image" id="submitEvento" name="submit" src="../images/tick.png" alt="submit">
		</div>
    </form>
</body>


</html>