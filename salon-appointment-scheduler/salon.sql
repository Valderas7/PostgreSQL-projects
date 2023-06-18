--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg110+1)

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

DROP DATABASE salon;
--
-- Name: salon; Type: DATABASE; Schema: -; Owner: valderas
--

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE salon OWNER TO valderas;

\connect salon

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: valderas
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer NOT NULL,
    service_id integer NOT NULL,
    "time" character varying(30)
);


ALTER TABLE public.appointments OWNER TO valderas;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: valderas
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_appointment_id_seq OWNER TO valderas;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valderas
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: valderas
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(30),
    name character varying(30)
);


ALTER TABLE public.customers OWNER TO valderas;

--
-- Name: customers_costumer_id_seq; Type: SEQUENCE; Schema: public; Owner: valderas
--

CREATE SEQUENCE public.customers_costumer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_costumer_id_seq OWNER TO valderas;

--
-- Name: customers_costumer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valderas
--

ALTER SEQUENCE public.customers_costumer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: valderas
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.services OWNER TO valderas;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: valderas
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO valderas;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valderas
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_costumer_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: valderas
--

INSERT INTO public.appointments VALUES (10, 17, 1, '9AM');
INSERT INTO public.appointments VALUES (11, 18, 2, '10AM');
INSERT INTO public.appointments VALUES (12, 19, 3, '12AM');
INSERT INTO public.appointments VALUES (13, 18, 4, '6PM');


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: valderas
--

INSERT INTO public.customers VALUES (17, '643 23 43 21', 'Fabio');
INSERT INTO public.customers VALUES (18, '645 64 56 63', 'Sara');
INSERT INTO public.customers VALUES (19, '876 43 23 41', 'Paula');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: valderas
--

INSERT INTO public.services VALUES (1, 'cut');
INSERT INTO public.services VALUES (2, 'color');
INSERT INTO public.services VALUES (3, 'perm');
INSERT INTO public.services VALUES (4, 'style');
INSERT INTO public.services VALUES (5, 'trim');


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valderas
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 13, true);


--
-- Name: customers_costumer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valderas
--

SELECT pg_catalog.setval('public.customers_costumer_id_seq', 19, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valderas
--

SELECT pg_catalog.setval('public.services_service_id_seq', 1, false);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: appointments customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: appointments service_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valderas
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT service_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- PostgreSQL database dump complete
--

