<?php
function borrarAnaliza($conexion, $oid) {
	$sql = "DELETE FROM ANALIZA WHERE OID_ANZ =:id";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':id', $oid);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}

function insertarAnaliza($conexion, $dni, $oid_eq) {
	$sql = "INSERT INTO ANALIZA(dni, oid_eq) VALUES (:dni, :oid_eq)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':dni',$dni);
        $stmt->bindParam(':oid_eq',$oid_eq);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}
?>