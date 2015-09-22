--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE activity (
    id text NOT NULL,
    "timestamp" timestamp without time zone,
    user_id text,
    object_id text,
    revision_id text,
    activity_type text,
    data text
);


ALTER TABLE public.activity OWNER TO ckan_default;

--
-- Name: activity_detail; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE activity_detail (
    id text NOT NULL,
    activity_id text,
    object_id text,
    object_type text,
    activity_type text,
    data text
);


ALTER TABLE public.activity_detail OWNER TO ckan_default;

--
-- Name: authorization_group; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE authorization_group (
    id text NOT NULL,
    name text,
    created timestamp without time zone
);


ALTER TABLE public.authorization_group OWNER TO ckan_default;

--
-- Name: authorization_group_role; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE authorization_group_role (
    user_object_role_id text NOT NULL,
    authorization_group_id text
);


ALTER TABLE public.authorization_group_role OWNER TO ckan_default;

--
-- Name: authorization_group_user; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE authorization_group_user (
    authorization_group_id text NOT NULL,
    user_id text NOT NULL,
    id text NOT NULL
);


ALTER TABLE public.authorization_group_user OWNER TO ckan_default;

--
-- Name: dashboard; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE dashboard (
    user_id text NOT NULL,
    activity_stream_last_viewed timestamp without time zone NOT NULL,
    email_last_sent timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone NOT NULL
);


ALTER TABLE public.dashboard OWNER TO ckan_default;

--
-- Name: group; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE "group" (
    id text NOT NULL,
    name text NOT NULL,
    title text,
    description text,
    created timestamp without time zone,
    state text,
    revision_id text,
    type text NOT NULL,
    approval_status text,
    image_url text,
    is_organization boolean DEFAULT false
);


ALTER TABLE public."group" OWNER TO ckan_default;

--
-- Name: group_extra; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE group_extra (
    id text NOT NULL,
    group_id text,
    key text,
    value text,
    state text,
    revision_id text
);


ALTER TABLE public.group_extra OWNER TO ckan_default;

--
-- Name: group_extra_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE group_extra_revision (
    id text NOT NULL,
    group_id text,
    key text,
    value text,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.group_extra_revision OWNER TO ckan_default;

--
-- Name: group_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE group_revision (
    id text NOT NULL,
    name text NOT NULL,
    title text,
    description text,
    created timestamp without time zone,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    type text NOT NULL,
    approval_status text,
    image_url text,
    is_organization boolean DEFAULT false
);


ALTER TABLE public.group_revision OWNER TO ckan_default;

--
-- Name: group_role; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE group_role (
    user_object_role_id text NOT NULL,
    group_id text
);


ALTER TABLE public.group_role OWNER TO ckan_default;

--
-- Name: harvest_gather_error; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE harvest_gather_error (
    id text NOT NULL,
    harvest_job_id text,
    message text,
    created timestamp without time zone
);


ALTER TABLE public.harvest_gather_error OWNER TO ckan_default;

--
-- Name: harvest_job; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE harvest_job (
    id text NOT NULL,
    created timestamp without time zone,
    gather_started timestamp without time zone,
    gather_finished timestamp without time zone,
    finished timestamp without time zone,
    source_id text,
    status text NOT NULL
);


ALTER TABLE public.harvest_job OWNER TO ckan_default;

--
-- Name: harvest_object; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE harvest_object (
    id text NOT NULL,
    guid text,
    current boolean,
    gathered timestamp without time zone,
    fetch_started timestamp without time zone,
    content text,
    fetch_finished timestamp without time zone,
    import_started timestamp without time zone,
    import_finished timestamp without time zone,
    state text,
    metadata_modified_date timestamp without time zone,
    retry_times integer,
    harvest_job_id text,
    harvest_source_id text,
    package_id text,
    report_status text
);


ALTER TABLE public.harvest_object OWNER TO ckan_default;

--
-- Name: harvest_object_error; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE harvest_object_error (
    id text NOT NULL,
    harvest_object_id text,
    message text,
    stage text,
    line integer,
    created timestamp without time zone
);


ALTER TABLE public.harvest_object_error OWNER TO ckan_default;

--
-- Name: harvest_object_extra; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE harvest_object_extra (
    id text NOT NULL,
    harvest_object_id text,
    key text,
    value text
);


ALTER TABLE public.harvest_object_extra OWNER TO ckan_default;

--
-- Name: harvest_source; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE harvest_source (
    id text NOT NULL,
    url text NOT NULL,
    title text,
    description text,
    config text,
    created timestamp without time zone,
    type text NOT NULL,
    active boolean,
    user_id text,
    publisher_id text,
    frequency text,
    next_run timestamp without time zone
);


ALTER TABLE public.harvest_source OWNER TO ckan_default;

--
-- Name: member; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE member (
    id text NOT NULL,
    table_id text NOT NULL,
    group_id text,
    state text,
    revision_id text,
    table_name text NOT NULL,
    capacity text NOT NULL
);


ALTER TABLE public.member OWNER TO ckan_default;

--
-- Name: member_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE member_revision (
    id text NOT NULL,
    table_id text NOT NULL,
    group_id text,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    table_name text NOT NULL,
    capacity text NOT NULL
);


ALTER TABLE public.member_revision OWNER TO ckan_default;

--
-- Name: migrate_version; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE migrate_version (
    repository_id character varying(250) NOT NULL,
    repository_path text,
    version integer
);


ALTER TABLE public.migrate_version OWNER TO ckan_default;

--
-- Name: package; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    title text,
    version character varying(100),
    url text,
    notes text,
    license_id text,
    revision_id text,
    author text,
    author_email text,
    maintainer text,
    maintainer_email text,
    state text,
    type text,
    owner_org text,
    private boolean DEFAULT false,
    metadata_modified timestamp without time zone,
    creator_user_id text
);


ALTER TABLE public.package OWNER TO ckan_default;

--
-- Name: package_extra; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package_extra (
    id text NOT NULL,
    package_id text,
    key text,
    value text,
    revision_id text,
    state text
);


ALTER TABLE public.package_extra OWNER TO ckan_default;

--
-- Name: package_extra_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package_extra_revision (
    id text NOT NULL,
    package_id text,
    key text,
    value text,
    revision_id text NOT NULL,
    continuity_id text,
    state text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_extra_revision OWNER TO ckan_default;

--
-- Name: package_relationship; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package_relationship (
    id text NOT NULL,
    subject_package_id text,
    object_package_id text,
    type text,
    comment text,
    revision_id text,
    state text
);


ALTER TABLE public.package_relationship OWNER TO ckan_default;

--
-- Name: package_relationship_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package_relationship_revision (
    id text NOT NULL,
    subject_package_id text,
    object_package_id text,
    type text,
    comment text,
    revision_id text NOT NULL,
    continuity_id text,
    state text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_relationship_revision OWNER TO ckan_default;

--
-- Name: package_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package_revision (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    title text,
    version character varying(100),
    url text,
    notes text,
    license_id text,
    revision_id text NOT NULL,
    continuity_id text,
    author text,
    author_email text,
    maintainer text,
    maintainer_email text,
    state text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    type text,
    owner_org text,
    private boolean DEFAULT false,
    metadata_modified timestamp without time zone,
    creator_user_id text
);


ALTER TABLE public.package_revision OWNER TO ckan_default;

--
-- Name: package_role; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package_role (
    user_object_role_id text NOT NULL,
    package_id text
);


ALTER TABLE public.package_role OWNER TO ckan_default;

--
-- Name: package_tag; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package_tag (
    id text NOT NULL,
    package_id text,
    tag_id text,
    revision_id text,
    state text
);


ALTER TABLE public.package_tag OWNER TO ckan_default;

--
-- Name: package_tag_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE package_tag_revision (
    id text NOT NULL,
    package_id text,
    tag_id text,
    revision_id text NOT NULL,
    continuity_id text,
    state text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_tag_revision OWNER TO ckan_default;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE rating (
    id text NOT NULL,
    user_id text,
    user_ip_address text,
    package_id text,
    rating double precision,
    created timestamp without time zone
);


ALTER TABLE public.rating OWNER TO ckan_default;

--
-- Name: related; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE related (
    id text NOT NULL,
    type text NOT NULL,
    title text,
    description text,
    image_url text,
    url text,
    created timestamp without time zone,
    owner_id text,
    view_count integer DEFAULT 0 NOT NULL,
    featured integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.related OWNER TO ckan_default;

--
-- Name: related_dataset; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE related_dataset (
    id text NOT NULL,
    dataset_id text NOT NULL,
    related_id text NOT NULL,
    status text
);


ALTER TABLE public.related_dataset OWNER TO ckan_default;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE resource (
    id text NOT NULL,
    url text NOT NULL,
    format text,
    description text,
    "position" integer,
    revision_id text,
    hash text,
    state text,
    extras text,
    name text,
    resource_type text,
    mimetype text,
    mimetype_inner text,
    size bigint,
    last_modified timestamp without time zone,
    cache_url text,
    cache_last_updated timestamp without time zone,
    webstore_url text,
    webstore_last_updated timestamp without time zone,
    created timestamp without time zone,
    url_type text,
    package_id text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.resource OWNER TO ckan_default;

--
-- Name: resource_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE resource_revision (
    id text NOT NULL,
    url text NOT NULL,
    format text,
    description text,
    "position" integer,
    revision_id text NOT NULL,
    continuity_id text,
    hash text,
    state text,
    extras text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    name text,
    resource_type text,
    mimetype text,
    mimetype_inner text,
    size bigint,
    last_modified timestamp without time zone,
    cache_url text,
    cache_last_updated timestamp without time zone,
    webstore_url text,
    webstore_last_updated timestamp without time zone,
    created timestamp without time zone,
    url_type text,
    package_id text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.resource_revision OWNER TO ckan_default;

--
-- Name: resource_view; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE resource_view (
    id text NOT NULL,
    resource_id text,
    title text,
    description text,
    view_type text NOT NULL,
    "order" integer NOT NULL,
    config text
);


ALTER TABLE public.resource_view OWNER TO ckan_default;

--
-- Name: revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE revision (
    id text NOT NULL,
    "timestamp" timestamp without time zone,
    author character varying(200),
    message text,
    state text,
    approved_timestamp timestamp without time zone
);


ALTER TABLE public.revision OWNER TO ckan_default;

--
-- Name: role_action; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE role_action (
    id text NOT NULL,
    role text,
    context text NOT NULL,
    action text
);


ALTER TABLE public.role_action OWNER TO ckan_default;

--
-- Name: system_info; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE system_info (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value text,
    revision_id text
);


ALTER TABLE public.system_info OWNER TO ckan_default;

--
-- Name: system_info_id_seq; Type: SEQUENCE; Schema: public; Owner: ckan_default
--

CREATE SEQUENCE system_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_info_id_seq OWNER TO ckan_default;

--
-- Name: system_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ckan_default
--

ALTER SEQUENCE system_info_id_seq OWNED BY system_info.id;


--
-- Name: system_info_revision; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE system_info_revision (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value text,
    revision_id text NOT NULL,
    continuity_id integer
);


ALTER TABLE public.system_info_revision OWNER TO ckan_default;

--
-- Name: system_info_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: ckan_default
--

CREATE SEQUENCE system_info_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_info_revision_id_seq OWNER TO ckan_default;

--
-- Name: system_info_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ckan_default
--

ALTER SEQUENCE system_info_revision_id_seq OWNED BY system_info_revision.id;


--
-- Name: system_role; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE system_role (
    user_object_role_id text NOT NULL
);


ALTER TABLE public.system_role OWNER TO ckan_default;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE tag (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    vocabulary_id character varying(100)
);


ALTER TABLE public.tag OWNER TO ckan_default;

--
-- Name: task_status; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE task_status (
    id text NOT NULL,
    entity_id text NOT NULL,
    entity_type text NOT NULL,
    task_type text NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    state text,
    error text,
    last_updated timestamp without time zone
);


ALTER TABLE public.task_status OWNER TO ckan_default;

--
-- Name: term_translation; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE term_translation (
    term text NOT NULL,
    term_translation text NOT NULL,
    lang_code text NOT NULL
);


ALTER TABLE public.term_translation OWNER TO ckan_default;

--
-- Name: tracking_raw; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE tracking_raw (
    user_key character varying(100) NOT NULL,
    url text NOT NULL,
    tracking_type character varying(10) NOT NULL,
    access_timestamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tracking_raw OWNER TO ckan_default;

--
-- Name: tracking_summary; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE tracking_summary (
    url text NOT NULL,
    package_id text,
    tracking_type character varying(10) NOT NULL,
    count integer NOT NULL,
    running_total integer DEFAULT 0 NOT NULL,
    recent_views integer DEFAULT 0 NOT NULL,
    tracking_date date
);


ALTER TABLE public.tracking_summary OWNER TO ckan_default;

--
-- Name: user; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE "user" (
    id text NOT NULL,
    name text NOT NULL,
    apikey text,
    created timestamp without time zone,
    about text,
    openid text,
    password text,
    fullname text,
    email text,
    reset_key text,
    sysadmin boolean DEFAULT false,
    activity_streams_email_notifications boolean DEFAULT false,
    state text DEFAULT 'active'::text NOT NULL
);


ALTER TABLE public."user" OWNER TO ckan_default;

--
-- Name: user_following_dataset; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE user_following_dataset (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_dataset OWNER TO ckan_default;

--
-- Name: user_following_group; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE user_following_group (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_group OWNER TO ckan_default;

--
-- Name: user_following_user; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE user_following_user (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_user OWNER TO ckan_default;

--
-- Name: user_object_role; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE user_object_role (
    id text NOT NULL,
    user_id text,
    context text NOT NULL,
    role text,
    authorized_group_id text
);


ALTER TABLE public.user_object_role OWNER TO ckan_default;

--
-- Name: vocabulary; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE vocabulary (
    id text NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.vocabulary OWNER TO ckan_default;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY system_info ALTER COLUMN id SET DEFAULT nextval('system_info_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY system_info_revision ALTER COLUMN id SET DEFAULT nextval('system_info_revision_id_seq'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY activity (id, "timestamp", user_id, object_id, revision_id, activity_type, data) FROM stdin;
2ea64861-2ecd-4aa0-bfac-b05100a230ef	2015-08-25 13:04:04.081361	082dec4d-1b01-4463-886e-6bb9e5b3a69a	082dec4d-1b01-4463-886e-6bb9e5b3a69a	\N	new user	\N
42709354-c45e-41f4-bb3a-83b34138643c	2015-08-25 13:04:08.385366	af084126-f711-4016-a585-70354e997796	af084126-f711-4016-a585-70354e997796	\N	new user	\N
c92932a2-375b-4f79-a448-139a1f0d55db	2015-08-25 13:47:23.763886	082dec4d-1b01-4463-886e-6bb9e5b3a69a	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	d0771be4-1558-4509-9417-4f58de851f86	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Population', 'de': u'Bev\\\\xf6lkerung', 'en': u'Population', 'it': u'Popolazione'}", "created": "2015-08-25T13:47:23.668582", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "d0771be4-1558-4509-9417-4f58de851f86", "type": "group", "id": "64d3b89b-ff79-477e-8fb4-9cfc388b0f58", "name": "bevoelkerung"}}
6a9190fb-c0d4-45fd-96cb-ac8858701e7b	2015-08-25 13:48:08.009429	082dec4d-1b01-4463-886e-6bb9e5b3a69a	27b314a5-57b6-4c4e-9c9f-6923365eaecc	1c095545-1d23-4082-aa02-7a9c424cfa8c	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Espace', 'de': u'Raum', 'en': u'Space', 'it': u'Spazio'}", "created": "2015-08-25T13:48:07.986487", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "1c095545-1d23-4082-aa02-7a9c424cfa8c", "type": "group", "id": "27b314a5-57b6-4c4e-9c9f-6923365eaecc", "name": "raum"}}
7f92f65f-9403-481d-a1e8-bb90b5f78eac	2015-08-25 13:48:43.361708	082dec4d-1b01-4463-886e-6bb9e5b3a69a	73124d1e-c2aa-4d20-a42d-fa71b8946e93	49919ce1-2be8-45c8-89e3-81c22d977777	new organization	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Swisstopo FR\\", \\"de\\": \\"Swisstopo DE\\", \\"en\\": \\"Swisstopo EN\\", \\"it\\": \\"Swisstopo IT\\"}", "created": "2015-08-25T13:48:43.297824", "approval_status": "approved", "is_organization": true, "state": "active", "image_url": "", "revision_id": "49919ce1-2be8-45c8-89e3-81c22d977777", "type": "organization", "id": "73124d1e-c2aa-4d20-a42d-fa71b8946e93", "name": "swisstopo"}}
9c1bdb7b-ec3e-43a7-b96e-93a94203dd02	2015-08-25 13:57:41.911373	082dec4d-1b01-4463-886e-6bb9e5b3a69a	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	c4b8d128-e3b5-439d-8244-5e8fcce20613	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Travail, r\\\\xe9mun\\\\xe9ration', 'de': u'Arbeit, Erwerb', 'en': u'Work and income', 'it': u'Lavoro e reddito'}", "created": "2015-08-25T13:57:41.607386", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "c4b8d128-e3b5-439d-8244-5e8fcce20613", "type": "group", "id": "33ab70dd-e2da-464a-ae5f-b166f16d9e2c", "name": "arbeit"}}
9fb78780-d5c7-42a9-8dee-84bc65c23c05	2015-08-25 13:58:14.432852	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7d52132f-7119-41ab-b2b8-e62d69a834ce	d9eb027c-b163-453b-aa63-3bd148d8a8de	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Construction, logement', 'de': u'Bau- und Wohnungswesen', 'en': u'', 'it': u''}", "created": "2015-08-25T13:58:14.424398", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "d9eb027c-b163-453b-aa63-3bd148d8a8de", "type": "group", "id": "7d52132f-7119-41ab-b2b8-e62d69a834ce", "name": "bauwesen"}}
d6793eee-4cbc-4fa0-8abc-e7497f4029cb	2015-08-25 13:58:48.443219	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afcb4a2a-b4b0-4d7c-984a-9078e964be49	b93a5949-5ca7-4188-ace6-1d7352c40c11	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Education, science', 'de': u'Bildung, Wissenschaft', 'en': u'Education and science', 'it': u'Formazione e scienza'}", "created": "2015-08-25T13:58:48.432831", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "b93a5949-5ca7-4188-ace6-1d7352c40c11", "type": "group", "id": "afcb4a2a-b4b0-4d7c-984a-9078e964be49", "name": "bildung"}}
72de852e-412b-4e41-8921-1439fa8552c1	2015-08-25 13:59:27.514707	082dec4d-1b01-4463-886e-6bb9e5b3a69a	42f56f74-074e-4cbb-b91b-deeb1fd58c56	a0ecd1b2-bac8-4696-9a65-815b2b705d95	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Energie', 'de': u'Energie', 'en': u'Energy', 'it': u'Energia'}", "created": "2015-08-25T13:59:27.505141", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "a0ecd1b2-bac8-4696-9a65-815b2b705d95", "type": "group", "id": "42f56f74-074e-4cbb-b91b-deeb1fd58c56", "name": "energie"}}
6bde6d5e-8134-4069-ad26-c2ba4d3006d9	2015-08-25 13:59:55.207995	082dec4d-1b01-4463-886e-6bb9e5b3a69a	79cbe120-e9c6-4249-b934-58ca980606d7	56c995aa-ab6b-4828-9710-2fe49c13d76b	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Finances', 'de': u'Finanzen', 'en': u'Finances', 'it': u'Finanze'}", "created": "2015-08-25T13:59:55.195808", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "56c995aa-ab6b-4828-9710-2fe49c13d76b", "type": "group", "id": "79cbe120-e9c6-4249-b934-58ca980606d7", "name": "finanzen"}}
6eec8f4d-9513-4882-98cb-08047d2d0417	2015-08-25 14:00:19.767491	082dec4d-1b01-4463-886e-6bb9e5b3a69a	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	c526c9ca-178f-4b91-9d72-3a6ed1609d9b	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'', 'de': u'Geographie', 'en': u'', 'it': u''}", "created": "2015-08-25T14:00:19.757575", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "c526c9ca-178f-4b91-9d72-3a6ed1609d9b", "type": "group", "id": "a20e9d52-0d20-413c-a8ad-9ffd4523bec6", "name": "geographie"}}
6ad48de0-b0f3-43b0-844e-f0aa2f9e1f05	2015-08-25 14:00:48.67733	082dec4d-1b01-4463-886e-6bb9e5b3a69a	28641aa8-b97d-49ed-85bf-c19eb0f729d3	07904a86-1261-45dd-81df-b51627ab8e75	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Legislation', 'de': u'Gesetzgebung', 'en': u'Legislation', 'it': u'Legislazione'}", "created": "2015-08-25T14:00:48.650133", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "07904a86-1261-45dd-81df-b51627ab8e75", "type": "group", "id": "28641aa8-b97d-49ed-85bf-c19eb0f729d3", "name": "gesetzgebung"}}
80f683f0-efd8-4bf2-8aee-c8290e104352	2015-08-25 14:01:18.040029	082dec4d-1b01-4463-886e-6bb9e5b3a69a	90848388-d0b6-4b97-a686-e93b40832e1e	051072fa-f077-46c1-a744-074145df9d03	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Sant\\\\xe9', 'de': u'Gesundheit', 'en': u'Health', 'it': u''}", "created": "2015-08-25T14:01:18.030175", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "051072fa-f077-46c1-a744-074145df9d03", "type": "group", "id": "90848388-d0b6-4b97-a686-e93b40832e1e", "name": "gesundheit"}}
0206b098-8ee3-4a88-9999-f4143046efda	2015-08-25 14:01:43.778211	082dec4d-1b01-4463-886e-6bb9e5b3a69a	dc8b567c-fed8-4696-847b-f85510f93d71	5c8ac240-f49a-4a68-a10b-43346e03ced7	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'', 'de': u'Handel', 'en': u'', 'it': u''}", "created": "2015-08-25T14:01:43.755102", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "5c8ac240-f49a-4a68-a10b-43346e03ced7", "type": "group", "id": "dc8b567c-fed8-4696-847b-f85510f93d71", "name": "handel"}}
e1be580c-1a41-4c13-b2e1-2b58a1c3b850	2015-08-25 14:02:27.075556	082dec4d-1b01-4463-886e-6bb9e5b3a69a	168c842c-fd1f-4180-91ce-1aecaac8f282	bb1f2492-aece-4e79-b7bf-546436441f36	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Industrie, services', 'de': u'Industrie, Dienstleistungen', 'en': u'Industry and services', 'it': u'Industria, servizi'}", "created": "2015-08-25T14:02:27.058390", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "bb1f2492-aece-4e79-b7bf-546436441f36", "type": "group", "id": "168c842c-fd1f-4180-91ce-1aecaac8f282", "name": "industrie"}}
13e72a0a-9ad7-4957-a8ef-80c807ac6d73	2015-08-25 14:03:08.862204	082dec4d-1b01-4463-886e-6bb9e5b3a69a	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	8ae8b593-e003-4d04-9056-05bf5d141bfb	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Criminalit\\\\xe9, droit p\\\\xe9nal', 'de': u'Kriminalit\\\\xe4t, Strafrecht', 'en': u'Crime, criminal justice', 'it': u'Criminalit\\\\xe0, diritto penale'}", "created": "2015-08-25T14:03:08.838883", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "8ae8b593-e003-4d04-9056-05bf5d141bfb", "type": "group", "id": "2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1", "name": "kriminalitaet"}}
1b46546e-f42d-4214-9cb3-cb33295ce163	2015-08-25 14:03:55.980076	082dec4d-1b01-4463-886e-6bb9e5b3a69a	0d77b36f-1de6-40b3-9915-be91ee469f63	dfa3b55e-370c-41f3-a324-e50cc0662b60	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u\\"Culture, m\\\\xe9dias, soci\\\\xe9t\\\\xe9 de l\\\\\\\\'information, sport\\", 'de': u'Kultur, Medien, Informationsgesellschaft, Sport', 'en': u'', 'it': u\\"Cultura, media, societ\\\\xe0 dell\\\\\\\\'informazione, sport\\"}", "created": "2015-08-25T14:03:55.965249", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "dfa3b55e-370c-41f3-a324-e50cc0662b60", "type": "group", "id": "0d77b36f-1de6-40b3-9915-be91ee469f63", "name": "kultur"}}
a7f7138d-fbb8-483c-bc7e-5d4687d3d923	2015-08-25 14:09:59.915517	082dec4d-1b01-4463-886e-6bb9e5b3a69a	c7521678-de76-4731-9075-25d1d6150ecf	a3df1166-3bbb-4209-9088-cb2f00116e1f	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Agriculture, sylviculture', 'de': u'Land- und Forstwirtschaft', 'en': u'Agriculture, forestry', 'it': u'Agricoltura, selvicoltura'}", "created": "2015-08-25T14:09:59.733494", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "a3df1166-3bbb-4209-9088-cb2f00116e1f", "type": "group", "id": "c7521678-de76-4731-9075-25d1d6150ecf", "name": "landwirtschaft"}}
67163abb-7bc7-4677-97a5-d10600367761	2015-08-25 14:10:45.67116	082dec4d-1b01-4463-886e-6bb9e5b3a69a	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	90bb07fc-21e9-46ba-a21f-753b3be3559e	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Mobilit\\\\xe9 et transports', 'de': u'Mobilit\\\\xe4t und Verkehr', 'en': u'Mobility and Transport', 'it': u'Mobilit\\\\xe0 e trasporti'}", "created": "2015-08-25T14:10:45.656859", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "90bb07fc-21e9-46ba-a21f-753b3be3559e", "type": "group", "id": "8c2a33d5-475d-48dd-87b6-7ce5eb2033fa", "name": "mobilitaet"}}
0ed86db0-2a54-443e-89f7-2fd33e931f37	2015-08-25 14:12:43.052949	082dec4d-1b01-4463-886e-6bb9e5b3a69a	620fdda8-a92d-421b-89ad-4ef1b57a9458	922798b8-f459-4134-b1f2-cb5246faf932	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'', 'de': u'\\\\xd6ffentliche Ordnung und Sicherheit', 'en': u'', 'it': u''}", "created": "2015-08-25T14:12:43.038972", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "922798b8-f459-4134-b1f2-cb5246faf932", "type": "group", "id": "620fdda8-a92d-421b-89ad-4ef1b57a9458", "name": "sicherheit"}}
4f884459-ec5f-47ce-95b8-035b2612ba13	2015-08-25 14:13:29.8308	082dec4d-1b01-4463-886e-6bb9e5b3a69a	9beba14c-eab8-426e-89ae-757bc2e6445e	6a7d8874-3d04-40dc-9d41-b12419680a76	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Politique', 'de': u'Politik', 'en': u'', 'it': u'Politica'}", "created": "2015-08-25T14:13:29.816322", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "6a7d8874-3d04-40dc-9d41-b12419680a76", "type": "group", "id": "9beba14c-eab8-426e-89ae-757bc2e6445e", "name": "politik"}}
4c6cf0a7-4159-4663-ab4d-dabe585938db	2015-08-25 14:13:56.118315	082dec4d-1b01-4463-886e-6bb9e5b3a69a	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	95643ea7-62e7-49a5-b45a-7684ebf41c03	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Prix', 'de': u'Preise', 'en': u'Prices', 'it': u'Prezzi'}", "created": "2015-08-25T14:13:56.103902", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "95643ea7-62e7-49a5-b45a-7684ebf41c03", "type": "group", "id": "1deb7a82-612f-46ce-9c62-89c7c0b38ddf", "name": "preise"}}
c6fb0561-777d-48a3-bfe9-09e2bf568799	2015-08-25 14:14:29.374956	082dec4d-1b01-4463-886e-6bb9e5b3a69a	011e8933-7b86-412c-8fe6-752060d8e103	996d9df0-84de-4e44-a818-459e89a069c8	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Protection sociale', 'de': u'Soziale Sicherheit', 'en': u'Social security', 'it': u'Sicurezza sociale'}", "created": "2015-08-25T14:14:29.364706", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "996d9df0-84de-4e44-a818-459e89a069c8", "type": "group", "id": "011e8933-7b86-412c-8fe6-752060d8e103", "name": "soziale-sicherheit"}}
290213d6-8261-4458-b3da-7f3dfc1669ba	2015-08-25 14:15:07.135894	082dec4d-1b01-4463-886e-6bb9e5b3a69a	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	004a195f-0c79-4ea5-a210-1f7ba0f75b3b	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Bases statistiques', 'de': u'Statistische Grundlagen', 'en': u'Statistical basis', 'it': u'Basi statistiche'}", "created": "2015-08-25T14:15:07.102775", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "004a195f-0c79-4ea5-a210-1f7ba0f75b3b", "type": "group", "id": "e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2", "name": "statistische-grundlagen"}}
6c14eb4d-1f97-42c2-811d-86107c137f03	2015-08-25 14:15:32.743769	082dec4d-1b01-4463-886e-6bb9e5b3a69a	6aace7ef-f167-40c9-a0d7-87e7e2681c07	11c2b38a-c6de-4648-9056-156cc3ac6321	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Tourisme', 'de': u'Tourismus', 'en': u'Tourism', 'it': u'Turismo'}", "created": "2015-08-25T14:15:32.725207", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "11c2b38a-c6de-4648-9056-156cc3ac6321", "type": "group", "id": "6aace7ef-f167-40c9-a0d7-87e7e2681c07", "name": "tourismus"}}
52409cbc-0bfc-4ac8-9a0a-816e97819f89	2015-08-25 14:15:57.100008	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	cdafd7cd-5ad2-481d-ac12-2e9004c2852b	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Administration', 'de': u'Verwaltung', 'en': u'Administration', 'it': u'Amministrazione'}", "created": "2015-08-25T14:15:57.072436", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "cdafd7cd-5ad2-481d-ac12-2e9004c2852b", "type": "group", "id": "afc7c340-9bdb-4767-bbcb-70094a1d0dcc", "name": "verwaltung"}}
2da0a109-1f5c-470f-a6c0-d34f00d984ad	2015-08-25 14:16:26.083211	082dec4d-1b01-4463-886e-6bb9e5b3a69a	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	649e4991-0672-40ea-a763-0edead7486f3	new group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{'fr': u'Economie nationale', 'de': u'Volkswirtschaft', 'en': u'National economy', 'it': u'Economia'}", "created": "2015-08-25T14:16:26.069858", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "649e4991-0672-40ea-a763-0edead7486f3", "type": "group", "id": "5389c3f2-2f64-436b-9fac-2d1fc342f7b5", "name": "volkswirtschaft"}}
71d82b79-f579-4641-a200-0ad22ae6b7d4	2015-08-31 11:56:56.659101	082dec4d-1b01-4463-886e-6bb9e5b3a69a	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	5f6a6f73-7dff-4ab9-8fc0-b75916de00ee	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Economie nationale\\", \\"de\\": \\"Volkswirtschaft\\", \\"en\\": \\"National economy\\", \\"it\\": \\"Economia\\"}", "created": "2015-08-25T14:16:26.069858", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "649e4991-0672-40ea-a763-0edead7486f3", "type": "group", "id": "5389c3f2-2f64-436b-9fac-2d1fc342f7b5", "name": "volkswirtschaft"}}
d215a46a-de35-4c6e-b519-5e0a5057b1c1	2015-08-31 11:58:35.513409	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	673f91b5-fb2b-46dc-be95-b88bfde8fcb9	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Administration\\", \\"de\\": \\"Verwaltung\\", \\"en\\": \\"Administration\\", \\"it\\": \\"Amministrazione\\"}", "created": "2015-08-25T14:15:57.072436", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "cdafd7cd-5ad2-481d-ac12-2e9004c2852b", "type": "group", "id": "afc7c340-9bdb-4767-bbcb-70094a1d0dcc", "name": "verwaltung"}}
e1bc70c8-cd0a-4bc9-959c-5bb5db7851d4	2015-08-31 11:58:45.615027	082dec4d-1b01-4463-886e-6bb9e5b3a69a	6aace7ef-f167-40c9-a0d7-87e7e2681c07	358c9eb1-a60c-4b20-a7ad-8487a1d02e17	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Tourisme\\", \\"de\\": \\"Tourismus\\", \\"en\\": \\"Tourism\\", \\"it\\": \\"Turismo\\"}", "created": "2015-08-25T14:15:32.725207", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "11c2b38a-c6de-4648-9056-156cc3ac6321", "type": "group", "id": "6aace7ef-f167-40c9-a0d7-87e7e2681c07", "name": "tourismus"}}
0631a983-6db5-49f3-af49-b628bf7408bc	2015-08-31 11:58:52.601142	082dec4d-1b01-4463-886e-6bb9e5b3a69a	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	fc36ada8-7dfe-4747-9517-e96e0fcfaa8c	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Bases statistiques\\", \\"de\\": \\"Statistische Grundlagen\\", \\"en\\": \\"Statistical basis\\", \\"it\\": \\"Basi statistiche\\"}", "created": "2015-08-25T14:15:07.102775", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "004a195f-0c79-4ea5-a210-1f7ba0f75b3b", "type": "group", "id": "e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2", "name": "statistische-grundlagen"}}
fc1d5fba-0716-43af-bc7c-4090d2d4cdd3	2015-08-31 11:58:59.708392	082dec4d-1b01-4463-886e-6bb9e5b3a69a	011e8933-7b86-412c-8fe6-752060d8e103	83d49224-f922-4467-9d74-d761e2b98cf8	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Protection sociale\\", \\"de\\": \\"Soziale Sicherheit\\", \\"en\\": \\"Social security\\", \\"it\\": \\"Sicurezza sociale\\"}", "created": "2015-08-25T14:14:29.364706", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "996d9df0-84de-4e44-a818-459e89a069c8", "type": "group", "id": "011e8933-7b86-412c-8fe6-752060d8e103", "name": "soziale-sicherheit"}}
6111673a-0ea8-4c38-b1a2-903733ef16cb	2015-08-31 11:59:06.200138	082dec4d-1b01-4463-886e-6bb9e5b3a69a	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	3390c572-dd62-434d-b2d3-f8c4557a4470	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Prix\\", \\"de\\": \\"Preise\\", \\"en\\": \\"Prices\\", \\"it\\": \\"Prezzi\\"}", "created": "2015-08-25T14:13:56.103902", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "95643ea7-62e7-49a5-b45a-7684ebf41c03", "type": "group", "id": "1deb7a82-612f-46ce-9c62-89c7c0b38ddf", "name": "preise"}}
5af2cca9-0cb1-4332-88b5-e421de3f97ae	2015-08-31 11:59:14.019093	082dec4d-1b01-4463-886e-6bb9e5b3a69a	9beba14c-eab8-426e-89ae-757bc2e6445e	f14dfeff-fe1c-4d5e-99e0-8bb7b2f9ddab	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Politique\\", \\"de\\": \\"Politik\\", \\"en\\": \\"\\", \\"it\\": \\"Politica\\"}", "created": "2015-08-25T14:13:29.816322", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "6a7d8874-3d04-40dc-9d41-b12419680a76", "type": "group", "id": "9beba14c-eab8-426e-89ae-757bc2e6445e", "name": "politik"}}
d693cd0c-4b81-4594-8394-2dd51e23f373	2015-08-31 11:59:20.326344	082dec4d-1b01-4463-886e-6bb9e5b3a69a	620fdda8-a92d-421b-89ad-4ef1b57a9458	07dd5069-04bf-4b36-9869-ec93cd5e2b6c	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\\\u00d6ffentliche Ordnung und Sicherheit\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "created": "2015-08-25T14:12:43.038972", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "922798b8-f459-4134-b1f2-cb5246faf932", "type": "group", "id": "620fdda8-a92d-421b-89ad-4ef1b57a9458", "name": "sicherheit"}}
e00bf0d6-9d4a-4e30-af27-564488b10812	2015-08-31 11:59:26.439558	082dec4d-1b01-4463-886e-6bb9e5b3a69a	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	5d043c9b-a38c-46f3-b4fa-47f32b2c3b5e	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Mobilit\\\\u00e9 et transports\\", \\"de\\": \\"Mobilit\\\\u00e4t und Verkehr\\", \\"en\\": \\"Mobility and Transport\\", \\"it\\": \\"Mobilit\\\\u00e0 e trasporti\\"}", "created": "2015-08-25T14:10:45.656859", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "90bb07fc-21e9-46ba-a21f-753b3be3559e", "type": "group", "id": "8c2a33d5-475d-48dd-87b6-7ce5eb2033fa", "name": "mobilitaet"}}
e7359e91-9071-4fb9-8b93-62ff1a7d8101	2015-08-31 11:59:32.796778	082dec4d-1b01-4463-886e-6bb9e5b3a69a	c7521678-de76-4731-9075-25d1d6150ecf	7ff1d24f-34bf-43c9-b697-ccf45dbea0aa	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Agriculture, sylviculture\\", \\"de\\": \\"Land- und Forstwirtschaft\\", \\"en\\": \\"Agriculture, forestry\\", \\"it\\": \\"Agricoltura, selvicoltura\\"}", "created": "2015-08-25T14:09:59.733494", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "a3df1166-3bbb-4209-9088-cb2f00116e1f", "type": "group", "id": "c7521678-de76-4731-9075-25d1d6150ecf", "name": "landwirtschaft"}}
ab246623-9ca8-4f97-a3d0-0ea550f72f54	2015-08-31 12:00:09.744367	082dec4d-1b01-4463-886e-6bb9e5b3a69a	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	a21fc96a-4835-4efa-be9f-42bcdb367252	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Criminalit\\\\u00e9, droit p\\\\u00e9nal\\", \\"de\\": \\"Kriminalit\\\\u00e4t, Strafrecht\\", \\"en\\": \\"Crime, criminal justice\\", \\"it\\": \\"Criminalit\\\\u00e0, diritto penale\\"}", "created": "2015-08-25T14:03:08.838883", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "8ae8b593-e003-4d04-9056-05bf5d141bfb", "type": "group", "id": "2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1", "name": "kriminalitaet"}}
1d94d737-6c22-437a-a457-4ff84b2a652e	2015-08-31 12:00:29.274807	082dec4d-1b01-4463-886e-6bb9e5b3a69a	dc8b567c-fed8-4696-847b-f85510f93d71	642455a1-d5e1-4a9a-b868-729291a89a32	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Handel\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "created": "2015-08-25T14:01:43.755102", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "5c8ac240-f49a-4a68-a10b-43346e03ced7", "type": "group", "id": "dc8b567c-fed8-4696-847b-f85510f93d71", "name": "handel"}}
64c9aba2-a599-462f-941d-814cbaa41486	2015-08-31 12:00:42.598034	082dec4d-1b01-4463-886e-6bb9e5b3a69a	28641aa8-b97d-49ed-85bf-c19eb0f729d3	26cc532f-1717-4791-81c3-c8863a043862	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Legislation\\", \\"de\\": \\"Gesetzgebung\\", \\"en\\": \\"Legislation\\", \\"it\\": \\"Legislazione\\"}", "created": "2015-08-25T14:00:48.650133", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "07904a86-1261-45dd-81df-b51627ab8e75", "type": "group", "id": "28641aa8-b97d-49ed-85bf-c19eb0f729d3", "name": "gesetzgebung"}}
af773455-5af2-421b-9368-67fe0cafe750	2015-08-31 12:00:53.923113	082dec4d-1b01-4463-886e-6bb9e5b3a69a	79cbe120-e9c6-4249-b934-58ca980606d7	ccfd4ea6-5798-4b78-aa37-c80fb5639060	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Finances\\", \\"de\\": \\"Finanzen\\", \\"en\\": \\"Finances\\", \\"it\\": \\"Finanze\\"}", "created": "2015-08-25T13:59:55.195808", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "56c995aa-ab6b-4828-9710-2fe49c13d76b", "type": "group", "id": "79cbe120-e9c6-4249-b934-58ca980606d7", "name": "finanzen"}}
35f90395-f6d0-4a67-b982-6030f2b4ec40	2015-08-31 12:01:08.535737	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afcb4a2a-b4b0-4d7c-984a-9078e964be49	593cf131-afce-4622-95b4-f89389878ba5	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Education, science\\", \\"de\\": \\"Bildung, Wissenschaft\\", \\"en\\": \\"Education and science\\", \\"it\\": \\"Formazione e scienza\\"}", "created": "2015-08-25T13:58:48.432831", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "b93a5949-5ca7-4188-ace6-1d7352c40c11", "type": "group", "id": "afcb4a2a-b4b0-4d7c-984a-9078e964be49", "name": "bildung"}}
38286191-5e24-4231-91a8-0ff1d4f600b3	2015-08-31 11:59:38.933716	082dec4d-1b01-4463-886e-6bb9e5b3a69a	0d77b36f-1de6-40b3-9915-be91ee469f63	5088f4cf-8906-43cb-af06-f2e6500be581	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Culture, m\\\\u00e9dias, soci\\\\u00e9t\\\\u00e9 de l\\\\\\\\'information, sport\\", \\"de\\": \\"Kultur, Medien, Informationsgesellschaft, Sport\\", \\"en\\": \\"\\", \\"it\\": \\"Cultura, media, societ\\\\u00e0 dell\\\\\\\\'informazione, sport\\"}", "created": "2015-08-25T14:03:55.965249", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "dfa3b55e-370c-41f3-a324-e50cc0662b60", "type": "group", "id": "0d77b36f-1de6-40b3-9915-be91ee469f63", "name": "kultur"}}
6c8561d6-8247-443f-9ce9-df5f48a8c3f1	2015-08-31 12:00:21.639219	082dec4d-1b01-4463-886e-6bb9e5b3a69a	168c842c-fd1f-4180-91ce-1aecaac8f282	1f566931-00a9-4be0-8c87-54a5e15c38a3	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Industrie, services\\", \\"de\\": \\"Industrie, Dienstleistungen\\", \\"en\\": \\"Industry and services\\", \\"it\\": \\"Industria, servizi\\"}", "created": "2015-08-25T14:02:27.058390", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "bb1f2492-aece-4e79-b7bf-546436441f36", "type": "group", "id": "168c842c-fd1f-4180-91ce-1aecaac8f282", "name": "industrie"}}
6928317f-5aa1-4d82-ab19-32dc79d4f408	2015-08-31 12:00:35.699985	082dec4d-1b01-4463-886e-6bb9e5b3a69a	90848388-d0b6-4b97-a686-e93b40832e1e	7974e1c4-6375-465b-a2c8-c0647dc6740b	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Sant\\\\u00e9\\", \\"de\\": \\"Gesundheit\\", \\"en\\": \\"Health\\", \\"it\\": \\"\\"}", "created": "2015-08-25T14:01:18.030175", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "051072fa-f077-46c1-a744-074145df9d03", "type": "group", "id": "90848388-d0b6-4b97-a686-e93b40832e1e", "name": "gesundheit"}}
87da12b8-4813-4df4-a965-47f085cc33c0	2015-08-31 12:00:48.527132	082dec4d-1b01-4463-886e-6bb9e5b3a69a	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	4bc045c4-3139-4673-8b9a-89f140adc30f	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Geographie\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "created": "2015-08-25T14:00:19.757575", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "c526c9ca-178f-4b91-9d72-3a6ed1609d9b", "type": "group", "id": "a20e9d52-0d20-413c-a8ad-9ffd4523bec6", "name": "geographie"}}
1db84385-cfb9-4961-8b3c-abcfad0c4fd8	2015-08-31 12:00:59.650797	082dec4d-1b01-4463-886e-6bb9e5b3a69a	42f56f74-074e-4cbb-b91b-deeb1fd58c56	c1db3782-5aa7-4817-a2fc-c418b125fcb1	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Energie\\", \\"de\\": \\"Energie\\", \\"en\\": \\"Energy\\", \\"it\\": \\"Energia\\"}", "created": "2015-08-25T13:59:27.505141", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "a0ecd1b2-bac8-4696-9a65-815b2b705d95", "type": "group", "id": "42f56f74-074e-4cbb-b91b-deeb1fd58c56", "name": "energie"}}
8b078489-be1b-45b5-a327-b22b506e9a31	2015-08-31 12:04:53.869857	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7d52132f-7119-41ab-b2b8-e62d69a834ce	04f3908a-af7c-4932-9698-dc38826138a1	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Construction, logement\\", \\"de\\": \\"Bau- und Wohnungswesen\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "created": "2015-08-25T13:58:14.424398", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "d9eb027c-b163-453b-aa63-3bd148d8a8de", "type": "group", "id": "7d52132f-7119-41ab-b2b8-e62d69a834ce", "name": "bauwesen"}}
1dae76e9-f44f-4807-854d-a06fe7d56eb3	2015-08-31 12:05:08.630564	082dec4d-1b01-4463-886e-6bb9e5b3a69a	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	679545c5-3292-4119-8583-fd02cc21b8b2	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Travail, r\\\\u00e9mun\\\\u00e9ration\\", \\"de\\": \\"Arbeit, Erwerb\\", \\"en\\": \\"Work and income\\", \\"it\\": \\"Lavoro e reddito\\"}", "created": "2015-08-25T13:57:41.607386", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "c4b8d128-e3b5-439d-8244-5e8fcce20613", "type": "group", "id": "33ab70dd-e2da-464a-ae5f-b166f16d9e2c", "name": "arbeit"}}
5d8f3906-e06a-4682-9835-5424f5827cea	2015-08-31 12:05:21.052207	082dec4d-1b01-4463-886e-6bb9e5b3a69a	27b314a5-57b6-4c4e-9c9f-6923365eaecc	70378e95-90f7-4011-b9b9-f2dbd80fc621	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Espace\\", \\"de\\": \\"Raum\\", \\"en\\": \\"Space\\", \\"it\\": \\"Spazio\\"}", "created": "2015-08-25T13:48:07.986487", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "1c095545-1d23-4082-aa02-7a9c424cfa8c", "type": "group", "id": "27b314a5-57b6-4c4e-9c9f-6923365eaecc", "name": "raum"}}
ff68f5c2-d7d4-452b-a003-85bf4bd8de7d	2015-08-31 12:05:29.757512	082dec4d-1b01-4463-886e-6bb9e5b3a69a	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	f22a1af7-ed33-4989-a685-75196ad998ce	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Population\\", \\"de\\": \\"Bev\\\\u00f6lkerung\\", \\"en\\": \\"Population\\", \\"it\\": \\"Popolazione\\"}", "created": "2015-08-25T13:47:23.668582", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "d0771be4-1558-4509-9417-4f58de851f86", "type": "group", "id": "64d3b89b-ff79-477e-8fb4-9cfc388b0f58", "name": "bevoelkerung"}}
caf4dcd4-06dd-49a0-8d1f-21e407ee9b80	2015-09-14 11:36:11.471578	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7dbaad15-597f-499c-9a72-95de38b95cad	54f98a24-da83-46f5-8217-6054cde1c239	new organization	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Archives f\\\\u00e9d\\\\u00e9rales\\", \\"de\\": \\"Bundesarchiv\\", \\"en\\": \\"Federal Archives\\", \\"it\\": \\"Archivio federale\\"}", "created": "2015-09-14T11:36:11.438714", "approval_status": "approved", "is_organization": true, "state": "active", "image_url": "", "revision_id": "54f98a24-da83-46f5-8217-6054cde1c239", "type": "organization", "id": "7dbaad15-597f-499c-9a72-95de38b95cad", "name": "bundesarchiv"}}
cbee4184-0453-411b-9fed-e8888f2e05b2	2015-09-21 13:13:34.495634	082dec4d-1b01-4463-886e-6bb9e5b3a69a	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	ab7a24b7-3198-4a5e-94e0-4c222f96d7e4	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Economie nationale\\", \\"de\\": \\"Volkswirtschaft\\", \\"en\\": \\"National economy\\", \\"it\\": \\"Economia\\"}", "created": "2015-08-25T14:16:26.069858", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "5f6a6f73-7dff-4ab9-8fc0-b75916de00ee", "type": "group", "id": "5389c3f2-2f64-436b-9fac-2d1fc342f7b5", "name": "volkswirtschaft"}}
90da20c0-2349-498b-8cb5-139d44ccd742	2015-09-21 13:14:00.846515	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	c7bcc2e7-078d-40b9-862e-50c82e4de248	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Administration\\", \\"de\\": \\"Verwaltung\\", \\"en\\": \\"Administration\\", \\"it\\": \\"Amministrazione\\"}", "created": "2015-08-25T14:15:57.072436", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "673f91b5-fb2b-46dc-be95-b88bfde8fcb9", "type": "group", "id": "afc7c340-9bdb-4767-bbcb-70094a1d0dcc", "name": "verwaltung"}}
139bafad-f376-447f-90da-27283979f271	2015-09-21 13:14:31.622175	082dec4d-1b01-4463-886e-6bb9e5b3a69a	6aace7ef-f167-40c9-a0d7-87e7e2681c07	eb73e4a2-c539-40c8-986f-cd4b898e3596	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Tourisme\\", \\"de\\": \\"Tourismus\\", \\"en\\": \\"Tourism\\", \\"it\\": \\"Turismo\\"}", "created": "2015-08-25T14:15:32.725207", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "358c9eb1-a60c-4b20-a7ad-8487a1d02e17", "type": "group", "id": "6aace7ef-f167-40c9-a0d7-87e7e2681c07", "name": "tourismus"}}
e4ea2ae4-aacb-4f4c-8b5c-0de49aeadf28	2015-09-21 13:14:56.239308	082dec4d-1b01-4463-886e-6bb9e5b3a69a	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	215c4d8d-7b4e-4b08-be59-2738ed423185	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Bases statistiques\\", \\"de\\": \\"Statistische Grundlagen\\", \\"en\\": \\"Statistical basis\\", \\"it\\": \\"Basi statistiche\\"}", "created": "2015-08-25T14:15:07.102775", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "fc36ada8-7dfe-4747-9517-e96e0fcfaa8c", "type": "group", "id": "e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2", "name": "statistische-grundlagen"}}
990e8c30-5848-4554-a495-79b58c217adc	2015-09-21 13:15:11.206349	082dec4d-1b01-4463-886e-6bb9e5b3a69a	011e8933-7b86-412c-8fe6-752060d8e103	ed0c8f40-89ca-4499-b9ff-54833a7700b6	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Protection sociale\\", \\"de\\": \\"Soziale Sicherheit\\", \\"en\\": \\"Social security\\", \\"it\\": \\"Sicurezza sociale\\"}", "created": "2015-08-25T14:14:29.364706", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "83d49224-f922-4467-9d74-d761e2b98cf8", "type": "group", "id": "011e8933-7b86-412c-8fe6-752060d8e103", "name": "soziale-sicherheit"}}
b653d195-085d-4331-9cda-a4dcdf0e52b7	2015-09-21 13:19:15.920548	082dec4d-1b01-4463-886e-6bb9e5b3a69a	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	8bd61bf4-bd9b-4b63-899f-07a051f7a459	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Prix\\", \\"de\\": \\"Preise\\", \\"en\\": \\"Prices\\", \\"it\\": \\"Prezzi\\"}", "created": "2015-08-25T14:13:56.103902", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "3390c572-dd62-434d-b2d3-f8c4557a4470", "type": "group", "id": "1deb7a82-612f-46ce-9c62-89c7c0b38ddf", "name": "preise"}}
fa875796-0157-47a9-8d2b-92d49697d53c	2015-09-21 13:19:30.766974	082dec4d-1b01-4463-886e-6bb9e5b3a69a	9beba14c-eab8-426e-89ae-757bc2e6445e	75a7dd8a-7b38-4885-9bec-b5ddbfa17b12	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Politique\\", \\"de\\": \\"Politik\\", \\"en\\": \\"Politics\\", \\"it\\": \\"Politica\\"}", "created": "2015-08-25T14:13:29.816322", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "f14dfeff-fe1c-4d5e-99e0-8bb7b2f9ddab", "type": "group", "id": "9beba14c-eab8-426e-89ae-757bc2e6445e", "name": "politik"}}
66cb0d17-e3dd-4f18-acff-6dfe517f46f8	2015-09-21 13:20:21.090802	082dec4d-1b01-4463-886e-6bb9e5b3a69a	620fdda8-a92d-421b-89ad-4ef1b57a9458	4790cc3f-5ceb-4f8d-97a1-6e9b4391aae9	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Ordre et s\\\\u00e9curit\\\\u00e9 publics\\", \\"de\\": \\"\\\\u00d6ffentliche Ordnung und Sicherheit\\", \\"en\\": \\"Public order and security\\", \\"it\\": \\"Ordine pubblico e sicurezza pubblica\\"}", "created": "2015-08-25T14:12:43.038972", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "07dd5069-04bf-4b36-9869-ec93cd5e2b6c", "type": "group", "id": "620fdda8-a92d-421b-89ad-4ef1b57a9458", "name": "sicherheit"}}
27a394a0-50d7-4feb-b3d4-a48f62810d08	2015-09-21 13:20:52.453495	082dec4d-1b01-4463-886e-6bb9e5b3a69a	c7521678-de76-4731-9075-25d1d6150ecf	3b00e2e4-f898-4d02-a4fa-0e58d246cfdb	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Agriculture, sylviculture\\", \\"de\\": \\"Land- und Forstwirtschaft\\", \\"en\\": \\"Agriculture, forestry\\", \\"it\\": \\"Agricoltura, selvicoltura\\"}", "created": "2015-08-25T14:09:59.733494", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "7ff1d24f-34bf-43c9-b697-ccf45dbea0aa", "type": "group", "id": "c7521678-de76-4731-9075-25d1d6150ecf", "name": "landwirtschaft"}}
7dde2db3-dd2e-4916-8c1a-1a22b3da4783	2015-09-21 13:22:46.732063	082dec4d-1b01-4463-886e-6bb9e5b3a69a	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	224502dd-b0fd-49d1-8eb9-6018bdcee22c	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Criminalit\\\\u00e9, droit p\\\\u00e9nal\\", \\"de\\": \\"Kriminalit\\\\u00e4t, Strafrecht\\", \\"en\\": \\"Crime, criminal justice\\", \\"it\\": \\"Criminalit\\\\u00e0, diritto penale\\"}", "created": "2015-08-25T14:03:08.838883", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "a21fc96a-4835-4efa-be9f-42bcdb367252", "type": "group", "id": "2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1", "name": "kriminalitaet"}}
b5db897a-5b4f-467e-bc9f-fedc2ee2b314	2015-09-21 13:23:31.229113	082dec4d-1b01-4463-886e-6bb9e5b3a69a	dc8b567c-fed8-4696-847b-f85510f93d71	d93b1c52-9c73-4be6-a073-081b6f42aef7	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Commerce\\", \\"de\\": \\"Handel\\", \\"en\\": \\"Trade\\", \\"it\\": \\"Commercio\\"}", "created": "2015-08-25T14:01:43.755102", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "642455a1-d5e1-4a9a-b868-729291a89a32", "type": "group", "id": "dc8b567c-fed8-4696-847b-f85510f93d71", "name": "handel"}}
9d80990c-02cc-49fb-8f8c-d445144937df	2015-09-21 13:24:50.951117	082dec4d-1b01-4463-886e-6bb9e5b3a69a	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	6ee21dee-ca1b-4438-a3e0-0f83ff5be377	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"G\\\\u00e9ographie\\", \\"de\\": \\"Geographie\\", \\"en\\": \\"Geography\\", \\"it\\": \\"Geografia\\"}", "created": "2015-08-25T14:00:19.757575", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "4bc045c4-3139-4673-8b9a-89f140adc30f", "type": "group", "id": "a20e9d52-0d20-413c-a8ad-9ffd4523bec6", "name": "geographie"}}
0e37e685-d01f-40f0-9c3e-b34c99ca2872	2015-09-21 13:25:10.974184	082dec4d-1b01-4463-886e-6bb9e5b3a69a	42f56f74-074e-4cbb-b91b-deeb1fd58c56	936d7747-d4f5-421e-9fba-004eb25a0ecb	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Energie\\", \\"de\\": \\"Energie\\", \\"en\\": \\"Energy\\", \\"it\\": \\"Energia\\"}", "created": "2015-08-25T13:59:27.505141", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "c1db3782-5aa7-4817-a2fc-c418b125fcb1", "type": "group", "id": "42f56f74-074e-4cbb-b91b-deeb1fd58c56", "name": "energie"}}
6e25e259-532f-4845-bc98-ce7915a054ab	2015-09-21 13:25:53.370406	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7d52132f-7119-41ab-b2b8-e62d69a834ce	166f0294-b5e7-4f06-87ec-53978d3cb161	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Construction, logement\\", \\"de\\": \\"Bau- und Wohnungswesen\\", \\"en\\": \\"Construction and housing\\", \\"it\\": \\"Costruzione e abitazione\\"}", "created": "2015-08-25T13:58:14.424398", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "04f3908a-af7c-4932-9698-dc38826138a1", "type": "group", "id": "7d52132f-7119-41ab-b2b8-e62d69a834ce", "name": "bauwesen"}}
50774983-8f11-4450-9568-5bd54b9eed89	2015-09-21 13:26:58.654434	082dec4d-1b01-4463-886e-6bb9e5b3a69a	27b314a5-57b6-4c4e-9c9f-6923365eaecc	d312c928-9963-4934-8bc6-49d1fdce8b84	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Territoire et environnement\\", \\"de\\": \\"Raum und Umwelt\\", \\"en\\": \\"Territory and environment\\", \\"it\\": \\"Territorio e ambiente\\"}", "created": "2015-08-25T13:48:07.986487", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "70378e95-90f7-4011-b9b9-f2dbd80fc621", "type": "group", "id": "27b314a5-57b6-4c4e-9c9f-6923365eaecc", "name": "raum"}}
839a5803-d2f0-45ae-8cea-03162d8794dc	2015-09-21 13:38:17.512613	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	03e310f1-a318-4dd6-9c62-dac47e4f26e4	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Administration\\", \\"de\\": \\"Verwaltung\\", \\"en\\": \\"Administration\\", \\"it\\": \\"Amministrazione\\"}", "created": "2015-08-25T14:15:57.072436", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "673f91b5-fb2b-46dc-be95-b88bfde8fcb9", "type": "group", "id": "afc7c340-9bdb-4767-bbcb-70094a1d0dcc", "name": "administration"}}
9e2b51f7-daa3-4c08-8eec-feebbc2bcebc	2015-09-21 13:38:50.554252	082dec4d-1b01-4463-886e-6bb9e5b3a69a	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	7e360e6f-c8c4-43b9-b536-8c4f19549617	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Bases statistiques\\", \\"de\\": \\"Statistische Grundlagen\\", \\"en\\": \\"Statistical basis\\", \\"it\\": \\"Basi statistiche\\"}", "created": "2015-08-25T14:15:07.102775", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "fc36ada8-7dfe-4747-9517-e96e0fcfaa8c", "type": "group", "id": "e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2", "name": "statistical-basis"}}
7847f11e-f5fe-4a86-9b45-579cb39c3530	2015-09-21 13:39:23.693868	082dec4d-1b01-4463-886e-6bb9e5b3a69a	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	3cc13ca1-c48e-4e39-bede-018e97e50e87	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Prix\\", \\"de\\": \\"Preise\\", \\"en\\": \\"Prices\\", \\"it\\": \\"Prezzi\\"}", "created": "2015-08-25T14:13:56.103902", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "3390c572-dd62-434d-b2d3-f8c4557a4470", "type": "group", "id": "1deb7a82-612f-46ce-9c62-89c7c0b38ddf", "name": "prices"}}
44ac31db-2d83-4dee-843c-edf41da43b5f	2015-09-21 13:20:39.947619	082dec4d-1b01-4463-886e-6bb9e5b3a69a	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	2a4816b2-9701-4576-9188-57342f4fff21	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Mobilit\\\\u00e9 et transports\\", \\"de\\": \\"Mobilit\\\\u00e4t und Verkehr\\", \\"en\\": \\"Mobility and Transport\\", \\"it\\": \\"Mobilit\\\\u00e0 e trasporti\\"}", "created": "2015-08-25T14:10:45.656859", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "5d043c9b-a38c-46f3-b4fa-47f32b2c3b5e", "type": "group", "id": "8c2a33d5-475d-48dd-87b6-7ce5eb2033fa", "name": "mobilitaet"}}
d5c3aa5d-f84f-490a-999d-78d010349485	2015-09-21 13:22:26.257893	082dec4d-1b01-4463-886e-6bb9e5b3a69a	0d77b36f-1de6-40b3-9915-be91ee469f63	46dfc0db-85bc-4805-9b42-e016add31502	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Culture, m\\\\u00e9dias, soci\\\\u00e9t\\\\u00e9 de l\\\\\\\\'information, sport\\", \\"de\\": \\"Kultur, Medien, Informationsgesellschaft, Sport\\", \\"en\\": \\"Culture, media, information society, sport\\", \\"it\\": \\"Cultura, media, societ\\\\u00e0 dell\\\\\\\\'informazione, sport\\"}", "created": "2015-08-25T14:03:55.965249", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "5088f4cf-8906-43cb-af06-f2e6500be581", "type": "group", "id": "0d77b36f-1de6-40b3-9915-be91ee469f63", "name": "kultur"}}
82f9d61d-5fcf-4d71-827d-dbd5361273d8	2015-09-21 13:23:08.091378	082dec4d-1b01-4463-886e-6bb9e5b3a69a	168c842c-fd1f-4180-91ce-1aecaac8f282	48ff98ab-772c-46b2-84df-ba48fbedf27d	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Industrie, services\\", \\"de\\": \\"Industrie, Dienstleistungen\\", \\"en\\": \\"Industry and services\\", \\"it\\": \\"Industria, servizi\\"}", "created": "2015-08-25T14:02:27.058390", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "1f566931-00a9-4be0-8c87-54a5e15c38a3", "type": "group", "id": "168c842c-fd1f-4180-91ce-1aecaac8f282", "name": "industrie"}}
16efb38f-d1e2-4da6-b22b-0da6dcb5f992	2015-09-21 13:24:31.236644	082dec4d-1b01-4463-886e-6bb9e5b3a69a	90848388-d0b6-4b97-a686-e93b40832e1e	13238840-f71f-4121-bc57-9e6def7c1556	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Sant\\\\u00e9\\", \\"de\\": \\"Gesundheit\\", \\"en\\": \\"Health\\", \\"it\\": \\"Sanit\\\\u00e0\\"}", "created": "2015-08-25T14:01:18.030175", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "7974e1c4-6375-465b-a2c8-c0647dc6740b", "type": "group", "id": "90848388-d0b6-4b97-a686-e93b40832e1e", "name": "gesundheit"}}
9e5648f3-ffdc-4d32-a556-de203b4f294c	2015-09-21 13:24:59.872525	082dec4d-1b01-4463-886e-6bb9e5b3a69a	79cbe120-e9c6-4249-b934-58ca980606d7	4efbebbe-0755-49a2-a878-2a7e50a8702b	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Finances\\", \\"de\\": \\"Finanzen\\", \\"en\\": \\"Finances\\", \\"it\\": \\"Finanze\\"}", "created": "2015-08-25T13:59:55.195808", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "ccfd4ea6-5798-4b78-aa37-c80fb5639060", "type": "group", "id": "79cbe120-e9c6-4249-b934-58ca980606d7", "name": "finanzen"}}
3062a8ac-f561-4abf-88bc-4d745890dec7	2015-09-21 13:25:23.791536	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afcb4a2a-b4b0-4d7c-984a-9078e964be49	dd3c5497-779b-45dc-98ec-6c6eebd646d5	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Education, science\\", \\"de\\": \\"Bildung, Wissenschaft\\", \\"en\\": \\"Education and science\\", \\"it\\": \\"Formazione e scienza\\"}", "created": "2015-08-25T13:58:48.432831", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "593cf131-afce-4622-95b4-f89389878ba5", "type": "group", "id": "afcb4a2a-b4b0-4d7c-984a-9078e964be49", "name": "bildung"}}
dafa2a92-7509-485e-bcb0-8de49d85390d	2015-09-21 13:26:05.474705	082dec4d-1b01-4463-886e-6bb9e5b3a69a	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	1767bc4e-1591-4b80-a38f-76c2794e115f	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Travail, r\\\\u00e9mun\\\\u00e9ration\\", \\"de\\": \\"Arbeit, Erwerb\\", \\"en\\": \\"Work and income\\", \\"it\\": \\"Lavoro e reddito\\"}", "created": "2015-08-25T13:57:41.607386", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "679545c5-3292-4119-8583-fd02cc21b8b2", "type": "group", "id": "33ab70dd-e2da-464a-ae5f-b166f16d9e2c", "name": "arbeit"}}
273cce03-1695-4b38-87a4-5d1aceba9ca6	2015-09-21 13:27:14.351987	082dec4d-1b01-4463-886e-6bb9e5b3a69a	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	e56623c0-d68e-4e7d-8454-91e714a02902	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Population\\", \\"de\\": \\"Bev\\\\u00f6lkerung\\", \\"en\\": \\"Population\\", \\"it\\": \\"Popolazione\\"}", "created": "2015-08-25T13:47:23.668582", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "f22a1af7-ed33-4989-a685-75196ad998ce", "type": "group", "id": "64d3b89b-ff79-477e-8fb4-9cfc388b0f58", "name": "bevoelkerung"}}
3c2a9b1a-ce57-4bc0-adc5-8151c04fd4d9	2015-09-21 13:37:03.282426	082dec4d-1b01-4463-886e-6bb9e5b3a69a	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	1d6f940c-7145-4746-b7c9-7421a78e1dde	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Economie nationale\\", \\"de\\": \\"Volkswirtschaft\\", \\"en\\": \\"National economy\\", \\"it\\": \\"Economia\\"}", "created": "2015-08-25T14:16:26.069858", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "5f6a6f73-7dff-4ab9-8fc0-b75916de00ee", "type": "group", "id": "5389c3f2-2f64-436b-9fac-2d1fc342f7b5", "name": "national-economy"}}
c93816ba-6d48-409d-b0a2-994bb34f240a	2015-09-21 13:38:36.670275	082dec4d-1b01-4463-886e-6bb9e5b3a69a	6aace7ef-f167-40c9-a0d7-87e7e2681c07	9398ccc7-afdb-4e77-aeac-e7146c7b5d2d	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Tourisme\\", \\"de\\": \\"Tourismus\\", \\"en\\": \\"Tourism\\", \\"it\\": \\"Turismo\\"}", "created": "2015-08-25T14:15:32.725207", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "358c9eb1-a60c-4b20-a7ad-8487a1d02e17", "type": "group", "id": "6aace7ef-f167-40c9-a0d7-87e7e2681c07", "name": "tourism"}}
16ee44d5-2371-4714-bf30-215ec1d895ed	2015-09-21 13:39:11.04183	082dec4d-1b01-4463-886e-6bb9e5b3a69a	011e8933-7b86-412c-8fe6-752060d8e103	fd15758a-a4cf-47d5-99da-7d1ff56f61d8	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Protection sociale\\", \\"de\\": \\"Soziale Sicherheit\\", \\"en\\": \\"Social security\\", \\"it\\": \\"Sicurezza sociale\\"}", "created": "2015-08-25T14:14:29.364706", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "83d49224-f922-4467-9d74-d761e2b98cf8", "type": "group", "id": "011e8933-7b86-412c-8fe6-752060d8e103", "name": "social-security"}}
3014407b-936e-49d1-97f5-f7bc845b9e3b	2015-09-21 13:39:32.266345	082dec4d-1b01-4463-886e-6bb9e5b3a69a	9beba14c-eab8-426e-89ae-757bc2e6445e	6ea7559e-c018-4b56-b5bd-b99c823737ea	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Politique\\", \\"de\\": \\"Politik\\", \\"en\\": \\"Politics\\", \\"it\\": \\"Politica\\"}", "created": "2015-08-25T14:13:29.816322", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "75a7dd8a-7b38-4885-9bec-b5ddbfa17b12", "type": "group", "id": "9beba14c-eab8-426e-89ae-757bc2e6445e", "name": "politics"}}
7f856740-ab6e-4207-afc0-4c2d366d26a0	2015-09-21 13:40:01.699253	082dec4d-1b01-4463-886e-6bb9e5b3a69a	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	b0c226e7-5355-4dcb-8cd9-0edf231edc45	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Mobilit\\\\u00e9 et transports\\", \\"de\\": \\"Mobilit\\\\u00e4t und Verkehr\\", \\"en\\": \\"Mobility and Transport\\", \\"it\\": \\"Mobilit\\\\u00e0 e trasporti\\"}", "created": "2015-08-25T14:10:45.656859", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "5d043c9b-a38c-46f3-b4fa-47f32b2c3b5e", "type": "group", "id": "8c2a33d5-475d-48dd-87b6-7ce5eb2033fa", "name": "mobility"}}
eed4333d-85b8-4022-975d-e9e985579183	2015-09-21 13:40:29.22801	082dec4d-1b01-4463-886e-6bb9e5b3a69a	0d77b36f-1de6-40b3-9915-be91ee469f63	57dcd4e2-8cea-411c-bf25-d3014c1e37fe	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Culture, m\\\\u00e9dias, soci\\\\u00e9t\\\\u00e9 de l\\\\\\\\'information, sport\\", \\"de\\": \\"Kultur, Medien, Informationsgesellschaft, Sport\\", \\"en\\": \\"Culture, media, information society, sport\\", \\"it\\": \\"Cultura, media, societ\\\\u00e0 dell\\\\\\\\'informazione, sport\\"}", "created": "2015-08-25T14:03:55.965249", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "46dfc0db-85bc-4805-9b42-e016add31502", "type": "group", "id": "0d77b36f-1de6-40b3-9915-be91ee469f63", "name": "culture"}}
54fe223e-1b0b-474d-9a7e-73636f86b33e	2015-09-21 13:40:51.667635	082dec4d-1b01-4463-886e-6bb9e5b3a69a	168c842c-fd1f-4180-91ce-1aecaac8f282	e38b54db-e190-4119-a107-e25813354f4f	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Industrie, services\\", \\"de\\": \\"Industrie, Dienstleistungen\\", \\"en\\": \\"Industry and services\\", \\"it\\": \\"Industria, servizi\\"}", "created": "2015-08-25T14:02:27.058390", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "1f566931-00a9-4be0-8c87-54a5e15c38a3", "type": "group", "id": "168c842c-fd1f-4180-91ce-1aecaac8f282", "name": "industry"}}
5a758d96-ba9a-49cb-b9ef-1f6d022a50e8	2015-09-21 13:41:17.136945	082dec4d-1b01-4463-886e-6bb9e5b3a69a	90848388-d0b6-4b97-a686-e93b40832e1e	9721d798-a9ab-4f4e-8570-67299ea8b9b2	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Sant\\\\u00e9\\", \\"de\\": \\"Gesundheit\\", \\"en\\": \\"Health\\", \\"it\\": \\"Sanit\\\\u00e0\\"}", "created": "2015-08-25T14:01:18.030175", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "13238840-f71f-4121-bc57-9e6def7c1556", "type": "group", "id": "90848388-d0b6-4b97-a686-e93b40832e1e", "name": "health"}}
2044cc51-f38f-41ce-ba1e-a8122972e4d5	2015-09-21 13:44:07.418257	082dec4d-1b01-4463-886e-6bb9e5b3a69a	28641aa8-b97d-49ed-85bf-c19eb0f729d3	83f2f630-5d85-43ef-86ed-e3b7cb898d51	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Legislation\\", \\"de\\": \\"Gesetzgebung\\", \\"en\\": \\"Legislation\\", \\"it\\": \\"Legislazione\\"}", "created": "2015-08-25T14:00:48.650133", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "487fd57e-5ffc-40c1-8ea6-fb92cf4e5f62", "type": "group", "id": "28641aa8-b97d-49ed-85bf-c19eb0f729d3", "name": "legislation"}}
5d5682fd-9824-4222-bff8-13649f6e1ac7	2015-09-21 13:45:34.908905	082dec4d-1b01-4463-886e-6bb9e5b3a69a	79cbe120-e9c6-4249-b934-58ca980606d7	e61bb842-4999-478c-b10a-0d717ba16a6b	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Finances\\", \\"de\\": \\"Finanzen\\", \\"en\\": \\"Finances\\", \\"it\\": \\"Finanze\\"}", "created": "2015-08-25T13:59:55.195808", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "ccfd4ea6-5798-4b78-aa37-c80fb5639060", "type": "group", "id": "79cbe120-e9c6-4249-b934-58ca980606d7", "name": "finances"}}
14250591-4900-42e8-b869-429b1898c481	2015-09-21 13:45:58.041531	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afcb4a2a-b4b0-4d7c-984a-9078e964be49	a754e8f1-38e6-45cc-9c72-77ee4fc21ea6	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Education, science\\", \\"de\\": \\"Bildung, Wissenschaft\\", \\"en\\": \\"Education and science\\", \\"it\\": \\"Formazione e scienza\\"}", "created": "2015-08-25T13:58:48.432831", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "593cf131-afce-4622-95b4-f89389878ba5", "type": "group", "id": "afcb4a2a-b4b0-4d7c-984a-9078e964be49", "name": "education"}}
9d1201f4-0af4-44d0-9c38-5b07dd05e450	2015-09-21 13:46:29.844492	082dec4d-1b01-4463-886e-6bb9e5b3a69a	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	730be727-68ad-4b7d-85bd-cc0000d1edb2	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Travail, r\\\\u00e9mun\\\\u00e9ration\\", \\"de\\": \\"Arbeit, Erwerb\\", \\"en\\": \\"Work and income\\", \\"it\\": \\"Lavoro e reddito\\"}", "created": "2015-08-25T13:57:41.607386", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "679545c5-3292-4119-8583-fd02cc21b8b2", "type": "group", "id": "33ab70dd-e2da-464a-ae5f-b166f16d9e2c", "name": "work"}}
a38d2c0a-ba40-4c2e-b488-2bf7cffa3c5f	2015-09-21 13:46:59.620124	082dec4d-1b01-4463-886e-6bb9e5b3a69a	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	9202f92a-c919-485c-badd-dd244c00b9d7	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Population\\", \\"de\\": \\"Bev\\\\u00f6lkerung\\", \\"en\\": \\"Population\\", \\"it\\": \\"Popolazione\\"}", "created": "2015-08-25T13:47:23.668582", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "f22a1af7-ed33-4989-a685-75196ad998ce", "type": "group", "id": "64d3b89b-ff79-477e-8fb4-9cfc388b0f58", "name": "population"}}
91bc53f2-c8cd-4c5e-8e8a-56a3a2cf8b92	2015-09-21 13:39:48.132919	082dec4d-1b01-4463-886e-6bb9e5b3a69a	620fdda8-a92d-421b-89ad-4ef1b57a9458	c88b6998-0280-4534-87d4-1c593386089e	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Ordre et s\\\\u00e9curit\\\\u00e9 publics\\", \\"de\\": \\"\\\\u00d6ffentliche Ordnung und Sicherheit\\", \\"en\\": \\"Public order and security\\", \\"it\\": \\"Ordine pubblico e sicurezza pubblica\\"}", "created": "2015-08-25T14:12:43.038972", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "4790cc3f-5ceb-4f8d-97a1-6e9b4391aae9", "type": "group", "id": "620fdda8-a92d-421b-89ad-4ef1b57a9458", "name": "public-order"}}
6c73cdb8-27b5-4b42-b2ac-bb935c356354	2015-09-21 13:40:16.756593	082dec4d-1b01-4463-886e-6bb9e5b3a69a	c7521678-de76-4731-9075-25d1d6150ecf	3e99161e-dcb9-4763-915c-dc0317bdcea7	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Agriculture, sylviculture\\", \\"de\\": \\"Land- und Forstwirtschaft\\", \\"en\\": \\"Agriculture, forestry\\", \\"it\\": \\"Agricoltura, selvicoltura\\"}", "created": "2015-08-25T14:09:59.733494", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "7ff1d24f-34bf-43c9-b697-ccf45dbea0aa", "type": "group", "id": "c7521678-de76-4731-9075-25d1d6150ecf", "name": "agriculture"}}
b7ac64dd-f4b1-4fd6-8bc0-145693d0efb4	2015-09-21 13:40:39.198909	082dec4d-1b01-4463-886e-6bb9e5b3a69a	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	cba345b5-667f-4542-98e8-c134004fe722	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Criminalit\\\\u00e9, droit p\\\\u00e9nal\\", \\"de\\": \\"Kriminalit\\\\u00e4t, Strafrecht\\", \\"en\\": \\"Crime, criminal justice\\", \\"it\\": \\"Criminalit\\\\u00e0, diritto penale\\"}", "created": "2015-08-25T14:03:08.838883", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "a21fc96a-4835-4efa-be9f-42bcdb367252", "type": "group", "id": "2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1", "name": "crime"}}
b5def773-7844-4268-9a47-4508e8ab3c8b	2015-09-21 13:41:03.993284	082dec4d-1b01-4463-886e-6bb9e5b3a69a	dc8b567c-fed8-4696-847b-f85510f93d71	065e4a59-17c0-442a-8a1d-c913999f90b8	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Commerce\\", \\"de\\": \\"Handel\\", \\"en\\": \\"Trade\\", \\"it\\": \\"Commercio\\"}", "created": "2015-08-25T14:01:43.755102", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "d93b1c52-9c73-4be6-a073-081b6f42aef7", "type": "group", "id": "dc8b567c-fed8-4696-847b-f85510f93d71", "name": "trade"}}
392f6865-80c2-4fdb-86fa-817708915ab0	2015-09-21 13:43:48.068166	082dec4d-1b01-4463-886e-6bb9e5b3a69a	28641aa8-b97d-49ed-85bf-c19eb0f729d3	487fd57e-5ffc-40c1-8ea6-fb92cf4e5f62	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Legislation\\", \\"de\\": \\"Gesetzgebung\\", \\"en\\": \\"Legislation\\", \\"it\\": \\"Legislazione\\"}", "created": "2015-08-25T14:00:48.650133", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "26cc532f-1717-4791-81c3-c8863a043862", "type": "group", "id": "28641aa8-b97d-49ed-85bf-c19eb0f729d3", "name": "legislation"}}
4636eaf1-0aff-4a6c-b4b2-374dd7f43049	2015-09-21 13:45:22.538752	082dec4d-1b01-4463-886e-6bb9e5b3a69a	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	88e739b1-cf7d-461c-bfe1-f66fcf20ae4f	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"G\\\\u00e9ographie\\", \\"de\\": \\"Geographie\\", \\"en\\": \\"Geography\\", \\"it\\": \\"Geografia\\"}", "created": "2015-08-25T14:00:19.757575", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "6ee21dee-ca1b-4438-a3e0-0f83ff5be377", "type": "group", "id": "a20e9d52-0d20-413c-a8ad-9ffd4523bec6", "name": "geography"}}
7c79d07f-4712-4993-b8cb-5ca1fd9ba916	2015-09-21 13:45:45.070737	082dec4d-1b01-4463-886e-6bb9e5b3a69a	42f56f74-074e-4cbb-b91b-deeb1fd58c56	cce880ca-fb03-407f-a3c6-4ecc52c19c74	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Energie\\", \\"de\\": \\"Energie\\", \\"en\\": \\"Energy\\", \\"it\\": \\"Energia\\"}", "created": "2015-08-25T13:59:27.505141", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "c1db3782-5aa7-4817-a2fc-c418b125fcb1", "type": "group", "id": "42f56f74-074e-4cbb-b91b-deeb1fd58c56", "name": "energy"}}
990aee48-e171-4a5c-9a48-046bc41b5dc2	2015-09-21 13:46:16.982355	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7d52132f-7119-41ab-b2b8-e62d69a834ce	6f8befca-ecba-48d9-82f3-ff021f021df5	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Construction, logement\\", \\"de\\": \\"Bau- und Wohnungswesen\\", \\"en\\": \\"Construction and housing\\", \\"it\\": \\"Costruzione e abitazione\\"}", "created": "2015-08-25T13:58:14.424398", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "166f0294-b5e7-4f06-87ec-53978d3cb161", "type": "group", "id": "7d52132f-7119-41ab-b2b8-e62d69a834ce", "name": "construction"}}
4a8ede14-bf96-4f92-8f08-1215bdd175a1	2015-09-21 13:46:45.506611	082dec4d-1b01-4463-886e-6bb9e5b3a69a	27b314a5-57b6-4c4e-9c9f-6923365eaecc	2f78feef-cc98-44b7-8ade-b2830669fa90	changed group	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"Territoire et environnement\\", \\"de\\": \\"Raum und Umwelt\\", \\"en\\": \\"Territory and environment\\", \\"it\\": \\"Territorio e ambiente\\"}", "created": "2015-08-25T13:48:07.986487", "approval_status": "approved", "is_organization": false, "state": "active", "image_url": "", "revision_id": "d312c928-9963-4934-8bc6-49d1fdce8b84", "type": "group", "id": "27b314a5-57b6-4c4e-9c9f-6923365eaecc", "name": "territory"}}
506885c9-bcae-48cb-9919-6d86e99971e3	2015-09-22 13:16:36.463921	082dec4d-1b01-4463-886e-6bb9e5b3a69a	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	67686d69-d368-44b3-912f-22718aba45ef	changed package	{"package": {"owner_org": "73124d1e-c2aa-4d20-a42d-fa71b8946e93", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-09-22T13:16:35.955004", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "082dec4d-1b01-4463-886e-6bb9e5b3a69a", "license_id": null, "revision_id": "67686d69-d368-44b3-912f-22718aba45ef", "type": "dataset", "id": "ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0"}}
78a4ce82-6479-40c8-a508-ca1ca2a7f48b	2015-09-22 13:20:05.962599	082dec4d-1b01-4463-886e-6bb9e5b3a69a	52368b85-350c-450e-a18e-f2fb6fa7ae7a	b8325dae-ab2a-4154-93bc-55207ba1d8a7	new package	{"package": {"owner_org": "7dbaad15-597f-499c-9a72-95de38b95cad", "maintainer": null, "name": "baustellen", "metadata_modified": "2015-09-22T13:20:04.538977", "author": null, "url": "", "notes": "{\\"fr\\": \\"Description FR\\", \\"de\\": \\"Beschreibung DE\\", \\"en\\": \\"Description EN\\", \\"it\\": \\"Description IT\\"}", "title": "{\\"fr\\": \\"Baustellen\\", \\"de\\": \\"Baustellen\\", \\"en\\": \\"Building Sites\\", \\"it\\": \\"Chantiers\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "082dec4d-1b01-4463-886e-6bb9e5b3a69a", "license_id": null, "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "type": "dataset", "id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a"}}
\.


--
-- Data for Name: activity_detail; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY activity_detail (id, activity_id, object_id, object_type, activity_type, data) FROM stdin;
f9a7aa83-5b99-46c8-ac95-ceb03aeb4f21	506885c9-bcae-48cb-9919-6d86e99971e3	e4f82ba8-b71c-4cd0-9e1a-9596442bb17d	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0", "webstore_last_updated": null, "id": "e4f82ba8-b71c-4cd0-9e1a-9596442bb17d", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-09-22T13:16:36.014245", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "NonCommercialAllowed-CommercialAllowed-ReferenceRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "67686d69-d368-44b3-912f-22718aba45ef", "resource_type": null}}
09a67b3e-7fba-4bf5-aa1a-45bda76ee987	506885c9-bcae-48cb-9919-6d86e99971e3	3bc76a60-a231-4f65-a1e0-95fa566a97e9	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2015-04-26T00:00:00", "package_id": "ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0", "key": "modified", "revision_id": "67686d69-d368-44b3-912f-22718aba45ef", "id": "3bc76a60-a231-4f65-a1e0-95fa566a97e9"}}
c390bccb-c69d-48de-b680-c1cc780236b5	506885c9-bcae-48cb-9919-6d86e99971e3	323f0f29-14c9-4e37-a761-9353805bbc79	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0", "webstore_last_updated": null, "id": "323f0f29-14c9-4e37-a761-9353805bbc79", "size": null, "state": "deleted", "last_modified": null, "hash": "", "description": "", "format": "", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-09-22T13:16:25.240226", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "NonCommercialAllowed-CommercialAllowed-ReferenceRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "67686d69-d368-44b3-912f-22718aba45ef", "resource_type": null}}
bd60958a-811e-4818-91f8-5e523b2cfeab	506885c9-bcae-48cb-9919-6d86e99971e3	e83acad9-9bd6-4c28-bb8b-4bfa89749ebb	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2013-04-26T00:00:00", "package_id": "ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0", "key": "issued", "revision_id": "67686d69-d368-44b3-912f-22718aba45ef", "id": "e83acad9-9bd6-4c28-bb8b-4bfa89749ebb"}}
0c7307c5-44c8-4cbb-b156-c1433f4812b2	506885c9-bcae-48cb-9919-6d86e99971e3	82cb655e-92fe-4961-b9f8-70cf3eae535b	PackageExtra	changed	{"package_extra": {"state": "active", "value": "[{\\"start_date\\": \\"03/01/1905\\", \\"end_date\\": \\"01/05/2013\\"}, {\\"start_date\\": \\"03/01/2013\\", \\"end_date\\": \\"01/05/2015\\"}]", "package_id": "ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0", "key": "temporals", "revision_id": "67686d69-d368-44b3-912f-22718aba45ef", "id": "82cb655e-92fe-4961-b9f8-70cf3eae535b"}}
671368c4-0bde-4a78-b1ed-3c6a38693ea0	506885c9-bcae-48cb-9919-6d86e99971e3	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	Package	changed	{"package": {"owner_org": "73124d1e-c2aa-4d20-a42d-fa71b8946e93", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-09-22T13:16:35.955004", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "082dec4d-1b01-4463-886e-6bb9e5b3a69a", "license_id": null, "revision_id": "67686d69-d368-44b3-912f-22718aba45ef", "type": "dataset", "id": "ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0"}}
5f6975ae-996e-4061-bbdb-eff6296fa05d	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	52368b85-350c-450e-a18e-f2fb6fa7ae7a	Package	new	{"package": {"owner_org": "7dbaad15-597f-499c-9a72-95de38b95cad", "maintainer": null, "name": "baustellen", "metadata_modified": "2015-09-22T13:20:04.538977", "author": null, "url": "", "notes": "{\\"fr\\": \\"Description FR\\", \\"de\\": \\"Beschreibung DE\\", \\"en\\": \\"Description EN\\", \\"it\\": \\"Description IT\\"}", "title": "{\\"fr\\": \\"Baustellen\\", \\"de\\": \\"Baustellen\\", \\"en\\": \\"Building Sites\\", \\"it\\": \\"Chantiers\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "082dec4d-1b01-4463-886e-6bb9e5b3a69a", "license_id": null, "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "type": "dataset", "id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a"}}
ad350f57-f05c-40b5-ab8f-7edc4e632ffc	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	1a689e55-969a-4d16-b697-d946110149ab	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "coverage", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "1a689e55-969a-4d16-b697-d946110149ab"}}
964b7347-215d-4f80-96b4-8336b1d9d177	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	eeeb6e8a-ff59-471c-a8d6-8bfaac7d0d4b	tag	added	{"tag": {"vocabulary_id": null, "id": "82dd2690-3ba2-4b03-91b9-e4abc01039c2", "name": "bau"}, "package": {"owner_org": "7dbaad15-597f-499c-9a72-95de38b95cad", "maintainer": null, "name": "baustellen", "metadata_modified": "2015-09-22T13:20:04.538977", "author": null, "url": "", "notes": "{\\"fr\\": \\"Description FR\\", \\"de\\": \\"Beschreibung DE\\", \\"en\\": \\"Description EN\\", \\"it\\": \\"Description IT\\"}", "title": "{\\"fr\\": \\"Baustellen\\", \\"de\\": \\"Baustellen\\", \\"en\\": \\"Building Sites\\", \\"it\\": \\"Chantiers\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "082dec4d-1b01-4463-886e-6bb9e5b3a69a", "license_id": null, "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "type": "dataset", "id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a"}}
0daad280-e886-4fe8-8705-b3ee107d67eb	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	d7ef8cdc-8a15-4a7b-a53d-288b64a19c5f	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "spatial", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "d7ef8cdc-8a15-4a7b-a53d-288b64a19c5f"}}
c8702d76-96a4-4262-a7bf-e3ec2902a569	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	2233eba1-e7ae-43b3-9478-47c627d145dd	PackageExtra	new	{"package_extra": {"state": "active", "value": "[{\\"termdat_reference\\": \\"\\", \\"label\\": \\"Bundesarchiv\\"}]", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "publishers", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "2233eba1-e7ae-43b3-9478-47c627d145dd"}}
a7fde692-4185-477b-8ac1-a85e465ab1b4	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	229ef929-433e-48ac-82e0-50a6e83e9040	PackageExtra	new	{"package_extra": {"state": "active", "value": "[{\\"email\\": \\"pierre@bar.ch\\", \\"name\\": \\"Pierre\\"}]", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "contact_points", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "229ef929-433e-48ac-82e0-50a6e83e9040"}}
23d2a64b-8632-4d83-82ae-d784235946a4	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	b77bd3fb-a6c0-49f0-b487-5d55c7d20151	PackageExtra	new	{"package_extra": {"state": "active", "value": "http://purl.org/cld/freq/completelyIrregular", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "accrual_periodicity", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "b77bd3fb-a6c0-49f0-b487-5d55c7d20151"}}
1c9d830e-8dac-4739-af9e-de4b54bfa8b9	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	63267ca3-0598-423a-af4d-434a01035fda	PackageExtra	new	{"package_extra": {"state": "active", "value": "2015-09-08T00:00:00", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "issued", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "63267ca3-0598-423a-af4d-434a01035fda"}}
bd504708-d64a-42f0-a7ca-8740ce86d530	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	edd1fc43-56d1-41a0-afba-28f2e46f325d	PackageExtra	new	{"package_extra": {"state": "active", "value": "[\\"de\\", \\"en\\"]", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "language", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "edd1fc43-56d1-41a0-afba-28f2e46f325d"}}
2e4688c5-10c7-468f-8e98-c22b3f5835e8	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	59d319a2-b91a-4066-a45b-635a5e2e1523	PackageExtra	new	{"package_extra": {"state": "active", "value": "[{\\"start_date\\": \\"\\", \\"end_date\\": \\"\\"}]", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "temporals", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "59d319a2-b91a-4066-a45b-635a5e2e1523"}}
b251754f-02f9-4dee-90a2-bf231b9e3321	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	b62147fe-c181-4375-8a99-171f2642ad89	PackageExtra	new	{"package_extra": {"state": "active", "value": "[{\\"url\\": \\"\\", \\"label\\": \\"\\"}]", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "relations", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "b62147fe-c181-4375-8a99-171f2642ad89"}}
f2253f91-605a-42d5-ad36-8f4f0927b1b8	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	1e440d70-4e46-492f-bd7b-be9083daad69	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "webstore_last_updated": null, "id": "1e440d70-4e46-492f-bd7b-be9083daad69", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-09-22T13:20:04.591040", "url": "http://download.ch", "webstore_url": null, "extras": {"rights": "NonCommercialAllowed-CommercialWithPermission-ReferenceNotRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Baustellen 2014\\", \\"en\\": \\"Building Sites 2014\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Beschreibung DE\\", \\"en\\": \\"Description EN\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://download.ch", "coverage": "", "media_type": "", "identifier": ""}, "position": 0, "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "resource_type": null}}
64971a0a-883e-4aef-a74a-bea033103544	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	5339ed56-b8ee-4d79-a0a3-29c65240cf67	PackageExtra	new	{"package_extra": {"state": "active", "value": "123@bundesarchiv", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "identifier", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "5339ed56-b8ee-4d79-a0a3-29c65240cf67"}}
77963f44-1cd9-476c-ad58-af91a449e43a	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	c588219b-39a2-4dd8-bd54-330d838ff8cd	PackageExtra	new	{"package_extra": {"state": "active", "value": "[{\\"dataset_identifier\\": \\"\\"}]", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "see_alsos", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "c588219b-39a2-4dd8-bd54-330d838ff8cd"}}
282e898d-fc6d-4aaa-8c05-b028add62581	78a4ce82-6479-40c8-a508-ca1ca2a7f48b	7df4bb13-e10d-4054-9e00-012dc5d404d2	PackageExtra	new	{"package_extra": {"state": "active", "value": "2015-09-09T00:00:00", "package_id": "52368b85-350c-450e-a18e-f2fb6fa7ae7a", "key": "modified", "revision_id": "b8325dae-ab2a-4154-93bc-55207ba1d8a7", "id": "7df4bb13-e10d-4054-9e00-012dc5d404d2"}}
\.


--
-- Data for Name: authorization_group; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY authorization_group (id, name, created) FROM stdin;
\.


--
-- Data for Name: authorization_group_role; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY authorization_group_role (user_object_role_id, authorization_group_id) FROM stdin;
\.


--
-- Data for Name: authorization_group_user; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY authorization_group_user (authorization_group_id, user_id, id) FROM stdin;
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY dashboard (user_id, activity_stream_last_viewed, email_last_sent) FROM stdin;
082dec4d-1b01-4463-886e-6bb9e5b3a69a	2015-08-25 13:04:04.097744	2015-08-25 13:04:04.097744
af084126-f711-4016-a585-70354e997796	2015-08-25 13:04:08.426799	2015-08-25 13:04:08.426849
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY "group" (id, name, title, description, created, state, revision_id, type, approval_status, image_url, is_organization) FROM stdin;
73124d1e-c2aa-4d20-a42d-fa71b8946e93	swisstopo	{"fr": "Swisstopo FR", "de": "Swisstopo DE", "en": "Swisstopo EN", "it": "Swisstopo IT"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:43.297824	active	49919ce1-2be8-45c8-89e3-81c22d977777	organization	approved		t
7dbaad15-597f-499c-9a72-95de38b95cad	bundesarchiv	{"fr": "Archives f\\u00e9d\\u00e9rales", "de": "Bundesarchiv", "en": "Federal Archives", "it": "Archivio federale"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-09-14 11:36:11.438714	active	54f98a24-da83-46f5-8217-6054cde1c239	organization	approved		t
620fdda8-a92d-421b-89ad-4ef1b57a9458	public-order	{"fr": "Ordre et s\\u00e9curit\\u00e9 publics", "de": "\\u00d6ffentliche Ordnung und Sicherheit", "en": "Public order and security", "it": "Ordine pubblico e sicurezza pubblica"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:12:43.038972	active	c88b6998-0280-4534-87d4-1c593386089e	group	approved		f
8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	mobility	{"fr": "Mobilit\\u00e9 et transports", "de": "Mobilit\\u00e4t und Verkehr", "en": "Mobility and Transport", "it": "Mobilit\\u00e0 e trasporti"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:10:45.656859	active	b0c226e7-5355-4dcb-8cd9-0edf231edc45	group	approved		f
90848388-d0b6-4b97-a686-e93b40832e1e	health	{"fr": "Sant\\u00e9", "de": "Gesundheit", "en": "Health", "it": "Sanit\\u00e0"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:18.030175	active	9721d798-a9ab-4f4e-8570-67299ea8b9b2	group	approved		f
28641aa8-b97d-49ed-85bf-c19eb0f729d3	legislation	{"fr": "Legislation", "de": "Gesetzgebung", "en": "Legislation", "it": "Legislazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:48.650133	active	487fd57e-5ffc-40c1-8ea6-fb92cf4e5f62	group	approved		f
79cbe120-e9c6-4249-b934-58ca980606d7	finances	{"fr": "Finances", "de": "Finanzen", "en": "Finances", "it": "Finanze"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:55.195808	active	e61bb842-4999-478c-b10a-0d717ba16a6b	group	approved		f
33ab70dd-e2da-464a-ae5f-b166f16d9e2c	work	{"fr": "Travail, r\\u00e9mun\\u00e9ration", "de": "Arbeit, Erwerb", "en": "Work and income", "it": "Lavoro e reddito"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:57:41.607386	active	730be727-68ad-4b7d-85bd-cc0000d1edb2	group	approved		f
64d3b89b-ff79-477e-8fb4-9cfc388b0f58	population	{"fr": "Population", "de": "Bev\\u00f6lkerung", "en": "Population", "it": "Popolazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:47:23.668582	active	9202f92a-c919-485c-badd-dd244c00b9d7	group	approved		f
5389c3f2-2f64-436b-9fac-2d1fc342f7b5	national-economy	{"fr": "Economie nationale", "de": "Volkswirtschaft", "en": "National economy", "it": "Economia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:16:26.069858	active	1d6f940c-7145-4746-b7c9-7421a78e1dde	group	approved		f
afc7c340-9bdb-4767-bbcb-70094a1d0dcc	administration	{"fr": "Administration", "de": "Verwaltung", "en": "Administration", "it": "Amministrazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:57.072436	active	03e310f1-a318-4dd6-9c62-dac47e4f26e4	group	approved		f
6aace7ef-f167-40c9-a0d7-87e7e2681c07	tourism	{"fr": "Tourisme", "de": "Tourismus", "en": "Tourism", "it": "Turismo"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:32.725207	active	9398ccc7-afdb-4e77-aeac-e7146c7b5d2d	group	approved		f
e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	statistical-basis	{"fr": "Bases statistiques", "de": "Statistische Grundlagen", "en": "Statistical basis", "it": "Basi statistiche"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:07.102775	active	7e360e6f-c8c4-43b9-b536-8c4f19549617	group	approved		f
011e8933-7b86-412c-8fe6-752060d8e103	social-security	{"fr": "Protection sociale", "de": "Soziale Sicherheit", "en": "Social security", "it": "Sicurezza sociale"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:14:29.364706	active	fd15758a-a4cf-47d5-99da-7d1ff56f61d8	group	approved		f
1deb7a82-612f-46ce-9c62-89c7c0b38ddf	prices	{"fr": "Prix", "de": "Preise", "en": "Prices", "it": "Prezzi"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:56.103902	active	3cc13ca1-c48e-4e39-bede-018e97e50e87	group	approved		f
9beba14c-eab8-426e-89ae-757bc2e6445e	politics	{"fr": "Politique", "de": "Politik", "en": "Politics", "it": "Politica"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:29.816322	active	6ea7559e-c018-4b56-b5bd-b99c823737ea	group	approved		f
c7521678-de76-4731-9075-25d1d6150ecf	agriculture	{"fr": "Agriculture, sylviculture", "de": "Land- und Forstwirtschaft", "en": "Agriculture, forestry", "it": "Agricoltura, selvicoltura"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:09:59.733494	active	3e99161e-dcb9-4763-915c-dc0317bdcea7	group	approved		f
2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	crime	{"fr": "Criminalit\\u00e9, droit p\\u00e9nal", "de": "Kriminalit\\u00e4t, Strafrecht", "en": "Crime, criminal justice", "it": "Criminalit\\u00e0, diritto penale"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:08.838883	active	cba345b5-667f-4542-98e8-c134004fe722	group	approved		f
168c842c-fd1f-4180-91ce-1aecaac8f282	industry	{"fr": "Industrie, services", "de": "Industrie, Dienstleistungen", "en": "Industry and services", "it": "Industria, servizi"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:02:27.05839	active	e38b54db-e190-4119-a107-e25813354f4f	group	approved		f
dc8b567c-fed8-4696-847b-f85510f93d71	trade	{"fr": "Commerce", "de": "Handel", "en": "Trade", "it": "Commercio"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:43.755102	active	065e4a59-17c0-442a-8a1d-c913999f90b8	group	approved		f
a20e9d52-0d20-413c-a8ad-9ffd4523bec6	geography	{"fr": "G\\u00e9ographie", "de": "Geographie", "en": "Geography", "it": "Geografia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:19.757575	active	88e739b1-cf7d-461c-bfe1-f66fcf20ae4f	group	approved		f
42f56f74-074e-4cbb-b91b-deeb1fd58c56	energy	{"fr": "Energie", "de": "Energie", "en": "Energy", "it": "Energia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:27.505141	active	cce880ca-fb03-407f-a3c6-4ecc52c19c74	group	approved		f
afcb4a2a-b4b0-4d7c-984a-9078e964be49	education	{"fr": "Education, science", "de": "Bildung, Wissenschaft", "en": "Education and science", "it": "Formazione e scienza"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:48.432831	active	a754e8f1-38e6-45cc-9c72-77ee4fc21ea6	group	approved		f
7d52132f-7119-41ab-b2b8-e62d69a834ce	construction	{"fr": "Construction, logement", "de": "Bau- und Wohnungswesen", "en": "Construction and housing", "it": "Costruzione e abitazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:14.424398	active	6f8befca-ecba-48d9-82f3-ff021f021df5	group	approved		f
27b314a5-57b6-4c4e-9c9f-6923365eaecc	territory	{"fr": "Territoire et environnement", "de": "Raum und Umwelt", "en": "Territory and environment", "it": "Territorio e ambiente"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:07.986487	active	2f78feef-cc98-44b7-8ade-b2830669fa90	group	approved		f
0d77b36f-1de6-40b3-9915-be91ee469f63	culture	{"fr": "Culture, m\\u00e9dias, soci\\u00e9t\\u00e9 de l\\\\'information, sport", "de": "Kultur, Medien, Informationsgesellschaft, Sport", "en": "Culture, media, information society, sport", "it": "Cultura, media, societ\\u00e0 dell\\\\'informazione, sport"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:55.965249	active	57dcd4e2-8cea-411c-bf25-d3014c1e37fe	group	approved		f
\.


--
-- Data for Name: group_extra; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY group_extra (id, group_id, key, value, state, revision_id) FROM stdin;
\.


--
-- Data for Name: group_extra_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY group_extra_revision (id, group_id, key, value, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: group_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY group_revision (id, name, title, description, created, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current, type, approval_status, image_url, is_organization) FROM stdin;
73124d1e-c2aa-4d20-a42d-fa71b8946e93	swisstopo	{"fr": "Swisstopo FR", "de": "Swisstopo DE", "en": "Swisstopo EN", "it": "Swisstopo IT"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:43.297824	active	49919ce1-2be8-45c8-89e3-81c22d977777	73124d1e-c2aa-4d20-a42d-fa71b8946e93	\N	2015-08-25 13:48:43.109223	9999-12-31 00:00:00	\N	organization	approved		t
011e8933-7b86-412c-8fe6-752060d8e103	soziale-sicherheit	{'fr': u'Protection sociale', 'de': u'Soziale Sicherheit', 'en': u'Social security', 'it': u'Sicurezza sociale'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:14:29.364706	active	996d9df0-84de-4e44-a818-459e89a069c8	011e8933-7b86-412c-8fe6-752060d8e103	\N	2015-08-25 14:14:29.317352	2015-08-31 11:58:59.663296	\N	group	approved		f
1deb7a82-612f-46ce-9c62-89c7c0b38ddf	preise	{'fr': u'Prix', 'de': u'Preise', 'en': u'Prices', 'it': u'Prezzi'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:56.103902	active	95643ea7-62e7-49a5-b45a-7684ebf41c03	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	\N	2015-08-25 14:13:56.056761	2015-08-31 11:59:06.170639	\N	group	approved		f
9beba14c-eab8-426e-89ae-757bc2e6445e	politik	{'fr': u'Politique', 'de': u'Politik', 'en': u'', 'it': u'Politica'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:29.816322	active	6a7d8874-3d04-40dc-9d41-b12419680a76	9beba14c-eab8-426e-89ae-757bc2e6445e	\N	2015-08-25 14:13:29.692699	2015-08-31 11:59:14.008951	\N	group	approved		f
620fdda8-a92d-421b-89ad-4ef1b57a9458	sicherheit	{'fr': u'', 'de': u'\\xd6ffentliche Ordnung und Sicherheit', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:12:43.038972	active	922798b8-f459-4134-b1f2-cb5246faf932	620fdda8-a92d-421b-89ad-4ef1b57a9458	\N	2015-08-25 14:12:42.956754	2015-08-31 11:59:20.309131	\N	group	approved		f
8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	mobilitaet	{'fr': u'Mobilit\\xe9 et transports', 'de': u'Mobilit\\xe4t und Verkehr', 'en': u'Mobility and Transport', 'it': u'Mobilit\\xe0 e trasporti'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:10:45.656859	active	90bb07fc-21e9-46ba-a21f-753b3be3559e	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	\N	2015-08-25 14:10:45.599306	2015-08-31 11:59:26.422869	\N	group	approved		f
0d77b36f-1de6-40b3-9915-be91ee469f63	kultur	{'fr': u"Culture, m\\xe9dias, soci\\xe9t\\xe9 de l\\\\'information, sport", 'de': u'Kultur, Medien, Informationsgesellschaft, Sport', 'en': u'', 'it': u"Cultura, media, societ\\xe0 dell\\\\'informazione, sport"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:55.965249	active	dfa3b55e-370c-41f3-a324-e50cc0662b60	0d77b36f-1de6-40b3-9915-be91ee469f63	\N	2015-08-25 14:03:55.892244	2015-08-31 11:59:38.921898	\N	group	approved		f
2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	kriminalitaet	{'fr': u'Criminalit\\xe9, droit p\\xe9nal', 'de': u'Kriminalit\\xe4t, Strafrecht', 'en': u'Crime, criminal justice', 'it': u'Criminalit\\xe0, diritto penale'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:08.838883	active	8ae8b593-e003-4d04-9056-05bf5d141bfb	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	\N	2015-08-25 14:03:08.77776	2015-08-31 12:00:09.729904	\N	group	approved		f
168c842c-fd1f-4180-91ce-1aecaac8f282	industrie	{'fr': u'Industrie, services', 'de': u'Industrie, Dienstleistungen', 'en': u'Industry and services', 'it': u'Industria, servizi'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:02:27.05839	active	bb1f2492-aece-4e79-b7bf-546436441f36	168c842c-fd1f-4180-91ce-1aecaac8f282	\N	2015-08-25 14:02:26.928902	2015-08-31 12:00:21.610174	\N	group	approved		f
dc8b567c-fed8-4696-847b-f85510f93d71	handel	{'fr': u'', 'de': u'Handel', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:43.755102	active	5c8ac240-f49a-4a68-a10b-43346e03ced7	dc8b567c-fed8-4696-847b-f85510f93d71	\N	2015-08-25 14:01:43.717176	2015-08-31 12:00:29.247441	\N	group	approved		f
90848388-d0b6-4b97-a686-e93b40832e1e	gesundheit	{'fr': u'Sant\\xe9', 'de': u'Gesundheit', 'en': u'Health', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:18.030175	active	051072fa-f077-46c1-a744-074145df9d03	90848388-d0b6-4b97-a686-e93b40832e1e	\N	2015-08-25 14:01:17.949147	2015-08-31 12:00:35.688441	\N	group	approved		f
28641aa8-b97d-49ed-85bf-c19eb0f729d3	gesetzgebung	{'fr': u'Legislation', 'de': u'Gesetzgebung', 'en': u'Legislation', 'it': u'Legislazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:48.650133	active	07904a86-1261-45dd-81df-b51627ab8e75	28641aa8-b97d-49ed-85bf-c19eb0f729d3	\N	2015-08-25 14:00:48.371024	2015-08-31 12:00:42.584977	\N	group	approved		f
a20e9d52-0d20-413c-a8ad-9ffd4523bec6	geographie	{'fr': u'', 'de': u'Geographie', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:19.757575	active	c526c9ca-178f-4b91-9d72-3a6ed1609d9b	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	\N	2015-08-25 14:00:19.713155	2015-08-31 12:00:48.515241	\N	group	approved		f
79cbe120-e9c6-4249-b934-58ca980606d7	finanzen	{'fr': u'Finances', 'de': u'Finanzen', 'en': u'Finances', 'it': u'Finanze'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:55.195808	active	56c995aa-ab6b-4828-9710-2fe49c13d76b	79cbe120-e9c6-4249-b934-58ca980606d7	\N	2015-08-25 13:59:55.153821	2015-08-31 12:00:53.911178	\N	group	approved		f
42f56f74-074e-4cbb-b91b-deeb1fd58c56	energie	{'fr': u'Energie', 'de': u'Energie', 'en': u'Energy', 'it': u'Energia'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:27.505141	active	a0ecd1b2-bac8-4696-9a65-815b2b705d95	42f56f74-074e-4cbb-b91b-deeb1fd58c56	\N	2015-08-25 13:59:27.425032	2015-08-31 12:00:59.621394	\N	group	approved		f
afcb4a2a-b4b0-4d7c-984a-9078e964be49	bildung	{'fr': u'Education, science', 'de': u'Bildung, Wissenschaft', 'en': u'Education and science', 'it': u'Formazione e scienza'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:48.432831	active	b93a5949-5ca7-4188-ace6-1d7352c40c11	afcb4a2a-b4b0-4d7c-984a-9078e964be49	\N	2015-08-25 13:58:48.376838	2015-08-31 12:01:08.515233	\N	group	approved		f
5389c3f2-2f64-436b-9fac-2d1fc342f7b5	volkswirtschaft	{'fr': u'Economie nationale', 'de': u'Volkswirtschaft', 'en': u'National economy', 'it': u'Economia'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:16:26.069858	active	649e4991-0672-40ea-a763-0edead7486f3	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	\N	2015-08-25 14:16:26.033465	2015-08-31 11:56:56.633963	\N	group	approved		f
33ab70dd-e2da-464a-ae5f-b166f16d9e2c	arbeit	{'fr': u'Travail, r\\xe9mun\\xe9ration', 'de': u'Arbeit, Erwerb', 'en': u'Work and income', 'it': u'Lavoro e reddito'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:57:41.607386	active	c4b8d128-e3b5-439d-8244-5e8fcce20613	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	\N	2015-08-25 13:57:41.331767	2015-08-31 12:05:08.583555	\N	group	approved		f
27b314a5-57b6-4c4e-9c9f-6923365eaecc	raum	{'fr': u'Espace', 'de': u'Raum', 'en': u'Space', 'it': u'Spazio'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:07.986487	active	1c095545-1d23-4082-aa02-7a9c424cfa8c	27b314a5-57b6-4c4e-9c9f-6923365eaecc	\N	2015-08-25 13:48:07.930485	2015-08-31 12:05:21.021387	\N	group	approved		f
64d3b89b-ff79-477e-8fb4-9cfc388b0f58	bevoelkerung	{'fr': u'Population', 'de': u'Bev\\xf6lkerung', 'en': u'Population', 'it': u'Popolazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:47:23.668582	active	d0771be4-1558-4509-9417-4f58de851f86	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	\N	2015-08-25 13:47:23.136218	2015-08-31 12:05:29.736109	\N	group	approved		f
afc7c340-9bdb-4767-bbcb-70094a1d0dcc	verwaltung	{'fr': u'Administration', 'de': u'Verwaltung', 'en': u'Administration', 'it': u'Amministrazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:57.072436	active	cdafd7cd-5ad2-481d-ac12-2e9004c2852b	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	\N	2015-08-25 14:15:56.953398	2015-08-31 11:58:35.472119	\N	group	approved		f
6aace7ef-f167-40c9-a0d7-87e7e2681c07	tourismus	{'fr': u'Tourisme', 'de': u'Tourismus', 'en': u'Tourism', 'it': u'Turismo'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:32.725207	active	11c2b38a-c6de-4648-9056-156cc3ac6321	6aace7ef-f167-40c9-a0d7-87e7e2681c07	\N	2015-08-25 14:15:32.496199	2015-08-31 11:58:45.586066	\N	group	approved		f
e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	statistische-grundlagen	{'fr': u'Bases statistiques', 'de': u'Statistische Grundlagen', 'en': u'Statistical basis', 'it': u'Basi statistiche'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:07.102775	active	004a195f-0c79-4ea5-a210-1f7ba0f75b3b	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	\N	2015-08-25 14:15:07.002868	2015-08-31 11:58:52.58848	\N	group	approved		f
c7521678-de76-4731-9075-25d1d6150ecf	landwirtschaft	{'fr': u'Agriculture, sylviculture', 'de': u'Land- und Forstwirtschaft', 'en': u'Agriculture, forestry', 'it': u'Agricoltura, selvicoltura'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:09:59.733494	active	a3df1166-3bbb-4209-9088-cb2f00116e1f	c7521678-de76-4731-9075-25d1d6150ecf	\N	2015-08-25 14:09:57.489689	2015-08-31 11:59:32.784979	\N	group	approved		f
0d77b36f-1de6-40b3-9915-be91ee469f63	kultur	{"fr": "Culture, m\\u00e9dias, soci\\u00e9t\\u00e9 de l\\\\'information, sport", "de": "Kultur, Medien, Informationsgesellschaft, Sport", "en": "", "it": "Cultura, media, societ\\u00e0 dell\\\\'informazione, sport"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:55.965249	active	5088f4cf-8906-43cb-af06-f2e6500be581	0d77b36f-1de6-40b3-9915-be91ee469f63	\N	2015-08-31 11:59:38.921898	2015-09-21 13:22:26.205222	\N	group	approved		f
dc8b567c-fed8-4696-847b-f85510f93d71	handel	{"fr": "", "de": "Handel", "en": "", "it": ""}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:43.755102	active	642455a1-d5e1-4a9a-b868-729291a89a32	dc8b567c-fed8-4696-847b-f85510f93d71	\N	2015-08-31 12:00:29.247441	2015-09-21 13:23:31.196182	\N	group	approved		f
90848388-d0b6-4b97-a686-e93b40832e1e	gesundheit	{"fr": "Sant\\u00e9", "de": "Gesundheit", "en": "Health", "it": ""}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:18.030175	active	7974e1c4-6375-465b-a2c8-c0647dc6740b	90848388-d0b6-4b97-a686-e93b40832e1e	\N	2015-08-31 12:00:35.688441	2015-09-21 13:24:31.18924	\N	group	approved		f
a20e9d52-0d20-413c-a8ad-9ffd4523bec6	geographie	{"fr": "", "de": "Geographie", "en": "", "it": ""}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:19.757575	active	4bc045c4-3139-4673-8b9a-89f140adc30f	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	\N	2015-08-31 12:00:48.515241	2015-09-21 13:24:50.915604	\N	group	approved		f
afc7c340-9bdb-4767-bbcb-70094a1d0dcc	verwaltung	{"fr": "Administration", "de": "Verwaltung", "en": "Administration", "it": "Amministrazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:57.072436	active	673f91b5-fb2b-46dc-be95-b88bfde8fcb9	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	\N	2015-08-31 11:58:35.472119	2015-09-21 13:38:17.45145	\N	group	approved		f
6aace7ef-f167-40c9-a0d7-87e7e2681c07	tourismus	{"fr": "Tourisme", "de": "Tourismus", "en": "Tourism", "it": "Turismo"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:32.725207	active	358c9eb1-a60c-4b20-a7ad-8487a1d02e17	6aace7ef-f167-40c9-a0d7-87e7e2681c07	\N	2015-08-31 11:58:45.586066	2015-09-21 13:38:36.626812	\N	group	approved		f
e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	statistische-grundlagen	{"fr": "Bases statistiques", "de": "Statistische Grundlagen", "en": "Statistical basis", "it": "Basi statistiche"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:07.102775	active	fc36ada8-7dfe-4747-9517-e96e0fcfaa8c	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	\N	2015-08-31 11:58:52.58848	2015-09-21 13:38:50.514962	\N	group	approved		f
011e8933-7b86-412c-8fe6-752060d8e103	soziale-sicherheit	{"fr": "Protection sociale", "de": "Soziale Sicherheit", "en": "Social security", "it": "Sicurezza sociale"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:14:29.364706	active	83d49224-f922-4467-9d74-d761e2b98cf8	011e8933-7b86-412c-8fe6-752060d8e103	\N	2015-08-31 11:58:59.663296	2015-09-21 13:39:10.974461	\N	group	approved		f
1deb7a82-612f-46ce-9c62-89c7c0b38ddf	preise	{"fr": "Prix", "de": "Preise", "en": "Prices", "it": "Prezzi"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:56.103902	active	3390c572-dd62-434d-b2d3-f8c4557a4470	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	\N	2015-08-31 11:59:06.170639	2015-09-21 13:39:23.656281	\N	group	approved		f
8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	mobilitaet	{"fr": "Mobilit\\u00e9 et transports", "de": "Mobilit\\u00e4t und Verkehr", "en": "Mobility and Transport", "it": "Mobilit\\u00e0 e trasporti"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:10:45.656859	active	5d043c9b-a38c-46f3-b4fa-47f32b2c3b5e	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	\N	2015-08-31 11:59:26.422869	2015-09-21 13:40:01.668867	\N	group	approved		f
c7521678-de76-4731-9075-25d1d6150ecf	landwirtschaft	{"fr": "Agriculture, sylviculture", "de": "Land- und Forstwirtschaft", "en": "Agriculture, forestry", "it": "Agricoltura, selvicoltura"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:09:59.733494	active	7ff1d24f-34bf-43c9-b697-ccf45dbea0aa	c7521678-de76-4731-9075-25d1d6150ecf	\N	2015-08-31 11:59:32.784979	2015-09-21 13:40:16.712743	\N	group	approved		f
2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	kriminalitaet	{"fr": "Criminalit\\u00e9, droit p\\u00e9nal", "de": "Kriminalit\\u00e4t, Strafrecht", "en": "Crime, criminal justice", "it": "Criminalit\\u00e0, diritto penale"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:08.838883	active	a21fc96a-4835-4efa-be9f-42bcdb367252	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	\N	2015-08-31 12:00:09.729904	2015-09-21 13:40:39.114566	\N	group	approved		f
168c842c-fd1f-4180-91ce-1aecaac8f282	industrie	{"fr": "Industrie, services", "de": "Industrie, Dienstleistungen", "en": "Industry and services", "it": "Industria, servizi"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:02:27.05839	active	1f566931-00a9-4be0-8c87-54a5e15c38a3	168c842c-fd1f-4180-91ce-1aecaac8f282	\N	2015-08-31 12:00:21.610174	2015-09-21 13:40:51.630312	\N	group	approved		f
28641aa8-b97d-49ed-85bf-c19eb0f729d3	gesetzgebung	{"fr": "Legislation", "de": "Gesetzgebung", "en": "Legislation", "it": "Legislazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:48.650133	active	26cc532f-1717-4791-81c3-c8863a043862	28641aa8-b97d-49ed-85bf-c19eb0f729d3	\N	2015-08-31 12:00:42.584977	2015-09-21 13:43:48.027725	\N	group	approved		f
79cbe120-e9c6-4249-b934-58ca980606d7	finanzen	{"fr": "Finances", "de": "Finanzen", "en": "Finances", "it": "Finanze"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:55.195808	active	ccfd4ea6-5798-4b78-aa37-c80fb5639060	79cbe120-e9c6-4249-b934-58ca980606d7	\N	2015-08-31 12:00:53.911178	2015-09-21 13:45:34.889224	\N	group	approved		f
42f56f74-074e-4cbb-b91b-deeb1fd58c56	energie	{"fr": "Energie", "de": "Energie", "en": "Energy", "it": "Energia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:27.505141	active	c1db3782-5aa7-4817-a2fc-c418b125fcb1	42f56f74-074e-4cbb-b91b-deeb1fd58c56	\N	2015-08-31 12:00:59.621394	2015-09-21 13:45:45.054328	\N	group	approved		f
afcb4a2a-b4b0-4d7c-984a-9078e964be49	bildung	{"fr": "Education, science", "de": "Bildung, Wissenschaft", "en": "Education and science", "it": "Formazione e scienza"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:48.432831	active	593cf131-afce-4622-95b4-f89389878ba5	afcb4a2a-b4b0-4d7c-984a-9078e964be49	\N	2015-08-31 12:01:08.515233	2015-09-21 13:45:58.009761	\N	group	approved		f
7d52132f-7119-41ab-b2b8-e62d69a834ce	bauwesen	{'fr': u'Construction, logement', 'de': u'Bau- und Wohnungswesen', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:14.424398	active	d9eb027c-b163-453b-aa63-3bd148d8a8de	7d52132f-7119-41ab-b2b8-e62d69a834ce	\N	2015-08-25 13:58:14.353421	2015-08-31 12:04:53.855371	\N	group	approved		f
7dbaad15-597f-499c-9a72-95de38b95cad	bundesarchiv	{"fr": "Archives f\\u00e9d\\u00e9rales", "de": "Bundesarchiv", "en": "Federal Archives", "it": "Archivio federale"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-09-14 11:36:11.438714	active	54f98a24-da83-46f5-8217-6054cde1c239	7dbaad15-597f-499c-9a72-95de38b95cad	\N	2015-09-14 11:36:11.232771	9999-12-31 00:00:00	\N	organization	approved		t
9beba14c-eab8-426e-89ae-757bc2e6445e	politik	{"fr": "Politique", "de": "Politik", "en": "", "it": "Politica"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:29.816322	active	f14dfeff-fe1c-4d5e-99e0-8bb7b2f9ddab	9beba14c-eab8-426e-89ae-757bc2e6445e	\N	2015-08-31 11:59:14.008951	2015-09-21 13:19:30.691265	\N	group	approved		f
620fdda8-a92d-421b-89ad-4ef1b57a9458	sicherheit	{"fr": "", "de": "\\u00d6ffentliche Ordnung und Sicherheit", "en": "", "it": ""}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:12:43.038972	active	07dd5069-04bf-4b36-9869-ec93cd5e2b6c	620fdda8-a92d-421b-89ad-4ef1b57a9458	\N	2015-08-31 11:59:20.309131	2015-09-21 13:20:21.080258	\N	group	approved		f
7d52132f-7119-41ab-b2b8-e62d69a834ce	bauwesen	{"fr": "Construction, logement", "de": "Bau- und Wohnungswesen", "en": "", "it": ""}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:14.424398	active	04f3908a-af7c-4932-9698-dc38826138a1	7d52132f-7119-41ab-b2b8-e62d69a834ce	\N	2015-08-31 12:04:53.855371	2015-09-21 13:25:53.342809	\N	group	approved		f
27b314a5-57b6-4c4e-9c9f-6923365eaecc	raum	{"fr": "Espace", "de": "Raum", "en": "Space", "it": "Spazio"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:07.986487	active	70378e95-90f7-4011-b9b9-f2dbd80fc621	27b314a5-57b6-4c4e-9c9f-6923365eaecc	\N	2015-08-31 12:05:21.021387	2015-09-21 13:26:58.619724	\N	group	approved		f
5389c3f2-2f64-436b-9fac-2d1fc342f7b5	volkswirtschaft	{"fr": "Economie nationale", "de": "Volkswirtschaft", "en": "National economy", "it": "Economia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:16:26.069858	active	5f6a6f73-7dff-4ab9-8fc0-b75916de00ee	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	\N	2015-08-31 11:56:56.633963	2015-09-21 13:37:03.101776	\N	group	approved		f
5389c3f2-2f64-436b-9fac-2d1fc342f7b5	national-economy	{"fr": "Economie nationale", "de": "Volkswirtschaft", "en": "National economy", "it": "Economia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:16:26.069858	active	1d6f940c-7145-4746-b7c9-7421a78e1dde	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	\N	2015-09-21 13:37:03.101776	9999-12-31 00:00:00	\N	group	approved		f
afc7c340-9bdb-4767-bbcb-70094a1d0dcc	administration	{"fr": "Administration", "de": "Verwaltung", "en": "Administration", "it": "Amministrazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:57.072436	active	03e310f1-a318-4dd6-9c62-dac47e4f26e4	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	\N	2015-09-21 13:38:17.45145	9999-12-31 00:00:00	\N	group	approved		f
6aace7ef-f167-40c9-a0d7-87e7e2681c07	tourism	{"fr": "Tourisme", "de": "Tourismus", "en": "Tourism", "it": "Turismo"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:32.725207	active	9398ccc7-afdb-4e77-aeac-e7146c7b5d2d	6aace7ef-f167-40c9-a0d7-87e7e2681c07	\N	2015-09-21 13:38:36.626812	9999-12-31 00:00:00	\N	group	approved		f
9beba14c-eab8-426e-89ae-757bc2e6445e	politik	{"fr": "Politique", "de": "Politik", "en": "Politics", "it": "Politica"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:29.816322	active	75a7dd8a-7b38-4885-9bec-b5ddbfa17b12	9beba14c-eab8-426e-89ae-757bc2e6445e	\N	2015-09-21 13:19:30.691265	2015-09-21 13:39:32.248365	\N	group	approved		f
620fdda8-a92d-421b-89ad-4ef1b57a9458	sicherheit	{"fr": "Ordre et s\\u00e9curit\\u00e9 publics", "de": "\\u00d6ffentliche Ordnung und Sicherheit", "en": "Public order and security", "it": "Ordine pubblico e sicurezza pubblica"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:12:43.038972	active	4790cc3f-5ceb-4f8d-97a1-6e9b4391aae9	620fdda8-a92d-421b-89ad-4ef1b57a9458	\N	2015-09-21 13:20:21.080258	2015-09-21 13:39:48.062798	\N	group	approved		f
0d77b36f-1de6-40b3-9915-be91ee469f63	kultur	{"fr": "Culture, m\\u00e9dias, soci\\u00e9t\\u00e9 de l\\\\'information, sport", "de": "Kultur, Medien, Informationsgesellschaft, Sport", "en": "Culture, media, information society, sport", "it": "Cultura, media, societ\\u00e0 dell\\\\'informazione, sport"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:55.965249	active	46dfc0db-85bc-4805-9b42-e016add31502	0d77b36f-1de6-40b3-9915-be91ee469f63	\N	2015-09-21 13:22:26.205222	2015-09-21 13:40:29.192012	\N	group	approved		f
dc8b567c-fed8-4696-847b-f85510f93d71	handel	{"fr": "Commerce", "de": "Handel", "en": "Trade", "it": "Commercio"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:43.755102	active	d93b1c52-9c73-4be6-a073-081b6f42aef7	dc8b567c-fed8-4696-847b-f85510f93d71	\N	2015-09-21 13:23:31.196182	2015-09-21 13:41:03.978948	\N	group	approved		f
90848388-d0b6-4b97-a686-e93b40832e1e	gesundheit	{"fr": "Sant\\u00e9", "de": "Gesundheit", "en": "Health", "it": "Sanit\\u00e0"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:18.030175	active	13238840-f71f-4121-bc57-9e6def7c1556	90848388-d0b6-4b97-a686-e93b40832e1e	\N	2015-09-21 13:24:31.18924	2015-09-21 13:41:17.098511	\N	group	approved		f
a20e9d52-0d20-413c-a8ad-9ffd4523bec6	geographie	{"fr": "G\\u00e9ographie", "de": "Geographie", "en": "Geography", "it": "Geografia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:19.757575	active	6ee21dee-ca1b-4438-a3e0-0f83ff5be377	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	\N	2015-09-21 13:24:50.915604	2015-09-21 13:45:22.49051	\N	group	approved		f
7d52132f-7119-41ab-b2b8-e62d69a834ce	bauwesen	{"fr": "Construction, logement", "de": "Bau- und Wohnungswesen", "en": "Construction and housing", "it": "Costruzione e abitazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:14.424398	active	166f0294-b5e7-4f06-87ec-53978d3cb161	7d52132f-7119-41ab-b2b8-e62d69a834ce	\N	2015-09-21 13:25:53.342809	2015-09-21 13:46:16.956688	\N	group	approved		f
33ab70dd-e2da-464a-ae5f-b166f16d9e2c	arbeit	{"fr": "Travail, r\\u00e9mun\\u00e9ration", "de": "Arbeit, Erwerb", "en": "Work and income", "it": "Lavoro e reddito"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:57:41.607386	active	679545c5-3292-4119-8583-fd02cc21b8b2	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	\N	2015-08-31 12:05:08.583555	2015-09-21 13:46:29.828276	\N	group	approved		f
27b314a5-57b6-4c4e-9c9f-6923365eaecc	raum	{"fr": "Territoire et environnement", "de": "Raum und Umwelt", "en": "Territory and environment", "it": "Territorio e ambiente"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:07.986487	active	d312c928-9963-4934-8bc6-49d1fdce8b84	27b314a5-57b6-4c4e-9c9f-6923365eaecc	\N	2015-09-21 13:26:58.619724	2015-09-21 13:46:45.482989	\N	group	approved		f
64d3b89b-ff79-477e-8fb4-9cfc388b0f58	bevoelkerung	{"fr": "Population", "de": "Bev\\u00f6lkerung", "en": "Population", "it": "Popolazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:47:23.668582	active	f22a1af7-ed33-4989-a685-75196ad998ce	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	\N	2015-08-31 12:05:29.736109	2015-09-21 13:46:59.55476	\N	group	approved		f
e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	statistical-basis	{"fr": "Bases statistiques", "de": "Statistische Grundlagen", "en": "Statistical basis", "it": "Basi statistiche"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:07.102775	active	7e360e6f-c8c4-43b9-b536-8c4f19549617	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	\N	2015-09-21 13:38:50.514962	9999-12-31 00:00:00	\N	group	approved		f
1deb7a82-612f-46ce-9c62-89c7c0b38ddf	prices	{"fr": "Prix", "de": "Preise", "en": "Prices", "it": "Prezzi"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:56.103902	active	3cc13ca1-c48e-4e39-bede-018e97e50e87	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	\N	2015-09-21 13:39:23.656281	9999-12-31 00:00:00	\N	group	approved		f
620fdda8-a92d-421b-89ad-4ef1b57a9458	public-order	{"fr": "Ordre et s\\u00e9curit\\u00e9 publics", "de": "\\u00d6ffentliche Ordnung und Sicherheit", "en": "Public order and security", "it": "Ordine pubblico e sicurezza pubblica"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:12:43.038972	active	c88b6998-0280-4534-87d4-1c593386089e	620fdda8-a92d-421b-89ad-4ef1b57a9458	\N	2015-09-21 13:39:48.062798	9999-12-31 00:00:00	\N	group	approved		f
c7521678-de76-4731-9075-25d1d6150ecf	agriculture	{"fr": "Agriculture, sylviculture", "de": "Land- und Forstwirtschaft", "en": "Agriculture, forestry", "it": "Agricoltura, selvicoltura"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:09:59.733494	active	3e99161e-dcb9-4763-915c-dc0317bdcea7	c7521678-de76-4731-9075-25d1d6150ecf	\N	2015-09-21 13:40:16.712743	9999-12-31 00:00:00	\N	group	approved		f
2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	crime	{"fr": "Criminalit\\u00e9, droit p\\u00e9nal", "de": "Kriminalit\\u00e4t, Strafrecht", "en": "Crime, criminal justice", "it": "Criminalit\\u00e0, diritto penale"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:08.838883	active	cba345b5-667f-4542-98e8-c134004fe722	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	\N	2015-09-21 13:40:39.114566	9999-12-31 00:00:00	\N	group	approved		f
dc8b567c-fed8-4696-847b-f85510f93d71	trade	{"fr": "Commerce", "de": "Handel", "en": "Trade", "it": "Commercio"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:43.755102	active	065e4a59-17c0-442a-8a1d-c913999f90b8	dc8b567c-fed8-4696-847b-f85510f93d71	\N	2015-09-21 13:41:03.978948	9999-12-31 00:00:00	\N	group	approved		f
011e8933-7b86-412c-8fe6-752060d8e103	social-security	{"fr": "Protection sociale", "de": "Soziale Sicherheit", "en": "Social security", "it": "Sicurezza sociale"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:14:29.364706	active	fd15758a-a4cf-47d5-99da-7d1ff56f61d8	011e8933-7b86-412c-8fe6-752060d8e103	\N	2015-09-21 13:39:10.974461	9999-12-31 00:00:00	\N	group	approved		f
9beba14c-eab8-426e-89ae-757bc2e6445e	politics	{"fr": "Politique", "de": "Politik", "en": "Politics", "it": "Politica"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:29.816322	active	6ea7559e-c018-4b56-b5bd-b99c823737ea	9beba14c-eab8-426e-89ae-757bc2e6445e	\N	2015-09-21 13:39:32.248365	9999-12-31 00:00:00	\N	group	approved		f
8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	mobility	{"fr": "Mobilit\\u00e9 et transports", "de": "Mobilit\\u00e4t und Verkehr", "en": "Mobility and Transport", "it": "Mobilit\\u00e0 e trasporti"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:10:45.656859	active	b0c226e7-5355-4dcb-8cd9-0edf231edc45	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	\N	2015-09-21 13:40:01.668867	9999-12-31 00:00:00	\N	group	approved		f
0d77b36f-1de6-40b3-9915-be91ee469f63	culture	{"fr": "Culture, m\\u00e9dias, soci\\u00e9t\\u00e9 de l\\\\'information, sport", "de": "Kultur, Medien, Informationsgesellschaft, Sport", "en": "Culture, media, information society, sport", "it": "Cultura, media, societ\\u00e0 dell\\\\'informazione, sport"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:55.965249	active	57dcd4e2-8cea-411c-bf25-d3014c1e37fe	0d77b36f-1de6-40b3-9915-be91ee469f63	\N	2015-09-21 13:40:29.192012	9999-12-31 00:00:00	\N	group	approved		f
168c842c-fd1f-4180-91ce-1aecaac8f282	industry	{"fr": "Industrie, services", "de": "Industrie, Dienstleistungen", "en": "Industry and services", "it": "Industria, servizi"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:02:27.05839	active	e38b54db-e190-4119-a107-e25813354f4f	168c842c-fd1f-4180-91ce-1aecaac8f282	\N	2015-09-21 13:40:51.630312	9999-12-31 00:00:00	\N	group	approved		f
90848388-d0b6-4b97-a686-e93b40832e1e	health	{"fr": "Sant\\u00e9", "de": "Gesundheit", "en": "Health", "it": "Sanit\\u00e0"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:18.030175	active	9721d798-a9ab-4f4e-8570-67299ea8b9b2	90848388-d0b6-4b97-a686-e93b40832e1e	\N	2015-09-21 13:41:17.098511	9999-12-31 00:00:00	\N	group	approved		f
28641aa8-b97d-49ed-85bf-c19eb0f729d3	legislation	{"fr": "Legislation", "de": "Gesetzgebung", "en": "Legislation", "it": "Legislazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:48.650133	active	487fd57e-5ffc-40c1-8ea6-fb92cf4e5f62	28641aa8-b97d-49ed-85bf-c19eb0f729d3	\N	2015-09-21 13:43:48.027725	9999-12-31 00:00:00	\N	group	approved		f
a20e9d52-0d20-413c-a8ad-9ffd4523bec6	geography	{"fr": "G\\u00e9ographie", "de": "Geographie", "en": "Geography", "it": "Geografia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:19.757575	active	88e739b1-cf7d-461c-bfe1-f66fcf20ae4f	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	\N	2015-09-21 13:45:22.49051	9999-12-31 00:00:00	\N	group	approved		f
79cbe120-e9c6-4249-b934-58ca980606d7	finances	{"fr": "Finances", "de": "Finanzen", "en": "Finances", "it": "Finanze"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:55.195808	active	e61bb842-4999-478c-b10a-0d717ba16a6b	79cbe120-e9c6-4249-b934-58ca980606d7	\N	2015-09-21 13:45:34.889224	9999-12-31 00:00:00	\N	group	approved		f
42f56f74-074e-4cbb-b91b-deeb1fd58c56	energy	{"fr": "Energie", "de": "Energie", "en": "Energy", "it": "Energia"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:27.505141	active	cce880ca-fb03-407f-a3c6-4ecc52c19c74	42f56f74-074e-4cbb-b91b-deeb1fd58c56	\N	2015-09-21 13:45:45.054328	9999-12-31 00:00:00	\N	group	approved		f
afcb4a2a-b4b0-4d7c-984a-9078e964be49	education	{"fr": "Education, science", "de": "Bildung, Wissenschaft", "en": "Education and science", "it": "Formazione e scienza"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:48.432831	active	a754e8f1-38e6-45cc-9c72-77ee4fc21ea6	afcb4a2a-b4b0-4d7c-984a-9078e964be49	\N	2015-09-21 13:45:58.009761	9999-12-31 00:00:00	\N	group	approved		f
7d52132f-7119-41ab-b2b8-e62d69a834ce	construction	{"fr": "Construction, logement", "de": "Bau- und Wohnungswesen", "en": "Construction and housing", "it": "Costruzione e abitazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:14.424398	active	6f8befca-ecba-48d9-82f3-ff021f021df5	7d52132f-7119-41ab-b2b8-e62d69a834ce	\N	2015-09-21 13:46:16.956688	9999-12-31 00:00:00	\N	group	approved		f
33ab70dd-e2da-464a-ae5f-b166f16d9e2c	work	{"fr": "Travail, r\\u00e9mun\\u00e9ration", "de": "Arbeit, Erwerb", "en": "Work and income", "it": "Lavoro e reddito"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:57:41.607386	active	730be727-68ad-4b7d-85bd-cc0000d1edb2	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	\N	2015-09-21 13:46:29.828276	9999-12-31 00:00:00	\N	group	approved		f
27b314a5-57b6-4c4e-9c9f-6923365eaecc	territory	{"fr": "Territoire et environnement", "de": "Raum und Umwelt", "en": "Territory and environment", "it": "Territorio e ambiente"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:07.986487	active	2f78feef-cc98-44b7-8ade-b2830669fa90	27b314a5-57b6-4c4e-9c9f-6923365eaecc	\N	2015-09-21 13:46:45.482989	9999-12-31 00:00:00	\N	group	approved		f
64d3b89b-ff79-477e-8fb4-9cfc388b0f58	population	{"fr": "Population", "de": "Bev\\u00f6lkerung", "en": "Population", "it": "Popolazione"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:47:23.668582	active	9202f92a-c919-485c-badd-dd244c00b9d7	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	\N	2015-09-21 13:46:59.55476	9999-12-31 00:00:00	\N	group	approved		f
\.


--
-- Data for Name: group_role; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY group_role (user_object_role_id, group_id) FROM stdin;
0f52f813-29b4-4b2b-b8b3-6b0fd52b81f7	64d3b89b-ff79-477e-8fb4-9cfc388b0f58
5a33dfd8-7f08-449e-808c-21fd20b0f816	64d3b89b-ff79-477e-8fb4-9cfc388b0f58
528cdcc9-b69b-4cdd-87c3-dbd291a6ee35	64d3b89b-ff79-477e-8fb4-9cfc388b0f58
b5a071f6-1c5b-43f2-9714-ac683144ab34	27b314a5-57b6-4c4e-9c9f-6923365eaecc
445a9ae2-317f-42f5-bcc3-814a4d3f7d95	27b314a5-57b6-4c4e-9c9f-6923365eaecc
7359149d-3669-49f8-830f-9b5118abe0b4	27b314a5-57b6-4c4e-9c9f-6923365eaecc
67ec23d0-b554-495e-a0ce-dcdbb6b18a6b	73124d1e-c2aa-4d20-a42d-fa71b8946e93
044da59f-6e11-466e-b133-6eee0fa46e5a	73124d1e-c2aa-4d20-a42d-fa71b8946e93
33481a32-015a-44ca-a4c8-59c04e805fb9	73124d1e-c2aa-4d20-a42d-fa71b8946e93
fa6303aa-c279-4583-814f-d0b0726744af	33ab70dd-e2da-464a-ae5f-b166f16d9e2c
891aa157-5aa7-4152-961e-983537878201	33ab70dd-e2da-464a-ae5f-b166f16d9e2c
0ba3989b-20db-45a0-a417-667f20ae4ee9	33ab70dd-e2da-464a-ae5f-b166f16d9e2c
fff3f249-c03d-49e9-8f8e-df222981916e	7d52132f-7119-41ab-b2b8-e62d69a834ce
eac291ee-5bab-44cf-8145-560593168bb2	7d52132f-7119-41ab-b2b8-e62d69a834ce
fd6787da-d71f-4766-8560-8808c7876773	7d52132f-7119-41ab-b2b8-e62d69a834ce
1ead77ae-5794-4cbc-9a97-046bee9bdd91	afcb4a2a-b4b0-4d7c-984a-9078e964be49
509f1ebc-445f-4a7e-8e5e-c95cecc6c45d	afcb4a2a-b4b0-4d7c-984a-9078e964be49
c53b03d0-db77-4670-ba67-0846c9b02fbf	afcb4a2a-b4b0-4d7c-984a-9078e964be49
aeaa2281-fb51-4a43-851f-07681555b044	42f56f74-074e-4cbb-b91b-deeb1fd58c56
67a9c40f-17b8-43c7-a388-efdbd47d0cfa	42f56f74-074e-4cbb-b91b-deeb1fd58c56
3792c2ba-d2d2-49d4-9d2c-91c2a3d5b4f1	42f56f74-074e-4cbb-b91b-deeb1fd58c56
1290387f-2b5e-4189-9580-1958fe48d7b8	79cbe120-e9c6-4249-b934-58ca980606d7
8f356804-8524-4539-a7a2-f67c98f97c4a	79cbe120-e9c6-4249-b934-58ca980606d7
8ffaf5d6-fe61-433e-ac42-d8440898568c	79cbe120-e9c6-4249-b934-58ca980606d7
ec6440a4-60d8-4ac3-b5a2-d78960dd6749	a20e9d52-0d20-413c-a8ad-9ffd4523bec6
03fe4ae4-01ba-4b84-aea8-55f43a4a8c04	a20e9d52-0d20-413c-a8ad-9ffd4523bec6
284a6740-d612-4e38-93e3-1c999a53cc30	a20e9d52-0d20-413c-a8ad-9ffd4523bec6
08aaea75-0eb6-4c7c-ac43-eb96d1e7dea0	28641aa8-b97d-49ed-85bf-c19eb0f729d3
606cf7ea-2d49-4d28-9bad-20fda140e8f0	28641aa8-b97d-49ed-85bf-c19eb0f729d3
9679298e-741a-436c-a7ae-6143a2919f41	28641aa8-b97d-49ed-85bf-c19eb0f729d3
d8ec62d6-9488-4a95-8688-aecfe72bcdd6	90848388-d0b6-4b97-a686-e93b40832e1e
d8b37b4f-c23c-4731-8a1b-ae1a6859513e	90848388-d0b6-4b97-a686-e93b40832e1e
f99c6d1c-2a96-469f-bc89-25c1e055c4f6	90848388-d0b6-4b97-a686-e93b40832e1e
4afd3cf1-93b8-4ed3-aadb-9dc358010b09	dc8b567c-fed8-4696-847b-f85510f93d71
7cd72feb-9fa3-4fbd-8ed9-37ecb250cf99	dc8b567c-fed8-4696-847b-f85510f93d71
13c713d0-6887-43ca-b78e-a93bf434859c	dc8b567c-fed8-4696-847b-f85510f93d71
47697240-61b0-4236-856b-72646880ede1	168c842c-fd1f-4180-91ce-1aecaac8f282
715c325f-dc83-4a87-985f-8d0da5358dab	168c842c-fd1f-4180-91ce-1aecaac8f282
ea15ccad-5dea-4630-ba4d-1d6585facf48	168c842c-fd1f-4180-91ce-1aecaac8f282
a4d82902-9a53-4975-80a3-b0f9df51fcce	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1
9654b32d-a35a-4942-9b6e-6882f88cf3c8	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1
6fbcb420-a236-47d1-926c-7e50504c0c9d	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1
afd31afc-9fdd-44d3-ac58-701acd9a2fc2	0d77b36f-1de6-40b3-9915-be91ee469f63
f6030407-9ae4-49bb-8df9-e1a6be6d79ed	0d77b36f-1de6-40b3-9915-be91ee469f63
07fa90ab-b8c8-48e3-88d2-4b98b8d33e32	0d77b36f-1de6-40b3-9915-be91ee469f63
adce6639-527e-449e-bd1a-965b237e3e77	c7521678-de76-4731-9075-25d1d6150ecf
021f2ef6-c3eb-40f0-8109-9bdd4a83c199	c7521678-de76-4731-9075-25d1d6150ecf
deebd5ef-f68d-4315-91d9-a0282c439d19	c7521678-de76-4731-9075-25d1d6150ecf
baaf3f4b-0c8c-4b9b-8f9c-8b10811f2670	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa
ca65fd94-87ec-4e95-833a-de1e59ffb545	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa
cdae7457-7334-46fe-822a-33dadb87c6d7	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa
82daa643-c099-49cb-a32f-d9d79889ff11	620fdda8-a92d-421b-89ad-4ef1b57a9458
c7bbdb82-e5cb-47ed-bac0-6338927ab163	620fdda8-a92d-421b-89ad-4ef1b57a9458
b54906b1-6708-4d7d-99e5-d55e9ce23952	620fdda8-a92d-421b-89ad-4ef1b57a9458
61ecc104-b8a2-4b59-b542-c483a0a63701	9beba14c-eab8-426e-89ae-757bc2e6445e
0ac24f1c-241c-4be1-81cc-310d4ca4fa8a	9beba14c-eab8-426e-89ae-757bc2e6445e
8b1b4a09-3e06-4271-9bb6-14e5de8a908f	9beba14c-eab8-426e-89ae-757bc2e6445e
00473bc2-1895-4715-bc53-d6f9c41a2df5	1deb7a82-612f-46ce-9c62-89c7c0b38ddf
45ea28bd-b129-4a85-8d7e-e23869db0788	1deb7a82-612f-46ce-9c62-89c7c0b38ddf
f2c03222-a6ad-4f8c-8ae2-a8784a055a22	1deb7a82-612f-46ce-9c62-89c7c0b38ddf
95c2492f-77f0-45bd-86ac-521d3606109c	011e8933-7b86-412c-8fe6-752060d8e103
78dd3626-8edd-4347-b413-4e03c572bd84	011e8933-7b86-412c-8fe6-752060d8e103
20de092a-b7d4-41d1-b8ec-1b1728361242	011e8933-7b86-412c-8fe6-752060d8e103
c166e550-a3a5-4592-ba4f-9393784dcba6	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2
6cfad721-cdb2-4e75-922e-ef21e9d80773	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2
e2ed84b0-6bd7-49f2-b713-223c74f00124	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2
ae62c689-13a8-46f2-b82c-200b4ef6bac0	6aace7ef-f167-40c9-a0d7-87e7e2681c07
8747e37a-a9a6-47d3-9b93-743b6e827617	6aace7ef-f167-40c9-a0d7-87e7e2681c07
7cd72b77-0991-48c9-b211-5cf19f392237	6aace7ef-f167-40c9-a0d7-87e7e2681c07
c4a55872-b871-4312-9f57-f8bb63a3336d	afc7c340-9bdb-4767-bbcb-70094a1d0dcc
cba2b382-b318-4f40-a228-3f440505d463	afc7c340-9bdb-4767-bbcb-70094a1d0dcc
5e99b368-d2d5-4a31-b62f-61f84c2ea775	afc7c340-9bdb-4767-bbcb-70094a1d0dcc
655702c4-e422-4d2c-b212-64f53164373e	5389c3f2-2f64-436b-9fac-2d1fc342f7b5
c6345f8a-656e-432b-b61c-fe231071bdf6	5389c3f2-2f64-436b-9fac-2d1fc342f7b5
30da21a0-1e31-4fe8-8d8a-b612ff5739f0	5389c3f2-2f64-436b-9fac-2d1fc342f7b5
c0c4dd1d-5dff-401c-8aeb-65213da5a064	7dbaad15-597f-499c-9a72-95de38b95cad
a602842f-85fd-44d6-9676-366c92e9d06c	7dbaad15-597f-499c-9a72-95de38b95cad
33473081-0708-4fec-bbe1-113172458b76	7dbaad15-597f-499c-9a72-95de38b95cad
\.


--
-- Data for Name: harvest_gather_error; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY harvest_gather_error (id, harvest_job_id, message, created) FROM stdin;
\.


--
-- Data for Name: harvest_job; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY harvest_job (id, created, gather_started, gather_finished, finished, source_id, status) FROM stdin;
\.


--
-- Data for Name: harvest_object; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY harvest_object (id, guid, current, gathered, fetch_started, content, fetch_finished, import_started, import_finished, state, metadata_modified_date, retry_times, harvest_job_id, harvest_source_id, package_id, report_status) FROM stdin;
\.


--
-- Data for Name: harvest_object_error; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY harvest_object_error (id, harvest_object_id, message, stage, line, created) FROM stdin;
\.


--
-- Data for Name: harvest_object_extra; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY harvest_object_extra (id, harvest_object_id, key, value) FROM stdin;
\.


--
-- Data for Name: harvest_source; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY harvest_source (id, url, title, description, config, created, type, active, user_id, publisher_id, frequency, next_run) FROM stdin;
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY member (id, table_id, group_id, state, revision_id, table_name, capacity) FROM stdin;
f68a21ec-8dea-4739-8155-43e1d2676020	082dec4d-1b01-4463-886e-6bb9e5b3a69a	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	active	ea6c0857-eba7-4b31-8cc0-3dd05ad84a5c	user	admin
ab72127d-494a-472f-a956-255dac01c1a5	082dec4d-1b01-4463-886e-6bb9e5b3a69a	27b314a5-57b6-4c4e-9c9f-6923365eaecc	active	c9886396-65e5-4290-b903-e99d182705ed	user	admin
bbb770af-7e10-46c0-bb6f-a299de03f984	082dec4d-1b01-4463-886e-6bb9e5b3a69a	73124d1e-c2aa-4d20-a42d-fa71b8946e93	active	4e6a2bb3-0956-4dfc-99ac-d6671c8a397c	user	admin
1330a4c9-2952-4425-9f1c-6ec8ec6afd50	082dec4d-1b01-4463-886e-6bb9e5b3a69a	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	active	18964af5-9a90-487f-9f3f-b9e39aa04d3f	user	admin
5e68c660-4ed3-4491-b6e3-2ae4e9915bed	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7d52132f-7119-41ab-b2b8-e62d69a834ce	active	73186262-426b-4ccd-87f9-732fab9654ae	user	admin
ef36d6d5-a178-4f14-8745-f16f3cbf7bd2	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afcb4a2a-b4b0-4d7c-984a-9078e964be49	active	ddc93fd6-66c6-42ab-9317-9228b658d357	user	admin
0d8169eb-f431-46e6-b972-f498cedba34a	082dec4d-1b01-4463-886e-6bb9e5b3a69a	42f56f74-074e-4cbb-b91b-deeb1fd58c56	active	c0d33733-ced3-4270-a241-051fb62660e4	user	admin
aa2806d7-5446-42aa-8ff7-0c5d61081fa2	082dec4d-1b01-4463-886e-6bb9e5b3a69a	79cbe120-e9c6-4249-b934-58ca980606d7	active	394293aa-532e-4d1c-b510-9430424ff584	user	admin
f0a5358e-159a-43fa-927a-064643fbe0a4	082dec4d-1b01-4463-886e-6bb9e5b3a69a	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	active	d3adffec-9bf3-4906-b0dc-b1f3ef8ee48b	user	admin
81e3b67d-e338-4c72-b7e4-5c7aa8d69310	082dec4d-1b01-4463-886e-6bb9e5b3a69a	28641aa8-b97d-49ed-85bf-c19eb0f729d3	active	108dbb3b-ee12-45c2-aff2-0e7a71fe3215	user	admin
31db6180-c174-46b3-8dfd-575b13707015	082dec4d-1b01-4463-886e-6bb9e5b3a69a	90848388-d0b6-4b97-a686-e93b40832e1e	active	ad4288e7-ccaf-4598-87a9-889732112346	user	admin
31cb50bb-54d8-4ba4-9e3c-d86cf4025ec7	082dec4d-1b01-4463-886e-6bb9e5b3a69a	dc8b567c-fed8-4696-847b-f85510f93d71	active	3bd18375-bc71-43f1-8ae8-769535217be0	user	admin
57c54efc-bf0a-40cd-8994-015d6e0f01e6	082dec4d-1b01-4463-886e-6bb9e5b3a69a	168c842c-fd1f-4180-91ce-1aecaac8f282	active	d282c9ba-cc4d-4b14-9767-51b6fd65bb0f	user	admin
4453a6ca-8203-405d-aced-cf0375584570	082dec4d-1b01-4463-886e-6bb9e5b3a69a	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	active	ea9f78df-95b7-49d9-b58b-deae33d7765b	user	admin
4090492b-1c4e-4c99-a092-fe6edb5d23a9	082dec4d-1b01-4463-886e-6bb9e5b3a69a	0d77b36f-1de6-40b3-9915-be91ee469f63	active	fd51cf75-6324-47f0-a7ea-03d2715f311e	user	admin
1d57160a-3d14-4261-a141-cf7ea696aba6	082dec4d-1b01-4463-886e-6bb9e5b3a69a	c7521678-de76-4731-9075-25d1d6150ecf	active	b34c35cd-3802-4406-9ae0-35f6f4f7f32c	user	admin
ebf50564-f4a0-470b-b039-a080e3f07f78	082dec4d-1b01-4463-886e-6bb9e5b3a69a	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	active	457f1d11-17f2-48f4-a048-1e11747e7b74	user	admin
14cefad1-b6b5-466c-b4d8-fc3cf3dff33a	082dec4d-1b01-4463-886e-6bb9e5b3a69a	620fdda8-a92d-421b-89ad-4ef1b57a9458	active	0fdfb9c6-40d7-45f8-bb78-e6f74e0ace84	user	admin
db5af28d-237e-4b85-a3b8-59d0f0241960	082dec4d-1b01-4463-886e-6bb9e5b3a69a	9beba14c-eab8-426e-89ae-757bc2e6445e	active	fb24339e-9d56-4952-8b68-a86870e026e3	user	admin
1e85ffe2-6e8a-4c5e-9731-38b82798a673	082dec4d-1b01-4463-886e-6bb9e5b3a69a	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	active	5b263763-4ad4-4945-ab73-aaa73e000b07	user	admin
2cdff017-4bf1-4a71-b573-35af62421d61	082dec4d-1b01-4463-886e-6bb9e5b3a69a	011e8933-7b86-412c-8fe6-752060d8e103	active	f25a8f30-9c0e-4031-b38b-e787b0f55219	user	admin
d6ac9b5c-28ed-42eb-a860-8bc2847d73b5	082dec4d-1b01-4463-886e-6bb9e5b3a69a	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	active	c1949f97-8ca6-4e06-8c98-c9cdd725049f	user	admin
7a620dd7-336d-42d9-95f0-536d2b01d5f0	082dec4d-1b01-4463-886e-6bb9e5b3a69a	6aace7ef-f167-40c9-a0d7-87e7e2681c07	active	632e4a2f-5847-44f4-8a4f-104ab859a252	user	admin
9fd0420a-fd9a-479d-8f86-e434b0eecf87	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	active	13b62bb7-8d01-4cf3-b972-04b57b24bec2	user	admin
7034f899-4ecb-4987-89d1-02a0a5c0dc32	082dec4d-1b01-4463-886e-6bb9e5b3a69a	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	active	724bf28d-a858-47f1-af82-01800d9c5d7b	user	admin
2e8c87a5-9c72-44c7-bcb4-52f64d7542f2	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7dbaad15-597f-499c-9a72-95de38b95cad	active	4d65f47d-87c3-4dda-966b-b09bda95e7cc	user	admin
d6abb8dc-498a-445c-bab6-41828aefce77	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	active	f9ede606-2272-46ba-8c7b-6d85a571f049	package	public
8e9adf75-4ca6-4b94-8d5f-853060d2af06	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	27b314a5-57b6-4c4e-9c9f-6923365eaecc	active	f9ede606-2272-46ba-8c7b-6d85a571f049	package	public
6bde9c50-0d48-4843-bf83-6ce575146166	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	73124d1e-c2aa-4d20-a42d-fa71b8946e93	active	f9ede606-2272-46ba-8c7b-6d85a571f049	package	organization
e6f12290-50de-4e44-8024-32a59a9d0792	52368b85-350c-450e-a18e-f2fb6fa7ae7a	7d52132f-7119-41ab-b2b8-e62d69a834ce	active	b8325dae-ab2a-4154-93bc-55207ba1d8a7	package	public
8d67e3f6-dd59-4372-850b-a1cc1baa2eba	52368b85-350c-450e-a18e-f2fb6fa7ae7a	27b314a5-57b6-4c4e-9c9f-6923365eaecc	active	b8325dae-ab2a-4154-93bc-55207ba1d8a7	package	public
33341e7d-bd14-4644-aed0-a58495403a25	52368b85-350c-450e-a18e-f2fb6fa7ae7a	7dbaad15-597f-499c-9a72-95de38b95cad	active	b8325dae-ab2a-4154-93bc-55207ba1d8a7	package	organization
\.


--
-- Data for Name: member_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY member_revision (id, table_id, group_id, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current, table_name, capacity) FROM stdin;
f68a21ec-8dea-4739-8155-43e1d2676020	082dec4d-1b01-4463-886e-6bb9e5b3a69a	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	active	ea6c0857-eba7-4b31-8cc0-3dd05ad84a5c	f68a21ec-8dea-4739-8155-43e1d2676020	\N	2015-08-25 13:47:23.923799	9999-12-31 00:00:00	\N	user	admin
ab72127d-494a-472f-a956-255dac01c1a5	082dec4d-1b01-4463-886e-6bb9e5b3a69a	27b314a5-57b6-4c4e-9c9f-6923365eaecc	active	c9886396-65e5-4290-b903-e99d182705ed	ab72127d-494a-472f-a956-255dac01c1a5	\N	2015-08-25 13:48:08.031826	9999-12-31 00:00:00	\N	user	admin
bbb770af-7e10-46c0-bb6f-a299de03f984	082dec4d-1b01-4463-886e-6bb9e5b3a69a	73124d1e-c2aa-4d20-a42d-fa71b8946e93	active	4e6a2bb3-0956-4dfc-99ac-d6671c8a397c	bbb770af-7e10-46c0-bb6f-a299de03f984	\N	2015-08-25 13:48:43.414821	9999-12-31 00:00:00	\N	user	admin
1330a4c9-2952-4425-9f1c-6ec8ec6afd50	082dec4d-1b01-4463-886e-6bb9e5b3a69a	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	active	18964af5-9a90-487f-9f3f-b9e39aa04d3f	1330a4c9-2952-4425-9f1c-6ec8ec6afd50	\N	2015-08-25 13:57:41.98296	9999-12-31 00:00:00	\N	user	admin
5e68c660-4ed3-4491-b6e3-2ae4e9915bed	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7d52132f-7119-41ab-b2b8-e62d69a834ce	active	73186262-426b-4ccd-87f9-732fab9654ae	5e68c660-4ed3-4491-b6e3-2ae4e9915bed	\N	2015-08-25 13:58:14.457474	9999-12-31 00:00:00	\N	user	admin
ef36d6d5-a178-4f14-8745-f16f3cbf7bd2	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afcb4a2a-b4b0-4d7c-984a-9078e964be49	active	ddc93fd6-66c6-42ab-9317-9228b658d357	ef36d6d5-a178-4f14-8745-f16f3cbf7bd2	\N	2015-08-25 13:58:48.468963	9999-12-31 00:00:00	\N	user	admin
0d8169eb-f431-46e6-b972-f498cedba34a	082dec4d-1b01-4463-886e-6bb9e5b3a69a	42f56f74-074e-4cbb-b91b-deeb1fd58c56	active	c0d33733-ced3-4270-a241-051fb62660e4	0d8169eb-f431-46e6-b972-f498cedba34a	\N	2015-08-25 13:59:27.525656	9999-12-31 00:00:00	\N	user	admin
aa2806d7-5446-42aa-8ff7-0c5d61081fa2	082dec4d-1b01-4463-886e-6bb9e5b3a69a	79cbe120-e9c6-4249-b934-58ca980606d7	active	394293aa-532e-4d1c-b510-9430424ff584	aa2806d7-5446-42aa-8ff7-0c5d61081fa2	\N	2015-08-25 13:59:55.220817	9999-12-31 00:00:00	\N	user	admin
f0a5358e-159a-43fa-927a-064643fbe0a4	082dec4d-1b01-4463-886e-6bb9e5b3a69a	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	active	d3adffec-9bf3-4906-b0dc-b1f3ef8ee48b	f0a5358e-159a-43fa-927a-064643fbe0a4	\N	2015-08-25 14:00:19.77839	9999-12-31 00:00:00	\N	user	admin
81e3b67d-e338-4c72-b7e4-5c7aa8d69310	082dec4d-1b01-4463-886e-6bb9e5b3a69a	28641aa8-b97d-49ed-85bf-c19eb0f729d3	active	108dbb3b-ee12-45c2-aff2-0e7a71fe3215	81e3b67d-e338-4c72-b7e4-5c7aa8d69310	\N	2015-08-25 14:00:48.804345	9999-12-31 00:00:00	\N	user	admin
31db6180-c174-46b3-8dfd-575b13707015	082dec4d-1b01-4463-886e-6bb9e5b3a69a	90848388-d0b6-4b97-a686-e93b40832e1e	active	ad4288e7-ccaf-4598-87a9-889732112346	31db6180-c174-46b3-8dfd-575b13707015	\N	2015-08-25 14:01:18.063905	9999-12-31 00:00:00	\N	user	admin
31cb50bb-54d8-4ba4-9e3c-d86cf4025ec7	082dec4d-1b01-4463-886e-6bb9e5b3a69a	dc8b567c-fed8-4696-847b-f85510f93d71	active	3bd18375-bc71-43f1-8ae8-769535217be0	31cb50bb-54d8-4ba4-9e3c-d86cf4025ec7	\N	2015-08-25 14:01:43.807987	9999-12-31 00:00:00	\N	user	admin
57c54efc-bf0a-40cd-8994-015d6e0f01e6	082dec4d-1b01-4463-886e-6bb9e5b3a69a	168c842c-fd1f-4180-91ce-1aecaac8f282	active	d282c9ba-cc4d-4b14-9767-51b6fd65bb0f	57c54efc-bf0a-40cd-8994-015d6e0f01e6	\N	2015-08-25 14:02:27.112488	9999-12-31 00:00:00	\N	user	admin
4453a6ca-8203-405d-aced-cf0375584570	082dec4d-1b01-4463-886e-6bb9e5b3a69a	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	active	ea9f78df-95b7-49d9-b58b-deae33d7765b	4453a6ca-8203-405d-aced-cf0375584570	\N	2015-08-25 14:03:08.880379	9999-12-31 00:00:00	\N	user	admin
4090492b-1c4e-4c99-a092-fe6edb5d23a9	082dec4d-1b01-4463-886e-6bb9e5b3a69a	0d77b36f-1de6-40b3-9915-be91ee469f63	active	fd51cf75-6324-47f0-a7ea-03d2715f311e	4090492b-1c4e-4c99-a092-fe6edb5d23a9	\N	2015-08-25 14:03:56.002997	9999-12-31 00:00:00	\N	user	admin
1d57160a-3d14-4261-a141-cf7ea696aba6	082dec4d-1b01-4463-886e-6bb9e5b3a69a	c7521678-de76-4731-9075-25d1d6150ecf	active	b34c35cd-3802-4406-9ae0-35f6f4f7f32c	1d57160a-3d14-4261-a141-cf7ea696aba6	\N	2015-08-25 14:10:00.011806	9999-12-31 00:00:00	\N	user	admin
ebf50564-f4a0-470b-b039-a080e3f07f78	082dec4d-1b01-4463-886e-6bb9e5b3a69a	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	active	457f1d11-17f2-48f4-a048-1e11747e7b74	ebf50564-f4a0-470b-b039-a080e3f07f78	\N	2015-08-25 14:10:45.686497	9999-12-31 00:00:00	\N	user	admin
14cefad1-b6b5-466c-b4d8-fc3cf3dff33a	082dec4d-1b01-4463-886e-6bb9e5b3a69a	620fdda8-a92d-421b-89ad-4ef1b57a9458	active	0fdfb9c6-40d7-45f8-bb78-e6f74e0ace84	14cefad1-b6b5-466c-b4d8-fc3cf3dff33a	\N	2015-08-25 14:12:43.066687	9999-12-31 00:00:00	\N	user	admin
db5af28d-237e-4b85-a3b8-59d0f0241960	082dec4d-1b01-4463-886e-6bb9e5b3a69a	9beba14c-eab8-426e-89ae-757bc2e6445e	active	fb24339e-9d56-4952-8b68-a86870e026e3	db5af28d-237e-4b85-a3b8-59d0f0241960	\N	2015-08-25 14:13:29.844782	9999-12-31 00:00:00	\N	user	admin
1e85ffe2-6e8a-4c5e-9731-38b82798a673	082dec4d-1b01-4463-886e-6bb9e5b3a69a	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	active	5b263763-4ad4-4945-ab73-aaa73e000b07	1e85ffe2-6e8a-4c5e-9731-38b82798a673	\N	2015-08-25 14:13:56.135342	9999-12-31 00:00:00	\N	user	admin
2cdff017-4bf1-4a71-b573-35af62421d61	082dec4d-1b01-4463-886e-6bb9e5b3a69a	011e8933-7b86-412c-8fe6-752060d8e103	active	f25a8f30-9c0e-4031-b38b-e787b0f55219	2cdff017-4bf1-4a71-b573-35af62421d61	\N	2015-08-25 14:14:29.387749	9999-12-31 00:00:00	\N	user	admin
d6ac9b5c-28ed-42eb-a860-8bc2847d73b5	082dec4d-1b01-4463-886e-6bb9e5b3a69a	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	active	c1949f97-8ca6-4e06-8c98-c9cdd725049f	d6ac9b5c-28ed-42eb-a860-8bc2847d73b5	\N	2015-08-25 14:15:07.173997	9999-12-31 00:00:00	\N	user	admin
7a620dd7-336d-42d9-95f0-536d2b01d5f0	082dec4d-1b01-4463-886e-6bb9e5b3a69a	6aace7ef-f167-40c9-a0d7-87e7e2681c07	active	632e4a2f-5847-44f4-8a4f-104ab859a252	7a620dd7-336d-42d9-95f0-536d2b01d5f0	\N	2015-08-25 14:15:32.777342	9999-12-31 00:00:00	\N	user	admin
9fd0420a-fd9a-479d-8f86-e434b0eecf87	082dec4d-1b01-4463-886e-6bb9e5b3a69a	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	active	13b62bb7-8d01-4cf3-b972-04b57b24bec2	9fd0420a-fd9a-479d-8f86-e434b0eecf87	\N	2015-08-25 14:15:57.110853	9999-12-31 00:00:00	\N	user	admin
7034f899-4ecb-4987-89d1-02a0a5c0dc32	082dec4d-1b01-4463-886e-6bb9e5b3a69a	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	active	724bf28d-a858-47f1-af82-01800d9c5d7b	7034f899-4ecb-4987-89d1-02a0a5c0dc32	\N	2015-08-25 14:16:26.093343	9999-12-31 00:00:00	\N	user	admin
2e8c87a5-9c72-44c7-bcb4-52f64d7542f2	082dec4d-1b01-4463-886e-6bb9e5b3a69a	7dbaad15-597f-499c-9a72-95de38b95cad	active	4d65f47d-87c3-4dda-966b-b09bda95e7cc	2e8c87a5-9c72-44c7-bcb4-52f64d7542f2	\N	2015-09-14 11:36:11.502078	9999-12-31 00:00:00	\N	user	admin
6bde9c50-0d48-4843-bf83-6ce575146166	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	73124d1e-c2aa-4d20-a42d-fa71b8946e93	active	f9ede606-2272-46ba-8c7b-6d85a571f049	6bde9c50-0d48-4843-bf83-6ce575146166	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N	package	organization
8e9adf75-4ca6-4b94-8d5f-853060d2af06	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	27b314a5-57b6-4c4e-9c9f-6923365eaecc	active	f9ede606-2272-46ba-8c7b-6d85a571f049	8e9adf75-4ca6-4b94-8d5f-853060d2af06	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N	package	public
d6abb8dc-498a-445c-bab6-41828aefce77	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	active	f9ede606-2272-46ba-8c7b-6d85a571f049	d6abb8dc-498a-445c-bab6-41828aefce77	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N	package	public
8d67e3f6-dd59-4372-850b-a1cc1baa2eba	52368b85-350c-450e-a18e-f2fb6fa7ae7a	27b314a5-57b6-4c4e-9c9f-6923365eaecc	active	b8325dae-ab2a-4154-93bc-55207ba1d8a7	8d67e3f6-dd59-4372-850b-a1cc1baa2eba	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N	package	public
33341e7d-bd14-4644-aed0-a58495403a25	52368b85-350c-450e-a18e-f2fb6fa7ae7a	7dbaad15-597f-499c-9a72-95de38b95cad	active	b8325dae-ab2a-4154-93bc-55207ba1d8a7	33341e7d-bd14-4644-aed0-a58495403a25	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N	package	organization
e6f12290-50de-4e44-8024-32a59a9d0792	52368b85-350c-450e-a18e-f2fb6fa7ae7a	7d52132f-7119-41ab-b2b8-e62d69a834ce	active	b8325dae-ab2a-4154-93bc-55207ba1d8a7	e6f12290-50de-4e44-8024-32a59a9d0792	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N	package	public
\.


--
-- Data for Name: migrate_version; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY migrate_version (repository_id, repository_path, version) FROM stdin;
Ckan	/var/www/ckan/ckan/migration	76
\.


--
-- Data for Name: package; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package (id, name, title, version, url, notes, license_id, revision_id, author, author_email, maintainer, maintainer_email, state, type, owner_org, private, metadata_modified, creator_user_id) FROM stdin;
ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	railway-noise-night	{"fr": "Bruit ferroviaire nuit", "de": "Eisenbahnl\\u00e4rm Nacht", "en": "Railway noise night", "it": "Rumore ferroviario notte"}	\N	http://www.bafu.admin.ch/laerm/index.html?lang=de	{"fr": "La carte montre que la pollution sonore est suspendu par le syst\\u00e8me de rail, la population.", "de": "Die Karte zeigt, welcher L\\u00e4rmbelastung die Bev\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.", "en": "The map shows how the population is exposed by the noise pollution of the rail system.", "it": "La mappa mostra che l\\\\'inquinamento acustico \\u00e8 sospeso dal sistema ferroviario, la popolazione."}	\N	67686d69-d368-44b3-912f-22718aba45ef	\N	\N	\N	\N	active	dataset	73124d1e-c2aa-4d20-a42d-fa71b8946e93	f	2015-09-22 13:16:35.955004	082dec4d-1b01-4463-886e-6bb9e5b3a69a
52368b85-350c-450e-a18e-f2fb6fa7ae7a	baustellen	{"fr": "Baustellen", "de": "Baustellen", "en": "Building Sites", "it": "Chantiers"}	\N		{"fr": "Description FR", "de": "Beschreibung DE", "en": "Description EN", "it": "Description IT"}	\N	b8325dae-ab2a-4154-93bc-55207ba1d8a7	\N	\N	\N	\N	active	dataset	7dbaad15-597f-499c-9a72-95de38b95cad	f	2015-09-22 13:20:04.538977	082dec4d-1b01-4463-886e-6bb9e5b3a69a
\.


--
-- Data for Name: package_extra; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_extra (id, package_id, key, value, revision_id, state) FROM stdin;
aa01b9ce-a9e3-4648-9b5f-b4e1177f0763	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	publishers	[{"termdat_reference": "Verweis auf TERMDAT-Eintrag", "label": "Bundesamt f\\u00fcr Landestopografie swisstopo"}, {"termdat_reference": "", "label": "Bundesamt f\\u00fcr Umwelt"}]	f9ede606-2272-46ba-8c7b-6d85a571f049	active
7e7aacfe-df68-4ef5-b3d3-30bb159533d3	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	language	["de", "en"]	f9ede606-2272-46ba-8c7b-6d85a571f049	active
3e7c3c5b-8c41-4e15-aa61-f25203a26c91	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	accrual_periodicity	http://purl.org/cld/freq/daily	f9ede606-2272-46ba-8c7b-6d85a571f049	active
a61fbe29-8d15-493f-8087-e1761cff6d8b	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	relations	[{"url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "label": "Webseite des BAFU"}]	f9ede606-2272-46ba-8c7b-6d85a571f049	active
078c57ac-53fb-4756-8cbc-8d6ac0538402	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	coverage		f9ede606-2272-46ba-8c7b-6d85a571f049	active
6226eba7-e9ea-49bc-9e8a-5aef2ea1e9ea	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	spatial		f9ede606-2272-46ba-8c7b-6d85a571f049	active
1c6af9d5-92cc-4b7c-924d-17936f6b8323	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	contact_points	[{"email": "noise@bafu.admin.ch", "name": "Abteilung L\\u00e4rm BAFU"}, {"email": "heinz@bafu.admin.ch", "name": "Heinz M\\u00fcller"}]	f9ede606-2272-46ba-8c7b-6d85a571f049	active
9c221454-2555-4b35-ac8f-d1e2e2855190	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	see_alsos	[{"dataset_identifier": "326@swisstopo"}]	f9ede606-2272-46ba-8c7b-6d85a571f049	active
e5ec8141-5032-460e-b542-1e3759011365	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	identifier	325@swisstopo	f9ede606-2272-46ba-8c7b-6d85a571f049	active
3bc76a60-a231-4f65-a1e0-95fa566a97e9	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	modified	2015-04-26 00:00:00	67686d69-d368-44b3-912f-22718aba45ef	active
82cb655e-92fe-4961-b9f8-70cf3eae535b	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	temporals	[{"start_date": "03/01/1905", "end_date": "01/05/2013"}, {"start_date": "03/01/2013", "end_date": "01/05/2015"}]	67686d69-d368-44b3-912f-22718aba45ef	active
e83acad9-9bd6-4c28-bb8b-4bfa89749ebb	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	issued	2013-04-26 00:00:00	67686d69-d368-44b3-912f-22718aba45ef	active
2233eba1-e7ae-43b3-9478-47c627d145dd	52368b85-350c-450e-a18e-f2fb6fa7ae7a	publishers	[{"termdat_reference": "", "label": "Bundesarchiv"}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
edd1fc43-56d1-41a0-afba-28f2e46f325d	52368b85-350c-450e-a18e-f2fb6fa7ae7a	language	["de", "en"]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
b77bd3fb-a6c0-49f0-b487-5d55c7d20151	52368b85-350c-450e-a18e-f2fb6fa7ae7a	accrual_periodicity	http://purl.org/cld/freq/completelyIrregular	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
63267ca3-0598-423a-af4d-434a01035fda	52368b85-350c-450e-a18e-f2fb6fa7ae7a	issued	2015-09-08 00:00:00	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
7df4bb13-e10d-4054-9e00-012dc5d404d2	52368b85-350c-450e-a18e-f2fb6fa7ae7a	modified	2015-09-09 00:00:00	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
b62147fe-c181-4375-8a99-171f2642ad89	52368b85-350c-450e-a18e-f2fb6fa7ae7a	relations	[{"url": "", "label": ""}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
1a689e55-969a-4d16-b697-d946110149ab	52368b85-350c-450e-a18e-f2fb6fa7ae7a	coverage		b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
d7ef8cdc-8a15-4a7b-a53d-288b64a19c5f	52368b85-350c-450e-a18e-f2fb6fa7ae7a	spatial		b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
229ef929-433e-48ac-82e0-50a6e83e9040	52368b85-350c-450e-a18e-f2fb6fa7ae7a	contact_points	[{"email": "pierre@bar.ch", "name": "Pierre"}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
c588219b-39a2-4dd8-bd54-330d838ff8cd	52368b85-350c-450e-a18e-f2fb6fa7ae7a	see_alsos	[{"dataset_identifier": ""}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
5339ed56-b8ee-4d79-a0a3-29c65240cf67	52368b85-350c-450e-a18e-f2fb6fa7ae7a	identifier	123@bundesarchiv	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
59d319a2-b91a-4066-a45b-635a5e2e1523	52368b85-350c-450e-a18e-f2fb6fa7ae7a	temporals	[{"start_date": "", "end_date": ""}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
\.


--
-- Data for Name: package_extra_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_extra_revision (id, package_id, key, value, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
a61fbe29-8d15-493f-8087-e1761cff6d8b	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	relations	[{"url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "label": "Webseite des BAFU"}]	f9ede606-2272-46ba-8c7b-6d85a571f049	a61fbe29-8d15-493f-8087-e1761cff6d8b	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
9c221454-2555-4b35-ac8f-d1e2e2855190	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	see_alsos	[{"dataset_identifier": "326@swisstopo"}]	f9ede606-2272-46ba-8c7b-6d85a571f049	9c221454-2555-4b35-ac8f-d1e2e2855190	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
e5ec8141-5032-460e-b542-1e3759011365	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	identifier	325@swisstopo	f9ede606-2272-46ba-8c7b-6d85a571f049	e5ec8141-5032-460e-b542-1e3759011365	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
078c57ac-53fb-4756-8cbc-8d6ac0538402	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	coverage		f9ede606-2272-46ba-8c7b-6d85a571f049	078c57ac-53fb-4756-8cbc-8d6ac0538402	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
3e7c3c5b-8c41-4e15-aa61-f25203a26c91	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	accrual_periodicity	http://purl.org/cld/freq/daily	f9ede606-2272-46ba-8c7b-6d85a571f049	3e7c3c5b-8c41-4e15-aa61-f25203a26c91	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
6226eba7-e9ea-49bc-9e8a-5aef2ea1e9ea	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	spatial		f9ede606-2272-46ba-8c7b-6d85a571f049	6226eba7-e9ea-49bc-9e8a-5aef2ea1e9ea	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
1c6af9d5-92cc-4b7c-924d-17936f6b8323	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	contact_points	[{"email": "noise@bafu.admin.ch", "name": "Abteilung L\\u00e4rm BAFU"}, {"email": "heinz@bafu.admin.ch", "name": "Heinz M\\u00fcller"}]	f9ede606-2272-46ba-8c7b-6d85a571f049	1c6af9d5-92cc-4b7c-924d-17936f6b8323	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
7e7aacfe-df68-4ef5-b3d3-30bb159533d3	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	language	["de", "en"]	f9ede606-2272-46ba-8c7b-6d85a571f049	7e7aacfe-df68-4ef5-b3d3-30bb159533d3	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
aa01b9ce-a9e3-4648-9b5f-b4e1177f0763	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	publishers	[{"termdat_reference": "Verweis auf TERMDAT-Eintrag", "label": "Bundesamt f\\u00fcr Landestopografie swisstopo"}, {"termdat_reference": "", "label": "Bundesamt f\\u00fcr Umwelt"}]	f9ede606-2272-46ba-8c7b-6d85a571f049	aa01b9ce-a9e3-4648-9b5f-b4e1177f0763	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
3bc76a60-a231-4f65-a1e0-95fa566a97e9	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	modified	1970-01-01 00:00:00	f9ede606-2272-46ba-8c7b-6d85a571f049	3bc76a60-a231-4f65-a1e0-95fa566a97e9	active	\N	2015-09-22 13:16:25.120922	2015-09-22 13:16:35.954188	\N
3bc76a60-a231-4f65-a1e0-95fa566a97e9	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	modified	2015-04-26 00:00:00	67686d69-d368-44b3-912f-22718aba45ef	3bc76a60-a231-4f65-a1e0-95fa566a97e9	active	\N	2015-09-22 13:16:35.954188	9999-12-31 00:00:00	\N
82cb655e-92fe-4961-b9f8-70cf3eae535b	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	temporals	[{"start_date": -2046124800, "end_date": 1357344000}, {"start_date": 1362096000, "end_date": 1420416000}]	f9ede606-2272-46ba-8c7b-6d85a571f049	82cb655e-92fe-4961-b9f8-70cf3eae535b	active	\N	2015-09-22 13:16:25.120922	2015-09-22 13:16:35.954188	\N
82cb655e-92fe-4961-b9f8-70cf3eae535b	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	temporals	[{"start_date": "03/01/1905", "end_date": "01/05/2013"}, {"start_date": "03/01/2013", "end_date": "01/05/2015"}]	67686d69-d368-44b3-912f-22718aba45ef	82cb655e-92fe-4961-b9f8-70cf3eae535b	active	\N	2015-09-22 13:16:35.954188	9999-12-31 00:00:00	\N
e83acad9-9bd6-4c28-bb8b-4bfa89749ebb	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	issued	1970-01-01 00:00:00	f9ede606-2272-46ba-8c7b-6d85a571f049	e83acad9-9bd6-4c28-bb8b-4bfa89749ebb	active	\N	2015-09-22 13:16:25.120922	2015-09-22 13:16:35.954188	\N
e83acad9-9bd6-4c28-bb8b-4bfa89749ebb	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	issued	2013-04-26 00:00:00	67686d69-d368-44b3-912f-22718aba45ef	e83acad9-9bd6-4c28-bb8b-4bfa89749ebb	active	\N	2015-09-22 13:16:35.954188	9999-12-31 00:00:00	\N
1a689e55-969a-4d16-b697-d946110149ab	52368b85-350c-450e-a18e-f2fb6fa7ae7a	coverage		b8325dae-ab2a-4154-93bc-55207ba1d8a7	1a689e55-969a-4d16-b697-d946110149ab	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
229ef929-433e-48ac-82e0-50a6e83e9040	52368b85-350c-450e-a18e-f2fb6fa7ae7a	contact_points	[{"email": "pierre@bar.ch", "name": "Pierre"}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	229ef929-433e-48ac-82e0-50a6e83e9040	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
b77bd3fb-a6c0-49f0-b487-5d55c7d20151	52368b85-350c-450e-a18e-f2fb6fa7ae7a	accrual_periodicity	http://purl.org/cld/freq/completelyIrregular	b8325dae-ab2a-4154-93bc-55207ba1d8a7	b77bd3fb-a6c0-49f0-b487-5d55c7d20151	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
5339ed56-b8ee-4d79-a0a3-29c65240cf67	52368b85-350c-450e-a18e-f2fb6fa7ae7a	identifier	123@bundesarchiv	b8325dae-ab2a-4154-93bc-55207ba1d8a7	5339ed56-b8ee-4d79-a0a3-29c65240cf67	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
d7ef8cdc-8a15-4a7b-a53d-288b64a19c5f	52368b85-350c-450e-a18e-f2fb6fa7ae7a	spatial		b8325dae-ab2a-4154-93bc-55207ba1d8a7	d7ef8cdc-8a15-4a7b-a53d-288b64a19c5f	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
2233eba1-e7ae-43b3-9478-47c627d145dd	52368b85-350c-450e-a18e-f2fb6fa7ae7a	publishers	[{"termdat_reference": "", "label": "Bundesarchiv"}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	2233eba1-e7ae-43b3-9478-47c627d145dd	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
edd1fc43-56d1-41a0-afba-28f2e46f325d	52368b85-350c-450e-a18e-f2fb6fa7ae7a	language	["de", "en"]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	edd1fc43-56d1-41a0-afba-28f2e46f325d	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
7df4bb13-e10d-4054-9e00-012dc5d404d2	52368b85-350c-450e-a18e-f2fb6fa7ae7a	modified	2015-09-09 00:00:00	b8325dae-ab2a-4154-93bc-55207ba1d8a7	7df4bb13-e10d-4054-9e00-012dc5d404d2	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
c588219b-39a2-4dd8-bd54-330d838ff8cd	52368b85-350c-450e-a18e-f2fb6fa7ae7a	see_alsos	[{"dataset_identifier": ""}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	c588219b-39a2-4dd8-bd54-330d838ff8cd	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
59d319a2-b91a-4066-a45b-635a5e2e1523	52368b85-350c-450e-a18e-f2fb6fa7ae7a	temporals	[{"start_date": "", "end_date": ""}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	59d319a2-b91a-4066-a45b-635a5e2e1523	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
63267ca3-0598-423a-af4d-434a01035fda	52368b85-350c-450e-a18e-f2fb6fa7ae7a	issued	2015-09-08 00:00:00	b8325dae-ab2a-4154-93bc-55207ba1d8a7	63267ca3-0598-423a-af4d-434a01035fda	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
b62147fe-c181-4375-8a99-171f2642ad89	52368b85-350c-450e-a18e-f2fb6fa7ae7a	relations	[{"url": "", "label": ""}]	b8325dae-ab2a-4154-93bc-55207ba1d8a7	b62147fe-c181-4375-8a99-171f2642ad89	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
\.


--
-- Data for Name: package_relationship; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_relationship (id, subject_package_id, object_package_id, type, comment, revision_id, state) FROM stdin;
\.


--
-- Data for Name: package_relationship_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_relationship_revision (id, subject_package_id, object_package_id, type, comment, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: package_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_revision (id, name, title, version, url, notes, license_id, revision_id, continuity_id, author, author_email, maintainer, maintainer_email, state, expired_id, revision_timestamp, expired_timestamp, current, type, owner_org, private, metadata_modified, creator_user_id) FROM stdin;
ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	railway-noise-night	{"fr": "Bruit ferroviaire nuit", "de": "Eisenbahnl\\u00e4rm Nacht", "en": "Railway noise night", "it": "Rumore ferroviario notte"}	\N	http://www.bafu.admin.ch/laerm/index.html?lang=de	{"fr": "La carte montre que la pollution sonore est suspendu par le syst\\u00e8me de rail, la population.", "de": "Die Karte zeigt, welcher L\\u00e4rmbelastung die Bev\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.", "en": "The map shows how the population is exposed by the noise pollution of the rail system.", "it": "La mappa mostra che l'inquinamento acustico \\u00e8 sospeso dal sistema ferroviario, la popolazione."}	\N	f9ede606-2272-46ba-8c7b-6d85a571f049	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	\N	\N	\N	\N	active	\N	2015-09-22 13:16:25.120922	2015-09-22 13:16:35.954188	\N	dataset	73124d1e-c2aa-4d20-a42d-fa71b8946e93	t	2015-09-22 13:16:25.189655	082dec4d-1b01-4463-886e-6bb9e5b3a69a
ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	railway-noise-night	{"fr": "Bruit ferroviaire nuit", "de": "Eisenbahnl\\u00e4rm Nacht", "en": "Railway noise night", "it": "Rumore ferroviario notte"}	\N	http://www.bafu.admin.ch/laerm/index.html?lang=de	{"fr": "La carte montre que la pollution sonore est suspendu par le syst\\u00e8me de rail, la population.", "de": "Die Karte zeigt, welcher L\\u00e4rmbelastung die Bev\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.", "en": "The map shows how the population is exposed by the noise pollution of the rail system.", "it": "La mappa mostra che l\\\\'inquinamento acustico \\u00e8 sospeso dal sistema ferroviario, la popolazione."}	\N	67686d69-d368-44b3-912f-22718aba45ef	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	\N	\N	\N	\N	active	\N	2015-09-22 13:16:35.954188	9999-12-31 00:00:00	\N	dataset	73124d1e-c2aa-4d20-a42d-fa71b8946e93	f	2015-09-22 13:16:35.955004	082dec4d-1b01-4463-886e-6bb9e5b3a69a
52368b85-350c-450e-a18e-f2fb6fa7ae7a	baustellen	{"fr": "Baustellen", "de": "Baustellen", "en": "Building Sites", "it": "Chantiers"}	\N		{"fr": "Description FR", "de": "Beschreibung DE", "en": "Description EN", "it": "Description IT"}	\N	b8325dae-ab2a-4154-93bc-55207ba1d8a7	52368b85-350c-450e-a18e-f2fb6fa7ae7a	\N	\N	\N	\N	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N	dataset	7dbaad15-597f-499c-9a72-95de38b95cad	f	2015-09-22 13:20:04.538977	082dec4d-1b01-4463-886e-6bb9e5b3a69a
\.


--
-- Data for Name: package_role; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_role (user_object_role_id, package_id) FROM stdin;
655302eb-d965-43aa-81d4-149f8a4bf71f	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0
a6c2c6a1-807d-40e2-ad6f-605471098b66	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0
e5d7d4ec-6469-4a63-b01b-4fc081c5886f	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0
2d7a45aa-3d57-4989-b64a-05dfc9169b9f	52368b85-350c-450e-a18e-f2fb6fa7ae7a
c549c519-9fe0-4e77-be0f-35ac8edca9bc	52368b85-350c-450e-a18e-f2fb6fa7ae7a
bba446c1-368f-4ba5-be3b-fa3729fca0ea	52368b85-350c-450e-a18e-f2fb6fa7ae7a
\.


--
-- Data for Name: package_tag; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_tag (id, package_id, tag_id, revision_id, state) FROM stdin;
e3dfb676-2d0c-4b39-8a4f-55ad4999aa20	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	cba06092-31a6-46b8-b469-71fe912a9bf2	f9ede606-2272-46ba-8c7b-6d85a571f049	active
e8c16e0f-bf03-4ac4-8c86-223d83f54b2f	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	c4259d72-0257-4957-8fef-b35fa18cd410	f9ede606-2272-46ba-8c7b-6d85a571f049	active
93dcaf45-00be-47a9-bc98-14694ed9fe59	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	41ebd24c-15e5-4517-95ab-fc2327a09b90	f9ede606-2272-46ba-8c7b-6d85a571f049	active
2c180d03-d52a-42c9-b418-9fba66fd405e	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	7a363c59-9454-4d1f-a636-6819a34f9605	f9ede606-2272-46ba-8c7b-6d85a571f049	active
c4c2e641-28e1-4f49-b1e2-02a1a5d2db6b	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	7e0da1a9-0063-4920-8c49-d0747831cb60	f9ede606-2272-46ba-8c7b-6d85a571f049	active
8b30c364-d0fe-4213-bd7e-837826c3d7a5	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	e4dc72e8-6b0b-4202-b09e-1c917a13e819	f9ede606-2272-46ba-8c7b-6d85a571f049	active
6b0c3e57-2c2a-4835-bad0-00365b67a4d0	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	f7f210af-e381-42e3-9820-0a459a73f62f	f9ede606-2272-46ba-8c7b-6d85a571f049	active
05603de2-9d32-4ec2-a8e3-2cb30aacc720	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	7ba35869-ef33-4f34-9998-748f9d28e0a5	f9ede606-2272-46ba-8c7b-6d85a571f049	active
eeeb6e8a-ff59-471c-a8d6-8bfaac7d0d4b	52368b85-350c-450e-a18e-f2fb6fa7ae7a	82dd2690-3ba2-4b03-91b9-e4abc01039c2	b8325dae-ab2a-4154-93bc-55207ba1d8a7	active
\.


--
-- Data for Name: package_tag_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_tag_revision (id, package_id, tag_id, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
93dcaf45-00be-47a9-bc98-14694ed9fe59	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	41ebd24c-15e5-4517-95ab-fc2327a09b90	f9ede606-2272-46ba-8c7b-6d85a571f049	93dcaf45-00be-47a9-bc98-14694ed9fe59	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
e3dfb676-2d0c-4b39-8a4f-55ad4999aa20	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	cba06092-31a6-46b8-b469-71fe912a9bf2	f9ede606-2272-46ba-8c7b-6d85a571f049	e3dfb676-2d0c-4b39-8a4f-55ad4999aa20	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
c4c2e641-28e1-4f49-b1e2-02a1a5d2db6b	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	7e0da1a9-0063-4920-8c49-d0747831cb60	f9ede606-2272-46ba-8c7b-6d85a571f049	c4c2e641-28e1-4f49-b1e2-02a1a5d2db6b	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
2c180d03-d52a-42c9-b418-9fba66fd405e	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	7a363c59-9454-4d1f-a636-6819a34f9605	f9ede606-2272-46ba-8c7b-6d85a571f049	2c180d03-d52a-42c9-b418-9fba66fd405e	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
05603de2-9d32-4ec2-a8e3-2cb30aacc720	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	7ba35869-ef33-4f34-9998-748f9d28e0a5	f9ede606-2272-46ba-8c7b-6d85a571f049	05603de2-9d32-4ec2-a8e3-2cb30aacc720	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
8b30c364-d0fe-4213-bd7e-837826c3d7a5	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	e4dc72e8-6b0b-4202-b09e-1c917a13e819	f9ede606-2272-46ba-8c7b-6d85a571f049	8b30c364-d0fe-4213-bd7e-837826c3d7a5	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
e8c16e0f-bf03-4ac4-8c86-223d83f54b2f	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	c4259d72-0257-4957-8fef-b35fa18cd410	f9ede606-2272-46ba-8c7b-6d85a571f049	e8c16e0f-bf03-4ac4-8c86-223d83f54b2f	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
6b0c3e57-2c2a-4835-bad0-00365b67a4d0	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0	f7f210af-e381-42e3-9820-0a459a73f62f	f9ede606-2272-46ba-8c7b-6d85a571f049	6b0c3e57-2c2a-4835-bad0-00365b67a4d0	active	\N	2015-09-22 13:16:25.120922	9999-12-31 00:00:00	\N
eeeb6e8a-ff59-471c-a8d6-8bfaac7d0d4b	52368b85-350c-450e-a18e-f2fb6fa7ae7a	82dd2690-3ba2-4b03-91b9-e4abc01039c2	b8325dae-ab2a-4154-93bc-55207ba1d8a7	eeeb6e8a-ff59-471c-a8d6-8bfaac7d0d4b	active	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY rating (id, user_id, user_ip_address, package_id, rating, created) FROM stdin;
\.


--
-- Data for Name: related; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY related (id, type, title, description, image_url, url, created, owner_id, view_count, featured) FROM stdin;
\.


--
-- Data for Name: related_dataset; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY related_dataset (id, dataset_id, related_id, status) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY resource (id, url, format, description, "position", revision_id, hash, state, extras, name, resource_type, mimetype, mimetype_inner, size, last_modified, cache_url, cache_last_updated, webstore_url, webstore_last_updated, created, url_type, package_id) FROM stdin;
323f0f29-14c9-4e37-a761-9353805bbc79	http://wms.geo.admin.ch/			0	67686d69-d368-44b3-912f-22718aba45ef		deleted	{"rights": "NonCommercialAllowed-CommercialAllowed-ReferenceRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:16:25.240226	\N	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0
e4f82ba8-b71c-4cd0-9e1a-9596442bb17d	http://wms.geo.admin.ch/			0	67686d69-d368-44b3-912f-22718aba45ef		active	{"rights": "NonCommercialAllowed-CommercialAllowed-ReferenceRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:16:36.014245	\N	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0
1e440d70-4e46-492f-bd7b-be9083daad69	http://download.ch			0	b8325dae-ab2a-4154-93bc-55207ba1d8a7		active	{"rights": "NonCommercialAllowed-CommercialWithPermission-ReferenceNotRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Baustellen 2014\\", \\"en\\": \\"Building Sites 2014\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Beschreibung DE\\", \\"en\\": \\"Description EN\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://download.ch", "coverage": "", "media_type": "", "identifier": ""}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:20:04.59104	\N	52368b85-350c-450e-a18e-f2fb6fa7ae7a
\.


--
-- Data for Name: resource_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY resource_revision (id, url, format, description, "position", revision_id, continuity_id, hash, state, extras, expired_id, revision_timestamp, expired_timestamp, current, name, resource_type, mimetype, mimetype_inner, size, last_modified, cache_url, cache_last_updated, webstore_url, webstore_last_updated, created, url_type, package_id) FROM stdin;
e4f82ba8-b71c-4cd0-9e1a-9596442bb17d	http://wms.geo.admin.ch/			0	67686d69-d368-44b3-912f-22718aba45ef	e4f82ba8-b71c-4cd0-9e1a-9596442bb17d		active	{"rights": "NonCommercialAllowed-CommercialAllowed-ReferenceRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-09-22 13:16:35.954188	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:16:36.014245	\N	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0
323f0f29-14c9-4e37-a761-9353805bbc79	http://wms.geo.admin.ch/			0	f9ede606-2272-46ba-8c7b-6d85a571f049	323f0f29-14c9-4e37-a761-9353805bbc79		active	{"rights": "NonCommercialAllowed-CommercialAllowed-ReferenceRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-09-22 13:16:25.120922	2015-09-22 13:16:35.954188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:16:25.240226	\N	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0
323f0f29-14c9-4e37-a761-9353805bbc79	http://wms.geo.admin.ch/			0	67686d69-d368-44b3-912f-22718aba45ef	323f0f29-14c9-4e37-a761-9353805bbc79		deleted	{"rights": "NonCommercialAllowed-CommercialAllowed-ReferenceRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-09-22 13:16:35.954188	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:16:25.240226	\N	ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0
1e440d70-4e46-492f-bd7b-be9083daad69	http://download.ch			0	b8325dae-ab2a-4154-93bc-55207ba1d8a7	1e440d70-4e46-492f-bd7b-be9083daad69		active	{"rights": "NonCommercialAllowed-CommercialWithPermission-ReferenceNotRequired", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Baustellen 2014\\", \\"en\\": \\"Building Sites 2014\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Beschreibung DE\\", \\"en\\": \\"Description EN\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://download.ch", "coverage": "", "media_type": "", "identifier": ""}	\N	2015-09-22 13:20:04.354886	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-09-22 13:20:04.59104	\N	52368b85-350c-450e-a18e-f2fb6fa7ae7a
\.


--
-- Data for Name: resource_view; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY resource_view (id, resource_id, title, description, view_type, "order", config) FROM stdin;
\.


--
-- Data for Name: revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY revision (id, "timestamp", author, message, state, approved_timestamp) FROM stdin;
9d6529ed-188d-4333-9b3c-082c54341d21	2015-08-25 13:03:55.208448	system	Add versioning to groups, group_extras and package_groups	active	2015-08-25 13:03:55.208448
9d0325bf-d93a-4f1c-bf4f-6bd78e3a3f17	2015-08-25 13:03:55.571236	admin	Admin: make sure every object has a row in a revision table	active	2015-08-25 13:03:55.571236
d0771be4-1558-4509-9417-4f58de851f86	2015-08-25 13:47:23.136218	admin	REST API: Objekt bevoelkerung anlegen	active	\N
ea6c0857-eba7-4b31-8cc0-3dd05ad84a5c	2015-08-25 13:47:23.923799	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
1c095545-1d23-4082-aa02-7a9c424cfa8c	2015-08-25 13:48:07.930485	admin	REST API: Objekt raum anlegen	active	\N
c9886396-65e5-4290-b903-e99d182705ed	2015-08-25 13:48:08.031826	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
49919ce1-2be8-45c8-89e3-81c22d977777	2015-08-25 13:48:43.109223	admin	REST API: Objekt swisstopo anlegen	active	\N
4e6a2bb3-0956-4dfc-99ac-d6671c8a397c	2015-08-25 13:48:43.414821	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
c4b8d128-e3b5-439d-8244-5e8fcce20613	2015-08-25 13:57:41.331767	admin	REST API: Objekt arbeit anlegen	active	\N
18964af5-9a90-487f-9f3f-b9e39aa04d3f	2015-08-25 13:57:41.98296	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
d9eb027c-b163-453b-aa63-3bd148d8a8de	2015-08-25 13:58:14.353421	admin	REST API: Objekt bauwesen anlegen	active	\N
73186262-426b-4ccd-87f9-732fab9654ae	2015-08-25 13:58:14.457474	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
b93a5949-5ca7-4188-ace6-1d7352c40c11	2015-08-25 13:58:48.376838	admin	REST API: Objekt bildung anlegen	active	\N
ddc93fd6-66c6-42ab-9317-9228b658d357	2015-08-25 13:58:48.468963	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
a0ecd1b2-bac8-4696-9a65-815b2b705d95	2015-08-25 13:59:27.425032	admin	REST API: Objekt energie anlegen	active	\N
c0d33733-ced3-4270-a241-051fb62660e4	2015-08-25 13:59:27.525656	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
56c995aa-ab6b-4828-9710-2fe49c13d76b	2015-08-25 13:59:55.153821	admin	REST API: Objekt finanzen anlegen	active	\N
394293aa-532e-4d1c-b510-9430424ff584	2015-08-25 13:59:55.220817	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
c526c9ca-178f-4b91-9d72-3a6ed1609d9b	2015-08-25 14:00:19.713155	admin	REST API: Objekt geographie anlegen	active	\N
d3adffec-9bf3-4906-b0dc-b1f3ef8ee48b	2015-08-25 14:00:19.77839	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
07904a86-1261-45dd-81df-b51627ab8e75	2015-08-25 14:00:48.371024	admin	REST API: Objekt gesetzgebung anlegen	active	\N
108dbb3b-ee12-45c2-aff2-0e7a71fe3215	2015-08-25 14:00:48.804345	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
051072fa-f077-46c1-a744-074145df9d03	2015-08-25 14:01:17.949147	admin	REST API: Objekt gesundheit anlegen	active	\N
ad4288e7-ccaf-4598-87a9-889732112346	2015-08-25 14:01:18.063905	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
5c8ac240-f49a-4a68-a10b-43346e03ced7	2015-08-25 14:01:43.717176	admin	REST API: Objekt handel anlegen	active	\N
3bd18375-bc71-43f1-8ae8-769535217be0	2015-08-25 14:01:43.807987	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
bb1f2492-aece-4e79-b7bf-546436441f36	2015-08-25 14:02:26.928902	admin	REST API: Objekt industrie anlegen	active	\N
d282c9ba-cc4d-4b14-9767-51b6fd65bb0f	2015-08-25 14:02:27.112488	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
8ae8b593-e003-4d04-9056-05bf5d141bfb	2015-08-25 14:03:08.77776	admin	REST API: Objekt kriminalitaet anlegen	active	\N
ea9f78df-95b7-49d9-b58b-deae33d7765b	2015-08-25 14:03:08.880379	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
dfa3b55e-370c-41f3-a324-e50cc0662b60	2015-08-25 14:03:55.892244	admin	REST API: Objekt kultur anlegen	active	\N
fd51cf75-6324-47f0-a7ea-03d2715f311e	2015-08-25 14:03:56.002997	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
a3df1166-3bbb-4209-9088-cb2f00116e1f	2015-08-25 14:09:57.489689	admin	REST API: Objekt landwirtschaft anlegen	active	\N
b34c35cd-3802-4406-9ae0-35f6f4f7f32c	2015-08-25 14:10:00.011806	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
90bb07fc-21e9-46ba-a21f-753b3be3559e	2015-08-25 14:10:45.599306	admin	REST API: Objekt mobilitaet anlegen	active	\N
457f1d11-17f2-48f4-a048-1e11747e7b74	2015-08-25 14:10:45.686497	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
922798b8-f459-4134-b1f2-cb5246faf932	2015-08-25 14:12:42.956754	admin	REST API: Objekt sicherheit anlegen	active	\N
0fdfb9c6-40d7-45f8-bb78-e6f74e0ace84	2015-08-25 14:12:43.066687	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
6a7d8874-3d04-40dc-9d41-b12419680a76	2015-08-25 14:13:29.692699	admin	REST API: Objekt politik anlegen	active	\N
fb24339e-9d56-4952-8b68-a86870e026e3	2015-08-25 14:13:29.844782	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
95643ea7-62e7-49a5-b45a-7684ebf41c03	2015-08-25 14:13:56.056761	admin	REST API: Objekt preise anlegen	active	\N
5b263763-4ad4-4945-ab73-aaa73e000b07	2015-08-25 14:13:56.135342	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
996d9df0-84de-4e44-a818-459e89a069c8	2015-08-25 14:14:29.317352	admin	REST API: Objekt soziale-sicherheit anlegen	active	\N
f25a8f30-9c0e-4031-b38b-e787b0f55219	2015-08-25 14:14:29.387749	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
004a195f-0c79-4ea5-a210-1f7ba0f75b3b	2015-08-25 14:15:07.002868	admin	REST API: Objekt statistische-grundlagen anlegen	active	\N
c1949f97-8ca6-4e06-8c98-c9cdd725049f	2015-08-25 14:15:07.173997	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
11c2b38a-c6de-4648-9056-156cc3ac6321	2015-08-25 14:15:32.496199	admin	REST API: Objekt tourismus anlegen	active	\N
632e4a2f-5847-44f4-8a4f-104ab859a252	2015-08-25 14:15:32.777342	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
cdafd7cd-5ad2-481d-ac12-2e9004c2852b	2015-08-25 14:15:56.953398	admin	REST API: Objekt verwaltung anlegen	active	\N
13b62bb7-8d01-4cf3-b972-04b57b24bec2	2015-08-25 14:15:57.110853	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
649e4991-0672-40ea-a763-0edead7486f3	2015-08-25 14:16:26.033465	admin	REST API: Objekt volkswirtschaft anlegen	active	\N
724bf28d-a858-47f1-af82-01800d9c5d7b	2015-08-25 14:16:26.093343	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
5f6a6f73-7dff-4ab9-8fc0-b75916de00ee	2015-08-31 11:56:56.633963	admin	REST API: Update Objekt volkswirtschaft	active	\N
673f91b5-fb2b-46dc-be95-b88bfde8fcb9	2015-08-31 11:58:35.472119	admin	REST API: Update Objekt verwaltung	active	\N
358c9eb1-a60c-4b20-a7ad-8487a1d02e17	2015-08-31 11:58:45.586066	admin	REST API: Update Objekt tourismus	active	\N
fc36ada8-7dfe-4747-9517-e96e0fcfaa8c	2015-08-31 11:58:52.58848	admin	REST API: Update Objekt statistische-grundlagen	active	\N
83d49224-f922-4467-9d74-d761e2b98cf8	2015-08-31 11:58:59.663296	admin	REST API: Update Objekt soziale-sicherheit	active	\N
3390c572-dd62-434d-b2d3-f8c4557a4470	2015-08-31 11:59:06.170639	admin	REST API: Update Objekt preise	active	\N
f14dfeff-fe1c-4d5e-99e0-8bb7b2f9ddab	2015-08-31 11:59:14.008951	admin	REST API: Update Objekt politik	active	\N
07dd5069-04bf-4b36-9869-ec93cd5e2b6c	2015-08-31 11:59:20.309131	admin	REST API: Update Objekt sicherheit	active	\N
5d043c9b-a38c-46f3-b4fa-47f32b2c3b5e	2015-08-31 11:59:26.422869	admin	REST API: Update Objekt mobilitaet	active	\N
7ff1d24f-34bf-43c9-b697-ccf45dbea0aa	2015-08-31 11:59:32.784979	admin	REST API: Update Objekt landwirtschaft	active	\N
a21fc96a-4835-4efa-be9f-42bcdb367252	2015-08-31 12:00:09.729904	admin	REST API: Update Objekt kriminalitaet	active	\N
642455a1-d5e1-4a9a-b868-729291a89a32	2015-08-31 12:00:29.247441	admin	REST API: Update Objekt handel	active	\N
26cc532f-1717-4791-81c3-c8863a043862	2015-08-31 12:00:42.584977	admin	REST API: Update Objekt gesetzgebung	active	\N
ccfd4ea6-5798-4b78-aa37-c80fb5639060	2015-08-31 12:00:53.911178	admin	REST API: Update Objekt finanzen	active	\N
593cf131-afce-4622-95b4-f89389878ba5	2015-08-31 12:01:08.515233	admin	REST API: Update Objekt bildung	active	\N
5088f4cf-8906-43cb-af06-f2e6500be581	2015-08-31 11:59:38.921898	admin	REST API: Update Objekt kultur	active	\N
1f566931-00a9-4be0-8c87-54a5e15c38a3	2015-08-31 12:00:21.610174	admin	REST API: Update Objekt industrie	active	\N
7974e1c4-6375-465b-a2c8-c0647dc6740b	2015-08-31 12:00:35.688441	admin	REST API: Update Objekt gesundheit	active	\N
4bc045c4-3139-4673-8b9a-89f140adc30f	2015-08-31 12:00:48.515241	admin	REST API: Update Objekt geographie	active	\N
c1db3782-5aa7-4817-a2fc-c418b125fcb1	2015-08-31 12:00:59.621394	admin	REST API: Update Objekt energie	active	\N
04f3908a-af7c-4932-9698-dc38826138a1	2015-08-31 12:04:53.855371	admin	REST API: Update Objekt bauwesen	active	\N
679545c5-3292-4119-8583-fd02cc21b8b2	2015-08-31 12:05:08.583555	admin	REST API: Update Objekt arbeit	active	\N
70378e95-90f7-4011-b9b9-f2dbd80fc621	2015-08-31 12:05:21.021387	admin	REST API: Update Objekt raum	active	\N
f22a1af7-ed33-4989-a685-75196ad998ce	2015-08-31 12:05:29.736109	admin	REST API: Update Objekt bevoelkerung	active	\N
54f98a24-da83-46f5-8217-6054cde1c239	2015-09-14 11:36:11.232771	admin	REST API: Objekt bundesarchiv anlegen	active	\N
4d65f47d-87c3-4dda-966b-b09bda95e7cc	2015-09-14 11:36:11.502078	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
ab7a24b7-3198-4a5e-94e0-4c222f96d7e4	2015-09-21 13:13:34.462165	admin	REST API: Update Objekt volkswirtschaft	active	\N
c7bcc2e7-078d-40b9-862e-50c82e4de248	2015-09-21 13:14:00.778796	admin	REST API: Update Objekt verwaltung	active	\N
eb73e4a2-c539-40c8-986f-cd4b898e3596	2015-09-21 13:14:31.574943	admin	REST API: Update Objekt tourismus	active	\N
215c4d8d-7b4e-4b08-be59-2738ed423185	2015-09-21 13:14:56.159846	admin	REST API: Update Objekt statistische-grundlagen	active	\N
ed0c8f40-89ca-4499-b9ff-54833a7700b6	2015-09-21 13:15:11.153906	admin	REST API: Update Objekt soziale-sicherheit	active	\N
8bd61bf4-bd9b-4b63-899f-07a051f7a459	2015-09-21 13:19:15.857451	admin	REST API: Update Objekt preise	active	\N
75a7dd8a-7b38-4885-9bec-b5ddbfa17b12	2015-09-21 13:19:30.691265	admin	REST API: Update Objekt politik	active	\N
4790cc3f-5ceb-4f8d-97a1-6e9b4391aae9	2015-09-21 13:20:21.080258	admin	REST API: Update Objekt sicherheit	active	\N
2a4816b2-9701-4576-9188-57342f4fff21	2015-09-21 13:20:39.908864	admin	REST API: Update Objekt mobilitaet	active	\N
3b00e2e4-f898-4d02-a4fa-0e58d246cfdb	2015-09-21 13:20:52.407784	admin	REST API: Update Objekt landwirtschaft	active	\N
46dfc0db-85bc-4805-9b42-e016add31502	2015-09-21 13:22:26.205222	admin	REST API: Update Objekt kultur	active	\N
224502dd-b0fd-49d1-8eb9-6018bdcee22c	2015-09-21 13:22:46.704345	admin	REST API: Update Objekt kriminalitaet	active	\N
48ff98ab-772c-46b2-84df-ba48fbedf27d	2015-09-21 13:23:08.047887	admin	REST API: Update Objekt industrie	active	\N
d93b1c52-9c73-4be6-a073-081b6f42aef7	2015-09-21 13:23:31.196182	admin	REST API: Update Objekt handel	active	\N
13238840-f71f-4121-bc57-9e6def7c1556	2015-09-21 13:24:31.18924	admin	REST API: Update Objekt gesundheit	active	\N
6ee21dee-ca1b-4438-a3e0-0f83ff5be377	2015-09-21 13:24:50.915604	admin	REST API: Update Objekt geographie	active	\N
4efbebbe-0755-49a2-a878-2a7e50a8702b	2015-09-21 13:24:59.823237	admin	REST API: Update Objekt finanzen	active	\N
936d7747-d4f5-421e-9fba-004eb25a0ecb	2015-09-21 13:25:10.940517	admin	REST API: Update Objekt energie	active	\N
dd3c5497-779b-45dc-98ec-6c6eebd646d5	2015-09-21 13:25:23.77683	admin	REST API: Update Objekt bildung	active	\N
166f0294-b5e7-4f06-87ec-53978d3cb161	2015-09-21 13:25:53.342809	admin	REST API: Update Objekt bauwesen	active	\N
1767bc4e-1591-4b80-a38f-76c2794e115f	2015-09-21 13:26:05.351056	admin	REST API: Update Objekt arbeit	active	\N
d312c928-9963-4934-8bc6-49d1fdce8b84	2015-09-21 13:26:58.619724	admin	REST API: Update Objekt raum	active	\N
e56623c0-d68e-4e7d-8454-91e714a02902	2015-09-21 13:27:14.266235	admin	REST API: Update Objekt bevoelkerung	active	\N
1d6f940c-7145-4746-b7c9-7421a78e1dde	2015-09-21 13:37:03.101776	admin	REST API: Update Objekt national-economy	active	\N
03e310f1-a318-4dd6-9c62-dac47e4f26e4	2015-09-21 13:38:17.45145	admin	REST API: Update Objekt administration	active	\N
9398ccc7-afdb-4e77-aeac-e7146c7b5d2d	2015-09-21 13:38:36.626812	admin	REST API: Update Objekt tourism	active	\N
7e360e6f-c8c4-43b9-b536-8c4f19549617	2015-09-21 13:38:50.514962	admin	REST API: Update Objekt statistical-basis	active	\N
fd15758a-a4cf-47d5-99da-7d1ff56f61d8	2015-09-21 13:39:10.974461	admin	REST API: Update Objekt social-security	active	\N
3cc13ca1-c48e-4e39-bede-018e97e50e87	2015-09-21 13:39:23.656281	admin	REST API: Update Objekt prices	active	\N
6ea7559e-c018-4b56-b5bd-b99c823737ea	2015-09-21 13:39:32.248365	admin	REST API: Update Objekt politics	active	\N
c88b6998-0280-4534-87d4-1c593386089e	2015-09-21 13:39:48.062798	admin	REST API: Update Objekt public-order	active	\N
b0c226e7-5355-4dcb-8cd9-0edf231edc45	2015-09-21 13:40:01.668867	admin	REST API: Update Objekt mobility	active	\N
3e99161e-dcb9-4763-915c-dc0317bdcea7	2015-09-21 13:40:16.712743	admin	REST API: Update Objekt agriculture	active	\N
57dcd4e2-8cea-411c-bf25-d3014c1e37fe	2015-09-21 13:40:29.192012	admin	REST API: Update Objekt culture	active	\N
cba345b5-667f-4542-98e8-c134004fe722	2015-09-21 13:40:39.114566	admin	REST API: Update Objekt crime	active	\N
e38b54db-e190-4119-a107-e25813354f4f	2015-09-21 13:40:51.630312	admin	REST API: Update Objekt industry	active	\N
065e4a59-17c0-442a-8a1d-c913999f90b8	2015-09-21 13:41:03.978948	admin	REST API: Update Objekt trade	active	\N
9721d798-a9ab-4f4e-8570-67299ea8b9b2	2015-09-21 13:41:17.098511	admin	REST API: Update Objekt health	active	\N
487fd57e-5ffc-40c1-8ea6-fb92cf4e5f62	2015-09-21 13:43:48.027725	admin	REST API: Update Objekt legislation	active	\N
83f2f630-5d85-43ef-86ed-e3b7cb898d51	2015-09-21 13:44:06.814872	admin	REST API: Update Objekt legislation	active	\N
88e739b1-cf7d-461c-bfe1-f66fcf20ae4f	2015-09-21 13:45:22.49051	admin	REST API: Update Objekt geography	active	\N
e61bb842-4999-478c-b10a-0d717ba16a6b	2015-09-21 13:45:34.889224	admin	REST API: Update Objekt finances	active	\N
cce880ca-fb03-407f-a3c6-4ecc52c19c74	2015-09-21 13:45:45.054328	admin	REST API: Update Objekt energy	active	\N
a754e8f1-38e6-45cc-9c72-77ee4fc21ea6	2015-09-21 13:45:58.009761	admin	REST API: Update Objekt education	active	\N
6f8befca-ecba-48d9-82f3-ff021f021df5	2015-09-21 13:46:16.956688	admin	REST API: Update Objekt construction	active	\N
730be727-68ad-4b7d-85bd-cc0000d1edb2	2015-09-21 13:46:29.828276	admin	REST API: Update Objekt work	active	\N
2f78feef-cc98-44b7-8ade-b2830669fa90	2015-09-21 13:46:45.482989	admin	REST API: Update Objekt territory	active	\N
9202f92a-c919-485c-badd-dd244c00b9d7	2015-09-21 13:46:59.55476	admin	REST API: Update Objekt population	active	\N
f9ede606-2272-46ba-8c7b-6d85a571f049	2015-09-22 13:16:25.120922	admin	REST API: Objekt railway-noise-night anlegen	active	\N
67686d69-d368-44b3-912f-22718aba45ef	2015-09-22 13:16:35.954188	admin	REST API: Update Objekt railway-noise-night	active	\N
b8325dae-ab2a-4154-93bc-55207ba1d8a7	2015-09-22 13:20:04.354886	admin	REST API: Objekt baustellen anlegen	active	\N
\.


--
-- Data for Name: role_action; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY role_action (id, role, context, action) FROM stdin;
a323fd2a-af4f-4b4f-ab1f-77bf79c4f48d	editor		read-site
e3359760-6ec4-492e-a4b1-e536051e1818	editor		read-user
a44d7d35-dc63-4049-a9db-3fc33a1fbf86	editor		create-user
c4da3359-10a1-4c33-b736-1b2808c239d8	reader		read-site
aec9471d-b32e-4322-9785-f50677e13f5c	reader		read-user
4fd9b638-d23d-4e41-8177-44e092e17671	reader		create-user
06e9f29e-af72-4f67-8f79-c38e0e99ad15	editor		edit
012b07eb-266a-48fb-ab91-84eaa37dab5c	editor		create-package
e298637f-c246-4d54-a1d4-b0b156191dfb	editor		create-group
68bc766c-74ef-4ae6-a189-868faee2e35f	editor		read
f9571637-8aaf-4001-8838-386fca689968	editor		file-upload
f590cbe2-25cd-4c49-bafe-a09355cb3142	anon_editor		edit
6c0ad192-0dfc-42b6-8f73-4fc43220011a	anon_editor		create-package
9f25de2e-84cb-4868-ade0-926de0ed45f2	anon_editor		create-user
022d828d-10c0-4666-aaff-6d524370fcac	anon_editor		read-user
36b8150d-738d-45a6-9862-fc1536ff98b4	anon_editor		read-site
8dd1c3d5-64cc-488e-b53b-2ca07893043a	anon_editor		read
c360237c-7838-45ba-a1a5-a2ee1c638437	anon_editor		file-upload
56dbf307-f321-4b9b-a9cb-2cf1b9c47cd6	reader		read
\.


--
-- Data for Name: system_info; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY system_info (id, key, value, revision_id) FROM stdin;
\.


--
-- Name: system_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ckan_default
--

SELECT pg_catalog.setval('system_info_id_seq', 1, false);


--
-- Data for Name: system_info_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY system_info_revision (id, key, value, revision_id, continuity_id) FROM stdin;
\.


--
-- Name: system_info_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ckan_default
--

SELECT pg_catalog.setval('system_info_revision_id_seq', 1, false);


--
-- Data for Name: system_role; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY system_role (user_object_role_id) FROM stdin;
1b557b21-2a8c-4baa-a479-c80ba281a80c
a4639006-bfee-42ff-a2d2-9bddfb6e48b4
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY tag (id, name, vocabulary_id) FROM stdin;
cba06092-31a6-46b8-b469-71fe912a9bf2	Chemin-de-fer	\N
f7f210af-e381-42e3-9820-0a459a73f62f	Eisenbahn	\N
7a363c59-9454-4d1f-a636-6819a34f9605	Ferrovia	\N
c4259d72-0257-4957-8fef-b35fa18cd410	Nacht	\N
e4dc72e8-6b0b-4202-b09e-1c917a13e819	Night	\N
41ebd24c-15e5-4517-95ab-fc2327a09b90	Noche	\N
7e0da1a9-0063-4920-8c49-d0747831cb60	Nuit	\N
7ba35869-ef33-4f34-9998-748f9d28e0a5	Railroad	\N
82dd2690-3ba2-4b03-91b9-e4abc01039c2	bau	\N
\.


--
-- Data for Name: task_status; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY task_status (id, entity_id, entity_type, task_type, key, value, state, error, last_updated) FROM stdin;
\.


--
-- Data for Name: term_translation; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY term_translation (term, term_translation, lang_code) FROM stdin;
\.


--
-- Data for Name: tracking_raw; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY tracking_raw (user_key, url, tracking_type, access_timestamp) FROM stdin;
\.


--
-- Data for Name: tracking_summary; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY tracking_summary (url, package_id, tracking_type, count, running_total, recent_views, tracking_date) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY "user" (id, name, apikey, created, about, openid, password, fullname, email, reset_key, sysadmin, activity_streams_email_notifications, state) FROM stdin;
1bf67eeb-5723-4736-bcaa-7905fd0039ce	logged_in	95de00af-3257-4b5e-a649-64c20716b59b	2015-08-25 13:03:56.666335	\N	\N	\N	\N	\N	\N	f	f	active
e970bf27-483c-4c55-a381-c42e09881c9f	visitor	b094237b-71f5-474a-ae4b-2f974629b6aa	2015-08-25 13:03:56.66718	\N	\N	\N	\N	\N	\N	f	f	active
0594d621-c92a-4a32-809c-98e281dc7944	default	a373a425-0c22-4371-ae3b-2413c6db217a	2015-08-25 13:04:02.988374	\N	\N	$pbkdf2-sha512$19000$GUNo7b3XWuvde./duxeCkA$PCMHJaegwuef8sIiUoud1E/Dl7.tpMB6KLWB.L9ZP2uUb42zvk/19BY8m8wPyqUCEjOxxUXMpHDLar790I.uJw	\N	\N	\N	t	f	active
082dec4d-1b01-4463-886e-6bb9e5b3a69a	admin	a3cdeb1f-6130-4a94-839e-f82393c1c393	2015-08-25 13:04:04.078294	\N	\N	$pbkdf2-sha512$19000$rPWe8x6jdI6xVmqNkbL2fg$cgZAsh.R9QMExgBj96GfDWB2BRR2JpbgDpH4qqKFvHXoZIEzJ5kUqR6sKnsyTQ9WBwn9/MhnRXr6/W56Jn.RoQ	\N	admin@email.org	\N	t	f	active
af084126-f711-4016-a585-70354e997796	harvest	a40d0b64-a2ab-4a02-a6a6-3ed6b6fca14f	2015-08-25 13:04:08.352169	\N	\N	$pbkdf2-sha512$19000$G6MUghBC6F2LsXbuvXfufQ$IwDZxV5OzwMmJbBZ.JtAbLYVV6ys2NO.YoyKg3rSNz18lrCDGCRwTxkRUAL72y2sT6FUZ2ZY5mATbDYa1gicuQ	\N	harvest@email.org	\N	t	f	active
\.


--
-- Data for Name: user_following_dataset; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY user_following_dataset (follower_id, object_id, datetime) FROM stdin;
\.


--
-- Data for Name: user_following_group; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY user_following_group (follower_id, object_id, datetime) FROM stdin;
\.


--
-- Data for Name: user_following_user; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY user_following_user (follower_id, object_id, datetime) FROM stdin;
\.


--
-- Data for Name: user_object_role; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY user_object_role (id, user_id, context, role, authorized_group_id) FROM stdin;
1b557b21-2a8c-4baa-a479-c80ba281a80c	e970bf27-483c-4c55-a381-c42e09881c9f	System	reader	\N
a4639006-bfee-42ff-a2d2-9bddfb6e48b4	1bf67eeb-5723-4736-bcaa-7905fd0039ce	System	editor	\N
0f52f813-29b4-4b2b-b8b3-6b0fd52b81f7	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
5a33dfd8-7f08-449e-808c-21fd20b0f816	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
528cdcc9-b69b-4cdd-87c3-dbd291a6ee35	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
b5a071f6-1c5b-43f2-9714-ac683144ab34	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
445a9ae2-317f-42f5-bcc3-814a4d3f7d95	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
7359149d-3669-49f8-830f-9b5118abe0b4	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
67ec23d0-b554-495e-a0ce-dcdbb6b18a6b	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
044da59f-6e11-466e-b133-6eee0fa46e5a	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
33481a32-015a-44ca-a4c8-59c04e805fb9	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
fa6303aa-c279-4583-814f-d0b0726744af	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
891aa157-5aa7-4152-961e-983537878201	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
0ba3989b-20db-45a0-a417-667f20ae4ee9	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
fff3f249-c03d-49e9-8f8e-df222981916e	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
eac291ee-5bab-44cf-8145-560593168bb2	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
fd6787da-d71f-4766-8560-8808c7876773	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
1ead77ae-5794-4cbc-9a97-046bee9bdd91	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
509f1ebc-445f-4a7e-8e5e-c95cecc6c45d	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
c53b03d0-db77-4670-ba67-0846c9b02fbf	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
aeaa2281-fb51-4a43-851f-07681555b044	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
67a9c40f-17b8-43c7-a388-efdbd47d0cfa	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
3792c2ba-d2d2-49d4-9d2c-91c2a3d5b4f1	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
1290387f-2b5e-4189-9580-1958fe48d7b8	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
8f356804-8524-4539-a7a2-f67c98f97c4a	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
8ffaf5d6-fe61-433e-ac42-d8440898568c	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
ec6440a4-60d8-4ac3-b5a2-d78960dd6749	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
03fe4ae4-01ba-4b84-aea8-55f43a4a8c04	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
284a6740-d612-4e38-93e3-1c999a53cc30	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
08aaea75-0eb6-4c7c-ac43-eb96d1e7dea0	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
606cf7ea-2d49-4d28-9bad-20fda140e8f0	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
9679298e-741a-436c-a7ae-6143a2919f41	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
d8ec62d6-9488-4a95-8688-aecfe72bcdd6	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
d8b37b4f-c23c-4731-8a1b-ae1a6859513e	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
f99c6d1c-2a96-469f-bc89-25c1e055c4f6	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
4afd3cf1-93b8-4ed3-aadb-9dc358010b09	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
7cd72feb-9fa3-4fbd-8ed9-37ecb250cf99	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
13c713d0-6887-43ca-b78e-a93bf434859c	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
47697240-61b0-4236-856b-72646880ede1	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
715c325f-dc83-4a87-985f-8d0da5358dab	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
ea15ccad-5dea-4630-ba4d-1d6585facf48	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
a4d82902-9a53-4975-80a3-b0f9df51fcce	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
9654b32d-a35a-4942-9b6e-6882f88cf3c8	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
6fbcb420-a236-47d1-926c-7e50504c0c9d	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
afd31afc-9fdd-44d3-ac58-701acd9a2fc2	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
f6030407-9ae4-49bb-8df9-e1a6be6d79ed	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
07fa90ab-b8c8-48e3-88d2-4b98b8d33e32	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
adce6639-527e-449e-bd1a-965b237e3e77	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
021f2ef6-c3eb-40f0-8109-9bdd4a83c199	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
deebd5ef-f68d-4315-91d9-a0282c439d19	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
baaf3f4b-0c8c-4b9b-8f9c-8b10811f2670	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
ca65fd94-87ec-4e95-833a-de1e59ffb545	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
cdae7457-7334-46fe-822a-33dadb87c6d7	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
82daa643-c099-49cb-a32f-d9d79889ff11	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
c7bbdb82-e5cb-47ed-bac0-6338927ab163	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
b54906b1-6708-4d7d-99e5-d55e9ce23952	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
61ecc104-b8a2-4b59-b542-c483a0a63701	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
0ac24f1c-241c-4be1-81cc-310d4ca4fa8a	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
8b1b4a09-3e06-4271-9bb6-14e5de8a908f	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
00473bc2-1895-4715-bc53-d6f9c41a2df5	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
45ea28bd-b129-4a85-8d7e-e23869db0788	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
f2c03222-a6ad-4f8c-8ae2-a8784a055a22	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
95c2492f-77f0-45bd-86ac-521d3606109c	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
78dd3626-8edd-4347-b413-4e03c572bd84	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
20de092a-b7d4-41d1-b8ec-1b1728361242	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
c166e550-a3a5-4592-ba4f-9393784dcba6	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
6cfad721-cdb2-4e75-922e-ef21e9d80773	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
e2ed84b0-6bd7-49f2-b713-223c74f00124	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
ae62c689-13a8-46f2-b82c-200b4ef6bac0	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
8747e37a-a9a6-47d3-9b93-743b6e827617	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
7cd72b77-0991-48c9-b211-5cf19f392237	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
655702c4-e422-4d2c-b212-64f53164373e	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
c6345f8a-656e-432b-b61c-fe231071bdf6	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
30da21a0-1e31-4fe8-8d8a-b612ff5739f0	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
c4a55872-b871-4312-9f57-f8bb63a3336d	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
cba2b382-b318-4f40-a228-3f440505d463	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
5e99b368-d2d5-4a31-b62f-61f84c2ea775	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
c0c4dd1d-5dff-401c-8aeb-65213da5a064	e970bf27-483c-4c55-a381-c42e09881c9f	Group	reader	\N
a602842f-85fd-44d6-9676-366c92e9d06c	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Group	reader	\N
33473081-0708-4fec-bbe1-113172458b76	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Group	admin	\N
655302eb-d965-43aa-81d4-149f8a4bf71f	e970bf27-483c-4c55-a381-c42e09881c9f	Package	reader	\N
a6c2c6a1-807d-40e2-ad6f-605471098b66	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Package	reader	\N
e5d7d4ec-6469-4a63-b01b-4fc081c5886f	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Package	admin	\N
2d7a45aa-3d57-4989-b64a-05dfc9169b9f	e970bf27-483c-4c55-a381-c42e09881c9f	Package	reader	\N
c549c519-9fe0-4e77-be0f-35ac8edca9bc	1bf67eeb-5723-4736-bcaa-7905fd0039ce	Package	reader	\N
bba446c1-368f-4ba5-be3b-fa3729fca0ea	082dec4d-1b01-4463-886e-6bb9e5b3a69a	Package	admin	\N
\.


--
-- Data for Name: vocabulary; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY vocabulary (id, name) FROM stdin;
\.


--
-- Name: activity_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY activity_detail
    ADD CONSTRAINT activity_detail_pkey PRIMARY KEY (id);


--
-- Name: activity_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: authorization_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY authorization_group
    ADD CONSTRAINT authorization_group_pkey PRIMARY KEY (id);


--
-- Name: authorization_group_role_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY authorization_group_role
    ADD CONSTRAINT authorization_group_role_pkey PRIMARY KEY (user_object_role_id);


--
-- Name: authorization_group_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY authorization_group_user
    ADD CONSTRAINT authorization_group_user_pkey PRIMARY KEY (id);


--
-- Name: dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (user_id);


--
-- Name: group_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY group_extra
    ADD CONSTRAINT group_extra_pkey PRIMARY KEY (id);


--
-- Name: group_extra_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY group_extra_revision
    ADD CONSTRAINT group_extra_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: group_name_key; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_name_key UNIQUE (name);


--
-- Name: group_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: group_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY group_revision
    ADD CONSTRAINT group_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: group_role_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY group_role
    ADD CONSTRAINT group_role_pkey PRIMARY KEY (user_object_role_id);


--
-- Name: harvest_gather_error_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY harvest_gather_error
    ADD CONSTRAINT harvest_gather_error_pkey PRIMARY KEY (id);


--
-- Name: harvest_job_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY harvest_job
    ADD CONSTRAINT harvest_job_pkey PRIMARY KEY (id);


--
-- Name: harvest_object_error_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY harvest_object_error
    ADD CONSTRAINT harvest_object_error_pkey PRIMARY KEY (id);


--
-- Name: harvest_object_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY harvest_object_extra
    ADD CONSTRAINT harvest_object_extra_pkey PRIMARY KEY (id);


--
-- Name: harvest_object_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY harvest_object
    ADD CONSTRAINT harvest_object_pkey PRIMARY KEY (id);


--
-- Name: harvest_source_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY harvest_source
    ADD CONSTRAINT harvest_source_pkey PRIMARY KEY (id);


--
-- Name: member_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- Name: member_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY member_revision
    ADD CONSTRAINT member_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: migrate_version_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY migrate_version
    ADD CONSTRAINT migrate_version_pkey PRIMARY KEY (repository_id);


--
-- Name: package_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package_extra
    ADD CONSTRAINT package_extra_pkey PRIMARY KEY (id);


--
-- Name: package_extra_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package_extra_revision
    ADD CONSTRAINT package_extra_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_name_key; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package
    ADD CONSTRAINT package_name_key UNIQUE (name);


--
-- Name: package_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package
    ADD CONSTRAINT package_pkey PRIMARY KEY (id);


--
-- Name: package_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package_relationship
    ADD CONSTRAINT package_relationship_pkey PRIMARY KEY (id);


--
-- Name: package_relationship_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package_revision
    ADD CONSTRAINT package_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_role_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package_role
    ADD CONSTRAINT package_role_pkey PRIMARY KEY (user_object_role_id);


--
-- Name: package_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package_tag
    ADD CONSTRAINT package_tag_pkey PRIMARY KEY (id);


--
-- Name: package_tag_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY package_tag_revision
    ADD CONSTRAINT package_tag_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- Name: related_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY related_dataset
    ADD CONSTRAINT related_dataset_pkey PRIMARY KEY (id);


--
-- Name: related_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY related
    ADD CONSTRAINT related_pkey PRIMARY KEY (id);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: resource_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY resource_revision
    ADD CONSTRAINT resource_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: resource_view_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY resource_view
    ADD CONSTRAINT resource_view_pkey PRIMARY KEY (id);


--
-- Name: revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY revision
    ADD CONSTRAINT revision_pkey PRIMARY KEY (id);


--
-- Name: role_action_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY role_action
    ADD CONSTRAINT role_action_pkey PRIMARY KEY (id);


--
-- Name: system_info_key_key; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY system_info
    ADD CONSTRAINT system_info_key_key UNIQUE (key);


--
-- Name: system_info_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY system_info
    ADD CONSTRAINT system_info_pkey PRIMARY KEY (id);


--
-- Name: system_info_revision_key_key; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY system_info_revision
    ADD CONSTRAINT system_info_revision_key_key UNIQUE (key);


--
-- Name: system_info_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY system_info_revision
    ADD CONSTRAINT system_info_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: system_role_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY system_role
    ADD CONSTRAINT system_role_pkey PRIMARY KEY (user_object_role_id);


--
-- Name: tag_name_vocabulary_id_key; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_name_vocabulary_id_key UNIQUE (name, vocabulary_id);


--
-- Name: tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: task_status_entity_id_task_type_key_key; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY task_status
    ADD CONSTRAINT task_status_entity_id_task_type_key_key UNIQUE (entity_id, task_type, key);


--
-- Name: task_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY task_status
    ADD CONSTRAINT task_status_pkey PRIMARY KEY (id);


--
-- Name: user_following_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY user_following_dataset
    ADD CONSTRAINT user_following_dataset_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user_following_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY user_following_group
    ADD CONSTRAINT user_following_group_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user_following_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY user_following_user
    ADD CONSTRAINT user_following_user_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user_name_key; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_name_key UNIQUE (name);


--
-- Name: user_object_role_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY user_object_role
    ADD CONSTRAINT user_object_role_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: vocabulary_name_key; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY vocabulary
    ADD CONSTRAINT vocabulary_name_key UNIQUE (name);


--
-- Name: vocabulary_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY vocabulary
    ADD CONSTRAINT vocabulary_pkey PRIMARY KEY (id);


--
-- Name: idx_activity_detail_activity_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_activity_detail_activity_id ON activity_detail USING btree (activity_id);


--
-- Name: idx_activity_object_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_activity_object_id ON activity USING btree (object_id, "timestamp");


--
-- Name: idx_activity_user_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_activity_user_id ON activity USING btree (user_id, "timestamp");


--
-- Name: idx_extra_grp_id_pkg_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_extra_grp_id_pkg_id ON member USING btree (group_id, table_id);


--
-- Name: idx_extra_id_pkg_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_extra_id_pkg_id ON package_extra USING btree (id, package_id);


--
-- Name: idx_extra_pkg_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_extra_pkg_id ON package_extra USING btree (package_id);


--
-- Name: idx_group_current; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_group_current ON group_revision USING btree (current);


--
-- Name: idx_group_extra_current; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_group_extra_current ON group_extra_revision USING btree (current);


--
-- Name: idx_group_extra_period; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_group_extra_period ON group_extra_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_group_extra_period_group; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_group_extra_period_group ON group_extra_revision USING btree (revision_timestamp, expired_timestamp, group_id);


--
-- Name: idx_group_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_group_id ON "group" USING btree (id);


--
-- Name: idx_group_name; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_group_name ON "group" USING btree (name);


--
-- Name: idx_group_period; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_group_period ON group_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_group_pkg_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_group_pkg_id ON member USING btree (table_id);


--
-- Name: idx_openid; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_openid ON "user" USING btree (openid);


--
-- Name: idx_package_current; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_current ON package_revision USING btree (current);


--
-- Name: idx_package_extra_current; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_extra_current ON package_extra_revision USING btree (current);


--
-- Name: idx_package_extra_package_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_extra_package_id ON package_extra_revision USING btree (package_id, current);


--
-- Name: idx_package_extra_period; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_extra_period ON package_extra_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_package_extra_period_package; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_extra_period_package ON package_extra_revision USING btree (revision_timestamp, expired_timestamp, package_id);


--
-- Name: idx_package_extra_rev_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_extra_rev_id ON package_extra_revision USING btree (revision_id);


--
-- Name: idx_package_group_current; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_group_current ON member_revision USING btree (current);


--
-- Name: idx_package_group_group_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_group_group_id ON member USING btree (group_id);


--
-- Name: idx_package_group_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_group_id ON member USING btree (id);


--
-- Name: idx_package_group_period_package_group; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_group_period_package_group ON member_revision USING btree (revision_timestamp, expired_timestamp, table_id, group_id);


--
-- Name: idx_package_group_pkg_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_group_pkg_id ON member USING btree (table_id);


--
-- Name: idx_package_group_pkg_id_group_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_group_pkg_id_group_id ON member USING btree (group_id, table_id);


--
-- Name: idx_package_period; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_period ON package_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_package_relationship_current; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_relationship_current ON package_relationship_revision USING btree (current);


--
-- Name: idx_package_resource_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_resource_id ON resource USING btree (id);


--
-- Name: idx_package_resource_rev_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_resource_rev_id ON resource_revision USING btree (revision_id);


--
-- Name: idx_package_resource_url; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_resource_url ON resource USING btree (url);


--
-- Name: idx_package_tag_current; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_current ON package_tag_revision USING btree (current);


--
-- Name: idx_package_tag_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_id ON package_tag USING btree (id);


--
-- Name: idx_package_tag_pkg_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_pkg_id ON package_tag USING btree (package_id);


--
-- Name: idx_package_tag_pkg_id_tag_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_pkg_id_tag_id ON package_tag USING btree (tag_id, package_id);


--
-- Name: idx_package_tag_revision_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_revision_id ON package_tag_revision USING btree (id);


--
-- Name: idx_package_tag_revision_pkg_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_revision_pkg_id ON package_tag_revision USING btree (package_id);


--
-- Name: idx_package_tag_revision_pkg_id_tag_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_revision_pkg_id_tag_id ON package_tag_revision USING btree (tag_id, package_id);


--
-- Name: idx_package_tag_revision_rev_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_revision_rev_id ON package_tag_revision USING btree (revision_id);


--
-- Name: idx_package_tag_revision_tag_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_revision_tag_id ON package_tag_revision USING btree (tag_id);


--
-- Name: idx_package_tag_tag_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_package_tag_tag_id ON package_tag USING btree (tag_id);


--
-- Name: idx_period_package_relationship; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_period_package_relationship ON package_relationship_revision USING btree (revision_timestamp, expired_timestamp, object_package_id, subject_package_id);


--
-- Name: idx_period_package_tag; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_period_package_tag ON package_tag_revision USING btree (revision_timestamp, expired_timestamp, package_id, tag_id);


--
-- Name: idx_pkg_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_id ON package USING btree (id);


--
-- Name: idx_pkg_lname; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_lname ON package USING btree (lower((name)::text));


--
-- Name: idx_pkg_name; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_name ON package USING btree (name);


--
-- Name: idx_pkg_rev_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_rev_id ON package USING btree (revision_id);


--
-- Name: idx_pkg_revision_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_revision_id ON package_revision USING btree (id);


--
-- Name: idx_pkg_revision_name; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_revision_name ON package_revision USING btree (name);


--
-- Name: idx_pkg_revision_rev_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_revision_rev_id ON package_revision USING btree (revision_id);


--
-- Name: idx_pkg_sid; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_sid ON package USING btree (id, state);


--
-- Name: idx_pkg_slname; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_slname ON package USING btree (lower((name)::text), state);


--
-- Name: idx_pkg_sname; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_sname ON package USING btree (name, state);


--
-- Name: idx_pkg_srev_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_srev_id ON package USING btree (revision_id, state);


--
-- Name: idx_pkg_stitle; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_stitle ON package USING btree (title, state);


--
-- Name: idx_pkg_suname; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_suname ON package USING btree (upper((name)::text), state);


--
-- Name: idx_pkg_title; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_title ON package USING btree (title);


--
-- Name: idx_pkg_uname; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_pkg_uname ON package USING btree (upper((name)::text));


--
-- Name: idx_ra_action; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_ra_action ON role_action USING btree (action);


--
-- Name: idx_ra_role; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_ra_role ON role_action USING btree (role);


--
-- Name: idx_ra_role_action; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_ra_role_action ON role_action USING btree (action, role);


--
-- Name: idx_rating_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_rating_id ON rating USING btree (id);


--
-- Name: idx_rating_package_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_rating_package_id ON rating USING btree (package_id);


--
-- Name: idx_rating_user_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_rating_user_id ON rating USING btree (user_id);


--
-- Name: idx_resource_current; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_resource_current ON resource_revision USING btree (current);


--
-- Name: idx_resource_period; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_resource_period ON resource_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_rev_state; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_rev_state ON revision USING btree (state);


--
-- Name: idx_revision_author; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_revision_author ON revision USING btree (author);


--
-- Name: idx_tag_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_tag_id ON tag USING btree (id);


--
-- Name: idx_tag_name; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_tag_name ON tag USING btree (name);


--
-- Name: idx_uor_context; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_uor_context ON user_object_role USING btree (context);


--
-- Name: idx_uor_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_uor_id ON user_object_role USING btree (id);


--
-- Name: idx_uor_role; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_uor_role ON user_object_role USING btree (role);


--
-- Name: idx_uor_user_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_uor_user_id ON user_object_role USING btree (user_id);


--
-- Name: idx_uor_user_id_role; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_uor_user_id_role ON user_object_role USING btree (user_id, role);


--
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_user_id ON "user" USING btree (id);


--
-- Name: idx_user_name; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_user_name ON "user" USING btree (name);


--
-- Name: idx_user_name_index; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX idx_user_name_index ON "user" USING btree ((CASE WHEN ((fullname IS NULL) OR (fullname = ''::text)) THEN name ELSE fullname END));


--
-- Name: term; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX term ON term_translation USING btree (term);


--
-- Name: term_lang; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX term_lang ON term_translation USING btree (term, lang_code);


--
-- Name: tracking_raw_access_timestamp; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX tracking_raw_access_timestamp ON tracking_raw USING btree (access_timestamp);


--
-- Name: tracking_raw_url; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX tracking_raw_url ON tracking_raw USING btree (url);


--
-- Name: tracking_raw_user_key; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX tracking_raw_user_key ON tracking_raw USING btree (user_key);


--
-- Name: tracking_summary_date; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX tracking_summary_date ON tracking_summary USING btree (tracking_date);


--
-- Name: tracking_summary_package_id; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX tracking_summary_package_id ON tracking_summary USING btree (package_id);


--
-- Name: tracking_summary_url; Type: INDEX; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE INDEX tracking_summary_url ON tracking_summary USING btree (url);


--
-- Name: activity_detail_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY activity_detail
    ADD CONSTRAINT activity_detail_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES activity(id);


--
-- Name: authorization_group_role_authorization_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY authorization_group_role
    ADD CONSTRAINT authorization_group_role_authorization_group_id_fkey FOREIGN KEY (authorization_group_id) REFERENCES authorization_group(id);


--
-- Name: authorization_group_role_user_object_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY authorization_group_role
    ADD CONSTRAINT authorization_group_role_user_object_role_id_fkey FOREIGN KEY (user_object_role_id) REFERENCES user_object_role(id);


--
-- Name: authorization_group_user_authorization_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY authorization_group_user
    ADD CONSTRAINT authorization_group_user_authorization_group_id_fkey FOREIGN KEY (authorization_group_id) REFERENCES authorization_group(id);


--
-- Name: authorization_group_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY authorization_group_user
    ADD CONSTRAINT authorization_group_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- Name: dashboard_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT dashboard_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_extra_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_extra
    ADD CONSTRAINT group_extra_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: group_extra_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_extra_revision
    ADD CONSTRAINT group_extra_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES group_extra(id);


--
-- Name: group_extra_revision_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_extra_revision
    ADD CONSTRAINT group_extra_revision_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: group_extra_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_extra
    ADD CONSTRAINT group_extra_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: group_extra_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_extra_revision
    ADD CONSTRAINT group_extra_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: group_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_revision
    ADD CONSTRAINT group_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES "group"(id);


--
-- Name: group_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: group_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_revision
    ADD CONSTRAINT group_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: group_role_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_role
    ADD CONSTRAINT group_role_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: group_role_user_object_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY group_role
    ADD CONSTRAINT group_role_user_object_role_id_fkey FOREIGN KEY (user_object_role_id) REFERENCES user_object_role(id);


--
-- Name: harvest_gather_error_harvest_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY harvest_gather_error
    ADD CONSTRAINT harvest_gather_error_harvest_job_id_fkey FOREIGN KEY (harvest_job_id) REFERENCES harvest_job(id);


--
-- Name: harvest_job_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY harvest_job
    ADD CONSTRAINT harvest_job_source_id_fkey FOREIGN KEY (source_id) REFERENCES harvest_source(id);


--
-- Name: harvest_object_error_harvest_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY harvest_object_error
    ADD CONSTRAINT harvest_object_error_harvest_object_id_fkey FOREIGN KEY (harvest_object_id) REFERENCES harvest_object(id);


--
-- Name: harvest_object_extra_harvest_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY harvest_object_extra
    ADD CONSTRAINT harvest_object_extra_harvest_object_id_fkey FOREIGN KEY (harvest_object_id) REFERENCES harvest_object(id);


--
-- Name: harvest_object_harvest_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY harvest_object
    ADD CONSTRAINT harvest_object_harvest_job_id_fkey FOREIGN KEY (harvest_job_id) REFERENCES harvest_job(id);


--
-- Name: harvest_object_harvest_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY harvest_object
    ADD CONSTRAINT harvest_object_harvest_source_id_fkey FOREIGN KEY (harvest_source_id) REFERENCES harvest_source(id);


--
-- Name: harvest_object_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY harvest_object
    ADD CONSTRAINT harvest_object_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id) DEFERRABLE;


--
-- Name: member_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: member_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY member_revision
    ADD CONSTRAINT member_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES member(id);


--
-- Name: member_revision_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY member_revision
    ADD CONSTRAINT member_revision_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: member_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: member_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY member_revision
    ADD CONSTRAINT member_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_extra_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_extra
    ADD CONSTRAINT package_extra_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: package_extra_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_extra_revision
    ADD CONSTRAINT package_extra_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES package_extra(id);


--
-- Name: package_extra_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_extra
    ADD CONSTRAINT package_extra_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_extra_revision_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_extra_revision
    ADD CONSTRAINT package_extra_revision_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: package_extra_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_extra_revision
    ADD CONSTRAINT package_extra_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_relationship_object_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_relationship
    ADD CONSTRAINT package_relationship_object_package_id_fkey FOREIGN KEY (object_package_id) REFERENCES package(id);


--
-- Name: package_relationship_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES package_relationship(id);


--
-- Name: package_relationship_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_relationship
    ADD CONSTRAINT package_relationship_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_relationship_revision_object_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_object_package_id_fkey FOREIGN KEY (object_package_id) REFERENCES package(id);


--
-- Name: package_relationship_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_relationship_revision_subject_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_subject_package_id_fkey FOREIGN KEY (subject_package_id) REFERENCES package(id);


--
-- Name: package_relationship_subject_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_relationship
    ADD CONSTRAINT package_relationship_subject_package_id_fkey FOREIGN KEY (subject_package_id) REFERENCES package(id);


--
-- Name: package_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_revision
    ADD CONSTRAINT package_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES package(id);


--
-- Name: package_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package
    ADD CONSTRAINT package_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_revision
    ADD CONSTRAINT package_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_role_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_role
    ADD CONSTRAINT package_role_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: package_role_user_object_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_role
    ADD CONSTRAINT package_role_user_object_role_id_fkey FOREIGN KEY (user_object_role_id) REFERENCES user_object_role(id);


--
-- Name: package_tag_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_tag
    ADD CONSTRAINT package_tag_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: package_tag_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_tag_revision
    ADD CONSTRAINT package_tag_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES package_tag(id);


--
-- Name: package_tag_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_tag
    ADD CONSTRAINT package_tag_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_tag_revision_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_tag_revision
    ADD CONSTRAINT package_tag_revision_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: package_tag_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_tag_revision
    ADD CONSTRAINT package_tag_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: package_tag_revision_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_tag_revision
    ADD CONSTRAINT package_tag_revision_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: package_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY package_tag
    ADD CONSTRAINT package_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: rating_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_package_id_fkey FOREIGN KEY (package_id) REFERENCES package(id);


--
-- Name: rating_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- Name: related_dataset_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY related_dataset
    ADD CONSTRAINT related_dataset_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES package(id);


--
-- Name: related_dataset_related_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY related_dataset
    ADD CONSTRAINT related_dataset_related_id_fkey FOREIGN KEY (related_id) REFERENCES related(id);


--
-- Name: resource_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY resource_revision
    ADD CONSTRAINT resource_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES resource(id);


--
-- Name: resource_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: resource_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY resource_revision
    ADD CONSTRAINT resource_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: resource_view_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY resource_view
    ADD CONSTRAINT resource_view_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: system_info_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY system_info_revision
    ADD CONSTRAINT system_info_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES system_info(id);


--
-- Name: system_info_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY system_info
    ADD CONSTRAINT system_info_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: system_info_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY system_info_revision
    ADD CONSTRAINT system_info_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES revision(id);


--
-- Name: system_role_user_object_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY system_role
    ADD CONSTRAINT system_role_user_object_role_id_fkey FOREIGN KEY (user_object_role_id) REFERENCES user_object_role(id);


--
-- Name: tag_vocabulary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_vocabulary_id_fkey FOREIGN KEY (vocabulary_id) REFERENCES vocabulary(id);


--
-- Name: user_following_dataset_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY user_following_dataset
    ADD CONSTRAINT user_following_dataset_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_dataset_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY user_following_dataset
    ADD CONSTRAINT user_following_dataset_object_id_fkey FOREIGN KEY (object_id) REFERENCES package(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY user_following_group
    ADD CONSTRAINT user_following_group_group_id_fkey FOREIGN KEY (object_id) REFERENCES "group"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY user_following_group
    ADD CONSTRAINT user_following_group_user_id_fkey FOREIGN KEY (follower_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_user_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY user_following_user
    ADD CONSTRAINT user_following_user_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_user_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY user_following_user
    ADD CONSTRAINT user_following_user_object_id_fkey FOREIGN KEY (object_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_object_role_authorized_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY user_object_role
    ADD CONSTRAINT user_object_role_authorized_group_id_fkey FOREIGN KEY (authorized_group_id) REFERENCES authorization_group(id);


--
-- Name: user_object_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckan_default
--

ALTER TABLE ONLY user_object_role
    ADD CONSTRAINT user_object_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

