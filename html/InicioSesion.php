<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>ZEROZONE</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    </head>
    <body>
        <img class="bg" src="images/fondo.png">
        <header>
            <div class="topnav">
                <ul>
                    <li><a href="index.html">Inicio</a></li>
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
                    <a class="inicio-sesion main" href="InicioSesion.php">Iniciar Sesión</a>
                </ul>
            </div>
        </header>
        <div class="container-sesion">
            <div class="title-container">
                <h5>Inicia Sesión</h5>
            </div>
            <?php
            session_start();
            if (!isset($_SESSION["inicio"]) ) {
                $inicio["usuario"]="";
                $inicio["password"]="";
                $_SESSION["inicio"] = $inicio;
            }
            else
                $inicio=$_SESSION["inicio"];
            if (isset ($_SESSION["error"])) {
                $error=$_SESSION["error"];
            }
            else {
                $error = "";
            }
            ?>
            <form action="sesion_validation.php" method="POST">
                <div class="datos-usuario">
                    <p>
                        Usuario:
                    </p>
                    <div>
                        <input class="input-inicio" id="usuario" name="usuario" type="text" size="40" 
                        value="<?php echo $inicio["usuario"]?>"required/>
                    </div>
                </div>

                <div class="datos-usuario">
                    <p>
                        Contraseña:
                    </p>
                    <div>
                        <input class="input-inicio" id="password" name="password" type="password" size="40"
                        value="<?php echo $inicio["password"]?>"required/>
                    </div>
                    <?php if ($error != "") {
                            echo "<br>";
                            echo $error;
                    }?>
                </div>
                <input type="submit" class="but-ini button1" name="submit" value="Inicia sesión">
            </form>

        </div>
        <!--texto de la pagina principal-->
        <script src="script.js"></script>
    </body>
</html>