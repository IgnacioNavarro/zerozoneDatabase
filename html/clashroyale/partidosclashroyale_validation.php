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
		cerrarConexionBD($conexion)
    $regex_nombre = REGEXJS_NOMBRE;
    $regex_texto = REGEXJS_TEXTO;
    
    $formulario["puntuacion"]=$_REQUEST["puntuacion"];
    $formulario["baneos"]=$_REQUEST["baneos"];
    $formulario["mazos"]=$_REQUEST["mazos"];
    $formulario["modo"]=$_REQUEST["modo"];
    $formulario["resultado"] = $_REQUEST["resultado"];
    $formulario["tipo"] = $_REQUEST["tipo"];
    $formulario["fecha"] = $_REQUEST["fecha"];
    $formulario["jugadores"] = $_REQUEST["jugadores"];
    $formulario["liga"]=$_REQUEST["liga"];
    $_SESSION["formulario"]=$formulario;
    $modos= array["1vs1","2vs2"];
    $tipos= array["Amistoso","Liga","Entrenamiento"];

  if (!empty($formulario["mapa"]) && !preg_match($regex_nombre,$formulario["mapa"])) 
    Header("Location: partidosbrawl_form.php");
  if (!empty($formulario["baneos"]) && !preg_match($regex_texto,$formulario["baneos"])) 
    Header("Location: partidosbrawl_form.php");
  if (!empty($formulario["mazos"]) && !preg_match($regex_texto,$formulario["mazos"])) 
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
  if ($formulario['baneos'] == '') $formulario['baneos'] = null;
  if ($formulario['mazos'] == '') $formulario['mazos'] = null;
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
    
    $bdid ="insert";
    if ($bdid == "insert")
    insertarPartidoClash($conexion, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["puntuacion"], $formulario["baneos"], $formulario["mazos"], $formulario["modo"]);
  else
    actualizarPartidoClash($conexion, $bdid,  $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["puntuacion"], $formulario["baneos"], $formulario["mazos"], $formulario["modo"]);
  cerrarConexionBD($conexion);
  Header("Location: partidosCR.php"); 
}

else Header("Location: partidosclashroyale_form.php");
?>
