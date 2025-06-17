<?php
require 'conectar.php'; // Asegúrate que aquí $pdo es la conexión PDO a PostgreSQL

// Nombre del archivo CSV que se descargará
$filename = "historial_precios_stock_" . date('Ymd') . ".csv";

// Headers para indicar que es un archivo descargable CSV
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename=' . $filename);

// Abrir "salida" estándar para escribir el CSV
$output = fopen('php://output', 'w');

// Escribir la cabecera del CSV
fputcsv($output, array('ID', 'Producto ID', 'Fecha Cambio', 'Precio Anterior', 'Precio Nuevo', 'Stock Anterior', 'Stock Nuevo', 'ID Categoria', 'ID Marca'));

try {
    // Consulta para obtener los datos
    $stmt = $pdo->query("SELECT * FROM historial_precios_stock ORDER BY fecha_cambio DESC");

    // Escribir cada fila en el CSV
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        fputcsv($output, $row);
    }
} catch (PDOException $e) {
    // En caso de error, mostrar mensaje
    echo "Error al obtener datos: " . $e->getMessage();
    exit;
}

fclose($output);
exit;
?>


