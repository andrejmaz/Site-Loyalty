--
-- PostgreSQL database cluster dump
--

\restrict ltmr6wsz9WoQdrhG0tgzTDW8mdG0DR8a7PWWf3LrraMy7fj7PPq0KrfRdiQutUm

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:38hEgYVbrKqudk3FJoWpSw==$jhgEvRYM1jRq4Ag7cSLkCYj9eZ3roeDv3f0Fbju76fg=:jROkTTawq/TDFJ4POp5U/dDi8XLDY/+K+g7WbMbCJGw=';

--
-- User Configurations
--








\unrestrict ltmr6wsz9WoQdrhG0tgzTDW8mdG0DR8a7PWWf3LrraMy7fj7PPq0KrfRdiQutUm

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict x6CfAzZLDoghcqryfeukUIju8PlPis793mJLF2ZbvFI7Eo07j8UdTTezqQH6hFS

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

--
-- PostgreSQL database dump complete
--

\unrestrict x6CfAzZLDoghcqryfeukUIju8PlPis793mJLF2ZbvFI7Eo07j8UdTTezqQH6hFS

--
-- Database "n8n" dump
--

--
-- PostgreSQL database dump
--

\restrict jQGJAL4bpLCY0cU3Cg7PdvKlSCYOgjCOwj4Q6hmLMuFyO88bnTZ2aR7xgqtkfl8

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

--
-- Name: n8n; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE n8n WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE n8n OWNER TO postgres;

\unrestrict jQGJAL4bpLCY0cU3Cg7PdvKlSCYOgjCOwj4Q6hmLMuFyO88bnTZ2aR7xgqtkfl8
\connect n8n
\restrict jQGJAL4bpLCY0cU3Cg7PdvKlSCYOgjCOwj4Q6hmLMuFyO88bnTZ2aR7xgqtkfl8

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: n8n_annotation_tag_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_annotation_tag_entity (
    id character varying(16) NOT NULL,
    name character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_annotation_tag_entity OWNER TO postgres;

--
-- Name: n8n_auth_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_auth_identity (
    "userId" uuid,
    "providerId" character varying(64) NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_auth_identity OWNER TO postgres;

--
-- Name: n8n_auth_provider_sync_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_auth_provider_sync_history (
    id integer NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "runMode" text NOT NULL,
    status text NOT NULL,
    "startedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    scanned integer NOT NULL,
    created integer NOT NULL,
    updated integer NOT NULL,
    disabled integer NOT NULL,
    error text
);


ALTER TABLE public.n8n_auth_provider_sync_history OWNER TO postgres;

--
-- Name: n8n_auth_provider_sync_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.n8n_auth_provider_sync_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n8n_auth_provider_sync_history_id_seq OWNER TO postgres;

--
-- Name: n8n_auth_provider_sync_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.n8n_auth_provider_sync_history_id_seq OWNED BY public.n8n_auth_provider_sync_history.id;


--
-- Name: n8n_credentials_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_credentials_entity (
    name character varying(128) NOT NULL,
    data text NOT NULL,
    type character varying(128) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    id character varying(36) NOT NULL,
    "isManaged" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.n8n_credentials_entity OWNER TO postgres;

--
-- Name: n8n_data_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_data_table (
    id character varying(36) NOT NULL,
    name character varying(128) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_data_table OWNER TO postgres;

--
-- Name: n8n_data_table_column; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_data_table_column (
    id character varying(36) NOT NULL,
    name character varying(128) NOT NULL,
    type character varying(32) NOT NULL,
    index integer NOT NULL,
    "dataTableId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_data_table_column OWNER TO postgres;

--
-- Name: COLUMN n8n_data_table_column.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_data_table_column.type IS 'Expected: string, number, boolean, or date (not enforced as a constraint)';


--
-- Name: COLUMN n8n_data_table_column.index; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_data_table_column.index IS 'Column order, starting from 0 (0 = first column)';


--
-- Name: n8n_event_destinations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_event_destinations (
    id uuid NOT NULL,
    destination jsonb NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_event_destinations OWNER TO postgres;

--
-- Name: n8n_execution_annotation_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_execution_annotation_tags (
    "annotationId" integer NOT NULL,
    "tagId" character varying(24) NOT NULL
);


ALTER TABLE public.n8n_execution_annotation_tags OWNER TO postgres;

--
-- Name: n8n_execution_annotations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_execution_annotations (
    id integer NOT NULL,
    "executionId" integer NOT NULL,
    vote character varying(6),
    note text,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_execution_annotations OWNER TO postgres;

--
-- Name: n8n_execution_annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.n8n_execution_annotations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n8n_execution_annotations_id_seq OWNER TO postgres;

--
-- Name: n8n_execution_annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.n8n_execution_annotations_id_seq OWNED BY public.n8n_execution_annotations.id;


--
-- Name: n8n_execution_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_execution_data (
    "executionId" integer NOT NULL,
    "workflowData" json NOT NULL,
    data text NOT NULL
);


ALTER TABLE public.n8n_execution_data OWNER TO postgres;

--
-- Name: n8n_execution_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_execution_entity (
    id integer NOT NULL,
    finished boolean NOT NULL,
    mode character varying NOT NULL,
    "retryOf" character varying,
    "retrySuccessId" character varying,
    "startedAt" timestamp(3) with time zone,
    "stoppedAt" timestamp(3) with time zone,
    "waitTill" timestamp(3) with time zone,
    status character varying NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "deletedAt" timestamp(3) with time zone,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_execution_entity OWNER TO postgres;

--
-- Name: n8n_execution_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.n8n_execution_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n8n_execution_entity_id_seq OWNER TO postgres;

--
-- Name: n8n_execution_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.n8n_execution_entity_id_seq OWNED BY public.n8n_execution_entity.id;


--
-- Name: n8n_execution_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_execution_metadata (
    id integer NOT NULL,
    "executionId" integer NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.n8n_execution_metadata OWNER TO postgres;

--
-- Name: n8n_execution_metadata_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.n8n_execution_metadata_temp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n8n_execution_metadata_temp_id_seq OWNER TO postgres;

--
-- Name: n8n_execution_metadata_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.n8n_execution_metadata_temp_id_seq OWNED BY public.n8n_execution_metadata.id;


--
-- Name: n8n_folder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_folder (
    id character varying(36) NOT NULL,
    name character varying(128) NOT NULL,
    "parentFolderId" character varying(36),
    "projectId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_folder OWNER TO postgres;

--
-- Name: n8n_folder_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_folder_tag (
    "folderId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


ALTER TABLE public.n8n_folder_tag OWNER TO postgres;

--
-- Name: n8n_insights_by_period; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_insights_by_period (
    id integer NOT NULL,
    "metaId" integer NOT NULL,
    type integer NOT NULL,
    value integer NOT NULL,
    "periodUnit" integer NOT NULL,
    "periodStart" timestamp(0) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.n8n_insights_by_period OWNER TO postgres;

--
-- Name: COLUMN n8n_insights_by_period.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_insights_by_period.type IS '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure';


--
-- Name: COLUMN n8n_insights_by_period."periodUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_insights_by_period."periodUnit" IS '0: hour, 1: day, 2: week';


--
-- Name: n8n_insights_by_period_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.n8n_insights_by_period ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.n8n_insights_by_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: n8n_insights_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_insights_metadata (
    "metaId" integer NOT NULL,
    "workflowId" character varying(16),
    "projectId" character varying(36),
    "workflowName" character varying(128) NOT NULL,
    "projectName" character varying(255) NOT NULL
);


ALTER TABLE public.n8n_insights_metadata OWNER TO postgres;

--
-- Name: n8n_insights_metadata_metaId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.n8n_insights_metadata ALTER COLUMN "metaId" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."n8n_insights_metadata_metaId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: n8n_insights_raw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_insights_raw (
    id integer NOT NULL,
    "metaId" integer NOT NULL,
    type integer NOT NULL,
    value integer NOT NULL,
    "timestamp" timestamp(0) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.n8n_insights_raw OWNER TO postgres;

--
-- Name: COLUMN n8n_insights_raw.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_insights_raw.type IS '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure';


--
-- Name: n8n_insights_raw_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.n8n_insights_raw ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.n8n_insights_raw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: n8n_installed_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_installed_nodes (
    name character varying(200) NOT NULL,
    type character varying(200) NOT NULL,
    "latestVersion" integer DEFAULT 1 NOT NULL,
    package character varying(241) NOT NULL
);


ALTER TABLE public.n8n_installed_nodes OWNER TO postgres;

--
-- Name: n8n_installed_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_installed_packages (
    "packageName" character varying(214) NOT NULL,
    "installedVersion" character varying(50) NOT NULL,
    "authorName" character varying(70),
    "authorEmail" character varying(70),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_installed_packages OWNER TO postgres;

--
-- Name: n8n_invalid_auth_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_invalid_auth_token (
    token character varying(512) NOT NULL,
    "expiresAt" timestamp(3) with time zone NOT NULL
);


ALTER TABLE public.n8n_invalid_auth_token OWNER TO postgres;

--
-- Name: n8n_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.n8n_migrations OWNER TO postgres;

--
-- Name: n8n_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.n8n_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.n8n_migrations_id_seq OWNER TO postgres;

--
-- Name: n8n_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.n8n_migrations_id_seq OWNED BY public.n8n_migrations.id;


--
-- Name: n8n_processed_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_processed_data (
    "workflowId" character varying(36) NOT NULL,
    context character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.n8n_processed_data OWNER TO postgres;

--
-- Name: n8n_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_project (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    icon json,
    description character varying(512)
);


ALTER TABLE public.n8n_project OWNER TO postgres;

--
-- Name: n8n_project_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_project_relation (
    "projectId" character varying(36) NOT NULL,
    "userId" uuid NOT NULL,
    role character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_project_relation OWNER TO postgres;

--
-- Name: n8n_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_role (
    slug character varying(128) NOT NULL,
    "displayName" text,
    description text,
    "roleType" text,
    "systemRole" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_role OWNER TO postgres;

--
-- Name: COLUMN n8n_role.slug; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_role.slug IS 'Unique identifier of the role for example: "global:owner"';


--
-- Name: COLUMN n8n_role."displayName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_role."displayName" IS 'Name used to display in the UI';


--
-- Name: COLUMN n8n_role.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_role.description IS 'Text describing the scope in more detail of users';


--
-- Name: COLUMN n8n_role."roleType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_role."roleType" IS 'Type of the role, e.g., global, project, or workflow';


--
-- Name: COLUMN n8n_role."systemRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_role."systemRole" IS 'Indicates if the role is managed by the system and cannot be edited';


--
-- Name: n8n_role_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_role_scope (
    "roleSlug" character varying(128) NOT NULL,
    "scopeSlug" character varying(128) NOT NULL
);


ALTER TABLE public.n8n_role_scope OWNER TO postgres;

--
-- Name: n8n_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_scope (
    slug character varying(128) NOT NULL,
    "displayName" text,
    description text
);


ALTER TABLE public.n8n_scope OWNER TO postgres;

--
-- Name: COLUMN n8n_scope.slug; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_scope.slug IS 'Unique identifier of the scope for example: "project:create"';


--
-- Name: COLUMN n8n_scope."displayName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_scope."displayName" IS 'Name used to display in the UI';


--
-- Name: COLUMN n8n_scope.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.n8n_scope.description IS 'Text describing the scope in more detail of users';


--
-- Name: n8n_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_settings (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    "loadOnStartup" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.n8n_settings OWNER TO postgres;

--
-- Name: n8n_shared_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_shared_credentials (
    "credentialsId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    role text NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_shared_credentials OWNER TO postgres;

--
-- Name: n8n_shared_workflow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_shared_workflow (
    "workflowId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    role text NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_shared_workflow OWNER TO postgres;

--
-- Name: n8n_tag_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_tag_entity (
    name character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    id character varying(36) NOT NULL
);


ALTER TABLE public.n8n_tag_entity OWNER TO postgres;

--
-- Name: n8n_test_case_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_test_case_execution (
    id character varying(36) NOT NULL,
    "testRunId" character varying(36) NOT NULL,
    "executionId" integer,
    status character varying NOT NULL,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    "errorCode" character varying,
    "errorDetails" json,
    metrics json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    inputs json,
    outputs json
);


ALTER TABLE public.n8n_test_case_execution OWNER TO postgres;

--
-- Name: n8n_test_run; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_test_run (
    id character varying(36) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    status character varying NOT NULL,
    "errorCode" character varying,
    "errorDetails" json,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    metrics json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.n8n_test_run OWNER TO postgres;

--
-- Name: n8n_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_user (
    id uuid DEFAULT uuid_in((OVERLAY(OVERLAY(md5((((random())::text || ':'::text) || (clock_timestamp())::text)) PLACING '4'::text FROM 13) PLACING to_hex((floor(((random() * (((11 - 8) + 1))::double precision) + (8)::double precision)))::integer) FROM 17))::cstring) NOT NULL,
    email character varying(255),
    "firstName" character varying(32),
    "lastName" character varying(32),
    password character varying(255),
    "personalizationAnswers" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    settings json,
    disabled boolean DEFAULT false NOT NULL,
    "mfaEnabled" boolean DEFAULT false NOT NULL,
    "mfaSecret" text,
    "mfaRecoveryCodes" text,
    "lastActiveAt" date,
    "roleSlug" character varying(128) DEFAULT 'global:member'::character varying NOT NULL
);


ALTER TABLE public.n8n_user OWNER TO postgres;

--
-- Name: n8n_user_api_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_user_api_keys (
    id character varying(36) NOT NULL,
    "userId" uuid NOT NULL,
    label character varying(100) NOT NULL,
    "apiKey" character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    scopes json
);


ALTER TABLE public.n8n_user_api_keys OWNER TO postgres;

--
-- Name: n8n_variables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_variables (
    key character varying(50) NOT NULL,
    type character varying(50) DEFAULT 'string'::character varying NOT NULL,
    value character varying(255),
    id character varying(36) NOT NULL
);


ALTER TABLE public.n8n_variables OWNER TO postgres;

--
-- Name: n8n_webhook_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_webhook_entity (
    "webhookPath" character varying NOT NULL,
    method character varying NOT NULL,
    node character varying NOT NULL,
    "webhookId" character varying,
    "pathLength" integer,
    "workflowId" character varying(36) NOT NULL
);


ALTER TABLE public.n8n_webhook_entity OWNER TO postgres;

--
-- Name: n8n_workflow_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_workflow_entity (
    name character varying(128) NOT NULL,
    active boolean NOT NULL,
    nodes json NOT NULL,
    connections json NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    settings json,
    "staticData" json,
    "pinData" json,
    "versionId" character(36),
    "triggerCount" integer DEFAULT 0 NOT NULL,
    id character varying(36) NOT NULL,
    meta json,
    "parentFolderId" character varying(36) DEFAULT NULL::character varying,
    "isArchived" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.n8n_workflow_entity OWNER TO postgres;

--
-- Name: n8n_workflow_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_workflow_history (
    "versionId" character varying(36) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    authors character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    nodes json NOT NULL,
    connections json NOT NULL
);


ALTER TABLE public.n8n_workflow_history OWNER TO postgres;

--
-- Name: n8n_workflow_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_workflow_statistics (
    count integer DEFAULT 0,
    "latestEvent" timestamp(3) with time zone,
    name character varying(128) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "rootCount" integer DEFAULT 0
);


ALTER TABLE public.n8n_workflow_statistics OWNER TO postgres;

--
-- Name: n8n_workflows_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.n8n_workflows_tags (
    "workflowId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


ALTER TABLE public.n8n_workflows_tags OWNER TO postgres;

--
-- Name: n8n_auth_provider_sync_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_auth_provider_sync_history ALTER COLUMN id SET DEFAULT nextval('public.n8n_auth_provider_sync_history_id_seq'::regclass);


--
-- Name: n8n_execution_annotations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_annotations ALTER COLUMN id SET DEFAULT nextval('public.n8n_execution_annotations_id_seq'::regclass);


--
-- Name: n8n_execution_entity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_entity ALTER COLUMN id SET DEFAULT nextval('public.n8n_execution_entity_id_seq'::regclass);


--
-- Name: n8n_execution_metadata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_metadata ALTER COLUMN id SET DEFAULT nextval('public.n8n_execution_metadata_temp_id_seq'::regclass);


--
-- Name: n8n_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_migrations ALTER COLUMN id SET DEFAULT nextval('public.n8n_migrations_id_seq'::regclass);


--
-- Name: n8n_scope PK_026f06b191499e792c702050205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_scope
    ADD CONSTRAINT "PK_026f06b191499e792c702050205" PRIMARY KEY (slug);


--
-- Name: n8n_user_api_keys PK_03bdd5e5f2351b9440ae97f3899; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_user_api_keys
    ADD CONSTRAINT "PK_03bdd5e5f2351b9440ae97f3899" PRIMARY KEY (id);


--
-- Name: n8n_role PK_1b75761ae2b6d5ac478fc69ff8c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_role
    ADD CONSTRAINT "PK_1b75761ae2b6d5ac478fc69ff8c" PRIMARY KEY (slug);


--
-- Name: n8n_execution_annotations PK_49a1cba15c77a0ae88a1c7e3a0b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_annotations
    ADD CONSTRAINT "PK_49a1cba15c77a0ae88a1c7e3a0b" PRIMARY KEY (id);


--
-- Name: n8n_shared_workflow PK_50a3efc32c7611d87690780744a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_shared_workflow
    ADD CONSTRAINT "PK_50a3efc32c7611d87690780744a" PRIMARY KEY ("workflowId", "projectId");


--
-- Name: n8n_insights_raw PK_56765a1f707de0eac7cce31e9a1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_insights_raw
    ADD CONSTRAINT "PK_56765a1f707de0eac7cce31e9a1" PRIMARY KEY (id);


--
-- Name: n8n_folder PK_5ded6390fe3f9776676618e3b18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_folder
    ADD CONSTRAINT "PK_5ded6390fe3f9776676618e3b18" PRIMARY KEY (id);


--
-- Name: n8n_insights_metadata PK_65a9c0ec50e42c31745844c814a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_insights_metadata
    ADD CONSTRAINT "PK_65a9c0ec50e42c31745844c814a" PRIMARY KEY ("metaId");


--
-- Name: n8n_insights_by_period PK_7032685474508a2de1e8eb5d6f4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_insights_by_period
    ADD CONSTRAINT "PK_7032685474508a2de1e8eb5d6f4" PRIMARY KEY (id);


--
-- Name: n8n_test_run PK_75a7e8004ce75a0f80e868c7dd9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_test_run
    ADD CONSTRAINT "PK_75a7e8004ce75a0f80e868c7dd9" PRIMARY KEY (id);


--
-- Name: n8n_invalid_auth_token PK_7df81c3609b9cd4558a6a25efa0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_invalid_auth_token
    ADD CONSTRAINT "PK_7df81c3609b9cd4558a6a25efa0" PRIMARY KEY (token);


--
-- Name: n8n_annotation_tag_entity PK_85868d7fb62b4c192e634cf9b78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_annotation_tag_entity
    ADD CONSTRAINT "PK_85868d7fb62b4c192e634cf9b78" PRIMARY KEY (id);


--
-- Name: n8n_execution_metadata PK_8ddbdd77dd5dd34fbdbcf7f02e1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_metadata
    ADD CONSTRAINT "PK_8ddbdd77dd5dd34fbdbcf7f02e1" PRIMARY KEY (id);


--
-- Name: n8n_folder_tag PK_8e03a07b527bc43546f4d9d991b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_folder_tag
    ADD CONSTRAINT "PK_8e03a07b527bc43546f4d9d991b" PRIMARY KEY ("folderId", "tagId");


--
-- Name: n8n_migrations PK_91f7b8c9fb325ea62c330b41886; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_migrations
    ADD CONSTRAINT "PK_91f7b8c9fb325ea62c330b41886" PRIMARY KEY (id);


--
-- Name: n8n_workflow_history PK_9d647c2b6acabdd90593c58b6c4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflow_history
    ADD CONSTRAINT "PK_9d647c2b6acabdd90593c58b6c4" PRIMARY KEY ("versionId");


--
-- Name: n8n_project_relation PK_a3032e3ef157d7ed6f5b17f1860; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_project_relation
    ADD CONSTRAINT "PK_a3032e3ef157d7ed6f5b17f1860" PRIMARY KEY ("projectId", "userId");


--
-- Name: n8n_processed_data PK_bcfc4a4657b4179a3db6b18f3e3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_processed_data
    ADD CONSTRAINT "PK_bcfc4a4657b4179a3db6b18f3e3" PRIMARY KEY ("workflowId", context);


--
-- Name: n8n_shared_credentials PK_bdd030838d03b2f892e15e304b9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_shared_credentials
    ADD CONSTRAINT "PK_bdd030838d03b2f892e15e304b9" PRIMARY KEY ("credentialsId", "projectId");


--
-- Name: n8n_project PK_c9374e55f56791babcca5fc3822; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_project
    ADD CONSTRAINT "PK_c9374e55f56791babcca5fc3822" PRIMARY KEY (id);


--
-- Name: n8n_execution_annotation_tags PK_cf1feb4584688f9fb5d93e0edf9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_annotation_tags
    ADD CONSTRAINT "PK_cf1feb4584688f9fb5d93e0edf9" PRIMARY KEY ("annotationId", "tagId");


--
-- Name: n8n_test_case_execution PK_d5f1a933f30bc3f484633b7de67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_test_case_execution
    ADD CONSTRAINT "PK_d5f1a933f30bc3f484633b7de67" PRIMARY KEY (id);


--
-- Name: n8n_data_table PK_e962748edcc2d47e240b4df2a3a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_data_table
    ADD CONSTRAINT "PK_e962748edcc2d47e240b4df2a3a" PRIMARY KEY (id);


--
-- Name: n8n_data_table_column PK_ebff07a9254c92aa70e6edd4b75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_data_table_column
    ADD CONSTRAINT "PK_ebff07a9254c92aa70e6edd4b75" PRIMARY KEY (id);


--
-- Name: n8n_installed_packages PK_n8n_08cc9197c39b028c1e9beca225940576fd1a5804; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_installed_packages
    ADD CONSTRAINT "PK_n8n_08cc9197c39b028c1e9beca225940576fd1a5804" PRIMARY KEY ("packageName");


--
-- Name: n8n_installed_nodes PK_n8n_8ebd28194e4f792f96b5933423fc439df97d9689; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_installed_nodes
    ADD CONSTRAINT "PK_n8n_8ebd28194e4f792f96b5933423fc439df97d9689" PRIMARY KEY (name);


--
-- Name: n8n_webhook_entity PK_n8n_b21ace2e13596ccd87dc9bf4ea6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_webhook_entity
    ADD CONSTRAINT "PK_n8n_b21ace2e13596ccd87dc9bf4ea6" PRIMARY KEY ("webhookPath", method);


--
-- Name: n8n_settings PK_n8n_dc0fe14e6d9943f268e7b119f69ab8bd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_settings
    ADD CONSTRAINT "PK_n8n_dc0fe14e6d9943f268e7b119f69ab8bd" PRIMARY KEY (key);


--
-- Name: n8n_user PK_n8n_ea8f538c94b6e352418254ed6474a81f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_user
    ADD CONSTRAINT "PK_n8n_ea8f538c94b6e352418254ed6474a81f" PRIMARY KEY (id);


--
-- Name: n8n_role_scope PK_n8n_role_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_role_scope
    ADD CONSTRAINT "PK_n8n_role_scope" PRIMARY KEY ("roleSlug", "scopeSlug");


--
-- Name: n8n_data_table UQ_1ff239a2e2fab13a65be584c029; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_data_table
    ADD CONSTRAINT "UQ_1ff239a2e2fab13a65be584c029" UNIQUE ("projectId", name);


--
-- Name: n8n_data_table_column UQ_86a5244bfb65ff82847b42b14cb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_data_table_column
    ADD CONSTRAINT "UQ_86a5244bfb65ff82847b42b14cb" UNIQUE ("dataTableId", name);


--
-- Name: n8n_user UQ_n8n_e12875dfb3b1d92d7d7c5377e2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_user
    ADD CONSTRAINT "UQ_n8n_e12875dfb3b1d92d7d7c5377e2" UNIQUE (email);


--
-- Name: n8n_auth_identity n8n_auth_identity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_auth_identity
    ADD CONSTRAINT n8n_auth_identity_pkey PRIMARY KEY ("providerId", "providerType");


--
-- Name: n8n_auth_provider_sync_history n8n_auth_provider_sync_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_auth_provider_sync_history
    ADD CONSTRAINT n8n_auth_provider_sync_history_pkey PRIMARY KEY (id);


--
-- Name: n8n_credentials_entity n8n_credentials_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_credentials_entity
    ADD CONSTRAINT n8n_credentials_entity_pkey PRIMARY KEY (id);


--
-- Name: n8n_event_destinations n8n_event_destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_event_destinations
    ADD CONSTRAINT n8n_event_destinations_pkey PRIMARY KEY (id);


--
-- Name: n8n_execution_data n8n_execution_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_data
    ADD CONSTRAINT n8n_execution_data_pkey PRIMARY KEY ("executionId");


--
-- Name: n8n_tag_entity n8n_tag_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_tag_entity
    ADD CONSTRAINT n8n_tag_entity_pkey PRIMARY KEY (id);


--
-- Name: n8n_variables n8n_variables_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_variables
    ADD CONSTRAINT n8n_variables_key_key UNIQUE (key);


--
-- Name: n8n_variables n8n_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_variables
    ADD CONSTRAINT n8n_variables_pkey PRIMARY KEY (id);


--
-- Name: n8n_workflow_entity n8n_workflow_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflow_entity
    ADD CONSTRAINT n8n_workflow_entity_pkey PRIMARY KEY (id);


--
-- Name: n8n_execution_entity pk_n8n_e3e63bbf986767844bbe1166d4e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_entity
    ADD CONSTRAINT pk_n8n_e3e63bbf986767844bbe1166d4e PRIMARY KEY (id);


--
-- Name: n8n_workflow_statistics pk_n8n_workflow_statistics; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflow_statistics
    ADD CONSTRAINT pk_n8n_workflow_statistics PRIMARY KEY ("workflowId", name);


--
-- Name: n8n_workflows_tags pk_n8n_workflows_tags; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflows_tags
    ADD CONSTRAINT pk_n8n_workflows_tags PRIMARY KEY ("workflowId", "tagId");


--
-- Name: IDX_014f0e31025588f483caaa33a6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_014f0e31025588f483caaa33a6" ON public.n8n_insights_by_period USING btree ("periodStart", type, "periodUnit", "metaId");


--
-- Name: IDX_26bf5281b6cc20bb560186df6a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_26bf5281b6cc20bb560186df6a" ON public.n8n_insights_metadata USING btree ("workflowId");


--
-- Name: IDX_2cb31c081c23811bc50e05d52c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_2cb31c081c23811bc50e05d52c" ON public.n8n_project_relation USING btree ("userId");


--
-- Name: IDX_42ac5f23bc7e2406eca4edf77e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_42ac5f23bc7e2406eca4edf77e" ON public.n8n_test_case_execution USING btree ("testRunId");


--
-- Name: IDX_43a0251cf7a6c3a3b013a47941; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_43a0251cf7a6c3a3b013a47941" ON public.n8n_folder USING btree ("projectId", id);


--
-- Name: IDX_8391afd12e55274b8ccd2c9f9e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_8391afd12e55274b8ccd2c9f9e" ON public.n8n_annotation_tag_entity USING btree (name);


--
-- Name: IDX_847d227f8d64685d15cf069f3e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_847d227f8d64685d15cf069f3e" ON public.n8n_user_api_keys USING btree ("userId", label);


--
-- Name: IDX_a248403c2dc457fbfce5ceb2f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_a248403c2dc457fbfce5ceb2f0" ON public.n8n_execution_annotation_tags USING btree ("annotationId");


--
-- Name: IDX_a3e09b045e9f0cda79e0d5e504; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_a3e09b045e9f0cda79e0d5e504" ON public.n8n_execution_metadata USING btree ("executionId", key);


--
-- Name: IDX_aa7e8ac1d980b38f9661f046ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_aa7e8ac1d980b38f9661f046ea" ON public.n8n_user_api_keys USING btree ("apiKey");


--
-- Name: IDX_be73b755e714e97de8954386e7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_be73b755e714e97de8954386e7" ON public.n8n_execution_annotation_tags USING btree ("tagId");


--
-- Name: IDX_ca95e303cf3e22671fe013c9d3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ca95e303cf3e22671fe013c9d3" ON public.n8n_test_run USING btree ("workflowId");


--
-- Name: IDX_dcc03d2f488128fb82d276c994; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_dcc03d2f488128fb82d276c994" ON public.n8n_project_relation USING btree ("projectId");


--
-- Name: IDX_e3b4b30c8de00a305c55a2088f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e3b4b30c8de00a305c55a2088f" ON public.n8n_execution_annotations USING btree ("executionId");


--
-- Name: IDX_fdbda01fc0a7c7c513cf2bcb8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_fdbda01fc0a7c7c513cf2bcb8f" ON public.n8n_workflow_history USING btree ("workflowId");


--
-- Name: IDX_n8n_85b981df7b444f905f8bf50747; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_n8n_85b981df7b444f905f8bf50747" ON public.n8n_execution_entity USING btree ("waitTill", id);


--
-- Name: IDX_n8n_execution_entity_deletedAt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_n8n_execution_entity_deletedAt" ON public.n8n_execution_entity USING btree ("deletedAt");


--
-- Name: IDX_n8n_role_scope_scopeSlug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_n8n_role_scope_scopeSlug" ON public.n8n_role_scope USING btree ("scopeSlug");


--
-- Name: IDX_n8n_workflow_entity_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_n8n_workflow_entity_name" ON public.n8n_workflow_entity USING btree (name);


--
-- Name: idx_execution_entity_stopped_at_status_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_execution_entity_stopped_at_status_deleted_at ON public.n8n_execution_entity USING btree ("stoppedAt", status, "deletedAt") WHERE (("stoppedAt" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_execution_entity_wait_till_status_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_execution_entity_wait_till_status_deleted_at ON public.n8n_execution_entity USING btree ("waitTill", status, "deletedAt") WHERE (("waitTill" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_execution_entity_workflow_id_started_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_execution_entity_workflow_id_started_at ON public.n8n_execution_entity USING btree ("workflowId", "startedAt") WHERE (("startedAt" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_n8n_07fde106c0b471d8cc80a64fc8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_n8n_07fde106c0b471d8cc80a64fc8 ON public.n8n_credentials_entity USING btree (type);


--
-- Name: idx_n8n_16f4436789e804e3e1c9eeb240; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_n8n_16f4436789e804e3e1c9eeb240 ON public.n8n_webhook_entity USING btree ("webhookId", method, "pathLength");


--
-- Name: idx_n8n_812eb05f7451ca757fb98444ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_n8n_812eb05f7451ca757fb98444ce ON public.n8n_tag_entity USING btree (name);


--
-- Name: idx_n8n_execution_entity_workflow_id_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_n8n_execution_entity_workflow_id_id ON public.n8n_execution_entity USING btree ("workflowId", id);


--
-- Name: idx_n8n_workflows_tags_workflow_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_n8n_workflows_tags_workflow_id ON public.n8n_workflows_tags USING btree ("workflowId");


--
-- Name: pk_n8n_credentials_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pk_n8n_credentials_entity_id ON public.n8n_credentials_entity USING btree (id);


--
-- Name: pk_n8n_tag_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pk_n8n_tag_entity_id ON public.n8n_tag_entity USING btree (id);


--
-- Name: pk_n8n_variables_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pk_n8n_variables_id ON public.n8n_variables USING btree (id);


--
-- Name: pk_n8n_workflow_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pk_n8n_workflow_entity_id ON public.n8n_workflow_entity USING btree (id);


--
-- Name: project_relation_role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX project_relation_role_idx ON public.n8n_project_relation USING btree (role);


--
-- Name: project_relation_role_project_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX project_relation_role_project_idx ON public.n8n_project_relation USING btree ("projectId", role);


--
-- Name: user_role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_role_idx ON public.n8n_user USING btree ("roleSlug");


--
-- Name: n8n_insights_by_period FK_027258f273f6a3154ffb1870164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_insights_by_period
    ADD CONSTRAINT "FK_027258f273f6a3154ffb1870164" FOREIGN KEY ("metaId") REFERENCES public.n8n_insights_metadata("metaId") ON DELETE CASCADE;


--
-- Name: n8n_shared_workflow FK_04647f9762e85e5ed52a07a9237; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_shared_workflow
    ADD CONSTRAINT "FK_04647f9762e85e5ed52a07a9237" FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_folder FK_0e74786345edce55f584f261d9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_folder
    ADD CONSTRAINT "FK_0e74786345edce55f584f261d9e" FOREIGN KEY ("parentFolderId") REFERENCES public.n8n_folder(id) ON DELETE CASCADE;


--
-- Name: n8n_insights_metadata FK_26bf5281b6cc20bb560186df6ae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_insights_metadata
    ADD CONSTRAINT "FK_26bf5281b6cc20bb560186df6ae" FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE SET NULL;


--
-- Name: n8n_project_relation FK_2cb31c081c23811bc50e05d52c3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_project_relation
    ADD CONSTRAINT "FK_2cb31c081c23811bc50e05d52c3" FOREIGN KEY ("userId") REFERENCES public.n8n_user(id) ON DELETE CASCADE;


--
-- Name: n8n_test_case_execution FK_42ac5f23bc7e2406eca4edf77e6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_test_case_execution
    ADD CONSTRAINT "FK_42ac5f23bc7e2406eca4edf77e6" FOREIGN KEY ("testRunId") REFERENCES public.n8n_test_run(id) ON DELETE CASCADE;


--
-- Name: n8n_data_table_column FK_5803156b6e510e934104b95a0db; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_data_table_column
    ADD CONSTRAINT "FK_5803156b6e510e934104b95a0db" FOREIGN KEY ("dataTableId") REFERENCES public.n8n_data_table(id) ON DELETE CASCADE;


--
-- Name: n8n_folder_tag FK_5d0ab94f1793f36e17525e90e86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_folder_tag
    ADD CONSTRAINT "FK_5d0ab94f1793f36e17525e90e86" FOREIGN KEY ("folderId") REFERENCES public.n8n_folder(id) ON DELETE CASCADE;


--
-- Name: n8n_processed_data FK_5dab88f195c5f8714738fe6f2cb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_processed_data
    ADD CONSTRAINT "FK_5dab88f195c5f8714738fe6f2cb" FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_test_case_execution FK_6af66647dfe6f3dc0a555ea5b83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_test_case_execution
    ADD CONSTRAINT "FK_6af66647dfe6f3dc0a555ea5b83" FOREIGN KEY ("executionId") REFERENCES public.n8n_execution_entity(id) ON DELETE SET NULL;


--
-- Name: n8n_shared_credentials FK_a129f5039224af52757a803d726; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_shared_credentials
    ADD CONSTRAINT "FK_a129f5039224af52757a803d726" FOREIGN KEY ("projectId") REFERENCES public.n8n_project(id) ON DELETE CASCADE;


--
-- Name: n8n_execution_annotation_tags FK_a248403c2dc457fbfce5ceb2f00; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_annotation_tags
    ADD CONSTRAINT "FK_a248403c2dc457fbfce5ceb2f00" FOREIGN KEY ("annotationId") REFERENCES public.n8n_execution_annotations(id) ON DELETE CASCADE;


--
-- Name: n8n_data_table FK_aaf492d274d012d6874cdde1e3a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_data_table
    ADD CONSTRAINT "FK_aaf492d274d012d6874cdde1e3a" FOREIGN KEY ("projectId") REFERENCES public.n8n_project(id) ON DELETE CASCADE;


--
-- Name: n8n_folder_tag FK_aca3e793587fa20e881d08abc52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_folder_tag
    ADD CONSTRAINT "FK_aca3e793587fa20e881d08abc52" FOREIGN KEY ("tagId") REFERENCES public.n8n_tag_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_folder FK_afd0e7755aafe1b601875bd3546; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_folder
    ADD CONSTRAINT "FK_afd0e7755aafe1b601875bd3546" FOREIGN KEY ("projectId") REFERENCES public.n8n_project(id) ON DELETE CASCADE;


--
-- Name: n8n_shared_credentials FK_baad93e50af4837d020c7e170f9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_shared_credentials
    ADD CONSTRAINT "FK_baad93e50af4837d020c7e170f9" FOREIGN KEY ("credentialsId") REFERENCES public.n8n_credentials_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_insights_raw FK_bcc7afc40a976478466c59ef99b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_insights_raw
    ADD CONSTRAINT "FK_bcc7afc40a976478466c59ef99b" FOREIGN KEY ("metaId") REFERENCES public.n8n_insights_metadata("metaId") ON DELETE CASCADE;


--
-- Name: n8n_execution_annotation_tags FK_be73b755e714e97de8954386e7c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_annotation_tags
    ADD CONSTRAINT "FK_be73b755e714e97de8954386e7c" FOREIGN KEY ("tagId") REFERENCES public.n8n_annotation_tag_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_insights_metadata FK_be818f02aad7b2659e0b62e663e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_insights_metadata
    ADD CONSTRAINT "FK_be818f02aad7b2659e0b62e663e" FOREIGN KEY ("projectId") REFERENCES public.n8n_project(id) ON DELETE SET NULL;


--
-- Name: n8n_user_api_keys FK_c7a35bcdce3e355871c3ce11b25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_user_api_keys
    ADD CONSTRAINT "FK_c7a35bcdce3e355871c3ce11b25" FOREIGN KEY ("userId") REFERENCES public.n8n_user(id) ON DELETE CASCADE;


--
-- Name: n8n_test_run FK_ca95e303cf3e22671fe013c9d30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_test_run
    ADD CONSTRAINT "FK_ca95e303cf3e22671fe013c9d30" FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_project_relation FK_db6bffc65f3aace2d36d8f835fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_project_relation
    ADD CONSTRAINT "FK_db6bffc65f3aace2d36d8f835fe" FOREIGN KEY (role) REFERENCES public.n8n_role(slug);


--
-- Name: n8n_project_relation FK_dcc03d2f488128fb82d276c9945; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_project_relation
    ADD CONSTRAINT "FK_dcc03d2f488128fb82d276c9945" FOREIGN KEY ("projectId") REFERENCES public.n8n_project(id) ON DELETE CASCADE;


--
-- Name: n8n_user FK_e39311f2777845b2f96a9a04579; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_user
    ADD CONSTRAINT "FK_e39311f2777845b2f96a9a04579" FOREIGN KEY ("roleSlug") REFERENCES public.n8n_role(slug);


--
-- Name: n8n_execution_annotations FK_e3b4b30c8de00a305c55a2088fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_annotations
    ADD CONSTRAINT "FK_e3b4b30c8de00a305c55a2088fe" FOREIGN KEY ("executionId") REFERENCES public.n8n_execution_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_execution_metadata FK_ea59e8bd757e45bea4084aecaaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_metadata
    ADD CONSTRAINT "FK_ea59e8bd757e45bea4084aecaaa" FOREIGN KEY ("executionId") REFERENCES public.n8n_execution_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_shared_workflow FK_f380a47651b746f977183b4ed7d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_shared_workflow
    ADD CONSTRAINT "FK_f380a47651b746f977183b4ed7d" FOREIGN KEY ("projectId") REFERENCES public.n8n_project(id) ON DELETE CASCADE;


--
-- Name: n8n_workflow_history FK_fdbda01fc0a7c7c513cf2bcb8f4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflow_history
    ADD CONSTRAINT "FK_fdbda01fc0a7c7c513cf2bcb8f4" FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_installed_nodes FK_n8n_73f857fc5dce682cef8a99c11dbddbc969618951; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_installed_nodes
    ADD CONSTRAINT "FK_n8n_73f857fc5dce682cef8a99c11dbddbc969618951" FOREIGN KEY (package) REFERENCES public.n8n_installed_packages("packageName") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: n8n_role_scope FK_n8n_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_role_scope
    ADD CONSTRAINT "FK_n8n_role" FOREIGN KEY ("roleSlug") REFERENCES public.n8n_role(slug) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: n8n_role_scope FK_n8n_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_role_scope
    ADD CONSTRAINT "FK_n8n_scope" FOREIGN KEY ("scopeSlug") REFERENCES public.n8n_scope(slug) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: n8n_execution_entity fk_n8n_execution_entity_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_entity
    ADD CONSTRAINT fk_n8n_execution_entity_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_webhook_entity fk_n8n_webhook_entity_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_webhook_entity
    ADD CONSTRAINT fk_n8n_webhook_entity_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_workflow_statistics fk_n8n_workflow_statistics_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflow_statistics
    ADD CONSTRAINT fk_n8n_workflow_statistics_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_workflows_tags fk_n8n_workflows_tags_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflows_tags
    ADD CONSTRAINT fk_n8n_workflows_tags_tag_id FOREIGN KEY ("tagId") REFERENCES public.n8n_tag_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_workflows_tags fk_n8n_workflows_tags_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflows_tags
    ADD CONSTRAINT fk_n8n_workflows_tags_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.n8n_workflow_entity(id) ON DELETE CASCADE;


--
-- Name: n8n_workflow_entity fk_workflow_parent_folder; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_workflow_entity
    ADD CONSTRAINT fk_workflow_parent_folder FOREIGN KEY ("parentFolderId") REFERENCES public.n8n_folder(id) ON DELETE CASCADE;


--
-- Name: n8n_auth_identity n8n_auth_identity_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_auth_identity
    ADD CONSTRAINT "n8n_auth_identity_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.n8n_user(id);


--
-- Name: n8n_execution_data n8n_execution_data_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.n8n_execution_data
    ADD CONSTRAINT n8n_execution_data_fk FOREIGN KEY ("executionId") REFERENCES public.n8n_execution_entity(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict jQGJAL4bpLCY0cU3Cg7PdvKlSCYOgjCOwj4Q6hmLMuFyO88bnTZ2aR7xgqtkfl8

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict IkYWqYf7QLU1jaTzjSekfgVBIJhalo5LEXFXfW12ErvCj8kTnivQACzVayGSQ2Y

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
-- Name: directus_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO postgres;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO postgres;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO postgres;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone,
    user_task_id integer
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO postgres;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO postgres;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json,
    accepted_terms boolean DEFAULT false,
    project_id uuid,
    mcp_enabled boolean DEFAULT false NOT NULL,
    mcp_allow_deletes boolean DEFAULT false NOT NULL,
    mcp_prompts_collection character varying(255) DEFAULT NULL::character varying,
    mcp_system_prompt_enabled boolean DEFAULT true NOT NULL,
    mcp_system_prompt text
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO postgres;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO postgres;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    text_direction character varying(255) DEFAULT 'auto'::character varying NOT NULL
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


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
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


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
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


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
-- Name: directus_files_user_task_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX directus_files_user_task_id_index ON public.directus_files USING btree (user_task_id);


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
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_user_task_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_user_task_id_foreign FOREIGN KEY (user_task_id) REFERENCES public.user_tasks(id) ON DELETE SET NULL;


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


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

\unrestrict IkYWqYf7QLU1jaTzjSekfgVBIJhalo5LEXFXfW12ErvCj8kTnivQACzVayGSQ2Y

--
-- PostgreSQL database cluster dump complete
--

