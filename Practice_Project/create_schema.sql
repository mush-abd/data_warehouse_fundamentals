-- to be used in postgres server


create database if not exists pracproj;
\c pracproj;


create schema if not exists SalesDW;

CREATE TABLE SalesDW.DimDate (
    Dateid INT PRIMARY KEY,
    date DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    QuarterName VARCHAR(2) NOT NULL,
    Month INT NOT NULL,
    Monthname VARCHAR(255) NOT NULL,
    Day INT NOT NULL,
    Weekday INT NOT NULL,
    WeekdayName VARCHAR(255) NOT NULL
);


CREATE TABLE SalesDW.DimProduct (
    Productid INT PRIMARY KEY,
    Producttype VARCHAR(255) NOT NULL
);


CREATE TABLE SalesDW.DimCustomerSegment (
    Segmentid INT PRIMARY KEY,
    City VARCHAR(255) NOT NULL
);

CREATE TABLE SalesDW.FactSales (
    Salesid VARCHAR(255) PRIMARY KEY,
    Dateid INT NOT NULL,
    Productid INT NOT NULL,
    Segmentid INT NOT NULL,
    Price_PerUnit DECIMAL(10, 2) NOT NULL,
    QuantitySold INT NOT NULL,
    FOREIGN KEY (Dateid) REFERENCES SalesDW.DimDate(Dateid),
    FOREIGN KEY (Productid) REFERENCES SalesDW.DimProduct(Productid),
    FOREIGN KEY (Segmentid) REFERENCES SalesDW.DimCustomerSegment(Segmentid)
);

-- load the data manually by using the import/export command in pgadmin

