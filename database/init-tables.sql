--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1.pgdg90+1)
-- Dumped by pg_dump version 11.5

-- Started on 2019-09-20 02:59:31 PDT

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

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: check_in; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.check_in (
    event_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    organization_id bigint
);


--
-- TOC entry 198 (class 1259 OID 16391)
-- Name: event_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_admin (
    event_id bigint NOT NULL,
    admin_id bigint NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 16394)
-- Name: event_form; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_form (
    id bigint NOT NULL,
    event_id bigint NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 16397)
-- Name: event_form_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 200
-- Name: event_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_form_id_seq OWNED BY public.event_form.id;


--
-- TOC entry 201 (class 1259 OID 16399)
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 201
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- TOC entry 202 (class 1259 OID 16401)
-- Name: event_invitation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_invitation (
    event_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 16404)
-- Name: event_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_notification (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16407)
-- Name: event_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 204
-- Name: event_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_notification_id_seq OWNED BY public.event_notification.id;


--
-- TOC entry 205 (class 1259 OID 16409)
-- Name: event_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_tag (
    event_id bigint NOT NULL,
    tag text NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 16415)
-- Name: follow; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follow (
    follower_id bigint NOT NULL,
    following_id bigint NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 16418)
-- Name: organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name text NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 16421)
-- Name: organization_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_admin (
    organization_id bigint NOT NULL,
    admin_id bigint NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 16424)
-- Name: organization_form_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_form_template (
    id bigint NOT NULL,
    organization_id bigint NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 16427)
-- Name: organization_form_template_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_form_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 210
-- Name: organization_form_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_form_template_id_seq OWNED BY public.organization_form_template.id;


--
-- TOC entry 211 (class 1259 OID 16429)
-- Name: organization_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 211
-- Name: organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_id_seq OWNED BY public.organization.id;


--
-- TOC entry 212 (class 1259 OID 16431)
-- Name: organization_invitation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_invitation (
    organization_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 16434)
-- Name: organization_join_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_join_request (
    requester_id bigint NOT NULL,
    organization_id bigint NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 16437)
-- Name: organization_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_member (
    organization_id bigint NOT NULL,
    member_id bigint NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 16440)
-- Name: organization_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_notification (
    id bigint NOT NULL,
    organization_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 16443)
-- Name: organization_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 216
-- Name: organization_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_notification_id_seq OWNED BY public.organization_notification.id;


--
-- TOC entry 217 (class 1259 OID 16445)
-- Name: organization_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_tag (
    organization_id bigint NOT NULL,
    tag text NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16451)
-- Name: rsvp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rsvp (
    event_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 16454)
-- Name: task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    assigner_id bigint NOT NULL,
    assignee_id bigint NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16457)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 220
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- TOC entry 221 (class 1259 OID 16459)
-- Name: terms_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.terms_conditions (
    id integer NOT NULL,
    name text,
    content text
);


--
-- TOC entry 222 (class 1259 OID 16465)
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    first_name text NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16468)
-- Name: user_email; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_email (
    email text NOT NULL,
    user_id bigint NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 16474)
-- Name: user_form_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_form_template (
    id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 16477)
-- Name: user_form_template_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_form_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 225
-- Name: user_form_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_form_template_id_seq OWNED BY public.user_form_template.id;


--
-- TOC entry 226 (class 1259 OID 16479)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 226
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 2846 (class 2604 OID 16481)
-- Name: event id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- TOC entry 2847 (class 2604 OID 16482)
-- Name: event_form id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_form ALTER COLUMN id SET DEFAULT nextval('public.event_form_id_seq'::regclass);


--
-- TOC entry 2848 (class 2604 OID 16483)
-- Name: event_notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification ALTER COLUMN id SET DEFAULT nextval('public.event_notification_id_seq'::regclass);


--
-- TOC entry 2849 (class 2604 OID 16484)
-- Name: organization id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization ALTER COLUMN id SET DEFAULT nextval('public.organization_id_seq'::regclass);


--
-- TOC entry 2850 (class 2604 OID 16485)
-- Name: organization_form_template id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_form_template ALTER COLUMN id SET DEFAULT nextval('public.organization_form_template_id_seq'::regclass);


--
-- TOC entry 2851 (class 2604 OID 16486)
-- Name: organization_notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification ALTER COLUMN id SET DEFAULT nextval('public.organization_notification_id_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 16487)
-- Name: task id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- TOC entry 2853 (class 2604 OID 16488)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 16489)
-- Name: user_form_template id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_form_template ALTER COLUMN id SET DEFAULT nextval('public.user_form_template_id_seq'::regclass);


--
-- TOC entry 2856 (class 2606 OID 16491)
-- Name: check_in check_in_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_pkey PRIMARY KEY (user_id, event_id);


--
-- TOC entry 2860 (class 2606 OID 16493)
-- Name: event_admin event_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_admin
    ADD CONSTRAINT event_admin_pkey PRIMARY KEY (admin_id, event_id);


--
-- TOC entry 2862 (class 2606 OID 16495)
-- Name: event_form event_form_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_form
    ADD CONSTRAINT event_form_pkey PRIMARY KEY (id, event_id);


--
-- TOC entry 2864 (class 2606 OID 16497)
-- Name: event_invitation event_invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_invitation
    ADD CONSTRAINT event_invitation_pkey PRIMARY KEY (event_id, receiver_id);


--
-- TOC entry 2866 (class 2606 OID 16499)
-- Name: event_notification event_notification_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_pkey1 PRIMARY KEY (id, event_id, receiver_id);


--
-- TOC entry 2858 (class 2606 OID 16501)
-- Name: event event_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey1 PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 16503)
-- Name: event_tag event_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_pkey PRIMARY KEY (event_id, tag);


--
-- TOC entry 2870 (class 2606 OID 16505)
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (follower_id, following_id);


--
-- TOC entry 2874 (class 2606 OID 16507)
-- Name: organization_admin organization_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_admin
    ADD CONSTRAINT organization_admin_pkey PRIMARY KEY (organization_id, admin_id);


--
-- TOC entry 2876 (class 2606 OID 16509)
-- Name: organization_form_template organization_form_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_form_template
    ADD CONSTRAINT organization_form_template_pkey PRIMARY KEY (id, organization_id);


--
-- TOC entry 2878 (class 2606 OID 16511)
-- Name: organization_invitation organization_invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitation
    ADD CONSTRAINT organization_invitation_pkey PRIMARY KEY (organization_id, receiver_id);


--
-- TOC entry 2880 (class 2606 OID 16513)
-- Name: organization_join_request organization_join_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_join_request
    ADD CONSTRAINT organization_join_request_pkey PRIMARY KEY (requester_id, organization_id);


--
-- TOC entry 2882 (class 2606 OID 16515)
-- Name: organization_member organization_member_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_member
    ADD CONSTRAINT organization_member_pkey PRIMARY KEY (organization_id, member_id);


--
-- TOC entry 2884 (class 2606 OID 16517)
-- Name: organization_notification organization_notification_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT organization_notification_pkey1 PRIMARY KEY (id, organization_id, receiver_id);


--
-- TOC entry 2872 (class 2606 OID 16519)
-- Name: organization organization_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey1 PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 16521)
-- Name: organization_tag organization_tag_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_tag
    ADD CONSTRAINT organization_tag_pkey1 PRIMARY KEY (tag, organization_id);


--
-- TOC entry 2888 (class 2606 OID 16523)
-- Name: rsvp rsvp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvp
    ADD CONSTRAINT rsvp_pkey PRIMARY KEY (event_id, user_id);


--
-- TOC entry 2890 (class 2606 OID 16525)
-- Name: task task_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey1 PRIMARY KEY (id, event_id, assigner_id, assignee_id);


--
-- TOC entry 2892 (class 2606 OID 16527)
-- Name: terms_conditions terms_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms_conditions
    ADD CONSTRAINT terms_conditions_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 16529)
-- Name: user_email user_email_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_email
    ADD CONSTRAINT user_email_pkey PRIMARY KEY (email, user_id);


--
-- TOC entry 2898 (class 2606 OID 16531)
-- Name: user_form_template user_form_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_form_template
    ADD CONSTRAINT user_form_template_pkey PRIMARY KEY (id, user_id);


--
-- TOC entry 2894 (class 2606 OID 16533)
-- Name: user user_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey1 PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 16534)
-- Name: check_in check_in_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 2900 (class 2606 OID 16539)
-- Name: check_in check_in_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 2903 (class 2606 OID 16544)
-- Name: event_admin event_admin_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_admin
    ADD CONSTRAINT event_admin_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public."user"(id);


--
-- TOC entry 2904 (class 2606 OID 16549)
-- Name: event_admin event_admin_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_admin
    ADD CONSTRAINT event_admin_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 2905 (class 2606 OID 16554)
-- Name: event_form event_form_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_form
    ADD CONSTRAINT event_form_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 2906 (class 2606 OID 16559)
-- Name: event_invitation event_invitation_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_invitation
    ADD CONSTRAINT event_invitation_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 2907 (class 2606 OID 16564)
-- Name: event_invitation event_invitation_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_invitation
    ADD CONSTRAINT event_invitation_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- TOC entry 2908 (class 2606 OID 16569)
-- Name: event_notification event_notification_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 2909 (class 2606 OID 16574)
-- Name: event_notification event_notification_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- TOC entry 2901 (class 2606 OID 16579)
-- Name: event event_organization_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_organization_id_fkey1 FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 2902 (class 2606 OID 16584)
-- Name: event event_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(id);


--
-- TOC entry 2910 (class 2606 OID 16589)
-- Name: event_tag event_tag_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 2911 (class 2606 OID 16594)
-- Name: follow follow_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public."user"(id);


--
-- TOC entry 2912 (class 2606 OID 16599)
-- Name: follow follow_following_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_following_id_fkey FOREIGN KEY (following_id) REFERENCES public."user"(id);


--
-- TOC entry 2914 (class 2606 OID 16604)
-- Name: organization_admin organization_admin_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_admin
    ADD CONSTRAINT organization_admin_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public."user"(id);


--
-- TOC entry 2915 (class 2606 OID 16609)
-- Name: organization_admin organization_admin_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_admin
    ADD CONSTRAINT organization_admin_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 2916 (class 2606 OID 16614)
-- Name: organization_form_template organization_form_template_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_form_template
    ADD CONSTRAINT organization_form_template_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 2917 (class 2606 OID 16619)
-- Name: organization_invitation organization_invitation_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitation
    ADD CONSTRAINT organization_invitation_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 2918 (class 2606 OID 16624)
-- Name: organization_invitation organization_invitation_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitation
    ADD CONSTRAINT organization_invitation_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- TOC entry 2919 (class 2606 OID 16629)
-- Name: organization_join_request organization_join_request_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_join_request
    ADD CONSTRAINT organization_join_request_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 2920 (class 2606 OID 16634)
-- Name: organization_join_request organization_join_request_requester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_join_request
    ADD CONSTRAINT organization_join_request_requester_id_fkey FOREIGN KEY (requester_id) REFERENCES public."user"(id);


--
-- TOC entry 2921 (class 2606 OID 16639)
-- Name: organization_member organization_member_member_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_member
    ADD CONSTRAINT organization_member_member_id_fkey1 FOREIGN KEY (member_id) REFERENCES public."user"(id);


--
-- TOC entry 2922 (class 2606 OID 16644)
-- Name: organization_member organization_member_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_member
    ADD CONSTRAINT organization_member_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 2923 (class 2606 OID 16649)
-- Name: organization_notification organization_notification_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT organization_notification_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 2924 (class 2606 OID 16654)
-- Name: organization_notification organization_notification_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT organization_notification_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- TOC entry 2913 (class 2606 OID 16659)
-- Name: organization organization_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(id);


--
-- TOC entry 2925 (class 2606 OID 16664)
-- Name: organization_tag organization_tag_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_tag
    ADD CONSTRAINT organization_tag_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 2926 (class 2606 OID 16669)
-- Name: rsvp rsvp_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvp
    ADD CONSTRAINT rsvp_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 2927 (class 2606 OID 16674)
-- Name: rsvp rsvp_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvp
    ADD CONSTRAINT rsvp_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 2928 (class 2606 OID 16679)
-- Name: task task_assignee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_assignee_id_fkey FOREIGN KEY (assignee_id) REFERENCES public."user"(id);


--
-- TOC entry 2929 (class 2606 OID 16684)
-- Name: task task_assigner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_assigner_id_fkey FOREIGN KEY (assigner_id) REFERENCES public."user"(id);


--
-- TOC entry 2930 (class 2606 OID 16689)
-- Name: task task_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 2931 (class 2606 OID 16694)
-- Name: user_email user_email_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_email
    ADD CONSTRAINT user_email_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 2932 (class 2606 OID 16699)
-- Name: user_form_template user_form_template_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_form_template
    ADD CONSTRAINT user_form_template_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2019-09-20 02:59:36 PDT

--
-- PostgreSQL database dump complete
--

