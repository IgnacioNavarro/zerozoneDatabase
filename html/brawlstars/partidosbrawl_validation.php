<?php
  session_start();
  if(!isset($_SESSION["log"]))
		Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once("../validaciones.php");
    require_once("../bd/ligas_BD.php");
    $conexion = crearConexionBD();
    $data = listadoLigas($conexion);
    $ligas = array();
    foreach ($data as $lig) {
      array_push($ligas, $lig['OID_LG']);
    }
		cerrarConexionBD($conexion);
    $regex_nombre = REGEXJS_NOMBRE;
    $regex_texto = REGEXJS_TEXTO;
    $formulario["mapa"]=$_REQUEST["mapa"];
    $formulario["modo"] = $_REQUEST["modo"];
    $formulario["brawlers"] = $_REQUEST["brawlers"];
    $formulario["puntuacion"] = $_REQUEST["puntuacion"];
    $formulario["resultado"] = $_REQUEST["resultado"];
    $formulario["tipo"] = $_REQUEST["tipo"];
    $formulario["fecha"] = $_REQUEST["fecha"];
    $formulario["jugadores"] = $_REQUEST["jugadores"];
    $formulario["liga"]=$_REQUEST["liga"];
    $_SESSION["formulario"]=$formulario;
    $tipos= array["Amistoso","Liga","Entrenamiento"];
    $modos = array["Atrapa Gemas","Atraco","Caza Estelar","Balon Brawl","Asedio"];

    if (!empty($formulario["mapa"]) && !preg_match($regex_nombre,$formulario["mapa"])) 
      Header("Location: partidosbrawl_form.php");
    if (!empty($formulario["brawlers"]) && !preg_match($regex_texto,$formulario["brawlers"])) 
      Header("Location: partidosbrawl_form.php");
    if (!empty($formulario["jugadores"]) && !preg_match($regex_texto,$formulario["jugadores"])) 
      Header("Location: partidosbrawl_form.php");
    if (!empty($formulario["puntuacion"]) && !preg_match($regex_texto,$formulario["puntuacion"])) 
      Header("Location: partidosbrawl_form.php");
    if (!empty($formulario["resultado"]) && !preg_match($regex_nombre,$formulario["resultado"])) 
      Header("Location: partidosbrawl_form.php");
    if (!empty($formulario["modo"]) && !in_array($formulario["modo"], $modos)) 
      Header("Location: partidosbrawl_form.php");
    if (!empty($formulario["tipo"]) && !in_array($formulario["tipo"], $tipos))
      Header("Location: partidosbrawl_form.php");
    if (testFecha($formulario["fecha"]))
      Header("Location: partidosbrawl_form.php");
    if (!empty($formulario["liga"]) !in_array($formulario["liga"], $ligas))
      Header("Location: partidosbrawl_form.php");

    if ($formulario['mapa'] == '') $formulario['mapa'] = null;
    if ($formulario['modo'] == '') $formulario['modo'] = null;
    if ($formulario['brawlers'] == '') $formulario['brawlers'] = null;
    if ($formulario['puntuacion'] == '') $formulario['puntuacion'] = null;
    if ($formulario['resultado'] == '') $formulario['resultado'] = null;
    if ($formulario['tipo'] == '') $formulario['tipo'] = null;
    if ($formulario['jugadores'] == '') $formulario['jugadores'] = null;
    if ($formulario['fecha'] == '') $fechadate = null;
      else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");
    if ($formulario['liga'] == '') $formulario['liga'] = null;

      require_once("../bd/gestionBD.php");
      require_once("../bd/partidos_BD.php");
      $conexion = crearConexionBD();
      $fechadate = date('d/m/Y', strtotime($formulario["fecha"]));
      $bdid = "insert";
      if ($bdid == "insert")
        insertarPartidoBrawl($conexion, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["mapa"], $formulario["modo"],$formulario["brawlers"] ,$formulario["puntuacion"] );
      else
        actualizarPartidoBrawl($conexion, $bdid, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["mapa"], $formulario["modo"],$formulario["brawlers"] ,$formulario["puntuacion"] );
      cerrarConexionBD($conexion);
      Header("Location: PartidosBrawl.php");
    }
  
  else Header("Location: partidosbrawl_form.php");
?>

