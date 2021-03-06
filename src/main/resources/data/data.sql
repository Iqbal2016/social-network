toc.dat                                                                                             0000600 0004000 0002000 00000026711 13734121166 0014452 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                            x            social_media    9.6.16    9.6.16 )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         �           1262    35044    social_media    DATABASE     �   CREATE DATABASE social_media WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE social_media;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                     3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1         �            1259    44651    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       postgres    false    3         �            1259    44591 	   interests    TABLE     c   CREATE TABLE public.interests (
    id bigint NOT NULL,
    interest_name character varying(25)
);
    DROP TABLE public.interests;
       public         postgres    false    3         �            1259    44596    profile    TABLE     �   CREATE TABLE public.profile (
    id bigint NOT NULL,
    about character varying(5000),
    photo_directory character varying(10),
    photo_extension character varying(5),
    photo_name character varying(10),
    user_id bigint NOT NULL
);
    DROP TABLE public.profile;
       public         postgres    false    3         �            1259    44604    profile_interests    TABLE     k   CREATE TABLE public.profile_interests (
    profile_id bigint NOT NULL,
    interest_id bigint NOT NULL
);
 %   DROP TABLE public.profile_interests;
       public         postgres    false    3         �            1259    44609    status_update    TABLE     �   CREATE TABLE public.status_update (
    id bigint NOT NULL,
    added timestamp without time zone,
    text character varying(255)
);
 !   DROP TABLE public.status_update;
       public         postgres    false    3         �            1259    41401    student_info    TABLE       CREATE TABLE public.student_info (
    id integer NOT NULL,
    dateof_birth timestamp without time zone,
    father_name character varying(255),
    mother_name character varying(255),
    name character varying(255),
    student_id character varying(255)
);
     DROP TABLE public.student_info;
       public         postgres    false    3         �            1259    41399    student_info_id_seq    SEQUENCE     |   CREATE SEQUENCE public.student_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.student_info_id_seq;
       public       postgres    false    186    3         �           0    0    student_info_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.student_info_id_seq OWNED BY public.student_info.id;
            public       postgres    false    185         �            1259    44614    users    TABLE       CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    enabled boolean,
    firstname character varying(20),
    password character varying(60),
    role character varying(20),
    surname character varying(25)
);
    DROP TABLE public.users;
       public         postgres    false    3         �            1259    44619    verification    TABLE     �   CREATE TABLE public.verification (
    id bigint NOT NULL,
    expiry_date timestamp without time zone,
    token character varying(255),
    token_type character varying(255),
    user_id bigint NOT NULL
);
     DROP TABLE public.verification;
       public         postgres    false    3         �           2604    41404    student_info id    DEFAULT     r   ALTER TABLE ONLY public.student_info ALTER COLUMN id SET DEFAULT nextval('public.student_info_id_seq'::regclass);
 >   ALTER TABLE public.student_info ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    186    186         �           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 12, true);
            public       postgres    false    193         |          0    44591 	   interests 
   TABLE DATA               6   COPY public.interests (id, interest_name) FROM stdin;
    public       postgres    false    187       2172.dat }          0    44596    profile 
   TABLE DATA               c   COPY public.profile (id, about, photo_directory, photo_extension, photo_name, user_id) FROM stdin;
    public       postgres    false    188       2173.dat ~          0    44604    profile_interests 
   TABLE DATA               D   COPY public.profile_interests (profile_id, interest_id) FROM stdin;
    public       postgres    false    189       2174.dat           0    44609    status_update 
   TABLE DATA               8   COPY public.status_update (id, added, text) FROM stdin;
    public       postgres    false    190       2175.dat {          0    41401    student_info 
   TABLE DATA               d   COPY public.student_info (id, dateof_birth, father_name, mother_name, name, student_id) FROM stdin;
    public       postgres    false    186       2171.dat �           0    0    student_info_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.student_info_id_seq', 1, false);
            public       postgres    false    185         �          0    44614    users 
   TABLE DATA               W   COPY public.users (id, email, enabled, firstname, password, role, surname) FROM stdin;
    public       postgres    false    191       2176.dat �          0    44619    verification 
   TABLE DATA               S   COPY public.verification (id, expiry_date, token, token_type, user_id) FROM stdin;
    public       postgres    false    192       2177.dat �           2606    44595    interests interests_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.interests DROP CONSTRAINT interests_pkey;
       public         postgres    false    187    187         �           2606    44608 (   profile_interests profile_interests_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.profile_interests
    ADD CONSTRAINT profile_interests_pkey PRIMARY KEY (profile_id, interest_id);
 R   ALTER TABLE ONLY public.profile_interests DROP CONSTRAINT profile_interests_pkey;
       public         postgres    false    189    189    189         �           2606    44603    profile profile_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public         postgres    false    188    188         �           2606    44613     status_update status_update_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.status_update
    ADD CONSTRAINT status_update_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.status_update DROP CONSTRAINT status_update_pkey;
       public         postgres    false    190    190         �           2606    41409    student_info student_info_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.student_info
    ADD CONSTRAINT student_info_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.student_info DROP CONSTRAINT student_info_pkey;
       public         postgres    false    186    186         �           2606    44630 "   users uk_6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ^   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 L   ALTER TABLE ONLY public.users DROP CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7;
       public         postgres    false    191    191         �           2606    44628 &   interests uk_mqbrh6uswrme187owwh0o0imn 
   CONSTRAINT     j   ALTER TABLE ONLY public.interests
    ADD CONSTRAINT uk_mqbrh6uswrme187owwh0o0imn UNIQUE (interest_name);
 P   ALTER TABLE ONLY public.interests DROP CONSTRAINT uk_mqbrh6uswrme187owwh0o0imn;
       public         postgres    false    187    187         �           2606    44618    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    191    191                     2606    44626    verification verification_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.verification
    ADD CONSTRAINT verification_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.verification DROP CONSTRAINT verification_pkey;
       public         postgres    false    192    192                    2606    44646 )   verification fk_a0iaxio0f0unln4qmdryyfiqg    FK CONSTRAINT     �   ALTER TABLE ONLY public.verification
    ADD CONSTRAINT fk_a0iaxio0f0unln4qmdryyfiqg FOREIGN KEY (user_id) REFERENCES public.users(id);
 S   ALTER TABLE ONLY public.verification DROP CONSTRAINT fk_a0iaxio0f0unln4qmdryyfiqg;
       public       postgres    false    2046    192    191                    2606    44631 $   profile fk_c1dkiawnlj6uoe6fnlwd6j83j    FK CONSTRAINT     �   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fk_c1dkiawnlj6uoe6fnlwd6j83j FOREIGN KEY (user_id) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.profile DROP CONSTRAINT fk_c1dkiawnlj6uoe6fnlwd6j83j;
       public       postgres    false    191    2046    188                    2606    44636 .   profile_interests fk_mt7qs7v4yp3ssgxltaqcc2p09    FK CONSTRAINT     �   ALTER TABLE ONLY public.profile_interests
    ADD CONSTRAINT fk_mt7qs7v4yp3ssgxltaqcc2p09 FOREIGN KEY (interest_id) REFERENCES public.interests(id);
 X   ALTER TABLE ONLY public.profile_interests DROP CONSTRAINT fk_mt7qs7v4yp3ssgxltaqcc2p09;
       public       postgres    false    189    2034    187                    2606    44641 .   profile_interests fk_t4wwhff61secvod0ypujfp20c    FK CONSTRAINT     �   ALTER TABLE ONLY public.profile_interests
    ADD CONSTRAINT fk_t4wwhff61secvod0ypujfp20c FOREIGN KEY (profile_id) REFERENCES public.profile(id);
 X   ALTER TABLE ONLY public.profile_interests DROP CONSTRAINT fk_t4wwhff61secvod0ypujfp20c;
       public       postgres    false    2038    188    189                                                               2172.dat                                                                                            0000600 0004000 0002000 00000000107 13734121166 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	Iqbal hossain
4	dasdasd fdsfsd
5	sdfsdf
6	fsdfds
10	dfvfdvfdvdf
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                         2173.dat                                                                                            0000600 0004000 0002000 00000000553 13734121166 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8	<p>This domain is not registered with Tiny Cloud. Please see the quick start guide or create an accountThis domain is not registered with Tiny Cloud. Please see the quick start guide or create an accountThis domain is not registered with </p>	\N	\N	\N	7
2	<p>Moon Islam  dsdsd sdsad Moon Islam  dsdsd sdsad Moon Islam  dsdsd sdsad</p>	\N	\N	\N	1
\.


                                                                                                                                                     2174.dat                                                                                            0000600 0004000 0002000 00000000032 13734121166 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	3
2	4
2	5
2	6
2	10
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      2175.dat                                                                                            0000600 0004000 0002000 00000000005 13734121166 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2171.dat                                                                                            0000600 0004000 0002000 00000000005 13734121166 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2176.dat                                                                                            0000600 0004000 0002000 00000000546 13734121166 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	iqbal.cse2016@gmail.com	t	Iqbal Hossain	$2a$10$p93zuIzoqD0999AXeGmfH.NiX1.Ev8XADmeUycIs29lSh9xY7LPc6	ROLE_USER	Iqbal
7	moon@gmail.com	t	Moon Islam	$2a$10$JRxedoW.1lmwTvddjVI73etpC93ueQoQc2buQmxb75jNTX1iRIcAK	ROLE_USER	Moon
12	iqbalhossain.ewu@gmail.com	t	Mohd Iqbal Hossain	$2a$10$paea9Unf14lh4HM3r7ZFGe7UqA0euFtpIepE8OPJmQwZYV18qQovW	ROLE_USER	Iqbal
\.


                                                                                                                                                          2177.dat                                                                                            0000600 0004000 0002000 00000000005 13734121166 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000024601 13734121166 0015373 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.16
-- Dumped by pg_dump version 9.6.16

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

ALTER TABLE ONLY public.profile_interests DROP CONSTRAINT fk_t4wwhff61secvod0ypujfp20c;
ALTER TABLE ONLY public.profile_interests DROP CONSTRAINT fk_mt7qs7v4yp3ssgxltaqcc2p09;
ALTER TABLE ONLY public.profile DROP CONSTRAINT fk_c1dkiawnlj6uoe6fnlwd6j83j;
ALTER TABLE ONLY public.verification DROP CONSTRAINT fk_a0iaxio0f0unln4qmdryyfiqg;
ALTER TABLE ONLY public.verification DROP CONSTRAINT verification_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.interests DROP CONSTRAINT uk_mqbrh6uswrme187owwh0o0imn;
ALTER TABLE ONLY public.users DROP CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7;
ALTER TABLE ONLY public.student_info DROP CONSTRAINT student_info_pkey;
ALTER TABLE ONLY public.status_update DROP CONSTRAINT status_update_pkey;
ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
ALTER TABLE ONLY public.profile_interests DROP CONSTRAINT profile_interests_pkey;
ALTER TABLE ONLY public.interests DROP CONSTRAINT interests_pkey;
ALTER TABLE public.student_info ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.verification;
DROP TABLE public.users;
DROP SEQUENCE public.student_info_id_seq;
DROP TABLE public.student_info;
DROP TABLE public.status_update;
DROP TABLE public.profile_interests;
DROP TABLE public.profile;
DROP TABLE public.interests;
DROP SEQUENCE public.hibernate_sequence;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interests (
    id bigint NOT NULL,
    interest_name character varying(25)
);


ALTER TABLE public.interests OWNER TO postgres;

--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id bigint NOT NULL,
    about character varying(5000),
    photo_directory character varying(10),
    photo_extension character varying(5),
    photo_name character varying(10),
    user_id bigint NOT NULL
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- Name: profile_interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_interests (
    profile_id bigint NOT NULL,
    interest_id bigint NOT NULL
);


ALTER TABLE public.profile_interests OWNER TO postgres;

--
-- Name: status_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_update (
    id bigint NOT NULL,
    added timestamp without time zone,
    text character varying(255)
);


ALTER TABLE public.status_update OWNER TO postgres;

--
-- Name: student_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_info (
    id integer NOT NULL,
    dateof_birth timestamp without time zone,
    father_name character varying(255),
    mother_name character varying(255),
    name character varying(255),
    student_id character varying(255)
);


ALTER TABLE public.student_info OWNER TO postgres;

--
-- Name: student_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_info_id_seq OWNER TO postgres;

--
-- Name: student_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_info_id_seq OWNED BY public.student_info.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    enabled boolean,
    firstname character varying(20),
    password character varying(60),
    role character varying(20),
    surname character varying(25)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification (
    id bigint NOT NULL,
    expiry_date timestamp without time zone,
    token character varying(255),
    token_type character varying(255),
    user_id bigint NOT NULL
);


ALTER TABLE public.verification OWNER TO postgres;

--
-- Name: student_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_info ALTER COLUMN id SET DEFAULT nextval('public.student_info_id_seq'::regclass);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 12, true);


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interests (id, interest_name) FROM stdin;
\.
COPY public.interests (id, interest_name) FROM '$$PATH$$/2172.dat';

--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, about, photo_directory, photo_extension, photo_name, user_id) FROM stdin;
\.
COPY public.profile (id, about, photo_directory, photo_extension, photo_name, user_id) FROM '$$PATH$$/2173.dat';

--
-- Data for Name: profile_interests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_interests (profile_id, interest_id) FROM stdin;
\.
COPY public.profile_interests (profile_id, interest_id) FROM '$$PATH$$/2174.dat';

--
-- Data for Name: status_update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_update (id, added, text) FROM stdin;
\.
COPY public.status_update (id, added, text) FROM '$$PATH$$/2175.dat';

--
-- Data for Name: student_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_info (id, dateof_birth, father_name, mother_name, name, student_id) FROM stdin;
\.
COPY public.student_info (id, dateof_birth, father_name, mother_name, name, student_id) FROM '$$PATH$$/2171.dat';

--
-- Name: student_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_info_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, enabled, firstname, password, role, surname) FROM stdin;
\.
COPY public.users (id, email, enabled, firstname, password, role, surname) FROM '$$PATH$$/2176.dat';

--
-- Data for Name: verification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verification (id, expiry_date, token, token_type, user_id) FROM stdin;
\.
COPY public.verification (id, expiry_date, token, token_type, user_id) FROM '$$PATH$$/2177.dat';

--
-- Name: interests interests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);


--
-- Name: profile_interests profile_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_interests
    ADD CONSTRAINT profile_interests_pkey PRIMARY KEY (profile_id, interest_id);


--
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- Name: status_update status_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_update
    ADD CONSTRAINT status_update_pkey PRIMARY KEY (id);


--
-- Name: student_info student_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_info
    ADD CONSTRAINT student_info_pkey PRIMARY KEY (id);


--
-- Name: users uk_6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: interests uk_mqbrh6uswrme187owwh0o0imn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT uk_mqbrh6uswrme187owwh0o0imn UNIQUE (interest_name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: verification verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification
    ADD CONSTRAINT verification_pkey PRIMARY KEY (id);


--
-- Name: verification fk_a0iaxio0f0unln4qmdryyfiqg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification
    ADD CONSTRAINT fk_a0iaxio0f0unln4qmdryyfiqg FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: profile fk_c1dkiawnlj6uoe6fnlwd6j83j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fk_c1dkiawnlj6uoe6fnlwd6j83j FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: profile_interests fk_mt7qs7v4yp3ssgxltaqcc2p09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_interests
    ADD CONSTRAINT fk_mt7qs7v4yp3ssgxltaqcc2p09 FOREIGN KEY (interest_id) REFERENCES public.interests(id);


--
-- Name: profile_interests fk_t4wwhff61secvod0ypujfp20c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_interests
    ADD CONSTRAINT fk_t4wwhff61secvod0ypujfp20c FOREIGN KEY (profile_id) REFERENCES public.profile(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               