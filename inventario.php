<?php
require 'conectar.php'; // Conexión a PostgreSQL
?>

<!DOCTYPE html>
<html>
<head>
    <title>Inventario de Productos</title>
</head>
<body>
    <h1>Inventario</h1>
    <a href="index.php">← Volver al formulario</a>
    <br><br>

    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Categoría</th>
                <th>Marca</th>
            </tr>
        </thead>
        <tbody>
        <?php
        try {
            $stmt = $pdo->query("SELECT p.nombre, p.precio, p.stock, c.nombre AS categoria, m.nombre AS marca
                                 FROM producto p
                                 JOIN categoria c ON p.id_categoria = c.id_categoria
                                 JOIN marca m ON p.id_marca = m.id_marca
                                 ORDER BY p.nombre");

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>
                        <td>{$row['nombre']}</td>
                        <td>{$row['precio']}</td>
                        <td>{$row['stock']}</td>
                        <td>{$row['categoria']}</td>
                        <td>{$row['marca']}</td>
                      </tr>";
            }
        } catch (PDOException $e) {
            echo "<tr><td colspan='5'>Error al obtener datos: " . $e->getMessage() . "</td></tr>";
        }
        ?>
        </tbody>
    </table>
</body>
</html>

