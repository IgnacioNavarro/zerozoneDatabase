<?php
$oid = $_POST["oid"];
$fichero = $_POST["fichero"];
$func = $_POST["func"];
$destino = $_POST["destino"];
require_once($fichero);
require_once("./bd/gestionBD.php");
$conexion = crearConexionBD();
$func($conexion, $oid);
cerrarConexionBD($conexion);
Header("Location: " . $destino);
?>