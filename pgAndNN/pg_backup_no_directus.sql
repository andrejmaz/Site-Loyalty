--
-- PostgreSQL database dump
--

\restrict EQxVvecfPd15kb3pVLECSZtWq1Uphx0CTCVITO29br2jbZagcNxlqSJPxlTdtJv

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-2.pgdg13+1)

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
-- Name: point_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.point_transactions (
    id integer NOT NULL,
    created_at timestamp with time zone,
    user_id integer,
    amount integer,
    transaction_type character varying(255),
    description text,
    task_id integer,
    user_task_id integer
);


ALTER TABLE public.point_transactions OWNER TO postgres;

--
-- Name: point_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.point_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.point_transactions_id_seq OWNER TO postgres;

--
-- Name: point_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.point_transactions_id_seq OWNED BY public.point_transactions.id;


--
-- Name: store_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_items (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    internal_id character varying(255) NOT NULL,
    title character varying(255),
    main_photo character varying(255),
    photo_2 character varying(255),
    photo_3 character varying(255),
    photo_4 character varying(255),
    ratings_num character varying(255),
    rating character varying(255),
    sizes character varying(255),
    category character varying(255),
    male character varying(255),
    old_price character varying(255),
    price character varying(255)
);


ALTER TABLE public.store_items OWNER TO postgres;

--
-- Name: store_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_items_id_seq OWNER TO postgres;

--
-- Name: store_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_items_id_seq OWNED BY public.store_items.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    points integer NOT NULL,
    is_one_time boolean DEFAULT true,
    is_active boolean DEFAULT false NOT NULL,
    monthly_limit integer,
    verification_type character varying(255) DEFAULT 'manual'::character varying,
    icon_url character varying(255),
    index integer,
    system_name character varying(25) DEFAULT NULL::character varying NOT NULL
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_id_seq OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: user_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tasks (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer NOT NULL,
    task_id integer NOT NULL,
    status character varying(60) NOT NULL,
    points_awarded integer,
    completed_at timestamp with time zone,
    verified_at timestamp with time zone,
    comment text,
    salebot_order_id bigint,
    additional_data json
);


ALTER TABLE public.user_tasks OWNER TO postgres;

--
-- Name: user_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_tasks_id_seq OWNER TO postgres;

--
-- Name: user_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_tasks_id_seq OWNED BY public.user_tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    first_name character varying(60),
    last_name character varying(60),
    tg_id bigint NOT NULL,
    tg_username character varying(60),
    avatar character varying(255),
    card_balance integer DEFAULT 0 NOT NULL,
    level character varying(60) DEFAULT 'bronze'::character varying NOT NULL,
    sb_id bigint,
    partner_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wheel_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wheel_requests (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id bigint,
    user_ip character varying(255),
    unic_review boolean,
    unic_purchase boolean,
    status character varying(255) DEFAULT 'new'::character varying,
    prize character varying(255),
    marketplace character varying(255),
    user_phone character varying(255),
    review_url character varying(255),
    purchase_url character varying(255)
);


ALTER TABLE public.wheel_requests OWNER TO postgres;

--
-- Name: wheel_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wheel_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wheel_requests_id_seq OWNER TO postgres;

--
-- Name: wheel_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wheel_requests_id_seq OWNED BY public.wheel_requests.id;


--
-- Name: point_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_transactions ALTER COLUMN id SET DEFAULT nextval('public.point_transactions_id_seq'::regclass);


--
-- Name: store_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_items ALTER COLUMN id SET DEFAULT nextval('public.store_items_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: user_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tasks ALTER COLUMN id SET DEFAULT nextval('public.user_tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wheel_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wheel_requests ALTER COLUMN id SET DEFAULT nextval('public.wheel_requests_id_seq'::regclass);


--
-- Data for Name: point_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.point_transactions (id, created_at, user_id, amount, transaction_type, description, task_id, user_task_id) FROM stdin;
87	2025-10-04 15:42:12.74469+00	34	20	task_reward	Ежедневный бонус	8	120
88	2025-10-04 15:42:15.636465+00	34	50	task_reward	Подписка на TG-канал	4	121
89	2025-10-04 15:44:03.159459+00	34	50	task_reward	Подписка на Instagram	3	122
90	2025-10-04 15:49:43.613283+00	34	200	task_reward	Кешбэк на покупку	2	123
91	2025-10-04 18:31:35.172457+00	34	100	task_reward	Пригласить друга	6	124
92	2025-10-04 18:32:47.484487+00	35	20	task_reward	Ежедневный бонус	8	125
93	2025-10-05 15:24:26.500957+00	34	20	task_reward	Ежедневный бонус	8	127
94	2025-10-08 09:20:04.968852+00	35	250	task_reward	Бонус за отзыв	5	126
95	2025-10-10 19:54:25.697304+00	39	20	task_reward	Ежедневный бонус	8	128
96	2025-10-10 19:54:49.857769+00	39	50	task_reward	Подписка на TG-канал	4	129
\.


--
-- Data for Name: store_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_items (id, created_at, internal_id, title, main_photo, photo_2, photo_3, photo_4, ratings_num, rating, sizes, category, male, old_price, price) FROM stdin;
292	2025-09-30 16:58:16.844322+00	T011	Футболка с цепочкой на груди	https://i.postimg.cc/mrWMX4MX/T011-1.jpg	https://i.postimg.cc/vZVftT1x/T011-2.jpg	https://i.postimg.cc/yYWFWvsP/T011-3.jpg	https://i.postimg.cc/RV8wtK0z/T011-4.jpg	\N	4.7	S-3XL	Футболки		2 100	693
293	2025-09-30 16:58:16.844322+00	F035	Футболка с принтом на груди	https://i.postimg.cc/4dDmdb58/F035-1.jpg	https://i.postimg.cc/wTd1Y23M/F035-2.jpg	https://i.postimg.cc/SRcjz21m/F035-3.jpg	https://i.postimg.cc/RCtWYyS2/F035-4.jpg	\N	4.7	XS-3XL	Футболки		2 500	1 250
294	2025-09-30 16:58:16.844322+00	A182	Футболка с v-образным вырезом	https://i.postimg.cc/9FpQ5jvg/A182-1.jpg	https://i.postimg.cc/RZpChLCc/A182-2.jpg	https://i.postimg.cc/bN8wBvF2/A182-3.jpg	https://i.postimg.cc/Gmmhb5RL/A182-4.jpg	\N	4.8	S-3XL	Футболки		2 670	1 335
295	2025-09-30 16:58:16.844322+00	0702	Футболка плотная с надписью	https://i.postimg.cc/TYWJCCFP/0702-1.jpg	https://i.postimg.cc/sxb93hQy/0702-2.jpg	https://i.postimg.cc/RZ5Q8wxL/0702-3.jpg	https://i.postimg.cc/v8KvrpPj/0702-4.jpg	\N	4.8	S-5XL	Футболки		2 790	1 981
296	2025-09-30 16:58:16.844322+00	33613	Футболка поло с коротким рукавом	https://i.postimg.cc/PJqp0rSH/33613-1.jpg	https://i.postimg.cc/ZR4yFL3C/33613-2.jpg	https://i.postimg.cc/jjz771Dp/33613-3.jpg	https://i.postimg.cc/G2KTMsJz/33613-4.jpg	\N	4.7	XS-5XL	Футболки поло		3 000	2 100
297	2025-09-30 16:58:16.844322+00	33630	Футболка поло с коротким рукавом	https://i.postimg.cc/vTzB8RSz/33613-1.jpg	https://i.postimg.cc/9My0Swds/33613-2.jpg	https://i.postimg.cc/Xq3q0Nxq/33613-3.jpg	https://i.postimg.cc/FFg1VcsL/33613-4.jpg	\N	4.6	XS-5XL	Футболки поло		2 693	1 885
298	2025-09-30 16:58:16.844322+00	335016	Футболка поло в полоску	https://i.postimg.cc/wM3PMLwG/335016-1.jpg	https://i.postimg.cc/T1SsD1SY/335016-2.jpg	https://i.postimg.cc/DzdRM2WB/335016-3.jpg	https://i.postimg.cc/260MC27W/335016-4.jpg	\N	4.8	S-5XL	Футболки поло		2 978	2 085
299	2025-09-30 16:58:16.844322+00	2112	Футболка поло с коротким рукавом	https://i.postimg.cc/bwFRYW7p/2112-1.jpg	https://i.postimg.cc/g0XHx4pR/2112-2.jpg	https://i.postimg.cc/q7PXynBF/2112-3.jpg	https://i.postimg.cc/ZR6PcRC5/2112-4.jpg	\N	4.9	XS-5XL	Футболки поло		2 280	1 573
300	2025-09-30 16:58:16.844322+00	33506	Футболка поло с коротким рукавом	https://i.postimg.cc/PfWNQ7Qy/33506-1.jpg	https://i.postimg.cc/J05n7yzv/33506-2.jpg	https://i.postimg.cc/MKzHPYsS/33506-3.jpg	https://i.postimg.cc/qMQR9CYC/33506-4.jpg	\N	4.8	XS-5XL	Футболки поло		3 589	2 476
301	2025-09-30 16:58:16.844322+00	336108	Футболка поло с коротким рукавом	https://i.postimg.cc/YSFtq4XR/336108-1.jpg	https://i.postimg.cc/2SMzDdx3/336108-2.jpg	https://i.postimg.cc/zB18LJ6r/336108-3.jpg	https://i.postimg.cc/9MtVZ6Hq/336108-4.jpg	\N	4.8	XS-5XL	Футболки поло		3 400	2 380
302	2025-09-30 16:58:16.844322+00	1236	Футболка поло с коротким рукавом	https://i.postimg.cc/C1JXFSVJ/1236-1.jpg	https://i.postimg.cc/FzRqz8rv/1236-2.jpg	https://i.postimg.cc/50fDdjD6/1236-3.jpg	https://i.postimg.cc/d02gxGHb/1236-4.jpg	\N	4.8	XS-3XL	Футболки поло		5 005	1 502
303	2025-09-30 16:58:16.844322+00	PL1105	Футболка поло с коротким рукавом	https://i.postimg.cc/s2tfzPsw/PL1105-1.jpg	https://i.postimg.cc/MHYz1hRF/PL1105-2.jpg	https://i.postimg.cc/NFtg9gyX/PL1105-3.jpg	https://i.postimg.cc/bJkywGv8/PL1105-4.jpg	\N	4.3	XS-3XL	Футболки поло		5 005	1 652
304	2025-09-30 16:58:16.844322+00	PL1205	Футболка поло с коротким рукавом	https://i.postimg.cc/Hsq4KR7N/PL1205-1.jpg	https://i.postimg.cc/tg53sgm0/PL1205-2.jpg	https://i.postimg.cc/t4FtHk34/PL1205-3.jpg	https://i.postimg.cc/q70cBKwX/PL1205-4.jpg	\N	4.5	XS-3XL	Футболки поло		5 005	1 652
305	2025-09-30 16:58:16.844322+00	TR2105	Футболка поло с длинным рукавом	https://i.postimg.cc/sxF78ZMh/TR2105-1.jpg	https://i.postimg.cc/SKs6z40J/TR2105-2.jpg	https://i.postimg.cc/KYHnPWFQ/TR2105-3.jpg	https://i.postimg.cc/yd30vT8K/TR2105-4.jpg	\N	4.8	XS-3XL	Футболки поло		10 010	3 003
306	2025-09-30 16:58:16.844322+00	TR2701	Футболка поло с коротким рукавом	https://i.postimg.cc/PqpLj5sz/TR2701-1.jpg	https://i.postimg.cc/6Qk85xBs/TR2701-2.jpg	https://i.postimg.cc/vZmg0v0K/TR2701-3.jpg	https://i.postimg.cc/cL5K28jL/TR2701-4.jpg	\N	4.5	XS-3XL	Футболки поло		5 005	1 502
307	2025-09-30 16:58:16.844322+00	TR2702	Футболка поло с коротким рукавом	https://i.postimg.cc/x1q8v1CD/TR2702-1.jpg	https://i.postimg.cc/0Q1N1GCP/TR2702-2.jpg	https://i.postimg.cc/JhkhFYZp/TR2702-3.jpg	https://i.postimg.cc/rwbmQ20d/TR2702-4.jpg	\N	4.7	XS-3XL	Футболки поло		5 005	2 102
308	2025-09-30 16:58:16.844322+00	TR2703	Футболка поло с коротким рукавом	https://i.postimg.cc/7L0x9Grc/TR2703-1.jpg	https://i.postimg.cc/pTvP6W2d/TR2703-2.jpg	https://i.postimg.cc/6pDWCVgn/TR2703-3.jpg	https://i.postimg.cc/mDSTxvDy/TR2703-4.jpg	\N	4.6	XS-3XL	Футболки поло		5 005	1 502
309	2025-09-30 16:58:16.844322+00	TR3105	Футболка поло с коротким рукавом	https://i.postimg.cc/0j33hnpC/TR3105-1.jpg	https://i.postimg.cc/4dWjQsyq/TR3105-2.jpg	https://i.postimg.cc/kGDzjzt4/TR3105-3.jpg	https://i.postimg.cc/1tmLFfmD/TR3105-4.jpg	\N	4.8	XS-3XL	Футболки поло		5 005	1 902
310	2025-09-30 16:58:16.844322+00	TR3205	Футболка поло с длинным рукавом	https://i.postimg.cc/HsyPVQwf/TR3205-1.jpg	https://i.postimg.cc/T1Z7tw67/TR3205-2.jpg	https://i.postimg.cc/qvHDnzQg/TR3205-3.jpg	https://i.postimg.cc/mZq5LdHY/TR3205-4.jpg	\N	4.5	XS-3XL	Футболки поло		5 005	2 903
311	2025-09-30 16:58:16.844322+00	TR3510	Футболка поло с коротким рукавом	https://i.postimg.cc/R0sjcvN8/TR3510-1.jpg	https://i.postimg.cc/g2dFpMCM/TR3510-2.jpg	https://i.postimg.cc/7ZVvZ3Dq/TR3510-3.jpg	https://i.postimg.cc/q7MPhNMy/TR3510-4.jpg	\N	4.9	XS-3XL	Футболки поло		10 010	1 502
312	2025-09-30 16:58:16.844322+00	TR5510	Футболка поло с коротким рукавом	https://i.postimg.cc/LsbbJvWF/TR5510-1.jpg	https://i.postimg.cc/k54HMLfy/TR5510-2.jpg	https://i.postimg.cc/8zw3STB5/TR5510-3.jpg	https://i.postimg.cc/PxvFYYGp/TR5510-4.jpg	\N	4.8	XS-3XL	Футболки поло		10 005	2 001
313	2025-09-30 16:58:16.844322+00	1624	Футболка поло с коротким рукавом	https://i.postimg.cc/KYMn5Nz2/1624-1.jpg	https://i.postimg.cc/0QGDTyDX/1624-2.jpg	https://i.postimg.cc/3RQ2fv4D/1624-3.jpg	https://i.postimg.cc/QCX1hZq8/1624-4.jpg	\N	4.7	XS-3XL	Футболки поло		2 220	888
314	2025-09-30 16:58:16.844322+00	D968	Кроссовки летние на высокой подошве	https://i.postimg.cc/PJPfm6Xb/D968-1.jpg	https://i.postimg.cc/BbkSNxbr/D968-2.jpg	https://i.postimg.cc/gcT2YPsg/D968-3.jpg	https://i.postimg.cc/5NQNykkb/D968-4.jpg	\N	4.7	23см, 23, 7см, 24, 3см, 25см, 25, 7см, 26, 3см, 27см, 27, 7см, 28, 3СМ, 29см, 29, 7см, 30, 2	Кроссовки		7 582	3 791
315	2025-09-30 16:58:16.844322+00	F1150	Кроссовки летние на высокой подошве	https://i.postimg.cc/Pq7ddWzP/F1150-1.jpg	https://i.postimg.cc/C5TYqw20/F1150-2.jpg	https://i.postimg.cc/cH80CvXT/F1150-3.jpg	https://i.postimg.cc/kGQCNkrb/F1150-4.jpg	\N	4.5	36-46	Кроссовки		10 000	5 000
316	2025-09-30 16:58:16.844322+00	L2244	Кроссовки демисезонные	https://i.postimg.cc/nz1TvkRL/L2244-1.jpg	https://i.postimg.cc/9fZLfVyZ/L2244-2.jpg	https://i.postimg.cc/7hY9X2dn/L2244-3.jpg	https://i.postimg.cc/HxmBcKtK/L2244-4.jpg	\N	4.7	41-46	Кроссовки		10 005	5 003
317	2025-09-30 16:58:16.844322+00	1515	Кроссовки летние на высокой подошве	https://i.postimg.cc/FF7TB2Ky/1515-1.jpg	https://i.postimg.cc/44qWkBKr/1515-2.jpg	https://i.postimg.cc/3JGnKmmW/1515-3.jpg	https://i.postimg.cc/Z5hj0nxH/1515-4.jpg	\N	4.4	41-46	Кроссовки		7 000	2 520
318	2025-09-30 16:58:16.844322+00	1305	Кроссовки летние на высокой подошве	https://i.postimg.cc/mkLBbB6g/1305-1.jpg	https://i.postimg.cc/RFQv5NdY/1305-2.jpg	https://i.postimg.cc/FzTmz82g/1305-3.jpg	https://i.postimg.cc/ZYHJwvCB/1305-4.jpg	\N	4.7	36-47	Кроссовки		7 150	3 647
319	2025-09-30 16:58:16.844322+00	44708	Водолазка с горлом	https://i.postimg.cc/C5stx8n3/44708-1.jpg	https://i.postimg.cc/8Pw98hSW/44708-2.jpg	https://i.postimg.cc/7P3jVFtK/44708-3.jpg	https://i.postimg.cc/m2TJ6m0B/44708-4.jpg	\N	4.8	2XS-5XL	Водолазки & Джемперы		6 000	1 920
320	2025-09-30 16:58:16.844322+00	V2208	Водолазка с горлом	https://i.postimg.cc/L8tq66xz/V2208-1.jpg	https://i.postimg.cc/htWzB71D/V2208-2.jpg	https://i.postimg.cc/0NZbDXRj/V2208-3.jpg	https://i.postimg.cc/fbMV3nP1/V2208-4.jpg	\N	4.8	XS-5XL	Водолазки & Джемперы		5 000	2 150
321	2025-09-30 16:58:16.844322+00	66708	Джемпер с воротником на молнии	https://i.postimg.cc/R0bJ2pP8/66708-1.jpg	https://i.postimg.cc/3R40hjVw/66708-2.jpg	https://i.postimg.cc/Pxgp5pnQ/66708-3.jpg	https://i.postimg.cc/Zn69BbTt/66708-4.jpg	\N	4.3	XS-3XL	Водолазки & Джемперы		5 005	2 903
322	2025-09-30 16:58:16.844322+00	33708	Джемпер тонкий 	https://i.postimg.cc/85SgkNnr/33708-1.jpg	https://i.postimg.cc/J07wJK8r/33708-2.jpg	https://i.postimg.cc/FzTMxcFj/33708-3.jpg	https://i.postimg.cc/Y9zKhZJD/33708-4.jpg	\N	4.8	2XS-5XL	Водолазки & Джемперы		6 000	3 060
323	2025-09-30 16:58:16.844322+00	99308	Джемпер тонкий 	https://i.postimg.cc/fR9PV1d7/99308-1.jpg	https://i.postimg.cc/hGR5TM8k/99308-2.jpg	https://i.postimg.cc/zXMMXqyX/99308-3.jpg	https://i.postimg.cc/jdCmbDdF/99308-4.jpg	\N	4.8	2XS-5XL	Водолазки & Джемперы		6 000	2 760
324	2025-09-30 16:58:16.844322+00	11708	Джемпер с воротником на молнии	https://i.postimg.cc/KvLVzdBP/11708-1.jpg	https://i.postimg.cc/fRfr7mHk/11708-2.jpg	https://i.postimg.cc/13QdNJrL/11708-3.jpg	https://i.postimg.cc/9fXNL0Sb/11708-4.jpg	\N	4.8	XS-5XL	Водолазки & Джемперы		6 999	3 290
325	2025-09-30 16:58:16.844322+00	55708	Джемпер с воротником на молнии	https://i.postimg.cc/qRshgBBf/55708-1.jpg	https://i.postimg.cc/sD6BMNz2/55708-2.jpg	https://i.postimg.cc/NFbK7Nrp/55708-3.jpg	https://i.postimg.cc/jddwdrG9/55708-4.jpg	\N	4.7	XS-5XL	Водолазки & Джемперы		7 001	2 380
326	2025-09-30 16:58:16.844322+00	77308	Джемпер тонкий 	https://i.postimg.cc/6pZ9Bj5g/77308-1.jpg	https://i.postimg.cc/Qt8skjkZ/77308-2.jpg	https://i.postimg.cc/5tMfyBX0/77308-3.jpg	https://i.postimg.cc/1zcsq8FK/77308-4.jpg	\N	4.8	2XS-5XL	Водолазки & Джемперы		6 000	3 420
327	2025-09-30 16:58:16.844322+00	5231	Лонгслив с принтом	https://i.postimg.cc/yYXMjMxV/5231-1.jpg	https://i.postimg.cc/yYHqF1VQ/5231-2.jpg	https://i.postimg.cc/cLxVbFtf/5231-3.jpg	https://i.postimg.cc/KcLSkky3/5231-4.jpg	\N	4.4	S-2XL	Водолазки & Джемперы		5 005	3 954
328	2025-09-30 16:58:16.844322+00	2191	Рубашка на кнопках	https://i.postimg.cc/ZqGbCjmB/2191-1.jpg	https://i.postimg.cc/d1GqddQW/2191-2.jpg	https://i.postimg.cc/MGMZ6NCJ/2191-3.jpg	https://i.postimg.cc/Z5DKh4DL/2191-4.jpg	\N	4.7	XS-4XL	Рубашки & Пиджаки		10 010	1 902
329	2025-09-30 16:58:16.844322+00	GS01	Рубашка с коротким рукавом	https://i.postimg.cc/T3yvgmCr/GS01-1.jpg	https://i.postimg.cc/SshBBPqr/GS01-2.jpg	https://i.postimg.cc/wjS8VvGn/GS01-3.jpg	https://i.postimg.cc/BvHWw3Wb/GS01-4.jpg	\N	4.8	S-2XL	Рубашки & Пиджаки		7 005	2 662
330	2025-09-30 16:58:16.844322+00	TD510	Рубашка с коротким рукавом	https://i.postimg.cc/MKmgB57M/TD510-1.jpg	https://i.postimg.cc/GhCZ9Vyn/TD510-2.jpg	https://i.postimg.cc/3xrVFG1L/TD510-3.jpg	https://i.postimg.cc/SKJPwpwC/TD510-4.jpg	\N	4.6	S-2XL	Рубашки & Пиджаки		10 010	1 401
331	2025-09-30 16:58:16.844322+00	jac00	Пиджак классический	https://i.postimg.cc/26P34rfw/jac00-1.jpg	https://i.postimg.cc/G2BH896t/jac00-2.jpg	https://i.postimg.cc/PJYJy9Xk/jac00-3.jpg	https://i.postimg.cc/h4dXKz93/jac00-4.jpg	\N	4.8	XS-4XL	Рубашки & Пиджаки		5 905	5 846
332	2025-09-30 16:58:16.844322+00	jac01	Пиджак классический	https://i.postimg.cc/xCKV42zg/jac01-1.jpg	https://i.postimg.cc/2yGRC7TZ/jac01-2.jpg	https://i.postimg.cc/Hnd1Gh0m/jac01-3.jpg	https://i.postimg.cc/fWfh7MZR/jac01-4.jpg	\N	4.4	XS-4XL	Рубашки & Пиджаки		5 605	5 549
333	2025-09-30 16:58:16.844322+00	9428	Свитшот с логотипом	https://i.postimg.cc/KzX1dB9b/9428-1.jpg	https://i.postimg.cc/Kzn1FjVM/9428-2.jpg	https://i.postimg.cc/L5DhY7m4/9428-3.jpg	https://i.postimg.cc/D0n8zFkY/9428-4.jpg	\N	4.7	XS-5XL	Свитшоты & Худи		6 000	3 180
334	2025-09-30 16:58:16.844322+00	80577	Свитшот флисовый на молнии	https://i.postimg.cc/Qd1Gf7W1/80577-1.jpg	https://i.postimg.cc/5NZW5gjf/80577-2.jpg	https://i.postimg.cc/PrLk89X6/80577-3.jpg	https://i.postimg.cc/fWqNyDNt/80577-4.jpg	\N	–	XS-3XL	Свитшоты & Худи		10 010	4 004
335	2025-09-30 16:58:16.844322+00	BL2202	Свитшот без начеса на молнии	https://i.postimg.cc/Y9SPBLjX/BL2202-1.jpg	https://i.postimg.cc/fLgrzW9M/BL2202-2.jpg	https://i.postimg.cc/8cJnj8RM/BL2202-3.jpg	https://i.postimg.cc/906g9xbS/BL2202-4.jpg	\N	5.0	XS-3XL	Свитшоты & Худи		10 010	4 505
336	2025-09-30 16:58:16.844322+00	LN5400	Свитшот без начеса	https://i.postimg.cc/sDZgRvhD/LN5400-1.jpg	https://i.postimg.cc/054y3prB/LN5400-2.jpg	https://i.postimg.cc/8cxk6VqS/LN5400-3.jpg	https://i.postimg.cc/T3MY2fVj/LN5400-4.jpg	\N	4.7	XS-3XL	Свитшоты & Худи		5 005	3 754
337	2025-09-30 16:58:16.844322+00	F2553	Худи с капюшоном из футера	https://i.postimg.cc/yYrp08Q9/F2553-1.jpg	https://i.postimg.cc/Vkx7HHck/F2553-2.jpg	https://i.postimg.cc/dt0S7yBw/F2553-3.jpg	https://i.postimg.cc/Qd94mZwz/F2553-4.jpg	\N	4.7	S-2XL	Свитшоты & Худи		4 180	1 254
338	2025-09-30 16:58:16.844322+00	2121	Худи с капюшоном без начеса	https://i.postimg.cc/kGL8XzsV/2121-1.jpg	https://i.postimg.cc/NMfRN1L0/2121-2.jpg	https://i.postimg.cc/k41KLBtv/2121-3.jpg	https://i.postimg.cc/wM1LzgX8/2121-4.jpg	\N	3.0	XS-XL	Свитшоты & Худи		10 010	3 203
339	2025-09-30 16:58:16.844322+00	10016	Худи с капюшоном без начеса	https://i.postimg.cc/W4KJ7QR5/10016-1.jpg	https://i.postimg.cc/zvYbsKGW/10016-2.jpg	https://i.postimg.cc/rmrRZQMM/10016-3.jpg	https://i.postimg.cc/tJdZpJsc/10016-4.jpg	\N	5.0	S-3XL	Свитшоты & Худи		10 010	2 503
340	2025-09-30 16:58:16.844322+00	WT6609	Худи с капюшоном без начеса	https://i.postimg.cc/g09WqDSv/WT6609-1.jpg	https://i.postimg.cc/43zT89qj/WT6609-2.jpg	https://i.postimg.cc/Y9RB7wp3/WT6609-3.jpg	https://i.postimg.cc/fLDQ1bhy/WT6609-4.jpg	\N	5.0	XS-XL	Свитшоты & Худи		10 010	3 003
341	2025-09-30 16:58:16.844322+00	7021	Свитер рваный с принтом	https://i.postimg.cc/wBFwTxm7/7021-1.jpg	https://i.postimg.cc/d0JWYZDb/7021-2.jpg	https://i.postimg.cc/4xkLWSGN/7021-3.jpg	https://i.postimg.cc/8zRy9mkd/7021-4.jpg	\N	4.7	XS-5XL	Свитеры		5 950	4 284
342	2025-09-30 16:58:16.844322+00	71011	Свитер с горлом на молнии	https://i.postimg.cc/JzxFtQwr/71011-1.jpg	https://i.postimg.cc/HLLhM7HQ/71011-2.jpg	https://i.postimg.cc/hG331PPN/71011-3.jpg	https://i.postimg.cc/JnDY6Vs0/71011-4.jpg	\N	4.7	XS-3XL	Свитеры		5 005	3 504
343	2025-09-30 16:58:16.844322+00	ZIP15	Свитер на молнии	https://i.postimg.cc/pdqYD0kT/ZIP15-1.jpg	https://i.postimg.cc/7Z1NLP2S/ZIP15-2.jpg	https://i.postimg.cc/pTrQkD1B/ZIP15-3.jpg	https://i.postimg.cc/nLHG984g/ZIP15-4.jpg	\N	5.0	XS-3XL	Свитеры		10 010	3 003
344	2025-09-30 16:58:16.844322+00	ZIP34	Свитер на молнии	https://i.postimg.cc/MTQzJLn3/ZIP34-1.jpg	https://i.postimg.cc/cLFxRwqh/ZIP34-2.jpg	https://i.postimg.cc/VNTzTwkb/ZIP34-3.jpg	https://i.postimg.cc/3wWKnNYT/ZIP34-4.jpg	\N	5.0	XS-3XL	Свитеры		10 010	3 003
345	2025-09-30 16:58:16.844322+00	2238	Свитер рваный	https://i.postimg.cc/MHDdFWm7/2238-1.jpg	https://i.postimg.cc/PJhSyLYf/2238-2.jpg	https://i.postimg.cc/T2q7w9vK/2238-3.jpg	https://i.postimg.cc/rFVhtrqQ/2238-4.jpg	\N	–	XS-3XL	Свитеры		10 010	3 904
346	2025-09-30 16:58:16.844322+00	2552	Свитер рваный	https://i.postimg.cc/mkHFPVtt/2552-1.jpg	https://i.postimg.cc/pT7FV3Vw/2552-2.jpg	https://i.postimg.cc/DZmGT7hQ/2552-3.jpg	https://i.postimg.cc/c6GtwYnT/2552-4.jpg	\N	5.0	XS-2XL	Свитеры		10 010	4 204
347	2025-09-30 16:58:16.844322+00	6051	Свитер с принтом	https://i.postimg.cc/25LL6r3C/6051-1.jpg	https://i.postimg.cc/zBnLC7nM/6051-2.jpg	https://i.postimg.cc/HxGc8R7X/6051-3.jpg	https://i.postimg.cc/sgXZkprQ/6051-4.jpg	\N	4.8	XS-6XL	Свитеры		6 001	4 321
348	2025-09-30 16:58:16.844322+00	7052	Свитер тонкий без горла	https://i.postimg.cc/kMLJJKKR/7052-1.jpg	https://i.postimg.cc/44Y4RB7T/7052-2.jpg	https://i.postimg.cc/906N6W4z/7052-3.jpg	https://i.postimg.cc/02m8bj0W/7052-4.jpg	\N	5.0	XS-3XL	Свитеры		10 010	3 003
349	2025-09-30 16:58:16.844322+00	4490	Шорты для плавания	https://i.postimg.cc/Y2QdywrG/4490-1.jpg	https://i.postimg.cc/3J7nsbNL/4490-2.jpg	https://i.postimg.cc/Nf4pB7rQ/4490-3.jpg	https://i.postimg.cc/vZZXBgWf/4490-4.jpg	\N	4.6	XS-5XL	Шорты		4 655	1 676
350	2025-09-30 16:58:16.844322+00	BR1701	Шорты карго с карманами	https://i.postimg.cc/y6hw3RSb/BR1701-1.jpg	https://i.postimg.cc/SNyH6K6N/BR1701-2.jpg	https://i.postimg.cc/3NZVMMTT/BR1701-3.jpg	https://i.postimg.cc/hPp6pqs8/BR1701-4.jpg	\N	4.8	28-34, 36, 38, 40, 42, 44, 46, 48	Шорты		5 182	2 591
351	2025-09-30 16:58:16.844322+00	2705	Шорты карго с карманами	https://i.postimg.cc/52t0RbVf/2705-1.jpg	https://i.postimg.cc/m2Bh77pz/2705-2.jpg	https://i.postimg.cc/MprTkN6V/2705-3.jpg	https://i.postimg.cc/QxmCmVv6/2705-4.jpg	\N	4.9	28-34, 36, 38, 40, 42, 44	Шорты		3 780	1 625
352	2025-09-30 16:58:16.844322+00	1602	Шорты классические	https://i.postimg.cc/mZF67H1s/1602-1.jpg	https://i.postimg.cc/Fs5CpH0J/1602-2.jpg	https://i.postimg.cc/Nf6JzvxC/1602-3.jpg	https://i.postimg.cc/JzR6wY6r/1602-4.jpg	\N	4.7	28-34, 36, 38, 40, 42, 44	Шорты		5 005	2 152
353	2025-09-30 16:58:16.844322+00	1033	Шорты джинсовые	https://i.postimg.cc/k5RfW2fZ/1033-1.jpg	https://i.postimg.cc/FzNptDN5/1033-2.jpg	https://i.postimg.cc/Gm5XBFJG/1033-3.jpg	https://i.postimg.cc/Jnbxd9w5/1033-4.jpg	\N	4.8	28-34, 36, 38, 40, 42, 44	Шорты		6 000	2 400
354	2025-09-30 16:58:16.844322+00	1901	Шорты трикотажные	https://i.postimg.cc/gjhK6QsZ/1901-1.jpg	https://i.postimg.cc/L4gD7gS8/1901-2.jpg	https://i.postimg.cc/vHRhd88L/1901-3.jpg	https://i.postimg.cc/ZKrcYkCk/1901-4.jpg	\N	4.8	28-34, 36, 38, 40, 42, 44	Шорты		2 650	1 855
355	2025-09-30 16:58:16.844322+00	SC398	Шорты карго с карманами	https://i.postimg.cc/W150tsVy/SC398-1.jpg	https://i.postimg.cc/bvdkt4Nw/SC398-2.jpg	https://i.postimg.cc/nL57YTCY/SC398-3.jpg	https://i.postimg.cc/63vZHRZs/SC398-4.jpg	\N	4.9	28-34, 36, 38, 40, 42, 44	Шорты		3 970	2 779
356	2025-09-30 16:58:16.844322+00	2803	Брюки джоггеры карго на флисе	https://i.postimg.cc/QM0kLBtm/2803-1.jpg	https://i.postimg.cc/525S3KWZ/2803-2.jpg	https://i.postimg.cc/3wKCbjKW/2803-3.jpg	https://i.postimg.cc/gJjyGYLW/2803-4.jpg	\N	4.8	28-34, 36, 38, 40, 42, 44, 46, 48	Брюки		8 017	4 490
357	2025-09-30 16:58:16.844322+00	BR1102	Брюки джоггеры карго	https://i.postimg.cc/zGD4Tg9S/BR1102-1.jpg	https://i.postimg.cc/JzTvxh8w/BR1102-2.jpg	https://i.postimg.cc/VLW3SRHk/BR1102-3.jpg	https://i.postimg.cc/5t6GRM9X/BR1102-4.jpg	\N	4.7	27-34, 36, 38, 40, 42, 44, 46	Брюки		6 362	5 408
358	2025-09-30 16:58:16.844322+00	BR2802	Брюки джоггеры на флисе	https://i.postimg.cc/Cxyz1wXg/BR2802-1.jpg	https://i.postimg.cc/qB5NPsGg/BR2802-2.jpg	https://i.postimg.cc/d0614r1s/BR2802-3.jpg	https://i.postimg.cc/Dzn0rB7p/BR2802-4.jpg	\N	4.7	27-34, 36, 38, 40, 42, 44	Брюки		8 464	4 486
359	2025-09-30 16:58:16.844322+00	BR5202	Брюки чинос зауженные	https://i.postimg.cc/mDMTK9Z1/BR5202-1.jpg	https://i.postimg.cc/XNfV89DT/BR5202-2.jpg	https://i.postimg.cc/T16TxPh7/BR5202-3.jpg	https://i.postimg.cc/mkyBgGHb/BR5202-4.jpg	\N	4.8	27-34, 36, 38, 40, 42, 44	Брюки		6 850	3 631
360	2025-09-30 16:58:16.844322+00	SA2801	Брюки джоггеры	https://i.postimg.cc/Hnh35r53/SA2801-1.jpg	https://i.postimg.cc/85wZpKz2/SA2801-2.jpg	https://i.postimg.cc/Lsty76K6/SA2801-3.jpg	https://i.postimg.cc/cCHXrRKr/SA2801-4.jpg	\N	4.8	27-34, 36, 38, 40, 42, 44, 46	Брюки		5 817	3 258
361	2025-09-30 16:58:16.844322+00	SAD1503	Брюки карго	https://i.postimg.cc/bYsMTnNq/SAD1503-1.jpg	https://i.postimg.cc/G2NsxG7B/SAD1503-2.jpg	https://i.postimg.cc/zvgHtv6x/SAD1503-3.jpg	https://i.postimg.cc/PNnpBhkT/SAD1503-4.jpg	\N	4.7	27-34, 36, 38, 40, 42, 44, 46	Брюки		5 891	2 356
362	2025-09-30 16:58:16.844322+00	1802	Брюки джоггеры карго	https://i.postimg.cc/2SM31h63/1802-1.jpg	https://i.postimg.cc/rFhDLv21/1802-2.jpg	https://i.postimg.cc/zXDy6q6D/1802-3.jpg	https://i.postimg.cc/0ybb5c9L/1802-4.jpg	\N	4.8	28-34, 36, 38, 40, 42	Брюки		10 010	3 303
363	2025-09-30 16:58:16.844322+00	VM6865	Брюки классические зауженные 	https://i.postimg.cc/J4yLGgBc/VM6865-1.jpg	https://i.postimg.cc/y8cCTZjD/VM6865-2.jpg	https://i.postimg.cc/m20GMwYx/VM6865-3.jpg	https://i.postimg.cc/VNwQZkZD/VM6865-4.jpg	\N	4.8	28-34, 36, 38, 40, 42	Брюки		5 005	3 203
364	2025-09-30 16:58:16.844322+00	S750	Брюки джоггеры	https://i.postimg.cc/ncK6jJhm/S750-1.jpg	https://i.postimg.cc/HkpFbhrh/S750-2.jpg	https://i.postimg.cc/bNf7wJp8/S750-3.jpg	https://i.postimg.cc/2S2MG7v8/S750-4.jpg	\N	4.8	27-34, 36, 38, 40, 42, 44	Брюки		7 460	6 266
365	2025-09-30 16:58:16.844322+00	1009	Брюки джоггеры карго	https://i.postimg.cc/vmvB3jhx/1009-1.jpg	https://i.postimg.cc/HxZLCyfp/1009-2.jpg	https://i.postimg.cc/DZyzDgpj/1009-3.jpg	https://i.postimg.cc/hvXt4GBV/1009-4.jpg	\N	4.7	27-34, 36, 38, 40, 42, 44, 46	Брюки		6 850	4 247
366	2025-09-30 16:58:16.844322+00	2707	Брюки классические зауженные 	https://i.postimg.cc/xdkQb47S/2707-1.jpg	https://i.postimg.cc/g2tdjWgD/2707-2.jpg	https://i.postimg.cc/MGhS0Y2f/2707-3.jpg	https://i.postimg.cc/rmxLftMn/2707-4.jpg	\N	4.6	27-34, 36, 38, 40, 42	Брюки		5 005	3 353
367	2025-09-30 16:58:16.844322+00	6120	Брюки бананы вельветовые	https://i.postimg.cc/FRsjZ0ym/6120-1.jpg	https://i.postimg.cc/Jn6jdtxX/6120-2.jpg	https://i.postimg.cc/tJ8WpfLC/6120-3.jpg	https://i.postimg.cc/Xqr9M31z/6120-4.jpg	\N	5.0	28-34, 36, 38, 40	Брюки		10 010	1 902
368	2025-09-30 16:58:16.844322+00	3215	Джинсы прямые зауженные	https://i.postimg.cc/1z0k61H2/3215-1.jpg	https://i.postimg.cc/wMMZSypY/3215-2.jpg	https://i.postimg.cc/XJQtHKtg/3215-3.jpg	https://i.postimg.cc/KzZdDppz/3215-4.jpg	\N	4.8	27-34, 36, 38, 40, 42, 44, 46	Джинсы		5 024	4 270
369	2025-09-30 16:58:16.844322+00	BR3856	Джинсы прямые зауженные	https://i.postimg.cc/NFZJSdDR/BR3856-1.jpg	https://i.postimg.cc/cLykc5rS/BR3856-2.jpg	https://i.postimg.cc/kMHp25CD/BR3856-3.jpg	https://i.postimg.cc/BQ1wHGZp/BR3856-4.jpg	\N	4.6	27-34, 36, 38, 40, 42	Джинсы		9 999	3 600
370	2025-09-30 16:58:16.844322+00	3889	Джинсы на флисе	https://i.postimg.cc/kXKGZBXb/3889-1.jpg	https://i.postimg.cc/mZctYmvV/3889-2.jpg	https://i.postimg.cc/23Rphksp/3889-3.jpg	https://i.postimg.cc/h4Hhp9gn/3889-4.jpg	\N	4.8	27-34, 36, 38, 40, 42, 44, 46	Джинсы		9 998	3 499
371	2025-09-30 16:58:16.844322+00	1127	Джинсы широкие трубы багги	https://i.postimg.cc/WzsYvDc1/1127-1.jpg	https://i.postimg.cc/x8gxT09y/1127-2.jpg	https://i.postimg.cc/85RX9R3Y/1127-3.jpg	https://i.postimg.cc/tRzmzzFZ/1127-4.jpg	\N	4.9	28-34, 36, 38, 40, 42	Джинсы		5 005	4 004
372	2025-09-30 16:58:16.844322+00	10576	Джинсы широкие багги трубы	https://i.postimg.cc/rybR3B1v/10576-1.jpg	https://i.postimg.cc/fRQtTYgC/10576-2.jpg	https://i.postimg.cc/8cqFvvk1/10576-3.jpg	https://i.postimg.cc/J4kHLpKt/10576-4.jpg	\N	5.0	27-34, 36, 38, 40, 42	Джинсы		10 010	3 704
373	2025-09-30 16:58:16.844322+00	4889	Джинсы прямые зауженные	https://i.postimg.cc/TPpptQyR/4889-1.jpg	https://i.postimg.cc/YCXvNTCn/4889-2.jpg	https://i.postimg.cc/t4R1x9pn/4889-3.jpg	https://i.postimg.cc/rp3z3WW5/4889-4.jpg	\N	–	28-34, 36, 38, 40, 42, 44	Джинсы		20 020	4 004
374	2025-09-30 16:58:16.844322+00	90877	Костюм спортивный на флисе	https://i.postimg.cc/4yqYk9jD/90877-1.jpg	https://i.postimg.cc/JnTyxgx4/90877-2.jpg	https://i.postimg.cc/7hf5WVt1/90877-3.jpg	https://i.postimg.cc/0Q5MpxpB/90877-4.jpg	\N	4.8	S-3XL	Костюмы	Мужской	25 000	6 250
375	2025-09-30 16:58:16.844322+00	SX8150	Костюм с шортами и футболкой	https://i.postimg.cc/9MqMPMD1/SX8150-1.jpg	https://i.postimg.cc/SKRjsVqB/SX8150-2.jpg	https://i.postimg.cc/1XhzvQ6S/SX8150-3.jpg	https://i.postimg.cc/bv5r2bws/SX8150-4.jpg	\N	4.7	S-3XL	Костюмы	Мужской	3 670	2 569
376	2025-09-30 16:58:16.844322+00	SuitD01	Костюм джинсовый с шортами	https://i.postimg.cc/13Lbn3Zy/Suit-D01-1.jpg	https://i.postimg.cc/W3VK8Y3K/Suit-D01-2.jpg	https://i.postimg.cc/wBLZhY6L/Suit-D01-3.jpg	https://i.postimg.cc/RFTYD1J0/Suit-D01-4.jpg	\N	4.9	XS-L	Костюмы	Женский	10 005	4 702
377	2025-09-30 16:58:16.844322+00	BallD01	Платье с юбкой баллон	https://i.postimg.cc/BZVpQw30/Ball-D01-1.jpg	https://i.postimg.cc/sXncWTZ5/Ball-D01-2.jpg	https://i.postimg.cc/PJPMQ1m9/Ball-D01-3.jpg	https://i.postimg.cc/vTktqDhB/Ball-D01-4.jpg	\N	4.6	XS-L	Платья		10 010	1 301
378	2025-09-30 16:58:16.844322+00	DP01	Платье поло короткое	https://i.postimg.cc/yYCj2pzY/DP01-1.jpg	https://i.postimg.cc/kXNsCNnN/DP01-2.jpg	https://i.postimg.cc/sgVcgBXk/DP01-3.jpg	https://i.postimg.cc/dV49kqZL/DP01-4.jpg	\N	4.7	XS-XL	Платья		5 005	3 303
379	2025-09-30 16:58:16.844322+00	DLace	Платье в длине миди	https://i.postimg.cc/85hJvHXt/DLace-1.jpg	https://i.postimg.cc/SxvMbjz7/DLace-2.jpg	https://i.postimg.cc/s2GZjyYF/DLace-3.jpg	https://i.postimg.cc/gJ9Lr5sx/DLace-4.jpg	\N	5.0	XS-M	Платья		10 000	3 100
380	2025-09-30 16:58:16.844322+00	Drose	Платье с длинным рукавом	https://i.postimg.cc/ZqLFtJ4T/Drose-1.jpg	https://i.postimg.cc/B6Q5JRn2/Drose-2.jpg	https://i.postimg.cc/mr4N5PxX/Drose-3.jpg	https://i.postimg.cc/zBtCvpy6/Drose-4.jpg	\N	4.6	XS-XL	Платья		10 010	3 303
381	2025-09-30 16:58:16.844322+00	Df02	Платье в цветочек	https://i.postimg.cc/bwnfRB80/Df02-1.jpg	https://i.postimg.cc/k5d3YvX0/Df02-2.jpg	https://i.postimg.cc/vmLRJx4c/Df02-3.jpg	https://i.postimg.cc/k4JrqMSw/Df02-4.jpg	\N	5.0	XS-XL	Платья		10 000	2 000
382	2025-09-30 16:58:16.844322+00	dressblack	Платье с воротником	https://i.postimg.cc/Jn6F8NM4/dressblack-1.jpg	https://i.postimg.cc/HxsNFZGh/dressblack-2.jpg	https://i.postimg.cc/DzcDjVNG/dressblack-3.jpg	https://i.postimg.cc/XvWmkNs3/dressblack-4.jpg	\N	4.7	XS, S, M, L, XXL, XL	Платья		7 500	3 525
383	2025-09-30 16:58:16.844322+00	dressflowers	Платье в цветочек	https://i.postimg.cc/Zq07c96G/dressflowers-1.jpg	https://i.postimg.cc/rs2fMQ7T/dressflowers-2.jpg	https://i.postimg.cc/JhgTd1qG/dressflowers-3.jpg	https://i.postimg.cc/SsMgBwTV/dressflowers-4.jpg	\N	4.6	XS-XL	Платья		7 500	2 775
384	2025-09-30 16:58:16.844322+00	dressred	Платье в клетку	https://i.postimg.cc/02Tyxmyf/dressred-1.jpg	https://i.postimg.cc/VLrk34mv/dressred-2.jpg	https://i.postimg.cc/NjRf0Myw/dressred-3.jpg	https://i.postimg.cc/fWgb2141/dressred-4.jpg	\N	4.4	XS, S, M, L, XL, XXL	Платья		7 500	3 000
385	2025-09-30 16:58:16.844322+00	sundressgray	Сарафан офисный в клетку	https://i.postimg.cc/fbwtnX8P/sundressgray-1.jpg	https://i.postimg.cc/q7jtkRYv/sundressgray-2.jpg	https://i.postimg.cc/tTJs7bQt/sundressgray-3.jpg	https://i.postimg.cc/vBKcVKGR/sundressgray-4.jpg	\N	4.6	XS-2XL	Платья		5 500	2 695
386	2025-09-30 16:58:16.844322+00	topwhite	Кроп топ с открытой спиной	https://i.postimg.cc/13RnbwCj/topwhite-1.jpg	https://i.postimg.cc/15rVWJHF/topwhite-2.jpg	https://i.postimg.cc/WbvJ6QMj/topwhite-3.jpg	https://i.postimg.cc/DfsXG24B/topwhite-4.jpg	\N	5.0	S, M	Платья		5 523	1 160
387	2025-09-30 16:58:16.844322+00	1575	Куртка длинная зимняя	https://i.postimg.cc/LXdMYrbZ/1575-1.jpg	https://i.postimg.cc/qv5r0tcw/1575-2.jpg	https://i.postimg.cc/ZqvSqTVS/1575-3.jpg	https://i.postimg.cc/XYJWTK5X/1575-4.jpg	\N	4.5	S-3XL	Куртки	Мужской	14 500	9 570
388	2025-09-30 16:58:16.844322+00	1595	Куртка короткая зимняя	https://i.postimg.cc/76Q0nnS7/1595-1.jpg	https://i.postimg.cc/br7nKYCw/1595-2.jpg	https://i.postimg.cc/bJv1nBSp/1595-3.jpg	https://i.postimg.cc/x8JHxNPZ/1595-4.jpg	\N	4.5	S-3XL	Куртки	Мужской	14 500	9 570
389	2025-09-30 16:58:16.844322+00	1865	Куртка зимняя	https://i.postimg.cc/qR8zZfh8/1865-1.jpg	https://i.postimg.cc/nr2Mpv1r/1865-2.jpg	https://i.postimg.cc/Zn40GfpX/1865-3.jpg	https://i.postimg.cc/SQfn6hp4/1865-4.jpg	\N	4.8	S-2XL	Куртки	Мужской	14 500	10 585
390	2025-09-30 16:58:16.844322+00	0905	Куртка демисезонная	https://i.postimg.cc/Y9pHkTDN/0905-1.jpg	https://i.postimg.cc/xCtSdgBw/0905-2.jpg	https://i.postimg.cc/gjjbL8Wn/0905-3.jpg	https://i.postimg.cc/yxG4mx1n/0905-4.jpg	\N	4.7	XS-XL	Куртки	Мужской	20 000	6 000
391	2025-09-30 16:58:16.844322+00	0910	Куртка демисезонная бомбер	https://i.postimg.cc/m2bW9xT0/0910-1.jpg	https://i.postimg.cc/nc0bYdzM/0910-2.jpg	https://i.postimg.cc/dV3MW8k6/0910-3.jpg	https://i.postimg.cc/v87dD8wr/0910-4.jpg	\N	4.7	XS-XL	Куртки	Мужской	53 000	6 360
392	2025-09-30 16:58:16.844322+00	0914	Куртка демисезонная с капюшоном	https://i.postimg.cc/mgvdQMQt/0914-1.jpg	https://i.postimg.cc/j5XZ0FB7/0914-2.jpg	https://i.postimg.cc/LXRNWpQS/0914-3.jpg	https://i.postimg.cc/FzHG9xQn/0914-4.jpg	\N	4.6	XS-XL	Куртки	Мужской	20 000	5 000
393	2025-09-30 16:58:16.844322+00	8701	Куртка зимняя с капюшоном	https://i.postimg.cc/QMSTXZxh/8701-1.jpg	https://i.postimg.cc/XJzBCKCP/8701-2.jpg	https://i.postimg.cc/3RRDNfdp/8701-3.jpg	https://i.postimg.cc/vTxgL17Z/8701-4.jpg	\N	4.8	S-2XL	Куртки	Мужской	20 400	16 932
394	2025-09-30 16:58:16.844322+00	99206	Куртка короткая зимняя	https://i.postimg.cc/8zNdDHBd/99206-1.jpg	https://i.postimg.cc/8Phdq3WP/99206-2.jpg	https://i.postimg.cc/3JMCf7kc/99206-3.jpg	https://i.postimg.cc/v8xtvDZn/99206-4.jpg	\N	4.8	S-2XL	Куртки	Мужской	20 000	15 000
395	2025-09-30 16:58:16.844322+00	3750	Снуд зимний на флисе	https://i.postimg.cc/nVQccf3Z/3750-1.jpg	https://i.postimg.cc/LXG9Bx6r/3750-2.jpg	https://i.postimg.cc/857k62DR/3750-3.jpg	https://i.postimg.cc/4ytJ8pYn/3750-4.jpg	\N	4.9	52-60	Куртки	Мужской	2 710	542
396	2025-09-30 16:58:16.844322+00	12070	Снуд зимний на флисе	https://i.postimg.cc/pr99P9pt/12070-1.jpg	https://i.postimg.cc/XJ1GMKN8/12070-2.jpg	https://i.postimg.cc/RhjWhMHJ/12070-3.jpg	https://i.postimg.cc/MZ4MdYFZ/12070-4.jpg	\N	4.9	ONESIZE	Куртки	Мужской	1 600	832
397	2025-09-30 16:58:16.844322+00	042	Куртка демисезонная	https://i.postimg.cc/Bv4bz73D/041-1.jpg	https://i.postimg.cc/yNq2P2Fh/042-2.jpg	https://i.postimg.cc/13VLDyN5/042-3.jpg	https://i.postimg.cc/wBhZbFVC/042-4.jpg	\N	4.4	S-L	Куртки	Женский	20 000	14 800
398	2025-09-30 16:58:16.844322+00	1989	Куртка демисезонная с капюшоном	https://i.postimg.cc/KvMNNjQV/1989-1.jpg	https://i.postimg.cc/kGkyCPMf/1989-2.jpg	https://i.postimg.cc/FFqp33b3/1989-3.jpg	https://i.postimg.cc/y8CTrKbN/1989-4.jpg	\N	4.5	S-L	Куртки	Женский	20 000	14 000
399	2025-09-30 16:58:16.844322+00	13877	Куртка зимняя с капюшоном	https://i.postimg.cc/Kjn5msKb/13877-1.jpg	https://i.postimg.cc/ZY3HP0wQ/13877-2.jpg	https://i.postimg.cc/9FhpLVSQ/13877-3.jpg	https://i.postimg.cc/MHkD28pt/13877-4.jpg	\N	4.5	S-L	Куртки	Женский	18 799	17 483
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, created_at, title, description, points, is_one_time, is_active, monthly_limit, verification_type, icon_url, index, system_name) FROM stdin;
6	2025-06-09 15:44:54.505295+00	Пригласить друга	\N	100	f	t	10	auto	./images/icons/refferal.svg	6	referral
7	2025-06-09 15:45:18.765597+00	Stories в Instagram	\N	200	f	t	1	manual	./images/icons/insta_story.svg	7	instagram_story
8	2025-09-30 17:50:11.477352+00	Ежедневный бонус	\N	20	f	t	\N	auto	./images/icons/daily.svg	1	daily_bonus
4	2025-06-09 15:44:07.968558+00	Подписка на TG-канал	\N	50	t	t	\N	auto	./images/icons/telegram_sub.svg	2	telegram_subscribe
3	2025-06-09 15:43:50.979918+00	Подписка на Instagram	\N	50	t	t	\N	manual	./images/icons/insta_sub.svg	3	instagram_subscribe
2	2025-06-09 15:43:22.934981+00	Кешбэк на покупку	\N	1	f	t	\N	manual	./images/icons/cashback.svg	5	cashback
5	2025-06-09 15:44:29.404189+00	Бонус за отзыв	\N	250	f	t	\N	manual	./images/icons/review.svg	4	review
\.


--
-- Data for Name: user_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tasks (id, created_at, user_id, task_id, status, points_awarded, completed_at, verified_at, comment, salebot_order_id, additional_data) FROM stdin;
120	2025-10-04 15:42:12.724611+00	34	8	approved	20	2025-10-04 15:42:12.74469+00	2025-10-04 15:42:12.74469+00	\N	\N	\N
121	2025-10-04 15:42:15.615393+00	34	4	approved	50	2025-10-04 15:42:15.636465+00	2025-10-04 15:42:15.636465+00	\N	\N	\N
122	2025-10-04 15:42:39.166821+00	34	3	approved	50	2025-10-04 15:44:03.159459+00	2025-10-04 15:44:03.159459+00	\N	559831903	\N
123	2025-10-04 15:48:29.135664+00	34	2	approved	200	2025-10-04 15:49:43.613283+00	2025-10-04 15:49:43.613283+00	\N	559834283	{"marketplace":"wildberries","purchase_amount":"12000"}
124	2025-10-04 18:31:35.149519+00	34	6	approved	100	2025-10-04 18:31:35.172457+00	2025-10-04 18:31:35.172457+00	\N	\N	\N
125	2025-10-04 18:32:47.465721+00	35	8	approved	20	2025-10-04 18:32:47.484487+00	2025-10-04 18:32:47.484487+00	\N	\N	\N
127	2025-10-05 15:24:26.475232+00	34	8	approved	20	2025-10-05 15:24:26.500957+00	2025-10-05 15:24:26.500957+00	\N	\N	\N
126	2025-10-04 18:36:06.123892+00	35	5	approved	250	2025-10-08 09:20:04.968852+00	2025-10-08 09:20:04.968852+00	\N	559910506	{"marketplace":"wildberries"}
128	2025-10-10 19:54:25.672012+00	39	8	approved	20	2025-10-10 19:54:25.697304+00	2025-10-10 19:54:25.697304+00	\N	\N	\N
129	2025-10-10 19:54:49.832289+00	39	4	approved	50	2025-10-10 19:54:49.857769+00	2025-10-10 19:54:49.857769+00	\N	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, first_name, last_name, tg_id, tg_username, avatar, card_balance, level, sb_id, partner_id) FROM stdin;
34	2025-10-04 15:29:17.541065	Андрей	| Технарь	641638479	ma_andrey	https://files.salebot.pro/uploads/avatars/705029/1-809119276-641638479.jpg	440	bronze	809119276	\N
36	2025-10-07 05:16:32.986629	Vitali	Onikhimouski	488891254	onikhimouski_22	https://files.salebot.pro/uploads/avatars/705029/1-810389138-488891254.jpg	0	bronze	810389138	\N
37	2025-10-08 09:15:02.51968	Юлия	\N	478760637	juliaknyrko	https://t.me/i/userpic/320/AdggT8rL8WOrNGg7WIfFK6nrXnETNvBmheRyGDOkxdo.svg	0	bronze	811188448	\N
38	2025-10-08 09:15:25.123216	Margarita	Raduha	660271188	Margo_16	https://t.me/i/userpic/320/U1lEvCck-uUr_hVfjfkVAF8VQfTgsrMcoDYgiYlHo0w.svg	0	bronze	811188593	\N
35	2025-10-04 18:31:35.090627	Диана	Щербатюк	622440629	dianascherbatuk	https://files.salebot.pro/uploads/avatars/705029/1-809200300-622440629.jpg	270	bronze	809200300	34
39	2025-10-10 19:54:16.658755	Андрей	\N	6737300201	ma_andrej	https://t.me/i/userpic/320/FE-x7hWISPr17EQ5iQyx-eODAw8Xn-6fO0bbw0uwnyitK9aM7cZ-sKkHMvtnyLcO.svg	70	bronze	812532201	\N
40	2025-10-14 08:28:16.299394	Aleksandr	Pashkovich	328037288	pashkovich_17	https://t.me/i/userpic/320/wWHsnnizpKFGT-WOWCdqQTERH_n_FuKPTWvlshFhFR8.svg	0	bronze	\N	\N
\.


--
-- Data for Name: wheel_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wheel_requests (id, created_at, user_id, user_ip, unic_review, unic_purchase, status, prize, marketplace, user_phone, review_url, purchase_url) FROM stdin;
27	2025-06-18 23:56:37.179804+00	7526457573	90.188.245.174	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/d35dbf7a-1dfa-4614-9ec5-21f251ffcf70	https://directus.bmulti.store/assets/c1966c98-23f9-48dd-b699-3ded5c41a811
85	2025-06-20 08:10:44.337656+00	821979181	89.204.89.42	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/4c1e217c-c186-43b5-bee1-77906d902fd3	https://directus.bmulti.store/assets/a2abd59d-9e52-4f20-8206-861b76bce535
124	2025-06-20 21:01:06.376526+00	778401555	185.120.89.16	t	t	done	200 рублей	OZON	79781004647	https://directus.bmulti.store/assets/daef4886-976f-43fa-82a2-6737a31b4ffe	https://directus.bmulti.store/assets/be1bcd8d-a6ce-4fd6-93a0-a830248ebf51
26	2025-06-18 20:23:00.864846+00	1359532862	109.63.150.236	t	t	done	200 рублей	WB	79629474999	https://directus.bmulti.store/assets/e2595152-ea9a-4e5f-8017-7e65fd88fd80	https://directus.bmulti.store/assets/71f1f76c-6aae-4bd8-afa7-64a0ac8d1f03
28	2025-06-19 04:52:25.040592+00	874377028	85.175.191.121	t	t	check	200 рублей	WB	79883328636	https://directus.bmulti.store/assets/32eea756-9758-4e26-8133-41d3e5a69207	https://directus.bmulti.store/assets/6e75f449-01e8-4444-a08f-1ab7d1b73805
39	2025-06-19 10:53:09.281799+00	384947948	31.134.188.247	t	t	done	200 рублей	WB	79531486850	https://directus.bmulti.store/assets/af5827dc-5f25-4de0-a329-83f434a9a5a5	https://directus.bmulti.store/assets/4d3afd33-a645-457d-b00c-06b2f7e3efa2
126	2025-06-21 03:19:18.061435+00	55965082	5.143.106.138	t	t	check	200 рублей	WB	79841943307	https://directus.bmulti.store/assets/a87b714c-0f49-4ff7-8cc3-0960625d9523	https://directus.bmulti.store/assets/d154daf0-4e0d-4d22-b4df-aada65e404cc
33	2025-06-19 08:08:12.636558+00	1053297112	178.178.249.216	t	t	done	200 рублей	OZON	79212745225	https://directus.bmulti.store/assets/ca2cce53-90c2-4c97-bf7b-a2db9fc413af	https://directus.bmulti.store/assets/e3abe7b1-ba56-4efd-b1f4-9e87a6deaa73
31	2025-06-19 06:45:07.411223+00	5542464255	62.118.80.231	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/6f453b38-8872-457b-a206-b22e12800616	https://directus.bmulti.store/assets/24b28c7a-bf09-4185-a3db-b20d15f366da
23	2025-06-18 19:29:54.88345+00	6081107148	188.243.126.49	t	t	done	200 рублей	OZON	79992482775	https://directus.bmulti.store/assets/95415dfb-1afd-4d40-8484-ff4c47b9f1f8	https://directus.bmulti.store/assets/e1d87a46-5a7d-4024-83db-1a40c8c54f25
24	2025-06-18 20:04:51.40044+00	1187786217	91.196.84.21	t	t	done	200 рублей	WB	79644939977	https://directus.bmulti.store/assets/b2a7b953-955c-477e-ac63-1a90915191b7	https://directus.bmulti.store/assets/db488850-4fac-4821-b0e9-845ff04bb83b
25	2025-06-18 20:10:11.603402+00	1310558554	87.117.51.224	t	t	done	200 рублей	WB	79604442022	https://directus.bmulti.store/assets/a61e4e66-04e9-4a54-9a7c-fa6e35414367	https://directus.bmulti.store/assets/2f2e1ce2-e91a-49e5-9fe8-995bdc3a690a
29	2025-06-19 05:14:14.444463+00	752179368	79.175.0.20	t	t	done	200 рублей	OZON	79956009797	https://directus.bmulti.store/assets/e6405375-da47-45ba-b08a-2b49d8204617	https://directus.bmulti.store/assets/543d7927-95f3-46a6-9609-22da6048fa8b
32	2025-06-19 07:57:18.632593+00	737777727	80.234.72.236	t	t	done	200 рублей	OZON	79042345006	https://directus.bmulti.store/assets/daf40a81-ae51-4cf3-894e-85d199f5af02	https://directus.bmulti.store/assets/6d98af93-5cdd-4d38-b8d1-8f5db8670aa7
34	2025-06-19 08:12:09.232846+00	1095502952	95.163.145.155	t	t	check	200 рублей	WB	77473859597	https://directus.bmulti.store/assets/03b3874b-73e6-4f23-8d36-a5d120ce8d35	https://directus.bmulti.store/assets/0247a02f-79e2-4862-8d39-676b1593c18b
35	2025-06-19 09:33:10.00037+00	5286344222	5.139.232.244	t	t	done	200 рублей	OZON	79614767611	https://directus.bmulti.store/assets/b33358d0-910d-4674-915e-4e24f8f5b8e9	https://directus.bmulti.store/assets/2c2b38d2-d6a2-464c-8cf4-38d6f166b066
36	2025-06-19 10:03:53.027198+00	5132176301	212.35.183.44	t	t	done	200 рублей	WB	79100768899	https://directus.bmulti.store/assets/3bf11026-21eb-49bf-9d35-b169e691bb5f	https://directus.bmulti.store/assets/f5cdefc2-8e86-4189-accc-5013f676b01f
38	2025-06-19 10:12:40.683554+00	6766379917	91.224.254.144	t	t	done	200 рублей	OZON	79591117019	https://directus.bmulti.store/assets/ad35501f-1b8f-480a-9592-47553b4c136c	https://directus.bmulti.store/assets/082d3b7d-d486-48cb-afa4-8af8dadd2806
30	2025-06-19 05:46:08.983519+00	1292023752	159.253.171.212	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/583d5a8c-0795-4213-8790-87da2b11a8ba	https://directus.bmulti.store/assets/d6e4b20a-7a5a-479d-9aff-50d9084d7c23
45	2025-06-19 12:15:48.51289+00	756967056	5.44.169.240	t	t	done	200 рублей	OZON	79061958958	https://directus.bmulti.store/assets/654908ad-0448-481f-9304-becfa7f9d811	https://directus.bmulti.store/assets/2125bf81-c321-497f-8892-72f8421d3393
46	2025-06-19 12:25:14.317619+00	5811739138	176.59.99.4	t	t	done	200 рублей	YANDEX	95511903833	https://directus.bmulti.store/assets/f484ad4b-65d4-4962-a906-f29a161dd46c	https://directus.bmulti.store/assets/ac4ba31e-c973-4a3e-92da-ebb342f516db
40	2025-06-19 11:02:08.27257+00	1556006391	185.230.240.219	t	t	check	200 рублей	WB	79081925090	https://directus.bmulti.store/assets/1f87022d-4f7c-4888-80d7-e19984351aeb	https://directus.bmulti.store/assets/95c66cf2-6edc-40cc-b9d2-b221b4b160be
47	2025-06-19 12:25:49.061487+00	5017132932	46.175.24.248	t	t	done	200 рублей	OZON	79773560822	https://directus.bmulti.store/assets/d841995f-bff9-4908-ab9c-eb63bc4cf8ae	https://directus.bmulti.store/assets/2420c7e4-21f2-42db-afb6-0839b3f532e8
37	2025-06-19 10:07:20.708491+00	1301008004	217.66.152.196	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/c221cfb2-c3fe-4d82-9ed2-48e286f7d3c2	https://directus.bmulti.store/assets/097c8456-fadb-447b-a546-e29038d2b6e9
20	2025-06-18 19:05:35.353189+00	120145748	198.140.141.39	t	t	check	200 рублей	WB	79288060001	https://directus.bmulti.store/assets/6b7f7f3b-24aa-429f-9559-145a969e2313	https://directus.bmulti.store/assets/2ae579bb-f5e8-4e55-9ead-a751d13de144
41	2025-06-19 11:06:47.936723+00	1644239582	176.59.57.86	t	t	check	200 рублей	WB	79773785328	https://directus.bmulti.store/assets/d488e711-9e69-4f7f-86b4-fa4998da0675	https://directus.bmulti.store/assets/e66fe785-b151-4040-bc5d-fdc7914574af
42	2025-06-19 11:19:57.157784+00	5044120615	217.66.154.230	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/84c2aa84-8f5b-4f8e-831b-44d02a5f2147	https://directus.bmulti.store/assets/f4113970-86b4-4953-b551-54066b9377c2
43	2025-06-19 11:26:20.770738+00	5539495400	109.254.191.77	t	f	check	200 рублей	WB	79498261946	https://directus.bmulti.store/assets/0321d2f9-3db4-4bff-9ff6-3d5987e9a521	https://directus.bmulti.store/assets/4b285aea-ef8e-4817-af2d-094af6d7d3de
44	2025-06-19 11:45:44.007342+00	5139264067	95.26.245.42	t	t	check	200 рублей	WB	79379694757	https://directus.bmulti.store/assets/5e0bdbb6-f1c5-4458-a820-3e31275d8a0c	https://directus.bmulti.store/assets/12a265e0-3fdd-43d9-b652-2aa467273863
48	2025-06-19 12:58:50.264357+00	856863977	31.128.32.85	t	t	check	200 рублей	WB	79604652514	https://directus.bmulti.store/assets/e9dd1010-747a-4e3f-b071-d045e9a2eb1b	https://directus.bmulti.store/assets/ebccaf9d-0237-4ce2-a7b5-7452c0e39d9c
56	2025-06-19 14:55:40.659355+00	1273685446	85.140.160.105	t	t	check	1000 рублей	OZON	79137058810	https://directus.bmulti.store/assets/a0715d74-37fb-452c-95f9-bae443f53216	https://directus.bmulti.store/assets/80a4fd1a-eb03-4af7-bfd9-0eda3c17a522
78	2025-06-20 02:45:20.449714+00	409696311	37.110.210.222	t	f	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/72ddebb3-af62-42b6-ab42-5de9832d4744	https://directus.bmulti.store/assets/9c81970a-820a-42bb-a32a-35a3d503e713
66	2025-06-19 17:38:38.820257+00	1131130611	109.248.252.15	t	t	check	200 рублей	OZON	79002666462	https://directus.bmulti.store/assets/b7490e78-fc1b-49ce-930b-97f8c29e05a1	https://directus.bmulti.store/assets/028a34f6-4bb6-4de8-8026-df6865f12276
49	2025-06-19 13:12:25.409919+00	7299125444	109.235.188.76	t	t	done	200 рублей	OZON	79051281280	https://directus.bmulti.store/assets/5817311e-6113-4beb-b8bb-921e5ff9346d	https://directus.bmulti.store/assets/1d7d9783-77ef-4c94-9ca3-1755d9fe05b7
58	2025-06-19 15:29:08.683172+00	883590728	188.245.234.0	t	t	check	200 рублей	OZON	79370851211	https://directus.bmulti.store/assets/1b0f3e22-8bee-419d-b57f-a3f5071bb714	https://directus.bmulti.store/assets/24e25e52-319e-4b47-9d58-9815a13505a5
53	2025-06-19 14:33:47.75203+00	798402562	185.13.177.132	t	t	check	200 рублей	OZON	79994573723	https://directus.bmulti.store/assets/e181193d-1a3f-4422-833b-b9a3ffceae29	https://directus.bmulti.store/assets/711a1a4d-4a5b-4ad3-873d-78e11591a178
52	2025-06-19 14:30:50.356328+00	1875094247	81.222.176.183	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/e434b921-8492-43ca-965d-c7e6c03ad723	https://directus.bmulti.store/assets/2caf3073-0b2b-42d6-b4d5-eeb14137dcef
50	2025-06-19 13:23:19.197251+00	2141318748	80.76.63.30	t	t	done	200 рублей	OZON	79591170625	https://directus.bmulti.store/assets/33a2e595-278b-479d-b8fc-28f14378aa3b	https://directus.bmulti.store/assets/7b2a2577-f048-4196-aa52-c07514a1cc95
51	2025-06-19 14:11:23.859346+00	841342688	5.144.76.12	t	t	done	200 рублей	WB	79114456077	https://directus.bmulti.store/assets/bf9ef717-2f99-4138-9700-ff3e7b762ddc	https://directus.bmulti.store/assets/418fbb83-2fd7-4f77-8490-13fa222d9cb8
61	2025-06-19 16:34:56.137639+00	6607776321	85.173.132.14	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/2260a1b8-771d-45c4-a047-ac9fd0fab659	https://directus.bmulti.store/assets/afd315d7-abcb-467d-bf6a-d6e3eaef4a3c
63	2025-06-19 16:43:01.519255+00	6130392530	176.125.141.195	t	t	check	200 рублей	WB	79013154192	https://directus.bmulti.store/assets/37400b15-5a66-48b7-974d-745356dcccef	https://directus.bmulti.store/assets/602f0b69-13e8-4935-94b9-2811cf33b5de
54	2025-06-19 14:47:34.527385+00	415117398	178.159.29.235	t	t	done	200 рублей	OZON	79193103711	https://directus.bmulti.store/assets/8387fb4b-b6b8-4eb9-9f7e-8370f10012f2	https://directus.bmulti.store/assets/700f3a51-217c-49c9-be3e-17b9c8ca1842
57	2025-06-19 14:56:24.167701+00	924954165	178.57.98.9	t	t	done	200 рублей	WB	79062995654	https://directus.bmulti.store/assets/5abc734f-23aa-47ae-adae-379792a7ec9d	https://directus.bmulti.store/assets/9f62b9ba-8e16-434b-a3a2-327e319f6cc1
55	2025-06-19 14:49:57.584592+00	898525508	83.142.10.165	t	t	done	200 рублей	OZON	79170996601	https://directus.bmulti.store/assets/969991d1-6840-4ce5-b0bc-41a7c6585bca	https://directus.bmulti.store/assets/a95b4a17-78f5-4e51-8c98-5659a0626681
64	2025-06-19 16:43:25.733772+00	6796459049	95.24.239.129	t	t	check	200 рублей	OZON	79062476570	https://directus.bmulti.store/assets/9668fd41-d79a-4890-8ed7-c16ec34df853	https://directus.bmulti.store/assets/8e2406ad-8ad3-4653-b75a-3fa8e7fa7f09
59	2025-06-19 15:32:02.43345+00	1680171389	46.182.173.240	t	t	done	500 рублей	WB	\N	https://directus.bmulti.store/assets/4d662829-698f-4e20-95ef-07ce6965fcad	https://directus.bmulti.store/assets/c9dfe593-56e9-4e5d-9f2f-789b9c3278d7
65	2025-06-19 17:07:34.515607+00	1250918148	51.15.126.176	f	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/5046b6b3-1f72-40d1-86c4-99a9418189fa	https://directus.bmulti.store/assets/9768f7b9-96e2-456d-bc2c-a94a1ec7d18b
62	2025-06-19 16:40:02.915968+00	7664135369	138.199.238.48	t	t	done	200 рублей	OZON	79910638814	https://directus.bmulti.store/assets/4b03797a-2a2b-42ca-8801-299db162724a	https://directus.bmulti.store/assets/40f79172-5b02-4536-9820-8e9b02764c69
67	2025-06-19 17:54:12.412643+00	1131130611	109.248.252.15	t	t	done	200 рублей	OZON	79002666462	https://directus.bmulti.store/assets/60a4880e-93e9-4fc4-8d3b-a31adbac25c3	https://directus.bmulti.store/assets/5a026555-c91a-44b9-8dc2-97eb1a37233c
70	2025-06-19 19:11:11.774959+00	1896655775	213.87.134.215	t	t	done	200 рублей	WB	79307686848	https://directus.bmulti.store/assets/e602283e-9352-49ee-b17d-84b2e42b7791	https://directus.bmulti.store/assets/67709e73-db35-44ae-9b7a-d955792212da
72	2025-06-19 19:47:57.734111+00	1143964652	79.139.207.169	t	t	done	200 рублей	OZON	79156035171	https://directus.bmulti.store/assets/d2bb92ab-f621-42da-8658-67f760e98406	https://directus.bmulti.store/assets/879bf9ed-9683-4184-821f-31b8b7cf4dca
74	2025-06-19 20:34:35.815812+00	2117428857	213.208.175.12	t	t	done	200 рублей	OZON	79853685737	https://directus.bmulti.store/assets/686707cf-c8da-4474-a0e9-a5d401be5d18	https://directus.bmulti.store/assets/5f3674f5-d07e-4f19-abff-883ace0e38f3
77	2025-06-20 02:06:37.450252+00	5062072686	95.70.60.213	t	t	done	200 рублей	WB	79242242160	https://directus.bmulti.store/assets/405bb73c-bfaa-4eb5-b4e2-7baf34c75bbc	https://directus.bmulti.store/assets/f09dbd2f-073b-49ae-aa13-06fccd6acca4
69	2025-06-19 18:44:05.300794+00	6233138315	82.140.197.226	t	t	done	200 рублей	OZON	79201880549	https://directus.bmulti.store/assets/433d51f4-a231-4274-a0b9-22a331e3847d	https://directus.bmulti.store/assets/c3b0fb84-70b6-40e4-a4f9-9271b5d7e6fe
68	2025-06-19 18:26:56.830817+00	1090464449	185.16.29.246	t	t	done	200 рублей	OZON	79780178054	https://directus.bmulti.store/assets/344d3a97-5436-4145-a75c-be4d1ce05131	https://directus.bmulti.store/assets/c01bc34a-a248-452a-84d2-4050932cadfb
71	2025-06-19 19:35:10.637222+00	369768979	91.231.233.189	t	t	check	200 рублей	WB	79265579524	https://directus.bmulti.store/assets/28919517-aea5-47d0-b192-6e3782325d90	https://directus.bmulti.store/assets/09d6e142-190f-4848-8c78-78ca706aef5e
73	2025-06-19 19:56:33.087932+00	1772063851	176.117.144.46	t	t	check	200 рублей	OZON	79939710773	https://directus.bmulti.store/assets/d18877fb-f563-4a61-a0e1-1bbb3d2348eb	https://directus.bmulti.store/assets/4a39fa51-cd63-47af-9ad4-b7af9bac1a2f
75	2025-06-19 21:19:01.457362+00	2082674716	31.40.146.255	t	t	check	200 рублей	WB	79782725191	https://directus.bmulti.store/assets/aad3fff8-1e84-4735-b836-d5c4a0bb9590	https://directus.bmulti.store/assets/76c075dc-68c3-400a-8bab-ca76e9fc4ad8
76	2025-06-19 23:11:54.505965+00	5644230932	91.149.100.64	t	t	check	200 рублей	OZON	79237498723	https://directus.bmulti.store/assets/b3222086-d422-4fe0-a7de-4d4e63dc438c	https://directus.bmulti.store/assets/facb6018-3a1a-461a-9485-511375ab6128
60	2025-06-19 15:47:04.919096+00	1120748074	80.85.151.187	t	t	done	200 рублей	OZON	79372268755	https://directus.bmulti.store/assets/79b6075e-6cfb-4dfd-bf32-201a503be89c	https://directus.bmulti.store/assets/c6ef1273-c198-4ed8-8176-241cb1d516d8
84	2025-06-20 08:10:26.683708+00	821979181	89.204.89.42	t	t	check	200 рублей	YANDEX	79195681514	https://directus.bmulti.store/assets/be329b17-3ae0-42ca-82ce-578ca4cd211e	https://directus.bmulti.store/assets/428fd4a3-823d-4382-9aee-f82a816cdf0a
382	2025-06-27 14:23:10.597704+00	5489703251	77.79.169.168	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/fe58bf0d-7d5f-432f-9083-4a2ff7bd3bec	https://directus.bmulti.store/assets/f64d7308-2cb6-4b3c-90b9-0941b558c9fc
80	2025-06-20 05:23:34.566972+00	1539451111	77.79.183.83	f	t	check	200 рублей	OZON	79625270998	https://directus.bmulti.store/assets/6466bd14-482b-4dbc-aaa0-b3ba7fc1b5d5	https://directus.bmulti.store/assets/2c743e18-725c-44e2-a980-0973e00cbc95
106	2025-06-20 14:42:26.408925+00	1203986123	136.169.210.28	t	t	done	200 рублей	WB	79276808909	https://directus.bmulti.store/assets/12737f93-e04a-4f4b-8f96-1341ed88e0d6	https://directus.bmulti.store/assets/0b298b43-3e12-42d5-9812-06925a82ba2c
108	2025-06-20 14:57:12.959886+00	756431656	109.161.120.51	t	t	done	200 рублей	WB	79201130047	https://directus.bmulti.store/assets/c023bbda-f590-4eec-979d-008d005dcd44	https://directus.bmulti.store/assets/50d9afa3-b3a0-461a-804e-991f9b496016
81	2025-06-20 06:23:37.530345+00	998782301	94.41.131.215	f	f	check	200 рублей	OZON	79225352395	https://directus.bmulti.store/assets/c69ea69c-ecce-4da7-84c1-da2b69579bea	https://directus.bmulti.store/assets/e73997ff-4325-452c-b371-756b9713d7ff
87	2025-06-20 08:16:42.339029+00	5429700610	188.190.208.103	f	t	check	200 рублей	WB	79253454448	https://directus.bmulti.store/assets/7d6ef585-404e-4f5a-9657-eb12f416b028	https://directus.bmulti.store/assets/af8d295b-8003-4eea-b328-27cec9fd5b83
88	2025-06-20 08:22:57.497837+00	\N	176.101.127.164	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
92	2025-06-20 09:46:23.28699+00	1120748074	80.85.151.187	t	t	done	200 рублей	OZON	79372268755	https://directus.bmulti.store/assets/05ed5b8a-6ae2-4e57-816d-a0ac13a3d173	https://directus.bmulti.store/assets/1d2f5a87-56fe-4b78-a1c3-aa1b63f2249a
103	2025-06-20 13:09:06.161609+00	5854234227	77.83.19.156	t	t	done	200 рублей	OZON	79604528885	https://directus.bmulti.store/assets/3b8f411b-e91e-4c8a-bf9b-68f3767dd541	https://directus.bmulti.store/assets/ff4ac0a0-2613-46b5-9949-51daac72baa2
79	2025-06-20 05:15:50.246267+00	5005298212	79.127.162.182	t	t	done	200 рублей	OZON	79604751301	https://directus.bmulti.store/assets/49999ed9-2fca-4a6e-926f-cf204fe711ab	https://directus.bmulti.store/assets/4bc90f3f-2c8a-4c0c-8150-afdc0f27caa4
89	2025-06-20 08:23:36.152049+00	979600071	176.101.127.164	t	t	check	200 рублей	WB	79494162997	https://directus.bmulti.store/assets/2d76bcaf-b745-4aee-9fb8-3d5c16360222	https://directus.bmulti.store/assets/280f3696-6b99-48c8-b099-c7ae50bf29ef
82	2025-06-20 07:12:00.891548+00	1581232992	95.78.0.15	t	t	done	200 рублей	OZON	79274766579	https://directus.bmulti.store/assets/bb575509-bc91-4e02-b63f-eac96e0dfe6a	https://directus.bmulti.store/assets/66acaabe-09e6-493c-8b11-287a9b3e469f
86	2025-06-20 08:14:59.438874+00	5138887236	93.157.209.130	t	t	done	200 рублей	OZON	79270523947	https://directus.bmulti.store/assets/73653735-9d2a-4313-80da-30e1b5422dd7	https://directus.bmulti.store/assets/9a7a5c88-639a-4fd8-ac25-859e2911b635
83	2025-06-20 07:59:21.393545+00	5009683433	95.25.54.149	t	t	done	200 рублей	OZON	79518221876	https://directus.bmulti.store/assets/ca2dad1a-26b0-4eca-b26b-b07aa81e0c90	https://directus.bmulti.store/assets/678ed984-8d0f-4ab3-a5ba-322ec65d3e8b
90	2025-06-20 08:49:02.743355+00	5329787985	5.139.232.27	t	t	done	200 рублей	OZON	79614511751	https://directus.bmulti.store/assets/df8468fa-43ef-4642-a140-3b1838dc7f56	https://directus.bmulti.store/assets/265d9a36-bba9-4ebc-9518-f37195c070ca
91	2025-06-20 09:34:24.585488+00	2122356202	31.171.196.138	t	t	done	200 рублей	OZON	79277791841	https://directus.bmulti.store/assets/ee0edee1-9618-4591-9d9c-38b6ef19bf05	https://directus.bmulti.store/assets/1e77130d-c77a-4453-af2f-48f804c3f182
93	2025-06-20 11:02:29.393347+00	559401818	77.41.97.246	t	t	done	200 рублей	WB	79250708676	https://directus.bmulti.store/assets/e972e779-990b-4c42-ac44-0d3f67c08f62	https://directus.bmulti.store/assets/9166d62b-668f-4d99-a320-3ec69b073135
99	2025-06-20 11:50:10.975885+00	1276228679	178.17.180.192	t	t	done	200 рублей	OZON	79192717273	https://directus.bmulti.store/assets/a673f071-ae3f-4a37-9e13-36b52e7da5eb	https://directus.bmulti.store/assets/7538735c-1214-4b0a-bad6-25240e8d509b
94	2025-06-20 11:30:10.069734+00	451595713	5.3.100.229	t	t	done	200 рублей	OZON	79166513963	https://directus.bmulti.store/assets/93cd6708-bfcd-4fb2-b61d-bc8371daafb9	https://directus.bmulti.store/assets/fe890049-4166-4866-8c92-a5af5ca88cac
100	2025-06-20 12:12:33.857097+00	7758108917	77.222.96.211	t	t	done	200 рублей	WB	79091755746	https://directus.bmulti.store/assets/116adfeb-ce02-4100-b7dd-4b9e26dcd8c4	https://directus.bmulti.store/assets/c12ed95b-95c7-4a65-92e9-d0b2d3fbf38d
98	2025-06-20 11:49:16.51214+00	1096842764	213.87.144.144	t	f	done	200 рублей	OZON	79805619177	https://directus.bmulti.store/assets/2547f68d-5019-4ac1-8f53-acfa53051012	https://directus.bmulti.store/assets/89ddbd58-dbef-42f0-a19f-07e9a79befcb
95	2025-06-20 11:38:57.930142+00	2060057451	176.59.108.149	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/10e0d00c-0335-4ea1-9990-02ce1f1ed08b	https://directus.bmulti.store/assets/7b73794b-bb24-4356-8725-2e9175e97541
96	2025-06-20 11:39:07.702342+00	2060057451	176.59.108.149	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/f699d484-6c11-4ab5-ae9e-c74b0eb01be9	https://directus.bmulti.store/assets/1d9055aa-a79b-4d41-b711-5ac7e5f6dad5
97	2025-06-20 11:43:31.009084+00	558935020	94.25.180.236	t	t	check	200 рублей	WB	79963204035	https://directus.bmulti.store/assets/2f59f4a7-24a2-45b7-b14f-79909e96aaf0	https://directus.bmulti.store/assets/134d3c28-c41e-4dd9-8963-7f6a8718892c
101	2025-06-20 12:46:28.477555+00	7564967410	213.151.0.114	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/bff08ea7-aaac-4560-9348-8783e996d202	https://directus.bmulti.store/assets/2e262b7e-1d49-41db-828f-b4b8fbf67c62
102	2025-06-20 13:05:49.285201+00	1640628700	85.26.239.115	t	t	check	200 рублей	WB	79910090652	https://directus.bmulti.store/assets/2e439e8c-c16c-497c-b519-715c459998a4	https://directus.bmulti.store/assets/d812b6c5-2b77-4af7-b701-d9aac4566736
104	2025-06-20 13:51:33.314311+00	681800761	80.234.52.96	t	t	check	200 рублей	WB	79272157427	https://directus.bmulti.store/assets/f8633d0f-3d27-43c7-9d5a-1627548b320d	https://directus.bmulti.store/assets/43846303-0aaf-4fc2-8f22-06fc7c9f9dae
105	2025-06-20 13:57:56.728002+00	5169236208	5.137.78.240	t	t	check	200 рублей	OZON	79069091637	https://directus.bmulti.store/assets/43f63bca-7a2e-4b35-b15d-341c922b836d	https://directus.bmulti.store/assets/8351ddf5-6a3b-4e25-8005-eb7b26cad7dc
107	2025-06-20 14:49:36.713751+00	428898535	94.233.239.33	t	t	check	200 рублей	OZON	79124348108	https://directus.bmulti.store/assets/ab9408a8-ebc7-42fd-8c57-e0decc0cbac6	https://directus.bmulti.store/assets/ac1e044d-294d-42f3-a007-12ef3fcd6799
109	2025-06-20 15:06:16.559109+00	1075303210	176.15.246.201	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/08bb7662-b062-4877-b9ab-d998ed1c76c7	https://directus.bmulti.store/assets/10b176da-c383-47f1-b92f-731f20cca36f
110	2025-06-20 15:06:21.606625+00	1075303210	176.15.246.201	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/dfe1fded-1422-4c12-9f8f-c5fd2bf9cc9a	https://directus.bmulti.store/assets/516fac26-dd2e-4fd4-9dcd-5e30c0bc7b9e
111	2025-06-20 15:06:53.111887+00	1075303210	176.15.246.201	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/ef737ebf-6b60-4eee-af49-0c8399db6b2c	https://directus.bmulti.store/assets/c0171d89-bd35-4f39-b888-dbef68c711c5
112	2025-06-20 15:17:49.716055+00	5230850603	95.153.162.181	t	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/8bdad5bd-f96d-426b-8d7b-50713cc4fceb	https://directus.bmulti.store/assets/e64e26f4-19b4-45e5-93db-140410998359
113	2025-06-20 15:17:57.875254+00	5230850603	95.153.162.181	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/f0f8aaa5-96d4-4a9d-af39-4ecd0cf061b2	https://directus.bmulti.store/assets/0fc8ca5e-0678-4f67-806b-4c5a13924074
125	2025-06-21 02:35:49.16205+00	5431590811	185.124.230.192	t	t	check	200 рублей	WB	79135628210	https://directus.bmulti.store/assets/bc53d9d9-0d27-4576-96f3-2f9f621dce2c	https://directus.bmulti.store/assets/6de5bd54-d22d-445d-b3a4-cac64cab6d1e
134	2025-06-21 05:44:23.457698+00	5227558851	95.78.238.111	t	t	done	200 рублей	OZON	79123450078	https://directus.bmulti.store/assets/23ed0562-9e24-4227-b964-4aedfce7c5d8	https://directus.bmulti.store/assets/6643dc74-1592-4fa1-b08d-c9e844aaa5b8
114	2025-06-20 15:42:06.156355+00	5628322882	217.66.156.166	t	t	check	200 рублей	OZON	79211146335	https://directus.bmulti.store/assets/f44702fe-79b2-486d-953f-921578ca76ed	https://directus.bmulti.store/assets/2e4b7fed-ec9f-4c77-82d7-2a25f97784ec
127	2025-06-21 03:51:09.755775+00	842039747	95.26.121.32	f	f	check	200 рублей	OZON	79372444500	https://directus.bmulti.store/assets/77c70e27-a507-4cc8-9178-5f676625cf16	https://directus.bmulti.store/assets/ab40c597-ae6a-4097-8c23-15eb750454fa
135	2025-06-21 05:47:55.089876+00	1697702559	5.253.188.117	t	t	done	200 рублей	OZON	79130276395	https://directus.bmulti.store/assets/1fe6bc2f-5462-4584-ab63-45258915fe47	https://directus.bmulti.store/assets/d602d05c-1ca0-48ff-9e6e-d6e63dab7cbd
128	2025-06-21 03:59:04.589308+00	451483829	77.91.77.254	t	t	check	200 рублей	OZON	79243076076	https://directus.bmulti.store/assets/d5568774-9a2f-4401-af20-13048b1c0487	https://directus.bmulti.store/assets/fb3c4944-210b-4b38-abb8-71d6967aef64
129	2025-06-21 04:54:10.210616+00	807676390	178.205.228.77	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/0bdd4cd6-a00d-4f2b-9320-d4b0863028bf	https://directus.bmulti.store/assets/67442e35-0b32-413d-8e16-f78a609cfb0d
130	2025-06-21 04:54:37.695211+00	807676390	178.205.228.77	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/895b8913-6b5d-4654-a128-141d788baa3e	https://directus.bmulti.store/assets/6e88a9c8-a7c5-461a-8874-d4153fe8f119
131	2025-06-21 04:54:59.555538+00	807676390	178.205.228.77	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/a6c8944c-13bb-47e7-900f-e064c66af6fd	https://directus.bmulti.store/assets/c55235b2-4623-4297-b7b9-73c75532a20d
117	2025-06-20 16:40:57.840494+00	7107075467	46.241.80.5	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/f5ae358e-22ad-4e2f-b83c-a87d184b3ef0	https://directus.bmulti.store/assets/d867b419-9468-4f07-a8e1-02545b871004
152	2025-06-21 10:49:14.198211+00	\N	79.127.154.35	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
120	2025-06-20 17:50:26.810823+00	1212318409	109.252.64.192	t	t	check	200 рублей	WB	79787921421	https://directus.bmulti.store/assets/516e4dc8-8be1-4357-b06e-621de99f8e23	https://directus.bmulti.store/assets/4dabe7af-48dc-4fb6-8f4c-b25ef31b1d54
118	2025-06-20 17:08:07.46199+00	1463778103	176.15.161.37	t	t	check	200 рублей	WB	79608088432	https://directus.bmulti.store/assets/e2c3b88b-a2eb-436d-8af3-ee231d40c9e1	https://directus.bmulti.store/assets/3d6d01b5-82c4-4d87-948f-10ab5381155f
121	2025-06-20 18:36:17.035898+00	1531392938	176.59.5.142	t	t	done	200 рублей	OZON	79522293008	https://directus.bmulti.store/assets/858df55f-1b68-4295-ba30-b1a07c368a58	https://directus.bmulti.store/assets/8673479a-a77b-4f39-8a35-c4ce10173d68
133	2025-06-21 05:28:39.689539+00	5305060038	178.46.214.176	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/9c697dd7-b599-44ed-bb04-ba8311c0243f	https://directus.bmulti.store/assets/4d746f02-370c-4e97-9b68-6b38be9910f8
116	2025-06-20 16:24:36.267184+00	5054649618	217.66.157.229	t	t	done	200 рублей	OZON	79112625188	https://directus.bmulti.store/assets/18b328fd-d3c2-432e-ad13-8676225626cd	https://directus.bmulti.store/assets/f44c3de5-92d2-4429-8da8-0c5c5a181947
115	2025-06-20 15:56:57.888177+00	1744502716	93.170.96.224	t	t	done	200 рублей	OZON	79803220257	https://directus.bmulti.store/assets/3400dc9e-ee63-431c-9119-45f5aa33a35f	https://directus.bmulti.store/assets/4ebadd7a-9f1b-4b06-927b-f888073c555c
119	2025-06-20 17:13:39.66986+00	572498964	95.71.67.36	t	t	done	200 рублей	OZON	79803890497	https://directus.bmulti.store/assets/aafaaee1-6b0a-433d-8afd-bcc9203962e7	https://directus.bmulti.store/assets/3d646019-2379-4d9d-94c9-1baa0f47e26a
322	2025-06-26 10:05:46.630897+00	934095727	109.252.44.49	t	t	done	200 рублей	OZON	79154539284	https://directus.bmulti.store/assets/a2d98cd8-89b8-4044-90a8-a922b52bbca7	https://directus.bmulti.store/assets/1a8e993c-7cb3-4fbc-97aa-3340e1f1a61f
136	2025-06-21 05:50:47.016874+00	6758527556	37.213.39.101	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/ea7a5e85-3abf-482e-91e2-2d3dea6046cf	https://directus.bmulti.store/assets/2778cffd-3ef5-454a-82bf-dde941d5df6d
123	2025-06-20 19:27:49.679546+00	5853324743	176.59.5.29	t	t	check	200 рублей	WB	79051290493	https://directus.bmulti.store/assets/798b0a31-5c87-4511-ab4e-64592200254a	https://directus.bmulti.store/assets/42b2f75a-d256-4add-ae5c-146c7c542121
137	2025-06-21 05:57:41.784061+00	5634957201	95.25.164.215	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/b26c577c-a9cf-40ba-b338-a9c0bbd8b9c3	https://directus.bmulti.store/assets/678758cc-da54-4d95-838e-7e5f8cd652a1
139	2025-06-21 06:55:24.416439+00	332623404	178.187.63.218	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/cbadc443-297f-416a-b905-dae3fb079348	https://directus.bmulti.store/assets/1a1bd093-9432-473e-a770-cfbaad3b65da
140	2025-06-21 07:11:11.105967+00	7532878468	178.178.241.128	t	t	check	200 рублей	WB	79222545496	https://directus.bmulti.store/assets/a45e734c-318e-4abc-8342-3b901c22aa11	https://directus.bmulti.store/assets/0c87ce6d-2754-4562-b3cf-88dea5b5a6fc
141	2025-06-21 07:22:57.117738+00	6372017992	89.113.127.68	t	t	check	200 рублей	WB	79521924278	https://directus.bmulti.store/assets/cbf1ef55-710d-4b88-b35a-8c4c251ef0a0	https://directus.bmulti.store/assets/9bad8e2a-8032-464a-9ea8-03dba9738e6a
132	2025-06-21 04:55:24.120915+00	807676390	178.205.228.77	f	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/83db2afc-72d3-42b0-a38f-a152a2ed9e08	https://directus.bmulti.store/assets/dd7eae77-a961-46aa-90de-b33edb986f04
153	2025-06-21 10:49:15.231089+00	\N	79.127.154.35	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
172	2025-06-21 15:15:28.890801+00	410917964	89.111.22.43	t	t	check	200 рублей	WB	79262812782	https://directus.bmulti.store/assets/f7bf5ee3-83f4-452f-825d-e5cfe1909925	https://directus.bmulti.store/assets/c0cb8214-fcb0-457a-81b8-37a85f5119e6
214	2025-06-22 16:35:09.315006+00	7464859230	5.165.41.237	t	t	check	200 рублей	OZON	79376566401	https://directus.bmulti.store/assets/57e80c04-147a-483a-b7f0-46318d2ca0b4	https://directus.bmulti.store/assets/25cc5d1d-2639-4234-b592-e1fe9b1e28cf
142	2025-06-21 07:31:07.966552+00	7025273847	95.170.189.62	t	t	done	200 рублей	WB	79659159796	https://directus.bmulti.store/assets/102e38d0-01e8-4ba3-b2c9-d35200a577e0	https://directus.bmulti.store/assets/e7c5f94d-f809-4cf4-bf61-a78fcd8ba9ed
451	2025-06-30 15:35:05.898136+00	1158831405	5.141.82.43	t	t	check	200 рублей	WB	79506461456	https://directus.bmulti.store/assets/413058fe-a8e0-4e75-b7f8-5010f1c30880	https://directus.bmulti.store/assets/0f4e6a3f-8749-4282-97e1-1e9cbc0966df
149	2025-06-21 09:17:39.122017+00	1996755887	85.140.118.56	t	t	done	200 рублей	WB	79123984729	https://directus.bmulti.store/assets/e44f96e5-fe71-438a-865c-5d264f4d9236	https://directus.bmulti.store/assets/9ec87b78-1765-4fd2-b8fb-c9f702c8d4b7
156	2025-06-21 11:24:42.48615+00	1937170228	178.207.75.13	t	f	done	200 рублей	WB	79274816183	https://directus.bmulti.store/assets/97f213e4-7f44-4f6c-af38-8a64af3a8de0	https://directus.bmulti.store/assets/75987828-794b-4cbc-b701-d77cd41145d6
159	2025-06-21 11:45:19.969377+00	6730217340	188.187.184.219	t	t	done	200 рублей	OZON	79877182445	https://directus.bmulti.store/assets/a90ceaac-f117-4701-9737-1d6d133e456f	https://directus.bmulti.store/assets/7bc72355-0fe0-4dd8-90d0-83032ec327fc
162	2025-06-21 13:11:12.00249+00	5837990560	79.139.207.167	t	t	done	200 рублей	WB	79772657695	https://directus.bmulti.store/assets/70880e22-3745-4c92-b2ac-4f640aa7a9c2	https://directus.bmulti.store/assets/6825885d-800d-4bd8-9a69-ef7d3177fede
144	2025-06-21 07:47:11.992998+00	6264573154	188.18.231.73	t	t	check	200 рублей	WB	79518161035	https://directus.bmulti.store/assets/ed9a050c-f4d2-4826-8ee4-fe237edf5e13	https://directus.bmulti.store/assets/7f5599ed-226e-4898-bb20-ac40b5eeeed4
167	2025-06-21 13:41:26.591287+00	986373759	79.139.174.116	t	t	done	200 рублей	WB	79031571023	https://directus.bmulti.store/assets/5b277372-b15d-465c-9ad4-8a3368a8b01a	https://directus.bmulti.store/assets/f10317a1-25d7-4f19-8d12-97d05667b7e1
169	2025-06-21 14:15:46.954001+00	936227742	188.232.228.4	t	t	done	200 рублей	OZON	79006745954	https://directus.bmulti.store/assets/6f3ea6fd-cfc6-4f98-a848-95140586aade	https://directus.bmulti.store/assets/11ea4a5d-77fc-427b-b9e9-eb7d496848fb
150	2025-06-21 09:32:12.899682+00	1345329852	77.238.249.161	t	t	check	200 рублей	OZON	79371405392	https://directus.bmulti.store/assets/7dba1374-a852-4540-a060-cbd72bd5ae37	https://directus.bmulti.store/assets/fb2c57b4-cc75-4752-bd32-cc6e866ec976
165	2025-06-21 13:29:43.753371+00	784240462	185.190.43.27	t	t	done	200 рублей	OZON	79507407497	https://directus.bmulti.store/assets/ccfacc61-bd56-4619-a04f-6608dfa31824	https://directus.bmulti.store/assets/823bcb9a-4fdd-4e7d-acc9-38debd5ccbd8
146	2025-06-21 08:27:23.711836+00	722512218	146.158.126.23	f	f	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/6b7ccc9e-8336-485d-b276-c56ba33f2c7d	https://directus.bmulti.store/assets/03223282-49f5-40a6-907e-10dc838218fd
157	2025-06-21 11:25:01.08775+00	1053925722	188.128.68.21	t	t	done	200 рублей	WB	79116985599	https://directus.bmulti.store/assets/435641db-d825-4b2b-921c-06937ae971d8	https://directus.bmulti.store/assets/c3401316-ce60-4abf-88a5-f4ed5b02df9f
154	2025-06-21 11:22:27.305014+00	881159747	178.214.251.230	t	t	done	500 рублей	WB	79173587312	https://directus.bmulti.store/assets/67c94ccb-4b21-4c04-85b4-1eb2995fd27c	https://directus.bmulti.store/assets/e0323b47-2242-43c4-929a-80c4527a017d
151	2025-06-21 10:42:15.597255+00	709891140	188.170.85.166	t	t	done	200 рублей	OZON	79203677481	https://directus.bmulti.store/assets/7224d5f7-5756-4904-8bae-1042f3a27382	https://directus.bmulti.store/assets/576e32eb-471d-4dd3-ac39-d3f28518de13
147	2025-06-21 08:41:48.840178+00	6858419013	62.3.34.187	t	t	done	200 рублей	OZON	79190329601	https://directus.bmulti.store/assets/88a99e01-536e-4b89-8215-4845e3a350bc	https://directus.bmulti.store/assets/130ebd3c-13ce-40b8-8408-c045aa372ca5
145	2025-06-21 07:54:46.846164+00	347469187	217.107.106.56	t	t	done	200 рублей	OZON	79209992104	https://directus.bmulti.store/assets/9edaef1b-f271-4f25-856e-1548a93601f2	https://directus.bmulti.store/assets/8ca339b9-4e9d-4750-a191-f9b8979cf47c
148	2025-06-21 08:52:34.152552+00	1169738700	151.249.164.217	t	t	check	200 рублей	WB	375291793053	https://directus.bmulti.store/assets/ec33cfed-2f6a-4be7-b198-4025973e704d	https://directus.bmulti.store/assets/05f3ab8b-82df-415f-b8a8-0e36e7d3b5c6
163	2025-06-21 13:22:53.039504+00	739831834	31.47.118.214	t	t	done	200 рублей	WB	79525027724	https://directus.bmulti.store/assets/e3dc5208-a7ae-4fa0-8eea-e79de7feb18a	https://directus.bmulti.store/assets/f76f05e1-013c-4b32-ba76-a8c023d14830
155	2025-06-21 11:23:03.396887+00	1076051657	46.174.112.20	t	t	check	200 рублей	OZON	79887640868	https://directus.bmulti.store/assets/7ea55bc7-db67-42aa-b302-8b2b1fa8064a	https://directus.bmulti.store/assets/a5c3f156-f9f5-4ad0-b58d-aa8c1fba5ecb
161	2025-06-21 13:03:26.747352+00	1469071223	94.233.249.93	t	t	check	200 рублей	OZON	79140250902	https://directus.bmulti.store/assets/9dda5fd0-00de-4d68-b359-b43dd4aabfc4	https://directus.bmulti.store/assets/f4ebd920-5b31-4d2e-beaf-52f0ecc3e369
158	2025-06-21 11:30:44.111059+00	1949944002	89.113.127.145	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/ae9dfafb-9601-43d4-acb3-0f819114c3cb	https://directus.bmulti.store/assets/d243b314-2e42-4e43-9d97-f24c6a048ca6
160	2025-06-21 12:15:51.454258+00	1763335545	176.59.170.142	t	t	check	200 рублей	WB	79205300159	https://directus.bmulti.store/assets/efcde573-4bd0-4d43-8c9f-95bc44d0af21	https://directus.bmulti.store/assets/e78c2a26-8fad-4514-a486-599b06371a64
164	2025-06-21 13:26:35.244991+00	5255508717	37.230.247.216	t	t	check	200 рублей	WB	79409301121	https://directus.bmulti.store/assets/e0d10dce-4eb9-4b4f-8b0f-8d35708b131b	https://directus.bmulti.store/assets/dcd867fa-5cd0-45c7-98a3-c65ec3927918
166	2025-06-21 13:31:35.543529+00	960893304	217.76.13.10	t	t	check	200 рублей	WB	37433331931	https://directus.bmulti.store/assets/41a4fa06-123f-40f1-90cf-f56612e9638e	https://directus.bmulti.store/assets/c4f729a2-7d4d-411e-92d2-85afec5f6722
168	2025-06-21 14:12:53.858198+00	446646919	213.87.132.90	t	t	check	200 рублей	WB	79192385218	https://directus.bmulti.store/assets/619b740d-3aa2-4d7a-9d7b-d1f34be2a303	https://directus.bmulti.store/assets/5bfadbca-c79a-4c41-9fc0-1f9fdb98aa22
170	2025-06-21 14:19:50.799019+00	5233834609	46.148.131.14	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/2d8d5850-bd4b-499b-931d-e3e902cdd67b	https://directus.bmulti.store/assets/4caff2d0-759a-468f-b819-e8586fa0eed0
171	2025-06-21 14:20:20.699081+00	6138468265	31.131.128.146	t	t	check	200 рублей	WB	79494703159	https://directus.bmulti.store/assets/f9ddfff8-dbec-48f0-9e88-5baa2c4f0433	https://directus.bmulti.store/assets/451f41f7-bc1e-49a9-b823-20e58bb37bcc
938	2025-08-01 05:38:34.707542+00	395347003	5.18.152.107	t	t	check	200 рублей	OZON	79217406914	https://directus.bmulti.store/assets/c92adc33-c7ca-4549-8c76-2c3180fa6e5f	https://directus.bmulti.store/assets/f0566508-2568-47b3-b91a-6b7695238e8a
194	2025-06-22 09:33:59.889256+00	1113312871	31.181.214.54	t	f	done	200 рублей	WB	79284266282	https://directus.bmulti.store/assets/ca6a72dc-4e4a-4800-a445-64a6ad4be62f	https://directus.bmulti.store/assets/3271c061-b95c-4ad8-86d6-c36dea59df28
185	2025-06-21 17:41:04.356329+00	2120979390	176.59.17.103	t	t	done	200 рублей	OZON	79936419554	https://directus.bmulti.store/assets/e662eca2-94db-4b2b-90fa-df8586e93d0e	https://directus.bmulti.store/assets/d35f2231-9e73-4f75-9591-f72a4ea4aebd
186	2025-06-21 17:53:11.443666+00	5390191078	176.99.110.127	t	t	check	200 рублей	OZON	79786657767	https://directus.bmulti.store/assets/2f717890-7d85-4b4e-b920-600ca26c68e5	https://directus.bmulti.store/assets/e446e44e-b9d6-48d9-a54b-338501f1b61c
176	2025-06-21 15:49:34.814028+00	630413972	83.220.239.100	t	t	done	200 рублей	OZON	79652530810	https://directus.bmulti.store/assets/e95342a9-968d-43db-8110-e39c16267fc4	https://directus.bmulti.store/assets/60d4b1b0-3e08-4975-b6d8-93787c61798e
188	2025-06-21 18:52:48.279436+00	8178943574	185.113.74.227	t	t	done	200 рублей	OZON	79788073564	https://directus.bmulti.store/assets/b85f4ccd-a5ef-4535-85b9-2fb062e11cfb	https://directus.bmulti.store/assets/89ee3fff-cf5c-48d6-9b0d-ee83cee9f34d
182	2025-06-21 17:22:37.747453+00	2046333139	46.48.23.18	t	t	done	200 рублей	OZON	79501977627	https://directus.bmulti.store/assets/8b85c852-9965-43bf-8658-ee5b569ed706	https://directus.bmulti.store/assets/6cd18fa2-7df9-4b4a-8cd4-2ecdbadda902
181	2025-06-21 17:15:01.580533+00	5932542147	85.249.22.28	t	t	check	200 рублей	WB	79644839245	https://directus.bmulti.store/assets/7683c0ef-3fcf-4c6f-b49b-824301996549	https://directus.bmulti.store/assets/32f20896-b8df-4388-97a7-836ea593751b
175	2025-06-21 15:30:45.680261+00	6110702295	84.53.229.64	t	t	check	200 рублей	WB	79961990905	https://directus.bmulti.store/assets/43aefe68-d3ab-43a3-b18c-489ba5f6273e	https://directus.bmulti.store/assets/7e198149-b6b9-45bb-b92a-6aa9192c959c
201	2025-06-22 11:51:44.880143+00	884138519	193.143.65.29	t	t	done	200 рублей	OZON	79959866875	https://directus.bmulti.store/assets/8462599c-3830-40fc-93ea-682d147d6790	https://directus.bmulti.store/assets/5a9c092f-99ac-43cc-a381-ff6ab56fea2c
200	2025-06-22 11:48:37.611842+00	5111632468	87.117.189.208	t	t	done	200 рублей	OZON	79872820687	https://directus.bmulti.store/assets/be907c57-d7df-4d10-a231-3f7eaec3f31b	https://directus.bmulti.store/assets/e00a95d1-05d0-495b-beb7-1ef9a68d5d56
198	2025-06-22 10:56:30.176318+00	1088622392	87.117.53.207	f	t	done	200 рублей	WB	79515272440	https://directus.bmulti.store/assets/666f41cf-0f9b-4edf-8dd8-e94638fb7b94	https://directus.bmulti.store/assets/6aa9b322-8c0a-4f1a-9548-d5866acdc130
277	2025-06-24 18:24:14.412066+00	\N	79.137.199.154	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
174	2025-06-21 15:23:18.743272+00	1060127420	95.78.36.37	t	t	done	200 рублей	OZON	79172957996	https://directus.bmulti.store/assets/fc2df6d4-3d4a-431e-a44b-f3ed05d202ef	https://directus.bmulti.store/assets/93bffc38-b477-48bc-9aad-5f83a0efd8e7
183	2025-06-21 17:23:52.306308+00	1676025880	80.253.235.58	t	t	done	200 рублей	WB	79149039549	https://directus.bmulti.store/assets/78242319-f4dd-4ade-bcf2-70b63035ba8f	https://directus.bmulti.store/assets/448b67a9-136d-4856-985a-77d77ce3d650
177	2025-06-21 15:54:33.955582+00	5490401606	5.142.47.175	t	t	check	200 рублей	WB	79915228584	https://directus.bmulti.store/assets/5b938f0a-5d9b-41bc-a6e7-9027c2f3d7b4	https://directus.bmulti.store/assets/8969cb6e-320e-488d-abb7-85900a6643d8
184	2025-06-21 17:25:09.571149+00	1393029947	46.0.76.63	t	t	done	500 рублей	WB	79126820921	https://directus.bmulti.store/assets/20ded675-bb8a-49bd-8075-525836ae442a	https://directus.bmulti.store/assets/3d6702d6-fcea-48be-9e02-a5df06a73fa5
178	2025-06-21 16:34:58.934445+00	5130718998	81.195.137.211	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/563aaa1c-1369-4ba0-877d-598e3229aa93	https://directus.bmulti.store/assets/70fa846b-2232-4295-a889-5e9ca28bc548
189	2025-06-21 19:25:30.848124+00	377521500	213.87.131.40	t	t	done	200 рублей	OZON	79686022272	https://directus.bmulti.store/assets/58f3aa0a-b51b-4e30-8be4-6783ef4107a1	https://directus.bmulti.store/assets/9b87a69b-5be1-45c5-a66f-9cacd7ded58c
180	2025-06-21 17:05:11.23766+00	1266729873	95.26.106.79	t	t	done	200 рублей	OZON	79372408997	https://directus.bmulti.store/assets/65335915-1dc8-4410-98ee-e3fccf93350c	https://directus.bmulti.store/assets/82227402-6e6f-4374-8095-5bba22379ba3
179	2025-06-21 16:35:11.837436+00	5130718998	81.195.137.211	f	f	check	200 рублей	WB	79001333371	https://directus.bmulti.store/assets/99c37756-8604-4bc5-9602-9dc316eab17c	https://directus.bmulti.store/assets/28e77049-91e3-4af8-94ba-583a079834c0
279	2025-06-25 03:34:10.352454+00	\N	85.140.163.177	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
192	2025-06-21 23:45:41.209177+00	5060531193	95.26.210.103	t	t	done	200 рублей	OZON	79147715747	https://directus.bmulti.store/assets/c41b13b5-f103-4b01-8401-9f52aca5c0f9	https://directus.bmulti.store/assets/5b3200c4-1f25-4a4f-9378-798ccb3ba267
193	2025-06-22 03:04:40.08293+00	1107582264	88.206.31.207	t	t	done	200 рублей	WB	79080515907	https://directus.bmulti.store/assets/f182ef1c-24d6-4cc7-85cc-c9e557fc7c6c	https://directus.bmulti.store/assets/e5f44393-c870-4952-8340-b364a6702b8f
187	2025-06-21 18:10:47.404032+00	5423027349	46.216.64.238	t	t	check	200 рублей	OZON	375297267343	https://directus.bmulti.store/assets/1a299f75-8386-4137-8e0a-e8a05a2d46f3	https://directus.bmulti.store/assets/21f3a9b4-20e2-478a-b011-f3df122a955d
190	2025-06-21 19:43:42.086599+00	6868976406	5.140.78.149	t	t	check	200 рублей	OZON	79028005328	https://directus.bmulti.store/assets/b6711b10-9e0b-4ec9-adca-42b03da25ce3	https://directus.bmulti.store/assets/da8354c1-c523-48a1-b310-40f0f58d2646
195	2025-06-22 10:03:35.44166+00	1309204514	80.83.239.34	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/c1c990d0-ae4f-475c-9f6e-c573d92be537	https://directus.bmulti.store/assets/238b0549-b53c-4f18-a2a6-931672be3564
191	2025-06-21 21:20:43.879841+00	7688044316	128.204.75.31	t	t	check	200 рублей	WB	79315002891	https://directus.bmulti.store/assets/3e238e13-e049-4d7e-92f1-b945b2367df4	https://directus.bmulti.store/assets/df82ca85-3363-4d4f-a74e-69d0a5441c83
196	2025-06-22 10:03:51.190941+00	1309204514	80.83.239.34	f	f	check	200 рублей	OZON	79145864845	https://directus.bmulti.store/assets/8f24e0d3-753b-42ba-bb30-05825b7231ca	https://directus.bmulti.store/assets/a8000326-c429-416e-95cc-0b77c64bc1b8
197	2025-06-22 10:08:41.110312+00	901322521	85.249.18.94	t	t	check	200 рублей	OZON	79095585835	https://directus.bmulti.store/assets/f64857a6-bd4b-459f-8a07-04c6c088102b	https://directus.bmulti.store/assets/67a14c54-0904-4595-b8e5-31b8c7e9c3bd
199	2025-06-22 11:45:27.84913+00	733967888	37.212.51.241	t	t	check	200 рублей	WB	375336331437	https://directus.bmulti.store/assets/4a68bc76-92eb-4f33-9159-7497dbd18fff	https://directus.bmulti.store/assets/c4022cae-2c0a-421c-8afc-28c504108ae6
627	2025-07-11 05:14:07.422377+00	2118044162	213.87.162.209	t	t	done	200 рублей	OZON	79106153407	https://directus.bmulti.store/assets/dcb371b3-3e9b-49ee-9c47-ce5308ff856d	https://directus.bmulti.store/assets/88cb9f4d-875f-4d0f-b8a9-57ed1eca7ff9
202	2025-06-22 11:58:45.180953+00	6328969392	188.162.251.240	t	f	check	300 рублей	OZON	79870661146	https://directus.bmulti.store/assets/86e31b33-81fc-421c-ba65-6d3e68ba11b4	https://directus.bmulti.store/assets/df9b848a-ea5c-4162-9ea5-25069ac921c0
266	2025-06-24 15:02:14.530187+00	1774479204	176.212.204.16	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/16c818c9-13af-4e4a-8393-532caf51d64d	https://directus.bmulti.store/assets/1d79073b-ecb9-4f88-a8c0-92e32e1555a4
216	2025-06-22 16:56:02.818398+00	5107562422	185.211.158.6	t	f	check	200 рублей	WB	79184886117	https://directus.bmulti.store/assets/d5e86613-dd81-43d1-ba0b-41463cf0a377	https://directus.bmulti.store/assets/c3586e81-61ab-406a-81e3-d08c939868b5
220	2025-06-23 07:50:14.804104+00	183750093	79.139.169.105	t	t	done	200 рублей	OZON	79372850005	https://directus.bmulti.store/assets/b1549b0a-61c8-45a0-b0b0-94b5279715de	https://directus.bmulti.store/assets/f9dd0b12-e60c-4b59-8008-71e9624a12c8
223	2025-06-23 09:48:38.551619+00	5682771625	93.159.217.16	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/ee151f09-64b3-4f8d-a717-b10c644b0585	https://directus.bmulti.store/assets/59080128-a0b4-4202-8676-26f981401090
204	2025-06-22 12:46:54.798256+00	1500856565	79.105.60.88	t	t	check	200 рублей	OZON	79619539892	https://directus.bmulti.store/assets/9a27d6c3-5df5-4b6b-9932-766dca187003	https://directus.bmulti.store/assets/7813cc93-1dc2-459a-8daa-12b6041aecaa
219	2025-06-22 22:16:03.336855+00	390930028	80.85.141.55	t	t	done	200 рублей	WB	79147162087	https://directus.bmulti.store/assets/6660c713-216c-4737-9d1f-caef78ccba39	https://directus.bmulti.store/assets/52f8dffb-d541-42f9-88d4-580ce6ae67c4
218	2025-06-22 18:35:27.690547+00	514191796	46.148.59.255	t	t	done	200 рублей	WB	79867651059	https://directus.bmulti.store/assets/9c45850d-3b88-4f89-b1ad-3b3a89a2a386	https://directus.bmulti.store/assets/e5a9317c-0a1f-4133-b025-2ba6a1ec8a4c
205	2025-06-22 13:37:28.460863+00	645799237	5.227.9.242	f	t	check	200 рублей	WB	79524419712	https://directus.bmulti.store/assets/b6e35961-35f9-4beb-b5b2-2bc79271ab7a	https://directus.bmulti.store/assets/c2ee9274-9c8e-4bbb-8c1a-223f9aea8072
217	2025-06-22 18:10:56.109274+00	1653839649	109.252.32.84	t	t	done	200 рублей	WB	79877051938	https://directus.bmulti.store/assets/62418302-8986-4403-a8c3-11e41924f44c	https://directus.bmulti.store/assets/c7f8aa56-8b72-4e98-95bd-86d6e2b60cde
210	2025-06-22 15:33:20.210895+00	2100985938	5.44.169.81	t	t	check	200 рублей	OZON	79130010260	https://directus.bmulti.store/assets/6d6b2fd3-4fb5-495c-be49-a2aa20dd3b98	https://directus.bmulti.store/assets/968b474b-770a-4811-8928-a02fb5e61e05
206	2025-06-22 14:27:53.291388+00	451290190	95.25.175.26	t	t	check	200 рублей	WB	79528531058	https://directus.bmulti.store/assets/b350da59-77db-46f7-b76c-367f9a7cbff4	https://directus.bmulti.store/assets/e5399a67-9224-4161-9b53-db7a52bf35f9
213	2025-06-22 16:01:05.37436+00	5876976875	151.0.17.222	t	t	done	200 рублей	OZON	79495300872	https://directus.bmulti.store/assets/3ac9fa52-b623-40ed-b8fa-d267e3c9d576	https://directus.bmulti.store/assets/12a14e79-d5f5-4e39-8a7d-9108757a5102
212	2025-06-22 15:39:25.809523+00	2032122132	95.139.145.210	t	t	done	200 рублей	OZON	79622744443	https://directus.bmulti.store/assets/1f52f677-ced3-44c2-b724-c1eb4701c6d6	https://directus.bmulti.store/assets/ca06d5e6-2025-4ce1-9f5b-09651e97ef95
211	2025-06-22 15:36:12.489935+00	845733325	185.32.134.166	t	t	done	200 рублей	OZON	79855077022	https://directus.bmulti.store/assets/37691d7b-16c0-4d2a-9582-e64579fb78ce	https://directus.bmulti.store/assets/d48517d0-7d9f-463e-8b05-27fcddc956dd
209	2025-06-22 15:23:49.807998+00	1111919606	89.221.226.45	t	t	done	200 рублей	OZON	79624991913	https://directus.bmulti.store/assets/bd5575c2-db05-419a-9ce1-78ff8d08256a	https://directus.bmulti.store/assets/c23e13ed-5924-4f7d-b290-b4c4042f67d6
207	2025-06-22 14:44:45.004377+00	139508884	95.79.31.189	t	t	done	200 рублей	OZON	79601640627	https://directus.bmulti.store/assets/5f56d697-98f3-4c65-9c91-6ebc2257d03b	https://directus.bmulti.store/assets/8c3a542b-f107-478e-9e99-d69873e2b159
208	2025-06-22 15:02:47.415103+00	5030533815	77.51.92.85	t	t	done	200 рублей	OZON	79652118582	https://directus.bmulti.store/assets/a738d32a-62ab-49a9-8b33-63b4a876c57a	https://directus.bmulti.store/assets/92acd047-da53-4fcb-bc8b-e4b6a70ab553
203	2025-06-22 12:11:17.043176+00	865165487	46.138.58.194	t	t	done	200 рублей	OZON	79252359707	https://directus.bmulti.store/assets/1f923bc5-34c3-4c34-8122-94fe082a09bc	https://directus.bmulti.store/assets/66cf4b2a-5634-4b83-a01f-bc3e165bea0c
224	2025-06-23 09:48:42.250314+00	5682771625	93.159.217.16	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/0cacc3e3-3793-476d-bb64-7d7cdeef0c3d	https://directus.bmulti.store/assets/685d5018-90a7-446b-89d1-78ed41eac7de
230	2025-06-23 11:08:27.417614+00	5304082055	178.34.119.210	t	t	done	200 рублей	WB	79180470175	https://directus.bmulti.store/assets/cb41429f-b1c6-442b-9f68-e6dd2f3e84f2	https://directus.bmulti.store/assets/f779a1dd-8ed9-4c20-82e2-99aa8f51c2e4
225	2025-06-23 09:49:08.671493+00	5682771625	93.159.217.16	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/a7066a41-ca99-453e-a677-141e8bfad0a5	https://directus.bmulti.store/assets/1f360579-911e-4d3c-a6da-ce73ed7df9a1
221	2025-06-23 08:18:17.547536+00	944114591	94.231.136.198	t	t	done	200 рублей	WB	79397518269	https://directus.bmulti.store/assets/a0ee7f3d-d62a-4f53-85a4-b11128d1e33c	https://directus.bmulti.store/assets/5f515825-9346-494d-bec4-b22027ba236c
227	2025-06-23 10:37:28.689455+00	5333137445	46.159.134.173	t	f	done	200 рублей	OZON	79186275449	https://directus.bmulti.store/assets/557dccc2-b2f9-4a77-b37c-2c67ce653859	https://directus.bmulti.store/assets/2a1e4632-e3a3-4938-ac74-7e73cd9d8e7b
226	2025-06-23 09:55:19.719714+00	2121338756	95.179.126.9	t	t	check	200 рублей	WB	79513024955	https://directus.bmulti.store/assets/cde40205-6d38-4c5e-8a6e-5c4918b57c75	https://directus.bmulti.store/assets/d6f9e2df-b4f6-467a-9cda-0b92f7ff9bdd
222	2025-06-23 08:24:25.639444+00	469653157	89.23.145.21	t	t	done	200 рублей	OZON	79093774673	https://directus.bmulti.store/assets/f896b32f-c6ad-4da5-a664-baf99cd056a1	https://directus.bmulti.store/assets/3730a584-ad59-45ac-8b87-608752e232c6
228	2025-06-23 10:44:44.961723+00	5402703540	85.175.137.199	t	f	check	200 рублей	WB	79184886117	https://directus.bmulti.store/assets/581ae0c7-b46e-499f-974c-209f8334d28c	https://directus.bmulti.store/assets/5945802f-2a29-435d-8330-9191c6fd5839
229	2025-06-23 11:04:57.220653+00	726865792	178.252.198.94	t	t	check	200 рублей	OZON	79051188146	https://directus.bmulti.store/assets/42d38438-7dea-4749-bb6a-99a504ed99f1	https://directus.bmulti.store/assets/77e08191-d1fe-4aa9-ab55-64b5c9d44d07
231	2025-06-23 11:34:53.567179+00	5971422897	185.135.151.206	t	t	check	200 рублей	WB	79106008358	https://directus.bmulti.store/assets/2d3e5f0e-ff6b-4b33-8c4c-47ff1ad66f11	https://directus.bmulti.store/assets/7571c5b7-86f1-4398-b319-25f94aa78e93
232	2025-06-23 11:50:20.709468+00	957576155	212.34.132.237	t	t	check	200 рублей	OZON	79131248833	https://directus.bmulti.store/assets/0e8908cc-ea23-4521-832e-17437ff98f5b	https://directus.bmulti.store/assets/8322e1d4-0c7b-48be-b8a4-5e909e0061fc
259	2025-06-24 07:10:47.352966+00	2088417975	5.164.200.26	t	t	done	200 рублей	WB	79087272349	https://directus.bmulti.store/assets/4854b4ce-eab5-4fe8-8a22-2405f8eb1e67	https://directus.bmulti.store/assets/d2413acf-1744-441c-8e4f-17df179def7b
240	2025-06-23 15:18:44.88184+00	406728363	95.153.162.74	f	t	check	200 рублей	OZON	79288493907	https://directus.bmulti.store/assets/ff95c93b-6bd4-4f63-8539-b4099b4dbddc	https://directus.bmulti.store/assets/d2c65663-1042-45c0-bd6f-24c4837c1b55
143	2025-06-21 07:31:26.700251+00	5354481743	178.186.241.253	t	t	done	200 рублей	OZON	79132794318	https://directus.bmulti.store/assets/29b0d614-0b72-4679-a0b1-5e7be3d37cb3	https://directus.bmulti.store/assets/60c6be6c-db12-460c-b871-642935866b8e
258	2025-06-24 06:18:51.104192+00	1068562891	94.41.248.254	t	t	done	200 рублей	WB	79177775001	https://directus.bmulti.store/assets/5e9a8e6b-e9f2-49e9-aabc-7aaf5382cf2c	https://directus.bmulti.store/assets/b7801562-db8d-43fd-940b-646e6106cd74
255	2025-06-23 21:10:43.465826+00	825936097	46.159.167.5	t	t	done	200 рублей	WB	79952028127	https://directus.bmulti.store/assets/cf514359-d65f-4075-a775-d033d74a1b23	https://directus.bmulti.store/assets/22a834de-84cb-4fba-9fff-e4ec84f28029
253	2025-06-23 19:08:44.459812+00	970299125	95.55.237.18	t	t	done	200 рублей	OZON	79814680133	https://directus.bmulti.store/assets/14a7284f-bb6d-4229-a3b2-096805b80b11	https://directus.bmulti.store/assets/adc34cfe-f488-4d5f-8114-c094b43f3e24
234	2025-06-23 12:34:16.475422+00	322303585	79.105.224.184	t	t	check	200 рублей	OZON	79671943585	https://directus.bmulti.store/assets/bdba3b6f-8b95-425c-a72f-a72a4fe5d775	https://directus.bmulti.store/assets/92f2a129-e1f0-4638-ae36-a3e742323df0
250	2025-06-23 18:25:43.277509+00	1758404459	194.32.230.62	t	t	done	200 рублей	OZON	79081334804	https://directus.bmulti.store/assets/455f0bb1-16fa-4b05-928a-269c745274a3	https://directus.bmulti.store/assets/ba38402f-1327-4ec8-a934-c851b2054576
247	2025-06-23 16:54:51.395254+00	829187155	77.79.157.49	t	t	done	200 рублей	OZON	79991693775	https://directus.bmulti.store/assets/b7eab833-581f-429d-b39d-23f505533725	https://directus.bmulti.store/assets/49f881d0-af99-4be0-96e5-f440a956421f
246	2025-06-23 16:45:42.62284+00	453490017	94.41.238.202	t	t	done	200 рублей	OZON	79174366610	https://directus.bmulti.store/assets/b4e6c730-b70e-4eb2-928b-b8f45c8cca28	https://directus.bmulti.store/assets/105dbbb8-09a6-4602-af58-79d05df583f6
237	2025-06-23 14:32:42.403999+00	5281567168	90.151.91.226	t	t	done	200 рублей	WB	79923124594	https://directus.bmulti.store/assets/0db3fa71-072a-4d25-bf5b-2e16fee8f4dd	https://directus.bmulti.store/assets/fba820c7-aa90-4495-b021-3a935caffcc2
235	2025-06-23 12:35:40.698836+00	1240458307	95.153.162.6	t	t	done	200 рублей	WB	79881074778	https://directus.bmulti.store/assets/646bc3f5-440e-4f59-888b-36848973f772	https://directus.bmulti.store/assets/f06ec82d-4f14-461f-967e-8fd66c396189
233	2025-06-23 11:54:09.432605+00	483621872	91.224.254.193	t	t	done	200 рублей	OZON	79081747701	https://directus.bmulti.store/assets/7659391f-58b8-4f25-ba93-37bc982b14c7	https://directus.bmulti.store/assets/13c9b138-80ec-4061-9de5-f0585079ca9f
236	2025-06-23 13:37:27.559448+00	2013956769	109.230.128.227	t	t	check	200 рублей	OZON	79111388100	https://directus.bmulti.store/assets/c967140d-d9af-4496-8393-38d5522bba07	https://directus.bmulti.store/assets/d261cebd-dd7d-4a77-99a2-5979acc0e26f
260	2025-06-24 08:45:46.930566+00	7025273847	51.15.132.243	t	t	done	200 рублей	OZON	79659159796	https://directus.bmulti.store/assets/46acb355-59fa-4048-bd07-84389ba4be6a	https://directus.bmulti.store/assets/4d750bbe-6fc4-41b4-b753-3f54c8e6637e
256	2025-06-23 21:39:31.385474+00	1927180462	178.46.87.8	t	t	done	200 рублей	OZON	79644873070	https://directus.bmulti.store/assets/2193a26e-0cb3-4944-b8ed-ab67da084bc9	https://directus.bmulti.store/assets/b4ccd3d9-1d0f-4c48-afcb-921c94fd134a
241	2025-06-23 15:30:12.375062+00	7132304548	176.213.225.230	t	f	check	200 рублей	WB	79373206525	https://directus.bmulti.store/assets/867187e2-e5bd-4cb2-97e8-e97082b5c50e	https://directus.bmulti.store/assets/f5469cd0-7135-45ba-b590-edeb65aa96a0
323	2025-06-26 10:11:45.237429+00	5359674614	78.30.251.33	t	t	done	200 рублей	WB	79786969409	https://directus.bmulti.store/assets/71f843b5-cac0-4f6a-96cb-d010329f36f1	https://directus.bmulti.store/assets/f3cc95bc-af2a-4ee9-9b57-46bb004f8684
1233	2025-08-16 18:55:29.018946+00	309001292	62.192.153.70	t	t	check	200 рублей	WB	79160895505	https://directus.bmulti.store/assets/b7525455-8bb3-4e2d-ab92-fab789f19428	https://directus.bmulti.store/assets/353ca970-4d70-4159-885c-8c0057760246
238	2025-06-23 14:50:13.083577+00	6271602519	178.68.112.233	t	t	check	200 рублей	OZON	77113218072	https://directus.bmulti.store/assets/d05baf81-925a-419f-88cb-bd02c39c04e0	https://directus.bmulti.store/assets/9b257280-798a-4e11-9564-3f31d7b314ab
470	2025-07-01 16:25:38.455191+00	\N	62.93.165.149	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
243	2025-06-23 15:58:24.63486+00	1058585805	95.73.221.153	t	t	check	200 рублей	WB	79067120717	https://directus.bmulti.store/assets/e240c48b-34c7-4060-8875-30d4eb7fd0fd	https://directus.bmulti.store/assets/15ef89a9-e205-434f-afcb-c8376049043a
244	2025-06-23 16:23:37.078053+00	5646187115	78.109.64.125	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/17d0b6d2-03a5-4bb9-9ef8-e766724290ac	https://directus.bmulti.store/assets/36957e12-079b-4821-85b2-29671d2be936
245	2025-06-23 16:32:50.631011+00	6816553856	178.219.169.41	t	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/57fd4b85-8559-4dab-b05f-4c256693adac	https://directus.bmulti.store/assets/62d1f356-fe9e-485a-b671-894218c70f50
249	2025-06-23 18:25:24.463506+00	1605959211	176.212.40.200	f	t	check	200 рублей	OZON	79889976390	https://directus.bmulti.store/assets/85d8c27d-74ad-4ea2-a927-6efa7ea4ee58	https://directus.bmulti.store/assets/2e7c24cf-58d6-403c-b18b-6ccba90164b4
252	2025-06-23 19:07:17.683895+00	501799004	77.87.98.71	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/540eeb18-bfb0-44a4-8485-6e9ff5d92b88	https://directus.bmulti.store/assets/4820a278-4f32-496e-8c84-7f6bc3bdb296
248	2025-06-23 17:24:23.4699+00	1785047047	176.59.170.229	f	f	check	200 рублей	OZON	79267085828	https://directus.bmulti.store/assets/34cb66ff-9f68-4a9c-a4ad-95e39ca7424a	https://directus.bmulti.store/assets/b1eb344b-d952-4c38-815c-b6f2b743f331
251	2025-06-23 18:31:04.640646+00	1337208763	46.172.211.69	f	t	check	200 рублей	WB	79781679846	https://directus.bmulti.store/assets/425f1a09-774f-4e44-84d3-0813b6e97bb8	https://directus.bmulti.store/assets/9003db9c-b83e-4aab-b76b-4aa1be2bce8f
254	2025-06-23 19:47:24.464912+00	901105779	46.138.163.214	t	t	check	200 рублей	OZON	79778310690	https://directus.bmulti.store/assets/c161f180-3694-46ba-8317-5bb8eab01090	https://directus.bmulti.store/assets/7eb9b902-255a-439f-817b-2df6a659ed70
257	2025-06-24 02:34:04.933496+00	7890852832	79.127.142.144	t	f	check	200 рублей	WB	79513995955	https://directus.bmulti.store/assets/3a832435-943e-4909-a4e4-72af35a12475	https://directus.bmulti.store/assets/efb1eb41-a6ca-486f-a95d-39d5fc55173b
122	2025-06-20 19:02:31.557249+00	1971040100	85.193.66.77	t	t	done	200 рублей	WB	79780291742	https://directus.bmulti.store/assets/98e2c692-633b-40b0-93bc-e7adeca0dde2	https://directus.bmulti.store/assets/20620be6-9a37-4cba-b84a-22a404fe76cd
263	2025-06-24 12:42:49.527677+00	1754895772	90.151.90.137	t	t	check	200 рублей	OZON	79208374961	https://directus.bmulti.store/assets/8880f672-d8ce-4873-97df-11dc58a8a03a	https://directus.bmulti.store/assets/f1b47fc7-a55f-4495-8365-13df61c3154c
265	2025-06-24 14:46:32.33011+00	326505454	46.180.83.8	t	t	check	200 рублей	OZON	79133033703	https://directus.bmulti.store/assets/858fee12-8d1d-479c-8ff4-66df83b774a1	https://directus.bmulti.store/assets/1c708447-4a37-4d09-8be6-d859cd70b101
215	2025-06-22 16:55:21.131699+00	466857007	81.201.19.120	t	f	done	200 рублей	OZON	79111486385	https://directus.bmulti.store/assets/32de45a7-6641-496f-8c03-86eddbd5d080	https://directus.bmulti.store/assets/7bff05c3-aca2-4836-b028-65615061d15e
452	2025-06-30 15:40:17.476977+00	2083031845	176.212.108.111	t	t	check	200 рублей	OZON	79532805338	https://directus.bmulti.store/assets/acb49ef9-286f-49ec-88d4-45c7a5430365	https://directus.bmulti.store/assets/aae105b0-7aac-4594-8089-4a3e29d4b35d
275	2025-06-24 18:12:24.362522+00	2011165925	185.25.177.153	t	t	done	200 рублей	WB	79507107963	https://directus.bmulti.store/assets/eccaf2bc-3a63-4f69-80b5-8c0ec8e5adc8	https://directus.bmulti.store/assets/331d1d51-44b2-45a3-ab9d-75686e9718ea
280	2025-06-25 05:19:53.024492+00	979026931	83.234.200.215	t	t	done	200 рублей	WB	79961183230	https://directus.bmulti.store/assets/49a8d236-9b83-405e-b54f-bad2de6d3186	https://directus.bmulti.store/assets/82a895db-6503-472b-9c47-31dc47da7ed9
262	2025-06-24 12:21:41.495207+00	271097785	95.170.180.194	t	t	check	200 рублей	WB	79831483577	https://directus.bmulti.store/assets/5ae3d276-a038-4c9c-9111-33c448131d81	https://directus.bmulti.store/assets/4108776d-1e5a-4d5d-9149-e3ef156d7a64
267	2025-06-24 15:13:44.806607+00	986007	83.217.9.159	f	t	check	200 рублей	OZON	79117791177	https://directus.bmulti.store/assets/238ee2e5-f2c4-4524-9365-2927f4034ab9	https://directus.bmulti.store/assets/5dd0a539-11f6-4ca8-86e0-fd1bdd514d8d
283	2025-06-25 08:19:36.320893+00	5239365659	95.153.182.103	t	t	done	200 рублей	OZON	79821663609	https://directus.bmulti.store/assets/9e0dfdb2-13ba-4456-b58c-77b1c9658986	https://directus.bmulti.store/assets/ad1c2970-487f-4d25-8d49-99dd6e9c5b15
282	2025-06-25 08:09:57.673962+00	6885149252	37.1.142.11	t	t	done	200 рублей	OZON	79506373190	https://directus.bmulti.store/assets/d5b3922a-73ca-44b1-9255-ab402dc4b6f1	https://directus.bmulti.store/assets/3815c802-ab4e-40f4-8afe-f6439ea6bc34
284	2025-06-25 08:58:40.965081+00	5107977209	46.151.151.13	t	t	done	200 рублей	WB	\N	https://directus.bmulti.store/assets/e81e45f0-ed42-4892-996b-58a047bde182	https://directus.bmulti.store/assets/f4c162ed-b731-4190-b036-c1abc01dd8e4
286	2025-06-25 09:38:15.44613+00	5244626543	95.26.168.27	t	t	done	200 рублей	OZON	79216891638	https://directus.bmulti.store/assets/e86bf664-ae0c-4f50-a5f6-9ac8019819f4	https://directus.bmulti.store/assets/4a5d2a77-7548-4bb2-b429-a4df0502fc0e
268	2025-06-24 15:18:55.386073+00	473364183	37.195.89.19	t	t	check	200 рублей	WB	79130676416	https://directus.bmulti.store/assets/36a12975-f745-4e6a-b3f5-956aecfe8097	https://directus.bmulti.store/assets/7ce76de5-944c-4d1c-bbf5-e64462637db1
270	2025-06-24 16:20:12.547093+00	1651038109	51.158.114.99	t	t	check	200 рублей	WB	79964502426	https://directus.bmulti.store/assets/67961af0-f21c-4618-a5fe-d039a1fe2262	https://directus.bmulti.store/assets/77464b0e-fdc3-4380-97c1-0c6ebcff064f
138	2025-06-21 06:32:13.15899+00	440294945	212.164.112.70	t	t	done	200 рублей	OZON	79231753577	https://directus.bmulti.store/assets/1a62247b-98d1-4477-b5f5-122a926fecc6	https://directus.bmulti.store/assets/93a09993-b00a-4d1e-8e3f-931c66744ebc
276	2025-06-24 18:23:31.919335+00	460043511	87.117.185.135	t	t	check	200 рублей	WB	79992644428	https://directus.bmulti.store/assets/d8868873-b069-438d-9291-72223dae91e7	https://directus.bmulti.store/assets/d66e0a42-05b1-440c-a219-c457851e8c5f
281	2025-06-25 06:28:07.686629+00	1047520656	176.59.151.191	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/7dfb01cb-e467-4dbc-9bbf-ebab79e74375	https://directus.bmulti.store/assets/2c099ed1-dfdc-4b19-a810-7410468e7067
239	2025-06-23 15:05:51.741034+00	383802915	37.212.5.5	t	t	done	500 рублей	OZON	375295687788	https://directus.bmulti.store/assets/3b25f2c2-9b07-49dc-b498-5bb9bfd11efb	https://directus.bmulti.store/assets/69d95b30-3974-45c0-aa40-d9a7ae585977
173	2025-06-21 15:22:07.635092+00	1903986972	78.85.49.137	t	t	done	200 рублей	OZON	79957988852	https://directus.bmulti.store/assets/8415adc3-d840-41c5-af31-2af05e5d68b7	https://directus.bmulti.store/assets/6ff09778-ff5b-4706-bfee-ecdf7ffbb49c
285	2025-06-25 09:16:43.450278+00	5236772003	46.38.15.193	t	t	check	200 рублей	OZON	79098992609	https://directus.bmulti.store/assets/8a2f82e1-3989-4e84-a2c3-73bff67ed84c	https://directus.bmulti.store/assets/a145298d-3b4f-415b-9579-b299fc48373c
287	2025-06-25 09:43:09.84647+00	1020220472	78.30.251.33	t	t	check	200 рублей	WB	79780918426	https://directus.bmulti.store/assets/3dffee5d-4bfb-429d-b537-8852206dd4e8	https://directus.bmulti.store/assets/eed8df35-1eba-4ced-90fb-6c4263eebf46
288	2025-06-25 09:49:45.253184+00	6357819567	95.78.24.44	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/3a64318b-436b-48c7-953e-9ff3f8900164	https://directus.bmulti.store/assets/66fcfb72-b3c9-4536-9699-d86179dae37f
289	2025-06-25 10:15:57.220184+00	7114458841	178.170.169.216	t	t	check	200 рублей	OZON	79516396165	https://directus.bmulti.store/assets/70020f2e-5075-4c7e-bfd5-e3ce25dd6ff7	https://directus.bmulti.store/assets/8beadb8e-2d8f-411b-8eb2-27dfdeb56f00
274	2025-06-24 17:24:21.646582+00	885087044	31.222.229.236	f	t	done	200 рублей	OZON	79965167508	https://directus.bmulti.store/assets/97e83f68-a244-45db-9047-6ef09cc75a80	https://directus.bmulti.store/assets/42ad5da2-bae8-47b0-8ee4-09e3f0672169
272	2025-06-24 17:01:02.11293+00	1122299623	5.167.159.222	t	t	done	200 рублей	OZON	79384717101	https://directus.bmulti.store/assets/e7b98cbd-04c1-483a-a125-7c15fbb26a8c	https://directus.bmulti.store/assets/49b45ecb-7b2f-487b-8fac-ee643680b775
273	2025-06-24 17:15:40.862886+00	995076919	212.74.202.186	t	t	done	500 рублей	WB	79069457170	https://directus.bmulti.store/assets/3751485d-c3a7-4311-9364-8e563746632d	https://directus.bmulti.store/assets/bd657da0-93d4-440b-ac8f-e11aa2b0d45d
271	2025-06-24 16:41:04.566586+00	5074431432	93.171.47.62	t	t	done	200 рублей	OZON	79504936095	https://directus.bmulti.store/assets/83696d08-89f4-44c2-9333-8ab928ee9c3f	https://directus.bmulti.store/assets/f2c8b5de-50cf-4c58-904f-e8fc46f300de
261	2025-06-24 11:36:36.635842+00	5183822315	92.252.211.50	t	t	done	200 рублей	OZON	79603766566	https://directus.bmulti.store/assets/ce68fec2-ce6c-4d0c-bd42-cb9dd2372ecd	https://directus.bmulti.store/assets/e8529413-8ef8-42e3-8316-50c8c615b37c
278	2025-06-24 18:42:05.843139+00	811741583	31.185.6.43	t	t	done	200 рублей	WB	79645941112	https://directus.bmulti.store/assets/e0d58238-519a-4ac8-9265-bcf5b8f250c7	https://directus.bmulti.store/assets/f58b7000-80bf-40f2-a370-689650ba338d
269	2025-06-24 16:06:29.559199+00	1100401643	80.64.31.235	t	t	done	200 рублей	OZON	79204496738	https://directus.bmulti.store/assets/a2e1335f-8627-4d9b-9bfb-24ea89283e92	https://directus.bmulti.store/assets/ab5e0391-3f87-408f-b7ab-8ed912433c59
2071	2025-10-11 05:34:04.863329+00	1265744674	87.117.51.224	t	f	check	200 рублей	WB	79220680527	https://directus.bmulti.store/assets/3f29e9d6-b22d-4030-83db-54506daf4a81	https://directus.bmulti.store/assets/7f69cab9-6fb7-4d47-b9ea-63a54c9bd6dc
290	2025-06-25 10:20:23.991244+00	6765724679	178.170.169.216	f	f	check	200 рублей	OZON	79516396165	https://directus.bmulti.store/assets/ef19d95f-22fe-4768-ae56-06e400697ca8	https://directus.bmulti.store/assets/cdfe93f6-a1e9-424d-b280-d9807d93cd05
325	2025-06-26 11:16:19.903162+00	6128255132	178.72.116.207	t	t	check	200 рублей	WB	79234720728	https://directus.bmulti.store/assets/082192a7-2819-441b-bb45-230a0521ead0	https://directus.bmulti.store/assets/70a6eb17-91e1-4eda-8e9c-d261d7420a23
294	2025-06-25 12:04:00.367443+00	6882521062	95.190.69.139	t	t	done	200 рублей	OZON	79235384340	https://directus.bmulti.store/assets/b9123ffd-41b7-4d7c-adbe-484626fd0438	https://directus.bmulti.store/assets/1230a326-954b-4bfb-84e8-3a8babfb45d3
309	2025-06-25 19:00:25.645369+00	1561088066	178.66.130.224	t	t	check	200 рублей	YANDEX	\N	https://directus.bmulti.store/assets/5c379617-18a9-4ff2-bf70-e1c114daef43	https://directus.bmulti.store/assets/18b57afc-2508-4d70-9c59-7cca9841ce60
291	2025-06-25 10:25:18.36933+00	1258180377	178.170.169.216	f	f	check	200 рублей	OZON	79516396165	https://directus.bmulti.store/assets/a1dd3ad0-8be6-4f17-96ba-c19dbb0747a4	https://directus.bmulti.store/assets/274c4962-22db-45a2-92ca-f5584deeb9c6
312	2025-06-26 04:27:45.860425+00	5893795553	95.78.36.53	t	t	done	200 рублей	WB	79179133803	https://directus.bmulti.store/assets/68b72efa-2c50-4cf5-ae4d-3f57b4ffa1eb	https://directus.bmulti.store/assets/ac2ebb06-de9f-4de6-af71-4b7b17102a41
295	2025-06-25 12:30:55.991191+00	5228158539	77.222.98.195	t	t	done	200 рублей	OZON	79525033273	https://directus.bmulti.store/assets/2845db48-a42e-4c10-a5f4-b87331fa3754	https://directus.bmulti.store/assets/48018c97-f0c6-421d-969b-c7f2346a5837
296	2025-06-25 12:32:15.726481+00	1023897520	5.138.65.141	t	t	done	200 рублей	OZON	79187803551	https://directus.bmulti.store/assets/1c92254a-c283-4594-8989-90b696419749	https://directus.bmulti.store/assets/53af92dc-1753-43de-9771-98c4ed011b61
297	2025-06-25 12:55:27.336951+00	660681826	87.248.239.188	t	t	done	200 рублей	OZON	79518313569	https://directus.bmulti.store/assets/4a848a44-39cf-4ac9-b9e8-25efdcfd2d5c	https://directus.bmulti.store/assets/0537cd22-b1df-4501-ae72-ee0bc2d5c094
293	2025-06-25 11:53:04.005416+00	5163632535	188.233.36.52	t	t	check	200 рублей	OZON	79376900188	https://directus.bmulti.store/assets/942e8832-6608-4f85-8b45-ec800da641bf	https://directus.bmulti.store/assets/66bc5f1d-3b70-4e87-8888-8648c1a3b956
298	2025-06-25 13:07:44.185432+00	1767995706	46.246.24.173	t	t	done	300 рублей	OZON	79328626230	https://directus.bmulti.store/assets/64ec1b3c-ffcf-4c80-9060-a8b57cb825cd	https://directus.bmulti.store/assets/7968f7c4-aa0e-4d0b-b747-14b4a7343358
299	2025-06-25 13:28:00.304439+00	519259251	46.163.137.159	t	t	done	200 рублей	OZON	79876029684	https://directus.bmulti.store/assets/9f6f35c6-5f56-4d25-adae-bbc5e94b50e9	https://directus.bmulti.store/assets/70ad6ebe-ed78-47ae-a072-854035e02789
301	2025-06-25 14:49:10.890412+00	1783203197	78.81.155.108	t	t	done	200 рублей	OZON	79121757386	https://directus.bmulti.store/assets/23c247fa-2922-4ada-b025-6bb1d8d023b9	https://directus.bmulti.store/assets/f833af30-3e1f-4540-a9f7-4aff8a61d917
302	2025-06-25 15:19:09.732938+00	780071147	176.59.76.132	t	t	done	200 рублей	OZON	79518439616	https://directus.bmulti.store/assets/f59fef55-82d5-4a48-a2ac-11f197108554	https://directus.bmulti.store/assets/aab670e0-8310-473a-a250-d2817818995c
303	2025-06-25 15:29:58.943121+00	941922257	178.214.254.36	t	t	done	200 рублей	OZON	79373224213	https://directus.bmulti.store/assets/947a390a-0897-4c3c-bf19-9a517802b2b3	https://directus.bmulti.store/assets/d9dbea41-0a7a-4c1e-a6c4-a9b648ec57ab
304	2025-06-25 17:05:24.829051+00	6081107148	188.243.126.49	t	t	done	200 рублей	OZON	79810336410	https://directus.bmulti.store/assets/6abe150b-4f4e-4226-a41b-417f20f569ec	https://directus.bmulti.store/assets/8a5c74e0-85b5-4b8c-b832-869f13c07a3a
471	2025-07-01 16:25:38.936519+00	\N	62.93.165.149	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
292	2025-06-25 11:32:16.643827+00	1707323382	85.175.196.106	t	f	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/d27106bc-24d0-4604-b5dc-66c0af9d01e8	https://directus.bmulti.store/assets/e2c97d94-54ce-457f-857f-21f1a4044dba
300	2025-06-25 14:06:31.011384+00	949182466	77.238.234.54	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/3d446fa2-3c1e-4972-8ff3-14407ae709d0	https://directus.bmulti.store/assets/94ed39bf-c47d-49e8-8daf-cf373eb72de8
308	2025-06-25 18:55:01.300873+00	470381822	5.16.128.165	t	t	check	200 рублей	WB	79165507060	https://directus.bmulti.store/assets/357e3077-a0ae-4851-9ece-df4a767ef99b	https://directus.bmulti.store/assets/74b0cb4a-a041-4216-ad30-b86a33205b67
305	2025-06-25 18:29:50.057261+00	7038727374	212.220.157.97	t	t	check	200 рублей	WB	79533850652	https://directus.bmulti.store/assets/48687936-f70a-4b64-b485-e2c46660f885	https://directus.bmulti.store/assets/700dd609-6db3-47f2-8280-5981195adfc1
306	2025-06-25 18:38:19.554682+00	365664596	178.207.20.217	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/737f00a9-cce2-4955-a0cf-01f7839b5bf7	https://directus.bmulti.store/assets/a548b372-5ab1-4538-a778-500dc5d3ccfb
307	2025-06-25 18:38:26.675938+00	365664596	178.207.20.217	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/9aeb0b80-f326-416a-8f1e-185c91bc13af	https://directus.bmulti.store/assets/f843c7e2-accb-40d6-a5b8-3575c8a89a37
310	2025-06-25 19:25:09.181157+00	7500340679	176.59.57.170	t	t	check	200 рублей	WB	79017897000	https://directus.bmulti.store/assets/54daf702-5c9d-46d4-a772-254d5827c8cd	https://directus.bmulti.store/assets/4378528f-2fed-4faa-8fa3-a9c6d8386ae0
311	2025-06-25 23:16:07.944797+00	270480113	134.19.155.150	f	t	check	200 рублей	WB	79244684709	https://directus.bmulti.store/assets/ec95c4a3-0cac-41f6-860b-68e91d704444	https://directus.bmulti.store/assets/eff3450e-8e4f-4852-a48c-9a940b2e7052
316	2025-06-26 06:09:09.401857+00	7566805357	85.140.163.201	f	f	check	200 рублей	YANDEX	\N	https://directus.bmulti.store/assets/47c33bb6-55e2-4c12-a298-bf723b3d432e	https://directus.bmulti.store/assets/f0257fe4-047a-48a7-b042-662113c57717
313	2025-06-26 05:09:07.547859+00	1399060341	176.116.178.234	t	t	check	200 рублей	WB	79646656540	https://directus.bmulti.store/assets/f29944c9-024a-42a7-b1e1-2b10ac25d63e	https://directus.bmulti.store/assets/970e502f-1dfc-49e6-b14b-dda498d8701f
318	2025-06-26 06:09:14.268255+00	7566805357	85.140.163.201	f	f	check	200 рублей	YANDEX	79130423477	https://directus.bmulti.store/assets/c3334d2b-0388-4f78-bee3-1b5dcc45b6e8	https://directus.bmulti.store/assets/f89d406b-11c0-4eb4-9382-18ac5cd3a4ac
317	2025-06-26 06:09:11.628695+00	7566805357	85.140.163.201	f	f	in_work	200 рублей	YANDEX	\N	https://directus.bmulti.store/assets/2b8fd892-6bb7-470f-9c06-248e1bf22e78	https://directus.bmulti.store/assets/9c071fec-8790-4741-96bf-25e52685a7c2
315	2025-06-26 06:08:59.092397+00	7566805357	85.140.163.201	t	t	check	200 рублей	YANDEX	\N	https://directus.bmulti.store/assets/fdb2a353-2e75-41fe-baa3-72c47fa31621	https://directus.bmulti.store/assets/dd7dd023-1d98-4ee5-a248-e22daab5f352
319	2025-06-26 06:57:54.872569+00	1315156944	46.0.73.103	t	t	check	200 рублей	WB	79277747878	https://directus.bmulti.store/assets/01f00648-9a4e-4408-b805-81b5d831413a	https://directus.bmulti.store/assets/e2c22b2d-1901-463b-b096-c727f5bed84e
453	2025-06-30 15:56:53.787635+00	739831834	212.21.5.132	t	t	check	200 рублей	WB	79525027724	https://directus.bmulti.store/assets/8dc27923-f5ab-4659-8dd8-21f59003757d	https://directus.bmulti.store/assets/283aa71d-de8c-4140-9442-2dd60e2909fe
472	2025-07-01 16:25:56.666524+00	\N	62.93.165.149	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
320	2025-06-26 07:22:33.894659+00	5183378584	92.37.141.87	t	t	check	200 рублей	OZON	79966822427	https://directus.bmulti.store/assets/87396a2f-34f5-49d5-b359-de643d295afa	https://directus.bmulti.store/assets/85403453-16ad-4bc7-8286-26cdeb51902c
343	2025-06-26 18:07:35.238259+00	853665881	176.124.164.29	t	f	check	200 рублей	WB	79961387215	https://directus.bmulti.store/assets/3a284419-275a-4319-8425-da50482d8820	https://directus.bmulti.store/assets/618789fe-0e7c-4f02-b5b2-a578d17a5f03
321	2025-06-26 09:32:04.600076+00	1483138665	92.124.205.191	f	t	check	200 рублей	OZON	79516244006	https://directus.bmulti.store/assets/e9ec8ecc-ed91-4855-9dfa-cff7c4e99a08	https://directus.bmulti.store/assets/277c5249-4d2e-4fe6-91d1-2cbf0efba1cb
821	2025-07-24 15:53:43.834485+00	6258843589	5.141.193.17	t	t	check	200 рублей	OZON	79918922262	https://directus.bmulti.store/assets/0a4a12bf-05ec-4245-b1e8-2da58724f2ac	https://directus.bmulti.store/assets/14a2d395-7a36-4e54-b74b-0985c119fad9
825	2025-07-24 18:57:27.769314+00	5117125156	185.113.210.240	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/6369f988-75f2-40e1-bae0-7693a59b2946	https://directus.bmulti.store/assets/5654000a-35b7-46e6-b8f0-16e74edf975c
342	2025-06-26 18:06:25.443146+00	1078147561	5.165.139.9	t	t	done	200 рублей	OZON	79520693911	https://directus.bmulti.store/assets/be30ec86-2457-4020-a7da-4457705cb0ee	https://directus.bmulti.store/assets/7d77b2b5-41b2-4551-8d9f-3b6c05097a22
329	2025-06-26 14:06:26.195916+00	7115624459	176.52.55.171	f	t	check	200 рублей	OZON	79874800181	https://directus.bmulti.store/assets/1089031f-ad6e-424f-a4b4-fee409fee7a2	https://directus.bmulti.store/assets/60260269-844f-4ad8-9dc7-5c8a563a3df6
341	2025-06-26 17:55:05.113026+00	923810535	178.64.130.198	t	t	done	200 рублей	OZON	79522113207	https://directus.bmulti.store/assets/d8b1ef45-ae2b-4bbb-ba96-252a81305c1c	https://directus.bmulti.store/assets/25fb786c-f295-4ad6-94a3-fc0be7eb709b
339	2025-06-26 17:28:27.207847+00	1164169756	37.113.193.6	t	t	done	200 рублей	OZON	79532922724	https://directus.bmulti.store/assets/8d1b9d5d-d54b-41f0-a975-c963ae8e999f	https://directus.bmulti.store/assets/333945c9-54d1-43c3-b816-91faadc1729f
330	2025-06-26 14:10:14.296558+00	5142640936	188.19.153.103	t	t	check	200 рублей	OZON	79127865813	https://directus.bmulti.store/assets/12518f04-20eb-496a-9b9b-f13ed0a4c789	https://directus.bmulti.store/assets/9681b0f1-856a-42f4-af61-bd64dc72ff2c
337	2025-06-26 16:06:09.542432+00	1435169769	77.220.50.244	t	t	done	200 рублей	OZON	79997856230	https://directus.bmulti.store/assets/c183c8d4-db98-4168-a67a-1d96ba79b97f	https://directus.bmulti.store/assets/b6911916-30be-4fef-912d-4ec768260ad1
336	2025-06-26 15:55:04.985536+00	564017275	88.80.61.111	t	t	done	200 рублей	OZON	79124438433	https://directus.bmulti.store/assets/c35ac787-17f0-4a14-8d36-3d965aa8c543	https://directus.bmulti.store/assets/862fb655-bbae-47a9-bc03-542f3ef0581f
331	2025-06-26 14:12:25.732106+00	923079923	95.211.63.98	t	t	check	200 рублей	OZON	79026775580	https://directus.bmulti.store/assets/aa9df2a9-23c5-457a-a244-e02b03759d41	https://directus.bmulti.store/assets/b05f0127-5075-4681-b39f-9fdfe3d4827e
332	2025-06-26 14:35:24.773129+00	5097501369	92.62.58.151	t	t	done	200 рублей	OZON	79819708800	https://directus.bmulti.store/assets/fcffec2a-9fa8-47ef-9abc-2de466c1684e	https://directus.bmulti.store/assets/dbf2b33a-6021-4172-98da-8a0823b2a91b
324	2025-06-26 10:32:43.426575+00	598656537	212.34.136.217	t	t	done	200 рублей	OZON	79277566046	https://directus.bmulti.store/assets/2743f76c-f697-4285-aaa4-7bfe2380c918	https://directus.bmulti.store/assets/670bdc5b-b76b-4c9f-bb49-a60e8adc8309
326	2025-06-26 11:52:10.343604+00	910038203	176.121.205.103	t	t	done	200 рублей	OZON	79508551214	https://directus.bmulti.store/assets/336cf791-e7b3-4ba2-af0f-af2e8008c000	https://directus.bmulti.store/assets/d53542c2-7f24-4631-87ad-6ffbb72e7338
327	2025-06-26 12:54:06.734712+00	1643572048	128.204.79.97	t	t	done	200 рублей	OZON	79269465083	https://directus.bmulti.store/assets/194a5df6-3331-46e7-8fa0-ea88fb4eb35f	https://directus.bmulti.store/assets/637bc082-fa92-4e29-8cce-5bb9019a0389
333	2025-06-26 14:49:35.807673+00	719135906	212.47.251.15	t	t	done	200 рублей	WB	79493306381	https://directus.bmulti.store/assets/52b7c628-75d1-4cec-b603-c52cc1d63fd6	https://directus.bmulti.store/assets/4f5e1f5d-efeb-4bd8-adcf-1972ece3b609
328	2025-06-26 13:05:50.028726+00	427509138	81.23.166.102	t	t	done	200 рублей	OZON	79614956491	https://directus.bmulti.store/assets/d160e28d-4fd4-42b2-8fb8-84c24eb3fdc3	https://directus.bmulti.store/assets/31d725a6-47f3-4c06-bb9d-574f092bef8e
335	2025-06-26 15:50:34.916586+00	469270491	78.81.155.188	t	t	check	200 рублей	OZON	79042017772	https://directus.bmulti.store/assets/c3d090f5-bcbd-4a90-9d0e-ce0eb37b32e8	https://directus.bmulti.store/assets/f0c35f13-34c1-4b39-bf62-f335a25e4dfe
340	2025-06-26 17:38:55.50201+00	5181757138	95.104.197.40	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/763ba921-8433-43ef-aa99-6244b908747a	https://directus.bmulti.store/assets/b0c5e770-dfb3-41ce-bd60-fb0131a7f473
345	2025-06-26 18:25:41.207557+00	5238369971	95.26.174.7	t	f	check	200 рублей	YANDEX	79095559980	https://directus.bmulti.store/assets/6ae1a315-a7ae-49f5-b876-2d5c9928d6b4	https://directus.bmulti.store/assets/1d8d4553-7d71-4f65-b377-65e6f3294981
344	2025-06-26 18:08:03.245259+00	1343020134	176.59.162.9	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/178dbc30-aa13-4262-8de7-d8ecf0ca0839	https://directus.bmulti.store/assets/73e6fb11-73da-4a27-a62e-83b6cc173af3
346	2025-06-26 18:40:15.980531+00	7483382745	188.19.60.198	t	f	check	200 рублей	OZON	79324238463	https://directus.bmulti.store/assets/7653c932-b261-4f6f-a20b-83244b92f84f	https://directus.bmulti.store/assets/8c8c8aa3-c0bf-4bc4-bb52-160d541761f4
314	2025-06-26 05:30:12.344537+00	880706198	95.181.12.31	t	t	done	200 рублей	WB	79521689224	https://directus.bmulti.store/assets/a3272352-adc3-4ff1-bbc8-797a227beeb4	https://directus.bmulti.store/assets/e7fe1edc-6c58-4d9f-a2ca-84f4b0fe52a7
264	2025-06-24 14:41:49.820182+00	336184208	93.100.172.112	t	t	done	200 рублей	OZON	79110229092	https://directus.bmulti.store/assets/36c81cc3-c281-4b26-9a3f-4783b49c3919	https://directus.bmulti.store/assets/e1e83844-a932-431f-8dae-4570d0fc0c56
347	2025-06-26 19:24:52.491615+00	1350560065	23.88.47.218	t	t	check	200 рублей	WB	79170048128	https://directus.bmulti.store/assets/8d4c3295-5827-4ea3-a6d2-a59832de195e	https://directus.bmulti.store/assets/8d73c5a3-ba3c-47bf-9865-1c67938a9e05
348	2025-06-26 19:56:11.705053+00	6156328626	87.117.185.226	t	t	check	200 рублей	WB	79600814544	https://directus.bmulti.store/assets/a930d0d3-4388-4782-bb38-72139479080f	https://directus.bmulti.store/assets/f06aeb36-c1a6-4a54-be73-ffa3a0a4f321
354	2025-06-26 22:37:32.210672+00	883109243	83.137.54.127	t	t	done	200 рублей	WB	79858776555	https://directus.bmulti.store/assets/4950c950-7115-4c82-85dd-dd72b5ab2f5b	https://directus.bmulti.store/assets/0f4fb6a9-90db-4e06-a4fe-ab2b68215f6e
351	2025-06-26 21:30:10.828526+00	7766681781	81.23.166.66	t	t	done	200 рублей	WB	79951959155	https://directus.bmulti.store/assets/1979014c-04e6-4ef1-9063-fa95f90a19ac	https://directus.bmulti.store/assets/93fbb856-e236-4f44-97ac-f912af67ba20
375	2025-06-27 13:22:09.233942+00	494536311	87.229.0.5	t	t	done	200 рублей	OZON	79493090264	https://directus.bmulti.store/assets/537815ce-c378-4d97-940c-0b2a570304e0	https://directus.bmulti.store/assets/b28b12ed-b3a9-423d-8638-118095239d2c
350	2025-06-26 20:37:24.813946+00	1030151427	194.147.50.22	t	t	check	200 рублей	WB	78782270188	https://directus.bmulti.store/assets/da183a02-b00f-4953-8103-70f980b99e25	https://directus.bmulti.store/assets/eda3b459-be29-4c39-8f7a-20f8f2e9b751
349	2025-06-26 20:29:54.796509+00	672293860	178.252.127.246	t	t	done	200 рублей	WB	79119491137	https://directus.bmulti.store/assets/16443bd3-8e3b-4c6a-bb98-c722de46add9	https://directus.bmulti.store/assets/d6ceb636-45ef-4d91-895c-2b8e155373a2
384	2025-06-27 14:37:42.984396+00	936227742	188.232.132.2	t	t	done	200 рублей	OZON	79006745954	https://directus.bmulti.store/assets/8de34360-9ee4-4ebc-bc6c-9cfc513357e2	https://directus.bmulti.store/assets/d25cad20-3452-4486-8a72-6927fdeffda2
377	2025-06-27 13:42:44.5725+00	945274112	92.37.143.117	t	t	done	200 рублей	OZON	79622896403	https://directus.bmulti.store/assets/e5e4f6e7-bf4d-4fca-beba-a54ae724fb3b	https://directus.bmulti.store/assets/72e9ebcd-3fea-424d-a024-b85ee530afb4
373	2025-06-27 13:00:28.919448+00	650097072	79.137.136.1	t	t	done	200 рублей	OZON	79002459596	https://directus.bmulti.store/assets/1e9c5518-50ef-421e-a098-cab92c9f9cbe	https://directus.bmulti.store/assets/17bfc98d-6a5f-4a57-b627-7a32050c0d9d
370	2025-06-27 11:55:49.947349+00	676766320	90.188.244.139	t	t	done	200 рублей	WB	79996403645	https://directus.bmulti.store/assets/5a5ade3a-9cc0-42f2-b74b-83e9266b4967	https://directus.bmulti.store/assets/b1448628-39d0-4eae-a9e3-3e529f6015dc
352	2025-06-26 21:31:08.133767+00	5945251084	77.51.171.243	f	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/7ca0a74c-b5c3-4301-9867-97b53e4d69f5	https://directus.bmulti.store/assets/21def64e-c698-4754-94db-9ed6c78bc917
372	2025-06-27 12:58:52.167651+00	884138519	193.143.64.218	t	t	done	200 рублей	OZON	79959866875	https://directus.bmulti.store/assets/46a324b6-12c6-4e1d-bf0e-e31cee1cd2c9	https://directus.bmulti.store/assets/b6a25e22-526f-4aa5-b853-7754a27da4c4
369	2025-06-27 11:13:56.94284+00	1391832447	31.23.48.161	t	t	done	200 рублей	WB	79897025904	https://directus.bmulti.store/assets/6ac0a350-93d7-4f9d-b8ac-b6369b577692	https://directus.bmulti.store/assets/000b6e45-11a3-481a-a272-8e491e361268
367	2025-06-27 10:45:51.541522+00	1136268631	80.83.239.97	t	t	done	300 рублей	WB	79142061246	https://directus.bmulti.store/assets/63dbf5a1-8b6f-4ecc-82cd-9eaa69f9ad38	https://directus.bmulti.store/assets/36700e14-3196-4940-94e5-5963a023d356
353	2025-06-26 21:39:17.654274+00	5634047185	81.23.166.66	t	t	check	200 рублей	WB	79034579798	https://directus.bmulti.store/assets/41962697-844d-44a3-b502-99e0456098b8	https://directus.bmulti.store/assets/23fcab50-08f9-4dbb-9937-b3c72be8224b
366	2025-06-27 10:31:19.340848+00	1065132315	83.239.30.182	t	t	done	200 рублей	WB	79384090908	https://directus.bmulti.store/assets/48faa52e-9168-473b-beb1-10ffc558554d	https://directus.bmulti.store/assets/054329d4-0cd8-4e11-b81d-740ac622238c
362	2025-06-27 09:32:54.640012+00	1897071807	91.239.42.175	t	t	done	200 рублей	OZON	79224767123	https://directus.bmulti.store/assets/a55bf3cf-7bd9-4580-a913-dbec273f5934	https://directus.bmulti.store/assets/76ebab12-ddb3-4a36-a4ff-8f9e2f4a50b7
371	2025-06-27 12:34:11.080561+00	2083244067	5.137.97.248	t	t	done	200 рублей	OZON	79994647684	https://directus.bmulti.store/assets/d51738ed-6a9e-4c9e-bc25-de3747ab9c1b	https://directus.bmulti.store/assets/d8c1d2e0-31cb-46d6-8aef-c43e9a9eaaa1
454	2025-06-30 17:44:56.537449+00	\N	109.248.252.38	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
628	2025-07-11 11:05:42.30883+00	2097061830	188.187.176.245	f	t	check	200 рублей	OZON	79613378314	https://directus.bmulti.store/assets/1f435571-004e-4325-b336-ee20c93218b5	https://directus.bmulti.store/assets/c40ea401-7aa3-4e4b-a324-83831ac5ad4e
357	2025-06-27 05:01:53.210623+00	652462548	77.222.103.117	t	t	check	200 рублей	WB	79090897713	https://directus.bmulti.store/assets/8f558fe0-2a85-47de-999f-d8f733e63502	https://directus.bmulti.store/assets/42805093-185b-42de-807a-7c90740b159e
355	2025-06-27 00:18:19.113253+00	7431902792	159.253.172.86	f	t	check	200 рублей	OZON	79144116114	https://directus.bmulti.store/assets/28792786-1ff1-4d9c-bee2-66160d9fd51e	https://directus.bmulti.store/assets/84b7a328-4033-4f27-ac45-859722cdbf5a
356	2025-06-27 03:51:39.817466+00	5109837028	91.240.103.239	t	t	check	200 рублей	WB	79834460734	https://directus.bmulti.store/assets/b5291b63-1d38-4fbe-a588-5f747d55c923	https://directus.bmulti.store/assets/8678ebc9-169a-447f-acaa-dc800642ebfc
358	2025-06-27 05:02:21.616725+00	5207515538	5.130.104.4	t	t	check	200 рублей	OZON	79130327566	https://directus.bmulti.store/assets/75225fd5-428b-41f9-a06c-74c8b57cc1b1	https://directus.bmulti.store/assets/12bde13d-3429-4c7c-8bdb-55d23edccdf8
359	2025-06-27 05:48:02.719265+00	1976544361	178.75.48.4	t	t	check	200 рублей	OZON	79803300121	https://directus.bmulti.store/assets/e9beaa0d-d8d0-420d-a842-1310e8fb2996	https://directus.bmulti.store/assets/49e68874-3ba9-4166-918e-67ee711d37a2
360	2025-06-27 06:21:21.072626+00	845609419	213.87.240.32	t	t	check	200 рублей	WB	79120417164	https://directus.bmulti.store/assets/b764160f-b241-4e8f-b82a-fb96880cbd07	https://directus.bmulti.store/assets/4cd9f336-9981-4710-bc3b-ef2e92278d9a
363	2025-06-27 09:34:12.036043+00	6760196846	87.225.110.175	t	t	check	200 рублей	OZON	79244091848	https://directus.bmulti.store/assets/f27541b5-cd8a-409f-878c-2a2bb126bc3d	https://directus.bmulti.store/assets/d1ca7043-9b95-4305-8b46-9f7501b5f396
364	2025-06-27 09:35:11.127302+00	6945260962	178.219.168.158	t	f	check	200 рублей	WB	79786046465	https://directus.bmulti.store/assets/e0cb9b63-04e1-4d10-9518-4f31f30d3f56	https://directus.bmulti.store/assets/42f52911-ebb2-4ce8-a592-f9eb144a2e7e
365	2025-06-27 10:08:01.51844+00	8038685794	185.172.128.142	f	f	check	200 рублей	WB	79280291317	https://directus.bmulti.store/assets/08a39330-986a-4469-bedd-b771dfb4be16	https://directus.bmulti.store/assets/afae099f-7983-478a-a269-8166c6a3fe5e
368	2025-06-27 10:53:57.701518+00	5285665873	80.83.234.175	f	t	check	200 рублей	WB	79142061246	https://directus.bmulti.store/assets/86c21c60-9722-4c4a-8d44-4ac6de8c3072	https://directus.bmulti.store/assets/859718b5-5346-4265-a435-a29d37644d8b
374	2025-06-27 13:19:49.590455+00	5104889397	94.41.131.74	t	t	check	200 рублей	WB	79228172792	https://directus.bmulti.store/assets/21be823a-3e12-4149-97cd-d3250b226d8f	https://directus.bmulti.store/assets/2483d658-ae82-4ad8-a680-b5e43969806e
376	2025-06-27 13:38:56.578422+00	5203282330	95.25.179.15	t	t	check	200 рублей	WB	79184481517	https://directus.bmulti.store/assets/2558b88f-a17e-4ceb-9d56-364330063ed8	https://directus.bmulti.store/assets/e1827037-075e-4cfa-90aa-9fec86a7e4a4
404	2025-06-28 05:23:33.650163+00	6938717386	213.87.144.46	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/c7f94bd2-8927-4e15-a610-f5feed93f10b	https://directus.bmulti.store/assets/be5415d4-ec54-4b6d-bf40-7be7f80cee85
378	2025-06-27 13:44:32.952344+00	846337756	178.178.208.91	f	t	new	\N	WB	\N	https://directus.bmulti.store/assets/66018475-9fb7-42d6-9dc1-71aded93c2e6	https://directus.bmulti.store/assets/02153344-2225-40aa-878b-53990d8006e9
401	2025-06-28 02:24:38.14727+00	5634893887	91.149.114.15	t	t	done	200 рублей	YANDEX	79648078620	https://directus.bmulti.store/assets/9e4f4a6d-71b0-4f1f-ac39-f9472ad21da8	https://directus.bmulti.store/assets/e8feb8df-1b52-4a85-8136-c2e19fe3f019
379	2025-06-27 13:44:57.453268+00	846337756	178.178.208.91	f	f	check	200 рублей	WB	79279109096	https://directus.bmulti.store/assets/577a479e-4ab9-468e-a094-8be42a0a572e	https://directus.bmulti.store/assets/2723e8f9-1cd5-46ec-81cd-d6972d3d18e7
386	2025-06-27 15:01:43.008382+00	375767998	77.75.132.14	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/101901e3-31e6-4f1b-8306-4277ce75d270	https://directus.bmulti.store/assets/caa3a7ba-aabf-43a5-abc0-6c139705ceb4
407	2025-06-28 05:26:08.170625+00	6938717386	213.87.144.46	f	t	done	300 рублей	OZON	79181511132	https://directus.bmulti.store/assets/d6de73dc-8267-4259-9b00-30590dd602e7	https://directus.bmulti.store/assets/07b6053b-32c5-49a7-bc27-5a4c990c1f70
381	2025-06-27 14:18:42.915829+00	1002527741	46.158.182.211	t	t	check	200 рублей	WB	79180776262	https://directus.bmulti.store/assets/7d8eb54e-a0d7-4d66-bed1-55a8d0293c6a	https://directus.bmulti.store/assets/e8819dfb-08a7-471f-8dc1-dfc15387c0b2
541	2025-07-06 03:52:39.98742+00	7535601379	81.91.180.252	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/852e43dd-d461-43dd-8ff0-34c2fd998009	https://directus.bmulti.store/assets/5f68918f-e718-4ae2-8d9e-3bfdb9319d78
943	2025-08-01 16:31:22.744169+00	1773085467	94.19.22.59	t	t	check	300 рублей	OZON	79117453197	https://directus.bmulti.store/assets/98b10c39-0f52-4920-a1af-1a46bf1bdac2	https://directus.bmulti.store/assets/58060ae9-aeb7-4372-9f07-9e94927c6074
389	2025-06-27 16:07:42.06506+00	7434529064	31.222.229.236	f	t	check	200 рублей	WB	79965167508	https://directus.bmulti.store/assets/7a89f779-b8d4-4170-afff-78556637841d	https://directus.bmulti.store/assets/d0a471d7-6140-45e5-b5d8-f96480ba6307
390	2025-06-27 16:54:27.563372+00	5152183166	95.27.19.99	t	t	check	200 рублей	OZON	79158421208	https://directus.bmulti.store/assets/4b51e024-065b-41b3-941c-6bfa5f475672	https://directus.bmulti.store/assets/b1a47b30-87d5-49bf-8d50-b3f51e2667c2
394	2025-06-27 17:45:16.78038+00	69311910	89.110.114.52	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/5e315a20-125a-4256-94ca-f12251a58bc3	https://directus.bmulti.store/assets/f7a4ceac-f5d9-4257-b004-39141c46e0c4
391	2025-06-27 16:57:05.076128+00	473738919	89.163.157.43	t	t	check	200 рублей	OZON	79858414318	https://directus.bmulti.store/assets/89f28959-3142-4595-9dca-7ca53377349f	https://directus.bmulti.store/assets/4b660e1a-0991-481f-b06d-a144df3403d7
393	2025-06-27 17:21:46.070304+00	1259741194	79.140.25.86	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/132ff71a-8697-4d5d-bd7a-ef58063f0d40	https://directus.bmulti.store/assets/70c0c5f0-cb32-4386-9ce9-cf041bcac657
398	2025-06-27 21:41:06.51017+00	1148944860	185.193.158.82	t	t	check	200 рублей	WB	79267198629	https://directus.bmulti.store/assets/497ace4f-d151-4dc8-a8da-c4d25d76c0a6	https://directus.bmulti.store/assets/c9b16f92-3b68-4d85-8575-64bae30b274a
396	2025-06-27 19:51:42.185185+00	1719024043	82.149.137.205	f	t	check	200 рублей	WB	79113400405	https://directus.bmulti.store/assets/8487a707-97c0-4ee8-b2c9-99cb82db65ef	https://directus.bmulti.store/assets/9e3add5e-d232-4b91-a045-603f89aae68d
242	2025-06-23 15:51:49.506014+00	1702479636	176.115.145.110	t	t	done	200 рублей	OZON	79108991097	https://directus.bmulti.store/assets/17104b70-55e6-4d49-9dcd-08e647e20bae	https://directus.bmulti.store/assets/22350620-999e-43e8-b590-2262f3e3e8c8
397	2025-06-27 20:46:22.577617+00	1664924329	83.239.241.138	t	f	check	200 рублей	OZON	79374621708	https://directus.bmulti.store/assets/1854b151-ae8c-4c49-81d8-6706ac21365f	https://directus.bmulti.store/assets/3dc56fba-78ed-4e55-be47-163c616ff805
361	2025-06-27 09:10:23.365876+00	940535928	178.76.246.108	t	t	done	200 рублей	OZON	79189687921	https://directus.bmulti.store/assets/cf0233d1-dd01-42b3-ae95-daeadf53ef8e	https://directus.bmulti.store/assets/8ec7d797-5b68-4eca-9759-ef02beb1aeeb
402	2025-06-28 05:13:49.939862+00	7771356502	128.204.79.123	t	t	check	2000 рублей	WB	79372322916	https://directus.bmulti.store/assets/38bf5a43-eed9-4ff3-a9eb-b1be7fbb8502	https://directus.bmulti.store/assets/0de0b333-f3d5-4ae4-bda4-962a9fee95ba
403	2025-06-28 05:18:52.637125+00	1238970620	134.19.135.204	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/f188549f-ed77-49e0-9053-99931cc3d5c9	https://directus.bmulti.store/assets/f7f7f116-99ab-4536-a19e-24bbb137bca4
408	2025-06-28 07:20:21.499061+00	269184025	91.146.63.122	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/66c56b4b-9d3d-4a62-9e09-c5f7c84ac19c	https://directus.bmulti.store/assets/285a5157-0827-4607-a160-a98f54d3ad77
399	2025-06-28 01:09:12.190453+00	976328404	5.129.179.250	t	t	done	200 рублей	OZON	79130251670	https://directus.bmulti.store/assets/4f166bee-a0b1-4ca7-b9f1-78eafecb7fed	https://directus.bmulti.store/assets/2f3c7e1e-4437-4c3c-8f17-2003940adfe8
395	2025-06-27 18:49:39.77106+00	257630117	85.192.63.48	t	t	done	200 рублей	OZON	79215616521	https://directus.bmulti.store/assets/7b683549-1060-4019-b2ff-a9f8dc99aa8e	https://directus.bmulti.store/assets/8cafff3a-1aff-4e06-8d0c-7c0fd38c3005
392	2025-06-27 17:07:55.242039+00	1929107988	188.19.149.37	t	t	done	200 рублей	OZON	79918177554	https://directus.bmulti.store/assets/dd2e249b-fc29-442c-82f1-6ae4d3d3cd8f	https://directus.bmulti.store/assets/c6de7037-3fe0-472b-8e3b-69d034c036eb
388	2025-06-27 16:03:23.421262+00	5258344373	176.110.129.85	t	t	done	200 рублей	OZON	79184620458	https://directus.bmulti.store/assets/a9f62ab0-fcde-4368-a114-2f717ca8c780	https://directus.bmulti.store/assets/78c52d4b-dfe4-44a1-a155-cc8b83d2dbe9
385	2025-06-27 14:59:32.556174+00	5224703051	185.33.161.24	t	t	done	300 рублей	OZON	79192402423	https://directus.bmulti.store/assets/efa6a6a8-bdf9-4eec-81dc-b9e85ec346ef	https://directus.bmulti.store/assets/9a869c8d-e3b7-451f-b865-3100247bcf57
380	2025-06-27 14:07:13.269143+00	1389941525	88.135.60.9	t	t	done	200 рублей	OZON	79529978032	https://directus.bmulti.store/assets/406770af-3f08-4645-ae16-d63b714af449	https://directus.bmulti.store/assets/6944f84b-3bed-4d30-9401-3b61adb91291
400	2025-06-28 02:12:10.487693+00	1080977206	213.59.139.98	t	t	done	200 рублей	OZON	79059915530	https://directus.bmulti.store/assets/f590c228-f088-4546-ae58-113e54da763d	https://directus.bmulti.store/assets/3ab5a33b-1a59-4a8d-9a0f-afdc6a61bdcc
387	2025-06-27 15:30:03.027002+00	6038127907	89.107.138.95	t	t	done	200 рублей	OZON	79050193819	https://directus.bmulti.store/assets/9afbdbc8-8e29-43e7-a449-0f6e44e0f59a	https://directus.bmulti.store/assets/da79d7ad-7999-4cba-9037-3f38c5bd4de5
416	2025-06-28 17:22:49.320863+00	1116105414	5.18.102.0	t	t	done	1000 рублей	OZON	79119270459	https://directus.bmulti.store/assets/216cb886-fea1-45e9-a195-3a32efb06f72	https://directus.bmulti.store/assets/70508ee3-26d3-49f0-90e0-d88c03a8b1da
409	2025-06-28 08:39:05.779586+00	6440322528	77.35.163.188	t	t	done	200 рублей	OZON	79149655546	https://directus.bmulti.store/assets/b6f35ba6-51ef-4c7f-8552-5250a57328d8	https://directus.bmulti.store/assets/ed5ed6d0-4035-4199-836f-0d3f02d3bf1b
432	2025-06-29 14:22:13.684514+00	1083891129	89.107.138.220	t	t	done	200 рублей	WB	79787415569	https://directus.bmulti.store/assets/43abe597-23fd-4646-8abc-0fd455ceaca6	https://directus.bmulti.store/assets/a5f266d2-618c-47ea-b15e-5c4068b684fa
429	2025-06-29 13:15:46.288767+00	1362718852	79.165.96.139	t	t	done	200 рублей	OZON	79818985987	https://directus.bmulti.store/assets/350b6a57-848b-4feb-b176-fd77d24306cd	https://directus.bmulti.store/assets/b0e7c1c7-d48e-40e9-88b6-837359e990fc
428	2025-06-29 12:38:46.693584+00	937485271	212.47.242.111	t	t	done	200 рублей	OZON	79090388600	https://directus.bmulti.store/assets/6bcad7e6-078b-40c3-bb5c-99bd6e36a0a8	https://directus.bmulti.store/assets/f5491eec-6311-49ab-8278-c2b507e586be
426	2025-06-29 10:52:01.122619+00	793318707	77.221.153.184	t	t	done	200 рублей	OZON	79126749539	https://directus.bmulti.store/assets/876849c1-480b-4ead-b94f-feff00582df6	https://directus.bmulti.store/assets/fce646db-d8d8-46b4-be46-73b672590542
424	2025-06-29 09:58:05.63278+00	827056253	193.142.152.169	t	t	done	200 рублей	OZON	79109147796	https://directus.bmulti.store/assets/b9dcc682-7155-49a0-8568-57f84c653528	https://directus.bmulti.store/assets/2ae90735-8f0c-4c1d-9811-04ad7bd59de0
421	2025-06-29 07:24:23.468887+00	1937728198	31.210.223.80	t	t	done	200 рублей	OZON	79202234606	https://directus.bmulti.store/assets/69dc0d17-79f4-446c-a676-4389be3fdf5c	https://directus.bmulti.store/assets/9e072aad-74b1-4123-bdad-6888edef73c1
431	2025-06-29 14:12:58.698037+00	649322666	135.181.102.102	t	t	done	200 рублей	OZON	79280054212	https://directus.bmulti.store/assets/8e6f29c5-4e7c-4c39-b4cc-c96f3e416cf3	https://directus.bmulti.store/assets/77111202-63cd-4eec-873c-64ab0795ccca
413	2025-06-28 13:48:31.723712+00	5723316100	88.201.206.137	t	t	check	200 рублей	OZON	79117255591	https://directus.bmulti.store/assets/ef988138-8e06-4504-9728-d208c9765c5c	https://directus.bmulti.store/assets/e26de0ea-db91-4f27-ba7a-a80b6b761e18
417	2025-06-28 18:22:53.426147+00	635866324	194.226.254.105	t	t	done	200 рублей	OZON	79639782007	https://directus.bmulti.store/assets/76076a05-fd4a-4d8c-a02b-69f5b58a230c	https://directus.bmulti.store/assets/e1edf8b6-75c4-44ad-85e7-f1182aea53b7
412	2025-06-28 12:02:53.274908+00	144455479	5.130.195.71	t	t	done	200 рублей	OZON	79134781517	https://directus.bmulti.store/assets/fe44407e-3cb2-4649-87d1-ec1c8f21515d	https://directus.bmulti.store/assets/4a744ee1-de24-489c-8679-f1e02f295ca5
423	2025-06-29 09:53:53.975245+00	911053420	46.53.250.73	t	t	done	200 рублей	OZON	375256780689	https://directus.bmulti.store/assets/b45c155e-f1e5-4fc2-9ea2-f83e75f99e1d	https://directus.bmulti.store/assets/b522b69a-daf2-403a-a154-3eb584c27119
414	2025-06-28 16:45:19.65552+00	6562033666	31.173.83.169	t	f	check	200 рублей	WB	79250364232	https://directus.bmulti.store/assets/3207e32f-d4d9-4cd2-9753-6e6bbd2067b7	https://directus.bmulti.store/assets/6bad9953-6f76-4483-8446-c7d572f995f6
422	2025-06-29 07:32:02.145519+00	816931941	46.216.64.64	t	f	done	200 рублей	WB	\N	https://directus.bmulti.store/assets/63d9dead-c8d7-4dae-898d-65df4370737d	https://directus.bmulti.store/assets/bcc6135a-cbf4-4336-a1da-ae0aea8b9be3
410	2025-06-28 10:14:12.419611+00	7425718863	45.131.48.174	t	t	done	200 рублей	OZON	79595869569	https://directus.bmulti.store/assets/885a5fe9-39ed-4b56-a8a4-5456fcdff090	https://directus.bmulti.store/assets/456e1c1f-6f69-4f78-bdb0-ad23c3b355b0
427	2025-06-29 12:18:12.07659+00	949403049	95.25.45.200	t	t	done	500 рублей	WB	79064622233	https://directus.bmulti.store/assets/9b91d1c9-eb2a-4d24-995f-a0f8b14ff122	https://directus.bmulti.store/assets/4d8b591e-5704-44f4-8ca8-29d942fcc959
415	2025-06-28 16:59:26.913119+00	1023897520	178.34.162.62	t	t	check	200 рублей	WB	79187803551	https://directus.bmulti.store/assets/ae59fe3e-b49c-4b50-8a83-80b8bb1f6070	https://directus.bmulti.store/assets/65ea8855-62f3-4c05-ac1f-9de68a553be4
411	2025-06-28 10:18:12.868266+00	5088472714	188.245.71.158	t	t	done	200 рублей	WB	79782839390	https://directus.bmulti.store/assets/94d896ff-3887-43f6-9cca-45ee7a59770a	https://directus.bmulti.store/assets/2c5d93c4-3748-4168-89e7-1c1fa8a713cc
418	2025-06-28 20:13:11.685589+00	5134598774	217.66.156.7	t	t	done	200 рублей	OZON	79591318311	https://directus.bmulti.store/assets/81175b17-198b-41d3-a376-3c3f5f41f9d5	https://directus.bmulti.store/assets/244ca170-5453-450f-b20c-ba5b67d73523
434	2025-06-29 18:23:52.843004+00	1883277670	77.120.56.161	t	t	done	200 рублей	WB	79787670467	https://directus.bmulti.store/assets/724b43ac-2d0c-476a-aa1c-0a804e6513fe	https://directus.bmulti.store/assets/f6538fe7-ed65-42d8-af74-7c18d27e9dd7
383	2025-06-27 14:33:43.15916+00	5330198618	176.59.209.184	t	t	done	200 рублей	OZON	79088943668	https://directus.bmulti.store/assets/60750b49-dec5-43d8-9765-6cedd060ddbd	https://directus.bmulti.store/assets/8aed209b-be00-428d-8723-6bf42df8ba83
425	2025-06-29 10:46:07.777468+00	907497886	94.50.119.54	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/e0172dea-c246-43b4-b202-1e30887ee5af	https://directus.bmulti.store/assets/59510e99-b0ac-43c1-b3c2-3c3bea9155c4
419	2025-06-29 02:58:35.185543+00	5107977209	46.151.150.198	t	t	check	200 рублей	WB	79788638265	https://directus.bmulti.store/assets/2cf66fce-2e20-4ca7-82e8-5015b4e7b4dc	https://directus.bmulti.store/assets/4e838fca-0221-411c-9824-65d6c609a86d
420	2025-06-29 03:51:36.14037+00	5177998262	193.106.161.209	t	f	check	200 рублей	OZON	79636754930	https://directus.bmulti.store/assets/572ca801-2dc5-4162-8ebd-03e3a081014f	https://directus.bmulti.store/assets/c71489f8-da67-4df3-8d69-bada0fa0cfbe
430	2025-06-29 13:33:21.042872+00	5998716199	185.121.233.251	t	t	check	200 рублей	WB	79087724361	https://directus.bmulti.store/assets/ee75f22c-21d9-43db-9a4d-66719b805738	https://directus.bmulti.store/assets/4e4fc3a4-827f-40e5-a5fb-c02fefc61428
433	2025-06-29 17:07:07.165889+00	5230370433	109.254.149.216	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/a2c00b93-9a2c-4651-8885-43faa956f9ce	https://directus.bmulti.store/assets/7f4d7e99-2375-4c5b-812d-a3214689adb0
435	2025-06-29 19:06:07.044594+00	8180409732	178.66.158.239	t	t	check	200 рублей	OZON	79219827876	https://directus.bmulti.store/assets/a83998d7-3655-414d-93ea-ec10c8d7913e	https://directus.bmulti.store/assets/479f45e9-ee18-4b32-8aac-6fdf702fdc7e
436	2025-06-30 01:24:28.31633+00	7162899467	185.145.245.155	t	t	check	200 рублей	OZON	79637037079	https://directus.bmulti.store/assets/d8931596-e1e4-4243-8223-5e2ec6b129a0	https://directus.bmulti.store/assets/32477874-6629-4f82-b8df-f9f856820943
437	2025-06-30 03:42:32.296974+00	6180527608	178.120.7.139	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/5ace6dcf-569e-4c2d-81c5-8cf44dc203ba	https://directus.bmulti.store/assets/baf0c29c-a844-438b-bd6c-c37555fb0f81
539	2025-07-05 20:39:51.019731+00	5104325884	188.243.131.238	t	t	check	200 рублей	WB	79811803580	https://directus.bmulti.store/assets/403d8079-65d9-4035-be88-cb5efb2f1fb6	https://directus.bmulti.store/assets/2c96e0e2-8563-4b9d-8284-ce947ddccedc
455	2025-06-30 17:45:09.208156+00	1729320667	109.248.252.38	t	t	check	200 рублей	OZON	79634233213	https://directus.bmulti.store/assets/0faee1e9-92da-405a-84d2-21d7332f0998	https://directus.bmulti.store/assets/8ead1b98-3f8f-488a-9802-46aeae7190d1
438	2025-06-30 04:27:35.029682+00	468324244	178.178.242.118	f	t	done	200 рублей	OZON	79220574047	https://directus.bmulti.store/assets/8e5ce5fd-73bc-4043-85e5-e31c316e4d96	https://directus.bmulti.store/assets/e28c65f8-a51b-45b1-83ef-1edfe85cbb3b
458	2025-06-30 20:46:15.477747+00	1362718852	79.165.96.139	f	t	check	200 рублей	OZON	79818985987	https://directus.bmulti.store/assets/4847b809-f756-4ebc-ace8-92adbc58e35d	https://directus.bmulti.store/assets/727eb187-43bb-4194-9d5c-0d4bde96f223
439	2025-06-30 09:46:46.119513+00	5618744633	149.50.217.46	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/e023ca1b-ec6d-43c4-8d81-00f3feafbe3a	https://directus.bmulti.store/assets/a58225b6-2f22-4326-832b-dedd6da8d5cf
464	2025-07-01 10:16:42.445006+00	7074959768	85.193.66.232	t	t	check	200 рублей	WB	79780899654	https://directus.bmulti.store/assets/b7a42d7c-c52c-43c4-ab9d-3688ebbf9788	https://directus.bmulti.store/assets/6265b4c4-ec9a-48f3-8141-ae730c0d6967
440	2025-06-30 09:51:31.644955+00	1008137522	95.26.208.106	t	t	check	200 рублей	OZON	79144236453	https://directus.bmulti.store/assets/570a4de9-8895-4ce9-b384-f3e1064440d1	https://directus.bmulti.store/assets/d9d5a02b-292c-431c-8c14-d695da02255f
460	2025-07-01 05:58:36.005654+00	478745977	85.140.6.122	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/21ce2ceb-52d8-42fc-b3dd-83ffbd3a840a	https://directus.bmulti.store/assets/9fcc61c4-9458-4ed6-b768-80c986f4d6b1
441	2025-06-30 10:00:14.176889+00	5639967478	185.111.109.108	t	f	check	200 рублей	OZON	79886036937	https://directus.bmulti.store/assets/512a0c01-659e-4358-9aa8-8fcfad0b197c	https://directus.bmulti.store/assets/bda0de64-5073-4126-be0f-40a04715b905
461	2025-07-01 06:00:04.170712+00	478745977	85.140.6.122	f	f	check	200 рублей	YANDEX	79875268962	https://directus.bmulti.store/assets/156a612a-b360-4957-b9db-ece625ce958a	https://directus.bmulti.store/assets/c4f1a1b4-0e87-4492-92df-e73642dab3ac
444	2025-06-30 14:48:30.240467+00	5054649618	185.108.19.45	f	t	check	200 рублей	OZON	79112625188	https://directus.bmulti.store/assets/12455548-ea0c-46d4-926f-5c333c1b0cfc	https://directus.bmulti.store/assets/39d445e1-9fdf-4570-8ad5-2ec918073590
446	2025-06-30 15:07:47.313461+00	1968982052	217.118.78.203	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/be80c54a-a03f-4c6b-8460-f5cbda5b9db3	https://directus.bmulti.store/assets/1d8fb0aa-7b65-441c-8959-65bf6f7c74a0
447	2025-06-30 15:07:51.398366+00	1968982052	217.118.78.203	f	f	in_work	300 рублей	OZON	\N	https://directus.bmulti.store/assets/38fca620-53ff-45bb-9bc2-e24a2846f2b5	https://directus.bmulti.store/assets/de43b50b-e00d-429d-ae57-6bd7625f84d2
448	2025-06-30 15:07:52.76592+00	1968982052	217.118.78.203	f	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/c1a41747-a19c-4a8b-a8ea-1f5a74af2f2f	https://directus.bmulti.store/assets/2a13dfd7-ab54-4421-bd9e-fc0edc11cda1
450	2025-06-30 15:07:54.483281+00	1968982052	217.118.78.203	f	f	check	200 рублей	OZON	79622095422	https://directus.bmulti.store/assets/6497b11f-0b1d-4f01-8a75-8696bbd9de1b	https://directus.bmulti.store/assets/e6a9fcf4-3ab3-42d8-8977-da1e0fcdfe5e
463	2025-07-01 09:09:29.418978+00	5464535567	128.0.82.209	t	t	check	200 рублей	OZON	79497092865	https://directus.bmulti.store/assets/202b2fe4-5d15-415f-b642-daf994017bc7	https://directus.bmulti.store/assets/0f24c44e-5d13-43d8-b7df-3450051062c4
468	2025-07-01 14:28:19.682186+00	454579577	79.127.211.218	t	t	check	300 рублей	OZON	79278709544	https://directus.bmulti.store/assets/c3984ff1-9361-4d61-98ad-594de312e586	https://directus.bmulti.store/assets/8cadee1e-f791-4956-8d44-a002150c289e
473	2025-07-01 16:25:57.205128+00	\N	62.93.165.149	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
469	2025-07-01 15:19:58.62642+00	7377510604	79.127.142.64	t	f	check	200 рублей	OZON	79243719412	https://directus.bmulti.store/assets/8eff677e-132f-42cc-bb06-0fc51a4fd81d	https://directus.bmulti.store/assets/33f6ad32-fe1e-475b-b54e-9395cf1bfd2c
474	2025-07-01 16:54:01.032204+00	5173774590	185.119.3.40	t	t	check	200 рублей	OZON	79215507352	https://directus.bmulti.store/assets/30706637-4bd5-4dc0-a18b-2cd43a36cdfa	https://directus.bmulti.store/assets/78f06edd-68aa-4119-a3c1-a5a4ec02729e
443	2025-06-30 14:35:23.89703+00	1766925940	178.69.88.25	t	t	done	200 рублей	OZON	79535243903	https://directus.bmulti.store/assets/388bf12f-c660-4a31-9491-147b670bd98a	https://directus.bmulti.store/assets/42487aac-e4f9-4df2-8b1c-20e773b6dcfd
459	2025-06-30 22:49:00.012101+00	621484099	5.227.27.252	t	t	done	200 рублей	WB	79087533477	https://directus.bmulti.store/assets/9423d309-0cc6-498d-82df-82ee73fb9c61	https://directus.bmulti.store/assets/66a4983d-6c6a-4dfe-8f15-66cff5757686
457	2025-06-30 19:12:59.434787+00	440055586	94.19.154.255	t	t	done	200 рублей	OZON	79811654062	https://directus.bmulti.store/assets/24e6fa79-657e-454f-a895-ede335eadfb6	https://directus.bmulti.store/assets/6e8b5515-b541-4358-9603-0d9e8c193723
445	2025-06-30 14:58:51.377499+00	993724185	45.131.49.156	t	t	done	200 рублей	OZON	79591243030	https://directus.bmulti.store/assets/44e690a4-6ff9-483a-b211-83564d1518ad	https://directus.bmulti.store/assets/42f4b66f-78c3-47e8-8be7-3c5024f2e01c
442	2025-06-30 10:50:45.839763+00	1744566181	128.140.123.178	t	t	done	200 рублей	OZON	79591786414	https://directus.bmulti.store/assets/1a5a5808-dff3-47e8-9ce9-1684e85a3f74	https://directus.bmulti.store/assets/c0293074-f999-4c6c-a19d-7ec69a65d4f7
462	2025-07-01 07:34:57.375009+00	806032657	185.253.41.207	t	t	done	500 рублей	OZON	79051204560	https://directus.bmulti.store/assets/bd93f2a9-7fe1-49fb-b200-db0ae3046d7a	https://directus.bmulti.store/assets/82b0a65e-9ae0-41b7-8ad7-011977f7171f
466	2025-07-01 12:35:48.554195+00	1654817572	193.228.193.114	t	t	done	200 рублей	OZON	79785934388	https://directus.bmulti.store/assets/b7ce6a07-b7b5-426d-b822-879408c9f57c	https://directus.bmulti.store/assets/204ee5cb-44a2-4171-af26-1a01d5259e43
465	2025-07-01 11:28:52.459783+00	1331176498	80.71.171.104	t	t	done	200 рублей	OZON	79014353868	https://directus.bmulti.store/assets/e45ef9fd-d07c-453f-93b9-e38f5b3b1379	https://directus.bmulti.store/assets/665a5bc8-e9f9-43c3-b3f1-4b807669f2fa
467	2025-07-01 13:00:26.574988+00	1762328890	188.162.43.207	t	t	done	200 рублей	OZON	79961165913	https://directus.bmulti.store/assets/fb3359f7-76c6-4887-afde-3f2af3e6f92b	https://directus.bmulti.store/assets/d84f9e79-fb18-42ab-b1b5-5b81e55f32e6
449	2025-06-30 15:07:53.792689+00	1968982052	217.118.78.203	f	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/4c8bfb75-4a0d-4fb5-8471-f458a81dce2a	https://directus.bmulti.store/assets/993f8535-2c16-43d3-80b3-5f2b1b2b41c8
475	2025-07-01 18:01:31.190094+00	1990107166	185.33.161.173	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/20494493-2623-4067-be4e-c6cc598670cb	https://directus.bmulti.store/assets/afada545-f621-4b4f-8e21-6854b383dea2
476	2025-07-01 18:47:23.36181+00	1928041865	94.241.61.213	t	t	done	200 рублей	OZON	79051254115	https://directus.bmulti.store/assets/c7b4c69d-5976-4e77-a049-1a1d2b56baca	https://directus.bmulti.store/assets/8649d2ff-3c1c-4a40-9819-c7b05d0830ac
484	2025-07-02 11:28:54.620407+00	5060253466	176.15.255.83	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/531a98a2-5c2d-4fbc-ac14-4060c3a6f7c4	https://directus.bmulti.store/assets/240151eb-dcbb-49f8-8eb1-a31933a1a63f
721	2025-07-18 16:25:11.403384+00	7567717587	91.245.151.143	t	t	check	200 рублей	OZON	79167707675	https://directus.bmulti.store/assets/0fe0200e-33a0-46e5-9943-336c25e2bafd	https://directus.bmulti.store/assets/6bc49319-a3bb-45dc-bd97-bd1c07d5a331
487	2025-07-02 11:30:29.889903+00	5060253466	176.15.255.83	f	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/36d0b28a-10d1-4dd7-8cee-92693991ef91	https://directus.bmulti.store/assets/5653bce9-1a14-4054-8f04-3e5c476e13b4
334	2025-06-26 15:20:32.584992+00	5104551097	109.254.254.21	t	t	done	200 рублей	OZON	79493953608	https://directus.bmulti.store/assets/d868ded5-9d58-47c4-b235-d2ca62d9d7eb	https://directus.bmulti.store/assets/5addb987-5ca1-4900-a215-fd03dd40ba2a
485	2025-07-02 11:29:32.91003+00	5060253466	176.15.255.83	f	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/7d6b0d57-6a21-4695-8c10-e078aa71d3c4	https://directus.bmulti.store/assets/57d315a9-018f-40ac-9d50-3451e750aac7
478	2025-07-01 20:58:08.829445+00	499011185	94.19.154.255	f	f	check	200 рублей	OZON	79522617618	https://directus.bmulti.store/assets/fe7fa29a-cba1-4b7a-9739-9f408a252d1b	https://directus.bmulti.store/assets/fb44c3de-eaf4-4000-83dd-8f8599f252b9
479	2025-07-02 04:33:37.229642+00	5200414239	217.79.107.236	t	f	check	200 рублей	OZON	79885643152	https://directus.bmulti.store/assets/7cf96e99-ba76-41ff-876a-3f78768a7a47	https://directus.bmulti.store/assets/01bee688-a432-46fb-99be-2a110f475256
482	2025-07-02 11:28:33.670007+00	5060253466	176.15.255.83	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/69a8f836-8506-42d9-93d5-36bbf5948de3	https://directus.bmulti.store/assets/7b901ca0-2b43-4283-b8bb-5e9cf79b16ca
483	2025-07-02 11:28:38.136895+00	5060253466	176.15.255.83	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/7fa2795f-c17d-455d-90d9-c2db40fa8d00	https://directus.bmulti.store/assets/ddbb71d4-7fe9-461d-a9a9-6558042a8c1d
486	2025-07-02 11:29:40.922267+00	1006147845	95.129.59.164	t	t	check	200 рублей	OZON	79269649021	https://directus.bmulti.store/assets/9397c7f9-a0cb-40e3-9529-074443751250	https://directus.bmulti.store/assets/dbb1f18c-e575-4d15-9da1-f32f6e771065
456	2025-06-30 17:54:59.637731+00	537788829	46.165.12.154	t	t	done	200 рублей	OZON	79632737078	https://directus.bmulti.store/assets/020bb10d-ada7-49b6-a52c-5497e780a63c	https://directus.bmulti.store/assets/f6593a4a-76c5-4f7b-9c45-9509e1f6c664
488	2025-07-02 11:45:26.577798+00	5060253466	176.15.255.83	f	f	check	200 рублей	WB	79608485811	https://directus.bmulti.store/assets/6fdb4e3f-2b0a-49b9-96b5-656a8f0085a1	https://directus.bmulti.store/assets/7170d87c-2b9b-4933-a498-c31c5641d02d
493	2025-07-02 18:35:21.944477+00	1256593834	212.3.142.65	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/d610e811-17e1-4f3c-8f80-f04616618c12	https://directus.bmulti.store/assets/fdbe0a68-8d29-4b69-b431-a289556cead1
491	2025-07-02 17:05:13.83663+00	5783622160	176.107.211.209	t	t	check	200 рублей	WB	79201215946	https://directus.bmulti.store/assets/cdb58097-50df-439a-aeac-3295210a7e61	https://directus.bmulti.store/assets/8528d953-7b6c-4ea2-ab18-23aa08ca823a
494	2025-07-02 18:35:32.735216+00	1256593834	212.3.142.65	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/76438b3c-91a5-435e-9373-9b4dd8176c98	https://directus.bmulti.store/assets/1fa29e40-a033-4a00-bef2-f569ca26beca
495	2025-07-02 18:35:44.024896+00	1256593834	212.3.142.65	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/389279dd-51b6-4612-93f1-5cdfb67d4bb8	https://directus.bmulti.store/assets/9b3df150-da8c-4ff7-9300-98badf3e0732
496	2025-07-02 18:36:21.950259+00	1256593834	212.3.142.65	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/04d69486-811d-4796-a882-9517d224424b	https://directus.bmulti.store/assets/ed3444fc-d454-450b-8a2c-5b2d02803b86
497	2025-07-02 18:36:42.192825+00	1256593834	212.3.142.65	f	f	check	1000 рублей	OZON	79056980027	https://directus.bmulti.store/assets/b0eda85b-64ac-498c-8ac3-cba41e32ca58	https://directus.bmulti.store/assets/c1d89423-1997-4b84-9dfc-2f734e97c79a
500	2025-07-03 04:52:25.553152+00	1174815437	78.135.110.88	t	t	check	200 рублей	OZON	79991205786	https://directus.bmulti.store/assets/e66382fe-1e48-4e2e-adef-9aae5d18855d	https://directus.bmulti.store/assets/3be41de1-a737-4292-90ca-248abd0bbebd
502	2025-07-03 08:36:23.01732+00	6816572024	62.93.165.101	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/af85818d-1c15-4592-ae68-9c206aee4db3	https://directus.bmulti.store/assets/cf7f43e1-49eb-4945-bde9-aabaef8b1731
490	2025-07-02 16:46:49.774042+00	5163477587	88.201.206.123	t	t	done	200 рублей	OZON	79817393171	https://directus.bmulti.store/assets/078164c7-1024-431b-b771-92992f2b13eb	https://directus.bmulti.store/assets/5d3cad03-ee80-4c90-b3fd-6e2adbe65b9e
481	2025-07-02 08:03:46.145068+00	237149114	80.71.169.154	t	t	done	200 рублей	WB	79133615776	https://directus.bmulti.store/assets/b57ddc91-fc61-46bd-8897-6da21787d2d8	https://directus.bmulti.store/assets/49d451c4-b711-4e30-8960-af66638a052a
498	2025-07-02 20:21:11.621901+00	865987896	46.242.12.213	t	t	done	200 рублей	WB	79821731292	https://directus.bmulti.store/assets/ed7c81ab-eec4-4eb2-8b09-da9ad72d633a	https://directus.bmulti.store/assets/d5d70735-d2cc-4497-aa5a-9b2869ef75a2
499	2025-07-03 01:16:27.796876+00	7257628937	188.19.63.235	t	t	done	200 рублей	OZON	79322524983	https://directus.bmulti.store/assets/0fe2a35c-c7f8-4519-94ef-8bf52f8b4874	https://directus.bmulti.store/assets/bf1b2cd3-8c7e-4c8f-ab72-2c06d4700260
501	2025-07-03 06:08:39.908219+00	253528689	149.154.159.58	t	t	done	200 рублей	OZON	79159491794	https://directus.bmulti.store/assets/8b13fb1c-77e1-4ad7-aeb1-a802a933c257	https://directus.bmulti.store/assets/4809c210-1aee-456c-ae54-899bd007ee97
480	2025-07-02 06:53:57.815272+00	2023087981	85.26.236.222	t	t	done	200 рублей	OZON	79375481020	https://directus.bmulti.store/assets/5a0f9b1b-2399-4eda-8891-3d0321dd4d1e	https://directus.bmulti.store/assets/5cc4489d-cb6b-4164-8eca-cdcc60956a3f
489	2025-07-02 12:47:40.126436+00	5154962759	178.68.15.32	t	t	done	200 рублей	OZON	79242894100	https://directus.bmulti.store/assets/b31a8e31-929b-4101-8849-99732a0b74e6	https://directus.bmulti.store/assets/8e053e1f-bfb5-4b01-855c-683bee792a56
492	2025-07-02 17:36:09.146096+00	5242585583	95.24.194.128	t	t	done	200 рублей	OZON	79516642084	https://directus.bmulti.store/assets/9937b693-45f2-4554-9508-07f2a33bf7dd	https://directus.bmulti.store/assets/dedb530b-3c29-4949-af57-a0eef3ad4238
477	2025-07-01 19:32:09.840886+00	1555383600	89.148.238.252	t	t	done	200 рублей	OZON	79197132701	https://directus.bmulti.store/assets/9eb042ae-0abe-4adc-b19f-84f5c6701868	https://directus.bmulti.store/assets/9545b5de-f71e-4337-88ae-925f8800101c
529	2025-07-05 09:15:34.800831+00	5191307225	45.86.46.185	t	t	done	200 рублей	OZON	79498250638	https://directus.bmulti.store/assets/4329bd3b-9e21-4827-a878-7c6f4f448bad	https://directus.bmulti.store/assets/c4a7be56-226b-4409-b11f-40110010ba7c
1239	2025-08-17 11:01:15.904631+00	5619663138	109.254.254.100	t	t	check	200 рублей	OZON	79494656834	https://directus.bmulti.store/assets/01397766-83f6-425b-965b-61a323a2d635	https://directus.bmulti.store/assets/0da9eb4f-e053-4497-b97c-777f436f08ef
528	2025-07-05 07:51:10.999835+00	1982957327	95.164.86.61	t	t	done	200 рублей	WB	79280434374	https://directus.bmulti.store/assets/c914c4a9-8523-42a4-9df5-87f39fbe4af8	https://directus.bmulti.store/assets/2bd8e3f5-522f-4d3d-9759-d7e6b673e7b6
530	2025-07-05 10:12:51.43789+00	826565091	94.25.229.150	t	t	done	200 рублей	OZON	79941390228	https://directus.bmulti.store/assets/5f515a31-bd1d-4c7b-b81d-47dfed9d44aa	https://directus.bmulti.store/assets/cbc3c900-55eb-4afb-b928-4ce3a9002ad1
526	2025-07-04 19:14:31.85038+00	1568278890	130.195.221.186	t	t	done	200 рублей	OZON	79165783249	https://directus.bmulti.store/assets/470da6ee-cb65-493b-aaa3-4941d4ee26e4	https://directus.bmulti.store/assets/841e564d-2aa9-45c8-a1a0-6bbcf3893435
524	2025-07-04 18:16:04.927636+00	816195536	188.170.76.169	t	t	done	200 рублей	WB	79502587574	https://directus.bmulti.store/assets/348b3165-17bd-4eb4-9532-abb723bc6648	https://directus.bmulti.store/assets/5523edae-3324-45ac-84bd-52f2275996c1
518	2025-07-04 12:27:10.080338+00	615763499	188.234.251.224	t	t	done	200 рублей	OZON	79126466697	https://directus.bmulti.store/assets/5d874d2e-26bc-4055-8e45-9c482d310cd1	https://directus.bmulti.store/assets/dd06b14a-abf9-4bc2-b093-be60eb51a39d
503	2025-07-03 10:53:28.392803+00	5143434027	188.232.224.1	t	t	done	200 рублей	OZON	79136079929	https://directus.bmulti.store/assets/2afe42ad-fadf-4c1e-939e-f479b89f327e	https://directus.bmulti.store/assets/31f5adc2-4c8e-4252-be77-d4510cbfa294
506	2025-07-03 12:35:44.180804+00	2004760407	178.35.61.121	t	t	check	200 рублей	WB	79288837629	https://directus.bmulti.store/assets/a82fd050-cff5-4ae9-bcd1-0574668c25df	https://directus.bmulti.store/assets/404f5544-8050-4924-90c5-e4518ea52211
516	2025-07-04 07:26:15.720606+00	436714183	5.183.131.19	t	t	done	200 рублей	OZON	79385130531	https://directus.bmulti.store/assets/793d9ef6-c40e-4cce-b794-e15577938bb8	https://directus.bmulti.store/assets/018621ee-8b5d-44b4-b58d-39f2b661d58f
515	2025-07-03 20:51:45.385989+00	383849813	176.56.182.155	t	t	done	200 рублей	OZON	79628741346	https://directus.bmulti.store/assets/c515ee95-8be8-416e-8799-e9e055b3eba1	https://directus.bmulti.store/assets/7b0afc94-8158-4e40-ac5b-9990ae331951
512	2025-07-03 17:09:26.720219+00	435089023	87.117.54.26	t	t	done	200 рублей	OZON	79154861882	https://directus.bmulti.store/assets/41946d17-c17f-4a69-8715-c0bacde996a8	https://directus.bmulti.store/assets/a144e107-509b-4fa3-bd71-4681b94d58bf
511	2025-07-03 16:55:32.837063+00	5170992927	176.214.227.7	t	t	done	300 рублей	OZON	79158535539	https://directus.bmulti.store/assets/116a81af-a95d-429b-bce1-2dbf8485ad70	https://directus.bmulti.store/assets/4539081a-46ec-4031-8929-4c99699c078f
510	2025-07-03 16:49:03.359693+00	183750093	31.173.80.39	t	t	done	200 рублей	OZON	79372850005	https://directus.bmulti.store/assets/94478c04-ed1e-4b70-bf2c-778b325d4966	https://directus.bmulti.store/assets/e3197b29-3d78-42d7-af7d-99ec2998e8f5
508	2025-07-03 14:52:41.501751+00	665650188	46.138.0.78	t	t	done	200 рублей	OZON	79269440999	https://directus.bmulti.store/assets/ff6a21e4-e5c1-4e01-81d0-e094cf2734d1	https://directus.bmulti.store/assets/e198fe2d-e74e-4865-b5b1-4b006e116dd7
513	2025-07-03 18:31:35.557127+00	2079723632	128.0.82.243	t	t	check	200 рублей	OZON	79493997352	https://directus.bmulti.store/assets/5bd2cc0d-8e38-4db5-8ec8-93c976b430ae	https://directus.bmulti.store/assets/cd8abbf1-dbac-49ca-96bc-7793e95f7fe4
514	2025-07-03 18:48:03.975745+00	8148210044	95.24.209.215	t	t	check	200 рублей	OZON	79257165047	https://directus.bmulti.store/assets/9407ef2a-74ed-4a6e-8c36-00326e7b9397	https://directus.bmulti.store/assets/eca1c4ea-cfcb-4954-88f5-115468e33a4f
509	2025-07-03 15:37:56.995543+00	1558631813	91.84.101.135	t	t	done	200 рублей	OZON	79969006356	https://directus.bmulti.store/assets/7dee1743-3002-421f-a468-e4aab53e4fc5	https://directus.bmulti.store/assets/e072d9c9-1560-4c95-9a34-812b1e4c320a
507	2025-07-03 13:33:45.410551+00	1492093664	81.195.138.88	t	t	done	200 рублей	OZON	79885375132	https://directus.bmulti.store/assets/52587ba3-80bc-4cf6-a9b1-11be4c159684	https://directus.bmulti.store/assets/205a523e-e26d-4b2c-a1d4-242184d11e51
505	2025-07-03 12:21:44.591256+00	1682238476	79.175.1.147	t	t	done	200 рублей	OZON	79006454300	https://directus.bmulti.store/assets/f515f67b-f9c2-4f6f-9eaf-64d47dbbfc7c	https://directus.bmulti.store/assets/d665a254-5afe-46c6-8293-7d855d7fd324
504	2025-07-03 11:14:37.539816+00	7938579025	91.146.40.41	t	t	done	200 рублей	WB	79800416536	https://directus.bmulti.store/assets/c704bbda-9398-4c2d-9485-f9e5ed4301ed	https://directus.bmulti.store/assets/64399c5b-e9a5-4063-a575-5a6c113a010c
522	2025-07-04 16:04:13.968796+00	700155364	95.161.223.136	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/112734dc-f0fa-4315-a62a-828d4fad54d6	https://directus.bmulti.store/assets/9169333e-29a1-4dcd-a376-45b209a015ec
519	2025-07-04 13:29:36.112936+00	946685673	45.95.232.10	f	f	check	200 рублей	OZON	79995883605	https://directus.bmulti.store/assets/4cf28bbd-285b-406a-a948-11a3a345591d	https://directus.bmulti.store/assets/5b6b4a18-1361-4ef5-9452-dbb8c5ad0af4
517	2025-07-04 08:15:55.115484+00	766082339	85.26.185.218	f	t	check	200 рублей	WB	79005998342	https://directus.bmulti.store/assets/a0628dd1-44d0-4030-a31f-69b334ad7896	https://directus.bmulti.store/assets/8d9e16c2-3b8b-4f47-a3ff-e0888235a00f
520	2025-07-04 14:16:20.305669+00	953062471	178.66.108.216	t	t	check	200 рублей	OZON	79062797915	https://directus.bmulti.store/assets/c5ffb03b-7062-4e7e-a585-d1d6c10e9691	https://directus.bmulti.store/assets/f2d81661-e8fb-4032-ba57-860b893cd48b
521	2025-07-04 14:40:12.825425+00	8103765505	151.0.53.113	t	f	check	200 рублей	OZON	79493509313	https://directus.bmulti.store/assets/7a269306-2b1b-4b41-8eaa-4fb6bad5a7a1	https://directus.bmulti.store/assets/2e9e922c-a1f8-46af-bf44-71828e011eee
523	2025-07-04 16:10:49.39604+00	2134478410	176.59.99.239	f	t	check	300 рублей	WB	79004511799	https://directus.bmulti.store/assets/aade0e56-6469-43e1-a41d-a05215fc10f7	https://directus.bmulti.store/assets/2816a004-de0a-4dcd-942f-92504b6d9b14
525	2025-07-04 18:33:24.444698+00	5721425879	95.52.137.35	t	t	check	200 рублей	OZON	79524881972	https://directus.bmulti.store/assets/388637be-de0c-4451-88ec-ee59118e1fcf	https://directus.bmulti.store/assets/4b16b029-2883-49df-9fcb-202ed5161d98
527	2025-07-05 06:54:06.110184+00	7806764209	31.132.249.217	t	t	check	200 рублей	WB	79145112228	https://directus.bmulti.store/assets/473c3329-f6c0-4560-8be9-ab546b5ebaf9	https://directus.bmulti.store/assets/f58adce6-f871-4457-9e30-c7f984c3964f
531	2025-07-05 11:11:39.58368+00	7335613789	171.22.214.3	t	t	check	200 рублей	WB	79027685906	https://directus.bmulti.store/assets/e148018c-8db3-444a-9020-30687b1b0419	https://directus.bmulti.store/assets/9719bd2f-3748-4c2a-85f1-3deb2af065df
629	2025-07-11 13:28:19.799294+00	1152988721	188.170.87.167	t	t	check	1500 рублей	OZON	79313188882	https://directus.bmulti.store/assets/67f1a74b-9b01-4bd1-8cf7-9544c18fd63c	https://directus.bmulti.store/assets/2611f814-be71-4f4a-ba45-027736ac8b0c
536	2025-07-05 16:30:05.002083+00	8020360207	109.126.168.166	t	t	check	1000 рублей	WB	79850639767	https://directus.bmulti.store/assets/ac872e13-8859-4aec-9e65-ba03b6ce873d	https://directus.bmulti.store/assets/a1d057d9-1fa2-45fd-9972-291988d1666f
532	2025-07-05 11:16:49.055848+00	6998676380	92.47.166.101	t	t	check	200 рублей	OZON	77754657798	https://directus.bmulti.store/assets/b2520f68-d0ce-49f2-b10c-33bfc7a45848	https://directus.bmulti.store/assets/98a32cba-c15b-482f-bd66-2b7935987619
540	2025-07-06 03:49:18.078177+00	8010214172	62.212.79.231	t	f	check	200 рублей	OZON	79954323542	https://directus.bmulti.store/assets/7ce57b63-9859-45b1-b2c3-57c7e0959732	https://directus.bmulti.store/assets/2f7f7b80-4ade-496f-b222-8614ed6de6bf
542	2025-07-06 03:55:14.493869+00	7552460791	62.212.79.231	t	f	check	200 рублей	OZON	79554323542	https://directus.bmulti.store/assets/cfa65072-dda3-4f73-b581-3fa0d521ff67	https://directus.bmulti.store/assets/c23bfdb3-2314-4d24-8ff6-b0c8e60d6020
543	2025-07-06 03:58:26.844313+00	1483493899	92.38.37.120	t	t	check	200 рублей	WB	79638060505	https://directus.bmulti.store/assets/87a8aa9c-13ce-4ed8-a75b-39158f60c61f	https://directus.bmulti.store/assets/ccf83a7b-e58a-4373-805e-b6773f464e60
534	2025-07-05 14:52:47.516036+00	1135941556	176.118.242.60	t	t	check	200 рублей	WB	95182719502	https://directus.bmulti.store/assets/7b08238b-5ac8-45fe-91c0-4492cc9b0909	https://directus.bmulti.store/assets/d242e33d-c6c9-4647-bd12-83691376d886
548	2025-07-06 12:01:25.670774+00	314145650	45.144.48.140	t	t	check	200 рублей	OZON	79179087323	https://directus.bmulti.store/assets/bac61ef4-5ce2-407a-987a-ffc6216ad94c	https://directus.bmulti.store/assets/f962bb97-b473-495f-8166-e693831d4180
544	2025-07-06 06:29:59.299333+00	1024033255	141.94.160.153	t	t	done	200 рублей	OZON	79493843902	https://directus.bmulti.store/assets/8f39ab16-e6b2-4b67-b8d2-f6eecdcfc45a	https://directus.bmulti.store/assets/78f4a833-1e1a-46ca-8703-6adcbb20554f
550	2025-07-06 15:42:07.727373+00	5094924469	46.165.62.192	t	t	check	200 рублей	OZON	79122666767	https://directus.bmulti.store/assets/3377843f-7206-41f6-b598-c486fa542811	https://directus.bmulti.store/assets/a45cb0ea-c16e-4449-8d92-283cb6aaf148
553	2025-07-06 20:07:07.938705+00	6501821885	185.119.3.137	t	f	check	200 рублей	WB	79112943454	https://directus.bmulti.store/assets/52c59a37-7dbd-4264-b758-3c8d7f5a7c6d	https://directus.bmulti.store/assets/0cabf5c2-3435-4c69-b59c-cd2276f4300c
545	2025-07-06 06:46:20.409203+00	5212211532	23.227.193.18	t	t	done	200 рублей	OZON	79670398525	https://directus.bmulti.store/assets/f511f20b-1796-480e-ac5b-3f16a93b3cd4	https://directus.bmulti.store/assets/ac8afb2f-09ad-4456-ace0-6a7846f02367
554	2025-07-06 20:33:58.296001+00	1249474229	46.72.136.104	f	t	check	200 рублей	OZON	79951763464	https://directus.bmulti.store/assets/169d5017-5323-4c19-9048-b00cf714a9e5	https://directus.bmulti.store/assets/4abfcf1e-ecfb-4dd2-87b9-1ab7dc418d99
533	2025-07-05 14:28:23.428667+00	1048628890	109.237.103.77	t	t	done	2000 рублей	WB	79780190485	https://directus.bmulti.store/assets/e9482af0-57e3-4d63-8986-e09701993513	https://directus.bmulti.store/assets/df5caea7-407b-4db0-83ae-948c4b334025
535	2025-07-05 15:39:43.222252+00	873590133	45.10.167.237	t	t	done	200 рублей	OZON	79293179998	https://directus.bmulti.store/assets/ff936a73-1f4c-45f0-bbcf-82b9a3ae918e	https://directus.bmulti.store/assets/146e5846-b6af-4724-9553-33a3524442c1
537	2025-07-05 18:47:10.546714+00	383802915	37.212.38.141	t	t	done	200 рублей	WB	79296704078	https://directus.bmulti.store/assets/798eda6a-1259-448a-83cf-3af602af6f83	https://directus.bmulti.store/assets/e5159bbb-20e8-4123-8acb-052367f6a95e
538	2025-07-05 19:17:25.741979+00	1087853015	31.134.189.161	t	t	done	200 рублей	OZON	279517525798	https://directus.bmulti.store/assets/d91fb06c-474c-4360-8ce9-5c5950e3a602	https://directus.bmulti.store/assets/b0928e7c-0007-4c70-978e-ccfe162cd26a
546	2025-07-06 08:33:51.302068+00	5420594816	188.191.23.205	t	t	done	200 рублей	WB	79787600625	https://directus.bmulti.store/assets/19977a1b-f63d-4659-a83d-4c8d42070e97	https://directus.bmulti.store/assets/7b331957-07be-4c48-93bc-46f7aead9d6a
547	2025-07-06 10:47:16.774062+00	7535008085	77.221.140.178	t	t	done	200 рублей	OZON	79242791112	https://directus.bmulti.store/assets/12544484-8488-4356-994e-448b26fbbbc5	https://directus.bmulti.store/assets/34df0a9d-fff8-4f6f-9ac1-f520cf5ebee5
551	2025-07-06 17:07:36.831379+00	345652349	62.182.76.131	t	t	done	200 рублей	OZON	79256092518	https://directus.bmulti.store/assets/64a4dacf-d3da-4062-beef-dee049a43e42	https://directus.bmulti.store/assets/13a0c6aa-f505-4ee6-9209-10b16a999f2e
552	2025-07-06 18:13:23.678639+00	1186077191	80.234.72.26	t	t	done	200 рублей	OZON	79179589789	https://directus.bmulti.store/assets/a39aae86-ef70-4020-ae8d-fc184308b3ae	https://directus.bmulti.store/assets/5b6002b7-3280-4c9e-ac3e-75b84a68a6aa
549	2025-07-06 12:04:00.706262+00	314145650	178.204.255.199	f	f	done	200 рублей	OZON	79179087323	https://directus.bmulti.store/assets/21e33969-28a0-4d55-81f2-957980de7c74	https://directus.bmulti.store/assets/d804db5f-642d-46d8-ae12-ac54be35f2bc
560	2025-07-07 13:00:55.529252+00	1213152606	193.243.189.67	f	t	check	200 рублей	OZON	79600412112	https://directus.bmulti.store/assets/6ef52e20-3970-4d8c-908b-ca76efaa4b2d	https://directus.bmulti.store/assets/676af3a4-586e-4918-b5c9-d39acd7e1abf
561	2025-07-07 13:28:52.141671+00	368838207	193.243.189.75	t	t	check	200 рублей	OZON	79139353575	https://directus.bmulti.store/assets/f27c86af-a346-4fa9-8576-9b7e5a9de901	https://directus.bmulti.store/assets/f2665171-9f00-4fce-90b2-d1b22c3e93e4
562	2025-07-07 14:33:57.875023+00	990452753	57.130.31.221	t	t	check	200 рублей	WB	79785706333	https://directus.bmulti.store/assets/7564700b-3376-4aa9-ac40-08d83423d3e3	https://directus.bmulti.store/assets/d450bbd8-517c-4dcc-89c3-659273336a63
555	2025-07-07 10:49:53.21179+00	5089463374	95.55.203.169	t	t	done	200 рублей	OZON	79960296966	https://directus.bmulti.store/assets/6d5369c8-2ab6-4ba4-b1c5-938e338a368e	https://directus.bmulti.store/assets/88b2f8b5-6a22-4039-ae82-7e5733703778
558	2025-07-07 11:21:25.309287+00	7528142234	178.205.124.27	t	t	done	200 рублей	OZON	79600317741	https://directus.bmulti.store/assets/05307984-794d-4321-ae38-cfa6bb4640a8	https://directus.bmulti.store/assets/39ed6cda-ac06-4c18-948e-466211cb7b3c
556	2025-07-07 10:53:23.789951+00	911053420	46.53.249.4	t	t	done	200 рублей	OZON	9112380160680205	https://directus.bmulti.store/assets/7539b9aa-ace4-4903-8998-a66e45d00eec	https://directus.bmulti.store/assets/bf563f77-4c9d-4a75-a80c-484945dd89e4
557	2025-07-07 11:11:03.880181+00	6296994436	31.44.245.89	t	t	done	200 рублей	WB	79500792757	https://directus.bmulti.store/assets/953355c5-eb0d-4fb5-bb6b-285a1b613b69	https://directus.bmulti.store/assets/4436c36c-0c6b-4b36-8d03-d6c0cce9518d
559	2025-07-07 12:29:02.327267+00	1921752044	79.127.142.139	t	t	done	200 рублей	OZON	79899952006	https://directus.bmulti.store/assets/d903a8b2-7c1c-40e6-8422-dd93fa8e2c37	https://directus.bmulti.store/assets/83019d1d-1e79-4260-8e10-eece7500b14f
592	2025-07-09 05:36:35.995887+00	1642432728	176.15.253.141	t	t	done	200 рублей	OZON	79617778042	https://directus.bmulti.store/assets/e229e457-4439-4dc5-8e0b-22fb0e2e31df	https://directus.bmulti.store/assets/3d245eec-2c08-41e2-8f5c-bbd3f8234fde
573	2025-07-07 18:18:31.278773+00	7824751504	188.113.199.230	t	t	check	200 рублей	OZON	79063399522	https://directus.bmulti.store/assets/50efdfe6-5680-47e5-8520-aec12cfc53c4	https://directus.bmulti.store/assets/25227cf8-ce11-43cf-bf8d-62aaa84baaf9
719	2025-07-18 14:19:23.678805+00	1618209052	136.144.189.179	t	t	check	200 рублей	WB	79003840771	https://directus.bmulti.store/assets/2565e366-2455-4953-a6dc-23808962fbd7	https://directus.bmulti.store/assets/edb4e767-6479-4cc2-acd5-2ac874f81e6a
564	2025-07-07 15:20:33.213688+00	6538536575	169.150.196.74	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/797cc906-b85f-4ae6-9ca5-f22a90417fdf	https://directus.bmulti.store/assets/357b9d58-375f-4885-8217-5bed7c439950
565	2025-07-07 15:45:23.986531+00	1899799722	217.66.154.221	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/d66296ad-ec5f-43dd-a6a0-97f6628eefb1	https://directus.bmulti.store/assets/957d8078-761c-4a45-bbc6-719aa5e340c0
566	2025-07-07 15:45:49.584316+00	1899799722	217.66.154.221	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/c5276987-204d-499a-b6bc-feb670993e4b	https://directus.bmulti.store/assets/28b23b79-ceeb-48c8-b9b5-044465436b18
568	2025-07-07 16:45:47.808275+00	\N	128.14.56.222	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
574	2025-07-07 18:56:48.763822+00	1394313854	185.193.158.92	t	t	check	200 рублей	OZON	79064632559	https://directus.bmulti.store/assets/412530c1-c6cb-4ce3-9ed6-91fdf11ac06e	https://directus.bmulti.store/assets/6180e2ca-d61c-4a67-a94a-b1885cf882e1
571	2025-07-07 16:46:53.722827+00	278703354	94.180.230.232	f	f	check	200 рублей	OZON	79172277577	https://directus.bmulti.store/assets/22ceb6ee-9225-4848-a3ce-319ebcb7d91d	https://directus.bmulti.store/assets/7cca346b-811e-452c-b917-c16c262e4669
570	2025-07-07 16:46:17.332385+00	278703354	128.14.56.222	f	f	check	200 рублей	OZON	79172277577	https://directus.bmulti.store/assets/6824486e-66f0-4801-a709-c2765b699a10	https://directus.bmulti.store/assets/7534728b-163e-4003-a862-323e222b87d6
569	2025-07-07 16:45:57.676404+00	278703354	128.14.56.222	f	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/4eedef0a-3a59-4394-9661-770dcf49ea52	https://directus.bmulti.store/assets/cdf2351c-2184-4e74-969a-e610b6dd35fc
567	2025-07-07 16:45:47.201546+00	278703354	128.14.56.222	t	t	check	500 рублей	OZON	79172277577	https://directus.bmulti.store/assets/92ad3208-9e2e-477c-9448-2fbb227637c7	https://directus.bmulti.store/assets/1b543bf0-434d-4611-8939-d1c6fd6614e6
581	2025-07-08 09:38:59.044693+00	1570299860	185.97.201.10	t	t	check	500 рублей	OZON	79773771377	https://directus.bmulti.store/assets/85143ab2-ab1e-42d1-81c4-8d848e321067	https://directus.bmulti.store/assets/bf4ce41c-7098-4a13-bd0d-bb6d2fbabf62
578	2025-07-08 08:18:47.0926+00	1448597638	5.18.210.173	t	f	check	200 рублей	OZON	79215700014	https://directus.bmulti.store/assets/33274cfc-f50c-4958-a575-6e706d7a488f	https://directus.bmulti.store/assets/3bdb0a1c-8ff5-4fc6-80e3-7cd73a3f7fc9
575	2025-07-07 22:06:12.863738+00	1343662329	178.65.155.241	t	t	check	200 рублей	OZON	79116024016	https://directus.bmulti.store/assets/1df29ad6-c57d-4df5-8e77-bddf01c425a9	https://directus.bmulti.store/assets/5620a2b4-54ef-46de-852f-ac8ed3d0e957
576	2025-07-07 22:23:31.46525+00	862550547	178.65.155.241	f	f	check	200 рублей	OZON	79111794352	https://directus.bmulti.store/assets/fe7ae004-763d-422b-b0db-caf82c7fdff0	https://directus.bmulti.store/assets/f5360866-4e9d-4e93-8c01-9533857aee9b
577	2025-07-08 04:07:25.448297+00	7388741202	188.113.200.240	f	f	check	200 рублей	OZON	79046201089	https://directus.bmulti.store/assets/5da39129-e0a4-4c7e-854b-80ef75e19f83	https://directus.bmulti.store/assets/95a5c6b0-31ed-4ae5-abef-ee073d65a609
584	2025-07-08 12:00:09.045531+00	485043095	212.96.84.206	f	t	check	200 рублей	OZON	77083057734	https://directus.bmulti.store/assets/577f0bc1-4503-4d0f-a4d0-331a82a7e2f7	https://directus.bmulti.store/assets/2eff31b3-d8f3-4af7-b5f1-2e1c893a0e3c
588	2025-07-08 17:24:56.392365+00	5500592276	88.210.12.162	t	t	check	200 рублей	OZON	79921906742	https://directus.bmulti.store/assets/c7a6ba98-c91a-4f79-8ae0-ce7dd22583ed	https://directus.bmulti.store/assets/1753a34f-1a3c-4eda-acb8-26dbb319360c
589	2025-07-08 17:37:37.374274+00	8149731544	79.72.27.8	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/eae48fbb-009f-42a7-9214-ea52b274c8a1	https://directus.bmulti.store/assets/0405c62e-4e44-45d4-80a4-6e040f2c645b
590	2025-07-08 18:10:30.509649+00	5912858708	176.15.166.203	t	f	check	200 рублей	WB	79650315454	https://directus.bmulti.store/assets/a3b65c8d-41ba-4ce6-b51a-ecc22e9b5838	https://directus.bmulti.store/assets/521933b8-be36-4e7b-9b4a-9584aac83a5a
591	2025-07-08 20:10:20.986843+00	6483547439	78.36.215.17	t	t	check	200 рублей	OZON	79520510003	https://directus.bmulti.store/assets/7883606d-466e-4fa7-b901-ba9a465aff22	https://directus.bmulti.store/assets/2f5a5972-75fb-477b-a045-2aa2dabbbd32
563	2025-07-07 14:53:25.930501+00	407239227	178.70.90.91	t	t	done	200 рублей	OZON	79110869133	https://directus.bmulti.store/assets/ada17294-8009-4a97-a457-153757581466	https://directus.bmulti.store/assets/5eeb4c19-41d8-490c-acaa-f085b720f5c9
579	2025-07-08 08:41:54.95865+00	2110508278	163.172.167.232	t	t	done	1500 рублей	OZON	279135941503	https://directus.bmulti.store/assets/1c7f2203-d398-4b98-a527-5c3586e10154	https://directus.bmulti.store/assets/94be17f9-e21e-4b19-8104-64fe8e223757
582	2025-07-08 11:53:35.476914+00	1324632691	51.159.167.194	t	t	done	200 рублей	OZON	79085837693	https://directus.bmulti.store/assets/8f6bce4b-54ce-4a29-aec1-df6b77482347	https://directus.bmulti.store/assets/ff4db90a-ca27-4e07-9fa3-af664c415cf5
583	2025-07-08 11:56:27.530068+00	1771293425	188.17.159.116	t	t	done	200 рублей	OZON	79223748414	https://directus.bmulti.store/assets/6f521e83-797d-4e24-8aeb-7490714364c3	https://directus.bmulti.store/assets/3ad86a71-2a66-42f3-816c-abdbd655c546
585	2025-07-08 13:48:21.044483+00	873840264	213.151.25.242	t	t	done	200 рублей	OZON	79041614201	https://directus.bmulti.store/assets/e941eb40-ade8-4314-ab97-cc14482b4b4f	https://directus.bmulti.store/assets/c2614c08-fa2f-44d3-8919-4e77e899de16
586	2025-07-08 14:53:49.624609+00	1886247479	51.15.227.250	t	t	done	200 рублей	OZON	79376572600	https://directus.bmulti.store/assets/2f553372-7009-48a0-a4ef-0ecf8732d04c	https://directus.bmulti.store/assets/199f1d08-baae-400a-a41d-a0c9e5d7e611
587	2025-07-08 16:28:11.535746+00	256532381	95.27.65.207	t	t	done	200 рублей	WB	79206614970	https://directus.bmulti.store/assets/a203db1c-f7a3-4b95-b17d-2ce289368ac1	https://directus.bmulti.store/assets/ddbf1691-cab7-45d7-91f9-e410128b162f
580	2025-07-08 08:56:47.41695+00	5163110644	176.15.195.5	t	t	done	200 рублей	WB	79064593620	https://directus.bmulti.store/assets/ed2da5b3-7f8d-479a-a52c-4ff9fce9c777	https://directus.bmulti.store/assets/b6e4f612-cc7a-473c-9b1f-4fa96e56625a
572	2025-07-07 16:59:14.13287+00	1871338980	185.14.187.233	t	t	done	200 рублей	OZON	79962346990	https://directus.bmulti.store/assets/3e94e6cc-879a-4fa8-8d89-3db20c72a937	https://directus.bmulti.store/assets/0bcb0fce-2d2c-463c-aca5-48428fd9803d
620	2025-07-10 17:26:06.657247+00	1905898681	46.22.62.70	t	t	done	200 рублей	OZON	79999070849	https://directus.bmulti.store/assets/9ffa4e63-e225-46bd-9e82-b4d322c5e4fe	https://directus.bmulti.store/assets/653a6821-8ea7-4844-9f98-fdbbaccc47e6
601	2025-07-09 14:33:20.809428+00	5249444493	178.57.116.61	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/05789883-1313-49e8-9bff-91e2b6fce263	https://directus.bmulti.store/assets/b5614fad-e3e3-4b55-9049-cbe3ed29bd57
593	2025-07-09 06:23:18.795263+00	1251006596	46.32.185.78	t	t	check	200 рублей	WB	79267131128	https://directus.bmulti.store/assets/17376fd3-0455-406b-bed4-5651a546a82f	https://directus.bmulti.store/assets/93ec4851-0d28-4404-93a9-3d1c784d6fdb
617	2025-07-10 16:45:53.337184+00	360296878	31.41.32.189	t	t	done	200 рублей	OZON	79381195833	https://directus.bmulti.store/assets/6e21bdab-23fb-4f81-9173-e1b9acc31756	https://directus.bmulti.store/assets/e05b18a7-838e-41e3-a219-59d47c472a2b
594	2025-07-09 07:51:58.35479+00	488891254	79.184.66.162	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/ec7dd775-8a45-4c7c-9783-3fefa2d06219	https://directus.bmulti.store/assets/755dc2ab-90d2-4241-82de-bcde1690854d
598	2025-07-09 12:44:33.977741+00	1897071807	178.178.242.42	t	t	done	200 рублей	OZON	79180635465	https://directus.bmulti.store/assets/5ffe26c6-5f38-4472-a16b-b970f005ff82	https://directus.bmulti.store/assets/1fbc494d-458a-457a-8a98-a78052fd0fbd
609	2025-07-10 12:27:26.237962+00	2038259285	49.12.239.32	t	t	done	200 рублей	OZON	79231613647	https://directus.bmulti.store/assets/d487d86d-a462-41e1-80b1-a5947e099317	https://directus.bmulti.store/assets/90a5f74e-8388-4709-8d6f-b25864023bb2
611	2025-07-10 15:11:44.197671+00	6184304510	91.239.130.198	t	t	done	200 рублей	WB	79915311971	https://directus.bmulti.store/assets/b4ec1abf-022c-4db5-b565-4914aa69cbd5	https://directus.bmulti.store/assets/27e22f71-6d11-4989-9dea-010f4eb4af61
596	2025-07-09 11:44:38.601779+00	5362243703	94.25.231.72	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/209f8118-925e-456a-b5d8-dd714f26a86f	https://directus.bmulti.store/assets/61e0ba89-9f5c-4b16-87fa-69ec3c5687a2
612	2025-07-10 15:29:42.612138+00	125731741	82.140.244.84	t	t	done	200 рублей	OZON	79520641506	https://directus.bmulti.store/assets/f0c21868-6d49-43ae-85ce-142c361051d7	https://directus.bmulti.store/assets/58325a55-2d76-4d5e-9b86-784d194d9d4a
614	2025-07-10 15:57:20.451308+00	7687189025	80.80.194.230	t	t	done	200 рублей	OZON	79539517733	https://directus.bmulti.store/assets/24b341ab-2d57-4724-9dff-b5d471d091ca	https://directus.bmulti.store/assets/101a18bd-10d9-4954-8542-a42907d933d3
615	2025-07-10 16:10:45.621786+00	7095220292	188.162.65.166	t	t	done	200 рублей	OZON	79996687345	https://directus.bmulti.store/assets/3fad62b8-0270-4aad-9da8-744e2cdaf7b5	https://directus.bmulti.store/assets/6c445467-3c9e-4578-b982-540e47dbe897
616	2025-07-10 16:27:44.816646+00	2097061830	188.187.176.245	t	t	done	200 рублей	OZON	79613378314	https://directus.bmulti.store/assets/d6b1efb8-29f5-4491-9cba-b4c5ee937cb5	https://directus.bmulti.store/assets/4b2c6aa6-695c-492c-b8ba-849b4c9f0f9d
595	2025-07-09 11:38:00.79963+00	377443767	94.25.172.134	t	t	done	200 рублей	OZON	79164293951	https://directus.bmulti.store/assets/6c22bddb-3ef0-4e3e-9363-a9d29407294d	https://directus.bmulti.store/assets/f5db6e11-63ed-42bd-bbe1-bd6625c6792d
880	2025-07-28 07:00:21.846772+00	\N	5.141.193.236	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
632	2025-07-11 15:09:54.914592+00	1050698466	87.241.156.139	t	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/c6c066c6-d248-40b7-9fe9-44d5983db406	https://directus.bmulti.store/assets/ee60c3c4-ff3b-4966-8dd5-ebcbc76f1df2
602	2025-07-09 14:48:16.302386+00	1199113167	80.80.195.52	t	t	check	200 рублей	OZON	79190725215	https://directus.bmulti.store/assets/022ecc20-c6b2-414f-afd1-e533960bf404	https://directus.bmulti.store/assets/d00e4e2e-2c64-4622-8f53-bdfa19d8b1ca
599	2025-07-09 13:47:56.044462+00	850561644	176.125.156.25	t	t	check	200 рублей	OZON	79119725381	https://directus.bmulti.store/assets/98ab761d-eef8-46c5-a5c8-d06cbf1352be	https://directus.bmulti.store/assets/2aa0341d-6766-47e8-8058-757888c6788a
597	2025-07-09 11:44:58.232188+00	5362243703	94.25.231.72	f	f	check	200 рублей	YANDEX	79114688536	https://directus.bmulti.store/assets/ab2eaf39-357c-436c-b260-931640795669	https://directus.bmulti.store/assets/1e14decb-3ff7-40fc-ba85-03a2838469be
600	2025-07-09 14:18:53.022161+00	1132828403	37.112.146.87	f	t	check	200 рублей	OZON	79158573536	https://directus.bmulti.store/assets/e3eea456-dbef-40c9-bb75-3b228d03a2ec	https://directus.bmulti.store/assets/2b2d2d6b-5ea5-4768-879a-f76370d2d2fc
604	2025-07-09 16:02:18.569512+00	989713115	31.185.9.91	t	t	check	200 рублей	OZON	79377145990	https://directus.bmulti.store/assets/c3c0ea34-d6e5-40ac-91b1-6cb6f2e061c0	https://directus.bmulti.store/assets/8222dee0-7521-417e-bee3-425ed5982e8b
610	2025-07-10 13:55:29.795361+00	6793601739	78.132.244.90	f	f	check	200 рублей	WB	90273178672	https://directus.bmulti.store/assets/9c268e8f-606d-4b2c-8195-6d9c312ede6b	https://directus.bmulti.store/assets/fd2a90cd-9282-4e11-90be-0271b20bb458
605	2025-07-09 16:14:13.089518+00	116551159	31.28.10.177	t	t	check	200 рублей	OZON	79819885666	https://directus.bmulti.store/assets/915c9da8-afa3-4e77-9fb3-582aaff54475	https://directus.bmulti.store/assets/8c7b6f67-b334-4eb7-b101-e2b4f00d9cd8
607	2025-07-10 09:04:18.523504+00	498929672	185.16.138.218	t	t	check	200 рублей	OZON	79003545289	https://directus.bmulti.store/assets/0bf6a548-7d15-4e22-8cbb-d6f087dfaf40	https://directus.bmulti.store/assets/162d2e2c-af4d-4583-9140-198f7e087fb4
606	2025-07-09 17:22:48.450644+00	410508756	188.243.201.209	f	f	check	200 рублей	OZON	79312667297	https://directus.bmulti.store/assets/12509376-75a3-48c0-9b57-c111395eb539	https://directus.bmulti.store/assets/52f4701e-110b-4515-95d9-b12369e0085e
603	2025-07-09 15:15:27.123453+00	1170627	213.87.159.134	t	f	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/415f9376-bb5d-4196-bd55-4a50f086b86d	https://directus.bmulti.store/assets/24b6aa63-fd20-42f1-91da-59fa782a2aee
608	2025-07-10 11:59:58.624087+00	7706946620	194.54.144.61	t	t	check	200 рублей	WB	79631105567	https://directus.bmulti.store/assets/e2c80936-a43c-40a3-957e-380aeac29b99	https://directus.bmulti.store/assets/2077d500-3eaf-4292-97d0-74ff50532b54
613	2025-07-10 15:40:28.012199+00	1756120738	176.60.52.32	t	f	check	200 рублей	WB	375333193978	https://directus.bmulti.store/assets/db81bb8c-3b21-4101-8f50-3d2d74ab0a35	https://directus.bmulti.store/assets/fc7fabbf-c832-4ea5-9cbe-9a3514f50158
618	2025-07-10 16:53:06.939609+00	409902664	128.204.75.75	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/ee035719-e124-4a00-aba9-8ded78a628ad	https://directus.bmulti.store/assets/07ce77d3-40f9-4b99-99c5-b6b2c22be7e4
619	2025-07-10 16:53:14.804488+00	409902664	128.204.75.75	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/10548ace-9352-4e43-9fd8-fbd3336bd344	https://directus.bmulti.store/assets/5e04d029-a53d-4ab4-890a-06375e3181b4
621	2025-07-10 17:30:13.051559+00	5306723213	85.26.176.188	t	t	check	200 рублей	OZON	79284442024	https://directus.bmulti.store/assets/0836600e-44c6-4586-85e8-c89b6ff43c97	https://directus.bmulti.store/assets/b931685c-dca8-4162-a1cb-af24879b0c43
626	2025-07-10 23:30:08.935404+00	615175618	149.40.62.9	t	t	done	200 рублей	OZON	79662724043	https://directus.bmulti.store/assets/3d337078-9592-4eea-84d9-729a8193451b	https://directus.bmulti.store/assets/486dc2b3-ab15-4e59-8631-1df4389a0efb
625	2025-07-10 20:12:33.782227+00	1181536103	94.25.181.220	t	t	done	200 рублей	WB	79991680046	https://directus.bmulti.store/assets/8a180032-e6a7-49c0-91fb-89139ca33c48	https://directus.bmulti.store/assets/36530405-a040-425b-9deb-d34756730094
624	2025-07-10 18:29:11.111328+00	6519373935	212.47.227.67	t	t	done	200 рублей	WB	79092467471	https://directus.bmulti.store/assets/7d118858-9bcb-4fb3-82df-d75205c23927	https://directus.bmulti.store/assets/28fd3f53-984c-4362-b9d2-befdd64dd0c9
622	2025-07-10 17:36:04.896332+00	5154371577	217.77.54.124	f	t	check	200 рублей	OZON	79114124277	https://directus.bmulti.store/assets/64e22717-22a5-4e09-82dd-b16ba8ad726a	https://directus.bmulti.store/assets/db337e9b-253a-4569-9308-7043d2e99194
623	2025-07-10 17:36:13.583511+00	6130458196	104.28.198.248	t	t	done	200 рублей	WB	79268327182	https://directus.bmulti.store/assets/93d1f399-a9cf-40cd-81f9-633e0e88d787	https://directus.bmulti.store/assets/2149bfb7-bd6b-45c2-800f-053983e21022
630	2025-07-11 14:40:39.213762+00	2118044162	213.87.162.228	t	f	check	200 рублей	YANDEX	79106153407	https://directus.bmulti.store/assets/9b9a4f24-74c3-477a-9986-dd292e24f8f5	https://directus.bmulti.store/assets/36801bd4-836f-42e3-84e9-10b1c6c9e1e4
995	2025-08-03 18:10:57.6005+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
999	2025-08-03 19:11:41.801106+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
635	2025-07-11 16:35:19.15738+00	1088851788	188.168.253.3	t	t	check	200 рублей	WB	79062878745	https://directus.bmulti.store/assets/9e05a592-aaa2-4ed2-94bc-3d42fb83a889	https://directus.bmulti.store/assets/381d1077-481b-4040-9e6f-bc3d528638fb
636	2025-07-11 16:46:36.811043+00	1634328196	176.59.160.34	t	t	check	200 рублей	OZON	79176651231	https://directus.bmulti.store/assets/0a39045b-db4c-4f18-a6dd-d618311486a9	https://directus.bmulti.store/assets/47405140-e806-4d80-85a4-37221ca8acc4
647	2025-07-12 19:11:45.00495+00	709249113	95.55.105.98	f	f	check	200 рублей	OZON	79817633419	https://directus.bmulti.store/assets/c7870528-7a16-4f72-a200-dedc9dfdc55b	https://directus.bmulti.store/assets/5448664d-0503-4e05-9d6e-a261943749bc
640	2025-07-12 07:07:58.432624+00	1681467202	91.149.117.202	t	t	check	200 рублей	OZON	2	https://directus.bmulti.store/assets/1d552522-3a6a-41c0-87e2-4b514a587153	https://directus.bmulti.store/assets/306f4aad-d21c-4091-982e-eaa26f6ed27f
643	2025-07-12 13:32:01.775864+00	1883327548	31.163.95.131	f	t	check	200 рублей	WB	79123987052	https://directus.bmulti.store/assets/5c4db5d8-655e-4b82-8214-63f931a850f6	https://directus.bmulti.store/assets/4cac6872-d019-4269-b228-6591542be7fd
641	2025-07-12 08:33:08.384933+00	140612666	104.28.198.243	t	f	check	200 рублей	OZON	79524293208	https://directus.bmulti.store/assets/a6107725-42ac-47cc-b40b-b291674e29f2	https://directus.bmulti.store/assets/d6a91ca4-1a59-4975-a8ba-5ec3608b254b
642	2025-07-12 13:26:31.303472+00	1862534439	31.163.95.131	t	t	check	200 рублей	WB	79829844041	https://directus.bmulti.store/assets/e1ac21b3-336d-4026-8b20-aff196530085	https://directus.bmulti.store/assets/24e32b5d-f9ae-41ae-91da-2cc916ee0d83
646	2025-07-12 17:36:10.436504+00	7618295854	107.151.216.200	f	f	check	200 рублей	WB	279001325637	https://directus.bmulti.store/assets/a9edb3a6-440b-4d8e-9d8d-14239550cdc5	https://directus.bmulti.store/assets/f03624c8-b9d0-4720-b572-24804384c530
645	2025-07-12 17:32:00.196348+00	5335602923	107.151.216.200	t	f	check	200 рублей	WB	279001325637	https://directus.bmulti.store/assets/9bacc60f-bbf6-48b1-ba5b-4e43e1dfe029	https://directus.bmulti.store/assets/59f79f56-dbb4-4da4-a6b1-b65b4afdc3c1
631	2025-07-11 14:56:13.292648+00	701663562	31.42.177.155	t	t	done	200 рублей	OZON	79034049638	https://directus.bmulti.store/assets/34218cf5-de9d-4ffc-a9b9-1c40805ed6ae	https://directus.bmulti.store/assets/08d1067a-19db-43dc-9a6c-e0d5c16e5702
637	2025-07-11 17:59:00.853629+00	1072014547	178.34.160.31	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/08611e82-440f-40d0-b7ae-5ebfd2cf906c	https://directus.bmulti.store/assets/17f86bac-0aba-4f39-99ce-64ac123501fa
639	2025-07-12 06:46:48.293124+00	887933911	91.132.23.51	t	t	done	200 рублей	OZON	79832651134	https://directus.bmulti.store/assets/34147ef1-46b1-436e-b85e-8a8697c5e6ff	https://directus.bmulti.store/assets/aec7bc37-a1f8-4425-9f2e-1bdea15a0022
638	2025-07-12 05:07:31.798189+00	5163110644	94.233.248.94	t	t	done	200 рублей	WB	79064590695	https://directus.bmulti.store/assets/3fb555fb-ac03-4a01-9d51-88b195691fb0	https://directus.bmulti.store/assets/f6fe5005-d0b8-4894-9b48-b81957181122
633	2025-07-11 15:36:10.648337+00	5987236895	85.249.168.124	t	t	done	200 рублей	OZON	79612360001	https://directus.bmulti.store/assets/49b95f81-9ead-4f0e-a8b2-25cd3aabc3e0	https://directus.bmulti.store/assets/e344fcc5-e2bc-47bb-a2d0-bcc1013d2545
650	2025-07-13 07:07:50.829916+00	7745451179	46.32.86.79	t	t	in_work	500 рублей	OZON	\N	https://directus.bmulti.store/assets/68e85409-c31c-404e-85fc-3d58830b06ee	https://directus.bmulti.store/assets/6ef9fff6-9152-45fa-b841-ab82601f1ab1
649	2025-07-13 06:06:51.73119+00	915096613	188.162.228.239	t	t	check	200 рублей	WB	79990862700	https://directus.bmulti.store/assets/ebd29cda-9921-4e8c-8fd5-da3ff511f895	https://directus.bmulti.store/assets/fd992dab-0e0d-4bb4-8a2e-53096067bfa4
651	2025-07-13 07:56:34.532619+00	297317018	151.242.111.132	t	t	check	200 рублей	WB	79122978934	https://directus.bmulti.store/assets/91a279b1-0bf8-4bc4-b470-c58d056357c3	https://directus.bmulti.store/assets/9602f166-bf06-4845-8015-60cd2f4238ad
652	2025-07-13 09:35:16.582995+00	5510284446	94.19.175.136	t	t	check	200 рублей	OZON	79111055052	https://directus.bmulti.store/assets/77646ad7-3ea1-4af3-9c29-40bc9ace0a2b	https://directus.bmulti.store/assets/669989a1-78e5-48f0-bfef-b0beceed50ec
644	2025-07-12 16:48:05.090256+00	5100428771	81.222.191.114	t	t	done	1500 рублей	OZON	79083420562	https://directus.bmulti.store/assets/c0988091-00e4-40c8-9054-36a116f02203	https://directus.bmulti.store/assets/666fefbc-a9a4-46a1-8b3f-1f72b24c8c60
653	2025-07-13 10:25:01.052423+00	537489715	83.220.237.109	t	t	done	200 рублей	OZON	79874372253	https://directus.bmulti.store/assets/7fc8eee3-7135-4b9d-afdd-429641ec8ca6	https://directus.bmulti.store/assets/556008ef-8ff3-4bd9-9444-4c9efe46126b
648	2025-07-13 05:42:39.626568+00	5163110644	94.233.248.94	t	t	done	200 рублей	WB	79064593620	https://directus.bmulti.store/assets/283a6685-80ce-487b-8516-9f5f184047f6	https://directus.bmulti.store/assets/544b62d3-88ec-40cf-887b-f9d1952016c6
634	2025-07-11 15:58:03.862686+00	1401737232	91.205.236.173	t	f	done	200 рублей	WB	79227279741	https://directus.bmulti.store/assets/285d7686-afb2-4081-8213-a33462e8c143	https://directus.bmulti.store/assets/074fe71b-918f-4c63-aeab-2adb72b68cd3
654	2025-07-13 10:46:23.175333+00	1035243005	212.47.234.217	t	t	done	200 рублей	WB	79184579507	https://directus.bmulti.store/assets/f7e6400d-0b12-4046-8f7c-8d3122609e13	https://directus.bmulti.store/assets/d9bfe693-832a-4bad-af89-dc0589e65569
1420	2025-08-31 13:39:34.332309+00	8131677591	188.162.162.176	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/ddfbdb1d-a9ae-434f-83e9-c7c295bc5e91	https://directus.bmulti.store/assets/2105f867-148d-44b8-813f-f112170f820e
669	2025-07-14 19:09:36.435298+00	5606117639	37.60.211.124	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/9e6a9fad-9da9-4812-b557-f0e5b8199f17	https://directus.bmulti.store/assets/27393d3b-03d1-491d-9bfd-92ba384ff204
658	2025-07-13 15:38:24.324345+00	1062821730	83.220.238.20	t	t	check	200 рублей	OZON	79035358789	https://directus.bmulti.store/assets/7f03a5a0-2a3e-4811-a58f-31c2f439dc59	https://directus.bmulti.store/assets/09c88fed-a2bf-4153-a8cd-c9f1f8a91885
663	2025-07-14 07:28:56.377263+00	1061869146	178.35.60.227	t	t	check	200 рублей	OZON	79289335710	https://directus.bmulti.store/assets/506e5d24-fac1-4ef5-88e3-2a3645cea9d2	https://directus.bmulti.store/assets/606531d2-75cf-4972-b047-324754301ff4
659	2025-07-13 15:55:55.045367+00	5976128282	185.193.159.5	t	t	check	200 рублей	WB	79374070975	https://directus.bmulti.store/assets/de7694cf-2a03-4cdf-a55a-638f3c2e6b3e	https://directus.bmulti.store/assets/54a6703c-c698-4a62-a05b-6389cbd55d1b
661	2025-07-13 20:13:18.114285+00	1893336302	185.140.163.124	t	f	check	200 рублей	WB	79622350525	https://directus.bmulti.store/assets/d967ae84-b82e-40d6-bb38-296ea40257d5	https://directus.bmulti.store/assets/3c8104ef-f78f-4776-b74a-ffb71bef3562
655	2025-07-13 11:52:59.046432+00	7485270300	80.249.207.50	t	t	done	200 рублей	OZON	79124643959	https://directus.bmulti.store/assets/205797c0-a47d-42f1-be5b-416f60b9be8e	https://directus.bmulti.store/assets/3855512b-ecd4-465a-9942-167a77e18d42
665	2025-07-14 10:59:40.690787+00	688603166	185.92.139.14	t	t	check	200 рублей	WB	79785066064	https://directus.bmulti.store/assets/c5e4eb5b-6b3e-4319-aa84-a630a01fb2fd	https://directus.bmulti.store/assets/b260a200-e536-46df-a02c-422f010b91bb
662	2025-07-13 22:12:02.656715+00	532694528	188.170.76.150	t	t	done	200 рублей	WB	79216681725	https://directus.bmulti.store/assets/bbee5ad4-bde5-4d35-8fe4-082099d1cfea	https://directus.bmulti.store/assets/012c63e0-2cb0-4ad9-b3cc-d5dc12f8ab70
666	2025-07-14 11:23:36.988552+00	5117689440	31.6.118.70	t	t	check	200 рублей	OZON	79494791519	https://directus.bmulti.store/assets/c6e33c76-2fc3-4341-acc5-dd81272f844f	https://directus.bmulti.store/assets/335b063d-78e6-4b71-a12d-91afb7ad3651
656	2025-07-13 12:01:45.021491+00	261996066	93.100.58.53	t	t	done	200 рублей	OZON	79811258969	https://directus.bmulti.store/assets/43e4e105-3a21-4dbe-b9fe-ad6f79caf9dd	https://directus.bmulti.store/assets/620f1cff-faca-4232-83f5-9c899f07ad12
667	2025-07-14 12:25:19.846014+00	1905190793	178.178.207.164	t	t	check	200 рублей	WB	79049923658	https://directus.bmulti.store/assets/126b8202-2292-47ab-af34-4ff2a4a3669b	https://directus.bmulti.store/assets/b8054216-93af-4172-8745-b14b9ba40150
657	2025-07-13 15:29:26.686886+00	407675275	79.173.95.227	t	f	done	200 рублей	YANDEX	79218646275	https://directus.bmulti.store/assets/e12e9d72-8cd4-42d8-ae4e-d6bbd16c8457	https://directus.bmulti.store/assets/a47b6efa-8b04-419b-8883-55e63efc4153
660	2025-07-13 19:26:55.687055+00	435551866	95.24.57.168	t	t	done	200 рублей	WB	79688130076	https://directus.bmulti.store/assets/842fa00b-eccd-435b-ba80-2f9aab52c893	https://directus.bmulti.store/assets/6adee9a8-fadc-4e43-b276-169c602f1955
664	2025-07-14 08:28:03.477109+00	6153325078	45.137.113.9	t	t	done	200 рублей	WB	79937465051	https://directus.bmulti.store/assets/be1752b2-703b-4e51-a9bc-955e039c59bc	https://directus.bmulti.store/assets/dca02fdc-90ca-47f5-969d-494c9d770af8
672	2025-07-15 05:54:29.400821+00	712251722	185.9.74.28	t	t	check	200 рублей	OZON	279016988373	https://directus.bmulti.store/assets/6b18361c-d98b-4508-b85a-a8d21ed9bf0e	https://directus.bmulti.store/assets/ab03fa66-5295-47bf-acd7-002f2c3eadba
406	2025-06-28 05:24:46.83972+00	6938717386	213.87.144.46	f	f	check	200 рублей	OZON	79181511132	https://directus.bmulti.store/assets/cac042e8-6471-4408-899e-167cdd92d568	https://directus.bmulti.store/assets/0b49f9ca-b390-4db8-bd0e-8af7c443e471
678	2025-07-15 18:30:29.247882+00	1160755548	45.92.34.94	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/25f6d4e1-09f1-4226-b06a-40df910ee0d4	https://directus.bmulti.store/assets/9eb7b316-f96f-4ce9-9182-fabedff3069f
668	2025-07-14 14:12:00.528167+00	810583036	194.190.196.101	t	t	done	200 рублей	OZON	79956077042	https://directus.bmulti.store/assets/66ff5088-f9f7-4e77-b4cd-95875fe205b4	https://directus.bmulti.store/assets/ce00c8a6-0057-4820-872f-e5ecf3630d6a
670	2025-07-14 20:15:26.286549+00	382664548	94.242.50.163	t	t	done	300 рублей	WB	79377231768	https://directus.bmulti.store/assets/acd07bcd-60d6-4f78-8238-9c5ad7e06796	https://directus.bmulti.store/assets/20e19069-53bc-4f89-916b-303096efa849
682	2025-07-16 07:32:03.391992+00	5180633367	109.254.71.46	t	t	check	200 рублей	OZON	79493467211	https://directus.bmulti.store/assets/f3c30c6d-60c6-46cf-8b23-e487fbb88503	https://directus.bmulti.store/assets/3bbbe780-e526-4481-a9b9-e96ebe958543
681	2025-07-16 05:20:38.033554+00	5527731132	195.239.56.64	t	t	done	200 рублей	OZON	79607950636	https://directus.bmulti.store/assets/48c82393-14b5-4cf7-a0a6-4634aaab0788	https://directus.bmulti.store/assets/779e835f-7155-46fd-8a51-e87787a4ae64
680	2025-07-15 23:22:08.837986+00	382664548	31.130.2.166	t	f	done	200 рублей	WB	79377231768	https://directus.bmulti.store/assets/706e77cc-bc53-4d0f-a48b-c5c179e45aec	https://directus.bmulti.store/assets/8c98ba1a-2479-43a7-bbfe-df9d91d5f4c0
677	2025-07-15 17:27:15.473591+00	7409624447	151.252.94.45	t	t	done	200 рублей	WB	79324111466	https://directus.bmulti.store/assets/42e0fb71-b15a-4a0e-a197-05895338390e	https://directus.bmulti.store/assets/ca590342-e98e-4201-b9dc-9b110761f62e
676	2025-07-15 15:31:59.455565+00	1339640870	185.15.38.141	t	t	done	200 рублей	OZON	79785688356	https://directus.bmulti.store/assets/21c891ba-1d8f-4cc9-96fc-3bf2643c311f	https://directus.bmulti.store/assets/3570c18b-9dd8-47c1-b541-94cf7abaa26c
674	2025-07-15 09:46:48.006016+00	769368436	46.8.6.105	t	t	done	200 рублей	OZON	79512429811	https://directus.bmulti.store/assets/399ac605-a76b-45d7-9afb-a9df4cd1ce86	https://directus.bmulti.store/assets/cb699b6c-2ed5-437a-8a4d-c83e90a86f1d
673	2025-07-15 07:37:31.075492+00	1887612081	81.195.128.6	t	t	done	200 рублей	WB	79960661017	https://directus.bmulti.store/assets/1041d3a1-c0d1-47e8-a576-757d4d9258a8	https://directus.bmulti.store/assets/aecd00cc-38d8-4521-ad4a-e1e1ae88a03a
671	2025-07-15 05:04:25.354986+00	7301938762	62.106.76.42	t	t	done	200 рублей	WB	79785551406	https://directus.bmulti.store/assets/8e882cbb-ffbb-4ade-aaf8-69bf7ace3ea5	https://directus.bmulti.store/assets/b5b17d01-a154-4481-8809-bd41ed62cfa9
675	2025-07-15 12:49:54.744442+00	990441387	178.185.241.186	t	t	done	200 рублей	OZON	79271500096	https://directus.bmulti.store/assets/8a1fc80b-e22d-4bfc-b0a5-7cf034210da6	https://directus.bmulti.store/assets/48620b10-8ab1-4496-8329-b5493d278e0d
679	2025-07-15 19:53:31.154731+00	878212552	109.254.14.40	t	t	done	200 рублей	OZON	79493187700	https://directus.bmulti.store/assets/0a994a76-3b13-40b0-ac60-be4a90912e12	https://directus.bmulti.store/assets/09913529-df27-455e-aaaa-a171a3c451a0
683	2025-07-16 08:41:28.585094+00	1822134367	185.18.52.19	t	t	check	200 рублей	OZON	79581151555	https://directus.bmulti.store/assets/165ff2f3-53bd-4651-8329-adf25695b315	https://directus.bmulti.store/assets/318ab90a-c83e-4062-8772-4c7162e54857
708	2025-07-17 18:37:07.462312+00	738292332	178.178.244.188	t	t	done	200 рублей	OZON	79522294387	https://directus.bmulti.store/assets/2a92a605-f49d-45a4-80ec-8d515aec856a	https://directus.bmulti.store/assets/1547499a-c566-41e2-b64f-b224e73554a6
707	2025-07-17 17:55:14.323667+00	716953609	94.25.185.177	t	t	done	200 рублей	OZON	79520701609	https://directus.bmulti.store/assets/40a21d96-14ab-47f7-89f5-67353ccc2eee	https://directus.bmulti.store/assets/2dad0bf5-eacc-4998-ab75-badfe67669f9
703	2025-07-17 16:28:39.859492+00	257987274	85.173.28.227	t	t	done	200 рублей	OZON	79183405230	https://directus.bmulti.store/assets/5723686c-2a01-4c1a-b2b7-2e37278cbed5	https://directus.bmulti.store/assets/cabe400c-4848-4498-8ce4-d96665fb2915
696	2025-07-17 14:49:46.84093+00	1778283025	178.178.244.153	t	t	done	200 рублей	OZON	79211855917	https://directus.bmulti.store/assets/20457634-1367-41fc-b808-3d37bd84c540	https://directus.bmulti.store/assets/843049ed-d553-4f2a-a522-6d43f34f8cdc
686	2025-07-16 16:00:58.488258+00	2004590535	188.191.21.222	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/6ed7ae95-8271-4185-9851-4927e3995d7b	https://directus.bmulti.store/assets/901055ca-cb05-4b1a-88a6-97d707b22857
695	2025-07-17 10:53:04.259065+00	543962868	87.253.205.132	t	t	done	200 рублей	OZON	79818374616	https://directus.bmulti.store/assets/b7fe70fd-da7c-4032-b41b-84f823144181	https://directus.bmulti.store/assets/34561b82-466d-405f-8d1c-926264465562
694	2025-07-17 09:41:40.968331+00	827239761	95.46.158.251	t	t	done	200 рублей	WB	79803123830	https://directus.bmulti.store/assets/2a8e35d6-297c-4ac3-a410-5b0a6dc314bd	https://directus.bmulti.store/assets/2ce8eb4b-886d-4fb2-8ab7-95f5f4b0976a
691	2025-07-17 06:18:27.749623+00	5637844577	94.245.150.5	t	t	check	200 рублей	WB	79248768572	https://directus.bmulti.store/assets/1427b120-2b66-45b7-881a-3ed9164a5e50	https://directus.bmulti.store/assets/4311ef54-049c-4fe5-86df-c7445088eca1
687	2025-07-16 17:05:05.50898+00	5485142132	128.0.81.204	t	t	check	200 рублей	OZON	79493952421	https://directus.bmulti.store/assets/3c5433e1-3d8c-4960-9b6b-f0669e585eb0	https://directus.bmulti.store/assets/7a83d571-aa98-4e08-804a-95a9089f2e1a
710	2025-07-17 22:20:45.996987+00	399663698	212.192.31.39	t	t	done	200 рублей	OZON	79601163322	https://directus.bmulti.store/assets/bcdd6a7b-5210-411a-a4e0-60ebbb9efd0c	https://directus.bmulti.store/assets/ea808477-c468-4923-866b-1c9f2bc5b019
709	2025-07-17 20:31:32.727263+00	1256589213	188.170.75.200	t	t	done	200 рублей	WB	79052194886	https://directus.bmulti.store/assets/2934a0d3-5df6-462d-ac71-423bf8911542	https://directus.bmulti.store/assets/3b06c831-3da3-48a1-b2de-254cf3183e2a
692	2025-07-17 07:27:59.265262+00	660271188	37.212.48.25	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/670ac419-1f46-4086-965f-2f2cca9f3f29	https://directus.bmulti.store/assets/ef759304-2e1c-441b-83df-563a7df79ddd
697	2025-07-17 14:51:17.93363+00	1073405049	37.1.134.174	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/bc4de23b-ca30-4c5f-b877-73635f2f1bea	https://directus.bmulti.store/assets/527f9c37-5df6-4d56-8f32-d279c1f93a94
700	2025-07-17 15:35:37.367991+00	707580739	46.138.82.71	t	t	check	200 рублей	WB	79851823990	https://directus.bmulti.store/assets/a71e57e1-ea82-4b71-b9eb-6f0820b1031d	https://directus.bmulti.store/assets/37150662-5385-42fe-b93c-eb45b35f5009
698	2025-07-17 15:06:45.775672+00	720387740	185.183.131.133	t	t	check	200 рублей	WB	79788506182	https://directus.bmulti.store/assets/daaf5516-878d-4551-a80b-88cd7b146e7d	https://directus.bmulti.store/assets/0bdc067b-d50e-4e90-b862-8a1249f75725
706	2025-07-17 17:29:41.419964+00	509664578	46.216.172.59	t	t	check	300 рублей	OZON	375298196216	https://directus.bmulti.store/assets/79058293-454a-45ba-9e45-79c2c89baf56	https://directus.bmulti.store/assets/c1a9a8df-1a4e-46cc-925c-426c8f9e82e9
701	2025-07-17 16:18:54.565815+00	906453807	85.174.197.5	t	t	check	200 рублей	OZON	79528188175	https://directus.bmulti.store/assets/08ec8390-aeed-4332-a7fd-32d196c9f9d3	https://directus.bmulti.store/assets/095eebfc-78c6-40a7-823e-76b4ae2744b6
702	2025-07-17 16:20:29.461761+00	5287460856	95.82.243.155	t	t	check	200 рублей	OZON	79321229777	https://directus.bmulti.store/assets/e15e8e0e-4a95-4c51-b0d5-7f58a5aa0bcc	https://directus.bmulti.store/assets/36413417-2b73-4225-9999-5a02348aafe2
705	2025-07-17 17:02:17.878953+00	7634549673	31.40.216.238	t	t	check	200 рублей	WB	79995437100	https://directus.bmulti.store/assets/cfe7cb12-f124-4fa6-99da-834fb5a24386	https://directus.bmulti.store/assets/7de972df-416b-49ec-9374-5028fcdf67b3
704	2025-07-17 16:44:34.091062+00	6583677896	78.81.187.4	t	t	check	200 рублей	WB	895229074372	https://directus.bmulti.store/assets/f718477f-48da-4de7-a437-86c76fac13d5	https://directus.bmulti.store/assets/d9f5d0fb-4b6d-47e6-afc1-e7a70543eafc
693	2025-07-17 07:38:47.26101+00	7749585114	188.170.86.201	t	t	done	200 рублей	WB	79203652280	https://directus.bmulti.store/assets/7a5ec597-dd96-4939-aad1-93f6b659b5eb	https://directus.bmulti.store/assets/fcd101b2-0cfd-4326-a6da-1653bf1f5633
689	2025-07-16 19:53:13.58101+00	1689910087	88.201.168.187	t	t	done	1500 рублей	OZON	279620744823	https://directus.bmulti.store/assets/78fca399-17f0-4c20-afd5-1fbbf90dbdce	https://directus.bmulti.store/assets/e164eb21-7ddd-446a-a1d3-8ac2c55cd63c
690	2025-07-16 22:22:45.150854+00	269323682	176.15.242.18	t	t	done	200 рублей	WB	79140889500	https://directus.bmulti.store/assets/fafe3cb9-48cd-46e3-bd7d-13945eed80a8	https://directus.bmulti.store/assets/b66ae2c5-8aa0-4e20-a626-a3a25694b11f
688	2025-07-16 19:40:23.480455+00	1226809564	128.0.82.37	t	t	done	200 рублей	OZON	79490027410	https://directus.bmulti.store/assets/76b10096-6606-4a7c-bca0-265060819c56	https://directus.bmulti.store/assets/86e936f3-fcec-472e-8894-d15687c0767a
684	2025-07-16 09:31:27.114769+00	1085194357	5.18.179.58	t	t	done	200 рублей	OZON	79219705045	https://directus.bmulti.store/assets/616399d2-63c8-4630-bee6-38025838808f	https://directus.bmulti.store/assets/e08d4cd1-b2e3-4905-bd7c-1e77f13fd37b
685	2025-07-16 12:52:14.864366+00	532369965	178.66.128.192	t	t	done	200 рублей	OZON	79516625567	https://directus.bmulti.store/assets/e4c6a93a-c214-43e0-9501-b9d16f46da33	https://directus.bmulti.store/assets/48e7f6a7-ff14-4b7d-bbb9-c0dca3febf3b
711	2025-07-18 04:34:45.175822+00	929435425	31.131.193.182	t	f	check	200 рублей	OZON	79299884969	https://directus.bmulti.store/assets/134543cc-3843-4eca-8cdc-a5595d65dd46	https://directus.bmulti.store/assets/f9339cc0-096f-4ab5-8361-ca4e7b64c23a
699	2025-07-17 15:22:58.353835+00	5188034570	176.113.247.219	t	t	done	200 рублей	OZON	79595882328	https://directus.bmulti.store/assets/3289ce9a-36d1-4f78-a596-71dbacde2d19	https://directus.bmulti.store/assets/03444ae6-a247-4d09-98a2-6ca205c29c40
712	2025-07-18 05:28:10.174176+00	929832394	176.59.122.93	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/a20d68cd-efef-45df-bfb3-fdcd6ab7b00b	https://directus.bmulti.store/assets/1ba3a525-ded9-407d-8b8a-b0318db257c2
722	2025-07-18 16:55:27.616565+00	1023790213	37.79.134.50	t	t	check	200 рублей	OZON	279523373078	https://directus.bmulti.store/assets/0e65b82d-c761-4c1c-926f-c2fecf4b28a5	https://directus.bmulti.store/assets/034bfc72-3108-4b8b-afd8-ec9372152521
826	2025-07-24 20:01:11.632366+00	8085336111	46.173.181.83	t	t	check	200 рублей	WB	79011022402	https://directus.bmulti.store/assets/f178e7f0-8fce-435c-aeee-eefff0025a9c	https://directus.bmulti.store/assets/c2213aaa-8fa4-4592-b930-2f1049d457de
724	2025-07-18 17:29:49.227218+00	1161284558	46.32.67.177	t	t	check	200 рублей	WB	79215533910	https://directus.bmulti.store/assets/24a2fe99-92f1-4b6a-9ef3-3df5808b7edd	https://directus.bmulti.store/assets/03812a3d-4bb5-4fd7-9c01-41556c145046
714	2025-07-18 10:39:50.473339+00	6929144771	95.26.208.181	t	t	check	200 рублей	OZON	79241017397	https://directus.bmulti.store/assets/8585add2-88b5-455e-8213-0d6878b0b5ea	https://directus.bmulti.store/assets/fa1e2890-ceae-49c4-8eab-08cf2b144303
713	2025-07-18 06:53:20.799547+00	999737408	94.41.190.100	t	t	done	200 рублей	WB	79619213530	https://directus.bmulti.store/assets/7d63b78f-b471-46fd-b858-a9fbe41d3177	https://directus.bmulti.store/assets/c021c322-30c5-4989-8e9a-e897bac06d7e
715	2025-07-18 11:12:10.972684+00	1669180948	46.53.195.186	t	t	check	200 рублей	OZON	375291437359	https://directus.bmulti.store/assets/0736e3f2-3ff4-40d9-b376-b1c098e0cdc9	https://directus.bmulti.store/assets/67e6eb1f-74c7-4198-964f-c785d9dea093
725	2025-07-18 18:21:17.517877+00	1176186304	136.144.189.179	t	t	check	200 рублей	WB	79772418402	https://directus.bmulti.store/assets/6a02e336-3835-43e9-aab8-cd804ab8f754	https://directus.bmulti.store/assets/e07d5d9e-8b80-4a74-9104-03193ce7e499
716	2025-07-18 11:27:26.973716+00	5182202066	95.47.155.190	t	t	check	200 рублей	OZON	79831932807	https://directus.bmulti.store/assets/64c8c92d-7767-490c-8a76-d7d7d31b10a8	https://directus.bmulti.store/assets/8515039d-2884-4efd-a377-91c9f51827a7
727	2025-07-19 09:01:27.551581+00	302914333	89.232.79.155	t	t	check	200 рублей	OZON	79270338069	https://directus.bmulti.store/assets/f56c612e-8af8-4ad9-aa7c-e40710c7c6b4	https://directus.bmulti.store/assets/5e0fdb42-3506-4516-8112-f23bf7234dc9
733	2025-07-19 14:36:45.384993+00	1370989524	188.253.23.216	t	t	check	200 рублей	OZON	79834335755	https://directus.bmulti.store/assets/127927b3-4105-4f02-84d1-d119c4c857c7	https://directus.bmulti.store/assets/45c8246c-9b63-49c0-98e3-fc3d6e258519
731	2025-07-19 14:16:44.832263+00	1245724928	176.60.168.183	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/090288d2-7494-4076-8079-6a8a44cebf7e	https://directus.bmulti.store/assets/f102cac5-6fb5-4954-a3f4-8d0b1dd2e080
732	2025-07-19 14:24:45.106632+00	734815678	95.26.177.177	t	t	check	200 рублей	WB	79021933491	https://directus.bmulti.store/assets/39634b4b-e0b8-43c0-bd26-663095df2180	https://directus.bmulti.store/assets/277da00a-f724-4183-bbf2-510cfce3e3a1
738	2025-07-19 16:40:20.316412+00	831732715	176.214.40.34	t	t	check	200 рублей	OZON	91580495362	https://directus.bmulti.store/assets/956cda36-a62d-46a6-bb38-28f199e5f66f	https://directus.bmulti.store/assets/ebd404bf-8dc8-49a6-bc7b-20f3e8f3dd20
720	2025-07-18 15:34:41.840819+00	815827982	79.139.141.55	t	t	done	300 рублей	WB	79991374832	https://directus.bmulti.store/assets/0d6ba045-f453-4d0b-bc7f-a9c81c5b8d5e	https://directus.bmulti.store/assets/d3dd66e2-3c55-40c3-8203-859e46f4051e
729	2025-07-19 09:19:09.137148+00	5453704189	178.66.156.200	t	t	done	200 рублей	OZON	79062746678	https://directus.bmulti.store/assets/70b01ad5-e862-4cf0-a38e-8da52ba4e5c3	https://directus.bmulti.store/assets/0947679d-b23e-4973-baba-ab82b3e7534a
728	2025-07-19 09:06:42.476274+00	7058340926	93.90.97.233	t	t	done	200 рублей	OZON	79922214114	https://directus.bmulti.store/assets/85e88efd-070e-4187-af7f-431ae02a81af	https://directus.bmulti.store/assets/14450b80-0f08-479a-881d-efa01e0c9d0f
726	2025-07-19 07:33:55.891326+00	917814586	79.139.153.133	t	t	done	200 рублей	OZON	79261327030	https://directus.bmulti.store/assets/3593c0c7-384d-4ac5-9dec-3125a0027655	https://directus.bmulti.store/assets/8f3b626b-2225-4b55-8bb8-83efb317641e
718	2025-07-18 13:20:41.367677+00	1407563151	185.120.89.17	t	t	done	200 рублей	WB	79788312177	https://directus.bmulti.store/assets/7b4bb607-fc7f-4b8f-98fc-35b5bd7b25df	https://directus.bmulti.store/assets/189d021a-cf4e-4ff2-a75e-1b419c92bcdf
717	2025-07-18 12:03:11.01122+00	952539080	83.222.93.34	t	t	done	200 рублей	OZON	79194753952	https://directus.bmulti.store/assets/be532bc2-49ed-42f0-be28-968d6e4fc566	https://directus.bmulti.store/assets/4d283df7-4286-49a9-8a35-898fbadc2d35
740	2025-07-20 04:22:15.726672+00	206851964	94.25.233.204	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/168ac2ff-f2e2-4b91-b27b-301dc0b4bdd2	https://directus.bmulti.store/assets/551b5c23-82f6-40d9-adc5-d86912c7cba2
723	2025-07-18 17:22:40.892256+00	1314333995	45.159.248.171	t	t	done	200 рублей	WB	79634045702	https://directus.bmulti.store/assets/bc1c9521-a34d-45d0-b04b-20b151351f24	https://directus.bmulti.store/assets/cabdc67a-9927-4b07-ba1f-2ec4cdac1d16
737	2025-07-19 16:13:35.58209+00	424378432	178.141.243.150	t	t	done	200 рублей	WB	79991005229	https://directus.bmulti.store/assets/f3a47a2a-45aa-4f59-af40-9c0e68acfa9a	https://directus.bmulti.store/assets/92105185-93a3-4d4d-922e-2d569aa0bc0d
742	2025-07-20 08:41:53.753049+00	1743060566	46.151.151.112	t	t	done	200 рублей	OZON	79786254077	https://directus.bmulti.store/assets/35d5c2c9-7798-4256-ae07-ed83be57c51d	https://directus.bmulti.store/assets/9b8e257a-7cdb-482c-a75b-77bda62f9959
741	2025-07-20 08:14:35.324631+00	5051461569	194.87.31.226	t	t	done	200 рублей	OZON	79389930794	https://directus.bmulti.store/assets/464e949e-c5c7-4b6f-a4da-c386497ad55b	https://directus.bmulti.store/assets/c9081550-f672-441a-8d5c-795172ea4736
739	2025-07-19 18:23:41.729807+00	5853890583	94.137.2.139	t	t	done	200 рублей	OZON	79835261855	https://directus.bmulti.store/assets/9035ef4e-d5f8-4064-ade5-73287e7cccca	https://directus.bmulti.store/assets/937c84d5-32bb-42cc-8a1d-aa8c8bc984d9
736	2025-07-19 15:07:40.096558+00	7562729090	195.42.232.10	t	t	done	200 рублей	OZON	79530925849	https://directus.bmulti.store/assets/cd3e4c4b-eebe-4882-9ce4-71dd234ac1d2	https://directus.bmulti.store/assets/86e0230e-e3cc-48b4-8f44-5d60f43989ce
735	2025-07-19 15:00:34.943102+00	1710798566	45.92.34.17	t	t	done	200 рублей	OZON	79511157080	https://directus.bmulti.store/assets/6d81fadf-c043-4734-a02e-3cc7be6e6cda	https://directus.bmulti.store/assets/714616b5-1e06-4712-9126-192039fb8d70
730	2025-07-19 11:32:47.624297+00	8136065837	78.37.211.8	t	t	done	200 рублей	OZON	79817338306	https://directus.bmulti.store/assets/61d6c03c-ac5d-41ae-9845-0ae82b9b01bc	https://directus.bmulti.store/assets/b8456065-ec24-4674-81fb-6c276f3f52fb
734	2025-07-19 14:55:48.39563+00	7731992126	57.128.166.109	t	t	done	200 рублей	WB	79933286875	https://directus.bmulti.store/assets/dc0d90d0-cb20-4589-aaf5-57fb51900595	https://directus.bmulti.store/assets/7308153d-e4b3-40a9-93cd-5283b7b8aca6
823	2025-07-24 17:04:01.755068+00	5598981389	185.135.150.70	t	t	check	200 рублей	WB	79621724607	https://directus.bmulti.store/assets/3af2852b-9f77-4987-bc6b-43be274c4bc3	https://directus.bmulti.store/assets/79296389-253d-4520-9651-c8e26b68e9fd
745	2025-07-20 11:11:21.799949+00	1091541880	151.249.195.249	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/3b0ce395-c08e-46f6-997a-f34b9ceb7881	https://directus.bmulti.store/assets/d821c107-8f41-47f0-9cef-75ce3ec54a5b
751	2025-07-20 13:42:34.065454+00	870755569	176.107.246.95	t	t	check	200 рублей	OZON	79265684765	https://directus.bmulti.store/assets/79d00770-181d-4222-b9e1-7e3f75e8cc5b	https://directus.bmulti.store/assets/8aec13dd-a8e4-4e09-b950-1538b7dd85cd
754	2025-07-20 14:17:41.024506+00	5895571868	138.124.52.5	t	t	check	200 рублей	OZON	79271433100	https://directus.bmulti.store/assets/11afce79-e63e-42f8-b669-03b75385e910	https://directus.bmulti.store/assets/3e18e3d8-b06e-4a9d-9718-b425b7101cb0
755	2025-07-20 14:21:18.674197+00	888747409	151.243.116.98	t	t	check	200 рублей	WB	79882001982	https://directus.bmulti.store/assets/b89e42ec-9897-4812-9999-72f4876947e8	https://directus.bmulti.store/assets/7ee20115-776a-496a-87ec-e0044d0679aa
760	2025-07-20 16:49:44.524511+00	695203981	37.215.1.83	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/b228aa74-f5f0-4065-90cf-9a8104651e3e	https://directus.bmulti.store/assets/d3f1d833-8535-4951-8176-274a11c91073
762	2025-07-20 17:48:44.383199+00	1486677236	94.233.214.195	t	t	check	200 рублей	OZON	79180244900	https://directus.bmulti.store/assets/88af0cd3-3a7e-413c-80d9-f04cb365e480	https://directus.bmulti.store/assets/d4b036ec-642f-4d31-b601-1270233f3322
766	2025-07-21 05:52:36.778729+00	5854390877	178.207.205.69	t	t	in_work	300 рублей	WB	\N	https://directus.bmulti.store/assets/be360605-c379-4453-a23e-735ecd89e5e4	https://directus.bmulti.store/assets/ead7c869-4c03-47fe-9088-b8e1a07ace1f
769	2025-07-21 07:10:28.529821+00	898598138	145.224.94.3	t	f	check	200 рублей	OZON	79228514165	https://directus.bmulti.store/assets/96596533-5841-4844-9d89-7e5ffa978f12	https://directus.bmulti.store/assets/ee189010-87a1-4197-a4ad-539f5e99f617
770	2025-07-21 14:15:25.767356+00	1179228725	185.3.35.202	t	f	check	200 рублей	WB	79188219923	https://directus.bmulti.store/assets/87ab1b2e-8a4b-4a58-a71c-ca5a35b291fd	https://directus.bmulti.store/assets/9b5e4fc7-10a0-4fc7-a49e-a7bbc4f2fc12
771	2025-07-21 14:36:24.784851+00	648493167	57.128.179.105	t	t	done	200 рублей	WB	279526583958	https://directus.bmulti.store/assets/6a2356f6-e238-4f23-8c90-f62a23f2edd2	https://directus.bmulti.store/assets/ad4d24eb-c9cf-4947-a640-d6952bbb2456
768	2025-07-21 06:54:07.411794+00	6391926577	178.44.212.158	t	t	done	200 рублей	OZON	79225548424	https://directus.bmulti.store/assets/32c8f5d5-a471-4260-83f3-08e7722292aa	https://directus.bmulti.store/assets/b92cf77c-8f5d-4b23-98b7-b4ce0dff1ea0
767	2025-07-21 06:18:24.490255+00	629231591	94.25.225.29	t	t	done	200 рублей	WB	79992611858	https://directus.bmulti.store/assets/06cb0019-dfb4-406a-861f-ee3bf5f4d9bf	https://directus.bmulti.store/assets/a11f4767-898e-42ce-9a71-78f6fc764b8c
764	2025-07-20 20:05:35.935893+00	240647378	94.242.59.156	t	t	done	200 рублей	WB	79256323249	https://directus.bmulti.store/assets/bc391b67-525c-4b22-ac09-ec91b929cdfd	https://directus.bmulti.store/assets/e2a2adce-67cd-4882-98f6-df774b6c25aa
759	2025-07-20 15:48:30.497792+00	667757642	178.218.27.156	t	t	done	200 рублей	OZON	79043533356	https://directus.bmulti.store/assets/4a6cfa18-9180-4a51-8501-3e460b0f8645	https://directus.bmulti.store/assets/e58d50c7-2810-41fd-8eaf-b5a8850d0ab3
758	2025-07-20 15:12:11.865886+00	1249479066	94.181.144.50	t	t	done	200 рублей	WB	90031755942	https://directus.bmulti.store/assets/001b2f3f-1540-4b82-9cfa-70d1aa1763a5	https://directus.bmulti.store/assets/74335b91-ac20-4566-af53-c8b3f27b89eb
757	2025-07-20 15:02:33.250073+00	5560897975	5.165.84.246	t	t	done	200 рублей	WB	79532946376	https://directus.bmulti.store/assets/b3181d9f-370d-4865-b28e-2659b62f6f97	https://directus.bmulti.store/assets/27ec174d-d1a5-4fa6-b19e-05408bd6bcbe
756	2025-07-20 14:33:25.494807+00	787768269	5.59.147.5	t	t	done	200 рублей	WB	79889527181	https://directus.bmulti.store/assets/eac29f58-7df2-4ae7-89ca-01117a3a9c87	https://directus.bmulti.store/assets/843af220-2c2b-4d56-a5d7-1290d12a9a65
753	2025-07-20 13:50:14.178126+00	2101803535	31.162.48.220	t	t	done	200 рублей	WB	79582481380	https://directus.bmulti.store/assets/a89c3d40-875f-4ade-8e1c-16526ba93276	https://directus.bmulti.store/assets/a047e15f-2d78-4ad7-8e16-7986d3581196
748	2025-07-20 12:36:09.316857+00	1518359883	46.39.51.28	t	t	done	200 рублей	WB	79263150293	https://directus.bmulti.store/assets/9e79424a-b30b-4d51-90f3-4250864a5178	https://directus.bmulti.store/assets/134a779c-e887-461a-997f-5651116e2e65
746	2025-07-20 11:57:51.346223+00	1241835462	188.214.33.188	t	t	done	200 рублей	WB	79056747875	https://directus.bmulti.store/assets/4a30397a-cf0e-4709-ae02-f70f3b9e7c1d	https://directus.bmulti.store/assets/a2acbc03-3a5c-4c13-8dab-86592cf2058b
765	2025-07-20 21:59:57.73662+00	6661369414	185.13.112.93	t	t	done	200 рублей	OZON	79167042401	https://directus.bmulti.store/assets/ce28ad62-ebb8-465d-a31c-360cd7eaba0e	https://directus.bmulti.store/assets/c7a0e666-a8c6-4174-8765-c47b1584a821
763	2025-07-20 19:07:24.960737+00	1589353979	95.220.72.158	t	t	done	200 рублей	OZON	79035527652	https://directus.bmulti.store/assets/4d470c60-ae38-4af2-ad39-9312727afff3	https://directus.bmulti.store/assets/7200babf-2cea-4ba2-a04b-e02af8cb93f1
752	2025-07-20 13:44:20.797162+00	1234970943	46.8.7.139	t	t	done	200 рублей	OZON	79990258721	https://directus.bmulti.store/assets/d9c7c0cb-9e96-4c97-a5fc-d3f8d3b4415e	https://directus.bmulti.store/assets/a6b995b4-937e-47a6-8a74-f818185619db
747	2025-07-20 12:32:27.831581+00	5783532627	217.79.107.215	t	t	done	200 рублей	WB	79785580509	https://directus.bmulti.store/assets/e2325fe5-1e31-4dbc-88c1-315d56762011	https://directus.bmulti.store/assets/c726dd94-47c2-480d-9f70-6a1b2c19aacd
749	2025-07-20 13:14:48.352903+00	1614476366	93.100.242.67	t	t	done	200 рублей	OZON	79834119989	https://directus.bmulti.store/assets/333667c5-70dc-4639-b887-69016bbb4283	https://directus.bmulti.store/assets/da1df2fe-c072-4824-99e3-930fa8fbd181
743	2025-07-20 09:20:29.526252+00	1958356144	157.90.4.112	t	t	done	200 рублей	OZON	79056338598	https://directus.bmulti.store/assets/d875a8e3-64fb-4d20-aacc-8505dc0076b5	https://directus.bmulti.store/assets/dce11643-2256-4749-bebf-2d3568347b2b
761	2025-07-20 17:48:13.120803+00	7661020147	109.126.189.180	t	t	done	200 рублей	WB	9112380050721994	https://directus.bmulti.store/assets/535ad28c-a904-43fc-955a-0ebe352e3a04	https://directus.bmulti.store/assets/4f5e543a-d0ab-4dfd-96ed-4554e5f840bb
750	2025-07-20 13:34:57.460765+00	1035311261	37.79.4.14	t	t	done	500 рублей	OZON	79991232645	https://directus.bmulti.store/assets/6f048edb-9e18-447e-ba7b-670d272dd1f3	https://directus.bmulti.store/assets/cc1941be-a7b4-4f98-ac44-87facffd7af4
744	2025-07-20 10:01:31.584756+00	941891245	92.38.186.131	t	t	done	200 рублей	WB	79096400249	https://directus.bmulti.store/assets/b62f9a86-9cc9-4943-8e44-340d402c94ba	https://directus.bmulti.store/assets/e50810c6-ba29-4735-8505-0c1f528e318f
780	2025-07-22 07:58:36.695857+00	1018685034	217.66.159.252	t	f	new	\N	WB	\N	https://directus.bmulti.store/assets/5cd127a9-d7fc-48d4-8dda-3cfa3a941ffb	https://directus.bmulti.store/assets/862468fd-9689-406e-9f6c-c42e65266a05
772	2025-07-21 15:11:32.017784+00	1076373619	188.72.72.34	t	t	check	200 рублей	OZON	79883104155	https://directus.bmulti.store/assets/983bed21-b119-4e09-962c-4a19e2543cbf	https://directus.bmulti.store/assets/2b3bf8cb-f2d4-4e1f-b25d-6bd3014bb83c
800	2025-07-23 16:16:22.437943+00	5170505836	176.59.201.111	t	t	done	200 рублей	WB	90887968432	https://directus.bmulti.store/assets/d292c2c0-8cac-4b9e-adb3-31f2349afb04	https://directus.bmulti.store/assets/739fe151-3649-43ca-ae88-eae73c1a3ce4
799	2025-07-23 13:19:03.743107+00	468056625	188.162.236.98	t	t	done	200 рублей	OZON	79963867796	https://directus.bmulti.store/assets/8896d8ce-36b0-472f-98e7-2151d0d89fc6	https://directus.bmulti.store/assets/c01c020d-c069-4fa6-b229-343b015998ae
798	2025-07-23 12:27:32.314611+00	1816630926	217.144.175.140	t	t	done	200 рублей	OZON	79832985149	https://directus.bmulti.store/assets/cbafc559-c036-4bc6-9e94-83d9cef344cc	https://directus.bmulti.store/assets/ffe246b9-8baf-4d6a-94e4-20d4bd934458
796	2025-07-23 11:06:04.905451+00	536168458	212.34.135.193	t	t	done	200 рублей	OZON	79145889990	https://directus.bmulti.store/assets/dff3195e-a8f0-42f6-82b3-0d92a85db944	https://directus.bmulti.store/assets/f4c64b24-966f-4787-88d9-7738498dd1ab
781	2025-07-22 07:58:43.271619+00	1018685034	217.66.159.252	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/bc0acf20-a33e-4a73-a783-3e9750b05873	https://directus.bmulti.store/assets/0021d243-c963-4560-beee-d0cbfe94ee8a
792	2025-07-23 10:07:43.94567+00	8184368262	85.140.10.5	t	t	done	200 рублей	OZON	79224319798	https://directus.bmulti.store/assets/6aa6f288-9ccd-4047-aa00-152a80ad5d0a	https://directus.bmulti.store/assets/4ead1a84-2d0a-40ea-8e9d-d742589b3e49
791	2025-07-23 07:55:28.666498+00	5634414285	91.108.240.248	t	t	done	200 рублей	OZON	79195819911	https://directus.bmulti.store/assets/19dfab42-0174-4752-bd09-df82580cb0f7	https://directus.bmulti.store/assets/989ec682-833e-401f-bc2d-7f04408a6e1f
793	2025-07-23 10:25:09.783971+00	561161610	5.16.132.69	t	t	done	200 рублей	WB	79951783324	https://directus.bmulti.store/assets/4e721d1b-1396-4347-9d5e-290c95691b38	https://directus.bmulti.store/assets/11a40c0b-bc2f-40c3-bcbf-72623c134660
776	2025-07-21 18:56:43.8402+00	479352830	176.60.35.253	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/2b7f01fe-81f8-4314-9a7c-48d74e5fa523	https://directus.bmulti.store/assets/0d735b1f-f1c4-48b6-97fd-641032fb6a29
773	2025-07-21 16:58:52.544385+00	5000190136	176.119.169.60	t	t	done	1500 рублей	WB	79788103261	https://directus.bmulti.store/assets/47540d1f-8882-4f28-b5c4-a7ea889990b9	https://directus.bmulti.store/assets/55a94711-8e60-4767-ae24-55da937c4eea
777	2025-07-22 01:39:00.991968+00	6441024744	212.14.201.188	t	t	check	200 рублей	WB	79148600835	https://directus.bmulti.store/assets/4d1d3c38-9e76-4de4-93b4-6a04f5d65922	https://directus.bmulti.store/assets/dda15bb5-db42-4bad-a9e1-e11966bdc37e
996	2025-08-03 18:11:11.021206+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
997	2025-08-03 18:11:11.641411+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
782	2025-07-22 08:22:46.141278+00	8123360871	178.44.63.33	t	t	check	300 рублей	WB	279583903774	https://directus.bmulti.store/assets/ac87845b-d277-412e-affa-63561e9d7476	https://directus.bmulti.store/assets/71016b07-92ca-43ee-b56f-45ff861d2e8d
778	2025-07-22 02:57:16.42288+00	1249479066	94.181.144.50	t	t	check	200 рублей	WB	90031755942	https://directus.bmulti.store/assets/b8a9fc0d-0dd6-4edd-ae57-9381449504ee	https://directus.bmulti.store/assets/e7cc4973-e417-4a2e-9d8f-9c9bee58a32a
779	2025-07-22 07:56:32.655423+00	1018685034	217.66.159.252	t	f	new	\N	WB	\N	https://directus.bmulti.store/assets/8ed3957a-a287-4d6b-96dd-93c23d6d5c48	https://directus.bmulti.store/assets/cb5cea04-ee6d-4fca-93f5-b3cf1df1c7a1
783	2025-07-22 09:39:52.545199+00	568351968	91.215.90.26	t	t	check	200 рублей	WB	79039305544	https://directus.bmulti.store/assets/c38a7e7d-02fa-492a-af1c-d4f787625570	https://directus.bmulti.store/assets/5dcbe6d1-62a4-466e-8f56-d58fe2ccf641
784	2025-07-22 09:53:05.176169+00	1065022187	178.120.54.195	t	t	check	200 рублей	WB	375291128261	https://directus.bmulti.store/assets/3ab3fb37-41ee-47d6-a646-bbb718e5c544	https://directus.bmulti.store/assets/3c88d70d-b07f-4fec-bae0-4ee230880975
775	2025-07-21 18:27:07.082661+00	733064519	109.236.105.109	t	t	done	200 рублей	OZON	79990666585	https://directus.bmulti.store/assets/393381c7-3941-453f-91a9-3a513f2505a2	https://directus.bmulti.store/assets/486471b7-a061-4a04-8529-40f3f8e86f89
774	2025-07-21 17:14:47.089566+00	5578075124	217.30.10.75	t	t	done	200 рублей	OZON	279777477213	https://directus.bmulti.store/assets/8cab878c-c2b7-4957-9f7d-1edb7fbf1a19	https://directus.bmulti.store/assets/d0b54d87-fd1c-4cc4-b845-0a66a42a6ecc
795	2025-07-23 10:51:13.793621+00	5272625750	85.174.196.72	t	t	check	200 рублей	OZON	79284435557	https://directus.bmulti.store/assets/0eb2c269-ad0b-4a26-a3c9-51542bba3465	https://directus.bmulti.store/assets/9cbcdda0-c8c2-437f-9587-2972e97efd50
794	2025-07-23 10:41:14.736742+00	5877559907	188.18.252.101	t	t	check	200 рублей	WB	79088996245	https://directus.bmulti.store/assets/b3d65844-13ea-44a8-bddf-a4d154e6fe06	https://directus.bmulti.store/assets/091cbc47-4e71-4661-8364-ec37971d17c7
797	2025-07-23 11:17:07.226585+00	8027455206	178.176.83.35	t	t	check	200 рублей	OZON	79379944471	https://directus.bmulti.store/assets/5d336a4e-862c-4582-bc07-173e8f3496a2	https://directus.bmulti.store/assets/51944c92-2c79-4de3-ad2a-9fd8ba11974e
790	2025-07-23 07:53:45.986774+00	1769043337	143.20.221.7	t	t	done	200 рублей	OZON	79689717707	https://directus.bmulti.store/assets/7b99d2ef-0692-49db-9820-687a92dcfef0	https://directus.bmulti.store/assets/756d53b1-03d3-4ef6-883d-f895e919b376
788	2025-07-22 20:18:42.799909+00	6648404193	94.140.151.140	t	t	done	200 рублей	OZON	79090263447	https://directus.bmulti.store/assets/fa597132-0eea-4b9c-94d6-47aa15721776	https://directus.bmulti.store/assets/f2bdc0ee-7d4c-4014-82d1-64a5a19bdf08
786	2025-07-22 14:41:20.917501+00	1654306284	85.113.213.231	t	t	done	200 рублей	WB	79502405193	https://directus.bmulti.store/assets/805ef01f-7556-4dbc-a35c-e12732001614	https://directus.bmulti.store/assets/a9b5c882-7842-4045-a008-83b15c2e530d
787	2025-07-22 16:10:38.641208+00	1079202623	194.49.53.151	t	t	done	200 рублей	OZON	91569931512	https://directus.bmulti.store/assets/ac5b7dea-a2c3-41f8-8873-0c436b68717a	https://directus.bmulti.store/assets/81b989e3-faf5-4d34-8178-061a8f9441ab
785	2025-07-22 11:33:08.315093+00	1138921258	178.178.87.132	t	t	done	200 рублей	WB	79156260610	https://directus.bmulti.store/assets/2836c2b6-bc9f-4850-9ba4-641ff495e98a	https://directus.bmulti.store/assets/e5595584-3337-4bf6-8d24-bbff498b4bbf
789	2025-07-23 04:17:24.91881+00	1263042667	188.168.213.216	t	t	done	200 рублей	OZON	79901006868	https://directus.bmulti.store/assets/c7998fc9-44b6-49c3-b0aa-ae9675207b4f	https://directus.bmulti.store/assets/442c9546-b848-444e-a296-f512c5f8e3fd
801	2025-07-23 17:50:26.114808+00	7661020147	178.120.57.189	f	f	check	200 рублей	WB	79610136602	https://directus.bmulti.store/assets/b5e6879d-141c-4055-b120-0fcb6855a481	https://directus.bmulti.store/assets/c3f22185-950c-4e2c-a777-54b10cb402aa
827	2025-07-24 22:27:31.359337+00	5760200670	83.222.1.216	t	t	check	200 рублей	OZON	79780385040	https://directus.bmulti.store/assets/9d98b1f1-55df-4bbb-a707-23726614e820	https://directus.bmulti.store/assets/4f6b90a5-22dc-4226-a287-642dc2682d2b
824	2025-07-24 17:35:33.260221+00	444429979	109.62.222.253	t	t	check	300 рублей	OZON	79913150981	https://directus.bmulti.store/assets/659562d5-e31a-450b-92bb-623823884034	https://directus.bmulti.store/assets/9fdab5fa-88d2-4b4d-b91a-7aaa4dc1f858
812	2025-07-24 07:56:52.741096+00	1785702275	91.193.177.41	t	t	done	200 рублей	WB	79056878090	https://directus.bmulti.store/assets/55352184-440d-48a3-9295-e5c13aa02724	https://directus.bmulti.store/assets/997d8c60-5ef9-4f40-bdaf-73f7feb88f30
811	2025-07-24 07:56:46.147376+00	782624413	176.15.171.164	t	t	done	200 рублей	WB	79611032150	https://directus.bmulti.store/assets/1b586c40-d191-41d1-92d8-60c656a73e08	https://directus.bmulti.store/assets/0a1c352e-d673-46ca-b53f-a3b4377911ed
807	2025-07-24 04:23:11.342171+00	5953511027	5.34.210.175	t	t	done	200 рублей	WB	79339336120	https://directus.bmulti.store/assets/2848c894-4bfa-4372-bb20-e7e5f7365514	https://directus.bmulti.store/assets/f25fbd52-946a-45bf-845f-acb674b5fd44
803	2025-07-23 19:08:31.849003+00	262268269	77.79.158.167	t	t	done	200 рублей	OZON	79872897852	https://directus.bmulti.store/assets/c5d3b1d4-14e6-411b-a2e0-d366810aa443	https://directus.bmulti.store/assets/7cbc0c9a-105e-40ab-a7a3-8e8822cc3b63
1094	2025-08-08 18:18:35.320072+00	339542982	188.243.136.27	t	t	check	200 рублей	OZON	79963414038	https://directus.bmulti.store/assets/43b1e8a7-6816-4520-a851-ce181d20fca2	https://directus.bmulti.store/assets/2381cd23-4b50-4eb7-9536-9c695e727484
809	2025-07-24 05:31:40.887774+00	1377042440	31.43.223.163	t	t	check	2000 рублей	OZON	79132681321	https://directus.bmulti.store/assets/ed9a1c26-a253-40d1-a910-5b53e611a1a1	https://directus.bmulti.store/assets/5016c36e-cf34-4309-b842-5484415165ae
804	2025-07-23 20:49:40.166333+00	6893633275	78.40.194.43	t	t	check	200 рублей	WB	79059999810	https://directus.bmulti.store/assets/15ab4efe-7e8b-42bf-a3b8-b773cc2c68b0	https://directus.bmulti.store/assets/cef1ac78-8889-4ece-be3c-c37d2432bc57
805	2025-07-23 20:56:52.25606+00	7605098800	109.126.158.31	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/9af09917-b3f0-4f8e-9454-b8bcc43ecaaf	https://directus.bmulti.store/assets/be62c6c2-afa6-4c70-828d-5cf0ae53890c
830	2025-07-25 06:41:44.012555+00	7636328005	176.15.171.8	t	f	check	200 рублей	WB	79051755982	https://directus.bmulti.store/assets/d098e2cc-b66f-4bd7-a640-3d0254bf56c9	https://directus.bmulti.store/assets/fd4ca072-0c06-4d42-b80c-b5c771a96c9f
806	2025-07-24 03:10:03.882385+00	1429845995	95.82.113.171	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/34e4f011-f60e-4ce8-90b7-d1937142be55	https://directus.bmulti.store/assets/f314ecc8-4b03-481c-9ba2-075a04ec4b19
814	2025-07-24 12:03:36.616+00	407844860	176.59.52.31	f	t	check	200 рублей	WB	79775038838	https://directus.bmulti.store/assets/6a10f329-b284-4ddc-b2fd-0d9a9285fff8	https://directus.bmulti.store/assets/be62bf8d-20c5-41fe-b139-d54c23a52467
810	2025-07-24 07:31:07.236205+00	5542097696	94.25.227.31	t	t	check	200 рублей	WB	79203668839	https://directus.bmulti.store/assets/2937522e-b1ac-429d-81a8-657f371ce939	https://directus.bmulti.store/assets/8346f389-2ef9-462e-8a0a-829e9b40992e
831	2025-07-25 08:34:44.354043+00	5275072259	86.102.85.82	t	t	check	200 рублей	OZON	279502999849	https://directus.bmulti.store/assets/29ccf23c-b579-4bc1-ae17-d29a3cc5a830	https://directus.bmulti.store/assets/af87c8b8-7b5d-40c8-a28e-522113c10046
832	2025-07-25 08:36:32.361954+00	1136400764	45.130.177.7	t	t	check	200 рублей	WB	79283855723	https://directus.bmulti.store/assets/f6bcadae-649a-49c9-b4a6-ca608cef1179	https://directus.bmulti.store/assets/55b52914-b6a3-4ac7-9085-d98b3b831ecf
833	2025-07-25 08:42:37.481238+00	2083244067	5.137.251.86	t	t	check	200 рублей	OZON	79994637684	https://directus.bmulti.store/assets/b8077cbe-fc3e-4712-9a26-3dceb31245fe	https://directus.bmulti.store/assets/d7b2fab5-dab2-45ff-85b5-8cff4e8b0f03
818	2025-07-24 13:20:44.838531+00	573493857	37.212.13.93	t	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/6c754779-8d22-4725-8b3c-8f1e3e1dde62	https://directus.bmulti.store/assets/ead5b6ba-54d7-4ec3-8eda-561ede01b429
813	2025-07-24 10:06:09.300467+00	1910627367	5.255.105.55	t	t	check	200 рублей	WB	79173513393	https://directus.bmulti.store/assets/ad1768cd-41bb-4932-9523-0d0e262cb1d5	https://directus.bmulti.store/assets/d960755c-c236-487d-b405-758987ed8aea
834	2025-07-25 09:51:13.218888+00	1216138803	178.65.70.141	t	t	check	200 рублей	OZON	79041037291	https://directus.bmulti.store/assets/7456531e-1791-43af-ae57-1370fa1c4fd6	https://directus.bmulti.store/assets/0a7548a1-30a0-4bdb-908d-9e8bba22f416
835	2025-07-25 09:57:11.120846+00	782624413	176.15.171.8	f	f	check	200 рублей	WB	79611032150	https://directus.bmulti.store/assets/a67b022a-7c79-453e-a0e1-b302de979c98	https://directus.bmulti.store/assets/2cf5a3f9-00c3-472d-b93e-04b594ba9ba7
816	2025-07-24 12:46:02.423924+00	100285877	188.242.8.118	t	t	done	200 рублей	OZON	79215588095	https://directus.bmulti.store/assets/29d421cb-c478-4b13-9c0e-2e3dfaf92241	https://directus.bmulti.store/assets/c7b9a37a-7e68-4d6f-a80e-8775b301285e
808	2025-07-24 05:25:56.225351+00	6260587745	185.201.88.198	t	t	done	200 рублей	WB	79922145697	https://directus.bmulti.store/assets/a3322def-b746-45ee-a46c-1118c21bf97f	https://directus.bmulti.store/assets/a5931d69-dbb2-4113-a1ee-89b1fb1cb96c
819	2025-07-24 14:11:21.824491+00	2117135020	95.83.126.165	t	t	check	300 рублей	WB	2	https://directus.bmulti.store/assets/d254af31-3376-4052-9700-30002b17ee4c	https://directus.bmulti.store/assets/344ca634-3f17-4246-954c-8392a72eb25e
836	2025-07-25 11:17:06.328378+00	1655722433	176.15.249.176	t	t	done	200 рублей	WB	79053684427	https://directus.bmulti.store/assets/a107ed83-dce0-4bc1-99e0-d2cb15514970	https://directus.bmulti.store/assets/bacd300b-d8a9-4f41-80a9-85be5ebc9501
829	2025-07-25 06:03:14.715555+00	361780543	185.157.214.219	t	t	done	200 рублей	WB	79185165079	https://directus.bmulti.store/assets/3c0f7b0f-a3bb-4738-a0a5-e676ac889527	https://directus.bmulti.store/assets/4257ef5d-8fb2-41a3-8961-940e654fde77
828	2025-07-25 01:16:53.050894+00	5953511027	178.186.68.18	t	t	done	200 рублей	WB	79339336120	https://directus.bmulti.store/assets/3ef84402-1cc5-42a9-8960-cf6907353302	https://directus.bmulti.store/assets/ecccde68-3331-4dff-a59b-72836bb16456
817	2025-07-24 12:52:48.387726+00	294062565	5.180.54.9	t	t	done	200 рублей	OZON	79500596086	https://directus.bmulti.store/assets/c7e46d20-3369-4bfc-9cdc-7fcc6f68bca4	https://directus.bmulti.store/assets/8c49e057-3103-48fa-9ca9-0d2e57b9c63f
815	2025-07-24 12:37:38.537888+00	5623059767	84.18.99.66	t	t	done	200 рублей	OZON	79874246437	https://directus.bmulti.store/assets/c9c40798-dedb-4dfe-87ce-a7a55456b0a2	https://directus.bmulti.store/assets/0a88eb09-9eb5-4506-ba80-ce9743c3d354
802	2025-07-23 19:05:16.998573+00	799583946	185.253.41.163	t	t	done	200 рублей	OZON	79493779655	https://directus.bmulti.store/assets/766af77a-17ab-4b97-b247-87f020a93d5a	https://directus.bmulti.store/assets/307ebc52-d18e-4d6a-9ac2-ca794c7ee4f6
844	2025-07-25 16:59:50.444321+00	257362421	77.106.61.150	f	t	check	200 рублей	OZON	79817100413	https://directus.bmulti.store/assets/d4de22a2-ea52-41d5-8b8b-504d50eace75	https://directus.bmulti.store/assets/aa12a95f-e465-4f70-8775-ec1d7e3c0b5c
837	2025-07-25 12:01:43.070104+00	1218002011	178.66.130.33	t	t	check	200 рублей	OZON	79531757405	https://directus.bmulti.store/assets/ebd26e4e-d307-4251-9724-ed076e9c354a	https://directus.bmulti.store/assets/ba48b04b-b70e-48c6-bcda-5d456b66e0b5
1427	2025-08-31 16:57:37.706069+00	736581275	151.249.168.99	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/73cd3735-26a6-4154-b8b4-dbd59eb81024	https://directus.bmulti.store/assets/9849ae3e-98d9-4eb7-af41-354188ad37c2
838	2025-07-25 12:03:54.675101+00	676874894	151.249.150.132	t	f	check	200 рублей	OZON	79854587492	https://directus.bmulti.store/assets/d4d525a3-6698-4f44-85dd-a1fa7cae6506	https://directus.bmulti.store/assets/6d5d728a-744d-4053-8948-c8159dbda9ef
839	2025-07-25 13:12:22.626475+00	6404251708	79.139.192.83	t	t	check	200 рублей	OZON	79057037623	https://directus.bmulti.store/assets/ac404314-23cc-41c7-b169-c568d33a2c0e	https://directus.bmulti.store/assets/eb4bd8eb-7168-4b93-8e79-9a7b31738799
842	2025-07-25 15:48:23.535199+00	1654306284	85.113.213.231	t	t	done	200 рублей	WB	79502405193	https://directus.bmulti.store/assets/6584e667-f757-4287-a1e9-7b886deb845b	https://directus.bmulti.store/assets/13869fce-9246-492e-bcd8-d70868a5704b
841	2025-07-25 14:43:05.670653+00	1512114443	176.59.55.53	t	t	done	200 рублей	OZON	79203775110	https://directus.bmulti.store/assets/376edc4b-5da2-4ba5-86d7-6143c3b8117c	https://directus.bmulti.store/assets/c1573b7b-20a2-4a38-bead-ed7b847186cc
820	2025-07-24 14:32:10.508542+00	5022028471	88.135.61.23	t	t	done	200 рублей	OZON	79203065248	https://directus.bmulti.store/assets/9297785f-ef39-4cb4-9b85-a282942dc653	https://directus.bmulti.store/assets/e4caaf66-e4fd-482c-8fdf-155f91cd2cab
846	2025-07-26 03:29:15.171144+00	1088622392	87.117.60.52	t	t	check	200 рублей	WB	79515272440	https://directus.bmulti.store/assets/2c73822c-3837-4de5-a923-6c6b41bde59b	https://directus.bmulti.store/assets/31e7a073-fb57-4e63-a520-8ed788e6a2dd
845	2025-07-25 20:17:05.086241+00	1007085028	46.53.246.190	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/08152aa8-9683-4200-bded-6f780c9ed020	https://directus.bmulti.store/assets/9f046330-f37f-43d3-bac0-76a6830c7ee0
849	2025-07-26 09:46:37.783271+00	589265208	37.215.4.248	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/88cfa773-b926-43c3-b831-cf552d7507b6	https://directus.bmulti.store/assets/07486c38-41e9-41f6-bea4-694747ac1865
853	2025-07-26 12:55:28.901989+00	2017458442	178.78.44.219	t	t	check	200 рублей	WB	79184802928	https://directus.bmulti.store/assets/1ed61ffb-dfbd-4b70-93bf-916f197daa2d	https://directus.bmulti.store/assets/7dd3a64e-93af-4693-9a3d-1aaa82936bfb
852	2025-07-26 11:47:17.469295+00	6597095163	5.166.122.54	t	t	check	200 рублей	WB	79230080989	https://directus.bmulti.store/assets/4570fb8c-03c9-4897-8598-6bac9172292a	https://directus.bmulti.store/assets/a96720e1-26de-489a-bcb8-c945431ccf9a
855	2025-07-26 14:04:20.073217+00	5570322759	176.60.240.233	t	t	check	200 рублей	WB	375295831941	https://directus.bmulti.store/assets/a173a72c-1faf-4372-8ccd-a6f51a34aad3	https://directus.bmulti.store/assets/d8e07b72-cd53-493e-9175-dd56fae56e95
854	2025-07-26 13:12:47.781467+00	1788489738	46.158.166.114	t	t	check	200 рублей	WB	79194318603	https://directus.bmulti.store/assets/104dabb6-f3e3-4b0c-af86-0fe6b9505560	https://directus.bmulti.store/assets/555f1b0d-3fc3-414c-bfac-ec0929733554
858	2025-07-26 14:34:38.679477+00	2082502116	195.250.92.251	t	t	check	300 рублей	WB	\N	https://directus.bmulti.store/assets/05ef4d3e-dbea-4952-ad94-f6b02f1c2a0d	https://directus.bmulti.store/assets/d4b24665-4364-406b-a751-6e1d59fa33b0
847	2025-07-26 09:20:39.866828+00	841890931	178.252.127.230	t	t	done	300 рублей	OZON	79818236859	https://directus.bmulti.store/assets/05ff1333-694c-4eae-a904-fbce68234096	https://directus.bmulti.store/assets/01bbb645-d10c-4727-9883-2c9d5d79835b
857	2025-07-26 14:29:57.014368+00	722088644	45.89.172.79	t	f	check	200 рублей	WB	79120671348	https://directus.bmulti.store/assets/6aa81e41-2251-461d-a487-563ce6caee32	https://directus.bmulti.store/assets/68abdf54-2992-4f01-8ea7-f38bd8568e7f
856	2025-07-26 14:05:07.597634+00	720631069	91.215.177.94	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/5056863c-0db0-4a94-9ef8-3a391a84b7b1	https://directus.bmulti.store/assets/3b42e048-dfbe-4963-a391-496d6ca6caa9
860	2025-07-26 15:35:18.57795+00	6425821149	178.64.243.254	t	t	check	200 рублей	OZON	79533790347	https://directus.bmulti.store/assets/d0828549-da55-46ca-a7de-3168f67f6555	https://directus.bmulti.store/assets/6afa4ca1-80f4-4e8a-9c10-677f5d87a60f
862	2025-07-26 17:04:55.413684+00	999361592	178.57.14.37	t	t	check	200 рублей	OZON	79012719819	https://directus.bmulti.store/assets/00741fb0-af3b-4112-9810-72f5ca99e4f7	https://directus.bmulti.store/assets/9a62de57-2c26-419b-b9da-a638b177f198
863	2025-07-26 18:23:38.534912+00	6794940293	109.120.187.32	t	f	check	200 рублей	WB	79094806556	https://directus.bmulti.store/assets/338a8c2f-abd7-487d-b4a2-ca4ebb0b6d0a	https://directus.bmulti.store/assets/5684b16b-78a2-4f67-9307-0a22a7ab1137
843	2025-07-25 15:52:56.275499+00	1008153961	104.28.197.15	t	t	done	200 рублей	OZON	79997305382	https://directus.bmulti.store/assets/9728bbaa-12cd-42d7-bbba-3f1640d10b59	https://directus.bmulti.store/assets/56e5fd81-821e-4b40-9d39-0720de50a7aa
864	2025-07-26 19:50:42.964301+00	912817905	95.54.228.157	t	t	check	200 рублей	OZON	79218625133	https://directus.bmulti.store/assets/1e04bed2-c11a-471d-a60a-90072ecc1c77	https://directus.bmulti.store/assets/3401ee60-64b2-4639-a6c2-2e320b59505d
859	2025-07-26 15:02:33.193931+00	1002147174	143.14.42.244	t	t	check	200 рублей	OZON	79174551227	https://directus.bmulti.store/assets/efc59700-86aa-44a1-85fe-a9a92d9c335a	https://directus.bmulti.store/assets/b3499aaf-73fd-4ff6-a316-5cf3faac1a74
851	2025-07-26 11:43:39.29617+00	1098273452	138.124.51.55	t	t	done	200 рублей	OZON	79897265545	https://directus.bmulti.store/assets/99a2fb6b-ac8d-47f5-8f8f-c91445303b8c	https://directus.bmulti.store/assets/3aa54d9f-6bf9-40d0-980d-1aa165383b6a
850	2025-07-26 09:49:13.935419+00	1517663965	185.109.22.115	t	t	done	200 рублей	WB	79282327969	https://directus.bmulti.store/assets/1ded3d16-ba9d-4543-bca9-6f44ad50c22e	https://directus.bmulti.store/assets/a3031bfa-2b58-4fc8-a16b-06fe1a8b6c33
848	2025-07-26 09:31:38.717478+00	1064282140	188.243.51.167	t	t	done	200 рублей	WB	79216305777	https://directus.bmulti.store/assets/b8fc7f3a-61c9-4e6f-8fb2-dd4aebf3106d	https://directus.bmulti.store/assets/135949f2-1cbc-4dfd-9241-8b40fe71bba5
861	2025-07-26 16:19:02.509338+00	892300044	176.208.57.189	t	t	done	200 рублей	WB	79287015099	https://directus.bmulti.store/assets/97681c86-4167-438d-b6ba-8ec44e2b7fce	https://directus.bmulti.store/assets/a63b27c6-baff-4f90-9159-1efb7d141dee
840	2025-07-25 14:07:04.343593+00	841729694	217.79.107.61	t	t	done	200 рублей	OZON	79591346410	https://directus.bmulti.store/assets/8a0370ef-4e8b-4d42-85a7-09c9dfabe1c6	https://directus.bmulti.store/assets/ca25875b-3a60-480d-9030-97de721298d0
822	2025-07-24 16:00:26.708113+00	501886874	37.214.18.16	t	f	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/28567dfd-7f6b-49bf-af70-618c6b72ee12	https://directus.bmulti.store/assets/4c11e314-8765-42a2-897f-6e0f9b87b48b
941	2025-08-01 12:53:54.124597+00	1004330038	176.59.140.185	t	t	check	200 рублей	WB	79992237748	https://directus.bmulti.store/assets/3817e4da-0010-4e85-96d6-38d1857c5615	https://directus.bmulti.store/assets/95f4469b-df35-494d-9d75-244399d561d8
944	2025-08-01 16:40:28.708525+00	1882785266	94.19.22.59	f	f	check	300 рублей	OZON	79112502209	https://directus.bmulti.store/assets/76576b08-9280-41b6-a3fe-4ca21febb68a	https://directus.bmulti.store/assets/3d55ba1d-05b2-4417-9540-6525ba113417
945	2025-08-01 18:05:41.047868+00	461557119	178.65.135.61	t	t	check	200 рублей	OZON	79218720762	https://directus.bmulti.store/assets/f31acf8f-867d-4547-8750-75519d8c484b	https://directus.bmulti.store/assets/bfbd6807-521f-4fa8-b637-14e6b7629b46
865	2025-07-26 20:40:12.240216+00	6146316851	176.97.110.61	t	t	check	200 рублей	WB	79214886686	https://directus.bmulti.store/assets/a06a0788-bc3d-4ffb-91b6-89cc13a004b5	https://directus.bmulti.store/assets/bcbc12a3-f2cd-4ea4-a7aa-c7b729dc1579
946	2025-08-01 18:09:46.819641+00	1828695016	178.219.168.9	t	t	check	200 рублей	WB	79283004404	https://directus.bmulti.store/assets/5f861e6b-0d63-4e8d-9148-30ebd400b0ee	https://directus.bmulti.store/assets/59841b61-6961-4937-8076-12125f6e316b
870	2025-07-27 12:26:06.834085+00	658531047	176.59.166.138	t	t	done	200 рублей	OZON	279779690219	https://directus.bmulti.store/assets/f03e71a1-8295-47b2-86bf-9bc1b05a1d43	https://directus.bmulti.store/assets/34c81dc9-afc4-45d7-8e4a-1be3951f787f
872	2025-07-27 13:32:49.199146+00	1163540122	178.121.1.121	t	t	check	200 рублей	WB	375255171993	https://directus.bmulti.store/assets/e0c938ba-2a5f-4e4f-8e0f-4f592478cd59	https://directus.bmulti.store/assets/262ef031-9f5b-4c78-a345-794a863df46d
947	2025-08-01 18:27:41.967095+00	1846485718	213.152.174.146	t	f	check	200 рублей	WB	79017456063	https://directus.bmulti.store/assets/485c571d-5711-43de-91b3-66e64db72edc	https://directus.bmulti.store/assets/91e8bc0d-8982-4267-9e5f-6191948e4f9d
868	2025-07-27 12:02:28.515678+00	341622672	93.100.60.187	t	f	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/3b329684-3363-4bfd-b45f-2a67f31ec020	https://directus.bmulti.store/assets/a0701f0f-dd61-42d5-a22a-71a96eab5c90
948	2025-08-01 21:43:29.083385+00	526986855	212.66.44.193	t	t	check	1500 рублей	OZON	79493681915	https://directus.bmulti.store/assets/59868171-cc96-40ae-b029-d9c6e7dcecad	https://directus.bmulti.store/assets/5b86717a-cc8c-410f-9e13-6575aaf60c98
869	2025-07-27 12:14:55.501542+00	5880691131	213.152.174.147	t	t	check	200 рублей	OZON	79522431714	https://directus.bmulti.store/assets/f338cdbd-acd6-4c1a-a3c5-06f51334dcdf	https://directus.bmulti.store/assets/562d307c-8f5c-43cc-9cbd-9e9d6abb5a52
949	2025-08-01 23:10:30.586072+00	1453301913	109.106.142.182	t	t	check	200 рублей	WB	79102875256	https://directus.bmulti.store/assets/2be640c9-52c2-430e-aaa0-525057bcd266	https://directus.bmulti.store/assets/5d565ada-4fef-4361-9768-2d79c09a3619
950	2025-08-02 04:52:20.373686+00	5084189603	2.60.239.150	t	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/b4b47334-5710-42bd-a2fa-8977b1adce0b	https://directus.bmulti.store/assets/a43dee10-9a77-40ea-8086-3808fd57110d
873	2025-07-27 15:53:08.868177+00	474090704	194.5.61.117	t	t	check	200 рублей	WB	79304063608	https://directus.bmulti.store/assets/c15eb9a9-5677-48ea-b534-57fd1b1aa947	https://directus.bmulti.store/assets/f9f972a8-128c-41ca-a01d-bf45ba0716ab
871	2025-07-27 13:04:44.987649+00	394792977	134.122.111.213	t	t	check	200 рублей	WB	79056178931	https://directus.bmulti.store/assets/ed5e6184-3706-4675-99fb-c15cd127b5d7	https://directus.bmulti.store/assets/a02ca7c7-bf6e-4478-8d72-40c2dc52c27d
951	2025-08-02 04:52:23.441586+00	5084189603	2.60.239.150	f	f	check	200 рублей	OZON	890879457602	https://directus.bmulti.store/assets/4ebb7ec1-6dfa-4452-b51c-aaa4372fb309	https://directus.bmulti.store/assets/da5b9f59-a9ae-4be8-ad6e-d50edd769eb3
874	2025-07-27 20:00:18.035106+00	6072914829	176.59.168.35	t	t	check	200 рублей	WB	79533107865	https://directus.bmulti.store/assets/689b8a9c-93d7-4490-8efa-45a568bee907	https://directus.bmulti.store/assets/b6408f11-6814-4701-abed-fed41ab5ab04
952	2025-08-02 06:30:29.260891+00	1275245628	87.103.129.250	t	t	check	200 рублей	WB	95006709382	https://directus.bmulti.store/assets/f71a5c23-6364-45fc-b4f7-c077bec27f80	https://directus.bmulti.store/assets/d198acbc-0239-476a-a1aa-ce33b9be331d
875	2025-07-27 20:11:54.236651+00	382664548	31.130.4.220	t	t	check	200 рублей	WB	79377231767	https://directus.bmulti.store/assets/f798d309-05e9-459f-a228-b2cea7dadbbc	https://directus.bmulti.store/assets/78afa4e7-7313-4af4-bb4c-8fc3c1cba289
953	2025-08-02 06:55:26.54202+00	5017587916	188.232.38.24	t	t	check	200 рублей	WB	79969250950	https://directus.bmulti.store/assets/5e0baf76-422e-41e5-aa28-bc122b43a0ff	https://directus.bmulti.store/assets/cccb48a8-c4a5-4298-ad24-0a018ce9951c
878	2025-07-28 06:23:00.292407+00	1258251927	176.15.216.80	t	t	check	200 рублей	OZON	79608787481	https://directus.bmulti.store/assets/23583285-5fcb-49c9-98c2-b3b5201b4ede	https://directus.bmulti.store/assets/e8f674c9-5129-43da-a146-2ea6d85cd926
955	2025-08-02 07:53:11.023211+00	7556368539	178.130.40.123	t	t	check	200 рублей	OZON	79125849756	https://directus.bmulti.store/assets/47d55e1d-55e6-416a-ab0d-4e00478e15b4	https://directus.bmulti.store/assets/f18ec51d-8dc5-4101-a23f-b1168378cf56
877	2025-07-28 04:25:33.816685+00	6580554930	109.110.90.69	t	t	done	200 рублей	OZON	79790308165	https://directus.bmulti.store/assets/7ef240aa-9693-4da1-b0c3-84dd50634cff	https://directus.bmulti.store/assets/747f3277-0103-485a-834f-44bcfdd182a6
876	2025-07-28 00:51:20.745819+00	346726052	94.131.124.136	t	t	done	200 рублей	OZON	79111512039	https://directus.bmulti.store/assets/5af76c8b-2cc4-4830-90c1-a46ebbb9c242	https://directus.bmulti.store/assets/c89b5488-3421-4b2d-aa6b-40edd25615b8
867	2025-07-27 07:16:30.468245+00	396726058	5.130.149.93	t	t	done	200 рублей	OZON	79537830379	https://directus.bmulti.store/assets/06303330-03cd-42e3-8c2a-beaf81d9bf0d	https://directus.bmulti.store/assets/9aae31c9-644c-49aa-a214-0bed9f725909
866	2025-07-26 22:53:22.238+00	307412256	136.169.209.27	t	t	done	200 рублей	WB	79063348668	https://directus.bmulti.store/assets/d823f439-9598-46cb-81c8-cfdcffcfaac0	https://directus.bmulti.store/assets/854fd33a-b970-4ba8-9eb9-80dd9fca3ad1
879	2025-07-28 06:54:45.594678+00	1403698441	5.141.192.175	t	t	done	200 рублей	OZON	79233586850	https://directus.bmulti.store/assets/64595986-4a06-404d-8e45-b0010fb318cf	https://directus.bmulti.store/assets/56bf7835-8cf8-4daa-b1aa-ca31837bad0b
954	2025-08-02 07:09:00.876694+00	5108703884	91.185.78.249	t	t	done	200 рублей	WB	79180060797	https://directus.bmulti.store/assets/27422ba5-211c-4039-94ca-87d18766bd29	https://directus.bmulti.store/assets/54022007-79e3-45f7-832d-ebd9ce7deb94
956	2025-08-02 09:30:55.284107+00	695324729	45.38.143.137	t	t	done	200 рублей	WB	79064669489	https://directus.bmulti.store/assets/2a063f40-df5a-4ce1-8e89-c4b4a0cd7a16	https://directus.bmulti.store/assets/71dabeee-886a-446c-961f-6356f64775ff
881	2025-07-28 08:39:40.764411+00	693934439	92.51.31.1	t	t	check	200 рублей	WB	79785490207	https://directus.bmulti.store/assets/bcce706c-39d4-4049-a223-a74d765dc99e	https://directus.bmulti.store/assets/2160a2ed-4b04-461f-96bc-1f8c5cf50948
882	2025-07-28 08:56:13.909885+00	6173555998	185.157.215.189	t	f	check	200 рублей	WB	79886691113	https://directus.bmulti.store/assets/9ccf6281-830f-483a-8741-2df99ac5fcbc	https://directus.bmulti.store/assets/89444c2e-92fe-4827-be8c-5edc734cd145
889	2025-07-28 12:28:30.059604+00	7916520565	37.212.52.18	t	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/107aeb3d-dd7b-43bd-a0a8-56788e0c01c9	https://directus.bmulti.store/assets/aa6ddb1c-ddfc-4bff-8c42-b404e55211a6
883	2025-07-28 08:58:54.094432+00	7193460452	91.84.101.105	f	f	check	200 рублей	WB	79141640919	https://directus.bmulti.store/assets/e4b30409-ba18-4afd-b619-5d123d015983	https://directus.bmulti.store/assets/2a3f98f2-c7dc-46b8-ba20-98b785e1210b
885	2025-07-28 09:20:16.656595+00	5077523962	79.127.142.74	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/373f8f01-f099-4289-ac18-c9ba4c3ee28c	https://directus.bmulti.store/assets/7dd2c757-c0e8-4055-962c-f864587b713b
887	2025-07-28 10:04:13.404851+00	2116763852	91.149.120.206	t	t	check	200 рублей	OZON	79500588889	https://directus.bmulti.store/assets/de249d6c-9f5d-4968-92c1-a10b51825385	https://directus.bmulti.store/assets/ce83916d-aacb-4818-bff7-cb1537d503e7
890	2025-07-28 12:43:39.069418+00	431029811	90.188.244.90	t	t	check	200 рублей	OZON	79832459333	https://directus.bmulti.store/assets/b25848d0-5569-4f2a-b297-d5eb19c555de	https://directus.bmulti.store/assets/423290ac-22b6-40c9-a390-ebf93950f25b
891	2025-07-28 13:11:47.975189+00	591955531	91.223.100.75	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/7b429ddf-f78c-4f1c-b79c-5004db7cb3e6	https://directus.bmulti.store/assets/af2cd405-fe70-414d-a927-035292e8dcdf
893	2025-07-28 17:45:16.520586+00	1954694824	37.212.26.40	t	t	check	200 рублей	WB	375333376699	https://directus.bmulti.store/assets/de2ff99b-509c-4fe9-822b-00e1650894c5	https://directus.bmulti.store/assets/4ad94216-c236-460c-8695-2bc319f791a7
895	2025-07-28 18:41:53.916234+00	922692854	109.126.175.77	t	t	check	200 рублей	WB	79374232457	https://directus.bmulti.store/assets/c8b442e0-c609-49a2-b1da-b3f5314bb8c7	https://directus.bmulti.store/assets/56ed80fa-12a0-42d6-8e46-ceed8ff5c7a0
894	2025-07-28 17:47:32.007355+00	1409316071	94.25.227.73	t	t	check	200 рублей	WB	79621660006	https://directus.bmulti.store/assets/4949cce4-12cc-47db-bc56-d630807bedbf	https://directus.bmulti.store/assets/0d3fc208-e512-44af-96b5-993d3da8bf9a
896	2025-07-28 19:49:21.22084+00	5187517791	80.80.195.231	t	t	check	200 рублей	WB	79509069417	https://directus.bmulti.store/assets/5c4274f8-42a9-43ff-81e9-f152fc3e6ac0	https://directus.bmulti.store/assets/9a6a1045-0999-492b-81c7-92c8ccc6825f
884	2025-07-28 09:01:20.022238+00	8104046594	94.25.237.89	t	t	done	200 рублей	OZON	79992249738	https://directus.bmulti.store/assets/12fe5dc1-1755-4d61-824d-98faf473364a	https://directus.bmulti.store/assets/960cb789-2ea3-4f3e-b9cc-e9ad49ccebdc
897	2025-07-28 23:20:28.649731+00	382803115	31.132.248.30	t	t	check	200 рублей	OZON	79141453908	https://directus.bmulti.store/assets/cc3860c6-00e6-4ca8-9108-20b18922977d	https://directus.bmulti.store/assets/277681df-8c9f-4157-ba6b-6c46029fcd93
899	2025-07-29 12:23:43.375435+00	691308311	146.120.200.0	t	t	check	200 рублей	OZON	79194344283	https://directus.bmulti.store/assets/0480265c-d64c-4299-91d9-65ba64dc0869	https://directus.bmulti.store/assets/db3fe27c-d848-4f35-ae0e-ae21505a7d75
901	2025-07-29 13:06:48.126079+00	1129216091	176.98.168.246	t	t	check	200 рублей	OZON	79282230122	https://directus.bmulti.store/assets/a33567f6-8bef-4af0-a3c0-bfc4c38b5137	https://directus.bmulti.store/assets/40b062aa-c3a1-4c89-9efc-d40384249139
904	2025-07-29 14:37:29.575062+00	6394579967	146.120.157.221	t	t	check	200 рублей	OZON	79877561170	https://directus.bmulti.store/assets/8ccfc839-af5b-4955-9669-ea747ff34f87	https://directus.bmulti.store/assets/a7ef454c-e4eb-4b54-bfc6-99f67e586902
902	2025-07-29 14:01:33.675072+00	5953511027	178.186.13.147	t	t	check	200 рублей	WB	79339336120	https://directus.bmulti.store/assets/0cfa9f53-d1e2-4079-9cf8-5eb1aa445eee	https://directus.bmulti.store/assets/592e12e6-1516-4755-a587-7870b581609d
886	2025-07-28 09:39:02.639403+00	1921662871	85.234.40.145	t	t	done	200 рублей	OZON	79603168060	https://directus.bmulti.store/assets/a74bfb49-d2aa-4313-aae0-1684fb57423f	https://directus.bmulti.store/assets/2084369c-bcee-406b-9408-c4b4e662cc68
898	2025-07-29 06:09:46.823758+00	641619703	188.170.80.223	t	t	done	1000 рублей	OZON	79811214481	https://directus.bmulti.store/assets/019dd95d-ca87-4adf-badc-caa2d96c47ec	https://directus.bmulti.store/assets/60fdcc43-bce6-4e90-9aa0-c984523ce93b
888	2025-07-28 11:39:01.689524+00	1126845093	89.41.172.129	t	t	done	200 рублей	OZON	79821985333	https://directus.bmulti.store/assets/0176ad4d-55cf-47ab-8b39-13e4f3469652	https://directus.bmulti.store/assets/d4436edb-cac0-496d-920f-7b06dd208d20
906	2025-07-29 16:40:57.819149+00	5406428894	188.170.80.160	t	f	check	300 рублей	WB	79635467143	https://directus.bmulti.store/assets/962f090f-5c16-4860-aa2d-406c76d87313	https://directus.bmulti.store/assets/e84c1447-da43-4061-beb1-2f27128bfa6d
907	2025-07-29 16:57:32.070936+00	5174040861	85.174.192.189	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/7c2b869b-0feb-4445-a55e-9c34832912a5	https://directus.bmulti.store/assets/8f6c39fe-c9a6-420e-9f13-2105c5ce0f3a
908	2025-07-29 18:51:43.247026+00	1569478336	185.107.56.157	t	t	check	200 рублей	OZON	79185748505	https://directus.bmulti.store/assets/50d69f73-efdf-44f2-940d-9d3b8b49fc6a	https://directus.bmulti.store/assets/19719e6b-2f8c-442b-b2e8-bf055e5c55d6
909	2025-07-29 19:55:38.011038+00	562028864	128.65.27.22	t	t	check	200 рублей	WB	375447320068	https://directus.bmulti.store/assets/372a32bc-b612-4a5a-b047-8f58f809cd78	https://directus.bmulti.store/assets/22ccc8ff-c190-4f61-bd06-f27d7521cf94
892	2025-07-28 14:07:28.630292+00	7718054222	94.25.231.1	t	t	done	200 рублей	OZON	79005677896	https://directus.bmulti.store/assets/d6e21b04-135d-452d-a9c8-e49f2c2cb2c5	https://directus.bmulti.store/assets/021ca422-9473-49f4-b112-cf9a0380e1f6
903	2025-07-29 14:17:00.682321+00	7590664941	31.131.212.172	t	t	done	200 рублей	WB	79205319911	https://directus.bmulti.store/assets/a115b285-fda7-4d48-be1a-f75a388ed8d4	https://directus.bmulti.store/assets/3b182635-90fc-480b-a16b-3335fd20ca95
900	2025-07-29 12:42:09.679511+00	1955223135	77.222.99.234	t	t	done	200 рублей	OZON	79043096429	https://directus.bmulti.store/assets/596dbb89-a093-4c8a-9c64-b909be07d9b2	https://directus.bmulti.store/assets/d96a8aa4-b52b-45b9-80ff-90f34ccafcbf
905	2025-07-29 14:46:09.998591+00	1004394732	95.104.172.144	t	t	done	200 рублей	OZON	79800675862	https://directus.bmulti.store/assets/c239e5f6-7d63-4355-929a-de2c1d8e93ee	https://directus.bmulti.store/assets/5c992c1b-ecad-4777-a288-274cbe0348ce
942	2025-08-01 16:30:23.625999+00	1542637240	185.193.159.232	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/b17f394e-7239-40fc-bcf1-2a53f5a8b062	https://directus.bmulti.store/assets/5e749be4-1b5c-4256-b50e-4608b03072f0
937	2025-08-01 02:21:57.311679+00	5632865054	46.72.225.222	t	t	done	200 рублей	WB	79204325321	https://directus.bmulti.store/assets/1e763c5d-50da-43c1-87a3-6317ef8c561b	https://directus.bmulti.store/assets/07c66baa-2a24-4eee-ac14-c6917badfc09
910	2025-07-30 06:20:47.127719+00	1047320221	185.77.216.6	t	t	check	200 рублей	OZON	79787185011	https://directus.bmulti.store/assets/8b91241c-702f-423c-962b-8ac58983bc7d	https://directus.bmulti.store/assets/65e92ee9-0623-48b3-8b01-c350b241b316
934	2025-07-31 18:39:21.870633+00	1487898448	176.59.72.61	t	t	done	200 рублей	OZON	279507736230	https://directus.bmulti.store/assets/6a66fbdb-6b8f-4f1e-87e4-69dc3fcf7bce	https://directus.bmulti.store/assets/af87ee0a-6e6f-4b48-9d86-787318822da9
932	2025-07-31 13:49:50.36996+00	414628674	213.148.26.3	t	t	done	200 рублей	OZON	79675209798	https://directus.bmulti.store/assets/87c818c9-4bb3-411e-bb61-da523ad8f0db	https://directus.bmulti.store/assets/8931c0d4-f661-4faf-ba07-4a7cb3f8a9c7
930	2025-07-31 12:24:37.855981+00	920713413	89.163.144.160	t	t	done	200 рублей	OZON	289086562400	https://directus.bmulti.store/assets/f2204e3c-7a70-4d94-82a9-42a2803a3798	https://directus.bmulti.store/assets/0214a594-360c-45ef-a6de-c06c854dda52
924	2025-07-30 16:53:40.537415+00	353875352	81.222.179.103	t	t	done	200 рублей	OZON	79622098555	https://directus.bmulti.store/assets/b2569392-a67f-4fa5-af64-780478135a6c	https://directus.bmulti.store/assets/1dacaad9-4e65-45a0-b4ea-3a5777bdcdb2
917	2025-07-30 14:30:12.518766+00	5935704729	92.118.132.125	t	f	done	200 рублей	OZON	79592815905	https://directus.bmulti.store/assets/b92536ab-92eb-4367-b3b1-a9a05627c611	https://directus.bmulti.store/assets/fe6c3ba5-cc06-4a0f-9aaf-e013fdf7c6b3
936	2025-08-01 00:30:47.310345+00	661177406	81.9.113.69	t	t	done	200 рублей	OZON	79089894646	https://directus.bmulti.store/assets/0e25ed9a-639b-4b1d-9ff2-86018586907d	https://directus.bmulti.store/assets/d8c09e8b-d96f-4bde-bae0-54e4b92d6208
914	2025-07-30 11:01:38.183618+00	1060068535	171.33.252.250	t	t	check	300 рублей	WB	\N	https://directus.bmulti.store/assets/a671af87-0a22-4303-b660-a2479c78eeb5	https://directus.bmulti.store/assets/cd7d8af6-df01-4322-a24b-4675c610ba5a
918	2025-07-30 15:01:59.493502+00	1026191932	185.30.41.3	t	t	check	200 рублей	WB	79054625486	https://directus.bmulti.store/assets/b236bf18-f4cb-4a56-9745-a9acb9767ed4	https://directus.bmulti.store/assets/7ca9be4d-801b-4ce5-a174-b870b3c533e1
915	2025-07-30 12:22:28.621361+00	6077992334	176.59.135.205	t	t	check	200 рублей	OZON	890294001622	https://directus.bmulti.store/assets/8214158d-8a3a-4cb0-bd36-cf1ca665eb9e	https://directus.bmulti.store/assets/065673b1-a102-4b24-9b7b-467f7fee8bb1
916	2025-07-30 13:18:36.500018+00	5192899382	2.63.200.165	t	t	check	200 рублей	OZON	79831009203	https://directus.bmulti.store/assets/0ec31179-fbc3-457d-9f5e-1e1b9cbad045	https://directus.bmulti.store/assets/52a5ff6d-fbb3-4c01-ae45-0c402b7001b3
926	2025-07-30 20:30:45.621156+00	7942009831	176.208.57.242	f	f	check	200 рублей	WB	79287015099	https://directus.bmulti.store/assets/78cf502f-9b1b-4ef6-9146-07e8fac3feef	https://directus.bmulti.store/assets/daff2e2a-b6ac-425e-9e3c-410e5a5cc322
923	2025-07-30 16:49:36.380702+00	5816246514	185.138.207.15	t	t	check	200 рублей	WB	79530476004	https://directus.bmulti.store/assets/7fb80693-32bb-49ec-ba74-7e0a6f0ef0df	https://directus.bmulti.store/assets/ea0f9fb3-6d51-4a38-99a7-40eff2caabd5
920	2025-07-30 15:41:43.290687+00	1072014547	178.34.160.59	t	f	check	200 рублей	OZON	79614415610	https://directus.bmulti.store/assets/854d77cd-6bb4-4e4b-bbd0-9406b1a9c591	https://directus.bmulti.store/assets/5cf93f1c-3c38-4cea-b35e-32d4cd5c7421
922	2025-07-30 16:12:15.134381+00	1248005177	46.22.51.140	t	f	check	200 рублей	WB	79366664429	https://directus.bmulti.store/assets/3c187472-b5c3-4562-8c5c-50760b57797a	https://directus.bmulti.store/assets/4c1800b3-6210-4d37-b99e-8a501a75a09b
925	2025-07-30 17:08:19.641646+00	274811989	45.144.65.176	t	t	check	200 рублей	OZON	79269639087	https://directus.bmulti.store/assets/425ca29c-49ee-4279-9ec3-9e6198a38ff9	https://directus.bmulti.store/assets/f2b6d617-cf5b-4fb4-a773-cd906c366e02
911	2025-07-30 06:21:36.50913+00	5829048688	89.110.122.44	t	t	done	200 рублей	OZON	79963903564	https://directus.bmulti.store/assets/338ca4ae-3ce2-4cb7-9fbd-99406f175ef9	https://directus.bmulti.store/assets/55623a18-43eb-4834-b860-5866bcf1e7fa
927	2025-07-31 03:48:46.224279+00	831956568	80.80.196.207	t	t	check	200 рублей	WB	79028497911	https://directus.bmulti.store/assets/3e76a6a6-8406-44b8-b733-f4ece866ce97	https://directus.bmulti.store/assets/fd491c41-8dce-4b1d-afb0-3c1994b790c1
929	2025-07-31 10:29:41.574044+00	7023881748	5.142.43.177	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/94d73526-a230-475c-ab86-283971b6d4d8	https://directus.bmulti.store/assets/59c310df-66b9-4d05-9d34-68a3d49beaa7
933	2025-07-31 16:32:08.328161+00	252047768	94.19.15.57	t	t	check	200 рублей	OZON	79990262880	https://directus.bmulti.store/assets/216515c4-bc17-4238-8b3e-ba491bf77347	https://directus.bmulti.store/assets/5fa35c61-f149-4d06-b380-343844f02264
931	2025-07-31 12:53:37.465743+00	7209617500	85.140.126.3	t	f	check	200 рублей	WB	79878474997	https://directus.bmulti.store/assets/41c52525-739b-45e8-9639-beadfc7d11bc	https://directus.bmulti.store/assets/f04e70c6-e8d1-48bd-975e-8dd38cba0a02
913	2025-07-30 10:29:03.009666+00	7674269603	176.59.199.127	t	t	done	200 рублей	OZON	7	https://directus.bmulti.store/assets/a852cecb-3d10-4c4d-8ff7-4d2e117c7128	https://directus.bmulti.store/assets/2b8a33a1-aaec-4e08-9eab-95c1eb2bdd21
928	2025-07-31 05:13:02.99907+00	1073022276	93.157.175.41	t	t	done	300 рублей	OZON	79969968925	https://directus.bmulti.store/assets/68166bc3-872f-45f4-b28d-b314b649db93	https://directus.bmulti.store/assets/d48d4a94-06a3-48ab-bec2-f1d55d1485b5
921	2025-07-30 16:10:26.796986+00	1217394250	85.174.204.224	t	t	done	200 рублей	WB	79886697194	https://directus.bmulti.store/assets/0886e0d9-b396-4ae5-975b-a22f2420be46	https://directus.bmulti.store/assets/1e1675ae-702c-47d9-9d12-3b59f36fa730
919	2025-07-30 15:35:33.439085+00	5046832382	194.50.14.10	t	t	done	200 рублей	OZON	79217123211	https://directus.bmulti.store/assets/cc0a2666-0107-4ea0-954e-030b025b200b	https://directus.bmulti.store/assets/926bd94a-a64e-4664-8ed0-bc251bbdd6fb
912	2025-07-30 08:46:32.504848+00	1927997548	95.25.85.245	t	f	done	200 рублей	OZON	79188889921	https://directus.bmulti.store/assets/496dc064-3260-417c-aabb-1a5494c3573e	https://directus.bmulti.store/assets/dd284e7f-3846-4b8f-ac66-11a2a2727c5d
935	2025-07-31 19:19:52.384204+00	1927997548	95.25.86.76	t	f	check	200 рублей	OZON	79188889921	https://directus.bmulti.store/assets/b82c7a63-388e-4e34-954d-fee3c4787f4a	https://directus.bmulti.store/assets/75c6c994-84e8-425e-8d04-dcb1cefaf27e
958	2025-08-02 10:35:45.683669+00	886450358	81.23.183.152	t	t	done	200 рублей	OZON	79278931727	https://directus.bmulti.store/assets/5a296a64-e793-47f2-a600-e3d59c5f1c96	https://directus.bmulti.store/assets/516d617c-00c3-4da0-af57-3b6d42c79d29
957	2025-08-02 09:38:47.064431+00	7220561288	5.183.152.102	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/79e52e1a-57e7-4feb-aac3-3ab2a548f85a	https://directus.bmulti.store/assets/6033a49e-3312-414d-a466-bb763a6fd910
1095	2025-08-09 07:45:17.187456+00	352945474	147.45.178.128	t	t	check	200 рублей	OZON	79093060744	https://directus.bmulti.store/assets/2060275d-de81-424f-94fe-19a763cc162c	https://directus.bmulti.store/assets/ae8b2379-0cd0-4164-a90d-ae71caa2c3d3
1243	2025-08-17 12:09:47.035981+00	483587764	193.233.106.106	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/0a616341-c4c8-4078-9012-5aca54497959	https://directus.bmulti.store/assets/8101d3aa-e7e3-4209-926f-8f0234dc8237
1098	2025-08-09 08:58:35.032576+00	896527482	178.67.199.148	t	t	check	300 рублей	WB	79585442028	https://directus.bmulti.store/assets/76e4c234-4992-4ccf-bf42-ae4fb63d8610	https://directus.bmulti.store/assets/3c264255-abd1-4641-8743-2131bbcd6aa2
1100	2025-08-09 13:34:38.530228+00	1432447191	95.32.60.85	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/fcde35c3-5db8-4687-9ea0-82f1bcb1c620	https://directus.bmulti.store/assets/5f718c7b-0920-491d-9761-9db1682e1c78
960	2025-08-02 11:39:44.081127+00	7584984590	176.59.1.10	t	t	check	200 рублей	OZON	79531751035	https://directus.bmulti.store/assets/a4f43135-4cf7-4740-9967-56199e5450bc	https://directus.bmulti.store/assets/890e5b74-ede8-4f57-a375-3ce754834b4f
961	2025-08-02 12:19:00.947981+00	5077162070	2.76.27.17	t	t	check	200 рублей	WB	77781023407	https://directus.bmulti.store/assets/2891baa4-f714-4c47-b014-bff06311c33c	https://directus.bmulti.store/assets/3af364e6-8086-4b1d-919e-ac4dd4025544
963	2025-08-02 12:56:07.727692+00	\N	85.174.22.253	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
962	2025-08-02 12:56:03.705826+00	1466784681	176.59.44.247	t	t	check	200 рублей	WB	79954106294	https://directus.bmulti.store/assets/dee4b531-e6f8-4319-84d9-1ba22c901b70	https://directus.bmulti.store/assets/9f67ea0b-ee10-4557-9395-02b4e2bb5a8c
1118	2025-08-10 21:23:28.978953+00	154061647	89.169.10.91	t	t	done	200 рублей	WB	79824952470	https://directus.bmulti.store/assets/d843a62e-7a22-4d76-af02-6ed820f734c4	https://directus.bmulti.store/assets/0196b9c7-7749-45ba-ae8b-20f9bea24e42
964	2025-08-02 13:11:43.905767+00	496687673	147.45.163.253	t	t	check	200 рублей	WB	79635812662	https://directus.bmulti.store/assets/f186ab1e-787c-48ee-836e-6b966928cb7c	https://directus.bmulti.store/assets/66af9027-300d-4cbc-8fc5-0ed149d0b057
965	2025-08-02 14:34:46.025704+00	6068492630	143.14.42.77	t	t	check	200 рублей	WB	279776727863	https://directus.bmulti.store/assets/258e2ab7-1aec-431f-a76b-62367b702ef5	https://directus.bmulti.store/assets/f4c471bc-b19f-447d-a645-d304522985a4
959	2025-08-02 11:14:38.985971+00	1900153728	176.52.15.89	t	t	done	200 рублей	OZON	279510682029	https://directus.bmulti.store/assets/c2ead244-b0d8-4983-ad91-bf44f001f92b	https://directus.bmulti.store/assets/368f2b4c-4c88-42d2-ae47-31b017577da5
1090	2025-08-08 16:21:00.839086+00	5661347491	190.2.149.219	t	t	done	200 рублей	WB	79319646430	https://directus.bmulti.store/assets/bc3ce6f6-c56d-40e2-9746-27419667420b	https://directus.bmulti.store/assets/a2343dff-7773-4ac1-aa23-2c1a7a0566f6
1089	2025-08-08 15:48:34.52308+00	1168862977	2.63.181.196	t	t	done	200 рублей	OZON	79780520355	https://directus.bmulti.store/assets/1f9c7356-7ee9-4297-950f-f6828927c4fc	https://directus.bmulti.store/assets/6c087f9a-7ece-47c6-b4af-497e6c6b3852
1110	2025-08-10 13:07:55.192549+00	7853245359	178.35.36.7	t	t	check	200 рублей	OZON	79522445095	https://directus.bmulti.store/assets/6195196c-ba87-492c-acc8-efe0ca02bf2a	https://directus.bmulti.store/assets/c9ec18d0-3e45-4af0-932f-c91994bc1765
1120	2025-08-11 06:44:48.22306+00	5802043007	79.105.194.156	t	t	check	200 рублей	OZON	79241005958	https://directus.bmulti.store/assets/eae91d86-2f3c-41a5-a531-7f047d915427	https://directus.bmulti.store/assets/866ba37e-ceb2-4378-ae2b-9671811394fa
1122	2025-08-11 10:17:59.110451+00	6108448504	91.244.168.2	t	t	check	200 рублей	WB	79027252652	https://directus.bmulti.store/assets/63390475-528e-458f-8949-408aa99bc70c	https://directus.bmulti.store/assets/3645efb7-ccc2-4412-86fc-605d9981b42d
1116	2025-08-10 18:57:36.308629+00	1896926646	89.110.114.246	t	t	done	200 рублей	OZON	79212542999	https://directus.bmulti.store/assets/f5b09416-b132-4641-b90f-2218acdedf29	https://directus.bmulti.store/assets/c9c9835f-dea6-418b-9f35-a4784f6265fe
1108	2025-08-10 10:31:49.920893+00	1291769183	176.194.56.67	t	t	done	200 рублей	WB	79508681261	https://directus.bmulti.store/assets/38a30fad-33a7-4666-9513-5df3ffce83ca	https://directus.bmulti.store/assets/409d9c92-08cc-4d19-95b2-00a661fa4a80
1114	2025-08-10 16:49:31.52709+00	520015353	213.184.227.180	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/7a88927b-d86a-4eee-bae0-9d21fd68c148	https://directus.bmulti.store/assets/6f454382-777c-4664-8700-d0071fbdd146
1127	2025-08-11 21:03:59.319969+00	863552126	109.184.198.56	t	t	check	200 рублей	WB	90823115142	https://directus.bmulti.store/assets/403ee43f-49a8-4a1d-a59f-874e1f474bc9	https://directus.bmulti.store/assets/85089e6d-8475-450a-bbcc-cd7ac31673a4
1129	2025-08-11 22:29:24.095314+00	7607522659	94.25.225.214	t	f	check	200 рублей	WB	79066682059	https://directus.bmulti.store/assets/3b0a1663-1f24-4333-9ca6-9b6c55618aa6	https://directus.bmulti.store/assets/3510fd1d-fc65-4f79-91b1-ce172e5a9b58
1131	2025-08-12 09:08:58.594569+00	755577999	37.212.6.106	t	f	check	300 рублей	WB	79253130020	https://directus.bmulti.store/assets/3bea6c36-2d10-488a-9a0f-89cf3f28100b	https://directus.bmulti.store/assets/14c9a331-a2fa-4549-ae2e-95904fd9c8b8
1106	2025-08-10 09:05:35.782918+00	5272938201	176.59.139.246	t	f	done	200 рублей	OZON	79010183428	https://directus.bmulti.store/assets/a0394b9b-6dc7-4a45-a1a3-183544098c0f	https://directus.bmulti.store/assets/06cf7ecb-1f9b-431d-8945-a7baf4afd00f
1104	2025-08-10 07:52:51.269185+00	975510535	91.149.118.57	t	t	done	200 рублей	OZON	79234574720	https://directus.bmulti.store/assets/f758a74c-0fe2-4c73-968d-b82bc38a9e7c	https://directus.bmulti.store/assets/1c04f77d-a9ab-43c1-9214-67701f936734
1102	2025-08-10 02:12:32.879315+00	5093431550	176.15.205.117	t	t	done	200 рублей	OZON	79049625334	https://directus.bmulti.store/assets/503836da-733d-451f-b59d-a34d9951e065	https://directus.bmulti.store/assets/902564c6-830c-40a3-aabf-1485a678028c
1123	2025-08-11 12:31:10.864327+00	1155552488	178.120.55.92	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/abf84f11-12d2-4de7-95fb-ac684dba00ce	https://directus.bmulti.store/assets/37448447-4502-4a9e-89e6-b9de3b66bb61
1125	2025-08-11 16:29:53.145715+00	392119419	91.146.13.251	t	t	done	200 рублей	OZON	79127694374	https://directus.bmulti.store/assets/df65da31-201c-41c4-a794-66a6a80f6b7b	https://directus.bmulti.store/assets/9c4c53d5-e0d1-45b2-8f2c-914182c283ce
1112	2025-08-10 13:26:31.598753+00	704287418	198.44.167.31	t	t	done	200 рублей	OZON	79882660821	https://directus.bmulti.store/assets/b864dffc-658d-4f66-9795-22e39ff2baf3	https://directus.bmulti.store/assets/e2b12c41-395f-490d-8f44-0ea8df8f86f7
405	2025-06-28 05:24:35.893738+00	6938717386	213.87.144.46	f	f	check	200 рублей	OZON	79181511132	https://directus.bmulti.store/assets/caf38dac-1657-44a8-9947-e18538b66f2c	https://directus.bmulti.store/assets/f729afaa-9ae3-4fb9-a1d4-0d0de679e891
966	2025-08-02 15:07:55.855229+00	6111410960	77.95.11.1	t	t	check	200 рублей	WB	79951526685	https://directus.bmulti.store/assets/cf4fe799-e1f3-4987-bb51-5c598c64cea9	https://directus.bmulti.store/assets/6fe5b362-11fd-4adb-a6c8-2554abd3f6bc
1091	2025-08-08 16:27:04.357819+00	1443409730	77.238.246.189	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/2aaf3be5-b729-45e7-8fb5-6db31df804f1	https://directus.bmulti.store/assets/587f30c0-5cec-4c42-9152-c1853f40635d
967	2025-08-02 16:11:29.789784+00	774380751	195.123.233.29	f	t	check	200 рублей	WB	79221995027	https://directus.bmulti.store/assets/969cb9d1-77c7-4bcf-888e-81b9aa50ea0e	https://directus.bmulti.store/assets/1fe428e8-dc53-4471-938f-e410a577c1c3
974	2025-08-03 03:09:12.345702+00	516722292	89.169.48.248	t	t	check	200 рублей	WB	79673517546	https://directus.bmulti.store/assets/0af5c2a3-967d-4f81-9a5d-70316c4d94a9	https://directus.bmulti.store/assets/f1e24b3b-8770-4bbc-b206-f8c7ddda9eba
971	2025-08-02 17:34:46.178079+00	893926167	5.166.19.47	t	t	check	200 рублей	OZON	79201300587	https://directus.bmulti.store/assets/ce42b715-a21c-42e0-964d-4a1fe14f4cc2	https://directus.bmulti.store/assets/672ef7eb-2003-43aa-80c1-4a2214047f27
979	2025-08-03 09:57:50.519101+00	1375467534	37.212.19.124	t	t	check	200 рублей	OZON	375255054149	https://directus.bmulti.store/assets/4abb0cbb-9aa8-4bdf-b71f-f25742746d95	https://directus.bmulti.store/assets/018da663-c727-4a2a-b483-9ba75ab0e32c
973	2025-08-02 20:12:28.888644+00	726794086	185.193.159.13	t	t	check	200 рублей	OZON	79605690098	https://directus.bmulti.store/assets/a3c620dd-cffa-44da-802c-0f5bf61e5ea3	https://directus.bmulti.store/assets/7fae94ed-e8f4-446d-96ca-cf8311928dcc
976	2025-08-03 05:55:49.05507+00	1032683044	178.218.99.19	t	f	check	200 рублей	OZON	79990847471	https://directus.bmulti.store/assets/4693e83f-b3db-451c-be3a-70c9cae37e68	https://directus.bmulti.store/assets/315b614c-d515-431d-aaad-caa370f9d2c4
977	2025-08-03 07:33:18.206005+00	1946762227	176.59.111.146	t	t	check	200 рублей	OZON	279101339441	https://directus.bmulti.store/assets/0c886484-ca5a-42cd-9d78-6ceee2e461c9	https://directus.bmulti.store/assets/0057ac24-f2b2-4429-aac7-d16eb6b20d0c
978	2025-08-03 09:27:10.528954+00	1140696143	157.180.66.82	t	t	check	200 рублей	WB	79220705900	https://directus.bmulti.store/assets/f40a0383-95aa-449e-82c6-d70db417edf8	https://directus.bmulti.store/assets/de6252f6-ff98-447b-81c2-3750fe76e5d4
980	2025-08-03 10:12:04.668215+00	1859064862	83.137.55.89	t	t	check	200 рублей	WB	279771050013	https://directus.bmulti.store/assets/043bf935-d233-4ed7-a216-2df88ea3606b	https://directus.bmulti.store/assets/c458fb41-1269-473b-a17b-aef553237545
984	2025-08-03 12:20:56.036942+00	5813443416	64.238.203.100	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/c1b7d91a-648e-4313-8655-aeb8bab2deac	https://directus.bmulti.store/assets/45f44d30-33e5-495d-987f-bfc2e7b1d00f
972	2025-08-02 19:31:04.887413+00	573566045	87.117.61.193	t	t	done	200 рублей	OZON	79185048777	https://directus.bmulti.store/assets/d8cdd0ba-a4c6-42e4-ac51-91c35e817fae	https://directus.bmulti.store/assets/10336fba-89c2-4787-8d07-396a0a890a9b
983	2025-08-03 12:02:53.19558+00	423679406	95.161.61.205	t	t	done	200 рублей	OZON	79216535210	https://directus.bmulti.store/assets/58c0a18f-0297-412c-b758-37ce209b8723	https://directus.bmulti.store/assets/eec8d82c-d966-4362-990e-db95ff2ab29b
989	2025-08-03 14:15:55.573106+00	893619156	46.163.140.0	t	t	check	1500 рублей	WB	79126027820	https://directus.bmulti.store/assets/5736aa3b-006c-455d-a327-ea96de0f51ef	https://directus.bmulti.store/assets/f4e8f280-6abc-4c5b-b7cc-2ea0a3995fc2
988	2025-08-03 13:29:57.884078+00	774265255	85.172.101.153	t	t	check	200 рублей	WB	79183214654	https://directus.bmulti.store/assets/4b321006-950a-4a28-a871-0821b85c7e41	https://directus.bmulti.store/assets/7a287e87-e410-4400-b413-c25a678d1922
990	2025-08-03 14:37:47.898079+00	8009206841	104.28.244.75	t	t	check	200 рублей	WB	79028227932	https://directus.bmulti.store/assets/4045af55-ad9c-480f-84fa-fd4d3d8ee26b	https://directus.bmulti.store/assets/daa1c882-cb5b-445f-87e3-47338d18f81c
992	2025-08-03 14:38:58.202434+00	1364114815	178.168.218.78	t	t	check	200 рублей	WB	375297403507	https://directus.bmulti.store/assets/37412d0b-9d94-4909-aed6-a81d29216308	https://directus.bmulti.store/assets/9e293525-da8c-4317-b154-52025d8fc0e9
994	2025-08-03 16:56:01.053704+00	957289817	5.144.76.28	t	t	check	200 рублей	YANDEX	79535006670	https://directus.bmulti.store/assets/aeb91f56-0e82-49fb-ac92-05bf3f74813f	https://directus.bmulti.store/assets/100075b7-299d-49e1-8ea8-b7bbb890f2f3
993	2025-08-03 15:54:43.75884+00	1069670120	91.243.106.77	t	t	done	200 рублей	WB	79183806153	https://directus.bmulti.store/assets/fd3ae9dd-e0d5-466c-8623-dd8229197c71	https://directus.bmulti.store/assets/711e145a-b8ec-45e4-a7fb-7af2b7fc801b
968	2025-08-02 16:24:42.506138+00	6230871230	77.79.174.98	t	t	done	200 рублей	OZON	79869794003	https://directus.bmulti.store/assets/b686bf79-3c4c-42ba-8a76-9a6953c41161	https://directus.bmulti.store/assets/805b8ca6-8579-4772-a3c3-536be7c4d66c
991	2025-08-03 14:38:01.580972+00	5161523625	185.57.236.241	t	t	done	200 рублей	OZON	79012774962	https://directus.bmulti.store/assets/95673bf2-8fbd-486f-baa8-7f78fcbf8782	https://directus.bmulti.store/assets/f6083dda-8994-4584-9c25-22cfc336678f
987	2025-08-03 13:06:37.569466+00	896282912	91.84.107.213	t	t	done	200 рублей	WB	79997050072	https://directus.bmulti.store/assets/648d822a-9a19-4bdb-830f-20d02d1fc45a	https://directus.bmulti.store/assets/00384f2b-7e2f-42ee-9884-31c826cff4ab
985	2025-08-03 12:33:20.253559+00	339542982	188.162.65.55	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/38e59f2b-aaae-4cc4-99b2-9e340102aa60	https://directus.bmulti.store/assets/314fcf74-4377-420f-8ada-3d2b1c3bfa19
982	2025-08-03 11:29:50.150425+00	845409490	5.141.91.200	t	t	done	200 рублей	WB	79874461388	https://directus.bmulti.store/assets/829e2164-2956-4bfd-8f00-b4bbdaeba698	https://directus.bmulti.store/assets/e5b88fdf-e7a7-492f-8054-2c4861f729d8
981	2025-08-03 10:18:08.841525+00	383276263	51.68.213.58	t	t	done	200 рублей	OZON	79856638262	https://directus.bmulti.store/assets/cc53c065-e3a4-41f3-a24e-7b3aa3a34d3c	https://directus.bmulti.store/assets/90c8832b-9635-42fd-8d81-f580cb2583eb
975	2025-08-03 05:33:13.670083+00	6608617156	92.101.240.177	t	t	done	200 рублей	OZON	79119324995	https://directus.bmulti.store/assets/9bd205a6-1f97-4dd1-8957-e88579946f88	https://directus.bmulti.store/assets/be0086f2-cb84-44ed-ac29-c442e5d6caad
970	2025-08-02 17:16:35.043381+00	1836206070	5.18.42.36	t	t	done	200 рублей	OZON	79215786914	https://directus.bmulti.store/assets/b3ee2217-4b8f-4791-94ef-d3ff28c84a5f	https://directus.bmulti.store/assets/c2cd1029-6754-4b4a-8f18-2f76fde2f045
969	2025-08-02 17:01:27.831825+00	686494635	92.36.39.128	t	t	done	200 рублей	OZON	279201471079	https://directus.bmulti.store/assets/5ced0ed2-9cc5-488c-b555-7a59606bd0aa	https://directus.bmulti.store/assets/4205404c-b7b5-413d-96f0-ce6919699a9b
1236	2025-08-16 21:05:45.735749+00	372541396	89.169.48.168	t	t	check	200 рублей	WB	79103306644	https://directus.bmulti.store/assets/04698a70-8207-4b60-8612-6e0611b2a0ff	https://directus.bmulti.store/assets/50c281f4-c4f4-4a6b-8394-62727301e5b2
998	2025-08-03 18:18:22.681462+00	6052762374	93.191.56.253	t	t	check	200 рублей	WB	2	https://directus.bmulti.store/assets/e63e28f9-633a-442d-a697-c8b8952d3626	https://directus.bmulti.store/assets/489e7745-2c75-4d41-a139-82ef20786964
1092	2025-08-08 16:52:15.19341+00	6085216532	178.155.115.236	t	t	check	200 рублей	WB	279610694342	https://directus.bmulti.store/assets/4ad9b8e8-ce42-4b73-b965-ba50d8947897	https://directus.bmulti.store/assets/dbf07123-4137-4963-9bdc-588fab8fab2c
1101	2025-08-09 22:19:40.961028+00	6052508463	188.162.65.77	t	t	check	200 рублей	WB	79996157502	https://directus.bmulti.store/assets/2d8f8c90-dc67-4d15-9a9b-6d08f6ead5f9	https://directus.bmulti.store/assets/4239d23c-4ea9-4455-9f66-1b4c08c30f17
1103	2025-08-10 05:14:56.672454+00	7488314564	92.126.116.153	t	t	check	200 рублей	OZON	79535912406	https://directus.bmulti.store/assets/c443f654-267b-422b-90a7-c67b59d6b82a	https://directus.bmulti.store/assets/e3511e63-b679-4e65-ad44-d5044f1498e2
1105	2025-08-10 08:02:15.08018+00	6452583900	45.81.37.124	t	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/74f04868-9831-42a3-b249-6dcc155679a0	https://directus.bmulti.store/assets/07eadd56-904f-4153-9f7a-0a21f0bffef8
1115	2025-08-10 16:54:57.614085+00	1661688090	178.66.217.234	t	t	done	200 рублей	OZON	79022564533	https://directus.bmulti.store/assets/198aa3eb-1ca5-4bd9-8c26-a8c3317ee5c9	https://directus.bmulti.store/assets/b5ed1194-eb74-4b5f-bb8b-f64910258a34
1107	2025-08-10 09:13:31.582299+00	1689756498	193.168.178.72	t	f	check	200 рублей	OZON	79506397361	https://directus.bmulti.store/assets/c41c9f0f-84cb-48f6-b6e2-f6c7a3602b1e	https://directus.bmulti.store/assets/1cc8f31f-100a-44a4-a422-c090f3589245
1096	2025-08-09 07:59:07.417398+00	6761122673	77.82.162.158	t	t	done	200 рублей	OZON	79954939852	https://directus.bmulti.store/assets/af9e9556-d788-4cf5-9174-2c34a384667c	https://directus.bmulti.store/assets/60338e83-174f-405e-bf40-397bccbe611c
1088	2025-08-08 15:21:40.238507+00	1154396090	37.212.12.93	t	t	done	200 рублей	WB	79203012163	https://directus.bmulti.store/assets/2e58e9b9-1ed7-440c-adfc-818fc45101c7	https://directus.bmulti.store/assets/a46f95cc-7e75-482a-a1c4-84a5bb79000a
1117	2025-08-10 19:02:13.889467+00	1553155603	188.162.64.251	t	t	check	200 рублей	OZON	79210943065	https://directus.bmulti.store/assets/143b8c79-5e0d-4080-b198-cc344611d597	https://directus.bmulti.store/assets/3a8bad6f-b09a-4ec2-a28b-0bde6c04e2e7
1113	2025-08-10 15:31:39.224461+00	1546036091	176.59.43.172	t	t	done	200 рублей	OZON	895114242382	https://directus.bmulti.store/assets/47db7e4b-779c-4549-a3ef-4ecb11ef0809	https://directus.bmulti.store/assets/f32d08d4-d722-4191-b46d-b12a11b9444a
1087	2025-08-08 14:39:20.844043+00	496952605	83.234.207.17	t	t	done	200 рублей	OZON	79602950256	https://directus.bmulti.store/assets/cefc4f37-1cb7-4cba-817f-b340d4f8be36	https://directus.bmulti.store/assets/39f9002a-8cc9-47a0-9dd3-cc193c8c9b75
1111	2025-08-10 13:25:35.273676+00	413117996	178.213.200.159	t	t	done	200 рублей	OZON	79827352800	https://directus.bmulti.store/assets/27624c18-ef89-4fa6-89e8-ee64148633ae	https://directus.bmulti.store/assets/96c247d6-9692-45e6-8638-b264d4a1e205
1124	2025-08-11 16:01:52.768067+00	5156548727	185.185.50.66	t	t	check	200 рублей	OZON	95256649432	https://directus.bmulti.store/assets/82bf29f5-c065-4667-9d79-61326e0423c7	https://directus.bmulti.store/assets/632cbd61-ea3f-449c-b54b-f8f3c9af2992
1121	2025-08-11 09:18:06.81701+00	5019198504	185.15.38.85	t	t	done	200 рублей	OZON	79184943844	https://directus.bmulti.store/assets/765d144f-4a19-447b-969c-d4bc386f1077	https://directus.bmulti.store/assets/006e8bc9-6fdd-4e6a-9f43-894e384b07a6
1119	2025-08-11 02:35:57.135264+00	424278416	46.17.102.180	t	t	done	200 рублей	OZON	79086367188	https://directus.bmulti.store/assets/27b105e4-4ba0-4a8b-95a1-6dadc60914cc	https://directus.bmulti.store/assets/8cac4aeb-dad3-4564-9a7e-2e5e225dc436
1130	2025-08-12 04:52:53.926113+00	5244693418	213.59.139.66	t	t	check	200 рублей	WB	279539113385	https://directus.bmulti.store/assets/20f7fa0a-5ffd-482d-9ca9-36c5a081c49b	https://directus.bmulti.store/assets/41a05f02-acde-4958-8455-b4d32411505b
1132	2025-08-12 09:12:26.073942+00	8126235539	37.212.6.106	t	f	check	200 рублей	WB	375298175808	https://directus.bmulti.store/assets/69e261f0-a278-4239-a38e-93a31a462ab4	https://directus.bmulti.store/assets/3add39d5-0bea-412c-b2ab-b51e47a56f7b
1134	2025-08-12 09:59:34.425327+00	5045952188	37.212.6.106	t	t	check	200 рублей	WB	79253130020	https://directus.bmulti.store/assets/d46b3adb-6e1f-4914-9b38-a1a54d37686a	https://directus.bmulti.store/assets/685d397d-613e-4442-84da-1f4f9c3b47d6
1135	2025-08-12 11:58:57.140413+00	1163071816	31.8.17.128	t	t	check	200 рублей	OZON	2048831	https://directus.bmulti.store/assets/1ebedd64-db0b-408b-bffc-2232105a2410	https://directus.bmulti.store/assets/997cbaa5-c5f7-47a2-a056-9585b07902b7
1136	2025-08-12 12:21:04.004915+00	5802445004	176.59.215.132	t	t	check	200 рублей	OZON	289088667219	https://directus.bmulti.store/assets/bfa66fcd-32bf-4b99-b055-da4d9e90c9d5	https://directus.bmulti.store/assets/49259d88-95be-42da-914b-ea273844d800
1137	2025-08-12 13:18:24.041288+00	7574195318	188.17.208.189	t	t	check	200 рублей	WB	279049379193	https://directus.bmulti.store/assets/a89cbd5f-0018-4f7d-86a1-ae18699474f4	https://directus.bmulti.store/assets/e5db3f7c-9d60-42dc-99f8-0d8f98ab8393
1133	2025-08-12 09:21:43.082822+00	660093950	185.253.41.212	t	t	done	200 рублей	OZON	79493736492	https://directus.bmulti.store/assets/8617bd7d-f486-49fb-8d3b-a0cf1d6dfba6	https://directus.bmulti.store/assets/633e4501-26f4-45c3-8946-1b618a81e400
1139	2025-08-12 14:39:20.982389+00	5295863442	93.178.81.151	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/68303596-233a-499d-b143-59df6b0eef48	https://directus.bmulti.store/assets/38eb0fad-4745-4565-9ca5-ffd605844d20
1144	2025-08-12 17:23:13.554377+00	\N	107.151.217.221	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1145	2025-08-12 17:23:15.07898+00	\N	107.151.217.221	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1099	2025-08-09 09:00:23.037745+00	2002451620	5.128.146.33	t	t	done	200 рублей	OZON	79529219860	https://directus.bmulti.store/assets/591cd559-0781-4860-82db-26360c1ef81c	https://directus.bmulti.store/assets/d2401b51-fa4a-4155-8e95-f670c4809496
1128	2025-08-11 22:24:59.578279+00	2097584837	176.59.35.108	t	t	done	200 рублей	OZON	279539635196	https://directus.bmulti.store/assets/5784055c-39c6-40d7-b9f8-8e45803b81b9	https://directus.bmulti.store/assets/a1e3ee85-6cce-4f6f-ad23-5aa17252d8dd
1138	2025-08-12 13:47:51.508337+00	1228283466	176.59.168.227	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/fb72cf42-a2d6-41bb-9279-7ab4dfd0da0f	https://directus.bmulti.store/assets/54059072-9c40-4674-914f-c2e9c2523892
1126	2025-08-11 19:38:23.247958+00	1021258241	176.109.249.31	t	t	done	200 рублей	OZON	79591996482	https://directus.bmulti.store/assets/48358c82-0ffe-458e-8520-d4090126a801	https://directus.bmulti.store/assets/58f9aa73-43d4-4d85-8be9-e2ddc9de414b
1000	2025-08-03 19:11:42.68897+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1001	2025-08-03 19:13:57.446653+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1002	2025-08-03 19:13:58.537875+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1003	2025-08-03 19:14:09.722499+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1004	2025-08-03 19:14:11.098771+00	\N	194.49.53.146	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1006	2025-08-04 01:29:06.604275+00	646522059	91.192.20.104	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/64ed7125-48a3-4529-a9c6-e77686c94a98	https://directus.bmulti.store/assets/631ae41b-5157-44d3-a090-bd11c682d310
1028	2025-08-05 09:54:08.776492+00	407239227	91.84.97.187	t	t	done	200 рублей	OZON	79110869133	https://directus.bmulti.store/assets/35df3038-0e79-43e4-a729-fe5bb276e2da	https://directus.bmulti.store/assets/35e1ba90-f065-4f98-b046-b75f00e3a4f4
1007	2025-08-04 08:14:09.159081+00	1122149806	176.59.96.113	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/67ecc50b-76e1-49de-810e-d3285db82f80	https://directus.bmulti.store/assets/25dd5192-02f5-4c22-a2d3-45685ffe1262
1012	2025-08-04 09:17:41.393167+00	1399578414	37.212.16.6	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/c29bf98f-e241-442e-acd2-34743b7b208a	https://directus.bmulti.store/assets/28cce724-5428-4106-9165-91cd1ab77f84
1008	2025-08-04 08:28:18.28372+00	747516600	45.130.7.112	t	t	check	200 рублей	OZON	77085332318	https://directus.bmulti.store/assets/e476e828-fc6e-438e-bbe0-0f636c8f95cd	https://directus.bmulti.store/assets/674a1c14-5919-4acf-bed0-f97c428a41ba
1009	2025-08-04 08:30:27.0965+00	844382493	46.172.32.145	t	t	check	200 рублей	WB	79038853759	https://directus.bmulti.store/assets/3a3953f3-0af5-443a-8e8b-a398c938c26b	https://directus.bmulti.store/assets/578722eb-6024-4a98-b37d-a3e4bd5f62c7
1010	2025-08-04 08:37:11.886979+00	7082118731	46.172.32.145	t	t	check	200 рублей	WB	79202020894	https://directus.bmulti.store/assets/e9a2d96a-9647-4727-8bdd-3bd7a52d0f25	https://directus.bmulti.store/assets/bf4bfc84-cf3b-421e-ba0f-ab1db0fc7628
1011	2025-08-04 09:02:13.00984+00	6491603119	78.25.76.140	t	t	check	200 рублей	OZON	79517341109	https://directus.bmulti.store/assets/5c4d3492-6d00-423f-8ac9-e69d50b2deee	https://directus.bmulti.store/assets/22d026ac-50be-4271-a73f-75c9059e9087
1013	2025-08-04 12:03:09.978142+00	274876229	79.127.239.84	t	t	check	200 рублей	OZON	79163219437	https://directus.bmulti.store/assets/c170ade0-4e1f-41e8-9ebd-1c36c79b50e6	https://directus.bmulti.store/assets/750c3ff2-32c2-4b05-ad8e-8ceef801310f
1016	2025-08-04 14:38:58.503253+00	973498517	188.170.75.233	t	f	check	200 рублей	OZON	79676515545	https://directus.bmulti.store/assets/fa71185e-d129-486a-95cb-809195d19c44	https://directus.bmulti.store/assets/fb899138-84f4-47dc-b3e1-b7201259e32f
1018	2025-08-04 17:00:52.720841+00	1593586555	195.209.160.13	t	t	check	200 рублей	WB	79062144657	https://directus.bmulti.store/assets/ec8ea271-bb5b-47da-9b50-5bbd6e97462d	https://directus.bmulti.store/assets/5d78d5de-0bd8-4662-a755-135787aab70e
1022	2025-08-04 18:29:37.126423+00	7048079122	109.126.175.136	t	f	check	200 рублей	OZON	375259924979	https://directus.bmulti.store/assets/2a4b262b-eae4-4d28-b960-6ff3ccb73df5	https://directus.bmulti.store/assets/1ad31007-44c8-42ea-84c0-71dbc9602f3f
1023	2025-08-04 18:33:53.045615+00	1275910038	37.113.32.1	t	t	check	200 рублей	WB	79996104358	https://directus.bmulti.store/assets/330edd91-4c44-44a5-aac2-7ffb466e6e32	https://directus.bmulti.store/assets/c69d2f2e-4eee-4f9d-a920-03ff50cd8ab9
940	2025-08-01 08:58:11.876897+00	668359309	212.34.146.173	t	t	done	200 рублей	WB	79397155399	https://directus.bmulti.store/assets/c3a9c313-659a-4740-92d7-9576bc2bbebb	https://directus.bmulti.store/assets/c315fba3-0462-4e09-b947-43b0d4e67a24
939	2025-08-01 05:42:45.083552+00	5266198984	185.92.139.90	t	t	done	200 рублей	WB	79789247170	https://directus.bmulti.store/assets/bd0a3b38-6275-4e9c-93fb-0a4e64e58749	https://directus.bmulti.store/assets/cbb24f6a-32f3-417d-9a13-c92903564d32
1026	2025-08-05 07:53:03.834079+00	1384759893	91.243.102.204	f	t	check	200 рублей	OZON	79885869834	https://directus.bmulti.store/assets/ea382681-d021-4b53-a21a-04364e86f76d	https://directus.bmulti.store/assets/3d1ed784-7cd6-4e3d-ad21-97ef7c36d792
1024	2025-08-04 19:49:06.159908+00	339542982	94.25.229.241	f	f	done	200 рублей	OZON	79963414038	https://directus.bmulti.store/assets/d538fab0-6ad2-497e-849e-8cb0d5dff6e4	https://directus.bmulti.store/assets/0c83c16f-c032-47f3-8ae9-db3f722af7aa
1005	2025-08-03 22:01:08.867746+00	1322304232	79.173.93.34	t	f	done	500 рублей	OZON	\N	https://directus.bmulti.store/assets/f11f47ad-a915-45f5-a0de-02329089ad0e	https://directus.bmulti.store/assets/01fc6611-d8bc-4e40-b37d-4752b90033fb
1025	2025-08-04 20:17:02.980308+00	1911358616	185.201.252.96	t	t	done	300 рублей	WB	79775873312	https://directus.bmulti.store/assets/75fa097f-8c21-49ba-a7c1-1fa1d63d3fd8	https://directus.bmulti.store/assets/c4fa84e4-e48d-4222-8c49-22a40d0d7c5d
1021	2025-08-04 18:13:43.028332+00	6661369414	213.87.152.180	t	t	done	200 рублей	OZON	79167042401	https://directus.bmulti.store/assets/2b42b97a-c8fb-4e42-a8d0-55f07a2cf869	https://directus.bmulti.store/assets/e62477d3-528a-417b-8477-9c832826215a
1020	2025-08-04 17:57:36.319092+00	7692011728	3.85.137.152	t	t	done	200 рублей	OZON	279772829824	https://directus.bmulti.store/assets/877b48f5-4f2e-45b9-9132-36efdf1a55d9	https://directus.bmulti.store/assets/f8eb6fde-f53c-4943-9716-17cf034b7a3d
1019	2025-08-04 17:56:21.408259+00	654249373	94.25.169.162	t	t	done	200 рублей	WB	79055105561	https://directus.bmulti.store/assets/570fae22-0824-4640-9c0e-ecf88bf1219d	https://directus.bmulti.store/assets/82fa737b-4c17-4bec-83ac-dd0b5cc02e69
1017	2025-08-04 15:11:27.891605+00	5834513416	46.56.61.28	t	t	done	200 рублей	WB	79912783955	https://directus.bmulti.store/assets/f7403c6f-7daa-4071-acf3-33e2afc93c5c	https://directus.bmulti.store/assets/68d3148e-ee9a-4abc-acfa-e9c4971e5c1f
1015	2025-08-04 13:25:59.250145+00	5418274988	62.210.99.197	t	t	done	200 рублей	WB	79788064424	https://directus.bmulti.store/assets/e4d6147a-3479-4810-8627-fd0f11e5dd66	https://directus.bmulti.store/assets/a2e1bad5-c1ac-4676-8dc7-fcfef11caca4
1014	2025-08-04 13:14:46.203078+00	1745943271	185.77.216.7	t	t	done	200 рублей	WB	79087756416	https://directus.bmulti.store/assets/9f17dbdd-953d-469f-9b34-5301594e0a18	https://directus.bmulti.store/assets/d3049d91-eb48-49eb-845e-6504bdd032d0
1027	2025-08-05 09:39:58.696815+00	5151368533	193.203.105.67	t	t	done	200 рублей	OZON	79591220016	https://directus.bmulti.store/assets/03dd0e08-b5f6-4bd3-ae06-25939c13e3e4	https://directus.bmulti.store/assets/34df95bc-6e8d-4f19-81f8-49eb4d211b07
2073	2025-10-11 08:36:19.559496+00	6586925524	95.27.67.33	t	t	check	200 рублей	WB	79291858183	https://directus.bmulti.store/assets/e9e9a3dd-87ab-4de1-bc6f-9578e4dc4b6c	https://directus.bmulti.store/assets/34b17090-c983-46f7-900e-dfb3612364a3
1845	2025-09-29 12:42:24.574137+00	5728444127	176.59.9.208	t	t	check	200 рублей	WB	79005420200	https://directus.bmulti.store/assets/4688c9b7-4ee5-4b2c-b559-b72a03adef17	https://directus.bmulti.store/assets/c2b7aa44-e027-49ea-9e70-0830ecd17061
1036	2025-08-05 18:22:39.610439+00	609712534	109.196.194.172	t	t	done	200 рублей	WB	79186630151	https://directus.bmulti.store/assets/7b55ff74-bee9-4d1d-9770-2704d1a7e62f	https://directus.bmulti.store/assets/7a347e7d-c0c4-4473-864a-c9a561ad22de
1032	2025-08-05 13:14:45.638726+00	786342878	188.162.0.14	t	t	check	300 рублей	WB	79963784792	https://directus.bmulti.store/assets/1f679cdb-b354-493d-893d-9b5839476915	https://directus.bmulti.store/assets/e676c068-fdc5-4d0b-969b-6521b2189c30
1037	2025-08-05 18:26:22.076083+00	425702015	31.135.122.107	t	t	check	200 рублей	OZON	79785715066	https://directus.bmulti.store/assets/77817bf0-d505-4b52-bd47-f6b0ba99a092	https://directus.bmulti.store/assets/84f7bdc4-9f87-4c98-a55f-da521631bf2f
1034	2025-08-05 18:00:38.764917+00	5381930863	37.112.99.188	t	f	check	200 рублей	WB	79009691694	https://directus.bmulti.store/assets/48069b18-d707-4645-b0ce-212ad50d094d	https://directus.bmulti.store/assets/0dd0f624-a782-4234-b65f-6c60b9ba5bf0
1035	2025-08-05 18:15:04.012259+00	902588708	46.159.24.38	t	t	done	200 рублей	WB	79898274991	https://directus.bmulti.store/assets/5a9874a9-110b-4419-aa0b-fb5b0093f3f6	https://directus.bmulti.store/assets/9f261afa-8bd8-4c7e-9d06-246ba7724815
1038	2025-08-05 18:28:27.372292+00	5666333326	188.243.155.84	t	t	check	200 рублей	OZON	79300081896	https://directus.bmulti.store/assets/493cc141-d314-4f04-a2db-bee7363fa8ad	https://directus.bmulti.store/assets/0b231f40-8bde-48ba-be77-abfadeae63fb
1031	2025-08-05 13:10:35.761662+00	5832315386	217.138.253.121	t	t	done	200 рублей	OZON	79004719351	https://directus.bmulti.store/assets/dd8af107-e1c5-4962-9649-7811935d480b	https://directus.bmulti.store/assets/ef209add-ac97-4f09-a672-96ce727dbcf3
1041	2025-08-06 08:21:10.156758+00	1998569813	185.92.139.54	t	t	check	200 рублей	WB	79780815724	https://directus.bmulti.store/assets/92ed7261-c207-4ac9-a32a-ccec11d9be96	https://directus.bmulti.store/assets/9ff0a5a1-8c54-4860-a65c-b7e81d2f6a76
1029	2025-08-05 09:54:43.477196+00	1126803375	5.44.170.155	t	t	done	200 рублей	OZON	79635261488	https://directus.bmulti.store/assets/de58283e-d250-4705-8de6-f510797087ef	https://directus.bmulti.store/assets/5cf9dcf0-3cb2-499b-abcd-1f95832aa95c
1040	2025-08-05 20:10:33.792874+00	845409490	5.141.91.200	t	t	done	200 рублей	WB	79874461388	https://directus.bmulti.store/assets/8c1a7cfd-9d87-46fc-af44-9b08ebb73f7e	https://directus.bmulti.store/assets/61d7b12b-24cd-4961-8d88-9e5ea6764060
1047	2025-08-06 10:08:40.68973+00	6249442665	213.87.157.224	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/4d191091-ddf7-4925-a28c-02de0fb415f1	https://directus.bmulti.store/assets/791852bc-5559-4fdb-a44f-225318b1b103
1042	2025-08-06 10:04:41.432601+00	872901033	213.87.144.79	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/bc88d359-f368-404e-8ebe-128cab5b5968	https://directus.bmulti.store/assets/39ae7c82-bf12-4851-9ddd-b50114427cae
1043	2025-08-06 10:06:38.399895+00	6249442665	213.87.157.224	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/f292096a-c57f-4a8f-955b-640692771904	https://directus.bmulti.store/assets/cd7758fa-8730-4eb2-b44e-a485474be2c9
1044	2025-08-06 10:06:43.77072+00	6249442665	213.87.157.224	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/a779c0bc-27f9-487b-8959-3bf2993cfd44	https://directus.bmulti.store/assets/54b3f98d-aea2-4c3e-8cab-9430db558091
1045	2025-08-06 10:06:48.062299+00	6249442665	213.87.157.224	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/246b65f3-4d97-4dd9-b947-f39b9fbb2b25	https://directus.bmulti.store/assets/ad62f56b-1408-4377-afe5-075664e95407
1046	2025-08-06 10:06:55.561702+00	6249442665	213.87.157.224	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/26e71457-d515-45fe-96ed-22ce4300ae90	https://directus.bmulti.store/assets/a6387c27-64ff-4650-89fd-7f1288b134b0
1048	2025-08-06 10:08:48.622339+00	6249442665	213.87.157.224	f	f	check	200 рублей	OZON	79104081774	https://directus.bmulti.store/assets/26fd79a6-bb3c-4872-a7bc-512173d05ad1	https://directus.bmulti.store/assets/ac7d1f31-98bd-4707-b59c-829ab1f8078e
1049	2025-08-06 11:26:07.890671+00	1639158519	91.149.74.194	t	t	check	500 рублей	WB	279000540248	https://directus.bmulti.store/assets/5aa9b7ce-c88d-44de-bc37-c3097c1e0d81	https://directus.bmulti.store/assets/352ad779-a70a-4cf4-9896-225b11c7b6a4
1052	2025-08-06 12:50:45.659906+00	7507987879	178.34.137.44	t	t	check	200 рублей	WB	79135755641	https://directus.bmulti.store/assets/f2b9ef26-068a-4c06-8d43-c749fc47539f	https://directus.bmulti.store/assets/a20e5e53-67b1-419e-ba1a-35b6acb61232
1053	2025-08-06 17:40:56.408568+00	1641559300	150.129.10.186	t	t	check	200 рублей	OZON	79178941015	https://directus.bmulti.store/assets/ba056ba7-eb9d-42c6-9bb9-44def12d66e6	https://directus.bmulti.store/assets/11f88084-8bff-41e9-9854-afc6237f5315
1054	2025-08-06 18:51:06.948499+00	314565465	77.50.250.42	t	t	check	200 рублей	WB	79166500070	https://directus.bmulti.store/assets/81a2bc56-91d7-4eca-89a0-c66721ecb8d3	https://directus.bmulti.store/assets/3654302f-438b-45ac-9b5f-1a402b84e52c
1056	2025-08-06 19:40:49.502995+00	1208292820	85.140.1.109	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/5558095d-36f7-47da-bcf9-81e5879fe3c0	https://directus.bmulti.store/assets/22b1bc3b-d717-4f3c-bc87-84c61328673b
1057	2025-08-06 19:40:54.842499+00	1208292820	85.140.1.109	f	f	check	200 рублей	YANDEX	79875433872	https://directus.bmulti.store/assets/3f7f848a-deb6-4b05-bd67-eb66306ba413	https://directus.bmulti.store/assets/9fce34af-f9e8-4eab-9647-2ef993759932
1058	2025-08-06 20:01:12.668605+00	5143643502	178.120.8.163	t	t	check	200 рублей	WB	375298688782	https://directus.bmulti.store/assets/f7b51bb3-79a1-49b4-9152-452d6acb588d	https://directus.bmulti.store/assets/0255d2ac-baf4-43ba-a28e-9613d45b7c34
1055	2025-08-06 18:52:41.13839+00	755289831	5.18.252.167	t	t	done	200 рублей	OZON	79119540491	https://directus.bmulti.store/assets/57cba902-9592-458f-a243-d1ae58864052	https://directus.bmulti.store/assets/bb896e60-a820-4542-8d2e-c11b45e3f628
1050	2025-08-06 11:50:21.577421+00	1039046877	146.158.97.8	t	t	done	200 рублей	OZON	79069399398	https://directus.bmulti.store/assets/606660d7-faf1-4fa0-90cd-15f485c63868	https://directus.bmulti.store/assets/3cbd9534-f726-489f-8667-555603255bc2
1051	2025-08-06 12:06:18.799467+00	6884020670	194.38.2.63	t	t	done	200 рублей	WB	79788064424	https://directus.bmulti.store/assets/1016febd-261a-4987-94d0-5220874f506d	https://directus.bmulti.store/assets/b1b8f4d5-34e4-494c-9f53-2c0988cfbc94
1033	2025-08-05 17:56:17.330642+00	952178602	188.134.68.121	t	t	done	200 рублей	OZON	79934800274	https://directus.bmulti.store/assets/22da0d7c-f1a0-4eb2-a315-7a0a30c52447	https://directus.bmulti.store/assets/37e09447-fc33-481a-9d95-32ed6f77a4b8
1039	2025-08-05 19:34:32.787703+00	5271896551	107.151.195.145	t	t	done	200 рублей	WB	79610084083	https://directus.bmulti.store/assets/e406c9cc-b660-4a61-9348-4941448ff887	https://directus.bmulti.store/assets/da3693fc-0075-46a9-a188-cda36e1d3ce0
1084	2025-08-08 11:41:18.464851+00	965588869	95.26.192.210	t	t	done	200 рублей	OZON	79086660037	https://directus.bmulti.store/assets/353a1af5-8ad4-4819-a365-604d7ce80b0d	https://directus.bmulti.store/assets/fe3c04a3-d842-4718-bcc3-c5ba0e7f5126
1079	2025-08-08 03:48:32.119467+00	5174644392	62.133.169.181	t	t	done	200 рублей	WB	79656584099	https://directus.bmulti.store/assets/06809edc-5e27-4ba4-8d01-432e9238f0b1	https://directus.bmulti.store/assets/8473bca1-5249-44a2-b6c4-d325565e74eb
1060	2025-08-07 06:04:48.603574+00	\N	85.140.163.241	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1061	2025-08-07 06:06:23.643588+00	\N	85.140.163.241	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1075	2025-08-07 18:05:54.868466+00	613854888	95.72.198.53	t	t	done	200 рублей	OZON	79175546993	https://directus.bmulti.store/assets/90997200-555b-46f8-9bd6-513a8d4e391f	https://directus.bmulti.store/assets/01bb4fd9-0232-42c1-883f-4121e368f452
1073	2025-08-07 17:50:09.786373+00	142311555	213.165.32.176	t	t	done	200 рублей	OZON	79262727685	https://directus.bmulti.store/assets/41c3fe7c-d497-4492-a3b8-18df23df6a40	https://directus.bmulti.store/assets/6c9739cf-5937-4a4a-9442-7ed0d90db1af
1071	2025-08-07 15:54:50.103715+00	6501054550	217.66.154.105	t	t	done	200 рублей	YANDEX	79114522282	https://directus.bmulti.store/assets/554ed16e-87ec-4dcd-8346-d66bac34fa1e	https://directus.bmulti.store/assets/4df25698-712f-46b8-96d8-0a1932103481
1062	2025-08-07 13:02:55.998829+00	7702783104	5.166.25.213	t	f	check	200 рублей	OZON	79088521859	https://directus.bmulti.store/assets/dacc79b1-1ba2-45fb-beef-7da83c5969b0	https://directus.bmulti.store/assets/a7e5c3a7-03f7-4820-b8b2-379971be8810
1070	2025-08-07 15:46:33.009922+00	670557675	212.164.65.216	t	t	done	200 рублей	WB	79830284077	https://directus.bmulti.store/assets/8bf1c96b-305d-4dbe-817a-46bb3b0ea37d	https://directus.bmulti.store/assets/5087e215-c35d-4b4e-aa2b-b4bf1fa27854
1069	2025-08-07 15:00:34.876956+00	527688908	139.59.133.152	t	t	done	200 рублей	WB	79035404242	https://directus.bmulti.store/assets/947c40ba-0d3d-4f69-bdf0-772264c6fe2c	https://directus.bmulti.store/assets/b63f21e2-0de5-4aad-a1f7-dbdbd3f20ed4
1063	2025-08-07 13:27:09.696383+00	6276870884	45.93.157.221	t	t	check	500 рублей	WB	79232987896	https://directus.bmulti.store/assets/fc8b4b2b-e0d0-4079-9672-c6469f40cfb4	https://directus.bmulti.store/assets/eab3e41d-f0a6-42dd-9efc-6efc6340b7aa
1065	2025-08-07 14:39:51.081244+00	896263076	94.141.126.199	t	t	done	200 рублей	OZON	79964065889	https://directus.bmulti.store/assets/d895a583-46fa-43eb-914b-8866dcc1de7d	https://directus.bmulti.store/assets/65e3a32e-f922-4b72-bf15-dc789bbebb50
1067	2025-08-07 14:47:31.243594+00	5901198717	95.32.248.112	t	t	done	200 рублей	WB	79623256833	https://directus.bmulti.store/assets/45d160c3-a11c-4e10-9396-b83d95328913	https://directus.bmulti.store/assets/9b3b5946-7745-42e1-93ca-cef0fa8372fc
1064	2025-08-07 14:07:14.086243+00	654249373	94.25.170.60	t	t	check	200 рублей	WB	89055105561	https://directus.bmulti.store/assets/1801f058-9736-4544-8662-d44013b717af	https://directus.bmulti.store/assets/ab63f362-5b10-48cc-aebb-1a54e4bb08ef
1240	2025-08-17 11:27:49.586896+00	5221130966	188.17.219.107	t	t	done	200 рублей	OZON	79193505020	https://directus.bmulti.store/assets/70f2b7d5-6331-49e1-854e-e4a860916653	https://directus.bmulti.store/assets/4f6dca6c-df0b-46b7-883b-fcd7e1fe9fd9
1097	2025-08-09 08:41:59.7228+00	5726624562	213.109.49.102	t	t	check	200 рублей	WB	79090021691	https://directus.bmulti.store/assets/ece99362-19c0-421d-b624-26e068758e02	https://directus.bmulti.store/assets/295aca3f-80d8-4c86-9cca-f6b80862acdd
1093	2025-08-08 17:41:34.754353+00	7775808527	85.249.18.48	t	t	done	200 рублей	OZON	79611175758	https://directus.bmulti.store/assets/433ce392-13c3-4408-bc36-da57d910e301	https://directus.bmulti.store/assets/80853136-3a01-466c-9a10-c008658c2457
1082	2025-08-08 10:29:44.726076+00	1584589666	109.107.179.133	t	t	done	200 рублей	WB	79185643154	https://directus.bmulti.store/assets/3df01361-f23d-433e-a6ac-2c14fac09290	https://directus.bmulti.store/assets/4e492ec7-dca3-41c3-b862-279a5590fa99
1066	2025-08-07 14:45:04.468134+00	5965171793	176.96.191.81	t	f	check	300 рублей	OZON	79493581905	https://directus.bmulti.store/assets/8c07d9bd-d81f-45a6-85e7-bf8138908f02	https://directus.bmulti.store/assets/22b49f93-3291-43dc-84b7-ed3c42286cce
1086	2025-08-08 13:28:54.301688+00	795144367	62.84.99.244	t	t	done	200 рублей	OZON	79503283378	https://directus.bmulti.store/assets/cc5abf4a-6fa8-44ef-9e77-9ebffe8b50db	https://directus.bmulti.store/assets/94fed518-d689-4725-ad8c-596ddffbfb0a
1081	2025-08-08 09:01:19.296791+00	6486890331	89.254.246.232	t	t	done	200 рублей	WB	79583953399	https://directus.bmulti.store/assets/19fb5dde-5f70-4462-ab35-1ab01a5be53b	https://directus.bmulti.store/assets/0c28bee6-ce64-4cee-9e81-f10f43f57b6e
1059	2025-08-07 04:06:56.01764+00	5412149237	91.221.174.149	t	t	done	200 рублей	OZON	79105036274	https://directus.bmulti.store/assets/57dbc4c2-0f62-4983-b2d5-5265d5d22f3e	https://directus.bmulti.store/assets/e35dbb35-1540-4431-9bca-407828ff88a9
1068	2025-08-07 14:57:56.680488+00	1269484508	178.176.77.98	t	t	done	200 рублей	OZON	79372626044	https://directus.bmulti.store/assets/b6131743-222a-4c65-a779-28ed2f8f80f0	https://directus.bmulti.store/assets/d1b45074-01dd-4d79-ac51-6accdf50ef29
1617	2025-09-16 17:59:46.558454+00	2059170681	212.124.7.169	t	t	check	200 рублей	OZON	289016931226	https://directus.bmulti.store/assets/e7ca3218-03ea-42b8-a9e7-4529eb9819bc	https://directus.bmulti.store/assets/6a83bb2f-63f1-4409-8b6a-52ab06004f76
1072	2025-08-07 16:58:24.950857+00	754363163	94.25.237.249	t	t	check	200 рублей	OZON	79992247455	https://directus.bmulti.store/assets/97b7dfe2-3868-4b97-a3c9-2ce1fc4ad27e	https://directus.bmulti.store/assets/540fafa1-40f2-41f9-8675-020a4df6d82a
1074	2025-08-07 17:51:52.979326+00	5570872408	178.121.132.205	t	t	check	200 рублей	WB	9112380173909401	https://directus.bmulti.store/assets/e3e535d7-d1c7-484f-b723-66f69af5ee57	https://directus.bmulti.store/assets/fd01c10a-6c84-427d-974c-290f1004ceba
1077	2025-08-07 18:12:45.31918+00	5191032136	95.25.208.251	t	t	check	200 рублей	WB	98009159522	https://directus.bmulti.store/assets/11f60ac0-9db4-4d10-8b28-6b154019dfb8	https://directus.bmulti.store/assets/628ff114-588b-44f4-9ac3-e1263a2c5739
1078	2025-08-07 18:51:41.460011+00	6275564984	95.179.123.166	t	t	check	200 рублей	OZON	79205411103	https://directus.bmulti.store/assets/3c5ddd62-ff01-4e30-8392-7b0bd4646aba	https://directus.bmulti.store/assets/a89c98b1-3956-42e9-9469-f80f1f9be114
1080	2025-08-08 05:01:41.066256+00	5494593034	109.232.229.61	t	t	check	200 рублей	WB	79993590060	https://directus.bmulti.store/assets/e07909c9-b1fb-4f50-9ffe-5db44b703e28	https://directus.bmulti.store/assets/43b9474c-69dd-4e88-b814-9ca5151e0a07
1083	2025-08-08 10:47:10.481602+00	7789223585	185.117.151.175	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/c94f87d5-5929-4577-9c64-379b30e48ffd	https://directus.bmulti.store/assets/fd949f67-1633-4b25-8f39-e2648f2690af
1085	2025-08-08 12:26:27.009005+00	5942187429	188.170.73.54	t	t	check	200 рублей	OZON	79816853190	https://directus.bmulti.store/assets/2390f739-4c77-4e08-ab76-bdad44cef4c4	https://directus.bmulti.store/assets/9bb209c3-da9d-42ae-ba0c-a53bbe662664
1237	2025-08-17 06:37:43.044439+00	5485387450	176.116.187.28	t	t	check	200 рублей	WB	79953731195	https://directus.bmulti.store/assets/79eb6568-50b6-440a-8e1d-36c44894ffa3	https://directus.bmulti.store/assets/9601f246-f3d6-4d58-af16-5a5fcb3c6031
1140	2025-08-12 14:40:09.900093+00	1232403118	93.178.81.151	f	f	check	200 рублей	OZON	79920408075	https://directus.bmulti.store/assets/fbee2dc5-7db6-4c84-85f3-8af54ed443e9	https://directus.bmulti.store/assets/48d39717-325d-404f-a5e3-a91131bfa9b8
1423	2025-08-31 15:01:08.488998+00	7054772531	212.162.152.46	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/3255e187-ff22-42ab-a227-41b57ec8b359	https://directus.bmulti.store/assets/4a6c65a9-c95d-405f-8025-f1e7a201933a
1241	2025-08-17 11:57:22.201676+00	1134235765	176.59.210.119	t	f	check	200 рублей	WB	79538348302	https://directus.bmulti.store/assets/d7ae2ea7-adda-4f35-8ad8-605a870afbb9	https://directus.bmulti.store/assets/061684af-1c06-4bff-99d1-f2fa71175973
1244	2025-08-17 12:51:29.21012+00	929776274	37.215.33.25	t	t	check	200 рублей	WB	375291718657	https://directus.bmulti.store/assets/811f402e-0633-457a-b0be-9fe2c24f74bc	https://directus.bmulti.store/assets/5f5a0052-0610-4f1a-89c3-8cc7f308e441
1143	2025-08-12 16:33:19.558759+00	1593397761	151.0.18.91	t	t	check	200 рублей	OZON	79499830651	https://directus.bmulti.store/assets/b9ec9c7e-2c63-4eda-979e-ce1b838bad30	https://directus.bmulti.store/assets/c1492dcd-bb52-4401-b873-1a8af726cd67
1150	2025-08-12 18:20:55.600083+00	901539379	176.60.50.98	t	t	check	200 рублей	WB	375292222118	https://directus.bmulti.store/assets/c3724433-7acb-41cd-82d7-9a27f01fdc1e	https://directus.bmulti.store/assets/4472dd7a-6d32-4131-8928-840ecd25ff84
1248	2025-08-17 14:11:37.591359+00	6084481017	94.25.229.177	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/ffd0c05b-0197-47b8-8b72-6dec033aaf86	https://directus.bmulti.store/assets/29f5494c-4a27-41ce-a59c-976ecb0a0b26
1148	2025-08-12 17:30:30.980626+00	1179586901	46.56.172.182	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/96a29db3-4b7e-4eef-9fae-cb804481e79a	https://directus.bmulti.store/assets/4e76c349-0315-4413-a400-a9e8d6aa5f55
1252	2025-08-17 17:10:20.900931+00	5208034345	85.193.67.238	t	f	check	200 рублей	WB	79786913644	https://directus.bmulti.store/assets/36771bdf-1f05-4a1e-bd9e-be49c1a21ed5	https://directus.bmulti.store/assets/1c3cc879-41c3-4b61-b1eb-8440649909bc
1149	2025-08-12 17:46:24.239994+00	5818253603	188.162.181.14	t	t	check	200 рублей	WB	79962523544	https://directus.bmulti.store/assets/b5cc628f-0e48-4a21-91f1-a342b876f684	https://directus.bmulti.store/assets/251ed4b3-2939-433b-9c82-929a376f18f1
1151	2025-08-13 05:17:10.308106+00	505918523	108.181.70.23	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/04a3e707-9f25-4310-86b2-e0d5d21c5717	https://directus.bmulti.store/assets/ffbd718d-c36b-42cd-a568-c50996a7cc47
1254	2025-08-17 17:57:53.402692+00	\N	89.110.71.191	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1255	2025-08-17 18:15:08.009263+00	1489335694	185.150.12.118	t	t	check	200 рублей	WB	79178546917	https://directus.bmulti.store/assets/f128ec39-3e68-423b-8867-0f152e3739f6	https://directus.bmulti.store/assets/712a3452-7827-47ac-bb27-418df837fe3b
1256	2025-08-18 08:07:01.388606+00	7977151408	176.59.131.239	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/6c5ae374-6955-444d-a6d0-2eaaed3d88ad	https://directus.bmulti.store/assets/c8dbe4e2-cd1e-4e82-a37c-fcbce8424b7e
1146	2025-08-12 17:24:25.927549+00	1024074792	107.151.217.221	t	t	done	200 рублей	OZON	79209908000	https://directus.bmulti.store/assets/db0209cf-2451-43ff-a68d-30c7a1a09b66	https://directus.bmulti.store/assets/acd8a3e9-6d33-4b8a-9e2b-7056914edeed
1141	2025-08-12 16:05:08.464077+00	7288560914	94.75.15.220	t	t	done	200 рублей	OZON	79603998891	https://directus.bmulti.store/assets/f626ad61-4f8b-4595-9b0f-f8ad39649520	https://directus.bmulti.store/assets/33f9a982-9152-495a-8ce3-c53dd368541a
1147	2025-08-12 17:25:12.904664+00	5271896551	5.142.43.118	t	t	done	200 рублей	WB	78961008483	https://directus.bmulti.store/assets/b40104a5-ac83-45a9-83f9-8cf7ddfc3613	https://directus.bmulti.store/assets/a76845b3-460d-41b1-ab43-a8fd9fbdbc28
1152	2025-08-13 06:09:48.092842+00	554026251	95.26.214.224	t	t	done	200 рублей	OZON	79144187273	https://directus.bmulti.store/assets/382fa61e-5092-4474-9fa3-48881fe84910	https://directus.bmulti.store/assets/29acebb5-9adb-4946-9b4d-b505e4ee740c
1142	2025-08-12 16:08:54.428742+00	1124928003	95.141.180.212	t	t	done	200 рублей	OZON	79510882555	https://directus.bmulti.store/assets/9ce4f0b7-a73e-4514-9112-950166817e91	https://directus.bmulti.store/assets/5f045709-4e91-4a1c-8af4-3f351bd04f59
1257	2025-08-18 09:26:03.816604+00	6286355386	109.124.221.71	t	t	check	200 рублей	OZON	79277422407	https://directus.bmulti.store/assets/3034aa52-df89-44cc-b95d-65e3a4df4a04	https://directus.bmulti.store/assets/66c6172a-ece3-4ca0-b142-92a1c92898b5
1258	2025-08-18 09:44:02.98989+00	1619816383	87.117.185.233	t	t	check	200 рублей	WB	79196298619	https://directus.bmulti.store/assets/3c73e243-8f88-46d7-b0cd-f0746799347b	https://directus.bmulti.store/assets/a355ba8b-8c11-4500-9b54-eedf4812d106
1261	2025-08-18 10:56:34.152612+00	385899479	188.170.82.122	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/88d2503e-16b2-4e23-b32e-fb31e3666fa1	https://directus.bmulti.store/assets/e138d0c3-30dc-44b1-b552-366d0f253f32
1076	2025-08-07 18:07:35.798303+00	7383280758	95.72.198.53	f	f	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/75969a8e-7e42-4145-b322-1341c1ff32a1	https://directus.bmulti.store/assets/69e0bc2f-249e-4bb9-be30-b9cfc233f91c
1262	2025-08-18 13:02:51.515174+00	1228517799	77.222.102.111	t	t	check	200 рублей	WB	79123139907	https://directus.bmulti.store/assets/97a03b2c-6e2a-47a1-9109-8e790b65d0e7	https://directus.bmulti.store/assets/e8608360-f443-4c49-8e6d-4782c91d74ba
1263	2025-08-18 13:31:53.529367+00	1709339316	85.249.25.203	t	t	check	200 рублей	WB	79697474803	https://directus.bmulti.store/assets/47ca5daf-f640-4546-9fdb-447a7b89455e	https://directus.bmulti.store/assets/4e0ef130-4707-4778-8117-d057041e2d18
1264	2025-08-18 13:36:47.459447+00	5240650808	176.15.221.144	f	f	check	200 рублей	WB	79697474803	https://directus.bmulti.store/assets/ccd8a63e-1ca1-43f0-9957-265c300178cd	https://directus.bmulti.store/assets/eeb79d25-a228-44c7-86be-9c0de04ae634
1265	2025-08-18 14:10:38.764443+00	5103229807	77.79.170.214	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/89f6103b-74e4-4bdd-a2c3-f69d463ec57d	https://directus.bmulti.store/assets/1e924429-aba8-4216-b992-e33d35d7f2ec
1259	2025-08-18 10:04:52.351778+00	5667763445	62.192.153.182	t	t	done	200 рублей	WB	279513112734	https://directus.bmulti.store/assets/662a6089-cb36-414a-8439-6c2228c82eec	https://directus.bmulti.store/assets/18e23042-88c7-42e6-aa19-5aeac6975119
1250	2025-08-17 15:01:48.595844+00	498968830	195.200.29.57	t	t	done	200 рублей	WB	79104227749	https://directus.bmulti.store/assets/af490765-d537-405c-83d4-00ccc7df6020	https://directus.bmulti.store/assets/f90b1fb1-135f-44b0-aab7-c0a6f2960788
1246	2025-08-17 13:52:22.296566+00	1420243612	78.109.36.23	t	t	done	200 рублей	WB	79246322111	https://directus.bmulti.store/assets/ea0f539f-4eb7-47e4-9548-760da22c2fa6	https://directus.bmulti.store/assets/465e4e45-c256-4b9e-b5b7-950119c2268b
1153	2025-08-13 07:06:03.133788+00	6992817382	92.36.85.2	t	f	check	200 рублей	WB	79918652024	https://directus.bmulti.store/assets/ca9816b7-6096-4837-a40b-caef24454b67	https://directus.bmulti.store/assets/600657e3-8b95-4db1-a87f-1154f5265163
1160	2025-08-13 15:42:38.39175+00	7882320961	78.159.111.111	t	t	check	200 рублей	WB	79232827717	https://directus.bmulti.store/assets/e6f97f4d-2874-46f3-8cd6-ca766b6f5666	https://directus.bmulti.store/assets/70f80e28-9fae-4be6-8215-0714d1439ccc
1109	2025-08-10 12:40:27.729622+00	5243096739	188.190.204.116	t	t	done	200 рублей	OZON	79591235467	https://directus.bmulti.store/assets/dd81f0b1-323b-40e9-8a5b-1d6e04e88d53	https://directus.bmulti.store/assets/49e4a6ca-1b1b-4ce9-a2f0-98b1f144522e
1154	2025-08-13 07:42:38.57703+00	799916847	188.243.136.27	t	t	done	200 рублей	OZON	79992355883	https://directus.bmulti.store/assets/9e495fb7-c5ee-4797-a766-0c8059c4c6f7	https://directus.bmulti.store/assets/b1f8b8c4-d2eb-4029-b05e-c95b8548807e
1167	2025-08-13 19:00:52.816082+00	5292972483	205.237.109.130	t	t	check	1500 рублей	WB	\N	https://directus.bmulti.store/assets/cd34e782-268f-422c-8b4a-4e652677646c	https://directus.bmulti.store/assets/2356c4f8-bc13-405b-9b85-0f7f8296c8c1
1159	2025-08-13 14:43:52.068344+00	1117501369	93.85.193.187	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/a7fd0723-ea66-4bb4-9d0d-93831bc538af	https://directus.bmulti.store/assets/5ebfdb0b-26e1-4029-8ece-0304bb910186
1161	2025-08-13 15:50:11.36509+00	6655481966	93.171.122.201	t	f	check	200 рублей	WB	375447313630	https://directus.bmulti.store/assets/3bb5cd2f-1a2b-4147-909f-57d1978ca0e0	https://directus.bmulti.store/assets/85aa2960-810b-4e8e-8ed5-3d11ae9e7910
1163	2025-08-13 18:09:32.82108+00	5608302070	128.204.69.61	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/043e8649-30fa-4721-9b88-4752e9e7b3c7	https://directus.bmulti.store/assets/e4db783a-e42a-4c1f-b38b-52e1d3d91f91
1164	2025-08-13 18:09:34.854068+00	5608302070	128.204.69.61	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/0ef8c1b4-0619-4997-98a1-95a64cf490b7	https://directus.bmulti.store/assets/07aac501-27c3-400d-a2d2-30623d45c702
1165	2025-08-13 18:09:39.997504+00	5608302070	128.204.69.61	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/abbff143-ef4a-4e73-8d06-1294d0ad28bc	https://directus.bmulti.store/assets/e72d911e-148d-4f46-8849-18dff0c982ff
1166	2025-08-13 18:09:41.323195+00	5608302070	128.204.69.61	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/13d3d30e-ffd8-4aee-85a5-c4340f4c5741	https://directus.bmulti.store/assets/48814431-e541-45a7-96ba-0824419d951d
1162	2025-08-13 18:09:32.230105+00	1206584134	107.151.196.26	t	t	check	200 рублей	WB	279524991565	https://directus.bmulti.store/assets/30ede1ba-b566-4f5b-be65-ffc1a6d267ee	https://directus.bmulti.store/assets/00465219-4996-45e7-bb3b-75240a747928
1179	2025-08-14 16:30:17.323094+00	7461320189	83.217.8.214	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/ace55ebf-8624-4dda-a0e9-9862c87040cc	https://directus.bmulti.store/assets/bafaeb4b-170b-4c02-b0e0-a5e640a1b860
1169	2025-08-14 08:02:31.25908+00	864232128	95.25.19.165	t	t	check	200 рублей	WB	79616938810	https://directus.bmulti.store/assets/897d9f29-4928-4abf-bc87-4d4b3f903dda	https://directus.bmulti.store/assets/d062d8b5-2585-41ed-9387-c5cc9a909557
1173	2025-08-14 14:48:20.005297+00	6839840007	109.200.153.42	t	t	check	200 рублей	WB	79782980089	https://directus.bmulti.store/assets/dd8be04b-8f4d-42e6-9b2e-7af23049463d	https://directus.bmulti.store/assets/15a8a609-5519-461e-aed9-28b96cab01d5
1170	2025-08-14 14:00:29.015698+00	5274760247	185.210.140.207	t	t	check	200 рублей	WB	79618461158	https://directus.bmulti.store/assets/8bdd68e6-ac42-46d6-87dc-4b572d7e09e8	https://directus.bmulti.store/assets/f1c96968-c5d9-4d38-8c14-69cc23b44c1a
1171	2025-08-14 14:04:50.511486+00	1619877458	109.238.109.16	t	t	check	200 рублей	OZON	79532426056	https://directus.bmulti.store/assets/2ae483d4-c7ef-4ea9-9be5-31e864db8857	https://directus.bmulti.store/assets/d7425343-1a04-4ac3-ad5d-91a04b78a568
1172	2025-08-14 14:36:47.048375+00	1446845822	151.249.193.188	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/bb87b4c5-075f-43fa-b40e-8d8b41479c89	https://directus.bmulti.store/assets/8021ebbb-5b3a-4df0-988f-58d893e668a9
1176	2025-08-14 15:26:36.175079+00	5201156635	213.135.155.133	t	t	check	200 рублей	WB	79537072427	https://directus.bmulti.store/assets/051b9ffc-299d-4e75-ba91-079afe9d6671	https://directus.bmulti.store/assets/a5836dec-f14d-4228-856a-05af89d611cd
1175	2025-08-14 15:15:25.599017+00	917718547	176.15.199.222	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/4c30f100-fd65-443a-a086-09883e91876a	https://directus.bmulti.store/assets/f3b44b8b-6452-41f0-ba76-124572479820
1174	2025-08-14 15:05:13.881445+00	1796095124	178.121.4.236	t	t	check	200 рублей	WB	375447134166	https://directus.bmulti.store/assets/bccc109b-bcb8-4920-a220-94137c8da85f	https://directus.bmulti.store/assets/498c92ed-d0dc-425d-b620-c10555d2bd29
1178	2025-08-14 16:17:19.113097+00	460060073	213.87.135.46	t	f	check	200 рублей	WB	79150000446	https://directus.bmulti.store/assets/6c5934cf-cc46-4a22-bfdf-0a201f3819ec	https://directus.bmulti.store/assets/807b8e35-7801-4f34-9aca-14327d804d0c
1177	2025-08-14 16:01:33.040841+00	969357556	176.59.123.45	t	t	done	200 рублей	WB	79896342642	https://directus.bmulti.store/assets/1b548eb6-b51f-48b2-9dc0-157387825a78	https://directus.bmulti.store/assets/8861a2b4-3d2e-4eb8-bbfb-6415e5e5a1a1
1180	2025-08-14 16:39:26.995857+00	6896494853	193.32.176.108	t	t	check	200 рублей	WB	79637039055	https://directus.bmulti.store/assets/8a670219-10a4-43cd-89ca-d7368c1cc416	https://directus.bmulti.store/assets/d9cb7b4f-8268-4d00-9224-a10cb27be23c
1181	2025-08-14 17:48:04.10819+00	6022900641	5.142.69.89	t	f	check	200 рублей	OZON	79115535099	https://directus.bmulti.store/assets/849d0055-b9f7-45a5-bbc9-e69741d04ebd	https://directus.bmulti.store/assets/bf911334-aa5e-42b7-be2a-c3739a9dab53
1168	2025-08-14 03:27:40.701171+00	5198027535	171.33.248.226	t	f	check	200 рублей	WB	79832890311	https://directus.bmulti.store/assets/b2820e9b-1666-446e-8e7a-0567cbfd4da5	https://directus.bmulti.store/assets/731fd67d-c284-43e1-aae0-09727d099893
1158	2025-08-13 13:18:06.459468+00	6323683355	81.25.76.153	t	t	done	200 рублей	OZON	79135994844	https://directus.bmulti.store/assets/8fa31f72-f5b6-4983-b825-97fdfa6677e0	https://directus.bmulti.store/assets/fd7bbf36-2b6c-43e7-b0dd-85c19a675a0a
1157	2025-08-13 12:32:55.127668+00	5114364026	185.141.76.176	t	t	done	200 рублей	WB	79228846353	https://directus.bmulti.store/assets/20000e61-be30-4405-9dc9-ca785c76829d	https://directus.bmulti.store/assets/c6aee1cd-2f5b-48c8-aa76-dbed6377d9e7
1156	2025-08-13 11:17:53.347582+00	1182192272	5.18.90.91	t	t	done	200 рублей	OZON	79216411322	https://directus.bmulti.store/assets/70fd27fc-3b53-48a8-9a3d-e9f151557126	https://directus.bmulti.store/assets/1ade3f05-26ec-41a9-a048-d6da5d1c1557
1155	2025-08-13 09:28:31.870898+00	467835492	185.224.3.185	t	t	done	200 рублей	WB	79539460137	https://directus.bmulti.store/assets/6cc7f778-ccdf-4a84-9c41-8f2b9095579d	https://directus.bmulti.store/assets/9a1724d1-ed77-4aec-98c2-8e4bb53d21ed
1196	2025-08-15 11:01:07.950205+00	7461320189	83.217.8.214	t	t	done	200 рублей	OZON	79222633140	https://directus.bmulti.store/assets/133abbbc-a7fb-476a-a73e-184fa15af608	https://directus.bmulti.store/assets/a750a2d2-6e86-4556-99d9-c199b1a3c210
1182	2025-08-14 18:03:38.449179+00	490722012	141.227.172.137	t	f	check	200 рублей	OZON	79780496331	https://directus.bmulti.store/assets/6241df35-d66a-4fe4-aba6-a862be1b201b	https://directus.bmulti.store/assets/15b2401f-d6c9-42f6-8513-a47507dc0c8a
1208	2025-08-15 16:46:41.730673+00	1410951024	91.210.57.101	t	t	done	200 рублей	OZON	79130900562	https://directus.bmulti.store/assets/a45b5c4c-5fb6-415d-beaa-00ab09922287	https://directus.bmulti.store/assets/2034eb2c-42ae-49f5-8fec-45dd2cfe89e4
1206	2025-08-15 14:33:39.515867+00	1380561438	176.59.103.13	t	t	done	200 рублей	OZON	79083004584	https://directus.bmulti.store/assets/c91d1c5c-ebf9-4c9b-8b7a-838d1b03cd67	https://directus.bmulti.store/assets/8c6418fd-57d2-4fe2-a960-ce1a812eb059
1203	2025-08-15 13:55:40.630539+00	1475268385	31.23.109.249	t	t	done	200 рублей	WB	79085025422	https://directus.bmulti.store/assets/96c96484-3ac8-49d9-8cf7-9df1017267e2	https://directus.bmulti.store/assets/8891b621-7ca1-4760-a548-6aa4da9cb2be
1202	2025-08-15 13:53:28.106477+00	7389913161	89.110.71.191	t	t	done	200 рублей	WB	79182658924	https://directus.bmulti.store/assets/b580032e-62d8-403b-9fef-141c73fc2102	https://directus.bmulti.store/assets/2a58e883-ee99-412f-b919-47075e7a7457
1201	2025-08-15 13:23:53.94571+00	1126803375	178.186.93.104	t	t	done	200 рублей	OZON	79635351488	https://directus.bmulti.store/assets/c91aa797-ee8b-44b7-a0c2-fc2cafdd65a0	https://directus.bmulti.store/assets/f7c1fc87-e26a-40dd-8619-6dd26867c831
1199	2025-08-15 11:29:15.268094+00	1576707024	185.15.38.182	t	t	done	200 рублей	OZON	79787275478	https://directus.bmulti.store/assets/4ba89685-f481-402c-9acc-3de33da0eac3	https://directus.bmulti.store/assets/9614be19-e6f3-467a-aa50-4212253f431c
1207	2025-08-15 15:37:25.232294+00	1053119036	176.214.237.113	t	t	done	300 рублей	WB	79066593414	https://directus.bmulti.store/assets/841b9aca-aaab-4765-9330-d11b23782f7a	https://directus.bmulti.store/assets/228163ee-07d9-4b22-85de-1c6390ba88bd
1194	2025-08-15 10:15:43.558935+00	1818289003	128.204.68.41	t	t	check	200 рублей	OZON	79221748639	https://directus.bmulti.store/assets/bf894e08-0992-4270-9593-81d962d76cc7	https://directus.bmulti.store/assets/f8e2d36a-2e92-436e-bee9-0d11927da474
1190	2025-08-15 06:34:44.976974+00	2055077260	90.188.246.7	t	t	check	200 рублей	WB	79149199947	https://directus.bmulti.store/assets/c429c27a-6240-40bb-a589-7c14ba8e0b87	https://directus.bmulti.store/assets/72a10989-459d-481d-b75c-73c776350f0d
1184	2025-08-14 18:39:10.454131+00	5475712717	212.35.183.240	t	t	check	200 рублей	WB	79027543832	https://directus.bmulti.store/assets/764aa772-b70f-419f-84ef-2ff2418bac57	https://directus.bmulti.store/assets/79370228-ddf8-4834-9568-1625b1f9f597
1185	2025-08-14 18:39:16.906373+00	1155921539	176.59.11.194	t	t	check	200 рублей	OZON	79532640060	https://directus.bmulti.store/assets/499bf6b7-a4a7-4a56-81f8-274cc4a80f45	https://directus.bmulti.store/assets/6f810e73-358a-419f-a96e-31506cac8879
1205	2025-08-15 14:26:29.411991+00	7199857183	94.137.62.101	t	t	done	200 рублей	WB	79514103027	https://directus.bmulti.store/assets/09d045bf-1a8b-4113-a2d9-67e5d94d3e1f	https://directus.bmulti.store/assets/0c030ec4-c453-49c9-bde1-598b09d9ee31
1187	2025-08-15 05:13:47.061876+00	1112192826	46.48.17.202	t	t	check	200 рублей	OZON	79502044657	https://directus.bmulti.store/assets/743ca0e2-a1d5-4bef-b4c5-43d2b59cadff	https://directus.bmulti.store/assets/5675929d-0e1c-47ad-8f64-6a51682eb72c
1191	2025-08-15 07:27:06.36508+00	1064235342	212.107.234.159	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/18fe0f42-eadb-4598-9991-c6fe0a6a561e	https://directus.bmulti.store/assets/b34365dd-cf4d-41ea-80cf-5c2200527662
1188	2025-08-15 05:35:32.588364+00	1704387035	85.174.202.223	f	f	check	200 рублей	WB	79996526403	https://directus.bmulti.store/assets/d98532e6-b481-4ac5-8e3d-84a3d27a0e25	https://directus.bmulti.store/assets/b2a9c0f1-aa74-4e51-80c7-07590ad28275
1193	2025-08-15 09:02:25.046821+00	6356694431	176.15.241.86	t	t	done	200 рублей	OZON	77243323575	https://directus.bmulti.store/assets/15093512-cf11-4148-9c25-5edacf54ecfd	https://directus.bmulti.store/assets/0188e2c1-f1db-4fe7-928c-3ae35d0aaa0d
1192	2025-08-15 08:46:34.258486+00	1562286973	143.14.43.217	t	t	done	200 рублей	WB	79129011339	https://directus.bmulti.store/assets/a5d04ac9-ac12-429d-a24a-ee2bb68451d1	https://directus.bmulti.store/assets/1dbe8546-58a9-41aa-83bd-f716511b53a6
1189	2025-08-15 05:54:13.225762+00	1475268385	31.23.109.249	t	t	done	200 рублей	WB	79085025422	https://directus.bmulti.store/assets/dfb386f2-74f2-4e0d-ae68-9ee22c5d841d	https://directus.bmulti.store/assets/9c2d6fdf-85ed-4e85-bc25-21b595ae9f98
1186	2025-08-15 03:07:44.594363+00	5284623841	46.148.255.57	t	t	done	200 рублей	OZON	279505915955	https://directus.bmulti.store/assets/a2cf5d27-7d4c-4f11-8bf9-f77580c9107d	https://directus.bmulti.store/assets/9ac92dd6-8436-46e9-90d3-5ce8a23fd403
1195	2025-08-15 10:45:16.063289+00	6437628412	176.59.110.57	t	t	check	200 рублей	WB	79524555244	https://directus.bmulti.store/assets/ab9f5c53-a0fd-4464-a90b-6951f69ce4ec	https://directus.bmulti.store/assets/72dffcc2-b0a0-4325-85ca-6a43a3a47644
1197	2025-08-15 11:15:28.110166+00	580439087	31.173.243.149	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/2f21b301-579e-4bac-a50a-b0b0316ce013	https://directus.bmulti.store/assets/4b605de8-3687-4282-94f4-5a7b05044ca0
1198	2025-08-15 11:21:28.729703+00	5083593299	92.124.163.221	t	t	check	200 рублей	WB	79039839134	https://directus.bmulti.store/assets/e91a2169-f2f4-46c4-a2ed-6d1107c1cb05	https://directus.bmulti.store/assets/d479f6a6-6aa7-464f-9c35-983dd20932a5
1200	2025-08-15 12:18:36.753121+00	5868686490	37.79.169.79	t	t	check	200 рублей	WB	79963285324	https://directus.bmulti.store/assets/2a1a7cab-d272-4048-812b-9ee1ef27d014	https://directus.bmulti.store/assets/aa5ccd4b-eb6a-48b3-97b3-0dbc3fbe48ae
1204	2025-08-15 13:56:45.336713+00	1359709367	128.68.130.72	t	t	check	200 рублей	WB	79171333703	https://directus.bmulti.store/assets/a8f6c936-f83d-48bc-86fb-28fb86f156a2	https://directus.bmulti.store/assets/cd81eed6-04da-4927-bbf2-95c54b5dd0e7
1209	2025-08-15 17:45:18.31776+00	1129120955	95.67.232.127	t	t	check	200 рублей	OZON	79920615609	https://directus.bmulti.store/assets/3038fc85-9ba9-45f8-b47c-573f0a6dfbc4	https://directus.bmulti.store/assets/c50c6155-45d5-4fb6-83a0-d2bfec6ce3d7
1210	2025-08-15 17:48:18.913838+00	5007364950	85.140.5.82	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/749c4ec7-9c8d-4418-a888-0f02e6d1e672	https://directus.bmulti.store/assets/ad386b41-e005-480f-8807-08c08720c47c
1183	2025-08-14 18:24:04.188568+00	7729510605	151.249.233.201	t	t	check	200 рублей	WB	2051822	https://directus.bmulti.store/assets/446251f1-b6f5-4d20-9d24-ebc52c7b973b	https://directus.bmulti.store/assets/5b3f5726-edd4-43a7-a872-7b05e23d1c20
1238	2025-08-17 09:39:32.587675+00	1122943997	5.136.0.176	t	t	check	300 рублей	WB	79148766475	https://directus.bmulti.store/assets/02342064-6224-4087-9863-0dffbadcd472	https://directus.bmulti.store/assets/4dd4f4ef-f622-405b-99fa-f51caa10629d
1232	2025-08-16 18:12:47.431308+00	7889977989	128.204.77.154	t	t	done	200 рублей	OZON	79274753910	https://directus.bmulti.store/assets/24a989dd-426a-47b3-a9a7-1bce2b915320	https://directus.bmulti.store/assets/5286d319-d220-48c8-9353-3aab20457c92
1211	2025-08-15 17:58:16.390465+00	7956491809	89.113.152.6	t	t	check	200 рублей	WB	79684452905	https://directus.bmulti.store/assets/b05923dc-e639-4eb9-9571-c864181811aa	https://directus.bmulti.store/assets/40ca16a6-8dc2-43e5-a907-db8f7adb0024
1226	2025-08-16 14:45:25.310154+00	7191526157	149.154.113.202	t	t	done	200 рублей	WB	79011704017	https://directus.bmulti.store/assets/f1142cfd-2e68-42cd-a6ba-fd8d8541c861	https://directus.bmulti.store/assets/a2d9c00f-eb04-4622-ad38-efe68eb7dae4
1220	2025-08-16 08:57:23.208234+00	999058250	77.222.103.78	t	t	done	200 рублей	OZON	90497240322	https://directus.bmulti.store/assets/30601bec-c225-4e4c-b2e9-78bd95cdea9c	https://directus.bmulti.store/assets/608e0795-84a0-4db5-be68-4b8365c756c7
1218	2025-08-16 08:49:44.382458+00	1431212385	92.124.162.199	t	t	check	200 рублей	OZON	79230492073	https://directus.bmulti.store/assets/d3846c81-4fac-498f-ac10-d556d5057d1a	https://directus.bmulti.store/assets/beb9475e-0f02-4a6f-bd0b-4240ce03c472
1213	2025-08-15 18:42:53.912702+00	499891284	77.222.98.67	t	t	check	200 рублей	WB	79125258080	https://directus.bmulti.store/assets/824d909c-ae8d-4445-91b1-cb43ee41084d	https://directus.bmulti.store/assets/fb2361ce-ab3f-41c8-8c9a-b901219a60db
1214	2025-08-15 19:47:06.372701+00	6380248383	92.36.30.105	t	f	check	200 рублей	WB	79166507110	https://directus.bmulti.store/assets/1e1e83d3-5b4d-47e0-8ba0-50bb3ee30f66	https://directus.bmulti.store/assets/fea89b7c-966d-418b-b6b5-e8179edfd06b
1245	2025-08-17 13:18:30.696638+00	5302500117	37.214.23.35	t	t	check	200 рублей	WB	375255330563	https://directus.bmulti.store/assets/50811fe4-2e18-4700-92d9-4f7362783283	https://directus.bmulti.store/assets/687cc2d8-5dec-4071-849e-f18b564494eb
1215	2025-08-15 20:02:05.626356+00	1163392866	91.228.96.44	t	t	check	200 рублей	WB	79040380243	https://directus.bmulti.store/assets/92ad2584-8417-402a-955c-5c7f7a4abe0a	https://directus.bmulti.store/assets/8a9f7d04-9ea5-4c2c-9bed-d4972a39ea5f
1247	2025-08-17 14:08:56.599191+00	5545659851	213.88.40.38	t	t	check	200 рублей	WB	79378200600	https://directus.bmulti.store/assets/016d0709-d483-4198-be15-ccdcc3f5023f	https://directus.bmulti.store/assets/f74c0f0c-30cb-428e-9cff-0d51798b69b1
1219	2025-08-16 08:53:50.222908+00	5810686952	178.163.169.62	t	f	check	200 рублей	OZON	375296647500	https://directus.bmulti.store/assets/1fb1370c-6d17-4511-91ee-354f07ebff36	https://directus.bmulti.store/assets/b7397378-98f3-4d16-ad7c-41846e262fab
1216	2025-08-16 05:13:34.219197+00	566673658	95.54.15.65	t	t	check	200 рублей	WB	79992487918	https://directus.bmulti.store/assets/657d9a94-478b-4b26-8055-52aa77f7bf16	https://directus.bmulti.store/assets/d77a7ec5-14d6-4bc9-8e48-804284b899b8
1217	2025-08-16 06:05:35.101471+00	6724148200	88.204.26.136	t	t	check	200 рублей	OZON	79675447699	https://directus.bmulti.store/assets/ba952e77-747b-42aa-9139-1b2e2a8489f4	https://directus.bmulti.store/assets/c235eb5d-8705-48c0-b371-36351bb5955d
1212	2025-08-15 18:35:59.661411+00	7898989898	85.249.30.4	t	t	done	200 рублей	OZON	79600372277	https://directus.bmulti.store/assets/0adac9a6-2dcd-4248-b5f5-0250666d4f79	https://directus.bmulti.store/assets/eb7006aa-033e-4380-9b32-94b4191d2154
1253	2025-08-17 17:57:20.500587+00	7389913161	95.153.160.139	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/adb29f90-e287-4799-9909-7b2c56799694	https://directus.bmulti.store/assets/746d36a6-ffb0-4f10-b503-4c0ce7862578
1224	2025-08-16 11:41:02.429323+00	6180027043	151.249.175.32	t	t	check	200 рублей	WB	375257943571	https://directus.bmulti.store/assets/01f89f14-bf30-4b00-9c09-3e965ccb68d6	https://directus.bmulti.store/assets/5380221a-dba7-4cf3-bc43-4a8193c66bd7
1222	2025-08-16 10:18:30.716153+00	1350445548	194.87.96.137	t	t	check	200 рублей	WB	79281506399	https://directus.bmulti.store/assets/40a0ea6d-89f9-4ba0-a9ed-675c15977acd	https://directus.bmulti.store/assets/2cff1ce1-c55f-445b-94e2-2b3f75de6838
1223	2025-08-16 11:16:49.534165+00	1762057344	2.63.183.82	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/b29c1e2f-2bbb-43b6-b361-e6be4b6bd067	https://directus.bmulti.store/assets/c9b25a0d-5a9a-44f6-bd3c-2f4a5bd88c3c
1225	2025-08-16 13:15:23.250231+00	6985964554	62.118.93.54	t	t	check	500 рублей	OZON	79156677547	https://directus.bmulti.store/assets/858c95c0-55c9-42fc-8178-8582fcf070f8	https://directus.bmulti.store/assets/cfe3ec4d-532e-4646-bb15-f1672e3a3c76
1228	2025-08-16 17:23:10.147616+00	5736884708	91.235.15.66	t	t	check	200 рублей	OZON	79900434727	https://directus.bmulti.store/assets/ec959c0b-8bde-46d7-9ca5-f49633f4b0e1	https://directus.bmulti.store/assets/30d9cf03-e686-445e-a864-e7b02ed8dd22
1227	2025-08-16 14:57:54.555128+00	6971505455	83.139.146.217	t	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/d1cd4bac-a913-4c95-896e-76cc4ea3428a	https://directus.bmulti.store/assets/a6a96448-9d64-400c-82cb-2da0560f6b25
1260	2025-08-18 10:56:19.111916+00	385899479	188.170.82.122	t	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/40289f6e-5033-412f-bb84-1bd6c82f6e5a	https://directus.bmulti.store/assets/ab1475da-056d-4326-ad13-92969eb19277
1249	2025-08-17 14:22:54.589892+00	273925513	109.107.190.27	t	t	done	200 рублей	OZON	79229457818	https://directus.bmulti.store/assets/58c9c80b-7b78-4289-b560-175e4de35967	https://directus.bmulti.store/assets/57c8868f-51a9-4f25-a39f-979137c8f70b
1251	2025-08-17 15:51:57.772226+00	1732940311	85.140.162.31	t	t	done	200 рублей	WB	79153256060	https://directus.bmulti.store/assets/d9f4af2e-67e2-4ec7-832e-fec4f9c7ae50	https://directus.bmulti.store/assets/3ef088c9-d3a2-42b8-90f3-ff1c4027ef49
1229	2025-08-16 17:24:51.098377+00	1639148241	195.18.18.175	t	t	check	500 рублей	WB	79787007462	https://directus.bmulti.store/assets/7ba31665-2111-43c5-bfdb-fa3450504580	https://directus.bmulti.store/assets/abe20ab7-e6b2-460a-8466-c809390b287e
1221	2025-08-16 09:21:25.614577+00	124927064	109.184.66.6	t	t	done	200 рублей	OZON	79632338705	https://directus.bmulti.store/assets/9106f450-06d1-49bc-bf3d-3fba850a4a8f	https://directus.bmulti.store/assets/1838ad30-7837-4df2-a658-b06112dc57fb
1242	2025-08-17 12:01:50.846849+00	5775937244	212.233.84.187	t	t	done	200 рублей	WB	79295658100	https://directus.bmulti.store/assets/a621424d-f1ba-48e2-a5fd-83f07b092b46	https://directus.bmulti.store/assets/19219796-c80b-4f09-a4eb-2dce4a7a9827
1230	2025-08-16 18:07:56.12776+00	812664814	95.83.10.54	t	t	check	200 рублей	WB	79953865782	https://directus.bmulti.store/assets/bc2e795a-4710-4d76-a7f4-d334dbfb35a4	https://directus.bmulti.store/assets/e9453c00-44ce-450e-8525-1a5e40364f33
1231	2025-08-16 18:11:26.701169+00	5122183151	178.57.30.116	t	t	check	1000 рублей	WB	890127178252	https://directus.bmulti.store/assets/1a234c8c-16bd-4f7a-9ad6-96e39e0a8cc4	https://directus.bmulti.store/assets/14a242df-bfee-442d-bb15-480ef66ed42f
2074	2025-10-11 09:03:37.53144+00	1457412961	31.148.2.209	t	t	check	200 рублей	OZON	79638106549	https://directus.bmulti.store/assets/b3f256bc-185a-4f34-889c-ace22dd869ea	https://directus.bmulti.store/assets/51579e90-30af-4247-b7c3-85ef883a86b2
1290	2025-08-19 14:11:08.88146+00	6683931340	37.113.172.14	t	t	check	200 рублей	OZON	79517860654	https://directus.bmulti.store/assets/5ca083e6-47aa-4fe3-a1ee-0543ed51b3fc	https://directus.bmulti.store/assets/ac2feebd-ac08-4d4c-9ff7-b4f1eb3f6ac2
1267	2025-08-18 14:44:49.440824+00	2101294953	178.176.84.170	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/243849c4-22c2-45d9-80af-8aa265c82591	https://directus.bmulti.store/assets/c0eba4ab-068d-47be-a8bf-e2f7fda9c710
1273	2025-08-19 07:42:56.050614+00	557039934	31.173.86.27	t	t	check	200 рублей	WB	79267837207	https://directus.bmulti.store/assets/c03390a6-3d85-4a9c-ba52-42207b171622	https://directus.bmulti.store/assets/3e43d854-3bf2-4c76-92bb-62928995a8e3
1268	2025-08-18 16:23:06.215856+00	1350960180	143.14.42.155	t	t	check	200 рублей	OZON	79127118383	https://directus.bmulti.store/assets/d7693cf7-08df-43a2-8937-52180715be73	https://directus.bmulti.store/assets/9fd1ab30-286f-4cd3-8f3b-566fc3bbaeac
1234	2025-08-16 19:46:50.864377+00	6741261307	176.59.13.55	t	t	done	200 рублей	OZON	79005689794	https://directus.bmulti.store/assets/260e995f-bb8b-4abd-8563-eb53c620a61a	https://directus.bmulti.store/assets/99ed1e9f-2626-4443-9cfd-f9cf7a90a2cd
1274	2025-08-19 09:05:34.802266+00	2082955126	176.59.168.227	t	t	check	200 рублей	WB	279022321654	https://directus.bmulti.store/assets/ef24004d-be5a-4bc4-8fc6-af1ad1e33815	https://directus.bmulti.store/assets/766513d6-f2f7-45c0-b76f-0e21b6a4739d
1279	2025-08-19 11:06:24.719987+00	\N	85.195.118.231	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1275	2025-08-19 09:14:37.723884+00	7760973123	176.59.145.248	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/3b13d2b7-059d-4b6f-942a-a510ada40c0c	https://directus.bmulti.store/assets/619342fe-26f4-4552-9745-397d8a414d2c
1280	2025-08-19 11:06:26.093909+00	\N	85.195.118.231	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1276	2025-08-19 09:39:50.020033+00	6133557396	178.130.141.198	t	f	check	200 рублей	WB	79952945250	https://directus.bmulti.store/assets/80f1d754-7ccb-4a65-beb8-23f08e0a8b25	https://directus.bmulti.store/assets/1975b0a4-5053-48c1-b0d9-f8d2435115c4
1281	2025-08-19 11:06:33.737247+00	\N	85.195.118.231	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1282	2025-08-19 11:06:45.961909+00	\N	85.195.118.231	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1283	2025-08-19 11:06:58.631614+00	\N	146.0.253.57	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1284	2025-08-19 11:07:03.235417+00	\N	146.0.253.57	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1285	2025-08-19 11:07:21.488561+00	37361403	188.168.118.68	t	t	check	200 рублей	WB	79625875387	https://directus.bmulti.store/assets/13ed87d1-c98f-49db-8687-67b08afacbbe	https://directus.bmulti.store/assets/3c6fafb2-cec1-412c-b4a1-3e1e3e9af007
1287	2025-08-19 12:55:25.291088+00	6061876493	176.113.246.178	t	f	check	200 рублей	OZON	79517798904	https://directus.bmulti.store/assets/cef3484c-6900-4fbb-bbc2-24c5e747d84a	https://directus.bmulti.store/assets/f8b750b8-0af3-4aee-b72f-0ae49ba01fec
1277	2025-08-19 10:26:08.417083+00	5287936477	91.149.65.195	t	t	done	200 рублей	OZON	279941097539	https://directus.bmulti.store/assets/a59697fa-54ac-4d76-b20a-bf8892f01744	https://directus.bmulti.store/assets/5574ae88-5560-47a8-9ab1-99254c920ffd
1289	2025-08-19 13:40:57.577679+00	7541606735	79.139.150.6	t	t	check	200 рублей	OZON	90134668402	https://directus.bmulti.store/assets/522cb77a-6bdf-41c4-b0e5-da32c6a6dc3b	https://directus.bmulti.store/assets/765ac768-ed51-4d8d-bb7c-1485649efc52
1270	2025-08-18 17:51:15.991599+00	273749945	84.18.119.189	t	t	done	200 рублей	OZON	79274805325	https://directus.bmulti.store/assets/78b68d21-c8f2-40de-aefe-a51f3400822f	https://directus.bmulti.store/assets/5e75d408-a377-4f9d-8b2a-38d98a9417bb
1271	2025-08-19 04:43:13.68051+00	7830222139	5.182.86.128	t	t	done	200 рублей	OZON	2	https://directus.bmulti.store/assets/2b3b6ca5-8993-483a-ad89-0c492c764bff	https://directus.bmulti.store/assets/7b3f1345-f498-440b-9c38-9a41d1171d7f
1272	2025-08-19 07:25:03.678234+00	1795136050	195.191.191.246	t	t	done	200 рублей	OZON	79961019423	https://directus.bmulti.store/assets/b5b7d4d8-090c-462e-b95d-cc4ca0067793	https://directus.bmulti.store/assets/3ab9183a-8954-4f99-9627-95cf260fb6db
1269	2025-08-18 17:21:21.85929+00	653036133	79.127.189.155	t	t	done	200 рублей	OZON	79384630853	https://directus.bmulti.store/assets/01412bb7-ba0f-4363-8c8e-4cb950b39577	https://directus.bmulti.store/assets/0d637483-1c81-4f1a-a61a-84f49a87c931
1266	2025-08-18 14:43:57.160244+00	1433695377	62.118.92.147	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/62baf9fd-259b-4e7a-b94d-9ee06e789a90	https://directus.bmulti.store/assets/3957d841-b5a6-486c-8143-981708258965
1288	2025-08-19 13:21:35.387486+00	977035291	89.113.101.167	t	t	done	200 рублей	OZON	79147013653	https://directus.bmulti.store/assets/03a6d68c-1238-4e24-a62f-db6abf513f91	https://directus.bmulti.store/assets/2ba849e8-cff5-40a9-81b5-83a60ea71d90
1292	2025-08-19 15:44:07.015971+00	5874030596	213.87.158.14	t	t	done	200 рублей	OZON	79018721243	https://directus.bmulti.store/assets/abf97b2a-e297-495a-bb42-514b78c3d398	https://directus.bmulti.store/assets/843addb1-b3b4-491b-aef4-7e7fad95d4f2
1293	2025-08-19 16:02:14.52997+00	1371345349	194.60.236.248	t	t	done	200 рублей	WB	279046459265	https://directus.bmulti.store/assets/2abfe02b-f673-4237-b1d1-10caf3f544b7	https://directus.bmulti.store/assets/2af46b94-3737-432d-9e8e-7c7720f79197
1294	2025-08-19 16:05:48.836003+00	6167741114	109.161.127.176	t	t	done	200 рублей	OZON	79123039607	https://directus.bmulti.store/assets/82d6c2a7-074e-498b-b30e-fdc63c073887	https://directus.bmulti.store/assets/8cfc75b4-93d6-4f38-9334-29645df9168b
1295	2025-08-19 17:05:23.762633+00	1759496433	82.208.126.116	t	t	done	200 рублей	WB	79101369353	https://directus.bmulti.store/assets/445fef78-acbf-4c7d-a0b1-808c95e8cd51	https://directus.bmulti.store/assets/dc508ed8-d136-40bd-ac52-a3fdbbee9227
1286	2025-08-19 12:26:23.802028+00	5040820732	178.45.231.92	t	t	done	200 рублей	WB	79376770237	https://directus.bmulti.store/assets/122d331e-8479-4a7e-b85a-47702d1cacfe	https://directus.bmulti.store/assets/b30522be-2c79-47e0-9160-da33fe9295d8
1291	2025-08-19 15:22:29.999499+00	5512788056	176.59.73.143	t	t	done	200 рублей	WB	79531114488	https://directus.bmulti.store/assets/3161fbac-89ae-455d-95de-b93f6ae18082	https://directus.bmulti.store/assets/3b9a9c38-bbff-48fd-98bb-9bf5bc254271
1278	2025-08-19 10:29:48.643827+00	1518642880	176.59.99.223	t	t	done	200 рублей	OZON	279046633783	https://directus.bmulti.store/assets/be588fcd-11d5-4c35-b806-4f387e55e8ba	https://directus.bmulti.store/assets/a0f0685f-f824-4860-9bcd-f118ae6de2e8
1425	2025-08-31 15:01:26.123997+00	7054772531	212.162.152.46	f	f	in_work	200 рублей	YANDEX	\N	https://directus.bmulti.store/assets/974b100f-44ff-4bd0-97e6-395f3a19643f	https://directus.bmulti.store/assets/350d91d3-1267-49c3-8b3b-0fe38bd0764f
1608	2025-09-16 09:42:35.44677+00	7826631879	151.0.21.230	f	t	check	200 рублей	OZON	79494484722	https://directus.bmulti.store/assets/9d717b12-c16c-4e13-a5a1-6e6f7e2c7571	https://directus.bmulti.store/assets/bbfd5d57-dbb8-42a6-8554-911db5f9cfac
1304	2025-08-19 18:52:13.377104+00	524624248	194.5.61.218	t	f	check	200 рублей	OZON	79034201241	https://directus.bmulti.store/assets/484a4f44-f70e-4f4d-8cc4-813ce98dce8e	https://directus.bmulti.store/assets/49417c34-1dc9-469d-a9b5-3cf6ffca1ab9
1299	2025-08-19 17:42:57.605111+00	6242217382	77.222.104.161	t	t	check	200 рублей	OZON	79925208997	https://directus.bmulti.store/assets/e68b10c8-1133-4e38-92b9-aafbf2af6909	https://directus.bmulti.store/assets/c66c2381-52de-45ba-9424-96b3262b5fe2
1300	2025-08-19 17:58:13.987936+00	860566802	109.126.189.121	t	t	check	200 рублей	WB	375256338952	https://directus.bmulti.store/assets/f4fdcb57-5322-45b0-89a2-3212a6fe41e3	https://directus.bmulti.store/assets/309da2c7-31b4-4697-9304-c080b98e4f31
1301	2025-08-19 17:58:41.082817+00	5507718148	37.212.82.87	t	t	check	200 рублей	WB	375256576848	https://directus.bmulti.store/assets/ab6979d7-da56-439e-b4bd-b00496531f39	https://directus.bmulti.store/assets/2ce8a3d5-b529-467a-acae-f97847613df1
1302	2025-08-19 18:02:13.126193+00	5806083764	93.124.51.64	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/ddcc4d7e-c728-4fea-96a8-7f3322dacc0f	https://directus.bmulti.store/assets/56cfd6d9-ee2c-4887-a0cf-2c805d72b631
1303	2025-08-19 18:35:50.275547+00	463780374	77.222.102.111	t	t	check	200 рублей	WB	79123139907	https://directus.bmulti.store/assets/95d72e82-9385-4d60-b8f7-dd8c496ce60b	https://directus.bmulti.store/assets/9c1a5223-1900-4eab-81b4-92841e1158af
1305	2025-08-19 19:29:11.3939+00	1855540857	178.178.244.195	t	t	check	200 рублей	OZON	79500008812	https://directus.bmulti.store/assets/d9756a23-39e7-439e-a4c2-8fb775b1e574	https://directus.bmulti.store/assets/9455ed1f-5f58-4c0d-b986-4dbcdd227e97
1235	2025-08-16 20:34:12.857794+00	771796710	151.0.17.207	t	t	done	200 рублей	OZON	79493395681	https://directus.bmulti.store/assets/48c213e2-0111-40fc-bfe0-06d2d9ad0e9d	https://directus.bmulti.store/assets/5866c2e5-0e6e-4de0-acbb-49b03779ac28
1298	2025-08-19 17:41:38.922936+00	5281522230	5.139.230.130	t	t	done	200 рублей	WB	79180185722	https://directus.bmulti.store/assets/68d38630-a257-4224-91ba-8b851a4b31dd	https://directus.bmulti.store/assets/c570905d-de2e-4382-bac8-e2fc9e19e9a0
1309	2025-08-20 10:07:47.035302+00	1664724117	130.254.44.12	t	t	check	300 рублей	WB	\N	https://directus.bmulti.store/assets/15020203-e40d-4c40-90bd-d090d4dec70d	https://directus.bmulti.store/assets/cdde0dc7-0ed0-48d2-88f1-03121ee902fc
1307	2025-08-20 09:47:26.214521+00	7926588458	45.40.113.29	t	f	check	200 рублей	WB	2053877	https://directus.bmulti.store/assets/5785f204-4841-471c-9cf3-0ac42ac7964a	https://directus.bmulti.store/assets/4c43192c-2263-4399-b922-1ac3bb7d8ed6
1308	2025-08-20 09:59:32.389778+00	5141813222	185.107.159.185	t	t	done	300 рублей	WB	79787563680	https://directus.bmulti.store/assets/e89e34be-2482-4a67-b270-65e358329db6	https://directus.bmulti.store/assets/1dfedf46-8fe0-4b47-b29e-d68d56483a6d
1311	2025-08-20 10:51:46.367658+00	1761991058	93.182.35.150	t	t	check	200 рублей	OZON	79521214099	https://directus.bmulti.store/assets/96acdefa-7d01-4548-b5fd-b95a1c68ecbb	https://directus.bmulti.store/assets/df0b6889-461d-4fea-af0d-0d655038ad04
1315	2025-08-20 15:03:49.787135+00	1728087134	37.79.31.90	t	t	check	200 рублей	OZON	79519316272	https://directus.bmulti.store/assets/85c9abdd-dec5-4be8-b43d-bcf15d2692f8	https://directus.bmulti.store/assets/2dbcaede-f41e-4df2-98e6-83f384b9b0e0
1314	2025-08-20 12:16:02.495857+00	1076658318	87.117.53.7	t	f	check	200 рублей	WB	79524170255	https://directus.bmulti.store/assets/a2c68681-2d27-46c5-9b0e-bbe587dd5abe	https://directus.bmulti.store/assets/d4478480-0f04-4ff4-b3ba-92c7e636dcb3
1318	2025-08-20 16:16:19.53475+00	1387277372	188.170.82.175	f	f	check	200 рублей	OZON	79319749837	https://directus.bmulti.store/assets/f1db28d9-b73c-4231-b493-2c7a7f782b0b	https://directus.bmulti.store/assets/888b7612-7cce-44ee-973f-12d6fa21d428
1316	2025-08-20 15:13:57.015146+00	1417599425	37.16.73.222	t	t	check	200 рублей	WB	79786704607	https://directus.bmulti.store/assets/1ad7356c-c90d-44b3-b6fe-a2464593ee1e	https://directus.bmulti.store/assets/cc958739-bcfe-4ada-aa27-6354c2d82d68
1319	2025-08-20 18:02:38.527073+00	6784253207	178.141.244.108	t	t	check	200 рублей	WB	79539424862	https://directus.bmulti.store/assets/d5d62f8a-98e7-4ca7-a718-ff73a81cc990	https://directus.bmulti.store/assets/baf00001-6dd3-4b69-b465-c177cf0b1588
1297	2025-08-19 17:34:31.499867+00	1840615678	83.139.147.116	t	t	done	200 рублей	WB	79066784284	https://directus.bmulti.store/assets/f3658d60-0259-451c-ad66-32cb04a4e161	https://directus.bmulti.store/assets/92c3a239-637c-4326-8700-cbdc541d63bf
1321	2025-08-21 06:57:07.780046+00	485945976	213.152.174.140	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/acb9ef87-fd52-49a5-a64c-699cc8e64d25	https://directus.bmulti.store/assets/4503b03f-382a-4ffe-bea7-6eedaa08d83d
1320	2025-08-20 20:30:56.25553+00	421191169	31.23.114.208	t	t	done	200 рублей	WB	79897102783	https://directus.bmulti.store/assets/63eb5525-09a9-46f1-b63b-d143553c29ec	https://directus.bmulti.store/assets/9bf9d1f5-e285-4e26-b85c-933e8335f434
1310	2025-08-20 10:31:50.194472+00	1123499023	193.181.212.23	t	t	done	1000 рублей	OZON	79279206191	https://directus.bmulti.store/assets/acf2b330-8a2a-41c6-bcaa-28caef33b4e8	https://directus.bmulti.store/assets/a13b556a-8465-4e7f-9c49-3cdd582d3623
1313	2025-08-20 11:23:11.628333+00	556538625	188.132.192.190	t	t	done	200 рублей	OZON	79144916645	https://directus.bmulti.store/assets/d60f4893-3032-4714-8e90-54b069833a29	https://directus.bmulti.store/assets/f672cbc8-9fe8-49f6-ab37-f2e643963310
1312	2025-08-20 11:08:42.441685+00	7316272010	213.59.139.36	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/7b9c3c04-64ed-4c86-8647-59a84fcb282d	https://directus.bmulti.store/assets/409e2032-66d9-4da0-8eef-c83654a69886
1306	2025-08-19 20:22:06.86359+00	1197289541	195.218.173.18	t	t	done	200 рублей	OZON	79172138555	https://directus.bmulti.store/assets/db73ef6e-d7ba-4acf-b2ad-8ff6a3828f8f	https://directus.bmulti.store/assets/8a806dcd-e60f-4026-b7ae-7c0ffaa9f019
1323	2025-08-21 08:27:41.868871+00	5055706144	109.124.231.242	t	t	done	200 рублей	OZON	79613844766	https://directus.bmulti.store/assets/d994890d-6d46-45de-ada9-1b405bf903b8	https://directus.bmulti.store/assets/b8391537-d059-4385-af24-9f847aa1d448
1322	2025-08-21 08:01:40.329039+00	1334984663	5.9.52.14	t	t	done	200 рублей	OZON	79285664355	https://directus.bmulti.store/assets/23d691cd-fb40-433e-8a79-8e974af7429b	https://directus.bmulti.store/assets/042b2d4a-2531-4c79-8164-bf165a4c6816
1317	2025-08-20 16:13:18.430079+00	2023020340	79.127.142.184	t	t	done	200 рублей	OZON	79516678490	https://directus.bmulti.store/assets/0d3c1a04-11af-400d-9100-79c3695ba73b	https://directus.bmulti.store/assets/c5723c1f-dcea-4afb-8bd4-3977f3f587ed
1331	2025-08-22 09:09:29.379239+00	6167054839	176.59.13.138	t	t	check	200 рублей	OZON	79019706008	https://directus.bmulti.store/assets/b0fe7b91-c4ee-413b-8ef1-f1a058565d84	https://directus.bmulti.store/assets/c5803b53-d46b-42f5-b201-8dcda6a5ab69
1324	2025-08-21 09:37:25.339357+00	2029520545	178.121.25.55	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/dd91b159-7799-4a83-b4d5-84c63a13471f	https://directus.bmulti.store/assets/de07d7ed-8b78-4af6-bcbb-9beae3c570f2
1668	2025-09-19 08:33:35.682159+00	\N	77.238.229.42	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1332	2025-08-22 09:25:02.022301+00	5358875898	91.217.244.109	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/3000f1c0-c7c0-4791-b3e8-3562278de326	https://directus.bmulti.store/assets/9bd42bb7-cbbd-40ce-85e5-601777a6adb6
1325	2025-08-21 10:35:11.458134+00	5138580844	67.209.129.26	t	t	check	200 рублей	OZON	77772352105	https://directus.bmulti.store/assets/28955c31-14bf-4a97-a57e-1b930239592a	https://directus.bmulti.store/assets/79ddc240-a8a4-4ca4-a087-6c6bc356e65e
1327	2025-08-21 13:17:00.800115+00	1021232242	95.25.148.66	t	t	check	200 рублей	WB	79533832606	https://directus.bmulti.store/assets/d358dc54-f019-4542-b808-a940d4f3a529	https://directus.bmulti.store/assets/906a97b3-2e3d-4465-83af-0c1b04665164
1335	2025-08-22 12:48:00.25808+00	667757642	178.218.27.156	t	t	check	200 рублей	WB	79043533356	https://directus.bmulti.store/assets/60c2aa6e-21e3-4862-8b63-a0b1352c737e	https://directus.bmulti.store/assets/36976070-0d56-4cb9-aecd-7ea330b1faed
1336	2025-08-22 14:36:25.668412+00	5012892925	178.155.30.57	t	t	check	200 рублей	WB	79183558953	https://directus.bmulti.store/assets/22c0ccf7-c873-46bb-8b4f-947efc2a6e4a	https://directus.bmulti.store/assets/1e41f6c5-ce8f-40e8-918f-fcf8d2d014e4
1337	2025-08-22 14:53:44.622274+00	6346454939	46.216.242.59	t	t	check	200 рублей	WB	375292815105	https://directus.bmulti.store/assets/e3e7113e-4f8c-4452-a0ac-c9ed49a01697	https://directus.bmulti.store/assets/eef07729-9aac-47ae-9e4a-3ae37a980d98
1339	2025-08-22 16:54:40.182801+00	382454075	78.40.119.89	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/efe6f425-e542-4c43-a2e0-6ce426ed444f	https://directus.bmulti.store/assets/d6ff7919-1753-4b81-9583-22785acac4c5
1340	2025-08-22 17:18:26.338783+00	5375810589	89.251.164.244	t	f	check	200 рублей	WB	79780023909	https://directus.bmulti.store/assets/443983b7-98e6-4f73-9dc6-39fb56a8a62e	https://directus.bmulti.store/assets/193462fc-69d2-4150-a0cd-be06f769bdbe
1328	2025-08-21 16:39:43.63156+00	1181603939	95.24.146.38	t	t	done	200 рублей	OZON	79057532253	https://directus.bmulti.store/assets/a5e10fa6-16ba-4efd-8ae6-65bfd986fef3	https://directus.bmulti.store/assets/e0b3f553-4915-4bc3-bbdd-13c0d916d303
1341	2025-08-22 17:37:01.028823+00	5878460513	109.126.189.193	t	t	check	500 рублей	WB	375259382687	https://directus.bmulti.store/assets/b35b3004-01a6-4cb4-804c-1d853ecac2b1	https://directus.bmulti.store/assets/edfbb464-94fd-4c49-860d-b42917d73b6e
1343	2025-08-22 18:02:16.993655+00	1011783413	95.25.14.50	f	f	check	200 рублей	OZON	79608845871	https://directus.bmulti.store/assets/bee4f1c6-a72a-40ba-9937-e1231d2d3b3e	https://directus.bmulti.store/assets/be5b858c-65ac-40a5-b59c-63320545f680
1326	2025-08-21 12:02:18.43717+00	5120123493	85.91.218.22	t	t	done	200 рублей	OZON	79787968428	https://directus.bmulti.store/assets/84fe7edc-d545-42b5-9523-ddae1e16c298	https://directus.bmulti.store/assets/25647500-f424-4ec4-abb4-3c403ffce7b0
1330	2025-08-21 21:24:43.711596+00	784890244	91.238.29.203	t	t	done	200 рублей	OZON	79280318998	https://directus.bmulti.store/assets/dd87ec01-4f06-49d8-bd20-74c4a18c3364	https://directus.bmulti.store/assets/1064c639-0e3b-45b1-9a06-ddc98e480dfe
1329	2025-08-21 18:34:20.106544+00	1045434730	193.36.132.100	t	t	done	200 рублей	OZON	79224000885	https://directus.bmulti.store/assets/b6be9c9f-0cf4-45bc-b78b-187209405a92	https://directus.bmulti.store/assets/e0db7fda-31b4-49c8-88e8-21fff290e233
1344	2025-08-23 05:03:24.576384+00	5283468371	85.234.105.38	t	t	check	2000 рублей	OZON	79041275080	https://directus.bmulti.store/assets/ea3bffe4-160a-40ca-a340-097671e5ad2b	https://directus.bmulti.store/assets/e6e5ac3e-9e32-4d7c-b5d2-c05642eb5e15
1345	2025-08-23 06:43:08.085075+00	6196805988	89.110.120.181	t	t	check	200 рублей	WB	79956650498	https://directus.bmulti.store/assets/68f163c3-15ca-47ad-a678-7d91e22b8c9a	https://directus.bmulti.store/assets/ff273dfb-96e6-4f6e-b601-e2e274a05f0f
1347	2025-08-23 09:55:53.665084+00	7133663797	178.176.79.171	t	f	check	200 рублей	OZON	79770403620	https://directus.bmulti.store/assets/2a8c9d90-8502-4872-83a7-9f593ab9498e	https://directus.bmulti.store/assets/be6940c9-be68-4624-bbbf-27f2eb978607
1346	2025-08-23 08:11:37.198568+00	5406847940	178.184.176.29	t	t	check	200 рублей	WB	79246175941	https://directus.bmulti.store/assets/6227f952-646d-44d5-a35a-b97195297c0c	https://directus.bmulti.store/assets/a7f100b5-8449-42bf-bbd2-dc04feb05b9d
1348	2025-08-23 09:57:42.10576+00	5148302767	178.176.79.171	f	f	check	200 рублей	OZON	79770403620	https://directus.bmulti.store/assets/db64c397-fa14-452d-8186-379d7f44ccaf	https://directus.bmulti.store/assets/e307341a-21f3-4a8e-9155-2529840bb1b8
1349	2025-08-23 10:00:01.278741+00	7577709878	134.19.186.78	f	f	check	200 рублей	OZON	79770403620	https://directus.bmulti.store/assets/3bcd5e89-8c5a-4f28-a877-da348e4e07a1	https://directus.bmulti.store/assets/8e705d84-72c1-4d32-ae80-4387ea30e831
1350	2025-08-23 12:00:54.216395+00	1642936095	217.79.107.215	t	t	check	500 рублей	OZON	93725963722	https://directus.bmulti.store/assets/0235f524-ccc4-4944-9bd4-4cee9ff98407	https://directus.bmulti.store/assets/6eb172b7-fddd-4597-aa00-8ee62a96f390
1351	2025-08-23 16:21:35.709069+00	1938557134	176.59.8.94	t	t	check	200 рублей	OZON	79535402888	https://directus.bmulti.store/assets/5eb0a0ab-68fa-4341-a6ef-7416987655ca	https://directus.bmulti.store/assets/902cb89a-ae2e-4bb8-9795-5c21342adaf5
1352	2025-08-23 18:24:47.596075+00	6243567413	5.35.44.7	t	t	check	200 рублей	OZON	79273334486	https://directus.bmulti.store/assets/519bb90a-ca7d-4800-8f31-0e068d757cdb	https://directus.bmulti.store/assets/4f36136b-2646-479b-8759-3f076361530d
1333	2025-08-22 09:25:13.469386+00	5358875898	91.217.244.109	t	t	done	300 рублей	OZON	79518418773	https://directus.bmulti.store/assets/3cb630aa-055a-4ac4-b542-1b7c20102bd8	https://directus.bmulti.store/assets/53aae1ca-7507-4e9d-8960-b47242fe3a70
1342	2025-08-22 17:53:46.621398+00	8283952312	178.176.81.77	t	t	done	200 рублей	OZON	79261117740	https://directus.bmulti.store/assets/ffe48701-febb-4967-8ce5-97199dca9652	https://directus.bmulti.store/assets/5c2b135e-05c7-498b-887e-b9879732fa36
1338	2025-08-22 15:31:15.731834+00	1330973492	81.16.236.81	t	t	done	200 рублей	WB	79193850923	https://directus.bmulti.store/assets/39a1ee43-3268-4dd7-a789-ea9cabc66bd5	https://directus.bmulti.store/assets/ce61eb16-9fe9-48a0-9a10-1491cc637248
1334	2025-08-22 11:06:50.646939+00	1168357115	109.72.246.23	t	t	done	200 рублей	OZON	79651170732	https://directus.bmulti.store/assets/a74e496b-ae3a-4189-91b7-24dcf40786b4	https://directus.bmulti.store/assets/309c8545-1555-440e-a57e-0fc843e6c4bc
1544	2025-09-13 07:47:06.613787+00	\N	176.15.246.14	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1353	2025-08-23 18:26:47.222128+00	5141813222	185.107.159.185	t	t	check	200 рублей	WB	79787563680	https://directus.bmulti.store/assets/da31cec8-ce18-4fd0-a6af-d8f3696eb141	https://directus.bmulti.store/assets/dce89e7d-4302-4246-9050-4499439cd55a
1354	2025-08-24 05:25:26.425798+00	1208176626	46.191.186.177	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/235aca63-5068-4318-b549-69cd4691cd73	https://directus.bmulti.store/assets/1cc0401b-b288-4715-af29-403a79ac2f8b
1379	2025-08-28 02:42:22.127263+00	749306251	176.118.197.62	t	t	done	200 рублей	WB	79236040546	https://directus.bmulti.store/assets/30eb87ce-c525-4fe8-b3f0-237df9994fae	https://directus.bmulti.store/assets/2746af50-9201-4499-89ba-0598372c09a8
1362	2025-08-24 14:51:37.531801+00	1647833386	91.239.157.82	t	f	done	200 рублей	WB	79517044974	https://directus.bmulti.store/assets/a2ab69be-2253-4428-82b8-122d2ec798e7	https://directus.bmulti.store/assets/17d58e50-58cc-484c-abcd-c42d00b6862e
1361	2025-08-24 13:19:27.75703+00	742090261	31.173.240.170	t	t	done	300 рублей	OZON	79231801787	https://directus.bmulti.store/assets/e2ea4995-9604-4ec9-a369-f05b83c0f2db	https://directus.bmulti.store/assets/21a893b4-20c9-4246-8e50-7d7cc9776021
1597	2025-09-15 19:20:51.619192+00	\N	5.139.218.243	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1355	2025-08-24 07:24:43.228459+00	1005598365	5.129.231.109	t	t	check	200 рублей	OZON	79000695696	https://directus.bmulti.store/assets/fd932bf8-b1fc-4bca-b3b7-4d61ca11e58a	https://directus.bmulti.store/assets/544873cf-930e-48c5-b17d-b1aa927b0ccd
1357	2025-08-24 09:26:06.767073+00	7079887665	109.107.159.137	f	f	check	200 рублей	OZON	79888763721	https://directus.bmulti.store/assets/766305bc-4768-41c7-ab41-3749fce724cb	https://directus.bmulti.store/assets/f89e9cf6-35fa-4be7-8db0-af6f0044d512
1358	2025-08-24 11:25:28.658081+00	5169826108	109.254.254.18	t	t	check	200 рублей	OZON	79493648868	https://directus.bmulti.store/assets/7038cf76-f5e0-46ed-a959-004521400b21	https://directus.bmulti.store/assets/3e080ef2-8601-46ce-8052-18a318478870
1366	2025-08-27 14:33:43.599856+00	1093353338	91.103.250.250	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/11d5ab41-b34b-4ea8-9dd0-fb3af92c7ff2	https://directus.bmulti.store/assets/b8edf41e-b0e9-4b42-9753-ed3cabd20de0
1359	2025-08-24 12:12:05.02021+00	7075480039	91.222.216.9	t	t	check	200 рублей	WB	79659154412	https://directus.bmulti.store/assets/1da681c6-877a-48fa-b5e0-62f6b932dc79	https://directus.bmulti.store/assets/9b2dbc6e-33d5-4b4d-9446-b38c5b86e224
1360	2025-08-24 13:12:23.892259+00	873303029	178.130.140.214	t	t	check	200 рублей	WB	79080631415	https://directus.bmulti.store/assets/b872ee98-0abe-4ac4-b363-6a804d341121	https://directus.bmulti.store/assets/77c6e16d-cfe2-43aa-b159-140d3ab2fa95
1363	2025-08-24 15:55:02.92141+00	1181603939	95.24.146.26	t	t	check	200 рублей	OZON	79057532253	https://directus.bmulti.store/assets/36d0167a-839d-464f-98e1-322db8dd687c	https://directus.bmulti.store/assets/babc0925-4868-466a-bc69-e453025cf8b1
1368	2025-08-27 16:08:03.068367+00	1944952447	185.162.35.185	t	f	check	200 рублей	WB	79209947452	https://directus.bmulti.store/assets/cb0968ad-b584-4238-99fd-ad898a0ac010	https://directus.bmulti.store/assets/857dc1e7-aaa3-4b7a-bfcb-a311de832534
1376	2025-08-28 01:19:03.889828+00	995627671	109.110.47.91	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/e47b4498-2fdb-4daf-ac7e-6a887377d015	https://directus.bmulti.store/assets/242fc57e-d149-400a-8364-c303b131a4c3
1374	2025-08-27 18:44:03.637712+00	1637706307	31.131.65.27	t	t	check	200 рублей	OZON	79781631088	https://directus.bmulti.store/assets/d772d9b0-0cc3-45c8-9e52-d6de22d92033	https://directus.bmulti.store/assets/0ef552c9-6097-45af-9d9b-dd21e661d26a
1356	2025-08-24 08:59:31.696085+00	6182330087	95.153.177.34	t	f	done	200 рублей	OZON	79888763721	https://directus.bmulti.store/assets/bc820777-241d-4e25-bca9-c804ba79534c	https://directus.bmulti.store/assets/7b145f4c-f902-45c2-a692-cc8505da3b61
1377	2025-08-28 01:19:09.88273+00	995627671	109.110.47.91	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/ea639e90-0a1f-43d7-bd88-03cfd907807d	https://directus.bmulti.store/assets/958a20aa-fb0f-4e9c-ae8c-4f38f6ccf388
1378	2025-08-28 01:19:11.510694+00	995627671	109.110.47.91	f	f	check	200 рублей	WB	79146581248	https://directus.bmulti.store/assets/3da74ceb-095e-4cf3-aee4-5469db91836c	https://directus.bmulti.store/assets/f93f227b-bb8e-4f6f-a460-a7c3c8aedeb9
1381	2025-08-28 07:20:52.810165+00	1989078628	46.187.105.209	t	t	done	200 рублей	WB	79063865646	https://directus.bmulti.store/assets/1fed3136-9d96-4226-a68c-9f8ce77020a5	https://directus.bmulti.store/assets/382e2194-9d17-4926-bc0b-551046874c41
1380	2025-08-28 03:51:22.753595+00	5045896455	87.76.3.183	t	t	done	200 рублей	OZON	79876934943	https://directus.bmulti.store/assets/8693ce16-ef8e-4dc7-9563-a32a5b157b15	https://directus.bmulti.store/assets/467f248e-b778-45d7-8731-ffa6e6573115
1375	2025-08-27 18:51:06.65271+00	5120123493	85.91.201.131	t	t	done	200 рублей	OZON	79787968428	https://directus.bmulti.store/assets/02a49362-1e41-40ab-877a-5b1deac9a7fd	https://directus.bmulti.store/assets/dc5403c9-b153-482c-af7f-3a5e045e8e4e
1373	2025-08-27 17:16:33.698263+00	466029659	91.239.157.91	t	t	done	200 рублей	WB	79502077891	https://directus.bmulti.store/assets/f011b819-884d-4712-8aa3-28dcc55a48da	https://directus.bmulti.store/assets/bf8a8b34-bb51-4919-899c-8c10f432514d
1364	2025-08-24 18:21:48.433081+00	1361044047	185.193.159.3	t	t	done	200 рублей	WB	79607347658	https://directus.bmulti.store/assets/8bf0831c-ebfe-4caf-bf9c-b9aeedfd6a82	https://directus.bmulti.store/assets/965080cc-7f5b-4563-8fa5-81f3e9b5cb17
1372	2025-08-27 17:15:29.255374+00	5077751236	5.167.102.88	t	t	done	200 рублей	WB	79040195508	https://directus.bmulti.store/assets/bb99220a-9577-4f30-a62a-0ea3ee933e7a	https://directus.bmulti.store/assets/704fb197-8596-47a5-857f-c905cf9a4c1f
1371	2025-08-27 16:59:46.25454+00	669088247	92.244.224.155	t	t	done	200 рублей	WB	279092171171	https://directus.bmulti.store/assets/9095e2fd-a753-479c-b1af-a558ed771f83	https://directus.bmulti.store/assets/2c95f150-757f-4d6d-9ce3-320ea1a504e1
1370	2025-08-27 16:43:57.68037+00	226348249	46.8.62.244	t	t	done	200 рублей	OZON	79787301574	https://directus.bmulti.store/assets/7d14f2f5-1a75-4f58-b7a6-8c46ea3df48e	https://directus.bmulti.store/assets/2c1e5121-099b-4b2a-93e3-c41a8a98a47f
1369	2025-08-27 16:41:54.309548+00	999311431	94.25.228.87	t	f	done	200 рублей	OZON	79000876287	https://directus.bmulti.store/assets/d5f905bd-f849-4ca0-8d67-61dcb5cae2f1	https://directus.bmulti.store/assets/be4fd2cd-bada-4555-a154-09d6504f6dac
1367	2025-08-27 15:07:57.784696+00	1885969972	193.168.178.233	t	t	done	200 рублей	OZON	79126697229	https://directus.bmulti.store/assets/940b978c-df6c-463e-8d6f-a6aea0e01205	https://directus.bmulti.store/assets/4bcde29a-73a7-4864-8f66-a83a976e7947
1365	2025-08-27 12:48:06.675267+00	985891656	85.172.88.254	t	t	done	500 рублей	OZON	79044249309	https://directus.bmulti.store/assets/3eb67deb-b72e-412d-b85f-6086b106cbb3	https://directus.bmulti.store/assets/9f4e9949-5190-4208-a620-8a603d196414
1387	2025-08-28 15:27:27.726189+00	1827338124	95.32.192.185	t	t	done	200 рублей	OZON	79531191094	https://directus.bmulti.store/assets/78025a46-aa3f-47bf-b05f-c6cfa54abd93	https://directus.bmulti.store/assets/95fa3c84-4e9d-4101-a409-6a59d5b94b38
1701	2025-09-20 15:13:00.984707+00	\N	178.130.140.238	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1802	2025-09-27 13:41:52.188594+00	\N	45.150.174.179	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1406	2025-08-30 08:14:06.798106+00	1038167197	86.102.233.227	t	t	done	200 рублей	OZON	279940153892	https://directus.bmulti.store/assets/d07deba1-b79f-4505-8d24-a987add25b47	https://directus.bmulti.store/assets/1e96b7b1-9ae3-4b06-b7f7-4adfa5a1bda4
1402	2025-08-29 18:11:11.072111+00	5356402896	95.25.147.233	t	t	done	200 рублей	OZON	79654595774	https://directus.bmulti.store/assets/1d0e325e-f9ce-44eb-ad14-9f17749a87b4	https://directus.bmulti.store/assets/b8132292-dc8b-4712-a999-133f937e252b
1394	2025-08-29 12:41:06.599592+00	7563950397	178.217.67.31	t	t	done	200 рублей	OZON	79025439334	https://directus.bmulti.store/assets/044bd510-47ed-497a-8026-0c9e11f67be4	https://directus.bmulti.store/assets/24eeedca-8485-4e35-8012-10d2c6b7fabc
1395	2025-08-29 13:48:16.858963+00	7195240101	109.120.3.157	t	t	done	200 рублей	WB	79043237641	https://directus.bmulti.store/assets/4cfeaf01-5741-45cd-b07a-139dba4e53f6	https://directus.bmulti.store/assets/36dff8ce-0f59-4692-9994-767b96781ed6
1400	2025-08-29 15:16:27.63805+00	6185320872	178.176.169.29	t	f	done	200 рублей	WB	79962754741	https://directus.bmulti.store/assets/88f64e6f-0eb4-4ddd-a235-cb9a81056531	https://directus.bmulti.store/assets/a66a90d4-b09d-4a6e-a5bc-2b8f73255157
1401	2025-08-29 15:18:26.740546+00	7674565123	94.25.234.6	t	t	done	200 рублей	OZON	95172110152	https://directus.bmulti.store/assets/9b5f3310-071a-4416-808c-354ec9724714	https://directus.bmulti.store/assets/a18e8d86-07ae-4c41-ae16-bf01197262cb
1390	2025-08-29 11:29:52.224289+00	1011122105	212.59.106.132	t	t	check	200 рублей	WB	79150187087	https://directus.bmulti.store/assets/f9066802-0f26-4b31-84b3-fc371d7b8ced	https://directus.bmulti.store/assets/e05c237c-d98a-4698-9f9d-aead3cf97a35
1403	2025-08-29 19:24:44.812498+00	1359532862	194.34.99.197	t	t	done	200 рублей	OZON	79629474999	https://directus.bmulti.store/assets/96ffbca0-7118-4332-8d9c-43af50fc44f6	https://directus.bmulti.store/assets/94931a8a-293c-4494-b454-b4da82efd753
1410	2025-08-30 14:28:42.584615+00	1497957508	31.171.197.7	t	t	done	200 рублей	OZON	79879868641	https://directus.bmulti.store/assets/024d3d04-7892-4c2a-be6d-492dc6e89cce	https://directus.bmulti.store/assets/84b34dfe-e913-408d-bd08-a2a29c186f57
1407	2025-08-30 09:31:54.865124+00	990965883	81.222.186.123	t	t	done	200 рублей	OZON	79091763765	https://directus.bmulti.store/assets/6424af5b-b46a-4634-9532-35155f9fa667	https://directus.bmulti.store/assets/1174f283-48af-4ca5-9d73-68e44e2baff5
1397	2025-08-29 14:38:52.023112+00	7196701354	178.176.71.148	t	t	done	200 рублей	OZON	79240211875	https://directus.bmulti.store/assets/44affe02-8049-4e38-8bba-fb2454a1b75e	https://directus.bmulti.store/assets/ecbf2eae-8436-4c65-8af6-e3b2d6b5b8c1
1391	2025-08-29 12:31:29.264445+00	6517653481	176.59.202.249	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/833d4dbf-6f60-4821-bece-27eac7f4365a	https://directus.bmulti.store/assets/70c5242a-9ae5-448c-be3b-cec634b4bbf4
1386	2025-08-28 13:24:42.527762+00	5236227346	94.41.129.224	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/f5fd65d0-917a-4f46-8b01-937418dfc0a0	https://directus.bmulti.store/assets/49c5c120-5f6d-4539-a078-e9f8772b4a22
1385	2025-08-28 12:40:17.637188+00	5478734272	185.169.102.49	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/b9fe060f-728e-4903-ae00-9e34ea09c4fb	https://directus.bmulti.store/assets/9ee0e05b-0284-434d-b37d-76bc82786c19
1389	2025-08-29 11:17:11.90022+00	8060028520	95.25.147.233	t	t	check	200 рублей	OZON	79654595774	https://directus.bmulti.store/assets/8d4ff6c1-9a88-4295-b7b3-2731abe86ac0	https://directus.bmulti.store/assets/41637c63-49ab-4c74-94ea-94b1da1825dc
1392	2025-08-29 12:31:35.191913+00	6517653481	176.59.202.249	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/9beb4ae2-1edd-4abe-ab2e-c65a842375fb	https://directus.bmulti.store/assets/a21d38b9-a396-4b75-a7d0-35b9f57e10c6
1393	2025-08-29 12:31:36.817483+00	6517653481	176.59.202.249	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/ab7a418e-907a-4c50-9f1a-d102c471052f	https://directus.bmulti.store/assets/7cede785-389b-4a19-9eb1-1bf2766a39bd
1396	2025-08-29 14:08:49.751056+00	6353567223	91.103.249.252	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/ee2d58ff-dd00-47f3-8ee0-23e90aa27ae7	https://directus.bmulti.store/assets/3545b070-9a91-4fcd-95db-1b8445c63dbb
1399	2025-08-29 14:39:34.143716+00	7196701354	178.176.71.148	f	f	check	200 рублей	OZON	79240211875	https://directus.bmulti.store/assets/6d3913a1-d150-41de-a4c0-947cad199517	https://directus.bmulti.store/assets/ef90048a-4ab5-49ca-881d-b7a3f66c2485
1398	2025-08-29 14:39:19.856831+00	7196701354	178.176.71.148	f	f	check	200 рублей	OZON	79240211875	https://directus.bmulti.store/assets/ee5266d7-2c5f-4158-af79-788eca0dac43	https://directus.bmulti.store/assets/13d38c36-4f42-48fd-81d0-40040e1dfd2a
1404	2025-08-29 19:33:32.294676+00	772739801	176.118.250.127	t	t	check	200 рублей	OZON	79897653211	https://directus.bmulti.store/assets/31f4d37d-901e-48d2-b4cc-69c3b1fb2506	https://directus.bmulti.store/assets/3640aa8d-c0b8-45a4-94d8-6095fc640ef5
1384	2025-08-28 11:52:54.13626+00	248181061	91.218.87.140	t	t	done	200 рублей	OZON	79261380090	https://directus.bmulti.store/assets/2442ebc2-8597-43ad-9a93-2b314df12cdc	https://directus.bmulti.store/assets/a0710a2e-270a-4829-aec8-29ca46b1b99b
1405	2025-08-29 20:19:10.894685+00	7325530777	85.115.248.76	t	t	check	200 рублей	WB	79064618702	https://directus.bmulti.store/assets/547d89b3-a2c1-4c44-a7cb-220924e2a200	https://directus.bmulti.store/assets/814ee0fb-9700-4269-affd-f658ca177078
1382	2025-08-28 08:58:33.586642+00	2067158497	98.98.129.17	t	t	done	500 рублей	OZON	\N	https://directus.bmulti.store/assets/dd2b2258-4333-41e1-9376-c63d37cd7915	https://directus.bmulti.store/assets/b9f0cef2-1a17-4c5c-90fe-5526b8ac39be
1388	2025-08-28 15:30:31.372061+00	1780685763	64.188.79.82	t	t	done	200 рублей	OZON	79996205572	https://directus.bmulti.store/assets/324a454e-ea6c-4b1a-ba05-be8399058c2f	https://directus.bmulti.store/assets/41d81916-6b04-427e-ac76-fd81a4e9c202
1383	2025-08-28 10:41:51.497702+00	7314790180	194.113.106.241	t	t	done	200 рублей	OZON	79009306264	https://directus.bmulti.store/assets/b11b7554-35bc-44f9-a0c9-eefe522c1517	https://directus.bmulti.store/assets/d5ad5a14-4d29-43de-8551-265c4373772c
1408	2025-08-30 14:28:31.33944+00	\N	163.53.244.119	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1409	2025-08-30 14:28:31.850505+00	\N	163.53.244.119	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1411	2025-08-30 15:49:47.690151+00	1667801804	176.60.169.13	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/2dae7796-40ae-4ab8-8994-22dae44ce972	https://directus.bmulti.store/assets/a5753f9b-00df-4378-a285-8580e8bbb314
1418	2025-08-31 13:28:43.589991+00	5506227533	94.140.136.92	t	t	check	200 рублей	WB	79025839596	https://directus.bmulti.store/assets/37d4e30a-865a-4f03-b077-7a8482564021	https://directus.bmulti.store/assets/0783bcd8-5dbf-4baa-9238-f39ea980c693
1413	2025-08-30 17:48:06.583251+00	1758052569	37.59.119.22	t	t	check	200 рублей	OZON	79281898603	https://directus.bmulti.store/assets/ceb061b2-d079-406b-bce5-1a2ee926bf8c	https://directus.bmulti.store/assets/35cd7498-ae3b-48d2-a449-68da23ee389b
1431	2025-08-31 20:33:37.463751+00	1344921294	89.109.51.241	t	t	check	200 рублей	OZON	79027803129	https://directus.bmulti.store/assets/766c90a4-c59e-42b1-aba1-9494455a0f2f	https://directus.bmulti.store/assets/d8e3ac0e-0c05-44a9-a697-a9a552e957e0
1416	2025-08-31 09:00:31.495401+00	5163886663	23.137.4.13	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/b475923b-9b8b-43c6-85aa-4e740718ae5d	https://directus.bmulti.store/assets/1827ed2d-959c-465d-8604-d3014baa23d1
1296	2025-08-19 17:19:37.48217+00	5676861826	64.188.79.82	t	t	done	200 рублей	OZON	79964487113	https://directus.bmulti.store/assets/34f0e9b2-0927-4ffc-aaad-609070b1eb9b	https://directus.bmulti.store/assets/0e21d129-f4dc-44e5-bb10-30c6e224f2ce
1433	2025-09-01 11:35:42.077256+00	1043611545	79.111.230.133	t	t	done	200 рублей	WB	79205603792	https://directus.bmulti.store/assets/dcf8be22-4e2d-4bea-b5ac-ce3af9b762ab	https://directus.bmulti.store/assets/7134d77e-96b8-4c27-83fd-da37888c14eb
1426	2025-08-31 16:25:03.868251+00	1080979142	188.68.35.73	t	t	done	200 рублей	OZON	79885178828	https://directus.bmulti.store/assets/1d271fd8-6d97-4fcf-a6f6-841456d603d3	https://directus.bmulti.store/assets/127e1df1-6e4b-48e5-9076-dce976179302
1422	2025-08-31 13:56:20.230538+00	1631085009	109.187.105.49	t	t	done	200 рублей	WB	79610504647	https://directus.bmulti.store/assets/282cdcaf-ec62-4792-bc0d-ccae368bec16	https://directus.bmulti.store/assets/9096c466-4ada-48b0-9227-ae90ff297757
1432	2025-09-01 00:36:20.929249+00	5273098751	212.74.220.92	t	t	done	200 рублей	OZON	79132338430	https://directus.bmulti.store/assets/9d067458-1976-41e3-ae98-2f792bc76ca6	https://directus.bmulti.store/assets/29e24b30-861d-4d19-a511-535bad1cb750
1430	2025-08-31 19:46:12.673542+00	329897442	95.24.92.71	t	t	done	200 рублей	OZON	79031719805	https://directus.bmulti.store/assets/f544bec2-9267-4373-ac60-0eb4cc5f627c	https://directus.bmulti.store/assets/cc1ce06d-7c17-4971-af55-22c0e2f4a5a9
1429	2025-08-31 18:07:24.029478+00	5475662558	188.170.72.34	t	t	done	200 рублей	OZON	79210196562	https://directus.bmulti.store/assets/d556f4ce-1c42-4085-8415-695f23dd040b	https://directus.bmulti.store/assets/42cfa754-3215-4dec-a49e-4ff3b130566f
1428	2025-08-31 17:40:10.303542+00	427050415	188.242.34.55	t	t	done	200 рублей	OZON	79997949333	https://directus.bmulti.store/assets/47cc4cd5-92e1-4b79-a944-1ba492cd44a1	https://directus.bmulti.store/assets/e6ec78c5-fcbb-4e36-8f90-8039732b6976
1421	2025-08-31 13:39:40.164596+00	8131677591	188.162.162.176	f	f	done	200 рублей	YANDEX	79235615781	https://directus.bmulti.store/assets/33739da5-b8bc-4f63-8131-3385c4a64978	https://directus.bmulti.store/assets/d5cccdf3-262e-4371-ba59-bf8f247aa9a4
1417	2025-08-31 12:30:28.157716+00	1075026670	85.17.151.92	t	t	done	200 рублей	OZON	279502937292	https://directus.bmulti.store/assets/7e246598-9027-4950-acbb-afc8aa3076c8	https://directus.bmulti.store/assets/f0737fd7-c106-4ceb-9815-31819631cc40
1419	2025-08-31 13:36:21.841979+00	1199688987	178.178.103.76	t	t	done	200 рублей	OZON	79275989512	https://directus.bmulti.store/assets/02af7276-58d3-4e40-95ca-600701818044	https://directus.bmulti.store/assets/d1bfe9bd-fc07-4d43-811a-b2ebaeacd924
1414	2025-08-31 07:18:13.564567+00	6105757579	37.29.88.90	t	t	done	200 рублей	OZON	79267643188	https://directus.bmulti.store/assets/e65b0109-72e6-4eb1-bd95-66f3b91723b8	https://directus.bmulti.store/assets/70769631-6d1b-4c81-b3c6-9c978cbba180
1441	2025-09-01 20:46:26.669063+00	1217525376	81.201.17.250	t	t	check	200 рублей	OZON	79991235029	https://directus.bmulti.store/assets/24690190-6e6a-419c-9c63-902cfdfebf96	https://directus.bmulti.store/assets/c8ed232b-8ea2-43c3-ac7e-cc28888d9c22
1442	2025-09-02 00:03:12.65674+00	1794200860	176.209.10.172	t	t	check	200 рублей	OZON	79144987470	https://directus.bmulti.store/assets/fc9ba890-1ef2-4832-a245-635deec07c90	https://directus.bmulti.store/assets/beffe8f8-c485-417c-ba85-f8d0cb4c65b4
1443	2025-09-02 09:21:36.686182+00	5961402568	144.31.176.2	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/5f91e631-9cef-4016-9e6c-78c30a2f697c	https://directus.bmulti.store/assets/89e652ab-e2a4-47df-9804-a708d3070413
1439	2025-09-01 18:02:59.262759+00	561523407	91.84.97.60	t	t	done	200 рублей	OZON	279003170967	https://directus.bmulti.store/assets/f55ad394-c13a-4146-8b33-75abf0bc90ed	https://directus.bmulti.store/assets/c040efed-784e-4f34-a380-7d10900fe0e5
1438	2025-09-01 18:00:31.272199+00	1043611545	79.111.230.133	t	t	done	200 рублей	WB	79205603792	https://directus.bmulti.store/assets/2ee187b7-bd0b-489e-9120-26996ec6da24	https://directus.bmulti.store/assets/f9e962f1-eb55-4a7f-b0b2-cdb034e3f885
1435	2025-09-01 12:58:39.628638+00	854888287	84.42.74.200	t	t	done	200 рублей	WB	79065003507	https://directus.bmulti.store/assets/d8858880-e66a-4cd7-a750-7b25e02ed346	https://directus.bmulti.store/assets/9b76e244-fbcd-435d-a6ed-73c699632f36
1434	2025-09-01 11:46:11.649098+00	1227866690	178.178.246.87	t	t	done	200 рублей	OZON	79214924946	https://directus.bmulti.store/assets/e4b9c29a-fcd5-48cf-a749-e2d2452b6fb0	https://directus.bmulti.store/assets/d69f4664-2d27-48ec-8e47-32698a5dfd72
1440	2025-09-01 20:45:40.098825+00	1265120770	185.78.239.97	t	t	done	200 рублей	OZON	79494942083	https://directus.bmulti.store/assets/018f4cdb-6e3c-4813-93b8-926e4ca1ff89	https://directus.bmulti.store/assets/6cc99d00-ac4c-403a-9bf9-837789353c2c
1437	2025-09-01 15:09:06.18955+00	1025546103	31.59.114.163	t	t	done	200 рублей	OZON	79876822848	https://directus.bmulti.store/assets/9386ae4d-6484-414b-9585-0b8212cea9de	https://directus.bmulti.store/assets/4a5d99cb-2e33-4438-afea-fb3deecdb3b2
1436	2025-09-01 14:20:24.410612+00	6493281651	152.53.93.235	t	t	done	200 рублей	OZON	79004559345	https://directus.bmulti.store/assets/48b0b49d-264f-4400-b557-b9a7d04649cf	https://directus.bmulti.store/assets/cb11c903-4c25-47f1-93c1-f6d4dd6d9276
1424	2025-08-31 15:01:13.65148+00	7054772531	212.162.152.46	f	f	done	200 рублей	YANDEX	79178534012	https://directus.bmulti.store/assets/a1392e77-4740-49b1-a619-07775d69ba84	https://directus.bmulti.store/assets/2d90ff87-22cf-40cf-b8cc-d472d0ed7a3d
1415	2025-08-31 08:59:13.756041+00	5313619226	80.246.81.1	t	t	done	200 рублей	OZON	79956920322	https://directus.bmulti.store/assets/3fa9c16a-518a-431d-951b-5581665e7a34	https://directus.bmulti.store/assets/1ee506c0-770c-4c78-87c9-7aed492ac446
1412	2025-08-30 17:06:37.518885+00	5791699730	195.211.252.159	t	t	done	200 рублей	OZON	79497056980	https://directus.bmulti.store/assets/38851f23-41b9-41e0-af17-aefd7d3ef774	https://directus.bmulti.store/assets/86200e49-1e1c-440e-9c76-b7c919a40cca
1545	2025-09-13 07:54:10.260948+00	\N	176.15.246.14	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1444	2025-09-02 10:18:33.777716+00	872007799	5.144.116.146	t	t	check	300 рублей	OZON	79117244591	https://directus.bmulti.store/assets/e97c96e1-2914-4856-8df1-ad8b45a0b7a7	https://directus.bmulti.store/assets/5f2a34b4-e875-4f0d-9df8-375f3dcfc883
1609	2025-09-16 12:10:49.633469+00	1398381214	45.144.51.240	t	t	check	200 рублей	OZON	79504915086	https://directus.bmulti.store/assets/f12fa775-c434-4994-9055-12726c4abdf1	https://directus.bmulti.store/assets/36196af1-90d7-4971-bfdf-a587f17df906
1446	2025-09-02 10:57:14.6819+00	7582352110	93.125.55.179	t	t	check	200 рублей	OZON	375298442646	https://directus.bmulti.store/assets/bdef2217-47d2-4c9d-8255-66d5695c29d9	https://directus.bmulti.store/assets/8fd6c46f-549f-4213-a0d6-662440a9a6c7
1447	2025-09-02 11:32:19.551524+00	1026745702	159.253.170.48	t	t	check	500 рублей	OZON	79625865300	https://directus.bmulti.store/assets/9d7e6182-4838-443f-a602-5bd9a2b450a4	https://directus.bmulti.store/assets/1c12db46-beeb-4110-a431-2fa8eff26beb
1445	2025-09-02 10:25:57.459307+00	985891656	85.172.88.112	t	t	done	200 рублей	OZON	79044249309	https://directus.bmulti.store/assets/2ba813bb-53b1-4746-a0a0-f2cc7a4bf066	https://directus.bmulti.store/assets/06e491cc-7fbd-4fab-9c1a-19f312b7de24
1452	2025-09-04 03:18:45.108145+00	5251517488	94.233.241.178	t	t	check	200 рублей	OZON	79283184484	https://directus.bmulti.store/assets/d818164c-5866-4a21-a76d-5b7b62267a1c	https://directus.bmulti.store/assets/21783a93-e0db-40bf-828f-0a01a2ce8f58
1449	2025-09-02 18:28:54.676418+00	1265120770	185.78.239.97	t	t	done	200 рублей	OZON	79494942083	https://directus.bmulti.store/assets/a1eaf17c-80b5-4e66-87ce-0487b0952823	https://directus.bmulti.store/assets/2040c9b4-5f6a-441b-b95c-40bfcdb7ccd2
1448	2025-09-02 18:17:05.938194+00	1043611545	79.111.230.133	t	t	done	200 рублей	WB	79205603792	https://directus.bmulti.store/assets/200a2e2b-71c2-489e-a979-d40a7fac2255	https://directus.bmulti.store/assets/88ca17e8-c77c-438e-95f7-ce1255ad0ad6
1453	2025-09-04 04:32:47.417709+00	8167170408	188.68.33.211	t	t	check	200 рублей	OZON	79147294409	https://directus.bmulti.store/assets/5507405f-ae75-4209-b44a-5af5c934089c	https://directus.bmulti.store/assets/30dd5ed9-2ca5-43f6-b3a7-5ba9f498dbb3
1457	2025-09-04 10:37:23.738186+00	8033842675	185.234.65.95	f	t	check	200 рублей	WB	79523786838	https://directus.bmulti.store/assets/f0d3f022-d93c-489c-b129-6c0ea17582b1	https://directus.bmulti.store/assets/96599cd4-ca74-4b2e-ad60-a3fdf3e16256
1454	2025-09-04 05:43:14.6613+00	6184930156	94.50.99.223	f	f	check	300 рублей	WB	79129374950	https://directus.bmulti.store/assets/8e9a8f55-c77b-4f06-bee2-976deb2c757d	https://directus.bmulti.store/assets/1316ceaa-ba5e-47b8-820f-3f36438a6176
1458	2025-09-04 10:57:33.249592+00	5616075920	45.149.244.175	t	t	check	200 рублей	WB	79785717320	https://directus.bmulti.store/assets/857bc4b5-8aa2-4fb1-9b55-08e9936f0a17	https://directus.bmulti.store/assets/314d1ea0-238f-439d-b1c5-3fb626f494ac
1459	2025-09-04 13:46:38.246251+00	2042718171	213.151.3.233	f	t	check	200 рублей	WB	79049857950	https://directus.bmulti.store/assets/e0276314-8b1b-44fc-82bc-8cb0cfa4826e	https://directus.bmulti.store/assets/828392ab-a378-492e-b4f3-4690f756d72b
1460	2025-09-04 15:37:36.500604+00	5222381414	185.193.159.217	t	t	check	200 рублей	OZON	79102770555	https://directus.bmulti.store/assets/2c682f9f-9f77-4bbe-87bd-c3336e3e97ee	https://directus.bmulti.store/assets/c3bd0a1c-c44c-43be-85ab-592b1f039460
1455	2025-09-04 08:22:52.474929+00	686854967	45.136.246.124	t	t	done	200 рублей	OZON	79219922995	https://directus.bmulti.store/assets/c25a0094-0c3d-481a-b161-48fdb06cc974	https://directus.bmulti.store/assets/5904182a-42e3-400f-aef6-9750d3c5dd38
1450	2025-09-03 12:33:38.095024+00	5215461092	188.243.119.195	t	t	done	200 рублей	OZON	79062632827	https://directus.bmulti.store/assets/39796936-4089-4faf-8744-d1b1a4bd15ee	https://directus.bmulti.store/assets/7ae51d5e-0201-400e-8b40-74290b458165
1451	2025-09-03 15:42:04.107633+00	6545230479	94.50.99.223	t	f	done	200 рублей	WB	79224178387	https://directus.bmulti.store/assets/ec42f897-4e08-4183-95e0-9ca416bf737f	https://directus.bmulti.store/assets/a2f7d329-4ea7-4657-a77c-4cff256114f3
1463	2025-09-05 16:20:47.523727+00	1748223917	185.218.109.121	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/e235660a-8b62-42cf-b28c-4f3f9f9fff95	https://directus.bmulti.store/assets/4bbae945-94e0-4fd5-ba17-e70edf979fc0
1462	2025-09-05 07:46:42.451283+00	428229845	188.162.80.8	t	t	check	200 рублей	OZON	279015104839	https://directus.bmulti.store/assets/7c0e79ed-85e6-457a-9e71-1c9b48fbc9ba	https://directus.bmulti.store/assets/075deddf-b9c3-4133-a593-76582f591ff9
1456	2025-09-04 10:27:49.952546+00	5186147038	213.87.89.69	t	t	done	200 рублей	OZON	79104767570	https://directus.bmulti.store/assets/378a8a2e-3942-4be5-a8eb-eae70689970d	https://directus.bmulti.store/assets/232ee52d-0b6a-4eed-89ac-902c2a0f39de
1461	2025-09-04 16:17:21.239939+00	1780363750	64.238.203.126	t	f	done	200 рублей	WB	79619176855	https://directus.bmulti.store/assets/f67693a5-ebca-424b-86fa-878bd466c8ac	https://directus.bmulti.store/assets/25546c28-1bf7-4e4b-a821-10bdfdea61cc
1466	2025-09-06 08:47:33.06044+00	7196120332	195.20.119.92	t	t	check	200 рублей	OZON	79898380292	https://directus.bmulti.store/assets/34f9e503-3c41-41ae-b402-40f0209cea8c	https://directus.bmulti.store/assets/7a515f0e-8044-4c44-a250-2f839e10f308
1469	2025-09-06 10:45:42.280121+00	5828639961	94.158.33.54	t	t	check	200 рублей	OZON	79591358315	https://directus.bmulti.store/assets/b7e03f23-a261-48e6-8011-72988de0dbf7	https://directus.bmulti.store/assets/5066f5f9-0c5c-43f5-b69b-f86ede550836
1470	2025-09-06 10:49:35.997132+00	1141593409	178.69.115.138	t	t	check	500 рублей	OZON	79535097525	https://directus.bmulti.store/assets/c6573596-6b62-42bb-85dc-03e25cfc4d2d	https://directus.bmulti.store/assets/fb863865-9fc2-4bd4-9edb-183fff75f0a4
1472	2025-09-06 13:28:42.103345+00	1356685058	185.117.143.189	t	t	check	200 рублей	OZON	79780236643	https://directus.bmulti.store/assets/cc802a05-dd19-4b7e-9806-d9f62a8f3666	https://directus.bmulti.store/assets/b9059205-e249-4232-9e4d-116e08f059c2
1471	2025-09-06 12:51:44.404348+00	6661369414	213.87.132.22	t	t	done	200 рублей	OZON	79167042401	https://directus.bmulti.store/assets/2825bee2-e034-43a6-b550-54aa75b50b01	https://directus.bmulti.store/assets/0967f8cf-5441-4799-b4f8-f6f9a9f6e678
1465	2025-09-06 07:50:36.823739+00	492478799	176.106.245.191	t	t	done	200 рублей	OZON	79261876011	https://directus.bmulti.store/assets/55cb504f-9405-4cfa-97d1-b94bea5cd5df	https://directus.bmulti.store/assets/435ca306-ec0d-4915-b9d2-1a3100a803f9
1464	2025-09-06 00:26:54.99439+00	7101791171	143.14.40.28	f	t	done	200 рублей	WB	79856195656	https://directus.bmulti.store/assets/50c2a316-5799-41d2-b44d-164c45d86dfb	https://directus.bmulti.store/assets/c75c9f99-836c-4aa9-b302-2cfd5b6c0e01
1467	2025-09-06 09:09:59.872789+00	822741953	176.109.176.142	t	t	done	200 рублей	OZON	79591482547	https://directus.bmulti.store/assets/924e13bd-420a-4c64-9ad9-06a608cac3a4	https://directus.bmulti.store/assets/4726cb5d-18f0-4324-afcd-c31968e6837e
1482	2025-09-07 17:49:20.691251+00	448463846	178.120.51.114	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/c4676e12-9ffe-4f7f-a66b-4533e93dddd5	https://directus.bmulti.store/assets/702d3196-9d46-40aa-895e-51ab486f8cb6
1483	2025-09-07 18:13:02.059477+00	1110974943	178.123.99.91	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/9286f736-f496-450b-80e5-59e5849168ea	https://directus.bmulti.store/assets/66dd09fb-5240-4efc-8316-96f794feea8d
1475	2025-09-06 18:14:45.389811+00	262268269	77.79.158.167	t	t	done	200 рублей	OZON	79872369082	https://directus.bmulti.store/assets/e4c3547f-e2f6-4b44-9e0d-5dbd041edadc	https://directus.bmulti.store/assets/4673929c-324b-42d6-ae4b-3a2e93767a71
1473	2025-09-06 15:43:35.903309+00	5279707725	193.36.132.100	t	t	done	200 рублей	WB	79586439761	https://directus.bmulti.store/assets/99ccca57-f578-43e1-92a2-8d35aeb87888	https://directus.bmulti.store/assets/c425e58d-0acc-4517-9cf6-a171194b752a
1474	2025-09-06 16:48:45.777852+00	246374981	185.114.139.242	t	t	done	200 рублей	OZON	79493008748	https://directus.bmulti.store/assets/a9222afd-c829-439b-b666-2100d3fe4f7c	https://directus.bmulti.store/assets/4a695737-c887-4eed-9dfc-58f336f111fb
1485	2025-09-08 10:43:21.054251+00	6512145999	185.193.159.182	f	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/a4d2d011-13ef-40fb-95fe-7c370bcd42be	https://directus.bmulti.store/assets/2a9fe009-9a9d-408f-9cd5-38ab853b6be1
1478	2025-09-07 13:08:46.887757+00	568462481	94.25.229.22	t	t	done	200 рублей	OZON	79961727050	https://directus.bmulti.store/assets/46346c78-5252-43b1-b922-71c08b796008	https://directus.bmulti.store/assets/053a3985-896b-47e3-8819-ec18a5ab1711
1481	2025-09-07 16:22:47.346317+00	1467828610	45.145.164.25	f	t	done	200 рублей	OZON	79883631092	https://directus.bmulti.store/assets/7bbcb471-dd53-4f83-849d-72a0b779e4d9	https://directus.bmulti.store/assets/43175773-9365-4f3d-a868-0c97ef358f90
1476	2025-09-07 05:15:49.682886+00	428648544	77.35.127.220	t	t	done	200 рублей	OZON	79146906197	https://directus.bmulti.store/assets/63baf259-2f7d-4480-8c3c-28a338e02826	https://directus.bmulti.store/assets/4131db23-ebc0-436e-8fb7-8dd5398ca53a
1487	2025-09-08 17:41:56.963351+00	2067158497	128.204.74.58	t	t	done	200 рублей	OZON	79092473363	https://directus.bmulti.store/assets/ef377192-4450-4184-b82a-4d3d296dcc71	https://directus.bmulti.store/assets/cf592972-d187-4ffe-9f0a-028f9f4acfdd
1490	2025-09-09 09:10:50.270389+00	1269783242	185.193.158.68	t	t	done	200 рублей	OZON	79132122030	https://directus.bmulti.store/assets/28a53746-2a3e-4c70-b647-9a7587044fcd	https://directus.bmulti.store/assets/4f054e2d-320c-4a5d-9bc3-73cf33f88adb
1488	2025-09-08 19:25:26.688398+00	1889456998	87.248.239.54	t	t	done	200 рублей	OZON	79817516664	https://directus.bmulti.store/assets/8fb4ca3e-d5f5-4e9a-9ba2-814674a9a376	https://directus.bmulti.store/assets/88efbcd5-a07f-46a5-9c1d-534df1d01017
1486	2025-09-08 14:05:07.206389+00	1795537283	213.151.22.84	t	t	done	200 рублей	OZON	79000414056	https://directus.bmulti.store/assets/3aeaf868-1da8-40cb-ac89-b761c3a5bb17	https://directus.bmulti.store/assets/545373bf-9d01-4a03-96e9-fbba0e2b112c
1484	2025-09-07 20:35:25.531353+00	2111519623	79.127.142.116	t	t	done	200 рублей	WB	79604757564	https://directus.bmulti.store/assets/dfd33c0e-e1e7-4755-a4da-84b792833a35	https://directus.bmulti.store/assets/d0b84dfb-64a8-4c4c-a8ca-6a0e94184618
1479	2025-09-07 14:52:13.744094+00	936958019	77.106.3.8	t	t	done	200 рублей	OZON	79115253341	https://directus.bmulti.store/assets/664a684a-9bd4-424e-bd64-9b026e679405	https://directus.bmulti.store/assets/081d0cfe-3e9d-4da1-8366-1dc8909be051
1480	2025-09-07 14:56:46.324696+00	6074515067	81.222.178.107	t	t	done	200 рублей	OZON	79646667313	https://directus.bmulti.store/assets/816cb006-e3f0-4a98-a91d-95f2377d4e2c	https://directus.bmulti.store/assets/e3e720a2-00c1-42bf-b700-67e8e0d9912a
1499	2025-09-09 19:15:25.393707+00	6589469136	108.181.21.79	t	f	check	200 рублей	WB	79262988245	https://directus.bmulti.store/assets/bfc8b4ae-2c2f-4812-8a7f-802a443491e5	https://directus.bmulti.store/assets/25653488-2828-47f6-a6eb-101b136477d7
1489	2025-09-09 07:10:05.072276+00	8409038938	95.155.132.172	t	t	done	200 рублей	OZON	79493255468	https://directus.bmulti.store/assets/d6aedc23-b56c-48a6-a935-50a17c8c7832	https://directus.bmulti.store/assets/ffccf7bd-1d35-4a08-aa75-eab457b235a0
1500	2025-09-09 19:17:50.776803+00	6576184204	108.181.21.79	t	f	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/21896c33-a24d-4a04-b8ff-30744101da43	https://directus.bmulti.store/assets/09933958-4caa-451e-8655-1d6589c1fd6d
1501	2025-09-10 02:08:04.035877+00	7398735075	77.82.198.156	t	t	done	200 рублей	OZON	79954939852	https://directus.bmulti.store/assets/e3878fd3-cfcb-40fc-9204-1370f66d9eb0	https://directus.bmulti.store/assets/ee7d6d59-56c3-47e3-aedd-a07d0aa6790e
1498	2025-09-09 18:47:09.834362+00	7150809006	94.25.224.117	t	t	done	200 рублей	OZON	79992505679	https://directus.bmulti.store/assets/32756faa-926f-4ed9-8a40-82daf08a5052	https://directus.bmulti.store/assets/3c30dae5-f2e9-407f-aa16-13eec466f3fb
1497	2025-09-09 16:53:12.11071+00	946218208	45.134.15.239	t	t	done	200 рублей	OZON	79536770090	https://directus.bmulti.store/assets/665bdec1-f5f2-44c3-a8fa-6535076826ec	https://directus.bmulti.store/assets/312d0480-ea53-40b0-b9ee-0e9c6a28358b
1496	2025-09-09 16:00:31.239275+00	990688393	185.13.179.3	t	t	done	200 рублей	WB	79136351035	https://directus.bmulti.store/assets/19ed8e27-6f6a-42a1-882a-569bfbc0d677	https://directus.bmulti.store/assets/a17080c5-7ab8-4b69-accf-236370556c77
1495	2025-09-09 15:43:34.837686+00	488261072	62.78.40.182	t	t	done	200 рублей	WB	79850703075	https://directus.bmulti.store/assets/5aa8c7d5-4fbb-4dfa-bb81-245dfab76979	https://directus.bmulti.store/assets/795c5474-ff36-4d80-b85b-3943b23027fd
1494	2025-09-09 15:25:56.587252+00	5140965030	37.203.38.220	t	t	done	200 рублей	WB	79952965250	https://directus.bmulti.store/assets/a9633ab9-e1b6-4d5d-a0de-8778be1cba72	https://directus.bmulti.store/assets/ca6a59ab-1d4d-4dc8-8abf-9e33efb5c9e1
1493	2025-09-09 14:28:41.692375+00	1998189405	176.59.123.25	t	t	done	200 рублей	OZON	79509484411	https://directus.bmulti.store/assets/c62560a2-f37a-48d6-a34e-245a6b395b72	https://directus.bmulti.store/assets/d7cc1b54-72d5-42a3-b74c-c46860b9370e
1492	2025-09-09 11:50:28.473742+00	5185860295	89.253.41.76	t	f	done	200 рублей	WB	79507269996	https://directus.bmulti.store/assets/0e34d8f4-2e6b-4ce0-a4e6-5298a38abed7	https://directus.bmulti.store/assets/98e044c5-8d75-492b-b0d5-a1d9f8a8e667
1491	2025-09-09 10:55:06.094343+00	1049573100	95.211.45.63	t	t	done	200 рублей	WB	79036613532	https://directus.bmulti.store/assets/3ea4181a-18db-4e9d-a9e6-8f4f820cb2d9	https://directus.bmulti.store/assets/f40ed351-d2f1-4227-8d7e-9dbdb4637370
1477	2025-09-07 10:48:47.043818+00	5217124038	178.158.183.110	t	t	done	200 рублей	OZON	79494574691	https://directus.bmulti.store/assets/a19e574e-20b0-4838-9749-25ddbfc2ac75	https://directus.bmulti.store/assets/ce63db4c-eda7-4f7d-ba83-00da2f16e380
1508	2025-09-10 09:20:44.559602+00	1757006608	92.124.162.229	t	t	check	200 рублей	WB	79136471328	https://directus.bmulti.store/assets/52151226-16b9-40fc-bfa7-5d26b634b037	https://directus.bmulti.store/assets/2dbc6108-7704-4314-bb3c-df6850c7cbb6
1507	2025-09-10 09:15:28.334442+00	2068913691	178.176.160.77	t	t	done	200 рублей	WB	79991703613	https://directus.bmulti.store/assets/04ca9bf6-3275-4d59-9518-707078b3d46b	https://directus.bmulti.store/assets/0707d5be-3748-41b4-b91f-694a5b13ef2b
1511	2025-09-10 12:03:31.083699+00	5336730614	185.237.248.56	t	t	in_work	300 рублей	WB	\N	https://directus.bmulti.store/assets/d0ee773b-c7ec-492c-9b3f-f15b07db68c8	https://directus.bmulti.store/assets/94d18b6c-3d7e-4f74-be78-94155bafd8a8
1504	2025-09-10 08:30:09.884434+00	6301418565	5.144.74.230	t	t	done	200 рублей	WB	79535235000	https://directus.bmulti.store/assets/2fc217a8-db81-4e01-b3f8-4db9c9b890bb	https://directus.bmulti.store/assets/eff92c24-e348-4fa2-bf7f-aa15fe0ff6da
1503	2025-09-10 08:21:36.228773+00	990950043	178.176.187.6	t	t	done	500 рублей	WB	79021210228	https://directus.bmulti.store/assets/9148a6cd-51aa-4630-9fc5-cd5e6a430907	https://directus.bmulti.store/assets/ff114566-33ac-46e8-bc69-7a78e1386b46
1502	2025-09-10 07:31:28.44468+00	1600576675	188.162.228.3	t	t	done	200 рублей	WB	79990871244	https://directus.bmulti.store/assets/c75585ed-2ded-47b2-995e-108cfb3310b6	https://directus.bmulti.store/assets/cac7e643-c014-447a-bc51-24a6a0bab5d2
1530	2025-09-12 12:45:43.505283+00	5123347464	92.124.163.56	t	t	done	200 рублей	OZON	79237004075	https://directus.bmulti.store/assets/e0f75f32-9c4b-4875-949c-2424fefab393	https://directus.bmulti.store/assets/92dbf3f6-0ace-4711-a4ff-1f551f461382
1518	2025-09-11 04:20:27.384289+00	432371024	89.110.124.113	t	t	done	200 рублей	OZON	79241467522	https://directus.bmulti.store/assets/77eef38d-c0b4-4ecc-b668-761b6d781b9e	https://directus.bmulti.store/assets/b22f92d1-0f51-475a-a7c9-f18fd9f5954e
1524	2025-09-11 16:49:50.721956+00	6743976508	85.175.68.60	t	t	check	200 рублей	OZON	79996469919	https://directus.bmulti.store/assets/b3684b8b-ac31-4bd8-b209-7df6d088da92	https://directus.bmulti.store/assets/d68f8df9-72d4-4837-8c50-40dd8daf6dfc
1506	2025-09-10 09:14:47.552359+00	978012172	46.63.128.80	t	f	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/34343b81-9ef9-4666-ac2e-de95c9203be7	https://directus.bmulti.store/assets/176094f0-3580-4bc5-92d6-27f1bbfd2a8c
1517	2025-09-10 17:26:24.551015+00	5797723375	84.42.92.79	t	t	done	200 рублей	OZON	79590066600	https://directus.bmulti.store/assets/2cdf2409-d83e-41fa-b0df-b96fde996ca8	https://directus.bmulti.store/assets/d7ce6dba-b11c-490d-986a-c08117d519e2
1516	2025-09-10 17:01:03.652878+00	1034381219	194.49.53.224	t	t	done	200 рублей	OZON	79771415304	https://directus.bmulti.store/assets/d9066238-d412-4e6e-967f-df89c49a1b84	https://directus.bmulti.store/assets/912cfc97-a677-40f4-aa80-215b7ae2e15d
1515	2025-09-10 14:05:51.423801+00	7942323858	94.77.27.168	t	t	done	200 рублей	OZON	279022165990	https://directus.bmulti.store/assets/d09ca75a-3522-46e9-9ccd-defd633a644e	https://directus.bmulti.store/assets/eef30823-e76b-4a37-b21a-522db8bffcfe
1514	2025-09-10 13:27:32.449984+00	246463746	109.237.14.250	t	t	done	200 рублей	OZON	79114770161	https://directus.bmulti.store/assets/e2bc966b-7244-4573-bdb2-ad0c10c4a945	https://directus.bmulti.store/assets/8334e2af-5792-44eb-bd95-c4077a829253
1512	2025-09-10 12:14:32.93058+00	1070365514	91.205.161.188	t	t	done	1000 рублей	OZON	79286344436	https://directus.bmulti.store/assets/c56a2503-29a0-4109-abed-ebc03171c14d	https://directus.bmulti.store/assets/82490214-bffe-455a-912e-22fdde63587a
1510	2025-09-10 10:49:02.36356+00	349727871	212.115.51.196	t	t	done	200 рублей	OZON	79992701985	https://directus.bmulti.store/assets/4e9d2987-0b17-4291-ae2a-33702f5428ec	https://directus.bmulti.store/assets/e6812eee-7400-4aff-a9ac-069daa448874
1513	2025-09-10 13:17:00.109316+00	293677031	37.221.192.240	t	t	done	200 рублей	OZON	79169138096	https://directus.bmulti.store/assets/cc0bacf5-8234-4f84-a644-92007ee78fbd	https://directus.bmulti.store/assets/69827bfb-1cb9-47e9-9d52-5f0a5f4876c9
1509	2025-09-10 09:23:19.86822+00	1674768156	217.28.79.6	t	t	done	200 рублей	WB	79222145168	https://directus.bmulti.store/assets/9efc13b3-ca88-41f1-abd7-77a8b2cb3b19	https://directus.bmulti.store/assets/145e4c77-9392-4dcb-b614-8c7fdbbe4097
1505	2025-09-10 08:57:22.158816+00	1904861625	194.190.197.117	t	t	done	200 рублей	WB	79219383927	https://directus.bmulti.store/assets/3f2ce2c0-e255-45b1-80d7-9890e465120d	https://directus.bmulti.store/assets/b8a7462c-aba1-445a-8941-f32807e33191
1529	2025-09-12 08:36:24.017487+00	5276108361	188.19.60.109	f	f	check	200 рублей	WB	79324049320	https://directus.bmulti.store/assets/b7651845-064c-4a11-95c3-48463c956b16	https://directus.bmulti.store/assets/f637c237-d013-42b0-923d-b8f5c8cb2495
1523	2025-09-11 15:50:34.256147+00	1125146445	45.88.54.39	t	t	done	200 рублей	OZON	79787309130	https://directus.bmulti.store/assets/5982723d-87cd-47fb-9952-042959dc844c	https://directus.bmulti.store/assets/c1dd03ea-4915-4ade-ab80-daf3a3293167
1528	2025-09-12 08:33:42.252967+00	5685623611	89.237.42.5	t	f	done	200 рублей	WB	79514491572	https://directus.bmulti.store/assets/a4a5ed04-871d-488b-9962-24aa0d6626ba	https://directus.bmulti.store/assets/b4d1bc18-bcb2-4cef-9056-2cce3abcd771
1527	2025-09-12 03:12:40.363484+00	2008444993	31.162.26.3	t	t	done	200 рублей	WB	79194609346	https://directus.bmulti.store/assets/e963aa2f-a901-483e-afe3-19244abeeb9f	https://directus.bmulti.store/assets/753a5967-8c88-4944-9ed4-4756b0986fee
1526	2025-09-11 19:32:08.31176+00	1889456998	94.19.70.230	t	t	done	200 рублей	OZON	79817516664	https://directus.bmulti.store/assets/6cd5c23e-230d-46a5-b7f6-fd3ea04260cc	https://directus.bmulti.store/assets/b27d7a1c-0069-4730-8627-9f0c315df97c
1525	2025-09-11 17:04:07.723005+00	2059503614	178.176.82.22	t	t	done	200 рублей	WB	79226245064	https://directus.bmulti.store/assets/757fdd94-fa1d-4293-9f50-e668d180e3eb	https://directus.bmulti.store/assets/56a3d32e-47a5-49d1-b4c4-fc8c23083834
1522	2025-09-11 14:28:14.564875+00	5246921661	91.84.102.167	t	t	done	200 рублей	OZON	90420627332	https://directus.bmulti.store/assets/acf1ed05-767c-437b-bda2-94e8e808b842	https://directus.bmulti.store/assets/ee9ebb82-3a7b-45b1-b8f8-2763df891eee
1521	2025-09-11 12:41:22.232056+00	6668394819	37.203.38.220	t	t	done	200 рублей	WB	79172786616	https://directus.bmulti.store/assets/5f2c2c2f-6467-4138-81f8-4fd7439aac66	https://directus.bmulti.store/assets/8efd6ff9-f076-4c0a-9c07-d43365ab2354
1520	2025-09-11 12:36:05.361067+00	503532948	37.203.38.220	t	t	done	200 рублей	WB	79952965250	https://directus.bmulti.store/assets/a576f7ab-984c-4e0c-95c0-ea64484a209c	https://directus.bmulti.store/assets/e66d018b-8fc3-4038-9cec-0c1d9acd7c3d
1519	2025-09-11 09:06:10.857534+00	420388655	152.53.111.89	t	t	done	200 рублей	WB	\N	https://directus.bmulti.store/assets/e9ecc0e5-a107-41ed-8047-a8782dc0c0e7	https://directus.bmulti.store/assets/bc16d6ac-10d9-42a9-b406-968d51c8a7b3
2076	2025-10-11 10:49:54.678061+00	79850664	178.178.249.101	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/c2526781-2a13-4157-b49d-71f9376b8b45	https://directus.bmulti.store/assets/b2e6be11-a0df-4363-bfb9-d5463159a0fb
1533	2025-09-12 15:29:55.115175+00	581809566	93.92.202.251	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/5f55b38e-c417-41ff-9f33-20d48aa91616	https://directus.bmulti.store/assets/d58e0925-5260-4b2f-9d53-ceada575a83f
1538	2025-09-12 18:32:10.942436+00	5845008819	5.139.189.121	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/1a4c9548-4544-4ba3-8a60-893f46fa4bff	https://directus.bmulti.store/assets/d8a70e98-0729-4c37-902a-cd49a982dca2
1535	2025-09-12 16:37:47.422374+00	5193873972	95.104.190.215	t	t	done	200 рублей	OZON	79628317817	https://directus.bmulti.store/assets/b7c12303-18dd-40bd-9a3f-265e49e9df54	https://directus.bmulti.store/assets/4cf6ec4c-2e2e-4da8-ae33-630cd82e5b98
1547	2025-09-13 11:09:24.824867+00	5397025	79.139.196.237	t	t	done	200 рублей	OZON	79939110995	https://directus.bmulti.store/assets/7302edef-4e71-4f52-b858-2dedb644e0ec	https://directus.bmulti.store/assets/a85d4759-369f-4cd2-835b-f35fd7c3dbc7
1546	2025-09-13 07:57:50.634481+00	2076522408	176.15.246.14	t	t	done	200 рублей	OZON	79054604242	https://directus.bmulti.store/assets/ea5828e5-370d-435f-8d48-a89c5b22a184	https://directus.bmulti.store/assets/97d04a52-eb4d-4c5a-9c09-2914699c055a
1543	2025-09-13 06:26:53.36118+00	1202358785	109.124.229.219	t	t	done	200 рублей	OZON	79879438220	https://directus.bmulti.store/assets/d26037be-24c2-4dc9-8a3a-4563226b0c2f	https://directus.bmulti.store/assets/b342c2cc-fb6e-490d-bc74-701456f2e933
1542	2025-09-13 06:24:53.390062+00	740001769	178.157.147.248	t	t	done	200 рублей	OZON	79532629300	https://directus.bmulti.store/assets/9769aed5-6b13-4656-8a09-691e9cd03e5f	https://directus.bmulti.store/assets/5660fe13-05df-4457-96e2-539541714255
1541	2025-09-13 04:02:52.370102+00	5085613938	178.178.243.104	t	t	done	200 рублей	OZON	79223801237	https://directus.bmulti.store/assets/44374413-bd68-49fc-b724-a284ce16c839	https://directus.bmulti.store/assets/4b8c6969-2919-4518-9848-b112b8e6221d
1537	2025-09-12 17:47:06.016862+00	514028841	92.118.72.166	t	t	done	200 рублей	OZON	79612897327	https://directus.bmulti.store/assets/f19a1755-570f-4111-81c8-6c2e03c51980	https://directus.bmulti.store/assets/98d4f71f-7dd1-4de6-a900-8f3f703caad6
1536	2025-09-12 17:05:53.075063+00	846555147	188.143.218.139	t	t	done	200 рублей	OZON	79095264100	https://directus.bmulti.store/assets/86f77bbd-3faa-4288-aa33-9b11338498f2	https://directus.bmulti.store/assets/fffdbc30-1fa1-463a-b69a-97ccc059559f
1534	2025-09-12 16:15:00.68623+00	876329289	91.215.91.51	t	t	done	300 рублей	WB	79384676869	https://directus.bmulti.store/assets/8d13a480-1655-4193-8e8c-603a0dba75ee	https://directus.bmulti.store/assets/f11e1e8c-47c4-46c5-a81a-00c99c171217
1540	2025-09-13 03:37:04.803492+00	949818373	178.140.208.211	t	t	done	200 рублей	WB	79151270039	https://directus.bmulti.store/assets/cb9fcc07-982c-4519-ab0e-62ca3fb61b2e	https://directus.bmulti.store/assets/09603e82-fca3-487b-b26e-fec9434e2d15
1539	2025-09-12 19:08:37.677183+00	5974368023	178.141.243.155	t	t	done	200 рублей	OZON	79634337083	https://directus.bmulti.store/assets/a9e270f3-14b9-4bcd-87ad-f8b26970ed67	https://directus.bmulti.store/assets/17461b72-1721-4862-b05e-2de2b06d1be3
1532	2025-09-12 15:08:51.985296+00	798557181	188.94.32.102	t	t	done	200 рублей	OZON	79168581494	https://directus.bmulti.store/assets/2cfcf6d7-9b03-41f2-a7da-1424e153fb86	https://directus.bmulti.store/assets/34cbffd7-603c-4bc8-b540-45d0b89d512f
1531	2025-09-12 14:30:21.300829+00	469653157	89.23.150.45	t	t	done	200 рублей	OZON	79093774673	https://directus.bmulti.store/assets/2a4087f7-d87c-4f97-8cac-a01c81631a43	https://directus.bmulti.store/assets/3643d1e6-e336-469e-9594-50bafc1f3ad5
1556	2025-09-14 03:14:32.44907+00	7854947323	95.189.195.208	t	t	check	200 рублей	WB	79006754456	https://directus.bmulti.store/assets/cb5cce87-4bb9-41d6-826c-274d58a196d0	https://directus.bmulti.store/assets/3eeb96b7-5726-414d-8e9a-3bd2ace68fe1
1559	2025-09-14 09:39:01.667903+00	1888026299	79.105.107.73	t	f	check	200 рублей	OZON	79060218986	https://directus.bmulti.store/assets/ebeef620-b772-425e-9d1a-a3ec3e952aa8	https://directus.bmulti.store/assets/a98375d8-4f70-4155-8c23-8d8603cd3205
1561	2025-09-14 10:12:07.411927+00	5925157952	46.236.175.57	t	f	done	200 рублей	OZON	89996204641	https://directus.bmulti.store/assets/a091adfe-9efb-47b2-ac3c-4e2d29d3cbd2	https://directus.bmulti.store/assets/c7d625d7-c077-44d1-b33b-ea45073acdb0
1560	2025-09-14 09:59:24.716361+00	2092299912	185.6.228.94	t	t	done	200 рублей	WB	79517580383	https://directus.bmulti.store/assets/cfe58f43-c795-48b0-8047-3004ca42d4e4	https://directus.bmulti.store/assets/b934d3a6-f034-416d-94c6-40983b6091ae
1558	2025-09-14 08:59:17.902127+00	5137032097	94.233.251.59	t	t	done	200 рублей	WB	79371293057	https://directus.bmulti.store/assets/1b073eeb-38c3-4f3e-b86d-5b6ccedc7b55	https://directus.bmulti.store/assets/10379cbd-f4c4-4cfe-8f48-dd86b12dd4b3
1557	2025-09-14 08:45:30.571445+00	6097792057	77.243.83.228	t	f	done	1500 рублей	WB	79009503063	https://directus.bmulti.store/assets/8f99bb2c-4e0f-4991-b91d-5d05093c6c4c	https://directus.bmulti.store/assets/bab5bf67-4e3a-45cc-bf8d-094bdd3c8f8d
1555	2025-09-13 23:45:53.82288+00	721157500	176.15.171.202	t	t	done	200 рублей	OZON	79934808966	https://directus.bmulti.store/assets/879755c5-040b-4cce-9947-c654ecbc4fd5	https://directus.bmulti.store/assets/2a527e29-f958-41b4-9b97-d2ffb33e641e
1554	2025-09-13 19:45:03.972828+00	6449374739	88.147.152.70	t	t	done	200 рублей	WB	79270581473	https://directus.bmulti.store/assets/14e6cba0-aaf6-4015-a419-c5977ebc86f9	https://directus.bmulti.store/assets/ee5233a5-6ee5-41b1-ad4f-6509c96f8206
1553	2025-09-13 19:04:32.314064+00	673925584	92.243.182.111	t	t	done	200 рублей	OZON	79629980894	https://directus.bmulti.store/assets/3ae6c5d0-44b4-40a2-910f-ba260b163891	https://directus.bmulti.store/assets/4c30a116-9a59-4f6d-ae63-13aabf9ba27a
1552	2025-09-13 16:49:03.311292+00	7094163728	95.153.171.94	t	t	done	200 рублей	YANDEX	79786767502	https://directus.bmulti.store/assets/95076628-5048-4e15-8d80-c0996ad448db	https://directus.bmulti.store/assets/f2663137-dd75-4382-8c05-0d8e0a32e0bf
1551	2025-09-13 16:37:56.737352+00	6035799616	213.59.158.187	t	t	done	200 рублей	OZON	79933687445	https://directus.bmulti.store/assets/e2c59939-3213-497f-9494-2b3f32bec4a0	https://directus.bmulti.store/assets/eeeef929-ea87-4fec-8d09-fadf148ee949
1550	2025-09-13 14:16:02.884061+00	5180138118	176.211.121.6	t	t	done	200 рублей	OZON	79787587430	https://directus.bmulti.store/assets/e4fc9ab8-ef1d-49dc-aed6-4d3e8523f855	https://directus.bmulti.store/assets/7ad2a7a1-b51c-46e1-9d08-53983b8f68a5
1549	2025-09-13 14:09:30.182131+00	1951970964	46.149.46.167	t	t	done	200 рублей	WB	79307773005	https://directus.bmulti.store/assets/6e3b8580-744e-4357-8bca-aeb8a462697c	https://directus.bmulti.store/assets/cc20bc80-473e-4bc2-b60e-d228a5f5a655
1548	2025-09-13 13:29:08.618405+00	811595539	46.39.23.14	t	t	done	200 рублей	OZON	79227672427	https://directus.bmulti.store/assets/36294a69-9717-4ecc-9372-3d51d95477db	https://directus.bmulti.store/assets/1c4cb1c5-d2c5-4287-95f7-a38ffa1ca752
1563	2025-09-14 11:14:49.087422+00	472871600	91.244.112.33	t	f	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/16a9a876-2e6c-4b1e-babb-e64e4e3d8171	https://directus.bmulti.store/assets/7ec1968f-6a47-4979-8e3d-b1adcd06c70c
1589	2025-09-15 13:49:04.153686+00	366940470	88.147.174.72	t	t	done	200 рублей	OZON	79271445705	https://directus.bmulti.store/assets/f48457af-8d15-44ee-9590-f920f12fd24c	https://directus.bmulti.store/assets/2053d1e8-adb2-49ce-b07b-ed2255d99292
1588	2025-09-15 13:36:45.827894+00	5335824610	37.194.150.101	t	f	done	200 рублей	OZON	79130005665	https://directus.bmulti.store/assets/85c89b58-cfd1-403d-8520-acd8963676c7	https://directus.bmulti.store/assets/97a15990-16c9-40db-bd07-f9f7dd70c64d
1587	2025-09-15 13:22:25.068303+00	928896128	95.24.149.103	f	t	done	200 рублей	WB	79637279963	https://directus.bmulti.store/assets/59451d47-2ad0-4114-a1a7-3caba012754b	https://directus.bmulti.store/assets/f4f032a1-2c62-49a7-a2a7-4e5b837597c0
1564	2025-09-14 11:19:38.214079+00	903336522	85.192.189.118	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/ddc37adb-a8c7-4ea6-958d-fd225080fcd1	https://directus.bmulti.store/assets/f39fc75a-6a90-4888-b1a4-7de5e4566c95
1568	2025-09-14 14:57:05.492887+00	8419430696	193.34.125.10	t	t	done	200 рублей	WB	79961443752	https://directus.bmulti.store/assets/c923720e-a457-4b27-99d8-face6ceeb4de	https://directus.bmulti.store/assets/7d7abe68-c2e6-49e8-b827-4bd7b79c5d66
1610	2025-09-16 12:27:45.015884+00	1398216158	91.149.120.197	t	t	done	200 рублей	WB	90865889272	https://directus.bmulti.store/assets/132c4281-92e5-4052-925e-dff76751c254	https://directus.bmulti.store/assets/ee54a5e3-20d1-4107-95d4-2b6bd1272e6e
1571	2025-09-14 16:18:09.274261+00	5500761096	85.192.189.224	t	f	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/bdc20cd5-8684-4a7a-9b67-43f5dd0cdb24	https://directus.bmulti.store/assets/b34b2655-2aba-4393-98d5-943252dc0511
1582	2025-09-15 11:28:15.830144+00	6387330486	89.47.175.161	t	f	check	200 рублей	OZON	79028783639	https://directus.bmulti.store/assets/1662e735-1145-4f89-bc4c-58eeb8b38133	https://directus.bmulti.store/assets/6ac0f078-2546-4c44-9b79-2ea3752c649f
1585	2025-09-15 12:15:31.505716+00	1400743460	151.249.141.123	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/3f3ccda1-d42c-42a9-849d-36d26db648d6	https://directus.bmulti.store/assets/f49269cf-018c-4701-89a2-afaccb353166
1586	2025-09-15 12:54:13.347376+00	7176136027	84.42.94.14	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/3b0d8ce4-ba25-4bb4-8bb1-3d72e05ab35b	https://directus.bmulti.store/assets/88828f86-917b-4fbe-b225-fc5f69f0fec9
1584	2025-09-15 12:03:20.347467+00	1693474677	94.25.234.40	t	t	done	200 рублей	OZON	79111573518	https://directus.bmulti.store/assets/e593910e-fd7d-43a3-ae18-13e39a94f2df	https://directus.bmulti.store/assets/5ccb9ae6-bb0c-4d90-b91a-862eaf1753b6
1581	2025-09-15 10:24:54.044546+00	7873825273	92.248.165.210	t	t	done	200 рублей	OZON	79527298728	https://directus.bmulti.store/assets/2ffca7c9-aefb-43eb-a142-04bcb620aba8	https://directus.bmulti.store/assets/239f5258-4529-4558-acbd-2cea56508545
1580	2025-09-15 07:48:04.657467+00	1356748083	176.59.70.88	t	t	done	200 рублей	WB	79515043343	https://directus.bmulti.store/assets/efe46b3b-52eb-49a3-b459-aec3f8fd1ebc	https://directus.bmulti.store/assets/3b347ebe-288a-42a6-9625-028c1a99dc17
1583	2025-09-15 11:37:34.315982+00	1003820025	143.14.41.100	t	t	done	200 рублей	OZON	79901455471	https://directus.bmulti.store/assets/21d8cacf-50ed-4cc0-af80-c13fbeaaec89	https://directus.bmulti.store/assets/92349ccc-6649-41de-8934-7db997e7ca45
1578	2025-09-15 07:05:35.874184+00	471754981	109.165.1.109	t	t	done	200 рублей	OZON	79954362633	https://directus.bmulti.store/assets/c37e33f4-60fa-4271-b77b-70ed4c66e1ed	https://directus.bmulti.store/assets/8c08eb7d-23cd-43e6-8e68-33a51cad4646
1577	2025-09-15 06:43:00.615063+00	6154418152	89.253.44.138	t	f	done	200 рублей	WB	79088561331	https://directus.bmulti.store/assets/5db1b176-06c4-4380-9948-9b1086dd71b4	https://directus.bmulti.store/assets/5b2e303c-51d0-4f9e-b293-d0a800981365
1576	2025-09-15 05:31:48.986697+00	6938717386	213.87.150.140	t	t	done	200 рублей	WB	79181511132	https://directus.bmulti.store/assets/974f68a6-f22b-4e6b-b7ff-e28057b4e76f	https://directus.bmulti.store/assets/c6ee2f5f-45ff-4120-917a-e8e958065438
1575	2025-09-15 03:10:58.55194+00	279348795	37.195.182.219	t	t	done	200 рублей	OZON	79529271680	https://directus.bmulti.store/assets/678f1a94-bbc5-4199-8ba1-adaa16bff1b3	https://directus.bmulti.store/assets/bdae6bd6-7069-410e-8545-a556e1f1eb2b
1574	2025-09-14 19:41:32.322713+00	7755710198	178.35.48.144	t	t	done	200 рублей	WB	79188172445	https://directus.bmulti.store/assets/8d09e707-ebb8-4e17-9de4-1e4a4f976d41	https://directus.bmulti.store/assets/8281b8d3-af5c-4438-9a3e-6506c97b61fa
1573	2025-09-14 19:35:41.360655+00	5728917139	95.211.40.67	t	f	done	200 рублей	OZON	79818762364	https://directus.bmulti.store/assets/06379945-818a-4c01-84f1-138f5da96964	https://directus.bmulti.store/assets/d3e8f57b-fefd-4646-8c1e-97ce88d4ed4d
1572	2025-09-14 16:51:36.090573+00	1654664433	178.219.169.148	t	t	done	200 рублей	WB	79786038773	https://directus.bmulti.store/assets/26f1fea0-5e36-43b4-bfa3-f94e2cb0d62f	https://directus.bmulti.store/assets/3203dbaa-4434-4a89-b8fb-f1a3ceaa9365
1579	2025-09-15 07:38:50.206071+00	5559702428	176.119.171.26	t	t	done	200 рублей	OZON	79495534659	https://directus.bmulti.store/assets/5f0f95b9-baa5-4893-97a5-a2a9a854b13c	https://directus.bmulti.store/assets/d93865f3-751b-4ea0-a78d-c0a72eb3f689
1569	2025-09-14 15:03:46.660713+00	7878151627	46.72.112.144	t	t	done	200 рублей	OZON	79586550715	https://directus.bmulti.store/assets/9f20662c-16b6-4ae7-a5e7-2ff6592af6bd	https://directus.bmulti.store/assets/b4cc5f9d-1756-4098-b833-a8ba35bfe007
1567	2025-09-14 14:41:37.595905+00	873902704	185.172.88.12	t	t	done	200 рублей	WB	79158009459	https://directus.bmulti.store/assets/8085a08b-73ba-4040-9e75-9b4d116952ba	https://directus.bmulti.store/assets/7511b268-07a4-4a6b-bbb7-0d963458eb28
1566	2025-09-14 13:01:06.193009+00	5848672166	31.40.35.127	t	t	done	200 рублей	WB	79042553253	https://directus.bmulti.store/assets/302dd1c7-d487-4f06-9273-46c88b62704d	https://directus.bmulti.store/assets/18964a76-951e-49ab-ba54-5193dc7fd88c
1565	2025-09-14 12:49:09.997395+00	5111592245	5.44.174.111	t	t	done	200 рублей	WB	79134128075	https://directus.bmulti.store/assets/df9f4405-e52f-498f-a277-de8655d2f85b	https://directus.bmulti.store/assets/eb117168-9d9a-43d8-b6b2-535269654899
1562	2025-09-14 10:16:03.801053+00	5354853054	92.124.163.82	t	t	done	300 рублей	WB	79136734682	https://directus.bmulti.store/assets/1a6fc766-b0ce-4e16-b406-026134fef184	https://directus.bmulti.store/assets/9ddc4129-caf5-4637-bd8e-7effc8171228
1570	2025-09-14 15:24:01.960967+00	6450202680	84.32.208.214	t	t	done	200 рублей	OZON	79332472980	https://directus.bmulti.store/assets/94c8e077-4c26-4503-bd94-0eabd0b3fb70	https://directus.bmulti.store/assets/06dee0ff-6715-4479-bdca-b078ea7f20bc
1611	2025-09-16 12:54:09.612936+00	5103090858	176.118.209.195	t	t	check	200 рублей	WB	5000200	https://directus.bmulti.store/assets/08b6b99a-6575-4d2c-bb90-67e032a71259	https://directus.bmulti.store/assets/3d0eaa3a-d8cc-4c2a-b9d8-7e43b5bd0f68
1593	2025-09-15 15:52:36.372064+00	1367816573	31.6.109.46	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/8faa04c8-3683-4331-887a-a0709c5cc123	https://directus.bmulti.store/assets/f2280e0c-79d2-48e9-ab75-e499a7c6c396
1618	2025-09-16 18:42:13.583055+00	6574347182	94.25.224.110	f	t	check	200 рублей	WB	79969214483	https://directus.bmulti.store/assets/2edd34c8-0c62-4c29-bd3f-dee939ccf722	https://directus.bmulti.store/assets/4790d86f-e81a-4b70-a823-59339ec47b14
1594	2025-09-15 17:08:25.853662+00	461638079	5.167.172.8	t	t	done	200 рублей	OZON	79229443010	https://directus.bmulti.store/assets/76ae93f2-c6eb-4ecd-8b95-a57a2a76419c	https://directus.bmulti.store/assets/53715f0d-6402-4389-8ddf-d438f36b51d2
1592	2025-09-15 15:40:42.04206+00	392713362	176.104.197.24	t	t	done	200 рублей	OZON	79997646286	https://directus.bmulti.store/assets/8be511d2-a6b3-486b-af47-d41d4ebe8a08	https://directus.bmulti.store/assets/529b9906-ebf4-4afb-80f5-b481f169bd50
1605	2025-09-16 00:14:37.64223+00	237378889	178.49.109.5	t	f	done	200 рублей	OZON	79607995695	https://directus.bmulti.store/assets/b349e91c-0929-4b82-9424-3ea9b96c2686	https://directus.bmulti.store/assets/d6fe1387-19e3-4851-bb3e-e3f3a20275f8
1596	2025-09-15 19:19:45.455013+00	5137032097	5.139.218.243	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/fc087aab-f14f-4aa3-ad93-1ff1dfd02a8b	https://directus.bmulti.store/assets/9fdd658e-2869-4de0-8ec7-0e1e22ddb660
1591	2025-09-15 14:06:45.353577+00	729010788	178.49.7.124	t	t	done	200 рублей	OZON	79537699639	https://directus.bmulti.store/assets/8bfcdf30-18f2-4abf-8380-9b0483d8b419	https://directus.bmulti.store/assets/ef888d19-91a9-4441-b323-7ca60accd6d0
1621	2025-09-17 03:49:47.907227+00	1671938777	146.158.104.153	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/fa5e052d-be86-472a-a274-0d63ce5c275d	https://directus.bmulti.store/assets/4b5d7f4e-f146-4db5-8575-2d7bb0cd7502
1633	2025-09-17 14:59:53.767369+00	1790145665	95.153.160.55	t	t	check	200 рублей	WB	79186757726	https://directus.bmulti.store/assets/3ebf2b2d-3859-4d7e-98c4-340d5a024819	https://directus.bmulti.store/assets/ee47fbc7-0710-40da-b592-1baa1f0074a6
1629	2025-09-17 11:16:57.756419+00	1004846258	136.169.232.248	t	t	check	200 рублей	WB	79174613245	https://directus.bmulti.store/assets/6b3760ca-d812-4c7c-90b8-411df233920a	https://directus.bmulti.store/assets/248c23cc-e38e-4ee5-b508-3ee2cb4d817c
1635	2025-09-17 15:50:35.17218+00	6249269099	176.59.200.168	f	t	check	200 рублей	OZON	279510348802	https://directus.bmulti.store/assets/36299d58-d4dc-4b9c-a38f-1f5e003e94c5	https://directus.bmulti.store/assets/c29f536d-1845-4788-ac13-9b3b617b80e2
1643	2025-09-18 05:10:32.602111+00	942255416	213.87.161.126	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/5fa302ae-b1d7-4913-8333-2c942595bbc6	https://directus.bmulti.store/assets/878f1d57-96b0-4415-b803-5edf6ad4549d
1641	2025-09-18 03:30:35.148896+00	6503219909	94.242.171.114	t	t	check	200 рублей	OZON	279533343790	https://directus.bmulti.store/assets/8d98d74e-5d29-4562-acd8-bd3a6c152580	https://directus.bmulti.store/assets/234a1317-b02f-4e1a-831e-f823f345c856
1645	2025-09-18 05:11:07.156887+00	942255416	213.87.161.126	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/d7d57c85-be35-40a7-b504-32d371e75aa1	https://directus.bmulti.store/assets/3f551372-7bcc-4823-94d2-39669890a2bc
1649	2025-09-18 08:16:00.176631+00	976201054	178.121.2.249	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/ca1ce425-0101-4b82-8503-c4085acdff84	https://directus.bmulti.store/assets/5d821e0c-8e2d-4310-8007-4fbe03348f3d
1653	2025-09-18 13:31:57.205606+00	6124779853	213.87.128.60	t	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/d25fa75d-a6bb-4586-862d-a09e12411ba8	https://directus.bmulti.store/assets/268e1e25-82a7-44b3-bf64-31301156eefb
1654	2025-09-18 13:32:02.97533+00	6124779853	213.87.128.60	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/c439b793-76d6-4a45-ba53-061ffd2bb67d	https://directus.bmulti.store/assets/1dc97f47-af19-48ba-b3ad-71a98bf0e98b
1655	2025-09-18 13:32:04.264548+00	6124779853	213.87.128.60	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/56e26e29-807d-4ec9-989a-e94f79000695	https://directus.bmulti.store/assets/902b774c-01ae-4f67-b0ce-3b0dcb47b9ee
1637	2025-09-17 16:01:38.077475+00	5242858743	85.173.147.55	t	t	done	200 рублей	WB	79374660063	https://directus.bmulti.store/assets/c0e96165-c6a5-4917-a3b0-fb16a1f48ef5	https://directus.bmulti.store/assets/43444787-9340-4d62-aa06-c1fa9ecee779
1627	2025-09-17 10:00:25.274058+00	5006865371	94.247.57.178	t	t	done	200 рублей	OZON	79148677837	https://directus.bmulti.store/assets/c8959961-9df0-46b9-8bc4-c5a32b55d264	https://directus.bmulti.store/assets/1a020b24-2fe3-4201-911d-11a23a346666
1625	2025-09-17 08:53:24.221584+00	2089203036	94.241.29.231	t	t	done	200 рублей	OZON	79004724499	https://directus.bmulti.store/assets/1ae6ccc7-4775-436c-a2fd-f29231f803c3	https://directus.bmulti.store/assets/d2baf46c-7e30-4131-8dc2-2e577043abd5
1623	2025-09-17 04:48:32.788239+00	1557229151	31.163.96.243	t	t	done	200 рублей	WB	79220101077	https://directus.bmulti.store/assets/f8200eef-0b22-4596-a0d3-076260e0085e	https://directus.bmulti.store/assets/2bf3e376-ecd4-4250-8607-39a59828be60
1619	2025-09-16 19:13:36.637243+00	6643559114	178.130.141.60	t	t	done	200 рублей	OZON	79953430380	https://directus.bmulti.store/assets/2808e930-42a5-4ba8-abad-b4480546395a	https://directus.bmulti.store/assets/1ca017db-dcb3-4fb9-9569-50ced31c1004
1615	2025-09-16 16:49:19.148501+00	738091644	95.221.206.104	t	t	done	200 рублей	WB	79264448926	https://directus.bmulti.store/assets/24db29eb-d9c6-47ed-8ff9-e775af38b5ca	https://directus.bmulti.store/assets/0a327cd3-337b-4b28-a7cd-8bd9f38cdaa2
1639	2025-09-17 18:01:47.137198+00	5336759830	83.139.170.187	t	t	done	200 рублей	OZON	79009570679	https://directus.bmulti.store/assets/955f6715-313a-4412-93e6-0923d8b18e91	https://directus.bmulti.store/assets/6fa23034-79ab-4baa-9154-0a332cec6095
1595	2025-09-15 17:43:36.749692+00	1211184496	109.196.194.139	t	t	done	200 рублей	OZON	79110019843	https://directus.bmulti.store/assets/32844d70-101c-46cb-8a59-a746728fee2a	https://directus.bmulti.store/assets/e775488d-97a8-4f09-8a9a-1876647f3f54
1631	2025-09-17 11:32:22.49774+00	5793259815	93.125.40.130	t	t	done	500 рублей	WB	375297393111	https://directus.bmulti.store/assets/9fe09900-797f-49ca-a449-39be0645479c	https://directus.bmulti.store/assets/af9725ca-2a12-4f77-9638-b5954ac937c4
1651	2025-09-18 11:10:08.87818+00	5855448722	62.76.109.249	t	t	done	200 рублей	WB	79187177227	https://directus.bmulti.store/assets/f635878e-73c1-42a6-86c8-5e8e6f06a3e0	https://directus.bmulti.store/assets/48155c3f-56ae-46e6-b2c2-d723c4239cf9
1647	2025-09-18 07:57:29.914053+00	7152844970	5.140.11.27	t	t	done	200 рублей	YANDEX	79825704621	https://directus.bmulti.store/assets/d203817f-8cf1-460d-be3c-af567d3d1f82	https://directus.bmulti.store/assets/5d408149-f578-4b35-bad5-0f75045a4c4e
1598	2025-09-15 19:21:08.245075+00	5137032097	5.139.218.243	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/aaa18da4-11fd-4c3d-89d5-b620bdb8db92	https://directus.bmulti.store/assets/a5247699-239b-4f61-9284-63f706d4e597
1599	2025-09-15 19:22:27.483074+00	5137032097	5.139.218.243	f	f	check	200 рублей	WB	79964707214	https://directus.bmulti.store/assets/816f585d-f770-4b00-a98c-09da87d2366f	https://directus.bmulti.store/assets/d4c65897-df73-428d-8305-54c002ca36b6
1603	2025-09-15 19:23:54.220684+00	5137032097	5.139.218.243	f	f	check	200 рублей	WB	79964707214	https://directus.bmulti.store/assets/7aa5a0da-665e-4051-80d1-f7dfb87df4fc	https://directus.bmulti.store/assets/837f6251-6ddc-41f7-9f20-1c98d002d8ea
1602	2025-09-15 19:23:40.157791+00	5137032097	5.139.218.243	f	f	check	200 рублей	WB	79964707214	https://directus.bmulti.store/assets/a5d63639-09e9-43d9-9486-38b3470427c6	https://directus.bmulti.store/assets/3a82cff4-8107-49b9-a54d-68ef7d0068fc
1630	2025-09-17 11:17:47.960977+00	5805222077	2.62.128.218	t	t	check	200 рублей	OZON	79832147366	https://directus.bmulti.store/assets/83ee5a8b-6d3f-4f8e-ba85-d8eae92dde56	https://directus.bmulti.store/assets/7dba3a26-1c42-48eb-bccb-b37adcb2794e
1601	2025-09-15 19:23:34.596637+00	5137032097	5.139.218.243	f	f	check	200 рублей	WB	79371293057	https://directus.bmulti.store/assets/2cecdac9-eb7d-437c-832a-4e3f23ac845a	https://directus.bmulti.store/assets/7b028b33-c661-4947-a010-ce521d52d61a
1600	2025-09-15 19:22:35.468043+00	5137032097	5.139.218.243	f	f	check	200 рублей	WB	79964707214	https://directus.bmulti.store/assets/606d6633-f8ff-45cf-907b-d419fe1b3dd3	https://directus.bmulti.store/assets/2ce9fb9d-3c89-4796-a52c-a2324f3b94c4
1616	2025-09-16 17:42:09.900007+00	5255067018	94.25.171.33	t	t	check	1500 рублей	WB	79969979773	https://directus.bmulti.store/assets/24b327f6-9d67-466b-a62d-eb27ac8f37cd	https://directus.bmulti.store/assets/61303c57-987c-4efb-b2c0-76df7ddd6256
1606	2025-09-16 06:10:18.91114+00	6643559114	178.130.141.60	t	t	done	200 рублей	OZON	79953430380	https://directus.bmulti.store/assets/3f0c46ed-fa98-4405-af6b-7058e92fc4ea	https://directus.bmulti.store/assets/e517e248-0623-431a-9297-14cba7613e2d
1604	2025-09-15 19:51:14.565776+00	5974368023	178.141.243.155	t	t	done	200 рублей	OZON	79634337083	https://directus.bmulti.store/assets/7ffa5406-0188-4568-8a56-d81aff9b64b6	https://directus.bmulti.store/assets/411b1f2f-3b48-4ec1-9d67-0425e260f5bf
1590	2025-09-15 14:01:53.204383+00	5910409654	95.27.79.106	t	t	done	200 рублей	OZON	79063418877	https://directus.bmulti.store/assets/254f4e24-d9ad-4e89-8b1c-126e532acf77	https://directus.bmulti.store/assets/0860ed94-bb88-4ce9-90d2-51ec59db2f94
1642	2025-09-18 04:47:34.889803+00	2078182637	212.233.84.63	f	t	check	200 рублей	WB	79933471298	https://directus.bmulti.store/assets/c2f4497e-bc1a-41d7-9316-fe834cb4189f	https://directus.bmulti.store/assets/42dec178-e095-4834-b8ac-b21797bfc8f3
1644	2025-09-18 05:10:46.81793+00	942255416	213.87.161.126	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/06eb2597-82ac-4cb2-8115-4dd6b52bacbf	https://directus.bmulti.store/assets/b43c2f8b-337f-42ad-b498-29f80aa86593
1646	2025-09-18 05:11:34.426888+00	942255416	213.87.161.126	f	f	check	200 рублей	YANDEX	79192135320	https://directus.bmulti.store/assets/4e919a93-4225-4686-96e4-1b6b986b3bc1	https://directus.bmulti.store/assets/114494ac-2127-44d9-b5b7-9755398ca14d
1650	2025-09-18 10:52:46.949907+00	6814736658	178.155.16.200	t	t	check	200 рублей	WB	79952216860	https://directus.bmulti.store/assets/6f55e0dd-c536-47e1-a6bc-36adc018d0f8	https://directus.bmulti.store/assets/ccf625b5-e920-40da-a4cf-9a09719d603f
1652	2025-09-18 11:47:24.727968+00	738851485	37.214.1.17	t	t	in_work	500 рублей	OZON	\N	https://directus.bmulti.store/assets/723ea4fc-4886-40ab-96f6-1e4d4fa29ed0	https://directus.bmulti.store/assets/a94e2bfd-306e-40da-bf7b-24c4c6bf66ba
1656	2025-09-18 13:46:08.711286+00	\N	89.47.175.176	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1638	2025-09-17 16:54:27.485139+00	5741700065	85.249.19.105	t	t	done	200 рублей	OZON	79622049617	https://directus.bmulti.store/assets/5fbd6285-7f91-4674-9257-11e67201ce63	https://directus.bmulti.store/assets/49fa8dd2-19de-4b37-9728-a17dc1406440
1636	2025-09-17 15:51:02.040061+00	5884083648	45.136.125.110	t	t	done	200 рублей	OZON	79275658910	https://directus.bmulti.store/assets/d193a7ce-acbe-4d9b-a1dd-530a75526187	https://directus.bmulti.store/assets/a9e0393d-9d13-40b9-bdb2-39abeca63722
1634	2025-09-17 15:29:49.414482+00	5843304900	95.153.160.114	t	t	done	200 рублей	OZON	79146221951	https://directus.bmulti.store/assets/170d581f-7f35-4ee5-82a4-ed4a60d5ab2c	https://directus.bmulti.store/assets/3b79f46c-9b7f-452b-a9cc-d35b8a23ff7e
1632	2025-09-17 13:00:28.384865+00	8092446808	95.25.65.195	t	f	done	200 рублей	OZON	79381087676	https://directus.bmulti.store/assets/bcfa64fc-6921-47f2-adaa-16be77dc16a2	https://directus.bmulti.store/assets/828f67f3-6d0a-43b0-86be-592461ce24f7
1628	2025-09-17 10:33:08.020812+00	729010788	176.59.143.43	t	t	done	200 рублей	OZON	79537699639	https://directus.bmulti.store/assets/274bddae-db88-46bd-b50c-d8e8f7514946	https://directus.bmulti.store/assets/3dd83b91-270b-4ffb-a6e1-abee270fc78f
1624	2025-09-17 06:53:26.312016+00	486981287	5.165.226.194	t	t	done	200 рублей	WB	79086363001	https://directus.bmulti.store/assets/2396cf09-26d6-44bb-a78e-343986fb1f53	https://directus.bmulti.store/assets/822e8424-ca77-4780-9440-4a37270c673c
1622	2025-09-17 04:46:00.152369+00	926158858	178.206.67.10	t	t	done	200 рублей	OZON	79872634994	https://directus.bmulti.store/assets/e75eec84-8e1c-4184-b34c-02f067dbb3dc	https://directus.bmulti.store/assets/95acfdc7-3826-4cf8-90ed-7a0850fb7f87
1620	2025-09-16 21:31:00.120825+00	6653783272	92.36.56.123	t	t	done	200 рублей	YANDEX	79775237000	https://directus.bmulti.store/assets/361d6a01-5f8f-4986-a3c6-172400011916	https://directus.bmulti.store/assets/a50ddb28-7f08-4f9d-8744-4e35832f5f55
1626	2025-09-17 09:22:49.415265+00	1251661613	194.32.107.16	t	t	done	200 рублей	WB	79380146515	https://directus.bmulti.store/assets/22daf4d2-edd4-4452-95e4-70ea5aa9cf7a	https://directus.bmulti.store/assets/97280fcb-b1f9-4e0c-8270-2cebd3b2f23b
1612	2025-09-16 14:11:49.796616+00	5027479800	85.172.102.252	t	t	done	200 рублей	WB	90494943112	https://directus.bmulti.store/assets/59be39bc-8af0-4030-9c1f-cc31cb030956	https://directus.bmulti.store/assets/cde81d67-97d1-458e-a489-23ae5b331ca5
1657	2025-09-18 13:47:22.563319+00	1030550714	178.176.164.229	t	t	check	200 рублей	OZON	79961031088	https://directus.bmulti.store/assets/d7e891ea-cdbe-47d1-a6a3-f609f797fbf6	https://directus.bmulti.store/assets/88170211-99b8-4ea8-882f-2e49e8c3020e
1640	2025-09-17 19:03:55.175119+00	7733793528	89.253.11.61	t	t	done	200 рублей	OZON	79997939252	https://directus.bmulti.store/assets/03ae665d-676b-4e79-a547-b53d73bde6dc	https://directus.bmulti.store/assets/316e715d-4a1b-462f-a16f-c150347e24bc
1648	2025-09-18 08:03:59.594775+00	808085093	176.15.143.8	t	t	done	500 рублей	OZON	\N	https://directus.bmulti.store/assets/c960aea5-d2b8-49e3-9688-55771ad02982	https://directus.bmulti.store/assets/3cee0f46-4662-45ea-b69c-2344a65c64e2
1665	2025-09-19 07:26:54.103137+00	5904448167	176.96.190.83	t	t	check	200 рублей	OZON	79635304795	https://directus.bmulti.store/assets/e4fd7e29-0879-405b-a810-98e8b333a53b	https://directus.bmulti.store/assets/dade6a94-7570-48c6-b3e3-2e865e7c2ec3
1847	2025-09-29 15:28:50.472324+00	1806508613	87.117.61.223	t	t	check	200 рублей	WB	79094053716	https://directus.bmulti.store/assets/e818ff43-447e-4af3-ba39-0eafb7a46259	https://directus.bmulti.store/assets/c9e1194d-5509-47fe-815b-723fb2b73de2
1660	2025-09-18 16:40:23.604588+00	1100401643	80.64.31.105	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/d20d46a7-094f-4da7-a96f-23b847ea4d0e	https://directus.bmulti.store/assets/96751c6b-fd3d-49ef-bd84-c28285ca9202
1661	2025-09-18 16:47:22.339197+00	1885969972	193.168.178.37	t	f	check	200 рублей	OZON	79126697229	https://directus.bmulti.store/assets/28fc227c-03eb-4fd8-9e13-66f9244b70a5	https://directus.bmulti.store/assets/12e5b3bd-76b9-42d9-bc6b-0491759554fb
1853	2025-09-29 18:45:21.618154+00	1156239397	46.138.32.236	t	t	check	200 рублей	OZON	79261707697	https://directus.bmulti.store/assets/35059016-67e8-4435-a794-445d6b9d47de	https://directus.bmulti.store/assets/0f639cb0-1a6f-42f1-abb9-982b016eec75
1614	2025-09-16 15:40:35.430837+00	728589655	87.117.50.25	t	t	done	200 рублей	OZON	79225867394	https://directus.bmulti.store/assets/e226c0cd-46c7-49f7-aa72-68cbac3f9209	https://directus.bmulti.store/assets/1a818cac-88ed-4a52-babd-2c92d808cb60
1855	2025-09-29 19:16:28.444134+00	659018581	37.214.65.187	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/03cc65b3-a55a-4e40-ba85-29ff71e026c5	https://directus.bmulti.store/assets/e551759b-67e4-43ed-8051-ed891a511223
1869	2025-09-30 16:53:34.513274+00	8260291232	109.194.254.85	t	t	check	300 рублей	WB	79875141450	https://directus.bmulti.store/assets/af2fc64d-9145-40c5-89cb-0eac9ec49036	https://directus.bmulti.store/assets/fba0a75b-6ffc-46c1-b096-25a6212438c0
1667	2025-09-19 08:10:28.599263+00	7869013210	178.176.68.54	t	t	check	200 рублей	WB	79167450952	https://directus.bmulti.store/assets/0f87b2c5-615a-4c68-a013-245314ee00c2	https://directus.bmulti.store/assets/ed456566-9d67-424e-919d-b588d18e006e
1666	2025-09-19 08:06:03.949781+00	1630918869	5.140.93.39	t	t	done	200 рублей	OZON	79519333115	https://directus.bmulti.store/assets/8f7798a5-eb1c-4b38-a761-a9d1a317a304	https://directus.bmulti.store/assets/ff9703eb-4398-4dff-ac73-42fffcd33b52
1664	2025-09-19 06:44:04.161737+00	992234490	5.164.187.201	t	t	done	200 рублей	OZON	79277654064	https://directus.bmulti.store/assets/e2147695-9d21-437d-83c5-3d5780f0dd08	https://directus.bmulti.store/assets/54efb99b-7c10-4296-a298-25d911250035
1658	2025-09-18 15:56:07.410893+00	6124779853	213.87.146.189	f	f	done	200 рублей	OZON	79898455578	https://directus.bmulti.store/assets/1c7acff7-3521-4462-b9c7-fb9264dea586	https://directus.bmulti.store/assets/ee23fbcd-fbd2-487e-a7f1-c542a2af1c42
1663	2025-09-18 20:57:16.33614+00	1806157266	78.37.148.110	t	t	done	200 рублей	OZON	79313687787	https://directus.bmulti.store/assets/9d2590f2-6670-428d-a2f2-806eda443ec3	https://directus.bmulti.store/assets/4a7b83ca-863a-44d5-948d-14f63e68c5b0
1662	2025-09-18 17:02:43.604435+00	5228120725	188.235.32.198	t	t	done	2000 рублей	WB	79050495754	https://directus.bmulti.store/assets/336e6f58-03c9-4398-bc55-77125f2b07c0	https://directus.bmulti.store/assets/99343558-a70d-44cb-a0d5-10bb47e057ab
1659	2025-09-18 16:21:20.419852+00	1478353037	95.25.97.217	t	t	done	200 рублей	OZON	79966307313	https://directus.bmulti.store/assets/13ab49b4-4f97-4812-a5bf-4b3c4b5c5490	https://directus.bmulti.store/assets/9d5611af-7e91-4292-b279-4b2ee225166a
1871	2025-09-30 19:35:52.214199+00	2104854193	91.79.192.147	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/d0ffe8f0-f829-4a98-919a-e56d7beace3b	https://directus.bmulti.store/assets/250013e7-f3b0-4b9c-900c-0bd3d09672fb
1858	2025-09-30 04:08:51.526695+00	1502912819	37.193.32.186	f	t	done	200 рублей	OZON	79960725007	https://directus.bmulti.store/assets/5dc24d57-51df-4777-98db-2cf7b942e9a9	https://directus.bmulti.store/assets/f42a6eae-706f-4803-af90-802dc73fd430
1850	2025-09-29 16:01:10.625887+00	757802845	92.101.13.28	t	t	done	200 рублей	OZON	79115878026	https://directus.bmulti.store/assets/b7efdf45-b920-4987-9253-5af2d8ce7a3d	https://directus.bmulti.store/assets/c26e202b-044e-4330-a3e6-4f9f70fd0ee6
1841	2025-09-29 09:26:08.194908+00	742467111	176.212.34.239	t	t	done	200 рублей	OZON	79298166660	https://directus.bmulti.store/assets/d1e7eaaa-fd65-459b-bbdb-320a9a7807d9	https://directus.bmulti.store/assets/ce3688c0-2875-4c1a-b73b-ac66ed132124
1840	2025-09-29 07:30:46.700232+00	7150809006	94.25.224.150	t	t	done	200 рублей	WB	79992505679	https://directus.bmulti.store/assets/0e47ac89-475f-4ed4-bbb9-0cb374de743e	https://directus.bmulti.store/assets/6166826e-123d-4eaa-a2e7-f80e33c70ead
1838	2025-09-28 22:10:52.489967+00	522798495	5.18.240.114	t	t	done	200 рублей	WB	79681873784	https://directus.bmulti.store/assets/5f883059-845c-46d9-8375-bc7d2691a5d1	https://directus.bmulti.store/assets/d7e52ba5-2611-4759-b787-eefd968f0510
1879	2025-10-01 09:39:46.30047+00	5842030751	95.159.156.156	t	f	check	200 рублей	WB	79241820328	https://directus.bmulti.store/assets/3b7c4e0f-2c9e-4de0-bf61-52716f17722f	https://directus.bmulti.store/assets/5c64b451-2d19-4802-8116-762f834fb519
1885	2025-10-01 12:22:00.065593+00	945363680	188.18.246.255	f	t	check	200 рублей	WB	79505196634	https://directus.bmulti.store/assets/21744951-1421-424b-ba12-f9cb4408ab57	https://directus.bmulti.store/assets/632a69d9-ac13-4b17-8361-4a778dc4b574
1864	2025-09-30 14:37:06.225637+00	5246073454	109.110.70.1	t	t	done	200 рублей	OZON	79781643376	https://directus.bmulti.store/assets/404f6a41-d12c-4bd2-90cc-d1853ca5be3f	https://directus.bmulti.store/assets/791ae591-13b7-48be-be78-c7e2086a8141
1900	2025-10-02 09:31:00.063736+00	\N	94.25.169.242	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1881	2025-10-01 11:20:28.453604+00	7988701469	91.107.117.33	t	t	done	300 рублей	WB	79850640888	https://directus.bmulti.store/assets/b006fb29-9cb5-4e20-b41b-1a7550f57f20	https://directus.bmulti.store/assets/994b5cee-7ce5-4f2a-a2ea-938e40af4000
1877	2025-10-01 06:45:56.365258+00	5282813291	91.236.143.238	t	t	done	200 рублей	OZON	79269223435	https://directus.bmulti.store/assets/23bbe986-c82c-4e48-b459-88294459b0f5	https://directus.bmulti.store/assets/2635ac52-f83b-44f2-aecc-c6e23739d6e2
1875	2025-09-30 21:03:17.698816+00	562498076	109.252.169.40	t	t	done	200 рублей	WB	79151967657	https://directus.bmulti.store/assets/42dc3e59-eaf6-4069-aabd-c62f59ca09ae	https://directus.bmulti.store/assets/074ca7cb-bb48-4f94-b59b-b71774e931c1
1861	2025-09-30 10:30:12.373956+00	1926699538	185.189.44.147	t	t	done	200 рублей	WB	79494167741	https://directus.bmulti.store/assets/c923c5e6-ab70-421d-87a2-4f6c1728b308	https://directus.bmulti.store/assets/455bb437-94fb-4a2e-97b9-71a46963cd32
1883	2025-10-01 12:08:24.19174+00	1980921958	91.149.82.186	t	t	done	200 рублей	OZON	279511827429	https://directus.bmulti.store/assets/e391e9c5-c851-47ab-86e1-9367a8acc9c8	https://directus.bmulti.store/assets/9a6f3c0d-672e-4e73-a021-83e1c5aa1f6b
1669	2025-09-19 08:33:43.884576+00	1077225804	176.14.87.189	t	t	check	200 рублей	OZON	79031086669	https://directus.bmulti.store/assets/b348e28b-a7ca-4284-96f1-db73ee2cd9b9	https://directus.bmulti.store/assets/ca7b238a-f242-4c0f-a952-17b7b672066d
1677	2025-09-19 15:51:20.076675+00	1066835678	212.34.138.110	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/4c0f0866-d995-4039-89ba-aa98d6d725f7	https://directus.bmulti.store/assets/deaf5559-2958-42fc-9185-3444c2f0d826
1678	2025-09-19 15:55:48.391709+00	700314987	37.215.4.136	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/80c713aa-29ed-4af5-805c-554143831e1c	https://directus.bmulti.store/assets/02aeff5f-9171-4365-b1ae-5fedbb5f400e
1673	2025-09-19 12:21:45.017757+00	5753383982	45.15.114.30	t	f	check	200 рублей	OZON	79994406866	https://directus.bmulti.store/assets/da612e9a-af4d-4bae-8d8c-bc6de58c4ff9	https://directus.bmulti.store/assets/6af7db59-be6a-4243-84ff-29f31e0449f9
1675	2025-09-19 15:01:20.95539+00	5576011895	185.92.138.75	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/e575044e-d3f3-45e4-86d3-1573380454b5	https://directus.bmulti.store/assets/315f8b47-64c7-4057-8c34-5b7dd51b8601
1676	2025-09-19 15:05:03.537227+00	471483692	178.67.42.50	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/b8542874-44e7-467d-8fcd-93efe1c20175	https://directus.bmulti.store/assets/fa40492b-ddf0-4451-9993-6c7a01a7afa6
1607	2025-09-16 09:39:37.389+00	1049146869	151.0.21.230	t	t	done	200 рублей	OZON	79494484722	https://directus.bmulti.store/assets/c358c36e-1707-47cd-97ee-357e4e23ea0a	https://directus.bmulti.store/assets/4636284a-b064-4575-a765-c91ef5e56d14
1613	2025-09-16 15:00:51.331868+00	1984566922	45.131.49.210	t	t	done	200 рублей	OZON	79591255135	https://directus.bmulti.store/assets/a370ef52-b8bd-4329-92bb-f0523683b233	https://directus.bmulti.store/assets/834a2928-c0a7-4944-8160-6697e93b2d32
1679	2025-09-19 16:34:02.101092+00	820975594	79.174.34.37	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/d292130d-7842-4c2b-8787-7e58f5557ece	https://directus.bmulti.store/assets/3fbf3a3e-9741-42be-97ff-adb1b0a4fbf6
1680	2025-09-19 16:37:06.918234+00	841980142	194.48.250.61	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/206be789-30da-4a71-aa07-1726c271f5d5	https://directus.bmulti.store/assets/72690aa8-76ad-442a-902c-a3aa1cf77cef
1681	2025-09-19 16:45:06.231476+00	215102452	95.27.108.129	t	t	in_work	500 рублей	OZON	\N	https://directus.bmulti.store/assets/d5e06f35-1426-4972-9117-174ae491aca9	https://directus.bmulti.store/assets/27784067-0c6b-42f2-99d0-09c46c8a8f19
1682	2025-09-19 17:11:51.1948+00	7009795647	31.41.191.78	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/e6ab26b9-ecaf-4c70-a91f-1ffd220468d3	https://directus.bmulti.store/assets/87c64393-8495-4eca-8743-72ef34778e31
1683	2025-09-19 17:17:18.736055+00	1684451827	85.249.18.31	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/af0e9f14-2e8c-4a29-97a4-7f7902e76bf8	https://directus.bmulti.store/assets/b84da297-71ba-40a6-b78d-4f8bc33a69f0
1684	2025-09-19 17:21:47.392966+00	1235130344	91.185.79.181	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/982d6720-dae9-465f-b841-ec16270c5c61	https://directus.bmulti.store/assets/0b14e9f3-232c-45eb-a5fa-dc964ddf905f
1685	2025-09-19 17:48:49.740746+00	6149130342	212.3.150.118	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/28873ace-adce-44e0-9d6e-82c95d065c40	https://directus.bmulti.store/assets/fcd5dc49-f1db-466c-af61-34745b2db998
1686	2025-09-19 17:50:52.96546+00	5102084530	5.133.77.195	t	t	in_work	300 рублей	WB	\N	https://directus.bmulti.store/assets/9ad12754-f45a-4bcb-baff-15c1fa95165d	https://directus.bmulti.store/assets/cfd66c09-c755-4afa-b20e-340081f705c0
1687	2025-09-19 18:33:50.894008+00	6847371361	176.96.191.2	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/4934cfa0-8949-4946-b6ad-f25607319d4f	https://directus.bmulti.store/assets/41563736-1452-4a62-a558-a40ea3d38960
1688	2025-09-19 19:15:39.137731+00	535621969	109.252.46.158	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/3e831da9-dacc-4959-8bf2-c17a5c634081	https://directus.bmulti.store/assets/b18e78a8-e618-439d-9e67-37caf74f2677
1689	2025-09-19 19:21:05.87661+00	842347506	178.207.163.106	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/3be15e23-5221-41de-b2f4-93c99222de8d	https://directus.bmulti.store/assets/ecf11a87-d439-4f3d-907b-d2cc942bda39
1690	2025-09-19 20:13:39.819482+00	1777567243	188.172.228.105	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/1bcb5290-d237-43a4-ba75-503cb49e9813	https://directus.bmulti.store/assets/e99e8baa-bd31-4a0a-9d1d-005171d9cbe6
1671	2025-09-19 10:08:53.898145+00	1046975811	84.47.188.42	t	t	done	300 рублей	OZON	79097631362	https://directus.bmulti.store/assets/4c9be3cf-68cc-48f8-98ac-a542540f0241	https://directus.bmulti.store/assets/d5b022f3-95e9-418c-83d9-ab196911745d
1670	2025-09-19 09:03:26.006102+00	5194956876	89.113.136.77	t	t	done	200 рублей	WB	79232176113	https://directus.bmulti.store/assets/7336c030-5fa9-47d9-b052-4ceec9245d02	https://directus.bmulti.store/assets/215274c5-bbda-47da-9213-9dfd3b4c7626
1468	2025-09-06 09:45:08.917049+00	1966031975	46.50.209.71	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/58258cd8-39d9-4bba-83a3-d88c940dfd16	https://directus.bmulti.store/assets/b5b5529c-9f2e-494c-b957-eeb2fcfe6c5d
1691	2025-09-19 22:00:40.368023+00	1030550714	178.176.164.9	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/ecf3427c-da90-48ab-a78c-b73b9cee90bd	https://directus.bmulti.store/assets/400dfa76-16af-490f-a9b8-dcb056dbab31
1692	2025-09-20 03:25:23.445862+00	5105269677	45.144.28.138	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/1f63bb7f-0134-43a2-85d1-471aa7f672eb	https://directus.bmulti.store/assets/aa223fcf-d05d-4b18-bb04-58eafc54919b
1693	2025-09-20 06:02:22.049702+00	5173064362	178.176.84.188	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/791842c0-3bf3-4a7a-a752-1a5ce70b63ac	https://directus.bmulti.store/assets/68466370-9968-4c09-bccc-f071f15788c3
1694	2025-09-20 06:49:22.725895+00	1211184496	85.172.103.230	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/6cb01645-326e-48a3-8617-01af5676049d	https://directus.bmulti.store/assets/a77539a7-2cdc-4830-918d-985a8e6040c6
1672	2025-09-19 11:34:28.811561+00	424163384	212.233.84.156	t	t	done	200 рублей	WB	79851980620	https://directus.bmulti.store/assets/6526eeeb-9f1e-4097-b5b9-661f76cef45c	https://directus.bmulti.store/assets/78f63afa-185b-4767-a1fe-ab9db0ff9898
1674	2025-09-19 13:41:20.077+00	1391380708	193.243.172.238	t	t	done	200 рублей	OZON	79969428698	https://directus.bmulti.store/assets/d9083878-f4cd-4b3b-a088-bd1419881c14	https://directus.bmulti.store/assets/abdb9fdf-4646-4e4a-9551-9ab182f4add7
1800	2025-09-27 13:41:45.496788+00	\N	45.150.174.179	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1801	2025-09-27 13:41:46.047938+00	\N	45.150.174.179	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1695	2025-09-20 07:12:08.953131+00	304097467	213.87.148.140	t	f	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/b295421a-a0dd-4eb9-ad72-821449dba72c	https://directus.bmulti.store/assets/2e0aed80-0662-4cb6-92df-7331e6a44a08
1696	2025-09-20 07:17:57.555369+00	1932970476	176.215.96.44	t	t	in_work	300 рублей	OZON	\N	https://directus.bmulti.store/assets/c11ef968-f6dc-4471-9e50-f948fbb0bb89	https://directus.bmulti.store/assets/636e48b2-91f5-44f4-acbf-7c75db81efd3
1697	2025-09-20 08:56:01.287769+00	7566829092	37.212.32.20	t	t	check	200 рублей	WB	375257870846	https://directus.bmulti.store/assets/fbb6f413-032b-4489-840f-3c07c7c0aa76	https://directus.bmulti.store/assets/76f1311b-93ff-41f2-84bd-8ad2d22e3d0b
1704	2025-09-20 17:33:47.65212+00	641638479	212.28.89.88	t	f	check	200 рублей	YANDEX	79128376323	https://directus.bmulti.store/assets/489dc53b-aa15-4874-9a34-e921953fae15	https://directus.bmulti.store/assets/4fa435b2-2849-4a69-b704-54666367f4d4
1709	2025-09-21 01:58:46.285689+00	7147774836	91.149.69.106	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/54428791-dbfd-4ac8-875e-dc6fa3b53c29	https://directus.bmulti.store/assets/1b97e4f2-4a22-48de-aad0-bd56051a6a1a
1707	2025-09-20 19:38:56.150557+00	939385360	5.139.32.215	f	f	check	200 рублей	WB	79033708795	https://directus.bmulti.store/assets/bb722903-f0be-4823-b60a-989ed8cfe1d7	https://directus.bmulti.store/assets/183e4bf7-6a6f-4ab2-a16a-4db2266bc18a
1712	2025-09-21 11:21:05.94702+00	6390095883	46.0.208.40	t	t	check	200 рублей	OZON	79270148270	https://directus.bmulti.store/assets/886db70b-a19c-4724-ad02-1811bebc21c8	https://directus.bmulti.store/assets/e87a8063-8cc7-45d7-9081-73e54dfd00d0
1714	2025-09-21 12:47:25.553799+00	5833459245	79.127.142.223	t	t	check	200 рублей	OZON	79040214847	https://directus.bmulti.store/assets/8b822a27-12f1-49e9-8361-06337c1b53e1	https://directus.bmulti.store/assets/43913bc8-d2e1-42c6-8536-118cff5d24a0
1723	2025-09-22 07:14:20.18604+00	5354853054	92.124.160.251	t	t	check	200 рублей	WB	79136734682	https://directus.bmulti.store/assets/0a0502fb-0b68-46c0-9d50-f6adf92dcd2e	https://directus.bmulti.store/assets/1ba6aae9-f6b9-40ef-9227-3881ee236a10
1721	2025-09-22 02:25:15.870905+00	967687053	92.124.117.128	t	t	done	200 рублей	OZON	79139523579	https://directus.bmulti.store/assets/9c97f3a5-ab86-43dd-b08f-c78f18b6d32b	https://directus.bmulti.store/assets/aed5645d-88a2-456c-8688-4f935a2dcdbc
1698	2025-09-20 13:45:54.212981+00	1585391108	185.20.133.134	t	t	done	200 рублей	WB	79655644452	https://directus.bmulti.store/assets/5110f830-c98a-4d12-b51b-a4ef23f2378d	https://directus.bmulti.store/assets/0e6fcdbd-0a9f-45d5-a2d1-1c363a6a0bb4
1722	2025-09-22 04:07:39.767012+00	5088104087	176.124.222.82	t	t	done	1500 рублей	OZON	279538327342	https://directus.bmulti.store/assets/1e0a3c0f-2e9f-4df4-833e-409260ca27b1	https://directus.bmulti.store/assets/0891a5b4-3a8b-4b8c-b0b5-f5338f676ccf
1719	2025-09-21 18:41:38.18892+00	6687097118	89.151.171.138	t	t	done	200 рублей	OZON	279373955155	https://directus.bmulti.store/assets/896289b4-2d25-44c6-910e-8fcfbea0ba85	https://directus.bmulti.store/assets/1a577b52-d2ef-48e6-883b-f4f082cb9e85
1718	2025-09-21 16:20:43.577654+00	378506337	79.127.154.234	t	t	done	200 рублей	OZON	79326097713	https://directus.bmulti.store/assets/2a7a0004-43cf-4f0b-bde2-a002a5a53ee4	https://directus.bmulti.store/assets/b21c99ed-d9c2-44e1-8fc8-17b43b2e1d27
1717	2025-09-21 16:13:36.631848+00	1037222140	85.249.16.141	t	t	done	200 рублей	WB	79642957505	https://directus.bmulti.store/assets/e30f2a4d-176d-4b67-9f58-d565a4eb4dce	https://directus.bmulti.store/assets/32f07c3e-91ba-436f-9a36-25669afaa963
1716	2025-09-21 13:53:32.315491+00	7595923104	188.19.248.140	t	t	done	200 рублей	OZON	79194900141	https://directus.bmulti.store/assets/eb4e18fa-dd8b-4fd0-b317-ad62e0f44b77	https://directus.bmulti.store/assets/04f0cd65-3aca-49f3-95eb-c70a1b80dac8
1715	2025-09-21 13:06:57.38505+00	1489417815	194.60.238.137	t	t	done	200 рублей	OZON	79049190065	https://directus.bmulti.store/assets/358f63c1-b944-4b44-8569-45f26219b28c	https://directus.bmulti.store/assets/4a326a29-fca4-457c-8ca3-b38c4f5f3af6
1713	2025-09-21 12:41:34.969197+00	806838433	178.204.251.20	t	t	done	200 рублей	OZON	79872319979	https://directus.bmulti.store/assets/5259598d-92a6-4535-9618-459bee616cba	https://directus.bmulti.store/assets/d6c55120-a741-4021-a4ad-8236a7032d35
1711	2025-09-21 10:43:09.529411+00	853490448	195.200.26.251	t	t	done	200 рублей	WB	79883084846	https://directus.bmulti.store/assets/3a3cf68b-5ac5-4411-bea7-044246c4bea9	https://directus.bmulti.store/assets/21f389c7-39ae-46c7-9aff-9f1da24aecbf
1706	2025-09-20 19:27:42.258272+00	6396574602	5.139.32.215	t	t	done	200 рублей	WB	79377383619	https://directus.bmulti.store/assets/b2fc0e07-8cf1-4119-aad3-43708dfa76fa	https://directus.bmulti.store/assets/5596c823-1ad5-4f7f-822f-27daf33ab9e9
1705	2025-09-20 17:35:26.983731+00	978297263	188.113.35.227	t	t	done	200 рублей	OZON	79191784568	https://directus.bmulti.store/assets/161d600f-d819-4268-af8c-8ffb11f20d23	https://directus.bmulti.store/assets/0ef6d2fb-d4e9-4659-90ad-03563d123fde
1703	2025-09-20 15:57:32.812558+00	5614892771	188.128.33.1	t	t	done	200 рублей	OZON	79898044156	https://directus.bmulti.store/assets/5b2e38e5-939a-419e-8cd9-fff8b4e4fc60	https://directus.bmulti.store/assets/34d2dadb-a010-47be-a406-cfd370238f01
1702	2025-09-20 15:47:46.890308+00	1113873112	91.223.75.181	t	t	done	300 рублей	OZON	79202102210	https://directus.bmulti.store/assets/825b3736-b64a-4167-8bb0-e46e12eac0af	https://directus.bmulti.store/assets/d179ca48-56c2-467f-83a7-e2c56d657fe1
1699	2025-09-20 15:02:07.700436+00	440993481	94.140.137.110	t	t	done	200 рублей	OZON	79581350800	https://directus.bmulti.store/assets/22d65628-e3eb-4983-be37-c2aa86202c80	https://directus.bmulti.store/assets/ccdb639a-1dbc-423e-9606-8088445f4674
1724	2025-09-22 09:30:57.117977+00	5041694908	80.83.237.16	t	t	done	200 рублей	YANDEX	79144620716	https://directus.bmulti.store/assets/b5d39fb8-f817-413a-a28d-22fab21d0be7	https://directus.bmulti.store/assets/f577bbc3-261e-4dff-a5c6-ad7fec1a3aba
1708	2025-09-20 20:09:51.666293+00	707062446	176.113.246.155	t	t	done	200 рублей	WB	79591742222	https://directus.bmulti.store/assets/5392a90c-9844-48cb-8404-5062e830d580	https://directus.bmulti.store/assets/8bac8291-a3c2-48a7-9f3f-940eea00944e
1710	2025-09-21 08:20:54.44627+00	799450255	95.139.44.226	t	t	done	200 рублей	OZON	79182541059	https://directus.bmulti.store/assets/a82e20dc-cb01-4dc3-96ce-f1b1b22908be	https://directus.bmulti.store/assets/97ebbd7b-8ede-41ed-a95c-511e760d564e
1700	2025-09-20 15:12:24.86027+00	6356663178	89.204.95.71	t	t	done	200 рублей	OZON	79937255094	https://directus.bmulti.store/assets/e83e5d5a-b3dd-40b0-83ec-b00c7f72efda	https://directus.bmulti.store/assets/219fbaba-0745-4547-83a5-f1a5746e1b14
1720	2025-09-21 19:55:56.041844+00	738231331	85.192.48.145	t	t	done	200 рублей	OZON	79934864428	https://directus.bmulti.store/assets/c119d128-4bdf-42b9-a8bc-e5a29d3449ca	https://directus.bmulti.store/assets/43e0d347-cb4d-4020-86a9-e0314a930374
1725	2025-09-22 10:26:21.570282+00	6163643900	178.47.66.208	t	t	done	200 рублей	OZON	79526630319	https://directus.bmulti.store/assets/26dcd319-ee61-4219-bd25-d828334e2bac	https://directus.bmulti.store/assets/935e44a4-badd-4028-a9a2-ee5d64f18853
1729	2025-09-22 13:10:49.724858+00	6928892922	151.252.80.68	f	f	check	200 рублей	WB	79954897956	https://directus.bmulti.store/assets/cc53b0d1-93a6-4cea-82f0-2f38b3c51063	https://directus.bmulti.store/assets/53d78feb-5fb4-4753-a8db-1b8f904de4ee
1738	2025-09-23 07:07:05.328087+00	7169912523	37.212.39.23	t	t	check	200 рублей	OZON	375295829616	https://directus.bmulti.store/assets/b74fe932-3d35-4809-9d96-15ba1b6af097	https://directus.bmulti.store/assets/2b8c011f-6612-49d5-b2bf-fc6303dd98f3
1731	2025-09-22 14:32:52.452746+00	5274136954	185.135.232.70	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/aeac230b-5175-4bcf-af0b-bf9684ebc4bf	https://directus.bmulti.store/assets/a4dcc714-dfc8-4e63-9a0a-d914d3c37a08
1749	2025-09-23 15:06:41.012821+00	910248117	178.64.54.190	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/ce9ed77c-dfef-4624-a738-3aa21ec352cc	https://directus.bmulti.store/assets/beb84d5d-db30-44ca-a1b9-f0e52905b767
1748	2025-09-23 15:06:26.866961+00	910248117	178.64.54.190	t	t	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/5c3fd73f-6310-48b0-9803-21f2b2ce1b21	https://directus.bmulti.store/assets/cfa09670-ccec-4474-9dc9-ed6b50188eef
1750	2025-09-23 15:06:42.645233+00	910248117	178.64.54.190	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/4c58038d-d3a9-4cde-9dde-2b73c17dd0bd	https://directus.bmulti.store/assets/ff7e67e4-cd3c-4b37-8a5d-ae8287001778
1751	2025-09-23 15:06:43.908515+00	910248117	178.64.54.190	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/65ea4ecc-356d-4911-8480-4361e7c4f7a0	https://directus.bmulti.store/assets/d7c2ae6c-eca7-4bae-94c8-d36e4def2efd
1752	2025-09-23 15:06:55.185855+00	910248117	178.64.54.190	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/d7049855-0f2a-4d57-b616-0d1f9d334d46	https://directus.bmulti.store/assets/a4e4d258-713b-4c50-a284-229eada83816
1753	2025-09-23 15:06:56.769746+00	910248117	178.64.54.190	f	f	new	\N	YANDEX	\N	https://directus.bmulti.store/assets/b1b708c4-93c8-4a49-a495-3c801b513e20	https://directus.bmulti.store/assets/253dd4c2-3342-4cef-ad4c-12fdac9fc8d4
1754	2025-09-23 15:06:58.162495+00	910248117	178.64.54.190	f	f	check	500 рублей	YANDEX	79021931220	https://directus.bmulti.store/assets/654767ae-356e-4aca-a490-888e11889410	https://directus.bmulti.store/assets/b5ee4064-5339-4f20-8f7c-f4ebe01b1ee5
1742	2025-09-23 10:26:00.401346+00	7558531476	85.195.104.75	t	t	done	200 рублей	OZON	79992242076	https://directus.bmulti.store/assets/537abd7e-a41f-43d2-92ce-2b042c0126db	https://directus.bmulti.store/assets/e0d89b7e-75e3-441c-be49-0121947fec82
1741	2025-09-23 10:09:07.253059+00	7342194197	5.142.81.28	t	t	done	200 рублей	OZON	79302911111	https://directus.bmulti.store/assets/069b066e-64e9-4a31-a8ed-3e0d3a70e102	https://directus.bmulti.store/assets/35db52a5-4885-4f3c-97ac-f66f43b827be
1739	2025-09-23 07:46:49.763048+00	5865521555	178.67.194.203	t	t	done	200 рублей	OZON	79310910107	https://directus.bmulti.store/assets/6637fdb6-3804-486e-9e44-cd6a74529534	https://directus.bmulti.store/assets/380aa1d9-98fb-4601-ac30-c5f666a7e914
1737	2025-09-22 17:51:37.168338+00	732704496	217.66.157.159	t	t	done	200 рублей	OZON	79110990002	https://directus.bmulti.store/assets/8ef5482a-f6df-4c0a-8d3d-3e4ca29d0cbd	https://directus.bmulti.store/assets/0f7de41d-2e8b-4de2-a98e-73d505071a82
1736	2025-09-22 17:32:47.469886+00	1243261289	31.173.82.219	t	t	done	200 рублей	OZON	79242274307	https://directus.bmulti.store/assets/6c8b3804-1bf5-43a1-90e8-a0df85eeddf2	https://directus.bmulti.store/assets/8899d014-d2a8-4b54-8738-b109de5f1774
1735	2025-09-22 17:02:16.037166+00	1997309376	109.196.65.36	t	t	done	200 рублей	WB	79772825432	https://directus.bmulti.store/assets/5fc56068-ee97-4a4b-8b03-45375c8c4fa4	https://directus.bmulti.store/assets/06087b8a-8548-41b9-8362-d297af091298
1734	2025-09-22 16:21:12.326233+00	520348766	31.207.65.127	t	t	done	200 рублей	WB	79811266804	https://directus.bmulti.store/assets/f94f3e05-4bcd-48c2-b878-ee643dbc10ff	https://directus.bmulti.store/assets/9993f49a-2291-4270-ad7f-18ffce40c6ef
1728	2025-09-22 12:37:08.506529+00	451721718	188.162.166.112	t	t	done	200 рублей	OZON	79676666240	https://directus.bmulti.store/assets/3b500498-416f-4a24-9db5-c555dc4b53e8	https://directus.bmulti.store/assets/a068f541-a666-4413-b638-a4d5b0ebdd09
1727	2025-09-22 12:31:55.105078+00	690894312	213.87.137.199	t	t	done	200 рублей	WB	79104570960	https://directus.bmulti.store/assets/310086fd-d34c-4a46-80dc-0f06238acfdc	https://directus.bmulti.store/assets/d96cce6c-1d4c-43c0-a9fb-6a6a9e6c6a6d
1740	2025-09-23 10:05:25.23456+00	2049873719	45.88.210.47	t	t	done	200 рублей	OZON	79280813242	https://directus.bmulti.store/assets/8833f5a0-3cbe-4692-926b-e4dcb2cdfff5	https://directus.bmulti.store/assets/5e66f1c7-64ef-495d-841e-21c008694986
1726	2025-09-22 11:24:51.317252+00	888090809	5.101.24.140	t	t	done	200 рублей	OZON	79159685251	https://directus.bmulti.store/assets/1c3b63ac-9ecf-4c2a-8505-9cc858f32abf	https://directus.bmulti.store/assets/02c0ae86-5c0e-48bd-a855-e01c6ff7081c
1733	2025-09-22 15:57:13.551874+00	662483896	176.59.211.250	t	f	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/0130ecef-be59-4342-8f78-2ae658246b73	https://directus.bmulti.store/assets/fa5e36b7-3898-44df-ae1b-024a9692363b
1747	2025-09-23 13:50:35.615451+00	2046734532	80.253.235.123	t	t	done	200 рублей	OZON	79130365301	https://directus.bmulti.store/assets/5d042850-0bf1-4f29-b168-ecb66b27fb54	https://directus.bmulti.store/assets/b167e2e9-9a40-4dfb-b8b1-54dd3953b2bf
1746	2025-09-23 13:48:16.079138+00	5585032961	95.25.126.8	t	t	done	200 рублей	WB	79649143263	https://directus.bmulti.store/assets/9a6cb671-167f-4df6-8fff-e0145d44579a	https://directus.bmulti.store/assets/df911fc8-ebd1-4314-92a5-afe9a662dcc5
1745	2025-09-23 13:09:50.151837+00	664269040	178.176.172.186	t	t	done	200 рублей	OZON	79534557732	https://directus.bmulti.store/assets/21074a79-29bd-41eb-b427-faee13cde232	https://directus.bmulti.store/assets/99036090-ea4b-4d4b-a057-f93777a2c4ba
1744	2025-09-23 11:08:21.572142+00	1334530795	185.8.125.201	t	t	done	200 рублей	WB	279653005807	https://directus.bmulti.store/assets/ce30adb9-df91-4a36-8af7-a8f4aca54b1b	https://directus.bmulti.store/assets/bd0794e2-6182-4543-97b3-177d74cfdb56
1732	2025-09-22 14:51:50.637351+00	1836983104	46.158.63.109	t	t	done	200 рублей	OZON	79002591041	https://directus.bmulti.store/assets/69bac3e7-5272-4829-b4bd-03aead7d5d04	https://directus.bmulti.store/assets/92548fdd-36d5-41f1-a844-14f0db055e6f
1730	2025-09-22 14:31:40.603071+00	1819648982	91.223.70.224	t	t	done	200 рублей	OZON	79218622263	https://directus.bmulti.store/assets/130a2205-9558-4f4b-ae7e-c5adc0207421	https://directus.bmulti.store/assets/3d93fa87-c230-4702-a218-5fc98fa4179d
1842	2025-09-29 11:45:06.43759+00	1077798665	176.223.103.142	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/6df82312-dd80-4ab7-bd57-cc356c6174c6	https://directus.bmulti.store/assets/41e4d3eb-d93d-4ff1-b819-c10ac6803b56
1763	2025-09-24 09:10:12.469095+00	551024433	91.78.189.147	t	t	done	200 рублей	OZON	79821802744	https://directus.bmulti.store/assets/3a37eaae-9023-4bc8-9666-cb434a4a7fe0	https://directus.bmulti.store/assets/c05e60a4-da66-462a-a6ba-278e58a2ef1d
1759	2025-09-23 19:57:08.215637+00	6487128871	134.19.186.164	t	t	check	200 рублей	OZON	79254080486	https://directus.bmulti.store/assets/2551ab2d-b94d-41f3-9f00-cb44572729f8	https://directus.bmulti.store/assets/ea100229-a434-4e52-88fa-20a075b36cec
1762	2025-09-24 07:55:05.128883+00	1063593542	178.252.127.226	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/7717cb07-4958-491a-986e-29ce366d2a38	https://directus.bmulti.store/assets/0c385fc4-51a0-4b1d-a2c3-4c47935e13ff
1766	2025-09-24 14:35:14.99857+00	2025840009	88.135.60.9	t	t	check	200 рублей	OZON	79605915777	https://directus.bmulti.store/assets/742aad90-10e2-4a44-bd28-431605a7599e	https://directus.bmulti.store/assets/4ff81843-f1da-4a12-b444-fad8b2b6f3da
1767	2025-09-24 15:11:34.043252+00	6703420910	37.230.201.107	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/84743e98-9368-4d00-b78e-df13711519f5	https://directus.bmulti.store/assets/dee3a852-b462-46a8-9a87-9a4bdeb3a1ce
1761	2025-09-24 07:37:08.926106+00	5035116459	212.164.38.59	t	t	done	200 рублей	WB	79939523703	https://directus.bmulti.store/assets/90895044-2775-4540-abf2-8e201bf94d96	https://directus.bmulti.store/assets/715ad7ed-4d1e-4eaa-9508-1b4a58e046ee
1760	2025-09-24 07:30:58.449092+00	5089504348	176.14.131.228	t	t	done	200 рублей	OZON	79612975932	https://directus.bmulti.store/assets/f5eb02f8-c175-4837-94c7-da6651461257	https://directus.bmulti.store/assets/335797f8-b6ba-4d56-bb5e-9c4183b0ad1b
1771	2025-09-24 17:28:13.498704+00	5631431233	213.87.153.174	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/edefa12f-148f-43f0-a10c-5537ad87d131	https://directus.bmulti.store/assets/4e25c323-ccd6-4b7c-8678-20826e256fea
1772	2025-09-24 17:28:30.241188+00	5631431233	213.87.153.174	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/852677c0-aaf8-4ec6-89dc-97135bdfe7bd	https://directus.bmulti.store/assets/d8341e5c-b405-4ea5-be7b-335c2cb938a0
1758	2025-09-23 18:11:20.610292+00	520348766	31.207.65.127	f	t	done	200 рублей	WB	79811266804	https://directus.bmulti.store/assets/099b2967-e8c0-4110-8219-1e234f219002	https://directus.bmulti.store/assets/4c77394c-5857-45ee-94c4-acadfc66f4c0
1757	2025-09-23 17:49:21.375279+00	549787941	109.234.29.251	t	t	done	200 рублей	OZON	79187873800	https://directus.bmulti.store/assets/c6a8e738-ecb8-49a5-820f-425edec4352f	https://directus.bmulti.store/assets/ab9b02d2-00bb-4d91-b79f-4da195f534d0
1756	2025-09-23 17:44:28.061254+00	5216506556	185.69.125.44	t	t	done	300 рублей	WB	79991848562	https://directus.bmulti.store/assets/497927ac-7bd9-4e61-bc27-155cd958e2d9	https://directus.bmulti.store/assets/b7bab617-9ae6-4ef7-9abc-570bf30e46ae
1755	2025-09-23 17:34:54.714465+00	7079128115	95.27.99.202	t	t	done	200 рублей	OZON	79109671913	https://directus.bmulti.store/assets/833e47fb-5d60-4d7c-8392-bc16df6f314e	https://directus.bmulti.store/assets/77099d4c-99d5-43aa-9587-53002fc84112
1743	2025-09-23 11:08:10.464143+00	1478913109	193.228.193.115	t	t	done	200 рублей	WB	79934601509	https://directus.bmulti.store/assets/459e93d2-834c-4481-82c8-7d8fee9bedc9	https://directus.bmulti.store/assets/a07183de-5e25-4376-acc1-219984e71576
1778	2025-09-25 10:15:55.853317+00	7675234565	213.87.153.155	t	t	check	200 рублей	WB	79107586335	https://directus.bmulti.store/assets/679d1a99-05a3-4e40-8cca-bd6da377496e	https://directus.bmulti.store/assets/15b0ae8b-ca6d-409b-a6a7-a6e243c930a4
1779	2025-09-25 12:43:44.293289+00	6471679594	176.15.243.26	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/4401f45a-8d4c-4429-b917-d820d65be667	https://directus.bmulti.store/assets/33c06185-eabf-4bc9-bb84-05bb72716d19
1774	2025-09-24 19:48:05.667664+00	1069069084	146.120.77.252	t	t	done	200 рублей	OZON	79112637515	https://directus.bmulti.store/assets/133f6bd8-7f23-414b-a3ba-fb8e7506caf5	https://directus.bmulti.store/assets/afbe4b8c-8d92-4b9c-944b-6cb6bbd0b891
1782	2025-09-25 14:38:36.755057+00	5350837375	94.232.204.24	f	f	check	200 рублей	WB	79047775589	https://directus.bmulti.store/assets/437dbdeb-1b2f-4103-b3b8-7e7c510d8583	https://directus.bmulti.store/assets/4fdcc2b2-89ac-4c70-8ef4-61b95efbafc3
1773	2025-09-24 19:45:26.249195+00	520348766	31.207.65.127	t	t	done	200 рублей	WB	79811266804	https://directus.bmulti.store/assets/8dc48fa8-4097-46c6-821d-0c53a0f804a8	https://directus.bmulti.store/assets/8221782e-0b56-4fa5-8b78-667b670619bc
1768	2025-09-24 16:00:03.086842+00	803268210	91.107.100.155	t	t	done	200 рублей	OZON	79393960981	https://directus.bmulti.store/assets/e3051077-745e-4727-8608-002fb0f60ada	https://directus.bmulti.store/assets/11f9ce7a-65a9-4ddb-a10e-edb7fcb66f0d
1765	2025-09-24 11:26:35.50084+00	1682893013	95.191.250.170	t	t	done	200 рублей	OZON	79537657032	https://directus.bmulti.store/assets/0f7c3c99-8f5a-4a06-a61c-a243b3362672	https://directus.bmulti.store/assets/d90a2020-e75d-4f93-b295-7ec1ad435beb
1764	2025-09-24 11:11:30.003275+00	312961268	81.25.77.157	t	t	done	200 рублей	OZON	79082093111	https://directus.bmulti.store/assets/94b1095e-9ae4-4866-9db0-de23030957ba	https://directus.bmulti.store/assets/bbd42fb4-0c6d-4c5c-987d-d7b5444e48af
1781	2025-09-25 13:47:11.994647+00	877745367	178.74.78.175	f	t	done	200 рублей	OZON	79230368687	https://directus.bmulti.store/assets/58e7c8e6-8c80-4899-93e1-7fa320dd5893	https://directus.bmulti.store/assets/9ddac777-25e3-4ec1-942d-1c74ecdd52f5
1780	2025-09-25 13:43:49.316466+00	898044440	188.162.228.151	t	t	done	200 рублей	OZON	79621511177	https://directus.bmulti.store/assets/cd3a7168-cffd-4ee5-9c83-46f41ff898bc	https://directus.bmulti.store/assets/cb3b482e-f540-4611-b650-f6be3c846ae4
1777	2025-09-25 09:04:22.422278+00	6085379834	188.170.80.130	t	t	done	200 рублей	OZON	79114974495	https://directus.bmulti.store/assets/48a9e3be-df05-4a12-840c-cb639fe29728	https://directus.bmulti.store/assets/4c124693-b34b-4071-a0cd-eb5c58843f7e
1776	2025-09-25 08:49:09.166568+00	6142047329	85.172.102.165	t	t	done	200 рублей	WB	79181491668	https://directus.bmulti.store/assets/6653b093-d0a9-403d-a052-f90812073aa2	https://directus.bmulti.store/assets/28e8be96-4797-4b67-80f4-2e9166c89321
1775	2025-09-25 07:08:14.615568+00	909752139	2.63.54.239	t	f	done	200 рублей	OZON	79632686919	https://directus.bmulti.store/assets/2b85abf0-6297-4b6a-a046-953e6570a0da	https://directus.bmulti.store/assets/1437d309-9368-417d-9087-33d40da49f50
1770	2025-09-24 16:42:54.792818+00	648924748	5.165.124.235	t	t	done	200 рублей	OZON	79042815564	https://directus.bmulti.store/assets/305e69b6-13bc-4528-a57a-58c6b38d5c4d	https://directus.bmulti.store/assets/72651ae1-62e8-413b-8496-69bfc45f466f
1792	2025-09-26 21:22:38.739236+00	425356957	178.141.188.203	t	t	done	500 рублей	OZON	79195206446	https://directus.bmulti.store/assets/85572867-3f14-4517-b462-ec72bab87d4d	https://directus.bmulti.store/assets/2dd3cc4a-fb66-45bd-a8d4-46511a8ffd92
1783	2025-09-26 04:28:49.90987+00	1133336669	31.133.61.12	t	t	check	200 рублей	OZON	79493803613	https://directus.bmulti.store/assets/8c60bf1f-6272-4dc9-ae09-1d629e8d1914	https://directus.bmulti.store/assets/cf1d61e9-3bae-4ef2-8929-c56cd7b5b1ca
1784	2025-09-26 08:34:19.304781+00	715080892	91.210.58.87	f	f	check	200 рублей	OZON	79196661029	https://directus.bmulti.store/assets/63d91afc-1863-4e15-acb3-f3422a395c88	https://directus.bmulti.store/assets/0acf239b-aa13-4e01-83ef-2b56b13e4a6a
1848	2025-09-29 15:31:49.26149+00	5633599932	85.93.60.26	t	t	check	200 рублей	OZON	79041075300	https://directus.bmulti.store/assets/83c9eb27-d98e-46eb-8a97-9a23728a631a	https://directus.bmulti.store/assets/1c80d90e-de43-4f53-8e8f-7ced6310ad72
1799	2025-09-27 12:16:38.747137+00	5030990296	85.206.171.172	t	t	done	200 рублей	WB	79870044670	https://directus.bmulti.store/assets/238ea8d6-b5d8-4518-8efb-00f9c9bc5a48	https://directus.bmulti.store/assets/5dcbbe3e-d739-43d3-ab50-42f3822f84ce
1798	2025-09-27 09:52:56.062622+00	6526993035	178.78.40.48	t	t	done	200 рублей	OZON	79183279415	https://directus.bmulti.store/assets/2cefabf8-ace2-4c16-b769-f27bc4c9c93e	https://directus.bmulti.store/assets/9b3794d7-e3de-47b0-8b68-15d82709baf0
1796	2025-09-27 07:50:22.106957+00	536136184	90.154.71.140	t	t	done	200 рублей	OZON	79151467470	https://directus.bmulti.store/assets/c713a840-bff5-4ddb-916a-0bea84a13d0a	https://directus.bmulti.store/assets/dfb45553-293b-4365-9090-9a711bf528ed
1795	2025-09-27 06:20:03.852736+00	438324847	213.87.137.238	t	t	done	200 рублей	OZON	79166463692	https://directus.bmulti.store/assets/0d9653d0-bf43-4240-9723-62e68edd3e9e	https://directus.bmulti.store/assets/247b88bb-6a80-4c53-8716-1634eec65781
1793	2025-09-27 03:46:37.068156+00	1534209792	176.59.14.206	t	t	done	200 рублей	OZON	79522988271	https://directus.bmulti.store/assets/5bdc3c73-c2a6-4cc9-8e47-27f24e664eb3	https://directus.bmulti.store/assets/7b317a46-b7dd-4069-96cd-84390512393d
1787	2025-09-26 12:47:16.753055+00	7805672427	176.59.141.88	t	t	check	200 рублей	WB	79521792022	https://directus.bmulti.store/assets/093966d8-1b0f-4d28-b592-83bb33b6a570	https://directus.bmulti.store/assets/e7baaa1f-7eaa-4c2e-ab91-7c40fa3fdc15
1791	2025-09-26 18:11:31.134381+00	738091644	95.221.243.201	t	t	done	200 рублей	WB	79197262897	https://directus.bmulti.store/assets/29db6085-5c6f-460c-8627-2683fd2b7765	https://directus.bmulti.store/assets/09959be1-2a74-4b89-9439-c5d6278f0220
1789	2025-09-26 17:04:26.136505+00	2054407590	193.106.111.49	t	t	done	200 рублей	OZON	79052702726	https://directus.bmulti.store/assets/08cdfdfb-b543-425f-a27b-aab27751fe6b	https://directus.bmulti.store/assets/6cd37c22-712b-4a8b-aeb2-84106923b304
1790	2025-09-26 17:29:56.610603+00	360527188	95.165.78.187	t	t	done	300 рублей	OZON	79153933369	https://directus.bmulti.store/assets/4e5427ad-ae79-4ee7-a07e-76eb65c359ca	https://directus.bmulti.store/assets/7541b42e-6cec-4cff-8271-ab5e5a19e556
1788	2025-09-26 13:50:55.39511+00	1157675752	188.232.158.149	t	t	done	200 рублей	OZON	79136642367	https://directus.bmulti.store/assets/e811cd25-0658-4cd8-a4c3-12bdc7aa0471	https://directus.bmulti.store/assets/45bc5567-d7e7-46cd-8e66-a8e069526e9b
1786	2025-09-26 11:55:51.263883+00	967053399	5.165.213.75	t	t	done	200 рублей	OZON	79138245797	https://directus.bmulti.store/assets/d095567b-1b40-407d-b9a7-d65e3ba94d88	https://directus.bmulti.store/assets/a5daa725-1e83-4720-816d-96207faaa184
1785	2025-09-26 11:12:36.542078+00	752245889	193.138.7.142	t	t	done	200 рублей	WB	79600215380	https://directus.bmulti.store/assets/861ca2d2-6779-4380-8981-485144c8be88	https://directus.bmulti.store/assets/64aa09b8-11a3-45b0-9803-79263360146c
1862	2025-09-30 10:46:54.17261+00	721734111	188.234.87.236	t	t	check	200 рублей	OZON	79920056272	https://directus.bmulti.store/assets/ec9c47c8-605b-485e-9b71-761e8ff9bd44	https://directus.bmulti.store/assets/0743eb4e-073e-47c4-840a-fc88983d0a3c
1843	2025-09-29 11:51:47.381483+00	1290634911	5.142.29.77	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/af3c95da-ccb1-43d8-949f-7b6f7635edb9	https://directus.bmulti.store/assets/bd354028-5763-4431-9c9d-29e97b92e79d
1865	2025-09-30 14:57:21.686724+00	5039749661	91.199.118.210	f	t	check	200 рублей	OZON	79236933355	https://directus.bmulti.store/assets/b32c95b9-4f89-4fc8-9f04-f8e4e8ba0bba	https://directus.bmulti.store/assets/1236dd5f-3d65-441e-b82d-6454319498ab
1868	2025-09-30 16:27:25.436799+00	350901439	194.87.115.100	t	t	check	200 рублей	OZON	79271831249	https://directus.bmulti.store/assets/62e56ad5-8c9c-4325-9dc6-ac401801a013	https://directus.bmulti.store/assets/1638bc92-3a04-46f1-a421-cbe8272870f4
1794	2025-09-27 06:17:11.361338+00	5655305621	31.186.156.170	f	t	check	200 рублей	WB	79836037436	https://directus.bmulti.store/assets/b90bcda8-9828-42bf-8a40-e37748f3bfd1	https://directus.bmulti.store/assets/5ee14902-9f1a-487d-acec-4be9eee0e089
1872	2025-09-30 19:36:07.116618+00	2104854193	91.79.192.147	f	f	check	200 рублей	YANDEX	79826939752	https://directus.bmulti.store/assets/88c8b762-9465-4bf5-ae02-6704f76ffd3d	https://directus.bmulti.store/assets/3c4eb872-8dcf-4608-b9ff-fadef48726a9
1797	2025-09-27 09:39:46.730906+00	247213494	109.95.18.193	t	t	check	200 рублей	OZON	79054104369	https://directus.bmulti.store/assets/9226a54d-56fb-4e92-80d9-48b33274771a	https://directus.bmulti.store/assets/5dc9776e-e5cb-4ed1-8c30-7566b5988036
1859	2025-09-30 06:05:09.219145+00	764171415	176.59.16.9	t	t	done	200 рублей	OZON	279527908858	https://directus.bmulti.store/assets/271d732a-b49d-4d8a-8f9e-e2668cb61ec1	https://directus.bmulti.store/assets/d2473fbe-5fba-4800-a676-45d936654a96
1851	2025-09-29 16:14:27.508934+00	197364181	109.198.226.31	t	t	done	200 рублей	OZON	79126150827	https://directus.bmulti.store/assets/db330f9a-9ad4-42de-9ee1-33ae35e3f98b	https://directus.bmulti.store/assets/7aba7b88-06ee-44b0-ae04-ae915673a979
1854	2025-09-29 18:47:16.471565+00	783915484	85.175.197.203	t	t	done	200 рублей	WB	79933272294	https://directus.bmulti.store/assets/fe416bfa-a28f-4dc7-8f6b-eb147c42a112	https://directus.bmulti.store/assets/df1a8d26-1851-41bc-a23e-059f75104aa6
1839	2025-09-29 05:34:06.779396+00	632017523	194.190.68.82	t	t	done	200 рублей	OZON	79131702290	https://directus.bmulti.store/assets/d35fa34d-a0a2-4fb0-99b4-df280540e0c9	https://directus.bmulti.store/assets/7baced06-845f-499a-a9fc-88c98163b7e9
1837	2025-09-28 21:35:41.991084+00	632888034	95.104.171.166	t	t	done	200 рублей	OZON	79223028777	https://directus.bmulti.store/assets/d1a44659-4b54-4a17-b3da-ddf74e9a52f5	https://directus.bmulti.store/assets/cad4e8bc-10cd-4fb2-b0ce-b09af5b21a4c
1870	2025-09-30 18:21:56.200666+00	6209108425	5.139.232.164	t	t	done	200 рублей	OZON	79620230888	https://directus.bmulti.store/assets/5b65bee0-4ecd-463b-af31-02d94ece3074	https://directus.bmulti.store/assets/6f466c2b-c858-4e09-92c0-587f32ab77b5
1856	2025-09-29 20:11:34.62473+00	360527188	213.87.130.147	t	t	done	200 рублей	OZON	79153933369	https://directus.bmulti.store/assets/ee342e8e-e2d7-453b-958b-ac9c4081b276	https://directus.bmulti.store/assets/1b1d02cc-0b8f-4c1e-b96e-fd6b7ac84665
1803	2025-09-27 13:41:52.752627+00	\N	45.150.174.179	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1823	2025-09-28 10:12:59.91733+00	972356033	95.26.144.250	t	t	done	200 рублей	WB	79297705539	https://directus.bmulti.store/assets/4aa6af03-f997-48cb-82cc-8304b1af4436	https://directus.bmulti.store/assets/034683b7-9f6a-476d-a560-c7aa65d700bb
1819	2025-09-28 08:13:28.024401+00	176335960	50.7.197.74	t	t	done	500 рублей	OZON	79139634647	https://directus.bmulti.store/assets/1e541574-321c-4885-84e0-282d14779175	https://directus.bmulti.store/assets/f389d2d3-abb5-4bf3-b48c-1ae53f96eb58
1816	2025-09-28 05:08:50.703212+00	1897959444	185.253.40.169	t	t	check	200 рублей	OZON	79494396653	https://directus.bmulti.store/assets/0794bef1-6be1-4cfe-99e3-fcce65c240bd	https://directus.bmulti.store/assets/a209722c-4880-47a3-80c7-8356015c1081
1817	2025-09-28 06:37:47.587213+00	5101641440	178.155.51.97	t	t	done	200 рублей	OZON	79294902555	https://directus.bmulti.store/assets/7e511e21-0199-41b0-bcf5-1870a189106e	https://directus.bmulti.store/assets/38f187a9-91c6-4eb5-a043-955631b5c263
1814	2025-09-27 18:06:00.11322+00	5041463534	109.126.252.0	t	f	done	200 рублей	OZON	79209250547	https://directus.bmulti.store/assets/06cce2a9-e30e-4bbd-b7cd-b0c6d3bc6baa	https://directus.bmulti.store/assets/ba0d8769-90bf-482e-9aa5-3979494af529
1813	2025-09-27 17:59:47.295329+00	931377334	176.52.112.207	t	t	done	200 рублей	OZON	79393843163	https://directus.bmulti.store/assets/61346279-2da2-4ef5-a087-a24419d0c67d	https://directus.bmulti.store/assets/c5ae950c-5265-43d5-bd63-e4367eb2463f
1812	2025-09-27 16:47:32.061536+00	824989341	45.134.184.215	t	t	done	200 рублей	OZON	79629695133	https://directus.bmulti.store/assets/f889dcab-5fba-4be2-90f4-dfc75873f0f2	https://directus.bmulti.store/assets/fc7dc7f2-fd58-48e2-9475-923e79cbd9f9
1811	2025-09-27 16:25:08.896474+00	49035440	109.252.40.15	t	t	done	200 рублей	WB	79647880271	https://directus.bmulti.store/assets/855b64d9-44e4-474d-99a1-53ff67ffefdf	https://directus.bmulti.store/assets/94590477-ee24-4b78-aa6f-a47e405c9c82
1806	2025-09-27 15:01:33.049172+00	1505062359	91.84.114.43	t	f	check	200 рублей	OZON	79120225301	https://directus.bmulti.store/assets/1ce6d997-221d-40cc-8876-fdc9fe2805d6	https://directus.bmulti.store/assets/5ce00acf-2a16-4638-9761-1d2a67aae02b
1809	2025-09-27 15:57:33.681631+00	433490284	94.241.203.233	t	t	done	200 рублей	WB	79097207787	https://directus.bmulti.store/assets/2f2509c8-748a-4ad5-913b-5ba8a8eaa0cf	https://directus.bmulti.store/assets/bbbea83d-0e9a-4596-bb81-c87be6c03bd4
1808	2025-09-27 15:39:41.147122+00	441008472	178.66.50.154	t	t	done	200 рублей	OZON	79183377692	https://directus.bmulti.store/assets/66a19488-a6ea-4fbd-bc0b-7051fa759dc9	https://directus.bmulti.store/assets/56a5714e-31f4-449f-a2b0-19057676a542
1805	2025-09-27 14:10:43.020769+00	7610004292	81.177.233.232	t	t	done	200 рублей	OZON	79297786269	https://directus.bmulti.store/assets/301585f8-71e2-44a2-8ebe-8d2af6ea9ef2	https://directus.bmulti.store/assets/888661c8-6fcc-4930-b63e-5df4756f5a57
1804	2025-09-27 13:41:56.314402+00	1725671941	95.153.160.141	t	t	done	200 рублей	OZON	79881327867	https://directus.bmulti.store/assets/4061e90d-552c-4bc0-ae91-4b709b74a0dc	https://directus.bmulti.store/assets/a260399c-c85d-4e1e-ad57-6f3167330e4a
1821	2025-09-28 08:45:07.754386+00	306870952	46.73.181.231	t	t	done	500 рублей	WB	79778984434	https://directus.bmulti.store/assets/d82a39c8-560f-44f0-a358-4b908888f142	https://directus.bmulti.store/assets/e31909dd-b1d7-42fb-967c-f0c2665ddae2
1824	2025-09-28 11:06:08.388255+00	5933623789	94.140.154.180	t	t	done	200 рублей	WB	79935155034	https://directus.bmulti.store/assets/55c6c192-3e10-4ead-b7e3-961f76954bb2	https://directus.bmulti.store/assets/36f0e26b-98bc-4314-aee6-f13f101fd498
1807	2025-09-27 15:14:14.805875+00	1781925181	95.24.5.156	t	t	done	200 рублей	WB	79083028422	https://directus.bmulti.store/assets/e16dd574-5f86-4836-ba57-944020a53941	https://directus.bmulti.store/assets/ed33e34c-ffcb-475b-b2ee-7b3abda98f1f
1833	2025-09-28 15:55:08.334906+00	5263442666	109.126.5.209	t	t	done	200 рублей	WB	279053415193	https://directus.bmulti.store/assets/a6d51805-6204-4231-a48b-84931eb6b658	https://directus.bmulti.store/assets/949d0825-b2e3-48ab-9bca-e146e66c9040
1830	2025-09-28 15:25:09.018142+00	306241401	77.79.175.80	t	t	done	200 рублей	OZON	79174080245	https://directus.bmulti.store/assets/310e142a-55d3-4bc5-8adb-392723aa94b0	https://directus.bmulti.store/assets/373e2efb-9b3d-47e8-97a4-e733f5abf566
1825	2025-09-28 11:39:10.875672+00	5707044498	136.244.87.33	f	f	check	200 рублей	WB	79188094670	https://directus.bmulti.store/assets/abb4d376-aae2-417a-be3f-aacf0c2596f2	https://directus.bmulti.store/assets/2316f82b-c764-41e7-a97d-5ee05d48ac48
1810	2025-09-27 16:10:10.88234+00	8012181416	85.249.31.217	t	t	check	200 рублей	OZON	79600661279	https://directus.bmulti.store/assets/529ac886-fe8e-4d47-ae5a-aa7bdcd6cb64	https://directus.bmulti.store/assets/46f6d187-bc82-4f01-a70f-ddffc1b953aa
1815	2025-09-27 19:52:35.694605+00	411157223	213.147.196.121	t	t	check	200 рублей	WB	79179879286	https://directus.bmulti.store/assets/31849c43-e0b5-487d-a023-265d462664e6	https://directus.bmulti.store/assets/585641e7-86db-429a-bc98-80bf4d4d0897
1818	2025-09-28 07:53:19.733479+00	5686208276	79.139.254.28	t	f	check	200 рублей	WB	79265678677	https://directus.bmulti.store/assets/e198be6d-069d-4d42-8320-1222b272bce3	https://directus.bmulti.store/assets/4f65755d-3f17-4324-853f-70f8c1758a12
1820	2025-09-28 08:40:29.329248+00	1918482076	46.32.67.20	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/01863973-578d-4cf4-9c02-a8c078c851c5	https://directus.bmulti.store/assets/1c55de89-9fd7-4249-8d64-b5addcbec899
1822	2025-09-28 08:54:20.261193+00	897715117	78.85.239.240	f	f	check	200 рублей	OZON	79966932221	https://directus.bmulti.store/assets/e3a51dc9-fda6-4cd9-92f0-f327552a9597	https://directus.bmulti.store/assets/63d2035c-9a53-492e-b7c5-5dd82e9ed455
1826	2025-09-28 11:39:14.202759+00	5707044498	136.244.87.33	f	f	check	200 рублей	WB	79188094670	https://directus.bmulti.store/assets/bb5e3d72-656f-4fdd-b266-1e052d43f6b7	https://directus.bmulti.store/assets/0dc5afd4-5292-4f61-b15c-f690f020faca
1828	2025-09-28 12:10:20.557897+00	\N	128.14.56.201	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1829	2025-09-28 12:10:21.875903+00	\N	128.14.56.201	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1831	2025-09-28 15:32:08.302363+00	1282315562	81.195.180.174	t	f	new	\N	WB	\N	https://directus.bmulti.store/assets/cd6b4930-6f45-4c39-b929-a421e4fb644f	https://directus.bmulti.store/assets/1014ba22-ed25-4efa-a194-1d504c0e6a7c
1832	2025-09-28 15:32:18.598511+00	1282315562	81.195.180.174	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/222e0976-93c8-44fe-8cd2-47f8768f62be	https://directus.bmulti.store/assets/131cf33a-b41c-480d-b87f-9865281e40b9
1867	2025-09-30 16:27:21.154602+00	799365719	95.52.208.140	t	t	check	200 рублей	WB	79113539505	https://directus.bmulti.store/assets/949dc2ca-8dc9-4be2-9ccb-3f7c009d12d0	https://directus.bmulti.store/assets/7b2570ae-4a0d-444a-9d7b-20d529020cb3
1769	2025-09-24 16:14:32.413873+00	885506235	176.15.172.9	t	t	done	200 рублей	WB	79513242845	https://directus.bmulti.store/assets/01e2bcf7-b25b-426b-b26f-683563d6a1d7	https://directus.bmulti.store/assets/1b9de482-f2bd-4d4b-b3fb-82fa00983415
1860	2025-09-30 08:59:48.099615+00	562498076	109.252.169.40	t	t	done	200 рублей	OZON	79151967657	https://directus.bmulti.store/assets/2ca3c622-cd5f-4d29-978e-9e553021aeb9	https://directus.bmulti.store/assets/f871bd77-4b15-4c3b-9e68-31a92324ea08
1827	2025-09-28 11:56:20.177135+00	1249641687	185.86.125.194	t	t	done	200 рублей	OZON	90231721212	https://directus.bmulti.store/assets/73326f0e-4b46-40a2-943c-3a1bf47d82fd	https://directus.bmulti.store/assets/3fb2b471-63a3-4692-bd09-b54fef017619
1852	2025-09-29 16:28:57.483441+00	1124888757	178.234.232.100	f	t	done	200 рублей	WB	79934311457	https://directus.bmulti.store/assets/c8d02bff-e38b-4ccc-9d6b-9d5e5513e7f3	https://directus.bmulti.store/assets/2c229b27-cd3a-4717-8cde-e187859928e5
1857	2025-09-30 03:42:49.178015+00	6013385589	31.200.233.90	t	t	check	200 рублей	WB	79241282518	https://directus.bmulti.store/assets/ac8148cb-019f-43c6-a2a3-41f30f2c50d1	https://directus.bmulti.store/assets/962fd204-b589-4209-926a-bea83f98afc8
1849	2025-09-29 15:51:48.627149+00	515754504	109.252.114.63	t	t	done	200 рублей	OZON	79091699818	https://directus.bmulti.store/assets/6ed510e9-de2a-43f3-ad16-4689ba6fd61d	https://directus.bmulti.store/assets/9e6755d6-c79d-43f6-900d-ba36e18d6f94
1846	2025-09-29 14:06:52.483917+00	5363702994	176.208.52.116	t	t	done	200 рублей	OZON	79224012041	https://directus.bmulti.store/assets/f664bb08-10d2-42ff-953d-6ab8966d3fb2	https://directus.bmulti.store/assets/017b8a7e-4d60-4fad-9ff7-cc41a6740754
1874	2025-09-30 20:12:25.052175+00	633546657	5.35.113.231	t	t	check	200 рублей	OZON	79600240798	https://directus.bmulti.store/assets/f9ce5f4b-71a3-49d3-8e31-a65811733e68	https://directus.bmulti.store/assets/532d492a-728a-400b-8b34-99215a5a303a
1836	2025-09-28 19:19:50.328139+00	2099577291	109.62.152.133	t	t	done	200 рублей	WB	79524203367	https://directus.bmulti.store/assets/0a90221f-13db-4948-a432-8abe398b1c7e	https://directus.bmulti.store/assets/65b8da53-8e05-4b95-afdd-646f473d4668
1834	2025-09-28 16:54:56.022442+00	5753434656	185.90.102.220	t	t	done	200 рублей	OZON	289535350292	https://directus.bmulti.store/assets/bfef269e-23d2-4327-bb0c-16e184555ea6	https://directus.bmulti.store/assets/91bdfc70-f978-468c-a3dd-83a5c73d2dff
1878	2025-10-01 09:23:29.040975+00	430898466	91.79.195.64	t	t	check	200 рублей	WB	79825490501	https://directus.bmulti.store/assets/269e68e4-1960-400c-919d-f8a4ff6ac7ec	https://directus.bmulti.store/assets/bf7aaff3-7496-4bc8-b3f9-b533432e6f33
1884	2025-10-01 12:19:06.11914+00	5327452362	188.18.246.255	t	t	check	200 рублей	WB	79129072593	https://directus.bmulti.store/assets/79508344-2ad1-42e2-af7c-f10fc8f9dfc8	https://directus.bmulti.store/assets/f26b5be8-a890-4420-8c05-3615bf4cd3dc
1886	2025-10-01 12:23:12.482973+00	6152508624	188.18.246.255	f	t	check	200 рублей	WB	79024934649	https://directus.bmulti.store/assets/43c69adb-6d09-46be-8a13-2f17e8dbada5	https://directus.bmulti.store/assets/2b81d197-884c-4a3c-8864-4f9ff6b821be
1887	2025-10-01 15:18:43.855516+00	1904395710	91.204.150.240	t	t	check	200 рублей	OZON	79817176948	https://directus.bmulti.store/assets/d942c703-14f6-454b-be71-7fe56f9f6875	https://directus.bmulti.store/assets/6b7460a3-03b0-4447-97a0-f89f24c04dbd
1892	2025-10-01 17:36:30.016434+00	5211545333	91.224.16.92	t	t	check	200 рублей	OZON	79494612169	https://directus.bmulti.store/assets/8f7573c5-5297-4c32-8a71-dab8b67d9ffd	https://directus.bmulti.store/assets/7bb95ccc-5b03-4d60-b5ae-3b733d12880d
1866	2025-09-30 15:05:55.413021+00	1727841534	193.233.126.69	t	t	done	200 рублей	OZON	79993055547	https://directus.bmulti.store/assets/a38c7029-8287-41f1-ac67-c861be970151	https://directus.bmulti.store/assets/10eb21aa-b1e1-4d4c-ad12-23b33d6455c7
1863	2025-09-30 11:38:33.410079+00	472124071	37.27.94.136	t	t	done	200 рублей	OZON	79689130398	https://directus.bmulti.store/assets/88d09c35-f0dc-4d53-9ae5-1593d8c73613	https://directus.bmulti.store/assets/39294e97-e6cb-4fa1-9741-23e544165a93
1873	2025-09-30 20:04:06.421012+00	757802845	152.53.143.142	t	f	done	200 рублей	OZON	79115878026	https://directus.bmulti.store/assets/8b1bd2b6-3857-42a3-ab62-072e389baa56	https://directus.bmulti.store/assets/d054d950-2159-43a9-979e-9b019c4dd433
1888	2025-10-01 15:32:26.063907+00	560721309	95.66.180.98	t	t	done	200 рублей	OZON	79045942534	https://directus.bmulti.store/assets/919806fe-fd92-42af-9085-1d152500374c	https://directus.bmulti.store/assets/6d0091a4-cba8-437e-b89d-c8b6dbbf973c
1844	2025-09-29 12:41:42.922392+00	5289855047	178.45.61.39	t	t	done	200 рублей	WB	79198187175	https://directus.bmulti.store/assets/e3e410bd-c2d7-4340-a1a5-ffdd9130cbbb	https://directus.bmulti.store/assets/f2995ac0-7ac9-4caf-8799-4f99be62760b
1894	2025-10-01 18:12:56.601139+00	331452582	178.204.219.145	t	t	done	200 рублей	OZON	79376193244	https://directus.bmulti.store/assets/c372fd12-468b-4099-8d1b-9e55803041f8	https://directus.bmulti.store/assets/0e21b578-12cb-4382-97ef-1c251740c7e3
1893	2025-10-01 17:55:32.547161+00	5410939819	85.140.1.137	t	t	done	200 рублей	WB	279081592541	https://directus.bmulti.store/assets/b1066174-731d-41e4-aacd-eaeb3d7f04d6	https://directus.bmulti.store/assets/2e761e8f-1a89-4293-ae2d-fcf62ab85036
1891	2025-10-01 17:25:01.897157+00	6302915307	89.23.119.128	t	t	done	500 рублей	OZON	79781204500	https://directus.bmulti.store/assets/fe0cc58c-eb8e-4312-aef6-cef554627716	https://directus.bmulti.store/assets/357d7067-6ce0-46b7-a101-cedbc743eef0
1890	2025-10-01 16:28:13.052328+00	680096568	95.179.120.17	t	t	done	200 рублей	OZON	79009851010	https://directus.bmulti.store/assets/c2b893b7-0403-4218-be26-93e7b701b53d	https://directus.bmulti.store/assets/784fe5a7-c8a2-4505-895d-57568f1dae4e
1889	2025-10-01 16:05:48.56824+00	759622438	78.36.175.166	t	t	done	200 рублей	OZON	79960900920	https://directus.bmulti.store/assets/09f1003e-64fa-4c05-ba3b-fbe08db495eb	https://directus.bmulti.store/assets/c4ca2635-6d39-437b-859f-a6f87009ac83
1880	2025-10-01 09:46:12.709718+00	5717570374	176.119.171.242	t	t	done	200 рублей	OZON	79590364226	https://directus.bmulti.store/assets/603f677d-1a16-4ea9-8611-7cb62b4eb0e3	https://directus.bmulti.store/assets/3ad464b0-2a2d-42f3-9991-d51b3777f447
1876	2025-10-01 05:34:16.27167+00	8024000740	188.162.6.217	t	t	done	200 рублей	OZON	79994750308	https://directus.bmulti.store/assets/e238cefa-08f2-4b00-b0ba-ca154bed8b69	https://directus.bmulti.store/assets/30153425-3190-4f67-a052-a9ae9a3b40a6
1882	2025-10-01 11:35:04.558832+00	6539296181	95.25.194.191	t	t	done	200 рублей	WB	79003615621	https://directus.bmulti.store/assets/f7bff53a-16ad-4d2f-9724-2f7b1c3acc4b	https://directus.bmulti.store/assets/64f3206c-5981-4d8c-92c2-5ce4694081df
1904	2025-10-02 11:52:39.968609+00	1424585357	85.140.6.202	t	t	new	\N	OZON	\N	https://directus.bmulti.store/assets/a53ae49c-973e-4416-9450-bca1892e2b47	https://directus.bmulti.store/assets/1ce9e047-3d23-4589-aa55-9b16e86f3ec3
1896	2025-10-02 00:30:57.143006+00	5022485559	5.141.101.157	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/ddd3b5f4-36bd-4434-a101-9bee979d85a7	https://directus.bmulti.store/assets/d4872008-b78d-45af-a04a-edb721e07760
1905	2025-10-02 11:52:53.795447+00	1424585357	85.140.6.202	f	f	new	\N	OZON	\N	https://directus.bmulti.store/assets/49c61d9e-a798-4e27-af7f-5d3a3ace73cb	https://directus.bmulti.store/assets/a927185d-2b03-4d38-ba48-e4ae637a0133
1901	2025-10-02 09:31:50.975496+00	418673724	94.25.169.242	f	f	check	200 рублей	WB	79038794081	https://directus.bmulti.store/assets/be4e1aa7-8a41-4c9c-bed6-b8252565e4cd	https://directus.bmulti.store/assets/d74d9b31-ec02-452d-9259-ec7c9c5ed839
1902	2025-10-02 09:44:52.892428+00	5128865493	176.59.193.222	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/322d576f-99b2-4717-bc8b-93552bddecd1	https://directus.bmulti.store/assets/e32cf9ab-170b-4777-b785-03d5646d5559
1914	2025-10-02 17:46:44.269979+00	7129672149	5.1.54.203	t	t	check	200 рублей	WB	279642598778	https://directus.bmulti.store/assets/56e02cf7-207a-4c5c-a3ee-e58517ee09da	https://directus.bmulti.store/assets/4183326a-b97e-4f71-a691-f93c0b81c9b8
1903	2025-10-02 11:39:43.778568+00	6322178114	2.61.100.137	t	t	check	200 рублей	OZON	79915028163	https://directus.bmulti.store/assets/ed89aca9-ba24-4785-a781-d408a3cd6523	https://directus.bmulti.store/assets/284b8418-f7d2-45cf-a52f-4735474026f0
1899	2025-10-02 09:20:52.644085+00	433642241	95.71.117.191	f	t	done	200 рублей	WB	79517613688	https://directus.bmulti.store/assets/2e7ae035-ff47-4057-8a31-a4249d53972e	https://directus.bmulti.store/assets/cede02ac-6dfd-4517-8ea2-139e637972d5
1898	2025-10-02 08:50:34.694615+00	633061194	185.75.84.175	t	t	done	200 рублей	OZON	79146910975	https://directus.bmulti.store/assets/3ff99086-1425-40e5-9f8b-6a95965ee065	https://directus.bmulti.store/assets/4cbeacfd-0236-4b8a-930e-8051f0848eb6
1897	2025-10-02 03:35:14.748392+00	868215027	176.15.162.146	t	t	done	200 рублей	OZON	79992007867	https://directus.bmulti.store/assets/b46c07eb-c8d7-41dd-9cc9-5d0fc70e6009	https://directus.bmulti.store/assets/7efc4368-190a-4dd9-ab3d-0cb97dcf917f
1895	2025-10-01 21:06:32.39204+00	464468328	176.212.104.37	t	t	done	200 рублей	OZON	79621474873	https://directus.bmulti.store/assets/94f0256f-92f5-4a5f-8ac9-2fb2624faadd	https://directus.bmulti.store/assets/6de4d701-2cac-43c8-8935-8a7108b03a11
1922	2025-10-03 11:55:58.298052+00	5565542850	151.249.161.108	t	t	check	200 рублей	OZON	375295366982	https://directus.bmulti.store/assets/23afb291-9036-4d02-83ce-32e1855aaea3	https://directus.bmulti.store/assets/b09025e3-a496-412f-a5e2-da5b669bfbd3
1923	2025-10-03 13:48:36.665784+00	6204251137	176.62.66.235	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/eaf9b186-c9ba-4d97-b524-687847872512	https://directus.bmulti.store/assets/47a3feee-97d5-4274-b683-025899882622
1924	2025-10-03 13:58:02.12621+00	772746550	37.214.29.15	t	t	check	200 рублей	OZON	375291349503	https://directus.bmulti.store/assets/11bf2710-a96d-402c-b368-a3096944339f	https://directus.bmulti.store/assets/56e112dd-e745-44d9-a6d1-5891fc00fc3f
1921	2025-10-03 10:27:23.543771+00	5298268446	95.72.67.53	t	t	done	200 рублей	OZON	79263577448	https://directus.bmulti.store/assets/daa22daf-8ca0-4835-8b1c-bdb607353f5d	https://directus.bmulti.store/assets/d8731191-ab3c-4441-bd60-c2528f9745e1
1920	2025-10-03 09:39:34.522997+00	1842763878	85.174.182.228	t	t	done	200 рублей	OZON	79887561961	https://directus.bmulti.store/assets/d48101ed-15ff-48ed-9ef8-16cbe27eefcb	https://directus.bmulti.store/assets/8872f111-f5b7-44e6-93d9-63e143f94d0f
1919	2025-10-03 09:08:59.970623+00	5593517756	178.57.69.43	t	t	done	200 рублей	WB	79250997882	https://directus.bmulti.store/assets/145bfebe-6399-4bd8-af90-dad1009c6e5e	https://directus.bmulti.store/assets/d3f0f7c8-770e-4abd-af6d-e52e9744f203
1918	2025-10-03 08:51:53.089372+00	1031579765	87.117.56.17	t	t	done	200 рублей	WB	79966100282	https://directus.bmulti.store/assets/6f28c35b-5380-494e-9739-09d50b31e49e	https://directus.bmulti.store/assets/4984dc3b-25d3-4365-99aa-3eda73c8f7cc
1916	2025-10-03 01:38:57.993517+00	2143014434	80.67.220.71	t	t	done	200 рублей	OZON	79131618524	https://directus.bmulti.store/assets/feab82eb-ae2e-4124-911d-c6575d207830	https://directus.bmulti.store/assets/aa5c17fe-f8c9-44ec-9102-51013891145f
1915	2025-10-02 19:07:45.521859+00	920296988	85.174.198.188	t	t	done	200 рублей	WB	79184952277	https://directus.bmulti.store/assets/9d9e7b87-891e-4764-8370-bcc4ab3aafc8	https://directus.bmulti.store/assets/51fbd6ad-661c-4444-b55a-43f54f80e5d8
1912	2025-10-02 17:36:19.393308+00	424629318	176.52.54.85	t	t	done	200 рублей	OZON	79378546444	https://directus.bmulti.store/assets/583c857b-9f4c-4a4f-9691-e715ec5fd4d7	https://directus.bmulti.store/assets/bacdb2db-62b0-441e-8722-24dcbb8af21a
1910	2025-10-02 15:07:38.03084+00	907920826	176.59.8.191	t	t	done	200 рублей	WB	79535465722	https://directus.bmulti.store/assets/ccf1b8ec-7505-44d2-9c6f-f8b28e31e02b	https://directus.bmulti.store/assets/3b5958a8-e051-4156-a539-6eab07b009f7
1911	2025-10-02 16:56:34.954132+00	1622012098	128.71.50.252	t	t	done	200 рублей	WB	79651451645	https://directus.bmulti.store/assets/e7f92b05-2215-473a-877b-50b52672641f	https://directus.bmulti.store/assets/d36fe981-35c4-4447-bc00-b0438fd28ea5
1909	2025-10-02 14:39:05.824594+00	5271210050	185.54.239.167	t	t	done	200 рублей	OZON	79829329045	https://directus.bmulti.store/assets/a506bcd6-5b89-47c9-b4e0-59fab9f76076	https://directus.bmulti.store/assets/bdf4affc-4215-4b0a-9e90-f848640f0a0e
1908	2025-10-02 14:11:17.373663+00	1094057641	95.104.196.193	t	t	done	200 рублей	WB	79033366644	https://directus.bmulti.store/assets/3a287491-eb27-4528-a8ea-f6dd4464c940	https://directus.bmulti.store/assets/750b6805-3a0d-4a67-9409-70d027c193c8
1907	2025-10-02 13:51:45.194853+00	5713001453	46.148.254.18	t	f	done	200 рублей	OZON	79049640868	https://directus.bmulti.store/assets/86833782-d469-4f60-baa6-15507ebf6442	https://directus.bmulti.store/assets/4526360d-f742-47e4-aec4-4703e72ad540
1906	2025-10-02 13:06:10.435742+00	871905289	185.82.199.93	t	t	done	200 рублей	OZON	279230184379	https://directus.bmulti.store/assets/dd248fcb-cb4c-45f2-b126-37b7b9ecb01a	https://directus.bmulti.store/assets/4b6ba269-82ef-484a-acd3-94a37b785ba9
1917	2025-10-03 04:50:03.427139+00	7095941625	91.239.130.194	t	t	done	200 рублей	WB	79991236923	https://directus.bmulti.store/assets/690ad578-e568-44b4-8523-3ee97b3ba943	https://directus.bmulti.store/assets/b7c513a1-2694-4b42-b346-39a5a520f6b3
1913	2025-10-02 17:37:13.798351+00	1044704992	94.181.204.186	t	t	done	200 рублей	OZON	79229078902	https://directus.bmulti.store/assets/029a77f9-04b8-4bcb-a8fc-b8362b545e5e	https://directus.bmulti.store/assets/ceab28c3-658f-439e-bc4e-9b20258617c1
1926	2025-10-03 14:47:08.2831+00	932563110	83.143.119.130	t	t	check	200 рублей	OZON	79969369880	https://directus.bmulti.store/assets/44c4097e-23dd-46a6-840b-896b45f5c162	https://directus.bmulti.store/assets/e5314213-e6bb-45bc-9d81-4df3b78979f0
1927	2025-10-03 15:32:41.690153+00	1284329978	77.40.62.211	t	t	check	200 рублей	OZON	79648641277	https://directus.bmulti.store/assets/9b2ef1e9-21c1-41a6-b63b-3a8057564fa8	https://directus.bmulti.store/assets/64be7b6d-020d-49c8-8e76-6a66b8fc95c3
1925	2025-10-03 14:06:01.863677+00	7286288532	178.176.166.142	t	t	done	500 рублей	OZON	79393115845	https://directus.bmulti.store/assets/25d7282a-5f57-408a-99d6-41652cb14de0	https://directus.bmulti.store/assets/56e93144-8226-4b19-848c-6387bafc82dc
1929	2025-10-03 16:05:43.975799+00	1374432450	84.53.229.63	t	t	check	1000 рублей	OZON	79049575470	https://directus.bmulti.store/assets/07623aea-60bb-4138-9bb4-28a81bb95b37	https://directus.bmulti.store/assets/ab1b2194-b0f4-49e4-baf7-a6a26b79395d
1932	2025-10-03 19:18:04.894739+00	935256614	213.87.131.50	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/045403af-464b-476e-88d7-22d01e9ea070	https://directus.bmulti.store/assets/6945a510-b64d-40cb-b206-af0f992e7caa
1935	2025-10-04 04:26:47.979919+00	5624045905	85.208.222.216	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/7ce374ec-7880-4468-9fac-b33d30ebc9cd	https://directus.bmulti.store/assets/25dbaafd-c816-4c92-a07f-6001f2c72480
1941	2025-10-04 09:45:12.486366+00	5103349068	84.42.76.222	t	t	check	200 рублей	WB	79208434336	https://directus.bmulti.store/assets/0d3427c0-a66b-4604-a095-d9dec086733b	https://directus.bmulti.store/assets/fe9e7643-6d8e-4b8a-8b48-ff45b685363a
1944	2025-10-04 10:06:25.645032+00	518896286	178.209.93.47	t	t	check	200 рублей	OZON	79494299690	https://directus.bmulti.store/assets/4f96a25a-a6e8-4af0-a9f9-f59e1ef89cce	https://directus.bmulti.store/assets/56305dec-aa0b-4571-abf3-233b18819872
1946	2025-10-04 10:52:39.712958+00	6559709450	217.107.115.205	t	t	in_work	300 рублей	OZON	\N	https://directus.bmulti.store/assets/95df2450-33d7-4d2e-83c8-97be1f8a5098	https://directus.bmulti.store/assets/5ba05c3f-173e-4619-b58e-e02518021649
1947	2025-10-04 11:18:02.972335+00	5272133656	176.15.142.61	t	t	check	200 рублей	OZON	79531776928	https://directus.bmulti.store/assets/d94ac6d1-683f-4a74-bac4-68691f2d492c	https://directus.bmulti.store/assets/57665859-0a7a-4820-87a2-eaf599302f73
1939	2025-10-04 07:26:12.446624+00	1493218123	81.162.110.22	f	t	done	200 рублей	OZON	79788426229	https://directus.bmulti.store/assets/22a7e1a7-7fd8-4568-aca3-fe851936bfdc	https://directus.bmulti.store/assets/f54097c9-2991-42b6-b5e7-039403f06e8c
1949	2025-10-04 12:54:50.783198+00	5169196254	170.168.22.104	t	f	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/8de48ce6-d726-4265-a330-dd80e22556df	https://directus.bmulti.store/assets/73ad448a-e9e6-4e03-84ae-770a3c40e065
1953	2025-10-04 15:29:02.019508+00	1438001998	91.79.224.228	t	t	done	200 рублей	OZON	79507875937	https://directus.bmulti.store/assets/1e1e348e-729c-4fb2-859c-a87613b22125	https://directus.bmulti.store/assets/60d75e2e-c061-43c1-a2d1-2050d0629eac
1952	2025-10-04 14:38:11.074409+00	1297326299	46.191.233.111	t	t	done	200 рублей	WB	79961052572	https://directus.bmulti.store/assets/3e3e223c-7dec-49ca-989e-e8b0915b460f	https://directus.bmulti.store/assets/ab12818f-c17d-4204-acda-1cab83e2d820
1951	2025-10-04 13:56:42.79374+00	812178253	95.24.97.164	t	t	done	200 рублей	OZON	79264022295	https://directus.bmulti.store/assets/49037de3-ca52-4717-bc3e-188f73475431	https://directus.bmulti.store/assets/97359725-4053-4cec-a56c-98c8d21069ad
1948	2025-10-04 12:44:59.250562+00	617420531	185.253.40.165	t	t	done	200 рублей	OZON	79831986131	https://directus.bmulti.store/assets/c3f0b891-c895-4d2e-9e47-feb5381b1ffd	https://directus.bmulti.store/assets/4b13f506-e726-447a-962a-f16786597c48
1945	2025-10-04 10:12:43.459835+00	5152856883	95.26.229.141	t	t	done	200 рублей	OZON	79134148839	https://directus.bmulti.store/assets/5f17ff62-3950-495f-acc1-2f8e0efd75d4	https://directus.bmulti.store/assets/1a89ea9b-9213-4379-a28b-f65a5bf7dd9f
1943	2025-10-04 10:01:19.183042+00	317053589	95.26.249.10	t	t	done	200 рублей	OZON	79063185612	https://directus.bmulti.store/assets/adfa04d0-5459-4803-8bb4-5f9a784c2a61	https://directus.bmulti.store/assets/06cc6d88-a746-49bb-a16b-46b9cb0c6f17
1940	2025-10-04 08:30:06.705656+00	1292308405	5.166.78.109	t	t	done	200 рублей	OZON	79235634329	https://directus.bmulti.store/assets/e0b71cb8-9dfc-4ddc-bc1e-00d1a539052c	https://directus.bmulti.store/assets/45dc65c3-7ab9-4afb-aa65-3bdfc7be0a0e
1938	2025-10-04 06:41:02.511717+00	949076325	178.46.108.103	t	t	done	200 рублей	OZON	279920104928	https://directus.bmulti.store/assets/1815a935-e6c4-46aa-8378-45b1090c8994	https://directus.bmulti.store/assets/2afe3845-62a8-453e-8538-cf15047c3df2
1937	2025-10-04 06:33:57.608894+00	259315649	82.147.79.120	t	t	done	200 рублей	OZON	79123899999	https://directus.bmulti.store/assets/196eb9a2-ad51-44fa-81ed-cf9a47c2b9f3	https://directus.bmulti.store/assets/e816a01e-cee0-4494-a24f-0b3e1065978b
1936	2025-10-04 04:50:36.259736+00	518709311	31.185.11.179	t	t	done	200 рублей	WB	79094029099	https://directus.bmulti.store/assets/d60db8a8-366d-4539-b4ff-80ac8d86611c	https://directus.bmulti.store/assets/a89b470c-7778-456c-8786-1f8c745d3f2f
1934	2025-10-04 02:22:58.925956+00	6862864843	178.206.183.170	t	t	done	500 рублей	OZON	79874216065	https://directus.bmulti.store/assets/7312f6f3-bbfa-40b9-9a85-7db66cf9d61e	https://directus.bmulti.store/assets/27d154c5-c3e2-4817-a30f-a16cb649cf3a
1933	2025-10-03 19:29:36.66956+00	1164948573	31.181.92.66	t	t	done	200 рублей	WB	79282734010	https://directus.bmulti.store/assets/cf6b0e13-6a11-453e-9749-213a072e65f1	https://directus.bmulti.store/assets/1876dab9-1972-49db-b1c6-89e6c4deae9b
1931	2025-10-03 18:23:00.371531+00	1306528556	37.112.219.242	t	t	done	200 рублей	OZON	79276197774	https://directus.bmulti.store/assets/6972a09d-a629-4f39-895d-f3ffdb9d2d65	https://directus.bmulti.store/assets/55c7a76e-4759-44b7-b9f4-af99f3336da3
1930	2025-10-03 17:53:59.852626+00	7509594846	92.36.25.195	t	t	done	200 рублей	OZON	279998008747	https://directus.bmulti.store/assets/bd0b5a3d-7a45-4dc7-a0b7-e1ec414f02dd	https://directus.bmulti.store/assets/c4568c09-1eb9-4dfd-9d10-692b979bf9b6
1928	2025-10-03 15:47:13.941053+00	5117208348	185.2.104.112	t	t	done	200 рублей	WB	79655436302	https://directus.bmulti.store/assets/f36ba2f6-09c3-4099-8a8f-935e7aa732f3	https://directus.bmulti.store/assets/b7239070-fb9e-4da8-93e6-68e754557aa6
1950	2025-10-04 13:37:59.404252+00	825915400	37.113.166.178	t	t	done	200 рублей	OZON	79823586400	https://directus.bmulti.store/assets/25f6edef-fd6f-40cc-b64f-8907fd2f1a21	https://directus.bmulti.store/assets/15b31a7c-3826-48e7-a39e-1b8a8c864c2c
1942	2025-10-04 09:56:45.801041+00	701150322	95.24.99.155	t	t	done	200 рублей	WB	79264036961	https://directus.bmulti.store/assets/c2a904a7-15c1-4192-87c1-1ccb2e4100fe	https://directus.bmulti.store/assets/52a498f8-597a-41b3-95bd-3199262f415f
1954	2025-10-04 15:45:27.434636+00	1332787679	46.151.46.210	t	t	check	200 рублей	OZON	79591827087	https://directus.bmulti.store/assets/b8414ca8-6903-4167-bee3-e19b77198b17	https://directus.bmulti.store/assets/97dad92d-f560-4f5d-8074-26a4bcb32f77
1964	2025-10-05 10:05:59.158466+00	1642694198	176.59.143.40	t	t	done	200 рублей	OZON	79804431083	https://directus.bmulti.store/assets/e59fdeb3-f52f-4ac1-8d4e-bcdf17756f15	https://directus.bmulti.store/assets/5e45419d-7ffa-48aa-b9a6-38d5ace1c9de
1955	2025-10-04 15:46:55.069768+00	628593135	188.170.205.140	t	t	check	200 рублей	WB	79284730249	https://directus.bmulti.store/assets/e343559b-112b-43d0-84a5-47bf44de64ae	https://directus.bmulti.store/assets/b501509b-7526-46f2-9558-582bfaeb14d8
1956	2025-10-04 15:50:05.967519+00	945664110	178.155.28.39	t	f	check	200 рублей	WB	79186607770	https://directus.bmulti.store/assets/fe025cde-9ebc-4928-bc21-cba1154fc869	https://directus.bmulti.store/assets/8e1fcfdc-6e0b-44f7-b927-077155851d15
1835	2025-09-28 17:00:28.278768+00	7752597396	178.178.244.192	t	t	done	200 рублей	OZON	79213834219	https://directus.bmulti.store/assets/7ef671f9-2f26-4e14-bcee-c5dc7d54a7a1	https://directus.bmulti.store/assets/b6fb5452-745c-4ffc-8e14-60a251a920f1
1968	2025-10-05 11:43:03.014417+00	1353138423	128.71.225.236	t	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/5764ace0-9b3f-4f42-966f-968183c217c6	https://directus.bmulti.store/assets/12c9fbc9-8dda-4b09-a289-58b00cbfbb2e
1975	2025-10-05 14:34:21.367055+00	2031870066	178.157.157.95	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/d6de1700-b8de-4787-bd44-06b42647a7c3	https://directus.bmulti.store/assets/8b7828e6-f1e0-4ef1-9798-b6156c0c9dcc
1973	2025-10-05 14:13:36.515154+00	8381456546	94.158.42.184	t	t	check	200 рублей	OZON	79592754908	https://directus.bmulti.store/assets/466a9330-c0b1-46ac-85ed-6dac080c8120	https://directus.bmulti.store/assets/229e1dff-801e-442f-93b6-514d184ca436
1971	2025-10-05 13:42:57.01807+00	6848919683	176.59.111.58	f	t	check	200 рублей	WB	79968056597	https://directus.bmulti.store/assets/c77ebe5b-01e0-4601-abe8-512a03b2f28f	https://directus.bmulti.store/assets/17e7074b-6bb8-4572-8bce-edea9554f5bd
1981	2025-10-05 18:42:59.711732+00	524773713	213.88.31.174	t	t	done	200 рублей	WB	79376010802	https://directus.bmulti.store/assets/b040de50-226c-45c6-8828-fc0e8434909a	https://directus.bmulti.store/assets/c9767928-2c61-43b3-883f-8f257f5a2ec9
1980	2025-10-05 18:30:05.277839+00	1203132544	93.170.96.199	t	t	done	300 рублей	OZON	79786470233	https://directus.bmulti.store/assets/00807f70-a904-4fb8-add1-3379980a073a	https://directus.bmulti.store/assets/8ea71236-6fb1-4e2e-a220-12f2a7b175df
1978	2025-10-05 17:02:19.563854+00	1469998643	95.26.87.160	t	t	done	200 рублей	OZON	79274820188	https://directus.bmulti.store/assets/b4478c15-ad46-48e6-9205-c5cfd07834f7	https://directus.bmulti.store/assets/9c66c5f4-884f-442b-9598-14e44cb565c1
1977	2025-10-05 15:45:51.885313+00	1680656659	178.214.250.105	t	t	done	300 рублей	OZON	79174319871	https://directus.bmulti.store/assets/611c80cf-3008-44e5-b343-c7c1626b3cb6	https://directus.bmulti.store/assets/8bb40c8a-e411-4d21-aae1-c5076f563579
1976	2025-10-05 15:01:35.299752+00	310927913	195.191.19.156	t	t	done	200 рублей	OZON	79991344157	https://directus.bmulti.store/assets/30a5ab2a-14c7-485e-b1ce-5ff164778d3c	https://directus.bmulti.store/assets/eaf5cbeb-3675-4ae1-9b14-a19ff14371fe
1972	2025-10-05 13:54:55.040103+00	464016171	178.155.5.222	t	t	done	2000 рублей	OZON	79185529858	https://directus.bmulti.store/assets/9bb2d433-2af7-4eff-a462-d76d2b66591b	https://directus.bmulti.store/assets/6d04faa0-a6b6-4bbe-84cb-c02933e4a1ae
1970	2025-10-05 12:49:09.456932+00	1472674702	45.131.49.104	t	t	done	200 рублей	OZON	79194303013	https://directus.bmulti.store/assets/d3ca2364-e27f-4220-8bd0-486c8d906368	https://directus.bmulti.store/assets/e5b6cce5-03ff-44d7-8a7c-1b058e095556
1969	2025-10-05 11:46:23.888483+00	633091466	146.158.111.213	t	t	done	200 рублей	OZON	79030725882	https://directus.bmulti.store/assets/eebaec4b-9378-4c27-ac06-e40927b66243	https://directus.bmulti.store/assets/9ca2aebc-0085-4790-9a24-378b2642118d
1967	2025-10-05 11:07:45.039074+00	414531429	94.19.63.244	t	t	done	200 рублей	OZON	79817250254	https://directus.bmulti.store/assets/ea1913bd-7d22-4c95-8784-559f621d7fe9	https://directus.bmulti.store/assets/daf41800-a2a1-489b-a5b2-955e2dfaac93
1966	2025-10-05 10:49:28.370247+00	1259784553	217.168.244.16	t	t	done	200 рублей	OZON	79303428422	https://directus.bmulti.store/assets/94a7a25c-351d-4af6-bde8-ca173c3c41f7	https://directus.bmulti.store/assets/20cd28f6-9061-4f51-bf9e-71b26db9acfb
1965	2025-10-05 10:24:05.43705+00	6902524004	91.224.166.23	t	t	done	200 рублей	OZON	79832731184	https://directus.bmulti.store/assets/37e59abf-d1b7-45a5-b751-2e684d9d038f	https://directus.bmulti.store/assets/56057450-9677-46ae-8668-2a9aaf4f4c6a
1963	2025-10-05 09:41:06.748052+00	538270776	152.53.64.56	t	t	done	200 рублей	OZON	79615344999	https://directus.bmulti.store/assets/dc22116a-7bbc-4628-b444-673b1cb0743f	https://directus.bmulti.store/assets/73cc43fa-b3b3-4bbb-b607-768ee829234b
1961	2025-10-05 08:25:42.490173+00	304600814	212.3.150.76	t	t	done	200 рублей	WB	79203106939	https://directus.bmulti.store/assets/aa0aa725-1c0a-4850-903e-af7548acadb7	https://directus.bmulti.store/assets/2f05d6e6-ffdf-4a2b-80e5-dc6fa1f3e7a0
1960	2025-10-05 06:48:27.10729+00	5226677408	178.157.146.161	t	t	done	200 рублей	OZON	279816987666	https://directus.bmulti.store/assets/c1319726-7bfd-45bd-a058-d616a2abac1d	https://directus.bmulti.store/assets/f4c35ca7-738e-4522-82b3-800ff482f68e
1958	2025-10-04 18:52:39.982102+00	6299392449	5.18.240.94	t	t	done	200 рублей	OZON	79643880847	https://directus.bmulti.store/assets/49977f0f-248b-4e6d-b4aa-ea0d86806a12	https://directus.bmulti.store/assets/99dfb685-c66d-4f20-a547-8a6f7b700a06
1957	2025-10-04 17:30:18.771883+00	6457098272	79.139.222.228	t	t	done	200 рублей	OZON	79099799666	https://directus.bmulti.store/assets/9ad15c2d-8db5-4ca4-9ded-f938bae9006c	https://directus.bmulti.store/assets/053e16ca-640b-42e7-bfa4-7ace647e0ef8
1962	2025-10-05 09:14:22.011687+00	1408505774	94.25.234.182	t	t	done	200 рублей	WB	79965697059	https://directus.bmulti.store/assets/715d5916-c445-47cc-8dec-776af985eaf6	https://directus.bmulti.store/assets/ccee99ea-b1ff-4216-907f-f3b764515bc1
1974	2025-10-05 14:25:45.789647+00	8190038975	94.158.42.184	f	f	done	200 рублей	OZON	79592754908	https://directus.bmulti.store/assets/46c474ac-3f28-4175-86b5-099356f01dd7	https://directus.bmulti.store/assets/0eb59748-8199-44f3-9a15-d14d19ff7bda
1959	2025-10-04 19:51:24.002418+00	6308904372	92.36.20.136	t	f	done	200 рублей	OZON	79915615528	https://directus.bmulti.store/assets/cbce73e8-455d-49ac-9a54-db6620130f01	https://directus.bmulti.store/assets/078e6157-5ae9-4301-965e-d8669cd04146
1979	2025-10-05 17:18:33.362416+00	262268269	46.191.225.46	f	t	done	200 рублей	WB	79872369082	https://directus.bmulti.store/assets/36a64d48-b460-4fef-aebe-7578cb090e49	https://directus.bmulti.store/assets/0083fd36-3d6c-4a7b-82fc-ecac34bfd2ea
1986	2025-10-06 08:33:18.536072+00	893802029	217.66.157.41	t	t	done	200 рублей	WB	79176235755	https://directus.bmulti.store/assets/471e7092-8883-475b-96c2-d3b962eebd7e	https://directus.bmulti.store/assets/8802c1d1-28fa-4c33-80c8-b157e36fbcc7
1989	2025-10-06 15:40:13.132127+00	1193764431	37.232.223.124	t	t	done	200 рублей	OZON	289530141050	https://directus.bmulti.store/assets/ac0f324a-7652-4ab8-becb-a7ff10cff6dd	https://directus.bmulti.store/assets/ced372e1-9ccb-4e34-a19f-594ed82af1e7
1983	2025-10-05 19:27:47.124888+00	7550685115	95.141.37.42	t	t	check	200 рублей	WB	79253144424	https://directus.bmulti.store/assets/1d4dd191-0ee0-494f-9e0d-373619958c96	https://directus.bmulti.store/assets/509bbb5e-94c2-486d-b02f-de04421c6b25
1984	2025-10-06 04:59:45.250096+00	1537274568	95.24.24.109	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/627b6fbe-cfe7-43a9-bf0a-4249dec8a2a9	https://directus.bmulti.store/assets/fdfaa5c8-302e-4196-95b7-278cde94922e
1985	2025-10-06 05:16:41.775468+00	1308659142	37.252.11.108	f	f	check	200 рублей	OZON	79964639402	https://directus.bmulti.store/assets/2a0d698c-31de-4609-bd9c-e35c26d048a7	https://directus.bmulti.store/assets/1dcbc004-3ca9-40a0-b909-65ee7326d03c
1987	2025-10-06 08:37:21.467671+00	7586631658	178.184.175.101	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/7f0d1f2d-6e1d-4664-918b-acee3230e7f5	https://directus.bmulti.store/assets/9b27aace-a25e-44a3-8e9f-8023d25dfc67
1991	2025-10-06 16:48:43.110879+00	1442620728	176.113.246.45	t	t	check	200 рублей	OZON	79591478311	https://directus.bmulti.store/assets/7aeb6a24-2e13-40ee-b3aa-40d0dfb4b214	https://directus.bmulti.store/assets/6e8a1894-6016-4b08-a698-a3065707856c
1993	2025-10-06 18:54:53.448923+00	\N	188.187.180.27	f	f	new	\N	\N	\N	https://directus.bmulti.store/assets/undefined	https://directus.bmulti.store/assets/undefined
1982	2025-10-05 19:06:05.837056+00	5238016509	91.237.200.8	t	t	done	200 рублей	WB	79290417984	https://directus.bmulti.store/assets/799e3f89-0fd2-42da-b4ff-e10bc5eeb97e	https://directus.bmulti.store/assets/e0a18f51-ea71-4fb9-8855-1dcb247a51b0
2000	2025-10-07 06:52:44.65201+00	5242355169	185.78.239.122	t	t	check	200 рублей	OZON	79783468110	https://directus.bmulti.store/assets/b9d1f576-0f20-4223-a44f-0cd660b92fb5	https://directus.bmulti.store/assets/7c363adf-90cf-4dea-a42c-6063f5f6ed93
2006	2025-10-07 14:53:57.425956+00	740041701	188.232.240.41	t	t	check	200 рублей	OZON	79230398654	https://directus.bmulti.store/assets/6f7b11f2-4eab-41c8-83ae-9a0978a8bd6d	https://directus.bmulti.store/assets/86d358bc-f970-4016-9153-cbee84198710
1994	2025-10-07 01:23:51.250676+00	5296089384	91.79.219.246	t	t	done	200 рублей	WB	79873087070	https://directus.bmulti.store/assets/0f944453-5171-4c83-a4b0-a92a3f93bb3f	https://directus.bmulti.store/assets/e86b836d-f530-4b93-8bd7-640753117f24
1998	2025-10-07 06:42:46.349214+00	1189905851	92.37.142.223	t	t	done	200 рублей	WB	79004233999	https://directus.bmulti.store/assets/0cd3de2f-0ee5-4eab-a9b9-fb89d66d7202	https://directus.bmulti.store/assets/89fe2068-ce2d-4e42-80a8-80fa1174d5f8
1997	2025-10-07 06:13:52.429578+00	464468328	176.212.104.37	t	f	done	200 рублей	OZON	79992207613	https://directus.bmulti.store/assets/4cd9fcf9-a65e-477b-9eee-7e7fe1567c35	https://directus.bmulti.store/assets/ed74f30a-c69b-489e-9c9b-73b4d40ed8bd
1996	2025-10-07 05:26:27.392745+00	1991418684	185.15.38.7	t	t	done	200 рублей	WB	79786710894	https://directus.bmulti.store/assets/25abcf52-a1cb-45f0-a785-14885950eb68	https://directus.bmulti.store/assets/ffe8da4c-0470-44f9-b799-afaff55801e5
1995	2025-10-07 04:22:52.607611+00	1733263517	46.29.234.157	t	t	done	200 рублей	OZON	79994418517	https://directus.bmulti.store/assets/17c8d751-6b41-47dd-bdbc-47718a6376ad	https://directus.bmulti.store/assets/1226123f-dea7-46b2-92e4-4c7396b34b31
1992	2025-10-06 18:54:40.278969+00	5781418870	188.187.180.27	t	t	done	200 рублей	WB	79027353660	https://directus.bmulti.store/assets/724bdc3a-eb71-45a4-bf75-ee0b63322858	https://directus.bmulti.store/assets/d4393c8d-9c09-4be7-b397-93dffee52950
1990	2025-10-06 16:47:37.834566+00	401998923	37.122.5.250	t	t	done	200 рублей	OZON	79279637004	https://directus.bmulti.store/assets/877d9a40-f303-4f61-a4bc-1b016b45e099	https://directus.bmulti.store/assets/900faee1-f92e-47b8-9f2b-8b8220feb29c
1988	2025-10-06 12:18:36.008809+00	6045672332	31.186.159.204	t	t	done	200 рублей	WB	79133631515	https://directus.bmulti.store/assets/d380d456-4e6f-4c67-86e5-90448b1532c5	https://directus.bmulti.store/assets/1e8e9e7d-2d95-4e94-8e49-adc3b56b8621
2001	2025-10-07 10:00:22.303343+00	1156326550	109.254.21.77	t	t	done	200 рублей	OZON	79494294530	https://directus.bmulti.store/assets/cbf86025-7530-413d-8220-00a5cdf10282	https://directus.bmulti.store/assets/5ef51a4f-445a-4b1d-ac1d-f1b781da9573
1999	2025-10-07 06:42:47.534042+00	6305798626	77.120.56.208	t	t	done	200 рублей	WB	79787340697	https://directus.bmulti.store/assets/63a0ca2d-ad05-4bee-ad2b-92dca7640322	https://directus.bmulti.store/assets/9f35120f-33ae-48ec-a737-9e61168be697
2010	2025-10-07 17:46:00.593274+00	5164278902	31.28.245.210	t	t	done	200 рублей	WB	79788625510	https://directus.bmulti.store/assets/d659d68d-2f2c-4a1a-83fa-2d1075dff871	https://directus.bmulti.store/assets/12d3cac1-bbae-4fe5-ba3a-cfdb256425ae
2009	2025-10-07 17:41:37.158691+00	1591056727	5.35.113.114	t	t	done	1000 рублей	OZON	79955059507	https://directus.bmulti.store/assets/1a4ff188-1bd7-4e2e-9efd-bab76eabb1a8	https://directus.bmulti.store/assets/6e989536-ab93-4e37-9a29-7c61f01d31d0
2008	2025-10-07 16:26:23.611414+00	5118917445	94.180.226.224	t	t	done	200 рублей	OZON	79272480270	https://directus.bmulti.store/assets/30f63a41-e29c-4539-81e0-8e911a95be01	https://directus.bmulti.store/assets/8fa1f4fb-d033-4a28-8105-73da29d036d8
2002	2025-10-07 11:06:48.673411+00	180832958	164.138.90.227	t	t	done	200 рублей	OZON	79241031989	https://directus.bmulti.store/assets/4c70ead1-b1dc-482b-9922-6d12d4735d81	https://directus.bmulti.store/assets/a8ada496-77d3-4208-8ed3-b768e62ede18
2004	2025-10-07 11:20:09.94875+00	1715657678	81.222.184.107	t	t	done	200 рублей	OZON	79655473157	https://directus.bmulti.store/assets/4e98e7b8-b790-4538-bf3f-4e1e4cd1ef6c	https://directus.bmulti.store/assets/3d7d0481-14fd-4932-99af-409be43c8c09
2005	2025-10-07 14:23:46.44701+00	867069454	176.59.71.130	t	t	done	200 рублей	OZON	79518371538	https://directus.bmulti.store/assets/2deb534c-1c92-44db-befe-8d0ceeb35ea3	https://directus.bmulti.store/assets/9bed5c06-1d52-48b8-ae11-53ee20850c0c
2003	2025-10-07 11:10:19.820615+00	5633722289	109.163.218.84	t	t	done	200 рублей	OZON	279245404407	https://directus.bmulti.store/assets/98a45fc5-4e13-4f2f-8c23-4f97664ed9ee	https://directus.bmulti.store/assets/571a4d2c-730e-4627-a319-f9b5842da0a8
2007	2025-10-07 15:00:51.501142+00	7723619751	176.59.107.215	t	t	done	200 рублей	WB	\N	https://directus.bmulti.store/assets/f08b7ecd-80d8-4511-b12f-0fbbcb6f5af2	https://directus.bmulti.store/assets/87dbdb5f-5a1c-4b37-80f8-ffad1b70bdd5
2019	2025-10-08 09:24:38.431369+00	7613319908	176.59.45.126	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/96b69c62-d313-491d-afcb-d676c79724e3	https://directus.bmulti.store/assets/78527c1e-0815-46d7-a86e-3c4c87a7eac2
2013	2025-10-07 20:54:44.912059+00	8088357220	176.59.198.164	t	f	check	200 рублей	OZON	79527241816	https://directus.bmulti.store/assets/3e034aaa-619d-4d51-882b-bc6b930562f9	https://directus.bmulti.store/assets/c71a508e-ae7c-40e1-93b2-74cfba4fd2f8
2016	2025-10-08 06:14:00.912724+00	2081710584	188.168.232.122	t	t	check	200 рублей	WB	79648487337	https://directus.bmulti.store/assets/447ce86d-6552-45f4-9c6a-c9e00d319865	https://directus.bmulti.store/assets/e5f11bd9-6af2-43d4-8737-2cf5d02da13d
2092	2025-10-11 21:33:35.587687+00	6965143609	46.8.63.224	t	f	done	200 рублей	OZON	79207241078	https://directus.bmulti.store/assets/674b5fd0-b980-445a-ad60-9f335b9fc10c	https://directus.bmulti.store/assets/1a4fdaa5-55f4-4e78-8612-f607de8403ed
2021	2025-10-08 11:31:46.938427+00	393857902	128.204.71.97	t	t	new	\N	WB	\N	https://directus.bmulti.store/assets/7129bf58-e30c-46d8-becf-8d249c6e0579	https://directus.bmulti.store/assets/42a74f9c-ad91-4550-a9a9-9a6318e4b6ee
2022	2025-10-08 11:31:54.758715+00	393857902	128.204.71.97	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/59f0b6be-f80b-49cc-802a-a33f1d27cf81	https://directus.bmulti.store/assets/53fd02e6-e465-4da6-9c07-900c71b3907b
2023	2025-10-08 11:31:57.173149+00	393857902	128.204.71.97	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/fcefd3e3-77a8-4c3c-9587-2e9a1176e6eb	https://directus.bmulti.store/assets/9db54186-b329-4e41-801b-2ff17add3484
2024	2025-10-08 11:32:48.749471+00	393857902	128.204.71.97	f	t	new	\N	WB	\N	https://directus.bmulti.store/assets/cbe9c05c-2cca-4ef8-b9b0-ae77ed24931f	https://directus.bmulti.store/assets/d4b58a1c-48d2-489a-93e2-b6f9242a4d6e
2025	2025-10-08 11:32:51.733561+00	393857902	128.204.71.97	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/0fa9888a-80c7-45bb-b1e0-efd9145b1b86	https://directus.bmulti.store/assets/ed32bc07-abf0-4317-ad80-3aee8d7c58c4
2030	2025-10-08 13:13:06.534433+00	5186522165	176.116.178.61	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/065675da-d037-424d-a2b2-29583b5e1b63	https://directus.bmulti.store/assets/e1ee5c01-e320-4009-8e99-944dc7ef1812
2026	2025-10-08 11:35:03.529851+00	393857902	128.204.71.97	f	f	check	500 рублей	OZON	79991311250	https://directus.bmulti.store/assets/eaf5a239-fd69-49a8-a114-2c257eb4696c	https://directus.bmulti.store/assets/6868f48e-a278-4340-a9ed-16d3540c8863
2029	2025-10-08 12:45:33.805993+00	1061764885	37.21.197.22	t	t	check	200 рублей	WB	279521544779	https://directus.bmulti.store/assets/58025029-b75e-4d9a-9508-33471f69a437	https://directus.bmulti.store/assets/b5a624f9-ee6e-4849-8eec-4f483aadd912
2031	2025-10-08 13:25:44.24991+00	1453007019	89.109.51.113	t	t	check	200 рублей	WB	279030604085	https://directus.bmulti.store/assets/e9422011-e55a-43e1-8e9c-8552a15aabbe	https://directus.bmulti.store/assets/626d6d8a-ac46-471c-9de2-2f76ae17eb61
2033	2025-10-08 14:15:26.151226+00	1631607025	31.170.38.222	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/a948de8d-4081-4cf4-8aca-de53d9c356f3	https://directus.bmulti.store/assets/207b0ddb-66aa-4ffa-8709-af999e81be08
2035	2025-10-08 14:35:29.674004+00	1150295901	176.210.46.170	t	t	check	200 рублей	OZON	79131456694	https://directus.bmulti.store/assets/e0c7270c-2432-4158-a311-03dca6d32379	https://directus.bmulti.store/assets/06144252-f207-4de1-965d-b7e00a975e66
2038	2025-10-08 16:13:31.152703+00	2027866563	176.59.114.189	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/7d772d79-fdff-4f5b-b0fb-5434ee698380	https://directus.bmulti.store/assets/15f6ed80-d32b-4c50-9a78-9ca4403a02ea
2018	2025-10-08 08:19:02.877348+00	1161684087	145.255.2.142	t	t	done	200 рублей	OZON	79177681278	https://directus.bmulti.store/assets/85bd882c-fcc7-4983-8cfb-65baa91de138	https://directus.bmulti.store/assets/8bf2b934-c111-4dc4-b3ac-e755de9b7898
2039	2025-10-08 16:38:28.869994+00	5694229543	178.178.243.93	t	t	check	200 рублей	OZON	79223973152	https://directus.bmulti.store/assets/80885d9f-fda9-4cb3-afd5-660f63a13de1	https://directus.bmulti.store/assets/68d69996-5ad7-4cab-b19e-8091fbc3bb06
2017	2025-10-08 06:16:03.181178+00	960646769	5.157.17.243	t	t	done	200 рублей	OZON	79787854512	https://directus.bmulti.store/assets/978f4081-19bf-453d-916d-e57f64e7bf64	https://directus.bmulti.store/assets/f85e2774-7c3f-4821-9b90-0d6de963ad46
2014	2025-10-07 21:09:32.056312+00	5199935015	94.140.240.175	t	t	done	200 рублей	OZON	79646834540	https://directus.bmulti.store/assets/fdc9d6e5-b871-405c-9aa7-72b225406942	https://directus.bmulti.store/assets/0da08ccd-b504-429d-bad8-aff491fc6a06
2015	2025-10-08 03:38:05.047691+00	820517878	167.71.5.43	t	t	done	200 рублей	WB	79962246249	https://directus.bmulti.store/assets/d37afc1e-6fa4-4cba-ba89-a31161a26765	https://directus.bmulti.store/assets/192e897b-9374-4007-a6c6-ce237f41d03d
2012	2025-10-07 19:49:54.134878+00	5781418870	188.187.172.52	t	t	done	300 рублей	WB	79027353660	https://directus.bmulti.store/assets/5d48fc18-f624-4617-9bf1-0c31fdf26fe7	https://directus.bmulti.store/assets/ab01232d-734a-4bbe-84f9-89f06a6995b3
2011	2025-10-07 19:20:09.259678+00	5277383126	176.195.135.133	t	t	done	300 рублей	OZON	79261681456	https://directus.bmulti.store/assets/96b079c5-d349-447d-a8de-d5d9b187f792	https://directus.bmulti.store/assets/a091d3e8-27bd-4622-b0b3-c6e48dab31f1
2020	2025-10-08 10:34:49.375044+00	911811114	176.15.250.116	t	t	done	200 рублей	WB	79616423380	https://directus.bmulti.store/assets/81d8e9f2-52c6-4593-b4fa-bc55a549cf48	https://directus.bmulti.store/assets/d2da7a58-b36f-41ec-8b9d-a3d50ffd205a
2036	2025-10-08 14:44:56.760217+00	1635400566	5.187.86.214	t	t	done	1000 рублей	OZON	79202181239	https://directus.bmulti.store/assets/51bd438d-7508-4bd3-9245-66f635f61936	https://directus.bmulti.store/assets/5a6882ec-f065-4cd3-852c-c810c5d7198d
2034	2025-10-08 14:20:08.19436+00	893191964	46.138.69.54	t	t	done	200 рублей	WB	79151967359	https://directus.bmulti.store/assets/fe69d15c-942c-452a-acc0-122137560a25	https://directus.bmulti.store/assets/c77d8c0d-ee33-441f-8fea-1bcf01f12101
2027	2025-10-08 12:32:21.381819+00	1068107680	185.251.148.123	t	t	done	200 рублей	OZON	79528566652	https://directus.bmulti.store/assets/d626b443-ea74-4acd-b99c-86fb13cf4783	https://directus.bmulti.store/assets/e26565a2-8b63-4a23-80f0-b75c1c2dc076
2040	2025-10-08 16:44:08.997397+00	5692709411	188.254.122.187	t	t	done	200 рублей	OZON	79496216967	https://directus.bmulti.store/assets/871ac9bd-cc8a-4a99-8424-0e9e72bd3405	https://directus.bmulti.store/assets/caf775f6-6e4e-4bce-8699-cb70d85a5db2
2028	2025-10-08 12:39:40.70952+00	5186931956	188.243.182.51	t	t	done	200 рублей	OZON	79217304506	https://directus.bmulti.store/assets/5cd3f0c1-d7b3-46d5-9e4b-b796d87a3dd8	https://directus.bmulti.store/assets/6376a218-4127-4280-bae6-045277fcd7f1
2081	2025-10-11 11:28:40.105753+00	7565877827	176.118.241.246	t	t	check	200 рублей	WB	79085146070	https://directus.bmulti.store/assets/275489b6-a058-488a-b4ae-6cb671c3b065	https://directus.bmulti.store/assets/4274da87-c18a-4d50-9127-dedfa0b7180c
2054	2025-10-09 15:31:05.526203+00	7400795350	128.71.180.0	t	t	done	200 рублей	WB	79055062298	https://directus.bmulti.store/assets/72ba200d-fbec-47b9-ad61-143119d07f40	https://directus.bmulti.store/assets/a48e24a7-f96d-46c1-ae0d-964e01f7549c
2046	2025-10-09 07:27:03.579569+00	2136893005	93.84.120.38	t	t	done	200 рублей	OZON	\N	https://directus.bmulti.store/assets/7347ecec-1c1f-427e-b159-e34267d65a14	https://directus.bmulti.store/assets/51ccf13d-ed61-43ec-aaa5-2e6b6c16cdf3
2041	2025-10-08 17:15:02.351316+00	8030225520	188.130.172.26	t	f	check	200 рублей	OZON	79536852901	https://directus.bmulti.store/assets/b7357319-3fe6-46ce-8d71-747a7f6e7971	https://directus.bmulti.store/assets/7addcd5c-bb6e-4f73-a865-14726fe2d30a
2065	2025-10-10 14:46:45.733948+00	575997606	62.122.135.198	t	t	done	200 рублей	OZON	279532368623	https://directus.bmulti.store/assets/bdb7a40b-745e-47df-bc11-55dddf98a8cd	https://directus.bmulti.store/assets/0b828170-db7a-4a1b-ac51-078db4b8c054
2063	2025-10-10 11:21:11.724057+00	2014627468	178.157.146.35	t	f	done	200 рублей	OZON	279046151010	https://directus.bmulti.store/assets/1ff0fdcb-724d-4c40-b92a-6e4bde3c023b	https://directus.bmulti.store/assets/48419b7e-b584-4c94-b21b-99d0825f2b98
2060	2025-10-10 05:09:28.6316+00	691444841	217.66.157.109	t	t	done	200 рублей	OZON	79111993367	https://directus.bmulti.store/assets/3728cb0f-d388-40d9-bda3-75744ed7c5c6	https://directus.bmulti.store/assets/6bbedbe2-eaba-47c3-8035-f1618a361be9
2056	2025-10-09 17:04:10.565451+00	904561235	176.15.252.43	t	t	done	200 рублей	WB	79655337850	https://directus.bmulti.store/assets/8c973ade-ae5e-491a-8a4f-926e797fd90f	https://directus.bmulti.store/assets/e84cfd0d-7549-43e6-bee9-fff32c814c8a
2064	2025-10-10 12:33:59.099626+00	502395928	176.194.47.9	t	t	done	200 рублей	WB	79185956118	https://directus.bmulti.store/assets/641a6082-55e4-45de-b927-93af9adc6211	https://directus.bmulti.store/assets/0509e47a-be12-41d7-84ed-2a06e64f5f6d
2043	2025-10-08 20:15:30.092572+00	7285074524	217.199.236.201	t	t	check	200 рублей	OZON	79496386992	https://directus.bmulti.store/assets/8b9787d5-c0db-4511-999d-fd69b06ac862	https://directus.bmulti.store/assets/c97edc01-6a7c-4e98-aeb5-6dfbd6d4f76a
2044	2025-10-09 00:24:27.71637+00	1064121880	176.59.147.133	t	t	check	200 рублей	OZON	79080130972	https://directus.bmulti.store/assets/7327f05a-c958-4d21-afdb-09d61b30d6c9	https://directus.bmulti.store/assets/0a28d4de-4941-4def-a2e1-2afba9684cb5
2045	2025-10-09 04:09:29.842363+00	5285723986	91.149.112.143	t	f	check	200 рублей	WB	79041396164	https://directus.bmulti.store/assets/5a570578-54f3-49f3-846b-c8a6b23c581a	https://directus.bmulti.store/assets/11e3692f-1a99-4616-824c-4ed2f23d5b71
2049	2025-10-09 12:21:25.033862+00	5079837966	193.228.193.116	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/356ba5c9-4ff8-4b9a-a699-f1dfb930a013	https://directus.bmulti.store/assets/65634778-c462-4772-a2a7-a4f0a62970d9
2050	2025-10-09 13:36:37.083918+00	1698902612	176.52.12.12	f	f	check	200 рублей	OZON	79600847583	https://directus.bmulti.store/assets/918c8e9b-896c-4da2-8ede-8d63be2f4b2d	https://directus.bmulti.store/assets/a779a93c-b543-42d3-8fe4-ba3be397a94a
2051	2025-10-09 13:39:58.960554+00	1371219167	95.153.176.74	t	t	check	200 рублей	OZON	79887067252	https://directus.bmulti.store/assets/4eb165dc-23ed-437e-a515-93a288c9d386	https://directus.bmulti.store/assets/3613015d-d89d-4bdc-8098-c2493669afc6
2047	2025-10-09 09:08:37.377639+00	7671880834	178.76.230.232	t	t	done	200 рублей	OZON	79281869232	https://directus.bmulti.store/assets/8b6bd460-2247-40c6-96d8-9d806d7d7337	https://directus.bmulti.store/assets/cbf3eb25-a0d1-4fd3-8920-1d596213dbae
2052	2025-10-09 15:25:46.339069+00	1428682260	31.173.240.76	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/312dae57-893b-483d-aa0a-91948e733b6e	https://directus.bmulti.store/assets/a45efef9-2eaf-430f-9659-e70d2a4eee0b
2053	2025-10-09 15:27:21.330557+00	1288182667	31.135.228.81	t	t	done	200 рублей	OZON	79040399907	https://directus.bmulti.store/assets/faef300c-0316-408f-9e1f-9727e95d0317	https://directus.bmulti.store/assets/71d191ed-13a1-457c-9076-a85fa8a8bc6d
2059	2025-10-09 18:08:32.288064+00	1067440292	46.147.89.198	t	t	done	200 рублей	OZON	79961250040	https://directus.bmulti.store/assets/b189399d-16c6-4f4b-a6aa-ec3bf5f7a3fa	https://directus.bmulti.store/assets/66d9a1b2-c412-40c7-b81b-66f31c3a32e9
2058	2025-10-09 17:40:20.87589+00	957878902	94.25.179.242	t	t	done	200 рублей	WB	79080510201	https://directus.bmulti.store/assets/ef8a20f4-6ea6-4dae-b511-8fa62704b81c	https://directus.bmulti.store/assets/4bf721c4-fa46-40e6-9962-258ed175ca24
2055	2025-10-09 15:31:38.820396+00	1013158539	109.252.213.213	t	t	done	200 рублей	OZON	79269847793	https://directus.bmulti.store/assets/7f9fb69a-396d-40ec-b1d4-baeed09e1458	https://directus.bmulti.store/assets/f7abc487-31c0-40ba-b677-6c864d395d25
2048	2025-10-09 10:53:36.548884+00	1220982567	89.22.177.158	t	t	done	200 рублей	OZON	79233362444	https://directus.bmulti.store/assets/781c9280-e90c-4fd9-a006-e3c61c4ee802	https://directus.bmulti.store/assets/6253525d-3f21-4882-8cd1-735118bbc048
2042	2025-10-08 18:08:39.397722+00	5807206532	178.70.214.223	t	t	done	1000 рублей	OZON	79657614002	https://directus.bmulti.store/assets/4a16afb5-9da8-482b-a2ef-84c33c68c3a9	https://directus.bmulti.store/assets/0ee389f1-b2c5-40d6-9ef1-1a7a29cf064f
2032	2025-10-08 13:49:33.556672+00	5271191070	46.8.62.175	t	t	done	200 рублей	OZON	79787439155	https://directus.bmulti.store/assets/2bb61045-3d68-4c1a-87a4-ae20720d97eb	https://directus.bmulti.store/assets/47005452-dab6-441e-a73d-3b8cd750e4c8
2061	2025-10-10 09:04:17.548667+00	711156280	95.70.76.171	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/3d4ae5c4-25ef-4172-957c-a98b00d8a27f	https://directus.bmulti.store/assets/180e6d88-f459-48f4-b9a9-d55154d357d8
2062	2025-10-10 10:40:05.644456+00	6490002007	109.62.174.24	t	t	check	200 рублей	WB	79202073378	https://directus.bmulti.store/assets/8e8ac40d-eebc-4b3e-98da-3b847924beac	https://directus.bmulti.store/assets/3057764a-352d-4cb4-b770-f42106516e69
2066	2025-10-10 15:46:20.027536+00	7771162224	188.243.176.253	f	f	check	200 рублей	OZON	279006523164	https://directus.bmulti.store/assets/cc127ce8-1b21-4a72-892e-2a36859c490c	https://directus.bmulti.store/assets/82e6ff7b-6956-4daa-b0ad-b24bb8983bd8
2067	2025-10-10 16:06:04.225775+00	6019135209	46.216.168.47	t	t	check	200 рублей	WB	375292813442	https://directus.bmulti.store/assets/ec592a65-687e-438b-8b07-e71f80b00c2b	https://directus.bmulti.store/assets/7ab443f4-903f-4b11-ae19-34ac10f3317c
2068	2025-10-10 16:21:53.002951+00	5494735416	46.242.68.70	t	t	check	200 рублей	OZON	79606948710	https://directus.bmulti.store/assets/e3205d8d-1d7f-4995-8431-4dd70cec1f5f	https://directus.bmulti.store/assets/9ba3d439-97d5-4a01-b029-16352253248f
2086	2025-10-11 13:24:14.273935+00	809382953	188.254.123.177	t	t	check	200 рублей	WB	79156392766	https://directus.bmulti.store/assets/6eb22e86-4dca-4dec-aa7a-e0cb092a329a	https://directus.bmulti.store/assets/43d39ef3-e2c8-40e3-abfd-0a071a7d8859
2088	2025-10-11 14:42:41.045692+00	5919643311	188.190.207.249	t	t	check	200 рублей	OZON	79595133783	https://directus.bmulti.store/assets/18c96196-d93b-4d46-bb04-943e81992e5c	https://directus.bmulti.store/assets/be59e6a6-5392-4678-a896-fdcd93d320a3
2089	2025-10-11 15:36:54.012944+00	5237258569	31.47.146.201	t	t	check	200 рублей	OZON	79620176696	https://directus.bmulti.store/assets/03a1b0d2-de55-451f-8bd3-0ed1e11cb19b	https://directus.bmulti.store/assets/4cb39e76-3425-4054-8dd4-bd70982ccaac
2091	2025-10-11 17:12:17.781952+00	787363234	178.155.28.8	t	t	check	200 рублей	OZON	79180314770	https://directus.bmulti.store/assets/ff1ddabd-abe3-40bd-adee-24a12fa4a223	https://directus.bmulti.store/assets/906dcd89-9cd7-40de-bb2c-29466145f93a
2093	2025-10-11 22:11:58.489576+00	5183932690	194.87.51.155	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/cc9b7832-dee6-443b-857f-c25482f35e17	https://directus.bmulti.store/assets/e37f0db2-f117-404b-a4e2-b64d418b59c9
2096	2025-10-12 07:21:34.995878+00	254211446	87.117.185.243	t	t	check	200 рублей	OZON	79872070819	https://directus.bmulti.store/assets/20255987-cd7e-4042-a5de-bb66c1f02568	https://directus.bmulti.store/assets/43c01596-66b7-44a8-81ce-afe9e0c597f5
2099	2025-10-12 09:09:30.419316+00	1142751115	94.103.81.18	t	t	check	200 рублей	WB	\N	https://directus.bmulti.store/assets/226dd0dc-328e-467d-92d5-76d4aefa60e4	https://directus.bmulti.store/assets/cfbd32cc-7e62-4f27-9610-b6d291012785
2098	2025-10-12 09:06:08.695391+00	1584357294	176.59.135.76	t	f	check	200 рублей	WB	279967063827	https://directus.bmulti.store/assets/e0e59b48-a29d-4024-9944-d75db0e2dcbe	https://directus.bmulti.store/assets/099b710b-686e-48d9-a997-d4d4e069ff12
2080	2025-10-11 11:24:47.9004+00	1385099350	82.208.126.223	f	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/df360680-de1b-4638-916d-f5e3e8c8c02d	https://directus.bmulti.store/assets/1cc26366-31fd-4221-91f4-4c2e8f14cc04
2109	2025-10-12 15:18:02.092219+00	867625165	176.59.45.176	t	t	done	200 рублей	OZON	289155167963	https://directus.bmulti.store/assets/49889314-2d27-49ec-abf5-1e75ae269a31	https://directus.bmulti.store/assets/2932ff90-4370-4f87-8595-cf652938ab29
2108	2025-10-12 15:09:10.52872+00	768346942	216.173.68.203	t	t	check	200 рублей	OZON	79621811485	https://directus.bmulti.store/assets/0aa122f4-17f0-4fd6-9dd9-704b7124c39c	https://directus.bmulti.store/assets/611f8a19-144e-4802-ac57-db8d45af15ae
2106	2025-10-12 15:07:19.864379+00	5541590356	95.24.5.149	t	t	check	200 рублей	WB	79030095937	https://directus.bmulti.store/assets/0a32df9b-0c0c-4db5-b0fa-1d61211f5e4b	https://directus.bmulti.store/assets/da97309c-8728-450d-9274-0ff3478d7814
2078	2025-10-11 11:01:40.681077+00	403519664	185.255.176.194	t	f	done	200 рублей	WB	79966309172	https://directus.bmulti.store/assets/c36a8231-d83a-4f5b-a35a-25575818fadb	https://directus.bmulti.store/assets/9dd0e8bb-0aa2-4e67-9f93-14f416871b0e
2057	2025-10-09 17:13:08.481045+00	937356784	176.59.172.148	t	t	done	200 рублей	WB	79148749070	https://directus.bmulti.store/assets/d547e5ef-2980-4dfc-b37e-de3f3cc3ca43	https://directus.bmulti.store/assets/666aa136-074d-40a6-9970-e20e9b82f099
2110	2025-10-12 15:34:34.342224+00	5391268824	185.166.73.181	t	t	check	200 рублей	WB	79787544490	https://directus.bmulti.store/assets/51267a77-65d8-4feb-ac0f-99894d2552f9	https://directus.bmulti.store/assets/c5c96f3d-6301-4a48-9a58-a4f6dd32efdd
2069	2025-10-10 16:41:13.690749+00	770656926	176.59.97.18	t	t	done	200 рублей	OZON	79525567080	https://directus.bmulti.store/assets/772c3173-a3b5-4850-99c0-bf93405a8b1f	https://directus.bmulti.store/assets/dda7f135-840d-4978-98de-ac826f4e5e92
2104	2025-10-12 13:40:23.717429+00	5192919161	77.39.8.134	t	t	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/d114d75c-5107-43cd-b58f-f717ea79ee3d	https://directus.bmulti.store/assets/ead54e11-933b-4d91-aa57-cc66eab3556a
2107	2025-10-12 15:07:37.28384+00	772924485	176.59.160.252	t	t	done	200 рублей	WB	279255222169	https://directus.bmulti.store/assets/080bcd19-8cd0-44fe-8273-f7fa0c41b8db	https://directus.bmulti.store/assets/ff68c9bc-12df-4de2-a61f-b203637d50aa
2077	2025-10-11 10:50:04.561386+00	79850664	178.178.249.101	f	f	done	200 рублей	OZON	79213803590	https://directus.bmulti.store/assets/acb8edfb-d131-4654-aaad-41096729d9e6	https://directus.bmulti.store/assets/bf88593c-2352-4d0b-ba9f-6c31cbd541f6
2105	2025-10-12 14:25:00.969042+00	1083891129	89.107.139.5	t	t	done	200 рублей	WB	79787446757	https://directus.bmulti.store/assets/14a85515-5a4e-44b3-b211-49ded6c5a33c	https://directus.bmulti.store/assets/f9f76723-7969-4a0b-8095-48a820078f0c
2103	2025-10-12 13:33:23.504122+00	508055651	46.180.117.147	t	t	done	200 рублей	OZON	79134004966	https://directus.bmulti.store/assets/f484d0bd-47a4-48d9-a559-47f04e134c00	https://directus.bmulti.store/assets/5b222b18-675f-43ef-9264-6850707e79e6
2101	2025-10-12 12:56:15.375379+00	446823557	178.57.108.73	t	t	done	200 рублей	OZON	79005415639	https://directus.bmulti.store/assets/fae89944-146a-47a2-bbd6-9cedaad122dc	https://directus.bmulti.store/assets/719d8cb5-346e-4908-836b-0ff8bda499be
2100	2025-10-12 11:11:52.942686+00	1904044855	178.141.243.165	t	t	done	200 рублей	OZON	79127193222	https://directus.bmulti.store/assets/76f6f7de-bc0c-4734-bace-605affe221af	https://directus.bmulti.store/assets/f4835c38-4fe4-4fc9-af5e-52389255c3ea
2102	2025-10-12 13:18:59.253829+00	6143457629	84.53.216.123	t	t	done	200 рублей	WB	90465954422	https://directus.bmulti.store/assets/90b5f5f9-ebf2-40fa-a11f-6e895addcf0c	https://directus.bmulti.store/assets/967979a1-b431-4c77-87fd-3769941d8442
2097	2025-10-12 08:01:22.593677+00	1763429477	91.149.74.154	t	t	done	200 рублей	OZON	79516188440	https://directus.bmulti.store/assets/a8e78de0-3e1e-42e6-8cc8-08eb8067c900	https://directus.bmulti.store/assets/136c93be-e268-4ce4-ae87-e8b014299db3
2095	2025-10-12 04:48:26.228387+00	6759829637	77.82.213.199	t	t	done	200 рублей	OZON	79140290365	https://directus.bmulti.store/assets/3288f6e4-9d9c-4453-beac-ddde575316a0	https://directus.bmulti.store/assets/6f39d3d3-1b7a-4be0-9284-ce102d1ea79d
2094	2025-10-12 04:04:28.897075+00	1730765660	212.164.38.230	t	t	done	200 рублей	WB	79231156994	https://directus.bmulti.store/assets/6effe913-b24c-4412-80aa-2ef345c73439	https://directus.bmulti.store/assets/71976ffa-2ca7-481d-8235-77bc2aab056d
2090	2025-10-11 15:54:57.018852+00	5531220226	94.25.68.195	t	t	done	200 рублей	OZON	79268289484	https://directus.bmulti.store/assets/e8cc3680-7488-4abd-af8b-03436b13c673	https://directus.bmulti.store/assets/a708c45d-9193-45c4-b71d-1357d6bf7e5a
2082	2025-10-11 11:49:45.36125+00	1764699475	80.237.106.224	t	t	done	200 рублей	WB	79107508812	https://directus.bmulti.store/assets/f632e365-be4c-411d-a81b-31961df46a38	https://directus.bmulti.store/assets/de364b29-485f-4fb1-8a36-80ed776936aa
2037	2025-10-08 14:51:06.598878+00	7391605998	152.53.148.11	t	t	done	200 рублей	WB	79812013610	https://directus.bmulti.store/assets/7147de65-fdd7-46f6-b675-86ce83d60c03	https://directus.bmulti.store/assets/c4499bba-328a-4f0f-b9b8-7a4fd95d0170
2079	2025-10-11 11:22:09.450358+00	310379581	208.123.185.24	t	t	done	200 рублей	OZON	79036665380	https://directus.bmulti.store/assets/761e48ae-149e-4515-9f57-a6cb6ea37cb0	https://directus.bmulti.store/assets/783c595d-22cf-44b0-82d4-6ed9a0e6e34e
2075	2025-10-11 10:13:08.477823+00	5996992278	91.149.106.202	t	t	done	200 рублей	OZON	79518436225	https://directus.bmulti.store/assets/0d76e2a5-4505-4835-ae13-f76b2518e84e	https://directus.bmulti.store/assets/cb9ee53e-f252-472a-b1ce-52a3c0380276
2072	2025-10-11 05:42:53.52487+00	5405671492	91.149.98.90	t	t	done	200 рублей	OZON	279940003361	https://directus.bmulti.store/assets/0f38b61e-9d40-49e3-a7d1-33d5554a76b8	https://directus.bmulti.store/assets/35357fcc-47dc-453a-9dae-3030c5c64cb0
2070	2025-10-10 20:17:30.312975+00	1790163274	95.26.30.36	t	t	done	200 рублей	OZON	79207621355	https://directus.bmulti.store/assets/947aadcf-4b82-4fbc-a51c-4b2b94266701	https://directus.bmulti.store/assets/8c12324b-652b-4646-980b-e10209f2588d
2121	2025-10-13 11:16:03.296161+00	8125286428	176.60.241.29	t	t	check	300 рублей	WB	375298915642	https://directus.bmulti.store/assets/2637cb6c-2a5c-460d-b887-464dfeed5af4	https://directus.bmulti.store/assets/cc531b40-319f-41b1-9c93-c210b59f80e8
2111	2025-10-12 16:43:17.990678+00	5010550723	77.222.102.0	f	f	check	200 рублей	WB	79966905183	https://directus.bmulti.store/assets/8506729d-8f6c-4e68-aed5-8366cfb7d971	https://directus.bmulti.store/assets/616aae52-1fd1-4e74-b319-f3f648d3862e
2116	2025-10-12 18:05:47.336693+00	5028066980	185.15.38.44	f	t	check	200 рублей	WB	79788138959	https://directus.bmulti.store/assets/317a6071-23f7-4f1d-949b-953eeb640db3	https://directus.bmulti.store/assets/1a5eb781-a89e-4421-b872-a648b5c2bd9e
2122	2025-10-13 12:06:09.082673+00	706574312	95.174.127.158	t	t	check	200 рублей	WB	79895437229	https://directus.bmulti.store/assets/bf469695-d7f4-4700-932f-74b92bbb4e40	https://directus.bmulti.store/assets/5a3a4003-c4ae-4fbd-bf0d-e12470d82223
2123	2025-10-13 13:31:57.039207+00	5257428183	193.203.105.252	t	t	check	200 рублей	OZON	79595666296	https://directus.bmulti.store/assets/18364359-156c-4c66-8ee6-176539aa6a48	https://directus.bmulti.store/assets/e396bdb4-74b4-411b-9dc9-097b29e21ab0
2125	2025-10-13 14:00:27.211917+00	5232140093	176.59.203.84	t	f	check	200 рублей	OZON	79049803442	https://directus.bmulti.store/assets/532d9744-d508-4dd0-bb58-02e49cfba2c4	https://directus.bmulti.store/assets/ed82e06f-3611-4d19-bf2a-5782ff40aaed
2131	2025-10-13 16:03:29.899515+00	7416182262	94.25.225.141	t	f	check	200 рублей	OZON	\N	https://directus.bmulti.store/assets/4c4baa06-3be3-487f-90dc-50dc9e276b0c	https://directus.bmulti.store/assets/19cef15b-30fc-4409-a5fb-ca4006ecb8c2
2132	2025-10-13 16:43:54.547148+00	1147732126	91.222.219.75	f	f	check	200 рублей	OZON	79994455246	https://directus.bmulti.store/assets/31f60dcc-7519-4d2b-929e-c588af0a59cf	https://directus.bmulti.store/assets/010289a5-a757-4cae-a55b-075e6806950a
2134	2025-10-13 17:02:03.102609+00	695890260	85.173.8.187	t	t	in_work	2000 рублей	OZON	\N	https://directus.bmulti.store/assets/8ac28301-a303-4922-bef5-7ba95e76ce6e	https://directus.bmulti.store/assets/5ce94b4d-4105-4969-afb0-d8a92d282828
2118	2025-10-12 21:28:06.337595+00	929744655	178.35.3.99	t	t	done	500 рублей	WB	79286899002	https://directus.bmulti.store/assets/d5d8f3d3-26b7-4014-996c-42dc8afd13a0	https://directus.bmulti.store/assets/c2848c68-97c4-4743-b931-c651e2368817
2117	2025-10-12 19:10:32.216921+00	5898937068	46.191.190.206	t	t	done	200 рублей	OZON	79198481131	https://directus.bmulti.store/assets/a7a64ae9-6770-4308-a4ec-e669347cf65c	https://directus.bmulti.store/assets/de819cbf-8553-45c2-9a92-e24dce073454
2114	2025-10-12 17:05:21.332148+00	2073826072	95.105.85.35	f	t	done	200 рублей	WB	79278723342	https://directus.bmulti.store/assets/6b058713-53a2-4999-971b-f5951abc7d55	https://directus.bmulti.store/assets/7b67fe72-ece9-460c-a734-d95cc455004b
2113	2025-10-12 17:03:57.714452+00	5036768864	212.35.174.80	t	t	done	200 рублей	OZON	79156936653	https://directus.bmulti.store/assets/c407fb3d-8614-4eb0-a577-af318dd187a1	https://directus.bmulti.store/assets/83bfd067-b56e-4aa6-a0c8-d9a20daed7bd
2112	2025-10-12 16:46:23.93771+00	6349277235	213.87.139.142	t	t	done	200 рублей	OZON	79161256554	https://directus.bmulti.store/assets/4a912638-98a0-43be-93ce-08dd89578fb8	https://directus.bmulti.store/assets/75b442bb-648c-4b95-a72d-728fd3ae6bce
2115	2025-10-12 17:14:12.975192+00	1049866800	46.147.48.140	t	t	done	200 рублей	WB	79824690853	https://directus.bmulti.store/assets/0de63a6c-4fdb-4789-8fc3-db2fe7d53f85	https://directus.bmulti.store/assets/2ecda63c-d846-4201-85c6-421944db23dd
2133	2025-10-13 16:53:53.937886+00	435591126	188.143.203.13	t	t	done	200 рублей	OZON	79217649874	https://directus.bmulti.store/assets/1a836607-fb51-48e5-9bb6-54b736449ec4	https://directus.bmulti.store/assets/4f4bed02-ce64-44fb-a500-be10548b7158
2130	2025-10-13 15:57:22.772692+00	306371728	46.147.102.57	t	t	done	200 рублей	OZON	79094378749	https://directus.bmulti.store/assets/29674277-5149-4f9e-b366-c981b66f366e	https://directus.bmulti.store/assets/66eac22e-3ed8-4595-aeb8-b2f1f5cad2b6
2129	2025-10-13 15:44:24.729663+00	5126335319	93.170.127.63	t	t	done	200 рублей	OZON	79227228167	https://directus.bmulti.store/assets/d2211763-a764-41db-8407-2e20382157a4	https://directus.bmulti.store/assets/5980611f-3cd1-4172-9696-c42ab6437315
2128	2025-10-13 15:22:13.473687+00	249839161	176.59.41.120	f	t	done	200 рублей	OZON	279511513959	https://directus.bmulti.store/assets/6bfe2f87-b9f4-475e-a6f6-b7501833a35a	https://directus.bmulti.store/assets/bcb43327-3c41-45df-8a4d-d79ec04497e5
2127	2025-10-13 14:32:17.314521+00	1147225354	128.73.198.130	f	t	done	200 рублей	OZON	279513066668	https://directus.bmulti.store/assets/dc56f0f8-cd94-4013-bd33-e633f2a2678c	https://directus.bmulti.store/assets/6b7030d8-5343-4e99-9e25-0a6bb855c184
2126	2025-10-13 14:24:28.260766+00	625580556	5.18.98.243	t	t	done	200 рублей	OZON	79531622401	https://directus.bmulti.store/assets/813ccf90-2d36-41d0-a9c3-abc19c838234	https://directus.bmulti.store/assets/fdba7857-4649-4311-8221-6bd9d4b28ea9
2124	2025-10-13 13:52:13.705868+00	7454647891	95.25.85.224	t	t	done	200 рублей	OZON	79199879595	https://directus.bmulti.store/assets/7f57965a-6a04-459b-988e-0b8bf5315351	https://directus.bmulti.store/assets/81eb4918-d5b0-4cb1-a5fc-c7c3412f5202
2120	2025-10-13 04:07:57.083662+00	5627232064	178.176.83.246	f	t	done	200 рублей	WB	79328407302	https://directus.bmulti.store/assets/e33bea64-c561-42d2-922c-163002daa0b9	https://directus.bmulti.store/assets/40309183-45ef-4fc8-9996-08b34cab5373
2119	2025-10-13 03:50:13.508578+00	6866831556	46.181.241.181	t	t	done	200 рублей	OZON	79235136332	https://directus.bmulti.store/assets/14f46ba7-9ed1-48d2-8b68-431a3d8ab67c	https://directus.bmulti.store/assets/5bd8ce01-ac57-4bca-b361-dfa5bdb82228
2141	2025-10-14 06:43:50.411226+00	777067444	46.48.69.224	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/a6b0d74e-3381-4a0e-b3d2-926fc686456b	https://directus.bmulti.store/assets/ef674f88-f07c-42a3-bc01-5fb6a9f9b0bf
2135	2025-10-13 17:03:17.035623+00	1968660067	95.26.246.167	t	t	check	200 рублей	OZON	79379637646	https://directus.bmulti.store/assets/49db4a1e-b574-408f-8298-45517b5a7e40	https://directus.bmulti.store/assets/4cab9486-9ab0-41a7-975f-095a6e001713
2083	2025-10-11 12:03:32.93355+00	5262913999	77.79.169.121	t	t	done	2000 рублей	OZON	\N	https://directus.bmulti.store/assets/4fb323fb-e4b1-48cc-82bd-be2d94594b70	https://directus.bmulti.store/assets/46001b83-f8a9-4bb2-a9f6-bd06e26938d4
2142	2025-10-14 07:31:21.340137+00	5992786745	37.23.86.246	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/0e5add75-268f-47ea-898a-1b8cb1b86a8e	https://directus.bmulti.store/assets/b9bf30a4-d2b9-4c3b-82b7-857ee2dc7b75
2087	2025-10-11 13:34:53.293266+00	6676058668	178.186.234.3	t	t	done	200 рублей	WB	79059270704	https://directus.bmulti.store/assets/99ba5dbf-b316-402b-a93c-42566c5472a8	https://directus.bmulti.store/assets/cc36fd89-9de3-4257-a90a-5a9ee0636936
2085	2025-10-11 12:25:20.01844+00	5052876980	178.155.116.236	t	t	done	200 рублей	OZON	79954224333	https://directus.bmulti.store/assets/48646121-e067-44c6-865a-1658afc2f53d	https://directus.bmulti.store/assets/0cc3df07-970a-4608-9fdd-51cc224c3597
2084	2025-10-11 12:21:18.14846+00	5115420119	5.199.173.85	t	t	done	300 рублей	OZON	79251976698	https://directus.bmulti.store/assets/dcf3be69-76a4-4770-8811-f8da42806080	https://directus.bmulti.store/assets/ac3b75e3-2c94-4112-94d1-806916bbe7c8
2143	2025-10-14 07:32:26.910788+00	5992786745	37.23.86.246	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/a2ec77d0-67df-4718-8b9d-2fc9df8a0570	https://directus.bmulti.store/assets/3ee50e01-09c0-48d4-9b21-2b6d47ef00f7
2144	2025-10-14 07:32:41.137968+00	5992786745	37.23.86.246	f	f	new	\N	WB	\N	https://directus.bmulti.store/assets/5cb8f268-7a42-4871-899c-1f92b3a99b8d	https://directus.bmulti.store/assets/09a373ce-f71f-445e-bbcd-aa30a9078bcf
2139	2025-10-14 04:56:35.970418+00	274102411	212.164.178.106	t	t	check	200 рублей	WB	79237042443	https://directus.bmulti.store/assets/4d91a473-10c8-4bb6-ab3b-834c35d8c890	https://directus.bmulti.store/assets/d7884171-8481-4fa6-88a4-9ffb2abfa460
2145	2025-10-14 10:45:51.45018+00	7669516669	78.36.15.40	t	t	check	200 рублей	WB	79113029907	https://directus.bmulti.store/assets/4aec437b-06a9-4e6c-9cac-a62f41232e6d	https://directus.bmulti.store/assets/5cb34218-930f-4e0a-b84b-670a0673d281
2151	2025-10-14 12:51:52.985471+00	575997606	62.122.135.198	t	t	check	300 рублей	OZON	79532368623	https://directus.bmulti.store/assets/be74f79d-ef0e-4e24-8fa3-4b0a79bfda3e	https://directus.bmulti.store/assets/644493b5-3a1d-47e8-9d6c-e90812d6a598
2146	2025-10-14 10:47:22.616661+00	6371857548	89.113.101.12	t	t	check	300 рублей	OZON	79054061745	https://directus.bmulti.store/assets/4da1b757-189d-430d-9517-ae803fa9d43b	https://directus.bmulti.store/assets/cb17b01a-6832-4f79-88f8-e26452712bd7
2149	2025-10-14 12:22:26.538528+00	1242995666	176.59.211.37	t	t	check	200 рублей	WB	79082793185	https://directus.bmulti.store/assets/c16e8eca-82f5-4cce-8bde-d939812bfe0a	https://directus.bmulti.store/assets/81c99556-0a1a-41a8-ac43-7876cba2530c
2147	2025-10-14 11:03:40.522928+00	1679747289	188.75.205.98	t	t	check	200 рублей	WB	79148016164	https://directus.bmulti.store/assets/0a2283dc-f7f1-4716-a8b1-07413d9ef267	https://directus.bmulti.store/assets/1e861abd-7590-4750-8422-b996cd0c2aa7
2148	2025-10-14 12:15:41.734877+00	6170099478	94.230.252.212	t	f	in_work	300 рублей	WB	\N	https://directus.bmulti.store/assets/3275c9da-0810-4cff-8116-b24b950e4663	https://directus.bmulti.store/assets/1cf946b9-8731-49c3-a873-aaa2e8c2babb
2150	2025-10-14 12:45:17.658404+00	1815326475	90.151.87.68	t	t	check	200 рублей	OZON	79505259175	https://directus.bmulti.store/assets/3b14b420-b8e8-44e9-8f64-6b0b5e001419	https://directus.bmulti.store/assets/10d1b07b-9b45-40a4-a830-1a1c544e9dda
2152	2025-10-14 13:04:05.266792+00	418374092	176.194.213.226	t	t	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/bbc7b4d4-7a45-44f9-82ca-e7f51b81e4aa	https://directus.bmulti.store/assets/bd2f8409-6b2e-4959-be83-90da46279300
2153	2025-10-14 13:15:55.083975+00	1988083796	79.127.142.132	t	t	check	200 рублей	WB	79892714949	https://directus.bmulti.store/assets/f0757f10-747d-46ae-9871-23c9a1cf9701	https://directus.bmulti.store/assets/4e71fd00-d5cb-4e09-b45a-4785383d4cce
2156	2025-10-14 13:47:30.535479+00	5142935685	94.140.142.28	t	t	in_work	200 рублей	WB	\N	https://directus.bmulti.store/assets/c16f1542-1964-46c2-910d-92c448e5e88e	https://directus.bmulti.store/assets/19288513-bf05-45a0-bb0d-1673966ccfbc
2154	2025-10-14 13:28:27.046197+00	1390389510	91.241.200.29	t	t	check	200 рублей	OZON	79790770253	https://directus.bmulti.store/assets/8e8e8d26-0703-4688-99a1-3c93d766db6b	https://directus.bmulti.store/assets/eb5498e5-ed0f-4ac8-a15c-785d6e850185
2155	2025-10-14 13:34:43.600906+00	808074486	178.169.108.130	t	t	check	200 рублей	WB	79247014924	https://directus.bmulti.store/assets/91024000-597d-43cb-a017-cf0a66513b6a	https://directus.bmulti.store/assets/672b89da-cbfb-494a-aac6-9dbfc071b40e
2157	2025-10-14 13:54:55.885307+00	5116926904	94.25.179.144	t	t	check	200 рублей	OZON	79514683866	https://directus.bmulti.store/assets/a39dc0c4-9347-4aa3-b658-4da2a7a9b692	https://directus.bmulti.store/assets/2cac4fd1-7dc0-450d-855e-bf96c265cbbc
2158	2025-10-14 14:11:50.171579+00	5217164106	45.15.113.131	t	t	check	200 рублей	OZON	79333351331	https://directus.bmulti.store/assets/7590e8bd-6603-441b-9ac5-7373dc5fa585	https://directus.bmulti.store/assets/5afd8cf1-37ea-4a01-bcd5-349f0bad80c5
2159	2025-10-14 14:17:24.017746+00	2018611077	94.190.69.24	t	t	in_work	500 рублей	OZON	\N	https://directus.bmulti.store/assets/6ef28c54-f4c2-469f-9c11-e18287fef7fb	https://directus.bmulti.store/assets/dcbda319-2005-4714-943b-51dbe6ceaa36
2160	2025-10-14 14:59:59.366511+00	987400828	62.140.251.160	f	f	in_work	200 рублей	OZON	\N	https://directus.bmulti.store/assets/75aa9fe5-066a-4dee-b807-2c705ce86fdc	https://directus.bmulti.store/assets/ce4bb28d-a55d-4008-bf54-71e7df73fd37
2140	2025-10-14 05:40:08.503588+00	243356415	80.237.92.18	t	t	done	200 рублей	OZON	79333020742	https://directus.bmulti.store/assets/8a1c98bd-73d8-4181-b4b6-6c88fe7c7443	https://directus.bmulti.store/assets/1eeac30c-1ae6-445b-86f6-a933a3be309e
2138	2025-10-13 19:35:46.159351+00	6355461882	212.46.10.221	t	t	done	200 рублей	WB	79660540003	https://directus.bmulti.store/assets/d29e7eee-35be-43c4-b343-2a21aedea2a8	https://directus.bmulti.store/assets/28001ae2-61f9-47db-bb2a-996ab1292e68
2137	2025-10-13 19:34:36.032488+00	1640038544	5.18.201.91	t	t	done	200 рублей	OZON	79604254666	https://directus.bmulti.store/assets/3296d589-be97-4941-beca-a3bc399fe87c	https://directus.bmulti.store/assets/202a3d15-8418-4a08-a364-cc81b73bcd62
2136	2025-10-13 18:47:29.708501+00	505586494	95.26.69.179	t	t	done	200 рублей	OZON	79632706638	https://directus.bmulti.store/assets/5a416e71-b67b-4426-acda-17f8d33fe9ed	https://directus.bmulti.store/assets/3b7a5055-19fa-4a1e-a030-cbd417e963be
2168	2025-10-15 06:52:08.026719+00	6509363430	80.78.125.238	t	f	check	200 рублей	OZON	79170043060	https://directus.bmulti.store/assets/a53ff20c-13eb-4cfa-adba-bbcd6a723c0c	https://directus.bmulti.store/assets/df4c4fb2-52e7-4ecc-8177-0e92f107b7cd
2161	2025-10-14 15:21:46.792796+00	1540529659	91.242.209.153	f	f	check	200 рублей	OZON	279518253115	https://directus.bmulti.store/assets/c977eebe-9bfd-45ad-b273-f1fbbdfc9cec	https://directus.bmulti.store/assets/bdd77522-adcd-4c93-9b01-f5bea8a82c5d
2162	2025-10-14 15:28:27.776363+00	624758703	5.129.239.72	t	t	check	200 рублей	OZON	79588355347	https://directus.bmulti.store/assets/ad0059d7-30ed-4440-b784-36ba4ae61f64	https://directus.bmulti.store/assets/f52d354e-891c-4088-96c5-99e9187f5252
2163	2025-10-14 16:04:37.41589+00	738072662	212.34.136.143	t	t	check	200 рублей	OZON	79262210827	https://directus.bmulti.store/assets/318c5d25-883e-44c2-92f6-4f2a68a5d462	https://directus.bmulti.store/assets/75882065-35e7-446e-9632-c199f3e3cdc4
2164	2025-10-14 16:12:43.762761+00	412707019	176.194.166.201	t	t	check	200 рублей	OZON	79524335375	https://directus.bmulti.store/assets/2877c35e-7275-4595-9eb6-3d9e91ee4183	https://directus.bmulti.store/assets/b9fe71fc-0735-42ae-9e40-c9e473745b0f
2169	2025-10-15 09:10:02.532676+00	830995733	176.52.55.229	t	t	check	200 рублей	OZON	79270358909	https://directus.bmulti.store/assets/7769f313-7ac9-43fc-95d6-9f425c8de806	https://directus.bmulti.store/assets/ef3d6332-f84e-4db5-a9c7-ebad650f0412
2165	2025-10-14 18:13:25.405269+00	1627395148	109.68.112.233	t	t	check	200 рублей	OZON	79537436280	https://directus.bmulti.store/assets/78ebe7af-9a00-49d8-ac45-8b41a27f9f95	https://directus.bmulti.store/assets/68f8c1ae-76fc-4c0a-9f59-579000550824
2166	2025-10-14 18:58:03.621621+00	1004993361	217.66.152.143	t	t	check	200 рублей	OZON	79819383173	https://directus.bmulti.store/assets/e827be28-25e3-4f64-84ae-ef8f7adc6946	https://directus.bmulti.store/assets/0809987f-c67d-420f-8310-b15171265640
2167	2025-10-15 03:15:52.93737+00	904561235	81.222.185.248	t	t	check	200 рублей	WB	79655337850	https://directus.bmulti.store/assets/afc903a5-a19b-4b47-ac55-506f70a4cb3d	https://directus.bmulti.store/assets/8ea4030d-f5d7-4f40-b656-f1a7e0cfae80
2170	2025-10-15 09:14:25.844207+00	1281219335	95.26.205.179	t	t	check	200 рублей	OZON	79620711887	https://directus.bmulti.store/assets/ce5626c6-04f4-413b-81b8-ce564c11b0b8	https://directus.bmulti.store/assets/50484035-048b-43a7-af44-2daf6204db98
2174	2025-10-15 12:56:18.71614+00	1806157266	178.65.134.188	t	t	check	200 рублей	OZON	79313687787	https://directus.bmulti.store/assets/591e5c4e-f885-487b-a596-01e96eaa8dc2	https://directus.bmulti.store/assets/46bb19ed-f3bc-4ee2-889c-b3288134059c
2171	2025-10-15 10:11:38.47966+00	783915484	185.211.158.46	t	t	check	200 рублей	WB	79933272294	https://directus.bmulti.store/assets/48873598-0daf-44cd-9dbb-5450f06e1edf	https://directus.bmulti.store/assets/70d82724-6517-4148-a4ba-b30d8e9e12db
2172	2025-10-15 10:59:45.965196+00	1466252515	188.168.32.90	t	t	check	200 рублей	OZON	79526368481	https://directus.bmulti.store/assets/44ead831-826c-45ac-bacc-48bfffb30fd3	https://directus.bmulti.store/assets/cebd4da2-feaa-4545-ab36-c802fe0dee6b
2173	2025-10-15 11:57:09.33352+00	502395928	176.194.47.9	t	t	check	200 рублей	WB	79185956118	https://directus.bmulti.store/assets/97ca3bda-6ce8-4fe9-8d3f-2ca6230729f5	https://directus.bmulti.store/assets/cf619f9b-12d3-4e48-ae21-148fd66b137f
\.


--
-- Name: point_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.point_transactions_id_seq', 96, true);


--
-- Name: store_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_items_id_seq', 399, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 8, true);


--
-- Name: user_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_tasks_id_seq', 129, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 40, true);


--
-- Name: wheel_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wheel_requests_id_seq', 2174, true);


--
-- Name: point_transactions point_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_transactions
    ADD CONSTRAINT point_transactions_pkey PRIMARY KEY (id);


--
-- Name: store_items store_items_internal_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_items
    ADD CONSTRAINT store_items_internal_id_unique UNIQUE (internal_id);


--
-- Name: store_items store_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_items
    ADD CONSTRAINT store_items_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: user_tasks user_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tasks
    ADD CONSTRAINT user_tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_tg_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_tg_id_unique UNIQUE (tg_id);


--
-- Name: wheel_requests wheel_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wheel_requests
    ADD CONSTRAINT wheel_requests_pkey PRIMARY KEY (id);


--
-- Name: store_items_internal_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_items_internal_id_index ON public.store_items USING btree (internal_id);


--
-- Name: user_tasks_salebot_order_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_tasks_salebot_order_id_index ON public.user_tasks USING btree (salebot_order_id);


--
-- Name: users_tg_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_tg_id_index ON public.users USING btree (tg_id);


--
-- Name: wheel_requests_unic_purchase_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wheel_requests_unic_purchase_index ON public.wheel_requests USING btree (unic_purchase);


--
-- Name: wheel_requests_unic_review_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wheel_requests_unic_review_index ON public.wheel_requests USING btree (unic_review);


--
-- Name: wheel_requests_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wheel_requests_user_id_index ON public.wheel_requests USING btree (user_id);


--
-- Name: wheel_requests_user_ip_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wheel_requests_user_ip_index ON public.wheel_requests USING btree (user_ip);


--
-- Name: wheel_requests_user_phone_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wheel_requests_user_phone_index ON public.wheel_requests USING btree (user_phone);


--
-- Name: point_transactions point_transactions_task_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_transactions
    ADD CONSTRAINT point_transactions_task_id_foreign FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: point_transactions point_transactions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_transactions
    ADD CONSTRAINT point_transactions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: point_transactions point_transactions_user_task_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_transactions
    ADD CONSTRAINT point_transactions_user_task_id_foreign FOREIGN KEY (user_task_id) REFERENCES public.user_tasks(id) ON DELETE CASCADE;


--
-- Name: user_tasks user_tasks_task_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tasks
    ADD CONSTRAINT user_tasks_task_id_foreign FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: user_tasks user_tasks_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tasks
    ADD CONSTRAINT user_tasks_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_partner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_partner_id_foreign FOREIGN KEY (partner_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict EQxVvecfPd15kb3pVLECSZtWq1Uphx0CTCVITO29br2jbZagcNxlqSJPxlTdtJv

