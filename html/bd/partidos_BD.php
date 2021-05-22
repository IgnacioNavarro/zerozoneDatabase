<?php

function listadoBrawlStars($conexion){
	try{
		$sql = "SELECT * from partidos where videojuego = 'Brawl Stars'";
		$stmt = $conexion->query($sql);
		$partidos = $stmt->fetchAll();
		$i = 0;
		foreach ($partidos as $partido) {
			$result[$i][0] = $partido;
			$sql = "SELECT equipos.oid_eq, equipos.nombre, equiposrivales.oid_er, equiposrivales.nombre from partidos left join juega on partidos.oid_pt = juega.oid_pt left join equipos on juega.oid_eq = equipos.oid_eq left join seenfrentaen on seenfrentaen.oid_pt = partidos.oid_pt left join equiposrivales on seenfrentaen.oid_er = equiposrivales.oid_er where videojuego = 'Brawl Stars'";
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$i++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoClashRoyale($conexion){
	try{
		$sql = "SELECT * from partidos where videojuego = 'Clash Royale'";
		$stmt = $conexion->query($sql);
		$partidos = $stmt->fetchAll();
		$i = 0;
		foreach ($partidos as $partido) {
			$result[$i][0] = $partido;
			$sql = "SELECT equipos.oid_eq, equipos.nombre, equiposrivales.oid_er, equiposrivales.nombre from partidos left join juega on partidos.oid_pt = juega.oid_pt left join equipos on juega.oid_eq = equipos.oid_eq left join seenfrentaen on seenfrentaen.oid_pt = partidos.oid_pt left join equiposrivales on seenfrentaen.oid_er = equiposrivales.oid_er where videojuego = 'Clash Royale'";
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$i++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoFIFA($conexion){
	try{
		$sql = "SELECT * from partidos where videojuego = 'Fifa'";
		$stmt = $conexion->query($sql);
		$partidos = $stmt->fetchAll();
		$i = 0;
		foreach ($partidos as $partido) {
			$result[$i][0] = $partido;
			$sql = "SELECT equipos.oid_eq, equipos.nombre, equiposrivales.oid_er, equiposrivales.nombre from partidos left join juega on partidos.oid_pt = juega.oid_pt left join equipos on juega.oid_eq = equipos.oid_eq left join seenfrentaen on seenfrentaen.oid_pt = partidos.oid_pt left join equiposrivales on seenfrentaen.oid_er = equiposrivales.oid_er where videojuego = 'Fifa'";
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$i++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoCSGO($conexion){
	try{
		$sql = "SELECT * from partidos where videojuego = 'CSGO'";
		$stmt = $conexion->query($sql);
		$partidos = $stmt->fetchAll();
		$i = 0;
		foreach ($partidos as $partido) {
			$result[$i][0] = $partido;
			$sql = "SELECT equipos.oid_eq, equipos.nombre, equiposrivales.oid_er, equiposrivales.nombre from partidos left join juega on partidos.oid_pt = juega.oid_pt left join equipos on juega.oid_eq = equipos.oid_eq left join seenfrentaen on seenfrentaen.oid_pt = partidos.oid_pt left join equiposrivales on seenfrentaen.oid_er = equiposrivales.oid_er where videojuego = 'CSGO'";
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$i++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoLOL($conexion){
	try{
		$sql = "SELECT * from partidos where videojuego = 'LOL'";
		$stmt = $conexion->query($sql);
		$partidos = $stmt->fetchAll();
		$i = 0;
		foreach ($partidos as $partido) {
			$result[$i][0] = $partido;
			$sql = "SELECT equipos.oid_eq, equipos.nombre, equiposrivales.oid_er, equiposrivales.nombre from partidos left join juega on partidos.oid_pt = juega.oid_pt left join equipos on juega.oid_eq = equipos.oid_eq left join seenfrentaen on seenfrentaen.oid_pt = partidos.oid_pt left join equiposrivales on seenfrentaen.oid_er = equiposrivales.oid_er where videojuego = 'LOL'";
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$i++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function listadoFortnite($conexion){
	try{
		$sql = "SELECT * from partidos where videojuego = 'Fortnite'";
		$stmt = $conexion->query($sql);
		$partidos = $stmt->fetchAll();
		$i = 0;
		foreach ($partidos as $partido) {
			$result[$i][0] = $partido;
			$sql = "SELECT equipos.oid_eq, equipos.nombre, equiposrivales.oid_er, equiposrivales.nombre from partidos left join juega on partidos.oid_pt = juega.oid_pt left join equipos on juega.oid_eq = equipos.oid_eq left join seenfrentaen on seenfrentaen.oid_pt = partidos.oid_pt left join equiposrivales on seenfrentaen.oid_er = equiposrivales.oid_er where videojuego = 'Fortnite'";
			$stmt = $conexion->query($sql);
			$result[$i][1] = $stmt->fetchAll();
			$i++;
		}
		return $result;
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
}

function borrarPartido($conexion, $oid) {
	$sql = "DELETE FROM PARTIDOS WHERE OID_PT =:id";
	$stmt = $conexion->prepare($sql);
	try {
		$stmt->bindParam(':id', $oid);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarPartidoCSGO($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $mapa, $puntuacion, $compras) {
    
	$sql = "INSERT INTO PARTIDOSCSGO(OID_PT, mapa, puntuacion, comprasPorRonda)
    VALUES (:oid_pt, :mapa, :puntuacion, :compras)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "CSGO", $fecha, $jugadores, $liga);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
        $stmt->bindParam(':mapa',$mapa);
        $stmt->bindParam(':puntuacion',$puntuacion);
        $stmt->bindParam(':compras',$compras);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarPartidoFortnite($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $bajas, $tipoFortnite, $posicion, $puntos) {
	$sql = "INSERT INTO PARTIDOSFORTNITE(OID_PT, bajas, tipo, posicion, puntos)
    VALUES (:oid_pt, :bajas, :tipo, :posicion, :puntos)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "Fortnite", $fecha, $jugadores, $liga);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
        $stmt->bindParam(':bajas',$bajas);
        $stmt->bindParam(':tipo',$tipoFortnite);
		$stmt->bindParam(':posicion',$posicion);
		$stmt->bindParam(':puntos',$puntos);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarPartidoBrawl($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $mapa, $modo, $brawlers, $puntuacion) {
    
	$sql = "INSERT INTO PARTIDOSBRAWL(OID_PT, mapa, modo, brawlers, puntuacion)
    VALUES (:oid_pt, :mapa, :modo, :brawlers, :puntuacion)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "Brawl Stars", $fecha, $jugadores, $liga);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
		$stmt->bindParam(':mapa',$mapa);
		$stmt->bindParam(':modo',$modo);
		$stmt->bindParam(':brawlers',$brawlers);
        $stmt->bindParam(':puntuacion',$puntuacion);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarPartidoLoL($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $kda, $campeones, $baneos, $objetivos, $builds) {
    
	$sql = "INSERT INTO PARTIDOSLOL(OID_PT, kda, campeones, baneos, objetivos, builds)
    VALUES (:oid_pt, :kda, :campeones, :baneos, :objetivos, :builds)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "LOL", $fecha, $jugadores, $liga);
		$oid = $conexion->lastInsertId();
		$stmt->bindParam(':oid_pt',$oid);
		$stmt->bindParam(':kda',$kda);
		$stmt->bindParam(':campeones',$campeones);
		$stmt->bindParam(':campeones',$campeones);
		$stmt->bindParam(':baneos',$baneos);
		$stmt->bindParam(':objetivos',$objetivos);
        $stmt->bindParam(':builds',$builds);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarPartidoClash($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $puntuacion, $baneos, $mazos, $modo) {
    
	$sql = "INSERT INTO PARTIDOSCLASHROYALE(OID_PT, puntuacion, baneos, mazos, modo)
    VALUES (:oid_pt, :puntuacion, :baneos, :mazos, :modo)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "Clash Royale", $fecha, $jugadores, $liga);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
		$stmt->bindParam(':puntuacion',$puntuacion);
		$stmt->bindParam(':baneos',$baneos);
		$stmt->bindParam(':mazos',$mazos);
        $stmt->bindParam(':modo',$modo);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

function insertarPartidoFifa($conexion, $resultado, $tipo, $fecha, $jugadores, $liga, $equipos, $goles) {
    
	$sql = "INSERT INTO PARTIDOSFIFA(OID_PT, equiposFutbol, goles)
    VALUES (:oid_pt, :equipos, :goles)";
	$stmt = $conexion->prepare($sql);
	try {
        insertarPartido($conexion, $resultado, $tipo, "Fifa", $fecha, $jugadores, $liga);
        $oid = $conexion->lastInsertId();
        $stmt->bindParam(':oid_pt',$oid);
		$stmt->bindParam(':equipos',$equipos);
		$stmt->bindParam(':goles',$goles);
		$stmt->execute();
	}
	catch (PDOException $e) {
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: ../error.php");
	}
	
}

//Solo debe ser llamada por otra funcion de insertar partido
function insertarPartido($conexion, $resultado, $tipo, $videojuego, $fecha, $jugadores, $liga) {
	$sql = "INSERT INTO PARTIDOS(resultado, tipoPartido, videojuego, fecha, jugadoresSeleccionados, OID_LG)
        VALUES (:resultado, :tipo, :videojuego, :fecha, :jugadores, :liga)";
	$stmt = $conexion->prepare($sql);
    $stmt->bindParam(':resultado',$resultado);
    $stmt->bindParam(':tipo',$tipo);
    $stmt->bindParam(':videojuego',$videojuego);
    $stmt->bindParam(':fecha',$fecha);
    $stmt->bindParam(':jugadores',$jugadores);
    $stmt->bindParam(':liga',$liga);
    $stmt->execute();
}



?>