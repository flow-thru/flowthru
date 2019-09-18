--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1.pgdg90+1)
-- Dumped by pg_dump version 11.5

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
-- Name: check_in; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.check_in (
    event_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    organization_id bigint
);


--
-- Name: event_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_admin (
    event_id bigint NOT NULL,
    admin_id bigint NOT NULL
);


--
-- Name: event_form; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_form (
    id bigint NOT NULL,
    event_id bigint NOT NULL
);


--
-- Name: event_form_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_form_id_seq OWNED BY public.event_form.id;


--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: event_invitation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_invitation (
    event_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


--
-- Name: event_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_notification (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


--
-- Name: event_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_notification_id_seq OWNED BY public.event_notification.id;


--
-- Name: event_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_tag (
    event_id bigint NOT NULL,
    tag text NOT NULL
);


--
-- Name: follow; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follow (
    follower_id bigint NOT NULL,
    following_id bigint NOT NULL
);


--
-- Name: organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization (
    id bigint NOT NULL,
    owner_id bigint NOT NULL
);


--
-- Name: organization_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_admin (
    organization_id bigint NOT NULL,
    admin_id bigint NOT NULL
);


--
-- Name: organization_form_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_form_template (
    id bigint NOT NULL,
    organization_id bigint NOT NULL
);


--
-- Name: organization_form_template_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_form_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_form_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_form_template_id_seq OWNED BY public.organization_form_template.id;


--
-- Name: organization_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_id_seq OWNED BY public.organization.id;


--
-- Name: organization_invitation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_invitation (
    organization_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


--
-- Name: organization_join_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_join_request (
    requester_id bigint NOT NULL,
    organization_id bigint NOT NULL
);


--
-- Name: organization_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_member (
    organization_id bigint NOT NULL,
    member_id bigint NOT NULL
);


--
-- Name: organization_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_notification (
    id bigint NOT NULL,
    organization_id bigint NOT NULL,
    receiver_id bigint NOT NULL
);


--
-- Name: organization_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_notification_id_seq OWNED BY public.organization_notification.id;


--
-- Name: organization_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_tag (
    organization_id bigint NOT NULL,
    tag text NOT NULL
);


--
-- Name: rsvp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rsvp (
    event_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    assigner_id bigint NOT NULL,
    assignee_id bigint NOT NULL
);


--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- Name: terms_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.terms_conditions (
    id integer NOT NULL,
    name text,
    content text
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id bigint NOT NULL
);


--
-- Name: user_email; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_email (
    email text NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: user_form_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_form_template (
    id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: user_form_template_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_form_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_form_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_form_template_id_seq OWNED BY public.user_form_template.id;


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: event_form id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_form ALTER COLUMN id SET DEFAULT nextval('public.event_form_id_seq'::regclass);


--
-- Name: event_notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification ALTER COLUMN id SET DEFAULT nextval('public.event_notification_id_seq'::regclass);


--
-- Name: organization id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization ALTER COLUMN id SET DEFAULT nextval('public.organization_id_seq'::regclass);


--
-- Name: organization_form_template id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_form_template ALTER COLUMN id SET DEFAULT nextval('public.organization_form_template_id_seq'::regclass);


--
-- Name: organization_notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification ALTER COLUMN id SET DEFAULT nextval('public.organization_notification_id_seq'::regclass);


--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_form_template id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_form_template ALTER COLUMN id SET DEFAULT nextval('public.user_form_template_id_seq'::regclass);


--
-- Name: check_in check_in_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_pkey PRIMARY KEY (user_id, event_id);


--
-- Name: event_admin event_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_admin
    ADD CONSTRAINT event_admin_pkey PRIMARY KEY (admin_id, event_id);


--
-- Name: event_form event_form_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_form
    ADD CONSTRAINT event_form_pkey PRIMARY KEY (id, event_id);


--
-- Name: event_invitation event_invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_invitation
    ADD CONSTRAINT event_invitation_pkey PRIMARY KEY (event_id, receiver_id);


--
-- Name: event_notification event_notification_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_pkey1 PRIMARY KEY (id, event_id, receiver_id);


--
-- Name: event event_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey1 PRIMARY KEY (id);


--
-- Name: event_tag event_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_pkey PRIMARY KEY (event_id, tag);


--
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (follower_id, following_id);


--
-- Name: organization_admin organization_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_admin
    ADD CONSTRAINT organization_admin_pkey PRIMARY KEY (organization_id, admin_id);


--
-- Name: organization_form_template organization_form_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_form_template
    ADD CONSTRAINT organization_form_template_pkey PRIMARY KEY (id, organization_id);


--
-- Name: organization_invitation organization_invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitation
    ADD CONSTRAINT organization_invitation_pkey PRIMARY KEY (organization_id, receiver_id);


--
-- Name: organization_join_request organization_join_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_join_request
    ADD CONSTRAINT organization_join_request_pkey PRIMARY KEY (requester_id, organization_id);


--
-- Name: organization_member organization_member_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_member
    ADD CONSTRAINT organization_member_pkey PRIMARY KEY (organization_id, member_id);


--
-- Name: organization_notification organization_notification_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT organization_notification_pkey1 PRIMARY KEY (id, organization_id, receiver_id);


--
-- Name: organization organization_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey1 PRIMARY KEY (id);


--
-- Name: organization_tag organization_tag_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_tag
    ADD CONSTRAINT organization_tag_pkey1 PRIMARY KEY (tag, organization_id);


--
-- Name: rsvp rsvp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvp
    ADD CONSTRAINT rsvp_pkey PRIMARY KEY (event_id, user_id);


--
-- Name: task task_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey1 PRIMARY KEY (id, event_id, assigner_id, assignee_id);


--
-- Name: terms_conditions terms_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms_conditions
    ADD CONSTRAINT terms_conditions_pkey PRIMARY KEY (id);


--
-- Name: user_email user_email_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_email
    ADD CONSTRAINT user_email_pkey PRIMARY KEY (email, user_id);


--
-- Name: user_form_template user_form_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_form_template
    ADD CONSTRAINT user_form_template_pkey PRIMARY KEY (id, user_id);


--
-- Name: user user_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey1 PRIMARY KEY (id);


--
-- Name: check_in check_in_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: check_in check_in_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: event_admin event_admin_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_admin
    ADD CONSTRAINT event_admin_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public."user"(id);


--
-- Name: event_admin event_admin_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_admin
    ADD CONSTRAINT event_admin_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: event_form event_form_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_form
    ADD CONSTRAINT event_form_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: event_invitation event_invitation_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_invitation
    ADD CONSTRAINT event_invitation_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: event_invitation event_invitation_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_invitation
    ADD CONSTRAINT event_invitation_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- Name: event_notification event_notification_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: event_notification event_notification_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- Name: event event_organization_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_organization_id_fkey1 FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: event event_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(id);


--
-- Name: event_tag event_tag_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: follow follow_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public."user"(id);


--
-- Name: follow follow_following_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_following_id_fkey FOREIGN KEY (following_id) REFERENCES public."user"(id);


--
-- Name: organization_admin organization_admin_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_admin
    ADD CONSTRAINT organization_admin_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public."user"(id);


--
-- Name: organization_admin organization_admin_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_admin
    ADD CONSTRAINT organization_admin_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_form_template organization_form_template_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_form_template
    ADD CONSTRAINT organization_form_template_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_invitation organization_invitation_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitation
    ADD CONSTRAINT organization_invitation_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_invitation organization_invitation_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitation
    ADD CONSTRAINT organization_invitation_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- Name: organization_join_request organization_join_request_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_join_request
    ADD CONSTRAINT organization_join_request_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_join_request organization_join_request_requester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_join_request
    ADD CONSTRAINT organization_join_request_requester_id_fkey FOREIGN KEY (requester_id) REFERENCES public."user"(id);


--
-- Name: organization_member organization_member_member_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_member
    ADD CONSTRAINT organization_member_member_id_fkey1 FOREIGN KEY (member_id) REFERENCES public."user"(id);


--
-- Name: organization_member organization_member_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_member
    ADD CONSTRAINT organization_member_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_notification organization_notification_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT organization_notification_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_notification organization_notification_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT organization_notification_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- Name: organization organization_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(id);


--
-- Name: organization_tag organization_tag_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_tag
    ADD CONSTRAINT organization_tag_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: rsvp rsvp_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvp
    ADD CONSTRAINT rsvp_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: rsvp rsvp_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvp
    ADD CONSTRAINT rsvp_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: task task_assignee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_assignee_id_fkey FOREIGN KEY (assignee_id) REFERENCES public."user"(id);


--
-- Name: task task_assigner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_assigner_id_fkey FOREIGN KEY (assigner_id) REFERENCES public."user"(id);


--
-- Name: task task_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: user_email user_email_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_email
    ADD CONSTRAINT user_email_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: user_form_template user_form_template_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_form_template
    ADD CONSTRAINT user_form_template_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

