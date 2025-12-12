<?php
header("Content-Type: application/json");
session_start();

// Conexión
require_once __DIR__ . "/../models/conexion/cls_conectar.php";
$obj = new Conexion();
$cn = $obj->getConexion();

// Solo POST
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(["success" => false, "message" => "Método no permitido (solo POST)"]);
    exit;
}

// Recibir JSON
$input = json_decode(file_get_contents("php://input"), true);

if (!$input) {
    echo json_encode(["success" => false, "message" => "No se recibió JSON"]);
    exit;
}

$correo = trim($input["correo"] ?? "");
$contraseña = trim($input["contraseña"] ?? "");

// Validación básica
if ($correo === "" || $contraseña === "") {
    echo json_encode(["success" => false, "message" => "Faltan datos obligatorios."]);
    exit;
}

// Buscar usuario
$sql = "SELECT * FROM usuario WHERE correo = ?";
$stmt = $cn->prepare($sql);
$stmt->bind_param("s", $correo);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode(["success" => false, "message" => "Correo no encontrado"]);
    exit;
}

$usuario = $result->fetch_assoc();

// Verificar contraseña
if (!password_verify($contraseña, $usuario['contraseña'])) {
    echo json_encode(["success" => false, "message" => "Contraseña incorrecta"]);
    exit;
}

// Inicio de sesión correcto
$_SESSION['correo'] = $correo;

echo json_encode([
    "success" => true,
    "redirect" => "/views/Principal.php"
]);

$stmt->close();
$cn->close();
