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


    <div class="equipos-container">
    <?php
            require_once("../bd/gestionBD.php");
            require_once("../bd/equipos_BD.php");
            $conexion = crearConexionBD();
            $data = listadoFIFA($conexion);
            foreach ($data as $row) :
                $form["dni"] = $row[0]["DNI"];
                $form["nombre"] = $row[0]["NOMBRE"];
                $form["clasificacionGlobal"] = $row[0]["CLASIFICACIONGLOBAL"];
                $form["clasificacionNacional"] = $row[0]["CLASIFICACIONNACIONAL"];
                $array = json_encode($form);
        ?>
        <a href="EquipoFIFA.php" class="link-equipo-fifa link-equipo">
            <div class="equipo-container">
                <div class="nombre-equipo">
                <?php echo $form["nombre"] ?>
                </div>
                <div class="Jugadores">
                    <p style="font-weight: 600; font-size: 30px;">JUGADORES</p>
                    <?php
                            foreach($row[1] as $nombre) :
                        ?>
                        <p><?php echo $nombre["NOMBRE"]; endforeach ?>
                </div>
                <div class="Ligas">
                    <p style="font-weight: 600; font-size: 30px;">LIGAS</p>
                    <?php
                            foreach($row[2] as $nombre) :
                        ?>
                        <p><?php echo $nombre["NOMBRE"]; endforeach ?>
                </div>
                <div class="Staff">
                    <p style="font-weight: 600; font-size: 30px;">STAFF</p>
                        <p><?php echo $row[3][0]["NOMBRE"];?></p>
                        <p><?php echo $row[4][0]["NOMBRE"];?></p>
                        <p><?php echo $row[5][0]["NOMBRE"];?></p>
                </div>
            </div>
        </a>
        <?php endforeach ?>
    </div>
    <script src="script.js"></script>
</body>

</html>