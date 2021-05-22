<!DOCTYPE html>
<?php
session_start();
if (!isset($_SESSION["log"]))
    Header("Location: ../inicioSesion.php");
?>
<html>

<head>
    <meta charset="utf-8">
    <title>ZEROZONE</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>

<body>
    <img class="bg" src="../images/fondo.png">
    <header>
        <div class="topnav">
            <ul>
                <li><a href="../index.php">Inicio</a></li>
                <li><a href="../social/social.php">Social</a></li>
                <li class="dropdown"><a class="dropdownbutton main" href="javascript:void(0)">Juegos</a>
                    <div class="dropdown-content">
                        <a class="brawl-bar" href="../brawlstars/BrawlStars.php">Brawl Stars</a>
                        <a class="fortnite-bar" href="../fortnite/Fortnite.php">Fortnite</a>
                        <a class="clash-bar main" href="../clashroyale/ClashRoyale.php">Clash royale</a>
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
    <div style="text-align: center;">
        <img id="clashlogo" src="../images/clashroyale_logo.png">
    </div>
    <div class="button-container">
        <div class="row-button">
            <a class="button-juego" href="EquiposClash.php">EQUIPOS</a>
            <a class="button-juego" href="PlantillaCR.php">PLANTILLA</a>
        </div>
        <div class="row-button">
            <a class="button-juego" href="PartidosCR.php">PARTIDOS</a>
            <a class="button-juego" href="LigasCR.php">LIGAS</a>
        </div>
    </div>

    <script src="../javascrypt/script.js"></script>
</body>

</html>