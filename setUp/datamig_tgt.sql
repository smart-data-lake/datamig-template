--
-- PostgreSQL database dump
--

\restrict WriC85UpYD3C86krnX2H4YvXncAyvywPr8njN9ihDJmuRTDBjEnwzD1ifFGWf5C

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: datamig_tgt; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA datamig_tgt;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: datamig_tgt; Owner: -
--

CREATE TABLE datamig_tgt.cities (
    id bigint NOT NULL,
    city_name character varying(16),
    city_ascii character varying(16),
    population integer,
    latitude real,
    longitude real,
    iso_3166_1 character(2) NOT NULL,
    iso_3166_2 character(4) NOT NULL
);


--
-- Name: country; Type: TABLE; Schema: datamig_tgt; Owner: -
--

CREATE TABLE datamig_tgt.country (
    iso_3166_1 character(2) NOT NULL,
    country_name character varying(64) NOT NULL
);


--
-- Name: error_cities; Type: TABLE; Schema: datamig_tgt; Owner: -
--

CREATE TABLE datamig_tgt.error_cities (
    city text,
    city_ascii text,
    latitude real,
    longitude real,
    iso2 text,
    region_name text,
    population integer,
    id integer,
    reason text
);


--
-- Name: region; Type: TABLE; Schema: datamig_tgt; Owner: -
--

CREATE TABLE datamig_tgt.region (
    iso_3166_1 character(2) NOT NULL,
    iso_3166_2 character varying(4) NOT NULL,
    region_name character varying(64) NOT NULL
);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: datamig_tgt; Owner: -
--

ALTER TABLE ONLY datamig_tgt.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: datamig_tgt; Owner: -
--

ALTER TABLE ONLY datamig_tgt.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (iso_3166_1);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: datamig_tgt; Owner: -
--

ALTER TABLE ONLY datamig_tgt.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (iso_3166_1, iso_3166_2);


--
-- Name: cities cities_region_fkey; Type: FK CONSTRAINT; Schema: datamig_tgt; Owner: -
--

ALTER TABLE ONLY datamig_tgt.cities
    ADD CONSTRAINT cities_region_fkey FOREIGN KEY (iso_3166_1, iso_3166_2) REFERENCES datamig_tgt.region(iso_3166_1, iso_3166_2) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: region region_country_fkey; Type: FK CONSTRAINT; Schema: datamig_tgt; Owner: -
--

ALTER TABLE ONLY datamig_tgt.region
    ADD CONSTRAINT region_country_fkey FOREIGN KEY (iso_3166_1) REFERENCES datamig_tgt.country(iso_3166_1) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict WriC85UpYD3C86krnX2H4YvXncAyvywPr8njN9ihDJmuRTDBjEnwzD1ifFGWf5C

