<?php
function borrarEntrena($conexion, $oid) {
	$sql = "DELETE FROM ENTRENA WHERE OID_ENT =:id";
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

function insertarEntrena($conexion, $dni, $oid_eq) {
	$sql = "INSERT INTO ENTRENA(dni, OID_EQ) VALUES (:dni, :oid_eq)";
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