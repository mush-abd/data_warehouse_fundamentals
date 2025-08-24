SELECT
    stationid,
    trucktype,
    SUM(wastecollected) AS total_waste_collected
FROM star_schema.facttrips f
JOIN star_schema.dimtruck t ON f.truckid = t.truckid
GROUP BY GROUPING SETS (
    (stationid, trucktype),
    (stationid),             
    (trucktype),             
    ()                       
);
