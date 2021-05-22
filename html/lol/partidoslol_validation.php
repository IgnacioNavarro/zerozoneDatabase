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
    $regex_texto = REGEX_TEXTO;
    $regex_wr = REGEX_WR;
    $regex_int = REGEX_INT;
    $regex_nombre = REGEX_NOMBRE;
    $formulario["kda"]=$_REQUEST["kda"];
    $formulario["campeones"]=$_REQUEST["campeones"];
    $formulario["baneos"]=$_REQUEST["baneos"];
    $formulario["objetivos"]=$_REQUEST["objetivos"];
    $formulario["builds"]=$_REQUEST["builds"];
    $formulario["resultado"] = $_REQUEST["resultado"];
    $formulario["tipo"] = $_REQUEST["tipo"];
    $formulario["fecha"] = $_REQUEST["fecha"];
    $formulario["jugadores"] = $_REQUEST["jugadores"];
    $formulario["liga"]=$_REQUEST["liga"];
    $_SESSION["formulario"]=$formulario;
    $tipos= array["Amistoso","Liga","Entrenamiento"];

    if (!empty($formulario["kda"]) && !preg_match($regex_wr,$formulario["kda"])) 
      Header("Location: partidoslol_form.php");
      if (!empty($formulario["campeones"]) && !preg_match($regex_texto,$formulario["campeones"])) 
      Header("Location: partidoslol_form.php");
      if (!empty($formulario["baneos"]) && !preg_match($regex_texto,$formulario["baneos"])) 
      Header("Location: partidoslol_form.php");
      if (!empty($formulario["objetivos"]) && !preg_match($regex_int,$formulario["objetivos"])) 
      Header("Location: partidoslol_form.php");
      if (!empty($formulario["builds"]) && !preg_match($regex_texto,$formulario["builds"])) 
      Header("Location: partidoslol_form.php");
    if (!empty($formulario["jugadores"]) && !preg_match($regex_texto,$formulario["jugadores"])) 
      Header("Location: partidoslol_form.php");
    if (!empty($formulario["resultado"]) && !preg_match($regex_nombre,$formulario["resultado"])) 
      Header("Location: partidoslol_form.php");
    if (!empty($formulario["tipo"]) && !in_array($formulario["tipo"], $tipos))
      Header("Location: partidoslol_form.php");
    if (testFecha($formulario["fecha"]))
      Header("Location: partidoslol_form.php");
    if (!empty($formulario["liga"]) !in_array($formulario["liga"], $ligas))
      Header("Location: partidoslol_form.php");

    if ($formulario['kda'] == '') $formulario['kda'] = null;
    if ($formulario['campeones'] == '') $formulario['campeones'] = null;
    if ($formulario['baneos'] == '') $formulario['baneos'] = null;
    if ($formulario['objetivos'] == '') $formulario['objetivos'] = null;
    if ($formulario['builds'] == '') $formulario['builds'] = null;
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
    insertarPartidoLoL($conexion, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["kda"],$formulario["campeones"] , $formulario["baneos"],$formulario["objetivos"],$formulario["builds"]);
  else
    actualizarPartidoLoL($conexion, $bdid, $formulario["resultado"], $formulario["tipo"], $fechadate, $formulario["jugadores"], $formulario["liga"], $formulario["kda"],$formulario["campeones"] , $formulario["baneos"],$formulario["objetivos"],$formulario["builds"]);
    cerrarConexionBD($conexion);
    Header("Location: PartidosLOL.php"); 

}
else Header("Location: partidoslol_form.php");
?>

