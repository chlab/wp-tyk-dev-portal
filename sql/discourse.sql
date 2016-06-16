--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE api_keys (
    id integer NOT NULL,
    key character varying(64) NOT NULL,
    user_id integer,
    created_by_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    allowed_ips inet[],
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE api_keys OWNER TO discourse;

--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_keys_id_seq OWNER TO discourse;

--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE api_keys_id_seq OWNED BY api_keys.id;


--
-- Name: application_requests; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE application_requests (
    id integer NOT NULL,
    date date NOT NULL,
    req_type integer NOT NULL,
    count integer DEFAULT 0 NOT NULL
);


ALTER TABLE application_requests OWNER TO discourse;

--
-- Name: application_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE application_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE application_requests_id_seq OWNER TO discourse;

--
-- Name: application_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE application_requests_id_seq OWNED BY application_requests.id;


--
-- Name: badge_groupings; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE badge_groupings (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    "position" integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE badge_groupings OWNER TO discourse;

--
-- Name: badge_groupings_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE badge_groupings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE badge_groupings_id_seq OWNER TO discourse;

--
-- Name: badge_groupings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE badge_groupings_id_seq OWNED BY badge_groupings.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(6) DEFAULT 'AB9364'::character varying NOT NULL,
    topic_id integer,
    topic_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    topics_year integer DEFAULT 0,
    topics_month integer DEFAULT 0,
    topics_week integer DEFAULT 0,
    slug character varying NOT NULL,
    description text,
    text_color character varying(6) DEFAULT 'FFFFFF'::character varying NOT NULL,
    read_restricted boolean DEFAULT false NOT NULL,
    auto_close_hours double precision,
    post_count integer DEFAULT 0 NOT NULL,
    latest_post_id integer,
    latest_topic_id integer,
    "position" integer,
    parent_category_id integer,
    posts_year integer DEFAULT 0,
    posts_month integer DEFAULT 0,
    posts_week integer DEFAULT 0,
    email_in character varying,
    email_in_allow_strangers boolean DEFAULT false,
    topics_day integer DEFAULT 0,
    posts_day integer DEFAULT 0,
    logo_url character varying,
    background_url character varying,
    allow_badges boolean DEFAULT true NOT NULL,
    name_lower character varying(50) NOT NULL,
    auto_close_based_on_last_post boolean DEFAULT false,
    topic_template text,
    suppress_from_homepage boolean DEFAULT false,
    contains_messages boolean
);


ALTER TABLE categories OWNER TO discourse;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE posts (
    id integer NOT NULL,
    user_id integer,
    topic_id integer NOT NULL,
    post_number integer NOT NULL,
    raw text NOT NULL,
    cooked text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reply_to_post_number integer,
    reply_count integer DEFAULT 0 NOT NULL,
    quote_count integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    off_topic_count integer DEFAULT 0 NOT NULL,
    like_count integer DEFAULT 0 NOT NULL,
    incoming_link_count integer DEFAULT 0 NOT NULL,
    bookmark_count integer DEFAULT 0 NOT NULL,
    avg_time integer,
    score double precision,
    reads integer DEFAULT 0 NOT NULL,
    post_type integer DEFAULT 1 NOT NULL,
    vote_count integer DEFAULT 0 NOT NULL,
    sort_order integer,
    last_editor_id integer,
    hidden boolean DEFAULT false NOT NULL,
    hidden_reason_id integer,
    notify_moderators_count integer DEFAULT 0 NOT NULL,
    spam_count integer DEFAULT 0 NOT NULL,
    illegal_count integer DEFAULT 0 NOT NULL,
    inappropriate_count integer DEFAULT 0 NOT NULL,
    last_version_at timestamp without time zone NOT NULL,
    user_deleted boolean DEFAULT false NOT NULL,
    reply_to_user_id integer,
    percent_rank double precision DEFAULT 1.0,
    notify_user_count integer DEFAULT 0 NOT NULL,
    like_score integer DEFAULT 0 NOT NULL,
    deleted_by_id integer,
    edit_reason character varying,
    word_count integer,
    version integer DEFAULT 1 NOT NULL,
    cook_method integer DEFAULT 1 NOT NULL,
    wiki boolean DEFAULT false NOT NULL,
    baked_at timestamp without time zone,
    baked_version integer,
    hidden_at timestamp without time zone,
    self_edits integer DEFAULT 0 NOT NULL,
    reply_quoted boolean DEFAULT false NOT NULL,
    via_email boolean DEFAULT false NOT NULL,
    raw_email text,
    public_version integer DEFAULT 1 NOT NULL,
    action_code character varying
);


ALTER TABLE posts OWNER TO discourse;

--
-- Name: TABLE posts; Type: COMMENT; Schema: public; Owner: discourse
--

COMMENT ON TABLE posts IS 'If you want to query public posts only, use the badge_posts view.';


--
-- Name: COLUMN posts.post_number; Type: COMMENT; Schema: public; Owner: discourse
--

COMMENT ON COLUMN posts.post_number IS 'The position of this post in the topic. The pair (topic_id, post_number) forms a natural key on the posts table.';


--
-- Name: COLUMN posts.raw; Type: COMMENT; Schema: public; Owner: discourse
--

COMMENT ON COLUMN posts.raw IS 'The raw Markdown that the user entered into the composer.';


--
-- Name: COLUMN posts.cooked; Type: COMMENT; Schema: public; Owner: discourse
--

COMMENT ON COLUMN posts.cooked IS 'The processed HTML that is presented in a topic.';


--
-- Name: COLUMN posts.reply_to_post_number; Type: COMMENT; Schema: public; Owner: discourse
--

COMMENT ON COLUMN posts.reply_to_post_number IS 'If this post is a reply to another, this column is the post_number of the post it''s replying to. [FKEY posts.topic_id, posts.post_number]';


--
-- Name: COLUMN posts.reply_quoted; Type: COMMENT; Schema: public; Owner: discourse
--

COMMENT ON COLUMN posts.reply_quoted IS 'This column is true if the post contains a quote-reply, which causes the in-reply-to indicator to be absent.';


--
-- Name: topics; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topics (
    id integer NOT NULL,
    title character varying NOT NULL,
    last_posted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    posts_count integer DEFAULT 0 NOT NULL,
    user_id integer,
    last_post_user_id integer NOT NULL,
    reply_count integer DEFAULT 0 NOT NULL,
    featured_user1_id integer,
    featured_user2_id integer,
    featured_user3_id integer,
    avg_time integer,
    deleted_at timestamp without time zone,
    highest_post_number integer DEFAULT 0 NOT NULL,
    image_url character varying,
    off_topic_count integer DEFAULT 0 NOT NULL,
    like_count integer DEFAULT 0 NOT NULL,
    incoming_link_count integer DEFAULT 0 NOT NULL,
    bookmark_count integer DEFAULT 0 NOT NULL,
    category_id integer,
    visible boolean DEFAULT true NOT NULL,
    moderator_posts_count integer DEFAULT 0 NOT NULL,
    closed boolean DEFAULT false NOT NULL,
    archived boolean DEFAULT false NOT NULL,
    bumped_at timestamp without time zone NOT NULL,
    has_summary boolean DEFAULT false NOT NULL,
    vote_count integer DEFAULT 0 NOT NULL,
    archetype character varying DEFAULT 'regular'::character varying NOT NULL,
    featured_user4_id integer,
    notify_moderators_count integer DEFAULT 0 NOT NULL,
    spam_count integer DEFAULT 0 NOT NULL,
    illegal_count integer DEFAULT 0 NOT NULL,
    inappropriate_count integer DEFAULT 0 NOT NULL,
    pinned_at timestamp without time zone,
    score double precision,
    percent_rank double precision DEFAULT 1.0 NOT NULL,
    notify_user_count integer DEFAULT 0 NOT NULL,
    subtype character varying,
    slug character varying,
    auto_close_at timestamp without time zone,
    auto_close_user_id integer,
    auto_close_started_at timestamp without time zone,
    deleted_by_id integer,
    participant_count integer DEFAULT 1,
    word_count integer,
    excerpt character varying(1000),
    pinned_globally boolean DEFAULT false NOT NULL,
    auto_close_based_on_last_post boolean DEFAULT false,
    auto_close_hours double precision,
    pinned_until timestamp without time zone,
    fancy_title character varying(400),
    CONSTRAINT has_category_id CHECK (((category_id IS NOT NULL) OR ((archetype)::text <> 'regular'::text))),
    CONSTRAINT pm_has_no_category CHECK (((category_id IS NULL) OR ((archetype)::text <> 'private_message'::text)))
);


ALTER TABLE topics OWNER TO discourse;

--
-- Name: TABLE topics; Type: COMMENT; Schema: public; Owner: discourse
--

COMMENT ON TABLE topics IS 'To query public topics only: SELECT ... FROM topics t LEFT INNER JOIN categories c ON (t.category_id = c.id AND c.read_restricted = false)';


--
-- Name: badge_posts; Type: VIEW; Schema: public; Owner: discourse
--

CREATE VIEW badge_posts AS
 SELECT p.id,
    p.user_id,
    p.topic_id,
    p.post_number,
    p.raw,
    p.cooked,
    p.created_at,
    p.updated_at,
    p.reply_to_post_number,
    p.reply_count,
    p.quote_count,
    p.deleted_at,
    p.off_topic_count,
    p.like_count,
    p.incoming_link_count,
    p.bookmark_count,
    p.avg_time,
    p.score,
    p.reads,
    p.post_type,
    p.vote_count,
    p.sort_order,
    p.last_editor_id,
    p.hidden,
    p.hidden_reason_id,
    p.notify_moderators_count,
    p.spam_count,
    p.illegal_count,
    p.inappropriate_count,
    p.last_version_at,
    p.user_deleted,
    p.reply_to_user_id,
    p.percent_rank,
    p.notify_user_count,
    p.like_score,
    p.deleted_by_id,
    p.edit_reason,
    p.word_count,
    p.version,
    p.cook_method,
    p.wiki,
    p.baked_at,
    p.baked_version,
    p.hidden_at,
    p.self_edits,
    p.reply_quoted,
    p.via_email,
    p.raw_email,
    p.public_version,
    p.action_code
   FROM ((posts p
     JOIN topics t ON ((t.id = p.topic_id)))
     JOIN categories c ON ((c.id = t.category_id)))
  WHERE (c.allow_badges AND (p.deleted_at IS NULL) AND (t.deleted_at IS NULL) AND (NOT c.read_restricted) AND t.visible AND (p.post_type = ANY (ARRAY[1, 2, 3])));


ALTER TABLE badge_posts OWNER TO discourse;

--
-- Name: badge_types; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE badge_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE badge_types OWNER TO discourse;

--
-- Name: badge_types_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE badge_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE badge_types_id_seq OWNER TO discourse;

--
-- Name: badge_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE badge_types_id_seq OWNED BY badge_types.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE badges (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    badge_type_id integer NOT NULL,
    grant_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    allow_title boolean DEFAULT false NOT NULL,
    multiple_grant boolean DEFAULT false NOT NULL,
    icon character varying DEFAULT 'fa-certificate'::character varying,
    listable boolean DEFAULT true,
    target_posts boolean DEFAULT false,
    query text,
    enabled boolean DEFAULT true NOT NULL,
    auto_revoke boolean DEFAULT true NOT NULL,
    badge_grouping_id integer DEFAULT 5 NOT NULL,
    trigger integer,
    show_posts boolean DEFAULT false NOT NULL,
    system boolean DEFAULT false NOT NULL,
    image character varying(255),
    long_description text
);


ALTER TABLE badges OWNER TO discourse;

--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE badges_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE badges_id_seq OWNER TO discourse;

--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE badges_id_seq OWNED BY badges.id;


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO discourse;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: category_custom_fields; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE category_custom_fields (
    id integer NOT NULL,
    category_id integer NOT NULL,
    name character varying(256) NOT NULL,
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE category_custom_fields OWNER TO discourse;

--
-- Name: category_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE category_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_custom_fields_id_seq OWNER TO discourse;

--
-- Name: category_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE category_custom_fields_id_seq OWNED BY category_custom_fields.id;


--
-- Name: category_featured_topics; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE category_featured_topics (
    category_id integer NOT NULL,
    topic_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rank integer DEFAULT 0 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE category_featured_topics OWNER TO discourse;

--
-- Name: category_featured_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE category_featured_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_featured_topics_id_seq OWNER TO discourse;

--
-- Name: category_featured_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE category_featured_topics_id_seq OWNED BY category_featured_topics.id;


--
-- Name: category_featured_users; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE category_featured_users (
    id integer NOT NULL,
    category_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE category_featured_users OWNER TO discourse;

--
-- Name: category_featured_users_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE category_featured_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_featured_users_id_seq OWNER TO discourse;

--
-- Name: category_featured_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE category_featured_users_id_seq OWNED BY category_featured_users.id;


--
-- Name: category_groups; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE category_groups (
    id integer NOT NULL,
    category_id integer NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    permission_type integer DEFAULT 1
);


ALTER TABLE category_groups OWNER TO discourse;

--
-- Name: category_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE category_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_groups_id_seq OWNER TO discourse;

--
-- Name: category_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE category_groups_id_seq OWNED BY category_groups.id;


--
-- Name: category_search_data; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE category_search_data (
    category_id integer NOT NULL,
    search_data tsvector,
    raw_data text,
    locale text
);


ALTER TABLE category_search_data OWNER TO discourse;

--
-- Name: category_tag_groups; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE category_tag_groups (
    id integer NOT NULL,
    category_id integer NOT NULL,
    tag_group_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE category_tag_groups OWNER TO discourse;

--
-- Name: category_tag_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE category_tag_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_tag_groups_id_seq OWNER TO discourse;

--
-- Name: category_tag_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE category_tag_groups_id_seq OWNED BY category_tag_groups.id;


--
-- Name: category_tags; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE category_tags (
    id integer NOT NULL,
    category_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE category_tags OWNER TO discourse;

--
-- Name: category_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE category_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_tags_id_seq OWNER TO discourse;

--
-- Name: category_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE category_tags_id_seq OWNED BY category_tags.id;


--
-- Name: category_users; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE category_users (
    id integer NOT NULL,
    category_id integer NOT NULL,
    user_id integer NOT NULL,
    notification_level integer NOT NULL
);


ALTER TABLE category_users OWNER TO discourse;

--
-- Name: category_users_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE category_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_users_id_seq OWNER TO discourse;

--
-- Name: category_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE category_users_id_seq OWNED BY category_users.id;


--
-- Name: color_scheme_colors; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE color_scheme_colors (
    id integer NOT NULL,
    name character varying NOT NULL,
    hex character varying NOT NULL,
    color_scheme_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE color_scheme_colors OWNER TO discourse;

--
-- Name: color_scheme_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE color_scheme_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE color_scheme_colors_id_seq OWNER TO discourse;

--
-- Name: color_scheme_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE color_scheme_colors_id_seq OWNED BY color_scheme_colors.id;


--
-- Name: color_schemes; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE color_schemes (
    id integer NOT NULL,
    name character varying NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    versioned_id integer,
    version integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE color_schemes OWNER TO discourse;

--
-- Name: color_schemes_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE color_schemes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE color_schemes_id_seq OWNER TO discourse;

--
-- Name: color_schemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE color_schemes_id_seq OWNED BY color_schemes.id;


--
-- Name: digest_unsubscribe_keys; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE digest_unsubscribe_keys (
    key character varying(64) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE digest_unsubscribe_keys OWNER TO discourse;

--
-- Name: directory_items; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE directory_items (
    id integer NOT NULL,
    period_type integer NOT NULL,
    user_id integer NOT NULL,
    likes_received integer NOT NULL,
    likes_given integer NOT NULL,
    topics_entered integer NOT NULL,
    topic_count integer NOT NULL,
    post_count integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    days_visited integer DEFAULT 0 NOT NULL,
    posts_read integer DEFAULT 0 NOT NULL
);


ALTER TABLE directory_items OWNER TO discourse;

--
-- Name: directory_items_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE directory_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE directory_items_id_seq OWNER TO discourse;

--
-- Name: directory_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE directory_items_id_seq OWNED BY directory_items.id;


--
-- Name: draft_sequences; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE draft_sequences (
    id integer NOT NULL,
    user_id integer NOT NULL,
    draft_key character varying NOT NULL,
    sequence integer NOT NULL
);


ALTER TABLE draft_sequences OWNER TO discourse;

--
-- Name: draft_sequences_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE draft_sequences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE draft_sequences_id_seq OWNER TO discourse;

--
-- Name: draft_sequences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE draft_sequences_id_seq OWNED BY draft_sequences.id;


--
-- Name: drafts; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE drafts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    draft_key character varying NOT NULL,
    data text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sequence integer DEFAULT 0 NOT NULL,
    revisions integer DEFAULT 1 NOT NULL
);


ALTER TABLE drafts OWNER TO discourse;

--
-- Name: drafts_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE drafts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE drafts_id_seq OWNER TO discourse;

--
-- Name: drafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE drafts_id_seq OWNED BY drafts.id;


--
-- Name: email_change_requests; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE email_change_requests (
    id integer NOT NULL,
    user_id integer NOT NULL,
    old_email character varying NOT NULL,
    new_email character varying NOT NULL,
    old_email_token_id integer,
    new_email_token_id integer,
    change_state integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE email_change_requests OWNER TO discourse;

--
-- Name: email_change_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE email_change_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_change_requests_id_seq OWNER TO discourse;

--
-- Name: email_change_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE email_change_requests_id_seq OWNED BY email_change_requests.id;


--
-- Name: email_logs; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE email_logs (
    id integer NOT NULL,
    to_address character varying NOT NULL,
    email_type character varying NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reply_key character varying(32),
    post_id integer,
    topic_id integer,
    skipped boolean DEFAULT false,
    skipped_reason character varying,
    bounce_key character varying,
    bounced boolean DEFAULT false NOT NULL,
    message_id character varying
);


ALTER TABLE email_logs OWNER TO discourse;

--
-- Name: email_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE email_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_logs_id_seq OWNER TO discourse;

--
-- Name: email_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE email_logs_id_seq OWNED BY email_logs.id;


--
-- Name: email_tokens; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE email_tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    email character varying NOT NULL,
    token character varying NOT NULL,
    confirmed boolean DEFAULT false NOT NULL,
    expired boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE email_tokens OWNER TO discourse;

--
-- Name: email_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE email_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_tokens_id_seq OWNER TO discourse;

--
-- Name: email_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE email_tokens_id_seq OWNED BY email_tokens.id;


--
-- Name: embeddable_hosts; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE embeddable_hosts (
    id integer NOT NULL,
    host character varying NOT NULL,
    category_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE embeddable_hosts OWNER TO discourse;

--
-- Name: embeddable_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE embeddable_hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE embeddable_hosts_id_seq OWNER TO discourse;

--
-- Name: embeddable_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE embeddable_hosts_id_seq OWNED BY embeddable_hosts.id;


--
-- Name: facebook_user_infos; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE facebook_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    facebook_user_id bigint NOT NULL,
    username character varying,
    first_name character varying,
    last_name character varying,
    email character varying,
    gender character varying,
    name character varying,
    link character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE facebook_user_infos OWNER TO discourse;

--
-- Name: facebook_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE facebook_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facebook_user_infos_id_seq OWNER TO discourse;

--
-- Name: facebook_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE facebook_user_infos_id_seq OWNED BY facebook_user_infos.id;


--
-- Name: github_user_infos; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE github_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    screen_name character varying NOT NULL,
    github_user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE github_user_infos OWNER TO discourse;

--
-- Name: github_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE github_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE github_user_infos_id_seq OWNER TO discourse;

--
-- Name: github_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE github_user_infos_id_seq OWNED BY github_user_infos.id;


--
-- Name: given_daily_likes; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE given_daily_likes (
    user_id integer NOT NULL,
    likes_given integer NOT NULL,
    given_date date NOT NULL,
    limit_reached boolean DEFAULT false NOT NULL
);


ALTER TABLE given_daily_likes OWNER TO discourse;

--
-- Name: google_user_infos; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE google_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    google_user_id character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    gender character varying,
    name character varying,
    link character varying,
    profile_link character varying,
    picture character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE google_user_infos OWNER TO discourse;

--
-- Name: google_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE google_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE google_user_infos_id_seq OWNER TO discourse;

--
-- Name: google_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE google_user_infos_id_seq OWNED BY google_user_infos.id;


--
-- Name: group_archived_messages; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE group_archived_messages (
    id integer NOT NULL,
    group_id integer NOT NULL,
    topic_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE group_archived_messages OWNER TO discourse;

--
-- Name: group_archived_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE group_archived_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_archived_messages_id_seq OWNER TO discourse;

--
-- Name: group_archived_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE group_archived_messages_id_seq OWNED BY group_archived_messages.id;


--
-- Name: group_custom_fields; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE group_custom_fields (
    id integer NOT NULL,
    group_id integer NOT NULL,
    name character varying(256) NOT NULL,
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE group_custom_fields OWNER TO discourse;

--
-- Name: group_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE group_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_custom_fields_id_seq OWNER TO discourse;

--
-- Name: group_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE group_custom_fields_id_seq OWNED BY group_custom_fields.id;


--
-- Name: group_mentions; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE group_mentions (
    id integer NOT NULL,
    post_id integer,
    group_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE group_mentions OWNER TO discourse;

--
-- Name: group_mentions_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE group_mentions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_mentions_id_seq OWNER TO discourse;

--
-- Name: group_mentions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE group_mentions_id_seq OWNED BY group_mentions.id;


--
-- Name: group_users; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE group_users (
    id integer NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner boolean DEFAULT false NOT NULL,
    notification_level integer DEFAULT 2 NOT NULL
);


ALTER TABLE group_users OWNER TO discourse;

--
-- Name: group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE group_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_users_id_seq OWNER TO discourse;

--
-- Name: group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE group_users_id_seq OWNED BY group_users.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    automatic boolean DEFAULT false NOT NULL,
    user_count integer DEFAULT 0 NOT NULL,
    alias_level integer DEFAULT 0,
    visible boolean DEFAULT true NOT NULL,
    automatic_membership_email_domains text,
    automatic_membership_retroactive boolean DEFAULT false,
    primary_group boolean DEFAULT false NOT NULL,
    title character varying,
    grant_trust_level integer,
    incoming_email character varying,
    has_messages boolean DEFAULT false NOT NULL
);


ALTER TABLE groups OWNER TO discourse;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE groups_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO discourse;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: incoming_domains; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE incoming_domains (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    https boolean DEFAULT false NOT NULL,
    port integer NOT NULL
);


ALTER TABLE incoming_domains OWNER TO discourse;

--
-- Name: incoming_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE incoming_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incoming_domains_id_seq OWNER TO discourse;

--
-- Name: incoming_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE incoming_domains_id_seq OWNED BY incoming_domains.id;


--
-- Name: incoming_emails; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE incoming_emails (
    id integer NOT NULL,
    user_id integer,
    topic_id integer,
    post_id integer,
    raw text,
    error text,
    message_id text,
    from_address text,
    to_addresses text,
    cc_addresses text,
    subject text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rejection_message text,
    is_auto_generated boolean DEFAULT false,
    is_bounce boolean DEFAULT false NOT NULL
);


ALTER TABLE incoming_emails OWNER TO discourse;

--
-- Name: incoming_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE incoming_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incoming_emails_id_seq OWNER TO discourse;

--
-- Name: incoming_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE incoming_emails_id_seq OWNED BY incoming_emails.id;


--
-- Name: incoming_links; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE incoming_links (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    user_id integer,
    ip_address inet,
    current_user_id integer,
    post_id integer NOT NULL,
    incoming_referer_id integer
);


ALTER TABLE incoming_links OWNER TO discourse;

--
-- Name: incoming_links_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE incoming_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incoming_links_id_seq OWNER TO discourse;

--
-- Name: incoming_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE incoming_links_id_seq OWNED BY incoming_links.id;


--
-- Name: incoming_referers; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE incoming_referers (
    id integer NOT NULL,
    path character varying(1000) NOT NULL,
    incoming_domain_id integer NOT NULL
);


ALTER TABLE incoming_referers OWNER TO discourse;

--
-- Name: incoming_referers_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE incoming_referers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incoming_referers_id_seq OWNER TO discourse;

--
-- Name: incoming_referers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE incoming_referers_id_seq OWNED BY incoming_referers.id;


--
-- Name: instagram_user_infos; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE instagram_user_infos (
    id integer NOT NULL,
    user_id integer,
    screen_name character varying,
    instagram_user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE instagram_user_infos OWNER TO discourse;

--
-- Name: instagram_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE instagram_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE instagram_user_infos_id_seq OWNER TO discourse;

--
-- Name: instagram_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE instagram_user_infos_id_seq OWNED BY instagram_user_infos.id;


--
-- Name: invited_groups; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE invited_groups (
    id integer NOT NULL,
    group_id integer,
    invite_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE invited_groups OWNER TO discourse;

--
-- Name: invited_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE invited_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invited_groups_id_seq OWNER TO discourse;

--
-- Name: invited_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE invited_groups_id_seq OWNED BY invited_groups.id;


--
-- Name: invites; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE invites (
    id integer NOT NULL,
    invite_key character varying(32) NOT NULL,
    email character varying,
    invited_by_id integer NOT NULL,
    user_id integer,
    redeemed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by_id integer,
    invalidated_at timestamp without time zone
);


ALTER TABLE invites OWNER TO discourse;

--
-- Name: invites_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invites_id_seq OWNER TO discourse;

--
-- Name: invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE invites_id_seq OWNED BY invites.id;


--
-- Name: message_bus; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE message_bus (
    id integer NOT NULL,
    name character varying,
    context character varying,
    data text,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE message_bus OWNER TO discourse;

--
-- Name: message_bus_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE message_bus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE message_bus_id_seq OWNER TO discourse;

--
-- Name: message_bus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE message_bus_id_seq OWNED BY message_bus.id;


--
-- Name: muted_users; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE muted_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    muted_user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE muted_users OWNER TO discourse;

--
-- Name: muted_users_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE muted_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE muted_users_id_seq OWNER TO discourse;

--
-- Name: muted_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE muted_users_id_seq OWNED BY muted_users.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE notifications (
    id integer NOT NULL,
    notification_type integer NOT NULL,
    user_id integer NOT NULL,
    data character varying(1000) NOT NULL,
    read boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    topic_id integer,
    post_number integer,
    post_action_id integer
);


ALTER TABLE notifications OWNER TO discourse;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notifications_id_seq OWNER TO discourse;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: oauth2_user_infos; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE oauth2_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    uid character varying NOT NULL,
    provider character varying NOT NULL,
    email character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE oauth2_user_infos OWNER TO discourse;

--
-- Name: oauth2_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE oauth2_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_user_infos_id_seq OWNER TO discourse;

--
-- Name: oauth2_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE oauth2_user_infos_id_seq OWNED BY oauth2_user_infos.id;


--
-- Name: onceoff_logs; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE onceoff_logs (
    id integer NOT NULL,
    job_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE onceoff_logs OWNER TO discourse;

--
-- Name: onceoff_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE onceoff_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE onceoff_logs_id_seq OWNER TO discourse;

--
-- Name: onceoff_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE onceoff_logs_id_seq OWNED BY onceoff_logs.id;


--
-- Name: optimized_images; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE optimized_images (
    id integer NOT NULL,
    sha1 character varying(40) NOT NULL,
    extension character varying(10) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    upload_id integer NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE optimized_images OWNER TO discourse;

--
-- Name: optimized_images_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE optimized_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE optimized_images_id_seq OWNER TO discourse;

--
-- Name: optimized_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE optimized_images_id_seq OWNED BY optimized_images.id;


--
-- Name: permalinks; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE permalinks (
    id integer NOT NULL,
    url character varying(1000) NOT NULL,
    topic_id integer,
    post_id integer,
    category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    external_url character varying(1000)
);


ALTER TABLE permalinks OWNER TO discourse;

--
-- Name: permalinks_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE permalinks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permalinks_id_seq OWNER TO discourse;

--
-- Name: permalinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE permalinks_id_seq OWNED BY permalinks.id;


--
-- Name: plugin_store_rows; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE plugin_store_rows (
    id integer NOT NULL,
    plugin_name character varying NOT NULL,
    key character varying NOT NULL,
    type_name character varying NOT NULL,
    value text
);


ALTER TABLE plugin_store_rows OWNER TO discourse;

--
-- Name: plugin_store_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE plugin_store_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plugin_store_rows_id_seq OWNER TO discourse;

--
-- Name: plugin_store_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE plugin_store_rows_id_seq OWNED BY plugin_store_rows.id;


--
-- Name: post_action_types; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_action_types (
    name_key character varying(50) NOT NULL,
    is_flag boolean DEFAULT false NOT NULL,
    icon character varying(20),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id integer NOT NULL,
    "position" integer DEFAULT 0 NOT NULL
);


ALTER TABLE post_action_types OWNER TO discourse;

--
-- Name: post_action_types_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE post_action_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_action_types_id_seq OWNER TO discourse;

--
-- Name: post_action_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE post_action_types_id_seq OWNED BY post_action_types.id;


--
-- Name: post_actions; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_actions (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    post_action_type_id integer NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_by_id integer,
    related_post_id integer,
    staff_took_action boolean DEFAULT false NOT NULL,
    deferred_by_id integer,
    targets_topic boolean DEFAULT false NOT NULL,
    agreed_at timestamp without time zone,
    agreed_by_id integer,
    deferred_at timestamp without time zone,
    disagreed_at timestamp without time zone,
    disagreed_by_id integer
);


ALTER TABLE post_actions OWNER TO discourse;

--
-- Name: post_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE post_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_actions_id_seq OWNER TO discourse;

--
-- Name: post_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE post_actions_id_seq OWNED BY post_actions.id;


--
-- Name: post_custom_fields; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_custom_fields (
    id integer NOT NULL,
    post_id integer NOT NULL,
    name character varying(256) NOT NULL,
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE post_custom_fields OWNER TO discourse;

--
-- Name: post_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE post_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_custom_fields_id_seq OWNER TO discourse;

--
-- Name: post_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE post_custom_fields_id_seq OWNED BY post_custom_fields.id;


--
-- Name: post_details; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_details (
    id integer NOT NULL,
    post_id integer,
    key character varying,
    value character varying,
    extra text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE post_details OWNER TO discourse;

--
-- Name: post_details_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE post_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_details_id_seq OWNER TO discourse;

--
-- Name: post_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE post_details_id_seq OWNED BY post_details.id;


--
-- Name: post_replies; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_replies (
    post_id integer,
    reply_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE post_replies OWNER TO discourse;

--
-- Name: post_revisions; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_revisions (
    id integer NOT NULL,
    user_id integer,
    post_id integer,
    modifications text,
    number integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE post_revisions OWNER TO discourse;

--
-- Name: post_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE post_revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_revisions_id_seq OWNER TO discourse;

--
-- Name: post_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE post_revisions_id_seq OWNED BY post_revisions.id;


--
-- Name: post_search_data; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_search_data (
    post_id integer NOT NULL,
    search_data tsvector,
    raw_data text,
    locale character varying
);


ALTER TABLE post_search_data OWNER TO discourse;

--
-- Name: post_stats; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_stats (
    id integer NOT NULL,
    post_id integer,
    drafts_saved integer,
    typing_duration_msecs integer,
    composer_open_duration_msecs integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE post_stats OWNER TO discourse;

--
-- Name: post_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE post_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_stats_id_seq OWNER TO discourse;

--
-- Name: post_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE post_stats_id_seq OWNED BY post_stats.id;


--
-- Name: post_timings; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_timings (
    topic_id integer NOT NULL,
    post_number integer NOT NULL,
    user_id integer NOT NULL,
    msecs integer NOT NULL
);


ALTER TABLE post_timings OWNER TO discourse;

--
-- Name: post_uploads; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE post_uploads (
    id integer NOT NULL,
    post_id integer NOT NULL,
    upload_id integer NOT NULL
);


ALTER TABLE post_uploads OWNER TO discourse;

--
-- Name: post_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE post_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_uploads_id_seq OWNER TO discourse;

--
-- Name: post_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE post_uploads_id_seq OWNED BY post_uploads.id;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO discourse;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: queued_posts; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE queued_posts (
    id integer NOT NULL,
    queue character varying NOT NULL,
    state integer NOT NULL,
    user_id integer NOT NULL,
    raw text NOT NULL,
    post_options json NOT NULL,
    topic_id integer,
    approved_by_id integer,
    approved_at timestamp without time zone,
    rejected_by_id integer,
    rejected_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE queued_posts OWNER TO discourse;

--
-- Name: queued_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE queued_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE queued_posts_id_seq OWNER TO discourse;

--
-- Name: queued_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE queued_posts_id_seq OWNED BY queued_posts.id;


--
-- Name: quoted_posts; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE quoted_posts (
    id integer NOT NULL,
    post_id integer NOT NULL,
    quoted_post_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE quoted_posts OWNER TO discourse;

--
-- Name: quoted_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE quoted_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quoted_posts_id_seq OWNER TO discourse;

--
-- Name: quoted_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE quoted_posts_id_seq OWNED BY quoted_posts.id;


--
-- Name: scheduler_stats; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE scheduler_stats (
    id integer NOT NULL,
    name character varying NOT NULL,
    hostname character varying NOT NULL,
    pid integer NOT NULL,
    duration_ms integer,
    live_slots_start integer,
    live_slots_finish integer,
    started_at timestamp without time zone NOT NULL,
    success boolean
);


ALTER TABLE scheduler_stats OWNER TO discourse;

--
-- Name: scheduler_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE scheduler_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scheduler_stats_id_seq OWNER TO discourse;

--
-- Name: scheduler_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE scheduler_stats_id_seq OWNED BY scheduler_stats.id;


--
-- Name: schema_migration_details; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE schema_migration_details (
    id integer NOT NULL,
    version character varying NOT NULL,
    name character varying,
    hostname character varying,
    git_version character varying,
    rails_version character varying,
    duration integer,
    direction character varying,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE schema_migration_details OWNER TO discourse;

--
-- Name: schema_migration_details_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE schema_migration_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schema_migration_details_id_seq OWNER TO discourse;

--
-- Name: schema_migration_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE schema_migration_details_id_seq OWNED BY schema_migration_details.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO discourse;

--
-- Name: screened_emails; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE screened_emails (
    id integer NOT NULL,
    email character varying NOT NULL,
    action_type integer NOT NULL,
    match_count integer DEFAULT 0 NOT NULL,
    last_match_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ip_address inet
);


ALTER TABLE screened_emails OWNER TO discourse;

--
-- Name: screened_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE screened_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE screened_emails_id_seq OWNER TO discourse;

--
-- Name: screened_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE screened_emails_id_seq OWNED BY screened_emails.id;


--
-- Name: screened_ip_addresses; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE screened_ip_addresses (
    id integer NOT NULL,
    ip_address inet NOT NULL,
    action_type integer NOT NULL,
    match_count integer DEFAULT 0 NOT NULL,
    last_match_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE screened_ip_addresses OWNER TO discourse;

--
-- Name: screened_ip_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE screened_ip_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE screened_ip_addresses_id_seq OWNER TO discourse;

--
-- Name: screened_ip_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE screened_ip_addresses_id_seq OWNED BY screened_ip_addresses.id;


--
-- Name: screened_urls; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE screened_urls (
    id integer NOT NULL,
    url character varying NOT NULL,
    domain character varying NOT NULL,
    action_type integer NOT NULL,
    match_count integer DEFAULT 0 NOT NULL,
    last_match_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ip_address inet
);


ALTER TABLE screened_urls OWNER TO discourse;

--
-- Name: screened_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE screened_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE screened_urls_id_seq OWNER TO discourse;

--
-- Name: screened_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE screened_urls_id_seq OWNED BY screened_urls.id;


--
-- Name: single_sign_on_records; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE single_sign_on_records (
    id integer NOT NULL,
    user_id integer NOT NULL,
    external_id character varying NOT NULL,
    last_payload text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_username character varying,
    external_email character varying,
    external_name character varying,
    external_avatar_url character varying
);


ALTER TABLE single_sign_on_records OWNER TO discourse;

--
-- Name: single_sign_on_records_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE single_sign_on_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE single_sign_on_records_id_seq OWNER TO discourse;

--
-- Name: single_sign_on_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE single_sign_on_records_id_seq OWNED BY single_sign_on_records.id;


--
-- Name: site_customizations; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE site_customizations (
    id integer NOT NULL,
    name character varying NOT NULL,
    stylesheet text,
    header text,
    user_id integer NOT NULL,
    enabled boolean NOT NULL,
    key character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stylesheet_baked text DEFAULT ''::text NOT NULL,
    mobile_stylesheet text,
    mobile_header text,
    mobile_stylesheet_baked text,
    footer text,
    mobile_footer text,
    head_tag text,
    body_tag text,
    top text,
    mobile_top text,
    embedded_css text,
    embedded_css_baked text,
    head_tag_baked text,
    body_tag_baked text,
    header_baked text,
    mobile_header_baked text,
    footer_baked text,
    mobile_footer_baked text
);


ALTER TABLE site_customizations OWNER TO discourse;

--
-- Name: site_customizations_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE site_customizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE site_customizations_id_seq OWNER TO discourse;

--
-- Name: site_customizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE site_customizations_id_seq OWNED BY site_customizations.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE site_settings (
    id integer NOT NULL,
    name character varying NOT NULL,
    data_type integer NOT NULL,
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE site_settings OWNER TO discourse;

--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE site_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE site_settings_id_seq OWNER TO discourse;

--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE site_settings_id_seq OWNED BY site_settings.id;


--
-- Name: stylesheet_cache; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE stylesheet_cache (
    id integer NOT NULL,
    target character varying NOT NULL,
    digest character varying NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE stylesheet_cache OWNER TO discourse;

--
-- Name: stylesheet_cache_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE stylesheet_cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stylesheet_cache_id_seq OWNER TO discourse;

--
-- Name: stylesheet_cache_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE stylesheet_cache_id_seq OWNED BY stylesheet_cache.id;


--
-- Name: tag_group_memberships; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE tag_group_memberships (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    tag_group_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tag_group_memberships OWNER TO discourse;

--
-- Name: tag_group_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE tag_group_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tag_group_memberships_id_seq OWNER TO discourse;

--
-- Name: tag_group_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE tag_group_memberships_id_seq OWNED BY tag_group_memberships.id;


--
-- Name: tag_groups; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE tag_groups (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    parent_tag_id integer,
    one_per_topic boolean DEFAULT false
);


ALTER TABLE tag_groups OWNER TO discourse;

--
-- Name: tag_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE tag_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tag_groups_id_seq OWNER TO discourse;

--
-- Name: tag_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE tag_groups_id_seq OWNED BY tag_groups.id;


--
-- Name: tag_users; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE tag_users (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    user_id integer NOT NULL,
    notification_level integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tag_users OWNER TO discourse;

--
-- Name: tag_users_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE tag_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tag_users_id_seq OWNER TO discourse;

--
-- Name: tag_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE tag_users_id_seq OWNED BY tag_users.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying NOT NULL,
    topic_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tags OWNER TO discourse;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO discourse;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: top_topics; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE top_topics (
    id integer NOT NULL,
    topic_id integer,
    yearly_posts_count integer DEFAULT 0 NOT NULL,
    yearly_views_count integer DEFAULT 0 NOT NULL,
    yearly_likes_count integer DEFAULT 0 NOT NULL,
    monthly_posts_count integer DEFAULT 0 NOT NULL,
    monthly_views_count integer DEFAULT 0 NOT NULL,
    monthly_likes_count integer DEFAULT 0 NOT NULL,
    weekly_posts_count integer DEFAULT 0 NOT NULL,
    weekly_views_count integer DEFAULT 0 NOT NULL,
    weekly_likes_count integer DEFAULT 0 NOT NULL,
    daily_posts_count integer DEFAULT 0 NOT NULL,
    daily_views_count integer DEFAULT 0 NOT NULL,
    daily_likes_count integer DEFAULT 0 NOT NULL,
    daily_score double precision DEFAULT 0.0,
    weekly_score double precision DEFAULT 0.0,
    monthly_score double precision DEFAULT 0.0,
    yearly_score double precision DEFAULT 0.0,
    all_score double precision DEFAULT 0.0,
    daily_op_likes_count integer DEFAULT 0 NOT NULL,
    weekly_op_likes_count integer DEFAULT 0 NOT NULL,
    monthly_op_likes_count integer DEFAULT 0 NOT NULL,
    yearly_op_likes_count integer DEFAULT 0 NOT NULL,
    quarterly_posts_count integer DEFAULT 0 NOT NULL,
    quarterly_views_count integer DEFAULT 0 NOT NULL,
    quarterly_likes_count integer DEFAULT 0 NOT NULL,
    quarterly_score double precision DEFAULT 0.0,
    quarterly_op_likes_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE top_topics OWNER TO discourse;

--
-- Name: top_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE top_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE top_topics_id_seq OWNER TO discourse;

--
-- Name: top_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE top_topics_id_seq OWNED BY top_topics.id;


--
-- Name: topic_allowed_groups; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_allowed_groups (
    id integer NOT NULL,
    group_id integer NOT NULL,
    topic_id integer NOT NULL
);


ALTER TABLE topic_allowed_groups OWNER TO discourse;

--
-- Name: topic_allowed_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_allowed_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_allowed_groups_id_seq OWNER TO discourse;

--
-- Name: topic_allowed_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_allowed_groups_id_seq OWNED BY topic_allowed_groups.id;


--
-- Name: topic_allowed_users; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_allowed_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    topic_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE topic_allowed_users OWNER TO discourse;

--
-- Name: topic_allowed_users_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_allowed_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_allowed_users_id_seq OWNER TO discourse;

--
-- Name: topic_allowed_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_allowed_users_id_seq OWNED BY topic_allowed_users.id;


--
-- Name: topic_custom_fields; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_custom_fields (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    name character varying(256) NOT NULL,
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE topic_custom_fields OWNER TO discourse;

--
-- Name: topic_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_custom_fields_id_seq OWNER TO discourse;

--
-- Name: topic_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_custom_fields_id_seq OWNED BY topic_custom_fields.id;


--
-- Name: topic_embeds; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_embeds (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    post_id integer NOT NULL,
    embed_url character varying(1000) NOT NULL,
    content_sha1 character varying(40),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE topic_embeds OWNER TO discourse;

--
-- Name: topic_embeds_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_embeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_embeds_id_seq OWNER TO discourse;

--
-- Name: topic_embeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_embeds_id_seq OWNED BY topic_embeds.id;


--
-- Name: topic_invites; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_invites (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    invite_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE topic_invites OWNER TO discourse;

--
-- Name: topic_invites_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_invites_id_seq OWNER TO discourse;

--
-- Name: topic_invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_invites_id_seq OWNED BY topic_invites.id;


--
-- Name: topic_link_clicks; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_link_clicks (
    id integer NOT NULL,
    topic_link_id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ip_address inet NOT NULL
);


ALTER TABLE topic_link_clicks OWNER TO discourse;

--
-- Name: topic_link_clicks_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_link_clicks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_link_clicks_id_seq OWNER TO discourse;

--
-- Name: topic_link_clicks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_link_clicks_id_seq OWNED BY topic_link_clicks.id;


--
-- Name: topic_links; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_links (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    post_id integer,
    user_id integer NOT NULL,
    url character varying(500) NOT NULL,
    domain character varying(100) NOT NULL,
    internal boolean DEFAULT false NOT NULL,
    link_topic_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reflection boolean DEFAULT false,
    clicks integer DEFAULT 0 NOT NULL,
    link_post_id integer,
    title character varying,
    crawled_at timestamp without time zone,
    quote boolean DEFAULT false NOT NULL
);


ALTER TABLE topic_links OWNER TO discourse;

--
-- Name: topic_links_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_links_id_seq OWNER TO discourse;

--
-- Name: topic_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_links_id_seq OWNED BY topic_links.id;


--
-- Name: topic_search_data; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_search_data (
    topic_id integer NOT NULL,
    raw_data text,
    locale character varying NOT NULL,
    search_data tsvector
);


ALTER TABLE topic_search_data OWNER TO discourse;

--
-- Name: topic_tags; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_tags (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE topic_tags OWNER TO discourse;

--
-- Name: topic_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_tags_id_seq OWNER TO discourse;

--
-- Name: topic_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_tags_id_seq OWNED BY topic_tags.id;


--
-- Name: topic_users; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_users (
    user_id integer NOT NULL,
    topic_id integer NOT NULL,
    posted boolean DEFAULT false NOT NULL,
    last_read_post_number integer,
    highest_seen_post_number integer,
    last_visited_at timestamp without time zone,
    first_visited_at timestamp without time zone,
    notification_level integer DEFAULT 1 NOT NULL,
    notifications_changed_at timestamp without time zone,
    notifications_reason_id integer,
    total_msecs_viewed integer DEFAULT 0 NOT NULL,
    cleared_pinned_at timestamp without time zone,
    id integer NOT NULL,
    last_emailed_post_number integer,
    liked boolean DEFAULT false,
    bookmarked boolean DEFAULT false
);


ALTER TABLE topic_users OWNER TO discourse;

--
-- Name: topic_users_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topic_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topic_users_id_seq OWNER TO discourse;

--
-- Name: topic_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topic_users_id_seq OWNED BY topic_users.id;


--
-- Name: topic_views; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE topic_views (
    topic_id integer NOT NULL,
    viewed_at date NOT NULL,
    user_id integer,
    ip_address inet NOT NULL
);


ALTER TABLE topic_views OWNER TO discourse;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topics_id_seq OWNER TO discourse;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE topics_id_seq OWNED BY topics.id;


--
-- Name: translation_overrides; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE translation_overrides (
    id integer NOT NULL,
    locale character varying NOT NULL,
    translation_key character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    compiled_js text
);


ALTER TABLE translation_overrides OWNER TO discourse;

--
-- Name: translation_overrides_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE translation_overrides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE translation_overrides_id_seq OWNER TO discourse;

--
-- Name: translation_overrides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE translation_overrides_id_seq OWNED BY translation_overrides.id;


--
-- Name: twitter_user_infos; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE twitter_user_infos (
    id integer NOT NULL,
    user_id integer NOT NULL,
    screen_name character varying NOT NULL,
    twitter_user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE twitter_user_infos OWNER TO discourse;

--
-- Name: twitter_user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE twitter_user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE twitter_user_infos_id_seq OWNER TO discourse;

--
-- Name: twitter_user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE twitter_user_infos_id_seq OWNED BY twitter_user_infos.id;


--
-- Name: uploads; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE uploads (
    id integer NOT NULL,
    user_id integer NOT NULL,
    original_filename character varying NOT NULL,
    filesize integer NOT NULL,
    width integer,
    height integer,
    url character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sha1 character varying(40),
    origin character varying(1000),
    retain_hours integer
);


ALTER TABLE uploads OWNER TO discourse;

--
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE uploads_id_seq OWNER TO discourse;

--
-- Name: uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE uploads_id_seq OWNED BY uploads.id;


--
-- Name: user_actions; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_actions (
    id integer NOT NULL,
    action_type integer NOT NULL,
    user_id integer NOT NULL,
    target_topic_id integer,
    target_post_id integer,
    target_user_id integer,
    acting_user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    queued_post_id integer
);


ALTER TABLE user_actions OWNER TO discourse;

--
-- Name: user_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_actions_id_seq OWNER TO discourse;

--
-- Name: user_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_actions_id_seq OWNED BY user_actions.id;


--
-- Name: user_archived_messages; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_archived_messages (
    id integer NOT NULL,
    user_id integer NOT NULL,
    topic_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_archived_messages OWNER TO discourse;

--
-- Name: user_archived_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_archived_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_archived_messages_id_seq OWNER TO discourse;

--
-- Name: user_archived_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_archived_messages_id_seq OWNED BY user_archived_messages.id;


--
-- Name: user_avatars; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_avatars (
    id integer NOT NULL,
    user_id integer NOT NULL,
    custom_upload_id integer,
    gravatar_upload_id integer,
    last_gravatar_download_attempt timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE user_avatars OWNER TO discourse;

--
-- Name: user_avatars_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_avatars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_avatars_id_seq OWNER TO discourse;

--
-- Name: user_avatars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_avatars_id_seq OWNED BY user_avatars.id;


--
-- Name: user_badges; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_badges (
    id integer NOT NULL,
    badge_id integer NOT NULL,
    user_id integer NOT NULL,
    granted_at timestamp without time zone NOT NULL,
    granted_by_id integer NOT NULL,
    post_id integer,
    notification_id integer,
    seq integer DEFAULT 0 NOT NULL
);


ALTER TABLE user_badges OWNER TO discourse;

--
-- Name: user_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_badges_id_seq OWNER TO discourse;

--
-- Name: user_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_badges_id_seq OWNED BY user_badges.id;


--
-- Name: user_custom_fields; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_custom_fields (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(256) NOT NULL,
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE user_custom_fields OWNER TO discourse;

--
-- Name: user_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_custom_fields_id_seq OWNER TO discourse;

--
-- Name: user_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_custom_fields_id_seq OWNED BY user_custom_fields.id;


--
-- Name: user_exports; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_exports (
    id integer NOT NULL,
    file_name character varying NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_exports OWNER TO discourse;

--
-- Name: user_exports_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_exports_id_seq OWNER TO discourse;

--
-- Name: user_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_exports_id_seq OWNED BY user_exports.id;


--
-- Name: user_field_options; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_field_options (
    id integer NOT NULL,
    user_field_id integer NOT NULL,
    value character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_field_options OWNER TO discourse;

--
-- Name: user_field_options_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_field_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_field_options_id_seq OWNER TO discourse;

--
-- Name: user_field_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_field_options_id_seq OWNED BY user_field_options.id;


--
-- Name: user_fields; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_fields (
    id integer NOT NULL,
    name character varying NOT NULL,
    field_type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    editable boolean DEFAULT false NOT NULL,
    description character varying NOT NULL,
    required boolean DEFAULT true NOT NULL,
    show_on_profile boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 0,
    show_on_user_card boolean DEFAULT false NOT NULL
);


ALTER TABLE user_fields OWNER TO discourse;

--
-- Name: user_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_fields_id_seq OWNER TO discourse;

--
-- Name: user_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_fields_id_seq OWNED BY user_fields.id;


--
-- Name: user_histories; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_histories (
    id integer NOT NULL,
    action integer NOT NULL,
    acting_user_id integer,
    target_user_id integer,
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    context character varying,
    ip_address character varying,
    email character varying,
    subject text,
    previous_value text,
    new_value text,
    topic_id integer,
    admin_only boolean DEFAULT false,
    post_id integer,
    custom_type character varying,
    category_id integer
);


ALTER TABLE user_histories OWNER TO discourse;

--
-- Name: user_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_histories_id_seq OWNER TO discourse;

--
-- Name: user_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_histories_id_seq OWNED BY user_histories.id;


--
-- Name: user_open_ids; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_open_ids (
    id integer NOT NULL,
    user_id integer NOT NULL,
    email character varying NOT NULL,
    url character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE user_open_ids OWNER TO discourse;

--
-- Name: user_open_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_open_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_open_ids_id_seq OWNER TO discourse;

--
-- Name: user_open_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_open_ids_id_seq OWNED BY user_open_ids.id;


--
-- Name: user_options; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_options (
    user_id integer NOT NULL,
    email_always boolean DEFAULT false NOT NULL,
    mailing_list_mode boolean DEFAULT false NOT NULL,
    email_digests boolean,
    email_direct boolean DEFAULT true NOT NULL,
    email_private_messages boolean DEFAULT true NOT NULL,
    external_links_in_new_tab boolean DEFAULT false NOT NULL,
    enable_quoting boolean DEFAULT true NOT NULL,
    dynamic_favicon boolean DEFAULT false NOT NULL,
    disable_jump_reply boolean DEFAULT false NOT NULL,
    edit_history_public boolean DEFAULT false NOT NULL,
    automatically_unpin_topics boolean DEFAULT true NOT NULL,
    digest_after_minutes integer,
    auto_track_topics_after_msecs integer,
    new_topic_duration_minutes integer,
    last_redirected_to_top_at timestamp without time zone,
    email_previous_replies integer DEFAULT 2 NOT NULL,
    email_in_reply_to boolean DEFAULT true NOT NULL,
    like_notification_frequency integer DEFAULT 1 NOT NULL,
    mailing_list_mode_frequency integer DEFAULT 0 NOT NULL,
    include_tl0_in_digests boolean DEFAULT false
);


ALTER TABLE user_options OWNER TO discourse;

--
-- Name: user_profile_views; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_profile_views (
    id integer NOT NULL,
    user_profile_id integer NOT NULL,
    viewed_at timestamp without time zone NOT NULL,
    ip_address inet NOT NULL,
    user_id integer
);


ALTER TABLE user_profile_views OWNER TO discourse;

--
-- Name: user_profile_views_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_profile_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_profile_views_id_seq OWNER TO discourse;

--
-- Name: user_profile_views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_profile_views_id_seq OWNED BY user_profile_views.id;


--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_profiles (
    user_id integer NOT NULL,
    location character varying,
    website character varying,
    bio_raw text,
    bio_cooked text,
    profile_background character varying(255),
    dismissed_banner_key integer,
    bio_cooked_version integer,
    badge_granted_title boolean DEFAULT false,
    card_background character varying(255),
    card_image_badge_id integer,
    views integer DEFAULT 0 NOT NULL
);


ALTER TABLE user_profiles OWNER TO discourse;

--
-- Name: user_search_data; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_search_data (
    user_id integer NOT NULL,
    search_data tsvector,
    raw_data text,
    locale text
);


ALTER TABLE user_search_data OWNER TO discourse;

--
-- Name: user_stats; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_stats (
    user_id integer NOT NULL,
    topics_entered integer DEFAULT 0 NOT NULL,
    time_read integer DEFAULT 0 NOT NULL,
    days_visited integer DEFAULT 0 NOT NULL,
    posts_read_count integer DEFAULT 0 NOT NULL,
    likes_given integer DEFAULT 0 NOT NULL,
    likes_received integer DEFAULT 0 NOT NULL,
    topic_reply_count integer DEFAULT 0 NOT NULL,
    new_since timestamp without time zone NOT NULL,
    read_faq timestamp without time zone,
    first_post_created_at timestamp without time zone,
    post_count integer DEFAULT 0 NOT NULL,
    topic_count integer DEFAULT 0 NOT NULL,
    bounce_score integer DEFAULT 0 NOT NULL,
    reset_bounce_score_after timestamp without time zone
);


ALTER TABLE user_stats OWNER TO discourse;

--
-- Name: user_visits; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE user_visits (
    id integer NOT NULL,
    user_id integer NOT NULL,
    visited_at date NOT NULL,
    posts_read integer DEFAULT 0,
    mobile boolean DEFAULT false
);


ALTER TABLE user_visits OWNER TO discourse;

--
-- Name: user_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE user_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_visits_id_seq OWNER TO discourse;

--
-- Name: user_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE user_visits_id_seq OWNED BY user_visits.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(60) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    seen_notification_id integer DEFAULT 0 NOT NULL,
    last_posted_at timestamp without time zone,
    email character varying(513) NOT NULL,
    password_hash character varying(64),
    salt character varying(32),
    active boolean DEFAULT false NOT NULL,
    username_lower character varying(60) NOT NULL,
    auth_token character varying(32),
    last_seen_at timestamp without time zone,
    admin boolean DEFAULT false NOT NULL,
    last_emailed_at timestamp without time zone,
    trust_level integer NOT NULL,
    approved boolean DEFAULT false NOT NULL,
    approved_by_id integer,
    approved_at timestamp without time zone,
    previous_visit_at timestamp without time zone,
    suspended_at timestamp without time zone,
    suspended_till timestamp without time zone,
    date_of_birth date,
    views integer DEFAULT 0 NOT NULL,
    flag_level integer DEFAULT 0 NOT NULL,
    ip_address inet,
    moderator boolean DEFAULT false,
    blocked boolean DEFAULT false,
    title character varying,
    uploaded_avatar_id integer,
    locale character varying(10),
    primary_group_id integer,
    registration_ip_address inet,
    trust_level_locked boolean DEFAULT false NOT NULL,
    staged boolean DEFAULT false NOT NULL,
    first_seen_at timestamp without time zone
);


ALTER TABLE users OWNER TO discourse;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO discourse;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE versions (
    id integer NOT NULL,
    versioned_id integer,
    versioned_type character varying,
    user_id integer,
    user_type character varying,
    user_name character varying,
    modifications text,
    number integer,
    reverted_from integer,
    tag character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE versions OWNER TO discourse;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE versions_id_seq OWNER TO discourse;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: warnings; Type: TABLE; Schema: public; Owner: discourse
--

CREATE TABLE warnings (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    user_id integer NOT NULL,
    created_by_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE warnings OWNER TO discourse;

--
-- Name: warnings_id_seq; Type: SEQUENCE; Schema: public; Owner: discourse
--

CREATE SEQUENCE warnings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE warnings_id_seq OWNER TO discourse;

--
-- Name: warnings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: discourse
--

ALTER SEQUENCE warnings_id_seq OWNED BY warnings.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY api_keys ALTER COLUMN id SET DEFAULT nextval('api_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY application_requests ALTER COLUMN id SET DEFAULT nextval('application_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY badge_groupings ALTER COLUMN id SET DEFAULT nextval('badge_groupings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY badge_types ALTER COLUMN id SET DEFAULT nextval('badge_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY badges ALTER COLUMN id SET DEFAULT nextval('badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_custom_fields ALTER COLUMN id SET DEFAULT nextval('category_custom_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_featured_topics ALTER COLUMN id SET DEFAULT nextval('category_featured_topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_featured_users ALTER COLUMN id SET DEFAULT nextval('category_featured_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_groups ALTER COLUMN id SET DEFAULT nextval('category_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_tag_groups ALTER COLUMN id SET DEFAULT nextval('category_tag_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_tags ALTER COLUMN id SET DEFAULT nextval('category_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_users ALTER COLUMN id SET DEFAULT nextval('category_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY color_scheme_colors ALTER COLUMN id SET DEFAULT nextval('color_scheme_colors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY color_schemes ALTER COLUMN id SET DEFAULT nextval('color_schemes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY directory_items ALTER COLUMN id SET DEFAULT nextval('directory_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY draft_sequences ALTER COLUMN id SET DEFAULT nextval('draft_sequences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY drafts ALTER COLUMN id SET DEFAULT nextval('drafts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY email_change_requests ALTER COLUMN id SET DEFAULT nextval('email_change_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY email_logs ALTER COLUMN id SET DEFAULT nextval('email_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY email_tokens ALTER COLUMN id SET DEFAULT nextval('email_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY embeddable_hosts ALTER COLUMN id SET DEFAULT nextval('embeddable_hosts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY facebook_user_infos ALTER COLUMN id SET DEFAULT nextval('facebook_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY github_user_infos ALTER COLUMN id SET DEFAULT nextval('github_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY google_user_infos ALTER COLUMN id SET DEFAULT nextval('google_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY group_archived_messages ALTER COLUMN id SET DEFAULT nextval('group_archived_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY group_custom_fields ALTER COLUMN id SET DEFAULT nextval('group_custom_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY group_mentions ALTER COLUMN id SET DEFAULT nextval('group_mentions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY group_users ALTER COLUMN id SET DEFAULT nextval('group_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY incoming_domains ALTER COLUMN id SET DEFAULT nextval('incoming_domains_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY incoming_emails ALTER COLUMN id SET DEFAULT nextval('incoming_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY incoming_links ALTER COLUMN id SET DEFAULT nextval('incoming_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY incoming_referers ALTER COLUMN id SET DEFAULT nextval('incoming_referers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY instagram_user_infos ALTER COLUMN id SET DEFAULT nextval('instagram_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY invited_groups ALTER COLUMN id SET DEFAULT nextval('invited_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY invites ALTER COLUMN id SET DEFAULT nextval('invites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY message_bus ALTER COLUMN id SET DEFAULT nextval('message_bus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY muted_users ALTER COLUMN id SET DEFAULT nextval('muted_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY oauth2_user_infos ALTER COLUMN id SET DEFAULT nextval('oauth2_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY onceoff_logs ALTER COLUMN id SET DEFAULT nextval('onceoff_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY optimized_images ALTER COLUMN id SET DEFAULT nextval('optimized_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY permalinks ALTER COLUMN id SET DEFAULT nextval('permalinks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY plugin_store_rows ALTER COLUMN id SET DEFAULT nextval('plugin_store_rows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_action_types ALTER COLUMN id SET DEFAULT nextval('post_action_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_actions ALTER COLUMN id SET DEFAULT nextval('post_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_custom_fields ALTER COLUMN id SET DEFAULT nextval('post_custom_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_details ALTER COLUMN id SET DEFAULT nextval('post_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_revisions ALTER COLUMN id SET DEFAULT nextval('post_revisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_stats ALTER COLUMN id SET DEFAULT nextval('post_stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_uploads ALTER COLUMN id SET DEFAULT nextval('post_uploads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY queued_posts ALTER COLUMN id SET DEFAULT nextval('queued_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY quoted_posts ALTER COLUMN id SET DEFAULT nextval('quoted_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY scheduler_stats ALTER COLUMN id SET DEFAULT nextval('scheduler_stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY schema_migration_details ALTER COLUMN id SET DEFAULT nextval('schema_migration_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY screened_emails ALTER COLUMN id SET DEFAULT nextval('screened_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY screened_ip_addresses ALTER COLUMN id SET DEFAULT nextval('screened_ip_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY screened_urls ALTER COLUMN id SET DEFAULT nextval('screened_urls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY single_sign_on_records ALTER COLUMN id SET DEFAULT nextval('single_sign_on_records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY site_customizations ALTER COLUMN id SET DEFAULT nextval('site_customizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY site_settings ALTER COLUMN id SET DEFAULT nextval('site_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY stylesheet_cache ALTER COLUMN id SET DEFAULT nextval('stylesheet_cache_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY tag_group_memberships ALTER COLUMN id SET DEFAULT nextval('tag_group_memberships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY tag_groups ALTER COLUMN id SET DEFAULT nextval('tag_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY tag_users ALTER COLUMN id SET DEFAULT nextval('tag_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY top_topics ALTER COLUMN id SET DEFAULT nextval('top_topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_allowed_groups ALTER COLUMN id SET DEFAULT nextval('topic_allowed_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_allowed_users ALTER COLUMN id SET DEFAULT nextval('topic_allowed_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_custom_fields ALTER COLUMN id SET DEFAULT nextval('topic_custom_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_embeds ALTER COLUMN id SET DEFAULT nextval('topic_embeds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_invites ALTER COLUMN id SET DEFAULT nextval('topic_invites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_link_clicks ALTER COLUMN id SET DEFAULT nextval('topic_link_clicks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_links ALTER COLUMN id SET DEFAULT nextval('topic_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_tags ALTER COLUMN id SET DEFAULT nextval('topic_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_users ALTER COLUMN id SET DEFAULT nextval('topic_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY translation_overrides ALTER COLUMN id SET DEFAULT nextval('translation_overrides_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY twitter_user_infos ALTER COLUMN id SET DEFAULT nextval('twitter_user_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY uploads ALTER COLUMN id SET DEFAULT nextval('uploads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_actions ALTER COLUMN id SET DEFAULT nextval('user_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_archived_messages ALTER COLUMN id SET DEFAULT nextval('user_archived_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_avatars ALTER COLUMN id SET DEFAULT nextval('user_avatars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_badges ALTER COLUMN id SET DEFAULT nextval('user_badges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_custom_fields ALTER COLUMN id SET DEFAULT nextval('user_custom_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_exports ALTER COLUMN id SET DEFAULT nextval('user_exports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_field_options ALTER COLUMN id SET DEFAULT nextval('user_field_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_fields ALTER COLUMN id SET DEFAULT nextval('user_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_histories ALTER COLUMN id SET DEFAULT nextval('user_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_open_ids ALTER COLUMN id SET DEFAULT nextval('user_open_ids_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_profile_views ALTER COLUMN id SET DEFAULT nextval('user_profile_views_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_visits ALTER COLUMN id SET DEFAULT nextval('user_visits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY warnings ALTER COLUMN id SET DEFAULT nextval('warnings_id_seq'::regclass);


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY api_keys (id, key, user_id, created_by_id, created_at, updated_at, allowed_ips, hidden) FROM stdin;
1	cc485f113876bc53fafc9628c09dbbcde26ccd826ee9d1c532249cdfaa9c2df9	\N	-1	2016-06-15 08:21:50.810463	2016-06-15 08:21:50.810463	\N	f
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('api_keys_id_seq', 1, true);


--
-- Data for Name: application_requests; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY application_requests (id, date, req_type, count) FROM stdin;
5	2016-06-15	3	10
7	2016-06-15	8	5
6	2016-06-15	4	4
2	2016-06-15	0	303
3	2016-06-15	1	213
4	2016-06-15	2	76
1	2016-06-15	7	88
\.


--
-- Name: application_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('application_requests_id_seq', 7, true);


--
-- Data for Name: badge_groupings; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY badge_groupings (id, name, description, "position", created_at, updated_at) FROM stdin;
1	Getting Started	\N	10	2016-06-14 16:53:32.461963	2016-06-14 16:53:32.461963
2	Community	\N	11	2016-06-14 16:53:32.464626	2016-06-14 16:53:32.464626
3	Posting	\N	12	2016-06-14 16:53:32.466601	2016-06-14 16:53:32.466601
4	Trust Level	\N	13	2016-06-14 16:53:32.468439	2016-06-14 16:53:32.468439
5	Other	\N	14	2016-06-14 16:53:32.470175	2016-06-14 16:53:32.470175
\.


--
-- Name: badge_groupings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('badge_groupings_id_seq', 6, false);


--
-- Data for Name: badge_types; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY badge_types (id, name, created_at, updated_at) FROM stdin;
1	Gold	2016-06-14 16:53:32.446426	2016-06-14 16:53:32.446426
2	Silver	2016-06-14 16:53:32.449468	2016-06-14 16:53:32.449468
3	Bronze	2016-06-14 16:53:32.452181	2016-06-14 16:53:32.452181
\.


--
-- Name: badge_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('badge_types_id_seq', 4, false);


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY badges (id, name, description, badge_type_id, grant_count, created_at, updated_at, allow_title, multiple_grant, icon, listable, target_posts, query, enabled, auto_revoke, badge_grouping_id, trigger, show_posts, system, image, long_description) FROM stdin;
10	Editor	\N	3	1	2016-06-14 16:53:32.528866	2016-06-15 09:04:20.893803	f	f	fa-certificate	t	f	  SELECT p.user_id, min(p.id) post_id, min(p.created_at) granted_at\n  FROM badge_posts p\n  WHERE p.self_edits > 0 AND\n      (:backfill OR p.id IN (:post_ids) )\n  GROUP BY p.user_id\n	t	t	1	2	f	t	\N	\N
13	First Flag	\N	3	0	2016-06-14 16:53:32.504823	2016-06-14 16:53:32.504823	f	f	fa-certificate	t	t	  SELECT pa1.user_id, pa1.created_at granted_at, pa1.post_id\n  FROM (\n    SELECT pa.user_id, min(pa.id) id\n    FROM post_actions pa\n    JOIN badge_posts p on p.id = pa.post_id\n    WHERE post_action_type_id IN (3,4,7,8) AND\n      (:backfill OR pa.post_id IN (:post_ids) )\n    GROUP BY pa.user_id\n  ) x\n  JOIN post_actions pa1 on pa1.id = x.id\n	t	f	1	1	f	t	\N	\N
28	Popular Link	\N	3	0	2016-06-14 16:53:32.548021	2016-06-14 16:53:32.548021	f	t	fa-certificate	t	t	        SELECT tl.user_id, post_id, current_timestamp granted_at\n          FROM topic_links tl\n          JOIN posts p  ON p.id = post_id    AND p.deleted_at IS NULL\n          JOIN topics t ON t.id = p.topic_id AND t.deleted_at IS NULL AND t.archetype <> 'private_message'\n         WHERE NOT tl.internal\n           AND tl.clicks >= 50\n      GROUP BY tl.user_id, tl.post_id\n	t	t	3	0	t	t	\N	\N
29	Hot Link	\N	2	0	2016-06-14 16:53:32.550242	2016-06-14 16:53:32.550242	f	t	fa-certificate	t	t	        SELECT tl.user_id, post_id, current_timestamp granted_at\n          FROM topic_links tl\n          JOIN posts p  ON p.id = post_id    AND p.deleted_at IS NULL\n          JOIN topics t ON t.id = p.topic_id AND t.deleted_at IS NULL AND t.archetype <> 'private_message'\n         WHERE NOT tl.internal\n           AND tl.clicks >= 300\n      GROUP BY tl.user_id, tl.post_id\n	t	t	3	0	t	t	\N	\N
30	Famous Link	\N	1	0	2016-06-14 16:53:32.553082	2016-06-14 16:53:32.553082	f	t	fa-certificate	t	t	        SELECT tl.user_id, post_id, current_timestamp granted_at\n          FROM topic_links tl\n          JOIN posts p  ON p.id = post_id    AND p.deleted_at IS NULL\n          JOIN topics t ON t.id = p.topic_id AND t.deleted_at IS NULL AND t.archetype <> 'private_message'\n         WHERE NOT tl.internal\n           AND tl.clicks >= 1000\n      GROUP BY tl.user_id, tl.post_id\n	t	t	3	0	t	t	\N	\N
38	Thank You	\N	3	0	2016-06-14 16:53:32.563284	2016-06-14 16:53:32.563284	f	f	fa-heart	t	f	      SELECT us.user_id, current_timestamp AS granted_at\n      FROM user_stats AS us\n      INNER JOIN posts AS p ON p.user_id = us.user_id\n      WHERE p.like_count > 0\n        AND us.likes_given >= 10\n        AND (:backfill OR us.user_id IN (:user_ids))\n      GROUP BY us.user_id, us.likes_given\n      HAVING COUNT(*) > 20\n	t	f	2	0	f	t	\N	\N
32	Gives Back	\N	2	0	2016-06-14 16:53:32.565676	2016-06-14 16:53:32.565676	f	f	fa-heart	t	f	      SELECT us.user_id, current_timestamp AS granted_at\n      FROM user_stats AS us\n      INNER JOIN posts AS p ON p.user_id = us.user_id\n      WHERE p.like_count > 0\n        AND us.likes_given >= 100\n        AND (:backfill OR us.user_id IN (:user_ids))\n      GROUP BY us.user_id, us.likes_given\n      HAVING COUNT(*) > 100\n	t	f	2	0	f	t	\N	\N
39	Empathetic	\N	1	0	2016-06-14 16:53:32.567948	2016-06-14 16:53:32.567948	f	f	fa-heart	t	f	      SELECT us.user_id, current_timestamp AS granted_at\n      FROM user_stats AS us\n      INNER JOIN posts AS p ON p.user_id = us.user_id\n      WHERE p.like_count > 0\n        AND us.likes_given >= 1000\n        AND (:backfill OR us.user_id IN (:user_ids))\n      GROUP BY us.user_id, us.likes_given\n      HAVING COUNT(*) > 500\n	t	f	2	0	f	t	\N	\N
33	Out of Love	\N	3	0	2016-06-14 16:53:32.57036	2016-06-14 16:53:32.57036	f	f	fa-heart	t	f	      SELECT gdl.user_id, current_timestamp AS granted_at\n      FROM given_daily_likes AS gdl\n      WHERE gdl.limit_reached\n        AND (:backfill OR gdl.user_id IN (:user_ids))\n      GROUP BY gdl.user_id\n      HAVING COUNT(*) >= 1\n	t	f	2	0	f	t	\N	\N
34	Higher Love	\N	2	0	2016-06-14 16:53:32.572692	2016-06-14 16:53:32.572692	f	f	fa-heart	t	f	      SELECT gdl.user_id, current_timestamp AS granted_at\n      FROM given_daily_likes AS gdl\n      WHERE gdl.limit_reached\n        AND (:backfill OR gdl.user_id IN (:user_ids))\n      GROUP BY gdl.user_id\n      HAVING COUNT(*) >= 5\n	t	f	2	0	f	t	\N	\N
35	Crazy in Love	\N	1	0	2016-06-14 16:53:32.575068	2016-06-14 16:53:32.575068	f	f	fa-heart	t	f	      SELECT gdl.user_id, current_timestamp AS granted_at\n      FROM given_daily_likes AS gdl\n      WHERE gdl.limit_reached\n        AND (:backfill OR gdl.user_id IN (:user_ids))\n      GROUP BY gdl.user_id\n      HAVING COUNT(*) >= 20\n	t	f	2	0	f	t	\N	\N
40	First Mention	\N	3	0	2016-06-14 16:53:32.577574	2016-06-14 16:53:32.577574	f	f	fa-certificate	t	t	  SELECT acting_user_id AS user_id, min(target_post_id) AS post_id, min(p.created_at) AS granted_at\n  FROM user_actions\n  JOIN posts p ON p.id = target_post_id\n  JOIN topics t ON t.id = topic_id\n  JOIN categories c on c.id = category_id\n  WHERE action_type = 7\n    AND NOT read_restricted\n    AND p.deleted_at IS  NULL\n    AND t.deleted_at IS  NULL\n    AND t.visible\n    AND t.archetype <> 'private_message'\n    AND (:backfill OR p.id IN (:post_ids))\n  GROUP BY acting_user_id\n	t	t	1	2	t	t	\N	\N
42	First Onebox	\N	3	0	2016-06-14 16:53:32.582863	2016-06-14 16:53:32.582863	f	f	fa-certificate	t	t	\N	t	t	1	16	t	t	\N	\N
43	First Reply By Email	\N	3	0	2016-06-14 16:53:32.585299	2016-06-14 16:53:32.585299	f	f	fa-certificate	t	t	\N	t	t	1	16	t	t	\N	\N
41	First Emoji	\N	3	1	2016-06-14 16:53:32.580448	2016-06-14 16:53:32.580448	f	f	fa-certificate	t	t	\N	t	t	1	16	t	t	\N	\N
1	Basic User	\N	3	0	2016-06-14 16:53:32.481775	2016-06-14 17:01:37.123189	f	f	fa-user	t	f	\n  SELECT u.id user_id, current_timestamp granted_at FROM users u\n  WHERE trust_level >= 1 AND (\n    :backfill OR u.id IN (:user_ids)\n  )\n	t	t	4	4	f	t	\N	\N
2	Member	\N	3	0	2016-06-14 16:53:32.485578	2016-06-14 17:01:37.12734	f	f	fa-user	t	f	\n  SELECT u.id user_id, current_timestamp granted_at FROM users u\n  WHERE trust_level >= 2 AND (\n    :backfill OR u.id IN (:user_ids)\n  )\n	t	t	4	4	f	t	\N	\N
3	Regular	\N	2	0	2016-06-14 16:53:32.487919	2016-06-14 17:01:37.14051	t	f	fa-user	t	f	\n  SELECT u.id user_id, current_timestamp granted_at FROM users u\n  WHERE trust_level >= 3 AND (\n    :backfill OR u.id IN (:user_ids)\n  )\n	t	t	4	4	f	t	\N	\N
4	Leader	\N	1	0	2016-06-14 16:53:32.490149	2016-06-14 17:01:37.143093	t	f	fa-user	t	f	\n  SELECT u.id user_id, current_timestamp granted_at FROM users u\n  WHERE trust_level >= 4 AND (\n    :backfill OR u.id IN (:user_ids)\n  )\n	t	t	4	4	f	t	\N	\N
17	Reader	\N	3	0	2016-06-14 16:53:32.492437	2016-06-14 17:01:37.145753	f	f	fa-certificate	t	f	  SELECT id user_id, current_timestamp granted_at\n  FROM users\n  WHERE id IN\n  (\n    SELECT pt.user_id\n    FROM post_timings pt\n    JOIN badge_posts b ON b.post_number = pt.post_number AND\n                          b.topic_id = pt.topic_id\n    JOIN topics t ON t.id = pt.topic_id\n    LEFT JOIN user_badges ub ON ub.badge_id = 17 AND ub.user_id = pt.user_id\n    WHERE ub.id IS NULL AND t.posts_count > 100\n    GROUP BY pt.user_id, pt.topic_id, t.posts_count\n    HAVING count(*) >= t.posts_count\n  )\n	t	f	1	\N	f	t	\N	\N
16	Read Guidelines	\N	3	0	2016-06-14 16:53:32.494639	2016-06-14 17:01:37.148316	f	f	fa-certificate	t	f	  SELECT user_id, read_faq granted_at\n  FROM user_stats\n  WHERE read_faq IS NOT NULL AND (user_id IN (:user_ids) OR :backfill)\n	t	t	1	8	f	t	\N	\N
14	First Link	\N	3	0	2016-06-14 16:53:32.497059	2016-06-14 17:01:37.151118	f	f	fa-certificate	t	t	  SELECT l.user_id, l.post_id, l.created_at granted_at\n  FROM\n  (\n    SELECT MIN(l1.id) id\n    FROM topic_links l1\n    JOIN badge_posts p1 ON p1.id = l1.post_id\n    JOIN badge_posts p2 ON p2.id = l1.link_post_id\n    WHERE NOT reflection AND p1.topic_id <> p2.topic_id AND not quote AND\n      (:backfill OR ( p1.id in (:post_ids) ))\n    GROUP BY l1.user_id\n  ) ids\n  JOIN topic_links l ON l.id = ids.id\n	t	t	1	2	t	t	\N	\N
15	First Quote	\N	3	0	2016-06-14 16:53:32.499826	2016-06-14 17:01:37.153594	f	f	fa-certificate	t	t	  SELECT ids.user_id, q.post_id, q.created_at granted_at\n  FROM\n  (\n    SELECT p1.user_id, MIN(q1.id) id\n    FROM quoted_posts q1\n    JOIN badge_posts p1 ON p1.id = q1.post_id\n    JOIN badge_posts p2 ON p2.id = q1.quoted_post_id\n    WHERE (:backfill OR ( p1.id IN (:post_ids) ))\n    GROUP BY p1.user_id\n  ) ids\n  JOIN quoted_posts q ON q.id = ids.id\n	t	t	1	2	t	t	\N	\N
11	First Like	\N	3	0	2016-06-14 16:53:32.502461	2016-06-14 17:01:37.156063	f	f	fa-certificate	t	t	  SELECT pa1.user_id, pa1.created_at granted_at, pa1.post_id\n  FROM (\n    SELECT pa.user_id, min(pa.id) id\n    FROM post_actions pa\n    JOIN badge_posts p on p.id = pa.post_id\n    WHERE post_action_type_id = 2 AND\n      (:backfill OR pa.post_id IN (:post_ids) )\n    GROUP BY pa.user_id\n  ) x\n  JOIN post_actions pa1 on pa1.id = x.id\n	t	t	1	1	t	t	\N	\N
25	Promoter	\N	3	0	2016-06-14 16:53:32.50714	2016-06-14 17:01:37.16018	f	f	fa-user-plus	t	f	\n  SELECT u.id user_id, current_timestamp granted_at\n  FROM users u\n  WHERE u.id IN (\n    SELECT invited_by_id\n    FROM invites i\n    JOIN users u2 ON u2.id = i.user_id\n    WHERE i.deleted_at IS NULL AND u2.active AND u2.trust_level >= 0 AND not u2.blocked\n    GROUP BY invited_by_id\n    HAVING COUNT(*) >= 1\n  ) AND u.active AND NOT u.blocked AND u.id > 0 AND\n    (:backfill OR u.id IN (:user_ids) )\n	t	t	2	0	f	t	\N	\N
26	Campaigner	\N	2	0	2016-06-14 16:53:32.509483	2016-06-14 17:01:37.162598	f	f	fa-user-plus	t	f	\n  SELECT u.id user_id, current_timestamp granted_at\n  FROM users u\n  WHERE u.id IN (\n    SELECT invited_by_id\n    FROM invites i\n    JOIN users u2 ON u2.id = i.user_id\n    WHERE i.deleted_at IS NULL AND u2.active AND u2.trust_level >= 1 AND not u2.blocked\n    GROUP BY invited_by_id\n    HAVING COUNT(*) >= 3\n  ) AND u.active AND NOT u.blocked AND u.id > 0 AND\n    (:backfill OR u.id IN (:user_ids) )\n	t	t	2	0	f	t	\N	\N
27	Champion	\N	1	0	2016-06-14 16:53:32.511867	2016-06-14 17:01:37.165137	f	f	fa-user-plus	t	f	\n  SELECT u.id user_id, current_timestamp granted_at\n  FROM users u\n  WHERE u.id IN (\n    SELECT invited_by_id\n    FROM invites i\n    JOIN users u2 ON u2.id = i.user_id\n    WHERE i.deleted_at IS NULL AND u2.active AND u2.trust_level >= 2 AND not u2.blocked\n    GROUP BY invited_by_id\n    HAVING COUNT(*) >= 5\n  ) AND u.active AND NOT u.blocked AND u.id > 0 AND\n    (:backfill OR u.id IN (:user_ids) )\n	t	t	2	0	f	t	\N	\N
12	First Share	\N	3	0	2016-06-14 16:53:32.514251	2016-06-14 17:01:37.167737	f	f	fa-certificate	t	t	  SELECT views.user_id, i2.post_id, i2.created_at granted_at\n  FROM\n  (\n    SELECT i.user_id, MIN(i.id) i_id\n    FROM incoming_links i\n    JOIN badge_posts p on p.id = i.post_id\n    WHERE i.user_id IS NOT NULL\n    GROUP BY i.user_id\n  ) as views\n  JOIN incoming_links i2 ON i2.id = views.i_id\n	t	t	1	0	t	t	\N	\N
21	Nice Share	\N	3	0	2016-06-14 16:53:32.516608	2016-06-14 17:01:37.170347	f	t	fa-certificate	t	t	  SELECT views.user_id, i2.post_id, current_timestamp granted_at\n  FROM\n  (\n    SELECT i.user_id, MIN(i.id) i_id\n    FROM incoming_links i\n    JOIN badge_posts p on p.id = i.post_id\n    WHERE i.user_id IS NOT NULL\n    GROUP BY i.user_id,i.post_id\n    HAVING COUNT(*) > 25\n  ) as views\n  JOIN incoming_links i2 ON i2.id = views.i_id\n	t	t	2	0	t	t	\N	\N
22	Good Share	\N	2	0	2016-06-14 16:53:32.518921	2016-06-14 17:01:37.172926	f	t	fa-certificate	t	t	  SELECT views.user_id, i2.post_id, current_timestamp granted_at\n  FROM\n  (\n    SELECT i.user_id, MIN(i.id) i_id\n    FROM incoming_links i\n    JOIN badge_posts p on p.id = i.post_id\n    WHERE i.user_id IS NOT NULL\n    GROUP BY i.user_id,i.post_id\n    HAVING COUNT(*) > 300\n  ) as views\n  JOIN incoming_links i2 ON i2.id = views.i_id\n	t	t	2	0	t	t	\N	\N
23	Great Share	\N	1	0	2016-06-14 16:53:32.521206	2016-06-14 17:01:37.175353	f	t	fa-certificate	t	t	  SELECT views.user_id, i2.post_id, current_timestamp granted_at\n  FROM\n  (\n    SELECT i.user_id, MIN(i.id) i_id\n    FROM incoming_links i\n    JOIN badge_posts p on p.id = i.post_id\n    WHERE i.user_id IS NOT NULL\n    GROUP BY i.user_id,i.post_id\n    HAVING COUNT(*) > 1000\n  ) as views\n  JOIN incoming_links i2 ON i2.id = views.i_id\n	t	t	2	0	t	t	\N	\N
5	Welcome	\N	3	0	2016-06-14 16:53:32.523428	2016-06-14 17:01:37.177659	f	f	fa-certificate	t	t	  SELECT p.user_id, min(post_id) post_id, min(pa.created_at) granted_at\n  FROM post_actions pa\n  JOIN badge_posts p on p.id = pa.post_id\n  WHERE post_action_type_id = 2 AND\n      (:backfill OR pa.post_id IN (:post_ids) )\n  GROUP BY p.user_id\n	t	t	2	1	t	t	\N	\N
9	Autobiographer	\N	3	0	2016-06-14 16:53:32.526003	2016-06-14 17:01:37.179861	f	f	fa-certificate	t	f	  SELECT u.id user_id, current_timestamp granted_at\n  FROM users u\n  JOIN user_profiles up on u.id = up.user_id\n  WHERE bio_raw IS NOT NULL AND LENGTH(TRIM(bio_raw)) > 10 AND\n        uploaded_avatar_id IS NOT NULL AND\n        (:backfill OR u.id IN (:user_ids) )\n	t	t	1	8	f	t	\N	\N
6	Nice Post	\N	3	0	2016-06-14 16:53:32.531329	2016-06-14 17:01:37.183912	f	t	fa-certificate	t	t	\n  SELECT p.user_id, p.id post_id, p.updated_at granted_at\n  FROM badge_posts p\n  WHERE p.post_number > 1 AND p.like_count >= 10 AND\n    (:backfill OR p.id IN (:post_ids) )\n	t	t	3	1	t	t	\N	\N
7	Good Post	\N	2	0	2016-06-14 16:53:32.533826	2016-06-14 17:01:37.18642	f	t	fa-certificate	t	t	\n  SELECT p.user_id, p.id post_id, p.updated_at granted_at\n  FROM badge_posts p\n  WHERE p.post_number > 1 AND p.like_count >= 25 AND\n    (:backfill OR p.id IN (:post_ids) )\n	t	t	3	1	t	t	\N	\N
8	Great Post	\N	1	0	2016-06-14 16:53:32.536324	2016-06-14 17:01:37.188779	f	t	fa-certificate	t	t	\n  SELECT p.user_id, p.id post_id, p.updated_at granted_at\n  FROM badge_posts p\n  WHERE p.post_number > 1 AND p.like_count >= 50 AND\n    (:backfill OR p.id IN (:post_ids) )\n	t	t	3	1	t	t	\N	\N
18	Nice Topic	\N	3	0	2016-06-14 16:53:32.538548	2016-06-14 17:01:37.191015	f	t	fa-certificate	t	t	\n  SELECT p.user_id, p.id post_id, p.updated_at granted_at\n  FROM badge_posts p\n  WHERE p.post_number = 1 AND p.like_count >= 10 AND\n    (:backfill OR p.id IN (:post_ids) )\n	t	t	3	1	t	t	\N	\N
19	Good Topic	\N	2	0	2016-06-14 16:53:32.540891	2016-06-14 17:01:37.193696	f	t	fa-certificate	t	t	\n  SELECT p.user_id, p.id post_id, p.updated_at granted_at\n  FROM badge_posts p\n  WHERE p.post_number = 1 AND p.like_count >= 25 AND\n    (:backfill OR p.id IN (:post_ids) )\n	t	t	3	1	t	t	\N	\N
20	Great Topic	\N	1	0	2016-06-14 16:53:32.543213	2016-06-14 17:01:37.196489	f	t	fa-certificate	t	t	\n  SELECT p.user_id, p.id post_id, p.updated_at granted_at\n  FROM badge_posts p\n  WHERE p.post_number = 1 AND p.like_count >= 50 AND\n    (:backfill OR p.id IN (:post_ids) )\n	t	t	3	1	t	t	\N	\N
24	Anniversary	\N	2	0	2016-06-14 16:53:32.545736	2016-06-14 17:01:37.198962	f	f	fa-clock-o	t	f	  SELECT u.id AS user_id, MIN(u.created_at + interval '1 year') AS granted_at\n    FROM users u\n    JOIN posts p ON p.user_id = u.id\n   WHERE u.id > 0\n     AND u.active\n     AND NOT u.blocked\n     AND u.created_at + interval '1 year' < now()\n     AND p.deleted_at IS NULL\n     AND NOT p.hidden\n     AND p.created_at + interval '1 year' > now()\n     AND (:backfill OR u.id IN (:user_ids))\n   GROUP BY u.id\n   HAVING COUNT(p.id) > 0\n	t	f	2	0	f	t	\N	\N
36	Appreciated	\N	3	0	2016-06-14 16:53:32.55577	2016-06-14 17:01:37.206466	f	f	fa-heart	t	f	      SELECT p.user_id, current_timestamp AS granted_at\n      FROM posts AS p\n      WHERE p.like_count >= 1\n        AND (:backfill OR p.user_id IN (:user_ids))\n      GROUP BY p.user_id\n      HAVING count(*) > 20\n	t	f	2	0	f	t	\N	\N
37	Respected	\N	2	0	2016-06-14 16:53:32.558618	2016-06-14 17:01:37.209115	f	f	fa-heart	t	f	      SELECT p.user_id, current_timestamp AS granted_at\n      FROM posts AS p\n      WHERE p.like_count >= 2\n        AND (:backfill OR p.user_id IN (:user_ids))\n      GROUP BY p.user_id\n      HAVING count(*) > 100\n	t	f	2	0	f	t	\N	\N
31	Admired	\N	1	0	2016-06-14 16:53:32.560961	2016-06-14 17:01:37.211419	f	f	fa-heart	t	f	      SELECT p.user_id, current_timestamp AS granted_at\n      FROM posts AS p\n      WHERE p.like_count >= 5\n        AND (:backfill OR p.user_id IN (:user_ids))\n      GROUP BY p.user_id\n      HAVING count(*) > 300\n	t	f	2	0	f	t	\N	\N
\.


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('badges_id_seq', 44, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY categories (id, name, color, topic_id, topic_count, created_at, updated_at, user_id, topics_year, topics_month, topics_week, slug, description, text_color, read_restricted, auto_close_hours, post_count, latest_post_id, latest_topic_id, "position", parent_category_id, posts_year, posts_month, posts_week, email_in, email_in_allow_strangers, topics_day, posts_day, logo_url, background_url, allow_badges, name_lower, auto_close_based_on_last_post, topic_template, suppress_from_homepage, contains_messages) FROM stdin;
1	Uncategorized	AB9364	\N	1	2016-06-14 16:53:29.312702	2016-06-14 16:59:58.008112	-1	1	1	1	uncategorized		FFFFFF	f	\N	1	11	8	0	\N	1	1	1	\N	f	1	1	\N	\N	t	uncategorized	f	\N	f	\N
2	Lounge	EEEEEE	1	1	2016-06-14 16:53:29.553259	2016-06-14 16:59:58.026083	-1	1	1	1	lounge	A category exclusive to members with trust level 3 and higher.	652D90	t	\N	1	12	9	3	\N	1	1	1	\N	f	1	1	\N	\N	t	lounge	f	\N	f	\N
4	Staff	283890	3	5	2016-06-14 16:53:29.735091	2016-06-14 16:59:58.051133	-1	5	5	5	staff	Private category for staff discussions. Topics are only visible to admins and moderators.	FFFFFF	t	\N	8	13	10	2	\N	8	8	8	\N	f	5	8	\N	\N	t	staff	f	\N	f	\N
5	ckan	AB9364	12	1	2016-06-15 08:17:58.69146	2016-06-15 08:17:58.69146	4	0	0	0	ckan	\N	FFFFFF	f	\N	0	19	15	4	\N	0	0	0	\N	f	0	0	\N	\N	t	ckan	f	\N	f	\N
3	Site Feedback	808281	2	0	2016-06-14 16:53:29.629523	2016-06-14 16:59:57.978286	-1	0	0	0	site-feedback	Discussion about this site, its organization, how it works, and how we can improve it.	FFFFFF	f	\N	0	2	2	1	\N	0	0	0	\N	f	0	0	\N	\N	t	site feedback	f	\N	f	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('categories_id_seq', 5, true);


--
-- Data for Name: category_custom_fields; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY category_custom_fields (id, category_id, name, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: category_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('category_custom_fields_id_seq', 1, false);


--
-- Data for Name: category_featured_topics; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY category_featured_topics (category_id, topic_id, created_at, updated_at, rank, id) FROM stdin;
1	8	2016-06-14 16:53:34.358239	2016-06-14 16:53:34.358239	0	13
2	9	2016-06-14 16:53:34.434323	2016-06-14 16:53:34.434323	0	14
4	10	2016-06-14 16:53:34.534088	2016-06-14 16:53:34.534088	0	15
4	7	2016-06-14 16:53:34.53561	2016-06-14 16:53:34.53561	1	16
4	6	2016-06-14 16:53:34.578142	2016-06-14 16:53:34.578142	2	17
5	15	2016-06-15 08:52:08.431832	2016-06-15 08:52:08.431832	0	18
\.


--
-- Name: category_featured_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('category_featured_topics_id_seq', 18, true);


--
-- Data for Name: category_featured_users; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY category_featured_users (id, category_id, user_id, created_at, updated_at) FROM stdin;
1	1	-1	2016-06-14 17:13:04.8115	2016-06-14 17:13:04.8115
2	2	-1	2016-06-14 17:13:04.822174	2016-06-14 17:13:04.822174
3	3	-1	2016-06-14 17:13:04.831108	2016-06-14 17:13:04.831108
4	4	-1	2016-06-14 17:13:04.839316	2016-06-14 17:13:04.839316
8	5	6	2016-06-15 09:07:51.321789	2016-06-15 09:07:51.321789
9	5	5	2016-06-15 09:07:51.322955	2016-06-15 09:07:51.322955
10	5	4	2016-06-15 09:07:51.323757	2016-06-15 09:07:51.323757
\.


--
-- Name: category_featured_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('category_featured_users_id_seq', 10, true);


--
-- Data for Name: category_groups; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY category_groups (id, category_id, group_id, created_at, updated_at, permission_type) FROM stdin;
1	2	13	2016-06-14 16:53:32.869816	2016-06-14 16:53:32.869816	1
2	4	3	2016-06-14 16:53:33.373585	2016-06-14 16:53:33.373585	1
\.


--
-- Name: category_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('category_groups_id_seq', 2, true);


--
-- Data for Name: category_search_data; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY category_search_data (category_id, search_data, raw_data, locale) FROM stdin;
5	'ckan':1	ckan	en
\.


--
-- Data for Name: category_tag_groups; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY category_tag_groups (id, category_id, tag_group_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: category_tag_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('category_tag_groups_id_seq', 1, false);


--
-- Data for Name: category_tags; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY category_tags (id, category_id, tag_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: category_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('category_tags_id_seq', 1, false);


--
-- Data for Name: category_users; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY category_users (id, category_id, user_id, notification_level) FROM stdin;
\.


--
-- Name: category_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('category_users_id_seq', 1, false);


--
-- Data for Name: color_scheme_colors; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY color_scheme_colors (id, name, hex, color_scheme_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: color_scheme_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('color_scheme_colors_id_seq', 1, false);


--
-- Data for Name: color_schemes; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY color_schemes (id, name, enabled, versioned_id, version, created_at, updated_at) FROM stdin;
\.


--
-- Name: color_schemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('color_schemes_id_seq', 1, false);


--
-- Data for Name: digest_unsubscribe_keys; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY digest_unsubscribe_keys (key, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: directory_items; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY directory_items (id, period_type, user_id, likes_received, likes_given, topics_entered, topic_count, post_count, created_at, updated_at, days_visited, posts_read) FROM stdin;
1	5	5	0	0	0	1	0	\N	\N	1	0
2	5	6	0	0	1	0	1	\N	\N	1	1
3	5	4	0	0	0	1	0	\N	\N	1	0
\.


--
-- Name: directory_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('directory_items_id_seq', 3, true);


--
-- Data for Name: draft_sequences; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY draft_sequences (id, user_id, draft_key, sequence) FROM stdin;
1	5	new_topic	1
2	5	topic_15	1
3	6	topic_15	2
\.


--
-- Name: draft_sequences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('draft_sequences_id_seq', 3, true);


--
-- Data for Name: drafts; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY drafts (id, user_id, draft_key, data, created_at, updated_at, sequence, revisions) FROM stdin;
\.


--
-- Name: drafts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('drafts_id_seq', 2, true);


--
-- Data for Name: email_change_requests; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY email_change_requests (id, user_id, old_email, new_email, old_email_token_id, new_email_token_id, change_state, created_at, updated_at) FROM stdin;
\.


--
-- Name: email_change_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('email_change_requests_id_seq', 1, false);


--
-- Data for Name: email_logs; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY email_logs (id, to_address, email_type, user_id, created_at, updated_at, reply_key, post_id, topic_id, skipped, skipped_reason, bounce_key, bounced, message_id) FROM stdin;
1	no_email_found	signup	1	2016-06-15 08:01:38.136914	2016-06-15 08:01:38.136914	\N	\N	\N	t	[UserEmail] Can't find user with id 1	\N	f	\N
2	be-staff@liip.ch	signup	4	2016-06-15 08:17:01.297423	2016-06-15 08:17:01.297423	\N	\N	\N	f	\N	\N	f	af97e02d-60d7-46e6-8211-c2e81e2ec347@discourse.ogdch.dev
3	no_email_found	signup	3	2016-06-15 08:17:32.802305	2016-06-15 08:17:32.802305	\N	\N	\N	t	[UserEmail] Can't find user with id 3	\N	f	\N
4	be-staff@liip.ch	user_private_message	4	2016-06-15 08:17:32.825867	2016-06-15 08:17:32.825867	\N	14	\N	t	[UserEmail] User was seen recently	\N	f	\N
5	ckan@liip.ch	signup	5	2016-06-15 08:19:28.574622	2016-06-15 08:19:28.574622	\N	\N	\N	f	\N	\N	f	c8aa45da-cf27-4c2b-a7d9-2874bae5d43d@discourse.ogdch.dev
6	ckan@liip.ch	user_private_message	5	2016-06-15 08:20:11.374559	2016-06-15 08:20:11.374559	\N	16	\N	t	[UserEmail] User was seen recently	\N	f	\N
7	jazz@liip.ch	user_private_message	6	2016-06-15 08:22:52.072974	2016-06-15 08:22:52.072974	\N	17	\N	t	[UserEmail] Benutzer war kürzlich online	\N	f	\N
8	no_email_found	signup	2	2016-06-15 08:26:33.539785	2016-06-15 08:26:33.539785	\N	\N	\N	t	[UserEmail] Kann Benutzer mit ID 2 nicht finden 	\N	f	\N
\.


--
-- Name: email_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('email_logs_id_seq', 8, true);


--
-- Data for Name: email_tokens; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY email_tokens (id, user_id, email, token, confirmed, expired, created_at, updated_at) FROM stdin;
1	-1	no_email	88d3c17f181f2807dc009ab1ef0de0bd	f	t	2016-06-14 16:53:32.751321	2016-06-14 16:53:32.751321
2	1	be-staff@liip.ch	93c4b3f55bae4ece0df41361e7c3103d	f	f	2016-06-15 07:55:50.823211	2016-06-15 07:55:50.823211
3	2	be-staff@liip.ch	74d121a5727458f84219493814abcdd8	f	f	2016-06-15 08:00:12.725093	2016-06-15 08:00:12.725093
4	3	be-staff@liip.ch	cae622884654c0c9da1aebb85c97369f	f	f	2016-06-15 08:14:42.918834	2016-06-15 08:14:42.918834
5	4	be-staff@liip.ch	4ce54c4644ed13344a27ad730b32d990	t	f	2016-06-15 08:17:01.249724	2016-06-15 08:17:01.249724
6	5	ckan@liip.ch	675ab0f98445461b551632f6ab9fd1bf	t	f	2016-06-15 08:19:28.432887	2016-06-15 08:19:28.432887
7	6	jazz@liip.ch	b5e77808dee48e67bfacf0cec8798a61	f	f	2016-06-15 08:22:18.26206	2016-06-15 08:22:18.26206
\.


--
-- Name: email_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('email_tokens_id_seq', 7, true);


--
-- Data for Name: embeddable_hosts; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY embeddable_hosts (id, host, category_id, created_at, updated_at) FROM stdin;
1	ogdch.dev	5	2016-06-15 08:18:49.783234	2016-06-15 08:18:49.783234
\.


--
-- Name: embeddable_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('embeddable_hosts_id_seq', 1, true);


--
-- Data for Name: facebook_user_infos; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY facebook_user_infos (id, user_id, facebook_user_id, username, first_name, last_name, email, gender, name, link, created_at, updated_at) FROM stdin;
\.


--
-- Name: facebook_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('facebook_user_infos_id_seq', 1, false);


--
-- Data for Name: github_user_infos; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY github_user_infos (id, user_id, screen_name, github_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: github_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('github_user_infos_id_seq', 1, false);


--
-- Data for Name: given_daily_likes; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY given_daily_likes (user_id, likes_given, given_date, limit_reached) FROM stdin;
\.


--
-- Data for Name: google_user_infos; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY google_user_infos (id, user_id, google_user_id, first_name, last_name, email, gender, name, link, profile_link, picture, created_at, updated_at) FROM stdin;
\.


--
-- Name: google_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('google_user_infos_id_seq', 1, false);


--
-- Data for Name: group_archived_messages; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY group_archived_messages (id, group_id, topic_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: group_archived_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('group_archived_messages_id_seq', 1, false);


--
-- Data for Name: group_custom_fields; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY group_custom_fields (id, group_id, name, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: group_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('group_custom_fields_id_seq', 1, false);


--
-- Data for Name: group_mentions; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY group_mentions (id, post_id, group_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: group_mentions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('group_mentions_id_seq', 1, false);


--
-- Data for Name: group_users; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY group_users (id, group_id, user_id, created_at, updated_at, owner, notification_level) FROM stdin;
1	10	-1	2016-06-14 16:53:32.804384	2016-06-14 16:53:32.804384	f	2
2	11	-1	2016-06-14 16:53:32.807982	2016-06-14 16:53:32.807982	f	2
3	12	-1	2016-06-14 16:53:32.810786	2016-06-14 16:53:32.810786	f	2
4	13	-1	2016-06-14 16:53:32.813566	2016-06-14 16:53:32.813566	f	2
5	14	-1	2016-06-14 16:53:32.817069	2016-06-14 16:53:32.817069	f	2
6	1	-1	2016-06-14 17:13:05.825139	2016-06-14 17:13:05.825139	f	2
7	2	-1	2016-06-14 17:13:05.834662	2016-06-14 17:13:05.834662	f	2
8	3	-1	2016-06-14 17:13:05.842269	2016-06-14 17:13:05.842269	f	2
9	10	1	2016-06-15 07:55:50.848305	2016-06-15 07:55:50.848305	f	2
10	10	2	2016-06-15 08:00:12.73652	2016-06-15 08:00:12.73652	f	2
11	10	3	2016-06-15 08:14:42.937549	2016-06-15 08:14:42.937549	f	2
12	10	4	2016-06-15 08:17:01.259469	2016-06-15 08:17:01.259469	f	2
13	10	5	2016-06-15 08:19:28.448727	2016-06-15 08:19:28.448727	f	2
14	11	5	2016-06-15 08:19:28.451577	2016-06-15 08:19:28.451577	f	2
15	10	6	2016-06-15 08:22:18.283109	2016-06-15 08:22:18.283109	f	2
16	11	6	2016-06-15 08:22:18.289836	2016-06-15 08:22:18.289836	f	2
\.


--
-- Name: group_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('group_users_id_seq', 16, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY groups (id, name, created_at, updated_at, automatic, user_count, alias_level, visible, automatic_membership_email_domains, automatic_membership_retroactive, primary_group, title, grant_trust_level, incoming_email, has_messages) FROM stdin;
10	trust_level_0	2016-06-14 16:53:32.343824	2016-06-14 16:53:32.343824	t	7	0	t	\N	f	f	\N	\N	\N	f
11	trust_level_1	2016-06-14 16:53:32.351393	2016-06-14 16:53:32.351393	t	3	0	t	\N	f	f	\N	\N	\N	f
0	everyone	2016-06-14 16:53:32.29515	2016-06-14 16:53:32.29515	t	0	0	t	\N	f	f	\N	\N	\N	f
1	admins	2016-06-14 16:53:32.305951	2016-06-14 16:53:32.305951	t	1	0	t	\N	f	f	\N	\N	\N	f
2	moderators	2016-06-14 16:53:32.328213	2016-06-14 16:53:32.328213	t	1	0	t	\N	f	f	\N	\N	\N	f
3	staff	2016-06-14 16:53:32.335953	2016-06-14 16:53:32.335953	t	1	0	t	\N	f	f	\N	\N	\N	f
12	trust_level_2	2016-06-14 16:53:32.35988	2016-06-14 16:53:32.35988	t	1	0	t	\N	f	f	\N	\N	\N	f
13	trust_level_3	2016-06-14 16:53:32.368158	2016-06-14 16:53:32.368158	t	1	0	t	\N	f	f	\N	\N	\N	f
14	trust_level_4	2016-06-14 16:53:32.375654	2016-06-14 16:53:32.375654	t	1	0	t	\N	f	f	\N	\N	\N	f
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('groups_id_seq', 40, true);


--
-- Data for Name: incoming_domains; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY incoming_domains (id, name, https, port) FROM stdin;
\.


--
-- Name: incoming_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('incoming_domains_id_seq', 1, false);


--
-- Data for Name: incoming_emails; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY incoming_emails (id, user_id, topic_id, post_id, raw, error, message_id, from_address, to_addresses, cc_addresses, subject, created_at, updated_at, rejection_message, is_auto_generated, is_bounce) FROM stdin;
\.


--
-- Name: incoming_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('incoming_emails_id_seq', 1, false);


--
-- Data for Name: incoming_links; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY incoming_links (id, created_at, user_id, ip_address, current_user_id, post_id, incoming_referer_id) FROM stdin;
\.


--
-- Name: incoming_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('incoming_links_id_seq', 1, false);


--
-- Data for Name: incoming_referers; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY incoming_referers (id, path, incoming_domain_id) FROM stdin;
\.


--
-- Name: incoming_referers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('incoming_referers_id_seq', 1, false);


--
-- Data for Name: instagram_user_infos; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY instagram_user_infos (id, user_id, screen_name, instagram_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: instagram_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('instagram_user_infos_id_seq', 1, false);


--
-- Data for Name: invited_groups; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY invited_groups (id, group_id, invite_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: invited_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('invited_groups_id_seq', 1, false);


--
-- Data for Name: invites; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY invites (id, invite_key, email, invited_by_id, user_id, redeemed_at, created_at, updated_at, deleted_at, deleted_by_id, invalidated_at) FROM stdin;
\.


--
-- Name: invites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('invites_id_seq', 1, false);


--
-- Data for Name: message_bus; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY message_bus (id, name, context, data, created_at) FROM stdin;
\.


--
-- Name: message_bus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('message_bus_id_seq', 1, false);


--
-- Data for Name: muted_users; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY muted_users (id, user_id, muted_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: muted_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('muted_users_id_seq', 1, false);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY notifications (id, notification_type, user_id, data, read, created_at, updated_at, topic_id, post_number, post_action_id) FROM stdin;
1	12	-1	{"badge_id":41,"badge_name":"First Emoji","badge_slug":"first-emoji","username":"system"}	f	2016-06-14 16:57:40.952347	2016-06-14 16:57:40.952347	\N	\N	\N
2	6	4	{"topic_title":"Welcome to Discourse!","original_post_id":14,"original_post_type":1,"original_username":"system","display_username":"system"}	f	2016-06-15 08:17:10.452005	2016-06-15 08:17:10.452005	11	1	\N
3	6	5	{"topic_title":"Welcome to Discourse!","original_post_id":16,"original_post_type":1,"original_username":"system","display_username":"system"}	f	2016-06-15 08:19:42.571653	2016-06-15 08:19:42.571653	13	1	\N
4	6	6	{"topic_title":"Willkommen bei Discourse!","original_post_id":17,"original_post_type":1,"original_username":"system","display_username":"system"}	f	2016-06-15 08:22:18.670924	2016-06-15 08:22:18.670924	14	1	\N
5	9	5	{"topic_title":"Haltestellen - Datensätze - opendata.swiss","original_post_id":19,"original_post_type":1,"original_username":"liip1","display_username":"liip1"}	f	2016-06-15 09:03:13.380549	2016-06-15 09:03:13.380549	15	2	\N
6	12	6	{"badge_id":10,"badge_name":"Editor","badge_slug":"bearbeiter","username":"liip1"}	f	2016-06-15 09:04:20.876047	2016-06-15 09:04:20.876047	\N	\N	\N
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('notifications_id_seq', 6, true);


--
-- Data for Name: oauth2_user_infos; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY oauth2_user_infos (id, user_id, uid, provider, email, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth2_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('oauth2_user_infos_id_seq', 1, false);


--
-- Data for Name: onceoff_logs; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY onceoff_logs (id, job_name, created_at, updated_at) FROM stdin;
1	GrantFirstReplyByEmail	2016-06-14 16:58:41.074797	2016-06-14 16:58:41.074797
2	GrantEmoji	2016-06-14 16:58:41.105171	2016-06-14 16:58:41.105171
3	MigrateUploadScheme	2016-06-14 16:58:41.115832	2016-06-14 16:58:41.115832
4	MigrateTaggingPlugin	2016-06-14 16:58:41.125641	2016-06-14 16:58:41.125641
5	GrantOnebox	2016-06-14 16:58:41.237213	2016-06-14 16:58:41.237213
\.


--
-- Name: onceoff_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('onceoff_logs_id_seq', 5, true);


--
-- Data for Name: optimized_images; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY optimized_images (id, sha1, extension, width, height, upload_id, url) FROM stdin;
1	711cc6be250a0337010abdefe73359cd90ed47ac	.png	25	25	1	/uploads/default/optimized/1X/8ceafb73e38cfe6dac9f70e5a327874a8b0971e2_1_25x25.png
\.


--
-- Name: optimized_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('optimized_images_id_seq', 1, true);


--
-- Data for Name: permalinks; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY permalinks (id, url, topic_id, post_id, category_id, created_at, updated_at, external_url) FROM stdin;
\.


--
-- Name: permalinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('permalinks_id_seq', 1, false);


--
-- Data for Name: plugin_store_rows; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY plugin_store_rows (id, plugin_name, key, type_name, value) FROM stdin;
\.


--
-- Name: plugin_store_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('plugin_store_rows_id_seq', 1, false);


--
-- Data for Name: post_action_types; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_action_types (name_key, is_flag, icon, created_at, updated_at, id, "position") FROM stdin;
bookmark	f	\N	2016-06-14 16:53:32.392009	2016-06-14 16:53:32.392009	1	1
like	f	heart	2016-06-14 16:53:32.39623	2016-06-14 16:53:32.39623	2	2
off_topic	t	\N	2016-06-14 16:53:32.399033	2016-06-14 16:53:32.399033	3	3
inappropriate	t	\N	2016-06-14 16:53:32.401879	2016-06-14 16:53:32.401879	4	4
vote	f	\N	2016-06-14 16:53:32.404782	2016-06-14 16:53:32.404782	5	5
spam	t	\N	2016-06-14 16:53:32.413271	2016-06-14 16:53:32.413271	8	6
notify_user	t	\N	2016-06-14 16:53:32.416119	2016-06-14 16:53:32.416119	6	7
notify_moderators	t	\N	2016-06-14 16:53:32.418873	2016-06-14 16:53:32.418873	7	8
\.


--
-- Name: post_action_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('post_action_types_id_seq', 9, false);


--
-- Data for Name: post_actions; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_actions (id, post_id, user_id, post_action_type_id, deleted_at, created_at, updated_at, deleted_by_id, related_post_id, staff_took_action, deferred_by_id, targets_topic, agreed_at, agreed_by_id, deferred_at, disagreed_at, disagreed_by_id) FROM stdin;
\.


--
-- Name: post_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('post_actions_id_seq', 1, false);


--
-- Data for Name: post_custom_fields; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_custom_fields (id, post_id, name, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: post_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('post_custom_fields_id_seq', 1, false);


--
-- Data for Name: post_details; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_details (id, post_id, key, value, extra, created_at, updated_at) FROM stdin;
\.


--
-- Name: post_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('post_details_id_seq', 1, false);


--
-- Data for Name: post_replies; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_replies (post_id, reply_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_revisions; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_revisions (id, user_id, post_id, modifications, number, created_at, updated_at, hidden) FROM stdin;
\.


--
-- Name: post_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('post_revisions_id_seq', 1, false);


--
-- Data for Name: post_search_data; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_search_data (post_id, search_data, raw_data, locale) FROM stdin;
1	'3':9 'categori':2,15 'exclus':3 'higher':11 'level':8 'loung':14,16 'member':5 'trust':7	A category exclusive to members with trust level 3 and higher. About the Lounge category Lounge	en
2	'categori':20 'discuss':1 'feedback':19,22 'improv':14 'organ':6 'site':4,18,21 'work':9	Discussion about this site, its organization, how it works, and how we can improve it. About the Site Feedback category Site Feedback	en
3	'admin':11 'categori':2,17 'discuss':5 'moder':13 'privat':1 'staff':4,16,18 'topic':6 'visibl':9	Private category for staff discussions. Topics are only visible to admins and moderators. About the Staff category Staff	en
4	'1':212 '10':1623 '11':1650 '12':1694,2062 '13':209,1789 '14':1869 '15':1972 '16':2102 '17':2212 '18':2267 '2':297 '2013':2628 '3':677 '3.0':693 '31':2627 '4':793 '5':947 '6':992 '7':1186 '8':1324 '9':1490 'abid':986 'accept':70,191,1745,2163 'access':125,131,171,755,1430,1731,1797,1934,2330 'accord':1383,2122,2424,2445 'account':216,221,234,247,261,982,1649,1830 'accur':653,1057 'act':277,294,551,1392 'action':2070,2477 'activ':242 'actual':1944 'ad':1643 'ad-fre':1642 'adapt':2630 'add':1149 'advertis':598,1624,1633 'agent':2236 'agre':141,157,819,984,2215,2573 'agreement':118,122,152,166,1494,1714,1722,1743,1788,1825,1846,1998,2058,2134,2266,2270,2274,2328,2418,2483,2497,2537,2565,2591,2595 'allow':317 'also':1116,1753 'amend':2295 'amount':790,1483,2044 'and/or':655,1760,1776 'annual':828,866,916 'anoth':637 'appli':2094 'applic':889,915,2100,2138,2168,2321 'appoint':2443 'appropri':1408,1439 'arbitr':2428,2442,2450,2464 'area':2158 'aris':2249,2362,2415 'ask':1334 'assign':2560,2586,2614 'attorney':2247,2490 'attribut':690,1651,1660,1672 'attribution-noncommercial-sharealik':689 'audio':364 'author':908,1669,2299 'automat':876,904 'avail':20,201,324,372,432,806,1207 'b':2597 'basi':841 'becom':143 'begin':846 'believ':1052,1352 'benefit':2606 'beyond':2086 'bind':2599 'blog':611 'bond':2412 'boost':538 'bound':144,2576 'breach':265,2540,2556 'brought':2402 'california':2347,2384,2457 'cancel':896,943 'cannot':1004,1018,1197 'card':929 'care':123 'case':352,646,1466 'categor':654 'caus':1812,2068 'cc':2619 'cc-by-sa':2618 'chang':1695,1725,1740,1748 'charg':835 'check':1720 'circumst':1440 'citi':2154 'claim':2243,2387,2394 'code':652 'collect':116,911 'commerci':527 'common':688 'communiti':97,2130 'compani':11,31,35,41,57,60,91,113,188,214,252,268,640,672,704,716,730,738,771,777,822,881,961,997,1034,1157,1215,1222,1224,1236,1257,1262,1303,1319,1331,1361,1379,1385,1395,1422,1459,1470,1487,1499,1505,1532,1535,1538,1541,1557,1568,1572,1615,1625,1652,1666,1683,1696,1749,1791,1828,1879,1914,1980,2053,2071,2125,2221,2276,2302,2310,2582 'compet':2405 'compli':462 'comprehens':2427 'comput':367,651,1011,1076,1204,1290 'concern':2281 'condit':5,79,149,163,182,968,991,1153,1785,2534,2552,2581,2593 'conduct':2161 'conflict':2351 'connect':1555,1586 'consent':2570 'consequenti':2017 'consid':184 'constitut':360,1744,2271 'constru':2507 'contain':80,493,523,575,1092,1105,1117 'content':16,333,340,348,357,371,385,434,458,472,490,507,509,528,569,594,621,648,679,727,1026,1088,1093,1104,1183,1187,1247,1302,1636,1675,1960,2164 'continu':1727,1938 'contract':2001 'contractor':2225 'contribut':682 'contributor':300 'control':1231,2089 'copi':380,1141 'copyright':398,1325,1365,1391,1452 'corrupt':2037 'cost':2021,2488 'counti':2383 'countri':2152,2179,2187 'court':2378,2406,2471 'cover':854 'creat':219,418 'creativ':687 'credit':928,1680 'damag':284,2018 'data':2039,2175 'day':844 'decis':2465 'delay':2082 'deni':754 'describ':656 'design':529 'destruct':506,1087,1301 'determin':1444 'digit':1389 'director':2232 'disabl':1415 'disclaim':1160,1306,1863,1870,1888 'discontinu':1838 'discret':721,776,1705,1969 'display':1632,1659 'disput':2361,2414 'dmca':1328,1393 'document':2616 'domain':12,32,36,42,92,215,1216,1223,1237,1258,1320,1362,1539,1542,1558,1667,1684,1829 'done':475 'download':379,1140,1178,1955 'drive':531 'due':2083 'e':2598 'effect':662,1029,1817,2524 'either':421,2528 'electron':601 'email':609 'employ':411,427,447 'employe':2234 'encourag':1376 'end':484,886 'endors':1044,1272 'enforc':2468,2481 'engin':541 'english':2460 'entir':336,2273 'entiti':766 'entitl':2486 'equit':2009,2391 'error':1112,1930 'event':1978 'exceed':2046 'except':2317,2385 'exclud':2349 'execut':2300 'expens':2245 'export':2176 'express':1894 'expressli':193 'extent':2097,2320 'failur':2080 'featur':1761,1775 'feder':2377 'fee':830,872,920,2048,2248,2491 'file':365 'final':2421 'fit':1904 'follow':2,1735 'font':1671 'footer':1676,1679 'forc':2522 'forego':2091 'forum':33,38 'francisco':2382,2456 'free':1644,1931 'full':58,2521 'fulli':238,461 'futur':1756 'general':797,2103 'generat':519 'get':597 'govern':6,2339 'government':2157 'grant':1603 'graphic':362,1550,1581 'guidelin':98,2131 'harm':344,504,747,1062,1085,1165,1299,1311 'harmless':2220 'held':2499 'herebi':1887 'herein':81 'hereof':2285 'hold':2219 'hors':501,1082,1296 'host':43,45,949,953 'hosting/support':978 'ii':443,751,2019,2193 'iii':2029 'immedi':250,1818 'impli':1041,1269,1896 'inaccuraci':1107 'inc':2438 'incident':2015 'incit':578 'includ':26,88,282,392,435,650,1010,1203,1404,1765,1857,1897,2142,2166,2246,2257 'incur':288 'indec':1097 'indemn':1864 'indemnif':2213 'indemnifi':2217 'indic':831,870 'individu':204,764 'infring':388,1127,1326,1412,1420,1449,1912,2201 'injunct':2389 'instal':495 'instanc':2545 'intellectu':415,1129,1339,1345,1455,1491,1511,2205,2396 'intent':2513 'interest':1518 'interrupt':2031 'inur':2603 'invalid':2500 'ition':1150 'iv':2041 'jam':2439 'judici':2432 'kind':287,1893 'languag':2461 'last':2624 'law':2101,2139,2147,2169,2322,2342,2353 'least':208 'legal':2007 'liabil':1868,1975,2004,2077 'liabl':274,1989 'licens':468,680,684,695,1608 'licensor':1576,1886,1921,1987,2228 'limit':29,90,194,395,438,697,1859,1866,1899,1973,2144,2260 'link':309,606,1217,1220,1252,1358,1417,1661 'list':610 'local':2146 'locat':1355,2379 'logo':1543,1552,1583 'loss':2035 'machin':515 'made':1206 'maintain':229 'make':315,322,370,431,1922 'malwar':499 'manner':627 'mark':1549,1580 'materi':304,323,332,564,665,1009,1024,1046,1054,1118,1202,1354,1413,1421 'matter':1995,2085,2284 'may':102,169,804,957,1091,1115,1590,1686,1752,1794,1836,2288,2400,2466,2559,2585,2626 'mean':326 'mechan':933 'mediat':2436 'merchant':1903 'messag':602 'method':619 'millennium':1390 'misappropri':2203 'miscellan':2268 'mislead':556,629 'mistak':1109 'modif':72 'modifi':1707,2291 'month':826,864,918,2063 'must':249 'name':59,62,115,190,254,270,624,674,706,718,732,740,773,779,824,883,963,999,1036,1159,1226,1264,1305,1333,1381,1387,1397,1424,1461,1472,1489,1501,1507,1534,1537,1570,1574,1617,1627,1654,1698,1751,1793,1881,1916,1982,2055,2073,2127,2223,2278,2304,2312,2584 'natur':659,1850 'necessari':478,1070,1284 'neglig':2002 'neither':1913 'new':1758,1769,1774 'newsgroup':608 'non':1061,1235,1256,1318,1911 'non-compani':1234,1255,1317 'non-harm':1060 'non-infring':1910 'noncommerci':691 'notic':1403,1816 'notifi':251,880,1378 'objection':749,1100 'oblig':713,783,1476 'obtain':1959 'occur':244 'offens':1096 'offer':66,186,1757 'offic':2233 'old':211 'omiss':279,296 'one':1834,2544 'onlin':2160 'oper':55,85,1031 'opinion':735 'option':799,813,952 'origin':2512,2629 'other':1335,1349,1463 'otherwis':314,676,1099,1612,1958,2326 'own':53 'ownership':1860 'paid':792,800,814,1485,2049 'part':135,1711,1802,2494,2504 'parti':320,408,467,535,545,592,1137,1510,1529,1597,1621,2211,2474,2511,2529,2568,2609 'particular':1907 'pass':481 'patent':399 'pay':821,840 'payment':794,832,932 'period':868,891,1723,2064 'permiss':424 'permit':2613 'person':638 'phish':554 'place':2453 'pleas':119 'polici':87,95,741,1329,1394,2129 'pornograph':572 'portion':2517 'post':303,308,429,1013,1048,1185,1188,1737,2308,2409 'power':1664 'pre':839 'pre-pay':838 'precaut':1068,1282 'prevail':2473 'previous':791,1484 'prior':2065 'privaci':94,585,1122,2128 'procedur':100 'proceed':2479 'procur':2023 'product':19,2026 'prohibit':2098 'promot':618 'proper':2357 'properti':416,1130,1340,1346,1456,1492,1512,1523,2206,2397 'proprietari':390,1133 'protect':1072,1286 'provid':785,959,1478,1876,2325 'provis':1843,1861,2354 'public':587,1124 'publish':104 'purchas':1640,1693 'purpos':1908 'question':359 'random':518 'randomly-gener':517 'rank':542 'rbitrat':2434 're':1943 'read':120,1945 'reader':631 'reason':734,769,2088 'receiv':423 'recipi':557 'record':937 'reflect':2509 'refund':787,875,1480 'refus':723 'regard':2159,2170,2395 'regardless':353,1690 'regist':1565 'regul':2141,2149 'relat':469,2366 'releas':1767 'relief':2392 'remain':1525,2516,2519 'remov':725,1410,1689 'renew':796,877,905 'repeat':1448 'replac':1709 'repres':374,1039,1267,2108 'represent':701,2104 'reproduc':1610 'request':667 'requir':487,1406 'reserv':1628,1655,1699 'resid':1370,2184,2191 'resourc':1772 'respect':1337,1343,1991,2231 'respond':1399 'respons':227,239,298,337,993,1021,1065,1162,1244,1279,1308,1718 'result':291,345,1166,1312 'review':1002,1005,1195,1198 'revis':2315 'right':391,404,413,453,588,709,1125,1134,1341,1347,1457,1515,1606,1630,1657,1701,2207,2398,2562,2588 'risk':1971 'rule':86,2429,2448 'sa':2621 'san':2381,2455 'search':540 'secret':403 'secur':231,267,444 'servic':17,44,177,801,815,849,859,898,948,951,956,972,981,1548,1579,1648,1759,1777,1962,2028,2437,2636,2639 'settl':2422 'shall':1778,1854,2074,2092,2419,2451,2484 'sharealik':692 'short':61,114,189,253,269,673,705,717,731,739,772,778,823,882,962,998,1035,1158,1225,1263,1304,1332,1380,1386,1396,1423,1460,1471,1488,1500,1506,1533,1536,1569,1573,1616,1626,1653,1697,1750,1792,1880,1915,1981,2054,2072,2126,2222,2277,2303,2311,2583 'sign':974,2296 'similar':616 'simpli':1837 'site':111,139,536,546,614 'softwar':34,368,441,1012,1205 'sole':720,775,1530,1704 'sourc':561 'spam':512,605 'special':2014 'spoof':567 'staff':2640 'state':1154,2153,2345,2375 'strict':2003,2121 'subject':67,1147,1780,1994,2283 'subscript':829,867,890,902,919,940 'subsequ':2555 'substitut':2025 'success':480 'successor':2611 'supplier':1884,1919,1985 'support':37,950,955,980 'surviv':1852,1855 'system':1077,1291 'take':1067,1281,2452 'taken':46 'tax':925 'technic':1106,2174 'term':3,77,147,161,180,197,488,798,966,989,1151,1783,2532,2550,2579,2634,2637 'termin':752,1426,1469,1790,1795,1823,1853,1856 'text':361 'theme':1668 'then-applic':913 'theori':2010 'therefor':1019 'thereof':2541,2557 'thereto':1935 'thing':477 'think':633 'third':319,407,466,534,544,591,1136,1509,1596,1620,2210 'third-parti':465,1619 'though':710 'threat':576 'three':2441 'time':106,108,946,1808 'titl':1516 'togeth':47 'tool':1770 'toolbar':1678,1685 'trade':402 'trademark':400,1547,1563,1566,1578,1593,1622 'traffic':532 'transfer':1497 'transmiss':2172 'treat':1950 'trojan':500,1081,1295 'twelv':2061 'type':658 'typograph':1108 'u.s.a':2348 'unauthor':257 'understand':1952 'unenforc':2502 'uneth':524 'uninterrupt':1940 'unlaw':550 'unless':878,1637 'unport':694 'unsolicit':617 'unstat':1156 'unwant':526,600 'updat':2625 'upgrad':803,817,851,861,900,1645,1692 'upon':2600 'us':909 'usa':1373 'use':8,127,133,175,258,382,660,758,856,926,1027,1058,1143,1169,1250,1315,1433,1553,1584,1599,1613,1728,1839,2033,2114,2195,2253,2333 'user':485,678,681 'util':811,847 'venu':2358 'version':2316 'via':599 'violat':583,736,1120,1363,2263 'violenc':579 'virus':497,1079,1293 'visitor':996,1171,1181,1428,1442 'waiv':2548 'waiver':449,2526 'want':894 'warrant':376,2110 'warranti':703,1862,1872,1890,1901,1924,2106 'way':746 'web':138,613 'webpag':1212,1240,1261,1276,1323 'websit':13,25,49,51,64,129,173,199,224,307,312,329,761,809,995,1016,1033,1090,1114,1174,1191,1210,1238,1259,1274,1321,1369,1436,1561,1589,1602,1734,1764,1805,1841,1874,1927,1965,2117,2183,2198,2256,2336 'well':922,1102 'whether':355,666 'wish':1821 'without':71,89,696,1811,1815,1858,1898,2143,2407,2592 'wordpress':2633 'worm':498,1080,1294 'written':2294 'year':210	The following terms and conditions govern all use of the company_domain website and all content, services and products available at or through the website, including, but not limited to, company_domain Forum Software, company_domain Support Forums and the company_domain Hosting service ("Hosting"), (taken together, the Website). The Website is owned and operated by company_full_name ("company_short_name"). The Website is offered subject to your acceptance without modification of all of the terms and conditions contained herein and all other operating rules, policies (including, without limitation, company_domain’s Privacy Policy and Community Guidelines ) and procedures that may be published from time to time on this Site by company_short_name (collectively, the "Agreement"). Please read this Agreement carefully before accessing or using the Website. By accessing or using any part of the web site, you agree to become bound by the terms and conditions of this agreement. If you do not agree to all the terms and conditions of this agreement, then you may not access the Website or use any services. If these terms and conditions are considered an offer by company_short_name, acceptance is expressly limited to these terms. The Website is available only to individuals who are at least 13 years old. 1. Your company_domain Account If you create an account on the Website, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account. You must immediately notify company_short_name of any unauthorized uses of your account or any other breaches of security. company_short_name will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions. 2. Responsibility of Contributors If you post material to the Website, post links on the Website, or otherwise make (or allow any third party to make) material available by means of the Website (any such material, "Content"), You are entirely responsible for the content of, and any harm resulting from, that Content. That is the case regardless of whether the Content in question constitutes text, graphics, an audio file, or computer software. By making Content available, you represent and warrant that: the downloading, copying and use of the Content will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark or trade secret rights, of any third party; if your employer has rights to intellectual property you create, you have either (i) received permission from your employer to post or make available the Content, including but not limited to any software, or (ii) secured from your employer a waiver as to all rights in or to the Content; you have fully complied with any third-party licenses relating to the Content, and have done all things necessary to successfully pass through to end users any required terms; the Content does not contain or install any viruses, worms, malware, Trojan horses or other harmful or destructive content; the Content is not spam, is not machine- or randomly-generated, and does not contain unethical or unwanted commercial content designed to drive traffic to third party sites or boost the search engine rankings of third party sites, or to further unlawful acts (such as phishing) or mislead recipients as to the source of the material (such as spoofing); the Content is not pornographic, does not contain threats or incite violence, and does not violate the privacy or publicity rights of any third party; your content is not getting advertised via unwanted electronic messages such as spam links on newsgroups, email lists, blogs and web sites, and similar unsolicited promotional methods; your content is not named in a manner that misleads your readers into thinking that you are another person or company; and you have, in the case of Content that includes computer code, accurately categorized and/or described the type, nature, uses and effects of the materials, whether requested to do so by company_short_name or otherwise. 3. User Content License User contributions are licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License . Without limiting any of those representations or warranties, company_short_name has the right (though not the obligation) to, in company_short_name’s sole discretion (i) refuse or remove any content that, in company_short_name’s reasonable opinion, violates any company_short_name policy or is in any way harmful or objectionable, or (ii) terminate or deny access to and use of the Website to any individual or entity for any reason, in company_short_name’s sole discretion. company_short_name will have no obligation to provide a refund of any amounts previously paid. 4. Payment and Renewal General Terms Optional paid services or upgrades may be available on the Website. When utilizing an optional paid service or upgrade, you agree to pay company_short_name the monthly or annual subscription fees indicated. Payments will be charged on a pre-pay basis on the day you begin utilizing the service or upgrade and will cover the use of that service or upgrade for a monthly or annual subscription period as indicated. These fees are not refundable. Automatic Renewal Unless you notify company_short_name before the end of the applicable subscription period that you want to cancel a service or upgrade, your subscription will automatically renew and you authorize us to collect the then-applicable annual or monthly subscription fee (as well as any taxes) using any credit card or other payment mechanism we have on record for you. Subscriptions can be canceled at any time. 5. Services Hosting, Support Services Optional Hosting and Support services may be provided by company_short_name under the terms and conditions for each such service. By signing up for a Hosting/Support or Support services account, you agree to abide by such terms and conditions. 6. Responsibility of Website Visitors company_short_name has not reviewed, and cannot review, all of the material, including computer software, posted to the Website, and cannot therefore be responsible for that material’s content, use or effects. By operating the Website, company_short_name does not represent or imply that it endorses the material there posted, or that it believes such material to be accurate, useful or non-harmful. You are responsible for taking precautions as necessary to protect yourself and your computer systems from viruses, worms, Trojan horses, and other harmful or destructive content. The Website may contain content that is offensive, indecent, or otherwise objectionable, as well as content containing technical inaccuracies, typographical mistakes, and other errors. The Website may also contain material that violates the privacy or publicity rights, or infringes the intellectual property and other proprietary rights, of third parties, or the downloading, copying or use of which is subject to add itional terms and conditions, stated or unstated. company_short_name disclaims any responsibility for any harm resulting from the use by visitors of the Website, or from any downloading by those visitors of content there posted. 7. Content Posted on Other Websites We have not reviewed, and cannot review, all of the material, including computer software, made available through the websites and webpages to which company_domain links, and that link to company_domain. company_short_name does not have any control over those non-company_domain websites and webpages, and is not responsible for their contents or their use. By linking to a non-company_domain website or webpage, company_short_name does not represent or imply that it endorses such website or webpage. You are responsible for taking precautions as necessary to protect yourself and your computer systems from viruses, worms, Trojan horses, and other harmful or destructive content. company_short_name disclaims any responsibility for any harm resulting from your use of non-company_domain websites and webpages. 8. Copyright Infringement and DMCA Policy As company_short_name asks others to respect its intellectual property rights, it respects the intellectual property rights of others. If you believe that material located on or linked to by company_domain violates your copyright, and if this website resides in the USA, you are encouraged to notify company_short_name in accordance with company_short_name’s Digital Millennium Copyright Act ("DMCA") Policy. company_short_name will respond to all such notices, including as required or appropriate by removing the infringing material or disabling all links to the infringing material. company_short_name will terminate a visitor’s access to and use of the Website if, under appropriate circumstances, the visitor is determined to be a repeat infringer of the copyrights or other intellectual property rights of company_short_name or others. In the case of such termination, company_short_name will have no obligation to provide a refund of any amounts previously paid to company_short_name. 9. Intellectual Property This Agreement does not transfer from company_short_name to you any company_short_name or third party intellectual property, and all right, title and interest in and to such property will remain (as between the parties) solely with company_short_name. company_short_name, company_domain, the company_domain logo, and all other trademarks, service marks, graphics and logos used in connection with company_domain, or the Website are trademarks or registered trademarks of company_short_name or company_short_name’s licensors. Other trademarks, service marks, graphics and logos used in connection with the Website may be the trademarks of other third parties. Your use of the Website grants you no right or license to reproduce or otherwise use any company_short_name or third-party trademarks. 10. Advertisements company_short_name reserves the right to display advertisements on your content unless you have purchased an Ad-free Upgrade or a Services account. 11. Attribution company_short_name reserves the right to display attribution links such as ‘Powered by company_domain,’ theme author, and font attribution in your content footer or toolbar. Footer credits and the company_domain toolbar may not be removed regardless of upgrades purchased. 12. Changes company_short_name reserves the right, at its sole discretion, to modify or replace any part of this Agreement. It is your responsibility to check this Agreement periodically for changes. Your continued use of or access to the Website following the posting of any changes to this Agreement constitutes acceptance of those changes. company_short_name may also, in the future, offer new services and/or features through the Website (including, the release of new tools and resources). Such new features and/or services shall be subject to the terms and conditions of this Agreement. 13. Termination company_short_name may terminate your access to all or any part of the Website at any time, with or without cause, with or without notice, effective immediately. If you wish to terminate this Agreement or your company_domain account (if you have one), you may simply discontinue using the Website. All provisions of this Agreement which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability. 14. Disclaimer of Warranties The Website is provided "as is". company_short_name and its suppliers and licensors hereby disclaim all warranties of any kind, express or implied, including, without limitation, the warranties of merchantability, fitness for a particular purpose and non-infringement. Neither company_short_name nor its suppliers and licensors, makes any warranty that the Website will be error free or that access thereto will be continuous or uninterrupted. If you’re actually reading this, here’s a treat . You understand that you download from, or otherwise obtain content or services through, the Website at your own discretion and risk. 15. Limitation of Liability In no event will company_short_name, or its suppliers or licensors, be liable with respect to any subject matter of this agreement under any contract, negligence, strict liability or other legal or equitable theory for: (i) any special, incidental or consequential damages; (ii) the cost of procurement for substitute products or services; (iii) for interruption of use or loss or corruption of data; or (iv) for any amounts that exceed the fees paid by you to company_short_name under this agreement during the twelve (12) month period prior to the cause of action. company_short_name shall have no liability for any failure or delay due to matters beyond their reasonable control. The foregoing shall not apply to the extent prohibited by applicable law. 16. General Representation and Warranty You represent and warrant that (i) your use of the Website will be in strict accordance with the company_short_name Privacy Policy , Community Guidelines , with this Agreement and with all applicable laws and regulations (including without limitation any local laws or regulations in your country, state, city, or other governmental area, regarding online conduct and acceptable content, and including all applicable laws regarding the transmission of technical data exported from the country in which this website resides or the country in which you reside) and (ii) your use of the Website will not infringe or misappropriate the intellectual property rights of any third party. 17. Indemnification You agree to indemnify and hold harmless company_short_name, its contractors, and its licensors, and their respective directors, officers, employees and agents from and against any and all claims and expenses, including attorneys’ fees, arising out of your use of the Website, including but not limited to your violation of this Agreement. 18. Miscellaneous This Agreement constitutes the entire agreement between company_short_name and you concerning the subject matter hereof, and they may only be modified by a written amendment signed by an authorized executive of company_short_name, or by the posting by company_short_name of a revised version. Except to the extent applicable law, if any, provides otherwise, this Agreement, any access to or use of the Website will be governed by the laws of the state of California, U.S.A., excluding its conflict of law provisions, and the proper venue for any disputes arising out of or relating to any of the same will be the state and federal courts located in San Francisco County, California. Except for claims for injunctive or equitable relief or claims regarding intellectual property rights (which may be brought in any competent court without the posting of a bond), any dispute arising under this Agreement shall be finally settled in accordance with the Comprehensive Arbitration Rules of the Judicial A rbitration and Mediation Service, Inc. (“JAMS”) by three arbitrators appointed in accordance with such Rules. The arbitration shall take place in San Francisco, California, in the English language and the arbitral decision may be enforced in any court. The prevailing party in any action or proceeding to enforce this Agreement shall be entitled to costs and attorneys’ fees. If any part of this Agreement is held invalid or unenforceable, that part will be construed to reflect the parties’ original intent, and the remaining portions will remain in full force and effect. A waiver by either party of any term or condition of this Agreement or any breach thereof, in any one instance, will not waive such term or condition or any subsequent breach thereof. You may assign your rights under this Agreement to any party that consents to, and agrees to be bound by, its terms and conditions; company_short_name may assign its rights under this Agreement without condition. This Agreement will b e binding upon and will inure to the benefit of the parties, their successors and permitted assigns. This document is CC-BY-SA. It was last updated May 31, 2013. Originally adapted from the WordPress Terms of Service . Terms of Service Staff	en
5	'chang':9 'content':11 'edit':1 'first':3 'page':17 'post':4 'servic':16,20 'staff':21 'term':14,18 'topic':7	Edit the first post in this topic to change the contents of the Terms of Service page. Terms of Service Staff	en
6	'+1':684 'abid':867 'abus':499 'account':445 'accru':417 'acknowledg':401 'act':131 'action':418 'actual':246 'ad':234 'add':104 'agre':686,865 'agreeabl':203 'aid':49 'alreadi':172 'alway':86,476 'anyon':522 'anyth':491,509,717 'appear':553 'argument':257 'ask':563 'attach':678 'attack':236 'audio':744 'author':363 'automat':423 'avoid':230,299,550 'bad':390,398 'behavior':391,399,850 'belong':720 'best':315 'better':193,348 'bookmark':320 'bore':824 'break':748 'brows':178 'button':690 'call':233 'categori':639,788 'chanc':194 'chang':664 'choos':284 'civil':4,70,478,487 'clean':64,505,628 'collect':312 'communiti':28,56,282,310,380,433,475,767 'concret':545 'consid':497 'consum':403 'contact':812 'content':247,441,471,656,855 'contradict':251 'contribut':318 'convers':40,107,261,266,483 'count':264 'counter':256 'counter-argu':255 'critic':225,797 'cross':643 'cross-post':642 'data':836 'definit':549 'describ':846 'descript':730 'differ':700 'digit':718 'direct':701 'disagre':152,207,216 'discours':72,304 'discov':168 'discuss':8,12,75,84,91,121,147,165,288,593,625,792 'divert':660 'edit':324 'effort':610 'either':422 'els':338,723 'enabl':308 'encourag':396 'energi':405 'engag':286 'engin':590 'enough':415 'even':149,204,551 'everi':672 'everyon':274,337,408 'exist':695 'experi':335 'explicit':513 'expos':526 'extens':832 'facilit':381 'famili':602 'faq/guidelines':871 'fast':46 'favorit':319 'featur':573 'feedback':787 'feel':568 'fine':221 'flag':322,358,412,416,811 'folk':839 'forth':327 'forum':13,292,369,532,541,587 'found':351 'friend':604,761 'front':576 'futur':279 'great':81 'grief':521 'guidelin':59 'handl':805 'happen':173 'harass':519 'hard':44 'hate':501 'healthi':482 'help':76,275,376 'hominem':235 'howev':95 'human':52 'idea':226 'identifi':313 'imag':599,745 'imperson':523 'improv':73,89,163,259,332 'index':591 'influenc':277 'inform':529,677 'instead':243,252 'intellectu':740 'interest':37,201,294 'intervent':427 'issu':800 'janitor':384 'jerk':250 'judgment':53 'keep':61,503,594,605 'knee':249 'knee-jerk':248 'knowledg':35 'languag':596 'later':118 'law':751,858 'leav':345 'legales':822 'less':627 'let':341,790 'light':67 'like':321,484,689 'link':597,706,732 'll':190 'local':762 'maintain':431 'make':78,290,608 'matter':123,135 'may':209,714,727 'meet':196 'mere':48 'meta':808 'method':735 'midstream':666 'moder':360,377,426,434,452,462 'multipl':649 'must':827,864 'name':232 'name-cal':231 'new':456,580,782 'no-cont':654 'noth':479 'obscen':510 'offens':498 'one':160,169 'ongo':39 'open':780 'oper':465,758 'order':429 'other':197 'otherwis':538 'page':577,817 'park':22,347 'particip':263 'peopl':146,228,524 'permiss':725 'person':495 'place':5,31,68,82,295,617 'pleas':9,174,229 'polic':386 'post':103,240,457,472,490,508,535,571,644,653,671,673,683,708,716,729 'power':752 'precis':548 'preview':455 'privaci':856 'privat':528 'problem':357 'profil':676 'properti':741 'protect':828 'provid':253,305 'public':7,21,71,586 'put':612 'question':773 'radic':699 'rather':681,691 're':561 'reason':254,448,494 'relat':853 'rememb':223 'remov':439 'repli':183,323,394,657,703 'reserv':435 'resourc':29 'respect':17,140,514,530 'respond':212,237 'respons':366,468 'right':437,616,852 'rude':485 'rule':47 'sabotag':480 'safe':600 'said':159 'say':114 'search':589 'see':355,389 'servic':820,845,862 'set':270 'sexual':512 'share':27,33,199 'sign':669 'site':464,756,786 'skill':34 'small':96 'softwar':742 'someon':722,738 'someth':214 'spam':536 'special':362 'speech':502 'spend':175,622 'staff':763,816,872 'start':185,633 'steal':737 'stuff':712 'sure':101 'take':466,693 'taken':421 'term':546,818,843 'thing':558,613,647,776 'think':108 'tidi':607 'time':177,410,451,582,624 'tone':242,272 'tool':306,330 'topic':120,143,180,635,650,662,696,707,783,809 'tos':870 'treat':10 'tri':116,343 'unfriend':838 'unsur':562 'urgent':799 'us':77,125,276,813 'use':57,328,687,702,860 'user':444 'vandal':539 'via':814 'video':743 'want':112,128 'wast':407 'way':94,161,460 'well':66 'well-light':65 'wish':210 'without':724 'work':87,778 'worst':317 'would':19,496,567 'wrong':638 'yes':821 'york':581	This is a Civilized Place for Public Discussion Please treat this discussion forum with the same respect you would a public park. We, too, are a shared community resource — a place to share skills, knowledge and interests through ongoing conversation. These are not hard and fast rules, merely aids to the human judgment of our community. Use these guidelines to keep this a clean, well-lighted place for civilized public discourse. Improve the Discussion Help us make this a great place for discussion by always working to improve the discussion in some way, however small. If you are not sure your post adds to the conversation, think over what you want to say and try again later. The topics discussed here matter to us, and we want you to act as if they matter to you, too. Be respectful of the topics and the people discussing them, even if you disagree with some of what is being said. One way to improve the discussion is by discovering ones that are already happening. Please spend some time browsing the topics here before replying or starting your own, and you’ll have a better chance of meeting others who share your interests. Be Agreeable, Even When You Disagree You may wish to respond to something by disagreeing with it. That’s fine. But, remember to criticize ideas, not people . Please avoid: Name-calling. Ad hominem attacks. Responding to a post’s tone instead of its actual content. Knee-jerk contradiction. Instead, provide reasoned counter-arguments that improve the conversation. Your Participation Counts The conversations we have here set the tone for everyone. Help us influence the future of this community by choosing to engage in discussions that make this forum an interesting place to be — and avoiding those that do not. Discourse provides tools that enable the community to collectively identify the best (and worst) contributions: favorites, bookmarks, likes, flags, replies, edits, and so forth. Use these tools to improve your own experience, and everyone else’s, too. Let’s try to leave our park better than we found it. If You See a Problem, Flag It Moderators have special authority; they are responsible for this forum. But so are you. With your help, moderators can be community facilitators, not just janitors or police. When you see bad behavior, don’t reply. It encourages the bad behavior by acknowledging it, consumes your energy, and wastes everyone’s time. Just flag it . If enough flags accrue, action will be taken, either automatically or by moderator intervention. In order to maintain our community, moderators reserve the right to remove any content and any user account for any reason at any time. Moderators do not preview new posts in any way; the moderators and site operators take no responsibility for any content posted by the community. Always Be Civil Nothing sabotages a healthy conversation like rudeness: Be civil. Don’t post anything that a reasonable person would consider offensive, abusive, or hate speech. Keep it clean. Don’t post anything obscene or sexually explicit. Respect each other. Don’t harass or grief anyone, impersonate people, or expose their private information. Respect our forum. Don’t post spam or otherwise vandalize the forum. These are not concrete terms with precise definitions — avoid even the appearance of any of these things. If you’re unsure, ask yourself how you would feel if your post was featured on the front page of the New York Times. This is a public forum, and search engines index these discussions. Keep the language, links, and images safe for family and friends. Keep It Tidy Make the effort to put things in the right place, so that we can spend more time discussing and less cleaning up. So: Don’t start a topic in the wrong category. Don’t cross-post the same thing in multiple topics. Don’t post no-content replies. Don’t divert a topic by changing it midstream. Don’t sign your posts — every post has your profile information attached to it. Rather than posting “+1” or “Agreed”, use the Like button. Rather than taking an existing topic in a radically different direction, use Reply as a Linked Topic. Post Only Your Own Stuff You may not post anything digital that belongs to someone else without permission. You may not post descriptions of, links to, or methods for stealing someone’s intellectual property (software, video, audio, images), or for breaking any other law. Powered by You This site is operated by your friendly local staff and you , the community. If you have any further questions about how things should work here, open a new topic in the site feedback category and let's discuss! If there's a critical or urgent issue that can't be handled by a meta topic or flag, contact us via the staff page . Terms of Service Yes, legalese is boring, but we must protect ourselves – and by extension, you and your data – against unfriendly folks. We have a Terms of Service describing your (and our) behavior and rights related to content, privacy, and laws. To use this service, you must agree to abide by our TOS . FAQ/Guidelines Staff	en
7	'chang':9 'content':11 'edit':1 'faq/guidelines':14,16 'first':3 'page':15 'post':4 'staff':17 'topic':7	Edit the first post in this topic to change the contents of the FAQ/Guidelines page. FAQ/Guidelines Staff	en
8	'13':635,654 '2013':741 '31':740 '5':318 '90':302 'access':268 'account':365,371 'act':619,665 'activ':592 'address':52,65,90,99,115,209,292,307 'advertis':547 'age':652 'aggreg':386 'agre':496 'allow':349 'also':106,504 'and/or':237 'appli':679 'appropri':513 'ask':43 'assist':417,479 'associ':308,366 'base':173 'behalf':438 'believ':510 'better':155,399,420 'browser':346,358 'busi':447,487 'cc':732 'cc-by-sa':731 'chang':224,707,716,724 'children':614,660 'collect':5,7,134,435,683,691 'compil':385 'compli':515 'complianc':620 'comput':339 'conduct':443,485 'confidenti':501 'consent':694,700 'contain':72,289 'content':32,590 'continu':166 'contract':409 'control':85 'cooki':323,325,351,374 'coppa':659 'custom':185,197 'data':19,275,387 'day':303 'decid':714 'direct':628 'disclos':450 'discret':557 'document':729 'drive':342 'e':50,63,88 'e-mail':49,62,87 'effect':193 'effort':284 'email':71,206,208 'enabl':352 'enforc':519 'enter':45,265 'evalu':30 'everi':117 'except':439 'experi':149,401 'faith':283 'feedback':178,610 'file':328 'follow':144 'forum':25 'futur':382,406 'gather':18 'good':282 'hard':341 'help':152,189,441 'howev':55,532 'identifi':469,536 'implement':249 'improv':162,169,184,445 'includ':112,474,560 'independ':578 'individu':159 'inform':2,8,127,132,151,176,188,218,247,262,271,434,452,470,500,507,538,682,690 'inquiri':236 'integr':603 'interact':393 'ip':98,114,291,306 'keep':498 'know':82 'last':737 'law':518 'least':634 'liabil':587 'link':75,78,553,595 'log':110,288 'long':492 'mail':51,64,89 'maintain':256 'make':280 'market':546 'may':41,54,107,137,212,408,503,539,559,739 'measur':254 'name':47,233 'need':160,202 'non':534 'non-person':533 'nonetheless':597 'notif':219 'occasion':554 'offer':172,398,562 'offlin':692 'old':637 'older':639 'one':141 'onlin':616,662,671,676 'oper':482 'origin':103 'other':527 'otherwis':462 'outsid':454,465 'page':727 'parti':413,455,466,477,495,544,552,564,573 'particip':22 'peopl':630 'per':655 'period':205 'permit':430 'person':147,261,270,468,535 'polici':277,522,580,673,678,706,711,719,743 'post':94,102,314,722 'prefer':380 'privaci':579,617,663,672,677,705,710,718,742 'product':565,623 'properti':529 'protect':245,524,601,618,664 'provid':211,335,415,427,541 'question':241 'read':27 'receiv':180 'recogn':356 'record':96 'regist':13,36,60,92,310,364,370 'releas':505,511 'request':118,199,222,239,295 'requir':657 'respond':156,194,234 'respons':229,585 'retain':108,286,304 'retent':276 'right':528 'sa':734 'safeti':258,531 'save':378 'secur':253 'seek':599 'sell':459 'send':204,216 'separ':576 'server':109,121,287,298,642 'servic':186,198,334,414,426,489,567,625 'share':33 'site':16,39,58,164,171,331,354,389,392,400,423,484,521,570,574,596,606,613,622,670,686,698,704 'small':327 'staff':744 'strive':167 'submit':266 'support':201 'therefor':582 'third':412,476,551,563,572 'third-parti':411 'tool':403 'topic':226 'trade':460 'traffic':390 'transfer':336,463 'trust':475 'understand':376,421 'uniqu':74 'updat':738 'us':153,190,418,442,480 'usa':646 'use':125,139,214,322,373,432,550,668,696 'user':232,311 'varieti':251 'verifi':68 'visit':56,80,383 'visitor':424,537 'way':145 'web':345,703 'welcom':608 'without':59 'write':28 'year':319,636 'yes':324	What information do we collect? We collect information from you when you register on our site and gather data when you participate in the forum by reading, writing, and evaluating the content shared here. When registering on our site, you may be asked to enter your name and e-mail address. You may, however, visit our site without registering. Your e-mail address will be verified by an email containing a unique link. If that link is visited, we know that you control the e-mail address. When registered and posting, we record the IP address that the post originated from. We also may retain server logs which include the IP address of every request to our server. What do we use your information for? Any of the information we collect from you may be used in one of the following ways: To personalize your experience — your information helps us to better respond to your individual needs. To improve our site — we continually strive to improve our site offerings based on the information and feedback we receive from you. To improve customer service — your information helps us to more effectively respond to your customer service requests and support needs. To send periodic emails — The email address you provide may be used to send you information, notifications that you request about changes to topics or in response to your user name, respond to inquiries, and/or other requests or questions. How do we protect your information? We implement a variety of security measures to maintain the safety of your personal information when you enter, submit, or access your personal information. What is your data retention policy? We will make a good faith effort to: Retain server logs containing the IP address of all requests to this server no more than 90 days. Retain the IP addresses associated with registered users and their posts no more than 5 years. Do we use cookies? Yes. Cookies are small files that a site or its service provider transfers to your computer's hard drive through your Web browser (if you allow). These cookies enable the site to recognize your browser and, if you have a registered account, associate it with your registered account. We use cookies to understand and save your preferences for future visits and compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future. We may contract with third-party service providers to assist us in better understanding our site visitors. These service providers are not permitted to use the information collected on our behalf except to help us conduct and improve our business. Do we disclose any information to outside parties? We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include trusted third parties who assist us in operating our site, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses. Third party links Occasionally, at our discretion, we may include or offer third party products or services on our site. These third party sites have separate and independent privacy policies. We therefore have no responsibility or liability for the content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our site and welcome any feedback about these sites. Children's Online Privacy Protection Act Compliance Our site, products and services are all directed to people who are at least 13 years old or older. If this server is in the USA, and you are under the age of 13, per the requirements of COPPA ( Children's Online Privacy Protection Act ), do not use this site. Online Privacy Policy Only This online privacy policy applies only to information collected through our site and not to information collected offline. Your Consent By using our site, you consent to our web site privacy policy. Changes to our Privacy Policy If we decide to change our privacy policy, we will post those changes on this page. This document is CC-BY-SA. It was last updated May 31, 2013. Privacy Policy Staff	en
9	'chang':9 'content':11 'edit':1 'first':3 'page':16 'polici':15,18 'post':4 'privaci':14,17 'staff':19 'topic':7	Edit the first post in this topic to change the contents of the Privacy Policy page. Privacy Policy Staff	en
10	'asset':128 'author':122 'basic':110 'click':70,86 'copi':101 'delet':22 'design':19,132 'differ':117 'drag':57 'drag-and-drop':56 'drop':59 'edit':88,91,121 'editor':54 'enabl':116 'extens':123 'favicon':41 'file':14,118,126 'forth':44 'get':78 'icon':50,89 'imag':12,34,62,72,84,100,103,107 'logo':40 'need':114 'new':75 'past':61,105 'path':80,97,104,108 'perman':4 'post':53,67,76,93 'repli':27,65 'retriev':95 'right':69 'set':111,127 'site':18,131 'staff':9,133 'store':11 'submit':63 'toolbar':49 'topic':5,30 'type':119 'upload':31,48,83,120 'use':15,38,46 'visibl':6 'wish':36	This is a permanent topic, visible only to staff, for storing images and files used in the site design. Don't delete it! Here's how: Reply to this topic. Upload all the images you wish to use for logos, favicons, and so forth here. (Use the upload toolbar icon in the post editor, or drag-and-drop or paste images.) Submit your reply to post it. Right click the images in your new post to get the path to the uploaded images, or click the edit icon to edit your post and retrieve the path to the images. Copy the image paths. Paste those image paths into basic settings . If you need to enable different file type uploads, edit authorized_extensions in the file settings . Assets for the site design Staff	en
11	'admin':65 'announc':83 'bottom':73 'brief':29 'close':60 'come':46 'communiti':33 'descript':30 'discours':86 'edit':25 'etc':55 'find':41 'first':2 'homepag':21 'import':24 'link':53 'may':57 'messag':14 'new':17 'paragraph':3 'pile':79 'pin':6 'read':51 'repli':76 'resourc':54 'right':71 'topic':7,62 'uncategor':87 'upper':70 'via':63 'visibl':10 'visitor':18 'want':58 'welcom':13,84 'wrench':66,67	The first paragraph of this pinned topic will be visible as a welcome message to all new visitors on your homepage. It's important! Edit this into a brief description of your community: Who is it for? What can they find here? Why should they come here? Where can they read more (links, resources, etc)? You may want to close this topic via the admin :wrench: :wrench: (at the upper right and bottom), so that replies don't pile up on an announcement. Welcome to Discourse Uncategorized	en
12	'3':20,57 'access':45 'automat':41 'ball':3,5 'categori':32,49 'chang':30 'communiti':87 'confetti':2,4 'congratul':1 'continu':103 'current':69 'edit':24 'fellow':72 'flag':65 'follow':40 'hi':78 'hide':60 'higher':59 'import':83 'inform':90 'level':19,56,93 'link':39 'list':70 'loung':48,116,117 'meet':105 'member':101 'nofollow':42 'note':98 'part':84 'pleas':97 'privat':47 'promot':15 'recent':14 'regular':17,73,112 'remain':111 'remov':44 'requir':107 'say':77 'see':9,94 'singl':64 'spam':61 'sure':75 'thank':79 'time':109 'titl':26 'topic':11,29,35,96 'trust':18,55,92 'user':53 'visibl':51 'welcom':113	Congratulations! :confetti_ball: :confetti_ball: If you can see this topic, you were recently promoted to regular (trust level 3). You can now … Edit the title of any topic Change the category of any topic Have all your links followed ( automatic nofollow is removed) Access a private Lounge category only visible to users at trust level 3 and higher Hide spam with a single flag Here's the current list of fellow regulars . Be sure to say hi. Thanks for being an important part of this community! (For more information on trust levels, see this topic . Please note that only members who continue to meet the requirements over time will remain regulars.) Welcome to the Lounge Lounge	en
13	'/a':236,243,250,257,264,269 '/about/':241 '/admin':42 '/admin/upgrade':1853 '/blog':262 '/div':270 '/news/':248 '/products/':255 '0':229,230,1386,1412 '1':696,1033,1388,1483,1530 '15':1486 '1gb':1774 '2':1390,1419,1449 '3':1118,1392,1618 '3.0':1631 '4':1394 '5px':228,231 'abil':1364 'access':46 'account':426,472 'action':1456 'activ':1384 'actual':1435 'add':308,316,431,1145,1182 'addit':317 'address':495,499 'adequ':1282 'adjust':1544 'admin':20,24,35,39,56,287,340,352,488,817,1006,1052,1126,1960 'advanc':1758 'advic':1705 'ahead':100 'allow':1597 'alreadi':403 'also':45,179,450,770,1756 'alway':1144,1573,1581 'amazon':1313 'anonym':616 'anybodi':1616 'anyth':291,294 'appear':592 'approv':381,1516 'area':368,1328,1744,1751 'aren':536 'arriv':1338 'ask':999 'asset':125 'assist':1366,1935 'assum':362,1167 'attach':1426 'audienc':1141 'author':1608,1609 'automat':722,1864 'back':202 'backup':1866 'banner':777,779,797,814,1676 'basic':880,1268,1389,1784 'bbpress':1900 'begin':1176 'belong':1264 'better':1156 'beyond':1296 'blog':263 'blog.example.com':261 'blog.example.com/blog':260 'bottom':715,738,824,1738 'box':1276,1563 'brief':668 'broken':98 'browser':621 'build':459,922,1653,1658,1707 'built':948 'built-in':947 'bulk':1150,1763 'bunch':955,1246 'button':341,356,1735 'by-nc-sa':1627 'cannot':307,1415 'categori':309,400,407,760,872,894,896,904,1093,1098,1135,1147,1184,1187,1192,1203,1215,1217,1223,1235,1255 'certain':1206 'chang':311,375,729,867,884,1881 'chick':17,19 'civil':12,938 'class':224 'clear':1258 'click':338,504,799,1190,1849 'close':517 'collabor':1083 'color':111,172,176 'commit':1684 'common':193,934,1543,1568,1626 'communiti':280,672,854,950,987,1076,1345,1361,1370,1380,1655,1659,1669,1692,1710,1786,1789 'configur':293,413,484,553,1907,1937 'congratul':1 'conserv':1497 'construct':14 'contain':225,1806 'content':1558,1591,1601,1869,1894 'control':28,735 'copyright':1575 'corner':805 'correct':485 'cpu':1772,1797 'creat':169,991,1131,1191 'creativ':933,1567,1625 'css':168,182 'css/html':216 'custom':108,175,181,184,189,215 'd':556,1287,1305 'daili':1865 'dashboard':21,40 'data':1880 'day':864 'deal':981 'default':113,578,832,888,920,1097,1377,1489,1526,1565,1622 'defin':1667 'deliver':522,546 'deliveri':1870 'describ':683 'descript':1238,1259 'design':129,1373 'detail':979 'didn':525 'differ':707 'discours':13,31,96,120,158,361,583,709,939,944,1346,1371,1564,1621,1709,1785,1826,1838,1886,1919,1941 'discuss':367,650,1102,1327,1680 'disk':1283 'dismiss':794 'distinct':160 'div':219 'docker':1805 'domain':1883 'drupal':1899 'earn':1356 'easi':1818,1847 'easili':1149 'edit':165,301,399,661,875,1024,1084,1639,1648 'either':544 'elev':678,691 'email':466,467,478,489,494,498,507,512,516,521,530,543,545,551,564,1727,1832,1875 'emb':1918 'enabl':559,618 'enough':767,1586 'enter':71,84,492,1240 'entri':1064 'especi':1467 'establish':271 'etc':1901 'even':458,1381 'eventu':1859 'everi':863,1070,1088,1216,1455 'everyon':1407,1524 'everywher':1693 'exampl':210 'example.com':234,240,247,254 'example.com/about/':239 'example.com/news/':246 'example.com/products/':253 'exercis':33 'export':1878 'extra':446 'extra-f':445 'facebook':436 'fanci':447 'faq':925,929,980,1001,1047,1062,1077 'far':907,911 'feedback':995,1100 'field':88,94,502,1441 'figur':1158 'file':1266,1292,1301,1311,1425 'find':655,1700 'fine':1272 'firewal':1903,1908 'first':638,1959 'flag':1430 'float':781,796 'follow':131,1315 'forum':268,1605,1615,1942 'forums.example.com':267 'frequent':998 'friend':1911 'function':57 'gain':1363 'general':59,1101 'get':115,444,527,538,858,1170,1716,1830 'github':438 'give':156,1252 'global':588,751 'go':74,99,1164 'good':1257 'googl':432 'got':509 'govern':1368 'grant':351,354,1582 'great':513 'group':1207,1769 'grow':1790 'guarante':1817 'guid':1952,1963 'guidelin':951 'hamburg':50,1061 'hard':549,1661 'hatch':16,18 'header':198,218 'headers/footers':186 'help':1932 'higher':1035,1120 'hint':1177 'home':235 'homepag':595,830,834,849,869,921 'hope':1799 'howev':970 'howto':567,1317 'href':233,238,245,252,259,266 'html':185,211,1928 'https':1867 'hyperlink':1420 'icon':66,1008 'id':220 'imag':147,1269,1298,1309,1423,1548 'import':520,633,1109,1876,1892 'improv':1948 'includ':1589,1757 'incognito':613 'individu':1534 'initi':1134,1220,1341 'inpriv':614 'instal':945,1807,1923 'instanc':32,1844,1887 'instruct':133 'interest':1682 'introduct':669 'invit':331,385,1712,1724,1734,1743,1750,1764,1766 'isn':764 'item':917 'join':333 'kind':284 'kit':15 'later':1153 'latest':841,890,897 'launch':1663 'leader':1395 'left':912 'leftmost':914 'level':1031,1117,1411,1482,1528 'licens':1559,1569 'like':557,1288 'limit':1463 'link':1056,1086,1436,1556,1649,1690 'list':603,755,838,873 'littl':706 'll':106,1169 'local':422,1278 'log':418 'login':377,383,414,433,435,437,439,462 'logo':109,121,138,152 'look':68,122,161,191,348 'lot':859 'loung':1110 'mainten':1770 'make':480,807,1013 'mani':1133 'manual':1520 'mark':60 'max':1547,1550,1555 'may':428,1494,1792 'mean':532,1019 'medium':853 'member':274,319,1391 'memori':1776,1795 'mention':1446 'menu':51,877,916,1063 'messag':1429 'meta.discourse.org':1944 'method':415,463,1760 'might':1858 'minimum':1781 'minut':697,1487 'mode':617 'moder':298,355,1128,1385 'modifi':1299 'move':903 'multipl':1885 'must':380 'name':1445,1884 'navbar':223 'navig':197 'nc':1629 'need':1793,1930 'network':1871 'new':171,471,606,626,861,891,898,993,1254,1318,1335,1387,1397,1413,1470,1476,1518,1535,1835 'news':249 'newus':1541,1546,1549,1554 'note':700,1036 'notif':475,542,1833 'number':1617 'offer':1375 'offici':276,1814 'offlin':1912 'often':966 'old':1893 'one':192,374,405,575,772,1542,1713,1771,1812,1848 'open':1331 'optim':1823 'organ':1161 'overwhelm':1139 'owner':7,1585,1612 'pad':227 'page':337,347,790,1071,1089,1188,1748,1755,1913 'parent':205 'part':392 'particip':1688 'password':425 'past':144,1042 'path':148 'patient':1657 'pencil':118 'peopl':1261,1698,1717 'per':1202,1552 'per-categori':1201 'perk':1112 'perman':793 'permiss':401 'person':733 'phpbb':1897 'pin':587,702,718,734,744,749,763,811,1229,1674 'pitch':679 'place':957,1248 'pleas':958 'post':303,842,1011,1017,1021,1416,1421,1431,1453,1578,1602 'pre':1505 'pre-vet':1504 'prefer':371 'primari':789 'privat':358,373,398,406,1428,1513 'probabl':535 'process':1851 'product':256 'profil':1444,1747,1754 'promot':1695 'proud':6 'provid':941,1279 'public':360,366,1334,1379 'pull':1955 'purpos':1671 'put':213 'question':1000 'quick':155,1961 'rate':1462 'rather':1165,1306 'read':514,550,712,1957 'realli':968 'rebuild':1915 'recategor':1151 'recommend':845,1822 'refer':963 'referenc':953 'regular':1393,1689 'relax':1533 'releas':1840 'remov':809 'repli':560,1551,1873 'repres':277 'republish':1599 'request':194,1956 'requir':72,77,87,93,151,384,469 'resourc':1798 'restrict':1405,1537 'retain':1574 'right':55,596,804,822,908,926,1068,1173,1196,1587 'rule':936 'run':1802,1939 's3':1314 'sa':1630 'safe':1376,1491 'safeti':1409,1465 'sandbox':1320,1403 'scheme':173 'search':1538 'secur':1200 'see':565,623,643,1211,1943 'seed':1678 'send':328,505,1427,1711,1762 'server':1891,1906 'servic':552,1643 'set':73,82,91,153,314,379,451,490,828,883,975,1049,1054,1199,1302,1523,1539,1862 'setup':881 'sign':322,455 'signup':473,540 'similar':1003 'simpl':837 'singl':454,773 'single-sign':453 'site':81,128,206,297,313,326,378,395,573,611,685,882,994,1053,1080,1092,1099,1105,1500,1511,1584,1594,1721,1929 'small':851 'someon':711 'sort':1290 'space':1284 'specif':726,984 'specifi':180 'staff':272,273,286,318,743,1121,1125,1759,1964 'standard':117 'start':857,1399,1962 'static':1927 'stick':846 'store':1277,1307 'stranger':688,1342 'strong':844 'style':226 'submit':1953 'suggest':1946 'superpow':36 'support':1815,1868,1872 'sure':481,1250,1665 'swap':1778 'system':1324,1350 'tab':78 'take':200,1460 'talk':699 'tast':1645 'team':1827 'term':1641 'test':464,476,501,506,511,529 'thing':639,1856 'think':673 'three':1096 'time':1355 'tip':523 'titl':997 'top':222,599,783,821,876,893,900,915,1067,1232,1652 'top-navbar':221 'topic':130,141,409,562,579,585,602,631,664,703,719,741,746,754,774,780,786,827,862,996,1041,1058,1152,1212,1224,1226,1433,1553,1677,1683,1741 'total':27 'tradit':421 'transit':1479 'tri':608 'trust':1030,1116,1323,1349,1358,1410,1481,1527 'turn':771 'twitter':434 'two':283 'understand':167,1262 'univers':935 'unpin':723 'unread':892,899 'updat':1819,1842,1950 'upgrad':1850,1917 'upload':136,146,1267,1270,1295 'upper':54,803,1195 'url':1038,1044,1048 'use':815,960,1004,1243 'user':305,336,346,382,416,534,607,627,791,1027,1114,1209,1319,1352,1398,1414,1450,1458,1471,1477,1508,1519,1536,1557,1571,1767,1910 'usernam':423 'vanilla':1898 'vbulletin':1896 'version':1836 'vet':1506 'via':37,48,174,334,563,731,1646,1726,1732,1845,1874 'view':609 'virtual':1454 'visibl':766,1122 'visit':486,660,1185,1686,1719,1852 'visitor':641,1336 'wait':107 'want':364,390,429,442,973,1638,1860 'way':1714 'welcom':581,630,663 'wiki':1016 'within':758 'without':162 'won':1179 'wordpress':1922 'work':704,969,1271 'worri':1475 'would':681 'wrench':63,64,65,342,343,818,1007 'write':666	Congratulations, you are now the proud owner of your very own Civilized Discourse Construction Kit . :hatching_chick: :hatching_chick: Admin Dashboard As an admin you have total control over this Discourse instance. Exercise your admin superpowers via the admin dashboard at /admin You can also access it via the "hamburger" ☰ menu in the upper right: Admin functions are generally marked with the wrench :wrench: :wrench: icon, so look for that. Enter Required Settings Go to the Required tab of the site settings and enter all the required fields. Until you set these required fields, your Discourse is broken! Go ahead and do that now. We'll wait. Customize Logos and Colors By default you get the standard "penciled in" Discourse logo. Look for the assets for the site design topic; follow the instructions there to upload your logos to that topic, and then paste the uploaded image paths into the required logo settings. To quickly give your Discourse a distinctive look, without having to edit or understand CSS, create a new color scheme via Customize, Colors . You can also specify custom CSS and custom HTML headers/footers to further customize the look. One common request is a navigation header that takes you back to the parent site. Here is some example HTML to put in Customize, CSS/HTML under "Header": < div id="top-navbar" class="container" style="padding:5px 0 0 5px" > < a href="http://example.com" > Home < /a > | < a href="http://example.com/about/" > About < /a > | < a href="http://example.com/news/" > News < /a > | < a href="http://example.com/products/" > Products < /a > | < a href="http://blog.example.com/blog" > Blog < /a > | < a href="http://forums.example.com/" > Forums < /a > < /div > Establish Staff Staff members are official representatives of this community. There are two kinds of Staff: Admins , who can do anything and configure anything on this site. Moderators , who can edit all posts and users, but cannot add categories or change any site settings. To add additional staff members: have them sign up on the site (or send out an invitation to join via your user page ) click the admin button :wrench: :wrench: on their user page look for the Grant Admin and Grant Moderator buttons there Private or Public? Discourse assumes you want a public discussion area. If you prefer a private one, change these login site settings : must approve users login required invite only If you only want some parts of your site to be private, edit category permissions. You already have one private category: this topic is in it! Configure Login Methods Users can log in with traditional local username and password accounts. You may want to add: Google logins Twitter logins Facebook logins GitHub logins If you want to get extra-fancy you can also set up single-sign on , or even build your own login method . Test Your Email Email is required for new account signups and notifications. Test your email to make sure it is configured correctly! Visit the admin email settings , then enter an email address in the "email address to test" field and click send test email . You got the test email? Great! Read that email closely , it has important email deliverability tips. You didn't get the test email? This means your users probably aren't getting any signup or notification emails either. Email deliverability can be hard. Read Email Service Configuration . If you'd like to enable replying to topics via email, see this howto . What and Who is this site for? One of the default topics is Welcome to Discourse . This topic is pinned globally, so it will appear on the homepage, right at the top of the topic list, for all new users. Try viewing your site with incognito, inprivate, or anonymous mode enabled in your browser to see it how new users will. Your welcome topic is important because it is the first thing you visitors will see: Where am I? Who are these discussions for? What can I find here ? Why should I visit? Edit your welcome topic and write a brief introduction to your community . Think of it as your "elevator pitch" – how would you describe this site to a stranger on an elevator when you had about 1 minute to talk? Note that pinning topics works a little differently in Discourse: Once someone reads to the bottom of a pinned topic, it is automatically unpinned for them specifically. They can change this via the personal pin controls at the bottom of the topic. When staff pins a topic, they can pin it globally to all topic lists, or just within its category. If a pin isn't visible enough, you can also turn one single topic into a banner . The banner topic floats on top of all topics and all primary pages. Users can permanently dismiss this floating banner by clicking the × in the upper right corner. To make (or remove) a pin or a banner, use the admin wrench at the top right or bottom of the topic. Set the Homepage By default your homepage is a simple list of the latest posts. We strongly recommend sticking with this homepage for small and medium communities until you start getting lots of new topics every day. You can change the homepage to the Categories list by editing top menu in the Basic Setup site settings. Change it from the default of latest|new|unread|top|categories to categories|latest|new|unread|top That is, move categories from the far right to the far left -- that leftmost top menu item is your default homepage. Build Your Own FAQ Right now your FAQ is the same Creative Commons universal rules of civilized discourse we provide to all Discourse installs. These built-in community guidelines are referenced a bunch of places; please do use them and refer to them often – they really work! However, if you want to set up a more detailed FAQ dealing with the specifics of your community, here's how: Create a new site feedback topic , titled "Frequently Asked Questions (FAQ)" or similar. Use the admin wrench icon below the post to make it a wiki post. This means the post is now editable to any user with a trust level of 1 or higher. Note the URL to that topic. Paste that URL into the faq url setting in the admin site settings. This links your topic from the hamburger FAQ menu entry at the top right of every page. Now you have a community FAQ for your site that is collaboratively editable, and linked from every page on the site. Categories You have three default categories: Site Feedback – general discussion about the site itself. It's important! Lounge – a perk for users at trust level 3 and higher Staff – visible only to staff (admins and moderators) Don't create too many initial categories , as you can overwhelm your audience. You can always add more categories, and easily bulk recategorize topics later. It's better to figure out the organization as you go rather than assuming you'll get it all right from the beginning (hint: you won't). To add a category, visit the categories page , then click Create Category at the upper right. You can set security per-category so only certain groups of users can see topics in that category. Every category has an initial "About this category" topic. This topic will be pinned to the top of the category, and the description you enter will be used in a bunch of places. Be sure to give your new category a good, clear description, so people understand what belongs there! File Uploads Basic image uploads work fine out of the box stored locally, provided you have adequate disk space. If you'd like other sorts of files to be uploaded beyond just images, modify the file settings . If you'd rather store your images and files on Amazon S3, follow this howto . New User Sandbox and the Trust System If your discussion area is be open to the public, new visitors will arrive that are initially strangers to the community. Discourse has a trust system where users can, over time, earn the trust of the community and gain abilities to assist in governing their community. Discourse is designed to offer safe defaults for public communities, even with no active moderation. 0 (new) → 1 (basic) → 2 (member) → 3 (regular) → 4 (leader) All new users start out in a sandbox with restrictions for everyone's safety. Trust level 0 (new) users cannot … post more than 2 hyperlinks post any images or file attachments send private messages flag posts or topics have actual links in the "about me" field of their profile @name mention more than 2 users in a post Virtually every action a user can take is rate limited for safety, and especially so for new users. But don't worry, new users can transition to trust level 1 in about 15 minutes. These defaults are safe, but they may be too conservative for your site: If you are pre-vetting all users, or your site is private and you approve all new users manually, you can set everyone's default trust level to 1. You can relax individual new user restrictions. Search settings for newuser . Ones commonly adjusted are newuser max images , newuser max replies per topic , newuser max links . User Content Licensing Out of the box, Discourse defaults to Creative Commons licensing . Your users will always retain copyright on their posts, and will always grant the site owner enough rights to include their content on the site. Who is allowed to republish the content posted on this forum? Only the author Author and the owner of this forum Anybody* Number 3 is the Discourse default – that's Creative Commons BY-NC-SA 3.0 . If that's not what you want, edit the Terms of Service to taste via the edit link at the top. Building Your Community Be patient; building communities is hard. Before launching, be sure to: Define your community's purpose in a pinned or banner topic. Seed the discussion with interesting topics. Commit to visiting and participating regularly. Link your community everywhere and promote it so people can find it. There's more advice at Building a Discourse Community . Sending Invitations One way to get people to visit your site is to invite them via email. You can do this via: The Invite button at the bottom of the topic. The Invite area on your profile page. The invite area on your profile page also includes advanced Staff methods of sending bulk invites , and inviting users into groups . Maintenance One CPU and 1GB of memory, with swap, is the minimum for a basic Discourse community. As your community grows you may need more memory or CPU resources. Hopefully you are running in our Docker container install ; it's the only one we officially support. It guarantees easy updates, and all recommended optimizations from the Discourse team. You should get an email notification when new versions of Discourse are released. To update your instance via our easy one click upgrade process, visit /admin/upgrade . Some other things you might eventually want to set up: Automatic daily backups HTTPS support Content Delivery Network support Reply via Email Import and Export your data Change the domain name Multiple Discourse instances on the same server Import old content from vBulletin, PHPbb, Vanilla, Drupal, BBPress, etc A firewall on your server? Configure firewall . A user friendly offline page when rebuilding or upgrading? Embed Discourse in your WordPress install , or on your static HTML site Need more Help? For more assistance on configuring and running your Discourse forum, see meta.discourse.org . Have suggestions to improve or update this guide? Submit a pull request . READ ME FIRST: Admin Quick Start Guide Staff	en
14	'/b':245,250 '10':258 'abil':541 'access':371 'action':262,265,314 'activ':408 'also':126,468 'alway':63,167 'appear':34,360 'appreci':281 'arriv':31,388 'author':320 'automat':35,177,426 'away':392 'b':243,248 'bar':117 'bbcode':235 'begin':194 'behalf':430 'behavior':554 'believ':550 'bold':240,244,249 'bookmark':328 'bottom':80,105,119,269,458 'button':54,156,266,287,305,310 'categori':473,487 'chang':446,489 'civil':552 'communic':565 'communiti':498,547,553 'compos':172 'consid':402 'continu':168 'control':455 'copi':294 'copy-past':293 'count':85 'creat':412 'date':89 'day':399 'discours':4,580 'draft':179 'editor':160 'email':384 'emoji':201 'enjoy':279,558 'enter':75 'even':351 'everi':481 'expand':122 'extend':422 'find':330 'flag':315 'format':231,253 'fun':257 'gain':534 'generat':214 'get':14,514 'grab':291 'great':502 'hand':461 'help':543 'html':234 'icon':53 'immedi':359 'includ':539 'indic':439 'insert':142 'instead':81 'interact':260 'join':3 'jump':101 'keep':22,527 'keyboard':130,138 'know':276,324,516 'last':87,108 'later':333 'less':396 'let':274,318 'level':537 'lift':526 'like':286 'limit':523 'line':224 'link':219,296,304,352 'list':133 'll':382,513,533 'love':290 'manag':545 'markdown':237 'match':205 'meet':504 'member':568 'mention':189,347 'menu':50 'messag':577 'minut':259 'miss':378 'multipl':163 'mute':480 'name':191,207 'navig':42 'need':37,563 'new':26,29,403,435,482,521,535,571 'next':68,440 'notif':338,373,386,448,454,470 'notifi':184 'number':357,438 'old':400 'open':158 'page':41,47,337,367 'particip':409,508,528 'past':220 'pasteabl':295 'per':472 'period':423 'posit':110 'post':272,283,332,346,355 'prefer':393,497 'press':127,153 'privat':317 'problem':327 'profil':336 'progress':116 'quick':11 'quot':144,151,164,344 'read':17,19,91,109,169,418 'refresh':39 'repeat':161 'repli':27,70,84,88,140,155,174,188,228,299,341,380,414,574 'reveal':312 'right':57,99,120,364,460 'save':178 'screen':113 'scroll':23 'search':44 'see':433,494 'select':58,82,114,145,195,368 'set':469,493 'share':288 'shortcut':139 'show':308 'side':462 'simpl':233 'smaller':112 'smiley':212 'someon':185,275,340 'special':540 'specif':486 'speedi':137 'staff':323,567 'standard':200 'start':16 'state':471 'stay':560 'summari':216 'super':136 'super-speedi':135 'take':64 'temporari':520 'text':147 'thank':1 'time':511,531,557 'timelin':96 'tip':12,254 'titl':61 'togeth':548 'top':78,104,363 'topic':30,60,73,93,301,395,405,443,451,465,483 'track':427 'tradit':211 'tri':255 'trust':499,536 'tutori':261 'two':398 'type':192,203 'unread':69,437 'upper':56 'us':544 'use':51,94,199,209,232,284,306 'user':46,496,522,572 'usernam':197,349 've':407 'via':302,452 'want':476 'watch':478 'welcom':6,578 'wish':149 'worri':376 'write':182	Thanks for joining Discourse, and welcome! Here are a few quick tips to get you started: Reading To read more, just keep scrolling down! As new replies or new topics arrive, they will appear automatically – no need to refresh the page. Navigation For search, your user page, or the ☰ menu, use the icon buttons at upper right . Selecting a topic title will always take you to your next unread reply in the topic. To enter at the top or bottom instead, select the reply count or last reply date. While reading a topic, use the timeline on the right to jump to the top, bottom, or your last read position. On smaller screens, select the progress bar at bottom right to expand it: You can also press ? on your keyboard for a list of super-speedy keyboard shortcuts. Replying To insert a quote, select the text you wish to quote, then press any Reply button to open the editor. Repeat for multiple quotes. You can always continue reading while you compose your reply, and we automatically save drafts as you write. To notify someone about your reply, mention their name. Type @ to begin selecting a username. To use standard Emoji , just type : to match by name, or use the traditional smileys ;) To generate a summary for a link, paste it on a line by itself: Your reply can be formatted using simple HTML, BBCode, or Markdown : This is **bold**. This is < b > bold < /b > . This is [b]bold[/b]. For more formatting tips, try our fun 10 minute interactive tutorial! Actions There are action buttons at the bottom of each post: To let someone know that you enjoyed and appreciated their post, use the like button. Share the love! Grab a copy-pasteable link to any reply or topic via the link button. Use the … show more button to reveal more actions. Flag to privately let the author, or our staff , know about a problem. Bookmark to find this post later on your profile page. Notifications When someone replies to you, quotes your post, mentions your @username , or even links to your post, a number will immediately appear at the top right of the page. Select it to access your notifications . Don't worry about missing a reply – you'll be emailed any notifications that arrive when you are away. Preferences All topics less than two days old are considered new. Any topic you've actively participated in (by creating it, replying to it, or reading it for an extended period) will be automatically tracked on your behalf. You will see the new and unread number indicators next to these topics: You can change your notifications for any topic via the notification control at the bottom, and right hand side, of each topic. You can also set notification state per category, if you want to watch or mute every new topic in a specific category. To change any of these settings, see your user preferences . Community Trust It's great to meet you! As you participate here, over time we'll get to know you, and your temporary new user limitations will be lifted. Keep participating, and over time you'll gain new trust levels that include special abilities to help us manage our community together. We believe in civilized community behavior at all times. Enjoy your stay! (If you need to communicate with staff members as a new user, just reply to this message.) Welcome to Discourse!	en
15	'200':28 'alreadi':82 'anoth':101 'appear':16,42 'area':21 'brief':7 'categori':12,19,39,45,58,67,80,89,96,102,108 'charact':29 'ckan':107,109 'contain':91 'creat':36 'descript':8,34,54 'differ':76 'edit':32 'establish':57 'exact':73 'first':3 'follow':49 'general':90 'guidanc':14 'guidelin':59 'keep':25 'longer':53 'merg':99 'need':94 'new':11 'page':46 'paragraph':4,50 'peopl':64 'replac':1 'rule':61 'select':20 'subcategori':104 'topic':37,86 'tri':23 'use':47,65 'won':40	(Replace this first paragraph with a brief description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this description or create topics, this category won't appear on the categories page. ) Use the following paragraphs for a longer description, or to establish category guidelines or rules: Why should people use this category? What is it for? How exactly is this different than the other categories we already have? What should topics in this category generally contain? Do we need this category? Can we merge with another category, or subcategory? About the ckan category ckan	en
16	'/b':245,250 '10':258 'abil':541 'access':371 'action':262,265,314 'activ':408 'also':126,468 'alway':63,167 'appear':34,360 'appreci':281 'arriv':31,388 'author':320 'automat':35,177,426 'away':392 'b':243,248 'bar':117 'bbcode':235 'begin':194 'behalf':430 'behavior':554 'believ':550 'bold':240,244,249 'bookmark':328 'bottom':80,105,119,269,458 'button':54,156,266,287,305,310 'categori':473,487 'chang':446,489 'civil':552 'communic':565 'communiti':498,547,553 'compos':172 'consid':402 'continu':168 'control':455 'copi':294 'copy-past':293 'count':85 'creat':412 'date':89 'day':399 'discours':4,580 'draft':179 'editor':160 'email':384 'emoji':201 'enjoy':279,558 'enter':75 'even':351 'everi':481 'expand':122 'extend':422 'find':330 'flag':315 'format':231,253 'fun':257 'gain':534 'generat':214 'get':14,514 'grab':291 'great':502 'hand':461 'help':543 'html':234 'icon':53 'immedi':359 'includ':539 'indic':439 'insert':142 'instead':81 'interact':260 'join':3 'jump':101 'keep':22,527 'keyboard':130,138 'know':276,324,516 'last':87,108 'later':333 'less':396 'let':274,318 'level':537 'lift':526 'like':286 'limit':523 'line':224 'link':219,296,304,352 'list':133 'll':382,513,533 'love':290 'manag':545 'markdown':237 'match':205 'meet':504 'member':568 'mention':189,347 'menu':50 'messag':577 'minut':259 'miss':378 'multipl':163 'mute':480 'name':191,207 'navig':42 'need':37,563 'new':26,29,403,435,482,521,535,571 'next':68,440 'notif':338,373,386,448,454,470 'notifi':184 'number':357,438 'old':400 'open':158 'page':41,47,337,367 'particip':409,508,528 'past':220 'pasteabl':295 'per':472 'period':423 'posit':110 'post':272,283,332,346,355 'prefer':393,497 'press':127,153 'privat':317 'problem':327 'profil':336 'progress':116 'quick':11 'quot':144,151,164,344 'read':17,19,91,109,169,418 'refresh':39 'repeat':161 'repli':27,70,84,88,140,155,174,188,228,299,341,380,414,574 'reveal':312 'right':57,99,120,364,460 'save':178 'screen':113 'scroll':23 'search':44 'see':433,494 'select':58,82,114,145,195,368 'set':469,493 'share':288 'shortcut':139 'show':308 'side':462 'simpl':233 'smaller':112 'smiley':212 'someon':185,275,340 'special':540 'specif':486 'speedi':137 'staff':323,567 'standard':200 'start':16 'state':471 'stay':560 'summari':216 'super':136 'super-speedi':135 'take':64 'temporari':520 'text':147 'thank':1 'time':511,531,557 'timelin':96 'tip':12,254 'titl':61 'togeth':548 'top':78,104,363 'topic':30,60,73,93,301,395,405,443,451,465,483 'track':427 'tradit':211 'tri':255 'trust':499,536 'tutori':261 'two':398 'type':192,203 'unread':69,437 'upper':56 'us':544 'use':51,94,199,209,232,284,306 'user':46,496,522,572 'usernam':197,349 've':407 'via':302,452 'want':476 'watch':478 'welcom':6,578 'wish':149 'worri':376 'write':182	Thanks for joining Discourse, and welcome! Here are a few quick tips to get you started: Reading To read more, just keep scrolling down! As new replies or new topics arrive, they will appear automatically – no need to refresh the page. Navigation For search, your user page, or the ☰ menu, use the icon buttons at upper right . Selecting a topic title will always take you to your next unread reply in the topic. To enter at the top or bottom instead, select the reply count or last reply date. While reading a topic, use the timeline on the right to jump to the top, bottom, or your last read position. On smaller screens, select the progress bar at bottom right to expand it: You can also press ? on your keyboard for a list of super-speedy keyboard shortcuts. Replying To insert a quote, select the text you wish to quote, then press any Reply button to open the editor. Repeat for multiple quotes. You can always continue reading while you compose your reply, and we automatically save drafts as you write. To notify someone about your reply, mention their name. Type @ to begin selecting a username. To use standard Emoji , just type : to match by name, or use the traditional smileys ;) To generate a summary for a link, paste it on a line by itself: Your reply can be formatted using simple HTML, BBCode, or Markdown : This is **bold**. This is < b > bold < /b > . This is [b]bold[/b]. For more formatting tips, try our fun 10 minute interactive tutorial! Actions There are action buttons at the bottom of each post: To let someone know that you enjoyed and appreciated their post, use the like button. Share the love! Grab a copy-pasteable link to any reply or topic via the link button. Use the … show more button to reveal more actions. Flag to privately let the author, or our staff , know about a problem. Bookmark to find this post later on your profile page. Notifications When someone replies to you, quotes your post, mentions your @username , or even links to your post, a number will immediately appear at the top right of the page. Select it to access your notifications . Don't worry about missing a reply – you'll be emailed any notifications that arrive when you are away. Preferences All topics less than two days old are considered new. Any topic you've actively participated in (by creating it, replying to it, or reading it for an extended period) will be automatically tracked on your behalf. You will see the new and unread number indicators next to these topics: You can change your notifications for any topic via the notification control at the bottom, and right hand side, of each topic. You can also set notification state per category, if you want to watch or mute every new topic in a specific category. To change any of these settings, see your user preferences . Community Trust It's great to meet you! As you participate here, over time we'll get to know you, and your temporary new user limitations will be lifted. Keep participating, and over time you'll gain new trust levels that include special abilities to help us manage our community together. We believe in civilized community behavior at all times. Enjoy your stay! (If you need to communicate with staff members as a new user, just reply to this message.) Welcome to Discourse!	en
17	'/b':181,187 '10':195 'abruf':375 'aktion':278 'aktionsbutton':284 'aktiv':423 'alt':154,413 'anfang':110 'angezeigt':344 'ankomm':31,403 'anmeld':3 'anpass':458 'antwort':119,126,137,148,216,380,428,561 'antworten-knopf':215 'antwortet':352 'anzuzeig':118 'aufgehob':515 'aufmerksam':233,320 'aufzuruf':52 'aug':554 'ausreich':519 'ausserd':323 'auszuwahl':244 'automat':35,159,433 'autor':313 'b':178,184 'bbcod':167 'befind':282 'beitrag':30,70,80,152,162,232,281,292,309,328,351,354 'beitragszahl':74 'benachricht':346,374,388 'benutz':53,71,127,138,149,192,250,513,551 'benutzernam':243,358 'beobacht':477 'bestimmt':475 'blau':440 'bringt':65 'community':502,531,544 'dank':1 'darauf':319 'dass':289 'datum':77 'den':421,528 'discours':5,568 'druck':111,295 'e':393 'e-mail':392 'eig':275 'einfach':24,165,252,272,562 'einschrank':510 'einstell':405,467,487 'einstieg':15 'einzufug':201,226 'einzusteig':87 'emoji':248 'end':457 'erhalt':523 'erleicht':17 'erreich':522 'erschein':33 'erst':68 'erstell':427 'erwahn':236 'erwahnt':359 'fahig':526 'fall':396,468 'feststell':310 'fett':174,179,185 'find':446 'formatiert':170 'fortschrittsanzeig':97 'freud':302 'fug':270 'funktion':481 'fur':2 'ganz':82,85,128,465 'gedruckt':175,180,186 'gefall':293 'geh':484 'gelt':415 'gemeinsam':532 'generi':269 'gesamt':123 'gib':239 'hast':425 'heart':297,298 'hoh':520 'html':166 'indikator':445 'informationsmodus':450,462 'interaktiv':194 'jemand':228,286,348 'kann':93,220,322,371,448,460 'kategori':466,476 'klick':59,102,211 'knopf':217,299 'komm':106 'konfiguri':483 'lad':42 'lang':430 'lauf':496 'lern':191 'les':18,22,90,431 'lesezeich':336 'letzt':79 'link':267,325 'list':114 'mach':311 'mail':394 'markdown':169,190 'mehr':20,224 'meld':318 'menu':51,455 'merk':333 'minut':196 'mitarbeit':558 'mitglied':506 'mocht':188,209,560 'moderator':316 'musst':37,381 'nachricht':565 'nam':238,255 'navigation':43 'navigi':100 'neb':435 'neu':29,41,145,156,417,444,471,512,525,550 'neu-indikator':443 'oben':56,83,365 'onlin':399 'per':391 'person':135 'post':141 'praktisch':116 'probl':306 'profilseit':48,343 'recht':57,99,150,366 'red':559 'schaltflach':55 'schnell':108 'scroll':23 'sei':6 'seit':39,132,369 'smileys':261 'sofort':362 'sorg':385 'spass':546 'spat':340 'standard':247 'standard-emoji':246 'stattdess':72 'stet':539 'such':46,257 'tag':412 'tastenkurzeln':117 'teil':300,329 'teilgenomm':424 'teilnahm':491 'text':204 'them':157,407,419,437 'thema':124,146,472 'themas':64,92,452 'tipp':251 'tipps':11 'titel':62,105 'traditionell':260 'tutorial':197 'ungeles':69 'uns':530,543,557 'unt':27,86,98,129 'verdi':503 'verfolgt':434 'verhalt':541 'verlinkt':160 'verpass':378 'verseh':337 'vertrau':488,500 'vertrauensstuf':521 'verwalt':533 'verwend':259 'vier':553 'vollstand':505 'vorgang':219 'wahl':202 'wenig':409 'wiederhol':222 'will':478 'willkomm':7,566 'wunsch':536 'zahl':364,441 'zeig':288 'zeigt':360 'zeil':276 'zeit':498 'zitat':200,225 'ziti':208 'zitiert':355 'zivilisiert':540 'zugeschickt':395 'zusammenfass':264 'zwei':411	Danke fürs Anmelden bei Discourse, sei willkommen! Hier sind einige Tipps um dir den Einstieg zu erleichtern. Lesen Um mehr zu lesen scrolle einfach weiter nach unten! Wenn neue Beiträge ankommen werden erscheinen diese automatisch – du musst die Seite nicht neu laden. Navigation Um die Suche, deine Profilseite oder das Menü ☰ aufzurufen benutze die Schaltflächen oben rechts . Das Klicken auf den Titel eines Themas bringt dich zum ersten ungelesenen Beitrag . Benutze stattdessen die Beitragszahl oder das Datum des letzten Beitrags um ganz oben oder ganz unten einzusteigen. Während des Lesens eines Themas kannst du mit der Fortschrittsanzeige unten rechts navigieren. Durch Klick auf den Titel kommst du schnell zum Anfang. Drücke ? um eine Liste von praktischen Tastenkürzeln anzuzeigen. Antworten Um auf das gesamte Thema zu antworten benutze ganz unten auf der Seite. Um einer Person zu antworten benutze auf ihrem Post. Um mit einem neuen Thema zu antworten benutze rechts vom Beitrag. Die alten und neuen Themen werden automatisch verlinkt. Dein Beitrag kann mit einfachem HTML, BBCode oder Markdown : formatiert werden: Das ist **fett gedruckt**. Das ist < b > fett gedruckt < /b > . Das ist [b]fett gedruckt[/b]. Möchtest du Markdown lernen? Benutze unser interaktives, 10-minütiges Tutorial! Um ein Zitat einzufügen wähle den Text aus, den zu zitieren möchtest, und klicke dann auf einen Antworten-Knopf. Den Vorgang kannst du wiederholen, um mehrere Zitate einzufügen! Um jemanden in auf deinen Beitrag aufmerksam zu machen erwähne seinen Namen. Gib @ ein, um einen Benutzernamen auszuwählen. Um Standard-Emoji zu benutzen tippe einfach : um nach Namen zu suchen, oder verwende traditionelle Smileys :) Um eine Zusammenfassung für einen Link zu generieren, füge ihn einfach in einer eigenen Zeile ein: Aktionen Unter jedem Beitrag befinden sich Aktionsbuttons: Um jemandem zu zeigen dass dir sein Beitrag gefallen hat, drücke den :heart: :heart: -Knopf. Teile deine Freude! Wenn du ein Problem mit einem Beitrag feststellst, mach den Autor oder die Moderatoren durch Melden darauf aufmerksam. Du kannst außerdem einen Link zu einem Beitrag teilen , oder ihn zum Merken mit einem Lesezeichen versehen, damit er später auf deiner Profilseite angezeigt wird. Benachrichtigungen Wenn jemand auf deinen Beitrag antwortet, deinen Beitrag zitiert oder deinen @Benutzernamen erwähnt, zeigt sich sofort eine Zahl oben rechts auf der Seite. Dort kannst du deine Benachrichtigungen abrufen. Um das Verpassen von Antworten musst du dir keine Sorgen machen – alle Benachrichtigungen werden dir per E-Mail zugeschickt falls du nicht online bist wenn sie ankommen. Deine Einstellungen Alle Themen die weniger als zwei Tage alt sind gelten als neu. Alle Themen an denen du aktiv teilgenommen hast (durch Erstellen, Antworten oder längeres Lesen) werden automatisch verfolgt. Neben diesen Themen wirst du blaue Zahlen und Neu-Indikatoren finden: Du kannst den Informationsmodus eines Themas mit dem Menü am Ende anpassen. Du kannst den Informationsmodus auch für ganze Kategorien einstellen falls du jedes neue Thema in einer bestimmten Kategorie beobachten willst. Um diese Funktion zu konfigurieren, gehe in deine Einstellungen . Vertrauen Durch deine Teilnahme wirst du dir im Laufe der Zeit das Vertrauen der Community verdienen, ein vollständiges Mitglied werden und die Einschränkungen für neue Benutzer werden aufgehoben. Wenn du eine ausreichend hohe Vertrauensstufe erreichst erhältst du neue Fähigkeiten mit denen wir unsere Community gemeinsam verwalten können. Wir wünschen uns ein stets zivilisiertes Verhalten in unserer Community . Viel Spaß! (Wenn du als neuer Benutzer unter vier Augen mit einem unserer Mitarbeiter reden möchtest, antworte einfach auf diese Nachricht.) Willkommen bei Discourse!	de
18	'/dataset/haltestellen':14 '0':3 'begleitthema':7 'beitrag':10 'ckan':18 'datensatz':16 'follow':2 'haltestell':1,15 'ogdch.dev':13 'ogdch.dev/dataset/haltestellen':12 'opendata.swiss':17 'ursprung':9	Haltestellen Follower 0 Dies ist ein Begleitthema zum ursprünglichen Beitrag unter http://ogdch.dev/dataset/haltestellen Haltestellen - Datensätze - opendata.swiss ckan	de
19	'2':56 'angezeigt':59 'beacht':44 'behandl':23 'beitrag':7,12,57,58 'bitt':38,45 'ckan':63 'dank':4 'datensatz':61 'discours':3 'erst':55 'erwartest.kritik':33 'fugt':10 'gesprach':14 'gesprachspartn':25 'haltestell':60 'hilfetext':50 'hinzu':17 'ide':41 'kritisi':39 'mensch':43 'neu':16 'opendata.swiss':62 'ordnung':36 'respekt':28 'richtlini':48 'sei':19 'thema':9 'uns':47 'wenig':22 'willkomm':1	Willkommen bei Discourse — Danke für deinen Beitrag zum Thema! Fügt dein Beitrag dem Gespräch etwas Neues hinzu, und sei es auch wenig?Behandle deine Gesprächspartner mit demselben Respekt, den du von ihnen erwartest.Kritik ist in Ordnung, aber bitte kritisiere nur Ideen, nicht Menschen. Beachte bitte auch unsere Richtlinien. Dieser Hilfetext wird nur bei deinen ersten 2 Beiträge Beiträgen angezeigt. Haltestellen - Datensätze - opendata.swiss ckan	de
\.


--
-- Data for Name: post_stats; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_stats (id, post_id, drafts_saved, typing_duration_msecs, composer_open_duration_msecs, created_at, updated_at) FROM stdin;
1	1	0	0	0	2016-06-14 16:53:33.20765	2016-06-14 16:53:33.20765
2	2	0	0	0	2016-06-14 16:53:33.327192	2016-06-14 16:53:33.327192
3	3	0	0	0	2016-06-14 16:53:33.443932	2016-06-14 16:53:33.443932
4	4	0	0	0	2016-06-14 16:53:33.647535	2016-06-14 16:53:33.647535
5	5	0	0	0	2016-06-14 16:53:33.860637	2016-06-14 16:53:33.860637
6	6	0	0	0	2016-06-14 16:53:33.957876	2016-06-14 16:53:33.957876
7	7	0	0	0	2016-06-14 16:53:34.059826	2016-06-14 16:53:34.059826
8	8	0	0	0	2016-06-14 16:53:34.150175	2016-06-14 16:53:34.150175
9	9	0	0	0	2016-06-14 16:53:34.218819	2016-06-14 16:53:34.218819
10	10	0	0	0	2016-06-14 16:53:34.305206	2016-06-14 16:53:34.305206
11	11	0	0	0	2016-06-14 16:53:34.388877	2016-06-14 16:53:34.388877
12	12	0	0	0	2016-06-14 16:53:34.465633	2016-06-14 16:53:34.465633
13	13	0	0	0	2016-06-14 16:53:34.698509	2016-06-14 16:53:34.698509
14	14	0	0	0	2016-06-15 08:17:09.716342	2016-06-15 08:17:09.716342
15	16	0	0	0	2016-06-15 08:19:42.374166	2016-06-15 08:19:42.374166
16	17	0	0	0	2016-06-15 08:22:18.447164	2016-06-15 08:22:18.447164
17	18	0	0	0	2016-06-15 08:52:08.480444	2016-06-15 08:52:08.480444
18	19	1	1900	10430	2016-06-15 09:03:13.001067	2016-06-15 09:03:13.001067
\.


--
-- Name: post_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('post_stats_id_seq', 18, true);


--
-- Data for Name: post_timings; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_timings (topic_id, post_number, user_id, msecs) FROM stdin;
1	1	-1	5000
2	1	-1	5000
3	1	-1	5000
4	1	-1	5000
4	2	-1	5000
5	1	-1	5000
5	2	-1	5000
6	1	-1	5000
6	2	-1	5000
7	1	-1	5000
8	1	-1	5000
9	1	-1	5000
10	1	-1	5000
11	1	-1	5000
13	1	-1	5000
14	1	-1	5000
15	1	5	5000
15	1	6	16003
15	2	6	6852
\.


--
-- Data for Name: post_uploads; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY post_uploads (id, post_id, upload_id) FROM stdin;
\.


--
-- Name: post_uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('post_uploads_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY posts (id, user_id, topic_id, post_number, raw, cooked, created_at, updated_at, reply_to_post_number, reply_count, quote_count, deleted_at, off_topic_count, like_count, incoming_link_count, bookmark_count, avg_time, score, reads, post_type, vote_count, sort_order, last_editor_id, hidden, hidden_reason_id, notify_moderators_count, spam_count, illegal_count, inappropriate_count, last_version_at, user_deleted, reply_to_user_id, percent_rank, notify_user_count, like_score, deleted_by_id, edit_reason, word_count, version, cook_method, wiki, baked_at, baked_version, hidden_at, self_edits, reply_quoted, via_email, raw_email, public_version, action_code) FROM stdin;
19	6	15	2	Willkommen bei Discourse — Danke für deinen Beitrag zum Thema!\n\nFügt dein Beitrag dem Gespräch etwas Neues hinzu, und sei es auch wenig?Behandle deine Gesprächspartner mit demselben Respekt, den du von ihnen erwartest.Kritik ist in Ordnung, aber bitte kritisiere nur Ideen, nicht Menschen.\n\nBeachte bitte auch unsere Richtlinien. Dieser Hilfetext wird nur bei deinen ersten 2 Beiträge Beiträgen angezeigt.	<p>Willkommen bei Discourse — Danke für deinen Beitrag zum Thema!</p>\n\n<p>Fügt dein Beitrag dem Gespräch etwas Neues hinzu, und sei es auch wenig?Behandle deine Gesprächspartner mit demselben Respekt, den du von ihnen erwartest.Kritik ist in Ordnung, aber bitte kritisiere nur Ideen, nicht Menschen.</p>\n\n<p>Beachte bitte auch unsere Richtlinien. Dieser Hilfetext wird nur bei deinen ersten 2 Beiträge Beiträgen angezeigt.</p>	2016-06-15 09:03:12.987275	2016-06-15 09:03:35.866734	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	2	6	f	\N	0	0	0	0	2016-06-15 09:03:12.996035	f	\N	1	0	0	\N	\N	60	1	1	f	2016-06-15 09:03:35.866403	1	\N	1	f	f	\N	1	\N
1	-1	1	1	A category exclusive to members with trust level 3 and higher.	<p>A category exclusive to members with trust level 3 and higher.</p>	2016-06-14 16:53:33.049975	2016-06-14 16:53:33.049975	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:33.205162	f	\N	0	0	0	\N	\N	11	1	1	f	2016-06-14 16:53:33.049841	1	\N	0	f	f	\N	1	\N
2	-1	2	1	Discussion about this site, its organization, how it works, and how we can improve it.	<p>Discussion about this site, its organization, how it works, and how we can improve it.</p>	2016-06-14 16:53:33.318374	2016-06-14 16:53:33.318374	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:33.324525	f	\N	0	0	0	\N	\N	15	1	1	f	2016-06-14 16:53:33.318223	1	\N	0	f	f	\N	1	\N
3	-1	3	1	Private category for staff discussions. Topics are only visible to admins and moderators.	<p>Private category for staff discussions. Topics are only visible to admins and moderators.</p>	2016-06-14 16:53:33.428943	2016-06-14 16:53:33.428943	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:33.441339	f	\N	0	0	0	\N	\N	13	1	1	f	2016-06-14 16:53:33.428807	1	\N	0	f	f	\N	1	\N
4	-1	4	1	The following terms and conditions govern all use of the company_domain website and all content, services and products available at or through the website, including, but not limited to, company_domain Forum Software, company_domain Support Forums and the company_domain Hosting service ("Hosting"), (taken together, the Website). The Website is owned and operated by company_full_name ("company_short_name"). The Website is offered subject to your acceptance without modification of all of the terms and conditions contained herein and all other operating rules, policies (including, without limitation, company_domain’s [Privacy Policy](/privacy) and [Community Guidelines](/faq)) and procedures that may be published from time to time on this Site by company_short_name (collectively, the "Agreement").\n\nPlease read this Agreement carefully before accessing or using the Website. By accessing or using any part of the web site, you agree to become bound by the terms and conditions of this agreement. If you do not agree to all the terms and conditions of this agreement, then you may not access the Website or use any services. If these terms and conditions are considered an offer by company_short_name, acceptance is expressly limited to these terms. The Website is available only to individuals who are at least 13 years old.\n\n<a name="1"></a>\n\n## [1. Your company_domain Account](#1)\n\nIf you create an account on the Website, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account. You must immediately notify company_short_name of any unauthorized uses of your account or any other breaches of security. company_short_name will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions.\n\n<a name="2"></a>\n\n## [2. Responsibility of Contributors](#2)\n\nIf you post material to the Website, post links on the Website, or otherwise make (or allow any third party to make) material available by means of the Website (any such material, "Content"), You are entirely responsible for the content of, and any harm resulting from, that Content. That is the case regardless of whether the Content in question constitutes text, graphics, an audio file, or computer software. By making Content available, you represent and warrant that:\n\n*   the downloading, copying and use of the Content will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark or trade secret rights, of any third party;\n*   if your employer has rights to intellectual property you create, you have either (i) received permission from your employer to post or make available the Content, including but not limited to any software, or (ii) secured from your employer a waiver as to all rights in or to the Content;\n*   you have fully complied with any third-party licenses relating to the Content, and have done all things necessary to successfully pass through to end users any required terms;\n*   the Content does not contain or install any viruses, worms, malware, Trojan horses or other harmful or destructive content;\n*   the Content is not spam, is not machine- or randomly-generated, and does not contain unethical or unwanted commercial content designed to drive traffic to third party sites or boost the search engine rankings of third party sites, or to further unlawful acts (such as phishing) or mislead recipients as to the source of the material (such as spoofing);\n*   the Content is not pornographic, does not contain threats or incite violence, and does not violate the privacy or publicity rights of any third party;\n*   your content is not getting advertised via unwanted electronic messages such as spam links on newsgroups, email lists, blogs and web sites, and similar unsolicited promotional methods;\n*   your content is not named in a manner that misleads your readers into thinking that you are another person or company; and\n*   you have, in the case of Content that includes computer code, accurately categorized and/or described the type, nature, uses and effects of the materials, whether requested to do so by company_short_name or otherwise.\n\n<a name="3"></a>\n\n## [3. User Content License](#3)\n\nUser contributions are licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US). Without limiting any of those representations or warranties, company_short_name has the right (though not the obligation) to, in company_short_name’s sole discretion (i) refuse or remove any content that, in company_short_name’s reasonable opinion, violates any company_short_name policy or is in any way harmful or objectionable, or (ii) terminate or deny access to and use of the Website to any individual or entity for any reason, in company_short_name’s sole discretion. company_short_name will have no obligation to provide a refund of any amounts previously paid.\n\n\n<a name="4"></a>\n\n## [4. Payment and Renewal](#4)\n\n### General Terms\n\nOptional paid services or upgrades may be available on the Website. When utilizing an optional paid service or upgrade, you agree to pay company_short_name the monthly or annual subscription fees indicated. Payments will be charged on a pre-pay basis on the day you begin utilizing the service or upgrade and will cover the use of that service or upgrade for a monthly or annual subscription period as indicated. These fees are not refundable.\n\n### Automatic Renewal\n\nUnless you notify company_short_name before the end of the applicable subscription period that you want to cancel a service or upgrade, your subscription will automatically renew and you authorize us to collect the then-applicable annual or monthly subscription fee (as well as any taxes) using any credit card or other payment mechanism we have on record for you. Subscriptions can be canceled at any time.\n\n<a name="5"></a>\n\n## [5. Services](#5)\n\n### Hosting, Support Services\n\nOptional Hosting and Support services may be provided by company_short_name under the terms and conditions for each such service. By signing up for a Hosting/Support or Support services account, you agree to abide by such terms and conditions.\n\n<a name="6"></a>\n\n## [6. Responsibility of Website Visitors](#6)\n\ncompany_short_name has not reviewed, and cannot review, all of the material, including computer software, posted to the Website, and cannot therefore be responsible for that material’s content, use or effects. By operating the Website, company_short_name does not represent or imply that it endorses the material there posted, or that it believes such material to be accurate, useful or non-harmful. You are responsible for taking precautions as necessary to protect yourself and your computer systems from viruses, worms, Trojan horses, and other harmful or destructive content. The Website may contain content that is offensive, indecent, or otherwise objectionable, as well as content containing technical inaccuracies, typographical mistakes, and other errors. The Website may also contain material that violates the privacy or publicity rights, or infringes the intellectual property and other proprietary rights, of third parties, or the downloading, copying or use of which is subject to additional terms and conditions, stated or unstated. company_short_name disclaims any responsibility for any harm resulting from the use by visitors of the Website, or from any downloading by those visitors of content there posted.\n\n<a name="7"></a>\n\n## [7. Content Posted on Other Websites](#7)\n\nWe have not reviewed, and cannot review, all of the material, including computer software, made available through the websites and webpages to which company_domain links, and that link to company_domain. company_short_name does not have any control over those non-company_domain websites and webpages, and is not responsible for their contents or their use. By linking to a non-company_domain website or webpage, company_short_name does not represent or imply that it endorses such website or webpage. You are responsible for taking precautions as necessary to protect yourself and your computer systems from viruses, worms, Trojan horses, and other harmful or destructive content. company_short_name disclaims any responsibility for any harm resulting from your use of non-company_domain websites and webpages.\n\n<a name="8"></a>\n\n## [8. Copyright Infringement and DMCA Policy](#8)\n\nAs company_short_name asks others to respect its intellectual property rights, it respects the intellectual property rights of others. If you believe that material located on or linked to by company_domain violates your copyright, and if this website resides in the USA, you are encouraged to notify company_short_name in accordance with company_short_name’s [Digital Millennium Copyright Act](http://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act) ("DMCA") Policy. company_short_name will respond to all such notices, including as required or appropriate by removing the infringing material or disabling all links to the infringing material. company_short_name will terminate a visitor’s access to and use of the Website if, under appropriate circumstances, the visitor is determined to be a repeat infringer of the copyrights or other intellectual property rights of company_short_name or others. In the case of such termination, company_short_name will have no obligation to provide a refund of any amounts previously paid to company_short_name.\n\n<a name="9"></a>\n\n## [9. Intellectual Property](#9)\n\nThis Agreement does not transfer from company_short_name to you any company_short_name or third party intellectual property, and all right, title and interest in and to such property will remain (as between the parties) solely with company_short_name. company_short_name, company_domain, the company_domain logo, and all other trademarks, service marks, graphics and logos used in connection with company_domain, or the Website are trademarks or registered trademarks of company_short_name or company_short_name’s licensors. Other trademarks, service marks, graphics and logos used in connection with the Website may be the trademarks of other third parties. Your use of the Website grants you no right or license to reproduce or otherwise use any company_short_name or third-party trademarks.\n\n<a name="10"></a>\n\n## [10. Advertisements](#10)\n\ncompany_short_name reserves the right to display advertisements on your content unless you have purchased an Ad-free Upgrade or a Services account.\n\n<a name="11"></a>\n\n## [11. Attribution](#11)\n\ncompany_short_name reserves the right to display attribution links such as ‘Powered by company_domain,’ theme author, and font attribution in your content footer or toolbar. Footer credits and the company_domain toolbar may not be removed regardless of upgrades purchased.\n\n<a name="12"></a>\n\n## [12. Changes](#12)\n\ncompany_short_name reserves the right, at its sole discretion, to modify or replace any part of this Agreement. It is your responsibility to check this Agreement periodically for changes. Your continued use of or access to the Website following the posting of any changes to this Agreement constitutes acceptance of those changes. company_short_name may also, in the future, offer new services and/or features through the Website (including, the release of new tools and resources). Such new features and/or services shall be subject to the terms and conditions of this Agreement.\n\n<a name="13"></a>\n\n## [13. Termination](#13)\n\ncompany_short_name may terminate your access to all or any part of the Website at any time, with or without cause, with or without notice, effective immediately. If you wish to terminate this Agreement or your company_domain account (if you have one), you may simply discontinue using the Website. All provisions of this Agreement which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.\n\n<a name="14"></a>\n\n## [14. Disclaimer of Warranties](#14)\n\nThe Website is provided "as is". company_short_name and its suppliers and licensors hereby disclaim all warranties of any kind, express or implied, including, without limitation, the warranties of merchantability, fitness for a particular purpose and non-infringement. Neither company_short_name nor its suppliers and licensors, makes any warranty that the Website will be error free or that access thereto will be continuous or uninterrupted. If you’re actually reading this, here’s [a treat](http://www.newyorker.com/online/blogs/shouts/2012/12/the-hundred-best-lists-of-all-time.html). You understand that you download from, or otherwise obtain content or services through, the Website at your own discretion and risk.\n\n<a name="15"></a>\n\n## [15. Limitation of Liability](#15)\n\nIn no event will company_short_name, or its suppliers or licensors, be liable with respect to any subject matter of this agreement under any contract, negligence, strict liability or other legal or equitable theory for: (i) any special, incidental or consequential damages; (ii) the cost of procurement for substitute products or services; (iii) for interruption of use or loss or corruption of data; or (iv) for any amounts that exceed the fees paid by you to company_short_name under this agreement during the twelve (12) month period prior to the cause of action. company_short_name shall have no liability for any failure or delay due to matters beyond their reasonable control. The foregoing shall not apply to the extent prohibited by applicable law.\n\n<a name="16"></a>\n\n## [16. General Representation and Warranty](#16)\n\nYou represent and warrant that (i) your use of the Website will be in strict accordance with the company_short_name [Privacy Policy](/privacy), [Community Guidelines](/guidelines), with this Agreement and with all applicable laws and regulations (including without limitation any local laws or regulations in your country, state, city, or other governmental area, regarding online conduct and acceptable content, and including all applicable laws regarding the transmission of technical data exported from the country in which this website resides or the country in which you reside) and (ii) your use of the Website will not infringe or misappropriate the intellectual property rights of any third party.\n\n<a name="17"></a>\n\n## [17. Indemnification](#17)\n\nYou agree to indemnify and hold harmless company_short_name, its contractors, and its licensors, and their respective directors, officers, employees and agents from and against any and all claims and expenses, including attorneys’ fees, arising out of your use of the Website, including but not limited to your violation of this Agreement.\n\n<a name="18"></a>\n\n## [18. Miscellaneous](#18)\n\nThis Agreement constitutes the entire agreement between company_short_name and you concerning the subject matter hereof, and they may only be modified by a written amendment signed by an authorized executive of company_short_name, or by the posting by company_short_name of a revised version. Except to the extent applicable law, if any, provides otherwise, this Agreement, any access to or use of the Website will be governed by the laws of the state of California, U.S.A., excluding its conflict of law provisions, and the proper venue for any disputes arising out of or relating to any of the same will be the state and federal courts located in San Francisco County, California. Except for claims for injunctive or equitable relief or claims regarding intellectual property rights (which may be brought in any competent court without the posting of a bond), any dispute arising under this Agreement shall be finally settled in accordance with the Comprehensive Arbitration Rules of the Judicial Arbitration and Mediation Service, Inc. (“JAMS”) by three arbitrators appointed in accordance with such Rules. The arbitration shall take place in San Francisco, California, in the English language and the arbitral decision may be enforced in any court. The prevailing party in any action or proceeding to enforce this Agreement shall be entitled to costs and attorneys’ fees. If any part of this Agreement is held invalid or unenforceable, that part will be construed to reflect the parties’ original intent, and the remaining portions will remain in full force and effect. A waiver by either party of any term or condition of this Agreement or any breach thereof, in any one instance, will not waive such term or condition or any subsequent breach thereof. You may assign your rights under this Agreement to any party that consents to, and agrees to be bound by, its terms and conditions; company_short_name may assign its rights under this Agreement without condition. This Agreement will be binding upon and will inure to the benefit of the parties, their successors and permitted assigns.\n\nThis document is CC-BY-SA. It was last updated May 31, 2013.\n\nOriginally adapted from the [WordPress Terms of Service](http://en.wordpress.com/tos/).	<p>The following terms and conditions govern all use of the company_domain website and all content, services and products available at or through the website, including, but not limited to, company_domain Forum Software, company_domain Support Forums and the company_domain Hosting service ("Hosting"), (taken together, the Website). The Website is owned and operated by company_full_name ("company_short_name"). The Website is offered subject to your acceptance without modification of all of the terms and conditions contained herein and all other operating rules, policies (including, without limitation, company_domain’s <a href="/privacy">Privacy Policy</a> and <a href="/faq">Community Guidelines</a>) and procedures that may be published from time to time on this Site by company_short_name (collectively, the "Agreement").</p>\n\n<p>Please read this Agreement carefully before accessing or using the Website. By accessing or using any part of the web site, you agree to become bound by the terms and conditions of this agreement. If you do not agree to all the terms and conditions of this agreement, then you may not access the Website or use any services. If these terms and conditions are considered an offer by company_short_name, acceptance is expressly limited to these terms. The Website is available only to individuals who are at least 13 years old.</p>\n\n<p><a name="1"></a></p>\n\n<h2><a href="#1">1. Your company_domain Account</a></h2>\n\n<p>If you create an account on the Website, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account. You must immediately notify company_short_name of any unauthorized uses of your account or any other breaches of security. company_short_name will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions.</p>\n\n<p><a name="2"></a></p>\n\n<h2><a href="#2">2. Responsibility of Contributors</a></h2>\n\n<p>If you post material to the Website, post links on the Website, or otherwise make (or allow any third party to make) material available by means of the Website (any such material, "Content"), You are entirely responsible for the content of, and any harm resulting from, that Content. That is the case regardless of whether the Content in question constitutes text, graphics, an audio file, or computer software. By making Content available, you represent and warrant that:</p>\n\n<ul>\n<li>the downloading, copying and use of the Content will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark or trade secret rights, of any third party;</li>\n<li>if your employer has rights to intellectual property you create, you have either (i) received permission from your employer to post or make available the Content, including but not limited to any software, or (ii) secured from your employer a waiver as to all rights in or to the Content;</li>\n<li>you have fully complied with any third-party licenses relating to the Content, and have done all things necessary to successfully pass through to end users any required terms;</li>\n<li>the Content does not contain or install any viruses, worms, malware, Trojan horses or other harmful or destructive content;</li>\n<li>the Content is not spam, is not machine- or randomly-generated, and does not contain unethical or unwanted commercial content designed to drive traffic to third party sites or boost the search engine rankings of third party sites, or to further unlawful acts (such as phishing) or mislead recipients as to the source of the material (such as spoofing);</li>\n<li>the Content is not pornographic, does not contain threats or incite violence, and does not violate the privacy or publicity rights of any third party;</li>\n<li>your content is not getting advertised via unwanted electronic messages such as spam links on newsgroups, email lists, blogs and web sites, and similar unsolicited promotional methods;</li>\n<li>your content is not named in a manner that misleads your readers into thinking that you are another person or company; and</li>\n<li>you have, in the case of Content that includes computer code, accurately categorized and/or described the type, nature, uses and effects of the materials, whether requested to do so by company_short_name or otherwise.</li>\n</ul>\n\n<p><a name="3"></a></p>\n\n<h2><a href="#3">3. User Content License</a></h2>\n\n<p>User contributions are licensed under a <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US" rel="nofollow">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>. Without limiting any of those representations or warranties, company_short_name has the right (though not the obligation) to, in company_short_name’s sole discretion (i) refuse or remove any content that, in company_short_name’s reasonable opinion, violates any company_short_name policy or is in any way harmful or objectionable, or (ii) terminate or deny access to and use of the Website to any individual or entity for any reason, in company_short_name’s sole discretion. company_short_name will have no obligation to provide a refund of any amounts previously paid.</p>\n\n<p><a name="4"></a></p>\n\n<h2><a href="#4">4. Payment and Renewal</a></h2>\n\n<h3>General Terms</h3>\n\n<p>Optional paid services or upgrades may be available on the Website. When utilizing an optional paid service or upgrade, you agree to pay company_short_name the monthly or annual subscription fees indicated. Payments will be charged on a pre-pay basis on the day you begin utilizing the service or upgrade and will cover the use of that service or upgrade for a monthly or annual subscription period as indicated. These fees are not refundable.</p>\n\n<h3>Automatic Renewal</h3>\n\n<p>Unless you notify company_short_name before the end of the applicable subscription period that you want to cancel a service or upgrade, your subscription will automatically renew and you authorize us to collect the then-applicable annual or monthly subscription fee (as well as any taxes) using any credit card or other payment mechanism we have on record for you. Subscriptions can be canceled at any time.</p>\n\n<p><a name="5"></a></p>\n\n<h2><a href="#5">5. Services</a></h2>\n\n<h3>Hosting, Support Services</h3>\n\n<p>Optional Hosting and Support services may be provided by company_short_name under the terms and conditions for each such service. By signing up for a Hosting/Support or Support services account, you agree to abide by such terms and conditions.</p>\n\n<p><a name="6"></a></p>\n\n<h2><a href="#6">6. Responsibility of Website Visitors</a></h2>\n\n<p>company_short_name has not reviewed, and cannot review, all of the material, including computer software, posted to the Website, and cannot therefore be responsible for that material’s content, use or effects. By operating the Website, company_short_name does not represent or imply that it endorses the material there posted, or that it believes such material to be accurate, useful or non-harmful. You are responsible for taking precautions as necessary to protect yourself and your computer systems from viruses, worms, Trojan horses, and other harmful or destructive content. The Website may contain content that is offensive, indecent, or otherwise objectionable, as well as content containing technical inaccuracies, typographical mistakes, and other errors. The Website may also contain material that violates the privacy or publicity rights, or infringes the intellectual property and other proprietary rights, of third parties, or the downloading, copying or use of which is subject to additional terms and conditions, stated or unstated. company_short_name disclaims any responsibility for any harm resulting from the use by visitors of the Website, or from any downloading by those visitors of content there posted.</p>\n\n<p><a name="7"></a></p>\n\n<h2><a href="#7">7. Content Posted on Other Websites</a></h2>\n\n<p>We have not reviewed, and cannot review, all of the material, including computer software, made available through the websites and webpages to which company_domain links, and that link to company_domain. company_short_name does not have any control over those non-company_domain websites and webpages, and is not responsible for their contents or their use. By linking to a non-company_domain website or webpage, company_short_name does not represent or imply that it endorses such website or webpage. You are responsible for taking precautions as necessary to protect yourself and your computer systems from viruses, worms, Trojan horses, and other harmful or destructive content. company_short_name disclaims any responsibility for any harm resulting from your use of non-company_domain websites and webpages.</p>\n\n<p><a name="8"></a></p>\n\n<h2><a href="#8">8. Copyright Infringement and DMCA Policy</a></h2>\n\n<p>As company_short_name asks others to respect its intellectual property rights, it respects the intellectual property rights of others. If you believe that material located on or linked to by company_domain violates your copyright, and if this website resides in the USA, you are encouraged to notify company_short_name in accordance with company_short_name’s <a href="http://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act" rel="nofollow">Digital Millennium Copyright Act</a> ("DMCA") Policy. company_short_name will respond to all such notices, including as required or appropriate by removing the infringing material or disabling all links to the infringing material. company_short_name will terminate a visitor’s access to and use of the Website if, under appropriate circumstances, the visitor is determined to be a repeat infringer of the copyrights or other intellectual property rights of company_short_name or others. In the case of such termination, company_short_name will have no obligation to provide a refund of any amounts previously paid to company_short_name.</p>\n\n<p><a name="9"></a></p>\n\n<h2><a href="#9">9. Intellectual Property</a></h2>\n\n<p>This Agreement does not transfer from company_short_name to you any company_short_name or third party intellectual property, and all right, title and interest in and to such property will remain (as between the parties) solely with company_short_name. company_short_name, company_domain, the company_domain logo, and all other trademarks, service marks, graphics and logos used in connection with company_domain, or the Website are trademarks or registered trademarks of company_short_name or company_short_name’s licensors. Other trademarks, service marks, graphics and logos used in connection with the Website may be the trademarks of other third parties. Your use of the Website grants you no right or license to reproduce or otherwise use any company_short_name or third-party trademarks.</p>\n\n<p><a name="10"></a></p>\n\n<h2><a href="#10">10. Advertisements</a></h2>\n\n<p>company_short_name reserves the right to display advertisements on your content unless you have purchased an Ad-free Upgrade or a Services account.</p>\n\n<p><a name="11"></a></p>\n\n<h2><a href="#11">11. Attribution</a></h2>\n\n<p>company_short_name reserves the right to display attribution links such as ‘Powered by company_domain,’ theme author, and font attribution in your content footer or toolbar. Footer credits and the company_domain toolbar may not be removed regardless of upgrades purchased.</p>\n\n<p><a name="12"></a></p>\n\n<h2><a href="#12">12. Changes</a></h2>\n\n<p>company_short_name reserves the right, at its sole discretion, to modify or replace any part of this Agreement. It is your responsibility to check this Agreement periodically for changes. Your continued use of or access to the Website following the posting of any changes to this Agreement constitutes acceptance of those changes. company_short_name may also, in the future, offer new services and/or features through the Website (including, the release of new tools and resources). Such new features and/or services shall be subject to the terms and conditions of this Agreement.</p>\n\n<p><a name="13"></a></p>\n\n<h2><a href="#13">13. Termination</a></h2>\n\n<p>company_short_name may terminate your access to all or any part of the Website at any time, with or without cause, with or without notice, effective immediately. If you wish to terminate this Agreement or your company_domain account (if you have one), you may simply discontinue using the Website. All provisions of this Agreement which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>\n\n<p><a name="14"></a></p>\n\n<h2><a href="#14">14. Disclaimer of Warranties</a></h2>\n\n<p>The Website is provided "as is". company_short_name and its suppliers and licensors hereby disclaim all warranties of any kind, express or implied, including, without limitation, the warranties of merchantability, fitness for a particular purpose and non-infringement. Neither company_short_name nor its suppliers and licensors, makes any warranty that the Website will be error free or that access thereto will be continuous or uninterrupted. If you’re actually reading this, here’s <a href="http://www.newyorker.com/online/blogs/shouts/2012/12/the-hundred-best-lists-of-all-time.html" rel="nofollow">a treat</a>. You understand that you download from, or otherwise obtain content or services through, the Website at your own discretion and risk.</p>\n\n<p><a name="15"></a></p>\n\n<h2><a href="#15">15. Limitation of Liability</a></h2>\n\n<p>In no event will company_short_name, or its suppliers or licensors, be liable with respect to any subject matter of this agreement under any contract, negligence, strict liability or other legal or equitable theory for: (i) any special, incidental or consequential damages; (ii) the cost of procurement for substitute products or services; (iii) for interruption of use or loss or corruption of data; or (iv) for any amounts that exceed the fees paid by you to company_short_name under this agreement during the twelve (12) month period prior to the cause of action. company_short_name shall have no liability for any failure or delay due to matters beyond their reasonable control. The foregoing shall not apply to the extent prohibited by applicable law.</p>\n\n<p><a name="16"></a></p>\n\n<h2><a href="#16">16. General Representation and Warranty</a></h2>\n\n<p>You represent and warrant that (i) your use of the Website will be in strict accordance with the company_short_name <a href="/privacy">Privacy Policy</a>, <a href="/guidelines">Community Guidelines</a>, with this Agreement and with all applicable laws and regulations (including without limitation any local laws or regulations in your country, state, city, or other governmental area, regarding online conduct and acceptable content, and including all applicable laws regarding the transmission of technical data exported from the country in which this website resides or the country in which you reside) and (ii) your use of the Website will not infringe or misappropriate the intellectual property rights of any third party.</p>\n\n<p><a name="17"></a></p>\n\n<h2><a href="#17">17. Indemnification</a></h2>\n\n<p>You agree to indemnify and hold harmless company_short_name, its contractors, and its licensors, and their respective directors, officers, employees and agents from and against any and all claims and expenses, including attorneys’ fees, arising out of your use of the Website, including but not limited to your violation of this Agreement.</p>\n\n<p><a name="18"></a></p>\n\n<h2><a href="#18">18. Miscellaneous</a></h2>\n\n<p>This Agreement constitutes the entire agreement between company_short_name and you concerning the subject matter hereof, and they may only be modified by a written amendment signed by an authorized executive of company_short_name, or by the posting by company_short_name of a revised version. Except to the extent applicable law, if any, provides otherwise, this Agreement, any access to or use of the Website will be governed by the laws of the state of California, U.S.A., excluding its conflict of law provisions, and the proper venue for any disputes arising out of or relating to any of the same will be the state and federal courts located in San Francisco County, California. Except for claims for injunctive or equitable relief or claims regarding intellectual property rights (which may be brought in any competent court without the posting of a bond), any dispute arising under this Agreement shall be finally settled in accordance with the Comprehensive Arbitration Rules of the Judicial Arbitration and Mediation Service, Inc. (“JAMS”) by three arbitrators appointed in accordance with such Rules. The arbitration shall take place in San Francisco, California, in the English language and the arbitral decision may be enforced in any court. The prevailing party in any action or proceeding to enforce this Agreement shall be entitled to costs and attorneys’ fees. If any part of this Agreement is held invalid or unenforceable, that part will be construed to reflect the parties’ original intent, and the remaining portions will remain in full force and effect. A waiver by either party of any term or condition of this Agreement or any breach thereof, in any one instance, will not waive such term or condition or any subsequent breach thereof. You may assign your rights under this Agreement to any party that consents to, and agrees to be bound by, its terms and conditions; company_short_name may assign its rights under this Agreement without condition. This Agreement will be binding upon and will inure to the benefit of the parties, their successors and permitted assigns.</p>\n\n<p>This document is CC-BY-SA. It was last updated May 31, 2013.</p>\n\n<p>Originally adapted from the <a href="http://en.wordpress.com/tos/" rel="nofollow">WordPress Terms of Service</a>.</p>	2016-06-14 16:53:33.585505	2016-06-14 16:53:33.585505	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:33.643794	f	\N	0	0	0	\N	\N	2636	1	1	f	2016-06-14 16:53:33.585393	1	\N	0	f	f	\N	1	\N
10	-1	7	1	This is a permanent topic, visible only to staff, for storing images and files used in the site design. Don't delete it!\n\n\nHere's how:\n\n\n1. Reply to this topic.\n2. Upload all the images you wish to use for logos, favicons, and so forth here. (Use the upload toolbar icon in the post editor, or drag-and-drop or paste images.)\n3. Submit your reply to post it.\n4. Right click the images in your new post to get the path to the uploaded images, or click the edit icon to edit your post and retrieve the path to the images. Copy the image paths.\n5. Paste those image paths into [basic settings](/admin/site_settings/category/required).\n\n\nIf you need to enable different file type uploads, edit `authorized_extensions` in the [file settings](/admin/site_settings/category/files).	<p>This is a permanent topic, visible only to staff, for storing images and files used in the site design. Don't delete it!</p>\n\n<p>Here's how:</p>\n\n<ol>\n<li>Reply to this topic.</li>\n<li>Upload all the images you wish to use for logos, favicons, and so forth here. (Use the upload toolbar icon in the post editor, or drag-and-drop or paste images.)</li>\n<li>Submit your reply to post it.</li>\n<li>Right click the images in your new post to get the path to the uploaded images, or click the edit icon to edit your post and retrieve the path to the images. Copy the image paths.</li>\n<li>Paste those image paths into <a href="/admin/site_settings/category/required">basic settings</a>.</li>\n</ol>\n\n<p>If you need to enable different file type uploads, edit <code>authorized_extensions</code> in the <a href="/admin/site_settings/category/files">file settings</a>.</p>	2016-06-14 16:53:34.293732	2016-06-14 16:53:34.293732	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:34.302319	f	\N	0	0	0	\N	\N	138	1	1	f	2016-06-14 16:53:34.293619	1	\N	0	f	f	\N	1	\N
13	-1	10	1	Congratulations, you are now the proud owner of your very own [Civilized Discourse Construction Kit](http://www.discourse.org). :hatching_chick:\n\n### Admin Dashboard\n\nAs an admin you have total control over this Discourse instance. Exercise your admin superpowers via the admin dashboard at\n\n[**/admin**](/admin)\n\nYou can also access it via the "hamburger" <kbd>☰</kbd> menu in the upper right: Admin functions are generally marked with the wrench :wrench:  icon, so look for that.\n\n### Enter Required Settings\n\nGo to the [Required tab](/admin/site_settings/category/required) of the site settings and enter all the required fields. **Until you set these required fields, _your Discourse is broken!_** Go ahead and do that now.\n\nWe'll wait.\n\n### Customize Logos and Colors\n\nBy default you get the standard "penciled in" Discourse logo. Look for the [**assets for the site design**](/t/assets-for-the-site-design) topic; follow the instructions there to upload your logos to that topic, and then paste the uploaded image paths into the required logo settings.\n\nTo quickly give your Discourse a distinctive look, without having to edit or understand CSS, create a new color scheme via [**Customize, Colors**](/admin/customize/colors).\n\nYou can also specify custom CSS and custom HTML headers/footers to further customize the look. One common request is a navigation header that takes you back to the parent site. Here is some example HTML to put in [**Customize, CSS/HTML**](/admin/customize/css_html) under "Header":\n\n```\n<div id="top-navbar" class="container" style="padding:5px 0 0 5px">\n  <a href="http://example.com">Home</a> |\n  <a href="http://example.com/about/">About</a> |\n  <a href="http://example.com/news/">News</a> |\n  <a href="http://example.com/products/">Products</a> |\n  <a href="http://blog.example.com/blog">Blog</a> |\n  <a href="http://forums.example.com/">Forums</a>\n</div>\n```\n\n### Establish Staff\n\nStaff members are official representatives of this community. There are two kinds of Staff:\n\n1. **Admins**, who can do anything and configure anything on this site.\n2. **Moderators**, who can edit all posts and users, but cannot add categories or change any site settings.\n\nTo add additional staff members:\n\n- have them sign up on the site (or [send out an invitation to join via your user page](/my/invited))\n- click the admin button :wrench: on their user page\n- look for the <kbd>Grant Admin</kbd> and <kbd>Grant Moderator</kbd> buttons there\n\n### Private or Public?\n\nDiscourse assumes you want a public discussion area. If you prefer a private one, change these [login site settings](/admin/site_settings/category/login):\n\n- `must approve users`\n- `login required`\n- `invite only`\n\nIf you only want some parts of your site to be private, edit category permissions. You already have one private category: this topic is in it!\n\n### Configure Login Methods\n\nUsers can log in with traditional local username and password accounts. You may want to add:\n\n- [Google logins](https://meta.discourse.org/t/configuring-google-oauth2-login-for-discourse/15858)\n- [Twitter logins](https://meta.discourse.org/t/configuring-twitter-login-for-discourse/13395)\n- [Facebook logins](https://meta.discourse.org/t/configuring-facebook-login-for-discourse/13394)\n- [GitHub logins](https://meta.discourse.org/t/configuring-github-login-for-discourse/13745)\n\nIf you want to get extra-fancy you can also [set up single-sign on](https://meta.discourse.org/t/official-single-sign-on-for-discourse/13045), or even [build your own login method](https://meta.discourse.org/t/login-to-discourse-with-custom-oauth2-provider/14717).\n\n### Test Your Email\n\nEmail is required for new account signups and notifications. **Test your email to make sure it is configured correctly!**  Visit [the admin email settings](/admin/email), then enter an email address in the "email address to test" field and click <kbd>send test email</kbd>.\n\n- You got the test email? Great! **Read that email closely**, it has important email deliverability tips.\n- You didn't get the test email? This means your users probably aren't getting any signup or notification emails either.\n- Email deliverability can be hard. Read [**Email Service Configuration**](https://github.com/discourse/discourse/blob/master/docs/INSTALL-email.md).\n\nIf you'd like to enable *replying* to topics via email, [see this howto](https://meta.discourse.org/t/set-up-reply-via-email-support/14003).\n\n### What and Who is this site for?\n\nOne of the default topics is [Welcome to Discourse](/t/welcome-to-discourse). This topic is pinned globally, so it will appear on the homepage, right at the top of the topic list, for all new users. Try viewing your site with incognito, inprivate, or anonymous mode enabled in your browser to see it how new users will.\n\nYour welcome topic is important because it is the first thing you visitors will see:\n\n- Where am I?\n- Who are these discussions for?\n- What can I [find here](https://www.youtube.com/watch?v=d0VNHe5fq30)?\n- Why should I visit?\n\n[Edit your welcome topic](/t/welcome-to-discourse) and write a **brief introduction to your community**. Think of it as your "elevator pitch" &ndash; how would you describe this site to a stranger on an elevator when you had about 1 minute to talk?\n\nNote that pinning topics works a little differently in Discourse:\n\n- Once someone reads to the bottom of a pinned topic, it is automatically unpinned for them specifically. They can change this via the personal pin controls at the bottom of the topic.\n- When staff pins a topic, they can pin it globally to all topic lists, or just within its category.\n\nIf a pin isn't visible enough, you can also turn one single topic into a **banner**. The banner topic floats on top of all topics and all primary pages. Users can permanently dismiss this floating banner by clicking the &times; in the upper right corner.\n\nTo make (or remove) a pin or a banner, use the admin wrench at the top right or bottom of the topic.\n\n### Set the Homepage\n\nBy default your homepage is a simple list of the latest posts.\n\nWe strongly recommend sticking with this homepage for small and medium communities until you start getting lots of new topics every day.\n\nYou can change the homepage to the Categories list by editing `top menu` in the [Basic Setup](/admin/site_settings/category/basic) site settings. Change it from the default of\n\n`latest|new|unread|top|categories`\n\nto\n\n`categories|latest|new|unread|top`\n\nThat is, move categories from the far right to the far left -- that leftmost top menu item is your default homepage.\n\n### Build Your Own FAQ\n\nRight now [your FAQ](/faq) is the same Creative Commons [universal rules of civilized discourse](http://blog.discourse.org/2013/03/the-universal-rules-of-civilized-discourse/) we provide to all Discourse installs. These built-in community guidelines are referenced a bunch of places; please *do* use them and refer to them often – they really work!\n\nHowever, if you want to set up a more detailed FAQ dealing with the specifics of *your* community, here's how:\n\n1. Create a new [site feedback topic](category/site-feedback), titled "Frequently Asked Questions (FAQ)" or similar.\n\n2. Use the admin wrench icon below the post to make it a wiki post. This means the post is now editable to any user with a trust level of 1 or higher.\n\n3. Note the URL to that topic.\n\n4. Paste that URL into the `faq url` setting in the admin site settings. This links your topic from the hamburger FAQ menu entry at the top right of every page.\n\nNow you have a community FAQ for your site that is collaboratively editable, and linked from every page on the site.\n\n### Categories\n\nYou have three default categories:\n\n1. [Site Feedback](/category/site-feedback) – general discussion about the site itself. [It's important!](https://meta.discourse.org/t/5249)\n2. [Lounge](/category/lounge) – a perk for users at trust level 3 and higher\n3. [Staff](/category/staff) – visible only to staff (admins and moderators)\n\n**Don't create too many initial categories**, as you can overwhelm your audience. You can always add more categories, and easily bulk recategorize topics later. It's better to figure out the organization as you go rather than assuming you'll get it all right from the beginning (hint: you won't).\n\nTo add a category, visit the [categories page](/categories), then click Create Category at the upper right. You can set security per-category so only certain groups of users can see topics in that category.\n\nEvery category has an initial "About this category" topic. This topic will be pinned to the top of the category, and the description you enter will be used in a bunch of places. Be sure to give your new category a good, clear description, so people understand what belongs there!\n\n### File Uploads\n\nBasic image uploads work fine out of the box stored locally, provided you have adequate disk space.\n\n- If you'd like other sorts of files to be uploaded beyond just images, modify the [file settings](/admin/site_settings/category/files).\n\n- If you'd rather store your images and files on Amazon S3, [follow this howto](http://meta.discourse.org/t/how-to-set-up-image-uploads-to-s3/7229).\n\n\n### New User Sandbox and the Trust System\n\nIf your discussion area is be open to the public, new visitors will arrive that are initially strangers to the community. Discourse has a [trust system](https://meta.discourse.org/t/what-do-user-trust-levels-do/4924/2) where users can, over time, earn the trust of the community and gain abilities to assist in governing their community.\n\nDiscourse is designed to offer safe defaults for public communities, even with no active moderation.\n\n> **0 (new) &rarr; 1 (basic) &rarr; 2 (member) &rarr; 3 (regular) &rarr; 4 (leader)**\n\nAll new users start out in a sandbox with restrictions for everyone's safety. **Trust level 0 (new) users _cannot_** &hellip;\n\n- post more than 2 hyperlinks\n- post any images or file attachments\n- send private messages\n- flag posts or topics\n- have actual links in the "about me" field of their profile\n- @name mention more than 2 users in a post\n\nVirtually every action a user can take is rate limited for safety, and especially so for new users. But don't worry, new users can [transition to trust level 1](https://meta.discourse.org/t/what-do-user-trust-levels-do/4924/2) in about 15 minutes.\n\nThese defaults are safe, but they may be too conservative for your site:\n\n- If you are pre-vetting all users, or your site is private and you approve all new users manually, you can set everyone's `default trust level` to 1.\n\n- You can relax individual new user restrictions. Search settings for `newuser`. Ones commonly adjusted are `newuser max images`, `newuser max replies per topic`, `newuser max links`.\n\n### User Content Licensing\n\nOut of the box, Discourse defaults to [Creative Commons licensing](https://creativecommons.org/).\n\n> Your users will always retain copyright on their posts, and will always grant the site owner enough rights to include their content on the site.\n>\n> Who is allowed to republish the content posted on this forum?\n>\n> 1. Only the author\n> 2. Author and the owner of this forum\n> 3. Anybody\\*\n\nNumber 3 is the Discourse default &ndash; that's [Creative Commons BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US).\n\n If that's not what you want, edit the [Terms of Service](/tos) to taste via the edit link at the top.\n\n### Building Your Community\n\nBe patient; building communities is hard. Before launching, be sure to:\n\n1. Define your community's purpose in a pinned or banner topic.\n2. Seed the discussion with interesting topics.\n3. Commit to visiting and participating regularly.\n4. Link your community everywhere and promote it so people can find it.\n\nThere's more advice at [Building a Discourse Community](http://blog.discourse.org/2014/08/building-a-discourse-community/).\n\n### Sending Invitations\n\nOne way to get people to visit your site is to invite them via email. You can do this via:\n\n- The Invite button at the bottom of the topic.\n- The Invite area on your profile page.\n\nThe invite area on your profile page also includes advanced Staff methods of [sending bulk invites](https://meta.discourse.org/t/sending-bulk-user-invites/16468), and [inviting users into groups](https://meta.discourse.org/t/invite-individual-users-to-a-group/15544).\n\n### Maintenance\n\n- One CPU and 1GB of memory, with swap, is the minimum for a basic Discourse community. As your community grows you may need more memory or CPU resources.\n\n- Hopefully you are running [in our Docker container install](https://github.com/discourse/discourse/blob/master/docs/INSTALL.md); it's the only one we officially support. It guarantees easy updates, and all recommended optimizations from the Discourse team.\n\n- You should get an email notification when new versions of Discourse are released. To update your instance via our easy one click upgrade process, visit [/admin/upgrade](/admin/upgrade).\n\n- Some other things you might eventually want to set up:\n   - [Automatic daily backups](https://meta.discourse.org/t/configure-automatic-backups-for-discourse/14855)\n   - [HTTPS support](https://meta.discourse.org/t/allowing-ssl-for-your-discourse-docker-setup/13847)\n   - [Content Delivery Network support](https://meta.discourse.org/t/enable-a-cdn-for-your-discourse/14857)\n   - [Reply via Email](https://meta.discourse.org/t/set-up-reply-via-email-support/14003)\n   - [Import and Export your data](https://meta.discourse.org/t/move-your-discourse-instance-to-a-different-server/15721)\n   - [Change the domain name](https://meta.discourse.org/t/how-do-i-change-the-domain-name/16098)\n   - [Multiple Discourse instances on the same server](https://meta.discourse.org/t/multisite-configuration-with-docker/14084)\n   - [Import old content from vBulletin, PHPbb, Vanilla, Drupal, BBPress, etc](https://github.com/discourse/discourse/tree/master/script/import_scripts)\n   - A firewall on your server? [Configure firewall](https://meta.discourse.org/t/configure-a-firewall-for-discourse/20584).\n   - A user friendly [offline page when rebuilding or upgrading?](https://meta.discourse.org/t/adding-an-offline-page-when-rebuilding/45238)\n   - Embed Discourse [in your WordPress install](https://github.com/discourse/wp-discourse), or [on your static HTML site](http://eviltrout.com/2014/01/22/embedding-discourse.html)\n\n### Need more Help?\n\nFor more assistance on configuring and running your Discourse forum, see [meta.discourse.org](http://meta.discourse.org).\n\n----\n\nHave suggestions to improve or update this guide? Submit a [pull request](https://github.com/discourse/discourse/blob/master/docs/ADMIN-QUICK-START-GUIDE.md).	<p>Congratulations, you are now the proud owner of your very own <a href="http://www.discourse.org" rel="nofollow">Civilized Discourse Construction Kit</a>. <img src="/images/emoji/emoji_one/hatching_chick.png?v=2" title=":hatching_chick:" class="emoji" alt=":hatching_chick:"></p>\n\n<h3>Admin Dashboard</h3>\n\n<p>As an admin you have total control over this Discourse instance. Exercise your admin superpowers via the admin dashboard at</p>\n\n<p><a href="/admin"><strong>/admin</strong></a></p>\n\n<p>You can also access it via the "hamburger" <kbd>☰</kbd> menu in the upper right: Admin functions are generally marked with the wrench <img src="/images/emoji/emoji_one/wrench.png?v=2" title=":wrench:" class="emoji" alt=":wrench:">  icon, so look for that.</p>\n\n<h3>Enter Required Settings</h3>\n\n<p>Go to the <a href="/admin/site_settings/category/required">Required tab</a> of the site settings and enter all the required fields. <strong>Until you set these required fields, <em>your Discourse is broken!</em></strong> Go ahead and do that now.</p>\n\n<p>We'll wait.</p>\n\n<h3>Customize Logos and Colors</h3>\n\n<p>By default you get the standard "penciled in" Discourse logo. Look for the <a href="/t/assets-for-the-site-design"><strong>assets for the site design</strong></a> topic; follow the instructions there to upload your logos to that topic, and then paste the uploaded image paths into the required logo settings.</p>\n\n<p>To quickly give your Discourse a distinctive look, without having to edit or understand CSS, create a new color scheme via <a href="/admin/customize/colors"><strong>Customize, Colors</strong></a>.</p>\n\n<p>You can also specify custom CSS and custom HTML headers/footers to further customize the look. One common request is a navigation header that takes you back to the parent site. Here is some example HTML to put in <a href="/admin/customize/css_html"><strong>Customize, CSS/HTML</strong></a> under "Header":</p>\n\n<p></p><pre><code class="lang-auto">&lt;div id="top-navbar" class="container" style="padding:5px 0 0 5px"&gt;\n  &lt;a href="http://example.com"&gt;Home&lt;/a&gt; |\n  &lt;a href="http://example.com/about/"&gt;About&lt;/a&gt; |\n  &lt;a href="http://example.com/news/"&gt;News&lt;/a&gt; |\n  &lt;a href="http://example.com/products/"&gt;Products&lt;/a&gt; |\n  &lt;a href="http://blog.example.com/blog"&gt;Blog&lt;/a&gt; |\n  &lt;a href="http://forums.example.com/"&gt;Forums&lt;/a&gt;\n&lt;/div&gt;</code></pre>\n\n<h3>Establish Staff</h3>\n\n<p>Staff members are official representatives of this community. There are two kinds of Staff:</p>\n\n<ol>\n<li>\n<strong>Admins</strong>, who can do anything and configure anything on this site.</li>\n<li>\n<strong>Moderators</strong>, who can edit all posts and users, but cannot add categories or change any site settings.</li>\n</ol>\n\n<p>To add additional staff members:</p>\n\n<ul>\n<li>have them sign up on the site (or <a href="/my/invited">send out an invitation to join via your user page</a>)</li>\n<li>click the admin button <img src="/images/emoji/emoji_one/wrench.png?v=2" title=":wrench:" class="emoji" alt=":wrench:"> on their user page</li>\n<li>look for the <kbd>Grant Admin</kbd> and <kbd>Grant Moderator</kbd> buttons there</li>\n</ul>\n\n<h3>Private or Public?</h3>\n\n<p>Discourse assumes you want a public discussion area. If you prefer a private one, change these <a href="/admin/site_settings/category/login">login site settings</a>:</p>\n\n<ul>\n<li><code>must approve users</code></li>\n<li><code>login required</code></li>\n<li><code>invite only</code></li>\n</ul>\n\n<p>If you only want some parts of your site to be private, edit category permissions. You already have one private category: this topic is in it!</p>\n\n<h3>Configure Login Methods</h3>\n\n<p>Users can log in with traditional local username and password accounts. You may want to add:</p>\n\n<ul>\n<li><a href="https://meta.discourse.org/t/configuring-google-oauth2-login-for-discourse/15858" rel="nofollow">Google logins</a></li>\n<li><a href="https://meta.discourse.org/t/configuring-twitter-login-for-discourse/13395" rel="nofollow">Twitter logins</a></li>\n<li><a href="https://meta.discourse.org/t/configuring-facebook-login-for-discourse/13394" rel="nofollow">Facebook logins</a></li>\n<li><a href="https://meta.discourse.org/t/configuring-github-login-for-discourse/13745" rel="nofollow">GitHub logins</a></li>\n</ul>\n\n<p>If you want to get extra-fancy you can also <a href="https://meta.discourse.org/t/official-single-sign-on-for-discourse/13045" rel="nofollow">set up single-sign on</a>, or even <a href="https://meta.discourse.org/t/login-to-discourse-with-custom-oauth2-provider/14717" rel="nofollow">build your own login method</a>.</p>\n\n<h3>Test Your Email</h3>\n\n<p>Email is required for new account signups and notifications. <strong>Test your email to make sure it is configured correctly!</strong>  Visit <a href="/admin/email">the admin email settings</a>, then enter an email address in the "email address to test" field and click <kbd>send test email</kbd>.</p>\n\n<ul>\n<li>You got the test email? Great! <strong>Read that email closely</strong>, it has important email deliverability tips.</li>\n<li>You didn't get the test email? This means your users probably aren't getting any signup or notification emails either.</li>\n<li>Email deliverability can be hard. Read <a href="https://github.com/discourse/discourse/blob/master/docs/INSTALL-email.md" rel="nofollow"><strong>Email Service Configuration</strong></a>.</li>\n</ul>\n\n<p>If you'd like to enable <em>replying</em> to topics via email, <a href="https://meta.discourse.org/t/set-up-reply-via-email-support/14003" rel="nofollow">see this howto</a>.</p>\n\n<h3>What and Who is this site for?</h3>\n\n<p>One of the default topics is <a href="/t/welcome-to-discourse">Welcome to Discourse</a>. This topic is pinned globally, so it will appear on the homepage, right at the top of the topic list, for all new users. Try viewing your site with incognito, inprivate, or anonymous mode enabled in your browser to see it how new users will.</p>\n\n<p>Your welcome topic is important because it is the first thing you visitors will see:</p>\n\n<ul>\n<li>Where am I?</li>\n<li>Who are these discussions for?</li>\n<li>What can I <a href="https://www.youtube.com/watch?v=d0VNHe5fq30" rel="nofollow">find here</a>?</li>\n<li>Why should I visit?</li>\n</ul>\n\n<p><a href="/t/welcome-to-discourse">Edit your welcome topic</a> and write a <strong>brief introduction to your community</strong>. Think of it as your "elevator pitch" – how would you describe this site to a stranger on an elevator when you had about 1 minute to talk?</p>\n\n<p>Note that pinning topics works a little differently in Discourse:</p>\n\n<ul>\n<li>Once someone reads to the bottom of a pinned topic, it is automatically unpinned for them specifically. They can change this via the personal pin controls at the bottom of the topic.</li>\n<li>When staff pins a topic, they can pin it globally to all topic lists, or just within its category.</li>\n</ul>\n\n<p>If a pin isn't visible enough, you can also turn one single topic into a <strong>banner</strong>. The banner topic floats on top of all topics and all primary pages. Users can permanently dismiss this floating banner by clicking the × in the upper right corner.</p>\n\n<p>To make (or remove) a pin or a banner, use the admin wrench at the top right or bottom of the topic.</p>\n\n<h3>Set the Homepage</h3>\n\n<p>By default your homepage is a simple list of the latest posts.</p>\n\n<p>We strongly recommend sticking with this homepage for small and medium communities until you start getting lots of new topics every day.</p>\n\n<p>You can change the homepage to the Categories list by editing <code>top menu</code> in the <a href="/admin/site_settings/category/basic">Basic Setup</a> site settings. Change it from the default of</p>\n\n<p><code>latest|new|unread|top|categories</code></p>\n\n<p>to</p>\n\n<p><code>categories|latest|new|unread|top</code></p>\n\n<p>That is, move categories from the far right to the far left -- that leftmost top menu item is your default homepage.</p>\n\n<h3>Build Your Own FAQ</h3>\n\n<p>Right now <a href="/faq">your FAQ</a> is the same Creative Commons <a href="http://blog.discourse.org/2013/03/the-universal-rules-of-civilized-discourse/" rel="nofollow">universal rules of civilized discourse</a> we provide to all Discourse installs. These built-in community guidelines are referenced a bunch of places; please <em>do</em> use them and refer to them often – they really work!</p>\n\n<p>However, if you want to set up a more detailed FAQ dealing with the specifics of <em>your</em> community, here's how:</p>\n\n<ol>\n<li><p>Create a new <a>site feedback topic</a>, titled "Frequently Asked Questions (FAQ)" or similar.</p></li>\n<li><p>Use the admin wrench icon below the post to make it a wiki post. This means the post is now editable to any user with a trust level of 1 or higher.</p></li>\n<li><p>Note the URL to that topic.</p></li>\n<li><p>Paste that URL into the <code>faq url</code> setting in the admin site settings. This links your topic from the hamburger FAQ menu entry at the top right of every page.</p></li>\n</ol>\n\n<p>Now you have a community FAQ for your site that is collaboratively editable, and linked from every page on the site.</p>\n\n<h3>Categories</h3>\n\n<p>You have three default categories:</p>\n\n<ol>\n<li>\n<a href="/category/site-feedback">Site Feedback</a> – general discussion about the site itself. <a href="https://meta.discourse.org/t/5249" rel="nofollow">It's important!</a>\n</li>\n<li>\n<a href="/category/lounge">Lounge</a> – a perk for users at trust level 3 and higher</li>\n<li>\n<a href="/category/staff">Staff</a> – visible only to staff (admins and moderators)</li>\n</ol>\n\n<p><strong>Don't create too many initial categories</strong>, as you can overwhelm your audience. You can always add more categories, and easily bulk recategorize topics later. It's better to figure out the organization as you go rather than assuming you'll get it all right from the beginning (hint: you won't).</p>\n\n<p>To add a category, visit the <a href="/categories">categories page</a>, then click Create Category at the upper right. You can set security per-category so only certain groups of users can see topics in that category.</p>\n\n<p>Every category has an initial "About this category" topic. This topic will be pinned to the top of the category, and the description you enter will be used in a bunch of places. Be sure to give your new category a good, clear description, so people understand what belongs there!</p>\n\n<h3>File Uploads</h3>\n\n<p>Basic image uploads work fine out of the box stored locally, provided you have adequate disk space.</p>\n\n<ul>\n<li><p>If you'd like other sorts of files to be uploaded beyond just images, modify the <a href="/admin/site_settings/category/files">file settings</a>.</p></li>\n<li><p>If you'd rather store your images and files on Amazon S3, <a href="http://meta.discourse.org/t/how-to-set-up-image-uploads-to-s3/7229" rel="nofollow">follow this howto</a>.</p></li>\n</ul>\n\n<h3>New User Sandbox and the Trust System</h3>\n\n<p>If your discussion area is be open to the public, new visitors will arrive that are initially strangers to the community. Discourse has a <a href="https://meta.discourse.org/t/what-do-user-trust-levels-do/4924/2" rel="nofollow">trust system</a> where users can, over time, earn the trust of the community and gain abilities to assist in governing their community.</p>\n\n<p>Discourse is designed to offer safe defaults for public communities, even with no active moderation.</p>\n\n<blockquote><p><strong>0 (new) → 1 (basic) → 2 (member) → 3 (regular) → 4 (leader)</strong></p></blockquote>\n\n<p>All new users start out in a sandbox with restrictions for everyone's safety. <strong>Trust level 0 (new) users <em>cannot</em></strong> …</p>\n\n<ul>\n<li>post more than 2 hyperlinks</li>\n<li>post any images or file attachments</li>\n<li>send private messages</li>\n<li>flag posts or topics</li>\n<li>have actual links in the "about me" field of their profile</li>\n<li>\n<span class="mention">@name</span> mention more than 2 users in a post</li>\n</ul>\n\n<p>Virtually every action a user can take is rate limited for safety, and especially so for new users. But don't worry, new users can <a href="https://meta.discourse.org/t/what-do-user-trust-levels-do/4924/2" rel="nofollow">transition to trust level 1</a> in about 15 minutes.</p>\n\n<p>These defaults are safe, but they may be too conservative for your site:</p>\n\n<ul>\n<li><p>If you are pre-vetting all users, or your site is private and you approve all new users manually, you can set everyone's <code>default trust level</code> to 1.</p></li>\n<li><p>You can relax individual new user restrictions. Search settings for <code>newuser</code>. Ones commonly adjusted are <code>newuser max images</code>, <code>newuser max replies per topic</code>, <code>newuser max links</code>.</p></li>\n</ul>\n\n<h3>User Content Licensing</h3>\n\n<p>Out of the box, Discourse defaults to <a href="https://creativecommons.org/" rel="nofollow">Creative Commons licensing</a>.</p>\n\n<blockquote>\n<p>Your users will always retain copyright on their posts, and will always grant the site owner enough rights to include their content on the site.</p>\n<p>Who is allowed to republish the content posted on this forum?</p>\n<ol>\n<li>Only the author</li>\n<li>Author and the owner of this forum</li>\n<li>Anybody*</li>\n</ol>\n</blockquote>\n\n<p>Number 3 is the Discourse default – that's <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US" rel="nofollow">Creative Commons BY-NC-SA 3.0</a>.</p>\n\n<p> If that's not what you want, edit the <a href="/tos">Terms of Service</a> to taste via the edit link at the top.</p>\n\n<h3>Building Your Community</h3>\n\n<p>Be patient; building communities is hard. Before launching, be sure to:</p>\n\n<ol>\n<li>Define your community's purpose in a pinned or banner topic.</li>\n<li>Seed the discussion with interesting topics.</li>\n<li>Commit to visiting and participating regularly.</li>\n<li>Link your community everywhere and promote it so people can find it.</li>\n</ol>\n\n<p>There's more advice at <a href="http://blog.discourse.org/2014/08/building-a-discourse-community/" rel="nofollow">Building a Discourse Community</a>.</p>\n\n<h3>Sending Invitations</h3>\n\n<p>One way to get people to visit your site is to invite them via email. You can do this via:</p>\n\n<ul>\n<li>The Invite button at the bottom of the topic.</li>\n<li>The Invite area on your profile page.</li>\n</ul>\n\n<p>The invite area on your profile page also includes advanced Staff methods of <a href="https://meta.discourse.org/t/sending-bulk-user-invites/16468" rel="nofollow">sending bulk invites</a>, and <a href="https://meta.discourse.org/t/invite-individual-users-to-a-group/15544" rel="nofollow">inviting users into groups</a>.</p>\n\n<h3>Maintenance</h3>\n\n<ul>\n<li><p>One CPU and 1GB of memory, with swap, is the minimum for a basic Discourse community. As your community grows you may need more memory or CPU resources.</p></li>\n<li><p>Hopefully you are running <a href="https://github.com/discourse/discourse/blob/master/docs/INSTALL.md" rel="nofollow">in our Docker container install</a>; it's the only one we officially support. It guarantees easy updates, and all recommended optimizations from the Discourse team.</p></li>\n<li><p>You should get an email notification when new versions of Discourse are released. To update your instance via our easy one click upgrade process, visit <a href="/admin/upgrade">/admin/upgrade</a>.</p></li>\n<li>\n<p>Some other things you might eventually want to set up:</p>\n<ul>\n<li><a href="https://meta.discourse.org/t/configure-automatic-backups-for-discourse/14855" rel="nofollow">Automatic daily backups</a></li>\n<li><a href="https://meta.discourse.org/t/allowing-ssl-for-your-discourse-docker-setup/13847" rel="nofollow">HTTPS support</a></li>\n<li><a href="https://meta.discourse.org/t/enable-a-cdn-for-your-discourse/14857" rel="nofollow">Content Delivery Network support</a></li>\n<li><a href="https://meta.discourse.org/t/set-up-reply-via-email-support/14003" rel="nofollow">Reply via Email</a></li>\n<li><a href="https://meta.discourse.org/t/move-your-discourse-instance-to-a-different-server/15721" rel="nofollow">Import and Export your data</a></li>\n<li><a href="https://meta.discourse.org/t/how-do-i-change-the-domain-name/16098" rel="nofollow">Change the domain name</a></li>\n<li><a href="https://meta.discourse.org/t/multisite-configuration-with-docker/14084" rel="nofollow">Multiple Discourse instances on the same server</a></li>\n<li><a href="https://github.com/discourse/discourse/tree/master/script/import_scripts" rel="nofollow">Import old content from vBulletin, PHPbb, Vanilla, Drupal, BBPress, etc</a></li>\n<li>A firewall on your server? <a href="https://meta.discourse.org/t/configure-a-firewall-for-discourse/20584" rel="nofollow">Configure firewall</a>.</li>\n<li>A user friendly <a href="https://meta.discourse.org/t/adding-an-offline-page-when-rebuilding/45238" rel="nofollow">offline page when rebuilding or upgrading?</a>\n</li>\n<li>Embed Discourse <a href="https://github.com/discourse/wp-discourse" rel="nofollow">in your WordPress install</a>, or <a href="http://eviltrout.com/2014/01/22/embedding-discourse.html" rel="nofollow">on your static HTML site</a>\n</li>\n</ul>\n</li>\n</ul>\n\n<h3>Need more Help?</h3>\n\n<p>For more assistance on configuring and running your Discourse forum, see <a href="http://meta.discourse.org" rel="nofollow">meta.discourse.org</a>.</p>\n\n<hr>\n\n<p>Have suggestions to improve or update this guide? Submit a <a href="https://github.com/discourse/discourse/blob/master/docs/ADMIN-QUICK-START-GUIDE.md" rel="nofollow">pull request</a>.</p>	2016-06-14 16:53:34.628167	2016-06-14 16:53:34.628167	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:34.694484	f	\N	0	0	0	\N	\N	2416	1	1	f	2016-06-14 16:53:34.628047	1	\N	0	f	f	\N	1	\N
5	-1	4	2	Edit the first post in this topic to change the contents of the Terms of Service page.	<p>Edit the first post in this topic to change the contents of the Terms of Service page.</p>	2016-06-14 16:53:33.849161	2016-06-14 16:53:33.849161	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	2	-1	f	\N	0	0	0	0	2016-06-14 16:53:33.85613	f	\N	0	0	0	\N	\N	17	1	1	f	2016-06-14 16:53:33.849024	1	\N	0	f	f	\N	1	\N
7	-1	5	2	Edit the first post in this topic to change the contents of the FAQ/Guidelines page.	<p>Edit the first post in this topic to change the contents of the FAQ/Guidelines page.</p>	2016-06-14 16:53:34.050751	2016-06-14 16:53:34.050751	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	2	-1	f	\N	0	0	0	0	2016-06-14 16:53:34.056317	f	\N	0	0	0	\N	\N	16	1	1	f	2016-06-14 16:53:34.050632	1	\N	0	f	f	\N	1	\N
6	-1	5	1	<a name="civilized"></a>\n\n## [This is a Civilized Place for Public Discussion](#civilized)\n\nPlease treat this discussion forum with the same respect you would a public park.  We, too, are a shared community resource &mdash; a place to share skills, knowledge and interests through ongoing conversation.\n\nThese are not hard and fast rules, merely aids to the human judgment of our community. Use these guidelines to keep this a clean, well-lighted place for civilized public discourse.\n\n<a name="improve"></a>\n\n## [Improve the Discussion](#improve)\n\nHelp us make this a great place for discussion by always working to improve the discussion in some way, however small. If you are not sure your post adds to the conversation, think over what you want to say and try again later.\n\nThe topics discussed here matter to us, and we want you to act as if they matter to you, too. Be respectful of the topics and the people discussing them, even if you disagree with some of what is being said.\n\nOne way to improve the discussion is by discovering ones that are already happening. Please spend some time browsing the topics here before replying or starting your own, and you’ll have a better chance of meeting others who share your interests.\n\n<a name="agreeable"></a>\n\n## [Be Agreeable, Even When You Disagree](#agreeable)\n\nYou may wish to respond to something by disagreeing with it. That’s fine. But, remember to _criticize ideas, not people_. Please avoid:\n\n*   Name-calling.\n*   Ad hominem attacks.\n*   Responding to a post’s tone instead of its actual content.\n*   Knee-jerk contradiction.\n\nInstead, provide reasoned counter-arguments that improve the conversation.\n\n<a name="participate"></a>\n\n## [Your Participation Counts](#participate)\n\nThe conversations we have here set the tone for everyone. Help us influence the future of this community by choosing to engage in discussions that make this forum an interesting place to be &mdash; and avoiding those that do not.\n\nDiscourse provides tools that enable the community to collectively identify the best (and worst) contributions: favorites, bookmarks, likes, flags, replies, edits, and so forth. Use these tools to improve your own experience, and everyone else’s, too.\n\nLet’s try to leave our park better than we found it.\n\n<a name="flag-problems"></a>\n\n## [If You See a Problem, Flag It](#flag-problems)\n\nModerators have special authority; they are responsible for this forum. But so are you. With your help, moderators can be community facilitators, not just janitors or police.\n\nWhen you see bad behavior, don’t reply. It encourages the bad behavior by acknowledging it, consumes your energy, and wastes everyone’s time. _Just flag it_. If enough flags accrue, action will be taken, either automatically or by moderator intervention.\n\nIn order to maintain our community, moderators reserve the right to remove any content and any user account for any reason at any time. Moderators do not preview new posts in any way; the moderators and site operators take no responsibility for any content posted by the community.\n\n<a name="be-civil"></a>\n\n## [Always Be Civil](#be-civil)\n\nNothing sabotages a healthy conversation like rudeness:\n\n*   Be civil. Don’t post anything that a reasonable person would consider offensive, abusive, or hate speech.\n*   Keep it clean. Don’t post anything obscene or sexually explicit.\n*   Respect each other. Don’t harass or grief anyone, impersonate people, or expose their private information.\n*   Respect our forum. Don’t post spam or otherwise vandalize the forum.\n\nThese are not concrete terms with precise definitions &mdash; avoid even the _appearance_ of any of these things. If you’re unsure, ask yourself how you would feel if your post was featured on the front page of the New York Times.\n\nThis is a public forum, and search engines index these discussions. Keep the language, links, and images safe for family and friends.\n\n<a name="keep-tidy"></a>\n\n## [Keep It Tidy](#keep-tidy)\n\nMake the effort to put things in the right place, so that we can spend more time discussing and less cleaning up. So:\n\n*   Don’t start a topic in the wrong category.\n*   Don’t cross-post the same thing in multiple topics.\n*   Don’t post no-content replies.\n*   Don’t divert a topic by changing it midstream.\n*   Don’t sign your posts &mdash; every post has your profile information attached to it.\n\nRather than posting “+1” or “Agreed”, use the Like button. Rather than taking an existing topic in a radically different direction, use Reply as a Linked Topic.\n\n<a name="stealing"></a>\n\n## [Post Only Your Own Stuff](#stealing)\n\nYou may not post anything digital that belongs to someone else without permission. You may not post descriptions of, links to, or methods for stealing someone’s intellectual property (software, video, audio, images), or for breaking any other law.\n\n<a name="power"></a>\n\n## [Powered by You](#power)\n\nThis site is operated by your [friendly local staff](/about) and *you*, the community. If you have any further questions about how things should work here, open a new topic in the [site feedback category](/c/site-feedback) and let's discuss! If there's a critical or urgent issue that can't be handled by a meta topic or flag, contact us via the [staff page](/about).\n\n<a name="tos"></a>\n\n## [Terms of Service](#tos)\n\nYes, legalese is boring, but we must protect ourselves &ndash; and by extension, you and your data &ndash; against unfriendly folks. We have a [Terms of Service](/tos) describing your (and our) behavior and rights related to content, privacy, and laws. To use this service, you must agree to abide by our [TOS](/tos).	<p><a name="civilized"></a></p>\n\n<h2><a href="#civilized">This is a Civilized Place for Public Discussion</a></h2>\n\n<p>Please treat this discussion forum with the same respect you would a public park.  We, too, are a shared community resource — a place to share skills, knowledge and interests through ongoing conversation.</p>\n\n<p>These are not hard and fast rules, merely aids to the human judgment of our community. Use these guidelines to keep this a clean, well-lighted place for civilized public discourse.</p>\n\n<p><a name="improve"></a></p>\n\n<h2><a href="#improve">Improve the Discussion</a></h2>\n\n<p>Help us make this a great place for discussion by always working to improve the discussion in some way, however small. If you are not sure your post adds to the conversation, think over what you want to say and try again later.</p>\n\n<p>The topics discussed here matter to us, and we want you to act as if they matter to you, too. Be respectful of the topics and the people discussing them, even if you disagree with some of what is being said.</p>\n\n<p>One way to improve the discussion is by discovering ones that are already happening. Please spend some time browsing the topics here before replying or starting your own, and you’ll have a better chance of meeting others who share your interests.</p>\n\n<p><a name="agreeable"></a></p>\n\n<h2><a href="#agreeable">Be Agreeable, Even When You Disagree</a></h2>\n\n<p>You may wish to respond to something by disagreeing with it. That’s fine. But, remember to <em>criticize ideas, not people</em>. Please avoid:</p>\n\n<ul>\n<li>Name-calling.</li>\n<li>Ad hominem attacks.</li>\n<li>Responding to a post’s tone instead of its actual content.</li>\n<li>Knee-jerk contradiction.</li>\n</ul>\n\n<p>Instead, provide reasoned counter-arguments that improve the conversation.</p>\n\n<p><a name="participate"></a></p>\n\n<h2><a href="#participate">Your Participation Counts</a></h2>\n\n<p>The conversations we have here set the tone for everyone. Help us influence the future of this community by choosing to engage in discussions that make this forum an interesting place to be — and avoiding those that do not.</p>\n\n<p>Discourse provides tools that enable the community to collectively identify the best (and worst) contributions: favorites, bookmarks, likes, flags, replies, edits, and so forth. Use these tools to improve your own experience, and everyone else’s, too.</p>\n\n<p>Let’s try to leave our park better than we found it.</p>\n\n<p><a name="flag-problems"></a></p>\n\n<h2><a href="#flag-problems">If You See a Problem, Flag It</a></h2>\n\n<p>Moderators have special authority; they are responsible for this forum. But so are you. With your help, moderators can be community facilitators, not just janitors or police.</p>\n\n<p>When you see bad behavior, don’t reply. It encourages the bad behavior by acknowledging it, consumes your energy, and wastes everyone’s time. <em>Just flag it</em>. If enough flags accrue, action will be taken, either automatically or by moderator intervention.</p>\n\n<p>In order to maintain our community, moderators reserve the right to remove any content and any user account for any reason at any time. Moderators do not preview new posts in any way; the moderators and site operators take no responsibility for any content posted by the community.</p>\n\n<p><a name="be-civil"></a></p>\n\n<h2><a href="#be-civil">Always Be Civil</a></h2>\n\n<p>Nothing sabotages a healthy conversation like rudeness:</p>\n\n<ul>\n<li>Be civil. Don’t post anything that a reasonable person would consider offensive, abusive, or hate speech.</li>\n<li>Keep it clean. Don’t post anything obscene or sexually explicit.</li>\n<li>Respect each other. Don’t harass or grief anyone, impersonate people, or expose their private information.</li>\n<li>Respect our forum. Don’t post spam or otherwise vandalize the forum.</li>\n</ul>\n\n<p>These are not concrete terms with precise definitions — avoid even the <em>appearance</em> of any of these things. If you’re unsure, ask yourself how you would feel if your post was featured on the front page of the New York Times.</p>\n\n<p>This is a public forum, and search engines index these discussions. Keep the language, links, and images safe for family and friends.</p>\n\n<p><a name="keep-tidy"></a></p>\n\n<h2><a href="#keep-tidy">Keep It Tidy</a></h2>\n\n<p>Make the effort to put things in the right place, so that we can spend more time discussing and less cleaning up. So:</p>\n\n<ul>\n<li>Don’t start a topic in the wrong category.</li>\n<li>Don’t cross-post the same thing in multiple topics.</li>\n<li>Don’t post no-content replies.</li>\n<li>Don’t divert a topic by changing it midstream.</li>\n<li>Don’t sign your posts — every post has your profile information attached to it.</li>\n</ul>\n\n<p>Rather than posting “+1” or “Agreed”, use the Like button. Rather than taking an existing topic in a radically different direction, use Reply as a Linked Topic.</p>\n\n<p><a name="stealing"></a></p>\n\n<h2><a href="#stealing">Post Only Your Own Stuff</a></h2>\n\n<p>You may not post anything digital that belongs to someone else without permission. You may not post descriptions of, links to, or methods for stealing someone’s intellectual property (software, video, audio, images), or for breaking any other law.</p>\n\n<p><a name="power"></a></p>\n\n<h2><a href="#power">Powered by You</a></h2>\n\n<p>This site is operated by your <a href="/about">friendly local staff</a> and <em>you</em>, the community. If you have any further questions about how things should work here, open a new topic in the <a href="/c/site-feedback">site feedback category</a> and let's discuss! If there's a critical or urgent issue that can't be handled by a meta topic or flag, contact us via the <a href="/about">staff page</a>.</p>\n\n<p><a name="tos"></a></p>\n\n<h2><a href="#tos">Terms of Service</a></h2>\n\n<p>Yes, legalese is boring, but we must protect ourselves – and by extension, you and your data – against unfriendly folks. We have a <a href="/tos">Terms of Service</a> describing your (and our) behavior and rights related to content, privacy, and laws. To use this service, you must agree to abide by our <a href="/tos">TOS</a>.</p>	2016-06-14 16:53:33.934751	2016-06-14 16:53:33.934751	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:33.95503	f	\N	0	0	0	\N	\N	933	1	1	f	2016-06-14 16:53:33.934628	1	\N	0	f	f	\N	1	\N
9	-1	6	2	Edit the first post in this topic to change the contents of the Privacy Policy page.	<p>Edit the first post in this topic to change the contents of the Privacy Policy page.</p>	2016-06-14 16:53:34.209807	2016-06-14 16:53:34.209807	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	2	-1	f	\N	0	0	0	0	2016-06-14 16:53:34.215211	f	\N	0	0	0	\N	\N	16	1	1	f	2016-06-14 16:53:34.209701	1	\N	0	f	f	\N	1	\N
8	-1	6	1	<a name="collect"></a>\n\n## [What information do we collect?](#collect)\n\nWe collect information from you when you register on our site and gather data when you participate in the forum by reading, writing, and evaluating the content shared here.\n\nWhen registering on our site, you may be asked to enter your name and e-mail address. You may, however, visit our site without registering. Your e-mail address will be verified by an email containing a unique link. If that link is visited, we know that you control the e-mail address.\n\nWhen registered and posting, we record the IP address that the post originated from. We also may retain server logs which include the IP address of every request to our server.\n\n<a name="use"></a>\n\n## [What do we use your information for?](#use)\n\nAny of the information we collect from you may be used in one of the following ways:\n\n*   To personalize your experience &mdash; your information helps us to better respond to your individual needs.\n*   To improve our site &mdash; we continually strive to improve our site offerings based on the information and feedback we receive from you.\n*   To improve customer service &mdash; your information helps us to more effectively respond to your customer service requests and support needs.\n*   To send periodic emails &mdash; The email address you provide may be used to send you information, notifications that you request about changes to topics or in response to your user name, respond to inquiries, and/or other requests or questions.\n\n<a name="protect"></a>\n\n## [How do we protect your information?](#protect)\n\nWe implement a variety of security measures to maintain the safety of your personal information when you enter, submit, or access your personal information.\n\n<a name="data-retention"></a>\n\n## [What is your data retention policy?](#data-retention)\n\nWe will make a good faith effort to:\n\n*   Retain server logs containing the IP address of all requests to this server no more than 90 days.\n*   Retain the IP addresses associated with registered users and their posts no more than 5 years.\n\n<a name="cookies"></a>\n\n## [Do we use cookies?](#cookies)\n\nYes. Cookies are small files that a site or its service provider transfers to your computer's hard drive through your Web browser (if you allow). These cookies enable the site to recognize your browser and, if you have a registered account, associate it with your registered account.\n\nWe use cookies to understand and save your preferences for future visits and compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future. We may contract with third-party service providers to assist us in better understanding our site visitors. These service providers are not permitted to use the information collected on our behalf except to help us conduct and improve our business.\n\n<a name="disclose"></a>\n\n## [Do we disclose any information to outside parties?](#disclose)\n\nWe do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include trusted third parties who assist us in operating our site, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses.\n\n<a name="third-party"></a>\n\n## [Third party links](#third-party)\n\nOccasionally, at our discretion, we may include or offer third party products or services on our site. These third party sites have separate and independent privacy policies. We therefore have no responsibility or liability for the content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our site and welcome any feedback about these sites.\n\n<a name="coppa"></a>\n\n## [Children's Online Privacy Protection Act Compliance](#coppa)\n\nOur site, products and services are all directed to people who are at least 13 years old or older. If this server is in the USA, and you are under the age of 13, per the requirements of COPPA ([Children's Online Privacy Protection Act](https://en.wikipedia.org/wiki/Children%27s_Online_Privacy_Protection_Act)), do not use this site.\n\n<a name="online"></a>\n\n## [Online Privacy Policy Only](#online)\n\nThis online privacy policy applies only to information collected through our site and not to information collected offline.\n\n<a name="consent"></a>\n\n## [Your Consent](#consent)\n\nBy using our site, you consent to our web site privacy policy.\n\n<a name="changes"></a>\n\n## [Changes to our Privacy Policy](#changes)\n\nIf we decide to change our privacy policy, we will post those changes on this page.\n\nThis document is CC-BY-SA. It was last updated May 31, 2013.	<p><a name="collect"></a></p>\n\n<h2><a href="#collect">What information do we collect?</a></h2>\n\n<p>We collect information from you when you register on our site and gather data when you participate in the forum by reading, writing, and evaluating the content shared here.</p>\n\n<p>When registering on our site, you may be asked to enter your name and e-mail address. You may, however, visit our site without registering. Your e-mail address will be verified by an email containing a unique link. If that link is visited, we know that you control the e-mail address.</p>\n\n<p>When registered and posting, we record the IP address that the post originated from. We also may retain server logs which include the IP address of every request to our server.</p>\n\n<p><a name="use"></a></p>\n\n<h2><a href="#use">What do we use your information for?</a></h2>\n\n<p>Any of the information we collect from you may be used in one of the following ways:</p>\n\n<ul>\n<li>To personalize your experience — your information helps us to better respond to your individual needs.</li>\n<li>To improve our site — we continually strive to improve our site offerings based on the information and feedback we receive from you.</li>\n<li>To improve customer service — your information helps us to more effectively respond to your customer service requests and support needs.</li>\n<li>To send periodic emails — The email address you provide may be used to send you information, notifications that you request about changes to topics or in response to your user name, respond to inquiries, and/or other requests or questions.</li>\n</ul>\n\n<p><a name="protect"></a></p>\n\n<h2><a href="#protect">How do we protect your information?</a></h2>\n\n<p>We implement a variety of security measures to maintain the safety of your personal information when you enter, submit, or access your personal information.</p>\n\n<p><a name="data-retention"></a></p>\n\n<h2><a href="#data-retention">What is your data retention policy?</a></h2>\n\n<p>We will make a good faith effort to:</p>\n\n<ul>\n<li>Retain server logs containing the IP address of all requests to this server no more than 90 days.</li>\n<li>Retain the IP addresses associated with registered users and their posts no more than 5 years.</li>\n</ul>\n\n<p><a name="cookies"></a></p>\n\n<h2><a href="#cookies">Do we use cookies?</a></h2>\n\n<p>Yes. Cookies are small files that a site or its service provider transfers to your computer's hard drive through your Web browser (if you allow). These cookies enable the site to recognize your browser and, if you have a registered account, associate it with your registered account.</p>\n\n<p>We use cookies to understand and save your preferences for future visits and compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future. We may contract with third-party service providers to assist us in better understanding our site visitors. These service providers are not permitted to use the information collected on our behalf except to help us conduct and improve our business.</p>\n\n<p><a name="disclose"></a></p>\n\n<h2><a href="#disclose">Do we disclose any information to outside parties?</a></h2>\n\n<p>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include trusted third parties who assist us in operating our site, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses.</p>\n\n<p><a name="third-party"></a></p>\n\n<h2><a href="#third-party">Third party links</a></h2>\n\n<p>Occasionally, at our discretion, we may include or offer third party products or services on our site. These third party sites have separate and independent privacy policies. We therefore have no responsibility or liability for the content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our site and welcome any feedback about these sites.</p>\n\n<p><a name="coppa"></a></p>\n\n<h2><a href="#coppa">Children's Online Privacy Protection Act Compliance</a></h2>\n\n<p>Our site, products and services are all directed to people who are at least 13 years old or older. If this server is in the USA, and you are under the age of 13, per the requirements of COPPA (<a href="https://en.wikipedia.org/wiki/Children%27s_Online_Privacy_Protection_Act" rel="nofollow">Children's Online Privacy Protection Act</a>), do not use this site.</p>\n\n<p><a name="online"></a></p>\n\n<h2><a href="#online">Online Privacy Policy Only</a></h2>\n\n<p>This online privacy policy applies only to information collected through our site and not to information collected offline.</p>\n\n<p><a name="consent"></a></p>\n\n<h2><a href="#consent">Your Consent</a></h2>\n\n<p>By using our site, you consent to our web site privacy policy.</p>\n\n<p><a name="changes"></a></p>\n\n<h2><a href="#changes">Changes to our Privacy Policy</a></h2>\n\n<p>If we decide to change our privacy policy, we will post those changes on this page.</p>\n\n<p>This document is CC-BY-SA. It was last updated May 31, 2013.</p>	2016-06-14 16:53:34.132746	2016-06-14 16:53:34.132746	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:34.147487	f	\N	0	0	0	\N	\N	806	1	1	f	2016-06-14 16:53:34.132643	1	\N	0	f	f	\N	1	\N
11	-1	8	1	The first paragraph of this pinned topic will be visible as a welcome message to all new visitors on your homepage. It's important!\n\n**Edit this** into a brief description of your community:\n\n- Who is it for?\n- What can they find here?\n- Why should they come here?\n- Where can they read more (links, resources, etc)?\n\n<img src="/images/welcome/discourse-edit-post-animated.gif" width="508" height="106">\n\nYou may want to close this topic via the admin :wrench: (at the upper right and bottom), so that replies don't pile up on an announcement.	<p>The first paragraph of this pinned topic will be visible as a welcome message to all new visitors on your homepage. It's important!</p>\n\n<p><strong>Edit this</strong> into a brief description of your community:</p>\n\n<ul>\n<li>Who is it for?</li>\n<li>What can they find here?</li>\n<li>Why should they come here?</li>\n<li>Where can they read more (links, resources, etc)?</li>\n</ul>\n\n<p><img src="/images/welcome/discourse-edit-post-animated.gif" width="508" height="106"></p>\n\n<p>You may want to close this topic via the admin <img src="/images/emoji/emoji_one/wrench.png?v=2" title=":wrench:" class="emoji" alt=":wrench:"> (at the upper right and bottom), so that replies don't pile up on an announcement.</p>	2016-06-14 16:53:34.379022	2016-06-14 16:53:34.379022	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:34.386691	f	\N	0	0	0	\N	\N	95	1	1	f	2016-06-14 16:53:34.378911	1	\N	0	f	f	\N	1	\N
12	-1	9	1	\nCongratulations! :confetti_ball:\n\nIf you can see this topic, you were recently promoted to **regular** (trust level 3).\n\nYou can now &hellip;\n\n* Edit the title of any topic\n* Change the category of any topic\n* Have all your links followed ([automatic nofollow](http://en.wikipedia.org/wiki/Nofollow) is removed)\n* Access a private Lounge category only visible to users at trust level 3 and higher\n* Hide spam with a single flag\n\nHere's the [current list of fellow regulars](/badges/3/regular). Be sure to say hi.\n\nThanks for being an important part of this community!\n\n(For more information on trust levels, [see this topic][trust]. Please note that only members who continue to meet the requirements over time will remain regulars.)\n\n[trust]: https://meta.discourse.org/t/what-do-user-trust-levels-do/4924	<p>Congratulations! <img src="/images/emoji/emoji_one/confetti_ball.png?v=2" title=":confetti_ball:" class="emoji" alt=":confetti_ball:"></p>\n\n<p>If you can see this topic, you were recently promoted to <strong>regular</strong> (trust level 3).</p>\n\n<p>You can now …</p>\n\n<ul>\n<li>Edit the title of any topic</li>\n<li>Change the category of any topic</li>\n<li>Have all your links followed (<a href="http://en.wikipedia.org/wiki/Nofollow" rel="nofollow">automatic nofollow</a> is removed)</li>\n<li>Access a private Lounge category only visible to users at trust level 3 and higher</li>\n<li>Hide spam with a single flag</li>\n</ul>\n\n<p>Here's the <a href="/badges/3/regular">current list of fellow regulars</a>. Be sure to say hi.</p>\n\n<p>Thanks for being an important part of this community!</p>\n\n<p>(For more information on trust levels, <a href="https://meta.discourse.org/t/what-do-user-trust-levels-do/4924" rel="nofollow">see this topic</a>. Please note that only members who continue to meet the requirements over time will remain regulars.)</p>	2016-06-14 16:53:34.455305	2016-06-14 16:53:34.455305	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-14 16:53:34.463203	f	\N	0	0	0	\N	\N	133	1	1	f	2016-06-14 16:53:34.455195	1	\N	0	f	f	\N	1	\N
15	4	12	1	(Replace this first paragraph with a brief description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. **Until you edit this description or create topics, this category won't appear on the categories page.**)\n\nUse the following paragraphs for a longer description, or to establish category guidelines or rules:\n\n- Why should people use this category? What is it for?\n\n- How exactly is this different than the other categories we already have?\n\n- What should topics in this category generally contain?\n\n- Do we need this category? Can we merge with another category, or subcategory?\n	<p>(Replace this first paragraph with a brief description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. <strong>Until you edit this description or create topics, this category won't appear on the categories page.</strong>)</p>\n\n<p>Use the following paragraphs for a longer description, or to establish category guidelines or rules:</p>\n\n<ul>\n<li><p>Why should people use this category? What is it for?</p></li>\n<li><p>How exactly is this different than the other categories we already have?</p></li>\n<li><p>What should topics in this category generally contain?</p></li>\n<li><p>Do we need this category? Can we merge with another category, or subcategory?</p></li>\n</ul>	2016-06-15 08:17:58.914372	2016-06-15 08:17:58.914372	\N	0	0	\N	0	0	0	0	\N	0	0	1	0	1	4	f	\N	0	0	0	0	2016-06-15 08:17:58.927565	f	\N	0	0	0	\N	\N	104	1	1	f	2016-06-15 08:17:58.914231	1	\N	0	f	f	\N	1	\N
14	-1	11	1	Thanks for joining Discourse, and welcome!\n\nHere are a few quick tips to get you started:\n\n## Reading\n\nTo read more, **just keep scrolling down!**\n\nAs new replies or new topics arrive, they will appear automatically – no need to refresh the page.\n\n## Navigation\n\n- For search, your user page, or the <kbd>☰</kbd> menu, use the **icon buttons at upper right**.\n\n- Selecting a topic title will always take you to your **next unread reply** in the topic. To enter at the top or bottom instead, select the reply count or last reply date.\n\n    <img src="http://discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png" width="593" height="59">\n\n- While reading a topic, use the timeline on the right to jump to the top, bottom, or your last read position. On smaller screens, select the progress bar at bottom right to expand it:\n\n    <img src="http://discourse.ogdch.dev/images/welcome/progress-bar-2x.png" width="153" height="181">\n\n    You can also press <kbd>?</kbd> on your keyboard for a list of super-speedy keyboard shortcuts.\n\n## Replying\n\nTo insert a quote, select the text you wish to quote, then press any <img src="http://discourse.ogdch.dev/images/welcome/reply-post-2x.png" width="25" height="23"> Reply button to open the editor. Repeat for multiple quotes.\n\n<img src="http://discourse.ogdch.dev/images/welcome/quote-reply-2x.png" width="326" height="128">\n\nYou can always continue reading while you compose your reply, and we automatically save drafts as you write.\n\nTo notify someone about your reply, mention their name. Type `@` to begin selecting a username.\n\n<img src="http://discourse.ogdch.dev/images/welcome/username-completion-2x.png" width="191" height="125">\n\nTo use [standard Emoji](http://www.emoji.codes/), just type `:` to match by name, or use the traditional smileys `;)`\n\n<img src="http://discourse.ogdch.dev/images/welcome/emoji-completion-2x.png" width="144" height="153">\n\nTo generate a summary for a link, paste it on a line by itself:\n\n<img src="http://discourse.ogdch.dev/images/welcome/link-oneboxing-animation.gif" width="480" height="228">\n\nYour reply can be formatted using simple HTML, BBCode, or [Markdown](http://commonmark.org/help/):\n\n    This is **bold**.\n    This is <b>bold</b>.\n    This is [b]bold[/b].\n\nFor more formatting tips, [try our fun 10 minute interactive tutorial!](http://commonmark.org/help/tutorial/)\n\n## Actions\n\nThere are action buttons at the bottom of each post:\n\n<img src="http://discourse.ogdch.dev/images/welcome/like-link-flag-bookmark-2x.png" width="162" height="42">\n\n- To let someone know that you enjoyed and appreciated their post, use the **like** button. Share the love!\n\n- Grab a copy-pasteable link to any reply or topic via the **link** button.\n\n- Use the <kbd>&hellip;</kbd> show more button to reveal more actions. **Flag** to privately let the author, or [our staff](http://discourse.ogdch.dev/about), know about a problem. **Bookmark** to find this post later on your profile page.\n\n## Notifications\n\nWhen someone replies to you, quotes your post, mentions your `@username`, or even links to your post, a number will immediately appear at the top right of the page. Select it to access your **notifications**.\n\n<img src="http://discourse.ogdch.dev/images/welcome/notification-panel-2x.png" width="160" height="54">\n\nDon't worry about missing a reply – you'll be emailed any notifications that arrive when you are away.\n\n## Preferences\n\n  - All topics less than **two days old** are considered new.\n\n  - Any topic you've **actively participated in** (by creating it, replying to it, or reading it for an extended period) will be automatically tracked on your behalf.\n\nYou will see the new and unread number indicators next to these topics:\n\n<img src="http://discourse.ogdch.dev/images/welcome/topics-new-unread-2x.png" width="341" height="106">\n\nYou can change your notifications for any topic via the notification control at the bottom, and right hand side, of each topic.\n\n<img src="http://discourse.ogdch.dev/images/welcome/topic-notification-control-2x.png" width="608" height="312">\n\nYou can also set notification state per category, if you want to watch or mute every new topic in a specific category.\n\nTo change any of these settings, see [your user preferences](http://discourse.ogdch.dev/my/preferences).\n\n## Community Trust\n\nIt's great to meet you! As you participate here, over time we'll get to know you, and your temporary new user limitations will be lifted. Keep participating, and over time you'll gain new [trust levels](https://meta.discourse.org/t/what-do-user-trust-levels-do/4924) that include special abilities to help us manage our community together.\n\n\nWe believe in [civilized community behavior](http://discourse.ogdch.dev/guidelines) at all times.\n\nEnjoy your stay!\n\n(If you need to communicate with [staff members](http://discourse.ogdch.dev/about) as a new user, just reply to this message.)	<p>Thanks for joining Discourse, and welcome!</p>\n\n<p>Here are a few quick tips to get you started:</p>\n\n<h2>Reading</h2>\n\n<p>To read more, <strong>just keep scrolling down!</strong></p>\n\n<p>As new replies or new topics arrive, they will appear automatically – no need to refresh the page.</p>\n\n<h2>Navigation</h2>\n\n<ul>\n<li><p>For search, your user page, or the <kbd>☰</kbd> menu, use the <strong>icon buttons at upper right</strong>.</p></li>\n<li>\n<p>Selecting a topic title will always take you to your <strong>next unread reply</strong> in the topic. To enter at the top or bottom instead, select the reply count or last reply date.</p>\n<p><img src="//discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png" width="593" height="59"></p>\n</li>\n<li>\n<p>While reading a topic, use the timeline on the right to jump to the top, bottom, or your last read position. On smaller screens, select the progress bar at bottom right to expand it:</p>\n<p><img src="//discourse.ogdch.dev/images/welcome/progress-bar-2x.png" width="153" height="181"></p>\n<p>You can also press <kbd>?</kbd> on your keyboard for a list of super-speedy keyboard shortcuts.</p>\n</li>\n</ul>\n\n<h2>Replying</h2>\n\n<p>To insert a quote, select the text you wish to quote, then press any <img src="//discourse.ogdch.dev/images/welcome/reply-post-2x.png" width="25" height="23"> Reply button to open the editor. Repeat for multiple quotes.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/quote-reply-2x.png" width="326" height="128"></p>\n\n<p>You can always continue reading while you compose your reply, and we automatically save drafts as you write.</p>\n\n<p>To notify someone about your reply, mention their name. Type <code>@</code> to begin selecting a username.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/username-completion-2x.png" width="191" height="125"></p>\n\n<p>To use <a href="http://www.emoji.codes/" rel="nofollow">standard Emoji</a>, just type <code>:</code> to match by name, or use the traditional smileys <code>;)</code></p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/emoji-completion-2x.png" width="144" height="153"></p>\n\n<p>To generate a summary for a link, paste it on a line by itself:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/link-oneboxing-animation.gif" width="480" height="228"></p>\n\n<p>Your reply can be formatted using simple HTML, BBCode, or <a href="http://commonmark.org/help/" rel="nofollow">Markdown</a>:</p>\n\n<pre><code>This is **bold**.\nThis is &lt;b&gt;bold&lt;/b&gt;.\nThis is [b]bold[/b].</code></pre>\n\n<p>For more formatting tips, <a href="http://commonmark.org/help/tutorial/" rel="nofollow">try our fun 10 minute interactive tutorial!</a></p>\n\n<h2>Actions</h2>\n\n<p>There are action buttons at the bottom of each post:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/like-link-flag-bookmark-2x.png" width="162" height="42"></p>\n\n<ul>\n<li><p>To let someone know that you enjoyed and appreciated their post, use the <strong>like</strong> button. Share the love!</p></li>\n<li><p>Grab a copy-pasteable link to any reply or topic via the <strong>link</strong> button.</p></li>\n<li><p>Use the <kbd>…</kbd> show more button to reveal more actions. <strong>Flag</strong> to privately let the author, or <a href="//discourse.ogdch.dev/about">our staff</a>, know about a problem. <strong>Bookmark</strong> to find this post later on your profile page.</p></li>\n</ul>\n\n<h2>Notifications</h2>\n\n<p>When someone replies to you, quotes your post, mentions your <code>@username</code>, or even links to your post, a number will immediately appear at the top right of the page. Select it to access your <strong>notifications</strong>.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/notification-panel-2x.png" width="160" height="54"></p>\n\n<p>Don't worry about missing a reply – you'll be emailed any notifications that arrive when you are away.</p>\n\n<h2>Preferences</h2>\n\n<ul>\n<li><p>All topics less than <strong>two days old</strong> are considered new.</p></li>\n<li><p>Any topic you've <strong>actively participated in</strong> (by creating it, replying to it, or reading it for an extended period) will be automatically tracked on your behalf.</p></li>\n</ul>\n\n<p>You will see the new and unread number indicators next to these topics:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/topics-new-unread-2x.png" width="341" height="106"></p>\n\n<p>You can change your notifications for any topic via the notification control at the bottom, and right hand side, of each topic.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/topic-notification-control-2x.png" width="608" height="312"></p>\n\n<p>You can also set notification state per category, if you want to watch or mute every new topic in a specific category.</p>\n\n<p>To change any of these settings, see <a href="//discourse.ogdch.dev/my/preferences">your user preferences</a>.</p>\n\n<h2>Community Trust</h2>\n\n<p>It's great to meet you! As you participate here, over time we'll get to know you, and your temporary new user limitations will be lifted. Keep participating, and over time you'll gain new <a href="https://meta.discourse.org/t/what-do-user-trust-levels-do/4924" rel="nofollow">trust levels</a> that include special abilities to help us manage our community together.</p>\n\n<p>We believe in <a href="//discourse.ogdch.dev/guidelines">civilized community behavior</a> at all times.</p>\n\n<p>Enjoy your stay!</p>\n\n<p>(If you need to communicate with <a href="//discourse.ogdch.dev/about">staff members</a> as a new user, just reply to this message.)</p>	2016-06-15 08:17:09.509067	2016-06-15 08:17:09.509067	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-15 08:17:09.56558	f	\N	0	0	0	\N	\N	810	1	1	f	2016-06-15 08:17:09.508969	1	\N	0	f	f	\N	1	\N
16	-1	13	1	Thanks for joining Discourse, and welcome!\n\nHere are a few quick tips to get you started:\n\n## Reading\n\nTo read more, **just keep scrolling down!**\n\nAs new replies or new topics arrive, they will appear automatically – no need to refresh the page.\n\n## Navigation\n\n- For search, your user page, or the <kbd>☰</kbd> menu, use the **icon buttons at upper right**.\n\n- Selecting a topic title will always take you to your **next unread reply** in the topic. To enter at the top or bottom instead, select the reply count or last reply date.\n\n    <img src="http://discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png" width="593" height="59">\n\n- While reading a topic, use the timeline on the right to jump to the top, bottom, or your last read position. On smaller screens, select the progress bar at bottom right to expand it:\n\n    <img src="http://discourse.ogdch.dev/images/welcome/progress-bar-2x.png" width="153" height="181">\n\n    You can also press <kbd>?</kbd> on your keyboard for a list of super-speedy keyboard shortcuts.\n\n## Replying\n\nTo insert a quote, select the text you wish to quote, then press any <img src="http://discourse.ogdch.dev/images/welcome/reply-post-2x.png" width="25" height="23"> Reply button to open the editor. Repeat for multiple quotes.\n\n<img src="http://discourse.ogdch.dev/images/welcome/quote-reply-2x.png" width="326" height="128">\n\nYou can always continue reading while you compose your reply, and we automatically save drafts as you write.\n\nTo notify someone about your reply, mention their name. Type `@` to begin selecting a username.\n\n<img src="http://discourse.ogdch.dev/images/welcome/username-completion-2x.png" width="191" height="125">\n\nTo use [standard Emoji](http://www.emoji.codes/), just type `:` to match by name, or use the traditional smileys `;)`\n\n<img src="http://discourse.ogdch.dev/images/welcome/emoji-completion-2x.png" width="144" height="153">\n\nTo generate a summary for a link, paste it on a line by itself:\n\n<img src="http://discourse.ogdch.dev/images/welcome/link-oneboxing-animation.gif" width="480" height="228">\n\nYour reply can be formatted using simple HTML, BBCode, or [Markdown](http://commonmark.org/help/):\n\n    This is **bold**.\n    This is <b>bold</b>.\n    This is [b]bold[/b].\n\nFor more formatting tips, [try our fun 10 minute interactive tutorial!](http://commonmark.org/help/tutorial/)\n\n## Actions\n\nThere are action buttons at the bottom of each post:\n\n<img src="http://discourse.ogdch.dev/images/welcome/like-link-flag-bookmark-2x.png" width="162" height="42">\n\n- To let someone know that you enjoyed and appreciated their post, use the **like** button. Share the love!\n\n- Grab a copy-pasteable link to any reply or topic via the **link** button.\n\n- Use the <kbd>&hellip;</kbd> show more button to reveal more actions. **Flag** to privately let the author, or [our staff](http://discourse.ogdch.dev/about), know about a problem. **Bookmark** to find this post later on your profile page.\n\n## Notifications\n\nWhen someone replies to you, quotes your post, mentions your `@username`, or even links to your post, a number will immediately appear at the top right of the page. Select it to access your **notifications**.\n\n<img src="http://discourse.ogdch.dev/images/welcome/notification-panel-2x.png" width="160" height="54">\n\nDon't worry about missing a reply – you'll be emailed any notifications that arrive when you are away.\n\n## Preferences\n\n  - All topics less than **two days old** are considered new.\n\n  - Any topic you've **actively participated in** (by creating it, replying to it, or reading it for an extended period) will be automatically tracked on your behalf.\n\nYou will see the new and unread number indicators next to these topics:\n\n<img src="http://discourse.ogdch.dev/images/welcome/topics-new-unread-2x.png" width="341" height="106">\n\nYou can change your notifications for any topic via the notification control at the bottom, and right hand side, of each topic.\n\n<img src="http://discourse.ogdch.dev/images/welcome/topic-notification-control-2x.png" width="608" height="312">\n\nYou can also set notification state per category, if you want to watch or mute every new topic in a specific category.\n\nTo change any of these settings, see [your user preferences](http://discourse.ogdch.dev/my/preferences).\n\n## Community Trust\n\nIt's great to meet you! As you participate here, over time we'll get to know you, and your temporary new user limitations will be lifted. Keep participating, and over time you'll gain new [trust levels](https://meta.discourse.org/t/what-do-user-trust-levels-do/4924) that include special abilities to help us manage our community together.\n\n\nWe believe in [civilized community behavior](http://discourse.ogdch.dev/guidelines) at all times.\n\nEnjoy your stay!\n\n(If you need to communicate with [staff members](http://discourse.ogdch.dev/about) as a new user, just reply to this message.)	<p>Thanks for joining Discourse, and welcome!</p>\n\n<p>Here are a few quick tips to get you started:</p>\n\n<h2>Reading</h2>\n\n<p>To read more, <strong>just keep scrolling down!</strong></p>\n\n<p>As new replies or new topics arrive, they will appear automatically – no need to refresh the page.</p>\n\n<h2>Navigation</h2>\n\n<ul>\n<li><p>For search, your user page, or the <kbd>☰</kbd> menu, use the <strong>icon buttons at upper right</strong>.</p></li>\n<li>\n<p>Selecting a topic title will always take you to your <strong>next unread reply</strong> in the topic. To enter at the top or bottom instead, select the reply count or last reply date.</p>\n<p><img src="//discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png" width="593" height="59"></p>\n</li>\n<li>\n<p>While reading a topic, use the timeline on the right to jump to the top, bottom, or your last read position. On smaller screens, select the progress bar at bottom right to expand it:</p>\n<p><img src="//discourse.ogdch.dev/images/welcome/progress-bar-2x.png" width="153" height="181"></p>\n<p>You can also press <kbd>?</kbd> on your keyboard for a list of super-speedy keyboard shortcuts.</p>\n</li>\n</ul>\n\n<h2>Replying</h2>\n\n<p>To insert a quote, select the text you wish to quote, then press any <img src="//discourse.ogdch.dev/images/welcome/reply-post-2x.png" width="25" height="23"> Reply button to open the editor. Repeat for multiple quotes.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/quote-reply-2x.png" width="326" height="128"></p>\n\n<p>You can always continue reading while you compose your reply, and we automatically save drafts as you write.</p>\n\n<p>To notify someone about your reply, mention their name. Type <code>@</code> to begin selecting a username.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/username-completion-2x.png" width="191" height="125"></p>\n\n<p>To use <a href="http://www.emoji.codes/" rel="nofollow">standard Emoji</a>, just type <code>:</code> to match by name, or use the traditional smileys <code>;)</code></p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/emoji-completion-2x.png" width="144" height="153"></p>\n\n<p>To generate a summary for a link, paste it on a line by itself:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/link-oneboxing-animation.gif" width="480" height="228"></p>\n\n<p>Your reply can be formatted using simple HTML, BBCode, or <a href="http://commonmark.org/help/" rel="nofollow">Markdown</a>:</p>\n\n<pre><code>This is **bold**.\nThis is &lt;b&gt;bold&lt;/b&gt;.\nThis is [b]bold[/b].</code></pre>\n\n<p>For more formatting tips, <a href="http://commonmark.org/help/tutorial/" rel="nofollow">try our fun 10 minute interactive tutorial!</a></p>\n\n<h2>Actions</h2>\n\n<p>There are action buttons at the bottom of each post:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/like-link-flag-bookmark-2x.png" width="162" height="42"></p>\n\n<ul>\n<li><p>To let someone know that you enjoyed and appreciated their post, use the <strong>like</strong> button. Share the love!</p></li>\n<li><p>Grab a copy-pasteable link to any reply or topic via the <strong>link</strong> button.</p></li>\n<li><p>Use the <kbd>…</kbd> show more button to reveal more actions. <strong>Flag</strong> to privately let the author, or <a href="//discourse.ogdch.dev/about">our staff</a>, know about a problem. <strong>Bookmark</strong> to find this post later on your profile page.</p></li>\n</ul>\n\n<h2>Notifications</h2>\n\n<p>When someone replies to you, quotes your post, mentions your <code>@username</code>, or even links to your post, a number will immediately appear at the top right of the page. Select it to access your <strong>notifications</strong>.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/notification-panel-2x.png" width="160" height="54"></p>\n\n<p>Don't worry about missing a reply – you'll be emailed any notifications that arrive when you are away.</p>\n\n<h2>Preferences</h2>\n\n<ul>\n<li><p>All topics less than <strong>two days old</strong> are considered new.</p></li>\n<li><p>Any topic you've <strong>actively participated in</strong> (by creating it, replying to it, or reading it for an extended period) will be automatically tracked on your behalf.</p></li>\n</ul>\n\n<p>You will see the new and unread number indicators next to these topics:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/topics-new-unread-2x.png" width="341" height="106"></p>\n\n<p>You can change your notifications for any topic via the notification control at the bottom, and right hand side, of each topic.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/topic-notification-control-2x.png" width="608" height="312"></p>\n\n<p>You can also set notification state per category, if you want to watch or mute every new topic in a specific category.</p>\n\n<p>To change any of these settings, see <a href="//discourse.ogdch.dev/my/preferences">your user preferences</a>.</p>\n\n<h2>Community Trust</h2>\n\n<p>It's great to meet you! As you participate here, over time we'll get to know you, and your temporary new user limitations will be lifted. Keep participating, and over time you'll gain new <a href="https://meta.discourse.org/t/what-do-user-trust-levels-do/4924" rel="nofollow">trust levels</a> that include special abilities to help us manage our community together.</p>\n\n<p>We believe in <a href="//discourse.ogdch.dev/guidelines">civilized community behavior</a> at all times.</p>\n\n<p>Enjoy your stay!</p>\n\n<p>(If you need to communicate with <a href="//discourse.ogdch.dev/about">staff members</a> as a new user, just reply to this message.)</p>	2016-06-15 08:19:42.346313	2016-06-15 08:19:42.346313	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-15 08:19:42.369894	f	\N	0	0	0	\N	\N	810	1	1	f	2016-06-15 08:19:42.346194	1	\N	0	f	f	\N	1	\N
17	-1	14	1	Danke fürs Anmelden bei Discourse, sei willkommen!\n\nHier sind einige Tipps um dir den Einstieg zu erleichtern.\n\n## Lesen\n\nUm mehr zu lesen **scrolle einfach weiter nach unten!**\n\nWenn neue Beiträge ankommen werden erscheinen diese automatisch – du musst die Seite nicht neu laden.\n\n## Navigation\n\n- Um die Suche, deine Profilseite oder das Menü <kbd>☰</kbd>aufzurufen benutze die **Schaltflächen oben rechts**.\n\n- Das Klicken auf den Titel eines Themas bringt dich zum **ersten ungelesenen Beitrag**. Benutze stattdessen die Beitragszahl oder das Datum des letzten Beitrags um ganz oben oder ganz unten einzusteigen.\n\n    <img src="http://discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png" width="593" height="59">\n\n- Während des Lesens eines Themas kannst du mit der Fortschrittsanzeige unten rechts navigieren. Durch Klick auf den Titel kommst du schnell zum Anfang. Drücke <kbd>?</kbd> um eine Liste von praktischen Tastenkürzeln anzuzeigen.\n\n    <img src="http://discourse.ogdch.dev/images/welcome/progress-bar-2x.png" width="153" height="181">\n\n## Antworten\n\n- Um auf das **gesamte Thema** zu antworten benutze <img src="http://discourse.ogdch.dev/images/welcome/reply-topic-2x.png" width="25" height="23"> ganz unten auf der Seite.\n\n- Um **einer Person** zu antworten benutze <img src="http://discourse.ogdch.dev/images/welcome/reply-post-2x.png" width="25" height="23"> auf ihrem Post.\n\n- Um mit **einem neuen Thema** zu antworten benutze <img src="http://discourse.ogdch.dev/images/welcome/reply-as-linked-topic-2x.png" width="20" height="25"> rechts vom Beitrag. Die alten und neuen Themen werden automatisch verlinkt.\n\nDein Beitrag kann mit einfachem HTML, BBCode oder [Markdown](http://commonmark.org/help/): formatiert werden:\n\n    Das ist **fett gedruckt**.\n    Das ist <b>fett gedruckt</b>.\n    Das ist [b]fett gedruckt[/b].\n\nMöchtest du Markdown lernen? [Benutze unser interaktives, 10-minütiges Tutorial!](http://commonmark.org/help/tutorial/)\n\nUm ein Zitat einzufügen wähle den Text aus, den zu zitieren möchtest, und klicke dann auf einen Antworten-Knopf. Den Vorgang kannst du wiederholen, um mehrere Zitate einzufügen!\n\n<img src="http://discourse.ogdch.dev/images/welcome/quote-reply-2x.png" width="326" height="128">\n\nUm jemanden in auf deinen Beitrag aufmerksam zu machen erwähne seinen Namen. Gib `@` ein, um einen Benutzernamen auszuwählen.\n\n<img src="http://discourse.ogdch.dev/images/welcome/username-completion-2x.png" width="191" height="125">\n\nUm [Standard-Emoji](http://www.emoji.codes/) zu benutzen tippe einfach `:` um nach Namen zu suchen, oder verwende traditionelle Smileys `:)`\n\n<img src="http://discourse.ogdch.dev/images/welcome/emoji-completion-2x.png" width="144" height="153">\n\nUm eine Zusammenfassung für einen Link zu generieren, füge ihn einfach in einer eigenen Zeile ein:\n\n<img src="http://discourse.ogdch.dev/images/welcome/link-oneboxing-animation.gif" width="480" height="228">\n\n## Aktionen\n\nUnter jedem Beitrag befinden sich Aktionsbuttons:\n\n<img src="http://discourse.ogdch.dev/images/welcome/like-link-flag-bookmark-2x.png" width="162" height="42">\n\nUm jemandem zu zeigen dass dir sein Beitrag gefallen hat, drücke den **❤**-Knopf. Teile deine Freude!\n\nWenn du ein Problem mit einem Beitrag feststellst, mach den Autor oder [die Moderatoren](http://discourse.ogdch.dev/about) durch **Melden** darauf aufmerksam. Du kannst außerdem einen Link zu einem Beitrag **teilen**, oder ihn zum Merken mit einem **Lesezeichen** versehen, damit er später auf deiner Profilseite angezeigt wird.\n\n## Benachrichtigungen\n\nWenn jemand auf deinen Beitrag antwortet, deinen Beitrag zitiert oder deinen `@Benutzernamen` erwähnt, zeigt sich sofort eine Zahl oben rechts auf der Seite. Dort kannst du deine **Benachrichtigungen** abrufen.\n\n<img src="http://discourse.ogdch.dev/images/welcome/notification-panel-2x.png" width="160" height="54">\n\nUm das Verpassen von Antworten musst du dir keine Sorgen machen – alle Benachrichtigungen werden dir per E-Mail zugeschickt falls du nicht online bist wenn sie ankommen.\n\n## Deine Einstellungen\n\n  - Alle Themen die weniger als zwei Tage alt sind gelten als neu.\n\n  - Alle Themen an denen du **aktiv teilgenommen hast** (durch Erstellen, Antworten oder längeres Lesen) werden automatisch verfolgt.\n\nNeben diesen Themen wirst du blaue Zahlen und Neu-Indikatoren finden:\n\n<img src="http://discourse.ogdch.dev/images/welcome/topics-new-unread-2x.png" width="341" height="106">\n\nDu kannst den Informationsmodus eines Themas mit dem Menü am Ende anpassen.\n\n<img src="http://discourse.ogdch.dev/images/welcome/topic-notification-control-2x.png" width="608" height="312">\n\nDu kannst den Informationsmodus auch für ganze Kategorien einstellen falls du jedes neue Thema in einer bestimmten Kategorie beobachten willst.\n\nUm diese Funktion zu konfigurieren, gehe in [deine Einstellungen](http://discourse.ogdch.dev/my/preferences).\n\n## Vertrauen\n\nDurch deine Teilnahme wirst du dir im Laufe der Zeit das Vertrauen der Community verdienen, ein vollständiges Mitglied werden und die Einschränkungen für neue Benutzer werden aufgehoben. Wenn du eine ausreichend hohe [Vertrauensstufe](https://meta.discourse.org/t/what-do-user-trust-levels-do/4924) erreichst erhältst du neue Fähigkeiten mit denen wir unsere Community gemeinsam verwalten können.\n\n\nWir wünschen uns ein stets [zivilisiertes Verhalten in unserer Community](http://discourse.ogdch.dev/guidelines).\n\nViel Spaß!\n\n(Wenn du als neuer Benutzer unter vier Augen mit einem unserer [Mitarbeiter](http://discourse.ogdch.dev/about) reden möchtest, antworte einfach auf diese Nachricht.)	<p>Danke fürs Anmelden bei Discourse, sei willkommen!</p>\n\n<p>Hier sind einige Tipps um dir den Einstieg zu erleichtern.</p>\n\n<h2>Lesen</h2>\n\n<p>Um mehr zu lesen <strong>scrolle einfach weiter nach unten!</strong></p>\n\n<p>Wenn neue Beiträge ankommen werden erscheinen diese automatisch – du musst die Seite nicht neu laden.</p>\n\n<h2>Navigation</h2>\n\n<ul>\n<li><p>Um die Suche, deine Profilseite oder das Menü <kbd>☰</kbd>aufzurufen benutze die <strong>Schaltflächen oben rechts</strong>.</p></li>\n<li>\n<p>Das Klicken auf den Titel eines Themas bringt dich zum <strong>ersten ungelesenen Beitrag</strong>. Benutze stattdessen die Beitragszahl oder das Datum des letzten Beitrags um ganz oben oder ganz unten einzusteigen.</p>\n<p><img src="//discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png" width="593" height="59"></p>\n</li>\n<li>\n<p>Während des Lesens eines Themas kannst du mit der Fortschrittsanzeige unten rechts navigieren. Durch Klick auf den Titel kommst du schnell zum Anfang. Drücke <kbd>?</kbd> um eine Liste von praktischen Tastenkürzeln anzuzeigen.</p>\n<p><img src="//discourse.ogdch.dev/images/welcome/progress-bar-2x.png" width="153" height="181"></p>\n</li>\n</ul>\n\n<h2>Antworten</h2>\n\n<ul>\n<li><p>Um auf das <strong>gesamte Thema</strong> zu antworten benutze <img src="//discourse.ogdch.dev/images/welcome/reply-topic-2x.png" width="25" height="23"> ganz unten auf der Seite.</p></li>\n<li><p>Um <strong>einer Person</strong> zu antworten benutze <img src="//discourse.ogdch.dev/images/welcome/reply-post-2x.png" width="25" height="23"> auf ihrem Post.</p></li>\n<li><p>Um mit <strong>einem neuen Thema</strong> zu antworten benutze <img src="//discourse.ogdch.dev/images/welcome/reply-as-linked-topic-2x.png" width="20" height="25"> rechts vom Beitrag. Die alten und neuen Themen werden automatisch verlinkt.</p></li>\n</ul>\n\n<p>Dein Beitrag kann mit einfachem HTML, BBCode oder <a href="http://commonmark.org/help/" rel="nofollow">Markdown</a>: formatiert werden:</p>\n\n<pre><code>Das ist **fett gedruckt**.\nDas ist &lt;b&gt;fett gedruckt&lt;/b&gt;.\nDas ist [b]fett gedruckt[/b].</code></pre>\n\n<p>Möchtest du Markdown lernen? <a href="http://commonmark.org/help/tutorial/" rel="nofollow">Benutze unser interaktives, 10-minütiges Tutorial!</a></p>\n\n<p>Um ein Zitat einzufügen wähle den Text aus, den zu zitieren möchtest, und klicke dann auf einen Antworten-Knopf. Den Vorgang kannst du wiederholen, um mehrere Zitate einzufügen!</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/quote-reply-2x.png" width="326" height="128"></p>\n\n<p>Um jemanden in auf deinen Beitrag aufmerksam zu machen erwähne seinen Namen. Gib <code>@</code> ein, um einen Benutzernamen auszuwählen.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/username-completion-2x.png" width="191" height="125"></p>\n\n<p>Um <a href="http://www.emoji.codes/" rel="nofollow">Standard-Emoji</a> zu benutzen tippe einfach <code>:</code> um nach Namen zu suchen, oder verwende traditionelle Smileys <code>:)</code></p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/emoji-completion-2x.png" width="144" height="153"></p>\n\n<p>Um eine Zusammenfassung für einen Link zu generieren, füge ihn einfach in einer eigenen Zeile ein:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/link-oneboxing-animation.gif" width="480" height="228"></p>\n\n<h2>Aktionen</h2>\n\n<p>Unter jedem Beitrag befinden sich Aktionsbuttons:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/like-link-flag-bookmark-2x.png" width="162" height="42"></p>\n\n<p>Um jemandem zu zeigen dass dir sein Beitrag gefallen hat, drücke den <strong><img src="/images/emoji/emoji_one/heart.png?v=2" title=":heart:" class="emoji" alt=":heart:"></strong>-Knopf. Teile deine Freude!</p>\n\n<p>Wenn du ein Problem mit einem Beitrag feststellst, mach den Autor oder <a href="//discourse.ogdch.dev/about">die Moderatoren</a> durch <strong>Melden</strong> darauf aufmerksam. Du kannst außerdem einen Link zu einem Beitrag <strong>teilen</strong>, oder ihn zum Merken mit einem <strong>Lesezeichen</strong> versehen, damit er später auf deiner Profilseite angezeigt wird.</p>\n\n<h2>Benachrichtigungen</h2>\n\n<p>Wenn jemand auf deinen Beitrag antwortet, deinen Beitrag zitiert oder deinen <code>@Benutzernamen</code> erwähnt, zeigt sich sofort eine Zahl oben rechts auf der Seite. Dort kannst du deine <strong>Benachrichtigungen</strong> abrufen.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/notification-panel-2x.png" width="160" height="54"></p>\n\n<p>Um das Verpassen von Antworten musst du dir keine Sorgen machen – alle Benachrichtigungen werden dir per E-Mail zugeschickt falls du nicht online bist wenn sie ankommen.</p>\n\n<h2>Deine Einstellungen</h2>\n\n<ul>\n<li><p>Alle Themen die weniger als zwei Tage alt sind gelten als neu.</p></li>\n<li><p>Alle Themen an denen du <strong>aktiv teilgenommen hast</strong> (durch Erstellen, Antworten oder längeres Lesen) werden automatisch verfolgt.</p></li>\n</ul>\n\n<p>Neben diesen Themen wirst du blaue Zahlen und Neu-Indikatoren finden:</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/topics-new-unread-2x.png" width="341" height="106"></p>\n\n<p>Du kannst den Informationsmodus eines Themas mit dem Menü am Ende anpassen.</p>\n\n<p><img src="//discourse.ogdch.dev/images/welcome/topic-notification-control-2x.png" width="608" height="312"></p>\n\n<p>Du kannst den Informationsmodus auch für ganze Kategorien einstellen falls du jedes neue Thema in einer bestimmten Kategorie beobachten willst.</p>\n\n<p>Um diese Funktion zu konfigurieren, gehe in <a href="//discourse.ogdch.dev/my/preferences">deine Einstellungen</a>.</p>\n\n<h2>Vertrauen</h2>\n\n<p>Durch deine Teilnahme wirst du dir im Laufe der Zeit das Vertrauen der Community verdienen, ein vollständiges Mitglied werden und die Einschränkungen für neue Benutzer werden aufgehoben. Wenn du eine ausreichend hohe <a href="https://meta.discourse.org/t/what-do-user-trust-levels-do/4924" rel="nofollow">Vertrauensstufe</a> erreichst erhältst du neue Fähigkeiten mit denen wir unsere Community gemeinsam verwalten können.</p>\n\n<p>Wir wünschen uns ein stets <a href="//discourse.ogdch.dev/guidelines">zivilisiertes Verhalten in unserer Community</a>.</p>\n\n<p>Viel Spaß!</p>\n\n<p>(Wenn du als neuer Benutzer unter vier Augen mit einem unserer <a href="//discourse.ogdch.dev/about">Mitarbeiter</a> reden möchtest, antworte einfach auf diese Nachricht.)</p>	2016-06-15 08:22:18.362278	2016-06-15 08:22:18.362278	\N	0	0	\N	0	0	0	0	\N	0.200000000000000011	1	1	0	1	-1	f	\N	0	0	0	0	2016-06-15 08:22:18.435726	f	\N	0	0	0	\N	\N	825	1	1	f	2016-06-15 08:22:18.362183	1	\N	0	f	f	\N	1	\N
18	5	15	1	\n<div><div class="module-content">\n          \n            \n              <h1 class="heading">Haltestellen</h1>\n            \n            \n              <div class="nums">\n                 \n                  Follower\n                  0\n                 \n              </div>\n            \n            \n              \n                <p class="follow_button">\n                  \n                </p>\n              \n            \n          \n        </div></div>\n\n<hr>\n<small>Dies ist ein Begleitthema zum ursprünglichen Beitrag unter <a href="http://ogdch.dev/dataset/haltestellen">http://ogdch.dev/dataset/haltestellen</a></small>	\n<div><div class="module-content">\n          \n            \n              <h1 class="heading">Haltestellen</h1>\n            \n            \n              <div class="nums">\n                 \n                  Follower\n                  0\n                 \n              </div>\n            \n            \n              \n                <p class="follow_button">\n                  \n                </p>\n              \n            \n          \n        </div></div>\n\n<hr>\n<small>Dies ist ein Begleitthema zum ursprünglichen Beitrag unter <a href="http://ogdch.dev/dataset/haltestellen">http://ogdch.dev/dataset/haltestellen</a></small>	2016-06-15 08:52:08.475689	2016-06-15 08:52:08.475689	\N	0	0	\N	0	0	0	0	\N	0.400000000000000022	2	1	0	1	5	f	\N	0	0	0	0	2016-06-15 08:52:08.476892	f	\N	0	0	0	\N	\N	46	1	2	f	2016-06-15 08:52:08.475557	1	\N	0	f	f	\N	1	\N
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('posts_id_seq', 19, true);


--
-- Data for Name: queued_posts; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY queued_posts (id, queue, state, user_id, raw, post_options, topic_id, approved_by_id, approved_at, rejected_by_id, rejected_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: queued_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('queued_posts_id_seq', 1, false);


--
-- Data for Name: quoted_posts; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY quoted_posts (id, post_id, quoted_post_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: quoted_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('quoted_posts_id_seq', 1, false);


--
-- Data for Name: scheduler_stats; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY scheduler_stats (id, name, hostname, pid, duration_ms, live_slots_start, live_slots_finish, started_at, success) FROM stdin;
1	Jobs::EnqueueMailingListEmails	localhost-app\n	84	56	735701	753473	2016-06-14 16:57:41.853126	t
2	Jobs::VersionCheck	localhost-app\n	84	767	852587	895000	2016-06-14 16:57:50.877671	t
3	Jobs::PollMailbox	localhost-app\n	84	14	903359	903996	2016-06-14 16:57:52.884942	t
4	Jobs::DestroyOldDeletionStubs	localhost-app\n	84	23	908201	909770	2016-06-14 16:57:59.904081	t
5	Jobs::PollFeed	localhost-app\n	84	12	911255	911900	2016-06-14 16:58:01.911639	t
6	Jobs::CleanUpEmailLogs	localhost-app\n	84	19	523588	524552	2016-06-14 16:58:09.933924	t
7	Jobs::Weekly	localhost-app\n	84	32	525655	527353	2016-06-14 16:58:10.938589	t
8	Jobs::AboutStats	localhost-app\n	84	40	528668	534972	2016-06-14 16:58:12.949324	t
9	Jobs::EnqueueOnceoffs	localhost-app\n	84	101	551423	583271	2016-06-14 16:58:41.019976	t
10	Jobs::PendingFlagsReminder	localhost-app\n	84	12	641759	642402	2016-06-14 16:59:00.070035	t
11	Jobs::DirectoryRefreshOlder	localhost-app\n	84	47	645476	647901	2016-06-14 16:59:05.084877	t
12	Jobs::BadgeGrant	localhost-app\n	84	216	649954	705350	2016-06-14 16:59:08.09322	t
13	Jobs::CreateMissingAvatars	localhost-app\n	84	11	713092	716900	2016-06-14 16:59:23.137837	t
14	Jobs::CleanUpDigestKeys	localhost-app\n	77	31	519986	525273	2016-06-14 16:59:44.920118	t
15	Jobs::PurgeInactive	localhost-app\n	77	24	526229	529400	2016-06-14 16:59:45.922183	t
16	Jobs::CategoryStats	localhost-app\n	77	119	535910	600881	2016-06-14 16:59:57.941153	t
17	Jobs::ProcessBadgeBacklog	localhost-app\n	77	61	603543	615051	2016-06-14 17:00:01.957558	t
18	Jobs::PurgeDeletedUploads	localhost-app\n	77	23	616433	617098	2016-06-14 17:00:02.961572	t
19	Jobs::DailyPerformanceReport	localhost-app\n	77	10	618016	618649	2016-06-14 17:00:03.966632	t
20	Jobs::CleanUpUnmatchedEmails	localhost-app\n	77	17	620725	621798	2016-06-14 17:00:05.973418	t
21	Jobs::DirectoryRefreshDaily	localhost-app\n	77	26	468235	469212	2016-06-14 17:00:13.993168	t
22	Jobs::TopRefreshOlder	localhost-app\n	77	19	471959	474793	2016-06-14 17:00:18.001406	t
23	Jobs::Heartbeat	localhost-app\n	77	15	479370	480509	2016-06-14 17:00:25.020186	t
24	Jobs::PendingUsersReminder	localhost-app\n	77	13	485174	485807	2016-06-14 17:00:34.045943	t
25	Jobs::DisableBootstrapMode	localhost-app\n	77	6	488620	489253	2016-06-14 17:00:38.056859	t
26	Jobs::CleanUpUnmatchedIPs	localhost-app\n	83	29	513227	523623	2016-06-14 17:12:52.711783	t
27	Jobs::ProcessBadgeBacklog	localhost-app\n	83	48	526066	534462	2016-06-14 17:12:53.715698	t
28	Jobs::CleanUpUploads	localhost-app\n	83	21	535379	536525	2016-06-14 17:12:54.719662	t
29	Jobs::ReindexSearch	localhost-app\n	83	31	537907	541574	2016-06-14 17:12:55.72611	t
30	Jobs::CleanUpExports	localhost-app\n	83	23	542491	543601	2016-06-14 17:12:56.732163	t
31	Jobs::TopRefreshToday	localhost-app\n	83	28	544983	546501	2016-06-14 17:12:57.73886	t
32	Jobs::DashboardStats	localhost-app\n	83	127	547736	613269	2016-06-14 17:12:58.742281	t
33	Jobs::CleanUpUnusedStagedUsers	localhost-app\n	83	23	614652	616719	2016-06-14 17:12:59.747261	t
34	Jobs::CalculateAvgTime	localhost-app\n	83	21	617636	618507	2016-06-14 17:13:00.751761	t
35	Jobs::PendingQueuedPostReminder	localhost-app\n	83	21	619890	621430	2016-06-14 17:13:01.75842	t
36	Jobs::DestroyOldHiddenPosts	localhost-app\n	83	17	622347	624171	2016-06-14 17:13:02.7626	t
37	Jobs::EnqueueDigestEmails	localhost-app\n	83	16	626002	627855	2016-06-14 17:13:03.76723	t
38	Jobs::PeriodicalUpdates	localhost-app\n	83	78	628773	656966	2016-06-14 17:13:04.771722	t
39	Jobs::EnsureDbConsistency	localhost-app\n	83	234	658348	746858	2016-06-14 17:13:05.776234	t
40	Jobs::PollMailbox	localhost-app\n	83	12	747776	748413	2016-06-14 17:13:06.780951	t
41	Jobs::Heartbeat	localhost-app\n	83	22	809628	811159	2016-06-14 17:13:07.787824	t
42	Jobs::EnqueueOnceoffs	localhost-app\n	83	105	812678	469895	2016-06-14 17:13:08.792808	t
43	Jobs::ProcessBadgeBacklog	localhost-app\n	83	16	493900	497587	2016-06-14 17:13:53.892075	t
44	Jobs::ProcessBadgeBacklog	localhost-app\n	83	31	527422	531102	2016-06-14 17:14:53.019143	t
45	Jobs::ProcessBadgeBacklog	localhost-app\n	83	43	514441	532324	2016-06-15 07:19:01.760777	t
46	Jobs::Heartbeat	localhost-app\n	83	12	533677	534816	2016-06-15 07:19:02.764268	t
47	Jobs::PollMailbox	localhost-app\n	83	4	536207	536844	2016-06-15 07:19:03.765926	t
48	Jobs::EnqueueOnceoffs	localhost-app\n	83	99	538134	465401	2016-06-15 07:19:04.770979	t
49	Jobs::AboutStats	localhost-app\n	83	21	466327	472557	2016-06-15 07:19:05.776365	t
50	Jobs::PeriodicalUpdates	localhost-app\n	83	75	473847	497205	2016-06-15 07:19:06.779699	t
51	Jobs::DestroyOldDeletionStubs	localhost-app\n	83	21	498597	500166	2016-06-15 07:19:07.784585	t
52	Jobs::DashboardStats	localhost-app\n	83	120	501456	567284	2016-06-15 07:19:08.789009	t
53	Jobs::EnqueueDigestEmails	localhost-app\n	83	23	568295	570179	2016-06-15 07:19:09.792911	t
54	Jobs::PollFeed	localhost-app\n	83	10	571470	572103	2016-06-15 07:19:10.797271	t
55	Jobs::CreateMissingAvatars	localhost-app\n	83	22	573114	576458	2016-06-15 07:19:11.801319	t
56	Jobs::EnqueueMailingListEmails	localhost-app\n	83	18	578340	579769	2016-06-15 07:19:12.805591	t
57	Jobs::DirectoryRefreshDaily	localhost-app\n	83	14	580781	581758	2016-06-15 07:19:13.80849	t
58	Jobs::PendingUsersReminder	localhost-app\n	83	5	583048	583681	2016-06-15 07:19:14.810399	t
59	Jobs::PendingQueuedPostReminder	localhost-app\n	83	20	584693	586232	2016-06-15 07:19:15.815455	t
60	Jobs::TopRefreshToday	localhost-app\n	83	40	588051	589900	2016-06-15 07:19:16.819736	t
61	Jobs::CleanUpUploads	localhost-app\n	83	18	591502	592626	2016-06-15 07:19:17.823711	t
62	Jobs::ScheduleBackup	localhost-app\n	83	14	593933	595031	2016-06-15 07:19:18.827932	t
63	Jobs::Tl3Promotions	localhost-app\n	83	23	596059	598261	2016-06-15 07:19:19.831918	t
64	Jobs::EnsureDbConsistency	localhost-app\n	83	185	599551	684605	2016-06-15 07:19:20.836662	t
65	Jobs::ProcessBadgeBacklog	localhost-app\n	83	4	703751	704395	2016-06-15 07:19:59.934162	t
66	Jobs::ProcessBadgeBacklog	localhost-app\n	83	26	735553	739240	2016-06-15 07:20:59.121415	t
67	Jobs::ProcessBadgeBacklog	localhost-app\n	83	37	769351	773031	2016-06-15 07:21:57.31657	t
68	Jobs::Heartbeat	localhost-app\n	83	3	779482	780595	2016-06-15 07:22:05.328306	t
69	Jobs::ProcessBadgeBacklog	localhost-app\n	83	15	806735	807379	2016-06-15 07:22:57.416712	t
70	Jobs::ProcessBadgeBacklog	localhost-app\n	83	13	838753	842433	2016-06-15 07:23:58.521628	t
71	Jobs::PollMailbox	localhost-app\n	83	2	852275	852912	2016-06-15 07:24:13.532257	t
72	Jobs::ProcessBadgeBacklog	localhost-app\n	83	3	875282	875926	2016-06-15 07:24:58.591557	t
73	Jobs::Heartbeat	localhost-app\n	83	3	881451	882557	2016-06-15 07:25:04.600669	t
74	Jobs::ProcessBadgeBacklog	localhost-app\n	83	3	909144	909788	2016-06-15 07:25:58.685891	t
75	Jobs::ProcessBadgeBacklog	localhost-app\n	83	60	941270	944950	2016-06-15 07:27:00.809738	t
76	Jobs::ProcessBadgeBacklog	localhost-app\n	83	35	952549	944476	2016-06-15 07:27:59.903535	t
77	Jobs::Heartbeat	localhost-app\n	83	14	484851	485958	2016-06-15 07:28:03.917398	t
78	Jobs::ProcessBadgeBacklog	localhost-app\n	83	2	513379	514023	2016-06-15 07:29:01.140212	t
79	Jobs::PollMailbox	localhost-app\n	83	3	526182	526819	2016-06-15 07:29:21.172219	t
80	Jobs::EnqueueOnceoffs	localhost-app\n	83	49	531500	535369	2016-06-15 07:29:29.188627	t
81	Jobs::ProcessBadgeBacklog	localhost-app\n	83	3	553184	553828	2016-06-15 07:30:02.255454	t
82	Jobs::Heartbeat	localhost-app\n	86	14	514622	517474	2016-06-15 07:34:17.152892	t
83	Jobs::ProcessBadgeBacklog	localhost-app\n	86	39	523201	535436	2016-06-15 07:34:18.153064	t
84	Jobs::PeriodicalUpdates	localhost-app\n	86	67	536360	559695	2016-06-15 07:34:19.159398	t
85	Jobs::PollMailbox	localhost-app\n	86	3	567995	568632	2016-06-15 07:34:35.187767	t
86	Jobs::ProcessBadgeBacklog	localhost-app\n	86	15	482840	486527	2016-06-15 07:35:17.313171	t
87	Jobs::ProcessBadgeBacklog	localhost-app\n	86	36	518085	521765	2016-06-15 07:36:18.457847	t
88	Jobs::Heartbeat	localhost-app\n	86	19	546802	547914	2016-06-15 07:37:10.555225	t
89	Jobs::ProcessBadgeBacklog	localhost-app\n	86	12	555058	555702	2016-06-15 07:37:18.575644	t
90	Jobs::ProcessBadgeBacklog	localhost-app\n	86	25	586415	590095	2016-06-15 07:38:18.69662	t
91	Jobs::ProcessBadgeBacklog	localhost-app\n	86	34	621980	625660	2016-06-15 07:39:20.84227	t
92	Jobs::PollMailbox	localhost-app\n	86	11	636372	637009	2016-06-15 07:39:41.896106	t
93	Jobs::EnqueueOnceoffs	localhost-app\n	86	34	642688	646608	2016-06-15 07:39:51.916771	t
94	Jobs::Heartbeat	localhost-app\n	86	16	656075	657189	2016-06-15 07:40:09.966746	t
95	Jobs::ProcessBadgeBacklog	localhost-app\n	86	12	666750	667394	2016-06-15 07:40:23.00293	t
96	Jobs::ProcessBadgeBacklog	localhost-app\n	86	34	698356	702036	2016-06-15 07:41:23.128625	t
97	Jobs::ProcessBadgeBacklog	localhost-app\n	86	21	733321	737094	2016-06-15 07:42:23.254833	t
98	Jobs::Heartbeat	localhost-app\n	86	16	755704	756815	2016-06-15 07:43:02.327357	t
99	Jobs::ProcessBadgeBacklog	localhost-app\n	86	4	769413	770057	2016-06-15 07:43:22.35877	t
100	Jobs::ProcessBadgeBacklog	localhost-app\n	86	24	800760	804440	2016-06-15 07:44:21.479475	t
101	Jobs::PollMailbox	localhost-app\n	86	9	819644	820281	2016-06-15 07:44:52.5479	t
102	Jobs::ProcessBadgeBacklog	localhost-app\n	86	12	836087	836731	2016-06-15 07:45:19.60278	t
103	Jobs::Heartbeat	localhost-app\n	86	23	855018	856129	2016-06-15 07:45:57.67397	t
104	Jobs::ProcessBadgeBacklog	localhost-app\n	86	4	869967	870611	2016-06-15 07:46:18.734297	t
105	Jobs::ProcessBadgeBacklog	localhost-app\n	86	12	898281	898925	2016-06-15 07:47:16.859095	t
106	Jobs::EnqueueDigestEmails	localhost-app\n	86	41	918196	926271	2016-06-15 07:47:51.987718	t
107	Jobs::DashboardStats	localhost-app\n	86	162	935626	941757	2016-06-15 07:48:10.028723	t
108	Jobs::ProcessBadgeBacklog	localhost-app\n	86	11	941783	941647	2016-06-15 07:48:15.046211	t
109	Jobs::PeriodicalUpdates	localhost-app\n	86	82	521364	543217	2016-06-15 07:48:40.093217	t
110	Jobs::Heartbeat	localhost-app\n	86	15	553475	554582	2016-06-15 07:49:00.145491	t
111	Jobs::ProcessBadgeBacklog	localhost-app\n	86	14	562912	563556	2016-06-15 07:49:15.18507	t
112	Jobs::EnqueueOnceoffs	localhost-app\n	86	47	575320	576176	2016-06-15 07:49:33.222637	t
113	Jobs::PollMailbox	localhost-app\n	86	10	588880	589517	2016-06-15 07:49:58.284369	t
114	Jobs::DestroyOldDeletionStubs	localhost-app\n	86	16	593132	594695	2016-06-15 07:50:05.298545	t
115	Jobs::ProcessBadgeBacklog	localhost-app\n	86	11	602848	603492	2016-06-15 07:50:17.326354	t
116	Jobs::AboutStats	localhost-app\n	86	34	605821	612039	2016-06-15 07:50:19.328474	t
117	Jobs::ProcessBadgeBacklog	localhost-app\n	86	4	641761	642405	2016-06-15 07:51:17.451157	t
118	Jobs::Heartbeat	localhost-app\n	86	35	665252	669394	2016-06-15 07:52:00.537897	t
119	Jobs::ProcessBadgeBacklog	localhost-app\n	86	13	679987	680631	2016-06-15 07:52:17.576555	t
120	Jobs::ProcessBadgeBacklog	localhost-app\n	86	31	711877	715557	2016-06-15 07:53:18.688834	t
121	Jobs::ProcessBadgeBacklog	localhost-app\n	86	32	746070	749750	2016-06-15 07:54:18.833229	t
122	Jobs::PollMailbox	localhost-app\n	86	10	769785	770422	2016-06-15 07:55:00.915123	t
123	Jobs::Heartbeat	localhost-app\n	86	16	772788	773894	2016-06-15 07:55:03.924011	t
124	Jobs::ProcessBadgeBacklog	localhost-app\n	86	13	784383	785027	2016-06-15 07:55:19.957826	t
125	Jobs::ProcessBadgeBacklog	localhost-app\n	86	39	949060	957128	2016-06-15 07:56:19.096804	t
126	Jobs::ProcessBadgeBacklog	localhost-app\n	86	11	524465	525109	2016-06-15 07:57:20.20684	t
127	Jobs::Heartbeat	localhost-app\n	86	15	547645	548751	2016-06-15 07:58:09.323824	t
128	Jobs::ProcessBadgeBacklog	localhost-app\n	86	10	555289	555933	2016-06-15 07:58:18.352761	t
129	Jobs::ProcessBadgeBacklog	localhost-app\n	86	15	600080	600736	2016-06-15 07:59:18.468193	t
130	Jobs::EnqueueOnceoffs	localhost-app\n	86	48	605517	609386	2016-06-15 07:59:26.488251	t
131	Jobs::PollMailbox	localhost-app\n	86	6	627608	628245	2016-06-15 08:00:05.559697	t
132	Jobs::ProcessBadgeBacklog	localhost-app\n	86	35	650823	655598	2016-06-15 08:00:17.588293	t
133	Jobs::Heartbeat	localhost-app\n	86	14	696775	697893	2016-06-15 08:01:14.694003	t
134	Jobs::ProcessBadgeBacklog	localhost-app\n	86	11	702471	703115	2016-06-15 08:01:18.713314	t
135	Jobs::ProcessBadgeBacklog	localhost-app\n	86	14	746629	747273	2016-06-15 08:02:18.848751	t
136	Jobs::ProcessBadgeBacklog	localhost-app\n	86	38	777400	781080	2016-06-15 08:03:19.980178	t
137	Jobs::PeriodicalUpdates	localhost-app\n	86	78	786566	812572	2016-06-15 08:03:31.006811	t
138	Jobs::Heartbeat	localhost-app\n	86	4	845471	846577	2016-06-15 08:04:17.11215	t
139	Jobs::ProcessBadgeBacklog	localhost-app\n	86	13	850025	850669	2016-06-15 08:04:19.119204	t
140	Jobs::PollMailbox	localhost-app\n	86	17	872627	876300	2016-06-15 08:05:05.225925	t
141	Jobs::ProcessBadgeBacklog	localhost-app\n	86	2	897996	898640	2016-06-15 08:05:21.25238	t
142	Jobs::ProcessBadgeBacklog	localhost-app\n	86	29	927624	931304	2016-06-15 08:06:20.382233	t
143	Jobs::ProcessBadgeBacklog	localhost-app\n	86	10	960608	964288	2016-06-15 08:07:20.513221	t
144	Jobs::Heartbeat	localhost-app\n	86	16	965908	967019	2016-06-15 08:07:23.520822	t
145	Jobs::ProcessBadgeBacklog	localhost-app\n	86	34	516549	520229	2016-06-15 08:08:20.680454	t
146	Jobs::ProcessBadgeBacklog	localhost-app\n	85	54	515823	533686	2016-06-15 08:12:50.15688	t
147	Jobs::EnqueueOnceoffs	localhost-app\n	85	108	535039	466570	2016-06-15 08:12:51.158814	t
148	Jobs::PollMailbox	localhost-app\n	85	2	467488	468125	2016-06-15 08:12:52.159593	t
149	Jobs::Heartbeat	localhost-app\n	85	16	469508	470647	2016-06-15 08:12:53.164263	t
150	Jobs::ProcessBadgeBacklog	localhost-app\n	85	31	711786	715795	2016-06-15 08:13:50.259418	t
151	Jobs::ProcessBadgeBacklog	localhost-app\n	85	23	753517	761585	2016-06-15 08:14:48.348877	t
152	Jobs::Heartbeat	localhost-app\n	85	4	806339	807450	2016-06-15 08:15:46.446238	t
153	Jobs::ProcessBadgeBacklog	localhost-app\n	85	6	808840	809484	2016-06-15 08:15:47.450488	t
154	Jobs::EnqueueDigestEmails	localhost-app\n	85	30	842620	847980	2016-06-15 08:16:32.551247	t
155	Jobs::DirectoryRefreshDaily	localhost-app\n	85	10	853768	854745	2016-06-15 08:16:44.583197	t
156	Jobs::ProcessBadgeBacklog	localhost-app\n	85	2	856822	857466	2016-06-15 08:16:46.585471	t
157	Jobs::EnqueueMailingListEmails	localhost-app\n	85	14	880917	882403	2016-06-15 08:17:08.625005	t
158	Jobs::TopRefreshToday	localhost-app\n	85	31	768041	769284	2016-06-15 08:17:28.674583	t
159	Jobs::ProcessBadgeBacklog	localhost-app\n	85	44	785628	795622	2016-06-15 08:17:48.71012	t
160	Jobs::PollMailbox	localhost-app\n	85	2	801489	802126	2016-06-15 08:17:54.716325	t
161	Jobs::CleanUpUploads	localhost-app\n	85	5	812924	814037	2016-06-15 08:18:13.740712	t
162	Jobs::DashboardStats	localhost-app\n	85	154	823526	889909	2016-06-15 08:18:31.762395	t
163	Jobs::Heartbeat	localhost-app\n	85	9	897636	898764	2016-06-15 08:18:45.794753	t
164	Jobs::ProcessBadgeBacklog	localhost-app\n	85	13	901049	901693	2016-06-15 08:18:48.803748	t
165	Jobs::PeriodicalUpdates	localhost-app\n	85	84	728355	754867	2016-06-15 08:19:15.846997	t
166	Jobs::ProcessBadgeBacklog	localhost-app\n	85	46	821290	831235	2016-06-15 08:19:50.896873	t
167	Jobs::CreateMissingAvatars	localhost-app\n	85	12	839442	842567	2016-06-15 08:20:06.921261	t
168	Jobs::PollFeed	localhost-app\n	85	4	860734	861367	2016-06-15 08:20:35.961948	t
169	Jobs::PendingQueuedPostReminder	localhost-app\n	85	12	868879	870945	2016-06-15 08:20:46.976599	t
170	Jobs::ProcessBadgeBacklog	localhost-app\n	85	4	876779	877423	2016-06-15 08:20:52.988456	t
171	Jobs::DestroyOldDeletionStubs	localhost-app\n	85	16	884455	886030	2016-06-15 08:21:06.017928	t
172	Jobs::AboutStats	localhost-app\n	85	50	892976	942930	2016-06-15 08:21:11.0358	t
173	Jobs::PendingUsersReminder	localhost-app\n	85	3	951858	952499	2016-06-15 08:21:29.070067	t
174	Jobs::Heartbeat	localhost-app\n	85	4	967776	968882	2016-06-15 08:21:46.0948	t
175	Jobs::ProcessBadgeBacklog	localhost-app\n	85	5	974904	975548	2016-06-15 08:21:52.099856	t
176	Jobs::PollMailbox	localhost-app\n	85	10	842601	843238	2016-06-15 08:22:47.191667	t
177	Jobs::ProcessBadgeBacklog	localhost-app\n	85	63	845303	857505	2016-06-15 08:22:50.19751	t
178	Jobs::EnqueueOnceoffs	localhost-app\n	85	22	866009	866865	2016-06-15 08:22:57.206319	t
179	Jobs::ProcessBadgeBacklog	localhost-app\n	85	23	895114	898794	2016-06-15 08:23:52.306526	t
180	Jobs::Heartbeat	localhost-app\n	85	13	729067	733210	2016-06-15 08:24:51.402874	t
181	Jobs::ProcessBadgeBacklog	localhost-app\n	85	12	735166	735810	2016-06-15 08:24:53.410466	t
182	Jobs::ProcessBadgeBacklog	localhost-app\n	85	18	765779	769459	2016-06-15 08:25:52.513771	t
183	Jobs::ProcessBadgeBacklog	localhost-app\n	85	14	802680	803324	2016-06-15 08:26:53.654576	t
184	Jobs::Heartbeat	localhost-app\n	85	3	827936	829042	2016-06-15 08:27:45.812436	t
185	Jobs::PollMailbox	localhost-app\n	85	12	835394	836031	2016-06-15 08:27:51.828909	t
186	Jobs::ProcessBadgeBacklog	localhost-app\n	85	2	837577	838221	2016-06-15 08:27:53.831183	t
187	Jobs::ProcessBadgeBacklog	localhost-app\n	85	30	869309	872989	2016-06-15 08:28:54.967376	t
188	Jobs::ProcessBadgeBacklog	localhost-app\n	85	20	903660	907340	2016-06-15 08:29:56.076845	t
189	Jobs::Heartbeat	localhost-app\n	85	7	930445	931551	2016-06-15 08:30:43.151927	t
190	Jobs::ProcessBadgeBacklog	localhost-app\n	85	8	940582	941226	2016-06-15 08:30:56.177103	t
191	Jobs::ProcessBadgeBacklog	localhost-app\n	85	13	971053	974733	2016-06-15 08:31:54.282255	t
192	Jobs::PollMailbox	localhost-app\n	85	14	1003657	1004294	2016-06-15 08:32:51.425319	t
193	Jobs::ProcessBadgeBacklog	localhost-app\n	85	2	1007388	1008032	2016-06-15 08:32:56.431209	t
194	Jobs::EnqueueOnceoffs	localhost-app\n	85	31	1010398	1014267	2016-06-15 08:32:59.434053	t
195	Jobs::Heartbeat	localhost-app\n	85	18	1034696	1035802	2016-06-15 08:33:41.522809	t
196	Jobs::ProcessBadgeBacklog	localhost-app\n	85	8	1046831	1047475	2016-06-15 08:33:57.555784	t
197	Jobs::PeriodicalUpdates	localhost-app\n	81	111	523117	560639	2016-06-15 08:38:05.214659	t
198	Jobs::ProcessBadgeBacklog	localhost-app\n	81	7	561560	562204	2016-06-15 08:38:06.219324	t
199	Jobs::Heartbeat	localhost-app\n	81	8	563122	564264	2016-06-15 08:38:07.221176	t
200	Jobs::PollMailbox	localhost-app\n	81	5	566027	566664	2016-06-15 08:38:08.223939	t
201	Jobs::ProcessBadgeBacklog	localhost-app\n	81	19	539009	539653	2016-06-15 08:39:08.360434	t
202	Jobs::ProcessBadgeBacklog	localhost-app\n	81	12	572640	573284	2016-06-15 08:40:07.483151	t
203	Jobs::Heartbeat	localhost-app\n	81	32	605914	607020	2016-06-15 08:41:06.60562	t
204	Jobs::ProcessBadgeBacklog	localhost-app\n	81	6	609141	609785	2016-06-15 08:41:09.612525	t
205	Jobs::ProcessBadgeBacklog	localhost-app\n	81	2	642163	642807	2016-06-15 08:42:09.711553	t
206	Jobs::EnqueueOnceoffs	localhost-app\n	81	41	671065	674985	2016-06-15 08:42:57.82203	t
207	Jobs::ProcessBadgeBacklog	localhost-app\n	85	15	523114	525677	2016-06-15 08:43:16.523148	t
208	Jobs::PollMailbox	localhost-app\n	85	8	530735	531372	2016-06-15 08:43:17.524829	t
209	Jobs::Heartbeat	localhost-app\n	85	5	504842	505979	2016-06-15 08:44:14.612538	t
210	Jobs::ProcessBadgeBacklog	localhost-app\n	85	3	510633	511277	2016-06-15 08:44:17.616821	t
211	Jobs::ProcessBadgeBacklog	localhost-app\n	85	13	543223	543867	2016-06-15 08:45:17.687289	t
212	Jobs::ProcessBadgeBacklog	localhost-app\n	85	7	575646	576290	2016-06-15 08:46:16.800389	t
213	Jobs::Heartbeat	localhost-app\n	85	11	608144	609272	2016-06-15 08:47:16.9445	t
214	Jobs::ProcessBadgeBacklog	localhost-app\n	85	8	611049	611693	2016-06-15 08:47:18.952536	t
215	Jobs::EnqueueDigestEmails	localhost-app\n	85	19	627750	633415	2016-06-15 08:47:49.008917	t
216	Jobs::ProcessBadgeBacklog	localhost-app\n	85	11	650163	650807	2016-06-15 08:48:19.073704	t
217	Jobs::PollMailbox	localhost-app\n	85	2	658688	659367	2016-06-15 08:48:31.090286	t
218	Jobs::DashboardStats	localhost-app\n	85	156	667922	735875	2016-06-15 08:48:48.115795	t
219	Jobs::ProcessBadgeBacklog	localhost-app\n	85	12	752934	753578	2016-06-15 08:49:18.167366	t
220	Jobs::Heartbeat	localhost-app\n	85	7	782721	783827	2016-06-15 08:50:09.263808	t
221	Jobs::AboutStats	localhost-app\n	85	35	786736	792962	2016-06-15 08:50:13.276604	t
222	Jobs::ProcessBadgeBacklog	localhost-app\n	85	2	799268	799912	2016-06-15 08:50:18.280267	t
223	Jobs::ProcessBadgeBacklog	localhost-app\n	85	20	834110	834754	2016-06-15 08:51:18.407562	t
229	Jobs::ProcessBadgeBacklog	localhost-app\n	85	2	620477	621121	2016-06-15 08:53:18.62129	t
230	Jobs::PollMailbox	localhost-app\n	85	11	633263	633900	2016-06-15 08:53:42.666742	t
224	Jobs::ProcessBadgeBacklog	localhost-app\n	85	62	546598	557295	2016-06-15 08:52:18.508328	t
225	Jobs::DestroyOldDeletionStubs	localhost-app\n	85	18	562511	564074	2016-06-15 08:52:29.527869	t
226	Jobs::EnqueueOnceoffs	localhost-app\n	85	30	579507	580414	2016-06-15 08:53:03.591422	t
227	Jobs::PeriodicalUpdates	localhost-app\n	85	73	581704	609064	2016-06-15 08:53:04.595564	t
228	Jobs::Heartbeat	localhost-app\n	85	22	612019	613125	2016-06-15 08:53:10.605981	t
231	Jobs::ProcessBadgeBacklog	localhost-app\n	85	31	651431	655118	2016-06-15 08:54:17.717966	t
232	Jobs::ProcessBadgeBacklog	localhost-app\n	85	10	683297	686977	2016-06-15 08:55:17.804928	t
233	Jobs::Heartbeat	localhost-app\n	85	20	711562	712690	2016-06-15 08:56:13.90236	t
234	Jobs::ProcessBadgeBacklog	localhost-app\n	85	2	714440	715084	2016-06-15 08:56:15.902958	t
235	Jobs::ProcessBadgeBacklog	localhost-app\n	85	26	743680	747360	2016-06-15 08:57:16.008476	t
236	Jobs::ProcessBadgeBacklog	localhost-app\n	85	12	531745	535425	2016-06-15 08:58:18.097164	t
237	Jobs::PollMailbox	localhost-app\n	85	17	543784	544421	2016-06-15 08:58:37.137501	t
238	Jobs::Heartbeat	localhost-app\n	85	26	559822	561115	2016-06-15 08:59:12.20876	t
239	Jobs::ProcessBadgeBacklog	localhost-app\n	85	25	567760	568404	2016-06-15 08:59:19.233547	t
240	Jobs::ProcessBadgeBacklog	localhost-app\n	85	68	597223	600903	2016-06-15 09:00:21.359767	t
241	Jobs::ProcessBadgeBacklog	localhost-app\n	85	17	629017	632697	2016-06-15 09:01:20.483158	t
242	Jobs::Heartbeat	localhost-app\n	85	22	659324	660430	2016-06-15 09:02:17.60994	t
243	Jobs::ProcessBadgeBacklog	localhost-app\n	85	10	663037	663681	2016-06-15 09:02:19.615221	t
244	Jobs::EnqueueOnceoffs	localhost-app\n	85	31	688872	692742	2016-06-15 09:03:01.700913	t
245	Jobs::ProcessBadgeBacklog	localhost-app\n	85	42	792317	802555	2016-06-15 09:03:20.718634	t
246	Jobs::PollMailbox	localhost-app\n	85	3	805249	805886	2016-06-15 09:03:24.722084	t
247	Jobs::ProcessBadgeBacklog	localhost-app\n	85	84	843480	861919	2016-06-15 09:04:20.830883	t
248	Jobs::Heartbeat	localhost-app\n	85	5	885560	886666	2016-06-15 09:05:14.941546	t
249	Jobs::ProcessBadgeBacklog	localhost-app\n	85	4	892191	892835	2016-06-15 09:05:20.956873	t
250	Jobs::ProcessBadgeBacklog	localhost-app\n	85	10	920601	924281	2016-06-15 09:06:19.096219	t
251	Jobs::ProcessBadgeBacklog	localhost-app\n	85	9	952684	956364	2016-06-15 09:07:19.181704	t
252	Jobs::PeriodicalUpdates	localhost-app\n	85	85	535017	566346	2016-06-15 09:07:51.249201	t
253	Jobs::Heartbeat	localhost-app\n	85	16	575827	576934	2016-06-15 09:08:12.281192	t
254	Jobs::ProcessBadgeBacklog	localhost-app\n	85	11	583679	584323	2016-06-15 09:08:19.306081	t
255	Jobs::PollMailbox	localhost-app\n	85	3	585427	586064	2016-06-15 09:08:20.305486	t
256	Jobs::ProcessBadgeBacklog	localhost-app\n	85	19	617569	618213	2016-06-15 09:09:18.420825	t
257	Jobs::ProcessBadgeBacklog	localhost-app\n	85	18	646748	650428	2016-06-15 09:10:19.540448	t
258	Jobs::ProcessBadgeBacklog	localhost-app\n	85	11	677435	678079	2016-06-15 09:11:17.670957	t
259	Jobs::Heartbeat	localhost-app\n	85	18	680307	681413	2016-06-15 09:11:19.679116	t
260	Jobs::ProcessBadgeBacklog	localhost-app\n	85	2	708639	709283	2016-06-15 09:12:17.774131	t
261	Jobs::EnqueueOnceoffs	localhost-app\n	85	37	728590	735495	2016-06-15 09:13:00.843462	t
262	Jobs::PollMailbox	localhost-app\n	85	7	742831	743468	2016-06-15 09:13:15.897006	t
263	Jobs::ProcessBadgeBacklog	localhost-app\n	85	8	746511	747155	2016-06-15 09:13:16.900289	t
264	Jobs::ProcessBadgeBacklog	localhost-app\n	85	8	998944	998960	2016-06-15 09:14:16.03876	t
265	Jobs::Heartbeat	localhost-app\n	85	17	627853	628982	2016-06-15 09:14:19.047905	t
266	Jobs::ProcessBadgeBacklog	localhost-app\n	85	10	693498	694142	2016-06-15 09:15:14.151386	t
267	Jobs::CleanUpUploads	localhost-app\n	85	47	719023	726312	2016-06-15 09:16:06.273711	t
268	Jobs::ProcessBadgeBacklog	localhost-app\n	85	14	729472	730116	2016-06-15 09:16:12.286567	t
269	Jobs::EnqueueDigestEmails	localhost-app\n	85	16	744919	746373	2016-06-15 09:16:40.339148	t
270	Jobs::TopRefreshToday	localhost-app\n	85	23	747478	748721	2016-06-15 09:16:41.341729	t
271	Jobs::ProcessBadgeBacklog	localhost-app\n	85	9	806671	807315	2016-06-15 09:17:12.387049	t
272	Jobs::Heartbeat	localhost-app\n	85	5	813495	814606	2016-06-15 09:17:19.393371	t
273	Jobs::PollMailbox	localhost-app\n	85	2	836254	836891	2016-06-15 09:18:08.47098	t
274	Jobs::ProcessBadgeBacklog	localhost-app\n	85	13	839896	840540	2016-06-15 09:18:13.481012	t
275	Jobs::EnqueueMailingListEmails	localhost-app\n	85	23	855797	857226	2016-06-15 09:18:42.516483	t
276	Jobs::ProcessBadgeBacklog	localhost-app\n	85	2	870819	871463	2016-06-15 09:19:12.556944	t
277	Jobs::DirectoryRefreshDaily	localhost-app\n	85	27	878892	879869	2016-06-15 09:19:23.583922	t
278	Jobs::AboutStats	localhost-app\n	85	28	882432	888686	2016-06-15 09:19:27.589523	t
279	Jobs::DashboardStats	localhost-app\n	85	86	889790	952810	2016-06-15 09:19:28.589768	t
280	Jobs::ProcessBadgeBacklog	localhost-app\n	85	3	552535	553179	2016-06-15 09:20:14.665513	t
281	Jobs::Heartbeat	localhost-app\n	85	3	558418	559525	2016-06-15 09:20:20.675417	t
282	Jobs::CreateMissingAvatars	localhost-app\n	85	23	574074	577149	2016-06-15 09:20:52.733276	t
283	Jobs::ProcessBadgeBacklog	localhost-app\n	85	4	588336	588980	2016-06-15 09:21:16.778031	t
284	Jobs::PendingUsersReminder	localhost-app\n	85	11	597513	598146	2016-06-15 09:21:29.800928	t
285	Jobs::DestroyOldDeletionStubs	localhost-app\n	85	5	601958	603546	2016-06-15 09:21:37.807413	t
286	Jobs::PollFeed	localhost-app\n	85	3	619082	619715	2016-06-15 09:22:12.866325	t
287	Jobs::ProcessBadgeBacklog	localhost-app\n	85	3	622142	622786	2016-06-15 09:22:15.872318	t
288	Jobs::PeriodicalUpdates	localhost-app\n	85	50	634453	660369	2016-06-15 09:22:36.913095	t
289	Jobs::PendingQueuedPostReminder	localhost-app\n	85	24	664117	665668	2016-06-15 09:22:43.929882	t
290	Jobs::EnqueueOnceoffs	localhost-app\n	85	23	676043	676899	2016-06-15 09:23:04.965873	t
291	Jobs::PollMailbox	localhost-app\n	85	4	680040	680677	2016-06-15 09:23:10.987489	t
292	Jobs::ProcessBadgeBacklog	localhost-app\n	85	3	685817	686461	2016-06-15 09:23:16.993832	t
293	Jobs::Heartbeat	localhost-app\n	85	7	691444	692555	2016-06-15 09:23:26.010615	t
294	Jobs::ProcessBadgeBacklog	localhost-app\n	85	15	715237	715881	2016-06-15 09:24:16.102161	t
\.


--
-- Name: scheduler_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('scheduler_stats_id_seq', 294, true);


--
-- Data for Name: schema_migration_details; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY schema_migration_details (id, version, name, hostname, git_version, rails_version, duration, direction, created_at) FROM stdin;
1	20000225050318	AddSchemaMigrationDetails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:26.742611
2	20120311163914	CreateForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:26.754892
3	20120311164326	CreatePosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:26.763798
4	20120311170118	CreateUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:26.770057
5	20120311201341	CreateForums	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:26.77526
6	20120311210245	CreateSites	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:26.780359
7	20120416201606	AddReplyToToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:26.785849
8	20120420183447	AddViewsToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:26.794346
9	20120423140906	AddPostsCountToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:26.809145
10	20120423142820	FixPostIndices	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:26.817221
11	20120423151548	RemoveLastPostId	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:26.82189
12	20120425145456	AddDisplayUsernameToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:26.829407
13	20120427150624	AddUserIdIndexToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:26.83459
14	20120427151452	CookedMigration	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:26.843179
15	20120427154330	CreateVestalVersions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	19	up	2016-06-14 16:53:26.866571
16	20120427172031	AddVersionToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:26.876974
17	20120502183240	AddCreatedByToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:26.882403
18	20120502192121	AddLastPostUserIdToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:26.886463
19	20120503205521	AddSiteIdToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:26.892556
20	20120507144132	CreateExpressions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:26.898836
21	20120507144222	CreateExpressionTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:26.907176
22	20120514144549	AddReplyCountToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:26.91714
23	20120514173920	AddFlagToExpressionTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:26.925342
24	20120514204934	AddDescriptionToExpressionTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:26.931168
25	20120517200130	AddQuotelessToPost	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:26.941587
26	20120518200115	CreateReadPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:26.949875
27	20120519182212	CreateLastReadPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:26.958035
28	20120523180723	CreateViews	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:26.967405
29	20120523184307	AddRepliesToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:26.97643
30	20120523201329	AddFeaturedToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:26.981467
31	20120525194845	AddAvgTimeToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:26.984945
32	20120529175956	CreateUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:26.995796
33	20120529202707	CreateStars	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.002282
34	20120530150726	CreateForumThreadUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:27.010784
35	20120530160745	MigratePosted	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.01497
36	20120530200724	AddIndexToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:27.020069
37	20120530212912	CreateForumThreadLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.02999
38	20120614190726	AddTagsToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.033658
39	20120614202024	AddQuoteCountToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.043297
40	20120615180517	CreateBookmarks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:27.05266
41	20120618152946	AddReplyBelowToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.056263
42	20120618212349	CreatePostTimings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.0659
43	20120618214856	CreateMessageBus	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:27.074944
44	20120619150807	FixPostTimings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:27.085516
45	20120619153349	DropReadPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.089765
46	20120619172714	AddPostNumberToBookmarks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:27.09877
47	20120621155351	AddSeenPostCountToForumThreadUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.104311
48	20120621190310	AddDeletedAtToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.108512
49	20120622200242	CreateNotifications	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:27.117048
50	20120625145714	AddSeenNotificationIdToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:27.129436
51	20120625162318	AddDeletedAtToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.134303
52	20120625174544	AddHighestPostNumberToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.14311
53	20120625195326	AddImageUrlToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.147676
54	20120629143908	RenameExpressionTypeId	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.154231
55	20120629150253	DenormalizeExpressions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	57	up	2016-06-14 16:53:27.215601
56	20120629151243	MakeExpressionsLessGeneric	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:27.227093
57	20120629182637	CreateIncomingLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:27.236901
58	20120702211427	CreateReplies	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.24343
59	20120703184734	AddReflectionToForumThreadLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:27.251853
60	20120703201312	AddIncomingLinkCountToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.261905
61	20120703203623	AddIncomingLinkCountToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.272362
62	20120703210004	AddBookmarkCountToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	17	up	2016-06-14 16:53:27.294266
63	20120704160659	AddAvgTimeToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.301008
64	20120704201743	AddViewCountToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:27.312138
65	20120705181724	AddUserToVersions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.317498
66	20120708210305	AddLastPostedAtToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.323797
67	20120712150500	CreateCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:27.334319
68	20120712151934	AddCategoryIdToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.338436
69	20120713201324	CreateCategoryFeaturedThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.344224
70	20120716020835	CreateSiteSettings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.350803
71	20120716173544	AddStatsToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.35505
72	20120718044955	CreateUserOpenIds	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.363952
73	20120719004636	AddEmailHashedPasswordNameSaltToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:27.374703
74	20120720013733	AddUsernameLowerToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:27.382204
75	20120720044246	AddAuthTokenToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.388064
76	20120720162422	AddForumIdToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.392461
77	20120723051512	AddNotNullsToUserOpenIds	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.397008
78	20120724234502	AddLastSeenAtToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.399995
79	20120724234711	AddWebsiteToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.403088
80	20120725183347	AddExcerptToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.406301
81	20120726201830	AddInvisibleToForumThread	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:27.417154
82	20120726235129	AddUserIdToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.422679
83	20120727005556	RemoveExcerptFromCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.425822
84	20120727150428	RenameInvisible	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.435174
85	20120727213543	AddThreadCountsToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.441026
86	20120802151210	AddIconToExpressionTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.444378
87	20120803191426	AddAdminFlagToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	18	up	2016-06-14 16:53:27.465749
88	20120806030641	AddNewPasswordNewSaltEmailTokenToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.472009
89	20120806062617	RemoveNewPasswordStuffFromUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.475599
90	20120807223020	CreateActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.484951
91	20120809020415	RemoveSiteId	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	11	up	2016-06-14 16:53:27.500161
92	20120809030647	RemoveForumId	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.505158
93	20120809053414	CorrectIndexingOnPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.51147
94	20120809154750	RemoveIndexForNow	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.518818
95	20120809174649	CreatePostActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:27.528534
96	20120809175110	CreatePostActionTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:27.534016
97	20120809201855	MigrateBookmarksToPostActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.538005
98	20120810064839	RenameActionsToUserActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.545144
99	20120812235417	RetireExpressions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.550042
100	20120813004347	RenameExpressionColumnsInForumThread	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.558493
101	20120813042912	RenameExpressionColumnsInPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:27.566439
102	20120813201426	CreateForumThreadLinkClicks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:27.579234
103	20120815004411	AddUniqueIndexToForumThreadLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.586916
104	20120815180106	AddPostTypeToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.596459
105	20120815204733	AddModeratorPostsCountToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.606964
106	20120816050526	AddUniqueConstraintToUserActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:27.614076
107	20120816205537	AddForumThreadStates	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	16	up	2016-06-14 16:53:27.633463
108	20120816205538	AddStarredAtToForumThreadUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.639989
109	20120820191804	AddSearchIndices	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.644058
110	20120821191616	AddBumpedAtToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:27.650968
111	20120823205956	AddSlugToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.655998
112	20120824171908	CreateCategoryFeaturedUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:27.663428
113	20120828204209	CreateOneboxRenders	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.672953
114	20120828204624	CreatePostOneboxRenders	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.679491
115	20120830182736	AddPreviewToOneboxRenders	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.683392
116	20120910171504	RemoveDescriptionFromSiteSettings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.686442
117	20120918152319	RenameViewsToReads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.690554
118	20120918205931	AddSubTagToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:27.695967
119	20120919152846	AddHasBestOfToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:27.707157
120	20120921055428	AddTwitterUserInfo	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:27.720231
121	20120921155050	CreateArchetypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:27.736426
122	20120921162512	AddMetaDataToForumThreads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.741906
123	20120921163606	CreateArchetypeOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.751644
124	20120924182000	AddHstoreExtension	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.755069
125	20120924182031	AddVoteCountToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	15	up	2016-06-14 16:53:27.77289
126	20120925171620	RemoveEnglishFromPostActionTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.77965
127	20120925190802	AddSequenceToPostActionTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:27.785939
128	20120928170023	AddSortOrderToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:27.79218
129	20121009161116	AddEmailStuffToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:27.8039
130	20121011155904	CreateEmailLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:27.817488
131	20121017162924	ConvertArchetypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:27.830484
132	20121018103721	RenameForumThreadTables	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	34	up	2016-06-14 16:53:27.870267
133	20121018133039	CreateTopicAllowedUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:27.880624
134	20121018182709	FixNotificationData	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.884112
135	20121106015500	DropAvatarUrlFromUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:27.887368
136	20121108193516	AddPostActionIdToNotifications	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:27.892764
137	20121109164630	CreateTrustLevels	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	11	up	2016-06-14 16:53:27.907217
138	20121113200844	BioMarkdownSupport	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:27.916095
139	20121113200845	CreateFacebookUserInfos	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:27.927418
140	20121115172544	RenameStickyToPinned	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:27.93297
141	20121116212424	AddMoreEmailSettingsToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	13	up	2016-06-14 16:53:27.94975
142	20121119190529	AddEmailSettingsToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	14	up	2016-06-14 16:53:27.96991
143	20121119200843	AddEmailDirectToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:27.984359
144	20121121202035	CreateInvites	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:27.996562
145	20121121205215	CreateTopicInvites	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:28.006491
146	20121122033316	AddMutedAtToTopicUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.011157
147	20121123054127	MakePostNumberDistinct	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.014885
148	20121123063630	CreateUserVisits	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:28.022779
149	20121129160035	CreateEmailTokens	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.033466
150	20121129184948	RemoveEmailTokenFromUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.037654
151	20121130010400	CreateDrafts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:28.047013
152	20121130191818	AddLinkPostIdToTopicLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.050557
153	20121202225421	AddVisitedAtToTopicUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.054216
154	20121203181719	RenameSeenNotificaitonId	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.059175
155	20121204183855	FixLinkPostId	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	15	up	2016-06-14 16:53:28.077609
156	20121204193747	AddAnotherFeaturedUserToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.080587
157	20121205162143	AddApprovedToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:28.091251
158	20121207000741	AddNotificationsToTopicUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:28.09972
159	20121211233131	CreateSiteCustomizations	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:28.109329
160	20121216230719	AddOverrideDefaultStyleToSiteCustomization	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:28.122214
161	20121218205642	AddTopicsEnteredToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	15	up	2016-06-14 16:53:28.142611
162	20121224072204	AddLastEditorIdToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.148272
163	20121224095139	CreateDraftSequence	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:28.157109
164	20121224100650	AddSequenceToDrafts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:28.164746
165	20121228192219	AddDeletedAtToInvites	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.169262
166	20130107165207	AddDigestAfterDaysToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:28.180817
167	20130108195847	AddPreviousVisitAtToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.185604
168	20130115012140	MergeMuteOptionsOnTopicUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.190251
169	20130115021937	CorrectDefaultOnNotificationLevel	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.195396
170	20130115043603	OopsUnwatchABoatOfWatchedStuff	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.198565
171	20130116151829	RemoveSubTagFromTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.201605
172	20130120222728	FixSearch	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.213212
173	20130121231352	AddTrackingToTopicUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.217413
174	20130122051134	AddAutoTrackTopicsToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.228179
175	20130122232825	AddAutoTrackAfterSecondsAndBanningAndDobToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:28.24523
176	20130123070909	AutoTrackAllTopicsRepliedTo	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.251382
177	20130125002652	AddHiddenToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.261703
178	20130125030305	AddFieldsToPostAction	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.267704
179	20130125031122	CorrectIndexOnPostAction	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:28.275533
180	20130127213646	RemoveTrustLevels	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	13	up	2016-06-14 16:53:28.292359
181	20130128182013	TrustLevelDefaultNull	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.298724
182	20130129010625	RemovePmReflections	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.302034
183	20130129163244	AddTimeReadToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:28.313991
184	20130129174845	AddDaysVisitedToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:28.328062
185	20130130154611	RemoveIndexFromViews	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:28.33611
186	20130131055710	AddCustomFlagCountToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:28.352661
187	20130201000828	AddColumnSummariesToPostsAndTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	36	up	2016-06-14 16:53:28.394297
188	20130201023409	AddPositionToPostActionType	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:28.404038
189	20130203204338	AddLastVersionAtToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.409215
190	20130204000159	AddIpAddressToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.412001
191	20130205021905	AlterFacebookUserId	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.422275
192	20130207200019	AddUserDeletedToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.433472
193	20130208220635	RemoveReplyBelowPostNumberFromPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.438309
194	20130213021450	RemoveTopicResponseActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.441203
195	20130213203300	AddNewTopicDurationMinutesToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.444046
196	20130221215017	AddDescriptionToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.449872
197	20130226015336	AddGithubUserInfo	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:28.461564
198	20130306180148	AddClearedPinnedToTopicUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.466087
199	20130311181327	RemoveExtraSpamRecord	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.469302
200	20130313004922	AddExternalLinksInNewTabAnDisableQuotingToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	16	up	2016-06-14 16:53:28.488821
201	20130314093434	AddForegroundColorToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:28.500531
202	20130315180637	EnableTrigramSupport	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.504732
203	20130319122248	AddReplyToUserIdToPost	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.508497
204	20130320012100	AddUserIndexesToPostsAndTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.513618
205	20130320024345	AddModeratorToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:28.525927
206	20130321154905	RemoveOneboxesFromDb	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.531781
207	20130322183614	AddPercentRankToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:28.545312
208	20130326210101	AddHotnessToCategory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:28.555677
209	20130327185852	UpdateSiteSettingsForHot	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.560267
210	20130328162943	CreateHotTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.569973
211	20130328182433	AddScoreToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.580224
212	20130402210723	AddValuesToHotTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:28.585796
213	20130404143437	CreateSiteContents	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:28.593226
214	20130404232558	AddUserExtras	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	27	up	2016-06-14 16:53:28.624038
215	20130411205132	CreateAdminLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:28.633459
216	20130412015502	CorrectCountsOnPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:28.645378
217	20130412020156	CorrectCountsOnTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:28.657514
218	20130416004607	CreateGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:28.665262
219	20130416004933	GroupUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:28.673569
220	20130416170855	AddSubtypeToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.677423
221	20130419195746	IncreaseDataLengthOnNotifications	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:28.685431
222	20130422050626	AddRelatedPostIdToPostActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.690173
223	20130424015746	AddSlugToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.693113
224	20130424055025	AddUserIdToIncomingLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.696007
225	20130426044914	AllowNullsInIncomingLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.699718
226	20130426052257	AddIncomingIpCurrentUserIdToIncomingLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.702895
227	20130428194335	AddUnstarredAtToTopicUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.706405
228	20130429000101	AddSecurityToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:28.718116
229	20130430052751	AddTopicAllowedGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.729669
230	20130501105651	FixTopicAllowedGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.733099
231	20130506020935	AddAutomaticToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:28.740679
232	20130506185042	AddAutoCloseAtToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.745408
233	20130508040235	AddUserCountToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:28.752841
234	20130509040248	UpdateSequenceForGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.757433
235	20130509041351	AddUniqueNameToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.762599
236	20130515193551	AddAutoCloseDaysToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.765727
237	20130521210140	CreateCasUserInfos	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:28.778196
238	20130522193615	RenameSearchTables	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	11	up	2016-06-14 16:53:28.793155
239	20130527152648	AddLikeScoreToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:28.804944
240	20130528174147	AddRankToCategoryFeaturedTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:28.815658
241	20130531210816	AddStaffTookActionToPostActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:28.825969
242	20130603192412	AddBlockedToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.837964
243	20130606190601	AddAutoCloseStartedAtToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.842888
244	20130610201033	AddReplyKeyToEmailLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.848218
245	20130612200846	CreatePostUploadJoinTable	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.859085
246	20130613211700	DropPostsUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.86261
247	20130613212230	CreatePostUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:28.87001
248	20130615064344	AddDynamicFaviconPreferenceToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:28.883345
249	20130615073305	RemoveTopicIdFromUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.888546
250	20130615075557	AddShaToUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.894661
251	20130616082327	CreateOptimizedImages	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.905514
252	20130617014127	RenameShaAndExtColumns	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:28.921445
253	20130617180009	RenameShaColumn	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:28.934933
254	20130617181804	AddPostIdToEmailLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.939935
255	20130619063902	AddDeferToPostActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.943025
256	20130621042855	ChangeSupressToSuppress	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.953921
257	20130622110348	AddUrlIndexToUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.959198
258	20130624203206	ChangeIpToInetInTopicLinkClicks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.964912
259	20130625022454	ChangeIpToInetInViews	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.97076
260	20130625170842	RemoveAccessPassword	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.974033
261	20130625201113	AddTitleToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:28.977289
262	20130709184941	AddDeletedByIdToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:28.982869
263	20130710201248	AddNukedUserToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:28.992791
264	20130712041133	AddPermissionTypeToCategoryGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:29.001785
265	20130712163509	AddMissingIdColumns	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:29.014926
266	20130723212758	RenameAdminLog	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:29.022242
267	20130724201552	CreateBlockedEmails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.03349
268	20130725213613	AddMoreToStaffActionLog	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.037798
269	20130728172550	AddUrlToOptimizedImages	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:29.044029
270	20130731163035	AddReportIndexToIncomingLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:29.0528
271	20130807202516	AddLastMatchIndexToBlockedEmails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.058243
272	20130809160751	FixSeenNotificationIds	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.062137
273	20130809204732	AddFilterIndexesToStaffActionLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:29.072276
274	20130809211409	AddAvatarToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	11	up	2016-06-14 16:53:29.087324
275	20130813204212	CreateScreenedUrls	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:29.10125
276	20130813224817	RenameBlockedEmailsToScreenedEmails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.107334
277	20130816024250	CreateOauth2UserInfos	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:29.115586
278	20130819192358	AddValueColumnsToStaffActionLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.120139
279	20130820174431	AddSubjectIndexToStaffActionLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.126134
280	20130822213513	AddIpAddressToScreeningTables	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.129951
281	20130823201420	DropDefaultsOnEmailDigestColumnsOfUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:29.137278
282	20130826011521	CreatePluginStoreRows	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.146371
283	20130828192526	FixOptimizedImagesUrls	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.150246
284	20130903154323	AllowNullUserIdOnPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.155867
285	20130904181208	AllowNullUserIdOnTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.16225
286	20130906081326	RenameSystemUsername	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.16624
287	20130906171631	AddIndexToUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.171601
288	20130910040235	IndexTopicsForFrontPage	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:29.181342
289	20130910220317	RenameStaffActionLogsToUserHistory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.19247
290	20130911182437	CreateUserStats	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.199402
291	20130912185218	ActingUserNull	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.203358
292	20130913210454	AddMobileToSiteCustomizations	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.206901
293	20130917174738	AddTopicIdToUserHistories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.210284
294	20131001060630	AddEmailAlwaysToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.221687
295	20131002070347	AddUserIdParentTypeIndexOnViews	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.228655
296	20131003061137	MoveColumnsToUserStats	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	22	up	2016-06-14 16:53:29.25387
297	20131014203951	BackfillPostUploadReverseIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.266017
298	20131015131652	CreatePostDetails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.277008
299	20131017014509	AddPostCountToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.288432
300	20131017030605	AddLatestToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.294633
301	20131017205954	CreateScreenedIpAddresses	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.306556
302	20131018050738	AddPositionToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.310644
303	20131022045114	AddUncategorizedCategory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.315469
304	20131022151218	CreateApiKeys	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:29.326439
305	20131023163509	AddParentCategoryIdToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.329909
306	20131105101051	AddOriginToUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.332892
307	20131107154900	RenameBannedToSuspended	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:29.339957
308	20131114185225	AddParticipantCountToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:29.352057
309	20131115165105	AddEditReasonToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.356901
310	20131118173159	RenameBestOfToSummary	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.361439
311	20131120055018	MoveEmojiToNewLocation	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.364455
312	20131122064921	IncreaseTwitterUserIdLength	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.373783
313	20131206200009	RenameAutoCloseDaysToHours	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.37956
314	20131209091702	CreatePostRevisions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.390846
315	20131209091742	CreateTopicRevisions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.402246
316	20131210163702	AddWordCountToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.406315
317	20131210181901	MigrateWordCounts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.409709
318	20131210234530	RenameVersionColumn	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.421202
319	20131212225511	AddPostCountStatsColumnsToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.426113
320	20131216164557	MakePositionNullableInCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.429179
321	20131217174004	CreateTopicEmbeds	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.438232
322	20131219203905	AddCookMethodToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.449866
323	20131223171005	CreateTopTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	36	up	2016-06-14 16:53:29.491405
324	20131227164338	AddScoresToTopTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.495767
325	20131229221725	AddWatchNewTopicsToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:29.508185
326	20131230010239	AddLastEmailedPostNumberToTopicUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.513054
327	20140101235747	AddCategoryUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.517977
328	20140102104229	AddAliasLevelToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:29.526755
329	20140102194802	RemoveDefaultFromExternalLinksInNewTab	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.532986
330	20140107220141	RemoveEnableWideCategoryList	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.535891
331	20140109205940	RenameFavoritesToStarred	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.539095
332	20140116170655	DropHotTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.549724
333	20140120155706	AddLoungeCategory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	70	up	2016-06-14 16:53:29.624237
334	20140121204628	AddInvalidatedAtToInvites	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.627375
335	20140122043508	AddMetaCategory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.631479
336	20140124202427	AddPostsReadToUserVisits	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.640231
337	20140129164541	RemoveCategoryHotness	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.644662
338	20140206044818	AddLocaleToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.648441
339	20140206195001	AddDefaultsToCategoryPostsAndTopicsFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.657805
340	20140206215029	AddMailingListModeToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.662557
341	20140210194146	AddPrimaryGroupIdToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.665676
342	20140211230222	MoveCasSettings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:29.672537
343	20140211234523	AddTargetsTopicToPostActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:29.684529
344	20140214151255	AddSkippedToEmailLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:29.698943
345	20140220160510	RenameSiteSettings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.703571
346	20140220163213	RenameDeleteUserMaxAge	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.706379
347	20140224232712	AddProfileBackgroundToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.70937
348	20140224232913	AddSingleSignOnRecords	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.718602
349	20140227104930	AddCustomEmailInToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:29.731356
350	20140227201005	AddStaffCategory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.737298
351	20140228005443	AddExternalUsernameToSingleSignOnRecord	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.740571
352	20140228173431	AddExternalEmailAndExternalNameToSingleSignOnRecord	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.743663
353	20140228205743	AddAdminOnlyToUserHistories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:29.759655
354	20140303185354	AddNewSinceToUserStats	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.765357
355	20140304200606	CreateBadgeTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:29.775232
356	20140304201403	CreateBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:29.788329
357	20140305100909	CreateUserBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.798585
358	20140306223522	MoveTopicRevisionsToPostRevisions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:29.803935
359	20140318150412	AddExcerptToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.809043
360	20140318203559	AddCreatedAtIndexToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	19	up	2016-06-14 16:53:29.831601
361	20140320042653	FacebookUserInfosUsernameCanBeNil	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.837015
362	20140402201432	MakeContentSha1Nullable	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.840309
363	20140404143501	AddTitleToTopicLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.843394
364	20140407055830	AddPinnedGloballyToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:29.855049
365	20140407202158	SiteSettingCommaToPipe	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.860155
366	20140408061512	AddWikiToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:29.87055
367	20140408152401	AddDefaultValueToTopTopicScores	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:29.878859
368	20140415054717	AllowLongerUsernames	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:29.883008
369	20140416202746	CreateColorSchemes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:29.889597
370	20140416202801	CreateColorSchemeColors	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:29.900092
371	20140416235757	RemoveColorHexcodeFromBadgeTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.903614
372	20140421235646	AddUserCustomFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:29.914356
373	20140422195623	AddVisibileToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.924183
374	20140425125742	AddCustomFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	17	up	2016-06-14 16:53:29.946503
375	20140425135354	AddTopicCustomFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.956611
376	20140425172618	AddTitleableToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.966462
377	20140429175951	AddRegistrationIpAddressToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.971361
378	20140504174212	IncrementReservedTrustLevelBadgeIds	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:29.980383
379	20140505145918	AddLastRedirectedToTopAtToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.983343
380	20140506200235	RemoveSeedColorScheme	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.986745
381	20140507173327	RemoveOpacityFromColorSchemeColors	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.989648
382	20140508053815	AddInvitedGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:29.995581
383	20140515220111	InitFixedCategoryPositionsValue	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:29.999701
384	20140520062826	AddMultipleAwardToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:30.012124
385	20140520063859	RemoveHasCustomAvatarFromUserStats	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.016872
386	20140521192142	CreateGoogleUserInfos	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:30.028995
387	20140521220115	GoogleOpenidDefaultHasChanged	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.032977
388	20140522003151	AddUserAvatars	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:30.041424
389	20140525233953	RemoveUploadedAvatarTemplateFromUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.044974
390	20140526185749	ChangeCategoryUniqunessContstraint	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.051428
391	20140526201939	AddDisableJumpReplyToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:30.065028
392	20140527163207	CreateUserProfiles	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.072884
393	20140527233225	AddSystemSavatarVersionToUserAvatars	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.080029
394	20140528015354	AddBakedAtToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.084562
395	20140529045508	RemoveUseUploadedAvatarFromUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.08778
396	20140530002535	RemoveSystemAvatarsFromUserAvatars	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:30.101647
397	20140530043913	AddBakedVersionToPost	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.104811
398	20140604145431	DisableExternalAuthsByDefault	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.10777
399	20140607035234	AddWebsiteToUserProfiles	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.111469
400	20140610012414	AddPostIdToUserBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.114474
401	20140610012833	AddIconToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:30.123564
402	20140610034314	MoveBioToUserProfiles	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:30.129542
403	20140612010718	MoveProfileBackgroundToUserProfiles	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.133253
404	20140617053829	AddNotificationIdToUserBadge	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.136714
405	20140617080955	RenameRegisteredUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.140034
406	20140617193351	AddPostIdIndexOnTopicLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.145314
407	20140618001820	DontAutoMutoTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.148572
408	20140618163511	AddDismissedBannerKeyToUserProfile	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.151704
409	20140620184031	AddHiddenAtToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.154894
410	20140623195618	FixCategoriesConstraint	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.160289
411	20140624044600	AddRawDataToSearch	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:30.165745
412	20140627193814	AddImagesToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.169419
413	20140703022838	AddFieldsToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:30.185071
414	20140705081453	IndexUserBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.192724
415	20140707071913	AddSelfEditsToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:30.204341
416	20140710005023	AddBadgePostsAndTopicsView	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:30.219393
417	20140710224658	AddIsQuoteToTopicLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:30.232665
418	20140711063215	AddReadFaqToUserStats	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.237226
419	20140711143146	RemoveNotNullFromEmail	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.239995
420	20140711193923	RemoveEmailInAddressSetting	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.243071
421	20140711233329	BadgesOnlyOnPublicCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.24943
422	20140714060646	AddEnabledToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:30.259497
423	20140715013018	CorrectPostNumberIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:30.268159
424	20140715051412	AddAutoRevokeToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:30.280001
425	20140715055242	AddQuotedPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:30.292878
426	20140715160720	UpdateUsersCaseInsensitiveEmails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.298904
427	20140715190552	RemoveUncategorizedParents	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.303531
428	20140716063802	AddBadgeGroupings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:30.31076
429	20140717024528	DescriptionOptionalInBadgeGrouping	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.314396
430	20140718041445	SetDefaultBadgeGrouping	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.319764
431	20140721063820	AddTriggerToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.322733
432	20140721161249	AddAgreedAtAndAgreedByIdToPostAction	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.326243
433	20140721162307	RenameDeferColumnsOnPostAction	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.331528
434	20140723011456	AddShowPostsToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:30.341484
435	20140725050636	RemoveInvalidIncomingLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.346407
436	20140725172830	RemoveMessageFromPostAction	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.35027
437	20140727030954	AddEditHistoryPublicToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:30.362164
438	20140728120708	FixIndexOnPostAction	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.370628
439	20140728144308	AddFirstPostCreatedAtToUserStat	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.375573
440	20140728152804	AddPostAndTopicCountsToUserStat	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:30.385259
441	20140729092525	RemoveUniqueConstraintFromInvitesIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.392619
442	20140730203029	AddDisagreedAtAndDisagreedByIdToPostAction	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.397768
443	20140731011328	AddReplyQuotedToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:30.41073
444	20140801052028	FixIncomingLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:30.420034
445	20140801170444	CreatePostTimingsUserIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.426376
446	20140804010803	IncomingLinkNormalization	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	15	up	2016-06-14 16:53:30.445403
447	20140804030041	RemoveUrlFromIncomingReferer	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.449627
448	20140804060439	DropTopicIdFromIncomingLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.4527
449	20140804072504	ViewsToTopicViews	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:30.463795
450	20140804075613	NormalizeTopicViewDataAndIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	14	up	2016-06-14 16:53:30.482395
451	20140805061612	AddBioCookedVersionToUserProfile	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.489955
452	20140806003116	FixupBadgeIds	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:30.500082
453	20140807033123	AddIndexOnLastSeenToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.507073
454	20140808051823	CreateTopicSearchIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.51367
455	20140809224243	AddUserBadgeUniqueIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:30.536273
456	20140811094300	RenameDeferedColumnsOnPostAction	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.543252
457	20140813175357	AddDefaultToActive	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:30.550701
458	20140815183851	FixIndexOnPostActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:30.560363
459	20140815191556	FixPostActionsIndexAgain	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.568292
460	20140815215618	AddNameLowerToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:30.574026
461	20140817011612	AddExternalAvatarUrlToSingleSignOnRecord	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.577231
462	20140818023700	IndexEmailTokens	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.582275
463	20140826234625	RenameSettingsPop3sToPop3	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.585504
464	20140827044811	RemoveNullableDates	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	72	up	2016-06-14 16:53:30.662005
465	20140828172407	CreatePermalinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:30.674654
466	20140828200231	MakeUrlColBiggerInPermalinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:30.685174
467	20140831191346	RemoveCategoryGroupsOrphanedByRemovingCategoryOrGroup	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.689952
468	20140904055702	CorrectPostActionIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.696356
469	20140904160015	AddViaEmailToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:30.710784
470	20140904215629	RenameTrustLevelSettings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.716475
471	20140905055251	RenameTrustLevelBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.719965
472	20140905171733	CreateWarnings	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:30.73005
473	20140908165716	MigrateWarningTopicSubtypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.733978
474	20140908191429	TrimProfileLength	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.737119
475	20140910130155	CreateTopicUserIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.74255
476	20140911065449	PrivateMessagesHaveNoCategoryId	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.746709
477	20140913192733	AddTrustLevelLockedColumn	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	11	up	2016-06-14 16:53:30.761446
478	20140923042349	AddRetainHoursToUploads	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.766535
479	20140924192418	RenameContentType	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:30.774674
480	20140925173220	CreateUserFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:30.781735
481	20140929181930	AddEditableToUserFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:30.790257
482	20140929204155	MigrateTosSetting	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.795149
483	20141001101041	AddPostIdToUserHistories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.798163
484	20141002181613	AddDescriptionToUserFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.801805
485	20141007224814	AddBadgeGrantedTitleToUserProfile	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:30.811653
486	20141008152953	AddExernalUrlToPermalinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.816319
487	20141008181228	AddRequiredSignupToUserFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:30.824266
488	20141008192525	AddAutoCloseBasedOnLastPostAndAutoCloseHoursToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:30.838194
489	20141008192526	AddAutoCloseBasedOnLastPostToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:30.850115
490	20141014032859	AddHiddenToPostRevision	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:30.860951
491	20141014191645	FixTosName	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.865945
492	20141015060145	AddRawEmailToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.86962
493	20141016183307	AddExpansionBackgroundToUserProfiles	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.873528
494	20141020153415	AddPublicVersionToPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:30.887469
495	20141020154935	RenameExpansionToCard	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:30.893372
496	20141020164816	AddImageToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.896661
497	20141020174120	AddCardImageToUserProfiles	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:30.900664
498	20141030222425	RenameSeenPostCount	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:30.905074
499	20141110150304	AddFooterToSiteCustomization	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.908624
500	20141118011735	CorrectUsernameSearch	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.911729
501	20141120035016	AddAllowedIpsToApiKeys	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:30.916352
502	20141120043401	AddHiddenToApiKeys	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	11	up	2016-06-14 16:53:30.931125
503	20141211114517	FixEmojiPath	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.935936
504	20141216112341	ResolveDuplicateGroupNames	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:30.951239
505	20141222051622	RemoveOverrideDefaultStylesFromSiteCustomizations	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.955198
506	20141222224220	FixEmojiPathTake2	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.958534
507	20141222230707	AmendSiteCustomization	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:30.962117
508	20141223145058	CreateCsvExportLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:30.969474
509	20141228151019	RenameCsvExportLogsToUserExports	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.976041
510	20150102113309	CleanUpUserHistory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.981261
511	20150106215342	RemoveStars	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:30.987102
512	20150108002354	AddLikedAndBookmarkedToTopicUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:31.00273
513	20150108202057	CreateBookmarkActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.008499
514	20150108211557	IndexTopicCustomFieldValues	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.014029
515	20150108221703	GroupManagers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:31.022288
516	20150112172258	AddNewSiteCustomizationTypes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.026598
517	20150112172259	MigrateSiteTextToSiteCustomization	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.030519
518	20150114093325	AddTopToSiteCustomization	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.035588
519	20150115172310	RenameUserExportColumn	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.040079
520	20150119192813	AddPostsIndexIncludingDeleted	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:31.047085
521	20150123145128	AddAutomaticMembershipToGroup	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:31.056754
522	20150129204520	AddShowOnProfileToUserFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:31.065661
523	20150203041207	AddApplicationRequests	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:31.076216
524	20150205032808	ResetApplicationRequests	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.08207
525	20150205172051	AddCustomTypeToUserHistories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.087467
526	20150206004143	FlushApplicationRequests	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.093321
527	20150213174159	CreateDigestUnsubscribeKeys	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:31.104151
528	20150224004420	AddPinnedIndexes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.113768
529	20150227043622	AddLongDescriptionToBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.117954
530	20150301224250	CreateSuggestedForIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.123753
531	20150306050437	AddAllTimeAndOpLikesToTopTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	67	up	2016-06-14 16:53:31.194756
532	20150318143915	CreateDirectoryItems	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.232259
533	20150323034933	AddAllowPrivateMessagesToUserProfile	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.24218
534	20150323062322	RemoveAllowPrivateMessagesFromUserProfile	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.248263
535	20150323234856	AddMutedUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:31.260641
536	20150324184222	AddMoreToDirectoryItems	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:31.274456
537	20150325183400	FixGroupUserCount	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.280848
538	20150325190959	CreateQueuedPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:31.294651
539	20150410002033	AddPrimaryGroupToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.304307
540	20150410002551	AddTitleToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.309702
541	20150421085850	IncreaseUrlLengthOnTopicEmbed	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:31.321291
542	20150421190714	AddQueuedPostIdToUserActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.326414
543	20150422160235	AddLinkPostIdIndexOnTopicLinks	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.33213
544	20150501152228	RenameTotalVotesToVoters	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:31.341199
545	20150505044154	AddStylesheetCache	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.351137
546	20150513094042	AddIndexOnPostActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:31.358239
547	20150514023016	AddUnreadNotificationsIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.363906
548	20150514043155	AddUserActionsAllIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.369515
549	20150525151759	SetDefaultS3Region	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.37296
550	20150609163211	MigrateEmbeddableHost	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.377285
551	20150617080349	AddIndexOnPostNotifications	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.38287
552	20150617233018	AddIndexTargetPostIdOnUserActions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.388342
553	20150617234511	AddStaffIndexToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.397578
554	20150702201926	AddTopicTemplateToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.402741
555	20150706215111	AddMobileToUserVisits	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:31.410315
556	20150707163251	AddReportsIndexToUserVisits	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:31.418927
557	20150709021818	AddLikeCountToPostMenu	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.422968
558	20150713203955	EnlargeUsersEmailField	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.429565
559	20150724165259	AddIndexToPostCustomFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.436274
560	20150724182342	AddActionCodeToPost	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.440845
561	20150727193414	CreateUserFieldOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:31.449178
562	20150727210019	AddPinnedUntilToTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.453239
563	20150727210748	AddQuarterlyToTopTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	83	up	2016-06-14 16:53:31.54001
564	20150727230537	AddExampleColumnComments	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.549749
565	20150728004647	CorrectCustomFieldsMigration	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	14	up	2016-06-14 16:53:31.567962
566	20150728210202	MigrateOldModeratorPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.577694
567	20150729150523	MigrateAutoClosePosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.583331
568	20150730154830	AddPositionToUserFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:31.591259
569	20150731225331	MigrateOldMovedPosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.596252
570	20150802233112	AddPostStats	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	10	up	2016-06-14 16:53:31.610437
571	20150806210727	AddEmbeddedCssToSiteCustomizations	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.616661
572	20150818190757	CreateEmbeddableHosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:31.627643
573	20150822141540	FixMigratedHosts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.630947
574	20150828155137	AddSuppressFromHomepageToCategory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:31.643368
575	20150901192313	AddGrantTrustLevelToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.658184
576	20150914021445	CreateUserProfileViews	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	13	up	2016-06-14 16:53:31.674355
577	20150914034541	AddViewsToUserProfile	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.684241
578	20150917071017	AddCategoryIdToUserHistories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.692118
579	20150918004206	AddUserIdGroupIdIndexToGroupUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.697318
580	20150924022040	AddFancyTitleToTopic	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.700962
581	20150925000915	ExcludeWhispersFromBadges	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:31.708227
582	20151016163051	MergePollsVotes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	15	up	2016-06-14 16:53:31.726512
583	20151103233815	AddLowerTitleIndexOnTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.730923
584	20151105181635	AddStagedToUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	13	up	2016-06-14 16:53:31.746875
585	20151107041044	FixIncorrectTopicCreatorAfterMove	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.753599
586	20151107042241	AddOwnerToGroupUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:31.760579
587	20151109124147	DropGroupManagers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.766339
588	20151113205046	CreateTranslationOverrides	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.778216
589	20151117165756	AddAutomaticallyUnpinTopicsToUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	11	up	2016-06-14 16:53:31.792781
590	20151124172631	AddIsSupportToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:31.80457
591	20151124192339	RenameNinjaEdit	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.809469
592	20151125194322	RemoveSiteText	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.812907
593	20151126173356	RenameIsSupportToContainsMessages	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.818606
594	20151126233623	AddBakedHeadAndBodyToSiteCustomizations	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.821921
595	20151127011837	AddHeaderAndFooterBakedToSiteCustomizations	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.825564
596	20151201035631	AddGroupMentions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:31.835459
597	20151201161726	AddIncomingEmailToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.841325
598	20151214165852	AddNotificationLevelToGroupUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:31.848513
599	20151218232200	AddUniqueIndexToCategoryUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:31.85799
600	20151219045559	AddHasMessagesToGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:31.868703
601	20151220232725	AddUserArchivedMessagesGroupArchivedMessages	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:31.883341
602	20160108051129	FixIncorrectUserHistory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.887336
603	20160110053003	ArchiveSystemMessagesWithNoReplies	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.891047
604	20160112025852	RemoveUsersFromTopicAllowedUsers	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.894299
605	20160112101818	RemoveContainsMessageOnCategory	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.897479
606	20160112104733	AddContainsMessagesBackToCategories	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.900919
607	20160113160742	CreateIncomingEmails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	12	up	2016-06-14 16:53:31.916056
608	20160118174335	RebakeHtmlCustomizations	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.919963
609	20160118233631	BackfillIncomingEmails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.925198
610	20160127105314	ChangeDefaultNotificationLevelOnGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.930167
611	20160127222802	MigrateUncategorizedDescriptionSetting	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.933366
612	20160201181320	FixEmailLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.937052
613	20160206210202	RemoveInvalidWebsites	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:31.94007
614	20160215075528	AddUnreadPmIndexToNotifications	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	2	up	2016-06-14 16:53:31.945075
615	20160224033122	CreateInstagramUserInfos	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:31.951606
616	20160225050317	AddUserOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:31.960554
617	20160225050318	AllowDefaultsOnUsersTable	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:31.971058
618	20160225050319	MoveTrackingOptionsToUserOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:31.975715
619	20160225050320	AddEmailPreviousRepliesToUserOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:31.982199
620	20160225095306	AddEmailInReplyToToUserOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:31.992256
621	20160302063432	RebuildDirectoryItemWithIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:32.002592
622	20160302104253	AddLikeNotificationFrequencyToUserOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:32.01054
623	20160302170230	RenameDigestAfterDaysToDigestAfterMinutes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:32.016571
624	20160303183607	ClearCommonPasswordsCache	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.019723
625	20160303234317	AddRejectionMessageToIncomingEmail	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.022939
626	20160307190919	CreateEmailChangeRequests	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:32.034036
627	20160308193142	RenameConfirmTranslationKey	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.037828
628	20160309073132	AddMailingListModeFrequency	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:32.044471
629	20160317174357	CreateGivenDailyLikes	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	6	up	2016-06-14 16:53:32.055762
630	20160317201955	AddIncludeTl0InDigestsToUserOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:32.06241
631	20160321164925	ClosePollsInClosedTopics	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	11	up	2016-06-14 16:53:32.078164
632	20160326001747	AddUserFirstVisit	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.081195
633	20160329101122	RemoveWikiColor	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.083988
634	20160405172827	CreateUserFirsts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:32.092737
635	20160407160756	RemoveUserFirsts	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	1	up	2016-06-14 16:53:32.096981
636	20160407180149	CreateOnceoffLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:32.110491
637	20160408131959	AddShowOnUserCardToUserFields	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:32.119312
638	20160408175727	AddCompiledJsToTranslationOverrides	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.124433
639	20160418065403	AddBounceKeyToEmailLog	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.12761
640	20160420172330	AddIsAutoGeneratedToIncomingEmails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	9	up	2016-06-14 16:53:32.139894
641	20160425141954	FixIncomingEmailsIndices	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:32.147421
642	20160427202222	AddSupportForBouncedEmails	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	18	up	2016-06-14 16:53:32.169935
643	20160503205953	CreateTags	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	19	up	2016-06-14 16:53:32.194663
644	20160514100852	RemoveInvalidTopicUser	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.198416
645	20160520022627	ShortenTopicCustomFieldsIndex	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:32.205102
646	20160527015355	CorrectMailingListModeFrequency	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.209369
647	20160527191614	CreateCategoryTags	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	7	up	2016-06-14 16:53:32.219463
648	20160530003739	CreateSchedulerStats	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	4	up	2016-06-14 16:53:32.226684
649	20160530203810	AddMessageIdToEmailLogs	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	3	up	2016-06-14 16:53:32.232798
650	20160602164008	CreateTagGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	8	up	2016-06-14 16:53:32.244384
651	20160606204319	CreateCategoryTagGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:32.253423
652	20160607213656	AddTagGroupOptions	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	5	up	2016-06-14 16:53:32.262196
653	20160609203508	RemoveTagCountFromTagGroups	e4fddce36405\n	3d3ce56f52b99eb2a8662d766390a577cb2fc7bb	4.2.6	0	up	2016-06-14 16:53:32.267129
\.


--
-- Name: schema_migration_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('schema_migration_details_id_seq', 653, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY schema_migrations (version) FROM stdin;
20000225050318
20120311163914
20120311164326
20120311170118
20120311201341
20120311210245
20120416201606
20120420183447
20120423140906
20120423142820
20120423151548
20120425145456
20120427150624
20120427151452
20120427154330
20120427172031
20120502183240
20120502192121
20120503205521
20120507144132
20120507144222
20120514144549
20120514173920
20120514204934
20120517200130
20120518200115
20120519182212
20120523180723
20120523184307
20120523201329
20120525194845
20120529175956
20120529202707
20120530150726
20120530160745
20120530200724
20120530212912
20120614190726
20120614202024
20120615180517
20120618152946
20120618212349
20120618214856
20120619150807
20120619153349
20120619172714
20120621155351
20120621190310
20120622200242
20120625145714
20120625162318
20120625174544
20120625195326
20120629143908
20120629150253
20120629151243
20120629182637
20120702211427
20120703184734
20120703201312
20120703203623
20120703210004
20120704160659
20120704201743
20120705181724
20120708210305
20120712150500
20120712151934
20120713201324
20120716020835
20120716173544
20120718044955
20120719004636
20120720013733
20120720044246
20120720162422
20120723051512
20120724234502
20120724234711
20120725183347
20120726201830
20120726235129
20120727005556
20120727150428
20120727213543
20120802151210
20120803191426
20120806030641
20120806062617
20120807223020
20120809020415
20120809030647
20120809053414
20120809154750
20120809174649
20120809175110
20120809201855
20120810064839
20120812235417
20120813004347
20120813042912
20120813201426
20120815004411
20120815180106
20120815204733
20120816050526
20120816205537
20120816205538
20120820191804
20120821191616
20120823205956
20120824171908
20120828204209
20120828204624
20120830182736
20120910171504
20120918152319
20120918205931
20120919152846
20120921055428
20120921155050
20120921162512
20120921163606
20120924182000
20120924182031
20120925171620
20120925190802
20120928170023
20121009161116
20121011155904
20121017162924
20121018103721
20121018133039
20121018182709
20121106015500
20121108193516
20121109164630
20121113200844
20121113200845
20121115172544
20121116212424
20121119190529
20121119200843
20121121202035
20121121205215
20121122033316
20121123054127
20121123063630
20121129160035
20121129184948
20121130010400
20121130191818
20121202225421
20121203181719
20121204183855
20121204193747
20121205162143
20121207000741
20121211233131
20121216230719
20121218205642
20121224072204
20121224095139
20121224100650
20121228192219
20130107165207
20130108195847
20130115012140
20130115021937
20130115043603
20130116151829
20130120222728
20130121231352
20130122051134
20130122232825
20130123070909
20130125002652
20130125030305
20130125031122
20130127213646
20130128182013
20130129010625
20130129163244
20130129174845
20130130154611
20130131055710
20130201000828
20130201023409
20130203204338
20130204000159
20130205021905
20130207200019
20130208220635
20130213021450
20130213203300
20130221215017
20130226015336
20130306180148
20130311181327
20130313004922
20130314093434
20130315180637
20130319122248
20130320012100
20130320024345
20130321154905
20130322183614
20130326210101
20130327185852
20130328162943
20130328182433
20130402210723
20130404143437
20130404232558
20130411205132
20130412015502
20130412020156
20130416004607
20130416004933
20130416170855
20130419195746
20130422050626
20130424015746
20130424055025
20130426044914
20130426052257
20130428194335
20130429000101
20130430052751
20130501105651
20130506020935
20130506185042
20130508040235
20130509040248
20130509041351
20130515193551
20130521210140
20130522193615
20130527152648
20130528174147
20130531210816
20130603192412
20130606190601
20130610201033
20130612200846
20130613211700
20130613212230
20130615064344
20130615073305
20130615075557
20130616082327
20130617014127
20130617180009
20130617181804
20130619063902
20130621042855
20130622110348
20130624203206
20130625022454
20130625170842
20130625201113
20130709184941
20130710201248
20130712041133
20130712163509
20130723212758
20130724201552
20130725213613
20130728172550
20130731163035
20130807202516
20130809160751
20130809204732
20130809211409
20130813204212
20130813224817
20130816024250
20130819192358
20130820174431
20130822213513
20130823201420
20130826011521
20130828192526
20130903154323
20130904181208
20130906081326
20130906171631
20130910040235
20130910220317
20130911182437
20130912185218
20130913210454
20130917174738
20131001060630
20131002070347
20131003061137
20131014203951
20131015131652
20131017014509
20131017030605
20131017205954
20131018050738
20131022045114
20131022151218
20131023163509
20131105101051
20131107154900
20131114185225
20131115165105
20131118173159
20131120055018
20131122064921
20131206200009
20131209091702
20131209091742
20131210163702
20131210181901
20131210234530
20131212225511
20131216164557
20131217174004
20131219203905
20131223171005
20131227164338
20131229221725
20131230010239
20140101235747
20140102104229
20140102194802
20140107220141
20140109205940
20140116170655
20140120155706
20140121204628
20140122043508
20140124202427
20140129164541
20140206044818
20140206195001
20140206215029
20140210194146
20140211230222
20140211234523
20140214151255
20140220160510
20140220163213
20140224232712
20140224232913
20140227104930
20140227201005
20140228005443
20140228173431
20140228205743
20140303185354
20140304200606
20140304201403
20140305100909
20140306223522
20140318150412
20140318203559
20140320042653
20140402201432
20140404143501
20140407055830
20140407202158
20140408061512
20140408152401
20140415054717
20140416202746
20140416202801
20140416235757
20140421235646
20140422195623
20140425125742
20140425135354
20140425172618
20140429175951
20140504174212
20140505145918
20140506200235
20140507173327
20140508053815
20140515220111
20140520062826
20140520063859
20140521192142
20140521220115
20140522003151
20140525233953
20140526185749
20140526201939
20140527163207
20140527233225
20140528015354
20140529045508
20140530002535
20140530043913
20140604145431
20140607035234
20140610012414
20140610012833
20140610034314
20140612010718
20140617053829
20140617080955
20140617193351
20140618001820
20140618163511
20140620184031
20140623195618
20140624044600
20140627193814
20140703022838
20140705081453
20140707071913
20140710005023
20140710224658
20140711063215
20140711143146
20140711193923
20140711233329
20140714060646
20140715013018
20140715051412
20140715055242
20140715160720
20140715190552
20140716063802
20140717024528
20140718041445
20140721063820
20140721161249
20140721162307
20140723011456
20140725050636
20140725172830
20140727030954
20140728120708
20140728144308
20140728152804
20140729092525
20140730203029
20140731011328
20140801052028
20140801170444
20140804010803
20140804030041
20140804060439
20140804072504
20140804075613
20140805061612
20140806003116
20140807033123
20140808051823
20140809224243
20140811094300
20140813175357
20140815183851
20140815191556
20140815215618
20140817011612
20140818023700
20140826234625
20140827044811
20140828172407
20140828200231
20140831191346
20140904055702
20140904160015
20140904215629
20140905055251
20140905171733
20140908165716
20140908191429
20140910130155
20140911065449
20140913192733
20140923042349
20140924192418
20140925173220
20140929181930
20140929204155
20141001101041
20141002181613
20141007224814
20141008152953
20141008181228
20141008192525
20141008192526
20141014032859
20141014191645
20141015060145
20141016183307
20141020153415
20141020154935
20141020164816
20141020174120
20141030222425
20141110150304
20141118011735
20141120035016
20141120043401
20141211114517
20141216112341
20141222051622
20141222224220
20141222230707
20141223145058
20141228151019
20150102113309
20150106215342
20150108002354
20150108202057
20150108211557
20150108221703
20150112172258
20150112172259
20150114093325
20150115172310
20150119192813
20150123145128
20150129204520
20150203041207
20150205032808
20150205172051
20150206004143
20150213174159
20150224004420
20150227043622
20150301224250
20150306050437
20150318143915
20150323034933
20150323062322
20150323234856
20150324184222
20150325183400
20150325190959
20150410002033
20150410002551
20150421085850
20150421190714
20150422160235
20150501152228
20150505044154
20150513094042
20150514023016
20150514043155
20150525151759
20150609163211
20150617080349
20150617233018
20150617234511
20150702201926
20150706215111
20150707163251
20150709021818
20150713203955
20150724165259
20150724182342
20150727193414
20150727210019
20150727210748
20150727230537
20150728004647
20150728210202
20150729150523
20150730154830
20150731225331
20150802233112
20150806210727
20150818190757
20150822141540
20150828155137
20150901192313
20150914021445
20150914034541
20150917071017
20150918004206
20150924022040
20150925000915
20151016163051
20151103233815
20151105181635
20151107041044
20151107042241
20151109124147
20151113205046
20151117165756
20151124172631
20151124192339
20151125194322
20151126173356
20151126233623
20151127011837
20151201035631
20151201161726
20151214165852
20151218232200
20151219045559
20151220232725
20160108051129
20160110053003
20160112025852
20160112101818
20160112104733
20160113160742
20160118174335
20160118233631
20160127105314
20160127222802
20160201181320
20160206210202
20160215075528
20160224033122
20160225050317
20160225050318
20160225050319
20160225050320
20160225095306
20160302063432
20160302104253
20160302170230
20160303183607
20160303234317
20160307190919
20160308193142
20160309073132
20160317174357
20160317201955
20160321164925
20160326001747
20160329101122
20160405172827
20160407160756
20160407180149
20160408131959
20160408175727
20160418065403
20160420172330
20160425141954
20160427202222
20160503205953
20160514100852
20160520022627
20160527015355
20160527191614
20160530003739
20160530203810
20160602164008
20160606204319
20160607213656
20160609203508
\.


--
-- Data for Name: screened_emails; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY screened_emails (id, email, action_type, match_count, last_match_at, created_at, updated_at, ip_address) FROM stdin;
\.


--
-- Name: screened_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('screened_emails_id_seq', 1, false);


--
-- Data for Name: screened_ip_addresses; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY screened_ip_addresses (id, ip_address, action_type, match_count, last_match_at, created_at, updated_at) FROM stdin;
1	10.0.0.0/8	2	0	\N	2016-06-14 16:53:32.430468	2016-06-14 16:53:32.430468
2	192.168.0.0/16	2	0	\N	2016-06-14 16:53:32.433142	2016-06-14 16:53:32.433142
4	172.16.0.0/12	2	0	\N	2016-06-14 16:53:32.437001	2016-06-14 16:53:32.437001
5	fc00::/7	2	0	\N	2016-06-14 16:53:32.438931	2016-06-14 16:53:32.438931
3	127.0.0.0/8	2	4	2016-06-15 08:17:01.105423	2016-06-14 16:53:32.435082	2016-06-15 08:17:01.105776
\.


--
-- Name: screened_ip_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('screened_ip_addresses_id_seq', 6, false);


--
-- Data for Name: screened_urls; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY screened_urls (id, url, domain, action_type, match_count, last_match_at, created_at, updated_at, ip_address) FROM stdin;
\.


--
-- Name: screened_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('screened_urls_id_seq', 1, false);


--
-- Data for Name: single_sign_on_records; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY single_sign_on_records (id, user_id, external_id, last_payload, created_at, updated_at, external_username, external_email, external_name, external_avatar_url) FROM stdin;
1	6	1	nonce=10913da88d5ce8bad0e567c3d6536d39&name=liip&username=liip&email=jazz%40liip.ch&avatar_url=http%3A%2F%2F0.gravatar.com%2Favatar%2F028348746ba267ca287004a7e06fe7dc%3Fs%3D96%26d%3Dmm%26r%3Dg&about_me=&external_id=1	2016-06-15 08:22:18.311538	2016-06-15 08:22:18.369122	liip	jazz@liip.ch	liip	http://0.gravatar.com/avatar/028348746ba267ca287004a7e06fe7dc?s=96&d=mm&r=g
\.


--
-- Name: single_sign_on_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('single_sign_on_records_id_seq', 1, true);


--
-- Data for Name: site_customizations; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY site_customizations (id, name, stylesheet, header, user_id, enabled, key, created_at, updated_at, stylesheet_baked, mobile_stylesheet, mobile_header, mobile_stylesheet_baked, footer, mobile_footer, head_tag, body_tag, top, mobile_top, embedded_css, embedded_css_baked, head_tag_baked, body_tag_baked, header_baked, mobile_header_baked, footer_baked, mobile_footer_baked) FROM stdin;
\.


--
-- Name: site_customizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('site_customizations_id_seq', 1, false);


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY site_settings (id, name, data_type, value, created_at, updated_at) FROM stdin;
1	uncategorized_category_id	3	1	2016-06-14 16:53:29.312702	2016-06-14 16:53:29.312702
2	lounge_category_id	3	2	2016-06-14 16:53:29.553259	2016-06-14 16:53:29.553259
3	meta_category_id	3	3	2016-06-14 16:53:29.629523	2016-06-14 16:53:29.629523
4	staff_category_id	3	4	2016-06-14 16:53:29.735091	2016-06-14 16:53:29.735091
5	notification_email	1	noreply@discourse.ogdch.dev	2016-06-14 16:53:33.484878	2016-06-14 16:53:33.484878
6	tos_topic_id	3	4	2016-06-14 16:53:33.843258	2016-06-14 16:53:33.843258
7	guidelines_topic_id	3	5	2016-06-14 16:53:34.0455	2016-06-14 16:53:34.0455
8	privacy_topic_id	3	6	2016-06-14 16:53:34.204607	2016-06-14 16:53:34.204607
9	last_vacuum	3	1465923214	2016-06-14 16:53:34.986995	2016-06-14 16:53:34.986995
11	has_login_hint	5	f	2016-06-14 16:53:37.614133	2016-06-15 08:17:09.360523
10	global_notice	1		2016-06-14 16:53:37.610868	2016-06-15 08:17:09.363401
12	default_trust_level	7	1	2016-06-15 08:17:09.40692	2016-06-15 08:17:09.40692
13	default_email_digest_frequency	7	1440	2016-06-15 08:17:09.440308	2016-06-15 08:17:09.440308
14	bootstrap_mode_enabled	5	t	2016-06-15 08:17:09.459562	2016-06-15 08:17:09.459562
15	embed_by_username	1	ckan	2016-06-15 08:19:47.635796	2016-06-15 08:19:47.635796
16	embed_post_limit	3	100	2016-06-15 08:19:47.646605	2016-06-15 08:19:47.646605
17	embed_truncate	5	f	2016-06-15 08:19:47.656136	2016-06-15 08:19:47.656136
18	embed_whitelist_selector	1		2016-06-15 08:19:47.667092	2016-06-15 08:19:47.667092
19	embed_blacklist_selector	1		2016-06-15 08:19:47.681354	2016-06-15 08:19:47.681354
20	embed_classname_whitelist	1	emoji	2016-06-15 08:19:47.702924	2016-06-15 08:19:47.702924
21	feed_polling_enabled	5	f	2016-06-15 08:19:47.718608	2016-06-15 08:19:47.718608
22	feed_polling_url	1		2016-06-15 08:19:47.732502	2016-06-15 08:19:47.732502
23	embed_username_key_from_feed	1		2016-06-15 08:19:47.746565	2016-06-15 08:19:47.746565
24	bootstrap_mode_min_users	3	0	2016-06-15 08:20:46.626645	2016-06-15 08:20:46.626645
25	default_locale	7	de	2016-06-15 08:21:07.576616	2016-06-15 08:21:07.576616
26	allow_user_locale	5	t	2016-06-15 08:21:10.059564	2016-06-15 08:21:10.059564
27	sso_url	1	http://ogdch.dev/login	2016-06-15 08:21:37.677951	2016-06-15 08:21:37.677951
28	sso_secret	1	>/^w4[rhfGMkT{QfD	2016-06-15 08:21:38.165488	2016-06-15 08:21:38.165488
29	enable_sso	5	t	2016-06-15 08:21:39.043226	2016-06-15 08:21:39.043226
\.


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('site_settings_id_seq', 29, true);


--
-- Name: stylesheet_cache_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('stylesheet_cache_id_seq', 30, true);


--
-- Data for Name: tag_group_memberships; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY tag_group_memberships (id, tag_id, tag_group_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: tag_group_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('tag_group_memberships_id_seq', 1, false);


--
-- Data for Name: tag_groups; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY tag_groups (id, name, created_at, updated_at, parent_tag_id, one_per_topic) FROM stdin;
\.


--
-- Name: tag_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('tag_groups_id_seq', 1, false);


--
-- Data for Name: tag_users; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY tag_users (id, tag_id, user_id, notification_level, created_at, updated_at) FROM stdin;
\.


--
-- Name: tag_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('tag_users_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY tags (id, name, topic_count, created_at, updated_at) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Data for Name: top_topics; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY top_topics (id, topic_id, yearly_posts_count, yearly_views_count, yearly_likes_count, monthly_posts_count, monthly_views_count, monthly_likes_count, weekly_posts_count, weekly_views_count, weekly_likes_count, daily_posts_count, daily_views_count, daily_likes_count, daily_score, weekly_score, monthly_score, yearly_score, all_score, daily_op_likes_count, weekly_op_likes_count, monthly_op_likes_count, yearly_op_likes_count, quarterly_posts_count, quarterly_views_count, quarterly_likes_count, quarterly_score, quarterly_op_likes_count) FROM stdin;
1	4	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	8	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
3	6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
4	7	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
5	5	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
6	10	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
7	9	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
8	15	0	0	0	0	0	0	0	0	0	2	1	0	0.301029995663981198	0	0	0	0	0	0	0	0	0	0	0	0	0
\.


--
-- Name: top_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('top_topics_id_seq', 8, true);


--
-- Data for Name: topic_allowed_groups; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_allowed_groups (id, group_id, topic_id) FROM stdin;
\.


--
-- Name: topic_allowed_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_allowed_groups_id_seq', 1, false);


--
-- Data for Name: topic_allowed_users; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_allowed_users (id, user_id, topic_id, created_at, updated_at) FROM stdin;
1	4	11	2016-06-15 08:17:09.430554	2016-06-15 08:17:09.430554
2	-1	11	2016-06-15 08:17:09.435501	2016-06-15 08:17:09.435501
3	5	13	2016-06-15 08:19:42.312273	2016-06-15 08:19:42.312273
4	-1	13	2016-06-15 08:19:42.314335	2016-06-15 08:19:42.314335
5	6	14	2016-06-15 08:22:18.336074	2016-06-15 08:22:18.336074
6	-1	14	2016-06-15 08:22:18.337937	2016-06-15 08:22:18.337937
\.


--
-- Name: topic_allowed_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_allowed_users_id_seq', 6, true);


--
-- Data for Name: topic_custom_fields; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_custom_fields (id, topic_id, name, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: topic_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_custom_fields_id_seq', 1, false);


--
-- Data for Name: topic_embeds; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_embeds (id, topic_id, post_id, embed_url, content_sha1, created_at, updated_at) FROM stdin;
1	15	18	http://ogdch.dev/dataset/haltestellen	4692d60ce6760531df27ea9f68ca6973d3244a4f	2016-06-15 08:52:08.578959	2016-06-15 08:52:08.578959
\.


--
-- Name: topic_embeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_embeds_id_seq', 1, true);


--
-- Data for Name: topic_invites; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_invites (id, topic_id, invite_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: topic_invites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_invites_id_seq', 1, false);


--
-- Data for Name: topic_link_clicks; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_link_clicks (id, topic_link_id, user_id, created_at, updated_at, ip_address) FROM stdin;
\.


--
-- Name: topic_link_clicks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_link_clicks_id_seq', 1, false);


--
-- Data for Name: topic_links; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_links (id, topic_id, post_id, user_id, url, domain, internal, link_topic_id, created_at, updated_at, reflection, clicks, link_post_id, title, crawled_at, quote) FROM stdin;
1	4	4	-1	/privacy	discourse.ogdch.dev	t	\N	2016-06-14 16:53:33.769723	2016-06-14 16:53:33.769723	f	0	\N	\N	\N	f
2	4	4	-1	/faq	discourse.ogdch.dev	t	\N	2016-06-14 16:53:33.774234	2016-06-14 16:53:33.774234	f	0	\N	\N	\N	f
6	4	4	-1	/guidelines	discourse.ogdch.dev	t	\N	2016-06-14 16:53:33.785557	2016-06-14 16:53:33.785557	f	0	\N	\N	\N	f
8	5	6	-1	/about	discourse.ogdch.dev	t	\N	2016-06-14 16:53:33.988569	2016-06-14 16:53:33.988569	f	0	\N	\N	\N	f
9	5	6	-1	/c/site-feedback	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.001838	2016-06-14 16:53:34.001838	f	0	\N	\N	\N	f
10	5	6	-1	/tos	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.006274	2016-06-14 16:53:34.006274	f	0	\N	\N	\N	f
13	9	12	-1	/badges/3/regular	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.483911	2016-06-14 16:53:34.483911	f	0	\N	\N	\N	f
16	10	13	-1	/t/assets-for-the-site-design	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.760448	2016-06-14 16:53:34.760448	f	0	\N	\N	\N	f
25	10	13	-1	/t/welcome-to-discourse	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.801291	2016-06-14 16:53:34.801291	f	0	\N	\N	\N	f
27	10	13	-1	/faq	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.809418	2016-06-14 16:53:34.809418	f	0	\N	\N	\N	f
29	10	13	-1	/category/site-feedback	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.823387	2016-06-14 16:53:34.823387	f	0	\N	\N	\N	f
31	10	13	-1	/category/lounge	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.82973	2016-06-14 16:53:34.82973	f	0	\N	\N	\N	f
32	10	13	-1	/category/staff	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.833436	2016-06-14 16:53:34.833436	f	0	\N	\N	\N	f
33	10	13	-1	/categories	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.837666	2016-06-14 16:53:34.837666	f	0	\N	\N	\N	f
38	10	13	-1	/tos	discourse.ogdch.dev	t	\N	2016-06-14 16:53:34.852315	2016-06-14 16:53:34.852315	f	0	\N	\N	\N	f
12	9	12	-1	http://en.wikipedia.org/wiki/Nofollow	en.wikipedia.org	f	\N	2016-06-14 16:53:34.473094	2016-06-14 16:53:34.473094	f	0	\N	nofollow - Wikipedia, the free encyclopedia	2016-06-14 16:57:41.27563	f
3	4	4	-1	http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US	creativecommons.org	f	\N	2016-06-14 16:53:33.776835	2016-06-14 16:53:33.776835	f	0	\N	Creative Commons — Attribution-NonCommercial-ShareAlike 3.0 Unported — CC BY-NC-SA 3.0	2016-06-14 16:57:41.306964	f
15	10	13	-1	http://www.discourse.org	www.discourse.org	f	\N	2016-06-14 16:53:34.74525	2016-06-14 16:53:34.74525	f	0	\N	Discourse	2016-06-14 16:57:41.920108	f
5	4	4	-1	http://www.newyorker.com/online/blogs/shouts/2012/12/the-hundred-best-lists-of-all-time.html	www.newyorker.com	f	\N	2016-06-14 16:53:33.781233	2016-06-14 16:53:33.781233	f	0	\N	The Hundred Best Lists of All Time - The New Yorker	2016-06-14 16:57:42.350198	f
17	10	13	-1	https://meta.discourse.org/t/configuring-google-oauth2-login-for-discourse/15858	meta.discourse.org	f	\N	2016-06-14 16:53:34.777249	2016-06-14 16:53:34.777249	f	0	\N	Configuring Google OAuth2 login for Discourse - howto - Discourse Meta	2016-06-14 16:57:42.805644	f
18	10	13	-1	https://meta.discourse.org/t/configuring-twitter-login-for-discourse/13395	meta.discourse.org	f	\N	2016-06-14 16:53:34.779786	2016-06-14 16:53:34.779786	f	0	\N	Configuring Twitter login for Discourse - howto - Discourse Meta	2016-06-14 16:57:43.245537	f
20	10	13	-1	https://meta.discourse.org/t/configuring-github-login-for-discourse/13745	meta.discourse.org	f	\N	2016-06-14 16:53:34.784905	2016-06-14 16:53:34.784905	f	0	\N	Configuring GitHub login for Discourse - howto - Discourse Meta	2016-06-14 16:57:43.776685	f
21	10	13	-1	https://meta.discourse.org/t/official-single-sign-on-for-discourse/13045	meta.discourse.org	f	\N	2016-06-14 16:53:34.787595	2016-06-14 16:53:34.787595	f	0	\N	Official Single-Sign-On for Discourse - sso - Discourse Meta	2016-06-14 16:57:44.015876	f
23	10	13	-1	https://github.com/discourse/discourse/blob/master/docs/INSTALL-email.md	github.com	f	\N	2016-06-14 16:53:34.794236	2016-06-14 16:53:34.794236	f	0	\N	discourse/INSTALL-email.md at master · discourse/discourse · GitHub	2016-06-14 16:57:44.536851	f
26	10	13	-1	https://www.youtube.com/watch?v=d0VNHe5fq30	www.youtube.com	f	\N	2016-06-14 16:53:34.803958	2016-06-14 16:53:34.803958	f	0	\N	What in the Wide, Wide World of Sports?.mp4 - YouTube	2016-06-14 16:57:44.620333	f
24	10	13	-1	https://meta.discourse.org/t/set-up-reply-via-email-support/14003	meta.discourse.org	f	\N	2016-06-14 16:53:34.797024	2016-06-14 16:53:34.797024	f	0	\N	Set up reply via email support - howto - Discourse Meta	2016-06-14 16:57:44.813311	f
37	10	13	-1	http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US	creativecommons.org	f	\N	2016-06-14 16:53:34.848524	2016-06-14 16:53:34.848524	f	0	\N	Creative Commons — Attribution-NonCommercial-ShareAlike 3.0 Unported — CC BY-NC-SA 3.0	2016-06-14 16:57:45.494453	f
36	10	13	-1	https://creativecommons.org/	creativecommons.org	f	\N	2016-06-14 16:53:34.845895	2016-06-14 16:53:34.845895	f	0	\N	Creative Commons	2016-06-14 16:57:45.967243	f
35	10	13	-1	https://meta.discourse.org/t/what-do-user-trust-levels-do/4924/2	meta.discourse.org	f	\N	2016-06-14 16:53:34.84354	2016-06-14 16:53:34.84354	f	0	\N	What do user trust levels do? - faq - Discourse Meta	2016-06-14 16:57:46.093892	f
39	10	13	-1	http://blog.discourse.org/2014/08/building-a-discourse-community/	blog.discourse.org	f	\N	2016-06-14 16:53:34.854781	2016-06-14 16:53:34.854781	f	0	\N	Building a Discourse Community	2016-06-14 16:57:46.563903	f
34	10	13	-1	http://meta.discourse.org/t/how-to-set-up-image-uploads-to-s3/7229	meta.discourse.org	f	\N	2016-06-14 16:53:34.841283	2016-06-14 16:53:34.841283	f	0	\N	Setting up file and image uploads to S3 - howto - Discourse Meta	2016-06-14 16:57:46.96385	f
41	10	13	-1	https://meta.discourse.org/t/invite-individual-users-to-a-group/15544	meta.discourse.org	f	\N	2016-06-14 16:53:34.85954	2016-06-14 16:53:34.85954	f	0	\N	Invite individual users to a group - howto - Discourse Meta	2016-06-14 16:57:47.50609	f
42	10	13	-1	https://github.com/discourse/discourse/blob/master/docs/INSTALL.md	github.com	f	\N	2016-06-14 16:53:34.861756	2016-06-14 16:53:34.861756	f	0	\N	discourse/INSTALL.md at master · discourse/discourse · GitHub	2016-06-14 16:57:47.527462	f
45	10	13	-1	https://meta.discourse.org/t/enable-a-cdn-for-your-discourse/14857	meta.discourse.org	f	\N	2016-06-14 16:53:34.869721	2016-06-14 16:53:34.869721	f	0	\N	Enable a CDN for your Discourse - howto - Discourse Meta	2016-06-14 16:57:48.934992	f
46	10	13	-1	https://meta.discourse.org/t/move-your-discourse-instance-to-a-different-server/15721	meta.discourse.org	f	\N	2016-06-14 16:53:34.871993	2016-06-14 16:53:34.871993	f	0	\N	Move your Discourse Instance to a Different Server - howto - Discourse Meta	2016-06-14 16:57:48.94356	f
48	10	13	-1	https://meta.discourse.org/t/multisite-configuration-with-docker/14084	meta.discourse.org	f	\N	2016-06-14 16:53:34.877639	2016-06-14 16:53:34.877639	f	0	\N	Multisite configuration with Docker - howto - Discourse Meta	2016-06-14 16:57:49.565688	f
47	10	13	-1	https://meta.discourse.org/t/how-do-i-change-the-domain-name/16098	meta.discourse.org	f	\N	2016-06-14 16:53:34.875237	2016-06-14 16:53:34.875237	f	0	\N	Change the domain name or rename my Discourse? - howto - Discourse Meta	2016-06-14 16:57:49.66111	f
50	10	13	-1	https://meta.discourse.org/t/configure-a-firewall-for-discourse/20584	meta.discourse.org	f	\N	2016-06-14 16:53:34.882011	2016-06-14 16:53:34.882011	f	0	\N	Configure a firewall for Discourse - howto - Discourse Meta	2016-06-14 16:57:50.335255	f
51	10	13	-1	https://meta.discourse.org/t/adding-an-offline-page-when-rebuilding/45238	meta.discourse.org	f	\N	2016-06-14 16:53:34.884299	2016-06-14 16:53:34.884299	f	0	\N	Adding an offline page when rebuilding - howto - Discourse Meta	2016-06-14 16:57:50.52413	f
4	4	4	-1	http://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act	en.wikipedia.org	f	\N	2016-06-14 16:53:33.779066	2016-06-14 16:53:33.779066	f	0	\N	Digital Millennium Copyright Act - Wikipedia, the free encyclopedia	2016-06-14 16:57:41.022926	f
11	6	8	-1	https://en.wikipedia.org/wiki/Children%27s_Online_Privacy_Protection_Act	en.wikipedia.org	f	\N	2016-06-14 16:53:34.169047	2016-06-14 16:53:34.169047	f	0	\N	Children's Online Privacy Protection Act - Wikipedia, the free encyclopedia	2016-06-14 16:57:41.179129	f
7	4	4	-1	http://en.wordpress.com/tos/	en.wordpress.com	f	\N	2016-06-14 16:53:33.787941	2016-06-14 16:53:33.787941	f	0	\N	Terms of Service — WordPress.com	2016-06-14 16:57:41.613593	f
14	9	12	-1	https://meta.discourse.org/t/what-do-user-trust-levels-do/4924	meta.discourse.org	f	\N	2016-06-14 16:53:34.486851	2016-06-14 16:53:34.486851	f	0	\N	What do user trust levels do? - faq - Discourse Meta	2016-06-14 16:57:42.540511	f
19	10	13	-1	https://meta.discourse.org/t/configuring-facebook-login-for-discourse/13394	meta.discourse.org	f	\N	2016-06-14 16:53:34.782202	2016-06-14 16:53:34.782202	f	0	\N	Configuring Facebook login for Discourse - howto - Discourse Meta	2016-06-14 16:57:43.34063	f
22	10	13	-1	https://meta.discourse.org/t/login-to-discourse-with-custom-oauth2-provider/14717	meta.discourse.org	f	\N	2016-06-14 16:53:34.790064	2016-06-14 16:53:34.790064	f	0	\N	Login to Discourse with custom Oauth2 provider - feature - Discourse Meta	2016-06-14 16:57:44.259142	f
28	10	13	-1	http://blog.discourse.org/2013/03/the-universal-rules-of-civilized-discourse/	blog.discourse.org	f	\N	2016-06-14 16:53:34.811992	2016-06-14 16:53:34.811992	f	0	\N	The Universal Rules of Civilized Discourse	2016-06-14 16:57:44.880387	f
30	10	13	-1	https://meta.discourse.org/t/5249	meta.discourse.org	f	\N	2016-06-14 16:53:34.825958	2016-06-14 16:53:34.825958	f	0	\N	What is "Meta" or "Site Feedback"? - meta - Discourse Meta	2016-06-14 16:57:46.305253	f
40	10	13	-1	https://meta.discourse.org/t/sending-bulk-user-invites/16468	meta.discourse.org	f	\N	2016-06-14 16:53:34.85718	2016-06-14 16:53:34.85718	f	0	\N	Sending Bulk User Invites - howto - Discourse Meta	2016-06-14 16:57:47.424049	f
43	10	13	-1	https://meta.discourse.org/t/configure-automatic-backups-for-discourse/14855	meta.discourse.org	f	\N	2016-06-14 16:53:34.865111	2016-06-14 16:53:34.865111	f	0	\N	Configure automatic backups for Discourse - howto - Discourse Meta	2016-06-14 16:57:48.014381	f
44	10	13	-1	https://meta.discourse.org/t/allowing-ssl-for-your-discourse-docker-setup/13847	meta.discourse.org	f	\N	2016-06-14 16:53:34.867385	2016-06-14 16:53:34.867385	f	0	\N	Allowing SSL / HTTPS for your Discourse Docker setup - howto - Discourse Meta	2016-06-14 16:57:49.108162	f
53	10	13	-1	http://eviltrout.com/2014/01/22/embedding-discourse.html	eviltrout.com	f	\N	2016-06-14 16:53:34.888951	2016-06-14 16:53:34.888951	f	0	\N	Embedding Discourse in Static Sites - Evil Trout's Blog	2016-06-14 16:57:50.113715	f
49	10	13	-1	https://github.com/discourse/discourse/tree/master/script/import_scripts	github.com	f	\N	2016-06-14 16:53:34.879773	2016-06-14 16:53:34.879773	f	0	\N	discourse/script/import_scripts at master · discourse/discourse · GitHub	2016-06-14 16:57:50.229699	f
52	10	13	-1	https://github.com/discourse/wp-discourse	github.com	f	\N	2016-06-14 16:53:34.886708	2016-06-14 16:53:34.886708	f	0	\N	GitHub - discourse/wp-discourse: WordPress plugin that lets you use Discourse as the community engine for a WordPress blog	2016-06-14 16:57:50.785431	f
55	10	13	-1	https://github.com/discourse/discourse/blob/master/docs/ADMIN-QUICK-START-GUIDE.md	github.com	f	\N	2016-06-14 16:53:34.893733	2016-06-14 16:53:34.893733	f	0	\N	discourse/ADMIN-QUICK-START-GUIDE.md at master · discourse/discourse · GitHub	2016-06-14 16:57:51.742346	f
54	10	13	-1	http://meta.discourse.org	meta.discourse.org	f	\N	2016-06-14 16:53:34.8913	2016-06-14 16:53:34.8913	f	0	\N	Discourse Meta	2016-06-14 16:57:51.871062	f
59	11	14	-1	http://discourse.ogdch.dev/about	discourse.ogdch.dev	t	\N	2016-06-15 08:17:09.864326	2016-06-15 08:17:09.864326	f	0	\N	\N	\N	f
61	11	14	-1	http://discourse.ogdch.dev/guidelines	discourse.ogdch.dev	t	\N	2016-06-15 08:17:09.88462	2016-06-15 08:17:09.88462	f	0	\N	\N	\N	f
58	11	14	-1	http://commonmark.org/help/tutorial/	commonmark.org	f	\N	2016-06-15 08:17:09.860075	2016-06-15 08:17:09.860075	f	0	\N	Markdown Tutorial - Introduction	2016-06-15 08:17:10.624044	f
57	11	14	-1	http://commonmark.org/help/	commonmark.org	f	\N	2016-06-15 08:17:09.848954	2016-06-15 08:17:09.848954	f	0	\N	Markdown Reference	2016-06-15 08:17:10.645282	f
56	11	14	-1	http://www.emoji.codes/	www.emoji.codes	f	\N	2016-06-15 08:17:09.843387	2016-06-15 08:17:09.843387	f	0	\N	Emoji Cheat Sheet - Emoji.codes	2016-06-15 08:17:11.243371	f
60	11	14	-1	https://meta.discourse.org/t/what-do-user-trust-levels-do/4924	meta.discourse.org	f	\N	2016-06-15 08:17:09.880037	2016-06-15 08:17:09.880037	f	0	\N	What do user trust levels do? - faq - Discourse Meta	2016-06-15 08:17:11.662038	f
65	13	16	-1	http://discourse.ogdch.dev/about	discourse.ogdch.dev	t	\N	2016-06-15 08:19:42.404638	2016-06-15 08:19:42.404638	f	0	\N	\N	\N	f
67	13	16	-1	http://discourse.ogdch.dev/guidelines	discourse.ogdch.dev	t	\N	2016-06-15 08:19:42.411313	2016-06-15 08:19:42.411313	f	0	\N	\N	\N	f
63	13	16	-1	http://commonmark.org/help/	commonmark.org	f	\N	2016-06-15 08:19:42.398037	2016-06-15 08:19:42.398037	f	0	\N	Markdown Reference	2016-06-15 08:19:42.906428	f
64	13	16	-1	http://commonmark.org/help/tutorial/	commonmark.org	f	\N	2016-06-15 08:19:42.400913	2016-06-15 08:19:42.400913	f	0	\N	Markdown Tutorial - Introduction	2016-06-15 08:19:42.946558	f
62	13	16	-1	http://www.emoji.codes/	www.emoji.codes	f	\N	2016-06-15 08:19:42.395388	2016-06-15 08:19:42.395388	f	0	\N	Emoji Cheat Sheet - Emoji.codes	2016-06-15 08:19:43.263791	f
66	13	16	-1	https://meta.discourse.org/t/what-do-user-trust-levels-do/4924	meta.discourse.org	f	\N	2016-06-15 08:19:42.407478	2016-06-15 08:19:42.407478	f	0	\N	What do user trust levels do? - faq - Discourse Meta	2016-06-15 08:19:43.803992	f
71	14	17	-1	http://discourse.ogdch.dev/about	discourse.ogdch.dev	t	\N	2016-06-15 08:22:18.515006	2016-06-15 08:22:18.515006	f	0	\N	\N	\N	f
73	14	17	-1	http://discourse.ogdch.dev/guidelines	discourse.ogdch.dev	t	\N	2016-06-15 08:22:18.528699	2016-06-15 08:22:18.528699	f	0	\N	\N	\N	f
68	14	17	-1	http://commonmark.org/help/	commonmark.org	f	\N	2016-06-15 08:22:18.501746	2016-06-15 08:22:18.501746	f	0	\N	Markdown Reference	2016-06-15 08:22:19.034252	f
69	14	17	-1	http://commonmark.org/help/tutorial/	commonmark.org	f	\N	2016-06-15 08:22:18.504203	2016-06-15 08:22:18.504203	f	0	\N	Markdown Tutorial - Introduction	2016-06-15 08:22:19.034542	f
72	14	17	-1	https://meta.discourse.org/t/what-do-user-trust-levels-do/4924	meta.discourse.org	f	\N	2016-06-15 08:22:18.524165	2016-06-15 08:22:18.524165	f	0	\N	What do user trust levels do? - faq - Discourse Meta	2016-06-15 08:22:19.954535	f
70	14	17	-1	http://www.emoji.codes/	www.emoji.codes	f	\N	2016-06-15 08:22:18.506415	2016-06-15 08:22:18.506415	f	0	\N	Emoji Cheat Sheet - Emoji.codes	2016-06-15 08:22:20.399778	f
74	15	18	5	http://ogdch.dev/dataset/haltestellen	ogdch.dev	f	\N	2016-06-15 08:52:08.515766	2016-06-15 08:52:08.515766	f	0	\N	Haltestellen - Datensätze - opendata.swiss	2016-06-15 08:52:08.58871	f
\.


--
-- Name: topic_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_links_id_seq', 74, true);


--
-- Data for Name: topic_search_data; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_search_data (topic_id, raw_data, locale, search_data) FROM stdin;
1	About the Lounge category A category exclusive to members with trust level 3 and higher.	en	'3':13 'categori':4,6 'exclus':7 'higher':15 'level':12 'loung':3 'member':9 'trust':11
2	About the Site Feedback category Discussion about this site, its organization, how it works, and how we can improve it.	en	'categori':5 'discuss':6 'feedback':4 'improv':19 'organ':11 'site':3,9 'work':14
3	About the Staff category Private category for staff discussions. Topics are only visible to admins and moderators.	en	'admin':15 'categori':4,6 'discuss':9 'moder':17 'privat':5 'staff':3,8 'topic':10 'visibl':13
4	Terms of Service The following terms and conditions govern all use of the company_domain website and all content, services and products available at or through the website, including, but not limited to, company_doma	en	'avail':23 'compani':14,34 'condit':8 'content':19 'doma':35 'domain':15 'follow':5 'govern':9 'includ':29 'limit':32 'product':22 'servic':3,20 'term':1,6 'use':11 'websit':16,28
5	FAQ/Guidelines This is a Civilized Place for Public Discussion Please treat this discussion forum with the same respect you would a public park. We, too, are a shared community resource — a place to share	en	'civil':5 'communiti':29 'discuss':9,13 'faq/guidelines':1 'forum':14 'park':23 'place':6,32 'pleas':10 'public':8,22 'resourc':30 'respect':18 'share':28,34 'treat':11 'would':20
6	Privacy Policy What information do we collect? We collect information from you when you register on our site and gather data when you participate in the forum by reading, writing, and evaluating the conten	en	'collect':7,9 'conten':34 'data':21 'evalu':32 'forum':27 'gather':20 'inform':4,10 'particip':24 'polici':2 'privaci':1 'read':29 'regist':15 'site':18 'write':30
7	Assets for the site design This is a permanent topic, visible only to staff, for storing images and files used in the site design. Don't delete it! Here's how: Reply to this topic. Upload all the images you wi	en	'asset':1 'delet':27 'design':5,24 'file':19 'imag':17,39 'perman':9 'repli':32 'site':4,23 'staff':14 'store':16 'topic':10,35 'upload':36 'use':20 'visibl':11 'wi':41
8	Welcome to Discourse The first paragraph of this pinned topic will be visible as a welcome message to all new visitors on your homepage. It's important! Edit this into a brief description of your community:	en	'brief':32 'communiti':36 'descript':33 'discours':3 'edit':28 'first':5 'homepag':24 'import':27 'messag':17 'new':20 'paragraph':6 'pin':9 'topic':10 'visibl':13 'visitor':21 'welcom':1,16
9	Welcome to the Lounge Congratulations! :confetti_ball: :confetti_ball: If you can see this topic, you were recently promoted to regular (trust level 3). You can now … Edit the title of any topic	en	'3':24 'ball':7,9 'confetti':6,8 'congratul':5 'edit':28 'level':23 'loung':4 'promot':19 'recent':18 'regular':21 'see':13 'titl':30 'topic':15,33 'trust':22 'welcom':1
10	READ ME FIRST: Admin Quick Start Guide Congratulations, you are now the proud owner of your very own Civilized Discourse Construction Kit . :hatching_chick: :hatching_chick: Admin Dashboard As an admin you have total contr	en	'admin':4,27,31 'chick':24,26 'civil':19 'congratul':8 'construct':21 'contr':35 'dashboard':28 'discours':20 'first':3 'guid':7 'hatch':23,25 'kit':22 'owner':14 'proud':13 'quick':5 'read':1 'start':6 'total':34
11	Welcome to Discourse! Thanks for joining Discourse, and welcome! Here are a few quick tips to get you started: Reading To read more, just keep scrolling down! As new replies or new topics arrive, the	en	'arriv':34 'discours':3,7 'get':17 'join':6 'keep':25 'new':29,32 'quick':14 'read':20,22 'repli':30 'scroll':26 'start':19 'thank':4 'tip':15 'topic':33 'welcom':1,9
12	About the ckan category (Replace this first paragraph with a brief description of your new category. This guidance will appear in the category selection area, so try to keep it below 200 characters. Until you edit this de	en	'200':32 'appear':20 'area':25 'brief':11 'categori':4,16,23 'charact':33 'ckan':3 'de':38 'descript':12 'edit':36 'first':7 'guidanc':18 'keep':29 'new':15 'paragraph':8 'replac':5 'select':24 'tri':27
13	Welcome to Discourse! Thanks for joining Discourse, and welcome! Here are a few quick tips to get you started: Reading To read more, just keep scrolling down! As new replies or new topics arrive, the	en	'arriv':34 'discours':3,7 'get':17 'join':6 'keep':25 'new':29,32 'quick':14 'read':20,22 'repli':30 'scroll':26 'start':19 'thank':4 'tip':15 'topic':33 'welcom':1,9
14	Willkommen bei Discourse! Danke fürs Anmelden bei Discourse, sei willkommen! Hier sind einige Tipps um dir den Einstieg zu erleichtern. Lesen Um mehr zu lesen scrolle einfach weiter nach unten! Wenn neue	de	'anmeld':6 'dank':4 'discours':3,8 'einfach':27 'einstieg':18 'erleicht':20 'fur':5 'les':21,25 'mehr':23 'neu':32 'scroll':26 'sei':9 'tipps':14 'unt':30 'willkomm':1,10
15	Haltestellen - Datensätze - opendata.swiss Haltestellen Follower 0	de	'0':6 'datensatz':2 'follow':5 'haltestell':1,4 'opendata.swiss':3
\.


--
-- Data for Name: topic_tags; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_tags (id, topic_id, tag_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: topic_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_tags_id_seq', 1, false);


--
-- Data for Name: topic_users; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_users (user_id, topic_id, posted, last_read_post_number, highest_seen_post_number, last_visited_at, first_visited_at, notification_level, notifications_changed_at, notifications_reason_id, total_msecs_viewed, cleared_pinned_at, id, last_emailed_post_number, liked, bookmarked) FROM stdin;
-1	1	t	1	1	2016-06-14 16:53:33.013562	2016-06-14 16:53:33.013562	3	2016-06-14 16:53:33.012802	1	0	\N	1	\N	f	f
-1	2	t	1	1	2016-06-14 16:53:33.3023	2016-06-14 16:53:33.3023	3	2016-06-14 16:53:33.301618	1	0	\N	2	\N	f	f
-1	3	t	1	1	2016-06-14 16:53:33.416663	2016-06-14 16:53:33.416663	3	2016-06-14 16:53:33.415799	1	0	\N	3	\N	f	f
-1	4	t	2	2	2016-06-14 16:53:33.577455	2016-06-14 16:53:33.577455	3	2016-06-14 16:53:33.576856	1	0	\N	4	\N	f	f
-1	5	t	2	2	2016-06-14 16:53:33.927629	2016-06-14 16:53:33.927629	3	2016-06-14 16:53:33.927033	1	0	\N	5	\N	f	f
-1	6	t	2	2	2016-06-14 16:53:34.125755	2016-06-14 16:53:34.125755	3	2016-06-14 16:53:34.125104	1	0	\N	6	\N	f	f
-1	7	t	1	1	2016-06-14 16:53:34.285839	2016-06-14 16:53:34.285839	3	2016-06-14 16:53:34.284904	1	0	\N	7	\N	f	f
-1	8	t	1	1	2016-06-14 16:53:34.370613	2016-06-14 16:53:34.370613	3	2016-06-14 16:53:34.369756	1	0	\N	8	\N	f	f
-1	9	t	1	1	2016-06-14 16:53:34.447607	2016-06-14 16:53:34.447607	3	2016-06-14 16:53:34.44663	1	0	\N	9	\N	f	f
-1	10	t	1	1	2016-06-14 16:53:34.605852	2016-06-14 16:53:34.605852	3	2016-06-14 16:53:34.603637	1	0	\N	10	\N	f	f
4	11	f	\N	\N	2016-06-15 08:17:09.503506	2016-06-15 08:17:09.503506	3	2016-06-15 08:17:09.502848	2	0	\N	12	\N	f	f
-1	11	t	1	1	2016-06-15 08:17:09.497021	2016-06-15 08:17:09.497021	3	2016-06-15 08:17:09.496005	1	0	\N	11	\N	f	f
5	13	f	\N	\N	2016-06-15 08:19:42.34044	2016-06-15 08:19:42.34044	3	2016-06-15 08:19:42.339786	2	0	\N	14	\N	f	f
-1	13	t	1	1	2016-06-15 08:19:42.335656	2016-06-15 08:19:42.335656	3	2016-06-15 08:19:42.334631	1	0	\N	13	\N	f	f
6	14	f	\N	\N	2016-06-15 08:22:18.358119	2016-06-15 08:22:18.358119	3	2016-06-15 08:22:18.357448	2	0	\N	16	\N	f	f
-1	14	t	1	1	2016-06-15 08:22:18.353921	2016-06-15 08:22:18.353921	3	2016-06-15 08:22:18.352976	1	0	\N	15	\N	f	f
6	15	t	2	2	2016-06-15 09:03:21.913724	2016-06-15 08:53:22.461879	2	2016-06-15 09:03:13.030693	4	16003	\N	18	\N	f	f
5	15	t	1	1	2016-06-15 08:52:08.457767	2016-06-15 08:52:08.457767	3	2016-06-15 08:52:08.457194	1	0	\N	17	2	f	f
\.


--
-- Name: topic_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topic_users_id_seq', 18, true);


--
-- Data for Name: topic_views; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topic_views (topic_id, viewed_at, user_id, ip_address) FROM stdin;
15	2016-06-15	6	127.0.0.1
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY topics (id, title, last_posted_at, created_at, updated_at, views, posts_count, user_id, last_post_user_id, reply_count, featured_user1_id, featured_user2_id, featured_user3_id, avg_time, deleted_at, highest_post_number, image_url, off_topic_count, like_count, incoming_link_count, bookmark_count, category_id, visible, moderator_posts_count, closed, archived, bumped_at, has_summary, vote_count, archetype, featured_user4_id, notify_moderators_count, spam_count, illegal_count, inappropriate_count, pinned_at, score, percent_rank, notify_user_count, subtype, slug, auto_close_at, auto_close_user_id, auto_close_started_at, deleted_by_id, participant_count, word_count, excerpt, pinned_globally, auto_close_based_on_last_post, auto_close_hours, pinned_until, fancy_title) FROM stdin;
4	Terms of Service	2016-06-14 16:53:33.849161	2016-06-14 16:53:33.533301	2016-06-14 16:53:33.878463	0	2	-1	-1	0	\N	\N	\N	\N	\N	2	\N	0	0	0	0	4	t	0	f	f	2016-06-14 16:53:33.849161	f	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	\N	terms-of-service	\N	\N	\N	\N	1	2653	The following terms and conditions govern all use of the company_domain website and all content, services and products available at or through the website, including, but not limited to, company_domain Forum Software, co&hellip;	f	f	\N	\N	Terms of Service
1	About the Lounge category	2016-06-14 16:53:33.049975	2016-06-14 16:53:32.960517	2016-06-14 16:53:33.22657	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	2	t	0	f	f	2016-06-14 16:53:33.049975	f	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	\N	about-the-lounge-category	\N	\N	\N	\N	1	11	A category exclusive to members with trust level 3 and higher.	f	f	\N	\N	About the Lounge category
8	Welcome to Discourse	2016-06-14 16:53:34.379022	2016-06-14 16:53:34.346582	2016-06-14 16:53:34.401198	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	/images/welcome/discourse-edit-post-animated.gif	0	0	0	0	1	t	0	f	f	2016-06-14 16:53:34.379022	f	0	regular	\N	0	0	0	0	2016-06-14 16:53:34.417153	0.200000000000000011	0.0714285714285714246	0	\N	welcome-to-discourse	\N	\N	\N	\N	1	95	The first paragraph of this pinned topic will be visible as a welcome message to all new visitors on your homepage. It&#39;s important! \n\nEdit this into a brief description of your community: \n\n\nWho is it for?\nWhat can they &hellip;	t	f	\N	\N	Welcome to Discourse
6	Privacy Policy	2016-06-14 16:53:34.209807	2016-06-14 16:53:34.099037	2016-06-14 16:53:34.235162	0	2	-1	-1	0	\N	\N	\N	\N	\N	2	\N	0	0	0	0	4	t	0	f	f	2016-06-14 16:53:34.209807	f	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	\N	privacy-policy	\N	\N	\N	\N	1	822	What information do we collect?\n\nWe collect information from you when you register on our site and gather data when you participate in the forum by reading, writing, and evaluating the content shared here. \n\nWhen regi&hellip;	f	f	\N	\N	Privacy Policy
15	Haltestellen - Datensätze - opendata.swiss	2016-06-15 09:03:12.987275	2016-06-15 08:52:08.408513	2016-06-15 09:03:13.104944	1	2	5	6	0	\N	\N	\N	\N	\N	2	\N	0	0	0	0	5	t	0	f	f	2016-06-15 09:03:12.987275	f	0	regular	\N	0	0	0	0	\N	0.300000000000000044	0	0	\N	haltestellen-datensaetze-opendata-swiss	\N	\N	\N	\N	2	106	Haltestellen\n            \n            \n              \n                 \n                  Follower\n                  0\n                 \n              \n            \n            \n   &hellip;	f	f	\N	\N	Haltestellen - Datensätze - opendata.swiss
12	About the ckan category	\N	2016-06-15 08:17:58.700109	2016-06-15 08:17:58.700109	0	1	4	4	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	5	t	0	f	f	2016-06-15 08:17:58.700366	f	0	regular	\N	0	0	0	0	2016-06-15 08:17:58.697579	0	1	0	\N	about-the-ckan-category	\N	\N	\N	\N	1	\N	\N	f	f	\N	\N	About the ckan category
7	Assets for the site design	2016-06-14 16:53:34.293732	2016-06-14 16:53:34.257317	2016-06-14 16:53:34.324922	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	4	t	0	f	f	2016-06-14 16:53:34.293732	f	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	\N	assets-for-the-site-design	\N	\N	\N	\N	1	138	This is a permanent topic, visible only to staff, for storing images and files used in the site design. Don&#39;t delete it! \n\nHere&#39;s how: \n\n\nReply to this topic.\nUpload all the images you wish to use for logos, favicons, an&hellip;	f	f	\N	\N	Assets for the site design
14	Willkommen bei Discourse!	2016-06-15 08:22:18.362278	2016-06-15 08:22:18.333991	2016-06-15 08:22:18.545828	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	http://discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png	0	0	0	0	\N	t	0	f	f	2016-06-15 08:22:18.362278	f	0	private_message	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	system_message	willkommen-bei-discourse	\N	\N	\N	\N	1	825	Danke fürs Anmelden bei Discourse, sei willkommen! \n\nHier sind einige Tipps um dir den Einstieg zu erleichtern. \n\nLesen\n\nUm mehr zu lesen scrolle einfach weiter nach unten! \n\nWenn neue Beiträge ankommen werden erscheinen&hellip;	f	f	\N	\N	Willkommen bei Discourse!
13	Welcome to Discourse!	2016-06-15 08:19:42.346313	2016-06-15 08:19:42.309413	2016-06-15 08:19:42.429911	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	http://discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png	0	0	0	0	\N	t	0	f	f	2016-06-15 08:19:42.346313	f	0	private_message	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	system_message	welcome-to-discourse	\N	\N	\N	\N	1	810	Thanks for joining Discourse, and welcome! \n\nHere are a few quick tips to get you started: \n\nReading\n\nTo read more, just keep scrolling down! \n\nAs new replies or new topics arrive, they will appear automatically – no nee&hellip;	f	f	\N	\N	Welcome to Discourse!
5	FAQ/Guidelines	2016-06-14 16:53:34.050751	2016-06-14 16:53:33.903235	2016-06-14 16:53:34.075883	0	2	-1	-1	0	\N	\N	\N	\N	\N	2	\N	0	0	0	0	4	t	0	f	f	2016-06-14 16:53:34.050751	f	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	\N	faq-guidelines	\N	\N	\N	\N	1	949	This is a Civilized Place for Public Discussion\n\nPlease treat this discussion forum with the same respect you would a public park.  We, too, are a shared community resource — a place to share skills, knowledge and int&hellip;	f	f	\N	\N	FAQ/Guidelines
3	About the Staff category	2016-06-14 16:53:33.428943	2016-06-14 16:53:33.392585	2016-06-14 16:53:33.452911	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	4	t	0	f	f	2016-06-14 16:53:33.428943	f	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	\N	about-the-staff-category	\N	\N	\N	\N	1	13	Private category for staff discussions. Topics are only visible to admins and moderators.	f	f	\N	\N	About the Staff category
2	About the Site Feedback category	2016-06-14 16:53:33.318374	2016-06-14 16:53:33.276157	2016-06-14 16:53:33.336267	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	3	t	0	f	f	2016-06-14 16:53:33.318374	f	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	\N	about-the-site-feedback-category	\N	\N	\N	\N	1	15	Discussion about this site, its organization, how it works, and how we can improve it.	f	f	\N	\N	About the Site Feedback category
10	READ ME FIRST: Admin Quick Start Guide	2016-06-14 16:53:34.628167	2016-06-14 16:53:34.522861	2016-06-14 16:53:34.925497	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	4	t	0	f	f	2016-06-14 16:53:34.628167	f	0	regular	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	\N	read-me-first-admin-quick-start-guide	\N	\N	\N	\N	1	2416	Congratulations, you are now the proud owner of your very own Civilized Discourse Construction Kit. :hatching_chick: \n\nAdmin Dashboard\n\nAs an admin you have total control over this Discourse instance. Exercise your admin&hellip;	f	f	\N	\N	READ ME FIRST: Admin Quick Start Guide
9	Welcome to the Lounge	2016-06-14 16:53:34.455305	2016-06-14 16:53:34.423585	2016-06-14 16:53:34.495972	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	\N	0	0	0	0	2	t	0	f	f	2016-06-14 16:53:34.455305	f	0	regular	\N	0	0	0	0	2016-06-14 16:53:34.515573	0.200000000000000011	0.0714285714285714246	0	\N	welcome-to-the-lounge	\N	\N	\N	\N	1	133	Congratulations! :confetti_ball: \n\nIf you can see this topic, you were recently promoted to regular (trust level 3). \n\nYou can now … \n\n\nEdit the title of any topic\nChange the category of any topic\nHave all your links fol&hellip;	f	f	\N	\N	Welcome to the Lounge
11	Welcome to Discourse!	2016-06-15 08:17:09.509067	2016-06-15 08:17:09.376488	2016-06-15 08:17:09.912991	0	1	-1	-1	0	\N	\N	\N	\N	\N	1	http://discourse.ogdch.dev/images/welcome/topic-list-select-areas-2x.png	0	0	0	0	\N	t	0	f	f	2016-06-15 08:17:09.509067	f	0	private_message	\N	0	0	0	0	\N	0.200000000000000011	0.0714285714285714246	0	system_message	welcome-to-discourse	\N	\N	\N	\N	1	810	Thanks for joining Discourse, and welcome! \n\nHere are a few quick tips to get you started: \n\nReading\n\nTo read more, just keep scrolling down! \n\nAs new replies or new topics arrive, they will appear automatically – no nee&hellip;	f	f	\N	\N	Welcome to Discourse!
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('topics_id_seq', 15, true);


--
-- Data for Name: translation_overrides; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY translation_overrides (id, locale, translation_key, value, created_at, updated_at, compiled_js) FROM stdin;
\.


--
-- Name: translation_overrides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('translation_overrides_id_seq', 1, false);


--
-- Data for Name: twitter_user_infos; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY twitter_user_infos (id, user_id, screen_name, twitter_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: twitter_user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('twitter_user_infos_id_seq', 1, false);


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY uploads (id, user_id, original_filename, filesize, width, height, url, created_at, updated_at, sha1, origin, retain_hours) FROM stdin;
1	-1	gravatar.png	15021	360	360	/uploads/default/original/1X/8ceafb73e38cfe6dac9f70e5a327874a8b0971e2.png	2016-06-14 16:57:51.322477	2016-06-14 16:57:51.325745	8ceafb73e38cfe6dac9f70e5a327874a8b0971e2	http://www.gravatar.com/avatar/56ef6e0c7fc2d68d83a6d7ab195da32c.png?s=360&d=404	\N
\.


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('uploads_id_seq', 1, true);


--
-- Data for Name: user_actions; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_actions (id, action_type, user_id, target_topic_id, target_post_id, target_user_id, acting_user_id, created_at, updated_at, queued_post_id) FROM stdin;
1	4	-1	1	-1	\N	-1	2016-06-14 16:53:32.960517	2016-06-14 16:53:32.997902	\N
2	4	-1	2	-1	\N	-1	2016-06-14 16:53:33.276157	2016-06-14 16:53:33.293726	\N
3	4	-1	3	-1	\N	-1	2016-06-14 16:53:33.392585	2016-06-14 16:53:33.407702	\N
4	4	-1	4	-1	\N	-1	2016-06-14 16:53:33.533301	2016-06-14 16:53:33.568918	\N
5	5	-1	4	5	\N	-1	2016-06-14 16:53:33.849161	2016-06-14 16:53:33.863473	\N
6	4	-1	5	-1	\N	-1	2016-06-14 16:53:33.903235	2016-06-14 16:53:33.919739	\N
7	5	-1	5	7	\N	-1	2016-06-14 16:53:34.050751	2016-06-14 16:53:34.061808	\N
8	4	-1	6	-1	\N	-1	2016-06-14 16:53:34.099037	2016-06-14 16:53:34.117491	\N
9	5	-1	6	9	\N	-1	2016-06-14 16:53:34.209807	2016-06-14 16:53:34.221168	\N
10	4	-1	7	-1	\N	-1	2016-06-14 16:53:34.257317	2016-06-14 16:53:34.276131	\N
11	4	-1	8	-1	\N	-1	2016-06-14 16:53:34.346582	2016-06-14 16:53:34.362764	\N
12	4	-1	9	-1	\N	-1	2016-06-14 16:53:34.423585	2016-06-14 16:53:34.439117	\N
13	4	-1	10	-1	\N	-1	2016-06-14 16:53:34.522861	2016-06-14 16:53:34.586743	\N
14	12	-1	11	-1	\N	-1	2016-06-15 08:17:09.376488	2016-06-15 08:17:09.448942	\N
15	13	4	11	-1	\N	-1	2016-06-15 08:17:09.376488	2016-06-15 08:17:09.486893	\N
16	4	4	12	-1	\N	4	2016-06-15 08:17:58.700109	2016-06-15 08:17:58.709033	\N
17	12	-1	13	-1	\N	-1	2016-06-15 08:19:42.309413	2016-06-15 08:19:42.32028	\N
18	13	5	13	-1	\N	-1	2016-06-15 08:19:42.309413	2016-06-15 08:19:42.325699	\N
19	12	-1	14	-1	\N	-1	2016-06-15 08:22:18.333991	2016-06-15 08:22:18.342916	\N
20	13	6	14	-1	\N	-1	2016-06-15 08:22:18.333991	2016-06-15 08:22:18.347599	\N
21	4	5	15	-1	\N	5	2016-06-15 08:52:08.408513	2016-06-15 08:52:08.443741	\N
22	5	6	15	19	\N	6	2016-06-15 09:03:12.987275	2016-06-15 09:03:13.005126	\N
\.


--
-- Name: user_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_actions_id_seq', 22, true);


--
-- Data for Name: user_archived_messages; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_archived_messages (id, user_id, topic_id, created_at, updated_at) FROM stdin;
1	-1	11	2016-06-15 08:17:10.076282	2016-06-15 08:17:10.076282
2	-1	13	2016-06-15 08:19:42.49477	2016-06-15 08:19:42.49477
3	-1	14	2016-06-15 08:22:18.58872	2016-06-15 08:22:18.58872
\.


--
-- Name: user_archived_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_archived_messages_id_seq', 3, true);


--
-- Data for Name: user_avatars; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_avatars (id, user_id, custom_upload_id, gravatar_upload_id, last_gravatar_download_attempt, created_at, updated_at) FROM stdin;
1	-1	\N	1	2016-06-14 16:57:50.255607	2016-06-14 16:53:32.828354	2016-06-14 16:57:51.328343
2	1	\N	\N	2016-06-15 07:56:03.292411	2016-06-15 07:55:50.855332	2016-06-15 07:56:03.605012
3	2	\N	\N	2016-06-15 08:00:17.076742	2016-06-15 08:00:12.739628	2016-06-15 08:00:17.37661
4	3	\N	\N	2016-06-15 08:14:54.660132	2016-06-15 08:14:42.94257	2016-06-15 08:14:55.184708
5	4	\N	\N	2016-06-15 08:17:12.545718	2016-06-15 08:17:01.263318	2016-06-15 08:17:12.707762
6	5	\N	\N	2016-06-15 08:19:37.82215	2016-06-15 08:19:28.454674	2016-06-15 08:19:37.984106
7	6	\N	\N	2016-06-15 08:22:20.287983	2016-06-15 08:22:18.296145	2016-06-15 08:22:20.454923
\.


--
-- Name: user_avatars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_avatars_id_seq', 7, true);


--
-- Data for Name: user_badges; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_badges (id, badge_id, user_id, granted_at, granted_by_id, post_id, notification_id, seq) FROM stdin;
1	41	-1	2016-06-14 16:57:40.793582	-1	11	1	0
2	10	6	2016-06-15 09:03:12.987275	-1	\N	6	0
\.


--
-- Name: user_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_badges_id_seq', 2, true);


--
-- Data for Name: user_custom_fields; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_custom_fields (id, user_id, name, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_custom_fields_id_seq', 1, false);


--
-- Data for Name: user_exports; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_exports (id, file_name, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_exports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_exports_id_seq', 1, false);


--
-- Data for Name: user_field_options; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_field_options (id, user_field_id, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_field_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_field_options_id_seq', 1, false);


--
-- Data for Name: user_fields; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_fields (id, name, field_type, created_at, updated_at, editable, description, required, show_on_profile, "position", show_on_user_card) FROM stdin;
\.


--
-- Name: user_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_fields_id_seq', 1, false);


--
-- Data for Name: user_histories; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_histories (id, action, acting_user_id, target_user_id, details, created_at, updated_at, context, ip_address, email, subject, previous_value, new_value, topic_id, admin_only, post_id, custom_type, category_id) FROM stdin;
1	3	-1	\N	\N	2016-06-15 08:17:09.431751	2016-06-15 08:17:09.431751	\N	\N	\N	default_trust_level	0	1	\N	t	\N	\N	\N
2	3	-1	\N	\N	2016-06-15 08:17:09.449728	2016-06-15 08:17:09.449728	\N	\N	\N	default_email_digest_frequency	10080	1440	\N	t	\N	\N	\N
3	3	-1	\N	\N	2016-06-15 08:17:09.466151	2016-06-15 08:17:09.466151	\N	\N	\N	bootstrap_mode_enabled	f	t	\N	t	\N	\N	\N
4	28	4	\N	created_at: 2016-06-15 08:17:58 UTC\nname: ckan	2016-06-15 08:17:59.011353	2016-06-15 08:17:59.011353	/c/ckan	\N	\N	\N	\N	\N	\N	f	\N	\N	5
5	3	4	\N	\N	2016-06-15 08:20:46.641599	2016-06-15 08:20:46.641599	\N	\N	\N	bootstrap_mode_min_users	50	0	\N	t	\N	\N	\N
6	3	4	\N	\N	2016-06-15 08:21:07.587912	2016-06-15 08:21:07.587912	\N	\N	\N	default_locale	en	de	\N	t	\N	\N	\N
7	3	4	\N	\N	2016-06-15 08:21:10.072293	2016-06-15 08:21:10.072293	\N	\N	\N	allow_user_locale	f	true	\N	t	\N	\N	\N
8	3	4	\N	\N	2016-06-15 08:21:37.690658	2016-06-15 08:21:37.690658	\N	\N	\N	sso_url		http://ogdch.dev/login	\N	t	\N	\N	\N
9	3	4	\N	\N	2016-06-15 08:21:38.176952	2016-06-15 08:21:38.176952	\N	\N	\N	sso_secret		>/^w4[rhfGMkT{QfD	\N	t	\N	\N	\N
10	3	4	\N	\N	2016-06-15 08:21:39.056727	2016-06-15 08:21:39.056727	\N	\N	\N	enable_sso	f	true	\N	t	\N	\N	\N
\.


--
-- Name: user_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_histories_id_seq', 10, true);


--
-- Data for Name: user_open_ids; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_open_ids (id, user_id, email, url, created_at, updated_at, active) FROM stdin;
\.


--
-- Name: user_open_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_open_ids_id_seq', 1, false);


--
-- Data for Name: user_options; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_options (user_id, email_always, mailing_list_mode, email_digests, email_direct, email_private_messages, external_links_in_new_tab, enable_quoting, dynamic_favicon, disable_jump_reply, edit_history_public, automatically_unpin_topics, digest_after_minutes, auto_track_topics_after_msecs, new_topic_duration_minutes, last_redirected_to_top_at, email_previous_replies, email_in_reply_to, like_notification_frequency, mailing_list_mode_frequency, include_tl0_in_digests) FROM stdin;
1	f	f	t	t	t	f	t	f	f	f	t	10080	240000	2880	\N	2	t	1	0	f
2	f	f	t	t	t	f	t	f	f	f	t	10080	240000	2880	\N	2	t	1	0	f
-1	f	f	t	f	f	f	t	f	f	f	t	10080	240000	2880	\N	2	t	1	0	f
3	f	f	t	t	t	f	t	f	f	f	t	10080	240000	2880	\N	2	t	1	0	f
4	f	f	t	t	t	f	t	f	f	f	t	10080	240000	2880	\N	2	t	1	0	f
5	f	f	t	t	t	f	t	f	f	f	t	1440	240000	2880	\N	2	t	1	0	f
6	f	f	t	t	t	f	t	f	f	f	t	1440	240000	2880	\N	2	t	1	0	f
\.


--
-- Data for Name: user_profile_views; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_profile_views (id, user_profile_id, viewed_at, ip_address, user_id) FROM stdin;
\.


--
-- Name: user_profile_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_profile_views_id_seq', 1, false);


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_profiles (user_id, location, website, bio_raw, bio_cooked, profile_background, dismissed_banner_key, bio_cooked_version, badge_granted_title, card_background, card_image_badge_id, views) FROM stdin;
-1	\N	\N	\N	\N	\N	\N	1	f	\N	\N	0
1	\N	\N	\N	\N	\N	\N	1	f	\N	\N	0
2	\N	\N	\N	\N	\N	\N	1	f	\N	\N	0
3	\N	\N	\N	\N	\N	\N	1	f	\N	\N	0
4	\N	\N	\N	\N	\N	\N	1	f	\N	\N	0
5	\N	\N	\N	\N	\N	\N	1	f	\N	\N	0
6	\N	\N	\N	\N	\N	\N	1	f	\N	\N	0
\.


--
-- Data for Name: user_search_data; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_search_data (user_id, search_data, raw_data, locale) FROM stdin;
-1	'system':1,2	system system	en
1	'ckan':1,2	ckan ckan	en
2	'liip':1,2	liip liip	en
3	'liip':1,2	liip liip	en
4	'liip':1,2	liip liip	en
5	'ckan':1,2	ckan ckan	en
6	'liip':2 'liip1':1	liip1 liip	de
\.


--
-- Data for Name: user_stats; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_stats (user_id, topics_entered, time_read, days_visited, posts_read_count, likes_given, likes_received, topic_reply_count, new_since, read_faq, first_post_created_at, post_count, topic_count, bounce_score, reset_bounce_score_after) FROM stdin;
1	0	0	0	0	0	0	0	2016-06-15 07:55:50.827249	\N	\N	0	0	0	\N
2	0	0	0	0	0	0	0	2016-06-15 08:00:12.726706	\N	\N	0	0	0	\N
3	0	0	0	0	0	0	0	2016-06-15 08:14:42.920384	\N	\N	0	0	0	\N
4	0	0	1	0	0	0	0	2016-06-15 08:17:01.25107	\N	\N	0	0	0	\N
-1	0	0	0	16	0	0	0	2016-06-14 16:53:32.754316	\N	2016-06-14 16:53:33.049975	13	10	0	\N
5	0	0	1	1	0	0	0	2016-06-15 08:19:28.434453	\N	2016-06-15 08:52:08.475689	1	1	0	\N
6	1	23	1	2	0	0	1	2016-06-15 08:22:18.26609	\N	2016-06-15 09:03:12.987275	1	0	0	\N
\.


--
-- Data for Name: user_visits; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY user_visits (id, user_id, visited_at, posts_read, mobile) FROM stdin;
1	4	2016-06-15	0	f
2	5	2016-06-15	0	f
3	6	2016-06-15	1	f
\.


--
-- Name: user_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('user_visits_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY users (id, username, created_at, updated_at, name, seen_notification_id, last_posted_at, email, password_hash, salt, active, username_lower, auth_token, last_seen_at, admin, last_emailed_at, trust_level, approved, approved_by_id, approved_at, previous_visit_at, suspended_at, suspended_till, date_of_birth, views, flag_level, ip_address, moderator, blocked, title, uploaded_avatar_id, locale, primary_group_id, registration_ip_address, trust_level_locked, staged, first_seen_at) FROM stdin;
6	liip1	2016-06-15 08:22:18.257251	2016-06-15 09:03:13.122464	liip	6	2016-06-15 09:03:12.987275	jazz@liip.ch	\N	\N	t	liip1	420c813e5126c4dd8da911c79031e08a	2016-06-15 09:22:40.16083	f	\N	1	f	\N	\N	\N	\N	\N	\N	0	0	127.0.0.1	f	f	\N	\N	\N	\N	\N	f	f	2016-06-15 08:22:18.509209
4	liip	2016-06-15 08:17:01.247028	2016-06-15 08:22:13.232926	liip	2	\N	be-staff@liip.ch	7963a792283483fc8eb04526b057bcb636d63f81f7934d516c39370cce6aa9e0	f4f85a81fb7df9b886cdd3ee87639c64	t	liip	\N	2016-06-15 08:22:11.557751	t	2016-06-15 08:17:01.297149	0	f	\N	\N	\N	\N	\N	\N	0	0	127.0.0.1	f	f	\N	\N	en	\N	127.0.0.1	f	f	2016-06-15 08:17:11.165896
-1	system	2016-06-14 16:53:32.741429	2016-06-15 08:22:18.55136	system	0	2016-06-15 08:22:18.362278	no_email	9c01ad29672490d7a4207ce3c3762e6dc0ab7f9bd31286a6c8329630ecf4a580	b177037718770f8d85b9549298c44292	t	system	\N	\N	t	\N	4	t	\N	\N	\N	\N	\N	\N	0	0	\N	t	f	\N	1	\N	\N	\N	f	f	\N
5	ckan	2016-06-15 08:19:28.428679	2016-06-15 08:52:08.537955	ckan	0	2016-06-15 08:52:08.475689	ckan@liip.ch	48204f7ae5c77eeacc961318fbf0ec12e2e8cf4ddf20704d2d2cdf184ec8eb6a	a7aa87027333c344951ec49f9e4a57db	t	ckan	f8f69e342985f7d4c505de212461ab6a	2016-06-15 08:19:43.538793	f	2016-06-15 08:19:28.574381	1	f	\N	\N	\N	\N	\N	\N	0	0	127.0.0.1	f	f	\N	\N	en	\N	127.0.0.1	f	f	2016-06-15 08:19:43.538793
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('users_id_seq', 6, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY versions (id, versioned_id, versioned_type, user_id, user_type, user_name, modifications, number, reverted_from, tag, created_at, updated_at) FROM stdin;
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('versions_id_seq', 1, false);


--
-- Data for Name: warnings; Type: TABLE DATA; Schema: public; Owner: discourse
--

COPY warnings (id, topic_id, user_id, created_by_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: warnings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: discourse
--

SELECT pg_catalog.setval('warnings_id_seq', 1, false);


--
-- Name: api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: application_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY application_requests
    ADD CONSTRAINT application_requests_pkey PRIMARY KEY (id);


--
-- Name: badge_groupings_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY badge_groupings
    ADD CONSTRAINT badge_groupings_pkey PRIMARY KEY (id);


--
-- Name: badge_types_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY badge_types
    ADD CONSTRAINT badge_types_pkey PRIMARY KEY (id);


--
-- Name: badges_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_search_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_search_data
    ADD CONSTRAINT categories_search_pkey PRIMARY KEY (category_id);


--
-- Name: category_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_custom_fields
    ADD CONSTRAINT category_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: category_featured_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_featured_topics
    ADD CONSTRAINT category_featured_topics_pkey PRIMARY KEY (id);


--
-- Name: category_featured_users_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_featured_users
    ADD CONSTRAINT category_featured_users_pkey PRIMARY KEY (id);


--
-- Name: category_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_groups
    ADD CONSTRAINT category_groups_pkey PRIMARY KEY (id);


--
-- Name: category_tag_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_tag_groups
    ADD CONSTRAINT category_tag_groups_pkey PRIMARY KEY (id);


--
-- Name: category_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_tags
    ADD CONSTRAINT category_tags_pkey PRIMARY KEY (id);


--
-- Name: category_users_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY category_users
    ADD CONSTRAINT category_users_pkey PRIMARY KEY (id);


--
-- Name: color_scheme_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY color_scheme_colors
    ADD CONSTRAINT color_scheme_colors_pkey PRIMARY KEY (id);


--
-- Name: color_schemes_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY color_schemes
    ADD CONSTRAINT color_schemes_pkey PRIMARY KEY (id);


--
-- Name: digest_unsubscribe_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY digest_unsubscribe_keys
    ADD CONSTRAINT digest_unsubscribe_keys_pkey PRIMARY KEY (key);


--
-- Name: directory_items_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY directory_items
    ADD CONSTRAINT directory_items_pkey PRIMARY KEY (id);


--
-- Name: draft_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY draft_sequences
    ADD CONSTRAINT draft_sequences_pkey PRIMARY KEY (id);


--
-- Name: drafts_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY drafts
    ADD CONSTRAINT drafts_pkey PRIMARY KEY (id);


--
-- Name: email_change_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY email_change_requests
    ADD CONSTRAINT email_change_requests_pkey PRIMARY KEY (id);


--
-- Name: email_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY email_logs
    ADD CONSTRAINT email_logs_pkey PRIMARY KEY (id);


--
-- Name: email_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY email_tokens
    ADD CONSTRAINT email_tokens_pkey PRIMARY KEY (id);


--
-- Name: embeddable_hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY embeddable_hosts
    ADD CONSTRAINT embeddable_hosts_pkey PRIMARY KEY (id);


--
-- Name: facebook_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY facebook_user_infos
    ADD CONSTRAINT facebook_user_infos_pkey PRIMARY KEY (id);


--
-- Name: github_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY github_user_infos
    ADD CONSTRAINT github_user_infos_pkey PRIMARY KEY (id);


--
-- Name: google_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY google_user_infos
    ADD CONSTRAINT google_user_infos_pkey PRIMARY KEY (id);


--
-- Name: group_archived_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY group_archived_messages
    ADD CONSTRAINT group_archived_messages_pkey PRIMARY KEY (id);


--
-- Name: group_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY group_custom_fields
    ADD CONSTRAINT group_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: group_mentions_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY group_mentions
    ADD CONSTRAINT group_mentions_pkey PRIMARY KEY (id);


--
-- Name: group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY group_users
    ADD CONSTRAINT group_users_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: incoming_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY incoming_domains
    ADD CONSTRAINT incoming_domains_pkey PRIMARY KEY (id);


--
-- Name: incoming_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY incoming_emails
    ADD CONSTRAINT incoming_emails_pkey PRIMARY KEY (id);


--
-- Name: incoming_links_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY incoming_links
    ADD CONSTRAINT incoming_links_pkey PRIMARY KEY (id);


--
-- Name: incoming_referers_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY incoming_referers
    ADD CONSTRAINT incoming_referers_pkey PRIMARY KEY (id);


--
-- Name: instagram_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY instagram_user_infos
    ADD CONSTRAINT instagram_user_infos_pkey PRIMARY KEY (id);


--
-- Name: invited_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY invited_groups
    ADD CONSTRAINT invited_groups_pkey PRIMARY KEY (id);


--
-- Name: invites_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: message_bus_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY message_bus
    ADD CONSTRAINT message_bus_pkey PRIMARY KEY (id);


--
-- Name: muted_users_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY muted_users
    ADD CONSTRAINT muted_users_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: oauth2_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY oauth2_user_infos
    ADD CONSTRAINT oauth2_user_infos_pkey PRIMARY KEY (id);


--
-- Name: onceoff_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY onceoff_logs
    ADD CONSTRAINT onceoff_logs_pkey PRIMARY KEY (id);


--
-- Name: optimized_images_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY optimized_images
    ADD CONSTRAINT optimized_images_pkey PRIMARY KEY (id);


--
-- Name: permalinks_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY permalinks
    ADD CONSTRAINT permalinks_pkey PRIMARY KEY (id);


--
-- Name: plugin_store_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY plugin_store_rows
    ADD CONSTRAINT plugin_store_rows_pkey PRIMARY KEY (id);


--
-- Name: post_action_types_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_action_types
    ADD CONSTRAINT post_action_types_pkey PRIMARY KEY (id);


--
-- Name: post_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_actions
    ADD CONSTRAINT post_actions_pkey PRIMARY KEY (id);


--
-- Name: post_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_custom_fields
    ADD CONSTRAINT post_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: post_details_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_details
    ADD CONSTRAINT post_details_pkey PRIMARY KEY (id);


--
-- Name: post_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_revisions
    ADD CONSTRAINT post_revisions_pkey PRIMARY KEY (id);


--
-- Name: post_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_stats
    ADD CONSTRAINT post_stats_pkey PRIMARY KEY (id);


--
-- Name: post_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_uploads
    ADD CONSTRAINT post_uploads_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_search_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY post_search_data
    ADD CONSTRAINT posts_search_pkey PRIMARY KEY (post_id);


--
-- Name: queued_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY queued_posts
    ADD CONSTRAINT queued_posts_pkey PRIMARY KEY (id);


--
-- Name: quoted_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY quoted_posts
    ADD CONSTRAINT quoted_posts_pkey PRIMARY KEY (id);


--
-- Name: scheduler_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY scheduler_stats
    ADD CONSTRAINT scheduler_stats_pkey PRIMARY KEY (id);


--
-- Name: schema_migration_details_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY schema_migration_details
    ADD CONSTRAINT schema_migration_details_pkey PRIMARY KEY (id);


--
-- Name: screened_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY screened_emails
    ADD CONSTRAINT screened_emails_pkey PRIMARY KEY (id);


--
-- Name: screened_ip_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY screened_ip_addresses
    ADD CONSTRAINT screened_ip_addresses_pkey PRIMARY KEY (id);


--
-- Name: screened_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY screened_urls
    ADD CONSTRAINT screened_urls_pkey PRIMARY KEY (id);


--
-- Name: single_sign_on_records_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY single_sign_on_records
    ADD CONSTRAINT single_sign_on_records_pkey PRIMARY KEY (id);


--
-- Name: site_customizations_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY site_customizations
    ADD CONSTRAINT site_customizations_pkey PRIMARY KEY (id);


--
-- Name: site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: stylesheet_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY stylesheet_cache
    ADD CONSTRAINT stylesheet_cache_pkey PRIMARY KEY (id);


--
-- Name: tag_group_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY tag_group_memberships
    ADD CONSTRAINT tag_group_memberships_pkey PRIMARY KEY (id);


--
-- Name: tag_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY tag_groups
    ADD CONSTRAINT tag_groups_pkey PRIMARY KEY (id);


--
-- Name: tag_users_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY tag_users
    ADD CONSTRAINT tag_users_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: top_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY top_topics
    ADD CONSTRAINT top_topics_pkey PRIMARY KEY (id);


--
-- Name: topic_allowed_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_allowed_groups
    ADD CONSTRAINT topic_allowed_groups_pkey PRIMARY KEY (id);


--
-- Name: topic_allowed_users_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_allowed_users
    ADD CONSTRAINT topic_allowed_users_pkey PRIMARY KEY (id);


--
-- Name: topic_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_custom_fields
    ADD CONSTRAINT topic_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: topic_embeds_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_embeds
    ADD CONSTRAINT topic_embeds_pkey PRIMARY KEY (id);


--
-- Name: topic_invites_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_invites
    ADD CONSTRAINT topic_invites_pkey PRIMARY KEY (id);


--
-- Name: topic_link_clicks_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_link_clicks
    ADD CONSTRAINT topic_link_clicks_pkey PRIMARY KEY (id);


--
-- Name: topic_links_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_links
    ADD CONSTRAINT topic_links_pkey PRIMARY KEY (id);


--
-- Name: topic_search_data_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_search_data
    ADD CONSTRAINT topic_search_data_pkey PRIMARY KEY (topic_id);


--
-- Name: topic_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_tags
    ADD CONSTRAINT topic_tags_pkey PRIMARY KEY (id);


--
-- Name: topic_users_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topic_users
    ADD CONSTRAINT topic_users_pkey PRIMARY KEY (id);


--
-- Name: topics_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: translation_overrides_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY translation_overrides
    ADD CONSTRAINT translation_overrides_pkey PRIMARY KEY (id);


--
-- Name: twitter_user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY twitter_user_infos
    ADD CONSTRAINT twitter_user_infos_pkey PRIMARY KEY (id);


--
-- Name: uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);


--
-- Name: user_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_actions
    ADD CONSTRAINT user_actions_pkey PRIMARY KEY (id);


--
-- Name: user_archived_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_archived_messages
    ADD CONSTRAINT user_archived_messages_pkey PRIMARY KEY (id);


--
-- Name: user_avatars_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_avatars
    ADD CONSTRAINT user_avatars_pkey PRIMARY KEY (id);


--
-- Name: user_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_badges
    ADD CONSTRAINT user_badges_pkey PRIMARY KEY (id);


--
-- Name: user_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_custom_fields
    ADD CONSTRAINT user_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: user_exports_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_exports
    ADD CONSTRAINT user_exports_pkey PRIMARY KEY (id);


--
-- Name: user_field_options_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_field_options
    ADD CONSTRAINT user_field_options_pkey PRIMARY KEY (id);


--
-- Name: user_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_fields
    ADD CONSTRAINT user_fields_pkey PRIMARY KEY (id);


--
-- Name: user_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_histories
    ADD CONSTRAINT user_histories_pkey PRIMARY KEY (id);


--
-- Name: user_open_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_open_ids
    ADD CONSTRAINT user_open_ids_pkey PRIMARY KEY (id);


--
-- Name: user_profile_views_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_profile_views
    ADD CONSTRAINT user_profile_views_pkey PRIMARY KEY (id);


--
-- Name: user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (user_id);


--
-- Name: user_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_stats
    ADD CONSTRAINT user_stats_pkey PRIMARY KEY (user_id);


--
-- Name: user_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_visits
    ADD CONSTRAINT user_visits_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_search_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY user_search_data
    ADD CONSTRAINT users_search_pkey PRIMARY KEY (user_id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: warnings_pkey; Type: CONSTRAINT; Schema: public; Owner: discourse
--

ALTER TABLE ONLY warnings
    ADD CONSTRAINT warnings_pkey PRIMARY KEY (id);


--
-- Name: by_link; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX by_link ON topic_link_clicks USING btree (topic_link_id);


--
-- Name: by_queue_status; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX by_queue_status ON queued_posts USING btree (queue, state, created_at);


--
-- Name: by_queue_status_topic; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX by_queue_status_topic ON queued_posts USING btree (topic_id, queue, state, created_at);


--
-- Name: cat_featured_threads; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX cat_featured_threads ON category_featured_topics USING btree (category_id, topic_id);


--
-- Name: idx_category_tag_groups_ix1; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_category_tag_groups_ix1 ON category_tag_groups USING btree (category_id, tag_group_id);


--
-- Name: idx_category_tags_ix1; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_category_tags_ix1 ON category_tags USING btree (category_id, tag_id);


--
-- Name: idx_category_tags_ix2; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_category_tags_ix2 ON category_tags USING btree (tag_id, category_id);


--
-- Name: idx_category_users_u1; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_category_users_u1 ON category_users USING btree (user_id, category_id, notification_level);


--
-- Name: idx_category_users_u2; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_category_users_u2 ON category_users USING btree (category_id, user_id, notification_level);


--
-- Name: idx_notifications_speedup_unread_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_notifications_speedup_unread_count ON notifications USING btree (user_id, notification_type) WHERE (NOT read);


--
-- Name: idx_posts_created_at_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_posts_created_at_topic_id ON posts USING btree (created_at, topic_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_posts_user_id_deleted_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_posts_user_id_deleted_at ON posts USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_search_category; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_search_category ON category_search_data USING gin (search_data);


--
-- Name: idx_search_post; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_search_post ON post_search_data USING gin (search_data);


--
-- Name: idx_search_topic; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_search_topic ON topic_search_data USING gin (search_data);


--
-- Name: idx_search_user; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_search_user ON user_search_data USING gin (search_data);


--
-- Name: idx_tag_users_ix1; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_tag_users_ix1 ON tag_users USING btree (user_id, tag_id, notification_level);


--
-- Name: idx_tag_users_ix2; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_tag_users_ix2 ON tag_users USING btree (tag_id, user_id, notification_level);


--
-- Name: idx_topics_front_page; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_topics_front_page ON topics USING btree (deleted_at, visible, archetype, category_id, id);


--
-- Name: idx_topics_user_id_deleted_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_topics_user_id_deleted_at ON topics USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_unique_actions; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_unique_actions ON post_actions USING btree (user_id, post_action_type_id, post_id, targets_topic) WHERE ((deleted_at IS NULL) AND (disagreed_at IS NULL) AND (deferred_at IS NULL));


--
-- Name: idx_unique_flags; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_unique_flags ON post_actions USING btree (user_id, post_id, targets_topic) WHERE ((deleted_at IS NULL) AND (disagreed_at IS NULL) AND (deferred_at IS NULL) AND (post_action_type_id = ANY (ARRAY[3, 4, 7, 8])));


--
-- Name: idx_unique_post_uploads; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_unique_post_uploads ON post_uploads USING btree (post_id, upload_id);


--
-- Name: idx_unique_rows; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX idx_unique_rows ON user_actions USING btree (action_type, user_id, target_topic_id, target_post_id, acting_user_id);


--
-- Name: idx_user_actions_speed_up_user_all; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_user_actions_speed_up_user_all ON user_actions USING btree (user_id, created_at, action_type);


--
-- Name: idx_users_admin; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_users_admin ON users USING btree (id) WHERE admin;


--
-- Name: idx_users_moderator; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX idx_users_moderator ON users USING btree (id) WHERE moderator;


--
-- Name: index_api_keys_on_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_api_keys_on_key ON api_keys USING btree (key);


--
-- Name: index_api_keys_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_api_keys_on_user_id ON api_keys USING btree (user_id);


--
-- Name: index_application_requests_on_date_and_req_type; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_application_requests_on_date_and_req_type ON application_requests USING btree (date, req_type);


--
-- Name: index_badge_types_on_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_badge_types_on_name ON badge_types USING btree (name);


--
-- Name: index_badges_on_badge_type_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_badges_on_badge_type_id ON badges USING btree (badge_type_id);


--
-- Name: index_badges_on_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_badges_on_name ON badges USING btree (name);


--
-- Name: index_categories_on_email_in; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_categories_on_email_in ON categories USING btree (email_in);


--
-- Name: index_categories_on_topic_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_categories_on_topic_count ON categories USING btree (topic_count);


--
-- Name: index_category_custom_fields_on_category_id_and_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_category_custom_fields_on_category_id_and_name ON category_custom_fields USING btree (category_id, name);


--
-- Name: index_category_featured_topics_on_category_id_and_rank; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_category_featured_topics_on_category_id_and_rank ON category_featured_topics USING btree (category_id, rank);


--
-- Name: index_category_featured_users_on_category_id_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_category_featured_users_on_category_id_and_user_id ON category_featured_users USING btree (category_id, user_id);


--
-- Name: index_color_scheme_colors_on_color_scheme_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_color_scheme_colors_on_color_scheme_id ON color_scheme_colors USING btree (color_scheme_id);


--
-- Name: index_digest_unsubscribe_keys_on_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_digest_unsubscribe_keys_on_created_at ON digest_unsubscribe_keys USING btree (created_at);


--
-- Name: index_directory_items_on_period_type_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_directory_items_on_period_type_and_user_id ON directory_items USING btree (period_type, user_id);


--
-- Name: index_draft_sequences_on_user_id_and_draft_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_draft_sequences_on_user_id_and_draft_key ON draft_sequences USING btree (user_id, draft_key);


--
-- Name: index_drafts_on_user_id_and_draft_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_drafts_on_user_id_and_draft_key ON drafts USING btree (user_id, draft_key);


--
-- Name: index_email_change_requests_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_email_change_requests_on_user_id ON email_change_requests USING btree (user_id);


--
-- Name: index_email_logs_on_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_email_logs_on_created_at ON email_logs USING btree (created_at DESC);


--
-- Name: index_email_logs_on_message_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_email_logs_on_message_id ON email_logs USING btree (message_id);


--
-- Name: index_email_logs_on_reply_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_email_logs_on_reply_key ON email_logs USING btree (reply_key);


--
-- Name: index_email_logs_on_skipped_and_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_email_logs_on_skipped_and_created_at ON email_logs USING btree (skipped, created_at);


--
-- Name: index_email_logs_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_email_logs_on_user_id_and_created_at ON email_logs USING btree (user_id, created_at DESC);


--
-- Name: index_email_tokens_on_token; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_email_tokens_on_token ON email_tokens USING btree (token);


--
-- Name: index_email_tokens_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_email_tokens_on_user_id ON email_tokens USING btree (user_id);


--
-- Name: index_facebook_user_infos_on_facebook_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_facebook_user_infos_on_facebook_user_id ON facebook_user_infos USING btree (facebook_user_id);


--
-- Name: index_facebook_user_infos_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_facebook_user_infos_on_user_id ON facebook_user_infos USING btree (user_id);


--
-- Name: index_github_user_infos_on_github_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_github_user_infos_on_github_user_id ON github_user_infos USING btree (github_user_id);


--
-- Name: index_github_user_infos_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_github_user_infos_on_user_id ON github_user_infos USING btree (user_id);


--
-- Name: index_given_daily_likes_on_limit_reached_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_given_daily_likes_on_limit_reached_and_user_id ON given_daily_likes USING btree (limit_reached, user_id);


--
-- Name: index_given_daily_likes_on_user_id_and_given_date; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_given_daily_likes_on_user_id_and_given_date ON given_daily_likes USING btree (user_id, given_date);


--
-- Name: index_google_user_infos_on_google_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_google_user_infos_on_google_user_id ON google_user_infos USING btree (google_user_id);


--
-- Name: index_google_user_infos_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_google_user_infos_on_user_id ON google_user_infos USING btree (user_id);


--
-- Name: index_group_archived_messages_on_group_id_and_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_group_archived_messages_on_group_id_and_topic_id ON group_archived_messages USING btree (group_id, topic_id);


--
-- Name: index_group_custom_fields_on_group_id_and_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_group_custom_fields_on_group_id_and_name ON group_custom_fields USING btree (group_id, name);


--
-- Name: index_group_mentions_on_group_id_and_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_group_mentions_on_group_id_and_post_id ON group_mentions USING btree (group_id, post_id);


--
-- Name: index_group_mentions_on_post_id_and_group_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_group_mentions_on_post_id_and_group_id ON group_mentions USING btree (post_id, group_id);


--
-- Name: index_group_users_on_group_id_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_group_users_on_group_id_and_user_id ON group_users USING btree (group_id, user_id);


--
-- Name: index_group_users_on_user_id_and_group_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_group_users_on_user_id_and_group_id ON group_users USING btree (user_id, group_id);


--
-- Name: index_groups_on_incoming_email; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_groups_on_incoming_email ON groups USING btree (incoming_email);


--
-- Name: index_groups_on_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_groups_on_name ON groups USING btree (name);


--
-- Name: index_incoming_domains_on_name_and_https_and_port; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_incoming_domains_on_name_and_https_and_port ON incoming_domains USING btree (name, https, port);


--
-- Name: index_incoming_emails_on_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_incoming_emails_on_created_at ON incoming_emails USING btree (created_at);


--
-- Name: index_incoming_emails_on_error; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_incoming_emails_on_error ON incoming_emails USING btree (error);


--
-- Name: index_incoming_emails_on_message_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_incoming_emails_on_message_id ON incoming_emails USING btree (message_id);


--
-- Name: index_incoming_emails_on_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_incoming_emails_on_post_id ON incoming_emails USING btree (post_id);


--
-- Name: index_incoming_links_on_created_at_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_incoming_links_on_created_at_and_user_id ON incoming_links USING btree (created_at, user_id);


--
-- Name: index_incoming_links_on_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_incoming_links_on_post_id ON incoming_links USING btree (post_id);


--
-- Name: index_incoming_referers_on_path_and_incoming_domain_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_incoming_referers_on_path_and_incoming_domain_id ON incoming_referers USING btree (path, incoming_domain_id);


--
-- Name: index_invites_on_email_and_invited_by_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_invites_on_email_and_invited_by_id ON invites USING btree (email, invited_by_id);


--
-- Name: index_invites_on_invite_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_invites_on_invite_key ON invites USING btree (invite_key);


--
-- Name: index_message_bus_on_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_message_bus_on_created_at ON message_bus USING btree (created_at);


--
-- Name: index_muted_users_on_muted_user_id_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_muted_users_on_muted_user_id_and_user_id ON muted_users USING btree (muted_user_id, user_id);


--
-- Name: index_muted_users_on_user_id_and_muted_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_muted_users_on_user_id_and_muted_user_id ON muted_users USING btree (user_id, muted_user_id);


--
-- Name: index_notifications_on_post_action_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_notifications_on_post_action_id ON notifications USING btree (post_action_id);


--
-- Name: index_notifications_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_notifications_on_user_id_and_created_at ON notifications USING btree (user_id, created_at);


--
-- Name: index_notifications_on_user_id_and_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_notifications_on_user_id_and_id ON notifications USING btree (user_id, id) WHERE ((notification_type = 6) AND (NOT read));


--
-- Name: index_notifications_on_user_id_and_topic_id_and_post_number; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_notifications_on_user_id_and_topic_id_and_post_number ON notifications USING btree (user_id, topic_id, post_number);


--
-- Name: index_oauth2_user_infos_on_uid_and_provider; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_oauth2_user_infos_on_uid_and_provider ON oauth2_user_infos USING btree (uid, provider);


--
-- Name: index_onceoff_logs_on_job_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_onceoff_logs_on_job_name ON onceoff_logs USING btree (job_name);


--
-- Name: index_optimized_images_on_upload_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_optimized_images_on_upload_id ON optimized_images USING btree (upload_id);


--
-- Name: index_optimized_images_on_upload_id_and_width_and_height; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_optimized_images_on_upload_id_and_width_and_height ON optimized_images USING btree (upload_id, width, height);


--
-- Name: index_permalinks_on_url; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_permalinks_on_url ON permalinks USING btree (url);


--
-- Name: index_plugin_store_rows_on_plugin_name_and_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_plugin_store_rows_on_plugin_name_and_key ON plugin_store_rows USING btree (plugin_name, key);


--
-- Name: index_post_actions_on_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_post_actions_on_post_id ON post_actions USING btree (post_id);


--
-- Name: index_post_actions_on_user_id_and_post_action_type_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_post_actions_on_user_id_and_post_action_type_id ON post_actions USING btree (user_id, post_action_type_id) WHERE (deleted_at IS NULL);


--
-- Name: index_post_custom_fields_on_name_and_value; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_post_custom_fields_on_name_and_value ON post_custom_fields USING btree (name, "left"(value, 200));


--
-- Name: index_post_custom_fields_on_post_id_and_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_post_custom_fields_on_post_id_and_name ON post_custom_fields USING btree (post_id, name);


--
-- Name: index_post_details_on_post_id_and_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_post_details_on_post_id_and_key ON post_details USING btree (post_id, key);


--
-- Name: index_post_replies_on_post_id_and_reply_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_post_replies_on_post_id_and_reply_id ON post_replies USING btree (post_id, reply_id);


--
-- Name: index_post_revisions_on_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_post_revisions_on_post_id ON post_revisions USING btree (post_id);


--
-- Name: index_post_revisions_on_post_id_and_number; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_post_revisions_on_post_id_and_number ON post_revisions USING btree (post_id, number);


--
-- Name: index_post_stats_on_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_post_stats_on_post_id ON post_stats USING btree (post_id);


--
-- Name: index_post_timings_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_post_timings_on_user_id ON post_timings USING btree (user_id);


--
-- Name: index_posts_on_reply_to_post_number; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_posts_on_reply_to_post_number ON posts USING btree (reply_to_post_number);


--
-- Name: index_posts_on_topic_id_and_post_number; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_posts_on_topic_id_and_post_number ON posts USING btree (topic_id, post_number);


--
-- Name: index_posts_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_posts_on_user_id_and_created_at ON posts USING btree (user_id, created_at);


--
-- Name: index_quoted_posts_on_post_id_and_quoted_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_quoted_posts_on_post_id_and_quoted_post_id ON quoted_posts USING btree (post_id, quoted_post_id);


--
-- Name: index_quoted_posts_on_quoted_post_id_and_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_quoted_posts_on_quoted_post_id_and_post_id ON quoted_posts USING btree (quoted_post_id, post_id);


--
-- Name: index_schema_migration_details_on_version; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_schema_migration_details_on_version ON schema_migration_details USING btree (version);


--
-- Name: index_screened_emails_on_email; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_screened_emails_on_email ON screened_emails USING btree (email);


--
-- Name: index_screened_emails_on_last_match_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_screened_emails_on_last_match_at ON screened_emails USING btree (last_match_at);


--
-- Name: index_screened_ip_addresses_on_ip_address; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_screened_ip_addresses_on_ip_address ON screened_ip_addresses USING btree (ip_address);


--
-- Name: index_screened_ip_addresses_on_last_match_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_screened_ip_addresses_on_last_match_at ON screened_ip_addresses USING btree (last_match_at);


--
-- Name: index_screened_urls_on_last_match_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_screened_urls_on_last_match_at ON screened_urls USING btree (last_match_at);


--
-- Name: index_screened_urls_on_url; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_screened_urls_on_url ON screened_urls USING btree (url);


--
-- Name: index_single_sign_on_records_on_external_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_single_sign_on_records_on_external_id ON single_sign_on_records USING btree (external_id);


--
-- Name: index_site_customizations_on_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_site_customizations_on_key ON site_customizations USING btree (key);


--
-- Name: index_stylesheet_cache_on_target_and_digest; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_stylesheet_cache_on_target_and_digest ON stylesheet_cache USING btree (target, digest);


--
-- Name: index_tag_group_memberships_on_tag_group_id_and_tag_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_tag_group_memberships_on_tag_group_id_and_tag_id ON tag_group_memberships USING btree (tag_group_id, tag_id);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_tags_on_name ON tags USING btree (name);


--
-- Name: index_top_topics_on_daily_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_daily_likes_count ON top_topics USING btree (daily_likes_count DESC);


--
-- Name: index_top_topics_on_daily_op_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_daily_op_likes_count ON top_topics USING btree (daily_op_likes_count);


--
-- Name: index_top_topics_on_daily_posts_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_daily_posts_count ON top_topics USING btree (daily_posts_count DESC);


--
-- Name: index_top_topics_on_daily_views_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_daily_views_count ON top_topics USING btree (daily_views_count DESC);


--
-- Name: index_top_topics_on_monthly_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_monthly_likes_count ON top_topics USING btree (monthly_likes_count DESC);


--
-- Name: index_top_topics_on_monthly_op_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_monthly_op_likes_count ON top_topics USING btree (monthly_op_likes_count);


--
-- Name: index_top_topics_on_monthly_posts_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_monthly_posts_count ON top_topics USING btree (monthly_posts_count DESC);


--
-- Name: index_top_topics_on_monthly_views_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_monthly_views_count ON top_topics USING btree (monthly_views_count DESC);


--
-- Name: index_top_topics_on_quarterly_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_quarterly_likes_count ON top_topics USING btree (quarterly_likes_count);


--
-- Name: index_top_topics_on_quarterly_op_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_quarterly_op_likes_count ON top_topics USING btree (quarterly_op_likes_count);


--
-- Name: index_top_topics_on_quarterly_posts_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_quarterly_posts_count ON top_topics USING btree (quarterly_posts_count);


--
-- Name: index_top_topics_on_quarterly_views_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_quarterly_views_count ON top_topics USING btree (quarterly_views_count);


--
-- Name: index_top_topics_on_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_top_topics_on_topic_id ON top_topics USING btree (topic_id);


--
-- Name: index_top_topics_on_weekly_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_weekly_likes_count ON top_topics USING btree (weekly_likes_count DESC);


--
-- Name: index_top_topics_on_weekly_op_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_weekly_op_likes_count ON top_topics USING btree (weekly_op_likes_count);


--
-- Name: index_top_topics_on_weekly_posts_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_weekly_posts_count ON top_topics USING btree (weekly_posts_count DESC);


--
-- Name: index_top_topics_on_weekly_views_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_weekly_views_count ON top_topics USING btree (weekly_views_count DESC);


--
-- Name: index_top_topics_on_yearly_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_yearly_likes_count ON top_topics USING btree (yearly_likes_count DESC);


--
-- Name: index_top_topics_on_yearly_op_likes_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_yearly_op_likes_count ON top_topics USING btree (yearly_op_likes_count);


--
-- Name: index_top_topics_on_yearly_posts_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_yearly_posts_count ON top_topics USING btree (yearly_posts_count DESC);


--
-- Name: index_top_topics_on_yearly_views_count; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_top_topics_on_yearly_views_count ON top_topics USING btree (yearly_views_count DESC);


--
-- Name: index_topic_allowed_groups_on_group_id_and_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_allowed_groups_on_group_id_and_topic_id ON topic_allowed_groups USING btree (group_id, topic_id);


--
-- Name: index_topic_allowed_groups_on_topic_id_and_group_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_allowed_groups_on_topic_id_and_group_id ON topic_allowed_groups USING btree (topic_id, group_id);


--
-- Name: index_topic_allowed_users_on_topic_id_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_allowed_users_on_topic_id_and_user_id ON topic_allowed_users USING btree (topic_id, user_id);


--
-- Name: index_topic_allowed_users_on_user_id_and_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_allowed_users_on_user_id_and_topic_id ON topic_allowed_users USING btree (user_id, topic_id);


--
-- Name: index_topic_custom_fields_on_topic_id_and_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topic_custom_fields_on_topic_id_and_name ON topic_custom_fields USING btree (topic_id, name);


--
-- Name: index_topic_embeds_on_embed_url; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_embeds_on_embed_url ON topic_embeds USING btree (embed_url);


--
-- Name: index_topic_invites_on_invite_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topic_invites_on_invite_id ON topic_invites USING btree (invite_id);


--
-- Name: index_topic_invites_on_topic_id_and_invite_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_invites_on_topic_id_and_invite_id ON topic_invites USING btree (topic_id, invite_id);


--
-- Name: index_topic_links_on_link_post_id_and_reflection; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topic_links_on_link_post_id_and_reflection ON topic_links USING btree (link_post_id, reflection);


--
-- Name: index_topic_links_on_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topic_links_on_post_id ON topic_links USING btree (post_id);


--
-- Name: index_topic_links_on_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topic_links_on_topic_id ON topic_links USING btree (topic_id);


--
-- Name: index_topic_tags_on_topic_id_and_tag_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_tags_on_topic_id_and_tag_id ON topic_tags USING btree (topic_id, tag_id);


--
-- Name: index_topic_users_on_topic_id_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_users_on_topic_id_and_user_id ON topic_users USING btree (topic_id, user_id);


--
-- Name: index_topic_users_on_user_id_and_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_topic_users_on_user_id_and_topic_id ON topic_users USING btree (user_id, topic_id);


--
-- Name: index_topic_views_on_topic_id_and_viewed_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topic_views_on_topic_id_and_viewed_at ON topic_views USING btree (topic_id, viewed_at);


--
-- Name: index_topic_views_on_viewed_at_and_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topic_views_on_viewed_at_and_topic_id ON topic_views USING btree (viewed_at, topic_id);


--
-- Name: index_topics_on_bumped_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topics_on_bumped_at ON topics USING btree (bumped_at DESC);


--
-- Name: index_topics_on_created_at_and_visible; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topics_on_created_at_and_visible ON topics USING btree (created_at, visible) WHERE ((deleted_at IS NULL) AND ((archetype)::text <> 'private_message'::text));


--
-- Name: index_topics_on_id_and_deleted_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topics_on_id_and_deleted_at ON topics USING btree (id, deleted_at);


--
-- Name: index_topics_on_lower_title; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topics_on_lower_title ON topics USING btree (lower((title)::text));


--
-- Name: index_topics_on_pinned_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topics_on_pinned_at ON topics USING btree (pinned_at) WHERE (pinned_at IS NOT NULL);


--
-- Name: index_topics_on_pinned_globally; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_topics_on_pinned_globally ON topics USING btree (pinned_globally) WHERE pinned_globally;


--
-- Name: index_translation_overrides_on_locale_and_translation_key; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_translation_overrides_on_locale_and_translation_key ON translation_overrides USING btree (locale, translation_key);


--
-- Name: index_twitter_user_infos_on_twitter_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_twitter_user_infos_on_twitter_user_id ON twitter_user_infos USING btree (twitter_user_id);


--
-- Name: index_twitter_user_infos_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_twitter_user_infos_on_user_id ON twitter_user_infos USING btree (user_id);


--
-- Name: index_uploads_on_id_and_url; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_uploads_on_id_and_url ON uploads USING btree (id, url);


--
-- Name: index_uploads_on_sha1; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_uploads_on_sha1 ON uploads USING btree (sha1);


--
-- Name: index_uploads_on_url; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_uploads_on_url ON uploads USING btree (url);


--
-- Name: index_uploads_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_uploads_on_user_id ON uploads USING btree (user_id);


--
-- Name: index_user_actions_on_acting_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_actions_on_acting_user_id ON user_actions USING btree (acting_user_id);


--
-- Name: index_user_actions_on_target_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_actions_on_target_post_id ON user_actions USING btree (target_post_id);


--
-- Name: index_user_actions_on_user_id_and_action_type; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_actions_on_user_id_and_action_type ON user_actions USING btree (user_id, action_type);


--
-- Name: index_user_archived_messages_on_user_id_and_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_user_archived_messages_on_user_id_and_topic_id ON user_archived_messages USING btree (user_id, topic_id);


--
-- Name: index_user_avatars_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_avatars_on_user_id ON user_avatars USING btree (user_id);


--
-- Name: index_user_badges_on_badge_id_and_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_badges_on_badge_id_and_user_id ON user_badges USING btree (badge_id, user_id);


--
-- Name: index_user_badges_on_badge_id_and_user_id_and_post_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_user_badges_on_badge_id_and_user_id_and_post_id ON user_badges USING btree (badge_id, user_id, post_id) WHERE (post_id IS NOT NULL);


--
-- Name: index_user_badges_on_badge_id_and_user_id_and_seq; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_user_badges_on_badge_id_and_user_id_and_seq ON user_badges USING btree (badge_id, user_id, seq) WHERE (post_id IS NULL);


--
-- Name: index_user_badges_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_badges_on_user_id ON user_badges USING btree (user_id);


--
-- Name: index_user_custom_fields_on_user_id_and_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_custom_fields_on_user_id_and_name ON user_custom_fields USING btree (user_id, name);


--
-- Name: index_user_histories_on_acting_user_id_and_action_and_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_histories_on_acting_user_id_and_action_and_id ON user_histories USING btree (acting_user_id, action, id);


--
-- Name: index_user_histories_on_action_and_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_histories_on_action_and_id ON user_histories USING btree (action, id);


--
-- Name: index_user_histories_on_category_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_histories_on_category_id ON user_histories USING btree (category_id);


--
-- Name: index_user_histories_on_subject_and_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_histories_on_subject_and_id ON user_histories USING btree (subject, id);


--
-- Name: index_user_histories_on_target_user_id_and_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_histories_on_target_user_id_and_id ON user_histories USING btree (target_user_id, id);


--
-- Name: index_user_open_ids_on_url; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_open_ids_on_url ON user_open_ids USING btree (url);


--
-- Name: index_user_options_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_user_options_on_user_id ON user_options USING btree (user_id);


--
-- Name: index_user_profile_views_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_profile_views_on_user_id ON user_profile_views USING btree (user_id);


--
-- Name: index_user_profile_views_on_user_profile_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_profile_views_on_user_profile_id ON user_profile_views USING btree (user_profile_id);


--
-- Name: index_user_profiles_on_bio_cooked_version; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_profiles_on_bio_cooked_version ON user_profiles USING btree (bio_cooked_version);


--
-- Name: index_user_visits_on_user_id_and_visited_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_user_visits_on_user_id_and_visited_at ON user_visits USING btree (user_id, visited_at);


--
-- Name: index_user_visits_on_visited_at_and_mobile; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_user_visits_on_visited_at_and_mobile ON user_visits USING btree (visited_at, mobile);


--
-- Name: index_users_on_auth_token; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_users_on_auth_token ON users USING btree (auth_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (lower((email)::text));


--
-- Name: index_users_on_last_posted_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_users_on_last_posted_at ON users USING btree (last_posted_at);


--
-- Name: index_users_on_last_seen_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_users_on_last_seen_at ON users USING btree (last_seen_at);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: index_users_on_username_lower; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_users_on_username_lower ON users USING btree (username_lower);


--
-- Name: index_versions_on_created_at; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_versions_on_created_at ON versions USING btree (created_at);


--
-- Name: index_versions_on_number; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_versions_on_number ON versions USING btree (number);


--
-- Name: index_versions_on_tag; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_versions_on_tag ON versions USING btree (tag);


--
-- Name: index_versions_on_user_id_and_user_type; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_versions_on_user_id_and_user_type ON versions USING btree (user_id, user_type);


--
-- Name: index_versions_on_user_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_versions_on_user_name ON versions USING btree (user_name);


--
-- Name: index_versions_on_versioned_id_and_versioned_type; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_versions_on_versioned_id_and_versioned_type ON versions USING btree (versioned_id, versioned_type);


--
-- Name: index_warnings_on_topic_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX index_warnings_on_topic_id ON warnings USING btree (topic_id);


--
-- Name: index_warnings_on_user_id; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX index_warnings_on_user_id ON warnings USING btree (user_id);


--
-- Name: ip_address_topic_id_topic_views; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX ip_address_topic_id_topic_views ON topic_views USING btree (ip_address, topic_id) WHERE (user_id IS NULL);


--
-- Name: post_timings_summary; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX post_timings_summary ON post_timings USING btree (topic_id, post_number);


--
-- Name: post_timings_unique; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX post_timings_unique ON post_timings USING btree (topic_id, post_number, user_id);


--
-- Name: topic_custom_fields_value_key_idx; Type: INDEX; Schema: public; Owner: discourse
--

CREATE INDEX topic_custom_fields_value_key_idx ON topic_custom_fields USING btree (value, name) WHERE ((value IS NOT NULL) AND (char_length(value) < 400));


--
-- Name: unique_index_categories_on_name; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX unique_index_categories_on_name ON categories USING btree ((COALESCE(parent_category_id, '-1'::integer)), name);


--
-- Name: unique_post_links; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX unique_post_links ON topic_links USING btree (topic_id, post_id, url);


--
-- Name: unique_profile_view_ip; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX unique_profile_view_ip ON user_profile_views USING btree (viewed_at, ip_address, user_profile_id) WHERE (user_id IS NULL);


--
-- Name: unique_profile_view_user; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX unique_profile_view_user ON user_profile_views USING btree (viewed_at, user_id, user_profile_id) WHERE (user_id IS NOT NULL);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_id_topic_id_topic_views; Type: INDEX; Schema: public; Owner: discourse
--

CREATE UNIQUE INDEX user_id_topic_id_topic_views ON topic_views USING btree (user_id, topic_id) WHERE (user_id IS NOT NULL);


--
-- Name: public; Type: ACL; Schema: -; Owner: discourse
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM discourse;
GRANT ALL ON SCHEMA public TO discourse;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

