<?php
// Iniciar sesión solo si no hay una activa
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

include_once(__DIR__ . "/../models/conexion/cls_conectar.php");

$obj = new conexion();
$conexion = $obj->getConexion();

$opciones = [];

// Obtener rol del usuario si está logueado
if (isset($_SESSION['correo'])) {
    $correo = $_SESSION['correo'];
    $queryrol = mysqli_query($conexion, "SELECT rol FROM usuario WHERE correo = '$correo'");
    if ($queryrol && mysqli_num_rows($queryrol) > 0) {
        $rolData = mysqli_fetch_assoc($queryrol);
        $rol = $rolData['rol'];
        $result = mysqli_query($conexion, "SELECT * FROM rol WHERE rol = '$rol'");
        while ($row = mysqli_fetch_assoc($result)) {
            $opciones[] = [
                'enlace' => htmlspecialchars($row['enlace']),
                'nombre' => htmlspecialchars($row['nombre'])
            ];
        }
    }
} else {
    // Rol 0 para visitantes no autenticados
    $result = mysqli_query($conexion, "SELECT * FROM rol WHERE rol = '0'");
    while ($row = mysqli_fetch_assoc($result)) {
        $opciones[] = [
            'enlace' => htmlspecialchars($row['enlace']),
            'nombre' => htmlspecialchars($row['nombre'])
        ];
    }
}

mysqli_close($conexion);

// Imprimir directamente el menú
foreach ($opciones as $op) {
    echo '<li><a href="' . $op['enlace'] . '">' . $op['nombre'] . '</a></li>';
}
?>
