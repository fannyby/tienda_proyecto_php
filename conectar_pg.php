<?php
// Conexión con PDO a PostgreSQL
$host = 'localhost';
$db   = 'Tienda_Inventario'; // Asegúrate de que el nombre está en minúsculas si así está en tu base
$user = 'postgres';
$pass = ''; // Agrega tu contraseña si tiene

try {
    $pdo = new PDO("pgsql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Conexión exitosa a PostgreSQL.";
} catch (PDOException $e) {
    die("Error al conectar a la base de datos: " . $e->getMessage());
}
?>
