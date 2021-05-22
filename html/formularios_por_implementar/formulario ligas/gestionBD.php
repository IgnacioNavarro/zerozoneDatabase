<?php

function consultarEquipo($conexion) {
	$sql = "SELECT * FROM LIGAS";
	$stmt = $conexion->query($sql);
	try {
		return $stmt->fetchAll();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: excepcion.php");
	}
}
function insertarLiga($conexion, $dni, $nombre, $clasificacionGlobal,$clasificacionNacional) {
	$sql = "INSERT INTO LIGAS(nombre, posicion,importePremio,fechaCobroPremio ) VALUES (:nombre, :posicion, :importePremio, :fechaCobroPremio)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':nombre',$nombre);
		$stmt->bindParam(':posicion',$posicion);
		$stmt->bindParam(':importePremio',$importePremio);
		$stmt->bindParam(':fechaCobroPremio',$fechaCobroPremio);
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
