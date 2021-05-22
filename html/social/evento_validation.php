<?php
  session_start();
  if(!isset($_SESSION["log"]))
			Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once("../validaciones.php");
    $regex_nombre = REGEXJS_NOMBRE;
    $formulario["nombre"]=$_REQUEST["nombre"];
    $formulario["fecha"]=$_REQUEST["fecha"];
    $formulario["tipo"]=$_REQUEST["tipo"];
    $formulario["rival"]=$_REQUEST["rival"];
    $_SESSION["formulario"]=$formulario;
    $tipos = array("Partido previsto", "Jugada", "Presentacion", "Informativa");
    
    if (empty($formulario["nombre"]) || !preg_match($regex_nombre ,$formulario["nombre"]) ||
        empty($formulario["tipo"]) || !in_array($formulario["tipo"], $tipos))
      Header("Location: evento_form.php");
    if (!empty($formulario["fecha"]) && false) //TODO: validar fecha
      Header("Location: evento_form.php");
    if (!empty($formulario["rival"]) && false) //TODO: validar en la base de datos (array)
      Header("Location: evento_form.php");
    
    if ($formulario['tipo'] == '') $formulario['tipo'] = null;
    if ($formulario['fecha'] == '') $fechadate = null;
      else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");
    if ($formulario['rival'] == '') $formulario['rival'] = null;

    require_once("../bd/gestionBD.php");
    require_once("../bd/eventos_BD.php");
    $conexion = crearConexionBD();
    $bdid = $_SESSION["bdid"];
    if ($bdid == "insert")
      insertarEvento($conexion, $formulario["nombre"], $fechadate, $formulario["tipo"], $formulario["rival"]);
    else {
      actualizarEvento($conexion, $bdid, $formulario["nombre"], $fechadate, $formulario["tipo"], $formulario["rival"]);
    }
      cerrarConexionBD($conexion);
    Header("Location: social.php");
  }
  else Header("Location: evento_form.php");
?>