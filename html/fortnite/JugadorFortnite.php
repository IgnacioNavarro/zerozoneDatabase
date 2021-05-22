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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../javascrypt/script.js"></script>
    <script src="../javascrypt/jugadorscript.js"></script>
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
                        <a class="brawl-bar main" href="../brawlstars/BrawlStars.php">Brawl Stars</a>
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


    <div class="top-jugador">
        <div class="jugador-info">
            <p id="datos-personales"><a href="#" id="dat-pers">Datos personales</a></p>
            <p id="estadisticas-personales"><a id="est-pers">Estadisticas</a></p>
        </div>
    </div>
    <div class="jugador" id="id-jugador">
        <div class="nick-jugador">
            ALEXIETOR
        </div>
        <p>NOmbre:</p>
        <div class="nombre-jugador">
            Alex
        </div>
        <p>dni:</p>
        <div class="dni-jugador">
            7777777777777
        </div>
        <p>edad:</p>
        <div class="edad-jugador">
            23
        </div>
        <p>telefono:</p>
        <div class="telefono-jugador">
            765432157
        </div>
        <p>tipo de empleado:</p>
        <div class="tipo-jugador">
            jugador
        </div>
        <p>sección:</p>
        <div class="seccion-jugador">
            brawl stars
        </div>
        <p>inicio de contrato:</p>
        <div class="inicio-contrato-jugador">
            30/01/2020
        </div>
        <p>fin de contrato:</p>
        <div class="fin-contrato-jugador">
            01/06/2020
        </div>
        <p>Experiencia previa:</p>
        <div class="experiencia-jugador">
            Si
        </div>
        <p>Horas mensuales:</p>
        <div class="horas-jugador">
            42
        </div>
        <p>email:</p>
        <div class="email-jugador">
            ALEXIETOR@gmail.com
        </div>
        <p>Redes sociales:</p>
        <div class="rrss-jugador">
            @ALEXIETORBS
        </div>
        <p>dirección:</p>
        <div class="direccion-jugador">
            Calle pino nº5
        </div>
        <p>talla camiseta:</p>
        <div class="talla-jugador">
            L
        </div>

    </div>
    <div class="estadisticas" id="id-estadisticas">
        <div class="nick-jugador">
            ALEXIETOR
        </div>
        <p>Mes:</p>
        <div class="mes-estadisticas">
            07
        </div>
        <p>Horas trabajadas:</p>
        <div class="horas-jugador">
            32
        </div>
        <p>Horas streaming:</p>
        <div class="tipo-jugador">
            75
        </div>
        <p>KDA:</p>
        <div class="seccion-jugador">
            2.3
        </div>

    </div>



</body>

</html>