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
    name character varying(20),
    description text NOT NULL,
    age_mil integer NOT NULL,
    distance_earth numeric,
    has_life boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20),
    description text,
    age_mil integer NOT NULL,
    distance_earth numeric NOT NULL,
    has_life boolean,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20),
    description text,
    age_mil integer NOT NULL,
    distance_earth numeric NOT NULL,
    has_life boolean,
    planet_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(20),
    description text NOT NULL,
    age_mil integer,
    distance_earth numeric,
    has_life boolean,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    name character varying(20),
    description text,
    age_mil integer NOT NULL,
    sun_id integer NOT NULL
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky way', 'massive', 1000000, 1000.9, true, 1);
INSERT INTO public.galaxy VALUES ('Haley', 'dry', 30000, 70000.7, false, 2);
INSERT INTO public.galaxy VALUES ('Zyzz', 'Moist', 999999, 54.7, true, 3);
INSERT INTO public.galaxy VALUES ('Ali', 'Barren', 60000, 300.5, false, 4);
INSERT INTO public.galaxy VALUES ('AB', 'Tiny', 500, 10.5, false, 5);
INSERT INTO public.galaxy VALUES ('KP', 'Large', 10, 600.4, false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Dark Night', 'vast and quite', 1043, 607.7, false, 1, 1);
INSERT INTO public.moon VALUES ('lightning', 'bright', 1203, 45.1, true, 2, 2);
INSERT INTO public.moon VALUES ('lizard island', 'very dry', 1208, 123.2, false, 3, 3);
INSERT INTO public.moon VALUES ('demon island', 'red and active', 1294, 56.4, false, 4, 4);
INSERT INTO public.moon VALUES ('Big bird', 'waterless and empty', 456, 68.2, false, 5, 5);
INSERT INTO public.moon VALUES ('Hollow moon', 'vibrant', 324, 657.1, true, 6, 6);
INSERT INTO public.moon VALUES ('matrix', 'very much alive', 676, 677.1, true, 7, 7);
INSERT INTO public.moon VALUES ('Neo', 'Neon', 402, 202.1, false, 8, 8);
INSERT INTO public.moon VALUES ('Sexy moon', 'rare', 555, 555.1, true, 9, 9);
INSERT INTO public.moon VALUES ('MG', 'Consistent', 433, 433.1, false, 10, 10);
INSERT INTO public.moon VALUES ('Falcon', 'far', 567, 567.1, false, 11, 11);
INSERT INTO public.moon VALUES ('Neverland', 'vibrant', 750, 750.1, true, 12, 12);
INSERT INTO public.moon VALUES ('Far Far away', 'shrek_life', 450, 450.1, false, 13, 13);
INSERT INTO public.moon VALUES ('Atlantis', 'lots of water', 300, 300.1, false, 14, 14);
INSERT INTO public.moon VALUES ('El der rado', 'Moon of gold', 200, 200.1, false, 15, 15);
INSERT INTO public.moon VALUES ('Red Sea Moon', 'red', 459, 459.1, true, 16, 16);
INSERT INTO public.moon VALUES ('Blue sea moon', 'Blue', 509, 509.2, false, 17, 17);
INSERT INTO public.moon VALUES ('Yellow Moon', 'Yellow', 209, 209.1, false, 18, 18);
INSERT INTO public.moon VALUES ('Pink moon', 'pink', 309, 508.1, true, 19, 19);
INSERT INTO public.moon VALUES ('Black Moon', 'Black', 510, 518.3, false, 20, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('JS', 'built', 698, 439.7, false, 1, 1);
INSERT INTO public.planet VALUES ('MO', 'strong', 666, 990.3, false, 2, 2);
INSERT INTO public.planet VALUES ('CG', 'Rich', 2, 4.2, true, 3, 3);
INSERT INTO public.planet VALUES ('RP', 'fading', 469, 89.2, false, 4, 4);
INSERT INTO public.planet VALUES ('SC', 'vast', 333, 333.3, true, 5, 5);
INSERT INTO public.planet VALUES ('JD', 'newcomer', 878, 878.4, false, 6, 6);
INSERT INTO public.planet VALUES ('DG', 'dull', 949, 94.9, false, 7, 7);
INSERT INTO public.planet VALUES ('MC', 'Far', 100, 94.5, true, 8, 8);
INSERT INTO public.planet VALUES ('JP', 'bleak', 601, 601.1, true, 9, 9);
INSERT INTO public.planet VALUES ('Triple H', 'Hardcore', 353, 353.1, true, 10, 10);
INSERT INTO public.planet VALUES ('HBK', 'aesthetic', 8789, 34994.1, false, 11, 11);
INSERT INTO public.planet VALUES ('RR', 'big dawg', 353545, 647583.1, true, 12, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Junaid', 'shiny', 300, 5000.9, true, 1, 1);
INSERT INTO public.star VALUES ('DB', 'Fast', 54, 67.1, false, 2, 2);
INSERT INTO public.star VALUES ('TB', 'Large', 70, 50.3, true, 3, 3);
INSERT INTO public.star VALUES ('BL', 'Unique', 402, 79.4, true, 4, 4);
INSERT INTO public.star VALUES ('QC', 'aggressive', 700, 89.9, true, 5, 5);
INSERT INTO public.star VALUES ('DS', 'Swift', 400, 800.3, false, 6, 6);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES ('boiler', 'very hot', 400937, 1);
INSERT INTO public.sun VALUES ('Sauna', 'extremely hot', 548, 2);
INSERT INTO public.sun VALUES ('Warmy', 'steamy', 5678, 3);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 20, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 12, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 6, true);


--
-- Name: sun age_mil; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT age_mil UNIQUE (age_mil);


--
-- Name: star distance_earth; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT distance_earth UNIQUE (distance_earth);


--
-- Name: planet distance_earth1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT distance_earth1 UNIQUE (distance_earth);


--
-- Name: moon distance_earth2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT distance_earth2 UNIQUE (distance_earth);


--
-- Name: galaxy galaxy_distance_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_earth_key UNIQUE (distance_earth);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

