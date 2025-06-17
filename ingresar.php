<?php
require 'conectar.php';  // Asegúrate de que este archivo tiene tu conexión a PostgreSQL

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recoger datos del formulario
    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    $stock = $_POST['stock'];
    $id_categoria = $_POST['id_categoria'];
    $id_marca = $_POST['id_marca'];

    try {
        // Preparar la consulta SQL
        $sql = "INSERT INTO producto (nombre, precio, stock, id_categoria, id_marca)
                VALUES (:nombre, :precio, :stock, :id_categoria, :id_marca)";

        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':nombre' => $nombre,
            ':precio' => $precio,
            ':stock' => $stock,
            ':id_categoria' => $id_categoria,
            ':id_marca' => $id_marca
        ]);

        echo "Producto guardado exitosamente. <a href='index.php'>Volver</a>";
    } catch (PDOException $e) {
        echo "Error al insertar el producto: " . $e->getMessage();
    }
} else {
    echo "Acceso no permitido.";
}
?>
