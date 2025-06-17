--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-09 14:17:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = on;

DROP DATABASE "Tienda_Inventario";
--
-- TOC entry 4947 (class 1262 OID 17640)
-- Name: Tienda_Inventario; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Tienda_Inventario" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-ES';


ALTER DATABASE "Tienda_Inventario" OWNER TO postgres;

\connect "Tienda_Inventario"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = on;

--
-- TOC entry 4939 (class 0 OID 17729)
-- Dependencies: 230
-- Data for Name: almacenamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.almacenamiento (id_almacenamiento, id_producto, capacidad_gb, tipo) VALUES (1, 7, 1000, 'SSD') ON CONFLICT DO NOTHING;
INSERT INTO public.almacenamiento (id_almacenamiento, id_producto, capacidad_gb, tipo) VALUES (2, 8, 2000, 'HDD') ON CONFLICT DO NOTHING;


--
-- TOC entry 4927 (class 0 OID 17651)
-- Dependencies: 218
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria (id_categoria, nombre) VALUES (1, 'CPU') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (2, 'GPU') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (3, 'Memoria') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (4, 'Almacenamiento') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (5, 'Placa Madre') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (6, 'Fuente de Poder') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (7, 'Refrigeración') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (8, 'Gabinete') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (9, 'Monitor') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (10, 'Teclado') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (11, 'Ratón') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (12, 'Auriculares') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (13, 'Tarjeta de Sonido') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (14, 'Tarjeta de Red') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (15, 'Unidad Óptica') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (16, 'Ventilador') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (17, 'Disipador') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (18, 'Cableado') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (19, 'Adaptadores') ON CONFLICT DO NOTHING;
INSERT INTO public.categoria (id_categoria, nombre) VALUES (20, 'Impresora') ON CONFLICT DO NOTHING;


--
-- TOC entry 4933 (class 0 OID 17687)
-- Dependencies: 224
-- Data for Name: cpu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cpu (id_cpu, id_producto, nucleos, hilos, frecuencia_base, frecuencia_turbo, passmark_score) VALUES (21, 1, 6, 12, 2.50, 4.40, 17000) ON CONFLICT DO NOTHING;
INSERT INTO public.cpu (id_cpu, id_producto, nucleos, hilos, frecuencia_base, frecuencia_turbo, passmark_score) VALUES (22, 2, 6, 12, 3.70, 4.60, 19500) ON CONFLICT DO NOTHING;
INSERT INTO public.cpu (id_cpu, id_producto, nucleos, hilos, frecuencia_base, frecuencia_turbo, passmark_score) VALUES (23, 21, 8, 16, 3.60, 5.00, 25000) ON CONFLICT DO NOTHING;


--
-- TOC entry 4935 (class 0 OID 17701)
-- Dependencies: 226
-- Data for Name: gpu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gpu (id_gpu, id_producto, vram_gb, passmark_score) VALUES (1, 3, 12, 17000) ON CONFLICT DO NOTHING;
INSERT INTO public.gpu (id_gpu, id_producto, vram_gb, passmark_score) VALUES (2, 4, 12, 22000) ON CONFLICT DO NOTHING;


--
-- TOC entry 4941 (class 0 OID 17747)
-- Dependencies: 233
-- Data for Name: log_cambios_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4929 (class 0 OID 17660)
-- Dependencies: 220
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.marca (id_marca, nombre) VALUES (1, 'Intel') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (2, 'AMD') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (3, 'NVIDIA') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (4, 'ASUS') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (5, 'MSI') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (6, 'Gigabyte') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (7, 'Corsair') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (8, 'Kingston') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (9, 'G.Skill') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (10, 'Crucial') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (11, 'Samsung') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (12, 'Western Digital') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (13, 'Seagate') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (14, 'EVGA') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (15, 'Cooler Master') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (16, 'NZXT') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (17, 'Logitech') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (18, 'Razer') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (19, 'HP') ON CONFLICT DO NOTHING;
INSERT INTO public.marca (id_marca, nombre) VALUES (20, 'Dell') ON CONFLICT DO NOTHING;


--
-- TOC entry 4937 (class 0 OID 17715)
-- Dependencies: 228
-- Data for Name: memoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.memoria (id_memoria, id_producto, capacidad_gb, tipo, velocidad_mhz) VALUES (1, 5, 16, 'DDR4', 3200) ON CONFLICT DO NOTHING;
INSERT INTO public.memoria (id_memoria, id_producto, capacidad_gb, tipo, velocidad_mhz) VALUES (2, 6, 32, 'DDR4', 3600) ON CONFLICT DO NOTHING;


--
-- TOC entry 4931 (class 0 OID 17669)
-- Dependencies: 222
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (1, 'Intel Core i5-12400F', 180.00, 15, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (2, 'AMD Ryzen 5 5600X', 199.99, 10, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (3, 'NVIDIA GeForce RTX 3060', 329.00, 8, 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (4, 'ASUS TUF Gaming RTX 4070', 599.00, 5, 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (5, 'Corsair Vengeance LPX 16GB DDR4', 75.00, 20, 3, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (6, 'G.Skill Ripjaws V 32GB DDR4', 120.00, 12, 3, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (7, 'Samsung 970 EVO Plus 1TB SSD', 99.00, 18, 4, 11) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (8, 'Seagate Barracuda 2TB HDD', 55.00, 25, 4, 13) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (9, 'MSI B550 Tomahawk', 139.00, 7, 5, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (10, 'Gigabyte X670 AORUS Elite', 229.00, 6, 5, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (11, 'Corsair RM750x PSU 750W', 119.00, 10, 6, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (12, 'Cooler Master MWE 650W', 89.00, 9, 6, 15) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (13, 'Cooler Master Hyper 212', 44.00, 14, 7, 15) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (14, 'NZXT Kraken X63', 149.99, 4, 7, 16) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (15, 'NZXT H510 ATX Case', 79.00, 11, 8, 16) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (16, 'Logitech G Pro X Headset', 99.00, 6, 12, 17) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (17, 'Razer BlackWidow V3', 129.00, 5, 10, 18) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (18, 'Logitech G502 HERO Mouse', 49.99, 10, 11, 17) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (19, 'HP 27" Full HD Monitor', 179.99, 7, 9, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (20, 'Dell UltraSharp 24" IPS', 229.99, 4, 9, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.producto (id_producto, nombre, precio, stock, id_categoria, id_marca) VALUES (21, 'Intel Core i7-12700K', 340.00, 10, 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 229
-- Name: almacenamiento_id_almacenamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.almacenamiento_id_almacenamiento_seq', 2, true);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 217
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 21, true);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 223
-- Name: cpu_id_cpu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cpu_id_cpu_seq', 23, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 225
-- Name: gpu_id_gpu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gpu_id_gpu_seq', 2, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 232
-- Name: log_cambios_stock_id_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_cambios_stock_id_log_seq', 1, false);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 219
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marca_id_marca_seq', 21, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 227
-- Name: memoria_id_memoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.memoria_id_memoria_seq', 2, true);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 221
-- Name: producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_producto_seq', 21, true);


-- Completed on 2025-06-09 14:17:08

--
-- PostgreSQL database dump complete
--

