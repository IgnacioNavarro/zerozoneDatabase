<?php

function consultarEquipo($conexion) {
	$sql = "SELECT * FROM EQUIPOS";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: excepcion.php");
	}
}
function insertarEquipo($conexion, $dni, $nombre, $clasificacionGlobal,$clasificacionNacional) {
	$sql = "INSERT INTO EQUIPOS(dni, nombre, clasificacionGlobal,clasificacionNacional ) VALUES (:dni, :nombre, :clasificacionGlobal, :clasificacionNacional)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':dni',$dni);
		$stmt->bindParam(':nombre',$nombre);
		$stmt->bindParam(':clasificacionGlobal',$clasificacionGlobal);
		$stmt->bindParam(':clasificacionNacional',$clasificacionNacional);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: excepcion.php");
	}
  	
}
function crearConexionBD()
{
	$host="oci:dbname=localhost/XE;charset=UTF8";
	$usuario="ZEROZONE";
	$password="zero";

	try{
		$conexion=new PDO($host,$usuario,$password,array(PDO::ATTR_PERSISTENT => true));
    	$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $conexion;
	}catch(PDOException $e){
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: excepcion.php");
	}
}

function cerrarConexionBD($conexion){
	$conexion=null;
}

?>
