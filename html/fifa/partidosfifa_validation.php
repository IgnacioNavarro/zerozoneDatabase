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
    $regex_int = REGEXJS_INT;
    $formulario["equiposFutbol"]=$_REQUEST["equiposFutbol"];
    $formulario["goles"]=$_REQUEST["goles"];
    $formulario["resultado"] = $_REQUEST["resultado"];
    $formulario["tipo"] = $_REQUEST["tipo"];
    $formulario["fecha"] = $_REQUEST["fecha"];
    $formulario["jugadores"] = $_REQUEST["jugadores"];
    $formulario["liga"]=$_REQUEST["liga"];
    $_SESSION["formulario"]=$formulario;
    $tipos= array["Amistoso","Liga","Entrenamiento"];

    if (!empty($formulario["equiposFutbol"]) && !preg_match($regex_nombre,$formulario["equiposFutbol"])) 
      Header("Location: partidosfifa_form.php");
    if (!empty($formulario["goles"]) && !preg_match($regex_int, $formulario["goles"])) 
      Header("Location: partidosfifa_form.php");
    if (!empty($formulario["jugadores"]) && !preg_match($regex_texto,$formulario["jugadores"])) 
      Header("Location: partidosfifa_form.php");
    if (!empty($formulario["resultado"]) && !preg_match($regex_nombre,$formulario["resultado"])) 
      Header("Location: partidosfifa_form.php");
    if (!empty($formulario["tipo"]) && !in_array($formulario["tipo"], $tipos))
      Header("Location: partidosfifa_form.php");
    if (testFecha($formulario["fecha"]))
      Header("Location: partidosfifa_form.php");
    if (!empty($formulario["liga"]) !in_array($formulario["liga"], $ligas))
      Header("Location: partidosfifa_form.php");

    if ($formulario['equiposFutbol'] == '') $formulario['equiposFutbol'] = null;
    if ($formulario['goles'] == '') $formulario['goles'] = null;
    if ($formulario['resultado'] == '') $formulario['resultado'] = null;
    if ($formulario['tipo'] == '') $formulario['tipo'] = null;
    if ($formulario['jugadores'] == '') $formulario['jugadores'] = null;
    if ($formulario['fecha'] == '') $fechadate = null;
      else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");
    if ($formulario['liga'] == '') $formulario['liga'] = null;

      require_once("../bd/gestionBD.php");
      require_once("../bd/partidos_BD.php");
      $conexion = crearConexionBD();
      $bdid = "insert";
    if ($bdid == "insert")
      insertarPartidoFifa($conexion, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["equiposFutbol"],$formulario["goles"] );
    else
      actualizarPartidoFifa($conexion, $bdid, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["equiposFutbol"],$formulario["goles"] );
    cerrarConexionBD($conexion);
    Header("Location: PartidosFIFA.php"); 
 
}
else Header("Location: partidosfifa_form.php");
?>