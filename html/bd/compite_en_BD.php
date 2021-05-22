<?php
function borrarCompiteEn($conexion, $oid) {
	$sql = "DELETE FROM COMPITEEN WHERE OID_CE =:id";
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

function insertarCompiteEn($conexion, $oid_eq, $oid_lg) {
	$sql = "INSERT INTO COMPITEEN(OID_EQ, OID_LG) VALUES (:oid_eq, :oid_lg)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':oid_eq',$oid_eq);
        $stmt->bindParam(':oid_lg',$oid_lg);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}
?>