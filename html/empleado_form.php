<!DOCTYPE html>
<?php session_start();
if (!isset($_SESSION["log"]))
    Header("Location: ../inicioSesion.php"); ?>
<html lang="es">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script defer src="javascrypt/form_functions.js"></script>
    <title>ZEROZONE: REGISTRO DE EMPLEADOS</title>
</head>

<body>
    <img class="bg" src="images/fondo.png">
    <div class="topnav">
        <ul>
            <li><a href="index.php">Inicio</a></li>
            <li><a href="social/social.php">Social</a></li>
            <li class="dropdown"><a class="dropdownbutton">Juegos</a>
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
		<a href="javascript:history.back()"><img src="images/back-arrow.png"></a>
	</div>

    <?php
    require_once('validaciones.php');
    $seccion = $_SESSION["seccion"];
    $regex_nombre = REGEX_NOMBRE;
    $regex_int = REGEX_INT;
    $regex_texto = REGEX_TEXTO;
    if (!isset($_SESSION["formulario"])) {
        $formulario["nombre"] = "";
        $formulario["dni"] = "";
        $formulario["edad"] = "";
        $formulario["telefono"] = "";
        $formulario["tipo"] = "Coach";
        $formulario["equipo"] = "";
        $formulario["posiciones"] = "";
        $formulario["nombreTutor"] = "";
        $formulario["dniTutor"] = "";
        $formulario["emailTutor"] = "";
        $formulario["telefonoTutor"] = "";
        $formulario["fechainicio"] = "";
        $formulario["fechafin"] = "";
        $formulario["experiencia"] = "";
        $formulario["horas"] = "";
        $formulario["email"] = "";
        $formulario["nick"] = "";
        $formulario["rrss"] = "";
        $formulario["direccion"] = "";
        $formulario["talla"] = "M";
        $_SESSION["formulario"] = $formulario;
    } else
        $formulario = $_SESSION["formulario"];
    ?>

    <form action="empleado_validation.php" method="POST">
    <div class="form">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" pattern="<?php echo $regex_nombre ?>" required value="<?php echo $formulario["nombre"] ?>">
        <span class="error" id="ERRnombre"></span><br>


        <label for="dni">DNI:</label>
        <input type="text" id="dni" name="dni" pattern="[0-9]{8}[A-Z]" required value="<?php echo $formulario["dni"] ?>">
        <span class="error" id="ERRdni"></span><br>

        <label for="edad">Fecha nacimiento:</label>
        <input type="date" id="edad" name="edad" required value="<?php if ($formulario['edad'] == '') echo '';
                                                                    else echo DateTime::createFromFormat('d/m/y', $formulario['edad'])->format("Y-m-d"); ?>">
        <span class="error" id="ERRedad"></span><br>

        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" pattern="[0-9]{9}" value="<?php echo $formulario["telefono"] ?>">
        <span class="error" id="ERRtelefono"></span><br>

        <label for="tipo">Tipo empleado:</label>
        <select id="tipo" name="tipo">
            <option value='Coach' <?php if ($formulario["tipo"] == "Coach")
                                        echo "selected" ?>>Coach</option>
            <option value='Jugador' <?php if ($formulario["tipo"] == "Jugador")
                                        echo "selected" ?>>Jugador</option>
            <option value='Manager' <?php if ($formulario["tipo"] == "Manager")
                                        echo "selected" ?>>Manager</option>
            <option value='Analista' <?php if ($formulario["tipo"] == "Analista")
                                            echo "selected" ?>>Analista</option>
        </select><span class="error" id="ERRtipo"></span><br>

        <div id="divEquipo">
            <label for="equipo">Equipo:</label>
            <input list="equipos" id="equipo" name="equipo" value="<?php echo $formulario["equipo"] ?>" />
            <datalist id="equipos">
                <?php
                require_once("bd/gestionBD.php");
                require_once("bd/equipos_BD.php");
                $conexion = crearConexionBD();
                $data = listadoEquiposPorSeccion($conexion, $seccion);
                $equipos = array();
                foreach ($data as $equipo) {
                    echo "<option label='" . $equipo[0]["NOMBRE"] . "' value='" . $equipo[0]["OID_EQ"] . "'>";
                    array_push($equipos, $equipo[0]["OID_EQ"]);
                }
                cerrarConexionBD($conexion)
                ?>
            </datalist>
            <span class="error" id="ERRequipo"></span><br>
        </div>
        <div id="divPosiciones">
            <label for="posiciones">Posiciones principales:</label>
            <input type="text" id="posiciones" name="posiciones" value="<?php echo $formulario["posiciones"] ?>">
            <span class="error" id="ERRposiciones"></span><br>
        </div>

        <div id="datosMenores">
            <label for="nombreTutor">Nombre del tutor:</label>
            <input type="text" id="nombreTutor" name="nombreTutor" pattern="<?php echo $regex_nombre ?>" value="<?php echo $formulario["nombreTutor"] ?>">
            <span class="error" id="ERRnombreTutor"></span><br>

            <label for="dniTutor">DNI del tutor:</label>
            <input type="text" id="dniTutor" name="dniTutor" pattern="[0-9]{8}[A-Z]" value="<?php echo $formulario["dniTutor"] ?>">
            <span class="error" id="ERRdniTutor"></span><br>

            <label for="telefonoTutor">Teléfono del tutor:</label>
            <input type="text" id="telefonoTutor" name="telefonoTutor" pattern="[0-9]{9}" value="<?php echo $formulario["telefonoTutor"] ?>">
            <span class="error" id="ERRtelefonoTutor"></span><br>

            <label for="emailTutor">Email del tutor:</label>
            <input type="text" id="emailTutor" name="emailTutor" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}" value="<?php echo $formulario["emailTutor"] ?>">
            <span class="error" id="ERRemailTutor"></span><br>
        </div>

        <label for="fechainicio">Fecha inicio de contrato:</label>
        <input type="date" id="fechainicio" name="fechainicio" value="<?php if ($formulario['fechainicio'] == '') echo '';
                                                                        else echo DateTime::createFromFormat('d/m/y', $formulario['fechainicio'])->format("Y-m-d"); ?>">
        <span class="error" id="ERRfechainicio"></span><br>

        <label for="fechafin">Fecha fin de contrato:</label>
        <input type="date" id="fechafin" name="fechafin" value="<?php if ($formulario['fechafin'] == '') echo '';
                                                                else echo DateTime::createFromFormat('d/m/y', $formulario['fechafin'])->format("Y-m-d"); ?>">
        <span class="error" id="ERRfechafin"></span><br>

        <p>Experiencia previa:</p>
        <input type="checkbox" name="experienciasi"
        <?php if ($formulario['experiencia'] == 'Y') echo 'checked'; ?>
        id="experienciasi" value="Y"><br>
        <label for="experienciasi">Con experiencia</label>
        
        <input type="checkbox" name="experienciano"
        <?php if ($formulario['experiencia'] == 'N') echo 'checked'; ?>
        id="experienciano" value="N">
        <label for="experienciano">Sin experiencia</label>
        <br>

        <label for="horas">Horas mensuales:</label>
        <input type="text" id="horas" name="horas" pattern="<?php echo $regex_int ?>" value="<?php echo $formulario["horas"] ?>">
        <span class="error" id="ERRhoras"></span>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}" value="<?php echo $formulario["email"] ?>">
        <span class="error" id="ERRemail"></span>

        <label for="nick">Nickname:</label>
        <input type="text" id="nick" name="nick" pattern="<?php echo $regex_nombre ?>" required value="<?php echo $formulario["nick"] ?>">
        <span class="error" id="ERRnick"></span>

        <label for="rrss">Redes sociales:</label>
        <input type="text" id="rrss" name="rrss" pattern="<?php echo $regex_texto ?>" value="<?php echo $formulario["rrss"] ?>">
        <span class="error" id="ERRrrss"></span>

        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion" pattern="<?php echo $regex_texto ?>" value="<?php echo $formulario["direccion"] ?>">
        <span class="error" id="ERRdireccion"></span>

        <label for="talla">Talla de camiseta:</label>
        <select id="talla" name="talla">
            <option value='xl' <?php if ($formulario["talla"] == "XL")
                                    echo "selected" ?>>XL</option>
            <option value='l' <?php if ($formulario["talla"] == "L")
                                    echo "selected" ?>>L</option>
            <option value='m' <?php if ($formulario["talla"] == "M")
                                    echo "selected" ?>>M</option>
            <option value='s' <?php if ($formulario["talla"] == "S")
                                    echo "selected" ?>>S</option>
            <option value='xs' <?php if ($formulario["talla"] == "XS")
                                    echo "selected" ?>>XS</option>
        </select><br>
        <input type="submit" id="submit" name="submit" value="Introducir empleado">
        </div>
    </form>
</body>
<script>
    var seccion = "<?php echo $seccion ?>";
    var tipos = ['Jugador', 'Manager', 'Coach', 'Analista'];
    var equipos = '<?php echo json_encode($equipos); ?>';
    var regex_nombre = <?php echo REGEXJS_NOMBRE ?>;
    var regex_int = <?php echo REGEXJS_INT ?>;
    var regex_texto = <?php echo REGEXJS_TEXTO ?>;

    function fadeDatosJugadores() {
        if (document.getElementById("tipo").value == 'Jugador')
            $("#divEquipos").fadeIn();
        if (seccion === 'LOL' || seccion === 'Clash Royale')
            $("#divPosiciones").fadeIn();
        else {
            $("#divEquipos").fadeOut();
            $("#divPosiciones").fadeOut();
        }
    }

    function fadeDatosMenores(intervalo) {
        if (document.getElementById("tipo").value == 'Jugador' && intervalo < 18) {
            $("#datosMenores").fadeIn();
            console.log("Le gustan menores");
            document.getElementById('nombreTutor').required = true;
            document.getElementById('dniTutor').required = true;
            document.getElementById('emailTutor').required = true;
            document.getElementById('telefonoTutor').required = true;
        } else {
            $("#datosMenores").fadeOut();
            document.getElementById('nombreTutor').required = false;
            document.getElementById('dniTutor').required = false;
            document.getElementById('emailTutor').required = false;
            document.getElementById('telefonoTutor').required = false;
        }
    }

    $("#experienciasi").change(function() {
        if (this.checked) {
            $("#experienciano").prop("checked", false);
        }
    });
    $("#experienciano").change(function() {
        if (this.checked) {
            $("#experienciasi").prop("checked", false);
        }
    });

    function validate(intervalo) {
        var test_nombre = textValidation(regex_nombre, "nombre");
        var test_dni = textValidation('^[0-9]{8}[A-Z]$', "dni", 4);
        var test_edad = dateValidation("edad");
        var test_telefono = textValidation('^[0-9]{9}$', "telefono", 5);
        var test_tipo = typeValidation(tipos, "tipo");
        var test_fechainicio = dateValidation("fechainicio");
        var test_fechafin = dateValidation("fechafin");
        var test_horas = textValidation(regex_int, "horas", 1);
        var test_email = textValidation("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$", "email", 6);
        var test_nick = textValidation(regex_nombre, "nick");
        var test_rrss = textValidation(regex_texto, "rrss", 3);
        var test_direccion = textValidation(regex_texto, "direccion", 3);
        var test_gen = test_nombre && test_dni && test_edad && test_telefono && test_tipo && test_fechainicio && test_fechafin &&
            test_horas && test_email && test_nick && test_rrss && test_direccion && test_tipo;

        if (document.getElementById("tipo").value == 'Jugador') {
            test_gen = test_gen && typeValidation(equipos, "equipo");
            if (seccion === 'LOL' || seccion === 'Clash Royale')
                test_gen = test_gen && textValidation(regex_nombre, "posiciones");
            if (intervalo < 18) {
                var test_nombreTutor = textValidation(regex_nombre, "nombreTutor");
                var test_dniTutor = textValidation('^[0-9]{8}[A-Z]$', "dniTutor", 4);
                var test_emailTutor = textValidation("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$", "emailTutor", 6);
                var test_telefonoTutor = textValidation('^[0-9]{9}$', "telefonoTutor", 5);
                test_gen = test_gen && test_nombreTutor && test_dniTutor && test_emailTutor && test_telefonoTutor;
            }
        }
        if (test_gen)
            document.getElementById("submit").disabled = "";
        else
            document.getElementById("submit").disabled = "disabled";
    }
    $(document).ready(function() {
        var fecha = document.getElementById('edad').value;
        var intervalo = moment().diff(moment(fecha, 'YYYY-MM-DD', true), 'years');
        validate(intervalo);
        fadeDatosJugadores();
        fadeDatosMenores(intervalo);
    });
    $(":input").change(function() {
        var fecha = document.getElementById('edad').value;
        var intervalo = moment().diff(moment(fecha, 'YYYY-MM-DD', true), 'years');
        validate(intervalo);
        fadeDatosJugadores();
        fadeDatosMenores(intervalo);
    });
</script>

</html>