<?php
session_start();
$oid = $_POST["oid"];
$formulario = json_decode($_POST['formulario'], true);
$destino = $_POST["destino"];
$_SESSION["bdid"] = $oid;
$_SESSION["formulario"] = $formulario;
Header("Location: " . $destino);
?>