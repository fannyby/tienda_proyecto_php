INSERT IGNORE INTO categoria (id_categoria, nombre) VALUES 
(1, 'CPU'),
(2, 'GPU'),
(3, 'Memoria'),
(4, 'Almacenamiento'),
(5, 'Placa Madre'),
(6, 'Fuente de Poder'),
(7, 'Refrigeración'),
(8, 'Gabinete'),
(9, 'Monitor'),
(10, 'Teclado'),
(11, 'Ratón'),
(12, 'Auriculares'),
(13, 'Tarjeta de Sonido'),
(14, 'Tarjeta de Red'),
(15, 'Unidad Óptica'),
(16, 'Ventilador'),
(17, 'Disipador'),
(18, 'Cableado'),
(19, 'Adaptadores'),
(20, 'Impresora');

INSERT IGNORE INTO marca (id_marca, nombre) VALUES 
(1, 'Intel'),
(2, 'AMD'),
(3, 'NVIDIA'),
(4, 'ASUS'),
(5, 'MSI'),
(6, 'Gigabyte'),
(7, 'Corsair'),
(8, 'Kingston'),
(9, 'G.Skill'),
(10, 'Crucial'),
(11, 'Samsung'),
(12, 'Western Digital'),
(13, 'Seagate'),
(14, 'EVGA'),
(15, 'Cooler Master'),
(16, 'NZXT'),
(17, 'Logitech'),
(18, 'Razer'),
(19, 'HP'),
(20, 'Dell');

INSERT IGNORE INTO producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES
(1, 'Intel Core i5-12400F', 180.00, 15, 1, 1),
(2, 'AMD Ryzen 5 5600X', 199.99, 10, 1, 2),
(3, 'NVIDIA GeForce RTX 3060', 329.00, 8, 2, 3),
(4, 'ASUS TUF Gaming RTX 4070', 599.00, 5, 2, 4),
(5, 'Corsair Vengeance LPX 16GB DDR4', 75.00, 20, 3, 7),
(6, 'G.Skill Ripjaws V 32GB DDR4', 120.00, 12, 3, 9),
(7, 'Samsung 970 EVO Plus 1TB SSD', 99.00, 18, 4, 11),
(8, 'Seagate Barracuda 2TB HDD', 55.00, 25, 4, 13),
(9, 'MSI B550 Tomahawk', 139.00, 7, 5, 5),
(10, 'Gigabyte X670 AORUS Elite', 229.00, 6, 5, 6),
(11, 'Corsair RM750x PSU 750W', 119.00, 10, 6, 7),
(12, 'Cooler Master MWE 650W', 89.00, 9, 6, 15),
(13, 'Cooler Master Hyper 212', 44.00, 14, 7, 15),
(14, 'NZXT Kraken X63', 149.99, 4, 7, 16),
(15, 'NZXT H510 ATX Case', 79.00, 11, 8, 16),
(16, 'Logitech G Pro X Headset', 99.00, 6, 12, 17),
(17, 'Razer BlackWidow V3', 129.00, 5, 10, 18),
(18, 'Logitech G502 HERO Mouse', 49.99, 10, 11, 17),
(19, 'HP 27\" Full HD Monitor', 179.99, 7, 9, 19),
(20, 'Dell UltraSharp 24\" IPS', 229.99, 4, 9, 20),
(21, 'Intel Core i7-12700K', 340.00, 10, 1, 1);

INSERT IGNORE INTO almacenamiento (id_almacenamiento, id_producto, capacidad_gb, tipo) VALUES
(1, 7, 1000, 'SSD'),    -- Samsung 970 EVO Plus 1TB SSD
(2, 8, 2000, 'HDD'),    -- Seagate Barracuda 2TB HDD
(3, 5, 16, 'RAM'),      -- Corsair Vengeance LPX 16GB DDR4
(4, 6, 32, 'RAM'),      -- G.Skill Ripjaws V 32GB DDR4
(5, 9, 0, 'Placa'),     -- MSI B550 Tomahawk
(6, 10, 0, 'Placa'),    -- Gigabyte X670 AORUS Elite
(7, 11, 750, 'PSU'),    -- Corsair RM750x PSU 750W
(8, 12, 650, 'PSU'),    -- Cooler Master MWE 650W
(9, 13, 0, 'Cooler'),   -- Cooler Master Hyper 212
(10, 14, 0, 'Refrigeración'), -- NZXT Kraken X63
(11, 15, 0, 'Gabinete'), -- NZXT H510 ATX Case
(12, 1, 0, 'CPU'),      -- Intel Core i5-12400F
(13, 2, 0, 'CPU'),      -- AMD Ryzen 5 5600X
(14, 3, 0, 'GPU'),      -- NVIDIA GeForce RTX 3060
(15, 4, 0, 'GPU'),      -- ASUS TUF RTX 4070
(16, 16, 0, 'Audio'),   -- Logitech G Pro X Headset
(17, 17, 0, 'Teclado'), -- Razer BlackWidow V3
(18, 18, 0, 'Ratón'),   -- Logitech G502 HERO Mouse
(19, 19, 27, 'Monitor'),-- HP 27" Full HD Monitor
(20, 20, 24, 'Monitor');-- Dell UltraSharp 24" IPS

