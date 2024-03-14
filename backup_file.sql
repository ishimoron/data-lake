--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: enterprises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enterprises (
    enterpriseid integer NOT NULL,
    name character varying(100),
    taxid character varying(20),
    address character varying(255),
    permissions character varying(255),
    userhash character varying(255)
);


ALTER TABLE public.enterprises OWNER TO postgres;

--
-- Name: enterprises_enterpriseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enterprises_enterpriseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enterprises_enterpriseid_seq OWNER TO postgres;

--
-- Name: enterprises_enterpriseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enterprises_enterpriseid_seq OWNED BY public.enterprises.enterpriseid;


--
-- Name: userenterprises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userenterprises (
    userid integer NOT NULL,
    enterpriseid integer NOT NULL
);


ALTER TABLE public.userenterprises OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    email character varying(255),
    firstname character varying(50),
    lastname character varying(50),
    phonenumber character varying(15)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: enterprises enterpriseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enterprises ALTER COLUMN enterpriseid SET DEFAULT nextval('public.enterprises_enterpriseid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: enterprises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enterprises (enterpriseid, name, taxid, address, permissions, userhash) FROM stdin;
1	Google	537686853832	41 Street	perm1 perm2	0xHash1 OxHash2
2	Amazon	478865109644	26 Street	perm1 perm2	0xHash1 OxHash2
3	Amazon	017626594273	31 Street	perm1 perm2	0xHash1 OxHash2
4	Google	044128017413	03 Street	perm1 perm2	0xHash1 OxHash2
5	Google	796405512271	98 Street	perm1 perm2	0xHash1 OxHash2
6	Data-Lake	224083696057	09 Street	perm1 perm2	0xHash1 OxHash2
\.


--
-- Data for Name: userenterprises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userenterprises (userid, enterpriseid) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, email, firstname, lastname, phonenumber) FROM stdin;
\.


--
-- Name: enterprises_enterpriseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enterprises_enterpriseid_seq', 6, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 1, false);


--
-- Name: enterprises enterprises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enterprises
    ADD CONSTRAINT enterprises_pkey PRIMARY KEY (enterpriseid);


--
-- Name: enterprises enterprises_taxid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enterprises
    ADD CONSTRAINT enterprises_taxid_key UNIQUE (taxid);


--
-- Name: userenterprises userenterprises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userenterprises
    ADD CONSTRAINT userenterprises_pkey PRIMARY KEY (userid, enterpriseid);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: userenterprises userenterprises_enterpriseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userenterprises
    ADD CONSTRAINT userenterprises_enterpriseid_fkey FOREIGN KEY (enterpriseid) REFERENCES public.enterprises(enterpriseid);


--
-- Name: userenterprises userenterprises_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userenterprises
    ADD CONSTRAINT userenterprises_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- PostgreSQL database dump complete
--

