<?php
include("../models/conexion/cls_conectar.php");
$obj = new conexion();
session_start();


if (isset($_POST['correo']) && isset($_POST['contraseña']) && isset($_POST['btnIniciarSesion'])) {
    $correo = mysqli_real_escape_string($obj->getConexion(), $_POST['correo']);
    $contraseña = mysqli_real_escape_string($obj->getConexion(), $_POST['contraseña']);

    $queryUser = mysqli_query($obj->getConexion(), "SELECT * FROM usuario WHERE correo = '$correo'");
    $nr = mysqli_num_rows($queryUser);

    if ($nr >= 1) {
        $buscarpass = mysqli_fetch_array($queryUser);
        if (password_verify($contraseña, $buscarpass['contraseña'])) {
            $_SESSION['correo'] = $correo;
            header("location:../../public/views/Principal.php");

            exit();
            
        } else {
            echo "<script>alert('Contraseña incorrecta');</script>";
            header("location:../../public/views/IniciarSesion.php");
        }
    } else {
        echo "<script>alert('Correo no encontrado');</script>";
        header("location:../../public/views/IniciarSesion.php");
        exit();

    }
}
?>