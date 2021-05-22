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
                <li><a href="javascript:void(0)" class="main">Social</a></li>
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

    <div id="socialSearchBar">
            <label for="oldest"><b>Eventos programados entre</b></label>
            <input type="date" id="oldest" name="oldest">
            <label for="newest"><b>y</b></label>
            <input type="date" id="newest" name="newest">
            <a href="consultaTwitter.php"><img src="../images/twitter.png"></a>
            <a href="consultaInstagram.php"><img src="../images/instagram.png"></a>
            <a id="new" href="evento_form.php"><img src="../images/masIcon.png"></a>
        </form>

    </div>
    <div id="divTablaSocial">
        <table class="center" id="tablaSocial">
            <tr>
                <th>Nombre</th>
                <th>Fecha</th>
                <th>Tipo</th>
                <th></th>
            </tr>
            <?php
            require_once("../bd/gestionBD.php");
            require_once("../bd/eventos_BD.php");
            $conexion = crearConexionBD();
            $data = listadoEvento($conexion);
            foreach ($data as $row) :

                $form["nombre"] = $row["NOMBRE"];
                $form["fecha"] = $row["FECHA"];
                $form["tipo"] = $row["TIPOEVENTO"];
                $form["rival"] = $row["OID_ER"];
                $array = json_encode($form);

            ?>
                <tr>
                    <td><?php echo $form["nombre"] ?></td>
                    <td><?php echo $form["fecha"] ?></td>
                    <td><?php echo $form["tipo"] ?></td>
                    <td>
                        <div class="editdelete">
                            <form method="POST" action="../accion_editar.php">
                                <input name="formulario" type="hidden" value='<?php echo $array ?>'>
                                <input name="oid" type="hidden" value="<?php echo $row["OID_EV"] ?>">
                                <input name="destino" type="hidden" value="social/evento_form.php">
                                <input id="botonEditar" type="image" src="../images/EditIcon.png" alt="Editar evento" width="50" height="50">
                            </form>

                            <form method="POST" action="../accion_borrar.php">
                                <input name="oid" type="hidden" value="<?php echo $row["OID_EV"] ?>">
                                <input name="fichero" type="hidden" value="bd/eventos_BD.php">
                                <input name="func" type="hidden" value="borrarEvento">
                                <input name="destino" type="hidden" value="social/social.php">
                                <input id="botonBorrar" type="image" src="../images/trashIcon.png" alt="Borrar evento" width="50" height="50">
                            </form>
                        </div>
                    </td>
                </tr>
            <?php endforeach ?>
        </table>
    </div>
</body>

</html>