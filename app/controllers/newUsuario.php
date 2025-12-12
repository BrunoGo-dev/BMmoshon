<?php
header("Content-Type: application/json");
ob_start();

require_once __DIR__ . "/../models/conexion/cls_conectar.php";

$obj = new Conexion();
$cn = $obj->getConexion();

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(["success" => false, "message" => "Método no permitido (solo POST)"]);
    exit;
}

$input = json_decode(file_get_contents("php://input"), true);

if (!$input) {
    echo json_encode(["success" => false, "message" => "No se recibió JSON"]);
    exit;
}

$nombre      = trim($input["nombre"] ?? "");
$apellido    = trim($input["apellido"] ?? "");
$correo      = trim($input["correo"] ?? "");
$telefono    = trim($input["telefono"] ?? "");
$direccion   = trim($input["direccion"] ?? "");
$nacimiento  = trim($input["fecha_nacimiento"] ?? "");
$genero      = trim($input["genero"] ?? "");
$contrasena  = trim($input["contraseña"] ?? "");

if ($nombre === "" || $apellido === "" || $correo === "" || $contrasena === "") {
    echo json_encode(["success" => false, "message" => "Faltan datos obligatorios."]);
    exit;
}

$sqlCheck = "SELECT id FROM usuario WHERE correo = ?";
$stmt = $cn->prepare($sqlCheck);
$stmt->bind_param("s", $correo);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "El correo ya está registrado."]);
    exit;
}

$hash = password_hash($contrasena, PASSWORD_BCRYPT);

$sql = "INSERT INTO usuario (nombre, apellido, correo, telefono, direccion, fecha_nacimiento, genero, contraseña)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
$stmt = $cn->prepare($sql);
$stmt->bind_param("ssssssss", $nombre, $apellido, $correo, $telefono, $direccion, $nacimiento, $genero, $hash);

if ($stmt->execute()) {
    echo json_encode([
        "success" => true,
        "message" => "Usuario registrado correctamente",
        "redirect" => "/views/IniciarSesion.php"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Error al registrar usuario: " . $stmt->error
    ]);
}

$stmt->close();
$cn->close();
ob_end_flush();
