--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

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
-- Name: applicants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicants (
    id integer NOT NULL,
    company character varying(255),
    detail_job character varying(255),
    job_title character varying(255),
    apply_term character varying(100),
    university character varying(255),
    major character varying(255),
    gpa numeric(3,2),
    gpa_scale numeric(3,2),
    toeic integer,
    opic character varying(20),
    toeic_speaking character varying(50),
    work_experience text,
    job_category character varying(50)
);


ALTER TABLE public.applicants OWNER TO postgres;

--
-- Name: applicants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applicants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applicants_id_seq OWNER TO postgres;

--
-- Name: applicants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applicants_id_seq OWNED BY public.applicants.id;


--
-- Name: certifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certifications (
    id integer NOT NULL,
    applicant_id integer,
    certification_name character varying(255)
);


ALTER TABLE public.certifications OWNER TO postgres;

--
-- Name: certifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.certifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.certifications_id_seq OWNER TO postgres;

--
-- Name: certifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.certifications_id_seq OWNED BY public.certifications.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    company_id integer NOT NULL,
    company_name character varying,
    company_url character varying,
    industry character varying,
    etc character varying
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_company_id_seq OWNER TO postgres;

--
-- Name: companies_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_company_id_seq OWNED BY public.companies.company_id;


--
-- Name: job_postings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_postings (
    posting_id integer NOT NULL,
    company_id integer,
    job_id integer,
    title character varying,
    qualification character varying,
    preferred character varying,
    tech_stack character varying,
    salary character varying,
    posting_url character varying,
    created_at date,
    deadline date
);


ALTER TABLE public.job_postings OWNER TO postgres;

--
-- Name: job_postings_posting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_postings_posting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_postings_posting_id_seq OWNER TO postgres;

--
-- Name: job_postings_posting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_postings_posting_id_seq OWNED BY public.job_postings.posting_id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    job_id integer NOT NULL,
    job_name character varying,
    job_category character varying
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_job_id_seq OWNER TO postgres;

--
-- Name: jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_job_id_seq OWNED BY public.jobs.job_id;


--
-- Name: recruit_qualifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recruit_qualifications (
    id integer NOT NULL,
    company_name character varying(100),
    company_type character varying(50),
    main_job character varying(100),
    detail_job character varying(100),
    location character varying(200),
    education_level character varying(20),
    major character varying(50),
    experience_years integer,
    language_requirement character varying(50),
    military_requirement character varying(20),
    overseas_available character varying(20),
    etc_requirements text,
    process text,
    job_category character varying(50)
);


ALTER TABLE public.recruit_qualifications OWNER TO postgres;

--
-- Name: recruit_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recruit_qualifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recruit_qualifications_id_seq OWNER TO postgres;

--
-- Name: recruit_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recruit_qualifications_id_seq OWNED BY public.recruit_qualifications.id;


--
-- Name: applicants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants ALTER COLUMN id SET DEFAULT nextval('public.applicants_id_seq'::regclass);


--
-- Name: certifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certifications ALTER COLUMN id SET DEFAULT nextval('public.certifications_id_seq'::regclass);


--
-- Name: companies company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN company_id SET DEFAULT nextval('public.companies_company_id_seq'::regclass);


--
-- Name: job_postings posting_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings ALTER COLUMN posting_id SET DEFAULT nextval('public.job_postings_posting_id_seq'::regclass);


--
-- Name: jobs job_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN job_id SET DEFAULT nextval('public.jobs_job_id_seq'::regclass);


--
-- Name: recruit_qualifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruit_qualifications ALTER COLUMN id SET DEFAULT nextval('public.recruit_qualifications_id_seq'::regclass);


--
-- Data for Name: applicants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applicants (id, company, detail_job, job_title, apply_term, university, major, gpa, gpa_scale, toeic, opic, toeic_speaking, work_experience, job_category) FROM stdin;
2	현대자동차	IT_Security Engineering_Security Engineering (판교)	\N	2024 하반기	중앙대	산업보안학과	4.06	\N	\N	IM1	\N	보안 관련 대기업 인턴 6개월 1회, 1개월 1회, 프리랜서 활동 1회 	IT/인터넷
3	삼성증권	IT	\N	2024 하반기	홍익대학교	컴퓨터공학과	3.77	4.50	865	IH	\N		IT/인터넷
4	IBK 기업은행	IT	\N	2024 하반기	홍익대	컴퓨터공학과	3.77	4.50	865	IH	\N		IT/인터넷
5	캐논코리아 주식회사	IT개발운영	\N	2024 하반기	선문대	주:정보통신공학과	4.39	4.50	\N	\N	110		IT/인터넷
6	현대캐피탈	Digital	\N	2024 상반기	중앙대	산업보안학과	4.06	\N	\N	IM1	\N	보안 관련 대기업 인턴 6개월 1회 	IT/인터넷
7	새마을금고중앙회	IT분야	\N	2024 상반기	건동홍	컴퓨터공학과	4.01	4.50	870	IM2	\N		IT/인터넷
8	NH농협은행	IT	\N	2024 상반기	인가경	산업경영공학	3.64	4.50	805	\N	\N	중소기업유통센터 	IT/인터넷
9	코스콤	IT	\N	2023 하반기	한양대학교	컴퓨터소프트웨어학부	3.50	\N	\N	\N	150	인턴	IT/인터넷
10	케이뱅크	IT	\N	2023 하반기	한양대학교	컴퓨터소프트웨어학부	3.50	\N	\N	\N	150	인턴	IT/인터넷
11	kt cloud	IT-아키텍처	\N	2023 하반기	동국대	컴퓨터정보통신공학부	3.86	\N	710	IM2	\N		IT/인터넷
12	오케스트로	IT개발	\N	2023 하반기	고졸	이과	\N	\N	670	\N	\N	타회사 경력 10개월 	IT/인터넷
13	삼성SDS	IT컨설팅	\N	2023 하반기	Carnegie Mellon University	Technical Writing	3.03	4.00	980	\N	180		IT/인터넷
14	현대오일뱅크	IT	\N	2023 상반기	고려대학교	기계공학부	3.78	4.50	810	im2	\N		IT/인터넷
15	현대모비스	IT 기획 MES	\N	2023 상반기	고려대학교	기계공학부	3.78	4.50	810	im2	\N		IT/인터넷
16	하나금융티아이	금융 IT 서비스 개발	\N	2023 상반기	국숭세단	산업공학	3.90	\N	910	IH	\N	인턴 3회 	IT/인터넷
17	KB부동산신탁	IT	\N	2023 상반기	인천대	정보통신공학과	4.22	\N	820	\N	\N	학부연구생 	IT/인터넷
18	한국철도공사(코레일)	사무영업	IT	2023 상반기	인천대	정보통신공학과	4.22	4.50	820	\N	\N	학부연구생 	IT/인터넷
19	하나금융티아이	금융IT 개발	\N	2023 상반기	가톨릭대학교	컴퓨터공학과	3.59	4.50	\N	\N	\N		IT/인터넷
20	CJ ENM	IT기획	\N	2022 하반기	인가경	이과	3.20	4.50	805	\N	\N	티맥스소프트 	IT/인터넷
21	BGF리테일	IT기획	\N	2022 하반기	상명대학교	경영학과	3.59	\N	865	\N	\N		IT/인터넷
22	우리fis	IT 개발	\N	2022 하반기	국숭세단	산업공학과	3.90	\N	910	IH	\N	인턴 3회 	IT/인터넷
23	유니투스	IT	\N	2022 하반기	국민대학교	기계공학과	3.39	\N	\N	\N	\N	중소 IT기업 1년 미만 재직 	IT/인터넷
24	모트라스	IT	\N	2022 하반기	국민대	기계공학과	3.39	\N	\N	\N	\N	IT중소기업 1년미만 재직 	IT/인터넷
25	신협	IT 직군	\N	2022 하반기	인천대학교	정보통신공학과	4.22	4.50	865	im2	\N		IT/인터넷
26	Sh수협은행	IT인재(3급)	\N	2022 하반기	인천대	정보통신공학과	4.19	\N	\N	im2	\N		IT/인터넷
27	우리은행	IT	\N	2022 하반기	대진전자통신고등학교	컴퓨터소프트웨어과	\N	\N	\N	\N	\N		IT/인터넷
28	광주은행	디지털IT 7급(초급)	\N	2022 하반기	고졸	임베디드SW	2.40	\N	525	\N	\N		IT/인터넷
29	한국주택금융공사	IT	\N	2022 하반기	고졸	임베디드SW	2.40	\N	525	\N	\N		IT/인터넷
30	이베스트투자증권	채용전제형 인턴(대졸) - IT(업무원장개발)	\N	2022 하반기	국숭세단	경제학과	3.71	4.50	\N	IL	\N	스타트업 개발 인턴 2개원 	IT/인터넷
31	교보생명	IT개발	\N	2022 상반기	한국공학대학교	전자공학과	3.50	4.50	\N	\N	\N		IT/인터넷
32	현대캐피탈	Digital	\N	2022 상반기	한국공학대학교	전자공학과	3.50	4.50	\N	\N	\N		IT/인터넷
33	KB국민카드	IT	\N	2022 상반기	국숭세단	경제학	3.71	4.50	\N	\N	\N	스타트업 개발 인턴 2개월 	IT/인터넷
34	BNK시스템	IT개발(정규직)	\N	2022 상반기	국숭세단	경제학	3.71	4.50	\N	\N	\N	스타트업 인턴(개발직무) 2개월 	IT/인터넷
35	lg화학	첨단소재 it소재 생산기술	\N	2022 상반기	지방대	화공시스템	4.10	\N	150	\N	150		IT/인터넷
36	푸본현대생명	IT 개발	\N	2022 상반기	가톨릭대	컴퓨터공학과	3.60	4.50	\N	\N	\N		IT/인터넷
37	KB국민은행	IT	\N	2022 상반기	국숭세단라인	산업공학과	3.92	\N	910	IH	\N	인턴2회 	IT/인터넷
38	롯데e커머스	it기획	\N	2022 상반기	숭실대	산업정보시스템공학	3.89	4.50	810	\N	\N		IT/인터넷
39	캐논쎄미콘덕터엔지니어링코리아	it인프라	\N	2021 하반기	국숭세단	전자전기	3.32	4.50	845	\N	\N		IT/인터넷
40	농협정보시스템	IT	\N	2021 하반기	지방대	컴퓨터공학과	3.75	\N	850	\N	\N		IT/인터넷
41	한국전력거래소	IT	\N	2021 하반기	지방대	컴퓨터공학과	3.75	\N	850	\N	\N		IT/인터넷
42	광주은행	IT	\N	2021 하반기	지방대	컴퓨터공학과	3.75	\N	850	\N	\N		IT/인터넷
43	전북은행	금융공학	\N	2021 하반기	지방대	컴퓨터공학과	3.75	\N	850	\N	\N		IT/인터넷
44	LG디스플레이	IT 사업부 공정	\N	2021 하반기	중경외시	전자전기공학부	3.65	4.50	840	IM2	\N		IT/인터넷
45	현대엔지비	미래인재육성(IT 연구개발)	\N	2021 하반기	인하대	통계학과	3.96	4.50	\N	\N	\N		IT/인터넷
46	신세계아이앤씨	It직무	\N	2021 하반기	인하대	통계학과	3.96	4.50	\N	\N	\N		IT/인터넷
47	케이뱅크	It직무	\N	2021 하반기	인하대	통계학과	3.96	4.50	\N	\N	\N		IT/인터넷
48	키움증권	It직무	\N	2021 하반기	인하대학교	통계학과	3.96	4.50	\N	\N	\N		IT/인터넷
49	농협중앙회	IT-6급 중견(전산직)	\N	2021 상반기	금오공대	컴퓨터소프트웨어공학과	3.35	4.50	760	\N	\N		IT/인터넷
50	한국관광공사	전문부문>IT	\N	2021 상반기	금오공대	컴퓨터소프트웨어공학과	3.35	4.50	760	\N	\N		IT/인터넷
51	케이에스엠	IT 관리	\N	2021 상반기	한양대 에리카	경영,산업경영공학	3.65	4.50	830	IH	\N	인턴1회, 타기업 1년9개월 1회 	IT/인터넷
52	롯데정보통신	IT 서비스	\N	2021 상반기	숭실대	소프트웨어학부	3.78	4.50	\N	IH	\N	중소기업 인턴 4개월 	IT/인터넷
53	LG CNS	IT 서비스	\N	2021 상반기	숭실대	소프트웨어학부	3.78	4.50	\N	IH	\N	중소기업 인턴 4개월 	IT/인터넷
54	LG디스플레이	IT 사업부 공정	\N	2021 상반기	한양대학교	신소재공학부	3.80	4.50	\N	\N	130	학부연구생 	IT/인터넷
55	한국방송공사	IT	\N	2021 상반기	지방대	컴퓨터공학과	3.73	\N	855	IM2	\N		IT/인터넷
56	국립공원공단	공원행정IT	\N	2021 상반기	지방대	컴퓨터공학과	3.73	\N	855	IM2	\N		IT/인터넷
57	한국교육방송공사	IT기술	\N	2021 상반기	지방대	컴퓨터공학과	3.73	\N	855	IM2	\N		IT/인터넷
58	한국장학재단	IT개발운영	\N	2021 상반기	지방대	컴퓨터공학과	3.73	\N	855	IM2	\N		IT/인터넷
59	한국조폐공사	IT전형>전산기술(IT)	\N	2021 상반기	지방대	컴퓨터공학	3.89	4.50	\N	\N	\N		IT/인터넷
60	LG전자	it사업부 r&d	\N	2021 상반기	서연고	신소재	2.80	4.50	780	\N	\N		IT/인터넷
61	LG CNS	신입채용	IT Intensive Course (학사) : '21년 8월 입사	2021 상반기	인하대	컴퓨터공학과	3.36	\N	\N	IM2	\N		IT/인터넷
62	한국연구재단	IT	\N	2021 상반기	지거국	컴퓨터	3.90	4.30	765	\N	\N		IT/인터넷
63	더존ICT	IT 기술 영업	\N	2020 하반기	영남대	일어일문학	3.77	4.50	\N	\N	140		IT/인터넷
64	조인스중앙	IT 부문 개발	\N	2020 하반기	지거국	임베디드 시스템 공학과	3.00	4.50	\N	IM2	\N	중앙일보 인턴 8개월 	IT/인터넷
65	동양시스템즈	IT 서비스	\N	2020 하반기	지거국	임베디드 시스템 공학과	3.00	4.50	\N	IM2	\N	중앙일보 인턴 8개월 	IT/인터넷
66	젬백스링크	IT 부문 신입	\N	2020 하반기	지거국	임베디드 시스템 공학과	3.00	4.50	\N	IM2	\N	중앙일보 인턴 8개월 	IT/인터넷
67	기아	IT 모빌리티 서비스 개발	\N	2020 하반기	건국대	산업공학과	3.87	4.50	820	\N	140	현대디지텍 6개월	IT/인터넷
68	삼천리	IT	\N	2020 하반기	인하대	산업공학과	3.66	4.50	130	\N	130		IT/인터넷
69	LG전자	LG전자 BS본부 IT사업부 R&D-기구	\N	2020 하반기	한양대학교	기계공학부	3.68	4.50	\N	\N	130		IT/인터넷
70	한국투자증권	신입(5급)-IT	\N	2020 하반기	한국외대	정보통신공학과	3.32	4.50	840	IM2	\N	중소 유통 1개월 , 행안부 청년인턴 4개월 	IT/인터넷
71	팜스코	IT개발-신입-중부(안성)	\N	2020 하반기	한국외대	정보통신공학과	3.32	4.50	840	IM2	\N	중소 유통 1개월, 행안부 청년인턴 4개월	IT/인터넷
72	동서발전	대졸수준	IT	2020 하반기	지거국	전자공	3.40	\N	800	\N	\N		IT/인터넷
73	현대자동차	전략지원 [IT] IT 시스템 기획 및 구축	\N	2020 하반기	SKY	산업공학	3.70	4.30	\N	IH	\N	삼성전자 인턴 4개월	IT/인터넷
74	모바일리더	인지소프트	\N	2020 하반기	지거국	정보통신공학과	2.96	\N	\N	IL	\N		IT/인터넷
75	국민은행	IT	\N	2020 하반기	한남대학교	정보통신공학과	2.96	\N	\N	IL	\N		IT/인터넷
76	LG CNS	IT 서비스	\N	2020 하반기	건홍동	수학	3.90	4.50	\N	\N	\N		IT/인터넷
77	한국철도공사(코레일)	IT	\N	2020 하반기	신라대	컴퓨터공학과	3.58	4.50	\N	\N	\N		IT/인터넷
78	KB국민은행	신입행원(L1) IT부문 일반IT	\N	2020 상반기	한양대	소프트웨어학부	3.45	4.50	\N	IM1	\N		IT/인터넷
79	롯데e커머스	IT	\N	2020 상반기	해외대	커뮤니케이션	3.24	4.00	\N	\N	\N	외국계 컨설팅 기업 인턴 3개월, 공공기관 2개월 	IT/인터넷
80	한국철도공사(코레일)	사무영업 IT	\N	2020 상반기	중앙대학교	\N	3.41	\N	\N	\N	\N		IT/인터넷
81	현대 오토에버	IT신기술 연구개발	\N	2019 하반기	광운대학교, 광운대 대학원	\N	4.20	\N	\N	IH	\N		IT/인터넷
82	KB국민은행	신입행원(IT)	\N	2019 하반기	인하대학교	\N	3.98	\N	930	IM2	\N		IT/인터넷
83	삼성카드	카드-IT	\N	2019 하반기	인하대학교	\N	3.98	\N	930	im2	\N		IT/인터넷
84	KB국민은행	IT	\N	2019 하반기	광운대학교	\N	2.98	\N	780	\N	\N		IT/인터넷
85	KB저축은행	금융IT	\N	2019 하반기	광운대학교	\N	2.98	\N	780	\N	\N		IT/인터넷
86	금호석유화학	IT	\N	2019 하반기	포항공과대학교	\N	2.97	4.30	825	\N	\N		IT/인터넷
87	LG유플러스	IT기획	\N	2019 하반기	포항공과대학교	\N	2.97	4.30	825	\N	\N		IT/인터넷
88	한화생명	IT	\N	2019 하반기	포항공과대학교	\N	2.97	4.30	825	\N	\N		IT/인터넷
89	우리FIS	IT	\N	2019 하반기	포항공과대학교	\N	2.97	4.30	825	\N	\N		IT/인터넷
90	LG전자	CFO IT	\N	2019 하반기	포항공과대학교	\N	2.97	4.30	825	\N	\N		IT/인터넷
91	S-OIL	IT	\N	2019 하반기	포항공과대학교	\N	2.97	4.30	825	\N	\N		IT/인터넷
92	LG CNS	IT 서비스	\N	2019 하반기	서울 상위	자연계열	\N	\N	955	\N	\N		IT/인터넷
93	KT	IT개발	\N	2019 상반기	중앙	경제	3.90	\N	\N	IH	\N		IT/인터넷
94	LG CNS	IT 서비스	\N	2019 상반기	서성한	컴퓨터공학과	4.13	\N	965	\N	\N		IT/인터넷
95	GS 홈쇼핑	IT	\N	2019 상반기	건동홍	컴퓨터공학과	3.42	\N	\N	AL	\N		IT/인터넷
96	삼성SDS	IT	\N	2019 상반기	화학과	\N	3.40	\N	\N	\N	\N		IT/인터넷
97	현대정보기술	IT직군	\N	2019 상반기	지방거점대	컴공	3.00	\N	700	\N	\N		IT/인터넷
98	GS SHOP	IT	\N	2019 상반기	\N	\N	\N	\N	\N	\N	\N		IT/인터넷
99	현대오토에버	제조 IT	\N	2019 상반기	건동홍	기계공학	3.19	\N	\N	\N	레벨6		IT/인터넷
100	CJ올리브네트웍스	IT부문	\N	2019 상반기	세종대학교	디지털콘텐츠학과	3.52	\N	\N	\N	\N		IT/인터넷
101	한국동서발전	IT	\N	2018 하반기	공주대학교	\N	3.48	\N	835	\N	\N		IT/인터넷
102	LG유플러스	경영지원 > IT	\N	2018 하반기	성균관 대학교	컴퓨터 공학과	3.89	\N	\N	IM3	\N		IT/인터넷
103	LG CNS	IT Leadership Academy 2018(SW)	\N	2018 하반기	숭실대학교	컴퓨터공학	3.70	\N	\N	IM2	\N		IT/인터넷
104	신한은행	디지털 IT	\N	2018 하반기	지거국	소프트웨어공학과	3.37	\N	\N	IM2	\N		IT/인터넷
105	진에어	일반직 (it 전략)	\N	2018 하반기	중,경,외,시	생명공학, 컴퓨터공학	3.61	\N	\N	IH	\N		IT/인터넷
106	우리은행	IT	\N	2018 하반기	조선대	컴퓨터공학과	3.91	\N	795	\N	\N		IT/인터넷
107	신세계 I&C	IT Programmer	\N	2018 하반기	조선대학교	컴퓨터공학과	3.91	\N	795	\N	\N		IT/인터넷
108	KT	IT컨설팅	\N	2018 하반기	서성한	전자과	3.68	\N	850	\N	\N		IT/인터넷
109	CJ올리브네트웍스	IT정보보안	\N	2018 하반기	건동홍	컴공	3.20	\N	\N	\N	\N		IT/인터넷
110	LG유플러스	경영지원 IT	\N	2018 하반기	지거국	전자공학과	4.20	\N	820	\N	\N		IT/인터넷
111	KT	IT 컨설팅	\N	2018 하반기	과기원	산업공학	3.44	\N	\N	AL	\N		IT/인터넷
112	CJ올리브네트웍스	it컨설팅	\N	2018 하반기	SKY	산업공학	3.61	\N	950	\N	\N		IT/인터넷
113	롯데이커머스	IT 운영	\N	2018 하반기	수도권	\N	3.77	\N	890	\N	\N		IT/인터넷
114	효성TNS	IT운영	\N	2018 하반기	S대	컴퓨터	3.96	\N	845	\N	\N		IT/인터넷
115	KT	IT개발	\N	2018 하반기	광명상가	컴퓨터과학	3.34	\N	630	\N	\N		IT/인터넷
116	CJ올리브네트웍스	IT사업부문 - 플랫폼	\N	2018 하반기	서성한	경영	3.69	\N	900	\N	160		IT/인터넷
117	수협 중앙회	IT	\N	2018 하반기	숭실대학교	소프트웨어	4.05	\N	895	\N	레벨6		IT/인터넷
118	KT	IT	\N	2018 하반기	숭실대학교	정보통신전자공학부	3.19	\N	\N	IM2	\N		IT/인터넷
119	우리은행	IT	\N	2018 하반기	단국대학교 일반대학원	전자전기공학과	4.37	\N	825	\N	\N		IT/인터넷
120	KT(스마트로)	IT	\N	2018 하반기	지방4년제	컴공	3.00	\N	650	\N	\N		IT/인터넷
121	롯데정보통신	IT	\N	2018 하반기	서울 하위권	컴퓨터공학과	3.50	\N	\N	\N	\N		IT/인터넷
122	BC카드	IT	\N	2018 하반기	국숭세단	소프트	4.05	\N	\N	\N	\N		IT/인터넷
123	CJ ENM	오쇼핑부문 IT	\N	2018 하반기	아주대	SW	3.75	\N	\N	\N	\N		IT/인터넷
124	CJ올리브네트웍스	IT사업부문	\N	2018 하반기	서성한	컴퓨터공학과	3.00	\N	850	\N	\N		IT/인터넷
125	삼성생명	금융IT	\N	2018 하반기	인서울 S대	IT	3.96	\N	\N	\N	\N		IT/인터넷
126	삼성생명	IT	\N	2018 상반기	\N	\N	\N	\N	\N	\N	\N		IT/인터넷
127	현대자동차	IT	\N	2018 상반기	서울과학기술대학교	ITM	4.25	\N	\N	\N	\N		IT/인터넷
128	KT	IT 컨설팅	\N	2018 상반기	공학	\N	3.35	\N	960	\N	\N		IT/인터넷
129	KT	IT 컨설팅	\N	2018 상반기	서울 중상위권	통계	3.69	\N	935	IM2	\N		IT/인터넷
130	CJ올리브네트웍스	IT사업부문 클라우드	\N	2018 상반기	외국	컴퓨터공학과	3.30	\N	\N	AL	\N		IT/인터넷
131	KT	IT	\N	2018 상반기	서울 중상위권	컴공	3.32	\N	930	\N	\N		IT/인터넷
132	현대자동차	전략기획	\N	2018 상반기	서울권	IT경영	3.65	\N	855	\N	\N		IT/인터넷
133	CJ ENM	오쇼핑부문 IT개발	\N	2018 상반기	학점 4	인턴 2, 공모전 1	4.00	\N	\N	\N	\N		IT/인터넷
134	KT	it컨설팅	\N	2018 상반기	한양대학교	생체공학과	3.64	\N	\N	\N	130		IT/인터넷
135	기아	지속경영	\N	2018 상반기	숭실대	컴퓨터공학과	4.19	\N	\N	\N	\N		IT/인터넷
136	CJ ENM	오쇼핑부문 IT	\N	2018 상반기	서울4년제	정보통신공학과	3.50	\N	700	\N	\N		IT/인터넷
137	KT	IT보안	\N	2017 하반기	건대	소프트	3.00	\N	845	IM2	\N		IT/인터넷
138	현대 오토에버	IT	\N	2017 하반기	\N	\N	\N	\N	\N	\N	\N		IT/인터넷
139	비씨카드	IT	\N	2017 하반기	서성한	컴공	3.65	\N	\N	\N	\N		IT/인터넷
140	현대자동차	IT전략	\N	2017 하반기	인서울	컴퓨터공학	4.20	\N	\N	IM1	\N		IT/인터넷
141	엔서치마케팅	IT솔루션기획	\N	2017 하반기	서울 중하위	경영정보	3.00	\N	\N	\N	레벨6		IT/인터넷
142	롯데마트	IT기획운영	\N	2017 하반기	건동홍숙	컴퓨터	3.65	\N	\N	\N	\N		IT/인터넷
143	CJ올리브네트웍스	IT	\N	2017 하반기	한양대	컴퓨터공학과	3.10	\N	\N	\N	\N		IT/인터넷
144	현대오토에버	IT 일반	\N	2017 하반기	sky	경영	4.00	\N	\N	\N	\N		IT/인터넷
145	롯데정보통신	IT영업	\N	2017 하반기	건동홍	산업공학	3.60	\N	\N	\N	\N		IT/인터넷
146	현대자동차	SW	\N	2017 하반기	수도권	컴퓨터관련	3.76	\N	710	\N	\N		IT/인터넷
147	CJ올리브네트웍스	IT신사업기획	\N	2017 하반기	연세대	산업공학과	3.40	\N	845	\N	\N		IT/인터넷
148	오뚜기	IT	\N	2017 하반기	서울시립대학교	전자전기컴퓨터공학부	3.18	\N	910	IM3	\N		IT/인터넷
149	오뚜기	IT	\N	2017 하반기	경기권	정보통신학과	3.00	\N	845	\N	\N		IT/인터넷
150	KT	IT	\N	2017 하반기	서성한	전기전자	3.00	\N	800	\N	\N		IT/인터넷
151	SK하이닉스	IT	\N	2017 하반기	동국대학교	산업시스템공학과	3.82	\N	905	\N	\N		IT/인터넷
152	현대자동차	전략지원IT	\N	2017 상반기	서성한	컴퓨터관련	3.00	\N	800	\N	\N		IT/인터넷
153	CJ 대한통운	IT물류	\N	2017 상반기	서울 중위권	전자공학	3.70	\N	810	\N	\N		IT/인터넷
154	KT	IT	\N	2017 상반기	건동홍	통계학과	3.60	\N	840	\N	\N		IT/인터넷
155	LG CNS	Smart IT	\N	2017 상반기	중경외시	컴퓨터공학부	3.54	\N	700	\N	\N		IT/인터넷
156	SK텔레콤	SW개발	\N	2017 상반기	지거국	컴퓨터학부	4.10	\N	880	\N	\N		IT/인터넷
157	CJ올리브네트웍스	IT정보보안	\N	2017 상반기	지거국	IT	3.95	\N	\N	\N	\N		IT/인터넷
158	SK텔레콤	IT	\N	2017 상반기	건국대학교	전자공학과	3.23	\N	\N	\N	\N		IT/인터넷
159	SK 브로드밴드	기술	\N	2017 상반기	수도권 4년제	전기전자과	3.14	\N	\N	\N	\N		IT/인터넷
160	KT	IT컨설팅	\N	2017 상반기	서울 중하위	정보통신공	\N	\N	\N	\N	\N		IT/인터넷
161	LG화학	법인 staff(IT)	\N	2017 상반기	지거국	통계학과	3.60	\N	840	\N	\N		IT/인터넷
162	SK하이닉스	IT(자동화)	\N	2017 상반기	SKY	산업공학	3.67	\N	\N	\N	레벨6		IT/인터넷
163	LG화학	법인 STAFF IT	\N	2017 상반기	경북대	통계	4.00	\N	900	\N	\N		IT/인터넷
164	CJ올리브네트웍스	IT사업부문	\N	2017 상반기	인하대학교	경제학과 & 소프트웨어융합공학	3.90	\N	855	\N	레벨6		IT/인터넷
165	SK브로드밴드	IT	\N	2017 상반기	서울 중위권	컴퓨터공학	\N	\N	\N	\N	\N		IT/인터넷
166	LG CNS	스마트IT	\N	2017 상반기	지거국	컴퓨터학부	3.60	\N	745	IM1	\N		IT/인터넷
167	CJ올리브네트웍스	IT부문	\N	2017 상반기	서울 중위권	정보통신공학	3.22	\N	\N	\N	레벨6		IT/인터넷
168	CJ올리브네트웍스	IT (빅데이터)	\N	2017 상반기	SKY	수학	3.30	\N	860	\N	7		IT/인터넷
169	CJ 대한통운	물류 IT	\N	2017 상반기	건동홍	정보통신공학	3.20	\N	\N	\N	\N		IT/인터넷
170	삼성	IT계열	\N	2017 상반기	수도권 4년제	컴퓨터공학과	3.38	\N	\N	\N	\N		IT/인터넷
171	동원시스템즈	IT	\N	2017 상반기	컴퓨터공학	\N	3.70	\N	\N	\N	\N		IT/인터넷
172	KT	IT컨설턴트	\N	2017 상반기	지거국	소프트웨어	3.94	\N	\N	\N	\N		IT/인터넷
173	CJ올리브네트웍스	IT	\N	2017 상반기	국숭세단	산업공학	3.00	\N	\N	\N	\N		IT/인터넷
174	SK C&C	IT	\N	2017 상반기	충북대학교	소프트웨어학과	3.40	\N	\N	\N	\N		IT/인터넷
175	CJ올리브네트웍스	IT SW개발	\N	2017 상반기	지거국	컴공	3.49	\N	880	IH	\N		IT/인터넷
176	셀트리온	IT	\N	2017 상반기	서성한	컴공	3.10	\N	\N	IH	\N		IT/인터넷
177	롯데정보통신	Programming, IT	\N	2017 상반기	한동대	컴공	3.38	\N	\N	\N	\N		IT/인터넷
178	CJ올리브네트웍스	IT시스템운영	\N	2017 상반기	서성한	컴퓨터	3.32	\N	\N	\N	\N		IT/인터넷
179	SK브로드밴드	IT	\N	2017 상반기	수도권 4년제	전자공학과	3.66	\N	845	\N	\N		IT/인터넷
180	CJ올리브네트웍스	IT사업부문 서버	\N	2017 상반기	인서울 4년제	전자공학과	3.50	\N	\N	\N	\N		IT/인터넷
181	현대자동차	전략지원부문 IT	\N	2017 상반기	서성한	공대	3.00	\N	800	\N	\N		IT/인터넷
182	SK브로드밴드	IT	\N	2017 상반기	중경외시	전산학과	3.20	\N	890	\N	150		IT/인터넷
183	GS리테일	IT	\N	2017 상반기	서성한	\N	\N	\N	\N	\N	\N		IT/인터넷
184	BC카드	IT	\N	2016 하반기	지방국립대	IT	3.13	\N	895	\N	\N		IT/인터넷
185	NH농협은행	IT	\N	2016 하반기	학점 4.0	오픽 IH	4.00	\N	\N	IH	\N		IT/인터넷
186	아시아나 IDT	IT	\N	2016 하반기	중경외시	컴퓨터공	3.50	\N	935	\N	\N		IT/인터넷
187	우리은행	IT	\N	2016 하반기	아주대 석사	컴퓨터공학과	\N	\N	\N	IH	\N		IT/인터넷
188	CJ올리브네트웍스	신사업 기획(유통IT)	\N	2016 하반기	서울 4년제	멀티미디어	3.60	\N	\N	IH	\N		IT/인터넷
189	NH농협은행	IT	\N	2016 하반기	컴퓨터공학과	\N	3.91	\N	\N	\N	\N		IT/인터넷
190	NH농협은행	IT	\N	2016 하반기	서울중위권	산업공학과	3.99	\N	820	\N	\N		IT/인터넷
191	KT	IT 컨설팅	\N	2016 하반기	건동홍	전자전기	3.79	\N	865	IM2	\N		IT/인터넷
192	신한은행	IT	\N	2016 하반기	숭실대학교	컴퓨터학부	3.96	\N	665	\N	\N		IT/인터넷
193	현대 오토에버	IT	\N	2016 하반기	이화여대	물리학과	3.65	\N	840	\N	\N		IT/인터넷
194	현대오토에버	IT	\N	2016 하반기	지거국	컴퓨터공학	3.60	\N	860	\N	\N		IT/인터넷
195	우리은행	IT	\N	2016 하반기	서울 4년제	컴퓨터과학	3.54	\N	\N	\N	\N		IT/인터넷
196	KT	IT	\N	2016 하반기	중경외시	산업공학	3.30	\N	\N	\N	\N		IT/인터넷
197	SK텔레콤	Network & IT	\N	2016 하반기	가톨릭대	정보통신전자공학부	3.71	\N	\N	\N	\N		IT/인터넷
198	KT인턴	IT컨설팅	\N	2016 하반기	국숭세단	정보통신	3.82	\N	730	\N	레벨6(130)		IT/인터넷
199	GS칼텍스	IT	\N	2016 하반기	서울하위권	정보통신	3.50	\N	820	IH	\N		IT/인터넷
200	신한은행	IT	\N	2016 하반기	중경외시	\N	3.50	\N	\N	IL	\N		IT/인터넷
201	효성 인포메이션시스템	IT영업	\N	2016 하반기	수도권 사립 4년제	컴퓨터공학	3.59	\N	825	\N	레벨6		IT/인터넷
202	LG U+	IT 영업	\N	2016 하반기	지방대	IT	3.50	\N	\N	\N	\N		IT/인터넷
203	NH농협은행	IT	\N	2016 하반기	건동홍	컴퓨터공학	3.44	\N	880	\N	\N		IT/인터넷
204	NH농협은행	IT	\N	2016 하반기	서울 중하위	\N	3.61	\N	\N	\N	\N		IT/인터넷
205	NH농협은행	IT	\N	2016 하반기	지방사립	정보통신	3.56	\N	710	\N	\N		IT/인터넷
206	현대 다이모스	IT	\N	2016 하반기	전자	\N	3.20	\N	\N	\N	\N		IT/인터넷
207	SK텔레콤	Network & IT	\N	2016 하반기	전북대	IT정보공학	3.53	\N	\N	\N	\N		IT/인터넷
208	우리은행	IT	\N	2016 하반기	숙명여대	서울대	4.01	4.30	935	\N	\N		IT/인터넷
209	한화생명	IT	\N	2016 하반기	중경외시	컴퓨터공학과	3.50	\N	935	\N	레벨7		IT/인터넷
210	CJ올리브네트웍스	IT	\N	2016 하반기	서울 중상위권	컴퓨터공학	3.75	\N	850	\N	\N		IT/인터넷
211	신한은행	IT 석박사	\N	2016 하반기	고대 대학원	통계	4.00	\N	\N	\N	레벨6		IT/인터넷
212	LG CNS	스마트 IT	\N	2016 하반기	인하대	공간정보공학과	3.51	\N	785	\N	\N		IT/인터넷
213	LG CNS	IT	\N	2016 하반기	중앙대	컴퓨터공학과	3.48	\N	\N	AL	\N		IT/인터넷
214	현대오토에버	IT부문	\N	2016 하반기	수도권4년제	컴공	4.09	\N	940	\N	\N		IT/인터넷
215	KT그룹	IT컨설팅	\N	2016 하반기	세종대학교	컴퓨터공학과	3.60	\N	750	\N	\N		IT/인터넷
216	현대오토에버	IT	\N	2016 하반기	서울 중하위	경영	3.70	\N	920	\N	\N		IT/인터넷
217	CJ올리브네트웍스	IT	\N	2016 하반기	인서울	컴퓨터공학	4.22	\N	835	\N	\N		IT/인터넷
218	현대오토에버	IT부문	\N	2016 하반기	지방사립대	전자과	3.90	\N	780	\N	\N		IT/인터넷
219	KT	IT 컨설팅	\N	2016 하반기	건동홍	전자전기공학부	3.70	\N	855	\N	\N		IT/인터넷
220	LG C&S	스마트IT	\N	2016 하반기	지거국	컴공	3.70	\N	825	\N	\N		IT/인터넷
221	신한은행	IT	\N	2016 하반기	서울중위권	컴퓨터	3.67	\N	770	\N	\N		IT/인터넷
222	cj오쇼핑	IT	\N	2016 하반기	건동홍	컴공	3.40	\N	\N	IL	\N		IT/인터넷
223	KT	IT 컨설팅	\N	2016 하반기	중경외시	전자전기공학과	3.80	\N	930	\N	\N		IT/인터넷
224	기아	IT	\N	2016 하반기	중경외시	컴퓨터공학과	3.65	\N	\N	IM2	\N		IT/인터넷
225	KT	IT(컨설팅)	\N	2016 하반기	지방4년제사립대	컴퓨터공학, 전자공학	3.20	\N	875	\N	\N		IT/인터넷
226	NH농협은행	IT	\N	2016 하반기	숭실대	컴퓨터	3.60	\N	\N	\N	\N		IT/인터넷
227	SK C&C	IT	\N	2016 상반기	수도권 사립 4년제	\N	3.84	\N	725	\N	\N		IT/인터넷
228	CJ오쇼핑	IT개발	\N	2016 상반기	중경	컴퓨터공학부	3.78	\N	\N	\N	\N		IT/인터넷
229	SK텔레콤	network and IT	\N	2016 상반기	인하대학교	정보통신공학	3.05	\N	\N	\N	\N		IT/인터넷
230	KT	IT컨설팅	\N	2016 상반기	한양대	산업공학	3.85	\N	855	IM2	\N		IT/인터넷
231	CJ CGV	IT	\N	2016 상반기	서울과기대	컴퓨터공학과	4.06	\N	940	\N	\N		IT/인터넷
232	현대 글로비스	IT	\N	2016 상반기	가천대학교	소프트웨어학과	3.89	\N	820	\N	\N		IT/인터넷
233	삼성 생명	IT 직무	\N	2016 상반기	국숭세단	컴퓨터 공학과	3.25	\N	\N	\N	\N		IT/인터넷
234	CJ ENM	오쇼핑부문 IT	\N	2016 상반기	중앙대학교	컴퓨터공학	3.14	\N	\N	\N	\N		IT/인터넷
235	삼성생명	IT	\N	2016 상반기	경기대학교	컴퓨터과학과	3.27	\N	845	\N	\N		IT/인터넷
236	현대오토에버	IT영업	\N	2016 상반기	연세대	경제	3.50	\N	970	AL	\N		IT/인터넷
237	CJ올리브네트웍스	IT	\N	2016 상반기	\N	\N	\N	\N	\N	\N	\N		IT/인터넷
238	SK텔레콤	network	\N	2016 상반기	지방사립대	컴퓨터공학과	2.89	\N	\N	im1	\N		IT/인터넷
239	현대엔지니어링	경영지원 IT	\N	2016 상반기	서울과학기술대학교	컴퓨터공학	4.06	\N	\N	\N	\N		IT/인터넷
240	KT	it컨설팅	\N	2016 상반기	고려대	보건과학	3.50	\N	\N	\N	\N		IT/인터넷
241	농협생명	IT 전산	\N	2015 하반기	지방국립대	정보통신공학과	3.80	\N	660	\N	\N		IT/인터넷
242	이랜드 시스템즈	IT 개발	\N	2015 하반기	아주대학교	정보컴퓨터공학과	3.41	\N	\N	IL	\N		IT/인터넷
243	CJ올리브네트웍스	IT사업부분	\N	2015 하반기	건동홍	컴퓨터공학과	3.25	\N	875	\N	\N		IT/인터넷
244	sk 고용디딤돌	it	\N	2015 하반기	지거국	컴퓨터	3.00	\N	585	\N	\N		IT/인터넷
245	BGF리테일	전문직(IT)	\N	2015 하반기	서울권4년제	컴퓨터공학	4.30	\N	835	\N	\N		IT/인터넷
246	현대위아	IT	\N	2015 하반기	아주대학교	정보컴퓨터공학	3.50	\N	\N	\N	\N		IT/인터넷
247	삼성카드	IT	\N	2015 하반기	수도권 4년제	컴퓨터공학	3.60	\N	875	\N	\N		IT/인터넷
248	SK C&C	IT	\N	2015 하반기	건국대학교	컴퓨터공학과	3.92	\N	\N	\N	\N		IT/인터넷
249	SK C&C	IT	\N	2015 하반기	경기	산공	\N	\N	\N	IM2	\N		IT/인터넷
250	SK C&C	IT	\N	2015 하반기	국민대학교	전자공학부	3.97	\N	770	IM2	\N		IT/인터넷
251	SKC&C	IT	\N	2015 하반기	서울 4년제	컴퓨터공학	3.55	\N	905	\N	\N		IT/인터넷
252	KT텔레캅	IT(R&D)	\N	2015 하반기	서울 하위	전자정보통신	3.39	\N	\N	IL	\N		IT/인터넷
253	SK주식회사C&C	IT	\N	2015 하반기	중경외시	산업공학과	3.60	\N	\N	IL	\N		IT/인터넷
254	현대중공업	IT	\N	2015 하반기	서울 중하위	전산관련	3.50	\N	860	\N	\N		IT/인터넷
255	두산중공업	IT	\N	2015 하반기	수도권 4년	컴퓨터공학과	3.75	\N	\N	\N	레벨5		IT/인터넷
256	NH농협은행	IT	\N	2015 하반기	홍익대학교	컴퓨터	3.61	\N	\N	\N	\N		IT/인터넷
257	NH농협은행	IT	\N	2015 하반기	서울 4년제	컴퓨터공학	3.67	\N	795	\N	레벨6		IT/인터넷
258	KT	IT	\N	2015 하반기	경희대	생체의공	3.20	\N	\N	\N	\N		IT/인터넷
259	NH농협은행	IT	\N	2015 하반기	지방국립대	\N	3.30	\N	795	\N	\N		IT/인터넷
260	농협손해보험	IT	\N	2015 하반기	아주대	컴퓨터공학	4.00	\N	\N	\N	\N		IT/인터넷
261	HMC투자증권	IT	\N	2015 하반기	지방 국립대	컴퓨터공학과	3.60	\N	710	\N	\N		IT/인터넷
262	중앙일보	IT	\N	2015 하반기	서울4년제	멀티미디어공학과	4.12	\N	835	IH	\N		IT/인터넷
263	두산중공업	IT	\N	2015 하반기	서울 중위권	컴퓨터 공학	4.00	4.50	\N	\N	레벨6		IT/인터넷
264	현대오토에버	IT일반	\N	2015 하반기	서울4년제	컴퓨터공학	3.70	\N	790	\N	레벨6		IT/인터넷
265	LG디스플레이	IT업무혁신	\N	2015 하반기	5공	소프트웨어공학	3.72	\N	\N	\N	\N		IT/인터넷
266	KT telecop	IT	\N	2015 하반기	지거국	전기전자	3.60	\N	795	\N	\N		IT/인터넷
267	현대모비스	IT	\N	2015 하반기	중경외	컴퓨터공학	3.62	\N	820	IM2	\N		IT/인터넷
268	KT텔레캅	IT	\N	2015 하반기	수도권 4년제	전자공학과	3.70	\N	830	IL	\N		IT/인터넷
269	LG디스플레이	Staff	업무혁신(IT)	2015 하반기	경북대학교	전자공학부	3.99	\N	\N	\N	\N		IT/인터넷
270	KT Powertel	IT 서비스	\N	2015 하반기	서울중상위	전자정보통신공학	3.15	4.50	895	\N	\N		IT/인터넷
271	호텔신라	IT	\N	2015 하반기	지방 사립	정보통신학	3.30	\N	775	\N	\N		IT/인터넷
272	KT텔레캅	IT	\N	2015 하반기	지거국	컴퓨터공학	3.40	\N	775	\N	\N		IT/인터넷
273	현대오토에버	IT부문	\N	2015 하반기	중앙대	컴공	3.52	\N	\N	IM1	\N		IT/인터넷
274	SK C&C	IT	\N	2015 하반기	수도권	컴퓨터공학	3.89	\N	\N	\N	\N		IT/인터넷
275	SK C&C	IT직군	\N	2015 하반기	중상위 여대	컴퓨터과학	3.50	4.50	\N	\N	\N		IT/인터넷
276	CJ올리브네트웍스	IT	\N	2015 하반기	광운대	컴퓨터공학과	3.69	\N	750	IM2	\N		IT/인터넷
277	농협중앙회	IT	\N	2015 하반기	지거국	정보통신공학	3.58	\N	725	\N	\N		IT/인터넷
278	KB국민은행	IT	\N	2015 하반기	동건홍	전자공학	3.58	\N	\N	\N	레벨6		IT/인터넷
279	농협중앙회	IT직군	\N	2015 하반기	아주대학교	정보컴퓨터공학과	3.50	\N	\N	IM2	\N		IT/인터넷
280	농협중앙회	IT	\N	2015 하반기	국숭세단	컴퓨터공학	3.89	\N	\N	\N	\N		IT/인터넷
281	SK C&C	IT	\N	2015 하반기	지거국	정보통신공학	3.67	\N	\N	\N	\N		IT/인터넷
282	(주) 동부	IT 부문	\N	2015 하반기	성균관대학교	전자전기컴퓨터	4.24	\N	\N	\N	\N		IT/인터넷
283	SK C&C	IT	\N	2015 하반기	수도권	컴퓨터공학	3.40	\N	760	\N	\N		IT/인터넷
284	KT파워텔	서비스(IT)	\N	2015 하반기	수도권 사립대	전자공학	3.33	\N	700	\N	\N		IT/인터넷
285	SK C&C	IT 개발	\N	2015 하반기	수도권 4년제	산업공학	3.40	\N	800	\N	\N		IT/인터넷
286	코오롱	IT	\N	2015 하반기	중경외시	전자	3.70	\N	720	\N	\N		IT/인터넷
287	SK C&C	IT	\N	2015 하반기	인서울 4년제	컴퓨터공학	4.43	\N	\N	\N	\N		IT/인터넷
288	KT	IT	\N	2015 하반기	지방 사립	컴공	3.40	\N	\N	\N	레벨5		IT/인터넷
289	SK C&C	it개발	\N	2015 하반기	수도권4년제	컴퓨터	3.58	\N	835	\N	\N		IT/인터넷
290	SK C&C	IT	\N	2015 하반기	수도권	정보통신공학	3.20	\N	700	\N	\N		IT/인터넷
291	KT	IT	\N	2015 하반기	서울 중위권	상경	3.20	\N	905	\N	\N		IT/인터넷
292	두산 중공업	IT	\N	2015 하반기	지방 국립대	정보제어공학과	3.89	\N	\N	\N	\N		IT/인터넷
293	쿠팡	애자일(IT)	\N	2015 하반기	한양대 ERICA	컴퓨터공학과	3.85	\N	780	IM2	\N		IT/인터넷
294	SK C&C	IT	\N	2015 하반기	지방4년제	컴퓨터공학과	3.00	\N	\N	\N	레벨 5		IT/인터넷
295	두산중공업	IT	\N	2015 하반기	단국대	전기전자공학과, 컴퓨터공학과	4.12	\N	720	IL	\N		IT/인터넷
296	NH농협은행	IT	\N	2015 하반기	광운대	컴퓨터소프트웨어공학과	3.54	\N	780	\N	\N		IT/인터넷
297	포스코ICT	IT	\N	2015 하반기	부산대	컴퓨터공학과	4.00	\N	\N	IL	\N		IT/인터넷
298	CJ ENM	오쇼핑부문 IT개발	\N	2015 하반기	아주대학교	전자공학과	3.63	\N	780	\N	\N		IT/인터넷
299	SK C&C	IT	\N	2015 하반기	지방거점국립대	컴퓨터공학과	3.69	\N	\N	\N	레벨 6		IT/인터넷
300	SK C&C	IT	\N	2015 하반기	지방사립대	컴퓨터공학과	2.66	\N	720	IL	\N		IT/인터넷
301	농협중앙회	IT	\N	2015 하반기	지거국	소프트웨어공학과	3.50	\N	\N	IM1	\N		IT/인터넷
302	현대 오토에버	IT부문	\N	2015 하반기	인하대	컴퓨터공학	4.00	\N	\N	\N	\N		IT/인터넷
303	NHN엔터테인먼트	IT	\N	2015 하반기	한양대	컴퓨터공학과	3.53	\N	875	\N	\N		IT/인터넷
304	SK텔레콤	it개발	\N	2015 상반기	지거대	정보통신공학	3.64	\N	705	\N	\N		IT/인터넷
305	CJ 대한통운	IT지원	\N	2015 상반기	동아대학교	전자공학과	3.81	\N	\N	IM2	\N		IT/인터넷
306	LG디스플레이	전사	\N	2015 상반기	서울 중상위	컴퓨터	3.70	\N	\N	\N	\N		IT/인터넷
307	NH농협은행	IT	\N	2015 상반기	수도권 중위권 대학	컴공	3.42	\N	\N	\N	120		IT/인터넷
308	대우증권	IT	\N	2015 상반기	한국항공대학교	컴퓨터공학과	3.41	\N	\N	\N	\N		IT/인터넷
309	이베이 코리아	IT	\N	2014 하반기	이화여대	컴퓨터공학과	3.64	\N	915	\N	\N		IT/인터넷
310	나이스디앤비	ESG	\N	2025 상반기	명지대	환경공학	3.70	\N	785	\N	IH		연구개발/설계
311	삼우종합건축사사무소	ENG설계직	전기설계	2025 상반기	숭실대	전기공학부	3.41	4.50	\N	\N	140	삼우설계(1달) 	연구개발/설계
312	경신	[본사	\N	2025 상반기	지방사립대	항공전자과	3.69	4.50	920	\N	150	자동화 프로그램 제작 인턴 경험 	연구개발/설계
313	화재보험협회	연구분야	\N	2025 상반기	수도권	안전공학과	4.44	4.50	775	\N	130		연구개발/설계
314	코오롱글로텍	제품개발	\N	2024 하반기	지거국	재료공학과	3.65	\N	\N	\N	120	정출연 인턴1개월	연구개발/설계
315	현대자동차	생산	\N	2024 하반기	명지대	환경공학	3.70	\N	785	\N	IH		연구개발/설계
316	롯데케미칼	연구개발-합성수지(의왕)	\N	2024 하반기	숭실대	유기신소재파이버	3.65	4.50	\N	IH	AL		연구개발/설계
317	롯데케미칼	연구개발(합성수지)	\N	2024 하반기	숭실대	유기신소재파이버공학	3.65	4.50	\N	IH	AL		연구개발/설계
318	캐논코리아	제품	\N	2024 하반기	숭실대	전기공학부	3.41	4.50	\N	\N	140	삼우설계(1달) 	연구개발/설계
319	현대엔지니어링	플랜트	전기설계	2024 하반기	숭실대	전기공학부	3.41	4.50	\N	\N	140	삼우설계(1달) 	연구개발/설계
320	신한카드	ICT개발	\N	2024 하반기	국립부경대학교	컴퓨터공학부 컴퓨터공학	3.57	\N	\N	\N	140		연구개발/설계
321	동국제약	제제연구	\N	2024 하반기	경북대	화학과	3.98	4.30	\N	IH	\N		연구개발/설계
322	현대케피코	생산기술 (테스트 솔루션 개발)	\N	2024 하반기	지거국	산업공학과	3.58	4.50	\N	IM2	\N	조선3사 현장실습 	연구개발/설계
323	(주)미래비전그룹	과학기술	\N	2024 하반기	동국대학교	경영정보학과	3.96	4.50	\N	\N	\N		연구개발/설계
324	삼성SDI	배터리 셀	\N	2024 하반기	광운대	화학공학과	\N	\N	\N	IM2	\N	학부연구생 인턴 (1년6개월) 	연구개발/설계
325	롯데GRS	점포개발	\N	2024 하반기	서강대	중국문화학	3.68	4.50	925	IH	\N	IT 플랫폼 기획 인턴, 조선일보 광고사업본부 인턴 	연구개발/설계
326	삼성전자DS	패키지개발	\N	2024 하반기	중앙대	기계공학부	4.20	\N	\N	AL	\N	인턴 	연구개발/설계
327	HD한국조선해양	시스템	\N	2024 하반기	중앙대	기계공학부	4.28	\N	\N	AL	\N	삼성전자 인턴 	연구개발/설계
328	DN솔루션즈	기계설계	\N	2024 하반기	지거국	기계공학	3.62	4.50	905	\N	AL		연구개발/설계
329	한국타이어앤테크놀로지	[R&D] 설계-양산 설계	\N	2024 하반기	지거국	기계공학	3.62	4.50	905	\N	AL		연구개발/설계
330	넥센타이어	개발	\N	2024 하반기	지거국	기계공학	3.62	4.50	905	\N	AL		연구개발/설계
331	두산에너빌리티	설계	발전 기자재 설계	2024 하반기	중앙대	기계공학과	3.77	\N	915	\N	170		연구개발/설계
332	두산에너빌리티	설계	발전 기자재 설계	2024 하반기	지거국	기계공학	3.62	4.50	905	\N	AL		연구개발/설계
333	HD한국조선해양	시스템	\N	2024 하반기	중앙대	기계공학과	3.77	4.50	915	\N	170		연구개발/설계
334	한국타이어앤테크놀로지	타이어설계	\N	2024 하반기	중앙대	기계공학과	3.77	4.50	915	\N	170		연구개발/설계
335	넥센타이어	선행기술연구	\N	2024 하반기	중앙대	기계공학	3.77	4.50	915	\N	170		연구개발/설계
336	효성그룹	생산	\N	2024 하반기	창원대	로봇제어계측공학	3.48	\N	\N	\N	140		연구개발/설계
337	삼성전자	DS부문_혁신센터_SW개발	\N	2024 하반기	건동홍	융합소프트웨어	4.09	4.50	855	\N	140	중소기업 8개월 	연구개발/설계
338	LS일렉트릭	제품설계(북미향(UL, ANSI) 수배전반 수주 Project 구조 설계)	\N	2024 하반기	숭실대	전기공학부	3.60	\N	890	\N	150		연구개발/설계
339	삼성SDI	배터리 공정	\N	2024 하반기	울산대	화학공학과	4.30	\N	\N	\N	140		연구개발/설계
340	인바디	아날로그 회로(연구개발)	\N	2024 하반기	인하대	전기공학과	3.32	\N	\N	\N	130		연구개발/설계
341	한국타이어앤테크놀로지	[R&D] 재료-Compound 개발연구	\N	2024 하반기	유니스트	에너지화학공학과	3.65	4.30	855	IH	\N		연구개발/설계
342	한국타이어앤테크놀로지	[R&D] 재료-원료 개발연구	\N	2024 하반기	서성한	신소재	3.60	\N	\N	IH	\N	반도체 인턴1회	연구개발/설계
343	원익홀딩스	건설인프라(공정설계)	\N	2024 하반기	고려대	화공생명공학과	3.55	4.50	940	IH	\N		연구개발/설계
344	삼성E&A	기술직(설계)	\N	2024 하반기	고려대	화공생명공학과	3.55	4.50	940	IH	\N		연구개발/설계
345	캐논코리아 주식회사	IT개발운영	\N	2024 하반기	선문대	주:정보통신공학과	4.39	4.50	\N	\N	110		연구개발/설계
346	효성중공업	생산	초고압변압기설계	2024 하반기	동국대	전자전기공학	3.80	4.50	\N	AL	\N		연구개발/설계
347	더커머스	백엔드 개발자	\N	2024 하반기	지거국	컴퓨터학부 복수전공	3.08	4.50	800	\N	\N	미래내일일경험 인턴 3개월 	연구개발/설계
348	동아일보	동아일보 미래전략연구소 하반기 인턴 - 콘텐츠 마케팅	\N	2024 하반기	가천대학교	경찰행정학과	3.97	\N	\N	\N	IM3		연구개발/설계
349	삼성E&A	기술직(설계)	\N	2024 하반기	중경외시	화학공학과	3.95	4.50	\N	\N	\N		연구개발/설계
350	삼성전자	DS 부문 System LSI사업부	SW개발	2024 하반기	지거국	전자공학부	3.91	\N	\N	\N	\N		연구개발/설계
351	삼성디스플레이	연구개발	\N	2024 하반기	지거국	전자공학부	3.95	4.50	\N	\N	\N		연구개발/설계
352	현대자동차	연구개발	파이롯트(NextGen 인턴십)	2024 상반기	연세대	기계공학과	3.48	4.30	895	AL	\N	HD현대 로보틱스(3개월), 씨드로닉스(6개월), 넥스트랩(2개월) 	연구개발/설계
353	삼성전자	DS부문	메모리사업부 회로설계	2024 상반기	경희대	전자공학	4.09	4.50	\N	IH	\N		연구개발/설계
354	SK하이닉스	설계(이천	\N	2024 상반기	경희대	전자공학	4.09	4.50	\N	IH	\N		연구개발/설계
355	한화시스템	ERP개발	\N	2024 상반기	중앙대	융합공학	3.94	4.50	\N	\N	140		연구개발/설계
356	현대자동차	생산	\N	2024 상반기	전남대	화학공학부	4.05	\N	\N	\N	120		연구개발/설계
357	광건티앤씨	공사관리부(설계)	\N	2024 상반기	고졸	문과	\N	\N	\N	\N	\N		연구개발/설계
358	세스코	기구개발 및 설계	\N	2024 상반기	서울과학기술대학교	MSDE	4.08	4.50	\N	IH	\N		연구개발/설계
359	삼성전자	DX부문	생산기술연구소 기구개발	2024 상반기	인가경	기계공학과	4.19	4.50	\N	IM1	\N		연구개발/설계
360	삼성전자	DS부문 CTO-반도체연구소	반도체공정기술	2024 상반기	인서울	화학공학과	3.80	4.50	820	IM2	\N		연구개발/설계
361	삼성전자	DX부문 DA사업부 SW개발	\N	2024 상반기	연세대	인공지능학	4.09	\N	\N	IL	\N	인턴 경험 6개월, 경력 1년 10개월 	연구개발/설계
362	삼성전자	SW개발	\N	2024 상반기	수도권 4년제	컴퓨터공학과	4.10	4.50	\N	IM	\N		연구개발/설계
363	삼성전자	DS부문 System LSI사업부	신호및시스템설계	2024 상반기	연세대	기계공학과	3.48	4.30	895	AL	\N	씨드로닉스(6개월), HD현대로보틱스(3개월), 넥스트랩(2개월) 	연구개발/설계
364	현대자동차	자율주행 UX	\N	2024 상반기	연세대	기계공학과	3.48	4.30	895	AL	\N	HD현대로보틱스(3개월), 씨드로닉스(6개월), 넥스트랩(2개월) 	연구개발/설계
365	삼성전자	DS부문 반도체연구소 공정설계	\N	2024 상반기	숭실대	전기공학부	4.15	4.50	900	IH	\N	한창코퍼레이션 인턴 	연구개발/설계
366	이언그룹	컨설팅 인턴 연구원	\N	2024 상반기	서울 4년제	행정학과	3.53	\N	850	\N	\N	인턴 2회 	연구개발/설계
367	롯데바이오로직스	전기 제어 설계	\N	2024 상반기	숭실대	전기공학부	3.41	4.50	\N	\N	140		연구개발/설계
368	삼성E&A	기술직(설계	\N	2024 상반기	숭실대	전기공학부	3.41	4.50	\N	\N	140		연구개발/설계
369	삼우종합건축사사무소	전기설계	\N	2024 상반기	숭실대	전기공학부	3.41	4.50	\N	\N	140		연구개발/설계
370	캐논코리아	연구개발(전기	\N	2024 상반기	숭실대	전기공학부	3.41	4.50	\N	\N	140		연구개발/설계
371	삼성전자	[연구개발	\N	2024 상반기	지거국	광메카트로닉스공학과	3.79	\N	\N	IM2	\N	학부연구생 6개월 	연구개발/설계
372	현대모비스	FTCI_연구직_사이버보안	\N	2024 상반기	중앙대	산업보안학과	4.06	\N	\N	IM1	\N	보안분야 대기업 인턴 6개월 1회, IT분야 대기업 인턴 1개월 1회 	연구개발/설계
373	이노팩토리	웹개발	\N	2024 상반기	가천대학교	글로벌경제학과	3.70	\N	\N	\N	\N		연구개발/설계
374	삼성전자	DS부문 S.LSI사업부 회로설계	\N	2024 상반기	성균관대학교	전자전기공학부	3.91	4.50	860	IH	\N		연구개발/설계
375	SK E&S	Global 사업개발	\N	2024 상반기	한국과학기술원	기술경영학부	3.53	4.30	985	AL	\N		연구개발/설계
376	SGC이테크건설	기계설계	\N	2024 상반기	서울과학기술대학교	MSDE (기계+산업공학)	4.08	4.50	\N	IH	\N		연구개발/설계
377	LG에너지솔루션	Module	\N	2024 상반기	서울과학기술대학교	MSDE (기계+산업공학)	4.08	4.50	\N	AL	\N		연구개발/설계
378	성우하이텍	개발	\N	2024 상반기	강원대	기계공학	3.78	4.50	850	\N	150		연구개발/설계
379	기아	제조솔루션	생산기술(신차개발-광명	2024 상반기	충북대	제어로봇공학과	4.17	\N	\N	IM1	\N		연구개발/설계
380	KT	vision기술개발	\N	2024 상반기	충북대	제어로봇공학과	4.17	\N	\N	IM1	\N		연구개발/설계
381	LG전자	R&D_기계_H&A본부_기구설계	\N	2024 상반기	인가경	기계공학과	4.19	4.50	\N	IM1	\N		연구개발/설계
382	현대자동차	연구개발	전동화 구동 시스템 개발	2024 상반기	국민대학교	자동차공학	3.99	4.50	\N	IM2	\N		연구개발/설계
383	삼성전자	DS부문 CTO	반도체연구소 공정기술	2024 상반기	성균관대학교	화학공학과	3.69	4.50	830	IM	\N		연구개발/설계
384	SK하이닉스	Solution설계	\N	2024 상반기	국숭세단	전자공학	3.83	4.50	\N	\N	150		연구개발/설계
385	삼성전자	DA사업부 SW개발	\N	2024 상반기	인하대학교	컴퓨터공학과	3.47	\N	\N	IM2	\N		연구개발/설계
386	현대자동차	연구개발	차량개발 프로젝트 관리	2024 상반기	서울과학기술대학교	기계자동차공학과	3.90	\N	\N	IM2	\N	군 장교 복무 	연구개발/설계
387	KIA	제조솔루션	생산기술(신차개발-광명	2024 상반기	연세대	기계공학	3.48	4.30	895	AL	\N	씨드로닉스(6개월), 넥스트랩(2개월), HD현대 로보틱스(3개월) 	연구개발/설계
388	삼성전자	AVP 사업팀	패키지 개발	2024 상반기	산기대	생명화학공학과	3.69	\N	750	IM2	\N	앰코코리아 1년	연구개발/설계
389	현대자동차	연구개발	차량 충돌안전 성능개발(설계	2024 상반기	인하대학교	정보통신공학과	3.85	4.50	\N	IH	\N	한국철도기술연구원(3개월), 중견기업 정직원(3개월) 	연구개발/설계
390	삼성전자	DS부문 Test&System Package총괄	패키지개발	2024 상반기	중앙대	기계공학과	4.31	4.50	\N	AL	\N		연구개발/설계
391	한솔테크닉스	H	\N	2024 상반기	지방사립대	항공전자공학	3.69	4.50	920	\N	150		연구개발/설계
392	인바디	기계설계(연구개발	\N	2024 상반기	한국공학대	기계설계	4.03	\N	860	IM2	\N		연구개발/설계
393	삼성전자	파운드리사업부	회로설계	2024 상반기	인하대학교	정보통신공학과	3.85	4.50	\N	IH	\N	한국철도기술연구원 인턴 1회 	연구개발/설계
394	삼성전자	CTO_반도체연구소_반도체공정기술	\N	2024 상반기	아주대학교	응용화학생명공학	3.62	\N	\N	IH	\N	인턴 2개월, 중견기업 8개월 재직 	연구개발/설계
395	삼성전자	CTO_반도체연구소_반도체공정기술	\N	2024 상반기	건동홍	화학공학	3.50	4.50	\N	AL	\N	장비사 1년	연구개발/설계
396	삼성전자	SW개발	\N	2024 상반기	지방	전자공학, 컴퓨터공학	4.04	4.50	\N	\N	140		연구개발/설계
397	삼성전자	반도체연구소 공정기술	\N	2024 상반기	고려대	신소재	4.10	4.50	\N	\N	AL		연구개발/설계
398	현대자동차	전동화-생산기술(남양연구소)	\N	2024 상반기	홍익대학교	화학공학과	4.39	4.50	905	ih	\N		연구개발/설계
399	삼성전자	DA사업부	기구개발	2024 상반기	서울대	건축학과 건축공학전공	3.89	\N	965	IH	\N		연구개발/설계
400	삼성전자	DA사업부	SW개발	2024 상반기	성균관대	기계	4.14	4.50	\N	ih	\N		연구개발/설계
401	아이디스	SW 연구개발	\N	2024 상반기	영남대	컴퓨터공학과	3.62	4.50	\N	\N	\N		연구개발/설계
402	광건티앤씨	건축 설계	\N	2024 상반기	고졸	문과	\N	\N	\N	\N	\N		연구개발/설계
403	현대자동차	생산	\N	2024 상반기	항공대	신소재공학과	3.90	\N	\N	IH	\N		연구개발/설계
404	네이버 클라우드	Multimodal LLM 모델 개발을 위한 Data 업무	\N	2024 상반기	가천대	소프트웨어학	3.57	4.50	\N	AL	\N		연구개발/설계
405	네이버	Tech	SW개발	2024 상반기	고려대학교	컴퓨터학과	3.94	4.50	980	IH	\N		연구개발/설계
406	캐논코리아	연구개발(전기	\N	2024 상반기	경북대	전자공학부	4.03	4.50	\N	IM1	\N		연구개발/설계
407	지학사	초·중·고 교과서	\N	2024 상반기	덕성여대	유아교육, 영어영문	3.45	\N	\N	\N	\N		연구개발/설계
408	DSR	R&D 기술연구소	\N	2024 상반기	지거국	신소재공학부	3.75	\N	\N	IH	\N	학부연구생 1년 6개월 	연구개발/설계
409	스타리온 기원	연구개발팀	\N	2024 상반기	인제대학교	기계공학과	3.50	4.50	\N	\N	\N		연구개발/설계
410	한국유나이티드제약	전동연구소(분석관련직무)	\N	2024 상반기	지거국	화학	3.27	4.50	\N	\N	\N		연구개발/설계
411	도화엔지니어링	투자사업개발	\N	2024 상반기	지거국	경제학	3.68	4.50	815	\N	\N	신생 자산운용사 1년 	연구개발/설계
412	삼성전자	SW개발	\N	2024 상반기	수도권 4년제	컴퓨터공학과	4.10	4.50	\N	IM	\N		연구개발/설계
413	삼성전자	회로설계	\N	2024 상반기	숭실대학교	전자공학	3.75	\N	\N	IM2	\N		연구개발/설계
414	SK하이닉스	회로 설계	\N	2024 상반기	고려대학교	전기전자공학부	3.72	\N	960	\N	\N		연구개발/설계
415	삼성전자	DA사업부 SW개발	\N	2024 상반기	인하대학교	컴퓨터공학과	3.47	\N	\N	IM2	\N		연구개발/설계
416	삼성전자	DA사업부 SW개발	\N	2024 상반기	연세대	인공지능학	4.09	\N	\N	IL	\N		연구개발/설계
417	안랩	Windows 개발	\N	2023 하반기	건동홍	컴퓨터공학	3.90	4.50	870	IH	\N		연구개발/설계
418	교보생명	SW개발	\N	2023 하반기	건동홍	컴퓨터공학	4.20	4.50	870	IH	\N		연구개발/설계
419	케이뱅크	[Tech] Back-End 개발	\N	2023 하반기	건동홍	컴퓨터공학	4.20	4.50	745	IM2	\N		연구개발/설계
420	한화정밀기계	SMT	\N	2023 하반기	건동홍	컴퓨터공학	4.20	4.50	745	IM2	\N		연구개발/설계
421	HL디앤아이한라	개발	\N	2023 하반기	서강대	경영학과	3.32	\N	\N	IH	\N	인턴 2개월 	연구개발/설계
422	한솔제지	기술개발	\N	2023 하반기	서성한	화학공학과	3.40	\N	\N	IH	140		연구개발/설계
423	SK하이닉스	설계	\N	2023 하반기	경희대	이과	4.09	4.50	\N	IH	\N		연구개발/설계
424	삼성전자	메모리사업부 회로설계	\N	2023 하반기	경희대	이과	4.09	4.50	\N	IH	\N		연구개발/설계
425	현대자동차	글로벌사업	수소	2023 하반기	서성한	비상경	4.30	4.50	\N	AL	\N	인턴 4회 	연구개발/설계
426	현대자동차	차량개발	구동	2023 하반기	중경외시	기계공학	3.86	4.50	\N	\N	150	현장실습 6개월, 15대 대기업 1년 	연구개발/설계
427	HD현대로보틱스	기구설계	\N	2023 하반기	연세대	기계공학	3.48	4.30	895	AL	\N	넥스트랩(2개월) 	연구개발/설계
428	파두	[FW] SSD Platform FW 개발자	\N	2023 하반기	서울과학기술대	전자공학과	4.13	\N	\N	IM	\N	한국과학기술연구원(KIST) 인턴, 삼성전자 인턴 	연구개발/설계
429	한화시스템	ICT부문-서비스 개발	\N	2023 하반기	한양대	컴퓨터소프트웨어학부	3.50	\N	\N	\N	150	인턴	연구개발/설계
430	현대자동차	차량개발	차량 충돌안전 성능개발(설계	2023 하반기	인하대학교	정보통신공학과	3.85	4.50	\N	IH	\N	한국철도기술연구원 인턴 1회 	연구개발/설계
431	와이솔	회로설계	\N	2023 하반기	인하대학교	정보통신공학과	3.85	4.50	\N	IH	\N	한국철도기술연구원 인턴 	연구개발/설계
432	삼성전자	DS부문	SW개발	2023 하반기	숭실대학교	컴퓨터학부	3.37	\N	840	IM1	\N		연구개발/설계
433	(주)효성	R&D	중공업연구(안양)	2023 하반기	지거국	전기공학	\N	\N	\N	IL	100		연구개발/설계
434	CJ올리브영	상품개발	\N	2023 하반기	인가경	글로벌어문학부	3.79	4.50	\N	IH	\N	스타트업 콘텐츠팀 인턴 	연구개발/설계
435	현대자동차	차량개발	차량 열에너지 시스템 개발	2023 하반기	서울과학기술대학교	기계공학	3.69	4.50	750	IM2	\N		연구개발/설계
436	삼성전자	기구개발	\N	2023 하반기	서울과학기술대학교	기계공학	3.69	4.50	750	IM2	\N		연구개발/설계
437	골프존	Back-end 개발	\N	2023 하반기	한양대학교	컴퓨터소프트웨어학부	3.50	\N	\N	\N	150	인턴	연구개발/설계
438	KINX(케이아이앤엑스)	사내 시스템 Front-End 개발자	\N	2023 하반기	한양대학교	컴퓨터소프트웨어학부	3.50	\N	\N	\N	150	인턴	연구개발/설계
439	한화투자증권	본사영업(Trading	\N	2023 하반기	한양대학교	컴퓨터소프트웨어학부	3.50	\N	\N	\N	150	인턴	연구개발/설계
440	교보생명	SW개발	\N	2023 하반기	한양대학교	컴퓨터소프트웨어학부	3.50	\N	\N	\N	150	인턴	연구개발/설계
441	한화시스템	ICT부문-서비스 개발	\N	2023 하반기	한양대학교	컴퓨터소프트웨어학부	3.50	\N	\N	\N	150	인턴	연구개발/설계
442	한국교통안전공단 자동차안전연구원	자동차안전연구원 청년인턴	\N	2023 하반기	한국공대	기계	3.64	4.50	\N	\N	160	해외법인 인턴, 학부연구원 	연구개발/설계
443	LG에너지솔루션	[CTO] 차세대전지개발(소재	\N	2023 하반기	고려대	신소재공학	3.80	\N	895	AL	\N	한국세라믹기술원 인턴 6개월 	연구개발/설계
444	HD현대일렉트릭	구조설계	\N	2023 하반기	동국대학교	기계로봇에너지공학과	3.63	4.50	\N	IH	\N		연구개발/설계
445	현대제철	R&D 공정연구	\N	2023 하반기	지거국	신소재공학부	3.75	\N	\N	IH	\N	학부연구생 1년 6개월 	연구개발/설계
446	한화	글로벌	\N	2023 하반기	국민대	기계공학	3.68	4.50	845	\N	150		연구개발/설계
447	한국타이어앤테크놀로지	기술개발	\N	2023 하반기	국민대	기계공학	3.68	4.50	845	\N	150		연구개발/설계
448	현대자동차	차량개발	바디 시스템 설계	2023 하반기	국민대	기계공학	3.68	4.50	845	\N	150		연구개발/설계
449	경신전선	[전장사업]제품개발	\N	2023 하반기	국민대	기계공학과	3.68	\N	845	\N	150		연구개발/설계
450	현대스틸파이프	기술개발지원	\N	2023 하반기	지방사립대	신소재공학	3.45	4.50	\N	IH	\N	계약직 10개월 	연구개발/설계
451	현대종합금속	포항 공장 기술연구소	\N	2023 하반기	지방사립대	신소재공학	3.45	4.50	\N	IH	\N	계약직 10개월(연구직) 	연구개발/설계
452	현대오토에버	스마트팩토리 표준 프레임 개발	\N	2023 하반기	수도권 4년제	소프트웨어	4.08	4.50	\N	\N	IM3		연구개발/설계
453	삼우종합건축사사무소	공조설계	\N	2023 하반기	지거국	냉동공조	3.55	\N	\N	IH	\N	학부연구생 	연구개발/설계
454	LG디스플레이	R&D기구개발	\N	2023 하반기	경북대학교	전자공학부	3.20	\N	\N	IH	\N		연구개발/설계
455	동진쎄미켐	연구 개발	\N	2023 하반기	서카포	화학과 석사	3.54	4.30	870	\N	150		연구개발/설계
456	금호타이어	타이어 구조 설계 및 개발	\N	2023 하반기	서울과기대	기계시스템디자인공학과	3.77	4.50	\N	\N	140		연구개발/설계
457	샘씨엔에스	설계	\N	2023 하반기	지거국	기계공학과	3.08	\N	785	\N	\N		연구개발/설계
458	줌인터넷(ZUM)	백엔드 개발자 (신입 가능)	\N	2023 하반기	한국공학대학교	전자공학과	3.50	4.50	\N	\N	\N		연구개발/설계
459	오케스트로	IT개발	\N	2023 하반기	고졸	이과	\N	\N	670	\N	\N	타회사 경력 10개월 	연구개발/설계
460	테스	공정개발	\N	2023 하반기	광운대학교	전기공학과	3.54	4.50	\N	IH	\N		연구개발/설계
461	LS ELECTRIC	R&D - 제품설계	\N	2023 하반기	광운대학교	전기공학과	3.54	4.50	\N	IH	\N		연구개발/설계
462	삼성SDI	배터리 셀, 소재 개발	\N	2023 하반기	한양대	재료화학공학	3.54	4.50	\N	IM2	\N		연구개발/설계
463	동아오츠카	제품개발	\N	2023 하반기	가천대학교	화공생명공학과	3.00	\N	130	\N	1		연구개발/설계
464	삼성전자	SYSTEM LSI 사업부-SW개발	\N	2023 하반기	영남대학교	전자공학과	4.13	\N	\N	\N	\N		연구개발/설계
465	삼성 SDI	배터리 팩	\N	2023 상반기	서울과학기술대학교	MSDE	4.08	4.50	\N	IH	\N		연구개발/설계
466	피디정보통신	개발자	\N	2023 상반기	경기대학교	지식재산학	3.80	\N	\N	IL	\N		연구개발/설계
467	한화오션	특수선성능설계	\N	2023 상반기	중경외시	기계공학	3.86	4.50	\N	\N	150	인턴 6개월 	연구개발/설계
468	LS엠트론	제품개발설계	트랙터TM설계	2023 상반기	중경외시	기계공학	3.86	4.50	\N	\N	150	인턴 6개월 	연구개발/설계
469	현대케피코	연구개발 액추에이터 시작개발	\N	2023 상반기	중경외시	기계공학	3.86	4.50	\N	\N	150	인턴 6개월 	연구개발/설계
470	HD현대 건설 기계	[현대두산인프라코어]엔진 설계	\N	2023 상반기	중경외시	기계공학	3.86	4.50	\N	\N	150	인턴 6개월 	연구개발/설계
471	HD현대	[한국조선해양]설계	\N	2023 상반기	중경외시	기계공학	3.86	4.50	\N	\N	150	인턴 6개월 	연구개발/설계
472	SK하이닉스	SoC 설계	\N	2023 상반기	지거국	카이스트 석사	4.20	4.50	870	\N	\N		연구개발/설계
473	건원건축	건축설계	\N	2023 상반기	지거국	건축학과	4.10	\N	\N	\N	130	sdw 수료 	연구개발/설계
474	현대자동차	에너지 최적화 차량제어 알고리즘 개발	\N	2023 상반기	광운대	로봇학부	3.98	4.50	\N	\N	160	인턴 1회 	연구개발/설계
475	삼성전자	생활가전사업부	SW개발	2023 상반기	광운대	로봇학부	3.98	4.50	925	\N	160	인턴 1회 	연구개발/설계
476	LS ELECTRIC	R&D - 연구개발	\N	2023 상반기	국민대	기계공학	3.68	\N	845	\N	150		연구개발/설계
477	삼성전자	DS부문 혁신센터	신호 및 시스템 설계	2023 상반기	고려대학교	기계공학부	3.78	4.50	810	im2	\N		연구개발/설계
478	HD 현대그룹 현대중공업	조선해양	기본설계(조선)	2023 상반기	고려대학교	기계공학부	3.78	4.50	810	im2	\N		연구개발/설계
479	고려제약	학술개발팀	\N	2023 상반기	지거국	면역학	3.20	4.50	830	AL	\N	인턴 - 한국생명공학연구원	연구개발/설계
480	신디자인랩건축사사무소	건축설계, 인테리어설계, 조경설계	\N	2023 상반기	부산대	건축학과	3.50	4.50	740	IM1	\N		연구개발/설계
481	프리베노틱스	프론트엔드 개발	\N	2023 상반기	고려대학교	기계공학부	4.02	4.50	\N	\N	\N	IoT 시제품 외주 개발 경험 	연구개발/설계
482	매직큐브	유아동 컨텐츠개발	\N	2023 상반기	오산대학교	유아교육과	3.45	4.50	\N	\N	\N	오산대학교부설유치원 	연구개발/설계
483	지바이크	개발	\N	2023 상반기	강원대학교	산업공학과	3.74	\N	\N	\N	\N	음향 전문 기업 좋은 사람 	연구개발/설계
484	아시아나IDT	시스템 운영 및 개발	\N	2023 상반기	경희대	식품영양학과	3.39	\N	800	\N	\N		연구개발/설계
485	삼성전기	연구개발-품질기술	\N	2023 상반기	동아대	기계공학과	4.19	4.50	775	IM1	\N		연구개발/설계
486	현대제철	R&D(연구개발	\N	2023 상반기	서성한	기계공학부	4.09	\N	\N	IM3	\N		연구개발/설계
487	현대인프라코어	제품개발-설계	\N	2023 상반기	서성한	기계공학부	4.09	\N	\N	IM3	\N		연구개발/설계
488	현대엘리베이터	R&D-제품연구	\N	2023 상반기	서성한	기계공학부	4.09	\N	\N	IM3	\N		연구개발/설계
489	인바디	개발	기계설계	2023 상반기	경기대	기계시스템공학과	3.55	4.50	900	IM3	\N		연구개발/설계
490	GS건설	플랜트	기계	2023 상반기	경기대	기계시스템공학과	3.55	4.50	900	IM3	\N		연구개발/설계
491	현대자동차	현가시스템 개발	\N	2023 상반기	연세대	기계공	3.30	4.30	\N	\N	\N		연구개발/설계
492	건강보험심사평가원	전산직 시스템 개발 6급가(일반)	\N	2023 상반기	교통대	컴퓨터정보공학	3.35	4.50	\N	\N	\N	한국형사법무정책연구원 인턴3개월 	연구개발/설계
493	대건소프트	소프트웨어개발	\N	2023 상반기	학점은행 전문대	이과	3.15	\N	\N	\N	\N		연구개발/설계
494	현대오토에버	차량전장SW - 차량전장SW 플랫폼 개발	\N	2023 상반기	동국대학교	전자전기공학부	3.90	4.50	\N	IM2	\N		연구개발/설계
495	현대자동차	차량 제어 신기술 개발 관리 및 협업 체계 기획	\N	2023 상반기	동국대학교	전자전기공학부	3.90	4.50	\N	IM2	\N		연구개발/설계
496	윈스	AI 개발	\N	2023 상반기	한성대	산업경영공학과	3.56	4.50	\N	\N	120		연구개발/설계
497	하나금융티아이	금융 IT 서비스 개발	\N	2023 상반기	국숭세단	산업공학	3.90	\N	910	IH	\N	인턴 3회 	연구개발/설계
498	동아대학교 산학협력단	연구소 연구원	\N	2023 상반기	부산대학교	식물생명과학	3.30	4.50	\N	\N	130	공기업 인턴 	연구개발/설계
499	한국경영자총협회	조사 연구	\N	2023 상반기	중앙대	공공인재학부	4.07	4.50	815	\N	140	신용보증기금 인턴, 록톤컴퍼니즈코리아 손해보험중개사 인턴 	연구개발/설계
500	(주)아트박스	상품개발실	\N	2023 상반기	중경외시	화학	3.61	\N	\N	IH	\N	GSK 인턴 	연구개발/설계
501	하나금융티아이	금융IT 개발	\N	2023 상반기	가톨릭대학교	컴퓨터공학과	3.59	4.50	\N	\N	\N		연구개발/설계
502	HD현대로보틱스	기구설계	\N	2022 하반기	광운대	로봇학부	3.98	4.50	925	\N	160	인턴 1회 	연구개발/설계
503	네이버파이낸셜	Back-End 개발	\N	2022 하반기	경기대학교	컴퓨터공학부	3.51	4.50	\N	\N	\N	(주)인플스톡-백엔드 인턴 ( 3개월 )	연구개발/설계
504	삼성전자	DS 부문	회로설계	2022 하반기	서울과학기술대학교	기계공학과	4.08	4.50	920	AL	\N		연구개발/설계
505	네이버제트	사업개발	\N	2022 하반기	단국대	경영학과	3.95	\N	\N	\N	150	하이트진로 마케팅 인턴 	연구개발/설계
506	현대자동차	R&D	샤시 시스템 개발	2022 하반기	중경외시	기계공학	3.86	4.50	\N	\N	150	설계 인턴 6개월 	연구개발/설계
507	삼성전자	DX부문	SW개발	2022 하반기	광운대	로봇학부	3.98	4.50	925	\N	160	인턴 1회 	연구개발/설계
508	펄어비스	웹개발(백엔드)	\N	2022 하반기	인하대	컴퓨터공학과	3.69	\N	\N	\N	IM3	한국철도기술연구원 - 강화학습을 통한 열차재스케줄링 	연구개발/설계
509	유디에스	PLM, BOM 솔루션 개발 및 유지보수	\N	2022 하반기	수도권 4년제	전자공학과	3.50	\N	\N	\N	\N		연구개발/설계
510	삼성전자	DS부문	SW개발	2022 하반기	아주대	전자과	3.75	4.50	\N	\N	IM2	한화정밀기계 1년	연구개발/설계
511	현대자동차	[R&D] 차량 제어 시스템 개발	\N	2022 하반기	아주대	전자공학과	3.75	\N	\N	IM	\N	한화정밀기계 (1년)	연구개발/설계
512	삼성전자	신호 및 시스템 설계	\N	2022 하반기	고려대학교	기계공학부	3.78	\N	810	im2	\N		연구개발/설계
513	삼성전자	혁신센터 사업부 신호및 시스템 설계	\N	2022 하반기	고려대학교	기계공학부	3.78	\N	810	IM2	\N	삼성전자 인턴	연구개발/설계
514	롯데grs	점포개발	\N	2022 하반기	중앙대	통계	3.89	4.50	\N	\N	\N		연구개발/설계
515	일진전기	설계	\N	2022 하반기	지거국	기계공학과	3.08	4.50	785	\N	\N		연구개발/설계
516	sk에코엔지니어링	설계	\N	2022 하반기	지거국	기계공학과	3.08	4.50	785	\N	\N		연구개발/설계
517	다우기술	개발	\N	2022 하반기	한국공학대학교	전자공학과	3.50	4.50	\N	\N	\N		연구개발/설계
518	클라썸	HRD 사업 개발 및 운영 인턴	\N	2022 하반기	서울 4년제	행정학	3.53	4.50	850	\N	\N	인턴 3개월 	연구개발/설계
519	성진글로벌	연구개발팀	\N	2022 하반기	영산대	전기전자공학	3.25	\N	\N	\N	\N	가온코리아 재직 	연구개발/설계
520	DL이앤씨	플랜트사업부 기계	\N	2022 하반기	한양대 ERICA	기계공학과	3.68	4.50	895	\N	\N		연구개발/설계
521	다우기술	서비스개발	\N	2022 하반기	경희대	식품영양학과	3.39	\N	800	\N	\N		연구개발/설계
522	DL이앤씨	플랜트	기계	2022 하반기	경기대	기계시스템공학과	3.55	4.50	900	IM3	\N		연구개발/설계
523	농심	생산관리	설비개발	2022 하반기	경기대	기계시스템공학과	3.55	4.50	900	IM3	\N		연구개발/설계
524	한화비전(구 한화테크윈)	HW	회로설계	2022 하반기	건동홍	전자전기	3.50	4.50	\N	\N	150(레벨6)		연구개발/설계
525	인바디	전자개발	\N	2022 하반기	건동홍	전자전기	3.50	4.50	\N	\N	150(레벨6)		연구개발/설계
526	심텍	연구개발	\N	2022 하반기	금오공대	정보전자전공	3.66	4.50	810	im2	\N		연구개발/설계
527	DB하이텍	양산개발	\N	2022 하반기	건동홍	전자전기	3.50	4.50	\N	\N	150		연구개발/설계
528	우리fis	IT 개발	\N	2022 하반기	국숭세단	산업공학과	3.90	\N	910	IH	\N	인턴 3회 	연구개발/설계
529	코오롱플라스틱	연구개발 MIM 부문	\N	2022 하반기	인하대	신소재공학과	3.65	4.50	\N	IH	\N		연구개발/설계
530	두산전자	생산	\N	2024 하반기	중앙대학교	화학신소재공학부	3.28	4.50	\N	IM3	\N		생산/제조
531	기아	엔지니어(생산직)	\N	2024 하반기	전남도립대	미래자동차	4.49	4.50	\N	\N	\N		생산/제조
532	현대자동차	생산	\N	2024 하반기	명지대	환경공학	3.70	\N	785	\N	IH		생산/제조
533	캐논코리아	제품	\N	2024 하반기	숭실대	전기공학부	3.41	4.50	\N	\N	140	삼우설계(1달) 	생산/제조
534	솔브레인라사	ESH 인산제품 생산	\N	2024 하반기	지거국	안전보건학과	3.43	\N	\N	\N	IL		생산/제조
535	현대케피코	생산기술 (테스트 솔루션 개발)	\N	2024 하반기	지거국	산업공학과	3.58	4.50	\N	IM2	\N	조선3사 현장실습 	생산/제조
536	LS일렉트릭	생산지원	\N	2024 하반기	지거국	산업공학과	3.58	4.50	\N	IM2	\N	현대차그룹 계열사 체험형 인턴ing 	생산/제조
537	한국타이어앤테크놀로지	Engineering-생산관리	\N	2024 하반기	지거국	산업공학과	3.58	4.50	\N	IM2	\N	현대차그룹 계열사 인턴ing 	생산/제조
538	앰코테크놀로지코리아	생산기획 (Industrial Engineering)	\N	2024 하반기	지거국	산업공학과	3.58	4.50	\N	IM2	\N	현대차그룹 계열사 인턴 4개월 	생산/제조
539	LG전자	생산기술원	기계	2024 하반기	중앙대	기계공학부	4.28	\N	\N	AL	\N	삼성전자 인턴 	생산/제조
540	기아	생산	\N	2024 하반기	지방사립대	전자과	3.69	4.50	920	\N	150	PLC 설계 인턴 	생산/제조
541	에프앤코	구매	\N	2024 하반기	중앙대	기계공학	4.13	4.50	\N	\N	120		생산/제조
542	CJ씨푸드	생산관리	\N	2024 하반기	서성한	화학	3.15	4.50	\N	IH	\N		생산/제조
543	OCI	생산 엔지니어	\N	2024 하반기	서성한	화학	3.15	4.50	\N	IH	\N		생산/제조
544	현대자동차	생산	\N	2024 하반기	지거국	메카트로닉스공학과	3.94	\N	\N	IM2	\N	학부연구생(6개월) , 현장실습(2개월) 	생산/제조
545	효성그룹	생산	\N	2024 하반기	창원대	로봇제어계측공학	3.48	\N	\N	\N	140		생산/제조
546	여천NCC	생산	\N	2024 하반기	서성한	화학	3.15	4.50	\N	IH	\N		생산/제조
547	기아	엔지니어(생산직) 전문기술인력	\N	2024 하반기	지방사립대	항공전자과	3.69	4.50	920	\N	150	자동화 제어 인턴 2개월 	생산/제조
548	샘표식품	생산공정관리	\N	2024 하반기	성균관대	화학공학	3.15	4.50	\N	\N	\N		생산/제조
549	현대자동차	자동차 생산	\N	2024 하반기	지방사립대	항공전자	3.69	4.50	920	\N	150		생산/제조
550	포스코	생산기술(포항	\N	2024 하반기	중앙대학교	소재공학과	4.08	\N	910	IH	\N	카페 아르바이트 	생산/제조
551	유한화학	생산관리팀	생산관리	2024 하반기	건국대	바이오의약학	3.79	4.50	895	IM1	\N		생산/제조
552	롯데케미칼	기초소재사업	생산관리	2024 하반기	고려대	화공생명공학과	3.55	4.50	940	IH	\N		생산/제조
553	한국타이어앤테크놀로지	생산기술	\N	2024 하반기	고려대	화공생명공학과	3.55	4.50	940	\N	\N		생산/제조
554	포스코퓨처엠	생산기술	\N	2024 하반기	고려대	화공생명공학과	3.55	4.50	940	IH	\N		생산/제조
555	삼성전자	삼성전자DS 글로벌 제조&인프라총괄 – 인프라기술(Gas	\N	2024 하반기	한양대학교 ERICA	기계공학과	3.87	4.50	\N	IH	\N		생산/제조
556	LG전자	생산기술원	기계	2024 하반기	경북대	기계공학부	3.89	4.50	\N	\N	150		생산/제조
557	현대자동차	자동차 생산	\N	2024 하반기	고졸	이과	\N	\N	\N	\N	\N	주택관리공단 인턴 5개월 	생산/제조
558	효성중공업	생산	초고압변압기설계	2024 하반기	동국대	전자전기공학	3.80	4.50	\N	AL	\N		생산/제조
559	(주)위지트	생산관리팀 사무업무	\N	2024 하반기	숭실대	산업공학	3.90	\N	\N	\N	\N	(주)브이스페이스 경력4년 	생산/제조
560	한화토탈에너지스	엔지니어_한화토탈에너지스_석유화학 생산기술 엔지니어	\N	2024 상반기	고려대	화공생명공학과	3.55	4.50	940	IH	\N		생산/제조
561	현대자동차	생산	\N	2024 상반기	전남대	화학공학부	4.05	\N	\N	\N	120		생산/제조
562	삼성전자	DX부문	생산기술연구소 기구개발	2024 상반기	인가경	기계공학과	4.19	4.50	\N	IM1	\N		생산/제조
563	효성중공업	생산기술	\N	2024 상반기	지거국	전기	3.86	\N	\N	\N	120	생산관리 3년	생산/제조
564	삼성전자DS	제조&기술담당	반도체공정기술	2024 상반기	서성한	이과	3.44	4.50	\N	IM1	\N		생산/제조
565	한미정밀화학	제조본부 품질관리	\N	2024 상반기	건국대	바이오의약학	3.79	4.50	895	IM1	\N		생산/제조
566	롯데케미칼	생산관리(합성수지)	\N	2024 상반기	고려대	화공생명공학과	3.55	4.50	940	IH	\N		생산/제조
567	기아	제조솔루션	생산기술(신차개발-광명	2024 상반기	충북대	제어로봇공학과	4.17	\N	\N	IM1	\N		생산/제조
568	현대자동차	전동화-생산기술	\N	2024 상반기	홍익대	화학공학과	4.39	4.50	905	ih	\N		생산/제조
569	삼성전자	DS부문 제조&기술담당	반도체공정기술	2024 상반기	홍익대학교	화학공학과	4.39	4.50	905	IH	\N		생산/제조
570	KIA	제조솔루션	생산기술(신차개발-광명	2024 상반기	연세대	기계공학	3.48	4.30	895	AL	\N	씨드로닉스(6개월), 넥스트랩(2개월), HD현대 로보틱스(3개월) 	생산/제조
571	현대자동차	생산	\N	2024 상반기	서울 4년제 대학	산업공학과	3.80	4.50	\N	IM1	\N		생산/제조
572	동국씨엠	생산직 인사	\N	2024 상반기	부경대학교	경영학	3.76	\N	800	\N	\N	한국토지주택공사 현장실습 2개월 	생산/제조
573	삼성전자	DS 제조&기술담당	반도체공정기술	2024 상반기	홍익대학교	화학공학과	4.39	4.50	905	Ih	\N		생산/제조
574	LIG넥스원	생산지원-생산관리	\N	2024 상반기	부산대	항공우주공학과	3.63	\N	\N	\N	140		생산/제조
575	조일알미늄	생산기능직	\N	2024 상반기	한국폴리텍대학 대구캠퍼스	신소재응용과	3.29	\N	\N	\N	\N	피플웍스 구미공장 	생산/제조
576	현대자동차	전동화-생산기술(남양연구소)	\N	2024 상반기	홍익대학교	화학공학과	4.39	4.50	905	ih	\N		생산/제조
577	현대자동차	모빌리티 기술인력(자동차 생산)	\N	2024 상반기	지방사립대	항공전자공학	3.69	4.50	920	\N	150		생산/제조
578	현대자동차	생산	\N	2024 상반기	항공대	신소재공학과	3.90	\N	\N	IH	\N		생산/제조
579	KG스틸	생산관리	\N	2024 상반기	국립대	메카트로닉스공학과	3.50	4.50	\N	IH	\N	(주)에스에프에이 PM 직무 1년 근무 	생산/제조
580	LG전자	생산기술원 R&D 기계	\N	2024 상반기	동국대학교	기계로봇에너지공학과	3.63	4.50	\N	IH	\N		생산/제조
581	현대삼호중공업	생산관리	\N	2024 상반기	지거국	신소재공학부	3.75	\N	\N	IH	\N	학부연구생 1년 6개월 	생산/제조
582	LG전자	생산기술원	\N	2024 상반기	연세대	기계공학	3.48	4.30	895	AL	\N		생산/제조
583	삼성전자	DS부문 제조&기술담당	반도체공정기술	2024 상반기	지거국	화학공학부	3.98	4.50	\N	IM1	IH(140)		생산/제조
584	포스코	생산기술직	\N	2023 하반기	명지대	환경공학	3.70	\N	785	\N	IH		생산/제조
585	현대자동차	국내생산	품질관리 (아산공장)	2023 하반기	단국대(천안)	신소재공학과	3.71	\N	\N	IM1	\N	자동차 부품사 품질관리 (10개월) 	생산/제조
586	롯데GS화학	생산관리	\N	2023 하반기	서성한	화학공학과	3.40	\N	\N	\N	140		생산/제조
587	미원상사	생산기술	\N	2023 하반기	지거국	화학공학	3.85	4.50	\N	IM1	\N		생산/제조
588	LG전자	생산기술원 - R&D인공지능	\N	2023 하반기	단국대	산업공학과	4.34	4.50	\N	IM1	\N	연구원 인턴 경험 2회 	생산/제조
589	LG전자	[생산기술원] 전기전자	\N	2023 하반기	인하대학교	정보통신공학과	3.85	4.50	\N	IH	\N	한국철도기술연구원 인턴 	생산/제조
590	한화오션	생산관리	환경안전	2023 하반기	인하대	정보통신공학과	3.70	4.50	\N	\N	130		생산/제조
591	포스코	생산기술	\N	2023 하반기	지거국	신소재공학부	3.75	\N	\N	IH	\N	학부연구생 1년 6개월 	생산/제조
592	현대스틸파이프	생산	\N	2023 하반기	지거국	신소재공학부	3.75	\N	\N	IH	\N	학부연구생 1년 6개월 	생산/제조
593	기아	생산관리(사양	\N	2023 하반기	국민대	기계공학	3.68	4.50	845	\N	150		생산/제조
594	동원그룹(동원F&B)	생산관리	\N	2023 하반기	국숭세단	산업정보시스템공학과	4.08	\N	\N	\N	140	TUV 기업 2개월 인턴 	생산/제조
595	한국단자공업	생산관리	\N	2023 하반기	국숭세단	산업정보시스템공학과	4.08	\N	\N	\N	140	티유브이라인란드코리아 인턴 경험 	생산/제조
596	한화오션	생산관리	환경안전	2023 하반기	고려대	보건환경융합과학부	3.88	4.50	940	IH	\N	대기업 인턴 	생산/제조
597	이랜드월드	글로벌 소싱(생산)	\N	2023 하반기	서성한	의류학과	4.33	4.50	960	IH	\N	기업 아르바이트 1회, 계약직 1회, 인턴 1회 	생산/제조
598	LX하우시스	생산기술	\N	2023 하반기	부산대학교	재료공학	3.78	4.50	820	\N	140	인턴 2개월 	생산/제조
599	유한화학	생산관리	\N	2023 하반기	경기권 대학교	데이터경영학과	3.06	4.50	800	\N	\N	국민연금공단 2개월 	생산/제조
600	현대모비스	생산기술 (전동화	배터리)	2023 상반기	서울과학기술대학교	MSDE (기계+산업공학)	4.08	4.50	920	AL	\N		생산/제조
601	현대자동차	생산	\N	2023 상반기	단국대	화학공학과	3.59	4.50	\N	\N	\N		생산/제조
602	LG화학	생산기술	\N	2023 상반기	지거국	공대	4.03	4.50	\N	IM2	\N		생산/제조
603	포스코	생산기술	\N	2023 상반기	서연고	화공생명공학과	3.25	4.50	\N	IM2	\N		생산/제조
604	포스코퓨처엠	생산기술	\N	2023 상반기	지거국	대졸전형	4.03	4.50	\N	IM2	\N	GS칼텍스,포스코 	생산/제조
605	보쉬전장	생산관리	\N	2023 상반기	명지대학교	산업경영공학	3.34	\N	\N	\N	\N		생산/제조
606	한화에어로스페이스	제조	\N	2023 상반기	고려대학교	기계공학부	3.78	4.50	810	im2	\N		생산/제조
607	LG에너지솔루션	생산운영	\N	2023 상반기	고려대학교	기계공학부	3.78	4.50	810	im2	\N		생산/제조
608	기아	생산관리	\N	2023 상반기	조선대	기계공학	3.53	4.50	\N	IM	\N	유압부품 제조회사 아르바이트 	생산/제조
609	현대제철	R&D(연구개발	\N	2023 상반기	서성한	기계공학부	4.09	\N	\N	IM3	\N		생산/제조
610	유라코퍼레이션	생산관리	\N	2023 상반기	지거국	경영학부	4.15	\N	965	\N	레벨 8	글로벌 인턴(U.S.) 	생산/제조
611	포스코퓨처엠(전 포스코케미칼)	생산기술직 에너지소재 제조 전기	\N	2023 상반기	금오공대(학력무관)	이과	\N	\N	\N	\N	130	경상국립대학교병원 시설기술6급 (재직중) 	생산/제조
612	농심	생산노무관리직-안양	\N	2022 하반기	SKY	보건환경융합	3.90	4.50	850	IM1	\N		생산/제조
613	한화 솔루션	첨단소재부문	생산기술	2022 하반기	부산대	재료공학부	3.75	4.50	\N	\N	150		생산/제조
614	기아	제조솔루션	\N	2022 하반기	광운대	로봇학부	3.98	4.50	925	\N	160	인턴 1회 	생산/제조
615	대한제지	생산관리	\N	2022 하반기	지거국	기계공학과	3.08	\N	785	\N	\N		생산/제조
616	현대중공업	조선해양 생산관리	\N	2022 하반기	동아대	기계과	3.64	4.50	840	\N	레벨 6		생산/제조
617	한국타이어앤테크놀로지	제조공정관리	\N	2022 하반기	동아대	기계과	3.64	4.50	840	\N	레벨 6		생산/제조
618	기아	생산	\N	2022 하반기	경기대	기계시스템공학과	3.55	4.50	900	IM3	\N		생산/제조
619	일신테크놀로지	생산기술	\N	2022 하반기	경기대	기계시스템공학과	3.55	4.50	900	IM3	\N		생산/제조
620	농심	생산관리	설비개발	2022 하반기	경기대	기계시스템공학과	3.55	4.50	900	IM3	\N		생산/제조
621	동원F&B	생산기술	\N	2022 하반기	경기대	기계시스템공학과	3.55	4.50	900	IM3	\N		생산/제조
622	롯데칠성음료	안성1공장 생산	\N	2022 하반기	경기대	기계시스템송학과	3.55	\N	900	IM3	\N		생산/제조
623	포스코	생산기술	\N	2022 하반기	인하대	신소재공학과	3.65	4.50	\N	IH	\N		생산/제조
624	기아	제조솔루션본부 금형기술	\N	2022 하반기	인하대	신소재공학과	3.65	4.50	\N	IH	\N		생산/제조
625	LG전자	생산기술원 R&D	\N	2022 하반기	인하대	신소재공학과	3.65	4.50	\N	IH	\N		생산/제조
626	경신	생산기술	\N	2022 하반기	지거국	기계공학	3.60	\N	710	\N	\N	인턴3개월 	생산/제조
627	기아	생산직	\N	2022 하반기	서성한	기계공학부	4.09	4.50	795	IM3	\N		생산/제조
628	현대제철	생산기술(압연)	\N	2022 하반기	서성한	기계공학부	4.09	4.50	795	IM3	\N		생산/제조
629	현대자동차	신차개발(툴링)-생산기술 (울산공장)	\N	2022 하반기	서성한	기계공학부	4.09	4.50	795	IM3	\N		생산/제조
630	현대위아	차량부품사업-차량부품생산기술-창원	\N	2022 하반기	서성한	기계공학부	4.09	4.50	795	IM3	\N		생산/제조
631	LG전자	생산기술원	\N	2022 하반기	서성한	기계공학부	4.09	4.50	795	IM3	\N		생산/제조
632	LG CNS	생산운영	\N	2022 하반기	국민대	기계공학과	3.39	\N	\N	\N	\N	IT 중소기업 1년미만 재직 	생산/제조
633	대원제약	생산	\N	2022 하반기	한국공학대학교	생명화학공학과	3.52	\N	780	IH	\N	2년6개월 생산경력 	생산/제조
634	빙그레	생산관리	\N	2022 상반기	동아대	기계과	3.64	4.50	840	\N	레벨6		생산/제조
635	현대트랜시스	시트 생산지원	\N	2022 상반기	동아대	기계공학과	3.64	4.50	840	\N	\N		생산/제조
636	LG전자	생산기술원	\N	2022 상반기	서성한	기계공학부	4.09	4.50	795	IM3	\N		생산/제조
637	대전광역시시설관리공단	생산판매관리기사	\N	2022 상반기	대전과기대	컴퓨터공학&그래픽과	3.32	\N	\N	\N	\N	셀바스헬스케어(정규직),바이탈에어코리아(인턴),넷플(정규직) 	생산/제조
638	삼성전자	글로벌제조&인프라총괄	\N	2022 상반기	연세대	전기전자공학과	3.80	4.30	830	\N	140		생산/제조
639	LG디스플레이	생산지원 생산infra	\N	2022 상반기	지방 사립대	전자공학	3.68	4.50	860	\N	140	없음 	생산/제조
640	현대ITC	생산정비	\N	2022 상반기	인천대학교	전자공학과	3.32	4.50	\N	\N	140		생산/제조
641	lg화학	첨단소재 it소재 생산기술	\N	2022 상반기	지방대	화공시스템	4.10	\N	150	\N	150		생산/제조
642	카스라벨	출하 및 생산지원	\N	2022 상반기	배재대	정치언론학	4.04	4.50	790	\N	\N	쿠팡풀필먼트서비스 물류직 1년, 대원로지스틱 자동차 부품관리 2년 	생산/제조
643	넥센타이어	생산관리	\N	2022 상반기	창원대	통계학,산업공학	3.99	\N	\N	IL	\N		생산/제조
644	효성	효성중공업-생산	\N	2022 상반기	홍익대	전자전기공학부	3.66	\N	\N	IH	\N		생산/제조
645	LG디스플레이	제조 공정장비	\N	2022 상반기	홍익대	전자전기공학부	3.66	\N	\N	IH	\N		생산/제조
646	와이엠레미	R&D 생산기술	\N	2022 상반기	충남대	신소재	4.20	4.50	\N	\N	120		생산/제조
647	테스	생산관리	\N	2022 상반기	충남대	신소재	4.20	4.50	\N	\N	120		생산/제조
648	동원시스템즈	생산기술	\N	2021 하반기	인천대	전기공학과	3.66	\N	\N	\N	130		생산/제조
649	sk바이오사이언스	생산	\N	2021 하반기	국숭단	이과	3.63	4.50	790	IM3	레벨6	교내 현장실습, 교내 학생회, 교내 산학협력단 이화학QC 	생산/제조
650	LG화학	생명과학사업본부 생산센터	생산기술	2021 하반기	연세대학교	생명공학	3.20	4.30	965	AL	\N		생산/제조
651	CJ제일제당	BIO사업부문 BIO생산기술(정제)	\N	2021 하반기	연세대학교	생명공학	3.20	4.30	965	AL	\N		생산/제조
652	KT&G	생산직 제조 10급	\N	2021 하반기	고졸	전기과	\N	\N	\N	\N	\N		생산/제조
653	도레이첨단소재	생산기술	\N	2021 하반기	지거국	화공	3.59	4.50	920	IH	\N	시청 인턴 	생산/제조
654	현대모비스	생산기술(모듈)	\N	2021 하반기	한국항공대	항공우주공학	3.31	4.50	790	\N	150	한국수력원자력 체험형 인턴 	생산/제조
655	LG이노텍	기판소재	\N	2021 하반기	부산대	전자공학과	3.50	\N	860	IH	\N	인턴 	생산/제조
656	LG이노텍	기판소재	\N	2021 하반기	중경외시	전자전기공학부	3.65	4.50	840	IM2	\N		생산/제조
657	성우하이텍	생산관리	\N	2021 하반기	지거국	기계공학	3.38	4.50	\N	IH	\N	LG전자 인도법인 인턴 6개월 	생산/제조
658	현대트랜시스	생산공정	\N	2021 하반기	금오공대	기계공학	3.38	4.50	\N	IH	\N	LG전자 인도법인 인턴 6개월 	생산/제조
659	팜스코	생산관리	\N	2021 하반기	창원대	통계학	3.99	\N	\N	IL	\N		생산/제조
660	동원홈푸드	생산관리	\N	2021 하반기	창원대	통계학	3.99	\N	\N	IL	\N		생산/제조
661	월드에너지	생산기술	\N	2021 하반기	명지대	환경에너지공학	3.77	\N	\N	\N	\N	오알켐 모토닉 	생산/제조
662	만도	생산기술	\N	2021 하반기	계명대	기계공학전공	4.22	4.50	\N	IH	\N	SL 기구설계 인턴 2개월 	생산/제조
663	sk이노베이션	배터리 생산기술	\N	2021 하반기	서울 중위	기계	3.75	\N	\N	IH	\N		생산/제조
664	동원건설산업	생산관리	\N	2021 상반기	아주대학교	산업공학과	3.30	\N	\N	\N	\N		생산/제조
665	LIG넥스원	[생산기술]HW	초도	2021 상반기	지거국	전자정보통신공학	3.73	\N	815	IH	\N	인턴 2번 	생산/제조
666	기아	제조원가관리 및 분석, 수익성 관리	\N	2021 상반기	중경외시	경영학부	3.50	4.50	\N	\N	140		생산/제조
947	포스코	생산기술	\N	2017 상반기	지거국	재료	3.53	\N	\N	\N	\N		생산/제조
667	오스템임플란트	생산기술	\N	2021 상반기	충남대	신소재	4.20	4.50	\N	\N	120		생산/제조
668	포스코	생산기술직	\N	2021 상반기	조선대학교	기계공학	3.70	\N	750	\N	140	연구직인턴 	생산/제조
669	포스코케미칼	생산기술	\N	2021 상반기	조선대학교	기계공학	3.70	\N	750	\N	140	연구직인턴 	생산/제조
670	영풍	생산관리	\N	2021 상반기	영남대	신소재공학부	3.59	4.50	\N	\N	130		생산/제조
671	한국야금	생산(재료)	\N	2021 상반기	영남대	신소재공학부	3.59	4.50	\N	\N	130		생산/제조
672	대한전선	생산기술	\N	2021 상반기	지거국	기계시스템	3.60	4.50	825	\N	150	현장실습 2개월 	생산/제조
673	도쿄일렉트론코리아	제조	\N	2021 상반기	지거국	기계시스템	3.60	4.50	825	\N	150	현장실습 2개월 	생산/제조
674	패커드코리아	생산기술엔지니어	\N	2021 상반기	지방대	전기공학과	3.54	\N	\N	\N	\N	한국산업인력공단 계약직 1개월 	생산/제조
675	lg화학	생산기술	\N	2021 상반기	아주대학교	화학공학	3.49	4.50	\N	\N	140		생산/제조
676	sk이노베이션	배터리 생산기술	\N	2021 상반기	아주대학교	화학공학과	3.49	4.50	\N	\N	140		생산/제조
677	성우하이텍	생산관리	\N	2021 상반기	부경대	기계공학과	3.96	4.50	810	IM2	\N		생산/제조
678	넥센	생산부문	\N	2021 상반기	부경대	기계공학과	3.96	4.50	810	IM2	\N		생산/제조
679	세아베스틸	생산	\N	2021 상반기	지거국	기계시스템	3.60	4.50	825	\N	150	현장실습 2개월 	생산/제조
680	티케이케미칼	생산관리	\N	2021 상반기	지거국	이과	3.77	4.50	\N	\N	130		생산/제조
681	용산화학(주)	생산 공정운전	\N	2021 상반기	전문대	화학공학	4.24	4.50	\N	\N	\N		생산/제조
682	롯데케미칼	생산관리	\N	2021 상반기	미네소타주립대학교	화학공학과	3.44	4.00	\N	\N	\N		생산/제조
683	코오롱플라스틱	생산기술	\N	2021 상반기	서성한	화학공학	4.02	4.50	825	\N	\N		생산/제조
684	일동제약	생산기술	\N	2021 상반기	서성한	화학공학	4.02	4.50	825	\N	\N		생산/제조
685	삼성전자	무선사업부 생산기술	\N	2021 상반기	서성한	화학공학	4.02	4.50	825	\N	\N		생산/제조
686	현대제철	생산관리(냉연)	\N	2021 상반기	경북대학교	금속신소재전공	3.51	4.50	\N	IM2	\N		생산/제조
687	포스코	생산기술직 컴퓨터	\N	2021 상반기	지방국립대	통계학+산업공학(복수전공)	3.99	4.50	\N	IL	\N		생산/제조
688	현대자동차	생산관리	\N	2021 상반기	지방국립대	통계학+산업공학(복수전공)	3.99	4.50	\N	IL	\N		생산/제조
689	건일제약	생산1팀	\N	2021 상반기	경기대학교	화학공학과	3.50	\N	\N	\N	\N		생산/제조
690	기아	광명 Autoland 생산운영부서	\N	2021 상반기	한양 에리카	기계공학과	3.30	\N	\N	AL	\N	서연이화 조지아법인 해외 현장실습 	생산/제조
691	팔도	생산관리	\N	2021 상반기	울산대학교	식품영양학과	3.93	\N	\N	\N	130		생산/제조
692	SK이노베이션	배터리 생산기술	\N	2021 상반기	서울시립대	신소재공학	3.58	4.50	\N	\N	130		생산/제조
693	SK이노베이션	생산기술	\N	2021 상반기	중앙대	화학신소재공학부	3.65	4.50	\N	IH	\N		생산/제조
694	삼성전자	ds부분 생산기술연구소	\N	2021 상반기	한서삼	컴퓨터공학과	4.44	\N	765	IM1	\N	네이버 인턴 	생산/제조
695	한온시스템	제조기술	\N	2021 상반기	고려대학교(세종)	전자및정보공학과	3.47	4.50	\N	IM2	\N	유라코퍼레이션 인턴 	생산/제조
696	현대제철	\N	\N	2020 하반기	경북대학교	금속신소재전공	3.51	4.50	\N	IM2	\N		생산/제조
697	LG이노텍	생산기술	\N	2020 하반기	인하대	전자공학과	3.83	4.50	\N	\N	150		생산/제조
698	이엔에프테크놀로지	생산운전	\N	2020 하반기	전문대졸	화학공학	4.24	4.50	\N	\N	\N		생산/제조
699	종근당바이오	생산	\N	2020 하반기	전문대졸	화학공학	4.24	4.50	\N	\N	\N		생산/제조
700	sk이노베이션	생산기술	\N	2020 하반기	서성한	화학공학	4.02	4.50	825	\N	140		생산/제조
701	한국야금	생산기술	\N	2020 하반기	영남대	신소재공학부	3.59	4.50	\N	\N	130		생산/제조
702	농심	생산품질관리	\N	2020 하반기	울산대학교	식품영양학과	3.93	\N	\N	\N	130		생산/제조
703	세원그룹	생산관리(대졸공채)	\N	2020 하반기	지거국	신소재공학	3.84	4.50	\N	IM2	\N	인턴 	생산/제조
704	희성폴리머	생산관리	\N	2020 하반기	인하대	화학공학	3.40	4.50	785	\N	130	금호석유 인턴 6개월	생산/제조
705	LG화학	생산기술	\N	2020 하반기	sky	산업공학과	3.63	4.30	\N	IH	\N	삼성전자 인턴 4개월	생산/제조
706	동아제약	#NAME?	\N	2020 하반기	영남대	기계시스템공학	3.89	4.50	810	\N	130	효성중공업 인턴 6개월 	생산/제조
707	LG화학	생산기술	\N	2020 하반기	서성한	화공	3.44	4.50	880	\N	130	한화솔루션 인턴 1개월 	생산/제조
708	대한유화	생산직 인턴	\N	2020 하반기	고졸	이과	\N	\N	885	\N	\N	석유화학기업 인턴6개월 	생산/제조
709	현대오일뱅크	공정기술&생산기획	\N	2020 하반기	경희대	화공	3.90	\N	910	\N	140		생산/제조
710	휴비스	생산관리	\N	2020 하반기	경희대	화공	3.90	\N	910	\N	140		생산/제조
711	코스모화학	생산공정관리	\N	2020 하반기	영남대	화학공학	4.05	\N	805	\N	150		생산/제조
712	포스코케미칼	생산기술직무	\N	2020 하반기	영남대	화학공학	4.05	\N	805	\N	150		생산/제조
713	현대삼호중공업	생산(신입)-생산관리	\N	2020 하반기	한양대학교	기계공학부	3.68	4.50	\N	\N	130		생산/제조
714	기아	기아자동차 생산개발부문 생산기술-차체	\N	2020 하반기	한양대학교	기계공학부	3.68	4.50	\N	\N	130		생산/제조
715	삼양그룹	생산관리	\N	2020 하반기	지거국	기계시스템공학부	3.60	4.50	825	\N	150	지니스(주) 인턴실습 2개월 	생산/제조
716	한국 콜마	생산지원	\N	2020 하반기	동국대	산업공학, 통계학	3.48	4.50	835	IH	\N		생산/제조
717	포스코	생산기술직	\N	2020 하반기	교통대	항공기계설계학과	3.90	4.50	730	\N	\N		생산/제조
718	SKC	생산관리	\N	2020 하반기	경희대	신소재공학과	3.61	4.50	940	IH	\N	학부연구생 (8개월), ULVAC 인턴 (1개월), 포스코인터내셔널 인턴 (6주)	생산/제조
719	DSR제강	생산관리	\N	2020 하반기	울산대	기계자동차공학과	3.23	4.50	880	IH	\N	베트남 해외인턴 2개월, 단기현장실습 1개월,공기업 인턴 4개월 	생산/제조
720	CJ생물자원	전기공무(생산)팀	\N	2020 하반기	서울 전문대졸	공고	3.39	\N	\N	\N	\N	중소기업 소방공사업체 3년 	생산/제조
721	부천축산농협	전기공무(생산) 기술관리직 6급	\N	2020 하반기	서울 전문대졸	공고	3.39	\N	\N	\N	\N	중소기업 소방공사업체 3년 	생산/제조
722	에스엘(주)	신입-제조-개발	\N	2020 하반기	동국대	기계시스템	3.54	4.50	830	\N	140		생산/제조
723	케이프	생산관리	\N	2020 하반기	동아대	기계공학과	4.08	4.50	880	IM1	\N	영풍정밀 정규직 10개월 근무 	생산/제조
724	현대모비스	모듈BU 생산관리	\N	2020 하반기	SKY	산업공학	3.70	4.30	\N	IH	\N	삼성전자 인턴 4개월	생산/제조
725	셀트리온제약	생산지원	\N	2020 하반기	숭실대학교	산업정보시스템공학과	3.74	\N	895	\N	150		생산/제조
726	부곡운영	반도체 공정생산	\N	2020 하반기	아주대	전자공학	3.30	\N	\N	IM2	\N	만도헬라 인턴 2개월 	생산/제조
727	LG이노텍	광학솔루션 - 생산기술	\N	2020 하반기	한양대 ERICA	기계공학과	3.78	4.50	855	\N	130	한국건설기술연구원 	생산/제조
728	롯데케미칼	생산지원환경	\N	2020 하반기	서성한	토목공학	3.67	4.50	\N	\N	150		생산/제조
729	포스코	생산기술직	\N	2020 하반기	지거국	화학공학과	3.79	\N	805	\N	\N	가스안전공사 인턴 5개월 	생산/제조
730	하이에어공조	생산관리	\N	2020 하반기	동아대	기계공학	3.51	\N	\N	\N	120		생산/제조
731	현대자동차	울산공장 차체생산기술	\N	2020 하반기	창원대	기계	3.80	4.50	845	\N	140		생산/제조
732	현대트랜시스	파워트레인 생산기술	\N	2020 하반기	서울대학교	기계공학	3.21	4.30	910	\N	150	스타트업 빅데이터분석가 인턴 3개월 	생산/제조
733	sk이노베이션	배터리 생산기술	\N	2020 하반기	서울대학ㄱ	기계공학	3.21	4.30	910	\N	150	스타트업 빅데이터분석가 인턴 3개월 	생산/제조
734	한일시멘트	생산관리	\N	2020 하반기	지방 국립대	신소재공학부	3.50	4.50	\N	\N	130	한국세라믹기술원 인턴1개월 	생산/제조
735	경신전선	생산관리(대졸공채)	\N	2020 상반기	지거국	신소재공학	3.84	4.50	\N	IM2	\N	인턴 1년 	생산/제조
736	동원시스템즈	생산관리	\N	2020 상반기	인하대	화학공학	3.40	4.50	785	\N	130	금호석유 현장실습 6개월	생산/제조
737	LG화학	생산기술	\N	2020 상반기	서성한	화학공학	3.90	4.50	870	\N	\N		생산/제조
738	한화솔루션	생산관리	\N	2020 상반기	서성한	화공	3.44	4.50	880	\N	130		생산/제조
739	LG화학	전지사업본부 생산기술	\N	2020 상반기	경희대	화공	3.90	\N	910	\N	140		생산/제조
740	동원시스템즈	생산관리	\N	2020 상반기	경희대	화공	3.90	\N	910	\N	140		생산/제조
741	네패스	반도체 생산관리	\N	2020 상반기	경희대	화공	3.90	\N	910	\N	140		생산/제조
742	Celltrion	DS생산	\N	2020 상반기	인하공전	전기과	4.14	\N	630	\N	\N		생산/제조
743	한국요꼬가와일렉트로닉스매뉴팩처링	생산기술직	\N	2020 상반기	인하공전	전기과	4.14	\N	630	\N	\N		생산/제조
744	CJ헬스케어	생산직무	\N	2020 상반기	인하공전	전기과	4.14	\N	630	\N	\N		생산/제조
745	롯데케미칼	생산지원(기계)	\N	2020 상반기	서울대학교	기계공학과	3.21	4.30	910	\N	150	스타트업 빅데이터분석가 인턴 3개월 	생산/제조
746	네패스	생산관리	\N	2020 상반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
747	스템코	제조기술	\N	2020 상반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
748	현대L&C	생산관리	\N	2020 상반기	경북대학교	학점 3.94	3.94	\N	\N	\N	\N		생산/제조
749	조광페인트	생산관리	\N	2019 하반기	금오공대	학점 3.9	3.90	\N	\N	\N	\N		생산/제조
750	한화첨단소재	생산관리	\N	2019 하반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
751	도레이첨단소재	생산기술	\N	2019 하반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
752	효성첨단소재	생산기술	\N	2019 하반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
753	SK이노베이션	배터리	생산기술	2019 하반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
754	코오롱인더스트리	생산기술	\N	2019 하반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
755	LG화학	석유화학	생산기술	2019 하반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
756	도레이첨단소재	생산기술	\N	2019 하반기	서울과학기술대학교	학점 4.02	4.02	\N	825	\N	\N		생산/제조
757	한국야금 (코오로이)	생산기술	\N	2019 하반기	영남대학교	학점 3.83	3.83	\N	870	\N	\N		생산/제조
758	현대로템	생산기술(전기 창원)	\N	2019 하반기	금오공과대학교	학점 3.04	3.04	\N	\N	\N	\N		생산/제조
759	성우하이텍	생산기술	\N	2019 하반기	동아대학교	학점 3.87	3.87	\N	890	IM2	\N		생산/제조
760	LG화학	생명과학 사업본부 생산기술	\N	2019 하반기	고려대학교	이공기타	3.64	\N	\N	IH	\N		생산/제조
761	CJ제일제당	생산엔지니어	\N	2019 하반기	지거국	화공	3.50	\N	\N	im2	\N		생산/제조
762	Sk이노베이션	배터리 생산기술	\N	2019 하반기	지거국	유기소재공학	4.02	\N	\N	Im2	\N		생산/제조
763	SK이노베이션	생산기술	\N	2019 하반기	지거국	화공	3.50	\N	\N	im2	\N		생산/제조
764	동원시스템즈	생산관리	\N	2019 하반기	수도권 4년제	화공	3.50	\N	\N	IM1	\N		생산/제조
765	포스코	생산기술	\N	2019 하반기	인서울	신소재	4.10	\N	\N	IH	\N		생산/제조
766	LG화학	전지본부 생산기술	\N	2019 하반기	한국산업기술대	에너지.전기공학과	3.30	\N	\N	\N	\N		생산/제조
767	삼성 엔지니어링	생산기술	\N	2019 상반기	전북대학교	학점 3.91	3.91	\N	\N	IH	\N		생산/제조
768	재료연구소	연구	복합재 제조	2019 상반기	아주대학교	학점 3.84	3.84	\N	855	IH	\N		생산/제조
769	롯데제과	생산 기술	\N	2019 상반기	기계공학	오픽 IH	\N	\N	\N	IH	\N		생산/제조
770	SK 이노베이션	배터리 생산기술	\N	2019 상반기	서울 중상위권	화학공학	3.80	\N	\N	\N	\N		생산/제조
771	SK이노베이션	배터리 생산기술	\N	2019 상반기	서울 상위권	화학공학	3.34	\N	940	\N	\N		생산/제조
772	한화케미칼	생산지원	\N	2019 상반기	인서울	전기공학	3.60	\N	805	\N	\N		생산/제조
773	포스코	생산기술	\N	2019 상반기	수도권 소재	환경공학	3.90	\N	\N	\N	\N		생산/제조
774	삼성전자	im 생산기술	\N	2019 상반기	수도권	항공우주공학	3.38	\N	860	\N	\N		생산/제조
775	CJ제일제당	BIO생산기술	\N	2019 상반기	해외대	Bioengineering	\N	\N	725	\N	\N		생산/제조
776	코스맥스	생산운영	\N	2019 상반기	경기권	공과대학	3.98	\N	800	\N	\N		생산/제조
777	현대자동차	생산기술설계	\N	2019 상반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
778	셀트리온	생산	\N	2019 상반기	서울	생명과학	4.00	\N	900	\N	\N		생산/제조
779	셀트리온	생산	\N	2019 상반기	서성한	화학공학	3.70	\N	\N	IH	\N		생산/제조
780	롯데알미늄	생산기술	\N	2019 상반기	서울 중위권	화학공학	3.00	\N	\N	\N	레벨6		생산/제조
781	포스코	생산기술직무	\N	2019 상반기	영남대	전기공	3.80	\N	810	\N	\N		생산/제조
782	CJ제일제당	BIO생산기술	\N	2019 상반기	지방 국립대	화공	4.05	\N	900	\N	\N		생산/제조
783	SK이노베이션	생산기술	\N	2019 상반기	지거국	화공	3.50	\N	\N	im2	\N		생산/제조
784	포스코	생산기술	\N	2019 상반기	성균관대학교	신소재공학과	3.00	\N	\N	im2	\N		생산/제조
785	CJ제일제당	BIO생산기술(발효)	\N	2019 상반기	수도권 4년제	생명공학과	3.50	\N	880	IM2	\N		생산/제조
786	현대오토에버	제조 IT	\N	2019 상반기	건동홍	기계공학	3.19	\N	\N	\N	레벨6		생산/제조
787	포스코	생산기술	\N	2019 상반기	sky	물리	3.00	\N	\N	\N	\N		생산/제조
788	현대모비스	생산기술	\N	2019 상반기	중경외시	신소재공학	4.00	\N	\N	\N	\N		생산/제조
789	롯데케미칼	생산관리	\N	2018 하반기	전북대학교	학점 3.91	3.91	\N	\N	IH	\N		생산/제조
790	현대제철	생산관리	\N	2018 하반기	전북대학교	학점 3.91	3.91	\N	\N	IH	\N		생산/제조
791	LG전자	생산기술원	\N	2018 하반기	University of Technology,sydney	기계공학	3.00	\N	\N	\N	\N		생산/제조
792	효성중공업	생산기술	\N	2018 하반기	서울중위	전기	3.45	\N	800	\N	\N		생산/제조
793	효성중공업	생산기술	\N	2018 하반기	광운대학교	전기공학과	3.20	\N	880	IM2	\N		생산/제조
794	효성중공업	생산기술	\N	2018 하반기	\N	\N	3.46	\N	\N	\N	\N		생산/제조
795	효성중공업	생산기술	\N	2018 하반기	홍익대학교	전자전기공학부	3.50	\N	\N	IM2	\N		생산/제조
796	코오롱industry	생산기술	\N	2018 하반기	재료	학점 3.6	3.60	\N	900	\N	\N		생산/제조
797	동원 F&B	생산지원	\N	2018 하반기	중경외시	생명과학	3.68	\N	890	IH	\N		생산/제조
798	SK이노베이션	생산기술,소재기술	\N	2018 하반기	지방 과기원	화학과	3.78	4.30	\N	\N	\N		생산/제조
799	삼양그룹	생산관리	\N	2018 하반기	서울 중상위권	화학공학	3.35	\N	\N	IH	\N		생산/제조
800	효성	생산기술	\N	2018 하반기	지거국	반도체	3.50	\N	\N	im2	\N		생산/제조
801	한국콜마	화장품 생산관리	\N	2018 하반기	지거국	화공	3.58	\N	720	\N	\N		생산/제조
802	한국콜마	생산	\N	2018 하반기	지방대	기계과	3.40	\N	785	\N	\N		생산/제조
803	삼성전자	DS부문 메모리사업부 생산관리	\N	2018 하반기	수도권 4년제	산업공학과	3.65	\N	\N	\N	\N		생산/제조
804	SK이노베이션	생산기술	\N	2018 하반기	인서울 상위권	화공	3.60	\N	900	IH	\N		생산/제조
805	포스코	생산기술	\N	2018 하반기	지방사립	컴퓨터공학과	3.64	4.50	915	\N	\N		생산/제조
806	포스코	생산기술	\N	2018 하반기	지거국	기계공	3.50	\N	\N	\N	\N		생산/제조
807	LG화학	재료사업 생산기술	\N	2018 하반기	지거국	화학공학부	3.58	\N	730	\N	\N		생산/제조
808	삼성중공업	생산관리	\N	2018 하반기	경상대	해양시스템공학	4.25	\N	\N	IH	\N		생산/제조
809	한화	화약	\N	2018 하반기	한경대학교	안전공학과	3.53	\N	\N	\N	\N		생산/제조
810	LG화학	생산기술	\N	2018 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
811	한화에어로스페이스	생산	\N	2018 하반기	인서울 하위권	기계	4.00	\N	\N	IM2	\N		생산/제조
812	현대모비스	제조영업	\N	2018 하반기	중경외시	어문	4.05	\N	960	al	\N		생산/제조
813	한화 화약	생산관리	\N	2018 하반기	지거국	화공	3.58	\N	730	IM1	\N		생산/제조
814	효성중공업	생산기술	\N	2018 하반기	지거국	기계공학	3.20	\N	600	\N	\N		생산/제조
815	동원 테크팩솔루션	생산기술	\N	2018 하반기	서울중위권	기계	3.00	\N	\N	\N	\N		생산/제조
816	한국 콜마	화장품 생산관리	\N	2018 하반기	한서삼	산업공학	3.70	\N	800	\N	\N		생산/제조
817	퍼시스 그룹	생산 설비관리	\N	2018 하반기	지방 사립대	기계공학	\N	\N	\N	\N	\N		생산/제조
818	CJ제일제당	생산기술	\N	2018 하반기	중앙대	화공과	3.00	\N	\N	\N	\N		생산/제조
819	효성중공업	생산기술 , 영업	\N	2018 하반기	국숭광명	전기공학	3.10	\N	815	\N	\N		생산/제조
820	코오롱인더스트리	생산기술	\N	2018 하반기	지거국	화공	3.50	\N	\N	IM2	\N		생산/제조
821	동원 F&B	생산관리	\N	2018 하반기	부경대	시스템경영공학	3.62	\N	810	\N	레벨6		생산/제조
822	포스코	생산기술	\N	2018 하반기	서울중위권	기계공학	4.00	\N	\N	IM2	\N		생산/제조
823	현대제철	생산기술	\N	2018 하반기	지방사립	신소재공학과	3.82	\N	\N	\N	레벨5		생산/제조
824	효성중공업	생산기술	\N	2018 하반기	경북대	기계공학	3.50	\N	915	\N	\N		생산/제조
825	현대제철	생산지원	\N	2018 하반기	인하	환경공학과	3.72	\N	745	IH	\N		생산/제조
826	KT&G	제조	\N	2018 하반기	부산대	항공우주공학	4.04	\N	845	\N	\N		생산/제조
827	LG화학	생명과학사업본부 생산기술	\N	2018 하반기	서강대학교	화공생명공학과	3.54	\N	\N	\N	레벨6		생산/제조
828	포스코	생산기술	\N	2018 하반기	지방사립대	전자공학과	4.01	\N	\N	IH	\N		생산/제조
829	포스코	생산기술	\N	2018 하반기	연세대학교	신소재공학과	4.10	\N	\N	IM2	\N		생산/제조
830	포스코	생산기술	\N	2018 하반기	한양대학교	학점 3.2	3.20	\N	900	\N	\N		생산/제조
831	KT&G	제조 (제조기획	\N	2018 하반기	인하대학교	산업경영공학	3.60	\N	\N	IM2	\N		생산/제조
832	효성중공업	생산기술	\N	2018 하반기	중앙대학교	전자전기	3.49	\N	\N	\N	\N		생산/제조
833	한화화약	생산관리	\N	2018 하반기	지거국	화학공학	3.50	\N	820	\N	\N		생산/제조
834	LG화학	전자정보소재 생산기술	\N	2018 하반기	수도권	신소재	3.50	\N	\N	\N	\N		생산/제조
835	CJ제일제당	생산기술	\N	2018 하반기	지거국	화학공학부	3.58	\N	730	\N	\N		생산/제조
836	포스코	생산기술-기계	\N	2018 하반기	경상대	부산대	3.64	4.13	\N	\N	\N		생산/제조
837	기아	생산기술	\N	2018 하반기	지방사립대	기계공학과	3.99	\N	\N	AL	\N		생산/제조
838	현대모비스	생산기술	\N	2018 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
839	LG전자	생산기술	\N	2018 하반기	경희대	기계공학과	3.13	\N	\N	IM1	\N		생산/제조
840	현대모비스	제조영업	\N	2018 하반기	지방 국립대	신문방송학과	3.70	\N	\N	AL	\N		생산/제조
841	LG이노텍	전장사업 생산관리	\N	2018 하반기	경희대학교	전자공학과	3.95	\N	\N	IL	\N		생산/제조
842	한화 에어로스페이스	생산기술	\N	2018 하반기	경북대	기계공학	3.50	\N	915	\N	\N		생산/제조
843	한화토탈	생산지원	\N	2018 하반기	아주대학교	기계공학	3.54	\N	\N	IM1	\N		생산/제조
844	효성화학	생산기술	\N	2018 하반기	고려대	치기공	3.82	\N	835	\N	lv6		생산/제조
845	한국콜마	생산관리	\N	2018 하반기	\N	\N	3.60	\N	840	IM2	\N		생산/제조
846	포스코	생산기술	\N	2018 하반기	지방사립	기계	3.13	\N	850	ih	\N		생산/제조
847	LG화학	기초소재사업본부 생산기술	\N	2018 하반기	지방사립	제어계측공학	4.08	\N	\N	\N	레벨 7 (160)		생산/제조
848	한화	화약	\N	2018 하반기	서성한	화학	3.79	\N	875	\N	\N		생산/제조
849	효성중공업	생산기술	\N	2018 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
850	SK실트론	생산관리	\N	2018 하반기	과기원	화학공학과	3.23	\N	\N	IM2	\N		생산/제조
851	LG전자	소재	\N	2018 하반기	중상위	전기공학	3.30	\N	\N	\N	\N		생산/제조
852	LG전자	소재	\N	2018 상반기	동국대학교	학점 3.65	3.65	\N	890	IH	\N		생산/제조
853	삼양그룹	바이오 생산관리	\N	2018 상반기	경북대	학점 4.0	4.00	4.30	945	\N	\N		생산/제조
854	CJ제일제당	생산기술	\N	2018 상반기	전남대	화공	3.00	\N	730	im1	\N		생산/제조
855	CJ제일제당	생산기술	\N	2018 상반기	서울4년제	기계공학	3.50	\N	\N	\N	\N		생산/제조
856	셀트리온	생산기술	\N	2018 상반기	경희대	신소재공학과	4.17	\N	955	\N	\N		생산/제조
857	SK이노베이션	에너지	엔지니어(생산기술)	2018 상반기	인서울	화공	3.44	\N	895	\N	\N		생산/제조
858	셀트리온	생산기술	\N	2018 상반기	서울권	화공	3.44	\N	895	\N	\N		생산/제조
859	LG 이노텍	생산기술	\N	2018 상반기	지방4년제	소재	3.64	\N	\N	\N	\N		생산/제조
860	LG이노텍	생산기술	\N	2018 상반기	경희대학교	전자전파공학과	3.36	\N	840	\N	\N		생산/제조
861	롯데케미칼	생산관리	\N	2018 상반기	경희대학교	신소재공학과	4.17	\N	955	\N	\N		생산/제조
862	LG전자	생산기술원	\N	2018 상반기	서울하위권	기계	3.80	\N	805	\N	\N		생산/제조
863	삼성전자	생산관리	\N	2018 상반기	경희	산업경영공학	3.55	\N	905	\N	\N		생산/제조
864	CJ제일제당	생산	\N	2018 상반기	화학공학	학점 3.85	3.85	\N	\N	\N	\N		생산/제조
865	셀트리온	생산기획	\N	2018 상반기	해외대	scm	\N	\N	\N	\N	\N		생산/제조
866	LG전자	소재	\N	2018 상반기	SKY	화학공학	4.10	\N	910	IM3	\N		생산/제조
867	롯데케미칼	생산관리	\N	2018 상반기	수도권	화학	3.00	\N	800	\N	\N		생산/제조
868	LG화학	전지 생산기술	\N	2018 상반기	지거국 공대	신소재	4.30	\N	\N	\N	\N		생산/제조
869	LG화학	생산기술	\N	2018 상반기	인하	아주	3.60	\N	860	\N	\N		생산/제조
870	LG화학	생산기술	\N	2018 상반기	인하	아주	3.60	\N	860	\N	\N		생산/제조
871	삼성SDI	제조기술	\N	2018 상반기	부산대학교	유기소재시스템공학	3.31	\N	825	IM2	\N		생산/제조
872	삼성전자	생산관리	\N	2018 상반기	성균관대학교	산업공학과	3.71	\N	\N	IM	\N		생산/제조
873	한화	생산관리	\N	2018 상반기	수도권 4년제	기계과	3.33	\N	\N	IL	\N		생산/제조
874	skc	생산관리	\N	2018 상반기	sky	화학	2.49	\N	950	\N	\N		생산/제조
875	롯데제과	생산관리	\N	2018 상반기	\N	\N	3.58	\N	845	\N	\N		생산/제조
876	롯데제과	생산관리	\N	2018 상반기	서성한	생명과학	3.89	4.50	\N	\N	\N		생산/제조
877	롯데케미칼	생산관리	\N	2018 상반기	지방국립대	화공	3.60	\N	\N	\N	\N		생산/제조
878	롯데케미칼	생산관리	\N	2018 상반기	화학공학과	학점 4	4.00	\N	865	\N	\N		생산/제조
879	롯데케미칼	생산지원	\N	2018 상반기	지방사립	기계공	3.00	\N	\N	IH	\N		생산/제조
880	롯데케미칼	생산관리	\N	2018 상반기	인서울	화공	3.40	\N	\N	\N	\N		생산/제조
881	삼성전자	생산관리	\N	2018 상반기	지방대	공대	3.53	\N	910	\N	\N		생산/제조
882	포스코	생산기술	\N	2018 상반기	국립대	기계(조선)	3.80	\N	\N	IH	\N		생산/제조
883	롯데케미칼	생산관리	\N	2018 상반기	중상위권	화공계열	3.00	\N	880	\N	\N		생산/제조
884	삼양	생산관리	\N	2018 상반기	중경외시	전자공학	3.80	\N	880	\N	\N		생산/제조
885	LG화학	생산기술(전지사업본부)	\N	2018 상반기	지방거점국립대	재료공학과	4.30	\N	\N	\N	\N		생산/제조
886	한화케미칼	엔지니어 생산관리	\N	2018 상반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
887	파리크라상	생산관리	\N	2018 상반기	서울 중위권	산업공학	3.51	\N	\N	\N	레벨5		생산/제조
888	LG화학	생산기술	\N	2018 상반기	지방국립	화학공학	4.19	\N	760	\N	레벨6		생산/제조
889	LG화학	전지사업본부 생산기술	\N	2018 상반기	국숭세단	기계	3.74	\N	880	\N	140		생산/제조
890	삼성전자	LED사업부	\N	2018 상반기	경희대	전자공학과	3.40	\N	800	\N	\N		생산/제조
891	CJ제일제당	생산기술	\N	2018 상반기	서울 중하위	화학공학	3.57	\N	\N	\N	\N		생산/제조
892	LG화학	생산기술	\N	2018 상반기	한국기술교육대학교	기계공학	3.55	\N	\N	\N	\N		생산/제조
893	LG화학	생산기술	\N	2018 상반기	지방사립	화공	3.28	\N	875	\N	\N		생산/제조
894	LG화학	기초소재사업본부 생산기술	\N	2018 상반기	수도권	응용화학	3.50	\N	\N	IH	\N		생산/제조
895	기아	생산운영	\N	2018 상반기	부산대	기계공학	3.43	\N	855	\N	\N		생산/제조
896	롯데칠성음료	생산지원	\N	2018 상반기	중경외시	환경공학과	4.00	\N	830	\N	\N		생산/제조
897	CJ제일제당	생산기술	\N	2018 상반기	서울 중위권	화학공학	3.54	\N	\N	IM2	\N		생산/제조
898	현대자동차	생산	\N	2018 상반기	서울 중위권	전기공학	3.70	\N	800	\N	\N		생산/제조
899	CJ제일제당	생산기술	\N	2018 상반기	지방 사립	화학공학과	3.64	\N	800	\N	\N		생산/제조
900	삼성전자	CE	\N	2018 상반기	지거국	신소재공학과	3.20	\N	\N	\N	110		생산/제조
901	LG전자	소재	\N	2018 상반기	지방사립대	산업공학과	3.84	\N	\N	\N	레벨 6		생산/제조
902	LG화학	생산기술	\N	2018 상반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
903	LG화학	생산기술	\N	2018 상반기	\N	\N	3.60	\N	860	\N	\N		생산/제조
904	LG화학	생산기술	\N	2018 상반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
905	LG화학	재료사업부	\N	2018 상반기	국숭세단	신소재공학과	4.03	\N	\N	\N	레벨 6		생산/제조
906	롯데칠성음료	생산관리	\N	2017 하반기	서성한	기계	3.63	\N	865	\N	\N		생산/제조
907	롯데케미칼	생산지원	\N	2017 하반기	인서울	기계	3.00	\N	800	\N	\N		생산/제조
908	롯데 첨단소재	생산관리	\N	2017 하반기	서성한	생명공학	3.66	\N	925	\N	\N		생산/제조
909	롯데케미칼	생산관리	\N	2017 하반기	sky	화공	3.50	\N	890	\N	\N		생산/제조
910	기아	생산기술	\N	2017 하반기	중앙	기계공	4.14	\N	820	\N	\N		생산/제조
911	롯데 첨단소재	생산관리	\N	2017 하반기	지거국	화학공학	3.89	\N	850	\N	\N		생산/제조
912	CJ제일제당	생산기술	\N	2017 하반기	지거국	화공	3.89	\N	850	\N	\N		생산/제조
913	LG이노텍	제조	\N	2017 하반기	영남대학교	전자공학	3.24	\N	650	\N	\N		생산/제조
914	CJ제일제당	생산관리	\N	2017 하반기	sky	화학공학	3.50	\N	890	\N	\N		생산/제조
915	롯데	생산관리	\N	2017 하반기	지거국	식품공학	3.40	\N	\N	\N	\N		생산/제조
916	LG전자	소재생산기술원 HW	\N	2017 하반기	부산대	전자공학	4.19	\N	\N	IM1	\N		생산/제조
917	LG화학	기초소재 생산기술	\N	2017 하반기	SKY	화학공학	3.44	\N	930	AL	\N		생산/제조
918	LG이노텍	생산기술	\N	2017 하반기	지방국립대	조선해양공학과	3.65	\N	875	\N	\N		생산/제조
919	SK 이노베이션	배터리 생산기술	\N	2017 하반기	수도권 사립대	화학공학과	4.11	\N	760	IM2	\N		생산/제조
920	CJ푸드빌	생산기술	\N	2017 하반기	명지대학교	산업경영공학, 식품영양학 복수전공	3.44	\N	\N	\N	\N		생산/제조
921	LG전자	소재	\N	2017 하반기	중경외시	나노소재	3.09	\N	\N	\N	\N		생산/제조
922	LG화학	생산기술	\N	2017 하반기	국립대	화학공학	3.69	4.30	\N	\N	\N		생산/제조
923	롯데푸드	생산관리	\N	2017 하반기	수도권	식품공학과	3.50	\N	855	IH	\N		생산/제조
924	현대위아	품질	\N	2017 하반기	\N	\N	3.45	\N	\N	IH	\N		생산/제조
925	롯데케미칼	생산관리	\N	2017 하반기	수도권	화학공학과	3.40	\N	\N	AL	\N		생산/제조
926	현대제철	생산지원	\N	2017 하반기	건국대	환경과학	3.37	\N	815	\N	\N		생산/제조
927	LG디스플레이	생산&공정	\N	2017 하반기	한양대	기계공학과	4.44	\N	865	\N	\N		생산/제조
928	CJ제일제당	생산기술	\N	2017 하반기	수도권 대학	화학공학과	3.30	\N	800	\N	레벨 6		생산/제조
929	현대파워텍	생산기술	\N	2017 하반기	서울 중상위권 대학	기계공학과	3.70	\N	\N	\N	레벨 6		생산/제조
930	CJ제일제당	생산기술	\N	2017 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
931	LG화학	생명과학사업부 생산기술	\N	2017 하반기	서성한	생명공학과	3.66	\N	925	\N	\N		생산/제조
932	S-OIL	생산직(기계)	\N	2017 상반기	거제대학교	조선해양공학과	4.42	\N	900	IM1	\N		생산/제조
933	LG디스플레이	생산기술	\N	2017 상반기	경희대	화학공학과	3.67	\N	\N	IM2	\N		생산/제조
934	금호타이어	생산관리	\N	2017 상반기	부산대	기계	4.00	\N	845	\N	\N		생산/제조
935	LG전자	소재	\N	2017 상반기	한양대학교	화학공학과	4.12	\N	\N	\N	\N		생산/제조
936	기아	생산운영	\N	2017 상반기	지거국	기계공학	3.68	\N	875	IH	\N		생산/제조
937	SK이노베이션	에너지 생산기술	\N	2017 상반기	건동홍	화공	3.88	\N	890	\N	\N		생산/제조
938	LG디스플레이	생산관리	\N	2017 상반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
939	LG전자	H&A, HE, 생산소재	\N	2017 상반기	서성한	컴퓨터공학	\N	\N	\N	\N	\N		생산/제조
940	기아	생산기술	\N	2017 상반기	부산대	기계	4.00	\N	845	\N	\N		생산/제조
941	기아	생산운영	\N	2017 상반기	수도권	기계공학	3.35	\N	830	\N	\N		생산/제조
942	기아	생산운영, 품질	\N	2017 상반기	수도권 4년제	경영	3.44	\N	955	\N	\N		생산/제조
943	기아	생산운영	\N	2017 상반기	지거국	전자	3.40	\N	\N	\N	\N		생산/제조
944	기아	생산운영	\N	2017 상반기	지거국	기계	3.68	\N	875	\N	\N		생산/제조
945	SK하이닉스	생산관리	\N	2017 상반기	서울 중상위	물리학과	4.20	\N	\N	IL	\N		생산/제조
946	기아	생산운영	\N	2017 상반기	수도권 4년제	기계공학과	3.90	\N	930	\N	\N		생산/제조
948	현대제철	생산관리	\N	2017 상반기	지거국	전기공학	3.30	\N	770	\N	레벨6		생산/제조
949	포스코	생산기술	\N	2017 상반기	해외대	산업공학	3.00	\N	\N	\N	레벨6		생산/제조
950	현대모비스	제조지원 - 경영지원	\N	2017 상반기	SKY	경제학과	3.67	\N	980	\N	레벨7		생산/제조
951	POSCO	생산기술	\N	2017 상반기	거제대학교	조선해양공학과	4.42	\N	900	IM1	레벨6(130)		생산/제조
952	기아	생산운영	\N	2017 상반기	지거국	화공	3.29	\N	\N	\N	\N		생산/제조
953	기아	생산운영, 품질	\N	2017 상반기	경희대학교	기계공학과, 경영학과	3.96	\N	865	IH	\N		생산/제조
954	기아	생산운영	\N	2017 상반기	서울4년제	산업공학	3.75	\N	910	\N	\N		생산/제조
955	기아	생산운영	\N	2017 상반기	부산대	전자공학	3.50	\N	870	\N	\N		생산/제조
956	샘표식품	생산	\N	2017 상반기	인턴 1회	\N	\N	\N	\N	\N	\N		생산/제조
957	기아	생산기술	\N	2017 상반기	중경외시	화학공학	3.60	\N	785	\N	레벨 140		생산/제조
958	기아	생산운영	\N	2017 상반기	중경외시	전자	\N	\N	\N	\N	\N		생산/제조
959	LG실트론	생산	\N	2017 상반기	인하대	화공과	3.59	\N	850	\N	\N		생산/제조
960	LG전자	생산기술원	\N	2017 상반기	신소재공학과	토익 940	\N	\N	940	\N	\N		생산/제조
961	LG화학	생산기술	\N	2017 상반기	서성한	화공생명공학	3.67	\N	\N	IM2	\N		생산/제조
962	LG화학	생산기술	\N	2017 상반기	지거국	화학공학과	3.80	\N	870	\N	\N		생산/제조
963	현대다이모스	생산관리	\N	2017 상반기	지거국	기계	3.50	\N	860	\N	\N		생산/제조
964	LG이노텍	생산기술	\N	2017 상반기	중경외시	기계공학과	3.35	\N	750	\N	\N		생산/제조
965	기아	생산운영	\N	2017 상반기	수도권 중위	화학공학과	4.30	\N	925	\N	\N		생산/제조
966	SK	생산운영	\N	2017 상반기	서울 4년제	기계공학	3.60	\N	\N	\N	\N		생산/제조
967	금호타이어	생산기술	\N	2017 상반기	수도권	기계	3.40	\N	800	\N	\N		생산/제조
968	롯데 주류	생산관리	\N	2017 상반기	지거국	식품공학	3.80	\N	810	\N	\N		생산/제조
969	현대다이모스	P	\N	2017 상반기	서성한	기계공학부	3.63	\N	\N	\N	\N		생산/제조
970	SK이노베이션	생산기술	\N	2017 상반기	서성한	화학공학과	3.84	\N	915	\N	\N		생산/제조
971	삼성전자	생산관리	\N	2017 상반기	경상대	생명화학공학	3.70	\N	\N	\N	\N		생산/제조
972	기아	생산운영	\N	2017 상반기	인하대	고분자공학	3.99	\N	825	\N	\N		생산/제조
973	LG화학	생산기술	\N	2017 상반기	서성한	산업공학	3.06	\N	910	\N	\N		생산/제조
974	기아	생산기술	\N	2017 상반기	지방 국립	전자	3.48	\N	\N	\N	\N		생산/제조
975	CJ제일제당	생산기술	\N	2017 상반기	인천소재	생명공학	3.87	\N	\N	im1	\N		생산/제조
976	SK텔레콤	제조전략	\N	2017 상반기	고려대학교	산업경영공학과	3.68	\N	740	\N	\N		생산/제조
977	기아	생산운영	\N	2017 상반기	수도권 4년제	전자공학과	3.50	\N	\N	IM1	\N		생산/제조
978	CJ제일제당	생산기술	\N	2017 상반기	서성한	화공생명공학	2.90	\N	\N	IM2	\N		생산/제조
979	기아	생산운영	\N	2017 상반기	인하대	산업공학	3.70	\N	710	\N	\N		생산/제조
980	삼성전자	생산기술연구소	\N	2017 상반기	홍익대학교(서울캠퍼스)	전자전기공학부	3.55	\N	815	\N	\N		생산/제조
981	LG화학	생산기술	\N	2017 상반기	아주대	화학과	3.69	\N	\N	\N	\N		생산/제조
982	삼성디스플레이	생산설비	\N	2017 상반기	과학기술원	화학공학과	3.50	\N	875	\N	\N		생산/제조
983	현대제철	생산지원	\N	2017 상반기	해외대	화학공학	3.00	\N	975	\N	\N		생산/제조
984	LG화학	전지 생산기술	\N	2017 상반기	지방 국립대	기계	3.70	\N	880	\N	\N		생산/제조
985	현대제철	생산지원	\N	2017 상반기	해외대	화학공학과	3.00	\N	975	\N	\N		생산/제조
986	LG하우시스	생산기술	\N	2017 상반기	지거국	화학공학	3.70	\N	\N	\N	\N		생산/제조
987	기아	생산운영	\N	2017 상반기	중경외시	산업공학	3.51	\N	\N	IM3	\N		생산/제조
988	기아	생산운영	\N	2017 상반기	서울 중하위권	산업공학과	3.90	\N	840	\N	\N		생산/제조
989	기아	생산운영	\N	2017 상반기	중경외시	기계공학과	3.40	\N	915	\N	레벨 6		생산/제조
990	SKC	생산	\N	2017 상반기	인서울4년제	기계공학과	3.00	\N	\N	\N	레벨 5		생산/제조
991	삼성전자	생산관리	\N	2017 상반기	서성한	산업공학과	3.40	\N	\N	\N	레벨 6		생산/제조
992	삼성전자	생산관리	\N	2017 상반기	동국대	산업시스템공학과	3.94	\N	\N	\N	\N		생산/제조
993	KCC	생산	\N	2017 상반기	중경외시	신소재공학과	3.40	\N	815	\N	\N		생산/제조
994	LG이노텍	제조	\N	2017 상반기	경북대학교	전자공학부	3.35	\N	\N	\N	레벨 6(140)		생산/제조
995	CJ제일제당	생산기술	\N	2017 상반기	인천소재	생명공학	3.87	\N	\N	im1	\N		생산/제조
996	삼양사	생산관리	\N	2017 상반기	지거국	기계시스템	3.49	\N	820	\N	130		생산/제조
997	롯데상사	생산관리	\N	2017 상반기	지방사립대	식품공학과	3.43	\N	\N	IM2	6		생산/제조
998	KCC	생산관리-유기생산	\N	2017 상반기	수도권4년제	화학공학과	3.43	3.50	855	\N	\N		생산/제조
999	효성	생산기술	\N	2016 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
1000	현대위아	생산기술	\N	2016 하반기	지거국	전기	4.00	\N	800	\N	\N		생산/제조
1001	효성	생산기술	\N	2016 하반기	전북대학교	기계공학과	3.89	\N	790	\N	\N		생산/제조
1002	현대모비스	생산	\N	2016 하반기	지거국	기계	3.55	\N	770	\N	\N		생산/제조
1003	LG전자	생산기술원	\N	2016 하반기	지방사립	신소재	4.28	\N	895	\N	\N		생산/제조
1004	동원F&B	생산기술	\N	2016 하반기	충남대학교	전기공학과	4.05	\N	\N	\N	\N		생산/제조
1005	LG화학	생산기술	\N	2016 하반기	서울상위권	화학공학과	3.36	\N	890	\N	\N		생산/제조
1006	기아	생산기술	\N	2016 하반기	부산대학교	기계공학부	4.11	\N	810	\N	\N		생산/제조
1007	현대파워텍	연구개발, 생산공정	\N	2016 하반기	한양대학교에리카	기계공학과	3.40	\N	605	\N	\N		생산/제조
1008	아모레퍼시픽	생산관리	\N	2016 하반기	한양대	생명과학	4.06	\N	870	\N	\N		생산/제조
1009	금호타이어	생산관리	\N	2016 하반기	항공대학교	항공우주기계공학	3.80	\N	870	\N	\N		생산/제조
1010	현대다이모스	생산관리	\N	2016 하반기	지거국	기계	3.80	\N	\N	\N	\N		생산/제조
1011	LG 하우시스	생산관리	\N	2016 하반기	지거국	재료공학	3.56	\N	800	\N	\N		생산/제조
1012	삼성전자	생산기술연구소	\N	2016 하반기	지방대	기계공학과	3.73	\N	815	\N	\N		생산/제조
1013	삼성전자	메모리사업부(생산관리)	\N	2016 하반기	경기권 대학교	산업경영공학과	3.70	\N	\N	\N	\N		생산/제조
1014	LG화학	기초사업부 생산기술직	\N	2016 하반기	서울 중위권	화공생물공학과	4.11	\N	835	\N	\N		생산/제조
1015	현대파워텍	생산기술	\N	2016 하반기	서성한	신소재	3.21	\N	\N	\N	\N		생산/제조
1016	금호아시아나 타이어	생산	\N	2016 하반기	국숭세단	기계	4.00	\N	830	\N	\N		생산/제조
1017	현대제철	생산관리	\N	2016 하반기	지방대	기계공학과	4.00	\N	810	\N	\N		생산/제조
1018	CJ제일제당	생산	\N	2016 하반기	화학공학	학점 3.6	3.60	\N	850	\N	\N		생산/제조
1019	현대제철	생산관리	\N	2016 하반기	지거국	재료	4.00	\N	900	\N	\N		생산/제조
1020	현대자동차	생산기술	\N	2016 하반기	기계	학점 3.47	3.47	\N	845	\N	\N		생산/제조
1021	LG생활건강	생산	\N	2016 하반기	\N	\N	3.90	\N	\N	\N	\N		생산/제조
1022	신세계 푸드	생산관리	\N	2016 하반기	한양대학교	생명과	4.06	\N	870	\N	\N		생산/제조
1023	동원 F&B	생산관리	\N	2016 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
1024	LG생활건강	생산관리	\N	2016 하반기	지거국	기계공	\N	\N	\N	\N	\N		생산/제조
1025	GS칼텍스	생산관리	\N	2016 하반기	연세대	화학공학	3.80	\N	925	\N	\N		생산/제조
1026	현대 파워텍	생산기술	\N	2016 하반기	성균관	시스템경영공학	3.06	\N	870	\N	\N		생산/제조
1027	S-OIL	생산기술	\N	2016 하반기	지거국	화학	4.00	\N	770	\N	\N		생산/제조
1028	포스코	생산기술	\N	2016 하반기	지방 국립대	기계공	4.00	\N	850	\N	\N		생산/제조
1029	금호타이어	생산관리	\N	2016 하반기	서울중위권	전기	3.11	\N	900	\N	\N		생산/제조
1030	현대제철	생산관리	\N	2016 하반기	인하대	산업공학	3.80	\N	750	\N	\N		생산/제조
1031	LG화학	생산기술	\N	2016 하반기	수도권	신소재	4.22	\N	\N	\N	레벨7		생산/제조
1032	효성	산업자재	\N	2016 하반기	지방국립	화학공학	4.10	\N	855	IH	\N		생산/제조
1033	더페이스샵	생산관리	\N	2016 하반기	서성한	화학공학	3.24	\N	950	\N	\N		생산/제조
1034	한화케미칼	생산관리	\N	2016 하반기	전남대	화학공학	3.73	\N	740	\N	레벨6		생산/제조
1035	효성중공업pg	생산기술	\N	2016 하반기	지거국	전기공학	4.00	\N	800	\N	레벨5		생산/제조
1036	삼성전자	생산관리	\N	2016 하반기	국숭세단	산업공학	3.80	\N	800	\N	\N		생산/제조
1037	에쓰오일	생산기술	\N	2016 하반기	지거국	학점 4점대	4.00	\N	\N	\N	레벨6		생산/제조
1038	현대 다이모스	생산 기술	\N	2016 하반기	지방사립	기계공	3.59	\N	860	\N	레벨6		생산/제조
1039	현대위아	생산	\N	2016 하반기	수도권 하위	기계공학	3.90	\N	820	\N	\N		생산/제조
1040	LG하우시스	생산기술	\N	2016 하반기	서울상위권	환경재료	3.50	\N	\N	\N	\N		생산/제조
1041	SK케미칼	생산기술	\N	2016 하반기	지방대	미생물생명공학	3.47	\N	745	\N	\N		생산/제조
1042	현대제철	생산관리	\N	2016 하반기	서울	기계	3.70	\N	\N	\N	\N		생산/제조
1043	sk 케미칼	생산관리	\N	2016 하반기	울산 4년제	생명공학	3.00	\N	870	\N	\N		생산/제조
1044	코오롱	생산관리	\N	2016 하반기	\N	\N	4.26	\N	850	\N	\N		생산/제조
1045	LG전자	생산기술원 R&D 기구	\N	2016 하반기	지방국립대	기계	3.30	\N	\N	\N	레벨6		생산/제조
1046	코오롱 인더스트리	생산	\N	2016 하반기	지거국	화학공학	4.07	\N	810	\N	120		생산/제조
1047	효성 노틸러스	생산기술	\N	2016 하반기	SKY	전기전자	\N	\N	\N	\N	\N		생산/제조
1048	LG생활건강	생산스탭	\N	2016 하반기	중앙대	전자전기	3.69	\N	855	\N	\N		생산/제조
1049	LG전자	생산기술원	\N	2016 하반기	지거국	기계	3.80	\N	\N	\N	130		생산/제조
1050	금호타이어	생산기술	\N	2016 하반기	연고대	기계공	3.75	\N	875	\N	\N		생산/제조
1051	LG디스플레이	생산관리	\N	2016 하반기	동국	전자전기공학부	3.56	\N	\N	IH	\N		생산/제조
1052	기아	생산기술	\N	2016 하반기	지방거점 국립대	전자기계공학부	3.71	\N	\N	\N	\N		생산/제조
1053	LG화학	전지사업 생산관리	\N	2016 하반기	지거국	전기	4.00	\N	840	\N	\N		생산/제조
1054	기아	생산(공장)	\N	2016 하반기	수도권4년제	전기공학	3.92	\N	\N	\N	\N		생산/제조
1055	삼성전자	생산기술연구소	\N	2016 하반기	서울 상위권	기계공	3.70	\N	\N	\N	\N		생산/제조
1056	LG하우시스	생산기술	\N	2016 하반기	수도권 사립	화학공학	4.10	\N	\N	\N	\N		생산/제조
1057	동원 에프앤비	생산관리	\N	2016 하반기	지방 4년제	식품공학과	3.53	\N	760	\N	\N		생산/제조
1058	금호아시아나	생산관리	\N	2016 하반기	전북대학교	기계	3.80	\N	785	\N	\N		생산/제조
1059	효성	생산	\N	2016 하반기	서울 상위권	재료	3.20	\N	\N	\N	\N		생산/제조
1060	효성 화학	생산기술	\N	2016 하반기	서울 중위권	전기공학	3.50	\N	\N	\N	\N		생산/제조
1061	기아	생산관리	\N	2016 하반기	중경외시	화학과	3.90	\N	\N	\N	\N		생산/제조
1062	현대제철	생산관리	\N	2016 하반기	건동홍	신소재공학	3.98	\N	815	\N	\N		생산/제조
1063	현대제철	생산관리	\N	2016 하반기	\N	\N	3.60	\N	900	\N	\N		생산/제조
1064	현대제철	생산관리	\N	2016 하반기	건대	기계	3.03	\N	830	\N	\N		생산/제조
1065	LG하우시스	생산기술	\N	2016 하반기	경북대학교	고분자 공학과	3.72	\N	865	\N	\N		생산/제조
1066	현대제철	생산관리(전기)	\N	2016 하반기	수도권 중하위	전기공학	3.60	\N	\N	\N	\N		생산/제조
1067	기아	생산기술	\N	2016 하반기	부산대	기계공	3.90	\N	815	\N	\N		생산/제조
1068	효성	섬유 생산기술	\N	2016 하반기	한양대학교	유기나노공학과	3.59	\N	\N	\N	\N		생산/제조
1069	LG 실트론	생산공정	\N	2016 하반기	지거국	자연계열	3.21	\N	\N	\N	\N		생산/제조
1070	한화토탈	생산기술	\N	2016 하반기	지거국	화학공학과	3.60	4.50	\N	\N	\N		생산/제조
1071	LG생활건강	생산관리	\N	2016 하반기	서성한	화공	3.37	\N	855	\N	\N		생산/제조
1072	LG디스플레이	생산	\N	2016 하반기	경북대	금속신소재	4.10	\N	830	\N	\N		생산/제조
1073	LG이노텍	생산관리	\N	2016 하반기	건동홍	전자전기	3.30	\N	915	\N	\N		생산/제조
1074	삼성디스플레이	생산관리	\N	2016 하반기	단국대학교	화학공학과	4.12	\N	895	\N	\N		생산/제조
1075	LG디스플레이	생산관리	\N	2016 하반기	홍익대	전자전기	3.82	\N	820	\N	\N		생산/제조
1076	현대제철	생산관리	\N	2016 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
1077	LG실트론	생산공정기술	\N	2016 하반기	성균관대학교	화학공학	3.61	\N	875	\N	\N		생산/제조
1078	LG화학	생산관리	\N	2016 하반기	화학공학	학점 3.41	3.41	4.50	\N	\N	\N		생산/제조
1079	기아	생산기술	\N	2016 하반기	중경외시	전자	3.44	\N	760	\N	\N		생산/제조
1080	기아	생산기술	\N	2016 하반기	수도권 4년제	재료과	4.20	\N	800	\N	\N		생산/제조
1081	삼성전자	생산관리	\N	2016 하반기	건동홍	산업공학과	3.94	\N	\N	\N	\N		생산/제조
1082	효성그룹	생산기술	\N	2016 하반기	서울 중하위	기계	4.80	\N	800	\N	\N		생산/제조
1083	효성	섬유- 생산관리	\N	2016 하반기	수도권	화공	3.30	\N	\N	\N	\N		생산/제조
1084	LG하우시스	생산기술	\N	2016 하반기	건동홍	화학공학과	3.63	\N	860	\N	\N		생산/제조
1085	현대위아	생산관리	\N	2016 하반기	지방국립대	제어계측	3.82	\N	940	\N	\N		생산/제조
1086	효성	생산기술	\N	2016 하반기	성균관대학교	화학공학	3.61	\N	875	\N	\N		생산/제조
1087	코오롱글로텍	생산품질	\N	2016 하반기	경기 4년제	신소재	3.80	\N	800	\N	\N		생산/제조
1088	CJ제일제당	생산기술	\N	2016 하반기	지거국	화공	\N	\N	\N	\N	\N		생산/제조
1089	LG화학	재료 생산기술	\N	2016 하반기	수도권	신소재	4.22	\N	\N	\N	\N		생산/제조
1090	효성중공업	생산기술	\N	2016 하반기	지거국	기계	3.80	\N	790	\N	\N		생산/제조
1091	삼성디스플레이	생산	\N	2016 하반기	지방국립	기계	4.06	\N	\N	\N	\N		생산/제조
1092	LG	생산	\N	2016 하반기	서성한	재료	3.93	\N	945	\N	\N		생산/제조
1093	현대 위아	생산	\N	2016 하반기	경기원 4년제	기계공학	3.90	\N	800	\N	\N		생산/제조
1094	기아	생산기술	\N	2016 하반기	건동홍	기계공학부	3.61	\N	855	\N	\N		생산/제조
1095	기아	생산기술	\N	2016 하반기	세종대학교	컴퓨터공학과	3.60	\N	750	\N	\N		생산/제조
1096	현대제철	생산관리	\N	2016 하반기	지거국	기계	3.43	\N	\N	\N	\N		생산/제조
1097	기아	생산기술	\N	2016 하반기	아주대	기계공학	3.57	\N	800	\N	\N		생산/제조
1098	농협케미컬	생산	\N	2016 하반기	서울4년제	기계	3.50	\N	900	\N	\N		생산/제조
1099	현대다이모스	생산관리	\N	2016 하반기	지방사립대	산업공학과	3.44	\N	\N	\N	\N		생산/제조
1100	코오롱인더스트리	제조부문 환경안전	\N	2016 하반기	건국	화공	3.73	\N	795	\N	\N		생산/제조
1101	현대모비스	제조영업	\N	2016 하반기	전자전기	학점 3.5	3.50	\N	\N	\N	\N		생산/제조
1102	기아	생산	\N	2016 하반기	중경외시	산업경영공학	4.00	\N	805	IM2	\N		생산/제조
1103	현대제철	생산관리	\N	2016 하반기	홍익대	전자전기공학	3.82	\N	820	\N	\N		생산/제조
1104	금호타이어	생산관리	\N	2016 하반기	숭실대학교	전기공학부	3.56	\N	830	\N	\N		생산/제조
1105	금호타이어	생산	\N	2016 하반기	수도권	기계공	3.30	4.50	900	IH	\N		생산/제조
1106	효성중공업	생산기술	\N	2016 하반기	지방사립대	전기공학	4.00	\N	800	\N	\N		생산/제조
1107	현대제철	생산관리	\N	2016 하반기	지방k	신소재	4.11	\N	\N	\N	레벨6		생산/제조
1108	현대위아	품질	\N	2016 상반기	지방 국립대	기계	3.50	\N	930	\N	\N		생산/제조
1109	기아	생산기술	\N	2016 상반기	인서울 4년제	화학공학과	3.90	\N	955	\N	\N		생산/제조
1110	현대중공업	생산관리	\N	2016 상반기	해외대	산공	\N	\N	\N	\N	\N		생산/제조
1111	롯데케미칼	생산관리	\N	2016 상반기	서울 중위권	화공과	3.70	\N	\N	IH	\N		생산/제조
1112	대웅제약	항암제생산	\N	2016 상반기	충남대햑교	화공	3.65	\N	825	\N	\N		생산/제조
1113	LG화학	생산기술	\N	2016 상반기	서울 상위권	화공과	3.70	\N	\N	IH	\N		생산/제조
1114	현대제철	생산관리	\N	2016 상반기	성균관대학교	화학공학부	3.73	\N	900	\N	레벨6		생산/제조
1115	삼성전자	생산기술연구소	\N	2016 상반기	지방사립대	전자공학	4.11	\N	\N	IM2	\N		생산/제조
1116	롯데제과	생산관리	\N	2016 상반기	서울소재 4년	생물학	3.36	\N	825	\N	\N		생산/제조
1117	기아	생산기술	\N	2016 상반기	서울 중위권	전자전기	3.52	\N	860	\N	130		생산/제조
1118	CJ제일제당	생산기술	\N	2016 상반기	서울중위권	산업공학학과	3.00	\N	\N	\N	레벨6		생산/제조
1119	sk플라즈마	제조공장	\N	2016 상반기	지거국	자연대	3.61	\N	940	\N	\N		생산/제조
1120	동원건설산업	생산관리	\N	2016 상반기	인서울 중위	신소재공학	3.35	4.50	760	\N	\N		생산/제조
1121	LG디스플레이	생산관리	\N	2016 상반기	기계공학부	학점 3.3	3.30	\N	770	\N	\N		생산/제조
1122	기아	생산공정	\N	2016 상반기	국숭세단	기계공학과	3.73	\N	\N	\N	\N		생산/제조
1123	현대제철	생산관리	\N	2016 상반기	건국대	전자	3.62	\N	785	\N	\N		생산/제조
1124	아모레퍼시픽	생산관리	\N	2016 상반기	한양대	산업공학	3.88	\N	\N	\N	\N		생산/제조
1125	기아	생산기술	\N	2016 상반기	지방	기계	3.70	\N	845	\N	\N		생산/제조
1126	현대위아	품질	\N	2016 상반기	수도권 공대	기계공학과	3.70	\N	845	\N	\N		생산/제조
1127	롯데 주류	생산관리	\N	2016 상반기	국립대	생명공학	4.20	\N	900	IM2	\N		생산/제조
1128	현대제철	생산관리	\N	2016 상반기	서울중위권	산공	3.00	\N	\N	\N	\N		생산/제조
1129	현대중공업	생산	\N	2016 상반기	서울소재 대학	전기공	3.80	\N	880	\N	\N		생산/제조
1130	기아	생산기술	\N	2016 상반기	인하대학교	기계공학	3.74	\N	715	\N	\N		생산/제조
1131	현대위아	품질	\N	2016 상반기	수도권 4년제	전기과	3.80	\N	815	\N	\N		생산/제조
1132	SK하이닉스	공정(제조)	\N	2016 상반기	중앙대	화학공학과	3.80	\N	945	\N	\N		생산/제조
1133	SK하이닉스	공정(제조)	\N	2016 상반기	서울 중위권대	화학공학과	3.70	\N	\N	IH	\N		생산/제조
1134	아모레퍼시픽	생산기술	\N	2016 상반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
1135	기아	생산기술	\N	2015 하반기	지거국	기계공학부	3.74	\N	890	IH	\N		생산/제조
1136	포스코	생산기술	\N	2015 하반기	지거국	화공	4.09	\N	\N	\N	\N		생산/제조
1137	LG전자	생산	\N	2015 하반기	대학교 In 부산	기계	3.60	\N	820	\N	\N		생산/제조
1138	SK에너지	생산기술	\N	2015 하반기	지방거주 사립대	화공	3.88	\N	800	\N	\N		생산/제조
1139	포스코	생산관리	\N	2015 하반기	서성한	신소재	3.04	\N	\N	ih	\N		생산/제조
1140	삼성정밀화학	생산관리	\N	2015 하반기	지방사립	화공	4.09	\N	835	\N	\N		생산/제조
1141	효성 산업자재	생산기술	\N	2015 하반기	지거국	화학공학	3.88	\N	820	IH	\N		생산/제조
1142	기아	생산기술	\N	2015 하반기	서연고	신소재공학과	3.75	4.30	\N	IH	\N		생산/제조
1143	현대제철	생산관리	\N	2015 하반기	인하대학교	환경공학과	3.70	\N	780	\N	\N		생산/제조
1144	포스코	생산기술	\N	2015 하반기	지거국	화공	3.88	\N	820	IH	\N		생산/제조
1145	현대제철	생산	\N	2015 하반기	국민대	신소재	3.70	\N	\N	\N	\N		생산/제조
1146	LG화학	전지생산기술	\N	2015 하반기	서성한	화공	3.74	\N	890	\N	\N		생산/제조
1147	포스코	생산기술	\N	2015 하반기	광명상가	전자재료공학	3.82	\N	830	AL	\N		생산/제조
1148	현대중공업	생산	\N	2015 하반기	지방 사립	기계	3.50	\N	800	\N	\N		생산/제조
1149	삼성SDI	생산관리	\N	2015 하반기	한국산업기술대학교	신소재공학과	3.72	\N	\N	\N	\N		생산/제조
1150	삼성SDI	생산관리	\N	2015 하반기	지방사립대	기계공학과	3.80	\N	745	\N	\N		생산/제조
1151	두산중공업	생산	\N	2015 하반기	중경외시	전자전기	3.10	\N	800	\N	\N		생산/제조
1152	LG화학	생산기술	\N	2015 하반기	경희대학교	기계공학과	3.86	\N	825	IM2	\N		생산/제조
1153	롯데제과	생산	\N	2015 하반기	서울과학기술대	기계시스템디자인	3.17	\N	765	IM1	\N		생산/제조
1154	기아	생산기술	\N	2015 하반기	지거국	고분자	4.00	\N	860	IH	\N		생산/제조
1155	포스코	생산기술	\N	2015 하반기	서연고	신소재	3.75	4.30	\N	IH	\N		생산/제조
1156	기아	생산기술	\N	2015 하반기	광운대	전자재료공학	4.14	\N	735	IM1	\N		생산/제조
1157	LG디스플레이	생산	\N	2015 하반기	서성한	화학공학	3.55	\N	820	\N	\N		생산/제조
1158	효성	생산	\N	2015 하반기	인서울 4년제	화학	3.34	\N	835	\N	\N		생산/제조
1159	현대모비스	ㅅ생산기술	\N	2015 하반기	기계	학점 4.06	4.06	\N	\N	\N	\N		생산/제조
1160	SK하이닉스	공정(제조)	\N	2015 하반기	아주대학교	화학공학과	3.54	\N	870	\N	\N		생산/제조
1161	금호타이어	생산관리	\N	2015 하반기	서상한	공과계열	3.10	\N	700	\N	\N		생산/제조
1162	lg하우시스	생산기술	\N	2015 하반기	서울 4년제	기계공	3.33	\N	\N	\N	\N		생산/제조
1163	효성화학	생산기술	\N	2015 하반기	성균관대학교	고분자시스템공학과	3.89	\N	890	\N	\N		생산/제조
1164	포스코	생산기술	\N	2015 하반기	경북대	기계	3.85	\N	875	\N	\N		생산/제조
1165	sk종합석유화학	생산관리	\N	2015 하반기	서울4년제	화공	3.76	\N	860	\N	\N		생산/제조
1166	기아	생산기술	\N	2015 하반기	인서울	전자전기	3.70	\N	860	\N	\N		생산/제조
1167	현대위아	생산	\N	2015 하반기	지거국	기계	3.90	\N	860	\N	\N		생산/제조
1168	SK하이닉스	공정제조	\N	2015 하반기	지방국립대 4년제	반도체과학기술	3.72	\N	\N	IL	\N		생산/제조
1169	sk바이오팜	생산	\N	2015 하반기	서강대	화공	3.58	\N	745	\N	\N		생산/제조
1170	CJ제일제당	생산기술	\N	2015 하반기	중경외시	생명공학계열	3.75	\N	\N	IM2	\N		생산/제조
1171	두산중공업	생산	\N	2015 하반기	울산대	기계자동차	3.30	\N	835	IM2	\N		생산/제조
1172	LG화학	생산관리	\N	2015 하반기	서성한	화공	3.58	\N	925	\N	\N		생산/제조
1173	농협 홍삼	생산	\N	2015 하반기	지방국립대	식품공학	3.50	\N	710	\N	\N		생산/제조
1174	LG화학	생산기술	\N	2015 하반기	지방 국립대	공업화학과	4.22	\N	850	\N	\N		생산/제조
1175	현대모비스	생산기술	\N	2015 하반기	지방사립	기계	4.25	\N	750	\N	\N		생산/제조
1176	농협케미컬	생산	\N	2015 하반기	서울과기대	기계시스템디자인공학	3.17	\N	\N	\N	\N		생산/제조
1177	현대제철	생산관리	\N	2015 하반기	서성한	산업공학과	3.60	\N	835	IM2	\N		생산/제조
1178	롯데케미칼	생산	\N	2015 하반기	연세대	화학공학과	3.43	\N	875	\N	\N		생산/제조
1179	SK하이닉스	제조공정	\N	2015 하반기	서울권 공대	전기공학과	3.60	\N	820	\N	\N		생산/제조
1180	현대제철	생산	\N	2015 하반기	중앙대	전자전기	3.26	\N	\N	\N	레벨6		생산/제조
1181	금호타이어	생산관리	\N	2015 하반기	전남	광전자화공소재	3.59	\N	845	\N	\N		생산/제조
1182	SK하이닉스	제조공정	\N	2015 하반기	충남대	기계설계공학	3.79	\N	870	\N	\N		생산/제조
1183	두산중공업	생산	\N	2015 하반기	부경대학교	기계설계공학과	3.98	\N	\N	\N	레벨6		생산/제조
1184	기아	생산기술	\N	2015 하반기	충남대	기계설계공학	3.79	\N	870	\N	\N		생산/제조
1185	기아	생산기술	\N	2015 하반기	인하대	기계	3.50	\N	\N	\N	\N		생산/제조
1186	현대위아	생산관리	\N	2015 하반기	인서울	산업공학	3.82	\N	785	\N	\N		생산/제조
1187	SK하이닉스	공정(제조)	\N	2015 하반기	세종대학교	신소재공학과	3.72	\N	\N	\N	\N		생산/제조
1188	LG화학	생산팀	\N	2015 하반기	지방전문대	기계과	3.80	\N	\N	\N	\N		생산/제조
1189	두산중공업	생산관리	\N	2015 하반기	부경대학교	기계설계공학	3.98	\N	855	\N	레벨6(130)		생산/제조
1190	현대모비스	생산관리	\N	2015 하반기	지방 국립대	기계	3.73	\N	\N	\N	140		생산/제조
1191	현대위아	생산관리	\N	2015 하반기	지방국립	신소재	4.02	\N	875	\N	\N		생산/제조
1192	금호타이어	생산관리	\N	2015 하반기	서성한	화공	3.51	\N	845	\N	레벨6		생산/제조
1193	포스코	생산기술	\N	2015 하반기	중위권	화학공학	4.10	\N	870	\N	130		생산/제조
1194	현대 다이모스	생산관리-P	\N	2015 하반기	지방국립대	전기공학과	3.58	\N	\N	\N	\N		생산/제조
1195	LG이노텍	생산기술	\N	2015 하반기	지거국	기계공학부	3.74	\N	890	IH	\N		생산/제조
1196	현대중공업	생산관리	\N	2015 하반기	지방국립	조선공학	3.61	\N	825	\N	\N		생산/제조
1197	현대중공업	생산관리	\N	2015 하반기	지방사립	기계	4.25	\N	750	\N	\N		생산/제조
1198	금호타이어	생산관리	\N	2015 하반기	한양대	기계공학부	2.85	\N	940	\N	150		생산/제조
1199	현대제철	생산관리	\N	2015 하반기	서성한	신소재	3.56	\N	715	\N	\N		생산/제조
1200	s오일	생산관리	\N	2015 하반기	부산대	기계공학부	3.74	\N	\N	\N	\N		생산/제조
1201	삼성중공업	생산관리	\N	2015 하반기	지방사립대학교	기계공학부	3.40	4.50	745	\N	\N		생산/제조
1202	금호타이어	생산관리	\N	2015 하반기	전남대	응용화학공학부	3.59	\N	845	\N	\N		생산/제조
1203	두산중공업	생산	\N	2015 하반기	서성한	기계	4.30	\N	800	\N	\N		생산/제조
1204	현대 위아	품질	\N	2015 하반기	경기권	기계공	3.68	\N	760	\N	\N		생산/제조
1205	코오롱 인더 제조	생산관리	\N	2015 하반기	수도권	화학과	3.62	\N	\N	\N	\N		생산/제조
1206	롯데케미칼	생산관리	\N	2015 하반기	지방국립	기계공학부	3.89	\N	\N	\N	\N		생산/제조
1207	SK하이닉스	공정(제조)	\N	2015 하반기	지방사립대	반도체	3.70	\N	\N	IM2	\N		생산/제조
1208	현대제철	생산관리	\N	2015 하반기	지방 국립	금속재료	3.54	\N	\N	IH	\N		생산/제조
1209	LG화학	생산관리	\N	2015 하반기	수도권	화공과	3.87	\N	820	\N	\N		생산/제조
1210	삼성전자	생산	\N	2015 하반기	지방국립대	물리	3.50	\N	805	\N	\N		생산/제조
1211	기아	생산기술	\N	2015 하반기	수도권 공대	전자전파공학	3.64	\N	900	\N	\N		생산/제조
1212	삼성중공업	생산공정관리직	\N	2015 하반기	지방4년제	화학공학과	3.69	\N	\N	\N	\N		생산/제조
1213	금호타이어	생산관리	\N	2015 하반기	경기 K대	공대	3.37	\N	890	\N	\N		생산/제조
1214	현대모비스	생산기술	\N	2015 하반기	서성한	화학공학	3.70	\N	900	\N	\N		생산/제조
1215	LG화학	생산관리	\N	2015 하반기	건동홍	화학공학과	3.92	\N	885	\N	\N		생산/제조
1216	삼성SDI	기술직(생산)	\N	2015 하반기	지거국	고분자공학	3.85	\N	\N	\N	\N		생산/제조
1217	포스코	생산기술	\N	2015 하반기	지거국	기계공학부	3.74	\N	890	IH	\N		생산/제조
1218	SK하이닉스	제조공정	\N	2015 하반기	유기응용	학점 3.6	3.60	\N	755	\N	\N		생산/제조
1219	SK하이닉스	공정제조	\N	2015 하반기	지방국립대	물리	3.50	\N	805	\N	\N		생산/제조
1220	SK하이닉스	제조공정	\N	2015 하반기	지거국	전기전자	3.80	\N	755	\N	\N		생산/제조
1221	현대중공업	생산기술	\N	2015 하반기	전남대	신소재공학	4.02	\N	750	\N	\N		생산/제조
1222	두산중공업	생산	\N	2015 하반기	울산대	기계자동차	3.81	\N	830	\N	\N		생산/제조
1223	SK하이닉스	제조공정	\N	2015 하반기	유기응용	학점 3.6	3.60	\N	755	\N	\N		생산/제조
1224	두산전자	생산	\N	2015 하반기	지방국립대	화공	3.00	\N	750	\N	\N		생산/제조
1225	삼성중공업	생산	\N	2015 하반기	지방거점사립대	조선해양공학과	3.82	\N	\N	\N	\N		생산/제조
1226	두산	생산	\N	2015 하반기	울산대	기계자동차공학	3.30	\N	835	\N	\N		생산/제조
1227	롯데케미컬	생산지원(기계)	\N	2015 하반기	수도권 공대	기계	4.00	\N	855	\N	\N		생산/제조
1228	기아	생산기술	\N	2015 하반기	서울중위권	기계	3.72	\N	825	\N	\N		생산/제조
1229	현대위아	생산기술	\N	2015 하반기	지방사립	기계시스템	3.75	\N	810	\N	\N		생산/제조
1230	포스코	생산기술	\N	2015 하반기	지방사립	신소재	3.80	\N	905	IH	\N		생산/제조
1231	삼성중공업	생산공정관리	\N	2015 하반기	지방사립대	기계자동차	3.81	\N	830	\N	\N		생산/제조
1232	에스오일	생산	\N	2015 하반기	중경외시	화공과	3.60	\N	790	\N	\N		생산/제조
1233	삼성중공업	생산관리	\N	2015 하반기	인천대학교	화학공학과	4.20	\N	880	\N	\N		생산/제조
1234	현대 위아	생산관리	\N	2015 하반기	지거국	기계	3.80	\N	\N	\N	\N		생산/제조
1235	삼성전자	DS부문 생산기술연구소	\N	2015 하반기	한양대학교	컴퓨터전공	3.54	\N	\N	\N	레벨4		생산/제조
1236	현대모비스	생산기술	\N	2015 하반기	지거국	기계	3.88	\N	825	IH	\N		생산/제조
1237	현대위아	품진생산	\N	2015 하반기	지거국	제어계측공학과	4.00	\N	805	\N	\N		생산/제조
1238	SK하이닉스	공정(제조)	\N	2015 하반기	수도권	고분자	3.50	\N	885	\N	\N		생산/제조
1239	현대모비스	생산관리	\N	2015 하반기	중앙대	기계공학	2.63	\N	880	IH	\N		생산/제조
1240	현대위아	생산관리	\N	2015 하반기	동건홍	전자전기	4.20	\N	905	\N	\N		생산/제조
1241	LG화학	생산기술	\N	2015 하반기	중경외시	화학공학과	3.87	\N	805	\N	\N		생산/제조
1242	현대위아	품질	\N	2015 하반기	금오공대	기계공학과	3.92	\N	780	\N	\N		생산/제조
1243	현대위아	생산관리	\N	2015 하반기	지거국	기계	3.73	\N	\N	\N	\N		생산/제조
1244	SK하이닉스	공정(제조)	\N	2015 하반기	경북대학교	화학과	4.23	\N	\N	IH	\N		생산/제조
1245	현대위아	품질	\N	2015 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
1246	강림인슈	생산관리	\N	2015 하반기	지방 사립	신소재공학	4.13	\N	650	\N	\N		생산/제조
1247	포스코	생산관리	\N	2015 하반기	지방대	화공	3.90	\N	\N	\N	\N		생산/제조
1248	SK이노베이션	생산	\N	2015 하반기	지방대	재료공학부	3.78	\N	\N	\N	\N		생산/제조
1249	현대제철	생산관리	\N	2015 하반기	중경외시	전자전기	3.60	\N	830	\N	\N		생산/제조
1250	기아	생산	\N	2015 하반기	수도권 4년제	기계자동차	3.95	\N	855	\N	\N		생산/제조
1251	포스코	생산설비	\N	2015 하반기	부산대	기계과	3.60	\N	\N	\N	\N		생산/제조
1252	현대위아	생산관리	\N	2015 하반기	지방 국립	기계	3.80	\N	\N	\N	\N		생산/제조
1253	LG화학	정보전자소재 생산기술	\N	2015 하반기	중앙대	화공	3.80	\N	945	\N	\N		생산/제조
1254	금호타이어	생산	\N	2015 하반기	지방사립	전자	3.50	\N	810	\N	\N		생산/제조
1255	SK하이닉스	공정제조	\N	2015 하반기	서울 중위권	화학공학과	3.89	\N	850	\N	\N		생산/제조
1256	두산중공업	생산 직무	\N	2015 하반기	건국대	항공우주공학	3.63	\N	835	\N	\N		생산/제조
1257	현대모비스	생산관리	\N	2015 하반기	지방대	기계자동차	3.74	\N	850	\N	\N		생산/제조
1258	금호타이어	생산지원	\N	2015 하반기	sky	환경공학	4.00	\N	955	ih	\N		생산/제조
1259	현대다이모스	생산관리	\N	2015 하반기	홍익대학교	전자전기공학부	3.17	\N	830	\N	\N		생산/제조
1260	기아	생산관리	\N	2015 하반기	수도권 지방대	기계공학	3.64	\N	870	\N	\N		생산/제조
1261	LG전자	생산기술원	\N	2015 하반기	서성한	화학공학	3.30	\N	\N	IM2	\N		생산/제조
1262	현대위아	품질	\N	2015 하반기	전남대	산업공학과	3.61	\N	840	im1	\N		생산/제조
1263	삼성중공업	생산공정관리	\N	2015 하반기	지거국	기계	3.80	\N	\N	\N	\N		생산/제조
1264	포스코	생산기술	\N	2015 하반기	지거국	기계공학과	3.96	\N	820	\N	\N		생산/제조
1265	효성중공업	생산기술직무	\N	2015 하반기	부산대	기계공학부	3.74	\N	\N	\N	140		생산/제조
1266	기아	생산기술	\N	2015 하반기	중경외시	기계	3.87	\N	850	\N	\N		생산/제조
1267	현대중공업	생산	\N	2015 하반기	경상대학교	전기전자공학과	4.00	\N	805	\N	\N		생산/제조
1268	현대자동차	생산기술	\N	2015 하반기	지거국	기계공학부	3.74	\N	890	IH	\N		생산/제조
1269	SK하이닉스	제조	\N	2015 하반기	중경시	전자공학과	4.01	4.50	875	\N	레벨 5		생산/제조
1270	현대다이모스	생산기술	\N	2015 하반기	부산대학교	기계공학부	3.48	\N	\N	\N	130		생산/제조
1271	현대제철	생산기술	\N	2015 하반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
1272	현대모비스	생산기술	\N	2015 하반기	지방국립	기계공학부	3.89	\N	885	\N	\N		생산/제조
1273	현대위아	품질생산	\N	2015 하반기	부산대	기계공학과	3.40	\N	870	\N	\N		생산/제조
1274	CJ제일제당	생산기술	\N	2015 하반기	서성한	화학공학과	3.50	\N	\N	\N	6		생산/제조
1275	삼성중공업	생산	\N	2015 하반기	지거국	조선	4.10	4.50	850	\N	\N		생산/제조
1276	금호타이어	생산관리 - 설비 - 품질	\N	2015 하반기	서울중위권	기계공학	3.65	\N	\N	\N	\N		생산/제조
1277	삼성SDI	생산관리	\N	2015 하반기	한국산업기술대학교	신소재공학과	3.72	\N	\N	\N	6		생산/제조
1278	SK하이닉스	공정(제조)	\N	2015 하반기	경북대학교	전자공학부	3.52	4.30	905	\N	\N		생산/제조
1279	현대다이모스	생산기술	\N	2015 하반기	서울4년제	기계공학과	3.60	\N	\N	IH	\N		생산/제조
1280	두산중공업	생산관리	\N	2015 하반기	지거국	기계공학과	3.80	\N	\N	\N	\N		생산/제조
1281	LS전선	생산기술	\N	2015 하반기	지거국	전기공학과	3.91	\N	765	IL	\N		생산/제조
1282	현대위아	생산관리	\N	2015 하반기	경인지역 국립대	산업공학	4.07	\N	\N	\N	\N		생산/제조
1283	현대다이모스	PT 생산기술	\N	2015 하반기	지거국	기계시스템공학과	3.88	\N	790	IH	\N		생산/제조
1284	두산중공업	생산	\N	2015 하반기	지방사립대	조선공학과	4.00	\N	820	\N	\N		생산/제조
1285	삼성중공업	생산	\N	2015 하반기	금오공대	기계	4.06	\N	740	\N	\N		생산/제조
1286	효성	화학pg 생산관리	\N	2015 하반기	서울4년	화학공학과	3.50	\N	900	\N	\N		생산/제조
1287	LG하우시스	생산	\N	2015 하반기	지거국	고분자	3.85	\N	\N	\N	LV5		생산/제조
1288	현대중공업	생산관리	\N	2015 상반기	금오공대	기계공학과	3.80	\N	\N	\N	\N		생산/제조
1289	금호타이어	생산관리	\N	2015 상반기	지거국	전자공학과	3.61	\N	855	\N	\N		생산/제조
1290	LG이노텍	생산기술	\N	2015 상반기	지거국	기계	3.50	\N	750	\N	\N		생산/제조
1291	현대파워텍	생산직	\N	2015 상반기	폴리텍대학	기계과	3.98	\N	\N	\N	\N		생산/제조
1292	두산산업차량	생산기획	\N	2015 상반기	지방국립대	기계시스템	3.79	\N	710	\N	110		생산/제조
1293	금호타이어	생산관리	\N	2015 상반기	\N	\N	\N	\N	\N	\N	\N		생산/제조
1294	롯데케미칼	생산관리	\N	2015 상반기	고분자공학	학점 4.17	4.17	\N	800	\N	\N		생산/제조
1295	캐논 코리아 비지니스 솔루션	생산팀	\N	2014 하반기	수도권 전문대	전기전자	4.30	\N	500	\N	\N		생산/제조
1296	금호타이어	생산관리	\N	2014 상반기	동국대	산업공학	3.50	\N	880	\N	\N		생산/제조
1	대한항공	IT Cloud	\N	2025 상반기	덕성여대	컴퓨터공학전공	3.96	\N	\N	\N	150	인턴 	IT/인터넷
\.


--
-- Data for Name: certifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certifications (id, applicant_id, certification_name) FROM stdin;
1	1	정보처리기사(필기)
2	2	취약점 경진대회 수상 3회
3	2	개발 관련 대외활동 2회
4	2	보안 관련 장기 교육 2회
5	3	한국사검정시험: 고급
6	3	컴퓨터활용능력: 2급
7	3	기타: ADSP
8	3	SQLD
9	3	MOS MASTER
10	3	워드1급
11	4	한국사검정시험: 고급
12	4	컴퓨터활용능력: 2급
13	4	기타: SQLD
14	4	ADSP
15	4	MOS MASTER
16	4	워드1급
17	5	교내수상 : SW 알고리즘 경진대회 대상
18	5	금상
19	5	기타: 정보처리기사
20	5	CCNA
21	5	리눅스마스터2급
22	5	AZ-900
23	5	SC-900
24	5	AI-900
25	6	취약점 경진대회 수상 3회
26	6	개발 관련 대외활동 2회
27	6	보안 관련 장기 교육 2회
28	7	기타: 정보처리기사
29	8	한국사검정시험: 고급
30	8	컴퓨터활용능력: 1급
31	8	기타: 정보처리기사
32	8	정보보안기사
33	8	CPPG
34	8	SQLD
35	12	한국사검정시험: 중급
36	12	컴퓨터활용능력: 2급
37	12	기타: SQLD
38	13	컴퓨터활용능력: 2급
39	13	기타: MOS MASTER 2016
40	16	한국사검정시험:
41	16	컴퓨터활용능력:
42	16	기타: 빅데이터분석기사
43	16	ADsP
44	17	한국사검정시험:
45	17	컴퓨터활용능력: 1급
46	17	기타: 정보처리기사
47	18	한국사검정시험: 고급
48	18	컴퓨터활용능력: 1급
49	18	기타: 정보처리기사
50	19	한국사검정시험:
51	19	컴퓨터활용능력:
52	19	기타:
53	20	기타: 정보처리기사
54	20	sqld
55	21	공모전 수상
56	21	IT 국비교육 수료
57	21	한국사검정시험: 고급
58	21	컴퓨터활용능력: 1급
59	21	기타: AWS CCP
60	23	기타: 정보처리기사
61	24	기타: 정보처리기사
62	25	공모전 2회 수상 2회
63	25	학부연구생
64	25	한국사검정시험: 고급
65	25	컴퓨터활용능력: 1급
66	25	기타: 정보처리기사
67	26	교내 수상
68	26	교외 수상
69	26	학부연구생
70	26	한국사검정시험: 고급
71	26	컴퓨터활용능력: 1급
72	26	기타: 정보처리기사
73	27	2021 STAC 미래산업 AI부문 가작상
74	27	제6회 전국 고등학교 동아리 SW경진대회 장려상
75	27	2021 부산경남 비즈쿨 창업경진대회 우수상
76	27	2021 더고대하던 SW인재 창업캠프
77	27	2022 고졸성공 취업대박람회 동아리경진대회 금상(1위)
78	27	2022 STAC 미래산업 AI부문 우수상
79	28	한전KDN 빛가람 에너지밸리 고등부 장려상 수상
80	28	2021 한국청소년학술대회 참가 (우수 청소년 학자상) 등
81	29	한전KDN 빛가람 에너지밸리 고등부 장려상 수상
82	29	2021 한국청소년학술대회 참가 (우수 청소년 학자상) 등
83	30	핀테크 개발 교육
84	30	컴퓨터활용능력: 1급
85	30	기타: SQLD
86	33	핀테크 개발 교육
87	33	한국사검정시험:
88	33	컴퓨터활용능력: 1급
89	33	기타: SQLD
90	34	한국사검정시험:
91	34	컴퓨터활용능력: 1급
92	34	기타: SQLD
93	35	한국사검정시험:
94	35	컴퓨터활용능력:
95	35	기타:
96	36	한국사검정시험:
97	36	컴퓨터활용능력: 2급
98	36	기타: 정보처리기사
99	37	한국사검정시험:
100	37	컴퓨터활용능력:
101	37	기타: adsp
102	38	한국사검정시험:
103	38	컴퓨터활용능력: 1급
104	38	기타:
105	39	한국사검정시험:
106	39	컴퓨터활용능력:
107	39	기타:
108	40	한국사검정시험: 고급
109	40	컴퓨터활용능력: 1급
110	40	기타:
111	41	한국사검정시험: 고급
112	41	컴퓨터활용능력: 1급
113	41	기타:
114	42	한국사검정시험: 고급
115	42	컴퓨터활용능력: 1급
116	42	기타:
117	43	한국사검정시험: 고급
118	43	컴퓨터활용능력: 1급
119	43	기타:
120	44	한국사검정시험: 고급
121	44	컴퓨터활용능력: 1급
122	44	기타: 6시그마(GB)
123	45	한국사검정시험:
124	45	컴퓨터활용능력:
125	45	기타:
126	46	한국사검정시험:
127	46	컴퓨터활용능력:
128	46	기타:
129	47	한국사검정시험:
130	47	컴퓨터활용능력:
131	47	기타:
132	48	한국사검정시험:
133	48	컴퓨터활용능력:
134	48	기타:
135	49	한국사검정시험:
136	49	컴퓨터활용능력:
137	49	기타: 정보처리기사
138	50	한국사검정시험:
139	50	컴퓨터활용능력:
140	50	기타: 정보처리기사
141	51	한국사검정시험:
142	51	컴퓨터활용능력:
143	51	기타:
144	52	한국사검정시험:
145	52	컴퓨터활용능력:
146	52	기타:
147	53	한국사검정시험:
148	53	컴퓨터활용능력:
149	53	기타:
150	54	한국사검정시험:
151	54	컴퓨터활용능력:
152	54	기타: 워드프로세서
153	55	한국사검정시험: 고급
154	55	컴퓨터활용능력: 1급
155	55	기타: SQLD
156	55	정보처리기사
157	56	한국사검정시험: 고급
158	56	컴퓨터활용능력: 1급
159	56	기타: SQLD
160	56	정보처리기사
161	57	한국사검정시험: 고급
162	57	컴퓨터활용능력: 1급
163	57	기타: SQLD
164	57	정보처리기사
165	58	한국사검정시험: 고급
166	58	컴퓨터활용능력: 1급
167	58	기타: SQLD
168	59	한국사검정시험:
169	59	컴퓨터활용능력: 2급
170	59	기타: 정보처리기사
171	60	한국사검정시험:
172	60	컴퓨터활용능력:
173	60	기타:
174	61	한국사검정시험:
175	61	컴퓨터활용능력:
176	61	기타:
177	62	한국사검정시험:
178	62	컴퓨터활용능력:
179	62	기타: 정보보안산업기사
180	63	한국사검정시험: 고급
181	63	컴퓨터활용능력: 1급
182	63	기타:
183	64	자율 주행 유모차 논문 발표 동상 수상
184	64	기타: 정보처리기사
185	65	자율 주행 유모차 논문 발표 동상 수상
186	65	기타: 정보처리기사
187	66	자율 주행 유모차 논문 발표 동상 수상
188	66	기타: 정보처리기사
189	68	기타: 품질경영기사
190	68	ADsP
191	68	SQLD
192	69	졸업논문 최우수상
193	70	기타: 정보처리기사
194	74	공통프로젝트(웹기술) 우수상
195	74	기타: 정보처리기사
196	75	공통프로젝트 우수상 (삼성전자주식회사 주관)
197	77	컴퓨터활용능력: 2급
198	77	기타: 정보처리기사
199	78	ICT 종합학술대회 우수상
200	80	정보처리기사
201	80	컴퓨터활용능력 1급
202	80	한국사 2급
203	80	중소기업 인턴 (3개월)
204	81	교내 연합봉사동아리 2년(부회장 1년)
205	81	교내 공모전 2회 참여: 우수상
206	81	인기상 2회 수상
207	81	전국단위 연구과제 공모전 참여: 장려상 수상
208	81	임베디드소프트웨어경진대회 자율주행부문 참여
209	81	학부연구생 생활 2년
210	81	석사 2년
211	81	석사과정 국가 연구과제 담당 2건
212	81	국내
213	81	국제학회 학술발표 5건
214	81	국외학회 학술발표 1건
215	81	국내특허출원 2건
216	81	국제특허출원 1건
217	81	SW저작권 1건
218	81	SCOPUS 논문 3건
219	81	SCI 논문 1건
220	81	컴활 1급
221	86	정보처리기사
222	87	정보처리기사
223	88	정보처리기사
224	89	정보처리기사
225	90	정보처리기사
226	91	정보처리기사
227	96	인턴 1회
228	96	전국 규모 공모전 최우수상
229	96	교내 졸업작품 대상
230	96	여러 자잘한 공모전 우수상 ~ 장려상
231	96	핵데이나 기업에서 운영하는 활동 3회 창업
232	101	정보통신기사
233	101	무선설비기사
234	101	한국사 1급
235	101	임베디드 연구실 작품활동 1년
236	101	교내 학술대회 참가
237	109	인턴 1회
238	109	동아리 1회
239	109	수상경력 1회
240	111	인턴 3회
241	111	창업 1회
242	111	공모전 수상 15회
243	114	인턴 1
244	114	대회 수상 1
245	116	프로젝트 공모전 최우수상 논문 KCI등재
246	116	특허출원 PI 아르바이트
247	117	개발 회사 3개월 인턴
248	117	공모전 수상 2회
249	122	인턴 1회
250	122	공모전 2회 특허
251	122	논문
252	123	인턴 1회
253	123	학회 발표 1회
254	123	수상 1회
255	125	대외활동1
256	125	동아리1
257	125	인턴1
258	125	대회2(수상은 1)
259	131	인턴 2회
260	131	교내대회 2회
261	131	수상공모전 2회 수상
262	132	인턴 (연구소
263	132	2017하계)
264	132	교내 대회 3회(1회 수상)
265	145	인턴 2회
266	145	봉사활동 2회
267	145	공모전 수상 2회
268	164	수상 1회
269	173	창업경진대회 수상 2번
270	182	공모전 4회 수상
271	188	봉사활동 1회
272	188	동아리 2회
273	188	기타 교육과정
274	188	공모전
275	194	공모전 수상 3회
276	194	인턴 1회
277	196	인턴 1회
278	196	기타 창업 1회
279	196	창업 관련 수상 2회
280	207	해외봉사: 1 공모전: 1 자격증: 6
281	234	공모전 우수상
282	234	서울 동행프로젝트
283	235	Start-Up기업 1곳 인턴
284	235	직접창업 1번 학교내 창업 공모전 우수상
285	235	장려상 제1회 미래물류기술 공모전 최우수상
286	246	대외활동 (전공무관)
287	246	자격증
288	252	중소기업 중계기 회사 인턴 1회
289	252	회로설계 교육
290	252	반도체 공정교육
291	252	국토대장정
292	265	웹 개발 전문과정 3개월 수료 소프트웨어 설계 경진대회 우수상
293	269	캡스톤 디자인 경연대회 대상
294	270	한국공항공사 현장교육
295	272	2회( SI 2달
296	272	생산정보화시스템 3달 ) 정보통신 학술대회 및 영상관련 특허출원1건
297	275	해외봉사활동
298	275	IT 공모전 수상
299	275	UCC 공모전 수상
300	287	인턴
301	287	대외활동
302	287	봉사활동
303	287	수상경력 유
304	292	공모전 3개 수상 정보처리기능사 정보처리기사 s
305	293	사회봉사 1회
306	293	공모전 1회
307	293	정보처리기사
308	294	인턴1
309	294	자격증1
310	299	공모전 3회 수상
311	310	컴퓨터활용능력: 2급
312	310	기타: 산업안전기사
313	310	온실가스관리기사
314	310	재경관리사
315	310	ERP회계정보관리사
316	311	공학상 은상
317	311	캠퍼스특허유니버시아드 장려상
318	311	한국사검정시험: 고급
319	311	컴퓨터활용능력: 1급
320	311	기타: 전기기사
321	311	전기공사기사
322	312	한국사검정시험: 고급
323	312	컴퓨터활용능력: 1급
324	312	기타: 전기기사
325	312	전기공사기사
326	312	컴퓨터활용능력 1급
327	313	2024년 봄 학술대회 우수논문상 (한국가스학회장상)
328	313	제10회 위험성평가 경진대회_장려상 (한국안전학회장상)
329	313	제9회 위험성평가 경진대회_대상 (고용노동부 장관상)
330	313	2022년 재난안전 논문 공모전_대상 (행정안전부 장관상)
331	313	한국사검정시험: 중급
332	313	컴퓨터활용능력: 1급
333	313	기타: 산업안전기사
334	313	위험물산업기사
335	313	Auto CAD 2급
336	313	워드프로세서
337	315	컴퓨터활용능력: 2급
338	315	기타: 산업안전기사
339	315	ERP회계정보관리사
340	315	재경관리사
341	318	공학상 은상
342	318	캠퍼스특허유니버시아드 장려상
343	318	한국사검정시험: 고급
344	318	컴퓨터활용능력: 1급
345	318	기타: 전기기사
346	318	전기공사기사
347	319	공학상 은상
348	319	캠퍼스특허유니버시아드 장려상
349	319	한국사검정시험: 고급
350	319	컴퓨터활용능력: 1급
351	319	기타: 전기기사
352	319	전기공사기사
353	320	학부 캡스톤디자인 장려상
354	320	부트캠프 프로젝트 발표회 최우수상
355	320	한국사검정시험: 고급
356	320	컴퓨터활용능력: 1급
357	320	기타: 정보처리기사
358	321	대외활동 (학회) 5회
359	321	수상경력 2회
360	321	기타: 화공기사+취득
361	324	학회 우수논문상 2회 수상
362	324	기술창업 대외활동 우수상 1회 수상
363	324	캡스톤 프로젝트 우수상 1회수상
364	326	한국사검정시험: 고급
365	326	기타: 자동차운전면허 2종보통
366	327	한국사검정시험: 고급
367	327	기타: 자동차운전면허 2종보통
368	328	교내 수상 1
369	329	교내수상1
370	330	교내 수상1
371	332	교내 수상 1
372	336	경진대회 1회 참여
373	336	캡스톤 디자인 프로젝트 2회 참여
374	337	특허
375	337	네이버부스트캠프
376	337	데이터청년캠퍼스
377	337	한국사검정시험: 중급
378	337	컴퓨터활용능력: 1급
379	337	기타: 정보처리기사
380	337	ADsP
381	337	SQLD
382	338	2024 전기공학부 학술공모전 우수상
383	338	2024 캡스톤 경진대회 장려상
384	338	글로벌적정기술창의설계경진대회 우수상
385	340	교내 공모전 수상
386	341	컴퓨터활용능력: 2급
387	343	기타: 화공기사
388	343	위험물산업기사
389	343	데이터분석준전문가
390	344	기타: 화공기사
391	344	위험물산업기사
392	344	데이터분석준전문가
393	345	교내수상 : SW 알고리즘 경진대회 대상
394	345	금상
395	345	기타: 정보처리기사
396	345	CCNA
397	345	리눅스마스터2급
398	345	AZ-900
399	345	SC-900
400	345	AI-900
401	346	한국사검정시험: 중급
402	346	컴퓨터활용능력: 1급
403	346	기타: 전기공사기사
404	346	전기기사
405	352	한국사검정시험: 고급
406	352	컴퓨터활용능력:
407	352	기타: 운전면허
408	356	한국사검정시험:
409	356	컴퓨터활용능력:
410	356	기타: 산업안전기사
411	356	위험물산업기사
412	358	학부연구생 1년
413	358	중앙 운동 동아리 회장
414	358	국내 논문 Best Paper 상 수상
415	358	창업 대회 장려상 수상
416	358	Capstone Design 대상
417	358	기타: 일반기계기사
418	359	컴퓨터활용능력: 1급
419	359	기타: 일반기계기사
420	361	기타: 정보처리기사
421	364	한국사검정시험: 고급
422	364	컴퓨터활용능력:
423	364	기타: 운전면허
424	365	한국사검정시험: 고급
425	365	컴퓨터활용능력:
426	365	기타: 전기기사
427	367	공학상 은상
428	367	캠퍼스특허유니버시아드 장려상
429	367	한국사검정시험: 고급
430	367	컴퓨터활용능력: 1급
431	367	기타: 전기기사
432	368	공학상 은상
433	368	캠퍼스특허유니버시아드 장려상
434	368	한국사검정시험: 고급
435	368	컴퓨터활용능력: 1급
436	368	기타: 전기기사
437	369	공학상 은상
438	369	캠퍼스특허유니버시아드 장려상
439	369	한국사검정시험: 고급
440	369	컴퓨터활용능력: 1급
441	369	기타: 전기기사
442	370	공학상 은상
443	370	캠퍼스특허유니버시아드 장려상
444	370	한국사검정시험: 고급
445	370	컴퓨터활용능력: 1급
446	370	기타: 전기기사
447	372	취약점 경진대회 수상 3회
448	372	개발 관련 대외활동 2회
449	372	보안 관련 장기 교육 2회
450	373	컴퓨터활용능력: 1급
451	374	인공지능반도체설계 공모전 우수상
452	376	학부연구생 1년
453	376	중앙 운동 동아리 회장
454	376	국내 논문 Best Paper 상 수상
455	376	창업 대회 장려상 수상
456	376	Capstone Design 대상
457	376	기타: 일반기계기사
458	377	학부연구생 1년
459	377	중앙 운동 동아리 회장
460	377	국내 논문 Best Paper 상 수상
461	377	창업 대회 장려상 수상
462	377	Capstone Design 대상
463	377	기타: 일반기계기사
464	378	기타: 일반기계기사
465	379	기타: 자동차운전면허1종보통
466	380	기타: 자동차운전면허1종보통
467	381	컴퓨터활용능력: 1급
468	381	기타: 일반기계기사
469	385	기타: SQLD
470	385	리눅스마스터 2급
471	385	정보처리기사
472	386	특허 출원
473	386	교내 공모전 2회
474	386	졸업작품전시회 2등상
475	387	한국사검정시험: 고급
476	387	기타: 운전면허
477	389	학부연구생 18개월
478	389	우수논문상 수상
479	389	특허 등록 및 출원
480	390	한국사검정시험: 고급
481	390	컴퓨터활용능력: 1급
482	390	기타: 운전면허
483	391	한국사검정시험: 고급
484	391	컴퓨터활용능력: 1급
485	391	기타: 전기기사
486	391	전기공사기사
487	392	컴퓨터활용능력: 2급
488	393	우수논문상 수상
489	393	VE경진대회 입상
490	394	수상 3회
491	394	대외활동 다수
492	394	공모전 3회
493	399	기타: 건축기사
494	400	컴퓨터활용능력: 1급
495	400	기타: aws ccp
496	407	유아교육
497	407	영어영문
498	408	2023 캡스톤디자인 올림피아드
499	408	2023 캡스톤디자인 경진대회
500	408	포스코 SNNC 共 아이디어 공모전
501	408	한국철강협회 제17회 Steel Challenge 대회
502	408	2022년 포스코엠텍 신규사업 아이디어 공모전
503	408	기타: 빅데이터실무활용능력1급제강기능사
504	413	컴퓨터 활용 능력
505	413	품질경영기사
506	415	SQLD
507	415	리눅스마스터 2급
508	415	정보처리기사
509	416	정보처리기사
510	417	기타: 정보처리기사
511	418	기타: 정보처리기사
512	419	기타: 정보처리기사
513	420	기타: 정보처리기사
514	425	공모전 2회 수상
515	426	한국사검정시험: 고급
516	426	컴퓨터활용능력: 1급
517	426	기타: 지게차운전 기능사
518	430	우수논문상 수상
519	430	VE경진대회 입상
520	431	우수논문상 수상
521	431	VE 경진대회 입상
522	431	한국사검정시험
523	431	컴퓨터활용능력
524	433	(동아리 활동) 전기공학부 학술동아리 회장
525	433	취업직무동아리 팀장
526	433	(연구회) 대학원생 학술 연구회
527	433	(대외활동: 기타사회활동) 한국장학재단 사회리더 대학생 멘토링 11기
528	433	(팀 프로젝트) 설계프로젝트
529	433	(공모전 및 수상) 2022 대한전기학회 전기물성·응용부문회 추계학술대회 우수논문상
530	433	2021학년도 직무분석 경진대회 2위(최우수)
531	433	2021 대한전기협회 전기·에너지 분야 국민 아이디어 공모전 정책제안 부문 은상
532	433	2021년도 캡스톤 디자인 졸업작품전 4위(장려)
533	433	2021 학내 공모전 1위(총장상)
534	443	한국사검정시험: 고급
535	443	컴퓨터활용능력: 1급
536	443	기타: 위험물산업기사
537	444	기타: 운전면허1종보통
538	445	한국세라믹학회 2023 캡스톤디자인 올림피아드
539	445	2023 캡스톤디자인 경진대회
540	445	포스코 SNNC 共 아이디어 공모전
541	445	한국철강협회 제17회 Steel Challenge 대회
542	445	2022년 포스코엠텍 신규사업 아이디어 공모전
543	445	한국사검정시험: 고급
544	445	기타: 빅데이터실무활용능력1급제강기능사
545	446	컴퓨터활용능력: 1급
546	446	기타: 일반기계기사
547	446	건설기계설비기사
548	446	공조냉동기계기사
549	447	한국사검정시험: 고급
550	447	컴퓨터활용능력: 1급
551	447	기타: 일반기계기사
552	447	건설기계설비기사
553	447	공조냉동기계기사
554	448	한국사검정시험: 고급
555	448	컴퓨터활용능력: 1급
556	448	기타: 일반기계기사
557	448	건설기계설비기사
558	448	공조냉동기계기사
559	449	컴퓨터활용능력: 1급
560	449	기타: 일반기계기사
561	449	건설기계설비기사
562	449	공조냉동기계기사
563	450	대외활동 3회
564	450	수상경력 4회
565	450	공모전 1회
566	450	봉사활동 1회
567	450	기타: 금속재료기사
568	451	서포터즈 2회
569	451	공모전 1회
570	451	수상경력4회
571	451	한국사검정시험: 중급
572	451	기타: 금속재료기사
573	452	기타: 정보처리기사
574	453	교내수상3회
575	453	학회논문1회
576	453	교육2회
577	453	컴퓨터활용능력: 1급
578	453	기타: 공조냉동기계기사
579	454	메타버스경진대회우수상
580	454	OPC오랄발표
581	457	기타: 일반기계기사
582	457	건설기계설비기사
583	459	한국사검정시험: 중급
584	459	컴퓨터활용능력: 2급
585	459	기타: SQLD
586	463	한국사검정시험: 고급
587	463	컴퓨터활용능력: 1급
588	465	학부연구생 1년
589	465	중앙 운동 동아리 회장
590	465	국내 논문 Best Paper 상 수상
591	465	창업 대회 장려상 수상
592	465	Capstone Design 대상
593	465	기타: 일반기계기사
594	467	한국사검정시험: 고급
595	467	컴퓨터활용능력: 1급
596	468	한국사검정시험: 고급
597	468	컴퓨터활용능력: 1급
598	469	한국사검정시험: 고급
599	469	컴퓨터활용능력: 1급
600	470	한국사검정시험: 고급
601	470	컴퓨터활용능력: 1급
602	471	한국사검정시험: 고급
603	471	컴퓨터활용능력: 1급
604	473	세종건축문화제 건축상 우수상
605	473	졸업전시 대상
606	475	기타: 운전면허 2종 보통
607	476	컴퓨터활용능력: 1급
608	476	기타: 일반기계기사
609	476	공조냉동기계기사
610	476	건설기계설비기사
611	480	한국사검정시험: 고급
612	480	기타: 건축기사
613	482	유아교육과
614	482	한국사검정시험:
615	482	컴퓨터활용능력:
616	482	기타: 정교사2급
617	483	한국사검정시험: 고급
618	483	컴퓨터활용능력:
619	483	기타: 투자자산운용사
620	484	한국사검정시험: 고급
621	484	컴퓨터활용능력:
622	484	기타:
623	485	한국사검정시험:
624	485	컴퓨터활용능력: 1급
625	485	기타: 품질경영기사
626	485	일반기계기사
627	486	일반기계기사
628	487	한국사검정시험: 고급
629	487	기타: 일반기계기사
630	488	한국사검정시험: 고급
631	488	컴퓨터활용능력:
632	488	기타: 전기기능사
633	488	일반기계기사
634	489	한국사검정시험:
635	489	컴퓨터활용능력:
636	489	기타:
637	490	한국사검정시험:
638	490	컴퓨터활용능력:
639	490	기타:
640	492	기타: 정보처리기사
641	493	한국사검정시험:
642	493	컴퓨터활용능력:
643	493	기타:
644	494	창의적 공학 설계 경진대회 최우수상
645	494	한국사검정시험:
646	494	컴퓨터활용능력:
647	494	기타:
648	495	창의적 공학 설계 경진대회 최우수상
649	495	한국사검정시험:
650	495	컴퓨터활용능력:
651	495	기타:
652	496	한국사검정시험:
653	496	컴퓨터활용능력:
654	496	기타: 빅데이터분석기사
655	497	한국사검정시험:
656	497	컴퓨터활용능력:
657	497	기타: 빅데이터분석기사
658	497	ADsP
659	498	한국사검정시험: 고급
660	498	컴퓨터활용능력: 1급
661	498	기타:
662	499	한국사검정시험: 고급
663	499	컴퓨터활용능력:
664	499	기타:
665	500	한국사검정시험:
666	500	컴퓨터활용능력:
667	500	기타:
668	501	한국사검정시험:
669	501	컴퓨터활용능력:
670	501	기타:
671	505	한국사검정시험:
672	505	컴퓨터활용능력:
673	505	기타: GAIQ
674	506	한국사검정시험: 고급
675	506	컴퓨터활용능력: 1급
676	508	컴퓨터활용능력: 2급
677	508	기타: 정보처리기능사
678	514	한국사검정시험: 고급
679	514	컴퓨터활용능력: 1급
680	515	기타: 일반기계기사
681	515	건설기계설비기사
682	516	기타: 일반기계기사
683	516	건설기계설비기사
684	519	경남지역 창업경진대회 우수상
685	520	한국사검정시험: 고급
686	520	컴퓨터활용능력: 1급
687	520	기타: 일반기계기사
688	521	한국사검정시험: 고급
689	521	컴퓨터활용능력:
690	521	기타:
691	522	한국사검정시험:
692	522	컴퓨터활용능력:
693	522	기타:
694	523	한국사검정시험:
695	523	컴퓨터활용능력:
696	523	기타:
697	524	DACON 데이터분석 대회 수상
698	524	한국사검정시험:
699	524	컴퓨터활용능력:
700	524	기타:
701	525	DACON 데이터분석 대회 수상
702	525	한국사검정시험:
703	525	컴퓨터활용능력:
704	525	기타:
705	526	한국사검정시험:
706	526	컴퓨터활용능력: 1급
707	526	기타:
708	527	DACON 데이터분석 대회 수상
709	527	한국사검정시험:
710	527	컴퓨터활용능력:
711	527	기타:
712	529	한국사검정시험:
713	529	컴퓨터활용능력:
714	529	기타:
715	530	기타: 자동차운전면허 1종보통
716	531	기타: 자동차정비산업기사
717	531	전기기능사
718	531	설비보전기능사
719	531	자동차차체수리 기능사
720	532	컴퓨터활용능력: 2급
721	532	기타: 산업안전기사
722	532	ERP회계정보관리사
723	532	재경관리사
724	533	공학상 은상
725	533	캠퍼스특허유니버시아드 장려상
726	533	한국사검정시험: 고급
727	533	컴퓨터활용능력: 1급
728	533	기타: 전기기사
729	533	전기공사기사
730	534	기타: 산업안전기사
731	534	위험물 산업기사
732	534	대기환경기사
733	538	한국사검정시험:
734	538	컴퓨터활용능력:
735	538	기타: 물류관리사
736	538	ADsP
737	539	한국사검정시험: 고급
738	539	기타: 자동차운전면허 2종보통
739	540	한국사검정시험: 고급
740	540	컴퓨터활용능력: 1급
741	540	기타: 전기기사
742	540	전기공사기사
743	541	교내 단기연구프로그램 수상
744	544	부산대학교 특허 공모전(장려)
745	544	캡스톤 디자인(장려)
746	544	대외활동 최우수상(2회)
747	545	경진대회 1회 참여
748	545	캡스톤 디자인 프로젝트 2회 참여
749	547	한국사검정시험: 고급
750	547	컴퓨터활용능력: 1급
751	547	기타: 전기기사
752	547	전기공사기사
753	549	한국사검정시험: 고급
754	549	컴퓨터활용능력: 1급
755	549	기타: 전기기사
756	549	전기공사기사
757	550	한국사검정시험:
758	550	컴퓨터활용능력:
759	550	기타: sqld
760	551	컴퓨터활용능력: 1급
761	552	화공기사
762	552	위험물산업기사
763	552	데이터분석준전문가
764	553	기타: 화공기사
765	553	위험물산업기사
766	553	데이터분석준전문가
767	554	기타: 화공기사
768	554	위험물산업기사
769	554	데이터분석준전문가
770	557	한국남부발전 서포터즈 + 개인우수상
771	557	팀장려상
772	557	한국사검정시험: 고급
773	557	컴퓨터활용능력:
774	557	기타: 전기산업기사
775	557	전기기능사
776	558	한국사검정시험: 중급
777	558	컴퓨터활용능력: 1급
778	558	기타: 전기공사기사
779	558	전기기사
780	559	한국사검정시험: 중급
781	559	컴퓨터활용능력: 1급
782	560	기타: 화공기사
783	560	데이터분석준전문가
784	561	한국사검정시험:
785	561	컴퓨터활용능력:
786	561	기타: 산업안전기사
787	561	위험물산업기사
788	562	컴퓨터활용능력: 1급
789	562	기타: 일반기계기사
790	565	컴퓨터활용능력: 1급
791	566	기타: 화공기사
792	566	데이터분석준전문가
793	567	기타: 자동차운전면허1종보통
794	568	배터리 교육
795	570	한국사검정시험: 고급
796	570	기타: 운전면허
797	573	공정실습
798	573	데이터분석 교육
799	574	한국사검정시험: 고급
800	574	컴퓨터활용능력: 2급
801	577	한국사검정시험: 고급
802	577	컴퓨터활용능력: 1급
803	577	기타: 전기기사
804	577	전기공사기사
805	579	컴퓨터활용능력: 1급
806	579	기타: 일반기계기사
807	579	산업안전기사
808	580	기타: 운전면허1종보통
809	581	2023 캡스톤디자인 올림피아드
810	581	2023 캡스톤디자인 경진대회
811	581	포스코 SNNC 共 아이디어 공모전
812	581	한국철강협회 제17회 Steel Challenge 대회
813	581	2022년 포스코엠텍 신규사업 아이디어 공모전
814	581	기타: 빅데이터실무활용능력1급제강기능사
815	582	한국사검정시험: 고급
816	582	운전면허
817	583	대외 수상 경력 3회
818	583	6시그마
819	583	위험물산업기사
820	583	ADsP
821	583	HSK 4급(239)
822	584	컴퓨터활용능력: 2급
823	584	기타: 산업안전기사
824	584	지게차운전기능사
825	585	기타: 산업안전기사
826	585	정보처리기능사
827	587	기타: 산업안전기사
828	588	기타: ADSP
829	588	SQLD
830	588	빅데이터분석기사
831	589	우수논문상 수상
832	589	VE경진대회 입상
833	589	한국사검정시험
834	589	컴퓨터활용능력
835	590	컴퓨터활용능력: 1급
836	590	기타: 전기기사
837	590	전기공사기사
838	591	2023 캡스톤디자인 올림피아드
839	591	2023 캡스톤디자인 경진대회
840	591	포스코 SNNC 共 아이디어 공모전
841	591	한국철강협회 제17회 Steel Challenge 대회
842	591	2022년 포스코엠텍 신규사업 아이디어 공모전
843	591	기타: 빅데이터실무활용능력1급제강기능사
844	592	2023 캡스톤디자인 올림피아드
845	592	2023 캡스톤디자인 경진대회
846	592	포스코 SNNC 共 아이디어 공모전
847	592	한국철강협회 제17회 Steel Challenge 대회
848	592	2022년 포스코엠텍 신규사업 아이디어 공모전
849	592	기타: 빅데이터실무활용능력1급제강기능사
850	593	컴퓨터활용능력: 1급
851	593	기타: 일반기계기사
852	593	건설기계설비기사
853	593	공조냉동기계기사
854	594	교내 연합 동아리
855	594	IT학회 등 활동 2번
856	594	캡스톤디자인 경진대회
857	594	컴퓨터활용능력: 1급
858	594	기타: 품질경영기사
859	594	6 시그마 Green belt
860	594	ADsP
861	595	학회 2번 활동
862	595	학교 연합동아리 활동
863	595	캡스톤디자인 경진대회 등
864	595	컴퓨터활용능력: 1급
865	596	기타: 산업안전기사
866	597	공모전 우수상
867	597	졸업작품 우수상
868	597	컴퓨터활용능력: 1급
869	597	기타: 컬러리스트기사
870	600	학부연구생 1년
871	600	중앙 운동 동아리 회장
872	600	국내 논문 Best Paper 상 수상
873	600	창업 대회 장려상 수상
874	600	Capstone Design 대상
875	601	컴퓨터활용능력: 2급
876	601	기타: 데이터분석 준전문가
877	602	기타: 대기환경산업기사
878	602	위험물산업기사
879	604	GS인턴
880	604	교내공모전 수상
881	604	기타: 위험물산업기사
882	608	한국사검정시험:
883	608	컴퓨터활용능력:
884	608	기타: 산업안전기사
885	608	CATIA_V5 Part
886	608	ERP정보관리사 생산 1급
887	609	일반기계기사
888	610	한국사검정시험:
889	610	컴퓨터활용능력:
890	610	기타: 물류관리사
891	611	기타: 전기산업기사
892	611	전기기사
893	611	전기공사기사
894	611	소방설비기사(전기분야)
895	611	소방설비기사(기계분야)
896	612	한국사검정시험: 고급
897	612	기타: 기사자격증 4개
898	614	기타: 운전면허 2종보통
899	615	기타: 일반기계기사
900	615	건설기계설비기사
901	616	한국사검정시험: 고급
902	616	컴퓨터활용능력:
903	616	기타: 일반기계기사
904	617	한국사검정시험: 고급
905	617	컴퓨터활용능력:
906	617	기타: 일반기계기사
907	618	한국사검정시험:
908	618	컴퓨터활용능력:
909	618	기타:
910	619	한국사검정시험:
911	619	컴퓨터활용능력:
912	619	기타:
913	620	한국사검정시험:
914	620	컴퓨터활용능력:
915	620	기타:
916	621	한국사검정시험:
917	621	컴퓨터활용능력:
918	621	기타:
919	622	한국사검정시험:
920	622	컴퓨터활용능력:
921	622	기타:
922	623	한국사검정시험:
923	623	컴퓨터활용능력:
924	623	기타:
925	624	한국사검정시험:
926	624	컴퓨터활용능력:
927	624	기타:
928	625	한국사검정시험:
929	625	컴퓨터활용능력:
930	625	기타:
931	626	기타: 일반기계기사
932	627	한국사검정시험: 고급
933	627	기타: 전기기능사
934	627	일반기계기사
935	628	한국사검정시험: 고급
936	628	기타: 전기기능사
937	628	기계기사
938	629	한국사검정시험: 고급
939	629	기타: 전기기능사
940	629	기계기사
941	630	한국사검정시험: 고급
942	630	기타: 전기기능사
943	630	기계기사
944	631	한국사검정시험: 고급
945	631	기타: 전기기능사
946	631	기계기사
947	632	기타: 정보처리기사
948	633	충북산학융학본부 교육 수료
949	633	컴퓨터활용능력: 2급
950	633	기타: 화학분석기사
951	634	한국사검정시험: 고급
952	634	컴퓨터활용능력:
953	634	기타: 일반기계기사
954	635	한국사검정시험: 고급
955	635	컴퓨터활용능력:
956	635	기타: 일반기계기사
957	636	한국사검정시험: 고급
958	636	컴퓨터활용능력:
959	636	기타: 전기기능사
960	636	기계기사
961	637	컴퓨터활용능력: 2급
962	638	한국사검정시험:
963	638	컴퓨터활용능력:
964	638	기타: 전기기사
965	638	전기공사기사
966	639	교육 봉사 동아리 1년
967	639	한국사검정시험: 고급
968	639	컴퓨터활용능력: 1급
969	639	기타: 전기공사기사
970	640	한국사검정시험:
971	640	컴퓨터활용능력:
972	640	기타: 전기기사
973	641	한국사검정시험:
974	641	컴퓨터활용능력:
975	641	기타:
976	642	한국사검정시험:
977	642	컴퓨터활용능력:
978	642	기타: 정보처리기사
979	642	MOS 2007 MASTER
980	643	한국사검정시험:
981	643	컴퓨터활용능력: 2급
982	643	기타: 산업안전기사
983	644	한국사검정시험:
984	644	컴퓨터활용능력:
985	644	기타: 전기기사
986	645	한국사검정시험:
987	645	컴퓨터활용능력:
988	645	기타: 전기기사
989	646	한국사검정시험:
990	646	컴퓨터활용능력:
991	646	기타:
992	647	한국사검정시험:
993	647	컴퓨터활용능력:
994	647	기타:
995	648	한국사검정시험: 고급
996	648	컴퓨터활용능력: 1급
997	648	기타: 전기기사
998	648	전기공사기사
999	649	한국사검정시험:
1000	649	컴퓨터활용능력:
1001	649	기타:
1002	650	한국사검정시험:
1003	650	컴퓨터활용능력:
1004	650	기타: 바이오화학제품제조기사
1005	650	식품산업기사
1006	651	한국사검정시험:
1007	651	컴퓨터활용능력:
1008	651	기타: 바이오화학제품제조기사
1009	652	한국사검정시험: 고급
1010	652	컴퓨터활용능력:
1011	652	기타: 전기기능사
1012	653	한국사검정시험: 고급
1013	653	컴퓨터활용능력: 1급
1014	653	기타: 화공기사
1015	653	대기환경기사
1016	654	전국 대학생 캡스톤 디자인 경진대회
1017	654	한국사검정시험: 고급
1018	654	컴퓨터활용능력: 1급
1019	654	기타: 일반기계기사
1020	655	한국사검정시험:
1021	655	컴퓨터활용능력:
1022	655	기타:
1023	656	한국사검정시험: 고급
1024	656	컴퓨터활용능력: 1급
1025	656	기타: 6시그마(GB)
1026	657	한국사검정시험:
1027	657	컴퓨터활용능력:
1028	657	기타: 일반기계기사
1029	657	CAD 기술능력 2급
1030	658	한국사검정시험:
1031	658	컴퓨터활용능력:
1032	658	기타: 일반기계기사
1033	658	CAD기술능력 2급
1034	659	한국사검정시험:
1035	659	컴퓨터활용능력: 2급
1036	659	기타: 산업안전기사
1037	660	한국사검정시험:
1038	660	컴퓨터활용능력:
1039	660	기타: 산업안전기사
1040	661	한국사검정시험:
1041	661	컴퓨터활용능력:
1042	661	기타: 가스기사
1043	662	해외봉사
1044	662	동아리
1045	662	교내활동
1046	662	교내 공모전 수상 2회
1047	662	직무 관련 교육사항 3개
1048	662	한국사검정시험:
1049	662	컴퓨터활용능력:
1050	662	기타: ATC 캐드마스터 1급
1051	663	일반기계기사
1052	663	교환학생 1년
1053	664	한국사검정시험 : 고급
1054	664	품질경영기사
1055	665	한국사검정시험: 고급
1056	665	컴퓨터활용능력: 1급
1057	665	기타:
1058	666	한국사검정시험:
1059	666	컴퓨터활용능력:
1060	666	기타:
1061	667	한국사검정시험:
1062	667	컴퓨터활용능력:
1063	667	기타:
1064	668	한국사검정시험: 고급
1065	668	컴퓨터활용능력: 1급
1066	668	기타: 일반기계기사
1067	668	설비보전기사
1068	668	기계정비산업기사
1069	669	한국사검정시험: 고급
1070	669	컴퓨터활용능력: 1급
1071	669	기타: 일반기계기사
1072	669	설비보전기사
1073	669	기계정비산업기사
1074	670	한국사검정시험: 고급
1075	670	컴퓨터활용능력:
1076	670	기타: 산업안전기사
1077	670	위험물산업기사
1078	671	한국사검정시험: 고급
1079	671	컴퓨터활용능력:
1080	671	기타: 산업안전기사
1081	671	위험물산업기사
1082	672	영상공모전 최우수상1회
1083	672	각종 동아리 임원(대표
1084	672	부대표
1085	672	총무 등)
1086	672	멘토링
1087	672	한국사검정시험: 고급
1088	672	컴퓨터활용능력: 1급
1089	672	기타:
1090	673	영상공모전 최우수상1회
1091	673	각종 동아리 임원(대표
1092	673	부대표
1093	673	총무 등)
1094	673	멘토링
1095	673	한국사검정시험: 고급
1096	673	컴퓨터활용능력: 1급
1097	673	기타:
1098	674	한국사검정시험:
1099	674	컴퓨터활용능력: 1급
1100	674	기타: 전기기사
1101	675	한국사검정시험:
1102	675	컴퓨터활용능력:
1103	675	기타:
1104	676	한국사검정시험:
1105	676	컴퓨터활용능력:
1106	676	기타:
1107	677	한국사검정시험: 고급
1108	677	컴퓨터활용능력:
1109	677	기타: 일반기계기사
1110	677	산업안전기사
1111	678	한국사검정시험: 고급
1112	678	컴퓨터활용능력:
1113	678	기타: 일반기계기사
1114	678	산업안전기사
1115	679	영상공모전 최우수상1회
1116	679	각종 동아리 임원(대표
1117	679	부대표
1118	679	총무 등)
1119	679	멘토링
1120	679	한국사검정시험: 고급
1121	679	컴퓨터활용능력: 1급
1122	679	기타:
1123	680	한국사검정시험:
1124	680	컴퓨터활용능력:
1125	680	기타:
1126	681	한국사검정시험: 고급
1127	681	컴퓨터활용능력:
1128	681	기타: 위험물산업기사
1129	682	한국사검정시험:
1130	682	컴퓨터활용능력:
1131	682	기타:
1132	683	한국사검정시험:
1133	683	컴퓨터활용능력: 1급
1134	683	기타:
1135	684	한국사검정시험:
1136	684	컴퓨터활용능력: 1급
1137	684	기타:
1138	685	한국사검정시험:
1139	685	컴퓨터활용능력: 1급
1140	685	기타:
1141	686	홍보대사
1142	686	서포터즈
1143	686	대장정
1144	686	공모전 최우수상 1회
1145	686	한국사검정시험: 중급
1146	686	컴퓨터활용능력:
1147	686	기타: 금속재료기사
1148	686	정보기기운용기능사
1149	687	한국사검정시험:
1150	687	컴퓨터활용능력:
1151	687	기타:
1152	688	한국사검정시험:
1153	688	컴퓨터활용능력: 2급
1154	688	기타:
1155	689	한국사검정시험:
1156	689	컴퓨터활용능력:
1157	689	기타:
1158	690	공모전 수상 3회
1159	690	한국사검정시험:
1160	690	컴퓨터활용능력:
1161	690	기타:
1162	691	한국사검정시험:
1163	691	컴퓨터활용능력: 2급
1164	691	기타: 식품기사
1165	691	품질경영기사
1166	691	위생사
1167	691	영양사
1168	692	한국사검정시험:
1169	692	컴퓨터활용능력:
1170	692	기타:
1171	693	한국사검정시험:
1172	693	컴퓨터활용능력:
1173	693	기타: 위험물산업기사
1174	694	공모전 6회 수상
1175	694	한국사검정시험:
1176	694	컴퓨터활용능력:
1177	694	기타:
1178	695	서울기술교육센터 시스템반도체 설계과정
1179	695	한국사검정시험:
1180	695	컴퓨터활용능력:
1181	695	기타:
1182	696	홍보대사
1183	696	대장정
1184	696	서포터즈
1185	696	공모전 최우수상 1회
1186	696	한국사검정시험: 중급
1187	696	컴퓨터활용능력:
1188	696	기타: 금속재료기사
1189	696	정보기기운용기능사
1190	697	한국사검정시험:
1191	697	컴퓨터활용능력:
1192	697	기타:
1193	698	한국사검정시험: 고급
1194	698	컴퓨터활용능력:
1195	698	기타: 위험물산업기사
1196	699	한국사검정시험: 고급
1197	699	컴퓨터활용능력:
1198	699	기타: 위험물산업기사
1199	700	한국사검정시험:
1200	700	컴퓨터활용능력: 1급
1201	700	기타:
1202	701	한국사검정시험: 고급
1203	701	컴퓨터활용능력:
1204	701	기타: 산업안전기사
1205	701	위험물산업기사
1206	702	한국사검정시험:
1207	702	컴퓨터활용능력: 2급
1208	702	기타: 식품기사
1209	702	품질경영기사
1210	702	위생사
1211	702	영양사
1212	703	한국사검정시험: 고급
1213	703	컴퓨터활용능력: 1급
1214	703	기타: 품질경영
1215	706	컴퓨터활용능력: 1급
1216	706	기타: 일반기계기사
1217	708	기타: 수질환경기사 대기환경기사 산업안전기사 화공기사
1218	709	한국사검정시험: 고급
1219	709	컴퓨터활용능력: 1급
1220	709	기타: 화공기사
1221	710	한국사검정시험: 고급
1222	710	컴퓨터활용능력: 1급
1223	710	기타: 화공기사
1224	711	기타: 산업안전기사
1225	711	화공기사
1226	711	위험물산업기사
1227	712	기타: 산업안전기사
1228	712	화공기사
1229	712	위험물산업기사
1230	713	졸업논문 최우수상
1231	714	졸업논문 최우수상
1232	715	한국장학재단 사회리더 대학생 멘토링
1233	715	2019년 효성이 그린 지구 공모전 최우수상
1234	715	컴퓨터활용능력: 1급
1235	717	한국사검정시험: 고급
1236	717	컴퓨터활용능력: 1급
1237	717	기타: 공조냉동기계기사
1238	717	MOS MASTER(2010)
1239	719	캡스톤디자인 경진대회 은상
1240	719	한국사검정시험: 고급
1241	719	기타: 일반기계기사
1242	719	공조냉동기계기사
1243	719	산업안전기사
1244	720	기타: 소방설비기사
1245	720	전기기능사
1246	720	1종 대형면허
1247	721	기타: 소방설비기사
1248	721	전기기능사
1249	721	1종 대형면허
1250	722	중앙 동아리 백호우의 주장
1251	722	학과 동아리 설레발의 회장
1252	722	제염해체 로봇 경진대회
1253	722	트라이볼리지연구실
1254	722	캡스톤 경진대회
1255	723	한국사검정시험: 고급
1256	723	컴퓨터활용능력: 2급
1257	723	기타: 일반기계기사
1258	723	산업안전기사
1259	725	교내공모전(숭실공학상 동상
1260	725	캡스톤디자인 장려상)
1261	726	한국사검정시험: 고급
1262	726	컴퓨터활용능력: 1급
1263	727	한국사검정시험: 고급
1264	727	컴퓨터활용능력: 1급
1265	728	한국사검정시험: 고급
1266	728	기타: 대기환경기사
1267	729	한국사검정시험: 중급
1268	729	컴퓨터활용능력: 2급
1269	729	기타: 화공기사
1270	729	화학분석기사
1271	729	위험물산업기사
1272	730	기타: 일반기계기사
1273	730	공조냉동기계기사
1274	731	자작자동차 대회 2회
1275	731	교내 캡스톤디자인
1276	731	기타: 일반기계기사
1277	731	건설기계설비기사
1278	731	소방설비기사(기계분야)
1279	732	기타: 일반기계기사
1280	733	기타: 일반기계기사
1281	734	컴퓨터활용능력: 1급
1282	734	기타: Iso9001
1283	734	iso14001
1284	734	auto cad 2급
1285	734	식스시그마 BB
1286	735	한국사검정시험: 고급
1287	735	컴퓨터활용능력: 1급
1288	735	기타: 품질경영기사. 물류관리사. ERP정보관리사
1289	737	컴퓨터활용능력: 1급
1290	737	기타: 화공기사
1291	739	한국사검정시험: 고급
1292	739	컴퓨터활용능력: 1급
1293	739	기타: 화공기사
1294	740	한국사검정시험: 고급
1295	740	컴퓨터활용능력: 1급
1296	740	기타: 화공기사
1297	741	한국사검정시험: 고급
1298	741	컴퓨터활용능력: 1급
1299	741	기타: 화공기사
1300	742	기타: 전기산업기사
1301	742	산업안전산업기사
1302	743	기타: 전기산업기사
1303	743	산업안전산업기사
1304	745	기타: 일반기계기사
1305	746	(주)에이피피 학교 연계형 인턴 (2개월
1306	746	2018년 상반기)
1307	746	재료연구소 체험형 인턴 (5개월
1308	746	2019년 상반기)
1309	746	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1310	746	대학교 봉사동아리 회장 (6개월)
1311	746	교내 기술나눔 캡스톤 디자인 대상
1312	746	교내 히든챔피언 학생발굴단 대상
1313	746	화학분석기사
1314	746	위험물산업기사
1315	747	(주)에이피피 학교 연계형 인턴 (2개월
1316	747	2018년 상반기)
1317	747	재료연구소 체험형 인턴 (5개월
1318	747	2019년 상반기)
1319	747	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1320	747	대학교 봉사동아리 회장 (6개월)
1321	747	교내 기술나눔 캡스톤 디자인 대상
1322	747	교내 히든챔피언 학생발굴단 대상
1323	747	화학분석기사
1324	747	위험물산업기사
1325	748	삼성전기 인턴
1326	748	컴퓨터활용능력 1급
1327	748	위험물 산업기사
1328	749	품질경영기사
1329	749	컴활 2급
1330	750	(주)에이피피 학교 연계형 인턴 (2개월
1331	750	2018년 상반기)
1332	750	재료연구소 체험형 인턴 (5개월
1333	750	2019년 상반기)
1334	750	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1335	750	대학교 봉사동아리 회장 (6개월)
1336	750	교내 기술나눔 캡스톤 디자인 대상
1337	750	교내 히든챔피언 학생발굴단 대상
1338	750	화학분석기사
1339	750	위험물산업기사
1340	751	(주)에이피피 학교 연계형 인턴 (2개월
1341	751	2018년 상반기)
1342	751	재료연구소 체험형 인턴 (5개월
1343	751	2019년 상반기)
1344	751	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1345	751	대학교 봉사동아리 회장 (6개월)
1346	751	교내 기술나눔 캡스톤 디자인 대상
1347	751	교내 히든챔피언 학생발굴단 대상
1348	751	화학분석기사
1349	751	위험물산업기사
1350	752	(주)에이피피 학교 연계형 인턴 (2개월
1351	752	2018년 상반기)
1352	752	재료연구소 체험형 인턴 (5개월
1353	752	2019년 상반기)
1354	752	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1355	752	대학교 봉사동아리 회장 (6개월)
1356	752	교내 기술나눔 캡스톤 디자인 대상
1357	752	교내 히든챔피언 학생발굴단 대상
1358	752	화학분석기사
1359	752	위험물산업기사
1360	753	(주)에이피피 학교 연계형 인턴 (2개월
1361	753	2018년 상반기)
1362	753	재료연구소 체험형 인턴 (5개월
1363	753	2019년 상반기)
1364	753	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1365	753	대학교 봉사동아리 회장 (6개월)
1366	753	교내 기술나눔 캡스톤 디자인 대상
1367	753	교내 히든챔피언 학생발굴단 대상
1368	753	화학분석기사
1369	753	위험물산업기사
1370	754	(주)에이피피 학교 연계형 인턴 (2개월
1371	754	2018년 상반기)
1372	754	재료연구소 체험형 인턴 (5개월
1373	754	2019년 상반기)
1374	754	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1375	754	대학교 봉사동아리 회장 (6개월)
1376	754	교내 기술나눔 캡스톤 디자인 대상
1377	754	교내 히든챔피언 학생발굴단 대상
1378	754	화학분석기사
1379	754	위험물산업기사
1380	755	(주)에이피피 학교 연계형 인턴 (2개월
1381	755	2018년 상반기)
1382	755	재료연구소 체험형 인턴 (5개월
1383	755	2019년 상반기)
1384	755	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1385	755	대학교 봉사동아리 회장 (6개월)
1386	755	교내 기술나눔 캡스톤 디자인 대상
1387	755	교내 히든챔피언 학생발굴단 대상
1388	755	화학분석기사
1389	755	위험물산업기사
1390	756	일반기계기사
1391	757	일반기계기사
1392	758	슈나이더일렉트릭 대학생공모전(9개월)
1393	758	2018년 여름방학 현장실습(4주)
1394	758	전기기사
1395	758	전기공사기사
1396	759	국제 캡스톤 디자인 캠프 - 대상
1397	759	교내 영어회화 동아리 회장 3년
1398	759	부산아시아드볼런티어 봉사단 봉사활동(6개월)
1399	759	산업안전기사
1400	759	ERP정보관리사 생산1급
1401	759	컴퓨터 활용능력 2급
1402	759	생산현장관리사 2급
1403	761	동아리 활동 2회
1404	761	공모전 수상 1회
1405	767	차세대 에너지 융합 기술 경진대회 우수상
1406	767	전북대학교 문화인재 청년 웅비상
1407	767	해외봉사 사례 경진대회 우수상
1408	767	한국 플랜트 건설 연구원 해외 플랜트 양성교육 (3개월)
1409	767	기업의 달인되기 실무 인재상
1410	767	해외 배낭여행 29개국
1411	767	해외 봉사 (1개월)
1412	767	미국교환학생 (1년)
1413	767	미국학회참여(2개월)
1414	767	생산관리 직무교육(2개월)
1415	767	플랜트 엔지니어 1급
1416	767	화공기사
1417	767	컴활 1급
1418	767	텔레마케팅 관리사
1419	767	운전면허증 1종 대형
1420	767	TOPEC 540
1421	768	(주)에이피피 학교 연계형 인턴 (2개월
1422	768	2018년 상반기)
1423	768	재료연구소 체험형 인턴 (5개월
1424	768	2019년 상반기)
1425	768	한국나노기술원 주관 나노드림 교육봉사단 9기 (9개월)
1426	768	대학교 봉사동아리 회장 (6개월)
1427	768	교내 기술나눔 캡스톤 디자인 대상
1428	768	교내 히든챔피언 학생발굴단 대상
1429	768	화학분석기사
1430	768	위험물산업기사
1431	781	대외 수상 있음
1432	789	차세대 에너지 융합 기술 경진대회 우수상
1433	789	전북대학교 문화인재 청년 웅비상
1434	789	해외봉사 사례 경진대회 우수상
1435	789	한국 플랜트 건설 연구원 해외 플랜트 양성교육 (3개월)
1436	789	기업의 달인되기 실무 인재상
1437	789	해외 배낭여행 29개국
1438	789	해외 봉사 (1개월)
1439	789	미국교환학생 (1년)
1440	789	미국학회참여(2개월)
1441	789	생산관리 직무교육(2개월)
1442	789	플랜트 엔지니어 1급
1443	789	화공기사
1444	789	컴활 1급
1445	789	텔레마케팅 관리사
1446	789	운전면허증 1종 대형
1447	789	TOPEC 540
1448	790	차세대 에너지 융합 기술 경진대회 우수상
1449	790	전북대학교 문화인재 청년 웅비상
1450	790	해외봉사 사례 경진대회 우수상
1451	790	한국 플랜트 건설 연구원 해외 플랜트 양성교육 (3개월)
1452	790	기업의 달인되기 실무 인재상
1453	790	해외 배낭여행 29개국
1454	790	해외 봉사 (1개월)
1455	790	미국교환학생 (1년)
1456	790	미국학회참여(2개월)
1457	790	생산관리 직무교육(2개월)
1458	790	플랜트 엔지니어 1급
1459	790	화공기사
1460	790	컴활 1급
1461	790	텔레마케팅 관리사
1462	790	운전면허증 1종 대형
1463	790	TOPEC 540
1464	796	공모전 1회
1465	796	인턴 0회
1466	796	대외활동은 동아리3개
1467	796	번역봉사
1468	796	해외봉사
1469	796	교육봉사
1470	806	인턴2회
1471	806	수상 5회
1472	807	현장실습
1473	807	공모전 수상
1474	808	캠퍼스 특허전략 유니버시아드
1475	813	자격증 2개
1476	813	공모전 수상
1477	814	자격증 1
1478	866	석사과정 논문2편
1479	866	특허 1편
1480	882	인턴 1회
1481	882	수상 4회
1482	882	자격증 4개
1483	888	화공학회 동상수상
1484	888	교육봉사 1회
1485	892	한국기술교육대학교
1486	910	인턴 중소기업 1회
1487	910	공학프로젝트 참여 5회
1488	910	일반기계기사
1489	910	컴활1급
1490	910	6시그마GB
1491	910	한국사
1492	928	공모전 수상 1회
1493	928	연구소
1494	931	교육봉사 3개월
1495	947	봉사단체 3회
1496	947	공모전 수상 3회
1497	953	GCTI 창의연구공모전 동상
1498	953	항공연구동아리 KHARI 활동
1499	953	UN 산하교육기구 UNAI 활동
1500	968	해외봉사동아리
1501	968	자격증 3
1502	970	봉사활동1 - 교육봉사
1503	994	교육봉사활동 대표교사
1504	1004	전국 기술사업화 경진대회 대상(장관상)
1505	1004	공과대학 Capstone Design 경진대회 최우수상(총장상)
1506	1006	중소기업 기술연구소 현장실습 1개월
1507	1006	학술동아리 활동 1개(수상경력x)
1508	1006	보육원 교사 4개월
1509	1011	교육 봉사 6개월
1510	1027	인턴 1회
1511	1027	공모전 수상 1회
1512	1031	특허전략 유니버시아드 수상
1513	1036	공모전 2회 수상
1514	1039	인턴 1회
1515	1039	수상경력 2회
1516	1052	인턴1회
1517	1052	학술대회 우수논문상
1518	1057	대외활동2
1519	1057	공모전1
1520	1057	자격증2
1521	1085	전국대회 수상경력 2회
1522	1089	특허전략 유니버시아드 수상
1523	1093	공모전 수상 2회
1524	1109	교환학생 1회
1525	1109	봉사활동 1회
1526	1109	교내대회 수상 1회
1527	1112	인턴 1회 한화 계열사
1528	1112	봉사활동 교육봉사 2개 총 2년
1529	1112	공모전 아이디어관련 공모전 5개 수상
1530	1112	자격증 직무관련 2개 전공관련 산업기사 2개 워드2급 1개 총 5개
1531	1112	학내 창업동아리활동 1년
1532	1122	공모전 2회(수상 2회)
1533	1123	수상경력2회
1534	1153	농촌봉사활동 1주 1회
1535	1153	학생회 부학생회장까지 경험 자격증 : 일반기계기사
1536	1153	한국사1급
1537	1153	한자2급
1538	1154	공모전 3회 수상
1539	1154	동아리 활동
1540	1159	인턴 2회
1541	1159	자격증 1개
1542	1163	교육봉사 3회
1543	1163	동아리 회장
1544	1164	봉사활동 1
1545	1164	수상 경력 1
1546	1166	전기공사기사한국사 1급
1547	1166	인턴 1회
1548	1183	교내 캡스톤 경진대회 금상
1549	1189	교내 캡스톤 경진대회 금상
1550	1189	2014 공학교육페스티벌
1551	1190	공모전 수상 2회
1552	1206	봉사활동 400시간
1553	1206	해외봉사활동
1554	1206	각종 공모전 및 다수 수상 경험
1555	1215	제4회 전국 화학공학 공정설계 경진대회 최우수상 (수상 예정) 인턴 경험 무
1556	1225	전국학생선박설계대회 최우수상
1557	1228	수상경력 4회
1558	1246	인턴-1 대외활동-3 수상경력3 봉사활동-150시간
1559	1250	해외연수 1년
1560	1250	자격증 2개
1561	1250	교육 1회
1562	1272	봉사활동 400시간 이상
1563	1272	해외봉사활동
1564	1272	다수 대내외 활동
1565	1272	수상경험
1566	1290	자격증 2개
1567	1290	현장실습
1568	1296	사회봉사활동 126시간
1569	1296	공모전 2회 수상
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (company_id, company_name, company_url, industry, etc) FROM stdin;
\.


--
-- Data for Name: job_postings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_postings (posting_id, company_id, job_id, title, qualification, preferred, tech_stack, salary, posting_url, created_at, deadline) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (job_id, job_name, job_category) FROM stdin;
\.


--
-- Data for Name: recruit_qualifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recruit_qualifications (id, company_name, company_type, main_job, detail_job, location, education_level, major, experience_years, language_requirement, military_requirement, overseas_available, etc_requirements, process, job_category) FROM stdin;
1	삼성전자	대기업	데이터 분석	AI 모델 개발	서울 강남구	학사	컴퓨터공학	2	TOEIC 850 이상	병역필	가능	자격증 우대: ADsP	서류 → 코딩테스트 → 면접 → 최종합격	\N
2	Deloitte 안진회계법인	외국계기업			서울 영등포구			0		무관	무관			IT/인터넷
3	현대피엔에스	대기업		세종R&D센터	세종특별자치시	학사	전기 계열	5		무관	무관	경력 사항  대리 과장급 : 관련 직무 경력 5년 이상  사원급 : 관련 직무 경력 3년 이상  학위/전공 학사 이상 전기, 전자 관련 전공자 또는 관련 직무 수행 가능한 자는 전공 무관  성별/연령 (성별무관)  어학/자격증 : 무관	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
4	한국동서발전	공공기관/공기업			울산 중구, 충남 당진시, 강원특별자치도 동해시, 경기 고양시 일산동구, 대전 유성구			0		무관	무관			IT/인터넷
5	카카오	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
6	대한지방행정공제회	비영리단체/협회/재단	경영/사무, IT/인터넷	일반				0		무관	무관			IT/인터넷
7	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			IT/인터넷
8	한국원자력협력재단	비영리단체/협회/재단	해외					0		무관	무관			IT/인터넷
9	포스코DX	대기업		전기설계	경북 포항시 남구, 전남 광양시, 경기 성남시 분당구	학사		0	영어 성적 요구	필수	필수	4년제 대학 졸업(예정)자 영어 어학성적 보유자 회사가 지정한 일자에 인턴활동 및 입사가 가능한 자 '25. 6. 1 이전 병역필(예정) 또는 면제자로 해외여행에 결격사유가 없는 자 영어 말하기 성적은 '23. 5. 22 이후 취득 성적만 인정		IT/인터넷
10	세정아이앤씨	중소기업		IT개발자	부산 금정구			3		무관	무관	대학 졸업자 및 2025년 졸업예정자  유관경력 3년 미만 (경력)	[전형 안내]\n서류전형 - 인적성검사 - 면접전형 - 최종합격	IT/인터넷
11	PFCT	스타트업			서울 서초구			0		무관	무관			IT/인터넷
12	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
13	네이버웹툰	대기업		글로벌 웹툰 Creative Video 제작	경기 성남시 분당구			0	영어 성적 요구	무관	무관	Adobe Premiere Pro, After Effects, Adobe CC, Figma 등 다양한 디자인 및 영상 편집 툴에 대한 높은 숙련도를 보유하신 분  영어/중국어/인니어/태국어 중 1개 언어를 구사하실 수 있는 분 (필수) *각 언어 별로 채용을 진행합니다.  웹툰 및 만화 콘텐츠에 대한 높은 애정과 이해도를 보유하신 분  웹툰/애니/게임 감성의 리터칭, 이펙트 스킬 및 일러스트레이션 등의 작화 스킬을 보유하신 분		IT/인터넷
14	아이쓰리시스템	스타트업			대전 유성구			0		무관	무관			IT/인터넷
15	LG CNS	대기업		SAP BC(Basis Consultant)	서울 강서구, 서울 강서구			0		무관	무관	SAP ERP 프로젝트(SI) 또는 운영 업무(SM)에서 5년 이상 BC 역할을 경험하신 분  SAP BTP(Business Technology Platform) 기반 업무를 경험하신 분		IT/인터넷
16	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			IT/인터넷
17	Tossplace	기타	미디어, 경영/사무, IT/인터넷					0		무관	무관			IT/인터넷
18	포스코DX	대기업			경북 포항시 남구, 전남 광양시			0		무관	무관			IT/인터넷
19	국립공원공단	공공기관/공기업		일반직(6급)_공원행정	경남 진주시, 전북특별자치도 전주시 덕진구, 충남 공주시, 강원특별자치도 원주시, 경북 영주시			0		무관	무관		[전형 안내]\n서류전형 - 필기전형 - 역량검사 - 면접전형 - 최종합격	IT/인터넷
20	LG이노텍	대기업			서울 강서구			0		무관	무관			IT/인터넷
21	네이버클라우드	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
22	네이버클라우드	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
23	한양대학교	기타		사무직-일반행정	서울 성동구, 경기 안산시 상록구			0		필수	필수	해외여행에 결격사유가 없는 자  병역필 또는 면제자  공무원 임용에 결격사유가 없는 자	[전형 안내]\n서류전형 - AI인적성검사 - 면접전형 - 최종합격	IT/인터넷
24	파괴연구소	대기업		아트디렉터	서울 강남구			0		무관	무관			IT/인터넷
25	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			IT/인터넷
26	SM엔터테인먼트	대기업			서울 성동구			0		무관	무관			IT/인터넷
27	스타쉽엔터테인먼트	대기업			서울 강남구	학사		0		무관	무관	학력 : 대졸 이상 경력 : 무관 영상 편집 기술 보유자(Adobe계열 프로그램 필수)  디자인 기획 능력 보유자  영상 촬영에 대한 기초 지식 보유 및 전반적인 영상 제작 업무 가능자  엔터테인먼트 및 문화 사업에 관심이 많은 분  책임과 애정을 갖고 업무를 수행하는 분		IT/인터넷
28	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			IT/인터넷
29	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			IT/인터넷
30	케이씨텍	중견기업						0		무관	무관			IT/인터넷
31	한국신용정보원	공공기관/공기업		일반	서울 중구	학사		0		무관	무관	학사 이상 (2025년 8월 졸업예정자 포함)	[전형 안내]\n서류 전형 - 필기전형 - 면접전형 - 최종합격	IT/인터넷
32	케이씨텍	중견기업	생산/제조, IT/인터넷					0		무관	무관			IT/인터넷
33	아디다스코리아	대기업			서울 서초구			0		무관	무관			IT/인터넷
34	넥슨네트웍스	대기업		게임QA	경기 성남시 분당구			0		무관	무관	게임을 다양하고 깊게 즐기시는 분  게임 콘텐츠와 게임 플랫폼에 대한 이해도를 보유하신 분  긍정적, 적극적, 논리적으로 커뮤니케이션하시는 분  기획서나 구현된 결과물을 통해 프로세스 및 작동 순서를 이해하실 수 있는 분 게임 로그, 중요 결함 사례 및 히스토리를 학습하고 개선점을 생각할 수 있는 분  습득한 경험과 노하우를 기록하여 활용하고 공유할 수 있는 분	[전형 안내]\n서류전형 → 온라인 인성검사 → 실무진 면접 → 인턴 최종 합격 → 인턴십(6개월) → 전환평가	IT/인터넷
35	Grand BK, Corp.	외국계기업	해외					0		무관	무관			IT/인터넷
36	순수본	중견기업		온라인 몰 콘텐츠 웹디자이너	서울 영등포구			0		무관	무관	각종 업무 툴 활용에 능숙하신 분 (Figma, Photoshop, Illustrator) 손이 빠르고 다량의 콘텐츠를 효율적으로 작업할 수 있는 분 음식/식품군 제품의 콘텐츠 디자인에 익숙한 분 타 부서와 협업 및 피드백 커뮤니케이션 능력을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
37	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
38	더그로스	중소기업		글로우엠 콘텐츠 마케터 인턴	서울 송파구			0		무관	무관	최신 마케팅 트렌드에 능통하신 분 트렌드 분석 및 예측 능력을 바탕으로 브랜드 가치를 상승시킬 수 있으신 분 소비자들의 즉각적, 실제적인 반응을 통해 최고 효율의 마케팅을 찾아가며 성장하고 싶으신 분	[전형 안내]\n서류 전형 > 1차 인터뷰 > 2차 인터뷰 > 처우협의 > 최종 합격	IT/인터넷
39	PTKOREA	외국계기업		웹사이트 운영 프로젝트 영문 콘텐츠 검수 및 QA	서울 강남구	학사		0		무관	무관	학사 이상이신 분 (휴학생, 졸업예정자, 기졸업자)  MS Office 사용이 원활하신 분 (ppt, excel)  원활한 커뮤니케이션 역량을 보유하신 분	[전형 안내]\n서류전형 - 1차면접 - 최종합격\n\n서류 전형 - 인성검사 - 면접전형 - 최종합격	IT/인터넷
40	한국토지주택공사	공공기관/공기업			서울 강남구, 인천 남동구, 대구 달서구, 대전 서구, 광주 서구			0		무관	무관			IT/인터넷
41	현대자동차	대기업		제조 IT / 산업 자동화 데이터 엔지니어	서울 서초구	학사	전기 계열	0	영어 성적 요구	무관	무관	컴퓨터공학, 전기공학, 컴퓨터과학, 산업공학 또는 관련 분야에서 학사 이상의 학위를 보유하신 분  7년 이상의 Kepware, Cybus, HiveMQ, Litmus, Softing AG, Ignition, UNS, Sightmachine, AVEVA, Siemens, Rockwell, Beckhoff 등 산업 관련 OT/IT수집체계, 자동화SW 개발 또는 전개 관련 경력을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
42	현대자동차	대기업		제조 DX 솔루션 / 시스템 아키텍트	서울 서초구	학사	전기 계열	0	영어 성적 요구	무관	무관	컴퓨터/전기/산업공학, 컴퓨터과학 등의 관련 분야에서 학사 이상의 학위를 보유하신 분  10년 이상의 제조 시스템/솔루션 아키텍처 및 IIOT 솔루션 구현(인프라 측면 및 데이터 파이프라인을 고려)에 대한 경력(기술 서비스/ 컨설팅 업체)을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
43	현대자동차	대기업		MES 개발 및 합리화 전략 기획	서울 서초구	학사	컴퓨터 계열	0	영어 성적 요구	무관	무관	컴퓨터 과학, 정보 기술 또는 관련 분야에서 학사 이상의 학위를 보유하신 분  5년 이상의 MES(Siemens, Wonderware 등) 전개 및 활용 경력을 보유하신 분  IT시스템 프로젝트 및 벤더 관리 경험을 보유하신 분  MES의 핵심 구성 요소에 대한 이해와 소프트웨어 설계 제작 경험을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
44	PTKOREA	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
45	한국항공우주연구원	기타			대전 유성구			0		무관	무관			IT/인터넷
46	통계청	공공기관/공기업	IT/인터넷					0		무관	무관			IT/인터넷
47	한국타이어앤테크놀로지	대기업		R&D_Virtual Simulation 툴 개발 및 응용	대전 유성구	석사	기계 계열	0		무관	무관	1. 기계 계열 전공자 2. 석사/박사 과정 중 고체역학과 수치해석 관련 업무 능력 보유자 (연속체 역학, 유한요소법 이수 등) 3 다양한 CAE Tool 활용 지식(FEM, CFD 등)  보유 및 사용 유경험자 (abaqus 등) 4. Computational mechanics 연구 경험 보유자 (토목 공학 전공 자 가능)	[전형 안내]\n서류전형 - HKAT - 면접전형 - 최종합격	IT/인터넷
48	(주)지로	중소기업		프로덕트 디자이너 인턴	서울 강남구			0		무관	무관	사용자 친화적인 UI/UX 디자인을 위한 시각적 감각을 보유하신 분 레이아웃, 폰트, 컬러 등 디자인 기본기가 탄탄하신 분 Figma 툴의 디자인 시스템을 포함한 다양한 기능을 능숙하게 활용할 수 있는 분 디자인 의도를 논리적으로 설명할 수 있는 커뮤니케이션 역량을 갖추신 분 새로운 기술과 지식을 학습하는 데 거부감이 없고, 빠르게 학습하실 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
49	트라닉스	대기업		재무	충남 서산시			0		무관	무관			IT/인터넷
50	라이드플럭스	스타트업		Mapping SW Engineer	서울 영등포구, 제주특별자치도 제주시	석사		0		무관	무관	현재 재학 중인 학/석사 졸업생 및 졸업예정자는 비대상입니다.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
51	플리토	중소기업			서울 강남구			0		무관	무관	신입 및 경력 (학력 무관)  IT 서비스의 네트워크 및 보안 등의 기본 지식 보유하신 분  운전면허 보유 및 차량 운전 가능하신 분  국내 출장 및 외근 가능하신 분		IT/인터넷
52	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			IT/인터넷
53	셀트리온	대기업			인천 연수구			0		무관	무관			IT/인터넷
54	한국투자증권	대기업			서울 영등포구			0		무관	무관			IT/인터넷
55	바카티오	중소기업		Backend Engineer 인턴	서울 마포구			0		무관	무관	문제 해결을 위해 다방면으로 고민하는 분 필요에 따라 수용할 수 있는 열린 자세를 가지신 분 다른 직무와의 커뮤니케이션에 익숙한 분 LLM API 활용하여 서비스 개발한 경험이 있는 분 ElasticSearch 검색엔진을 이용한 RAG 를 도입한 경험이 있는 분 Docker 를 적극적으로 활용하여 인프라를 관리, 유지 보수한 경험이 있는 분 AI Tool (예. Cursor) 을 활용하여 생산성 높은 프로그래밍 경험이 있는 분 팀 단위 개발 생산성을 위해 기여한 경험이 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
108	스카이랩스	스타트업		HW 개발	경기 성남시 분당구		전기 계열	0		무관	무관	대학 재학 또는 졸업자, 공학계열(전기/전자/컴퓨터/소프트웨어) 신입 가능	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1496	LSP USA, LLC	기타						0		무관	무관			IT/인터넷
56	슈퍼센트	중소기업		AI 기술 리서치	서울 송파구			0		무관	무관	AI 기술에 높은 관심을 가지고 있고, 적극적으로 배우려는 자세를 갖추신 분 새로운 기술을 빠르게 익히고 실무에 적용하는 데 흥미를 느끼시는 분 디지털 콘텐츠 플랫폼 및 SNS를 능숙하게 다루시는 분 정보를 명확하게 정리하고 전달하는 커뮤니케이션 역량을 갖추신 분 현재 졸업 또는 졸업 예정이며, 3개월 인턴십 이후 입사 가능하신 분	[전형 안내]\n서류 전형 → 과제전형 → 인터뷰 → 처우 협의 → 최종 합격	IT/인터넷
57	한국공항공사	공공기관/공기업			서울 강서구			0		무관	무관			IT/인터넷
58	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			IT/인터넷
59	에고이즘	중소기업			서울 성동구			0		무관	무관			IT/인터넷
60	플랜핏	중소기업	IT/인터넷					0		무관	무관	IT 서비스 PM & PO 관련된 업무에 관해 실제로 경험이 있는 분  사용자와 대화에 두려움이 없으며 사용자 관점에서 생각하며 사용자에게 관심이 많은 분  데이터를 통해 문제를 파악하고 데이터를 측정하여 해당 데이터에 기반한 논리적인 의사 결정을 내릴 수 있는 분  다양한 분야의 이해관계자(팀원 및 외부인)와 효율적인 커뮤니케이션이 가능한 분	[인재 영입 프로세스]\n- 서류 전형 -> 1차 직무 인터뷰 -> 2차 컬쳐핏 인터뷰 -> 최종 합격	IT/인터넷
61	리얼드로우	중소기업		SW Engineer	서울 마포구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격\n\n*이메일 접수: people@realdraw.ai\n(이력서, 포트폴리오)	IT/인터넷
62	주식회사 화이트큐브	스타트업		콘텐츠 디자이너 인턴	서울 강남구			0		무관	무관	그래픽 툴(Figma, Photoshop, Illustrator 등)을 활용한 디자인이 가능하신 분 비즈니스 성장을 위한 다양한 프로젝트 기획 및 디자인 가능하신 분 디자인 결과물의 성과 데이터를 함께 확인하고 개선하여 ’비즈니스 성과’를 달성하고 싶은 분 ex) 상품 소개서 개선을 통한 B2B 계약 전환율 상승, 광고 소재 효율 테스트 등	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
63	주식회사 화이트큐브	스타트업		백엔드 개발자 인턴	서울 강남구		컴퓨터 계열	0		무관	무관	Python 또는 Node.js, Go 등 하나 이상의 언어에 익숙하신 분  HTTP, HTML, JSON 등 웹 기본 구조에 대한 이해가 있으신 분  사용자 경험과 고객 가치를 최우선으로 하여 개발을 통해 비즈니스 성장에 기여하고 싶은 열망이 있는 분  진짜 ‘성공’을 만들고자 하는 열망이 강한 분.  이 업무를 왜 해야 하는지를 항상 고민하며, 해당 이유를 근거로 팀원들을 설득할 수 있는 분  컴퓨터공학 전공 혹은 이에 준하는 지식 및 활용 역량이 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
64	진에어	대기업			서울 강서구			0		무관	무관			IT/인터넷
65	이앤에스글로벌	중견기업			서울 강남구			0		무관	무관			IT/인터넷
66	CJ푸드빌	대기업		데이터 전략·분석 전문가	서울 중구	학사	컴퓨터 계열	3		무관	무관	4년제 학사 졸 이상  관련 학과 : 컴퓨터공학, 산업공학, 경영정보, 문헌정보 등  Data 분석 역량 및 관련 프로젝트 경력 3년 이상  다양한 Data 분석 Tool 활용 경험 (Python, SQL 등)  ‘Data’ 기반으로 객관적인 현상 인식과 '분석적 사고'를 통해 솔루션을 도출하는 역량  현장 업무에 대한 이해를 위한 현업과의 협업 역량  Data 분석을 위한 Data Engineer 등 관련 전문가들과의 협업 역량	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
67	CJ푸드빌	대기업		디지털서비스 APP 개발자	서울 중구	학사	컴퓨터 계열	0		무관	무관	4년제 대학 졸업자 이상  컴퓨터공학, 산업공학, 소프트웨어공학 등 관련학과  React Native 및 Flutter 개발 경험 (최소 5년 이상) 💻  App 설계부터 배포, 서비스 운영까지의 경험이 있으신 분  자기 주도적인 개발과 전체 프로세스를 고려한 설계와 구현이 가능 하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
68	삼성전자	대기업		[VD사업부] Product Partnership	경기 수원시 영통구			0		무관	무관			IT/인터넷
69	코레일네트웍스	공공기관/공기업			서울 용산구, 서울 구로구, 인천 연수구, 경기 과천시, 부산 동래구			0		무관	무관			IT/인터넷
70	주식회사 놀유니버스	중견기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
71	한미그룹	대기업		[한미약품] Medical	서울 송파구			0		무관	무관			IT/인터넷
72	국가정보원	공공기관/공기업		해외정보	서울 강남구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
73	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
74	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
75	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
76	Toss	중소기업	IT/인터넷, 마케팅/광고/홍보, 영업/고객상담, 서비스					0		무관	무관			IT/인터넷
77	SNOW	대기업		남미 타겟 EPIK 콘텐츠 마케팅 체험형 인턴	경기 성남시 분당구			0		무관	무관			IT/인터넷
78	근로복지공단	공공기관/공기업			울산 중구, 부산 금정구, 대구 중구, 인천 남동구, 강원특별자치도 원주시			0		무관	무관			IT/인터넷
79	새만금개발공사	공공기관/공기업		토지공급	전북특별자치도 군산시			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
80	해태제과식품	중견기업			충남 아산시, 광주 북구, 경기 양주시, 서울 용산구			0		무관	무관			IT/인터넷
81	펄어비스	중견기업		검은사막 PC 중국 운영 담당자	경기 과천시			0		무관	필수	원어민 수준의 중국어 사용이 가능하신 분 하나의 게임을 오랜 시간 플레이한 경험이 있거나, PC MMORPG에 대한 이해도가 있으신 분 실시간으로 변화하는 라이브 서비스 환경 흐름에 맞춰 협업하실 수 있는 분 유저를 최우선으로 생각하는 서비스 마인드와 책임감 있는 직업의식을 갖추신 분 원만한 커뮤니케이션 능력을 보유하신 분 업무에 대한 적극성을 갖고 새로운 배움에 주저함이 없으신 분 해외 출장 결격 사유 없으신 분	[전형 안내]\n서류전형 - 필기전형 - 면접전형 - 최종합격	IT/인터넷
82	더존비즈온	중견기업			강원특별자치도 춘천시		컴퓨터 계열	0		무관	무관	HTML, CSS, JavaScript React, DOM 기본 이해도 보유자  컴퓨터공학 또는 소프트웨어 등 관련학과 전공자  관련 업무, 프로젝트 경험 보유자	[전형절차]\n- 서류전형 > 1차 실무자면접 > 2차 임원면접 > 경력/평판조회 > 처우협의/채용검진 > 최종합격	IT/인터넷
83	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
84	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
85	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
86	타라티피에스	중견기업		국내사업본부_수주 영업	서울 마포구, 경기 파주시			0		필수	필수	2025년 7월 입사 가능자  남성의 경우 병역필 또는 면제자  해외 출장에 결격사유 없는 자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
87	AXA손해보험	금융권		코어개발팀 자동차보험 시스템 개발자	서울 용산구	학사		0		무관	무관	정규 4년제 대학교 졸업자 또는 졸업 예정자		IT/인터넷
88	세정아이앤씨	중소기업		IT인프라 운영	부산 금정구	학사	이공 계열	0		무관	무관	대졸 및 2025년 졸업예정자  이공계 전공  H/W 장비에 대한 깊은 관심도	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
89	일동제약	중견기업			서울 서초구, 경기 화성시, 경기 안성시			0		무관	무관			IT/인터넷
90	디스트릭트코리아	중소기업		웹기획/운영	서울 강남구			0		무관	필수	미디어아트와 디지털 디자인에 관심이 있는 분  Figma 사용이 가능하신 분  포토샵, 애프터이펙트, 프리미어, 일러스트레이터 활용이 가능하신 분  HTML 및 DNS등의 웹사이트 개발 관련 지식과 활용이 가능하신 분  해외 출장에 결격사유가 없는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
91	SK C&C USA INC	대기업	해외					0		무관	무관			IT/인터넷
92	라인플러스	대기업			경기 성남시 분당구	학사		2		무관	무관	2025년 8월 이내 학사 이상의 학위 취득 예정 또는 경력 2년 미만의 기졸업자		IT/인터넷
93	교보문고	대기업			서울 마포구	학사		0		무관	무관	대졸학력 소지자  대내외 원활한 커뮤니케이션 능력 보유자  능동적이며, 적극적인 사고방식 소유자  웹/모바일 서비스에 대한 지식 보유  PostgreSQL 등 RDBMS 관련 지식 보유  JAVA 개발 능력, Spring Framework 및 CI/CD에 대한 지식 보유자  HTML, CSS, Javascript, JQuery 관련 지식 보유자 ● 전형절차 및 일정  서류전형→면접전형→건강검진→최종합격		IT/인터넷
94	진학사	중소기업			서울 종로구			0		무관	무관			IT/인터넷
95	토스인슈어런스	중소기업			서울 강남구			0		무관	무관	React, TypeScript 기반으로 안정적인 서비스를 개발할 수 있는 분을 찾고 있어요.  주어진 디자인 시안을 바탕으로 스스로 문제를 정의하고 빠르게 구현해낼 수 있는 분이면 좋아요.  단순히 주어진 개발을 해내는 것보다, 주도적으로 문제를 발견하고 분석해 솔루션을 제안할 수 있는 분이 필요해요.  레거시 코드를 최신의 개발 환경에 맞게 개선한 경험이나, 잘 모르던 기술 스택을 빠르게 학습해서 개발해나간 경험이 있으신 분이면 좋아요. [이력서 작성 추천]  그동안의 경험을 단순 나열하는 것이 아닌, 경험 속에서의 임팩트 및 러닝 포인트를 기술해주세요.  고객의 보이스를 기반으로 빠르게 제품의 완성도를 높여가기 때문에, 주어진 문제를 스스로 해결해보려고 시도하는지 보고 있어요.  복잡도가 높은 서비스나 까다로운 요구사항을 구현한 경험이 있으면 기술해주세요. 특히 복잡하거나 반복되는 문제를 단순한 형태로 추상화한 경험을 설명해주시면 좋아요.  기존 소스 코드를 새로운 코드 베이스로 점진적으로 이관한 경험이 있으면 기술해주세요.		IT/인터넷
96	토즈코리아	외국계기업		E-Commerce Intern	서울 강남구			0		무관	무관			IT/인터넷
97	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관	오디오 신호 처리 및 전처리 알고리즘 설계 경험 (AGC, AEC, NR 등) 음성 인식 및 신호 분리 관련 경험 또는 이해 MATLAB, Python, C/C++ 등 신호 처리 및 알고리즘 구현 언어 숙련도 DSP 관련 개발 경험 및 디버깅 능력 양산 프로젝트에서 일정 관리 및 요구사항 분석 경험 팀 내 협업 및 외부 파트너와의 커뮤니케이션 능력 차량용 오디오 시스템 개발 경험 (또는 유사 도메인 경험) 다중 마이크 환경에서의 음향 기술 연구 또는 적용 경험		IT/인터넷
98	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			IT/인터넷
99	LG CNS	대기업			서울 강서구			0		무관	무관			IT/인터넷
100	노르마	중소기업		QPU 설계	서울 성동구			0		무관	무관	3학년 이상 재학 중인 학생/대학원생  연관 분야 전공		IT/인터넷
101	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			IT/인터넷
102	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			IT/인터넷
103	슈프리마	중소기업			경기 성남시 분당구	학사	전자 계열	0		무관	무관	컴퓨터 공학, 전자공학 또는 관련 분야의 학사 이상 학위를 보유하고 계시며, C/C++ 언어에 대한 깊은 이해와 실무 경험을 갖추신 분  라이브러리 개발 및 API 설계 능력: 동적 라이브러리(dll, so) 개발 경험과 함께, 표준 인터페이스 설계 및 API 문서화를 통해 모듈화된 소프트웨어 구현 경험이 있으신 분  학력 : 학사 이상		IT/인터넷
104	지멘스	외국계기업			서울 종로구			0		무관	무관			IT/인터넷
105	효림그룹	중견기업		XE_품질보증팀	서울 강남구, 대구 달서구, 경북 경산시, 경남 창원시 성산구, 경북 경산시			0		무관	무관			IT/인터넷
106	바비톡	중소기업	IT/인터넷	콘텐츠 마케터 체험형 인턴				0		무관	무관	영상 편집 프로그램 사용 능숙자면 좋아요. Adobe 계열 Premiere Pro, After Effects 등 / 전문 영상 편집 프로그램이 아닌 캡컷 등 영상 제작 어플리케이션 서비스 활용한 영상 제작 스킬도 가능해요. 이미지 제작 능숙자여야해요. 포토샵 및 그 외 프로그램 활용해요. 오프라인 촬영이 가능해야해요. 촬영용품 대여, 촬영 진행 서포트 등 필요해요.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
107	(사)이에스지노동사회협회	비영리단체/협회/재단	IT/인터넷					0		무관	무관			IT/인터넷
109	카카오페이	대기업	경영/사무, IT/인터넷	카카오페이 보험 운영				0		무관	무관	엑셀을 능숙하게 사용하시는 분을 원해요. SQL을 활용한 데이터 추출 및 가공을 할 수 있는 분을 원해요. 성실하고 꼼꼼한 분을 원해요.	[전형 안내]\n서류 접수 > 면접전형 > 최종 합격	IT/인터넷
110	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
111	JYP엔터테인먼트	중소기업		CTO Staff	서울 강동구		컴퓨터 계열	0		무관	무관	컴퓨터 공학 계열 또는 관련 분야 전공자, 혹은 이에 준하는 경력 보유  최신 기술을 활용해 비즈니스 문제를 해결한 경험  전략적 사고력과 논리적인 문제 해결 능력, 데이터 기반 의사결정 역량 보유  팀 중심 환경에서 효과적으로 협업할 수 있는 커뮤니케이션 능력	[전형 안내]\n서류 접수 > 면접전형 > 최종 합격	IT/인터넷
112	비바리퍼블리카	스타트업	IT/인터넷	Data Assistant (SQL, Tableau)				0		무관	무관	실무 sql을 활용해보신분이 필요해요. 복잡한 추출 요청도 고급 sql 능력을 통해 빠르게 추출해 내실 수 있는 분이 필요해요. 꼼꼼하게 데이터 정합성을 확인 하실 수 있는 분이 필요해요. Tableau를 능숙하게 활용하실 수 있는 분이 필요해요 다른 직군의 팀원들과 원활하게 소통할 수 있는 능력이 필요해요.	[전형 안내]\n서류 접수 > 사전 과제 > 직무 인터뷰 > 최종 합격	IT/인터넷
113	한국도로교통공단	공공기관/공기업		정보보호	서울 서초구, 강원특별자치도 강릉시, 제주특별자치도 제주시, 울산 남구, 전북특별자치도 전주시 완산구			0		무관	무관		[전형 안내]\n서류전형 > 필기전형 > 면접전형 > 최종합격	IT/인터넷
114	펄어비스	중견기업		게임플레이	경기 과천시			0		무관	무관	졸업자, 졸업예정자		IT/인터넷
115	대구경북첨단의료산업진흥재단	비영리단체/협회/재단		가.연구직[직속 및 전략기획본부]	대구 동구			0		무관	무관		[전형 안내]\n서류전형 - 필기시험 - 면접전형 - 최종합격	IT/인터넷
116	(주)힐링페이퍼	스타트업			서울 강남구			0		무관	무관			IT/인터넷
117	IBK기업은행	금융권			서울 중구			0		무관	무관			IT/인터넷
118	쿠팡	중소기업			서울 송파구			0		무관	무관	커뮤니케이션 능력		IT/인터넷
119	토스페이먼츠	스타트업		Product Designer [Tools]	서울 강남구			0		무관	무관	사용자가 원하는 제품이 될 때까지 VOC 수집, UX 설계, UI 디자인, Prototype을 통해 개선할 수 있는 역량이 필요해요. 내가 원하는 것이 아닌 사용자의 정성 혹은 정량적인 근거로 문제를 정의한 경험이 필요해요. 우선순위를 고려하여 목표를 설계하고 그 달성 여부를 정성 혹은 정량적으로 끝까지 분석하고 고민한 경험이 필요해요. Web UI에 대한 이해도가 있는 분이 필요해요. 사용자의 비효율적인 업무 원인을 주도적으로 파악하고 효율적으로 개선하여, 업무 리소스를 단축시킨 경험이 있으면 좋아요. 궁극의 고객 경험을 달성하기 위해 논리적인 커뮤니케이션으로 구성원을 설득하고 협업한 경험이 있으면 좋아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
120	한국세라믹기술원	비영리단체/협회/재단		반도체 소재센터	경영/사무, 연구개발/설계, IT/인터넷			0		무관	무관	∘ 연령이 만 34세 이하인 자 ∘ 기술원 「인사 규정」 제7조(결격사유)에 해당하지 않는 자		IT/인터넷
121	토스뱅크	중소기업			서울 강남구			0		무관	무관	Hadoop Ecosystem 환경 기반의 Python, Pyspark 프로그래밍에 능숙하신 분이 필요해요.  Spark 같은 분산처리 엔지니어링을 활용해 대용량 데이터 처리를 해보신 분이 필요해요.  Data Mesh/Medallion Architecture를 이해하고 데이터 모델링을 해오신 분이 필요해요.  분산 처리 기반 query engine의 동작 원리를 이해하고 튜닝이 가능하신 분이 필요해요.  ETL 프로세스와 airflow orchestration 최적화를 통해 배치작업의 효율화를 경험해보신 분이 필요해요.  단순요청을 처리하는 것이 아닌 명확한 데이터 구조와 효율적인 데이터 활용 관점에서 기준을 제시할 수 있어야 해요.  다양한 이해관계자와 소통하여 데이터 요구사항을 구체화하고 정리하는 역량이 있어야 해요. [합류 여정]  서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사		IT/인터넷
122	LG전자	대기업		HS사업본부	서울 영등포구, 경남 창원시 성산구, 경기 평택시			0		무관	무관			IT/인터넷
123	에고이즘	중소기업		AI Creative Specialist	서울 성동구			0		무관	무관	생성형 AI 도구(Midjourney, DALL E, Runway, GPT 등) 사용 경험 각, 분석, 자동화 등 한 가지 이상 업무에서 AI를 활용한 시도 경험 툴을 빠르게 익히고, 업무에 바로 적용할 수 있는 실행력 높으신 분 집협업 디자이너와 유연한 커뮤니케이션 능력 어떤 역할이든 ‘브랜드를 돋보이게 하는 것’에 관심이 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
124	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			IT/인터넷
125	주식회사 인터엑스	스타트업			울산 중구			0		무관	무관			IT/인터넷
126	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
127	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			IT/인터넷
128	SK ON	대기업			대전 유성구			0		무관	무관			IT/인터넷
129	한국하니웰	중견기업			서울 마포구			0		무관	무관			IT/인터넷
130	스타쉽엔터테인먼트	대기업			서울 강남구			0		무관	무관			IT/인터넷
131	앳홈	중소기업	경영/사무, 마케팅/광고/홍보, IT/인터넷	인플루언서 커머스 AMD				0		무관	무관	유튜브, 인스타그램 등 콘텐츠 플랫폼을 자주 보고, 트렌드에 관심 많은 분 인플루언서, 뷰티, 라이브 커머스에 흥미 있는 분 오퍼레이션 업무를 체계적이고 꼼꼼하게 챙길 수 있는 분 엑셀, 구글스프레드시트 등 기본 툴을 다룰 수 있는 분 일을 맡았을 때 끝까지 책임감 있게 마무리할 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
157	퍼솔켈리코리아	중소기업		영업	서울 중구	학사		0	영어 성적 요구	무관	무관	국내 4년제 대학 재학생(3 4학년) 또는 졸업 1년 이내  일본어 또는 영어 중급 이상 가능자		IT/인터넷
158	(주)네오위즈	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
132	현대오토에버	대기업		-디지털 경험-	서울 강남구, 울산 북구, 경기 화성시, 충남 아산시, 경기 의왕시	학사		0		필수	무관	최종학력 4년제 대졸 이상 남성의 경우 군필 또는 면제자 해외여행 결격사유가 없는 자 당사 채용결격사유에 해당되지 않는 자	[전형 안내]\nACT - 과제테스트/코딩테스트 - 1차 면접전형 - 2차 면접전형 - 채용검진 - 최종합격	IT/인터넷
133	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			IT/인터넷
134	문피아	대기업			서울 강남구			0		무관	무관	웹소설 작품의 셀링 포인트를 찾을 수 있는 분  웹소설과 콘텐츠 전반에 대한 이해도가 높은 분  작가 관리에 필요한 커뮤니케이션 스킬을 갖춘 분		IT/인터넷
135	퍼즐원스튜디오	중소기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
136	NIT서비스	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
137	카카오모빌리티	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
138	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
139	쓰리빌리언	중소기업		AI Engineer	서울 강남구	학사		0		무관	무관	Bioinformatics, Cheminformatics, AI engineering, Computer Science 등 관련 학과  학사 학위 이상인 분  인공지능 프레임워크 (TF, torch 등) 를 이해하고 직접 구성한 네트워크를 학습시킨 경험 보유자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
140	유진테크	중견기업		SW개발 신입사원	경기 이천시, 경기 용인시 처인구	학사	전자 계열	0		무관	무관	1) 학사 이상 2) 전공  : 전자/컴퓨터 공학계열 3) C언어 필수, 중급이상 4) C++ or C# 개발 경험자(OOP 개념 이해) 반도체 장비 제어 SW 개발 경험자	[전형 안내]\n서류전형 - 인성검사 - 면접전형 - 최종합격	IT/인터넷
141	(주)네오위즈	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
142	AB180	중소기업		Platform Manager	서울 서초구			0	영어 성적 요구	무관	무관	고객의 요청을 빠르게 파악하고, 명확하고 일관된 커뮤니케이션으로 문제를 설명하고 해결할 수 있으신 분 솔루션 기능과 고객 사용 흐름을 이해하고, 문제의 원인을 논리적으로 분석해 해결책을 도출할 수 있으신 분 반복되는 이슈를 구조화하고, 문서화하거나 개선 제안한 경험이 있으신 분 영어 기술 문서를 읽고 이해하는 데에 어려움이 없으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종 합격	IT/인터넷
143	와디즈	스타트업		비즈니스	경기 성남시 분당구			0	영어 성적 요구	무관	무관	비즈니스 영어 가능자		IT/인터넷
144	태양연마	중견기업			무역/유통, 영업/고객상담, 경영/사무, 생산/제조, 연구개발/설계, IT/인터넷			0		무관	무관			IT/인터넷
145	아마존웹서비시즈코리아	외국계기업		Associate Solutions Architect Internship	서울 강남구	학사	공학 계열	0		무관	무관	IT, 공학, 수학과 관련 4년제 대학 25/26년 졸업 예정이신 분 클라우드 기반 솔루션의 고객 서비스에 관심이 있고 적성에 맞는 분		IT/인터넷
146	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
147	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
148	네오플	대기업			서울 강남구			0		무관	무관	게임 UI/UX 와 개발 프로세스 대한 기본적인 이해와 지식을 갖추신 분  기본적인 디자인툴(photoshop,Illustrator 등)사용에 어려움이 없으신 분  다양한 스타일의 UI 디자인 컨셉을 제시하실 수 있는분  타이포 그래피 및 폰트 디자인에 관심이 많으신 분  주어진 컨셉을 문양,패턴,아이콘 등의 시각요소로 표현 하실수 있는 분 [채용 여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
149	네오플	대기업			서울 강남구			0		무관	무관	2D 이펙트 경험이 풍부하고 드로잉 감각이 뛰어나며, 다양한 툴을 능숙하게 다루실 수 있는 분  게임의 스킬, 모션, 이펙트에 대한 센스가 풍부하신 분  타 부서와 협업 및 커뮤니케이션이 원활하신 분 [채용여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
150	캐롯손해보험	대기업			서울 중구			0		무관	무관			IT/인터넷
151	캐롯손해보험	대기업			서울 중구			0		무관	무관			IT/인터넷
152	토스뱅크	스타트업		Security Researcher	서울 강남구			0		무관	무관	기본적인 IT 및 보안 인프라 환경에 대한 이해가 있는 분이 필요해요. 자체 취약점 진단 도구의 개발 및 유지를 위해 개발 역량이 필요해요. 취약점 진단 스크립트를 이해하고 진단 및 결과를 해석하는 역량이 필요해요. Django, Flask, Python, Powershell, Shell 등 개발 경험이 필요해요. MSA 아키텍처를 이해하고 RestAPI 취약점 진단을 할 수 있는 역량이 필요해요. 다양한 팀과 원활한 협업을 위해 탁월한 커뮤니케이션 능력 보유하신 분이 필요해요. MITRE ATT&CK Framework를 이해하고 AD/xNix 환경에서 침투테스트를 수행할 수 있는 역량이 있는 분이면 더 좋아요. Native Cloud(Kubernetes, AWS 등)환경에 대한 이해가 있는 분이면 더 좋아요. 보안관련 자격증(CISSP, 보안기사, OSCP, CREST 등)을 보유하고 계시면 더 좋아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
153	토스뱅크	스타트업		Site Reliability Engineer	서울 강남구			0		무관	무관	Java/Kotlin, Spring Framework 관련 개발 경험과 문제해결 능력이 있는 분이면 좋아요. 성능 테스트를 통해 시스템의 가용성을 확인하고, 병목지점을 해결할 수 있는 분이면 좋아요. 리눅스 및 네트워크 시스템에 대한 깊은 이해가 있는 분을 찾아요. MSA, Kubernetes, Istio, Redis, Kafka, ELK 기반의 인프라 운영 경험이 있는 분이면 좋아요. Mission Critical 한 서비스 운영 환경을 즐기며 높은 책임감으로 탄탄한 서비스를 같이 만들어 갈 수 있는 분을 찾아요. 변화를 두려워하지 않고 새로운 기술에 빠르게 적응하며 지속적인 성장을 원하는 분을 찾아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
154	토스페이먼츠	중소기업			서울 강남구			0		무관	무관			IT/인터넷
155	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
156	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
159	하이퍼리즘	중소기업		블록체인 인프라 엔지니어	서울 관악구			0		무관	무관	프로덕션 레벨의 백엔드 프로그래밍이 가능하신 분 하나 이상의 프로그래밍 언어에 정통하신 분 AWS, 네트워크, 리눅스, 키 관리, 데브옵스 등 안전한 인프라 관리를 위한 다양한 지식과 폭넓은 경험이 있으신 분 숙련된 인터페이스 설계, 꼼꼼한 구현, 체계적인 테스트를 통해 고가치 자산을 담아낼 시스템을 프로덕션 레벨까지 구현할 수 있는 분 병렬적이고 기민한 공개 커뮤니케이션 능력을 갖추신 분 (DM 금지, 직원당 월 평균 Slack 메시지 약 2,000개) 영혼 없는 수동적 일처리를 극도로 경계하며, 비판적인 시각으로 본질적인 문제를 개선하시는 분 보안에 민감하고, 특히 Web3 생태계의 trustless한 키 관리에 대한 감각이 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 과제전형 - 최종합격	IT/인터넷
160	메타보라	대기업			경기 성남시 수정구			0		무관	무관	책임감이 강하고 성실하신 분  원활한 커뮤니케이션 및 협업 능력을 갖추고 계신 분  주어진 일을 끝까지 책임지고 완수해본 경험이 있으신 분 [진행 안내] 서류전형   면접전형   최종합격		IT/인터넷
161	코그	중견기업		채용 전환형 상시 인턴 (UI)	대구 중구			0		무관	무관			IT/인터넷
162	사단법인 디엠시코넷	비영리단체/협회/재단			서울 마포구			0		무관	무관			IT/인터넷
163	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
164	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
165	채널코퍼레이션	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
166	백패커	중소기업			서울 서초구			0		무관	무관	텀블벅에 대한 이해와 창작 생태계에 대한 깊은 관심을 보유하신 분  새로운 시도를 두려워하지 않고, 기회를 잡기 위한 행동력을 보유하신 분  창작자와의 소통/컨설팅을 위한 원활한 커뮤니케이션 역량을 보유하신 분  여러 온라인/웹 콘텐츠에 관심을 갖고 소비하시는 분		IT/인터넷
167	비트망고	중견기업		Back-end Programmer	경기 성남시 분당구			0		무관	무관	RDB, NoSQL, SQL에 대한 깊은 이해 네트워크, 시스템 및 인프라에 대한 높은 이해도 Bash Script 기본 이해 기술 스택 및 언어 패러다임에 맞는 개념 도입 및 설계 능력 가독성 높은 구조적 코드 작성 및 에러 핸들링 능력 개발 및 비개발 직군과의 원활한 커뮤니케이션 능력	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
168	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 인턴 - 전환면접 - 최종합격	IT/인터넷
169	슈어소프트테크	중소기업			대전 유성구		전자 계열	0		무관	무관	C, C++언어 가능자(코드 해석 가능자)  전자, 컴퓨터공학 관련 교육 이수자	[전형 안내]\n서류전형 - 면접전형 - 인턴 - 전환면접 - 최종합격	IT/인터넷
170	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			IT/인터넷
171	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
172	쿠팡	대기업	IT/인터넷					0		무관	무관			IT/인터넷
173	신한DS	중견기업			서울 중구			0		무관	무관		[전형절차]\n- 서류전형 > 실무진면접 > 역량검사 > 경영진 면접 > 처우협의 및 채용검진 > 입사	IT/인터넷
174	베이글코드	중소기업			서울 강남구			0		무관	무관			IT/인터넷
175	한국아이비엠	외국계기업		제품 보안 진단 및 OT 보안 수준 진단 및 프로세스 수립 지원	서울 영등포구			0	영어 성적 요구	무관	무관	Bachelor's Degree  최신 기술에 대한 관심과 열정을 바탕으로 문제 해결 능력을 보유하신 분  사이버보안, 정보보안, 정보보호 유관 전공자 또는 정보보호 관련 과목 이수 또는 자격증을 보유하신 분  공인 영어 시험 성적 보유자 (점수 제한 없음)	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
176	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
177	넷마블	대기업			서울 구로구			0		무관	무관			IT/인터넷
178	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
179	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
180	LSP USA, LLC	기타						0		무관	무관			IT/인터넷
181	LSP USA, LLC	기타	생산/제조, IT/인터넷					0		무관	무관			IT/인터넷
182	주식회사 노타	중소기업			서울 강남구			0		무관	무관			IT/인터넷
183	카카오페이	금융권	IT/인터넷					0		무관	무관			IT/인터넷
184	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
185	RXC	스타트업			서울 강남구			0		무관	무관			IT/인터넷
186	야놀자	중소기업			서울 강남구			0		무관	무관			IT/인터넷
187	KSM	중견기업			서울 영등포구			0		무관	무관			IT/인터넷
188	(주)엠디에스인텔리전스	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
189	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
190	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
191	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
192	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
193	LG전자	대기업		HS사업본부	서울 영등포구			0		무관	무관			IT/인터넷
194	라이드플럭스	중소기업			서울 영등포구			0		무관	무관			IT/인터넷
195	이빗	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
196	커넥트웨이브	중견기업			서울 금천구			0		무관	무관	경력: 신입  Linux OS 운영에 관심이 많으신 분  커넥트웨이브 서버 대부분이  Linux 기반 OS를 이용하여 구축되어 있습니다.  원활한 커뮤니케이션 스킬을 보유하신 분  타 팀과의 소통을 바탕으로 업무를 진행하는 케이스가 많은 편입니다.  자기 개발에 열심이신 분  신기술 도입을 적극적으로 검토하며 테스트합니다. [채용 절차]  서류전형   인적성 검사 & 1차 면접   2차 면접   처우협의   채용검진   최종합격		IT/인터넷
197	카카오페이	대기업	IT/인터넷					0		무관	무관			IT/인터넷
198	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
199	하이컨시	중견기업		• 사이트 운영 관련 업무	서울 강남구	학사		0		무관	무관	학력 : 대졸 이상		IT/인터넷
200	콘티넨탈오토모티브코리아	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
201	콘티넨탈오토모티브코리아	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
202	보그워너	외국계기업			경기 화성시			0		무관	무관			IT/인터넷
203	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
204	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
205	에듀클라우드	중소기업			서울 금천구			0		무관	무관			IT/인터넷
206	아티스트앤스튜디오	중소기업			서울 마포구			0		무관	무관			IT/인터넷
207	주식회사 사각	스타트업			서울 마포구			0		무관	무관			IT/인터넷
208	메리츠증권	대기업			서울 영등포구			0		무관	무관			IT/인터넷
209	카카오페이	대기업	IT/인터넷	카카오페이 MyData 서비스의 안정성, 신뢰성, 가용성을 지속적으로 개선시켜나가요.				0		무관	무관	Java/Kotlin, Spring Framework 관련 개발 경험 혹은 지식과 문제해결 능력이 있는 분을 찾고 있어요. React, Typescript 관련 개발 경험 혹은 지식을 가지고 활용 가능한 분을 찾고 있어요. Observability (메트릭/로그/트레이싱)에 대한 지식과 경험이 있는 분을 찾고 있어요. 주도적으로 문제를 정의하고 대안을 제시할 수 있는 분을 찾고 있어요. 개발 관련 학과 또는 동일한 자격이 있는 분을 찾고 있어요.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
210	게임듀오	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
211	게임듀오	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
212	Spigen Inc	중견기업			미디어, 디자인, 교육, 무역/유통, IT/인터넷, 서비스, 연구개발/설계, 마케팅/광고/홍보, 경영/사무, 영업/고객상담			0		무관	무관			IT/인터넷
213	커넥트웨이브	중견기업		클라우드 시스템 운영	서울 금천구			3		무관	무관	신입 ~ 경력 3년 이내이신 분 Linux/Unix 서버에 대한 기본적인 이해가 있으신 분 SQL 쿼리 작성 및 데이터베이스 기초 지식을 보유하신 분 JAVA, PHP, Python,Bash 등 한 가지 이상의 개발 언어 사용이 가능하신 분 웹서비스에 대한 이해가 있으신 분 새로운 기술 학습에 대한 열정과, 의지가 있으신 분 문제 해결 및 팀 협업 능력을 보유하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
214	Riiid	중소기업		투자 학습 콘텐츠 에디터	서울 강남구			0		무관	무관	글쓰기에 관심이 많고, 복잡한 정보를 간결하게 문장으로 작성할 수 있는 능력이 있으신 분 다양한 자료 조사를 하고, 엑셀 등 도구를 활용해 데이터를 정리한 경험이 있으신 분 꼼꼼한 콘텐츠 검수 과정을 통해 콘텐츠의 완성도를 높일 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
215	슈어소프트테크	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
216	게임듀오	중소기업		영상 크리에이터	경기 성남시 수정구			0		무관	무관	영상 제작 툴(After Effect, Premier 등)의 활용 능력이 높으신 분 게임 영상 제작 관련 경험이 있으신 분 한정된 리소스 내에서 창의적인 영상 기획 경험이 있으신 분 본인의 개성과 장점을 살린 포트폴리오 보유하신 분	[전형 안내]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
217	(주)커넥트웨이브	중견기업			서울 금천구			0		무관	무관			IT/인터넷
218	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
219	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
220	한국타이어앤테크놀로지	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
221	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
222	한글과컴퓨터	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
223	팅크웨어	대기업		아이나비 HW QA(품질 신뢰성 시험)	경기 성남시 분당구	학사	전기 계열	0		무관	필수	4년제 대졸 이상인 분  신입 또는 5년 이내의 유관 경력을 보유한 분 1) 신입: 전자/전기/산업 공학을 전공한 분 2) 경력: 단말/부품 신뢰성 시험 및 HW 설계 품질 보증 업무 경력을 보유한 분  운전이 가능한 분  해외 출장에 결격 사유가 없는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격 및 입사	IT/인터넷
224	주식회사 링키지랩	대기업			서울 성동구, 경기 성남시 분당구			0		무관	무관			IT/인터넷
225	티맥스소프트	중견기업		연구본부 IF-QA팀 '팀원	경기 성남시 분당구	학사		0		무관	무관	4년제 대졸(학사) 이상 C/JAVA 기반 언어 가능자 원활한 커뮤니케이션 및 적극적 업무추진 역량 보유자	[전형 안내]\n서류전형 - 개발직군 코딩TEST - 면접(1차/2차/3차) - 인성/직무적성 검사 - 합격자 발표	IT/인터넷
226	티맥스소프트	중견기업		WAS 개발 (JEUS, WebtoB 관리 제품 Front 개발)	경기 성남시 분당구	학사		0		무관	무관	4년제 대졸(학사) 이상 HTML/CSS, JavaScript, React 라이브러리 사용 경험 REST API 연동 및 백엔드 통신 사용 경험 Git, Jenkins 등 협업 및 개발 환경 사용 경험	[전형 안내]\n서류전형 - 개발직군 코딩TEST - 면접(1차/2차/3차) - 인성/직무적성 검사 - 합격자 발표	IT/인터넷
227	포항공과대학교	기타		일반행정	경북 포항시 남구			0		무관	무관			IT/인터넷
228	피에프씨테크놀로지스	중소기업			서울 서초구			0		무관	무관			IT/인터넷
229	피에프씨테크놀로지스	스타트업			서울 강남구			0		무관	무관			IT/인터넷
230	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
231	RHEE BROS INC.	중견기업	해외					0		무관	무관			IT/인터넷
232	PTKOREA	외국계기업		대기업 글로벌 APP CMS QA 자동화 Tool 개발	서울 강남구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
233	현대자동차	대기업		AI/Data	서울 서초구			0		무관	무관	Ph.D. candidates/graduates in STEM from global universities (including post docs) Applicants must be able to join the company by August 2026	[전형 안내]\n서류전형 - 면접전형 - 현대 기술 세미나 - 최종합격	IT/인터넷
234	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
235	젠지이스포츠글로벌아카데미	중소기업			서울 강남구			0		무관	무관	유저 중심 사고를 기반으로 서비스 개선 아이디어를 도출할 수 있는 분  논리적 사고 및 문제 해결 능력이 뛰어나신 분  디자이너 및 개발자와 원활한 커뮤니케이션이 가능하신 분 채용절차  1차 면접(실무진 면접)  > 2차 면접(HR 면접)  > 제출 서류 검토 및 결격 사유 확인  > 처우 협의  > 최종합격  필요 시, 3차 전형을 진행할 수 있습니다.		IT/인터넷
236	STRADVISION	스타트업			서울 서초구			0		무관	무관			IT/인터넷
237	써모피셔사이언티픽코리아	외국계기업		Field Service Engineer II	대전 대덕구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
238	레진엔터테인먼트	중견기업			서울 성동구			0		무관	무관			IT/인터넷
239	라인플러스	대기업			경기 성남시 분당구			0	영어 성적 요구	무관	무관	이런 경험과 스킬을 가진 분을 찾습니다:  Computer Science 혹은 관련 분야 전공자 또는 이에 준하는 실무 경험이 있으신 분  Linux 또는 Unix 환경에서의 개발 및 시스템 운영에 익숙하신 분  Concurrency가 높은 시스템 및 분산 아키텍처에서 문제를 해결할 수 있으신 분  Apache HBase, Redis 등 분산 스토리지 미들웨어에 대해 관심이 높으신 분  영어 읽기와 쓰기로 의사소통이 가능하신 분 전형안내  서류 전형 > 온라인 코딩 테스트 >  1차 면접 (CS Interview) > 2차 면접 (Whiteboard Interview) > 최종 면접 > 레퍼런스 체크 및 처우 협의 > 최종 합격 > 입사		IT/인터넷
240	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
241	에고이즘	중소기업			서울 성동구			0		무관	무관			IT/인터넷
242	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
243	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
244	네오위즈	중견기업			경기 성남시 분당구			1		무관	무관	리깅 경력 1년 이상 또는 이에 준하는 실력이나 경험을 갖춘 분  Maya 캐릭터 및 크리쳐 리깅 경험이 있으신 분  Maya 리깅 설계 및 리깅 관련 기능에 대한 높은 이해도가 있으신 분		IT/인터넷
245	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
246	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
247	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			IT/인터넷
248	에스에이피코리아	외국계기업	IT/인터넷, 영업/고객상담, 전문/특수직					0		무관	무관			IT/인터넷
249	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
250	네오플	대기업			서울 강남구			0		무관	무관	새로운 업무 방식과 체계에 적응할 의지가 있으신 분  던전 앤 파이터의 IP/메타에 대한 이해 및 열정이 있으신 분  던전 앤 파이터의 전투 액션 구조에 대해 이해하고 계신 분 [채용여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
251	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
252	뱅크샐러드	중소기업		QA Engineer	서울 마포구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 합격자 발표	IT/인터넷
253	네오플	대기업			제주특별자치도 제주시			0		무관	무관	끝을 경험한 유저를 찾습니다.  본인만의 게임 철학을 가진 동료를 찾습니다  (경력) 노련한 전략가를 찾습니다.  프로젝트 오버킬은 좋은 밸런스라는 평가보다 좋은 게임이라는 평가를 반길 수 있는 여러분을 찾고 있습니다. [채용 절차]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
254	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
255	DK테크인	대기업			경기 성남시 분당구			2		무관	무관	클라우드 인프라 구축 및 운영 경력 2년 이상 필수 네트워크 관련 5년 미만의 경력 멀티 VPC 및 DX 구성, TGW 연동 경험이 있으신 분 클라우드 방화벽 및 WAF 등 보안장비 구축 경험이 있으신 분 하이브리드 클라우드(with On premise) 구축 경험이 있으신 분 하이브리드/멀티 클라우드 네트워크 설계에 관심이 있으신 분 AWS/GCP/Azure/NHN 사용 경험이나 클라우드 서비스에 대한 관심이 있으신 분 다양한 분야의 업무를 적극적으로 즐겁게 하실 수 있는분 혼자 일하는 것보다 협업을 더 좋아하시는 분		IT/인터넷
256	DK테크인	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
257	펄어비스	중소기업			경기 과천시			0		무관	무관			IT/인터넷
258	메가존클라우드	중견기업			경기 과천시			0		무관	무관			IT/인터넷
259	넷마블엔투	대기업			서울 구로구			0		무관	무관		[전형절차]\n- 서류심사 > 1차 실무면접 > 2차 임원면접 > 합격자발표	IT/인터넷
260	주식회사 딥블루닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
261	주식회사 딥블루닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
262	번개장터 주식회사	스타트업			서울 서초구			0		무관	무관			IT/인터넷
263	티맥스소프트	중견기업			경기 성남시 분당구	학사		0		무관	무관	4년제 대졸 이상		IT/인터넷
264	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
265	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
266	카카오	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
267	키노라이츠	스타트업			서울 강남구			0		무관	무관			IT/인터넷
332	주식회사 투어라이브	중소기업	IT/인터넷					0		무관	무관		[채용 전형]\n- 서류전형 > 1차 온라인 면접 > 2차 면접 > 최종 합격	IT/인터넷
333	다쏘시스템코리아	중견기업			대구 남구			0		무관	무관			IT/인터넷
268	마상소프트	중소기업			부산 해운대구			0		무관	무관	이펙트 관련 툴을 능숙하게 사용하시는 분  컨셉의 의도와 방향성에 맞는 이펙트 연출, 색감, 타이밍 감각이 뛰어나신 분  팀워크를 중시하며 원활한 커뮤니케이션을 하시는 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
269	마상소프트	중소기업			부산 해운대구			0		무관	무관	포즈와 타이밍을 잘 표현 하시는 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
270	마상소프트	중소기업			부산 해운대구			0		무관	무관	게임 개발에 열정을 가지신 분  실사, 반실사, 캐주얼풍의 배경 에셋 제작이 가능 하신 분  3DMax를 이용한 low, middle 폴리곤 모델링에 능숙하신 분  새로운 시도에 대한 거부감이 없고 팀플레이에 익숙하신 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
271	마상소프트	중소기업			부산 해운대구			0		무관	무관			IT/인터넷
272	마상소프트	중소기업			부산 해운대구			0		무관	무관	콘텐츠, 시스템, 이벤트를 비롯하여 유저에게 즐거운 경험을 제공할 수 있는 능력을 가진 분을 찾아요!  원활한 커뮤니케이션이 가능하신 분  논리적인 사고를 갖추신 분  다양한 게임의 플레이 경험과 지식이 있으신 분  기획 의도를 문서화하여 전달 가능하신 분  즐겁게 할 수 있는 게임을 만들고자 하는 열정이 있는 분  해외 여행에 결격사유가 없으신 분 ❖ 주요 업무  현재 서비스 되고 있는 게임의 재미와 확장성, 안정성 등을 고려한 기획을 고민하고 개발해요!  서비스 중인 게임의 콘텐츠, 시스템, 밸런스, 편의성을 기획하고 강화해요!  신규 프로젝트의 아이디어를 제안하고 기획합니다. ❖ 채용 절차  서류 전형 > 실무 면접 > 인성 면접 > 임원 면접 > 최종 합격		IT/인터넷
273	커넥트웨이브	중견기업			서울 구로구			0		무관	무관			IT/인터넷
274	Ecoplastic America	중견기업	해외					0		무관	무관			IT/인터넷
275	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
276	아인의료재단	기타			인천 미추홀구			0		무관	무관			IT/인터넷
277	프롭티어	대기업			서울 서초구			0		무관	무관			IT/인터넷
278	네오플	대기업		던전 콘텐츠 기획자	서울 강남구			0		무관	무관			IT/인터넷
279	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
280	뱅크샐러드	중소기업			서울 마포구			0		무관	무관	유저 관점에서 사고하여 경쟁력 있는 가치 제안을 개발하고, 유저의 후생 증대와 편익 극대화 기준을 정량화(북극성 지표)하고 이를 기준으로 제품을 고도화하는 경험이 있는 분들을 원해요.  MAKER들과 애자일 조직에서 가설 수립 및 가설 검증 이터레이션 통해 PMF를 끈질기게 찾아 본 분을 원해요.  모바일 비즈니스나 트래픽 비즈니스의 핵심 지표 정의, 성장 로드맵을 구축하고 실행해본 경험이 있는 분을 원해요.  도메인 경험은 없어도 되나, 도메인 학습에 있어 두려움이 없이 호기심을 가지고 있는 분을 원해요.  의사결정을 직접 내리고, 성과를 온전히 책임져 본 분들. 여정 상 번거로운 일이나 어려운 일들을 마다하지 않고 손수 실질적 성과까지 이끌어내는 분들은 뱅샐에서 크게 인정받아요.  한계 없이 문제를 풀 수 있다는 도전 정신이 투철하고 신뢰는 내가 얻어 내는 것이고 , 뛰어나지만 항상 발전을 추구하는 독립심 있는 사람과 일하고 싶어요.		IT/인터넷
281	뱅크샐러드	중소기업			서울 마포구			0		무관	무관	유저 관점에서 사고하여 경쟁력 있는 가치 제안을 개발하고, 유저의 후생 증대와 편익 극대화 기준을 정량화(북극성 지표)하고 이를 기준으로 제품을 고도화하는 경험이 있는 분들을 원해요.  MAKER들과 애자일 조직에서 가설 수립 및 가설 검증 이터레이션 통해 PMF를 끈질기게 찾아 본 분을 원해요.  모바일 비즈니스나 트래픽 비즈니스의 핵심 지표 정의, 성장 로드맵을 구축하고 실행해본 경험이 있는 분을 원해요.  도메인 경험은 없어도 되나, 도메인 학습에 있어 두려움이 없이 호기심을 가지고 있는 분을 원해요.  의사결정을 직접 내리고, 성과를 온전히 책임져 본 분들. 여정 상 번거로운 일이나 어려운 일들을 마다하지 않고 손수 실질적 성과까지 이끌어내는 분들은 뱅샐에서 크게 인정받아요.  한계 없이 문제를 풀 수 있다는 도전 정신이 투철하고 신뢰는 내가 얻어 내는 것이고 , 뛰어나지만 항상 발전을 추구하는 독립심 있는 사람과 일하고 싶어요.		IT/인터넷
282	크래프톤	중견기업			서울 강남구			0		무관	무관			IT/인터넷
283	Toss	대기업	IT/인터넷					0		무관	무관			IT/인터넷
284	SK C&C	대기업		Tech R&D - Software Engineering	경기 성남시 분당구			0		필수	필수	해외여행에 결격사유가 없는 분 (병역 대상자의 경우 병역필 또는 면제자) 채용 분야의 경력을 3~5년 이상 보유하신 분 최종합격 후 회사가 지정하는 날짜에 입사 가능하신 분	[전형 절차]\n서류전형 > SKCT심층역량검사 > 1차면접 > 2차면접 > 채용검진/처우협의 > 최종합격	IT/인터넷
285	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
286	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
287	폰비	스타트업			서울 서초구			0		무관	무관			IT/인터넷
288	SavvycomKorea	중소기업			서울 종로구			0		무관	무관			IT/인터넷
289	토스뱅크	금융권			서울 강남구			0		무관	무관	정적인 화면을 보면 동적으로 만들고 싶어지는 분을 찾아요. 떠오른 아이디어를 Hi fi 프로토타입으로 만들 수 있는 분이 필요해요. 세상에 없던 사용성과 비주얼을 가진 컴포넌트 만드는 것에 가슴 뛰는 분을 찾아요. 사용자의 문제를 인터랙티브한 솔루션으로 해결하는 것에 가슴 뛰는 분을 찾아요. "처음 가입한 유저에게 인터랙션으로 토스의 편리함과 안전함을 잘 전달할 수 있을까?" "어렵고 복잡한 약관 동의 화면을 인터랙션을 이용해 쉽고 직관적으로 바꿀 수 있을까?" "금융의 해피모먼트 경험을 증폭할 수 있는 인터렉션 만들기"	[전형안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
334	루닛	중소기업			서울 강남구			0		무관	무관			IT/인터넷
495	(주)삼구아이앤씨	중견기업			서울 중구			0		무관	무관			연구개발/설계
290	펄어비스	중견기업			경기 과천시			0		무관	무관	인게임 컷신 연출에 대한 이해도가 있으신 분 게임 개발에 대한 이해도가 있으신 분 /포트폴리오 제출 필수/ 포트폴리오는 클라우드(구글, MS 등)에 올린 후 링크 형태로 첨부 부탁드립니다. 이미지 파일의 경우는 원본 사이즈로 준비 부탁드립니다. 부득이한 사유로 인해 압축파일을 첨부하시는 경우, 압축파일 내 이미지 파일은 모두 풀어서 첨부해주시기를 바랍니다.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
291	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
292	펄어비스	중견기업			경기 과천시			3		무관	무관	(경력) 유관 경력 3년 이상이신 분 기본적인 3D 제작툴 사용이 가능하신 분 이펙트용 텍스쳐의 제작/편집이 가능하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
293	펄어비스	중견기업			경기 과천시			0		무관	무관	Houdini 및 Blender geometry node 기반 툴 제작이 가능하신 분 (프로시듀얼 모델링 담당 업무) HLSL 기반으로 셰이더 작성이 가능 하신 분 (셰이더 담당 업무)	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
294	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
295	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
296	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
297	쿠팡	대기업		Compliance Specialist (PII Protection & Management Team)	서울 송파구			0		무관	무관	시스템 권한 관리 업무 경험이 있으신 분 분석 및 문제 해결 능력을 보유하신 분 효과적인 커뮤니케이션과 원할한 협업 능력을 보유하신 분 DB 데이터 추출 및 로그 분석 활용 능력이 강하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
298	여기어때컴퍼니	중소기업			서울 강남구			0		무관	무관			IT/인터넷
299	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
300	페스카로	중소기업	IT/인터넷					0		무관	무관			IT/인터넷
301	페스카로	중소기업			경기 수원시 영통구	학사		4		무관	무관	신입/경력 4년 미만 대재 (4년제)		IT/인터넷
302	페스카로	중소기업			경기 수원시 영통구			0		무관	무관			IT/인터넷
303	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
304	지멘스	외국계기업	IT/인터넷					0		무관	무관			IT/인터넷
305	토스	중소기업		DataOps Manager	서울 강남구			0		무관	무관	데이터 분석 및 관리 경험 SQL 활용 능력		IT/인터넷
306	생활연구소	중소기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
307	포티투닷	스타트업			경기 성남시 수정구			0		무관	무관			IT/인터넷
308	오픈드림컴퍼니	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
309	네오플	대기업			제주특별자치도 제주시			0		무관	필수	'던전앤파이터'가 게임이기 이전에 고객에게 제공하는 서비스임을 인지하고, 고객 신뢰를 바탕으로 한 기본적인 직업 윤리 의식을 지니신 분  신뢰에 기반한 협업으로 팀워크를 발휘할 수 있도록 좋은 커뮤니케이션 스킬과 매너를 갖추신 분  다양한 경우의 수를 따져보고 확인할 수 있는 꼼꼼함을 갖추신 분  문제 발견 및 문제 해결 능력을 갖추신 분  여러 장르의 게임&PC MMORPG에 대한 이해도가 높은 분  MS Office 활용 능력을 갖추신 분  해외 출장 결격 사유가 없는 분 [채용 여정] 서류심사 → 면접 → 처우협의 → 최종합격 및 입사 * 해당 절차는 각 포지션 및 후보자에 따라 변동이 있을 수 있습니다. * 면접 전형 이후 후보자 동의하에 레퍼런스 체크가 진행 될 수 있으며 진행 시 별도로 안내 드릴 예정입니다.		IT/인터넷
310	피에프씨테크놀로지스	스타트업			서울 서초구			0		무관	무관			IT/인터넷
311	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
312	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
313	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
314	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
315	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
316	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
317	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
318	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
319	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
320	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
321	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
322	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
323	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
324	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
325	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
326	Deloitte 안진회계법인	외국계기업			서울 영등포구			0		무관	무관			IT/인터넷
327	Tridge	스타트업			서울 서초구			0		무관	무관			IT/인터넷
328	주식회사 패스트뷰	중소기업			서울 강남구			0		무관	무관			IT/인터넷
329	메가존클라우드	중견기업			서울 강남구			0		무관	무관			IT/인터넷
330	고운세상코스메틱	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
331	고운세상코스메틱	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
368	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
335	노벨리스코리아	중견기업			서울 중구			0		무관	무관	Bachelor’s degree and above. Majori in business administration or Accounting is preferred Good understanding of product costing in manufacturing business and operations Relevant experience in manufacturing industry Good communication skills with various stakeholders English Proficiency in both verbal and written Expertise in MS Excel Power BI experience is a plus	[전형절차]\n서류 전형- 면접 전형 - 최종 합격	IT/인터넷
336	노벨리스코리아	중견기업			서울 중구	학사		0		무관	무관	학력: 대졸(4년) 이상	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
337	노벨리스코리아	중견기업			서울 중구	학사	기계 계열	0	영어 성적 요구	무관	필수	재료공학, 기계공학, 산업공학 등 공학 배경 학사 학위 이상  영어 능통자  수준급 MS Office (Excel, PPT) 활용 가능한 자  정기적인 국내/해외 출장이 가능한 자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
338	노벨리스코리아	중견기업			울산 남구			0		무관	무관	1. Support global project 2. Operate Regional systems   Develop & maintain the regional applications to meet the customer business goal 3. Enhancement Regional system Improve the regional applications to meet the customer business goal Execution & leading Hot Mill, Supply Chain & GMS area for Asia MES integration project Execution & leading ABS, OES, GMS & DMS for Asia project 4. Better understanding business part useful IT application	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
339	넥슨	대기업			경기 성남시 분당구			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
340	(주)커넥트웨이브	중견기업			서울 금천구			0		무관	무관			IT/인터넷
341	몰로코	중소기업			서울 강남구			0		무관	무관			IT/인터넷
342	라이나손해보험	금융권			서울 종로구			0		무관	무관			IT/인터넷
343	아인의료재단	비영리단체/협회/재단			인천 미추홀구			0		무관	무관			IT/인터넷
344	시큐아이	대기업			서울 종로구			0		무관	무관			IT/인터넷
345	메가존클라우드	중견기업			서울 강남구			0		무관	무관			IT/인터넷
346	프레인글로벌	중소기업			서울 중구			0		무관	무관		[전형절차]\n서류 접수 > 실무 및 임원 면접 > 최종 합격 및 입사\n합격자에 한해 개별 연락드려요.\n해당 포지션은 1년 계약직입니다.	IT/인터넷
347	업스테이지	중소기업			경기 용인시 수지구			0		무관	무관			IT/인터넷
348	롯데GFR	대기업			서울 강남구			0		무관	무관			IT/인터넷
349	롯데GFR	대기업			서울 강남구	학사		0		무관	무관	학력 : 대졸이상(4년)  경력 : 여성복 기획MD 경력 4~6년차		IT/인터넷
350	비즈니스캔버스	중소기업			서울 강남구			0		무관	무관			IT/인터넷
351	넷마블네오	대기업			서울 구로구			0		무관	무관			IT/인터넷
352	넷마블네오	대기업			서울 구로구			0		무관	무관			IT/인터넷
353	알파브라더스	중소기업			서울 강서구			0		무관	무관			IT/인터넷
354	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
355	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
356	네오플	대기업			제주특별자치도 제주시			0		무관	무관	UI/UX관련 전공, 또는 3년 이상 경력이 있으신 분을 찾고 있습니다.  적극적인 의견 개시와 더불어 의견에 대한 수용성에 있어서도 원활한 분이었으면 좋겠습니다.  UX에 대해 지대한 관심이 있고 아이디어 제안이 가능한 분이면 최고입니다.  UI 연출에 대한 쫀득한 맛을 체득하신 분이면 더욱 좋겠습니다. [채용 여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
357	뮌헨재보험 한국지점	중소기업			서울 종로구			0		무관	무관			IT/인터넷
358	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
359	네오플	대기업			서울 강남구		물리 계열	0		무관	무관	C++, Unreal Engine 등 프로그래밍 언어에 대한 깊은 이해를 가진 분  3D 액션 게임 전투(스킬 제작, 애니메이션, AI, 물리) 개발에 대한 관심이 있으신 분  하드코어 액션 RPG (몬스터헌터, 소울라이크 등) 및 3D 액션 전투 플레이를 잘 하시거나, 거부감이 없으신 분  문제의 원인 분석 및 해결 능력이 뛰어나신 분  수평적 의사 소통 및 애자일 개발 방식에 거부감이 없으신 분  적극적 커뮤니케이션: 효과적인 개발을 위하여 [문서화/대화/토론/피드백] 에 적극적인 분  꾸준한 트래킹과 테스트 : '저절로 되는 것은 없다'는 마인드로 꼼꼼하게 작업을 관리하실 수 있는 분  상호 존중의 마인드 : 프로젝트는 많은 사람들이 모여 이룩하는 공동의 작업이라는 이해가 있으신 분 [채용 절차]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
360	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
361	네오플	대기업			서울 강남구			0		무관	무관	신입/경력 무관  원화 해석 및 조형 능력이 뛰어나서 원화보다 더 멋진 모델링을 추구하시는 분을 찾습니다.  카툰풍 모델링 제작 경험이 있거나 카툰 스타일 그래픽을 좋아하시는 분을 찾고 있습니다.  카툰 그래픽으로 퀄리티 정점을 찍고 싶은 분이었으면 좋겠습니다.  3DS Max, ZBrush, Substance에 충분히 숙련되신 분을 찾고 있습니다.  끊임없는 퀄리티 향상에 갈증을 느끼는 분을 찾고 있습니다.	[전형 절차]\n- 서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사	IT/인터넷
362	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
363	버킷플레이스(오늘의집)	중소기업			서울 서초구			0		무관	무관			IT/인터넷
364	마상소프트	중소기업			부산 해운대구			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
365	마상소프트	중소기업			부산 해운대구			0		무관	무관	배우고 성정하기 위해 노력 하는 분  이슈 및 보안 등 새로운 변화에 두려워 하지 않고 즐기시는 분  긍정적으로 생각하고 실천하는 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
366	Codiz Inc	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
367	DB Insurance USA	금융권	해외					0		무관	무관			IT/인터넷
369	뉴파워프라즈마	중견기업			경기 수원시 권선구, 서울 강서구			0		무관	무관			IT/인터넷
370	DB Insurance	중견기업	IT/인터넷					0		무관	무관			IT/인터넷
371	라인플러스	대기업			경기 성남시 분당구			0		무관	무관	7년 이상의 서비스기획 또는 제품관리(Product Management) 경험을 보유하신 분  스스로 목표와 전략 설정이 가능하고, 논리적이고 효과적인 커뮤니케이션 능력을 보유하신 분  프러덕트에 대한 오너쉽을 가지고 서비스를 런칭하고 주도적으로 크게 성장시켜본 경험을 보유하신 분  데이터를 기반으로 문제 해결 능력을 보유하신 분  실패를 두려워하지 않고 근성을 가지고 배움과 일을 대하시는 분		IT/인터넷
372	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
373	카카오페이	금융권			경기 성남시 분당구			0		무관	무관			IT/인터넷
374	(주)미미박스	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
375	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
376	하이퍼리즘	중소기업			서울 관악구			0		무관	무관			IT/인터넷
377	마이리얼트립	중소기업			서울 서초구			0		무관	무관			IT/인터넷
378	한화이센셜	대기업			충남 아산시			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
379	쎄믹스	중소기업			경기 성남시 분당구		전기 계열	0	영어 성적 요구	무관	필수	* 신입  전기 / 전자 / 반도체 공학 (또는 유사학과)  OPIC IM2급 (점) 이상/TOEIC Speaking IM3 이상  해외 출장에 결격사유가 없는 자 * 경력  위 신입 요건 충족  Motion & IO 제어 / PLC 제어 / AutoCAD 설계  BOM 관리 경험	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
380	쎄믹스	중소기업			경기 광주시		전자 계열	1		무관	무관	신입 : 전자공학 또는 반도체 공학을 전공하고 반도체 및 회로에 대한 이해도가 높은 분  경력; 테스터 영업 경력 1년 이상 유경험자로 반도체에 대한 이해도가 높은 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
381	주식회사 케어마인더	스타트업			서울 강남구			0		무관	무관			IT/인터넷
382	야놀자	중견기업			서울 강남구			0		무관	무관			IT/인터넷
383	어스얼라이언스	중소기업			서울 마포구			0		무관	무관			IT/인터넷
384	엔피씨	중견기업			경기 용인시			0		무관	무관			IT/인터넷
385	유비벨록스	중견기업			서울 구로구, 충청 진천군			0		무관	무관			IT/인터넷
386	보쉬전장	중견기업			세종특별자치시			0		무관	무관			연구개발/설계
387	성신양회	중견기업		전기	충북 단양군	학사	전기 계열	5		무관	무관	학력 : 4년제졸 이상 전공 : 전기, 전기공학 계열 경력  신입 또는 경력 5년 이상		연구개발/설계
388	SFA반도체	중견기업			충남 천안시 서북구			0		무관	무관			연구개발/설계
389	큐알티	중소기업		FIB	경기 수원시 영통구	전문학사	이공 계열	0		무관	무관	(1) 학력: 전문학사 (2) 전공: 이공계열		연구개발/설계
390	현대제철	대기업			경북 포항시 남구			0		무관	무관			연구개발/설계
391	종근당바이오	중견기업			경기 안산시 단원구			0		무관	무관			연구개발/설계
392	신한투자증권	대기업			서울 영등포구			0		무관	무관			연구개발/설계
393	극지연구소	공공기관/공기업						0		무관	무관			연구개발/설계
394	대상	대기업		경영지원_기술관리	서울 종로구, 경남 거창군, 경기 용인시 기흥구, 전북특별자치도 군산시, 충남 천안시 서북구			0		필수	필수	1. '25년 8월 졸업예정자 혹은 직무별 학력 기졸업자 2. 해외여행에 결격사유가 없고, 남성의 경우 병역의무를 필하였거나 면제인 분		연구개발/설계
395	현대모비스	대기업			서울 강남구			0		무관	무관			연구개발/설계
396	대상	대기업		연구기획	서울 강서구			0		필수	필수	1. '25년 8월 졸업예정자 혹은 직무별 학력 기졸업자 2. 해외여행에 결격사유가 없고, 남성의 경우 병역의무를 필하였거나 면제인 분		연구개발/설계
397	현대모비스	대기업		배터리 전기화학 분석	경기 용인시 기흥구	석사		0		무관	무관	2025년 8월 졸업 예정자 또는 기졸업자 ※ 최종합격 후 회사에서 지정하는 날짜에 입사 가능해야 하며, 학/석사 졸업 요건을 충족하지 못할 경우 입사 취소될 수 있습니다.		연구개발/설계
398	한화엔진	대기업			경남 창원시 성산구			0		무관	무관			연구개발/설계
399	BGF에코머티리얼즈	중견기업			경기 화성시, 서울 강남구			0		무관	무관			연구개발/설계
400	Englewood LAB	기타						0		무관	무관			연구개발/설계
401	코스트코코리아	중견기업			울산 북구			0		무관	무관			연구개발/설계
402	크라운제과	중견기업		일반관리	서울 용산구, 대전 대덕구, 경기 양주시	학사		0		무관	무관	① 학력: 4년제 대졸학사 이상		연구개발/설계
403	동국제약	중견기업			충북 진천군, 경기 수원시 영통구			0		무관	무관			연구개발/설계
404	LG CNS	대기업		통신 OSS 영역 개발	서울 마포구			0		무관	무관			연구개발/설계
405	어플라이드머티어리얼즈코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
406	후루노코리아	외국계기업			부산 동구			0		무관	무관			연구개발/설계
407	SK하이닉스	대기업			경기 이천시, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
408	한국동서발전	공공기관/공기업			울산 중구, 충남 당진시, 강원특별자치도 동해시, 경기 고양시 일산동구, 대전 유성구			0		무관	무관			연구개발/설계
409	한국재료연구원	비영리단체/협회/재단		01) 극저온 환경용 코팅 공정 개발 및 트라이볼로지 연구	경남 창원시 성산구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
410	서울시복지재단	비영리단체/협회/재단			서울 마포구			0		무관	무관			연구개발/설계
411	경농	중견기업		기반육종팀 육종연구원	경기 이천시			0		무관	무관		[전형 안내]\n서류전형 - 인적성검사 - 면접전형 - 최종합격	연구개발/설계
412	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			연구개발/설계
413	한국원자력협력재단	비영리단체/협회/재단			해외			0		무관	무관			연구개발/설계
414	포스코DX	대기업		전기설계	경북 포항시 남구, 전남 광양시, 경기 성남시 분당구	학사		0	영어 성적 요구	필수	필수	4년제 대학 졸업(예정)자 영어 어학성적 보유자 회사가 지정한 일자에 인턴활동 및 입사가 가능한 자 '25. 6. 1 이전 병역필(예정) 또는 면제자로 해외여행에 결격사유가 없는 자 영어 말하기 성적은 '23. 5. 22 이후 취득 성적만 인정		연구개발/설계
415	아이쓰리시스템	스타트업			대전 유성구			0		무관	무관			연구개발/설계
416	LG CNS	대기업		공정물류 기구, 전장/제어	서울 강서구, 충북 청주시 서원구			5		무관	무관	기구/설계/전장/제어의 경력이 5년 이상 있으신 분 물류 센터 설비, 레이아웃/장비 설계/이행 경력이 5년 이상 있으신 분 2차 전지 물류/클린 공정 물류 설계/이행 경력이 5년이상 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
417	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			연구개발/설계
418	포스코DX	대기업			경북 포항시 남구, 전남 광양시			0		무관	무관			연구개발/설계
419	(재)지능형자동차부품진흥원	비영리단체/협회/재단			대구 달성군			0		무관	무관			연구개발/설계
420	에이스웍스코리아	스타트업			서울 강남구			0		무관	무관			연구개발/설계
421	휴비츠	중소기업			경기 안양시 동안구	학사	전자 계열	0	영어 성적 요구	무관	필수	대졸 이상(전자 관련 전공)  비즈니스 영어 회화 가능자(TOEIC 700점 이상)  해외 출장에 결격 사유가 없는 분		연구개발/설계
422	LG이노텍	대기업			서울 강서구			0		무관	무관			연구개발/설계
423	삼화콘덴서공업	중견기업			경기 용인시 처인구			0		무관	무관			연구개발/설계
424	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			연구개발/설계
425	국립정신건강센터	공공기관/공기업			서울 광진구			0		무관	무관			연구개발/설계
426	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			연구개발/설계
427	한국토지주택공사	공공기관/공기업			서울 강남구, 인천 남동구, 대구 달서구, 대전 서구, 광주 서구			0		무관	무관			연구개발/설계
428	다원시스	중견기업			경기 안산시 단원구			0		무관	무관			연구개발/설계
429	한국타이어앤테크놀로지	대기업			대전 유성구			0		무관	무관			연구개발/설계
430	주식회사 에이펙솔루션	중견기업						0		무관	무관			연구개발/설계
431	인트론바이오	중소기업						0		무관	무관			연구개발/설계
432	현대트랜시스	대기업			경기 화성시			0		무관	무관			연구개발/설계
433	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			연구개발/설계
434	삼양사	중견기업			대전 대덕구			0		무관	무관			연구개발/설계
435	한국공항공사	공공기관/공기업			서울 강서구			0		무관	무관			연구개발/설계
436	한국가스공사	공공기관/공기업						0		무관	무관			연구개발/설계
437	남양넥스모	중견기업		국내영업 A	경기 안산시 단원구, 경기 화성시			0		무관	무관			연구개발/설계
438	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			연구개발/설계
439	(주)리디자인엑스	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
440	공무원연금공단	공공기관/공기업		5급_사무(일반)_행정/법학	서울 강남구			0		무관	무관	성별 연령 제한 없음(단, 공단 정년(만 60세) 초과자 제외)  공단 인사규정의 임용결격 사유에 해당되지 않는 자		연구개발/설계
441	목암생명과학연구소	기타			서울 서초구			0		무관	무관			연구개발/설계
442	삼양홀딩스	중견기업			울산 남구, 인천 중구, 대전 대덕구, 대전 대덕구			0		무관	무관			연구개발/설계
443	HL만도	중견기업			경기 성남시 분당구	전문학사	전자 계열	0		무관	무관	전문학사 이상 전자공학 계열 전공		연구개발/설계
444	SK바이오사이언스	대기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
445	삼양그룹	대기업		환경관리	대전 유성구, 울산 남구, 인천 서구			0	영어 성적 요구	필수	필수	기졸업자 및 2025년 8월 졸업예정자 해외여행에 결격사유가 없는 자 남성의 경우 군필자 또는 면제자 공인 영어말하기 성적보유자(OPIc 및 TOEIC SPEAKING에 한함)  TOEIC SPEAKING/OPIc IM1이상  서류접수 마감일 기준 2년 이내 유효 성적에 한함		연구개발/설계
446	원익아이피에스	중견기업		고객지원(CS)	경기 평택시, 경기 화성시, 경기 평택시			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
447	수협중앙회	금융권		일반관리계(지도사업)	서울 마포구, 인천 연수구, 강원특별자치도 동해시, 충남 보령시, 전북특별자치도 김제시			0		무관	무관		[전형 안내]\n서류전형 - 필기전형 - 면접전형 - 최종합격	연구개발/설계
448	한성자동차	중견기업			서울 서초구, 경기 용인시 기흥구, 경기 성남시 분당구, 인천 남동구, 대전 대덕구			0		무관	무관			연구개발/설계
449	삼진제약	대기업			서울 마포구, 경기 화성시, 서울 강서구			0		무관	무관			연구개발/설계
450	목암생명과학연구소	기타		Computational bioloogy/bioinformatics 연구원	서울 서초구			0		무관	무관			연구개발/설계
494	펜믹스	중견기업			충남 천안시 서북구			0		무관	무관			연구개발/설계
451	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
452	노르마	중소기업		QPU 설계	서울 성동구			0		무관	무관	3학년 이상 재학 중인 학생/대학원생  연관 분야 전공		연구개발/설계
453	한덕화학	대기업			울산 남구			0		무관	무관			연구개발/설계
454	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			연구개발/설계
455	삼양홀딩스	중견기업			서울 종로구			0		무관	무관			연구개발/설계
456	LG전자	대기업		HS사업본부	서울 영등포구, 경남 창원시 성산구, 경기 평택시			0		무관	무관			연구개발/설계
457	파마리서치	중소기업		코스메틱 연구	경기 성남시 수정구	석사	화학 계열	0		무관	무관	<코스메틱 연구> 학력 : 석사 이상(화학, 생화학, 생명공학, 분자생물학 등 유관 전공자) 화장품(기초 및 헤어) 제품 개발 및 연구 유경험자 <의료기기 연구> 학력 : 석사 이상 고분자 연구 및 효력 연구 경험자	[전형 안내]\n서류전형 → 면접전형 → 최종합격	연구개발/설계
458	쓰리빌리언	스타트업			서울 강남구			0		무관	무관			연구개발/설계
459	쓰리빌리언	스타트업			서울 강남구			0		무관	무관			연구개발/설계
460	파마리서치	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
461	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			연구개발/설계
462	SK ON	대기업			대전 유성구			0		무관	무관			연구개발/설계
463	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			연구개발/설계
464	온세미컨덕터코리아	대기업		SiC TD Engineer	경기 부천시 원미구			0		무관	무관			연구개발/설계
465	카카오모빌리티	중견기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
466	글로벌스탠다드테크놀로지	중견기업			경기 화성시, 충남 아산시, 경기 평택시, 경기 용인시 기흥구			0		무관	무관			연구개발/설계
467	오알에스코리아 | ORSKOREA	외국계기업						0		무관	무관			연구개발/설계
468	대구농수산물유통관리공사	중소기업			대구 북구			0		무관	무관			연구개발/설계
469	도루코	중견기업		내부감사	서울 강남구, 경기 용인시 처인구	학사		0		무관	무관	학사 이상	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
470	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			연구개발/설계
471	엘비세미콘	중견기업			경기 평택시			0		무관	무관			연구개발/설계
472	엘비세미콘	중견기업			경기 평택시			0		무관	무관			연구개발/설계
473	엘비세미콘	중견기업			경기 안성시			0		무관	무관			연구개발/설계
474	LSP USA, LLC	기타						0		무관	무관			연구개발/설계
475	에어퍼스트	중견기업		부천공장 오퍼레이터	경기 평택시, 경기 부천시 원미구, 경북 포항시 남구, 충남 서산시, 경기 용인시 기흥구			0		무관	무관			연구개발/설계
476	엠케이에스코리아	외국계기업			경기 용인시 기흥구			0		무관	무관			연구개발/설계
477	KT넷코어	대기업			서울 강남구			0		무관	무관			연구개발/설계
478	KT넷코어	대기업			서울 강남구			0		무관	무관			연구개발/설계
479	Spigen Inc	중견기업						0		무관	무관			연구개발/설계
480	슈어소프트테크	중소기업		차량 제어기 검증의 실무 기술 습득	경기 성남시 수정구		전자 계열	0		무관	무관	전자, 컴퓨터, SW공학 관련 학과  C언어 및 Python 프로그래밍 경험  원활한 소통이 가능하신 분  컴퓨터 활용 능력(엑셀) : 中 이상  학점 3.5/4.5 이상  졸업 예정자	[전형 안내]\n서류 전형 - 필기시험 - 면접 전형 - 인턴십 - 임원 면접 - 최종 합격	연구개발/설계
481	한국타이어앤테크놀로지	대기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
482	파마리서치	중견기업		-코스메틱 연구-	경기 성남시 수정구	석사	화학 계열	0		무관	무관	학력 : 석사 이상(화학, 생화학, 생명공학, 분자생물학 등 유관 전공자) 화장품(기초 및 헤어) 제품 개발 및 연구 유경험자	[전형 안내]\n서류전형 - 면접전형 - 최종합격 및 입사	연구개발/설계
483	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
484	국경없는의사회 한국	비영리단체/협회/재단			해외			0		무관	무관			연구개발/설계
485	현대자동차	대기업		AI/Data	서울 서초구			0		무관	무관	Ph.D. candidates/graduates in STEM from global universities (including post docs) Applicants must be able to join the company by August 2026	[전형 안내]\n서류전형 - 면접전형 - 현대 기술 세미나 - 최종합격	연구개발/설계
486	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
487	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
488	아이리스브라이트	중소기업			서울 강남구			0		무관	무관			연구개발/설계
489	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			연구개발/설계
490	주식회사 더파운더즈	스타트업			서울 강남구			0		무관	무관			연구개발/설계
491	에어리퀴드코리아	중견기업			대전 대덕구			0		무관	무관			연구개발/설계
492	에어리퀴드코리아	중견기업			강원특별자치도 원주시			0		무관	무관			연구개발/설계
493	머크코리아	외국계기업		Product Compliance Specialist	서울 강남구			0		무관	무관	Bachelor's degree required. Chemistry related major is preferred, but not mandatory  0 3 years of Chemical/Hazardous substance, Regulatory, Product Stewardship, K REACH experience is a plus  Fluent English and Korean (Speaking and Writing)  Ability to work in a fast paced, global environment	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
496	램리서치코리아	외국계기업		Process Technician for KTC R&D Center	경기 용인시 기흥구			0		무관	무관			연구개발/설계
497	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			연구개발/설계
498	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			연구개발/설계
499	주식회사 라포랩스	스타트업			서울 강남구			0		무관	무관			연구개발/설계
500	주식회사 라포랩스	스타트업			서울 강남구			0		무관	무관			연구개발/설계
501	DAS North America, Inc.	중견기업			해외			0		무관	무관			연구개발/설계
502	나노신소재	중소기업		첨단 나노소재 R&D	세종특별자치시 , 대전 유성구	박사	화학 계열	0	영어 성적 요구	필수	무관	화학, 화학공학, 재료공학 등 관련 전공, 석 박사 학위 이상 비즈니스 영어 회화 가능자 해외 여행에 결격사유가 없는 자 남성의 경우, 병역 필 또는 면제자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
503	테크로스	중견기업			경기 화성시			0		무관	무관			연구개발/설계
504	삼양홀딩스	중견기업			서울 종로구			0		무관	필수	해외여행에 결격사유가 없는 분		연구개발/설계
505	한화비전	대기업		AI 연구원	경기 성남시 분당구	박사		0		무관	무관	1D Signal(Audio) processing 관련 석/박사 학위 소지자		연구개발/설계
506	Psomagen	외국계기업						0		무관	무관			연구개발/설계
507	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			연구개발/설계
508	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			연구개발/설계
509	엘비세미콘	중견기업		TEST제품기술2팀	경기 안성시	학사	전자 계열	0		무관	무관	학력: 대졸 이상(4년) 전공: 반도체, 전자, 기계, 컴퓨터, 통신 공학과		연구개발/설계
510	University of Nebraska Song Lab	기타						0		무관	무관			연구개발/설계
511	실리콘마이터스	중견기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
512	마상소프트	중소기업			부산 해운대구			0		무관	무관	배우고 성정하기 위해 노력 하는 분  이슈 및 보안 등 새로운 변화에 두려워 하지 않고 즐기시는 분  긍정적으로 생각하고 실천하는 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
513	파마리서치	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
514	파트론	중견기업			경기 화성시	석사	전기 계열	6		무관	무관	신입 (석사 이상) 또는 경력 6년 이상  고속 인터페이스 설계 경험  SI/PI/EMI 설계 경험  Design 및 Simulation Tool 사용 가능자 (SIWave,Q3D,HFSS 등)  전자/전기/통신공학 또는 관련 전공자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
515	휴온스메디텍	중소기업			경기 성남시 중원구	학사	전기 계열	2		무관	무관	학력 : 대졸 이상 (2,3년) 경력 : 신입/경력(2년 이내) 전공 : 전기/전자공학, 기계, 자동차 공학계열 운전면허증 소지자 의사소통능력, 긍정적인 마인드, 책임감 있는 사람, 문제해결능력, 지속적인 자기개발	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
516	쎄믹스	중소기업			경기 광주시		기계 계열	2		무관	무관	경력: 신입/경력 2년 이상  기계설계 가능자  회로설계 가능자  전장, 하네스 설계 가능자  공정설계 가능자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
517	팀프레시	중소기업			서울 강남구			0		무관	무관			연구개발/설계
518	조선내화	대기업		제조기술직_전남 광양	전남 광양시, 경북 포항시 남구	고졸		0		필수	무관	고등학교 이상 졸업인 분으로서, 2025년 7월 내 회사가 지정한 입사일에 입사 가능하신 분 책임감이 강하고 출결 상태가 양호하신 분 남성의 경우, 병역필 또는 면제이신 분		생산/제조
519	코오롱생명과학	대기업			충북 충주시			0		무관	무관			생산/제조
520	Englewood LAB	기타			생산/제조, 연구개발/설계			0		무관	무관			생산/제조
521	포스코모빌리티솔루션	대기업			경북 포항시 남구			0		무관	무관			생산/제조
522	크라운제과	중견기업		일반관리	서울 용산구, 대전 대덕구, 경기 양주시	학사		0		무관	무관	① 학력: 4년제 대졸학사 이상		생산/제조
523	동국제약	중견기업			충북 진천군, 경기 수원시 영통구			0		무관	무관			생산/제조
524	엘앤에프	중견기업	생산/제조					0		무관	무관			생산/제조
525	CJ푸드빌	대기업		음성공장 OEM관리파트 품질보증(QA) 담당				0		무관	무관		[전형 안내]\n서류전형 → 인적성 검사(사원급 限) → 1차 면접 → 평판조회 → 2차 면접(간부급 限) → 처우협의 → 건강검진 → 입사	생산/제조
526	DB하이텍	대기업	생산/제조					0		무관	무관	마이스터고/특성화고 26년 졸업 예정자		생산/제조
527	하나머티리얼즈	중견기업			충남 아산시			0		무관	무관			생산/제조
528	하나머티리얼즈	중견기업			충남 아산시			0		무관	무관			생산/제조
529	하나머티리얼즈	중견기업			충남 천안시 서북구			0		무관	무관			생산/제조
530	SK하이닉스	대기업			경기 이천시, 충북 청주시 흥덕구			0		무관	무관			생산/제조
531	한온시스템	중견기업			경기 광명시	고졸		0		무관	무관	고등학교 졸업 이상		생산/제조
532	LS이모빌리티솔루션	대기업			충북 청주시 흥덕구			0		무관	무관			생산/제조
533	경창산업	중견기업			대구 달서구	고졸		0		무관	무관	학력 : 고졸이상 경력: 무관		생산/제조
534	경신	중견기업		품질관리	인천 연수구, 경북 경주시			0		무관	무관			생산/제조
535	광동제약	중견기업			경기 평택시			0		무관	무관			생산/제조
536	텍사스인스트루먼트코리아	중견기업			서울 강남구			0		무관	무관			생산/제조
537	티씨케이	중견기업			경기 안성시			0		무관	무관			생산/제조
538	세아베스틸	대기업			전북특별자치도 군산시			0		무관	무관			생산/제조
539	GC녹십자웰빙	중견기업						0		무관	무관			생산/제조
540	휴온스	중견기업			충북 제천시			0		무관	무관			생산/제조
541	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			생산/제조
542	경신전선	중견기업		생산관리	충남 천안시 서북구	학사		0		필수	무관	학력: 국내외 대학 학사 학위 이상 소지자  해외출장에 결격사유가 없는 자, 남자의 경우 병역을 필한 자  토익 700점 이상 또는 이에 준하는 공인어학성적 소지자	[전형 안내]\n서류전형 - AI역량검사 - 면접전형 - 최종합격	생산/제조
543	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			생산/제조
544	주식회사 에이펙솔루션	중소기업	생산/제조					0		무관	무관			생산/제조
545	현대트랜시스	대기업			경기 화성시			0		무관	무관			생산/제조
546	삼화콘덴서공업	중견기업			경기 용인시 처인구			0		무관	무관			생산/제조
547	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			생산/제조
548	SK레조낙	대기업			경북 영주시	고졸		0		무관	무관	○  학력 : 고졸 이상 ○  경력 : 무관		생산/제조
549	코스비전	대기업		SCM	대전 대덕구	고졸	화학 계열	0		무관	무관	경력: 무관 학위: 고졸이상 전공: 화학/화장품학	[전형 안내]\n서류전형 → 인성검사 / 1차면접 → 인턴전형(3개월) → 최종면접 → 최종합격	생산/제조
550	삼아알미늄	중견기업	생산/제조					0		무관	무관			생산/제조
551	네패스	중견기업			충북 청주시 청원구, 충북 청주시 청원구			0		무관	무관			생산/제조
552	다인정공	중견기업	생산/제조					0		무관	무관			생산/제조
553	이디야	중견기업			서울 강남구, 광주 서구, 경기 고양시 일산동구, 서울 동대문구, 서울 강남구			0		무관	무관			생산/제조
554	머크	중견기업						0		무관	무관			생산/제조
555	(주)삼구아이앤씨	중견기업	생산/제조, 디자인					0		무관	무관			생산/제조
556	DB하이텍	대기업	생산/제조					0		무관	무관			생산/제조
557	동희오토	중견기업			충남 서산시			0		무관	무관			생산/제조
558	주식회사 에이펙솔루션	중견기업			생산/제조, 연구개발/설계			0		무관	무관			생산/제조
559	Posco AAPC LLC.	중견기업	생산/제조					0		무관	무관			생산/제조
560	POSCO AAPC LLC.	대기업						0		무관	무관			생산/제조
561	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			생산/제조
562	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			생산/제조
563	제뉴원사이언스	중견기업			세종특별자치시 , 충북 제천시			0		무관	무관			생산/제조
564	한국콜마	중견기업			세종특별자치시			0		무관	무관			생산/제조
565	삼양홀딩스	중견기업			울산 남구, 인천 중구, 대전 대덕구, 대전 대덕구			0		무관	무관			생산/제조
566	SK피유코어	중견기업	생산/제조					0		무관	무관			생산/제조
567	HD현대인프라코어	대기업			전북특별자치도 군산시			0		무관	무관			생산/제조
568	SIMPAC	중견기업			대구 달성군			0		무관	무관			생산/제조
569	삼양그룹	대기업		환경관리	대전 유성구, 울산 남구, 인천 서구			0	영어 성적 요구	필수	필수	기졸업자 및 2025년 8월 졸업예정자 해외여행에 결격사유가 없는 자 남성의 경우 군필자 또는 면제자 공인 영어말하기 성적보유자(OPIc 및 TOEIC SPEAKING에 한함)  TOEIC SPEAKING/OPIc IM1이상  서류접수 마감일 기준 2년 이내 유효 성적에 한함		생산/제조
570	쿠팡풀필먼트서비스	대기업		설비보전 전문가 팀원급	경기 고양시 덕양구, 경기 화성시, 인천 서구, 경기 평택시, 경북 경산시			1		무관	무관	관련 학과 졸업 or 관련 자격증 보유 or 관련 경력 1년 이상		생산/제조
571	LX MMA	대기업		계전	전남 여수시, 대전 유성구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 인턴십 - 입사	생산/제조
572	다스	중견기업		회계	경북 경주시	학사		0		무관	무관	4년제 대졸 ('25년 8월 졸업예정자 가능)  해외 출국에 결격사유가 없는 자	[전형 안내]\n서류전형 - 역량검사 - 면접전형 - 인턴십 - 최종합격	생산/제조
573	해태제과식품	중견기업			충남 아산시, 광주 북구, 경기 양주시, 서울 용산구			0		무관	무관			생산/제조
574	에어퍼스트	중견기업			경기 용인시 기흥구			0		무관	무관			생산/제조
575	에쓰오일토탈에너지스윤활유	대기업				고졸	기계 계열	0		무관	무관	1) 기술사 : 건축기계설비, 기계, 건설기계, 공조냉동기계, 산업기계설비, 용접 2) 기능장 : 배관, 에너지관리, 용접 3) 기   사 : 건축설비, 건설기계설비, 공조냉동기계, 용접, 에너지관리, 설비보전, 일반기계 4) 산업기사 : 건출설비, 건설기계설비, 공조냉동기계, 에너지관리, 배관, 용접 (단, 산업기사는 취득 후 관련분야 3년이상 경력 필수) l  고등학교 졸업 이상	[전형절차]\n- 서류전형 > 인적성 및 면접전형 > 최종합격	생산/제조
576	HD현대오일뱅크	대기업	생산/제조	ePTFE 분리막 생산				0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
577	타라티피에스	중견기업		국내사업본부_수주 영업	서울 마포구, 경기 파주시			0		필수	필수	2025년 7월 입사 가능자  남성의 경우 병역필 또는 면제자  해외 출장에 결격사유 없는 자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
578	삼진제약	대기업			서울 마포구, 경기 화성시, 서울 강서구			0		무관	무관			생산/제조
579	번개장터	스타트업			서울 성동구			0		무관	무관			생산/제조
580	ICER Brands Services, LLC.	외국계기업	생산/제조					0		무관	무관			생산/제조
581	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			생산/제조
582	한덕화학	대기업			울산 남구			0		무관	무관			생산/제조
583	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			생산/제조
584	동국제강	중견기업			충남 당진시			0		무관	무관			생산/제조
585	주식회사 에이펙솔루션	중견기업	생산/제조					0		무관	무관			생산/제조
586	효림그룹	중견기업		XE_품질보증팀	서울 강남구, 대구 달서구, 경북 경산시, 경남 창원시 성산구, 경북 경산시			0		무관	무관			생산/제조
587	현대엠시트	대기업			충남 아산시			0		무관	무관			생산/제조
588	주식회사 에이펙솔루션	중견기업	생산/제조					0		무관	무관			생산/제조
589	LG화학	대기업			전남 여수시			0		무관	무관			생산/제조
590	쎄믹스	중소기업			경기 광주시			0		무관	무관			생산/제조
591	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			생산/제조
592	주식회사 인터엑스	스타트업			울산 중구			0		무관	무관			생산/제조
593	SK ON	대기업			대전 유성구			0		무관	무관			생산/제조
594	에어리퀴드코리아	중견기업			서울 강남구	전문학사	화학 계열	0		무관	무관	2,3년제 전문대 화학/ 화학공학 관련 전공 졸업자		생산/제조
595	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			생산/제조
596	마니커에프앤지	중소기업			경기 용인시 처인구, 서울 송파구			0		무관	무관			생산/제조
597	DaeSang America USA, Inc.	중견기업	생산/제조					0		무관	무관			생산/제조
598	SB America Inc	중견기업	무역/유통, 생산/제조					0		무관	무관			생산/제조
599	태양연마	중견기업			무역/유통, 영업/고객상담, 경영/사무, 생산/제조, 연구개발/설계, IT/인터넷			0		무관	무관			생산/제조
600	하나마이크론	중견기업		반도체 공정기술엔지니어	충남 아산시			0		무관	무관			생산/제조
601	(주)미미박스	외국계기업			서울 강남구			0		무관	무관			생산/제조
602	세스코	중견기업						0		무관	무관			생산/제조
603	삼전순약공업	중소기업			서울 강남구, 충북 진천군, 경북 포항시 남구, 대전 유성구, 서울 영등포구			0		무관	무관			생산/제조
604	LSP USA, LLC	기타			IT/인터넷, 연구개발/설계, 생산/제조			0		무관	무관			생산/제조
605	LSP USA, LLC	기타	생산/제조, IT/인터넷					0		무관	무관			생산/제조
606	KSM	중견기업			경기 김포시			0		무관	무관			생산/제조
607	에어퍼스트	중견기업		부천공장 오퍼레이터	경기 평택시, 경기 부천시 원미구, 경북 포항시 남구, 충남 서산시, 경기 용인시 기흥구			0		무관	무관			생산/제조
608	EEW코리아	외국계기업			경남 사천시			0		무관	무관			생산/제조
609	머크코리아	외국계기업			경기 시흥시			0		무관	무관			생산/제조
610	엠케이에스코리아	외국계기업			경기 용인시 기흥구			0		무관	무관			생산/제조
611	헨켈코리아	외국계기업		Production Administration Intern - 1year GDP	인천 연수구			0		무관	무관	At least a 4th year undergraduate student is required Excellent command of MS office is required utilizing macros is preferred Native proficiency in Korean and basic English skills are required Good communication skills are preferred Able to work for one year at the Songdo plant	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
612	헨켈코리아	외국계기업		Quality Intern_Eumseong				0		무관	무관	At least a 3rd year undergraduate student in Engineering, Chemistry, or a related field is required  Excellent command of MS Office is required  Native proficiency in Korean and basic English skills are required  Good communication skills are preferred	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
613	한섬	대기업			서울 강동구	전문학사		0		무관	무관	전문학사 학위 이상  경력 무관(신입채용)		생산/제조
614	한솔섬유	대기업	생산/제조	국내원단생산팀		전문학사		3		무관	무관	1. 학력: 2년제 대학 졸업(예정) 이상 2. 전공: 무관 3. 어학: 당사 어학기준 충족 4. 경력: 신입 또는 3년 이하  필수) 운전면허 소지자 및 운전가능하신 분		생산/제조
615	앰코테크놀로지코리아	중견기업			인천 연수구, 인천 계양구			0		무관	무관			생산/제조
616	POSCO AAPC LLC.	대기업						0		무관	무관			생산/제조
617	SEOHAN AUTO GEORGIA	중견기업	무역/유통, 생산/제조, 마케팅/광고/홍보, 경영/사무, 영업/고객상담					0		무관	무관			생산/제조
618	Seoyon E-hwa Interior Systems Alabama	중견기업	무역/유통, 생산/제조, 경영/사무					0		무관	무관			생산/제조
619	LG CNS	대기업		공정물류	서울 강서구			5		무관	무관	기구/설계/전장/제어의 경력이 5년 이상 있으신 분  물류 센터 설비, 레이아웃/장비 설계/이행 경력이 5년 이상 있으신 분  2차 전지 물류/클린 공정 물류 설계/이행 경력이 5년이상 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
620	Sinjin Texas	중소기업	생산/제조, 무역/유통					0		무관	무관			생산/제조
621	서연이화	대기업	생산/제조					0		무관	무관			생산/제조
622	보쉬렉스로스코리아	외국계기업			부산 강서구			0		무관	무관			생산/제조
623	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			생산/제조
624	한솔섬유	중견기업			서울 송파구	전문학사		3		무관	무관	1. 학력: 2년제 대학 졸업(예정) 이상 2. 전공: 무관 3. 경력: 신입 또는 3년 이하 4. 담당 업무: 원단 생산관리  원단 관련 오더관리  원단 오더관련 개발/기획/품질관리		생산/제조
625	타이코에이엠피	외국계기업			경북 경산시			0		무관	무관	QIP, SAP, TARS  공정 및 제품(도면) 이해  제품추적 및 봉쇄조치  변경점 관리 및 절차숙지	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
626	램리서치코리아	외국계기업		Process Technician for KTC R&D Center	경기 용인시 기흥구			0		무관	무관			생산/제조
627	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			생산/제조
628	헨켈코리아	외국계기업			서울 마포구			0		무관	무관			생산/제조
629	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관	기간계약직 포지션(1년 계약직)		생산/제조
630	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관			생산/제조
631	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관			생산/제조
632	JCS Systems, Inc	기타	무역/유통, 생산/제조					0		무관	무관			생산/제조
633	세스코	중견기업				고졸		0		무관	무관	학력 : 고등학교 졸업 이상 경력 : 무관 잔업, 특근 가능한 자 (월 평균 1~3회) 해외여행에 결격 사유가 없는 자 ❖ 채용절차 서류전형 → 1차면접 → 최종합격 ※ 해당 공고는 채용 완료 시 조기 마감될 수 있습니다.		생산/제조
634	Simwon NA Corp.	중견기업						0		무관	무관			생산/제조
635	DAS North America, Inc.	중견기업						0		무관	무관			생산/제조
636	유한화학	중견기업		생산부문	경기 안산시 단원구, 경기 화성시			0		무관	무관			생산/제조
637	블랭크코퍼레이션	중소기업			서울 강남구			0	영어 성적 요구	무관	무관	리빙 카테고리에 관심이 많은 분 프로세스가 강하고 글로벌 소싱 업무를 체계적으로 배우고 싶으신 분 제2외국어 (영어 & 중국어)에 강점이 있으신 분 논리를 기반으로 한 커뮤니케이션이 가능하신 분 유연한 사고방식과 수용성이 뛰어나신 분		생산/제조
638	AJIN/Wooshin USA	중견기업						0		무관	무관			생산/제조
639	한솔섬유	중견기업	생산/제조					0		무관	무관			생산/제조
640	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			생산/제조
641	엘비세미콘	중견기업		TEST제품기술2팀	경기 안성시	학사	전자 계열	0		무관	무관	학력: 대졸 이상(4년) 전공: 반도체, 전자, 기계, 컴퓨터, 통신 공학과		생산/제조
642	쌤소나이트코리아	중견기업		Sales Inventory Planning Coordinator (6개월 인턴)	서울 강남구	학사		0		무관	무관	4년제 학사 학위 이상 소지자 (졸업예정자 및 수료자 포함)		생산/제조
643	아진조지아	대기업	생산/제조					0		무관	무관			생산/제조
644	네패스아크	중견기업						0		무관	무관			생산/제조
645	올라까삐딴	중소기업			서울 서대문구			0		무관	무관			생산/제조
646	삼양제분	중소기업			강원특별자치도 원주시			0		무관	무관			생산/제조
647	Hwashin America Corp.	중소기업						0		무관	무관			생산/제조
648	한솔섬유	중견기업	생산/제조					0		무관	무관			생산/제조
649	인터코스코리아	중소기업			경기 오산시			0		무관	무관			생산/제조
650	가람	중소기업						0		무관	무관			생산/제조
651	SK키파운드리	대기업			충북 청주시 흥덕구			0		무관	무관			생산/제조
652	TeaAroma, Inc.	외국계기업	생산/제조					0		무관	무관			생산/제조
653	Daesang America Inc (대상그룹 미국현지법인)	대기업			연구개발/설계, 생산/제조			0		무관	무관			생산/제조
654	네패스아크	중견기업	생산/제조					0		무관	무관			생산/제조
655	Ajin USA, Inc	중견기업	생산/제조					0		무관	무관			생산/제조
656	크나우프석고보드	중견기업			충남 당진시			0		무관	무관			생산/제조
657	휴온스메디텍	중소기업			경기 성남시 중원구	학사	전기 계열	2		무관	무관	학력 : 대졸 이상 (2,3년) 경력 : 신입/경력(2년 이내) 전공 : 전기/전자공학, 기계, 자동차 공학계열 운전면허증 소지자 의사소통능력, 긍정적인 마인드, 책임감 있는 사람, 문제해결능력, 지속적인 자기개발	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	생산/제조
658	쿠팡로지스틱스서비스	대기업			인천 남동구, 경기 고양시 덕양구, 경기 김포시, 충북 진천군, 경기 광주시			0		무관	무관	학력/연령/성별 무관  엑셀 활용 가능자		생산/제조
659	쎄믹스	중소기업			경기 광주시			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	생산/제조
660	Deloitte 안진회계법인	외국계기업			서울 영등포구			0		무관	무관			IT/인터넷
661	현대피엔에스	대기업		세종R&D센터	세종특별자치시	학사	전기 계열	5		무관	무관	경력 사항  대리 과장급 : 관련 직무 경력 5년 이상  사원급 : 관련 직무 경력 3년 이상  학위/전공 학사 이상 전기, 전자 관련 전공자 또는 관련 직무 수행 가능한 자는 전공 무관  성별/연령 (성별무관)  어학/자격증 : 무관	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
662	한국동서발전	공공기관/공기업			울산 중구, 충남 당진시, 강원특별자치도 동해시, 경기 고양시 일산동구, 대전 유성구			0		무관	무관			IT/인터넷
663	카카오	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
664	대한지방행정공제회	비영리단체/협회/재단	경영/사무, IT/인터넷	일반				0		무관	무관			IT/인터넷
665	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			IT/인터넷
666	한국원자력협력재단	비영리단체/협회/재단	해외					0		무관	무관			IT/인터넷
667	포스코DX	대기업		전기설계	경북 포항시 남구, 전남 광양시, 경기 성남시 분당구	학사		0	영어 성적 요구	필수	필수	4년제 대학 졸업(예정)자 영어 어학성적 보유자 회사가 지정한 일자에 인턴활동 및 입사가 가능한 자 '25. 6. 1 이전 병역필(예정) 또는 면제자로 해외여행에 결격사유가 없는 자 영어 말하기 성적은 '23. 5. 22 이후 취득 성적만 인정		IT/인터넷
668	세정아이앤씨	중소기업		IT개발자	부산 금정구			3		무관	무관	대학 졸업자 및 2025년 졸업예정자  유관경력 3년 미만 (경력)	[전형 안내]\n서류전형 - 인적성검사 - 면접전형 - 최종합격	IT/인터넷
669	PFCT	스타트업			서울 서초구			0		무관	무관			IT/인터넷
670	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
671	네이버웹툰	대기업		글로벌 웹툰 Creative Video 제작	경기 성남시 분당구			0	영어 성적 요구	무관	무관	Adobe Premiere Pro, After Effects, Adobe CC, Figma 등 다양한 디자인 및 영상 편집 툴에 대한 높은 숙련도를 보유하신 분  영어/중국어/인니어/태국어 중 1개 언어를 구사하실 수 있는 분 (필수) *각 언어 별로 채용을 진행합니다.  웹툰 및 만화 콘텐츠에 대한 높은 애정과 이해도를 보유하신 분  웹툰/애니/게임 감성의 리터칭, 이펙트 스킬 및 일러스트레이션 등의 작화 스킬을 보유하신 분		IT/인터넷
672	아이쓰리시스템	스타트업			대전 유성구			0		무관	무관			IT/인터넷
673	LG CNS	대기업		SAP BC(Basis Consultant)	서울 강서구, 서울 강서구			0		무관	무관	SAP ERP 프로젝트(SI) 또는 운영 업무(SM)에서 5년 이상 BC 역할을 경험하신 분  SAP BTP(Business Technology Platform) 기반 업무를 경험하신 분		IT/인터넷
674	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			IT/인터넷
675	Tossplace	기타	미디어, 경영/사무, IT/인터넷					0		무관	무관			IT/인터넷
676	포스코DX	대기업			경북 포항시 남구, 전남 광양시			0		무관	무관			IT/인터넷
677	국립공원공단	공공기관/공기업		일반직(6급)_공원행정	경남 진주시, 전북특별자치도 전주시 덕진구, 충남 공주시, 강원특별자치도 원주시, 경북 영주시			0		무관	무관		[전형 안내]\n서류전형 - 필기전형 - 역량검사 - 면접전형 - 최종합격	IT/인터넷
678	LG이노텍	대기업			서울 강서구			0		무관	무관			IT/인터넷
679	네이버클라우드	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
680	네이버클라우드	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
681	한양대학교	기타		사무직-일반행정	서울 성동구, 경기 안산시 상록구			0		필수	필수	해외여행에 결격사유가 없는 자  병역필 또는 면제자  공무원 임용에 결격사유가 없는 자	[전형 안내]\n서류전형 - AI인적성검사 - 면접전형 - 최종합격	IT/인터넷
682	파괴연구소	대기업		아트디렉터	서울 강남구			0		무관	무관			IT/인터넷
683	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			IT/인터넷
684	SM엔터테인먼트	대기업			서울 성동구			0		무관	무관			IT/인터넷
685	스타쉽엔터테인먼트	대기업			서울 강남구	학사		0		무관	무관	학력 : 대졸 이상 경력 : 무관 영상 편집 기술 보유자(Adobe계열 프로그램 필수)  디자인 기획 능력 보유자  영상 촬영에 대한 기초 지식 보유 및 전반적인 영상 제작 업무 가능자  엔터테인먼트 및 문화 사업에 관심이 많은 분  책임과 애정을 갖고 업무를 수행하는 분		IT/인터넷
686	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			IT/인터넷
687	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			IT/인터넷
688	케이씨텍	중견기업						0		무관	무관			IT/인터넷
689	한국신용정보원	공공기관/공기업		일반	서울 중구	학사		0		무관	무관	학사 이상 (2025년 8월 졸업예정자 포함)	[전형 안내]\n서류 전형 - 필기전형 - 면접전형 - 최종합격	IT/인터넷
690	케이씨텍	중견기업	생산/제조, IT/인터넷					0		무관	무관			IT/인터넷
691	아디다스코리아	대기업			서울 서초구			0		무관	무관			IT/인터넷
692	넥슨네트웍스	대기업		게임QA	경기 성남시 분당구			0		무관	무관	게임을 다양하고 깊게 즐기시는 분  게임 콘텐츠와 게임 플랫폼에 대한 이해도를 보유하신 분  긍정적, 적극적, 논리적으로 커뮤니케이션하시는 분  기획서나 구현된 결과물을 통해 프로세스 및 작동 순서를 이해하실 수 있는 분 게임 로그, 중요 결함 사례 및 히스토리를 학습하고 개선점을 생각할 수 있는 분  습득한 경험과 노하우를 기록하여 활용하고 공유할 수 있는 분	[전형 안내]\n서류전형 → 온라인 인성검사 → 실무진 면접 → 인턴 최종 합격 → 인턴십(6개월) → 전환평가	IT/인터넷
693	Grand BK, Corp.	외국계기업	해외					0		무관	무관			IT/인터넷
694	순수본	중견기업		온라인 몰 콘텐츠 웹디자이너	서울 영등포구			0		무관	무관	각종 업무 툴 활용에 능숙하신 분 (Figma, Photoshop, Illustrator) 손이 빠르고 다량의 콘텐츠를 효율적으로 작업할 수 있는 분 음식/식품군 제품의 콘텐츠 디자인에 익숙한 분 타 부서와 협업 및 피드백 커뮤니케이션 능력을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
695	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
696	더그로스	중소기업		글로우엠 콘텐츠 마케터 인턴	서울 송파구			0		무관	무관	최신 마케팅 트렌드에 능통하신 분 트렌드 분석 및 예측 능력을 바탕으로 브랜드 가치를 상승시킬 수 있으신 분 소비자들의 즉각적, 실제적인 반응을 통해 최고 효율의 마케팅을 찾아가며 성장하고 싶으신 분	[전형 안내]\n서류 전형 > 1차 인터뷰 > 2차 인터뷰 > 처우협의 > 최종 합격	IT/인터넷
697	PTKOREA	외국계기업		웹사이트 운영 프로젝트 영문 콘텐츠 검수 및 QA	서울 강남구	학사		0		무관	무관	학사 이상이신 분 (휴학생, 졸업예정자, 기졸업자)  MS Office 사용이 원활하신 분 (ppt, excel)  원활한 커뮤니케이션 역량을 보유하신 분	[전형 안내]\n서류전형 - 1차면접 - 최종합격\n\n서류 전형 - 인성검사 - 면접전형 - 최종합격	IT/인터넷
698	한국토지주택공사	공공기관/공기업			서울 강남구, 인천 남동구, 대구 달서구, 대전 서구, 광주 서구			0		무관	무관			IT/인터넷
699	현대자동차	대기업		제조 IT / 산업 자동화 데이터 엔지니어	서울 서초구	학사	전기 계열	0	영어 성적 요구	무관	무관	컴퓨터공학, 전기공학, 컴퓨터과학, 산업공학 또는 관련 분야에서 학사 이상의 학위를 보유하신 분  7년 이상의 Kepware, Cybus, HiveMQ, Litmus, Softing AG, Ignition, UNS, Sightmachine, AVEVA, Siemens, Rockwell, Beckhoff 등 산업 관련 OT/IT수집체계, 자동화SW 개발 또는 전개 관련 경력을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
901	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
700	현대자동차	대기업		제조 DX 솔루션 / 시스템 아키텍트	서울 서초구	학사	전기 계열	0	영어 성적 요구	무관	무관	컴퓨터/전기/산업공학, 컴퓨터과학 등의 관련 분야에서 학사 이상의 학위를 보유하신 분  10년 이상의 제조 시스템/솔루션 아키텍처 및 IIOT 솔루션 구현(인프라 측면 및 데이터 파이프라인을 고려)에 대한 경력(기술 서비스/ 컨설팅 업체)을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
701	현대자동차	대기업		MES 개발 및 합리화 전략 기획	서울 서초구	학사	컴퓨터 계열	0	영어 성적 요구	무관	무관	컴퓨터 과학, 정보 기술 또는 관련 분야에서 학사 이상의 학위를 보유하신 분  5년 이상의 MES(Siemens, Wonderware 등) 전개 및 활용 경력을 보유하신 분  IT시스템 프로젝트 및 벤더 관리 경험을 보유하신 분  MES의 핵심 구성 요소에 대한 이해와 소프트웨어 설계 제작 경험을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
702	PTKOREA	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
703	한국항공우주연구원	기타			대전 유성구			0		무관	무관			IT/인터넷
704	통계청	공공기관/공기업	IT/인터넷					0		무관	무관			IT/인터넷
705	한국타이어앤테크놀로지	대기업		R&D_Virtual Simulation 툴 개발 및 응용	대전 유성구	석사	기계 계열	0		무관	무관	1. 기계 계열 전공자 2. 석사/박사 과정 중 고체역학과 수치해석 관련 업무 능력 보유자 (연속체 역학, 유한요소법 이수 등) 3 다양한 CAE Tool 활용 지식(FEM, CFD 등)  보유 및 사용 유경험자 (abaqus 등) 4. Computational mechanics 연구 경험 보유자 (토목 공학 전공 자 가능)	[전형 안내]\n서류전형 - HKAT - 면접전형 - 최종합격	IT/인터넷
706	(주)지로	중소기업		프로덕트 디자이너 인턴	서울 강남구			0		무관	무관	사용자 친화적인 UI/UX 디자인을 위한 시각적 감각을 보유하신 분 레이아웃, 폰트, 컬러 등 디자인 기본기가 탄탄하신 분 Figma 툴의 디자인 시스템을 포함한 다양한 기능을 능숙하게 활용할 수 있는 분 디자인 의도를 논리적으로 설명할 수 있는 커뮤니케이션 역량을 갖추신 분 새로운 기술과 지식을 학습하는 데 거부감이 없고, 빠르게 학습하실 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
707	트라닉스	대기업		재무	충남 서산시			0		무관	무관			IT/인터넷
708	라이드플럭스	스타트업		Mapping SW Engineer	서울 영등포구, 제주특별자치도 제주시	석사		0		무관	무관	현재 재학 중인 학/석사 졸업생 및 졸업예정자는 비대상입니다.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
709	플리토	중소기업			서울 강남구			0		무관	무관	신입 및 경력 (학력 무관)  IT 서비스의 네트워크 및 보안 등의 기본 지식 보유하신 분  운전면허 보유 및 차량 운전 가능하신 분  국내 출장 및 외근 가능하신 분		IT/인터넷
710	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			IT/인터넷
711	셀트리온	대기업			인천 연수구			0		무관	무관			IT/인터넷
712	한국투자증권	대기업			서울 영등포구			0		무관	무관			IT/인터넷
713	바카티오	중소기업		Backend Engineer 인턴	서울 마포구			0		무관	무관	문제 해결을 위해 다방면으로 고민하는 분 필요에 따라 수용할 수 있는 열린 자세를 가지신 분 다른 직무와의 커뮤니케이션에 익숙한 분 LLM API 활용하여 서비스 개발한 경험이 있는 분 ElasticSearch 검색엔진을 이용한 RAG 를 도입한 경험이 있는 분 Docker 를 적극적으로 활용하여 인프라를 관리, 유지 보수한 경험이 있는 분 AI Tool (예. Cursor) 을 활용하여 생산성 높은 프로그래밍 경험이 있는 분 팀 단위 개발 생산성을 위해 기여한 경험이 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
714	슈퍼센트	중소기업		AI 기술 리서치	서울 송파구			0		무관	무관	AI 기술에 높은 관심을 가지고 있고, 적극적으로 배우려는 자세를 갖추신 분 새로운 기술을 빠르게 익히고 실무에 적용하는 데 흥미를 느끼시는 분 디지털 콘텐츠 플랫폼 및 SNS를 능숙하게 다루시는 분 정보를 명확하게 정리하고 전달하는 커뮤니케이션 역량을 갖추신 분 현재 졸업 또는 졸업 예정이며, 3개월 인턴십 이후 입사 가능하신 분	[전형 안내]\n서류 전형 → 과제전형 → 인터뷰 → 처우 협의 → 최종 합격	IT/인터넷
715	한국공항공사	공공기관/공기업			서울 강서구			0		무관	무관			IT/인터넷
716	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			IT/인터넷
717	에고이즘	중소기업			서울 성동구			0		무관	무관			IT/인터넷
718	플랜핏	중소기업	IT/인터넷					0		무관	무관	IT 서비스 PM & PO 관련된 업무에 관해 실제로 경험이 있는 분  사용자와 대화에 두려움이 없으며 사용자 관점에서 생각하며 사용자에게 관심이 많은 분  데이터를 통해 문제를 파악하고 데이터를 측정하여 해당 데이터에 기반한 논리적인 의사 결정을 내릴 수 있는 분  다양한 분야의 이해관계자(팀원 및 외부인)와 효율적인 커뮤니케이션이 가능한 분	[인재 영입 프로세스]\n- 서류 전형 -> 1차 직무 인터뷰 -> 2차 컬쳐핏 인터뷰 -> 최종 합격	IT/인터넷
719	리얼드로우	중소기업		SW Engineer	서울 마포구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격\n\n*이메일 접수: people@realdraw.ai\n(이력서, 포트폴리오)	IT/인터넷
720	주식회사 화이트큐브	스타트업		콘텐츠 디자이너 인턴	서울 강남구			0		무관	무관	그래픽 툴(Figma, Photoshop, Illustrator 등)을 활용한 디자인이 가능하신 분 비즈니스 성장을 위한 다양한 프로젝트 기획 및 디자인 가능하신 분 디자인 결과물의 성과 데이터를 함께 확인하고 개선하여 ’비즈니스 성과’를 달성하고 싶은 분 ex) 상품 소개서 개선을 통한 B2B 계약 전환율 상승, 광고 소재 효율 테스트 등	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
773	대구경북첨단의료산업진흥재단	비영리단체/협회/재단		가.연구직[직속 및 전략기획본부]	대구 동구			0		무관	무관		[전형 안내]\n서류전형 - 필기시험 - 면접전형 - 최종합격	IT/인터넷
774	(주)힐링페이퍼	스타트업			서울 강남구			0		무관	무관			IT/인터넷
721	주식회사 화이트큐브	스타트업		백엔드 개발자 인턴	서울 강남구		컴퓨터 계열	0		무관	무관	Python 또는 Node.js, Go 등 하나 이상의 언어에 익숙하신 분  HTTP, HTML, JSON 등 웹 기본 구조에 대한 이해가 있으신 분  사용자 경험과 고객 가치를 최우선으로 하여 개발을 통해 비즈니스 성장에 기여하고 싶은 열망이 있는 분  진짜 ‘성공’을 만들고자 하는 열망이 강한 분.  이 업무를 왜 해야 하는지를 항상 고민하며, 해당 이유를 근거로 팀원들을 설득할 수 있는 분  컴퓨터공학 전공 혹은 이에 준하는 지식 및 활용 역량이 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
722	진에어	대기업			서울 강서구			0		무관	무관			IT/인터넷
723	이앤에스글로벌	중견기업			서울 강남구			0		무관	무관			IT/인터넷
724	CJ푸드빌	대기업		데이터 전략·분석 전문가	서울 중구	학사	컴퓨터 계열	3		무관	무관	4년제 학사 졸 이상  관련 학과 : 컴퓨터공학, 산업공학, 경영정보, 문헌정보 등  Data 분석 역량 및 관련 프로젝트 경력 3년 이상  다양한 Data 분석 Tool 활용 경험 (Python, SQL 등)  ‘Data’ 기반으로 객관적인 현상 인식과 '분석적 사고'를 통해 솔루션을 도출하는 역량  현장 업무에 대한 이해를 위한 현업과의 협업 역량  Data 분석을 위한 Data Engineer 등 관련 전문가들과의 협업 역량	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
725	CJ푸드빌	대기업		디지털서비스 APP 개발자	서울 중구	학사	컴퓨터 계열	0		무관	무관	4년제 대학 졸업자 이상  컴퓨터공학, 산업공학, 소프트웨어공학 등 관련학과  React Native 및 Flutter 개발 경험 (최소 5년 이상) 💻  App 설계부터 배포, 서비스 운영까지의 경험이 있으신 분  자기 주도적인 개발과 전체 프로세스를 고려한 설계와 구현이 가능 하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
726	삼성전자	대기업		[VD사업부] Product Partnership	경기 수원시 영통구			0		무관	무관			IT/인터넷
727	코레일네트웍스	공공기관/공기업			서울 용산구, 서울 구로구, 인천 연수구, 경기 과천시, 부산 동래구			0		무관	무관			IT/인터넷
728	주식회사 놀유니버스	중견기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
729	한미그룹	대기업		[한미약품] Medical	서울 송파구			0		무관	무관			IT/인터넷
730	국가정보원	공공기관/공기업		해외정보	서울 강남구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
731	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
732	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
733	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
734	Toss	중소기업	IT/인터넷, 마케팅/광고/홍보, 영업/고객상담, 서비스					0		무관	무관			IT/인터넷
735	SNOW	대기업		남미 타겟 EPIK 콘텐츠 마케팅 체험형 인턴	경기 성남시 분당구			0		무관	무관			IT/인터넷
736	근로복지공단	공공기관/공기업			울산 중구, 부산 금정구, 대구 중구, 인천 남동구, 강원특별자치도 원주시			0		무관	무관			IT/인터넷
737	새만금개발공사	공공기관/공기업		토지공급	전북특별자치도 군산시			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
738	해태제과식품	중견기업			충남 아산시, 광주 북구, 경기 양주시, 서울 용산구			0		무관	무관			IT/인터넷
739	펄어비스	중견기업		검은사막 PC 중국 운영 담당자	경기 과천시			0		무관	필수	원어민 수준의 중국어 사용이 가능하신 분 하나의 게임을 오랜 시간 플레이한 경험이 있거나, PC MMORPG에 대한 이해도가 있으신 분 실시간으로 변화하는 라이브 서비스 환경 흐름에 맞춰 협업하실 수 있는 분 유저를 최우선으로 생각하는 서비스 마인드와 책임감 있는 직업의식을 갖추신 분 원만한 커뮤니케이션 능력을 보유하신 분 업무에 대한 적극성을 갖고 새로운 배움에 주저함이 없으신 분 해외 출장 결격 사유 없으신 분	[전형 안내]\n서류전형 - 필기전형 - 면접전형 - 최종합격	IT/인터넷
740	더존비즈온	중견기업			강원특별자치도 춘천시		컴퓨터 계열	0		무관	무관	HTML, CSS, JavaScript React, DOM 기본 이해도 보유자  컴퓨터공학 또는 소프트웨어 등 관련학과 전공자  관련 업무, 프로젝트 경험 보유자	[전형절차]\n- 서류전형 > 1차 실무자면접 > 2차 임원면접 > 경력/평판조회 > 처우협의/채용검진 > 최종합격	IT/인터넷
741	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
742	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
743	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
744	타라티피에스	중견기업		국내사업본부_수주 영업	서울 마포구, 경기 파주시			0		필수	필수	2025년 7월 입사 가능자  남성의 경우 병역필 또는 면제자  해외 출장에 결격사유 없는 자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
745	AXA손해보험	금융권		코어개발팀 자동차보험 시스템 개발자	서울 용산구	학사		0		무관	무관	정규 4년제 대학교 졸업자 또는 졸업 예정자		IT/인터넷
746	세정아이앤씨	중소기업		IT인프라 운영	부산 금정구	학사	이공 계열	0		무관	무관	대졸 및 2025년 졸업예정자  이공계 전공  H/W 장비에 대한 깊은 관심도	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
747	일동제약	중견기업			서울 서초구, 경기 화성시, 경기 안성시			0		무관	무관			IT/인터넷
748	디스트릭트코리아	중소기업		웹기획/운영	서울 강남구			0		무관	필수	미디어아트와 디지털 디자인에 관심이 있는 분  Figma 사용이 가능하신 분  포토샵, 애프터이펙트, 프리미어, 일러스트레이터 활용이 가능하신 분  HTML 및 DNS등의 웹사이트 개발 관련 지식과 활용이 가능하신 분  해외 출장에 결격사유가 없는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
749	SK C&C USA INC	대기업	해외					0		무관	무관			IT/인터넷
750	라인플러스	대기업			경기 성남시 분당구	학사		2		무관	무관	2025년 8월 이내 학사 이상의 학위 취득 예정 또는 경력 2년 미만의 기졸업자		IT/인터넷
775	IBK기업은행	금융권			서울 중구			0		무관	무관			IT/인터넷
751	교보문고	대기업			서울 마포구	학사		0		무관	무관	대졸학력 소지자  대내외 원활한 커뮤니케이션 능력 보유자  능동적이며, 적극적인 사고방식 소유자  웹/모바일 서비스에 대한 지식 보유  PostgreSQL 등 RDBMS 관련 지식 보유  JAVA 개발 능력, Spring Framework 및 CI/CD에 대한 지식 보유자  HTML, CSS, Javascript, JQuery 관련 지식 보유자 ● 전형절차 및 일정  서류전형→면접전형→건강검진→최종합격		IT/인터넷
752	진학사	중소기업			서울 종로구			0		무관	무관			IT/인터넷
753	토스인슈어런스	중소기업			서울 강남구			0		무관	무관	React, TypeScript 기반으로 안정적인 서비스를 개발할 수 있는 분을 찾고 있어요.  주어진 디자인 시안을 바탕으로 스스로 문제를 정의하고 빠르게 구현해낼 수 있는 분이면 좋아요.  단순히 주어진 개발을 해내는 것보다, 주도적으로 문제를 발견하고 분석해 솔루션을 제안할 수 있는 분이 필요해요.  레거시 코드를 최신의 개발 환경에 맞게 개선한 경험이나, 잘 모르던 기술 스택을 빠르게 학습해서 개발해나간 경험이 있으신 분이면 좋아요. [이력서 작성 추천]  그동안의 경험을 단순 나열하는 것이 아닌, 경험 속에서의 임팩트 및 러닝 포인트를 기술해주세요.  고객의 보이스를 기반으로 빠르게 제품의 완성도를 높여가기 때문에, 주어진 문제를 스스로 해결해보려고 시도하는지 보고 있어요.  복잡도가 높은 서비스나 까다로운 요구사항을 구현한 경험이 있으면 기술해주세요. 특히 복잡하거나 반복되는 문제를 단순한 형태로 추상화한 경험을 설명해주시면 좋아요.  기존 소스 코드를 새로운 코드 베이스로 점진적으로 이관한 경험이 있으면 기술해주세요.		IT/인터넷
754	토즈코리아	외국계기업		E-Commerce Intern	서울 강남구			0		무관	무관			IT/인터넷
755	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관	오디오 신호 처리 및 전처리 알고리즘 설계 경험 (AGC, AEC, NR 등) 음성 인식 및 신호 분리 관련 경험 또는 이해 MATLAB, Python, C/C++ 등 신호 처리 및 알고리즘 구현 언어 숙련도 DSP 관련 개발 경험 및 디버깅 능력 양산 프로젝트에서 일정 관리 및 요구사항 분석 경험 팀 내 협업 및 외부 파트너와의 커뮤니케이션 능력 차량용 오디오 시스템 개발 경험 (또는 유사 도메인 경험) 다중 마이크 환경에서의 음향 기술 연구 또는 적용 경험		IT/인터넷
756	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			IT/인터넷
757	LG CNS	대기업			서울 강서구			0		무관	무관			IT/인터넷
758	노르마	중소기업		QPU 설계	서울 성동구			0		무관	무관	3학년 이상 재학 중인 학생/대학원생  연관 분야 전공		IT/인터넷
759	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			IT/인터넷
760	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			IT/인터넷
761	슈프리마	중소기업			경기 성남시 분당구	학사	전자 계열	0		무관	무관	컴퓨터 공학, 전자공학 또는 관련 분야의 학사 이상 학위를 보유하고 계시며, C/C++ 언어에 대한 깊은 이해와 실무 경험을 갖추신 분  라이브러리 개발 및 API 설계 능력: 동적 라이브러리(dll, so) 개발 경험과 함께, 표준 인터페이스 설계 및 API 문서화를 통해 모듈화된 소프트웨어 구현 경험이 있으신 분  학력 : 학사 이상		IT/인터넷
762	지멘스	외국계기업			서울 종로구			0		무관	무관			IT/인터넷
763	효림그룹	중견기업		XE_품질보증팀	서울 강남구, 대구 달서구, 경북 경산시, 경남 창원시 성산구, 경북 경산시			0		무관	무관			IT/인터넷
764	바비톡	중소기업	IT/인터넷	콘텐츠 마케터 체험형 인턴				0		무관	무관	영상 편집 프로그램 사용 능숙자면 좋아요. Adobe 계열 Premiere Pro, After Effects 등 / 전문 영상 편집 프로그램이 아닌 캡컷 등 영상 제작 어플리케이션 서비스 활용한 영상 제작 스킬도 가능해요. 이미지 제작 능숙자여야해요. 포토샵 및 그 외 프로그램 활용해요. 오프라인 촬영이 가능해야해요. 촬영용품 대여, 촬영 진행 서포트 등 필요해요.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
765	(사)이에스지노동사회협회	비영리단체/협회/재단	IT/인터넷					0		무관	무관			IT/인터넷
766	스카이랩스	스타트업		HW 개발	경기 성남시 분당구		전기 계열	0		무관	무관	대학 재학 또는 졸업자, 공학계열(전기/전자/컴퓨터/소프트웨어) 신입 가능	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
767	카카오페이	대기업	경영/사무, IT/인터넷	카카오페이 보험 운영				0		무관	무관	엑셀을 능숙하게 사용하시는 분을 원해요. SQL을 활용한 데이터 추출 및 가공을 할 수 있는 분을 원해요. 성실하고 꼼꼼한 분을 원해요.	[전형 안내]\n서류 접수 > 면접전형 > 최종 합격	IT/인터넷
768	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
769	JYP엔터테인먼트	중소기업		CTO Staff	서울 강동구		컴퓨터 계열	0		무관	무관	컴퓨터 공학 계열 또는 관련 분야 전공자, 혹은 이에 준하는 경력 보유  최신 기술을 활용해 비즈니스 문제를 해결한 경험  전략적 사고력과 논리적인 문제 해결 능력, 데이터 기반 의사결정 역량 보유  팀 중심 환경에서 효과적으로 협업할 수 있는 커뮤니케이션 능력	[전형 안내]\n서류 접수 > 면접전형 > 최종 합격	IT/인터넷
770	비바리퍼블리카	스타트업	IT/인터넷	Data Assistant (SQL, Tableau)				0		무관	무관	실무 sql을 활용해보신분이 필요해요. 복잡한 추출 요청도 고급 sql 능력을 통해 빠르게 추출해 내실 수 있는 분이 필요해요. 꼼꼼하게 데이터 정합성을 확인 하실 수 있는 분이 필요해요. Tableau를 능숙하게 활용하실 수 있는 분이 필요해요 다른 직군의 팀원들과 원활하게 소통할 수 있는 능력이 필요해요.	[전형 안내]\n서류 접수 > 사전 과제 > 직무 인터뷰 > 최종 합격	IT/인터넷
771	한국도로교통공단	공공기관/공기업		정보보호	서울 서초구, 강원특별자치도 강릉시, 제주특별자치도 제주시, 울산 남구, 전북특별자치도 전주시 완산구			0		무관	무관		[전형 안내]\n서류전형 > 필기전형 > 면접전형 > 최종합격	IT/인터넷
772	펄어비스	중견기업		게임플레이	경기 과천시			0		무관	무관	졸업자, 졸업예정자		IT/인터넷
776	쿠팡	중소기업			서울 송파구			0		무관	무관	커뮤니케이션 능력		IT/인터넷
777	토스페이먼츠	스타트업		Product Designer [Tools]	서울 강남구			0		무관	무관	사용자가 원하는 제품이 될 때까지 VOC 수집, UX 설계, UI 디자인, Prototype을 통해 개선할 수 있는 역량이 필요해요. 내가 원하는 것이 아닌 사용자의 정성 혹은 정량적인 근거로 문제를 정의한 경험이 필요해요. 우선순위를 고려하여 목표를 설계하고 그 달성 여부를 정성 혹은 정량적으로 끝까지 분석하고 고민한 경험이 필요해요. Web UI에 대한 이해도가 있는 분이 필요해요. 사용자의 비효율적인 업무 원인을 주도적으로 파악하고 효율적으로 개선하여, 업무 리소스를 단축시킨 경험이 있으면 좋아요. 궁극의 고객 경험을 달성하기 위해 논리적인 커뮤니케이션으로 구성원을 설득하고 협업한 경험이 있으면 좋아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
778	한국세라믹기술원	비영리단체/협회/재단		반도체 소재센터	경영/사무, 연구개발/설계, IT/인터넷			0		무관	무관	∘ 연령이 만 34세 이하인 자 ∘ 기술원 「인사 규정」 제7조(결격사유)에 해당하지 않는 자		IT/인터넷
779	토스뱅크	중소기업			서울 강남구			0		무관	무관	Hadoop Ecosystem 환경 기반의 Python, Pyspark 프로그래밍에 능숙하신 분이 필요해요.  Spark 같은 분산처리 엔지니어링을 활용해 대용량 데이터 처리를 해보신 분이 필요해요.  Data Mesh/Medallion Architecture를 이해하고 데이터 모델링을 해오신 분이 필요해요.  분산 처리 기반 query engine의 동작 원리를 이해하고 튜닝이 가능하신 분이 필요해요.  ETL 프로세스와 airflow orchestration 최적화를 통해 배치작업의 효율화를 경험해보신 분이 필요해요.  단순요청을 처리하는 것이 아닌 명확한 데이터 구조와 효율적인 데이터 활용 관점에서 기준을 제시할 수 있어야 해요.  다양한 이해관계자와 소통하여 데이터 요구사항을 구체화하고 정리하는 역량이 있어야 해요. [합류 여정]  서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사		IT/인터넷
780	LG전자	대기업		HS사업본부	서울 영등포구, 경남 창원시 성산구, 경기 평택시			0		무관	무관			IT/인터넷
781	에고이즘	중소기업		AI Creative Specialist	서울 성동구			0		무관	무관	생성형 AI 도구(Midjourney, DALL E, Runway, GPT 등) 사용 경험 각, 분석, 자동화 등 한 가지 이상 업무에서 AI를 활용한 시도 경험 툴을 빠르게 익히고, 업무에 바로 적용할 수 있는 실행력 높으신 분 집협업 디자이너와 유연한 커뮤니케이션 능력 어떤 역할이든 ‘브랜드를 돋보이게 하는 것’에 관심이 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
782	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			IT/인터넷
783	주식회사 인터엑스	스타트업			울산 중구			0		무관	무관			IT/인터넷
784	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
785	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			IT/인터넷
786	SK ON	대기업			대전 유성구			0		무관	무관			IT/인터넷
787	한국하니웰	중견기업			서울 마포구			0		무관	무관			IT/인터넷
788	스타쉽엔터테인먼트	대기업			서울 강남구			0		무관	무관			IT/인터넷
789	앳홈	중소기업	경영/사무, 마케팅/광고/홍보, IT/인터넷	인플루언서 커머스 AMD				0		무관	무관	유튜브, 인스타그램 등 콘텐츠 플랫폼을 자주 보고, 트렌드에 관심 많은 분 인플루언서, 뷰티, 라이브 커머스에 흥미 있는 분 오퍼레이션 업무를 체계적이고 꼼꼼하게 챙길 수 있는 분 엑셀, 구글스프레드시트 등 기본 툴을 다룰 수 있는 분 일을 맡았을 때 끝까지 책임감 있게 마무리할 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
790	현대오토에버	대기업		-디지털 경험-	서울 강남구, 울산 북구, 경기 화성시, 충남 아산시, 경기 의왕시	학사		0		필수	무관	최종학력 4년제 대졸 이상 남성의 경우 군필 또는 면제자 해외여행 결격사유가 없는 자 당사 채용결격사유에 해당되지 않는 자	[전형 안내]\nACT - 과제테스트/코딩테스트 - 1차 면접전형 - 2차 면접전형 - 채용검진 - 최종합격	IT/인터넷
791	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			IT/인터넷
792	문피아	대기업			서울 강남구			0		무관	무관	웹소설 작품의 셀링 포인트를 찾을 수 있는 분  웹소설과 콘텐츠 전반에 대한 이해도가 높은 분  작가 관리에 필요한 커뮤니케이션 스킬을 갖춘 분		IT/인터넷
793	퍼즐원스튜디오	중소기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
794	NIT서비스	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
795	카카오모빌리티	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
796	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
797	쓰리빌리언	중소기업		AI Engineer	서울 강남구	학사		0		무관	무관	Bioinformatics, Cheminformatics, AI engineering, Computer Science 등 관련 학과  학사 학위 이상인 분  인공지능 프레임워크 (TF, torch 등) 를 이해하고 직접 구성한 네트워크를 학습시킨 경험 보유자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
798	유진테크	중견기업		SW개발 신입사원	경기 이천시, 경기 용인시 처인구	학사	전자 계열	0		무관	무관	1) 학사 이상 2) 전공  : 전자/컴퓨터 공학계열 3) C언어 필수, 중급이상 4) C++ or C# 개발 경험자(OOP 개념 이해) 반도체 장비 제어 SW 개발 경험자	[전형 안내]\n서류전형 - 인성검사 - 면접전형 - 최종합격	IT/인터넷
799	(주)네오위즈	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
800	AB180	중소기업		Platform Manager	서울 서초구			0	영어 성적 요구	무관	무관	고객의 요청을 빠르게 파악하고, 명확하고 일관된 커뮤니케이션으로 문제를 설명하고 해결할 수 있으신 분 솔루션 기능과 고객 사용 흐름을 이해하고, 문제의 원인을 논리적으로 분석해 해결책을 도출할 수 있으신 분 반복되는 이슈를 구조화하고, 문서화하거나 개선 제안한 경험이 있으신 분 영어 기술 문서를 읽고 이해하는 데에 어려움이 없으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종 합격	IT/인터넷
801	와디즈	스타트업		비즈니스	경기 성남시 분당구			0	영어 성적 요구	무관	무관	비즈니스 영어 가능자		IT/인터넷
802	태양연마	중견기업			무역/유통, 영업/고객상담, 경영/사무, 생산/제조, 연구개발/설계, IT/인터넷			0		무관	무관			IT/인터넷
803	아마존웹서비시즈코리아	외국계기업		Associate Solutions Architect Internship	서울 강남구	학사	공학 계열	0		무관	무관	IT, 공학, 수학과 관련 4년제 대학 25/26년 졸업 예정이신 분 클라우드 기반 솔루션의 고객 서비스에 관심이 있고 적성에 맞는 분		IT/인터넷
804	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
805	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
806	네오플	대기업			서울 강남구			0		무관	무관	게임 UI/UX 와 개발 프로세스 대한 기본적인 이해와 지식을 갖추신 분  기본적인 디자인툴(photoshop,Illustrator 등)사용에 어려움이 없으신 분  다양한 스타일의 UI 디자인 컨셉을 제시하실 수 있는분  타이포 그래피 및 폰트 디자인에 관심이 많으신 분  주어진 컨셉을 문양,패턴,아이콘 등의 시각요소로 표현 하실수 있는 분 [채용 여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
807	네오플	대기업			서울 강남구			0		무관	무관	2D 이펙트 경험이 풍부하고 드로잉 감각이 뛰어나며, 다양한 툴을 능숙하게 다루실 수 있는 분  게임의 스킬, 모션, 이펙트에 대한 센스가 풍부하신 분  타 부서와 협업 및 커뮤니케이션이 원활하신 분 [채용여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
808	캐롯손해보험	대기업			서울 중구			0		무관	무관			IT/인터넷
809	캐롯손해보험	대기업			서울 중구			0		무관	무관			IT/인터넷
810	토스뱅크	스타트업		Security Researcher	서울 강남구			0		무관	무관	기본적인 IT 및 보안 인프라 환경에 대한 이해가 있는 분이 필요해요. 자체 취약점 진단 도구의 개발 및 유지를 위해 개발 역량이 필요해요. 취약점 진단 스크립트를 이해하고 진단 및 결과를 해석하는 역량이 필요해요. Django, Flask, Python, Powershell, Shell 등 개발 경험이 필요해요. MSA 아키텍처를 이해하고 RestAPI 취약점 진단을 할 수 있는 역량이 필요해요. 다양한 팀과 원활한 협업을 위해 탁월한 커뮤니케이션 능력 보유하신 분이 필요해요. MITRE ATT&CK Framework를 이해하고 AD/xNix 환경에서 침투테스트를 수행할 수 있는 역량이 있는 분이면 더 좋아요. Native Cloud(Kubernetes, AWS 등)환경에 대한 이해가 있는 분이면 더 좋아요. 보안관련 자격증(CISSP, 보안기사, OSCP, CREST 등)을 보유하고 계시면 더 좋아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
811	토스뱅크	스타트업		Site Reliability Engineer	서울 강남구			0		무관	무관	Java/Kotlin, Spring Framework 관련 개발 경험과 문제해결 능력이 있는 분이면 좋아요. 성능 테스트를 통해 시스템의 가용성을 확인하고, 병목지점을 해결할 수 있는 분이면 좋아요. 리눅스 및 네트워크 시스템에 대한 깊은 이해가 있는 분을 찾아요. MSA, Kubernetes, Istio, Redis, Kafka, ELK 기반의 인프라 운영 경험이 있는 분이면 좋아요. Mission Critical 한 서비스 운영 환경을 즐기며 높은 책임감으로 탄탄한 서비스를 같이 만들어 갈 수 있는 분을 찾아요. 변화를 두려워하지 않고 새로운 기술에 빠르게 적응하며 지속적인 성장을 원하는 분을 찾아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
812	토스페이먼츠	중소기업			서울 강남구			0		무관	무관			IT/인터넷
813	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
814	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
815	퍼솔켈리코리아	중소기업		영업	서울 중구	학사		0	영어 성적 요구	무관	무관	국내 4년제 대학 재학생(3 4학년) 또는 졸업 1년 이내  일본어 또는 영어 중급 이상 가능자		IT/인터넷
816	(주)네오위즈	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
817	하이퍼리즘	중소기업		블록체인 인프라 엔지니어	서울 관악구			0		무관	무관	프로덕션 레벨의 백엔드 프로그래밍이 가능하신 분 하나 이상의 프로그래밍 언어에 정통하신 분 AWS, 네트워크, 리눅스, 키 관리, 데브옵스 등 안전한 인프라 관리를 위한 다양한 지식과 폭넓은 경험이 있으신 분 숙련된 인터페이스 설계, 꼼꼼한 구현, 체계적인 테스트를 통해 고가치 자산을 담아낼 시스템을 프로덕션 레벨까지 구현할 수 있는 분 병렬적이고 기민한 공개 커뮤니케이션 능력을 갖추신 분 (DM 금지, 직원당 월 평균 Slack 메시지 약 2,000개) 영혼 없는 수동적 일처리를 극도로 경계하며, 비판적인 시각으로 본질적인 문제를 개선하시는 분 보안에 민감하고, 특히 Web3 생태계의 trustless한 키 관리에 대한 감각이 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 과제전형 - 최종합격	IT/인터넷
818	메타보라	대기업			경기 성남시 수정구			0		무관	무관	책임감이 강하고 성실하신 분  원활한 커뮤니케이션 및 협업 능력을 갖추고 계신 분  주어진 일을 끝까지 책임지고 완수해본 경험이 있으신 분 [진행 안내] 서류전형   면접전형   최종합격		IT/인터넷
819	코그	중견기업		채용 전환형 상시 인턴 (UI)	대구 중구			0		무관	무관			IT/인터넷
820	사단법인 디엠시코넷	비영리단체/협회/재단			서울 마포구			0		무관	무관			IT/인터넷
821	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
822	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
823	채널코퍼레이션	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
824	백패커	중소기업			서울 서초구			0		무관	무관	텀블벅에 대한 이해와 창작 생태계에 대한 깊은 관심을 보유하신 분  새로운 시도를 두려워하지 않고, 기회를 잡기 위한 행동력을 보유하신 분  창작자와의 소통/컨설팅을 위한 원활한 커뮤니케이션 역량을 보유하신 분  여러 온라인/웹 콘텐츠에 관심을 갖고 소비하시는 분		IT/인터넷
869	게임듀오	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
825	비트망고	중견기업		Back-end Programmer	경기 성남시 분당구			0		무관	무관	RDB, NoSQL, SQL에 대한 깊은 이해 네트워크, 시스템 및 인프라에 대한 높은 이해도 Bash Script 기본 이해 기술 스택 및 언어 패러다임에 맞는 개념 도입 및 설계 능력 가독성 높은 구조적 코드 작성 및 에러 핸들링 능력 개발 및 비개발 직군과의 원활한 커뮤니케이션 능력	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
826	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 인턴 - 전환면접 - 최종합격	IT/인터넷
827	슈어소프트테크	중소기업			대전 유성구		전자 계열	0		무관	무관	C, C++언어 가능자(코드 해석 가능자)  전자, 컴퓨터공학 관련 교육 이수자	[전형 안내]\n서류전형 - 면접전형 - 인턴 - 전환면접 - 최종합격	IT/인터넷
828	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			IT/인터넷
829	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
830	쿠팡	대기업	IT/인터넷					0		무관	무관			IT/인터넷
831	신한DS	중견기업			서울 중구			0		무관	무관		[전형절차]\n- 서류전형 > 실무진면접 > 역량검사 > 경영진 면접 > 처우협의 및 채용검진 > 입사	IT/인터넷
832	베이글코드	중소기업			서울 강남구			0		무관	무관			IT/인터넷
833	한국아이비엠	외국계기업		제품 보안 진단 및 OT 보안 수준 진단 및 프로세스 수립 지원	서울 영등포구			0	영어 성적 요구	무관	무관	Bachelor's Degree  최신 기술에 대한 관심과 열정을 바탕으로 문제 해결 능력을 보유하신 분  사이버보안, 정보보안, 정보보호 유관 전공자 또는 정보보호 관련 과목 이수 또는 자격증을 보유하신 분  공인 영어 시험 성적 보유자 (점수 제한 없음)	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
834	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
835	넷마블	대기업			서울 구로구			0		무관	무관			IT/인터넷
836	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
837	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
838	LSP USA, LLC	기타						0		무관	무관			IT/인터넷
839	LSP USA, LLC	기타	생산/제조, IT/인터넷					0		무관	무관			IT/인터넷
840	주식회사 노타	중소기업			서울 강남구			0		무관	무관			IT/인터넷
841	카카오페이	금융권	IT/인터넷					0		무관	무관			IT/인터넷
842	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
843	RXC	스타트업			서울 강남구			0		무관	무관			IT/인터넷
844	야놀자	중소기업			서울 강남구			0		무관	무관			IT/인터넷
845	KSM	중견기업			서울 영등포구			0		무관	무관			IT/인터넷
846	(주)엠디에스인텔리전스	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
847	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
848	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
849	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
850	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
851	LG전자	대기업		HS사업본부	서울 영등포구			0		무관	무관			IT/인터넷
852	라이드플럭스	중소기업			서울 영등포구			0		무관	무관			IT/인터넷
853	이빗	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
854	커넥트웨이브	중견기업			서울 금천구			0		무관	무관	경력: 신입  Linux OS 운영에 관심이 많으신 분  커넥트웨이브 서버 대부분이  Linux 기반 OS를 이용하여 구축되어 있습니다.  원활한 커뮤니케이션 스킬을 보유하신 분  타 팀과의 소통을 바탕으로 업무를 진행하는 케이스가 많은 편입니다.  자기 개발에 열심이신 분  신기술 도입을 적극적으로 검토하며 테스트합니다. [채용 절차]  서류전형   인적성 검사 & 1차 면접   2차 면접   처우협의   채용검진   최종합격		IT/인터넷
855	카카오페이	대기업	IT/인터넷					0		무관	무관			IT/인터넷
856	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
857	하이컨시	중견기업		• 사이트 운영 관련 업무	서울 강남구	학사		0		무관	무관	학력 : 대졸 이상		IT/인터넷
858	콘티넨탈오토모티브코리아	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
859	콘티넨탈오토모티브코리아	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
860	보그워너	외국계기업			경기 화성시			0		무관	무관			IT/인터넷
861	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
862	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
863	에듀클라우드	중소기업			서울 금천구			0		무관	무관			IT/인터넷
864	아티스트앤스튜디오	중소기업			서울 마포구			0		무관	무관			IT/인터넷
865	주식회사 사각	스타트업			서울 마포구			0		무관	무관			IT/인터넷
866	메리츠증권	대기업			서울 영등포구			0		무관	무관			IT/인터넷
867	카카오페이	대기업	IT/인터넷	카카오페이 MyData 서비스의 안정성, 신뢰성, 가용성을 지속적으로 개선시켜나가요.				0		무관	무관	Java/Kotlin, Spring Framework 관련 개발 경험 혹은 지식과 문제해결 능력이 있는 분을 찾고 있어요. React, Typescript 관련 개발 경험 혹은 지식을 가지고 활용 가능한 분을 찾고 있어요. Observability (메트릭/로그/트레이싱)에 대한 지식과 경험이 있는 분을 찾고 있어요. 주도적으로 문제를 정의하고 대안을 제시할 수 있는 분을 찾고 있어요. 개발 관련 학과 또는 동일한 자격이 있는 분을 찾고 있어요.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
868	게임듀오	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
870	Spigen Inc	중견기업			미디어, 디자인, 교육, 무역/유통, IT/인터넷, 서비스, 연구개발/설계, 마케팅/광고/홍보, 경영/사무, 영업/고객상담			0		무관	무관			IT/인터넷
871	커넥트웨이브	중견기업		클라우드 시스템 운영	서울 금천구			3		무관	무관	신입 ~ 경력 3년 이내이신 분 Linux/Unix 서버에 대한 기본적인 이해가 있으신 분 SQL 쿼리 작성 및 데이터베이스 기초 지식을 보유하신 분 JAVA, PHP, Python,Bash 등 한 가지 이상의 개발 언어 사용이 가능하신 분 웹서비스에 대한 이해가 있으신 분 새로운 기술 학습에 대한 열정과, 의지가 있으신 분 문제 해결 및 팀 협업 능력을 보유하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
872	Riiid	중소기업		투자 학습 콘텐츠 에디터	서울 강남구			0		무관	무관	글쓰기에 관심이 많고, 복잡한 정보를 간결하게 문장으로 작성할 수 있는 능력이 있으신 분 다양한 자료 조사를 하고, 엑셀 등 도구를 활용해 데이터를 정리한 경험이 있으신 분 꼼꼼한 콘텐츠 검수 과정을 통해 콘텐츠의 완성도를 높일 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
873	슈어소프트테크	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
874	게임듀오	중소기업		영상 크리에이터	경기 성남시 수정구			0		무관	무관	영상 제작 툴(After Effect, Premier 등)의 활용 능력이 높으신 분 게임 영상 제작 관련 경험이 있으신 분 한정된 리소스 내에서 창의적인 영상 기획 경험이 있으신 분 본인의 개성과 장점을 살린 포트폴리오 보유하신 분	[전형 안내]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
875	(주)커넥트웨이브	중견기업			서울 금천구			0		무관	무관			IT/인터넷
876	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
877	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
878	한국타이어앤테크놀로지	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
879	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
880	한글과컴퓨터	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
881	팅크웨어	대기업		아이나비 HW QA(품질 신뢰성 시험)	경기 성남시 분당구	학사	전기 계열	0		무관	필수	4년제 대졸 이상인 분  신입 또는 5년 이내의 유관 경력을 보유한 분 1) 신입: 전자/전기/산업 공학을 전공한 분 2) 경력: 단말/부품 신뢰성 시험 및 HW 설계 품질 보증 업무 경력을 보유한 분  운전이 가능한 분  해외 출장에 결격 사유가 없는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격 및 입사	IT/인터넷
882	주식회사 링키지랩	대기업			서울 성동구, 경기 성남시 분당구			0		무관	무관			IT/인터넷
883	티맥스소프트	중견기업		연구본부 IF-QA팀 '팀원	경기 성남시 분당구	학사		0		무관	무관	4년제 대졸(학사) 이상 C/JAVA 기반 언어 가능자 원활한 커뮤니케이션 및 적극적 업무추진 역량 보유자	[전형 안내]\n서류전형 - 개발직군 코딩TEST - 면접(1차/2차/3차) - 인성/직무적성 검사 - 합격자 발표	IT/인터넷
884	티맥스소프트	중견기업		WAS 개발 (JEUS, WebtoB 관리 제품 Front 개발)	경기 성남시 분당구	학사		0		무관	무관	4년제 대졸(학사) 이상 HTML/CSS, JavaScript, React 라이브러리 사용 경험 REST API 연동 및 백엔드 통신 사용 경험 Git, Jenkins 등 협업 및 개발 환경 사용 경험	[전형 안내]\n서류전형 - 개발직군 코딩TEST - 면접(1차/2차/3차) - 인성/직무적성 검사 - 합격자 발표	IT/인터넷
885	포항공과대학교	기타		일반행정	경북 포항시 남구			0		무관	무관			IT/인터넷
886	피에프씨테크놀로지스	중소기업			서울 서초구			0		무관	무관			IT/인터넷
887	피에프씨테크놀로지스	스타트업			서울 강남구			0		무관	무관			IT/인터넷
888	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
889	RHEE BROS INC.	중견기업	해외					0		무관	무관			IT/인터넷
890	PTKOREA	외국계기업		대기업 글로벌 APP CMS QA 자동화 Tool 개발	서울 강남구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
891	현대자동차	대기업		AI/Data	서울 서초구			0		무관	무관	Ph.D. candidates/graduates in STEM from global universities (including post docs) Applicants must be able to join the company by August 2026	[전형 안내]\n서류전형 - 면접전형 - 현대 기술 세미나 - 최종합격	IT/인터넷
892	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
893	젠지이스포츠글로벌아카데미	중소기업			서울 강남구			0		무관	무관	유저 중심 사고를 기반으로 서비스 개선 아이디어를 도출할 수 있는 분  논리적 사고 및 문제 해결 능력이 뛰어나신 분  디자이너 및 개발자와 원활한 커뮤니케이션이 가능하신 분 채용절차  1차 면접(실무진 면접)  > 2차 면접(HR 면접)  > 제출 서류 검토 및 결격 사유 확인  > 처우 협의  > 최종합격  필요 시, 3차 전형을 진행할 수 있습니다.		IT/인터넷
894	STRADVISION	스타트업			서울 서초구			0		무관	무관			IT/인터넷
895	써모피셔사이언티픽코리아	외국계기업		Field Service Engineer II	대전 대덕구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
896	레진엔터테인먼트	중견기업			서울 성동구			0		무관	무관			IT/인터넷
897	라인플러스	대기업			경기 성남시 분당구			0	영어 성적 요구	무관	무관	이런 경험과 스킬을 가진 분을 찾습니다:  Computer Science 혹은 관련 분야 전공자 또는 이에 준하는 실무 경험이 있으신 분  Linux 또는 Unix 환경에서의 개발 및 시스템 운영에 익숙하신 분  Concurrency가 높은 시스템 및 분산 아키텍처에서 문제를 해결할 수 있으신 분  Apache HBase, Redis 등 분산 스토리지 미들웨어에 대해 관심이 높으신 분  영어 읽기와 쓰기로 의사소통이 가능하신 분 전형안내  서류 전형 > 온라인 코딩 테스트 >  1차 면접 (CS Interview) > 2차 면접 (Whiteboard Interview) > 최종 면접 > 레퍼런스 체크 및 처우 협의 > 최종 합격 > 입사		IT/인터넷
898	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
899	에고이즘	중소기업			서울 성동구			0		무관	무관			IT/인터넷
900	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
902	네오위즈	중견기업			경기 성남시 분당구			1		무관	무관	리깅 경력 1년 이상 또는 이에 준하는 실력이나 경험을 갖춘 분  Maya 캐릭터 및 크리쳐 리깅 경험이 있으신 분  Maya 리깅 설계 및 리깅 관련 기능에 대한 높은 이해도가 있으신 분		IT/인터넷
903	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
904	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
905	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			IT/인터넷
906	에스에이피코리아	외국계기업	IT/인터넷, 영업/고객상담, 전문/특수직					0		무관	무관			IT/인터넷
907	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
908	네오플	대기업			서울 강남구			0		무관	무관	새로운 업무 방식과 체계에 적응할 의지가 있으신 분  던전 앤 파이터의 IP/메타에 대한 이해 및 열정이 있으신 분  던전 앤 파이터의 전투 액션 구조에 대해 이해하고 계신 분 [채용여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
909	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
910	뱅크샐러드	중소기업		QA Engineer	서울 마포구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 합격자 발표	IT/인터넷
911	네오플	대기업			제주특별자치도 제주시			0		무관	무관	끝을 경험한 유저를 찾습니다.  본인만의 게임 철학을 가진 동료를 찾습니다  (경력) 노련한 전략가를 찾습니다.  프로젝트 오버킬은 좋은 밸런스라는 평가보다 좋은 게임이라는 평가를 반길 수 있는 여러분을 찾고 있습니다. [채용 절차]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
912	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
913	DK테크인	대기업			경기 성남시 분당구			2		무관	무관	클라우드 인프라 구축 및 운영 경력 2년 이상 필수 네트워크 관련 5년 미만의 경력 멀티 VPC 및 DX 구성, TGW 연동 경험이 있으신 분 클라우드 방화벽 및 WAF 등 보안장비 구축 경험이 있으신 분 하이브리드 클라우드(with On premise) 구축 경험이 있으신 분 하이브리드/멀티 클라우드 네트워크 설계에 관심이 있으신 분 AWS/GCP/Azure/NHN 사용 경험이나 클라우드 서비스에 대한 관심이 있으신 분 다양한 분야의 업무를 적극적으로 즐겁게 하실 수 있는분 혼자 일하는 것보다 협업을 더 좋아하시는 분		IT/인터넷
914	DK테크인	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
915	펄어비스	중소기업			경기 과천시			0		무관	무관			IT/인터넷
916	메가존클라우드	중견기업			경기 과천시			0		무관	무관			IT/인터넷
917	넷마블엔투	대기업			서울 구로구			0		무관	무관		[전형절차]\n- 서류심사 > 1차 실무면접 > 2차 임원면접 > 합격자발표	IT/인터넷
918	주식회사 딥블루닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
919	주식회사 딥블루닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
920	번개장터 주식회사	스타트업			서울 서초구			0		무관	무관			IT/인터넷
921	티맥스소프트	중견기업			경기 성남시 분당구	학사		0		무관	무관	4년제 대졸 이상		IT/인터넷
922	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
923	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
924	카카오	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
925	키노라이츠	스타트업			서울 강남구			0		무관	무관			IT/인터넷
926	마상소프트	중소기업			부산 해운대구			0		무관	무관	이펙트 관련 툴을 능숙하게 사용하시는 분  컨셉의 의도와 방향성에 맞는 이펙트 연출, 색감, 타이밍 감각이 뛰어나신 분  팀워크를 중시하며 원활한 커뮤니케이션을 하시는 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
927	마상소프트	중소기업			부산 해운대구			0		무관	무관	포즈와 타이밍을 잘 표현 하시는 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
928	마상소프트	중소기업			부산 해운대구			0		무관	무관	게임 개발에 열정을 가지신 분  실사, 반실사, 캐주얼풍의 배경 에셋 제작이 가능 하신 분  3DMax를 이용한 low, middle 폴리곤 모델링에 능숙하신 분  새로운 시도에 대한 거부감이 없고 팀플레이에 익숙하신 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
929	마상소프트	중소기업			부산 해운대구			0		무관	무관			IT/인터넷
930	마상소프트	중소기업			부산 해운대구			0		무관	무관	콘텐츠, 시스템, 이벤트를 비롯하여 유저에게 즐거운 경험을 제공할 수 있는 능력을 가진 분을 찾아요!  원활한 커뮤니케이션이 가능하신 분  논리적인 사고를 갖추신 분  다양한 게임의 플레이 경험과 지식이 있으신 분  기획 의도를 문서화하여 전달 가능하신 분  즐겁게 할 수 있는 게임을 만들고자 하는 열정이 있는 분  해외 여행에 결격사유가 없으신 분 ❖ 주요 업무  현재 서비스 되고 있는 게임의 재미와 확장성, 안정성 등을 고려한 기획을 고민하고 개발해요!  서비스 중인 게임의 콘텐츠, 시스템, 밸런스, 편의성을 기획하고 강화해요!  신규 프로젝트의 아이디어를 제안하고 기획합니다. ❖ 채용 절차  서류 전형 > 실무 면접 > 인성 면접 > 임원 면접 > 최종 합격		IT/인터넷
931	커넥트웨이브	중견기업			서울 구로구			0		무관	무관			IT/인터넷
932	Ecoplastic America	중견기업	해외					0		무관	무관			IT/인터넷
933	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
934	아인의료재단	기타			인천 미추홀구			0		무관	무관			IT/인터넷
935	프롭티어	대기업			서울 서초구			0		무관	무관			IT/인터넷
936	네오플	대기업		던전 콘텐츠 기획자	서울 강남구			0		무관	무관			IT/인터넷
937	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
938	뱅크샐러드	중소기업			서울 마포구			0		무관	무관	유저 관점에서 사고하여 경쟁력 있는 가치 제안을 개발하고, 유저의 후생 증대와 편익 극대화 기준을 정량화(북극성 지표)하고 이를 기준으로 제품을 고도화하는 경험이 있는 분들을 원해요.  MAKER들과 애자일 조직에서 가설 수립 및 가설 검증 이터레이션 통해 PMF를 끈질기게 찾아 본 분을 원해요.  모바일 비즈니스나 트래픽 비즈니스의 핵심 지표 정의, 성장 로드맵을 구축하고 실행해본 경험이 있는 분을 원해요.  도메인 경험은 없어도 되나, 도메인 학습에 있어 두려움이 없이 호기심을 가지고 있는 분을 원해요.  의사결정을 직접 내리고, 성과를 온전히 책임져 본 분들. 여정 상 번거로운 일이나 어려운 일들을 마다하지 않고 손수 실질적 성과까지 이끌어내는 분들은 뱅샐에서 크게 인정받아요.  한계 없이 문제를 풀 수 있다는 도전 정신이 투철하고 신뢰는 내가 얻어 내는 것이고 , 뛰어나지만 항상 발전을 추구하는 독립심 있는 사람과 일하고 싶어요.		IT/인터넷
939	뱅크샐러드	중소기업			서울 마포구			0		무관	무관	유저 관점에서 사고하여 경쟁력 있는 가치 제안을 개발하고, 유저의 후생 증대와 편익 극대화 기준을 정량화(북극성 지표)하고 이를 기준으로 제품을 고도화하는 경험이 있는 분들을 원해요.  MAKER들과 애자일 조직에서 가설 수립 및 가설 검증 이터레이션 통해 PMF를 끈질기게 찾아 본 분을 원해요.  모바일 비즈니스나 트래픽 비즈니스의 핵심 지표 정의, 성장 로드맵을 구축하고 실행해본 경험이 있는 분을 원해요.  도메인 경험은 없어도 되나, 도메인 학습에 있어 두려움이 없이 호기심을 가지고 있는 분을 원해요.  의사결정을 직접 내리고, 성과를 온전히 책임져 본 분들. 여정 상 번거로운 일이나 어려운 일들을 마다하지 않고 손수 실질적 성과까지 이끌어내는 분들은 뱅샐에서 크게 인정받아요.  한계 없이 문제를 풀 수 있다는 도전 정신이 투철하고 신뢰는 내가 얻어 내는 것이고 , 뛰어나지만 항상 발전을 추구하는 독립심 있는 사람과 일하고 싶어요.		IT/인터넷
940	크래프톤	중견기업			서울 강남구			0		무관	무관			IT/인터넷
941	Toss	대기업	IT/인터넷					0		무관	무관			IT/인터넷
942	SK C&C	대기업		Tech R&D - Software Engineering	경기 성남시 분당구			0		필수	필수	해외여행에 결격사유가 없는 분 (병역 대상자의 경우 병역필 또는 면제자) 채용 분야의 경력을 3~5년 이상 보유하신 분 최종합격 후 회사가 지정하는 날짜에 입사 가능하신 분	[전형 절차]\n서류전형 > SKCT심층역량검사 > 1차면접 > 2차면접 > 채용검진/처우협의 > 최종합격	IT/인터넷
943	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
944	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
945	폰비	스타트업			서울 서초구			0		무관	무관			IT/인터넷
946	SavvycomKorea	중소기업			서울 종로구			0		무관	무관			IT/인터넷
947	토스뱅크	금융권			서울 강남구			0		무관	무관	정적인 화면을 보면 동적으로 만들고 싶어지는 분을 찾아요. 떠오른 아이디어를 Hi fi 프로토타입으로 만들 수 있는 분이 필요해요. 세상에 없던 사용성과 비주얼을 가진 컴포넌트 만드는 것에 가슴 뛰는 분을 찾아요. 사용자의 문제를 인터랙티브한 솔루션으로 해결하는 것에 가슴 뛰는 분을 찾아요. "처음 가입한 유저에게 인터랙션으로 토스의 편리함과 안전함을 잘 전달할 수 있을까?" "어렵고 복잡한 약관 동의 화면을 인터랙션을 이용해 쉽고 직관적으로 바꿀 수 있을까?" "금융의 해피모먼트 경험을 증폭할 수 있는 인터렉션 만들기"	[전형안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
948	펄어비스	중견기업			경기 과천시			0		무관	무관	인게임 컷신 연출에 대한 이해도가 있으신 분 게임 개발에 대한 이해도가 있으신 분 /포트폴리오 제출 필수/ 포트폴리오는 클라우드(구글, MS 등)에 올린 후 링크 형태로 첨부 부탁드립니다. 이미지 파일의 경우는 원본 사이즈로 준비 부탁드립니다. 부득이한 사유로 인해 압축파일을 첨부하시는 경우, 압축파일 내 이미지 파일은 모두 풀어서 첨부해주시기를 바랍니다.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
949	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
950	펄어비스	중견기업			경기 과천시			3		무관	무관	(경력) 유관 경력 3년 이상이신 분 기본적인 3D 제작툴 사용이 가능하신 분 이펙트용 텍스쳐의 제작/편집이 가능하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
951	펄어비스	중견기업			경기 과천시			0		무관	무관	Houdini 및 Blender geometry node 기반 툴 제작이 가능하신 분 (프로시듀얼 모델링 담당 업무) HLSL 기반으로 셰이더 작성이 가능 하신 분 (셰이더 담당 업무)	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
952	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
953	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
954	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
955	쿠팡	대기업		Compliance Specialist (PII Protection & Management Team)	서울 송파구			0		무관	무관	시스템 권한 관리 업무 경험이 있으신 분 분석 및 문제 해결 능력을 보유하신 분 효과적인 커뮤니케이션과 원할한 협업 능력을 보유하신 분 DB 데이터 추출 및 로그 분석 활용 능력이 강하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
956	여기어때컴퍼니	중소기업			서울 강남구			0		무관	무관			IT/인터넷
957	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
958	페스카로	중소기업	IT/인터넷					0		무관	무관			IT/인터넷
959	페스카로	중소기업			경기 수원시 영통구	학사		4		무관	무관	신입/경력 4년 미만 대재 (4년제)		IT/인터넷
960	페스카로	중소기업			경기 수원시 영통구			0		무관	무관			IT/인터넷
961	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
962	지멘스	외국계기업	IT/인터넷					0		무관	무관			IT/인터넷
963	토스	중소기업		DataOps Manager	서울 강남구			0		무관	무관	데이터 분석 및 관리 경험 SQL 활용 능력		IT/인터넷
964	생활연구소	중소기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
965	포티투닷	스타트업			경기 성남시 수정구			0		무관	무관			IT/인터넷
966	오픈드림컴퍼니	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
967	네오플	대기업			제주특별자치도 제주시			0		무관	필수	'던전앤파이터'가 게임이기 이전에 고객에게 제공하는 서비스임을 인지하고, 고객 신뢰를 바탕으로 한 기본적인 직업 윤리 의식을 지니신 분  신뢰에 기반한 협업으로 팀워크를 발휘할 수 있도록 좋은 커뮤니케이션 스킬과 매너를 갖추신 분  다양한 경우의 수를 따져보고 확인할 수 있는 꼼꼼함을 갖추신 분  문제 발견 및 문제 해결 능력을 갖추신 분  여러 장르의 게임&PC MMORPG에 대한 이해도가 높은 분  MS Office 활용 능력을 갖추신 분  해외 출장 결격 사유가 없는 분 [채용 여정] 서류심사 → 면접 → 처우협의 → 최종합격 및 입사 * 해당 절차는 각 포지션 및 후보자에 따라 변동이 있을 수 있습니다. * 면접 전형 이후 후보자 동의하에 레퍼런스 체크가 진행 될 수 있으며 진행 시 별도로 안내 드릴 예정입니다.		IT/인터넷
968	피에프씨테크놀로지스	스타트업			서울 서초구			0		무관	무관			IT/인터넷
969	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
970	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
971	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
972	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
973	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
974	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
975	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
976	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
977	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
978	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
979	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
980	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
981	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
982	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
983	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
984	Deloitte 안진회계법인	외국계기업			서울 영등포구			0		무관	무관			IT/인터넷
985	Tridge	스타트업			서울 서초구			0		무관	무관			IT/인터넷
986	주식회사 패스트뷰	중소기업			서울 강남구			0		무관	무관			IT/인터넷
987	메가존클라우드	중견기업			서울 강남구			0		무관	무관			IT/인터넷
988	고운세상코스메틱	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
989	고운세상코스메틱	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
990	주식회사 투어라이브	중소기업	IT/인터넷					0		무관	무관		[채용 전형]\n- 서류전형 > 1차 온라인 면접 > 2차 면접 > 최종 합격	IT/인터넷
991	다쏘시스템코리아	중견기업			대구 남구			0		무관	무관			IT/인터넷
992	루닛	중소기업			서울 강남구			0		무관	무관			IT/인터넷
993	노벨리스코리아	중견기업			서울 중구			0		무관	무관	Bachelor’s degree and above. Majori in business administration or Accounting is preferred Good understanding of product costing in manufacturing business and operations Relevant experience in manufacturing industry Good communication skills with various stakeholders English Proficiency in both verbal and written Expertise in MS Excel Power BI experience is a plus	[전형절차]\n서류 전형- 면접 전형 - 최종 합격	IT/인터넷
994	노벨리스코리아	중견기업			서울 중구	학사		0		무관	무관	학력: 대졸(4년) 이상	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
995	노벨리스코리아	중견기업			서울 중구	학사	기계 계열	0	영어 성적 요구	무관	필수	재료공학, 기계공학, 산업공학 등 공학 배경 학사 학위 이상  영어 능통자  수준급 MS Office (Excel, PPT) 활용 가능한 자  정기적인 국내/해외 출장이 가능한 자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
996	노벨리스코리아	중견기업			울산 남구			0		무관	무관	1. Support global project 2. Operate Regional systems   Develop & maintain the regional applications to meet the customer business goal 3. Enhancement Regional system Improve the regional applications to meet the customer business goal Execution & leading Hot Mill, Supply Chain & GMS area for Asia MES integration project Execution & leading ABS, OES, GMS & DMS for Asia project 4. Better understanding business part useful IT application	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
997	넥슨	대기업			경기 성남시 분당구			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
998	(주)커넥트웨이브	중견기업			서울 금천구			0		무관	무관			IT/인터넷
999	몰로코	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1000	라이나손해보험	금융권			서울 종로구			0		무관	무관			IT/인터넷
1001	아인의료재단	비영리단체/협회/재단			인천 미추홀구			0		무관	무관			IT/인터넷
1002	시큐아이	대기업			서울 종로구			0		무관	무관			IT/인터넷
1003	메가존클라우드	중견기업			서울 강남구			0		무관	무관			IT/인터넷
1080	LG이노텍	대기업			서울 강서구			0		무관	무관			연구개발/설계
1081	삼화콘덴서공업	중견기업			경기 용인시 처인구			0		무관	무관			연구개발/설계
1004	프레인글로벌	중소기업			서울 중구			0		무관	무관		[전형절차]\n서류 접수 > 실무 및 임원 면접 > 최종 합격 및 입사\n합격자에 한해 개별 연락드려요.\n해당 포지션은 1년 계약직입니다.	IT/인터넷
1005	업스테이지	중소기업			경기 용인시 수지구			0		무관	무관			IT/인터넷
1006	롯데GFR	대기업			서울 강남구			0		무관	무관			IT/인터넷
1007	롯데GFR	대기업			서울 강남구	학사		0		무관	무관	학력 : 대졸이상(4년)  경력 : 여성복 기획MD 경력 4~6년차		IT/인터넷
1008	비즈니스캔버스	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1009	넷마블네오	대기업			서울 구로구			0		무관	무관			IT/인터넷
1010	넷마블네오	대기업			서울 구로구			0		무관	무관			IT/인터넷
1011	알파브라더스	중소기업			서울 강서구			0		무관	무관			IT/인터넷
1012	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
1013	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
1014	네오플	대기업			제주특별자치도 제주시			0		무관	무관	UI/UX관련 전공, 또는 3년 이상 경력이 있으신 분을 찾고 있습니다.  적극적인 의견 개시와 더불어 의견에 대한 수용성에 있어서도 원활한 분이었으면 좋겠습니다.  UX에 대해 지대한 관심이 있고 아이디어 제안이 가능한 분이면 최고입니다.  UI 연출에 대한 쫀득한 맛을 체득하신 분이면 더욱 좋겠습니다. [채용 여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
1015	뮌헨재보험 한국지점	중소기업			서울 종로구			0		무관	무관			IT/인터넷
1016	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
1017	네오플	대기업			서울 강남구		물리 계열	0		무관	무관	C++, Unreal Engine 등 프로그래밍 언어에 대한 깊은 이해를 가진 분  3D 액션 게임 전투(스킬 제작, 애니메이션, AI, 물리) 개발에 대한 관심이 있으신 분  하드코어 액션 RPG (몬스터헌터, 소울라이크 등) 및 3D 액션 전투 플레이를 잘 하시거나, 거부감이 없으신 분  문제의 원인 분석 및 해결 능력이 뛰어나신 분  수평적 의사 소통 및 애자일 개발 방식에 거부감이 없으신 분  적극적 커뮤니케이션: 효과적인 개발을 위하여 [문서화/대화/토론/피드백] 에 적극적인 분  꾸준한 트래킹과 테스트 : '저절로 되는 것은 없다'는 마인드로 꼼꼼하게 작업을 관리하실 수 있는 분  상호 존중의 마인드 : 프로젝트는 많은 사람들이 모여 이룩하는 공동의 작업이라는 이해가 있으신 분 [채용 절차]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
1018	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
1019	네오플	대기업			서울 강남구			0		무관	무관	신입/경력 무관  원화 해석 및 조형 능력이 뛰어나서 원화보다 더 멋진 모델링을 추구하시는 분을 찾습니다.  카툰풍 모델링 제작 경험이 있거나 카툰 스타일 그래픽을 좋아하시는 분을 찾고 있습니다.  카툰 그래픽으로 퀄리티 정점을 찍고 싶은 분이었으면 좋겠습니다.  3DS Max, ZBrush, Substance에 충분히 숙련되신 분을 찾고 있습니다.  끊임없는 퀄리티 향상에 갈증을 느끼는 분을 찾고 있습니다.	[전형 절차]\n- 서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사	IT/인터넷
1020	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
1021	버킷플레이스(오늘의집)	중소기업			서울 서초구			0		무관	무관			IT/인터넷
1022	마상소프트	중소기업			부산 해운대구			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1023	마상소프트	중소기업			부산 해운대구			0		무관	무관	배우고 성정하기 위해 노력 하는 분  이슈 및 보안 등 새로운 변화에 두려워 하지 않고 즐기시는 분  긍정적으로 생각하고 실천하는 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1024	Codiz Inc	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
1025	DB Insurance USA	금융권	해외					0		무관	무관			IT/인터넷
1026	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
1027	뉴파워프라즈마	중견기업			경기 수원시 권선구, 서울 강서구			0		무관	무관			IT/인터넷
1028	DB Insurance	중견기업	IT/인터넷					0		무관	무관			IT/인터넷
1029	라인플러스	대기업			경기 성남시 분당구			0		무관	무관	7년 이상의 서비스기획 또는 제품관리(Product Management) 경험을 보유하신 분  스스로 목표와 전략 설정이 가능하고, 논리적이고 효과적인 커뮤니케이션 능력을 보유하신 분  프러덕트에 대한 오너쉽을 가지고 서비스를 런칭하고 주도적으로 크게 성장시켜본 경험을 보유하신 분  데이터를 기반으로 문제 해결 능력을 보유하신 분  실패를 두려워하지 않고 근성을 가지고 배움과 일을 대하시는 분		IT/인터넷
1030	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1031	카카오페이	금융권			경기 성남시 분당구			0		무관	무관			IT/인터넷
1032	(주)미미박스	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
1033	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1034	하이퍼리즘	중소기업			서울 관악구			0		무관	무관			IT/인터넷
1035	마이리얼트립	중소기업			서울 서초구			0		무관	무관			IT/인터넷
1036	한화이센셜	대기업			충남 아산시			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1037	쎄믹스	중소기업			경기 성남시 분당구		전기 계열	0	영어 성적 요구	무관	필수	* 신입  전기 / 전자 / 반도체 공학 (또는 유사학과)  OPIC IM2급 (점) 이상/TOEIC Speaking IM3 이상  해외 출장에 결격사유가 없는 자 * 경력  위 신입 요건 충족  Motion & IO 제어 / PLC 제어 / AutoCAD 설계  BOM 관리 경험	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1079	휴비츠	중소기업			경기 안양시 동안구	학사	전자 계열	0	영어 성적 요구	무관	필수	대졸 이상(전자 관련 전공)  비즈니스 영어 회화 가능자(TOEIC 700점 이상)  해외 출장에 결격 사유가 없는 분		연구개발/설계
1038	쎄믹스	중소기업			경기 광주시		전자 계열	1		무관	무관	신입 : 전자공학 또는 반도체 공학을 전공하고 반도체 및 회로에 대한 이해도가 높은 분  경력; 테스터 영업 경력 1년 이상 유경험자로 반도체에 대한 이해도가 높은 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1039	주식회사 케어마인더	스타트업			서울 강남구			0		무관	무관			IT/인터넷
1040	야놀자	중견기업			서울 강남구			0		무관	무관			IT/인터넷
1041	어스얼라이언스	중소기업			서울 마포구			0		무관	무관			IT/인터넷
1042	엔피씨	중견기업			경기 용인시			0		무관	무관			IT/인터넷
1043	유비벨록스	중견기업			서울 구로구, 충청 진천군			0		무관	무관			IT/인터넷
1044	보쉬전장	중견기업			세종특별자치시			0		무관	무관			연구개발/설계
1045	성신양회	중견기업		전기	충북 단양군	학사	전기 계열	5		무관	무관	학력 : 4년제졸 이상 전공 : 전기, 전기공학 계열 경력  신입 또는 경력 5년 이상		연구개발/설계
1046	SFA반도체	중견기업			충남 천안시 서북구			0		무관	무관			연구개발/설계
1047	큐알티	중소기업		FIB	경기 수원시 영통구	전문학사	이공 계열	0		무관	무관	(1) 학력: 전문학사 (2) 전공: 이공계열		연구개발/설계
1048	현대제철	대기업			경북 포항시 남구			0		무관	무관			연구개발/설계
1049	종근당바이오	중견기업			경기 안산시 단원구			0		무관	무관			연구개발/설계
1050	신한투자증권	대기업			서울 영등포구			0		무관	무관			연구개발/설계
1051	극지연구소	공공기관/공기업						0		무관	무관			연구개발/설계
1052	대상	대기업		경영지원_기술관리	서울 종로구, 경남 거창군, 경기 용인시 기흥구, 전북특별자치도 군산시, 충남 천안시 서북구			0		필수	필수	1. '25년 8월 졸업예정자 혹은 직무별 학력 기졸업자 2. 해외여행에 결격사유가 없고, 남성의 경우 병역의무를 필하였거나 면제인 분		연구개발/설계
1053	현대모비스	대기업			서울 강남구			0		무관	무관			연구개발/설계
1054	대상	대기업		연구기획	서울 강서구			0		필수	필수	1. '25년 8월 졸업예정자 혹은 직무별 학력 기졸업자 2. 해외여행에 결격사유가 없고, 남성의 경우 병역의무를 필하였거나 면제인 분		연구개발/설계
1055	현대모비스	대기업		배터리 전기화학 분석	경기 용인시 기흥구	석사		0		무관	무관	2025년 8월 졸업 예정자 또는 기졸업자 ※ 최종합격 후 회사에서 지정하는 날짜에 입사 가능해야 하며, 학/석사 졸업 요건을 충족하지 못할 경우 입사 취소될 수 있습니다.		연구개발/설계
1056	한화엔진	대기업			경남 창원시 성산구			0		무관	무관			연구개발/설계
1057	BGF에코머티리얼즈	중견기업			경기 화성시, 서울 강남구			0		무관	무관			연구개발/설계
1058	Englewood LAB	기타						0		무관	무관			연구개발/설계
1059	코스트코코리아	중견기업			울산 북구			0		무관	무관			연구개발/설계
1060	크라운제과	중견기업		일반관리	서울 용산구, 대전 대덕구, 경기 양주시	학사		0		무관	무관	① 학력: 4년제 대졸학사 이상		연구개발/설계
1061	동국제약	중견기업			충북 진천군, 경기 수원시 영통구			0		무관	무관			연구개발/설계
1062	LG CNS	대기업		통신 OSS 영역 개발	서울 마포구			0		무관	무관			연구개발/설계
1063	어플라이드머티어리얼즈코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
1064	후루노코리아	외국계기업			부산 동구			0		무관	무관			연구개발/설계
1065	SK하이닉스	대기업			경기 이천시, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
1066	한국동서발전	공공기관/공기업			울산 중구, 충남 당진시, 강원특별자치도 동해시, 경기 고양시 일산동구, 대전 유성구			0		무관	무관			연구개발/설계
1067	한국재료연구원	비영리단체/협회/재단		01) 극저온 환경용 코팅 공정 개발 및 트라이볼로지 연구	경남 창원시 성산구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1068	서울시복지재단	비영리단체/협회/재단			서울 마포구			0		무관	무관			연구개발/설계
1069	경농	중견기업		기반육종팀 육종연구원	경기 이천시			0		무관	무관		[전형 안내]\n서류전형 - 인적성검사 - 면접전형 - 최종합격	연구개발/설계
1070	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			연구개발/설계
1071	한국원자력협력재단	비영리단체/협회/재단			해외			0		무관	무관			연구개발/설계
1072	포스코DX	대기업		전기설계	경북 포항시 남구, 전남 광양시, 경기 성남시 분당구	학사		0	영어 성적 요구	필수	필수	4년제 대학 졸업(예정)자 영어 어학성적 보유자 회사가 지정한 일자에 인턴활동 및 입사가 가능한 자 '25. 6. 1 이전 병역필(예정) 또는 면제자로 해외여행에 결격사유가 없는 자 영어 말하기 성적은 '23. 5. 22 이후 취득 성적만 인정		연구개발/설계
1073	아이쓰리시스템	스타트업			대전 유성구			0		무관	무관			연구개발/설계
1074	LG CNS	대기업		공정물류 기구, 전장/제어	서울 강서구, 충북 청주시 서원구			5		무관	무관	기구/설계/전장/제어의 경력이 5년 이상 있으신 분 물류 센터 설비, 레이아웃/장비 설계/이행 경력이 5년 이상 있으신 분 2차 전지 물류/클린 공정 물류 설계/이행 경력이 5년이상 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1075	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			연구개발/설계
1076	포스코DX	대기업			경북 포항시 남구, 전남 광양시			0		무관	무관			연구개발/설계
1077	(재)지능형자동차부품진흥원	비영리단체/협회/재단			대구 달성군			0		무관	무관			연구개발/설계
1078	에이스웍스코리아	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1082	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			연구개발/설계
1083	국립정신건강센터	공공기관/공기업			서울 광진구			0		무관	무관			연구개발/설계
1084	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			연구개발/설계
1085	한국토지주택공사	공공기관/공기업			서울 강남구, 인천 남동구, 대구 달서구, 대전 서구, 광주 서구			0		무관	무관			연구개발/설계
1086	다원시스	중견기업			경기 안산시 단원구			0		무관	무관			연구개발/설계
1087	한국타이어앤테크놀로지	대기업			대전 유성구			0		무관	무관			연구개발/설계
1088	주식회사 에이펙솔루션	중견기업						0		무관	무관			연구개발/설계
1089	인트론바이오	중소기업						0		무관	무관			연구개발/설계
1090	현대트랜시스	대기업			경기 화성시			0		무관	무관			연구개발/설계
1091	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			연구개발/설계
1092	삼양사	중견기업			대전 대덕구			0		무관	무관			연구개발/설계
1093	한국공항공사	공공기관/공기업			서울 강서구			0		무관	무관			연구개발/설계
1094	한국가스공사	공공기관/공기업						0		무관	무관			연구개발/설계
1095	남양넥스모	중견기업		국내영업 A	경기 안산시 단원구, 경기 화성시			0		무관	무관			연구개발/설계
1096	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			연구개발/설계
1097	(주)리디자인엑스	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
1098	공무원연금공단	공공기관/공기업		5급_사무(일반)_행정/법학	서울 강남구			0		무관	무관	성별 연령 제한 없음(단, 공단 정년(만 60세) 초과자 제외)  공단 인사규정의 임용결격 사유에 해당되지 않는 자		연구개발/설계
1099	목암생명과학연구소	기타			서울 서초구			0		무관	무관			연구개발/설계
1100	삼양홀딩스	중견기업			울산 남구, 인천 중구, 대전 대덕구, 대전 대덕구			0		무관	무관			연구개발/설계
1101	HL만도	중견기업			경기 성남시 분당구	전문학사	전자 계열	0		무관	무관	전문학사 이상 전자공학 계열 전공		연구개발/설계
1102	SK바이오사이언스	대기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
1103	삼양그룹	대기업		환경관리	대전 유성구, 울산 남구, 인천 서구			0	영어 성적 요구	필수	필수	기졸업자 및 2025년 8월 졸업예정자 해외여행에 결격사유가 없는 자 남성의 경우 군필자 또는 면제자 공인 영어말하기 성적보유자(OPIc 및 TOEIC SPEAKING에 한함)  TOEIC SPEAKING/OPIc IM1이상  서류접수 마감일 기준 2년 이내 유효 성적에 한함		연구개발/설계
1104	원익아이피에스	중견기업		고객지원(CS)	경기 평택시, 경기 화성시, 경기 평택시			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1105	수협중앙회	금융권		일반관리계(지도사업)	서울 마포구, 인천 연수구, 강원특별자치도 동해시, 충남 보령시, 전북특별자치도 김제시			0		무관	무관		[전형 안내]\n서류전형 - 필기전형 - 면접전형 - 최종합격	연구개발/설계
1106	한성자동차	중견기업			서울 서초구, 경기 용인시 기흥구, 경기 성남시 분당구, 인천 남동구, 대전 대덕구			0		무관	무관			연구개발/설계
1107	삼진제약	대기업			서울 마포구, 경기 화성시, 서울 강서구			0		무관	무관			연구개발/설계
1108	목암생명과학연구소	기타		Computational bioloogy/bioinformatics 연구원	서울 서초구			0		무관	무관			연구개발/설계
1109	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
1110	노르마	중소기업		QPU 설계	서울 성동구			0		무관	무관	3학년 이상 재학 중인 학생/대학원생  연관 분야 전공		연구개발/설계
1111	한덕화학	대기업			울산 남구			0		무관	무관			연구개발/설계
1112	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			연구개발/설계
1113	삼양홀딩스	중견기업			서울 종로구			0		무관	무관			연구개발/설계
1114	LG전자	대기업		HS사업본부	서울 영등포구, 경남 창원시 성산구, 경기 평택시			0		무관	무관			연구개발/설계
1115	파마리서치	중소기업		코스메틱 연구	경기 성남시 수정구	석사	화학 계열	0		무관	무관	<코스메틱 연구> 학력 : 석사 이상(화학, 생화학, 생명공학, 분자생물학 등 유관 전공자) 화장품(기초 및 헤어) 제품 개발 및 연구 유경험자 <의료기기 연구> 학력 : 석사 이상 고분자 연구 및 효력 연구 경험자	[전형 안내]\n서류전형 → 면접전형 → 최종합격	연구개발/설계
1116	쓰리빌리언	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1117	쓰리빌리언	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1118	파마리서치	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
1119	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			연구개발/설계
1120	SK ON	대기업			대전 유성구			0		무관	무관			연구개발/설계
1121	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			연구개발/설계
1122	온세미컨덕터코리아	대기업		SiC TD Engineer	경기 부천시 원미구			0		무관	무관			연구개발/설계
1123	카카오모빌리티	중견기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
1124	글로벌스탠다드테크놀로지	중견기업			경기 화성시, 충남 아산시, 경기 평택시, 경기 용인시 기흥구			0		무관	무관			연구개발/설계
1125	오알에스코리아 | ORSKOREA	외국계기업						0		무관	무관			연구개발/설계
1126	대구농수산물유통관리공사	중소기업			대구 북구			0		무관	무관			연구개발/설계
1127	도루코	중견기업		내부감사	서울 강남구, 경기 용인시 처인구	학사		0		무관	무관	학사 이상	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1128	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			연구개발/설계
1129	엘비세미콘	중견기업			경기 평택시			0		무관	무관			연구개발/설계
1130	엘비세미콘	중견기업			경기 평택시			0		무관	무관			연구개발/설계
1131	엘비세미콘	중견기업			경기 안성시			0		무관	무관			연구개발/설계
1132	LSP USA, LLC	기타						0		무관	무관			연구개발/설계
1133	에어퍼스트	중견기업		부천공장 오퍼레이터	경기 평택시, 경기 부천시 원미구, 경북 포항시 남구, 충남 서산시, 경기 용인시 기흥구			0		무관	무관			연구개발/설계
1134	엠케이에스코리아	외국계기업			경기 용인시 기흥구			0		무관	무관			연구개발/설계
1135	KT넷코어	대기업			서울 강남구			0		무관	무관			연구개발/설계
1136	KT넷코어	대기업			서울 강남구			0		무관	무관			연구개발/설계
1137	Spigen Inc	중견기업						0		무관	무관			연구개발/설계
1138	슈어소프트테크	중소기업		차량 제어기 검증의 실무 기술 습득	경기 성남시 수정구		전자 계열	0		무관	무관	전자, 컴퓨터, SW공학 관련 학과  C언어 및 Python 프로그래밍 경험  원활한 소통이 가능하신 분  컴퓨터 활용 능력(엑셀) : 中 이상  학점 3.5/4.5 이상  졸업 예정자	[전형 안내]\n서류 전형 - 필기시험 - 면접 전형 - 인턴십 - 임원 면접 - 최종 합격	연구개발/설계
1139	한국타이어앤테크놀로지	대기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
1140	파마리서치	중견기업		-코스메틱 연구-	경기 성남시 수정구	석사	화학 계열	0		무관	무관	학력 : 석사 이상(화학, 생화학, 생명공학, 분자생물학 등 유관 전공자) 화장품(기초 및 헤어) 제품 개발 및 연구 유경험자	[전형 안내]\n서류전형 - 면접전형 - 최종합격 및 입사	연구개발/설계
1141	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
1142	국경없는의사회 한국	비영리단체/협회/재단			해외			0		무관	무관			연구개발/설계
1143	현대자동차	대기업		AI/Data	서울 서초구			0		무관	무관	Ph.D. candidates/graduates in STEM from global universities (including post docs) Applicants must be able to join the company by August 2026	[전형 안내]\n서류전형 - 면접전형 - 현대 기술 세미나 - 최종합격	연구개발/설계
1144	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
1145	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
1146	아이리스브라이트	중소기업			서울 강남구			0		무관	무관			연구개발/설계
1147	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			연구개발/설계
1148	주식회사 더파운더즈	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1149	에어리퀴드코리아	중견기업			대전 대덕구			0		무관	무관			연구개발/설계
1150	에어리퀴드코리아	중견기업			강원특별자치도 원주시			0		무관	무관			연구개발/설계
1151	머크코리아	외국계기업		Product Compliance Specialist	서울 강남구			0		무관	무관	Bachelor's degree required. Chemistry related major is preferred, but not mandatory  0 3 years of Chemical/Hazardous substance, Regulatory, Product Stewardship, K REACH experience is a plus  Fluent English and Korean (Speaking and Writing)  Ability to work in a fast paced, global environment	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1152	펜믹스	중견기업			충남 천안시 서북구			0		무관	무관			연구개발/설계
1153	(주)삼구아이앤씨	중견기업			서울 중구			0		무관	무관			연구개발/설계
1154	램리서치코리아	외국계기업		Process Technician for KTC R&D Center	경기 용인시 기흥구			0		무관	무관			연구개발/설계
1155	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			연구개발/설계
1156	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			연구개발/설계
1157	주식회사 라포랩스	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1158	주식회사 라포랩스	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1159	DAS North America, Inc.	중견기업			해외			0		무관	무관			연구개발/설계
1160	나노신소재	중소기업		첨단 나노소재 R&D	세종특별자치시 , 대전 유성구	박사	화학 계열	0	영어 성적 요구	필수	무관	화학, 화학공학, 재료공학 등 관련 전공, 석 박사 학위 이상 비즈니스 영어 회화 가능자 해외 여행에 결격사유가 없는 자 남성의 경우, 병역 필 또는 면제자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1161	테크로스	중견기업			경기 화성시			0		무관	무관			연구개발/설계
1162	삼양홀딩스	중견기업			서울 종로구			0		무관	필수	해외여행에 결격사유가 없는 분		연구개발/설계
1163	한화비전	대기업		AI 연구원	경기 성남시 분당구	박사		0		무관	무관	1D Signal(Audio) processing 관련 석/박사 학위 소지자		연구개발/설계
1164	Psomagen	외국계기업						0		무관	무관			연구개발/설계
1165	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			연구개발/설계
1166	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			연구개발/설계
1167	엘비세미콘	중견기업		TEST제품기술2팀	경기 안성시	학사	전자 계열	0		무관	무관	학력: 대졸 이상(4년) 전공: 반도체, 전자, 기계, 컴퓨터, 통신 공학과		연구개발/설계
1168	University of Nebraska Song Lab	기타						0		무관	무관			연구개발/설계
1169	실리콘마이터스	중견기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
1170	마상소프트	중소기업			부산 해운대구			0		무관	무관	배우고 성정하기 위해 노력 하는 분  이슈 및 보안 등 새로운 변화에 두려워 하지 않고 즐기시는 분  긍정적으로 생각하고 실천하는 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
1171	파마리서치	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
1172	파트론	중견기업			경기 화성시	석사	전기 계열	6		무관	무관	신입 (석사 이상) 또는 경력 6년 이상  고속 인터페이스 설계 경험  SI/PI/EMI 설계 경험  Design 및 Simulation Tool 사용 가능자 (SIWave,Q3D,HFSS 등)  전자/전기/통신공학 또는 관련 전공자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
1173	휴온스메디텍	중소기업			경기 성남시 중원구	학사	전기 계열	2		무관	무관	학력 : 대졸 이상 (2,3년) 경력 : 신입/경력(2년 이내) 전공 : 전기/전자공학, 기계, 자동차 공학계열 운전면허증 소지자 의사소통능력, 긍정적인 마인드, 책임감 있는 사람, 문제해결능력, 지속적인 자기개발	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
1174	쎄믹스	중소기업			경기 광주시		기계 계열	2		무관	무관	경력: 신입/경력 2년 이상  기계설계 가능자  회로설계 가능자  전장, 하네스 설계 가능자  공정설계 가능자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
1175	팀프레시	중소기업			서울 강남구			0		무관	무관			연구개발/설계
1176	조선내화	대기업		제조기술직_전남 광양	전남 광양시, 경북 포항시 남구	고졸		0		필수	무관	고등학교 이상 졸업인 분으로서, 2025년 7월 내 회사가 지정한 입사일에 입사 가능하신 분 책임감이 강하고 출결 상태가 양호하신 분 남성의 경우, 병역필 또는 면제이신 분		생산/제조
1177	코오롱생명과학	대기업			충북 충주시			0		무관	무관			생산/제조
1178	Englewood LAB	기타			생산/제조, 연구개발/설계			0		무관	무관			생산/제조
1179	포스코모빌리티솔루션	대기업			경북 포항시 남구			0		무관	무관			생산/제조
1180	크라운제과	중견기업		일반관리	서울 용산구, 대전 대덕구, 경기 양주시	학사		0		무관	무관	① 학력: 4년제 대졸학사 이상		생산/제조
1181	동국제약	중견기업			충북 진천군, 경기 수원시 영통구			0		무관	무관			생산/제조
1182	엘앤에프	중견기업	생산/제조					0		무관	무관			생산/제조
1183	CJ푸드빌	대기업		음성공장 OEM관리파트 품질보증(QA) 담당				0		무관	무관		[전형 안내]\n서류전형 → 인적성 검사(사원급 限) → 1차 면접 → 평판조회 → 2차 면접(간부급 限) → 처우협의 → 건강검진 → 입사	생산/제조
1184	DB하이텍	대기업	생산/제조					0		무관	무관	마이스터고/특성화고 26년 졸업 예정자		생산/제조
1185	하나머티리얼즈	중견기업			충남 아산시			0		무관	무관			생산/제조
1186	하나머티리얼즈	중견기업			충남 아산시			0		무관	무관			생산/제조
1187	하나머티리얼즈	중견기업			충남 천안시 서북구			0		무관	무관			생산/제조
1188	SK하이닉스	대기업			경기 이천시, 충북 청주시 흥덕구			0		무관	무관			생산/제조
1189	한온시스템	중견기업			경기 광명시	고졸		0		무관	무관	고등학교 졸업 이상		생산/제조
1190	LS이모빌리티솔루션	대기업			충북 청주시 흥덕구			0		무관	무관			생산/제조
1191	경창산업	중견기업			대구 달서구	고졸		0		무관	무관	학력 : 고졸이상 경력: 무관		생산/제조
1192	경신	중견기업		품질관리	인천 연수구, 경북 경주시			0		무관	무관			생산/제조
1193	광동제약	중견기업			경기 평택시			0		무관	무관			생산/제조
1194	텍사스인스트루먼트코리아	중견기업			서울 강남구			0		무관	무관			생산/제조
1195	티씨케이	중견기업			경기 안성시			0		무관	무관			생산/제조
1196	세아베스틸	대기업			전북특별자치도 군산시			0		무관	무관			생산/제조
1197	GC녹십자웰빙	중견기업						0		무관	무관			생산/제조
1198	휴온스	중견기업			충북 제천시			0		무관	무관			생산/제조
1199	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			생산/제조
1200	경신전선	중견기업		생산관리	충남 천안시 서북구	학사		0		필수	무관	학력: 국내외 대학 학사 학위 이상 소지자  해외출장에 결격사유가 없는 자, 남자의 경우 병역을 필한 자  토익 700점 이상 또는 이에 준하는 공인어학성적 소지자	[전형 안내]\n서류전형 - AI역량검사 - 면접전형 - 최종합격	생산/제조
1201	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			생산/제조
1202	주식회사 에이펙솔루션	중소기업	생산/제조					0		무관	무관			생산/제조
1203	현대트랜시스	대기업			경기 화성시			0		무관	무관			생산/제조
1204	삼화콘덴서공업	중견기업			경기 용인시 처인구			0		무관	무관			생산/제조
1205	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			생산/제조
1206	SK레조낙	대기업			경북 영주시	고졸		0		무관	무관	○  학력 : 고졸 이상 ○  경력 : 무관		생산/제조
1207	코스비전	대기업		SCM	대전 대덕구	고졸	화학 계열	0		무관	무관	경력: 무관 학위: 고졸이상 전공: 화학/화장품학	[전형 안내]\n서류전형 → 인성검사 / 1차면접 → 인턴전형(3개월) → 최종면접 → 최종합격	생산/제조
1208	삼아알미늄	중견기업	생산/제조					0		무관	무관			생산/제조
1209	네패스	중견기업			충북 청주시 청원구, 충북 청주시 청원구			0		무관	무관			생산/제조
1210	다인정공	중견기업	생산/제조					0		무관	무관			생산/제조
1211	이디야	중견기업			서울 강남구, 광주 서구, 경기 고양시 일산동구, 서울 동대문구, 서울 강남구			0		무관	무관			생산/제조
1212	머크	중견기업						0		무관	무관			생산/제조
1213	(주)삼구아이앤씨	중견기업	생산/제조, 디자인					0		무관	무관			생산/제조
1214	DB하이텍	대기업	생산/제조					0		무관	무관			생산/제조
1215	동희오토	중견기업			충남 서산시			0		무관	무관			생산/제조
1216	주식회사 에이펙솔루션	중견기업			생산/제조, 연구개발/설계			0		무관	무관			생산/제조
1217	Posco AAPC LLC.	중견기업	생산/제조					0		무관	무관			생산/제조
1218	POSCO AAPC LLC.	대기업						0		무관	무관			생산/제조
1219	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			생산/제조
1220	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			생산/제조
1221	제뉴원사이언스	중견기업			세종특별자치시 , 충북 제천시			0		무관	무관			생산/제조
1222	한국콜마	중견기업			세종특별자치시			0		무관	무관			생산/제조
1223	삼양홀딩스	중견기업			울산 남구, 인천 중구, 대전 대덕구, 대전 대덕구			0		무관	무관			생산/제조
1224	SK피유코어	중견기업	생산/제조					0		무관	무관			생산/제조
1225	HD현대인프라코어	대기업			전북특별자치도 군산시			0		무관	무관			생산/제조
1226	SIMPAC	중견기업			대구 달성군			0		무관	무관			생산/제조
1227	삼양그룹	대기업		환경관리	대전 유성구, 울산 남구, 인천 서구			0	영어 성적 요구	필수	필수	기졸업자 및 2025년 8월 졸업예정자 해외여행에 결격사유가 없는 자 남성의 경우 군필자 또는 면제자 공인 영어말하기 성적보유자(OPIc 및 TOEIC SPEAKING에 한함)  TOEIC SPEAKING/OPIc IM1이상  서류접수 마감일 기준 2년 이내 유효 성적에 한함		생산/제조
1228	쿠팡풀필먼트서비스	대기업		설비보전 전문가 팀원급	경기 고양시 덕양구, 경기 화성시, 인천 서구, 경기 평택시, 경북 경산시			1		무관	무관	관련 학과 졸업 or 관련 자격증 보유 or 관련 경력 1년 이상		생산/제조
1229	LX MMA	대기업		계전	전남 여수시, 대전 유성구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 인턴십 - 입사	생산/제조
1230	다스	중견기업		회계	경북 경주시	학사		0		무관	무관	4년제 대졸 ('25년 8월 졸업예정자 가능)  해외 출국에 결격사유가 없는 자	[전형 안내]\n서류전형 - 역량검사 - 면접전형 - 인턴십 - 최종합격	생산/제조
1231	해태제과식품	중견기업			충남 아산시, 광주 북구, 경기 양주시, 서울 용산구			0		무관	무관			생산/제조
1232	에어퍼스트	중견기업			경기 용인시 기흥구			0		무관	무관			생산/제조
1233	에쓰오일토탈에너지스윤활유	대기업				고졸	기계 계열	0		무관	무관	1) 기술사 : 건축기계설비, 기계, 건설기계, 공조냉동기계, 산업기계설비, 용접 2) 기능장 : 배관, 에너지관리, 용접 3) 기   사 : 건축설비, 건설기계설비, 공조냉동기계, 용접, 에너지관리, 설비보전, 일반기계 4) 산업기사 : 건출설비, 건설기계설비, 공조냉동기계, 에너지관리, 배관, 용접 (단, 산업기사는 취득 후 관련분야 3년이상 경력 필수) l  고등학교 졸업 이상	[전형절차]\n- 서류전형 > 인적성 및 면접전형 > 최종합격	생산/제조
1234	HD현대오일뱅크	대기업	생산/제조	ePTFE 분리막 생산				0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1235	타라티피에스	중견기업		국내사업본부_수주 영업	서울 마포구, 경기 파주시			0		필수	필수	2025년 7월 입사 가능자  남성의 경우 병역필 또는 면제자  해외 출장에 결격사유 없는 자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1236	삼진제약	대기업			서울 마포구, 경기 화성시, 서울 강서구			0		무관	무관			생산/제조
1237	번개장터	스타트업			서울 성동구			0		무관	무관			생산/제조
1238	ICER Brands Services, LLC.	외국계기업	생산/제조					0		무관	무관			생산/제조
1239	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			생산/제조
1240	한덕화학	대기업			울산 남구			0		무관	무관			생산/제조
1241	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			생산/제조
1242	동국제강	중견기업			충남 당진시			0		무관	무관			생산/제조
1243	주식회사 에이펙솔루션	중견기업	생산/제조					0		무관	무관			생산/제조
1244	효림그룹	중견기업		XE_품질보증팀	서울 강남구, 대구 달서구, 경북 경산시, 경남 창원시 성산구, 경북 경산시			0		무관	무관			생산/제조
1245	현대엠시트	대기업			충남 아산시			0		무관	무관			생산/제조
1246	주식회사 에이펙솔루션	중견기업	생산/제조					0		무관	무관			생산/제조
1247	LG화학	대기업			전남 여수시			0		무관	무관			생산/제조
1248	쎄믹스	중소기업			경기 광주시			0		무관	무관			생산/제조
1249	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			생산/제조
1250	주식회사 인터엑스	스타트업			울산 중구			0		무관	무관			생산/제조
1251	SK ON	대기업			대전 유성구			0		무관	무관			생산/제조
1252	에어리퀴드코리아	중견기업			서울 강남구	전문학사	화학 계열	0		무관	무관	2,3년제 전문대 화학/ 화학공학 관련 전공 졸업자		생산/제조
1253	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			생산/제조
1254	마니커에프앤지	중소기업			경기 용인시 처인구, 서울 송파구			0		무관	무관			생산/제조
1255	DaeSang America USA, Inc.	중견기업	생산/제조					0		무관	무관			생산/제조
1256	SB America Inc	중견기업	무역/유통, 생산/제조					0		무관	무관			생산/제조
1257	태양연마	중견기업			무역/유통, 영업/고객상담, 경영/사무, 생산/제조, 연구개발/설계, IT/인터넷			0		무관	무관			생산/제조
1258	하나마이크론	중견기업		반도체 공정기술엔지니어	충남 아산시			0		무관	무관			생산/제조
1259	(주)미미박스	외국계기업			서울 강남구			0		무관	무관			생산/제조
1260	세스코	중견기업						0		무관	무관			생산/제조
1261	삼전순약공업	중소기업			서울 강남구, 충북 진천군, 경북 포항시 남구, 대전 유성구, 서울 영등포구			0		무관	무관			생산/제조
1262	LSP USA, LLC	기타			IT/인터넷, 연구개발/설계, 생산/제조			0		무관	무관			생산/제조
1263	LSP USA, LLC	기타	생산/제조, IT/인터넷					0		무관	무관			생산/제조
1264	KSM	중견기업			경기 김포시			0		무관	무관			생산/제조
1265	에어퍼스트	중견기업		부천공장 오퍼레이터	경기 평택시, 경기 부천시 원미구, 경북 포항시 남구, 충남 서산시, 경기 용인시 기흥구			0		무관	무관			생산/제조
1266	EEW코리아	외국계기업			경남 사천시			0		무관	무관			생산/제조
1267	머크코리아	외국계기업			경기 시흥시			0		무관	무관			생산/제조
1268	엠케이에스코리아	외국계기업			경기 용인시 기흥구			0		무관	무관			생산/제조
1269	헨켈코리아	외국계기업		Production Administration Intern - 1year GDP	인천 연수구			0		무관	무관	At least a 4th year undergraduate student is required Excellent command of MS office is required utilizing macros is preferred Native proficiency in Korean and basic English skills are required Good communication skills are preferred Able to work for one year at the Songdo plant	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1270	헨켈코리아	외국계기업		Quality Intern_Eumseong				0		무관	무관	At least a 3rd year undergraduate student in Engineering, Chemistry, or a related field is required  Excellent command of MS Office is required  Native proficiency in Korean and basic English skills are required  Good communication skills are preferred	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1271	한섬	대기업			서울 강동구	전문학사		0		무관	무관	전문학사 학위 이상  경력 무관(신입채용)		생산/제조
1272	한솔섬유	대기업	생산/제조	국내원단생산팀		전문학사		3		무관	무관	1. 학력: 2년제 대학 졸업(예정) 이상 2. 전공: 무관 3. 어학: 당사 어학기준 충족 4. 경력: 신입 또는 3년 이하  필수) 운전면허 소지자 및 운전가능하신 분		생산/제조
1273	앰코테크놀로지코리아	중견기업			인천 연수구, 인천 계양구			0		무관	무관			생산/제조
1274	POSCO AAPC LLC.	대기업						0		무관	무관			생산/제조
1275	SEOHAN AUTO GEORGIA	중견기업	무역/유통, 생산/제조, 마케팅/광고/홍보, 경영/사무, 영업/고객상담					0		무관	무관			생산/제조
1276	Seoyon E-hwa Interior Systems Alabama	중견기업	무역/유통, 생산/제조, 경영/사무					0		무관	무관			생산/제조
1277	LG CNS	대기업		공정물류	서울 강서구			5		무관	무관	기구/설계/전장/제어의 경력이 5년 이상 있으신 분  물류 센터 설비, 레이아웃/장비 설계/이행 경력이 5년 이상 있으신 분  2차 전지 물류/클린 공정 물류 설계/이행 경력이 5년이상 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1278	Sinjin Texas	중소기업	생산/제조, 무역/유통					0		무관	무관			생산/제조
1279	서연이화	대기업	생산/제조					0		무관	무관			생산/제조
1280	보쉬렉스로스코리아	외국계기업			부산 강서구			0		무관	무관			생산/제조
1281	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			생산/제조
1282	한솔섬유	중견기업			서울 송파구	전문학사		3		무관	무관	1. 학력: 2년제 대학 졸업(예정) 이상 2. 전공: 무관 3. 경력: 신입 또는 3년 이하 4. 담당 업무: 원단 생산관리  원단 관련 오더관리  원단 오더관련 개발/기획/품질관리		생산/제조
1283	타이코에이엠피	외국계기업			경북 경산시			0		무관	무관	QIP, SAP, TARS  공정 및 제품(도면) 이해  제품추적 및 봉쇄조치  변경점 관리 및 절차숙지	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1284	램리서치코리아	외국계기업		Process Technician for KTC R&D Center	경기 용인시 기흥구			0		무관	무관			생산/제조
1285	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			생산/제조
1286	헨켈코리아	외국계기업			서울 마포구			0		무관	무관			생산/제조
1287	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관	기간계약직 포지션(1년 계약직)		생산/제조
1288	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관			생산/제조
1289	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관			생산/제조
1290	JCS Systems, Inc	기타	무역/유통, 생산/제조					0		무관	무관			생산/제조
1291	세스코	중견기업				고졸		0		무관	무관	학력 : 고등학교 졸업 이상 경력 : 무관 잔업, 특근 가능한 자 (월 평균 1~3회) 해외여행에 결격 사유가 없는 자 ❖ 채용절차 서류전형 → 1차면접 → 최종합격 ※ 해당 공고는 채용 완료 시 조기 마감될 수 있습니다.		생산/제조
1292	Simwon NA Corp.	중견기업						0		무관	무관			생산/제조
1293	DAS North America, Inc.	중견기업						0		무관	무관			생산/제조
1294	유한화학	중견기업		생산부문	경기 안산시 단원구, 경기 화성시			0		무관	무관			생산/제조
1295	블랭크코퍼레이션	중소기업			서울 강남구			0	영어 성적 요구	무관	무관	리빙 카테고리에 관심이 많은 분 프로세스가 강하고 글로벌 소싱 업무를 체계적으로 배우고 싶으신 분 제2외국어 (영어 & 중국어)에 강점이 있으신 분 논리를 기반으로 한 커뮤니케이션이 가능하신 분 유연한 사고방식과 수용성이 뛰어나신 분		생산/제조
1296	AJIN/Wooshin USA	중견기업						0		무관	무관			생산/제조
1297	한솔섬유	중견기업	생산/제조					0		무관	무관			생산/제조
1298	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			생산/제조
1299	엘비세미콘	중견기업		TEST제품기술2팀	경기 안성시	학사	전자 계열	0		무관	무관	학력: 대졸 이상(4년) 전공: 반도체, 전자, 기계, 컴퓨터, 통신 공학과		생산/제조
1300	쌤소나이트코리아	중견기업		Sales Inventory Planning Coordinator (6개월 인턴)	서울 강남구	학사		0		무관	무관	4년제 학사 학위 이상 소지자 (졸업예정자 및 수료자 포함)		생산/제조
1301	아진조지아	대기업	생산/제조					0		무관	무관			생산/제조
1302	네패스아크	중견기업						0		무관	무관			생산/제조
1303	올라까삐딴	중소기업			서울 서대문구			0		무관	무관			생산/제조
1304	삼양제분	중소기업			강원특별자치도 원주시			0		무관	무관			생산/제조
1305	Hwashin America Corp.	중소기업						0		무관	무관			생산/제조
1306	한솔섬유	중견기업	생산/제조					0		무관	무관			생산/제조
1307	인터코스코리아	중소기업			경기 오산시			0		무관	무관			생산/제조
1308	가람	중소기업						0		무관	무관			생산/제조
1309	SK키파운드리	대기업			충북 청주시 흥덕구			0		무관	무관			생산/제조
1310	TeaAroma, Inc.	외국계기업	생산/제조					0		무관	무관			생산/제조
1311	Daesang America Inc (대상그룹 미국현지법인)	대기업			연구개발/설계, 생산/제조			0		무관	무관			생산/제조
1312	네패스아크	중견기업	생산/제조					0		무관	무관			생산/제조
1313	Ajin USA, Inc	중견기업	생산/제조					0		무관	무관			생산/제조
1314	크나우프석고보드	중견기업			충남 당진시			0		무관	무관			생산/제조
1315	휴온스메디텍	중소기업			경기 성남시 중원구	학사	전기 계열	2		무관	무관	학력 : 대졸 이상 (2,3년) 경력 : 신입/경력(2년 이내) 전공 : 전기/전자공학, 기계, 자동차 공학계열 운전면허증 소지자 의사소통능력, 긍정적인 마인드, 책임감 있는 사람, 문제해결능력, 지속적인 자기개발	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	생산/제조
1316	쿠팡로지스틱스서비스	대기업			인천 남동구, 경기 고양시 덕양구, 경기 김포시, 충북 진천군, 경기 광주시			0		무관	무관	학력/연령/성별 무관  엑셀 활용 가능자		생산/제조
1317	쎄믹스	중소기업			경기 광주시			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	생산/제조
1318	Deloitte 안진회계법인	외국계기업			서울 영등포구			0		무관	무관			IT/인터넷
1319	현대피엔에스	대기업		세종R&D센터	세종특별자치시	학사	전기 계열	5		무관	무관	경력 사항  대리 과장급 : 관련 직무 경력 5년 이상  사원급 : 관련 직무 경력 3년 이상  학위/전공 학사 이상 전기, 전자 관련 전공자 또는 관련 직무 수행 가능한 자는 전공 무관  성별/연령 (성별무관)  어학/자격증 : 무관	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1320	한국동서발전	공공기관/공기업			울산 중구, 충남 당진시, 강원특별자치도 동해시, 경기 고양시 일산동구, 대전 유성구			0		무관	무관			IT/인터넷
1321	카카오	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1322	대한지방행정공제회	비영리단체/협회/재단	경영/사무, IT/인터넷	일반				0		무관	무관			IT/인터넷
1323	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			IT/인터넷
1324	한국원자력협력재단	비영리단체/협회/재단	해외					0		무관	무관			IT/인터넷
1325	포스코DX	대기업		전기설계	경북 포항시 남구, 전남 광양시, 경기 성남시 분당구	학사		0	영어 성적 요구	필수	필수	4년제 대학 졸업(예정)자 영어 어학성적 보유자 회사가 지정한 일자에 인턴활동 및 입사가 가능한 자 '25. 6. 1 이전 병역필(예정) 또는 면제자로 해외여행에 결격사유가 없는 자 영어 말하기 성적은 '23. 5. 22 이후 취득 성적만 인정		IT/인터넷
1326	세정아이앤씨	중소기업		IT개발자	부산 금정구			3		무관	무관	대학 졸업자 및 2025년 졸업예정자  유관경력 3년 미만 (경력)	[전형 안내]\n서류전형 - 인적성검사 - 면접전형 - 최종합격	IT/인터넷
1327	PFCT	스타트업			서울 서초구			0		무관	무관			IT/인터넷
1328	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1329	네이버웹툰	대기업		글로벌 웹툰 Creative Video 제작	경기 성남시 분당구			0	영어 성적 요구	무관	무관	Adobe Premiere Pro, After Effects, Adobe CC, Figma 등 다양한 디자인 및 영상 편집 툴에 대한 높은 숙련도를 보유하신 분  영어/중국어/인니어/태국어 중 1개 언어를 구사하실 수 있는 분 (필수) *각 언어 별로 채용을 진행합니다.  웹툰 및 만화 콘텐츠에 대한 높은 애정과 이해도를 보유하신 분  웹툰/애니/게임 감성의 리터칭, 이펙트 스킬 및 일러스트레이션 등의 작화 스킬을 보유하신 분		IT/인터넷
1330	아이쓰리시스템	스타트업			대전 유성구			0		무관	무관			IT/인터넷
1331	LG CNS	대기업		SAP BC(Basis Consultant)	서울 강서구, 서울 강서구			0		무관	무관	SAP ERP 프로젝트(SI) 또는 운영 업무(SM)에서 5년 이상 BC 역할을 경험하신 분  SAP BTP(Business Technology Platform) 기반 업무를 경험하신 분		IT/인터넷
1332	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			IT/인터넷
1333	Tossplace	기타	미디어, 경영/사무, IT/인터넷					0		무관	무관			IT/인터넷
1334	포스코DX	대기업			경북 포항시 남구, 전남 광양시			0		무관	무관			IT/인터넷
1335	국립공원공단	공공기관/공기업		일반직(6급)_공원행정	경남 진주시, 전북특별자치도 전주시 덕진구, 충남 공주시, 강원특별자치도 원주시, 경북 영주시			0		무관	무관		[전형 안내]\n서류전형 - 필기전형 - 역량검사 - 면접전형 - 최종합격	IT/인터넷
1336	LG이노텍	대기업			서울 강서구			0		무관	무관			IT/인터넷
1337	네이버클라우드	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1338	네이버클라우드	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1339	한양대학교	기타		사무직-일반행정	서울 성동구, 경기 안산시 상록구			0		필수	필수	해외여행에 결격사유가 없는 자  병역필 또는 면제자  공무원 임용에 결격사유가 없는 자	[전형 안내]\n서류전형 - AI인적성검사 - 면접전형 - 최종합격	IT/인터넷
1340	파괴연구소	대기업		아트디렉터	서울 강남구			0		무관	무관			IT/인터넷
1341	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			IT/인터넷
1342	SM엔터테인먼트	대기업			서울 성동구			0		무관	무관			IT/인터넷
1343	스타쉽엔터테인먼트	대기업			서울 강남구	학사		0		무관	무관	학력 : 대졸 이상 경력 : 무관 영상 편집 기술 보유자(Adobe계열 프로그램 필수)  디자인 기획 능력 보유자  영상 촬영에 대한 기초 지식 보유 및 전반적인 영상 제작 업무 가능자  엔터테인먼트 및 문화 사업에 관심이 많은 분  책임과 애정을 갖고 업무를 수행하는 분		IT/인터넷
1344	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			IT/인터넷
1345	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			IT/인터넷
1346	케이씨텍	중견기업						0		무관	무관			IT/인터넷
1347	한국신용정보원	공공기관/공기업		일반	서울 중구	학사		0		무관	무관	학사 이상 (2025년 8월 졸업예정자 포함)	[전형 안내]\n서류 전형 - 필기전형 - 면접전형 - 최종합격	IT/인터넷
1348	케이씨텍	중견기업	생산/제조, IT/인터넷					0		무관	무관			IT/인터넷
1349	아디다스코리아	대기업			서울 서초구			0		무관	무관			IT/인터넷
1350	넥슨네트웍스	대기업		게임QA	경기 성남시 분당구			0		무관	무관	게임을 다양하고 깊게 즐기시는 분  게임 콘텐츠와 게임 플랫폼에 대한 이해도를 보유하신 분  긍정적, 적극적, 논리적으로 커뮤니케이션하시는 분  기획서나 구현된 결과물을 통해 프로세스 및 작동 순서를 이해하실 수 있는 분 게임 로그, 중요 결함 사례 및 히스토리를 학습하고 개선점을 생각할 수 있는 분  습득한 경험과 노하우를 기록하여 활용하고 공유할 수 있는 분	[전형 안내]\n서류전형 → 온라인 인성검사 → 실무진 면접 → 인턴 최종 합격 → 인턴십(6개월) → 전환평가	IT/인터넷
1351	Grand BK, Corp.	외국계기업	해외					0		무관	무관			IT/인터넷
1352	순수본	중견기업		온라인 몰 콘텐츠 웹디자이너	서울 영등포구			0		무관	무관	각종 업무 툴 활용에 능숙하신 분 (Figma, Photoshop, Illustrator) 손이 빠르고 다량의 콘텐츠를 효율적으로 작업할 수 있는 분 음식/식품군 제품의 콘텐츠 디자인에 익숙한 분 타 부서와 협업 및 피드백 커뮤니케이션 능력을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
1353	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1354	더그로스	중소기업		글로우엠 콘텐츠 마케터 인턴	서울 송파구			0		무관	무관	최신 마케팅 트렌드에 능통하신 분 트렌드 분석 및 예측 능력을 바탕으로 브랜드 가치를 상승시킬 수 있으신 분 소비자들의 즉각적, 실제적인 반응을 통해 최고 효율의 마케팅을 찾아가며 성장하고 싶으신 분	[전형 안내]\n서류 전형 > 1차 인터뷰 > 2차 인터뷰 > 처우협의 > 최종 합격	IT/인터넷
1355	PTKOREA	외국계기업		웹사이트 운영 프로젝트 영문 콘텐츠 검수 및 QA	서울 강남구	학사		0		무관	무관	학사 이상이신 분 (휴학생, 졸업예정자, 기졸업자)  MS Office 사용이 원활하신 분 (ppt, excel)  원활한 커뮤니케이션 역량을 보유하신 분	[전형 안내]\n서류전형 - 1차면접 - 최종합격\n\n서류 전형 - 인성검사 - 면접전형 - 최종합격	IT/인터넷
1356	한국토지주택공사	공공기관/공기업			서울 강남구, 인천 남동구, 대구 달서구, 대전 서구, 광주 서구			0		무관	무관			IT/인터넷
1357	현대자동차	대기업		제조 IT / 산업 자동화 데이터 엔지니어	서울 서초구	학사	전기 계열	0	영어 성적 요구	무관	무관	컴퓨터공학, 전기공학, 컴퓨터과학, 산업공학 또는 관련 분야에서 학사 이상의 학위를 보유하신 분  7년 이상의 Kepware, Cybus, HiveMQ, Litmus, Softing AG, Ignition, UNS, Sightmachine, AVEVA, Siemens, Rockwell, Beckhoff 등 산업 관련 OT/IT수집체계, 자동화SW 개발 또는 전개 관련 경력을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
1358	현대자동차	대기업		제조 DX 솔루션 / 시스템 아키텍트	서울 서초구	학사	전기 계열	0	영어 성적 요구	무관	무관	컴퓨터/전기/산업공학, 컴퓨터과학 등의 관련 분야에서 학사 이상의 학위를 보유하신 분  10년 이상의 제조 시스템/솔루션 아키텍처 및 IIOT 솔루션 구현(인프라 측면 및 데이터 파이프라인을 고려)에 대한 경력(기술 서비스/ 컨설팅 업체)을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
1359	현대자동차	대기업		MES 개발 및 합리화 전략 기획	서울 서초구	학사	컴퓨터 계열	0	영어 성적 요구	무관	무관	컴퓨터 과학, 정보 기술 또는 관련 분야에서 학사 이상의 학위를 보유하신 분  5년 이상의 MES(Siemens, Wonderware 등) 전개 및 활용 경력을 보유하신 분  IT시스템 프로젝트 및 벤더 관리 경험을 보유하신 분  MES의 핵심 구성 요소에 대한 이해와 소프트웨어 설계 제작 경험을 보유하신 분  비즈니스 영어 커뮤니케이션 및 영어 문서 작성 역량을 보유하신 분	[전형 안내]\n서류 전형 - 면접전형 - 최종합격	IT/인터넷
1360	PTKOREA	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
1361	한국항공우주연구원	기타			대전 유성구			0		무관	무관			IT/인터넷
1362	통계청	공공기관/공기업	IT/인터넷					0		무관	무관			IT/인터넷
1363	한국타이어앤테크놀로지	대기업		R&D_Virtual Simulation 툴 개발 및 응용	대전 유성구	석사	기계 계열	0		무관	무관	1. 기계 계열 전공자 2. 석사/박사 과정 중 고체역학과 수치해석 관련 업무 능력 보유자 (연속체 역학, 유한요소법 이수 등) 3 다양한 CAE Tool 활용 지식(FEM, CFD 등)  보유 및 사용 유경험자 (abaqus 등) 4. Computational mechanics 연구 경험 보유자 (토목 공학 전공 자 가능)	[전형 안내]\n서류전형 - HKAT - 면접전형 - 최종합격	IT/인터넷
1386	주식회사 놀유니버스	중견기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1387	한미그룹	대기업		[한미약품] Medical	서울 송파구			0		무관	무관			IT/인터넷
1415	LG CNS	대기업			서울 강서구			0		무관	무관			IT/인터넷
1364	(주)지로	중소기업		프로덕트 디자이너 인턴	서울 강남구			0		무관	무관	사용자 친화적인 UI/UX 디자인을 위한 시각적 감각을 보유하신 분 레이아웃, 폰트, 컬러 등 디자인 기본기가 탄탄하신 분 Figma 툴의 디자인 시스템을 포함한 다양한 기능을 능숙하게 활용할 수 있는 분 디자인 의도를 논리적으로 설명할 수 있는 커뮤니케이션 역량을 갖추신 분 새로운 기술과 지식을 학습하는 데 거부감이 없고, 빠르게 학습하실 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1365	트라닉스	대기업		재무	충남 서산시			0		무관	무관			IT/인터넷
1366	라이드플럭스	스타트업		Mapping SW Engineer	서울 영등포구, 제주특별자치도 제주시	석사		0		무관	무관	현재 재학 중인 학/석사 졸업생 및 졸업예정자는 비대상입니다.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1367	플리토	중소기업			서울 강남구			0		무관	무관	신입 및 경력 (학력 무관)  IT 서비스의 네트워크 및 보안 등의 기본 지식 보유하신 분  운전면허 보유 및 차량 운전 가능하신 분  국내 출장 및 외근 가능하신 분		IT/인터넷
1368	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			IT/인터넷
1369	셀트리온	대기업			인천 연수구			0		무관	무관			IT/인터넷
1370	한국투자증권	대기업			서울 영등포구			0		무관	무관			IT/인터넷
1371	바카티오	중소기업		Backend Engineer 인턴	서울 마포구			0		무관	무관	문제 해결을 위해 다방면으로 고민하는 분 필요에 따라 수용할 수 있는 열린 자세를 가지신 분 다른 직무와의 커뮤니케이션에 익숙한 분 LLM API 활용하여 서비스 개발한 경험이 있는 분 ElasticSearch 검색엔진을 이용한 RAG 를 도입한 경험이 있는 분 Docker 를 적극적으로 활용하여 인프라를 관리, 유지 보수한 경험이 있는 분 AI Tool (예. Cursor) 을 활용하여 생산성 높은 프로그래밍 경험이 있는 분 팀 단위 개발 생산성을 위해 기여한 경험이 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1372	슈퍼센트	중소기업		AI 기술 리서치	서울 송파구			0		무관	무관	AI 기술에 높은 관심을 가지고 있고, 적극적으로 배우려는 자세를 갖추신 분 새로운 기술을 빠르게 익히고 실무에 적용하는 데 흥미를 느끼시는 분 디지털 콘텐츠 플랫폼 및 SNS를 능숙하게 다루시는 분 정보를 명확하게 정리하고 전달하는 커뮤니케이션 역량을 갖추신 분 현재 졸업 또는 졸업 예정이며, 3개월 인턴십 이후 입사 가능하신 분	[전형 안내]\n서류 전형 → 과제전형 → 인터뷰 → 처우 협의 → 최종 합격	IT/인터넷
1373	한국공항공사	공공기관/공기업			서울 강서구			0		무관	무관			IT/인터넷
1374	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			IT/인터넷
1375	에고이즘	중소기업			서울 성동구			0		무관	무관			IT/인터넷
1376	플랜핏	중소기업	IT/인터넷					0		무관	무관	IT 서비스 PM & PO 관련된 업무에 관해 실제로 경험이 있는 분  사용자와 대화에 두려움이 없으며 사용자 관점에서 생각하며 사용자에게 관심이 많은 분  데이터를 통해 문제를 파악하고 데이터를 측정하여 해당 데이터에 기반한 논리적인 의사 결정을 내릴 수 있는 분  다양한 분야의 이해관계자(팀원 및 외부인)와 효율적인 커뮤니케이션이 가능한 분	[인재 영입 프로세스]\n- 서류 전형 -> 1차 직무 인터뷰 -> 2차 컬쳐핏 인터뷰 -> 최종 합격	IT/인터넷
1377	리얼드로우	중소기업		SW Engineer	서울 마포구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격\n\n*이메일 접수: people@realdraw.ai\n(이력서, 포트폴리오)	IT/인터넷
1378	주식회사 화이트큐브	스타트업		콘텐츠 디자이너 인턴	서울 강남구			0		무관	무관	그래픽 툴(Figma, Photoshop, Illustrator 등)을 활용한 디자인이 가능하신 분 비즈니스 성장을 위한 다양한 프로젝트 기획 및 디자인 가능하신 분 디자인 결과물의 성과 데이터를 함께 확인하고 개선하여 ’비즈니스 성과’를 달성하고 싶은 분 ex) 상품 소개서 개선을 통한 B2B 계약 전환율 상승, 광고 소재 효율 테스트 등	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1379	주식회사 화이트큐브	스타트업		백엔드 개발자 인턴	서울 강남구		컴퓨터 계열	0		무관	무관	Python 또는 Node.js, Go 등 하나 이상의 언어에 익숙하신 분  HTTP, HTML, JSON 등 웹 기본 구조에 대한 이해가 있으신 분  사용자 경험과 고객 가치를 최우선으로 하여 개발을 통해 비즈니스 성장에 기여하고 싶은 열망이 있는 분  진짜 ‘성공’을 만들고자 하는 열망이 강한 분.  이 업무를 왜 해야 하는지를 항상 고민하며, 해당 이유를 근거로 팀원들을 설득할 수 있는 분  컴퓨터공학 전공 혹은 이에 준하는 지식 및 활용 역량이 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1380	진에어	대기업			서울 강서구			0		무관	무관			IT/인터넷
1381	이앤에스글로벌	중견기업			서울 강남구			0		무관	무관			IT/인터넷
1382	CJ푸드빌	대기업		데이터 전략·분석 전문가	서울 중구	학사	컴퓨터 계열	3		무관	무관	4년제 학사 졸 이상  관련 학과 : 컴퓨터공학, 산업공학, 경영정보, 문헌정보 등  Data 분석 역량 및 관련 프로젝트 경력 3년 이상  다양한 Data 분석 Tool 활용 경험 (Python, SQL 등)  ‘Data’ 기반으로 객관적인 현상 인식과 '분석적 사고'를 통해 솔루션을 도출하는 역량  현장 업무에 대한 이해를 위한 현업과의 협업 역량  Data 분석을 위한 Data Engineer 등 관련 전문가들과의 협업 역량	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1383	CJ푸드빌	대기업		디지털서비스 APP 개발자	서울 중구	학사	컴퓨터 계열	0		무관	무관	4년제 대학 졸업자 이상  컴퓨터공학, 산업공학, 소프트웨어공학 등 관련학과  React Native 및 Flutter 개발 경험 (최소 5년 이상) 💻  App 설계부터 배포, 서비스 운영까지의 경험이 있으신 분  자기 주도적인 개발과 전체 프로세스를 고려한 설계와 구현이 가능 하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1384	삼성전자	대기업		[VD사업부] Product Partnership	경기 수원시 영통구			0		무관	무관			IT/인터넷
1385	코레일네트웍스	공공기관/공기업			서울 용산구, 서울 구로구, 인천 연수구, 경기 과천시, 부산 동래구			0		무관	무관			IT/인터넷
1388	국가정보원	공공기관/공기업		해외정보	서울 강남구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1389	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1390	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1391	NHN Cloud	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1392	Toss	중소기업	IT/인터넷, 마케팅/광고/홍보, 영업/고객상담, 서비스					0		무관	무관			IT/인터넷
1393	SNOW	대기업		남미 타겟 EPIK 콘텐츠 마케팅 체험형 인턴	경기 성남시 분당구			0		무관	무관			IT/인터넷
1394	근로복지공단	공공기관/공기업			울산 중구, 부산 금정구, 대구 중구, 인천 남동구, 강원특별자치도 원주시			0		무관	무관			IT/인터넷
1395	새만금개발공사	공공기관/공기업		토지공급	전북특별자치도 군산시			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1396	해태제과식품	중견기업			충남 아산시, 광주 북구, 경기 양주시, 서울 용산구			0		무관	무관			IT/인터넷
1397	펄어비스	중견기업		검은사막 PC 중국 운영 담당자	경기 과천시			0		무관	필수	원어민 수준의 중국어 사용이 가능하신 분 하나의 게임을 오랜 시간 플레이한 경험이 있거나, PC MMORPG에 대한 이해도가 있으신 분 실시간으로 변화하는 라이브 서비스 환경 흐름에 맞춰 협업하실 수 있는 분 유저를 최우선으로 생각하는 서비스 마인드와 책임감 있는 직업의식을 갖추신 분 원만한 커뮤니케이션 능력을 보유하신 분 업무에 대한 적극성을 갖고 새로운 배움에 주저함이 없으신 분 해외 출장 결격 사유 없으신 분	[전형 안내]\n서류전형 - 필기전형 - 면접전형 - 최종합격	IT/인터넷
1398	더존비즈온	중견기업			강원특별자치도 춘천시		컴퓨터 계열	0		무관	무관	HTML, CSS, JavaScript React, DOM 기본 이해도 보유자  컴퓨터공학 또는 소프트웨어 등 관련학과 전공자  관련 업무, 프로젝트 경험 보유자	[전형절차]\n- 서류전형 > 1차 실무자면접 > 2차 임원면접 > 경력/평판조회 > 처우협의/채용검진 > 최종합격	IT/인터넷
1399	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
1400	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
1401	CJ ENM	대기업			서울 마포구			0		무관	무관			IT/인터넷
1402	타라티피에스	중견기업		국내사업본부_수주 영업	서울 마포구, 경기 파주시			0		필수	필수	2025년 7월 입사 가능자  남성의 경우 병역필 또는 면제자  해외 출장에 결격사유 없는 자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1403	AXA손해보험	금융권		코어개발팀 자동차보험 시스템 개발자	서울 용산구	학사		0		무관	무관	정규 4년제 대학교 졸업자 또는 졸업 예정자		IT/인터넷
1404	세정아이앤씨	중소기업		IT인프라 운영	부산 금정구	학사	이공 계열	0		무관	무관	대졸 및 2025년 졸업예정자  이공계 전공  H/W 장비에 대한 깊은 관심도	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1405	일동제약	중견기업			서울 서초구, 경기 화성시, 경기 안성시			0		무관	무관			IT/인터넷
1406	디스트릭트코리아	중소기업		웹기획/운영	서울 강남구			0		무관	필수	미디어아트와 디지털 디자인에 관심이 있는 분  Figma 사용이 가능하신 분  포토샵, 애프터이펙트, 프리미어, 일러스트레이터 활용이 가능하신 분  HTML 및 DNS등의 웹사이트 개발 관련 지식과 활용이 가능하신 분  해외 출장에 결격사유가 없는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1407	SK C&C USA INC	대기업	해외					0		무관	무관			IT/인터넷
1408	라인플러스	대기업			경기 성남시 분당구	학사		2		무관	무관	2025년 8월 이내 학사 이상의 학위 취득 예정 또는 경력 2년 미만의 기졸업자		IT/인터넷
1409	교보문고	대기업			서울 마포구	학사		0		무관	무관	대졸학력 소지자  대내외 원활한 커뮤니케이션 능력 보유자  능동적이며, 적극적인 사고방식 소유자  웹/모바일 서비스에 대한 지식 보유  PostgreSQL 등 RDBMS 관련 지식 보유  JAVA 개발 능력, Spring Framework 및 CI/CD에 대한 지식 보유자  HTML, CSS, Javascript, JQuery 관련 지식 보유자 ● 전형절차 및 일정  서류전형→면접전형→건강검진→최종합격		IT/인터넷
1410	진학사	중소기업			서울 종로구			0		무관	무관			IT/인터넷
1411	토스인슈어런스	중소기업			서울 강남구			0		무관	무관	React, TypeScript 기반으로 안정적인 서비스를 개발할 수 있는 분을 찾고 있어요.  주어진 디자인 시안을 바탕으로 스스로 문제를 정의하고 빠르게 구현해낼 수 있는 분이면 좋아요.  단순히 주어진 개발을 해내는 것보다, 주도적으로 문제를 발견하고 분석해 솔루션을 제안할 수 있는 분이 필요해요.  레거시 코드를 최신의 개발 환경에 맞게 개선한 경험이나, 잘 모르던 기술 스택을 빠르게 학습해서 개발해나간 경험이 있으신 분이면 좋아요. [이력서 작성 추천]  그동안의 경험을 단순 나열하는 것이 아닌, 경험 속에서의 임팩트 및 러닝 포인트를 기술해주세요.  고객의 보이스를 기반으로 빠르게 제품의 완성도를 높여가기 때문에, 주어진 문제를 스스로 해결해보려고 시도하는지 보고 있어요.  복잡도가 높은 서비스나 까다로운 요구사항을 구현한 경험이 있으면 기술해주세요. 특히 복잡하거나 반복되는 문제를 단순한 형태로 추상화한 경험을 설명해주시면 좋아요.  기존 소스 코드를 새로운 코드 베이스로 점진적으로 이관한 경험이 있으면 기술해주세요.		IT/인터넷
1412	토즈코리아	외국계기업		E-Commerce Intern	서울 강남구			0		무관	무관			IT/인터넷
1413	포티투닷	중소기업			경기 성남시 수정구			0		무관	무관	오디오 신호 처리 및 전처리 알고리즘 설계 경험 (AGC, AEC, NR 등) 음성 인식 및 신호 분리 관련 경험 또는 이해 MATLAB, Python, C/C++ 등 신호 처리 및 알고리즘 구현 언어 숙련도 DSP 관련 개발 경험 및 디버깅 능력 양산 프로젝트에서 일정 관리 및 요구사항 분석 경험 팀 내 협업 및 외부 파트너와의 커뮤니케이션 능력 차량용 오디오 시스템 개발 경험 (또는 유사 도메인 경험) 다중 마이크 환경에서의 음향 기술 연구 또는 적용 경험		IT/인터넷
1414	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			IT/인터넷
1416	노르마	중소기업		QPU 설계	서울 성동구			0		무관	무관	3학년 이상 재학 중인 학생/대학원생  연관 분야 전공		IT/인터넷
1417	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			IT/인터넷
1418	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			IT/인터넷
1419	슈프리마	중소기업			경기 성남시 분당구	학사	전자 계열	0		무관	무관	컴퓨터 공학, 전자공학 또는 관련 분야의 학사 이상 학위를 보유하고 계시며, C/C++ 언어에 대한 깊은 이해와 실무 경험을 갖추신 분  라이브러리 개발 및 API 설계 능력: 동적 라이브러리(dll, so) 개발 경험과 함께, 표준 인터페이스 설계 및 API 문서화를 통해 모듈화된 소프트웨어 구현 경험이 있으신 분  학력 : 학사 이상		IT/인터넷
1420	지멘스	외국계기업			서울 종로구			0		무관	무관			IT/인터넷
1421	효림그룹	중견기업		XE_품질보증팀	서울 강남구, 대구 달서구, 경북 경산시, 경남 창원시 성산구, 경북 경산시			0		무관	무관			IT/인터넷
1422	바비톡	중소기업	IT/인터넷	콘텐츠 마케터 체험형 인턴				0		무관	무관	영상 편집 프로그램 사용 능숙자면 좋아요. Adobe 계열 Premiere Pro, After Effects 등 / 전문 영상 편집 프로그램이 아닌 캡컷 등 영상 제작 어플리케이션 서비스 활용한 영상 제작 스킬도 가능해요. 이미지 제작 능숙자여야해요. 포토샵 및 그 외 프로그램 활용해요. 오프라인 촬영이 가능해야해요. 촬영용품 대여, 촬영 진행 서포트 등 필요해요.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1423	(사)이에스지노동사회협회	비영리단체/협회/재단	IT/인터넷					0		무관	무관			IT/인터넷
1424	스카이랩스	스타트업		HW 개발	경기 성남시 분당구		전기 계열	0		무관	무관	대학 재학 또는 졸업자, 공학계열(전기/전자/컴퓨터/소프트웨어) 신입 가능	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1425	카카오페이	대기업	경영/사무, IT/인터넷	카카오페이 보험 운영				0		무관	무관	엑셀을 능숙하게 사용하시는 분을 원해요. SQL을 활용한 데이터 추출 및 가공을 할 수 있는 분을 원해요. 성실하고 꼼꼼한 분을 원해요.	[전형 안내]\n서류 접수 > 면접전형 > 최종 합격	IT/인터넷
1426	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
1427	JYP엔터테인먼트	중소기업		CTO Staff	서울 강동구		컴퓨터 계열	0		무관	무관	컴퓨터 공학 계열 또는 관련 분야 전공자, 혹은 이에 준하는 경력 보유  최신 기술을 활용해 비즈니스 문제를 해결한 경험  전략적 사고력과 논리적인 문제 해결 능력, 데이터 기반 의사결정 역량 보유  팀 중심 환경에서 효과적으로 협업할 수 있는 커뮤니케이션 능력	[전형 안내]\n서류 접수 > 면접전형 > 최종 합격	IT/인터넷
1428	비바리퍼블리카	스타트업	IT/인터넷	Data Assistant (SQL, Tableau)				0		무관	무관	실무 sql을 활용해보신분이 필요해요. 복잡한 추출 요청도 고급 sql 능력을 통해 빠르게 추출해 내실 수 있는 분이 필요해요. 꼼꼼하게 데이터 정합성을 확인 하실 수 있는 분이 필요해요. Tableau를 능숙하게 활용하실 수 있는 분이 필요해요 다른 직군의 팀원들과 원활하게 소통할 수 있는 능력이 필요해요.	[전형 안내]\n서류 접수 > 사전 과제 > 직무 인터뷰 > 최종 합격	IT/인터넷
1429	한국도로교통공단	공공기관/공기업		정보보호	서울 서초구, 강원특별자치도 강릉시, 제주특별자치도 제주시, 울산 남구, 전북특별자치도 전주시 완산구			0		무관	무관		[전형 안내]\n서류전형 > 필기전형 > 면접전형 > 최종합격	IT/인터넷
1430	펄어비스	중견기업		게임플레이	경기 과천시			0		무관	무관	졸업자, 졸업예정자		IT/인터넷
1431	대구경북첨단의료산업진흥재단	비영리단체/협회/재단		가.연구직[직속 및 전략기획본부]	대구 동구			0		무관	무관		[전형 안내]\n서류전형 - 필기시험 - 면접전형 - 최종합격	IT/인터넷
1432	(주)힐링페이퍼	스타트업			서울 강남구			0		무관	무관			IT/인터넷
1433	IBK기업은행	금융권			서울 중구			0		무관	무관			IT/인터넷
1434	쿠팡	중소기업			서울 송파구			0		무관	무관	커뮤니케이션 능력		IT/인터넷
1435	토스페이먼츠	스타트업		Product Designer [Tools]	서울 강남구			0		무관	무관	사용자가 원하는 제품이 될 때까지 VOC 수집, UX 설계, UI 디자인, Prototype을 통해 개선할 수 있는 역량이 필요해요. 내가 원하는 것이 아닌 사용자의 정성 혹은 정량적인 근거로 문제를 정의한 경험이 필요해요. 우선순위를 고려하여 목표를 설계하고 그 달성 여부를 정성 혹은 정량적으로 끝까지 분석하고 고민한 경험이 필요해요. Web UI에 대한 이해도가 있는 분이 필요해요. 사용자의 비효율적인 업무 원인을 주도적으로 파악하고 효율적으로 개선하여, 업무 리소스를 단축시킨 경험이 있으면 좋아요. 궁극의 고객 경험을 달성하기 위해 논리적인 커뮤니케이션으로 구성원을 설득하고 협업한 경험이 있으면 좋아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
1436	한국세라믹기술원	비영리단체/협회/재단		반도체 소재센터	경영/사무, 연구개발/설계, IT/인터넷			0		무관	무관	∘ 연령이 만 34세 이하인 자 ∘ 기술원 「인사 규정」 제7조(결격사유)에 해당하지 않는 자		IT/인터넷
1437	토스뱅크	중소기업			서울 강남구			0		무관	무관	Hadoop Ecosystem 환경 기반의 Python, Pyspark 프로그래밍에 능숙하신 분이 필요해요.  Spark 같은 분산처리 엔지니어링을 활용해 대용량 데이터 처리를 해보신 분이 필요해요.  Data Mesh/Medallion Architecture를 이해하고 데이터 모델링을 해오신 분이 필요해요.  분산 처리 기반 query engine의 동작 원리를 이해하고 튜닝이 가능하신 분이 필요해요.  ETL 프로세스와 airflow orchestration 최적화를 통해 배치작업의 효율화를 경험해보신 분이 필요해요.  단순요청을 처리하는 것이 아닌 명확한 데이터 구조와 효율적인 데이터 활용 관점에서 기준을 제시할 수 있어야 해요.  다양한 이해관계자와 소통하여 데이터 요구사항을 구체화하고 정리하는 역량이 있어야 해요. [합류 여정]  서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사		IT/인터넷
1438	LG전자	대기업		HS사업본부	서울 영등포구, 경남 창원시 성산구, 경기 평택시			0		무관	무관			IT/인터넷
1439	에고이즘	중소기업		AI Creative Specialist	서울 성동구			0		무관	무관	생성형 AI 도구(Midjourney, DALL E, Runway, GPT 등) 사용 경험 각, 분석, 자동화 등 한 가지 이상 업무에서 AI를 활용한 시도 경험 툴을 빠르게 익히고, 업무에 바로 적용할 수 있는 실행력 높으신 분 집협업 디자이너와 유연한 커뮤니케이션 능력 어떤 역할이든 ‘브랜드를 돋보이게 하는 것’에 관심이 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1440	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			IT/인터넷
1441	주식회사 인터엑스	스타트업			울산 중구			0		무관	무관			IT/인터넷
1442	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
1443	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			IT/인터넷
1444	SK ON	대기업			대전 유성구			0		무관	무관			IT/인터넷
1445	한국하니웰	중견기업			서울 마포구			0		무관	무관			IT/인터넷
1446	스타쉽엔터테인먼트	대기업			서울 강남구			0		무관	무관			IT/인터넷
1447	앳홈	중소기업	경영/사무, 마케팅/광고/홍보, IT/인터넷	인플루언서 커머스 AMD				0		무관	무관	유튜브, 인스타그램 등 콘텐츠 플랫폼을 자주 보고, 트렌드에 관심 많은 분 인플루언서, 뷰티, 라이브 커머스에 흥미 있는 분 오퍼레이션 업무를 체계적이고 꼼꼼하게 챙길 수 있는 분 엑셀, 구글스프레드시트 등 기본 툴을 다룰 수 있는 분 일을 맡았을 때 끝까지 책임감 있게 마무리할 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1448	현대오토에버	대기업		-디지털 경험-	서울 강남구, 울산 북구, 경기 화성시, 충남 아산시, 경기 의왕시	학사		0		필수	무관	최종학력 4년제 대졸 이상 남성의 경우 군필 또는 면제자 해외여행 결격사유가 없는 자 당사 채용결격사유에 해당되지 않는 자	[전형 안내]\nACT - 과제테스트/코딩테스트 - 1차 면접전형 - 2차 면접전형 - 채용검진 - 최종합격	IT/인터넷
1449	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			IT/인터넷
1450	문피아	대기업			서울 강남구			0		무관	무관	웹소설 작품의 셀링 포인트를 찾을 수 있는 분  웹소설과 콘텐츠 전반에 대한 이해도가 높은 분  작가 관리에 필요한 커뮤니케이션 스킬을 갖춘 분		IT/인터넷
1451	퍼즐원스튜디오	중소기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1452	NIT서비스	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1453	카카오모빌리티	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1454	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
1455	쓰리빌리언	중소기업		AI Engineer	서울 강남구	학사		0		무관	무관	Bioinformatics, Cheminformatics, AI engineering, Computer Science 등 관련 학과  학사 학위 이상인 분  인공지능 프레임워크 (TF, torch 등) 를 이해하고 직접 구성한 네트워크를 학습시킨 경험 보유자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1456	유진테크	중견기업		SW개발 신입사원	경기 이천시, 경기 용인시 처인구	학사	전자 계열	0		무관	무관	1) 학사 이상 2) 전공  : 전자/컴퓨터 공학계열 3) C언어 필수, 중급이상 4) C++ or C# 개발 경험자(OOP 개념 이해) 반도체 장비 제어 SW 개발 경험자	[전형 안내]\n서류전형 - 인성검사 - 면접전형 - 최종합격	IT/인터넷
1457	(주)네오위즈	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1458	AB180	중소기업		Platform Manager	서울 서초구			0	영어 성적 요구	무관	무관	고객의 요청을 빠르게 파악하고, 명확하고 일관된 커뮤니케이션으로 문제를 설명하고 해결할 수 있으신 분 솔루션 기능과 고객 사용 흐름을 이해하고, 문제의 원인을 논리적으로 분석해 해결책을 도출할 수 있으신 분 반복되는 이슈를 구조화하고, 문서화하거나 개선 제안한 경험이 있으신 분 영어 기술 문서를 읽고 이해하는 데에 어려움이 없으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종 합격	IT/인터넷
1459	와디즈	스타트업		비즈니스	경기 성남시 분당구			0	영어 성적 요구	무관	무관	비즈니스 영어 가능자		IT/인터넷
1460	태양연마	중견기업			무역/유통, 영업/고객상담, 경영/사무, 생산/제조, 연구개발/설계, IT/인터넷			0		무관	무관			IT/인터넷
1461	아마존웹서비시즈코리아	외국계기업		Associate Solutions Architect Internship	서울 강남구	학사	공학 계열	0		무관	무관	IT, 공학, 수학과 관련 4년제 대학 25/26년 졸업 예정이신 분 클라우드 기반 솔루션의 고객 서비스에 관심이 있고 적성에 맞는 분		IT/인터넷
1462	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1463	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
1464	네오플	대기업			서울 강남구			0		무관	무관	게임 UI/UX 와 개발 프로세스 대한 기본적인 이해와 지식을 갖추신 분  기본적인 디자인툴(photoshop,Illustrator 등)사용에 어려움이 없으신 분  다양한 스타일의 UI 디자인 컨셉을 제시하실 수 있는분  타이포 그래피 및 폰트 디자인에 관심이 많으신 분  주어진 컨셉을 문양,패턴,아이콘 등의 시각요소로 표현 하실수 있는 분 [채용 여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
1465	네오플	대기업			서울 강남구			0		무관	무관	2D 이펙트 경험이 풍부하고 드로잉 감각이 뛰어나며, 다양한 툴을 능숙하게 다루실 수 있는 분  게임의 스킬, 모션, 이펙트에 대한 센스가 풍부하신 분  타 부서와 협업 및 커뮤니케이션이 원활하신 분 [채용여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
1466	캐롯손해보험	대기업			서울 중구			0		무관	무관			IT/인터넷
1467	캐롯손해보험	대기업			서울 중구			0		무관	무관			IT/인터넷
1493	넷마블	대기업			서울 구로구			0		무관	무관			IT/인터넷
1494	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
1495	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
1468	토스뱅크	스타트업		Security Researcher	서울 강남구			0		무관	무관	기본적인 IT 및 보안 인프라 환경에 대한 이해가 있는 분이 필요해요. 자체 취약점 진단 도구의 개발 및 유지를 위해 개발 역량이 필요해요. 취약점 진단 스크립트를 이해하고 진단 및 결과를 해석하는 역량이 필요해요. Django, Flask, Python, Powershell, Shell 등 개발 경험이 필요해요. MSA 아키텍처를 이해하고 RestAPI 취약점 진단을 할 수 있는 역량이 필요해요. 다양한 팀과 원활한 협업을 위해 탁월한 커뮤니케이션 능력 보유하신 분이 필요해요. MITRE ATT&CK Framework를 이해하고 AD/xNix 환경에서 침투테스트를 수행할 수 있는 역량이 있는 분이면 더 좋아요. Native Cloud(Kubernetes, AWS 등)환경에 대한 이해가 있는 분이면 더 좋아요. 보안관련 자격증(CISSP, 보안기사, OSCP, CREST 등)을 보유하고 계시면 더 좋아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
1469	토스뱅크	스타트업		Site Reliability Engineer	서울 강남구			0		무관	무관	Java/Kotlin, Spring Framework 관련 개발 경험과 문제해결 능력이 있는 분이면 좋아요. 성능 테스트를 통해 시스템의 가용성을 확인하고, 병목지점을 해결할 수 있는 분이면 좋아요. 리눅스 및 네트워크 시스템에 대한 깊은 이해가 있는 분을 찾아요. MSA, Kubernetes, Istio, Redis, Kafka, ELK 기반의 인프라 운영 경험이 있는 분이면 좋아요. Mission Critical 한 서비스 운영 환경을 즐기며 높은 책임감으로 탄탄한 서비스를 같이 만들어 갈 수 있는 분을 찾아요. 변화를 두려워하지 않고 새로운 기술에 빠르게 적응하며 지속적인 성장을 원하는 분을 찾아요.	[전형 안내]\n서류접수 > 직무 인터뷰 > 문화적합성 인터뷰 > 레퍼런스 체크 > 처우협의 > 최종합격 및 입사	IT/인터넷
1470	토스페이먼츠	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1471	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
1472	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1473	퍼솔켈리코리아	중소기업		영업	서울 중구	학사		0	영어 성적 요구	무관	무관	국내 4년제 대학 재학생(3 4학년) 또는 졸업 1년 이내  일본어 또는 영어 중급 이상 가능자		IT/인터넷
1474	(주)네오위즈	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1475	하이퍼리즘	중소기업		블록체인 인프라 엔지니어	서울 관악구			0		무관	무관	프로덕션 레벨의 백엔드 프로그래밍이 가능하신 분 하나 이상의 프로그래밍 언어에 정통하신 분 AWS, 네트워크, 리눅스, 키 관리, 데브옵스 등 안전한 인프라 관리를 위한 다양한 지식과 폭넓은 경험이 있으신 분 숙련된 인터페이스 설계, 꼼꼼한 구현, 체계적인 테스트를 통해 고가치 자산을 담아낼 시스템을 프로덕션 레벨까지 구현할 수 있는 분 병렬적이고 기민한 공개 커뮤니케이션 능력을 갖추신 분 (DM 금지, 직원당 월 평균 Slack 메시지 약 2,000개) 영혼 없는 수동적 일처리를 극도로 경계하며, 비판적인 시각으로 본질적인 문제를 개선하시는 분 보안에 민감하고, 특히 Web3 생태계의 trustless한 키 관리에 대한 감각이 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 과제전형 - 최종합격	IT/인터넷
1476	메타보라	대기업			경기 성남시 수정구			0		무관	무관	책임감이 강하고 성실하신 분  원활한 커뮤니케이션 및 협업 능력을 갖추고 계신 분  주어진 일을 끝까지 책임지고 완수해본 경험이 있으신 분 [진행 안내] 서류전형   면접전형   최종합격		IT/인터넷
1477	코그	중견기업		채용 전환형 상시 인턴 (UI)	대구 중구			0		무관	무관			IT/인터넷
1478	사단법인 디엠시코넷	비영리단체/협회/재단			서울 마포구			0		무관	무관			IT/인터넷
1479	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
1480	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
1481	채널코퍼레이션	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
1482	백패커	중소기업			서울 서초구			0		무관	무관	텀블벅에 대한 이해와 창작 생태계에 대한 깊은 관심을 보유하신 분  새로운 시도를 두려워하지 않고, 기회를 잡기 위한 행동력을 보유하신 분  창작자와의 소통/컨설팅을 위한 원활한 커뮤니케이션 역량을 보유하신 분  여러 온라인/웹 콘텐츠에 관심을 갖고 소비하시는 분		IT/인터넷
1483	비트망고	중견기업		Back-end Programmer	경기 성남시 분당구			0		무관	무관	RDB, NoSQL, SQL에 대한 깊은 이해 네트워크, 시스템 및 인프라에 대한 높은 이해도 Bash Script 기본 이해 기술 스택 및 언어 패러다임에 맞는 개념 도입 및 설계 능력 가독성 높은 구조적 코드 작성 및 에러 핸들링 능력 개발 및 비개발 직군과의 원활한 커뮤니케이션 능력	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1484	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 인턴 - 전환면접 - 최종합격	IT/인터넷
1485	슈어소프트테크	중소기업			대전 유성구		전자 계열	0		무관	무관	C, C++언어 가능자(코드 해석 가능자)  전자, 컴퓨터공학 관련 교육 이수자	[전형 안내]\n서류전형 - 면접전형 - 인턴 - 전환면접 - 최종합격	IT/인터넷
1486	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			IT/인터넷
1487	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1488	쿠팡	대기업	IT/인터넷					0		무관	무관			IT/인터넷
1489	신한DS	중견기업			서울 중구			0		무관	무관		[전형절차]\n- 서류전형 > 실무진면접 > 역량검사 > 경영진 면접 > 처우협의 및 채용검진 > 입사	IT/인터넷
1490	베이글코드	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1491	한국아이비엠	외국계기업		제품 보안 진단 및 OT 보안 수준 진단 및 프로세스 수립 지원	서울 영등포구			0	영어 성적 요구	무관	무관	Bachelor's Degree  최신 기술에 대한 관심과 열정을 바탕으로 문제 해결 능력을 보유하신 분  사이버보안, 정보보안, 정보보호 유관 전공자 또는 정보보호 관련 과목 이수 또는 자격증을 보유하신 분  공인 영어 시험 성적 보유자 (점수 제한 없음)	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1492	마야크루	스타트업			서울 마포구			0		무관	무관			IT/인터넷
1497	LSP USA, LLC	기타	생산/제조, IT/인터넷					0		무관	무관			IT/인터넷
1498	주식회사 노타	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1499	카카오페이	금융권	IT/인터넷					0		무관	무관			IT/인터넷
1500	주식회사 코드잇	스타트업			서울 중구			0		무관	무관			IT/인터넷
1501	RXC	스타트업			서울 강남구			0		무관	무관			IT/인터넷
1502	야놀자	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1503	KSM	중견기업			서울 영등포구			0		무관	무관			IT/인터넷
1504	(주)엠디에스인텔리전스	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1505	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
1506	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1507	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1508	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1509	LG전자	대기업		HS사업본부	서울 영등포구			0		무관	무관			IT/인터넷
1510	라이드플럭스	중소기업			서울 영등포구			0		무관	무관			IT/인터넷
1511	이빗	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
1512	커넥트웨이브	중견기업			서울 금천구			0		무관	무관	경력: 신입  Linux OS 운영에 관심이 많으신 분  커넥트웨이브 서버 대부분이  Linux 기반 OS를 이용하여 구축되어 있습니다.  원활한 커뮤니케이션 스킬을 보유하신 분  타 팀과의 소통을 바탕으로 업무를 진행하는 케이스가 많은 편입니다.  자기 개발에 열심이신 분  신기술 도입을 적극적으로 검토하며 테스트합니다. [채용 절차]  서류전형   인적성 검사 & 1차 면접   2차 면접   처우협의   채용검진   최종합격		IT/인터넷
1513	카카오페이	대기업	IT/인터넷					0		무관	무관			IT/인터넷
1514	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1515	하이컨시	중견기업		• 사이트 운영 관련 업무	서울 강남구	학사		0		무관	무관	학력 : 대졸 이상		IT/인터넷
1516	콘티넨탈오토모티브코리아	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1517	콘티넨탈오토모티브코리아	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1518	보그워너	외국계기업			경기 화성시			0		무관	무관			IT/인터넷
1519	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1520	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1521	에듀클라우드	중소기업			서울 금천구			0		무관	무관			IT/인터넷
1522	아티스트앤스튜디오	중소기업			서울 마포구			0		무관	무관			IT/인터넷
1523	주식회사 사각	스타트업			서울 마포구			0		무관	무관			IT/인터넷
1524	메리츠증권	대기업			서울 영등포구			0		무관	무관			IT/인터넷
1525	카카오페이	대기업	IT/인터넷	카카오페이 MyData 서비스의 안정성, 신뢰성, 가용성을 지속적으로 개선시켜나가요.				0		무관	무관	Java/Kotlin, Spring Framework 관련 개발 경험 혹은 지식과 문제해결 능력이 있는 분을 찾고 있어요. React, Typescript 관련 개발 경험 혹은 지식을 가지고 활용 가능한 분을 찾고 있어요. Observability (메트릭/로그/트레이싱)에 대한 지식과 경험이 있는 분을 찾고 있어요. 주도적으로 문제를 정의하고 대안을 제시할 수 있는 분을 찾고 있어요. 개발 관련 학과 또는 동일한 자격이 있는 분을 찾고 있어요.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1526	게임듀오	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1527	게임듀오	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1528	Spigen Inc	중견기업			미디어, 디자인, 교육, 무역/유통, IT/인터넷, 서비스, 연구개발/설계, 마케팅/광고/홍보, 경영/사무, 영업/고객상담			0		무관	무관			IT/인터넷
1529	커넥트웨이브	중견기업		클라우드 시스템 운영	서울 금천구			3		무관	무관	신입 ~ 경력 3년 이내이신 분 Linux/Unix 서버에 대한 기본적인 이해가 있으신 분 SQL 쿼리 작성 및 데이터베이스 기초 지식을 보유하신 분 JAVA, PHP, Python,Bash 등 한 가지 이상의 개발 언어 사용이 가능하신 분 웹서비스에 대한 이해가 있으신 분 새로운 기술 학습에 대한 열정과, 의지가 있으신 분 문제 해결 및 팀 협업 능력을 보유하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1530	Riiid	중소기업		투자 학습 콘텐츠 에디터	서울 강남구			0		무관	무관	글쓰기에 관심이 많고, 복잡한 정보를 간결하게 문장으로 작성할 수 있는 능력이 있으신 분 다양한 자료 조사를 하고, 엑셀 등 도구를 활용해 데이터를 정리한 경험이 있으신 분 꼼꼼한 콘텐츠 검수 과정을 통해 콘텐츠의 완성도를 높일 수 있는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1531	슈어소프트테크	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1532	게임듀오	중소기업		영상 크리에이터	경기 성남시 수정구			0		무관	무관	영상 제작 툴(After Effect, Premier 등)의 활용 능력이 높으신 분 게임 영상 제작 관련 경험이 있으신 분 한정된 리소스 내에서 창의적인 영상 기획 경험이 있으신 분 본인의 개성과 장점을 살린 포트폴리오 보유하신 분	[전형 안내]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1533	(주)커넥트웨이브	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1534	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1535	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1536	한국타이어앤테크놀로지	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1537	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1538	한글과컴퓨터	중견기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1539	팅크웨어	대기업		아이나비 HW QA(품질 신뢰성 시험)	경기 성남시 분당구	학사	전기 계열	0		무관	필수	4년제 대졸 이상인 분  신입 또는 5년 이내의 유관 경력을 보유한 분 1) 신입: 전자/전기/산업 공학을 전공한 분 2) 경력: 단말/부품 신뢰성 시험 및 HW 설계 품질 보증 업무 경력을 보유한 분  운전이 가능한 분  해외 출장에 결격 사유가 없는 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격 및 입사	IT/인터넷
1540	주식회사 링키지랩	대기업			서울 성동구, 경기 성남시 분당구			0		무관	무관			IT/인터넷
1541	티맥스소프트	중견기업		연구본부 IF-QA팀 '팀원	경기 성남시 분당구	학사		0		무관	무관	4년제 대졸(학사) 이상 C/JAVA 기반 언어 가능자 원활한 커뮤니케이션 및 적극적 업무추진 역량 보유자	[전형 안내]\n서류전형 - 개발직군 코딩TEST - 면접(1차/2차/3차) - 인성/직무적성 검사 - 합격자 발표	IT/인터넷
1542	티맥스소프트	중견기업		WAS 개발 (JEUS, WebtoB 관리 제품 Front 개발)	경기 성남시 분당구	학사		0		무관	무관	4년제 대졸(학사) 이상 HTML/CSS, JavaScript, React 라이브러리 사용 경험 REST API 연동 및 백엔드 통신 사용 경험 Git, Jenkins 등 협업 및 개발 환경 사용 경험	[전형 안내]\n서류전형 - 개발직군 코딩TEST - 면접(1차/2차/3차) - 인성/직무적성 검사 - 합격자 발표	IT/인터넷
1543	포항공과대학교	기타		일반행정	경북 포항시 남구			0		무관	무관			IT/인터넷
1544	피에프씨테크놀로지스	중소기업			서울 서초구			0		무관	무관			IT/인터넷
1545	피에프씨테크놀로지스	스타트업			서울 강남구			0		무관	무관			IT/인터넷
1546	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
1547	RHEE BROS INC.	중견기업	해외					0		무관	무관			IT/인터넷
1548	PTKOREA	외국계기업		대기업 글로벌 APP CMS QA 자동화 Tool 개발	서울 강남구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1549	현대자동차	대기업		AI/Data	서울 서초구			0		무관	무관	Ph.D. candidates/graduates in STEM from global universities (including post docs) Applicants must be able to join the company by August 2026	[전형 안내]\n서류전형 - 면접전형 - 현대 기술 세미나 - 최종합격	IT/인터넷
1550	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1551	젠지이스포츠글로벌아카데미	중소기업			서울 강남구			0		무관	무관	유저 중심 사고를 기반으로 서비스 개선 아이디어를 도출할 수 있는 분  논리적 사고 및 문제 해결 능력이 뛰어나신 분  디자이너 및 개발자와 원활한 커뮤니케이션이 가능하신 분 채용절차  1차 면접(실무진 면접)  > 2차 면접(HR 면접)  > 제출 서류 검토 및 결격 사유 확인  > 처우 협의  > 최종합격  필요 시, 3차 전형을 진행할 수 있습니다.		IT/인터넷
1552	STRADVISION	스타트업			서울 서초구			0		무관	무관			IT/인터넷
1553	써모피셔사이언티픽코리아	외국계기업		Field Service Engineer II	대전 대덕구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1554	레진엔터테인먼트	중견기업			서울 성동구			0		무관	무관			IT/인터넷
1555	라인플러스	대기업			경기 성남시 분당구			0	영어 성적 요구	무관	무관	이런 경험과 스킬을 가진 분을 찾습니다:  Computer Science 혹은 관련 분야 전공자 또는 이에 준하는 실무 경험이 있으신 분  Linux 또는 Unix 환경에서의 개발 및 시스템 운영에 익숙하신 분  Concurrency가 높은 시스템 및 분산 아키텍처에서 문제를 해결할 수 있으신 분  Apache HBase, Redis 등 분산 스토리지 미들웨어에 대해 관심이 높으신 분  영어 읽기와 쓰기로 의사소통이 가능하신 분 전형안내  서류 전형 > 온라인 코딩 테스트 >  1차 면접 (CS Interview) > 2차 면접 (Whiteboard Interview) > 최종 면접 > 레퍼런스 체크 및 처우 협의 > 최종 합격 > 입사		IT/인터넷
1556	컴투스	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1557	에고이즘	중소기업			서울 성동구			0		무관	무관			IT/인터넷
1558	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
1559	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
1560	네오위즈	중견기업			경기 성남시 분당구			1		무관	무관	리깅 경력 1년 이상 또는 이에 준하는 실력이나 경험을 갖춘 분  Maya 캐릭터 및 크리쳐 리깅 경험이 있으신 분  Maya 리깅 설계 및 리깅 관련 기능에 대한 높은 이해도가 있으신 분		IT/인터넷
1561	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
1562	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1563	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			IT/인터넷
1564	에스에이피코리아	외국계기업	IT/인터넷, 영업/고객상담, 전문/특수직					0		무관	무관			IT/인터넷
1565	우아한형제들	중견기업			서울 송파구			0		무관	무관			IT/인터넷
1566	네오플	대기업			서울 강남구			0		무관	무관	새로운 업무 방식과 체계에 적응할 의지가 있으신 분  던전 앤 파이터의 IP/메타에 대한 이해 및 열정이 있으신 분  던전 앤 파이터의 전투 액션 구조에 대해 이해하고 계신 분 [채용여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
1567	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
1568	뱅크샐러드	중소기업		QA Engineer	서울 마포구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 합격자 발표	IT/인터넷
1569	네오플	대기업			제주특별자치도 제주시			0		무관	무관	끝을 경험한 유저를 찾습니다.  본인만의 게임 철학을 가진 동료를 찾습니다  (경력) 노련한 전략가를 찾습니다.  프로젝트 오버킬은 좋은 밸런스라는 평가보다 좋은 게임이라는 평가를 반길 수 있는 여러분을 찾고 있습니다. [채용 절차]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
1570	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
1632	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1571	DK테크인	대기업			경기 성남시 분당구			2		무관	무관	클라우드 인프라 구축 및 운영 경력 2년 이상 필수 네트워크 관련 5년 미만의 경력 멀티 VPC 및 DX 구성, TGW 연동 경험이 있으신 분 클라우드 방화벽 및 WAF 등 보안장비 구축 경험이 있으신 분 하이브리드 클라우드(with On premise) 구축 경험이 있으신 분 하이브리드/멀티 클라우드 네트워크 설계에 관심이 있으신 분 AWS/GCP/Azure/NHN 사용 경험이나 클라우드 서비스에 대한 관심이 있으신 분 다양한 분야의 업무를 적극적으로 즐겁게 하실 수 있는분 혼자 일하는 것보다 협업을 더 좋아하시는 분		IT/인터넷
1572	DK테크인	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1573	펄어비스	중소기업			경기 과천시			0		무관	무관			IT/인터넷
1574	메가존클라우드	중견기업			경기 과천시			0		무관	무관			IT/인터넷
1575	넷마블엔투	대기업			서울 구로구			0		무관	무관		[전형절차]\n- 서류심사 > 1차 실무면접 > 2차 임원면접 > 합격자발표	IT/인터넷
1576	주식회사 딥블루닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1577	주식회사 딥블루닷	중소기업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1578	번개장터 주식회사	스타트업			서울 서초구			0		무관	무관			IT/인터넷
1579	티맥스소프트	중견기업			경기 성남시 분당구	학사		0		무관	무관	4년제 대졸 이상		IT/인터넷
1580	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1581	아마존웹서비시즈코리아	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1582	카카오	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1583	키노라이츠	스타트업			서울 강남구			0		무관	무관			IT/인터넷
1584	마상소프트	중소기업			부산 해운대구			0		무관	무관	이펙트 관련 툴을 능숙하게 사용하시는 분  컨셉의 의도와 방향성에 맞는 이펙트 연출, 색감, 타이밍 감각이 뛰어나신 분  팀워크를 중시하며 원활한 커뮤니케이션을 하시는 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
1585	마상소프트	중소기업			부산 해운대구			0		무관	무관	포즈와 타이밍을 잘 표현 하시는 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
1586	마상소프트	중소기업			부산 해운대구			0		무관	무관	게임 개발에 열정을 가지신 분  실사, 반실사, 캐주얼풍의 배경 에셋 제작이 가능 하신 분  3DMax를 이용한 low, middle 폴리곤 모델링에 능숙하신 분  새로운 시도에 대한 거부감이 없고 팀플레이에 익숙하신 분 ❖ 채용 절차  서류 전형 → 실무진 면접 → 인성 면접 → 임원 면접 → 최종 합격		IT/인터넷
1587	마상소프트	중소기업			부산 해운대구			0		무관	무관			IT/인터넷
1588	마상소프트	중소기업			부산 해운대구			0		무관	무관	콘텐츠, 시스템, 이벤트를 비롯하여 유저에게 즐거운 경험을 제공할 수 있는 능력을 가진 분을 찾아요!  원활한 커뮤니케이션이 가능하신 분  논리적인 사고를 갖추신 분  다양한 게임의 플레이 경험과 지식이 있으신 분  기획 의도를 문서화하여 전달 가능하신 분  즐겁게 할 수 있는 게임을 만들고자 하는 열정이 있는 분  해외 여행에 결격사유가 없으신 분 ❖ 주요 업무  현재 서비스 되고 있는 게임의 재미와 확장성, 안정성 등을 고려한 기획을 고민하고 개발해요!  서비스 중인 게임의 콘텐츠, 시스템, 밸런스, 편의성을 기획하고 강화해요!  신규 프로젝트의 아이디어를 제안하고 기획합니다. ❖ 채용 절차  서류 전형 > 실무 면접 > 인성 면접 > 임원 면접 > 최종 합격		IT/인터넷
1589	커넥트웨이브	중견기업			서울 구로구			0		무관	무관			IT/인터넷
1590	Ecoplastic America	중견기업	해외					0		무관	무관			IT/인터넷
1591	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
1592	아인의료재단	기타			인천 미추홀구			0		무관	무관			IT/인터넷
1593	프롭티어	대기업			서울 서초구			0		무관	무관			IT/인터넷
1594	네오플	대기업		던전 콘텐츠 기획자	서울 강남구			0		무관	무관			IT/인터넷
1595	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
1596	뱅크샐러드	중소기업			서울 마포구			0		무관	무관	유저 관점에서 사고하여 경쟁력 있는 가치 제안을 개발하고, 유저의 후생 증대와 편익 극대화 기준을 정량화(북극성 지표)하고 이를 기준으로 제품을 고도화하는 경험이 있는 분들을 원해요.  MAKER들과 애자일 조직에서 가설 수립 및 가설 검증 이터레이션 통해 PMF를 끈질기게 찾아 본 분을 원해요.  모바일 비즈니스나 트래픽 비즈니스의 핵심 지표 정의, 성장 로드맵을 구축하고 실행해본 경험이 있는 분을 원해요.  도메인 경험은 없어도 되나, 도메인 학습에 있어 두려움이 없이 호기심을 가지고 있는 분을 원해요.  의사결정을 직접 내리고, 성과를 온전히 책임져 본 분들. 여정 상 번거로운 일이나 어려운 일들을 마다하지 않고 손수 실질적 성과까지 이끌어내는 분들은 뱅샐에서 크게 인정받아요.  한계 없이 문제를 풀 수 있다는 도전 정신이 투철하고 신뢰는 내가 얻어 내는 것이고 , 뛰어나지만 항상 발전을 추구하는 독립심 있는 사람과 일하고 싶어요.		IT/인터넷
1625	네오플	대기업			제주특별자치도 제주시			0		무관	필수	'던전앤파이터'가 게임이기 이전에 고객에게 제공하는 서비스임을 인지하고, 고객 신뢰를 바탕으로 한 기본적인 직업 윤리 의식을 지니신 분  신뢰에 기반한 협업으로 팀워크를 발휘할 수 있도록 좋은 커뮤니케이션 스킬과 매너를 갖추신 분  다양한 경우의 수를 따져보고 확인할 수 있는 꼼꼼함을 갖추신 분  문제 발견 및 문제 해결 능력을 갖추신 분  여러 장르의 게임&PC MMORPG에 대한 이해도가 높은 분  MS Office 활용 능력을 갖추신 분  해외 출장 결격 사유가 없는 분 [채용 여정] 서류심사 → 면접 → 처우협의 → 최종합격 및 입사 * 해당 절차는 각 포지션 및 후보자에 따라 변동이 있을 수 있습니다. * 면접 전형 이후 후보자 동의하에 레퍼런스 체크가 진행 될 수 있으며 진행 시 별도로 안내 드릴 예정입니다.		IT/인터넷
1597	뱅크샐러드	중소기업			서울 마포구			0		무관	무관	유저 관점에서 사고하여 경쟁력 있는 가치 제안을 개발하고, 유저의 후생 증대와 편익 극대화 기준을 정량화(북극성 지표)하고 이를 기준으로 제품을 고도화하는 경험이 있는 분들을 원해요.  MAKER들과 애자일 조직에서 가설 수립 및 가설 검증 이터레이션 통해 PMF를 끈질기게 찾아 본 분을 원해요.  모바일 비즈니스나 트래픽 비즈니스의 핵심 지표 정의, 성장 로드맵을 구축하고 실행해본 경험이 있는 분을 원해요.  도메인 경험은 없어도 되나, 도메인 학습에 있어 두려움이 없이 호기심을 가지고 있는 분을 원해요.  의사결정을 직접 내리고, 성과를 온전히 책임져 본 분들. 여정 상 번거로운 일이나 어려운 일들을 마다하지 않고 손수 실질적 성과까지 이끌어내는 분들은 뱅샐에서 크게 인정받아요.  한계 없이 문제를 풀 수 있다는 도전 정신이 투철하고 신뢰는 내가 얻어 내는 것이고 , 뛰어나지만 항상 발전을 추구하는 독립심 있는 사람과 일하고 싶어요.		IT/인터넷
1598	크래프톤	중견기업			서울 강남구			0		무관	무관			IT/인터넷
1599	Toss	대기업	IT/인터넷					0		무관	무관			IT/인터넷
1600	SK C&C	대기업		Tech R&D - Software Engineering	경기 성남시 분당구			0		필수	필수	해외여행에 결격사유가 없는 분 (병역 대상자의 경우 병역필 또는 면제자) 채용 분야의 경력을 3~5년 이상 보유하신 분 최종합격 후 회사가 지정하는 날짜에 입사 가능하신 분	[전형 절차]\n서류전형 > SKCT심층역량검사 > 1차면접 > 2차면접 > 채용검진/처우협의 > 최종합격	IT/인터넷
1601	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
1602	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
1603	폰비	스타트업			서울 서초구			0		무관	무관			IT/인터넷
1604	SavvycomKorea	중소기업			서울 종로구			0		무관	무관			IT/인터넷
1605	토스뱅크	금융권			서울 강남구			0		무관	무관	정적인 화면을 보면 동적으로 만들고 싶어지는 분을 찾아요. 떠오른 아이디어를 Hi fi 프로토타입으로 만들 수 있는 분이 필요해요. 세상에 없던 사용성과 비주얼을 가진 컴포넌트 만드는 것에 가슴 뛰는 분을 찾아요. 사용자의 문제를 인터랙티브한 솔루션으로 해결하는 것에 가슴 뛰는 분을 찾아요. "처음 가입한 유저에게 인터랙션으로 토스의 편리함과 안전함을 잘 전달할 수 있을까?" "어렵고 복잡한 약관 동의 화면을 인터랙션을 이용해 쉽고 직관적으로 바꿀 수 있을까?" "금융의 해피모먼트 경험을 증폭할 수 있는 인터렉션 만들기"	[전형안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1606	펄어비스	중견기업			경기 과천시			0		무관	무관	인게임 컷신 연출에 대한 이해도가 있으신 분 게임 개발에 대한 이해도가 있으신 분 /포트폴리오 제출 필수/ 포트폴리오는 클라우드(구글, MS 등)에 올린 후 링크 형태로 첨부 부탁드립니다. 이미지 파일의 경우는 원본 사이즈로 준비 부탁드립니다. 부득이한 사유로 인해 압축파일을 첨부하시는 경우, 압축파일 내 이미지 파일은 모두 풀어서 첨부해주시기를 바랍니다.	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1607	펄어비스	중견기업			경기 과천시			0		무관	무관			IT/인터넷
1608	펄어비스	중견기업			경기 과천시			3		무관	무관	(경력) 유관 경력 3년 이상이신 분 기본적인 3D 제작툴 사용이 가능하신 분 이펙트용 텍스쳐의 제작/편집이 가능하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1609	펄어비스	중견기업			경기 과천시			0		무관	무관	Houdini 및 Blender geometry node 기반 툴 제작이 가능하신 분 (프로시듀얼 모델링 담당 업무) HLSL 기반으로 셰이더 작성이 가능 하신 분 (셰이더 담당 업무)	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1610	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
1611	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
1612	주식회사 코딧	스타트업			서울 영등포구			0		무관	무관			IT/인터넷
1613	쿠팡	대기업		Compliance Specialist (PII Protection & Management Team)	서울 송파구			0		무관	무관	시스템 권한 관리 업무 경험이 있으신 분 분석 및 문제 해결 능력을 보유하신 분 효과적인 커뮤니케이션과 원할한 협업 능력을 보유하신 분 DB 데이터 추출 및 로그 분석 활용 능력이 강하신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	IT/인터넷
1614	여기어때컴퍼니	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1615	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
1616	페스카로	중소기업	IT/인터넷					0		무관	무관			IT/인터넷
1617	페스카로	중소기업			경기 수원시 영통구	학사		4		무관	무관	신입/경력 4년 미만 대재 (4년제)		IT/인터넷
1618	페스카로	중소기업			경기 수원시 영통구			0		무관	무관			IT/인터넷
1619	㈜아이에스에프넷 코리아	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
1620	지멘스	외국계기업	IT/인터넷					0		무관	무관			IT/인터넷
1621	토스	중소기업		DataOps Manager	서울 강남구			0		무관	무관	데이터 분석 및 관리 경험 SQL 활용 능력		IT/인터넷
1622	생활연구소	중소기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1623	포티투닷	스타트업			경기 성남시 수정구			0		무관	무관			IT/인터넷
1624	오픈드림컴퍼니	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
1626	피에프씨테크놀로지스	스타트업			서울 서초구			0		무관	무관			IT/인터넷
1627	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1628	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1629	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1630	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1631	넛지헬스케어 주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1633	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1634	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1635	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1636	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1637	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1638	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1639	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1640	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1641	넛지헬스케어주식회사	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1642	Deloitte 안진회계법인	외국계기업			서울 영등포구			0		무관	무관			IT/인터넷
1643	Tridge	스타트업			서울 서초구			0		무관	무관			IT/인터넷
1644	주식회사 패스트뷰	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1645	메가존클라우드	중견기업			서울 강남구			0		무관	무관			IT/인터넷
1646	고운세상코스메틱	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1647	고운세상코스메틱	외국계기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1648	주식회사 투어라이브	중소기업	IT/인터넷					0		무관	무관		[채용 전형]\n- 서류전형 > 1차 온라인 면접 > 2차 면접 > 최종 합격	IT/인터넷
1649	다쏘시스템코리아	중견기업			대구 남구			0		무관	무관			IT/인터넷
1650	루닛	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1651	노벨리스코리아	중견기업			서울 중구			0		무관	무관	Bachelor’s degree and above. Majori in business administration or Accounting is preferred Good understanding of product costing in manufacturing business and operations Relevant experience in manufacturing industry Good communication skills with various stakeholders English Proficiency in both verbal and written Expertise in MS Excel Power BI experience is a plus	[전형절차]\n서류 전형- 면접 전형 - 최종 합격	IT/인터넷
1652	노벨리스코리아	중견기업			서울 중구	학사		0		무관	무관	학력: 대졸(4년) 이상	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1653	노벨리스코리아	중견기업			서울 중구	학사	기계 계열	0	영어 성적 요구	무관	필수	재료공학, 기계공학, 산업공학 등 공학 배경 학사 학위 이상  영어 능통자  수준급 MS Office (Excel, PPT) 활용 가능한 자  정기적인 국내/해외 출장이 가능한 자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1654	노벨리스코리아	중견기업			울산 남구			0		무관	무관	1. Support global project 2. Operate Regional systems   Develop & maintain the regional applications to meet the customer business goal 3. Enhancement Regional system Improve the regional applications to meet the customer business goal Execution & leading Hot Mill, Supply Chain & GMS area for Asia MES integration project Execution & leading ABS, OES, GMS & DMS for Asia project 4. Better understanding business part useful IT application	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1655	넥슨	대기업			경기 성남시 분당구			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1656	(주)커넥트웨이브	중견기업			서울 금천구			0		무관	무관			IT/인터넷
1657	몰로코	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1658	라이나손해보험	금융권			서울 종로구			0		무관	무관			IT/인터넷
1659	아인의료재단	비영리단체/협회/재단			인천 미추홀구			0		무관	무관			IT/인터넷
1660	시큐아이	대기업			서울 종로구			0		무관	무관			IT/인터넷
1661	메가존클라우드	중견기업			서울 강남구			0		무관	무관			IT/인터넷
1662	프레인글로벌	중소기업			서울 중구			0		무관	무관		[전형절차]\n서류 접수 > 실무 및 임원 면접 > 최종 합격 및 입사\n합격자에 한해 개별 연락드려요.\n해당 포지션은 1년 계약직입니다.	IT/인터넷
1663	업스테이지	중소기업			경기 용인시 수지구			0		무관	무관			IT/인터넷
1664	롯데GFR	대기업			서울 강남구			0		무관	무관			IT/인터넷
1665	롯데GFR	대기업			서울 강남구	학사		0		무관	무관	학력 : 대졸이상(4년)  경력 : 여성복 기획MD 경력 4~6년차		IT/인터넷
1666	비즈니스캔버스	중소기업			서울 강남구			0		무관	무관			IT/인터넷
1667	넷마블네오	대기업			서울 구로구			0		무관	무관			IT/인터넷
1668	넷마블네오	대기업			서울 구로구			0		무관	무관			IT/인터넷
1669	알파브라더스	중소기업			서울 강서구			0		무관	무관			IT/인터넷
1670	넥슨게임즈	대기업			서울 서초구			0		무관	무관			IT/인터넷
1671	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
1672	네오플	대기업			제주특별자치도 제주시			0		무관	무관	UI/UX관련 전공, 또는 3년 이상 경력이 있으신 분을 찾고 있습니다.  적극적인 의견 개시와 더불어 의견에 대한 수용성에 있어서도 원활한 분이었으면 좋겠습니다.  UX에 대해 지대한 관심이 있고 아이디어 제안이 가능한 분이면 최고입니다.  UI 연출에 대한 쫀득한 맛을 체득하신 분이면 더욱 좋겠습니다. [채용 여정]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
1673	뮌헨재보험 한국지점	중소기업			서울 종로구			0		무관	무관			IT/인터넷
1674	LG경영개발원	대기업			서울 강서구			0		무관	무관			IT/인터넷
1710	대상	대기업		경영지원_기술관리	서울 종로구, 경남 거창군, 경기 용인시 기흥구, 전북특별자치도 군산시, 충남 천안시 서북구			0		필수	필수	1. '25년 8월 졸업예정자 혹은 직무별 학력 기졸업자 2. 해외여행에 결격사유가 없고, 남성의 경우 병역의무를 필하였거나 면제인 분		연구개발/설계
1711	현대모비스	대기업			서울 강남구			0		무관	무관			연구개발/설계
1675	네오플	대기업			서울 강남구		물리 계열	0		무관	무관	C++, Unreal Engine 등 프로그래밍 언어에 대한 깊은 이해를 가진 분  3D 액션 게임 전투(스킬 제작, 애니메이션, AI, 물리) 개발에 대한 관심이 있으신 분  하드코어 액션 RPG (몬스터헌터, 소울라이크 등) 및 3D 액션 전투 플레이를 잘 하시거나, 거부감이 없으신 분  문제의 원인 분석 및 해결 능력이 뛰어나신 분  수평적 의사 소통 및 애자일 개발 방식에 거부감이 없으신 분  적극적 커뮤니케이션: 효과적인 개발을 위하여 [문서화/대화/토론/피드백] 에 적극적인 분  꾸준한 트래킹과 테스트 : '저절로 되는 것은 없다'는 마인드로 꼼꼼하게 작업을 관리하실 수 있는 분  상호 존중의 마인드 : 프로젝트는 많은 사람들이 모여 이룩하는 공동의 작업이라는 이해가 있으신 분 [채용 절차]  서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사		IT/인터넷
1676	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
1677	네오플	대기업			서울 강남구			0		무관	무관	신입/경력 무관  원화 해석 및 조형 능력이 뛰어나서 원화보다 더 멋진 모델링을 추구하시는 분을 찾습니다.  카툰풍 모델링 제작 경험이 있거나 카툰 스타일 그래픽을 좋아하시는 분을 찾고 있습니다.  카툰 그래픽으로 퀄리티 정점을 찍고 싶은 분이었으면 좋겠습니다.  3DS Max, ZBrush, Substance에 충분히 숙련되신 분을 찾고 있습니다.  끊임없는 퀄리티 향상에 갈증을 느끼는 분을 찾고 있습니다.	[전형 절차]\n- 서류심사 → 과제심사 → 면접 → 처우협의 → 최종합격 및 입사	IT/인터넷
1678	네오플	대기업			제주특별자치도 제주시			0		무관	무관			IT/인터넷
1679	버킷플레이스(오늘의집)	중소기업			서울 서초구			0		무관	무관			IT/인터넷
1680	마상소프트	중소기업			부산 해운대구			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1681	마상소프트	중소기업			부산 해운대구			0		무관	무관	배우고 성정하기 위해 노력 하는 분  이슈 및 보안 등 새로운 변화에 두려워 하지 않고 즐기시는 분  긍정적으로 생각하고 실천하는 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1682	Codiz Inc	스타트업	IT/인터넷					0		무관	무관			IT/인터넷
1683	DB Insurance USA	금융권	해외					0		무관	무관			IT/인터넷
1684	네오플	대기업			서울 강남구			0		무관	무관			IT/인터넷
1685	뉴파워프라즈마	중견기업			경기 수원시 권선구, 서울 강서구			0		무관	무관			IT/인터넷
1686	DB Insurance	중견기업	IT/인터넷					0		무관	무관			IT/인터넷
1687	라인플러스	대기업			경기 성남시 분당구			0		무관	무관	7년 이상의 서비스기획 또는 제품관리(Product Management) 경험을 보유하신 분  스스로 목표와 전략 설정이 가능하고, 논리적이고 효과적인 커뮤니케이션 능력을 보유하신 분  프러덕트에 대한 오너쉽을 가지고 서비스를 런칭하고 주도적으로 크게 성장시켜본 경험을 보유하신 분  데이터를 기반으로 문제 해결 능력을 보유하신 분  실패를 두려워하지 않고 근성을 가지고 배움과 일을 대하시는 분		IT/인터넷
1688	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1689	카카오페이	금융권			경기 성남시 분당구			0		무관	무관			IT/인터넷
1690	(주)미미박스	외국계기업			서울 강남구			0		무관	무관			IT/인터넷
1691	넥슨코리아	대기업			경기 성남시 분당구			0		무관	무관			IT/인터넷
1692	하이퍼리즘	중소기업			서울 관악구			0		무관	무관			IT/인터넷
1693	마이리얼트립	중소기업			서울 서초구			0		무관	무관			IT/인터넷
1694	한화이센셜	대기업			충남 아산시			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1695	쎄믹스	중소기업			경기 성남시 분당구		전기 계열	0	영어 성적 요구	무관	필수	* 신입  전기 / 전자 / 반도체 공학 (또는 유사학과)  OPIC IM2급 (점) 이상/TOEIC Speaking IM3 이상  해외 출장에 결격사유가 없는 자 * 경력  위 신입 요건 충족  Motion & IO 제어 / PLC 제어 / AutoCAD 설계  BOM 관리 경험	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1696	쎄믹스	중소기업			경기 광주시		전자 계열	1		무관	무관	신입 : 전자공학 또는 반도체 공학을 전공하고 반도체 및 회로에 대한 이해도가 높은 분  경력; 테스터 영업 경력 1년 이상 유경험자로 반도체에 대한 이해도가 높은 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	IT/인터넷
1697	주식회사 케어마인더	스타트업			서울 강남구			0		무관	무관			IT/인터넷
1698	야놀자	중견기업			서울 강남구			0		무관	무관			IT/인터넷
1699	어스얼라이언스	중소기업			서울 마포구			0		무관	무관			IT/인터넷
1700	엔피씨	중견기업			경기 용인시			0		무관	무관			IT/인터넷
1701	유비벨록스	중견기업			서울 구로구, 충청 진천군			0		무관	무관			IT/인터넷
1702	보쉬전장	중견기업			세종특별자치시			0		무관	무관			연구개발/설계
1703	성신양회	중견기업		전기	충북 단양군	학사	전기 계열	5		무관	무관	학력 : 4년제졸 이상 전공 : 전기, 전기공학 계열 경력  신입 또는 경력 5년 이상		연구개발/설계
1704	SFA반도체	중견기업			충남 천안시 서북구			0		무관	무관			연구개발/설계
1705	큐알티	중소기업		FIB	경기 수원시 영통구	전문학사	이공 계열	0		무관	무관	(1) 학력: 전문학사 (2) 전공: 이공계열		연구개발/설계
1706	현대제철	대기업			경북 포항시 남구			0		무관	무관			연구개발/설계
1707	종근당바이오	중견기업			경기 안산시 단원구			0		무관	무관			연구개발/설계
1708	신한투자증권	대기업			서울 영등포구			0		무관	무관			연구개발/설계
1709	극지연구소	공공기관/공기업						0		무관	무관			연구개발/설계
1712	대상	대기업		연구기획	서울 강서구			0		필수	필수	1. '25년 8월 졸업예정자 혹은 직무별 학력 기졸업자 2. 해외여행에 결격사유가 없고, 남성의 경우 병역의무를 필하였거나 면제인 분		연구개발/설계
1713	현대모비스	대기업		배터리 전기화학 분석	경기 용인시 기흥구	석사		0		무관	무관	2025년 8월 졸업 예정자 또는 기졸업자 ※ 최종합격 후 회사에서 지정하는 날짜에 입사 가능해야 하며, 학/석사 졸업 요건을 충족하지 못할 경우 입사 취소될 수 있습니다.		연구개발/설계
1714	한화엔진	대기업			경남 창원시 성산구			0		무관	무관			연구개발/설계
1715	BGF에코머티리얼즈	중견기업			경기 화성시, 서울 강남구			0		무관	무관			연구개발/설계
1716	Englewood LAB	기타						0		무관	무관			연구개발/설계
1717	코스트코코리아	중견기업			울산 북구			0		무관	무관			연구개발/설계
1718	크라운제과	중견기업		일반관리	서울 용산구, 대전 대덕구, 경기 양주시	학사		0		무관	무관	① 학력: 4년제 대졸학사 이상		연구개발/설계
1719	동국제약	중견기업			충북 진천군, 경기 수원시 영통구			0		무관	무관			연구개발/설계
1720	LG CNS	대기업		통신 OSS 영역 개발	서울 마포구			0		무관	무관			연구개발/설계
1721	어플라이드머티어리얼즈코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
1722	후루노코리아	외국계기업			부산 동구			0		무관	무관			연구개발/설계
1723	SK하이닉스	대기업			경기 이천시, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
1724	한국동서발전	공공기관/공기업			울산 중구, 충남 당진시, 강원특별자치도 동해시, 경기 고양시 일산동구, 대전 유성구			0		무관	무관			연구개발/설계
1725	한국재료연구원	비영리단체/협회/재단		01) 극저온 환경용 코팅 공정 개발 및 트라이볼로지 연구	경남 창원시 성산구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1726	서울시복지재단	비영리단체/협회/재단			서울 마포구			0		무관	무관			연구개발/설계
1727	경농	중견기업		기반육종팀 육종연구원	경기 이천시			0		무관	무관		[전형 안내]\n서류전형 - 인적성검사 - 면접전형 - 최종합격	연구개발/설계
1728	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			연구개발/설계
1729	한국원자력협력재단	비영리단체/협회/재단			해외			0		무관	무관			연구개발/설계
1730	포스코DX	대기업		전기설계	경북 포항시 남구, 전남 광양시, 경기 성남시 분당구	학사		0	영어 성적 요구	필수	필수	4년제 대학 졸업(예정)자 영어 어학성적 보유자 회사가 지정한 일자에 인턴활동 및 입사가 가능한 자 '25. 6. 1 이전 병역필(예정) 또는 면제자로 해외여행에 결격사유가 없는 자 영어 말하기 성적은 '23. 5. 22 이후 취득 성적만 인정		연구개발/설계
1731	아이쓰리시스템	스타트업			대전 유성구			0		무관	무관			연구개발/설계
1732	LG CNS	대기업		공정물류 기구, 전장/제어	서울 강서구, 충북 청주시 서원구			5		무관	무관	기구/설계/전장/제어의 경력이 5년 이상 있으신 분 물류 센터 설비, 레이아웃/장비 설계/이행 경력이 5년 이상 있으신 분 2차 전지 물류/클린 공정 물류 설계/이행 경력이 5년이상 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1733	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			연구개발/설계
1734	포스코DX	대기업			경북 포항시 남구, 전남 광양시			0		무관	무관			연구개발/설계
1735	(재)지능형자동차부품진흥원	비영리단체/협회/재단			대구 달성군			0		무관	무관			연구개발/설계
1736	에이스웍스코리아	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1737	휴비츠	중소기업			경기 안양시 동안구	학사	전자 계열	0	영어 성적 요구	무관	필수	대졸 이상(전자 관련 전공)  비즈니스 영어 회화 가능자(TOEIC 700점 이상)  해외 출장에 결격 사유가 없는 분		연구개발/설계
1738	LG이노텍	대기업			서울 강서구			0		무관	무관			연구개발/설계
1739	삼화콘덴서공업	중견기업			경기 용인시 처인구			0		무관	무관			연구개발/설계
1740	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			연구개발/설계
1741	국립정신건강센터	공공기관/공기업			서울 광진구			0		무관	무관			연구개발/설계
1742	한국타이어앤테크놀로지	중견기업			대전 유성구			0		무관	무관			연구개발/설계
1743	한국토지주택공사	공공기관/공기업			서울 강남구, 인천 남동구, 대구 달서구, 대전 서구, 광주 서구			0		무관	무관			연구개발/설계
1744	다원시스	중견기업			경기 안산시 단원구			0		무관	무관			연구개발/설계
1745	한국타이어앤테크놀로지	대기업			대전 유성구			0		무관	무관			연구개발/설계
1746	주식회사 에이펙솔루션	중견기업						0		무관	무관			연구개발/설계
1747	인트론바이오	중소기업						0		무관	무관			연구개발/설계
1748	현대트랜시스	대기업			경기 화성시			0		무관	무관			연구개발/설계
1749	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			연구개발/설계
1750	삼양사	중견기업			대전 대덕구			0		무관	무관			연구개발/설계
1751	한국공항공사	공공기관/공기업			서울 강서구			0		무관	무관			연구개발/설계
1752	한국가스공사	공공기관/공기업						0		무관	무관			연구개발/설계
1753	남양넥스모	중견기업		국내영업 A	경기 안산시 단원구, 경기 화성시			0		무관	무관			연구개발/설계
1754	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			연구개발/설계
1755	(주)리디자인엑스	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
1756	공무원연금공단	공공기관/공기업		5급_사무(일반)_행정/법학	서울 강남구			0		무관	무관	성별 연령 제한 없음(단, 공단 정년(만 60세) 초과자 제외)  공단 인사규정의 임용결격 사유에 해당되지 않는 자		연구개발/설계
1757	목암생명과학연구소	기타			서울 서초구			0		무관	무관			연구개발/설계
1758	삼양홀딩스	중견기업			울산 남구, 인천 중구, 대전 대덕구, 대전 대덕구			0		무관	무관			연구개발/설계
1759	HL만도	중견기업			경기 성남시 분당구	전문학사	전자 계열	0		무관	무관	전문학사 이상 전자공학 계열 전공		연구개발/설계
1760	SK바이오사이언스	대기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
1761	삼양그룹	대기업		환경관리	대전 유성구, 울산 남구, 인천 서구			0	영어 성적 요구	필수	필수	기졸업자 및 2025년 8월 졸업예정자 해외여행에 결격사유가 없는 자 남성의 경우 군필자 또는 면제자 공인 영어말하기 성적보유자(OPIc 및 TOEIC SPEAKING에 한함)  TOEIC SPEAKING/OPIc IM1이상  서류접수 마감일 기준 2년 이내 유효 성적에 한함		연구개발/설계
1762	원익아이피에스	중견기업		고객지원(CS)	경기 평택시, 경기 화성시, 경기 평택시			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1763	수협중앙회	금융권		일반관리계(지도사업)	서울 마포구, 인천 연수구, 강원특별자치도 동해시, 충남 보령시, 전북특별자치도 김제시			0		무관	무관		[전형 안내]\n서류전형 - 필기전형 - 면접전형 - 최종합격	연구개발/설계
1764	한성자동차	중견기업			서울 서초구, 경기 용인시 기흥구, 경기 성남시 분당구, 인천 남동구, 대전 대덕구			0		무관	무관			연구개발/설계
1765	삼진제약	대기업			서울 마포구, 경기 화성시, 서울 강서구			0		무관	무관			연구개발/설계
1766	목암생명과학연구소	기타		Computational bioloogy/bioinformatics 연구원	서울 서초구			0		무관	무관			연구개발/설계
1767	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			연구개발/설계
1768	노르마	중소기업		QPU 설계	서울 성동구			0		무관	무관	3학년 이상 재학 중인 학생/대학원생  연관 분야 전공		연구개발/설계
1769	한덕화학	대기업			울산 남구			0		무관	무관			연구개발/설계
1770	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			연구개발/설계
1771	삼양홀딩스	중견기업			서울 종로구			0		무관	무관			연구개발/설계
1772	LG전자	대기업		HS사업본부	서울 영등포구, 경남 창원시 성산구, 경기 평택시			0		무관	무관			연구개발/설계
1773	파마리서치	중소기업		코스메틱 연구	경기 성남시 수정구	석사	화학 계열	0		무관	무관	<코스메틱 연구> 학력 : 석사 이상(화학, 생화학, 생명공학, 분자생물학 등 유관 전공자) 화장품(기초 및 헤어) 제품 개발 및 연구 유경험자 <의료기기 연구> 학력 : 석사 이상 고분자 연구 및 효력 연구 경험자	[전형 안내]\n서류전형 → 면접전형 → 최종합격	연구개발/설계
1774	쓰리빌리언	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1775	쓰리빌리언	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1776	파마리서치	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
1777	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			연구개발/설계
1778	SK ON	대기업			대전 유성구			0		무관	무관			연구개발/설계
1779	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			연구개발/설계
1780	온세미컨덕터코리아	대기업		SiC TD Engineer	경기 부천시 원미구			0		무관	무관			연구개발/설계
1781	카카오모빌리티	중견기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
1782	글로벌스탠다드테크놀로지	중견기업			경기 화성시, 충남 아산시, 경기 평택시, 경기 용인시 기흥구			0		무관	무관			연구개발/설계
1783	오알에스코리아 | ORSKOREA	외국계기업						0		무관	무관			연구개발/설계
1784	대구농수산물유통관리공사	중소기업			대구 북구			0		무관	무관			연구개발/설계
1785	도루코	중견기업		내부감사	서울 강남구, 경기 용인시 처인구	학사		0		무관	무관	학사 이상	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1786	슈어소프트테크	중소기업			경기 성남시 수정구, 대전 유성구			0		무관	무관			연구개발/설계
1787	엘비세미콘	중견기업			경기 평택시			0		무관	무관			연구개발/설계
1788	엘비세미콘	중견기업			경기 평택시			0		무관	무관			연구개발/설계
1789	엘비세미콘	중견기업			경기 안성시			0		무관	무관			연구개발/설계
1790	LSP USA, LLC	기타						0		무관	무관			연구개발/설계
1791	에어퍼스트	중견기업		부천공장 오퍼레이터	경기 평택시, 경기 부천시 원미구, 경북 포항시 남구, 충남 서산시, 경기 용인시 기흥구			0		무관	무관			연구개발/설계
1792	엠케이에스코리아	외국계기업			경기 용인시 기흥구			0		무관	무관			연구개발/설계
1793	KT넷코어	대기업			서울 강남구			0		무관	무관			연구개발/설계
1794	KT넷코어	대기업			서울 강남구			0		무관	무관			연구개발/설계
1795	Spigen Inc	중견기업						0		무관	무관			연구개발/설계
1796	슈어소프트테크	중소기업		차량 제어기 검증의 실무 기술 습득	경기 성남시 수정구		전자 계열	0		무관	무관	전자, 컴퓨터, SW공학 관련 학과  C언어 및 Python 프로그래밍 경험  원활한 소통이 가능하신 분  컴퓨터 활용 능력(엑셀) : 中 이상  학점 3.5/4.5 이상  졸업 예정자	[전형 안내]\n서류 전형 - 필기시험 - 면접 전형 - 인턴십 - 임원 면접 - 최종 합격	연구개발/설계
1797	한국타이어앤테크놀로지	대기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
1798	파마리서치	중견기업		-코스메틱 연구-	경기 성남시 수정구	석사	화학 계열	0		무관	무관	학력 : 석사 이상(화학, 생화학, 생명공학, 분자생물학 등 유관 전공자) 화장품(기초 및 헤어) 제품 개발 및 연구 유경험자	[전형 안내]\n서류전형 - 면접전형 - 최종합격 및 입사	연구개발/설계
1799	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
1800	국경없는의사회 한국	비영리단체/협회/재단			해외			0		무관	무관			연구개발/설계
1801	현대자동차	대기업		AI/Data	서울 서초구			0		무관	무관	Ph.D. candidates/graduates in STEM from global universities (including post docs) Applicants must be able to join the company by August 2026	[전형 안내]\n서류전형 - 면접전형 - 현대 기술 세미나 - 최종합격	연구개발/설계
1802	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
1803	LG경영개발원	대기업			서울 강서구			0		무관	무관			연구개발/설계
1804	아이리스브라이트	중소기업			서울 강남구			0		무관	무관			연구개발/설계
1805	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			연구개발/설계
1806	주식회사 더파운더즈	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1807	에어리퀴드코리아	중견기업			대전 대덕구			0		무관	무관			연구개발/설계
1808	에어리퀴드코리아	중견기업			강원특별자치도 원주시			0		무관	무관			연구개발/설계
1809	머크코리아	외국계기업		Product Compliance Specialist	서울 강남구			0		무관	무관	Bachelor's degree required. Chemistry related major is preferred, but not mandatory  0 3 years of Chemical/Hazardous substance, Regulatory, Product Stewardship, K REACH experience is a plus  Fluent English and Korean (Speaking and Writing)  Ability to work in a fast paced, global environment	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1810	펜믹스	중견기업			충남 천안시 서북구			0		무관	무관			연구개발/설계
1811	(주)삼구아이앤씨	중견기업			서울 중구			0		무관	무관			연구개발/설계
1812	램리서치코리아	외국계기업		Process Technician for KTC R&D Center	경기 용인시 기흥구			0		무관	무관			연구개발/설계
1813	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			연구개발/설계
1814	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			연구개발/설계
1815	주식회사 라포랩스	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1816	주식회사 라포랩스	스타트업			서울 강남구			0		무관	무관			연구개발/설계
1817	DAS North America, Inc.	중견기업			해외			0		무관	무관			연구개발/설계
1818	나노신소재	중소기업		첨단 나노소재 R&D	세종특별자치시 , 대전 유성구	박사	화학 계열	0	영어 성적 요구	필수	무관	화학, 화학공학, 재료공학 등 관련 전공, 석 박사 학위 이상 비즈니스 영어 회화 가능자 해외 여행에 결격사유가 없는 자 남성의 경우, 병역 필 또는 면제자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	연구개발/설계
1819	테크로스	중견기업			경기 화성시			0		무관	무관			연구개발/설계
1820	삼양홀딩스	중견기업			서울 종로구			0		무관	필수	해외여행에 결격사유가 없는 분		연구개발/설계
1821	한화비전	대기업		AI 연구원	경기 성남시 분당구	박사		0		무관	무관	1D Signal(Audio) processing 관련 석/박사 학위 소지자		연구개발/설계
1822	Psomagen	외국계기업						0		무관	무관			연구개발/설계
1823	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			연구개발/설계
1824	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			연구개발/설계
1825	엘비세미콘	중견기업		TEST제품기술2팀	경기 안성시	학사	전자 계열	0		무관	무관	학력: 대졸 이상(4년) 전공: 반도체, 전자, 기계, 컴퓨터, 통신 공학과		연구개발/설계
1826	University of Nebraska Song Lab	기타						0		무관	무관			연구개발/설계
1827	실리콘마이터스	중견기업			경기 성남시 분당구			0		무관	무관			연구개발/설계
1828	마상소프트	중소기업			부산 해운대구			0		무관	무관	배우고 성정하기 위해 노력 하는 분  이슈 및 보안 등 새로운 변화에 두려워 하지 않고 즐기시는 분  긍정적으로 생각하고 실천하는 분	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
1829	파마리서치	중소기업			경기 성남시 수정구			0		무관	무관			연구개발/설계
1830	파트론	중견기업			경기 화성시	석사	전기 계열	6		무관	무관	신입 (석사 이상) 또는 경력 6년 이상  고속 인터페이스 설계 경험  SI/PI/EMI 설계 경험  Design 및 Simulation Tool 사용 가능자 (SIWave,Q3D,HFSS 등)  전자/전기/통신공학 또는 관련 전공자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
1831	휴온스메디텍	중소기업			경기 성남시 중원구	학사	전기 계열	2		무관	무관	학력 : 대졸 이상 (2,3년) 경력 : 신입/경력(2년 이내) 전공 : 전기/전자공학, 기계, 자동차 공학계열 운전면허증 소지자 의사소통능력, 긍정적인 마인드, 책임감 있는 사람, 문제해결능력, 지속적인 자기개발	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
1832	쎄믹스	중소기업			경기 광주시		기계 계열	2		무관	무관	경력: 신입/경력 2년 이상  기계설계 가능자  회로설계 가능자  전장, 하네스 설계 가능자  공정설계 가능자	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	연구개발/설계
1833	팀프레시	중소기업			서울 강남구			0		무관	무관			연구개발/설계
1834	조선내화	대기업		제조기술직_전남 광양	전남 광양시, 경북 포항시 남구	고졸		0		필수	무관	고등학교 이상 졸업인 분으로서, 2025년 7월 내 회사가 지정한 입사일에 입사 가능하신 분 책임감이 강하고 출결 상태가 양호하신 분 남성의 경우, 병역필 또는 면제이신 분		생산/제조
1835	코오롱생명과학	대기업			충북 충주시			0		무관	무관			생산/제조
1836	Englewood LAB	기타			생산/제조, 연구개발/설계			0		무관	무관			생산/제조
1837	포스코모빌리티솔루션	대기업			경북 포항시 남구			0		무관	무관			생산/제조
1838	크라운제과	중견기업		일반관리	서울 용산구, 대전 대덕구, 경기 양주시	학사		0		무관	무관	① 학력: 4년제 대졸학사 이상		생산/제조
1839	동국제약	중견기업			충북 진천군, 경기 수원시 영통구			0		무관	무관			생산/제조
1840	엘앤에프	중견기업	생산/제조					0		무관	무관			생산/제조
1841	CJ푸드빌	대기업		음성공장 OEM관리파트 품질보증(QA) 담당				0		무관	무관		[전형 안내]\n서류전형 → 인적성 검사(사원급 限) → 1차 면접 → 평판조회 → 2차 면접(간부급 限) → 처우협의 → 건강검진 → 입사	생산/제조
1842	DB하이텍	대기업	생산/제조					0		무관	무관	마이스터고/특성화고 26년 졸업 예정자		생산/제조
1843	하나머티리얼즈	중견기업			충남 아산시			0		무관	무관			생산/제조
1844	하나머티리얼즈	중견기업			충남 아산시			0		무관	무관			생산/제조
1845	하나머티리얼즈	중견기업			충남 천안시 서북구			0		무관	무관			생산/제조
1846	SK하이닉스	대기업			경기 이천시, 충북 청주시 흥덕구			0		무관	무관			생산/제조
1847	한온시스템	중견기업			경기 광명시	고졸		0		무관	무관	고등학교 졸업 이상		생산/제조
1848	LS이모빌리티솔루션	대기업			충북 청주시 흥덕구			0		무관	무관			생산/제조
1849	경창산업	중견기업			대구 달서구	고졸		0		무관	무관	학력 : 고졸이상 경력: 무관		생산/제조
1850	경신	중견기업		품질관리	인천 연수구, 경북 경주시			0		무관	무관			생산/제조
1851	광동제약	중견기업			경기 평택시			0		무관	무관			생산/제조
1852	텍사스인스트루먼트코리아	중견기업			서울 강남구			0		무관	무관			생산/제조
1853	티씨케이	중견기업			경기 안성시			0		무관	무관			생산/제조
1854	세아베스틸	대기업			전북특별자치도 군산시			0		무관	무관			생산/제조
1855	GC녹십자웰빙	중견기업						0		무관	무관			생산/제조
1856	휴온스	중견기업			충북 제천시			0		무관	무관			생산/제조
1857	현대엘리베이터	중소기업			서울 종로구, 충북 충주시			0		무관	무관			생산/제조
1858	경신전선	중견기업		생산관리	충남 천안시 서북구	학사		0		필수	무관	학력: 국내외 대학 학사 학위 이상 소지자  해외출장에 결격사유가 없는 자, 남자의 경우 병역을 필한 자  토익 700점 이상 또는 이에 준하는 공인어학성적 소지자	[전형 안내]\n서류전형 - AI역량검사 - 면접전형 - 최종합격	생산/제조
1859	대원산업	중견기업		연구소_모빌리티 이노베이션 기술팀	경기 안산시 단원구, 경기 평택시			0		무관	무관			생산/제조
1860	주식회사 에이펙솔루션	중소기업	생산/제조					0		무관	무관			생산/제조
1861	현대트랜시스	대기업			경기 화성시			0		무관	무관			생산/제조
1862	삼화콘덴서공업	중견기업			경기 용인시 처인구			0		무관	무관			생산/제조
1863	KCC글라스	대기업			서울 서초구, 세종특별자치시 , 경기 여주시, 울산 북구, 대전 서구			0		무관	무관			생산/제조
1864	SK레조낙	대기업			경북 영주시	고졸		0		무관	무관	○  학력 : 고졸 이상 ○  경력 : 무관		생산/제조
1865	코스비전	대기업		SCM	대전 대덕구	고졸	화학 계열	0		무관	무관	경력: 무관 학위: 고졸이상 전공: 화학/화장품학	[전형 안내]\n서류전형 → 인성검사 / 1차면접 → 인턴전형(3개월) → 최종면접 → 최종합격	생산/제조
1866	삼아알미늄	중견기업	생산/제조					0		무관	무관			생산/제조
1867	네패스	중견기업			충북 청주시 청원구, 충북 청주시 청원구			0		무관	무관			생산/제조
1868	다인정공	중견기업	생산/제조					0		무관	무관			생산/제조
1869	이디야	중견기업			서울 강남구, 광주 서구, 경기 고양시 일산동구, 서울 동대문구, 서울 강남구			0		무관	무관			생산/제조
1870	머크	중견기업						0		무관	무관			생산/제조
1871	(주)삼구아이앤씨	중견기업	생산/제조, 디자인					0		무관	무관			생산/제조
1872	DB하이텍	대기업	생산/제조					0		무관	무관			생산/제조
1873	동희오토	중견기업			충남 서산시			0		무관	무관			생산/제조
1874	주식회사 에이펙솔루션	중견기업			생산/제조, 연구개발/설계			0		무관	무관			생산/제조
1875	Posco AAPC LLC.	중견기업	생산/제조					0		무관	무관			생산/제조
1876	POSCO AAPC LLC.	대기업						0		무관	무관			생산/제조
1877	KLA	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 경북 구미시			0		무관	무관			생산/제조
1878	도쿄일렉트론코리아	중견기업			경기 화성시, 경기 평택시, 경기 이천시, 충북 청주시 흥덕구, 경기 화성시			0		무관	무관			생산/제조
1879	제뉴원사이언스	중견기업			세종특별자치시 , 충북 제천시			0		무관	무관			생산/제조
1880	한국콜마	중견기업			세종특별자치시			0		무관	무관			생산/제조
1881	삼양홀딩스	중견기업			울산 남구, 인천 중구, 대전 대덕구, 대전 대덕구			0		무관	무관			생산/제조
1882	SK피유코어	중견기업	생산/제조					0		무관	무관			생산/제조
1883	HD현대인프라코어	대기업			전북특별자치도 군산시			0		무관	무관			생산/제조
1884	SIMPAC	중견기업			대구 달성군			0		무관	무관			생산/제조
1885	삼양그룹	대기업		환경관리	대전 유성구, 울산 남구, 인천 서구			0	영어 성적 요구	필수	필수	기졸업자 및 2025년 8월 졸업예정자 해외여행에 결격사유가 없는 자 남성의 경우 군필자 또는 면제자 공인 영어말하기 성적보유자(OPIc 및 TOEIC SPEAKING에 한함)  TOEIC SPEAKING/OPIc IM1이상  서류접수 마감일 기준 2년 이내 유효 성적에 한함		생산/제조
1929	한섬	대기업			서울 강동구	전문학사		0		무관	무관	전문학사 학위 이상  경력 무관(신입채용)		생산/제조
1886	쿠팡풀필먼트서비스	대기업		설비보전 전문가 팀원급	경기 고양시 덕양구, 경기 화성시, 인천 서구, 경기 평택시, 경북 경산시			1		무관	무관	관련 학과 졸업 or 관련 자격증 보유 or 관련 경력 1년 이상		생산/제조
1887	LX MMA	대기업		계전	전남 여수시, 대전 유성구			0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 인턴십 - 입사	생산/제조
1888	다스	중견기업		회계	경북 경주시	학사		0		무관	무관	4년제 대졸 ('25년 8월 졸업예정자 가능)  해외 출국에 결격사유가 없는 자	[전형 안내]\n서류전형 - 역량검사 - 면접전형 - 인턴십 - 최종합격	생산/제조
1889	해태제과식품	중견기업			충남 아산시, 광주 북구, 경기 양주시, 서울 용산구			0		무관	무관			생산/제조
1890	에어퍼스트	중견기업			경기 용인시 기흥구			0		무관	무관			생산/제조
1891	에쓰오일토탈에너지스윤활유	대기업				고졸	기계 계열	0		무관	무관	1) 기술사 : 건축기계설비, 기계, 건설기계, 공조냉동기계, 산업기계설비, 용접 2) 기능장 : 배관, 에너지관리, 용접 3) 기   사 : 건축설비, 건설기계설비, 공조냉동기계, 용접, 에너지관리, 설비보전, 일반기계 4) 산업기사 : 건출설비, 건설기계설비, 공조냉동기계, 에너지관리, 배관, 용접 (단, 산업기사는 취득 후 관련분야 3년이상 경력 필수) l  고등학교 졸업 이상	[전형절차]\n- 서류전형 > 인적성 및 면접전형 > 최종합격	생산/제조
1892	HD현대오일뱅크	대기업	생산/제조	ePTFE 분리막 생산				0		무관	무관		[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1893	타라티피에스	중견기업		국내사업본부_수주 영업	서울 마포구, 경기 파주시			0		필수	필수	2025년 7월 입사 가능자  남성의 경우 병역필 또는 면제자  해외 출장에 결격사유 없는 자	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1894	삼진제약	대기업			서울 마포구, 경기 화성시, 서울 강서구			0		무관	무관			생산/제조
1895	번개장터	스타트업			서울 성동구			0		무관	무관			생산/제조
1896	ICER Brands Services, LLC.	외국계기업	생산/제조					0		무관	무관			생산/제조
1897	샘표식품	중견기업			서울 중구, 경기 이천시, 충북 영동군, 충북 청주시 흥덕구			0		무관	무관			생산/제조
1898	한덕화학	대기업			울산 남구			0		무관	무관			생산/제조
1899	orskorea	외국계기업			경기 부천시 원미구			0		무관	무관			생산/제조
1900	동국제강	중견기업			충남 당진시			0		무관	무관			생산/제조
1901	주식회사 에이펙솔루션	중견기업	생산/제조					0		무관	무관			생산/제조
1902	효림그룹	중견기업		XE_품질보증팀	서울 강남구, 대구 달서구, 경북 경산시, 경남 창원시 성산구, 경북 경산시			0		무관	무관			생산/제조
1903	현대엠시트	대기업			충남 아산시			0		무관	무관			생산/제조
1904	주식회사 에이펙솔루션	중견기업	생산/제조					0		무관	무관			생산/제조
1905	LG화학	대기업			전남 여수시			0		무관	무관			생산/제조
1906	쎄믹스	중소기업			경기 광주시			0		무관	무관			생산/제조
1907	주식회사 인터엑스	스타트업			서울 금천구			0		무관	무관			생산/제조
1908	주식회사 인터엑스	스타트업			울산 중구			0		무관	무관			생산/제조
1909	SK ON	대기업			대전 유성구			0		무관	무관			생산/제조
1910	에어리퀴드코리아	중견기업			서울 강남구	전문학사	화학 계열	0		무관	무관	2,3년제 전문대 화학/ 화학공학 관련 전공 졸업자		생산/제조
1911	아모텍	중견기업			인천 남동구, 경기 수원시 영통구, 경기 평택시, 경기 김포시, 충남 천안시 서북구			0		무관	무관			생산/제조
1912	마니커에프앤지	중소기업			경기 용인시 처인구, 서울 송파구			0		무관	무관			생산/제조
1913	DaeSang America USA, Inc.	중견기업	생산/제조					0		무관	무관			생산/제조
1914	SB America Inc	중견기업	무역/유통, 생산/제조					0		무관	무관			생산/제조
1915	태양연마	중견기업			무역/유통, 영업/고객상담, 경영/사무, 생산/제조, 연구개발/설계, IT/인터넷			0		무관	무관			생산/제조
1916	하나마이크론	중견기업		반도체 공정기술엔지니어	충남 아산시			0		무관	무관			생산/제조
1917	(주)미미박스	외국계기업			서울 강남구			0		무관	무관			생산/제조
1918	세스코	중견기업						0		무관	무관			생산/제조
1919	삼전순약공업	중소기업			서울 강남구, 충북 진천군, 경북 포항시 남구, 대전 유성구, 서울 영등포구			0		무관	무관			생산/제조
1920	LSP USA, LLC	기타			IT/인터넷, 연구개발/설계, 생산/제조			0		무관	무관			생산/제조
1921	LSP USA, LLC	기타	생산/제조, IT/인터넷					0		무관	무관			생산/제조
1922	KSM	중견기업			경기 김포시			0		무관	무관			생산/제조
1923	에어퍼스트	중견기업		부천공장 오퍼레이터	경기 평택시, 경기 부천시 원미구, 경북 포항시 남구, 충남 서산시, 경기 용인시 기흥구			0		무관	무관			생산/제조
1924	EEW코리아	외국계기업			경남 사천시			0		무관	무관			생산/제조
1925	머크코리아	외국계기업			경기 시흥시			0		무관	무관			생산/제조
1926	엠케이에스코리아	외국계기업			경기 용인시 기흥구			0		무관	무관			생산/제조
1927	헨켈코리아	외국계기업		Production Administration Intern - 1year GDP	인천 연수구			0		무관	무관	At least a 4th year undergraduate student is required Excellent command of MS office is required utilizing macros is preferred Native proficiency in Korean and basic English skills are required Good communication skills are preferred Able to work for one year at the Songdo plant	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1928	헨켈코리아	외국계기업		Quality Intern_Eumseong				0		무관	무관	At least a 3rd year undergraduate student in Engineering, Chemistry, or a related field is required  Excellent command of MS Office is required  Native proficiency in Korean and basic English skills are required  Good communication skills are preferred	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1930	한솔섬유	대기업	생산/제조	국내원단생산팀		전문학사		3		무관	무관	1. 학력: 2년제 대학 졸업(예정) 이상 2. 전공: 무관 3. 어학: 당사 어학기준 충족 4. 경력: 신입 또는 3년 이하  필수) 운전면허 소지자 및 운전가능하신 분		생산/제조
1931	앰코테크놀로지코리아	중견기업			인천 연수구, 인천 계양구			0		무관	무관			생산/제조
1932	POSCO AAPC LLC.	대기업						0		무관	무관			생산/제조
1933	SEOHAN AUTO GEORGIA	중견기업	무역/유통, 생산/제조, 마케팅/광고/홍보, 경영/사무, 영업/고객상담					0		무관	무관			생산/제조
1934	Seoyon E-hwa Interior Systems Alabama	중견기업	무역/유통, 생산/제조, 경영/사무					0		무관	무관			생산/제조
1935	LG CNS	대기업		공정물류	서울 강서구			5		무관	무관	기구/설계/전장/제어의 경력이 5년 이상 있으신 분  물류 센터 설비, 레이아웃/장비 설계/이행 경력이 5년 이상 있으신 분  2차 전지 물류/클린 공정 물류 설계/이행 경력이 5년이상 있으신 분	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1936	Sinjin Texas	중소기업	생산/제조, 무역/유통					0		무관	무관			생산/제조
1937	서연이화	대기업	생산/제조					0		무관	무관			생산/제조
1938	보쉬렉스로스코리아	외국계기업			부산 강서구			0		무관	무관			생산/제조
1939	주식회사 인터엑스	스타트업			대구 수성구			0		무관	무관			생산/제조
1940	한솔섬유	중견기업			서울 송파구	전문학사		3		무관	무관	1. 학력: 2년제 대학 졸업(예정) 이상 2. 전공: 무관 3. 경력: 신입 또는 3년 이하 4. 담당 업무: 원단 생산관리  원단 관련 오더관리  원단 오더관련 개발/기획/품질관리		생산/제조
1941	타이코에이엠피	외국계기업			경북 경산시			0		무관	무관	QIP, SAP, TARS  공정 및 제품(도면) 이해  제품추적 및 봉쇄조치  변경점 관리 및 절차숙지	[전형 안내]\n서류전형 - 면접전형 - 최종합격	생산/제조
1942	램리서치코리아	외국계기업		Process Technician for KTC R&D Center	경기 용인시 기흥구			0		무관	무관			생산/제조
1943	한국쓰리엠	중견기업			경기 화성시			0		무관	무관			생산/제조
1944	헨켈코리아	외국계기업			서울 마포구			0		무관	무관			생산/제조
1945	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관	기간계약직 포지션(1년 계약직)		생산/제조
1946	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관			생산/제조
1947	셰플러코리아	외국계기업			전북특별자치도 전주시 덕진구			0		무관	무관			생산/제조
1948	JCS Systems, Inc	기타	무역/유통, 생산/제조					0		무관	무관			생산/제조
1949	세스코	중견기업				고졸		0		무관	무관	학력 : 고등학교 졸업 이상 경력 : 무관 잔업, 특근 가능한 자 (월 평균 1~3회) 해외여행에 결격 사유가 없는 자 ❖ 채용절차 서류전형 → 1차면접 → 최종합격 ※ 해당 공고는 채용 완료 시 조기 마감될 수 있습니다.		생산/제조
1950	Simwon NA Corp.	중견기업						0		무관	무관			생산/제조
1951	DAS North America, Inc.	중견기업						0		무관	무관			생산/제조
1952	유한화학	중견기업		생산부문	경기 안산시 단원구, 경기 화성시			0		무관	무관			생산/제조
1953	블랭크코퍼레이션	중소기업			서울 강남구			0	영어 성적 요구	무관	무관	리빙 카테고리에 관심이 많은 분 프로세스가 강하고 글로벌 소싱 업무를 체계적으로 배우고 싶으신 분 제2외국어 (영어 & 중국어)에 강점이 있으신 분 논리를 기반으로 한 커뮤니케이션이 가능하신 분 유연한 사고방식과 수용성이 뛰어나신 분		생산/제조
1954	AJIN/Wooshin USA	중견기업						0		무관	무관			생산/제조
1955	한솔섬유	중견기업	생산/제조					0		무관	무관			생산/제조
1956	언브릿지 주식회사	스타트업			대구 서구			0		무관	무관			생산/제조
1957	엘비세미콘	중견기업		TEST제품기술2팀	경기 안성시	학사	전자 계열	0		무관	무관	학력: 대졸 이상(4년) 전공: 반도체, 전자, 기계, 컴퓨터, 통신 공학과		생산/제조
1958	쌤소나이트코리아	중견기업		Sales Inventory Planning Coordinator (6개월 인턴)	서울 강남구	학사		0		무관	무관	4년제 학사 학위 이상 소지자 (졸업예정자 및 수료자 포함)		생산/제조
1959	아진조지아	대기업	생산/제조					0		무관	무관			생산/제조
1960	네패스아크	중견기업						0		무관	무관			생산/제조
1961	올라까삐딴	중소기업			서울 서대문구			0		무관	무관			생산/제조
1962	삼양제분	중소기업			강원특별자치도 원주시			0		무관	무관			생산/제조
1963	Hwashin America Corp.	중소기업						0		무관	무관			생산/제조
1964	한솔섬유	중견기업	생산/제조					0		무관	무관			생산/제조
1965	인터코스코리아	중소기업			경기 오산시			0		무관	무관			생산/제조
1966	가람	중소기업						0		무관	무관			생산/제조
1967	SK키파운드리	대기업			충북 청주시 흥덕구			0		무관	무관			생산/제조
1968	TeaAroma, Inc.	외국계기업	생산/제조					0		무관	무관			생산/제조
1969	Daesang America Inc (대상그룹 미국현지법인)	대기업			연구개발/설계, 생산/제조			0		무관	무관			생산/제조
1970	네패스아크	중견기업	생산/제조					0		무관	무관			생산/제조
1971	Ajin USA, Inc	중견기업	생산/제조					0		무관	무관			생산/제조
1972	크나우프석고보드	중견기업			충남 당진시			0		무관	무관			생산/제조
1973	휴온스메디텍	중소기업			경기 성남시 중원구	학사	전기 계열	2		무관	무관	학력 : 대졸 이상 (2,3년) 경력 : 신입/경력(2년 이내) 전공 : 전기/전자공학, 기계, 자동차 공학계열 운전면허증 소지자 의사소통능력, 긍정적인 마인드, 책임감 있는 사람, 문제해결능력, 지속적인 자기개발	[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	생산/제조
1974	쿠팡로지스틱스서비스	대기업			인천 남동구, 경기 고양시 덕양구, 경기 김포시, 충북 진천군, 경기 광주시			0		무관	무관	학력/연령/성별 무관  엑셀 활용 가능자		생산/제조
1975	쎄믹스	중소기업			경기 광주시			0		무관	무관		[전형절차]\n서류 전형 - 면접 전형 - 최종 합격	생산/제조
\.


--
-- Name: applicants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applicants_id_seq', 1296, true);


--
-- Name: certifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.certifications_id_seq', 1569, true);


--
-- Name: companies_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_company_id_seq', 1, false);


--
-- Name: job_postings_posting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_postings_posting_id_seq', 1, false);


--
-- Name: jobs_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_job_id_seq', 1, false);


--
-- Name: recruit_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recruit_qualifications_id_seq', 1975, true);


--
-- Name: applicants applicants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicants
    ADD CONSTRAINT applicants_pkey PRIMARY KEY (id);


--
-- Name: certifications certifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_id);


--
-- Name: job_postings job_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings
    ADD CONSTRAINT job_postings_pkey PRIMARY KEY (posting_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);


--
-- Name: recruit_qualifications recruit_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recruit_qualifications
    ADD CONSTRAINT recruit_qualifications_pkey PRIMARY KEY (id);


--
-- Name: ix_companies_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_companies_company_id ON public.companies USING btree (company_id);


--
-- Name: ix_job_postings_posting_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_job_postings_posting_id ON public.job_postings USING btree (posting_id);


--
-- Name: ix_jobs_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_jobs_job_id ON public.jobs USING btree (job_id);


--
-- Name: certifications certifications_applicant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_applicant_id_fkey FOREIGN KEY (applicant_id) REFERENCES public.applicants(id);


--
-- Name: job_postings job_postings_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings
    ADD CONSTRAINT job_postings_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(company_id);


--
-- Name: job_postings job_postings_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings
    ADD CONSTRAINT job_postings_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);


--
-- PostgreSQL database dump complete
--

