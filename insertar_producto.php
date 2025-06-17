<?php
require 'conectar.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    $stock = $_POST['stock'];
    $categoria = $_POST['categoria'];
    $marca = $_POST['marca'];

    // Obtener ID de categoría y marca
    $cat = $pdo->prepare("SELECT id_categoria FROM categoria WHERE nombre = ?");
    $cat->execute([$categoria]);
    $id_categoria = $cat->fetchColumn();

    $mar = $pdo->prepare("SELECT id_marca FROM marca WHERE nombre = ?");
    $mar->execute([$marca]);
    $id_marca = $mar->fetchColumn();

    // Insertar producto
    $stmt = $pdo->prepare("INSERT INTO producto (nombre, precio, stock, id_categoria, id_marca) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$nombre, $precio, $stock, $id_categoria, $id_marca]);

    echo "Producto insertado correctamente.";
}
?>
