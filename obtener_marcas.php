<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require 'conectar.php';  // esto crea $pdo

try {
    // Cambié $conn por $pdo
    $stmt = $pdo->query("SELECT id_marca, nombre FROM marca");
    $marcas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode($marcas);

} catch (PDOException $e) {
    echo json_encode(['error' => 'Error al obtener marcas: ' . $e->getMessage()]);
}
?>
