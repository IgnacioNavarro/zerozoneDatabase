<!DOCTYPE html>
<?php
session_start();
if (!isset($_SESSION["log"]))
    Header("Location: ../inicioSesion.php");
?>
<html>

<head>
    <script src="../javascrypt/script.js"></script>
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
    <div class="searchtools">

        <div class="Busqueda-plantilla">
            <input type="text" id="searchBar" placeholder="Buscar entre las ligas" onkeyup="searchLiga()">
        </div>
        <div class="newPlantilla">
            <a href="#" id="new"><img src="../images/masIcon.png"></a>
        </div>
    </div>
    <div id="partidos">
        <table class="center search" id="tablaPartidos">
           
            <tr>
                <th>Nombre</th>
                <th>Posicion</th>
                <th>Importe premio</th>
                <th>Fecha de cobro</th>
                <th></th>
            </tr>
            <?php
            require_once("../bd/gestionBD.php");
            require_once("../bd/ligas_BD.php");
            $conexion = crearConexionBD();
            $data = listadoLiga($conexion);
            foreach ($data as $row) :
                $form["nombre"] = $row["NOMBRE"];
                $form["posicion"] = $row["POSICION"];
                $form["importePremio"] = $row["IMPORTEPREMIO"];
                $form["fechaCobroPremio"] = $row["FECHACOBROPREMIO"];
                $array = json_encode($form);

            ?>
                <tr>
                    <td><?php echo $form["nombre"] ?></td>
                    <td><?php echo $form["posicion"] ?></td>
                    <td><?php echo $form["importePremio"] ?></td>
                    <td><?php echo $form["fechaCobroPremio"] ?></td>
                    <td>
                    <div class="editdelete">
                            <form method="POST" action="../accion_editar.php">
                                <input name="formulario" type="hidden" value='<?php echo $array ?>'>
                                <input name="oid" type="hidden" value="<?php echo $row["OID_LG"] ?>">
                                <input name="destino" type="hidden" value="../html/ligas_form.php">
                                <input id="botonEditar" type="image" src="../images/EditIcon.png" alt="Editar evento" width="50" height="50">
                            </form>

                            <form method="POST" action="../accion_borrar.php">
                                <input name="oid" type="hidden" value="<?php echo $row["OID_LG"] ?>">
                                <input name="fichero" type="hidden" value="bd/ligas_BD.php">
                                <input name="func" type="hidden" value="borrarLiga">
                                <input name="destino" type="hidden" value="brawlstars/LigasBS.php">
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