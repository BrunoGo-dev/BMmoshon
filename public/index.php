<?php

$request = $_SERVER['REQUEST_URI'];

// ======= RUTAS API =========
if ($request === '/newUsuario') {
    require_once __DIR__ . '/../app/controllers/newUsuario.php';
    exit;
}

// ======= RUTA NORMAL (PÁGINA PRINCIPAL) =========
header("Location: /views/Principal.php");
exit;
