PGDMP  +                    }            job_market_db    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    17719    job_market_db    DATABASE     �   CREATE DATABASE job_market_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE job_market_db;
                     postgres    false            �            1259    19737 	   contracts    TABLE     �  CREATE TABLE public.contracts (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    user_id bigint NOT NULL,
    pay_amount numeric(8,2) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_completed boolean NOT NULL,
    client_rating smallint,
    client_feedback character varying(255),
    talent_rating smallint,
    talent_feedback character varying(255)
);
    DROP TABLE public.contracts;
       public         heap r       postgres    false            �            1259    19736    contracts_id_seq    SEQUENCE     y   CREATE SEQUENCE public.contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.contracts_id_seq;
       public               postgres    false    244            �           0    0    contracts_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;
          public               postgres    false    243            �            1259    19586 	   durations    TABLE     d   CREATE TABLE public.durations (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.durations;
       public         heap r       postgres    false            �            1259    19585    durations_id_seq    SEQUENCE     y   CREATE SEQUENCE public.durations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.durations_id_seq;
       public               postgres    false    230            �           0    0    durations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.durations_id_seq OWNED BY public.durations.id;
          public               postgres    false    229            �            1259    19577    english_levels    TABLE     �   CREATE TABLE public.english_levels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);
 "   DROP TABLE public.english_levels;
       public         heap r       postgres    false            �            1259    19576    english_levels_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.english_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.english_levels_id_seq;
       public               postgres    false    228            �           0    0    english_levels_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.english_levels_id_seq OWNED BY public.english_levels.id;
          public               postgres    false    227            �            1259    19568    experience_levels    TABLE     �   CREATE TABLE public.experience_levels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);
 %   DROP TABLE public.experience_levels;
       public         heap r       postgres    false            �            1259    19567    experience_levels_id_seq    SEQUENCE     �   CREATE SEQUENCE public.experience_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.experience_levels_id_seq;
       public               postgres    false    226            �           0    0    experience_levels_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.experience_levels_id_seq OWNED BY public.experience_levels.id;
          public               postgres    false    225            �            1259    19683    fixed_price_jobs    TABLE     b   CREATE TABLE public.fixed_price_jobs (
    id bigint NOT NULL,
    price numeric(8,2) NOT NULL
);
 $   DROP TABLE public.fixed_price_jobs;
       public         heap r       postgres    false            �            1259    19668    hourly_jobs    TABLE     �   CREATE TABLE public.hourly_jobs (
    id bigint NOT NULL,
    rate_min numeric(8,2) NOT NULL,
    rate_max numeric(8,2) NOT NULL,
    weekly_hours_limit integer NOT NULL,
    duration_id bigint NOT NULL
);
    DROP TABLE public.hourly_jobs;
       public         heap r       postgres    false            �            1259    19694 
   job_skills    TABLE     u   CREATE TABLE public.job_skills (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    skill_id bigint NOT NULL
);
    DROP TABLE public.job_skills;
       public         heap r       postgres    false            �            1259    19693    job_skills_id_seq    SEQUENCE     z   CREATE SEQUENCE public.job_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.job_skills_id_seq;
       public               postgres    false    240            �           0    0    job_skills_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.job_skills_id_seq OWNED BY public.job_skills.id;
          public               postgres    false    239            �            1259    19634    jobs    TABLE     �  CREATE TABLE public.jobs (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    role_id bigint NOT NULL,
    experience_level_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    scope character varying(255) NOT NULL,
    english_level_id bigint,
    number_of_hires integer DEFAULT 1 NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_viewed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT jobs_scope_check CHECK (((scope)::text = ANY ((ARRAY['one-time'::character varying, 'ongoing'::character varying, 'complex'::character varying])::text[]))),
    CONSTRAINT jobs_type_check CHECK (((type)::text = ANY ((ARRAY['hourly'::character varying, 'fixed-price'::character varying])::text[])))
);
    DROP TABLE public.jobs;
       public         heap r       postgres    false            �            1259    19633    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public               postgres    false    236            �           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public               postgres    false    235            �            1259    19535 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap r       postgres    false            �            1259    19534    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public               postgres    false    218            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public               postgres    false    217            �            1259    19711 	   proposals    TABLE     c  CREATE TABLE public.proposals (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    user_id bigint NOT NULL,
    bid_amount numeric(8,2) NOT NULL,
    duration_id bigint,
    letter text NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(255) NOT NULL,
    interview_date date,
    interview_time time without time zone,
    CONSTRAINT proposals_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'interviewed'::character varying, 'accepted'::character varying, 'rejected'::character varying])::text[])))
);
    DROP TABLE public.proposals;
       public         heap r       postgres    false            �            1259    19710    proposals_id_seq    SEQUENCE     y   CREATE SEQUENCE public.proposals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.proposals_id_seq;
       public               postgres    false    242            �           0    0    proposals_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.proposals_id_seq OWNED BY public.proposals.id;
          public               postgres    false    241            �            1259    19549    role_categories    TABLE     j   CREATE TABLE public.role_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);
 #   DROP TABLE public.role_categories;
       public         heap r       postgres    false            �            1259    19548    role_categories_id_seq    SEQUENCE        CREATE SEQUENCE public.role_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.role_categories_id_seq;
       public               postgres    false    222            �           0    0    role_categories_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.role_categories_id_seq OWNED BY public.role_categories.id;
          public               postgres    false    221            �            1259    19556    roles    TABLE     �   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    role_category_id bigint NOT NULL
);
    DROP TABLE public.roles;
       public         heap r       postgres    false            �            1259    19555    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public               postgres    false    224            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public               postgres    false    223            �            1259    19756    sessions    TABLE     �   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap r       postgres    false            �            1259    19542    skills    TABLE     a   CREATE TABLE public.skills (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.skills;
       public         heap r       postgres    false            �            1259    19541    skills_id_seq    SEQUENCE     v   CREATE SEQUENCE public.skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.skills_id_seq;
       public               postgres    false    220            �           0    0    skills_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;
          public               postgres    false    219            �            1259    19617    user_skills    TABLE     w   CREATE TABLE public.user_skills (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    skill_id bigint NOT NULL
);
    DROP TABLE public.user_skills;
       public         heap r       postgres    false            �            1259    19616    user_skills_id_seq    SEQUENCE     {   CREATE SEQUENCE public.user_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_skills_id_seq;
       public               postgres    false    234            �           0    0    user_skills_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_skills_id_seq OWNED BY public.user_skills.id;
          public               postgres    false    233            �            1259    19593    users    TABLE     -  CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying(255) NOT NULL,
    middle_name character varying(255),
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    contact_number character varying NOT NULL,
    password character varying(255) NOT NULL,
    desc_title character varying(255),
    desc_text text,
    experience_level_id bigint,
    english_level_id bigint,
    hourly_rate numeric(8,2),
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    19592    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    232            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    231            �           2604    19740    contracts id    DEFAULT     l   ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);
 ;   ALTER TABLE public.contracts ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    243    244    244            �           2604    19589    durations id    DEFAULT     l   ALTER TABLE ONLY public.durations ALTER COLUMN id SET DEFAULT nextval('public.durations_id_seq'::regclass);
 ;   ALTER TABLE public.durations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    19580    english_levels id    DEFAULT     v   ALTER TABLE ONLY public.english_levels ALTER COLUMN id SET DEFAULT nextval('public.english_levels_id_seq'::regclass);
 @   ALTER TABLE public.english_levels ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    19571    experience_levels id    DEFAULT     |   ALTER TABLE ONLY public.experience_levels ALTER COLUMN id SET DEFAULT nextval('public.experience_levels_id_seq'::regclass);
 C   ALTER TABLE public.experience_levels ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    19697    job_skills id    DEFAULT     n   ALTER TABLE ONLY public.job_skills ALTER COLUMN id SET DEFAULT nextval('public.job_skills_id_seq'::regclass);
 <   ALTER TABLE public.job_skills ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    239    240    240            �           2604    19637    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    236    235    236            �           2604    19538    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    19714    proposals id    DEFAULT     l   ALTER TABLE ONLY public.proposals ALTER COLUMN id SET DEFAULT nextval('public.proposals_id_seq'::regclass);
 ;   ALTER TABLE public.proposals ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    242    242            �           2604    19552    role_categories id    DEFAULT     x   ALTER TABLE ONLY public.role_categories ALTER COLUMN id SET DEFAULT nextval('public.role_categories_id_seq'::regclass);
 A   ALTER TABLE public.role_categories ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    19559    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    19545 	   skills id    DEFAULT     f   ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);
 8   ALTER TABLE public.skills ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    19620    user_skills id    DEFAULT     p   ALTER TABLE ONLY public.user_skills ALTER COLUMN id SET DEFAULT nextval('public.user_skills_id_seq'::regclass);
 =   ALTER TABLE public.user_skills ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    233    234    234            �           2604    19596    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    231    232            �          0    19737 	   contracts 
   TABLE DATA           �   COPY public.contracts (id, job_id, user_id, pay_amount, created_at, is_completed, client_rating, client_feedback, talent_rating, talent_feedback) FROM stdin;
    public               postgres    false    244   ϛ       �          0    19586 	   durations 
   TABLE DATA           -   COPY public.durations (id, name) FROM stdin;
    public               postgres    false    230   �       �          0    19577    english_levels 
   TABLE DATA           ?   COPY public.english_levels (id, name, description) FROM stdin;
    public               postgres    false    228   ]�       �          0    19568    experience_levels 
   TABLE DATA           B   COPY public.experience_levels (id, name, description) FROM stdin;
    public               postgres    false    226   T�       �          0    19683    fixed_price_jobs 
   TABLE DATA           5   COPY public.fixed_price_jobs (id, price) FROM stdin;
    public               postgres    false    238   �       �          0    19668    hourly_jobs 
   TABLE DATA           ^   COPY public.hourly_jobs (id, rate_min, rate_max, weekly_hours_limit, duration_id) FROM stdin;
    public               postgres    false    237   �       �          0    19694 
   job_skills 
   TABLE DATA           :   COPY public.job_skills (id, job_id, skill_id) FROM stdin;
    public               postgres    false    240   8�       �          0    19634    jobs 
   TABLE DATA           �   COPY public.jobs (id, title, description, role_id, experience_level_id, type, scope, english_level_id, number_of_hires, user_id, created_at, last_viewed_at, is_active) FROM stdin;
    public               postgres    false    236   U�       �          0    19535 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public               postgres    false    218   �       �          0    19711 	   proposals 
   TABLE DATA           �   COPY public.proposals (id, job_id, user_id, bid_amount, duration_id, letter, created_at, status, interview_date, interview_time) FROM stdin;
    public               postgres    false    242   (�       �          0    19549    role_categories 
   TABLE DATA           3   COPY public.role_categories (id, name) FROM stdin;
    public               postgres    false    222   Ԡ       �          0    19556    roles 
   TABLE DATA           ;   COPY public.roles (id, name, role_category_id) FROM stdin;
    public               postgres    false    224   x�       �          0    19756    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public               postgres    false    245   ��       �          0    19542    skills 
   TABLE DATA           *   COPY public.skills (id, name) FROM stdin;
    public               postgres    false    220   ڣ       �          0    19617    user_skills 
   TABLE DATA           <   COPY public.user_skills (id, user_id, skill_id) FROM stdin;
    public               postgres    false    234   �       �          0    19593    users 
   TABLE DATA           �   COPY public.users (id, first_name, middle_name, last_name, email, contact_number, password, desc_title, desc_text, experience_level_id, english_level_id, hourly_rate, created_at) FROM stdin;
    public               postgres    false    232   �       �           0    0    contracts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.contracts_id_seq', 4, true);
          public               postgres    false    243            �           0    0    durations_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.durations_id_seq', 4, true);
          public               postgres    false    229            �           0    0    english_levels_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.english_levels_id_seq', 4, true);
          public               postgres    false    227            �           0    0    experience_levels_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.experience_levels_id_seq', 3, true);
          public               postgres    false    225            �           0    0    job_skills_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.job_skills_id_seq', 1, false);
          public               postgres    false    239            �           0    0    jobs_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.jobs_id_seq', 3, true);
          public               postgres    false    235            �           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 16, true);
          public               postgres    false    217            �           0    0    proposals_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.proposals_id_seq', 7, true);
          public               postgres    false    241            �           0    0    role_categories_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.role_categories_id_seq', 8, true);
          public               postgres    false    221            �           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 40, true);
          public               postgres    false    223            �           0    0    skills_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.skills_id_seq', 50, true);
          public               postgres    false    219            �           0    0    user_skills_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_skills_id_seq', 5, true);
          public               postgres    false    233            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
          public               postgres    false    231                       2606    19745    contracts contracts_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.contracts DROP CONSTRAINT contracts_pkey;
       public                 postgres    false    244            �           2606    19591    durations durations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.durations
    ADD CONSTRAINT durations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.durations DROP CONSTRAINT durations_pkey;
       public                 postgres    false    230            �           2606    19584 "   english_levels english_levels_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.english_levels
    ADD CONSTRAINT english_levels_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.english_levels DROP CONSTRAINT english_levels_pkey;
       public                 postgres    false    228            �           2606    19575 (   experience_levels experience_levels_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.experience_levels
    ADD CONSTRAINT experience_levels_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.experience_levels DROP CONSTRAINT experience_levels_pkey;
       public                 postgres    false    226                        2606    19687 &   fixed_price_jobs fixed_price_jobs_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.fixed_price_jobs
    ADD CONSTRAINT fixed_price_jobs_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.fixed_price_jobs DROP CONSTRAINT fixed_price_jobs_pkey;
       public                 postgres    false    238            �           2606    19677    hourly_jobs hourly_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hourly_jobs
    ADD CONSTRAINT hourly_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.hourly_jobs DROP CONSTRAINT hourly_jobs_pkey;
       public                 postgres    false    237                       2606    19699    job_skills job_skills_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.job_skills
    ADD CONSTRAINT job_skills_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.job_skills DROP CONSTRAINT job_skills_pkey;
       public                 postgres    false    240            �           2606    19647    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public                 postgres    false    236            �           2606    19540    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public                 postgres    false    218                       2606    19720    proposals proposals_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.proposals DROP CONSTRAINT proposals_pkey;
       public                 postgres    false    242            �           2606    19554 $   role_categories role_categories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.role_categories
    ADD CONSTRAINT role_categories_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.role_categories DROP CONSTRAINT role_categories_pkey;
       public                 postgres    false    222            �           2606    19561    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public                 postgres    false    224            	           2606    19762    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public                 postgres    false    245            �           2606    19547    skills skills_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.skills DROP CONSTRAINT skills_pkey;
       public                 postgres    false    220            �           2606    19622    user_skills user_skills_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_skills DROP CONSTRAINT user_skills_pkey;
       public                 postgres    false    234            �           2606    19767 !   users users_contact_number_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_contact_number_unique UNIQUE (contact_number);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT users_contact_number_unique;
       public                 postgres    false    232            �           2606    19613    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public                 postgres    false    232            �           2606    19601    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    232                       1259    19764    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public                 postgres    false    245            
           1259    19763    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public                 postgres    false    245                       2606    19746 "   contracts contracts_job_id_foreign    FK CONSTRAINT        ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_job_id_foreign FOREIGN KEY (job_id) REFERENCES public.jobs(id);
 L   ALTER TABLE ONLY public.contracts DROP CONSTRAINT contracts_job_id_foreign;
       public               postgres    false    4860    244    236                       2606    19751 #   contracts contracts_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 M   ALTER TABLE ONLY public.contracts DROP CONSTRAINT contracts_user_id_foreign;
       public               postgres    false    244    232    4856                       2606    19688 ,   fixed_price_jobs fixed_price_jobs_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.fixed_price_jobs
    ADD CONSTRAINT fixed_price_jobs_id_foreign FOREIGN KEY (id) REFERENCES public.jobs(id);
 V   ALTER TABLE ONLY public.fixed_price_jobs DROP CONSTRAINT fixed_price_jobs_id_foreign;
       public               postgres    false    236    238    4860                       2606    19671 +   hourly_jobs hourly_jobs_duration_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.hourly_jobs
    ADD CONSTRAINT hourly_jobs_duration_id_foreign FOREIGN KEY (duration_id) REFERENCES public.durations(id);
 U   ALTER TABLE ONLY public.hourly_jobs DROP CONSTRAINT hourly_jobs_duration_id_foreign;
       public               postgres    false    4850    237    230                       2606    19678 "   hourly_jobs hourly_jobs_id_foreign    FK CONSTRAINT     {   ALTER TABLE ONLY public.hourly_jobs
    ADD CONSTRAINT hourly_jobs_id_foreign FOREIGN KEY (id) REFERENCES public.jobs(id);
 L   ALTER TABLE ONLY public.hourly_jobs DROP CONSTRAINT hourly_jobs_id_foreign;
       public               postgres    false    236    237    4860                       2606    19700 $   job_skills job_skills_job_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_skills
    ADD CONSTRAINT job_skills_job_id_foreign FOREIGN KEY (job_id) REFERENCES public.jobs(id);
 N   ALTER TABLE ONLY public.job_skills DROP CONSTRAINT job_skills_job_id_foreign;
       public               postgres    false    236    4860    240                       2606    19705 &   job_skills job_skills_skill_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_skills
    ADD CONSTRAINT job_skills_skill_id_foreign FOREIGN KEY (skill_id) REFERENCES public.skills(id);
 P   ALTER TABLE ONLY public.job_skills DROP CONSTRAINT job_skills_skill_id_foreign;
       public               postgres    false    220    4840    240                       2606    19658 "   jobs jobs_english_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_english_level_id_foreign FOREIGN KEY (english_level_id) REFERENCES public.english_levels(id);
 L   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_english_level_id_foreign;
       public               postgres    false    228    236    4848                       2606    19653 %   jobs jobs_experience_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_experience_level_id_foreign FOREIGN KEY (experience_level_id) REFERENCES public.experience_levels(id);
 O   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_experience_level_id_foreign;
       public               postgres    false    236    4846    226                       2606    19648    jobs jobs_role_id_foreign    FK CONSTRAINT     x   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id);
 C   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_role_id_foreign;
       public               postgres    false    224    236    4844                       2606    19663    jobs jobs_user_id_foreign    FK CONSTRAINT     x   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 C   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_user_id_foreign;
       public               postgres    false    232    236    4856                       2606    19892 '   proposals proposals_duration_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_duration_id_foreign FOREIGN KEY (duration_id) REFERENCES public.durations(id);
 Q   ALTER TABLE ONLY public.proposals DROP CONSTRAINT proposals_duration_id_foreign;
       public               postgres    false    230    242    4850                       2606    19721 "   proposals proposals_job_id_foreign    FK CONSTRAINT        ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_job_id_foreign FOREIGN KEY (job_id) REFERENCES public.jobs(id);
 L   ALTER TABLE ONLY public.proposals DROP CONSTRAINT proposals_job_id_foreign;
       public               postgres    false    242    4860    236                       2606    19726 #   proposals proposals_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 M   ALTER TABLE ONLY public.proposals DROP CONSTRAINT proposals_user_id_foreign;
       public               postgres    false    4856    242    232                       2606    19562 $   roles roles_role_category_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_category_id_foreign FOREIGN KEY (role_category_id) REFERENCES public.role_categories(id);
 N   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_role_category_id_foreign;
       public               postgres    false    222    224    4842                       2606    19628 (   user_skills user_skills_skill_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_skill_id_foreign FOREIGN KEY (skill_id) REFERENCES public.skills(id);
 R   ALTER TABLE ONLY public.user_skills DROP CONSTRAINT user_skills_skill_id_foreign;
       public               postgres    false    4840    234    220                       2606    19623 '   user_skills user_skills_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.user_skills DROP CONSTRAINT user_skills_user_id_foreign;
       public               postgres    false    4856    232    234                       2606    19607 $   users users_english_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_english_level_id_foreign FOREIGN KEY (english_level_id) REFERENCES public.english_levels(id);
 N   ALTER TABLE ONLY public.users DROP CONSTRAINT users_english_level_id_foreign;
       public               postgres    false    228    232    4848                       2606    19602 '   users users_experience_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_experience_level_id_foreign FOREIGN KEY (experience_level_id) REFERENCES public.experience_levels(id);
 Q   ALTER TABLE ONLY public.users DROP CONSTRAINT users_experience_level_id_foreign;
       public               postgres    false    226    4846    232            �   4   x�3�4�4�455�30�4202�50�5�P02�24�22�L��#�=... �	�      �   :   x�3��I-.V(�H�S0T���+��2�4�5�����9Mt�`N���T�j�`� ��      �   �   x���MN�@�יS� �	�'`�̸��cG󓨷�I7�+v���g��<\�r> 3��p�f-���B����N'����4�V�5�?0����]:is�Wڷ�P;�����~�*W�����p>���V���;+��<��Qzr��0�gV�8v�rs ��z�]MĦ�gj��ex3]��#�q�Gm{��D��h�s~D�
��k����(QC�zO������B��[��      �      x�]�Q
�0����sA=C
����B�-�Z��A|~>�:��9��	�Y\��`|�g��weN�zs��I���(+Q��b����¢��P���н��0O�Xh�}A,!�ˇ��}=�wɟ<`      �      x�3�42500�30������ �t      �      x�3�425�30�45 S��\1z\\\ 4Q�      �      x������ � �      �   �   x�m��� �sy
^ lsG���G/�!���`I���c<�^���Up��d.1p�'����� 
4�SɏhL���J������R՚v�f�4���|N?���� =Q_}L����G?�K�1�7��!kH]&�- ��.h������nq�Xs=����W״�Ѫ�!�c/05J�      �     x�e�Mn� �u|���'��Ri��iB��;Jo_g��S	Y,��G��"�4(4��F��&�V���ϸN7O�$�W#�L���v��Q�(�ah#j9H���G�%���f �C���ݻ���+K�J�ļ�iu1Tܟ��%�eJj�B�Ǒ��=~�[u �P�/�����G8��r/�qI��H������Q�/).1O��\�c�6�5Mvmt�s?
A#��3�|*��� ���-s[%����;�.�Pv�]��@g�      �   �   x�e�Q
�0�����F�Q:{���{�]Ă�c�&�� ����$?�o��k�%�w�W�3����ɒ
�������m�6�GҞzo4�y�<�4�('�#�۔�/�2�9T��%�^����o�	����t���ۑ�!��G�����Z��t�;.      �   �   x�%���0Dk�W�J��MqHHP%�eVf�����|?&�3�fiN8aL〬�����I����GA�4!�ͅر��ާ�J`c��@3Y���ve�(l͙1�T�g����";s��"�M�"�Zߝ|p�<�����^�X/$�� ��7�      �   5  x�mS�n�0}��B_0ė��[ѡ��X_��ʜ-D�I�����9$}xH�P��YU���Ď>Hێ��4�`��<����0�öq�%���xe�t;(���IS�Ҡ�����nQ�F#����|���xU�1�%Kx�U@'�*}��+8Y�8�H�������v��38�o�1e@Sg8�Z�V�Γ4�o��獵g/���^4!R9<\/�����V�W��Ty��T�9lzv�|,���.`��LŽ�`M-� NEA��+�t	e�*�/�A}�(���y��lH�+����}�1���&1�^H6FI���w�uw�JW��X��l��m��y�e�75�D.�|��W��r9&��(�D�d�v��;��*��p�Y4sؖ�X�g��G3er/+j��F�"ɖ�D5��N���;��:)��z�"�g7��j9���t��9X&yvϸ3���a�j^l=Ax���4�LP���U�H���=ˊ�C\�ѯp�ܴ�4N�d���>[(������Uw҈`�#�Qh;i��`�!�q�3oD_���4��������}���K�$ *o�      �      x������ � �      �   �  x�eT�V�0]K_�UW�ď Y�(��&�n��਱%=B�����@ڥgFs�-�ykd#>�����N�S+�F����Vi��࢑�P�`sid-�����&`�T�x��%�������n� ��%(�!�5�҈%x��/ط�'>���0���� ����̓��+�����
�NS�+��]�ȻBU>���2�
�]�F��m!�Nm�q����NÛ�YƦ�m��a��1�˺&ZYΦ��"���[Ů�����0���ITV���6��������d�Ϟxv���TI����~�KV9�v�4��Iz³+v��Z��lm�x]cf���6Z���Z���8��6�*��%��Ey�o��D�<^b��lA ���W�Zǈ�y�lM�{����5��!����1�0�_�먛A��Jv�#����l�w����D93�[p��Wl�`��*	�?�A9'e63�jr��(M��XR�Xq#�v����/�+h�/F�X�vH덯���L��M�*�zG�A�6�m�]�8-tu\)�^��x�NY�q����������B��}:��kt���
v�:���61������-���^Û�؄=Bx�nK��>@�/z9b׍U[�6gB�n��<J��2Cp��U���`�4�K7P�,٩�8Iǟ�@�4_������1�	/�S����%/�9!>���Q
.�L����N�^�c���ѵ'[Y�O���[������� �����_Tև      �   '   x�3�4�4�2��\Ɯ朆f\& ��Ds��qqq ^��      �   �  x�u�ˎ�@��u�.�6֕�jP�o(����DAAi�&��drNm΢��`�Of��>0��� �y}�s�(��x������0��4ڸn#��h�wjň�9\��r_�Ҳ��������Ű��K檛����+�1}Y1{���F�5�
��}�=?5�2&IM�ȞG�E7*`����O-ך^M����黍�&���(�����jHc�*�	x]d)������a��o�$�!��I�w"y��;_�e��K<��oI� �tN�6,��4wX��+����4�Lb-5,i�Yz���'j.i�\Q�K�F��/T�A:znUp[u�c���;�E�B�y��r&���)�*�mv���^��a&�9�A/�5l��3@��~+a�$eV���\��itm�޿^
A����o�fHd=o�N��B��tcO�Np�ݹeE7�J���&����
�"n|�[��yH3?�HnA�51>DA� �C��     