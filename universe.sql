--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying NOT NULL,
    description text,
    diameter integer NOT NULL,
    age integer,
    mass numeric,
    has_black_hole boolean DEFAULT false NOT NULL,
    observable boolean NOT NULL
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
    name character varying NOT NULL,
    description text,
    orbital_period integer NOT NULL,
    radius integer,
    has_water numeric,
    rocky boolean DEFAULT true NOT NULL,
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    description text,
    num_moons integer DEFAULT 0 NOT NULL,
    distance integer,
    diameter numeric,
    habitable boolean DEFAULT false NOT NULL,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    temperature integer NOT NULL,
    radius integer,
    luminosity numeric,
    has_planets boolean DEFAULT true NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: supernova; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supernova (
    supernova_id integer NOT NULL,
    name character varying NOT NULL,
    explosion_date integer NOT NULL,
    brightness numeric,
    observed boolean NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.supernova OWNER TO freecodecamp;

--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supernova_supernova_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supernova_supernova_id_seq OWNER TO freecodecamp;

--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supernova_supernova_id_seq OWNED BY public.supernova.supernova_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: supernova supernova_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova ALTER COLUMN supernova_id SET DEFAULT nextval('public.supernova_supernova_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Nasza galaktyka spiralna', 100000, 13600, 1500000000000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Najbliższa duża galaktyka', 220000, 10000, 1200000000000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Trzecia co do wielkości w Grupie Lokalnej', 60000, 12000, 50000000000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiralna z interakcją', 97000, 400, 100000000000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Z centralnym supermasywnym BH', 90000, 11000, 75000000000, true, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Z ogromnym BH', 98000, 12000, 2400000000000, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Księżyc Ziemi', 27, 1737, 0.0, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Księżyc Marsa', 0, 22, 0.0, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Drugi księżyc Marsa', 1, 12, 0.0, true, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Wulkaniczny księżyc', 2, 1821, 0.0, true, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 'Z lodowym oceanem', 4, 1561, 0.1, false, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Największy w Układzie', 7, 2631, 0.05, true, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Kraterowany księżyc', 17, 2410, 0.0, true, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 'Z atmosferą i jeziorami', 16, 2575, 0.7, false, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Lodowy księżyc', 5, 764, 0.1, false, 4);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Z gejzerami wody', 1, 252, 0.5, false, 4);
INSERT INTO public.moon VALUES (11, 'Triton', 'Lodowy księżyc Neptuna', 6, 1353, 0.2, false, 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 'Księżyc Urana', 14, 761, 0.0, true, 8);
INSERT INTO public.moon VALUES (13, 'Titania', 'Największy Urana', 9, 788, 0.0, true, 8);
INSERT INTO public.moon VALUES (14, 'Miranda', 'Z kanionami', 1, 235, 0.0, true, 8);
INSERT INTO public.moon VALUES (15, 'Charon', 'Duży księżyc Plutona', 6, 606, 0.0, true, 10);
INSERT INTO public.moon VALUES (16, 'Ganymede2', 'Dodatkowy', 7, 2600, 0.05, true, 3);
INSERT INTO public.moon VALUES (17, 'Europa2', 'Dodatkowy', 3, 1500, 0.1, false, 3);
INSERT INTO public.moon VALUES (18, 'Io2', 'Dodatkowy', 2, 1800, 0.0, true, 3);
INSERT INTO public.moon VALUES (19, 'Titan2', 'Dodatkowy', 16, 2500, 0.7, false, 4);
INSERT INTO public.moon VALUES (20, 'Rhea2', 'Dodatkowy', 4, 760, 0.1, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Zielona planeta', 1, 150, 12742, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Czerwona planeta', 2, 228, 6792, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Największa planeta', 95, 778, 142984, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Z pierścieniami', 146, 1427, 120536, false, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 'Piekielnie gorąca', 0, 108, 12104, false, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Najbliższa Słońcu', 0, 58, 4879, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Lodowy olbrzym', 14, 4515, 49528, false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Boczna planeta', 27, 2871, 51118, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Potencjalnie skalista', 0, 0, 10000, true, 6);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'W strefie habitabilnej', 0, 0, 9000, true, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 'Super-Ziemia', 0, 620, 29000, true, 2);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 'Super-Ziemia lawowa', 0, 0, 29000, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Gwiazda Układu Słonecznego', 5772, 696000, 382800000000000000000000000, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Czerwony nadolbrzym', 3600, 617000000, 12600000000000000000000000000000, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Najjaśniejsza na niebie', 9940, 1460000, 2540000000000000000000000000, false, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Niebieski nadolbrzym', 12100, 79000000, 120000000000000000000000000000000, true, 2);
INSERT INTO public.star VALUES (5, 'Vega', 'Błękitno-biały główny', 9600, 2560000, 4000000000000000000000000000, true, 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Najbliższa Słońcu', 3042, 200000, 667000000000000000000000, true, 1);


--
-- Data for Name: supernova; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supernova VALUES (1, 'SN 1987A', 1987, -15.5, true, 1);
INSERT INTO public.supernova VALUES (2, 'SN 1054', 1054, -6, true, 3);
INSERT INTO public.supernova VALUES (3, 'Kepler SN', 1604, -2.5, true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supernova_supernova_id_seq', 3, true);


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
-- Name: supernova supernova_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_name_key UNIQUE (name);


--
-- Name: supernova supernova_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_pkey PRIMARY KEY (supernova_id);


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
-- Name: supernova supernova_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--