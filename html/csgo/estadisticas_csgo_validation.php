<?php
  session_start();
  if(!isset($_SESSION["log"]))
			Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once("../validaciones.php");
    $regex_int = REGEX_INT;
    $regex_wr = REGEX_WR;
    $formulario["fecha"]=$_REQUEST["fecha"];
    $formulario["horas"]=$_REQUEST["horas"];
    $formulario["wr"]=$_REQUEST["wr"];
    $formulario["kda"]=$_REQUEST["kda"];
    $_SESSION["formulario"]=$formulario;
   
    if (testFecha($formulario["fecha"]))
      Header("Location: estadisticas_csgo_form.php");

    if (!empty($formulario["horas"]) && !preg_match($regex_int, $formulario["horas"]))
      Header("Location: estadisticas_csgo_form.php");

    if (!empty($formulario["wr"]) && !preg_match($regex_wr, $formulario["wr"]))
      Header("Location: estadisticas_csgo_form.php");

    if (!empty($formulario["kda"]) && !preg_match($regex_wr, $formulario["kda"]))
      Header("Location: estadisticas_csgo_form.php");
    
    if ($formulario['fecha'] == '') $fechadate = null;
    else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");
    if ($formulario['horas'] == '') $formulario['horas'] = null;
    if ($formulario['wr'] == '') $formulario['wr'] = null;
    if ($formulario['kda'] == '') $formulario['kda'] = null;

    require_once("../bd/gestionBD.php");
    require_once("../bd/estadisticas_BD.php");
    $conexion = crearConexionBD();
    $fechadate = date('d/m/Y', strtotime($formulario["fecha"]));
    $bdid = $_SESSION["bdid"];
    $dni = $_SESSION["dni"];
    if ($bdid == "insert")
      insertarEstadisticasCSGO($conexion, $dni, $fechadate, $formulario["horas"], $formulario["wr"], $formulario["kda"]);
    else
      actualizarEstadisticasCSGO($conexion, $bdid, $dni, $fechadate, $formulario["horas"], $formulario["wr"], $formulario["kda"]);
    cerrarConexionBD($conexion);
    //Header("Location: .php"); TODO: vista empleado
  }
  else Header("Location: estadisticas_csgo_form.php");
?>