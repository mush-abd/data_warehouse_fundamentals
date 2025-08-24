CREATE TABLE star_schema.DimDate (
    dateid INT NOT NULL PRIMARY KEY,
    Date DATE, 
    Year INT, 
    Quarter INT, 
    Quartername VARCHAR(10),
    Month INT, 
    Monthname VARCHAR(10),
    Day INT,
    Weekday VARCHAR(10)
);


CREATE TABLE star_schema.DimTruck (
    TruckID INT NOT NULL PRIMARY KEY,
    TruckType VARCHAR(50)
);


CREATE TABLE star_schema.DimStation (
    StationID INT NOT NULL PRIMARY KEY,
    City VARCHAR(100)
);

CREATE TABLE star_schema.FactTrips (
    TripID INT NOT NULL PRIMARY KEY,
    DateID INT, 
    StationID INT, 
    TruckID INT,
    WasteCollected FLOAT,

    FOREIGN KEY (DateID) REFERENCES star_schema.DimDate(dateid),
    FOREIGN KEY (StationID) REFERENCES star_schema.DimStation(stationid),
    FOREIGN KEY (TruckID) REFERENCES star_schema.DimTruck(truckid)
);

-- Load the data manually using postgres GUI or psql
