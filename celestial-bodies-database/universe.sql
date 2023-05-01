--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(25) NOT NULL,
    age_in_millions_of_years integer,
    satellites_number integer,
    density numeric,
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(25) NOT NULL,
    cosmic_distance integer,
    radius integer,
    density numeric,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(25) NOT NULL,
    cosmic_distance integer,
    satellites_number integer,
    density numeric,
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: ring; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ring (
    ring_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.ring OWNER TO freecodecamp;

--
-- Name: ring_ring_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ring_ring_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ring_ring_id_seq OWNER TO freecodecamp;

--
-- Name: ring_ring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ring_ring_id_seq OWNED BY public.ring.ring_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25) NOT NULL,
    age_in_millions_of_years integer,
    satellites_number integer,
    density numeric,
    description text,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: ring ring_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring ALTER COLUMN ring_id SET DEFAULT nextval('public.ring_ring_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 3, 30, 2.56, 'Galaxia espiral situada a 2.5 millones de años luz', false, false);
INSERT INTO public.galaxy VALUES (2, 'Vía Lactea', 230, 300, 2.325, 'Galaxia donde vivimos los humanos', true, false);
INSERT INTO public.galaxy VALUES (3, 'Galaxia del Triángulo', 3, 240, 1.255, 'Galaxia espiral más pequeña que Andrromeda y la Vía Láctea', false, false);
INSERT INTO public.galaxy VALUES (4, 'Enana del Can Mayor', 0, 40, 104.255, 'Galaxia satélite de la Vía Láctea', false, false);
INSERT INTO public.galaxy VALUES (5, 'Willman 1', 0, 50, 224.255, 'Galaxia satélite de la Vía Láctea más lejana que la Enana del Can Mayor', false, false);
INSERT INTO public.galaxy VALUES (6, 'Andrómeda XIX', 3, 50, 524.255, 'Galaxia satélite de Andrómeda', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'La Luna', 356, 384, 3.34, 'Único satélite natural de la Tierra', true, true, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', 556, 9377, 1.85, 'Satélite natural de Marte', false, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 556, 23460, 2.2, 'Satélite natural pequeño de Marte', false, true, 4);
INSERT INTO public.moon VALUES (4, 'Luna exoplanetaria', 25856, 23460, 7.2, 'Satélite del Exoplaneta', false, true, 1);
INSERT INTO public.moon VALUES (5, 'Luna Mercurio', 25856, 23460, 7.2, 'Luna inventada de Mercurio', false, true, 2);
INSERT INTO public.moon VALUES (6, 'Luna exoplanetaria 2', 35356, 23130, 3.1, 'Luna de la galaxia triangular', false, true, 5);
INSERT INTO public.moon VALUES (7, 'Luna inventada Venus', 321, 3130, 4.7, 'Luna inventada de Venus', false, true, 6);
INSERT INTO public.moon VALUES (8, 'Ío', 721, 421, 3.55, 'Satélite más cercano a Júpiter', false, true, 7);
INSERT INTO public.moon VALUES (9, 'Europa', 721, 670, 3.013, 'Satélite galileano más pequeño de Júpiter', false, true, 7);
INSERT INTO public.moon VALUES (10, 'Ganimedes', 721, 1007, 1.936, 'Satélite más grande de Júpiter', false, true, 7);
INSERT INTO public.moon VALUES (11, 'Calisto', 721, 1883, 1.834, 'Segundo satélite más grande de Júpiter', false, true, 7);
INSERT INTO public.moon VALUES (12, 'Encélado', 950, 238, 1.609, 'Sexto satélite más grande de Saturno', false, true, 8);
INSERT INTO public.moon VALUES (13, 'Titán', 950, 2574, 1.88, 'Satélite más grande de Saturno', false, true, 8);
INSERT INTO public.moon VALUES (14, 'Calypso', 950, 574, 3.58, 'Satélite pequeño de Saturno', false, true, 8);
INSERT INTO public.moon VALUES (15, 'Ariel', 1234, 224, 1.524, 'Satélite pequeño de Urano', false, true, 9);
INSERT INTO public.moon VALUES (16, 'Galatea', 3475, 458, 2.48, 'Satélite confirmado de Neptuno', false, true, 10);
INSERT INTO public.moon VALUES (17, 'Triton', 3475, 852, 1.22, 'Satélite de Neptuno con hielo nitrogenado', false, true, 10);
INSERT INTO public.moon VALUES (18, 'Luna Enana', 6317, 221, 1.67, 'Satélite del planeta Enano', false, true, 11);
INSERT INTO public.moon VALUES (19, 'Luna Wilmaniense', 9114, 324, 1.59, 'Satélite del planeta Wilman', false, true, 12);
INSERT INTO public.moon VALUES (20, 'Luna Andromediana', 12487, 875, 5.32, 'Satélite del planeta Andromediano', false, true, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Exoplaneta', 20, 7, 73.255, 'Exoplaneta de Andrómeda', false, false, 1);
INSERT INTO public.planet VALUES (5, 'Exoplaneta', 30, 7, 83.255, 'Planeta inventado para la Galaxia Triangular', false, true, 3);
INSERT INTO public.planet VALUES (3, 'La Tierra', 0, 4551, 5.515, 'Tercer planeta del Sistema Solar de la Vía Láctea', true, true, 2);
INSERT INTO public.planet VALUES (6, 'Venus', 261, 0, 5.24, 'Segundo planeta del Sistema Solar de la Vía Láctea', false, true, 2);
INSERT INTO public.planet VALUES (2, 'Mercurio', 82, 0, 5.43, 'Primer planeta del Sistema Solar de la Vía Láctea', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Marte', 55, 2, 3.93, 'Cuarto planeta del Sistema Solar de la Vía Láctea', false, true, 2);
INSERT INTO public.planet VALUES (7, 'Júpiter', 588, 92, 1336.00, 'Quinto planeta del Sistema Solar', false, true, 2);
INSERT INTO public.planet VALUES (8, 'Saturno', 1195, 83, 690.00, 'Sexto planeta del Sistema Solar', false, true, 2);
INSERT INTO public.planet VALUES (9, 'Urano', 2600, 27, 1.274, 'Séptimo planeta del Sistema Solar', false, true, 2);
INSERT INTO public.planet VALUES (10, 'Neptuno', 4300, 14, 1.64, 'Octavo planeta del Sistema Solar', false, true, 2);
INSERT INTO public.planet VALUES (11, 'Planeta Enano', 8000, 40, 45.05, 'Planeta de la galaxia Enana del Can Mayor', false, true, 4);
INSERT INTO public.planet VALUES (12, 'Planeta de Wilman', 8000, 40, 45.05, 'Planeta de la galaxia Wilman 1', false, true, 5);
INSERT INTO public.planet VALUES (13, 'Planeta Andromediano', 12000, 20, 15.05, 'Planeta de la galaxia Andrómeda XIX', false, true, 6);


--
-- Data for Name: ring; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ring VALUES (1, 'Anillo de Júpiter', 7);
INSERT INTO public.ring VALUES (2, 'Anillo de Saturno', 8);
INSERT INTO public.ring VALUES (3, 'Anillo de Urano', 9);
INSERT INTO public.ring VALUES (4, 'Anillo de Neptuno', 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Estrella inventada', 5, 3, 23.255, 'Estrella de Andrómeda', false, false, 1);
INSERT INTO public.star VALUES (3, 'Estrella Triángulo', 7, 3, 63.255, 'Estrella de Triángulo', false, false, 3);
INSERT INTO public.star VALUES (4, 'Estrella cuadrada', 1, 2, 45.98, 'Estrella de la galaxia Enana del Can Mayor', false, false, 4);
INSERT INTO public.star VALUES (5, 'Estrella wilmaniense', 2, 1, 145.98, 'Estrella de la galaxia Willman 1', false, false, 5);
INSERT INTO public.star VALUES (6, 'Estrella andromedána', 5, 1, 2145.58, 'Estrella de la galaxia Andrómeda XIX', false, true, 6);
INSERT INTO public.star VALUES (2, 'Sol', 5, 3, 23.255, 'Estrella de Vía Láctea', false, false, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: ring_ring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ring_ring_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_id UNIQUE (planet_id);


--
-- Name: ring ring_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_pk PRIMARY KEY (ring_id);


--
-- Name: ring ring_ring_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_ring_id_key UNIQUE (ring_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unico; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unico UNIQUE (galaxy_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star galaxy_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_reference FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_reference FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_reference FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

