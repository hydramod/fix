--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-1.pgdg22.04+1)

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
-- Name: category; Type: TABLE; Schema: public; Owner: gitpod
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying(25) NOT NULL
);


ALTER TABLE public.category OWNER TO gitpod;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: gitpod
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO gitpod;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitpod
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: gitpod
--

CREATE TABLE public.task (
    id integer NOT NULL,
    task_name character varying(50) NOT NULL,
    task_description text NOT NULL,
    is_urgent boolean NOT NULL,
    due_date date NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.task OWNER TO gitpod;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: gitpod
--

CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO gitpod;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitpod
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: gitpod
--

COPY public.category (id, category_name) FROM stdin;
1	Travel
2	Fitness
3	Coding
4	Home
5	Shopping
6	Personal
7	Music
8	Work
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: gitpod
--

COPY public.task (id, task_name, task_description, is_urgent, due_date, category_id) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitpod
--

SELECT pg_catalog.setval('public.category_id_seq', 8, true);


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitpod
--

SELECT pg_catalog.setval('public.task_id_seq', 1, false);


--
-- Name: category category_category_name_key; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_category_name_key UNIQUE (category_name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: task task_task_name_key; Type: CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_task_name_key UNIQUE (task_name);


--
-- Name: task task_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gitpod
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

