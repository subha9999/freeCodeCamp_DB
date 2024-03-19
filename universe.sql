--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    orbital_period_in_years text,
    name character varying(30) NOT NULL,
    discovery_date date,
    size integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    size numeric,
    is_active boolean,
    type character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    distance_from_planet integer,
    diameter numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.planet_planet_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    no_of_moons integer,
    star_id integer,
    distance_from_sun integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_active boolean,
    classification text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, '76', 'Comet Halley', NULL, NULL);
INSERT INTO public.comet VALUES (2, '2533', 'Comet Hale-Bopp', NULL, NULL);
INSERT INTO public.comet VALUES (3, '70000', 'Hyakutake', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 8000000, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 1500000, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 50000, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centauraus A', 60000, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 70000, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Europa', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Deimes', 3, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', 7, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Triton', 8, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Dione', 6, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Charon', 9, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Phoebe', 6, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Hyperion', 6, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Amalthea', 2, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 3, NULL);
INSERT INTO public.planet VALUES (2, 'Jupiter', 79, 5, NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 2, 4, NULL);
INSERT INTO public.planet VALUES (4, 'Mercury', NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Venus', NULL, 2, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 6, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 6, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 5, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, 4, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', NULL, 4, NULL);
INSERT INTO public.planet VALUES (11, 'Ceres', NULL, 5, NULL);
INSERT INTO public.planet VALUES (12, 'Eris', NULL, 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', true, 'Main Sequence', 1);
INSERT INTO public.star VALUES (2, 'Sombrero Prime', true, 'Red Giant', 6);
INSERT INTO public.star VALUES (3, 'Centauraus A Prime', true, 'Blue Supergiant', 5);
INSERT INTO public.star VALUES (4, 'Messier 87 Alpha', true, 'White Dwarf', 3);
INSERT INTO public.star VALUES (5, 'Andromeda Prime', true, 'Binary Sytem', 2);
INSERT INTO public.star VALUES (6, 'Triangulum Prime', true, 'Red Dwarf', 4);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_orbital_period_in_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_orbital_period_in_years_key UNIQUE (orbital_period_in_years);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

