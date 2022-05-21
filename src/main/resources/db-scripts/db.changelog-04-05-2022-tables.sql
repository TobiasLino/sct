--liquibase formatted sql

--changeset: tslino:101
--comment: Create table sct.sct_user
CREATE TABLE sct.sct_user (
                              id_user         NUMERIC(10) NOT NULL,
                              name            VARCHAR(200) NOT NULL,
                              email           VARCHAR(200) NOT NULL,
                              passwd          VARCHAR(256),
                              provider        VARCHAR(20) NOT NULL,
                              user_type       VARCHAR(40) NOT NULL,
                              cpf             VARCHAR(11),
                              cnh             VARCHAR(11)
);

--changeset: tslino:102
--comment: add primary key sct.sct_user
ALTER TABLE sct.sct_user ADD CONSTRAINT pk_sct_user PRIMARY KEY (id_user);

--changeset: tslino:103
--comment: create sequence sct.sct_sq_user
CREATE SEQUENCE sct.sct_sq_user MINVALUE 1 MAXVALUE 999999999999999999 START WITH 1 INCREMENT BY 1;

--changeset: tslino:104
--comment: create table sct.sct_permission
CREATE TABLE sct.sct_permission (
                                    id_permission   NUMERIC(10) NOT NULL,
                                    name            VARCHAR(30) NOT NULL
);

--changeset: tslino:105
--comment: create primary key sct.sct_permission
ALTER TABLE sct.sct_permission ADD CONSTRAINT pk_sct_permission PRIMARY KEY (id_permission);

--changeset: tslino:106
--comment: create sequence sct.sct_sq_permission
CREATE SEQUENCE sct.sct_sq_permission MINVALUE 1 MAXVALUE 999999999999999999 START WITH 1 INCREMENT BY 1;

--changeset: tslino:107
--comment: create table sct.sct_user_permission
CREATE TABLE sct.sct_user_permission (
                             id_user         NUMERIC(10) NOT NULL,
                             id_permission   NUMERIC(10) NOT NULL
);

--changeset: tslino:108
--comment: create foreign key sct.sct_permission to sct.sct_user
ALTER TABLE sct.sct_user_permission ADD CONSTRAINT fk_user_permission_user FOREIGN KEY (id_user) REFERENCES sct.sct_user(id_user);

--changeset: tslino:109
--comment: create foreign key sct.sct_permission to sct.sct_permission
ALTER TABLE sct.sct_user_permission ADD CONSTRAINT fk_user_permission_permission FOREIGN KEY (id_permission) REFERENCES sct.sct_permission(id_permission);

--changeset: tslino:110
--comment: create table sct.sct_supplier
CREATE TABLE sct.sct_supplier (
                                  id_supplier     NUMERIC(10) NOT NULL,
                                  name            VARCHAR(200) NOT NULL,
                                  cnpj            VARCHAR(14) NOT NULL,
                                  email           VARCHAR(200)
);

--changeset: tslino:111
--comment: create primary key for sct.sct_supplier
ALTER TABLE sct.sct_supplier ADD CONSTRAINT pk_sct_supplier PRIMARY KEY (id_supplier);

--changeset: tslino:112
--comment: create sequence sct.sct_sq_supplier
CREATE SEQUENCE sct.sct_sq_supplier MINVALUE 1 MAXVALUE 999999999999999999 START WITH 1 INCREMENT BY 1;

--changeset: tslino:113
--comment: create column for supplier in sct_user
ALTER TABLE sct.sct_user ADD id_supplier NUMERIC(10);

--changeset: tslino:114
--comment: create foreign key for sct.sct_supplier_user to sct.sct_supplier
ALTER TABLE sct.sct_user ADD CONSTRAINT fk_sct_user_supplier FOREIGN KEY (id_supplier) REFERENCES sct.sct_supplier(id_supplier);


--changeset: tslino:116
--comment: create table sct.sct_vehicle
CREATE TABLE sct.sct_vehicle (
                                 id_vehicle      NUMERIC(10) NOT NULL,
                                 id_driver       NUMERIC(10) NOT NULL,
                                 license_plate   VARCHAR(7) NOT NULL,
                                 name            VARCHAR(100) NOT NULL,
                                 year            NUMERIC(4)
);

--changeset: tslino:117
--comment: create sequence sct.sct_sq_vehicle
CREATE SEQUENCE sct.sct_sq_vehicle MINVALUE 1 MAXVALUE 999999999999999999 START WITH 1 INCREMENT BY 1;

--changeset: tslino:118
--comment: create primary key for sct.sct_supplier_user
ALTER TABLE sct.sct_vehicle ADD CONSTRAINT pk_sct_vehicle FOREIGN KEY (id_vehicle) REFERENCES sct.sct_vehicle(id_vehicle);

--changeset: tslino:119
--comment: create foreign key for sct.sct_vehicle to sct.sct_user as driver
ALTER TABLE sct.sct_vehicle ADD CONSTRAINT fk_scp_vehicle_driver FOREIGN KEY (id_driver) REFERENCES sct.sct_user(id_user);

--changeset: tslino:120
--comment: create table sct.sct_trip
CREATE TABLE sct.sct_trip (
                              id_trip                     NUMERIC(10) NOT NULL,
                              id_requester                NUMERIC(10) NOT NULL,
                              id_vehicle                  NUMERIC(10) NOT NULL,
                              request_time                TIMESTAMP WITHOUT TIME ZONE,
                              trip_start_time             TIMESTAMP WITHOUT TIME ZONE,
                              estimated_trip_end_time     TIMESTAMP WITHOUT TIME ZONE,
                              real_trip_end_time          TIMESTAMP WITHOUT TIME ZONE,
                              price                       NUMERIC(10,2) NOT NULL
);

--changeset: tslino:121
--comment: create sequence sct.sct_sq_trip
CREATE SEQUENCE sct.sct_sq_trip MINVALUE 1 MAXVALUE 999999999999999999 START WITH 1 INCREMENT BY 1;

--changeset: tslino:122
--comment: create foreign key for sct.sct_supplier_user to sct.sct_supplier
ALTER TABLE sct.sct_trip ADD CONSTRAINT pk_sct_trip PRIMARY KEY (id_trip);

--changeset: tslino:123
--comment: create foreign key for sct.sct_trip to sct.sct_user as requester
ALTER TABLE sct.sct_trip ADD CONSTRAINT fk_sct_trip_requester FOREIGN KEY (id_requester) REFERENCES sct.sct_user(id_user);

--changeset: tslino:124
--comment: create foreign key for sct.sct_trip to sct.sct_vehicle
ALTER TABLE sct.sct_trip ADD CONSTRAINT fk_sct_trip_vehicle FOREIGN KEY (id_vehicle) REFERENCES sct.sct_vehicle(id_vehicle);

--changeset: tslino:125
--comment: create table sct.sct_location
CREATE TABLE sct.sct_location (
                                  id_location         NUMERIC(10) NOT NULL,
                                  state               VARCHAR(100) NOT NULL,
                                  city                VARCHAR(100) NOT NULL,
                                  neighborhood        VARCHAR(100) NOT NULL,
                                  street              VARCHAR(256) NOT NULL,
                                  number              VARCHAR(10) NOT NULL,
                                  name                VARCHAR(256) NOT NULL,
                                  complement          VARCHAR(256) NOT NULL
);

--changeset: tslino:126
--comment: create sequence sct.sct_sq_location
CREATE SEQUENCE sct.sct_sq_location MINVALUE 1 MAXVALUE 999999999999999999 START WITH 1 INCREMENT BY 1;

--changeset: tslino:127
--comment: create column for sct.sct_trip as origin
ALTER TABLE sct.sct_trip ADD origin NUMERIC(10);

--changeset: tslino:128
--comment: create column for sct.sct_trip as destination
ALTER TABLE sct.sct_trip ADD destination NUMERIC(10);

--changeset: tslino:129
--comment: create column for sct.sct_trip as distance
ALTER TABLE sct.sct_trip ADD distance NUMERIC(10, 2);

--changeset: tslino:130
--comment: create table sct.sct_price_metric
CREATE TABLE sct.sct_price_metric (
      id_price_metric         NUMERIC(10) NOT NULL,
      base_price              NUMERIC(10,2) NOT NULL,
      distance_price          NUMERIC(10,2) NOT NULL,
      minute_price            NUMERIC(10,2) NOT NULL,
      is_valid                INTEGER,
      created_date            TIMESTAMP WITHOUT TIME ZONE
);

--changeset: tslino:131
--comment: create sequence sct.sct_sq_price_metric
CREATE SEQUENCE sct.sct_sq_price_metric MINVALUE 1 MAXVALUE 999999999999999999 START WITH 1 INCREMENT BY 1;

--changeset: tslino:132
--comment: create primary key for sct.sct_price_metric
ALTER TABLE sct.sct_price_metric ADD CONSTRAINT pk_sct_price_metric PRIMARY KEY (id_price_metric);

--changeset: tslino:133
--comment: create check for sct.sct_price_metric
ALTER TABLE sct.sct_price_metric ADD CONSTRAINT ck_sct_price_metric_valid CHECK (is_valid in (0, 1));

--changeset: tslino:134
--comment: create unique for sct.sct_user
ALTER TABLE sct.sct_user ADD CONSTRAINT uk_sct_user UNIQUE (email, passwd);