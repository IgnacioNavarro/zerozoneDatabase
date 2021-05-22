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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="../javascrypt/social.js"></script>
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
    <div id="rrssHeader">
        <h1>Twitter <img src="../images/twitterOriginal.png"></h1>
        <a href="https://twitter.com/zerozoneclub" target="_blank" id="rrssLink">www.twitter.com/zerozoneclub</a>
        <form method="POST">
            <label for="date"><b>Datos desde el dia</b></label>
            <input type="date" id="date" name="date">
        </form>
        <a href="twitter_form.php"><img src="../images/masIcon.png"></a>
    </div>

    <div id="divTablaSocial">
        <table class="center" id="tablaSocial">
            <tr>
                <th>Seguidores</th>
                <th>Interacciones</th>
                <th>Fecha</th>
                <th></th>
            </tr>
            <?php
            require_once("../bd/gestionBD.php");
            require_once("../bd/red_social_BD.php");
            $conexion = crearConexionBD();
            $data = listadoTwitter($conexion);
            foreach ($data as $row) :
                $form["seguidores"] = $row["NUMEROSEGUIDORES"];
                $form["interacciones"] = $row["INTERACCIONES"];
                $form["fecha"] = $row["FECHA"];
                $array = json_encode($form);
            ?>
                <tr>
                    <td><?php echo $form["seguidores"] ?></td>
                    <td><?php echo $form["interacciones"] ?></td>
                    <td><?php echo $form["fecha"] ?></td>
                    <td>
                        <div style="display: flex; flex-direction: row; padding-left: 30px; padding-top: 5px;">
                            <form method="POST" action="../accion_editar.php">
                                <input name="formulario" type="hidden" value='<?php echo $array ?>'>
                                <input name="oid" type="hidden" value="<?php echo $row["OID_RRSS"] ?>">
                                <input name="destino" type="hidden" value="social/twitter_form.php">
                                <input id="botonEditar" type="image" src="../images/EditIcon.png" alt="Editar" width="50" height="50">
                            </form>

                            <form method="POST" action="../accion_borrar.php">
                                <input name="oid" type="hidden" value="<?php echo $row["OID_RRSS"] ?>">
                                <input name="fichero" type="hidden" value="bd/red_social_BD.php">
                                <input name="func" type="hidden" value="borrarRedSocial">
                                <input name="destino" type="hidden" value="social/consultaTwitter.php">
                                <input id="botonBorrar" type="image" src="../images/trashIcon.png" alt="Borrar evento" width="50" height="50">
                            </form>
                        </div>
                    </td>
                </tr>
            <?php endforeach ?>
        </table>
    </div>
    <script src="../javascrypt/script.js"></script>
</body>

</html>