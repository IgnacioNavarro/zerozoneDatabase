<?php
  session_start();
  if(!isset($_SESSION["log"]))
    Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once('validaciones.php');
    $seccion = $_SESSION["seccion"];
    $regex_nombre = REGEX_NOMBRE;
    $regex_int = REGEX_INT;
    $regex_texto = REGEX_TEXTO;
    $tipos = ['Jugador', 'Manager', 'Coach' , 'Analista'];
    $experiencia = ['Y', 'N'];
    $tallas = ['XS','S', 'M', 'L', 'XL'];
    $formulario["nombre"]=$_REQUEST["nombre"];
    $formulario["dni"]=$_REQUEST["dni"];
    $formulario["edad"]=$_REQUEST["edad"];
    $formulario["telefono"]=$_REQUEST["telefono"];
    $formulario["tipo"]=$_REQUEST["tipo"];
    $formulario["equipo"]=$_REQUEST["equipo"];
    $formulario["posiciones"]=$_REQUEST["posiciones"];
    $formulario["nombreTutor"]=$_REQUEST["nombreTutor"];
    $formulario["dniTutor"]=$_REQUEST["dniTutor"];
    $formulario["emailTutor"]=$_REQUEST["emailTutor"];
    $formulario["telefonoTutor"]=$_REQUEST["telefonoTutor"];
    $formulario["fechainicio"]=$_REQUEST["fechainicio"];
    $formulario["fechafin"]=$_REQUEST["fechafin"];
    $formulario["experiencia"]=$_REQUEST["experiencia"];
    $formulario["horas"]=$_REQUEST["horas"];
    $formulario["email"]=$_REQUEST["email"];
    $formulario["nick"]=$_REQUEST["nick"];
    $formulario["rrss"]=$_REQUEST["rrss"];
    $formulario["direccion"]=$_REQUEST["direccion"];
    $formulario["talla"]=$_REQUEST["talla"];
    $_SESSION["formulario"] = $formulario;

    if (empty($formulario["nombre"]) || !preg_match($regex_nombre ,$formulario["nombre"]) ||
        empty($formulario["dni"]) || !preg_match('^[0-9]{8}[A-Z]$' ,$formulario["dni"]) ||
        empty($formulario["edad"]) || false || 
        empty($formulario["nick"]) || !preg_match($regex_nombre ,$formulario["nick"])
        || !in_array($formulario["tipo"] , $tipos))
      Header("Location: empleado_form.php");

    if (!empty($formulario["telefono"]) && !preg_match('^[0-9]{9}$' ,$formulario["telefono"]))
      Header("Location: empleado_form.php");
    if (!empty($formulario["fechainicio"]) && true)
      Header("Location: empleado_form.php");
    if (!empty($formulario["fechafin"]) && true)
      Header("Location: empleado_form.php");
    if (!empty($formulario["experiencia"]) && !in_array($formulario["experiencia"] , $experiencia))
      Header("Location: empleado_form.php");
    if (!empty($formulario["horas"]) && !preg_match($regex_int ,$formulario["horas"]))
      Header("Location: empleado_form.php");
    if (!empty($formulario["email"]) && !preg_match("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$" ,$formulario["email"]))
      Header("Location: empleado_form.php");
    if (!empty($formulario["rrss"]) && !preg_match($regex_texto ,$formulario["rrss"]))
      Header("Location: empleado_form.php");
    if (!empty($formulario["direccion"]) && !preg_match($regex_texto ,$formulario["direccion"]))
      Header("Location: empleado_form.php");
     if (!empty($formulario["talla"]) && !in_array($formulario["talla"] , $tallas))
      Header("Location: empleado_form.php");
    if ($formulario["tipo"] == 'Jugador') {
      if (!empty($formulario["equipo"]) && true)
        Header("Location: empleado_form.php");
      if ($seccion == 'LOL' || $seccion == 'Clash Royale') {
        if (!empty($formulario["posiciones"]) && !preg_match($regex_nombre ,$formulario["posiciones"]))
          Header("Location: empleado_form.php");
      }
      else $formulario["posiciones"] = null;
      if edad {
          if (empty($formulario["nombreTutor"]) || !preg_match($regex_nombre ,$formulario["nombreTutor"]) ||
            empty($formulario["dniTutor"]) || !preg_match('^[0-9]{8}[A-Z]$' ,$formulario["dniTutor"]) ||
            empty($formulario["emailTutor"]) || !preg_match("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$" ,$formulario["emailTutor"]) ||
            empty($formulario["telefonoTutor"]) || !preg_match('^[0-9]{9}$' ,$formulario["telefonoTutor"]))
          Header("Location: empleado_form.php");
      }
      else {
        $formulario["nombreTutor"] == null;
        $formulario["dniTutor"] == null;
        $formulario["emailTutor"] == null;
        $formulario["telefonoTutor"] == null;
      }
    }
  
    else $formulario["equipo"] = null;

  if (!empty($formulario["telefono"]) && !preg_match('^[0-9]{9}$' ,$formulario["telefono"]))
      Header("Location: empleado_form.php");
    if (!empty($formulario["fechainicio"]) && true)
      Header("Location: empleado_form.php");
    if (!empty($formulario["fechafin"]) && true)
      Header("Location: empleado_form.php");
    if (!empty($formulario["experiencia"]) && !in_array($formulario["experiencia"] , $experiencia))
      Header("Location: empleado_form.php");
    if (!empty($formulario["horas"]) && !preg_match($regex_int ,$formulario["horas"]))
      Header("Location: empleado_form.php");
    if (!empty($formulario["email"]) && !preg_match("^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$" ,$formulario["email"]))
      Header("Location: empleado_form.php");
    if (!empty($formulario["rrss"]) && !preg_match($regex_texto ,$formulario["rrss"]))
      Header("Location: empleado_form.php");
    if (!empty($formulario["direccion"]) && !preg_match($regex_texto ,$formulario["direccion"]))
      Header("Location: empleado_form.php");

      if ($formulario['telefono'] == '') $formulario['telefono'] = null;
      if ($formulario['fechainicio'] == '') $fechadateinicio = null;
        else $fechadateinicio = DateTime::createFromFormat('Y-m-d', $formulario['fechainicio'])->format("d-m-Y");
      if ($formulario['fechafin'] == '') $fechadatefin = null;
        else $fechadatefin = DateTime::createFromFormat('Y-m-d', $formulario['fechafin'])->format("d-m-Y");
      if ($formulario['experiencia'] == '') $formulario['experiencia'] = null;
      if ($formulario['horas'] == '') $formulario['horas'] = null;
      if ($formulario['email'] == '') $formulario['email'] = null;
      if ($formulario['rrss'] == '') $formulario['rrss'] = null;
      if ($formulario['direccion'] == '') $formulario['direccion'] = null;

      require_once("../bd/gestionBD.php");
    require_once("../bd/eventos_BD.php");
    $conexion = crearConexionBD();
    $bdid = $_SESSION["bdid"];
    if ($bdid == "insert") {
      switch ($formulario['tipo']) {
        case 'Jugador':
          insertarJugador($conexion, $formulario['dni'], $formulario['nombre'], $formulario['edad'],
          $formulario['telefono'], $formulario['tipo'], $seccion, $fechadateinicio, $fechadatefin,
          $formulario['experiencia'], $formulario['horas'], $formulario['email'],
          $formulario['nick'], $formulario['rrss'], $formulario['direccion'], $formulario['talla'], 
          $formulario['posiciones'], $formulario['nombreTutor'], $formulario['dniTutor'],
          $formulario['telefonoTutor'], $formulario['correoTutor'], $formulario['equipo']);
            break;
        case 'Analista':
          insertarAnalista($conexion, $formulario['dni'], $formulario['nombre'], $formulario['edad'],
          $formulario['telefono'], $formulario['tipo'], $seccion, $fechadateinicio, $fechadatefin,
          $formulario['experiencia'], $formulario['horas'], $formulario['email'],
          $formulario['nick'], $formulario['rrss'], $formulario['direccion'], $formulario['talla']);
            break;
        case 'Coach':
          insertarCoach($conexion, $formulario['dni'], $formulario['nombre'], $formulario['edad'],
          $formulario['telefono'], $formulario['tipo'], $seccion, $fechadateinicio, $fechadatefin,
          $formulario['experiencia'], $formulario['horas'], $formulario['email'],
          $formulario['nick'], $formulario['rrss'], $formulario['direccion'], $formulario['talla']);
            break;
        case 'Manager':
          insertarMannager($conexion, $formulario['dni'], $formulario['nombre'], $formulario['edad'],
          $formulario['telefono'], $formulario['tipo'], $seccion, $fechadateinicio, $fechadatefin,
          $formulario['experiencia'], $formulario['horas'], $formulario['email'],
          $formulario['nick'], $formulario['rrss'], $formulario['direccion'], $formulario['talla']);
            break;
      }
    }
    else {
      switch ($formulario['tipo']) {
        case 'Jugador':
          actualizarJugador($conexion, $formulario['dni'], $formulario['nombre'], $formulario['edad'],
          $formulario['telefono'], $formulario['tipo'], $seccion, $fechadateinicio, $fechadatefin,
          $formulario['experiencia'], $formulario['horas'], $formulario['email'],
          $formulario['nick'], $formulario['rrss'], $formulario['direccion'], $formulario['talla'], 
          $formulario['posiciones'], $formulario['nombreTutor'], $formulario['dniTutor'],
          $formulario['telefonoTutor'], $formulario['correoTutor'], $formulario['equipo']);
            break;
        case 'Analista':
          actualizarAnalista($conexion, $formulario['dni'], $formulario['nombre'], $formulario['edad'],
          $formulario['telefono'], $formulario['tipo'], $seccion, $fechadateinicio, $fechadatefin,
          $formulario['experiencia'], $formulario['horas'], $formulario['email'],
          $formulario['nick'], $formulario['rrss'], $formulario['direccion'], $formulario['talla']);
            break;
        case 'Coach':
          actualizarCoach($conexion, $formulario['dni'], $formulario['nombre'], $formulario['edad'],
          $formulario['telefono'], $formulario['tipo'], $seccion, $fechadateinicio, $fechadatefin,
          $formulario['experiencia'], $formulario['horas'], $formulario['email'],
          $formulario['nick'], $formulario['rrss'], $formulario['direccion'], $formulario['talla']);
            break;
        case 'Manager':
          actualizarMannager($conexion, $formulario['dni'], $formulario['nombre'], $formulario['edad'],
          $formulario['telefono'], $formulario['tipo'], $seccion, $fechadateinicio, $fechadatefin,
          $formulario['experiencia'], $formulario['horas'], $formulario['email'],
          $formulario['nick'], $formulario['rrss'], $formulario['direccion'], $formulario['talla']);
            break;
      }
    }
      cerrarConexionBD($conexion);
    switch ($seccion) {
      case 'LOL':
        Header("Location: lol/PlantillaLOL.php");
      case 'FORTNITE':
        Header("Location: fortnite/PlantillaFORTNITE.php");
      case 'CSGO':
        Header("Location: csgo/PlantillaCSGO.php");
      case 'FIFA':
        Header("Location: fifa/PlantillaFIFA.php");
      case 'Clash Royale':
        Header("Location: clashroyale/PlantillaCR.php");
      case 'Brawl Stars':
        Header("Location: brawlstars/PlantillaBS.php");
    }
    Header("Location: error.php");
  }
  else Header("Location: empleado_form.php");
?>