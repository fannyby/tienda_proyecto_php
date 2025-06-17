<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require 'conectar.php';

try {
    $stmt = $pdo->query("SELECT id_categoria, nombre FROM categoria");
    $categorias = $stmt->fetchAll(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode($categorias);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Error al obtener categorías: ' . $e->getMessage()]);
}





