<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$host = 'localhost';
$port = '3306';
$dbname = 'tienda_inventario';
$user = 'root';
$password = 'skarleth2009';

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexión exitosa a MySQL.";
} catch (PDOException $e) {
    echo "Error al conectar a MySQL: " . $e->getMessage();
}
?>
