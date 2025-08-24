SELECT
    d.year,
    s.city,
    s.stationid,
    AVG(f.wastecollected) AS avg_waste_collected
FROM star_schema.facttrips f
JOIN star_schema.dimdate d ON f.dateid = d.dateid
JOIN star_schema.dimstation s ON f.stationid = s.stationid
GROUP BY CUBE (d.year, s.city, s.stationid);
