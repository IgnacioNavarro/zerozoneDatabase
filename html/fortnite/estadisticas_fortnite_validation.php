<!DOCTYPE HTML>  
<html>
<body>  
<?php
  session_start();
  if(!isset($_SESSION["log"]))
			Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once("../validaciones.php");
    $regex_wr = REGEXJS_WR;
	  $regex_int = REGEXJS_INT;
    $formulario["fecha"]=$_REQUEST["fecha"];
    $formulario["horas"]=$_REQUEST["horas"];
    $formulario["streaming"]=$_REQUEST["streaming"];
    $formulario["kda"]=$_REQUEST["kda"];
    $_SESSION["formulario"]=$formulario;

    if (!empty($formulario["fecha"]) && false) //TODO: validar fecha
      Header("Location: estadisticas_fortnite_form.php");

    if (!empty($formulario["horas"]) && !preg_match($regex_int, $formulario["horas"]))
      Header("Location: estadisticas_fortnite_form.php");

    if (!empty($formulario["streaming"]) && !preg_match($regex_int, $formulario["streaming"]))
      Header("Location: estadisticas_fortnite_form.php");

    if (!empty($formulario["kda"]) && !preg_match($regex_wr, $formulario["kda"]))
      Header("Location: estadisticas_fortnite_form.php");
      
    if ($formulario['fecha'] == '') $fechadate = null;
    else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");
    if ($formulario['horas'] == '') $formulario['horas'] = null;
    if ($formulario['streaming'] == '') $formulario['streaming'] = null;
    if ($formulario['kda'] == '') $formulario['kda'] = null;

    require_once("../bd/gestionBD.php");
    require_once("../bd/estadisticas_BD.php");
    $conexion = crearConexionBD();
    $fechadate = date('d/m/Y', strtotime($formulario["fecha"]));
    $bdid = $_SESSION["bdid"];
    $dni = $_SESSION["dni"];
    if ($bdid == "insert")
      insertarEstadisticasFortnite($conexion, $dni, $fechadate, $formulario["horas"],
      $formulario["streaming"], $formulario["kda"]);
    else
      actualizarEstadisticasFortnite($conexion, $bdid, $dni, $fechadate, $formulario["horas"],
      $formulario["streaming"], $formulario["kda"]);
    cerrarConexionBD($conexion);
    //Header("Location: .php"); TODO: vista empleado
  }
  else Header("Location: estadisticas_fortnite_form.php");
?>