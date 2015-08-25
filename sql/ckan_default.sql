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
-- Name: system_info; Type: TABLE; Schema: public; Owner: ckan_default; Tablespace: 
--

CREATE TABLE system_info (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value text,
    revision_id text,
    state text DEFAULT 'active'::text NOT NULL
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
    continuity_id integer,
    state text DEFAULT 'active'::text NOT NULL,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
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
695f10ea-8ee1-43a1-a8d4-35f3ebd9477b	2015-08-07 12:35:29.341224	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	\N	new user	\N
d6f57248-b306-4bdb-82ec-c045224298ee	2015-08-07 12:35:33.786627	3f7479cc-ef13-4b22-ab1c-b3220bd8c75d	3f7479cc-ef13-4b22-ab1c-b3220bd8c75d	\N	new user	\N
b5b3330e-04a0-48e4-84c8-61dfb5f0a24c	2015-08-07 14:20:16.188089	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	014c5ea2-2315-4c88-bcd1-301d41063df1	new package	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:14.734559", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "draft", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "014c5ea2-2315-4c88-bcd1-301d41063df1", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
788c5ffb-e9b0-4c4e-aa70-70c9ccce47c1	2015-08-07 14:20:23.746103	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	6e84eb2b-bca1-405c-8552-8a48d7769f7e	changed package	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:23.494383", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "draft", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "014c5ea2-2315-4c88-bcd1-301d41063df1", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
0df336ad-76e2-4354-a841-0e7f518e2c8b	2015-08-07 14:20:24.057505	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	f77701fd-fb32-4644-b9b9-ff114af44ec4	changed package	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:23.813265", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "f77701fd-fb32-4644-b9b9-ff114af44ec4", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
30d130dc-a5bc-4ec4-a5ca-1ddb4c0305e3	2015-08-07 14:20:51.417284	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	350c2793-f029-42ea-8640-4cd6f66ce9fd	changed package	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:51.170250", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "f77701fd-fb32-4644-b9b9-ff114af44ec4", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
abbab492-3b61-460e-a2fc-43d99efc5137	2015-08-10 15:12:57.346173	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	3f55cc41-c276-4194-a84e-be191ca0b8ae	63f340a0-e5de-4b54-bd26-a9649a01d123	new package	{"package": {"owner_org": null, "maintainer": "", "name": "another-dataset", "metadata_modified": "2015-08-10T15:12:56.752338", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT Titel\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "draft", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "63f340a0-e5de-4b54-bd26-a9649a01d123", "type": "dataset", "id": "3f55cc41-c276-4194-a84e-be191ca0b8ae"}}
c9fd45a6-acdb-4353-a78d-cad262d03d58	2015-08-10 15:13:02.986861	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	3f55cc41-c276-4194-a84e-be191ca0b8ae	0d8de502-ef87-40fd-af6e-de746cdbc562	changed package	{"package": {"owner_org": null, "maintainer": "", "name": "another-dataset", "metadata_modified": "2015-08-10T15:13:02.862461", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT Titel\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "draft", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "63f340a0-e5de-4b54-bd26-a9649a01d123", "type": "dataset", "id": "3f55cc41-c276-4194-a84e-be191ca0b8ae"}}
169df35c-341f-450f-9a4f-fda1699d5143	2015-08-10 15:13:03.245307	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	3f55cc41-c276-4194-a84e-be191ca0b8ae	034e0c51-e4d3-4257-927a-61abbb6c43e9	changed package	{"package": {"owner_org": null, "maintainer": "", "name": "another-dataset", "metadata_modified": "2015-08-10T15:13:03.054112", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT Titel\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "034e0c51-e4d3-4257-927a-61abbb6c43e9", "type": "dataset", "id": "3f55cc41-c276-4194-a84e-be191ca0b8ae"}}
934c8777-b6af-4e13-b619-caed0819e229	2015-08-11 14:34:52.011916	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	5775273f-f375-461b-8c9d-fa9f172ec2c4	bc1de2d7-2ef1-4774-a6de-fd26615c1ad6	new package	{"package": {"owner_org": null, "maintainer": null, "name": "asdasd", "metadata_modified": "2015-08-11T14:34:51.636669", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "type": "dataset", "id": "5775273f-f375-461b-8c9d-fa9f172ec2c4"}}
a5050788-0a18-4478-8a82-dc7b5a3b1590	2015-08-11 14:35:16.516614	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	5775273f-f375-461b-8c9d-fa9f172ec2c4	242c58f0-47d5-414a-b494-5edec5b046c7	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "asdasd", "metadata_modified": "2015-08-11T14:35:16.245952", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "type": "dataset", "id": "5775273f-f375-461b-8c9d-fa9f172ec2c4"}}
6f34783e-2479-4c60-8f2a-0786af1ec735	2015-08-11 14:35:16.765025	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	5775273f-f375-461b-8c9d-fa9f172ec2c4	4dcca1c7-d6f4-4abe-b931-1108792c506a	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "asdasd", "metadata_modified": "2015-08-11T14:35:16.575730", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "4dcca1c7-d6f4-4abe-b931-1108792c506a", "type": "dataset", "id": "5775273f-f375-461b-8c9d-fa9f172ec2c4"}}
f4f5a3e4-34f9-4583-aee0-cab96682180d	2015-08-12 08:09:11.632137	not logged in	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	97bfec67-ecc0-4291-a90b-04bd39c53f62	changed package	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:51.170250", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "f77701fd-fb32-4644-b9b9-ff114af44ec4", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
6f805463-33bb-4784-9877-402166072770	2015-08-12 08:13:07.313415	not logged in	3f55cc41-c276-4194-a84e-be191ca0b8ae	597109ec-33e4-47b6-b377-ee55c8fed47c	changed package	{"package": {"owner_org": null, "maintainer": "", "name": "another-dataset", "metadata_modified": "2015-08-10T15:19:02.367921", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT Titel\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "034e0c51-e4d3-4257-927a-61abbb6c43e9", "type": "dataset", "id": "3f55cc41-c276-4194-a84e-be191ca0b8ae"}}
23b0641f-7588-4fdc-914e-06cc4089abcc	2015-08-12 08:13:54.379543	not logged in	5775273f-f375-461b-8c9d-fa9f172ec2c4	2487b628-484b-4acc-933b-37343f95427b	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "asdasd", "metadata_modified": "2015-08-11T14:35:16.575730", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "4dcca1c7-d6f4-4abe-b931-1108792c506a", "type": "dataset", "id": "5775273f-f375-461b-8c9d-fa9f172ec2c4"}}
3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	2015-08-12 08:14:21.119339	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	f79c6f4a-11ca-412c-8f36-506d3b55007f	3b1b9d94-e0cd-4a2d-a011-e488a9c707e3	new package	{"package": {"owner_org": null, "maintainer": null, "name": "test", "metadata_modified": "2015-08-12T08:14:20.732915", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "type": "dataset", "id": "f79c6f4a-11ca-412c-8f36-506d3b55007f"}}
e86e02a5-094d-4655-b6a8-ea450df05d8d	2015-08-12 08:14:30.849027	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	f79c6f4a-11ca-412c-8f36-506d3b55007f	17d59392-22a8-4707-83ff-43f3614ea67d	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "test", "metadata_modified": "2015-08-12T08:14:30.717144", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "type": "dataset", "id": "f79c6f4a-11ca-412c-8f36-506d3b55007f"}}
7a6a2010-a301-4462-b642-c0d43291d4d6	2015-08-12 08:14:31.177121	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	f79c6f4a-11ca-412c-8f36-506d3b55007f	cfa83e51-0b41-426c-b00f-2ae01f43c8cc	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "test", "metadata_modified": "2015-08-12T08:14:30.947203", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "cfa83e51-0b41-426c-b00f-2ae01f43c8cc", "type": "dataset", "id": "f79c6f4a-11ca-412c-8f36-506d3b55007f"}}
d8b2a79f-8c76-49be-bf4e-86b21ffccf85	2015-08-12 09:21:58.374965	not logged in	f79c6f4a-11ca-412c-8f36-506d3b55007f	cf3929b1-b8f3-4573-8291-8a046324cb43	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "test", "metadata_modified": "2015-08-12T08:14:30.947203", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "cfa83e51-0b41-426c-b00f-2ae01f43c8cc", "type": "dataset", "id": "f79c6f4a-11ca-412c-8f36-506d3b55007f"}}
01625b0b-785b-4ae0-847d-82ecd9865506	2015-08-12 09:22:36.464594	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	c9c9320d-96bf-4808-b0d4-079c5e30d3d8	new package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T09:22:36.096041", "author": null, "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
ec46057e-b45c-4826-a2ea-3734526fde30	2015-08-12 09:22:53.914684	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	9333eb3d-8838-4b51-b2dd-2def530567ed	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T09:22:53.789760", "author": null, "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
b540c1cc-4579-4073-a1ab-65f6a3f3847a	2015-08-12 09:22:54.138152	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	2d53b455-1dd7-49a2-a1f3-1a48f63313b7	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T09:22:53.990991", "author": null, "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "2d53b455-1dd7-49a2-a1f3-1a48f63313b7", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
9239f003-b125-411b-b52b-0e670159fd95	2015-08-12 11:09:10.682507	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	904df174-cd96-40e5-93d6-8c091d0ba4e1	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T11:09:10.353256", "author": null, "url": "", "notes": "test", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "904df174-cd96-40e5-93d6-8c091d0ba4e1", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
a4aafce5-ddd2-4a6e-8dfc-62a2d26e68c1	2015-08-12 11:13:25.066142	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	53691f78-c5c1-429a-9630-150c51e1e0bb	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T11:13:24.687232", "author": null, "url": "", "notes": "{\\"fr\\": \\"desc fr\\", \\"de\\": \\"desc de\\", \\"en\\": \\"desc en\\", \\"it\\": \\"desc it\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "53691f78-c5c1-429a-9630-150c51e1e0bb", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
9b864057-7f72-49bf-980b-d08d257621ea	2015-08-12 11:20:54.883455	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	3fd9832b-cf52-43da-9bb0-012dc32b9dad	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T11:20:54.116227", "author": null, "url": "", "notes": "test", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "3fd9832b-cf52-43da-9bb0-012dc32b9dad", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
5317b81d-96b8-4be1-8f97-e371db1a50ed	2015-08-12 11:22:51.41007	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	7fe6c6c7-20f8-4eca-bfaf-6ecc9e9fdd9a	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T11:22:50.942083", "author": null, "url": "", "notes": "{\\"fr\\": \\"asdf\\", \\"de\\": \\"dsaf\\", \\"en\\": \\"adsf\\", \\"it\\": \\"asdf\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "7fe6c6c7-20f8-4eca-bfaf-6ecc9e9fdd9a", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
97b2f1b4-3940-49b6-b125-69083f791578	2015-08-21 07:16:13.824705	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	c01baaba-0847-435a-9715-8cf8e8427b3e	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:16:12.959454", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR Desc\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"EN Desc\\", \\"it\\": \\"IT Desc\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "c01baaba-0847-435a-9715-8cf8e8427b3e", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
3bfd5a0c-a8b0-4591-ab1e-2be031e494f0	2015-08-21 07:16:58.994009	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	59920b5b-6904-4eb3-8f70-bbbb3042b926	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:16:58.777409", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR Desc\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"EN Desc\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "59920b5b-6904-4eb3-8f70-bbbb3042b926", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
70cbe48a-0aae-4c79-b288-6232cc7994a8	2015-08-21 07:17:10.445337	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	4d7362a1-0e0a-4dbb-b57c-9ef3ff590c67	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:17:10.079163", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"EN Desc\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "4d7362a1-0e0a-4dbb-b57c-9ef3ff590c67", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
70ff0056-a8a0-4aa9-aee2-da6635cb0d1f	2015-08-21 07:17:19.480201	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	2d56c229-2777-4e7f-8cd7-c609044b0325	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:17:19.250502", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "2d56c229-2777-4e7f-8cd7-c609044b0325", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
9d31a0ff-63d5-4eba-a71a-d2c46da113d6	2015-08-21 07:17:35.385272	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	6a3fc0c5-23a4-433f-b6db-a47ad4aa3c33	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:17:34.987761", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "6a3fc0c5-23a4-433f-b6db-a47ad4aa3c33", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
306f106e-83bf-4c4c-9bb7-25fcd9a88fe8	2015-08-21 07:18:08.388069	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	853b5bc9-2930-45cf-bc6c-8b28d2cd5bf3	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:18:07.175740", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"\\", \\"it\\": \\"IT DESC\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "853b5bc9-2930-45cf-bc6c-8b28d2cd5bf3", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
3044f87b-b2da-4ecc-bc2c-696ced6c0877	2015-08-21 07:18:20.558439	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	431dbd5e-493d-472c-afc0-bd1bd2a6b30f	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:18:20.364959", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"IT DESC\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "431dbd5e-493d-472c-afc0-bd1bd2a6b30f", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
599f9c8c-2491-4e35-b496-42688e8a4c16	2015-08-21 07:18:54.954895	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	a21f8bec-50a0-44d0-825b-1cd42b0b2a7c	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:18:54.618704", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"IT DESC\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "431dbd5e-493d-472c-afc0-bd1bd2a6b30f", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
930fd75c-5d86-4a35-8a08-7e561096a2fb	2015-08-21 08:09:47.067872	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	83a99d84-26af-4adb-8d7e-aa1683c852f5	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T08:09:46.473195", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"IT DESC\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "431dbd5e-493d-472c-afc0-bd1bd2a6b30f", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
2283d4a4-f7d6-4115-bce0-6c4bc436c89c	2015-08-21 08:11:04.795909	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	ed7bad34-9a0c-47b3-98d8-54516214943f	e03a6adf-1273-4736-a3d8-22f6c6e5e34e	changed package	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T08:11:04.533220", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"IT DESC\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "431dbd5e-493d-472c-afc0-bd1bd2a6b30f", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
45dc30ce-2006-47b4-9247-d5ae9e27bdb2	2015-08-21 11:21:00.937219	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	992a18c5-7cc2-4a74-89c3-7754326b374e	985a82de-df58-4f85-b5f4-b5415205c27e	new organization	{"group": {"description": "{'fr': u'', 'de': u'', 'en': u'', 'it': u''}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "created": "2015-08-21T11:21:00.258974", "approval_status": "approved", "is_organization": true, "state": "active", "image_url": "", "revision_id": "985a82de-df58-4f85-b5f4-b5415205c27e", "type": "organization", "id": "992a18c5-7cc2-4a74-89c3-7754326b374e", "name": "swisstopo"}}
5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	2015-08-21 14:35:44.643489	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	new package	{"package": {"owner_org": "992a18c5-7cc2-4a74-89c3-7754326b374e", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-08-21T14:35:44.179892", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "type": "dataset", "id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048"}}
f4dcee2d-2aed-40b1-86d2-7c56eece12e1	2015-08-21 15:13:30.979722	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	6a2d0695-98b9-40dc-99cf-c13d8a36cbdd	changed package	{"package": {"owner_org": "992a18c5-7cc2-4a74-89c3-7754326b374e", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-08-21T15:13:30.350658", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "type": "dataset", "id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048"}}
506618e7-fb92-46f1-9863-9c0e79147396	2015-08-21 15:18:56.75753	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	c9bba04e-9529-4546-903b-67d6dbfb51ac	changed package	{"package": {"owner_org": "992a18c5-7cc2-4a74-89c3-7754326b374e", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-08-21T15:18:56.298453", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "type": "dataset", "id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048"}}
bd03e384-cf1c-45cb-a114-4c0fa12f056c	2015-08-21 16:11:03.780656	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	changed package	{"package": {"owner_org": "992a18c5-7cc2-4a74-89c3-7754326b374e", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-08-21T16:11:03.172520", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "type": "dataset", "id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048"}}
e919c8d5-5c24-4d51-9f45-5f63528557b2	2015-08-24 07:26:55.145318	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	c30bc228-11da-4ed8-9b51-06c666b22dc8	changed package	{"package": {"owner_org": "992a18c5-7cc2-4a74-89c3-7754326b374e", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-08-24T07:26:54.503585", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "type": "dataset", "id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048"}}
\.


--
-- Data for Name: activity_detail; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY activity_detail (id, activity_id, object_id, object_type, activity_type, data) FROM stdin;
357bc4ed-8b0c-455b-985e-0e1a5b23ab00	b5b3330e-04a0-48e4-84c8-61dfb5f0a24c	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	Package	new	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:14.734559", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "draft", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "014c5ea2-2315-4c88-bcd1-301d41063df1", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
43778f7e-7f13-4ecd-ad90-97b1edad7097	b5b3330e-04a0-48e4-84c8-61dfb5f0a24c	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	Package	changed	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:14.734559", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "draft", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "014c5ea2-2315-4c88-bcd1-301d41063df1", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
e5011a3d-dac7-48e9-948a-84dc8a14edba	788c5ffb-e9b0-4c4e-aa70-70c9ccce47c1	17797153-6484-478d-b792-377aea3e1b4a	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f", "webstore_last_updated": null, "id": "17797153-6484-478d-b792-377aea3e1b4a", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": "", "created": "2015-08-07T14:20:23.522249", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {}, "position": 0, "revision_id": "6e84eb2b-bca1-405c-8552-8a48d7769f7e", "resource_type": null}}
fd66f233-5e96-415b-a1ba-1dc89cff7e39	0df336ad-76e2-4354-a841-0e7f518e2c8b	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	Package	changed	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:23.813265", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "f77701fd-fb32-4644-b9b9-ff114af44ec4", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
d254c4c2-7381-4143-8a19-3b1bf78e8d76	30d130dc-a5bc-4ec4-a5ca-1ddb4c0305e3	17797153-6484-478d-b792-377aea3e1b4a	Resource	changed	{"resource": {"cache_last_updated": null, "package_id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f", "webstore_last_updated": null, "id": "17797153-6484-478d-b792-377aea3e1b4a", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": "Test 1,2,3", "created": "2015-08-07T14:20:23.522249", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {}, "position": 0, "revision_id": "350c2793-f029-42ea-8640-4cd6f66ce9fd", "resource_type": null}}
41571fd8-0c6c-4909-b11a-f2e66faf3f21	abbab492-3b61-460e-a2fc-43d99efc5137	3f55cc41-c276-4194-a84e-be191ca0b8ae	Package	new	{"package": {"owner_org": null, "maintainer": "", "name": "another-dataset", "metadata_modified": "2015-08-10T15:12:56.752338", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT Titel\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "draft", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "63f340a0-e5de-4b54-bd26-a9649a01d123", "type": "dataset", "id": "3f55cc41-c276-4194-a84e-be191ca0b8ae"}}
df5cd119-6387-4af4-858d-45965f92eb4f	abbab492-3b61-460e-a2fc-43d99efc5137	3f55cc41-c276-4194-a84e-be191ca0b8ae	Package	changed	{"package": {"owner_org": null, "maintainer": "", "name": "another-dataset", "metadata_modified": "2015-08-10T15:12:56.752338", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT Titel\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "draft", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "63f340a0-e5de-4b54-bd26-a9649a01d123", "type": "dataset", "id": "3f55cc41-c276-4194-a84e-be191ca0b8ae"}}
ee3ad9da-08fa-4388-ad72-0ac7f1357ebf	c9fd45a6-acdb-4353-a78d-cad262d03d58	ed1f28e7-f4a8-4f35-9e50-a28ff61d65e7	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "3f55cc41-c276-4194-a84e-be191ca0b8ae", "webstore_last_updated": null, "id": "ed1f28e7-f4a8-4f35-9e50-a28ff61d65e7", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": "", "created": "2015-08-10T15:13:02.883928", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {}, "position": 0, "revision_id": "0d8de502-ef87-40fd-af6e-de746cdbc562", "resource_type": null}}
d173c974-7b35-4c16-8aca-05dcb2e7d63d	169df35c-341f-450f-9a4f-fda1699d5143	3f55cc41-c276-4194-a84e-be191ca0b8ae	Package	changed	{"package": {"owner_org": null, "maintainer": "", "name": "another-dataset", "metadata_modified": "2015-08-10T15:13:03.054112", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT Titel\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "034e0c51-e4d3-4257-927a-61abbb6c43e9", "type": "dataset", "id": "3f55cc41-c276-4194-a84e-be191ca0b8ae"}}
7e7834b8-d5fc-4320-925f-b6fe4cf7a765	934c8777-b6af-4e13-b619-caed0819e229	5775273f-f375-461b-8c9d-fa9f172ec2c4	Package	new	{"package": {"owner_org": null, "maintainer": null, "name": "asdasd", "metadata_modified": "2015-08-11T14:34:51.636669", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "type": "dataset", "id": "5775273f-f375-461b-8c9d-fa9f172ec2c4"}}
4b936237-811e-4347-8991-5b4e84363301	934c8777-b6af-4e13-b619-caed0819e229	6c6519a5-2d14-400d-b87a-78ed97d6c90c	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "relation", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "6c6519a5-2d14-400d-b87a-78ed97d6c90c"}}
4844ada4-84ae-495b-b59d-eb5c6f82d902	934c8777-b6af-4e13-b619-caed0819e229	252762af-abad-4bfd-838a-c99c05f9f1ce	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "contactPoint", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "252762af-abad-4bfd-838a-c99c05f9f1ce"}}
d064f575-3a58-45e2-a898-eae0c89ee976	934c8777-b6af-4e13-b619-caed0819e229	7a39ec37-0670-499d-b420-45ab057e5b1c	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "spatial", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "7a39ec37-0670-499d-b420-45ab057e5b1c"}}
64188a06-b09c-44cc-95bc-50b0df2b4d5d	934c8777-b6af-4e13-b619-caed0819e229	8f0318cc-dbe7-4026-b20a-47473a9a6b48	PackageExtra	new	{"package_extra": {"state": "active", "value": "[\\"fr\\", \\"it\\"]", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "language", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "8f0318cc-dbe7-4026-b20a-47473a9a6b48"}}
71f2981b-1f80-4f56-beb6-74f9607ae3b7	934c8777-b6af-4e13-b619-caed0819e229	5ffab657-1520-4704-a505-33eee095e6e4	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "identifier", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "5ffab657-1520-4704-a505-33eee095e6e4"}}
752c94ae-a14a-4652-b61f-631171583c9d	934c8777-b6af-4e13-b619-caed0819e229	7b3c0941-4a8e-4586-91cf-e37d90990b35	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "temporal", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "7b3c0941-4a8e-4586-91cf-e37d90990b35"}}
9073e0d6-4059-459b-a6a5-de29b69d4d27	934c8777-b6af-4e13-b619-caed0819e229	7fe76f81-d6aa-4db5-b5e2-cc30833ee3b5	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "see_also", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "7fe76f81-d6aa-4db5-b5e2-cc30833ee3b5"}}
9b2ebd21-dd78-4fac-a5a0-7f117b761773	934c8777-b6af-4e13-b619-caed0819e229	ff975ad8-898c-4e25-b2ca-ea78d8a48fa7	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "coverage", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "ff975ad8-898c-4e25-b2ca-ea78d8a48fa7"}}
eb3bc54c-8395-479d-a533-b34d1c8b9913	934c8777-b6af-4e13-b619-caed0819e229	24f120b3-74d6-47a2-92ea-b3d8140eafd4	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "accrual_periodicity", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "24f120b3-74d6-47a2-92ea-b3d8140eafd4"}}
6e440abd-7b44-4b9a-b35b-cd286cf923f3	934c8777-b6af-4e13-b619-caed0819e229	5775273f-f375-461b-8c9d-fa9f172ec2c4	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "asdasd", "metadata_modified": "2015-08-11T14:34:51.636669", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "type": "dataset", "id": "5775273f-f375-461b-8c9d-fa9f172ec2c4"}}
482d70cb-b8e8-4678-9fbc-c9ee2909a1c1	a5050788-0a18-4478-8a82-dc7b5a3b1590	38726c98-728a-40e1-a688-a612480fa5a7	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "webstore_last_updated": null, "id": "38726c98-728a-40e1-a688-a612480fa5a7", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-11T14:35:16.271203", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"license": "", "language": "[\\"fr\\", \\"it\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "identifier": ""}, "position": 0, "revision_id": "242c58f0-47d5-414a-b494-5edec5b046c7", "resource_type": null}}
1f53da6e-414d-4b4a-88e6-f50a8d4c5cf2	6f34783e-2479-4c60-8f2a-0786af1ec735	38726c98-728a-40e1-a688-a612480fa5a7	Resource	changed	{"resource": {"cache_last_updated": null, "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "webstore_last_updated": null, "id": "38726c98-728a-40e1-a688-a612480fa5a7", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-11T14:35:16.271203", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"fr\\", \\"it\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "identifier": ""}, "position": 0, "revision_id": "4dcca1c7-d6f4-4abe-b931-1108792c506a", "resource_type": null}}
237b8ddb-8f3c-48ac-ad8f-8b5bd35f5cb9	6f34783e-2479-4c60-8f2a-0786af1ec735	5775273f-f375-461b-8c9d-fa9f172ec2c4	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "asdasd", "metadata_modified": "2015-08-11T14:35:16.575730", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "4dcca1c7-d6f4-4abe-b931-1108792c506a", "type": "dataset", "id": "5775273f-f375-461b-8c9d-fa9f172ec2c4"}}
462fe33f-d730-4cb4-9f0b-a822836c3c8e	f4f5a3e4-34f9-4583-aee0-cab96682180d	ca3e5c86-c316-4e4c-b71b-5dcfd600020f	Package	deleted	{"package": {"owner_org": null, "maintainer": "", "name": "test-datensatz", "metadata_modified": "2015-08-07T14:20:51.170250", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"Test Datensatz\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "f77701fd-fb32-4644-b9b9-ff114af44ec4", "type": "dataset", "id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f"}}
2dc30a28-ccee-447d-8408-b7850c761e66	f4f5a3e4-34f9-4583-aee0-cab96682180d	17797153-6484-478d-b792-377aea3e1b4a	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "ca3e5c86-c316-4e4c-b71b-5dcfd600020f", "webstore_last_updated": null, "id": "17797153-6484-478d-b792-377aea3e1b4a", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": "Test 1,2,3", "created": "2015-08-07T14:20:23.522249", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {}, "position": 0, "revision_id": "350c2793-f029-42ea-8640-4cd6f66ce9fd", "resource_type": null}}
b3924621-02d7-4029-b933-234d754e463d	6f805463-33bb-4784-9877-402166072770	3f55cc41-c276-4194-a84e-be191ca0b8ae	Package	deleted	{"package": {"owner_org": null, "maintainer": "", "name": "another-dataset", "metadata_modified": "2015-08-10T15:19:02.367921", "author": "", "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT Titel\\"}", "private": false, "maintainer_email": "", "author_email": "", "state": "active", "version": "", "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": "notspecified", "revision_id": "034e0c51-e4d3-4257-927a-61abbb6c43e9", "type": "dataset", "id": "3f55cc41-c276-4194-a84e-be191ca0b8ae"}}
afe4a5a8-044b-4fa6-b2a9-56d8b47f608a	6f805463-33bb-4784-9877-402166072770	ed1f28e7-f4a8-4f35-9e50-a28ff61d65e7	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "3f55cc41-c276-4194-a84e-be191ca0b8ae", "webstore_last_updated": null, "id": "ed1f28e7-f4a8-4f35-9e50-a28ff61d65e7", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": "", "created": "2015-08-10T15:13:02.883928", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {}, "position": 0, "revision_id": "0d8de502-ef87-40fd-af6e-de746cdbc562", "resource_type": null}}
40f0c95e-db26-4ea0-9329-775f36991741	23b0641f-7588-4fdc-914e-06cc4089abcc	5775273f-f375-461b-8c9d-fa9f172ec2c4	Package	deleted	{"package": {"owner_org": null, "maintainer": null, "name": "asdasd", "metadata_modified": "2015-08-11T14:35:16.575730", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "4dcca1c7-d6f4-4abe-b931-1108792c506a", "type": "dataset", "id": "5775273f-f375-461b-8c9d-fa9f172ec2c4"}}
00194dbf-f182-4243-8974-d84eea524926	23b0641f-7588-4fdc-914e-06cc4089abcc	6c6519a5-2d14-400d-b87a-78ed97d6c90c	PackageExtra	deleted	{"package_extra": {"state": "active", "value": "", "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "key": "relation", "revision_id": "bc1de2d7-2ef1-4774-a6de-fd26615c1ad6", "id": "6c6519a5-2d14-400d-b87a-78ed97d6c90c"}}
12523910-e9ac-4fcd-9746-123c503af428	23b0641f-7588-4fdc-914e-06cc4089abcc	38726c98-728a-40e1-a688-a612480fa5a7	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "5775273f-f375-461b-8c9d-fa9f172ec2c4", "webstore_last_updated": null, "id": "38726c98-728a-40e1-a688-a612480fa5a7", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-11T14:35:16.271203", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"fr\\", \\"it\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "identifier": ""}, "position": 0, "revision_id": "4dcca1c7-d6f4-4abe-b931-1108792c506a", "resource_type": null}}
07cf681d-485c-4068-a88e-f3c3305bf9fb	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	f79c6f4a-11ca-412c-8f36-506d3b55007f	Package	new	{"package": {"owner_org": null, "maintainer": null, "name": "test", "metadata_modified": "2015-08-12T08:14:20.732915", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "type": "dataset", "id": "f79c6f4a-11ca-412c-8f36-506d3b55007f"}}
417ae214-62e7-495c-acc1-a50614e6f53c	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	a22ae412-900a-4501-a116-5945d84d6c74	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "temporal", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "a22ae412-900a-4501-a116-5945d84d6c74"}}
b1df8680-0c6b-40d4-b07f-327bbd41c096	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	50e39512-9dd7-41a5-a8e5-6f312af14e74	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "contactPoint", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "50e39512-9dd7-41a5-a8e5-6f312af14e74"}}
89f5fdc3-167a-4786-b6a2-4f24660643c2	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	559c7ab5-569f-4411-b8ce-883f4eff4b3e	PackageExtra	new	{"package_extra": {"state": "active", "value": "[\\"fr\\", \\"it\\"]", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "language", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "559c7ab5-569f-4411-b8ce-883f4eff4b3e"}}
8833aa81-dc58-4694-9f1d-f78a2bad43c4	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	65c99cb9-d08f-4a52-840c-e043f3a0132b	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "identifier", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "65c99cb9-d08f-4a52-840c-e043f3a0132b"}}
987e808e-224e-4e91-8c0b-0aa65eac81f3	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	37f69a0e-672f-4887-9b61-52d195a031cc	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "coverage", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "37f69a0e-672f-4887-9b61-52d195a031cc"}}
d74dc27a-8687-4140-9259-f4bc0c8aab0f	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	6de7fd6a-c460-41a6-af03-a12ff5590422	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "relation", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "6de7fd6a-c460-41a6-af03-a12ff5590422"}}
96e5bcbc-c301-4ed4-bc2f-a31b5fd3bab6	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	631bd665-ea88-4f53-8c03-e6c6b6f7cc87	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "accrual_periodicity", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "631bd665-ea88-4f53-8c03-e6c6b6f7cc87"}}
09ab7c27-77f0-4320-ae26-29aa774f9b37	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	236eebf7-8d34-4d9a-b1d5-25ed687c0288	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "see_also", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "236eebf7-8d34-4d9a-b1d5-25ed687c0288"}}
b224051c-b839-47b3-8d08-a84c91fccde2	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	ef57c92c-2144-4e4d-a50b-4e06a89fbb99	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "spatial", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "ef57c92c-2144-4e4d-a50b-4e06a89fbb99"}}
3ed07cf2-b5d1-4d18-976b-7831b9e15d1a	3dfb4d4b-cf6f-475d-a0f6-263bc7e5f7ed	f79c6f4a-11ca-412c-8f36-506d3b55007f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "test", "metadata_modified": "2015-08-12T08:14:20.732915", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "type": "dataset", "id": "f79c6f4a-11ca-412c-8f36-506d3b55007f"}}
88cd6318-b04c-4154-ac87-64fb1ea61cae	e86e02a5-094d-4655-b6a8-ea450df05d8d	f3804e44-433a-4fb3-aa02-24df60377e82	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "webstore_last_updated": null, "id": "f3804e44-433a-4fb3-aa02-24df60377e82", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-12T08:14:30.741102", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"license": "", "language": "[]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "identifier": ""}, "position": 0, "revision_id": "17d59392-22a8-4707-83ff-43f3614ea67d", "resource_type": null}}
631a6190-0a32-4b20-a449-14a7a19b2253	7a6a2010-a301-4462-b642-c0d43291d4d6	f3804e44-433a-4fb3-aa02-24df60377e82	Resource	changed	{"resource": {"cache_last_updated": null, "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "webstore_last_updated": null, "id": "f3804e44-433a-4fb3-aa02-24df60377e82", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-12T08:14:30.741102", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "identifier": ""}, "position": 0, "revision_id": "cfa83e51-0b41-426c-b00f-2ae01f43c8cc", "resource_type": null}}
69671f34-792f-475d-82e6-5e676f9b187f	7a6a2010-a301-4462-b642-c0d43291d4d6	f79c6f4a-11ca-412c-8f36-506d3b55007f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "test", "metadata_modified": "2015-08-12T08:14:30.947203", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "cfa83e51-0b41-426c-b00f-2ae01f43c8cc", "type": "dataset", "id": "f79c6f4a-11ca-412c-8f36-506d3b55007f"}}
590f1239-601a-4542-b3a2-1e935343b5d1	d8b2a79f-8c76-49be-bf4e-86b21ffccf85	f79c6f4a-11ca-412c-8f36-506d3b55007f	Package	deleted	{"package": {"owner_org": null, "maintainer": null, "name": "test", "metadata_modified": "2015-08-12T08:14:30.947203", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"EN Titel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "cfa83e51-0b41-426c-b00f-2ae01f43c8cc", "type": "dataset", "id": "f79c6f4a-11ca-412c-8f36-506d3b55007f"}}
6652575e-8a20-404c-bb90-af20ebc4f97a	d8b2a79f-8c76-49be-bf4e-86b21ffccf85	236eebf7-8d34-4d9a-b1d5-25ed687c0288	PackageExtra	deleted	{"package_extra": {"state": "active", "value": "", "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "key": "see_also", "revision_id": "3b1b9d94-e0cd-4a2d-a011-e488a9c707e3", "id": "236eebf7-8d34-4d9a-b1d5-25ed687c0288"}}
ebbe0c42-d1d4-4ebf-b753-6b200c5e27e7	d8b2a79f-8c76-49be-bf4e-86b21ffccf85	f3804e44-433a-4fb3-aa02-24df60377e82	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "f79c6f4a-11ca-412c-8f36-506d3b55007f", "webstore_last_updated": null, "id": "f3804e44-433a-4fb3-aa02-24df60377e82", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-12T08:14:30.741102", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "identifier": ""}, "position": 0, "revision_id": "cfa83e51-0b41-426c-b00f-2ae01f43c8cc", "resource_type": null}}
24561ab0-f3a3-4b74-9398-895b51b01e01	01625b0b-785b-4ae0-847d-82ecd9865506	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	new	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T09:22:36.096041", "author": null, "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
c7d4ba91-0cf8-4760-a3a8-7be9753a5d43	01625b0b-785b-4ae0-847d-82ecd9865506	516c6d39-cac4-45ac-be78-6f2bc1254893	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "relation", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "516c6d39-cac4-45ac-be78-6f2bc1254893"}}
395cecb6-3299-447f-b7a8-0d3b7c4010b1	01625b0b-785b-4ae0-847d-82ecd9865506	f0cf908b-782c-4acf-aba6-439f06157431	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "temporal", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "f0cf908b-782c-4acf-aba6-439f06157431"}}
78a9e6a9-9aa8-4d2a-9e5f-83188891fbdc	01625b0b-785b-4ae0-847d-82ecd9865506	94fdfdff-779e-46fe-aa16-2a6d26427a60	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "identifier", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "94fdfdff-779e-46fe-aa16-2a6d26427a60"}}
31099d48-00e2-4589-abd3-b4e02646da1d	01625b0b-785b-4ae0-847d-82ecd9865506	611ca14f-c0c7-4363-97f8-3bacbdb23804	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "spatial", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "611ca14f-c0c7-4363-97f8-3bacbdb23804"}}
f22f8973-65e4-48c0-9ebb-08b6f5435d21	01625b0b-785b-4ae0-847d-82ecd9865506	4211f443-1ecf-4a80-85d3-91cffdd595cc	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "contactPoint", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "4211f443-1ecf-4a80-85d3-91cffdd595cc"}}
ddc698a7-29be-43c3-824d-ded744037520	01625b0b-785b-4ae0-847d-82ecd9865506	883675c7-6762-46f5-be8f-5270a5e218d0	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "accrual_periodicity", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "883675c7-6762-46f5-be8f-5270a5e218d0"}}
7745a10c-d9e6-49c5-b692-043fea883e6f	01625b0b-785b-4ae0-847d-82ecd9865506	932aa0a1-abd0-45c1-ae74-f0b26a1b8df2	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "see_also", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "932aa0a1-abd0-45c1-ae74-f0b26a1b8df2"}}
1d2de81d-091f-4ddf-b865-77eee445118a	01625b0b-785b-4ae0-847d-82ecd9865506	8cd2e088-de86-43cd-856c-f52bd1ee6936	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "coverage", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "8cd2e088-de86-43cd-856c-f52bd1ee6936"}}
2a3cc6d3-f27a-47cb-91c7-fea767f2b0e2	01625b0b-785b-4ae0-847d-82ecd9865506	f8539580-c1b4-44bc-9c0f-50d605699fda	PackageExtra	new	{"package_extra": {"state": "active", "value": "[\\"fr\\", \\"it\\"]", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "language", "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "id": "f8539580-c1b4-44bc-9c0f-50d605699fda"}}
20cd8b22-365a-446f-8dbd-61565de9a3b7	01625b0b-785b-4ae0-847d-82ecd9865506	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T09:22:36.096041", "author": null, "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "draft", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "c9c9320d-96bf-4808-b0d4-079c5e30d3d8", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
e18f8323-d509-4128-8f94-134e14a624b3	ec46057e-b45c-4826-a2ea-3734526fde30	58c608a0-3a3f-4683-9940-3b7be7e9cbca	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "webstore_last_updated": null, "id": "58c608a0-3a3f-4683-9940-3b7be7e9cbca", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-12T09:22:53.809864", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}, "position": 0, "revision_id": "9333eb3d-8838-4b51-b2dd-2def530567ed", "resource_type": null}}
4f5c032c-0093-4469-9923-5f05cb78863d	b540c1cc-4579-4073-a1ab-65f6a3f3847a	58c608a0-3a3f-4683-9940-3b7be7e9cbca	Resource	changed	{"resource": {"cache_last_updated": null, "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "webstore_last_updated": null, "id": "58c608a0-3a3f-4683-9940-3b7be7e9cbca", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-12T09:22:53.809864", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"en\\"]", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "identifier": ""}, "position": 0, "revision_id": "2d53b455-1dd7-49a2-a1f3-1a48f63313b7", "resource_type": null}}
d4987c34-f060-41de-8eb4-cab6f21203f6	b540c1cc-4579-4073-a1ab-65f6a3f3847a	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T09:22:53.990991", "author": null, "url": "", "notes": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "2d53b455-1dd7-49a2-a1f3-1a48f63313b7", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
3a494a4a-5abf-4137-81f6-95a5a70917c8	9239f003-b125-411b-b52b-0e670159fd95	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T11:09:10.353256", "author": null, "url": "", "notes": "test", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "904df174-cd96-40e5-93d6-8c091d0ba4e1", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
172ac5a2-5d4b-4648-8cf2-9ddbfd45ae95	a4aafce5-ddd2-4a6e-8dfc-62a2d26e68c1	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T11:13:24.687232", "author": null, "url": "", "notes": "{\\"fr\\": \\"desc fr\\", \\"de\\": \\"desc de\\", \\"en\\": \\"desc en\\", \\"it\\": \\"desc it\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "53691f78-c5c1-429a-9630-150c51e1e0bb", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
1a85c671-a0d8-494b-b725-8e2c365d490c	9b864057-7f72-49bf-980b-d08d257621ea	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T11:20:54.116227", "author": null, "url": "", "notes": "test", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "3fd9832b-cf52-43da-9bb0-012dc32b9dad", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
def07568-eaa6-4cdc-b44b-dedd78e69d33	5317b81d-96b8-4be1-8f97-e371db1a50ed	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-12T11:22:50.942083", "author": null, "url": "", "notes": "{\\"fr\\": \\"asdf\\", \\"de\\": \\"dsaf\\", \\"en\\": \\"adsf\\", \\"it\\": \\"asdf\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "7fe6c6c7-20f8-4eca-bfaf-6ecc9e9fdd9a", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
547f8d11-b97c-4a42-9cb4-5ab4f9959ff6	97b2f1b4-3940-49b6-b125-69083f791578	ca08e35c-e598-4deb-b914-74d571e1c6f1	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "contact_point", "revision_id": "c01baaba-0847-435a-9715-8cf8e8427b3e", "id": "ca08e35c-e598-4deb-b914-74d571e1c6f1"}}
512d1b1c-e0b1-47af-86c2-eb46f2a091c7	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	90808ccf-49bf-4b7e-927e-0840e473ebb6	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "temporal", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "90808ccf-49bf-4b7e-927e-0840e473ebb6"}}
947c4108-4fe2-44d6-8764-60dceeb86082	97b2f1b4-3940-49b6-b125-69083f791578	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:16:12.959454", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR Desc\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"EN Desc\\", \\"it\\": \\"IT Desc\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "c01baaba-0847-435a-9715-8cf8e8427b3e", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
7f3544b5-8244-498f-b3fa-aac33341a924	97b2f1b4-3940-49b6-b125-69083f791578	4211f443-1ecf-4a80-85d3-91cffdd595cc	PackageExtra	deleted	{"package_extra": {"state": "deleted", "value": "", "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "key": "contactPoint", "revision_id": "c01baaba-0847-435a-9715-8cf8e8427b3e", "id": "4211f443-1ecf-4a80-85d3-91cffdd595cc"}}
368a1343-148d-4026-b903-e9fd71c64888	3bfd5a0c-a8b0-4591-ab1e-2be031e494f0	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:16:58.777409", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR Desc\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"EN Desc\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "59920b5b-6904-4eb3-8f70-bbbb3042b926", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
e94806f2-508b-4a7b-b440-89a6bcf76256	70cbe48a-0aae-4c79-b288-6232cc7994a8	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:17:10.079163", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"EN Desc\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "4d7362a1-0e0a-4dbb-b57c-9ef3ff590c67", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
a9569dbe-0969-4325-a37c-d1fa1f6def25	70ff0056-a8a0-4aa9-aee2-da6635cb0d1f	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:17:19.250502", "author": null, "url": "", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "2d56c229-2777-4e7f-8cd7-c609044b0325", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
c55d62f0-5df9-4e64-b08d-56ed56320f44	9d31a0ff-63d5-4eba-a71a-d2c46da113d6	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:17:34.987761", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "6a3fc0c5-23a4-433f-b6db-a47ad4aa3c33", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
affb27ee-ba75-49a4-b200-4ac31301c94c	306f106e-83bf-4c4c-9bb7-25fcd9a88fe8	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:18:07.175740", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"DE Desc\\", \\"en\\": \\"\\", \\"it\\": \\"IT DESC\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "853b5bc9-2930-45cf-bc6c-8b28d2cd5bf3", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
481ea9dc-7ef2-4f7a-90d6-9f7ed7149767	3044f87b-b2da-4ecc-bc2c-696ced6c0877	ed7bad34-9a0c-47b3-98d8-54516214943f	Package	changed	{"package": {"owner_org": null, "maintainer": null, "name": "multi-test", "metadata_modified": "2015-08-21T07:18:20.364959", "author": null, "url": "", "notes": "{\\"fr\\": \\"FR desc\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"IT DESC\\"}", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "431dbd5e-493d-472c-afc0-bd1bd2a6b30f", "type": "dataset", "id": "ed7bad34-9a0c-47b3-98d8-54516214943f"}}
bf7a3069-a4d5-44d8-94e4-26c23c33df5c	599f9c8c-2491-4e35-b496-42688e8a4c16	58c608a0-3a3f-4683-9940-3b7be7e9cbca	Resource	changed	{"resource": {"cache_last_updated": null, "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "webstore_last_updated": null, "id": "58c608a0-3a3f-4683-9940-3b7be7e9cbca", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-12T09:22:53.809864", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}, "position": 0, "revision_id": "a21f8bec-50a0-44d0-825b-1cd42b0b2a7c", "resource_type": null}}
3586033e-2571-490b-b895-ad3844170838	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	0188770f-7558-46c1-9364-09fa7336a7a4	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "relation", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "0188770f-7558-46c1-9364-09fa7336a7a4"}}
449f47c1-4842-4955-aeb0-118b205354e8	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	PackageExtra	new	{"package_extra": {"state": "active", "value": "2013-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "issued", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "de0bfcea-126a-4a5b-bdc2-2f2a822f9861"}}
f2590ca9-916d-460b-944b-9544ed70a20c	930fd75c-5d86-4a35-8a08-7e561096a2fb	58c608a0-3a3f-4683-9940-3b7be7e9cbca	Resource	changed	{"resource": {"cache_last_updated": null, "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "webstore_last_updated": null, "id": "58c608a0-3a3f-4683-9940-3b7be7e9cbca", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-12T09:22:53.809864", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"FR Besch\\", \\"de\\": \\"DE Besch\\", \\"en\\": \\"EN Besch\\", \\"it\\": \\"IT Besch\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}, "position": 0, "revision_id": "83a99d84-26af-4adb-8d7e-aa1683c852f5", "resource_type": null}}
13ad8d7c-6de5-4844-b962-e73c6e307ca6	2283d4a4-f7d6-4115-bce0-6c4bc436c89c	58c608a0-3a3f-4683-9940-3b7be7e9cbca	Resource	changed	{"resource": {"cache_last_updated": null, "package_id": "ed7bad34-9a0c-47b3-98d8-54516214943f", "webstore_last_updated": null, "id": "58c608a0-3a3f-4683-9940-3b7be7e9cbca", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "XML", "mimetype_inner": null, "url_type": "", "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-12T09:22:53.809864", "url": "http://ihsn.org/download/testddi.xml", "webstore_url": null, "extras": {"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}, "position": 0, "revision_id": "e03a6adf-1273-4736-a3d8-22f6c6e5e34e", "resource_type": null}}
67cf5667-852e-4884-9e43-fad63973595e	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	Package	new	{"package": {"owner_org": "992a18c5-7cc2-4a74-89c3-7754326b374e", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-08-21T14:35:44.179892", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "type": "dataset", "id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048"}}
4e28876a-d77a-4323-82ce-140dd41467c2	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	b29e94ac-0620-4aeb-b296-4efd56eed251	PackageExtra	new	{"package_extra": {"state": "active", "value": "[\\"de\\", \\"en\\"]", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "language", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "b29e94ac-0620-4aeb-b296-4efd56eed251"}}
bdd3d212-e4ea-4f0e-936b-100f49946ebf	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	4cc94f21-f1ea-45ea-a30d-0ce34d717046	PackageExtra	new	{"package_extra": {"state": "active", "value": "325@swisstopo", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "identifier", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "4cc94f21-f1ea-45ea-a30d-0ce34d717046"}}
ed1efd58-e856-47a9-b53e-fb4eebebda68	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	2c85b0cf-9475-4734-a46f-a336d134ddb2	PackageExtra	new	{"package_extra": {"state": "active", "value": "2015-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "modified", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "2c85b0cf-9475-4734-a46f-a336d134ddb2"}}
1ed882d8-8e53-4a9c-99a8-851664786747	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	2142f0f2-285c-4a05-8764-406f50b64910	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "coverage", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "2142f0f2-285c-4a05-8764-406f50b64910"}}
6ad02711-0b5e-4cc7-b6c1-72fbf61e3f9e	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	8f0f9558-2e2c-48f3-b6fe-7b6f798f49cb	tag	added	{"tag": {"vocabulary_id": null, "id": "52b08844-1509-442b-8157-846895203abf", "name": "Eisenbahn"}, "package": {"owner_org": "992a18c5-7cc2-4a74-89c3-7754326b374e", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-08-21T14:35:44.179892", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "type": "dataset", "id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048"}}
abc9f67c-7df3-4639-94ed-72b4009ce240	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	26ea6f9b-fa1c-4ad6-a238-3a3c89877573	tag	added	{"tag": {"vocabulary_id": null, "id": "ab30f671-5252-4890-a3b8-051ed1407d7a", "name": "Nacht"}, "package": {"owner_org": "992a18c5-7cc2-4a74-89c3-7754326b374e", "maintainer": null, "name": "railway-noise-night", "metadata_modified": "2015-08-21T14:35:44.179892", "author": null, "url": "http://www.bafu.admin.ch/laerm/index.html?lang=de", "notes": "{\\"fr\\": \\"La carte montre que la pollution sonore est suspendu par le syst\\\\u00e8me de rail, la population.\\", \\"de\\": \\"Die Karte zeigt, welcher L\\\\u00e4rmbelastung die Bev\\\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.\\", \\"en\\": \\"The map shows how the population is exposed by the noise pollution of the rail system.\\", \\"it\\": \\"La mappa mostra che l\\\\\\\\'inquinamento acustico \\\\u00e8 sospeso dal sistema ferroviario, la popolazione.\\"}", "title": "{\\"fr\\": \\"Bruit ferroviaire nuit\\", \\"de\\": \\"Eisenbahnl\\\\u00e4rm Nacht\\", \\"en\\": \\"Railway noise night\\", \\"it\\": \\"Rumore ferroviario notte\\"}", "private": false, "maintainer_email": null, "author_email": null, "state": "active", "version": null, "creator_user_id": "6bc6e65b-e9f8-45b1-9814-ecef009acd9f", "license_id": null, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "type": "dataset", "id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048"}}
15f6d185-b5ea-48cf-af58-21a2bf15b96d	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	776d6489-a8a2-4d6b-95e9-ff06adc377a1	PackageExtra	new	{"package_extra": {"state": "active", "value": "http://purl.org/cld/freq/daily", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "accrual_periodicity", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "776d6489-a8a2-4d6b-95e9-ff06adc377a1"}}
a425cb81-bf56-40d0-8455-d2800fc5e0f4	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	7bb4233f-e7c2-40b8-86d2-1950ca73fe82	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "see_also", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "7bb4233f-e7c2-40b8-86d2-1950ca73fe82"}}
5f425fcb-a738-4b85-8935-0c0884f3141f	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	b1dc908d-e1ea-496b-b00e-1275aced7bca	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "b1dc908d-e1ea-496b-b00e-1275aced7bca", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-21T14:35:44.199827", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "resource_type": null}}
905e4b32-8702-41e8-8dc7-2f3f9da7a1c0	5f5233a6-0b1e-4c3e-8d9a-52f38c3047ee	58c31a58-0255-41d1-aa9f-26bfe7be6e73	PackageExtra	new	{"package_extra": {"state": "active", "value": "", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "spatial", "revision_id": "d1bc4cb5-c544-40b3-82d9-d5b02536f69e", "id": "58c31a58-0255-41d1-aa9f-26bfe7be6e73"}}
7622c89e-eb95-45b8-b67f-a70684708bb4	f4dcee2d-2aed-40b1-86d2-7c56eece12e1	b70af581-d92e-46a2-a077-3d5bf54ef385	PackageExtra	new	{"package_extra": {"state": "active", "value": "[]", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "publishers", "revision_id": "6a2d0695-98b9-40dc-99cf-c13d8a36cbdd", "id": "b70af581-d92e-46a2-a077-3d5bf54ef385"}}
bf05eb92-67b8-4161-8103-6d06f11ac545	f4dcee2d-2aed-40b1-86d2-7c56eece12e1	03bd1aab-0b96-4933-a616-af76dc6715c1	PackageExtra	new	{"package_extra": {"state": "active", "value": "[]", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "contact_points", "revision_id": "6a2d0695-98b9-40dc-99cf-c13d8a36cbdd", "id": "03bd1aab-0b96-4933-a616-af76dc6715c1"}}
75f868bc-adbb-4fa2-b10c-29041febd214	f4dcee2d-2aed-40b1-86d2-7c56eece12e1	e35a3b4b-abb9-4f6d-b901-eba066b2ab7f	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "e35a3b4b-abb9-4f6d-b901-eba066b2ab7f", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-21T15:13:30.397146", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "6a2d0695-98b9-40dc-99cf-c13d8a36cbdd", "resource_type": null}}
b2f86b1f-c197-4b0f-a894-b23218501140	f4dcee2d-2aed-40b1-86d2-7c56eece12e1	b1dc908d-e1ea-496b-b00e-1275aced7bca	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "b1dc908d-e1ea-496b-b00e-1275aced7bca", "size": null, "state": "deleted", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-21T14:35:44.199827", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "6a2d0695-98b9-40dc-99cf-c13d8a36cbdd", "resource_type": null}}
02c81d2f-8b4d-4463-a7ca-18e1b49a1bb4	f4dcee2d-2aed-40b1-86d2-7c56eece12e1	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2013-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "issued", "revision_id": "6a2d0695-98b9-40dc-99cf-c13d8a36cbdd", "id": "de0bfcea-126a-4a5b-bdc2-2f2a822f9861"}}
9e871cb5-26da-4a2b-8b0c-83af7c799a9b	f4dcee2d-2aed-40b1-86d2-7c56eece12e1	2c85b0cf-9475-4734-a46f-a336d134ddb2	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2015-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "modified", "revision_id": "6a2d0695-98b9-40dc-99cf-c13d8a36cbdd", "id": "2c85b0cf-9475-4734-a46f-a336d134ddb2"}}
6862525e-eeb8-483d-bf08-e7f9ede5b008	bd03e384-cf1c-45cb-a114-4c0fa12f056c	b70af581-d92e-46a2-a077-3d5bf54ef385	PackageExtra	changed	{"package_extra": {"state": "active", "value": "[{\\"termdat_reference\\": \\"Verweis auf TERMDAT-Eintrag\\", \\"label\\": \\"Bundesamt f\\\\u00fcr Landestopografie swisstopo\\"}, {\\"termdat_reference\\": \\"\\", \\"label\\": \\"Weiterer Publisher\\"}]", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "publishers", "revision_id": "6e29c5fb-37b2-4f85-a2d7-5e9934be829f", "id": "b70af581-d92e-46a2-a077-3d5bf54ef385"}}
9b9e186b-910b-46c5-b104-bcc786096082	506618e7-fb92-46f1-9863-9c0e79147396	cea50e5e-9227-4fee-b98d-9c433dea84a7	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "cea50e5e-9227-4fee-b98d-9c433dea84a7", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-21T15:18:56.336492", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "c9bba04e-9529-4546-903b-67d6dbfb51ac", "resource_type": null}}
f92601b4-8e49-4219-a01e-63ec7a746dfc	506618e7-fb92-46f1-9863-9c0e79147396	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2013-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "issued", "revision_id": "c9bba04e-9529-4546-903b-67d6dbfb51ac", "id": "de0bfcea-126a-4a5b-bdc2-2f2a822f9861"}}
672cdd26-0b35-45c0-bb56-7cd5b56aac40	506618e7-fb92-46f1-9863-9c0e79147396	e35a3b4b-abb9-4f6d-b901-eba066b2ab7f	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "e35a3b4b-abb9-4f6d-b901-eba066b2ab7f", "size": null, "state": "deleted", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-21T15:13:30.397146", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "c9bba04e-9529-4546-903b-67d6dbfb51ac", "resource_type": null}}
e1178648-105b-43c5-b16c-80c55c214087	506618e7-fb92-46f1-9863-9c0e79147396	2c85b0cf-9475-4734-a46f-a336d134ddb2	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2015-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "modified", "revision_id": "c9bba04e-9529-4546-903b-67d6dbfb51ac", "id": "2c85b0cf-9475-4734-a46f-a336d134ddb2"}}
163667ba-080c-41b1-a5fd-0f25a12c624f	bd03e384-cf1c-45cb-a114-4c0fa12f056c	f7e21bc5-3e82-487b-aefc-5f4a6c5947e5	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "f7e21bc5-3e82-487b-aefc-5f4a6c5947e5", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-21T16:11:03.260087", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "6e29c5fb-37b2-4f85-a2d7-5e9934be829f", "resource_type": null}}
fca1d773-3fa6-410f-8331-ae2fd7a926e2	bd03e384-cf1c-45cb-a114-4c0fa12f056c	cea50e5e-9227-4fee-b98d-9c433dea84a7	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "cea50e5e-9227-4fee-b98d-9c433dea84a7", "size": null, "state": "deleted", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-21T15:18:56.336492", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "6e29c5fb-37b2-4f85-a2d7-5e9934be829f", "resource_type": null}}
8ca9b4f2-b7f7-4a38-a410-bdd35f064528	bd03e384-cf1c-45cb-a114-4c0fa12f056c	2c85b0cf-9475-4734-a46f-a336d134ddb2	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2015-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "modified", "revision_id": "6e29c5fb-37b2-4f85-a2d7-5e9934be829f", "id": "2c85b0cf-9475-4734-a46f-a336d134ddb2"}}
276fd0fe-587f-44b4-b1ed-3890b37f6ac8	bd03e384-cf1c-45cb-a114-4c0fa12f056c	03bd1aab-0b96-4933-a616-af76dc6715c1	PackageExtra	changed	{"package_extra": {"state": "active", "value": "[{\\"email\\": \\"noise@bafu.admin.ch\\", \\"name\\": \\"Abteilung L\\\\u00e4rm BAFU\\"}, {\\"email\\": \\"sekretariat@bafu.admin.ch\\", \\"name\\": \\"Sekretariat BAFU\\"}]", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "contact_points", "revision_id": "6e29c5fb-37b2-4f85-a2d7-5e9934be829f", "id": "03bd1aab-0b96-4933-a616-af76dc6715c1"}}
ef3be59a-788e-4145-b4f3-bf978344c25d	bd03e384-cf1c-45cb-a114-4c0fa12f056c	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2013-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "issued", "revision_id": "6e29c5fb-37b2-4f85-a2d7-5e9934be829f", "id": "de0bfcea-126a-4a5b-bdc2-2f2a822f9861"}}
6f317d74-32ff-4786-b185-0d5d58bbff3b	e919c8d5-5c24-4d51-9f45-5f63528557b2	1487927d-4ce2-4b15-a98b-f2821fa9d01d	Resource	new	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "1487927d-4ce2-4b15-a98b-f2821fa9d01d", "size": null, "state": "active", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-24T07:26:54.575662", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "c30bc228-11da-4ed8-9b51-06c666b22dc8", "resource_type": null}}
05e3422d-1a7c-4fd7-a9a4-160339edaf4b	e919c8d5-5c24-4d51-9f45-5f63528557b2	f7e21bc5-3e82-487b-aefc-5f4a6c5947e5	Resource	deleted	{"resource": {"cache_last_updated": null, "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "webstore_last_updated": null, "id": "f7e21bc5-3e82-487b-aefc-5f4a6c5947e5", "size": null, "state": "deleted", "last_modified": null, "hash": "", "description": "", "format": "Database", "mimetype_inner": null, "url_type": null, "mimetype": null, "cache_url": null, "name": null, "created": "2015-08-21T16:11:03.260087", "url": "http://wms.geo.admin.ch/", "webstore_url": null, "extras": {"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}, "position": 0, "revision_id": "c30bc228-11da-4ed8-9b51-06c666b22dc8", "resource_type": null}}
7fdcef26-ff8c-4a19-ac23-5429cfc147e6	e919c8d5-5c24-4d51-9f45-5f63528557b2	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2013-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "issued", "revision_id": "c30bc228-11da-4ed8-9b51-06c666b22dc8", "id": "de0bfcea-126a-4a5b-bdc2-2f2a822f9861"}}
82d3574b-060e-422f-b3f6-fb23f170baf8	e919c8d5-5c24-4d51-9f45-5f63528557b2	2c85b0cf-9475-4734-a46f-a336d134ddb2	PackageExtra	changed	{"package_extra": {"state": "active", "value": "2015-04-26T00:00:00", "package_id": "30c153dd-6c9a-4b3c-8e69-cbf7fd121048", "key": "modified", "revision_id": "c30bc228-11da-4ed8-9b51-06c666b22dc8", "id": "2c85b0cf-9475-4734-a46f-a336d134ddb2"}}
\.


--
-- Data for Name: authorization_group; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY authorization_group (id, name, created) FROM stdin;
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
3f7479cc-ef13-4b22-ab1c-b3220bd8c75d	2015-08-07 12:35:33.808652	2015-08-07 12:35:33.80869
6bc6e65b-e9f8-45b1-9814-ecef009acd9f	2015-08-12 08:08:35.141358	2015-08-07 12:35:29.370169
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY "group" (id, name, title, description, created, state, revision_id, type, approval_status, image_url, is_organization) FROM stdin;
992a18c5-7cc2-4a74-89c3-7754326b374e	swisstopo	{"fr": "", "de": "", "en": "", "it": ""}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-21 11:21:00.258974	active	985a82de-df58-4f85-b5f4-b5415205c27e	organization	approved		t
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
992a18c5-7cc2-4a74-89c3-7754326b374e	swisstopo	{"fr": "", "de": "", "en": "", "it": ""}	{'fr': u'', 'de': u'', 'en': u'', 'it': u''}	2015-08-21 11:21:00.258974	active	985a82de-df58-4f85-b5f4-b5415205c27e	992a18c5-7cc2-4a74-89c3-7754326b374e	\N	2015-08-21 11:20:59.993618	9999-12-31 00:00:00	\N	organization	approved		t
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
a1c51a73-8738-4524-9730-09ac9a564ad0	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	992a18c5-7cc2-4a74-89c3-7754326b374e	active	952516cf-13e6-485b-833a-cabc81fbbe71	user	admin
82346b98-7019-45b5-9ced-f564d567dc64	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	992a18c5-7cc2-4a74-89c3-7754326b374e	active	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	package	organization
\.


--
-- Data for Name: member_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY member_revision (id, table_id, group_id, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current, table_name, capacity) FROM stdin;
a1c51a73-8738-4524-9730-09ac9a564ad0	6bc6e65b-e9f8-45b1-9814-ecef009acd9f	992a18c5-7cc2-4a74-89c3-7754326b374e	active	952516cf-13e6-485b-833a-cabc81fbbe71	a1c51a73-8738-4524-9730-09ac9a564ad0	\N	2015-08-21 11:21:01.039273	9999-12-31 00:00:00	\N	user	admin
82346b98-7019-45b5-9ced-f564d567dc64	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	992a18c5-7cc2-4a74-89c3-7754326b374e	active	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	82346b98-7019-45b5-9ced-f564d567dc64	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N	package	organization
\.


--
-- Data for Name: migrate_version; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY migrate_version (repository_id, repository_path, version) FROM stdin;
Ckan	/var/www/ckan/ckan/migration	78
\.


--
-- Data for Name: package; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package (id, name, title, version, url, notes, license_id, revision_id, author, author_email, maintainer, maintainer_email, state, type, owner_org, private, metadata_modified, creator_user_id) FROM stdin;
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "FR desc", "de": "", "en": "", "it": "IT DESC"}	\N	431dbd5e-493d-472c-afc0-bd1bd2a6b30f	\N	\N	\N	\N	active	dataset	\N	f	2015-08-21 08:11:04.53322	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
30c153dd-6c9a-4b3c-8e69-cbf7fd121048	railway-noise-night	{"fr": "Bruit ferroviaire nuit", "de": "Eisenbahnl\\u00e4rm Nacht", "en": "Railway noise night", "it": "Rumore ferroviario notte"}	\N	http://www.bafu.admin.ch/laerm/index.html?lang=de	{"fr": "La carte montre que la pollution sonore est suspendu par le syst\\u00e8me de rail, la population.", "de": "Die Karte zeigt, welcher L\\u00e4rmbelastung die Bev\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.", "en": "The map shows how the population is exposed by the noise pollution of the rail system.", "it": "La mappa mostra che l\\\\'inquinamento acustico \\u00e8 sospeso dal sistema ferroviario, la popolazione."}	\N	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	\N	\N	\N	\N	active	dataset	992a18c5-7cc2-4a74-89c3-7754326b374e	f	2015-08-24 07:26:54.503585	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
\.


--
-- Data for Name: package_extra; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_extra (id, package_id, key, value, revision_id, state) FROM stdin;
f8539580-c1b4-44bc-9c0f-50d605699fda	ed7bad34-9a0c-47b3-98d8-54516214943f	language	["fr", "it"]	c9c9320d-96bf-4808-b0d4-079c5e30d3d8	active
883675c7-6762-46f5-be8f-5270a5e218d0	ed7bad34-9a0c-47b3-98d8-54516214943f	accrual_periodicity		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	active
932aa0a1-abd0-45c1-ae74-f0b26a1b8df2	ed7bad34-9a0c-47b3-98d8-54516214943f	see_also		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	active
f0cf908b-782c-4acf-aba6-439f06157431	ed7bad34-9a0c-47b3-98d8-54516214943f	temporal		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	active
516c6d39-cac4-45ac-be78-6f2bc1254893	ed7bad34-9a0c-47b3-98d8-54516214943f	relation		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	active
8cd2e088-de86-43cd-856c-f52bd1ee6936	ed7bad34-9a0c-47b3-98d8-54516214943f	coverage		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	active
611ca14f-c0c7-4363-97f8-3bacbdb23804	ed7bad34-9a0c-47b3-98d8-54516214943f	spatial		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	active
94fdfdff-779e-46fe-aa16-2a6d26427a60	ed7bad34-9a0c-47b3-98d8-54516214943f	identifier		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	active
4211f443-1ecf-4a80-85d3-91cffdd595cc	ed7bad34-9a0c-47b3-98d8-54516214943f	contactPoint		c01baaba-0847-435a-9715-8cf8e8427b3e	deleted
ca08e35c-e598-4deb-b914-74d571e1c6f1	ed7bad34-9a0c-47b3-98d8-54516214943f	contact_point		c01baaba-0847-435a-9715-8cf8e8427b3e	active
b29e94ac-0620-4aeb-b296-4efd56eed251	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	language	["de", "en"]	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
776d6489-a8a2-4d6b-95e9-ff06adc377a1	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	accrual_periodicity	http://purl.org/cld/freq/daily	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
90808ccf-49bf-4b7e-927e-0840e473ebb6	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	temporal		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
0188770f-7558-46c1-9364-09fa7336a7a4	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	relation		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
2142f0f2-285c-4a05-8764-406f50b64910	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	coverage		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
58c31a58-0255-41d1-aa9f-26bfe7be6e73	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	spatial		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
7bb4233f-e7c2-40b8-86d2-1950ca73fe82	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	see_also		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
4cc94f21-f1ea-45ea-a30d-0ce34d717046	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	identifier	325@swisstopo	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
03bd1aab-0b96-4933-a616-af76dc6715c1	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	contact_points	[{"email": "noise@bafu.admin.ch", "name": "Abteilung L\\u00e4rm BAFU"}, {"email": "sekretariat@bafu.admin.ch", "name": "Sekretariat BAFU"}]	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	active
b70af581-d92e-46a2-a077-3d5bf54ef385	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	publishers	[{"termdat_reference": "Verweis auf TERMDAT-Eintrag", "label": "Bundesamt f\\u00fcr Landestopografie swisstopo"}, {"termdat_reference": "", "label": "Weiterer Publisher"}]	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	active
2c85b0cf-9475-4734-a46f-a336d134ddb2	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	modified	2015-04-26 00:00:00	c30bc228-11da-4ed8-9b51-06c666b22dc8	active
de0bfcea-126a-4a5b-bdc2-2f2a822f9861	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	issued	2013-04-26 00:00:00	c30bc228-11da-4ed8-9b51-06c666b22dc8	active
\.


--
-- Data for Name: package_extra_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_extra_revision (id, package_id, key, value, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
de0bfcea-126a-4a5b-bdc2-2f2a822f9861	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	issued	2013-04-26 00:00:00	c30bc228-11da-4ed8-9b51-06c666b22dc8	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	active	\N	2015-08-24 07:26:54.491492	9999-12-31 00:00:00	\N
2c85b0cf-9475-4734-a46f-a336d134ddb2	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	modified	2015-04-26 00:00:00	c30bc228-11da-4ed8-9b51-06c666b22dc8	2c85b0cf-9475-4734-a46f-a336d134ddb2	active	\N	2015-08-24 07:26:54.491492	9999-12-31 00:00:00	\N
94fdfdff-779e-46fe-aa16-2a6d26427a60	ed7bad34-9a0c-47b3-98d8-54516214943f	identifier		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	94fdfdff-779e-46fe-aa16-2a6d26427a60	active	\N	2015-08-12 09:22:36.056097	9999-12-31 00:00:00	\N
516c6d39-cac4-45ac-be78-6f2bc1254893	ed7bad34-9a0c-47b3-98d8-54516214943f	relation		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	516c6d39-cac4-45ac-be78-6f2bc1254893	active	\N	2015-08-12 09:22:36.056097	9999-12-31 00:00:00	\N
f0cf908b-782c-4acf-aba6-439f06157431	ed7bad34-9a0c-47b3-98d8-54516214943f	temporal		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	f0cf908b-782c-4acf-aba6-439f06157431	active	\N	2015-08-12 09:22:36.056097	9999-12-31 00:00:00	\N
8cd2e088-de86-43cd-856c-f52bd1ee6936	ed7bad34-9a0c-47b3-98d8-54516214943f	coverage		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	8cd2e088-de86-43cd-856c-f52bd1ee6936	active	\N	2015-08-12 09:22:36.056097	9999-12-31 00:00:00	\N
883675c7-6762-46f5-be8f-5270a5e218d0	ed7bad34-9a0c-47b3-98d8-54516214943f	accrual_periodicity		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	883675c7-6762-46f5-be8f-5270a5e218d0	active	\N	2015-08-12 09:22:36.056097	9999-12-31 00:00:00	\N
932aa0a1-abd0-45c1-ae74-f0b26a1b8df2	ed7bad34-9a0c-47b3-98d8-54516214943f	see_also		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	932aa0a1-abd0-45c1-ae74-f0b26a1b8df2	active	\N	2015-08-12 09:22:36.056097	9999-12-31 00:00:00	\N
f8539580-c1b4-44bc-9c0f-50d605699fda	ed7bad34-9a0c-47b3-98d8-54516214943f	language	["fr", "it"]	c9c9320d-96bf-4808-b0d4-079c5e30d3d8	f8539580-c1b4-44bc-9c0f-50d605699fda	active	\N	2015-08-12 09:22:36.056097	9999-12-31 00:00:00	\N
611ca14f-c0c7-4363-97f8-3bacbdb23804	ed7bad34-9a0c-47b3-98d8-54516214943f	spatial		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	611ca14f-c0c7-4363-97f8-3bacbdb23804	active	\N	2015-08-12 09:22:36.056097	9999-12-31 00:00:00	\N
ca08e35c-e598-4deb-b914-74d571e1c6f1	ed7bad34-9a0c-47b3-98d8-54516214943f	contact_point		c01baaba-0847-435a-9715-8cf8e8427b3e	ca08e35c-e598-4deb-b914-74d571e1c6f1	active	\N	2015-08-21 07:16:12.930014	9999-12-31 00:00:00	\N
4211f443-1ecf-4a80-85d3-91cffdd595cc	ed7bad34-9a0c-47b3-98d8-54516214943f	contactPoint		c9c9320d-96bf-4808-b0d4-079c5e30d3d8	4211f443-1ecf-4a80-85d3-91cffdd595cc	active	\N	2015-08-12 09:22:36.056097	2015-08-21 07:16:12.930014	\N
4211f443-1ecf-4a80-85d3-91cffdd595cc	ed7bad34-9a0c-47b3-98d8-54516214943f	contactPoint		c01baaba-0847-435a-9715-8cf8e8427b3e	4211f443-1ecf-4a80-85d3-91cffdd595cc	deleted	\N	2015-08-21 07:16:12.930014	9999-12-31 00:00:00	\N
4cc94f21-f1ea-45ea-a30d-0ce34d717046	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	identifier	325@swisstopo	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	4cc94f21-f1ea-45ea-a30d-0ce34d717046	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
58c31a58-0255-41d1-aa9f-26bfe7be6e73	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	spatial		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	58c31a58-0255-41d1-aa9f-26bfe7be6e73	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
776d6489-a8a2-4d6b-95e9-ff06adc377a1	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	accrual_periodicity	http://purl.org/cld/freq/daily	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	776d6489-a8a2-4d6b-95e9-ff06adc377a1	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
7bb4233f-e7c2-40b8-86d2-1950ca73fe82	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	see_also		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	7bb4233f-e7c2-40b8-86d2-1950ca73fe82	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
b29e94ac-0620-4aeb-b296-4efd56eed251	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	language	["de", "en"]	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	b29e94ac-0620-4aeb-b296-4efd56eed251	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
2142f0f2-285c-4a05-8764-406f50b64910	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	coverage		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	2142f0f2-285c-4a05-8764-406f50b64910	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
90808ccf-49bf-4b7e-927e-0840e473ebb6	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	temporal		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	90808ccf-49bf-4b7e-927e-0840e473ebb6	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
0188770f-7558-46c1-9364-09fa7336a7a4	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	relation		d1bc4cb5-c544-40b3-82d9-d5b02536f69e	0188770f-7558-46c1-9364-09fa7336a7a4	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
de0bfcea-126a-4a5b-bdc2-2f2a822f9861	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	issued	2013-04-26 00:00:00	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	active	\N	2015-08-21 14:35:44.108941	2015-08-21 15:13:30.341342	\N
2c85b0cf-9475-4734-a46f-a336d134ddb2	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	modified	2015-04-26 00:00:00	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	2c85b0cf-9475-4734-a46f-a336d134ddb2	active	\N	2015-08-21 14:35:44.108941	2015-08-21 15:13:30.341342	\N
2c85b0cf-9475-4734-a46f-a336d134ddb2	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	modified	2015-04-26 00:00:00	6a2d0695-98b9-40dc-99cf-c13d8a36cbdd	2c85b0cf-9475-4734-a46f-a336d134ddb2	active	\N	2015-08-21 15:13:30.341342	2015-08-21 15:18:56.296035	\N
de0bfcea-126a-4a5b-bdc2-2f2a822f9861	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	issued	2013-04-26 00:00:00	6a2d0695-98b9-40dc-99cf-c13d8a36cbdd	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	active	\N	2015-08-21 15:13:30.341342	2015-08-21 15:18:56.296035	\N
03bd1aab-0b96-4933-a616-af76dc6715c1	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	contact_points	[{"email": "noise@bafu.admin.ch", "name": "Abteilung L\\u00e4rm BAFU"}, {"email": "sekretariat@bafu.admin.ch", "name": "Sekretariat BAFU"}]	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	03bd1aab-0b96-4933-a616-af76dc6715c1	active	\N	2015-08-21 16:11:03.166198	9999-12-31 00:00:00	\N
03bd1aab-0b96-4933-a616-af76dc6715c1	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	contact_points	[]	6a2d0695-98b9-40dc-99cf-c13d8a36cbdd	03bd1aab-0b96-4933-a616-af76dc6715c1	active	\N	2015-08-21 15:13:30.341342	2015-08-21 16:11:03.166198	\N
2c85b0cf-9475-4734-a46f-a336d134ddb2	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	modified	2015-04-26 00:00:00	c9bba04e-9529-4546-903b-67d6dbfb51ac	2c85b0cf-9475-4734-a46f-a336d134ddb2	active	\N	2015-08-21 15:18:56.296035	2015-08-21 16:11:03.166198	\N
de0bfcea-126a-4a5b-bdc2-2f2a822f9861	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	issued	2013-04-26 00:00:00	c9bba04e-9529-4546-903b-67d6dbfb51ac	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	active	\N	2015-08-21 15:18:56.296035	2015-08-21 16:11:03.166198	\N
b70af581-d92e-46a2-a077-3d5bf54ef385	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	publishers	[{"termdat_reference": "Verweis auf TERMDAT-Eintrag", "label": "Bundesamt f\\u00fcr Landestopografie swisstopo"}, {"termdat_reference": "", "label": "Weiterer Publisher"}]	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	b70af581-d92e-46a2-a077-3d5bf54ef385	active	\N	2015-08-21 16:11:03.166198	9999-12-31 00:00:00	\N
b70af581-d92e-46a2-a077-3d5bf54ef385	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	publishers	[]	6a2d0695-98b9-40dc-99cf-c13d8a36cbdd	b70af581-d92e-46a2-a077-3d5bf54ef385	active	\N	2015-08-21 15:13:30.341342	2015-08-21 16:11:03.166198	\N
de0bfcea-126a-4a5b-bdc2-2f2a822f9861	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	issued	2013-04-26 00:00:00	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	de0bfcea-126a-4a5b-bdc2-2f2a822f9861	active	\N	2015-08-21 16:11:03.166198	2015-08-24 07:26:54.491492	\N
2c85b0cf-9475-4734-a46f-a336d134ddb2	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	modified	2015-04-26 00:00:00	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	2c85b0cf-9475-4734-a46f-a336d134ddb2	active	\N	2015-08-21 16:11:03.166198	2015-08-24 07:26:54.491492	\N
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
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N			\N	c9c9320d-96bf-4808-b0d4-079c5e30d3d8	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	draft	\N	2015-08-12 09:22:36.056097	2015-08-12 09:22:53.990137	\N	dataset	\N	f	2015-08-12 09:22:36.096041	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N			\N	2d53b455-1dd7-49a2-a1f3-1a48f63313b7	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-12 09:22:53.990137	2015-08-12 11:09:10.239183	\N	dataset	\N	f	2015-08-12 09:22:53.990991	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		test	\N	904df174-cd96-40e5-93d6-8c091d0ba4e1	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-12 11:09:10.239183	2015-08-12 11:13:24.680283	\N	dataset	\N	f	2015-08-12 11:09:10.353256	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "desc fr", "de": "desc de", "en": "desc en", "it": "desc it"}	\N	53691f78-c5c1-429a-9630-150c51e1e0bb	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-12 11:13:24.680283	2015-08-12 11:20:54.09697	\N	dataset	\N	f	2015-08-12 11:13:24.687232	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		test	\N	3fd9832b-cf52-43da-9bb0-012dc32b9dad	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-12 11:20:54.09697	2015-08-12 11:22:50.921756	\N	dataset	\N	f	2015-08-12 11:20:54.116227	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "asdf", "de": "dsaf", "en": "adsf", "it": "asdf"}	\N	7fe6c6c7-20f8-4eca-bfaf-6ecc9e9fdd9a	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-12 11:22:50.921756	2015-08-21 07:16:12.930014	\N	dataset	\N	f	2015-08-12 11:22:50.942083	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "FR Desc", "de": "DE Desc", "en": "EN Desc", "it": "IT Desc"}	\N	c01baaba-0847-435a-9715-8cf8e8427b3e	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-21 07:16:12.930014	2015-08-21 07:16:58.766513	\N	dataset	\N	f	2015-08-21 07:16:12.959454	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "FR Desc", "de": "DE Desc", "en": "EN Desc", "it": ""}	\N	59920b5b-6904-4eb3-8f70-bbbb3042b926	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-21 07:16:58.766513	2015-08-21 07:17:10.06932	\N	dataset	\N	f	2015-08-21 07:16:58.777409	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "", "de": "DE Desc", "en": "EN Desc", "it": ""}	\N	4d7362a1-0e0a-4dbb-b57c-9ef3ff590c67	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-21 07:17:10.06932	2015-08-21 07:17:19.237964	\N	dataset	\N	f	2015-08-21 07:17:10.079163	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "", "de": "DE Desc", "en": "", "it": ""}	\N	2d56c229-2777-4e7f-8cd7-c609044b0325	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-21 07:17:19.237964	2015-08-21 07:17:34.977805	\N	dataset	\N	f	2015-08-21 07:17:19.250502	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "FR desc", "de": "DE Desc", "en": "", "it": ""}	\N	6a3fc0c5-23a4-433f-b6db-a47ad4aa3c33	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-21 07:17:34.977805	2015-08-21 07:18:07.149881	\N	dataset	\N	f	2015-08-21 07:17:34.987761	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "FR desc", "de": "DE Desc", "en": "", "it": "IT DESC"}	\N	853b5bc9-2930-45cf-bc6c-8b28d2cd5bf3	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-21 07:18:07.149881	2015-08-21 07:18:20.304623	\N	dataset	\N	f	2015-08-21 07:18:07.17574	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
ed7bad34-9a0c-47b3-98d8-54516214943f	multi-test	{"fr": "FR Titel", "de": "DE Titel", "en": "En TItel", "it": "IT TItel"}	\N		{"fr": "FR desc", "de": "", "en": "", "it": "IT DESC"}	\N	431dbd5e-493d-472c-afc0-bd1bd2a6b30f	ed7bad34-9a0c-47b3-98d8-54516214943f	\N	\N	\N	\N	active	\N	2015-08-21 07:18:20.304623	9999-12-31 00:00:00	\N	dataset	\N	f	2015-08-21 07:18:20.364959	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
30c153dd-6c9a-4b3c-8e69-cbf7fd121048	railway-noise-night	{"fr": "Bruit ferroviaire nuit", "de": "Eisenbahnl\\u00e4rm Nacht", "en": "Railway noise night", "it": "Rumore ferroviario notte"}	\N	http://www.bafu.admin.ch/laerm/index.html?lang=de	{"fr": "La carte montre que la pollution sonore est suspendu par le syst\\u00e8me de rail, la population.", "de": "Die Karte zeigt, welcher L\\u00e4rmbelastung die Bev\\u00f6lkerung durch den Schienenverkehr ausgesetzt ist.", "en": "The map shows how the population is exposed by the noise pollution of the rail system.", "it": "La mappa mostra che l\\\\'inquinamento acustico \\u00e8 sospeso dal sistema ferroviario, la popolazione."}	\N	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	\N	\N	\N	\N	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N	dataset	992a18c5-7cc2-4a74-89c3-7754326b374e	f	2015-08-21 14:35:44.179892	6bc6e65b-e9f8-45b1-9814-ecef009acd9f
\.


--
-- Data for Name: package_tag; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_tag (id, package_id, tag_id, revision_id, state) FROM stdin;
8f0f9558-2e2c-48f3-b6fe-7b6f798f49cb	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	52b08844-1509-442b-8157-846895203abf	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
26ea6f9b-fa1c-4ad6-a238-3a3c89877573	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	ab30f671-5252-4890-a3b8-051ed1407d7a	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	active
\.


--
-- Data for Name: package_tag_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY package_tag_revision (id, package_id, tag_id, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
26ea6f9b-fa1c-4ad6-a238-3a3c89877573	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	ab30f671-5252-4890-a3b8-051ed1407d7a	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	26ea6f9b-fa1c-4ad6-a238-3a3c89877573	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
8f0f9558-2e2c-48f3-b6fe-7b6f798f49cb	30c153dd-6c9a-4b3c-8e69-cbf7fd121048	52b08844-1509-442b-8157-846895203abf	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	8f0f9558-2e2c-48f3-b6fe-7b6f798f49cb	active	\N	2015-08-21 14:35:44.108941	9999-12-31 00:00:00	\N
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
58c608a0-3a3f-4683-9940-3b7be7e9cbca	http://ihsn.org/download/testddi.xml	XML		0	e03a6adf-1273-4736-a3d8-22f6c6e5e34e		active	{"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-12 09:22:53.809864		ed7bad34-9a0c-47b3-98d8-54516214943f
b1dc908d-e1ea-496b-b00e-1275aced7bca	http://wms.geo.admin.ch/	Database		0	6a2d0695-98b9-40dc-99cf-c13d8a36cbdd		deleted	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 14:35:44.199827	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
e35a3b4b-abb9-4f6d-b901-eba066b2ab7f	http://wms.geo.admin.ch/	Database		0	c9bba04e-9529-4546-903b-67d6dbfb51ac		deleted	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 15:13:30.397146	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
cea50e5e-9227-4fee-b98d-9c433dea84a7	http://wms.geo.admin.ch/	Database		0	6e29c5fb-37b2-4f85-a2d7-5e9934be829f		deleted	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 15:18:56.336492	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
f7e21bc5-3e82-487b-aefc-5f4a6c5947e5	http://wms.geo.admin.ch/	Database		0	c30bc228-11da-4ed8-9b51-06c666b22dc8		deleted	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 16:11:03.260087	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
1487927d-4ce2-4b15-a98b-f2821fa9d01d	http://wms.geo.admin.ch/	Database		0	c30bc228-11da-4ed8-9b51-06c666b22dc8		active	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-24 07:26:54.575662	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
\.


--
-- Data for Name: resource_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY resource_revision (id, url, format, description, "position", revision_id, continuity_id, hash, state, extras, expired_id, revision_timestamp, expired_timestamp, current, name, resource_type, mimetype, mimetype_inner, size, last_modified, cache_url, cache_last_updated, webstore_url, webstore_last_updated, created, url_type, package_id) FROM stdin;
58c608a0-3a3f-4683-9940-3b7be7e9cbca	http://ihsn.org/download/testddi.xml	XML		0	9333eb3d-8838-4b51-b2dd-2def530567ed	58c608a0-3a3f-4683-9940-3b7be7e9cbca		active	{"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}	\N	2015-08-12 09:22:53.788165	2015-08-12 09:22:53.990137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-12 09:22:53.809864		ed7bad34-9a0c-47b3-98d8-54516214943f
58c608a0-3a3f-4683-9940-3b7be7e9cbca	http://ihsn.org/download/testddi.xml	XML		0	2d53b455-1dd7-49a2-a1f3-1a48f63313b7	58c608a0-3a3f-4683-9940-3b7be7e9cbca		active	{"rights": "", "license": "", "language": "[\\"en\\"]", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "identifier": ""}	\N	2015-08-12 09:22:53.990137	2015-08-21 07:18:54.617587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-12 09:22:53.809864		ed7bad34-9a0c-47b3-98d8-54516214943f
58c608a0-3a3f-4683-9940-3b7be7e9cbca	http://ihsn.org/download/testddi.xml	XML		0	a21f8bec-50a0-44d0-825b-1cd42b0b2a7c	58c608a0-3a3f-4683-9940-3b7be7e9cbca		active	{"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}	\N	2015-08-21 07:18:54.617587	2015-08-21 08:09:46.464998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-12 09:22:53.809864		ed7bad34-9a0c-47b3-98d8-54516214943f
58c608a0-3a3f-4683-9940-3b7be7e9cbca	http://ihsn.org/download/testddi.xml	XML		0	e03a6adf-1273-4736-a3d8-22f6c6e5e34e	58c608a0-3a3f-4683-9940-3b7be7e9cbca		active	{"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"\\", \\"en\\": \\"\\", \\"it\\": \\"\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}	\N	2015-08-21 08:11:04.531393	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-12 09:22:53.809864		ed7bad34-9a0c-47b3-98d8-54516214943f
58c608a0-3a3f-4683-9940-3b7be7e9cbca	http://ihsn.org/download/testddi.xml	XML		0	83a99d84-26af-4adb-8d7e-aa1683c852f5	58c608a0-3a3f-4683-9940-3b7be7e9cbca		active	{"license": "", "language": "[\\"en\\"]", "rights": "", "issued": null, "notes": "{\\"fr\\": \\"FR Besch\\", \\"de\\": \\"DE Besch\\", \\"en\\": \\"EN Besch\\", \\"it\\": \\"IT Besch\\"}", "byte_size": "", "modified": null, "download_url": "http://ihsn.org/download/testddi.xml", "coverage": "", "media_type": "", "title": "{\\"fr\\": \\"FR Titel\\", \\"de\\": \\"DE Titel\\", \\"en\\": \\"En TItel\\", \\"it\\": \\"IT TItel\\"}", "identifier": ""}	\N	2015-08-21 08:09:46.464998	2015-08-21 08:11:04.531393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-12 09:22:53.809864		ed7bad34-9a0c-47b3-98d8-54516214943f
b1dc908d-e1ea-496b-b00e-1275aced7bca	http://wms.geo.admin.ch/	Database		0	d1bc4cb5-c544-40b3-82d9-d5b02536f69e	b1dc908d-e1ea-496b-b00e-1275aced7bca		active	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-21 14:35:44.108941	2015-08-21 15:13:30.341342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 14:35:44.199827	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
b1dc908d-e1ea-496b-b00e-1275aced7bca	http://wms.geo.admin.ch/	Database		0	6a2d0695-98b9-40dc-99cf-c13d8a36cbdd	b1dc908d-e1ea-496b-b00e-1275aced7bca		deleted	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-21 15:13:30.341342	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 14:35:44.199827	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
e35a3b4b-abb9-4f6d-b901-eba066b2ab7f	http://wms.geo.admin.ch/	Database		0	c9bba04e-9529-4546-903b-67d6dbfb51ac	e35a3b4b-abb9-4f6d-b901-eba066b2ab7f		deleted	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-21 15:18:56.296035	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 15:13:30.397146	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
cea50e5e-9227-4fee-b98d-9c433dea84a7	http://wms.geo.admin.ch/	Database		0	c9bba04e-9529-4546-903b-67d6dbfb51ac	cea50e5e-9227-4fee-b98d-9c433dea84a7		active	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-21 15:18:56.296035	2015-08-21 16:11:03.166198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 15:18:56.336492	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
e35a3b4b-abb9-4f6d-b901-eba066b2ab7f	http://wms.geo.admin.ch/	Database		0	6a2d0695-98b9-40dc-99cf-c13d8a36cbdd	e35a3b4b-abb9-4f6d-b901-eba066b2ab7f		active	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-21 15:13:30.341342	2015-08-21 15:18:56.296035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 15:13:30.397146	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
cea50e5e-9227-4fee-b98d-9c433dea84a7	http://wms.geo.admin.ch/	Database		0	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	cea50e5e-9227-4fee-b98d-9c433dea84a7		deleted	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-21 16:11:03.166198	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 15:18:56.336492	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
f7e21bc5-3e82-487b-aefc-5f4a6c5947e5	http://wms.geo.admin.ch/	Database		0	c30bc228-11da-4ed8-9b51-06c666b22dc8	f7e21bc5-3e82-487b-aefc-5f4a6c5947e5		deleted	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-24 07:26:54.491492	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 16:11:03.260087	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
f7e21bc5-3e82-487b-aefc-5f4a6c5947e5	http://wms.geo.admin.ch/	Database		0	6e29c5fb-37b2-4f85-a2d7-5e9934be829f	f7e21bc5-3e82-487b-aefc-5f4a6c5947e5		active	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-21 16:11:03.166198	2015-08-24 07:26:54.491492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-21 16:11:03.260087	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
1487927d-4ce2-4b15-a98b-f2821fa9d01d	http://wms.geo.admin.ch/	Database		0	c30bc228-11da-4ed8-9b51-06c666b22dc8	1487927d-4ce2-4b15-a98b-f2821fa9d01d		active	{"rights": "", "license": "", "language": "[\\"de\\", \\"en\\"]", "title": "{\\"fr\\": \\"\\", \\"de\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"en\\": \\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\\", \\"it\\": \\"\\"}", "notes": "{\\"fr\\": \\"\\", \\"de\\": \\"Die Angaben basieren auf fl\\\\u00e4chendeckenden Modellberechnungen.\\", \\"en\\": \\"The information is based on comprehensive model calculations.\\", \\"it\\": \\"\\"}", "byte_size": "1024", "download_url": "http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip", "coverage": "", "media_type": "text/html", "identifier": "ch.bafu.laerm-bahnlaerm_nacht"}	\N	2015-08-24 07:26:54.491492	9999-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-08-24 07:26:54.575662	\N	30c153dd-6c9a-4b3c-8e69-cbf7fd121048
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
d0c1d364-0d56-4712-9a69-8eee712ede2c	2015-08-07 12:35:20.73612	system	Add versioning to groups, group_extras and package_groups	active	2015-08-07 12:35:20.73612
d1ebc80e-08d9-48c3-9404-893409c82bce	2015-08-07 12:35:21.102297	admin	Admin: make sure every object has a row in a revision table	active	2015-08-07 12:35:21.102297
014c5ea2-2315-4c88-bcd1-301d41063df1	2015-08-07 14:20:14.187011	admin		active	\N
6e84eb2b-bca1-405c-8552-8a48d7769f7e	2015-08-07 14:20:23.483249	admin	REST API: Update Objekt test-datensatz	active	\N
f77701fd-fb32-4644-b9b9-ff114af44ec4	2015-08-07 14:20:23.812269	admin	REST API: Update Objekt test-datensatz	active	\N
350c2793-f029-42ea-8640-4cd6f66ce9fd	2015-08-07 14:20:51.158571	admin	REST API: Update Objekt test-datensatz	active	\N
63f340a0-e5de-4b54-bd26-a9649a01d123	2015-08-10 15:12:56.68861	admin		active	\N
0d8de502-ef87-40fd-af6e-de746cdbc562	2015-08-10 15:13:02.860144	admin	REST API: Update Objekt another-dataset	active	\N
034e0c51-e4d3-4257-927a-61abbb6c43e9	2015-08-10 15:13:03.049527	admin	REST API: Update Objekt another-dataset	active	\N
8763fa05-5259-4ab5-9c88-0aa250a9c1e2	2015-08-10 15:19:02.349355	admin		active	\N
bc1de2d7-2ef1-4774-a6de-fd26615c1ad6	2015-08-11 14:34:51.556686	admin		active	\N
242c58f0-47d5-414a-b494-5edec5b046c7	2015-08-11 14:35:16.24523	admin	REST API: Update Objekt asdasd	active	\N
4dcca1c7-d6f4-4abe-b931-1108792c506a	2015-08-11 14:35:16.574994	admin	REST API: Update Objekt asdasd	active	\N
97bfec67-ecc0-4291-a90b-04bd39c53f62	2015-08-12 08:09:10.675306	\N	\N	active	\N
597109ec-33e4-47b6-b377-ee55c8fed47c	2015-08-12 08:13:07.136146	\N	\N	active	\N
2487b628-484b-4acc-933b-37343f95427b	2015-08-12 08:13:53.821967	\N	\N	active	\N
3b1b9d94-e0cd-4a2d-a011-e488a9c707e3	2015-08-12 08:14:20.500784	admin		active	\N
17d59392-22a8-4707-83ff-43f3614ea67d	2015-08-12 08:14:30.713646	admin	REST API: Update Objekt test	active	\N
cfa83e51-0b41-426c-b00f-2ae01f43c8cc	2015-08-12 08:14:30.942168	admin	REST API: Update Objekt test	active	\N
cf3929b1-b8f3-4573-8291-8a046324cb43	2015-08-12 09:21:57.559604	\N	\N	active	\N
c9c9320d-96bf-4808-b0d4-079c5e30d3d8	2015-08-12 09:22:36.056097	admin		active	\N
9333eb3d-8838-4b51-b2dd-2def530567ed	2015-08-12 09:22:53.788165	admin	REST API: Update Objekt multi-test	active	\N
2d53b455-1dd7-49a2-a1f3-1a48f63313b7	2015-08-12 09:22:53.990137	admin	REST API: Update Objekt multi-test	active	\N
904df174-cd96-40e5-93d6-8c091d0ba4e1	2015-08-12 11:09:10.239183	admin		active	\N
53691f78-c5c1-429a-9630-150c51e1e0bb	2015-08-12 11:13:24.680283	admin		active	\N
3fd9832b-cf52-43da-9bb0-012dc32b9dad	2015-08-12 11:20:54.09697	admin		active	\N
7fe6c6c7-20f8-4eca-bfaf-6ecc9e9fdd9a	2015-08-12 11:22:50.921756	admin		active	\N
c01baaba-0847-435a-9715-8cf8e8427b3e	2015-08-21 07:16:12.930014	admin		active	\N
59920b5b-6904-4eb3-8f70-bbbb3042b926	2015-08-21 07:16:58.766513	admin		active	\N
4d7362a1-0e0a-4dbb-b57c-9ef3ff590c67	2015-08-21 07:17:10.06932	admin		active	\N
2d56c229-2777-4e7f-8cd7-c609044b0325	2015-08-21 07:17:19.237964	admin		active	\N
6a3fc0c5-23a4-433f-b6db-a47ad4aa3c33	2015-08-21 07:17:34.977805	admin		active	\N
853b5bc9-2930-45cf-bc6c-8b28d2cd5bf3	2015-08-21 07:18:07.149881	admin		active	\N
431dbd5e-493d-472c-afc0-bd1bd2a6b30f	2015-08-21 07:18:20.304623	admin		active	\N
a21f8bec-50a0-44d0-825b-1cd42b0b2a7c	2015-08-21 07:18:54.617587	admin	REST API: Update object multi-test	active	\N
83a99d84-26af-4adb-8d7e-aa1683c852f5	2015-08-21 08:09:46.464998	admin	REST API: Update object multi-test	active	\N
e03a6adf-1273-4736-a3d8-22f6c6e5e34e	2015-08-21 08:11:04.531393	admin	REST API: Update object multi-test	active	\N
985a82de-df58-4f85-b5f4-b5415205c27e	2015-08-21 11:20:59.993618	admin	REST API: Objekt swisstopo anlegen	active	\N
952516cf-13e6-485b-833a-cabc81fbbe71	2015-08-21 11:21:01.039273	admin	REST API: Erstelle Mitgliedsobjekt 	active	\N
d1bc4cb5-c544-40b3-82d9-d5b02536f69e	2015-08-21 14:35:44.108941	admin	REST API: Objekt railway-noise-night anlegen	active	\N
6a2d0695-98b9-40dc-99cf-c13d8a36cbdd	2015-08-21 15:13:30.341342	admin	REST API: Update Objekt railway-noise-night	active	\N
c9bba04e-9529-4546-903b-67d6dbfb51ac	2015-08-21 15:18:56.296035	admin	REST API: Update Objekt railway-noise-night	active	\N
6e29c5fb-37b2-4f85-a2d7-5e9934be829f	2015-08-21 16:11:03.166198	admin	REST API: Update Objekt railway-noise-night	active	\N
c30bc228-11da-4ed8-9b51-06c666b22dc8	2015-08-24 07:26:54.491492	admin	REST API: Update Objekt railway-noise-night	active	\N
\.


--
-- Data for Name: system_info; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY system_info (id, key, value, revision_id, state) FROM stdin;
\.


--
-- Name: system_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ckan_default
--

SELECT pg_catalog.setval('system_info_id_seq', 1, false);


--
-- Data for Name: system_info_revision; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY system_info_revision (id, key, value, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Name: system_info_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ckan_default
--

SELECT pg_catalog.setval('system_info_revision_id_seq', 1, false);


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: ckan_default
--

COPY tag (id, name, vocabulary_id) FROM stdin;
52b08844-1509-442b-8157-846895203abf	Eisenbahn	\N
ab30f671-5252-4890-a3b8-051ed1407d7a	Nacht	\N
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
8e1726eb-e60a-44c3-8a7a-e2d5c4a339b3	logged_in	3d2af85b-c7f3-4fca-bd77-a07cf13a0d0c	2015-08-07 12:35:22.117863	\N	\N	\N	\N	\N	\N	f	f	active
ea6eae41-5729-43d0-938a-1d6a1d791ac3	visitor	7dba49b4-7c0c-41f5-820b-1aa39556147e	2015-08-07 12:35:22.119557	\N	\N	\N	\N	\N	\N	f	f	active
6cab4d69-3418-4090-8520-f793b0e57292	default	9be9c2c0-43f0-4026-99a9-2aba740e2342	2015-08-07 12:35:28.185536	\N	\N	$pbkdf2-sha512$19000$CoFwzvmfk/Ke8/4fA2BMSQ$Gxu2Gxjm1nzvYnSgnq5bX4JHhNTK8EQ6pzDz5EKmsGFew4KFS7arU76AIBvxhOKC7npUlJs2nxDDCIay8gWZqw	\N	\N	\N	t	f	active
6bc6e65b-e9f8-45b1-9814-ecef009acd9f	admin	a629ec74-c814-4404-9f56-08e2d2a32760	2015-08-07 12:35:29.338089	\N	\N	$pbkdf2-sha512$19000$JOT8n9M659y7t5bS2pvTug$YIjcNGOj7dHtbDo68cKdqLLm9SnzkhXlUuGVemBwRBtkDX9pJYGcNPHtad6EV3CAK243/MZz5/IbCMMeAJjSiA	\N	admin@email.org	\N	t	f	active
3f7479cc-ef13-4b22-ab1c-b3220bd8c75d	harvest	16624b3e-25f1-4262-9899-c8af2a14de00	2015-08-07 12:35:33.755856	\N	\N	$pbkdf2-sha512$19000$UcoZg5Dy/l/LeS.F8N5bqw$iWQCellJlHsJpIy6tI/xMaEsr9/lI1M/8qHs4s7CxW3EIYDiubYtWdxU79IvKSn9RPqEiCdjl4c2ZVQPzTBipw	\N	harvest@email.org	\N	t	f	active
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
-- Name: system_info_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckan_default; Tablespace: 
--

ALTER TABLE ONLY system_info_revision
    ADD CONSTRAINT system_info_revision_pkey PRIMARY KEY (id, revision_id);


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
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

