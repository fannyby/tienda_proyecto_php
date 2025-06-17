<?php
require 'conectar.php';

try {
    $stmt = $pdo->query("SELECT p.nombre, c.nombre AS categoria, m.nombre AS marca, p.precio, p.stock
                         FROM producto p
                         JOIN categoria c ON p.id_categoria = c.id_categoria
                         JOIN marca m ON p.id_marca = m.id_marca");

    $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    header('Content-Type: application/json');
    echo json_encode($productos);
} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
