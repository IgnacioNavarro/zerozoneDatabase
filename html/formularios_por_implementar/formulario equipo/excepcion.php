<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>Fallo</title>
</head>

<body>
	<h1>Ha ocurrido un fallo</h1>
  <p><?php
    session_start();
    echo $_SESSION['excepcion'];  
  ?></p>
</body>