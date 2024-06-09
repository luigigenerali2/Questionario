--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    cod_item integer NOT NULL,
    text_item character varying(200) NOT NULL,
    num_item integer NOT NULL,
    cod_ques integer
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: questao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questao (
    cod_ques integer NOT NULL,
    qtdi_ques integer NOT NULL,
    resp_ques integer NOT NULL,
    enu_ques character varying(200) NOT NULL
);


ALTER TABLE public.questao OWNER TO postgres;

--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item VALUES (1, '1)Cruzar duas vezes o sinal vermelho.', 1, 1);
INSERT INTO public.item VALUES (2, '2)Conduzir qualquer veículo com o direito de dirigir suspenso.', 2, 1);
INSERT INTO public.item VALUES (3, '3)Usar indevidamente o alarme do veículo.', 3, 1);
INSERT INTO public.item VALUES (4, '4)Conduzir veículo usando calçado que não se firme nos pés.', 4, 1);
INSERT INTO public.item VALUES (5, '1)Ter 21 (vinte e um) anos, saber ler e escrever.', 1, 2);
INSERT INTO public.item VALUES (6, '2)Ser proprietário de veículo automotor e saber ler e escrever.', 2, 2);
INSERT INTO public.item VALUES (7, '3)Ter 18 anos completos, saber ler e escrever, possuir documento de identidade e CPF', 3, 2);
INSERT INTO public.item VALUES (8, '4)Ter 18 anos completos, ensino médio, possuir documento de identidade e CPF', 4, 2);
INSERT INTO public.item VALUES (9, '5)Estar completando 18 anos em no mínimo 30 dias.', 5, 2);
INSERT INTO public.item VALUES (10, '1) A', 1, 3);
INSERT INTO public.item VALUES (11, '2) B', 2, 3);
INSERT INTO public.item VALUES (12, '3) C', 3, 3);
INSERT INTO public.item VALUES (13, '4) D', 4, 3);
INSERT INTO public.item VALUES (14, '5) E', 5, 3);
INSERT INTO public.item VALUES (15, '6) F', 6, 3);
INSERT INTO public.item VALUES (16, '1) O álcool diminuindo a capacidade natural de defesa dos condutores.', 1, 4);
INSERT INTO public.item VALUES (17, '2) O tempo de reação e a capacidade de julgamento dos motoristas diminuem.', 2, 4);
INSERT INTO public.item VALUES (18, '3) Os reflexos necessários à condução do veículo ficam comprometidos.', 3, 4);
INSERT INTO public.item VALUES (19, '4) Os condutores ficam mais ágeis e melhora os reflexos.', 4, 4);
INSERT INTO public.item VALUES (20, '1) São todos obrigatórios e previstos na legislação de trânsito.', 1, 5);
INSERT INTO public.item VALUES (21, '2) Prejudicam e aumentam a extensão das lesões em caso de queda.', 2, 5);
INSERT INTO public.item VALUES (22, '3) Não fazem a menor diferença.', 3, 5);
INSERT INTO public.item VALUES (23, '4) São proibidos pelo DENATRAN.', 4, 5);
INSERT INTO public.item VALUES (24, '5) Melhorar a segurança ao pilotar e diminuem as lesões em caso de queda.', 5, 5);


--
-- Data for Name: questao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questao VALUES (1, 4, 2, 'O condutor terá sua CNH cassada quando?');
INSERT INTO public.questao VALUES (2, 5, 3, 'São requisitos mínimos para que o candidato obtenha a permissão para conduzir veículos automotores:');
INSERT INTO public.questao VALUES (3, 6, 3, 'O condutor para poder dirigir veículos motorizados de 2 ou 3 rodas, deverá ser habilitado na categoria:');
INSERT INTO public.questao VALUES (4, 4, 4, 'Assinale a resposta INCORRETA em relação à ingestão de bebida alcoólica:');
INSERT INTO public.questao VALUES (5, 5, 5, 'Os equipamentos de segurança para motociclistas tais como o capacete, as luvas, as jaquetas de couro, as botas e protetores de coluna:');


--
-- Name: item itens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT itens_pkey PRIMARY KEY (cod_item);


--
-- Name: questao questoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT questoes_pkey PRIMARY KEY (cod_ques);


--
-- Name: item item_cod_ques_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_cod_ques_fkey FOREIGN KEY (cod_ques) REFERENCES public.questao(cod_ques) NOT VALID;


--
-- PostgreSQL database dump complete
--

