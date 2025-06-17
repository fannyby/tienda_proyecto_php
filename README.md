# Tienda Inventario - README

Esta es una aplicación web para la gestión de inventario de componentes de ordenadores. Soporta bases de datos PostgreSQL y MySQL/MariaDB usando PHP con PDO.

## 🚀 Características

Gestión de productos: CPU, GPU, memoria, almacenamiento, etc.

Compatible con PostgreSQL y MySQL.

## 📂 Requisitos

PHP ≥ 8.0

PostgreSQL o MySQL/MariaDB

Navegador moderno

Se recomienda el servidor XAMPP o el servidor embebido de PHP (opcional)

## 📂 Detalles de la Estructura

conexion_pg.php: conexión PDO a PostgreSQL

conectar_mysql.php: conexión PDO a MySQL

index.php: ingreso y listado de productos

README.md: esta documentación

## 📗 Estructura del Proyecto

TIENDA_PROYECTO_PHP
│   categorias.php
│   conectar.php
│   conectar_mysql.php
│   conectar_pg.php
│   exportar_historial_csv.php
│   index.html
│   index.php
│   info.php
│   ingresar.php
│   insertar_producto.php
│   insert_datatienda_inventario.sql
│   inventario.php
│   inventario_schema_create_mysql.sql
│   marcas.php
│   obtener_categorias.php
│   obtener_marcas.php
│   obtener_productos.php
│   productos.php
│   README.md
│   script.js
│   tienda_inventario.sql
│
├───css
│       estilo.css
│
├───docs
│       Doc_Instalacion php.pdf
│       Doc_tienda_inv.pdf
│
└───img
        imagen.jpg


## 💡 Instalación

- 1. Instalar PostgreSQL y/o MySQL

PostgreSQL

https://www.postgresql.org/download/

Crear base de datos tienda_inventario

MySQL/MariaDB

https://dev.mysql.com/downloads/ o usar XAMPP

- 2. Crear base de datos tienda_inventario

- a. Crear la base de datos correspondiente:

Tienda_Inventario en PostgreSQL

tienda_inventario en MySQL

- b. Importar:

tienda_inventario.sql para PostgreSQL

inventario_schema_create_mysql.sql para MySQL

- c. Configurar conexiones en archivos PHP

conectar_mysql.php para MySQL

conexion_pg.php para PostgreSQL

- d. Exportar datos

Puedes exportar el inventario a CSV o PDF desde la interfaz.

- e. Configuración de conexión PDO

PostgreSQL:

$pdo = new PDO("pgsql:host=localhost;port=5432;dbname=tienda_inventario", "postgres", "");

MySQL:

$pdo = new PDO("mysql:host=localhost;dbname=tienda_inventario", "root", "", [
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'",
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
]);

- f. Migración de PostgreSQL a MySQL

pg_dump -s -U postgres tienda_inventario > tienda_pg.sql

Convierte con SQLines u otra herramienta online: https://sqlines.com/online

Guarda como tienda_mysql.sql e impórtalo con mysql o phpMyAdmin.

## 📦 Clonar el Proyecto

git clone https://github.com/tuusuario/tienda_inventario.git
cd tienda_inventario


## 🛠 Instalar driver PDO para MySQL (si usas MySQL)

sudo apt-get install php-mysql
sudo systemctl restart apache2

En Windows, asegúrate de tener habilitado:

ext=pdo_mysql

## 📥 Crear tablas y cargar datos

- PostgreSQL:

psql -U postgres -d tienda_inventario -f tienda_pg.sql

- MySQL:

mysql -u root -p tienda_inventario < tienda_mysql.sql

## 👁️ Ejecutar la App con PHP embebido (Visual Studio Code o Terminal)

"C:\Program Files\php-8.2.27-Win32-vs16-x64\php.exe" -S localhost:8000

Abre tu navegador en:

http://localhost:8000/

Deberías ver:

Bienvenido a mi tienda 🛒



## 📘 Documentación oficial (PDFs)

- [📄 Doc_tienda_inv.pdf (google drive)](https://drive.google.com/drive/u/0/my-drive)

- [📄 Doc_Instalacion_php.pdf (google drive)](https://drive.google.com/drive/u/0/my-drive)


## 💡 Recomendación

Si prefieres una solución todo-en-uno que incluya PHP, Apache y MySQL, puedes instalar XAMPP, ideal para desarrollo web en Windows:

https://www.apachefriends.org/es/index.html





