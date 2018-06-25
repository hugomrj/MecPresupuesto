--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.13
-- Dumped by pg_dump version 9.4.13
-- Started on 2018-06-25 15:03:47 PYT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 9 (class 2615 OID 34156)
-- Name: estructura; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA estructura;


ALTER SCHEMA estructura OWNER TO postgres;

--
-- TOC entry 10 (class 2615 OID 34157)
-- Name: presupuesto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA presupuesto;


ALTER SCHEMA presupuesto OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 17680)
-- Name: sistema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sistema;


ALTER SCHEMA sistema OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 11935)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = estructura, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 236 (class 1259 OID 34158)
-- Name: proyectos; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE proyectos (
    id integer NOT NULL,
    subprograma integer,
    tp integer,
    pg integer,
    sp integer,
    py integer,
    descripcion character varying
);


ALTER TABLE proyectos OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 34164)
-- Name: Proyectos_id_seq; Type: SEQUENCE; Schema: estructura; Owner: postgres
--

CREATE SEQUENCE "Proyectos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Proyectos_id_seq" OWNER TO postgres;

--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 237
-- Name: Proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: estructura; Owner: postgres
--

ALTER SEQUENCE "Proyectos_id_seq" OWNED BY proyectos.id;


--
-- TOC entry 245 (class 1259 OID 34224)
-- Name: componentes; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE componentes (
    componente integer NOT NULL,
    eje integer,
    descripcion character varying
);


ALTER TABLE componentes OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 34230)
-- Name: ejes; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE ejes (
    eje integer NOT NULL,
    descripcion character varying
);


ALTER TABLE ejes OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 34288)
-- Name: items; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    nivel integer,
    descripcion character varying
);


ALTER TABLE items OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 34286)
-- Name: items_id_seq; Type: SEQUENCE; Schema: estructura; Owner: postgres
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE items_id_seq OWNER TO postgres;

--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 253
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: estructura; Owner: postgres
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- TOC entry 256 (class 1259 OID 34297)
-- Name: niveles; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE niveles (
    id integer NOT NULL,
    componente integer,
    descripcion character varying
);


ALTER TABLE niveles OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 34295)
-- Name: niveles_id_seq; Type: SEQUENCE; Schema: estructura; Owner: postgres
--

CREATE SEQUENCE niveles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE niveles_id_seq OWNER TO postgres;

--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 255
-- Name: niveles_id_seq; Type: SEQUENCE OWNED BY; Schema: estructura; Owner: postgres
--

ALTER SEQUENCE niveles_id_seq OWNED BY niveles.id;


--
-- TOC entry 238 (class 1259 OID 34166)
-- Name: programas; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE programas (
    id integer NOT NULL,
    tp integer,
    pg integer,
    descripcion character varying
);


ALTER TABLE programas OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 34172)
-- Name: programas_id_seq; Type: SEQUENCE; Schema: estructura; Owner: postgres
--

CREATE SEQUENCE programas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE programas_id_seq OWNER TO postgres;

--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 239
-- Name: programas_id_seq; Type: SEQUENCE OWNED BY; Schema: estructura; Owner: postgres
--

ALTER SEQUENCE programas_id_seq OWNED BY programas.id;


--
-- TOC entry 247 (class 1259 OID 34236)
-- Name: propositos; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE propositos (
    id integer NOT NULL,
    item integer,
    descripcion character varying
);


ALTER TABLE propositos OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 34242)
-- Name: propositos_id_seq; Type: SEQUENCE; Schema: estructura; Owner: postgres
--

CREATE SEQUENCE propositos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE propositos_id_seq OWNER TO postgres;

--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 248
-- Name: propositos_id_seq; Type: SEQUENCE OWNED BY; Schema: estructura; Owner: postgres
--

ALTER SEQUENCE propositos_id_seq OWNED BY propositos.id;


--
-- TOC entry 249 (class 1259 OID 34244)
-- Name: subcomponentes; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE subcomponentes (
    id integer NOT NULL,
    componente integer,
    descripcion character varying
);


ALTER TABLE subcomponentes OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 34250)
-- Name: subcomponentes_id_seq; Type: SEQUENCE; Schema: estructura; Owner: postgres
--

CREATE SEQUENCE subcomponentes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subcomponentes_id_seq OWNER TO postgres;

--
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 250
-- Name: subcomponentes_id_seq; Type: SEQUENCE OWNED BY; Schema: estructura; Owner: postgres
--

ALTER SEQUENCE subcomponentes_id_seq OWNED BY subcomponentes.id;


--
-- TOC entry 240 (class 1259 OID 34174)
-- Name: subprogramas; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE subprogramas (
    id integer NOT NULL,
    tp integer,
    pg integer,
    sp integer,
    programa integer,
    descripcion character varying
);


ALTER TABLE subprogramas OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 34180)
-- Name: subprogramas_subprograma_seq; Type: SEQUENCE; Schema: estructura; Owner: postgres
--

CREATE SEQUENCE subprogramas_subprograma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subprogramas_subprograma_seq OWNER TO postgres;

--
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 241
-- Name: subprogramas_subprograma_seq; Type: SEQUENCE OWNED BY; Schema: estructura; Owner: postgres
--

ALTER SEQUENCE subprogramas_subprograma_seq OWNED BY subprogramas.id;


--
-- TOC entry 242 (class 1259 OID 34182)
-- Name: tipos; Type: TABLE; Schema: estructura; Owner: postgres; Tablespace: 
--

CREATE TABLE tipos (
    tipo integer NOT NULL,
    descripcion character varying
);


ALTER TABLE tipos OWNER TO postgres;

SET search_path = presupuesto, pg_catalog;

--
-- TOC entry 243 (class 1259 OID 34215)
-- Name: anteproyecto2017; Type: TABLE; Schema: presupuesto; Owner: postgres; Tablespace: 
--

CREATE TABLE anteproyecto2017 (
    id integer NOT NULL,
    tp integer,
    pg integer,
    sp integer,
    py integer,
    obj integer,
    ff integer,
    of integer,
    dpt integer,
    producto integer,
    vigente numeric(12,0),
    ideal numeric(12,0) DEFAULT 0
);


ALTER TABLE anteproyecto2017 OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 34271)
-- Name: distribucion_componente; Type: TABLE; Schema: presupuesto; Owner: postgres; Tablespace: 
--

CREATE TABLE distribucion_componente (
    id integer NOT NULL,
    presupuesto integer NOT NULL,
    item integer NOT NULL,
    monto bigint
);


ALTER TABLE distribucion_componente OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 34269)
-- Name: distribucion_subcomponente_id_seq; Type: SEQUENCE; Schema: presupuesto; Owner: postgres
--

CREATE SEQUENCE distribucion_subcomponente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE distribucion_subcomponente_id_seq OWNER TO postgres;

--
-- TOC entry 2712 (class 0 OID 0)
-- Dependencies: 251
-- Name: distribucion_subcomponente_id_seq; Type: SEQUENCE OWNED BY; Schema: presupuesto; Owner: postgres
--

ALTER SEQUENCE distribucion_subcomponente_id_seq OWNED BY distribucion_componente.id;


--
-- TOC entry 244 (class 1259 OID 34219)
-- Name: presupuesto_vigente_id_seq; Type: SEQUENCE; Schema: presupuesto; Owner: postgres
--

CREATE SEQUENCE presupuesto_vigente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE presupuesto_vigente_id_seq OWNER TO postgres;

--
-- TOC entry 2713 (class 0 OID 0)
-- Dependencies: 244
-- Name: presupuesto_vigente_id_seq; Type: SEQUENCE OWNED BY; Schema: presupuesto; Owner: postgres
--

ALTER SEQUENCE presupuesto_vigente_id_seq OWNED BY anteproyecto2017.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 176 (class 1259 OID 17274)
-- Name: distribucion_ingresos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE distribucion_ingresos (
    id integer NOT NULL,
    presupuesto_id integer,
    direccion integer,
    pf1 bigint DEFAULT 0,
    pf2 bigint DEFAULT 0,
    pf3 bigint DEFAULT 0,
    pf4 bigint DEFAULT 0,
    pf5 bigint DEFAULT 0,
    pf6 bigint DEFAULT 0,
    pf7 bigint DEFAULT 0,
    pf8 bigint DEFAULT 0,
    pf9 bigint DEFAULT 0,
    pf10 bigint DEFAULT 0,
    pf11 bigint DEFAULT 0,
    pf12 bigint DEFAULT 0
);


ALTER TABLE distribucion_ingresos OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 17289)
-- Name: DistribucionIngresoPF_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DistribucionIngresoPF_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DistribucionIngresoPF_id_seq" OWNER TO postgres;

--
-- TOC entry 2714 (class 0 OID 0)
-- Dependencies: 177
-- Name: DistribucionIngresoPF_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "DistribucionIngresoPF_id_seq" OWNED BY distribucion_ingresos.id;


--
-- TOC entry 178 (class 1259 OID 17291)
-- Name: cajachica_certificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cajachica_certificacion (
    id integer NOT NULL,
    uoc_id integer,
    monto_certificacion bigint DEFAULT 0,
    direccion integer DEFAULT 0,
    monto_disponible bigint DEFAULT 0,
    mes integer DEFAULT 0
);


ALTER TABLE cajachica_certificacion OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 17298)
-- Name: cajachica_certificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cajachica_certificacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cajachica_certificacion_id_seq OWNER TO postgres;

--
-- TOC entry 2715 (class 0 OID 0)
-- Dependencies: 179
-- Name: cajachica_certificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cajachica_certificacion_id_seq OWNED BY cajachica_certificacion.id;


--
-- TOC entry 180 (class 1259 OID 17300)
-- Name: cajachica_distribucion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cajachica_distribucion (
    id integer NOT NULL,
    uoc_id integer,
    pf1 bigint DEFAULT 0,
    pf2 bigint DEFAULT 0,
    pf3 bigint DEFAULT 0,
    pf4 bigint DEFAULT 0,
    pf5 bigint DEFAULT 0,
    pf6 bigint DEFAULT 0,
    pf7 bigint DEFAULT 0,
    pf8 bigint DEFAULT 0,
    pf9 bigint DEFAULT 0,
    pf10 bigint DEFAULT 0,
    pf11 bigint DEFAULT 0,
    pf12 bigint DEFAULT 0
);


ALTER TABLE cajachica_distribucion OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 17315)
-- Name: cajachica_distribucion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cajachica_distribucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cajachica_distribucion_id_seq OWNER TO postgres;

--
-- TOC entry 2716 (class 0 OID 0)
-- Dependencies: 181
-- Name: cajachica_distribucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cajachica_distribucion_id_seq OWNED BY cajachica_distribucion.id;


--
-- TOC entry 233 (class 1259 OID 17746)
-- Name: cajachica_ejecucion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cajachica_ejecucion (
    id integer NOT NULL,
    uoc_id integer,
    ej1 bigint DEFAULT 0,
    ej2 bigint DEFAULT 0,
    ej3 bigint DEFAULT 0,
    ej4 bigint DEFAULT 0,
    ej5 bigint DEFAULT 0,
    ej6 bigint DEFAULT 0,
    ej7 bigint DEFAULT 0,
    ej8 bigint DEFAULT 0,
    ej9 bigint DEFAULT 0,
    ej10 bigint DEFAULT 0,
    ej11 bigint DEFAULT 0,
    ej12 bigint DEFAULT 0
);


ALTER TABLE cajachica_ejecucion OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17744)
-- Name: cajachica_ejecucion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cajachica_ejecucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cajachica_ejecucion_id_seq OWNER TO postgres;

--
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 232
-- Name: cajachica_ejecucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cajachica_ejecucion_id_seq OWNED BY cajachica_ejecucion.id;


--
-- TOC entry 220 (class 1259 OID 17638)
-- Name: cdp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cdp (
    id integer NOT NULL,
    estructura_id integer,
    unr integer,
    pac_numero integer,
    cc character varying,
    descripcion character varying,
    certificacion_actual bigint,
    fecha date,
    cdp_numero integer
);


ALTER TABLE cdp OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17636)
-- Name: cdp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cdp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cdp_id_seq OWNER TO postgres;

--
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 219
-- Name: cdp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cdp_id_seq OWNED BY cdp.id;


--
-- TOC entry 182 (class 1259 OID 17317)
-- Name: direcciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE direcciones (
    id integer NOT NULL,
    descripcion character varying
);


ALTER TABLE direcciones OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 17323)
-- Name: direcciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE direcciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE direcciones_id_seq OWNER TO postgres;

--
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 183
-- Name: direcciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE direcciones_id_seq OWNED BY direcciones.id;


--
-- TOC entry 184 (class 1259 OID 17325)
-- Name: direcciones_ingresos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE direcciones_ingresos (
    direccion integer NOT NULL,
    descripcion character varying
);


ALTER TABLE direcciones_ingresos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17663)
-- Name: documentos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documentos (
    id integer NOT NULL,
    fecha_documento date,
    fecha_entrada date DEFAULT ('now'::text)::date,
    direccion integer NOT NULL,
    descripcion character varying,
    expediente_numero bigint
);


ALTER TABLE documentos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17661)
-- Name: documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documentos_id_seq OWNER TO postgres;

--
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 223
-- Name: documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documentos_id_seq OWNED BY documentos.id;


--
-- TOC entry 231 (class 1259 OID 17721)
-- Name: documentos_movimiento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documentos_movimiento (
    id integer NOT NULL,
    documento integer,
    fecha date DEFAULT ('now'::text)::date,
    estado integer NOT NULL,
    usuario integer NOT NULL,
    comentario character varying
);


ALTER TABLE documentos_movimiento OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17708)
-- Name: documentos_movimiento_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documentos_movimiento_estado (
    id integer NOT NULL,
    descripcion character varying
);


ALTER TABLE documentos_movimiento_estado OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17719)
-- Name: documentos_movimiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documentos_movimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documentos_movimiento_id_seq OWNER TO postgres;

--
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 230
-- Name: documentos_movimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documentos_movimiento_id_seq OWNED BY documentos_movimiento.id;


--
-- TOC entry 185 (class 1259 OID 17331)
-- Name: enlaces; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enlaces (
    enlace integer NOT NULL,
    descripcion character varying
);


ALTER TABLE enlaces OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 17337)
-- Name: enlaces_enlace_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enlaces_enlace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enlaces_enlace_seq OWNER TO postgres;

--
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 186
-- Name: enlaces_enlace_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enlaces_enlace_seq OWNED BY enlaces.enlace;


--
-- TOC entry 221 (class 1259 OID 17647)
-- Name: estructura; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estructura (
    id integer NOT NULL,
    tp integer,
    pg integer,
    sp integer,
    py integer,
    obj integer,
    ff integer,
    of integer,
    dpt integer
);


ALTER TABLE estructura OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17650)
-- Name: estructura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estructura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estructura_id_seq OWNER TO postgres;

--
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 222
-- Name: estructura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estructura_id_seq OWNED BY estructura.id;


--
-- TOC entry 187 (class 1259 OID 17339)
-- Name: funcionario_categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionario_categoria (
    id integer NOT NULL,
    categoria integer,
    descripcion character varying
);


ALTER TABLE funcionario_categoria OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 17345)
-- Name: funcionario_clasificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_clasificacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funcionario_clasificacion_id_seq OWNER TO postgres;

--
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 188
-- Name: funcionario_clasificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_clasificacion_id_seq OWNED BY funcionario_categoria.id;


--
-- TOC entry 189 (class 1259 OID 17347)
-- Name: ingresos_certificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingresos_certificacion (
    id integer NOT NULL,
    plan_id integer,
    direccion integer,
    pf1 bigint DEFAULT 0,
    pf2 bigint DEFAULT 0,
    pf3 bigint DEFAULT 0,
    pf4 bigint DEFAULT 0,
    pf5 bigint DEFAULT 0,
    pf6 bigint DEFAULT 0,
    pf7 bigint DEFAULT 0,
    pf8 bigint DEFAULT 0,
    pf9 bigint DEFAULT 0,
    pf10 bigint DEFAULT 0,
    pf11 bigint DEFAULT 0,
    pf12 bigint DEFAULT 0
);


ALTER TABLE ingresos_certificacion OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 17362)
-- Name: ingresos_certificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ingresos_certificacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingresos_certificacion_id_seq OWNER TO postgres;

--
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 190
-- Name: ingresos_certificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ingresos_certificacion_id_seq OWNED BY ingresos_certificacion.id;


--
-- TOC entry 191 (class 1259 OID 17364)
-- Name: ingresos_ejecucion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingresos_ejecucion (
    id integer NOT NULL,
    plan_id integer,
    direccion integer,
    pf1 bigint DEFAULT 0,
    pf2 bigint DEFAULT 0,
    pf3 bigint DEFAULT 0,
    pf4 bigint DEFAULT 0,
    pf5 bigint DEFAULT 0,
    pf6 bigint DEFAULT 0,
    pf7 bigint DEFAULT 0,
    pf8 bigint DEFAULT 0,
    pf9 bigint DEFAULT 0,
    pf10 bigint DEFAULT 0,
    pf11 bigint DEFAULT 0,
    pf12 bigint DEFAULT 0
);


ALTER TABLE ingresos_ejecucion OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 17379)
-- Name: ingresos_ejecucion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ingresos_ejecucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingresos_ejecucion_id_seq OWNER TO postgres;

--
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 192
-- Name: ingresos_ejecucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ingresos_ejecucion_id_seq OWNED BY ingresos_ejecucion.id;


--
-- TOC entry 193 (class 1259 OID 17381)
-- Name: llamados; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE llamados (
    id integer NOT NULL,
    cc character varying,
    llamado character varying,
    monto bigint DEFAULT 0,
    pac character varying
);


ALTER TABLE llamados OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 17388)
-- Name: llamados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE llamados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE llamados_id_seq OWNER TO postgres;

--
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 194
-- Name: llamados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE llamados_id_seq OWNED BY llamados.id;


--
-- TOC entry 195 (class 1259 OID 17390)
-- Name: meses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meses (
    mes integer NOT NULL,
    descripcion character varying
);


ALTER TABLE meses OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 34148)
-- Name: objetos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE objetos (
    obj integer NOT NULL,
    descripcion character varying
);


ALTER TABLE objetos OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17396)
-- Name: pais_ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pais_ciudad (
    id integer NOT NULL,
    pais character varying,
    ciudad character varying,
    c1 integer,
    c2 integer,
    c3 integer,
    c4 integer,
    c5 integer
);


ALTER TABLE pais_ciudad OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17402)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personas (
    persona integer NOT NULL,
    cedula integer NOT NULL,
    nombres character varying NOT NULL
);


ALTER TABLE personas OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17408)
-- Name: personas_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personas_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_persona_seq OWNER TO postgres;

--
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 198
-- Name: personas_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personas_persona_seq OWNED BY personas.persona;


--
-- TOC entry 199 (class 1259 OID 17410)
-- Name: plan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plan (
    id integer NOT NULL,
    tp integer,
    pg integer,
    sp integer,
    py integer,
    obj integer,
    ff integer,
    of integer,
    dpt integer,
    carpeta integer,
    producto integer,
    vigente numeric(12,0),
    aaaa integer
);


ALTER TABLE plan OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17413)
-- Name: plan2016_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plan2016_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plan2016_id_seq OWNER TO postgres;

--
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 200
-- Name: plan2016_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plan2016_id_seq OWNED BY plan.id;


--
-- TOC entry 201 (class 1259 OID 17415)
-- Name: plan_detalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plan_detalle (
    id integer NOT NULL,
    plan_id integer,
    cc character varying,
    llamado character varying,
    proveedor character varying,
    pac character varying,
    monto bigint,
    certificado bigint,
    detalle_tipo character(3)
);


ALTER TABLE plan_detalle OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17421)
-- Name: plan_detalle2016_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plan_detalle2016_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plan_detalle2016_id_seq OWNER TO postgres;

--
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 202
-- Name: plan_detalle2016_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plan_detalle2016_id_seq OWNED BY plan_detalle.id;


--
-- TOC entry 203 (class 1259 OID 17423)
-- Name: plan_financiero; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plan_financiero (
    id integer NOT NULL,
    presupuesto_id integer,
    pf1 bigint DEFAULT 0,
    pf2 bigint DEFAULT 0,
    pf3 bigint DEFAULT 0,
    pf4 bigint DEFAULT 0,
    pf5 bigint DEFAULT 0,
    pf6 bigint DEFAULT 0,
    pf7 bigint DEFAULT 0,
    pf8 bigint DEFAULT 0,
    pf9 bigint DEFAULT 0,
    pf10 bigint DEFAULT 0,
    pf11 bigint DEFAULT 0,
    pf12 bigint DEFAULT 0
);


ALTER TABLE plan_financiero OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17438)
-- Name: plan_financiero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plan_financiero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plan_financiero_id_seq OWNER TO postgres;

--
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 204
-- Name: plan_financiero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plan_financiero_id_seq OWNED BY plan_financiero.id;


--
-- TOC entry 205 (class 1259 OID 17440)
-- Name: presupuesto_vigente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE presupuesto_vigente (
    id integer NOT NULL,
    tp integer,
    pg integer,
    sp integer,
    py integer,
    obj integer,
    ff integer,
    of integer,
    dpt integer,
    carpeta integer,
    producto integer,
    vigente numeric(12,0),
    aux integer
);


ALTER TABLE presupuesto_vigente OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17443)
-- Name: presupuesto_vigente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE presupuesto_vigente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE presupuesto_vigente_id_seq OWNER TO postgres;

--
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 206
-- Name: presupuesto_vigente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE presupuesto_vigente_id_seq OWNED BY presupuesto_vigente.id;


--
-- TOC entry 218 (class 1259 OID 17621)
-- Name: presupuesto_vigente_tmp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE presupuesto_vigente_tmp (
    id integer,
    tp integer,
    pg integer,
    sp integer,
    py integer,
    obj integer,
    ff integer,
    of integer,
    dpt integer,
    carpeta integer,
    producto integer,
    vigente numeric(12,0),
    aux integer
);


ALTER TABLE presupuesto_vigente_tmp OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25956)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productos (
    producto integer NOT NULL,
    descripcion character varying
);


ALTER TABLE productos OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17471)
-- Name: uoc_certificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE uoc_certificacion (
    id integer NOT NULL,
    presupuesto_id integer,
    cc character varying,
    llamado character varying,
    proveedor character varying,
    pac character varying,
    monto bigint,
    certificado bigint,
    detalle_tipo character(3)
);


ALTER TABLE uoc_certificacion OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17445)
-- Name: viatico_certificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE viatico_certificacion (
    id integer NOT NULL,
    presupuesto_id integer,
    monto_certificacion bigint DEFAULT 0,
    persona integer DEFAULT 0,
    direccion integer DEFAULT 0,
    categoria_funcionario integer DEFAULT 0,
    destino integer DEFAULT 0,
    certificacion_numeracion integer,
    monto_disponible bigint DEFAULT 0,
    dias integer DEFAULT 0,
    terminal_pasaje integer DEFAULT 0,
    terminal_alojamiento integer DEFAULT 0,
    terminal_alimentacion integer DEFAULT 0,
    fecha_inicio date,
    fecha_fin date,
    datosviaje character varying
);


ALTER TABLE viatico_certificacion OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17458)
-- Name: qry_certificaciones; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW qry_certificaciones AS
 SELECT viatico_certificacion.presupuesto_id,
    sum(viatico_certificacion.monto_certificacion) AS certificado
   FROM viatico_certificacion
  GROUP BY viatico_certificacion.presupuesto_id
UNION
 SELECT a.plan_id AS presupuesto_id,
    sum(a.suma) AS certificado
   FROM ( SELECT ingresos_certificacion.plan_id,
            (((((((((((ingresos_certificacion.pf1 + ingresos_certificacion.pf2) + ingresos_certificacion.pf3) + ingresos_certificacion.pf4) + ingresos_certificacion.pf5) + ingresos_certificacion.pf6) + ingresos_certificacion.pf7) + ingresos_certificacion.pf8) + ingresos_certificacion.pf9) + ingresos_certificacion.pf10) + ingresos_certificacion.pf11) + ingresos_certificacion.pf12) AS suma
           FROM ingresos_certificacion) a
  GROUP BY a.plan_id
UNION
 SELECT uoc_certificacion.presupuesto_id,
    sum(uoc_certificacion.certificado) AS certificado
   FROM uoc_certificacion
  GROUP BY uoc_certificacion.presupuesto_id;


ALTER TABLE qry_certificaciones OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17463)
-- Name: reactivacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reactivacion (
    id integer NOT NULL,
    cc character varying,
    llamado character varying,
    contrato character varying,
    proveedor character varying,
    pac character varying,
    obj integer,
    monto bigint,
    aaaa integer,
    nro integer
);


ALTER TABLE reactivacion OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17469)
-- Name: reactivacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reactivacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reactivacion_id_seq OWNER TO postgres;

--
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 210
-- Name: reactivacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reactivacion_id_seq OWNED BY reactivacion.id;


--
-- TOC entry 212 (class 1259 OID 17477)
-- Name: uoc_certificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE uoc_certificacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE uoc_certificacion_id_seq OWNER TO postgres;

--
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 212
-- Name: uoc_certificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE uoc_certificacion_id_seq OWNED BY uoc_certificacion.id;


--
-- TOC entry 213 (class 1259 OID 17479)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    usuario integer NOT NULL,
    cuenta character varying(100),
    pass character varying(150)
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17482)
-- Name: usuarios_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_usuario_seq OWNER TO postgres;

--
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuarios_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_usuario_seq OWNED BY usuarios.usuario;


--
-- TOC entry 215 (class 1259 OID 17484)
-- Name: viatico_certificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE viatico_certificacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viatico_certificacion_id_seq OWNER TO postgres;

--
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 215
-- Name: viatico_certificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE viatico_certificacion_id_seq OWNED BY viatico_certificacion.id;


--
-- TOC entry 216 (class 1259 OID 17486)
-- Name: viatico_certificacion_numeracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE viatico_certificacion_numeracion (
    id integer NOT NULL,
    fecha date,
    codigo_interno integer DEFAULT 0,
    mes integer DEFAULT 0,
    plan_financiero_id integer,
    tipo_viatico character(1) NOT NULL,
    dolar integer DEFAULT 0,
    anteriores bigint DEFAULT 0
);


ALTER TABLE viatico_certificacion_numeracion OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17492)
-- Name: viatico_certificacion_numeracion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE viatico_certificacion_numeracion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viatico_certificacion_numeracion_id_seq OWNER TO postgres;

--
-- TOC entry 2737 (class 0 OID 0)
-- Dependencies: 217
-- Name: viatico_certificacion_numeracion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE viatico_certificacion_numeracion_id_seq OWNED BY viatico_certificacion_numeracion.id;


--
-- TOC entry 258 (class 1259 OID 42503)
-- Name: viatico_ditribucion_mensual; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE viatico_ditribucion_mensual (
    id integer NOT NULL,
    direccion integer,
    mes integer,
    monto bigint,
    certificado bigint DEFAULT 0
);


ALTER TABLE viatico_ditribucion_mensual OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 42501)
-- Name: viatico_ditribucion_mensual_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE viatico_ditribucion_mensual_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viatico_ditribucion_mensual_id_seq OWNER TO postgres;

--
-- TOC entry 2738 (class 0 OID 0)
-- Dependencies: 257
-- Name: viatico_ditribucion_mensual_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE viatico_ditribucion_mensual_id_seq OWNED BY viatico_ditribucion_mensual.id;


SET search_path = sistema, pg_catalog;

--
-- TOC entry 226 (class 1259 OID 17689)
-- Name: permisos; Type: TABLE; Schema: sistema; Owner: postgres; Tablespace: 
--

CREATE TABLE permisos (
    id integer NOT NULL,
    descripcion character varying,
    path character varying
);


ALTER TABLE permisos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17681)
-- Name: usuarios; Type: TABLE; Schema: sistema; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    usuario integer DEFAULT nextval('public.usuarios_usuario_seq'::regclass) NOT NULL,
    cuenta character varying(100),
    pass character varying(150)
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17699)
-- Name: usuarios_permisos; Type: TABLE; Schema: sistema; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios_permisos (
    id integer NOT NULL,
    usuario integer,
    permiso integer
);


ALTER TABLE usuarios_permisos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17697)
-- Name: usuarios_permisos_id_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE usuarios_permisos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_permisos_id_seq OWNER TO postgres;

--
-- TOC entry 2739 (class 0 OID 0)
-- Dependencies: 227
-- Name: usuarios_permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE usuarios_permisos_id_seq OWNED BY usuarios_permisos.id;


SET search_path = estructura, pg_catalog;

--
-- TOC entry 2374 (class 2604 OID 34291)
-- Name: id; Type: DEFAULT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- TOC entry 2375 (class 2604 OID 34300)
-- Name: id; Type: DEFAULT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY niveles ALTER COLUMN id SET DEFAULT nextval('niveles_id_seq'::regclass);


--
-- TOC entry 2367 (class 2604 OID 34188)
-- Name: id; Type: DEFAULT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY programas ALTER COLUMN id SET DEFAULT nextval('programas_id_seq'::regclass);


--
-- TOC entry 2371 (class 2604 OID 34252)
-- Name: id; Type: DEFAULT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY propositos ALTER COLUMN id SET DEFAULT nextval('propositos_id_seq'::regclass);


--
-- TOC entry 2366 (class 2604 OID 34189)
-- Name: id; Type: DEFAULT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY proyectos ALTER COLUMN id SET DEFAULT nextval('"Proyectos_id_seq"'::regclass);


--
-- TOC entry 2372 (class 2604 OID 34253)
-- Name: id; Type: DEFAULT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY subcomponentes ALTER COLUMN id SET DEFAULT nextval('subcomponentes_id_seq'::regclass);


--
-- TOC entry 2368 (class 2604 OID 34190)
-- Name: id; Type: DEFAULT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY subprogramas ALTER COLUMN id SET DEFAULT nextval('subprogramas_subprograma_seq'::regclass);


SET search_path = presupuesto, pg_catalog;

--
-- TOC entry 2369 (class 2604 OID 34221)
-- Name: id; Type: DEFAULT; Schema: presupuesto; Owner: postgres
--

ALTER TABLE ONLY anteproyecto2017 ALTER COLUMN id SET DEFAULT nextval('presupuesto_vigente_id_seq'::regclass);


--
-- TOC entry 2373 (class 2604 OID 34274)
-- Name: id; Type: DEFAULT; Schema: presupuesto; Owner: postgres
--

ALTER TABLE ONLY distribucion_componente ALTER COLUMN id SET DEFAULT nextval('distribucion_subcomponente_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2264 (class 2604 OID 17494)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cajachica_certificacion ALTER COLUMN id SET DEFAULT nextval('cajachica_certificacion_id_seq'::regclass);


--
-- TOC entry 2277 (class 2604 OID 17495)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cajachica_distribucion ALTER COLUMN id SET DEFAULT nextval('cajachica_distribucion_id_seq'::regclass);


--
-- TOC entry 2353 (class 2604 OID 17749)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cajachica_ejecucion ALTER COLUMN id SET DEFAULT nextval('cajachica_ejecucion_id_seq'::regclass);


--
-- TOC entry 2345 (class 2604 OID 17641)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cdp ALTER COLUMN id SET DEFAULT nextval('cdp_id_seq'::regclass);


--
-- TOC entry 2278 (class 2604 OID 17496)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY direcciones ALTER COLUMN id SET DEFAULT nextval('direcciones_id_seq'::regclass);


--
-- TOC entry 2259 (class 2604 OID 17497)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY distribucion_ingresos ALTER COLUMN id SET DEFAULT nextval('"DistribucionIngresoPF_id_seq"'::regclass);


--
-- TOC entry 2347 (class 2604 OID 17666)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documentos ALTER COLUMN id SET DEFAULT nextval('documentos_id_seq'::regclass);


--
-- TOC entry 2351 (class 2604 OID 17724)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documentos_movimiento ALTER COLUMN id SET DEFAULT nextval('documentos_movimiento_id_seq'::regclass);


--
-- TOC entry 2279 (class 2604 OID 17498)
-- Name: enlace; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enlaces ALTER COLUMN enlace SET DEFAULT nextval('enlaces_enlace_seq'::regclass);


--
-- TOC entry 2346 (class 2604 OID 17652)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estructura ALTER COLUMN id SET DEFAULT nextval('estructura_id_seq'::regclass);


--
-- TOC entry 2280 (class 2604 OID 17499)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario_categoria ALTER COLUMN id SET DEFAULT nextval('funcionario_clasificacion_id_seq'::regclass);


--
-- TOC entry 2293 (class 2604 OID 17500)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingresos_certificacion ALTER COLUMN id SET DEFAULT nextval('ingresos_certificacion_id_seq'::regclass);


--
-- TOC entry 2306 (class 2604 OID 17501)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingresos_ejecucion ALTER COLUMN id SET DEFAULT nextval('ingresos_ejecucion_id_seq'::regclass);


--
-- TOC entry 2308 (class 2604 OID 17629)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY llamados ALTER COLUMN id SET DEFAULT nextval('llamados_id_seq'::regclass);


--
-- TOC entry 2309 (class 2604 OID 17503)
-- Name: persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas ALTER COLUMN persona SET DEFAULT nextval('personas_persona_seq'::regclass);


--
-- TOC entry 2310 (class 2604 OID 17504)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan ALTER COLUMN id SET DEFAULT nextval('plan2016_id_seq'::regclass);


--
-- TOC entry 2311 (class 2604 OID 17505)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_detalle ALTER COLUMN id SET DEFAULT nextval('plan_detalle2016_id_seq'::regclass);


--
-- TOC entry 2324 (class 2604 OID 17506)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_financiero ALTER COLUMN id SET DEFAULT nextval('plan_financiero_id_seq'::regclass);


--
-- TOC entry 2325 (class 2604 OID 17507)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presupuesto_vigente ALTER COLUMN id SET DEFAULT nextval('presupuesto_vigente_id_seq'::regclass);


--
-- TOC entry 2337 (class 2604 OID 17630)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactivacion ALTER COLUMN id SET DEFAULT nextval('reactivacion_id_seq'::regclass);


--
-- TOC entry 2338 (class 2604 OID 17509)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uoc_certificacion ALTER COLUMN id SET DEFAULT nextval('uoc_certificacion_id_seq'::regclass);


--
-- TOC entry 2339 (class 2604 OID 17510)
-- Name: usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN usuario SET DEFAULT nextval('usuarios_usuario_seq'::regclass);


--
-- TOC entry 2336 (class 2604 OID 17511)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viatico_certificacion ALTER COLUMN id SET DEFAULT nextval('viatico_certificacion_id_seq'::regclass);


--
-- TOC entry 2343 (class 2604 OID 17512)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viatico_certificacion_numeracion ALTER COLUMN id SET DEFAULT nextval('viatico_certificacion_numeracion_id_seq'::regclass);


--
-- TOC entry 2376 (class 2604 OID 42506)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viatico_ditribucion_mensual ALTER COLUMN id SET DEFAULT nextval('viatico_ditribucion_mensual_id_seq'::regclass);


SET search_path = sistema, pg_catalog;

--
-- TOC entry 2350 (class 2604 OID 17702)
-- Name: id; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY usuarios_permisos ALTER COLUMN id SET DEFAULT nextval('usuarios_permisos_id_seq'::regclass);


SET search_path = estructura, pg_catalog;

--
-- TOC entry 2740 (class 0 OID 0)
-- Dependencies: 237
-- Name: Proyectos_id_seq; Type: SEQUENCE SET; Schema: estructura; Owner: postgres
--

SELECT pg_catalog.setval('"Proyectos_id_seq"', 24, true);


--
-- TOC entry 2683 (class 0 OID 34224)
-- Dependencies: 245
-- Data for Name: componentes; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY componentes (componente, eje, descripcion) FROM stdin;
1	1	Remuneraciones Básicas Personal Docente  (sueldos, gastos de representacion y aguinaldo)
2	1	Creaciones por Crecimiento Natural de Secciones
3	1	Beneficios Docentes
4	1	Alimentación Escolar (Merienda y Almuerzo)
5	1	Canastas Básicas de Útiles Escolares
6	1	Costo de Distribución de Canastas
7	1	Becas
8	1	Educación Inclusiva (incluye Cepadis y Centro de Rehabilitación para Personas Ciegas)
9	1	Gratuidad de la Educación Media
10	1	Gratuidad de la EEB
11	1	Educación Escolar Indígena
12	1	Planes y Programas de Alfabetización
13	1	I.P.A.
14	2	Textos y Materiales Didácticos
15	2	Equipamientos de Aulas Temáticas
19	2	Proyectos del MEC incluye FONACIDE
16	2	Investigación Educativa
17	2	Formación de Profesionales Docentes incluye Capacitación Docente
18	2	Instituto Superior de Educación (ISE)
20	2	INVERSIÓN 28% FONACIDE
21	2	Otras Giradurias (CONEC )
22	3	Conservatorio Nacional de Música e Instituto de Bellas Artes (Funcionamiento)
23	3	Remuneraciones Básicas Personal Administrativo  (sueldos, dietas, gastos de representacion y aguinaldo)
24	3	Otros Gastos del Personal
25	3	Centros Regionales
26	3	Organismos Internacionales
27	3	Servicios Básicos
28	3	Remuneraciones Básicas Personal Contratado
29	3	Gastos Judiciales
30	3	Alquileres
31	3	Beneficios Administrativos
32	3	Gastos de Funcionamiento
\.


--
-- TOC entry 2684 (class 0 OID 34230)
-- Dependencies: 246
-- Data for Name: ejes; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY ejes (eje, descripcion) FROM stdin;
1	Acceso
2	Calidad
3	Gestion
\.


--
-- TOC entry 2692 (class 0 OID 34288)
-- Dependencies: 254
-- Data for Name: items; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY items (id, nivel, descripcion) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 0)
-- Dependencies: 253
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: estructura; Owner: postgres
--

SELECT pg_catalog.setval('items_id_seq', 9, true);


--
-- TOC entry 2694 (class 0 OID 34297)
-- Dependencies: 256
-- Data for Name: niveles; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY niveles (id, componente, descripcion) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 0)
-- Dependencies: 255
-- Name: niveles_id_seq; Type: SEQUENCE SET; Schema: estructura; Owner: postgres
--

SELECT pg_catalog.setval('niveles_id_seq', 19, true);


--
-- TOC entry 2676 (class 0 OID 34166)
-- Dependencies: 238
-- Data for Name: programas; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY programas (id, tp, pg, descripcion) FROM stdin;
69	1	1	Administración General
70	1	0	*
71	2	1	Desarrollo Social Equitativo
\.


--
-- TOC entry 2743 (class 0 OID 0)
-- Dependencies: 239
-- Name: programas_id_seq; Type: SEQUENCE SET; Schema: estructura; Owner: postgres
--

SELECT pg_catalog.setval('programas_id_seq', 71, true);


--
-- TOC entry 2685 (class 0 OID 34236)
-- Dependencies: 247
-- Data for Name: propositos; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY propositos (id, item, descripcion) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 0)
-- Dependencies: 248
-- Name: propositos_id_seq; Type: SEQUENCE SET; Schema: estructura; Owner: postgres
--

SELECT pg_catalog.setval('propositos_id_seq', 9, true);


--
-- TOC entry 2674 (class 0 OID 34158)
-- Dependencies: 236
-- Data for Name: proyectos; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY proyectos (id, subprograma, tp, pg, sp, py, descripcion) FROM stdin;
9	16	1	1	0	0	*
10	17	2	1	1	0	*
11	26	2	1	14	0	
13	27	2	1	10	0	
14	23	2	1	7	0	
15	21	2	1	5	0	
16	25	2	1	9	0	
17	29	2	1	15	0	
18	24	2	1	8	0	
19	18	2	1	2	0	
20	20	2	1	4	0	
21	28	2	1	11	0	
22	19	2	1	3	0	
23	22	2	1	6	0	
\.


--
-- TOC entry 2687 (class 0 OID 34244)
-- Dependencies: 249
-- Data for Name: subcomponentes; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY subcomponentes (id, componente, descripcion) FROM stdin;
7	1	Prueba
\.


--
-- TOC entry 2745 (class 0 OID 0)
-- Dependencies: 250
-- Name: subcomponentes_id_seq; Type: SEQUENCE SET; Schema: estructura; Owner: postgres
--

SELECT pg_catalog.setval('subcomponentes_id_seq', 7, true);


--
-- TOC entry 2678 (class 0 OID 34174)
-- Dependencies: 240
-- Data for Name: subprogramas; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY subprogramas (id, tp, pg, sp, programa, descripcion) FROM stdin;
16	1	1	0	69	*
17	2	1	1	71	Educación Inicial y Escolar Básica
18	2	1	2	71	Educación Media
19	2	1	3	71	Educación Superior
20	2	1	4	71	Formación de Músicos en los Distintos Géneros de Música
21	2	1	5	71	Investigación Educativa
22	2	1	6	71	Instituto Superior de Bellas Artes
23	2	1	7	71	Instituto Superior de Educación
24	2	1	8	71	Formación de Personas Jóvenes y Adultas
25	2	1	9	71	Servicios Educativos de los Centro Regionales
26	2	1	14	71	Dirección General de Planificación Educativa
27	2	1	10	71	Educación Inclusiva
28	2	1	11	71	Educación Escolar Indígena
29	2	1	15	71	Consejo Nacional de Educación y Cultura
\.


--
-- TOC entry 2746 (class 0 OID 0)
-- Dependencies: 241
-- Name: subprogramas_subprograma_seq; Type: SEQUENCE SET; Schema: estructura; Owner: postgres
--

SELECT pg_catalog.setval('subprogramas_subprograma_seq', 29, true);


--
-- TOC entry 2680 (class 0 OID 34182)
-- Dependencies: 242
-- Data for Name: tipos; Type: TABLE DATA; Schema: estructura; Owner: postgres
--

COPY tipos (tipo, descripcion) FROM stdin;
1	Programas de Administración
2	Programas de Acción
3	Programas de Inversión 
\.


SET search_path = presupuesto, pg_catalog;

--
-- TOC entry 2681 (class 0 OID 34215)
-- Dependencies: 243
-- Data for Name: anteproyecto2017; Type: TABLE DATA; Schema: presupuesto; Owner: postgres
--

COPY anteproyecto2017 (id, tp, pg, sp, py, obj, ff, of, dpt, producto, vigente, ideal) FROM stdin;
120	2	1	1	0	220	10	1	99	36	18662276743	22018240569
49	1	1	0	0	811	10	126	99	1213	0	0
2	1	1	0	0	112	10	1	99	1213	248472000	0
3	1	1	0	0	113	10	1	99	1213	38253925200	0
4	1	1	0	0	114	10	1	99	1213	9835735316	0
5	1	1	0	0	123	10	1	99	1213	2604327905	0
6	1	1	0	0	123	30	1	99	1213	360614356	0
7	1	1	0	0	125	10	1	99	1213	1442342740	0
8	1	1	0	0	131	10	1	99	1213	77442591776	0
9	1	1	0	0	132	10	1	99	1213	403060982015	0
10	1	1	0	0	133	10	1	99	1213	15312518708	0
11	1	1	0	0	133	30	1	99	1213	200000000	0
12	1	1	0	0	134	10	1	99	1213	355661282	0
13	1	1	0	0	137	10	1	99	1213	788840000	0
14	1	1	0	0	141	10	1	99	1213	722610804	0
660	2	1	1	0	125	10	1	99	563	0	202730944
661	2	1	1	0	133	10	1	99	563	0	459332536
662	2	1	1	0	530	10	1	99	563	0	15381250000
663	2	1	1	0	852	10	1	99	1032	0	3500000000
103	2	1	1	0	114	10	1	6	563	6617742384	0
307	2	1	8	0	114	10	1	11	77	1031572527	0
207	2	1	3	0	113	10	1	99	561	522000000	0
208	2	1	3	0	114	10	1	0	561	308582545	0
209	2	1	3	0	114	10	1	1	561	74056240	0
210	2	1	3	0	114	10	1	2	561	238106206	0
211	2	1	3	0	114	10	1	3	561	198330935	0
212	2	1	3	0	114	10	1	4	561	41792420	0
213	2	1	3	0	114	10	1	5	561	213605266	0
214	2	1	3	0	114	10	1	6	561	135250296	0
215	2	1	3	0	114	10	1	7	561	130084028	0
216	2	1	3	0	114	10	1	8	561	247958867	0
217	2	1	3	0	114	10	1	9	561	230666872	0
218	2	1	3	0	114	10	1	10	561	11133980	0
219	2	1	3	0	114	10	1	11	561	18333180	0
220	2	1	3	0	114	10	1	12	561	33161248	0
221	2	1	3	0	114	10	1	13	561	13733980	0
222	2	1	3	0	114	10	1	14	561	37892272	0
223	2	1	3	0	114	10	1	15	561	66160710	0
224	2	1	3	0	114	10	1	16	561	3499200	0
225	2	1	3	0	114	10	1	99	561	411677332	0
226	2	1	3	0	123	10	1	99	561	259561282	0
227	2	1	3	0	123	10	1	99	1224	6100000	0
228	2	1	3	0	125	10	1	99	561	65699999	0
229	2	1	3	0	134	10	1	99	561	298900222	0
230	2	1	3	0	144	10	1	99	24	289094810	0
231	2	1	3	0	230	10	1	99	24	1424157609	0
232	2	1	3	0	360	10	1	99	561	81675000	0
233	2	1	3	0	530	10	1	99	561	5000000	0
234	2	1	3	0	540	10	1	99	561	28800000	0
50	1	1	0	0	811	10	128	99	1213	0	0
236	2	1	3	0	894	30	1	99	561	344741200	0
237	2	1	4	0	111	10	1	99	61	8427518736	0
238	2	1	4	0	113	10	1	99	61	25972800	0
239	2	1	4	0	114	10	1	99	61	704457628	0
240	2	1	4	0	134	10	1	99	61	95228113	0
241	2	1	4	0	144	10	1	99	61	25412500	0
242	2	1	4	0	191	10	1	99	61	14382000	0
243	2	1	4	0	210	10	1	99	61	34352640	0
244	2	1	4	0	230	10	1	99	61	1682326	0
245	2	1	4	0	240	10	1	99	61	4262440	0
246	2	1	4	0	250	10	1	99	61	40000000	0
247	2	1	4	0	280	10	1	99	61	6523044	0
248	2	1	4	0	834	30	1	99	61	606430800	0
249	2	1	4	0	894	30	1	99	61	67381200	0
250	2	1	5	0	210	10	1	99	1230	40000000	0
251	2	1	5	0	260	10	1	99	1230	548101632	0
252	2	1	5	0	280	10	1	99	1230	8835000	0
253	2	1	5	0	290	10	1	99	1230	25000000	0
254	2	1	5	0	540	10	1	99	1230	13692154	0
255	2	1	6	0	111	10	1	99	61	5470041624	0
256	2	1	6	0	114	10	1	99	61	455836802	0
257	2	1	7	0	111	10	1	99	61	8993610252	0
258	2	1	7	0	113	10	1	99	61	25972800	0
259	2	1	7	0	114	10	1	99	61	751631921	0
260	2	1	7	0	134	10	1	99	61	103782169	0
261	2	1	7	0	230	10	1	99	61	5265680	0
262	2	1	7	0	834	30	1	99	61	4319185050	0
263	2	1	7	0	894	30	1	99	61	479909450	0
264	2	1	8	0	111	10	1	0	77	36936163608	0
265	2	1	8	0	111	10	1	1	77	4934584296	0
266	2	1	2	0	834	10	1	99	1032	11206345400	0
267	2	1	2	0	894	10	1	99	1032	11272045400	0
268	2	1	3	0	540	10	1	99	24	10100000	0
269	2	1	3	0	145	10	1	99	561	338444517	0
270	2	1	3	0	199	10	1	99	561	655617873	0
271	2	1	6	0	123	10	1	0	61	804100	0
272	2	1	6	0	134	10	1	0	61	77394890	0
273	2	1	6	0	230	10	1	0	61	2426237	0
274	2	1	6	0	530	10	1	0	61	17508161	0
275	2	1	6	0	540	10	1	0	61	10900000	0
276	2	1	6	0	834	30	1	0	61	700253550	0
277	2	1	6	0	894	30	1	0	61	77805950	0
278	2	1	8	0	260	10	1	99	38	1935226721	0
279	2	1	8	0	111	10	1	2	77	6315270600	0
280	2	1	8	0	111	10	1	3	77	6927372804	0
281	2	1	8	0	111	10	1	4	77	4016472900	0
282	2	1	8	0	111	10	1	5	77	4955559444	0
283	2	1	8	0	111	10	1	6	77	4830715908	0
410	2	1	15	0	210	10	1	99	1229	50400000	0
119	2	1	1	0	210	10	1	99	563	354099544	354099544
116	2	1	1	0	123	10	1	99	563	218323014	405461472
121	2	1	1	0	230	10	1	99	563	161071595	1000000000
115	2	1	1	0	114	10	1	99	563	17468318073	0
15	1	1	0	0	143	10	1	99	1213	10275898898	0
16	1	1	0	0	144	10	1	99	1213	5697517837	0
17	1	1	0	0	144	30	1	99	1213	139249877	0
18	1	1	0	0	145	10	1	99	1213	2068615444	0
19	1	1	0	0	145	30	1	99	1213	43605000	0
20	1	1	0	0	191	10	1	99	1213	12533088750	0
21	1	1	0	0	199	10	1	99	1213	17754507758	0
22	1	1	0	0	210	10	1	99	1213	158270948131	0
23	1	1	0	0	210	30	1	99	1213	283500000	0
24	1	1	0	0	230	30	1	99	1213	861866415	0
25	1	1	0	0	240	10	1	99	1213	163631853	0
26	1	1	0	0	240	30	1	99	1213	66522712	0
27	1	1	0	0	240	30	302	99	1213	100000000	0
28	1	1	0	0	250	10	1	99	1213	9540342416	0
29	1	1	0	0	250	30	1	99	1213	1466558625	0
30	1	1	0	0	260	10	1	99	1213	1058301497	0
31	1	1	0	0	260	30	1	99	1213	61370000	0
32	1	1	0	0	260	30	302	99	1213	837953418	0
35	1	1	0	0	290	10	1	99	1213	56863442	0
36	1	1	0	0	290	30	1	99	1213	6500000	0
37	1	1	0	0	320	10	1	99	1213	68784750	0
38	1	1	0	0	320	30	1	99	1213	25000000	0
39	1	1	0	0	330	10	1	99	1213	65781540	0
40	1	1	0	0	330	30	1	99	1213	673032558	0
41	1	1	0	0	340	10	1	99	1213	342247937	0
42	1	1	0	0	340	30	1	99	1213	251239362	0
43	1	1	0	0	350	10	1	99	1213	10037625	0
44	1	1	0	0	360	10	1	99	1213	95372781	0
45	1	1	0	0	360	30	1	99	1213	527961105	0
46	1	1	0	0	390	10	1	99	1213	8769000	0
47	1	1	0	0	540	10	1	99	1213	930391250	0
48	1	1	0	0	540	30	1	99	1213	500000000	0
62	1	1	0	0	834	30	1	99	1213	5198659120	0
63	1	1	0	0	841	10	1	99	1213	13986350000	0
64	1	1	0	0	851	10	1	99	1213	1570470656	0
67	1	1	0	0	894	30	1	99	1213	616517680	0
68	1	1	0	0	910	10	1	99	1213	2069541161	0
69	1	1	0	0	910	30	1	99	1213	235433709	0
70	2	1	1	0	111	10	1	0	563	120947485752	0
71	2	1	1	0	111	10	1	1	563	90154926828	0
72	2	1	1	0	111	10	1	2	563	189654235032	0
73	2	1	1	0	111	10	1	3	563	99125971476	0
74	2	1	1	0	111	10	1	4	563	84022925772	0
75	2	1	1	0	111	10	1	5	563	209569799172	0
76	2	1	1	0	111	10	1	6	563	79412908608	0
77	2	1	1	0	111	10	1	7	563	166808093220	0
78	2	1	1	0	111	10	1	8	563	43955557260	0
79	2	1	1	0	111	10	1	9	563	115029877860	0
80	2	1	1	0	111	10	1	10	563	182752569912	0
81	2	1	1	0	111	10	1	11	563	324549630972	0
82	2	1	1	0	111	10	1	12	563	29287142520	0
83	2	1	1	0	111	10	1	13	563	32612047212	0
84	2	1	1	0	111	10	1	14	563	78015239940	0
85	1	1	0	0	230	10	1	99	1213	50000000	0
86	1	1	0	0	280	30	302	99	1213	59393500	0
87	1	1	0	0	350	30	302	99	1213	50000000	0
88	1	1	0	0	390	30	302	99	1213	35642800	0
89	1	1	0	0	520	10	3	99	1213	620000000	0
90	1	1	0	0	540	10	3	99	1213	1841799999	0
91	1	1	0	0	853	10	1	0	1213	1360507665	0
92	1	1	0	0	853	30	1	0	1213	233479246	0
93	2	1	1	0	111	10	1	15	563	49098604812	0
94	2	1	1	0	111	10	1	16	563	7164383964	0
95	2	1	1	0	111	10	1	17	563	6100367604	0
96	2	1	1	0	111	10	1	99	563	209619816876	0
97	2	1	1	0	114	10	1	0	563	10078957146	0
98	2	1	1	0	114	10	1	1	563	7512910569	0
99	2	1	1	0	114	10	1	2	563	15804519586	0
100	2	1	1	0	114	10	1	3	563	8260497623	0
101	2	1	1	0	114	10	1	4	563	7001910481	0
102	2	1	1	0	114	10	1	5	563	17464149931	0
33	1	1	0	0	280	10	1	99	1213	168570455	0
34	1	1	0	0	280	30	1	99	1213	25582000	0
104	2	1	1	0	114	10	1	7	563	13900674435	0
105	2	1	1	0	114	10	1	8	563	3662963105	0
106	2	1	1	0	114	10	1	9	563	9585823155	0
107	2	1	1	0	114	10	1	10	563	15229380826	0
108	2	1	1	0	114	10	1	11	563	27045802581	0
109	2	1	1	0	114	10	1	12	563	2440595210	0
110	2	1	1	0	114	10	1	13	563	2717670601	0
111	2	1	1	0	114	10	1	14	563	6501269995	0
112	2	1	1	0	114	10	1	15	563	4091550401	0
113	2	1	1	0	114	10	1	16	563	597031997	0
114	2	1	1	0	114	10	1	17	563	508363967	0
117	2	1	1	0	134	10	1	99	563	67233196964	0
118	2	1	1	0	199	10	1	99	563	3486954163	0
635	2	1	14	0	280	10	1	99	1228	0	0
123	2	1	1	0	240	10	1	99	563	51833600	120000000
124	2	1	1	0	250	10	1	99	563	382079901	653125810
126	2	1	1	0	330	10	1	99	563	512320600	21270000
128	2	1	1	0	360	10	1	99	563	123319561	360000000
131	2	1	1	0	540	10	1	99	563	914433177	4340543000
127	2	1	1	0	340	10	1	99	36	46761921320	67078209080
125	2	1	1	0	330	10	1	99	38	1752825630	8536332400
129	2	1	1	0	530	10	1	99	38	3377812431	12000000000
132	2	1	1	0	848	10	1	99	1312	96629329837	116380521936
122	2	1	1	0	230	30	302	99	563	459381072	0
616	3	1	0	8	340	30	76	99	1181	0	0
130	2	1	1	0	530	10	3	99	563	13505894924	0
133	2	1	2	0	111	10	1	0	561	109812990552	0
134	2	1	2	0	111	10	1	1	561	27028167708	0
135	2	1	2	0	111	10	1	2	561	64195324680	0
136	2	1	2	0	111	10	1	3	561	41618607768	0
137	2	1	2	0	111	10	1	4	561	27253520784	0
138	2	1	2	0	111	10	1	5	561	71060258976	0
179	2	1	1	0	834	10	1	99	1032	23347500000	48323300000
180	2	1	1	0	894	10	1	99	1032	3500000000	10435000000
183	2	1	1	0	520	10	1	99	1322	2300000000	76136838552
139	2	1	2	0	111	10	1	6	561	23163278280	0
140	2	1	2	0	111	10	1	7	561	48293509812	0
141	2	1	2	0	111	10	1	8	561	24904961268	0
142	2	1	2	0	111	10	1	9	561	41900168376	0
143	2	1	2	0	111	10	1	10	561	48607939776	0
144	2	1	2	0	111	10	1	11	561	126035972052	0
145	2	1	2	0	111	10	1	12	561	15401493492	0
146	2	1	2	0	111	10	1	13	561	10330178340	0
147	2	1	2	0	111	10	1	14	561	18124229520	0
148	2	1	2	0	111	10	1	15	561	13301480772	0
149	2	1	2	0	111	10	1	16	561	3281783940	0
150	2	1	2	0	111	10	1	17	561	2809517940	0
151	2	1	2	0	111	10	1	99	561	107349033384	0
152	2	1	2	0	114	10	1	0	561	9151082546	0
153	2	1	2	0	114	10	1	1	561	2252347309	0
154	2	1	2	0	114	10	1	2	561	5349610390	0
155	2	1	2	0	114	10	1	3	561	3468217314	0
156	2	1	2	0	114	10	1	4	561	2271126732	0
157	2	1	2	0	114	10	1	5	561	5921688248	0
158	2	1	2	0	114	10	1	6	561	1930273190	0
159	2	1	2	0	114	10	1	7	561	4024459151	0
160	2	1	2	0	114	10	1	8	561	2075413439	0
161	2	1	2	0	114	10	1	9	561	3491680698	0
162	2	1	2	0	114	10	1	10	561	4050661648	0
163	2	1	2	0	114	10	1	11	561	10502997671	0
164	2	1	2	0	114	10	1	12	561	1283457791	0
165	2	1	2	0	114	10	1	13	561	860848195	0
166	2	1	2	0	114	10	1	14	561	1510352460	0
167	2	1	2	0	114	10	1	15	561	1108456731	0
168	2	1	2	0	114	10	1	16	561	273481995	0
169	2	1	2	0	114	10	1	17	561	234126495	0
170	2	1	2	0	114	10	1	99	561	8945752782	0
171	2	1	2	0	134	10	1	99	561	8026547473	0
172	2	1	2	0	199	10	1	99	561	14521100	0
173	2	1	2	0	220	10	1	99	36	833157744	0
174	2	1	2	0	230	10	1	99	561	116232381	0
175	2	1	2	0	240	10	1	99	561	48360000	0
177	2	1	1	0	510	10	1	99	563	112000000	0
178	2	1	1	0	510	10	3	99	563	1492953480	0
181	2	1	1	0	520	10	1	99	1318	2517317554	0
182	2	1	1	0	520	10	3	99	1318	3955884415	0
184	2	1	2	0	230	30	302	99	561	104532440	0
185	2	1	2	0	340	10	1	99	36	14968031721	0
186	2	1	2	0	360	10	1	99	561	966515	0
187	2	1	2	0	540	10	1	99	561	203707987	0
188	2	1	3	0	111	10	1	0	561	3671886540	0
189	2	1	3	0	111	10	1	1	561	888674880	0
190	2	1	3	0	111	10	1	2	561	2857274472	0
191	2	1	3	0	111	10	1	3	561	2379971220	0
192	2	1	3	0	111	10	1	4	561	501509040	0
193	2	1	3	0	111	10	1	5	561	2563263192	0
194	2	1	3	0	111	10	1	6	561	1623003552	0
195	2	1	3	0	111	10	1	7	561	1561008336	0
196	2	1	3	0	111	10	1	8	561	2975506404	0
197	2	1	3	0	111	10	1	9	561	2768002464	0
198	2	1	3	0	111	10	1	10	561	133607760	0
199	2	1	3	0	111	10	1	11	561	219998160	0
200	2	1	3	0	111	10	1	12	561	397934976	0
201	2	1	3	0	111	10	1	13	561	164807760	0
202	2	1	3	0	111	10	1	14	561	454707264	0
203	2	1	3	0	111	10	1	15	561	793928520	0
204	2	1	3	0	111	10	1	16	561	41990400	0
176	2	1	1	0	340	30	302	99	563	539995817	0
205	2	1	3	0	111	10	1	99	561	4418127984	0
206	2	1	3	0	113	10	1	0	561	31104000	0
284	2	1	8	0	111	10	1	7	77	3812977620	0
285	2	1	8	0	111	10	1	8	77	3512546964	0
286	2	1	8	0	111	10	1	9	77	3165202524	0
287	2	1	8	0	111	10	1	10	77	6040147776	0
288	2	1	8	0	111	10	1	11	77	12378870324	0
289	2	1	8	0	111	10	1	12	77	1941930408	0
290	2	1	8	0	111	10	1	13	77	3164204256	0
291	2	1	8	0	111	10	1	14	77	2144226744	0
292	2	1	8	0	111	10	1	15	77	2206540512	0
293	2	1	8	0	111	10	1	16	77	824956248	0
294	2	1	8	0	111	10	1	17	77	806102376	0
295	2	1	8	0	111	10	1	99	77	73546809312	0
296	2	1	8	0	114	10	1	0	77	3078013634	0
297	2	1	8	0	114	10	1	1	77	411215358	0
298	2	1	8	0	114	10	1	2	77	526272550	0
299	2	1	8	0	114	10	1	3	77	577281067	0
300	2	1	8	0	114	10	1	4	77	334706075	0
301	2	1	8	0	114	10	1	5	77	412963287	0
302	2	1	8	0	114	10	1	6	77	402559659	0
303	2	1	8	0	114	10	1	7	77	317748135	0
304	2	1	8	0	114	10	1	8	77	292712247	0
305	2	1	8	0	114	10	1	9	77	263766877	0
306	2	1	8	0	114	10	1	10	77	503345648	0
308	2	1	8	0	114	10	1	12	77	161827534	0
309	2	1	8	0	114	10	1	13	77	263683688	0
310	2	1	8	0	114	10	1	14	77	178685562	0
311	2	1	8	0	114	10	1	15	77	183878376	0
312	2	1	8	0	114	10	1	16	77	68746354	0
313	2	1	8	0	114	10	1	17	77	67175198	0
314	2	1	8	0	114	10	1	99	77	6128900776	0
315	2	1	8	0	123	10	1	99	77	187140408	0
316	2	1	8	0	125	10	1	99	77	144722501	0
317	2	1	8	0	134	10	1	99	77	2362837205	0
318	2	1	8	0	144	10	1	99	77	61588995	0
319	2	1	8	0	144	10	1	99	1158	148616940	0
320	2	1	8	0	145	10	1	99	77	176255216	0
321	2	1	8	0	145	10	1	99	1158	220744056	0
322	2	1	8	0	199	10	1	99	77	866052644	0
323	2	1	8	0	220	10	1	99	36	153072629	0
324	2	1	8	0	230	10	1	99	77	494670000	0
325	2	1	8	0	230	10	1	99	1158	803550000	0
326	2	1	8	0	240	10	1	99	77	19222484	0
51	1	1	0	0	811	10	171	11	1213	0	0
328	2	1	8	0	280	10	1	99	77	55000000	0
329	2	1	8	0	280	10	1	99	1158	28215000	0
330	2	1	8	0	330	10	1	99	77	51127377	0
401	2	1	14	0	540	10	1	99	1228	33037500	0
332	2	1	8	0	340	10	1	99	36	2509506830	0
333	2	1	8	0	360	10	1	99	77	24394212	0
334	2	1	8	0	360	10	1	99	1158	429943788	0
335	2	1	8	0	520	10	1	99	77	20000000	0
336	2	1	8	0	540	10	1	99	77	316250000	0
337	2	1	8	0	834	30	1	99	77	2989435500	0
338	2	1	8	0	894	30	1	99	77	332159500	0
339	2	1	9	0	111	10	1	1	561	7986467412	0
340	2	1	9	0	111	10	1	4	561	5986921908	0
341	2	1	9	0	111	10	1	7	561	7113314892	0
342	2	1	9	0	111	10	1	10	561	6759675660	0
343	2	1	9	0	111	10	1	11	561	7324141968	0
344	2	1	9	0	111	10	1	12	561	4615906248	0
345	2	1	9	0	111	10	1	13	561	5409995724	0
346	2	1	9	0	111	10	1	99	561	4597547952	0
347	2	1	9	0	113	10	1	1	561	2160000	0
348	2	1	9	0	113	10	1	4	561	2160000	0
349	2	1	9	0	113	10	1	7	561	2160000	0
350	2	1	9	0	113	10	1	10	561	2160000	0
351	2	1	9	0	113	10	1	11	561	4320000	0
352	2	1	9	0	113	10	1	12	561	2160000	0
353	2	1	9	0	113	10	1	13	561	2160000	0
354	2	1	9	0	114	10	1	1	561	665718951	0
355	2	1	9	0	114	10	1	4	561	499090159	0
356	2	1	9	0	114	10	1	7	561	592956241	0
357	2	1	9	0	114	10	1	10	561	563486305	0
358	2	1	9	0	114	10	1	11	561	610705164	0
359	2	1	9	0	114	10	1	12	561	384838854	0
360	2	1	9	0	114	10	1	13	561	451012977	0
361	2	1	9	0	114	10	1	99	561	383128996	0
362	2	1	9	0	134	10	1	99	561	511643317	0
363	2	1	9	0	834	30	1	99	561	692632350	0
364	2	1	9	0	894	30	1	99	561	76959150	0
365	2	1	10	0	111	10	1	99	561	6563127840	0
366	2	1	10	0	113	10	1	99	561	79593600	0
367	2	1	10	0	114	10	1	99	561	553560120	0
368	2	1	10	0	123	10	1	99	561	110341630	0
369	2	1	8	0	540	10	1	99	1158	116875000	0
370	2	1	8	0	847	10	1	99	1158	2000000000	0
371	2	1	10	0	125	10	1	99	561	83950000	0
372	2	1	10	0	134	10	1	99	561	61548519	0
373	2	1	10	0	145	10	1	99	561	457224100	0
374	2	1	10	0	191	10	1	99	561	26400000	0
375	2	1	10	0	199	10	1	99	561	39763919	0
376	2	1	10	0	210	10	1	99	561	852699984	0
377	2	1	10	0	230	10	1	99	561	257394490	0
379	2	1	10	0	280	10	1	99	561	52023186	0
381	2	1	10	0	360	10	1	99	561	58981015	0
382	2	1	10	0	540	10	1	99	561	247277500	0
383	2	1	10	0	540	10	1	99	1210	247277500	0
384	2	1	11	0	111	10	1	99	561	2017777320	0
385	2	1	11	0	113	10	1	99	561	79593600	0
386	2	1	11	0	114	10	1	99	561	174780910	0
387	2	1	11	0	123	10	1	99	561	108038651	0
388	2	1	11	0	125	10	1	99	561	129034712	0
389	2	1	11	0	191	10	1	99	561	96000000	0
390	2	1	11	0	210	10	1	99	561	56000000	0
391	2	1	11	0	290	10	1	99	561	18136558	0
392	2	1	11	0	340	10	1	99	561	8807575	0
393	2	1	11	0	360	10	1	99	561	4198813	0
394	2	1	11	0	540	10	1	99	561	41392000	0
397	2	1	14	0	145	30	302	99	1228	141497755	0
399	2	1	14	0	280	30	302	99	1228	56149903	0
403	2	1	15	0	111	10	1	99	1229	812400000	0
404	2	1	15	0	112	10	1	99	1229	527443200	0
405	2	1	15	0	113	10	1	99	1229	27648000	0
406	2	1	15	0	114	10	1	99	1229	113957600	0
407	2	1	15	0	131	10	1	99	1229	7000000	0
408	2	1	15	0	133	10	1	99	1229	178923077	0
409	2	1	15	0	191	10	1	99	1229	38400000	0
378	2	1	10	0	240	10	1	99	561	149608990	0
380	2	1	10	0	330	10	1	99	561	0	0
395	2	1	14	0	123	10	1	99	1228	57789565	0
396	2	1	14	0	125	10	1	99	1228	23793423	0
398	2	1	14	0	240	10	1	99	1228	77968526	0
402	2	1	14	0	851	10	1	99	1228	70000000	0
411	2	1	15	0	230	10	1	99	1229	208121866	0
412	2	1	15	0	260	10	1	99	1229	139350001	0
413	2	1	15	0	290	10	1	99	1229	50000000	0
414	2	1	15	0	330	10	1	99	1229	10500000	0
415	2	1	15	0	340	10	1	99	1229	13600000	0
416	2	1	15	0	360	10	1	99	1229	19032300	0
417	2	1	15	0	530	10	1	99	1229	3750000	0
418	2	1	15	0	540	10	1	99	1229	20875000	0
52	1	1	0	0	811	10	172	10	1213	0	0
53	1	1	0	0	811	10	173	12	1213	0	0
54	1	1	0	0	811	10	174	7	1213	0	0
55	1	1	0	0	811	10	175	1	1213	0	0
56	1	1	0	0	811	10	176	4	1213	0	0
57	1	1	0	0	811	10	177	5	1213	0	0
58	1	1	0	0	811	10	178	14	1213	0	0
59	1	1	0	0	811	10	181	99	1213	0	0
60	1	1	0	0	811	10	182	99	1213	0	0
61	1	1	0	0	811	30	126	99	1213	0	0
65	1	1	0	0	861	10	126	99	1213	0	0
66	1	1	0	0	861	10	171	11	1213	0	0
452	2	1	14	0	340	10	1	99	1228	187000000	0
449	2	1	10	0	834	10	1	99	561	409380064	0
451	2	1	11	0	199	10	1	99	561	2799441	0
419	3	1	0	1	123	10	1	99	542	0	0
649	2	1	2	0	123	10	1	99	561	0	0
650	2	1	2	0	125	10	1	99	561	0	0
651	2	1	2	0	133	10	1	99	561	0	0
652	2	1	2	0	210	10	1	99	561	0	0
653	2	1	2	0	260	10	1	99	561	0	0
654	2	1	2	0	290	10	1	99	561	0	0
655	2	1	2	0	330	10	1	99	561	0	0
656	2	1	2	0	340	10	1	99	561	0	0
657	2	1	2	0	520	10	1	99	1322	0	0
658	2	1	2	0	530	10	1	99	561	0	0
659	2	1	2	0	848	10	1	99	561	0	0
617	3	1	0	8	360	30	76	99	24	0	0
618	3	1	0	8	360	30	76	99	1181	0	0
1	1	1	0	0	111	10	1	99	1213	79526426592	0
619	3	1	0	8	520	30	76	99	1322	0	0
620	3	1	0	8	530	30	76	99	1322	0	0
631	2	1	14	0	330	10	1	99	1228	0	0
623	2	1	3	0	260	30	1	99	561	82500000	0
235	2	1	3	0	834	30	1	99	561	3020170800	0
327	2	1	8	0	240	10	1	99	1158	552342980	0
331	2	1	8	0	330	10	1	99	1158	1235414045	0
624	2	1	8	0	960	10	1	99	1158	55391090	0
450	2	1	10	0	330	10	1	99	1210	46032025	0
625	2	1	10	0	240	10	1	99	1210	230391010	0
627	1	1	0	0	310	10	1	99	1213	7760000	0
628	1	1	0	0	310	10	1	99	1213	50000000	0
629	2	1	1	0	390	30	302	99	563	200000000	0
400	2	1	14	0	360	10	1	99	1228	109324883	0
632	2	1	14	0	891	10	1	99	1228	0	0
634	2	1	14	0	133	10	1	99	1228	0	0
630	2	1	14	0	141	10	1	99	1228	0	0
633	2	1	14	0	230	10	1	99	1228	0	0
626	2	1	14	0	260	10	1	99	1228	53000000	0
420	3	1	0	1	125	10	1	99	542	0	0
421	3	1	0	1	137	10	1	99	542	0	0
422	3	1	0	1	137	20	401	99	542	0	0
423	3	1	0	1	137	20	401	99	926	0	0
424	3	1	0	1	141	10	1	99	542	0	0
425	3	1	0	1	141	20	401	99	542	0	0
426	3	1	0	1	144	10	1	99	542	0	0
427	3	1	0	1	144	10	1	99	926	0	0
428	3	1	0	1	145	10	1	99	542	0	0
429	3	1	0	1	145	10	1	99	926	0	0
430	3	1	0	1	145	20	401	99	542	0	0
431	3	1	0	1	145	20	401	99	926	0	0
432	3	1	0	1	230	10	1	99	542	0	0
433	3	1	0	1	230	20	401	99	542	0	0
434	3	1	0	1	230	20	401	99	926	0	0
435	3	1	0	1	240	10	1	99	542	0	0
436	3	1	0	1	240	20	401	99	542	0	0
437	3	1	0	1	250	10	1	99	542	0	0
438	3	1	0	1	260	10	1	99	542	0	0
439	3	1	0	1	260	10	1	99	926	0	0
440	3	1	0	1	260	20	401	99	542	0	0
441	3	1	0	1	260	20	401	99	926	0	0
442	3	1	0	1	280	10	1	99	542	0	0
443	3	1	0	1	280	20	401	99	542	0	0
444	3	1	0	1	290	10	1	99	926	0	0
445	3	1	0	1	290	20	401	99	926	0	0
446	3	1	0	1	330	10	1	99	542	0	0
447	3	1	0	1	330	10	1	99	926	0	0
448	3	1	0	1	330	20	401	99	542	0	0
453	3	1	0	1	290	10	1	99	542	0	0
454	3	1	0	1	290	20	401	99	542	0	0
455	3	1	0	1	520	20	401	99	542	0	0
456	3	1	0	1	540	10	1	99	542	0	0
457	3	1	0	1	540	20	401	99	542	0	0
458	3	1	0	1	570	10	1	99	542	0	0
459	3	1	0	1	570	20	401	99	542	0	0
460	3	1	0	1	847	20	401	99	542	0	0
461	3	1	0	1	852	20	401	99	542	0	0
462	3	1	0	1	881	20	401	99	542	0	0
463	3	1	0	1	960	10	1	99	542	0	0
464	3	1	0	1	960	20	401	99	542	0	0
465	3	1	0	1	137	10	1	99	926	0	0
466	3	1	0	1	330	20	401	99	926	0	0
467	3	1	0	1	340	10	1	99	542	0	0
468	3	1	0	1	340	20	401	99	542	0	0
469	3	1	0	1	350	10	1	99	542	0	0
470	3	1	0	1	360	20	401	99	542	0	0
471	3	1	0	1	390	10	1	99	542	0	0
472	3	1	0	1	390	20	401	99	542	0	0
473	3	1	0	1	834	20	401	99	926	0	0
474	3	1	0	1	847	20	401	99	926	0	0
475	3	1	0	1	894	20	401	99	926	0	0
476	3	1	0	3	141	30	76	99	336	0	0
477	3	1	0	3	144	30	76	99	336	0	0
478	3	1	0	3	145	30	76	99	336	0	0
479	3	1	0	3	220	30	76	99	336	0	0
480	3	1	0	3	230	30	76	99	336	0	0
481	3	1	0	3	260	30	76	99	336	0	0
482	3	1	0	3	330	30	76	99	336	0	0
483	3	1	0	3	340	30	76	99	336	0	0
484	3	1	0	3	350	30	76	99	336	0	0
485	3	1	0	3	360	30	76	99	336	0	0
486	3	1	0	3	520	30	76	99	336	0	0
487	3	1	0	3	530	30	76	99	336	0	0
488	3	1	0	3	540	30	76	99	336	0	0
489	3	1	0	3	848	30	76	99	1312	0	0
490	3	1	0	3	853	30	76	99	336	0	0
491	3	1	0	4	230	30	76	99	1181	0	0
492	3	1	0	4	260	30	76	99	1181	0	0
493	3	1	0	4	360	30	76	99	1181	0	0
494	3	1	0	4	520	30	76	99	1317	0	0
495	3	1	0	4	520	30	76	99	1318	0	0
496	3	1	0	5	145	30	76	99	1181	0	0
497	3	1	0	5	230	30	76	99	1181	0	0
498	3	1	0	5	260	30	76	99	1181	0	0
499	3	1	0	5	360	30	76	99	1181	0	0
500	3	1	0	5	520	30	76	99	1317	0	0
501	3	1	0	5	520	30	76	99	1318	0	0
502	3	1	0	5	530	30	76	99	1319	0	0
503	3	1	0	8	145	30	76	99	24	0	0
504	3	1	0	8	145	30	76	99	1181	0	0
505	3	1	0	8	220	30	76	99	24	0	0
506	3	1	0	8	230	30	76	99	24	0	0
507	3	1	0	1	530	10	1	99	926	0	0
508	3	1	0	1	530	20	401	99	926	0	0
509	3	1	0	2	530	30	513	99	1319	0	0
510	3	1	0	2	540	30	513	99	1319	0	0
511	3	1	0	2	520	30	513	99	1322	0	0
512	3	1	0	5	141	30	76	99	1181	0	0
513	3	1	0	5	240	30	76	99	1181	0	0
514	3	1	0	8	390	30	76	99	24	0	0
515	3	1	0	8	540	30	76	99	24	0	0
516	3	1	0	8	834	30	76	99	24	0	0
517	3	1	0	8	852	30	76	99	24	0	0
518	3	1	0	8	530	30	76	99	1181	0	0
519	3	1	0	8	540	30	76	99	1181	0	0
520	3	1	0	8	570	30	76	99	1181	0	0
521	3	1	0	9	141	30	76	99	336	0	0
522	3	1	0	9	144	30	76	99	336	0	0
523	3	1	0	9	145	30	76	99	336	0	0
524	3	1	0	9	230	30	76	99	336	0	0
525	3	1	0	9	240	30	76	99	336	0	0
526	3	1	0	9	250	30	76	99	336	0	0
527	3	1	0	9	260	30	76	99	336	0	0
528	3	1	0	9	280	30	76	99	336	0	0
529	3	1	0	9	320	30	76	99	336	0	0
530	3	1	0	9	330	30	76	99	336	0	0
531	3	1	0	9	340	30	76	99	336	0	0
532	3	1	0	9	350	30	76	99	336	0	0
533	3	1	0	9	360	30	76	99	336	0	0
534	3	1	0	9	520	30	76	99	336	0	0
535	3	1	0	9	530	30	76	99	336	0	0
536	3	1	0	9	540	30	76	99	336	0	0
537	3	1	0	9	852	30	76	99	336	0	0
538	3	1	0	10	137	30	76	99	24	0	0
539	3	1	0	10	141	30	76	99	24	0	0
540	3	1	0	10	145	30	76	99	24	0	0
541	3	1	0	10	230	30	76	99	24	0	0
542	3	1	0	10	240	30	76	99	24	0	0
543	3	1	0	10	250	30	76	99	24	0	0
544	3	1	0	10	260	30	76	99	24	0	0
545	3	1	0	10	280	30	76	99	24	0	0
546	3	1	0	10	290	30	76	99	24	0	0
547	3	1	0	10	340	30	76	99	24	0	0
548	3	1	0	10	360	30	76	99	24	0	0
549	3	1	0	10	390	30	76	99	24	0	0
550	3	1	0	10	852	30	76	99	24	0	0
551	3	1	0	10	220	30	76	99	1319	0	0
552	3	1	0	10	250	30	76	99	1319	0	0
553	3	1	0	10	520	30	76	99	1319	0	0
554	3	1	0	10	530	30	76	99	1319	0	0
555	3	1	0	10	540	30	76	99	1319	0	0
556	3	1	0	10	570	30	76	99	1319	0	0
557	3	1	0	11	220	30	76	99	38	0	0
558	3	1	0	11	260	30	76	99	38	0	0
559	3	1	0	11	330	30	76	99	38	0	0
560	3	1	0	11	852	30	76	99	38	0	0
561	3	2	0	1	141	30	76	99	1181	0	0
562	3	2	0	1	144	30	76	99	1181	0	0
563	3	2	0	1	145	30	76	99	1181	0	0
564	3	2	0	1	210	30	76	99	1181	0	0
565	3	2	0	1	220	30	76	99	1181	0	0
566	3	2	0	1	230	30	76	99	1181	0	0
567	3	2	0	1	240	30	76	99	1181	0	0
568	3	2	0	1	250	30	76	99	1181	0	0
569	3	2	0	1	260	30	76	99	1181	0	0
570	3	2	0	1	280	30	76	99	1181	0	0
571	3	2	0	1	340	30	76	99	1181	0	0
572	3	2	0	1	360	30	76	99	1181	0	0
573	3	2	0	1	530	30	76	99	1181	0	0
574	3	2	0	1	540	30	76	99	1181	0	0
575	3	2	0	1	852	30	76	99	1181	0	0
576	3	2	0	2	123	30	76	99	1181	0	0
577	3	2	0	2	125	30	76	99	1181	0	0
578	3	2	0	2	137	30	76	99	1181	0	0
579	3	2	0	2	141	30	76	99	1181	0	0
580	3	2	0	2	145	30	76	99	1181	0	0
581	3	2	0	2	260	30	76	99	1181	0	0
582	3	2	0	2	852	30	76	99	1181	0	0
583	3	2	0	2	144	30	76	99	1320	0	0
584	3	2	0	2	220	30	76	99	1320	0	0
585	3	2	0	2	230	30	76	99	1320	0	0
586	3	2	0	2	260	30	76	99	1320	0	0
587	3	2	0	2	280	30	76	99	1320	0	0
588	3	2	0	2	330	30	76	99	1320	0	0
589	3	2	0	2	340	30	76	99	1320	0	0
590	3	2	0	2	360	30	76	99	1320	0	0
591	3	2	0	2	390	30	76	99	1320	0	0
592	3	2	0	2	852	30	76	99	1320	0	0
593	3	2	0	2	141	30	76	99	1321	0	0
594	3	2	0	2	144	30	76	99	1321	0	0
595	3	2	0	2	145	30	76	99	1321	0	0
596	3	2	0	2	210	30	76	99	1321	0	0
597	3	2	0	2	230	30	76	99	1321	0	0
598	3	2	0	2	240	30	76	99	1321	0	0
599	3	2	0	2	250	30	76	99	1321	0	0
600	3	2	0	2	260	30	76	99	1321	0	0
601	3	2	0	2	330	30	76	99	1321	0	0
602	3	2	0	2	340	30	76	99	1321	0	0
603	3	2	0	2	360	30	76	99	1321	0	0
604	3	2	0	2	530	30	76	99	1321	0	0
605	3	2	0	2	540	30	76	99	1321	0	0
606	3	2	0	2	852	30	76	99	1321	0	0
607	3	1	0	8	230	30	76	99	1181	0	0
608	3	1	0	8	260	30	76	99	24	0	0
609	3	1	0	8	260	30	76	99	1181	0	0
610	3	1	0	8	280	30	76	99	24	0	0
611	3	1	0	8	280	30	76	99	1181	0	0
612	3	1	0	8	290	30	76	99	24	0	0
613	3	1	0	8	330	30	76	99	24	0	0
614	3	1	0	8	330	30	76	99	1181	0	0
615	3	1	0	8	340	30	76	99	24	0	0
636	2	1	8	0	123	10	1	99	38	0	0
637	2	1	8	0	123	10	1	99	36	0	0
638	2	1	8	0	125	10	1	99	36	0	0
639	2	1	8	0	125	10	1	99	38	0	0
640	2	1	8	0	133	10	1	99	77	0	0
641	2	1	8	0	141	10	1	99	77	0	0
642	2	1	8	0	145	10	1	99	38	0	0
643	2	1	8	0	210	10	1	99	77	0	0
644	2	1	8	0	220	10	1	99	77	0	0
645	2	1	8	0	220	10	1	99	36	0	0
646	2	1	8	0	220	10	1	99	38	0	0
647	2	1	8	0	330	10	1	99	77	0	0
648	2	1	8	0	530	10	1	99	77	0	0
\.


--
-- TOC entry 2690 (class 0 OID 34271)
-- Dependencies: 252
-- Data for Name: distribucion_componente; Type: TABLE DATA; Schema: presupuesto; Owner: postgres
--

COPY distribucion_componente (id, presupuesto, item, monto) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 0)
-- Dependencies: 251
-- Name: distribucion_subcomponente_id_seq; Type: SEQUENCE SET; Schema: presupuesto; Owner: postgres
--

SELECT pg_catalog.setval('distribucion_subcomponente_id_seq', 8, true);


--
-- TOC entry 2748 (class 0 OID 0)
-- Dependencies: 244
-- Name: presupuesto_vigente_id_seq; Type: SEQUENCE SET; Schema: presupuesto; Owner: postgres
--

SELECT pg_catalog.setval('presupuesto_vigente_id_seq', 663, true);


SET search_path = public, pg_catalog;

--
-- TOC entry 2749 (class 0 OID 0)
-- Dependencies: 177
-- Name: DistribucionIngresoPF_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DistribucionIngresoPF_id_seq"', 37, true);


--
-- TOC entry 2617 (class 0 OID 17291)
-- Dependencies: 178
-- Data for Name: cajachica_certificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cajachica_certificacion (id, uoc_id, monto_certificacion, direccion, monto_disponible, mes) FROM stdin;
35	25	668040	18	34909091	3
36	25	138600	31	34241051	3
37	25	1400000	32	34102451	3
38	25	365000	21	32702451	3
39	25	442000	27	32337451	3
40	25	1490000	33	31895451	3
41	25	1507000	33	30405451	3
42	25	1490000	33	28898451	3
43	25	1400000	34	27408451	3
44	25	1400000	35	26008451	3
58	25	1400000	15	24608451	3
59	25	307072	12	23208451	3
60	25	1400000	17	22901379	3
61	25	1400000	35	21501379	3
62	25	1400000	35	20101379	3
63	25	1400000	47	18701379	3
64	25	480000	48	17301379	3
65	25	1400000	17	16821379	3
66	25	173000	49	15421379	3
67	25	1400000	18	15248379	3
68	25	1030000	50	13848379	3
69	25	950000	49	12818379	3
70	25	1400000	49	11868379	3
71	25	430000	51	10468379	3
72	25	1400000	35	10038379	3
73	25	215000	22	8638379	3
74	25	1400000	32	8423379	3
75	25	1400000	32	7023379	3
76	25	676000	27	5623379	3
77	25	1283000	52	4947379	3
78	25	224000	39	3664379	3
79	25	1275000	16	3440379	3
80	25	1400000	53	2165379	3
81	25	376000	20	765379	3
82	24	1500000	33	1962770	3
10	20	483000	10	21569428	3
12	20	350000	12	21086428	3
13	20	1024000	13	20736428	3
14	20	1214000	14	19712428	3
15	20	1498000	15	18498428	3
21	20	1403000	15	17000428	3
22	20	1400000	16	15597428	3
23	20	490000	19	14197428	3
24	20	900000	18	13707428	3
25	20	1000000	20	12807428	3
26	20	223000	21	11807428	3
27	20	600000	20	11584428	3
28	20	500000	18	10984428	3
92	25	1500000	17	17454545	4
93	25	330000	31	15954545	4
94	25	1400000	48	15624545	4
95	25	617000	47	14224545	4
96	25	567292	33	13607545	4
97	25	1320000	54	13040253	4
99	25	1100000	12	11720253	4
100	25	660000	17	10620253	4
101	25	1400000	35	9960253	4
102	25	550535	12	8560253	4
103	25	135000	33	8009718	4
104	25	84977	55	7874718	4
105	25	105000	20	7789741	4
90	20	874200	10	13291790	4
91	20	1510000	17	12417590	4
107	20	620000	14	10907590	4
108	20	1501000	35	10287590	4
109	20	1280000	35	8786590	4
110	20	525000	41	7506590	4
111	20	1500000	33	6981590	4
112	20	1500000	33	5481590	4
113	20	1400000	49	3981590	4
114	20	700000	18	2581590	4
115	20	280000	13	1881590	4
116	20	184800	41	1601590	4
117	20	535000	41	1416790	4
125	26	110500	51	1714526	3
126	26	700000	51	1604026	3
127	26	234000	33	904026	3
128	26	200000	12	670026	3
129	26	470000	51	912511	4
130	26	81700	21	442511	4
32	23	423000	18	2200000	3
33	23	799540	18	1777000	3
30	22	1400000	21	3150000	3
31	22	350000	27	1750000	3
57	22	1400000	18	1400000	3
118	22	1000000	33	4197977	4
34	23	478420	18	977460	3
131	26	770000	51	912511	6
29	20	385000	22	10484428	3
45	20	908900	15	10099428	3
46	20	1120000	46	9190528	3
47	20	647000	46	8070528	3
48	20	900000	33	7423528	3
49	20	133452	27	6523528	3
50	20	500000	33	6390076	3
51	20	900000	46	5890076	3
52	20	223000	18	4990076	3
53	20	1510000	33	4767076	3
54	20	659518	41	3257076	3
55	20	840482	41	2597558	3
56	20	1400000	18	1757076	3
86	20	500000	19	16141790	4
87	20	330000	31	15641790	4
88	20	620000	49	15311790	4
89	20	1400000	31	14691790	4
119	23	231904	18	4400000	4
85	27	150000	19	1444364	3
132	27	1343000	16	2241546	4
133	27	472000	40	797182	5
134	27	1223000	16	325182	5
120	23	612750	18	4168096	4
121	23	84645	33	3555346	4
122	24	1400000	20	1962770	4
123	25	511338	18	7684741	4
\.


--
-- TOC entry 2750 (class 0 OID 0)
-- Dependencies: 179
-- Name: cajachica_certificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cajachica_certificacion_id_seq', 135, true);


--
-- TOC entry 2619 (class 0 OID 17300)
-- Dependencies: 180
-- Data for Name: cajachica_distribucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cajachica_distribucion (id, uoc_id, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, pf10, pf11, pf12) FROM stdin;
6	25	0	0	34909091	17454545	17454545	17454549	17454545	17454545	17454545	17454545	17454545	17454545
7	24	0	0	1962770	1962770	1962770	1962770	1962770	1962770	1962770	1962770	1962770	1962770
8	26	0	0	1714526	912511	912511	912511	912511	912511	1023011	912511	912511	912511
3	20	0	0	21569428	15784714	16667900	15784428	15784428	15784428	15784428	15784428	14903243	15784428
4	22	0	0	3150000	1047977	6218682	1047977	1047977	1047977	1047977	1047977	1047977	1047979
5	23	0	0	2200000	2200000	2200000	2200000	2200000	0	0	0	0	0
9	27	0	0	1444364	797182	797182	797182	797182	797182	797182	797182	797182	947180
\.


--
-- TOC entry 2751 (class 0 OID 0)
-- Dependencies: 181
-- Name: cajachica_distribucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cajachica_distribucion_id_seq', 9, true);


--
-- TOC entry 2671 (class 0 OID 17746)
-- Dependencies: 233
-- Data for Name: cajachica_ejecucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cajachica_ejecucion (id, uoc_id, ej1, ej2, ej3, ej4, ej5, ej6, ej7, ej8, ej9, ej10, ej11, ej12) FROM stdin;
1	20	0	0	21212352	5234200	0	0	0	0	0	0	\N	0
2	23	0	0	0	0	0	0	0	0	0	0	\N	0
\.


--
-- TOC entry 2752 (class 0 OID 0)
-- Dependencies: 232
-- Name: cajachica_ejecucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cajachica_ejecucion_id_seq', 2, true);


--
-- TOC entry 2658 (class 0 OID 17638)
-- Dependencies: 220
-- Data for Name: cdp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cdp (id, estructura_id, unr, pac_numero, cc, descripcion, certificacion_actual, fecha, cdp_numero) FROM stdin;
87	126	43	0	LP-12007-16-128623	CERTIFICACIÓN DE SALDO DE CONTRATACIÓN	18000000	2017-03-22	165
2	50	40	327661		Adquisición de Cubiertas	35642800	2017-05-08	253
3	33	40	0	LP-12007-16-123468	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	268150330	2017-05-11	281
4	33	40	7107449		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300406 - CC:LP-12007-16-123468 SERVICIO DE IMPRESIÓN Y COPIADO PLURIANUAL 2016-2017	300000000	2017-05-11	282
5	33	40	0	CD-12007-16-133022	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	41952600	2017-05-11	280
6	137	43	7107450		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 290756 - CC: LP-12007-15-110347 ADQUISICIÓN DE MERIENDA ESCOLAR - PLURIANUAL 2015/2016	1510258434	2017-05-11	283
7	137	43	7107455		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300395 - CC: LP-12007-16-118463 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL - 2016/2017	4351182300	2017-05-11	289
8	137	43	7107456		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300395 - CC: LP-12007-16-118651 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL - 2016/2017	8674218000	2017-05-11	290
9	137	43	7107457		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 308924 - CC: LP-12007-16-125062 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - 2DO. LLAMADO - PLURIANUAL - 2016/2017	2758301756	2017-05-11	291
10	137	43	7107458		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 308924 - CC: LP-12007-16-120771 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - 2DO. LLAMADO - PLURIANUAL - 2016/2017	2621822841	2017-05-11	292
11	137	43	7107453		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 304300 - CC:LP-12007-16-119618 SERVICIO DE COLACIONES ALIMENTARIAS PARA LA EDUCACIÓN MEDIA - PLURIANUAL 2016/2017	624091650	2017-05-11	287
12	137	43	7107454		ADQUISICIÓN DE MERIENDA ESCOLAR - ALIMENTO PLURIANUAL 2015/2016	130379650	2017-05-11	288
13	31	40	321702		ADQUISICIÓN DE PÓLIZAS DE SEGUROS PARA VEHÍCULOS DEL MEC	219301497	2017-05-16	309
14	32	40	321702		ADQUISICIÓN DE PÓLIZAS DE SEGUROS PARA VEHÍCULOS DEL MEC	19440698	2017-05-16	309
15	33	40	321702		ADQUISICIÓN DE PÓLIZAS DE SEGUROS PARA VEHÍCULOS DEL MEC	4477032	2017-05-16	309
16	321	43	332060		ADQUISICIÓN DE ÚTILES DE OFICINA	20707480	2017-05-18	315
20	125	43	332961		ADQUISICIÓN DE ARTÍCULOS DE LIMPIEZA	5181000	2017-06-27	403
19	126	43	332961		ADQUISICIÓN DE ARTÍCULOS DE LIMPIEZA	44819000	2017-06-27	403
21	532	15	7100261		SERVICIO DE EMBALAJE Y TRANSPORTE DE TEXTOS Y GUÍAS DIDÁCTICAS - PLURIANUAL 2016/2017	2880784368	2017-02-23	33
22	532	43	0	LP-12007-16-120703	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	743860584	2017-03-02	107
23	120	43	0	LP-12007-16-131531	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	100000000	2017-03-15	137
24	120	43	7104632		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306015 - CC: LP-12007-16-131531 SERVICIO DE EMBALAJE Y TRANSPORTE - PLURIANUAL 2016/2017 - AD REFERENDUM	17049733070	2017-03-15	138
25	232	48	0	CD-12007-16-131455	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	108000000	2017-03-13	130
26	232	48	322308		ADQUISICIÓN DE PASAJES AÉREOS - PLURIANUAL 2017/2018	800000000	2017-04-07	195
27	232	48	7106153		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306020 - CC: CD-12007-16-131455 ADQUISICIÓN DE PASAJES AÉREOS	32000000	2017-04-10	196
28	27	40	321183		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS	66522712	2017-03-30	192
29	28	40	321183		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS	100000000	2017-03-30	192
30	123	43	321183		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS	51833600	2017-03-30	192
31	182	43	321183		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS	48360000	2017-03-30	192
32	246	48	321183		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS	4262440	2017-03-30	192
33	318	43	321183		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS	71565464	2017-03-30	192
34	137	43	7108957		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300395 - CC: LP-12007-16-118651	8288527220	2017-06-23	395
35	137	43	7108959		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300395 - CC: LP-12007-16-118463 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL - 2016/2017	2658807990	2017-06-23	396
36	137	43	7108960		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300395 - CC: LP-12007-16-118463 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL - 2016/2017	1792414000	2017-06-23	397
37	137	43	7108961		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 308924- CC: LP-12007-16-120771 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - 2DO LLAMADO - PLURIANUAL - 2016/2017	2621365677	2017-06-23	398
38	137	43	7108962		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 308924 - CC: LP-12007-16-125062 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS 2 DO LLAMADO - PLURIANUAL - 2016/2017	2738407014	2017-06-23	399
39	137	43	333207		ADQUISICIÓN DE DESAYUNO Y MERIENDA ESCOLAR - ALIMENTO SÓLIDO	1901514384	2017-06-16	380
40	137	43	710628		ADQUISICIÓN DE GALLETITAS DULCES Y PALITO/ROSQUITA PARA LA MERIENDA ESCOLAR - AD REFERENDUM	170509104	2017-05-17	310
41	137	43	7105259		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 304300 - CC: LP-12007-16-119618 SERVICIO DE COLACIONES ALIMENTARIAS PARA LA EDUCACIÓN MEDIA - PLURIANUAL - 2016/2017	478894650	2017-03-22	189
42	137	43	7105257		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 308924 - CC: LP-12007-16-125007-16-125062 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - 2 DO LLAMADO PLURIANUAL - 2016/2017	456740354	2017-03-22	188
43	137	43	7105255		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 308924 - CC: LP-12007-16-120771 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - 2DO LLAMADO PLURIANUAL - 2016/2017	2712015199	2017-03-22	187
44	137	43	7105254		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300395 - CC: LP-12007-16-118651 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL - 2016/2017	3442705435	2017-03-22	186
45	137	43	7105253		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 290756 - CC: LP-12007-15-110347 ADQUISICIÓN DE MERIENDA ESCOLAR - PLURIANUAL - 2016/2017	876898352	2017-03-22	185
46	137	43	7105252		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300395 - CC: LP-12007-16-118463 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL - 2016/2017	2628982170	2017-03-22	184
47	137	43	0	LP-12007-16-119618	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	176411300	2017-03-22	183
48	137	43	0	LP-12007-15-112426	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	136328920	2017-03-22	169
49	137	43	321410		ADQUISICIÓN DE DESAYUNO Y MERIENDA ESCOLAR	23958062080	2017-03-08	122
50	137	43	7102386		AMPLIACIÓN DEL PAC Nro.: 303807 - CC: LP-12007-16-119250 ADQUISICIÓN DE GALLETITAS DULCES Y PALITO/ ROSQUITA PARA LA MERIENDA ESCOLAR 	459266970	2017-02-24	36
51	137	43	7102383		AMPLIACIÓN DEL PAC Nro.: 290756 - CC: LP-12007-15-110347 ADQUISICIÓN DE MERIENDA ESCOLAR - PLURIANUAL 2015/2016	4292092476	2017-02-24	35
52	366	43	321183		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS	80000000	2017-03-30	192
53	387	40	321183		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS	77455784	2017-03-30	192
54	366	43	332805		SERVICIO DE MANTENIMIENTO DEL DATACENTER	300000000	2017-06-05	350
55	29	40	0	RL-12007-16-2937	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	617460000	2017-03-16	139
18	29	40	7109017		ALQUILER DE OFICINA PARA DEPENDENCIAS DE LA DIRECCIÓN GENERAL DE TALENTO HUMANO	84000000	2017-06-26	401
56	29	40	0	RL-12007-16-2931	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	124524888	2017-03-16	140
57	29	40	0	RL-12007-16-2920	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	22000000	2017-03-16	141
58	29	40	0	RL-12007-16-2916	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	93500000	2017-03-16	142
59	29	40	0	RL-12007-16-2913	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	42840000	2017-03-16	143
60	29	40	0	RL-12007-16-2914	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	102000000	2017-03-16	144
61	29	40	0	RL-12007-16-2911	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	25200000	2017-03-16	145
62	127	43	321182		ADQUISICIÓN DE KID ESCOLAR	200000000	2017-06-05	348
63	43	40	332060		ADQUISICIÓN DE ÚTILES DE OFICINA	129292520	2017-05-18	315
88	126	43	0	LP-12007-16-128619	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	158
65	44	40	327640		ADQUISICIÓN DE BATERÍAS	50000000	2017-05-02	249
66	44	40	327627		ADQUISICIÓN DE TINTA Y TONER	101239362	2017-04-25	230
67	127	43	327627		ADQUISICIÓN DE TINTA Y TONER	179998603	2017-04-25	230
68	389	40	327627		ADQUISICIÓN DE TINTA Y TONER	18762035	2017-04-25	230
69	127	43	0	AM-12007-16-1707	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	69647130	2017-04-17	197
70	126	43	0	LP-12007-16-128620	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	164
71	126	43	7105205		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128620 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	17982000000	2017-03-22	178
72	126	43	0	LP-12007-15-113636	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	87398750	2017-03-22	156
73	126	43	7105195		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 290798 - CC: LP-12007-15-113636 ADQUISICIÓN DE KITS DE ÚTILES ESCOLARES - PLURIANUAL - 2016/2017	478888132	2017-03-22	170
74	126	43	0	LP-12007-16-128622	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	159
75	126	43	0	LP-12007-15-113640	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	87398750	2017-03-22	157
76	126	43	7105196		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 290798 - CC: LP-12007-15-113640 ADQUISICIÓN DE KIT DE ÚTILES ESCOLARES - PLURIANUAL - 2015/2016	478888132	2017-03-22	171
77	126	43	7105199		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128619 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	9982000000	2017-03-22	172
78	126	43	7105200		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128622 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	1482000000	2017-03-22	173
79	126	43	7105201		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128629 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	759025442	2017-03-22	174
80	126	43	7105202		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128625 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	940872329	2017-03-22	175
81	126	43	7105203		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128381 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	1073407966	2017-03-22	176
82	126	43	7105204		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128617 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	175649820	2017-03-22	177
83	126	43	7105206		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128623 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	1137790021	2017-03-22	179
84	126	43	7105207		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128627 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	1698829878	2017-03-22	180
85	126	43	7105208		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128618 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	1239453946	2017-03-22	181
86	126	43	7105209		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 306178 - CC: LP-12007-16-128626 ADQUISICIÓN DE KITS ESCOLARES 2016/2017	6982000000	2017-03-22	182
89	126	43	0	LP-12007-16-128626	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	168
90	126	43	0	LP-12007-16-128618	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	167
91	126	43	0	LP-12007-16-128627	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	166
92	126	43	0	LP-12007-16-128617	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN 	18000000	2017-03-22	163
93	126	43	0	LP-12007-16-128381	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	162
94	126	43	0	LP-12007-16-128629	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	160
95	126	43	0	LP-12007-16-128625	CERTIFICACIÓN DE SALDO DE CÓDIGO DE CONTRATACIÓN	18000000	2017-03-22	161
96	126	43	7102892		ADQUISICIÓN DE KITS ESCOLAR 2016/2017 PLURUANUAL ÍTEMS DECLARADOS DESIERTOS 2DO LLAMADO	1194327776	2017-03-01	70
104	30	40	7112403		Locación de inmuebles para oficinas  y depósitos	164241000	2017-10-23	516
99	137	43	7108957	LP-12007-16-118651	Certificacion del PAC Plurianual nro 3003395 CC LP-12007-16-118651 servicio de elaboracion y distribucion de alimentos frescos - plurianual - 2016/2017	8288527220	2017-06-23	0
100	126	40	336418		Adquisición de cuadernos para kits escolar - Plurianual 2017/2018	50000000	2017-09-21	497
101	30	40	7112400		Locación de Inmuebles para oficinas y depósitos	263013300	2017-10-23	513
102	30	40	7112101		Locación de inmuebles para oficinas y depósitos	371442000	2017-10-23	514
103	30	40	7112402		Locación de inmuebles para oficinas y depósitos	270000000	2017-10-23	515
105	30	40	7112407		Locación de inmuebles para oficinas y depósitos	313540416	2017-10-23	518
106	30	40	7112108		Locación de inmuebles para oficinas y depósitos	277799430	2017-10-23	519
107	30	40	7112423		Locación de inmuebles para oficinas y depósitos	195066300	2017-10-23	526
108	30	40	7112112		Locación de inmuebles para oficinas y depósitos	132000000	2017-10-23	520
109	30	40	7112114		Locación de inmuebles para oficinas y depósitos	280500000	2017-10-23	521
110	30	40	7112116		Locación de inmuebles para oficinas y depósitos	306000000	2017-10-23	522
111	30	40	7112418		Locación de inmuebles para oficinas y depósitos	336960000	2017-10-23	523
112	30	40	7112119		Locación de inmuebles para oficinas y depósitos	128520000	2017-10-23	524
113	30	40	7112420		Locación de inmuebles para oficinas y depósitos	209520000	2017-10-23	525
114	137	43	7112443		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 308924 - CC: LP-12007-16-120771 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - 2DO LLAMADO - PLURIANUAL - 2016/2017	2000000000	2017-10-23	529
115	137	43	7112444		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 308924 - CC: LP-12007-16-125062 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - 2 DO. LLAMADO - PLURIANUAL - 2016/2017	2720845663	2017-10-23	530
116	137	43	7112442		CERTIFICACIÓN DEL PAC PLURIANUAL Nro.: 300395 - CC: LP-12007-16-118651 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL - 2016/2017	4095787077	2017-10-23	528
\.


--
-- TOC entry 2753 (class 0 OID 0)
-- Dependencies: 219
-- Name: cdp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cdp_id_seq', 116, true);


--
-- TOC entry 2621 (class 0 OID 17317)
-- Dependencies: 182
-- Data for Name: direcciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY direcciones (id, descripcion) FROM stdin;
28	Direccion General de Gestion Social y Equidad Educativa
15	Departamento de Bienes Patrimoniales
17	Secretaria General
10	Dirección General de Protocolo
12	Dirección de Presupuesto
13	Dirección para el Desarrollo de la Responsabilidad Social
14	Direccción General de Gabinete
18	Dirección General de Administracion y finanzas
19	Dirección de Certificación Académica
20	Departamento de Tesorería
21	Departamento de Apoyo Técnico-Dir. Financiera
22	Dirección de Contrataciones
29	Cordinacion General del Operativo de Kits de Textos Escolares 2017
38	Dirección General de Ciencia e Innovación Educativa
16	Unidad Tecnica de Mantenimiento y Reparación
39	Dirección General de Educación Indigena
26	Centro de Investigación e Innovación Educativa
27	Departamento de Aranceles
30	Viceministerio de Educaciòn para la Gestiòn Educativa
31	Direcciòn General de Relaciones Internacionales y Enlaces Interinstitucionales
32	Dirección General de Asesoria Jurídica
33	Dirección Financiera
34	Departamento de Transferencia de Recursos
35	Dirección de Administración de Sueldos y Beneficios
37	Direcciòn General de Educaciòn Inclusiva
40	Dirección General de Fortalecimiento del Proceso Educativo
41	Departamento de Transporte
42	Dirección de Infraestructura
43	Departamento Técnico Pedagògico
44	Dirección de Gestión Pedagógica y Planificaciòn
45	Viceministerio de Educaciòn Superior
46	Dirección de Informática
47	Departamento de Rendición de Cuentas
48	Departamento de Contabilidad
49	Dirección Administrativa
50	Dirección General de Gestión del Talento Humano
51	Departamento de Artes Gráficas
52	Departamento de Fiscalización y Control Interno
53	Departamento de Suministro y Depósito
54	Viceministerio de Culto
55	Departamento de Apoyo Técnico
72	MEMO N° 0134. Solicita Centro de Estudiantes del CNC ser beneficiario de almuerzo escolar.
57	Dirección General de Educación Inicial y Escolar Básica
58	departamento de control y evaluacion
59	Unidad Ejecutora de Programas y Proyectos UEPP
60	Dir. Gral. de Universidades e Institutos Superiores
61	Dirección General de Currículum, Evaluación y Orientación
63	Dirección General de Educación Permanente
64	Dirección General de Educación Técnica y Profesional
65	Dirección General de Educación Media
66	Dirección de Transparencia y Anticorrupción
67	Dirección General de Auditoría Interna
68	Dirección General de Becas
69	Viceministerio de Educación Básica
73	SIFEMEC
36	Dirección General de Planificación Educativa
62	Departamento de Programación y Planificación
71	Departamento de Administración de Convenios
74	Consejo Nacional de Educación y Cultura CONEC
75	Dirección General de Desarrollo Profesional del Educador
76	Departamento de Programación y Planificacion
77	Dirección de Contrataciones
78	Dirección General de Curriculum Evaluación y Orientaciòn
79	bellas artes
80	Conservatorio Nacional de Música CONAMU
81	SINADI
82	Departamento Técnico y Econòmico
83	Dirección General de Planificación Educativa
84	
85	persona fisica
86	persona fisica
87	Departamento de Administración de Convenios
88	Coordinación Gral. de Direcciones de Nivel DGAF
89	
90	Particular
91	Departamento de Recursos Institucionales
92	Dirección General de Ciencias e Innovación Educativa
93	Facultad Latinoamericana de Ciencias Sociales FLACSO
94	Instituto Superior de Educación (I.S.E.)
95	Solicitud de pago de inscripción para II Congreso Nacional....
96	Instituto Nacional de Evaluación Educativa
97	Consejo Nacional de Educación y Trabajo
98	Dirección General de Cooperación
99	Dirección General del Tercer Ciclo de la Educ. Esco. Basica y la Educ. Media
100	Dirección General del Primer y Segundo Ciclo de la Educación Escolar Básica
101	Direccion General de Gestion y Desarrollo del Personal
\.


--
-- TOC entry 2754 (class 0 OID 0)
-- Dependencies: 183
-- Name: direcciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('direcciones_id_seq', 101, true);


--
-- TOC entry 2623 (class 0 OID 17325)
-- Dependencies: 184
-- Data for Name: direcciones_ingresos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY direcciones_ingresos (direccion, descripcion) FROM stdin;
1	Coordinacion
2	Culto
3	Artistica
4	Educacion Superior
5	IFD
6	ENEF
7	Permanente
8	Conservatorio
9	TSBA
10	ISE
11	CRE
\.


--
-- TOC entry 2615 (class 0 OID 17274)
-- Dependencies: 176
-- Data for Name: distribucion_ingresos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY distribucion_ingresos (id, presupuesto_id, direccion, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, pf10, pf11, pf12) FROM stdin;
3	67	1	10000	20000	15000	30000	10000	12000	0	0	0	0	0	0
14	68	1	0	0	720000000	360000000	360000000	360000000	360000000	200000000	360000000	199061384	360000000	360000000
15	68	2	0	0	90000000	45000000	45000000	45000000	45000000	45000000	0	45000000	90000000	69865912
16	68	3	0	0	200000000	90000000	90000000	90000000	90000000	90000000	90000000	119731824	90000000	90000000
17	75	1	0	0	80000000	40000000	40000000	40000000	40000000	30000000	40000000	41562376	40000000	40000000
18	75	2	0	0	10000000	5000000	5000000	5000000	5000000	5000000	0	5000000	10000000	11651768
19	75	3	0	0	30000000	10000000	10000000	10000000	10000000	10000000	10000000	13303536	10000000	10000000
20	240	4	0	0	477000000	200000000	200000000	200000000	94869560	200000000	200000000	200000000	200000000	200000000
21	240	5	0	0	270000000	45000000	0	45000000	35534160	45000000	45000000	45000000	45000000	45000000
22	240	6	0	0	90000000	45000000	27000000	27000000	0	27000000	27000000	13267080	27000000	27000000
23	241	4	0	0	53000000	22000000	22000000	22000000	12318840	22000000	22000000	22000000	22000000	22000000
24	241	5	0	0	30000000	5000000	0	5000000	3948240	5000000	5000000	5000000	5000000	5000000
25	241	6	0	0	10000000	5000000	3000000	3000000	0	3000000	3000000	1474120	3000000	3000000
26	253	8	0	0	90000000	45000000	45000000	45000000	45000000	90000000	45000000	111430800	45000000	45000000
29	254	8	0	0	10000000	5000000	5000000	5000000	5000000	10000000	5000000	12381200	5000000	5000000
30	267	9	0	0	180000000	45000000	45000000	45000000	45000000	90000000	45000000	45000000	115253550	45000000
31	268	9	0	0	20000000	5000000	5000000	5000000	5000000	10000000	5000000	5000000	12805950	5000000
32	274	10	0	0	450000000	450000000	450000000	450000000	269185050	450000000	450000000	450000000	450000000	450000000
33	275	10	0	0	50000000	50000000	50000000	50000000	29909450	50000000	50000000	50000000	50000000	50000000
34	330	7	0	0	270000000	270000000	270000000	270000000	414717750	270000000	270000000	270000000	414717750	270000000
35	331	7	0	0	30000000	30000000	30000000	30000000	46079750	30000000	30000000	30000000	46079750	30000000
36	365	11	0	0	180000000	45000000	45000000	45000000	45000000	90000000	45000000	107632350	45000000	45000000
37	366	11	0	0	20000000	5000000	5000000	5000000	5000000	10000000	5000000	11959150	5000000	5000000
\.


--
-- TOC entry 2662 (class 0 OID 17663)
-- Dependencies: 224
-- Data for Name: documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documentos (id, fecha_documento, fecha_entrada, direccion, descripcion, expediente_numero) FROM stdin;
47	2017-05-12	2017-05-12	18	Memo DGAF N° 1909. Solicitar CDP Viático Interior por Gs. 16.194.598	147372
48	2017-05-16	2017-05-16	20	Solicitar autorización de Certificación de Disponibilidad  Objeto de Gasto 199 "Otros Gastos del Personal" (salarios caídos)	148243
15	2017-05-05	2017-05-05	18	Memo DGAF N° 1802. Solicitar CDP correspondiente a Viático Interior por Gs. 37.036.013	137814
14	2017-05-05	2017-05-05	18	Memo DGAF N° 1801. Solicitar CDP viático Interior Gs. 9.129.925	137809
49	2017-05-16	2017-05-16	20	Solicitud de Actualización de CDP 199 "Salarios caídos"	148250
17	2017-05-05	2017-05-05	49	Estado de Cuenta  a mayo del 2017- ANDE	136998
18	2017-05-05	2017-05-05	49	Estado de Cuenta mes de mayo - COPACO	137013
19	2017-05-05	2017-05-05	49	Estado de Cuenta a mayo - ESSAP	137053
20	2017-05-08	2017-05-08	57	Memo N° 1289/2017 Solicitar Reprogramación del OG 330 de los recursos de la Direc. Gral. de Educ. Inicial y Básica al OG 852	117724
21	2017-05-08	2017-05-08	18	Memo DGAF N° 1817. Solicitar CDP correspondiente a viático del interior por Gs. 4.800.000 operativo Kits de Textos Escolares 2017	139581
22	2017-05-08	2017-05-08	18	Memo DGAF N° 1816. Solicitar CDP correspondiente a Viático Interior Gs. 46.622.435	139599
23	2017-05-08	2017-05-08	22	Memo DPP N° 68/2017 CD N° 744/2017. Solicitar estructura presupuestaria para reactivación de código correspondiente a DATA SISTEMS S.A.E.C.A. en el marco del proceso "Servicio de Impresión y Copiado-Plurianual 2016/2017" por Gs. 946.159.970 	140270
24	2017-05-08	2017-05-08	22	Comunicación a la DNCP Nota DC Nº 298	140286
25	2017-05-09	2017-05-09	18	Memo DGAF N° 1849. Solicitar CDP Viático Interior Gs. 11.258.142	141677
26	2017-05-09	2017-05-09	18	Memo DGAF N° 1847. Solicitar CDP Viático Interior Gs. 26.801.906	141682
27	2017-05-09	2017-05-09	18	Memo DGAF N° 1848. Solicitar CDP Viático Interior Gs. 10.754.422	141688
28	2017-05-09	2017-05-09	33	Memo DP N° 946. Solicitud de formulario para REPROGRAMACION del OG 960 Deudas pendientes de pago de Ejercicios anteriores por un monto de Gs. 55.391.090.	94356
29	2017-05-09	2017-05-09	22	Solicita informe sobre el Plan Anual de Contrataciones y las reactivaciones de Codigos de Contratacion	1426900
30	2017-05-09	2017-05-09	33	Memo DAC N° 37. Solicitud de disponibilidad presupuestaria para pago de cuota adeudada correspondiente al año 2016 y 2017 al asesor del fondo del sector educativo del MERCOSUR-CAFEM	132811
33	2017-05-09	2017-05-09	12	 Remisión de Dictamen Nº 10/2017 de la Coordinación Jurídica de la Dirección General de Presupuesto del Ministerio de Hacienda que se refiere solo al servicio de catering propiamente dicho (entiéndase como provisión de bocaditos, café, etc) o el mismo incluye a todos los servicios pagados con el Objeto del Gasto 284.	0
34	2017-05-10	2017-05-10	22	Solicitud de estructura presupuestaria (100.000.000)provisión y colocación de alfombras y cortinas.	144339
35	2017-05-10	2017-05-10	22	Solicita estructura presupuestaria " Adquisición de Pólizas de Seguros de Vehículos del MEC"	144341
36	2017-05-10	2017-05-10	22	Solicitud de estructura presupuestaria " Adquisición de Etiquetas Holográficas de Seguridad" (687.140.000)	144322
16	2017-05-05	2017-05-05	22	Solicitud de certificado de Disponibilidad Presupuestaria en el marco de la adjudicación a la Empresa Data Lab, en el proceso de adquisición de equipos de computación	138119
37	2017-05-10	2017-05-11	18	Viatico al Interior Kits Escolares	145095
38	2017-05-10	2017-05-11	18	Viatico al Interior	145096
39	2017-05-10	2017-05-11	18	Viatico al Exterior para Zully Acosta y Edith Fariña Brasil	144793
40	2017-05-10	2017-05-11	18	Propuesta para integrar la Organizacion Internacional de la Francofonia	144559
41	2017-05-10	2017-05-11	18	Adquisicion de Transporte Equipo Economico ANEAES	141310
42	2017-05-11	2017-05-11	18	Memo N° 1892. Solicitar CDP correspondiente a viático del interior por Gs. 31.123.600	145725
43	2017-05-11	2017-05-11	22	Memo DC N° 786. Solicitar estructura presupuestaria para imputar llamado para reparaciones de techo Escuela básica N° 5 "Gra. José E. Díaz" y el Colegio Nacional de E.M.D. "Asunción Escalada".	145472
44	2017-05-10	2017-05-11	22	solicita reactivacion de codigos "Servicios de Gestion y Organizacion de eventos"	145074
45	2017-05-12	2017-05-12	18	Memo DGG N° 1188/2017. Solicitar viático exterior para Sr. Pedro Vera a Chile para participar de invitación por el Centro de Innovación en Educación de la Fundación de Chile para proupuestas de identificación de propuestas académicas en Universidades de Chile	147214
46	2017-05-12	2017-05-12	18	Memo DGG N° 1365/2017. Solicitar viático exterior para Sra. Andrea Milena Fernández para participar de gira técnica "Intercambio de Experiencias y Conocimientos en Alimentación Escolar" en Sao Paulo-Brasil.	147212
50	2017-05-16	2017-05-16	20	Solicitud de Actualización de CDP 199 "Salarios caídos"	148250
51	2017-05-16	2017-05-16	20	Solicitar CDP 199 (otros gastos del personal) salarios caídos.	148252
52	2017-05-16	2017-05-16	33	Actualizacion de CDP OG 910 David Khavari	148246
53	2017-05-16	2017-05-16	22	Nota de reparo de la DNCP que comunica que el proceso de Adquisicion de Utiles de Oficina no fue publicado	149252
54	2017-05-16	2017-05-16	33	Memo DAC N° 40. Solicitud CDP del OG 853 "Transferencias Corrientes..." por Gs. 1.593.986.911 para transferencia a FLACSO en marco de convenio de cooperación.	144526
55	2017-05-16	2017-05-16	14	Viatico La Paz-Mexico, " Feria Mundial De Ciencias y Tegnología 2.017" 	148048
57	2017-05-18	2017-05-18	18	MEMO DGAF N° 2004. Solicitar Viático Interior Gs. 4.188.336	152329
58	2017-05-18	2017-05-18	18	Memo DGAF N° 1981. Solicitar CDP Viático Interior Gs. 5.500.000 operativo KITS de textos escolares.	152317
59	2017-05-12	2017-05-18	58	solicitud de reprogramación del rubro 143 contratación ocasional del personal al objeto 199 otros gastos del personal	45611
60	2017-05-18	2017-05-18	18	Memo DGAF N° 1983. Solicitar CDP Viático Interior por Gs. 41.317.634	152305
61	2017-05-18	2017-05-18	18	Memo DGAF N° 152300. Solicitar CDP por Gs. 17.283.895 viático interior.	152300
62	2017-05-18	2017-05-18	12	MODIFICACION DE CUOTA DE PLAN FINANCIERO POR 215826869 OG 540	0
63	0017-05-19	2017-05-19	18	Solicita colaboracion para colocacion de un monumento en la Universidad Catolica	151381
64	2017-05-19	2017-05-19	18	Viatico al Exterior a Argentina - Eulalia Bogado	137070
65	2017-05-19	2017-05-19	18	Viatico al interior 24.896.361	154621
67	2017-05-22	2017-05-22	18	solicita CDP correspondiente a viatico al interior, Gs. 28.630.184	155303
68	2017-05-22	2017-05-22	18	solicita CDP correspondiente a viatico al interior, Gs. 44.453.290	155308
69	2017-05-22	2017-05-22	18	solicita CDP correspondiente a viatico al interior, Gs. 680.022	155295
70	2017-05-22	2017-05-22	50	Memo DGGTH N° 1584/17. Circular DGGTH N° 09/17 dirigida a contratados que deseen participar en concurso de Desprecarización laboral.	155266
71	2017-05-22	2017-05-22	12	Memos solicitado Datos Adicionales para el Anteproyecto de Presupuesto 2018, una proforma de DGAF para Talento Humano y planificación Educativa, y 4 memos de Presupuesto a Administrativo, Financiero, Contrataciones y Sueldos y beneficios	0
72	2017-05-22	2017-05-22	22	Memo DPP N° 76/17 CD N° 120/2017. Solicita CDP en el marco de LPN "Adquisición de Kits Escolar - Plurianual 2017/2018", por Gs. 111.657.752.331	156421
74	2017-05-22	2017-05-22	18	Memo DGAF N° 208. Solicitar CDP por Gs. 28.183.134 correspondiente a viático interior.	156342
75	2017-05-22	2017-05-22	18	Memo DGAF N° 2077. Solicitar CDP por Gs. 3.689.749 correspondiente a viático interior	156323
76	2017-05-22	2017-05-22	18	Nota ISE N° 233. Solitar copia del Presupuesto  2017 presentado por el ISE	156104
77	2017-05-23	2017-05-23	33	Solicita pago de sumario al Juez InstructorIdilio Martinez 	156230
78	2017-05-23	2017-05-23	22	memo DC N 838. comunicar a la DNCP notas DC 324/5/6/7 declaraciones juradas.	158178
80	2017-05-24	2017-05-24	18	solicita Gastos Terminales para la Sra. Digna C Gauto de Irala para la ciudad de Buenos Aires - Argentina	158280
81	2017-05-24	2017-05-24	33	Pedido de adelantamiento de cuota comprometidas con los codigos de contratacion	158056
82	2017-05-24	2017-05-24	18	Incial y Basica designan funcionarios	153566
83	2017-05-24	2017-05-24	18	solicita CDP CORRESPONDIENTE A VIATICO AL INTERIOR GS. 15.036.042	159827
84	2017-05-24	2017-05-24	22	Solic de estructura presupuestaria-103.840.000	156562
85	2017-05-25	2017-05-25	18	Viatico al Interior Kits	160405
86	2017-05-25	2017-05-25	18	Viatico al exterior Lilian Morinigo	160415
87	2017-05-25	2017-05-25	18	Anteproyecto FLACSO/PY	159570
88	2017-05-25	2017-05-25	22	Remite listado de precios adjudicados en los rubros del ejercicio fiscal 2016 y 2017	148623
89	2017-05-25	2017-05-25	22	Disponibilidad para Llamado a Contratación de Provisión de Agua en Bidones - OG 310 Gs. 50.000.000.	80220
90	2017-05-25	2017-05-25	60	informe sobre postergaciòn de actividad - Exp.153.785	161476
91	2017-05-26	2017-05-26	18	Solicita viatico al interior por un monto total de Gs. 17.290.189	162245
92	2017-05-26	2017-05-26	18	Solicita CDP Viatico al Interior, por un monto total de Gs. 17.290.189	162245
93	2017-05-26	2017-05-26	22	Solicita CDP para adquisicion de equipos informaticos	163309
94	2017-05-26	2017-05-26	36	Remisión versión impresa y magnética, la estimación de secciones y aulas requeridas, asi como estimaciones de matriculas	158460
96	2017-05-26	2017-05-26	14	Solicitud de cambio de denominación de categoría salarial de Mirna Vera	161489
73	2017-05-22	2017-05-22	59		155644
115	2017-06-02	2017-06-02	18	Expediente 170344 - 153738. Anteproyecto de Presupuesto Institucional 2018 de la Dirección General de Curriculum, Evaluacion y Orientacion. Xilema Nº 153.738/17	170344
95	2017-05-26	2017-05-26	14	Solicitud de Traslado definitivo con linea presupuestaria  Gerardo Andrés Barrientos Díaz.	163466
97	2017-05-29	2017-05-29	61	Lazo Verde - Día Nacional contra el Maltrato, Abuso Sexual y Laboral de Niños, Niñas y Adolescentes del Paraguay.	161587
79	2017-05-24	2017-05-24	18	Propuesta del Instituto Azreli de Jerusalen para tecnicos (en el mismo se respondio el Expediente Nº 159.169)	134173
99	2017-05-29	2017-05-29	62	Solicita informe referente a Adjudicaciones, Llamados Plurianuales, Deudas por Alquileres y Còdigos de Contrataciones	156555
101	2017-05-31	2017-05-31	22	Memo DPP N° 83/2017 CD N° 885/2017. Anteproyecto 2018 versión impresa de Contrataciones	167373
102	2017-05-31	2017-05-31	33	Memo RI N° 483. Remitir ejecución de ingresos mes de mayo en los objetos de gasto 834 y 894.	167739
103	2017-05-31	2017-05-31	18	envia Maria Teresa Servín secretaria privada del Ministro Riera la NOTA BID N° 473/2017. modificación contractual - reasignación de fondos de préstamo 1880/BL-PR Programa Escuala VIVA II; y 2420/OC-PR; 2420/BL-PR Programa de Reconversión del CENtro , Modernización del Transporte Público Metropolitani y Oficinas del Centro.	167284
104	2017-05-31	2017-05-31	33	Memo RI N° 482. Solicita CDP mes de junio del OG 834 y 894 fuente 30.	167754
105	2017-05-31	2017-05-31	18	viatico al interior	168594
106	2017-05-31	2017-05-31	18	viatico al interior	168596
107	2017-05-31	2017-05-31	18	Incorporacion del Paraguay a la Francofonia	144382
108	2017-05-31	2017-05-31	18	Encuesta para referentes de comisiones a area MERCOSUR	168084
109	2017-05-31	2017-05-31	18	SINADI remite propuesta para inclusion en el anteproyecto	168058
110	2017-06-01	2017-06-01	33	Solicita CDP en el marco de la Gratuidad de la Educación Media - Mes de Junio 2017	168603
111	2017-06-01	2017-06-01	33	Solicita CDP en el marco de la Gratuidad de la Educación Media - Mes de Junio 2017	168602
222	2017-06-14	2017-06-14	50	Memo DGGTH Nro 1868/2017 en marco de la implementacion de planes para la evaluación de desempeño de funcionarios	183031
100	2017-05-31	2017-05-31	50	Nota DGGTH N° 60/2017. Datos  Adicionales de Talento Humano para Anteproyecto 2018 	165670
113	2017-06-01	2017-06-01	35	Memo DASyB N° 563/2017. Datos adicionales de Sueldos y Beneficios, en forma impresa y digital, para elaborar Anteproyecto de Presupuesto 2018	156721
114	2017-06-02	2017-06-02	18	Monica Raquel Cantero Leiva solicita reajuste salarial.	170119
116	2017-06-02	2017-06-02	18	Memo DGAF N° 2273. Viático Interior por Gs 29.687.999	170873
117	2017-06-02	2017-06-02	18	Memo DGAF N° 2275. Viático Interior por Gs. 19.767.862	170855
118	2017-06-02	2017-06-02	18	Memo DGAF N° 2274. Solicitar CDP Viático Interior por Gs. 18.719.496	170860
119	2017-06-02	2017-06-02	18	Memo DGAF N° 2272. Solicitar CDP Viático Interior por Gs. 5.500.000.	170878
120	2017-06-02	2017-06-02	33	EXP. 156551-166810-168658-159015-165288. Exp. 158095-167366-162859-160009-157195. Memo DF N° 876. Anteproyecto de presupuesto 2018 con CD de la Dirección Financiera.	156551
121	2017-06-02	2017-06-02	33	Memo DT N° 1353/2017. Datos adicionales de financiero: Listado de Gastos judiciales, Salarios Caídos y Devoluciones.	171201
122	2017-06-02	2017-06-02	33	Exp. 68909, 165490 y 162306. Memo DT N° 1354/2017 Solicitar CDP OG 910 correspondiente a los tres expedientes 68909, 165490 y 162306/17	68909
124	2017-06-02	2017-06-02	14	Memo DGG N° 1688/2017 Viático del Ministro al Exterior a Argentina reunión de ministros de educación del MERCOSUR	171904
123	2017-06-02	2017-06-02	14	Memo DGG N° 1579/2017. Viatico Exterior  para Celeste Mancuello y Alice Escobar para Argentina Reunión  Sector Educativo MERCOSUR	171665
223	2017-06-15	2017-06-15	36	Propuesta de capacitación en "Gestión para resultados en el sector publico"	168367
126	2017-06-02	2017-06-02	18	Solicita viatico a Buenos Aires - Argentina para Enrique Riera Escudero Gs. 9.413.040	171904
138	2017-06-05	2017-06-05	31	Memo DGRI y EI. Anteproyecto de Presupuesto 2018 en forma impresa.	154471
98	2017-05-29	2017-05-29	18	Referente a la deuda de Paraguay como estado miembro de la UNESCO Gs. 37.338 EUROS	165065
127	2017-06-02	2017-06-02	46	Memo N° 256/17. Anteproyecto 2018 formularios F-G02-1, F-G02-2 y F-G03 en formato impreso y digital (CD).	154589
128	2017-06-02	2017-06-02	22	Memo DPP N° 85/2017 CD N° 909/2017. Solicitar CDP para el llamado "Adquisición de Artículos de Linmpieza" por un monto de Gs. 50.000.000.	172288
129	2017-06-02	2017-06-02	31	Memo DGRI y EI N° 711. Anteproyecto 2018 de DGRI y EI, formularioa F-G02-2, F-G03 y POI 	154471
130	2017-06-02	2017-06-02	63	Mwmo DGEP N° 449/2017. Anteproyecto 2018 de Direc. Gral. de Educ. Permanente, impreso y digital (CD) formularios FML, F-G02-2, F-G03, formualrios de ingresos, Plurinual, Crecimiento natural	172328
131	2017-06-02	2017-06-02	39	NOTA N° 213. Anteproyecto 2018 de Educ. Indígena impreso y digital (CD) F-G02-1, F-G02-2, F-G03 POI aprobado 	172478
132	2017-06-02	2017-06-05	49	Exp. 156689 y 172414. Memo  D. A. N° 1441/2017. Datos Adicionales para el Anteproyecto de Presupuesto 2018 de la Dirección Administrativa en forma impresa.	156689
133	2017-06-05	2017-06-05	18	Solicita CDP - Gastos Terminales para la Lic. Delma Orietta Mendoza, Directora Gral. de Becas	172528
134	2017-06-05	2017-06-05	64	Memo DGETP N° 422/17. Anteproyecto 2018 de Educación Técnica con POI aprobado en forma impresa y digital.	171254
135	2017-06-05	2017-06-05	14	Memo DGG N° 1517/2017. Solicita CDP viático Exterior el Viceministro José Arce Fariña para participar en reunión  de la CRC-ES a llevarse a cabo en Buenos Aires- Argentina.	172992
136	2017-06-05	2017-06-05	65	Memo DGEM N° 1534/17. Anteproyecto 2018 de Educ. MEdia. con POI aprobado en forma impresa y digital.	153705
137	2017-06-05	2017-06-05	66	Nota D.T.A. N° 146/2017. Anteproyecto 2018 de la Dirección de Transparencia y Anticorrupción con POI Aprobado y Plurianual en forma impresa y digital	172461
139	2017-06-05	2017-06-05	28	Memo N° 638/2017. Anteproyecto 2018 de Gestión Social con POI aprobado en forma impresa y digital.	171984
140	2017-06-05	2017-06-05	67	Memo DGAI N° 667/2017. Anteproyecto de Presupuesto 2018 con Plurianual y POI Aprobado en forma impresa y digital.	172285
141	2017-06-05	2017-06-05	54	Memo VMC N° 233/2017. Anteproyecto 2018 de Culto en forma impresa y digital, con POI aprobado	173523
142	2017-06-05	2017-06-05	63	Memo DGEP N° 449/2017. Anteproyecto 2018 de Permanente provisionado desde DGAF en forma impresa y digital	172328
143	2017-06-05	2017-06-05	40	Memo DGFPE N° 1312/2017. Anteproyecto 2018 de Fortalecimiento y Plurianual con POI aprobado en forma impresa y CD	173435
144	2017-06-05	2017-06-05	37	Memo DG-DIGEI N° 340/2017. Anteproyecto de Presupuesto 2018 de Inclusiva con POI Aprobado,Creciemineto Natural, en forma impresa y CD.	174030
224	2017-06-15	2017-06-15	57	Memo N° 2222/2017. ANteproyecto de PResupuiesto Canasta básica de útiles escolares. en versión impresa	184030
226	2017-06-15	2017-06-15	12	Remisión de Resolución Nº 16086-Modificación de Cuotas	0
228	2017-06-15	2017-06-15	12	TRANSFERENCIA DE CRÉDITOS Y REPROGRAMACION DE GASTOS	0
230	2017-06-16	2017-06-16	18	Disponibilidad presupuestaria para pasajes y viaticos	184968
232	2017-06-16	2017-06-16	18	Solicitar disponibilidad presupuestaria por memo nro 2409 de 9 de junio	184964
234	2017-06-16	2017-06-16	18	Memo DGAF N° 2502. Solicitar CDP Viático Interior por Gs. 6500000	185433
236	2017-06-16	2017-06-16	18	Memo DGGTH N° 1908/17. Informe sobre Traslado de Sra. Maria Laura Dávalos Giménez	170026
238	2017-06-19	2017-06-19	22	Solicita reactivacion de codigos correspondiente al Consorcio GEOKAP	186656
240	2017-06-19	2017-06-19	33	Memo DAC N° 58. Solicitud de pago cuota OEI del ejercicio fiscal 2017 por USD 34755	129973
242	2017-06-19	2017-06-19	18	Memo DGGTH N° 1904/17. Autorización del EEN para contratación de personal para departamento de transporte.	185707
244	2017-06-19	2017-06-19	18	Referente a actualización de resolución para el proceso de concurso interno institucional para la despecarizacion	185234
246	2017-06-20	2017-06-20	76	 Solicita Estructura Presupuestaria	188527
248	2017-06-20	2017-06-20	20	Solicita CDP para pago en el Objeto de Gasto 910	180552
250	2017-06-20	2017-06-20	22	Memo DL N° 189/2017 DC N° 993/2017. informe sobre procesos licitatorios no procesados	189026
252	2017-06-20	2017-06-20	22	Memo DLC N° 51/2017 DC N° 992/2017. Solicitar CDP por 6.000.000 Gs. para pago de alquiler inmueble del ministerio de Hacienda en santa rita	175276
254	2017-06-20	2017-06-20	18	Memo DGG N° 1931/2017. Solicitar creación anexo del personal bellas artes y el ISE	187410
256	2017-06-20	2017-06-20	14	Memo DGG N° 1890/2017. Solicita Ayuda económica para 98 cursantes del porograma  de capacitación en Liderazgo Estratégico IX Promoción del IAEE para realizar viaje a Colombia	181274
258	2017-06-21	2017-06-21	14	Memo DGG N° 1960/2017. Solicita viático exterior para el Sr. Aníbal Zapattini para acompañar al ministro en Gira Asiática.	189135
260	2017-06-21	2017-06-21	22	 Solicita informe de disponibilidad presupuestaria en el Objeto de Gasto de 520 Construccciones	190484
262	2017-06-22	2017-06-22	18	Solicitud de constancia de disponibilidad de cupos DGASPyDE	188964
264	2017-06-22	2017-06-22	18	solicitud de certificación presupuestaria de viatico al interior.	191752
266	2017-06-22	2017-06-22	73	remite propuesta para modificación de la Ley de Presupuesto en el anteproyecto	191834
269	2017-06-23	2017-06-23	14	nota de Ruben Dario Irala, solicita modificar el art 42 de la ley de presupuesto general de gastos	192145
271	2017-06-23	2017-06-23	46	anteproyecto Informatica	193048
273	2017-06-23	2017-06-23	33	Solicita CDP del Objeto de Gasto 260	192602
276	2017-06-26	2017-06-26	59	Memo UEPP N° 286. ANteproyecto 2018 de la UEPP	194148
278	2017-06-26	2017-06-26	18	solicitud de cdp para viaticos	194442
280	2017-06-26	2017-06-26	18	SOLICITA VIATICO AL INTERIOR - MONTO TOTAL DE GS. 23.082.969	194612
282	2017-06-26	2017-06-26	18	pedido de cdp para viaticos	194489
284	2017-06-26	2017-06-26	18	Memo DGAF N° 2643. Solicita rectificación de CDP a viático interior	195495
286	2017-06-26	2017-06-26	50	PRESUPUESTO DE PLURIANAUAL 2018 - 2020 DE LA DGGTH	194625
288	2017-06-26	2017-06-26	18	SOLICITA RECTIFICION DEL MEMORÀNDUM DGAF Nº 2274 - MES DE MAYO	195606
290	2017-06-27	2017-06-27	42	Memo DI N° 1086/2017. Presupuesto Plurianual 2018 - 2020 en versión impresa	196291
292	2017-06-27	2017-06-27	18	se tiene en cuanta el PGN 2017 replicando el PGN 2018, de la Direccion de Gabinete Tecnico	195330
295	2017-06-28	2017-06-28	36	solicita informe para financiar en la capacitación de Gestión para Resultados en el Sector Publico para Laura Beatriz Ramirez y Celeste Mancuello	168367
297	2017-06-28	2017-06-28	18	anteproyecto de Unidad coordinadora de proyectos	198884
299	2017-06-29	2017-06-29	22	solicita activacion de codigo correspondiente a Data System	199285
301	2017-06-28	2017-06-29	14	Autorización del EEN para compra de automoviles ANEAES	198803
303	2017-06-29	2017-06-29	18	Memo DGAF N° 2712. Solicita Viático Interior por Gs. 23.347.422	200163
408	2017-08-10	2017-08-10	20	Solic CDP 910	256254
146	2017-06-05	2017-06-05	49	Memo DA N° 1435/2017. Solicitar CDP OG 2017 SERVICIOS BÁSICOS mes de Junio.	173459
147	2017-06-05	2017-06-05	49	Memo DA N° 1436/2017. Solicitar CDP mes de Junio para los rubros de TASAS ESPECIALES y PATENTE RODADOS	173471
148	2017-06-05	2017-06-05	68	Memo DGB N° 218/17. Anteproyecto de Becas con POI aprobado en versión impresa y CD	174392
149	2017-06-05	2017-06-05	49	Solicitad la inclusion de Centros Educativos como beneficiarios de la colación alimentaria.	164051
150	2017-06-05	2017-06-05	49	MEMO DA N° 1308/2017. Elevar Estado de Cuenta COPACO mes de abril 2017.	174500
151	2017-06-05	2017-06-05	49	MEMO DA N°  1306/2017. Elevar Estado de Cuenta con la ANDE mes de abril 2017	174497
152	2017-06-05	2017-06-05	49	Memo DA N° 1136/2017. Elevar Estado de Cuenta ESSAP al 04/2017	174504
153	2017-06-05	2017-06-05	18	MEMO DGAF N° 2306. remsión informe CDP de rubro PASAJES Y VIÁTICOS	174562
154	2017-06-05	2017-06-05	18	MEMO DGAF N° 2319. SOLICITAR CDP OG 230 MES DE JUNIO VIÁTICO INTERIOR	174567
155	2017-06-05	2017-06-06	35	Memo DASyB N° 581/2017. Anteproyecto de Presupuesto 2018 y Plurianual con CD. Descripcion:\t	174601
156	2017-06-05	2017-06-06	17	Memo N° 638. Anteproyecto y Plurianual con POI aprobado en forma magnética e impresa.	153586
157	2017-06-02	2017-06-06	22	Solicitud de Disponibilidad Presupuestaria para Llamado a Licitación para Adquisición de Articulos de Limpieza - Gs. 50.000.000	172288
158	2017-06-06	2017-06-06	18	APAPP - Invitación para un curso de capacitación profesional sobre "Gestión para Resultados".	161331
159	2017-06-06	2017-06-06	64	Memo DGETP N° 429/17. Anteproyecto 2018 con POI en copia de Educ. Técnica.	174496
160	2017-06-06	2017-06-06	18	MEMO DGAF N° 2322. Solicitar CDP Viático Interior por Gs. 112.052.514	174859
112	2017-06-01	2017-06-01	18	Propuesta de capacitación a técnicos del área de la Administración y Financiera	167598
161	2017-06-06	2017-06-06	14	Memo DGG N° 1777/2017. Solicitar CDP Viático Exterior para la Sra. ALice Escobar Yegros a Buenos Aires Argentina para reunión de trabajo de Indicadores del Sector Educativo del MERCOSUR.	174927
162	2017-06-06	2017-06-06	12	Solicitar informe a la Dirección Financiera sobre nómina de reemplazos por maternidad y personas afectadas con salarios caídos.	0
163	2017-06-06	2017-06-06	42	Memo DI N° 977/2017. Anteproyecto F-G02-2 y F-G03 de Infraestructutra en forma impresa y digital.	175232
125	2017-06-02	2017-06-02	14	Memo DGG N° 1473/2017. Viático Exterior a Argentina para Anibal Zabattini Reunión de Ministros de Educación del MERCOSUR	171822
164	2017-06-06	2017-06-06	14	MEMO DGG N° 1785/2017. Remsión de Nota ENN N° 35/17 presentada por Lea Giménez Duarte Secretaria Ejecutuva del EEN por la cual autoriza nombramiento de 225 técnicos adminsitrativos.	175343
165	2017-06-06	2017-06-06	38	Memo DGCIE N° 397/2017. Anteproyecto 2018 con POI aprobado de la DGCIE en medio impreso y digital	175661
166	2017-06-01	2017-06-06	18	Nota CGR/DGA/DF N° 36/2017. Solicita documentaciones para traslado definitivo de María Laura Dávalos funcionaria del MEC a la Contraloría.	170026
167	2017-06-06	2017-06-06	36	Memo DPE N° 659/2017. Anteproyecto 2018 y POI de Planificación Educativa en forma impresa y CD.	175447
168	2017-06-06	2017-06-06	18	Memo DGAF N° 2355. Solicitar CDP Viático Interior por Gs. 5.666.850	175699
169	2017-06-06	2017-06-06	18	Memo DGAF N° 2331. Solicitar CDP Viático Ineterior por Gs. 4.949.050	175968
170	2017-06-06	2017-06-07	33	actualización de la certificación sobre disponibilidad en objeto 910 correspondiente a Pago a Juez Instructor	175717
171	2017-06-06	2017-06-07	18	Matriz de indicadores de desempeño 2018 de la Dirección General de Educación Permanente	175728
172	2017-06-06	2017-06-07	18	Reconsideracion especial en lo referido al reajuste salarial de funcionarios administrativos	170321
174	2017-06-06	2017-06-07	20	Certificacion de disponibilidad de el objeto 910	175719
173	2017-06-06	2017-06-07	71	Certificado de disponibilidad presupuestaria en el objeto 851	153376
175	2017-06-07	2017-06-07	18	MEMO DGAF N° 2346. Solicitar Viático Interior por Gs. 19.607.301	176124
176	2017-06-07	2017-06-07	49	Memo D.A. N° 1481/2017. Anteproyecto 2018 de la Direc. Administrativa, y designación de funcionario responsable en forma impresa y CD.	154252
177	2017-06-07	2017-06-07	67	Memo DGAI N° 684/2017. solicita disponibilidad presupuestaria para participar en el XX Congreso de Contadores	176257
178	2017-06-07	2017-06-07	18	PAGO DE VIATICO A LA COORDINACIÓN GRAL. OPERATIVO KITS TEXTOS 2017	170878
179	2017-06-07	2017-06-07	33	Memo DF N° 877.Anteproyecto de presupuesto 2018 Recursos Institucionales de la Dirección Financiera	176860
180	2017-06-07	2017-06-07	49	   MEMO N° 0134. Solicita Centro de Estudiantes del CNC ser beneficiario de almuerzo escola	176826
181	2017-06-08	2017-06-08	50	Solicita reembolso por compra de cubiertas para viaje a Ciudad de Filadelfia, realizado en fecha 10 al 12 de mayo de 2017	167962
182	2017-06-08	2017-06-08	64	Memo DGETP N° 438/17. documento adjunto del Anteproyecto 2018 de Educ. Técnica y Profesional a ser anexado al Exp. 176968.	176968
183	2017-06-08	2017-06-08	18	Nota FLACSO N° 0011/2017. Complemento del Anteproyecto 2018 de FLACSO-PY al expediente 159.570.  	176880
184	2017-06-08	2017-06-08	35	Memo DASyB N° 592/2017. datos estadísticos de Subsidio Familiar por hijo menor para el anteproyecto 2018.	178277
185	2017-06-08	2017-06-08	22	Memo DPP N° 89/2017 CD N° 940/2017. Solicita CDP en el marco de la licitación por Conscurso de ofertas "Adquisición de Muebles de oficina" por Gs. 600000000.	178179
186	2017-06-08	2017-06-08	35	Datos Estadísticos Subsidio Familiar, Datos adicionales para el Anteproyecto de Sueldos y beneficios 2018.	178217
187	2017-06-08	2017-06-08	33	Memo DT N° 1390/2017. Lista de reemplazo por Maternidad y Salarios Caídos. 	177368
188	2017-06-08	2017-06-08	14	Memo DGG N° 1807/2017. solicitar viático para la viceministra  María del Carmen Giménez para participar en el Seminario  a llevarse a cabo en Washington DC	178284
189	2017-06-08	2017-06-08	14	Memo DGG N° 1761/2017. Solicitar Viático exterior para el Sr. Pedro Vera para visita técnica en CHile	178289
190	2017-06-08	2017-06-08	18	Memo DGAF N° 2378. Solicitar CDP viático interiro para operativo Kits por Gs. 6.000.000	178378
191	2017-06-08	2017-06-08	18	Memo DGAF N° 2377. Solicitar CDP viatico interior por Gs. 1.662.276	178379
192	2017-06-08	2017-06-08	73	SOLICITA LA INCLUSION DE LAS PROPUESTA DEL SIFEMEC EN EL ANTE PROYECTO DEL MEC PARA EL 2018	178412
193	2017-06-08	2017-06-08	50	REMITE ANTEPROYECTO DE PRESUPUESTO 2018 EN FORMATO DIGITAL (CD) E IMPRESO	154040
194	2017-06-08	2017-06-08	14	solicita viatico para Alejandrino Acuña a realizarse en la ciudad de Bogota - Colombia	178400
195	2017-06-09	2017-06-09	62	solicitan reactivacion del codigo correspondiente a  TES Ingenieria, contratacion directa para cableado estructurado del edificio colonial.	178862
196	2017-06-09	2017-06-09	14	SOLICITA VIATICO AL EXTERIOR PARA JOSE ARCE FARINA A SANTIAGO - CHILE	178289
197	2017-06-09	2017-06-09	22	Memo DPP N° 91/2017 CD N° 946/2017. Solicitar estructura presupuestaria por Gs. 5.181.000 para  artículos de limpieza	179383
198	2017-06-09	2017-06-09	14	Memo DGG N° 1841/2017. Anteproyecto 20018 de la Direc. Gral. de Gabinete en forma impresa	179326
199	2017-06-09	2017-06-09	22	SOLICITA LA COMPRA DIRECTA DE LOS MATERIALES DIFERENCIADOS, A TRAVÉS DEL OBJETO DE GASTO 834	179793
200	2017-06-09	2017-06-09	14	Solicita atención a problemática suscitada con el pozo ciego del Colegio Nacional "Dr. Juan Manuel Frutos"	178593
201	2017-06-09	2017-06-09	14	SIFEMEC solicta la inclusion de presupuesto en el Anteproyecto de Presupuesto 2018	178578
202	2017-06-09	2017-06-09	73	Solicita la inclusiòn del subsidio familiar o bonifaciòn familiar y pago correspondiente por Gs. 80.000 p/5324 funcionarios/as	178406
203	2017-06-13	2017-06-13	18	SOLICITA CDP, MONTO TOTAL GS. 18.719.496 CORRESPONDIENTE A VIATICO AL INTERIOR	170860
204	2017-06-13	2017-06-13	18	SOLICITA CDP, MONTO TOTAL GS. 18.719.496 CORRESPONDIENTE A VIATICO AL INTERIOR	170860
205	2017-06-13	2017-06-13	18	SOLICITA CDP, MONTO TOTAL GS. 19.767.862 CORRESPONDIENTE A VIATICO AL INTERIOR	170855
206	2017-06-13	2017-06-13	18	SOLICITA CDP, MONTO TOTAL GS. 29.687.999 CORRESPONDIENTE A VIATICO AL INTERIOR	170873
207	2017-06-13	2017-06-13	18	SOLICITA CDP, MONTO TOTAL GS. 19.607.301 CORRESPONDIENTE A VIATICO AL INTERIOR	176124
208	2017-06-13	2017-06-13	14	solicitud de pago de pasajes y viaticos para Aida Torres de Romero para un congreso a realizarse en Serbia	176815
209	2017-06-13	2017-06-13	14	pedido de pasajes y viaticos de Sonia Rocio Alonso Sosa para expociencias en Mexico en noviembre de 2017	178928
210	2017-06-13	2017-06-13	18	Pedido de certificación de pasajes y viáticos para viajes al interior del país.	180696
211	2017-06-13	2017-06-13	69	POI y Presupuesto 2018	179794
212	2017-06-13	2017-06-13	57	Anteproyecto de presupuesto 2018	179807
213	2017-06-13	2017-06-13	32	Anteproyecto 2018	180813
214	2017-06-13	2017-06-13	18	circular, el personal de soporte de informatica estara realizando un revelamiento en el parque tecnologico del MEC 	180241
215	2017-06-13	2017-06-13	18	Solicitar reprogramacion presupuestaria y del anexo de personal, consejo nacional de educación y ciencias	181246
216	2017-06-14	2017-06-14	18	solicita CDP para viatico al interior mes de  la comisión de servicio junio Gs. 30.298.748	181683
217	2017-06-14	2017-06-14	18	solicita CDP para viatico al interior mes de  la comisión de servicio junio Gs. 10.275.888	181692
218	2017-06-14	2017-06-14	74	N. N° 68/2017. Anteproyecto en versión impresa y digital de CONEC	182365
219	2017-06-14	2017-06-14	12	Resolución D.G.P N°62 remisión a financiero y a Sueldos	0
220	2017-06-14	2017-06-14	14	solicita la transferencia de creditos de los objetos de gastos corrientes con ff10	181087
225	2017-06-15	2017-06-15	75	Memo DGDPE N° 308/2017.Anteproyecto impreso y digital de la Direc. Gral. de Desarrollo Profesional del Educador.	184067
227	2017-06-15	2017-06-15	22	Solicitud de disponibilidad presupuestaria objeto 530	184596
229	2017-06-16	2017-06-16	18	certificación presupuestaria de pasajes y viaticos	184989
231	2017-06-16	2017-06-16	18	Solicitud de disponibilidad presupuestaria para pasajes y viaticos	184984
233	2017-06-16	2017-06-16	63	Memo DGEP. N° 482/2017. Ajustes en el Anteproyecto de permanente en el Producto 36 Canastas básicas OG 340 impreso y digital	185063
235	2017-06-16	2017-06-16	18	Memo DGAF N° 2503. Solicitar CDP Viático Interior por Gs. 46.568.914	185760
237	2017-06-19	2017-06-19	18	Solicita disponibilidad presupuestaria para solvertar gastos de manutencion de bienes semovientes (ganado)	186030
239	2017-06-19	2017-06-19	49	Solicitud de instituciones educativas como beneficiados del almuerzo escolar	187311
241	2017-06-19	2017-06-19	18	Solcitud de ayuda económica para participar en el marco de programa de capacitación en liderazgo estratégico IX para viajar en COlombia para alumnos del instituto de altos alumnos 	187236
243	2017-06-19	2017-06-19	33	Memo D.F. N°. Solicitar informe de  Ejecución Presupuestaria de los recursos del FONDO PARA LA EXCELENCIA DE LA EDUCACIÓN Y LA INVESTIGACIÓN.	187357
245	2017-06-20	2017-06-20	18	viatico al interior	187643
247	2017-06-20	2017-06-20	77	 Se solicita incluir en el Anteproyecto de Presupuesto para el Ejercicio Fiscal 2018 	179793
249	2017-06-20	2017-06-20	37	remite anteproyecto	189059
251	2017-06-20	2017-06-20	45	anteproyecto de viceministerio de educ. superior en forma impresa	188282
253	2017-06-20	2017-06-20	18	Memo DGG N° 1903/2017. Solicitar CDP para viático exterior Natalia Ovando Campuzano y Pedro Ramírez	181929
255	2017-06-20	2017-06-20	65	Presupuesto plurianual de educación media en forma impresa y digital	188427
257	2017-06-21	2017-06-21	18	Anteproyecto Gestion Social	189113
261	2017-06-22	2017-06-22	18	viatico al interior	191038
263	2017-06-22	2017-06-22	14	Pedido de Ana Maria Baiardi, solicitud de incorporacion de recursos financieros en el Anteproyecto 2018	188064
265	2017-06-22	2017-06-22	18	viatico al interior	191996
267	2017-06-22	2017-06-22	36	envio de formularios, Presupuesto plurianual, F-G02, F-04	154299
270	2017-06-23	2017-06-23	18	pedido de certificacion presupuestaria para viaticos al interior	192696
272	2017-06-23	2017-06-23	45	modificacion del anteproyecto del Viceministerio de Educación Superior	193056
274	2017-06-23	2017-06-23	68	anteproyecto plurianual 2018-2020	193512
275	2017-06-26	2017-06-26	37	Memo DG-DIGEI N° 372/2017. Adjunto al anteproyecto de inclusiva a ser canjeado por el expediente N° 174030	194436
279	2017-06-26	2017-06-26	18	pedido de cdp para viaticos	194454
281	2017-06-26	2017-06-26	18	pedido de cdp para viaticos	194463
283	2017-06-26	2017-06-26	18	pedido de cdp para viaticos	194482
277	2017-06-26	2017-06-26	31	presupuesto plurianual 2018-2020	193578
285	2017-06-26	2017-06-26	18	Memo DGAF N° 2656. solicita CDP viático interior	195504
289	2017-06-27	2017-06-27	18	viatico al interior	196056
291	2017-06-27	2017-06-27	42	solicitar información referente al presupuesto general de la nación 2016	196282
293	2017-06-27	2017-06-27	20	SOLICITA CDP EN EL OBJETO DE GASTO 910, CONCEPTO SUMARIO ADMINISTRATIVO	197042
294	2017-06-28	2017-06-28	69	Solicita informe sobre disponibilidad presupuestaria - viáticos y vehículos con cofer	197802
298	2017-06-28	2017-06-29	18	solicita creación de 126 cargos para supervisores en el  2018 	198933
300	2017-06-29	2017-06-29	57	Memo N° 2498/2017. solicita prever disponibilidad presupuestaria asignado para la dir. Gral. de Educ. Inicial y Básica en el Objeto de gasto 852 para el año 2018.	199811
302	2017-06-28	2017-06-29	79	Creación de Categorías para Bellas Artes	198882
296	2017-06-28	2017-06-28	57	Remisión Anteproyecto Anual Presupuesto Anual	198535
287	2017-06-26	2017-06-26	78	MAFALDA GUARANÌME	195605
304	2017-06-29	2017-06-30	18	Solicitud de Reprogramación para cargos de supervisor	25091
305	2017-06-30	2017-06-30	18	pedido de CDP para viatico al interior del pais, mes junio	201484
306	2017-06-30	2017-06-30	18	pedido de CDP viatico al interior del pais, mes de junio	201502
307	2017-06-29	2017-06-30	18	creación de cargos para supervisores	193329
308	2017-06-30	2017-06-30	39	Nota N° 246.Presupuesto Plurianual 2018-2020 de la Dirección General de Educación Indígena en formato impreso y con CD	193617
309	0201-06-23	2017-06-30	18	viatico al interior	202647
310	2017-06-30	2017-06-30	33	solicita CDP de los OG 834 y 894 correspondientes al mes de julio	201415
311	2017-06-30	2017-06-30	33	remite ejecución de los OG 834 y 894 del mes de junio	201423
312	2017-07-03	2017-07-03	50	Solicitud de reserva de disponibilidad presupuestaria en el Objeto de Gasto 290	200821
313	2017-07-03	2017-07-03	34	Solicitud de actualización de certificación de disponibilidad presupuestaria objeto de gasto 834	204486
314	2017-07-03	2017-07-03	34	Solicitud de actualización de certificación de disponibilidad presupuestaria objeto de gasto 834	204474
315	2017-07-03	2017-07-03	49	solicitud de Disponibilidad Presupuestaria tazas especiales y patente de rodados	204999
317	2017-07-04	2017-07-04	49	SOLICITA CDP EN EL OBJETO DE GASTO 210 - SERVICIOS BÁSICOS PARA EL MES DE JULIO	205006
318	2017-07-04	2017-07-04	33	Solicita CDP de cuentas - Contabilidad	205090
319	2017-07-04	2017-07-05	77	Solic de estructura presupuestaria Objeto de gasto 220	207115
320	2017-07-06	2017-07-05	22	Solicita estructura presupuestaria "Servicios de Comunicación de Datos"	208652
321	2017-07-05	2017-07-05	77	solicita estructura presupuestaria "Adquisición de Biblioteca para 342 Instituciones"	208632
322	2017-07-05	2017-07-05	77	solicita llamado para licitación de adquisición de equipos informaticos	208639
323	2017-07-06	2017-07-06	18	Solicita informe respecto al CDP mensual del OG 232	211208
324	2017-07-06	2017-07-06	33	Pedido de Adelanto de cuota mensual	211042
325	2017-07-06	2017-07-06	18	Solicita un informe respecto a la Disponibilidad Presupuestaria mensual (julio a diciembre del corriente año) en el Objeto de Gasto 230.	211208
326	2017-07-06	2017-07-06	18	Expedientes Nº 175.968, 176.124, 181.692, 181.683, 185.760, 187.643, 187.942, 189.591, 190.454, 178.379, 191.996, 194.612, 196.056 Solicita CDP en el Objeto de Gasto 230, Viatico al Interior	174859
327	2017-07-06	2017-07-06	18	Solicita viatico al interior	195504
328	2017-07-07	2017-07-07	22	Memo DPP N° 103/2017. Solicitar estructura presupuestaria para renovación de locación 2do semestre del año 2017	212748
329	2017-07-07	2017-07-07	33	solicita CDP para el primer desembolso OG 841	182983
330	2017-07-07	2017-07-07	33	Solicita CDP para primer desembolso Educ. Media OG 841	183017
331	2017-07-07	2017-07-07	33	solicita CDP para primer desmbolso Educ. Superior OG 841	197344
332	2017-07-07	2017-07-07	18	Solicita informe sobre la inclusión del caso LIBAMER S.R.L. c/ MEC s/ Cobro de Guaranies	211818
333	2017-07-07	2017-07-07	18	Memo DGG N° 2194/2017. Solicitud de Viático Exterior para la Sra. Digna Concepción Gauto de Irala para Chile.	214086
334	2017-07-10	2017-07-10	18	El Instituto Superior de Educación Dr. Raul Peña solicita la modificación del anexo de personal - Anteproyecto de Presupuesto	200571
335	2017-07-10	2017-07-10	18	SOLICITA GASTOS TERMINALES PARA LA SRA. DIGNA CONCEPCIÓN GAUTO DE IRALA	214086
336	2017-07-10	2017-07-10	33	respuesta al pedido de informe sobre saldo inicial de caja	208762
337	2017-07-10	2017-07-10	33	solicita transferencias financieras en los OG 834 y 894 a favor de la Esc. Nac. de Educ. Fisica	214398
338	2017-07-10	2017-07-10	18	invitacion sobre nutrición	216323
339	2017-07-11	2017-07-11	33	pago a juez instructor Graciela Barrios	216162
340	2017-07-11	2017-07-11	33	Pago a Juez Instructor a Lidia Onieva y Hugo Sanabrias Exp. 198247	202642
341	2017-07-11	2017-07-11	18	viatico al interior 	217210
343	2017-07-11	2017-07-11	18	Estado de cuenta Ande Mes de Julio 2017	216979
344	2017-07-11	2017-07-11	18	Estado de Cuenta Copaco mes de mayo 2017	216986
345	2017-07-11	2017-07-11	18	Estado de Ceunta ESSAP 05/ 2017	216989
346	2017-07-11	2017-07-11	18	ESTADO DE CUENTA ANDE JULIO 2017	217900
347	2017-07-11	2017-07-11	18	MEMO DGG N° 2233/2017. ANEAES SOLICITA MEDIACIÓN ANTE EL EQUIPO ECONÓMICO PARA AUTORIZAR UTILIZACIÓN RUBRO C3N VACANTE	216308
348	2017-07-11	2017-07-11	18	NOTA PR/GC/2017/5567. LEGAJO DE VICTOR MANUEL PEREIRA PARA SU TRASLADO DEFINITIVO DE PRESIDENCIA AL MEC	217314
349	2017-07-11	2017-07-11	22	MEMO DPP N° 105/2017 CD N° 1127/2017. SOLICITAR ESTRUCTURA PRESUPUESTARIA  POR GS 380.065.000 PARA ADQUISICIÓN DE CUBIERTAS	218176
350	2017-07-11	2017-07-11	49	Elevar a conocimiento Estado de Cuenta con la COPACO 	218182
351	2017-07-11	2017-07-11	49	Elevar a conocimiento Estado de Cuenta con la ESSAP	218178
352	2017-07-11	2017-07-11	20	Solicita CDP en el Objeto de Gasto 910, correspondiente a pago a Juez Instructor - Abogada Norma Gricelda Noguera Gimenez	109739
353	2017-07-12	2017-07-12	22	COMUNICACIÓN A LA DNCP NOTA DC Nº 490/91	220244
354	2017-07-12	2017-07-12	38	Solic  de asignación de viático en el marco de las TICS	218173
355	2017-07-13	2017-07-13	18	Col. Felix Estigarribia solicita apoyo economico	219840
356	2017-07-13	2017-07-13	22	Informe de Contratos de Locaciones	219869
357	2017-07-14	2017-07-14	64	Solicita aporte económico para solventar gastos de incripcion de 10 personas - Colegio Nacional EMD "Mcal. Jose Felix Estigarribia"	217927
358	2017-07-05	2017-07-14	22	Memo DC N° 1103. informar nota DC N° 472 sobre declaarción jurada de compromiso de contratación emitidos y no cancelados con afectación plurianual	209282
359	2017-07-17	2017-07-17	33	pago de juez instructor Angel Maciel y Luis Benitez	220096
360	2017-07-22	2017-07-26	50	Disponibilidad de crédito presupuestario de julio en el Objeto de Gasto 290	200821
361	2017-07-27	2017-07-27	33	Solicita CDP en el Objeto de Gasto 290, para participación de 4 funcionarios en XX SEMINARIO NACIONAL DE PRESUPUESTO PUBLICO	234738
362	2017-07-27	2017-07-27	18	Solicita CDP correspondiente a viatico al interior en el mes de julio 	234655
363	2017-07-21	2017-07-27	33	Solicitar CDP 290 para capacitacion en curso Gestión para resultados en el sector público	227945
364	2017-07-27	2017-07-27	59	nota caf N° 504. remitir plurianual en medio impreso del tipo de presupuesto 3	235066
365	2017-07-27	2017-07-27	50	Memo DGGTH N° 2342/17. Remitir legajo de Gerardo A. Barrientos Díaz	163466
366	2017-07-27	2017-07-27	69	Memo N° 1948/2017. solicita ayuda social la Funcionaria Sandra Carlson	234371
367	2017-07-27	2017-07-27	18	Sr. Rodrigo Medina Solicita apoyo para realizar la denominada "El Día de la Acción"	223042
368	2017-07-28	2017-07-28	18	viático interior	236804
369	2017-07-28	2017-07-28	18	viático interior	236817
370	2017-07-31	2017-07-31	80	Anexar al anteproyecto de presupuesto 2018 reconversión de categorías del CONAMU	237164
371	2017-07-31	2017-07-31	49	Solicitud de capacitación de la funcionaria Marta E. Cárdena Delgado con CI 3645785	236331
372	2017-07-31	2017-07-31	36	SOlicitud de reprogramación de  Educación Básica del OG  330 al OG 852	231621
373	2017-07-31	2017-07-31	33	Memo DT N° 1734/2017. Solicitar certificación presupuestaria en el OG 910 para pago de juez instructor en concepto de gastos de sumario adminsitrativo	237676
374	2017-07-31	2017-07-31	18	Pago de Cuota 2017 CERLALC	238752
375	2017-08-01	2017-08-01	33	remite ejecución de ingresos en los O.G. 834 y 894	239554
376	2017-08-01	2017-08-01	33	solicita CDP de los O.G. 834 y 894	239551
377	2017-08-01	2017-08-01	33	solicita CDP para pago de viaticos	239617
378	2017-07-26	2017-08-02	18	Resolución a autorización de traslado del funcionario Victor Pereira de Presidencia al MEC	216956
379	2017-08-02	2017-08-02	49	Memo DA N° 1944. solicitar disponibilidad OG 210 agosto 2017	241171
380	2017-08-02	2017-08-02	49	Memo DA N° 1945. Solcitar disponibilidad en rubros tasas especiales mes de agosto 2017.	241175
381	2017-08-02	2017-08-02	18	estado de cuenta ANDE mes de junio 2017	240769
382	2017-08-02	2017-08-02	18	estado de cuenta COPACO al mes de junio 2017	240774
383	2017-08-02	2017-08-02	18	Estado de cuenta ESSAP al 06/2017	240780
384	2017-08-02	2017-08-02	22	Memo DPP N° 106/2017 CD N° 1174/2017. Solicitar estructura presupuestaria para reactivación llamado de "Adquisición de Kits Escolares Plurianuales 2016/2017" por Gs. 18.314.490.062 	243310
385	2017-08-03	2017-08-03	33	Solicitar CDP OG 910 por Gs. 4533480 para pago Juez Instructor	243362
386	2017-08-03	2017-08-03	33	Pago a OEI - $95.418	164861
387	2017-08-01	2017-08-03	49	Presupuesto de Teisa sobre el cableado y central telefonica	237727
388	2017-08-07	2017-08-07	33	CDP para pago de BECAS correspondiente a Educación Media	183017
389	2017-08-07	2017-08-07	33	|CDP para pago de BECAS correspondiente a Educación Superior	197344
390	2017-08-07	2017-08-07	33	CDP para pago de BECAS correspondiente a Educación Superior por un monto de 3.252.450.000	182983
391	2017-08-07	2017-08-07	81	Solic. inclusión  Presupuesto 2.018 Gastos de Representación	246880
392	2017-07-28	2017-08-07	36	solicitud de repro del OG 330 al 852 de la Direc. Gral. educ Basica	231621
393	2017-07-31	2017-08-07	57	Remisión de Constancia STP para continuar reprogramación del OG 330 al 852	238903
394	2017-08-02	2017-08-07	78	Reprogramación presupuestaria de recursos asignados a la Educ. Básica - Convocatoria Reunión	243328
395	2017-08-07	2017-08-07	33	solicitar CDP para pago de participación en CEMAF	227495
396	2017-08-07	2017-08-07	33	Solicitar OG 910 para pago de Juez Instructor	247532
397	2017-08-07	2017-08-07	22	Solicitar disponibilidad presupuestaria por un monto de Gs. 25.458.408.000 para Serv. de embalaje y transporte de Kits Escolar.	248507
398	2017-08-07	2017-08-07	22	solicita disponibilidad presupuestaria por un monto de Gs. 737319600 para adquisición de cartones de títulos	249210
399	2017-08-07	2017-08-07	22	Solicita estructura presupuestaria para reactivación de código de contratación por Gs. 250000000 para gráfica zampirolobos en marco de adquisición de etiquetas de seguridad para viceministerio de educación superior	249229
400	2017-08-07	2017-08-07	71	Solic. de pago de cuotas adeudadas como estado miembro de la Organización de la Naciones Unidas(Unesco) Gs.251.482.180	153376
401	2017-08-08	2017-08-08	33	Solicita CDP para pago de gratuidad de la educación media - primer desembolso	249367
402	2017-08-08	2017-08-08	18	Solicita reiteración en el pedido de certificación de cupos disponibles para contratación a la DGASPyDE	249169
403	2017-08-08	2017-08-08	18	solicita reitación del pedido de actualización de la resolución proveniente del EEN 	247948
404	2017-08-09	2017-08-09	22	respuesta al Memorandum DP N° 1685, en el cual se solicito monto total a ser utilizado para la compra de cableados electricos	253472
405	2017-08-10	2017-08-10	22	Solic de disponibilidad presupuestaria	254750
406	2017-08-10	2017-08-10	22	Solic de estructura pesupuestaria para imputación	254715
407	2017-08-10	2017-08-10	33	Solicita contratacion de limpiadora la Dirección General de Educación Artisticas	251384
409	2017-08-11	2017-08-11	57	reprogramacion presupuestaria objeto 330, 842	257097
410	2017-08-11	2017-08-11	33	solicita actualizacion de CDP correspondiente al OG 834	256488
411	2017-08-14	2017-08-14	33	Remite carta de oferta para venta de inmueble al MEC	242852
412	2017-08-14	2017-08-14	12	remisión de la resolución N° 22110	0
413	2017-08-16	2017-08-16	18	solicita viatico al exterior para argentina	261057
414	2017-08-17	2017-08-17	22	Consulta sobre Disponibilidad Presupuestaria - Aprobado por Resolución Ministerial Nº 2293 de fecha 28 de febrero de 2017	262297
415	2017-08-18	2017-08-18	82	Carta Oferta de Inmueble presentada por la Cooperativa de Producción de Agro Industria y de Servicios "Coronel Oviedo Limitada"	263159
416	2017-08-18	2017-08-18	22	Compromisos de Contratación correspondiente a la empresa Atlas Representaciones S.A. emitido por la D.N.C.P	262139
417	2017-08-18	2017-08-18	22	Pago correspondiente a las siguientes firmas: Industrias Gráficas Nobel S.A., Kuatiapo S.A., Mercurio S.A.	263157
418	2017-08-18	2017-08-18	22	Consulta sobre Disponibilidad Presupuestaria - Resolución Ministerial Nº 2293 - 28 de febrero de 2017	262125
419	2017-08-18	2017-08-18	18	Remisión de Resolución Nº 22110, POR LA CUAL SE AUTORIZA LA TRANSFERENCIA DE CRÉDITOS Y LA MODIFICACIÓN DE LAS CUOTAS DE GASTOS DEL PLAN FINANCIERO DEL PRESUPUESTO DEL MEC 2017	262166
420	2017-08-18	2017-08-18	69	La Lic. Cynthia de Pistilli solicita el apoyo financiero al MEC para la realización de la 3ra. Expo Green del Paraguay	251506
421	2017-08-18	2017-08-18	22	Solicita Estructura Presupuestaria para la Adquisición de Materiales de Ferretería, por un monto estimado de Gs. 149.739.370	264123
422	2017-08-28	2017-08-18	18	el Señor Oscar Delgado solicita apoyo economico para curso de maestria en taiwan	262895
423	2017-08-21	2017-08-21	33	pago de honorarios a juez instructor	265220
424	2017-08-22	2017-08-22	69	Solicitud de apoyo económico para premio Escuela  Básica Nº 3.518	265620
425	2017-08-22	2017-08-22	14	MEmo DGG N° 2681 SOlicita recursos financieros para participación en la expo luque para la Lic. Beatriz Arrúa de Martínez	262225
426	2017-08-23	2017-08-23	18	Dir. Gral. de Curriculum convoca a mesa de trabajo sobre Reprogramación correspondiente a la Educación Básica	268431
427	2017-08-23	2017-08-23	18	Solicita informe referente a situación presupuestaria del Proyecto Ciudad Mujer	267488
428	2017-08-24	2017-08-24	18	Pedido de CDP para pago de viatico al interior	269220
429	2017-08-24	2017-08-24	18	Invitación para reunión	269169
430	2017-08-24	2017-08-24	18	La Sra. Fulvia Deidamia cede su titularidad en su cuenta bancaria	269502
431	2017-08-24	2017-08-24	33	pago de honorarios a juez instrutor	267089
432	2017-08-25	2017-08-25	22	LICITACIÓN PUBLICA NACIONAL POR LA SUBASTA A LA BAJA ELECTRÓNICA Nº 13/2016 "SERVICIO DE IMPRESIÓN Y COPIADO - PLURIANUAL 2016/2017", CONTRATO Nº 23/2016 - DATA SYSTEMS S.A.E.C.A.	264909
433	2017-07-26	2017-08-25	45	regularización o modificación linea presupuestaria de ISE CONAMU ISBA anteproyecto 2018	133490
434	2017-07-31	2017-08-25	63	Respuesta sobre aclaración de anteproyecto 2018 de educación permanente.	240275
435	2017-08-28	2017-08-28	20	Solicita CDP - BECAS EN EL OBJETO DE GASTO 841 PARA EDUCACIÓN SUPERIOR	272343
436	2017-08-28	2017-08-28	18	solicita ampliacion presupuestaria - programa almuerzo escolar	272240
437	2017-08-28	2017-08-28	22	Solicita CDP para llamado a licitación en concepto servicios de impresiones varias	272797
438	2017-08-28	2017-08-28	20	BECAS SOLICITA EDUCACIÓN MEDIA EN EL OBJETO DE GASTO 841	273407
439	2017-08-28	2017-08-28	14	LIC. ATILANO DETEZ BAEZ SOLICITA AYUDA ECONÓMICA PARA SOLVENTAR GASTOS DE VIÁTICOS Y MOVILIDAD	269950
440	2017-08-29	2017-08-29	65	NOTA DE INVITACIÓN A LA 3ERA. EXPO GREEN DEL PARAGUAY	261932
441	2017-08-29	2017-08-29	18	SOLICITA VIATICO AL INTERIOR MES DE JULIO Y AGOSTO - 2º GRUPO	275350
442	2017-08-30	2017-08-30	18	solicita disponibilidad presupuestaria para compra de pasaje aereo y gastos terminales en república de Togo	275319
443	2017-08-30	2017-08-30	76	SOLICITA ESTRUCTURA PRESUPUESTARIA 	275999
444	2017-08-30	2017-08-30	18	FENAES reivindica su acuerdo con el Poder Ejecutivo	275346
445	2017-08-30	2017-08-30	18	solicita nueva estructura presupuestaria para adquisición de articulos de ferreteria	276866
446	2017-08-31	2017-08-31	18	Invitación a reunión de becas al exterior	278038
447	2017-08-31	2017-08-31	18	Invitación a capacitación de diplomado en planificación educativa	0
448	2017-08-31	2017-08-31	18	SOLICITA CDP PARA VIATICO AL INTERIOR - 4 GRUPO MES DE AGOSTO	278685
449	2017-08-31	2017-08-31	18	remite resolución que acepta el traslado definitivo del Señor Victor Manuel Nuñez Ramirez	275176
450	2017-08-31	2017-08-31	18	SOLICITA CDP PARA VIATICO AL INTERIOR MES DE AGOSTO 5TO. GRUPO	278774
451	2017-09-01	2017-09-01	83	Solicita apoyo presupuestario de la Unión Europea - Tramo Variable	278689
452	2017-09-01	2017-09-01	33	Remisión de planilla de ejecución de ingresos en el mes de agosto OG 834 y 894	278747
453	2017-09-01	2017-09-01	33	solicita CDP al mes de setiembre en los OG 834 y OG 894 Fuente 30 	278723
454	2017-09-01	2017-09-01	85	La Sra. Magnolia Gaona solicita su linea presupuestaria	279713
455	2017-09-04	2017-09-04	14	Solicita postular personas para curso a través del INAN: Gestión Económica y Presupuestaria...	278403
456	2017-09-04	2017-09-04	49	Memo 2206/17 Solicita disponibilidad servicios básicos al mes de setiembre 2017	280244
457	2017-09-04	2017-09-04	49	Memo DA N° 2207/2017. Solicita CDP rubro tasas especiales y patente rodados para mes de setiembre 2017	280223
458	2014-09-04	2017-09-05	33	El ISE solicita autorización para proceder al pago de bonif, gtos de representación y responsabilidad en el cargo por FF30	250959
459	2017-09-05	2017-09-05	18	invitación a la Presentación de la plataforma de soluciones educativas para docentes y alumnos. el martes 5 a las 14 hs.	284448
460	2017-09-05	2017-09-05	77	Memo DP N°121 Remitir código de contratación LP -12007-17-137636 en el marco de Adquisición de pasajes aéreos  de liberación de saldo no usado de 300000000; quedando el saldo comprometido del mencionado código de 800.000.000 Gs a Gs 500.000.00 	284906
461	2017-09-05	2017-09-05	45	Solic. de disponibilidad presupuestaria fuente 30 objetos de gasto 834, 894	281802
462	2017-09-05	2017-09-06	33	Solicitar CDP para segundo desembolso de gratuidad Nivel MEdio al mes de setiembre	285451
463	2017-09-05	2017-09-06	33	Solicita pago de cuota adeudada correspondiente al ejercicio fiscal 2016 por Gs 191.952.000	132811
464	2017-09-05	2017-09-06	33	solicita cuota adeudadas como estado miembro de la UNESCO correspondiente al año 2016 y 2017 por Gs. 251482180	153376
465	2017-09-05	2017-09-06	18	Solicita viatico para viajae a colombia para participar en curso e Liderazgo del Instituto de ALtos Estudios estratégicos para Natalia Ovando y Pedro Ramírez	285514
466	2017-09-07	2017-09-07	34	Solic CDP objeto de gasto 834	287333
467	2017-09-07	2017-09-07	14	Comunica la aprobación del desembolso de 15.000.000 Euros en el Convenio de Financiación DCI-ALA/2015/038-7602"Programa de Apoyo a la Política del Sector de Educación en Paraguay"	285409
468	2017-09-07	2017-09-07	18	proyecto adquisición de libros informaticos	227969
469	2017-09-08	2017-09-08	14	Laura Liliana Delvalle solicita viatico - ciudad Brasilia, Brasil	289593
470	2017-09-08	2017-09-08	14	Nilsa Carmen Palacios Alvarenga solicita viatico - ciudad de Brasilia - Brasil	289602
471	2017-09-08	2017-09-08	14	Tomas Anibal Zapattini Lepretti solicita viatico en la ciudad de Brasilia - Brasil	289679
472	2017-09-08	2017-09-08	14	Eulalia Brizueña Bogado solicita viatico en la ciudad de Buenos Aires - Argentina	289548
473	2017-09-08	2017-09-08	14	Pedro Daniel Vera solicita viatico en la ciudad de Brasilia - Brasil	289696
474	2017-09-11	2017-09-11	18	solicita visto bueno para iniciar talleres en marco de CONSULTORIA DE APOYO A LA SECRETARÍA DE LA FUNCIÓN PÚBLICA	290719
475	2017-09-11	2017-09-11	33	SOLICITAR CDP EN EL OG 910 PARA PAGO DE JUEZ INSTRUCTOR CONFORME AL EXP 274121/17	289391
476	2017-09-11	2017-09-11	33	SOLICITAR CDP OG 260 PARA PAGO EN CONCEPTO DE COMISIONES BANCARIAS POR 110000 Gs	290861
477	2017-09-11	2017-09-11	33	remite respuesta a pedido de informe en el marco del apoyo presupuestario de la Unión Europea	278689
478	2017-09-12	2017-09-12	62	Solicita Estructura Presupuestaria 	292444
479	2017-09-12	2017-09-12	18	Se solicita hacer extensa la invitación a los Directores de Nivel, Jefes de Departamento y Equipos Tecnico	292427
480	2017-09-12	2017-09-12	20	Solicita CDP en el Objeto de Gasto 910	291477
481	2017-09-12	2017-09-12	22	Solicita CDP para la realización de Llamado a Licitación Pública Nacional "Impresiones Manueales"	293589
482	2017-09-13	2017-09-13	87	Solicita CDP en el Objeto de Gasto 851	90344
483	2017-09-14	2017-09-14	22	Solicita CDP por 150.000.000 Gs para ampliación del monto correspondiente al convenio PR/EJ N° 113/2017 d "Provisión de Combustibles y Lubricantes entre PETROPAR y el MEC	295600
484	2017-09-14	2017-09-14	22	Solicita CDP para activar plurianualidad del CC de la Bandeja por Gs. 4.933.859.850 y además adenda del monto del contrato por Gs. 4.255.370.640	295405
485	2017-09-14	2017-09-14	18	Solicita cobertura de costos en la actividad denominada Contexto Internacional que entre otras involucra un viaje de estudios a los EEUU	291159
486	2017-09-15	2017-09-15	18	solicita financiación para cubrir costos varios para el evento realizado en Tobati	297314
487	2017-09-15	2017-09-15	18	Solicita apoyo económico para el evento a cabo en Tobati	297314
488	2017-09-18	2017-09-18	14	Solicitar viático exterior para españa XVI congreso internacional de protocolo. Lourdes Lovera, Carolina enciso e Iris Nuñez	298369
489	2017-09-18	2017-09-18	14	Solcita viático exterior a Suiza el viceministro de culto para participar en "VII informe ...sobre la eliminación de todas las formas de discriminación contra la mujer (CEDAW)"	291909
490	2017-09-18	2017-09-18	22	Solicita CDP por Gs. 200000000 para Modificación del PAc con Id N° 327661 Licitación de "adquisición de Cubiertas" para nuevo monto de Gs. 235.000.000	299240
491	2017-09-18	2017-09-18	88	SOLICITA Disponibilidad Presupuestaria para el OG. 230"Viatico y Movilidad"	299420
492	2017-09-19	2017-09-19	18	Solicita CDP para pago de viatico al exterior - Buenos Aires Argentina	295771
493	2017-09-19	2017-09-19	18	Solicita CDP para pago de viatico al exterior-Madrid España	295784
494	2017-09-19	2017-09-19	18	viatico al exterior foz de yguazu - brasil	301059
495	2017-09-19	2017-09-19	18	viatico al exterior brasilia - brasil - expidio palacios	301026
496	2017-09-19	2017-09-19	22	llamado a licitacion adquisicion de kits escolares	301154
497	2017-09-19	2017-09-19	33	Memo DT N° 2154/2017. solicita educ inclusiva que sean contemplados enel PGN 2018 las bonificaciones de las jefaturas	285438
498	2017-09-20	2017-09-20	22	reactivación de codigo perteneciente a DINACOPA 	301671
499	2017-09-20	2017-09-20	12	Adenda al Proyecto Ejecutivo de Presupuesto 2018 por un monto de Gs. 5.500.000.000 rubro 520	0
500	2017-09-20	2017-09-20	22	Remite infome de comunicación a la DNCP	302913
501	2017-09-20	2017-09-20	18	Solicita el pago a la UNESCO	302906
502	2017-09-21	2017-09-21	18	N.N° 330. nota UNESCO recordatorio de pago de contribuciones adeudadas por Paraguay a la UNESCO como estado miembro	303101
503	2017-09-21	2017-09-21	18	SOLICITA ANULACIÓN DEL EXPEDIENTE Nº 291.909	302991
504	2017-09-21	2017-09-21	33	Memo DTR N° 383. Solicitar actualización certificación de disponibilidad presupuestaria OBJ 847 saldo a setiembre del programa 8 Formación de jóvenes y adultos	303530
505	2017-09-21	2017-09-21	33	Nota ISe en marco de Proyectos adjudicados al ISE por el CONACYT, legajo de expediente N° 292295	292295
506	2017-09-22	2017-09-22	33	solicita cdp para pago de comisiones bancarias	305397
507	2017-09-25	2017-09-25	77	INFORMAR Y COMUNICACIÓN A LA DNCP NOTA DC Nº 729 - LP-12007-15-110018	306849
508	2017-09-25	2017-09-25	20	SOLICITA CDP EN EL OBJETO DE GASTO 910, PARA ABG. ANDREA VERONICA IBARRA BARUJA	302888
509	2017-09-27	2017-09-26	18	Remitir copia autrenticada de resolución N° 259/17 por la que se acepta el traslado definitivo de la Sra. Margarita Inocencia Ramírez Casco	296745
510	2017-09-27	2017-09-27	49	Estado de cuenta COPACO al mes de Julio 2017	305571
511	2017-09-27	2017-09-27	49	Estado de Cuenta ANDE al Mes de Julio 2017	305560
512	2017-09-27	2017-09-27	49	elevar estado de cuenta ESSAP ciclo facturado 07/2017	305587
513	2017-09-29	2017-09-29	90	Gerardo Díaz Funcionario del MEC solicita cuadro explicativo del último salario percibibido en agosto 2008	314239
514	2017-09-29	2017-09-29	18	Memo DGG N° 3074. Solicita viático exterior para viceministra María del Carmen Giménez Suvilec para participar de seminario en Brasilia	314014
515	2017-10-03	2017-10-03	33	Solicita CDP de los Objetos de Gastos 834 y 894	315812
516	2017-10-03	2017-10-03	18	LIBAMER solicita copia del pedido de adenda al presupuesto del MEC	315933
517	2017-10-03	2017-10-03	22	Solicita CDP para adquisición de Banderas	315710
518	2017-10-03	2017-10-03	22	solicita CDP para pago a consultorias	315726
519	2017-10-03	2017-10-03	49	Solic. disponibilidad presupuestaria Objeto de Gasto 210-Servicios Básicos	316551
520	2017-10-03	2017-10-03	49	Solic. disponibilidad presupuestaria Objeto de Gasto 910-tasas y patentes	316557
521	2017-10-04	2017-10-04	91	REMITE PLANILLA DE EJECUCION DE INGRESOS REALIZADOS EN EL MES DE SETIEMBRE OBJETO DE GASTO 834 Y 894	316773
522	2017-10-04	2017-10-04	57	REPROGRAMACION OBJETO DE GASTO 842	316586
523	2017-10-04	2017-10-04	63	MEMORÁNDUM DGPE Nº 1108/2017 PLAN DE ACCIÓN 2023	316737
524	2017-10-04	2017-10-04	62	solic de reactivación del código Frigon	319750
525	2017-10-05	2017-10-05	91	Remitir ejecución Objeto de Gasto 834 y 894 	316773
526	2017-10-05	2017-10-05	18	solicita viatico al exterior a realizarse en Mexico	320742
527	2017-10-05	2017-10-05	18	remite programación de plan de caja del mes de octubre	321023
528	2017-10-06	2017-10-06	20	Certificación  del objeto de gasto 841	321805
529	2017-10-06	2017-10-06	20	Certificación  del objeto de gasto 841	321805
530	2017-10-09	2017-10-08	12	Reprogramación de gastos Gs. 4.139.970.253	0
531	2017-10-10	2017-10-09	22	reactivación de codigo para locacion de inmuebles para oficinas y depositos	328383
532	2017-10-10	2017-10-09	33	remiten planilla de transferencias procesadas de los Objetos de Gastos 834 y 894 correspondientes al mes de setiembre	326410
533	2017-09-25	2017-10-09	18	ISBA solicita incorporacion de nuevas categorias	298119
534	2017-10-10	2017-10-10	22	Solicitar disponibilidad presupuestaria en el marco del convenio PR/EJ N° 113/2017 "Provisión de Combustible y Lubricantes entre PETROPAR y el MEC	329359
535	2017-10-11	2017-10-10	18	Memo DGG N° 3235/2017. Solicitar viático para la viceministra María del Carmen Giménez para participar en el diálogo "Reformas educativas Latinoamérica y el Caribe...programas PISA y PIACC (OCDE) en Cartagena - Colombia	329256
536	2017-10-11	2017-10-10	18	memo DGG N° 3279/2017 Viceministro José arce solicita viático exterior para su participación en la Cumbre de Integración por la paz CUMIPAZ - 2017 organizada por la embajada mundial de activistas por la paz en Panama	330284
537	2017-10-12	2017-10-11	18	Memo DGG N° 3296/2017. Viático exterior para Jesús Adrián Barrios Chamorro para representar a Paraguay en el torneo panamericano de ajedrez de no videntes y baja visión en Panamá	330320
538	2017-10-12	2017-10-11	33	solicita colaboración para contribución anual al Organismo Internacional de Juventud	262928
539	2017-10-12	2017-10-11	33	Informe sobre deuda que tiene el MEC con el IPS	324788
540	2017-10-12	2017-10-11	22	reactivacion de codigos para construccion de aulas de primera infancia	331180
541	2017-10-12	2017-10-11	18	Remite informe de licitación publica para trabajos de perforacion de pozos para la inclusión en el anteproyecto 2018	271895
542	2017-10-12	2017-10-11	18	dejar sin efecto vistico al exterior - colombia	331208
543	2017-10-13	2017-10-12	18	invitacion a reunion sobre becas carlos antonio lopez	331465
544	2017-10-13	2017-10-12	18	Memo DGG N° 3309/2017. viático Exterior para Sra. Zully LLano de Acosta  a Ecuador en el marco del proyecto Aportes Estratégicos a la Reforma Profesional del Paraguay	332926
546	2017-10-13	2017-10-12	18	Memo DGG N° 3330/2017 Mensaje PE 607/17 invitación a tratar ampliación del MEC martes 17 octubre a las 09:20	332638
547	2017-10-17	2017-10-16	33	Solicita CDP para pago a Juez Instructor	320690
603	2017-11-16	2017-11-15	33	Solicitar reprogramación  presupuestaria  de caja chica	368577
548	2017-10-18	2017-10-16	33	Solicitar disponibilidad para participar en el Congreso Internacional de Protocolo Comunicación Corporativa Imagen Personal y Organización de Eventos  en España del 27 al 29 de noviembre de 2017.	334208
549	2017-10-18	2017-10-16	14	Memo DGG N° 1905/2017. Solicita CDP Viático exterior para Luciano Maldonado Director General de Talento humano para participar del XXII Congreso Internacional del CLAD sobre la Reforma del Estado y de la adm Pública a realizarse del 14 al 17 de noviembre de 2017 en Madrid España.	335604
550	2017-10-19	2017-10-17	18	Solicitar CDP Viático exterior para Director general de gabinete Nicolás Zárate para participar en foro mundial de ciencias en Jordania	335955
551	2017-10-18	2017-10-17	18	Solicita viático exterior para Daniel Pérez a Uruguay para participar de III Jornadas Nacionales de Investigación en Educación Superior 	336744
552	2017-10-18	2017-10-17	18	Solcita dejar sin efecto el pedido de pasaje a Panamá para Jesús Adrián Barrios Chamorro con Expediente 330320 en la Dirección de presupuesto	336280
553	2017-10-04	2017-10-17	22	solicitar estructura presupuestaria por Gs. 5.467.600 para reactivación de código de contratación de frigon SA en marco de llamado para impresión de pruebas para el concurso público de oposición 2016 segundo llamado 	318750
554	2017-10-18	2017-10-17	14	Solcita viático exterior para Expidio palacio y Atilio Esquivel al XLIV Seminario Internacional de Presupuesto Público en Ecuador	337146
555	2017-10-18	2017-10-17	18	Solicita Viático Exterior para el Señor Aníbal Emery director de comunicación para acompañar al ministro en París durante reunión de la Unesco	337140
556	2017-10-19	2017-10-18	71	solic. de CDP objeto de gasto 851	164864
557	2017-10-19	2017-10-18	71	solic. de CDP objeto de gasto 851	164752
558	2017-10-20	2017-10-19	18	Memo DGAF N° 4211 Remisión Comunicado sobre declaración jurada contratados	338940
559	2017-10-19	2017-10-19	33	solicitar CDP para segundo desembolso de becas de Educ Superior por 3.276.000.000 Gs	338400
560	2017-10-23	2017-10-22	18	remite resolución MH N° 282/2017	339657
561	2017-10-23	2017-10-22	33	Solicitar indemnizaciones en el OG 845 INDEMNIZACIONES para pago por expropiación a favor del MEC	269502
562	2017-10-23	2017-10-22	22	solicita CDP para una eventual ampliacion de contrato o un nuevo proceso  con Petroleos Paraguayos S.A.	340418
563	2017-10-23	2017-10-22	22	SOlicita estructura presupuestaria por Gs. 1.175.000.000 en el marco de proceso impresión de manuales	340860
564	2017-10-24	2017-10-23	22	solicita CDP para adquisicion de libros de biblioteca escolar	341371
565	2017-10-24	2017-10-23	18	solicita cdp para viatico al interior 	341734
566	2017-10-25	2017-10-24	18	solicita apoyo economico para estudiante que viajara a alemania 	339580
567	2017-01-27	2017-10-26	22	Nota DC N° 826 Declaración jurada de compromiso de contratación CDC emitidos y no declarados cancelados al 31 de diceimbre de 2016 correspondiente a loa firma FRIGON SA	345277
568	2017-10-30	2017-10-29	40	Solicitud  de inquietud por no recibir rubro la cual se presentaron a concurso, así como los beneficios.	343433
569	2017-10-30	2017-10-29	33	Memo DAC N° 120. SOlicita CDP para transferencia a la UNESCO OG 851 por un monto de USD 47074	302906
570	2017-10-31	2017-10-30	18	Solicita modificación CDP viático interior certificado por memo DP N° 3155	348950
571	2017-10-31	2017-10-31	18	Remisión Decreto N° 7936 por el cual se aprueba procedimiento sumarial administrativo... Estatuto Educador...	349202
572	2017-10-31	2017-10-31	33	Memo DT N° 2526/2017 SOlicitar CDP en el OG 910 correspondiente a pago de juez instructor	345655
573	2017-11-01	2017-10-31	18	Se solicita cancelación total o parcial por los servicios en el marco del contrato N° 05/12 de prestación de "SERVICIOS DE EMBALAJE Y TRANSPORTE PARA LA CANASTA BÁSICA DE ÚTILES ESCOLARES PARA DOCENTES Y ALUMNOS DEL AÑO LECTIVO 2017"	298341
574	2017-11-01	2017-10-31	33	Solicita CDP de los OG 834 y 894 fuente 30 correspondiente al mes de noviembre	349870
575	2017-11-02	2017-11-01	49	Solicitar Disponibilidad presupuestaria OG 210 para el mes de noviembre	350718
576	2017-11-02	2017-11-01	49	Solicitar CDP en los rubros tasas especiales y patentes rodados para el mes de noviembre	350782
577	2017-11-03	2017-11-02	91	Informe de transferencias procesadas Objeto de Gastos 834 y 894.-	353147
578	2017-11-03	2017-11-02	20	Actualización de CDP Objeto de Gasto 841 Becas.	338400
579	2017-11-03	2017-11-02	22	Solicita CDP por Gs. 132.137.387 para Adquisición de Papel, cartón e impresos - 2do llamado	353952
580	2017-11-06	2017-11-05	33	CDP OG 841 Educacion Media	354111
581	2017-11-06	2017-11-05	33	Remitir informe de transferencias solicitadas y ejecutadas e el mes de octubre en los OG 834 y 894	354277
582	2017-11-07	2017-11-06	18	Memo DGG N °3529/2017. Solicita bviático exterior a Lima Perú para María Liz Martínez para participar del III Encuentro de Virtual Educa Andina	357140
583	2017-11-08	2017-11-07	18	viatico al exterior Humberto Ayala	358365
584	2017-11-08	2017-11-07	18	viatico al exterior Maria Palacios	358348
585	2017-11-08	2017-11-07	18	viatico al exterio para el Señor Ministro	358711
587	2017-11-03	2017-11-07	33	solicitar actualización CDP OG 841 segundo desembolso becas educ, superior	338400
588	2017-11-08	2017-11-07	18	solicita viatico al exterior para Anibal Zapatini	359616
589	2017-11-08	2017-11-07	18	solicita viatico al exterior para Maria Sivulec	359621
590	2017-11-09	2017-11-08	18	solicita cdp para pago de viatico al exterior  para el Señor Ministro	359884
591	2017-11-09	2017-11-08	22	solicita activación de codigo en el marco del llamado para Servicio de Publicación de Periodicos	359896
592	2017-11-09	2017-11-08	18	solicita cdp para pago de viatico al exterior para el señor Tomas Zapatini	359890
593	2017-11-09	2017-11-08	22	solicita linea presuestaria para adquisición de papel, cartón e impresos - 2do llamado	360338
594	2017-11-09	2017-11-08	18	remite para conocimiento circular que trata sobre el usufructo de vacaciones	360753
595	2017-11-10	2017-11-09	18	solicita reprogramación para del OG 530 al OG 894	361660
596	2017-11-14	2017-11-13	20	CDP-Becas Objeto de Gasto841	363294
597	2017-11-14	2017-11-13	20	CDP OG 199 Salarios caidos	364614
598	2017-11-14	2017-11-13	33	Solicitud de Reprogramación de Caja chica	364850
599	2017-11-14	2017-11-13	33	solicitar CDP mes de noviembre de 2017 OG 290 para pago a la APAP por 550 USD porp participación de Atilio Esquivel y Expidio Palacios en el Seminario internacional de PResupuesto Público en Ecuador	364979
600	2017-11-14	2017-11-13	33	Solicitar CDP mes de noviebre de 2017 en el OG 910 para pago de deuda pendiente al Sr. Rolando Javier Medina propietario de la carpintería ROLAND MEDINA en virtud del contrato N° 74/2012 de adquisición  de mobiliarios para aula 	366203
601	2017-11-16	2017-11-15	14	Solicita Viático para Orlando- Florida	367990
602	2017-11-16	2017-11-15	14	Viático para Humberto Ayala para participar en Turin Italia para asistir a Academia de Inspección del Trabajo	367992
604	2017-11-16	2017-11-15	33	Solicitar CDP por Gs. 5.764.000 en el OG 260	369048
605	2017-11-16	2017-11-15	33	solicita ampliacion de contrato con la empresa Zamphiropolos	367942
606	2017-11-17	2017-11-16	18	remite circular N° 12/2017 sobre PAC	370421
607	2017-11-17	2017-11-16	18	remite nota del Ing. Antonio Pelaez	369433
608	2017-11-17	2017-11-16	18	solicita pago de curso para doctorado	367431
609	2017-11-17	2017-11-16	18	solicita apoyo economico para instalación de aulas temáticas	369331
610	2017-11-17	2017-11-16	22	Pedido de convenio modificatorio de la LPN N° 15/2016/2017 Adecuación y Reparación del COlegio Nacional de la Capital por un monto de Gs. 331.809.260	370959
611	2017-11-20	2017-11-19	14	solicitud de gastos terminales para Nilza Gadea (viáticos)	372246
612	2017-11-21	2017-11-20	18	Solicitar CDP OG 232 viático interior de pedidos ingresados en el mes de octubre a ser procesados en el plan financiero del mes de noviembre	372800
613	2017-11-21	2017-11-20	14	Solicta la viceministra María del Carmen Giménez sivulec viático exterior para participar de seminario de política educativa ... en Buenos Aires Argentina	372735
614	2017-11-21	2017-11-20	22	Exp XILEMA . N° 367942 en el marco de LCO SBE N° 05/17  "Aquisición de Etiquetas Holográficas de Seguridad"	373562
615	2017-11-22	2017-11-21	18	remite informe sobre la situación del MEC con la Municipalidad de Asunción	324379
616	2017-11-22	2017-11-21	22	Memo DPP N° 153 Solicitar CDP e inclusión en el PAC "Servicio de Impresi´´on y Copiado - Plurianual 2017/2018 por un monto de Gs. 132.456.960...	375477
617	2017-11-24	2017-11-23	33	solicita CDP para pago al Juez Instructor Camila Chaparro	364916
618	2017-11-27	2017-11-26	18	Solicita CDP para pago de viaticos al Interior	378804
619	2017-11-27	2017-11-26	33	Memo DTR N° 520. solicitar actualización de CDP OG 847 del programa 8 "Formación de Jóvenes y Adultos" saldo disponible al mes de noviembre.	380034
620	2017-11-28	2017-11-27	88	Solicita Informe de disponibilidad presupuestaria para el OG. 232 Viáticos y Movilidad para modificación presupuestaria	380121
621	2017-11-28	2017-11-27	18	Solicita inclusión de funcionarios para prestar servicios en el operativo Kits Escolar	379996
622	2017-11-28	2017-11-27	80	Solicita disponibilidad presupuestaria por 30000USD para que Paraguay pueda aderirse al Programa Iberorquestas Juveniles	379879
623	2017-11-28	2017-11-27	18	Remisión de nota presentada por Zulma Rojas de ávila directora de la escuela N°241 Estanislao Sanabria de Nueva Italia en la que solicita 6500 USd para construcción de un polideportivo conjuntamente con KOICA	379317
624	2017-11-28	2017-11-27	12	Actualización de Haberes para jubilaciones.	382276
625	2017-11-28	2017-11-27	34	Solicitud CDP 894	382012
626	2007-01-29	2017-11-28	18	Informe de disponibilidad en el OG 240 por Gs. 509000000	384053
627	2007-01-29	2017-11-28	33	Solicictar CDP por Gs. 2.266.740 OG 910	383871
628	2017-11-29	2017-11-28	50	Convocatoria de Personal Contratado para capacitación a evaluadores	384591
629	2017-11-29	2017-11-28	18	Remision de Resoluciones	0
630	2017-12-01	2017-11-29	33	Solicitud CDP-pago  Ingeniería Aplicada	269056
631	2017-12-05	2017-12-03	33	Memo DF N° 1811. solicitar actualización de CDP en el OG 910 por Gs. 226599914 para pago a Roland Medina en virtud del contrato N° 74/2012	389818
632	2017-12-05	2017-12-03	33	SOlcita CDP para pago de indemnizacion al Sr. Manuel Paolo ROlon Baez por expropiacion por Gs 400.000.000	386489
633	2017-12-05	2017-12-03	33	recibido por Alejandra	388722
634	2017-12-05	2017-12-03	33	Recibido por Ale	388726
635	2017-12-05	2017-12-03	49	Solicitud de disponibilidad presupuestaria - Servicios Basicos	386680
636	2017-12-05	2017-12-03	49	Solicitud de disponibilidad presupuestaria - Tasas especiales y patentes rodados.	386683
637	2017-12-06	2017-12-04	50	Memo DGGTH N° 9778/17. Convocar a superiores para capacitacion  de evaluaciones	391785
638	2017-12-04	2017-12-04	33	Solicita actualización CDP 845 por 400000000 Gs	386852
639	2017-12-07	2017-12-05	22	Solic de estructura `presupuestaria ( Contratación Directa "Provisión de Arreglos florales"	393551
640	2017-12-07	2017-12-05	22	Comunicado de DNP Nota Nº 1084	0
641	2017-12-11	2017-12-09	33	Solicitar actualización CDP OG 910 para pago a juez instructor	393678
642	2017-12-11	2017-12-09	18	solicita apoyo economico para cubrir proyecto "Yo El Supremo"	394123
643	2017-12-11	2017-12-09	33	solicita cdp para pago de reembolso de gastos en capacitacion	395153
644	2017-12-12	2017-12-10	69	solic de apoyo economico	392583
645	2017-12-12	2017-12-10	22	Comunicación de Nota DC Nº 1129	396029
646	2017-12-12	2017-12-10	22	Comunicación de Nota DC Nº 1129	396029
647	2017-02-14	2017-12-12	18	solicita reunio de trabajo para tratar proyecto de becas	397852
648	2017-12-18	2017-12-17	12	Solicitud de actualización de rubros para jubilaciones.	402278
649	2017-12-19	2017-12-17	18	solicita dictamen sobre proyecto propuesto por ex becarios de españa	402264
650	2017-12-19	2017-12-17	33	Solicita CDP por Gs. 1.752.825.630. en el OG 852 para transferencia a la OEI	403248
651	2017-12-26	2017-12-24	33	solicita CDP para pago de multa a DATALAB 	364388
652	2017-12-27	2017-12-26	18	solicita cancelacion de viatico para herminio lobos	412839
653	2018-01-03	2016-02-11	91	solicita la remision mensual de informe de transferencias procesadas	594
654	2018-01-02	2016-02-12	49	Solcita disponibilidad presupuestaria para el mes de enero/2018 en los rubros tasas especiales y patentes rodados	495
655	2018-01-02	2016-02-12	49	Solicita disponibilidad presupuestaria en OG 210 servicios básicos para el mes de enero 2018	486
656	2018-01-04	2016-02-12	14	solicita viático para la Sra. Edith Fariña de Garcete para participar de encuentro iberoaméricano de Lideres Técnicos a llevarse a cabo en Colombia	2923
657	2018-01-04	2016-02-13	92	Solicita presupuesto de viatico para la Dirección General para el año 2018	2169
658	2018-01-08	2016-02-16	12	solicita actualización de los deberes jubilatorios como catedrática Z22 a partir del año 1998	5107
659	2018-01-12	2018-01-15	14	Pasajes y viaticos para invitacion actividades del Programa SCHOLAS, en ciudad de Trujillo Peru.	10857
660	2018-01-15	2018-01-15	62	Reactivacion del codigo de contratacion de los proveedores, Kosta Viajes y Turismos. Bierdarman publicidad	11970
661	2018-01-16	2018-01-16	80	Solicitud de alquiler de local, solicita reprogramacion para objeto 250 en caso de no contar ampliacion en PGN2018	13222
662	2018-01-10	2016-02-11	14	Nota presentada por Supervisores Educativos solicitando gerenciamiento y reprogramación para creación de gastos de representación	7687
663	2018-01-17	2018-01-17	62	Solicitud de estructura presupuestaria donde imputar llamado a locacion de edificio para dependencia DGGTH	14406
664	2018-01-18	2016-02-11	65	Solic informe sobre Presupuesto asignado para Nivel Medio	15078
665	2018-01-19	2018-01-19	91	Remite informe de distribucion de cuotas mensuales de ingresos y gastos  (FF30)	11834
666	2018-01-19	2018-01-19	22	No se observa el objeto de gasto a ser imputado para "Adquisicion de Inmueble" con ID 339655	16122
667	2017-01-20	2018-01-19	39	Remisión  propuesta PLF 2018	16420
668	2017-01-19	2018-01-19	64	Remisión  propuesta PLF 2018	14554
669	2018-01-22	2018-01-19	18	Remiten plan financiero del Consejo Nacional de Educacion y Ciencias CONEC	16601
670	2018-01-22	2018-01-19	90	Emigdio Osvaldo Leguizamon solicita informe sobre actualilzacion salarial	16534
671	2018-01-22	2016-02-11	62	Reactivación de Códigos 848	17550
672	2018-01-22	2016-02-11	57	Remisión Propuesta PLF	17478
673	2018-01-22	2016-02-11	68	Remisión Propuesta PLF	15437
674	2018-01-22	2016-02-11	59	Solic habilitación de usuarios 	17529
675	2018-01-22	2016-02-11	18	Remisión de Resolución Nº 408	17645
676	2018-01-22	2016-02-11	48	Gastos prioritarios	16223
677	2018-01-23	2018-01-23	50	Reunión Mesa de Trabajo	17532
678	2018-01-24	2018-01-24	69	Solicitud de compra de terreno para la escuela basica nro 807 en la ciudad de Lambrare	15752
679	2018-01-24	2018-01-24	50	Remite legajo personal de Carlos Fernandez Encina Mesa.	341562
680	2018-01-24	2018-01-24	50	Remite Legajo de personal de la Sra Lidia Edit Amarilla Gonzales ci 354.575	353730
681	2018-01-24	2018-01-24	50	Remiten Legajo de personal de la Sra Emma Patricia Amarilla ci 3.309.859	353704
682	2018-01-24	2018-01-24	20	remiten planilla de gastos prioritarios año 2018	153526
683	2018-01-29	2018-01-29	34	solicita CDP objeto 834 y el objeto 894, en el marco de la gratuidad de la Educacion Media	23081
684	2018-01-29	2018-01-29	34	solicita CDP objeto 834 y objeto 894, mes de Enero, en el marco de la gratuidad de la Educacion Tecnica y Prof.	23076
685	2018-01-29	2018-01-29	20	Informe sobre funcionaria  Sonia Elizabeth Aguerllo ci 2.359.324.-	14011
686	2018-01-30	2016-02-11	18	solicita CDP de obj 239 Pasajes y viaticos en marco del operativo de kits de utiles escolares	23886
687	2018-01-31	2016-02-11	22	remisión de Costo estimado para adquisición de inmuebles	15752
688	2018-02-05	2016-02-11	50	remisión de legajo personal 	3505
689	2018-02-12	2018-02-12	18	reactivacion de traslado definitivo para Vistor Pereira	24552
690	2018-02-12	2018-02-13	18	solicita cdp para compra de equipo para videoconferencia	39887
691	2018-02-15	2018-02-15	33	Solicita CDP del OG 845 para pago de indemnizacion al Colegio San Roque de Santacruz	40221
692	2018-02-15	2018-02-15	22	solicitar disponibilidad por Gs. 2.079.000.000 para alquiler de edificios del MEC	43860
693	2017-02-16	2018-02-16	22	solicita cdp para pago de Servicio de impresión y copiado plurianual	45782
694	2018-02-19	2018-02-19	18	Solicita inclusión en el anteproyecto 2018 y cdp sobre el OG 845 	46090
695	2018-02-16	2018-02-21	59	Remisión Plan Financiero del Tipo de Presupuesto 3 "Programas de Inversión"	46077
696	2018-02-20	2018-02-21	93	Nota FLACSO N° 002/2018: Presentar Plan Financiero 2018 de la FLACSO	48731
697	2018-01-18	2018-02-21	63	Memo DGEP N° 57/2018. remitir Plan Financiero de Educación Permanente	15439
698	2018-02-16	2018-02-21	33	Remitir estimación mensual caja chica para Plan Financiero 2018	45732
699	2018-01-22	2018-02-21	65	memo DGEM N° 77/18. Remitir Plan Financiero 2018 de Educación Media	17604
700	2018-02-07	2018-02-21	57	Memo N° 215/2018. Remitir ajuste a la propuesta de Plan Financiero 2018 de Educ. Inicial y Escolar Básica	33219
701	2018-02-22	2018-02-23	33	Solicita CDP del OG 910 para pago a fiscal de educación	52203
702	2018-02-27	2018-02-27	18	solicita beca de estudio para el Señor Modesto Boltes	50508
703	2018-02-27	2018-02-27	18	Remite constancia de ingresos de Edit Amarilla Gonzalez ci 354.575, respuesta Memo 506/18	353730
704	2018-02-27	2018-02-27	18	Remite contancia de ingresos de Emma Patricia Amarilla C.I 3.309.859.- respusta memo 498/18	353704
705	2018-02-27	2018-02-27	18	EXP 391562 Y 393593 Constancia de ingresos Carlos Fernandez Encina C.I. 4.251.774.- Memo 507/18	391562
708	2018-02-28	2018-02-28	18	solicita cdp del OG 210 para kits escolares	58313
709	2018-02-28	2018-02-28	33	solicita plan financiero correspondiente a Fuente 30	57890
710	2018-03-01	2018-03-01	22	Solicitar CDP por Gs. 459422000 para licitación por concurso de ofertas "Adquisición de Resma de Papel con criterios de sustentabilidad.	59347
711	2018-03-01	2018-03-01	22	Solicitar CDP por Gs. 11293829532 para renovar contratos de locación de inmuebles utilizados por el MEC	59359
712	2018-03-02	2018-03-02	33	pago a juez instructor OG 910	42363
713	2018-03-02	2018-03-02	33	Solicita CDP del OG 834 y 894 - Marzo	60976
714	2018-03-02	2018-03-05	80	Solicita el presupuesto aprobado del año 2018 del CONAMU en forma impresa	62236
716	2018-03-06	2018-03-06	74	Solicitud de ampliación presupuestaria	68387
717	2018-03-06	2018-03-06	79	solicita plan financiero año 2018	68250
718	2018-03-06	2018-03-06	49	remite estado de cuenta de ANDE, mes de enero 2018	67707
719	2018-03-06	2018-03-06	49	remite estado de cuenta de COPACO mes de enero 2018	67713
720	2018-03-06	2018-03-06	49	Remite estado de cuenta de ESSAP, mes enero 2018	67718
721	2018-03-07	2018-03-07	18	Solicita Plan Financiero de varios Sub Programas	62751
722	2018-03-07	2018-03-07	22	Certificacion de disponibilidad Presupuestaria, obj 340, 520	38300
723	2018-03-07	2018-03-07	22	disponibilidades de créditos presupuestarios en objeto afectados segun Memorandum 68/2018	29756
715	2018-03-02	2018-03-05	14	Solicita verificación de datos y adecuación de nota de pedido y anexos a ser remitidos al  Ministerio de Hacienda Equipo Económico 	61863
706	2018-02-28	2018-02-28	18	solicita CDP del OG 230 para ciencias e innovación	57616
707	2018-02-28	2018-02-28	18	solicita cdp del OG 230 para Kit Escolares	58331
724	2018-03-08	2018-03-08	17	Remisión de Resolución de traslado definitivo Elida Beatriz Careaga	72152
725	2018-03-08	2018-03-08	14	copia de nota presentada del Movimiento Sindical del Magisterio Pyo	58686
726	2018-03-09	2018-03-09	37	Remitir matriz salarial de profesionales de la educación que desempeñan funciones  en las aulas hospitalarias	74313
727	2018-03-09	2018-03-09	14	Se remite nota presentada por la Sra. María Magdalena Silvero de Chena que solicita cobertura para doctorado en educación	66566
728	2018-03-08	2018-03-09	74	Solicita ampliación presupuestaria Mirta Armoa para el CONEC	68350
729	2018-04-12	2018-03-12	22	Solicitar CDP por Gs 964999870 en el marco de adquisición de libros con empresa ATLAS SA	76697
730	2018-04-12	2018-03-12	22	Solicitar CDP por Gs. 459422000 para "Adquisición de Resmas de Papel"	76701
731	2018-03-12	2018-03-12	18	traslado de linea del señor ramon coronel	74891
765	2018-04-03	2018-04-03	49	CDP 210	106142
732	2018-04-12	2018-03-12	22	Solicita informes de disponibilidad en el rubro 500 "inversión física" para la propuesta de LUNA REPRESENTACIONES para adquisición de máquinas de impresión	77674
735	2018-03-12	2018-03-12	22	solicita CDP en marco de la Cooperación Institucional entra la Compañia Paraguaya de COmunicaciones S.A y el MEC	78812
733	2018-03-12	2018-03-12	33	Solicita CDP 834 y 894 mes de marzo de 2018 en el marco de gratuidad  educación básica	78221
734	2018-03-12	2018-03-12	33	Solicita CDP 834 y 894 mes de marzo de 2018 en el marco de gratuidad educación técnica	78212
736	2018-03-14	2018-03-14	65	Matriz Sectorial de Educación Media	80272
737	2018-03-14	2018-03-14	33	respuesta al pedido de informe sobre saldo inicial de caja	73921
738	2018-12-14	2018-03-14	18	solicita ajuste a los formularios b 04 - para la reactivación de un traslado definitivo	79501
739	2018-12-14	2018-03-14	18	solicita ejecución de obras para 39 instituciones educativas	80084
740	2018-03-15	2018-03-15	18	solicita reprogramacion de rubros administrativos	73352
741	2018-03-16	2018-03-16	18	remite propuestas para acciones en el Departamento de Alto Paraguay	82324
742	2018-03-16	2018-03-16	33	pago a juez instructor Blanca Ortellado	84632
743	2018-03-19	2018-03-19	22	Solcitar CDP por Gs. 380065000 para adquisición de cubiertas.	86066
744	2018-03-19	2018-03-19	22	solicitar CDP por Gs. 10000000 para provisión de agua plurianual 2018/2019	86065
745	2018-03-20	2018-03-20	42	Remitir copia de inclusión de recursos en el anteproyecto de presupuesto del año 2017 presentado por la Dirección de infraestructura.  	87175
746	2018-03-20	2018-03-20	22	Solicitar CDP por Gs. 35.000.000 para "Adquisición de tinta y toner"	88248
747	2018-03-21	2018-03-21	14	Solicita pasaje para delegación representativa para el proyecto banprex harina anti depresivo en chile	85783
748	2018-03-21	2018-03-21	57	Remitir programación presupuestaria apoyo presupuestario unión eropea	89841
749	2018-03-22	2018-03-22	18	memo referente a permanencias de funcionarios nombrados y contratados	93846
750	2018-03-20	2018-03-22	22	solicita reactivación de codigo de contratación  firma plucar SA adquisición de cubiertas	86066
751	2018-03-23	2018-03-23	22	Solicita CDP para ampliacion de contrato Gs. 120.000.000	98217
752	2018-03-23	2018-03-23	45	Solicitar informe de monto correspondiente al ejercicio fiscal 2018, fuente 30 recursos institucionales Objeto de Gasto 834 y 894  Educación Superior 	91717
753	2018-03-26	2018-03-26	80	solicitud de local propio, específicamente la escuela Bas. Nro 202 "Juan de Salazar y Espinoza"	99794
754	2018-03-26	2018-03-26	33	Solicitar CDP OG 910 para pago de Juez Instructor en concepto de gastos de sumario administrativo	100132
755	2018-04-02	2018-04-02	18	Translado de Laura Maria Acosta Vaccaro a la camara de Diputados.	105862
756	2018-04-02	2018-04-02	62	Pedido de disponibilidad presupuestaria para Medienda Escolar. licitacion publica id nro 341254	105605
757	2018-04-02	2018-04-03	50	traslado de Emma Patricia Amarilla	92870
758	2018-04-02	2018-04-03	50	Traslado definitivo Sra. Lidia Edith Amarilla Gonzalez	92867
759	2018-04-02	2018-04-03	50	Remitir Certificado de trabajo y legajo del personal de Sra. Elida Beatriz Careaga	78217
760	2018-04-03	2018-04-03	18	solicita dictamen financiero sobre adenda al memorando de entendimiento entre el MEC y el Sistema Nacional de Facilitadores Judiciales	107615
761	2018-04-03	2018-04-03	33	solciita CDP 834 y 894 abril	107456
762	2018-04-03	2018-04-03	33	comunicación DNCP	107973
763	2018-04-03	2018-04-03	33	solicita CDP 910 para actualizar pago a Juez Instructor	107192
764	2018-04-03	2018-04-03	14	100370. solicita llamado a concurso público presidente el Instituto Paraguayo Indígena	100387
766	2018-04-03	2018-04-03	49	CDp patentes y rodados	106162
767	2018-04-04	2018-04-04	18	solicita CDP para llamado a licitacion	109564
768	2018-04-04	2018-04-04	14	Sr. Anibal Zapattini solicita provisión de recursos financieros para viático exterior a Mexico para participar en asamblea OEI	110056
769	2018-04-06	2018-04-06	18	Informar sobre subprocesos MECIP trabajados del Macroproceso Gestión Administrativa y Financiera	115589
770	2018-04-06	2018-04-06	33	Solicitar CDP OG 260 en concepto de comisiones bancarias por Gs. 9.680.000	115809
771	2018-04-06	2018-04-06	33	Solicitar CDP por Gs. 902.000.000 OG 841 para pago de Becas de Educación Media	115572
772	2018-04-06	2018-04-06	33	Remitir expediente N° 109167 de la Sra. Fulvia Cabral Vda. de Núñez solicitando pago del monto faltante de 500000000 Gs. por expropiación de finca N° 8687 de su propiedad	109167
773	2018-04-06	2018-04-06	14	Viceministra María del Carmen Giménez solicita provisión de viáticos exterior para visita a República de China - Taiwán	115858
774	2018-04-06	2018-04-06	14	Solicitud de pasajes y viaticos  para Angel Adrian Ayala ci 1203484	117700
775	2018-04-06	2018-04-06	14	Pedido de llamado a concurso de catetoria D5J de la Agencia Nacional de Evaluacion	110642
776	2018-04-06	2018-04-06	18	Remision de la Resolucion 9459 referente al plan financiero del MEC 2018	181041
777	2018-04-09	2018-04-09	18	remite solicitud para reprogramacion presupuestaria del OG 340 al 894 - 2.190.839.065	119113
778	2018-04-09	2018-04-09	18	remite solicitud para reprogramacion presupuestaria del OG 852 al 530 - 1.000.000.000	119117
779	2018-04-06	2018-04-09	22	Solciitar subscripción de CDP N° 301/2018 correspondiente al llamado N° 09/2017. "Almuerzo escolar y colación alimentaria ad referendum Plurianual 2018/2019" por Gs. 5.176.260.750	117744
780	2018-04-10	2018-04-10	74	solicita impresion del formulario b-04	120879
781	2018-04-10	2018-04-11	18	solicita impresion de tramites sobre cambio de ingresos	103653
782	2018-04-12	2018-04-12	33	solicita adelantamiento de cuota de OG 310 y 360	122754
783	2018-04-12	2018-04-12	18	remite memorandum DP N° 548 sobre el OG 210 - CONEC	119161
784	2018-04-12	2018-04-12	33	Primer Desembolso para gratuidad OG 834	122930
785	2018-04-12	2018-04-12	33	Primer Desembolso para gratuidad OG 894	122923
786	2018-04-12	2018-04-12	57	remite justificación de reprogramación presupuestaria OG 852 al OG 530	125817
787	2018-04-12	2018-04-12	50	Remiten copia de legajo de Sr. Victor Manuel Pereira Martinez ci 4.184.654.-	110051
788	2018-04-12	2018-04-12	14	Comunican audiencia solicitada a la ministra de Hacienda, del Sr Daniel Maldonado Troxled. Alamo SA	126286
789	2018-04-16	2018-04-16	22	remite comunicación de la DNCP 	128892
790	2018-12-18	2018-04-18	33	pedido de adelanto de cuota OG 848	132335
791	2018-04-19	2018-04-19	22	solicita estructura presupuestaria para Operativo Kits escolares 2018/2020	132626
792	2018-04-19	2018-04-19	57	solicitan reprogramación del OG 340 al 894 - 2.490.839.065	133655
793	2018-04-20	2018-04-20	14	Informa firma de acta de compromiso para la implementacion del modelo estandar de control interno. MECIP	131908
794	2018-04-20	2018-04-20	14	Solicita pago de curso, Programa de Capacitacion en Liderazgo Estrategico, pasajes y viaticos a Colombia, de Irina Rosana Gimenez Insfran	130786
795	2018-04-20	2018-04-20	94	remite contrato de contrato y adenda de los proyectos de CONACYT	135619
796	2018-04-20	2018-04-20	22	remite comunicación a la DNCP	135854
797	2018-04-23	2018-04-23	33	solicita cdp del OG 842 con respecto a SCHOLAS	136580
798	2018-04-24	2018-04-24	18	solicitar CDP viático interior ingresado en marzo para ser procesados en Plan Financiero Abril 2018	137488
799	2018-04-27	2018-04-27	22	solicita cdp para para adquisición de kits escolares	143935
800	2018-04-27	2018-04-27	14	solicita viático exterior para el Ministro a México, para participar en el ENCUENTRO PARA LA EDUCACIÓN Y APRENDIZAJE A LO LARGO DE LA VIDA.	144025
801	2018-04-27	2018-04-27	18	remiten nomina de instituciones que seran beneficiadas	145180
802	2018-05-03	2018-05-03	22	solicita reactivacion de codigo Frigon S.A.	151256
803	2018-05-07	2018-05-07	18	viatico al exterior - guatemala	154554
804	2018-05-07	2018-05-07	18	solicita CDP para cubrir costo de stand - evento dia de acción	136265
805	2018-05-11	2018-05-11	22	remite comunicación de la DNCP	165693
806	2018-12-11	2018-05-11	94	remite planilla de cuotas de gastos CONACYT - ISE	166402
807	2018-05-16	2018-05-16	18	solicita CDP para pago de viatico al exterior-washington D.C.	167186
808	2018-05-16	2018-05-16	18	solicita CDP para diplomado en Protocolo	166655
809	2018-05-16	2018-05-16	18	solicita cdp para pago de asistencia medica	166892
810	2018-05-18	2018-05-18	33	solicita cdp para pago a CAFEM - OG 851	131464
811	2018-05-18	2018-05-18	86	linea presupuestaria para teresita de jesus	172018
812	2018-05-21	2018-05-21	18	el CONEC solicita ampliación presupuestaria	168292
813	2018-05-21	2018-05-21	18	solicita cdp para pago de viaticos al exterior brasil y colombia	170339
814	2018-05-21	2018-05-21	18	solicita informes varios para la presidencia	172802
815	2018-05-22	2018-05-22	14	Nomina de funcionarios con rubro docente que prestan funciones en Nivel Central	175740
816	2018-05-23	2018-05-23	18	solicita cdp para viatico al exterior - colombia	175940
817	2018-05-23	2018-05-23	33	Solicitud de pago por Curso II Congreso Nacional de la Cultura de Planificación...	175895
818	2018-05-23	2018-05-23	33	solicita cdp para pago a jueces y fiscales de educación - mayo	176072
819	2018-05-23	2018-05-23	33	Solicitar pago de inscripción para II Congreso Nacional...	175895
820	2018-05-23	2018-05-23	33	solicitud de pago para inscripción al II Congreso Nacional.	175895
821	2018-05-23	2018-05-23	33	Solicitud de pago.	175895
822	2018-05-23	2018-05-23	33	Solicitud de pago.	175895
823	2018-05-23	2018-05-23	22	respuesta al pedido de informe Memorandum DP N° 814	177432
824	2018-05-25	2018-05-25	22	solicita informe sobre el OG 251	179474
825	2018-05-29	2018-05-29	18	traslado definitivo de Ever Larroza	159986
826	2018-05-30	2018-05-30	22	solicita cdp para impresion de cartones de titulos	186017
827	2018-05-30	2018-05-30	22	remite comunicacion del DNCP	186003
828	2018-06-01	2018-06-01	18	solicita cdp para viatico al exterior - Colombia	190797
829	2018-06-01	2018-06-01	18	solicita cdp para pago de viatico al exterior - Argentina	190808
830	2018-06-04	2018-06-04	42	remite su anteproyecto	193785
831	2018-06-05	2018-06-05	33	solicita actualizacion de CDP 834	195107
832	2018-06-05	2018-06-05	18	remite anteproyecto con CD	195485
833	2018-06-05	2018-06-05	18	Informatica remite Anteproyecto y Plurianual con CD	176128
834	2018-06-05	2018-06-05	18	solicita ayuda economica sobre diplomado	190436
835	2018-06-05	2018-06-05	49	remite anteproyecto y plurianual	172562
836	2018-06-05	2018-06-05	33	Solicitud de Certificación Disponibilidad Presupuestaria.	198428
837	2018-06-06	2018-06-06	74	remiten anteproyecto y plurianual en	198926
838	2018-06-06	2018-06-06	18	Estado de Cuenta ANDE	198757
839	2018-06-06	2018-06-06	35	remiten anteproyecto	199872
840	2018-06-06	2018-06-06	35	Dan repuesta al pedido de informe - Memorandum DP N° 917	189560
841	2018-06-04	2018-06-07	35	respuesta al Memorandum DP N° 816/18 - Anteproyecto	172577
842	2018-06-07	2018-06-07	18	remite anteproyecto de Talento Humano con cd	198052
843	2018-06-07	2018-06-07	33	solicita CDP sobre el OG 834 y 894 - Junio	201253
844	2018-06-07	2018-06-07	33	remiten planila de transferencias ejecutadas - Mayo	201252
845	2018-06-12	2018-06-12	33	solicita actualizacion de cdp para pago a jueces y fiscales	206805
846	2018-06-12	2018-06-12	63	remiten anteproyecto con cd	206797
847	2018-06-12	2018-06-12	96	remite anteproyecto con CD	206897
848	2018-06-12	2018-06-12	50	Remite anteproyecto  con CD y copia del POI	204682
849	2018-06-12	2018-06-12	97	remiten anteproyecto y POI con VB sin CD	206714
850	2018-06-12	2018-06-12	67	remite anteproyecto sin CD	206529
851	2018-06-12	2018-06-12	69	remite anteproyecto y POI con VB - sin CD	206646
852	2018-06-12	2018-06-12	99	remite POI con VB - con Pendrive	177645
853	2018-06-12	2018-06-12	98	remite anteproyecto  y POI con VB - correo	206583
854	2018-06-13	2018-06-13	100	remite anteproyecto sin cd	208896
855	2018-06-13	2018-06-13	18	remite resolucion sobre traslado sin linea de la señora Lorena Fleitas	209197
856	2018-06-15	2018-06-15	62	Solicita disponibilidad presupuestaria para reactivacion del codigo LP-12007-17151121 de Data Lab SA	21983
857	2018-06-15	2018-06-15	101	Viatico para 3 funcionarios "VII Congreso Paraguayo de Protocolo y Encuentro Internacional de Ceremonialistas"	208601
858	2018-06-18	2018-06-18	67	Solicita remision del Presupuesto Plurianual periodo 2019-2021	214238
859	2018-06-18	2018-06-18	50	Plan de capacitacion 2018, Coaching Profesional, solicita nomina de partacipantes	214673
860	2018-06-19	2018-06-19	14	Remite Anteproyecto 2019 y formulario plurianual consolildado 	215280
861	2018-06-19	2018-06-19	22	informe sobre notas Nro 261/262 con declaracion jurada de compromisos no cancelados al 31 de diciembre de 2017	214873
862	2018-06-19	2018-06-19	96	Solicita presupuesto plurianual 2019-2021 con referencia a memorandum DGAF Nro 1779	215315
863	2018-06-19	2018-06-19	36	Documentos impresos y digital del Anteproyecto 2019, POI, FG-02-1, FG-02-2, FG-03	215987
864	2018-06-20	2018-06-20	100	Rubros solicitados por departamento geografico, Meno nro 103 expediente 208846 del 13 de junio 2018	217812
865	2018-06-20	2018-06-20	100	Consulta sobre cantidad de rubros solicitados por nivel para el crecimiento natural 1ro y 2do ciclo. Año 2019	217
866	2018-06-20	2018-06-20	100	Ref Memo Nro 103 Exp 208846. se incorpora recursos para la campaña de educación vial 2019	217817
867	2018-06-21	2018-06-21	54	remite anteproyecto con CD	218424
868	2018-06-21	2018-06-21	49	solicitud de pedido para llamadas a lineas celulares desde lineas baja, para el numero 021452796	206727
869	2018-06-21	2018-06-21	14	Pedido de pasajes y viaticos para Feria "Alimentos para hipertenso" en Colombia mes de octubre 2018	215406
\.


--
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 223
-- Name: documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documentos_id_seq', 869, true);


--
-- TOC entry 2669 (class 0 OID 17721)
-- Dependencies: 231
-- Data for Name: documentos_movimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documentos_movimiento (id, documento, fecha, estado, usuario, comentario) FROM stdin;
20	14	2017-05-05	1	6	\N
21	15	2017-05-05	1	6	\N
22	14	2017-05-05	2	9	viatico interior
23	15	2017-05-05	2	9	
24	14	2017-05-05	2	5	
25	15	2017-05-05	2	5	
26	14	2017-05-05	3	5	
27	15	2017-05-05	3	5	
28	16	2017-05-05	1	5	\N
29	16	2017-05-05	2	9	
30	17	2017-05-05	1	5	\N
31	17	2017-05-05	2	9	
32	18	2017-05-05	1	5	\N
33	18	2017-05-05	2	9	
34	19	2017-05-05	1	5	\N
35	19	2017-05-05	2	9	
36	16	2017-05-05	2	4	
37	17	2017-05-05	4	9	Archivado en Servicios Básicos 210
38	18	2017-05-05	4	9	Archivado en Servicios Básicos 210
39	19	2017-05-05	4	9	Archivado en Servicios Básicos 210
40	16	2017-05-05	2	9	Con Disponibilidad, por el monto requerido (Gs. 11.983.400), en 1-1 FF10 OF1.
41	16	2017-05-05	3	9	Recibido en Secretaria por Paola
42	20	2017-05-08	1	6	\N
43	20	2017-05-08	2	9	
44	21	2017-05-08	1	6	\N
45	21	2017-05-08	2	9	Viatico interior
46	22	2017-05-08	1	6	\N
47	22	2017-05-08	2	9	Viático Interior
48	21	2017-05-08	2	5	
49	22	2017-05-08	2	5	
50	20	2017-05-08	2	7	
51	21	2017-05-08	2	9	
52	22	2017-05-08	2	9	
53	21	2017-05-08	3	9	Recibido en Secretaria por Alejandra
54	22	2017-05-08	3	9	Recibido en Secretaria por Alejandra
55	23	2017-05-08	1	6	\N
56	23	2017-05-08	2	9	
57	24	2017-05-08	1	11	\N
58	24	2017-05-08	2	9	
59	23	2017-05-08	2	4	
60	25	2017-05-09	1	6	\N
61	25	2017-05-09	2	9	Viático Interior
62	26	2017-05-09	1	6	\N
63	26	2017-05-09	2	9	Viático Interior
64	27	2017-05-09	1	6	\N
65	27	2017-05-09	2	9	Viático Interior
66	25	2017-05-09	2	5	
67	27	2017-05-09	2	5	
68	26	2017-05-09	2	5	
69	28	2017-05-09	1	6	\N
70	28	2017-05-09	2	9	Reprogramación OG 960
71	24	2017-05-09	4	9	Archivado en Documentos UOC
72	26	2017-05-09	3	5	recibio ale
73	25	2017-05-09	3	5	recibio ale
74	27	2017-05-09	3	5	recibio ale
75	29	2017-05-09	1	5	\N
76	29	2017-05-09	2	9	
77	23	2017-05-09	3	4	Memorándum. Se informa disponibilidad por Gs. 268.150.330 (Reactivación) y Gs. 300.000.000 (Plurianualidad).
78	30	2017-05-09	1	6	\N
80	30	2017-05-09	2	9	solicitud de disponibilidad presupuestaria para pago de cuota adeudada 2016 y 2017 MERCOSUR - CAFEM
82	29	2017-05-09	2	4	
84	33	2017-05-09	5	11	\N
85	33	2017-05-09	3	11	Recibido en Secretaria para su procesamiento
86	30	2017-05-10	2	5	
87	34	2017-05-10	1	11	\N
88	35	2017-05-10	1	11	\N
89	36	2017-05-10	1	11	\N
90	35	2017-05-10	2	9	para procesar
91	36	2017-05-10	2	9	para procesar
92	34	2017-05-10	2	9	para procesar
93	36	2017-05-10	2	4	
94	34	2017-05-10	2	4	
95	35	2017-05-10	2	4	
96	30	2017-05-10	3	5	recibio ale
97	30	2017-05-10	3	5	recibio ale
98	37	2017-05-11	1	5	\N
99	38	2017-05-11	1	5	\N
100	39	2017-05-11	1	5	\N
101	40	2017-05-11	1	5	\N
102	41	2017-05-11	1	5	\N
103	41	2017-05-11	2	9	
104	40	2017-05-11	2	9	
105	42	2017-05-11	1	6	\N
106	43	2017-05-11	1	6	\N
107	42	2017-05-11	2	9	Viático Interior
108	43	2017-05-11	2	9	
109	42	2017-05-11	2	5	
110	43	2017-05-11	2	4	
111	40	2017-05-11	2	5	
112	41	2017-05-11	2	5	
113	39	2017-05-11	2	6	
114	38	2017-05-11	2	6	
115	37	2017-05-11	2	6	
116	39	2017-05-11	3	6	Recibido en secretaria por ALE
117	38	2017-05-11	3	6	Recibido en Secretaria por ALE
118	37	2017-05-11	3	6	Recibido en secretaria por ALE
119	44	2017-05-11	1	5	\N
120	44	2017-05-11	2	9	
121	42	2017-05-11	3	5	recibio ale
122	42	2017-05-11	3	5	recibio ale
123	44	2017-05-11	3	9	Recibido en Secretaria por Alejandra
124	36	2017-05-11	3	4	Certificada la Disponibilidad requerida de Gs. 687.140.000, en 2-1-8 FF10-1 (OG330). Recibio Paola el 10/05/17.
125	35	2017-05-11	3	4	Dispone de crédito presupuestario en OG 260 por Gs. 243.219.227. Recibio Paola el 10/05/17.
126	45	2017-05-12	1	6	\N
127	45	2017-05-12	2	9	Viático Exterior
128	46	2017-05-12	1	6	\N
129	46	2017-05-12	2	9	Viático Exterior
130	47	2017-05-12	1	6	\N
131	47	2017-05-12	2	9	Viático Interior
132	45	2017-05-12	2	5	
133	46	2017-05-12	2	5	
134	47	2017-05-12	2	5	
135	48	2017-05-16	1	11	\N
136	48	2017-05-16	2	7	Solicitud Actualización CDP
137	49	2017-05-16	1	11	\N
138	49	2017-05-16	2	7	Solicitar CDP 199 (otros gastos del personal)
139	50	2017-05-16	1	11	\N
140	50	2017-05-16	2	7	Solicitud Actualización CDP
141	51	2017-05-16	1	11	\N
142	51	2017-05-16	2	7	Solicitar CDP 199 (otros gastos del personal)
143	45	2017-05-16	3	5	recibio ale
144	45	2017-05-16	3	5	recibio ale
145	46	2017-05-16	3	5	recibio ale
146	47	2017-05-16	3	5	recibio ale
147	52	2017-05-16	1	5	\N
148	53	2017-05-16	1	5	\N
149	53	2017-05-16	2	7	
150	54	2017-05-16	1	6	\N
151	54	2017-05-16	2	7	Solicitud CDP OG 853
152	52	2017-05-16	3	5	recibio ale
153	48	2017-05-16	3	7	Recibido en Secretaria por Julio
154	55	2017-05-16	1	11	\N
155	55	2017-05-16	2	7	Viatico La Paz-Mexico
156	55	2017-05-16	2	8	Viatico La Paz-Mexico
159	54	2017-05-17	2	5	 
160	53	2017-05-17	3	7	recibido por  Eva
161	54	2017-05-17	3	5	recibio julai
162	51	2017-05-17	3	7	recibido por paola
163	49	2017-05-17	3	7	recibido por paola
164	50	2017-05-17	3	7	recibido por paola
165	57	2017-05-18	1	6	\N
166	57	2017-05-18	2	9	Viático Interior
167	58	2017-05-18	1	6	\N
168	58	2017-05-18	2	9	Viático Interior
169	59	2017-05-18	1	7	\N
170	59	2017-05-18	3	7	recibido por paola
171	60	2017-05-18	1	6	\N
172	60	2017-05-18	2	9	Viático Interior
173	61	2017-05-18	1	6	\N
174	61	2017-05-18	2	9	Viático Interior
175	62	2017-05-18	5	6	\N
176	62	2017-05-18	3	6	RECIBIDO POR PAOLA
177	41	2017-05-19	3	5	recibio eva
178	63	2017-05-19	1	5	\N
179	64	2017-05-19	1	5	\N
180	64	2017-05-19	2	9	
181	63	2017-05-19	2	9	
182	63	2017-05-19	2	8	
183	64	2017-05-19	2	8	
184	58	2017-05-19	3	9	Recibido en Secretaria por Eva
185	55	2017-05-19	3	8	RECIBIDO POR EVA EL 19/05/2017 A LAS 10:32 A.M.
186	63	2017-05-19	3	8	RECIBIDO POR PAOLA EL EXPEDIENTE Nº: 151.381 EL 19/05/2017 A LAS 12:58
187	65	2017-05-19	1	8	\N
188	65	2017-05-19	2	9	Solicita CDP correspondiente a viatico al interior
189	60	2017-05-19	2	8	
192	57	2017-05-19	2	8	
193	65	2017-05-19	2	8	
194	61	2017-05-19	2	8	
195	60	2017-05-19	3	8	RECIBIDO POR PAOLA EL EXP.: Nº 152.305 EL DIA 19/05/2017 A LAS 05:49 P.M.
197	61	2017-05-19	3	8	RECIBIDO POR PAOLA EL EXP.: Nº 152.300 EL DIA 22:00 A LAS 07:00 AM
198	65	2017-05-19	3	8	RECIBIDO POR PAOLA EL EXP.: EL DIA 22/05/2017 A LAS 07:00AM
199	64	2017-05-22	3	8	RECIBIDO POR PAOLA EL DÍA 22 DE MAYO A LAS 07:00, VIATICO AL EXTERIOR DE EULALIA BRIZUEÑA B
200	57	2017-05-22	3	8	RECIBIDO POR PAOLA EL DÍA 22/05/2017 VIATICO AL INTERIOR A LAS 07:00 AM
201	67	2017-05-22	1	8	\N
202	67	2017-05-22	2	9	No hay disponibilidad presupuestaria a la fecha
203	68	2017-05-22	1	8	\N
204	68	2017-05-22	2	9	No hay disponibilidad presupuestaria a la fecha
205	69	2017-05-22	1	8	\N
206	69	2017-05-22	2	9	
207	68	2017-05-22	2	8	
208	67	2017-05-22	2	8	
209	69	2017-05-22	2	8	
210	67	2017-05-22	3	8	RECIBIDO POR ALE EL DIA 22/05/2017 A LAS 11:12 AM
211	68	2017-05-22	3	8	RECIBIDO POR ALE EL DIA 22/05/2017 A LAS 11:12 AM
212	69	2017-05-22	3	8	RECIBIDO POR ALE EL DIA 22/05/2017 A LAS 11:12 AM
213	70	2017-05-22	1	6	\N
214	70	2017-05-22	2	9	
215	71	2017-05-22	5	6	\N
216	71	2017-05-22	3	6	Recibido en Secretaría por Paola
217	72	2017-05-22	1	6	\N
218	72	2017-05-22	2	9	
219	73	2017-05-22	1	6	\N
220	73	2017-05-22	2	9	
221	74	2017-05-22	1	6	\N
222	74	2017-05-22	2	9	
223	75	2017-05-22	1	6	\N
224	75	2017-05-22	2	9	
225	76	2017-05-22	1	6	\N
226	76	2017-05-22	2	9	
227	73	2017-05-23	2	6	
228	74	2017-05-23	2	8	
229	75	2017-05-23	2	8	
230	76	2017-05-23	2	6	
231	72	2017-05-23	2	4	
232	76	2017-05-23	3	6	Recibido en Secretaría por Paola
233	77	2017-05-23	1	5	\N
234	77	2017-05-23	2	9	
235	77	2017-05-23	2	5	
236	28	2017-05-23	3	9	Enviado al Ministerio de Hacienda para Reprogramación 
237	34	2017-05-23	3	4	Se informa la disponibilidad solicitada. En la estructura de Nivel Central FF10 OF01 OG 540. Recibió Eva.
238	78	2017-05-23	1	6	\N
239	78	2017-05-23	2	9	
240	79	2017-05-24	5	8	\N
241	79	2017-05-24	3	8	Recibido por Eva el dia 24 de mayo de 2017  a las 8:23 am
242	75	2017-05-24	3	8	RECIBIDO POR EVA EL 24/05/2017 A LAS 08:42 A.M.
243	74	2017-05-24	3	8	RECIBIDO POR EVA EL 24/05/2017 A LAS 08:42 A.M.
244	80	2017-05-24	1	8	\N
245	80	2017-05-24	2	9	
246	80	2017-05-24	2	8	
247	80	2017-05-24	3	8	RECIBIDO POR PAOLA EL DÍA 24/05/2017 VIATICO AL EXTERIOR A LAS 09:47 AM
248	77	2017-05-24	3	5	recibio eva
249	40	2017-05-24	3	5	recibio eva
250	81	2017-05-24	1	5	\N
251	81	2017-05-24	2	9	
252	82	2017-05-24	1	5	\N
253	82	2017-05-24	2	9	
254	83	2017-05-24	1	8	\N
255	81	2017-05-24	2	11	
256	83	2017-05-24	3	8	RECIBIDO POR PAOLA EL DÍA 24DE MAYO A LAS 16:11, VIATICO AL INTERIOR
257	84	2017-05-24	5	11	\N
258	84	2017-05-24	2	9	Solic de estructura presupuestaria-103.840.000
259	84	2017-05-25	2	4	
260	78	2017-05-25	4	9	Archivado en Documentos UOC
261	85	2017-05-25	1	5	\N
262	85	2017-05-25	2	9	
263	86	2017-05-25	1	5	\N
264	86	2017-05-25	2	9	
265	87	2017-05-25	1	5	\N
266	87	2017-05-25	2	9	
267	88	2017-05-25	1	5	\N
268	88	2017-05-25	2	9	
269	85	2017-05-25	2	8	
270	86	2017-05-25	2	8	
271	89	2017-05-25	5	4	\N
272	89	2017-05-25	3	4	Recibio Eva.
273	90	2017-05-25	1	8	\N
274	90	2017-05-25	2	9	
275	85	2017-05-26	3	8	RECIBIDO POR ALE EL DIA 26/05/2017 A LAS 08:07 AM
276	91	2017-05-26	1	8	\N
277	91	2017-05-26	2	9	
278	86	2017-05-26	3	8	RECIBIDO POR ALE EL DIA 26/05/2017 A LAS 09:32 AM
279	92	2017-05-26	1	8	\N
280	92	2017-05-26	3	8	RECIBIDO POR ALE EL DIA 26/05/2017 A LAS 09:32 AM
281	93	2017-05-26	1	5	\N
282	93	2017-05-26	2	9	
283	94	2017-05-26	5	11	\N
529	188	2017-06-08	1	6	\N
531	189	2017-06-08	1	6	\N
284	94	2017-05-26	2	9	Remision de estimación  de secciones y aulas requeridas así como de matriculas
285	95	2017-05-26	5	11	\N
287	96	2017-05-26	5	11	\N
288	96	2017-05-26	2	9	Solicitud de cambio de denominación de categoría salarial de Mirna Vera
290	73	2017-05-29	3	6	Recibido en Secretaria por Eva
291	93	2017-05-29	2	4	
292	70	2017-05-29	4	9	Archivado en Circulares 2017
293	82	2017-05-29	4	9	Archivado en Anteproyecto Tipo II 2018
294	87	2017-05-29	4	9	Archivado en Anteproyecto Tipo I 2018
286	95	2017-05-26	2	9	Solicitud de Traslado definitivo con linea presupuestaria  Gerardo Andrés Barrientos Díaz.
295	96	2017-05-29	3	9	Remitido a Secretaría de Presupuesto
296	94	2017-05-29	4	9	Archivado en Anteproyecto 2018 - Crecimiento Natural
297	88	2017-05-29	4	9	Archivado en Anteproyecto 2018 - Datos Adicionales
298	91	2017-05-29	2	8	
299	95	2017-05-29	2	5	
300	90	2017-05-29	2	8	
301	97	2017-05-29	1	6	\N
302	97	2017-05-29	4	6	Archivado en Recibidos
303	91	2017-05-29	3	8	RECIBIDO POR ALE EL DIA 26/05/2017 A LAS 09:32 AM
304	\N	2017-05-29	1	8	\N
305	\N	2017-05-29	1	8	\N
306	\N	2017-05-29	1	8	\N
307	95	2017-05-29	3	5	recibio paola
308	95	2017-05-29	3	5	recibio paola
309	98	2017-05-29	1	8	\N
310	98	2017-05-29	2	9	
311	99	2017-05-29	1	8	\N
312	99	2017-05-29	2	9	
313	100	2017-05-31	1	6	\N
314	101	2017-05-31	1	6	\N
315	102	2017-05-31	1	6	\N
316	102	2017-05-31	2	7	ejecución de ingresos mes de mayo OG 834 y 894
317	102	2017-05-31	2	10	
318	103	2017-05-31	1	6	\N
319	103	2017-05-31	2	7	
320	104	2017-05-31	1	6	\N
321	104	2017-05-31	2	7	
322	104	2017-05-31	2	10	
323	105	2017-05-31	1	5	\N
324	105	2017-05-31	2	7	
325	106	2017-05-31	1	5	\N
326	106	2017-05-31	2	7	
327	107	2017-05-31	1	5	\N
328	107	2017-05-31	2	7	
329	106	2017-05-31	2	8	
330	105	2017-05-31	2	8	
331	107	2017-05-31	2	5	
332	108	2017-05-31	1	5	\N
333	108	2017-05-31	2	7	
334	109	2017-05-31	1	5	\N
335	109	2017-05-31	2	7	
336	105	2017-05-31	3	8	RECIBIDO POR PAOLA EL DÍA 31 DE MAYO A LAS 04:36, gs10.200.330
337	106	2017-05-31	3	8	RECIBIDO POR PAOLA EL DÍA 31DE MAYO A LAS 04:38, gs 7.706.916
338	107	2017-05-31	3	5	recibio eva
339	110	2017-06-01	1	8	\N
340	110	2017-06-01	2	7	
341	111	2017-06-01	1	8	\N
342	112	2017-06-01	1	8	\N
343	112	2017-06-01	2	7	Existe disponibilidad para 4 funcionarios
344	113	2017-06-01	1	6	\N
345	113	2017-06-01	4	6	archivado en Datos Adicionales Anteproyecto 2018 (Sueldos y Beneficios)
346	101	2017-06-01	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
347	100	2017-06-01	4	6	Archivado en Datos Adicionales Anteproyecto 2018
348	93	2017-06-01	3	4	Habilitada Disponibilidad por Gs. 1.000.000.000 para iniciar el proceso requerido. Recibio Julio.
349	72	2017-06-01	3	4	Informada disponibilidad por Gs. 200.000.000 para iniciar el proceso. Recibio Julio.
350	110	2017-06-01	2	6	
351	111	2017-06-01	2	6	
352	111	2017-06-01	3	6	Recibido en Secretaria por Julio
353	110	2017-06-01	3	6	Recibido en Secretaria por Julio
354	114	2017-06-02	1	8	\N
355	114	2017-06-02	2	7	
356	115	2017-06-02	1	8	\N
357	115	2017-06-02	2	7	
358	115	2017-06-02	2	6	
359	115	2017-06-02	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
360	116	2017-06-02	1	6	\N
361	116	2017-06-02	2	8	
362	117	2017-06-02	1	6	\N
363	117	2017-06-02	2	8	
364	118	2017-06-02	1	6	\N
365	118	2017-06-02	2	8	
366	119	2017-06-02	1	6	\N
367	119	2017-06-02	2	8	
368	120	2017-06-02	1	6	\N
369	120	2017-06-02	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
370	121	2017-06-02	1	6	\N
371	121	2017-06-02	4	6	Archivado en Datos Adicionales Anteproyecto 2018
372	122	2017-06-02	1	6	\N
373	122	2017-06-02	2	7	Solicitar CDP OG 910
374	123	2017-06-02	1	6	\N
375	123	2017-06-02	2	8	
376	124	2017-06-02	1	6	\N
377	124	2017-06-02	2	8	
378	125	2017-06-02	1	6	\N
379	125	2017-06-02	2	8	
380	126	2017-06-02	1	8	\N
381	126	2017-06-02	2	7	
382	126	2017-06-02	2	8	
383	126	2017-06-02	3	8	RECIBIDO POR JULIO EL DÍA 02/06/2017 A LAS 01:02PM
384	127	2017-06-02	1	6	\N
385	127	2017-06-02	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
386	128	2017-06-02	1	6	\N
387	128	2017-06-02	2	7	
388	129	2017-06-02	1	6	\N
389	129	2017-06-02	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
390	130	2017-06-02	1	6	\N
391	130	2017-06-02	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
392	131	2017-06-02	1	6	\N
393	131	2017-06-02	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
394	132	2017-06-05	1	6	\N
395	132	2017-06-05	4	6	Archivado en Datos Adicionales Anteproyecto 2018
396	133	2017-06-05	1	8	\N
398	134	2017-06-05	1	6	\N
399	134	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
400	135	2017-06-05	1	6	\N
401	135	2017-06-05	2	8	
402	136	2017-06-05	1	6	\N
403	136	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
404	137	2017-06-05	1	6	\N
405	137	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
406	138	2017-06-05	1	6	\N
530	188	2017-06-08	2	8	Viático Exterior
407	138	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
408	139	2017-06-05	1	6	\N
409	139	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
410	140	2017-06-05	1	6	\N
411	140	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
412	141	2017-06-05	1	6	\N
413	141	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
414	142	2017-06-05	1	6	\N
415	142	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
416	133	2017-06-05	3	8	RECIBIDO POR EVA EL 05/06/2017 A LAS 12:10 P.M.
417	143	2017-06-05	1	6	\N
418	143	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
419	144	2017-06-05	1	6	\N
420	144	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
423	146	2017-06-05	1	6	\N
424	146	2017-06-05	2	9	
425	147	2017-06-05	1	6	\N
426	147	2017-06-05	2	9	
427	148	2017-06-05	1	6	\N
428	148	2017-06-05	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
429	149	2017-06-05	1	3	\N
430	149	2017-06-05	2	9	
431	150	2017-06-05	1	6	\N
432	150	2017-06-05	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
433	151	2017-06-05	1	6	\N
434	151	2017-06-05	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
435	152	2017-06-05	1	6	\N
436	152	2017-06-05	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
437	149	2017-06-05	2	4	
438	153	2017-06-05	1	6	\N
439	153	2017-06-05	2	9	
440	154	2017-06-05	1	6	\N
441	154	2017-06-05	2	9	
442	155	2017-06-06	1	6	\N
443	155	2017-06-06	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
444	156	2017-06-06	1	6	\N
445	156	2017-06-06	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
447	157	2017-06-06	1	4	\N
448	104	2017-06-06	3	10	Recibido por Eva Escobar
449	149	2017-06-06	3	4	Se solicito mayores informacion a fin de incluir en el anteproyecto del nivel. Recibio Paola.
450	157	2017-06-06	3	4	Se informo la disponibilidad de Gs. 50.000.000 en el Tipo 1 FF30 OF1. Recibio Paola.
451	146	2017-06-06	3	9	Recibido en Secretaria por Eva
452	147	2017-06-06	3	9	Recibido en Secretaria por Eva
453	158	2017-06-06	1	10	\N
454	158	2017-06-06	3	10	Recibido por Paola Cabrera.
455	159	2017-06-06	1	6	\N
456	159	2017-06-06	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
457	160	2017-06-06	1	6	\N
458	160	2017-06-06	2	9	Viático Interior
459	161	2017-06-06	1	6	\N
460	161	2017-06-06	2	9	Viático Exterior
461	112	2017-06-06	2	10	
462	112	2017-06-06	3	10	Recibido por Paola Cabrera.
463	162	2017-06-06	5	6	\N
465	163	2017-06-06	1	6	\N
466	163	2017-06-06	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
467	161	2017-06-06	3	9	recibido por Eva
468	135	2017-06-06	3	8	recibido por Eva
469	125	2017-06-06	3	8	recibido por Eva
470	164	2017-06-06	5	6	\N
471	164	2017-06-06	2	9	
472	164	2017-06-06	3	9	Recibido en Secretaria por Alejandra
473	122	2017-06-06	3	7	recibido por Paola
474	165	2017-06-06	1	6	\N
475	165	2017-06-06	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
476	166	2017-06-06	1	6	\N
477	166	2017-06-06	3	6	Recibido en Secretaría por Paola
478	167	2017-06-06	1	6	\N
479	167	2017-06-06	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
480	168	2017-06-06	1	6	\N
481	168	2017-06-06	2	9	
482	169	2017-06-06	1	6	\N
483	169	2017-06-06	2	9	
484	170	2017-06-07	1	3	\N
485	170	2017-06-07	2	9	
486	171	2017-06-07	1	3	\N
487	171	2017-06-07	2	6	
488	172	2017-06-07	1	3	\N
489	172	2017-06-07	2	9	
490	173	2017-06-07	1	3	\N
491	173	2017-06-07	2	9	
492	174	2017-06-07	1	3	\N
493	174	2017-06-07	2	9	
494	171	2017-06-07	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
495	175	2017-06-07	1	6	\N
496	175	2017-06-07	2	8	
497	176	2017-06-07	1	6	\N
498	176	2017-06-07	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
499	177	2017-06-07	1	6	\N
500	177	2017-06-07	2	9	
501	154	2017-06-07	2	8	
502	177	2017-06-07	2	10	
503	178	2017-06-07	1	8	\N
504	178	2017-06-07	2	9	
505	154	2017-06-07	3	8	RECIBIDO POR ALE EL DIA  07/06/2017 A LAS 01:15 pm
506	178	2017-06-07	2	8	
507	178	2017-06-07	3	8	RECIBIDO POR ALE EL DIA  07/06/2017 A LAS 01:15 pm
508	179	2017-06-07	1	6	\N
509	179	2017-06-07	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018. Recursos Institucionales
510	180	2017-06-07	1	6	\N
511	180	2017-06-07	2	9	
512	177	2017-06-07	3	10	Recibido por Alejandra Irala.
513	181	2017-06-08	1	8	\N
514	181	2017-06-08	2	9	
515	90	2017-06-08	2	6	Para archivar este documento
516	90	2017-06-08	4	6	Archivado en Documentos Remitidos/Recibidos 2017
517	182	2017-06-08	1	6	\N
518	182	2017-06-08	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
519	183	2017-06-08	1	6	\N
520	183	2017-06-08	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
521	184	2017-06-08	1	6	\N
522	184	2017-06-08	4	6	Archivado en Datos Adicionales Anteproyecto 2018
523	185	2017-06-08	1	6	\N
524	185	2017-06-08	2	9	
525	186	2017-06-08	1	6	\N
526	186	2017-06-08	4	6	Archivado en Datos Adicionales Anteproyecto 2018
527	187	2017-06-08	1	6	\N
528	187	2017-06-08	2	9	
532	189	2017-06-08	2	8	Viático Exterior
533	190	2017-06-08	1	6	\N
534	190	2017-06-08	2	8	Viático Interior
535	191	2017-06-08	1	6	\N
536	191	2017-06-08	2	8	Viático Interior
537	185	2017-06-08	2	4	
538	187	2017-06-08	3	9	Recibido en Secretaria por Alejandra
539	192	2017-06-08	1	8	\N
540	192	2017-06-08	2	9	
541	193	2017-06-08	1	8	\N
542	193	2017-06-08	2	9	
543	194	2017-06-08	1	8	\N
544	180	2017-06-09	2	4	
545	192	2017-06-09	2	6	
546	193	2017-06-09	2	6	
547	195	2017-06-09	1	3	\N
548	195	2017-06-09	2	9	
549	195	2017-06-09	2	4	
550	192	2017-06-09	4	6	Archivado en Creaciones, Crecimiento Natural Anteproyecto 2018
551	193	2017-06-09	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
552	189	2017-06-09	2	9	
553	194	2017-06-09	2	9	
554	189	2017-06-09	3	9	Recibido en Secretaria por Paola
555	188	2017-06-09	2	9	
556	194	2017-06-09	3	9	Recibido en Secretaria por Paola
557	188	2017-06-09	3	9	Recibido en Secretaria por Paola
558	196	2017-06-09	1	8	\N
559	196	2017-06-09	2	9	
560	196	2017-06-09	3	9	Recibido en Secretaria por Paola
561	197	2017-06-09	1	6	\N
562	197	2017-06-09	2	9	
563	198	2017-06-09	1	6	\N
564	198	2017-06-09	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
565	197	2017-06-09	2	4	
566	199	2017-06-09	1	8	\N
567	199	2017-06-09	2	9	
568	200	2017-06-09	1	8	\N
569	200	2017-06-09	2	9	
570	201	2017-06-09	1	8	\N
571	201	2017-06-09	2	9	
572	202	2017-06-09	1	8	\N
573	202	2017-06-09	2	9	
574	199	2017-06-13	2	7	
575	181	2017-06-13	2	11	
576	199	2017-06-13	3	7	recibido por Eva
577	160	2017-06-13	2	8	
578	169	2017-06-13	2	8	
579	168	2017-06-13	2	8	
580	173	2017-06-13	2	6	
581	153	2017-06-13	2	8	
582	174	2017-06-13	2	11	
583	170	2017-06-13	2	11	
584	181	2017-06-13	3	11	Solicita reembolso por compra de cubiertas para viaje a Ciudad de Filadelfia, realizado en fecha 10 al 12 de mayo de 2017
585	174	2017-06-13	3	11	Certificacion de disponibilidad de el objeto 910
586	190	2017-06-13	2	9	
588	191	2017-06-13	2	9	
589	170	2017-06-13	3	11	actualización de la certificación sobre disponibilidad en objeto 910 correspondiente a Pago a Juez Instructor
590	81	2017-06-13	3	11	Pedido de adelantamiento de cuota comprometidas con los codigos de contratacion
591	203	2017-06-13	1	8	\N
592	204	2017-06-13	1	8	\N
593	203	2017-06-13	2	9	
594	205	2017-06-13	1	8	\N
595	205	2017-06-13	2	9	
596	206	2017-06-13	1	8	\N
597	206	2017-06-13	2	9	
598	207	2017-06-13	1	8	\N
599	207	2017-06-13	2	9	
600	208	2017-06-13	1	3	\N
601	208	2017-06-13	2	9	
602	209	2017-06-13	1	3	\N
603	209	2017-06-13	2	9	
604	210	2017-06-13	1	3	\N
605	210	2017-06-13	2	9	
606	211	2017-06-13	1	3	\N
607	211	2017-06-13	2	6	
608	98	2017-06-13	2	6	
609	212	2017-06-13	1	3	\N
610	212	2017-06-13	2	6	
611	212	2017-06-13	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
612	210	2017-06-13	2	8	
613	211	2017-06-13	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
614	209	2017-06-13	2	8	
615	208	2017-06-13	2	8	
616	205	2017-06-13	2	8	
617	203	2017-06-13	2	8	
618	206	2017-06-13	2	8	
619	207	2017-06-13	2	8	
620	191	2017-06-13	2	8	
621	190	2017-06-13	2	8	
622	173	2017-06-13	3	6	Recibido en Secretaria por Julio
623	98	2017-06-13	3	6	Recibido en Secretaria por Julio
624	213	2017-06-13	1	3	\N
625	213	2017-06-13	2	6	
627	214	2017-06-13	1	3	\N
628	214	2017-06-13	2	9	
629	200	2017-06-13	3	9	Recibido en Secretaria por Eva
630	215	2017-06-13	1	3	\N
631	215	2017-06-13	2	9	
632	216	2017-06-14	1	8	\N
633	216	2017-06-14	2	9	
634	217	2017-06-14	1	8	\N
635	217	2017-06-14	2	9	
636	216	2017-06-14	2	8	
637	217	2017-06-14	2	8	
638	209	2017-06-14	2	9	
639	218	2017-06-14	1	6	\N
641	219	2017-06-14	5	6	\N
642	219	2017-06-14	3	6	Recibido en Secretaria por Eva
643	220	2017-06-14	1	3	\N
644	220	2017-06-14	2	9	
626	213	2017-06-13	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
640	218	2017-06-14	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
646	222	2017-06-14	1	3	\N
647	222	2017-06-14	2	9	
648	223	2017-06-15	1	3	\N
649	223	2017-06-15	2	9	
650	224	2017-06-15	1	6	\N
651	224	2017-06-15	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
652	225	2017-06-15	1	6	\N
653	225	2017-06-15	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO 1
654	226	2017-06-15	5	11	\N
655	226	2017-06-15	3	11	Recibido en Secretaria para su procesamiento-Eva
656	227	2017-06-15	1	3	\N
657	227	2017-06-15	2	9	
658	228	2017-06-15	1	8	\N
659	228	2017-06-15	3	8	RECIBIDO POR EVA EL 15/06/2017 A LAS 06:33 P.M.
660	229	2017-06-16	1	3	\N
661	229	2017-06-16	2	9	
662	230	2017-06-16	1	3	\N
663	230	2017-06-16	2	9	
664	231	2017-06-16	1	3	\N
665	231	2017-06-16	2	9	
666	232	2017-06-16	1	3	\N
667	232	2017-06-16	2	9	
668	229	2017-06-16	2	8	
669	230	2017-06-16	2	8	
670	231	2017-06-16	2	8	
671	232	2017-06-16	2	8	
672	214	2017-06-16	4	9	Archivado en Circulares 2017
673	233	2017-06-16	1	6	\N
674	233	2017-06-16	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
675	234	2017-06-16	1	6	\N
676	234	2017-06-16	2	9	
677	235	2017-06-16	1	6	\N
678	235	2017-06-16	2	9	
679	236	2017-06-16	1	6	\N
680	236	2017-06-16	2	9	
681	208	2017-06-19	3	8	RECIBIDO POR EVA EL 19/06/2017 A LAS 08:42 A.M.
682	237	2017-06-19	1	5	\N
683	237	2017-06-19	2	9	
684	234	2017-06-19	2	8	
685	235	2017-06-19	2	8	
686	223	2017-06-19	2	5	
687	227	2017-06-19	2	4	
688	236	2017-06-19	2	5	
689	220	2017-06-19	2	5	
690	209	2017-06-19	3	9	Recibido en Secretaria por Paola
691	238	2017-06-19	1	5	\N
692	238	2017-06-19	2	9	
693	239	2017-06-19	1	3	\N
694	239	2017-06-19	2	9	
695	240	2017-06-19	1	6	\N
696	240	2017-06-19	2	9	
697	241	2017-06-19	1	6	\N
698	241	2017-06-19	2	9	
699	242	2017-06-19	1	6	\N
700	242	2017-06-19	2	9	
701	243	2017-06-19	1	6	\N
702	243	2017-06-19	2	9	
703	244	2017-06-19	1	3	\N
704	244	2017-06-19	2	9	
705	238	2017-06-20	2	4	
706	239	2017-06-20	2	4	
707	241	2017-06-20	2	8	
708	240	2017-06-20	2	5	
709	245	2017-06-20	1	5	\N
710	245	2017-06-20	2	9	
711	245	2017-06-20	2	8	
712	246	2017-06-20	1	8	\N
713	246	2017-06-20	2	9	
714	247	2017-06-20	1	8	\N
715	247	2017-06-20	2	9	
716	248	2017-06-20	1	8	\N
717	248	2017-06-20	2	9	
718	249	2017-06-20	1	5	\N
719	249	2017-06-20	2	9	
720	240	2017-06-20	3	5	recibio eva
721	223	2017-06-20	3	5	recibio ale
722	250	2017-06-20	1	6	\N
723	250	2017-06-20	2	9	
724	251	2017-06-20	1	6	\N
725	251	2017-06-20	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
726	252	2017-06-20	1	6	\N
727	252	2017-06-20	2	9	
728	253	2017-06-20	1	6	\N
729	253	2017-06-20	2	9	
730	254	2017-06-20	1	6	\N
731	254	2017-06-20	2	9	
732	255	2017-06-20	1	6	\N
733	255	2017-06-20	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 PLURIANUAL
734	256	2017-06-20	1	6	\N
735	256	2017-06-20	2	9	
736	246	2017-06-20	2	4	
738	256	2017-06-21	2	8	
739	253	2017-06-21	2	8	
740	250	2017-06-21	3	9	Recibido en secretaria por Eva
741	252	2017-06-21	2	4	
742	257	2017-06-21	1	5	\N
743	257	2017-06-21	2	9	
744	243	2017-06-21	3	9	Recibido en Secretaria por Eva
745	248	2017-06-21	2	5	
746	248	2017-06-21	3	5	recibio ale
747	258	2017-06-21	1	6	\N
748	258	2017-06-21	3	6	Recibido en Secretaria por Eva
749	253	2017-06-21	3	8	RECIBIDO POR ALE EL DIA 21/06/2017 A LAS 14:56 pm
750	256	2017-06-21	3	8	RECIBIDO POR ALE EL DIA 21/06/2017 A LAS 14:56 pm
751	241	2017-06-21	3	8	RECIBIDO POR ALE EL DIA 21/06/2017 A LAS 14:56 pm
753	260	2017-06-21	1	8	\N
754	260	2017-06-21	2	9	
755	236	2017-06-22	3	5	recibio ale
756	261	2017-06-22	1	5	\N
757	261	2017-06-22	2	9	
758	262	2017-06-22	1	5	\N
759	262	2017-06-22	2	9	
760	262	2017-06-22	2	5	
761	261	2017-06-22	2	8	
762	263	2017-06-22	1	3	\N
763	263	2017-06-22	2	9	
764	264	2017-06-22	1	3	\N
765	264	2017-06-22	2	9	
766	265	2017-06-22	1	5	\N
767	265	2017-06-22	2	9	
768	262	2017-06-22	3	5	recibio ale
769	266	2017-06-22	1	5	\N
770	266	2017-06-22	2	9	
771	265	2017-06-22	2	8	
772	264	2017-06-22	2	8	
773	267	2017-06-22	1	3	\N
774	267	2017-06-22	2	9	
777	269	2017-06-23	1	3	\N
778	269	2017-06-23	2	9	
779	270	2017-06-23	1	3	\N
780	270	2017-06-23	2	9	
781	271	2017-06-23	1	5	\N
782	271	2017-06-23	2	9	
783	272	2017-06-23	1	5	\N
784	272	2017-06-23	2	9	
785	273	2017-06-23	1	5	\N
786	273	2017-06-23	2	9	
787	274	2017-06-23	1	3	\N
788	274	2017-06-23	2	9	
789	275	2017-06-26	1	6	\N
790	275	2017-06-26	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
791	276	2017-06-26	1	6	\N
792	276	2017-06-26	2	9	
793	277	2017-06-26	1	3	\N
794	277	2017-06-26	2	9	
795	278	2017-06-26	1	3	\N
796	278	2017-06-26	2	9	
797	279	2017-06-26	1	3	\N
798	280	2017-06-26	1	8	\N
799	279	2017-06-26	2	9	
800	280	2017-06-26	2	9	
801	281	2017-06-26	1	3	\N
802	281	2017-06-26	2	9	
803	282	2017-06-26	1	3	\N
804	282	2017-06-26	2	9	
805	283	2017-06-26	1	3	\N
806	283	2017-06-26	2	9	
807	273	2017-06-26	3	9	Recibido en Secretaria por Alejandra
808	284	2017-06-26	1	6	\N
809	284	2017-06-26	2	9	
810	285	2017-06-26	1	6	\N
811	285	2017-06-26	2	9	
812	286	2017-06-26	1	8	\N
813	286	2017-06-26	2	9	
814	287	2017-06-26	1	8	\N
815	287	2017-06-26	2	9	
816	288	2017-06-26	1	8	\N
817	288	2017-06-26	2	9	
818	289	2017-06-27	1	5	\N
819	289	2017-06-27	2	9	
820	290	2017-06-27	1	6	\N
821	290	2017-06-27	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 PLURIANUAL
822	291	2017-06-27	1	3	\N
823	291	2017-06-27	2	9	
824	292	2017-06-27	1	3	\N
825	292	2017-06-27	2	9	
826	293	2017-06-27	1	8	\N
827	293	2017-06-27	2	9	
828	294	2017-06-28	1	8	\N
829	294	2017-06-28	2	9	
830	295	2017-06-28	1	8	\N
831	295	2017-06-28	2	9	
832	296	2017-06-28	5	11	\N
833	296	2017-06-28	2	9	Presupuesto Plurianual-Dirección General de Educación Inicial y Escolar Básica
834	297	2017-06-28	1	5	\N
835	297	2017-06-28	2	9	
836	283	2017-06-28	2	8	
837	281	2017-06-28	2	8	
838	282	2017-06-28	2	8	
839	279	2017-06-28	2	8	
840	278	2017-06-28	2	8	
841	285	2017-06-28	2	8	
842	284	2017-06-28	2	8	
843	294	2017-06-28	2	8	
844	298	2017-06-29	1	5	\N
845	298	2017-06-29	2	9	
846	299	2017-06-29	1	5	\N
847	299	2017-06-29	2	9	
848	300	2017-06-29	1	6	\N
849	300	2017-06-29	2	9	
850	301	2017-06-29	1	5	\N
851	301	2017-06-29	2	9	
852	302	2017-06-29	1	5	\N
853	302	2017-06-29	2	9	
854	299	2017-06-29	2	4	
855	303	2017-06-29	1	6	\N
856	303	2017-06-29	2	9	
857	303	2017-06-30	2	8	
858	300	2017-06-30	4	9	Archivado en Anteproyecto Tipo II 2018
859	302	2017-06-30	4	9	Archivado en Crecimiento Natural
860	297	2017-06-30	4	9	Archivado en Anteproyecto de Presupuesto Tipo III
861	298	2017-06-30	4	9	Archivado en Creaciones y Crecimiento Natural
862	293	2017-06-30	2	5	
863	292	2017-06-30	4	9	Archivado en Anteproyecto Tipo I
864	301	2017-06-30	3	9	Recibido en Secretaria por Paola
865	289	2017-06-30	2	8	
866	276	2017-06-30	4	9	Archivado en Anteproyecto de Presupuesto Tipo III
867	280	2017-06-30	2	8	
868	296	2017-06-30	4	9	Archivado en Presupuesto Plurianual 2018-2020
869	287	2017-06-30	4	9	Archivado en Circulares 2017
871	270	2017-06-30	2	8	
872	269	2017-06-30	4	9	Archivado en Creaciones y Crecimiento Natural
873	266	2017-06-30	4	9	Archivado en Creaciones y Crecimiento Natural
874	254	2017-06-30	4	9	Archivado en Creaciones y Crecimiento Natural
875	237	2017-06-30	2	10	
876	238	2017-06-30	3	4	No se dispone de creditos. Recibio Eva.
877	238	2017-06-30	3	4	No se dispone de creditos. Recibio Eva.
878	242	2017-06-30	3	9	Recibido en Secretaria por Eva
879	244	2017-06-30	3	9	Recibido en Secretaria por Eva
880	222	2017-06-30	4	9	Archivado en Circulares 2017
881	202	2017-06-30	4	9	Archivado en Creaciones y Crecimiento Natural
883	215	2017-06-30	3	9	Recibido en Secretaria por Eva
884	260	2017-06-30	3	9	Recibido en Secretaria por Alejandra
885	99	2017-06-30	4	9	Archivado en Anteproyecto de Presupuesto Tipo I
882	195	2017-06-30	3	4	No se dispone de creditos, recibio Eva
886	185	2017-06-30	3	4	Se informo la disponibilidad por el monto solicitado. Recibio Eva.
887	291	2017-06-30	3	9	Recibido en Secretaria por Paola
888	293	2017-06-30	3	5	recibio paola
889	220	2017-06-30	3	5	recibio paola
890	197	2017-06-30	3	4	Se procedio a actualizar la informacion de la disponibilidad. Recibio Eva.
891	304	2017-06-30	1	5	\N
892	304	2017-06-30	2	9	
893	305	2017-06-30	1	3	\N
894	305	2017-06-30	2	9	
895	306	2017-06-30	1	3	\N
896	306	2017-06-30	2	9	
897	307	2017-06-30	1	5	\N
898	307	2017-06-30	4	5	archivado en bibliorato de creación
899	304	2017-06-30	4	9	Archivado en Creaciones y Crecimiento Natural
900	306	2017-06-30	2	8	
901	305	2017-06-30	2	8	
902	308	2017-06-30	1	6	\N
903	308	2017-06-30	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 PLURIANUAL
870	271	2017-06-30	4	9	Archivado en Anteproyecto de Presupuesto Plurianual 2018
904	277	2017-06-30	4	9	Archivado en Presupuesto Plurianual 2018-2020
905	286	2017-06-30	4	9	Archivado en Presupuesto Plurianual 2018-2020
906	267	2017-06-30	4	9	Archivado en Presupuesto Plurianual 2018-2020
907	274	2017-06-30	4	9	Archivado en Presupuesto Plurianual 2018-2020
908	309	2017-06-30	1	5	\N
909	309	2017-06-30	2	9	
910	310	2017-06-30	1	5	\N
911	310	2017-06-30	2	9	
912	311	2017-06-30	1	5	\N
913	311	2017-06-30	2	9	
464	162	2017-06-06	3	6	Recibido en Secretaria por Julio
914	311	2017-06-30	2	10	
915	310	2017-06-30	2	10	
916	312	2017-07-03	5	11	\N
917	312	2017-07-03	2	9	Solicitud de reserva de disponibilidad presupuestaria en el Objeto de Gasto 290
918	313	2017-07-03	5	11	\N
919	313	2017-07-03	2	9	Solicitud de actualización de certificación de disponibilidad presupuestaria objeto de gasto 834
920	314	2017-07-03	5	11	\N
921	314	2017-07-03	2	9	Solicitud de actualización de certificación de disponibilidad presupuestaria objeto de gasto 834
922	315	2017-07-03	5	11	\N
923	315	2017-07-03	2	9	solicitud de Disponibilidad Presupuestaria tazas especiales y patente de rodados
926	315	2017-07-04	2	5	
927	309	2017-07-04	2	8	
928	314	2017-07-04	2	7	
929	313	2017-07-04	2	7	
930	312	2017-07-04	2	10	
931	317	2017-07-04	1	8	\N
932	317	2017-07-04	2	9	
933	318	2017-07-04	1	5	\N
934	318	2017-07-04	2	9	
935	318	2017-07-04	3	9	Recibido en Secretaria por Eva
936	319	2017-07-05	5	11	\N
937	319	2017-07-05	2	9	Solic de estructura presupuestaria Objeto de gasto 220
938	319	2017-07-05	2	4	
939	320	2017-07-05	1	5	\N
940	320	2017-07-05	2	9	
941	321	2017-07-05	1	5	\N
942	321	2017-07-05	2	9	
943	322	2017-07-05	1	5	\N
944	322	2017-07-05	2	9	
945	320	2017-07-05	2	4	
946	321	2017-07-05	2	4	
947	322	2017-07-05	2	4	
948	315	2017-07-05	3	5	julai
949	319	2017-07-05	3	4	Se informa la disponibilidad por Gs. 2.498.774.046. Recibio Julio.
950	299	2017-07-05	3	4	Se informo disponibilidad por Gs. 247.798.445. Recibio Julio.
951	246	2017-07-05	3	4	Se informo la disponibilidad requerida (Gs. 38.120.250). Recibio Julio.
952	310	2017-07-06	3	10	Recibido por Eva Escobar
953	317	2017-07-06	2	8	
954	317	2017-07-06	3	8	RECIBIDO POR PAOLA EL DIA 06/07/2017 A LAS 14:00 pm
955	323	2017-07-06	1	5	\N
956	323	2017-07-06	2	9	
957	288	2017-07-06	2	8	
958	323	2017-07-06	2	8	
959	324	2017-07-06	1	10	\N
960	324	2017-07-06	2	9	
961	325	2017-07-06	1	8	\N
962	325	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:31 P.M.
963	323	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:30 P.M.
964	326	2017-07-06	1	8	\N
965	326	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
966	261	2017-07-06	3	8	Se archiva en el bibliotarat
967	327	2017-07-06	1	8	\N
968	327	2017-07-06	4	8	En el bibliorato de viaticos
969	303	2017-07-06	4	8	En el bibliorato de viaticos
970	231	2017-07-06	4	8	En el bibliorato de viaticos
971	270	2017-07-06	4	8	En el bibliorato de viaticos
972	288	2017-07-06	4	8	En el bibliorato de viaticos
973	283	2017-07-06	4	8	En el bibliorato de viaticos
974	284	2017-07-06	4	8	En el bibliorato de viaticos
975	306	2017-07-06	4	8	En el bibliorato de viaticos
976	281	2017-07-06	4	8	En el bibliorato de viaticos
977	279	2017-07-06	4	8	En el bibliorato de viaticos
978	278	2017-07-06	4	8	En el bibliorato de viaticos
979	264	2017-07-06	4	8	En el bibliorato de viaticos
980	309	2017-07-06	4	8	En el bibliorato de viaticos
981	230	2017-07-06	4	8	En el bibliorato de viaticos
982	282	2017-07-06	4	8	En el bibliorato de viaticos
983	169	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
984	207	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
985	217	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
986	216	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
987	235	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
988	245	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
989	191	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
990	265	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
991	280	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
992	289	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
993	168	2017-07-06	3	8	RECIBIDO POR EVA EL 06/07/2017 A LAS 15:55 P.M.
994	294	2017-07-07	3	8	RECIBIDO POR PAOLA EL DIA 07/07/2017 A.M.
995	313	2017-07-07	3	7	recibido por paola
996	314	2017-07-07	3	7	recibido por paola
997	328	2017-07-07	1	6	\N
998	328	2017-07-07	2	9	
999	328	2017-07-07	2	4	
1000	329	2017-07-07	1	5	\N
1001	329	2017-07-07	2	9	
1002	330	2017-07-07	1	5	\N
1003	330	2017-07-07	2	9	
1004	331	2017-07-07	1	5	\N
1005	331	2017-07-07	2	9	
1006	332	2017-07-07	1	5	\N
1007	332	2017-07-07	2	9	
1008	331	2017-07-07	2	7	
1009	330	2017-07-07	2	7	
1010	329	2017-07-07	2	7	
1011	324	2017-07-07	2	11	
1012	333	2017-07-07	1	6	\N
1013	333	2017-07-07	2	9	
1014	331	2017-07-07	3	7	recibido por paola
1015	329	2017-07-07	3	7	recibido por paola
1016	330	2017-07-07	3	7	recibido por paola
1017	334	2017-07-10	1	8	\N
1018	334	2017-07-10	2	9	
1019	333	2017-07-10	2	8	
1020	335	2017-07-10	1	8	\N
1021	335	2017-07-10	2	9	
1022	252	2017-07-10	3	4	Se informa que no existe disponibilidad. Recibio Paola.
1023	227	2017-07-10	3	4	Se informo disponibilidad, aunque debe regularizar el producto, considerando que los recursos son para textos y materiales. Recibio Eva.
1024	335	2017-07-10	3	9	Recibido en Secretaria por Paola
1025	324	2017-07-10	3	11	Modificación de cuota de Plan financiero Objeto de Gasto 250-Recibido por Eva
1026	336	2017-07-10	1	5	\N
1027	336	2017-07-10	2	9	
1028	337	2017-07-10	1	5	\N
1029	337	2017-07-10	2	9	
1030	338	2017-07-10	1	5	\N
1031	338	2017-07-10	4	5	archivado en carpeta de recibidos
1032	339	2017-07-11	1	5	\N
1033	339	2017-07-11	2	9	
1034	340	2017-07-11	1	5	\N
1035	340	2017-07-11	2	9	
1036	339	2017-07-11	2	5	
1037	340	2017-07-11	2	5	
1038	341	2017-07-11	1	5	\N
1039	341	2017-07-11	2	9	
1040	339	2017-07-11	3	5	recibio eva
1041	339	2017-07-11	3	5	recibio eva
1042	340	2017-07-11	3	5	recibio eva
1045	343	2017-07-11	1	6	\N
1046	343	2017-07-11	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1047	344	2017-07-11	1	6	\N
1048	344	2017-07-11	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1049	345	2017-07-11	1	6	\N
1050	345	2017-07-11	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1051	341	2017-07-11	2	8	
1052	341	2017-07-11	3	8	RECIBIDO POR ALE EL DIA 11/07/2017 A LAS 13:56 P.M.
1053	346	2017-07-11	1	6	\N
1054	346	2017-07-11	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1055	347	2017-07-11	1	6	\N
1056	347	2017-07-11	2	9	
1057	348	2017-07-11	1	6	\N
1058	348	2017-07-11	2	9	
1059	347	2017-07-11	2	5	
1060	348	2017-07-11	2	5	
1061	349	2017-07-11	1	6	\N
1062	349	2017-07-11	2	9	
1063	349	2017-07-11	2	4	
1064	350	2017-07-11	1	8	\N
1065	350	2017-07-11	2	9	
1066	351	2017-07-11	1	8	\N
1067	351	2017-07-11	2	9	
1068	352	2017-07-11	1	8	\N
1069	352	2017-07-11	2	9	
1070	352	2017-07-12	2	5	
1071	350	2017-07-12	4	9	Archivado en 210 Servicios Básicos
1072	351	2017-07-12	4	9	Archivado en 210 Servicios Básicos
1073	337	2017-07-12	3	9	Recibido en Secretaria por Paola
1074	352	2017-07-12	3	5	recibio paola
1075	353	2017-07-12	1	8	\N
1076	353	2017-07-12	2	9	
1077	354	2017-07-12	5	11	\N
1078	354	2017-07-12	2	9	Solic  de asignación de viático en el marco de las TICS
1079	355	2017-07-13	1	5	\N
1080	355	2017-07-13	2	9	
1081	356	2017-07-13	1	8	\N
1082	356	2017-07-13	2	9	
1083	347	2017-07-13	3	5	recibio eva
1084	357	2017-07-14	1	8	\N
1085	357	2017-07-14	2	9	
1086	357	2017-07-14	2	8	
1087	356	2017-07-14	2	4	
1088	355	2017-07-14	2	8	
1089	353	2017-07-14	4	9	Archivado en Contrataciones
1090	354	2017-07-14	2	8	
1091	358	2017-07-14	5	6	\N
1092	358	2017-07-14	4	6	archivado en UOC 2017
1093	354	2017-07-17	3	8	RECIBIDO POR PAOLA EL 17/07/2017 A LAS 09:07 A.M.
1094	359	2017-07-17	1	5	\N
1095	359	2017-07-17	3	5	recibio eva
1096	357	2017-07-17	3	8	RECIBIDO POR PAOLA EL 17/07/2017 A LAS 10:38 A.M.
1097	355	2017-07-17	3	8	RECIBIDO POR PAOLA EL 17/07/2017 A LAS 10:38 A.M.
1098	360	2017-07-26	1	10	\N
1099	360	2017-07-26	2	10	Garbini
1100	360	2017-07-26	3	10	Recibido por Eva Escobar
1101	361	2017-07-27	1	8	\N
1102	361	2017-07-27	2	10	
1103	362	2017-07-27	1	8	\N
1104	362	2017-07-27	3	8	RECIBIDO POR ALE EL DIA 27/07/2017 A LAS 07:38 A.M.
1105	363	2017-07-27	1	6	\N
1106	363	2017-07-27	2	9	
1107	364	2017-07-27	1	6	\N
1108	364	2017-07-27	2	9	
1109	365	2017-07-27	1	6	\N
1110	365	2017-07-27	2	9	
1111	366	2017-07-27	1	6	\N
1112	366	2017-07-27	2	9	
1113	363	2017-07-27	2	10	
1114	366	2017-07-27	2	10	
1115	365	2017-07-27	2	5	
1116	364	2017-07-27	2	6	
1117	363	2017-07-27	3	10	Recibido por Eva Escobar
1118	361	2017-07-27	3	10	Recibido por Eva Escobar
1119	367	2017-07-27	1	8	\N
1120	367	2017-07-27	3	8	RECIBIDO POR PAOLA EL DIA 27/05/2017 A LAS 02:04 PM
1121	364	2017-07-28	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 PLURIANUAL
1122	368	2017-07-28	1	6	\N
1123	368	2017-07-28	3	6	Recibido en Secretaría por Paola
1124	369	2017-07-28	1	6	\N
1125	369	2017-07-28	3	6	Recibido en Secretaría por Paola
1126	370	2017-07-31	1	6	\N
1127	370	2017-07-31	2	9	
1128	371	2017-07-31	1	6	\N
1129	371	2017-07-31	2	9	
1130	372	2017-07-31	1	6	\N
1131	372	2017-07-31	2	9	
1132	373	2017-07-31	1	6	\N
1133	373	2017-07-31	2	9	
1134	374	2017-07-31	1	5	\N
1135	374	2017-07-31	2	9	
1136	365	2017-07-31	3	5	recibio ale
1137	365	2017-07-31	3	5	recibio ale
1138	348	2017-07-31	3	5	recibio julai
1139	372	2017-07-31	2	7	
1140	374	2017-07-31	2	5	
1141	373	2017-07-31	2	5	
1142	332	2017-07-31	3	9	Recibido en Secretaria por Alejandra
1143	373	2017-08-01	3	5	recibio ale
1144	375	2017-08-01	1	5	\N
1145	375	2017-08-01	2	9	
1146	376	2017-08-01	1	5	\N
1147	376	2017-08-01	2	9	
1148	377	2017-08-01	1	5	\N
1149	377	2017-08-01	2	9	
1150	378	2017-08-02	1	6	\N
1151	378	2017-08-02	3	6	Recibido en secretaria por ALE
1152	379	2017-08-02	1	6	\N
1153	379	2017-08-02	2	9	
1154	380	2017-08-02	1	6	\N
1155	380	2017-08-02	2	9	
1156	381	2017-08-02	1	6	\N
1157	381	2017-08-02	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1158	382	2017-08-02	1	6	\N
1159	382	2017-08-02	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1160	383	2017-08-02	1	6	\N
1161	383	2017-08-02	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1162	384	2017-08-02	1	6	\N
1163	384	2017-08-02	2	9	
1164	385	2017-08-03	1	6	\N
1165	385	2017-08-03	2	9	
1166	376	2017-08-03	2	10	
1167	376	2017-08-03	3	10	Recibió Julio.
1168	374	2017-08-03	3	5	recibio ale
1169	386	2017-08-03	1	5	\N
1170	386	2017-08-03	3	5	recibio ale
1171	387	2017-08-03	5	7	\N
1172	387	2017-08-03	3	7	recibido por paola
1173	237	2017-08-04	2	6	Para salida
1174	384	2017-08-04	3	9	Recibido en Secretaria por Alejandra
1175	379	2017-08-04	2	8	
1176	380	2017-08-04	2	8	
1177	385	2017-08-04	2	5	
1178	375	2017-08-04	2	10	
1179	377	2017-08-04	2	8	
1180	385	2017-08-04	3	5	recibio paola
1181	237	2017-08-04	3	6	Recibido en Secretaria por Eva
1182	380	2017-08-04	2	5	
1183	380	2017-08-04	3	5	recibio paola
1184	388	2017-08-07	1	5	\N
1185	388	2017-08-07	2	9	
1186	389	2017-08-07	1	5	\N
1187	389	2017-08-07	2	9	
1188	390	2017-08-07	1	5	\N
1189	390	2017-08-07	2	9	
1190	389	2017-08-07	2	7	
1191	388	2017-08-07	2	7	
1192	390	2017-08-07	2	7	
1193	391	2017-08-07	5	11	\N
1194	391	2017-08-07	2	9	Solic de inclusión en Anteproyecto de Presupuesto 2018 Gastos de Representación
1195	392	2017-08-07	1	6	\N
1196	392	2017-08-07	3	6	Recibido en Secretaria por Eva
1197	393	2017-08-07	1	6	\N
1198	393	2017-08-07	3	6	Recibido en Secretaria por Eva
1199	394	2017-08-07	1	6	\N
1200	394	2017-08-07	3	6	Recibido en Secretaria por Eva
1201	395	2017-08-07	1	6	\N
1202	395	2017-08-07	2	9	
1203	396	2017-08-07	1	6	\N
1204	396	2017-08-07	2	9	
1205	397	2017-08-07	1	6	\N
1206	397	2017-08-07	2	9	
1207	396	2017-08-07	2	5	
1208	395	2017-08-07	2	10	
1209	397	2017-08-07	2	4	
1210	396	2017-08-07	3	5	recibio paola
1211	321	2017-08-07	3	4	Se informo disponibilidad para reactivacion de codigo. Recibio Paola.
1212	322	2017-08-07	3	4	Se informo disponibilidad para iniciar el proceso. Recibio Paola.
1213	395	2017-08-07	3	10	Recibido por Eva Escobar
1214	398	2017-08-07	1	6	\N
1215	398	2017-08-07	2	9	
1216	399	2017-08-07	1	6	\N
1217	399	2017-08-07	2	9	
1218	400	2017-08-07	5	11	\N
1219	400	2017-08-07	2	9	Solic. de pago de cuotas adeudadas como estado miembro de la Organización de la Naciones Unidas(Unesco) Gs.251.482.180
1220	399	2017-08-07	2	4	
1221	398	2017-08-07	2	4	
1222	388	2017-08-07	3	7	recibido por paola
1223	389	2017-08-07	3	7	recibido por paola
1224	390	2017-08-07	3	7	recibido por paola
1225	400	2017-08-07	3	9	Recibido en Secretaria por Alejandra
1226	398	2017-08-08	3	4	Se informo reducida disponibilidad por Gs. 697.548.474 (EEB, Permanente e Inclusiva). Recibió Ale.
1227	43	2017-08-08	3	4	Se preparo proforma de respuesta. Recibio Ale.
1228	401	2017-08-08	1	5	\N
1229	401	2017-08-08	2	9	
1230	402	2017-08-08	1	5	\N
1231	402	2017-08-08	2	9	
1232	403	2017-08-08	1	5	\N
1233	403	2017-08-08	2	9	
1234	401	2017-08-09	2	4	
1235	404	2017-08-09	1	5	\N
1236	404	2017-08-09	2	9	
1237	405	2017-08-10	5	11	\N
1238	405	2017-08-10	2	9	Solic de disponibilidad presupuestaria
1239	406	2017-08-10	5	11	\N
1240	406	2017-08-10	2	9	Solic de estructura pesupuestaria para imputación
1241	406	2017-08-10	2	4	
1242	405	2017-08-10	2	4	
1243	402	2017-08-10	2	5	
1244	403	2017-08-10	2	5	
1245	402	2017-08-10	3	5	recibio julai
1246	403	2017-08-10	3	5	recibio eva
1247	407	2017-08-10	1	5	\N
1248	407	2017-08-10	2	9	
1249	408	2017-08-10	5	11	\N
1250	408	2017-08-10	2	9	Solic CDP 910
1251	409	2017-08-11	1	3	\N
1252	409	2017-08-11	2	9	
1253	410	2017-08-11	1	5	\N
1254	410	2017-08-11	2	9	
1255	408	2017-08-11	2	5	
1256	410	2017-08-11	2	4	
1257	409	2017-08-11	2	7	
1258	409	2017-08-11	3	7	recibido por paola
1259	408	2017-08-11	3	5	recibio eva
1260	411	2017-08-14	1	5	\N
1261	411	2017-08-14	2	9	
1262	412	2017-08-14	5	6	\N
1263	412	2017-08-14	3	6	Recibido en Secretaria por Eva
1264	413	2017-08-16	1	5	\N
1265	413	2017-08-16	2	9	
1266	413	2017-08-16	2	8	
1267	413	2017-08-16	3	8	RECIBIDO POR EVA EL 16/08/2017 A LAS 17:07 P.M.
1268	411	2017-08-17	2	10	
1269	407	2017-08-17	2	10	
1270	371	2017-08-17	3	9	Recibido en Secretaria por Julio
1271	410	2017-08-17	3	4	Se informo el saldo disponible al mes de Agosto. Recibio Paola el 16/08/17.
1272	411	2017-08-17	3	10	Recibido por Eva Escobar
1273	407	2017-08-17	3	10	Recibido por Eva Escobar
1274	401	2017-08-17	3	4	Se informo la disponibilidad al mes de Agosto. Recibio Julio el 09/08/2017.
1275	397	2017-08-17	3	4	Se informo disponibilidad por Gs. 153.072.629 para iniciar el proceso. Recibio Julio el 09/08/2017.
1276	414	2017-08-17	1	8	\N
1277	414	2017-08-17	2	9	
1278	414	2017-08-17	2	4	
1279	415	2017-08-18	1	8	\N
1280	415	2017-08-18	2	9	
1281	416	2017-08-18	1	8	\N
1282	416	2017-08-18	2	9	
1283	417	2017-08-18	1	8	\N
1284	417	2017-08-18	2	9	
1285	418	2017-08-18	1	8	\N
1286	418	2017-08-18	2	9	
1287	419	2017-08-18	1	8	\N
1288	419	2017-08-18	2	9	
1289	418	2017-08-18	2	4	
1290	415	2017-08-18	2	10	
1291	420	2017-08-18	1	8	\N
1292	420	2017-08-18	2	9	
1293	421	2017-08-18	1	8	\N
1294	421	2017-08-18	2	9	
1295	415	2017-08-18	3	10	Recibido por Paola Cabrera.
1296	421	2017-08-18	2	4	
1297	420	2017-08-18	2	8	
1298	422	2017-08-18	1	5	\N
1299	422	2017-08-18	2	9	
1300	422	2017-08-21	2	8	
1301	420	2017-08-21	3	8	RECIBIDO POR ALE EL DIA 21/08/2017 A LAS 08:33 A.M.
1302	423	2017-08-21	1	5	\N
1303	423	2017-08-21	3	5	recibio ale
1304	416	2017-08-21	4	9	Archivado en Documentos UOC 2017
1305	424	2017-08-22	5	11	\N
1306	424	2017-08-22	2	9	Solicitud de apoyo económico para premio Escuela  Básica Nº 3.518
1307	425	2017-08-22	1	6	\N
1308	425	2017-08-22	2	9	
1309	426	2017-08-23	1	5	\N
1310	426	2017-08-23	2	9	
1311	427	2017-08-23	1	5	\N
1312	427	2017-08-23	2	9	
1313	425	2017-08-23	2	8	
1314	424	2017-08-23	2	8	
1315	425	2017-08-23	3	8	RECIBIDO POR PAOLA EL 23/08/2017 A LAS 15:57 P.M.
1316	421	2017-08-23	3	4	Se informo disponibilidad por el monto requerido para iniciar el proceso. Recibio Paola.
1317	424	2017-08-23	3	8	RECIBIDO POR PAOLA EL 23/08/2017 A LAS 15:57 P.M.
1318	405	2017-08-23	3	4	No se dispone de credito para el efecto. Recibio Paola.
1319	428	2017-08-24	1	5	\N
1320	428	2017-08-24	2	9	
1321	429	2017-08-24	1	5	\N
1322	429	2017-08-24	2	9	
1323	422	2017-08-24	3	8	RECIBIDO POR PAOLA EL 24/08/2017 A LAS 12:40 P.M.
1324	430	2017-08-24	1	5	\N
1325	430	2017-08-24	2	9	
1326	431	2017-08-24	1	5	\N
1327	431	2017-08-24	3	5	recibio eva
1328	432	2017-08-25	1	8	\N
1329	432	2017-08-25	2	9	
1330	433	2017-08-25	1	6	\N
1331	295	2017-08-25	4	9	Archivado en Recibidos 2018
1332	433	2017-08-25	4	6	Archivado en Creaciones, Crecimiento Natural Anteproyecto 2018
1333	370	2017-08-25	4	9	Archivado en Crecimiento Natural  2018
1334	334	2017-08-25	4	9	Archivado en Creaciones y Crecimiento Natural
1335	432	2017-08-25	2	4	
1336	419	2017-08-25	3	9	Recibido en Secretaria por Eva
1337	429	2017-08-25	4	9	Archivado en Recibidos 2017
1338	428	2017-08-25	2	8	
1339	430	2017-08-25	2	5	
1340	426	2017-08-25	4	9	Archivado en Recibidos 2017
1341	427	2017-08-25	2	7	
1342	430	2017-08-25	3	5	recibio paola
1343	434	2017-08-25	1	6	\N
1344	434	2017-08-25	4	6	Archivado en Bibliorato Anteproyecto de Presupuesto 2018 TIPO2
1345	428	2017-08-25	3	8	RECIBIDO POR EVA EL 24/08/2017 A LAS 17:55 P.M.
1346	417	2017-08-25	4	9	Archivado en Documentos UOC 2017
1347	404	2017-08-25	2	4	
1348	356	2017-08-25	3	4	Sin disponibilidad para pago de alquileres para segundo semestre 2017. Recibio Paola.
1349	328	2017-08-25	3	4	Sin disponibilidad para pago de alquileres para segundo semestre 2017. Recibio Paola.
1350	435	2017-08-28	1	8	\N
1351	435	2017-08-28	2	11	
1352	435	2017-08-28	2	7	
1353	435	2017-08-28	3	7	recibido por Eva
1354	436	2017-08-28	1	5	\N
1355	436	2017-08-28	2	7	
1356	437	2017-08-28	1	5	\N
1357	437	2017-08-28	2	7	
1358	438	2017-08-28	1	8	\N
1359	438	2017-08-28	2	7	
1360	439	2017-08-28	1	8	\N
1361	438	2017-08-28	3	7	recibido por Eva
1362	439	2017-08-28	3	8	RECIBIDO POR EVA EL 28/08/2017 A LAS 14:58 P.M.
1363	427	2017-08-29	3	7	recibido por paola
1364	440	2017-08-29	1	8	\N
1365	440	2017-08-29	3	8	RECIBIDO POR EVA EL 29/08/2017 A LAS 17:24 P.M.
1366	441	2017-08-29	1	8	\N
1367	442	2017-08-30	1	6	\N
1368	442	2017-08-30	2	7	
1369	442	2017-08-30	2	8	
1370	443	2017-08-30	1	8	\N
1371	443	2017-08-30	2	7	
1372	442	2017-08-30	3	8	RECIBIDO POR EVA EL 30/08/2017 A LAS 11:53 P.M.
1373	444	2017-08-30	1	5	\N
1374	444	2017-08-30	2	7	
1375	445	2017-08-30	1	5	\N
1376	445	2017-08-30	2	7	
1377	441	2017-08-30	3	8	RECIBIDO POR ALE EL DIA 30/08/2017 A LAS 14:50 pm
1378	446	2017-08-31	1	6	\N
1379	446	2017-08-31	4	6	Archivado en Documentos Remitidos/Recibidos 2017
1380	447	2017-08-31	1	6	\N
1381	447	2017-08-31	4	6	Archivado en Documentos Remitidos/Recibidos 2017
1382	448	2017-08-31	1	8	\N
1383	448	2017-08-31	3	8	RECIBIDO POR PAOLA EL 31/08/2017 A LAS 15:26 P.M.
1384	449	2017-08-31	1	5	\N
1385	449	2017-08-31	2	7	
1386	449	2017-08-31	2	5	a procesar
1387	450	2017-08-31	1	8	\N
1388	450	2017-08-31	3	8	RECIBIDO POR PAOLA EL 31/08/2017 A LAS 16:52 P.M.
1389	451	2017-09-01	1	8	\N
1390	451	2017-09-01	2	7	
1391	452	2017-09-01	1	6	\N
1392	453	2017-09-01	1	6	\N
1393	453	2017-09-01	2	10	
1394	452	2017-09-01	2	10	
1395	454	2017-09-01	1	5	\N
1396	454	2017-09-01	2	7	
1397	455	2017-09-04	1	6	\N
1398	455	2017-09-04	2	7	
1399	456	2017-09-04	1	6	\N
1400	456	2017-09-04	2	7	
1401	457	2017-09-04	1	6	\N
1402	457	2017-09-04	2	7	
1403	454	2017-09-04	2	4	
1404	457	2017-09-04	2	8	
1405	456	2017-09-04	2	8	
1406	445	2017-09-04	3	7	recibido por julio
1407	445	2017-09-04	3	7	recibido por julio
1408	454	2017-09-04	3	4	Se informo la linea presupuestaria. Recibio Julio.
1409	458	2017-09-05	1	7	\N
1410	458	2017-09-05	2	10	
1411	453	2017-09-05	3	10	Recibido por Eva Escobar
1412	456	2017-09-05	3	8	RECIBIDO POR EVA EL 05/09/2017 A LAS 09:25 A.M..
1413	458	2017-09-05	3	10	Recibido por Eva Escobar
1414	459	2017-09-05	1	6	\N
1415	459	2017-09-05	4	6	Archivado en Documentos Remitidos/Recibidos 2017
1416	460	2017-09-05	1	6	\N
1417	460	2017-09-05	2	7	
1418	461	2017-09-05	5	11	\N
1419	461	2017-09-05	2	10	Solic. de disponibilidad presupuestaria fuente 30 objetos de gasto 834, 894
1420	462	2017-09-06	1	6	\N
1421	462	2017-09-06	2	7	
1422	463	2017-09-06	1	6	\N
1423	463	2017-09-06	2	7	
1424	464	2017-09-06	1	6	\N
1425	464	2017-09-06	2	7	
1426	465	2017-09-06	1	6	\N
1427	465	2017-09-06	2	7	
1428	464	2017-09-06	2	5	
1429	463	2017-09-06	2	5	
1430	465	2017-09-06	2	8	
1431	449	2017-09-06	3	5	recibio eva
1432	465	2017-09-06	3	8	RECIBIDO POR EVA EL 06/09/2017 A LAS 09:46 A.M.
1433	466	2017-09-07	5	11	\N
1434	466	2017-09-07	2	7	Solic CDP objeto de gasto 834
1435	464	2017-09-07	3	5	recibio eva
1436	463	2017-09-07	3	5	recibio eva
1437	467	2017-09-07	1	8	\N
1438	467	2017-09-07	2	7	
1439	461	2017-09-07	3	10	Recibido por Eva Escobar
1440	468	2017-09-07	1	5	\N
1441	468	2017-09-07	2	7	
1442	468	2017-09-08	2	10	
1443	443	2017-09-08	2	4	
1444	467	2017-09-08	3	7	recibido por Eva
1445	469	2017-09-08	1	8	\N
1446	470	2017-09-08	1	8	\N
1447	471	2017-09-08	1	8	\N
1448	472	2017-09-08	1	8	\N
1449	473	2017-09-08	1	8	\N
1450	443	2017-09-08	3	4	Se informo lo correspondiente al presente ejercicio (Gs. 50.000.000). Recibio Julio.
1451	468	2017-09-08	3	10	Recibido por Eva Escobar
1452	474	2017-09-11	1	6	\N
1453	474	2017-09-11	2	9	
1454	475	2017-09-11	1	6	\N
1455	475	2017-09-11	2	9	
1456	476	2017-09-11	1	6	\N
1457	476	2017-09-11	2	9	
1458	476	2017-09-11	2	4	
1459	475	2017-09-11	2	5	
1460	477	2017-09-11	1	5	\N
1461	477	2017-09-11	2	9	
1462	475	2017-09-11	3	5	recibio eva
1463	472	2017-09-11	3	8	RECIBIDO POR EVA EL 11/09/2017 A LAS 13:48P.M.
1464	470	2017-09-11	3	8	RECIBIDO POR EVA EL 11/09/2017 A LAS 17:38 P.M.
1465	478	2017-09-12	1	8	\N
1466	478	2017-09-12	2	9	
1467	479	2017-09-12	1	8	\N
1468	479	2017-09-12	2	9	
1469	480	2017-09-12	1	8	\N
1470	480	2017-09-12	2	9	
1471	478	2017-09-12	2	4	
1472	480	2017-09-12	2	5	
1473	480	2017-09-12	3	5	recibio paola
1474	481	2017-09-12	1	5	\N
1475	481	2017-09-12	2	9	
1476	481	2017-09-12	2	4	
1477	482	2017-09-13	1	8	\N
1478	482	2017-09-13	2	9	
1479	482	2017-09-13	2	5	
1480	482	2017-09-13	3	5	recibio julai
1481	451	2017-09-13	3	7	se devuelve a secretaria Paola
1482	483	2017-09-14	1	6	\N
1483	483	2017-09-14	2	9	
1484	484	2017-09-14	1	6	\N
1485	484	2017-09-14	2	9	
1486	483	2017-09-14	2	4	
1487	484	2017-09-14	2	4	
1488	485	2017-09-14	1	8	\N
1489	473	2017-09-15	3	8	RECIBIDO POR PAOLA EL 15/09/2017 A LAS 08:21 A.M.
1490	486	2017-09-15	1	5	\N
1491	486	2017-09-15	2	9	
1492	485	2017-09-15	3	8	RECIBIDO POR ALE EL DIA 15/09/2017 A LAS 13:45pm
1493	487	2017-09-15	1	8	\N
1494	487	2017-09-15	3	8	RECIBIDO POR ALE EL DIA 15/09/2017 A LAS 14:30pm
1495	488	2017-09-18	1	6	\N
1496	489	2017-09-18	1	6	\N
1497	489	2017-09-18	2	8	
1498	488	2017-09-18	2	8	
1499	490	2017-09-18	1	6	\N
1500	490	2017-09-18	2	4	
1501	491	2017-09-18	1	8	\N
1502	490	2017-09-18	3	4	Se informo disponibilidad requerida. Recibio Eva.
1503	491	2017-09-18	3	8	RECIBIDO POR EVA EL 18/09/2017 A LAS 15:55 P.M.
1504	492	2017-09-19	1	5	\N
1505	492	2017-09-19	2	9	
1506	493	2017-09-19	1	5	\N
1507	493	2017-09-19	2	9	
1508	494	2017-09-19	1	5	\N
1509	494	2017-09-19	2	9	
1510	495	2017-09-19	1	5	\N
1511	495	2017-09-19	2	9	
1512	496	2017-09-19	1	5	\N
1513	496	2017-09-19	2	9	
1514	497	2017-09-19	1	6	\N
1515	497	2017-09-19	2	9	
1516	488	2017-09-19	3	8	RECIBIDO POR PAOLA EL 19/09/2017 A LAS 15:33 P.M.
1517	492	2017-09-19	2	8	
1518	486	2017-09-19	2	8	
1519	493	2017-09-19	2	8	
1520	494	2017-09-19	2	8	
1521	496	2017-09-19	2	4	
1522	493	2017-09-19	3	8	RECIBIDO POR PAOLA EL 19/09/2017 A LAS 15:33 P.M.
1523	495	2017-09-19	2	8	
1524	492	2017-09-19	3	8	RECIBIDO POR PAOLA EL 19/09/2017 A LAS 15:33 P.M.
1525	494	2017-09-19	3	8	RECIBIDO POR PAOLA EL 19/09/2017 A LAS 16:43 P.M.
1526	478	2017-09-20	3	4	Se informo la disponibilidad requerida (Gs. 80.000.000). Recibio Julio.
1527	498	2017-09-20	1	5	\N
1528	498	2017-09-20	2	9	
1529	476	2017-09-20	3	4	Se informo la disponibilidad por Gs. 110.000. Recibio Julio.
1530	499	2017-09-20	5	6	\N
1531	499	2017-09-20	3	6	Recibido en Secretaría por Paola
1532	496	2017-09-20	3	4	Se informo disponibilidad por Gs. 50.000.000 para iniciar el proceso. Recibio Julio.
1533	498	2017-09-20	3	9	Recibido en Secretaria por Julio
1534	495	2017-09-20	3	8	RECIBIDO POR PAOLA EL 20/09/2017 A LAS 10:0
1535	495	2017-09-20	3	8	RECIBIDO POR PAOLA EL 20/09/2017 A LAS 10:03 P.M.
1536	469	2017-09-20	3	8	RECIBIDO POR PAOLA EL 20/09/2017 A LAS 10:04 A.M.
1537	471	2017-09-20	3	8	RECIBIDO POR PAOLA EL 20/09/2017 A LAS 10:03 A.M.
1538	500	2017-09-20	1	5	\N
1539	500	2017-09-20	2	9	
1540	501	2017-09-20	1	5	\N
1541	502	2017-09-21	1	6	\N
1542	502	2017-09-21	2	9	
1543	502	2017-09-21	2	5	
1544	497	2017-09-21	3	9	Fue contestado por el Dpto de Control
1545	477	2017-09-21	3	9	Fue contestado por el Dpto de Control
1546	489	2017-09-21	3	8	RECIBIDO POR PAOLA EL 21/09/2017 A LAS 09:28 A.M.
1547	503	2017-09-21	1	8	\N
1548	503	2017-09-21	3	8	RECIBIDO POR PAOLA EL 21/09/2017 A LAS 09:30 A.M.
1549	502	2017-09-21	3	5	recibio eva
1550	501	2017-09-21	3	5	recibio eva
1551	406	2017-09-21	3	4	Se informo disponibilidad parcial Gs. 82.082.359. Recibio Paola.
1552	504	2017-09-21	1	6	\N
1553	504	2017-09-21	2	9	
1554	474	2017-09-21	4	9	Archivado en Recibidos 2018
1555	500	2017-09-21	4	9	Archivado en Documentos UOC 2017
1556	505	2017-09-21	1	6	\N
1557	505	2017-09-21	2	9	
1558	504	2017-09-22	2	6	
1559	504	2017-09-22	3	6	Recibido en Secretaria por Julio
1560	506	2017-09-22	1	5	\N
1561	506	2017-09-22	2	9	
1562	506	2017-09-25	2	4	
1563	507	2017-09-25	1	8	\N
1564	507	2017-09-25	2	9	
1565	508	2017-09-25	1	8	\N
1566	508	2017-09-25	2	9	
1567	509	2017-09-26	1	6	\N
1568	509	2017-09-26	2	9	
1569	509	2017-09-26	3	9	Recibido en Secretaria por Eva
1570	510	2017-09-27	1	6	\N
1571	510	2017-09-27	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1572	511	2017-09-27	1	6	\N
1573	511	2017-09-27	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1574	512	2017-09-27	1	6	\N
1575	512	2017-09-27	4	6	Archivado en 210 SERVICIOS BÁSICOS 2017
1576	506	2017-09-27	3	4	Se informo disponibilidad (Gs. 8.800.000). Recibio Paola el 25/09/2017.
1577	508	2017-09-27	3	9	Recibido en Secretaria por Julio
1578	513	2017-09-29	1	6	\N
1579	513	2017-09-29	2	9	
1580	514	2017-09-29	1	6	\N
1581	514	2017-09-29	2	9	
1582	515	2017-10-03	1	5	\N
1583	515	2017-10-03	2	9	
1584	516	2017-10-03	1	5	\N
1585	516	2017-10-03	2	9	
1586	517	2017-10-03	1	5	\N
1587	517	2017-10-03	2	9	
1588	518	2017-10-03	1	5	\N
1589	518	2017-10-03	2	9	
1590	519	2017-10-03	5	11	\N
1591	519	2017-10-03	2	9	Solic. disponibilidad presupuestaria Objeto de Gasto 210-Servicios Básicos
1592	520	2017-10-03	5	11	\N
1593	520	2017-10-03	2	9	Solic. disponibilidad presupuestaria Objeto de Gasto 910-Tasas y patentes
1594	521	2017-10-04	1	8	\N
1595	521	2017-10-04	2	9	
1596	521	2017-10-04	2	10	
1597	516	2017-10-04	2	5	
1598	520	2017-10-04	2	5	
1599	519	2017-10-04	2	8	
1600	517	2017-10-04	2	4	
1601	518	2017-10-04	2	4	
1602	513	2017-10-04	2	10	
1603	514	2017-10-04	2	8	
1604	515	2017-10-04	2	10	
1605	522	2017-10-04	1	8	\N
1606	522	2017-10-04	2	9	
1607	523	2017-10-04	1	8	\N
1608	523	2017-10-04	2	9	
1609	520	2017-10-04	3	5	recibio paola
1610	516	2017-10-04	3	5	recibio eva
1611	524	2017-10-04	5	11	\N
1612	524	2017-10-04	2	9	solic de reactivación del código Frigon
1613	513	2017-10-05	3	10	Recibido por Paola Cabrera.
1614	525	2017-10-05	1	8	\N
1615	525	2017-10-05	2	9	
1616	526	2017-10-05	1	5	\N
1617	526	2017-10-05	2	9	
1618	527	2017-10-05	1	5	\N
1619	527	2017-10-05	2	9	
1620	525	2017-10-05	2	10	
1621	526	2017-10-05	2	8	
1622	522	2017-10-05	2	7	
1623	524	2017-10-05	2	4	
1624	527	2017-10-05	3	9	Recibido en Secretaria por Eva
1625	505	2017-10-05	3	9	Recibido en Secretaria por Eva
1626	528	2017-10-06	5	11	\N
1627	529	2017-10-06	5	11	\N
1628	529	2017-10-06	2	9	Certificación  del objeto de gasto 841
1629	522	2017-10-08	3	7	recibido por Eva
1630	529	2017-10-08	2	7	
1631	530	2017-10-08	1	6	\N
1632	530	2017-10-08	3	6	Recibido en Secretaría por Paola
1633	529	2017-10-08	3	7	recibido por paola
1634	531	2017-10-09	1	5	\N
1635	531	2017-10-09	2	9	
1636	532	2017-10-09	1	5	\N
1637	532	2017-10-09	2	9	
1638	533	2017-10-09	1	5	\N
1639	533	2017-10-09	3	5	recibio ale
1640	515	2017-10-09	2	6	
1641	515	2017-10-10	3	6	Recibido en Secretaría por Paola
1642	534	2017-10-10	1	6	\N
1643	534	2017-10-10	2	9	
1644	535	2017-10-10	1	6	\N
1645	535	2017-10-10	2	9	
1646	536	2017-10-10	1	6	\N
1647	536	2017-10-10	2	9	
1648	537	2017-10-11	1	6	\N
1649	537	2017-10-11	2	9	
1650	538	2017-10-11	1	5	\N
1651	538	2017-10-11	2	9	
1652	539	2017-10-11	1	5	\N
1653	539	2017-10-11	2	9	
1654	540	2017-10-11	1	5	\N
1655	540	2017-10-11	2	9	
1656	541	2017-10-11	1	5	\N
1657	541	2017-10-11	2	9	
1658	542	2017-10-11	1	5	\N
1659	542	2017-10-11	2	9	
1660	538	2017-10-11	2	5	
1661	540	2017-10-11	2	4	
1662	537	2017-10-11	2	8	
1663	538	2017-10-11	3	5	recibio eva
1664	542	2017-10-11	2	8	
1665	538	2017-10-11	3	5	recibio eva
1666	536	2017-10-11	2	8	
1667	535	2017-10-11	2	8	
1668	532	2017-10-11	2	10	
1669	534	2017-10-11	2	4	
1670	531	2017-10-11	2	4	
1671	543	2017-10-12	1	5	\N
1672	543	2017-10-12	2	9	
1673	544	2017-10-12	1	6	\N
1674	544	2017-10-12	2	9	
1677	546	2017-10-12	1	6	\N
1678	546	2017-10-12	3	6	Recibido en Secretaria por Eva
1679	547	2017-10-16	1	5	\N
1680	547	2017-10-16	2	9	
1681	547	2017-10-16	2	5	
1682	544	2017-10-16	2	8	
1683	547	2017-10-16	3	5	recibio paola
1684	548	2017-10-16	1	6	\N
1685	548	2017-10-16	2	9	
1686	549	2017-10-16	1	6	\N
1687	549	2017-10-16	2	9	
1688	550	2017-10-17	1	6	\N
1689	550	2017-10-17	2	9	
1690	550	2017-10-17	2	5	
1691	548	2017-10-17	2	8	
1692	549	2017-10-17	2	8	
1693	539	2017-10-17	2	6	
1694	550	2017-10-17	3	5	recibio ale
1695	539	2017-10-17	3	6	Recibido en Secretaria por Eva
1696	551	2017-10-17	1	6	\N
1697	552	2017-10-17	1	6	\N
1698	552	2017-10-17	2	9	
1699	551	2017-10-17	2	9	
1700	553	2017-10-17	1	6	\N
1701	553	2017-10-17	3	6	Recibido en Secretaria por Julio
1702	554	2017-10-17	1	6	\N
1703	554	2017-10-17	2	9	
1704	555	2017-10-17	1	6	\N
1705	555	2017-10-17	2	9	
1706	554	2017-10-18	3	9	Recibido en Secretaria por Eva
1707	555	2017-10-18	3	9	Recibido en Secretaria por Eva
1708	552	2017-10-18	3	9	Recibido en Secretaria por Eva
1709	541	2017-10-18	4	9	Archivado en Anteproyecto 2019
1710	551	2017-10-18	3	9	Recibido en Secretaria por Eva
1711	556	2017-10-18	5	11	\N
1712	556	2017-10-18	2	9	solic. de CDP objeto de gasto 851
1713	557	2017-10-18	5	11	\N
1714	557	2017-10-18	2	9	solic. de CDP objeto de gasto 851
1715	558	2017-10-19	1	6	\N
1716	558	2017-10-19	4	6	Archivado en Documentos Remitidos/Recibidos 2017
1717	559	2017-10-19	1	6	\N
1718	559	2017-10-19	3	6	Recibido en Secretaria por Julio
1719	560	2017-10-22	1	5	\N
1720	560	2017-10-22	2	9	
1721	561	2017-10-22	1	6	\N
1722	561	2017-10-22	2	9	
1723	561	2017-10-22	2	5	
1724	556	2017-10-22	3	9	Recibido en Secretaria por Eva
1725	557	2017-10-22	3	9	Recibido en Secretaria por Eva
1726	561	2017-10-22	3	5	recibio ale
1727	561	2017-10-22	3	5	recibio ale
1728	523	2017-10-22	3	9	Recibido en Secretaria por Paola
1729	562	2017-10-22	1	5	\N
1730	562	2017-10-22	2	9	
1731	563	2017-10-22	1	6	\N
1732	563	2017-10-22	2	9	
1733	564	2017-10-23	1	5	\N
1734	564	2017-10-23	2	9	
1735	565	2017-10-23	1	5	\N
1736	565	2017-10-23	2	9	
1737	564	2017-10-23	2	4	
1738	564	2017-10-23	3	4	Se informo la disponibilidad requerida Gs. 1.007.943.729. Recibio Paola.
1739	540	2017-10-23	3	4	Se informo la disponibilidad requerida. Gs.
1740	540	2017-10-23	3	4	Se informo la disponibilidad requerida Gs. 231.218.165. Recibio Paola.
1741	566	2017-10-24	1	5	\N
1742	566	2017-10-24	2	9	
1743	567	2017-10-26	1	6	\N
1744	567	2017-10-26	4	6	archivado en UOC 2017
1745	568	2017-10-29	5	11	\N
1746	568	2017-10-29	2	9	Solicitud  de inquietud por no recibir rubro la cual se presentaron a concurso, así como los beneficios.
1747	569	2017-10-29	1	6	\N
1748	569	2017-10-29	3	6	Recibido en secretaría por Edgar
1749	566	2017-10-30	2	8	
1750	565	2017-10-30	2	8	
1751	562	2017-10-30	3	9	Recibido en Secretaria por Eva
1752	560	2017-10-30	4	9	Archivado en Resoluciones 2017
1753	568	2017-10-30	3	9	Recibido en Secretaria por Julio
1754	391	2017-10-30	4	9	Archivado en Anteproyecto 2018
1755	570	2017-10-30	1	6	\N
1756	570	2017-10-31	3	6	Recibido en Secretaria por Julio
1757	571	2017-10-31	1	6	\N
1758	571	2017-10-31	4	6	Archivado en Decretos 2017
1759	572	2017-10-31	1	6	\N
1760	572	2017-10-31	2	5	
1761	573	2017-10-31	1	6	\N
1762	573	2017-10-31	2	9	
1763	574	2017-10-31	1	6	\N
1764	574	2017-10-31	2	10	
1765	575	2017-11-01	1	6	\N
1766	576	2017-11-01	1	6	\N
1767	576	2017-11-01	2	8	
1768	575	2017-11-01	2	8	
1769	572	2017-11-02	3	5	recibio ale
1770	577	2017-11-02	1	10	\N
1771	578	2017-11-02	1	10	\N
1772	578	2017-11-02	2	7	
1773	579	2017-11-02	1	6	\N
1774	579	2017-11-02	2	9	
1775	580	2017-11-05	1	5	\N
1776	580	2017-11-05	2	9	
1777	581	2017-11-05	1	6	\N
1778	581	2017-11-05	2	9	
1779	582	2017-11-06	1	6	\N
1780	582	2017-11-06	2	8	
1781	574	2017-11-06	3	10	Recibido por Paola Cabrera.
1782	583	2017-11-07	1	5	\N
1783	583	2017-11-07	2	9	
1784	584	2017-11-07	1	5	\N
1785	584	2017-11-07	2	8	
1786	585	2017-11-07	1	5	\N
1787	585	2017-11-07	2	9	
1789	587	2017-11-07	1	6	\N
1790	587	2017-11-07	3	6	Recibido en secretaria por ALE
1791	580	2017-11-07	3	9	Recibido en Secretaria por Ale
1792	580	2017-11-07	3	9	Recibido en Secretaria por Ale
1793	583	2017-11-07	3	9	Recibido en Secretaria por Ale
1794	585	2017-11-07	2	8	
1795	573	2017-11-07	2	4	
1796	579	2017-11-07	2	4	
1797	563	2017-11-07	2	4	
1798	588	2017-11-07	1	5	\N
1799	588	2017-11-07	2	9	
1800	589	2017-11-07	1	5	\N
1801	589	2017-11-07	2	9	
1802	590	2017-11-08	1	5	\N
1803	590	2017-11-08	2	9	
1804	591	2017-11-08	1	5	\N
1805	591	2017-11-08	2	9	
1806	592	2017-11-08	1	5	\N
1807	592	2017-11-08	2	9	
1808	593	2017-11-08	1	5	\N
1809	593	2017-11-08	2	9	
1810	594	2017-11-08	1	5	\N
1811	594	2017-11-08	2	9	
1812	595	2017-11-09	1	5	\N
1813	595	2017-11-09	2	9	
1814	593	2017-11-09	3	9	Recibido en Secretaria por Eva
1815	596	2017-11-13	5	11	\N
1816	596	2017-11-13	2	9	CDP-Becas Objeto de Gasto841
1817	597	2017-11-13	5	11	\N
1818	597	2017-11-13	2	9	CDP OG 199 Salarios caidos
1819	598	2017-11-13	5	11	\N
1820	598	2017-11-13	2	9	Solicitud de Reprogramación de Caja chica
1821	599	2017-11-13	1	6	\N
1822	599	2017-11-13	2	9	
1823	600	2017-11-13	1	6	\N
1824	600	2017-11-13	2	9	
1825	600	2017-11-14	2	5	
1826	599	2017-11-14	3	9	Recibido en Secretaria por Ale
1827	590	2017-11-14	2	8	
1828	592	2017-11-14	2	8	
1829	591	2017-11-14	2	4	
1830	589	2017-11-14	2	8	
1831	588	2017-11-14	2	8	
1832	581	2017-11-14	2	10	
1833	507	2017-11-14	4	9	Archivado en Documentos UOC
1834	601	2017-11-15	1	6	\N
1835	601	2017-11-15	2	9	
1836	602	2017-11-15	1	6	\N
1837	602	2017-11-15	2	9	
1838	603	2017-11-15	1	6	\N
1839	603	2017-11-15	2	9	
1840	596	2017-11-15	2	7	
1841	600	2017-11-15	3	5	RECIBIO ALE
1842	604	2017-11-15	1	6	\N
1843	604	2017-11-15	2	9	
1844	596	2017-11-15	3	7	recibido por Eva
1845	605	2017-11-15	1	5	\N
1846	605	2017-11-15	2	9	
1847	606	2017-11-16	1	5	\N
1848	606	2017-11-16	2	9	
1849	607	2017-11-16	1	5	\N
1850	607	2017-11-16	2	9	
1851	608	2017-11-16	1	5	\N
1852	608	2017-11-16	2	9	
1853	609	2017-11-16	1	5	\N
1854	609	2017-11-16	2	9	
1855	610	2017-11-16	1	6	\N
1856	610	2017-11-16	2	9	
1857	611	2017-11-19	5	11	\N
1858	611	2017-11-19	2	8	Solicitud de viático Nilsa Gadea
1859	612	2017-11-20	1	6	\N
1860	612	2017-11-20	2	9	
1861	613	2017-11-20	1	6	\N
1862	613	2017-11-20	2	9	
1863	613	2017-11-20	2	8	
1864	612	2017-11-20	2	8	
1865	607	2017-11-20	2	5	
1866	610	2017-11-20	2	4	
1867	604	2017-11-20	2	4	
1868	602	2017-11-20	2	8	
1869	601	2017-11-20	2	8	
1870	605	2017-11-20	2	4	
1871	608	2017-11-20	2	8	
1872	614	2017-11-20	1	6	\N
1873	614	2017-11-20	2	9	
1874	607	2017-11-21	3	5	recibio julio
1875	\N	2017-11-21	1	5	\N
1876	\N	2017-11-21	1	5	\N
1877	\N	2017-11-21	1	5	\N
1878	\N	2017-11-21	1	5	\N
1879	615	2017-11-21	1	5	\N
1880	615	2017-11-21	2	9	
1881	616	2017-11-21	1	6	\N
1882	616	2017-11-21	2	9	
1883	610	2017-11-22	3	4	Se informo la disponibilidad requerida. Recibio Eva.
1884	604	2017-11-22	3	4	Se informo disponibilidad requerida. Recibo Eva.
1885	579	2017-11-22	3	4	Se informo la disponibilidad requerida. Recibio Eva. 03/11/2017.
1886	617	2017-11-23	1	5	\N
1887	617	2017-11-23	3	5	recibio ale
1888	617	2017-11-23	3	5	recibio ale
1889	618	2017-11-26	1	5	\N
1890	618	2017-11-26	2	9	
1891	591	2017-11-26	3	4	No existe disponibilidad. Recibio Julio.
1892	399	2017-11-26	3	4	No existe disponibilidad. Recibio Julio.
1893	349	2017-11-26	3	4	No existe disponibilidad. Recibio Julio.
1894	481	2017-11-26	3	4	No existe disponibilidad. Recibio Julio.
1895	563	2017-11-26	3	4	No existe disponibilidad. Recibio Julio.
1896	573	2017-11-26	3	4	No existe disponibilidad. Recibio Eva.
1897	605	2017-11-26	3	4	Se solicito mayor informacion a Contrataciones. Recibio Eva.
1898	534	2017-11-26	3	4	Se informo disponibilidad requerida. Recibo Eva.
1899	483	2017-11-26	3	4	Se informo disponibilidad requerida. Recibo Eva.
1900	524	2017-11-26	3	4	Se informo disponibilidad requerida. Recibo Eva.
1901	517	2017-11-26	3	4	No existe disponibilidad. Recibio Eva.
1902	518	2017-11-26	3	4	Se informo disponibilidad requerida. Recibo Eva.
1903	84	2017-11-26	3	4	No existe disponibilidad. Recibio Eva.
1904	432	2017-11-26	3	4	No existe disponibilidad. Recibio Edgar.
1905	320	2017-11-26	3	4	No existe disponibilidad. Recibio Edgar.
1906	619	2017-11-26	1	6	\N
1907	619	2017-11-26	2	9	
1908	618	2017-11-26	2	8	
1909	619	2017-11-26	3	9	Recibido en Secretaria por Ale
1910	620	2017-11-27	1	6	\N
1911	620	2017-11-27	2	9	
1912	621	2017-11-27	1	6	\N
1913	621	2017-11-27	2	9	
1914	622	2017-11-27	1	6	\N
1915	622	2017-11-27	2	9	
1916	623	2017-11-27	1	6	\N
1917	623	2017-11-27	2	9	
1918	624	2017-11-27	1	10	\N
1919	625	2017-11-27	5	11	\N
1920	625	2017-11-27	2	9	Solicitud CDP 894
1921	625	2017-11-27	3	9	Recibido en Secretaria por Ale
1922	626	2017-11-28	1	6	\N
1923	626	2017-11-28	3	6	Recibido en Secretaria por Eva
1924	627	2017-11-28	1	6	\N
1925	627	2017-11-28	3	6	Recibido en Secretaria por Eva
1926	628	2017-11-28	5	11	\N
1927	628	2017-11-28	2	9	Convocatoria de Personal Contratado para capacitación a evaluadores
1928	629	2017-11-28	5	11	\N
1929	629	2017-11-28	2	9	Remisión de Resoluciones
1930	\N	2017-11-29	5	11	\N
1931	\N	2017-11-29	5	11	\N
1932	\N	2017-11-29	5	11	\N
1933	\N	2017-11-29	5	11	\N
1934	\N	2017-11-29	5	11	\N
1935	630	2017-11-29	5	11	\N
1936	630	2017-11-29	2	9	Solicitud CDP-pago  Ingeniería Aplicada
1937	631	2017-12-03	1	6	\N
1938	631	2017-12-03	2	9	
1939	632	2017-12-03	1	6	\N
1940	632	2017-12-03	3	6	Recibido en Secretaría por Paola
1941	633	2017-12-03	1	6	\N
1942	633	2017-12-03	2	9	
1943	634	2017-12-03	1	6	\N
1944	634	2017-12-03	2	9	
1945	633	2017-12-03	2	11	
1946	631	2017-12-03	2	11	
1947	634	2017-12-03	2	11	
1948	633	2017-12-03	3	11	CDP 910-
1949	631	2017-12-03	3	11	Recibido por Alejandra
1950	634	2017-12-03	3	11	Recibido por Alejandra
1951	635	2017-12-03	1	4	\N
1952	635	2017-12-03	2	9	Para la respectiva verificacion.
1953	636	2017-12-03	1	4	\N
1954	636	2017-12-03	2	9	Para la respectiva verificacion.
1955	637	2017-12-04	1	6	\N
1956	637	2017-12-04	4	6	Archivado en Documentos Remitidos/Recibidos 2017
1957	638	2017-12-04	1	6	\N
1958	638	2017-12-04	2	10	
1959	638	2017-12-04	3	10	Recibido por Eva Escobar
1960	639	2017-12-05	5	11	\N
1961	639	2017-12-05	2	9	Solic de estructura `presupuestaria ( Contratación Directa "Provisión de Arreglos florales"
1962	640	2017-12-05	1	11	\N
1963	640	2017-12-05	2	9	Comunicado de DNP Nota Nº 1084
1964	641	2017-12-09	1	6	\N
1965	641	2017-12-09	2	9	
1966	642	2017-12-09	1	5	\N
1967	642	2017-12-09	2	9	
1968	643	2017-12-09	1	5	\N
1969	643	2017-12-09	2	9	
1970	644	2017-12-10	5	11	\N
1971	644	2017-12-10	2	9	solic de apoyo economico
1972	645	2017-12-10	5	11	\N
1973	646	2017-12-10	5	11	\N
1974	646	2017-12-10	2	9	Comunicación de Nota DC Nº 1129
1975	647	2017-12-12	1	5	\N
1976	647	2017-12-12	2	9	
1977	639	2017-12-13	3	9	Recibido en Secretaria por Paola
1978	648	2017-12-17	1	10	\N
1979	648	2017-12-17	3	10	Recibido por Eva Escobar
1980	649	2017-12-17	1	5	\N
1981	649	2017-12-17	2	9	
1982	650	2017-12-17	1	6	\N
1983	650	2017-12-17	2	9	
1984	651	2017-12-24	1	5	\N
1985	651	2017-12-24	2	9	
1986	652	2017-12-26	1	5	\N
1987	652	2017-12-26	2	9	
1988	653	2016-02-11	1	3	\N
1989	653	2016-02-11	2	9	
1990	654	2016-02-12	1	6	\N
1991	654	2016-02-12	2	9	
1992	655	2016-02-12	1	6	\N
1993	655	2016-02-12	2	9	
1994	656	2016-02-12	1	6	\N
1995	656	2016-02-12	2	9	
1996	657	2016-02-13	1	9	\N
1997	657	2016-02-13	3	9	Recibido en Secretaría por Eva
1998	653	2016-02-13	2	10	
1999	658	2016-02-16	1	6	\N
2000	658	2016-02-16	2	10	
2001	658	2018-01-10	3	10	Recibido por Eva Escobar
2002	659	2018-01-15	1	3	\N
2003	659	2018-01-15	2	9	
2004	660	2018-01-15	1	3	\N
2005	660	2018-01-15	2	9	
2006	661	2018-01-16	1	3	\N
2007	661	2018-01-16	2	9	
2008	661	2016-02-11	2	4	
2009	660	2016-02-11	2	4	
2010	662	2016-02-11	1	9	\N
2011	662	2016-02-11	3	9	Recibido en Secretaría por Eva
2012	663	2018-01-17	1	3	\N
2013	663	2018-01-17	2	9	
2014	663	2018-01-17	2	4	
2015	531	2016-02-11	4	4	Archivado.
2016	484	2016-02-11	4	4	Archivado.
2017	418	2016-02-11	4	4	Archivado.
2018	414	2016-02-11	4	4	Archivado.
2019	404	2016-02-11	4	4	Archivado.
2020	239	2016-02-11	4	4	Archivado.
2021	180	2016-02-11	4	4	Archivado.
2022	29	2016-02-11	4	4	Archivado.
2023	664	2016-02-11	5	11	\N
2024	664	2016-02-11	2	9	Solic de Informe sobre Presupuesto asignado para Nivel Medio
2025	665	2018-01-19	1	3	\N
2027	666	2018-01-19	1	3	\N
2028	666	2018-01-19	2	9	
2029	667	2018-01-19	5	11	\N
2031	668	2018-01-19	5	11	\N
2033	669	2018-01-19	1	3	\N
2035	670	2018-01-19	1	3	\N
2036	670	2018-01-19	2	9	
2037	666	2018-01-19	2	4	
2038	670	2018-01-19	2	10	
2039	664	2018-01-19	3	9	Recibido en Secretaría por Eva
2040	671	2016-02-11	5	11	\N
2041	671	2016-02-11	2	9	Reactivación de Códigos 848
2042	672	2016-02-11	5	11	\N
2044	673	2016-02-11	5	11	\N
2045	673	2016-02-11	2	9	Remisión Propuesta PLF
2046	674	2016-02-11	5	11	\N
2047	674	2016-02-11	2	9	Solic habilitación de usuarios 
2048	674	2016-02-11	3	9	Recibido en Secretaría por Eva
2049	675	2016-02-11	5	11	\N
2050	675	2016-02-11	2	9	Remisión de Resolución Nº 408
2051	676	2016-02-11	5	11	\N
2053	677	2018-01-23	5	11	\N
2054	677	2018-01-23	2	9	Reunión Mesa de Trabajo
2055	678	2018-01-24	1	3	\N
2056	678	2018-01-24	2	9	
2057	679	2018-01-24	1	3	\N
2058	679	2018-01-24	2	9	
2059	680	2018-01-24	1	3	\N
2060	680	2018-01-24	2	9	
2061	681	2018-01-24	1	3	\N
2062	681	2018-01-24	2	9	
2063	682	2018-01-24	1	3	\N
2064	682	2018-01-24	2	9	
2065	655	2016-02-11	3	9	Recibido en Secretaría por Eva
2066	683	2018-01-29	1	3	\N
2067	683	2018-01-29	2	7	
2068	684	2018-01-29	1	3	\N
2069	684	2018-01-29	2	7	
2070	684	2018-01-29	3	7	recibido por Eva
2071	683	2018-01-29	3	7	recibido por Eva
2072	685	2018-01-29	1	3	\N
2073	685	2018-01-29	2	7	
2074	686	2016-02-11	1	3	\N
2075	686	2016-02-11	2	7	
2076	687	2016-02-11	5	11	\N
2077	687	2016-02-11	2	7	remisión de Costo estimado para adquisición de inmuebles
2078	670	2016-02-11	3	10	Recibido por Eva Escobar
2079	688	2016-02-11	5	11	\N
2080	688	2016-02-11	2	7	remisión de legajo personal 
2081	689	2018-02-12	1	5	\N
2082	689	2018-02-12	2	7	
2083	689	2018-02-13	2	5	
2084	688	2018-02-13	2	5	
2085	687	2018-02-13	2	4	
2086	686	2018-02-13	2	8	
2087	578	2018-02-13	3	7	recibido por Eva
2088	466	2018-02-13	3	7	recibido por Eva
2089	690	2018-02-13	1	5	\N
2090	690	2018-02-13	2	7	
2091	690	2018-02-15	3	7	recibido por paola
2092	691	2018-02-15	1	5	\N
2093	691	2018-02-15	2	7	
2094	692	2018-02-15	1	6	\N
2095	692	2018-02-15	2	7	
2096	691	2018-02-16	2	10	
2097	693	2018-02-16	1	5	\N
2098	693	2018-02-16	2	7	
2099	691	2018-02-16	3	10	Recibido por Eva Escobar
2100	688	2018-02-19	3	5	recibio ale
2101	694	2018-02-19	1	5	\N
2102	694	2018-02-19	2	7	
2103	695	2018-02-21	1	6	\N
2104	695	2018-02-21	4	6	Archivado en Plan Financiero 2018
2105	696	2018-02-21	1	6	\N
2106	696	2018-02-21	4	6	Archivado en Plan Financiero 2018
2107	697	2018-02-21	1	6	\N
2108	697	2018-02-21	4	6	Archivado en Plan Financiero 2018
2109	698	2018-02-21	1	6	\N
2110	698	2018-02-21	4	6	Archivado en Plan Financiero 2018
2030	667	2018-01-19	2	3	Remisión  propuesta PLF 2018
2111	667	2018-02-21	4	3	Archivado en Plan Financiero 2018
2112	699	2018-02-21	1	6	\N
2113	699	2018-02-21	4	6	Archivado en Plan Financiero 2018
2114	700	2018-02-21	5	6	\N
2115	700	2018-02-21	4	6	Archivado en Plan Financiero 2018
2034	669	2018-01-19	2	3	
2116	669	2018-02-21	4	3	Archivado en Plan Financiero 2018
2032	668	2018-01-19	2	3	Remisión  propuesta PLF 2018
2117	668	2018-02-21	4	3	Archivado en Plan Financiero 2018
2052	676	2016-02-11	2	3	Gastos prioritarios
2118	676	2018-02-21	4	3	Archivado en Plan Financiero 2018
2026	665	2018-01-19	2	3	
2119	665	2018-02-21	4	3	Archivado en Plan Financiero 2018
2123	702	2018-02-27	1	5	\N
2124	702	2018-02-27	3	5	recibio ale
2043	672	2016-02-11	4	9	Archivado en Plan Financiero 2018
2120	701	2018-02-23	1	5	\N
2121	701	2018-02-27	3	5	recibio paola
2122	701	2018-02-27	3	5	recibio paola
2125	702	2018-02-27	3	5	recibio ale
2126	703	2018-02-27	1	1	\N
2127	703	2018-02-27	2	9	
2128	704	2018-02-27	1	1	\N
2129	704	2018-02-27	2	9	
2130	705	2018-02-27	1	1	\N
2131	705	2018-02-27	2	9	
2132	706	2018-02-28	1	5	\N
2133	706	2018-02-28	2	9	
2134	707	2018-02-28	1	5	\N
2135	707	2018-02-28	2	9	
2136	708	2018-02-28	1	5	\N
2137	708	2018-02-28	2	9	
2138	709	2018-02-28	1	5	\N
2139	709	2018-02-28	2	9	
2140	692	2018-02-28	3	7	recibido por Paola
2141	709	2018-02-28	3	9	Recibido en SecretarÃ­a por Paola
2142	710	2018-03-01	1	6	\N
2143	710	2018-03-01	2	9	
2144	711	2018-03-01	1	6	\N
2145	711	2018-03-01	2	9	
2146	712	2018-03-02	1	5	\N
2147	712	2018-03-02	2	9	
2148	713	2018-03-02	1	5	\N
2149	713	2018-03-02	2	9	
2150	714	2018-03-05	1	6	\N
2151	714	2018-03-05	2	9	
2152	715	2018-03-05	1	6	\N
2153	715	2018-03-05	2	9	
2154	711	2018-03-05	3	9	Recibido en Secretaría por Ale
2155	710	2018-03-05	3	9	Recibido en Secretaría por Ale
2156	689	2018-03-06	3	5	recibio paola
2157	716	2018-03-06	5	11	\N
2158	716	2018-03-06	2	9	Solic de ampliación presupuestaria
2159	717	2018-03-06	1	3	\N
2160	717	2018-03-06	2	9	
2161	718	2018-03-06	1	3	\N
2162	718	2018-03-06	2	9	
2163	719	2018-03-06	1	3	\N
2164	719	2018-03-06	2	9	
2165	720	2018-03-06	1	3	\N
2166	720	2018-03-06	2	9	
2167	721	2018-03-07	1	5	\N
2168	721	2018-03-07	2	9	
2169	722	2018-03-07	5	3	\N
2170	723	2018-03-07	5	3	\N
2171	723	2018-03-07	3	3	Recibido por Paola
2172	722	2018-03-07	3	3	Recibido por Paola
2173	713	2018-03-07	3	9	Recibido en Secretaría por Ale
2174	715	2018-03-07	2	5	
2175	714	2018-03-07	3	9	Recibido en Secretaría por Ale
2176	717	2018-03-07	3	9	Recibido en Secretaría por Paola
2177	720	2018-03-07	4	9	Archivado en Servicios Básicos
2178	719	2018-03-07	4	9	Archivado en Servicios Básicos
2179	718	2018-03-07	4	9	Archivado en Servicios Básicos
2180	682	2018-03-07	4	9	Archivado en Plan Financiero 2018
2181	712	2018-03-07	3	9	Recibido en Secretaría por Paola
2182	708	2018-03-07	3	9	Recibido en Secretaría por Ale
2183	707	2018-03-07	3	9	Recibido en Secretaría por Ale
2184	705	2018-03-07	3	9	Recibido en Secretaría por Paola
2185	680	2018-03-07	3	9	Recibido en Secretaría por Ale
2186	704	2018-03-07	3	9	Recibido en Secretaría por Ale
2187	703	2018-03-07	3	9	Recibido en Secretaría por Ale
2188	681	2018-03-07	3	9	Recibido en Secretaría por Ale
2189	678	2018-03-07	3	9	Recibido en Secretaría por Eva
2190	671	2018-03-07	3	9	Recibido en Secretaría por Eva
2191	673	2018-03-07	4	9	Archivado en Plan Financiero 2018
2192	652	2018-03-07	3	9	Recibido en Secretaría por Eva
2193	650	2018-03-07	3	9	Recibido en Secretaría por Eva
2194	644	2018-03-07	3	9	Recibido en Secretaría por Eva
2195	646	2018-03-07	4	9	Archivado en UOC 2017
2196	643	2018-03-07	3	9	Recibido en Secretaría por Paola
2197	642	2018-03-07	3	9	Recibido en Secretaría por Paola
2198	724	2018-03-08	5	11	\N
2199	724	2018-03-08	2	9	Remisión de Resolución de traslado definitivo Elida Beatriz Careaga
2200	725	2018-03-08	5	11	\N
2201	725	2018-03-08	2	9	copia de nota presentada del Movimiento Sindical del Magisterio Pyo
2202	726	2018-03-09	1	6	\N
2203	726	2018-03-09	2	9	
2204	727	2018-03-09	1	6	\N
2205	727	2018-03-09	2	9	
2206	685	2018-03-09	4	7	archivado en documentos recibidos 2018
2207	728	2018-03-09	1	6	\N
2208	728	2018-03-09	3	6	Recibido en Secretaría por Paola
2209	716	2018-03-09	3	9	Recibido en Secretaría por Paola
2210	715	2018-03-09	3	5	recibio paola
2211	729	2018-03-12	1	6	\N
2212	729	2018-03-12	2	9	
2213	730	2018-03-12	1	6	\N
2214	730	2018-03-12	2	9	
2215	721	2018-03-12	3	9	Recibido en SecretarÃ­a por Julio
2216	727	2018-03-12	3	9	Recibido en Secretaría por Julio
2217	731	2018-03-12	1	5	\N
2218	731	2018-03-12	3	5	recibio paola
2219	732	2018-03-12	1	6	\N
2220	732	2018-03-12	2	9	
2221	730	2018-03-12	3	9	Recibido en Secretaría por Paola
2222	729	2018-03-12	3	9	Recibido en Secretaría por Paola
2223	724	2018-03-12	3	9	Recibido en Secretaría por Paola
2224	706	2018-03-12	3	9	Recibido en Secretaría por Ale
2225	733	2018-03-12	1	6	\N
2226	733	2018-03-12	2	9	
2227	734	2018-03-12	1	6	\N
2228	734	2018-03-12	2	9	
2229	735	2018-03-12	1	6	\N
2230	735	2018-03-12	2	9	
2231	734	2018-03-13	3	9	Recibido en Secretaría por Paola
2232	733	2018-03-13	3	9	Recibido en Secretaría por Paola
2233	736	2018-03-14	1	6	\N
2234	736	2018-03-14	2	9	
2235	737	2018-03-14	1	5	\N
2236	737	2018-03-14	2	9	
2237	738	2018-03-14	1	5	\N
2238	738	2018-03-14	2	9	
2239	739	2018-03-14	1	5	\N
2240	739	2018-03-14	2	9	
2241	740	2018-03-15	1	5	\N
2242	740	2018-03-15	2	9	
2243	741	2018-03-16	1	5	\N
2244	741	2018-03-16	2	9	
2245	742	2018-03-16	1	5	\N
2246	742	2018-03-16	3	5	recibio ale
2247	743	2018-03-19	1	6	\N
2248	744	2018-03-19	1	6	\N
2249	744	2018-03-19	2	4	
2250	743	2018-03-19	2	5	
2251	745	2018-03-20	1	6	\N
2252	745	2018-03-20	2	9	
2253	746	2018-03-20	1	6	\N
2254	746	2018-03-20	2	9	
2255	747	2018-03-21	1	6	\N
2256	747	2018-03-21	2	9	
2257	748	2018-03-21	1	6	\N
2258	748	2018-03-21	2	9	
2259	749	2018-03-22	1	3	\N
2260	749	2018-03-22	2	9	
2261	745	2018-03-22	3	9	Recibido en Secretaría por Julio
2262	746	2018-03-22	3	9	Recibido en Secretaría por Julio
2263	726	2018-03-22	4	9	Archivado en Documentos Recibidos 2018
2264	736	2018-03-22	4	9	Archivado en Documentos Recibidos 2018
2265	732	2018-03-22	3	9	Recibido en Secretaría por Eva
2266	738	2018-03-22	3	9	Recibido en Secretaría por Ale
2267	735	2018-03-22	3	9	Recibido en Secretaría por Ale
2268	750	2018-03-22	1	6	\N
2269	750	2018-03-22	3	6	recibido por Eva
2270	739	2018-03-22	3	9	Recibido en Secretaría por Paola
2271	679	2018-03-22	3	9	Recibido en Secretaría por Paola
2272	743	2018-03-23	2	9	
2273	751	2018-03-23	1	5	\N
2274	751	2018-03-23	2	9	
2275	752	2018-03-23	1	6	\N
2276	752	2018-03-23	2	9	
2277	753	2018-03-26	1	3	\N
2278	753	2018-03-26	2	9	
2279	754	2018-03-26	1	6	\N
2280	754	2018-03-26	2	9	
2281	755	2018-04-02	1	3	\N
2282	755	2018-04-02	2	9	
2283	756	2018-04-02	1	3	\N
2284	756	2018-04-02	2	9	
2285	752	2018-04-02	2	10	
2286	755	2018-04-02	2	5	
2287	756	2018-04-02	2	4	
2288	752	2018-04-02	3	10	Recibido por Paola Cabrera.
2289	757	2018-04-03	1	6	\N
2290	757	2018-04-03	2	9	
2291	758	2018-04-03	1	6	\N
2292	758	2018-04-03	2	9	
2293	759	2018-04-03	1	6	\N
2294	759	2018-04-03	2	9	
2295	760	2018-04-03	1	5	\N
2296	760	2018-04-03	2	9	
2297	761	2018-04-03	1	5	\N
2298	761	2018-04-03	2	9	
2299	762	2018-04-03	1	5	\N
2300	762	2018-04-03	2	9	
2301	763	2018-04-03	1	5	\N
2302	763	2018-04-03	3	5	recibio eva
2303	763	2018-04-03	3	5	recibio eva
2306	755	2018-04-03	3	5	recibio eva
2307	759	2018-04-03	2	5	
2308	761	2018-04-03	2	10	
2309	762	2018-04-03	4	9	Archivado en UOC 2018
2310	757	2018-04-03	2	5	
2311	749	2018-04-03	4	9	Archivado en Documentos Recibidos 2018
2312	758	2018-04-03	2	5	
2313	754	2018-04-03	2	5	
2314	751	2018-04-03	2	4	
2315	764	2018-04-03	1	6	\N
2316	764	2018-04-03	2	9	
2317	765	2018-04-03	5	11	\N
2318	765	2018-04-03	2	9	CDP 210
2319	766	2018-04-03	5	11	\N
2320	766	2018-04-03	2	9	CDp patentes y rodados
2321	767	2018-04-04	1	5	\N
2322	767	2018-04-04	2	9	
2323	768	2018-04-04	1	6	\N
2324	768	2018-04-04	2	8	
2325	759	2018-04-04	3	5	recibio paola
2326	754	2018-04-04	3	5	recibio eva
2327	769	2018-04-06	1	6	\N
2328	770	2018-04-06	1	6	\N
2329	770	2018-04-06	2	9	
2330	771	2018-04-06	1	6	\N
2331	771	2018-04-06	2	9	
2332	772	2018-04-06	1	6	\N
2333	772	2018-04-06	2	9	
2334	773	2018-04-06	1	6	\N
2335	773	2018-04-06	2	9	
2336	774	2018-04-06	1	3	\N
2337	774	2018-04-06	2	9	
2338	775	2018-04-06	1	3	\N
2339	775	2018-04-06	2	9	
2340	776	2018-04-06	1	3	\N
2341	776	2018-04-06	2	9	
2342	777	2018-04-09	1	5	\N
2343	777	2018-04-09	2	9	
2344	778	2018-04-09	1	5	\N
2345	778	2018-04-09	2	9	
2346	779	2018-04-09	1	6	\N
2347	779	2018-04-09	4	6	Archivado en Documentos UOC 2018
2348	780	2018-04-10	1	5	\N
2349	780	2018-04-10	2	9	
2350	781	2018-04-11	1	5	\N
2351	781	2018-04-11	2	9	
2352	757	2018-04-12	3	5	recibio eva
2353	758	2018-04-12	3	5	recibio eva
2354	782	2018-04-12	1	5	\N
2355	782	2018-04-12	2	9	
2356	783	2018-04-12	1	5	\N
2357	783	2018-04-12	2	9	
2358	784	2018-04-12	1	5	\N
2359	784	2018-04-12	2	9	
2360	785	2018-04-12	1	5	\N
2361	785	2018-04-12	2	9	
2362	737	2018-04-12	3	9	Recibido en Secretaría por Paola
2363	740	2018-04-12	3	9	Recibido en Secretaría por Ale
2364	767	2018-04-12	3	9	Recibido en Secretaría por Ale
2365	785	2018-04-12	2	7	
2366	784	2018-04-12	2	7	
2367	783	2018-04-12	2	8	
2368	780	2018-04-12	3	9	Recibido en Secretaría por Ale
2369	773	2018-04-12	2	8	
2370	775	2018-04-12	3	9	Recibido en Secretaría por Eva
2371	765	2018-04-12	3	9	Recibido en Secretaría por Eva
2372	766	2018-04-12	3	9	Recibido en Secretaría por Eva
2373	760	2018-04-12	3	9	a control
2374	764	2018-04-12	3	9	Recibido en Secretaría por Eva
2375	771	2018-04-12	3	9	Recibido en Secretaría por Ale
2376	743	2018-04-12	3	9	Recibido en Secretaría por Eva
2377	769	2018-04-12	4	6	Archivado en documentos recibidos 2018
2378	786	2018-04-12	1	5	\N
2379	786	2018-04-12	2	9	
2380	787	2018-04-12	1	3	\N
2381	787	2018-04-12	2	9	
2382	788	2018-04-12	1	3	\N
2383	788	2018-04-12	2	9	
2384	789	2018-04-16	1	5	\N
2385	789	2018-04-16	2	9	
2386	790	2018-04-18	1	5	\N
2387	790	2018-04-18	2	9	
2388	791	2018-04-19	1	5	\N
2389	791	2018-04-19	2	9	
2390	782	2018-04-19	3	9	Recibido en Secretaría por Paola
2391	790	2018-04-19	3	9	Recibido en Secretaría por Paola
2392	792	2018-04-19	1	5	\N
2393	792	2018-04-19	2	9	
2394	793	2018-04-20	1	3	\N
2395	793	2018-04-20	2	9	
2396	794	2018-04-20	1	3	\N
2397	794	2018-04-20	2	9	
2398	795	2018-04-20	1	5	\N
2399	795	2018-04-20	2	9	
2400	796	2018-04-20	1	5	\N
2401	796	2018-04-20	2	9	
2402	797	2018-04-23	1	5	\N
2403	797	2018-04-23	2	7	
2404	798	2018-04-24	1	6	\N
2405	798	2018-04-24	2	9	
2406	794	2018-04-24	2	10	
2407	794	2018-04-24	3	10	Recibido por Eva Escobar
2408	796	2018-04-24	4	9	Archivado en UOC 2018
2409	789	2018-04-24	4	9	Archivado en UOC 2018
2410	798	2018-04-24	2	8	
2411	799	2018-04-27	1	5	\N
2412	799	2018-04-27	2	9	
2413	800	2018-04-27	1	6	\N
2414	800	2018-04-27	2	8	
2415	801	2018-04-27	1	5	\N
2416	801	2018-04-27	2	9	
2417	802	2018-05-03	1	5	\N
2418	802	2018-05-03	2	9	
2419	772	2018-05-03	3	9	Recibido en Secretaría por Ale
2420	803	2018-05-07	1	5	\N
2421	803	2018-05-07	2	9	
2422	804	2018-05-07	1	5	\N
2423	804	2018-05-07	2	9	
2424	805	2018-05-11	1	5	\N
2425	805	2018-05-11	2	9	
2426	806	2018-05-11	1	5	\N
2427	806	2018-05-11	2	9	
2428	807	2018-05-16	1	5	\N
2429	807	2018-05-16	2	9	
2430	808	2018-05-16	1	5	\N
2431	808	2018-05-16	2	9	
2432	809	2018-05-16	1	5	\N
2433	809	2018-05-16	2	9	
2434	810	2018-05-18	1	5	\N
2435	810	2018-05-18	3	5	recibio eva
2436	811	2018-05-18	1	5	\N
2437	811	2018-05-18	2	9	
2438	812	2018-05-21	1	5	\N
2439	812	2018-05-21	2	9	
2440	813	2018-05-21	1	5	\N
2441	813	2018-05-21	2	9	
2442	814	2018-05-21	1	5	\N
2443	814	2018-05-21	2	9	
2444	802	2018-05-21	3	9	Recibido en Secretaría por Eva
2445	811	2018-05-21	2	10	
2446	815	2018-05-22	1	6	\N
2447	815	2018-05-22	2	9	
2448	809	2018-05-22	3	9	Recibido en Secretaría por Eva
2449	816	2018-05-23	1	5	\N
2450	816	2018-05-23	2	9	
2451	817	2018-05-23	1	10	\N
2452	817	2018-05-23	3	10	Recibido por Eva Escobar
2453	818	2018-05-23	1	5	\N
2454	819	2018-05-23	1	10	\N
2455	819	2018-05-23	3	10	Recibido por Eva Escobar
2456	820	2018-05-23	1	10	\N
2457	820	2018-05-23	3	10	Recibido por Eva Escobar
2458	821	2018-05-23	1	10	\N
2459	821	2018-05-23	2	10	solicitud de pago.
2460	821	2018-05-23	3	10	Recibido por Eva Escobar
2461	822	2018-05-23	1	10	\N
2462	822	2018-05-23	3	10	Recibido por Eva Escobar
2463	653	2018-05-23	3	10	Recibido por Eva Escobar
2464	102	2018-05-23	3	10	Recibido por Eva Escobar
2465	311	2018-05-23	3	10	Recibido por Eva Escobar
2466	312	2018-05-23	3	10	Recibido por Eva Escobar
2467	366	2018-05-23	3	10	Recibido por Eva Escobar
2468	375	2018-05-23	3	10	Recibido por Paola Cabrera.
2469	452	2018-05-23	3	10	Recibido por Eva Escobar
2470	521	2018-05-23	3	10	Recibido por Paola Cabrera.
2471	525	2018-05-23	3	10	Recibido por Eva Escobar
2472	532	2018-05-23	3	10	Recibido por Eva Escobar
2473	577	2018-05-23	3	10	Recibido por Paola Cabrera.
2474	581	2018-05-23	3	10	Recibido por Eva Escobar
2475	624	2018-05-23	3	10	Recibido por Paola Cabrera.
2476	761	2018-05-23	3	10	Recibido por Eva Escobar
2477	823	2018-05-23	1	5	\N
2478	823	2018-05-23	2	9	
2479	818	2018-05-23	3	5	recibio julai
2480	811	2018-05-23	3	10	Recibido por Alejandra Irala.
2481	824	2018-05-25	1	5	\N
2482	824	2018-05-25	2	9	
2483	825	2018-05-29	1	5	\N
2484	826	2018-05-30	1	5	\N
2485	826	2018-05-30	2	9	
2486	827	2018-05-30	1	5	\N
2487	827	2018-05-30	2	9	
2488	828	2018-06-01	1	5	\N
2489	828	2018-06-01	2	9	
2490	829	2018-06-01	1	5	\N
2491	829	2018-06-01	2	9	
2492	830	2018-06-04	1	5	\N
2493	830	2018-06-04	4	5	archivado en Tipo I
2494	825	2018-06-05	3	5	recibio ale
2495	831	2018-06-05	1	5	\N
2496	831	2018-06-05	2	9	
2497	832	2018-06-05	1	5	\N
2498	832	2018-06-05	4	5	archivado en TIPO I
2499	833	2018-06-05	1	5	\N
2500	833	2018-06-05	4	5	archivado en TIPO I
2501	834	2018-06-05	1	5	\N
2502	834	2018-06-05	2	9	
2503	835	2018-06-05	1	5	\N
2504	835	2018-06-05	4	5	archivado en tipo I
2505	836	2018-06-05	1	10	\N
2506	836	2018-06-05	3	10	Recibido por Paola Cabrera.
2507	837	2018-06-06	1	5	\N
2508	837	2018-06-06	4	5	archivado en tipo II
2509	838	2018-06-06	1	5	\N
2510	838	2018-06-06	4	5	archivado en recibido
2511	839	2018-06-06	1	5	\N
2512	839	2018-06-06	4	5	archivado en Tipo I
2513	840	2018-06-06	1	5	\N
2514	840	2018-06-07	2	9	
2515	841	2018-06-07	1	5	\N
2516	841	2018-06-07	2	9	
2517	842	2018-06-07	1	5	\N
2518	842	2018-06-07	4	5	archivado en Tipo I
2519	843	2018-06-07	1	5	\N
2520	843	2018-06-07	2	9	
2521	844	2018-06-07	1	5	\N
2522	844	2018-06-07	2	9	
2523	814	2018-06-08	4	9	Archivado en Recibidos
2524	823	2018-06-08	4	9	Archivado en Datos Adicionales Anteproyecto 2019
2525	805	2018-06-08	4	9	Archivado en UOC 2019
2526	827	2018-06-08	4	9	Archivado en UOC 2018
2527	843	2018-06-08	2	10	
2528	844	2018-06-08	2	10	
2529	834	2018-06-08	2	10	
2530	834	2018-06-08	3	10	Recibido por Eva Escobar
2531	843	2018-06-08	3	10	Recibido por Eva Escobar
2532	844	2018-06-08	4	10	archivado por Tomás Garbini
2533	845	2018-06-12	1	5	\N
2534	845	2018-06-12	3	5	recibio eva
2535	846	2018-06-12	1	5	\N
2536	846	2018-06-12	4	5	archivado en tipo II
2537	847	2018-06-12	1	5	\N
2538	847	2018-06-12	4	5	archivado en tipo II
2539	848	2018-06-12	1	5	\N
2540	848	2018-06-12	4	5	archivado en tipo I
2541	849	2018-06-12	1	5	\N
2542	849	2018-06-12	4	5	archivado en tipo II
2543	850	2018-06-12	1	5	\N
2544	850	2018-06-12	4	5	archivado en tipo I
2545	851	2018-06-12	1	5	\N
2546	851	2018-06-12	4	5	archivado en TIpo II
2547	852	2018-06-12	1	5	\N
2548	852	2018-06-12	4	5	archivado en tipo II
2549	853	2018-06-12	1	5	\N
2550	853	2018-06-12	4	5	archivado en Tipo I
2551	854	2018-06-13	1	5	\N
2552	854	2018-06-13	4	5	archivado en tipo I
2553	855	2018-06-13	1	5	\N
2554	855	2018-06-13	3	5	recibio paola
2555	856	2018-06-15	1	3	\N
2556	856	2018-06-15	2	9	
2557	857	2018-06-15	1	3	\N
2558	857	2018-06-15	2	9	
2559	858	2018-06-18	1	3	\N
2560	858	2018-06-18	2	9	
2561	859	2018-06-18	1	3	\N
2562	859	2018-06-18	2	9	
2563	860	2018-06-19	1	1	\N
2564	860	2018-06-19	2	9	
2565	861	2018-06-19	1	1	\N
2566	861	2018-06-19	2	9	
2567	862	2018-06-19	1	1	\N
2568	862	2018-06-19	2	9	
2569	863	2018-06-19	1	3	\N
2570	863	2018-06-19	2	9	
2571	864	2018-06-20	1	3	\N
2572	864	2018-06-20	2	9	
2573	865	2018-06-20	1	3	\N
2574	865	2018-06-20	2	9	
2575	866	2018-06-20	1	3	\N
2576	866	2018-06-20	2	9	
2577	867	2018-06-21	1	5	\N
2578	867	2018-06-21	4	5	archivado en TIPO I
2579	868	2018-06-21	1	3	\N
2580	868	2018-06-21	2	9	
2581	869	2018-06-21	1	3	\N
2582	869	2018-06-21	2	9	
\.


--
-- TOC entry 2667 (class 0 OID 17708)
-- Dependencies: 229
-- Data for Name: documentos_movimiento_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documentos_movimiento_estado (id, descripcion) FROM stdin;
1	Entrada
3	Salida
4	Archivar
2	Transpaso
5	Elaborado
\.


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 230
-- Name: documentos_movimiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documentos_movimiento_id_seq', 2582, true);


--
-- TOC entry 2624 (class 0 OID 17331)
-- Dependencies: 185
-- Data for Name: enlaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enlaces (enlace, descripcion) FROM stdin;
2	Viaticos
3	Ingresos
4	Caja chica
5	Transferencias 851
1	Certificaciones UOC
\.


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 186
-- Name: enlaces_enlace_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enlaces_enlace_seq', 1, false);


--
-- TOC entry 2659 (class 0 OID 17647)
-- Dependencies: 221
-- Data for Name: estructura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estructura (id, tp, pg, sp, py, obj, ff, of, dpt) FROM stdin;
1	1	1	0	0	111	10	1	99
2	1	1	0	0	112	10	1	99
3	1	1	0	0	113	10	1	99
4	1	1	0	0	114	10	1	99
5	1	1	0	0	123	10	1	99
6	1	1	0	0	123	30	1	99
7	1	1	0	0	125	10	1	99
8	1	1	0	0	131	10	1	99
9	1	1	0	0	132	10	1	99
10	1	1	0	0	133	10	1	99
11	1	1	0	0	133	30	1	99
12	1	1	0	0	134	10	1	99
13	1	1	0	0	137	10	1	99
14	1	1	0	0	141	10	1	99
15	1	1	0	0	143	10	1	99
16	1	1	0	0	144	10	1	99
17	1	1	0	0	144	30	1	99
18	1	1	0	0	145	10	1	99
19	1	1	0	0	145	30	1	99
20	1	1	0	0	191	10	1	99
21	1	1	0	0	199	10	1	99
22	1	1	0	0	210	10	1	99
23	1	1	0	0	210	30	1	99
24	1	1	0	0	230	10	1	99
25	1	1	0	0	230	30	1	99
26	1	1	0	0	240	10	1	99
27	1	1	0	0	240	30	1	99
28	1	1	0	0	240	30	302	99
29	1	1	0	0	250	10	1	99
30	1	1	0	0	250	30	1	99
31	1	1	0	0	260	10	1	99
32	1	1	0	0	260	30	1	99
33	1	1	0	0	260	30	302	99
34	1	1	0	0	280	10	1	99
35	1	1	0	0	280	30	1	99
36	1	1	0	0	280	30	302	99
37	1	1	0	0	290	10	1	99
38	1	1	0	0	290	30	1	99
39	1	1	0	0	320	10	1	99
40	1	1	0	0	320	30	1	99
41	1	1	0	0	330	10	1	99
42	1	1	0	0	330	30	1	99
43	1	1	0	0	340	10	1	99
44	1	1	0	0	340	30	1	99
45	1	1	0	0	350	10	1	99
46	1	1	0	0	350	30	302	99
47	1	1	0	0	360	10	1	99
48	1	1	0	0	360	30	1	99
49	1	1	0	0	390	10	1	99
50	1	1	0	0	390	30	302	99
51	1	1	0	0	520	10	3	99
52	1	1	0	0	540	10	1	99
53	1	1	0	0	540	10	3	99
54	1	1	0	0	540	30	1	99
55	1	1	0	0	811	10	126	99
56	1	1	0	0	811	10	128	99
57	1	1	0	0	811	10	171	11
58	1	1	0	0	811	10	172	10
59	1	1	0	0	811	10	173	12
60	1	1	0	0	811	10	174	7
61	1	1	0	0	811	10	175	1
62	1	1	0	0	811	10	176	4
63	1	1	0	0	811	10	177	5
64	1	1	0	0	811	10	178	14
65	1	1	0	0	811	10	181	99
66	1	1	0	0	811	10	182	99
67	1	1	0	0	811	30	126	99
68	1	1	0	0	834	30	1	99
69	1	1	0	0	841	10	1	99
70	1	1	0	0	851	10	1	99
71	1	1	0	0	853	10	1	0
72	1	1	0	0	853	30	1	0
73	1	1	0	0	861	10	126	99
74	1	1	0	0	861	10	171	11
75	1	1	0	0	894	30	1	99
76	1	1	0	0	910	10	1	99
77	1	1	0	0	910	30	1	99
78	2	1	1	0	111	10	1	0
79	2	1	1	0	111	10	1	1
80	2	1	1	0	111	10	1	2
81	2	1	1	0	111	10	1	3
82	2	1	1	0	111	10	1	4
83	2	1	1	0	111	10	1	5
84	2	1	1	0	111	10	1	6
85	2	1	1	0	111	10	1	7
86	2	1	1	0	111	10	1	8
87	2	1	1	0	111	10	1	9
88	2	1	1	0	111	10	1	10
89	2	1	1	0	111	10	1	11
90	2	1	1	0	111	10	1	12
91	2	1	1	0	111	10	1	13
92	2	1	1	0	111	10	1	14
93	2	1	1	0	111	10	1	15
94	2	1	1	0	111	10	1	16
95	2	1	1	0	111	10	1	17
96	2	1	1	0	111	10	1	99
97	2	1	1	0	114	10	1	0
98	2	1	1	0	114	10	1	1
99	2	1	1	0	114	10	1	2
100	2	1	1	0	114	10	1	3
101	2	1	1	0	114	10	1	4
102	2	1	1	0	114	10	1	5
103	2	1	1	0	114	10	1	6
104	2	1	1	0	114	10	1	7
105	2	1	1	0	114	10	1	8
106	2	1	1	0	114	10	1	9
107	2	1	1	0	114	10	1	10
108	2	1	1	0	114	10	1	11
109	2	1	1	0	114	10	1	12
110	2	1	1	0	114	10	1	13
111	2	1	1	0	114	10	1	14
112	2	1	1	0	114	10	1	15
113	2	1	1	0	114	10	1	16
114	2	1	1	0	114	10	1	17
115	2	1	1	0	114	10	1	99
116	2	1	1	0	123	10	1	99
117	2	1	1	0	134	10	1	99
118	2	1	1	0	199	10	1	99
119	2	1	1	0	210	10	1	99
120	2	1	1	0	220	10	1	99
121	2	1	1	0	230	10	1	99
122	2	1	1	0	230	30	302	99
123	2	1	1	0	240	10	1	99
124	2	1	1	0	250	10	1	99
125	2	1	1	0	330	10	1	99
126	2	1	1	0	340	10	1	99
127	2	1	1	0	340	30	302	99
128	2	1	1	0	360	10	1	99
129	2	1	1	0	510	10	1	99
130	2	1	1	0	510	10	3	99
131	2	1	1	0	520	10	1	99
132	2	1	1	0	520	10	3	99
133	2	1	1	0	530	10	1	99
134	2	1	1	0	530	10	3	99
135	2	1	1	0	540	10	1	99
136	2	1	1	0	834	10	1	99
137	2	1	1	0	848	10	1	99
138	2	1	1	0	894	10	1	99
139	2	1	2	0	111	10	1	0
140	2	1	2	0	111	10	1	1
141	2	1	2	0	111	10	1	2
142	2	1	2	0	111	10	1	3
143	2	1	2	0	111	10	1	4
144	2	1	2	0	111	10	1	5
145	2	1	2	0	111	10	1	6
146	2	1	2	0	111	10	1	7
147	2	1	2	0	111	10	1	8
148	2	1	2	0	111	10	1	9
149	2	1	2	0	111	10	1	10
150	2	1	2	0	111	10	1	11
151	2	1	2	0	111	10	1	12
152	2	1	2	0	111	10	1	13
153	2	1	2	0	111	10	1	14
154	2	1	2	0	111	10	1	15
155	2	1	2	0	111	10	1	16
156	2	1	2	0	111	10	1	17
157	2	1	2	0	111	10	1	99
158	2	1	2	0	114	10	1	0
159	2	1	2	0	114	10	1	1
160	2	1	2	0	114	10	1	2
161	2	1	2	0	114	10	1	3
162	2	1	2	0	114	10	1	4
163	2	1	2	0	114	10	1	5
164	2	1	2	0	114	10	1	6
165	2	1	2	0	114	10	1	7
166	2	1	2	0	114	10	1	8
167	2	1	2	0	114	10	1	9
168	2	1	2	0	114	10	1	10
169	2	1	2	0	114	10	1	11
170	2	1	2	0	114	10	1	12
171	2	1	2	0	114	10	1	13
172	2	1	2	0	114	10	1	14
173	2	1	2	0	114	10	1	15
174	2	1	2	0	114	10	1	16
175	2	1	2	0	114	10	1	17
176	2	1	2	0	114	10	1	99
177	2	1	2	0	134	10	1	99
178	2	1	2	0	199	10	1	99
179	2	1	2	0	220	10	1	99
180	2	1	2	0	230	10	1	99
181	2	1	2	0	230	30	302	99
182	2	1	2	0	240	10	1	99
183	2	1	2	0	340	10	1	99
184	2	1	2	0	360	10	1	99
185	2	1	2	0	540	10	1	99
186	2	1	2	0	834	10	1	99
187	2	1	2	0	894	10	1	99
188	2	1	3	0	111	10	1	0
189	2	1	3	0	111	10	1	1
190	2	1	3	0	111	10	1	2
191	2	1	3	0	111	10	1	3
192	2	1	3	0	111	10	1	4
193	2	1	3	0	111	10	1	5
194	2	1	3	0	111	10	1	6
195	2	1	3	0	111	10	1	7
196	2	1	3	0	111	10	1	8
197	2	1	3	0	111	10	1	9
198	2	1	3	0	111	10	1	10
199	2	1	3	0	111	10	1	11
200	2	1	3	0	111	10	1	12
201	2	1	3	0	111	10	1	13
202	2	1	3	0	111	10	1	14
203	2	1	3	0	111	10	1	15
204	2	1	3	0	111	10	1	16
205	2	1	3	0	111	10	1	99
206	2	1	3	0	113	10	1	0
207	2	1	3	0	113	10	1	99
208	2	1	3	0	114	10	1	0
209	2	1	3	0	114	10	1	1
210	2	1	3	0	114	10	1	2
211	2	1	3	0	114	10	1	3
212	2	1	3	0	114	10	1	4
213	2	1	3	0	114	10	1	5
214	2	1	3	0	114	10	1	6
215	2	1	3	0	114	10	1	7
216	2	1	3	0	114	10	1	8
217	2	1	3	0	114	10	1	9
218	2	1	3	0	114	10	1	10
219	2	1	3	0	114	10	1	11
220	2	1	3	0	114	10	1	12
221	2	1	3	0	114	10	1	13
222	2	1	3	0	114	10	1	14
223	2	1	3	0	114	10	1	15
224	2	1	3	0	114	10	1	16
225	2	1	3	0	114	10	1	99
226	2	1	3	0	123	10	1	99
227	2	1	3	0	125	10	1	99
228	2	1	3	0	134	10	1	99
229	2	1	3	0	144	10	1	99
230	2	1	3	0	145	10	1	99
231	2	1	3	0	199	10	1	99
232	2	1	3	0	230	10	1	99
233	2	1	3	0	360	10	1	99
234	2	1	3	0	530	10	1	99
235	2	1	3	0	540	10	1	99
236	2	1	3	0	834	30	1	99
237	2	1	3	0	894	30	1	99
238	2	1	4	0	111	10	1	99
239	2	1	4	0	113	10	1	99
240	2	1	4	0	114	10	1	99
241	2	1	4	0	134	10	1	99
242	2	1	4	0	144	10	1	99
243	2	1	4	0	191	10	1	99
244	2	1	4	0	210	10	1	99
245	2	1	4	0	230	10	1	99
246	2	1	4	0	240	10	1	99
247	2	1	4	0	250	10	1	99
248	2	1	4	0	280	10	1	99
249	2	1	4	0	834	30	1	99
250	2	1	4	0	894	30	1	99
251	2	1	5	0	210	10	1	99
252	2	1	5	0	260	10	1	99
253	2	1	5	0	280	10	1	99
254	2	1	5	0	290	10	1	99
255	2	1	5	0	540	10	1	99
256	2	1	6	0	111	10	1	99
257	2	1	6	0	114	10	1	99
258	2	1	6	0	123	10	1	0
259	2	1	6	0	134	10	1	0
260	2	1	6	0	230	10	1	0
261	2	1	6	0	530	10	1	0
262	2	1	6	0	540	10	1	0
263	2	1	6	0	834	30	1	0
264	2	1	6	0	894	30	1	0
265	2	1	7	0	111	10	1	99
266	2	1	7	0	113	10	1	99
267	2	1	7	0	114	10	1	99
268	2	1	7	0	134	10	1	99
269	2	1	7	0	230	10	1	99
270	2	1	7	0	834	30	1	99
271	2	1	7	0	894	30	1	99
272	2	1	8	0	111	10	1	0
273	2	1	8	0	111	10	1	1
274	2	1	8	0	111	10	1	2
275	2	1	8	0	111	10	1	3
276	2	1	8	0	111	10	1	4
277	2	1	8	0	111	10	1	5
278	2	1	8	0	111	10	1	6
279	2	1	8	0	111	10	1	7
280	2	1	8	0	111	10	1	8
281	2	1	8	0	111	10	1	9
282	2	1	8	0	111	10	1	10
283	2	1	8	0	111	10	1	11
284	2	1	8	0	111	10	1	12
285	2	1	8	0	111	10	1	13
286	2	1	8	0	111	10	1	14
287	2	1	8	0	111	10	1	15
288	2	1	8	0	111	10	1	16
289	2	1	8	0	111	10	1	17
290	2	1	8	0	111	10	1	99
291	2	1	8	0	114	10	1	0
292	2	1	8	0	114	10	1	1
293	2	1	8	0	114	10	1	2
294	2	1	8	0	114	10	1	3
295	2	1	8	0	114	10	1	4
296	2	1	8	0	114	10	1	5
297	2	1	8	0	114	10	1	6
298	2	1	8	0	114	10	1	7
299	2	1	8	0	114	10	1	8
300	2	1	8	0	114	10	1	9
301	2	1	8	0	114	10	1	10
302	2	1	8	0	114	10	1	11
303	2	1	8	0	114	10	1	12
304	2	1	8	0	114	10	1	13
305	2	1	8	0	114	10	1	14
306	2	1	8	0	114	10	1	15
307	2	1	8	0	114	10	1	16
308	2	1	8	0	114	10	1	17
309	2	1	8	0	114	10	1	99
310	2	1	8	0	123	10	1	99
311	2	1	8	0	125	10	1	99
312	2	1	8	0	134	10	1	99
313	2	1	8	0	144	10	1	99
314	2	1	8	0	145	10	1	99
315	2	1	8	0	199	10	1	99
316	2	1	8	0	220	10	1	99
317	2	1	8	0	230	10	1	99
318	2	1	8	0	240	10	1	99
319	2	1	8	0	260	10	1	99
320	2	1	8	0	280	10	1	99
321	2	1	8	0	330	10	1	99
322	2	1	8	0	340	10	1	99
323	2	1	8	0	360	10	1	99
324	2	1	8	0	520	10	1	99
325	2	1	8	0	540	10	1	99
326	2	1	8	0	834	30	1	99
327	2	1	8	0	847	10	1	99
328	2	1	8	0	894	30	1	99
329	2	1	9	0	111	10	1	1
330	2	1	9	0	111	10	1	4
331	2	1	9	0	111	10	1	7
332	2	1	9	0	111	10	1	10
333	2	1	9	0	111	10	1	11
334	2	1	9	0	111	10	1	12
335	2	1	9	0	111	10	1	13
336	2	1	9	0	111	10	1	99
337	2	1	9	0	113	10	1	1
338	2	1	9	0	113	10	1	4
339	2	1	9	0	113	10	1	7
340	2	1	9	0	113	10	1	10
341	2	1	9	0	113	10	1	11
342	2	1	9	0	113	10	1	12
343	2	1	9	0	113	10	1	13
344	2	1	9	0	114	10	1	1
345	2	1	9	0	114	10	1	4
346	2	1	9	0	114	10	1	7
347	2	1	9	0	114	10	1	10
348	2	1	9	0	114	10	1	11
349	2	1	9	0	114	10	1	12
350	2	1	9	0	114	10	1	13
351	2	1	9	0	114	10	1	99
352	2	1	9	0	134	10	1	99
353	2	1	9	0	834	30	1	99
354	2	1	9	0	894	30	1	99
355	2	1	10	0	111	10	1	99
356	2	1	10	0	113	10	1	99
357	2	1	10	0	114	10	1	99
358	2	1	10	0	123	10	1	99
359	2	1	10	0	125	10	1	99
360	2	1	10	0	134	10	1	99
361	2	1	10	0	145	10	1	99
362	2	1	10	0	191	10	1	99
363	2	1	10	0	199	10	1	99
364	2	1	10	0	210	10	1	99
365	2	1	10	0	230	10	1	99
366	2	1	10	0	240	10	1	99
367	2	1	10	0	280	10	1	99
368	2	1	10	0	330	10	1	99
369	2	1	10	0	360	10	1	99
370	2	1	10	0	540	10	1	99
371	2	1	10	0	834	10	1	99
372	2	1	11	0	111	10	1	99
373	2	1	11	0	113	10	1	99
374	2	1	11	0	114	10	1	99
375	2	1	11	0	123	10	1	99
376	2	1	11	0	125	10	1	99
377	2	1	11	0	191	10	1	99
378	2	1	11	0	199	10	1	99
379	2	1	11	0	210	10	1	99
380	2	1	11	0	290	10	1	99
381	2	1	11	0	340	10	1	99
382	2	1	11	0	360	10	1	99
383	2	1	11	0	540	10	1	99
384	2	1	14	0	123	10	1	99
385	2	1	14	0	125	10	1	99
386	2	1	14	0	145	30	302	99
387	2	1	14	0	240	10	1	99
388	2	1	14	0	280	30	302	99
389	2	1	14	0	340	10	1	99
390	2	1	14	0	360	10	1	99
391	2	1	14	0	540	10	1	99
392	2	1	14	0	851	10	1	99
393	2	1	15	0	111	10	1	99
394	2	1	15	0	112	10	1	99
395	2	1	15	0	113	10	1	99
396	2	1	15	0	114	10	1	99
397	2	1	15	0	131	10	1	99
398	2	1	15	0	133	10	1	99
399	2	1	15	0	191	10	1	99
400	2	1	15	0	210	10	1	99
401	2	1	15	0	230	10	1	99
402	2	1	15	0	260	10	1	99
403	2	1	15	0	290	10	1	99
404	2	1	15	0	330	10	1	99
405	2	1	15	0	340	10	1	99
406	2	1	15	0	360	10	1	99
407	2	1	15	0	530	10	1	99
408	2	1	15	0	540	10	1	99
409	3	1	0	1	123	10	1	99
410	3	1	0	1	125	10	1	99
411	3	1	0	1	137	10	1	99
412	3	1	0	1	137	20	401	99
413	3	1	0	1	141	10	1	99
414	3	1	0	1	141	20	401	99
415	3	1	0	1	144	10	1	99
416	3	1	0	1	145	10	1	99
417	3	1	0	1	145	20	401	99
418	3	1	0	1	230	10	1	99
419	3	1	0	1	230	20	401	99
420	3	1	0	1	240	10	1	99
421	3	1	0	1	240	20	401	99
422	3	1	0	1	250	10	1	99
423	3	1	0	1	260	10	1	99
424	3	1	0	1	260	20	401	99
425	3	1	0	1	280	10	1	99
426	3	1	0	1	280	20	401	99
427	3	1	0	1	290	10	1	99
428	3	1	0	1	290	20	401	99
429	3	1	0	1	330	10	1	99
430	3	1	0	1	330	20	401	99
431	3	1	0	1	340	10	1	99
432	3	1	0	1	340	20	401	99
433	3	1	0	1	350	10	1	99
434	3	1	0	1	360	20	401	99
435	3	1	0	1	390	10	1	99
436	3	1	0	1	390	20	401	99
437	3	1	0	1	520	20	401	99
438	3	1	0	1	530	10	1	99
439	3	1	0	1	530	20	401	99
440	3	1	0	1	540	10	1	99
441	3	1	0	1	540	20	401	99
442	3	1	0	1	570	10	1	99
443	3	1	0	1	570	20	401	99
444	3	1	0	1	834	20	401	99
445	3	1	0	1	847	20	401	99
446	3	1	0	1	852	20	401	99
447	3	1	0	1	881	20	401	99
448	3	1	0	1	894	20	401	99
449	3	1	0	1	960	10	1	99
450	3	1	0	1	960	20	401	99
451	3	1	0	2	520	30	513	99
452	3	1	0	2	530	30	513	99
453	3	1	0	2	540	30	513	99
454	3	1	0	3	141	30	76	99
455	3	1	0	3	144	30	76	99
456	3	1	0	3	145	30	76	99
457	3	1	0	3	220	30	76	99
458	3	1	0	3	230	30	76	99
459	3	1	0	3	260	30	76	99
460	3	1	0	3	330	30	76	99
461	3	1	0	3	340	30	76	99
462	3	1	0	3	350	30	76	99
463	3	1	0	3	360	30	76	99
464	3	1	0	3	520	30	76	99
465	3	1	0	3	530	30	76	99
466	3	1	0	3	540	30	76	99
467	3	1	0	3	848	30	76	99
468	3	1	0	3	853	30	76	99
469	3	1	0	4	230	30	76	99
470	3	1	0	4	260	30	76	99
471	3	1	0	4	360	30	76	99
472	3	1	0	4	520	30	76	99
473	3	1	0	5	141	30	76	99
474	3	1	0	5	145	30	76	99
475	3	1	0	5	230	30	76	99
476	3	1	0	5	240	30	76	99
477	3	1	0	5	260	30	76	99
478	3	1	0	5	360	30	76	99
479	3	1	0	5	520	30	76	99
480	3	1	0	5	530	30	76	99
481	3	1	0	8	145	30	76	99
482	3	1	0	8	220	30	76	99
483	3	1	0	8	230	30	76	99
484	3	1	0	8	260	30	76	99
485	3	1	0	8	280	30	76	99
486	3	1	0	8	290	30	76	99
487	3	1	0	8	330	30	76	99
488	3	1	0	8	340	30	76	99
489	3	1	0	8	360	30	76	99
490	3	1	0	8	390	30	76	99
491	3	1	0	8	520	30	76	99
492	3	1	0	8	530	30	76	99
493	3	1	0	8	540	30	76	99
494	3	1	0	8	570	30	76	99
495	3	1	0	8	834	30	76	99
496	3	1	0	8	852	30	76	99
497	3	1	0	9	141	30	76	99
498	3	1	0	9	144	30	76	99
499	3	1	0	9	145	30	76	99
500	3	1	0	9	230	30	76	99
501	3	1	0	9	240	30	76	99
502	3	1	0	9	250	30	76	99
503	3	1	0	9	260	30	76	99
504	3	1	0	9	280	30	76	99
505	3	1	0	9	320	30	76	99
506	3	1	0	9	330	30	76	99
507	3	1	0	9	340	30	76	99
508	3	1	0	9	350	30	76	99
509	3	1	0	9	360	30	76	99
510	3	1	0	9	520	30	76	99
511	3	1	0	9	530	30	76	99
512	3	1	0	9	540	30	76	99
513	3	1	0	9	852	30	76	99
514	3	1	0	10	137	30	76	99
515	3	1	0	10	141	30	76	99
516	3	1	0	10	145	30	76	99
517	3	1	0	10	220	30	76	99
518	3	1	0	10	230	30	76	99
519	3	1	0	10	240	30	76	99
520	3	1	0	10	250	30	76	99
521	3	1	0	10	260	30	76	99
522	3	1	0	10	280	30	76	99
523	3	1	0	10	290	30	76	99
524	3	1	0	10	340	30	76	99
525	3	1	0	10	360	30	76	99
526	3	1	0	10	390	30	76	99
527	3	1	0	10	520	30	76	99
528	3	1	0	10	530	30	76	99
529	3	1	0	10	540	30	76	99
530	3	1	0	10	570	30	76	99
531	3	1	0	10	852	30	76	99
532	3	1	0	11	220	30	76	99
533	3	1	0	11	260	30	76	99
534	3	1	0	11	330	30	76	99
535	3	1	0	11	852	30	76	99
536	3	2	0	1	141	30	76	99
537	3	2	0	1	144	30	76	99
538	3	2	0	1	145	30	76	99
539	3	2	0	1	210	30	76	99
540	3	2	0	1	220	30	76	99
541	3	2	0	1	230	30	76	99
542	3	2	0	1	240	30	76	99
543	3	2	0	1	250	30	76	99
544	3	2	0	1	260	30	76	99
545	3	2	0	1	280	30	76	99
546	3	2	0	1	340	30	76	99
547	3	2	0	1	360	30	76	99
548	3	2	0	1	530	30	76	99
549	3	2	0	1	540	30	76	99
550	3	2	0	1	852	30	76	99
551	3	2	0	2	123	30	76	99
552	3	2	0	2	125	30	76	99
553	3	2	0	2	137	30	76	99
554	3	2	0	2	141	30	76	99
555	3	2	0	2	144	30	76	99
556	3	2	0	2	145	30	76	99
557	3	2	0	2	210	30	76	99
558	3	2	0	2	220	30	76	99
559	3	2	0	2	230	30	76	99
560	3	2	0	2	240	30	76	99
561	3	2	0	2	250	30	76	99
562	3	2	0	2	260	30	76	99
563	3	2	0	2	280	30	76	99
564	3	2	0	2	330	30	76	99
565	3	2	0	2	340	30	76	99
566	3	2	0	2	360	30	76	99
567	3	2	0	2	390	30	76	99
568	3	2	0	2	530	30	76	99
569	3	2	0	2	540	30	76	99
570	3	2	0	2	852	30	76	99
\.


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 222
-- Name: estructura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estructura_id_seq', 570, true);


--
-- TOC entry 2626 (class 0 OID 17339)
-- Dependencies: 187
-- Data for Name: funcionario_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcionario_categoria (id, categoria, descripcion) FROM stdin;
1	1	Funcionario
2	2	Jefe
3	3	Directores Generales
4	3	Directores
5	3	Asesores
6	3	Coordinadores
7	4	Viceministro
8	5	Ministro
9	5	Presidente de Ent Desc
\.


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 188
-- Name: funcionario_clasificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_clasificacion_id_seq', 9, true);


--
-- TOC entry 2628 (class 0 OID 17347)
-- Dependencies: 189
-- Data for Name: ingresos_certificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ingresos_certificacion (id, plan_id, direccion, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, pf10, pf11, pf12) FROM stdin;
43	241	5	0	0	30000000	16000000	11000000	0	0	0	0	0	0	0
44	241	6	0	0	10000000	5000000	8000000	0	0	0	0	0	0	0
29	253	8	0	0	90000000	135000000	126000000	0	0	0	0	0	0	0
30	254	8	0	0	10000000	15000000	14000000	0	0	0	0	0	0	0
31	267	9	0	0	180000000	135000000	180000000	0	0	0	0	0	0	0
32	268	9	0	0	20000000	15000000	20000000	0	0	0	0	0	0	0
33	274	10	0	0	450000000	675000000	1125000000	0	0	0	0	0	0	0
34	275	10	0	0	50000000	75000000	125000000	0	0	0	0	0	0	0
35	330	7	0	0	270000000	459000000	729000000	0	0	0	0	0	0	0
36	331	7	0	0	30000000	51000000	81000000	0	0	0	0	0	0	0
40	240	5	0	0	270000000	215820000	201320000	0	0	0	0	0	0	0
41	240	6	0	0	90000000	45000000	72000000	0	0	0	0	0	0	0
42	241	4	0	0	53000000	22000000	44000000	0	0	0	0	0	0	0
37	365	11	0	0	180000000	203100000	230600000	0	0	0	0	0	0	0
38	366	11	0	0	20000000	5000000	10000000	0	0	0	0	0	0	0
23	68	1	0	0	720000000	710050000	960938962	908738962	0	0	0	0	0	0
25	68	3	0	0	200000000	290000000	269390000	359390000	0	0	0	0	0	0
24	68	2	0	0	90000000	135000000	180000000	225000000	0	0	0	0	0	0
26	75	1	0	0	80000000	82950000	110826551	105026551	0	0	0	0	0	0
27	75	2	0	0	10000000	15000000	20000000	25000000	0	0	0	0	0	0
28	75	3	0	0	30000000	40000000	37710000	47710000	0	0	0	0	0	0
39	240	4	0	0	477000000	200000000	400000000	82500000	0	0	0	0	0	0
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 190
-- Name: ingresos_certificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ingresos_certificacion_id_seq', 44, true);


--
-- TOC entry 2630 (class 0 OID 17364)
-- Dependencies: 191
-- Data for Name: ingresos_ejecucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ingresos_ejecucion (id, plan_id, direccion, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, pf10, pf11, pf12) FROM stdin;
6	67	1	8000	22000	14000	31000	8000	0	0	0	0	0	0	0
13	240	4	0	0	477000000	0	0	0	0	0	0	0	0	0
16	241	4	0	0	53000000	0	0	0	0	0	0	0	0	0
14	240	5	0	0	99180000	14500000	66770000	0	0	0	0	0	0	0
15	240	6	0	0	90000000	0	72000000	0	0	0	0	0	0	0
17	241	5	0	0	19000000	5000000	11000000	0	0	0	0	0	0	0
18	241	6	0	0	10000000	0	8000000	0	0	0	0	0	0	0
19	253	8	0	0	0	54000000	0	0	0	0	0	0	0	0
20	254	8	0	0	0	6000000	0	0	0	0	0	0	0	0
21	267	9	0	0	90000000	0	108000000	0	0	0	0	0	0	0
22	268	9	0	0	10000000	0	12000000	0	0	0	0	0	0	0
23	274	10	0	0	225000000	0	198000000	0	0	0	0	0	0	0
24	275	10	0	0	25000000	0	22000000	0	0	0	0	0	0	0
25	330	7	0	0	81000000	0	0	0	0	0	0	0	0	0
26	331	7	0	0	9000000	0	0	0	0	0	0	0	0	0
27	365	11	0	0	21900000	17500000	15000000	0	0	0	0	0	0	0
28	366	11	0	0	20000000	0	5000000	0	0	0	0	0	0	0
7	68	1	0	0	369950000	109111038	412200000	90460000	0	0	0	0	0	0
9	68	2	0	0	0	0	0	0	0	0	0	0	0	0
8	68	3	0	0	0	110610000	0	0	0	0	0	0	0	0
10	75	1	0	0	37050000	12123449	45800000	7940000	0	0	0	0	0	0
12	75	2	0	0	0	0	0	0	0	0	0	0	0	0
11	75	3	0	0	0	12290000	0	0	0	0	0	0	0	0
\.


--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 192
-- Name: ingresos_ejecucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ingresos_ejecucion_id_seq', 28, true);


--
-- TOC entry 2632 (class 0 OID 17381)
-- Dependencies: 193
-- Data for Name: llamados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY llamados (id, cc, llamado, monto, pac) FROM stdin;
167	\N	ADQUISICIÓN DE INMUEBLE	112000000	306025
168	\N	ADQUISICIÓN DE KITS ESCOLAR – 2017	493382142	321182
169	\N	SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018	2149513841	321183
170	\N	ADQUISICIÓN DE MUEBLES DE OFICINA	181433273	321184
171	\N	CONSTRUCCIÓN DE AULAS PARA EDUCACIÓN INICIAL	3190180773	321185
172	\N	LOCACIÓN DE INMUEBLES DETERMINADO	1739000000	321293
173	\N	ADQUISICIÓN DE LIBROS DE TEXTOS Y GUÍAS DIDACTICAS	59455000000	321306
174	\N	ALQUILER DE EDIFICIO PARA EL COLEGIO NACIONAL DR. VICEPRESIDENTE SANCHEZ	176000000	321347
175	\N	ALQUILER DE OFICINA PARA DEPENDENCIAS DE LA DIRECCIÓN GENERAL DE GESTIÓN DE TALENTO HUMANO	130000000	321348
176	\N	ALQUILER DE INMUEBLE PARA LA COORDINACIÓN DEL DPTO.DE CAAGUAZÚ, EDIFICIO PARA EL CONAMU (SEDE ITAUGUA) Y EDIFICIO PARA LA ESCUELA NIÑO JESUS DE AMPARO DE LA CIUDAD DE ASUNCIÓN	1113000000	321354
177	\N	ADQUISICIÓN DE DESAYUNO Y MERIENDA ESCOLAR	23958062080	321410
178	\N	IMPRESIÓN DE PRUEBAS EN EL MARCO DEL CONCURSO PÚBLICO DE OPOSICIÓN 2017	158871393	321419
179	\N	REPARACIÓN DE LA INFRAESTRUCTURA DEL CENTRO PARAGUAYO DE EDUCACIÓN PERMANENTE KO´E PYAHU	139142937	321445
180	\N	ADQUISICIÓN DE PÓLIZAS DE SEGUROS PARA VEHÍCULOS DEL MEC	238742195	321702
181	\N	ADQUISICIÓN DE PASAJES AÉREOS	1000000000	322308
182	\N	SERVICIOS GASTRONÓMICOS	474600000	16
183	\N	SERVICIO DE GESTIÓN Y ORGANIZACIÓN DE EVENTOS	1000000000	17
184	\N	ADQUISICIÓN DE BANDERAS	120000000	18
185	\N	ADQUISICIÓN DE PAPEL, CARTÓN E IMPRESOS	1000000000	19
186	\N	ADQUISICIÓN DE ÚTILES DE OFICINA	700000000	20
187	\N	AMPLIACIÓN Y REPARACIÓN DE LOCALES ESCOLARES Y OFICINAS	1846108273049	21
188	\N	ADQUISICIÓN DE MOBILIARIO ESCOLAR	96701540000	22
189	\N	ADQUISICIÓN DE BIBLIOTECA ESCOLAR	3559819725	23
190	\N	ADQUISICIÓN DE EQUIPOS INFORMÁTICOS	1000000000	24
191	\N	IMPRESIÓN DE CARTONES DE TÍTULOS	633000000	25
192	\N	ADQUISICIÓN DE ETIQUETAS HOLOGRÁFICAS DE SEGURIDAD	963500000	26
193	\N	SERVICIOS DE ESCRIBANÍA	200000000	27
194	\N	ADQUISICIÓN DE EQUIPOS DE SEGURIDAD	50000000	28
195	\N	CONSULTORÍA PARA LA EVALUACIÓN EXTERNA DE INSTITUCIONES FORMADORAS DE DOCENTES DE GESTIÓN PRIVADA	216000000	29
196	\N	SERVICIO DE IMPRESIONES VARIAS	2253500000	30
197	\N	IMPRESIÓN DE MANUALES	1175000000	31
198	\N	ADQUISICIÓN DE ARTÍCULOS DE LIMPIEZA	300000000	32
199	\N	ADQUISICIÓN DE MATERIALES DE FERRETERIA	1000000000	33
200	\N	ADQUISICIÓN DE TINTAS Y TONER	1000000000	34
201	\N	ADQUISICIÓN DE EQUIPOS DE OFICINA	583736000	35
202	\N	ADQUISICIÓN DE MUEBLES DE OFICINA 	1200000000	36
203	\N	MANT. Y REPARACIÓN DE FOTOCOPIADORAS	3600000	37
204	\N	REPARACIONES MENORES DE INFRAESTRUTURA	299319360	38
205	\N	ADQ. DE EQUIPOS RECREATIVOS	425019000	39
206	\N	ADQ. DE ACONDICIONADORES DE AIRE	500000000	40
207	\N	ADQUISICIÓN DE ENSERES	100000000	41
208	\N	PROVISIÓN DE AGUA MINERAL EN BIDONES	120000000	42
209	\N	ADQUISICIÓN DE LECTOR ÓPTICO	36000000	43
210	\N	ADQUISICIÓN DE LABORATORIO MÓVILES DE INFORMÁTICA	150000000	44
211	\N	ADQUISICIÓN  DE VEHÍCULOS	360000000	45
212	\N	ADQUISICIÓN DE CUBIERTAS	204645000	46
213	\N	ADQUISICIÓN DE BATERÍAS	175200000	47
214	\N	ADQUISICIÓN DE EXTINTORES	45251625	48
215	\N	SERVICIO DE MANTENIMIENTO Y REPARACIÓN DE ASCENSORES	149740000	49
216	\N	ADQUISICIÓN DE INSUMOS PARA TALLER DE IMPRENTA	62675000	50
217	\N	SERVICIO DE MANTENIMIENTO Y REPARACIÓN DE MÁQUINAS DE IMPRENTA	250000000	51
218	\N	CONSULTORÍA PARA LA REFORMA DE LA MALLA CURRICULAR DE 25 ESPECIALIDADES DEL BT Y FP	1000000000	52
219	\N	CONSULTORÍA DE PROFESIONALIZACIÓN DOCENTE	120000000	53
220	\N	CONSULTORÍA PARA EL DISEÑO DE UNA POLÍTICA PÚBLICA PAR LA ETP DEL PY	5605000000	54
221	\N	CONSULTORÍA PAR LA INSTALACIÓN DE CENTROS EDUCATIVOS DE ALTO RENDIMIENTO CEAR	1200000000	55
222	\N	CONSULTORÍA PARA EL DISEÑO, DIAGRAMA E IMPRESIÓN DE MATERIALES	150000000	56
223	\N	CONSULTORÍA PARA LA INSTALACIÓN DE CINCO MESAS INTERSECTORIALES DEPARTAMENTALES	250000000	57
224	\N	CONSULTORÍA PARA EL PROGRAMA DE ARTICULACIÓN EDUCACIÓN – TRABAJO	50000000	58
225	\N	CONSULTORÍA PARA CATÁLOGOS DE TÍTULOS Y CERTIFICACIÓN DE LA ETP	250000000	59
226	\N	MANTENIMINETO DE DATACENTER	480000000	60
227	\N	CONSULTORÍA PARA EL DESARROLLO  DE UN CENTRO DE GESTIÓN WEB PARA EL SEGUIMIENTO A LA IMPLEMENTACIÓN DEL MECIP	50000000	61
\.


--
-- TOC entry 2762 (class 0 OID 0)
-- Dependencies: 194
-- Name: llamados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('llamados_id_seq', 227, true);


--
-- TOC entry 2634 (class 0 OID 17390)
-- Dependencies: 195
-- Data for Name: meses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meses (mes, descripcion) FROM stdin;
1	Enero 
2	Febrero
3	Marzo
4	Abril
5	Mayo
6	Junio
7	Julio
8	Agosto
9	Septiembre
10	Octubre
11	Noviembre 
12	Diciembre
\.


--
-- TOC entry 2673 (class 0 OID 34148)
-- Dependencies: 235
-- Data for Name: objetos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY objetos (obj, descripcion) FROM stdin;
111	Sueldos
112	Dietas
113	Gastos de Representacion
114	Aguinaldo
123	Remuneracion Extraordinaria
125	Remuneracion Adicional
131	Subsidio Familiar
132	Escalafon Docente
133	Bonificaciones y Gratificaciones
134	Aporte Jubilatorio del Empleador
137	Gratificaciones por Servicios Especiales
141	Contratacion de Personal Técnico
143	Contratacion Ocasional del Personal Docente 
144	Jornales
145	Honorarios Profesionales
191	Subsidio para la Salud
199	Otros Gastos de Personal
210	Servicios Basicos
220	Transporte y Almacenaje 
230	Pasajes y Viaticos
240	Gastos por Servicios de Aseo, de Mantenimiento y Reparacion
250	Alquileres y Derechos
260	Servicios Técnicos y Profesionales
280	Otros Servicios en General
290	Servicios de Capacitacion y Adiestramiento
320	Textiles y Vestuarios 
330	Productos de Papel, Carton e Impresos
340	Bienes de Consumo de Oficinas e Insumos
350	Productos e Instrum. Quimicos y Medicinales 
360	Combustibles y Lubricantes
390	Otros Bienes de Consumo
510	Adquisicion de Inmuebles
520	Construcciones
530	Adquisiciones de Maquinarias, Equipos y Herramientas Mayores
540	Adquisiciones de Equipos de Oficina y Computacion
570	Adquisicion de Activos Intangibles
834	Otras Transferencias al Sector Publico
841	Becas 
845	Indemnizaciones 
847	Aportes de Programas de Inversion Publica
848	Transf. para Complemento Nutricional en Escuelas Publicas
851	Transferencias Corrientes al Sector Externo 
852	Transferencias Ctes. a Ent. del Sector Privado, Academico y/o Pub. del Exterior
853	Transferencias Corrientes a Organismos y Agencias Especializadas
881	Transferencias de Capital al Sector Externo 
894	Otras Transferencias al Sector Publico
910	Pago de Impuestos, Tasas y Gastos Judiciales
960	Deudas Pendientes de Pago de Gastos Corrientes de Ejercicios Anteriores
811	811
861	861
891	Otras Transferencias al sector publico privado
\.


--
-- TOC entry 2635 (class 0 OID 17396)
-- Dependencies: 196
-- Data for Name: pais_ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pais_ciudad (id, pais, ciudad, c1, c2, c3, c4, c5) FROM stdin;
1	Afghanistan (Afghani)	Kabul	162	178	194	211	243
2	Albania (Albania Lek(e))	Tirana	188	207	226	244	282
3	Albania (Albania Lek(e))	Durres (Adriatic)	117	129	140	152	176
4	Algeria (Algerian Dinar)	Algiers	218	240	262	283	327
5	American Samoa (US Dollar)	Cualquier Ciudad	238	262	286	309	357
6	Angola (Kwanza)	Luanda	400	440	480	520	600
7	Anguilla (E.C. Dollar)	Cualquier Ciudad (15 Dic. - 14 Abr.)	448	493	538	582	672
8	Anguilla (E.C. Dollar)	Cualquier Ciudad (15 Abr. - 14 Dic.)	341	375	409	443	512
9	Antigua (E.C. Dollar)	Cualquier Ciudad (1 Abr. - 30 Nov.)	337	371	404	438	506
10	Antigua (E.C. Dollar)	Cualquier Ciudad (1 Dic. - 31 Mar.)	359	395	431	467	539
11	Argentina (Argentine Peso)	Buenos Aires	280	308	336	364	420
12	Argentina (Argentine Peso)	Bariloche	280	308	336	364	420
13	Argentina (Argentine Peso)	Mendoza y Neuquen	233	256	280	303	350
14	Armenia (Armenian Dram)	Yerevan	161	177	193	209	242
15	Aruba (N.A. Gulder)	Cualquier Ciudad (15 Abr. - 15 Dic.)	324	356	389	421	486
16	Aruba (N.A. Gulder)	Cualquier Ciudad (16 Dic. - 14 Abr.)	420	462	504	546	630
17	Australia (AUL Dollar)	Canberra, Melbourne & Sydney	263	289	316	342	395
18	Austria (Euro)	Cualquier Ciudad	268	295	322	348	402
19	Azerbaijan ((nex) Azerbaijan Manat)	Baku	176	194	211	229	264
20	Bahamas (Bahamian Dollar)	Cualquier Ciudad (20 Dic.-20 Abr.)	447	492	536	581	671
21	Bahamas (Bahamian Dollar)	Cualquier Ciudad (21 Abr.-19 Dic.)	434	477	521	564	651
22	Bahrain (Bahraini Dinar)	Manama	316	348	379	411	474
23	Bangladesh (Bangladesh Taka)	Dhaka	136	150	163	177	204
24	Bangladesh (Bangladesh Taka)	Chittagong (Agrabad and Peninsula)	120	132	144	156	180
25	Barbados (Barbados Dollar)	Cualquier Ciudad (16 Abr. - 15 Dic.)	395	435	474	514	593
26	Barbados (Barbados Dollar)	Cualquier Ciudad (16 Dic. - 15 Abr.)	465	512	558	605	698
27	Belarus (New Belarusian Ruble)	Minsk	220	242	264	286	330
28	Belgium (Euro)	Cualquier Ciudad	325	358	390	423	488
29	Belize (Belize Dollar)	Belize City	250	275	300	325	375
30	Benin (CFA Franc(XOF))	Cotonou	130	143	156	169	195
31	Bermuda (Bermuda Dollar)	Cualquier Ciudad (01 Dic. - 14 Mar.)	459	505	551	597	689
32	Bermuda (Bermuda Dollar)	Cualquier Ciudad (15 Mar. - 30 Nov.)	510	561	612	663	765
33	Bhutan (Bhutan Ngultrum)	Thimphu	121	133	145	157	182
34	Bolivia (Boliviano)	La Paz	186	205	223	242	279
35	Bolivia (Boliviano)	Cochabamba	119	131	143	155	179
36	Bolivia (Boliviano)	Santa Cruz	179	197	215	233	269
37	Bosnia and Herzegovina (Convertible Mark)	Sarajevo	168	185	202	218	252
38	Botswana (Botswana Pula)	Gaborone	268	295	322	348	402
39	Brazil (Brazilian Real)	Brasilia	184	202	221	239	276
40	Brazil (Brazilian Real)	Cuiaba	143	157	172	186	215
41	Brazil (Brazilian Real)	Curitiba	135	149	162	176	203
42	Brazil (Brazilian Real)	Porto Allegre	125	138	150	163	188
43	Brazil (Brazilian Real)	Recife	143	157	172	186	215
44	Brazil (Brazilian Real)	Rio De Janeiro	233	256	280	303	350
45	Brazil (Brazilian Real)	Sao Paulo	218	240	262	283	327
46	British Virgin Islands (US Dollar)	Cualquier Ciudad (15 Dic. - 15 Abr.)	375	413	450	488	563
47	British Virgin Islands (US Dollar)	Cualquier Ciudad (16 Abr. -14 Dic.)	348	383	418	452	522
48	Brunei (Brunei Dollar)	Cualquier Ciudad	170	187	204	221	255
49	Bulgaria (New Lev)	Sofia	168	185	202	218	252
50	Bulgaria (New Lev)	Burgas, Plovdiv, Stara Zagora, Varna	100	110	120	130	150
51	Burkina Faso (CFA Franc(XOF))	Ouagadougou	168	185	202	218	252
52	Burkina Faso (CFA Franc(XOF))	Bobo-Dioulasso	125	138	150	163	188
53	Burundi (Burundi Franc)	Bujumbura	248	273	298	322	372
54	Cambodia (Cambodian Riel)	Phnom Penh	125	138	150	163	188
55	Cambodia (Cambodian Riel)	Siem Reap	92	101	110	120	138
56	Cameroon (CFA Franc(XAF))	Yaounde	180	198	216	234	270
57	Canada (Canadian Dollar)	Ottawa	315	347	378	410	473
58	Canada (Canadian Dollar)	Montreal	271	298	325	352	407
59	Canada (Canadian Dollar)	Toronto	321	353	385	417	482
60	Canada (Canadian Dollar)	Vancouver	329	362	395	428	494
61	Canary Islands (Euro)	Cualquier Ciudad	169	186	203	220	254
62	Cape Verde (CV Escudo)	Praia	190	209	228	247	285
63	Cayman Islands (CaymanI. Dollar)	Cualquier Ciudad (1 Dic. - 30 Abr.)	388	427	466	504	582
64	Cayman Islands (CaymanI. Dollar)	Cualquier Ciudad (1 May - 30 Nov.)	307	338	368	399	461
65	Central African Rep. (CFA Franc)	Bangui	171	188	205	222	257
66	Chad (CFA Franc)	Ndjamena	164	180	197	213	246
67	Chile (Chilean Peso)	Santiago	256	282	307	333	384
68	Chile (Chilean Peso)	Cualquier Ciudad	216	238	259	281	324
69	China (Renminbi)	Beijing	230	253	276	299	345
70	China (Renminbi)	Chengdu	218	240	262	283	327
71	China (Renminbi)	Shanghai	239	263	287	311	359
72	China (Renminbi)	Xiamen	182	200	218	237	273
73	China, Hong Kong SAR (HongKong Dollar)	Hong Kong	375	413	450	488	563
74	China, Macau (Pataca)	Macau	243	267	292	316	365
75	Colombia (Colombian Peso)	Bogota	159	175	191	207	239
76	Colombia (Colombian Peso)	Cali	126	139	151	164	189
77	Colombia (Colombian Peso)	Cartagena	144	158	173	187	216
78	Colombia (Colombian Peso)	Medellin	120	132	144	156	180
79	Colombia (Colombian Peso)	San Andres	100	110	120	130	150
80	Colombia (Colombian Peso)	Santa Marta	109	120	131	142	164
81	Comoros (Comoros Franc)	Moroni	203	223	244	264	305
82	Congo (CFA Franc)	Brazzaville	257	283	308	334	386
83	Congo, Dem. Rep. (Franc Congolais)	Kinshasa	283	311	340	368	425
84	Congo, Dem. Rep. (Franc Congolais)	Goma	205	226	246	267	308
85	Cook Islands (NZE Dollar)	Rarotonga	314	345	377	408	471
86	Costa Rica (COS Colon)	San Jose	212	233	254	276	318
87	Cote d Ivoire (CFA Franc(XOF))	Abidjan	171	188	205	222	257
88	Croatia, Republic of (Kuna)	Zagreb	175	193	210	228	263
89	Cuba (Cuban Peso)	Havana	237	261	284	308	356
90	Cuba (Cuban Peso)	Varadero	176	194	211	229	264
91	Curacao (N.A. Gulder)	Cualquier Ciudad (15 April - 15 December)	307	338	368	399	461
92	Curacao (N.A. Gulder)	Cualquier Ciudad (16 December - 14 April)	341	375	409	443	512
93	Cyprus (Euro)	Nicosia	161	177	193	209	242
94	Czech Republic (Czech Koruna)	Prague	251	276	301	326	377
95	Czech Republic (Czech Koruna)	Karlovy Vary	261	287	313	339	392
96	Denmark (Danish Krone)	Cualquier Ciudad	348	383	418	452	522
97	Djibouti (Djibouti Francs)	Djibouti	187	206	224	243	281
98	Djibouti (Djibouti Francs)	Tadjourah	124	136	149	161	186
99	Dominica (E.C. Dollar)	Cualquier Ciudad	344	378	413	447	516
100	Dominican Republic (Dominican Peso)	Santo Domingo	259	285	311	337	389
101	Ecuador (US Dollar)	Quito	243	267	292	316	365
102	Ecuador (US Dollar)	Guayaquil	252	277	302	328	378
103	Egypt (Egyptian Pound)	Cairo	282	310	338	367	423
104	El Salvador (ELS Colon)	San Salvador	230	253	276	299	345
105	Equatorial Guinea (CFA Franc(XAF))	Malabo	252	277	302	328	378
106	Eritrea (Nafka)	Asmara	240	264	288	312	360
107	Estonia (Euro)	Tallinn	226	249	271	294	339
108	Estonia (Euro)	Cualquier Ciudad	202	222	242	263	303
109	Ethiopia (Ethiopian Birr)	Addis Ababa	212	233	254	276	318
110	Fiji (Fiji Dollar)	Suva	244	268	293	317	366
111	Finland (Euro)	Helsinki	314	345	377	408	471
112	France (Euro)	Paris	333	366	400	433	500
113	France (Euro)	Cualquier Ciudad	279	307	335	363	419
114	Gabon (CFA Franc(XAF))	Libreville	330	363	396	429	495
115	Gambia (Gambian Dalasi)	Banjul	206	227	247	268	309
116	Georgia, Republic of (Georgian Lari)	Tbilisi	210	231	252	273	315
117	Germany (Euro)	Berlin	288	317	346	374	432
118	Germany (Euro)	Bonn	249	274	299	324	374
119	Germany (Euro)	Hamburg	290	319	348	377	435
120	Ghana (New Cedi)	Accra	398	438	478	517	597
121	Gibraltar (Gibraltar Pound)	Cualquier Ciudad	395	435	474	514	593
122	Greece (Euro)	Athens	248	273	298	322	372
123	Grenada (E.C. Dollar)	Cualquier Ciudad (15 Dic.-15 Abr.)	430	473	516	559	645
124	Grenada (E.C. Dollar)	Cualquier Ciudad (16 Abr.-14 Dic.)	367	404	440	477	551
125	Guam (US Dollar)	Cualquier Ciudad	382	420	458	497	573
126	Guatemala (Quetzal(es))	Guatemala City	185	204	222	241	278
127	Guatemala (Quetzal(es))	Antigua	213	234	256	277	320
128	Guinea (Guinean Franc)	Conakry	262	288	314	341	393
129	Guinea Bissau (CFA Franc(XOF))	Bissau	130	143	156	169	195
130	Guyana (Guyana Dollar)	Georgetown	235	259	282	306	353
131	Haiti (Gourde)	Port-Au-Prince	220	242	264	286	330
132	Haiti (Gourde)	Cote des Arcadins	206	227	247	268	309
133	Honduras (Lempira)	Tegucigalpa	206	227	247	268	309
134	Honduras (Lempira)	Roatan	233	256	280	303	350
135	Hungary (Forint)	Cualquier Ciudad	151	166	181	196	227
136	Iceland (Iceland Krona)	Cualquier Ciudad (May - Sept)	391	430	469	508	587
137	Iceland (Iceland Krona)	Cualquier Ciudad (Oct.- Abr.)	306	337	367	398	459
138	India (Indian Rupee)	New Delhi (Abr - Ago)	213	234	256	277	320
139	India (Indian Rupee)	New Delhi (Sept - Mar)	263	289	316	342	395
140	India (Indian Rupee)	Mumbai (Bombay)	258	284	310	335	387
141	Indonesia (Rupiah)	Jakarta	196	216	235	255	294
142	Iran (Iranian Rial)	Tehran 	213	234	256	277	320
143	Iraq (Iraqi Dinar)	Baghdad	275	303	330	358	413
144	Ireland (Euro)	Cualquier Ciudad	278	306	334	361	417
145	Israel (Shekel)	Tel Aviv	382	420	458	497	573
146	Israel (Shekel)	Jerusalem	282	310	338	367	423
147	Italy (Euro)	Rome	299	329	359	389	449
148	Italy (Euro)	Florence	228	251	274	296	342
149	Italy (Euro)	Milan	249	274	299	324	374
150	Jamaica (Jamaican Dollar)	Kingston	313	344	376	407	470
151	Japan (Yen)	Tokyo	271	298	325	352	407
152	Japan (Yen)	Kyoto	246	271	295	320	369
153	Japan (Yen)	Cualquier Ciudad	176	194	211	229	264
154	Jordan (Jordanian Dinar)	Amman	306	337	367	398	459
155	Jordan (Jordanian Dinar)	Jerusalem	282	310	338	367	423
156	Kazakhstan (Tenge)	Astana	177	195	212	230	266
157	Kazakhstan (Tenge)	Almaty	158	174	190	205	237
158	Kenya (Kenyan Shilling)	Nairobi	312	343	374	406	468
159	Kenya (Kenyan Shilling)	Mombasa	177	195	212	230	266
160	Kiribati (AUL Dollar)	Christmas Island	166	183	199	216	249
161	Kiribati (AUL Dollar)	Cualquier Ciudad	135	149	162	176	203
162	Korea, Dem. Peo. of (N. Korean Won)	Pyongyang	175	193	210	228	263
163	Korea, Republic of (S. Korean Won)	Seoul	400	440	480	520	600
164	Korea, Republic of (S. Korean Won)	Changwon	232	255	278	302	348
165	Kuwait (Kuwaiti Dinar)	Kuwait City	359	395	431	467	539
166	Kyrgyzstan (Som)	Bishkek	181	199	217	235	272
167	Lao Peo. Dem. Rep. (Kip)	Vientiane	175	193	210	228	263
168	Lao Peo. Dem. Rep. (Kip)	Latvia (Euro)	\N	\N	\N	\N	\N
169	Lao Peo. Dem. Rep. (Kip)	Riga	190	209	228	247	285
170	Lebanon (Lebanese Pound)	Beirut (Movenpick) 1 january - 14 june	314	345	377	408	471
171	Lebanon (Lebanese Pound)	Beirut (Movenpick) 15 june - 31 december	377	415	452	490	566
172	Lesotho (Loti)	Maseru	103	113	124	134	155
173	Lesotho (Loti)	Leribe	93	102	112	121	140
174	Liberia (Liberian Dollar)	Monrovia	265	292	318	345	398
175	Libya (Libyan Dinar)	Tripoli	216	238	259	281	324
176	Libya (Libyan Dinar)	Cualquier Ciudad	177	195	212	230	266
177	Libya (Libyan Dinar)	Lithuania (Euro)	\N	\N	\N	\N	\N
178	Libya (Libyan Dinar)	Vilnius	186	205	223	242	279
179	Luxembourg (Euro)	Cualquier Ciudad	290	319	348	377	435
180	Madagascar (Ariary (New Madagascar Franc))	Antananarivo	200	220	240	260	300
181	Malawi (Malawi Kwacha)	Lilongwe	186	205	223	242	279
182	Malaysia (Ringgit)	Kuala Lumpur	165	182	198	215	248
183	Malaysia (Ringgit)	Kota Kinabalu (Sabah)	127	140	152	165	191
184	Maldives (Rufiyaa)	Male	309	340	371	402	464
185	Mali (CFA Franc(COX))	Bamako	220	242	264	286	330
186	Malta (Euro)	Cualquier Ciudad	292	321	350	380	438
187	Marshall Islands (US Dollar)	Majuro	210	231	252	273	315
188	Marshall Islands (US Dollar)	Cualquier Ciudad	115	127	138	150	173
189	Mauritania (Ouguiya)	Nouakchott	154	169	185	200	231
190	Mauritius (Mauritius Rupee)	Port Louis/Mauritius	212	233	254	276	318
191	Mexico (Mexican Peso)	Mexico City	341	375	409	443	512
192	Micronesia, Fed States Of (US Dollar)	Kosrae	212	233	254	276	318
193	Moldova (Moldovan Leu)	Chisinau	147	162	176	191	221
194	Monaco (Euro)	Cualquier Ciudad	313	344	376	407	470
195	Mongolia (Mongo. Tugrik)	Ulaanbaatar	192	211	230	250	288
196	Montenegro (Euro)	Podgorica	140	154	168	182	210
197	Montserrat (E.C. Dollar)	Cualquier Ciudad	230	253	276	299	345
198	Morocco (Morocco Dirham)	Rabat	201	221	241	261	302
199	Mozambique (Metical (New))	Maputo	239	263	287	311	359
200	Mozambique (Metical (New))	Beira	142	156	170	185	213
201	Myanmar (Myanmar Kyat)	Yangon	134	147	161	174	201
202	Myanmar (Myanmar Kyat)	Nyaungoo-Bagan	195	215	234	254	293
203	Namibia (Namibia Dollar)	Windhoek	128	141	154	166	192
204	Nauru (AUL Dollar)	Cualquier Ciudad	171	188	205	222	257
205	Nepal (Nepalese Rupee)	Kathmandu	169	186	203	220	254
206	Netherlands (Euro)	Cualquier Ciudad	288	317	346	374	432
207	New Caledonia (CFP Franc)	Cualquier Ciudad	220	242	264	286	330
208	New Zealand (NZE Dollar)	Auckland, Christchurch, Wellington	323	355	388	420	485
209	Nicaragua (Cordoba Oro)	Managua	205	226	246	267	308
210	Niger (CFA Franc(XOF))	Niamey	171	188	205	222	257
211	Nigeria (Naira)	Abuja	140	154	168	182	210
212	Niue (NZE Dollar)	Cualquier Ciudad	233	256	280	303	350
213	Norway (Norwegian Krone)	Cualquier Ciudad	280	308	336	364	420
214	Oman (Rial Omani)	Muscat 	314	345	377	408	471
215	Pakistan (Pakistani Rupee)	Islamabad 	240	264	288	312	360
216	Palau (US Dollar)	Cualquier Ciudad	279	307	335	363	419
217	Panama (Balboa)	Panama City	244	268	293	317	366
218	Papua New Guinea (Kina)	Port Moresby	353	388	424	459	530
219	Papua New Guinea (Kina)	Cualquier Ciudad	148	163	178	192	222
220	Paraguay (Guarani)	Asunción	249	274	299	324	374
221	Paraguay (Guarani)	Cualquier Ciudad	111	122	133	144	167
222	Peru (Nuevo Sol)	Lima	240	264	288	312	360
223	Peru (Nuevo Sol)	Cuzco	196	216	235	255	294
224	Philippines (Philippine Peso)	Metro Manila	274	301	329	356	411
225	Poland (Poland Zloty)	Warsaw	287	316	344	373	431
226	Portugal (Euro)	Lisbon	229	252	275	298	344
227	Puerto Rico (US Dollar)	Cualquier Ciudad (20 Dic. - 30 Abr.)	421	463	505	547	632
228	Puerto Rico (US Dollar)	Cualquier Ciudad (1 May - 20 Dic.)	304	334	365	395	456
229	Qatar (Qatari Rial)	Doha	426	469	511	554	639
230	Romania (Leu (New))	Bucharest	226	249	271	294	339
231	Russian Federation (Russian Rouble)	Moscow	266	293	319	346	399
232	Russian Federation (Russian Rouble)	St. Petersburg	208	229	250	270	312
233	Rwanda (Rwanda Franc)	Kigali	208	229	250	270	312
234	Saint Maarten (N.A. Gulder)	Cualquier Ciudad (15 Abr.- 15 Dic.)	238	262	286	309	357
235	Saint Maarten (N.A. Gulder)	Cualquier Ciudad (16 Dic - 14 Abr.)	265	292	318	345	398
236	Samoa (Tala)	Apia, Upolu	143	157	172	186	215
237	Sao Tome and Principe (Dobra)	Sao Tome	134	147	161	174	201
238	Saudi Arabia (Saudi Riyal)	Riyadh	381	419	457	495	572
239	Saudi Arabia (Saudi Riyal)	Jeddah	280	308	336	364	420
240	Senegal (CFA Franc(XOF))	Dakar	242	266	290	315	363
241	Serbia (Dinar)	Belgrade	180	198	216	234	270
242	Seychelles (SEY Rupee)	Mahe Victoria	302	332	362	393	453
243	Sierra Leone (Leone)	Freetown	242	266	290	315	363
244	Singapore (SIN Dollar)	Cualquier Ciudad	372	409	446	484	558
245	Slovak Republic (Euro)	Bratislava	201	221	241	261	302
246	Slovenia, Republic of (Euro)	Lubljana	248	273	298	322	372
247	Slovenia, Republic of (Euro)	Portoroz	247	272	296	321	371
248	Solomon Islands (SOI Dollar)	Honiara	267	294	320	347	401
249	Solomon Islands (SOI Dollar)	Cualquier Ciudad	156	172	187	203	234
250	Somalia (Somali Shilling)	Mogadishu	201	221	241	261	302
251	South Africa (Rand)	Pretoria	166	183	199	216	249
252	South Africa (Rand)	Cualquier Ciudad	106	117	127	138	159
253	South Sudan, Republic of (Southern Sudanese Pound)	Juba 	221	243	265	287	332
254	Spain (Euro)	Madrid	255	281	306	332	383
255	Spain (Euro)	Barcelona	242	266	290	315	363
256	Spain (Euro)	Cualquier Ciudad	190	209	228	247	285
257	Sri Lanka (Sri Lanka Rupee)	Colombo	223	245	268	290	335
258	St. Kitts and Nevis (E.C. Dollar)	Cualquier Ciudad (15 Abr. - 14 Dic.)	363	399	436	472	545
259	St. Kitts and Nevis (E.C. Dollar)	Cualquier Ciudad (15 Dic - 14 Abr.)	456	502	547	593	684
260	St. Lucia (E.C. Dollar)	Cualquier Ciudad (15 Abr. - 14 Dic.)	300	330	360	390	450
261	St. Lucia (E.C. Dollar)	Cualquier Ciudad (15 Dic - 14 Abr.)	326	359	391	424	489
262	St.Vincent-Grenadines (E.C. Dollar)	Cualquier Ciudad (15 Abr. - 14 Dic.)	259	285	311	337	389
263	St.Vincent-Grenadines (E.C. Dollar)	Cualquier Ciudad (15 Dic - 14 Abr.)	278	306	334	361	417
264	Sudan (Sudanese Pound)	Khartoum	219	241	263	285	329
265	Sudan (Sudanese Pound)	Port Sudan	151	166	181	196	227
266	Suriname (Surinamese Dollar)	Paramaribo	184	202	221	239	276
267	Swaziland (Lilangeni)	Mbabane	158	174	190	205	237
268	Sweden (Swedish Krona)	Stockholm 	381	419	457	495	572
269	Sweden (Swedish Krona)	Cualquier Ciudad	273	300	328	355	410
270	Switzerland (Swiss Franc)	Cualquier Ciudad	361	397	433	469	542
271	Syrian Arab Republic (Syrian Pound)	Damascus	196	216	235	255	294
272	Tajikistan (Tajik Somoni)	Dushanbe	190	209	228	247	285
273	Tanzania, United Rep. Of (Schilling)	Dar es Salaam	223	245	268	290	335
274	Thailand (Thai Baht)	Bangkok	215	237	258	280	323
275	Thailand (Thai Baht)	Phuket	213	234	256	277	320
276	The Former Yugoslav Republic of Macedonia (Denar)	Skopje	167	184	200	217	251
277	Timor-Leste (US Dollar)	Dili	156	172	187	203	234
278	Togo (CFA Franc(XOF))	Lome	169	186	203	220	254
279	Tokelau (NZE Dollar)	Cualquier Ciudad	88	97	106	114	132
280	Tonga (Pa'anga)	Nuku'Alofa	196	216	235	255	294
281	Tonga (Pa'anga)	Vava'u	114	125	137	148	171
282	Trinidad and Tobago (TT Dollar)	Tobago (15 Apr.-15 Dec.)	337	371	404	438	506
283	Trinidad and Tobago (TT Dollar)	Tobago (16 Dec.-14 Apr.)	363	399	436	472	545
284	Tunisia (Tunisian Dinar)	Tunis	147	162	176	191	221
285	Turkey (New Turkish Lira)	Ankara	171	188	205	222	257
286	Turkmenistan (new Manat)	Ashgabat	249	274	299	324	374
287	Turks & Caicos Islands (US Dollar)	Grand Turk 	384	422	461	499	576
288	Tuvalu (AUL Dollar)	Cualquier Ciudad	203	223	244	264	305
289	Uganda (Uganda Shilling)	Kampala	216	238	259	281	324
290	Uganda (Uganda Shilling)	Entebbe	190	209	228	247	285
291	Ukraine (Hryvnia)	Kiev	213	234	256	277	320
292	Ukraine (Hryvnia)	Odessa	106	117	127	138	159
293	United Arab Emirates (U.A.E. Dirham)	Abu Dhabi	370	407	444	481	555
294	United Arab Emirates (U.A.E. Dirham)	Dubai	370	407	444	481	555
295	United Kingdom (U.K. Pound)	London	344	378	413	447	516
296	United Kingdom (U.K. Pound)	Cualquier Ciudad	306	337	367	398	459
297	Uruguay (Peso Uruguayo)	Montevideo	239	263	287	311	359
298	Uruguay (Peso Uruguayo)	Punta Del Este  (Dic-Mar)	495	545	594	644	743
299	Uruguay (Peso Uruguayo)	Punta Del Este (Abr-Nov)	232	255	278	302	348
300	USA (US Dollar)	Washington D.C.	363	399	436	472	545
301	USA (US Dollar)	Boston	389	428	467	506	584
302	USA (US Dollar)	Chicago	369	406	443	480	554
303	USA (US Dollar)	Los Angeles	362	398	434	471	543
304	USA (US Dollar)	Miami	343	377	412	446	515
305	USA (US Dollar)	New York 	385	424	462	501	578
306	USA (US Dollar)	Philadelphia	339	373	407	441	509
307	USA (US Dollar)	San Francisco	381	419	457	495	572
308	Uzbekistan (Uzbekistan Sum)	Tashkent	212	233	254	276	318
309	Vannuatu (Vatu)	Port Vila	261	287	313	339	392
310	Venezuela (Bolivar Fuerte)	Caracas	146	161	175	190	219
311	Venezuela (Bolivar Fuerte)	Isla de Margarita	108	119	130	140	162
312	Venezuela (Bolivar Fuerte)	La Guaira	146	161	175	190	219
313	Vietnam (VietNam Dong)	Hanoi	168	185	202	218	252
314	Vietnam (VietNam Dong)	Hoi An City	128	141	154	166	192
315	Virgin Islands (U.S.A) (US Dollar)	Cualquier Ciudad (1 May -14 Dic.)	381	419	457	495	572
316	Virgin Islands (U.S.A) (US Dollar)	Cualquier Ciudad (15 Dic. - 30 Abr.)	530	583	636	689	795
317	West Bank (Shekel)	Jericho Area	227	250	272	295	341
318	Western Sahara (Morocco Dirham)	Laayoune	133	146	160	173	200
319	Yemen, Republic of (Yemeni Rial)	Sana'a	150	165	180	195	225
320	Zambia (Zambian Kwacha (New))	Lusaka	208	229	250	270	312
321	Zimbabwe (Zimbabwe Dollar)	Harare	211	232	253	274	317
\.


--
-- TOC entry 2636 (class 0 OID 17402)
-- Dependencies: 197
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personas (persona, cedula, nombres) FROM stdin;
35	1828386	Maria Liz Palacios Duarte
36	1294291	Daniel A. Perez G.
37	1503949	Marìa del Carmen Gimènez Sivulec
38	659375	Ramona Florencia Celeste Mancuello de Roman
39	1194695	Cesar Augusto Martinez
40	555777	Nilsa Carmen Palacios Alvarenga
41	1856259	Zully Martina Llano Acosta
42	2210749	Josè Arce Farina
\.


--
-- TOC entry 2763 (class 0 OID 0)
-- Dependencies: 198
-- Name: personas_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personas_persona_seq', 42, true);


--
-- TOC entry 2638 (class 0 OID 17410)
-- Dependencies: 199
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plan (id, tp, pg, sp, py, obj, ff, of, dpt, carpeta, producto, vigente, aaaa) FROM stdin;
1	1	1	0	0	111	10	1	99	1	1213	75444137532	2016
2	1	1	0	0	112	10	1	99	1	1213	248472000	2016
3	1	1	0	0	113	10	1	99	1	1213	38020170000	2016
4	1	1	0	0	114	10	1	99	1	1213	9476064961	2016
5	1	1	0	0	123	10	1	99	1	1213	1570241453	2016
6	1	1	0	0	123	30	1	99	1	1213	360614356	2016
7	1	1	0	0	125	10	1	99	2	1213	1755192614	2016
8	1	1	0	0	131	10	1	99	2	1213	77442591776	2016
9	1	1	0	0	132	10	1	99	2	1213	301532949447	2016
10	1	1	0	0	133	10	1	99	2	1213	15632561536	2016
11	1	1	0	0	133	30	1	99	2	1213	200000000	2016
12	1	1	0	0	134	10	1	99	2	1213	355661282	2016
13	1	1	0	0	137	10	1	99	2	1213	782000000	2016
14	1	1	0	0	141	10	1	99	3	1213	717154786	2016
15	1	1	0	0	143	10	1	99	3	1213	10275000000	2016
16	1	1	0	0	144	10	1	99	3	1213	7892906231	2016
17	1	1	0	0	144	30	1	99	3	1213	90105038	2016
18	1	1	0	0	145	10	1	99	3	1213	2278600157	2016
19	1	1	0	0	145	30	1	99	3	1213	43605000	2016
20	1	1	0	0	191	10	1	99	3	1213	12533088750	2016
21	1	1	0	0	199	10	1	99	4	1213	9006222231	2016
22	1	1	0	0	210	10	1	99	4	1213	32715954350	2016
23	1	1	0	0	210	30	1	99	4	1213	283500000	2016
24	1	1	0	0	220	10	1	99	4	1213	380065000	2016
25	1	1	0	0	230	30	1	99	4	1213	909575175	2016
26	1	1	0	0	240	10	1	99	4	1213	248930094	2016
27	1	1	0	0	240	30	1	99	5	1213	102450000	2016
28	1	1	0	0	240	30	302	99	5	1213	500000000	2016
29	1	1	0	0	250	10	1	99	5	1213	4771520664	2016
30	1	1	0	0	250	30	1	99	5	1213	1466558625	2016
31	1	1	0	0	250	30	302	10	5	1213	0	2016
32	1	1	0	0	250	30	302	99	5	1213	0	2016
33	1	1	0	0	260	10	1	99	5	1213	1157044171	2016
34	1	1	0	0	260	30	1	99	6	1213	61370000	2016
35	1	1	0	0	260	30	302	99	6	1213	1200000000	2016
36	1	1	0	0	280	10	1	99	6	1213	156599958	2016
37	1	1	0	0	280	30	1	99	6	1213	75582000	2016
38	1	1	0	0	290	10	1	99	6	1213	31274893	2016
39	1	1	0	0	290	30	1	99	6	1213	272237462	2016
40	1	1	0	0	320	10	1	99	7	1213	80500041	2016
41	1	1	0	0	320	30	1	99	7	1213	25000000	2016
42	1	1	0	0	330	10	1	99	7	1213	103862136	2016
43	1	1	0	0	330	30	1	99	7	1213	10583067	2016
44	1	1	0	0	340	10	1	99	7	1213	536925347	2016
45	1	1	0	0	340	30	1	99	7	1213	289770000	2016
46	1	1	0	0	340	30	302	99	7	1213	1624444444	2016
47	1	1	0	0	350	10	1	99	8	1213	293280009	2016
48	1	1	0	0	360	10	1	99	8	1213	95513550	2016
49	1	1	0	0	360	30	1	99	8	1213	586623450	2016
50	1	1	0	0	390	10	1	99	8	1213	6613785	2016
51	1	1	0	0	540	10	1	99	8	1213	1466070876	2016
52	1	1	0	0	540	30	1	99	8	1213	500000000	2016
53	1	1	0	0	811	10	126	99	9	1213	10308771978	2016
54	1	1	0	0	811	10	128	99	9	1213	5751704263	2016
55	1	1	0	0	811	10	171	11	9	1213	935159819672	2016
56	1	1	0	0	811	10	172	10	9	1213	87767025150	2016
57	1	1	0	0	811	10	173	12	9	1213	39891325126	2016
58	1	1	0	0	811	10	174	7	9	1213	45930133806	2016
59	1	1	0	0	811	10	175	1	9	1213	31570400306	2016
60	1	1	0	0	811	10	176	4	10	1213	40620903312	2016
61	1	1	0	0	811	10	177	5	10	1213	44386937765	2016
62	1	1	0	0	811	10	178	14	10	1213	16587034392	2016
63	1	1	0	0	811	10	181	99	10	1213	1956761020	2016
64	1	1	0	0	811	10	182	99	10	1213	3427204396	2016
65	1	1	0	0	811	30	126	99	10	1213	5122446188	2016
66	1	1	0	0	811	30	302	99	10	1213	585000000	2016
67	1	1	0	0	834	30	1	99	11	1213	4928641279	2016
68	1	1	0	0	841	10	1	99	11	1213	13986350000	2016
69	1	1	0	0	849	10	1	99	11	1213	2500000	2016
70	1	1	0	0	851	10	1	99	11	1213	2167970646	2016
71	1	1	0	0	861	10	126	99	11	1213	47060041522	2016
72	1	1	0	0	861	10	128	99	11	1213	34188287	2016
73	1	1	0	0	861	10	171	11	11	1213	113231860423	2016
74	1	1	0	0	861	10	172	10	12	1213	581166532	2016
75	1	1	0	0	861	10	173	12	12	1213	593221532	2016
76	1	1	0	0	861	10	174	7	12	1213	1028020608	2016
77	1	1	0	0	861	10	175	1	12	1213	2578861562	2016
78	1	1	0	0	861	10	176	4	12	1213	1213867780	2016
79	1	1	0	0	861	10	177	5	12	1213	1666472824	2016
80	1	1	0	0	861	10	178	14	12	1213	2106159776	2016
81	1	1	0	0	861	10	182	99	13	1213	33371040	2016
82	1	1	0	0	861	30	126	99	13	1213	827596681	2016
83	1	1	0	0	861	30	302	99	13	1213	815000000	2016
84	1	1	0	0	894	30	1	99	13	1213	1222032852	2016
85	1	1	0	0	910	10	1	99	13	1213	1156260720	2016
86	1	1	0	0	910	30	1	99	13	1213	4863274514	2016
87	1	1	0	0	980	20	13	99	14	1213	238579098701	2016
88	2	1	1	0	220	10	1	99	15	36	14091870834	2016
89	2	1	1	0	340	10	1	99	15	36	44915561947	2016
90	2	1	1	0	220	10	1	99	16	38	4428960000	2016
91	2	1	1	0	330	10	1	99	16	38	4583939018	2016
92	2	1	1	0	330	30	302	99	16	38	1139641500	2016
93	2	1	1	0	530	10	1	99	16	38	3367297315	2016
94	2	1	1	0	530	10	3	99	16	38	882408000	2016
95	2	1	1	0	520	10	1	99	17	336	2300000000	2016
96	2	1	1	0	520	10	3	99	17	336	2300000000	2016
97	2	1	1	0	530	10	1	99	17	336	818480000	2016
98	2	1	1	0	530	10	3	99	17	336	818480000	2016
99	2	1	1	0	111	10	1	0	18	563	119562644022	2016
100	2	1	1	0	111	10	1	1	18	563	89203770698	2016
101	2	1	1	0	111	10	1	2	19	563	187554042692	2016
102	2	1	1	0	111	10	1	3	19	563	97919839246	2016
103	2	1	1	0	111	10	1	4	19	563	83038420032	2016
104	2	1	1	0	111	10	1	5	19	563	207376721672	2016
105	2	1	1	0	111	10	1	6	19	563	78341955768	2016
106	2	1	1	0	111	10	1	7	19	563	164977001970	2016
107	2	1	1	0	111	10	1	8	20	563	43546490830	2016
108	2	1	1	0	111	10	1	9	20	563	114166093730	2016
109	2	1	1	0	111	10	1	10	20	563	180685929632	2016
110	2	1	1	0	111	10	1	11	20	563	320823671752	2016
111	2	1	1	0	111	10	1	12	20	563	28980375870	2016
112	2	1	1	0	111	10	1	13	20	563	32191015142	2016
113	2	1	1	0	111	10	1	14	20	563	76884470400	2016
114	2	1	1	0	111	10	1	15	21	563	48586822112	2016
115	2	1	1	0	111	10	1	16	21	563	7005817064	2016
116	2	1	1	0	111	10	1	17	21	563	5964096154	2016
117	2	1	1	0	111	10	1	99	21	563	204177872526	2016
118	2	1	1	0	114	10	1	0	21	563	9963553668	2016
119	2	1	1	0	114	10	1	1	21	563	7433647558	2016
120	2	1	1	0	114	10	1	2	21	563	15629503557	2016
121	2	1	1	0	114	10	1	3	22	563	8159986605	2016
122	2	1	1	0	114	10	1	4	22	563	6919868337	2016
123	2	1	1	0	114	10	1	5	22	563	17281393474	2016
124	2	1	1	0	114	10	1	6	22	563	6528496315	2016
125	2	1	1	0	114	10	1	7	22	563	13748083498	2016
126	2	1	1	0	114	10	1	8	22	563	3628874236	2016
127	2	1	1	0	114	10	1	9	22	563	9513841146	2016
128	2	1	1	0	114	10	1	10	23	563	15057160804	2016
129	2	1	1	0	114	10	1	11	23	563	26735305980	2016
130	2	1	1	0	114	10	1	12	23	563	2415031323	2016
131	2	1	1	0	114	10	1	13	23	563	2682584596	2016
132	2	1	1	0	114	10	1	14	23	563	6407039201	2016
133	2	1	1	0	114	10	1	15	23	563	4048901844	2016
134	2	1	1	0	114	10	1	16	23	563	583818089	2016
135	2	1	1	0	114	10	1	17	24	563	497008013	2016
136	2	1	1	0	114	10	1	99	24	563	17014822711	2016
137	2	1	1	0	123	10	1	99	24	563	486021600	2016
138	2	1	1	0	134	10	1	99	24	563	65823376512	2016
139	2	1	1	0	144	10	1	99	24	563	0	2016
140	2	1	1	0	145	10	1	99	24	563	191921514	2016
141	2	1	1	0	199	10	1	99	24	563	7725039002	2016
142	2	1	1	0	210	10	1	99	25	563	177049772	2016
143	2	1	1	0	230	10	1	99	25	563	158628943	2016
144	2	1	1	0	230	30	302	99	25	563	2102246930	2016
145	2	1	1	0	240	10	1	99	25	563	51833600	2016
146	2	1	1	0	240	30	302	99	25	563	1000000000	2016
147	2	1	1	0	250	10	1	99	25	563	653125810	2016
148	2	1	1	0	250	30	302	99	25	563	1461135437	2016
149	2	1	1	0	260	10	1	99	26	563	154528486	2016
150	2	1	1	0	330	10	1	99	26	563	916060982	2016
151	2	1	1	0	330	30	302	99	26	563	0	2016
152	2	1	1	0	340	10	1	99	26	563	326053093	2016
153	2	1	1	0	360	10	1	99	26	563	137021734	2016
154	2	1	1	0	360	30	302	99	26	563	3000000000	2016
155	2	1	1	0	390	30	302	99	27	563	147642800	2016
156	2	1	1	0	520	10	3	99	27	563	7185445200	2016
157	2	1	1	0	520	30	302	99	27	563	0	2016
158	2	1	1	0	530	10	3	99	27	563	6078396800	2016
159	2	1	1	0	530	30	302	99	27	563	13950000000	2016
160	2	1	1	0	540	10	1	99	27	563	967599836	2016
161	2	1	1	0	540	10	3	99	28	563	8008440000	2016
162	2	1	1	0	834	10	1	99	28	563	23347500000	2016
163	2	1	1	0	894	10	1	99	28	563	3500000000	2016
164	2	1	1	0	894	30	302	99	28	563	5000000000	2016
165	2	1	1	0	390	10	1	99	29	1090	16795748	2016
166	2	1	1	0	540	10	1	99	29	1090	429499938	2016
167	2	1	1	0	540	10	3	99	29	1090	183540000	2016
168	2	1	1	0	848	10	1	99	30	1312	96282041877	2016
169	2	1	2	0	220	10	1	99	31	36	833157744	2016
170	2	1	2	0	340	10	1	99	31	36	14968031720	2016
171	2	1	2	0	111	10	1	0	32	561	107019152762	2016
172	2	1	2	0	111	10	1	1	32	561	25903108268	2016
173	2	1	2	0	111	10	1	2	32	561	61689618200	2016
174	2	1	2	0	111	10	1	3	32	561	40022592848	2016
175	2	1	2	0	111	10	1	4	32	561	26282824364	2016
176	2	1	2	0	111	10	1	5	32	561	68365048196	2016
177	2	1	2	0	111	10	1	6	32	561	22170660440	2016
178	2	1	2	0	111	10	1	7	33	561	46434813948	2016
179	2	1	2	0	111	10	1	8	33	561	23932977778	2016
180	2	1	2	0	111	10	1	9	33	561	40363724426	2016
181	2	1	2	0	111	10	1	10	33	561	46780004616	2016
182	2	1	2	0	111	10	1	11	33	561	121742747592	2016
183	2	1	2	0	111	10	1	12	33	561	14896564652	2016
184	2	1	2	0	111	10	1	13	33	561	9875788440	2016
185	2	1	2	0	111	10	1	14	34	561	17394960920	2016
186	2	1	2	0	111	10	1	15	34	561	12760773672	2016
187	2	1	2	0	111	10	1	16	34	561	3145521340	2016
188	2	1	2	0	111	10	1	17	34	561	2700228690	2016
189	2	1	2	0	111	10	1	99	34	561	104458376594	2016
190	2	1	2	0	114	10	1	0	34	561	8918262732	2016
191	2	1	2	0	114	10	1	1	34	561	2158592357	2016
192	2	1	2	0	114	10	1	2	35	561	5140801518	2016
193	2	1	2	0	114	10	1	3	35	561	3335216073	2016
194	2	1	2	0	114	10	1	4	35	561	2190235365	2016
195	2	1	2	0	114	10	1	5	35	561	5697087351	2016
196	2	1	2	0	114	10	1	6	35	561	1847555038	2016
197	2	1	2	0	114	10	1	7	35	561	3869567831	2016
198	2	1	2	0	114	10	1	8	35	561	1994414817	2016
199	2	1	2	0	114	10	1	9	36	561	3363643703	2016
200	2	1	2	0	114	10	1	10	36	561	3898333719	2016
201	2	1	2	0	114	10	1	11	36	561	10145228968	2016
202	2	1	2	0	114	10	1	12	36	561	1241380389	2016
203	2	1	2	0	114	10	1	13	36	561	822982371	2016
204	2	1	2	0	114	10	1	14	36	561	1449580078	2016
205	2	1	2	0	114	10	1	15	36	561	1063397807	2016
206	2	1	2	0	114	10	1	16	37	561	262126779	2016
207	2	1	2	0	114	10	1	17	37	561	225019058	2016
208	2	1	2	0	114	10	1	99	37	561	8704864719	2016
209	2	1	2	0	134	10	1	99	37	561	8026547473	2016
210	2	1	2	0	199	10	1	99	37	561	1000000000	2016
211	2	1	2	0	230	10	1	99	37	561	115779451	2016
212	2	1	2	0	240	10	1	99	38	561	106360000	2016
213	2	1	2	0	260	10	1	99	38	561	243431	2016
214	2	1	2	0	340	10	1	99	38	561	0	2016
215	2	1	2	0	360	10	1	99	38	561	615694	2016
216	2	1	2	0	530	10	3	99	38	561	3881700000	2016
217	2	1	2	0	540	10	1	99	39	561	0	2016
218	2	1	2	0	540	30	302	99	39	561	1944800000	2016
219	2	1	2	0	834	10	1	99	39	561	11206345400	2016
220	2	1	2	0	842	10	1	99	39	561	0	2016
221	2	1	2	0	894	10	1	99	39	561	11272045400	2016
222	2	1	2	0	530	10	1	99	40	1117	1349346560	2016
223	2	1	2	0	540	10	1	99	40	1117	121405200	2016
224	2	1	2	0	540	10	3	99	40	1117	531600000	2016
225	2	1	3	0	123	10	1	99	41	24	103610871	2016
226	2	1	3	0	125	10	1	99	41	24	83076926	2016
227	2	1	3	0	141	10	1	99	41	24	13013268	2016
228	2	1	3	0	144	10	1	99	41	24	331978010	2016
229	2	1	3	0	145	10	1	99	41	24	318099814	2016
230	2	1	3	0	230	10	1	99	41	24	1391655049	2016
231	2	1	3	0	250	30	302	99	42	24	5040000000	2016
232	2	1	3	0	260	10	1	99	42	24	335983976	2016
233	2	1	3	0	290	30	302	99	42	24	528444444	2016
234	2	1	3	0	340	10	1	99	42	24	126703152	2016
235	2	1	3	0	530	10	1	99	42	24	11825922	2016
236	2	1	3	0	111	10	1	0	43	561	3651961740	2016
237	2	1	3	0	111	10	1	1	43	561	879469680	2016
238	2	1	3	0	111	10	1	2	43	561	2837748072	2016
239	2	1	3	0	111	10	1	3	43	561	2361463620	2016
240	2	1	3	0	111	10	1	4	44	561	499752240	2016
241	2	1	3	0	111	10	1	5	44	561	2532067992	2016
242	2	1	3	0	111	10	1	6	44	561	1611654612	2016
243	2	1	3	0	111	10	1	7	44	561	1547857536	2016
244	2	1	3	0	111	10	1	8	44	561	2949940488	2016
245	2	1	3	0	111	10	1	9	44	561	2756783664	2016
246	2	1	3	0	111	10	1	10	45	561	190415760	2016
247	2	1	3	0	111	10	1	11	45	561	218565360	2016
248	2	1	3	0	111	10	1	12	45	561	393960576	2016
249	2	1	3	0	111	10	1	13	45	561	162561360	2016
250	2	1	3	0	111	10	1	14	45	561	453828864	2016
251	2	1	3	0	111	10	1	15	45	561	790978920	2016
252	2	1	3	0	111	10	1	16	45	561	41990400	2016
253	2	1	3	0	111	10	1	99	46	561	4387309324	2016
254	2	1	3	0	113	10	1	0	46	561	31104000	2016
255	2	1	3	0	113	10	1	99	46	561	522000000	2016
256	2	1	3	0	114	10	1	0	46	561	306922145	2016
257	2	1	3	0	114	10	1	1	46	561	73289140	2016
258	2	1	3	0	114	10	1	2	46	561	236479006	2016
259	2	1	3	0	114	10	1	3	46	561	196788635	2016
260	2	1	3	0	114	10	1	4	47	561	41646020	2016
261	2	1	3	0	114	10	1	5	47	561	211005666	2016
262	2	1	3	0	114	10	1	6	47	561	134304551	2016
263	2	1	3	0	114	10	1	7	47	561	128988128	2016
264	2	1	3	0	114	10	1	8	47	561	245828374	2016
265	2	1	3	0	114	10	1	9	47	561	229731972	2016
266	2	1	3	0	114	10	1	10	47	561	15867980	2016
267	2	1	3	0	114	10	1	11	48	561	18213780	2016
268	2	1	3	0	114	10	1	12	48	561	32830048	2016
269	2	1	3	0	114	10	1	13	48	561	13546780	2016
270	2	1	3	0	114	10	1	14	48	561	37819072	2016
271	2	1	3	0	114	10	1	15	48	561	65914910	2016
272	2	1	3	0	114	10	1	16	48	561	3499200	2016
273	2	1	3	0	114	10	1	99	48	561	409109110	2016
274	2	1	3	0	123	10	1	99	49	561	10496992	2016
275	2	1	3	0	125	10	1	99	49	561	6923074	2016
276	2	1	3	0	134	10	1	99	49	561	298900222	2016
277	2	1	3	0	260	10	1	99	49	561	0	2016
278	2	1	3	0	340	10	1	99	49	561	66857687	2016
279	2	1	3	0	360	10	1	99	50	561	90750000	2016
280	2	1	3	0	390	10	1	99	50	561	846804	2016
281	2	1	3	0	530	10	1	99	50	561	35477768	2016
282	2	1	3	0	540	10	1	8	50	561	0	2016
283	2	1	3	0	540	10	1	99	50	561	692258000	2016
284	2	1	3	0	834	30	1	99	51	561	2600003403	2016
285	2	1	3	0	894	30	1	99	51	561	650000851	2016
286	2	1	3	0	123	10	1	99	52	1224	127286886	2016
287	2	1	3	0	340	10	1	99	52	1224	72977250	2016
288	2	1	3	0	530	10	1	99	52	1224	2218543	2016
289	2	1	3	0	540	10	1	8	52	1224	0	2016
290	2	1	3	0	123	10	1	99	53	1225	44532451	2016
291	2	1	3	0	340	10	1	99	53	1225	30557311	2016
292	2	1	3	0	530	10	1	99	53	1225	477767	2016
293	2	1	3	0	540	10	1	8	53	1225	0	2016
294	2	1	4	0	111	10	1	99	54	61	8282958132	2016
295	2	1	4	0	113	10	1	99	54	61	25972800	2016
296	2	1	4	0	114	10	1	99	54	61	692410911	2016
297	2	1	4	0	134	10	1	99	54	61	95228113	2016
298	2	1	4	0	141	10	1	99	54	61	5130000	2016
299	2	1	4	0	144	10	1	99	54	61	25412500	2016
300	2	1	4	0	145	10	1	99	55	61	7182000	2016
301	2	1	4	0	191	10	1	99	55	61	14382000	2016
302	2	1	4	0	210	10	1	99	55	61	17176320	2016
303	2	1	4	0	230	10	1	99	55	61	504698	2016
304	2	1	4	0	240	10	1	99	55	61	4262440	2016
305	2	1	4	0	250	10	1	99	55	61	60000000	2016
306	2	1	4	0	280	10	1	99	56	61	6523044	2016
307	2	1	4	0	834	30	1	99	56	61	371218982	2016
308	2	1	4	0	894	30	1	99	56	61	92804745	2016
309	2	1	5	0	210	10	1	99	57	1230	20000000	2016
310	2	1	5	0	260	10	1	99	57	1230	548101632	2016
311	2	1	5	0	280	10	1	99	57	1230	8835000	2016
312	2	1	5	0	290	10	1	99	57	1230	13750000	2016
313	2	1	5	0	540	10	1	99	57	1230	8215292	2016
314	2	1	6	0	111	10	1	99	58	61	5363302224	2016
315	2	1	6	0	114	10	1	99	58	61	446941852	2016
316	2	1	6	0	123	10	1	99	58	61	885780	2016
317	2	1	6	0	134	10	1	99	58	61	77394890	2016
318	2	1	6	0	230	10	1	99	58	61	727871	2016
319	2	1	6	0	530	10	1	99	59	61	23344214	2016
320	2	1	6	0	540	10	1	99	59	61	6540000	2016
321	2	1	6	0	834	30	1	99	59	61	621841291	2016
322	2	1	6	0	894	30	1	99	59	61	155460323	2016
323	2	1	7	0	111	10	1	99	60	61	8884536472	2016
324	2	1	7	0	113	10	1	99	60	61	25972800	2016
325	2	1	7	0	114	10	1	99	60	61	742542439	2016
326	2	1	7	0	134	10	1	99	60	61	103782169	2016
327	2	1	7	0	230	10	1	99	60	61	1579704	2016
328	2	1	7	0	834	30	1	99	61	61	3812551263	2016
329	2	1	7	0	894	30	1	99	61	61	953137816	2016
330	2	1	8	0	220	10	1	99	62	36	96372629	2016
331	2	1	8	0	340	10	1	99	62	36	2509506830	2016
332	2	1	8	0	111	10	1	0	63	77	36873605418	2016
333	2	1	8	0	111	10	1	1	63	77	4914112446	2016
334	2	1	8	0	111	10	1	2	63	77	6305220600	2016
335	2	1	8	0	111	10	1	3	63	77	6902358354	2016
336	2	1	8	0	111	10	1	4	63	77	3998624100	2016
337	2	1	8	0	111	10	1	5	63	77	4941761844	2016
338	2	1	8	0	111	10	1	6	63	77	4825700958	2016
339	2	1	8	0	111	10	1	7	64	77	3811510320	2016
340	2	1	8	0	111	10	1	8	64	77	3480869514	2016
341	2	1	8	0	111	10	1	9	64	77	3152450874	2016
342	2	1	8	0	111	10	1	10	64	77	6018972576	2016
343	2	1	8	0	111	10	1	11	64	77	12317016924	2016
344	2	1	8	0	111	10	1	12	64	77	1918724958	2016
345	2	1	8	0	111	10	1	13	64	77	3158435556	2016
346	2	1	8	0	111	10	1	14	65	77	2137573644	2016
347	2	1	8	0	111	10	1	15	65	77	2190631362	2016
348	2	1	8	0	111	10	1	16	65	77	823006548	2016
349	2	1	8	0	111	10	1	17	65	77	806102376	2016
350	2	1	8	0	111	10	1	99	65	77	73008430812	2016
351	2	1	8	0	114	10	1	0	65	77	3072800452	2016
352	2	1	8	0	114	10	1	1	65	77	409509371	2016
353	2	1	8	0	114	10	1	2	66	77	525435050	2016
354	2	1	8	0	114	10	1	3	66	77	575196530	2016
355	2	1	8	0	114	10	1	4	66	77	333218675	2016
356	2	1	8	0	114	10	1	5	66	77	411813487	2016
357	2	1	8	0	114	10	1	6	66	77	402141747	2016
358	2	1	8	0	114	10	1	7	66	77	317625860	2016
359	2	1	8	0	114	10	1	8	66	77	290072460	2016
360	2	1	8	0	114	10	1	9	67	77	262704240	2016
361	2	1	8	0	114	10	1	10	67	77	501581048	2016
362	2	1	8	0	114	10	1	11	67	77	1026418077	2016
363	2	1	8	0	114	10	1	12	67	77	159893747	2016
364	2	1	8	0	114	10	1	13	67	77	263202963	2016
365	2	1	8	0	114	10	1	14	67	77	178131137	2016
366	2	1	8	0	114	10	1	15	67	77	182552614	2016
367	2	1	8	0	114	10	1	16	68	77	68583879	2016
368	2	1	8	0	114	10	1	17	68	77	67175198	2016
369	2	1	8	0	114	10	1	99	68	77	6084035902	2016
370	2	1	8	0	123	10	1	99	68	77	102662658	2016
371	2	1	8	0	125	10	1	99	68	77	127871250	2016
372	2	1	8	0	134	10	1	99	68	77	2362837205	2016
373	2	1	8	0	137	10	1	99	68	77	6840000	2016
374	2	1	8	0	141	10	1	99	69	77	13013268	2016
375	2	1	8	0	144	10	1	99	69	77	61588989	2016
376	2	1	8	0	145	10	1	99	69	77	313542512	2016
377	2	1	8	0	199	10	1	99	69	77	3701216060	2016
378	2	1	8	0	230	10	1	99	69	77	493399417	2016
379	2	1	8	0	240	10	1	99	69	77	19222484	2016
380	2	1	8	0	260	10	1	99	70	77	607567936	2016
381	2	1	8	0	280	10	1	99	70	77	141640827	2016
382	2	1	8	0	330	10	1	99	70	77	51127377	2016
383	2	1	8	0	340	10	1	99	70	77	117423799	2016
384	2	1	8	0	360	10	1	99	70	77	49691270	2016
385	2	1	8	0	520	10	1	99	71	77	20000000	2016
386	2	1	8	0	530	10	1	99	71	77	119861978	2016
387	2	1	8	0	540	10	1	99	71	77	443001851	2016
388	2	1	8	0	834	30	1	99	71	77	1445463326	2016
389	2	1	8	0	847	10	1	99	71	77	2000000000	2016
390	2	1	8	0	894	30	1	99	71	77	361365832	2016
391	2	1	8	0	123	10	1	99	72	1158	103487247	2016
392	2	1	8	0	125	10	1	99	72	1158	70378750	2016
393	2	1	8	0	141	10	1	99	72	1158	13013268	2016
394	2	1	8	0	144	10	1	99	72	1158	126234615	2016
395	2	1	8	0	145	10	1	99	73	1158	246900000	2016
396	2	1	8	0	230	10	1	99	73	1158	712594707	2016
397	2	1	8	0	240	10	1	99	73	1158	52342980	2016
398	2	1	8	0	280	10	1	99	73	1158	239949171	2016
399	2	1	8	0	330	10	1	99	74	1158	1790805135	2016
400	2	1	8	0	360	10	1	99	74	1158	429943789	2016
401	2	1	8	0	390	10	1	99	74	1158	9354468	2016
402	2	1	8	0	530	10	1	99	74	1158	807144813	2016
403	2	1	9	0	111	10	1	1	75	561	7893368472	2016
404	2	1	9	0	111	10	1	4	75	561	5849635968	2016
405	2	1	9	0	111	10	1	7	75	561	6952219902	2016
406	2	1	9	0	111	10	1	10	75	561	6676670310	2016
407	2	1	9	0	111	10	1	11	75	561	7142266788	2016
408	2	1	9	0	111	10	1	12	75	561	4529746608	2016
409	2	1	9	0	111	10	1	13	75	561	5337128424	2016
410	2	1	9	0	111	10	1	99	76	561	4477561002	2016
411	2	1	9	0	113	10	1	1	76	561	2160000	2016
412	2	1	9	0	113	10	1	4	76	561	2160000	2016
413	2	1	9	0	113	10	1	7	76	561	2160000	2016
414	2	1	9	0	113	10	1	10	76	561	2160000	2016
415	2	1	9	0	113	10	1	11	76	561	4320000	2016
416	2	1	9	0	113	10	1	12	76	561	2160000	2016
417	2	1	9	0	113	10	1	13	77	561	2160000	2016
418	2	1	9	0	114	10	1	1	77	561	657960707	2016
419	2	1	9	0	114	10	1	4	77	561	487649664	2016
420	2	1	9	0	114	10	1	7	77	561	579531659	2016
421	2	1	9	0	114	10	1	10	77	561	556569193	2016
422	2	1	9	0	114	10	1	11	77	561	595548900	2016
423	2	1	9	0	114	10	1	12	77	561	377658885	2016
424	2	1	9	0	114	10	1	13	78	561	444940703	2016
425	2	1	9	0	114	10	1	99	78	561	373130084	2016
426	2	1	9	0	134	10	1	99	78	561	511643313	2016
427	2	1	9	0	834	30	1	99	78	561	540943680	2016
428	2	1	9	0	894	30	1	99	78	561	135235920	2016
429	2	1	10	0	111	10	1	99	79	561	6394563800	2016
430	2	1	10	0	113	10	1	99	79	561	79593600	2016
431	2	1	10	0	114	10	1	99	79	561	539513117	2016
432	2	1	10	0	123	10	1	99	79	561	236178456	2016
433	2	1	10	0	134	10	1	99	79	561	61548519	2016
434	2	1	10	0	144	10	1	99	80	561	0	2016
435	2	1	10	0	145	10	1	99	80	561	110573110	2016
436	2	1	10	0	191	10	1	99	80	561	26367000	2016
437	2	1	10	0	199	10	1	99	80	561	554290428	2016
438	2	1	10	0	210	10	1	99	80	561	414453992	2016
439	2	1	10	0	230	10	1	99	80	561	77218347	2016
440	2	1	10	0	240	10	1	99	81	561	296234279	2016
441	2	1	10	0	260	10	1	99	81	561	399078560	2016
442	2	1	10	0	280	10	1	99	81	561	44017797	2016
443	2	1	10	0	310	10	1	99	81	561	154434120	2016
444	2	1	10	0	330	10	1	99	81	561	632217450	2016
445	2	1	10	0	340	10	1	99	81	561	39763919	2016
446	2	1	10	0	360	10	1	99	82	561	0	2016
447	2	1	10	0	530	10	1	99	82	561	299000000	2016
448	2	1	10	0	540	10	1	99	82	561	84254820	2016
449	2	1	10	0	540	10	3	99	82	561	129990000	2016
450	2	1	10	0	210	10	1	99	83	1210	11896000	2016
451	2	1	10	0	310	10	1	99	83	1210	78761401	2016
452	2	1	10	0	540	10	1	99	83	1210	212478180	2016
453	2	1	11	0	111	10	1	99	84	561	1955150520	2016
454	2	1	11	0	113	10	1	99	84	561	79593600	2016
455	2	1	11	0	114	10	1	99	84	561	169562010	2016
456	2	1	11	0	123	10	1	99	84	561	227586077	2016
457	2	1	11	0	125	10	1	99	84	561	68186891	2016
458	2	1	11	0	191	10	1	99	84	561	96000000	2016
459	2	1	11	0	210	10	1	99	85	561	28000000	2016
460	2	1	11	0	250	10	1	99	85	561	50400000	2016
461	2	1	11	0	290	10	1	99	85	561	13615315	2016
462	2	1	11	0	340	10	1	99	85	561	11607016	2016
463	2	1	11	0	360	10	1	99	85	561	3732278	2016
464	2	1	11	0	530	10	1	99	86	561	10600000	2016
465	2	1	11	0	540	10	1	99	86	561	24835200	2016
466	2	1	14	0	123	10	1	99	87	1228	63659759	2016
467	2	1	14	0	125	10	1	99	87	1228	32593731	2016
468	2	1	14	0	133	30	302	99	87	1228	0	2016
469	2	1	14	0	145	30	302	99	87	1228	1260000000	2016
470	2	1	14	0	199	10	1	99	87	1228	19454510	2016
471	2	1	14	0	240	10	1	99	87	1228	38984263	2016
472	2	1	14	0	250	30	302	99	88	1228	3200000000	2016
473	2	1	14	0	260	30	302	99	88	1228	907644444	2016
474	2	1	14	0	280	30	302	99	88	1228	500000000	2016
475	2	1	14	0	290	10	1	99	88	1228	132000000	2016
476	2	1	14	0	330	10	1	99	88	1228	0	2016
477	2	1	14	0	360	10	1	99	88	1228	105969757	2016
478	2	1	14	0	540	10	1	99	89	1228	31797750	2016
479	2	1	14	0	851	10	1	99	89	1228	70000000	2016
480	2	1	15	0	111	10	1	99	90	1229	747711600	2016
481	2	1	15	0	112	10	1	99	90	1229	527443200	2016
482	2	1	15	0	113	10	1	99	90	1229	27648000	2016
483	2	1	15	0	114	10	1	99	90	1229	108566900	2016
484	2	1	15	0	131	10	1	99	90	1229	7000000	2016
485	2	1	15	0	133	10	1	99	90	1229	198803419	2016
486	2	1	15	0	144	10	1	99	90	1229	0	2016
487	2	1	15	0	145	10	1	99	91	1229	0	2016
488	2	1	15	0	191	10	1	99	91	1229	40800000	2016
489	2	1	15	0	199	10	1	99	91	1229	0	2016
490	2	1	15	0	210	10	1	99	91	1229	24885000	2016
491	2	1	15	0	230	10	1	99	91	1229	119470950	2016
492	2	1	15	0	240	10	1	99	91	1229	0	2016
493	2	1	15	0	260	10	1	99	92	1229	139350001	2016
494	2	1	15	0	280	10	1	99	92	1229	0	2016
495	2	1	15	0	290	10	1	99	92	1229	54723300	2016
496	2	1	15	0	320	10	1	99	92	1229	0	2016
497	2	1	15	0	330	10	1	99	92	1229	13373250	2016
498	2	1	15	0	340	10	1	99	92	1229	25070750	2016
499	2	1	15	0	350	10	1	99	93	1229	0	2016
500	2	1	15	0	360	10	1	99	93	1229	21147000	2016
501	2	1	15	0	530	10	1	99	93	1229	5000000	2016
502	2	1	15	0	540	10	1	99	93	1229	12525000	2016
503	2	1	16	0	141	10	1	0	94	61	36000000	2016
504	2	1	16	0	143	10	1	0	94	61	144000000	2016
505	2	1	16	0	144	10	1	0	94	61	81256500	2016
506	2	1	16	0	144	30	1	0	94	61	74726600	2016
507	2	1	16	0	145	10	1	0	94	61	381136798	2016
508	2	1	16	0	210	10	1	0	94	61	43000000	2016
509	2	1	16	0	230	30	1	0	95	61	65000000	2016
510	2	1	16	0	240	30	1	0	95	61	91273400	2016
511	2	1	16	0	250	10	1	0	95	61	129000000	2016
512	2	1	16	0	260	10	1	0	95	61	56854367	2016
513	2	1	16	0	260	30	1	0	95	61	33400000	2016
514	2	1	16	0	280	30	1	0	95	61	9600000	2016
515	2	1	16	0	320	30	1	0	96	61	5000000	2016
516	2	1	16	0	330	30	1	0	96	61	4000000	2016
517	2	1	16	0	340	10	1	0	96	61	50000000	2016
518	2	1	16	0	340	30	1	0	96	61	5000000	2016
519	2	1	16	0	360	30	1	0	96	61	12000000	2016
520	2	1	16	0	540	10	1	0	96	61	29700000	2016
521	2	1	16	0	834	30	1	0	97	61	0	2016
522	2	1	16	0	841	10	1	0	97	61	300000000	2016
523	2	1	16	0	851	10	1	0	97	61	89760000	2016
524	2	1	16	0	894	30	1	0	97	61	0	2016
525	3	1	0	1	123	10	1	99	98	542	245161617	2016
526	3	1	0	1	125	10	1	99	98	542	169661199	2016
527	3	1	0	1	137	10	1	99	98	542	31922200	2016
528	3	1	0	1	137	20	401	99	98	542	410914368	2016
529	3	1	0	1	141	10	1	99	98	542	166308441	2016
530	3	1	0	1	141	20	401	99	98	542	455841744	2016
531	3	1	0	1	144	10	1	99	98	542	605007186	2016
532	3	1	0	1	145	10	1	99	99	542	319723723	2016
533	3	1	0	1	145	20	401	99	99	542	1426452000	2016
534	3	1	0	1	199	10	1	99	99	542	342115388	2016
535	3	1	0	1	230	10	1	99	99	542	2850000	2016
536	3	1	0	1	230	20	401	99	99	542	60000000	2016
537	3	1	0	1	240	10	1	99	99	542	51418182	2016
538	3	1	0	1	240	20	401	99	100	542	496000000	2016
539	3	1	0	1	250	10	1	99	100	542	593556000	2016
540	3	1	0	1	260	10	1	99	100	542	9259618	2016
541	3	1	0	1	260	20	401	99	100	542	712000000	2016
542	3	1	0	1	280	10	1	99	100	542	10900000	2016
543	3	1	0	1	280	20	401	99	100	542	109000000	2016
544	3	1	0	1	330	10	1	99	101	542	4500000	2016
545	3	1	0	1	330	20	401	99	101	542	0	2016
546	3	1	0	1	340	10	1	99	101	542	6500000	2016
547	3	1	0	1	340	20	401	99	101	542	95000000	2016
548	3	1	0	1	350	10	1	99	101	542	5000000	2016
549	3	1	0	1	360	20	401	99	101	542	250000000	2016
550	3	1	0	1	390	10	1	99	101	542	4200000	2016
551	3	1	0	1	390	20	401	99	102	542	42000000	2016
552	3	1	0	1	137	20	401	99	102	926	6198816	2016
553	3	1	0	1	144	10	1	99	103	926	0	2016
554	3	1	0	1	145	10	1	99	103	926	544497849	2016
555	3	1	0	1	145	20	401	99	103	926	2261328000	2016
556	3	1	0	1	230	10	1	99	103	926	6670989	2016
557	3	1	0	1	230	20	401	99	103	926	2097800000	2016
558	3	1	0	1	240	10	1	99	104	926	900000	2016
559	3	1	0	1	240	20	401	99	104	926	9000000	2016
560	3	1	0	1	260	10	1	99	104	926	407281414	2016
561	3	1	0	1	260	20	401	99	104	926	4411065852	2016
562	3	1	0	1	290	10	1	99	104	926	158350000	2016
563	3	1	0	1	290	20	401	99	104	926	1583500000	2016
564	3	1	0	1	330	10	1	99	105	926	10699249	2016
565	3	1	0	1	330	20	401	99	105	926	151992491	2016
566	3	1	0	1	340	10	1	99	105	926	14420000	2016
567	3	1	0	1	340	20	401	99	105	926	114200000	2016
568	3	1	0	1	520	20	4	99	105	926	4389453873	2016
569	3	1	0	1	520	20	13	99	105	926	0	2016
570	3	1	0	1	520	20	401	99	106	926	43894538736	2016
571	3	1	0	1	570	10	1	99	106	926	6950000	2016
572	3	1	0	1	570	20	401	99	106	926	69500000	2016
573	3	1	0	1	834	20	401	99	106	926	8085972632	2016
574	3	1	0	1	847	20	401	99	106	926	9833424560	2016
575	3	1	0	1	874	20	401	99	106	926	0	2016
576	3	1	0	1	894	20	401	99	107	926	4430027368	2016
577	3	1	0	2	520	30	513	99	108	39	6948289927	2016
578	3	1	0	2	530	30	513	99	108	39	1227144584	2016
579	3	1	0	2	540	30	513	99	108	39	4944950000	2016
580	3	1	0	3	141	30	76	99	109	336	4887293666	2016
581	3	1	0	3	144	30	76	99	109	336	190666667	2016
582	3	1	0	3	145	30	76	99	109	336	3003000000	2016
583	3	1	0	3	220	30	76	99	109	336	400000000	2016
584	3	1	0	3	230	30	76	99	109	336	552450655	2016
585	3	1	0	3	260	30	76	99	109	336	5288665900	2016
586	3	1	0	3	290	30	76	99	110	336	0	2016
587	3	1	0	3	320	30	76	99	110	336	0	2016
588	3	1	0	3	330	30	76	99	110	336	156100000	2016
589	3	1	0	3	340	30	76	99	110	336	1121060000	2016
590	3	1	0	3	350	30	76	99	110	336	429840000	2016
591	3	1	0	3	360	30	76	99	110	336	100000000	2016
592	3	1	0	3	520	30	76	99	111	336	7910962142	2016
593	3	1	0	3	530	30	76	99	111	336	6429821267	2016
594	3	1	0	3	540	30	76	99	111	336	500000000	2016
595	3	1	0	3	853	30	76	99	111	336	0	2016
596	3	1	0	3	848	30	76	99	112	1312	2424400000	2016
597	3	1	0	4	230	30	76	99	113	1181	604800000	2016
598	3	1	0	4	260	30	76	99	113	1181	1407000000	2016
599	3	1	0	4	360	30	76	99	113	1181	151200000	2016
600	3	1	0	4	520	30	76	99	114	1317	10705938368	2016
601	3	1	0	4	520	30	76	99	114	1318	17117243424	2016
602	3	1	0	5	144	30	76	99	115	1181	105000000	2016
603	3	1	0	5	145	30	76	99	116	1181	520000000	2016
604	3	1	0	5	230	30	76	99	116	1181	1180800000	2016
605	3	1	0	5	260	30	76	99	116	1181	160000000	2016
606	3	1	0	5	360	30	76	99	116	1181	383976000	2016
607	3	1	0	5	530	30	76	99	117	1181	1080000000	2016
608	3	1	0	5	520	30	76	99	117	1317	50045817704	2016
609	3	1	0	5	520	30	76	99	118	1318	15736000000	2016
610	3	1	0	5	530	30	76	99	119	1319	5305157000	2016
611	3	1	0	6	141	30	76	99	120	1181	117000000	2016
612	3	1	0	6	210	30	76	99	120	1181	54000000	2016
613	3	1	0	6	240	30	76	99	120	1181	6000000	2016
614	3	1	0	6	250	30	76	99	120	1181	220000000	2016
615	3	1	0	6	260	30	76	99	120	1181	105000000	2016
616	3	1	0	6	280	30	76	99	120	1181	5400000	2016
617	3	1	0	6	340	30	76	99	121	1181	19700000	2016
618	3	1	0	6	540	30	76	99	121	1181	8510000	2016
619	3	1	0	6	141	30	76	99	122	1228	0	2016
620	3	1	0	6	144	30	76	99	122	1228	0	2016
621	3	1	0	6	145	30	76	99	122	1228	0	2016
622	3	1	0	6	210	30	76	99	122	1228	0	2016
623	3	1	0	6	220	30	76	99	122	1228	0	2016
624	3	1	0	6	230	30	76	99	122	1228	0	2016
625	3	1	0	6	240	30	76	99	123	1228	0	2016
626	3	1	0	6	250	30	76	99	123	1228	0	2016
627	3	1	0	6	260	30	76	99	123	1228	0	2016
628	3	1	0	6	280	30	76	99	123	1228	0	2016
629	3	1	0	6	330	30	76	99	123	1228	0	2016
630	3	1	0	6	340	30	76	99	123	1228	0	2016
631	3	1	0	6	360	30	76	99	124	1228	0	2016
632	3	1	0	6	390	30	76	99	124	1228	0	2016
633	3	1	0	6	530	30	76	99	124	1228	0	2016
634	3	1	0	6	540	30	76	99	124	1228	0	2016
635	3	1	0	6	141	30	76	99	125	1320	1408124527	2016
636	3	1	0	6	144	30	76	99	125	1320	614810845	2016
637	3	1	0	6	145	30	76	99	125	1320	695137264	2016
638	3	1	0	6	220	30	76	99	125	1320	628400000	2016
639	3	1	0	6	230	30	76	99	125	1320	506040000	2016
640	3	1	0	6	240	30	76	99	125	1320	20270000	2016
641	3	1	0	6	260	30	76	99	126	1320	2320027976	2016
642	3	1	0	6	280	30	76	99	126	1320	176068000	2016
643	3	1	0	6	330	30	76	99	126	1320	401212909	2016
644	3	1	0	6	340	30	76	99	126	1320	549725748	2016
645	3	1	0	6	360	30	76	99	126	1320	105000000	2016
646	3	1	0	6	390	30	76	99	126	1320	35434630	2016
647	3	1	0	6	530	30	76	99	127	1320	90750000	2016
648	3	1	0	6	540	30	76	99	127	1320	1557870714	2016
649	3	1	0	6	852	30	76	99	127	1320	7091044000	2016
650	3	1	0	7	133	30	76	99	128	250	0	2016
651	3	1	0	7	137	30	76	99	128	250	0	2016
652	3	1	0	7	141	30	76	99	128	250	0	2016
653	3	1	0	7	144	30	76	99	128	250	0	2016
654	3	1	0	7	145	30	76	99	128	250	0	2016
655	3	1	0	7	210	30	76	99	128	250	0	2016
656	3	1	0	7	220	30	76	99	129	250	0	2016
657	3	1	0	7	230	30	76	99	129	250	0	2016
658	3	1	0	7	240	30	76	99	129	250	0	2016
659	3	1	0	7	250	30	76	99	129	250	0	2016
660	3	1	0	7	260	30	76	99	129	250	0	2016
661	3	1	0	7	280	30	76	99	129	250	0	2016
662	3	1	0	7	290	30	76	99	129	250	0	2016
663	3	1	0	7	330	30	76	99	130	250	0	2016
664	3	1	0	7	340	30	76	99	130	250	0	2016
665	3	1	0	7	360	30	76	99	130	250	0	2016
666	3	1	0	7	530	30	76	99	130	250	0	2016
667	3	1	0	7	540	30	76	99	130	250	0	2016
668	3	1	0	7	137	30	76	99	131	1181	10252778	2016
669	3	1	0	7	141	30	76	99	131	1181	31500000	2016
670	3	1	0	7	145	30	76	99	131	1181	243000000	2016
671	3	1	0	7	260	30	76	99	131	1181	132000000	2016
672	3	1	0	7	141	30	76	99	132	1320	36943527	2016
673	3	1	0	7	144	30	76	99	132	1320	343382353	2016
674	3	1	0	7	145	30	76	99	132	1320	54743766	2016
675	3	1	0	7	220	30	76	99	132	1320	226650000	2016
676	3	1	0	7	230	30	76	99	132	1320	517530000	2016
677	3	1	0	7	260	30	76	99	132	1320	42445383	2016
678	3	1	0	7	280	30	76	99	133	1320	20000000	2016
679	3	1	0	7	340	30	76	99	133	1320	50630224	2016
680	3	1	0	7	360	30	76	99	133	1320	69440000	2016
681	3	1	0	7	852	30	76	99	133	1320	4083147222	2016
682	3	1	0	7	137	30	76	99	134	1321	115050000	2016
683	3	1	0	7	141	30	76	99	134	1321	157500000	2016
684	3	1	0	7	144	30	76	99	134	1321	110000000	2016
685	3	1	0	7	145	30	76	99	134	1321	846050000	2016
686	3	1	0	7	210	30	76	99	134	1321	54000000	2016
687	3	1	0	7	230	30	76	99	134	1321	23750000	2016
688	3	1	0	7	240	30	76	99	135	1321	148400000	2016
689	3	1	0	7	250	30	76	99	135	1321	289000000	2016
690	3	1	0	7	280	30	76	99	135	1321	203000000	2016
691	3	1	0	7	290	30	76	99	135	1321	200000000	2016
692	3	1	0	7	330	30	76	99	135	1321	800350	2016
693	3	1	0	7	340	30	76	99	135	1321	35216450	2016
694	3	1	0	7	360	30	76	99	136	1321	24000000	2016
695	3	1	0	7	530	30	76	99	136	1321	180000000	2016
696	3	1	0	7	540	30	76	99	136	1321	77100000	2016
697	3	1	0	7	570	30	76	99	136	1321	35950000	2016
698	3	1	0	8	145	30	76	99	137	24	646151660	2016
699	3	1	0	8	220	30	76	99	137	24	406621560	2016
700	3	1	0	8	230	30	76	99	137	24	7702830903	2016
701	3	1	0	8	260	30	76	99	137	24	5902200000	2016
702	3	1	0	8	280	30	76	99	137	24	1140000	2016
703	3	1	0	8	290	30	76	99	137	24	16908474999	2016
704	3	1	0	8	330	30	76	99	138	24	309000000	2016
705	3	1	0	8	340	30	76	99	138	24	20000000	2016
706	3	1	0	8	360	30	76	99	138	24	147648102	2016
707	3	1	0	8	145	30	76	99	139	1181	890000000	2016
708	3	1	0	8	230	30	76	99	139	1181	785158524	2016
709	3	1	0	8	260	30	76	99	139	1181	2714255000	2016
710	3	1	0	8	280	30	76	99	139	1181	7700000	2016
711	3	1	0	8	330	30	76	99	139	1181	18540000	2016
712	3	1	0	8	340	30	76	99	140	1181	69431566	2016
713	3	1	0	8	360	30	76	99	140	1181	304000000	2016
714	3	1	0	8	230	30	76	99	141	1322	525742811	2016
715	3	1	0	8	360	30	76	99	141	1322	101672823	2016
716	3	1	0	8	520	30	76	99	141	1322	9264000000	2016
717	3	1	0	8	530	30	76	99	141	1322	5760384806	2016
718	3	1	0	8	540	30	76	99	141	1322	78800000	2016
719	3	1	0	8	570	30	76	99	142	1322	250000000	2016
720	3	1	0	9	141	30	76	99	143	1181	15166666	2016
721	3	1	0	9	144	30	76	99	143	1181	15166667	2016
722	3	1	0	9	145	30	76	99	143	1181	182000000	2016
723	3	1	0	9	230	30	76	99	143	1181	0	2016
724	3	1	0	9	260	30	76	99	143	1181	985600000	2016
725	3	1	0	9	330	30	76	99	144	1181	40000000	2016
726	3	1	0	9	340	30	76	99	144	1181	60000000	2016
727	3	1	0	9	360	30	76	99	144	1181	0	2016
728	3	1	0	9	520	30	76	99	144	1181	0	2016
729	3	1	0	9	530	30	76	99	144	1181	675000000	2016
730	3	1	0	9	540	30	76	99	144	1181	0	2016
731	3	1	0	9	145	30	76	99	145	1322	40500000	2016
732	3	1	0	9	230	30	76	99	145	1322	158400000	2016
733	3	1	0	9	360	30	76	99	146	1322	24960000	2016
734	3	1	0	9	520	30	76	9	146	1322	4290000000	2016
735	3	1	0	9	520	30	76	99	146	1322	0	2016
736	3	1	0	9	530	30	76	99	146	1322	8741950000	2016
737	3	1	0	9	540	30	76	99	146	1322	200000000	2016
\.


--
-- TOC entry 2764 (class 0 OID 0)
-- Dependencies: 200
-- Name: plan2016_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plan2016_id_seq', 1, false);


--
-- TOC entry 2640 (class 0 OID 17415)
-- Dependencies: 201
-- Data for Name: plan_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plan_detalle (id, plan_id, cc, llamado, proveedor, pac, monto, certificado, detalle_tipo) FROM stdin;
23	36		ADQUISICIÃN DE TEXTOS Y EDICIÃN E IMPRESIÃN DE MATERIALES AD REFERÃNDUM (PROYECTO TEXTOS)		301256	2338020000	0	LL 
21	36	CO-12007-15-114862	LCO SBE NÃÂ° 15/2015 "ADQUISICION DE EQUIPOS PARA DATACENTER"	DATA LAB	290602	284800000	0	RA 
22	36		SERVICIO DE ELABORACIÃÂN Y DISTRIBUCIÃÂN DE ALIMENTOS FRESCOS - PLURIANUAL - 2016/2017		300395	167368760000	10000	LL 
24	1	LP- 12007-14-100372	LPN NÂ° 16/14 "SERVICIO DE TRANSPORTE Y EMBALAJE" PLURIANUAL 2014/2015	CONSORCIO WARD	DFNAFASFASFJASFJASHFJASDHJF	5091187539	0	RA 
25	1		ADQUISICIÃN DE  KITS ESCOLAR 2016/2017  PLURIANUAL  ITEMS DECLARADOS DESIERTOS 2DO. LLAMADO - AD REFERENDUM		301272	1316612872	0	LL 
26	27	CO-12007-15-114862	LCO SBE NÂ° 15/2015 "ADQUISICION DE EQUIPOS PARA DATACENTER"	DATA LAB	290602	284800000	100000	RA 
\.


--
-- TOC entry 2765 (class 0 OID 0)
-- Dependencies: 202
-- Name: plan_detalle2016_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plan_detalle2016_id_seq', 26, true);


--
-- TOC entry 2642 (class 0 OID 17423)
-- Dependencies: 203
-- Data for Name: plan_financiero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plan_financiero (id, presupuesto_id, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, pf10, pf11, pf12) FROM stdin;
11	24	13600000	0	36400000	0	0	0	0	0	0	0	0	0
7	25	0	0	0	0	0	0	222523925	400000000	239342490	0	0	0
8	124	0	127086611	33984984	0	0	0	0	0	0	0	0	0
12	125	0	0	0	0	0	0	0	0	160657510	298723562	0	0
13	183	0	115488846	743535	0	0	0	0	0	0	0	0	0
14	184	0	0	0	0	0	0	0	0	0	104532440	0	0
15	191	0	0	108000000	21600000	0	317081534	277476075	200000000	100000000	150000000	200000000	50000000
16	249	0	0	1682326	0	0	0	0	0	0	0	0	0
17	264	0	0	2426237	0	0	0	0	0	0	0	0	0
18	273	0	0	5265680	0	0	0	0	0	0	0	0	0
19	377	0	0	0	0	74476024	182918466	0	0	0	0	0	0
20	415	0	0	40000000	25000000	30000000	30000000	20000000	20000000	20000000	15000000	8121866	0
21	432	0	0	2850000	1425000	1425000	0	0	0	0	0	0	0
22	485	0	0	107514704	7200000	0	0	0	0	0	0	0	0
23	496	0	0	79836612	58000000	58000000	58000000	58000000	58000000	58000000	58000000	58000000	58000000
25	538	0	0	147000000	72000000	72000000	72000000	22906729	70000000	70000000	70000000	70000000	70000000
26	555	0	0	901605948	300412947	279995659	525308159	279995659	282495662	279995663	140348005	137848005	121934551
27	580	0	0	12000000	0	0	0	0	0	0	0	0	0
28	323	223887860	130696024	0	0	0	0	0	0	0	0	0	0
29	334	0	0	178026024	430059897	0	0	0	0	0	0	0	0
24	503	0	2630850	193119150	269583496	0	0	0	0	0	0	0	0
\.


--
-- TOC entry 2766 (class 0 OID 0)
-- Dependencies: 204
-- Name: plan_financiero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plan_financiero_id_seq', 29, true);


--
-- TOC entry 2644 (class 0 OID 17440)
-- Dependencies: 205
-- Data for Name: presupuesto_vigente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presupuesto_vigente (id, tp, pg, sp, py, obj, ff, of, dpt, carpeta, producto, vigente, aux) FROM stdin;
1	1	1	0	0	111	10	1	99	1	1213	79526426592	1
2	1	1	0	0	112	10	1	99	1	1213	248472000	2
3	1	1	0	0	113	10	1	99	1	1213	38253925200	3
4	1	1	0	0	114	10	1	99	1	1213	9835735316	4
5	1	1	0	0	123	10	1	99	1	1213	2604327905	5
6	1	1	0	0	123	30	1	99	1	1213	360614356	6
7	1	1	0	0	125	10	1	99	2	1213	1442342740	7
8	1	1	0	0	131	10	1	99	2	1213	77442591776	8
9	1	1	0	0	132	10	1	99	2	1213	403060982015	9
10	1	1	0	0	133	10	1	99	2	1213	15312518708	10
11	1	1	0	0	133	30	1	99	2	1213	200000000	11
12	1	1	0	0	134	10	1	99	2	1213	355661282	12
13	1	1	0	0	137	10	1	99	2	1213	788840000	13
14	1	1	0	0	141	10	1	99	3	1213	722610804	14
15	1	1	0	0	143	10	1	99	3	1213	10275898898	15
16	1	1	0	0	144	10	1	99	3	1213	5697517837	16
17	1	1	0	0	144	30	1	99	3	1213	139249877	17
18	1	1	0	0	145	10	1	99	3	1213	2068615444	18
19	1	1	0	0	145	30	1	99	3	1213	43605000	19
20	1	1	0	0	191	10	1	99	3	1213	12533088750	20
21	1	1	0	0	199	10	1	99	4	1213	17754507758	21
22	1	1	0	0	210	10	1	99	4	1213	158270948131	22
23	1	1	0	0	210	30	1	99	4	1213	283500000	23
25	1	1	0	0	230	30	1	99	4	1213	861866415	25
26	1	1	0	0	240	10	1	99	4	1213	163631853	26
27	1	1	0	0	240	30	1	99	5	1213	66522712	27
28	1	1	0	0	240	30	302	99	5	1213	100000000	28
29	1	1	0	0	250	10	1	99	5	1213	9540342416	29
30	1	1	0	0	250	30	1	99	5	1213	1466558625	30
31	1	1	0	0	260	10	1	99	5	1213	1058301497	33
32	1	1	0	0	260	30	1	99	5	1213	61370000	34
33	1	1	0	0	260	30	302	99	5	1213	837953418	35
34	1	1	0	0	280	10	1	99	6	1213	176330455	36
35	1	1	0	0	280	30	1	99	6	1213	75582000	37
37	1	1	0	0	290	10	1	99	6	1213	56863442	38
38	1	1	0	0	290	30	1	99	6	1213	6500000	39
39	1	1	0	0	320	10	1	99	6	1213	68784750	40
40	1	1	0	0	320	30	1	99	7	1213	25000000	41
41	1	1	0	0	330	10	1	99	7	1213	65781540	42
42	1	1	0	0	330	30	1	99	7	1213	673032558	43
43	1	1	0	0	340	10	1	99	7	1213	342247937	44
44	1	1	0	0	340	30	1	99	7	1213	251239362	45
45	1	1	0	0	350	10	1	99	7	1213	10037625	47
47	1	1	0	0	360	10	1	99	8	1213	95372781	48
48	1	1	0	0	360	30	1	99	8	1213	527961105	49
49	1	1	0	0	390	10	1	99	8	1213	8769000	50
52	1	1	0	0	540	10	1	99	8	1213	930391250	51
54	1	1	0	0	540	30	1	99	9	1213	500000000	52
55	1	1	0	0	811	10	126	99	9	1213	669382728	53
56	1	1	0	0	811	10	128	99	9	1213	143161965	54
57	1	1	0	0	811	10	171	11	9	1213	74110453121	55
58	1	1	0	0	811	10	172	10	9	1213	6556707383	56
59	1	1	0	0	811	10	173	12	10	1213	2943906708	57
60	1	1	0	0	811	10	174	7	10	1213	3499808550	58
61	1	1	0	0	811	10	175	1	10	1213	2425607793	59
62	1	1	0	0	811	10	176	4	10	1213	3092978573	60
63	1	1	0	0	811	10	177	5	10	1213	3580783439	61
64	1	1	0	0	811	10	178	14	10	1213	1476280646	62
65	1	1	0	0	811	10	181	99	10	1213	215236600	63
66	1	1	0	0	811	10	182	99	11	1213	500363422	64
67	1	1	0	0	811	30	126	99	11	1213	99235111	65
68	1	1	0	0	834	30	1	99	11	1213	5198659120	67
69	1	1	0	0	841	10	1	99	11	1213	13986350000	68
70	1	1	0	0	851	10	1	99	11	1213	1570470656	70
73	1	1	0	0	861	10	126	99	12	1213	3500000000	71
74	1	1	0	0	861	10	171	11	12	1213	3532367050	73
75	1	1	0	0	894	30	1	99	12	1213	616517680	84
76	1	1	0	0	910	10	1	99	12	1213	2069541161	85
77	1	1	0	0	910	30	1	99	12	1213	235433709	86
82	2	1	1	0	111	10	1	0	15	563	120947485752	99
83	2	1	1	0	111	10	1	1	15	563	90154926828	100
84	2	1	1	0	111	10	1	2	15	563	189654235032	101
85	2	1	1	0	111	10	1	3	15	563	99125971476	102
86	2	1	1	0	111	10	1	4	15	563	84022925772	103
87	2	1	1	0	111	10	1	5	15	563	209569799172	104
88	2	1	1	0	111	10	1	6	15	563	79412908608	105
89	2	1	1	0	111	10	1	7	16	563	166808093220	106
90	2	1	1	0	111	10	1	8	16	563	43955557260	107
91	2	1	1	0	111	10	1	9	16	563	115029877860	108
92	2	1	1	0	111	10	1	10	16	563	182752569912	109
93	2	1	1	0	111	10	1	11	16	563	324549630972	110
94	2	1	1	0	111	10	1	12	16	563	29287142520	111
95	2	1	1	0	111	10	1	13	16	563	32612047212	112
96	2	1	1	0	111	10	1	14	17	563	78015239940	113
24	1	1	0	0	230	10	1	99	4	1213	50000000	0
36	1	1	0	0	280	30	302	99	6	1213	59393500	0
46	1	1	0	0	350	30	302	99	7	1213	50000000	0
50	1	1	0	0	390	30	302	99	8	1213	35642800	0
51	1	1	0	0	520	10	3	99	8	1213	620000000	0
53	1	1	0	0	540	10	3	99	9	1213	1841799999	0
71	1	1	0	0	853	10	1	0	11	1213	1360507665	0
72	1	1	0	0	853	30	1	0	11	1213	233479246	0
97	2	1	1	0	111	10	1	15	17	563	49098604812	114
98	2	1	1	0	111	10	1	16	17	563	7164383964	115
99	2	1	1	0	111	10	1	17	17	563	6100367604	116
100	2	1	1	0	111	10	1	99	17	563	209619816876	117
101	2	1	1	0	114	10	1	0	17	563	10078957146	118
102	2	1	1	0	114	10	1	1	17	563	7512910569	119
103	2	1	1	0	114	10	1	2	18	563	15804519586	120
104	2	1	1	0	114	10	1	3	18	563	8260497623	121
105	2	1	1	0	114	10	1	4	18	563	7001910481	122
106	2	1	1	0	114	10	1	5	18	563	17464149931	123
107	2	1	1	0	114	10	1	6	18	563	6617742384	124
108	2	1	1	0	114	10	1	7	18	563	13900674435	125
109	2	1	1	0	114	10	1	8	18	563	3662963105	126
110	2	1	1	0	114	10	1	9	19	563	9585823155	127
111	2	1	1	0	114	10	1	10	19	563	15229380826	128
112	2	1	1	0	114	10	1	11	19	563	27045802581	129
113	2	1	1	0	114	10	1	12	19	563	2440595210	130
114	2	1	1	0	114	10	1	13	19	563	2717670601	131
115	2	1	1	0	114	10	1	14	19	563	6501269995	132
116	2	1	1	0	114	10	1	15	19	563	4091550401	133
117	2	1	1	0	114	10	1	16	20	563	597031997	134
118	2	1	1	0	114	10	1	17	20	563	508363967	135
119	2	1	1	0	114	10	1	99	20	563	17468318073	136
120	2	1	1	0	123	10	1	99	20	563	218323014	137
121	2	1	1	0	134	10	1	99	20	563	67233196964	138
122	2	1	1	0	199	10	1	99	20	563	3486954163	141
123	2	1	1	0	210	10	1	99	21	563	354099544	142
78	2	1	1	0	220	10	1	99	13	36	18662276743	88
124	2	1	1	0	230	10	1	99	21	563	161071595	143
125	2	1	1	0	230	30	302	99	21	563	459381072	144
126	2	1	1	0	240	10	1	99	21	563	51833600	145
127	2	1	1	0	250	10	1	99	21	563	382079901	147
80	2	1	1	0	330	10	1	99	14	38	1752825630	91
128	2	1	1	0	330	10	1	99	21	563	512320600	150
79	2	1	1	0	340	10	1	99	13	36	46761921320	89
130	2	1	1	0	360	10	1	99	22	563	123319561	153
81	2	1	1	0	530	10	1	99	14	38	3377812431	93
133	2	1	1	0	530	10	3	99	22	563	13505894924	158
134	2	1	1	0	540	10	1	99	22	563	914433177	160
137	2	1	1	0	848	10	1	99	24	1312	96629329837	168
143	2	1	2	0	111	10	1	0	27	561	109812990552	171
144	2	1	2	0	111	10	1	1	27	561	27028167708	172
145	2	1	2	0	111	10	1	2	28	561	64195324680	173
146	2	1	2	0	111	10	1	3	28	561	41618607768	174
147	2	1	2	0	111	10	1	4	28	561	27253520784	175
148	2	1	2	0	111	10	1	5	28	561	71060258976	176
149	2	1	2	0	111	10	1	6	28	561	23163278280	177
150	2	1	2	0	111	10	1	7	28	561	48293509812	178
151	2	1	2	0	111	10	1	8	29	561	24904961268	179
152	2	1	2	0	111	10	1	9	29	561	41900168376	180
153	2	1	2	0	111	10	1	10	29	561	48607939776	181
154	2	1	2	0	111	10	1	11	29	561	126035972052	182
155	2	1	2	0	111	10	1	12	29	561	15401493492	183
156	2	1	2	0	111	10	1	13	29	561	10330178340	184
157	2	1	2	0	111	10	1	14	29	561	18124229520	185
158	2	1	2	0	111	10	1	15	30	561	13301480772	186
159	2	1	2	0	111	10	1	16	30	561	3281783940	187
160	2	1	2	0	111	10	1	17	30	561	2809517940	188
161	2	1	2	0	111	10	1	99	30	561	107349033384	189
162	2	1	2	0	114	10	1	0	30	561	9151082546	190
163	2	1	2	0	114	10	1	1	30	561	2252347309	191
164	2	1	2	0	114	10	1	2	30	561	5349610390	192
165	2	1	2	0	114	10	1	3	31	561	3468217314	193
166	2	1	2	0	114	10	1	4	31	561	2271126732	194
167	2	1	2	0	114	10	1	5	31	561	5921688248	195
168	2	1	2	0	114	10	1	6	31	561	1930273190	196
169	2	1	2	0	114	10	1	7	31	561	4024459151	197
170	2	1	2	0	114	10	1	8	31	561	2075413439	198
171	2	1	2	0	114	10	1	9	31	561	3491680698	199
172	2	1	2	0	114	10	1	10	32	561	4050661648	200
173	2	1	2	0	114	10	1	11	32	561	10502997671	201
174	2	1	2	0	114	10	1	12	32	561	1283457791	202
175	2	1	2	0	114	10	1	13	32	561	860848195	203
176	2	1	2	0	114	10	1	14	32	561	1510352460	204
177	2	1	2	0	114	10	1	15	32	561	1108456731	205
178	2	1	2	0	114	10	1	16	32	561	273481995	206
179	2	1	2	0	114	10	1	17	33	561	234126495	207
180	2	1	2	0	114	10	1	99	33	561	8945752782	208
181	2	1	2	0	134	10	1	99	33	561	8026547473	209
182	2	1	2	0	199	10	1	99	33	561	14521100	210
141	2	1	2	0	220	10	1	99	26	36	833157744	169
183	2	1	2	0	230	10	1	99	33	561	116232381	211
185	2	1	2	0	240	10	1	99	34	561	48360000	212
129	2	1	1	0	340	30	302	99	22	563	739995817	0
131	2	1	1	0	510	10	1	99	22	563	112000000	0
132	2	1	1	0	510	10	3	99	22	563	1492953480	0
135	2	1	1	0	834	10	1	99	23	1032	23347500000	0
136	2	1	1	0	894	10	1	99	23	1032	3500000000	0
138	2	1	1	0	520	10	1	99	24	1318	2517317554	0
139	2	1	1	0	520	10	3	99	24	1318	3955884415	0
140	2	1	1	0	520	10	1	99	25	1322	2300000000	0
184	2	1	2	0	230	30	302	99	33	561	104532440	0
142	2	1	2	0	340	10	1	99	27	36	14968031721	170
186	2	1	2	0	360	10	1	99	34	561	966515	215
187	2	1	2	0	540	10	1	99	34	561	203707987	217
194	2	1	3	0	111	10	1	0	38	561	3671886540	236
195	2	1	3	0	111	10	1	1	38	561	888674880	237
196	2	1	3	0	111	10	1	2	38	561	2857274472	238
197	2	1	3	0	111	10	1	3	38	561	2379971220	239
198	2	1	3	0	111	10	1	4	38	561	501509040	240
199	2	1	3	0	111	10	1	5	38	561	2563263192	241
200	2	1	3	0	111	10	1	6	38	561	1623003552	242
201	2	1	3	0	111	10	1	7	39	561	1561008336	243
202	2	1	3	0	111	10	1	8	39	561	2975506404	244
203	2	1	3	0	111	10	1	9	39	561	2768002464	245
204	2	1	3	0	111	10	1	10	39	561	133607760	246
205	2	1	3	0	111	10	1	11	39	561	219998160	247
206	2	1	3	0	111	10	1	12	39	561	397934976	248
207	2	1	3	0	111	10	1	13	39	561	164807760	249
208	2	1	3	0	111	10	1	14	40	561	454707264	250
209	2	1	3	0	111	10	1	15	40	561	793928520	251
210	2	1	3	0	111	10	1	16	40	561	41990400	252
211	2	1	3	0	111	10	1	99	40	561	4418127984	253
212	2	1	3	0	113	10	1	0	40	561	31104000	254
213	2	1	3	0	113	10	1	99	40	561	522000000	255
214	2	1	3	0	114	10	1	0	40	561	308582545	256
215	2	1	3	0	114	10	1	1	41	561	74056240	257
216	2	1	3	0	114	10	1	2	41	561	238106206	258
217	2	1	3	0	114	10	1	3	41	561	198330935	259
218	2	1	3	0	114	10	1	4	41	561	41792420	260
219	2	1	3	0	114	10	1	5	41	561	213605266	261
220	2	1	3	0	114	10	1	6	41	561	135250296	262
221	2	1	3	0	114	10	1	7	41	561	130084028	263
222	2	1	3	0	114	10	1	8	42	561	247958867	264
223	2	1	3	0	114	10	1	9	42	561	230666872	265
224	2	1	3	0	114	10	1	10	42	561	11133980	266
225	2	1	3	0	114	10	1	11	42	561	18333180	267
226	2	1	3	0	114	10	1	12	42	561	33161248	268
227	2	1	3	0	114	10	1	13	42	561	13733980	269
228	2	1	3	0	114	10	1	14	42	561	37892272	270
229	2	1	3	0	114	10	1	15	43	561	66160710	271
230	2	1	3	0	114	10	1	16	43	561	3499200	272
231	2	1	3	0	114	10	1	99	43	561	411677332	273
232	2	1	3	0	123	10	1	99	43	561	259561282	274
193	2	1	3	0	123	10	1	99	37	1224	6100000	286
233	2	1	3	0	125	10	1	99	43	561	65699999	275
234	2	1	3	0	134	10	1	99	43	561	298900222	276
190	2	1	3	0	144	10	1	99	37	24	289094810	228
191	2	1	3	0	230	10	1	99	37	24	1424157609	230
237	2	1	3	0	360	10	1	99	44	561	81675000	279
238	2	1	3	0	530	10	1	99	44	561	5000000	281
239	2	1	3	0	540	10	1	99	44	561	28800000	283
240	2	1	3	0	834	30	1	99	45	561	3102670800	284
241	2	1	3	0	894	30	1	99	45	561	344741200	285
242	2	1	4	0	111	10	1	99	47	61	8427518736	294
243	2	1	4	0	113	10	1	99	47	61	25972800	295
244	2	1	4	0	114	10	1	99	47	61	704457628	296
245	2	1	4	0	134	10	1	99	47	61	95228113	297
246	2	1	4	0	144	10	1	99	47	61	25412500	299
247	2	1	4	0	191	10	1	99	47	61	14382000	301
248	2	1	4	0	210	10	1	99	48	61	34352640	302
249	2	1	4	0	230	10	1	99	48	61	1682326	303
250	2	1	4	0	240	10	1	99	48	61	4262440	304
251	2	1	4	0	250	10	1	99	48	61	40000000	305
252	2	1	4	0	280	10	1	99	48	61	6523044	306
253	2	1	4	0	834	30	1	99	48	61	606430800	307
254	2	1	4	0	894	30	1	99	49	61	67381200	308
255	2	1	5	0	210	10	1	99	50	1230	40000000	309
256	2	1	5	0	260	10	1	99	50	1230	548101632	310
257	2	1	5	0	280	10	1	99	50	1230	8835000	311
258	2	1	5	0	290	10	1	99	50	1230	25000000	312
259	2	1	5	0	540	10	1	99	50	1230	13692154	313
260	2	1	6	0	111	10	1	99	51	61	5470041624	314
261	2	1	6	0	114	10	1	99	51	61	455836802	315
269	2	1	7	0	111	10	1	99	53	61	8993610252	323
270	2	1	7	0	113	10	1	99	53	61	25972800	324
271	2	1	7	0	114	10	1	99	53	61	751631921	325
272	2	1	7	0	134	10	1	99	53	61	103782169	326
273	2	1	7	0	230	10	1	99	53	61	5265680	327
274	2	1	7	0	834	30	1	99	54	61	4319185050	328
275	2	1	7	0	894	30	1	99	54	61	479909450	329
279	2	1	8	0	111	10	1	0	56	77	36936163608	332
280	2	1	8	0	111	10	1	1	56	77	4934584296	333
188	2	1	2	0	834	10	1	99	35	1032	11206345400	0
189	2	1	2	0	894	10	1	99	35	1032	11272045400	0
192	2	1	3	0	540	10	1	99	37	24	10100000	0
235	2	1	3	0	145	10	1	99	43	561	338444517	0
236	2	1	3	0	199	10	1	99	44	561	655617873	0
262	2	1	6	0	123	10	1	0	51	61	804100	0
263	2	1	6	0	134	10	1	0	51	61	77394890	0
264	2	1	6	0	230	10	1	0	51	61	2426237	0
265	2	1	6	0	530	10	1	0	52	61	17508161	0
266	2	1	6	0	540	10	1	0	52	61	10900000	0
267	2	1	6	0	834	30	1	0	52	61	700253550	0
268	2	1	6	0	894	30	1	0	52	61	77805950	0
278	2	1	8	0	260	10	1	99	56	38	1935226721	0
281	2	1	8	0	111	10	1	2	57	77	6315270600	334
282	2	1	8	0	111	10	1	3	57	77	6927372804	335
283	2	1	8	0	111	10	1	4	57	77	4016472900	336
284	2	1	8	0	111	10	1	5	57	77	4955559444	337
285	2	1	8	0	111	10	1	6	57	77	4830715908	338
286	2	1	8	0	111	10	1	7	57	77	3812977620	339
287	2	1	8	0	111	10	1	8	58	77	3512546964	340
288	2	1	8	0	111	10	1	9	58	77	3165202524	341
289	2	1	8	0	111	10	1	10	58	77	6040147776	342
290	2	1	8	0	111	10	1	11	58	77	12378870324	343
291	2	1	8	0	111	10	1	12	58	77	1941930408	344
292	2	1	8	0	111	10	1	13	58	77	3164204256	345
293	2	1	8	0	111	10	1	14	58	77	2144226744	346
294	2	1	8	0	111	10	1	15	59	77	2206540512	347
295	2	1	8	0	111	10	1	16	59	77	824956248	348
296	2	1	8	0	111	10	1	17	59	77	806102376	349
297	2	1	8	0	111	10	1	99	59	77	73546809312	350
298	2	1	8	0	114	10	1	0	59	77	3078013634	351
299	2	1	8	0	114	10	1	1	59	77	411215358	352
300	2	1	8	0	114	10	1	2	59	77	526272550	353
301	2	1	8	0	114	10	1	3	60	77	577281067	354
302	2	1	8	0	114	10	1	4	60	77	334706075	355
303	2	1	8	0	114	10	1	5	60	77	412963287	356
304	2	1	8	0	114	10	1	6	60	77	402559659	357
305	2	1	8	0	114	10	1	7	60	77	317748135	358
306	2	1	8	0	114	10	1	8	60	77	292712247	359
307	2	1	8	0	114	10	1	9	60	77	263766877	360
308	2	1	8	0	114	10	1	10	61	77	503345648	361
309	2	1	8	0	114	10	1	11	61	77	1031572527	362
310	2	1	8	0	114	10	1	12	61	77	161827534	363
311	2	1	8	0	114	10	1	13	61	77	263683688	364
312	2	1	8	0	114	10	1	14	61	77	178685562	365
313	2	1	8	0	114	10	1	15	61	77	183878376	366
314	2	1	8	0	114	10	1	16	61	77	68746354	367
315	2	1	8	0	114	10	1	17	62	77	67175198	368
316	2	1	8	0	114	10	1	99	62	77	6128900776	369
317	2	1	8	0	123	10	1	99	62	77	187140408	370
318	2	1	8	0	125	10	1	99	62	77	144722501	371
319	2	1	8	0	134	10	1	99	62	77	2362837205	372
320	2	1	8	0	144	10	1	99	62	77	61588995	375
332	2	1	8	0	144	10	1	99	65	1158	148616940	394
321	2	1	8	0	145	10	1	99	62	77	176255216	376
333	2	1	8	0	145	10	1	99	65	1158	220744056	395
322	2	1	8	0	199	10	1	99	63	77	866052644	377
276	2	1	8	0	220	10	1	99	55	36	153072629	330
323	2	1	8	0	230	10	1	99	63	77	494670000	378
334	2	1	8	0	230	10	1	99	65	1158	803550000	396
324	2	1	8	0	240	10	1	99	63	77	19222484	379
335	2	1	8	0	240	10	1	99	66	1158	52342980	397
325	2	1	8	0	280	10	1	99	63	77	55000000	381
336	2	1	8	0	280	10	1	99	66	1158	28215000	398
326	2	1	8	0	330	10	1	99	63	77	51127377	382
337	2	1	8	0	330	10	1	99	66	1158	1790805135	399
277	2	1	8	0	340	10	1	99	55	36	2509506830	331
327	2	1	8	0	360	10	1	99	64	77	24394212	384
338	2	1	8	0	360	10	1	99	66	1158	429943788	400
328	2	1	8	0	520	10	1	99	64	77	20000000	385
329	2	1	8	0	540	10	1	99	64	77	316250000	387
330	2	1	8	0	834	30	1	99	64	77	2989435500	388
331	2	1	8	0	894	30	1	99	64	77	332159500	390
341	2	1	9	0	111	10	1	1	68	561	7986467412	403
342	2	1	9	0	111	10	1	4	68	561	5986921908	404
343	2	1	9	0	111	10	1	7	68	561	7113314892	405
344	2	1	9	0	111	10	1	10	68	561	6759675660	406
345	2	1	9	0	111	10	1	11	68	561	7324141968	407
346	2	1	9	0	111	10	1	12	68	561	4615906248	408
347	2	1	9	0	111	10	1	13	68	561	5409995724	409
348	2	1	9	0	111	10	1	99	69	561	4597547952	410
349	2	1	9	0	113	10	1	1	69	561	2160000	411
350	2	1	9	0	113	10	1	4	69	561	2160000	412
351	2	1	9	0	113	10	1	7	69	561	2160000	413
352	2	1	9	0	113	10	1	10	69	561	2160000	414
353	2	1	9	0	113	10	1	11	69	561	4320000	415
354	2	1	9	0	113	10	1	12	69	561	2160000	416
355	2	1	9	0	113	10	1	13	70	561	2160000	417
356	2	1	9	0	114	10	1	1	70	561	665718951	418
357	2	1	9	0	114	10	1	4	70	561	499090159	419
358	2	1	9	0	114	10	1	7	70	561	592956241	420
359	2	1	9	0	114	10	1	10	70	561	563486305	421
360	2	1	9	0	114	10	1	11	70	561	610705164	422
361	2	1	9	0	114	10	1	12	70	561	384838854	423
362	2	1	9	0	114	10	1	13	71	561	451012977	424
363	2	1	9	0	114	10	1	99	71	561	383128996	425
364	2	1	9	0	134	10	1	99	71	561	511643317	426
365	2	1	9	0	834	30	1	99	71	561	692632350	427
366	2	1	9	0	894	30	1	99	71	561	76959150	428
367	2	1	10	0	111	10	1	99	72	561	6563127840	429
368	2	1	10	0	113	10	1	99	72	561	79593600	430
369	2	1	10	0	114	10	1	99	72	561	553560120	431
370	2	1	10	0	123	10	1	99	72	561	110341630	432
339	2	1	8	0	540	10	1	99	67	1158	116875000	0
340	2	1	8	0	847	10	1	99	67	1158	2000000000	0
371	2	1	10	0	125	10	1	99	72	561	83950000	0
372	2	1	10	0	134	10	1	99	72	561	61548519	433
373	2	1	10	0	145	10	1	99	73	561	457224100	435
374	2	1	10	0	191	10	1	99	73	561	26400000	436
375	2	1	10	0	199	10	1	99	73	561	39763919	437
376	2	1	10	0	210	10	1	99	73	561	852699984	438
377	2	1	10	0	230	10	1	99	73	561	257394490	439
378	2	1	10	0	240	10	1	99	73	561	80000000	440
379	2	1	10	0	280	10	1	99	74	561	52023186	442
380	2	1	10	0	330	10	1	99	74	561	69608990	444
381	2	1	10	0	360	10	1	99	74	561	58981015	446
382	2	1	10	0	540	10	1	99	74	561	247277500	448
385	2	1	10	0	540	10	1	99	76	1210	247277500	452
386	2	1	11	0	111	10	1	99	77	561	2017777320	453
387	2	1	11	0	113	10	1	99	77	561	79593600	454
388	2	1	11	0	114	10	1	99	77	561	174780910	455
389	2	1	11	0	123	10	1	99	77	561	108038651	456
390	2	1	11	0	125	10	1	99	77	561	129034712	457
391	2	1	11	0	191	10	1	99	77	561	96000000	458
393	2	1	11	0	210	10	1	99	78	561	56000000	459
394	2	1	11	0	290	10	1	99	78	561	18136558	461
395	2	1	11	0	340	10	1	99	78	561	8807575	462
396	2	1	11	0	360	10	1	99	78	561	4198813	463
397	2	1	11	0	540	10	1	99	78	561	41392000	465
398	2	1	14	0	123	10	1	99	79	1228	57789565	466
399	2	1	14	0	125	10	1	99	79	1228	23793423	467
400	2	1	14	0	145	30	302	99	80	1228	141497755	469
401	2	1	14	0	240	10	1	99	80	1228	77968526	471
402	2	1	14	0	280	30	302	99	80	1228	56149903	474
404	2	1	14	0	360	10	1	99	80	1228	109324883	477
405	2	1	14	0	540	10	1	99	81	1228	33037500	478
406	2	1	14	0	851	10	1	99	81	1228	70000000	479
407	2	1	15	0	111	10	1	99	82	1229	812400000	480
408	2	1	15	0	112	10	1	99	82	1229	527443200	481
409	2	1	15	0	113	10	1	99	82	1229	27648000	482
410	2	1	15	0	114	10	1	99	82	1229	113957600	483
411	2	1	15	0	131	10	1	99	82	1229	7000000	484
412	2	1	15	0	133	10	1	99	82	1229	178923077	485
413	2	1	15	0	191	10	1	99	82	1229	38400000	488
414	2	1	15	0	210	10	1	99	83	1229	50400000	490
415	2	1	15	0	230	10	1	99	83	1229	208121866	491
416	2	1	15	0	260	10	1	99	83	1229	139350001	493
417	2	1	15	0	290	10	1	99	83	1229	50000000	495
418	2	1	15	0	330	10	1	99	83	1229	10500000	497
419	2	1	15	0	340	10	1	99	83	1229	13600000	498
420	2	1	15	0	360	10	1	99	84	1229	19032300	500
421	2	1	15	0	530	10	1	99	84	1229	3750000	501
422	2	1	15	0	540	10	1	99	84	1229	20875000	502
423	3	1	0	1	123	10	1	99	85	542	198596617	525
424	3	1	0	1	125	10	1	99	85	542	198269256	526
425	3	1	0	1	137	10	1	99	85	542	72792263	527
426	3	1	0	1	137	20	401	99	85	542	357903624	528
462	3	1	0	1	137	20	401	99	91	926	37487520	552
427	3	1	0	1	141	10	1	99	85	542	195024238	529
428	3	1	0	1	141	20	401	99	85	542	401256648	530
429	3	1	0	1	144	10	1	99	85	542	578938752	531
463	3	1	0	1	144	10	1	99	91	926	37940344	553
430	3	1	0	1	145	10	1	99	86	542	710254738	532
464	3	1	0	1	145	10	1	99	91	926	136092880	554
431	3	1	0	1	145	20	401	99	86	542	3593788440	533
465	3	1	0	1	145	20	401	99	91	926	834564800	555
432	3	1	0	1	230	10	1	99	86	542	5700000	535
433	3	1	0	1	230	20	401	99	86	542	360365000	536
466	3	1	0	1	230	20	401	99	91	926	1208470000	557
434	3	1	0	1	240	10	1	99	86	542	39000000	537
435	3	1	0	1	240	20	401	99	86	542	390000000	538
436	3	1	0	1	250	10	1	99	87	542	554220000	539
437	3	1	0	1	260	10	1	99	87	542	160248920	540
467	3	1	0	1	260	10	1	99	92	926	339312000	560
438	3	1	0	1	260	20	401	99	87	542	3833120000	541
468	3	1	0	1	260	20	401	99	92	926	2562489200	561
439	3	1	0	1	280	10	1	99	87	542	23500000	542
440	3	1	0	1	280	20	401	99	87	542	235000000	543
469	3	1	0	1	290	10	1	99	92	926	88110500	562
470	3	1	0	1	290	20	401	99	92	926	880000852	563
443	3	1	0	1	330	10	1	99	88	542	8472000	544
471	3	1	0	1	330	10	1	99	92	926	4732727	564
444	3	1	0	1	330	20	401	99	88	542	84720000	545
383	2	1	10	0	834	10	1	99	75	561	409380064	0
384	2	1	10	0	330	10	1	99	75	1210	276423035	0
392	2	1	11	0	199	10	1	99	77	561	2799441	0
403	2	1	14	0	340	10	1	99	80	1228	240000000	0
441	3	1	0	1	290	10	1	99	87	542	4000000	0
442	3	1	0	1	290	20	401	99	87	542	40000000	0
451	3	1	0	1	520	20	401	99	89	542	5000000000	0
452	3	1	0	1	540	10	1	99	89	542	212000000	0
453	3	1	0	1	540	20	401	99	89	542	300000000	0
454	3	1	0	1	570	10	1	99	89	542	6000000	0
455	3	1	0	1	570	20	401	99	89	542	60000000	0
456	3	1	0	1	847	20	401	99	90	542	167000000	0
457	3	1	0	1	852	20	401	99	90	542	380000000	0
458	3	1	0	1	881	20	401	99	90	542	15000000000	0
459	3	1	0	1	960	10	1	99	90	542	16818182	0
460	3	1	0	1	960	20	401	99	90	542	168181818	0
461	3	1	0	1	137	10	1	99	91	926	3123960	0
472	3	1	0	1	330	20	401	99	92	926	47327273	565
445	3	1	0	1	340	10	1	99	88	542	17000000	546
446	3	1	0	1	340	20	401	99	88	542	170000000	547
447	3	1	0	1	350	10	1	99	88	542	5000000	548
448	3	1	0	1	360	20	401	99	88	542	250000000	549
449	3	1	0	1	390	10	1	99	88	542	4200000	550
450	3	1	0	1	390	20	401	99	89	542	42000000	551
475	3	1	0	1	834	20	401	99	93	926	3120000000	573
476	3	1	0	1	847	20	401	99	93	926	7333000000	574
477	3	1	0	1	894	20	401	99	93	926	20128019528	576
481	3	1	0	3	141	30	76	99	96	336	1767262332	580
482	3	1	0	3	144	30	76	99	96	336	215150000	581
483	3	1	0	3	145	30	76	99	96	336	3077378167	582
484	3	1	0	3	220	30	76	99	96	336	400000000	583
485	3	1	0	3	230	30	76	99	96	336	114714704	584
486	3	1	0	3	260	30	76	99	96	336	1519387000	585
487	3	1	0	3	330	30	76	99	97	336	1372000	588
488	3	1	0	3	340	30	76	99	97	336	23864000	589
489	3	1	0	3	350	30	76	99	97	336	43350000	590
490	3	1	0	3	360	30	76	99	97	336	30000000	591
491	3	1	0	3	520	30	76	99	97	336	2182481450	592
492	3	1	0	3	530	30	76	99	97	336	3760993243	593
493	3	1	0	3	540	30	76	99	98	336	365452550	594
495	3	1	0	3	848	30	76	99	99	1312	1572480000	596
494	3	1	0	3	853	30	76	99	98	336	1801407825	595
496	3	1	0	4	230	30	76	99	100	1181	601836612	597
497	3	1	0	4	260	30	76	99	100	1181	1407000000	598
498	3	1	0	4	360	30	76	99	100	1181	151200000	599
499	3	1	0	4	520	30	76	99	101	1317	23856612277	600
500	3	1	0	4	520	30	76	99	101	1318	1930374189	601
502	3	1	0	5	145	30	76	99	102	1181	780000000	603
503	3	1	0	5	230	30	76	99	103	1181	1008000000	604
505	3	1	0	5	260	30	76	99	103	1181	160000000	605
506	3	1	0	5	360	30	76	99	103	1181	332136000	606
507	3	1	0	5	520	30	76	99	104	1317	59280575722	608
508	3	1	0	5	520	30	76	99	104	1318	13258000000	609
509	3	1	0	5	530	30	76	99	105	1319	5990439000	610
510	3	1	0	8	145	30	76	99	106	24	91000000	698
523	3	1	0	8	145	30	76	99	109	1181	709591571	707
511	3	1	0	8	220	30	76	99	106	24	417421560	699
512	3	1	0	8	230	30	76	99	106	24	5786754029	700
473	3	1	0	1	530	10	1	99	93	926	5000000	0
474	3	1	0	1	530	20	401	99	93	926	50000000	0
478	3	1	0	2	530	30	513	99	94	1319	1409144584	0
479	3	1	0	2	540	30	513	99	94	1319	11675726437	0
480	3	1	0	2	520	30	513	99	95	1322	7148289927	0
501	3	1	0	5	141	30	76	99	102	1181	126000000	0
504	3	1	0	5	240	30	76	99	103	1181	36000000	0
519	3	1	0	8	390	30	76	99	107	24	281100000	0
520	3	1	0	8	540	30	76	99	107	24	30000000	0
521	3	1	0	8	834	30	76	99	108	24	650000000	0
522	3	1	0	8	852	30	76	99	108	24	11374649897	0
530	3	1	0	8	530	30	76	99	110	1181	7550000	0
531	3	1	0	8	540	30	76	99	110	1181	764725000	0
532	3	1	0	8	570	30	76	99	110	1181	24000000	0
535	3	1	0	9	141	30	76	99	112	336	5329436680	0
536	3	1	0	9	144	30	76	99	112	336	196625000	0
537	3	1	0	9	145	30	76	99	112	336	3041333333	0
538	3	1	0	9	230	30	76	99	112	336	735906729	0
539	3	1	0	9	240	30	76	99	112	336	100000000	0
540	3	1	0	9	250	30	76	99	112	336	180000000	0
541	3	1	0	9	260	30	76	99	113	336	3614000000	0
542	3	1	0	9	280	30	76	99	113	336	136400000	0
543	3	1	0	9	320	30	76	99	113	336	544000000	0
544	3	1	0	9	330	30	76	99	113	336	142700000	0
545	3	1	0	9	340	30	76	99	113	336	410180000	0
546	3	1	0	9	350	30	76	99	113	336	100000000	0
547	3	1	0	9	360	30	76	99	114	336	127440000	0
548	3	1	0	9	520	30	76	99	114	336	19824150000	0
549	3	1	0	9	530	30	76	99	114	336	18081210000	0
550	3	1	0	9	540	30	76	99	114	336	1031600000	0
551	3	1	0	9	852	30	76	99	114	336	2837229987	0
552	3	1	0	10	137	30	76	99	116	24	327600000	0
553	3	1	0	10	141	30	76	99	116	24	204400000	0
554	3	1	0	10	145	30	76	99	116	24	3310552552	0
555	3	1	0	10	230	30	76	99	116	24	3249940258	0
556	3	1	0	10	240	30	76	99	116	24	903524408	0
557	3	1	0	10	250	30	76	99	116	24	540000000	0
558	3	1	0	10	260	30	76	99	117	24	13204567279	0
559	3	1	0	10	280	30	76	99	117	24	326957145	0
560	3	1	0	10	290	30	76	99	117	24	451250000	0
561	3	1	0	10	340	30	76	99	117	24	383543750	0
562	3	1	0	10	360	30	76	99	117	24	160848307	0
563	3	1	0	10	390	30	76	99	117	24	5000000	0
564	3	1	0	10	852	30	76	99	118	24	3160128291	0
565	3	1	0	10	220	30	76	99	118	1319	14062500	0
566	3	1	0	10	250	30	76	99	118	1319	515000000	0
567	3	1	0	10	520	30	76	99	119	1319	68780305	0
568	3	1	0	10	530	30	76	99	119	1319	10715226876	0
569	3	1	0	10	540	30	76	99	119	1319	50151076023	0
570	3	1	0	10	570	30	76	99	119	1319	2991000593	0
571	3	1	0	11	220	30	76	99	120	38	3876526200	0
572	3	1	0	11	260	30	76	99	120	38	653500000	0
573	3	1	0	11	330	30	76	99	120	38	40186148457	0
574	3	1	0	11	852	30	76	99	121	38	471240000	0
575	3	2	0	1	141	30	76	99	122	1181	536823000	0
576	3	2	0	1	144	30	76	99	122	1181	1930826293	0
577	3	2	0	1	145	30	76	99	122	1181	708375000	0
578	3	2	0	1	210	30	76	99	122	1181	54000000	0
579	3	2	0	1	220	30	76	99	122	1181	1484500	0
580	3	2	0	1	230	30	76	99	122	1181	12000000	0
581	3	2	0	1	240	30	76	99	123	1181	10500000	0
582	3	2	0	1	250	30	76	99	123	1181	277200000	0
583	3	2	0	1	260	30	76	99	123	1181	287224500	0
584	3	2	0	1	280	30	76	99	123	1181	33576480	0
585	3	2	0	1	340	30	76	99	123	1181	16470000	0
586	3	2	0	1	360	30	76	99	123	1181	14067900	0
587	3	2	0	1	530	30	76	99	124	1181	785400	0
588	3	2	0	1	540	30	76	99	124	1181	1219105850	0
589	3	2	0	1	852	30	76	99	124	1181	350000000	0
590	3	2	0	2	123	30	76	99	125	1181	37537500	0
591	3	2	0	2	125	30	76	99	125	1181	26812500	0
592	3	2	0	2	137	30	76	99	125	1181	40125000	0
593	3	2	0	2	141	30	76	99	125	1181	101000000	0
594	3	2	0	2	145	30	76	99	125	1181	354912388	0
595	3	2	0	2	260	30	76	99	125	1181	105000000	0
596	3	2	0	2	852	30	76	99	126	1181	5000000	0
597	3	2	0	2	144	30	76	99	126	1320	144000000	0
598	3	2	0	2	220	30	76	99	127	1320	5000000	0
599	3	2	0	2	230	30	76	99	127	1320	397400000	0
600	3	2	0	2	260	30	76	99	127	1320	937131682	0
601	3	2	0	2	280	30	76	99	127	1320	3000000	0
602	3	2	0	2	330	30	76	99	127	1320	4800000	0
603	3	2	0	2	340	30	76	99	127	1320	46530000	0
604	3	2	0	2	360	30	76	99	128	1320	29440000	0
605	3	2	0	2	390	30	76	99	128	1320	6000000	0
606	3	2	0	2	852	30	76	99	128	1320	100000000	0
607	3	2	0	2	141	30	76	99	129	1321	126333334	0
608	3	2	0	2	144	30	76	99	129	1321	104975000	0
609	3	2	0	2	145	30	76	99	129	1321	915820945	0
610	3	2	0	2	210	30	76	99	129	1321	54000000	0
611	3	2	0	2	230	30	76	99	129	1321	9600000	0
612	3	2	0	2	240	30	76	99	129	1321	52315080	0
613	3	2	0	2	250	30	76	99	130	1321	257352160	0
614	3	2	0	2	260	30	76	99	130	1321	55000000	0
615	3	2	0	2	330	30	76	99	130	1321	8910000	0
616	3	2	0	2	340	30	76	99	130	1321	41990135	0
617	3	2	0	2	360	30	76	99	130	1321	24000000	0
618	3	2	0	2	530	30	76	99	131	1321	226035000	0
619	3	2	0	2	540	30	76	99	131	1321	251500000	0
620	3	2	0	2	852	30	76	99	131	1321	120000000	0
524	3	1	0	8	230	30	76	99	109	1181	988532659	708
513	3	1	0	8	260	30	76	99	106	24	4464381592	701
525	3	1	0	8	260	30	76	99	109	1181	2981000000	709
514	3	1	0	8	280	30	76	99	106	24	19800000	702
526	3	1	0	8	280	30	76	99	109	1181	16500000	710
515	3	1	0	8	290	30	76	99	106	24	29109813653	703
516	3	1	0	8	330	30	76	99	107	24	2980622883	704
527	3	1	0	8	330	30	76	99	109	1181	858000	711
517	3	1	0	8	340	30	76	99	107	24	870000000	705
528	3	1	0	8	340	30	76	99	110	1181	84946866	712
518	3	1	0	8	360	30	76	99	107	24	335135695	706
529	3	1	0	8	360	30	76	99	110	1181	187593600	713
533	3	1	0	8	520	30	76	99	111	1322	13872000000	716
534	3	1	0	8	530	30	76	99	111	1322	814453922	717
\.


--
-- TOC entry 2767 (class 0 OID 0)
-- Dependencies: 206
-- Name: presupuesto_vigente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('presupuesto_vigente_id_seq', 620, true);


--
-- TOC entry 2656 (class 0 OID 17621)
-- Dependencies: 218
-- Data for Name: presupuesto_vigente_tmp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presupuesto_vigente_tmp (id, tp, pg, sp, py, obj, ff, of, dpt, carpeta, producto, vigente, aux) FROM stdin;
1	1	1	0	0	111	10	1	99	1	1213	75444137532	0
2	1	1	0	0	112	10	1	99	1	1213	248472000	0
3	1	1	0	0	113	10	1	99	1	1213	38020170000	0
4	1	1	0	0	114	10	1	99	1	1213	9476064961	0
5	1	1	0	0	123	10	1	99	1	1213	1570241453	0
6	1	1	0	0	123	30	1	99	1	1213	360614356	0
7	1	1	0	0	125	10	1	99	2	1213	1755192614	0
8	1	1	0	0	131	10	1	99	2	1213	77442591776	0
9	1	1	0	0	132	10	1	99	2	1213	301532949447	0
10	1	1	0	0	133	10	1	99	2	1213	15632561536	0
11	1	1	0	0	133	30	1	99	2	1213	200000000	0
12	1	1	0	0	134	10	1	99	2	1213	355661282	0
13	1	1	0	0	137	10	1	99	2	1213	782000000	0
14	1	1	0	0	141	10	1	99	3	1213	717154786	0
15	1	1	0	0	143	10	1	99	3	1213	10275000000	0
16	1	1	0	0	144	10	1	99	3	1213	7892906231	0
17	1	1	0	0	144	30	1	99	3	1213	90105038	0
18	1	1	0	0	145	10	1	99	3	1213	2278600157	0
19	1	1	0	0	145	30	1	99	3	1213	43605000	0
20	1	1	0	0	191	10	1	99	3	1213	12533088750	0
21	1	1	0	0	199	10	1	99	4	1213	9006222231	0
22	1	1	0	0	210	10	1	99	4	1213	32715954350	0
23	1	1	0	0	210	30	1	99	4	1213	283500000	0
24	1	1	0	0	220	10	1	99	4	1213	380065000	0
25	1	1	0	0	230	30	1	99	4	1213	909575175	0
26	1	1	0	0	240	10	1	99	4	1213	248930094	0
27	1	1	0	0	240	30	1	99	5	1213	102450000	0
28	1	1	0	0	240	30	302	99	5	1213	500000000	0
29	1	1	0	0	250	10	1	99	5	1213	4771520664	0
30	1	1	0	0	250	30	1	99	5	1213	1466558625	0
31	1	1	0	0	250	30	302	10	5	1213	0	0
32	1	1	0	0	250	30	302	99	5	1213	0	0
33	1	1	0	0	260	10	1	99	5	1213	1157044171	0
34	1	1	0	0	260	30	1	99	6	1213	61370000	0
35	1	1	0	0	260	30	302	99	6	1213	1200000000	0
36	1	1	0	0	280	10	1	99	6	1213	156599958	0
37	1	1	0	0	280	30	1	99	6	1213	75582000	0
38	1	1	0	0	290	10	1	99	6	1213	31274893	0
39	1	1	0	0	290	30	1	99	6	1213	272237462	0
40	1	1	0	0	320	10	1	99	7	1213	80500041	0
41	1	1	0	0	320	30	1	99	7	1213	25000000	0
42	1	1	0	0	330	10	1	99	7	1213	103862136	0
43	1	1	0	0	330	30	1	99	7	1213	10583067	0
44	1	1	0	0	340	10	1	99	7	1213	536925347	0
45	1	1	0	0	340	30	1	99	7	1213	289770000	0
46	1	1	0	0	340	30	302	99	7	1213	1624444444	0
47	1	1	0	0	350	10	1	99	8	1213	293280009	0
48	1	1	0	0	360	10	1	99	8	1213	95513550	0
49	1	1	0	0	360	30	1	99	8	1213	586623450	0
50	1	1	0	0	390	10	1	99	8	1213	6613785	0
51	1	1	0	0	540	10	1	99	8	1213	1466070876	0
52	1	1	0	0	540	30	1	99	8	1213	500000000	0
53	1	1	0	0	811	10	126	99	9	1213	10308771978	0
54	1	1	0	0	811	10	128	99	9	1213	5751704263	0
55	1	1	0	0	811	10	171	11	9	1213	935159819672	0
56	1	1	0	0	811	10	172	10	9	1213	87767025150	0
57	1	1	0	0	811	10	173	12	9	1213	39891325126	0
58	1	1	0	0	811	10	174	7	9	1213	45930133806	0
59	1	1	0	0	811	10	175	1	9	1213	31570400306	0
60	1	1	0	0	811	10	176	4	10	1213	40620903312	0
61	1	1	0	0	811	10	177	5	10	1213	44386937765	0
62	1	1	0	0	811	10	178	14	10	1213	16587034392	0
63	1	1	0	0	811	10	181	99	10	1213	1956761020	0
64	1	1	0	0	811	10	182	99	10	1213	3427204396	0
65	1	1	0	0	811	30	126	99	10	1213	5122446188	0
66	1	1	0	0	811	30	302	99	10	1213	585000000	0
67	1	1	0	0	834	30	1	99	11	1213	4928641279	0
68	1	1	0	0	841	10	1	99	11	1213	13986350000	0
69	1	1	0	0	849	10	1	99	11	1213	2500000	0
70	1	1	0	0	851	10	1	99	11	1213	2167970646	0
71	1	1	0	0	861	10	126	99	11	1213	47060041522	0
72	1	1	0	0	861	10	128	99	11	1213	34188287	0
73	1	1	0	0	861	10	171	11	11	1213	113231860423	0
74	1	1	0	0	861	10	172	10	12	1213	581166532	0
75	1	1	0	0	861	10	173	12	12	1213	593221532	0
76	1	1	0	0	861	10	174	7	12	1213	1028020608	0
77	1	1	0	0	861	10	175	1	12	1213	2578861562	0
78	1	1	0	0	861	10	176	4	12	1213	1213867780	0
79	1	1	0	0	861	10	177	5	12	1213	1666472824	0
80	1	1	0	0	861	10	178	14	12	1213	2106159776	0
81	1	1	0	0	861	10	182	99	13	1213	33371040	0
82	1	1	0	0	861	30	126	99	13	1213	827596681	0
83	1	1	0	0	861	30	302	99	13	1213	815000000	0
84	1	1	0	0	894	30	1	99	13	1213	1222032852	0
85	1	1	0	0	910	10	1	99	13	1213	1156260720	0
86	1	1	0	0	910	30	1	99	13	1213	4863274514	0
87	1	1	0	0	980	20	13	99	14	1213	238579098701	0
88	2	1	1	0	220	10	1	99	15	36	14091870834	0
89	2	1	1	0	340	10	1	99	15	36	44915561947	0
90	2	1	1	0	220	10	1	99	16	38	4428960000	0
91	2	1	1	0	330	10	1	99	16	38	4583939018	0
92	2	1	1	0	330	30	302	99	16	38	1139641500	0
93	2	1	1	0	530	10	1	99	16	38	3367297315	0
94	2	1	1	0	530	10	3	99	16	38	882408000	0
95	2	1	1	0	520	10	1	99	17	336	2300000000	0
96	2	1	1	0	520	10	3	99	17	336	2300000000	0
97	2	1	1	0	530	10	1	99	17	336	818480000	0
98	2	1	1	0	530	10	3	99	17	336	818480000	0
99	2	1	1	0	111	10	1	0	18	563	119562644022	0
100	2	1	1	0	111	10	1	1	18	563	89203770698	0
101	2	1	1	0	111	10	1	2	19	563	187554042692	0
102	2	1	1	0	111	10	1	3	19	563	97919839246	0
103	2	1	1	0	111	10	1	4	19	563	83038420032	0
104	2	1	1	0	111	10	1	5	19	563	207376721672	0
105	2	1	1	0	111	10	1	6	19	563	78341955768	0
106	2	1	1	0	111	10	1	7	19	563	164977001970	0
107	2	1	1	0	111	10	1	8	20	563	43546490830	0
108	2	1	1	0	111	10	1	9	20	563	114166093730	0
109	2	1	1	0	111	10	1	10	20	563	180685929632	0
110	2	1	1	0	111	10	1	11	20	563	320823671752	0
111	2	1	1	0	111	10	1	12	20	563	28980375870	0
112	2	1	1	0	111	10	1	13	20	563	32191015142	0
113	2	1	1	0	111	10	1	14	20	563	76884470400	0
114	2	1	1	0	111	10	1	15	21	563	48586822112	0
115	2	1	1	0	111	10	1	16	21	563	7005817064	0
116	2	1	1	0	111	10	1	17	21	563	5964096154	0
117	2	1	1	0	111	10	1	99	21	563	204177872526	0
118	2	1	1	0	114	10	1	0	21	563	9963553668	0
119	2	1	1	0	114	10	1	1	21	563	7433647558	0
120	2	1	1	0	114	10	1	2	21	563	15629503557	0
121	2	1	1	0	114	10	1	3	22	563	8159986605	0
122	2	1	1	0	114	10	1	4	22	563	6919868337	0
123	2	1	1	0	114	10	1	5	22	563	17281393474	0
124	2	1	1	0	114	10	1	6	22	563	6528496315	0
125	2	1	1	0	114	10	1	7	22	563	13748083498	0
126	2	1	1	0	114	10	1	8	22	563	3628874236	0
127	2	1	1	0	114	10	1	9	22	563	9513841146	0
128	2	1	1	0	114	10	1	10	23	563	15057160804	0
129	2	1	1	0	114	10	1	11	23	563	26735305980	0
130	2	1	1	0	114	10	1	12	23	563	2415031323	0
131	2	1	1	0	114	10	1	13	23	563	2682584596	0
132	2	1	1	0	114	10	1	14	23	563	6407039201	0
133	2	1	1	0	114	10	1	15	23	563	4048901844	0
134	2	1	1	0	114	10	1	16	23	563	583818089	0
135	2	1	1	0	114	10	1	17	24	563	497008013	0
136	2	1	1	0	114	10	1	99	24	563	17014822711	0
137	2	1	1	0	123	10	1	99	24	563	486021600	0
138	2	1	1	0	134	10	1	99	24	563	65823376512	0
139	2	1	1	0	144	10	1	99	24	563	0	0
140	2	1	1	0	145	10	1	99	24	563	191921514	0
141	2	1	1	0	199	10	1	99	24	563	7725039002	0
142	2	1	1	0	210	10	1	99	25	563	177049772	0
143	2	1	1	0	230	10	1	99	25	563	158628943	0
144	2	1	1	0	230	30	302	99	25	563	2102246930	0
145	2	1	1	0	240	10	1	99	25	563	51833600	0
146	2	1	1	0	240	30	302	99	25	563	1000000000	0
147	2	1	1	0	250	10	1	99	25	563	653125810	0
148	2	1	1	0	250	30	302	99	25	563	1461135437	0
149	2	1	1	0	260	10	1	99	26	563	154528486	0
150	2	1	1	0	330	10	1	99	26	563	916060982	0
151	2	1	1	0	330	30	302	99	26	563	0	0
152	2	1	1	0	340	10	1	99	26	563	326053093	0
153	2	1	1	0	360	10	1	99	26	563	137021734	0
154	2	1	1	0	360	30	302	99	26	563	3000000000	0
155	2	1	1	0	390	30	302	99	27	563	147642800	0
156	2	1	1	0	520	10	3	99	27	563	7185445200	0
157	2	1	1	0	520	30	302	99	27	563	0	0
158	2	1	1	0	530	10	3	99	27	563	6078396800	0
159	2	1	1	0	530	30	302	99	27	563	13950000000	0
160	2	1	1	0	540	10	1	99	27	563	967599836	0
161	2	1	1	0	540	10	3	99	28	563	8008440000	0
162	2	1	1	0	834	10	1	99	28	563	23347500000	0
163	2	1	1	0	894	10	1	99	28	563	3500000000	0
164	2	1	1	0	894	30	302	99	28	563	5000000000	0
165	2	1	1	0	390	10	1	99	29	1090	16795748	0
166	2	1	1	0	540	10	1	99	29	1090	429499938	0
167	2	1	1	0	540	10	3	99	29	1090	183540000	0
168	2	1	1	0	848	10	1	99	30	1312	96282041877	0
169	2	1	2	0	220	10	1	99	31	36	833157744	0
170	2	1	2	0	340	10	1	99	31	36	14968031720	0
171	2	1	2	0	111	10	1	0	32	561	107019152762	0
172	2	1	2	0	111	10	1	1	32	561	25903108268	0
173	2	1	2	0	111	10	1	2	32	561	61689618200	0
174	2	1	2	0	111	10	1	3	32	561	40022592848	0
175	2	1	2	0	111	10	1	4	32	561	26282824364	0
176	2	1	2	0	111	10	1	5	32	561	68365048196	0
177	2	1	2	0	111	10	1	6	32	561	22170660440	0
178	2	1	2	0	111	10	1	7	33	561	46434813948	0
179	2	1	2	0	111	10	1	8	33	561	23932977778	0
180	2	1	2	0	111	10	1	9	33	561	40363724426	0
181	2	1	2	0	111	10	1	10	33	561	46780004616	0
182	2	1	2	0	111	10	1	11	33	561	121742747592	0
183	2	1	2	0	111	10	1	12	33	561	14896564652	0
184	2	1	2	0	111	10	1	13	33	561	9875788440	0
185	2	1	2	0	111	10	1	14	34	561	17394960920	0
186	2	1	2	0	111	10	1	15	34	561	12760773672	0
187	2	1	2	0	111	10	1	16	34	561	3145521340	0
188	2	1	2	0	111	10	1	17	34	561	2700228690	0
189	2	1	2	0	111	10	1	99	34	561	104458376594	0
190	2	1	2	0	114	10	1	0	34	561	8918262732	0
191	2	1	2	0	114	10	1	1	34	561	2158592357	0
192	2	1	2	0	114	10	1	2	35	561	5140801518	0
193	2	1	2	0	114	10	1	3	35	561	3335216073	0
194	2	1	2	0	114	10	1	4	35	561	2190235365	0
195	2	1	2	0	114	10	1	5	35	561	5697087351	0
196	2	1	2	0	114	10	1	6	35	561	1847555038	0
197	2	1	2	0	114	10	1	7	35	561	3869567831	0
198	2	1	2	0	114	10	1	8	35	561	1994414817	0
199	2	1	2	0	114	10	1	9	36	561	3363643703	0
200	2	1	2	0	114	10	1	10	36	561	3898333719	0
201	2	1	2	0	114	10	1	11	36	561	10145228968	0
202	2	1	2	0	114	10	1	12	36	561	1241380389	0
203	2	1	2	0	114	10	1	13	36	561	822982371	0
204	2	1	2	0	114	10	1	14	36	561	1449580078	0
205	2	1	2	0	114	10	1	15	36	561	1063397807	0
206	2	1	2	0	114	10	1	16	37	561	262126779	0
207	2	1	2	0	114	10	1	17	37	561	225019058	0
208	2	1	2	0	114	10	1	99	37	561	8704864719	0
209	2	1	2	0	134	10	1	99	37	561	8026547473	0
210	2	1	2	0	199	10	1	99	37	561	1000000000	0
211	2	1	2	0	230	10	1	99	37	561	115779451	0
212	2	1	2	0	240	10	1	99	38	561	106360000	0
213	2	1	2	0	260	10	1	99	38	561	243431	0
214	2	1	2	0	340	10	1	99	38	561	0	0
215	2	1	2	0	360	10	1	99	38	561	615694	0
216	2	1	2	0	530	10	3	99	38	561	3881700000	0
217	2	1	2	0	540	10	1	99	39	561	0	0
218	2	1	2	0	540	30	302	99	39	561	1944800000	0
219	2	1	2	0	834	10	1	99	39	561	11206345400	0
220	2	1	2	0	842	10	1	99	39	561	0	0
221	2	1	2	0	894	10	1	99	39	561	11272045400	0
222	2	1	2	0	530	10	1	99	40	1117	1349346560	0
223	2	1	2	0	540	10	1	99	40	1117	121405200	0
224	2	1	2	0	540	10	3	99	40	1117	531600000	0
225	2	1	3	0	123	10	1	99	41	24	103610871	0
226	2	1	3	0	125	10	1	99	41	24	83076926	0
227	2	1	3	0	141	10	1	99	41	24	13013268	0
228	2	1	3	0	144	10	1	99	41	24	331978010	0
229	2	1	3	0	145	10	1	99	41	24	318099814	0
230	2	1	3	0	230	10	1	99	41	24	1391655049	0
231	2	1	3	0	250	30	302	99	42	24	5040000000	0
232	2	1	3	0	260	10	1	99	42	24	335983976	0
233	2	1	3	0	290	30	302	99	42	24	528444444	0
234	2	1	3	0	340	10	1	99	42	24	126703152	0
235	2	1	3	0	530	10	1	99	42	24	11825922	0
236	2	1	3	0	111	10	1	0	43	561	3651961740	0
237	2	1	3	0	111	10	1	1	43	561	879469680	0
238	2	1	3	0	111	10	1	2	43	561	2837748072	0
239	2	1	3	0	111	10	1	3	43	561	2361463620	0
240	2	1	3	0	111	10	1	4	44	561	499752240	0
241	2	1	3	0	111	10	1	5	44	561	2532067992	0
242	2	1	3	0	111	10	1	6	44	561	1611654612	0
243	2	1	3	0	111	10	1	7	44	561	1547857536	0
244	2	1	3	0	111	10	1	8	44	561	2949940488	0
245	2	1	3	0	111	10	1	9	44	561	2756783664	0
246	2	1	3	0	111	10	1	10	45	561	190415760	0
247	2	1	3	0	111	10	1	11	45	561	218565360	0
248	2	1	3	0	111	10	1	12	45	561	393960576	0
249	2	1	3	0	111	10	1	13	45	561	162561360	0
250	2	1	3	0	111	10	1	14	45	561	453828864	0
251	2	1	3	0	111	10	1	15	45	561	790978920	0
252	2	1	3	0	111	10	1	16	45	561	41990400	0
253	2	1	3	0	111	10	1	99	46	561	4387309324	0
254	2	1	3	0	113	10	1	0	46	561	31104000	0
255	2	1	3	0	113	10	1	99	46	561	522000000	0
256	2	1	3	0	114	10	1	0	46	561	306922145	0
257	2	1	3	0	114	10	1	1	46	561	73289140	0
258	2	1	3	0	114	10	1	2	46	561	236479006	0
259	2	1	3	0	114	10	1	3	46	561	196788635	0
260	2	1	3	0	114	10	1	4	47	561	41646020	0
261	2	1	3	0	114	10	1	5	47	561	211005666	0
262	2	1	3	0	114	10	1	6	47	561	134304551	0
263	2	1	3	0	114	10	1	7	47	561	128988128	0
264	2	1	3	0	114	10	1	8	47	561	245828374	0
265	2	1	3	0	114	10	1	9	47	561	229731972	0
266	2	1	3	0	114	10	1	10	47	561	15867980	0
267	2	1	3	0	114	10	1	11	48	561	18213780	0
268	2	1	3	0	114	10	1	12	48	561	32830048	0
269	2	1	3	0	114	10	1	13	48	561	13546780	0
270	2	1	3	0	114	10	1	14	48	561	37819072	0
271	2	1	3	0	114	10	1	15	48	561	65914910	0
272	2	1	3	0	114	10	1	16	48	561	3499200	0
273	2	1	3	0	114	10	1	99	48	561	409109110	0
274	2	1	3	0	123	10	1	99	49	561	10496992	0
275	2	1	3	0	125	10	1	99	49	561	6923074	0
276	2	1	3	0	134	10	1	99	49	561	298900222	0
277	2	1	3	0	260	10	1	99	49	561	0	0
278	2	1	3	0	340	10	1	99	49	561	66857687	0
279	2	1	3	0	360	10	1	99	50	561	90750000	0
280	2	1	3	0	390	10	1	99	50	561	846804	0
281	2	1	3	0	530	10	1	99	50	561	35477768	0
282	2	1	3	0	540	10	1	8	50	561	0	0
283	2	1	3	0	540	10	1	99	50	561	692258000	0
284	2	1	3	0	834	30	1	99	51	561	2600003403	0
285	2	1	3	0	894	30	1	99	51	561	650000851	0
286	2	1	3	0	123	10	1	99	52	1224	127286886	0
287	2	1	3	0	340	10	1	99	52	1224	72977250	0
288	2	1	3	0	530	10	1	99	52	1224	2218543	0
289	2	1	3	0	540	10	1	8	52	1224	0	0
290	2	1	3	0	123	10	1	99	53	1225	44532451	0
291	2	1	3	0	340	10	1	99	53	1225	30557311	0
292	2	1	3	0	530	10	1	99	53	1225	477767	0
293	2	1	3	0	540	10	1	8	53	1225	0	0
294	2	1	4	0	111	10	1	99	54	61	8282958132	0
295	2	1	4	0	113	10	1	99	54	61	25972800	0
296	2	1	4	0	114	10	1	99	54	61	692410911	0
297	2	1	4	0	134	10	1	99	54	61	95228113	0
298	2	1	4	0	141	10	1	99	54	61	5130000	0
299	2	1	4	0	144	10	1	99	54	61	25412500	0
300	2	1	4	0	145	10	1	99	55	61	7182000	0
301	2	1	4	0	191	10	1	99	55	61	14382000	0
302	2	1	4	0	210	10	1	99	55	61	17176320	0
303	2	1	4	0	230	10	1	99	55	61	504698	0
304	2	1	4	0	240	10	1	99	55	61	4262440	0
305	2	1	4	0	250	10	1	99	55	61	60000000	0
306	2	1	4	0	280	10	1	99	56	61	6523044	0
307	2	1	4	0	834	30	1	99	56	61	371218982	0
308	2	1	4	0	894	30	1	99	56	61	92804745	0
309	2	1	5	0	210	10	1	99	57	1230	20000000	0
310	2	1	5	0	260	10	1	99	57	1230	548101632	0
311	2	1	5	0	280	10	1	99	57	1230	8835000	0
312	2	1	5	0	290	10	1	99	57	1230	13750000	0
313	2	1	5	0	540	10	1	99	57	1230	8215292	0
314	2	1	6	0	111	10	1	99	58	61	5363302224	0
315	2	1	6	0	114	10	1	99	58	61	446941852	0
316	2	1	6	0	123	10	1	99	58	61	885780	0
317	2	1	6	0	134	10	1	99	58	61	77394890	0
318	2	1	6	0	230	10	1	99	58	61	727871	0
319	2	1	6	0	530	10	1	99	59	61	23344214	0
320	2	1	6	0	540	10	1	99	59	61	6540000	0
321	2	1	6	0	834	30	1	99	59	61	621841291	0
322	2	1	6	0	894	30	1	99	59	61	155460323	0
323	2	1	7	0	111	10	1	99	60	61	8884536472	0
324	2	1	7	0	113	10	1	99	60	61	25972800	0
325	2	1	7	0	114	10	1	99	60	61	742542439	0
326	2	1	7	0	134	10	1	99	60	61	103782169	0
327	2	1	7	0	230	10	1	99	60	61	1579704	0
328	2	1	7	0	834	30	1	99	61	61	3812551263	0
329	2	1	7	0	894	30	1	99	61	61	953137816	0
330	2	1	8	0	220	10	1	99	62	36	96372629	0
331	2	1	8	0	340	10	1	99	62	36	2509506830	0
332	2	1	8	0	111	10	1	0	63	77	36873605418	0
333	2	1	8	0	111	10	1	1	63	77	4914112446	0
334	2	1	8	0	111	10	1	2	63	77	6305220600	0
335	2	1	8	0	111	10	1	3	63	77	6902358354	0
336	2	1	8	0	111	10	1	4	63	77	3998624100	0
337	2	1	8	0	111	10	1	5	63	77	4941761844	0
338	2	1	8	0	111	10	1	6	63	77	4825700958	0
339	2	1	8	0	111	10	1	7	64	77	3811510320	0
340	2	1	8	0	111	10	1	8	64	77	3480869514	0
341	2	1	8	0	111	10	1	9	64	77	3152450874	0
342	2	1	8	0	111	10	1	10	64	77	6018972576	0
343	2	1	8	0	111	10	1	11	64	77	12317016924	0
344	2	1	8	0	111	10	1	12	64	77	1918724958	0
345	2	1	8	0	111	10	1	13	64	77	3158435556	0
346	2	1	8	0	111	10	1	14	65	77	2137573644	0
347	2	1	8	0	111	10	1	15	65	77	2190631362	0
348	2	1	8	0	111	10	1	16	65	77	823006548	0
349	2	1	8	0	111	10	1	17	65	77	806102376	0
350	2	1	8	0	111	10	1	99	65	77	73008430812	0
351	2	1	8	0	114	10	1	0	65	77	3072800452	0
352	2	1	8	0	114	10	1	1	65	77	409509371	0
353	2	1	8	0	114	10	1	2	66	77	525435050	0
354	2	1	8	0	114	10	1	3	66	77	575196530	0
355	2	1	8	0	114	10	1	4	66	77	333218675	0
356	2	1	8	0	114	10	1	5	66	77	411813487	0
357	2	1	8	0	114	10	1	6	66	77	402141747	0
358	2	1	8	0	114	10	1	7	66	77	317625860	0
359	2	1	8	0	114	10	1	8	66	77	290072460	0
360	2	1	8	0	114	10	1	9	67	77	262704240	0
361	2	1	8	0	114	10	1	10	67	77	501581048	0
362	2	1	8	0	114	10	1	11	67	77	1026418077	0
363	2	1	8	0	114	10	1	12	67	77	159893747	0
364	2	1	8	0	114	10	1	13	67	77	263202963	0
365	2	1	8	0	114	10	1	14	67	77	178131137	0
366	2	1	8	0	114	10	1	15	67	77	182552614	0
367	2	1	8	0	114	10	1	16	68	77	68583879	0
368	2	1	8	0	114	10	1	17	68	77	67175198	0
369	2	1	8	0	114	10	1	99	68	77	6084035902	0
370	2	1	8	0	123	10	1	99	68	77	102662658	0
371	2	1	8	0	125	10	1	99	68	77	127871250	0
372	2	1	8	0	134	10	1	99	68	77	2362837205	0
373	2	1	8	0	137	10	1	99	68	77	6840000	0
374	2	1	8	0	141	10	1	99	69	77	13013268	0
375	2	1	8	0	144	10	1	99	69	77	61588989	0
376	2	1	8	0	145	10	1	99	69	77	313542512	0
377	2	1	8	0	199	10	1	99	69	77	3701216060	0
379	2	1	8	0	240	10	1	99	69	77	19222484	0
380	2	1	8	0	260	10	1	99	70	77	607567936	0
381	2	1	8	0	280	10	1	99	70	77	141640827	0
382	2	1	8	0	330	10	1	99	70	77	51127377	0
383	2	1	8	0	340	10	1	99	70	77	117423799	0
384	2	1	8	0	360	10	1	99	70	77	49691270	0
385	2	1	8	0	520	10	1	99	71	77	20000000	0
386	2	1	8	0	530	10	1	99	71	77	119861978	0
387	2	1	8	0	540	10	1	99	71	77	443001851	0
388	2	1	8	0	834	30	1	99	71	77	1445463326	0
389	2	1	8	0	847	10	1	99	71	77	2000000000	0
390	2	1	8	0	894	30	1	99	71	77	361365832	0
391	2	1	8	0	123	10	1	99	72	1158	103487247	0
392	2	1	8	0	125	10	1	99	72	1158	70378750	0
393	2	1	8	0	141	10	1	99	72	1158	13013268	0
394	2	1	8	0	144	10	1	99	72	1158	126234615	0
395	2	1	8	0	145	10	1	99	73	1158	246900000	0
396	2	1	8	0	230	10	1	99	73	1158	712594707	0
397	2	1	8	0	240	10	1	99	73	1158	52342980	0
398	2	1	8	0	280	10	1	99	73	1158	239949171	0
399	2	1	8	0	330	10	1	99	74	1158	1790805135	0
400	2	1	8	0	360	10	1	99	74	1158	429943789	0
401	2	1	8	0	390	10	1	99	74	1158	9354468	0
402	2	1	8	0	530	10	1	99	74	1158	807144813	0
403	2	1	9	0	111	10	1	1	75	561	7893368472	0
404	2	1	9	0	111	10	1	4	75	561	5849635968	0
405	2	1	9	0	111	10	1	7	75	561	6952219902	0
406	2	1	9	0	111	10	1	10	75	561	6676670310	0
407	2	1	9	0	111	10	1	11	75	561	7142266788	0
408	2	1	9	0	111	10	1	12	75	561	4529746608	0
409	2	1	9	0	111	10	1	13	75	561	5337128424	0
410	2	1	9	0	111	10	1	99	76	561	4477561002	0
411	2	1	9	0	113	10	1	1	76	561	2160000	0
412	2	1	9	0	113	10	1	4	76	561	2160000	0
413	2	1	9	0	113	10	1	7	76	561	2160000	0
414	2	1	9	0	113	10	1	10	76	561	2160000	0
415	2	1	9	0	113	10	1	11	76	561	4320000	0
416	2	1	9	0	113	10	1	12	76	561	2160000	0
417	2	1	9	0	113	10	1	13	77	561	2160000	0
418	2	1	9	0	114	10	1	1	77	561	657960707	0
419	2	1	9	0	114	10	1	4	77	561	487649664	0
420	2	1	9	0	114	10	1	7	77	561	579531659	0
421	2	1	9	0	114	10	1	10	77	561	556569193	0
422	2	1	9	0	114	10	1	11	77	561	595548900	0
423	2	1	9	0	114	10	1	12	77	561	377658885	0
424	2	1	9	0	114	10	1	13	78	561	444940703	0
425	2	1	9	0	114	10	1	99	78	561	373130084	0
426	2	1	9	0	134	10	1	99	78	561	511643313	0
427	2	1	9	0	834	30	1	99	78	561	540943680	0
428	2	1	9	0	894	30	1	99	78	561	135235920	0
429	2	1	10	0	111	10	1	99	79	561	6394563800	0
430	2	1	10	0	113	10	1	99	79	561	79593600	0
431	2	1	10	0	114	10	1	99	79	561	539513117	0
432	2	1	10	0	123	10	1	99	79	561	236178456	0
433	2	1	10	0	134	10	1	99	79	561	61548519	0
434	2	1	10	0	144	10	1	99	80	561	0	0
435	2	1	10	0	145	10	1	99	80	561	110573110	0
436	2	1	10	0	191	10	1	99	80	561	26367000	0
437	2	1	10	0	199	10	1	99	80	561	554290428	0
438	2	1	10	0	210	10	1	99	80	561	414453992	0
439	2	1	10	0	230	10	1	99	80	561	77218347	0
440	2	1	10	0	240	10	1	99	81	561	296234279	0
441	2	1	10	0	260	10	1	99	81	561	399078560	0
442	2	1	10	0	280	10	1	99	81	561	44017797	0
443	2	1	10	0	310	10	1	99	81	561	154434120	0
444	2	1	10	0	330	10	1	99	81	561	632217450	0
445	2	1	10	0	340	10	1	99	81	561	39763919	0
446	2	1	10	0	360	10	1	99	82	561	0	0
447	2	1	10	0	530	10	1	99	82	561	299000000	0
448	2	1	10	0	540	10	1	99	82	561	84254820	0
449	2	1	10	0	540	10	3	99	82	561	129990000	0
450	2	1	10	0	210	10	1	99	83	1210	11896000	0
451	2	1	10	0	310	10	1	99	83	1210	78761401	0
452	2	1	10	0	540	10	1	99	83	1210	212478180	0
453	2	1	11	0	111	10	1	99	84	561	1955150520	0
454	2	1	11	0	113	10	1	99	84	561	79593600	0
455	2	1	11	0	114	10	1	99	84	561	169562010	0
456	2	1	11	0	123	10	1	99	84	561	227586077	0
457	2	1	11	0	125	10	1	99	84	561	68186891	0
458	2	1	11	0	191	10	1	99	84	561	96000000	0
459	2	1	11	0	210	10	1	99	85	561	28000000	0
460	2	1	11	0	250	10	1	99	85	561	50400000	0
461	2	1	11	0	290	10	1	99	85	561	13615315	0
462	2	1	11	0	340	10	1	99	85	561	11607016	0
463	2	1	11	0	360	10	1	99	85	561	3732278	0
464	2	1	11	0	530	10	1	99	86	561	10600000	0
465	2	1	11	0	540	10	1	99	86	561	24835200	0
466	2	1	14	0	123	10	1	99	87	1228	63659759	0
467	2	1	14	0	125	10	1	99	87	1228	32593731	0
468	2	1	14	0	133	30	302	99	87	1228	0	0
469	2	1	14	0	145	30	302	99	87	1228	1260000000	0
470	2	1	14	0	199	10	1	99	87	1228	19454510	0
471	2	1	14	0	240	10	1	99	87	1228	38984263	0
472	2	1	14	0	250	30	302	99	88	1228	3200000000	0
473	2	1	14	0	260	30	302	99	88	1228	907644444	0
474	2	1	14	0	280	30	302	99	88	1228	500000000	0
475	2	1	14	0	290	10	1	99	88	1228	132000000	0
476	2	1	14	0	330	10	1	99	88	1228	0	0
477	2	1	14	0	360	10	1	99	88	1228	105969757	0
478	2	1	14	0	540	10	1	99	89	1228	31797750	0
479	2	1	14	0	851	10	1	99	89	1228	70000000	0
480	2	1	15	0	111	10	1	99	90	1229	747711600	0
481	2	1	15	0	112	10	1	99	90	1229	527443200	0
482	2	1	15	0	113	10	1	99	90	1229	27648000	0
483	2	1	15	0	114	10	1	99	90	1229	108566900	0
484	2	1	15	0	131	10	1	99	90	1229	7000000	0
485	2	1	15	0	133	10	1	99	90	1229	198803419	0
486	2	1	15	0	144	10	1	99	90	1229	0	0
487	2	1	15	0	145	10	1	99	91	1229	0	0
488	2	1	15	0	191	10	1	99	91	1229	40800000	0
489	2	1	15	0	199	10	1	99	91	1229	0	0
490	2	1	15	0	210	10	1	99	91	1229	24885000	0
491	2	1	15	0	230	10	1	99	91	1229	119470950	0
492	2	1	15	0	240	10	1	99	91	1229	0	0
493	2	1	15	0	260	10	1	99	92	1229	139350001	0
494	2	1	15	0	280	10	1	99	92	1229	0	0
495	2	1	15	0	290	10	1	99	92	1229	54723300	0
496	2	1	15	0	320	10	1	99	92	1229	0	0
497	2	1	15	0	330	10	1	99	92	1229	13373250	0
498	2	1	15	0	340	10	1	99	92	1229	25070750	0
499	2	1	15	0	350	10	1	99	93	1229	0	0
500	2	1	15	0	360	10	1	99	93	1229	21147000	0
501	2	1	15	0	530	10	1	99	93	1229	5000000	0
502	2	1	15	0	540	10	1	99	93	1229	12525000	0
503	2	1	16	0	141	10	1	0	94	61	36000000	0
504	2	1	16	0	143	10	1	0	94	61	144000000	0
505	2	1	16	0	144	10	1	0	94	61	81256500	0
506	2	1	16	0	144	30	1	0	94	61	74726600	0
507	2	1	16	0	145	10	1	0	94	61	381136798	0
508	2	1	16	0	210	10	1	0	94	61	43000000	0
509	2	1	16	0	230	30	1	0	95	61	65000000	0
510	2	1	16	0	240	30	1	0	95	61	91273400	0
511	2	1	16	0	250	10	1	0	95	61	129000000	0
512	2	1	16	0	260	10	1	0	95	61	56854367	0
513	2	1	16	0	260	30	1	0	95	61	33400000	0
514	2	1	16	0	280	30	1	0	95	61	9600000	0
515	2	1	16	0	320	30	1	0	96	61	5000000	0
516	2	1	16	0	330	30	1	0	96	61	4000000	0
517	2	1	16	0	340	10	1	0	96	61	50000000	0
518	2	1	16	0	340	30	1	0	96	61	5000000	0
519	2	1	16	0	360	30	1	0	96	61	12000000	0
520	2	1	16	0	540	10	1	0	96	61	29700000	0
521	2	1	16	0	834	30	1	0	97	61	0	0
522	2	1	16	0	841	10	1	0	97	61	300000000	0
523	2	1	16	0	851	10	1	0	97	61	89760000	0
524	2	1	16	0	894	30	1	0	97	61	0	0
525	3	1	0	1	123	10	1	99	98	542	245161617	0
526	3	1	0	1	125	10	1	99	98	542	169661199	0
527	3	1	0	1	137	10	1	99	98	542	31922200	0
528	3	1	0	1	137	20	401	99	98	542	410914368	0
529	3	1	0	1	141	10	1	99	98	542	166308441	0
530	3	1	0	1	141	20	401	99	98	542	455841744	0
531	3	1	0	1	144	10	1	99	98	542	605007186	0
532	3	1	0	1	145	10	1	99	99	542	319723723	0
533	3	1	0	1	145	20	401	99	99	542	1426452000	0
534	3	1	0	1	199	10	1	99	99	542	342115388	0
535	3	1	0	1	230	10	1	99	99	542	2850000	0
536	3	1	0	1	230	20	401	99	99	542	60000000	0
537	3	1	0	1	240	10	1	99	99	542	51418182	0
538	3	1	0	1	240	20	401	99	100	542	496000000	0
539	3	1	0	1	250	10	1	99	100	542	593556000	0
540	3	1	0	1	260	10	1	99	100	542	9259618	0
541	3	1	0	1	260	20	401	99	100	542	712000000	0
542	3	1	0	1	280	10	1	99	100	542	10900000	0
543	3	1	0	1	280	20	401	99	100	542	109000000	0
544	3	1	0	1	330	10	1	99	101	542	4500000	0
545	3	1	0	1	330	20	401	99	101	542	0	0
546	3	1	0	1	340	10	1	99	101	542	6500000	0
547	3	1	0	1	340	20	401	99	101	542	95000000	0
548	3	1	0	1	350	10	1	99	101	542	5000000	0
549	3	1	0	1	360	20	401	99	101	542	250000000	0
550	3	1	0	1	390	10	1	99	101	542	4200000	0
551	3	1	0	1	390	20	401	99	102	542	42000000	0
552	3	1	0	1	137	20	401	99	102	926	6198816	0
553	3	1	0	1	144	10	1	99	103	926	0	0
554	3	1	0	1	145	10	1	99	103	926	544497849	0
555	3	1	0	1	145	20	401	99	103	926	2261328000	0
556	3	1	0	1	230	10	1	99	103	926	6670989	0
557	3	1	0	1	230	20	401	99	103	926	2097800000	0
558	3	1	0	1	240	10	1	99	104	926	900000	0
559	3	1	0	1	240	20	401	99	104	926	9000000	0
560	3	1	0	1	260	10	1	99	104	926	407281414	0
561	3	1	0	1	260	20	401	99	104	926	4411065852	0
562	3	1	0	1	290	10	1	99	104	926	158350000	0
563	3	1	0	1	290	20	401	99	104	926	1583500000	0
564	3	1	0	1	330	10	1	99	105	926	10699249	0
565	3	1	0	1	330	20	401	99	105	926	151992491	0
566	3	1	0	1	340	10	1	99	105	926	14420000	0
567	3	1	0	1	340	20	401	99	105	926	114200000	0
568	3	1	0	1	520	20	4	99	105	926	4389453873	0
569	3	1	0	1	520	20	13	99	105	926	0	0
570	3	1	0	1	520	20	401	99	106	926	43894538736	0
571	3	1	0	1	570	10	1	99	106	926	6950000	0
572	3	1	0	1	570	20	401	99	106	926	69500000	0
573	3	1	0	1	834	20	401	99	106	926	8085972632	0
574	3	1	0	1	847	20	401	99	106	926	9833424560	0
575	3	1	0	1	874	20	401	99	106	926	0	0
576	3	1	0	1	894	20	401	99	107	926	4430027368	0
577	3	1	0	2	520	30	513	99	108	39	6948289927	0
578	3	1	0	2	530	30	513	99	108	39	1227144584	0
579	3	1	0	2	540	30	513	99	108	39	4944950000	0
580	3	1	0	3	141	30	76	99	109	336	4887293666	0
581	3	1	0	3	144	30	76	99	109	336	190666667	0
582	3	1	0	3	145	30	76	99	109	336	3003000000	0
583	3	1	0	3	220	30	76	99	109	336	400000000	0
584	3	1	0	3	230	30	76	99	109	336	552450655	0
585	3	1	0	3	260	30	76	99	109	336	5288665900	0
586	3	1	0	3	290	30	76	99	110	336	0	0
587	3	1	0	3	320	30	76	99	110	336	0	0
588	3	1	0	3	330	30	76	99	110	336	156100000	0
589	3	1	0	3	340	30	76	99	110	336	1121060000	0
590	3	1	0	3	350	30	76	99	110	336	429840000	0
591	3	1	0	3	360	30	76	99	110	336	100000000	0
592	3	1	0	3	520	30	76	99	111	336	7910962142	0
593	3	1	0	3	530	30	76	99	111	336	6429821267	0
594	3	1	0	3	540	30	76	99	111	336	500000000	0
595	3	1	0	3	853	30	76	99	111	336	0	0
596	3	1	0	3	848	30	76	99	112	1312	2424400000	0
597	3	1	0	4	230	30	76	99	113	1181	604800000	0
598	3	1	0	4	260	30	76	99	113	1181	1407000000	0
599	3	1	0	4	360	30	76	99	113	1181	151200000	0
600	3	1	0	4	520	30	76	99	114	1317	10705938368	0
601	3	1	0	4	520	30	76	99	114	1318	17117243424	0
602	3	1	0	5	144	30	76	99	115	1181	105000000	0
603	3	1	0	5	145	30	76	99	116	1181	520000000	0
604	3	1	0	5	230	30	76	99	116	1181	1180800000	0
605	3	1	0	5	260	30	76	99	116	1181	160000000	0
606	3	1	0	5	360	30	76	99	116	1181	383976000	0
607	3	1	0	5	530	30	76	99	117	1181	1080000000	0
608	3	1	0	5	520	30	76	99	117	1317	50045817704	0
609	3	1	0	5	520	30	76	99	118	1318	15736000000	0
610	3	1	0	5	530	30	76	99	119	1319	5305157000	0
611	3	1	0	6	141	30	76	99	120	1181	117000000	0
612	3	1	0	6	210	30	76	99	120	1181	54000000	0
613	3	1	0	6	240	30	76	99	120	1181	6000000	0
614	3	1	0	6	250	30	76	99	120	1181	220000000	0
615	3	1	0	6	260	30	76	99	120	1181	105000000	0
616	3	1	0	6	280	30	76	99	120	1181	5400000	0
617	3	1	0	6	340	30	76	99	121	1181	19700000	0
618	3	1	0	6	540	30	76	99	121	1181	8510000	0
619	3	1	0	6	141	30	76	99	122	1228	0	0
620	3	1	0	6	144	30	76	99	122	1228	0	0
621	3	1	0	6	145	30	76	99	122	1228	0	0
622	3	1	0	6	210	30	76	99	122	1228	0	0
623	3	1	0	6	220	30	76	99	122	1228	0	0
624	3	1	0	6	230	30	76	99	122	1228	0	0
625	3	1	0	6	240	30	76	99	123	1228	0	0
626	3	1	0	6	250	30	76	99	123	1228	0	0
627	3	1	0	6	260	30	76	99	123	1228	0	0
628	3	1	0	6	280	30	76	99	123	1228	0	0
629	3	1	0	6	330	30	76	99	123	1228	0	0
630	3	1	0	6	340	30	76	99	123	1228	0	0
631	3	1	0	6	360	30	76	99	124	1228	0	0
632	3	1	0	6	390	30	76	99	124	1228	0	0
633	3	1	0	6	530	30	76	99	124	1228	0	0
634	3	1	0	6	540	30	76	99	124	1228	0	0
635	3	1	0	6	141	30	76	99	125	1320	1408124527	0
636	3	1	0	6	144	30	76	99	125	1320	614810845	0
637	3	1	0	6	145	30	76	99	125	1320	695137264	0
638	3	1	0	6	220	30	76	99	125	1320	628400000	0
639	3	1	0	6	230	30	76	99	125	1320	506040000	0
640	3	1	0	6	240	30	76	99	125	1320	20270000	0
641	3	1	0	6	260	30	76	99	126	1320	2320027976	0
642	3	1	0	6	280	30	76	99	126	1320	176068000	0
643	3	1	0	6	330	30	76	99	126	1320	401212909	0
644	3	1	0	6	340	30	76	99	126	1320	549725748	0
645	3	1	0	6	360	30	76	99	126	1320	105000000	0
646	3	1	0	6	390	30	76	99	126	1320	35434630	0
647	3	1	0	6	530	30	76	99	127	1320	90750000	0
648	3	1	0	6	540	30	76	99	127	1320	1557870714	0
649	3	1	0	6	852	30	76	99	127	1320	7091044000	0
650	3	1	0	7	133	30	76	99	128	250	0	0
651	3	1	0	7	137	30	76	99	128	250	0	0
652	3	1	0	7	141	30	76	99	128	250	0	0
653	3	1	0	7	144	30	76	99	128	250	0	0
654	3	1	0	7	145	30	76	99	128	250	0	0
655	3	1	0	7	210	30	76	99	128	250	0	0
656	3	1	0	7	220	30	76	99	129	250	0	0
657	3	1	0	7	230	30	76	99	129	250	0	0
658	3	1	0	7	240	30	76	99	129	250	0	0
659	3	1	0	7	250	30	76	99	129	250	0	0
660	3	1	0	7	260	30	76	99	129	250	0	0
661	3	1	0	7	280	30	76	99	129	250	0	0
662	3	1	0	7	290	30	76	99	129	250	0	0
663	3	1	0	7	330	30	76	99	130	250	0	0
664	3	1	0	7	340	30	76	99	130	250	0	0
665	3	1	0	7	360	30	76	99	130	250	0	0
666	3	1	0	7	530	30	76	99	130	250	0	0
667	3	1	0	7	540	30	76	99	130	250	0	0
668	3	1	0	7	137	30	76	99	131	1181	10252778	0
669	3	1	0	7	141	30	76	99	131	1181	31500000	0
670	3	1	0	7	145	30	76	99	131	1181	243000000	0
671	3	1	0	7	260	30	76	99	131	1181	132000000	0
672	3	1	0	7	141	30	76	99	132	1320	36943527	0
673	3	1	0	7	144	30	76	99	132	1320	343382353	0
674	3	1	0	7	145	30	76	99	132	1320	54743766	0
675	3	1	0	7	220	30	76	99	132	1320	226650000	0
676	3	1	0	7	230	30	76	99	132	1320	517530000	0
677	3	1	0	7	260	30	76	99	132	1320	42445383	0
678	3	1	0	7	280	30	76	99	133	1320	20000000	0
679	3	1	0	7	340	30	76	99	133	1320	50630224	0
680	3	1	0	7	360	30	76	99	133	1320	69440000	0
681	3	1	0	7	852	30	76	99	133	1320	4083147222	0
682	3	1	0	7	137	30	76	99	134	1321	115050000	0
683	3	1	0	7	141	30	76	99	134	1321	157500000	0
684	3	1	0	7	144	30	76	99	134	1321	110000000	0
685	3	1	0	7	145	30	76	99	134	1321	846050000	0
686	3	1	0	7	210	30	76	99	134	1321	54000000	0
687	3	1	0	7	230	30	76	99	134	1321	23750000	0
688	3	1	0	7	240	30	76	99	135	1321	148400000	0
689	3	1	0	7	250	30	76	99	135	1321	289000000	0
690	3	1	0	7	280	30	76	99	135	1321	203000000	0
691	3	1	0	7	290	30	76	99	135	1321	200000000	0
692	3	1	0	7	330	30	76	99	135	1321	800350	0
693	3	1	0	7	340	30	76	99	135	1321	35216450	0
694	3	1	0	7	360	30	76	99	136	1321	24000000	0
695	3	1	0	7	530	30	76	99	136	1321	180000000	0
696	3	1	0	7	540	30	76	99	136	1321	77100000	0
697	3	1	0	7	570	30	76	99	136	1321	35950000	0
698	3	1	0	8	145	30	76	99	137	24	646151660	0
699	3	1	0	8	220	30	76	99	137	24	406621560	0
700	3	1	0	8	230	30	76	99	137	24	7702830903	0
701	3	1	0	8	260	30	76	99	137	24	5902200000	0
702	3	1	0	8	280	30	76	99	137	24	1140000	0
703	3	1	0	8	290	30	76	99	137	24	16908474999	0
704	3	1	0	8	330	30	76	99	138	24	309000000	0
705	3	1	0	8	340	30	76	99	138	24	20000000	0
706	3	1	0	8	360	30	76	99	138	24	147648102	0
707	3	1	0	8	145	30	76	99	139	1181	890000000	0
708	3	1	0	8	230	30	76	99	139	1181	785158524	0
709	3	1	0	8	260	30	76	99	139	1181	2714255000	0
710	3	1	0	8	280	30	76	99	139	1181	7700000	0
711	3	1	0	8	330	30	76	99	139	1181	18540000	0
712	3	1	0	8	340	30	76	99	140	1181	69431566	0
713	3	1	0	8	360	30	76	99	140	1181	304000000	0
714	3	1	0	8	230	30	76	99	141	1322	525742811	0
715	3	1	0	8	360	30	76	99	141	1322	101672823	0
716	3	1	0	8	520	30	76	99	141	1322	9264000000	0
717	3	1	0	8	530	30	76	99	141	1322	5760384806	0
718	3	1	0	8	540	30	76	99	141	1322	78800000	0
719	3	1	0	8	570	30	76	99	142	1322	250000000	0
720	3	1	0	9	141	30	76	99	143	1181	15166666	0
721	3	1	0	9	144	30	76	99	143	1181	15166667	0
722	3	1	0	9	145	30	76	99	143	1181	182000000	0
723	3	1	0	9	230	30	76	99	143	1181	0	0
724	3	1	0	9	260	30	76	99	143	1181	985600000	0
725	3	1	0	9	330	30	76	99	144	1181	40000000	0
726	3	1	0	9	340	30	76	99	144	1181	60000000	0
727	3	1	0	9	360	30	76	99	144	1181	0	0
728	3	1	0	9	520	30	76	99	144	1181	0	0
729	3	1	0	9	530	30	76	99	144	1181	675000000	0
730	3	1	0	9	540	30	76	99	144	1181	0	0
731	3	1	0	9	145	30	76	99	145	1322	40500000	0
732	3	1	0	9	230	30	76	99	145	1322	158400000	0
733	3	1	0	9	360	30	76	99	146	1322	24960000	0
734	3	1	0	9	520	30	76	9	146	1322	4290000000	0
735	3	1	0	9	520	30	76	99	146	1322	0	0
736	3	1	0	9	530	30	76	99	146	1322	8741950000	0
737	3	1	0	9	540	30	76	99	146	1322	200000000	0
378	2	1	8	0	230	10	1	99	69	77	1298220000	0
\.


--
-- TOC entry 2672 (class 0 OID 25956)
-- Dependencies: 234
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY productos (producto, descripcion) FROM stdin;
24	Docentes capacitados
36	Canastas basicas de utiles escolares entregadas
38	Textos y guias didacticas entregadas
61	Formacion de profesionales
77	Jovenes, adultos y personas con necesidades capacitadas
336	Asistencia a niños/as
542	Apoyo estrategico a las acciones del mec    
561	Alumnos matriculados
563	Niños y niñas matriculados
926	Intervenciones realizadas en las escuelas
1032	Transferencias monetarias a entidades educativas e instituciones sin fines de lucro
1158	Programas de alfabetizacion y postalfabetizacion implementado
1181	Servicios administrativos para generacion de valor publico     
1210	Alumnos con discapacidad visual atendidos integralmente
1213	Gestión administrativa para generacion  de valor público
1224	Docentes evaluados
1228	Evaluacion del aprendizaje
1229	Informes de evaluacion del sistema educativo nacional       
1230	Investigaciones educativas difundidas    
1312	Alimento escolar provisto
1317	Instituciones educativas ampliadas
1318	Instituciones educativas reparadas
1319	Instituciones educativas equipadas
1320	Alumnos evaluados
1321	Centro nacional de evaluacion
1322	Infraestructura educativa instalada
\.


--
-- TOC entry 2647 (class 0 OID 17463)
-- Dependencies: 209
-- Data for Name: reactivacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reactivacion (id, cc, llamado, contrato, proveedor, pac, obj, monto, aaaa, nro) FROM stdin;
424	LP-12007-16-131531 	LPN SBE N°17/20116 “SERVICIODE EMBALAJE Y TRANSPORTE – PLURIANUAL 2016/2017	\N	TRANS – RUTA S.A.	306015	220	17149733070	\N	\N
425	LP-12007-16-120703	LPN SBE Nº 11/2016 SERVICIO DE TRANSPORTE Y EMBALAJE PARA TEXTOS AD REFERÉNDUM – PROGRAMA DOTACIÓN DE TEXTOS	\N	TRANSPORTE INTERNACIONAL GUARANY S.R.L.	306021	220	2570912010	\N	\N
426	EE-12007-12-46500	PRESTACIÓN DE SERVICIOS DE EMBALAJE Y TRANSPORTE DE KITS ESCOLARES 2012	\N	DINACOPA	\N	220	14538000000	\N	\N
427	LP-12007-14-200372	LPN 16/2014 “SERVICIO DE EMBALAJE Y TRANSPORTE PLURIANUAL 2014/2015”	\N	CONSORCIO WARD	282097	220	19559310000	\N	\N
428	LP-12007-14-84640	SERVICIO DE EMBALAJE Y TRANSPORTE PARA LA CANASTA BÁSICA DE ÚTILES ESCOLARES	\N	CONSORCIO N.S.A.	266665	220	13279120000	\N	\N
429	CD-12007-16-131455	CD Nº 14/2016 "ADQUISICIÓN DE PASAJES AÉREOS - PLURIANUAL 2017"	\N	Kostas Viajes y Turismo S.R.L.	306020	230	140000000	\N	\N
430	CO-12007-15-114559	LCO N°10/2015 “SERVICIO DE MANTENIMIENTO PREVENTIVO Y CORREC TIVO DE ASCENSORES	\N	CIA. COMERCIAL GENERAL INDUSTRIAL LIMITADA	290140	240	205880000	\N	\N
431	CO-12007-14-94570	LCO SBE N°09/2014 “SERVICIO DE MANTENIMIENTO PREVENTIVO Y CORRECTIVO DE RELOJES BIOMÉTRICOS	\N	WINNER S.R.L.	272524	240	212750000	\N	\N
432	LP-12007-16-123468	SERVICIO DE IMPRESIÓN Y COPIADO PLURIANUAL	\N	DATA SYSTEMS S.A.E.C.A.	300406	260	1169000000	\N	\N
433	CD-12007-16-133022	CD Nº 13/2016 "SERVICIO DE PÚBLICACIÓN EN PERIÓDICOS - PLURIANUAL 2017"	\N	Biedermann Publicidad S.A.	306037	260	140000000	\N	\N
434	CO-12007-16-133536	LCO SBE Nº 04/2016 "ADQUISICIÓN DE PÓLIZAS DE SEGUROS PARA VEHÍCULOS DEL MEC - PLURIANUAL"	\N	EL PRODUCTOR S.A. SEGUROS	306035	260	38999952	\N	\N
435	CO-12007-16-131342\n	LCO SBE Nº 03/2016 "ADQUISICIÓN DE ETIQUETAS DE SEGURIDAD PARA EL VICEMINISTERIO DE EDUCACIÓN SUPERIOR PARA EL REGISTRO DE TÍTULO"	\N	ARTES GRAFICAS ZAMPHIROPOLOS SA	306040	260	250000000	\N	\N
436	CD-12007-15-115377	CABLEADO ESRUCTRUCTURADO DEL EDIFICIO COLONIAL	\N	TES INGENIERIA	298344	260	70000000	\N	\N
437	CD-12007-13-69235	SERVICIO DE INSTALACION DE VPN	\N	T.E.I.S.A.	248341	260	84348000	\N	\N
438	LP-12007-11-41179	SERVICIO DE CONSULTORÍA TÉCNICA DE OBRAS	\N	CONSORCIO GEOKAP	220873	260	3107000000	\N	\N
439	SI	CD Nº 12/2016 "ADQUISICIÓN DE CERTIFICADOS DIGITALES"	\N	Data Systems SAECA	306247	260	17057370	\N	\N
440	LP-12007-15-110018	SERVICIO DE GESTIÓN Y ORGANIZACIÓN DE EVENTOS	\N	PUBLICIDAD MARTINEZ	290144	280	600000000	\N	\N
441	LP-12007-15-110020	\N	\N	AUTO CONTROL S.A.	\N	280	400000000	\N	\N
442	CD-12007-16-123891	PROVISION DE AGUA MINERAL EN BIDONES	\N	BES S.A.	306271	280	106400000	\N	\N
443	LP-12007-16-134388	LPN Nº 20/2016 "Adquisición de libros de textos y Guias didácticas - Plurianual 2016/2017 PROGRAMA DOTACIÓN DE TEXTOS	\N	ATLAS REPRESENTACIONES S.A.	306038	330	3196587431	\N	\N
444	LP-12007-16-134385\n	\N	\N	Vazpi S.R.L.	\N	330	1568209270	\N	\N
445	LP-12007-16-134386	\N	\N	Ediciones Tecnicas Paraguayas S.R.L.	\N	330	1440359491	\N	\N
446	CO-12007-16-129720\n	LCO SBE Nº 02/2016 "IMPRESIÓN DE  CARTONES DE TITULOS PROMOCIÓN 2016 - SEGUNDO LLAMADO"	\N	ARTES GRAFICAS ZAMPHIROPOLOS SA	306042	330	575908310	\N	\N
447	CD-12007-16-118679	IMPRESIÓN DE PRUEBAS PARA EL CONCURSO PUBLICO DE OPOSICIÓN	\N	ARTES GRAFICAS VISUAL	302080	330	46153840	\N	\N
448	\N	CD Nº 08/2016 "IMPRESIÓN DE PRUEBAS PARA EL CONCURSO PÚBLICO DE OPOSICIÓN 2016 - SEGUNDO LLAMADO	\N	Frigón S.A.	306259	330	5467600	\N	\N
449	AC-12007-16-24225	ADQUISICIÓN DE TEXTOS Y EDICIÓN E IMPRESIÓN DE MATERIALES PROGRAMA DE DOTACIÓN DE TEXTOS	\N	AGR S.A. Servicios Gráficos	301256	330	245239750	\N	\N
450	LP-12007-16-120114 	IMPRESIÓN DE TEXTOS Y MATERIALES DIDACTICOS	\N	AGR S.A. Servicios Gráficos	300815	330	335413670	\N	\N
451	CD-12007-12-58102	ADQUISICIÓN DE PERIODICOS	\N	AGENCIA VIDAL	234771	330	53824800	\N	\N
452	LP-12007-16-128620\n	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Alamo S.A.	306178	340	36102212255	\N	\N
453	LP-12007-16-128617\n	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	ATLAS REPRESENTACIONES S.A.	306178	340	193649820	\N	\N
454	LP-12007-16-128618\n	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Dalmi S.R.L.	306178	340	1257453946	\N	\N
455	LP-12007-16-128627	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	El Faro Industrial y Comercial S.R.L.	306178	340	1716829878	\N	\N
456	LP-12007-16-128381\n	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Santiago Adolfo Vega espinola	306178	340	1091407966	\N	\N
457	LP-12007-16-128625\n	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Géminis Industrial y Comercial S.A.	306178	340	958872329	\N	\N
458	LP-12007-16-128623	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Importadora del Rey S.A.	306178	340	1155790021	\N	\N
459	LP-12007-16-128619	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Industrias Gráficas Nobel S.A.	306178	340	22027503776	\N	\N
460	LP-12007-16-128622\n	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Kuatiapo S.A.	306178	340	3588214160	\N	\N
461	LP-12007-16-128626	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Mercurio S.A.	306178	340	11226275902	\N	\N
462	LP-12007-16-128629	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	\N	Papelera Guaira S.A.	306178	340	777025442	\N	\N
463	LP-12007-16-134119	LPN SBE Nº 19/16 "Adquisición de Kits Escolar 2016/2017 Plurianual Items declarados desiertos 2do llamados - Ad Referéndum	\N	Editorial en Alianza S.A.	301272	340	38120250	\N	\N
464	LP-12007-15-113636	LPN SBE Nº 08/2015 "ADQUISICIÓN DE KITS DE ÚTILES ESCOLARES - PLURIANUAL 2015/2016 	\N	Alamo S.A.	290798	340	25196723916	\N	\N
465	LP-12007-15-113640	LPN SBE Nº 08/2015 "ADQUISICIÓN DE KITS DE ÚTILES ESCOLARES - PLURIANUAL 2015/2016 	\N	NOBEL S.A.	290798	340	20344805294	\N	\N
466	CD-12007-13-83190	ADQUISICIÓN DE TINTA Y TONER 	\N	ALTERNATIVA S.A.	255592	340	35000000	\N	\N
467	LP-12007-12-63664	ADQUISICIÓN DE ARTICULOS DE LIMPIEZA PARA INSTITUCIONES EDUCATIVAS	\N	DISTRONUIDORA CANDYS	234505	340	159800000	\N	\N
468	LP-12007-16-134521	LPN Nº 16/2015 "Construcción, Ampliación y Reposición de Espacios Educativos para el Colegio Nacional San José y San Gerónimo - plurianual	\N	R & W Constructora Consultora Emprendimientos S.A.	299582	520	947625453	\N	\N
469	CO-12007-15-117471	LCO Nº 18 "CONSTRUCCIÓN DE AULAS DE PRIMERA INFANCIA - 2 LOCALES ESCOLARES DEL DEPARTAMENTO CENTRAL" 	\N	JULIO CESAR GOMEZ	299842	520	330311664	\N	\N
470	LP-12007-15-116899	LPN/SBE N° 10/15 "CONSTRUCCIÓN DE AULAS PARA LA PRIMERA INFANCIA" 	\N	INICIATIVAS CONSTRUCTIVAS	297662	520	394973289	\N	\N
471	LP-12007-15-117149	\N	\N	INGEMANT	\N	520	794928647	\N	\N
472	LP-12007-14-102836	CONSTRUCCIÓN DE AULAS PARA LA PRIMERA INFANCIA 	\N	G.C.A. S.A.	272835	520	1944877945	\N	\N
473	LP-12007-14-100437	PROYECTO DE INFRAESTRUCTURA - ESCUELA SANTA LUCIA DE ITAKYRY - ESCUELA BÁSICA TERCER ENCUADRE DE CURUGUATY 	\N	G.C.A. S.A.	283596	520	3020000000	\N	\N
474	CD-12007-15-117214	ADQUISICIÓN DE CUBIERTAS	\N	CHACOMER S.A.	290589	390	35642800	\N	\N
475	CO-12007-15-117214	ADQUISICIÓN DE CUBIERTAS	\N	AUTOMOTIVE	300893	390	172900000	\N	\N
476	CO-12007-12-60464	ADQUISICIÓN DE CUBIERTAS	\N	PLUSCAR S.A.	235880	390	380065000	\N	\N
477	CO-12007-12-60464	ADQUISICIÓN DE BOTIQUINES	\N	VICTOR GERARDO MENDOZA	234341	350	153999840	\N	\N
478	LP-12007-11-46020	ADQUISICIÓN DE SOFTWARE	\N	ASUNCIÓN COMUNICACIONES S.A.	227257	540	1573968000	\N	\N
479	CO-12007-14-95344	ADQUISICIÓN DE MUEBLES DE OFICINA	\N	NELIDA AIDEE MENDOZA	271667	540	574590000	\N	\N
480	LI-12007-16-126870	LPI Nº 02/2016" CONSULTORÍA PARA LA CONTRATACIÓN DE UNIVERSIDADES O INSTITUTOS SUPERIORES PARA EL DESARROLLO EL CURSO DE ESPECIALIZACIÓN EN GESTIÓN PEDAGÓGICA Y CURRICULAR" 	\N	UNIVERSIDAD AUTONOMA DE ASUNCION	303309	260	2151000000	\N	\N
481	LI-12007-16-126867	LPI Nº05 CONSULTORÍA PARA LA CONTRATACIÓN DE UNIVERSIDADES O INSTITUTOS SUPERIORES PARA EL CURSO DE DESARROLLO DE POSTGRADO PARA FORMADORES DE FORMADORES Y EQUIPO TÉCNICO CENTRAL 	\N	UNIVERSIDAD AUTONOMA DE ASUNCION	307590	260	1281200000	\N	\N
482	LI-12007-16-127161	LPI Nº01/2016"CONSULTORÍA PARA LA CONTRATACIÓN DE UNIVERSIDADES O INSTITUTOS SUPERIORES PARA EL PARA DESARROLLO DE CURSO DE ESPECIALIZACIÓN EN APRENDIZAJES BASADOS EN REDES Y LIDERAZGO PEDAGÓGICO 	\N	CONSORCIO FUSIÓN	303331	260	1492482063	\N	\N
483	EE-12007-15-114819	Contratro 602/15 suscripto entre entidades entre Petropar y el MEC 	\N	PETROPAR	\N	360	553320925	\N	\N
484	AM-12007-16-1330	INSUMOS DE OFICINA	\N	DALMI  S.R.L.	\N	330	99802100	\N	\N
485	LP-12007-16-118628\n	LPN Nº 30/2015 ''CONSTRUCCIÓN Y REPARACIÓN DE AULAS CONCEPCIÓN PLURIANUAL - PROGRAMA 822''	\N	Ritter Construcciones S.R.L.	288281	520	6396075826	\N	\N
486	LP-12007-15-112706	CONSTRUCCIÓN Y REPARACIÓN DE AULAS - CONCEPCIÓN - SAN PEDRO - CANINDEYU 	\N	FERNANDO MARCIAL MORENO	295420	520	7399997000	\N	\N
487	LP-1200-15-112707	CONSTRUCCIÓN Y REPARACIÓN DE AULAS - CONCEPCIÓN - SAN PEDRO - CANINDEYU 	\N	ANDRES TORALES	295420	520	3652408400	\N	\N
488	EE-12007-15-107582	Contratro 305/15 suscripto entre entidades entre Petropar y el MEC 	\N	PETROPAR	\N	360	383976000	\N	\N
489	LP-12007-16-119953	LPN Nº 01/2015 ''CONSTRUCCIÓN Y REPARACIÓN DE 34 INSTITUCIONES PLURIANUAL - PROGRAMA 111	\N	Consorcio Urbatec V''	288306	520	2492793888	\N	\N
490	EE-12007-15-107584	Contratro 304/15 suscripto entre entidades entre Petropar y el MEC 	\N	PETROPAR	\N	360	151200000	\N	\N
491	EE-12007-15-127679	Contratro 442/16 suscripto entre entidades entre Petropar y el MEC 	\N	PETROPAR	\N	360	160848307	\N	\N
492	LP-12007-16-118651	LPN 01/2016 ''SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL 2016/2017 - AD REFERENDUM''	\N	Comepar S.A.	300395	848	86729276500	\N	\N
493	LP-12007-16-118463	LPN 01/2016 ''SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS - PLURIANUAL 2016/2017 - AD REFERENDUM''	\N	La Bandeja de Patricia Fernández	300395	848	27644927400	\N	\N
494	LP-12007-16-119618	LPN SBE Nº 07 ''SERVICIO DE COLACIONES ALIMENTARIAS PARA LA EDUCACIÓN MEDIA - PLURIANUAL 2016/2017	\N	Instituto de Artes Culinario de Aida Aquino	304300	848	10427300000	\N	\N
495	LP-12007-16-120771	LPN SBE Nº 10/2016 SERVICIO DE ELABORACIÓN Y DISTRIBUCIÓN DE ALIMENTOS FRESCOS PLURIANUAL 2016/2017 - SEGUNDO LLAMADOS	\N	Consorcio Comepar y Asociados	308924	848	24599232900	\N	\N
496	LP-12007-16-125062	\N	\N	Consorcio Comepar y Asociados	\N	848	25898809860	\N	\N
497	LP-12007-15-110347	LPN SBE N.º 01/2015 “ADQUISICIÓN DE MERIENDA ESCOLAR – PLURIANUAL 2015/2016”	\N	Granos y Aceites S.A.C.I.A.	290756	848	22790490156	\N	\N
498	LP-12007-16-119467	LPN SBE Nº 06/2016 ''ADQUISICIÓN DE GALLETITAS DULCES Y PALITO/ROSQUITA PARA LA MERIENDA ESCOLAR AD REFERÉNDUM''	\N	Gustavo Enrique Fatecha	303807	848	874475200	\N	\N
499	LP-12007-16-119250	\N	\N	Trovato CISA	\N	848	2296334848	\N	\N
\.


--
-- TOC entry 2768 (class 0 OID 0)
-- Dependencies: 210
-- Name: reactivacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reactivacion_id_seq', 499, true);


--
-- TOC entry 2649 (class 0 OID 17471)
-- Dependencies: 211
-- Data for Name: uoc_certificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY uoc_certificacion (id, presupuesto_id, cc, llamado, proveedor, pac, monto, certificado, detalle_tipo) FROM stdin;
23	34	\N	Caja chica	\N	\N	\N	11000000	CA 
24	41	\N	Caja chica	\N	\N	\N	19627700	CA 
25	43	\N	Caja chica	\N	\N	\N	192000000	CA 
26	45	\N	Caja chica	\N	\N	\N	10037625	CA 
28	76	\N	Caja chica	\N	\N	\N	7000000	CA 
29	37		Informe de Saldo - Evaluacion Formacion y Bienestar			0	26500000	LL 
30	38		Informe de Saldo - Evaluacion Formacion y Bienestar			0	6500000	LL 
31	258		Informe de Saldo - Evalucion Formacion y Bienestar			0	25000000	LL 
32	394		Informe de Saldo - Evaluacion Formacion y Evaluacion			0	18136558	LL 
33	78	LP-12007-16-131531 	LPN SBE N°17/20116 “SERVICIODE EMBALAJE Y TRANSPORTE – PLURIANUAL 2016/2017	TRANS – RUTA S.A.	306015	17149733070	17149733070	RA 
34	191	CD-12007-16-131455	CD Nº 14/2016 "ADQUISICIÓN DE PASAJES AÉREOS - PLURIANUAL 2017"	Kostas Viajes y Turismo S.R.L.	306020	140000000	108000000	RA 
35	27		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	66522712	LL 
36	28		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	100000000	LL 
37	126		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	51833600	LL 
38	185		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	48360000	LL 
39	250		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	4262440	LL 
40	324		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	19222484	LL 
41	335		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	52342980	LL 
42	378		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	80000000	LL 
43	401		SERVICIO DE REPARACIÓN Y MANTENIMIENTO DE VEHÍCULOS – PLURIANUAL 2017/2018		321183	2149513841	77968526	LL 
20	26	\N	Caja chica	\N	\N	\N	163631853	CA 
45	29		PAGO DE ALQUILERES			0	9540342416	RA 
46	30		PAGO DE ALQUILERES			0	1466558625	RA 
47	127		PAGO DE ALQUILERES			0	382079901	RA 
48	251		PAGO DE ALQUILERES			0	40000000	RA 
49	31		SERVICIO DE INTERNET Y VPN	COPACO		0	799000000	RA 
50	32		SERVICIO DE INTERNET Y VPN	COPACO		0	446943	RA 
51	33	SI	CD Nº 12/2016 "ADQUISICIÓN DE CERTIFICADOS DIGITALES"	Data Systems SAECA	306247	17057370	17057370	RA 
52	34	LP-12007-15-110018	SERVICIO DE GESTIÓN Y ORGANIZACIÓN DE EVENTOS	PUBLICIDAD MARTINEZ	290144	600000000	1455000	RA 
53	34	LP-12007-15-110020	undefined	AUTO CONTROL S.A.		400000000	17598455	RA 
54	35	CD-12007-16-123891	PROVISION DE AGUA MINERAL EN BIDONES	BES S.A.	306271	106400000	21280000	RA 
55	252	CD-12007-16-123891	PROVISION DE AGUA MINERAL EN BIDONES	BES S.A.	306271	106400000	1230315	RA 
56	325	LP-12007-15-110020	undefined	AUTO CONTROL S.A.		400000000	14731545	RA 
57	325	CD-12007-16-123891	PROVISION DE AGUA MINERAL EN BIDONES	BES S.A.	306271	106400000	3746499	RA 
58	325	LP-12007-15-110018	SERVICIO DE GESTIÓN Y ORGANIZACIÓN DE EVENTOS	PUBLICIDAD MARTINEZ	290144	600000000	36521956	RA 
60	379	LP-12007-15-110018	SERVICIO DE GESTIÓN Y ORGANIZACIÓN DE EVENTOS	PUBLICIDAD MARTINEZ	290144	600000000	52023186	RA 
61	79	LP-12007-15-113636	LPN SBE Nº 08/2015 "ADQUISICIÓN DE KITS DE ÚTILES ESCOLARES - PLURIANUAL 2015/2016 	Alamo S.A.	290798	25196723916	566286882	RA 
62	79	LP-12007-15-113640	LPN SBE Nº 08/2015 "ADQUISICIÓN DE KITS DE ÚTILES ESCOLARES - PLURIANUAL 2015/2016 	NOBEL S.A.	290798	20344805294	566286882	RA 
63	79	LP-12007-16-128620	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Alamo S.A.	306178	36102212255	18000000000	RA 
64	79	LP-12007-16-128619	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Industrias Gráficas Nobel S.A.	306178	22027503776	10000000000	RA 
65	79	LP-12007-16-128622	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Kuatiapo S.A.	306178	3588214160	1500000000	RA 
66	79	LP-12007-16-128629	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Papelera Guaira S.A.	306178	777025442	777025442	RA 
67	79	LP-12007-16-128625	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Géminis Industrial y Comercial S.A.	306178	958872329	958872329	RA 
68	79	LP-12007-16-128381	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Santiago Adolfo Vega espinola	306178	1091407966	1091407966	RA 
69	79	LP-12007-16-128617	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	ATLAS REPRESENTACIONES S.A.	306178	193649820	193649820	RA 
70	79	LP-12007-16-128623	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Importadora del Rey S.A.	306178	1155790021	1155790021	RA 
71	79	LP-12007-16-128627	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	El Faro Industrial y Comercial S.R.L.	306178	1716829878	1716829878	RA 
72	79	LP-12007-16-128618	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Dalmi S.R.L.	306178	1257453946	1257453946	RA 
73	79	LP-12007-16-128626	LPN SBE Nº 14/2016 "Adquisición de Kits Escolar 2016/2017 - PLURIANUAL 	Mercurio S.A.	306178	11226275902	7000000000	RA 
74	79		Adquisición de Kits Escolar 2016/2017 Plurianual Ítems Declarados Desiertos 2do. Llamado Ad Referéndum		301272	0	1194327776	RA 
27	49	\N	Caja chica	\N	\N	\N	8769000	CA 
22	31	\N	Caja chica	\N	\N	\N	17752500	CA 
\.


--
-- TOC entry 2769 (class 0 OID 0)
-- Dependencies: 212
-- Name: uoc_certificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('uoc_certificacion_id_seq', 74, true);


--
-- TOC entry 2651 (class 0 OID 17479)
-- Dependencies: 213
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (usuario, cuenta, pass) FROM stdin;
1	admin	202cb962ac59075b964b07152d234b70
\.


--
-- TOC entry 2770 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuarios_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_usuario_seq', 11, true);


--
-- TOC entry 2646 (class 0 OID 17445)
-- Dependencies: 207
-- Data for Name: viatico_certificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY viatico_certificacion (id, presupuesto_id, monto_certificacion, persona, direccion, categoria_funcionario, destino, certificacion_numeracion, monto_disponible, dias, terminal_pasaje, terminal_alojamiento, terminal_alimentacion, fecha_inicio, fecha_fin, datosviaje) FROM stdin;
93	334	2493414	0	26	0	0	37	407707322	\N	\N	\N	\N	\N	\N	\N
94	334	1813392	0	42	0	0	37	405213908	\N	\N	\N	\N	\N	\N	\N
95	334	6934928	40	45	2	\N	40	403400516	4	0	0	0	2017-05-04	2017-04-07	\N
96	334	5674032	41	45	4	\N	40	396465588	3	0	0	0	2017-04-23	2017-04-25	\N
97	334	6141408	42	45	7	\N	41	390791556	3	0	0	0	2017-04-18	2017-04-20	En atención a las actividades del Sector Educativo del Mercosur, Presidencia Pro Tempore Argentina
67	323	36600000	0	28	0	0	27	223887860	\N	\N	\N	\N	\N	\N	\N
68	323	8300000	0	29	0	0	28	187287860	\N	\N	\N	\N	\N	\N	\N
69	323	11400000	0	29	0	0	29	178987860	\N	\N	\N	\N	\N	\N	\N
70	323	47800000	0	29	0	0	30	167587860	\N	\N	\N	\N	\N	\N	\N
71	323	49900000	0	29	0	0	31	119787860	\N	\N	\N	\N	\N	\N	\N
72	323	26587860	0	31	0	0	32	69887860	\N	\N	\N	\N	\N	\N	\N
73	323	3906604	38	146	4	\N	33	43300000	2	0	0	0	2017-02-11	2017-03-04	\N
74	323	8594529	38	146	4	\N	33	39393396	22	1	1	1	2017-02-11	2017-03-04	\N
77	334	3589005	0	28	0	0	37	430059897	\N	\N	\N	\N	\N	\N	\N
78	334	5440176	0	26	0	0	37	426470892	\N	\N	\N	\N	\N	\N	\N
79	334	2266740	0	27	0	0	37	421030716	\N	\N	\N	\N	\N	\N	\N
80	334	2216368	0	36	0	0	37	418763976	\N	\N	\N	\N	\N	\N	\N
81	334	2568972	0	28	0	0	37	416547608	\N	\N	\N	\N	\N	\N	\N
82	334	453348	0	38	0	0	37	413978636	\N	\N	\N	\N	\N	\N	\N
83	334	906696	0	39	0	0	37	413525288	\N	\N	\N	\N	\N	\N	\N
84	334	1813392	0	40	0	0	37	412618592	\N	\N	\N	\N	\N	\N	\N
85	334	2871204	0	32	0	0	37	410805200	\N	\N	\N	\N	\N	\N	\N
86	334	226674	0	41	0	0	37	407933996	\N	\N	\N	\N	\N	\N	\N
88	503	2209914	0	42	0	0	38	269583496	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2771 (class 0 OID 0)
-- Dependencies: 215
-- Name: viatico_certificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('viatico_certificacion_id_seq', 97, true);


--
-- TOC entry 2654 (class 0 OID 17486)
-- Dependencies: 216
-- Data for Name: viatico_certificacion_numeracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY viatico_certificacion_numeracion (id, fecha, codigo_interno, mes, plan_financiero_id, tipo_viatico, dolar, anteriores) FROM stdin;
27	2017-01-19	12890	1	28	I	0	0
28	2017-01-24	16329	1	28	I	0	36600000
29	2017-01-24	15742	1	28	I	0	44900000
30	2017-01-25	18782	1	28	I	0	56300000
31	2017-01-27	19646	1	28	I	0	104100000
32	2017-01-27	19851	1	28	I	0	154000000
33	2017-01-27	9796	1	28	E	5779	180587860
34	2017-01-31	22691	1	28	I	0	193088993
35	2017-01-31	22691	1	11	I	0	0
36	2017-02-08	28783	2	28	E	5746	0
37	2017-04-04	91965	4	29	I	0	0
38	2017-04-04	98218	4	24	I	0	0
40	2017-04-05	95772	4	29	E	5629	26659381
41	2017-04-05	107803	4	29	E	5624	39268341
42	2017-06-03	184968	6	11	I	0	0
\.


--
-- TOC entry 2772 (class 0 OID 0)
-- Dependencies: 217
-- Name: viatico_certificacion_numeracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('viatico_certificacion_numeracion_id_seq', 42, true);


--
-- TOC entry 2696 (class 0 OID 42503)
-- Dependencies: 258
-- Data for Name: viatico_ditribucion_mensual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY viatico_ditribucion_mensual (id, direccion, mes, monto, certificado) FROM stdin;
4	14	6	5687896	2266740
\.


--
-- TOC entry 2773 (class 0 OID 0)
-- Dependencies: 257
-- Name: viatico_ditribucion_mensual_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('viatico_ditribucion_mensual_id_seq', 8, true);


SET search_path = sistema, pg_catalog;

--
-- TOC entry 2664 (class 0 OID 17689)
-- Dependencies: 226
-- Data for Name: permisos; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY permisos (id, descripcion, path) FROM stdin;
1	Documentos	../Documento/Lista.jspx
2	Contrataciones UOC	../Uoc/
3	Caja Chica	../Cajachica/
100	Cambiar contraseña	../Usuario/Cambiarclave.jspx
4	Cdp	../Cdp/
5	Anteproyecto 2017	../Anteproyecto/Estructura/Tipo.jspx
6	Ejes, componentes y subcomponentes	../Anteproyecto/Estructura/Eje.jspx
7	Ingresos	../Ingresos/
8	Viaticos	../Viaticos/
\.


--
-- TOC entry 2663 (class 0 OID 17681)
-- Dependencies: 225
-- Data for Name: usuarios; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY usuarios (usuario, cuenta, pass) FROM stdin;
1	admin	d41d8cd98f00b204e9800998ecf8427e
8	bety	d41d8cd98f00b204e9800998ecf8427e
9	diana	d41d8cd98f00b204e9800998ecf8427e
11	robert	d41d8cd98f00b204e9800998ecf8427e
4	juan	035f4f82df54baa9b168c263a23d54a3
5	david	d41d8cd98f00b204e9800998ecf8427e
7	susana	6720720054e9d24fbf6c20a831ff287e
3	hugo	d41d8cd98f00b204e9800998ecf8427e
6	lourdes	62bd4b64bcd34c1c1f4e91dae1cdaae7
10	garbini	d41d8cd98f00b204e9800998ecf8427e
\.


--
-- TOC entry 2666 (class 0 OID 17699)
-- Dependencies: 228
-- Data for Name: usuarios_permisos; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY usuarios_permisos (id, usuario, permiso) FROM stdin;
1	1	1
2	3	1
3	4	1
4	5	1
5	6	1
6	7	1
7	8	1
8	9	1
9	4	2
10	10	1
11	11	1
12	11	3
13	1	100
14	3	100
15	4	100
16	5	100
17	7	100
18	8	100
19	9	100
20	10	100
21	6	100
22	11	100
53	3	4
23	6	4
24	3	5
25	4	5
26	11	5
27	7	5
28	9	5
29	3	6
30	4	6
31	11	6
32	10	7
54	4	4
34	9	6
35	7	6
55	5	4
37	1	5
38	1	6
39	1	7
40	1	8
41	9	8
42	8	8
43	1	2
44	1	4
45	1	3
46	10	5
47	10	6
48	6	5
49	6	6
50	8	5
51	8	6
56	7	4
57	8	4
58	9	4
59	10	4
60	11	4
\.


--
-- TOC entry 2774 (class 0 OID 0)
-- Dependencies: 227
-- Name: usuarios_permisos_id_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_permisos_id_seq', 60, true);


SET search_path = estructura, pg_catalog;

--
-- TOC entry 2461 (class 2606 OID 34192)
-- Name: Proyectos_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT "Proyectos_pkey" PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 34194)
-- Name: Proyectos_tp_pg_sp_py_key; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT "Proyectos_tp_pg_sp_py_key" UNIQUE (tp, pg, sp, py);


--
-- TOC entry 2477 (class 2606 OID 34255)
-- Name: componentes_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY componentes
    ADD CONSTRAINT componentes_pkey PRIMARY KEY (componente);


--
-- TOC entry 2479 (class 2606 OID 34257)
-- Name: ejes_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ejes
    ADD CONSTRAINT ejes_pkey PRIMARY KEY (eje);


--
-- TOC entry 2487 (class 2606 OID 34305)
-- Name: items_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 34307)
-- Name: niveles_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY niveles
    ADD CONSTRAINT niveles_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 34196)
-- Name: programas_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programas
    ADD CONSTRAINT programas_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 34198)
-- Name: programas_tipo_programa_key; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programas
    ADD CONSTRAINT programas_tipo_programa_key UNIQUE (tp, pg);


--
-- TOC entry 2481 (class 2606 OID 34259)
-- Name: propositos_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY propositos
    ADD CONSTRAINT propositos_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 34261)
-- Name: subcomponentes_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subcomponentes
    ADD CONSTRAINT subcomponentes_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 34200)
-- Name: subprogramas_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subprogramas
    ADD CONSTRAINT subprogramas_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 34202)
-- Name: subprogramas_tp_pg_sp_key; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subprogramas
    ADD CONSTRAINT subprogramas_tp_pg_sp_key UNIQUE (tp, pg, sp);


--
-- TOC entry 2473 (class 2606 OID 34204)
-- Name: tipos_pkey; Type: CONSTRAINT; Schema: estructura; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipos
    ADD CONSTRAINT tipos_pkey PRIMARY KEY (tipo);


SET search_path = presupuesto, pg_catalog;

--
-- TOC entry 2485 (class 2606 OID 34276)
-- Name: Distribucion_subcomponentes_pkey; Type: CONSTRAINT; Schema: presupuesto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY distribucion_componente
    ADD CONSTRAINT "Distribucion_subcomponentes_pkey" PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 34223)
-- Name: anteproyecto2017_pkey; Type: CONSTRAINT; Schema: presupuesto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY anteproyecto2017
    ADD CONSTRAINT anteproyecto2017_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2389 (class 2606 OID 17514)
-- Name: DireccionesIngresos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY direcciones_ingresos
    ADD CONSTRAINT "DireccionesIngresos_pkey" PRIMARY KEY (direccion);


--
-- TOC entry 2379 (class 2606 OID 17516)
-- Name: DistribucionIngresoPF_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY distribucion_ingresos
    ADD CONSTRAINT "DistribucionIngresoPF_pkey" PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 17518)
-- Name: cajachica_certificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cajachica_certificacion
    ADD CONSTRAINT cajachica_certificacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 17520)
-- Name: cajachica_distribucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cajachica_distribucion
    ADD CONSTRAINT cajachica_distribucion_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 17763)
-- Name: cajachica_ejecucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cajachica_ejecucion
    ADD CONSTRAINT cajachica_ejecucion_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 17646)
-- Name: cdp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cdp
    ADD CONSTRAINT cdp_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 17715)
-- Name: direcciones_moviento_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documentos_movimiento_estado
    ADD CONSTRAINT direcciones_moviento_estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 17522)
-- Name: direcciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 17524)
-- Name: distribucion_ingresos_plan_id_direccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY distribucion_ingresos
    ADD CONSTRAINT distribucion_ingresos_plan_id_direccion_key UNIQUE (presupuesto_id, direccion);


--
-- TOC entry 2453 (class 2606 OID 17730)
-- Name: documentos_movimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documentos_movimiento
    ADD CONSTRAINT documentos_movimiento_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 17672)
-- Name: documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documentos
    ADD CONSTRAINT documentos_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 17526)
-- Name: enlaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enlaces
    ADD CONSTRAINT enlaces_pkey PRIMARY KEY (enlace);


--
-- TOC entry 2437 (class 2606 OID 17654)
-- Name: estructura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estructura
    ADD CONSTRAINT estructura_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 17528)
-- Name: funcionario_clasificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario_categoria
    ADD CONSTRAINT funcionario_clasificacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 17530)
-- Name: ingresos_certificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingresos_certificacion
    ADD CONSTRAINT ingresos_certificacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 17532)
-- Name: ingresos_certificacion_plan_id_direccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingresos_certificacion
    ADD CONSTRAINT ingresos_certificacion_plan_id_direccion_key UNIQUE (plan_id, direccion);


--
-- TOC entry 2399 (class 2606 OID 17534)
-- Name: ingresos_ejecucion_id_direccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingresos_ejecucion
    ADD CONSTRAINT ingresos_ejecucion_id_direccion_key UNIQUE (id, direccion);


--
-- TOC entry 2401 (class 2606 OID 17536)
-- Name: ingresos_ejecucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingresos_ejecucion
    ADD CONSTRAINT ingresos_ejecucion_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 17538)
-- Name: llamados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY llamados
    ADD CONSTRAINT llamados_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 17540)
-- Name: meses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meses
    ADD CONSTRAINT meses_pkey PRIMARY KEY (mes);


--
-- TOC entry 2459 (class 2606 OID 34155)
-- Name: objetos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY objetos
    ADD CONSTRAINT objetos_pkey PRIMARY KEY (obj);


--
-- TOC entry 2407 (class 2606 OID 17542)
-- Name: pais_ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais_ciudad
    ADD CONSTRAINT pais_ciudad_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 17544)
-- Name: personas_cedula_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_cedula_key UNIQUE (cedula);


--
-- TOC entry 2411 (class 2606 OID 17546)
-- Name: personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (persona);


--
-- TOC entry 2413 (class 2606 OID 17548)
-- Name: plan2016_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plan
    ADD CONSTRAINT plan2016_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 17550)
-- Name: plan_detalle2016_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plan_detalle
    ADD CONSTRAINT plan_detalle2016_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 17552)
-- Name: plan_financiero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plan_financiero
    ADD CONSTRAINT plan_financiero_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 17554)
-- Name: plan_financiero_presupuesto_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plan_financiero
    ADD CONSTRAINT plan_financiero_presupuesto_id_key UNIQUE (presupuesto_id);


--
-- TOC entry 2421 (class 2606 OID 17556)
-- Name: presupuesto_vigente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presupuesto_vigente
    ADD CONSTRAINT presupuesto_vigente_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 25963)
-- Name: productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (producto);


--
-- TOC entry 2425 (class 2606 OID 17558)
-- Name: reactivacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reactivacion
    ADD CONSTRAINT reactivacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 17560)
-- Name: unique_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT unique_usuario UNIQUE (cuenta);


--
-- TOC entry 2427 (class 2606 OID 17562)
-- Name: uoc_certificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY uoc_certificacion
    ADD CONSTRAINT uoc_certificacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 17564)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (usuario);


--
-- TOC entry 2433 (class 2606 OID 17566)
-- Name: viatico_certificacion_numeracion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY viatico_certificacion_numeracion
    ADD CONSTRAINT viatico_certificacion_numeracion_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 17568)
-- Name: viatico_certificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY viatico_certificacion
    ADD CONSTRAINT viatico_certificacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 42512)
-- Name: viatico_ditribucion_mensual_direccion_mes_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY viatico_ditribucion_mensual
    ADD CONSTRAINT viatico_ditribucion_mensual_direccion_mes_key UNIQUE (direccion, mes);


--
-- TOC entry 2493 (class 2606 OID 42508)
-- Name: viatico_ditribucion_mensual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY viatico_ditribucion_mensual
    ADD CONSTRAINT viatico_ditribucion_mensual_pkey PRIMARY KEY (id);


SET search_path = sistema, pg_catalog;

--
-- TOC entry 2445 (class 2606 OID 17696)
-- Name: permisos_pkey; Type: CONSTRAINT; Schema: sistema; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 17688)
-- Name: unique_usuario; Type: CONSTRAINT; Schema: sistema; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT unique_usuario UNIQUE (cuenta);


--
-- TOC entry 2447 (class 2606 OID 17704)
-- Name: usuarios_permisos_pkey; Type: CONSTRAINT; Schema: sistema; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios_permisos
    ADD CONSTRAINT usuarios_permisos_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 17706)
-- Name: usuarios_permisos_usuario_permiso_key; Type: CONSTRAINT; Schema: sistema; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios_permisos
    ADD CONSTRAINT usuarios_permisos_usuario_permiso_key UNIQUE (usuario, permiso);


--
-- TOC entry 2443 (class 2606 OID 17686)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: sistema; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (usuario);


SET search_path = estructura, pg_catalog;

--
-- TOC entry 2502 (class 2606 OID 34205)
-- Name: proyectos_subprograma_fkey; Type: FK CONSTRAINT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_subprograma_fkey FOREIGN KEY (subprograma) REFERENCES subprogramas(id);


--
-- TOC entry 2503 (class 2606 OID 34210)
-- Name: subprogramas_programa_fkey; Type: FK CONSTRAINT; Schema: estructura; Owner: postgres
--

ALTER TABLE ONLY subprogramas
    ADD CONSTRAINT subprogramas_programa_fkey FOREIGN KEY (programa) REFERENCES programas(id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2495 (class 2606 OID 17569)
-- Name: cajachica_certificacion_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cajachica_certificacion
    ADD CONSTRAINT cajachica_certificacion_direccion_fkey FOREIGN KEY (direccion) REFERENCES direcciones(id);


--
-- TOC entry 2494 (class 2606 OID 17574)
-- Name: distribucion_ingreso_pf_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY distribucion_ingresos
    ADD CONSTRAINT distribucion_ingreso_pf_direccion_fkey FOREIGN KEY (direccion) REFERENCES direcciones_ingresos(direccion);


--
-- TOC entry 2499 (class 2606 OID 17675)
-- Name: documentos_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documentos
    ADD CONSTRAINT documentos_direccion_fkey FOREIGN KEY (direccion) REFERENCES direcciones(id) MATCH FULL;


--
-- TOC entry 2500 (class 2606 OID 17731)
-- Name: documentos_movimiento_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documentos_movimiento
    ADD CONSTRAINT documentos_movimiento_documento_fkey FOREIGN KEY (documento) REFERENCES documentos(id) ON DELETE CASCADE;


--
-- TOC entry 2501 (class 2606 OID 17736)
-- Name: documentos_movimiento_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documentos_movimiento
    ADD CONSTRAINT documentos_movimiento_usuario_fkey FOREIGN KEY (usuario) REFERENCES sistema.usuarios(usuario);


--
-- TOC entry 2496 (class 2606 OID 17579)
-- Name: ingresos_certificacion_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingresos_certificacion
    ADD CONSTRAINT ingresos_certificacion_direccion_fkey FOREIGN KEY (direccion) REFERENCES direcciones_ingresos(direccion);


--
-- TOC entry 2497 (class 2606 OID 17584)
-- Name: ingresos_ejecucion_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingresos_ejecucion
    ADD CONSTRAINT ingresos_ejecucion_direccion_fkey FOREIGN KEY (direccion) REFERENCES direcciones_ingresos(direccion);


--
-- TOC entry 2498 (class 2606 OID 17594)
-- Name: viatico_certificacion_numeracion_plan_financiero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viatico_certificacion_numeracion
    ADD CONSTRAINT viatico_certificacion_numeracion_plan_financiero_id_fkey FOREIGN KEY (plan_financiero_id) REFERENCES plan_financiero(id);


--
-- TOC entry 2504 (class 2606 OID 42513)
-- Name: viatico_ditribucion_mensual_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viatico_ditribucion_mensual
    ADD CONSTRAINT viatico_ditribucion_mensual_direccion_fkey FOREIGN KEY (direccion) REFERENCES direcciones(id);


--
-- TOC entry 2703 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-06-25 15:03:47 PYT

--
-- PostgreSQL database dump complete
--

