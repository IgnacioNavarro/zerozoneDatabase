<!DOCTYPE HTML>  
<html>
<body>  
<?php
  session_start();
  if (isset($_SESSION["inicio"]) ){
    $inicio["usuario"]=$_REQUEST["usuario"];
    $inicio["password"]=$_REQUEST["password"];
    $_SESSION["inicio"]=$inicio;
    $name = "admin";
    $pass = "admin";
    if ($inicio["usuario"] != $name || $inicio["password"] != $pass) {
      $error = "El usuario o la contraseña son incorrectos";
      $_SESSION["error"] = $error;
      Header("Location: InicioSesion.php");
    }
    else {
      $error = "";
      $_SESSION["error"] = $error;
      $_SESSION["log"] = $inicio["usuario"];
      Header("Location: index.php");
    }
  }
  else Header("Location: InicioSesion.php");
?>