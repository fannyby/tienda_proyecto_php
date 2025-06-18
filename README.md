# Tienda Inventario 

Esta es una aplicación web para la gestión de inventario de componentes de ordenadores.
Soporta bases de datos PostgreSQL y MySQL/MariaDB usando PHP con PDO.

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

README.md: esta la documentación

## 📗 Estructura del Proyecto

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
│   inventario.php
│   marcas.php
│   obtener_categorias.php
│   obtener_marcas.php
│   obtener_productos.php
│   productos.php
│   README.md
│   script.js
│   tienda_schema_mysql.sql
│   tienda_schema_pg.sql
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

- 1.Instalar PostgreSQL y/o MySQL

PostgreSQL
```
https://www.postgresql.org/download/
```

MySQL/MariaDB
```
https://dev.mysql.com/downloads/ 
```
- 2.Crear base de datos 

  - a. BD correspondiente:

        -Tienda_Inventario en PostgreSQL

        -tienda_inventario en MySQL

  - b. Importar:

        -tienda_schema_pg.sql para PostgreSQL

        -tienda_schema_mysql.sql para MySQL

  - c. Configurar conexiones en archivos PHP

        -conectar_mysql.php para MySQL

        -conexion_pg.php para PostgreSQL

  - d. Exportar datos

        -Puedes exportar el inventario a CSV o PDF desde la interfaz.

  - e. Configuración de conexión PDO

PostgreSQL:
```SQL
$pdo = new PDO("pgsql:host=localhost;port=5432;dbname=tienda_inventario", "postgres", "");
```
MySQL:
```bash 

$pdo = new PDO("mysql:host=localhost;dbname=tienda_inventario", "root", "", )
    
```


## 📦 Clonar el Proyecto
``` bash

git clone https://github.com/fannyby/tienda_proyecto_php.git
cd tienda_inventario

```


## 📥 Crear tablas y cargar datos

- PostgreSQL:
```bash

psql -U postgres -d tienda_inventario -f tienda_schema_pg.sql
```

- MySQL:
```bash

mysql -u root -p tienda_inventario < tienda_schema_mysql.sql
```


## 👁️ Ejecutar la App con PHP embebido (Visual Studio Code o Terminal)
```

"C:\Program Files\php-8.2.27-Win32-vs16-x64\php.exe" -S localhost:8000
```


Abre tu navegador en:
```bash

http://localhost:8000/
```



```bash
Deberías ver:

Bienvenido a mi tienda 🛒

```

## 📘 Documentación oficial (PDFs)

- [📄 Doc_tienda_inv.pdf (google drive)](https://drive.google.com/file/d/10bRKnITYtmFE_JQ93dp55zXnic465gdR/view?usp=sharing)

- [📄 Doc_Instalacion_php.pdf (google drive)](https://drive.google.com/file/d/1MUINRh9yIL-A628PvYerNn_LCO9nFhIr/view?usp=sharing)


## 💡 Recomendación
```
Si prefieres una solución todo-en-uno que incluya PHP, Apache y MySQL, puedes instalar XAMPP, ideal para desarrollo web en Windows.
```





