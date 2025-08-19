-- implemented in postgresql
-- first download the data and store in a staging area
-- use terminal for this
-- curl https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Setting%20up%20a%20staging%20area/billing-datawarehouse.tgz --output billing-datawarehouse.tgz
-- decompress
-- tar -xvzf billing-datawarehouse.tgz
-- verify
-- ls *.sql
-- 
-- we now have some source sql file
-- we have the following files:
-- star-schema.sql
-- DimCustomer.sql
-- DimMonth.sql
-- FactBilling.sql
--Open postgresql, create a new database and create the tables using the following commands

CREATE DATABASE billing;



CREATE TABLE public."FactBilling"
(
    rowid integer NOT NULL,
    customerid integer NOT NULL,
    monthid integer NOT NULL,
    billedamount integer NOT NULL,
    PRIMARY KEY (rowid)
);

CREATE TABLE public."DimMonth"
(
    monthid integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    monthname "char" NOT NULL,
    quarter integer NOT NULL,
    quartername "char" NOT NULL,
    PRIMARY KEY (monthid)
);

CREATE TABLE public."DimCustomer"
(
    customerid integer NOT NULL,
    category "char" NOT NULL,
    country "char" NOT NULL,
    industry "char" NOT NULL,
    PRIMARY KEY (customerid)
);

ALTER TABLE public."FactBilling"
    ADD FOREIGN KEY (customerid)
    REFERENCES public."DimCustomer" (customerid)
    NOT VALID;


ALTER TABLE public."FactBilling"
    ADD FOREIGN KEY (monthid)
    REFERENCES public."DimMonth" (monthid)
    NOT VALID;

END;

-- populate the tables

\i star-schema.sql
\i DimCustomer.sql
\i DimMonth.sql
\i FactBilling.sql
