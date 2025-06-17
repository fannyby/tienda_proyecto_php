<?php
require 'conectar.php';  // incluimos la conexión

try {
    $stmt = $pdo->query("SELECT p.id_producto, p.nombre, c.nombre as categoria, m.nombre as marca, p.precio, p.stock
                         FROM producto p
                         JOIN categoria c ON p.id_categoria = c.id_categoria
                         JOIN marca m ON p.id_marca = m.id_marca
                         ORDER BY p.nombre");

    $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode($productos);

} catch (PDOException $e) {
    echo "Error en la consulta: " . $e->getMessage();
}
?>
