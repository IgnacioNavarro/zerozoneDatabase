<?php
  session_start();
  if(!isset($_SESSION["log"]))
			Header("Location: ../inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once("../validaciones.php");
    $regex_nombre = REGEXJS_NOMBRE;
    $regex_dni = REGEXJS_DNI;
    $formulario["dni"] = $_REQUEST["dni"];
	$formulario["nombre"] = $_REQUEST["nombre"];
	$formulario["clasificacionGlobal"] = $_REQUEST["clasificacionGlobal"];
    $formulario["clasificacionNacional"] = $_REQUEST["clasificacionNacional"];
    $formulario["manager"] = $_REQUEST["manager"];
    $_SESSION["formulario"]=$formulario;

    if (empty($formulario["nombre"]) || !preg_match($regex_nombre ,$formulario["nombre"]) || !preg_match($regex_dni ,$formulario["dni"]));
    Header("Location: equipo_form.php");
    require_once("../bd/gestionBD.php");
    require_once("../bd/equipos_BD.php");
    $conexion = crearConexionBD();
    $bdid = $_SESSION["bdid"];
    if ($bdid == "insert")
    insertarEquipo($conexion, $formulario["dni"], $formulario["nombre"], $formulario["clasificacionGlobal"], $formulario["clasificacionNacional"], $formulario["manager"]);
    else {
      actualizarEquipo($conexion, $bdid, $formulario["dni"], $formulario["nombre"], $formulario["clasificacionGlobal"], $formulario["clasificacionNacional"], $formulario["manager"]);
    }
      cerrarConexionBD($conexion);
    Header("Location: social.php");
  }
  else Header("Location: equipo_form.php");
?>   