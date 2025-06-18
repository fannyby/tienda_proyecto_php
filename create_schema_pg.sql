--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-18 10:37:51

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
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 239 (class 1255 OID 17783)
-- Name: audit_producto_changes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.audit_producto_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO historial_precios_stock(
        producto_id,
        precio_anterior,
        precio_nuevo,
        stock_anterior,
        stock_nuevo,
        fecha_cambio,
        id_categoria,
        id_marca
    ) VALUES (
        NEW.id_producto,
        OLD.precio,
        NEW.precio,
        OLD.stock,
        NEW.stock,
        NOW(),
        NEW.id_categoria,
        NEW.id_marca
    );
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.audit_producto_changes() OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 17764)
-- Name: audit_productos_changes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.audit_productos_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO historial_precios_stock(
            producto_id,
            precio_anterior,
            precio_nuevo,
            stock_anterior,
            stock_nuevo,
            fecha_cambio,
            id_categoria,
            id_marca
        ) VALUES (
            NEW.id,
            OLD.precio,
            NEW.precio,
            OLD.stock,
            NEW.stock,
            NOW(),
            NEW.id_categoria,
            NEW.id_marca
        );
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.audit_productos_changes() OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 17754)
-- Name: registrar_cambio_stock(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.registrar_cambio_stock() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (NEW.stock IS DISTINCT FROM OLD.stock) THEN
    INSERT INTO log_cambios_stock(id_producto, stock_anterior, stock_nuevo, fecha)
    VALUES (OLD.id_producto, OLD.stock, NEW.stock, NOW());
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.registrar_cambio_stock() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 17729)
-- Name: almacenamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacenamiento (
    id_almacenamiento integer NOT NULL,
    id_producto integer,
    capacidad_gb integer,
    tipo character varying(10)
);


ALTER TABLE public.almacenamiento OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17728)
-- Name: almacenamiento_id_almacenamiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.almacenamiento_id_almacenamiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.almacenamiento_id_almacenamiento_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 229
-- Name: almacenamiento_id_almacenamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.almacenamiento_id_almacenamiento_seq OWNED BY public.almacenamiento.id_almacenamiento;


--
-- TOC entry 218 (class 1259 OID 17651)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17650)
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 217
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;


--
-- TOC entry 224 (class 1259 OID 17687)
-- Name: cpu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cpu (
    id_cpu integer NOT NULL,
    id_producto integer,
    nucleos integer,
    hilos integer,
    frecuencia_base numeric(4,2),
    frecuencia_turbo numeric(4,2),
    passmark_score integer
);


ALTER TABLE public.cpu OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17686)
-- Name: cpu_id_cpu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cpu_id_cpu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cpu_id_cpu_seq OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 223
-- Name: cpu_id_cpu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cpu_id_cpu_seq OWNED BY public.cpu.id_cpu;


--
-- TOC entry 226 (class 1259 OID 17701)
-- Name: gpu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gpu (
    id_gpu integer NOT NULL,
    id_producto integer,
    vram_gb integer,
    passmark_score integer
);


ALTER TABLE public.gpu OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17700)
-- Name: gpu_id_gpu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gpu_id_gpu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gpu_id_gpu_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 225
-- Name: gpu_id_gpu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gpu_id_gpu_seq OWNED BY public.gpu.id_gpu;


--
-- TOC entry 235 (class 1259 OID 17757)
-- Name: historial_precios_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial_precios_stock (
    id integer NOT NULL,
    producto_id integer NOT NULL,
    fecha_cambio timestamp without time zone DEFAULT now(),
    precio_anterior numeric(10,2),
    precio_nuevo numeric(10,2),
    stock_anterior integer,
    stock_nuevo integer,
    id_categoria integer,
    id_marca integer
);


ALTER TABLE public.historial_precios_stock OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17756)
-- Name: historial_precios_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_precios_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historial_precios_stock_id_seq OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 234
-- Name: historial_precios_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_precios_stock_id_seq OWNED BY public.historial_precios_stock.id;


--
-- TOC entry 233 (class 1259 OID 17747)
-- Name: log_cambios_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_cambios_stock (
    id_log integer NOT NULL,
    id_producto integer,
    stock_anterior integer,
    stock_nuevo integer,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_categoria integer,
    id_marca integer
);


ALTER TABLE public.log_cambios_stock OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17746)
-- Name: log_cambios_stock_id_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_cambios_stock_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.log_cambios_stock_id_log_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 232
-- Name: log_cambios_stock_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_cambios_stock_id_log_seq OWNED BY public.log_cambios_stock.id_log;


--
-- TOC entry 220 (class 1259 OID 17660)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id_marca integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17659)
-- Name: marca_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marca_id_marca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marca_id_marca_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 219
-- Name: marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marca_id_marca_seq OWNED BY public.marca.id_marca;


--
-- TOC entry 228 (class 1259 OID 17715)
-- Name: memoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memoria (
    id_memoria integer NOT NULL,
    id_producto integer,
    capacidad_gb integer,
    tipo character varying(10),
    velocidad_mhz integer
);


ALTER TABLE public.memoria OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17714)
-- Name: memoria_id_memoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.memoria_id_memoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.memoria_id_memoria_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 227
-- Name: memoria_id_memoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.memoria_id_memoria_seq OWNED BY public.memoria.id_memoria;


--
-- TOC entry 222 (class 1259 OID 17669)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio numeric(10,2) NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    id_categoria integer,
    id_marca integer
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17668)
-- Name: producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_producto_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 221
-- Name: producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;


--
-- TOC entry 231 (class 1259 OID 17742)
-- Name: vista_inventario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_inventario AS
 SELECT p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    m.nombre AS marca,
    p.precio,
    p.stock
   FROM ((public.producto p
     JOIN public.categoria c ON ((p.id_categoria = c.id_categoria)))
     JOIN public.marca m ON ((p.id_marca = m.id_marca)));


ALTER VIEW public.vista_inventario OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17801)
-- Name: vista_productos_detalle; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_productos_detalle AS
 SELECT p.id_producto,
    p.nombre,
    p.precio,
    p.stock,
    c.nombre AS categoria,
    m.nombre AS marca
   FROM ((public.producto p
     LEFT JOIN public.categoria c ON ((p.id_categoria = c.id_categoria)))
     LEFT JOIN public.marca m ON ((p.id_marca = m.id_marca)));


ALTER VIEW public.vista_productos_detalle OWNER TO postgres;

--
-- TOC entry 4753 (class 2604 OID 17732)
-- Name: almacenamiento id_almacenamiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenamiento ALTER COLUMN id_almacenamiento SET DEFAULT nextval('public.almacenamiento_id_almacenamiento_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 17654)
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 17690)
-- Name: cpu id_cpu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpu ALTER COLUMN id_cpu SET DEFAULT nextval('public.cpu_id_cpu_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 17704)
-- Name: gpu id_gpu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpu ALTER COLUMN id_gpu SET DEFAULT nextval('public.gpu_id_gpu_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 17760)
-- Name: historial_precios_stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_precios_stock ALTER COLUMN id SET DEFAULT nextval('public.historial_precios_stock_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 17750)
-- Name: log_cambios_stock id_log; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_cambios_stock ALTER COLUMN id_log SET DEFAULT nextval('public.log_cambios_stock_id_log_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 17663)
-- Name: marca id_marca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca ALTER COLUMN id_marca SET DEFAULT nextval('public.marca_id_marca_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 17718)
-- Name: memoria id_memoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memoria ALTER COLUMN id_memoria SET DEFAULT nextval('public.memoria_id_memoria_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 17672)
-- Name: producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);


--
-- TOC entry 4781 (class 2606 OID 17736)
-- Name: almacenamiento almacenamiento_id_producto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenamiento
    ADD CONSTRAINT almacenamiento_id_producto_key UNIQUE (id_producto);


--
-- TOC entry 4783 (class 2606 OID 17734)
-- Name: almacenamiento almacenamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenamiento
    ADD CONSTRAINT almacenamiento_pkey PRIMARY KEY (id_almacenamiento);


--
-- TOC entry 4759 (class 2606 OID 17658)
-- Name: categoria categoria_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nombre_key UNIQUE (nombre);


--
-- TOC entry 4761 (class 2606 OID 17656)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4769 (class 2606 OID 17694)
-- Name: cpu cpu_id_producto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpu
    ADD CONSTRAINT cpu_id_producto_key UNIQUE (id_producto);


--
-- TOC entry 4771 (class 2606 OID 17692)
-- Name: cpu cpu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpu
    ADD CONSTRAINT cpu_pkey PRIMARY KEY (id_cpu);


--
-- TOC entry 4773 (class 2606 OID 17708)
-- Name: gpu gpu_id_producto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpu
    ADD CONSTRAINT gpu_id_producto_key UNIQUE (id_producto);


--
-- TOC entry 4775 (class 2606 OID 17706)
-- Name: gpu gpu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpu
    ADD CONSTRAINT gpu_pkey PRIMARY KEY (id_gpu);


--
-- TOC entry 4787 (class 2606 OID 17763)
-- Name: historial_precios_stock historial_precios_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_precios_stock
    ADD CONSTRAINT historial_precios_stock_pkey PRIMARY KEY (id);


--
-- TOC entry 4785 (class 2606 OID 17753)
-- Name: log_cambios_stock log_cambios_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_cambios_stock
    ADD CONSTRAINT log_cambios_stock_pkey PRIMARY KEY (id_log);


--
-- TOC entry 4763 (class 2606 OID 17667)
-- Name: marca marca_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_nombre_key UNIQUE (nombre);


--
-- TOC entry 4765 (class 2606 OID 17665)
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id_marca);


--
-- TOC entry 4777 (class 2606 OID 17722)
-- Name: memoria memoria_id_producto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memoria
    ADD CONSTRAINT memoria_id_producto_key UNIQUE (id_producto);


--
-- TOC entry 4779 (class 2606 OID 17720)
-- Name: memoria memoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memoria
    ADD CONSTRAINT memoria_pkey PRIMARY KEY (id_memoria);


--
-- TOC entry 4767 (class 2606 OID 17675)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 4800 (class 2620 OID 17805)
-- Name: producto trg_audit_producto_changes; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_audit_producto_changes AFTER UPDATE ON public.producto FOR EACH ROW EXECUTE FUNCTION public.audit_producto_changes();


--
-- TOC entry 4801 (class 2620 OID 17800)
-- Name: producto trg_cambio_stock; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_cambio_stock AFTER UPDATE ON public.producto FOR EACH ROW WHEN ((old.stock IS DISTINCT FROM new.stock)) EXECUTE FUNCTION public.registrar_cambio_stock();


--
-- TOC entry 4802 (class 2620 OID 17784)
-- Name: producto trigger_audit_producto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_audit_producto AFTER UPDATE ON public.producto FOR EACH ROW EXECUTE FUNCTION public.audit_producto_changes();


--
-- TOC entry 4803 (class 2620 OID 17755)
-- Name: producto trigger_cambio_stock; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_cambio_stock AFTER UPDATE ON public.producto FOR EACH ROW EXECUTE FUNCTION public.registrar_cambio_stock();


--
-- TOC entry 4794 (class 2606 OID 17737)
-- Name: almacenamiento almacenamiento_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenamiento
    ADD CONSTRAINT almacenamiento_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 4791 (class 2606 OID 17695)
-- Name: cpu cpu_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpu
    ADD CONSTRAINT cpu_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 4797 (class 2606 OID 17816)
-- Name: historial_precios_stock fk_historial_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_precios_stock
    ADD CONSTRAINT fk_historial_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria) ON DELETE SET NULL;


--
-- TOC entry 4798 (class 2606 OID 17821)
-- Name: historial_precios_stock fk_historial_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_precios_stock
    ADD CONSTRAINT fk_historial_marca FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca) ON DELETE SET NULL;


--
-- TOC entry 4799 (class 2606 OID 17826)
-- Name: historial_precios_stock fk_historial_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_precios_stock
    ADD CONSTRAINT fk_historial_producto FOREIGN KEY (producto_id) REFERENCES public.producto(id_producto) ON DELETE SET NULL;


--
-- TOC entry 4795 (class 2606 OID 17806)
-- Name: log_cambios_stock fk_log_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_cambios_stock
    ADD CONSTRAINT fk_log_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria) ON DELETE SET NULL;


--
-- TOC entry 4796 (class 2606 OID 17811)
-- Name: log_cambios_stock fk_log_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_cambios_stock
    ADD CONSTRAINT fk_log_marca FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca) ON DELETE SET NULL;


--
-- TOC entry 4788 (class 2606 OID 17795)
-- Name: producto fk_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT fk_marca FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca) ON DELETE SET NULL;


--
-- TOC entry 4792 (class 2606 OID 17709)
-- Name: gpu gpu_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpu
    ADD CONSTRAINT gpu_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 4793 (class 2606 OID 17723)
-- Name: memoria memoria_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memoria
    ADD CONSTRAINT memoria_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 4789 (class 2606 OID 17676)
-- Name: producto producto_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


--
-- TOC entry 4790 (class 2606 OID 17681)
-- Name: producto producto_id_marca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_marca_fkey FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca);


-- Completed on 2025-06-18 10:37:51

--
-- PostgreSQL database dump complete
--

