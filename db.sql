--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: addresses; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE addresses (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    address_line1 character varying(50) NOT NULL,
    address_line2 character varying(50),
    country character varying(50) NOT NULL,
    postal_code character varying(4) NOT NULL,
    region character varying(5) NOT NULL,
    suburb character varying(50) NOT NULL
);


ALTER TABLE public.addresses OWNER TO zainul;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO zainul;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: approval_setting_details; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE approval_setting_details (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    level integer,
    approval_setting_id bigint NOT NULL,
    employee_id bigint,
    position_id bigint NOT NULL
);


ALTER TABLE public.approval_setting_details OWNER TO zainul;

--
-- Name: approval_setting_details_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE approval_setting_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.approval_setting_details_id_seq OWNER TO zainul;

--
-- Name: approval_setting_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE approval_setting_details_id_seq OWNED BY approval_setting_details.id;


--
-- Name: approval_settings; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE approval_settings (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    criteria_limit_value integer,
    criteria_unit character varying(255),
    name character varying(100) NOT NULL,
    resource_api bigint NOT NULL
);


ALTER TABLE public.approval_settings OWNER TO zainul;

--
-- Name: approval_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE approval_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.approval_settings_id_seq OWNER TO zainul;

--
-- Name: approval_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE approval_settings_id_seq OWNED BY approval_settings.id;


--
-- Name: assets; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE assets (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(100) NOT NULL,
    description character varying(255),
    name character varying(100) NOT NULL
);


ALTER TABLE public.assets OWNER TO zainul;

--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assets_id_seq OWNER TO zainul;

--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE assets_id_seq OWNED BY assets.id;


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE attachments (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    attachment_type character varying(255),
    link character varying(255),
    name character varying(255),
    type character varying(255)
);


ALTER TABLE public.attachments OWNER TO zainul;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO zainul;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- Name: audit_exceptions; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE audit_exceptions (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    master_exception_detail_id bigint,
    task_id bigint
);


ALTER TABLE public.audit_exceptions OWNER TO zainul;

--
-- Name: audit_exceptions_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE audit_exceptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_exceptions_id_seq OWNER TO zainul;

--
-- Name: audit_exceptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE audit_exceptions_id_seq OWNED BY audit_exceptions.id;


--
-- Name: audit_trails; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE audit_trails (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    action character varying(255) NOT NULL,
    current_state json,
    description character varying(1000) NOT NULL,
    entity_id character varying(255) NOT NULL,
    entity_name character varying(255) NOT NULL,
    previous_state json,
    user_id bigint
);


ALTER TABLE public.audit_trails OWNER TO zainul;

--
-- Name: audit_trails_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE audit_trails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_trails_id_seq OWNER TO zainul;

--
-- Name: audit_trails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE audit_trails_id_seq OWNED BY audit_trails.id;


--
-- Name: basis_types; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE basis_types (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    info character varying(20) NOT NULL
);


ALTER TABLE public.basis_types OWNER TO zainul;

--
-- Name: basis_types_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE basis_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basis_types_id_seq OWNER TO zainul;

--
-- Name: basis_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE basis_types_id_seq OWNED BY basis_types.id;


--
-- Name: calendar_types; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE calendar_types (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    type character varying(20) NOT NULL
);


ALTER TABLE public.calendar_types OWNER TO zainul;

--
-- Name: calendar_types_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE calendar_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendar_types_id_seq OWNER TO zainul;

--
-- Name: calendar_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE calendar_types_id_seq OWNED BY calendar_types.id;


--
-- Name: check_box_property_options; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE check_box_property_options (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255)
);


ALTER TABLE public.check_box_property_options OWNER TO zainul;

--
-- Name: comment_attachment; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE comment_attachment (
    comment_id bigint NOT NULL,
    attachment_id bigint NOT NULL
);


ALTER TABLE public.comment_attachment OWNER TO zainul;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE comments (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    resource_id bigint,
    text character varying(10000),
    type character varying(255),
    user_id bigint
);


ALTER TABLE public.comments OWNER TO zainul;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO zainul;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE contacts (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    abn character varying(255),
    email character varying(255) NOT NULL,
    fax character varying(255),
    mobile_phone character varying(255),
    name character varying(255) NOT NULL,
    pic_first_name character varying(255),
    pic_last_name character varying(255),
    pic_middle_name character varying(255),
    used_for character varying(255),
    website character varying(255),
    work_phone character varying(255),
    supplier_type_id bigint
);


ALTER TABLE public.contacts OWNER TO zainul;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO zainul;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: detail_lookups; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE detail_lookups (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    detail_description character varying(255),
    detail_name character varying(255) NOT NULL,
    detail_value character varying(255),
    master_lookup_id bigint NOT NULL
);


ALTER TABLE public.detail_lookups OWNER TO zainul;

--
-- Name: detail_lookups_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE detail_lookups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detail_lookups_id_seq OWNER TO zainul;

--
-- Name: detail_lookups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE detail_lookups_id_seq OWNED BY detail_lookups.id;


--
-- Name: document_options; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE document_options (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    alias character varying(255),
    name character varying(255) NOT NULL,
    type character varying(20)
);


ALTER TABLE public.document_options OWNER TO zainul;

--
-- Name: document_options_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE document_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_options_id_seq OWNER TO zainul;

--
-- Name: document_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE document_options_id_seq OWNED BY document_options.id;


--
-- Name: earning_rates; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE earning_rates (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    rate double precision NOT NULL
);


ALTER TABLE public.earning_rates OWNER TO zainul;

--
-- Name: earning_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE earning_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earning_rates_id_seq OWNER TO zainul;

--
-- Name: earning_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE earning_rates_id_seq OWNED BY earning_rates.id;


--
-- Name: email_alert_template; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE email_alert_template (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    alert_time time without time zone NOT NULL,
    condition character varying(255) NOT NULL,
    duration character varying(255) NOT NULL,
    message character varying(5000) NOT NULL,
    name character varying(255) NOT NULL,
    number_of_duration integer NOT NULL,
    signature character varying(5000) NOT NULL,
    subject character varying(255) NOT NULL
);


ALTER TABLE public.email_alert_template OWNER TO zainul;

--
-- Name: email_alert_template_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE email_alert_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_alert_template_id_seq OWNER TO zainul;

--
-- Name: email_alert_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE email_alert_template_id_seq OWNED BY email_alert_template.id;


--
-- Name: email_logs; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE email_logs (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    mail_process character varying(255) NOT NULL,
    mail_recipient character varying(255) NOT NULL,
    mail_status character varying(255) NOT NULL,
    mail_subject character varying(255),
    object_data character varying(255),
    sent_time timestamp without time zone NOT NULL
);


ALTER TABLE public.email_logs OWNER TO zainul;

--
-- Name: email_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE email_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_logs_id_seq OWNER TO zainul;

--
-- Name: email_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE email_logs_id_seq OWNED BY email_logs.id;


--
-- Name: employee_bank_accounts; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE employee_bank_accounts (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    account_name character varying(32) NOT NULL,
    account_number character varying(9) NOT NULL,
    amount double precision NOT NULL,
    bsb character varying(6) NOT NULL,
    remainder boolean NOT NULL,
    statement_text character varying(18) NOT NULL,
    employee_id bigint NOT NULL
);


ALTER TABLE public.employee_bank_accounts OWNER TO zainul;

--
-- Name: employee_bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE employee_bank_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_bank_accounts_id_seq OWNER TO zainul;

--
-- Name: employee_bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE employee_bank_accounts_id_seq OWNED BY employee_bank_accounts.id;


--
-- Name: employee_file_permissions; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE employee_file_permissions (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    employee_id bigint,
    file_id bigint NOT NULL,
    file_permission_id bigint NOT NULL
);


ALTER TABLE public.employee_file_permissions OWNER TO zainul;

--
-- Name: employee_file_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE employee_file_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_file_permissions_id_seq OWNER TO zainul;

--
-- Name: employee_file_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE employee_file_permissions_id_seq OWNED BY employee_file_permissions.id;


--
-- Name: employee_positions; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE employee_positions (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    basis_type character varying(255),
    is_primary boolean DEFAULT true,
    employee_id bigint NOT NULL,
    position_id bigint
);


ALTER TABLE public.employee_positions OWNER TO zainul;

--
-- Name: employee_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE employee_positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_positions_id_seq OWNER TO zainul;

--
-- Name: employee_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE employee_positions_id_seq OWNED BY employee_positions.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE employees (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    classification character varying(255),
    emp_group_name character varying(255),
    employee_id character varying(255) NOT NULL,
    is_archived boolean DEFAULT false NOT NULL,
    is_authorised_to_approve_leave boolean NOT NULL,
    is_authorised_to_approve_timesheets boolean NOT NULL,
    job_title character varying(255),
    occupation character varying(50),
    police_check character varying(255),
    police_check_date date,
    police_ch_ren_date date,
    qualification character varying(255),
    qualification_attainment_date date,
    qualification_expiration_date date,
    start_date date,
    status character varying DEFAULT 'ACTIVE'::character varying NOT NULL,
    termination_date date,
    termination_reason character varying(50),
    twitter_username character varying(255),
    xero_id character varying(255),
    location_id bigint,
    earning_rate_id bigint,
    payroll_calendar_id bigint,
    person_id bigint,
    report_manager_id bigint,
    tax_declaration_id bigint
);


ALTER TABLE public.employees OWNER TO zainul;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO zainul;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: exception_attachment; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE exception_attachment (
    main_exception_id bigint NOT NULL,
    attachment_id bigint NOT NULL
);


ALTER TABLE public.exception_attachment OWNER TO zainul;

--
-- Name: exception_notification; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE exception_notification (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    client_time_zone character varying(255),
    server_time_zone character varying(255),
    "time" time without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.exception_notification OWNER TO zainul;

--
-- Name: exception_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE exception_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_notification_id_seq OWNER TO zainul;

--
-- Name: exception_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE exception_notification_id_seq OWNED BY exception_notification.id;


--
-- Name: file_approver; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE file_approver (
    file_id bigint NOT NULL,
    approver_id bigint NOT NULL
);


ALTER TABLE public.file_approver OWNER TO zainul;

--
-- Name: file_permissions; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE file_permissions (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255),
    original_name character varying(255)
);


ALTER TABLE public.file_permissions OWNER TO zainul;

--
-- Name: file_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE file_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_permissions_id_seq OWNER TO zainul;

--
-- Name: file_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE file_permissions_id_seq OWNED BY file_permissions.id;


--
-- Name: file_tags; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE file_tags (
    file_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.file_tags OWNER TO zainul;

--
-- Name: file_trigger_schedule; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE file_trigger_schedule (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    email_alert_id bigint,
    trigger_name character varying(255),
    file_id bigint NOT NULL
);


ALTER TABLE public.file_trigger_schedule OWNER TO zainul;

--
-- Name: file_trigger_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE file_trigger_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_trigger_schedule_id_seq OWNER TO zainul;

--
-- Name: file_trigger_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE file_trigger_schedule_id_seq OWNED BY file_trigger_schedule.id;


--
-- Name: file_uploadby_supplier; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE file_uploadby_supplier (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    token character varying(255)
);


ALTER TABLE public.file_uploadby_supplier OWNER TO zainul;

--
-- Name: file_uploadby_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE file_uploadby_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_uploadby_supplier_id_seq OWNER TO zainul;

--
-- Name: file_uploadby_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE file_uploadby_supplier_id_seq OWNED BY file_uploadby_supplier.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE files (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    archived_reason character varying(255),
    download_url character varying(255),
    expired_date date,
    file_directory character varying(255),
    file_type character varying(255),
    google_drive_id character varying(255),
    google_drive_reference character varying(255),
    is_approved boolean,
    is_archived boolean,
    is_new boolean,
    is_rejected boolean,
    is_request_archived boolean,
    is_supplier_upload boolean,
    is_updated boolean,
    name character varying(255),
    name_in_storage character varying(255),
    rejected_reason character varying(255),
    approver_id bigint,
    contact_id bigint,
    creator_id bigint,
    document_category_id bigint,
    document_type_id bigint,
    location_id bigint,
    parent_revision_id bigint,
    project_id bigint,
    standard_id bigint,
    updater_id bigint
);


ALTER TABLE public.files OWNER TO zainul;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO zainul;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE files_id_seq OWNED BY files.id;


--
-- Name: google_drive_response; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE google_drive_response (
    id integer NOT NULL,
    description character varying(255),
    extension character varying(255),
    iconurl character varying(255),
    lasteditedutc double precision,
    mimetype character varying(255),
    name character varying(255),
    parentid character varying(255),
    serviceid character varying(255),
    type character varying(255),
    url character varying(255)
);


ALTER TABLE public.google_drive_response OWNER TO zainul;

--
-- Name: google_drive_response_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE google_drive_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.google_drive_response_id_seq OWNER TO zainul;

--
-- Name: google_drive_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE google_drive_response_id_seq OWNED BY google_drive_response.id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO zainul;

--
-- Name: item_details; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE item_details (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    invoice_number character varying(255),
    item_type character varying(7) DEFAULT 'ITEM'::character varying,
    name character varying(255),
    price numeric(19,2),
    supplier_id bigint,
    task_reactive_detail_id bigint NOT NULL
);


ALTER TABLE public.item_details OWNER TO zainul;

--
-- Name: item_details_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE item_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_details_id_seq OWNER TO zainul;

--
-- Name: item_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE item_details_id_seq OWNED BY item_details.id;


--
-- Name: leave_request; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE leave_request (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    approve_by character varying(255),
    approve_dt timestamp without time zone,
    end_date timestamp without time zone,
    reason character varying(255),
    request_date timestamp without time zone,
    start_date timestamp without time zone,
    status character varying(255),
    title character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.leave_request OWNER TO zainul;

--
-- Name: leave_request_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE leave_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_request_id_seq OWNER TO zainul;

--
-- Name: leave_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE leave_request_id_seq OWNED BY leave_request.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE links (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255),
    resource_id bigint,
    text character varying(10000),
    type character varying(255),
    user_id bigint
);


ALTER TABLE public.links OWNER TO zainul;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.links_id_seq OWNER TO zainul;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- Name: location_path; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE location_path (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    length integer,
    ancestor bigint NOT NULL,
    descendant bigint NOT NULL
);


ALTER TABLE public.location_path OWNER TO zainul;

--
-- Name: location_path_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE location_path_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_path_id_seq OWNER TO zainul;

--
-- Name: location_path_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE location_path_id_seq OWNED BY location_path.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE locations (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    level integer,
    name character varying(100),
    location_type integer,
    value character varying(255),
    address_id bigint,
    parent_id bigint
);


ALTER TABLE public.locations OWNER TO zainul;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO zainul;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: main_exception; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE main_exception (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(1000),
    exceptionid bigint NOT NULL,
    exception_type bigint NOT NULL
);


ALTER TABLE public.main_exception OWNER TO zainul;

--
-- Name: main_exception_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE main_exception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_exception_id_seq OWNER TO zainul;

--
-- Name: main_exception_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE main_exception_id_seq OWNED BY main_exception.id;


--
-- Name: master_exception; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE master_exception (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    position_id bigint
);


ALTER TABLE public.master_exception OWNER TO zainul;

--
-- Name: master_exception_detail; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE master_exception_detail (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    master_exception_id bigint
);


ALTER TABLE public.master_exception_detail OWNER TO zainul;

--
-- Name: master_exception_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE master_exception_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_exception_detail_id_seq OWNER TO zainul;

--
-- Name: master_exception_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE master_exception_detail_id_seq OWNED BY master_exception_detail.id;


--
-- Name: master_exception_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE master_exception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_exception_id_seq OWNER TO zainul;

--
-- Name: master_exception_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE master_exception_id_seq OWNED BY master_exception.id;


--
-- Name: master_lookups; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE master_lookups (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    master_name character varying(255)
);


ALTER TABLE public.master_lookups OWNER TO zainul;

--
-- Name: master_lookups_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE master_lookups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_lookups_id_seq OWNER TO zainul;

--
-- Name: master_lookups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE master_lookups_id_seq OWNED BY master_lookups.id;


--
-- Name: message_recipients; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE message_recipients (
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    is_seen boolean DEFAULT false NOT NULL,
    user_id bigint NOT NULL,
    message_id character varying(255) NOT NULL
);


ALTER TABLE public.message_recipients OWNER TO zainul;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE messages (
    message_id character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    body character varying(1000),
    created_at timestamp without time zone,
    extended_route integer,
    extended_url character varying(255),
    subject character varying(100),
    reply_from character varying(255),
    sender bigint
);


ALTER TABLE public.messages OWNER TO zainul;

--
-- Name: notification_recipient; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE notification_recipient (
    id character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    is_seen boolean DEFAULT false NOT NULL,
    notification_id character varying(255) NOT NULL,
    recipient_id bigint NOT NULL
);


ALTER TABLE public.notification_recipient OWNER TO zainul;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE notifications (
    id character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    created_at timestamp without time zone,
    entity_id character varying(255),
    entity_name character varying(255) NOT NULL,
    message character varying(255),
    process_name character varying(255),
    title character varying(255),
    url character varying(255),
    sender bigint
);


ALTER TABLE public.notifications OWNER TO zainul;

--
-- Name: organisation_settings; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE organisation_settings (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    timesheet_category_id bigint
);


ALTER TABLE public.organisation_settings OWNER TO zainul;

--
-- Name: organisation_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE organisation_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organisation_settings_id_seq OWNER TO zainul;

--
-- Name: organisation_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE organisation_settings_id_seq OWNED BY organisation_settings.id;


--
-- Name: payroll_calendars; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE payroll_calendars (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    payment_date timestamp without time zone NOT NULL,
    start_date timestamp without time zone NOT NULL,
    calendar_type_id bigint
);


ALTER TABLE public.payroll_calendars OWNER TO zainul;

--
-- Name: payroll_calendars_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE payroll_calendars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payroll_calendars_id_seq OWNER TO zainul;

--
-- Name: payroll_calendars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE payroll_calendars_id_seq OWNED BY payroll_calendars.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE permissions (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(100) NOT NULL,
    spring_role character varying(255) NOT NULL
);


ALTER TABLE public.permissions OWNER TO zainul;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO zainul;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE persons (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    date_of_birth date NOT NULL,
    email character varying(255),
    first_name character varying(35) NOT NULL,
    gender character varying(255) NOT NULL,
    home_phone character varying(50),
    last_name character varying(35) NOT NULL,
    middle_name character varying(35),
    mobile_phone character varying(50),
    next_of_kin_desc character varying(50),
    photo character varying(255),
    title character varying(20),
    work_phone character varying(50),
    address_id bigint NOT NULL,
    next_of_kin_id bigint,
    user_id bigint
);


ALTER TABLE public.persons OWNER TO zainul;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE persons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_id_seq OWNER TO zainul;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE persons_id_seq OWNED BY persons.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE positions (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    allias character varying(5),
    level integer NOT NULL,
    name character varying(50) NOT NULL,
    parent_level_id bigint,
    position_id bigint
);


ALTER TABLE public.positions OWNER TO zainul;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO zainul;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE project (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    actual_end_date timestamp without time zone,
    actual_start_date timestamp without time zone,
    currency character varying(255),
    description character varying(255),
    end_date timestamp without time zone,
    initial_budget_estimation numeric(19,2),
    is_audited boolean DEFAULT false NOT NULL,
    name character varying(255) NOT NULL,
    project_type character varying(50) DEFAULT 'OTHER'::character varying,
    start_date timestamp without time zone,
    auditor_id bigint,
    creator_id bigint,
    location_id bigint,
    project_audit_id bigint
);


ALTER TABLE public.project OWNER TO zainul;

--
-- Name: project_has_standards; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE project_has_standards (
    project_id bigint NOT NULL,
    standards_id bigint NOT NULL
);


ALTER TABLE public.project_has_standards OWNER TO zainul;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO zainul;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE project_id_seq OWNED BY project.id;


--
-- Name: project_users; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE project_users (
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    permission_project character varying(255),
    user_id bigint NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.project_users OWNER TO zainul;

--
-- Name: property_values; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE property_values (
    dtype character varying(31) NOT NULL,
    id character varying(255) NOT NULL,
    value numeric(19,2)
);


ALTER TABLE public.property_values OWNER TO zainul;

--
-- Name: property_values_check_box_property_options; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE property_values_check_box_property_options (
    checkboxpropertyvalue_id character varying(255) NOT NULL,
    value_id bigint NOT NULL
);


ALTER TABLE public.property_values_check_box_property_options OWNER TO zainul;

--
-- Name: public_holiday; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE public_holiday (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    end_date date,
    name character varying(255),
    start_date date NOT NULL,
    timezone character varying(50) DEFAULT 'UTC'::character varying,
    type character varying(255)
);


ALTER TABLE public.public_holiday OWNER TO zainul;

--
-- Name: public_holiday_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE public_holiday_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.public_holiday_id_seq OWNER TO zainul;

--
-- Name: public_holiday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE public_holiday_id_seq OWNED BY public_holiday.id;


--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.qrtz_blob_triggers OWNER TO zainul;

--
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


ALTER TABLE public.qrtz_calendars OWNER TO zainul;

--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO zainul;

--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO zainul;

--
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


ALTER TABLE public.qrtz_job_details OWNER TO zainul;

--
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.qrtz_locks OWNER TO zainul;

--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.qrtz_paused_trigger_grps OWNER TO zainul;

--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


ALTER TABLE public.qrtz_scheduler_state OWNER TO zainul;

--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO zainul;

--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


ALTER TABLE public.qrtz_simprop_triggers OWNER TO zainul;

--
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


ALTER TABLE public.qrtz_triggers OWNER TO zainul;

--
-- Name: radio_button_property_options; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE radio_button_property_options (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255)
);


ALTER TABLE public.radio_button_property_options OWNER TO zainul;

--
-- Name: residents; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE residents (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    admitted_date date,
    created_at timestamp without time zone,
    departed_date date,
    departure_reason character varying(255),
    status character varying DEFAULT 'ACTIVE'::character varying NOT NULL,
    person_id bigint
);


ALTER TABLE public.residents OWNER TO zainul;

--
-- Name: residents_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE residents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.residents_id_seq OWNER TO zainul;

--
-- Name: residents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE residents_id_seq OWNED BY residents.id;


--
-- Name: resource_api; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE resource_api (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    method character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    path character varying(255) NOT NULL
);


ALTER TABLE public.resource_api OWNER TO zainul;

--
-- Name: resource_api_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE resource_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_api_id_seq OWNER TO zainul;

--
-- Name: resource_api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE resource_api_id_seq OWNED BY resource_api.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE role_permissions (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    create_permission boolean NOT NULL,
    delete_permission boolean NOT NULL,
    read_permission boolean NOT NULL,
    update_permission boolean NOT NULL,
    id_permission bigint,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO zainul;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_id_seq OWNER TO zainul;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE role_permissions_id_seq OWNED BY role_permissions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE roles (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.roles OWNER TO zainul;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO zainul;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roster_histories; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE roster_histories (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    action integer NOT NULL,
    description character varying(255),
    reason character varying(255),
    creator_action_id bigint NOT NULL,
    receiver_id bigint,
    roster_id bigint NOT NULL
);


ALTER TABLE public.roster_histories OWNER TO zainul;

--
-- Name: roster_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE roster_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roster_histories_id_seq OWNER TO zainul;

--
-- Name: roster_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE roster_histories_id_seq OWNED BY roster_histories.id;


--
-- Name: rosters; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE rosters (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    end_date timestamp without time zone,
    length_of_minute integer,
    roster_assignee integer NOT NULL,
    roster_status integer,
    start_date timestamp without time zone,
    employee_id bigint NOT NULL,
    location_id bigint NOT NULL,
    manager_id bigint NOT NULL,
    reference_rooster_id bigint
);


ALTER TABLE public.rosters OWNER TO zainul;

--
-- Name: rosters_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE rosters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rosters_id_seq OWNER TO zainul;

--
-- Name: rosters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE rosters_id_seq OWNED BY rosters.id;


--
-- Name: routine_tasks; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE routine_tasks (
    id character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    routine_id character varying(255),
    task_template_id bigint,
    routine_task_id character varying(255)
);


ALTER TABLE public.routine_tasks OWNER TO zainul;

--
-- Name: routines; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE routines (
    id character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.routines OWNER TO zainul;

--
-- Name: stake_holders; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE stake_holders (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    job_title character varying(255),
    xero_id character varying(255),
    person_id bigint
);


ALTER TABLE public.stake_holders OWNER TO zainul;

--
-- Name: stake_holders_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE stake_holders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stake_holders_id_seq OWNER TO zainul;

--
-- Name: stake_holders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE stake_holders_id_seq OWNED BY stake_holders.id;


--
-- Name: standards; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE standards (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(100) NOT NULL,
    description character varying(255),
    name character varying(100) NOT NULL
);


ALTER TABLE public.standards OWNER TO zainul;

--
-- Name: standards_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE standards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standards_id_seq OWNER TO zainul;

--
-- Name: standards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE standards_id_seq OWNED BY standards.id;


--
-- Name: supplier_type_position; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE supplier_type_position (
    supplier_type_id bigint NOT NULL,
    position_id bigint NOT NULL
);


ALTER TABLE public.supplier_type_position OWNER TO zainul;

--
-- Name: supplier_types; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE supplier_types (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.supplier_types OWNER TO zainul;

--
-- Name: supplier_types_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE supplier_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_types_id_seq OWNER TO zainul;

--
-- Name: supplier_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE supplier_types_id_seq OWNED BY supplier_types.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE suppliers (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name_of_organization character varying(50) NOT NULL,
    xero_id character varying(255),
    person_id bigint
);


ALTER TABLE public.suppliers OWNER TO zainul;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_id_seq OWNER TO zainul;

--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE suppliers_id_seq OWNED BY suppliers.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE tags (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255)
);


ALTER TABLE public.tags OWNER TO zainul;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO zainul;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    actualenddate timestamp without time zone,
    actual_start_date timestamp without time zone,
    all_day boolean DEFAULT false NOT NULL,
    audit_exception_reason character varying(255),
    audit_status character varying(20) DEFAULT 'NONE'::character varying,
    audited_on timestamp without time zone,
    completed_on timestamp without time zone,
    created_on_timezone character varying(50) DEFAULT 'UTC'::character varying,
    description character varying(255),
    end_date timestamp without time zone NOT NULL,
    exception_reason character varying(255),
    exception_reported_on timestamp without time zone,
    is_audited boolean DEFAULT false NOT NULL,
    name character varying(255) NOT NULL,
    include_public_holiday character varying(15) DEFAULT 'NONE'::character varying NOT NULL,
    priority character varying(255),
    repeat_end_date timestamp without time zone,
    repeated character varying(27) DEFAULT 'NONE'::character varying,
    start_date timestamp without time zone NOT NULL,
    status character varying(255),
    asset_id bigint,
    assigned_by bigint NOT NULL,
    auditor_id bigint,
    completed_by bigint,
    exception_reported_by bigint,
    location_id bigint,
    parent_task_id bigint,
    project_id bigint NOT NULL,
    repeat_from_task_id bigint,
    task_reactive_detail_id bigint,
    tasklist_id bigint NOT NULL
);


ALTER TABLE public.task OWNER TO zainul;

--
-- Name: task_assigned_to_bulk_edit; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_assigned_to_bulk_edit (
    task_id bigint NOT NULL,
    assignees_id bigint NOT NULL
);


ALTER TABLE public.task_assigned_to_bulk_edit OWNER TO zainul;

--
-- Name: task_assignees; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_assignees (
    task_id bigint NOT NULL,
    assignees_id bigint NOT NULL
);


ALTER TABLE public.task_assignees OWNER TO zainul;

--
-- Name: task_assignees_bulk_edit; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_assignees_bulk_edit (
    task_id bigint NOT NULL,
    assignees_id bigint NOT NULL
);


ALTER TABLE public.task_assignees_bulk_edit OWNER TO zainul;

--
-- Name: task_attachment; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_attachment (
    task_id bigint NOT NULL,
    attachment_id bigint NOT NULL
);


ALTER TABLE public.task_attachment OWNER TO zainul;

--
-- Name: task_bulk_edit; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_bulk_edit (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    push_task_skipweekends boolean,
    end_date date NOT NULL,
    modify_sub_task boolean,
    move_end_date date,
    move_start_date date,
    number_ofdays_push_task integer,
    pick_assigned_to_type character varying(255),
    pick_assignees boolean,
    pick_assignees_type character varying(255),
    pick_move_date boolean,
    pick_move_date_type integer,
    pick_priority boolean,
    start_date date NOT NULL,
    task_priority character varying(255),
    tasklist_id bigint
);


ALTER TABLE public.task_bulk_edit OWNER TO zainul;

--
-- Name: task_bulk_edit_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE task_bulk_edit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_bulk_edit_id_seq OWNER TO zainul;

--
-- Name: task_bulk_edit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE task_bulk_edit_id_seq OWNED BY task_bulk_edit.id;


--
-- Name: task_categories; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_categories (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.task_categories OWNER TO zainul;

--
-- Name: task_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE task_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_categories_id_seq OWNER TO zainul;

--
-- Name: task_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE task_categories_id_seq OWNED BY task_categories.id;


--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO zainul;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE task_id_seq OWNED BY task.id;


--
-- Name: task_reactive_details; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_reactive_details (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    actual_cost numeric(19,2),
    actual_time character varying(255),
    initial_budget_estimation numeric(19,2),
    time_estimation character varying(255),
    asset_id bigint
);


ALTER TABLE public.task_reactive_details OWNER TO zainul;

--
-- Name: task_reactive_details_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE task_reactive_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_reactive_details_id_seq OWNER TO zainul;

--
-- Name: task_reactive_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE task_reactive_details_id_seq OWNED BY task_reactive_details.id;


--
-- Name: task_roster_id; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_roster_id (
    taskroster_id character varying(255) NOT NULL,
    propertyvalues_id character varying(255) NOT NULL
);


ALTER TABLE public.task_roster_id OWNER TO zainul;

--
-- Name: task_rosters; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_rosters (
    id character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    end_time timestamp without time zone,
    start_time timestamp without time zone,
    roster_id bigint,
    routine_task_id character varying(255)
);


ALTER TABLE public.task_rosters OWNER TO zainul;

--
-- Name: task_selecteddays; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_selecteddays (
    task_id bigint NOT NULL,
    selected_days integer
);


ALTER TABLE public.task_selecteddays OWNER TO zainul;

--
-- Name: task_standards; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_standards (
    task_id bigint NOT NULL,
    standards_id bigint NOT NULL
);


ALTER TABLE public.task_standards OWNER TO zainul;

--
-- Name: task_template; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE task_template (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    task_category_id bigint
);


ALTER TABLE public.task_template OWNER TO zainul;

--
-- Name: task_template_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE task_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_template_id_seq OWNER TO zainul;

--
-- Name: task_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE task_template_id_seq OWNED BY task_template.id;


--
-- Name: tasklist; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE tasklist (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    actual_cost numeric(19,2),
    actual_end_date timestamp without time zone,
    actual_start_date timestamp without time zone,
    currency character varying(255),
    description character varying(255),
    enddate timestamp without time zone,
    initial_budget_estimation numeric(19,2),
    name character varying(255) NOT NULL,
    startdate timestamp without time zone,
    creator_id bigint,
    location_id bigint,
    project_id bigint
);


ALTER TABLE public.tasklist OWNER TO zainul;

--
-- Name: tasklist_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE tasklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasklist_id_seq OWNER TO zainul;

--
-- Name: tasklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE tasklist_id_seq OWNED BY tasklist.id;


--
-- Name: tax_declarations; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE tax_declarations (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    approved_withholding_variation_percentage double precision,
    australian_resident_for_tax_purposes boolean,
    eligible_to_receive_leaving_loading boolean,
    has_help_debt boolean,
    has_sfss_debt boolean,
    has_tsl_debt boolean,
    tax_file_number character varying(255),
    tax_free_threshold_claimed boolean,
    tax_offset_estimated_amount integer,
    tfn_exemption_type character varying(255),
    upward_variation_tax_withholding_amount double precision
);


ALTER TABLE public.tax_declarations OWNER TO zainul;

--
-- Name: tax_declarations_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE tax_declarations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tax_declarations_id_seq OWNER TO zainul;

--
-- Name: tax_declarations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE tax_declarations_id_seq OWNED BY tax_declarations.id;


--
-- Name: tfn_exemption_types; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE tfn_exemption_types (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    information character varying(20) NOT NULL
);


ALTER TABLE public.tfn_exemption_types OWNER TO zainul;

--
-- Name: tfn_exemption_types_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE tfn_exemption_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tfn_exemption_types_id_seq OWNER TO zainul;

--
-- Name: tfn_exemption_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE tfn_exemption_types_id_seq OWNED BY tfn_exemption_types.id;


--
-- Name: tmp_approval; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE tmp_approval (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    batch_id bigint NOT NULL,
    create_by character varying(255),
    created_dt timestamp without time zone,
    description character varying(255),
    process_id bigint NOT NULL
);


ALTER TABLE public.tmp_approval OWNER TO zainul;

--
-- Name: tmp_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE tmp_approval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tmp_approval_id_seq OWNER TO zainul;

--
-- Name: tmp_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE tmp_approval_id_seq OWNED BY tmp_approval.id;


--
-- Name: tracking_categories; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE tracking_categories (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    is_archieved boolean DEFAULT false NOT NULL,
    name character varying(100) NOT NULL,
    status character varying DEFAULT 'ACTIVE'::character varying NOT NULL
);


ALTER TABLE public.tracking_categories OWNER TO zainul;

--
-- Name: tracking_category_options; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE tracking_category_options (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    is_archieved boolean DEFAULT false NOT NULL,
    name character varying(100),
    status character varying DEFAULT 'ACTIVE'::character varying NOT NULL,
    tracking_category_id bigint
);


ALTER TABLE public.tracking_category_options OWNER TO zainul;

--
-- Name: tracking_category_options_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE tracking_category_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_category_options_id_seq OWNER TO zainul;

--
-- Name: tracking_category_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE tracking_category_options_id_seq OWNED BY tracking_category_options.id;


--
-- Name: user_custom_permissions; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE user_custom_permissions (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    create_permission boolean NOT NULL,
    delete_permission boolean NOT NULL,
    read_permission boolean NOT NULL,
    update_permission boolean NOT NULL,
    id_permission bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_custom_permissions OWNER TO zainul;

--
-- Name: user_custom_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE user_custom_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_custom_permissions_id_seq OWNER TO zainul;

--
-- Name: user_custom_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE user_custom_permissions_id_seq OWNED BY user_custom_permissions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL,
    created_token_at timestamp without time zone,
    email character varying(100) NOT NULL,
    is_archieved boolean DEFAULT false NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100000),
    status character varying(10) DEFAULT 'ACTIVE'::character varying NOT NULL,
    user_type character varying(10) NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.users OWNER TO zainul;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: zainul
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO zainul;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zainul
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: uuidentity; Type: TABLE; Schema: public; Owner: zainul; Tablespace: 
--

CREATE TABLE uuidentity (
    id character varying(36) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    last_modified timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.uuidentity OWNER TO zainul;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY approval_setting_details ALTER COLUMN id SET DEFAULT nextval('approval_setting_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY approval_settings ALTER COLUMN id SET DEFAULT nextval('approval_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY assets ALTER COLUMN id SET DEFAULT nextval('assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY audit_exceptions ALTER COLUMN id SET DEFAULT nextval('audit_exceptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY audit_trails ALTER COLUMN id SET DEFAULT nextval('audit_trails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY basis_types ALTER COLUMN id SET DEFAULT nextval('basis_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY calendar_types ALTER COLUMN id SET DEFAULT nextval('calendar_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY detail_lookups ALTER COLUMN id SET DEFAULT nextval('detail_lookups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY document_options ALTER COLUMN id SET DEFAULT nextval('document_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY earning_rates ALTER COLUMN id SET DEFAULT nextval('earning_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY email_alert_template ALTER COLUMN id SET DEFAULT nextval('email_alert_template_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY email_logs ALTER COLUMN id SET DEFAULT nextval('email_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_bank_accounts ALTER COLUMN id SET DEFAULT nextval('employee_bank_accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_file_permissions ALTER COLUMN id SET DEFAULT nextval('employee_file_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_positions ALTER COLUMN id SET DEFAULT nextval('employee_positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY exception_notification ALTER COLUMN id SET DEFAULT nextval('exception_notification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY file_permissions ALTER COLUMN id SET DEFAULT nextval('file_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY file_trigger_schedule ALTER COLUMN id SET DEFAULT nextval('file_trigger_schedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY file_uploadby_supplier ALTER COLUMN id SET DEFAULT nextval('file_uploadby_supplier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY google_drive_response ALTER COLUMN id SET DEFAULT nextval('google_drive_response_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY item_details ALTER COLUMN id SET DEFAULT nextval('item_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY leave_request ALTER COLUMN id SET DEFAULT nextval('leave_request_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY location_path ALTER COLUMN id SET DEFAULT nextval('location_path_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY main_exception ALTER COLUMN id SET DEFAULT nextval('main_exception_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY master_exception ALTER COLUMN id SET DEFAULT nextval('master_exception_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY master_exception_detail ALTER COLUMN id SET DEFAULT nextval('master_exception_detail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY master_lookups ALTER COLUMN id SET DEFAULT nextval('master_lookups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY organisation_settings ALTER COLUMN id SET DEFAULT nextval('organisation_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY payroll_calendars ALTER COLUMN id SET DEFAULT nextval('payroll_calendars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY persons ALTER COLUMN id SET DEFAULT nextval('persons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY public_holiday ALTER COLUMN id SET DEFAULT nextval('public_holiday_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY residents ALTER COLUMN id SET DEFAULT nextval('residents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY resource_api ALTER COLUMN id SET DEFAULT nextval('resource_api_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY role_permissions ALTER COLUMN id SET DEFAULT nextval('role_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY roster_histories ALTER COLUMN id SET DEFAULT nextval('roster_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY rosters ALTER COLUMN id SET DEFAULT nextval('rosters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY stake_holders ALTER COLUMN id SET DEFAULT nextval('stake_holders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY standards ALTER COLUMN id SET DEFAULT nextval('standards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY supplier_types ALTER COLUMN id SET DEFAULT nextval('supplier_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY suppliers ALTER COLUMN id SET DEFAULT nextval('suppliers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_bulk_edit ALTER COLUMN id SET DEFAULT nextval('task_bulk_edit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_categories ALTER COLUMN id SET DEFAULT nextval('task_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_reactive_details ALTER COLUMN id SET DEFAULT nextval('task_reactive_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_template ALTER COLUMN id SET DEFAULT nextval('task_template_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tasklist ALTER COLUMN id SET DEFAULT nextval('tasklist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tax_declarations ALTER COLUMN id SET DEFAULT nextval('tax_declarations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tfn_exemption_types ALTER COLUMN id SET DEFAULT nextval('tfn_exemption_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tmp_approval ALTER COLUMN id SET DEFAULT nextval('tmp_approval_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tracking_category_options ALTER COLUMN id SET DEFAULT nextval('tracking_category_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY user_custom_permissions ALTER COLUMN id SET DEFAULT nextval('user_custom_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY addresses (id, created_date, is_deleted, last_modified, address_line1, address_line2, country, postal_code, region, suburb) FROM stdin;
1	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 111	\N	Indonesia	1297	01234	Kuningan
2	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 222	\N	Indonesia	1297	01234	South Jakarta
3	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 333	\N	Indonesia	1297	01234	South Jakarta
4	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 444	\N	Indonesia	1297	01234	South Jakarta
5	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 555	\N	Indonesia	1297	01234	South Jakarta
6	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 666	\N	Indonesia	1297	01234	South Jakarta
7	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 777	\N	Indonesia	1297	01234	South Jakarta
8	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 888	\N	Indonesia	1297	01234	South Jakarta
9	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 999	\N	Indonesia	1297	01234	South Jakarta
10	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 11	\N	Indonesia	1297	01234	South Jakarta
11	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 22	\N	Indonesia	1297	01234	South Jakarta
12	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 33	\N	Indonesia	1297	01234	South Jakarta
13	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 44	\N	Indonesia	1297	01234	South Jakarta
14	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 55	\N	Indonesia	1297	01234	South Jakarta
15	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 66	\N	Indonesia	1297	01234	South Jakarta
16	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 77	\N	Indonesia	1297	01234	South Jakarta
17	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 88	\N	Indonesia	1297	01234	South Jakarta
18	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 99	\N	Indonesia	1297	01234	South Jakarta
19	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 1	\N	Indonesia	1297	01234	South Jakarta
20	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 2	\N	Indonesia	1297	01234	South Jakarta
21	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 3	\N	Indonesia	1297	01234	South Jakarta
22	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 4	\N	Indonesia	1297	01234	South Jakarta
23	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 5	\N	Indonesia	1297	01234	South Jakarta
24	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 6	\N	Indonesia	1297	01234	South Jakarta
25	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 7	\N	Indonesia	1297	01234	South Jakarta
26	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 8	\N	Indonesia	1297	01234	South Jakarta
27	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 9	\N	Indonesia	1297	01234	South Jakarta
28	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 10	\N	Indonesia	1297	01234	South Jakarta
29	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 123	\N	Indonesia	1297	01234	South Jakarta
30	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 321	\N	Indonesia	1297	01234	South Jakarta
31	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Jl. Dr. Satrio Kav 223	\N	Indonesia	1297	01234	South Jakarta
32	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Charlestown	\N	Australia	2290	NSW	Charlestown
33	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Tingira Heights	\N	Australia	2290	NSW	Tingira Heights
34	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Toronto	\N	Australia	2283	NSW	Toronto
35	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Teralba	\N	Australia	2284	NSW	Teralba
36	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	Marmong Point	\N	Australia	2284	NSW	Marmong Point
37	2016-09-20 06:14:48.601435	f	2016-09-20 06:14:48.601435	16 Cumberland St, Teralba NSW 2284, Australia	\N	Australia	2284	NSW	Teralba
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('addresses_id_seq', 37, true);


--
-- Data for Name: approval_setting_details; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY approval_setting_details (id, created_date, is_deleted, last_modified, level, approval_setting_id, employee_id, position_id) FROM stdin;
\.


--
-- Name: approval_setting_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('approval_setting_details_id_seq', 1, false);


--
-- Data for Name: approval_settings; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY approval_settings (id, created_date, is_deleted, last_modified, criteria_limit_value, criteria_unit, name, resource_api) FROM stdin;
\.


--
-- Name: approval_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('approval_settings_id_seq', 1, false);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY assets (id, created_date, is_deleted, last_modified, code, description, name) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 00:00:00	AS001	CHAIR	CHAIR
\.


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('assets_id_seq', 1, true);


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY attachments (id, created_date, is_deleted, last_modified, attachment_type, link, name, type) FROM stdin;
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('attachments_id_seq', 1, false);


--
-- Data for Name: audit_exceptions; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY audit_exceptions (id, created_date, is_deleted, last_modified, description, master_exception_detail_id, task_id) FROM stdin;
\.


--
-- Name: audit_exceptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('audit_exceptions_id_seq', 1, false);


--
-- Data for Name: audit_trails; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY audit_trails (id, created_date, is_deleted, last_modified, action, current_state, description, entity_id, entity_name, previous_state, user_id) FROM stdin;
\.


--
-- Name: audit_trails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('audit_trails_id_seq', 1, false);


--
-- Data for Name: basis_types; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY basis_types (id, created_date, is_deleted, last_modified, info) FROM stdin;
1	2016-09-20 06:14:48.650957	f	2016-09-20 06:14:48.650957	FULLTIME
2	2016-09-20 06:14:48.650957	f	2016-09-20 06:14:48.650957	PARTTIME
3	2016-09-20 06:14:48.650957	f	2016-09-20 06:14:48.650957	CASUAL
4	2016-09-20 06:14:48.650957	f	2016-09-20 06:14:48.650957	LABOURHIRE
5	2016-09-20 06:14:48.650957	f	2016-09-20 06:14:48.650957	SUPERINCOMESTREAM
\.


--
-- Name: basis_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('basis_types_id_seq', 5, true);


--
-- Data for Name: calendar_types; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY calendar_types (id, created_date, is_deleted, last_modified, type) FROM stdin;
\.


--
-- Name: calendar_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('calendar_types_id_seq', 1, false);


--
-- Data for Name: check_box_property_options; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY check_box_property_options (id, created_date, is_deleted, last_modified, name) FROM stdin;
\.


--
-- Data for Name: comment_attachment; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY comment_attachment (comment_id, attachment_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY comments (id, created_date, is_deleted, last_modified, resource_id, text, type, user_id) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY contacts (id, created_date, is_deleted, last_modified, abn, email, fax, mobile_phone, name, pic_first_name, pic_last_name, pic_middle_name, used_for, website, work_phone, supplier_type_id) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	0425325312	0425325312	Wellseated	Kelly	Misbrener	\N	Interior Design in Aged Care	http://www.wellseated.com.au/	0425325312	3
2	2016-09-20 00:00:00	f	2016-09-20 00:00:00	69078100259 	realtimejakarta@gmail.com	\N	\N	Vitalcare	\N	\N	\N	Nurse Call system	\N	000000000	2
3	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	A1 RESULTS	Phil	Smith	\N	Photocopier scanner printer repairs	\N	000000000	3
4	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	ACTIVE MOBILITY	Ken	\N	\N	Mobility Items	\N	000000000	2
5	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	AGED CARE LINEN SPECIALISTS	Nigel	\N	\N	Linen Services 	\N	000000000	2
6	2016-09-20 00:00:00	f	2016-09-20 00:00:00	11000091690	realtimejakarta@gmail.com	\N	\N	A J EDDEN	Shane	\N	\N	Locksmithing	security@aje.com.au	000000000	3
7	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	ALAN STEGGLES FOOD SERVICE	Elaine	\N	\N	Food 	\N	000000000	1
8	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	ALL CLEAR WATER FILTRATION	Jenny	\N	\N	Water	\N	000000000	1
9	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	ARJO HOSPITAL EQUIPMENT PTY LIMITED	Melissa	000000000	\N	Servicing of Hospital Equipment / breakdowns	\N	\N	3
10	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	ASSET CLEANING SUPPLIES	Dian	\N	\N	Cleaning products	\N	000000000	2
11	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	BIBINA PTY LIMITED	\N	\N	\N	Food 	\N	000000000	1
12	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	BIDVEST	LEIGH	TURNER	\N	Food 	\N	000000000	1
13	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	BIDVEST FRESH	\N	\N	\N	Food 	\N	000000000	1
14	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	THOMPSON'S PIES	\N	\N	\N	Food	\N	000000000	1
15	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	FILTERFAB	Steph	\N	\N	laundry bags, dissolvos, slide sheets	\N	000000000	2
16	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	FRONTLINE FIRE	Troy	\N	\N	fire system testing	\N	000000000	3
17	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	FROSTS CATERING	Cath	\N	\N	Catering services 	\N	000000000	1
18	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	GB ELECTRICAL CONTRACTORS PTY LTD	Lauren	\N	\N	Electrical services & Test tagging	\N	000000000	3
19	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	HAYMANS ELECTRICAL	\N	\N	\N	Electrical services 	\N	000000000	3
20	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	realtimejakarta@gmail.com	\N	\N	MEDITRAX	\N	\N	\N	Medication Management	\N	000000000	2
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('contacts_id_seq', 20, true);


--
-- Data for Name: detail_lookups; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY detail_lookups (id, created_date, is_deleted, last_modified, detail_description, detail_name, detail_value, master_lookup_id) FROM stdin;
1	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	FULLTIME EMPLOYEE	FULL-TIME EMPLOYEMENT	FULLTIME	1
2	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	PARTIME EMPLOYEE	PART-TIME EMPLOYEMENT	PARTTIME	1
3	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	FULLTIME EMPLOYEE	CASUAL EMPLOYMENT	CASUAL	1
4	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	LABOURHIRE EMPLOYEE	LABOUR HIRE	LABOURHIRE	1
5	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	SUPERINCOMESTREAM EMPLOYEE	SUPERANNUATION INCOME STREAM	SUPERINCOMESTREAM	1
6	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	ACTIVE EMPLOYEE	ACTIVE	ACTIVE	2
7	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	TERMINATED/NON ACTIVE EMPLOYEE	TERMINATED	TERMINATED	2
8	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	No TFN Quoted	No TFN Quoted	NOTQUOTED	3
9	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	TFN PENDING	TFN PENDING	PENDING	3
10	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	PENSIONER	TFN EXEMPT-PENSIONER	PENSIONER	3
11	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	TFN EXEMPT-UNDER 18	TFN EXEMPT-UNDER 18	UNDER18	3
12	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	ACTIVE	ACTIVE	ACTIVE	4
13	2016-09-20 06:14:48.687917	f	2016-09-20 06:14:48.687917	INACTIVE	INACTIVE	INACTIVE	4
\.


--
-- Name: detail_lookups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('detail_lookups_id_seq', 13, true);


--
-- Data for Name: document_options; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY document_options (id, created_date, is_deleted, last_modified, alias, name, type) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	Facility ES Agreements	DOCUMENT_CATEGORY
2	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	Construction Contractors	DOCUMENT_CATEGORY
3	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	Facility Compliance	DOCUMENT_CATEGORY
4	2016-09-20 00:00:00	f	2016-09-20 00:00:00	LIC	License	DOCUMENT_TYPE
5	2016-09-20 00:00:00	f	2016-09-20 00:00:00	HACCP	HACCP	DOCUMENT_TYPE
6	2016-09-20 00:00:00	f	2016-09-20 00:00:00	WC	Workers Compliance	DOCUMENT_TYPE
7	2016-09-20 00:00:00	f	2016-09-20 00:00:00	PI	Professional Indemnity	DOCUMENT_TYPE
8	2016-09-20 00:00:00	f	2016-09-20 00:00:00	PL	Public Liability	DOCUMENT_TYPE
9	2016-09-20 00:00:00	f	2016-09-20 00:00:00	PC	Police Checks	DOCUMENT_TYPE
10	2016-09-20 00:00:00	f	2016-09-20 00:00:00	EPL	Environmental Protection License	DOCUMENT_TYPE
11	2016-09-20 00:00:00	f	2016-09-20 00:00:00	SWMS	Safe Work Method Statement	DOCUMENT_TYPE
12	2016-09-20 00:00:00	f	2016-09-20 00:00:00	TC	Tender Contract	DOCUMENT_TYPE
13	2016-09-20 00:00:00	f	2016-09-20 00:00:00	QUM	Quality Use of Medicine	DOCUMENT_TYPE
14	2016-09-20 00:00:00	f	2016-09-20 00:00:00	RMMR	Residential Medication Management Review	DOCUMENT_TYPE
15	2016-09-20 00:00:00	f	2016-09-20 00:00:00	PI & PL	Professional Indemnity and Public Liability	DOCUMENT_TYPE
\.


--
-- Name: document_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('document_options_id_seq', 15, true);


--
-- Data for Name: earning_rates; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY earning_rates (id, created_date, is_deleted, last_modified, rate) FROM stdin;
\.


--
-- Name: earning_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('earning_rates_id_seq', 1, false);


--
-- Data for Name: email_alert_template; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY email_alert_template (id, created_date, is_deleted, last_modified, alert_time, condition, duration, message, name, number_of_duration, signature, subject) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 00:00:00	09:00:00	BEFORE_EXPIRED	DAY	message	2 DAY BEFORE EXPIRED at 16:00	2	signature	subject
\.


--
-- Name: email_alert_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('email_alert_template_id_seq', 1, true);


--
-- Data for Name: email_logs; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY email_logs (id, created_date, is_deleted, last_modified, description, mail_process, mail_recipient, mail_status, mail_subject, object_data, sent_time) FROM stdin;
\.


--
-- Name: email_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('email_logs_id_seq', 1, false);


--
-- Data for Name: employee_bank_accounts; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY employee_bank_accounts (id, created_date, is_deleted, last_modified, account_name, account_number, amount, bsb, remainder, statement_text, employee_id) FROM stdin;
\.


--
-- Name: employee_bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('employee_bank_accounts_id_seq', 1, false);


--
-- Data for Name: employee_file_permissions; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY employee_file_permissions (id, created_date, is_deleted, last_modified, employee_id, file_id, file_permission_id) FROM stdin;
\.


--
-- Name: employee_file_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('employee_file_permissions_id_seq', 1, false);


--
-- Data for Name: employee_positions; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY employee_positions (id, created_date, is_deleted, last_modified, basis_type, is_primary, employee_id, position_id) FROM stdin;
1	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	1	1
2	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	2	47
3	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	3	2
4	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	4	1
5	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	5	17
6	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	6	18
7	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	7	17
8	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	8	1
9	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	9	20
10	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	10	14
12	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	12	10
13	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	13	7
14	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	14	3
15	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	15	11
16	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	16	9
17	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	17	48
18	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	18	30
19	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	19	31
20	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	20	32
21	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	21	33
22	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	22	14
23	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	23	14
24	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	24	14
25	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	25	14
26	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	26	14
27	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	27	35
28	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	28	36
29	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	29	37
30	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	30	43
31	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	31	44
32	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	13	39
33	2016-09-20 06:14:48.722964	f	2016-09-20 06:14:48.722964	FULLTIME	t	16	39
\.


--
-- Name: employee_positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('employee_positions_id_seq', 33, true);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY employees (id, created_date, is_deleted, last_modified, classification, emp_group_name, employee_id, is_archived, is_authorised_to_approve_leave, is_authorised_to_approve_timesheets, job_title, occupation, police_check, police_check_date, police_ch_ren_date, qualification, qualification_attainment_date, qualification_expiration_date, start_date, status, termination_date, termination_reason, twitter_username, xero_id, location_id, earning_rate_id, payroll_calendar_id, person_id, report_manager_id, tax_declaration_id) FROM stdin;
1	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-001	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
7	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-007	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	7	\N	\N
8	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-008	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	8	\N	\N
10	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-010	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	10	14	\N
14	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-014	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	3	\N	\N	14	\N	\N
2	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-002	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
3	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-003	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
4	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-004	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	4	\N	\N
5	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-005	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	5	2	\N
6	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-006	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	6	2	\N
9	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-009	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	9	2	\N
11	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-011	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	11	\N	\N
13	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-013	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	13	\N	\N
15	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-015	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	15	\N	\N
16	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-016	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	3	\N	\N	16	\N	\N
17	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-017	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	17	14	\N
18	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-018	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	18	14	\N
19	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-019	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	19	14	\N
20	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-020	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	20	14	\N
21	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-021	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	21	14	\N
22	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-022	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	22	15	\N
23	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-023	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	23	15	\N
24	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-024	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	24	15	\N
25	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-025	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	25	15	\N
26	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-026	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	26	15	\N
27	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-027	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	27	16	\N
28	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-028	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	28	16	\N
29	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-029	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	29	16	\N
30	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-030	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	30	16	\N
31	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-031	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	31	16	\N
12	2016-09-20 06:14:48.635426	f	2016-09-20 06:14:48.635426	\N	\N	EMP-012	f	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	\N	\N	\N	12	3	\N
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('employees_id_seq', 31, true);


--
-- Data for Name: exception_attachment; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY exception_attachment (main_exception_id, attachment_id) FROM stdin;
\.


--
-- Data for Name: exception_notification; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY exception_notification (id, created_date, is_deleted, last_modified, client_time_zone, server_time_zone, "time", user_id) FROM stdin;
1	2016-09-20 06:14:56.482	f	2016-09-20 06:14:56.482	Australia/Sydney	Australia/Sydney	19:00:00	15
2	2016-09-20 06:14:56.488	f	2016-09-20 06:14:56.488	Australia/Sydney	Australia/Sydney	19:00:00	2
3	2016-09-20 06:14:56.495	f	2016-09-20 06:14:56.495	Australia/Sydney	Australia/Sydney	19:00:00	16
4	2016-09-20 06:14:56.502	f	2016-09-20 06:14:56.502	Australia/Sydney	Australia/Sydney	19:00:00	3
5	2016-09-20 06:14:56.508	f	2016-09-20 06:14:56.508	Australia/Sydney	Australia/Sydney	19:00:00	17
\.


--
-- Name: exception_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('exception_notification_id_seq', 5, true);


--
-- Data for Name: file_approver; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY file_approver (file_id, approver_id) FROM stdin;
\.


--
-- Data for Name: file_permissions; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY file_permissions (id, created_date, is_deleted, last_modified, name, original_name) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 00:00:00	View Only	VIEW_ONLY
2	2016-09-20 00:00:00	f	2016-09-20 00:00:00	Edit	EDIT
3	2016-09-20 00:00:00	f	2016-09-20 00:00:00	Edit and Delete	EDIT_AND_DELETE
\.


--
-- Name: file_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('file_permissions_id_seq', 3, true);


--
-- Data for Name: file_tags; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY file_tags (file_id, tag_id) FROM stdin;
\.


--
-- Data for Name: file_trigger_schedule; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY file_trigger_schedule (id, created_date, is_deleted, last_modified, email_alert_id, trigger_name, file_id) FROM stdin;
\.


--
-- Name: file_trigger_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('file_trigger_schedule_id_seq', 1, false);


--
-- Data for Name: file_uploadby_supplier; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY file_uploadby_supplier (id, created_date, is_deleted, last_modified, token) FROM stdin;
\.


--
-- Name: file_uploadby_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('file_uploadby_supplier_id_seq', 1, false);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY files (id, created_date, is_deleted, last_modified, archived_reason, download_url, expired_date, file_directory, file_type, google_drive_id, google_drive_reference, is_approved, is_archived, is_new, is_rejected, is_request_archived, is_supplier_upload, is_updated, name, name_in_storage, rejected_reason, approver_id, contact_id, creator_id, document_category_id, document_type_id, location_id, parent_revision_id, project_id, standard_id, updater_id) FROM stdin;
\.


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('files_id_seq', 1, false);


--
-- Data for Name: google_drive_response; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY google_drive_response (id, description, extension, iconurl, lasteditedutc, mimetype, name, parentid, serviceid, type, url) FROM stdin;
\.


--
-- Name: google_drive_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('google_drive_response_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- Data for Name: item_details; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY item_details (id, created_date, is_deleted, last_modified, invoice_number, item_type, name, price, supplier_id, task_reactive_detail_id) FROM stdin;
\.


--
-- Name: item_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('item_details_id_seq', 1, false);


--
-- Data for Name: leave_request; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY leave_request (id, created_date, is_deleted, last_modified, approve_by, approve_dt, end_date, reason, request_date, start_date, status, title, user_id) FROM stdin;
1	2016-09-20 06:14:48.713863	f	2016-09-20 06:14:48.713863	\N	\N	2016-09-22 00:00:00	Pulang Kampung	2016-09-20 00:00:00	2016-09-20 00:00:00	REQUESTED	Vacation	7
2	2016-09-20 06:14:48.713863	f	2016-09-20 06:14:48.713863	\N	\N	2016-09-24 00:00:00	Pulang Pergi Tidak di antar	2016-09-20 00:00:00	2016-09-20 00:00:00	REQUESTED	Jalan Jalan	7
\.


--
-- Name: leave_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('leave_request_id_seq', 2, true);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY links (id, created_date, is_deleted, last_modified, name, resource_id, text, type, user_id) FROM stdin;
\.


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('links_id_seq', 1, false);


--
-- Data for Name: location_path; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY location_path (id, created_date, is_deleted, last_modified, length, ancestor, descendant) FROM stdin;
1	2016-09-20 06:14:51.045	f	2016-09-20 06:14:51.045	0	1	1
2	2016-09-20 06:14:51.055	f	2016-09-20 06:14:51.055	0	2	2
3	2016-09-20 06:14:51.062	f	2016-09-20 06:14:51.062	0	3	3
4	2016-09-20 06:14:51.069	f	2016-09-20 06:14:51.069	0	4	4
5	2016-09-20 06:14:51.075	f	2016-09-20 06:14:51.075	1	3	4
6	2016-09-20 06:14:51.08	f	2016-09-20 06:14:51.08	0	5	5
7	2016-09-20 06:14:51.085	f	2016-09-20 06:14:51.085	1	3	5
8	2016-09-20 06:14:51.101	f	2016-09-20 06:14:51.101	0	6	6
9	2016-09-20 06:14:51.106	f	2016-09-20 06:14:51.106	1	3	6
10	2016-09-20 06:14:51.111	f	2016-09-20 06:14:51.111	0	7	7
11	2016-09-20 06:14:51.117	f	2016-09-20 06:14:51.117	1	3	7
12	2016-09-20 06:14:51.124	f	2016-09-20 06:14:51.124	0	8	8
13	2016-09-20 06:14:51.13	f	2016-09-20 06:14:51.13	1	4	8
14	2016-09-20 06:14:51.137	f	2016-09-20 06:14:51.137	2	3	8
15	2016-09-20 06:14:51.144	f	2016-09-20 06:14:51.144	0	9	9
16	2016-09-20 06:14:51.152	f	2016-09-20 06:14:51.152	1	4	9
17	2016-09-20 06:14:51.158	f	2016-09-20 06:14:51.158	2	3	9
18	2016-09-20 06:14:51.163	f	2016-09-20 06:14:51.163	0	10	10
19	2016-09-20 06:14:51.169	f	2016-09-20 06:14:51.169	1	4	10
20	2016-09-20 06:14:51.176	f	2016-09-20 06:14:51.176	2	3	10
21	2016-09-20 06:14:51.182	f	2016-09-20 06:14:51.182	0	11	11
22	2016-09-20 06:14:51.188	f	2016-09-20 06:14:51.188	1	4	11
23	2016-09-20 06:14:51.195	f	2016-09-20 06:14:51.195	2	3	11
24	2016-09-20 06:14:51.203	f	2016-09-20 06:14:51.203	0	12	12
25	2016-09-20 06:14:51.208	f	2016-09-20 06:14:51.208	1	8	12
26	2016-09-20 06:14:51.213	f	2016-09-20 06:14:51.213	2	4	12
27	2016-09-20 06:14:51.219	f	2016-09-20 06:14:51.219	3	3	12
28	2016-09-20 06:14:51.226	f	2016-09-20 06:14:51.226	0	13	13
29	2016-09-20 06:14:51.251	f	2016-09-20 06:14:51.251	1	8	13
30	2016-09-20 06:14:51.258	f	2016-09-20 06:14:51.258	2	4	13
31	2016-09-20 06:14:51.264	f	2016-09-20 06:14:51.264	3	3	13
32	2016-09-20 06:14:51.272	f	2016-09-20 06:14:51.272	0	14	14
33	2016-09-20 06:14:51.285	f	2016-09-20 06:14:51.285	1	8	14
34	2016-09-20 06:14:51.289	f	2016-09-20 06:14:51.289	2	4	14
35	2016-09-20 06:14:51.295	f	2016-09-20 06:14:51.295	3	3	14
36	2016-09-20 06:14:51.302	f	2016-09-20 06:14:51.302	0	15	15
37	2016-09-20 06:14:51.308	f	2016-09-20 06:14:51.308	1	8	15
38	2016-09-20 06:14:51.313	f	2016-09-20 06:14:51.313	2	4	15
39	2016-09-20 06:14:51.319	f	2016-09-20 06:14:51.319	3	3	15
40	2016-09-20 06:14:51.327	f	2016-09-20 06:14:51.327	0	16	16
41	2016-09-20 06:14:51.334	f	2016-09-20 06:14:51.334	1	8	16
42	2016-09-20 06:14:51.339	f	2016-09-20 06:14:51.339	2	4	16
43	2016-09-20 06:14:51.345	f	2016-09-20 06:14:51.345	3	3	16
44	2016-09-20 06:14:51.355	f	2016-09-20 06:14:51.355	0	17	17
45	2016-09-20 06:14:51.362	f	2016-09-20 06:14:51.362	1	8	17
46	2016-09-20 06:14:51.368	f	2016-09-20 06:14:51.368	2	4	17
47	2016-09-20 06:14:51.374	f	2016-09-20 06:14:51.374	3	3	17
48	2016-09-20 06:14:51.381	f	2016-09-20 06:14:51.381	0	18	18
49	2016-09-20 06:14:51.392	f	2016-09-20 06:14:51.392	1	8	18
50	2016-09-20 06:14:51.398	f	2016-09-20 06:14:51.398	2	4	18
51	2016-09-20 06:14:51.404	f	2016-09-20 06:14:51.404	3	3	18
52	2016-09-20 06:14:51.412	f	2016-09-20 06:14:51.412	0	19	19
53	2016-09-20 06:14:51.418	f	2016-09-20 06:14:51.419	1	8	19
54	2016-09-20 06:14:51.425	f	2016-09-20 06:14:51.425	2	4	19
55	2016-09-20 06:14:51.432	f	2016-09-20 06:14:51.432	3	3	19
56	2016-09-20 06:14:51.439	f	2016-09-20 06:14:51.439	0	20	20
57	2016-09-20 06:14:51.444	f	2016-09-20 06:14:51.444	1	8	20
58	2016-09-20 06:14:51.449	f	2016-09-20 06:14:51.449	2	4	20
59	2016-09-20 06:14:51.455	f	2016-09-20 06:14:51.455	3	3	20
60	2016-09-20 06:14:51.463	f	2016-09-20 06:14:51.463	0	21	21
61	2016-09-20 06:14:51.468	f	2016-09-20 06:14:51.468	1	8	21
62	2016-09-20 06:14:51.473	f	2016-09-20 06:14:51.473	2	4	21
63	2016-09-20 06:14:51.479	f	2016-09-20 06:14:51.479	3	3	21
64	2016-09-20 06:14:51.486	f	2016-09-20 06:14:51.486	0	22	22
65	2016-09-20 06:14:51.492	f	2016-09-20 06:14:51.492	1	8	22
66	2016-09-20 06:14:51.497	f	2016-09-20 06:14:51.497	2	4	22
67	2016-09-20 06:14:51.503	f	2016-09-20 06:14:51.503	3	3	22
68	2016-09-20 06:14:51.512	f	2016-09-20 06:14:51.512	0	23	23
69	2016-09-20 06:14:51.519	f	2016-09-20 06:14:51.519	1	8	23
70	2016-09-20 06:14:51.523	f	2016-09-20 06:14:51.523	2	4	23
71	2016-09-20 06:14:51.529	f	2016-09-20 06:14:51.529	3	3	23
72	2016-09-20 06:14:51.536	f	2016-09-20 06:14:51.536	0	24	24
73	2016-09-20 06:14:51.543	f	2016-09-20 06:14:51.543	1	8	24
74	2016-09-20 06:14:51.548	f	2016-09-20 06:14:51.548	2	4	24
75	2016-09-20 06:14:51.555	f	2016-09-20 06:14:51.555	3	3	24
76	2016-09-20 06:14:51.563	f	2016-09-20 06:14:51.563	0	25	25
77	2016-09-20 06:14:51.569	f	2016-09-20 06:14:51.569	1	8	25
78	2016-09-20 06:14:51.574	f	2016-09-20 06:14:51.574	2	4	25
79	2016-09-20 06:14:51.58	f	2016-09-20 06:14:51.58	3	3	25
80	2016-09-20 06:14:51.587	f	2016-09-20 06:14:51.587	0	26	26
81	2016-09-20 06:14:51.592	f	2016-09-20 06:14:51.592	1	8	26
82	2016-09-20 06:14:51.597	f	2016-09-20 06:14:51.597	2	4	26
83	2016-09-20 06:14:51.603	f	2016-09-20 06:14:51.603	3	3	26
84	2016-09-20 06:14:51.61	f	2016-09-20 06:14:51.61	0	27	27
85	2016-09-20 06:14:51.615	f	2016-09-20 06:14:51.615	1	8	27
86	2016-09-20 06:14:51.62	f	2016-09-20 06:14:51.62	2	4	27
87	2016-09-20 06:14:51.626	f	2016-09-20 06:14:51.626	3	3	27
88	2016-09-20 06:14:51.633	f	2016-09-20 06:14:51.633	0	28	28
89	2016-09-20 06:14:51.638	f	2016-09-20 06:14:51.638	1	9	28
90	2016-09-20 06:14:51.642	f	2016-09-20 06:14:51.642	2	4	28
91	2016-09-20 06:14:51.647	f	2016-09-20 06:14:51.647	3	3	28
92	2016-09-20 06:14:51.654	f	2016-09-20 06:14:51.654	0	29	29
93	2016-09-20 06:14:51.66	f	2016-09-20 06:14:51.66	1	9	29
94	2016-09-20 06:14:51.664	f	2016-09-20 06:14:51.664	2	4	29
95	2016-09-20 06:14:51.67	f	2016-09-20 06:14:51.67	3	3	29
96	2016-09-20 06:14:51.676	f	2016-09-20 06:14:51.676	0	30	30
97	2016-09-20 06:14:51.682	f	2016-09-20 06:14:51.682	1	9	30
98	2016-09-20 06:14:51.687	f	2016-09-20 06:14:51.687	2	4	30
99	2016-09-20 06:14:51.692	f	2016-09-20 06:14:51.692	3	3	30
100	2016-09-20 06:14:51.699	f	2016-09-20 06:14:51.699	0	31	31
101	2016-09-20 06:14:51.705	f	2016-09-20 06:14:51.705	1	9	31
102	2016-09-20 06:14:51.71	f	2016-09-20 06:14:51.71	2	4	31
103	2016-09-20 06:14:51.716	f	2016-09-20 06:14:51.716	3	3	31
104	2016-09-20 06:14:51.722	f	2016-09-20 06:14:51.722	0	32	32
105	2016-09-20 06:14:51.728	f	2016-09-20 06:14:51.728	1	9	32
106	2016-09-20 06:14:51.733	f	2016-09-20 06:14:51.733	2	4	32
107	2016-09-20 06:14:51.738	f	2016-09-20 06:14:51.738	3	3	32
108	2016-09-20 06:14:51.745	f	2016-09-20 06:14:51.745	0	33	33
109	2016-09-20 06:14:51.751	f	2016-09-20 06:14:51.751	1	10	33
110	2016-09-20 06:14:51.755	f	2016-09-20 06:14:51.755	2	4	33
111	2016-09-20 06:14:51.761	f	2016-09-20 06:14:51.761	3	3	33
112	2016-09-20 06:14:51.769	f	2016-09-20 06:14:51.769	0	34	34
113	2016-09-20 06:14:51.775	f	2016-09-20 06:14:51.775	1	10	34
114	2016-09-20 06:14:51.779	f	2016-09-20 06:14:51.779	2	4	34
115	2016-09-20 06:14:51.786	f	2016-09-20 06:14:51.786	3	3	34
116	2016-09-20 06:14:51.793	f	2016-09-20 06:14:51.793	0	35	35
117	2016-09-20 06:14:51.799	f	2016-09-20 06:14:51.799	1	10	35
118	2016-09-20 06:14:51.803	f	2016-09-20 06:14:51.803	2	4	35
119	2016-09-20 06:14:51.809	f	2016-09-20 06:14:51.809	3	3	35
120	2016-09-20 06:14:51.817	f	2016-09-20 06:14:51.817	0	36	36
121	2016-09-20 06:14:51.822	f	2016-09-20 06:14:51.822	1	10	36
122	2016-09-20 06:14:51.827	f	2016-09-20 06:14:51.827	2	4	36
123	2016-09-20 06:14:51.833	f	2016-09-20 06:14:51.833	3	3	36
124	2016-09-20 06:14:51.839	f	2016-09-20 06:14:51.839	0	37	37
125	2016-09-20 06:14:51.845	f	2016-09-20 06:14:51.845	1	10	37
126	2016-09-20 06:14:51.85	f	2016-09-20 06:14:51.85	2	4	37
127	2016-09-20 06:14:51.856	f	2016-09-20 06:14:51.856	3	3	37
128	2016-09-20 06:14:51.863	f	2016-09-20 06:14:51.863	0	38	38
129	2016-09-20 06:14:51.868	f	2016-09-20 06:14:51.868	1	10	38
130	2016-09-20 06:14:51.872	f	2016-09-20 06:14:51.872	2	4	38
131	2016-09-20 06:14:51.878	f	2016-09-20 06:14:51.878	3	3	38
132	2016-09-20 06:14:51.885	f	2016-09-20 06:14:51.885	0	39	39
133	2016-09-20 06:14:51.891	f	2016-09-20 06:14:51.891	1	10	39
134	2016-09-20 06:14:51.895	f	2016-09-20 06:14:51.895	2	4	39
135	2016-09-20 06:14:51.901	f	2016-09-20 06:14:51.901	3	3	39
136	2016-09-20 06:14:51.907	f	2016-09-20 06:14:51.907	0	40	40
137	2016-09-20 06:14:51.913	f	2016-09-20 06:14:51.913	1	10	40
138	2016-09-20 06:14:51.917	f	2016-09-20 06:14:51.917	2	4	40
139	2016-09-20 06:14:51.923	f	2016-09-20 06:14:51.923	3	3	40
140	2016-09-20 06:14:51.93	f	2016-09-20 06:14:51.93	0	41	41
141	2016-09-20 06:14:51.935	f	2016-09-20 06:14:51.935	1	10	41
142	2016-09-20 06:14:51.94	f	2016-09-20 06:14:51.94	2	4	41
143	2016-09-20 06:14:51.946	f	2016-09-20 06:14:51.946	3	3	41
144	2016-09-20 06:14:51.952	f	2016-09-20 06:14:51.952	0	42	42
145	2016-09-20 06:14:51.958	f	2016-09-20 06:14:51.958	1	10	42
146	2016-09-20 06:14:51.962	f	2016-09-20 06:14:51.962	2	4	42
147	2016-09-20 06:14:51.968	f	2016-09-20 06:14:51.968	3	3	42
148	2016-09-20 06:14:51.975	f	2016-09-20 06:14:51.975	0	43	43
149	2016-09-20 06:14:51.98	f	2016-09-20 06:14:51.98	1	10	43
150	2016-09-20 06:14:51.985	f	2016-09-20 06:14:51.985	2	4	43
151	2016-09-20 06:14:51.991	f	2016-09-20 06:14:51.991	3	3	43
152	2016-09-20 06:14:51.997	f	2016-09-20 06:14:51.997	0	44	44
153	2016-09-20 06:14:52.003	f	2016-09-20 06:14:52.003	1	11	44
154	2016-09-20 06:14:52.008	f	2016-09-20 06:14:52.008	2	4	44
155	2016-09-20 06:14:52.013	f	2016-09-20 06:14:52.013	3	3	44
156	2016-09-20 06:14:52.02	f	2016-09-20 06:14:52.02	0	45	45
157	2016-09-20 06:14:52.026	f	2016-09-20 06:14:52.026	1	11	45
158	2016-09-20 06:14:52.03	f	2016-09-20 06:14:52.03	2	4	45
159	2016-09-20 06:14:52.036	f	2016-09-20 06:14:52.036	3	3	45
160	2016-09-20 06:14:52.043	f	2016-09-20 06:14:52.043	0	46	46
161	2016-09-20 06:14:52.049	f	2016-09-20 06:14:52.049	1	11	46
162	2016-09-20 06:14:52.053	f	2016-09-20 06:14:52.053	2	4	46
163	2016-09-20 06:14:52.058	f	2016-09-20 06:14:52.058	3	3	46
164	2016-09-20 06:14:52.065	f	2016-09-20 06:14:52.065	0	47	47
165	2016-09-20 06:14:52.07	f	2016-09-20 06:14:52.07	1	11	47
166	2016-09-20 06:14:52.074	f	2016-09-20 06:14:52.074	2	4	47
167	2016-09-20 06:14:52.081	f	2016-09-20 06:14:52.081	3	3	47
168	2016-09-20 06:14:52.088	f	2016-09-20 06:14:52.088	0	48	48
169	2016-09-20 06:14:52.094	f	2016-09-20 06:14:52.094	1	11	48
170	2016-09-20 06:14:52.098	f	2016-09-20 06:14:52.098	2	4	48
171	2016-09-20 06:14:52.104	f	2016-09-20 06:14:52.104	3	3	48
172	2016-09-20 06:14:52.111	f	2016-09-20 06:14:52.111	0	49	49
173	2016-09-20 06:14:52.117	f	2016-09-20 06:14:52.117	1	5	49
174	2016-09-20 06:14:52.121	f	2016-09-20 06:14:52.121	2	3	49
175	2016-09-20 06:14:52.127	f	2016-09-20 06:14:52.127	0	50	50
176	2016-09-20 06:14:52.134	f	2016-09-20 06:14:52.134	1	5	50
177	2016-09-20 06:14:52.139	f	2016-09-20 06:14:52.139	2	3	50
178	2016-09-20 06:14:52.143	f	2016-09-20 06:14:52.143	0	51	51
179	2016-09-20 06:14:52.149	f	2016-09-20 06:14:52.149	1	5	51
180	2016-09-20 06:14:52.155	f	2016-09-20 06:14:52.155	2	3	51
181	2016-09-20 06:14:52.161	f	2016-09-20 06:14:52.161	0	52	52
182	2016-09-20 06:14:52.166	f	2016-09-20 06:14:52.166	1	5	52
183	2016-09-20 06:14:52.171	f	2016-09-20 06:14:52.171	2	3	52
184	2016-09-20 06:14:52.178	f	2016-09-20 06:14:52.178	0	53	53
185	2016-09-20 06:14:52.183	f	2016-09-20 06:14:52.183	1	49	53
186	2016-09-20 06:14:52.188	f	2016-09-20 06:14:52.188	2	5	53
187	2016-09-20 06:14:52.193	f	2016-09-20 06:14:52.193	3	3	53
188	2016-09-20 06:14:52.2	f	2016-09-20 06:14:52.2	0	54	54
189	2016-09-20 06:14:52.205	f	2016-09-20 06:14:52.205	1	49	54
190	2016-09-20 06:14:52.21	f	2016-09-20 06:14:52.21	2	5	54
191	2016-09-20 06:14:52.215	f	2016-09-20 06:14:52.215	3	3	54
192	2016-09-20 06:14:52.222	f	2016-09-20 06:14:52.222	0	55	55
193	2016-09-20 06:14:52.227	f	2016-09-20 06:14:52.227	1	49	55
194	2016-09-20 06:14:52.232	f	2016-09-20 06:14:52.232	2	5	55
195	2016-09-20 06:14:52.237	f	2016-09-20 06:14:52.237	3	3	55
196	2016-09-20 06:14:52.244	f	2016-09-20 06:14:52.244	0	56	56
197	2016-09-20 06:14:52.249	f	2016-09-20 06:14:52.249	1	49	56
198	2016-09-20 06:14:52.254	f	2016-09-20 06:14:52.254	2	5	56
199	2016-09-20 06:14:52.259	f	2016-09-20 06:14:52.259	3	3	56
200	2016-09-20 06:14:52.266	f	2016-09-20 06:14:52.266	0	57	57
201	2016-09-20 06:14:52.271	f	2016-09-20 06:14:52.271	1	49	57
202	2016-09-20 06:14:52.275	f	2016-09-20 06:14:52.275	2	5	57
203	2016-09-20 06:14:52.281	f	2016-09-20 06:14:52.281	3	3	57
204	2016-09-20 06:14:52.287	f	2016-09-20 06:14:52.287	0	58	58
205	2016-09-20 06:14:52.291	f	2016-09-20 06:14:52.291	1	49	58
206	2016-09-20 06:14:52.296	f	2016-09-20 06:14:52.296	2	5	58
207	2016-09-20 06:14:52.301	f	2016-09-20 06:14:52.301	3	3	58
208	2016-09-20 06:14:52.308	f	2016-09-20 06:14:52.308	0	59	59
209	2016-09-20 06:14:52.314	f	2016-09-20 06:14:52.314	1	49	59
210	2016-09-20 06:14:52.318	f	2016-09-20 06:14:52.318	2	5	59
211	2016-09-20 06:14:52.324	f	2016-09-20 06:14:52.324	3	3	59
212	2016-09-20 06:14:52.331	f	2016-09-20 06:14:52.331	0	60	60
213	2016-09-20 06:14:52.336	f	2016-09-20 06:14:52.336	1	49	60
214	2016-09-20 06:14:52.34	f	2016-09-20 06:14:52.34	2	5	60
215	2016-09-20 06:14:52.346	f	2016-09-20 06:14:52.346	3	3	60
216	2016-09-20 06:14:52.353	f	2016-09-20 06:14:52.353	0	61	61
217	2016-09-20 06:14:52.358	f	2016-09-20 06:14:52.358	1	49	61
218	2016-09-20 06:14:52.362	f	2016-09-20 06:14:52.362	2	5	61
219	2016-09-20 06:14:52.368	f	2016-09-20 06:14:52.368	3	3	61
220	2016-09-20 06:14:52.374	f	2016-09-20 06:14:52.374	0	62	62
221	2016-09-20 06:14:52.379	f	2016-09-20 06:14:52.379	1	49	62
222	2016-09-20 06:14:52.384	f	2016-09-20 06:14:52.384	2	5	62
223	2016-09-20 06:14:52.39	f	2016-09-20 06:14:52.39	3	3	62
224	2016-09-20 06:14:52.397	f	2016-09-20 06:14:52.397	0	63	63
225	2016-09-20 06:14:52.402	f	2016-09-20 06:14:52.402	1	49	63
226	2016-09-20 06:14:52.406	f	2016-09-20 06:14:52.406	2	5	63
227	2016-09-20 06:14:52.411	f	2016-09-20 06:14:52.411	3	3	63
228	2016-09-20 06:14:52.418	f	2016-09-20 06:14:52.418	0	64	64
229	2016-09-20 06:14:52.424	f	2016-09-20 06:14:52.424	1	49	64
230	2016-09-20 06:14:52.428	f	2016-09-20 06:14:52.428	2	5	64
231	2016-09-20 06:14:52.434	f	2016-09-20 06:14:52.434	3	3	64
232	2016-09-20 06:14:52.441	f	2016-09-20 06:14:52.441	0	65	65
233	2016-09-20 06:14:52.446	f	2016-09-20 06:14:52.446	1	49	65
234	2016-09-20 06:14:52.45	f	2016-09-20 06:14:52.45	2	5	65
235	2016-09-20 06:14:52.456	f	2016-09-20 06:14:52.456	3	3	65
236	2016-09-20 06:14:52.463	f	2016-09-20 06:14:52.463	0	66	66
237	2016-09-20 06:14:52.468	f	2016-09-20 06:14:52.468	1	49	66
238	2016-09-20 06:14:52.472	f	2016-09-20 06:14:52.472	2	5	66
239	2016-09-20 06:14:52.478	f	2016-09-20 06:14:52.478	3	3	66
240	2016-09-20 06:14:52.485	f	2016-09-20 06:14:52.485	0	67	67
241	2016-09-20 06:14:52.49	f	2016-09-20 06:14:52.49	1	49	67
242	2016-09-20 06:14:52.494	f	2016-09-20 06:14:52.494	2	5	67
243	2016-09-20 06:14:52.5	f	2016-09-20 06:14:52.5	3	3	67
244	2016-09-20 06:14:52.507	f	2016-09-20 06:14:52.507	0	68	68
245	2016-09-20 06:14:52.512	f	2016-09-20 06:14:52.512	1	50	68
246	2016-09-20 06:14:52.516	f	2016-09-20 06:14:52.516	2	5	68
247	2016-09-20 06:14:52.522	f	2016-09-20 06:14:52.522	3	3	68
248	2016-09-20 06:14:52.529	f	2016-09-20 06:14:52.529	0	69	69
249	2016-09-20 06:14:52.535	f	2016-09-20 06:14:52.535	1	50	69
250	2016-09-20 06:14:52.539	f	2016-09-20 06:14:52.539	2	5	69
251	2016-09-20 06:14:52.545	f	2016-09-20 06:14:52.545	3	3	69
252	2016-09-20 06:14:52.552	f	2016-09-20 06:14:52.552	0	70	70
253	2016-09-20 06:14:52.557	f	2016-09-20 06:14:52.557	1	50	70
254	2016-09-20 06:14:52.561	f	2016-09-20 06:14:52.561	2	5	70
255	2016-09-20 06:14:52.567	f	2016-09-20 06:14:52.567	3	3	70
256	2016-09-20 06:14:52.574	f	2016-09-20 06:14:52.574	0	71	71
257	2016-09-20 06:14:52.58	f	2016-09-20 06:14:52.58	1	51	71
258	2016-09-20 06:14:52.584	f	2016-09-20 06:14:52.584	2	5	71
259	2016-09-20 06:14:52.59	f	2016-09-20 06:14:52.59	3	3	71
260	2016-09-20 06:14:52.596	f	2016-09-20 06:14:52.596	0	72	72
261	2016-09-20 06:14:52.602	f	2016-09-20 06:14:52.602	1	51	72
262	2016-09-20 06:14:52.606	f	2016-09-20 06:14:52.606	2	5	72
263	2016-09-20 06:14:52.611	f	2016-09-20 06:14:52.611	3	3	72
264	2016-09-20 06:14:52.618	f	2016-09-20 06:14:52.618	0	73	73
265	2016-09-20 06:14:52.623	f	2016-09-20 06:14:52.623	1	51	73
266	2016-09-20 06:14:52.627	f	2016-09-20 06:14:52.627	2	5	73
267	2016-09-20 06:14:52.633	f	2016-09-20 06:14:52.633	3	3	73
268	2016-09-20 06:14:52.64	f	2016-09-20 06:14:52.64	0	74	74
269	2016-09-20 06:14:52.645	f	2016-09-20 06:14:52.645	1	51	74
270	2016-09-20 06:14:52.649	f	2016-09-20 06:14:52.649	2	5	74
271	2016-09-20 06:14:52.655	f	2016-09-20 06:14:52.655	3	3	74
272	2016-09-20 06:14:52.662	f	2016-09-20 06:14:52.662	0	75	75
273	2016-09-20 06:14:52.667	f	2016-09-20 06:14:52.667	1	51	75
274	2016-09-20 06:14:52.671	f	2016-09-20 06:14:52.671	2	5	75
275	2016-09-20 06:14:52.677	f	2016-09-20 06:14:52.677	3	3	75
276	2016-09-20 06:14:52.684	f	2016-09-20 06:14:52.684	0	76	76
277	2016-09-20 06:14:52.689	f	2016-09-20 06:14:52.689	1	51	76
278	2016-09-20 06:14:52.693	f	2016-09-20 06:14:52.693	2	5	76
279	2016-09-20 06:14:52.698	f	2016-09-20 06:14:52.698	3	3	76
280	2016-09-20 06:14:52.704	f	2016-09-20 06:14:52.704	0	77	77
281	2016-09-20 06:14:52.709	f	2016-09-20 06:14:52.709	1	51	77
282	2016-09-20 06:14:52.714	f	2016-09-20 06:14:52.714	2	5	77
283	2016-09-20 06:14:52.718	f	2016-09-20 06:14:52.718	3	3	77
284	2016-09-20 06:14:52.722	f	2016-09-20 06:14:52.722	0	78	78
285	2016-09-20 06:14:52.73	f	2016-09-20 06:14:52.73	1	51	78
286	2016-09-20 06:14:52.737	f	2016-09-20 06:14:52.737	2	5	78
287	2016-09-20 06:14:52.741	f	2016-09-20 06:14:52.741	3	3	78
288	2016-09-20 06:14:52.745	f	2016-09-20 06:14:52.745	0	79	79
289	2016-09-20 06:14:52.752	f	2016-09-20 06:14:52.752	1	52	79
290	2016-09-20 06:14:52.759	f	2016-09-20 06:14:52.759	2	5	79
291	2016-09-20 06:14:52.763	f	2016-09-20 06:14:52.763	3	3	79
292	2016-09-20 06:14:52.768	f	2016-09-20 06:14:52.768	0	80	80
293	2016-09-20 06:14:52.775	f	2016-09-20 06:14:52.775	1	52	80
294	2016-09-20 06:14:52.782	f	2016-09-20 06:14:52.782	2	5	80
295	2016-09-20 06:14:52.786	f	2016-09-20 06:14:52.786	3	3	80
296	2016-09-20 06:14:52.79	f	2016-09-20 06:14:52.79	0	81	81
297	2016-09-20 06:14:52.798	f	2016-09-20 06:14:52.798	1	6	81
298	2016-09-20 06:14:52.805	f	2016-09-20 06:14:52.805	2	3	81
299	2016-09-20 06:14:52.81	f	2016-09-20 06:14:52.81	0	82	82
300	2016-09-20 06:14:52.814	f	2016-09-20 06:14:52.814	1	6	82
301	2016-09-20 06:14:52.821	f	2016-09-20 06:14:52.821	2	3	82
302	2016-09-20 06:14:52.827	f	2016-09-20 06:14:52.827	0	83	83
303	2016-09-20 06:14:52.832	f	2016-09-20 06:14:52.832	1	6	83
304	2016-09-20 06:14:52.836	f	2016-09-20 06:14:52.836	2	3	83
305	2016-09-20 06:14:52.843	f	2016-09-20 06:14:52.843	0	84	84
306	2016-09-20 06:14:52.85	f	2016-09-20 06:14:52.85	1	6	84
307	2016-09-20 06:14:52.854	f	2016-09-20 06:14:52.854	2	3	84
308	2016-09-20 06:14:52.858	f	2016-09-20 06:14:52.858	0	85	85
309	2016-09-20 06:14:52.866	f	2016-09-20 06:14:52.866	1	81	85
310	2016-09-20 06:14:52.871	f	2016-09-20 06:14:52.871	2	6	85
311	2016-09-20 06:14:52.876	f	2016-09-20 06:14:52.876	3	3	85
312	2016-09-20 06:14:52.88	f	2016-09-20 06:14:52.88	0	86	86
313	2016-09-20 06:14:52.887	f	2016-09-20 06:14:52.887	1	81	86
314	2016-09-20 06:14:52.893	f	2016-09-20 06:14:52.893	2	6	86
315	2016-09-20 06:14:52.897	f	2016-09-20 06:14:52.897	3	3	86
316	2016-09-20 06:14:52.901	f	2016-09-20 06:14:52.901	0	87	87
317	2016-09-20 06:14:52.908	f	2016-09-20 06:14:52.908	1	81	87
318	2016-09-20 06:14:52.914	f	2016-09-20 06:14:52.914	2	6	87
319	2016-09-20 06:14:52.919	f	2016-09-20 06:14:52.919	3	3	87
320	2016-09-20 06:14:52.923	f	2016-09-20 06:14:52.923	0	88	88
321	2016-09-20 06:14:52.931	f	2016-09-20 06:14:52.931	1	81	88
322	2016-09-20 06:14:52.937	f	2016-09-20 06:14:52.937	2	6	88
323	2016-09-20 06:14:52.942	f	2016-09-20 06:14:52.942	3	3	88
324	2016-09-20 06:14:52.947	f	2016-09-20 06:14:52.947	0	89	89
325	2016-09-20 06:14:52.954	f	2016-09-20 06:14:52.954	1	81	89
326	2016-09-20 06:14:52.961	f	2016-09-20 06:14:52.961	2	6	89
327	2016-09-20 06:14:52.966	f	2016-09-20 06:14:52.966	3	3	89
328	2016-09-20 06:14:52.97	f	2016-09-20 06:14:52.97	0	90	90
329	2016-09-20 06:14:52.977	f	2016-09-20 06:14:52.977	1	81	90
330	2016-09-20 06:14:52.983	f	2016-09-20 06:14:52.983	2	6	90
331	2016-09-20 06:14:52.988	f	2016-09-20 06:14:52.988	3	3	90
332	2016-09-20 06:14:52.992	f	2016-09-20 06:14:52.992	0	91	91
333	2016-09-20 06:14:52.999	f	2016-09-20 06:14:52.999	1	81	91
334	2016-09-20 06:14:53.006	f	2016-09-20 06:14:53.006	2	6	91
335	2016-09-20 06:14:53.01	f	2016-09-20 06:14:53.01	3	3	91
336	2016-09-20 06:14:53.015	f	2016-09-20 06:14:53.015	0	92	92
337	2016-09-20 06:14:53.022	f	2016-09-20 06:14:53.022	1	81	92
338	2016-09-20 06:14:53.028	f	2016-09-20 06:14:53.028	2	6	92
339	2016-09-20 06:14:53.033	f	2016-09-20 06:14:53.033	3	3	92
340	2016-09-20 06:14:53.037	f	2016-09-20 06:14:53.037	0	93	93
341	2016-09-20 06:14:53.044	f	2016-09-20 06:14:53.044	1	81	93
342	2016-09-20 06:14:53.05	f	2016-09-20 06:14:53.05	2	6	93
343	2016-09-20 06:14:53.054	f	2016-09-20 06:14:53.054	3	3	93
344	2016-09-20 06:14:53.058	f	2016-09-20 06:14:53.058	0	94	94
345	2016-09-20 06:14:53.066	f	2016-09-20 06:14:53.066	1	81	94
346	2016-09-20 06:14:53.071	f	2016-09-20 06:14:53.071	2	6	94
347	2016-09-20 06:14:53.076	f	2016-09-20 06:14:53.076	3	3	94
348	2016-09-20 06:14:53.08	f	2016-09-20 06:14:53.08	0	95	95
349	2016-09-20 06:14:53.087	f	2016-09-20 06:14:53.087	1	81	95
350	2016-09-20 06:14:53.093	f	2016-09-20 06:14:53.093	2	6	95
351	2016-09-20 06:14:53.097	f	2016-09-20 06:14:53.097	3	3	95
352	2016-09-20 06:14:53.102	f	2016-09-20 06:14:53.102	0	96	96
353	2016-09-20 06:14:53.109	f	2016-09-20 06:14:53.109	1	81	96
354	2016-09-20 06:14:53.115	f	2016-09-20 06:14:53.115	2	6	96
355	2016-09-20 06:14:53.12	f	2016-09-20 06:14:53.12	3	3	96
356	2016-09-20 06:14:53.124	f	2016-09-20 06:14:53.124	0	97	97
357	2016-09-20 06:14:53.131	f	2016-09-20 06:14:53.131	1	81	97
358	2016-09-20 06:14:53.137	f	2016-09-20 06:14:53.137	2	6	97
359	2016-09-20 06:14:53.141	f	2016-09-20 06:14:53.141	3	3	97
360	2016-09-20 06:14:53.145	f	2016-09-20 06:14:53.145	0	98	98
361	2016-09-20 06:14:53.153	f	2016-09-20 06:14:53.153	1	81	98
362	2016-09-20 06:14:53.159	f	2016-09-20 06:14:53.159	2	6	98
363	2016-09-20 06:14:53.163	f	2016-09-20 06:14:53.163	3	3	98
364	2016-09-20 06:14:53.167	f	2016-09-20 06:14:53.167	0	99	99
365	2016-09-20 06:14:53.174	f	2016-09-20 06:14:53.174	1	81	99
366	2016-09-20 06:14:53.18	f	2016-09-20 06:14:53.18	2	6	99
367	2016-09-20 06:14:53.185	f	2016-09-20 06:14:53.185	3	3	99
368	2016-09-20 06:14:53.19	f	2016-09-20 06:14:53.19	0	100	100
369	2016-09-20 06:14:53.197	f	2016-09-20 06:14:53.197	1	81	100
370	2016-09-20 06:14:53.203	f	2016-09-20 06:14:53.203	2	6	100
371	2016-09-20 06:14:53.208	f	2016-09-20 06:14:53.208	3	3	100
372	2016-09-20 06:14:53.212	f	2016-09-20 06:14:53.212	0	101	101
373	2016-09-20 06:14:53.219	f	2016-09-20 06:14:53.219	1	82	101
374	2016-09-20 06:14:53.225	f	2016-09-20 06:14:53.225	2	6	101
375	2016-09-20 06:14:53.229	f	2016-09-20 06:14:53.229	3	3	101
376	2016-09-20 06:14:53.234	f	2016-09-20 06:14:53.234	0	102	102
377	2016-09-20 06:14:53.241	f	2016-09-20 06:14:53.241	1	82	102
378	2016-09-20 06:14:53.247	f	2016-09-20 06:14:53.247	2	6	102
379	2016-09-20 06:14:53.251	f	2016-09-20 06:14:53.251	3	3	102
380	2016-09-20 06:14:53.255	f	2016-09-20 06:14:53.255	0	103	103
381	2016-09-20 06:14:53.262	f	2016-09-20 06:14:53.262	1	82	103
382	2016-09-20 06:14:53.268	f	2016-09-20 06:14:53.268	2	6	103
383	2016-09-20 06:14:53.272	f	2016-09-20 06:14:53.272	3	3	103
384	2016-09-20 06:14:53.276	f	2016-09-20 06:14:53.276	0	104	104
385	2016-09-20 06:14:53.283	f	2016-09-20 06:14:53.283	1	83	104
386	2016-09-20 06:14:53.29	f	2016-09-20 06:14:53.29	2	6	104
387	2016-09-20 06:14:53.294	f	2016-09-20 06:14:53.294	3	3	104
388	2016-09-20 06:14:53.298	f	2016-09-20 06:14:53.298	0	105	105
389	2016-09-20 06:14:53.305	f	2016-09-20 06:14:53.305	1	83	105
390	2016-09-20 06:14:53.311	f	2016-09-20 06:14:53.311	2	6	105
391	2016-09-20 06:14:53.316	f	2016-09-20 06:14:53.316	3	3	105
392	2016-09-20 06:14:53.32	f	2016-09-20 06:14:53.32	0	106	106
393	2016-09-20 06:14:53.328	f	2016-09-20 06:14:53.328	1	83	106
394	2016-09-20 06:14:53.334	f	2016-09-20 06:14:53.334	2	6	106
395	2016-09-20 06:14:53.338	f	2016-09-20 06:14:53.338	3	3	106
396	2016-09-20 06:14:53.343	f	2016-09-20 06:14:53.343	0	107	107
397	2016-09-20 06:14:53.35	f	2016-09-20 06:14:53.35	1	83	107
398	2016-09-20 06:14:53.356	f	2016-09-20 06:14:53.356	2	6	107
399	2016-09-20 06:14:53.36	f	2016-09-20 06:14:53.36	3	3	107
400	2016-09-20 06:14:53.367	f	2016-09-20 06:14:53.367	0	108	108
401	2016-09-20 06:14:53.375	f	2016-09-20 06:14:53.375	1	83	108
402	2016-09-20 06:14:53.38	f	2016-09-20 06:14:53.38	2	6	108
403	2016-09-20 06:14:53.385	f	2016-09-20 06:14:53.385	3	3	108
404	2016-09-20 06:14:53.389	f	2016-09-20 06:14:53.389	0	109	109
405	2016-09-20 06:14:53.396	f	2016-09-20 06:14:53.396	1	83	109
406	2016-09-20 06:14:53.402	f	2016-09-20 06:14:53.402	2	6	109
407	2016-09-20 06:14:53.406	f	2016-09-20 06:14:53.406	3	3	109
408	2016-09-20 06:14:53.41	f	2016-09-20 06:14:53.41	0	110	110
409	2016-09-20 06:14:53.418	f	2016-09-20 06:14:53.418	1	83	110
410	2016-09-20 06:14:53.424	f	2016-09-20 06:14:53.424	2	6	110
411	2016-09-20 06:14:53.428	f	2016-09-20 06:14:53.428	3	3	110
412	2016-09-20 06:14:53.432	f	2016-09-20 06:14:53.432	0	111	111
413	2016-09-20 06:14:53.44	f	2016-09-20 06:14:53.44	1	83	111
414	2016-09-20 06:14:53.446	f	2016-09-20 06:14:53.446	2	6	111
415	2016-09-20 06:14:53.45	f	2016-09-20 06:14:53.45	3	3	111
416	2016-09-20 06:14:53.454	f	2016-09-20 06:14:53.454	0	112	112
417	2016-09-20 06:14:53.461	f	2016-09-20 06:14:53.461	1	83	112
418	2016-09-20 06:14:53.467	f	2016-09-20 06:14:53.467	2	6	112
419	2016-09-20 06:14:53.471	f	2016-09-20 06:14:53.471	3	3	112
420	2016-09-20 06:14:53.476	f	2016-09-20 06:14:53.476	0	113	113
421	2016-09-20 06:14:53.483	f	2016-09-20 06:14:53.483	1	83	113
422	2016-09-20 06:14:53.489	f	2016-09-20 06:14:53.489	2	6	113
423	2016-09-20 06:14:53.493	f	2016-09-20 06:14:53.493	3	3	113
424	2016-09-20 06:14:53.498	f	2016-09-20 06:14:53.498	0	114	114
425	2016-09-20 06:14:53.505	f	2016-09-20 06:14:53.505	1	83	114
426	2016-09-20 06:14:53.511	f	2016-09-20 06:14:53.511	2	6	114
427	2016-09-20 06:14:53.515	f	2016-09-20 06:14:53.515	3	3	114
428	2016-09-20 06:14:53.52	f	2016-09-20 06:14:53.52	0	115	115
429	2016-09-20 06:14:53.527	f	2016-09-20 06:14:53.527	1	84	115
430	2016-09-20 06:14:53.532	f	2016-09-20 06:14:53.532	2	6	115
431	2016-09-20 06:14:53.537	f	2016-09-20 06:14:53.537	3	3	115
432	2016-09-20 06:14:53.54	f	2016-09-20 06:14:53.54	0	116	116
433	2016-09-20 06:14:53.547	f	2016-09-20 06:14:53.547	1	84	116
434	2016-09-20 06:14:53.554	f	2016-09-20 06:14:53.554	2	6	116
435	2016-09-20 06:14:53.558	f	2016-09-20 06:14:53.558	3	3	116
436	2016-09-20 06:14:53.562	f	2016-09-20 06:14:53.562	0	117	117
437	2016-09-20 06:14:53.569	f	2016-09-20 06:14:53.569	1	84	117
438	2016-09-20 06:14:53.575	f	2016-09-20 06:14:53.575	2	6	117
439	2016-09-20 06:14:53.58	f	2016-09-20 06:14:53.58	3	3	117
440	2016-09-20 06:14:53.584	f	2016-09-20 06:14:53.584	0	118	118
441	2016-09-20 06:14:53.591	f	2016-09-20 06:14:53.591	1	7	118
442	2016-09-20 06:14:53.597	f	2016-09-20 06:14:53.597	2	3	118
443	2016-09-20 06:14:53.601	f	2016-09-20 06:14:53.601	0	119	119
444	2016-09-20 06:14:53.605	f	2016-09-20 06:14:53.605	1	7	119
445	2016-09-20 06:14:53.612	f	2016-09-20 06:14:53.612	2	3	119
446	2016-09-20 06:14:53.618	f	2016-09-20 06:14:53.618	0	120	120
447	2016-09-20 06:14:53.622	f	2016-09-20 06:14:53.622	1	7	120
448	2016-09-20 06:14:53.626	f	2016-09-20 06:14:53.626	2	3	120
449	2016-09-20 06:14:53.633	f	2016-09-20 06:14:53.633	0	121	121
450	2016-09-20 06:14:53.639	f	2016-09-20 06:14:53.639	1	7	121
451	2016-09-20 06:14:53.644	f	2016-09-20 06:14:53.644	2	3	121
452	2016-09-20 06:14:53.648	f	2016-09-20 06:14:53.648	0	122	122
453	2016-09-20 06:14:53.655	f	2016-09-20 06:14:53.655	1	118	122
454	2016-09-20 06:14:53.661	f	2016-09-20 06:14:53.661	2	7	122
455	2016-09-20 06:14:53.665	f	2016-09-20 06:14:53.665	3	3	122
456	2016-09-20 06:14:53.669	f	2016-09-20 06:14:53.669	0	123	123
457	2016-09-20 06:14:53.676	f	2016-09-20 06:14:53.676	1	118	123
458	2016-09-20 06:14:53.683	f	2016-09-20 06:14:53.683	2	7	123
459	2016-09-20 06:14:53.687	f	2016-09-20 06:14:53.687	3	3	123
460	2016-09-20 06:14:53.691	f	2016-09-20 06:14:53.691	0	124	124
461	2016-09-20 06:14:53.698	f	2016-09-20 06:14:53.698	1	118	124
462	2016-09-20 06:14:53.703	f	2016-09-20 06:14:53.703	2	7	124
463	2016-09-20 06:14:53.707	f	2016-09-20 06:14:53.707	3	3	124
464	2016-09-20 06:14:53.711	f	2016-09-20 06:14:53.711	0	125	125
465	2016-09-20 06:14:53.717	f	2016-09-20 06:14:53.717	1	118	125
466	2016-09-20 06:14:53.723	f	2016-09-20 06:14:53.723	2	7	125
467	2016-09-20 06:14:53.726	f	2016-09-20 06:14:53.726	3	3	125
468	2016-09-20 06:14:53.73	f	2016-09-20 06:14:53.73	0	126	126
469	2016-09-20 06:14:53.737	f	2016-09-20 06:14:53.737	1	118	126
470	2016-09-20 06:14:53.743	f	2016-09-20 06:14:53.743	2	7	126
471	2016-09-20 06:14:53.749	f	2016-09-20 06:14:53.749	3	3	126
472	2016-09-20 06:14:53.754	f	2016-09-20 06:14:53.754	0	127	127
473	2016-09-20 06:14:53.761	f	2016-09-20 06:14:53.761	1	118	127
474	2016-09-20 06:14:53.767	f	2016-09-20 06:14:53.767	2	7	127
475	2016-09-20 06:14:53.771	f	2016-09-20 06:14:53.771	3	3	127
476	2016-09-20 06:14:53.775	f	2016-09-20 06:14:53.775	0	128	128
477	2016-09-20 06:14:53.782	f	2016-09-20 06:14:53.782	1	118	128
478	2016-09-20 06:14:53.788	f	2016-09-20 06:14:53.788	2	7	128
479	2016-09-20 06:14:53.792	f	2016-09-20 06:14:53.792	3	3	128
480	2016-09-20 06:14:53.796	f	2016-09-20 06:14:53.796	0	129	129
481	2016-09-20 06:14:53.803	f	2016-09-20 06:14:53.803	1	118	129
482	2016-09-20 06:14:53.81	f	2016-09-20 06:14:53.81	2	7	129
483	2016-09-20 06:14:53.814	f	2016-09-20 06:14:53.814	3	3	129
484	2016-09-20 06:14:53.818	f	2016-09-20 06:14:53.818	0	130	130
485	2016-09-20 06:14:53.825	f	2016-09-20 06:14:53.825	1	118	130
486	2016-09-20 06:14:53.839	f	2016-09-20 06:14:53.839	2	7	130
487	2016-09-20 06:14:53.843	f	2016-09-20 06:14:53.843	3	3	130
488	2016-09-20 06:14:53.847	f	2016-09-20 06:14:53.847	0	131	131
489	2016-09-20 06:14:53.855	f	2016-09-20 06:14:53.855	1	118	131
490	2016-09-20 06:14:53.861	f	2016-09-20 06:14:53.861	2	7	131
491	2016-09-20 06:14:53.865	f	2016-09-20 06:14:53.865	3	3	131
492	2016-09-20 06:14:53.869	f	2016-09-20 06:14:53.869	0	132	132
493	2016-09-20 06:14:53.876	f	2016-09-20 06:14:53.876	1	118	132
494	2016-09-20 06:14:53.882	f	2016-09-20 06:14:53.882	2	7	132
495	2016-09-20 06:14:53.886	f	2016-09-20 06:14:53.886	3	3	132
496	2016-09-20 06:14:53.891	f	2016-09-20 06:14:53.891	0	133	133
497	2016-09-20 06:14:53.898	f	2016-09-20 06:14:53.898	1	118	133
498	2016-09-20 06:14:53.903	f	2016-09-20 06:14:53.903	2	7	133
499	2016-09-20 06:14:53.907	f	2016-09-20 06:14:53.907	3	3	133
500	2016-09-20 06:14:53.912	f	2016-09-20 06:14:53.912	0	134	134
501	2016-09-20 06:14:53.919	f	2016-09-20 06:14:53.919	1	118	134
502	2016-09-20 06:14:53.925	f	2016-09-20 06:14:53.925	2	7	134
503	2016-09-20 06:14:53.929	f	2016-09-20 06:14:53.929	3	3	134
504	2016-09-20 06:14:53.933	f	2016-09-20 06:14:53.933	0	135	135
505	2016-09-20 06:14:53.941	f	2016-09-20 06:14:53.941	1	118	135
506	2016-09-20 06:14:53.947	f	2016-09-20 06:14:53.947	2	7	135
507	2016-09-20 06:14:53.951	f	2016-09-20 06:14:53.951	3	3	135
508	2016-09-20 06:14:53.955	f	2016-09-20 06:14:53.955	0	136	136
509	2016-09-20 06:14:53.962	f	2016-09-20 06:14:53.962	1	118	136
510	2016-09-20 06:14:53.969	f	2016-09-20 06:14:53.969	2	7	136
511	2016-09-20 06:14:53.973	f	2016-09-20 06:14:53.973	3	3	136
512	2016-09-20 06:14:53.978	f	2016-09-20 06:14:53.978	0	137	137
513	2016-09-20 06:14:53.986	f	2016-09-20 06:14:53.986	1	118	137
514	2016-09-20 06:14:53.992	f	2016-09-20 06:14:53.992	2	7	137
515	2016-09-20 06:14:53.996	f	2016-09-20 06:14:53.996	3	3	137
516	2016-09-20 06:14:54	f	2016-09-20 06:14:54	0	138	138
517	2016-09-20 06:14:54.008	f	2016-09-20 06:14:54.008	1	118	138
518	2016-09-20 06:14:54.014	f	2016-09-20 06:14:54.014	2	7	138
519	2016-09-20 06:14:54.018	f	2016-09-20 06:14:54.018	3	3	138
520	2016-09-20 06:14:54.023	f	2016-09-20 06:14:54.023	0	139	139
521	2016-09-20 06:14:54.03	f	2016-09-20 06:14:54.03	1	118	139
522	2016-09-20 06:14:54.036	f	2016-09-20 06:14:54.036	2	7	139
523	2016-09-20 06:14:54.04	f	2016-09-20 06:14:54.04	3	3	139
524	2016-09-20 06:14:54.044	f	2016-09-20 06:14:54.044	0	140	140
525	2016-09-20 06:14:54.05	f	2016-09-20 06:14:54.05	1	119	140
526	2016-09-20 06:14:54.057	f	2016-09-20 06:14:54.057	2	7	140
527	2016-09-20 06:14:54.061	f	2016-09-20 06:14:54.061	3	3	140
528	2016-09-20 06:14:54.065	f	2016-09-20 06:14:54.065	0	141	141
529	2016-09-20 06:14:54.072	f	2016-09-20 06:14:54.072	1	119	141
530	2016-09-20 06:14:54.078	f	2016-09-20 06:14:54.078	2	7	141
531	2016-09-20 06:14:54.082	f	2016-09-20 06:14:54.082	3	3	141
532	2016-09-20 06:14:54.086	f	2016-09-20 06:14:54.086	0	142	142
533	2016-09-20 06:14:54.093	f	2016-09-20 06:14:54.093	1	119	142
534	2016-09-20 06:14:54.099	f	2016-09-20 06:14:54.099	2	7	142
535	2016-09-20 06:14:54.103	f	2016-09-20 06:14:54.103	3	3	142
536	2016-09-20 06:14:54.107	f	2016-09-20 06:14:54.107	0	143	143
537	2016-09-20 06:14:54.114	f	2016-09-20 06:14:54.114	1	119	143
538	2016-09-20 06:14:54.12	f	2016-09-20 06:14:54.12	2	7	143
539	2016-09-20 06:14:54.124	f	2016-09-20 06:14:54.124	3	3	143
540	2016-09-20 06:14:54.128	f	2016-09-20 06:14:54.128	0	144	144
541	2016-09-20 06:14:54.136	f	2016-09-20 06:14:54.136	1	120	144
542	2016-09-20 06:14:54.142	f	2016-09-20 06:14:54.142	2	7	144
543	2016-09-20 06:14:54.146	f	2016-09-20 06:14:54.146	3	3	144
544	2016-09-20 06:14:54.15	f	2016-09-20 06:14:54.15	0	145	145
545	2016-09-20 06:14:54.158	f	2016-09-20 06:14:54.158	1	120	145
546	2016-09-20 06:14:54.164	f	2016-09-20 06:14:54.164	2	7	145
547	2016-09-20 06:14:54.168	f	2016-09-20 06:14:54.168	3	3	145
548	2016-09-20 06:14:54.172	f	2016-09-20 06:14:54.172	0	146	146
549	2016-09-20 06:14:54.179	f	2016-09-20 06:14:54.179	1	120	146
550	2016-09-20 06:14:54.185	f	2016-09-20 06:14:54.185	2	7	146
551	2016-09-20 06:14:54.189	f	2016-09-20 06:14:54.189	3	3	146
552	2016-09-20 06:14:54.193	f	2016-09-20 06:14:54.193	0	147	147
553	2016-09-20 06:14:54.2	f	2016-09-20 06:14:54.2	1	120	147
554	2016-09-20 06:14:54.207	f	2016-09-20 06:14:54.207	2	7	147
555	2016-09-20 06:14:54.211	f	2016-09-20 06:14:54.211	3	3	147
556	2016-09-20 06:14:54.218	f	2016-09-20 06:14:54.218	0	148	148
557	2016-09-20 06:14:54.225	f	2016-09-20 06:14:54.225	1	120	148
558	2016-09-20 06:14:54.231	f	2016-09-20 06:14:54.231	2	7	148
559	2016-09-20 06:14:54.236	f	2016-09-20 06:14:54.236	3	3	148
560	2016-09-20 06:14:54.24	f	2016-09-20 06:14:54.24	0	149	149
561	2016-09-20 06:14:54.247	f	2016-09-20 06:14:54.247	1	120	149
562	2016-09-20 06:14:54.253	f	2016-09-20 06:14:54.253	2	7	149
563	2016-09-20 06:14:54.26	f	2016-09-20 06:14:54.26	3	3	149
564	2016-09-20 06:14:54.264	f	2016-09-20 06:14:54.264	0	150	150
565	2016-09-20 06:14:54.271	f	2016-09-20 06:14:54.271	1	120	150
566	2016-09-20 06:14:54.277	f	2016-09-20 06:14:54.277	2	7	150
567	2016-09-20 06:14:54.281	f	2016-09-20 06:14:54.281	3	3	150
568	2016-09-20 06:14:54.286	f	2016-09-20 06:14:54.286	0	151	151
569	2016-09-20 06:14:54.293	f	2016-09-20 06:14:54.293	1	120	151
570	2016-09-20 06:14:54.299	f	2016-09-20 06:14:54.299	2	7	151
571	2016-09-20 06:14:54.303	f	2016-09-20 06:14:54.303	3	3	151
572	2016-09-20 06:14:54.306	f	2016-09-20 06:14:54.306	0	152	152
573	2016-09-20 06:14:54.313	f	2016-09-20 06:14:54.313	1	120	152
574	2016-09-20 06:14:54.319	f	2016-09-20 06:14:54.319	2	7	152
575	2016-09-20 06:14:54.323	f	2016-09-20 06:14:54.323	3	3	152
576	2016-09-20 06:14:54.327	f	2016-09-20 06:14:54.327	0	153	153
577	2016-09-20 06:14:54.334	f	2016-09-20 06:14:54.334	1	121	153
578	2016-09-20 06:14:54.34	f	2016-09-20 06:14:54.34	2	7	153
579	2016-09-20 06:14:54.344	f	2016-09-20 06:14:54.344	3	3	153
580	2016-09-20 06:14:54.348	f	2016-09-20 06:14:54.348	0	154	154
581	2016-09-20 06:14:54.355	f	2016-09-20 06:14:54.355	1	121	154
582	2016-09-20 06:14:54.361	f	2016-09-20 06:14:54.361	2	7	154
583	2016-09-20 06:14:54.365	f	2016-09-20 06:14:54.365	3	3	154
584	2016-09-20 06:14:54.369	f	2016-09-20 06:14:54.369	0	155	155
585	2016-09-20 06:14:54.376	f	2016-09-20 06:14:54.376	1	121	155
586	2016-09-20 06:14:54.381	f	2016-09-20 06:14:54.381	2	7	155
587	2016-09-20 06:14:54.385	f	2016-09-20 06:14:54.385	3	3	155
588	2016-09-20 06:14:54.389	f	2016-09-20 06:14:54.389	0	156	156
589	2016-09-20 06:14:54.396	f	2016-09-20 06:14:54.396	1	121	156
590	2016-09-20 06:14:54.402	f	2016-09-20 06:14:54.402	2	7	156
591	2016-09-20 06:14:54.406	f	2016-09-20 06:14:54.406	3	3	156
592	2016-09-20 06:14:54.41	f	2016-09-20 06:14:54.41	0	157	157
593	2016-09-20 06:14:54.417	f	2016-09-20 06:14:54.417	1	121	157
594	2016-09-20 06:14:54.423	f	2016-09-20 06:14:54.423	2	7	157
595	2016-09-20 06:14:54.428	f	2016-09-20 06:14:54.428	3	3	157
596	2016-09-20 06:14:54.431	f	2016-09-20 06:14:54.431	0	158	158
597	2016-09-20 06:14:54.438	f	2016-09-20 06:14:54.438	1	121	158
598	2016-09-20 06:14:54.444	f	2016-09-20 06:14:54.444	2	7	158
599	2016-09-20 06:14:54.45	f	2016-09-20 06:14:54.45	3	3	158
600	2016-09-20 06:14:54.457	f	2016-09-20 06:14:54.457	0	159	159
601	2016-09-20 06:14:54.463	f	2016-09-20 06:14:54.463	1	121	159
602	2016-09-20 06:14:54.468	f	2016-09-20 06:14:54.468	2	7	159
603	2016-09-20 06:14:54.472	f	2016-09-20 06:14:54.472	3	3	159
604	2016-09-20 06:14:54.479	f	2016-09-20 06:14:54.479	0	160	160
605	2016-09-20 06:14:54.485	f	2016-09-20 06:14:54.485	1	121	160
606	2016-09-20 06:14:54.489	f	2016-09-20 06:14:54.489	2	7	160
607	2016-09-20 06:14:54.493	f	2016-09-20 06:14:54.493	3	3	160
608	2016-09-20 06:14:54.5	f	2016-09-20 06:14:54.5	0	161	161
609	2016-09-20 06:14:54.506	f	2016-09-20 06:14:54.506	1	121	161
610	2016-09-20 06:14:54.511	f	2016-09-20 06:14:54.511	2	7	161
611	2016-09-20 06:14:54.515	f	2016-09-20 06:14:54.515	3	3	161
612	2016-09-20 06:14:54.522	f	2016-09-20 06:14:54.522	0	162	162
613	2016-09-20 06:14:54.528	f	2016-09-20 06:14:54.528	1	121	162
614	2016-09-20 06:14:54.531	f	2016-09-20 06:14:54.531	2	7	162
615	2016-09-20 06:14:54.535	f	2016-09-20 06:14:54.535	3	3	162
616	2016-09-20 06:14:54.542	f	2016-09-20 06:14:54.542	0	163	163
617	2016-09-20 06:14:54.548	f	2016-09-20 06:14:54.548	1	121	163
618	2016-09-20 06:14:54.552	f	2016-09-20 06:14:54.552	2	7	163
619	2016-09-20 06:14:54.556	f	2016-09-20 06:14:54.556	3	3	163
620	2016-09-20 06:14:54.563	f	2016-09-20 06:14:54.563	0	164	164
621	2016-09-20 06:14:54.569	f	2016-09-20 06:14:54.569	1	10	164
622	2016-09-20 06:14:54.573	f	2016-09-20 06:14:54.573	2	4	164
623	2016-09-20 06:14:54.577	f	2016-09-20 06:14:54.577	3	3	164
624	2016-09-20 06:14:54.584	f	2016-09-20 06:14:54.584	0	165	165
625	2016-09-20 06:14:54.59	f	2016-09-20 06:14:54.59	0	166	166
626	2016-09-20 06:14:54.594	f	2016-09-20 06:14:54.594	0	167	167
627	2016-09-20 06:14:54.597	f	2016-09-20 06:14:54.597	0	168	168
628	2016-09-20 06:14:54.604	f	2016-09-20 06:14:54.604	1	4	168
629	2016-09-20 06:14:54.61	f	2016-09-20 06:14:54.61	2	3	168
630	2016-09-20 06:14:54.615	f	2016-09-20 06:14:54.615	0	169	169
631	2016-09-20 06:14:54.619	f	2016-09-20 06:14:54.619	1	6	169
632	2016-09-20 06:14:54.626	f	2016-09-20 06:14:54.626	2	3	169
633	2016-09-20 06:14:54.633	f	2016-09-20 06:14:54.633	0	170	170
634	2016-09-20 06:14:54.637	f	2016-09-20 06:14:54.637	1	168	170
635	2016-09-20 06:14:54.641	f	2016-09-20 06:14:54.641	2	4	170
636	2016-09-20 06:14:54.648	f	2016-09-20 06:14:54.648	3	3	170
637	2016-09-20 06:14:54.654	f	2016-09-20 06:14:54.654	0	171	171
638	2016-09-20 06:14:54.659	f	2016-09-20 06:14:54.659	1	168	171
639	2016-09-20 06:14:54.663	f	2016-09-20 06:14:54.663	2	4	171
640	2016-09-20 06:14:54.67	f	2016-09-20 06:14:54.67	3	3	171
641	2016-09-20 06:14:54.676	f	2016-09-20 06:14:54.676	0	172	172
642	2016-09-20 06:14:54.684	f	2016-09-20 06:14:54.684	1	169	172
643	2016-09-20 06:14:54.688	f	2016-09-20 06:14:54.688	2	6	172
644	2016-09-20 06:14:54.695	f	2016-09-20 06:14:54.695	3	3	172
\.


--
-- Name: location_path_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('location_path_id_seq', 644, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY locations (id, created_date, is_deleted, last_modified, description, level, name, location_type, value, address_id, parent_id) FROM stdin;
1	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	AMAROO	0	AMAROO	0	\N	32	\N
2	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	THE SANCTUARY	0	THE SANCTUARY	0	\N	33	\N
3	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	FIG TREE POINT	0	FIG TREE POINT	0	\N	34	\N
4	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	PROMENADE AREA 1	1	PROMENADE AREA 1	1	\N	\N	3
5	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	PROMENADE AREA 2	1	PROMENADE AREA 2	1	\N	\N	3
6	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	SEASPRAY / REEF AREA 3	1	SEASPRAY / REEF AREA 3	1	\N	\N	3
7	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	REEF / SANDS AREA 4	1	REEF / SANDS AREA 4	1	\N	\N	3
8	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	RESIDENT ROOM	2	RESIDENT ROOM	2	\N	\N	4
9	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	CORRIDORS	2	CORRIDORS	2	\N	\N	4
10	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	COMMON AREAS	2	COMMON AREAS	2	\N	\N	4
11	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	CARE STAFF AREAS	2	CARE STAFF AREAS	2	\N	\N	4
12	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 1	3	H Room 1	3	\N	\N	8
13	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 2	3	H Room 2	3	\N	\N	8
14	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 3	3	H Room 3	3	\N	\N	8
15	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 4	3	H Room 4	3	\N	\N	8
16	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 5	3	H Room 5	3	\N	\N	8
17	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 6	3	H Room 6	3	\N	\N	8
18	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 7	3	H Room 7	3	\N	\N	8
19	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 8	3	H Room 8	3	\N	\N	8
20	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 9	3	H Room 9	3	\N	\N	8
21	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 10	3	H Room 10	3	\N	\N	8
22	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 11	3	H Room 11	3	\N	\N	8
23	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 12	3	H Room 12	3	\N	\N	8
24	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	NH Room 26 / BED 1 / 2 / 3	3	NH Room 26	3	\N	\N	8
25	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	NH Room 27 / BED 1 / 2 / 3	3	NH Room 27	3	\N	\N	8
26	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	NH Room 28 / BED 1 / 2 / 3	3	NH Room 28	3	\N	\N	8
27	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	NH Room 29  / BED 1 / 2 / 3	3	NH Room 29	3	\N	\N	8
28	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Outside Kitchen	3	P1. Outside Kitchen	3	\N	\N	9
29	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. From Rooms 28/29-1	3	P1. From Rooms 28/29-1	3	\N	\N	9
30	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. From Rooms 1-5	3	P1. From Rooms 1-5	3	\N	\N	9
31	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. From Room 6-10	3	P1. From Rooms 6-10	3	\N	\N	9
32	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Exit near Lounge	3	P1. Exit near Lounge	3	\N	\N	9
33	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Reception Foyer	3	P1. Reception Foyer	3	\N	\N	10
34	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Entrance	3	P1. Entrance	3	\N	\N	10
35	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1 Office (near Nurses Station) 	3	P1. Office (near Nurses Station) 	3	\N	\N	10
36	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1 Store Room (Behind Nurses Station)	3	P1. Store Room (Behind Nurses Station)	3	\N	\N	10
37	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P.1 Store Room (off Blue Room)	3	P1. Store Room (off Blue Room)	3	\N	\N	10
38	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Visitors Toilet	3	P1. Visitors Toilet	3	\N	\N	10
39	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Disabled Toilet	3	P1. Disabled Toilet	3	\N	\N	10
40	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Dining Room	3	P1. Dining Room	3	\N	\N	10
41	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Lounge Room (Blue Room)	3	P1. Lounge Room (Blue Room)	3	\N	\N	10
42	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Linen Room	3	P1. Linen Room	3	\N	\N	10
43	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. LIft 2	3	P1. LIft 2	3	\N	\N	10
44	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Medication Room	3	P1. Medication Room	3	\N	\N	11
45	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Nurses Station 1	3	P1. Nurses Station 1	3	\N	\N	11
46	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Doctors Room	3	P1. Doctors Room	3	\N	\N	11
47	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Care Manager Office	3	P1. Care Manager Office	3	\N	\N	11
48	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Dirty Utility (opposite Doctors Room)	3	P1. Dirty Utility (opposite Doctors Room)	3	\N	\N	11
49	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	RESIDENT ROOM	2	RESIDENT ROOM	2	\N	\N	5
50	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	CORRIDORS	2	CORRIDORS	2	\N	\N	5
51	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	COMMON AREAS	2	COMMON AREAS	2	\N	\N	5
52	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	CARE STAFF AREAS	2	CARE STAFF AREAS	2	\N	\N	5
53	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 13	3	H Room 13	3	\N	\N	49
54	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 14	3	H Room 14	3	\N	\N	49
55	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 15	3	H Room 15	3	\N	\N	49
56	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 16	3	H Room 16	3	\N	\N	49
57	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 17	3	H Room 17	3	\N	\N	49
58	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 18	3	H Room 18	3	\N	\N	49
59	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 19	3	H Room 19	3	\N	\N	49
60	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 20	3	H Room 20	3	\N	\N	49
61	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 21 (alcove)	3	H Room 21 (alcove)	3	\N	\N	49
62	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 21a	3	H Room 21a	3	\N	\N	49
63	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 21b	3	H Room 21b	3	\N	\N	49
64	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 22	3	H Room 22	3	\N	\N	49
65	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	NH Room 23 / BED 1 / 2 / 3 / 4	3	NH Room 23	3	\N	\N	49
66	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	NH Room 24 / BED 1 / 2 / 3 	3	NH Room 24	3	\N	\N	49
67	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	NH Room 25 / BED 1 / 2 / 3 	3	NH Room 25	3	\N	\N	49
68	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. From Rooms 12-13	3	P2. From Rooms 12-13	3	\N	\N	50
69	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. From Rooms 15-21	3	P2. From Rooms 15-21	3	\N	\N	50
70	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. From Rooms 11-14	3	P2. From Rooms 11-14	3	\N	\N	50
71	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Lounge (Regatta Room)	3	P2. Lounge (Regatta Room)	3	\N	\N	51
72	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Store Room (near Regatta Room)	3	P2. Store Room (near Regatta Room)	3	\N	\N	51
73	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Activities	3	P2. Activities	3	\N	\N	51
74	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Store Room (off Activities Room)	3	P2. Store Room (off Activities Room)	3	\N	\N	51
75	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Disabled Toilet (off Activities Room)	3	P2. Disabled Toilet (off Activities Room)	3	\N	\N	51
76	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Store Room (adjacent Utility Room)	3	P2. Store Room (adjacent Utility Room)	3	\N	\N	51
77	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Main Dining Room	3	P2. Main Dining Room	3	\N	\N	51
78	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Toilet/Oxygen Storage (Off Activities)	3	P2. Toilet/Oxygen Storage (Off Activities)	3	\N	\N	51
79	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Utility Room	3	P2. Utility Room	3	\N	\N	52
80	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P2. Cleaners Room	3	P2. Cleaners Room	3	\N	\N	52
81	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	RESIDENT ROOM	2	RESIDENT ROOM	2	\N	\N	6
82	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	CORRIDORS	2	CORRIDORS	2	\N	\N	6
83	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	COMMON AREAS	2	COMMON AREAS	2	\N	\N	6
84	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	CARE STAFF AREAS	2	CARE STAFF AREAS	2	\N	\N	6
85	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 33	3	H Room 33	3	\N	\N	81
86	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 34	3	H Room 34	3	\N	\N	81
87	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 9	3	H Room 9	3	\N	\N	81
88	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 10	3	H Room 10	3	\N	\N	81
89	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 11	3	H Room 11	3	\N	\N	81
90	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 12	3	H Room 12	3	\N	\N	81
91	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 13	3	H Room 13	3	\N	\N	81
92	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 14	3	H Room 14	3	\N	\N	81
93	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 15	3	H Room 15	3	\N	\N	81
94	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 16	3	H Room 16	3	\N	\N	81
95	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 17	3	H Room 17	3	\N	\N	81
96	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 18	3	H Room 18	3	\N	\N	81
97	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 19	3	H Room 19	3	\N	\N	81
98	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 20	3	H Room 20	3	\N	\N	81
99	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 21	3	H Room 21	3	\N	\N	81
100	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 22	3	H Room 22	3	\N	\N	81
101	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. From Room 1 - Lobby	3	A3. From Room 1 - Lobby	3	\N	\N	82
102	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	From Lobby to East Lounge	3	From Lobby to East Lounge	3	\N	\N	82
103	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	Cinema to Rooms 33 & 34	3	Cinema to Rooms 33 & 34	3	\N	\N	82
104	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Lounge / Dining	3	A3. Lounge / Dining	3	\N	\N	83
105	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Toilet 1 (off Lounge / Dining)	3	A3. Toilet 1 (off Lounge / Dining)	3	\N	\N	83
106	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Toilet 2 (off Lounge / Dining)	3	A3. Toilet 2 (off Lounge / Dining)	3	\N	\N	83
107	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Toilet 3 (off Lounge / Dining)	3	A3. Toilet 3 (off Lounge / Dining)	3	\N	\N	83
108	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Store Room	3	A3. Store Room	3	\N	\N	83
109	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Disabled Toilet	3	A3. Disabled Toilet 	3	\N	\N	83
110	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Cleaners Room	3	A3. Cleaners Room	3	\N	\N	83
111	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Longue (West End)	3	A3. Longue (West End)	3	\N	\N	83
112	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Lobby (near Nurses Station 2)	3	A3. Lobby (near Nurses Station 2)	3	\N	\N	83
113	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Lounge (East End)	3	A3. Lounge (East End)	3	\N	\N	83
114	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Toilet (East End)	3	A3. Toilet (East End)	3	\N	\N	83
115	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Nurses Station 2 (Seaspray)	3	A3. Nurses Station 2 (Seaspray)	3	\N	\N	84
116	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Fire Stairs 2	3	A3. Fire Stairs 2	3	\N	\N	84
117	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A3. Dirty Utility Room (Sea Spray)	3	A3. Dirty Utility Room (Sea Spray)	3	\N	\N	84
118	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	RESIDENT ROOM	2	RESIDENT ROOM	2	\N	\N	7
119	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	CORRIDORS	2	CORRIDORS	2	\N	\N	7
120	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	COMMON AREAS	2	COMMON AREAS	2	\N	\N	7
121	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	CARE STAFF AREAS	2	CARE STAFF AREAS	2	\N	\N	7
122	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 1	3	H Room 1	3	\N	\N	118
123	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 2	3	H Room 2	3	\N	\N	118
124	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 3	3	H Room 3	3	\N	\N	118
125	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 4	3	H Room 4	3	\N	\N	118
126	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 5	3	H Room 5	3	\N	\N	118
127	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 6	3	H Room 6	3	\N	\N	118
128	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 7	3	H Room 7	3	\N	\N	118
129	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 8	3	H Room 8	3	\N	\N	118
130	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 23	3	H Room 23	3	\N	\N	118
131	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 24	3	H Room 24	3	\N	\N	118
132	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 25	3	H Room 25	3	\N	\N	118
133	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 26	3	H Room 26	3	\N	\N	118
134	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 27	3	H Room 27	3	\N	\N	118
135	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 28	3	H Room 28	3	\N	\N	118
136	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 29	3	H Room 29	3	\N	\N	118
137	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 30	3	H Room 30	3	\N	\N	118
138	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 31	3	H Room 31	3	\N	\N	118
139	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	H Room 32	3	H Room 32	3	\N	\N	118
140	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. From Room 1 - Kitchen	3	A4. From Room 1 - Kitchen	3	\N	\N	119
141	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Outside Massage & Laundry Rooms	3	A4. Outside Massage & Laundry Rooms	3	\N	\N	119
142	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Outside 23 - Lobby	3	A4. Outside 23 - Lobby	3	\N	\N	119
143	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. From Lobby to East End Lounge	3	A4. From Lobby to East End Lounge	3	\N	\N	119
144	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Disable Toilet	3	A4. Disable Toilet	3	\N	\N	120
145	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Lounge (West End)	3	A4. Lounge (West End)	3	\N	\N	120
146	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Maintenance Room	3	A4. Maintenance Room	3	\N	\N	120
147	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Lounge (East End)	3	A4. Lounge (East End)	3	\N	\N	120
148	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. LIft 1	3	A4. LIft 1	3	\N	\N	120
149	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Hair Dresser	3	A4. Hair Dresser	3	\N	\N	120
150	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Massage Room	3	A4. Massage Room	3	\N	\N	120
151	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Massage (Bathroom 1)	3	A4. Massage (Bathroom 1)	3	\N	\N	120
152	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Massage (Bathroom 2)	3	A4. Massage (Bathroom 2)	3	\N	\N	120
153	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Cleaners Room	3	A4. Cleaners Room	3	\N	\N	121
154	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Dirty Utility	3	A4. Dirty Utility	3	\N	\N	121
155	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Nurses Station 3	3	A4. Nurses Station 3	3	\N	\N	121
156	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Foyer	3	A4. Foyer	3	\N	\N	121
157	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Services Cupboard	3	A4. Services Cupboard	3	\N	\N	121
158	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Staff Room (Toilet)	3	A4. Staff Room (Toilet)	3	\N	\N	121
159	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Staff Room (Locker Room)	3	A4. Staff Room (Locker Room)	3	\N	\N	121
160	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Staff Room (Main Area)	3	A4. Staff Room (Main Area)	3	\N	\N	121
161	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Nurses Station 4	3	A4. Nurses Station 4	3	\N	\N	121
162	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Lobby (near Nurses Station 4)	3	A4. Lobby (near Nurses Station 4)	3	\N	\N	121
163	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	A4. Laundry	3	A4. Laundry	3	\N	\N	121
164	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	P1. Kitchen	3	P1. Kitchen	3	\N	\N	10
165	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	WATERVIEW	0	WATERVIEW	0	\N	35	\N
166	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	MARMONG WATERS	0	MARMONG WATERS	0	\N	36	\N
167	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	HEAD OFFICE	0	HEAD OFFICE	0	\N	37	\N
168	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	KITCHEN	2	KITCHEN	2	\N	\N	4
169	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	KITCHEN	2	KITCHEN	2	\N	\N	6
170	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	MAIN KITCHEN	3	MAIN KITCHEN	3	\N	\N	168
171	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	PROMENADE SERVERY	3	PROMENADE SERVERY	3	\N	\N	168
172	2016-09-20 06:14:48.621508	f	2016-09-20 06:14:48.621508	REEF SERVERY	3	REEF SERVERY	3	\N	\N	169
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('locations_id_seq', 172, true);


--
-- Data for Name: main_exception; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY main_exception (id, created_date, is_deleted, last_modified, description, exceptionid, exception_type) FROM stdin;
\.


--
-- Name: main_exception_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('main_exception_id_seq', 1, false);


--
-- Data for Name: master_exception; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY master_exception (id, created_date, is_deleted, last_modified, position_id) FROM stdin;
1	2016-09-20 06:14:48.790709	f	2016-09-20 06:14:48.790709	\N
\.


--
-- Data for Name: master_exception_detail; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY master_exception_detail (id, created_date, is_deleted, last_modified, name, master_exception_id) FROM stdin;
1	2016-09-20 06:14:48.799852	f	2016-09-20 06:14:48.799852	Resident Sleeping	1
2	2016-09-20 06:14:48.799852	f	2016-09-20 06:14:48.799852	Resident Request	1
3	2016-09-20 06:14:48.799852	f	2016-09-20 06:14:48.799852	Maintenance Required	1
4	2016-09-20 06:14:48.799852	f	2016-09-20 06:14:48.799852	Visitors Present	1
5	2016-09-20 06:14:48.799852	f	2016-09-20 06:14:48.799852	Palliative Care	1
6	2016-09-20 06:14:48.799852	f	2016-09-20 06:14:48.799852	Others	1
\.


--
-- Name: master_exception_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('master_exception_detail_id_seq', 6, true);


--
-- Name: master_exception_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('master_exception_id_seq', 1, true);


--
-- Data for Name: master_lookups; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY master_lookups (id, created_date, is_deleted, last_modified, description, master_name) FROM stdin;
1	2016-09-20 06:14:48.678685	f	2016-09-20 06:14:48.678685	BASIS TYPES REFFERENCE TO XERO	BASIS TYPES
2	2016-09-20 06:14:48.678685	f	2016-09-20 06:14:48.678685	EMPLOYEE STATUS REFFERENCE TO XERO	EMPLOYEE STATUS
3	2016-09-20 06:14:48.678685	f	2016-09-20 06:14:48.678685	TFNExemption Type REFFERENCE TO XERO	TFNExemption Type
4	2016-09-20 06:14:48.678685	f	2016-09-20 06:14:48.678685	USER STATUS REFFERENCE TO XERO	USER STATUS
\.


--
-- Name: master_lookups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('master_lookups_id_seq', 4, true);


--
-- Data for Name: message_recipients; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY message_recipients (created_date, is_deleted, last_modified, is_seen, user_id, message_id) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY messages (message_id, created_date, is_deleted, last_modified, body, created_at, extended_route, extended_url, subject, reply_from, sender) FROM stdin;
\.


--
-- Data for Name: notification_recipient; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY notification_recipient (id, created_date, is_deleted, last_modified, is_seen, notification_id, recipient_id) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY notifications (id, created_date, is_deleted, last_modified, created_at, entity_id, entity_name, message, process_name, title, url, sender) FROM stdin;
\.


--
-- Data for Name: organisation_settings; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY organisation_settings (id, created_date, is_deleted, last_modified, timesheet_category_id) FROM stdin;
\.


--
-- Name: organisation_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('organisation_settings_id_seq', 1, false);


--
-- Data for Name: payroll_calendars; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY payroll_calendars (id, created_date, is_deleted, last_modified, payment_date, start_date, calendar_type_id) FROM stdin;
\.


--
-- Name: payroll_calendars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('payroll_calendars_id_seq', 1, false);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY permissions (id, created_date, is_deleted, last_modified, name, spring_role) FROM stdin;
1	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Roster Manager Module	ROSTER_MANAGER
2	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Roster Employee Module	ROSTER_EMPLOYEE
3	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Module User	USER
4	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Project Admin	PROJECT_ADMIN
5	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Project Self	PROJECT_SELF
6	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Tasklist Admin	TASKLIST_ADMIN
7	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Tasklist Self	TASKLIST_SELF
8	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Task Admin	TASK_ADMIN
9	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Task Self	TASK_SELF
10	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Task Employee	TASK_EMPLOYEE
11	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Subtask Admin	SUBTASK_ADMIN
12	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Subtask Self	SUBTASK_SELF
13	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Subtask Employee	SUBTASK_EMPLOYEE
14	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	File Manager	FILE_MANAGER
15	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	ESA Manager	ESA_MANAGER
16	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Auditor	AUDITOR
17	2016-09-20 06:14:48.568603	f	2016-09-20 06:14:48.568603	Maintenance Employee	MAINTENANCE_EMPLOYEE
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('permissions_id_seq', 17, true);


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY persons (id, created_date, is_deleted, last_modified, date_of_birth, email, first_name, gender, home_phone, last_name, middle_name, mobile_phone, next_of_kin_desc, photo, title, work_phone, address_id, next_of_kin_id, user_id) FROM stdin;
1	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Admin	M	\N	Administrator	\N	+6281276065691	\N	\N	\N	\N	1	\N	1
7	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Akihiro	M	\N	Namba	\N	+6281276065691	\N	\N	\N	\N	2	\N	7
8	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Susan	M	\N	Na	\N	+6281276065691	\N	\N	\N	\N	3	\N	8
9	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Milo	M	\N	Aukerman	\N	+6281276065691	\N	\N	\N	\N	4	\N	4
10	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Wendy	M	\N	Wendy	\N	+6281276065691	\N	\N	\N	\N	5	\N	10
11	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Didi	M	\N	Yudha	\N	+6281276065691	\N	\N	\N	\N	6	\N	\N
14	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Karen	F	\N	Anne Waters	\N	+6281276065691	\N	\N	\N	\N	7	\N	15
2	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tommy	M	\N	Herb	\N	+6281276065691	\N	\N	\N	\N	8	\N	2
3	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Bill	M	\N	Stephenson	\N	+6281276065691	\N	\N	\N	\N	9	\N	3
4	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Info	M	\N	Alvarez	\N	+6281276065691	\N	\N	\N	\N	10	\N	6
5	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Stephen	M	\N	Egerton	\N	+6281276065691	\N	\N	\N	\N	11	\N	5
6	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Irene	F	\N	Felita	\N	+6281276065691	\N	\N	\N	\N	12	\N	11
12	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Michael	M	\N	Hadisa	\N	+6281276065691	\N	\N	\N	\N	13	\N	12
13	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Didi	M	\N	Perwira	\N	+6281276065691	\N	\N	\N	\N	14	\N	13
15	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Zainul	M	\N	Masadi	\N	+6281276065691	\N	\N	\N	\N	15	\N	16
16	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Kim	F	\N	Jones	\N	+6281276065691	\N	\N	\N	\N	16	\N	17
17	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tammy	M	\N	Cox	\N	+6281276065691	\N	\N	\N	\N	17	\N	18
18	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 2	M	\N	Employee 2	\N	+6281276065691	\N	\N	\N	\N	18	\N	19
19	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 3	F	\N	Employee 3	\N	+6281276065691	\N	\N	\N	\N	19	\N	20
20	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 4	M	\N	Employee 4	\N	+6281276065691	\N	\N	\N	\N	20	\N	21
21	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 5	M	\N	Employee 5	\N	+6281276065691	\N	\N	\N	\N	21	\N	22
22	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 6	M	\N	Employee 6	\N	+6281276065691	\N	\N	\N	\N	22	\N	23
23	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 7	M	\N	Employee 7	\N	+6281276065691	\N	\N	\N	\N	23	\N	24
24	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 8	F	\N	Employee 8	\N	+6281276065691	\N	\N	\N	\N	24	\N	25
25	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 9	M	\N	Employee 9	\N	+6281276065691	\N	\N	\N	\N	25	\N	26
26	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 10	M	\N	Employee 10	\N	+6281276065691	\N	\N	\N	\N	26	\N	27
27	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 11	M	\N	Employee 11	\N	+6281276065691	\N	\N	\N	\N	27	\N	28
28	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 12	M	\N	Employee 12	\N	+6281276065691	\N	\N	\N	\N	28	\N	29
29	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 13	F	\N	Employee 13	\N	+6281276065691	\N	\N	\N	\N	29	\N	30
30	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 14	M	\N	Employee 14	\N	+6281276065691	\N	\N	\N	\N	30	\N	31
31	2016-09-20 06:14:48.612264	f	2016-09-20 06:14:48.612264	2016-09-20	\N	Tasking 15	M	\N	Employee 15	\N	+6281276065691	\N	\N	\N	\N	31	\N	32
\.


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('persons_id_seq', 31, true);


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY positions (id, created_date, is_deleted, last_modified, allias, level, name, parent_level_id, position_id) FROM stdin;
1	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	1	Director	\N	\N
2	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	2	Managing Director	1	\N
3	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Human Resources Manager	2	\N
4	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Chief Financial Officer	2	\N
5	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Chief Operating Officer	2	\N
6	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Compliance Manager	2	\N
7	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Training Manager	2	\N
8	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Executive Care Manager	2	\N
9	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Nursing Manager	2	\N
10	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Maintenance Manager	2	\N
11	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Information System Manager	2	\N
12	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Project Manager	2	\N
13	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Laundry	3	\N
14	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Cleaning	3	\N
15	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Faclitors	3	\N
16	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	ACFI Coordinator	4	\N
17	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Reception	4	\N
18	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Administration	4	\N
19	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Account Receviable	4	\N
20	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Account Payable	4	\N
21	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Procurement Officer	4	\N
22	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Marketing	4	\N
23	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Roster Clerk	4	\N
24	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Payroll	4	\N
25	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Continuous Improvement Officer	6	\N
26	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Compliance Auditor	6	\N
27	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	WH&S Officer	6	\N
28	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Competency Assessors	7	\N
29	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Activity Officers	7	\N
30	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Carers	8	\N
31	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Transportation	8	\N
32	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Home Care	8	\N
33	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Return to Work	8	\N
34	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Registered Nurse	8	\N
35	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Speech Patology	9	\N
36	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Dietician	9	\N
37	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Pain Management	9	\N
38	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Physiotherapist	9	\N
39	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Maintenance	10	\N
40	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Volunteer	3	\N
41	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Doctor	8	\N
42	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	5	Medication Nurse	34	\N
43	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	5	Massage	37	\N
44	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	5	Physio Aid	37	\N
45	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	6	Nurse Team Leader	42	\N
46	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	7	Assistant in Nursing	45	\N
47	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	3	Food Safety Manager	2	\N
48	2016-09-20 06:14:48.669291	f	2016-09-20 06:14:48.669291	\N	4	Kitchen	3	\N
\.


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('positions_id_seq', 48, true);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY project (id, created_date, is_deleted, last_modified, actual_end_date, actual_start_date, currency, description, end_date, initial_budget_estimation, is_audited, name, project_type, start_date, auditor_id, creator_id, location_id, project_audit_id) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	\N	IDR	\N	2016-03-06 02:00:00	100.00	f	PROJECT 1	OTHER	2016-03-06 01:00:00	\N	\N	2	\N
2	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	\N	IDR	\N	2016-03-06 03:00:00	100.00	f	PROJECT 2	OTHER	2016-03-06 02:00:00	\N	\N	2	\N
3	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	\N	IDR	\N	2016-03-06 04:00:00	100.00	f	PROJECT 3	OTHER	2016-03-06 03:00:00	\N	\N	2	\N
4	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	\N	IDR	\N	2016-03-06 05:00:00	100.00	f	PROJECT 4	OTHER	2016-03-06 04:00:00	\N	\N	2	\N
5	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	\N	IDR	\N	2016-03-06 06:00:00	100.00	f	PROJECT 5	OTHER	2016-03-06 05:00:00	\N	\N	2	\N
6	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	\N	IDR	\N	2016-03-06 15:00:00	100.00	f	FTP Cleaning - Promenade Area 1 	OTHER	2016-03-06 08:00:00	\N	\N	3	\N
7	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	\N	IDR	\N	2016-03-06 17:30:00	100.00	f	Realtime Jakarta	OTHER	2016-03-06 08:30:00	\N	\N	1	\N
8	2016-09-20 00:00:00	f	2016-09-20 00:00:00	\N	\N	AUD	\N	2016-12-30 17:00:00	1000.00	f	Reactive Maintenance Project 2016 	REACTIVE_MAINTENANCE	2015-12-31 17:00:00	\N	\N	3	\N
\.


--
-- Data for Name: project_has_standards; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY project_has_standards (project_id, standards_id) FROM stdin;
6	1
6	2
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('project_id_seq', 8, true);


--
-- Data for Name: project_users; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY project_users (created_date, is_deleted, last_modified, permission_project, user_id, project_id) FROM stdin;
2016-09-20 00:00:00	f	2016-09-20 00:00:00	EDIT_DELETE	17	6
2016-09-20 00:00:00	f	2016-09-20 00:00:00	EDIT_DELETE	1	8
2016-09-20 00:00:00	f	2016-09-20 00:00:00	EDIT_DELETE	17	8
\.


--
-- Data for Name: property_values; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY property_values (dtype, id, value) FROM stdin;
\.


--
-- Data for Name: property_values_check_box_property_options; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY property_values_check_box_property_options (checkboxpropertyvalue_id, value_id) FROM stdin;
\.


--
-- Data for Name: public_holiday; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY public_holiday (id, created_date, is_deleted, last_modified, description, end_date, name, start_date, timezone, type) FROM stdin;
1	2016-09-20 06:14:48.823149	f	2016-09-20 06:14:48.823149	\N	1945-08-17	Indonesia Independence Day	1945-08-17	UTC	\N
2	2016-09-20 06:14:56.31	f	2016-09-20 06:14:56.31	\N	2016-01-01	Australia: New Years Day	2016-01-01	UTC	NSW Public Holiday
3	2016-09-20 06:14:56.316	f	2016-09-20 06:14:56.316	\N	2016-01-26	Australia: Australia Day 	2016-01-26	UTC	NSW Public Holiday
4	2016-09-20 06:14:56.321	f	2016-09-20 06:14:56.321	\N	2016-03-25	Australia: Good Friday 	2016-03-25	UTC	NSW Public Holiday
5	2016-09-20 06:14:56.328	f	2016-09-20 06:14:56.328	\N	2016-03-26	Australia: Easter Saturday (Regional)	2016-03-26	UTC	NSW Public Holiday
6	2016-09-20 06:14:56.333	f	2016-09-20 06:14:56.333	\N	2016-03-27	Australia: Easter Sunday (Regional)	2016-03-27	UTC	NSW Public Holiday
7	2016-09-20 06:14:56.336	f	2016-09-20 06:14:56.336	\N	2016-03-28	Australia: Easter Monday	2016-03-28	UTC	NSW Public Holiday
8	2016-09-20 06:14:56.342	f	2016-09-20 06:14:56.342	\N	2016-04-25	Australia: ANZAC Day 	2016-04-25	UTC	NSW Public Holiday
9	2016-09-20 06:14:56.354	f	2016-09-20 06:14:56.354	\N	2016-06-13	Australia: Queens Birthday (Regional)	2016-06-13	UTC	NSW Public Holiday
10	2016-09-20 06:14:56.359	f	2016-09-20 06:14:56.359	\N	2016-10-03	Australia: Labour Day (Regional)	2016-10-03	UTC	NSW Public Holiday
11	2016-09-20 06:14:56.363	f	2016-09-20 06:14:56.363	\N	2016-12-25	Australia: Christmas Day 	2016-12-25	UTC	NSW Public Holiday
12	2016-09-20 06:14:56.369	f	2016-09-20 06:14:56.369	\N	2016-12-26	Australia: Boxing Day	2016-12-26	UTC	NSW Public Holiday
13	2016-09-20 06:14:56.375	f	2016-09-20 06:14:56.375	\N	2016-12-27	Australia: Christmas Day (in lieu)	2016-12-27	UTC	NSW Public Holiday
14	2016-09-20 06:14:56.382	f	2016-09-20 06:14:56.382	\N	2017-01-01	Australia: New Years Day	2017-01-01	UTC	NSW Public Holiday
15	2016-09-20 06:14:56.386	f	2016-09-20 06:14:56.386	\N	2017-01-02	Australia: New Years Holiday	2017-01-02	UTC	NSW Public Holiday
16	2016-09-20 06:14:56.391	f	2016-09-20 06:14:56.391	\N	2017-01-26	Australia: Australia Day 	2017-01-26	UTC	NSW Public Holiday
17	2016-09-20 06:14:56.399	f	2016-09-20 06:14:56.399	\N	2017-04-14	Australia: Good Friday 	2017-04-14	UTC	NSW Public Holiday
18	2016-09-20 06:14:56.404	f	2016-09-20 06:14:56.404	\N	2017-04-15	Australia: Easter Saturday (Regional)	2017-04-15	UTC	NSW Public Holiday
19	2016-09-20 06:14:56.408	f	2016-09-20 06:14:56.408	\N	2017-04-16	Australia: Easter Sunday (Regional)	2017-04-16	UTC	NSW Public Holiday
20	2016-09-20 06:14:56.413	f	2016-09-20 06:14:56.413	\N	2017-04-17	Australia: Easter Monday	2017-04-17	UTC	NSW Public Holiday
21	2016-09-20 06:14:56.419	f	2016-09-20 06:14:56.419	\N	2017-04-25	Australia: ANZAC Day 	2017-04-25	UTC	NSW Public Holiday
22	2016-09-20 06:14:56.425	f	2016-09-20 06:14:56.425	\N	2017-06-12	Australia: Queens Birthday (Regional)	2017-06-12	UTC	NSW Public Holiday
23	2016-09-20 06:14:56.429	f	2016-09-20 06:14:56.429	\N	2017-10-02	Australia: Labour Day (Regional)	2017-10-02	UTC	NSW Public Holiday
24	2016-09-20 06:14:56.434	f	2016-09-20 06:14:56.434	\N	2017-12-25	Australia: Christmas Day 	2017-12-25	UTC	NSW Public Holiday
25	2016-09-20 06:14:56.44	f	2016-09-20 06:14:56.44	\N	2017-12-26	Australia: Boxing Day	2017-12-26	UTC	NSW Public Holiday
\.


--
-- Name: public_holiday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('public_holiday_id_seq', 25, true);


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
schedulerFactoryBean	emailAlert	group1	\N	healthcare.jobs.EmailAlertJobs	t	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_locks (sched_name, lock_name) FROM stdin;
schedulerFactoryBean	TRIGGER_ACCESS
schedulerFactoryBean	STATE_ACCESS
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
schedulerFactoryBean	zainul1474352089896	1474352104210	20000
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
\.


--
-- Data for Name: radio_button_property_options; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY radio_button_property_options (id, created_date, is_deleted, last_modified, name) FROM stdin;
\.


--
-- Data for Name: residents; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY residents (id, created_date, is_deleted, last_modified, admitted_date, created_at, departed_date, departure_reason, status, person_id) FROM stdin;
\.


--
-- Name: residents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('residents_id_seq', 1, false);


--
-- Data for Name: resource_api; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY resource_api (id, created_date, is_deleted, last_modified, description, method, name, path) FROM stdin;
1	2016-09-20 06:14:48.705572	f	2016-09-20 06:14:48.705572	Creating a new leave request process	POST	Create Leave Request	api/leaveRequest
\.


--
-- Name: resource_api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('resource_api_id_seq', 1, true);


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY role_permissions (id, created_date, is_deleted, last_modified, create_permission, delete_permission, read_permission, update_permission, id_permission, role_id) FROM stdin;
1	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	1	1
2	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	3	1
3	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	4	1
4	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	6	1
5	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	8	1
6	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	11	1
7	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	14	1
8	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	15	1
9	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	16	1
39	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	17	1
10	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	1	2
11	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	4	2
12	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	6	2
13	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	8	2
14	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	11	2
15	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	2	3
16	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	10	3
17	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	f	f	t	f	13	3
18	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	1	4
19	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	4	6
20	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	6	6
21	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	8	6
22	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	11	6
23	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	15	6
41	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	17	6
24	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	5	7
25	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	7	7
26	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	9	7
27	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	12	7
28	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	15	7
40	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	17	7
29	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	10	8
30	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	f	f	t	f	13	8
31	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	14	9
32	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	15	9
33	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	5	10
34	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	7	10
35	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	9	10
36	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	12	10
37	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	15	10
38	2016-09-20 06:14:48.586331	f	2016-09-20 06:14:48.586331	t	t	t	t	16	10
\.


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('role_permissions_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY roles (id, created_date, is_deleted, last_modified, name) FROM stdin;
1	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Admin
2	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Roster Manager Role
3	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Roster Employee Role
4	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Doctor
5	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Employee
6	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Tasking Admin
7	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Self Tasking
8	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Tasking Employee
9	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	File Manager
10	2016-09-20 06:14:48.578938	f	2016-09-20 06:14:48.578938	Auditor
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('roles_id_seq', 10, true);


--
-- Data for Name: roster_histories; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY roster_histories (id, created_date, is_deleted, last_modified, action, description, reason, creator_action_id, receiver_id, roster_id) FROM stdin;
\.


--
-- Name: roster_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('roster_histories_id_seq', 1, false);


--
-- Data for Name: rosters; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY rosters (id, created_date, is_deleted, last_modified, description, end_date, length_of_minute, roster_assignee, roster_status, start_date, employee_id, location_id, manager_id, reference_rooster_id) FROM stdin;
\.


--
-- Name: rosters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('rosters_id_seq', 1, false);


--
-- Data for Name: routine_tasks; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY routine_tasks (id, created_date, is_deleted, last_modified, routine_id, task_template_id, routine_task_id) FROM stdin;
\.


--
-- Data for Name: routines; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY routines (id, created_date, is_deleted, last_modified, code, description, name) FROM stdin;
\.


--
-- Data for Name: stake_holders; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY stake_holders (id, created_date, is_deleted, last_modified, job_title, xero_id, person_id) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 06:14:48.65959	Bank Manager	a123rewfw	7
2	2016-09-20 00:00:00	f	2016-09-20 06:14:48.65959	Tax Accountant		8
3	2016-09-20 00:00:00	f	2016-09-20 06:14:48.65959	Departemen Of Social Services		9
4	2016-09-20 00:00:00	f	2016-09-20 06:14:48.65959	Australian Tax Office		10
5	2016-09-20 00:00:00	f	2016-09-20 06:14:48.65959	External Auditor		11
\.


--
-- Name: stake_holders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('stake_holders_id_seq', 5, true);


--
-- Data for Name: standards; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY standards (id, created_date, is_deleted, last_modified, code, description, name) FROM stdin;
1	2016-09-20 06:14:48.808634	f	2016-09-20 06:14:48.808634	CL01	Cleaning Standard	Cleaning Standard
2	2016-09-20 06:14:48.808634	f	2016-09-20 06:14:48.808634	H01	Cleaning Standard	Health Standard
\.


--
-- Name: standards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('standards_id_seq', 2, true);


--
-- Data for Name: supplier_type_position; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY supplier_type_position (supplier_type_id, position_id) FROM stdin;
1	47
1	3
2	8
2	9
3	10
\.


--
-- Data for Name: supplier_types; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY supplier_types (id, created_date, is_deleted, last_modified, name) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 00:00:00	FOOD SUPPLIER
2	2016-09-20 00:00:00	f	2016-09-20 00:00:00	HEALTH SERVICES
3	2016-09-20 00:00:00	f	2016-09-20 00:00:00	CONSTRUCTION MAINTENANCE
\.


--
-- Name: supplier_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('supplier_types_id_seq', 3, true);


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY suppliers (id, created_date, is_deleted, last_modified, name_of_organization, xero_id, person_id) FROM stdin;
\.


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('suppliers_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY tags (id, created_date, is_deleted, last_modified, name) FROM stdin;
1	2016-09-20 00:00:00	f	2016-09-20 00:00:00	healthcare
2	2016-09-20 00:00:00	f	2016-09-20 00:00:00	figtreepoint
3	2016-09-20 00:00:00	f	2016-09-20 00:00:00	amaroo
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('tags_id_seq', 3, true);


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task (id, created_date, is_deleted, last_modified, actualenddate, actual_start_date, all_day, audit_exception_reason, audit_status, audited_on, completed_on, created_on_timezone, description, end_date, exception_reason, exception_reported_on, is_audited, name, include_public_holiday, priority, repeat_end_date, repeated, start_date, status, asset_id, assigned_by, auditor_id, completed_by, exception_reported_by, location_id, parent_task_id, project_id, repeat_from_task_id, task_reactive_detail_id, tasklist_id) FROM stdin;
1	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	CLEANING ROOM	NONE	MEDIUM	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	\N	1	\N	\N	1
2	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	WASHING CAR	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	\N	1	\N	\N	2
3	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	CLEANING POOL	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	\N	2	\N	\N	3
4	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	SUBTASK CLEANING ROOM 1	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	1	1	\N	\N	1
5	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	SUBTASK CLEANING ROOM 2	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	1	1	\N	\N	1
6	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	SUBTASK WASHING CAR 1	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	2	1	\N	\N	2
7	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	SUBTASK WASHING CAR 2	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	2	1	\N	\N	2
8	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	SUBTASK CLEANING POOL 1	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	3	2	\N	\N	3
9	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	SUBTASK CLEANING POOL 2	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	3	2	\N	\N	3
10	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	All accessible chairs touch cleaned	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
11	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Bed Wipe Over Head, Foot, Rails	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
12	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Bed controller	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
13	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Bedside drawer unit (moveable) Top, drawer faces	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
14	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Bin : change and reline	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
15	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Call button	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
16	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Door hardware (all doors) (both sides)	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
17	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Fan controller	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
18	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Bar fridge (Defrost and Wipe Clean When Necessary)	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
19	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Kitchenette unit single stainless steel bowl, drainer & tapware	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
20	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Handles & Exterior Cupboards (above Kitchenette bench)	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
21	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Handles & Exterior Drawers (below Kitchenette bench)	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
22	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Handles & Exterior Fridge (standard size)	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
23	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Handles & Exterior Mirrored wardrobe	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
24	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Handles & Exterior Wardrobe	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	12	\N	6	\N	\N	11
25	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	CORRIDOR (Outside Kitchen)	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	\N	6	\N	\N	12
26	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Basin & Tapware	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
27	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Bin	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
28	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Handrails	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
29	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Flooring (static mop)	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
30	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	"Breeze" power switches	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
31	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Computer devices tablets	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
32	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Door hardware	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
33	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Exhaust fan controller	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
34	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Exit door hardware (accessible sides)	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
35	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Exit key pad	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
36	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Glove dispenser	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
37	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Hand gel dispenser	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	25	6	\N	\N	12
38	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Miscellaneous	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	\N	6	\N	\N	13
39	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Collect stock from Reef & Seaspray	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	38	6	\N	\N	13
40	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Empty linen trolley & take empty trolley to Laundry, collecting trolley of towels	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	38	6	\N	\N	13
41	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Empty Cleaners trolley garbage bag	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	38	6	\N	\N	13
42	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Place dirty linen in Laundry Chute	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	38	6	\N	\N	13
43	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Putting away stock	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	38	6	\N	\N	13
44	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Stock Cleaners Trolley	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	38	6	\N	\N	13
45	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Take dirty dishes to Kitchen	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	1	\N	\N	\N	\N	38	6	\N	\N	13
46	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Pay wage	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	14	\N	\N	\N	\N	\N	7	\N	\N	14
47	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Transfer via OFX	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	14	\N	\N	\N	\N	46	7	\N	\N	14
48	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Print Confirmation	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	14	\N	\N	\N	\N	46	7	\N	\N	14
49	2016-09-20 06:14:48.768235	f	2016-09-20 06:14:48.768235	\N	\N	f	\N	NONE	\N	\N	UTC	\N	2016-09-20 00:00:00	\N	\N	f	Finalise in Xero	NONE	HIGH	\N	NONE	2016-09-20 00:00:00	NOT_COMPLETED	\N	14	\N	\N	\N	\N	46	7	\N	\N	14
\.


--
-- Data for Name: task_assigned_to_bulk_edit; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_assigned_to_bulk_edit (task_id, assignees_id) FROM stdin;
\.


--
-- Data for Name: task_assignees; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_assignees (task_id, assignees_id) FROM stdin;
1	10
2	10
3	10
4	10
5	10
6	10
7	10
8	10
9	10
10	10
11	10
12	10
13	10
14	10
15	10
16	10
17	10
18	10
19	10
20	10
21	10
22	10
23	10
24	10
25	10
26	10
27	10
28	10
29	10
30	10
31	10
32	10
33	10
34	10
35	10
36	10
37	10
38	10
39	10
40	10
41	10
42	10
43	10
44	10
45	10
46	10
47	10
48	10
49	10
\.


--
-- Data for Name: task_assignees_bulk_edit; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_assignees_bulk_edit (task_id, assignees_id) FROM stdin;
\.


--
-- Data for Name: task_attachment; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_attachment (task_id, attachment_id) FROM stdin;
\.


--
-- Data for Name: task_bulk_edit; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_bulk_edit (id, created_date, is_deleted, last_modified, push_task_skipweekends, end_date, modify_sub_task, move_end_date, move_start_date, number_ofdays_push_task, pick_assigned_to_type, pick_assignees, pick_assignees_type, pick_move_date, pick_move_date_type, pick_priority, start_date, task_priority, tasklist_id) FROM stdin;
\.


--
-- Name: task_bulk_edit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('task_bulk_edit_id_seq', 1, false);


--
-- Data for Name: task_categories; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_categories (id, created_date, is_deleted, last_modified, code, description, name) FROM stdin;
1	2016-09-20 06:14:48.732508	f	2016-09-20 06:14:48.732508	001	CATEGORY 1 DESCRIPTION	CATEGORY 1
2	2016-09-20 06:14:48.732508	f	2016-09-20 06:14:48.732508	002	CATEGORY 2 DESCRIPTION	CATEGORY 2
3	2016-09-20 06:14:48.732508	f	2016-09-20 06:14:48.732508	003	CATEGORY 3 DESCRIPTION	CATEGORY 3
4	2016-09-20 06:14:48.732508	f	2016-09-20 06:14:48.732508	004	CATEGORY 4 DESCRIPTION	CATEGORY 4
5	2016-09-20 06:14:48.732508	f	2016-09-20 06:14:48.732508	005	CATEGORY 5 DESCRIPTION	CATEGORY 5
\.


--
-- Name: task_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('task_categories_id_seq', 5, true);


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('task_id_seq', 49, true);


--
-- Data for Name: task_reactive_details; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_reactive_details (id, created_date, is_deleted, last_modified, actual_cost, actual_time, initial_budget_estimation, time_estimation, asset_id) FROM stdin;
\.


--
-- Name: task_reactive_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('task_reactive_details_id_seq', 1, false);


--
-- Data for Name: task_roster_id; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_roster_id (taskroster_id, propertyvalues_id) FROM stdin;
\.


--
-- Data for Name: task_rosters; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_rosters (id, created_date, is_deleted, last_modified, end_time, start_time, roster_id, routine_task_id) FROM stdin;
\.


--
-- Data for Name: task_selecteddays; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_selecteddays (task_id, selected_days) FROM stdin;
\.


--
-- Data for Name: task_standards; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_standards (task_id, standards_id) FROM stdin;
\.


--
-- Data for Name: task_template; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY task_template (id, created_date, is_deleted, last_modified, code, name, task_category_id) FROM stdin;
1	2016-09-20 06:14:48.741474	f	2016-09-20 06:14:48.741474	T1	Task 1	\N
\.


--
-- Name: task_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('task_template_id_seq', 1, true);


--
-- Data for Name: tasklist; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY tasklist (id, created_date, is_deleted, last_modified, actual_cost, actual_end_date, actual_start_date, currency, description, enddate, initial_budget_estimation, name, startdate, creator_id, location_id, project_id) FROM stdin;
1	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 1	\N	\N	\N	1
2	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 2	\N	\N	\N	1
3	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 3	\N	\N	\N	2
4	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 4	\N	\N	\N	2
5	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 5	\N	\N	\N	3
6	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 6	\N	\N	\N	3
7	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 7	\N	\N	\N	4
8	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 8	\N	\N	\N	4
9	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 9	\N	\N	\N	5
10	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	General Task list 10	\N	\N	\N	5
11	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	Resident Rooms	\N	\N	8	6
12	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	Corridors	\N	\N	9	6
13	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	Common Areas	\N	\N	10	6
14	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	Care Staff Areas	\N	\N	11	6
15	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	Human Resource	\N	\N	\N	7
16	2016-09-20 06:14:48.759036	f	2016-09-20 06:14:48.759036	\N	\N	\N	\N	\N	\N	\N	Default tasklist reactive maintenance	\N	\N	\N	8
\.


--
-- Name: tasklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('tasklist_id_seq', 16, true);


--
-- Data for Name: tax_declarations; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY tax_declarations (id, created_date, is_deleted, last_modified, approved_withholding_variation_percentage, australian_resident_for_tax_purposes, eligible_to_receive_leaving_loading, has_help_debt, has_sfss_debt, has_tsl_debt, tax_file_number, tax_free_threshold_claimed, tax_offset_estimated_amount, tfn_exemption_type, upward_variation_tax_withholding_amount) FROM stdin;
\.


--
-- Name: tax_declarations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('tax_declarations_id_seq', 1, false);


--
-- Data for Name: tfn_exemption_types; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY tfn_exemption_types (id, created_date, is_deleted, last_modified, information) FROM stdin;
1	2016-09-20 06:14:48.696596	f	2016-09-20 06:14:48.696596	Tfn Exemption1
2	2016-09-20 06:14:48.696596	f	2016-09-20 06:14:48.696596	Tfn Exemption2
\.


--
-- Name: tfn_exemption_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('tfn_exemption_types_id_seq', 2, true);


--
-- Data for Name: tmp_approval; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY tmp_approval (id, created_date, is_deleted, last_modified, batch_id, create_by, created_dt, description, process_id) FROM stdin;
\.


--
-- Name: tmp_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('tmp_approval_id_seq', 1, false);


--
-- Data for Name: tracking_categories; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY tracking_categories (id, created_date, is_deleted, last_modified, description, is_archieved, name, status) FROM stdin;
\.


--
-- Data for Name: tracking_category_options; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY tracking_category_options (id, created_date, is_deleted, last_modified, description, is_archieved, name, status, tracking_category_id) FROM stdin;
\.


--
-- Name: tracking_category_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('tracking_category_options_id_seq', 1, false);


--
-- Data for Name: user_custom_permissions; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY user_custom_permissions (id, created_date, is_deleted, last_modified, create_permission, delete_permission, read_permission, update_permission, id_permission, user_id) FROM stdin;
\.


--
-- Name: user_custom_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('user_custom_permissions_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY users (id, created_date, is_deleted, last_modified, created_token_at, email, is_archieved, password, remember_token, status, user_type, role_id) FROM stdin;
1	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	admin@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	1
4	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	employee1@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	3
7	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	employee4@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	3
8	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	susan@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	3
10	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	wendy@yahoo.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	3
15	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	karenanne@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	1
33	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	system@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	System	8
2	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	tommy@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	2
3	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	bill@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	2
5	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	employee2@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	3
6	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	info@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	1
9	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	employee6@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	3
11	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	irene@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	1
12	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	michael@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	7
13	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	didi@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	6
14	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	unknown@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	6
16	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	zainul@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	7
17	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	kim@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	7
18	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	tammy@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
19	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te2@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
20	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te3@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
21	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te4@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
22	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te5@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
23	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te6@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
24	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te7@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
25	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te8@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
26	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te9@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
27	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te10@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
28	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te11@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
29	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te12@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
30	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te13@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
31	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te14@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
32	2016-09-20 06:14:48.593132	f	2016-09-20 06:14:48.593132	\N	te15@realtimejakarta.com	f	$2a$08$loVHA0yyeipzJNhHCisr9.40NH.NCh8.Sfk57zQBrOocE3fSA7vxq	\N	ACTIVE	Employee	8
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zainul
--

SELECT pg_catalog.setval('users_id_seq', 33, true);


--
-- Data for Name: uuidentity; Type: TABLE DATA; Schema: public; Owner: zainul
--

COPY uuidentity (id, created_date, is_deleted, last_modified) FROM stdin;
\.


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: approval_setting_details_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY approval_setting_details
    ADD CONSTRAINT approval_setting_details_pkey PRIMARY KEY (id);


--
-- Name: approval_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY approval_settings
    ADD CONSTRAINT approval_settings_pkey PRIMARY KEY (id);


--
-- Name: assets_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: audit_exceptions_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY audit_exceptions
    ADD CONSTRAINT audit_exceptions_pkey PRIMARY KEY (id);


--
-- Name: audit_trails_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY audit_trails
    ADD CONSTRAINT audit_trails_pkey PRIMARY KEY (id);


--
-- Name: basis_types_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY basis_types
    ADD CONSTRAINT basis_types_pkey PRIMARY KEY (id);


--
-- Name: calendar_types_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY calendar_types
    ADD CONSTRAINT calendar_types_pkey PRIMARY KEY (id);


--
-- Name: check_box_property_options_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY check_box_property_options
    ADD CONSTRAINT check_box_property_options_pkey PRIMARY KEY (id);


--
-- Name: comment_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY comment_attachment
    ADD CONSTRAINT comment_attachment_pkey PRIMARY KEY (comment_id, attachment_id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: detail_lookups_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY detail_lookups
    ADD CONSTRAINT detail_lookups_pkey PRIMARY KEY (id);


--
-- Name: document_options_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY document_options
    ADD CONSTRAINT document_options_pkey PRIMARY KEY (id);


--
-- Name: earning_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY earning_rates
    ADD CONSTRAINT earning_rates_pkey PRIMARY KEY (id);


--
-- Name: email_alert_template_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY email_alert_template
    ADD CONSTRAINT email_alert_template_pkey PRIMARY KEY (id);


--
-- Name: email_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY email_logs
    ADD CONSTRAINT email_logs_pkey PRIMARY KEY (id);


--
-- Name: employee_bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY employee_bank_accounts
    ADD CONSTRAINT employee_bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: employee_file_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY employee_file_permissions
    ADD CONSTRAINT employee_file_permissions_pkey PRIMARY KEY (id);


--
-- Name: employee_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY employee_positions
    ADD CONSTRAINT employee_positions_pkey PRIMARY KEY (id);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: exception_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY exception_attachment
    ADD CONSTRAINT exception_attachment_pkey PRIMARY KEY (main_exception_id, attachment_id);


--
-- Name: exception_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY exception_notification
    ADD CONSTRAINT exception_notification_pkey PRIMARY KEY (id);


--
-- Name: file_approver_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY file_approver
    ADD CONSTRAINT file_approver_pkey PRIMARY KEY (file_id, approver_id);


--
-- Name: file_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY file_permissions
    ADD CONSTRAINT file_permissions_pkey PRIMARY KEY (id);


--
-- Name: file_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY file_tags
    ADD CONSTRAINT file_tags_pkey PRIMARY KEY (file_id, tag_id);


--
-- Name: file_trigger_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY file_trigger_schedule
    ADD CONSTRAINT file_trigger_schedule_pkey PRIMARY KEY (id);


--
-- Name: file_uploadby_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY file_uploadby_supplier
    ADD CONSTRAINT file_uploadby_supplier_pkey PRIMARY KEY (id);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: google_drive_response_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY google_drive_response
    ADD CONSTRAINT google_drive_response_pkey PRIMARY KEY (id);


--
-- Name: item_details_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY item_details
    ADD CONSTRAINT item_details_pkey PRIMARY KEY (id);


--
-- Name: leave_request_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY leave_request
    ADD CONSTRAINT leave_request_pkey PRIMARY KEY (id);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: location_path_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY location_path
    ADD CONSTRAINT location_path_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: main_exception_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY main_exception
    ADD CONSTRAINT main_exception_pkey PRIMARY KEY (id);


--
-- Name: master_exception_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY master_exception_detail
    ADD CONSTRAINT master_exception_detail_pkey PRIMARY KEY (id);


--
-- Name: master_exception_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY master_exception
    ADD CONSTRAINT master_exception_pkey PRIMARY KEY (id);


--
-- Name: master_lookups_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY master_lookups
    ADD CONSTRAINT master_lookups_pkey PRIMARY KEY (id);


--
-- Name: message_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY message_recipients
    ADD CONSTRAINT message_recipients_pkey PRIMARY KEY (message_id, user_id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (message_id);


--
-- Name: notification_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY notification_recipient
    ADD CONSTRAINT notification_recipient_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: organisation_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY organisation_settings
    ADD CONSTRAINT organisation_settings_pkey PRIMARY KEY (id);


--
-- Name: payroll_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY payroll_calendars
    ADD CONSTRAINT payroll_calendars_pkey PRIMARY KEY (id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: persons_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: positions_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: project_has_standards_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY project_has_standards
    ADD CONSTRAINT project_has_standards_pkey PRIMARY KEY (project_id, standards_id);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: project_users_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY project_users
    ADD CONSTRAINT project_users_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: property_values_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY property_values
    ADD CONSTRAINT property_values_pkey PRIMARY KEY (id);


--
-- Name: public_holiday_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY public_holiday
    ADD CONSTRAINT public_holiday_pkey PRIMARY KEY (id);


--
-- Name: qrtz_blob_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_paused_trigger_grps_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);


--
-- Name: qrtz_scheduler_state_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: radio_button_property_options_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY radio_button_property_options
    ADD CONSTRAINT radio_button_property_options_pkey PRIMARY KEY (id);


--
-- Name: residents_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY residents
    ADD CONSTRAINT residents_pkey PRIMARY KEY (id);


--
-- Name: resource_api_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY resource_api
    ADD CONSTRAINT resource_api_pkey PRIMARY KEY (id);


--
-- Name: role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roster_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY roster_histories
    ADD CONSTRAINT roster_histories_pkey PRIMARY KEY (id);


--
-- Name: rosters_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY rosters
    ADD CONSTRAINT rosters_pkey PRIMARY KEY (id);


--
-- Name: routine_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY routine_tasks
    ADD CONSTRAINT routine_tasks_pkey PRIMARY KEY (id);


--
-- Name: routines_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY routines
    ADD CONSTRAINT routines_pkey PRIMARY KEY (id);


--
-- Name: stake_holders_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY stake_holders
    ADD CONSTRAINT stake_holders_pkey PRIMARY KEY (id);


--
-- Name: standards_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY standards
    ADD CONSTRAINT standards_pkey PRIMARY KEY (id);


--
-- Name: supplier_type_position_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY supplier_type_position
    ADD CONSTRAINT supplier_type_position_pkey PRIMARY KEY (supplier_type_id, position_id);


--
-- Name: supplier_types_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY supplier_types
    ADD CONSTRAINT supplier_types_pkey PRIMARY KEY (id);


--
-- Name: suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: task_assigned_to_bulk_edit_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_assigned_to_bulk_edit
    ADD CONSTRAINT task_assigned_to_bulk_edit_pkey PRIMARY KEY (task_id, assignees_id);


--
-- Name: task_assignees_bulk_edit_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_assignees_bulk_edit
    ADD CONSTRAINT task_assignees_bulk_edit_pkey PRIMARY KEY (task_id, assignees_id);


--
-- Name: task_assignees_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_assignees
    ADD CONSTRAINT task_assignees_pkey PRIMARY KEY (task_id, assignees_id);


--
-- Name: task_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_attachment
    ADD CONSTRAINT task_attachment_pkey PRIMARY KEY (task_id, attachment_id);


--
-- Name: task_bulk_edit_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_bulk_edit
    ADD CONSTRAINT task_bulk_edit_pkey PRIMARY KEY (id);


--
-- Name: task_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_categories
    ADD CONSTRAINT task_categories_pkey PRIMARY KEY (id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: task_reactive_details_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_reactive_details
    ADD CONSTRAINT task_reactive_details_pkey PRIMARY KEY (id);


--
-- Name: task_rosters_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_rosters
    ADD CONSTRAINT task_rosters_pkey PRIMARY KEY (id);


--
-- Name: task_standards_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_standards
    ADD CONSTRAINT task_standards_pkey PRIMARY KEY (task_id, standards_id);


--
-- Name: task_template_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_template
    ADD CONSTRAINT task_template_pkey PRIMARY KEY (id);


--
-- Name: tasklist_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY tasklist
    ADD CONSTRAINT tasklist_pkey PRIMARY KEY (id);


--
-- Name: tax_declarations_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY tax_declarations
    ADD CONSTRAINT tax_declarations_pkey PRIMARY KEY (id);


--
-- Name: tfn_exemption_types_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY tfn_exemption_types
    ADD CONSTRAINT tfn_exemption_types_pkey PRIMARY KEY (id);


--
-- Name: tmp_approval_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY tmp_approval
    ADD CONSTRAINT tmp_approval_pkey PRIMARY KEY (id);


--
-- Name: tracking_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY tracking_categories
    ADD CONSTRAINT tracking_categories_pkey PRIMARY KEY (id);


--
-- Name: tracking_category_options_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY tracking_category_options
    ADD CONSTRAINT tracking_category_options_pkey PRIMARY KEY (id);


--
-- Name: uk12py6w73j1ea0o7xn3f1xpfhx; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY standards
    ADD CONSTRAINT uk12py6w73j1ea0o7xn3f1xpfhx UNIQUE (name, code);


--
-- Name: uk8trrsk9lko9n9btyfugdw2xb2; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT uk8trrsk9lko9n9btyfugdw2xb2 UNIQUE (name, code);


--
-- Name: uk_24r4pdku0n1l2jexseq6j2fbb; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT uk_24r4pdku0n1l2jexseq6j2fbb UNIQUE (user_id);


--
-- Name: uk_2ep7hx3a48eo0xlyn7ygc32vs; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY file_trigger_schedule
    ADD CONSTRAINT uk_2ep7hx3a48eo0xlyn7ygc32vs UNIQUE (trigger_name);


--
-- Name: uk_3gd5xtxgoxs2xxspmv0ery6hr; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY routines
    ADD CONSTRAINT uk_3gd5xtxgoxs2xxspmv0ery6hr UNIQUE (name);


--
-- Name: uk_3pc8ruth8lkorgxs5qqiva6in; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY standards
    ADD CONSTRAINT uk_3pc8ruth8lkorgxs5qqiva6in UNIQUE (name);


--
-- Name: uk_5c2m6k7ue06kgf2kxd8gkqsvi; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT uk_5c2m6k7ue06kgf2kxd8gkqsvi UNIQUE (spring_role);


--
-- Name: uk_6472x0lpf1xjx879d74fvgrsp; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY exception_attachment
    ADD CONSTRAINT uk_6472x0lpf1xjx879d74fvgrsp UNIQUE (attachment_id);


--
-- Name: uk_a9byjd2bqvamm1svixufxcxhk; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT uk_a9byjd2bqvamm1svixufxcxhk UNIQUE (name);


--
-- Name: uk_a9y1qk5x0rda3e9cjhmslcpye; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_attachment
    ADD CONSTRAINT uk_a9y1qk5x0rda3e9cjhmslcpye UNIQUE (attachment_id);


--
-- Name: uk_aawdkts2sf78754bwtou0o1h7; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY routines
    ADD CONSTRAINT uk_aawdkts2sf78754bwtou0o1h7 UNIQUE (code);


--
-- Name: uk_c3gq4f00jhl6txsg9a7csuw22; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY comment_attachment
    ADD CONSTRAINT uk_c3gq4f00jhl6txsg9a7csuw22 UNIQUE (attachment_id);


--
-- Name: uk_dup3cvd32cho3gyk856mb84gg; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY exception_notification
    ADD CONSTRAINT uk_dup3cvd32cho3gyk856mb84gg UNIQUE (user_id);


--
-- Name: uk_dyoyhpdk2kej18eodwgr0gv8k; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY standards
    ADD CONSTRAINT uk_dyoyhpdk2kej18eodwgr0gv8k UNIQUE (code);


--
-- Name: uk_e6cf0lv6p03mexusakgr5s134; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT uk_e6cf0lv6p03mexusakgr5s134 UNIQUE (name);


--
-- Name: uk_i4hmqa2ycp02e85ty2pasvo6a; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT uk_i4hmqa2ycp02e85ty2pasvo6a UNIQUE (person_id);


--
-- Name: uk_jdtmi5l77lff56354dsibo0j3; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_roster_id
    ADD CONSTRAINT uk_jdtmi5l77lff56354dsibo0j3 UNIQUE (propertyvalues_id);


--
-- Name: uk_jkoqfvhsjdio2rvqsbdxl15g2; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT uk_jkoqfvhsjdio2rvqsbdxl15g2 UNIQUE (code);


--
-- Name: uk_knrgyqfl8woj0jvet6rauqc2q; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_template
    ADD CONSTRAINT uk_knrgyqfl8woj0jvet6rauqc2q UNIQUE (code);


--
-- Name: uk_l2ox2d0jlxgin5nc2175u9fse; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY file_permissions
    ADD CONSTRAINT uk_l2ox2d0jlxgin5nc2175u9fse UNIQUE (original_name);


--
-- Name: uk_lm6lvd3f8rl2wxhhnjd9ob5ny; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_categories
    ADD CONSTRAINT uk_lm6lvd3f8rl2wxhhnjd9ob5ny UNIQUE (code);


--
-- Name: uk_m8h2rpmc027fivoaipmy2vtuw; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY tracking_categories
    ADD CONSTRAINT uk_m8h2rpmc027fivoaipmy2vtuw UNIQUE (name);


--
-- Name: uk_ms6tsxclfg6nhdtubb3ll1vro; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY main_exception
    ADD CONSTRAINT uk_ms6tsxclfg6nhdtubb3ll1vro UNIQUE (exceptionid);


--
-- Name: uk_ncoa9bfasrql0x4nhmh1plxxy; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_ncoa9bfasrql0x4nhmh1plxxy UNIQUE (email);


--
-- Name: uk_ovvvp79dq21byf7svnuekb6iw; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT uk_ovvvp79dq21byf7svnuekb6iw UNIQUE (employee_id);


--
-- Name: uk_qhb8iy3pcvcrf2bnsubpo792k; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY basis_types
    ADD CONSTRAINT uk_qhb8iy3pcvcrf2bnsubpo792k UNIQUE (info);


--
-- Name: uk_rqyy49rlp80hltxb06p59s7e0; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY file_uploadby_supplier
    ADD CONSTRAINT uk_rqyy49rlp80hltxb06p59s7e0 UNIQUE (token);


--
-- Name: uk_s3ecnj82ac0dkfrd89ssc9hi1; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY task_template
    ADD CONSTRAINT uk_s3ecnj82ac0dkfrd89ssc9hi1 UNIQUE (code, task_category_id);


--
-- Name: ukihrng98psy3owu33hsssfth12; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT ukihrng98psy3owu33hsssfth12 UNIQUE (employee_id, person_id);


--
-- Name: user_custom_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY user_custom_permissions
    ADD CONSTRAINT user_custom_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: uuidentity_pkey; Type: CONSTRAINT; Schema: public; Owner: zainul; Tablespace: 
--

ALTER TABLE ONLY uuidentity
    ADD CONSTRAINT uuidentity_pkey PRIMARY KEY (id);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_j_g ON qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_jg ON qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_t_g ON qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_tg ON qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_j_grp ON qrtz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_j_req_recovery ON qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_c ON qrtz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_g ON qrtz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_j ON qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_jg ON qrtz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_n_g_state ON qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_n_state ON qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_next_fire_time ON qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_nft_misfire ON qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_nft_st ON qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: public; Owner: zainul; Tablespace: 
--

CREATE INDEX idx_qrtz_t_state ON qrtz_triggers USING btree (sched_name, trigger_state);


--
-- Name: fk14s84ilv1xkdc4r83487sndqb; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT fk14s84ilv1xkdc4r83487sndqb FOREIGN KEY (person_id) REFERENCES persons(id);


--
-- Name: fk1b63qab88c2fchx7iw6r1vh0l; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk1b63qab88c2fchx7iw6r1vh0l FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: fk1teq47n9uufm9wevq2ktv1wq6; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_attachment
    ADD CONSTRAINT fk1teq47n9uufm9wevq2ktv1wq6 FOREIGN KEY (attachment_id) REFERENCES attachments(id);


--
-- Name: fk1urgu1tg68kjfxm6v7pcmv7e0; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY role_permissions
    ADD CONSTRAINT fk1urgu1tg68kjfxm6v7pcmv7e0 FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: fk22g6wec0neoycxd7vekmffm92; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk22g6wec0neoycxd7vekmffm92 FOREIGN KEY (sender) REFERENCES users(id);


--
-- Name: fk27gyejbpd86fq24pspqhnut7x; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_standards
    ADD CONSTRAINT fk27gyejbpd86fq24pspqhnut7x FOREIGN KEY (task_id) REFERENCES task(id);


--
-- Name: fk2hkxcmk1yi9em1x702hicbv6t; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_standards
    ADD CONSTRAINT fk2hkxcmk1yi9em1x702hicbv6t FOREIGN KEY (standards_id) REFERENCES standards(id);


--
-- Name: fk31f1j0pgi7y20n4f9hbce6kjf; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project
    ADD CONSTRAINT fk31f1j0pgi7y20n4f9hbce6kjf FOREIGN KEY (auditor_id) REFERENCES users(id);


--
-- Name: fk3l9r6psj76u8vu1et2rm2gbwg; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk3l9r6psj76u8vu1et2rm2gbwg FOREIGN KEY (creator_id) REFERENCES users(id);


--
-- Name: fk3lqrj604tsd59n9pk1g5fnwfh; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT fk3lqrj604tsd59n9pk1g5fnwfh FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk3qlrj120vjisicmffs5ftnr89; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY property_values_check_box_property_options
    ADD CONSTRAINT fk3qlrj120vjisicmffs5ftnr89 FOREIGN KEY (checkboxpropertyvalue_id) REFERENCES property_values(id);


--
-- Name: fk3ups0qnywak7687xdnqjtpi70; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY rosters
    ADD CONSTRAINT fk3ups0qnywak7687xdnqjtpi70 FOREIGN KEY (reference_rooster_id) REFERENCES rosters(id);


--
-- Name: fk3w5cusw7wuuqt36w2fhb9el2v; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_positions
    ADD CONSTRAINT fk3w5cusw7wuuqt36w2fhb9el2v FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: fk4g5s23w1bmct23e0wnq5h7brp; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY organisation_settings
    ADD CONSTRAINT fk4g5s23w1bmct23e0wnq5h7brp FOREIGN KEY (timesheet_category_id) REFERENCES tracking_categories(id);


--
-- Name: fk4pd5cv6wf6gx9igiyf0trbi2a; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY exception_attachment
    ADD CONSTRAINT fk4pd5cv6wf6gx9igiyf0trbi2a FOREIGN KEY (attachment_id) REFERENCES attachments(id);


--
-- Name: fk56st6wftfc8rj93a6sv6qddx5; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY comment_attachment
    ADD CONSTRAINT fk56st6wftfc8rj93a6sv6qddx5 FOREIGN KEY (comment_id) REFERENCES comments(id);


--
-- Name: fk5cieaix8mw1xo4fojn6j4e0qf; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY item_details
    ADD CONSTRAINT fk5cieaix8mw1xo4fojn6j4e0qf FOREIGN KEY (supplier_id) REFERENCES contacts(id);


--
-- Name: fk5ei97dkbaopl66wle5aindp6q; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT fk5ei97dkbaopl66wle5aindp6q FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk5icvrdom7s72kk5dyjgq4hrf9; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_assignees_bulk_edit
    ADD CONSTRAINT fk5icvrdom7s72kk5dyjgq4hrf9 FOREIGN KEY (assignees_id) REFERENCES users(id);


--
-- Name: fk5nosbslncrbn2tihhyms2p1sm; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk5nosbslncrbn2tihhyms2p1sm FOREIGN KEY (exception_reported_by) REFERENCES users(id);


--
-- Name: fk5nqu6cmq0gvcy3h2bc2l4mi3f; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_assigned_to_bulk_edit
    ADD CONSTRAINT fk5nqu6cmq0gvcy3h2bc2l4mi3f FOREIGN KEY (assignees_id) REFERENCES users(id);


--
-- Name: fk5vya97rsaoyuxhq57vhe4qcx0; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY stake_holders
    ADD CONSTRAINT fk5vya97rsaoyuxhq57vhe4qcx0 FOREIGN KEY (person_id) REFERENCES persons(id);


--
-- Name: fk68h2x4gpqve0fy0mfaxyxy5gc; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk68h2x4gpqve0fy0mfaxyxy5gc FOREIGN KEY (standard_id) REFERENCES standards(id);


--
-- Name: fk6bq51sfpotf0rcscacadf106e; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_template
    ADD CONSTRAINT fk6bq51sfpotf0rcscacadf106e FOREIGN KEY (task_category_id) REFERENCES task_categories(id);


--
-- Name: fk6ib58y346n6uy3k5o39hq73qx; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY approval_setting_details
    ADD CONSTRAINT fk6ib58y346n6uy3k5o39hq73qx FOREIGN KEY (position_id) REFERENCES positions(id);


--
-- Name: fk75gyqt4ibmvwi7pihrb3lae2s; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT fk75gyqt4ibmvwi7pihrb3lae2s FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- Name: fk7eipquc44qdx807p3nqsmxc1; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project_has_standards
    ADD CONSTRAINT fk7eipquc44qdx807p3nqsmxc1 FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: fk7ogt6iod36rq96toeraavbgk2; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_bank_accounts
    ADD CONSTRAINT fk7ogt6iod36rq96toeraavbgk2 FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: fk8ewvxq38t4wellbo25mtgseji; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_assignees_bulk_edit
    ADD CONSTRAINT fk8ewvxq38t4wellbo25mtgseji FOREIGN KEY (task_id) REFERENCES task_bulk_edit(id);


--
-- Name: fk8m7pr68yx1ubkql6jiibch8f9; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY supplier_type_position
    ADD CONSTRAINT fk8m7pr68yx1ubkql6jiibch8f9 FOREIGN KEY (supplier_type_id) REFERENCES supplier_types(id);


--
-- Name: fk8pd4yx1jayc8gvd9romv43fnd; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_file_permissions
    ADD CONSTRAINT fk8pd4yx1jayc8gvd9romv43fnd FOREIGN KEY (file_permission_id) REFERENCES file_permissions(id);


--
-- Name: fk8ror0ivj0pt7fjj6kewavdf7u; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tracking_category_options
    ADD CONSTRAINT fk8ror0ivj0pt7fjj6kewavdf7u FOREIGN KEY (tracking_category_id) REFERENCES tracking_categories(id);


--
-- Name: fk8uhat3hxbads92l15r64wmqmf; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk8uhat3hxbads92l15r64wmqmf FOREIGN KEY (updater_id) REFERENCES users(id);


--
-- Name: fk993oite7i7rpbndysk8co5co5; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk993oite7i7rpbndysk8co5co5 FOREIGN KEY (task_reactive_detail_id) REFERENCES task_reactive_details(id);


--
-- Name: fk9at0ei37rls7vd2m6sh92668h; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project_users
    ADD CONSTRAINT fk9at0ei37rls7vd2m6sh92668h FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: fk9i6na4cqql948q46yvsw51kb7; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project
    ADD CONSTRAINT fk9i6na4cqql948q46yvsw51kb7 FOREIGN KEY (project_audit_id) REFERENCES project(id);


--
-- Name: fk9oplchgqt6h7cq4gdag6eisno; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_reactive_details
    ADD CONSTRAINT fk9oplchgqt6h7cq4gdag6eisno FOREIGN KEY (asset_id) REFERENCES assets(id);


--
-- Name: fk9r46utvfqpau3tky79syd8cx6; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk9r46utvfqpau3tky79syd8cx6 FOREIGN KEY (document_type_id) REFERENCES document_options(id);


--
-- Name: fk9y0vcrn4fo6wjra9eiwkl0y9j; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_positions
    ADD CONSTRAINT fk9y0vcrn4fo6wjra9eiwkl0y9j FOREIGN KEY (position_id) REFERENCES positions(id);


--
-- Name: fka050x5p6ktskyw7pl59ou4bv3; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY payroll_calendars
    ADD CONSTRAINT fka050x5p6ktskyw7pl59ou4bv3 FOREIGN KEY (calendar_type_id) REFERENCES calendar_types(id);


--
-- Name: fka055tq3g5bphxmxduyooljbo2; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY roster_histories
    ADD CONSTRAINT fka055tq3g5bphxmxduyooljbo2 FOREIGN KEY (receiver_id) REFERENCES employees(id);


--
-- Name: fkad4j11h6xgx5rls3dehtjqwge; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY routine_tasks
    ADD CONSTRAINT fkad4j11h6xgx5rls3dehtjqwge FOREIGN KEY (routine_task_id) REFERENCES routines(id);


--
-- Name: fkb27hxylpq80jsty8a975fy6we; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY rosters
    ADD CONSTRAINT fkb27hxylpq80jsty8a975fy6we FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: fkbknspdp53crjnjdubdfxs2kn9; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_rosters
    ADD CONSTRAINT fkbknspdp53crjnjdubdfxs2kn9 FOREIGN KEY (roster_id) REFERENCES rosters(id);


--
-- Name: fkblno6667xm9kjye3sllhub6kx; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY approval_setting_details
    ADD CONSTRAINT fkblno6667xm9kjye3sllhub6kx FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: fkbmlc9l44pdgsf6id99hh1lxyo; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkbmlc9l44pdgsf6id99hh1lxyo FOREIGN KEY (auditor_id) REFERENCES users(id);


--
-- Name: fkbxxc7tq9a03t3gf8nkl1c089h; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_selecteddays
    ADD CONSTRAINT fkbxxc7tq9a03t3gf8nkl1c089h FOREIGN KEY (task_id) REFERENCES task(id);


--
-- Name: fkbyqfdc5w7f3r0bneibtggeqc; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_assigned_to_bulk_edit
    ADD CONSTRAINT fkbyqfdc5w7f3r0bneibtggeqc FOREIGN KEY (task_id) REFERENCES task_bulk_edit(id);


--
-- Name: fkco0rokv14k2co5l35s3ov9sq0; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fkco0rokv14k2co5l35s3ov9sq0 FOREIGN KEY (report_manager_id) REFERENCES employees(id);


--
-- Name: fkcogjq1smjy03v5s2wfegritx6; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fkcogjq1smjy03v5s2wfegritx6 FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: fkd4fhg8s6nqhss3ac4ws9wv2mt; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_file_permissions
    ADD CONSTRAINT fkd4fhg8s6nqhss3ac4ws9wv2mt FOREIGN KEY (file_id) REFERENCES files(id);


--
-- Name: fkd953k7uvw584rjjc9id3y5ebi; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkd953k7uvw584rjjc9id3y5ebi FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fkddv1870saxvixb08l56cb8rq5; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY file_approver
    ADD CONSTRAINT fkddv1870saxvixb08l56cb8rq5 FOREIGN KEY (approver_id) REFERENCES employees(id);


--
-- Name: fkdfuymsg5cbqxsejat3ke4wd32; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY message_recipients
    ADD CONSTRAINT fkdfuymsg5cbqxsejat3ke4wd32 FOREIGN KEY (message_id) REFERENCES messages(message_id);


--
-- Name: fkdj7m0v75y7yh20svdqct3bxvi; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tasklist
    ADD CONSTRAINT fkdj7m0v75y7yh20svdqct3bxvi FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: fkdq7y0xevtapf8asld45qsolk2; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fkdq7y0xevtapf8asld45qsolk2 FOREIGN KEY (reply_from) REFERENCES messages(message_id);


--
-- Name: fkdrjpfaxwb3x4715n9ef12fdy9; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY approval_setting_details
    ADD CONSTRAINT fkdrjpfaxwb3x4715n9ef12fdy9 FOREIGN KEY (approval_setting_id) REFERENCES approval_settings(id);


--
-- Name: fkeglei85b6f808i9niej5ouad; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkeglei85b6f808i9niej5ouad FOREIGN KEY (completed_by) REFERENCES users(id);


--
-- Name: fkeppc5xwrid9he8tcx7pe0mpwf; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY audit_exceptions
    ADD CONSTRAINT fkeppc5xwrid9he8tcx7pe0mpwf FOREIGN KEY (master_exception_detail_id) REFERENCES master_exception_detail(id);


--
-- Name: fkevnjj2l4hfsrw2k48066e36jt; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fkevnjj2l4hfsrw2k48066e36jt FOREIGN KEY (payroll_calendar_id) REFERENCES payroll_calendars(id);


--
-- Name: fkfnqmn1jgaohh9sk46ikdb2be0; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY links
    ADD CONSTRAINT fkfnqmn1jgaohh9sk46ikdb2be0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fkfoh9ov19dikjip3ydoaxkeb4e; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fkfoh9ov19dikjip3ydoaxkeb4e FOREIGN KEY (document_category_id) REFERENCES document_options(id);


--
-- Name: fkfq1f4mivfo77e0xy2ipcv4raa; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_assignees
    ADD CONSTRAINT fkfq1f4mivfo77e0xy2ipcv4raa FOREIGN KEY (assignees_id) REFERENCES users(id);


--
-- Name: fkg23g2tx1clsx44eqyg4exbicn; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY file_trigger_schedule
    ADD CONSTRAINT fkg23g2tx1clsx44eqyg4exbicn FOREIGN KEY (file_id) REFERENCES files(id);


--
-- Name: fkgblpqn6qnopro3e44r3qpo7jd; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY message_recipients
    ADD CONSTRAINT fkgblpqn6qnopro3e44r3qpo7jd FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fkggyajqcmx4bhntd6mjehkowc4; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY supplier_type_position
    ADD CONSTRAINT fkggyajqcmx4bhntd6mjehkowc4 FOREIGN KEY (position_id) REFERENCES positions(id);


--
-- Name: fkgk85su7c81odmjo0xxvt9w85d; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fkgk85su7c81odmjo0xxvt9w85d FOREIGN KEY (tax_declaration_id) REFERENCES tax_declarations(id);


--
-- Name: fkgmjtffnlilatdequ6eqfsbusw; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_bulk_edit
    ADD CONSTRAINT fkgmjtffnlilatdequ6eqfsbusw FOREIGN KEY (tasklist_id) REFERENCES tasklist(id);


--
-- Name: fkh28gmapogt8p6nrp8f7herggc; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY location_path
    ADD CONSTRAINT fkh28gmapogt8p6nrp8f7herggc FOREIGN KEY (descendant) REFERENCES locations(id);


--
-- Name: fkh50cckwnb0mfs2srj1jhvksmx; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fkh50cckwnb0mfs2srj1jhvksmx FOREIGN KEY (approver_id) REFERENCES employees(id);


--
-- Name: fkh5mjg4cpu0m79x2xjl2l2k8ih; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project
    ADD CONSTRAINT fkh5mjg4cpu0m79x2xjl2l2k8ih FOREIGN KEY (creator_id) REFERENCES users(id);


--
-- Name: fkhggyao1p4s4k8v647vvhfigvv; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project_has_standards
    ADD CONSTRAINT fkhggyao1p4s4k8v647vvhfigvv FOREIGN KEY (standards_id) REFERENCES standards(id);


--
-- Name: fkhjdkpuoptx1cd04r3atchkpi0; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT fkhjdkpuoptx1cd04r3atchkpi0 FOREIGN KEY (parent_id) REFERENCES locations(id);


--
-- Name: fki6a99dkw74rehoh3n385y8qqi; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY master_exception_detail
    ADD CONSTRAINT fki6a99dkw74rehoh3n385y8qqi FOREIGN KEY (master_exception_id) REFERENCES master_exception(id);


--
-- Name: fkirh0a5q2en4gkbayqhgfiwhs; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fkirh0a5q2en4gkbayqhgfiwhs FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fkja5i1vdiw6jmv6pno39qlr6od; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fkja5i1vdiw6jmv6pno39qlr6od FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fkk3h2o6pdccmd1f3mfl39k6of9; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT fkk3h2o6pdccmd1f3mfl39k6of9 FOREIGN KEY (next_of_kin_id) REFERENCES persons(id);


--
-- Name: fkk86ahc9xs3ip0p4nuv35ytvbl; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY audit_trails
    ADD CONSTRAINT fkk86ahc9xs3ip0p4nuv35ytvbl FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fkk8qrwowg31kx7hp93sru1pdqa; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkk8qrwowg31kx7hp93sru1pdqa FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: fkkf9b4oemnd8kkm32mvvioudvh; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY exception_attachment
    ADD CONSTRAINT fkkf9b4oemnd8kkm32mvvioudvh FOREIGN KEY (main_exception_id) REFERENCES main_exception(id);


--
-- Name: fkkhw6fprv9kv6uio43mem40px6; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_attachment
    ADD CONSTRAINT fkkhw6fprv9kv6uio43mem40px6 FOREIGN KEY (task_id) REFERENCES task(id);


--
-- Name: fkl016oji270y8uwhq3osrpbvv9; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY roster_histories
    ADD CONSTRAINT fkl016oji270y8uwhq3osrpbvv9 FOREIGN KEY (creator_action_id) REFERENCES employees(id);


--
-- Name: fkl2aoj1uuehy3a2yfhppxx0p4w; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY role_permissions
    ADD CONSTRAINT fkl2aoj1uuehy3a2yfhppxx0p4w FOREIGN KEY (id_permission) REFERENCES permissions(id);


--
-- Name: fkl5d780d6osk6sc6agwefvk28u; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fkl5d780d6osk6sc6agwefvk28u FOREIGN KEY (contact_id) REFERENCES contacts(id);


--
-- Name: fklh19taukb6x5sosfghsv6ki9a; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tasklist
    ADD CONSTRAINT fklh19taukb6x5sosfghsv6ki9a FOREIGN KEY (creator_id) REFERENCES users(id);


--
-- Name: fklhu8ulj8x48x879akqp5jj8w2; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_rosters
    ADD CONSTRAINT fklhu8ulj8x48x879akqp5jj8w2 FOREIGN KEY (routine_task_id) REFERENCES routine_tasks(id);


--
-- Name: fklo9wc4xupea23pl4q0t9rrepc; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY residents
    ADD CONSTRAINT fklo9wc4xupea23pl4q0t9rrepc FOREIGN KEY (person_id) REFERENCES persons(id);


--
-- Name: fkm2brt14r48ifio56d8qdvuv7e; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkm2brt14r48ifio56d8qdvuv7e FOREIGN KEY (assigned_by) REFERENCES users(id);


--
-- Name: fkm4x6sjcie5d4niyippcrpdyj8; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY rosters
    ADD CONSTRAINT fkm4x6sjcie5d4niyippcrpdyj8 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fkm5idjouyrpyfvodflybkva8yn; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY roster_histories
    ADD CONSTRAINT fkm5idjouyrpyfvodflybkva8yn FOREIGN KEY (roster_id) REFERENCES rosters(id);


--
-- Name: fkm6bflm2iwtf1xlitkehmsa62w; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fkm6bflm2iwtf1xlitkehmsa62w FOREIGN KEY (earning_rate_id) REFERENCES earning_rates(id);


--
-- Name: fkmbb4w7lxqxpy48e49lvs2hgk2; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY user_custom_permissions
    ADD CONSTRAINT fkmbb4w7lxqxpy48e49lvs2hgk2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fkmj3b4nurqbbqk8mcjrng2p3mq; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY comment_attachment
    ADD CONSTRAINT fkmj3b4nurqbbqk8mcjrng2p3mq FOREIGN KEY (attachment_id) REFERENCES attachments(id);


--
-- Name: fkmyqmrtfqr5800u7ousxunolbq; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkmyqmrtfqr5800u7ousxunolbq FOREIGN KEY (tasklist_id) REFERENCES tasklist(id);


--
-- Name: fkn09mo98faf6ame6ig0mig6tt6; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY audit_exceptions
    ADD CONSTRAINT fkn09mo98faf6ame6ig0mig6tt6 FOREIGN KEY (task_id) REFERENCES task(id);


--
-- Name: fkn4rif8xqtx11nw7wrdv5jlorg; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY routine_tasks
    ADD CONSTRAINT fkn4rif8xqtx11nw7wrdv5jlorg FOREIGN KEY (task_template_id) REFERENCES task_template(id);


--
-- Name: fknbc1orhlywovocauqognbhauu; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY notification_recipient
    ADD CONSTRAINT fknbc1orhlywovocauqognbhauu FOREIGN KEY (recipient_id) REFERENCES users(id);


--
-- Name: fknbpp8cm1ox2powlrs1lcah7ae; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY file_approver
    ADD CONSTRAINT fknbpp8cm1ox2powlrs1lcah7ae FOREIGN KEY (file_id) REFERENCES files(id);


--
-- Name: fknbr3ywibu6ds82vkx3fck5gbk; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY routine_tasks
    ADD CONSTRAINT fknbr3ywibu6ds82vkx3fck5gbk FOREIGN KEY (routine_id) REFERENCES routines(id);


--
-- Name: fknr67dkiriqucrshybk7in7v5o; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fknr67dkiriqucrshybk7in7v5o FOREIGN KEY (person_id) REFERENCES persons(id);


--
-- Name: fknurqttbytrn9l3odvf8wdr3n7; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_roster_id
    ADD CONSTRAINT fknurqttbytrn9l3odvf8wdr3n7 FOREIGN KEY (propertyvalues_id) REFERENCES property_values(id);


--
-- Name: fko1mpbmu0i0rng0ppb093gl1hn; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY exception_notification
    ADD CONSTRAINT fko1mpbmu0i0rng0ppb093gl1hn FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fko4yer4djkjpmp3hrghfn0hh9; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_assignees
    ADD CONSTRAINT fko4yer4djkjpmp3hrghfn0hh9 FOREIGN KEY (task_id) REFERENCES task(id);


--
-- Name: fkod6hlifk8o6a98itgaa80ry8s; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY main_exception
    ADD CONSTRAINT fkod6hlifk8o6a98itgaa80ry8s FOREIGN KEY (exception_type) REFERENCES master_exception_detail(id);


--
-- Name: fkp0q00mcj77itt1ur4082aisd1; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task_roster_id
    ADD CONSTRAINT fkp0q00mcj77itt1ur4082aisd1 FOREIGN KEY (taskroster_id) REFERENCES task_rosters(id);


--
-- Name: fkp5uexsceckxs55if3d83irdyx; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY user_custom_permissions
    ADD CONSTRAINT fkp5uexsceckxs55if3d83irdyx FOREIGN KEY (id_permission) REFERENCES permissions(id);


--
-- Name: fkpcx9ympa3mac58nd4mmjf811h; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY file_tags
    ADD CONSTRAINT fkpcx9ympa3mac58nd4mmjf811h FOREIGN KEY (file_id) REFERENCES files(id);


--
-- Name: fkpiy9soyhjyndvvggn027jsclu; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY file_tags
    ADD CONSTRAINT fkpiy9soyhjyndvvggn027jsclu FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: fkpkn1sme2w5h5drfk7bo36u51g; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY approval_settings
    ADD CONSTRAINT fkpkn1sme2w5h5drfk7bo36u51g FOREIGN KEY (resource_api) REFERENCES resource_api(id);


--
-- Name: fkpvbpu4yqph67p9olsfp0xpy4h; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkpvbpu4yqph67p9olsfp0xpy4h FOREIGN KEY (repeat_from_task_id) REFERENCES task(id);


--
-- Name: fkqiew86htqm2rkodu0u7vnpefl; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fkqiew86htqm2rkodu0u7vnpefl FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fkqqsuvcyjf55s40oyrp0uxa4fk; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT fkqqsuvcyjf55s40oyrp0uxa4fk FOREIGN KEY (supplier_type_id) REFERENCES supplier_types(id);


--
-- Name: fkqwx7777plhrm4v4om71lbe1np; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY rosters
    ADD CONSTRAINT fkqwx7777plhrm4v4om71lbe1np FOREIGN KEY (manager_id) REFERENCES employees(id);


--
-- Name: fkqxs9fnf0nvg4pou1gng0jtom4; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkqxs9fnf0nvg4pou1gng0jtom4 FOREIGN KEY (parent_task_id) REFERENCES task(id) ON DELETE CASCADE;


--
-- Name: fkr142q4vsdbhjqli9oc5s2u5cx; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY property_values_check_box_property_options
    ADD CONSTRAINT fkr142q4vsdbhjqli9oc5s2u5cx FOREIGN KEY (value_id) REFERENCES check_box_property_options(id);


--
-- Name: fkr2j9eraq74pk0xk8jpjd5d66a; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project
    ADD CONSTRAINT fkr2j9eraq74pk0xk8jpjd5d66a FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fkrlryscvlq1h678oyxcb04xywp; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY notification_recipient
    ADD CONSTRAINT fkrlryscvlq1h678oyxcb04xywp FOREIGN KEY (notification_id) REFERENCES notifications(id);


--
-- Name: fkrmcs5ml5mlq7mnfxxgt3vw1yf; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fkrmcs5ml5mlq7mnfxxgt3vw1yf FOREIGN KEY (parent_revision_id) REFERENCES files(id);


--
-- Name: fkrro9dj5biq8jobb8lg3sau5k1; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT fkrro9dj5biq8jobb8lg3sau5k1 FOREIGN KEY (position_id) REFERENCES task_template(id);


--
-- Name: fkrsn6fj6f7ylua6ou1pjagehot; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY master_exception
    ADD CONSTRAINT fkrsn6fj6f7ylua6ou1pjagehot FOREIGN KEY (position_id) REFERENCES positions(id);


--
-- Name: fkrsr01fs4mldjbftwobky85yoy; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY employee_file_permissions
    ADD CONSTRAINT fkrsr01fs4mldjbftwobky85yoy FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- Name: fkrtsglo7yweshsib2me4ql6owv; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fkrtsglo7yweshsib2me4ql6owv FOREIGN KEY (asset_id) REFERENCES assets(id);


--
-- Name: fks7s7el4br7j8w4a2oauslmi5i; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY detail_lookups
    ADD CONSTRAINT fks7s7el4br7j8w4a2oauslmi5i FOREIGN KEY (master_lookup_id) REFERENCES master_lookups(id);


--
-- Name: fksbt6g34fli94pydljgrhmwe72; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fksbt6g34fli94pydljgrhmwe72 FOREIGN KEY (sender) REFERENCES users(id);


--
-- Name: fksbxwx1hflvxfnm98xd9wqx12v; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY item_details
    ADD CONSTRAINT fksbxwx1hflvxfnm98xd9wqx12v FOREIGN KEY (task_reactive_detail_id) REFERENCES task_reactive_details(id);


--
-- Name: fkshx8hd6a8ofear0q4su5uhlss; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY location_path
    ADD CONSTRAINT fkshx8hd6a8ofear0q4su5uhlss FOREIGN KEY (ancestor) REFERENCES locations(id);


--
-- Name: fktglir2k3n8wh3qdswyabsu66n; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT fktglir2k3n8wh3qdswyabsu66n FOREIGN KEY (parent_level_id) REFERENCES positions(id);


--
-- Name: fkthd5v8c0jh0gpqyr1mo0vhnn7; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY tasklist
    ADD CONSTRAINT fkthd5v8c0jh0gpqyr1mo0vhnn7 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fkutwqpwg089u7ocgbn3tl2jhj; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY project_users
    ADD CONSTRAINT fkutwqpwg089u7ocgbn3tl2jhj FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: qrtz_blob_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_cron_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simple_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zainul
--

ALTER TABLE ONLY qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES qrtz_job_details(sched_name, job_name, job_group);


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

