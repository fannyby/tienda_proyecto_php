<?php
// quitar en producción
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// CONFIGURACION DE VARIABLES
$SGBD = 'mysql'; // Sistema de gestión de base de datos mysql pg 
$LANG = 'es'; // Idioma de la aplicación es en español

if ($SGBD == 'mysql') {
    // Configuración para MySQL
    // Cambia estos valores según tu configuración de MySQL
$host = 'localhost';
$port = '3306';
$dbname = 'tienda_inventario';
$user = 'root';
$password = 'clave';

try {
        $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "Conexión exitosa a MySQL.";
    } catch (PDOException $e) {
        echo "Error al conectar a MySQL: " . $e->getMessage();
    }
} elseif ($SGBD === 'pg') {
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
} else {
    die("SGBD no soportado. Por favor, usa 'mysql' o 'pg'.");
}
?>









