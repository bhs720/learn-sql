-- drop active connections to "geo" database"
SELECT pg_terminate_backend(pid)
FROM   pg_stat_activity
WHERE  datname='geo';

DROP DATABASE IF EXISTS "geo";

CREATE DATABASE "geo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';

\connect "geo"
		
CREATE TABLE public.countries (
	id integer NOT NULL,
	"name" varchar(50) NOT NULL,
	iso3 varchar(3) NOT NULL,
	iso2 varchar(2) NOT NULL,
	numeric_code integer NULL,
	phone_code varchar(16) NULL,
	capital varchar(20) NULL,
	currency varchar(3) NULL,
	currency_symbol varchar(6) NULL,
	tld varchar(3) NULL,
	native varchar(50) NULL,
	region varchar(8) NULL,
	subregion varchar(25) NULL,
	timezones varchar(32767) NULL,
	latitude real NULL,
	longitude real NULL,
	emoji varchar(4) NULL,
	emojiu varchar(15) NULL,
	PRIMARY KEY (id)
);

COPY countries 
FROM '/home/bs_admin/learn-sql/db/geo/countries.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE public.states (
	id integer NOT NULL,
	"name" varchar(100) NOT NULL,
	country_id integer NOT NULL,
	country_code varchar(2) NOT NULL,
	state_code varchar(6) NOT NULL,
	latitude real NULL,
	longitude real NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES countries (id)
);

COPY states
FROM '/home/bs_admin/learn-sql/db/geo/states.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE public.cities (
	id integer NOT NULL,
	"name" varchar(100) NOT NULL,
	state_id integer NOT NULL,
	state_code varchar(6) NOT NULL,
	country_id integer NOT NULL,
	country_code varchar(2) NOT NULL,
	latitude real NULL,
	longitude real NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_state FOREIGN KEY (state_id) REFERENCES states (id),
	CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES countries (id)
);

COPY cities
FROM '/home/bs_admin/learn-sql/db/geo/cities.csv'
DELIMITER ','
CSV HEADER;

CREATE EXTENSION UNACCENT
