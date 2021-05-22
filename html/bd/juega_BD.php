<?php
function borrarJuega($conexion, $oid) {
	$sql = "DELETE FROM JUEGA WHERE OID_JG =:id";
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

function insertarJuega($conexion, $oid_eq, $oid_pt) {
	$sql = "INSERT INTO JUEGA(OID_EQ, OID_PT) VALUES (:oid_eq, :oid_pt)";
	$stmt = $conexion->prepare($sql);
	try {
        $stmt->bindParam(':oid_eq',$oid_eq);
        $stmt->bindParam(':oid_pt',$oid_pt);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../excepcion.php");
	}
	
}
?>