<?php
require 'conexion_pg.php'; // O 'conectar.php' si usas ese archivo con PDO
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Marcas</title>
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
    <h1>Marcas registradas</h1>
    <a href="index.php">← Volver al formulario</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre de la marca</th>
            </tr>
        </thead>
        <tbody>
            <?php
            try {
                $stmt = $pdo->query("SELECT id_marca, nombre FROM marca ORDER BY id_marca");

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    echo "<tr>
                            <td>{$row['id_marca']}</td>
                            <td>{$row['nombre']}</td>
                          </tr>";
                }
            } catch (PDOException $e) {
                echo "<tr><td colspan='2'>Error al obtener datos: " . $e->getMessage() . "</td></tr>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>
