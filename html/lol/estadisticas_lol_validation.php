<?php
  session_start();
  if(!isset($_SESSION["log"]))
			Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    $formulario["fecha"]=$_REQUEST["fecha"];
    $formulario["horas"]=$_REQUEST["horas"];
    $formulario["wrcampeon"]=$_REQUEST["wrcampeon"];
    $formulario["kdacampeon"]=$_REQUEST["kdacampeon"];
    $_SESSION["formulario"]=$formulario;
    require_once("../validaciones.php");
    $regex_wr = REGEXJS_WR;
	  $regex_int = REGEXJS_INT;
    if (testFecha($formulario["fecha"]))
      Header("Location: estadisticas_clash_form.php");

    if (!empty($formulario["horas"]) && !preg_match($regex_int, $formulario["horas"]))
      Header("Location: estadisticas_clash_form.php");

    if (!empty($formulario["wrcampeon"]) && !preg_match($regex_wr, $formulario["wrcampeon"]))
      Header("Location: estadisticas_clash_form.php");

    if (!empty($formulario["kdacampeon"]) && !preg_match($regex_wr, $formulario["kdacampeon"]))
      Header("Location: estadisticas_clash_form.php");
    
    if ($formulario['fecha'] == '') $fechadate = null;
    else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");
    if ($formulario['horas'] == '') $formulario['horas'] = null;
    if ($formulario['wrcampeon'] == '') $formulario['wrcampeon'] = null;
    if ($formulario['kdacampeon'] == '') $formulario['kdacampeon'] = null;

      require_once("../bd/gestionBD.php");
      require_once("../bd/estadisticas_BD.php");
      $conexion = crearConexionBD();
      $fechadate = date('d/m/Y', strtotime($formulario["fecha"]));
      $bdid = $_SESSION["bdid"];
      $dni = $_SESSION["dni"];
      if ($bdid == "insert")
        insertarEstadisticasLol($conexion, $dni, $fechadate, $formulario["horas"],
        $formulario["wrcampeon"], $formulario["kdacampeon"]);
      else
        actualizarEstadisticasLol($conexion, $bdid, $dni, $fechadate, $formulario["horas"],
        $formulario["wrcampeon"], $formulario["kdacampeon"]);
      cerrarConexionBD($conexion);
    //Header("Location: .php"); TODO: vista empleado
  }
  else Header("Location: estadisticas_lol_form.php");
?>