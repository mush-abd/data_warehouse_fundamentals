-- model the sales  data for a retail business
BEGIN;

create table my_schema."DimCountry"
(
    countryid INT NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    PRIMARY KEY (countryid)
)

create table my_schema."DimDate" 
(
    dateid int NOT NULL,
    day int,
    weekday int,
    weekdayname varchar(20),
    month int,
    monthname varchar(20),
    year int,
    quarter int, 
    quartername varchar(20),
    PRIMARY KEY (dateid)
)

create table my_schema."DimProduct"
(
    productid int NOT NULL,
    category varchar(100),
    subcategory varchar(100),
    productname varchar(100),
    PRIMARY KEY (productid)
)

create table my_schema."FactSales"
(
    rowid int NOT NULL,
    productid int NOT NULL,
    countryid int NOT NULL,
    dateid int NOT NULL,
    salesamount numeric(10,2) NOT NULL,
    PRIMARY KEY (rowid)
)

alter table my_schema."FactSales"
    add foreign key (productid)
    references my_schema."DimProduct" (productid)
    not valid;

alter table my_schema."FactSales"
    add foreign key (countryid)
    references my_schema."DimCountry" (countryid)
    not valid;

alter table my_schema."FactSales"
    add foreign key (dateid)
    references my_schema."DimDate" (dateid)
    not valid;

END;

