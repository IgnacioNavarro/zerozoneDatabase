<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>Formulario correcto</title>
</head>

<body>
	<h1>Los datos del formulario son correctos y se tienen que enviar a la base de datos</h1>
  <?php
    
    session_start();
    require_once("gestionBD.php");
    $conexion = crearConexionBD();
    $nombre = $_SESSION["nombre"];
    $posicion = $_SESSION["posicion"];
    $importePremio = $_SESSION["importePremio"];
    $fechastr = $_SESSION["fechaCobroPremio"];
    $fechaCobroPremio = date('d/m/Y', strtotime($fechastr));
    insertarLiga($conexion, $nombre, $posicion, $importePremio ,$fechaCobroPremio);
    cerrarConexionBD($conexion);
 

  ?>
</body>