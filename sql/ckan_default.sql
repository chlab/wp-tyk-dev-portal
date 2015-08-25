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
\.


--
-- Data for Name: activity_detail; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY activity_detail (id, activity_id, object_id, object_type, activity_type, data) FROM stdin;
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
64d3b89b-ff79-477e-8fb4-9cfc388b0f58	bevoelkerung	{'fr': u'Population', 'de': u'Bev\\xf6lkerung', 'en': u'Population', 'it': u'Popolazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:47:23.668582	active	d0771be4-1558-4509-9417-4f58de851f86	group	approved		f
27b314a5-57b6-4c4e-9c9f-6923365eaecc	raum	{'fr': u'Espace', 'de': u'Raum', 'en': u'Space', 'it': u'Spazio'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:07.986487	active	1c095545-1d23-4082-aa02-7a9c424cfa8c	group	approved		f
73124d1e-c2aa-4d20-a42d-fa71b8946e93	swisstopo	{"fr": "Swisstopo FR", "de": "Swisstopo DE", "en": "Swisstopo EN", "it": "Swisstopo IT"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:43.297824	active	49919ce1-2be8-45c8-89e3-81c22d977777	organization	approved		t
33ab70dd-e2da-464a-ae5f-b166f16d9e2c	arbeit	{'fr': u'Travail, r\\xe9mun\\xe9ration', 'de': u'Arbeit, Erwerb', 'en': u'Work and income', 'it': u'Lavoro e reddito'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:57:41.607386	active	c4b8d128-e3b5-439d-8244-5e8fcce20613	group	approved		f
7d52132f-7119-41ab-b2b8-e62d69a834ce	bauwesen	{'fr': u'Construction, logement', 'de': u'Bau- und Wohnungswesen', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:14.424398	active	d9eb027c-b163-453b-aa63-3bd148d8a8de	group	approved		f
afcb4a2a-b4b0-4d7c-984a-9078e964be49	bildung	{'fr': u'Education, science', 'de': u'Bildung, Wissenschaft', 'en': u'Education and science', 'it': u'Formazione e scienza'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:48.432831	active	b93a5949-5ca7-4188-ace6-1d7352c40c11	group	approved		f
42f56f74-074e-4cbb-b91b-deeb1fd58c56	energie	{'fr': u'Energie', 'de': u'Energie', 'en': u'Energy', 'it': u'Energia'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:27.505141	active	a0ecd1b2-bac8-4696-9a65-815b2b705d95	group	approved		f
79cbe120-e9c6-4249-b934-58ca980606d7	finanzen	{'fr': u'Finances', 'de': u'Finanzen', 'en': u'Finances', 'it': u'Finanze'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:55.195808	active	56c995aa-ab6b-4828-9710-2fe49c13d76b	group	approved		f
a20e9d52-0d20-413c-a8ad-9ffd4523bec6	geographie	{'fr': u'', 'de': u'Geographie', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:19.757575	active	c526c9ca-178f-4b91-9d72-3a6ed1609d9b	group	approved		f
28641aa8-b97d-49ed-85bf-c19eb0f729d3	gesetzgebung	{'fr': u'Legislation', 'de': u'Gesetzgebung', 'en': u'Legislation', 'it': u'Legislazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:48.650133	active	07904a86-1261-45dd-81df-b51627ab8e75	group	approved		f
90848388-d0b6-4b97-a686-e93b40832e1e	gesundheit	{'fr': u'Sant\\xe9', 'de': u'Gesundheit', 'en': u'Health', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:18.030175	active	051072fa-f077-46c1-a744-074145df9d03	group	approved		f
dc8b567c-fed8-4696-847b-f85510f93d71	handel	{'fr': u'', 'de': u'Handel', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:43.755102	active	5c8ac240-f49a-4a68-a10b-43346e03ced7	group	approved		f
168c842c-fd1f-4180-91ce-1aecaac8f282	industrie	{'fr': u'Industrie, services', 'de': u'Industrie, Dienstleistungen', 'en': u'Industry and services', 'it': u'Industria, servizi'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:02:27.05839	active	bb1f2492-aece-4e79-b7bf-546436441f36	group	approved		f
2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	kriminalitaet	{'fr': u'Criminalit\\xe9, droit p\\xe9nal', 'de': u'Kriminalit\\xe4t, Strafrecht', 'en': u'Crime, criminal justice', 'it': u'Criminalit\\xe0, diritto penale'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:08.838883	active	8ae8b593-e003-4d04-9056-05bf5d141bfb	group	approved		f
0d77b36f-1de6-40b3-9915-be91ee469f63	kultur	{'fr': u"Culture, m\\xe9dias, soci\\xe9t\\xe9 de l\\\\'information, sport", 'de': u'Kultur, Medien, Informationsgesellschaft, Sport', 'en': u'', 'it': u"Cultura, media, societ\\xe0 dell\\\\'informazione, sport"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:55.965249	active	dfa3b55e-370c-41f3-a324-e50cc0662b60	group	approved		f
c7521678-de76-4731-9075-25d1d6150ecf	landwirtschaft	{'fr': u'Agriculture, sylviculture', 'de': u'Land- und Forstwirtschaft', 'en': u'Agriculture, forestry', 'it': u'Agricoltura, selvicoltura'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:09:59.733494	active	a3df1166-3bbb-4209-9088-cb2f00116e1f	group	approved		f
8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	mobilitaet	{'fr': u'Mobilit\\xe9 et transports', 'de': u'Mobilit\\xe4t und Verkehr', 'en': u'Mobility and Transport', 'it': u'Mobilit\\xe0 e trasporti'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:10:45.656859	active	90bb07fc-21e9-46ba-a21f-753b3be3559e	group	approved		f
620fdda8-a92d-421b-89ad-4ef1b57a9458	sicherheit	{'fr': u'', 'de': u'\\xd6ffentliche Ordnung und Sicherheit', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:12:43.038972	active	922798b8-f459-4134-b1f2-cb5246faf932	group	approved		f
9beba14c-eab8-426e-89ae-757bc2e6445e	politik	{'fr': u'Politique', 'de': u'Politik', 'en': u'', 'it': u'Politica'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:29.816322	active	6a7d8874-3d04-40dc-9d41-b12419680a76	group	approved		f
1deb7a82-612f-46ce-9c62-89c7c0b38ddf	preise	{'fr': u'Prix', 'de': u'Preise', 'en': u'Prices', 'it': u'Prezzi'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:56.103902	active	95643ea7-62e7-49a5-b45a-7684ebf41c03	group	approved		f
011e8933-7b86-412c-8fe6-752060d8e103	soziale-sicherheit	{'fr': u'Protection sociale', 'de': u'Soziale Sicherheit', 'en': u'Social security', 'it': u'Sicurezza sociale'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:14:29.364706	active	996d9df0-84de-4e44-a818-459e89a069c8	group	approved		f
e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	statistische-grundlagen	{'fr': u'Bases statistiques', 'de': u'Statistische Grundlagen', 'en': u'Statistical basis', 'it': u'Basi statistiche'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:07.102775	active	004a195f-0c79-4ea5-a210-1f7ba0f75b3b	group	approved		f
6aace7ef-f167-40c9-a0d7-87e7e2681c07	tourismus	{'fr': u'Tourisme', 'de': u'Tourismus', 'en': u'Tourism', 'it': u'Turismo'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:32.725207	active	11c2b38a-c6de-4648-9056-156cc3ac6321	group	approved		f
afc7c340-9bdb-4767-bbcb-70094a1d0dcc	verwaltung	{'fr': u'Administration', 'de': u'Verwaltung', 'en': u'Administration', 'it': u'Amministrazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:57.072436	active	cdafd7cd-5ad2-481d-ac12-2e9004c2852b	group	approved		f
5389c3f2-2f64-436b-9fac-2d1fc342f7b5	volkswirtschaft	{'fr': u'Economie nationale', 'de': u'Volkswirtschaft', 'en': u'National economy', 'it': u'Economia'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:16:26.069858	active	649e4991-0672-40ea-a763-0edead7486f3	group	approved		f
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
64d3b89b-ff79-477e-8fb4-9cfc388b0f58	bevoelkerung	{'fr': u'Population', 'de': u'Bev\\xf6lkerung', 'en': u'Population', 'it': u'Popolazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:47:23.668582	active	d0771be4-1558-4509-9417-4f58de851f86	64d3b89b-ff79-477e-8fb4-9cfc388b0f58	\N	2015-08-25 13:47:23.136218	9999-12-31 00:00:00	\N	group	approved		f
27b314a5-57b6-4c4e-9c9f-6923365eaecc	raum	{'fr': u'Espace', 'de': u'Raum', 'en': u'Space', 'it': u'Spazio'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:07.986487	active	1c095545-1d23-4082-aa02-7a9c424cfa8c	27b314a5-57b6-4c4e-9c9f-6923365eaecc	\N	2015-08-25 13:48:07.930485	9999-12-31 00:00:00	\N	group	approved		f
73124d1e-c2aa-4d20-a42d-fa71b8946e93	swisstopo	{"fr": "Swisstopo FR", "de": "Swisstopo DE", "en": "Swisstopo EN", "it": "Swisstopo IT"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:48:43.297824	active	49919ce1-2be8-45c8-89e3-81c22d977777	73124d1e-c2aa-4d20-a42d-fa71b8946e93	\N	2015-08-25 13:48:43.109223	9999-12-31 00:00:00	\N	organization	approved		t
33ab70dd-e2da-464a-ae5f-b166f16d9e2c	arbeit	{'fr': u'Travail, r\\xe9mun\\xe9ration', 'de': u'Arbeit, Erwerb', 'en': u'Work and income', 'it': u'Lavoro e reddito'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:57:41.607386	active	c4b8d128-e3b5-439d-8244-5e8fcce20613	33ab70dd-e2da-464a-ae5f-b166f16d9e2c	\N	2015-08-25 13:57:41.331767	9999-12-31 00:00:00	\N	group	approved		f
7d52132f-7119-41ab-b2b8-e62d69a834ce	bauwesen	{'fr': u'Construction, logement', 'de': u'Bau- und Wohnungswesen', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:14.424398	active	d9eb027c-b163-453b-aa63-3bd148d8a8de	7d52132f-7119-41ab-b2b8-e62d69a834ce	\N	2015-08-25 13:58:14.353421	9999-12-31 00:00:00	\N	group	approved		f
afcb4a2a-b4b0-4d7c-984a-9078e964be49	bildung	{'fr': u'Education, science', 'de': u'Bildung, Wissenschaft', 'en': u'Education and science', 'it': u'Formazione e scienza'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:58:48.432831	active	b93a5949-5ca7-4188-ace6-1d7352c40c11	afcb4a2a-b4b0-4d7c-984a-9078e964be49	\N	2015-08-25 13:58:48.376838	9999-12-31 00:00:00	\N	group	approved		f
42f56f74-074e-4cbb-b91b-deeb1fd58c56	energie	{'fr': u'Energie', 'de': u'Energie', 'en': u'Energy', 'it': u'Energia'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:27.505141	active	a0ecd1b2-bac8-4696-9a65-815b2b705d95	42f56f74-074e-4cbb-b91b-deeb1fd58c56	\N	2015-08-25 13:59:27.425032	9999-12-31 00:00:00	\N	group	approved		f
79cbe120-e9c6-4249-b934-58ca980606d7	finanzen	{'fr': u'Finances', 'de': u'Finanzen', 'en': u'Finances', 'it': u'Finanze'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 13:59:55.195808	active	56c995aa-ab6b-4828-9710-2fe49c13d76b	79cbe120-e9c6-4249-b934-58ca980606d7	\N	2015-08-25 13:59:55.153821	9999-12-31 00:00:00	\N	group	approved		f
a20e9d52-0d20-413c-a8ad-9ffd4523bec6	geographie	{'fr': u'', 'de': u'Geographie', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:19.757575	active	c526c9ca-178f-4b91-9d72-3a6ed1609d9b	a20e9d52-0d20-413c-a8ad-9ffd4523bec6	\N	2015-08-25 14:00:19.713155	9999-12-31 00:00:00	\N	group	approved		f
28641aa8-b97d-49ed-85bf-c19eb0f729d3	gesetzgebung	{'fr': u'Legislation', 'de': u'Gesetzgebung', 'en': u'Legislation', 'it': u'Legislazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:00:48.650133	active	07904a86-1261-45dd-81df-b51627ab8e75	28641aa8-b97d-49ed-85bf-c19eb0f729d3	\N	2015-08-25 14:00:48.371024	9999-12-31 00:00:00	\N	group	approved		f
90848388-d0b6-4b97-a686-e93b40832e1e	gesundheit	{'fr': u'Sant\\xe9', 'de': u'Gesundheit', 'en': u'Health', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:18.030175	active	051072fa-f077-46c1-a744-074145df9d03	90848388-d0b6-4b97-a686-e93b40832e1e	\N	2015-08-25 14:01:17.949147	9999-12-31 00:00:00	\N	group	approved		f
dc8b567c-fed8-4696-847b-f85510f93d71	handel	{'fr': u'', 'de': u'Handel', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:01:43.755102	active	5c8ac240-f49a-4a68-a10b-43346e03ced7	dc8b567c-fed8-4696-847b-f85510f93d71	\N	2015-08-25 14:01:43.717176	9999-12-31 00:00:00	\N	group	approved		f
168c842c-fd1f-4180-91ce-1aecaac8f282	industrie	{'fr': u'Industrie, services', 'de': u'Industrie, Dienstleistungen', 'en': u'Industry and services', 'it': u'Industria, servizi'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:02:27.05839	active	bb1f2492-aece-4e79-b7bf-546436441f36	168c842c-fd1f-4180-91ce-1aecaac8f282	\N	2015-08-25 14:02:26.928902	9999-12-31 00:00:00	\N	group	approved		f
2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	kriminalitaet	{'fr': u'Criminalit\\xe9, droit p\\xe9nal', 'de': u'Kriminalit\\xe4t, Strafrecht', 'en': u'Crime, criminal justice', 'it': u'Criminalit\\xe0, diritto penale'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:08.838883	active	8ae8b593-e003-4d04-9056-05bf5d141bfb	2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1	\N	2015-08-25 14:03:08.77776	9999-12-31 00:00:00	\N	group	approved		f
0d77b36f-1de6-40b3-9915-be91ee469f63	kultur	{'fr': u"Culture, m\\xe9dias, soci\\xe9t\\xe9 de l\\\\'information, sport", 'de': u'Kultur, Medien, Informationsgesellschaft, Sport', 'en': u'', 'it': u"Cultura, media, societ\\xe0 dell\\\\'informazione, sport"}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:03:55.965249	active	dfa3b55e-370c-41f3-a324-e50cc0662b60	0d77b36f-1de6-40b3-9915-be91ee469f63	\N	2015-08-25 14:03:55.892244	9999-12-31 00:00:00	\N	group	approved		f
c7521678-de76-4731-9075-25d1d6150ecf	landwirtschaft	{'fr': u'Agriculture, sylviculture', 'de': u'Land- und Forstwirtschaft', 'en': u'Agriculture, forestry', 'it': u'Agricoltura, selvicoltura'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:09:59.733494	active	a3df1166-3bbb-4209-9088-cb2f00116e1f	c7521678-de76-4731-9075-25d1d6150ecf	\N	2015-08-25 14:09:57.489689	9999-12-31 00:00:00	\N	group	approved		f
8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	mobilitaet	{'fr': u'Mobilit\\xe9 et transports', 'de': u'Mobilit\\xe4t und Verkehr', 'en': u'Mobility and Transport', 'it': u'Mobilit\\xe0 e trasporti'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:10:45.656859	active	90bb07fc-21e9-46ba-a21f-753b3be3559e	8c2a33d5-475d-48dd-87b6-7ce5eb2033fa	\N	2015-08-25 14:10:45.599306	9999-12-31 00:00:00	\N	group	approved		f
620fdda8-a92d-421b-89ad-4ef1b57a9458	sicherheit	{'fr': u'', 'de': u'\\xd6ffentliche Ordnung und Sicherheit', 'en': u'', 'it': u''}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:12:43.038972	active	922798b8-f459-4134-b1f2-cb5246faf932	620fdda8-a92d-421b-89ad-4ef1b57a9458	\N	2015-08-25 14:12:42.956754	9999-12-31 00:00:00	\N	group	approved		f
9beba14c-eab8-426e-89ae-757bc2e6445e	politik	{'fr': u'Politique', 'de': u'Politik', 'en': u'', 'it': u'Politica'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:29.816322	active	6a7d8874-3d04-40dc-9d41-b12419680a76	9beba14c-eab8-426e-89ae-757bc2e6445e	\N	2015-08-25 14:13:29.692699	9999-12-31 00:00:00	\N	group	approved		f
1deb7a82-612f-46ce-9c62-89c7c0b38ddf	preise	{'fr': u'Prix', 'de': u'Preise', 'en': u'Prices', 'it': u'Prezzi'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:13:56.103902	active	95643ea7-62e7-49a5-b45a-7684ebf41c03	1deb7a82-612f-46ce-9c62-89c7c0b38ddf	\N	2015-08-25 14:13:56.056761	9999-12-31 00:00:00	\N	group	approved		f
011e8933-7b86-412c-8fe6-752060d8e103	soziale-sicherheit	{'fr': u'Protection sociale', 'de': u'Soziale Sicherheit', 'en': u'Social security', 'it': u'Sicurezza sociale'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:14:29.364706	active	996d9df0-84de-4e44-a818-459e89a069c8	011e8933-7b86-412c-8fe6-752060d8e103	\N	2015-08-25 14:14:29.317352	9999-12-31 00:00:00	\N	group	approved		f
6aace7ef-f167-40c9-a0d7-87e7e2681c07	tourismus	{'fr': u'Tourisme', 'de': u'Tourismus', 'en': u'Tourism', 'it': u'Turismo'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:32.725207	active	11c2b38a-c6de-4648-9056-156cc3ac6321	6aace7ef-f167-40c9-a0d7-87e7e2681c07	\N	2015-08-25 14:15:32.496199	9999-12-31 00:00:00	\N	group	approved		f
5389c3f2-2f64-436b-9fac-2d1fc342f7b5	volkswirtschaft	{'fr': u'Economie nationale', 'de': u'Volkswirtschaft', 'en': u'National economy', 'it': u'Economia'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:16:26.069858	active	649e4991-0672-40ea-a763-0edead7486f3	5389c3f2-2f64-436b-9fac-2d1fc342f7b5	\N	2015-08-25 14:16:26.033465	9999-12-31 00:00:00	\N	group	approved		f
e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	statistische-grundlagen	{'fr': u'Bases statistiques', 'de': u'Statistische Grundlagen', 'en': u'Statistical basis', 'it': u'Basi statistiche'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:07.102775	active	004a195f-0c79-4ea5-a210-1f7ba0f75b3b	e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2	\N	2015-08-25 14:15:07.002868	9999-12-31 00:00:00	\N	group	approved		f
afc7c340-9bdb-4767-bbcb-70094a1d0dcc	verwaltung	{'fr': u'Administration', 'de': u'Verwaltung', 'en': u'Administration', 'it': u'Amministrazione'}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-25 14:15:57.072436	active	cdafd7cd-5ad2-481d-ac12-2e9004c2852b	afc7c340-9bdb-4767-bbcb-70094a1d0dcc	\N	2015-08-25 14:15:56.953398	9999-12-31 00:00:00	\N	group	approved		f
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
\.


--
-- Data for Name: package_extra; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_extra (id, package_id, key, value, revision_id, state) FROM stdin;
\.


--
-- Data for Name: package_extra_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_extra_revision (id, package_id, key, value, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
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
\.


--
-- Data for Name: package_role; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_role (user_object_role_id, package_id) FROM stdin;
\.


--
-- Data for Name: package_tag; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_tag (id, package_id, tag_id, revision_id, state) FROM stdin;
\.


--
-- Data for Name: package_tag_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_tag_revision (id, package_id, tag_id, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
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
\.


--
-- Data for Name: resource_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY resource_revision (id, url, format, description, "position", revision_id, continuity_id, hash, state, extras, expired_id, revision_timestamp, expired_timestamp, current, name, resource_type, mimetype, mimetype_inner, size, last_modified, cache_url, cache_last_updated, webstore_url, webstore_last_updated, created, url_type, package_id) FROM stdin;
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

