--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-09-15 13:54:48 PDT

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

SET default_with_oids = false;

--
-- TOC entry 212 (class 1259 OID 16614)
-- Name: check_in; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.check_in (
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 16393)
-- Name: event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    organization_id integer NOT NULL,
    name text NOT NULL,
    description text,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    rsvp_message text,
    open boolean,
    capacity integer,
    public boolean,
    views integer,
    check_in_id integer NOT NULL,
    city text,
    state text,
    street text,
    zip text,
    unit text,
    building text
);


--
-- TOC entry 214 (class 1259 OID 16640)
-- Name: event_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_admin (
    event_id integer NOT NULL,
    admin_id integer NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 16535)
-- Name: event_invitation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_invitation (
    event_id integer NOT NULL,
    receiver_id integer NOT NULL,
    accepted boolean
);


--
-- TOC entry 200 (class 1259 OID 16437)
-- Name: event_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_notification (
    event_id integer NOT NULL,
    receiver_id integer NOT NULL,
    id integer NOT NULL,
    message text,
    read boolean
);


--
-- TOC entry 217 (class 1259 OID 16676)
-- Name: event_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_tag (
    event_tag integer NOT NULL,
    tag integer NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 16496)
-- Name: event_terms_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_terms_conditions (
    id integer NOT NULL,
    event_id integer NOT NULL,
    name text,
    content text,
    required boolean NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 16574)
-- Name: follow; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follow (
    follower_id integer NOT NULL,
    following_id integer NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 16401)
-- Name: organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    name text NOT NULL,
    description text,
    email text NOT NULL,
    capacity integer,
    open boolean,
    public boolean,
    views integer,
    city text,
    state text
);


--
-- TOC entry 210 (class 1259 OID 16587)
-- Name: organization_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_admin (
    organization_id integer NOT NULL,
    admin_id integer NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 16548)
-- Name: organization_invitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_invitations (
    organization_id integer NOT NULL,
    invitee_id integer NOT NULL,
    accepted boolean
);


--
-- TOC entry 208 (class 1259 OID 16561)
-- Name: organization_join_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_join_request (
    organization_id integer NOT NULL,
    requester_id integer NOT NULL,
    approved boolean
);


--
-- TOC entry 211 (class 1259 OID 16600)
-- Name: organization_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_member (
    organization_id integer NOT NULL,
    member_id integer NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 16455)
-- Name: organization_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_notification (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    receiver_id integer NOT NULL,
    message text,
    read boolean
);


--
-- TOC entry 216 (class 1259 OID 16666)
-- Name: organization_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_tag (
    organization_id integer NOT NULL,
    tag integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 16522)
-- Name: organization_terms_conditions_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_terms_conditions_template (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    name text,
    content text
);


--
-- TOC entry 213 (class 1259 OID 16627)
-- Name: rsvp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rsvp (
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 16473)
-- Name: task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task (
    id integer NOT NULL,
    event_id integer NOT NULL,
    assigner_id integer NOT NULL,
    assignee_id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- TOC entry 199 (class 1259 OID 16424)
-- Name: terms_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.terms_conditions (
    id integer NOT NULL,
    name text,
    content text
);


--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    primary_email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    first_name text,
    middle_name text,
    last_name text,
    biography text,
    profile_photo text,
    online boolean
);


--
-- TOC entry 215 (class 1259 OID 16653)
-- Name: user_email; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_email (
    email text NOT NULL,
    user_id integer NOT NULL,
    verified boolean
);


--
-- TOC entry 204 (class 1259 OID 16509)
-- Name: user_terms_conditions_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_terms_conditions_template (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name text,
    content text
);


--
-- TOC entry 3345 (class 0 OID 16614)
-- Dependencies: 212
-- Data for Name: check_in; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3330 (class 0 OID 16393)
-- Dependencies: 197
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3347 (class 0 OID 16640)
-- Dependencies: 214
-- Data for Name: event_admin; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3339 (class 0 OID 16535)
-- Dependencies: 206
-- Data for Name: event_invitation; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3333 (class 0 OID 16437)
-- Dependencies: 200
-- Data for Name: event_notification; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3350 (class 0 OID 16676)
-- Dependencies: 217
-- Data for Name: event_tag; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3336 (class 0 OID 16496)
-- Dependencies: 203
-- Data for Name: event_terms_conditions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3342 (class 0 OID 16574)
-- Dependencies: 209
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3331 (class 0 OID 16401)
-- Dependencies: 198
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3343 (class 0 OID 16587)
-- Dependencies: 210
-- Data for Name: organization_admin; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3340 (class 0 OID 16548)
-- Dependencies: 207
-- Data for Name: organization_invitations; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3341 (class 0 OID 16561)
-- Dependencies: 208
-- Data for Name: organization_join_request; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3344 (class 0 OID 16600)
-- Dependencies: 211
-- Data for Name: organization_member; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3334 (class 0 OID 16455)
-- Dependencies: 201
-- Data for Name: organization_notification; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3349 (class 0 OID 16666)
-- Dependencies: 216
-- Data for Name: organization_tag; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3338 (class 0 OID 16522)
-- Dependencies: 205
-- Data for Name: organization_terms_conditions_template; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3346 (class 0 OID 16627)
-- Dependencies: 213
-- Data for Name: rsvp; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3335 (class 0 OID 16473)
-- Dependencies: 202
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3332 (class 0 OID 16424)
-- Dependencies: 199
-- Data for Name: terms_conditions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3329 (class 0 OID 16385)
-- Dependencies: 196
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3348 (class 0 OID 16653)
-- Dependencies: 215
-- Data for Name: user_email; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3337 (class 0 OID 16509)
-- Dependencies: 204
-- Data for Name: user_terms_conditions_template; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3157 (class 2606 OID 16444)
-- Name: event_notification event_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3151 (class 2606 OID 16400)
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 3173 (class 2606 OID 16680)
-- Name: event_tag event_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_pkey PRIMARY KEY (tag);


--
-- TOC entry 3163 (class 2606 OID 16503)
-- Name: event_terms_conditions event_terms_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_terms_conditions
    ADD CONSTRAINT event_terms_conditions_pkey PRIMARY KEY (id);


--
-- TOC entry 3159 (class 2606 OID 16462)
-- Name: organization_notification organization_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT organization_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3153 (class 2606 OID 16408)
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- TOC entry 3171 (class 2606 OID 16670)
-- Name: organization_tag organization_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_tag
    ADD CONSTRAINT organization_tag_pkey PRIMARY KEY (tag);


--
-- TOC entry 3167 (class 2606 OID 16529)
-- Name: organization_terms_conditions_template organization_terms_conditions_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_terms_conditions_template
    ADD CONSTRAINT organization_terms_conditions_template_pkey PRIMARY KEY (id);


--
-- TOC entry 3161 (class 2606 OID 16480)
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- TOC entry 3155 (class 2606 OID 16431)
-- Name: terms_conditions terms_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms_conditions
    ADD CONSTRAINT terms_conditions_pkey PRIMARY KEY (id);


--
-- TOC entry 3169 (class 2606 OID 16660)
-- Name: user_email user_email_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_email
    ADD CONSTRAINT user_email_pkey PRIMARY KEY (email);


--
-- TOC entry 3149 (class 2606 OID 16392)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3165 (class 2606 OID 16516)
-- Name: user_terms_conditions_template user_terms_conditions_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_terms_conditions_template
    ADD CONSTRAINT user_terms_conditions_template_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16595)
-- Name: organization_admin admin_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_admin
    ADD CONSTRAINT admin_id FOREIGN KEY (admin_id) REFERENCES public."user"(id);


--
-- TOC entry 3204 (class 2606 OID 16648)
-- Name: event_admin admin_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_admin
    ADD CONSTRAINT admin_id FOREIGN KEY (admin_id) REFERENCES public."user"(id);


--
-- TOC entry 3183 (class 2606 OID 16491)
-- Name: task assignee_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT assignee_id FOREIGN KEY (assignee_id) REFERENCES public."user"(id);


--
-- TOC entry 3182 (class 2606 OID 16486)
-- Name: task assigner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT assigner_id FOREIGN KEY (assigner_id) REFERENCES public."user"(id);


--
-- TOC entry 3176 (class 2606 OID 16409)
-- Name: organization event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT event_id FOREIGN KEY (owner_id) REFERENCES public."user"(id);


--
-- TOC entry 3177 (class 2606 OID 16445)
-- Name: event_notification event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 3181 (class 2606 OID 16481)
-- Name: task event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 3184 (class 2606 OID 16504)
-- Name: event_terms_conditions event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_terms_conditions
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 3199 (class 2606 OID 16617)
-- Name: check_in event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 3201 (class 2606 OID 16630)
-- Name: rsvp event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvp
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 3203 (class 2606 OID 16643)
-- Name: event_admin event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_admin
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 3188 (class 2606 OID 16686)
-- Name: event_invitation event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_invitation
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- TOC entry 3175 (class 2606 OID 16432)
-- Name: event event_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 3207 (class 2606 OID 16681)
-- Name: event_tag event_tag; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag FOREIGN KEY (event_tag) REFERENCES public.event(id);


--
-- TOC entry 3193 (class 2606 OID 16577)
-- Name: follow follower_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follower_id FOREIGN KEY (follower_id) REFERENCES public."user"(id);


--
-- TOC entry 3194 (class 2606 OID 16582)
-- Name: follow following_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT following_id FOREIGN KEY (following_id) REFERENCES public."user"(id);


--
-- TOC entry 3190 (class 2606 OID 16556)
-- Name: organization_invitations invitee_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitations
    ADD CONSTRAINT invitee_id FOREIGN KEY (invitee_id) REFERENCES public."user"(id);


--
-- TOC entry 3179 (class 2606 OID 16463)
-- Name: organization_notification organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT organization_id FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 3186 (class 2606 OID 16530)
-- Name: organization_terms_conditions_template organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_terms_conditions_template
    ADD CONSTRAINT organization_id FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 3189 (class 2606 OID 16551)
-- Name: organization_invitations organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_invitations
    ADD CONSTRAINT organization_id FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 3191 (class 2606 OID 16564)
-- Name: organization_join_request organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_join_request
    ADD CONSTRAINT organization_id FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 3195 (class 2606 OID 16590)
-- Name: organization_admin organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_admin
    ADD CONSTRAINT organization_id FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 3197 (class 2606 OID 16603)
-- Name: organization_member organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_member
    ADD CONSTRAINT organization_id FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 3206 (class 2606 OID 16671)
-- Name: organization_tag organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_tag
    ADD CONSTRAINT organization_id FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- TOC entry 3198 (class 2606 OID 16608)
-- Name: organization_member organization_member_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_member
    ADD CONSTRAINT organization_member_member_id_fkey FOREIGN KEY (member_id) REFERENCES public."user"(id);


--
-- TOC entry 3174 (class 2606 OID 16414)
-- Name: event owner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT owner_id FOREIGN KEY (owner_id) REFERENCES public."user"(id);


--
-- TOC entry 3178 (class 2606 OID 16450)
-- Name: event_notification receiver_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT receiver_id FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- TOC entry 3180 (class 2606 OID 16468)
-- Name: organization_notification receiver_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_notification
    ADD CONSTRAINT receiver_id FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- TOC entry 3187 (class 2606 OID 16543)
-- Name: event_invitation receiver_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_invitation
    ADD CONSTRAINT receiver_id FOREIGN KEY (receiver_id) REFERENCES public."user"(id);


--
-- TOC entry 3192 (class 2606 OID 16569)
-- Name: organization_join_request requester_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_join_request
    ADD CONSTRAINT requester_id FOREIGN KEY (requester_id) REFERENCES public."user"(id);


--
-- TOC entry 3185 (class 2606 OID 16517)
-- Name: user_terms_conditions_template user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_terms_conditions_template
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3200 (class 2606 OID 16622)
-- Name: check_in user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3202 (class 2606 OID 16635)
-- Name: rsvp user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvp
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3205 (class 2606 OID 16661)
-- Name: user_email user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_email
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2019-09-15 13:54:48 PDT

--
-- PostgreSQL database dump complete
--

