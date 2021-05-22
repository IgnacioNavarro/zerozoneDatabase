<!DOCTYPE html>
<?php
session_start();
unset($_SESSION["formulario"]);
$_SESSION["bdid"] = "insert";
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
                        <a class="lol-bar main" href="../lol/LoL.php">LoL</a>
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
    <div class="searchtools">

        <div class="Busqueda-plantilla">
            <input type="text" id="searchBar" placeholder="Buscar en la plantilla de LoL" onkeyup="search()">
        </div>
    </div>
    <div id="partidos">
        <table class="center search">
            <tr>
                <th>Nombre y apellidos</th>
                <th>Nick ingame</th>
                <th>Tipo de Empleado</th>
                <th>Posición ocupada</th>

            </tr>
            <?php
            require_once("../bd/gestionBD.php");
            require_once("../bd/empleados_BD.php");
            $conexion = crearConexionBD();
            $data = listadoLOL($conexion);
            foreach ($data as $row) :

                $form["nombre"] = $row["NOMBRE"];
                $form["nick"] = $row["NICK"];
                $form["tipo"] = $row["TIPOEMPLEADO"];
                if ($row["POSICIONESPRINCIPALES"] == null) {
                    $form["posicion"] = "&#8213;";
                } else {
                    $form["posicion"] = $row["POSICIONESPRINCIPALES"];
                }
                $array = json_encode($form);

            ?>
                <tr>
                    <td><?php echo $form["nombre"] ?></td>
                    <td><a href="JugadorLoL.php" style="text-decoration: none; color: black;"><?php echo $form["nick"] ?></a></td>
                    <td><?php echo $form["tipo"] ?></td>
                    <td><?php echo $form["posicion"] ?></td>
                </tr>
            <?php endforeach ?>

        </table>
    </div>

    <script src="../javascrypt/script.js"></script>
</body>

</html>