<?php
  session_start();
  if(!isset($_SESSION["log"]))
		Header("Location: inicioSesion.php");
  if (isset($_SESSION["formulario"]) ){
    require_once("validaciones.php");
    $regex_nombre = REGEX_nombre;
    $formulario["nombre"]=$_REQUEST["nombre"];
    $formulario["posicion"]=$_REQUEST["posicion"];
    $formulario["importePremio"]=$_REQUEST["importePremio"];
    $formulario["fechaCobroPremio"]=$_REQUEST["fechaCobroPremio"];
    $_SESSION["formulario"]=$formulario;

    if ($formulario['nombre'] == '') $formulario['nombre'] = null;
    if($formulario["nombre"]== NULL || !preg_match($regex_nombre,$formulario["nombre"]))
    Header("Location: ligas_form.php");
    if ($formulario['fechaCobroPremio'] == '') $fechadate = null;
    else $fechadate = DateTime::createFromFormat('Y-m-d', $formulario['fechaCobroPremio'])->format("d-m-Y");

    require_once("bd/gestionBD.php");
    require_once("bd/ligas_BD.php");
    $conexion = crearConexionBD();
    $bdid = $_SESSION["bdid"];
  if ($bdid == "insert"){

    insertarLiga($conexion, $formulario["nombre"], $formulario["posicion"], $formulario["importePremio"], $fechadate);
  }else{
    actualizarLiga($conexion, $bdid, $formulario["nombre"], $formulario["posicion"], $formulario["importePremio"], $fechadate);
  }
    cerrarConexionBD($conexion);
    Header("Location: brawlstars/LigasBS.php"); 

}
else Header("Location: ligas_form.php");
?>