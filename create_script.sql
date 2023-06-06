/*

Moutsiounas Panagiotis AEM 153
Project on Advanced Topics in Databases.
Spatial Database : US Mapping
Developed on PostgreSQL 15 with the help of POSTGIS for spatial entities and pgAdmin 4 gui system.

*/

-- Database: moutsiounas_panagiotis_spatial_db

-- DROP DATABASE IF EXISTS moutsiounas_panagiotis_spatial_db;

CREATE DATABASE moutsiounas_panagiotis_spatial_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	

--import spatial functions

CREATE EXTENSION postgis;	

-- schema creation

-- SCHEMA: Spatial_US_Mapping

-- DROP SCHEMA IF EXISTS "Spatial_US_Mapping" ;

CREATE SCHEMA IF NOT EXISTS "Spatial_US_Mapping"
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA "Spatial_US_Mapping" TO postgres;

-- table creation

-- Table: Spatial_US_Mapping.CongressionalDistricts

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."CongressionalDistricts";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."CongressionalDistricts"
(
    gid integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."CongressionalDistricts_gid_seq"'::regclass)',
    statefp character varying(5) COLLATE pg_catalog."default",
    cd116fp character varying(5) COLLATE pg_catalog."default",
    geoid character varying(9) COLLATE pg_catalog."default",
    namelsad character varying(83) COLLATE pg_catalog."default",
    lsad character varying(5) COLLATE pg_catalog."default",
    cdsessn character varying(7) COLLATE pg_catalog."default",
    mtfcc character varying(11) COLLATE pg_catalog."default",
    funcstat character varying(3) COLLATE pg_catalog."default",
    aland double precision,
    awater double precision,
    intptlon character varying(25) COLLATE pg_catalog."default",
    intptlat character varying(23) COLLATE pg_catalog."default",
    geom "Spatial_US_Mapping".geometry,
    countiesandequivalentgid integer,
    urbanareasgid integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."CongressionalDistricts"
    OWNER to postgres;

-- Table: Spatial_US_Mapping.CountiesAndEquivalent

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent"
(
    gid integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."CountiesAndEquivalent_gid_seq"'::regclass)',
    statefp character varying(5) COLLATE pg_catalog."default",
    countyfp character varying(7) COLLATE pg_catalog."default",
    countyns character varying(17) COLLATE pg_catalog."default",
    geoid character varying(11) COLLATE pg_catalog."default",
    name character varying(201) COLLATE pg_catalog."default",
    namelsad character varying(201) COLLATE pg_catalog."default",
    lsad character varying(5) COLLATE pg_catalog."default",
    classfp character varying(5) COLLATE pg_catalog."default",
    mtfcc character varying(11) COLLATE pg_catalog."default",
    csafp character varying(7) COLLATE pg_catalog."default",
    cbsafp character varying(11) COLLATE pg_catalog."default",
    metdivfp character varying(11) COLLATE pg_catalog."default",
    funcstat character varying(3) COLLATE pg_catalog."default",
    aland double precision,
    awater double precision,
    intptlat character varying(23) COLLATE pg_catalog."default",
    intptlon character varying(25) COLLATE pg_catalog."default",
    geom "Spatial_US_Mapping".geometry,
    us_state_vehiclevehicle_id integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent"
    OWNER to postgres;
	
-- Table: Spatial_US_Mapping.PrimaryRoads

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."PrimaryRoads";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."PrimaryRoads"
(
    gid integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."PrimaryRoads_gid_seq"'::regclass)',
    linearid character varying(45) COLLATE pg_catalog."default",
    fullname character varying(201) COLLATE pg_catalog."default",
    rttyp character varying(3) COLLATE pg_catalog."default",
    mtfcc character varying(11) COLLATE pg_catalog."default",
    geom "Spatial_US_Mapping".geometry
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."PrimaryRoads"
    OWNER to postgres;
	
-- Table: Spatial_US_Mapping.Rails

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."Rails";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."Rails"
(
    gid integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."Rails_gid_seq"'::regclass)',
    linearid character varying(45) COLLATE pg_catalog."default",
    fullname character varying(201) COLLATE pg_catalog."default",
    mtfcc character varying(11) COLLATE pg_catalog."default",
    geom "Spatial_US_Mapping".geometry
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."Rails"
    OWNER to postgres;
	
-- Table: Spatial_US_Mapping.UrbanAreas

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."UrbanAreas";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."UrbanAreas"
(
    gid integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."UrbanAreas_gid_seq"'::regclass)',
    uace character varying(11) COLLATE pg_catalog."default",
    geoid character varying(11) COLLATE pg_catalog."default",
    name character varying(201) COLLATE pg_catalog."default",
    namelsad character varying(210) COLLATE pg_catalog."default",
    lsad character varying(5) COLLATE pg_catalog."default",
    mtfcc character varying(11) COLLATE pg_catalog."default",
    uatyp character varying(3) COLLATE pg_catalog."default",
    funcstat character varying(3) COLLATE pg_catalog."default",
    aland double precision,
    awater double precision,
    intptlat character varying(23) COLLATE pg_catalog."default",
    intptlon character varying(25) COLLATE pg_catalog."default",
    geom "Spatial_US_Mapping".geometry,
    us_state_vehiclevehicle_id integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."UrbanAreas"
    OWNER to postgres;
	
-- Table: Spatial_US_Mapping.Maintenance

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."Maintenance";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."Maintenance"
(
    maintenance_id integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."Maintenance_maintenance_id_seq"'::regclass)',
    type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    location character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "time" time(6) without time zone NOT NULL,
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    primaryroadsgid integer,
    railsgid integer,
    us_state_vehiclevehicle_id integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."Maintenance"
    OWNER to postgres;	
	
-- Table: Spatial_US_Mapping.Traffic_Incidents

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."Traffic_Incidents";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."Traffic_Incidents"
(
    incident_id integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."Traffic_Incidents_incident_id_seq"'::regclass)',
    type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    location character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "time" time(6) without time zone NOT NULL,
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    primaryroadsgid integer,
    railsgid integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."Traffic_Incidents"
    OWNER to postgres;
-- Index: Traffic_Incidents_incident_id

-- DROP INDEX IF EXISTS "Spatial_US_Mapping"."Traffic_Incidents_incident_id";

CREATE UNIQUE INDEX IF NOT EXISTS "Traffic_Incidents_incident_id"
    ON "Spatial_US_Mapping"."Traffic_Incidents" USING btree
    (incident_id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: Spatial_US_Mapping.Users

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."Users";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."Users"
(
    user_id integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."Users_user_id_seq"'::regclass)',
    username character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."Users"
    OWNER to postgres;
-- Index: Users_user_id

-- DROP INDEX IF EXISTS "Spatial_US_Mapping"."Users_user_id";

CREATE UNIQUE INDEX IF NOT EXISTS "Users_user_id"
    ON "Spatial_US_Mapping"."Users" USING btree
    (user_id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: Spatial_US_Mapping.US_State_Vehicle

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."US_State_Vehicle";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."US_State_Vehicle"
(
    vehicle_id integer NOT NULL DEFAULT 'nextval('"Spatial_US_Mapping"."US_State_Vehicle_vehicle_id_seq"'::regclass)',
    make character varying(255) COLLATE pg_catalog."default" NOT NULL,
    model character varying(255) COLLATE pg_catalog."default" NOT NULL,
    year integer NOT NULL,
    fuel_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    emissions_rating character varying(1) COLLATE pg_catalog."default" NOT NULL,
    safety_rating character varying(1) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."US_State_Vehicle"
    OWNER to postgres;
-- Index: US_State_Vehicle_vehicle_id

-- DROP INDEX IF EXISTS "Spatial_US_Mapping"."US_State_Vehicle_vehicle_id";

CREATE UNIQUE INDEX IF NOT EXISTS "US_State_Vehicle_vehicle_id"
    ON "Spatial_US_Mapping"."US_State_Vehicle" USING btree
    (vehicle_id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: Spatial_US_Mapping.CountiesAndEquivalent_PrimaryRoads

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent_PrimaryRoads";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent_PrimaryRoads"
(
    countiesandequivalentgid integer NOT NULL,
    primaryroadsgid integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent_PrimaryRoads"
    OWNER to postgres;

-- Table: Spatial_US_Mapping.CountiesAndEquivalent_Rails

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent_Rails";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent_Rails"
(
    countiesandequivalentgid integer NOT NULL,
    railsgid integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent_Rails"
    OWNER to postgres;

-- Table: Spatial_US_Mapping.Maintenance_Users

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."Maintenance_Users";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."Maintenance_Users"
(
    maintenancemaintenance_id integer NOT NULL,
    usersuser_id integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."Maintenance_Users"
    OWNER to postgres;
	
-- Table: Spatial_US_Mapping.PrimaryRoads_UrbanAreas

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."PrimaryRoads_UrbanAreas";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."PrimaryRoads_UrbanAreas"
(
    primaryroadsgid integer NOT NULL,
    urbanareasgid integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."PrimaryRoads_UrbanAreas"
    OWNER to postgres;
	
-- Table: Spatial_US_Mapping.Rails_UrbanAreas

-- DROP TABLE IF EXISTS "Spatial_US_Mapping"."Rails_UrbanAreas";

CREATE TABLE IF NOT EXISTS "Spatial_US_Mapping"."Rails_UrbanAreas"
(
    railsgid integer NOT NULL,
    urbanareasgid integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "Spatial_US_Mapping"."Rails_UrbanAreas"
    OWNER to postgres;
	
---------------------------------------------------------------
--ALTER TABLES TO ADD CONSTRAINTS AFTER CREATION

ALTER TABLE "Spatial_US_Mapping"."CongressionalDistricts"
ADD CONSTRAINT "CongressionalDistricts_pkey" PRIMARY KEY (gid),
ADD CONSTRAINT belong FOREIGN KEY (countiesandequivalentgid)
        REFERENCES "Spatial_US_Mapping"."CountiesAndEquivalent" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT belong2 FOREIGN KEY (urbanareasgid)
        REFERENCES "Spatial_US_Mapping"."UrbanAreas" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		

ALTER TABLE  "Spatial_US_Mapping"."CountiesAndEquivalent"
ADD CONSTRAINT "CountiesAndEquivalent_pkey" PRIMARY KEY (gid);
		
ALTER TABLE "Spatial_US_Mapping"."PrimaryRoads"
ADD CONSTRAINT "PrimaryRoads_pkey" PRIMARY KEY (gid);

ALTER TABLE "Spatial_US_Mapping"."Rails"
ADD CONSTRAINT "Rails_pkey" PRIMARY KEY (gid);

ALTER TABLE "Spatial_US_Mapping"."UrbanAreas"
ADD CONSTRAINT "UrbanAreas_pkey" PRIMARY KEY (gid);
		
ALTER TABLE "Spatial_US_Mapping"."Maintenance"
ADD CONSTRAINT "Maintenance_pkey" PRIMARY KEY (maintenance_id),
ADD CONSTRAINT occurs FOREIGN KEY (primaryroadsgid)
        REFERENCES "Spatial_US_Mapping"."PrimaryRoads" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT occurs1 FOREIGN KEY (railsgid)
        REFERENCES "Spatial_US_Mapping"."Rails" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT occurs2 FOREIGN KEY (us_state_vehiclevehicle_id)
        REFERENCES "Spatial_US_Mapping"."US_State_Vehicle" (vehicle_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
ALTER TABLE "Spatial_US_Mapping"."Traffic_Incidents"
ADD CONSTRAINT "Traffic_Incidents_pkey" PRIMARY KEY (incident_id),
ADD CONSTRAINT take_place FOREIGN KEY (primaryroadsgid)
        REFERENCES "Spatial_US_Mapping"."PrimaryRoads" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT take_place1 FOREIGN KEY (railsgid)
        REFERENCES "Spatial_US_Mapping"."Rails" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

ALTER TABLE "Spatial_US_Mapping"."Users"
ADD  CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


ALTER TABLE "Spatial_US_Mapping"."US_State_Vehicle"
ADD CONSTRAINT "US_State_Vehicle_pkey" PRIMARY KEY (vehicle_id);

ALTER TABLE "Spatial_US_Mapping"."CountiesAndEquivalent_PrimaryRoads"
ADD CONSTRAINT "CountiesAndEquivalent_PrimaryRoads_pkey" PRIMARY KEY (countiesandequivalentgid, primaryroadsgid),
ADD CONSTRAINT fkcountiesan19476 FOREIGN KEY (primaryroadsgid)
        REFERENCES "Spatial_US_Mapping"."PrimaryRoads" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT fkcountiesan644978 FOREIGN KEY (countiesandequivalentgid)
        REFERENCES "Spatial_US_Mapping"."CountiesAndEquivalent" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
ALTER TABLE "Spatial_US_Mapping"."CountiesAndEquivalent_Rails"
ADD CONSTRAINT "CountiesAndEquivalent_Rails_pkey" PRIMARY KEY (countiesandequivalentgid, railsgid),
ADD CONSTRAINT fkcountiesan397101 FOREIGN KEY (railsgid)
        REFERENCES "Spatial_US_Mapping"."Rails" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT fkcountiesan433969 FOREIGN KEY (countiesandequivalentgid)
        REFERENCES "Spatial_US_Mapping"."CountiesAndEquivalent" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
ALTER TABLE "Spatial_US_Mapping"."Maintenance_Users"
ADD CONSTRAINT "Maintenance_Users_pkey" PRIMARY KEY (maintenancemaintenance_id, usersuser_id),
ADD CONSTRAINT fkmaintenanc165085 FOREIGN KEY (maintenancemaintenance_id)
        REFERENCES "Spatial_US_Mapping"."Maintenance" (maintenance_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT fkmaintenanc670987 FOREIGN KEY (usersuser_id)
        REFERENCES "Spatial_US_Mapping"."Users" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
ALTER TABLE "Spatial_US_Mapping"."PrimaryRoads_UrbanAreas"
ADD CONSTRAINT "PrimaryRoads_UrbanAreas_pkey" PRIMARY KEY (primaryroadsgid, urbanareasgid),
ADD CONSTRAINT fkprimaryroa266493 FOREIGN KEY (urbanareasgid)
        REFERENCES "Spatial_US_Mapping"."UrbanAreas" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT fkprimaryroa412528 FOREIGN KEY (primaryroadsgid)
        REFERENCES "Spatial_US_Mapping"."PrimaryRoads" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
ALTER TABLE "Spatial_US_Mapping"."Rails_UrbanAreas"
ADD CONSTRAINT "Rails_UrbanAreas_pkey" PRIMARY KEY (railsgid, urbanareasgid),
ADD CONSTRAINT fkrails_urba694218 FOREIGN KEY (railsgid)
        REFERENCES "Spatial_US_Mapping"."Rails" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT fkrails_urba858222 FOREIGN KEY (urbanareasgid)
        REFERENCES "Spatial_US_Mapping"."UrbanAreas" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
ALTER TABLE "Spatial_US_Mapping"."US_State_Vehicle"
ADD CONSTRAINT "US_State_Vehicle_pkey" PRIMARY KEY (vehicle_id),
ADD CONSTRAINT is_signed_under FOREIGN KEY (countiesandequivalentgid)
        REFERENCES "Spatial_US_Mapping"."CountiesAndEquivalent" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
ADD CONSTRAINT is_signed_under1 FOREIGN KEY (urbanareasgid)
        REFERENCES "Spatial_US_Mapping"."UrbanAreas" (gid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

--SEQUENCES

-- SEQUENCE: Spatial_US_Mapping.CongressionalDistricts_gid_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."CongressionalDistricts_gid_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."CongressionalDistricts_gid_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "CongressionalDistricts".gid;

ALTER SEQUENCE "Spatial_US_Mapping"."CongressionalDistricts_gid_seq"
    OWNER TO postgres;
	
-- SEQUENCE: Spatial_US_Mapping.CountiesAndEquivalent_gid_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent_gid_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."CountiesAndEquivalent_gid_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "CountiesAndEquivalent".gid;

ALTER SEQUENCE "Spatial_US_Mapping"."CountiesAndEquivalent_gid_seq"
    OWNER TO postgres;

-- SEQUENCE: Spatial_US_Mapping.Maintenance_maintenance_id_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."Maintenance_maintenance_id_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."Maintenance_maintenance_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "Maintenance".maintenance_id;

ALTER SEQUENCE "Spatial_US_Mapping"."Maintenance_maintenance_id_seq"
    OWNER TO postgres;
-- SEQUENCE: Spatial_US_Mapping.PrimaryRoads_gid_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."PrimaryRoads_gid_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."PrimaryRoads_gid_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "PrimaryRoads".gid;

ALTER SEQUENCE "Spatial_US_Mapping"."PrimaryRoads_gid_seq"
    OWNER TO postgres;

-- SEQUENCE: Spatial_US_Mapping.Rails_gid_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."Rails_gid_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."Rails_gid_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "Rails".gid;

ALTER SEQUENCE "Spatial_US_Mapping"."Rails_gid_seq"
    OWNER TO postgres;

-- SEQUENCE: Spatial_US_Mapping.Traffic_Incidents_incident_id_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."Traffic_Incidents_incident_id_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."Traffic_Incidents_incident_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "Traffic_Incidents".incident_id;

ALTER SEQUENCE "Spatial_US_Mapping"."Traffic_Incidents_incident_id_seq"
    OWNER TO postgres;
	
-- SEQUENCE: Spatial_US_Mapping.US_State_Vehicle_vehicle_id_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."US_State_Vehicle_vehicle_id_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."US_State_Vehicle_vehicle_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "US_State_Vehicle".vehicle_id;

ALTER SEQUENCE "Spatial_US_Mapping"."US_State_Vehicle_vehicle_id_seq"
    OWNER TO postgres;

-- SEQUENCE: Spatial_US_Mapping.UrbanAreas_gid_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."UrbanAreas_gid_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."UrbanAreas_gid_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "UrbanAreas".gid;

ALTER SEQUENCE "Spatial_US_Mapping"."UrbanAreas_gid_seq"
    OWNER TO postgres;

-- SEQUENCE: Spatial_US_Mapping.Users_user_id_seq

-- DROP SEQUENCE IF EXISTS "Spatial_US_Mapping"."Users_user_id_seq";

CREATE SEQUENCE IF NOT EXISTS "Spatial_US_Mapping"."Users_user_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1
    OWNED BY "Users".user_id;

ALTER SEQUENCE "Spatial_US_Mapping"."Users_user_id_seq"
    OWNER TO postgres;
