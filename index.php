<?php
//include 'conectar.php';  1. Primero conectar a la base
include 'conectar.php'; 
echo "<h1>Bienvenido a mi tienda</h1>";
?>

<!DOCTYPE html>
<html>
<head>
    <title>Ingreso de Inventario</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <h1>Ingreso de producto</h1>
    <form action="ingresar.php" method="POST">
        Nombre: <input type="text" name="nombre" required><br>
        Precio: <input type="number" name="precio" step="0.01" required><br>
        Stock: <input type="number" name="stock" required><br>

        Categoría:
        <select name="id_categoria">
            <?php
            $stmt = $pdo->query("SELECT id_categoria, nombre FROM categoria");
            while ($row = $stmt->fetch()) {
                echo "<option value='{$row['id_categoria']}'>{$row['nombre']}</option>";
            }
            ?>
        </select><br>

        Marca:
        <select name="id_marca">
            <?php
            $stmt = $pdo->query("SELECT id_marca, nombre FROM marca");
            while ($row = $stmt->fetch()) {
                echo "<option value='{$row['id_marca']}'>{$row['nombre']}</option>";
            }
            ?>
        </select><br>

        <input type="submit" value="Guardar producto">
    </form>

    <br>
    <a href="inventario.php">Ver inventario</a>
</body>
</html>
