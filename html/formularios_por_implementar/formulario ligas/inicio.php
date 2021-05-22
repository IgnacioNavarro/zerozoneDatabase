<?php
    session_start();
    $_SESSION["log"] = "admin";
    Header("Location: ligas_form.php");
?>