<!DOCTYPE html>
<?php
session_start();
if (!isset($_SESSION["log"]))
    Header("Location: inicioSesion.php");
?>
<html>

<head>
    <meta charset="utf-8">
    <title>ZEROZONE</title>
    <script src="javascrypt/sessiondetect.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>

<body>
    <img class="bg" src="images/fondo.png">
    <header>
        <div class="topnav">
            <ul>
                <li><a href="#" class="main">Inicio</a></li>
                <li><a href="social/social.php">Social</a></li>
                <li class="dropdown"><a class="dropdownbutton" href="javascript:void(0)">Juegos</a>
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
    <div class="texto-inicio">
        <h2 class="titulo">Bienvenido a la base de datos de ZERØZONE</h2>
        <p>Para acceder pida a un administrador el usuario y contraseña. De otro modo no podrá acceder más allá de esta
            página.
        </p>
        <p>En esta base de datos se guardan datos de todas los empleados que forman parte de ZERØZONE,
            principalmente los jugadores de cada videojuego, separados en sus respectivas secciones, que puede ver en
            "Juegos".
        </p>
        <p>
            Para ver los datos de un jugador en concreto, puede ir a plantilla y hacer click sobre su nick, o desde
            equipo hacer click,
            ambas llevarán a sus datos personales y estadísticas, que puede modificar o borrar sin problema.
        </p>
        <p>
            Puede ver, añadir o editar los eventos programados en la pestaña de Social.
            También puede añadir datos sobre las redes sociales del club mensuales, tales como interacciones o número de
            seguidores.
        </p>
    </div>

    <script src="javascrypt/script.js"></script>
</body>

</html>