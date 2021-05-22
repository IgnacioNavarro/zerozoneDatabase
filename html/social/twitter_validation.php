<?php
  session_start();
  if(!isset($_SESSION["log"]))
			Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once("../validaciones.php");
    $formulario["seguidores"] = $_REQUEST["seguidores"];
    $formulario["interacciones"] = $_REQUEST["interacciones"];
    $formulario["fecha"]=$_REQUEST["fecha"];
    $_SESSION["formulario"]=$formulario;
    
    if (empty($formulario["seguidores"]) ||
        empty($formulario["interacciones"]) || empty($formulario["fecha"]))
      Header("Location: evento_form.php");
    if (!empty($formulario["fecha"]) && false) //TODO: validar fecha
      Header("Location: evento_form.php");
    
    if ($formulario['fecha'] == '') $fechadate = null;
      else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fecha'])->format("d-m-Y");

    require_once("../bd/gestionBD.php");
    require_once("../bd/red_social_BD.php");
    $conexion = crearConexionBD();
    $bdid = $_SESSION["bdid"];
    if ($bdid == "insert")
      insertarRedSocial($conexion, "Twitter", $fechadate, $formulario["seguidores"], $formulario["interacciones"]);
    else {
        actualizarRedSocial($conexion, $bdid, "Twitter", $fechadate, $formulario["seguidores"], $formulario["interacciones"]);
    }
      cerrarConexionBD($conexion);
    Header("Location: consultaTwitter.php");
  }
  else Header("Location: twitter_form.php");
?>