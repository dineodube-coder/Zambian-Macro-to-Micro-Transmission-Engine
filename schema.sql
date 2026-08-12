--
-- PostgreSQL database dump
--

\restrict UXpJZNmmBNZpy8z5znw96ZfM8zdEUJAeXSgewTH8wbQ4SmetHdb9BGth6N0yVkA

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-08-08 18:28:23

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 24698)
-- Name: boz_macro_indicators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boz_macro_indicators (
    record_date date NOT NULL,
    boz_policy_rate numeric(4,2),
    zmw_usd_rate numeric(5,2),
    tb_yield_91_day numeric(4,2)
);


ALTER TABLE public.boz_macro_indicators OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24704)
-- Name: luse_stock_portfolio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.luse_stock_portfolio (
    record_date date NOT NULL,
    ticker character varying(10) NOT NULL,
    closing_price_zmw numeric(10,2)
);


ALTER TABLE public.luse_stock_portfolio OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24711)
-- Name: optasia_replicated_loan_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.optasia_replicated_loan_book (
    record_date date NOT NULL,
    total_disbursed_loans_zmw numeric(15,2),
    delinquent_30d_plus_zmw numeric(15,2)
);


ALTER TABLE public.optasia_replicated_loan_book OWNER TO postgres;

--
-- TOC entry 4817 (class 2606 OID 24703)
-- Name: boz_macro_indicators boz_macro_indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boz_macro_indicators
    ADD CONSTRAINT boz_macro_indicators_pkey PRIMARY KEY (record_date);


--
-- TOC entry 4819 (class 2606 OID 24710)
-- Name: luse_stock_portfolio luse_stock_portfolio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.luse_stock_portfolio
    ADD CONSTRAINT luse_stock_portfolio_pkey PRIMARY KEY (record_date, ticker);


--
-- TOC entry 4821 (class 2606 OID 24716)
-- Name: optasia_replicated_loan_book optasia_replicated_loan_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.optasia_replicated_loan_book
    ADD CONSTRAINT optasia_replicated_loan_book_pkey PRIMARY KEY (record_date);


-- Completed on 2026-08-08 18:28:25

--
-- PostgreSQL database dump complete
--

\unrestrict UXpJZNmmBNZpy8z5znw96ZfM8zdEUJAeXSgewTH8wbQ4SmetHdb9BGth6N0yVkA

