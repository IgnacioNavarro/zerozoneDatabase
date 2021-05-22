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
    $formulario["wr"]=$_REQUEST["wr"];
    $formulario["partidasmazo"]=$_REQUEST["partidasmazo"];
    $formulario["wrmazo"]=$_REQUEST["wrmazo"];
    $formulario["hechizos"]=$_REQUEST["hechizos"];
    $_SESSION["formulario"]=$formulario;

    if (testFecha($formulario["fecha"]))
      Header("Location: estadisticas_clash_form.php");

    if (!empty($formulario["horas"]) && !preg_match($regex_int, $formulario["horas"]))
      Header("Location: estadisticas_clash_form.php");

    if (!empty($formulario["wr"]) && !preg_match($regex_wr, $formulario["wr"]))
      Header("Location: estadisticas_clash_form.php");

    if (!empty($formulario["partidasmazo"]) && !preg_match($regex_wr, $formulario["partidasmazo"]))
      Header("Location: estadisticas_clash_form.php");
    
    if (!empty($formulario["wrmazo"]) && !preg_match($regex_wr, $formulario["wrmazo"]))
      Header("Location: estadisticas_clash_form.php");

    if (!empty($formulario["hechizos"]) && !preg_match($regex_int, $formulario["hechizos"]))
      Header("Location: estadisticas_clash_form.php");

    if ($formulario['fecha'] == '') $fechadate = null;
    else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");
    if ($formulario['horas'] == '') $formulario['horas'] = null;
    if ($formulario['wr'] == '') $formulario['wr'] = null;
    if ($formulario['partidasmazo'] == '') $formulario['partidasmazo'] = null;
    if ($formulario['wrmazo'] == '') $formulario['wrmazo'] = null;
    if ($formulario['hechizos'] == '') $formulario['hechizos'] = null;

      require_once("../bd/gestionBD.php");
      require_once("../bd/estadisticas_BD.php");
      $conexion = crearConexionBD();
      $fechadate = date('d/m/Y', strtotime($formulario["fecha"]));
      $bdid = $_SESSION["bdid"];
      $dni = $_SESSION["dni"];
      if ($bdid == "insert")
        insertarEstadisticasClash($conexion, $dni, $fechadate, $formulario["horas"], $formulario["wr"],
        $formulario["partidasmazo"], $formulario["wrmazo"], $formulario["hechizos"]);
      else
        actualizarEstadisticasClash($conexion, $bdid, $dni, $fechadate, $formulario["horas"], $formulario["wr"],
        $formulario["partidasmazo"], $formulario["wrmazo"], $formulario["hechizos"]);
      cerrarConexionBD($conexion);
    //Header("Location: .php"); TODO: vista empleado
  }
  Header("Location: estadisticas_clash_form.php");
?>