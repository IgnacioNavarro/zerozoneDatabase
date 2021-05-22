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
    $dni = $_SESSION["dni"];
    $nombre = $_SESSION["nombre"];
    $clasificacionGlobal = $_SESSION["clasificacionGlobal"];
    $clasificacionNacional = $_SESSION["clasificacionNacional"];
    insertarEquipo($conexion,$dni, $nombre, $clasificacionGlobal, $clasificacionNacional);
    cerrarConexionBD($conexion);

  ?>
</body>