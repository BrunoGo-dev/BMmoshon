<?php
header("Content-Type: application/json");

// Incluir la conexión
require_once __DIR__ . "/../config/Conexion.php";

$conexion = new Conexion();
$cn = $conexion->getConexion();

// Verificar que la petición sea POST
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode([
        "success" => false,
        "message" => "Método no permitido (solo POST)"
    ]);
    exit;
}

// Sanitizar y obtener datos
$nombre      = trim($_POST["nombre"] ?? "");
$apellido    = trim($_POST["apellido"] ?? "");
$correo      = trim($_POST["correo"] ?? "");
$telefono    = trim($_POST["telefono"] ?? "");
$direccion   = trim($_POST["direccion"] ?? "");
$nacimiento  = trim($_POST["fecha_nacimiento"] ?? "");
$genero      = trim($_POST["genero"] ?? "");
$contrasena  = trim($_POST["contraseña"] ?? "");

// Validación básica
if ($nombre === "" || $apellido === "" || $correo === "" || $contrasena === "") {
    echo json_encode([
        "success" => false,
        "message" => "Faltan datos obligatorios."
    ]);
    exit;
}

// Verificar si el correo ya está registrado
$sqlCheck = "SELECT id FROM usuarios WHERE correo = ?";
$stmt = $cn->prepare($sqlCheck);
$stmt->bind_param("s", $correo);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    echo json_encode([
        "success" => false,
        "message" => "El correo ya está registrado."
    ]);
    exit;
}

// Hashear contraseña
$hash = password_hash($contrasena, PASSWORD_BCRYPT);

// Insertar usuario
$sql = "INSERT INTO usuarios (nombre, apellido, correo, telefono, direccion, fecha_nacimiento, genero, contraseña)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $cn->prepare($sql);

$stmt->bind_param(
    "ssssssss",
    $nombre,
    $apellido,
    $correo,
    $telefono,
    $direccion,
    $nacimiento,
    $genero,
    $hash
);

if ($stmt->execute()) {
    echo json_encode([
        "success" => true,
        "message" => "Usuario registrado correctamente",
        "redirect" => "/public/views/login.php"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Error al registrar usuario: " . $stmt->error
    ]);
}

$stmt->close();
$cn->close();
