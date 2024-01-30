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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (206, 207, 4, 2, 1, 2018, 'Final');
INSERT INTO public.games VALUES (208, 209, 2, 0, 2, 2018, 'Third Place');
INSERT INTO public.games VALUES (207, 209, 2, 1, 3, 2018, 'Semi-Final');
INSERT INTO public.games VALUES (206, 208, 1, 0, 4, 2018, 'Semi-Final');
INSERT INTO public.games VALUES (207, 210, 3, 2, 5, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (209, 211, 2, 0, 6, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (208, 212, 2, 1, 7, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (206, 213, 2, 0, 8, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (209, 214, 2, 1, 9, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (211, 215, 1, 0, 10, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (208, 216, 3, 2, 11, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (212, 217, 2, 0, 12, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (207, 218, 2, 1, 13, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (210, 219, 2, 1, 14, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (213, 220, 2, 1, 15, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (206, 221, 4, 3, 16, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (222, 221, 1, 0, 17, 2014, 'Final');
INSERT INTO public.games VALUES (223, 212, 3, 0, 18, 2014, 'Third Place');
INSERT INTO public.games VALUES (221, 223, 1, 0, 19, 2014, 'Semi-Final');
INSERT INTO public.games VALUES (222, 212, 7, 1, 20, 2014, 'Semi-Final');
INSERT INTO public.games VALUES (223, 224, 1, 0, 21, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (221, 208, 1, 0, 22, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (212, 214, 2, 1, 23, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (222, 206, 1, 0, 24, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (212, 225, 2, 1, 25, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (214, 213, 2, 0, 26, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (206, 226, 2, 0, 27, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (222, 227, 2, 1, 28, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (223, 217, 2, 1, 29, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (224, 228, 2, 1, 30, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (221, 215, 1, 0, 31, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (208, 229, 2, 1, 32, 2014, 'Eighth-Final');


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (206, 'France');
INSERT INTO public.teams VALUES (207, 'Croatia');
INSERT INTO public.teams VALUES (208, 'Belgium');
INSERT INTO public.teams VALUES (209, 'England');
INSERT INTO public.teams VALUES (210, 'Russia');
INSERT INTO public.teams VALUES (211, 'Sweden');
INSERT INTO public.teams VALUES (212, 'Brazil');
INSERT INTO public.teams VALUES (213, 'Uruguay');
INSERT INTO public.teams VALUES (214, 'Colombia');
INSERT INTO public.teams VALUES (215, 'Switzerland');
INSERT INTO public.teams VALUES (216, 'Japan');
INSERT INTO public.teams VALUES (217, 'Mexico');
INSERT INTO public.teams VALUES (218, 'Denmark');
INSERT INTO public.teams VALUES (219, 'Spain');
INSERT INTO public.teams VALUES (220, 'Portugal');
INSERT INTO public.teams VALUES (221, 'Argentina');
INSERT INTO public.teams VALUES (222, 'Germany');
INSERT INTO public.teams VALUES (223, 'Netherlands');
INSERT INTO public.teams VALUES (224, 'Costa Rica');
INSERT INTO public.teams VALUES (225, 'Chile');
INSERT INTO public.teams VALUES (226, 'Nigeria');
INSERT INTO public.teams VALUES (227, 'Algeria');
INSERT INTO public.teams VALUES (228, 'Greece');
INSERT INTO public.teams VALUES (229, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 229, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

