<?php
require 'conectar.php'; // Asegúrate de que este archivo define $pdo correctamente con PDO y PostgreSQL
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Categorías</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #999;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #eee;
        }
    </style>
</head>
<body>
    <h1>Categorías registradas</h1>
    <a href="index.php">← Volver al formulario</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre de la categoría</th>
            </tr>
        </thead>
        <tbody>
            <?php
            try {
                $stmt = $pdo->query("SELECT id_categoria, nombre FROM categoria ORDER BY id_categoria");

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    echo "<tr>
                            <td>{$row['id_categoria']}</td>
                            <td>{$row['nombre']}</td>
                          </tr>";
                }
            } catch (PDOException $e) {
                echo "<tr><td colspan='2'>Error: " . $e->getMessage() . "</td></tr>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>
